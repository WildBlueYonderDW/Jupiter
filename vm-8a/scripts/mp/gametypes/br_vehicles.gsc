#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\flags.gsc;
#using script_67fb1233e876ed8;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\poi.gsc;
#using script_48814951e916af89;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_439d01e25d19543b;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_58f20490049af6ac;

#namespace br_vehicles;

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e
// Size: 0x2cb
function brvehiclesinit() {
    level.modecontrolledvehiclespawningonly = 1;
    var_6fc423af9a153f6b = getdvarint(@"hash_bb06b4f8c704366b", 1);
    vehiclesbuffer = getdvarint(@"hash_2d93bd0eac4c5e38", 24);
    level.br_totalvehiclesmax = 128 - vehiclesbuffer;
    level.br_totalvehiclesspawned = 0;
    level.br_helosmax = getdvarint(@"hash_389f02283326428e", 3);
    level._effect["vehicle_flares"] = loadfx("vfx/iw8_mp/killstreak/vfx_apache_angel_flares.vfx");
    level.br_vehtargetnametoref = [];
    level.br_vehtargetnametoref["atv_spawn"] = "atv";
    level.br_vehtargetnametoref["littlebird_spawn"] = "little_bird";
    level.br_vehtargetnametoref["tacrover_spawn"] = "tac_rover";
    level.br_vehtargetnametoref["jltv_spawn"] = "veh9_jltv";
    level.br_vehtargetnametoref["sedan_hatchback_1985_spawn"] = "veh9_sedan_hatchback_1985";
    level.br_vehtargetnametoref["suv_1996_spawn"] = "veh9_suv_1996";
    level.br_vehtargetnametoref["mil_cargo_truck_spawn"] = "veh9_mil_cargo_truck";
    level.br_vehtargetnametoref["hummer_spawn"] = "veh9_hummer";
    level.br_vehtargetnametoref["overland_2016_spawn"] = "veh9_overland_2016";
    level.br_vehtargetnametoref["utv_spawn"] = "veh9_utv";
    level.br_vehtargetnametoref["acv_6x6_spawn"] = "veh9_acv_6x6";
    level.br_vehtargetnametoref["pwc_spawn"] = "veh9_pwc";
    level.br_vehtargetnametoref["civ_lnd_dirt_bike_spawn"] = "veh9_civ_lnd_dirt_bike";
    level.br_vehtargetnametoref["research_vessel_spawn"] = "veh_jup_research_vessel";
    level.br_vehtargetnametoref["jup_orav_spawn"] = "veh_jup_orav";
    level.br_vehtargetnametoref["jup_razorback_spawn"] = "veh_jup_razorback";
    level.br_vehtargetnametoref["techo_rebel_spawn"] = "veh9_techo_rebel_armor";
    function_ebf775f8fdd1d098();
    if (istrue(var_6fc423af9a153f6b)) {
        level.br_vehtargetnametoref["rhib_spawn"] = "veh9_rhib";
        level.br_vehtargetnametoref["patrol_boat_spawn"] = "veh9_patrol_boat";
    }
    if (scripts\mp\utility\game::getsubgametype() != "dmz") {
        if (getdvarint(@"hash_81e631c248118cd6", 1) != 1) {
            level.br_vehtargetnametoref["palfa_spawn"] = "veh9_palfa";
        }
        level.br_vehtargetnametoref["jltv_mg_spawn"] = "veh9_jltv_mg";
    }
    scripts\mp\gametypes\br_circle::function_eca79fa0f341ee08(1, &dangercircletick, &function_1a1709943670772a);
    level thread function_10bd49da0d1d0e99();
    function_c3fe673ce43bb311("little_bird", 5.5);
    function_c3fe673ce43bb311("veh9_palfa", 4.5);
    /#
        level thread mychangeswatcher();
    #/
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x931
// Size: 0x71
function function_ec5f666d56372630(vehicleref) {
    if (!getdvarint(@"hash_89be1a979c1ec008", 0)) {
        return false;
    }
    if (!array_contains(level.br_vehtargetnametoref, vehicleref)) {
        return false;
    }
    if (getdvarint(@"hash_befa7ffc4484488a", 0)) {
        return true;
    }
    dvar = hashcat(@"hash_ea224dc24c0b7e07", vehicleref);
    if (!getdvarint(dvar, 0)) {
        return false;
    }
    return true;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ab
// Size: 0x14b
function function_10bd49da0d1d0e99() {
    level endon("game_ended");
    scripts\mp\flags::function_1240434f4201ac9d("POIs_initialized");
    vehiclerefs = ["atv", "little_bird", "tac_rover", "veh9_jltv", "veh9_sedan_hatchback_1985", "veh9_suv_1996", "veh9_mil_cargo_truck", "veh9_hummer", "veh9_overland_2016", "veh9_utv", "veh9_acv_6x6", "veh9_pwc", "veh9_rhib", "veh9_patrol_boat", "veh9_palfa", "veh9_jltv_mg", "veh_jup_razorback", "veh_jup_orav", "veh_jup_research_vessel", "veh9_techo_rebel_armor"];
    foreach (vehicleref in vehiclerefs) {
        if (function_ec5f666d56372630(vehicleref)) {
            namespace_7052decdced06e44::function_4f7660cfd85cd517(vehicleref, &function_5a6b4f3358f3e3cc);
            namespace_7052decdced06e44::function_412f527ef0863f0e(vehicleref, &function_cb75d1e034823cb5);
            namespace_7052decdced06e44::function_eded5b87f8f7bdfd(vehicleref, &function_fb0db2fc84df7793);
        }
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe
// Size: 0x2f
function brvehiclesonstartgametype() {
    /#
        if (getdvarint(@"hash_6cce831ff331c183", 0)) {
            level thread function_1c7a4c53fa428606();
            return;
        }
    #/
    setupvehiclespawnvolumes();
    brvehiclesreset();
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb35
// Size: 0x4a9
function setupvehiclespawnvolumes() {
    volume_sets = "vehicle_volume";
    if (getdvarint(@"hash_2cbc9c033fdea714", 1)) {
        volume_sets = "vehicle_volume_simplified";
    }
    level.brvehspawnvols = getentarray(volume_sets, "script_noteworthy");
    foreach (vol in level.brvehspawnvols) {
        initvehiclespawnvolume(vol);
    }
    level.br_vehicleallspawns = [];
    level.br_vehiclealwaysspawns = [];
    level.br_helospawns = [];
    level.var_b54c13ad1bd00973 = [];
    var_7164111ed75798cc = vehicle_spawn_getleveldata();
    foreach (refname in level.br_vehtargetnametoref) {
        var_7a2113183150c910 = function_b08e7e3a0b14f76f(refname);
        if (isdefined(level.filtervehiclespawnstructsfunc)) {
            var_7a2113183150c910 = [[ level.filtervehiclespawnstructsfunc ]](var_7a2113183150c910);
        }
        if (isdefined(level.var_20b5ab3069c073e2)) {
            var_7a2113183150c910 = [[ level.var_20b5ab3069c073e2 ]](refname, var_7a2113183150c910);
        }
        level.var_b54c13ad1bd00973[refname] = var_7a2113183150c910;
        level.br_vehicleallspawns = array_combine_unique(level.br_vehicleallspawns, var_7a2113183150c910);
        foreach (spawnpoint in var_7a2113183150c910) {
            /#
                if (getdvarint(@"hash_6cce831ff331c183", 0) > 0) {
                    function_d96e7d92cdd79f9e(spawnpoint);
                }
            #/
            if (isdefined(spawnpoint.script_priority) && spawnpoint.script_priority > 0) {
                arraysize = level.br_vehiclealwaysspawns.size;
                level.br_vehiclealwaysspawns[arraysize] = spawnpoint;
                continue;
            }
            if (isdefined(spawnpoint.targetname) && spawnpoint.targetname == "littlebird_spawn") {
                level.br_helospawns[level.br_helospawns.size] = spawnpoint;
                continue;
            }
            foreach (vol in level.brvehspawnvols) {
                if (ispointinvolume(spawnpoint.origin, vol)) {
                    arraysize = vol.vehiclespawns.size;
                    vol.vehiclespawns[arraysize] = spawnpoint;
                    break;
                }
            }
        }
    }
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<dev string:x1c>" + level.br_vehicleallspawns.size);
            var_7164111ed75798cc = vehicle_spawn_getleveldata();
            println("<dev string:x4a>" + level.br_vehiclealwaysspawns.size + "<dev string:x65>");
            foreach (spawnpoint in level.br_vehiclealwaysspawns) {
                refname = level.br_vehtargetnametoref[spawnpoint.targetname];
                println("<dev string:x80>" + refname + "<dev string:x84>" + spawnpoint.origin);
            }
            totalspawnpoints = 0;
            var_9ee3f0d2d796f396 = 0;
            foreach (vol in level.brvehspawnvols) {
                println("<dev string:x89>" + vol.targetname);
                numspawnpoints = vol.vehiclespawns.size;
                minreq = vol.minvehicles;
                if (numspawnpoints > 0 || minreq > 0) {
                    println("<dev string:xab>" + numspawnpoints + "<dev string:xb1>" + minreq);
                }
                totalspawnpoints += numspawnpoints;
                var_9ee3f0d2d796f396 += minreq;
            }
            println("<dev string:xd2>" + totalspawnpoints);
            println("<dev string:xef>" + var_9ee3f0d2d796f396);
        }
    #/
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe6
// Size: 0x2d
function initvehiclespawnvolume(vol) {
    vol.vehiclespawns = [];
    vol.vehiclesspawned = 0;
    assignvehicleminimumsforvolume(vol);
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101b
// Size: 0x283
function assignvehicleminimumsforvolume(vol) {
    assert(isdefined(vol.targetname));
    vol.minvehicles = 0;
    switch (vol.targetname) {
    case #"hash_3c20c20dc3935d6f": 
        vol.minvehicles = 2;
        break;
    case #"hash_f48a166c03bb39c1": 
        vol.minvehicles = 2;
        break;
    case #"hash_2c5efc9850d0cbb5": 
        vol.minvehicles = 4;
        break;
    case #"hash_6058392aebff0469": 
        vol.minvehicles = 1;
        break;
    case #"hash_9c5e8152de8ef99": 
        vol.minvehicles = 4;
        break;
    case #"hash_663b0900ff0e81c7": 
        vol.minvehicles = 1;
        break;
    case #"hash_959ab3efc8aa213": 
        vol.minvehicles = 0;
        break;
    case #"hash_2e0fe9d434d05e53": 
        vol.minvehicles = 1;
        break;
    case #"hash_209449a3db12c20f": 
        vol.minvehicles = 3;
        break;
    case #"hash_da04b46361bbb6a6": 
        vol.minvehicles = 2;
        break;
    case #"hash_37e94b17102ea1b": 
        vol.minvehicles = 3;
        break;
    case #"hash_5f22fd847b75bb06": 
        vol.minvehicles = 2;
        break;
    case #"hash_b445759ac0026f01": 
        vol.minvehicles = 2;
        break;
    case #"hash_a86d6bdba8e7b140": 
        vol.minvehicles = 1;
        break;
    case #"hash_118da067c85a311d": 
        vol.minvehicles = 1;
        break;
    case #"hash_e534fd8ec73eafb4": 
        vol.minvehicles = 1;
        break;
    case #"hash_426f768afb41bbcd": 
        vol.minvehicles = 1;
        break;
    case #"hash_2094a957c0515134": 
        vol.minvehicles = 2;
        break;
    case #"hash_c0087eafd38b4fed": 
        vol.minvehicles = 1;
        break;
    case #"hash_f18542c5ad2a1020": 
        vol.minvehicles = 1;
        break;
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a6
// Size: 0xd7
function emptyallvehicles() {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances)) {
        return;
    }
    foreach (var_e5cd5ce5ee8dc6c9 in level.vehicle.instances) {
        foreach (vehicle in var_e5cd5ce5ee8dc6c9) {
            if (scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_instanceisregistered(vehicle)) {
                vehicle_occupancy_ejectalloccupants(vehicle);
            }
        }
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1385
// Size: 0xec
function deleteextantvehicles() {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances)) {
        return;
    }
    scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_cancelpendingrespawns();
    foreach (var_e5cd5ce5ee8dc6c9 in level.vehicle.instances) {
        foreach (vehicle in var_e5cd5ce5ee8dc6c9) {
            scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_preventrespawn(vehicle);
            vehicle.var_a8f4bb03b366aa80 = 1;
            level thread scripts\cp_mp\vehicles\vehicle::vehicle_death(vehicle);
        }
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1479
// Size: 0x166
function tryspawnavehicle(refname, locstruct, volname, faildata) {
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("vehicleSpawns")) {
        return;
    }
    if ((refname == "little_bird" || refname == "little_bird_mg") && scripts\mp\gametypes\br_gametypes::isfeaturedisabled("littleBirdSpawns")) {
        return;
    }
    if (refname == "veh9_overland_2016" && distancesquared(locstruct.origin, (19290, -23687, 1123)) < 250000) {
        return;
    }
    if (refname == "atv" && distancesquared(locstruct.origin, (-19928, -48860, 207)) < 250000) {
        return;
    }
    if (refname == "veh9_pwc" && distancesquared(locstruct.origin, (-7168, 29580, 120)) < 250000) {
        return;
    }
    if (!scripts\mp\gametypes\br_gametypes::isfeatureenabled("gasVehicleSpawns")) {
        if (!scripts\mp\gametypes\br_circle::ispointwithininitialdangercircle(locstruct.origin)) {
            return;
        }
    }
    if (vehicle_spawn_canspawnvehicle(refname)) {
        newvehicle = spawnavehicle(refname, locstruct, faildata);
        if (isdefined(newvehicle)) {
            println("<dev string:x10f>" + refname + "<dev string:x127>" + volname + "<dev string:x84>" + locstruct.origin + "<dev string:x133>");
            return newvehicle;
        }
    }
    return undefined;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e8
// Size: 0xb9
function spawnavehicle(refname, locstruct, faildata) {
    spawnorigin = locstruct.origin;
    spawnangles = locstruct.angles;
    if (!isdefined(spawnangles)) {
        spawnangles = (0, randomfloat(360), 0);
    }
    spawndata = spawnstruct();
    spawndata.origin = spawnorigin;
    spawndata.angles = spawnangles;
    spawndata.spawntype = "GAME_MODE";
    newvehicle = scripts\cp_mp\vehicles\vehicle::vehicle_spawn(refname, spawndata, faildata);
    if (isdefined(newvehicle)) {
        scripts\mp\gametypes\br_analytics::branalytics_vehiclespawned(newvehicle, refname);
    }
    return newvehicle;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16aa
// Size: 0x11d6
function spawninitialvehicles() {
    var_7164111ed75798cc = vehicle_spawn_getleveldata();
    /#
        if (getdvarint(@"hash_6cce831ff331c183", 0)) {
            return;
        }
    #/
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<dev string:x135>");
            println("<dev string:x14b>");
        }
    #/
    var_96eb15d5230a7b6e = 0;
    usedspawns = [];
    unusedspawns = level.br_vehicleallspawns;
    /#
        level.var_f44c6f8a04520f44 = [];
        level.var_991ab87ce5e247eb = [];
    #/
    var_d23016d6d9981605 = array_randomize(level.br_vehiclealwaysspawns);
    foreach (spawnpoint in var_d23016d6d9981605) {
        faildata = spawnstruct();
        refname = level.br_vehtargetnametoref[spawnpoint.targetname];
        if (function_ec5f666d56372630(refname)) {
            continue;
        }
        newvehicle = tryspawnavehicle(refname, spawnpoint, "alwaysSpawn", faildata);
        if (isdefined(newvehicle)) {
            level.br_totalvehiclesspawned++;
            usedspawns[usedspawns.size] = spawnpoint;
            /#
                if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                    line(newvehicle.origin, newvehicle.origin + (0, 0, 4096), (0, 1, 0), 1, 1, 20000);
                    if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                        level.var_991ab87ce5e247eb[refname]++;
                    } else {
                        level.var_991ab87ce5e247eb[refname] = 1;
                    }
                    println("<dev string:x80>" + refname + "<dev string:x167>" + newvehicle.origin);
                }
            #/
            var_1d035a86ea1b5e63 = 0;
            foreach (vol in level.brvehspawnvols) {
                if (ispointinvolume(spawnpoint.origin, vol)) {
                    vol.vehiclesspawned++;
                    var_1d035a86ea1b5e63 = 1;
                    break;
                }
            }
            if (!var_1d035a86ea1b5e63) {
                /#
                    if (isdefined(level.var_f44c6f8a04520f44[refname])) {
                        level.var_f44c6f8a04520f44[refname]++;
                    } else {
                        level.var_f44c6f8a04520f44[refname] = 1;
                    }
                #/
            }
            if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                break;
            }
            waitframe();
            continue;
        }
        var_96eb15d5230a7b6e++;
    }
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            foreach (vol in level.brvehspawnvols) {
                println("<dev string:x175>" + vol.targetname);
            }
            println("<dev string:x19e>");
            foreach (refname, data in var_7164111ed75798cc.databyref) {
                if (isdefined(level.var_f44c6f8a04520f44[refname]) && level.var_f44c6f8a04520f44[refname] > 0) {
                    println("<dev string:x80>" + refname + "<dev string:x1ca>" + level.var_f44c6f8a04520f44[refname] + "<dev string:x1cd>");
                }
            }
            println("<dev string:x1ea>" + var_96eb15d5230a7b6e);
        }
    #/
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<dev string:x213>");
        }
    #/
    var_82e084d0cb9a7f40 = 0;
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax) {
        var_60c2c2b7cea6e920 = array_randomize(level.brvehspawnvols);
        foreach (vol in var_60c2c2b7cea6e920) {
            println("<dev string:x22c>" + vol.targetname + "<dev string:x260>" + vol.minvehicles + "<dev string:x263>");
            var_b243344e26fc2116 = vol.minvehicles;
            if (isdefined(var_b243344e26fc2116) && var_b243344e26fc2116 > 0) {
                /#
                    if (var_b243344e26fc2116 > vol.vehiclespawns.size) {
                        println("<dev string:x265>" + vol.targetname + "<dev string:x289>" + var_b243344e26fc2116 + "<dev string:x291>" + vol.vehiclespawns.size + "<dev string:x2a7>");
                    }
                #/
                if (vol.vehiclesspawned < var_b243344e26fc2116 && vol.vehiclespawns.size > 0) {
                    randomSpawns = array_remove_array(array_randomize(vol.vehiclespawns), usedspawns);
                    for (spawnindex = 0; vol.vehiclesspawned < var_b243344e26fc2116 && spawnindex < randomSpawns.size; spawnindex++) {
                        faildata = spawnstruct();
                        spawnpoint = randomSpawns[spawnindex];
                        refname = level.br_vehtargetnametoref[spawnpoint.targetname];
                        if (function_ec5f666d56372630(refname)) {
                            continue;
                        }
                        newvehicle = tryspawnavehicle(refname, spawnpoint, vol.targetname, faildata);
                        if (!isdefined(newvehicle)) {
                            var_82e084d0cb9a7f40++;
                            println("<dev string:x2a9>" + vol.targetname + "<dev string:x2c6>" + spawnpoint.origin + "<dev string:x263>");
                            continue;
                        }
                        level.br_totalvehiclesspawned++;
                        usedspawns[usedspawns.size] = spawnpoint;
                        vol.vehiclesspawned++;
                        /#
                            if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                                line(newvehicle.origin, newvehicle.origin + (0, 0, 4096), (0, 1, 1), 1, 1, 20000);
                                if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                                    level.var_991ab87ce5e247eb[refname]++;
                                } else {
                                    level.var_991ab87ce5e247eb[refname] = 1;
                                }
                                println("<dev string:x80>" + refname + "<dev string:x167>" + newvehicle.origin);
                            }
                        #/
                        if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                            break;
                        }
                        waitframe();
                    }
                    if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                        break;
                    }
                }
            }
        }
    }
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<dev string:x2de>");
        }
    #/
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax) {
        var_56b381327050bc62 = 0;
        var_5c969801281b9666 = array_remove_array(array_randomize(level.br_helospawns), usedspawns);
        foreach (spawnpoint in var_5c969801281b9666) {
            faildata = spawnstruct();
            refname = level.br_vehtargetnametoref[spawnpoint.targetname];
            if (function_ec5f666d56372630(refname)) {
                continue;
            }
            newvehicle = tryspawnavehicle(refname, spawnpoint, "heloSpawn", faildata);
            if (isdefined(newvehicle)) {
                level.br_totalvehiclesspawned++;
                usedspawns[usedspawns.size] = spawnpoint;
                /#
                    if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                        line(newvehicle.origin, newvehicle.origin + (0, 0, 4096), (1, 1, 1), 1, 1, 20000);
                        if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                            level.var_991ab87ce5e247eb[refname]++;
                        } else {
                            level.var_991ab87ce5e247eb[refname] = 1;
                        }
                        println("<dev string:x80>" + refname + "<dev string:x167>" + newvehicle.origin);
                    }
                #/
                var_56b381327050bc62++;
                if (var_56b381327050bc62 >= level.br_helosmax) {
                    break;
                }
                if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                    break;
                }
                waitframe();
            }
        }
        /#
            if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                println("<dev string:x2f4>" + var_56b381327050bc62 + "<dev string:x2fd>");
            }
        #/
    }
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax && scripts\mp\poi::function_47d356083884f913()) {
        function_9856ad860555f8b9();
        unusedspawns = array_remove_array(unusedspawns, usedspawns);
        foreach (refname, spawns in level.var_b54c13ad1bd00973) {
            if (!isdefined(level.var_a5791492570c75fc) || !isdefined(level.var_a5791492570c75fc[refname])) {
                continue;
            }
            if (function_ec5f666d56372630(refname)) {
                continue;
            }
            spawns = array_randomize(spawns);
            for (i = 0; i < level.var_a5791492570c75fc[refname]; i++) {
                spawnpoint = spawns[i];
                if (!isdefined(spawnpoint)) {
                    break;
                }
                newvehicle = tryspawnavehicle(refname, spawnpoint, "globalMinSpawns", spawnstruct());
                if (!isdefined(newvehicle)) {
                    continue;
                }
                level.br_totalvehiclesspawned++;
                usedspawns[usedspawns.size] = spawnpoint;
                /#
                    if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                        line(newvehicle.origin, newvehicle.origin + (0, 0, 4096), (0, 1, 1), 1, 1, 20000);
                        if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                            level.var_991ab87ce5e247eb[refname]++;
                        } else {
                            level.var_991ab87ce5e247eb[refname] = 1;
                        }
                        println("<dev string:x80>" + refname + "<dev string:x167>" + newvehicle.origin);
                    }
                #/
                if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                    break;
                }
                waitframe();
            }
        }
        unusedspawns = array_remove_array(unusedspawns, usedspawns);
        foreach (spawn in unusedspawns) {
            poi = scripts\mp\poi::function_6cc445c02b5effac(spawn.origin);
            subarea = namespace_bfef6903bca5845d::function_a44e168e8cced18(spawn.origin, poi);
            if (isdefined(subarea)) {
                if (!isdefined(subarea.vehiclespawnpoints)) {
                    subarea.vehiclespawnpoints = [];
                }
                subarea.vehiclespawnpoints[subarea.vehiclespawnpoints.size] = spawn;
            }
        }
        foreach (poi in level.poi) {
            foreach (subarea in poi["subAreas"]) {
                if (!isdefined(subarea.minvehicles) || subarea.minvehicles <= 0 || !isdefined(subarea.vehiclespawnpoints) || subarea.vehiclespawnpoints.size == 0) {
                    subarea.vehiclespawnpoints = undefined;
                    continue;
                }
                spawns = array_randomize(subarea.vehiclespawnpoints);
                for (i = 0; subarea.spawnedvehicles < subarea.minvehicles && i < spawns.size; i++) {
                    spawnpoint = spawns[i];
                    faildata = spawnstruct();
                    refname = level.br_vehtargetnametoref[spawnpoint.targetname];
                    if (function_ec5f666d56372630(refname)) {
                        i++;
                        continue;
                    }
                    newvehicle = tryspawnavehicle(refname, spawnpoint, "subAreaSpawns", faildata);
                    if (isdefined(newvehicle)) {
                        level.br_totalvehiclesspawned++;
                        usedspawns[usedspawns.size] = spawnpoint;
                        subarea.spawnedvehicles++;
                        /#
                            if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                                line(newvehicle.origin, newvehicle.origin + (0, 0, 4096), (0, 1, 1), 1, 1, 20000);
                                if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                                    level.var_991ab87ce5e247eb[refname]++;
                                } else {
                                    level.var_991ab87ce5e247eb[refname] = 1;
                                }
                                println("<dev string:x80>" + refname + "<dev string:x167>" + newvehicle.origin);
                            }
                        #/
                        if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                            break;
                        }
                        waitframe();
                    }
                }
                subarea.vehiclespawnpoints = undefined;
                if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                    break;
                }
            }
            if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                break;
            }
        }
    }
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<dev string:x304>");
        }
    #/
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax) {
        randomSpawns = 0;
        unusedspawns = array_remove_array(unusedspawns, usedspawns);
        unusedspawns = array_randomize(unusedspawns);
        foreach (spawnpoint in unusedspawns) {
            refname = level.br_vehtargetnametoref[spawnpoint.targetname];
            if (!isdefined(refname)) {
                continue;
            }
            if (function_ec5f666d56372630(refname)) {
                continue;
            }
            while (!scripts\cp_mp\vehicles\vehicle_tracking::canspawnvehicle()) {
                wait 1;
            }
            faildata = spawnstruct();
            newvehicle = tryspawnavehicle(refname, spawnpoint, "randomSpawns", faildata);
            level.br_totalvehiclesspawned++;
            /#
                if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                    line(newvehicle.origin, newvehicle.origin + (0, 0, 4096), (1, 0, 0), 1, 1, 20000);
                    if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                        level.var_991ab87ce5e247eb[refname]++;
                    } else {
                        level.var_991ab87ce5e247eb[refname] = 1;
                    }
                    println("<dev string:x80>" + refname + "<dev string:x31c>" + newvehicle.origin);
                }
            #/
            randomSpawns++;
            if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                break;
            }
            waitframe();
        }
        /#
            if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                println("<dev string:x2f4>" + randomSpawns + "<dev string:x331>");
            }
        #/
    }
    var_f2eab7e1ddeedf9a = 0;
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            foreach (vol in level.brvehspawnvols) {
                println("<dev string:x342>" + vol.targetname);
                numspawnpoints = vol.vehiclespawns.size;
                minreq = vol.minvehicles;
                if (minreq > 0 && minreq > vol.vehiclesspawned) {
                    unfilled = minreq - vol.vehiclesspawned;
                    println("<dev string:x369>" + unfilled + "<dev string:x372>");
                    var_f2eab7e1ddeedf9a += unfilled;
                }
            }
            println("<dev string:x38e>" + var_82e084d0cb9a7f40);
            println("<dev string:x3b4>");
            foreach (refname, data in var_7164111ed75798cc.databyref) {
                spawncount = 0;
                if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                    spawncount = level.var_991ab87ce5e247eb[refname];
                }
                println("<dev string:x80>" + refname + "<dev string:x1ca>" + spawncount);
            }
        }
    #/
    var_e158d1582d080cc6 = var_96eb15d5230a7b6e + var_82e084d0cb9a7f40;
    /#
        println("<dev string:x3ea>" + level.br_totalvehiclesspawned);
        println("<dev string:x419>" + var_e158d1582d080cc6);
        if (var_f2eab7e1ddeedf9a > 0) {
            println("<dev string:x44d>" + var_f2eab7e1ddeedf9a);
        }
    #/
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2888
// Size: 0x6d
function function_cb75d1e034823cb5(vehicleref, loc) {
    if (!isdefined(level.var_7cd5202feecd6d42)) {
        level.var_7cd5202feecd6d42 = [];
    }
    if (!isdefined(level.var_7cd5202feecd6d42[vehicleref])) {
        level.var_7cd5202feecd6d42[vehicleref] = [];
    }
    size = level.var_7cd5202feecd6d42[vehicleref].size;
    level.var_7cd5202feecd6d42[vehicleref][size] = loc;
    return loc;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28fe
// Size: 0x69
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2970
// Size: 0x53
function function_5e2ac14f881014b(loc, vehicleref) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return scripts\cp_mp\vehicles\vehicle::vehicle_spawn(vehicleref, spawndata);
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29cc
// Size: 0xdc
function function_fb0db2fc84df7793(refname) {
    if (!getdvarint(@"hash_89be1a979c1ec008", 0)) {
        return;
    }
    if (!isdefined(level.var_7cd5202feecd6d42)) {
        return;
    }
    loclist = level.var_7cd5202feecd6d42[refname];
    if (!isdefined(loclist)) {
        return;
    }
    level endon("game_ended");
    foreach (loc in loclist) {
        if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
            println("<dev string:x480>" + refname);
            logprint("Error: SSC is trying to spawn a vehicle but the max limit has been reached - " + refname);
            return;
        }
        function_5e2ac14f881014b(loc, refname);
        level.br_totalvehiclesspawned++;
        waitframe();
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab0
// Size: 0x78
function function_cd9f2fe51c02d74e() {
    if (!getdvarint(@"hash_89be1a979c1ec008", 0)) {
        return;
    }
    if (!isdefined(level.var_7cd5202feecd6d42)) {
        return;
    }
    foreach (refname, loclist in level.var_7cd5202feecd6d42) {
        function_fb0db2fc84df7793(refname);
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b30
// Size: 0x19b
function function_9856ad860555f8b9() {
    table = level.var_9fab40ed3326f8b;
    if (!isdefined(table)) {
        return;
    }
    numrows = tablelookupgetnumrows(table);
    for (i = 0; i < numrows; i++) {
        poiname = tablelookupbyrow(table, i, 0);
        var_71ad22c5d093d90b = tolower(tablelookupbyrow(table, i, 1));
        minvehicles = int(tablelookupbyrow(table, i, 6));
        if (isdefined(level.poi[poiname]) && isdefined(level.poi[poiname]["subAreas"]) && isdefined(level.poi[poiname]["subAreas"][var_71ad22c5d093d90b])) {
            var_fb65b3577da146b0 = spawnstruct();
            var_fb65b3577da146b0.minvehicles = minvehicles;
            var_fb65b3577da146b0.spawnedvehicles = 0;
            level.poi[poiname]["subAreas"][var_71ad22c5d093d90b].minvehicles = minvehicles;
            level.poi[poiname]["subAreas"][var_71ad22c5d093d90b].spawnedvehicles = 0;
            continue;
        }
        if (poiname == "minVehicleSpawns") {
            vehicleref = tablelookupbyrow(table, i, 1);
            vehiclespawns = int(tablelookupbyrow(table, i, 2));
            if (!isdefined(level.var_a5791492570c75fc)) {
                level.var_a5791492570c75fc = [];
            }
            level.var_a5791492570c75fc[vehicleref] = vehiclespawns;
        }
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd3
// Size: 0x77
function brvehiclespawnvolreset() {
    level.br_totalvehiclesspawned = 0;
    var_7164111ed75798cc = vehicle_spawn_getleveldata();
    foreach (vol in level.brvehspawnvols) {
        vol.vehiclesspawned = 0;
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d52
// Size: 0x4c
function waitforvehiclestodeletethenspawninitial() {
    level endon("game_ended");
    level notify("br_vehiclesWaitForDelete");
    level endon("br_vehiclesWaitForDelete");
    waitframe();
    waittillframeend();
    function_cd9f2fe51c02d74e();
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("spawnInitialVehicles")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("spawnInitialVehicles");
    } else {
        spawninitialvehicles();
    }
    function_ee64ebb471957dc7();
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da6
// Size: 0x20
function brvehiclesreset() {
    emptyallvehicles();
    deleteextantvehicles();
    brvehiclespawnvolreset();
    level thread waitforvehiclestodeletethenspawninitial();
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dce
// Size: 0x52
function brvehicleonprematchstarted() {
    /#
        if (getdvarint(@"hash_6cce831ff331c183", 0)) {
            return;
        }
    #/
    wait 1.5;
    if (!istrue(level.var_7bf42d565645a485)) {
        return;
    }
    vehicle_interact_allowvehicleuseglobal(0);
    brvehiclesreset();
    namespace_acc3d8ec1f00ce29::spawnpalfa();
    scripts\mp\gametypes\br_gametype_dmz::function_b52f35a3ff450ecd();
    vehicle_interact_allowvehicleuseglobal(1);
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e28
// Size: 0x62
function function_c3fe673ce43bb311(vehicleref, defaultpct) {
    if (!isdefined(level.var_aed9c28063f339cd)) {
        level.var_aed9c28063f339cd = [];
    }
    value = getdvarfloat(hashcat(@"hash_20c93b9a1bf4d35d", vehicleref, "_pct"), defaultpct);
    level.var_aed9c28063f339cd[vehicleref] = value * 0.01;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e92
// Size: 0x5f
function function_4e336cd994097306(vehicle, defaultdamage) {
    damageamount = defaultdamage;
    damagepct = level.var_aed9c28063f339cd[vehicle.vehiclename];
    if (isdefined(damagepct) && damagepct > 0) {
        damageamount = vehicle.maxhealth * damagepct;
    }
    return damageamount;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efa
// Size: 0x61
function function_a3c6f2c2714ee754() {
    vehicles = [];
    var_cc3563f7aefb3492 = level.vehicle.instances["little_bird"];
    var_400701c211c2a6c2 = level.vehicle.instances["veh9_palfa"];
    vehicles = array_combine(var_cc3563f7aefb3492, var_400701c211c2a6c2);
    return vehicles;
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f64
// Size: 0x1af
function dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances)) {
        return;
    }
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("vehiclesGasDamage")) {
        return;
    }
    blades_radius = 160;
    rotor_radius = 36;
    damage_amount = 100;
    defaultdamage = getdvarfloat(@"hash_b89033584b879669", damage_amount);
    helis = function_a3c6f2c2714ee754();
    if (isdefined(helis)) {
        foreach (heli in helis) {
            if (istrue(heli.var_651325c15c273cba)) {
                continue;
            }
            var_13d5b2ac0e7c768b = 0;
            vehicleorigin = heli.origin;
            var_24135b85b8e536b8 = distance2d(var_819edacdacb810e4, vehicleorigin);
            if (var_24135b85b8e536b8 + blades_radius > dangercircleradius) {
                var_13d5b2ac0e7c768b = 1;
            } else {
                rotororigin = heli gettagorigin("tail_rotor_jnt");
                var_24135b85b8e536b8 = distance2d(var_819edacdacb810e4, rotororigin);
                if (var_24135b85b8e536b8 + rotor_radius > dangercircleradius) {
                    var_13d5b2ac0e7c768b = 1;
                }
            }
            if (var_13d5b2ac0e7c768b) {
                damageamount = function_4e336cd994097306(heli, defaultdamage);
                heli dodamage(damageamount, vehicleorigin, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            }
        }
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311b
// Size: 0x136
function function_1a1709943670772a() {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances) || !istrue(level.var_2df69b8e552238b6)) {
        return;
    }
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("vehiclesGasDamage")) {
        return;
    }
    blades_radius = 160;
    damage_amount = 100;
    defaultdamage = getdvarfloat(@"hash_b89033584b879669", damage_amount);
    helis = function_a3c6f2c2714ee754();
    if (isdefined(helis)) {
        foreach (heli in helis) {
            if (istrue(heli.var_651325c15c273cba)) {
                continue;
            }
            if (!namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(heli.origin, blades_radius)) {
                damageamount = function_4e336cd994097306(heli, defaultdamage);
                heli dodamage(damageamount, heli.origin, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            }
        }
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3259
// Size: 0x34
function function_b5a8e76fbf49784a(vehicleref) {
    bit = level.vehicleenum[vehicleref];
    if (isdefined(bit)) {
        setomnvarbit("ui_br_vehicles_spawned", bit, 1);
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3295
// Size: 0xbc
function function_ebf775f8fdd1d098() {
    level.vehicleenum = [];
    var_2cc549a811db0b3b = getscriptbundle("vehicleenum:" + "iw9_vehicle_enum");
    if (!isdefined(var_2cc549a811db0b3b)) {
        return [];
    }
    foreach (id, var_87a2ffa83754b065 in var_2cc549a811db0b3b.vehicle_list) {
        if (!isnumber(id)) {
            continue;
        }
        if (!isdefined(var_87a2ffa83754b065)) {
            continue;
        }
        vehicleref = var_87a2ffa83754b065.vehicle;
        if (!isdefined(vehicleref)) {
            continue;
        }
        level.vehicleenum[vehicleref] = id;
    }
}

// Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3359
// Size: 0x70
function function_ee64ebb471957dc7() {
    if (level.vehicleenum.size > 0) {
        foreach (vehicleref, var_e5cd5ce5ee8dc6c9 in level.vehicle.instances) {
            function_b5a8e76fbf49784a(vehicleref);
        }
    }
}

/#

    // Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x33d1
    // Size: 0x78b
    function function_1c7a4c53fa428606() {
        level endon("<dev string:x4ce>");
        while (level.players.size < 1) {
            wait 1;
        }
        var_a25d74cbd44ff62 = [];
        player = level.players[0];
        player notifyonplayercommand("<dev string:x4d9>", "<dev string:x4e3>");
        player notifyonplayercommand("<dev string:x4e9>", "<dev string:x4f8>");
        player notifyonplayercommand("<dev string:x4ff>", "<dev string:x50a>");
        player notifyonplayercommand("<dev string:x514>", "<dev string:x525>");
        player notifyonplayercommand("<dev string:x52e>", "<dev string:x53b>");
        player notifyonplayercommand("<dev string:x54a>", "<dev string:x555>");
        player waittill_any_return_6("<dev string:x4d9>", "<dev string:x4e9>", "<dev string:x4ff>", "<dev string:x514>", "<dev string:x54a>", "<dev string:x52e>");
        setupvehiclespawnvolumes();
        wait 0.5;
        iprintlnbold("<dev string:x561>");
        while (true) {
            note = player waittill_any_return_6("<dev string:x4d9>", "<dev string:x4e9>", "<dev string:x4ff>", "<dev string:x514>", "<dev string:x54a>", "<dev string:x52e>");
            if (note == "<dev string:x52e>") {
                if (var_a25d74cbd44ff62.size > 0) {
                    start = player getvieworigin();
                    angles = player getplayerangles();
                    fwd = anglestoforward(angles);
                    end = start + fwd * 8000;
                    endpos = physicstrace(start, end);
                    bestdistsq = 65536;
                    var_aa61357de4bb54ed = undefined;
                    for (index = 0; index < var_a25d74cbd44ff62.size; index++) {
                        distsq = distancesquared(var_a25d74cbd44ff62[index].origin, endpos);
                        if (distsq < bestdistsq) {
                            var_aa61357de4bb54ed = index;
                        }
                    }
                    if (isdefined(var_aa61357de4bb54ed)) {
                        var_a25d74cbd44ff62[var_aa61357de4bb54ed] delete();
                        var_a25d74cbd44ff62 = array_remove_index(var_a25d74cbd44ff62, var_aa61357de4bb54ed);
                        iprintlnbold("<dev string:x582>" + var_a25d74cbd44ff62.size + "<dev string:x59e>");
                    } else {
                        iprintlnbold("<dev string:x5a9>" + endpos);
                    }
                }
                continue;
            }
            if (note == "<dev string:x54a>") {
                println("<dev string:x5cc>");
                offset = (0, 0, 0);
                filepath = "<dev string:x5e3>" + level.script + "<dev string:x5f7>";
                var_5e43fe5ed10e5799 = openfile(filepath, "<dev string:x606>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x60c>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x615>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x61c>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x61e>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x639>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x655>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x661>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x663>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x61c>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x66c>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x687>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x6b9>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x6f4>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x6fe>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x702>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x71a>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x77d>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x7e3>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x849>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x8aa>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x90b>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x971>");
                fprintln(var_5e43fe5ed10e5799, "<dev string:x661>");
                entnum = 1;
                foreach (entry in var_a25d74cbd44ff62) {
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x975>" + entnum);
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x61c>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x97d>" + "<dev string:x989>" + entry.angles[0] + "<dev string:x98b>" + entry.angles[1] + "<dev string:x98b>" + entry.angles[2] + "<dev string:x989>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x98d>" + "<dev string:x989>" + entry.origin[0] + offset[0] + "<dev string:x98b>" + entry.origin[1] + offset[1] + "<dev string:x98b>" + entry.origin[2] + offset[2] + "<dev string:x989>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x999>" + "<dev string:x989>" + entry.script_classname + "<dev string:x989>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x9a8>" + "<dev string:x989>" + entry.script_model + "<dev string:x989>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x9b3>" + "<dev string:x989>" + entry.targetname + "<dev string:x989>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x9c3>" + "<dev string:x989>" + entry.vehicletype + "<dev string:x989>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x9d4>" + "<dev string:x9e0>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x9e8>" + "<dev string:x9f4>");
                    fprintln(var_5e43fe5ed10e5799, "<dev string:x661>");
                    entnum++;
                }
                closefile(var_5e43fe5ed10e5799);
                iprintlnbold("<dev string:x9fb>" + var_a25d74cbd44ff62.size + "<dev string:xa14>" + filepath);
                continue;
            }
            start = player getvieworigin();
            angles = player getplayerangles();
            fwd = anglestoforward(angles);
            end = start + fwd * 8000;
            endpos = physicstrace(start, end);
            if (endpos != end) {
                endpos += (0, 0, 16);
                entry = spawn("<dev string:xa28>", endpos);
                entry.origin = endpos;
                entry.angles = (0, angles[1], 0);
                entry.targetname = note;
                switch (note) {
                case #"hash_5b97d59c5aa200ba": 
                    entry.script_classname = "<dev string:xa35>";
                    entry.vehicletype = "<dev string:xa4e>";
                    entry.script_model = "<dev string:xa6a>";
                    break;
                case #"hash_9fae9f2b4d8960b5": 
                    entry.script_classname = "<dev string:xa86>";
                    entry.vehicletype = "<dev string:xaa0>";
                    entry.script_model = "<dev string:xab2>";
                    break;
                case #"hash_8d97f13aa572972d": 
                    entry.script_classname = "<dev string:xad1>";
                    entry.vehicletype = "<dev string:xae7>";
                    entry.script_model = "<dev string:xaf8>";
                    break;
                case #"hash_5976269dab51a932": 
                    entry.script_classname = "<dev string:xb1b>";
                    entry.vehicletype = "<dev string:xb37>";
                    entry.script_model = "<dev string:xb48>";
                    break;
                }
                entry setmodel(entry.script_model);
                var_a25d74cbd44ff62[var_a25d74cbd44ff62.size] = entry;
                iprintlnbold(note + "<dev string:xb68>" + var_a25d74cbd44ff62.size + "<dev string:x263>");
                function_d96e7d92cdd79f9e(entry);
            }
        }
    }

    // Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3b64
    // Size: 0x205
    function function_d96e7d92cdd79f9e(spawnpoint) {
        linecolor = (1, 0, 0);
        if (isstruct(spawnpoint)) {
            script_model = undefined;
            switch (spawnpoint.targetname) {
            case #"hash_5b97d59c5aa200ba": 
                script_model = "<dev string:xb7a>";
                linecolor = (1, 1, 1);
                break;
            case #"hash_9fae9f2b4d8960b5": 
                script_model = "<dev string:xb95>";
                linecolor = (0, 1, 0);
                break;
            case #"hash_8d97f13aa572972d": 
                script_model = "<dev string:xbb0>";
                linecolor = (1, 1, 0);
                break;
            case #"hash_5976269dab51a932": 
                script_model = "<dev string:xbca>";
                linecolor = (1, 0, 0);
                break;
            }
            if (isdefined(script_model)) {
                placeholder = spawn("<dev string:xa28>", spawnpoint.origin);
                placeholder.origin = spawnpoint.origin;
                placeholder.angles = spawnpoint.angles;
                placeholder setmodel(script_model);
                wait 0.1;
            }
        } else {
            switch (spawnpoint.targetname) {
            case #"hash_5b97d59c5aa200ba": 
                linecolor = (1, 1, 1);
                break;
            case #"hash_9fae9f2b4d8960b5": 
                linecolor = (0, 1, 0);
                break;
            case #"hash_8d97f13aa572972d": 
                linecolor = (1, 1, 0);
                break;
            case #"hash_5976269dab51a932": 
                linecolor = (1, 0, 0);
                break;
            }
        }
        line(spawnpoint.origin, spawnpoint.origin + (0, 0, 4096), linecolor, 1, 1, 200000);
    }

    // Namespace br_vehicles / scripts\mp\gametypes\br_vehicles
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d71
    // Size: 0x26
    function mychangeswatcher() {
        while (true) {
            level waittill("<dev string:xbe6>");
            vehicle_interact_allowvehicleuseglobal(0);
            vehicle_interact_allowvehicleuseglobal(1);
        }
    }

#/
