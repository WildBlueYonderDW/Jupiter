// mwiii decomp prototype
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
#using script_5def7af2a9f04234;
#using script_48814951e916af89;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_439d01e25d19543b;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_58f20490049af6ac;

#namespace namespace_d8779191da76bfbf;

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e
// Size: 0x2cc
function brvehiclesinit() {
    level.modecontrolledvehiclespawningonly = 1;
    var_6fc423af9a153f6b = getdvarint(@"hash_bb06b4f8c704366b", 1);
    var_84f2fdab2b0451da = getdvarint(@"hash_2d93bd0eac4c5e38", 24);
    level.br_totalvehiclesmax = 128 - var_84f2fdab2b0451da;
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
    if (namespace_cd0b2d039510b38d::getsubgametype() != "dmz") {
        if (getdvarint(@"hash_81e631c248118cd6", 1) != 1) {
            level.br_vehtargetnametoref["palfa_spawn"] = "veh9_palfa";
        }
        level.br_vehtargetnametoref["jltv_mg_spawn"] = "veh9_jltv_mg";
    }
    namespace_c5622898120e827f::function_eca79fa0f341ee08(1, &dangercircletick, &function_1a1709943670772a);
    level thread function_10bd49da0d1d0e99();
    function_c3fe673ce43bb311("little_bird", 5.5);
    function_c3fe673ce43bb311("veh9_palfa", 4.5);
    /#
        level thread function_d6823174f9930c08();
    #/
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x931
// Size: 0x72
function function_ec5f666d56372630(vehicleref) {
    if (!getdvarint(@"hash_89be1a979c1ec008", 0)) {
        return 0;
    }
    if (!array_contains(level.br_vehtargetnametoref, vehicleref)) {
        return 0;
    }
    if (getdvarint(@"hash_befa7ffc4484488a", 0)) {
        return 1;
    }
    dvar = function_2ef675c13ca1c4af(@"hash_ea224dc24c0b7e07", vehicleref);
    if (!getdvarint(dvar, 0)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ab
// Size: 0x14c
function function_10bd49da0d1d0e99() {
    level endon("game_ended");
    namespace_4b0406965e556711::function_1240434f4201ac9d("POIs_initialized");
    var_3dd0478a928f84d = [0:"atv", 1:"little_bird", 2:"tac_rover", 3:"veh9_jltv", 4:"veh9_sedan_hatchback_1985", 5:"veh9_suv_1996", 6:"veh9_mil_cargo_truck", 7:"veh9_hummer", 8:"veh9_overland_2016", 9:"veh9_utv", 10:"veh9_acv_6x6", 11:"veh9_pwc", 12:"veh9_rhib", 13:"veh9_patrol_boat", 14:"veh9_palfa", 15:"veh9_jltv_mg", 16:"veh_jup_razorback", 17:"veh_jup_orav", 18:"veh_jup_research_vessel", 19:"veh9_techo_rebel_armor"];
    foreach (vehicleref in var_3dd0478a928f84d) {
        if (function_ec5f666d56372630(vehicleref)) {
            namespace_7052decdced06e44::function_4f7660cfd85cd517(vehicleref, &function_5a6b4f3358f3e3cc);
            namespace_7052decdced06e44::function_412f527ef0863f0e(vehicleref, &function_cb75d1e034823cb5);
            namespace_7052decdced06e44::function_eded5b87f8f7bdfd(vehicleref, &function_fb0db2fc84df7793);
        }
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe
// Size: 0x30
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

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb35
// Size: 0x4aa
function setupvehiclespawnvolumes() {
    var_b6e57c7554efc295 = "vehicle_volume";
    if (getdvarint(@"hash_2cbc9c033fdea714", 1)) {
        var_b6e57c7554efc295 = "vehicle_volume_simplified";
    }
    level.brvehspawnvols = getentarray(var_b6e57c7554efc295, "script_noteworthy");
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
            } else if (isdefined(spawnpoint.targetname) && spawnpoint.targetname == "littlebird_spawn") {
                level.br_helospawns[level.br_helospawns.size] = spawnpoint;
            } else {
                foreach (vol in level.brvehspawnvols) {
                    if (ispointinvolume(spawnpoint.origin, vol)) {
                        arraysize = vol.vehiclespawns.size;
                        vol.vehiclespawns[arraysize] = spawnpoint;
                        break;
                    }
                }
            }
        }
    }
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("veh_jup_research_vessel" + level.br_vehicleallspawns.size);
            var_7164111ed75798cc = vehicle_spawn_getleveldata();
            println("<unknown string>" + level.br_vehiclealwaysspawns.size + "<unknown string>");
            foreach (spawnpoint in level.br_vehiclealwaysspawns) {
                refname = level.br_vehtargetnametoref[spawnpoint.targetname];
                println("<unknown string>" + refname + "<unknown string>" + spawnpoint.origin);
            }
            var_dc713ce23542133 = 0;
            var_9ee3f0d2d796f396 = 0;
            foreach (vol in level.brvehspawnvols) {
                println("<unknown string>" + vol.targetname);
                var_39fdd6c078016fed = vol.vehiclespawns.size;
                var_7ef18bec9e5bb171 = vol.minvehicles;
                if (var_39fdd6c078016fed > 0 || var_7ef18bec9e5bb171 > 0) {
                    println("<unknown string>" + var_39fdd6c078016fed + "<unknown string>" + var_7ef18bec9e5bb171);
                }
                var_dc713ce23542133 = var_dc713ce23542133 + var_39fdd6c078016fed;
                var_9ee3f0d2d796f396 = var_9ee3f0d2d796f396 + var_7ef18bec9e5bb171;
            }
            println("<unknown string>" + var_dc713ce23542133);
            println("<unknown string>" + var_9ee3f0d2d796f396);
        }
    #/
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe6
// Size: 0x2e
function initvehiclespawnvolume(vol) {
    vol.vehiclespawns = [];
    vol.vehiclesspawned = 0;
    assignvehicleminimumsforvolume(vol);
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101b
// Size: 0x284
function assignvehicleminimumsforvolume(vol) {
    /#
        assert(isdefined(vol.targetname));
    #/
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

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a6
// Size: 0xd8
function emptyallvehicles() {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances)) {
        return;
    }
    foreach (var_e5cd5ce5ee8dc6c9 in level.vehicle.instances) {
        foreach (vehicle in var_e5cd5ce5ee8dc6c9) {
            if (namespace_1fbd40990ee60ede::vehicle_occupancy_instanceisregistered(vehicle)) {
                vehicle_occupancy_ejectalloccupants(vehicle);
            }
        }
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1385
// Size: 0xed
function deleteextantvehicles() {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances)) {
        return;
    }
    namespace_dace9d390bc4a290::vehicle_spawn_cancelpendingrespawns();
    foreach (var_e5cd5ce5ee8dc6c9 in level.vehicle.instances) {
        foreach (vehicle in var_e5cd5ce5ee8dc6c9) {
            namespace_dace9d390bc4a290::vehicle_spawn_preventrespawn(vehicle);
            vehicle.var_a8f4bb03b366aa80 = 1;
            level thread namespace_1f188a13f7e79610::vehicle_death(vehicle);
        }
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1479
// Size: 0x167
function tryspawnavehicle(refname, var_e035fdef423a5164, var_1fdc5457e35daa15, var_ee8da5624236dc89) {
    if (namespace_71073fa38f11492::isfeaturedisabled("vehicleSpawns")) {
        return;
    }
    if ((refname == "little_bird" || refname == "little_bird_mg") && namespace_71073fa38f11492::isfeaturedisabled("littleBirdSpawns")) {
        return;
    }
    if (refname == "veh9_overland_2016" && distancesquared(var_e035fdef423a5164.origin, (19290, -23687, 1123)) < 250000) {
        return;
    }
    if (refname == "atv" && distancesquared(var_e035fdef423a5164.origin, (-19928, -48860, 207)) < 250000) {
        return;
    }
    if (refname == "veh9_pwc" && distancesquared(var_e035fdef423a5164.origin, (-7168, 29580, 120)) < 250000) {
        return;
    }
    if (!namespace_71073fa38f11492::isfeatureenabled("gasVehicleSpawns")) {
        if (!namespace_c5622898120e827f::ispointwithininitialdangercircle(var_e035fdef423a5164.origin)) {
            return;
        }
    }
    if (vehicle_spawn_canspawnvehicle(refname)) {
        var_1c4d640f34dcb9a7 = spawnavehicle(refname, var_e035fdef423a5164, var_ee8da5624236dc89);
        if (isdefined(var_1c4d640f34dcb9a7)) {
            /#
                println("<unknown string>" + refname + "<unknown string>" + var_1fdc5457e35daa15 + "<unknown string>" + var_e035fdef423a5164.origin + "<unknown string>");
            #/
            return var_1c4d640f34dcb9a7;
        }
    }
    return undefined;
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e8
// Size: 0xba
function spawnavehicle(refname, var_e035fdef423a5164, var_ee8da5624236dc89) {
    spawnorigin = var_e035fdef423a5164.origin;
    spawnangles = var_e035fdef423a5164.angles;
    if (!isdefined(spawnangles)) {
        spawnangles = (0, randomfloat(360), 0);
    }
    spawndata = spawnstruct();
    spawndata.origin = spawnorigin;
    spawndata.angles = spawnangles;
    spawndata.spawntype = "GAME_MODE";
    var_1c4d640f34dcb9a7 = namespace_1f188a13f7e79610::vehicle_spawn(refname, spawndata, var_ee8da5624236dc89);
    if (isdefined(var_1c4d640f34dcb9a7)) {
        namespace_a011fbf6d93f25e5::branalytics_vehiclespawned(var_1c4d640f34dcb9a7, refname);
    }
    return var_1c4d640f34dcb9a7;
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16aa
// Size: 0x11d7
function spawninitialvehicles() {
    var_7164111ed75798cc = vehicle_spawn_getleveldata();
    /#
        if (getdvarint(@"hash_6cce831ff331c183", 0)) {
            return;
        }
    #/
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<unknown string>");
            println("<unknown string>");
        }
    #/
    var_96eb15d5230a7b6e = 0;
    var_b9188bdff51c7168 = [];
    var_5487117230712d7b = level.br_vehicleallspawns;
    /#
        level.var_f44c6f8a04520f44 = [];
        level.var_991ab87ce5e247eb = [];
    #/
    var_d23016d6d9981605 = array_randomize(level.br_vehiclealwaysspawns);
    foreach (spawnpoint in var_d23016d6d9981605) {
        var_ee8da5624236dc89 = spawnstruct();
        refname = level.br_vehtargetnametoref[spawnpoint.targetname];
        if (function_ec5f666d56372630(refname)) {
            continue;
        }
        var_1c4d640f34dcb9a7 = tryspawnavehicle(refname, spawnpoint, "alwaysSpawn", var_ee8da5624236dc89);
        if (isdefined(var_1c4d640f34dcb9a7)) {
            level.br_totalvehiclesspawned++;
            var_b9188bdff51c7168[var_b9188bdff51c7168.size] = spawnpoint;
            /#
                if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                    line(var_1c4d640f34dcb9a7.origin, var_1c4d640f34dcb9a7.origin + (0, 0, 4096), (0, 1, 0), 1, 1, 20000);
                    if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                        level.var_991ab87ce5e247eb[refname]++;
                    } else {
                        level.var_991ab87ce5e247eb[refname] = 1;
                    }
                    println("<unknown string>" + refname + "<unknown string>" + var_1c4d640f34dcb9a7.origin);
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
        } else {
            var_96eb15d5230a7b6e++;
        }
    }
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            foreach (vol in level.brvehspawnvols) {
                println("<unknown string>" + vol.targetname);
            }
            println("<unknown string>");
            foreach (refname, data in var_7164111ed75798cc.databyref) {
                if (isdefined(level.var_f44c6f8a04520f44[refname]) && level.var_f44c6f8a04520f44[refname] > 0) {
                    println("<unknown string>" + refname + "<unknown string>" + level.var_f44c6f8a04520f44[refname] + "<unknown string>");
                }
            }
            println("<unknown string>" + var_96eb15d5230a7b6e);
        }
    #/
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<unknown string>");
        }
    #/
    var_82e084d0cb9a7f40 = 0;
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax) {
        var_60c2c2b7cea6e920 = array_randomize(level.brvehspawnvols);
        foreach (vol in var_60c2c2b7cea6e920) {
            /#
                println("<unknown string>" + vol.targetname + "<unknown string>" + vol.minvehicles + "<unknown string>");
            #/
            var_b243344e26fc2116 = vol.minvehicles;
            if (isdefined(var_b243344e26fc2116) && var_b243344e26fc2116 > 0) {
                /#
                    if (var_b243344e26fc2116 > vol.vehiclespawns.size) {
                        println("<unknown string>" + vol.targetname + "<unknown string>" + var_b243344e26fc2116 + "<unknown string>" + vol.vehiclespawns.size + "<unknown string>");
                    }
                #/
                if (vol.vehiclesspawned < var_b243344e26fc2116 && vol.vehiclespawns.size > 0) {
                    randomspawns = array_remove_array(array_randomize(vol.vehiclespawns), var_b9188bdff51c7168);
                    for (spawnindex = 0; vol.vehiclesspawned < var_b243344e26fc2116 && spawnindex < randomspawns.size; spawnindex++) {
                        var_ee8da5624236dc89 = spawnstruct();
                        spawnpoint = randomspawns[spawnindex];
                        refname = level.br_vehtargetnametoref[spawnpoint.targetname];
                        if (function_ec5f666d56372630(refname)) {
                            continue;
                        }
                        var_1c4d640f34dcb9a7 = tryspawnavehicle(refname, spawnpoint, vol.targetname, var_ee8da5624236dc89);
                        if (!isdefined(var_1c4d640f34dcb9a7)) {
                            var_82e084d0cb9a7f40++;
                            /#
                                println("<unknown string>" + vol.targetname + "<unknown string>" + spawnpoint.origin + "<unknown string>");
                            #/
                        } else {
                            level.br_totalvehiclesspawned++;
                            var_b9188bdff51c7168[var_b9188bdff51c7168.size] = spawnpoint;
                            vol.vehiclesspawned++;
                            /#
                                if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                                    line(var_1c4d640f34dcb9a7.origin, var_1c4d640f34dcb9a7.origin + (0, 0, 4096), (0, 1, 1), 1, 1, 20000);
                                    if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                                        level.var_991ab87ce5e247eb[refname]++;
                                    } else {
                                        level.var_991ab87ce5e247eb[refname] = 1;
                                    }
                                    println("<unknown string>" + refname + "<unknown string>" + var_1c4d640f34dcb9a7.origin);
                                }
                            #/
                            if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                                break;
                            }
                            waitframe();
                        }
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
            println("<unknown string>");
        }
    #/
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax) {
        var_56b381327050bc62 = 0;
        var_5c969801281b9666 = array_remove_array(array_randomize(level.br_helospawns), var_b9188bdff51c7168);
        foreach (spawnpoint in var_5c969801281b9666) {
            var_ee8da5624236dc89 = spawnstruct();
            refname = level.br_vehtargetnametoref[spawnpoint.targetname];
            if (function_ec5f666d56372630(refname)) {
                continue;
            }
            var_1c4d640f34dcb9a7 = tryspawnavehicle(refname, spawnpoint, "heloSpawn", var_ee8da5624236dc89);
            if (isdefined(var_1c4d640f34dcb9a7)) {
                level.br_totalvehiclesspawned++;
                var_b9188bdff51c7168[var_b9188bdff51c7168.size] = spawnpoint;
                /#
                    if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                        line(var_1c4d640f34dcb9a7.origin, var_1c4d640f34dcb9a7.origin + (0, 0, 4096), (1, 1, 1), 1, 1, 20000);
                        if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                            level.var_991ab87ce5e247eb[refname]++;
                        } else {
                            level.var_991ab87ce5e247eb[refname] = 1;
                        }
                        println("<unknown string>" + refname + "<unknown string>" + var_1c4d640f34dcb9a7.origin);
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
                println("<unknown string>" + var_56b381327050bc62 + "<unknown string>");
            }
        #/
    }
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax && namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        function_9856ad860555f8b9();
        var_5487117230712d7b = array_remove_array(var_5487117230712d7b, var_b9188bdff51c7168);
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
                var_1c4d640f34dcb9a7 = tryspawnavehicle(refname, spawnpoint, "globalMinSpawns", spawnstruct());
                if (!isdefined(var_1c4d640f34dcb9a7)) {
                    continue;
                }
                level.br_totalvehiclesspawned++;
                var_b9188bdff51c7168[var_b9188bdff51c7168.size] = spawnpoint;
                /#
                    if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                        line(var_1c4d640f34dcb9a7.origin, var_1c4d640f34dcb9a7.origin + (0, 0, 4096), (0, 1, 1), 1, 1, 20000);
                        if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                            level.var_991ab87ce5e247eb[refname]++;
                        } else {
                            level.var_991ab87ce5e247eb[refname] = 1;
                        }
                        println("<unknown string>" + refname + "<unknown string>" + var_1c4d640f34dcb9a7.origin);
                    }
                #/
                if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                    break;
                }
                waitframe();
            }
        }
        var_5487117230712d7b = array_remove_array(var_5487117230712d7b, var_b9188bdff51c7168);
        foreach (spawn in var_5487117230712d7b) {
            poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(spawn.origin);
            subarea = namespace_bfef6903bca5845d::function_a44e168e8cced18(spawn.origin, poi);
            if (isdefined(subarea)) {
                if (!isdefined(subarea.var_6a39dcd2615fb321)) {
                    subarea.var_6a39dcd2615fb321 = [];
                }
                subarea.var_6a39dcd2615fb321[subarea.var_6a39dcd2615fb321.size] = spawn;
            }
        }
        foreach (poi in level.poi) {
            foreach (subarea in poi["subAreas"]) {
                if (!isdefined(subarea.minvehicles) || subarea.minvehicles <= 0 || !isdefined(subarea.var_6a39dcd2615fb321) || subarea.var_6a39dcd2615fb321.size == 0) {
                    subarea.var_6a39dcd2615fb321 = undefined;
                } else {
                    spawns = array_randomize(subarea.var_6a39dcd2615fb321);
                    for (i = 0; subarea.var_1903d60d80d1ce1c < subarea.minvehicles && i < spawns.size; i++) {
                        spawnpoint = spawns[i];
                        var_ee8da5624236dc89 = spawnstruct();
                        refname = level.br_vehtargetnametoref[spawnpoint.targetname];
                        if (function_ec5f666d56372630(refname)) {
                            i++;
                            continue;
                        }
                        var_1c4d640f34dcb9a7 = tryspawnavehicle(refname, spawnpoint, "subAreaSpawns", var_ee8da5624236dc89);
                        if (isdefined(var_1c4d640f34dcb9a7)) {
                            level.br_totalvehiclesspawned++;
                            var_b9188bdff51c7168[var_b9188bdff51c7168.size] = spawnpoint;
                            subarea.var_1903d60d80d1ce1c++;
                            /#
                                if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                                    line(var_1c4d640f34dcb9a7.origin, var_1c4d640f34dcb9a7.origin + (0, 0, 4096), (0, 1, 1), 1, 1, 20000);
                                    if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                                        level.var_991ab87ce5e247eb[refname]++;
                                    } else {
                                        level.var_991ab87ce5e247eb[refname] = 1;
                                    }
                                    println("<unknown string>" + refname + "<unknown string>" + var_1c4d640f34dcb9a7.origin);
                                }
                            #/
                            if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                                break;
                            }
                            waitframe();
                        }
                    }
                    subarea.var_6a39dcd2615fb321 = undefined;
                    if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                        break;
                    }
                }
            }
            if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                break;
            }
        }
    }
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            println("<unknown string>");
        }
    #/
    if (level.br_totalvehiclesspawned < level.br_totalvehiclesmax) {
        randomspawns = 0;
        var_5487117230712d7b = array_remove_array(var_5487117230712d7b, var_b9188bdff51c7168);
        var_5487117230712d7b = array_randomize(var_5487117230712d7b);
        foreach (spawnpoint in var_5487117230712d7b) {
            refname = level.br_vehtargetnametoref[spawnpoint.targetname];
            if (!isdefined(refname)) {
                continue;
            }
            if (function_ec5f666d56372630(refname)) {
                continue;
            }
            while (!namespace_f64231d5b7a2c3c4::canspawnvehicle()) {
                wait(1);
            }
            var_ee8da5624236dc89 = spawnstruct();
            var_1c4d640f34dcb9a7 = tryspawnavehicle(refname, spawnpoint, "randomSpawns", var_ee8da5624236dc89);
            level.br_totalvehiclesspawned++;
            /#
                if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                    line(var_1c4d640f34dcb9a7.origin, var_1c4d640f34dcb9a7.origin + (0, 0, 4096), (1, 0, 0), 1, 1, 20000);
                    if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                        level.var_991ab87ce5e247eb[refname]++;
                    } else {
                        level.var_991ab87ce5e247eb[refname] = 1;
                    }
                    println("<unknown string>" + refname + "<unknown string>" + var_1c4d640f34dcb9a7.origin);
                }
            #/
            randomspawns++;
            if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
                break;
            }
            waitframe();
        }
        /#
            if (getdvarint(@"hash_be81410131fa95bf", 0)) {
                println("<unknown string>" + randomspawns + "<unknown string>");
            }
        #/
    }
    var_f2eab7e1ddeedf9a = 0;
    /#
        if (getdvarint(@"hash_be81410131fa95bf", 0)) {
            foreach (vol in level.brvehspawnvols) {
                println("<unknown string>" + vol.targetname);
                var_39fdd6c078016fed = vol.vehiclespawns.size;
                var_7ef18bec9e5bb171 = vol.minvehicles;
                if (var_7ef18bec9e5bb171 > 0 && var_7ef18bec9e5bb171 > vol.vehiclesspawned) {
                    var_8270ba1778ba76ca = var_7ef18bec9e5bb171 - vol.vehiclesspawned;
                    println("<unknown string>" + var_8270ba1778ba76ca + "<unknown string>");
                    var_f2eab7e1ddeedf9a = var_f2eab7e1ddeedf9a + var_8270ba1778ba76ca;
                }
            }
            println("<unknown string>" + var_82e084d0cb9a7f40);
            println("<unknown string>");
            foreach (refname, data in var_7164111ed75798cc.databyref) {
                spawncount = 0;
                if (isdefined(level.var_991ab87ce5e247eb[refname])) {
                    spawncount = level.var_991ab87ce5e247eb[refname];
                }
                println("<unknown string>" + refname + "<unknown string>" + spawncount);
            }
        }
    #/
    var_e158d1582d080cc6 = var_96eb15d5230a7b6e + var_82e084d0cb9a7f40;
    /#
        println("<unknown string>" + level.br_totalvehiclesspawned);
        println("<unknown string>" + var_e158d1582d080cc6);
        if (var_f2eab7e1ddeedf9a > 0) {
            println("<unknown string>" + var_f2eab7e1ddeedf9a);
        }
    #/
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2888
// Size: 0x6e
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

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28fe
// Size: 0x6a
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2970
// Size: 0x54
function function_5e2ac14f881014b(loc, vehicleref) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn(vehicleref, spawndata);
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29cc
// Size: 0xdd
function function_fb0db2fc84df7793(refname) {
    if (!getdvarint(@"hash_89be1a979c1ec008", 0)) {
        return;
    }
    if (!isdefined(level.var_7cd5202feecd6d42)) {
        return;
    }
    var_fac0789c390440d = level.var_7cd5202feecd6d42[refname];
    if (!isdefined(var_fac0789c390440d)) {
        return;
    }
    level endon("game_ended");
    foreach (loc in var_fac0789c390440d) {
        if (level.br_totalvehiclesspawned >= level.br_totalvehiclesmax) {
            /#
                println("<unknown string>" + refname);
            #/
            logprint("Error: SSC is trying to spawn a vehicle but the max limit has been reached - " + refname);
            return;
        }
        function_5e2ac14f881014b(loc, refname);
        level.br_totalvehiclesspawned++;
        waitframe();
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab0
// Size: 0x79
function function_cd9f2fe51c02d74e() {
    if (!getdvarint(@"hash_89be1a979c1ec008", 0)) {
        return;
    }
    if (!isdefined(level.var_7cd5202feecd6d42)) {
        return;
    }
    foreach (refname, var_fac0789c390440d in level.var_7cd5202feecd6d42) {
        function_fb0db2fc84df7793(refname);
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b30
// Size: 0x19c
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
            var_fb65b3577da146b0.var_1903d60d80d1ce1c = 0;
            level.poi[poiname]["subAreas"][var_71ad22c5d093d90b].minvehicles = minvehicles;
            level.poi[poiname]["subAreas"][var_71ad22c5d093d90b].var_1903d60d80d1ce1c = 0;
        } else if (poiname == "minVehicleSpawns") {
            vehicleref = tablelookupbyrow(table, i, 1);
            vehiclespawns = int(tablelookupbyrow(table, i, 2));
            if (!isdefined(level.var_a5791492570c75fc)) {
                level.var_a5791492570c75fc = [];
            }
            level.var_a5791492570c75fc[vehicleref] = vehiclespawns;
        }
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd3
// Size: 0x78
function brvehiclespawnvolreset() {
    level.br_totalvehiclesspawned = 0;
    var_7164111ed75798cc = vehicle_spawn_getleveldata();
    foreach (vol in level.brvehspawnvols) {
        vol.vehiclesspawned = 0;
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d52
// Size: 0x4d
function waitforvehiclestodeletethenspawninitial() {
    level endon("game_ended");
    level notify("br_vehiclesWaitForDelete");
    level endon("br_vehiclesWaitForDelete");
    waitframe();
    waittillframeend();
    function_cd9f2fe51c02d74e();
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("spawnInitialVehicles")) {
        namespace_71073fa38f11492::runbrgametypefunc("spawnInitialVehicles");
    } else {
        spawninitialvehicles();
    }
    function_ee64ebb471957dc7();
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da6
// Size: 0x21
function brvehiclesreset() {
    emptyallvehicles();
    deleteextantvehicles();
    brvehiclespawnvolreset();
    level thread waitforvehiclestodeletethenspawninitial();
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dce
// Size: 0x53
function brvehicleonprematchstarted() {
    /#
        if (getdvarint(@"hash_6cce831ff331c183", 0)) {
            return;
        }
    #/
    wait(1.5);
    if (!istrue(level.var_7bf42d565645a485)) {
        return;
    }
    vehicle_interact_allowvehicleuseglobal(0);
    brvehiclesreset();
    namespace_acc3d8ec1f00ce29::function_e456f5964ba54d64();
    namespace_d696adde758cbe79::function_b52f35a3ff450ecd();
    vehicle_interact_allowvehicleuseglobal(1);
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e28
// Size: 0x63
function function_c3fe673ce43bb311(vehicleref, var_83263d327522cba1) {
    if (!isdefined(level.var_aed9c28063f339cd)) {
        level.var_aed9c28063f339cd = [];
    }
    value = getdvarfloat(function_2ef675c13ca1c4af(@"hash_20c93b9a1bf4d35d", vehicleref, "_pct"), var_83263d327522cba1);
    level.var_aed9c28063f339cd[vehicleref] = value * 0.01;
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e92
// Size: 0x60
function function_4e336cd994097306(vehicle, var_a3336b3496d766ef) {
    damageamount = var_a3336b3496d766ef;
    damagepct = level.var_aed9c28063f339cd[vehicle.vehiclename];
    if (isdefined(damagepct) && damagepct > 0) {
        damageamount = vehicle.maxhealth * damagepct;
    }
    return damageamount;
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efa
// Size: 0x62
function function_a3c6f2c2714ee754() {
    vehicles = [];
    var_cc3563f7aefb3492 = level.vehicle.instances["little_bird"];
    var_400701c211c2a6c2 = level.vehicle.instances["veh9_palfa"];
    vehicles = array_combine(var_cc3563f7aefb3492, var_400701c211c2a6c2);
    return vehicles;
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f64
// Size: 0x1b0
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances)) {
        return;
    }
    if (namespace_71073fa38f11492::isfeaturedisabled("vehiclesGasDamage")) {
        return;
    }
    var_c9578424eba088bd = 160;
    var_c19221171f30346 = 36;
    damage_amount = 100;
    var_a3336b3496d766ef = getdvarfloat(@"hash_b89033584b879669", damage_amount);
    helis = function_a3c6f2c2714ee754();
    if (isdefined(helis)) {
        foreach (heli in helis) {
            if (istrue(heli.var_651325c15c273cba)) {
                continue;
            }
            var_13d5b2ac0e7c768b = 0;
            var_6f3a90a6b2b8799d = heli.origin;
            var_24135b85b8e536b8 = distance2d(var_819edacdacb810e4, var_6f3a90a6b2b8799d);
            if (var_24135b85b8e536b8 + var_c9578424eba088bd > var_e86632d645c137d0) {
                var_13d5b2ac0e7c768b = 1;
            } else {
                var_85dbf781a77fc451 = heli gettagorigin("tail_rotor_jnt");
                var_24135b85b8e536b8 = distance2d(var_819edacdacb810e4, var_85dbf781a77fc451);
                if (var_24135b85b8e536b8 + var_c19221171f30346 > var_e86632d645c137d0) {
                    var_13d5b2ac0e7c768b = 1;
                }
            }
            if (var_13d5b2ac0e7c768b) {
                damageamount = function_4e336cd994097306(heli, var_a3336b3496d766ef);
                heli dodamage(damageamount, var_6f3a90a6b2b8799d, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            }
        }
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311b
// Size: 0x137
function function_1a1709943670772a() {
    if (!isdefined(level.vehicle) || !isdefined(level.vehicle.instances) || !istrue(level.var_2df69b8e552238b6)) {
        return;
    }
    if (namespace_71073fa38f11492::isfeaturedisabled("vehiclesGasDamage")) {
        return;
    }
    var_c9578424eba088bd = 160;
    damage_amount = 100;
    var_a3336b3496d766ef = getdvarfloat(@"hash_b89033584b879669", damage_amount);
    helis = function_a3c6f2c2714ee754();
    if (isdefined(helis)) {
        foreach (heli in helis) {
            if (istrue(heli.var_651325c15c273cba)) {
                continue;
            }
            if (!namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(heli.origin, var_c9578424eba088bd)) {
                damageamount = function_4e336cd994097306(heli, var_a3336b3496d766ef);
                heli dodamage(damageamount, heli.origin, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            }
        }
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3259
// Size: 0x35
function function_b5a8e76fbf49784a(vehicleref) {
    bit = level.var_a0eb995edd24354a[vehicleref];
    if (isdefined(bit)) {
        setomnvarbit("ui_br_vehicles_spawned", bit, 1);
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3295
// Size: 0xbd
function function_ebf775f8fdd1d098() {
    level.var_a0eb995edd24354a = [];
    var_2cc549a811db0b3b = getscriptbundle("vehicleenum:" + "iw9_vehicle_enum");
    if (!isdefined(var_2cc549a811db0b3b)) {
        return [];
    }
    foreach (id, var_87a2ffa83754b065 in var_2cc549a811db0b3b.var_fbb490b5d203d70c) {
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
        level.var_a0eb995edd24354a[vehicleref] = id;
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3359
// Size: 0x71
function function_ee64ebb471957dc7() {
    if (level.var_a0eb995edd24354a.size > 0) {
        foreach (vehicleref, var_e5cd5ce5ee8dc6c9 in level.vehicle.instances) {
            function_b5a8e76fbf49784a(vehicleref);
        }
    }
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33d1
// Size: 0x78c
function function_1c7a4c53fa428606() {
    /#
        level endon("<unknown string>");
        while (level.players.size < 1) {
            wait(1);
        }
        var_a25d74cbd44ff62 = [];
        player = level.players[0];
        player notifyonplayercommand("<unknown string>", "<unknown string>");
        player notifyonplayercommand("<unknown string>", "<unknown string>");
        player notifyonplayercommand("<unknown string>", "<unknown string>");
        player notifyonplayercommand("<unknown string>", "<unknown string>");
        player notifyonplayercommand("<unknown string>", "<unknown string>");
        player notifyonplayercommand("<unknown string>", "<unknown string>");
        player waittill_any_return_6("<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>");
        setupvehiclespawnvolumes();
        wait(0.5);
        iprintlnbold("<unknown string>");
        while (1) {
            note = player waittill_any_return_6("<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>");
            if (note == "<unknown string>") {
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
                        iprintlnbold("<unknown string>" + var_a25d74cbd44ff62.size + "<unknown string>");
                    } else {
                        iprintlnbold("<unknown string>" + endpos);
                    }
                }
            } else if (note == "<unknown string>") {
                println("<unknown string>");
                offset = (0, 0, 0);
                var_89bb38b8c97a2660 = "<unknown string>" + level.script + "<unknown string>";
                var_5e43fe5ed10e5799 = openfile(var_89bb38b8c97a2660, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                entnum = 1;
                foreach (entry in var_a25d74cbd44ff62) {
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + entnum);
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>" + entry.angles[0] + "<unknown string>" + entry.angles[1] + "<unknown string>" + entry.angles[2] + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>" + entry.origin[0] + offset[0] + "<unknown string>" + entry.origin[1] + offset[1] + "<unknown string>" + entry.origin[2] + offset[2] + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>" + entry.var_7dd6ad3441fbf126 + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>" + entry.script_model + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>" + entry.targetname + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>" + entry.vehicletype + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>" + "<unknown string>");
                    fprintln(var_5e43fe5ed10e5799, "<unknown string>");
                    entnum++;
                }
                closefile(var_5e43fe5ed10e5799);
                iprintlnbold("<unknown string>" + var_a25d74cbd44ff62.size + "<unknown string>" + var_89bb38b8c97a2660);
            } else {
                start = player getvieworigin();
                angles = player getplayerangles();
                fwd = anglestoforward(angles);
                end = start + fwd * 8000;
                endpos = physicstrace(start, end);
                if (endpos != end) {
                    endpos = endpos + (0, 0, 16);
                    entry = spawn("<unknown string>", endpos);
                    entry.origin = endpos;
                    entry.angles = (0, angles[1], 0);
                    entry.targetname = note;
                    switch (note) {
                    case #"hash_5b97d59c5aa200ba":
                        entry.var_7dd6ad3441fbf126 = "<unknown string>";
                        entry.vehicletype = "<unknown string>";
                        entry.script_model = "<unknown string>";
                        break;
                    case #"hash_9fae9f2b4d8960b5":
                        entry.var_7dd6ad3441fbf126 = "<unknown string>";
                        entry.vehicletype = "<unknown string>";
                        entry.script_model = "<unknown string>";
                        break;
                    case #"hash_8d97f13aa572972d":
                        entry.var_7dd6ad3441fbf126 = "<unknown string>";
                        entry.vehicletype = "<unknown string>";
                        entry.script_model = "<unknown string>";
                        break;
                    case #"hash_5976269dab51a932":
                        entry.var_7dd6ad3441fbf126 = "<unknown string>";
                        entry.vehicletype = "<unknown string>";
                        entry.script_model = "<unknown string>";
                        break;
                    }
                    entry setmodel(entry.script_model);
                    var_a25d74cbd44ff62[var_a25d74cbd44ff62.size] = entry;
                    iprintlnbold(note + "<unknown string>" + var_a25d74cbd44ff62.size + "<unknown string>");
                    function_d96e7d92cdd79f9e(entry);
                }
            }
        }
    #/
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b64
// Size: 0x206
function function_d96e7d92cdd79f9e(spawnpoint) {
    /#
        linecolor = (1, 0, 0);
        if (isstruct(spawnpoint)) {
            script_model = undefined;
            switch (spawnpoint.targetname) {
            case #"hash_5b97d59c5aa200ba":
                script_model = "<unknown string>";
                linecolor = (1, 1, 1);
                break;
            case #"hash_9fae9f2b4d8960b5":
                script_model = "<unknown string>";
                linecolor = (0, 1, 0);
                break;
            case #"hash_8d97f13aa572972d":
                script_model = "<unknown string>";
                linecolor = (1, 1, 0);
                break;
            case #"hash_5976269dab51a932":
                script_model = "<unknown string>";
                linecolor = (1, 0, 0);
                break;
            }
            if (isdefined(script_model)) {
                placeholder = spawn("<unknown string>", spawnpoint.origin);
                placeholder.origin = spawnpoint.origin;
                placeholder.angles = spawnpoint.angles;
                placeholder setmodel(script_model);
                wait(0.1);
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
    #/
}

// Namespace namespace_d8779191da76bfbf/namespace_15d3019056d1bcea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d71
// Size: 0x27
function function_d6823174f9930c08() {
    /#
        while (1) {
            level waittill("<unknown string>");
            vehicle_interact_allowvehicleuseglobal(0);
            vehicle_interact_allowvehicleuseglobal(1);
        }
    #/
}

