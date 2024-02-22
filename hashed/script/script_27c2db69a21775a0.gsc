// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\engine\trace.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\rally_point.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_helicopters.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\parachute.gsc;

#namespace namespace_569cc561791f82ef;

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db
// Size: 0x12f
function registervehicletype(refname, var_e4015cfe956f4f3f) {
    /#
        assert(isdefined(refname));
    #/
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = var_e4015cfe956f4f3f;
    var_4c78e24488a4f0c0 = function_b08e7e3a0b14f76f(refname);
    vehicleinfo.vehiclespawns = [];
    foreach (spawn in var_4c78e24488a4f0c0) {
        if (!isdefined(spawn.script_team) || refname == "light_tank" || refname == "veh9_jltv_mg" || refname == "veh9_cougar" || refname == "veh_jup_razorback") {
            vehicleinfo.vehiclespawns[vehicleinfo.vehiclespawns.size] = spawn;
        }
    }
    if (!isdefined(level.vehicleinfo)) {
        level.vehicleinfo = [];
    }
    level.vehicleinfo[refname] = vehicleinfo;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x911
// Size: 0x428
function function_417194d265d63273() {
    registervehicletype("little_bird", &vehiclespawn_littlebird);
    registervehicletype("atv", &vehiclespawn_atv);
    registervehicletype("light_tank", &vehiclespawn_tank);
    registervehicletype("veh9_rhib", &function_91397b675b427da6);
    registervehicletype("veh9_pwc", &function_9945b400b938a173);
    registervehicletype("veh9_jltv", &function_52e04331732241d7);
    registervehicletype("veh9_suv_1996", &function_784aa0f6ee634ae5);
    registervehicletype("veh9_sedan_hatchback_1985", &function_db3f4677d3b1ef4a);
    registervehicletype("veh9_patrol_boat", &function_64440e5a2bfd8900);
    registervehicletype("veh9_mil_cargo_truck", &function_93f25760d0131658);
    registervehicletype("veh9_utv", &function_c43c5200d882b134);
    registervehicletype("veh9_hummer", &function_c6436c7f3e995d85);
    registervehicletype("veh9_overland_2016", &function_9d7d93def34d9958);
    registervehicletype("veh_jup_truck_tech_hmg", &function_a566257e1d27492c);
    registervehicletype("veh_jup_orav", &function_3086eb7fdb843535);
    registervehicletype("veh_jup_razorback", &function_725c5ee265b286ce);
    level.vehiclespawnlocs = [];
    foreach (vehicleinfo in level.vehicleinfo) {
        /#
            issharedfuncdefined("level.numHQTanks_Allies is not defined.", "_friendly_", 1);
        #/
        if (![[ getsharedfunc("vehicle_spawn", "canSpawnVehicle") ]](vehicleinfo.refname)) {
            continue;
        }
        foreach (spawnpoint in vehicleinfo.vehiclespawns) {
            if (!isdefined(namespace_36f464722d326bbe::getlocaleid()) || !isdefined(spawnpoint.script_noteworthy) || spawnpoint.script_noteworthy != level.localeid) {
                continue;
            }
            if (!function_e844513ae4facc56(vehicleinfo.refname, spawnpoint.origin)) {
                continue;
            }
            spawnpoint = function_4d91efcd80ff8810(vehicleinfo.refname, spawnpoint);
            index = level.vehiclespawnlocs.size;
            level.vehiclespawnlocs[index] = spawnpoint;
            level.vehiclespawnlocs[index].refname = vehicleinfo.refname;
        }
    }
    if (0) {
        foreach (loc in level.vehiclespawnlocs) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
        }
    }
    level.vehiclespawnlocs = array_randomize(level.vehiclespawnlocs);
    var_fc617751f654a141 = level.numnonrallyvehicles;
    if (!isdefined(level.numnonrallyvehicles)) {
        var_fc617751f654a141 = 25;
    }
    if (0) {
        for (i = 0; i < var_fc617751f654a141; i++) {
            loc = level.vehiclespawnlocs[i];
            thread drawline(loc.origin + (0, 0, 1500), loc.origin + (0, 0, 2500), 1000, (0, 1, 0));
        }
    }
    for (i = 0; i < var_fc617751f654a141; i++) {
        loc = level.vehiclespawnlocs[i];
        if (isdefined(loc)) {
            vehicleinfo = level.vehicleinfo[loc.refname];
            [[ vehicleinfo.spawncallback ]](loc);
        }
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd40
// Size: 0x679
function init_groundwarvehicles() {
    level.ignorevehicletypeinstancelimit = 1;
    registervehicletype("little_bird", &vehiclespawn_littlebird);
    registervehicletype("atv", &vehiclespawn_atv);
    registervehicletype("light_tank", &vehiclespawn_tank);
    registervehicletype("veh9_rhib", &function_91397b675b427da6);
    registervehicletype("veh9_pwc", &function_9945b400b938a173);
    registervehicletype("veh9_jltv", &function_52e04331732241d7);
    registervehicletype("veh9_jltv_mg", &function_4fbf67e0d91458f8);
    registervehicletype("veh9_suv_1996", &function_784aa0f6ee634ae5);
    registervehicletype("veh9_sedan_hatchback_1985", &function_db3f4677d3b1ef4a);
    registervehicletype("veh9_patrol_boat", &function_64440e5a2bfd8900);
    registervehicletype("veh9_mil_cargo_truck", &function_93f25760d0131658);
    registervehicletype("veh9_utv", &function_c43c5200d882b134);
    registervehicletype("veh9_hummer", &function_c6436c7f3e995d85);
    registervehicletype("veh9_overland_2016", &function_9d7d93def34d9958);
    registervehicletype("veh9_acv_6x6", &function_a23b100003fc2003);
    registervehicletype("veh_jup_truck_tech_hmg", &function_a566257e1d27492c);
    registervehicletype("veh_jup_orav", &function_3086eb7fdb843535);
    registervehicletype("veh_jup_razorback", &function_725c5ee265b286ce);
    registersharedfunc("light_tank", "create", &function_a53caaef0414a722);
    registersharedfunc("veh9_cougar", "create", &function_a53caaef0414a722);
    registersharedfunc("veh_jup_razorback", "create", &function_a53caaef0414a722);
    if (getdvarint(@"hash_50c65a9fb4fa6fab", 1)) {
        registersharedfunc("light_tank", "alterRespawnData", &function_54245b02f897a6d8);
        registersharedfunc("veh9_cougar", "alterRespawnData", &function_54245b02f897a6d8);
        level thread function_b55258e4128d8829();
    }
    level.vehiclespawnlocs = [];
    level.tankspawnlocs_axis = [];
    level.tankspawnlocs_allies = [];
    foreach (vehicleinfo in level.vehicleinfo) {
        /#
            issharedfuncdefined("level.numHQTanks_Allies is not defined.", "_friendly_", 1);
        #/
        if (![[ getsharedfunc("vehicle_spawn", "canSpawnVehicle") ]](vehicleinfo.refname)) {
            continue;
        }
        foreach (spawnpoint in vehicleinfo.vehiclespawns) {
            if (!isdefined(namespace_36f464722d326bbe::getlocaleid()) || !isdefined(spawnpoint.script_noteworthy) || spawnpoint.script_noteworthy != level.localeid) {
                continue;
            }
            if (!function_e844513ae4facc56(vehicleinfo.refname, spawnpoint.origin)) {
                continue;
            }
            spawnpoint = function_4d91efcd80ff8810(vehicleinfo.refname, spawnpoint);
            if (vehicleinfo.refname == "light_tank" || vehicleinfo.refname == "veh_jup_razorback") {
                if (isdefined(spawnpoint.script_team) && spawnpoint.script_team == "axis") {
                    index = level.tankspawnlocs_axis.size;
                    level.tankspawnlocs_axis[index] = spawnpoint;
                    level.tankspawnlocs_axis[index].refname = vehicleinfo.refname;
                } else if (isdefined(spawnpoint.script_team) && spawnpoint.script_team == "allies") {
                    index = level.tankspawnlocs_allies.size;
                    level.tankspawnlocs_allies[index] = spawnpoint;
                    level.tankspawnlocs_allies[index].refname = vehicleinfo.refname;
                }
            } else {
                index = level.vehiclespawnlocs.size;
                level.vehiclespawnlocs[index] = spawnpoint;
                level.vehiclespawnlocs[index].refname = vehicleinfo.refname;
            }
        }
    }
    if (0) {
        foreach (loc in level.vehiclespawnlocs) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
            /#
                print3d(loc.origin, loc.refname + "game_ended" + loc.origin, (1, 0, 0), 1, 1, 100000, 1);
            #/
        }
    }
    level.vehiclespawnlocs = array_randomize(level.vehiclespawnlocs);
    var_fc617751f654a141 = level.numnonrallyvehicles;
    if (!isdefined(level.numnonrallyvehicles)) {
        var_fc617751f654a141 = 25;
    }
    if (0) {
        for (i = 0; i < var_fc617751f654a141; i++) {
            loc = level.vehiclespawnlocs[i];
            thread drawline(loc.origin + (0, 0, 1500), loc.origin + (0, 0, 2500), 1000, (0, 1, 0));
        }
    }
    for (i = 0; i < var_fc617751f654a141; i++) {
        loc = level.vehiclespawnlocs[i];
        if (isdefined(loc)) {
            vehicleinfo = level.vehicleinfo[loc.refname];
            [[ vehicleinfo.spawncallback ]](loc);
        }
    }
    level.numhqtanks_axis = 0;
    level.numhqtanks_allies = 0;
    if (getdvarint(@"hash_4160846b9ed34b57", 0) == 1) {
        wait(5);
    } else {
        namespace_4b0406965e556711::gameflagwait("prematch_countdown");
    }
    level thread function_b5f74019852e37fb();
    level thread function_67578d114d517147();
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13c0
// Size: 0x16
function function_87328480bccc7550(points) {
    level.var_dd038f2881e68d7c = points;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13dd
// Size: 0x2b
function private function_b55258e4128d8829() {
    var_dd038f2881e68d7c = namespace_dace9d390bc4a290::function_25d4b673539659a1();
    if (!isdefined(level.var_dd038f2881e68d7c)) {
        level.var_dd038f2881e68d7c = var_dd038f2881e68d7c;
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x140f
// Size: 0x210
function private function_54245b02f897a6d8(spawndata) {
    if (!isdefined(level.var_dd038f2881e68d7c) || is_equal(level.var_dd038f2881e68d7c.size, 0)) {
        return spawndata;
    }
    var_94dbde10d3b62d71 = 0;
    foreach (i in array_randomize([0:0, 1:1, 2:2, 3:3, 4:4])) {
        if (is_equal(level.allfobs[i].trigger.gameobject.ownerteam, spawndata.team) && isdefined(level.var_dd038f2881e68d7c[i]) && (!isdefined(level.var_dd038f2881e68d7c[i][0]) || level.var_dd038f2881e68d7c[i][0] == spawndata.targetname) && (!isdefined(level.var_dd038f2881e68d7c[i][3]) || level.var_dd038f2881e68d7c[i][3] == spawndata.team)) {
            if (!isdefined(spawndata.originalorigin)) {
                spawndata.originalorigin = spawndata.origin;
                spawndata.originalangles = spawndata.angles;
            }
            spawndata.origin = level.var_dd038f2881e68d7c[i][1];
            spawndata.angles = level.var_dd038f2881e68d7c[i][2];
            var_94dbde10d3b62d71 = 1;
            break;
        }
    }
    if (!var_94dbde10d3b62d71 && isdefined(spawndata.originalorigin)) {
        spawndata.origin = spawndata.originalorigin;
        spawndata.angles = spawndata.originalangles;
    }
    return spawndata;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1627
// Size: 0x7d
function function_818ecfdb2be6e33d(vehicleref, origin, var_d5b6a54a565bdc23, var_8b5e29e3d1fa1bff, var_7d5e409c9c04d1e3) {
    var_db32abf0a18cadf6 = sortbydistance(function_b08e7e3a0b14f76f(vehicleref), origin)[0];
    deletestruct_ref(var_db32abf0a18cadf6);
    var_db32abf0a18cadf6.targetname = var_d5b6a54a565bdc23;
    var_db32abf0a18cadf6.vehicletype = var_8b5e29e3d1fa1bff;
    var_db32abf0a18cadf6.script_team = var_7d5e409c9c04d1e3;
    function_1f6c1a9b7564dc61(var_db32abf0a18cadf6);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16ab
// Size: 0x7e
function function_8f3b4ac00da24665(vehicleref, origin) {
    if (!isdefined(level.var_de84ae972d3a7582)) {
        level.var_de84ae972d3a7582 = [];
    }
    if (!isdefined(level.var_de84ae972d3a7582[vehicleref])) {
        level.var_de84ae972d3a7582[vehicleref] = [];
    }
    struct = spawnstruct();
    struct.origin = origin;
    level.var_de84ae972d3a7582[vehicleref][level.var_de84ae972d3a7582[vehicleref].size] = struct;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1730
// Size: 0x68
function private function_e844513ae4facc56(vehicleref, origin) {
    if (!isdefined(level.var_de84ae972d3a7582) || !isdefined(level.var_de84ae972d3a7582[vehicleref])) {
        return 1;
    }
    closest = sortbydistance(level.var_de84ae972d3a7582[vehicleref], origin)[0];
    return distancesquared(origin, closest.origin) >= 400;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17a0
// Size: 0xa8
function function_4925ad96cef8def1(vehicleref, origin, neworigin, newangles) {
    if (!isdefined(level.var_4925ad96cef8def1)) {
        level.var_4925ad96cef8def1 = [];
    }
    if (!isdefined(level.var_4925ad96cef8def1[vehicleref])) {
        level.var_4925ad96cef8def1[vehicleref] = [];
    }
    struct = spawnstruct();
    struct.origin = origin;
    struct.neworigin = neworigin;
    struct.newangles = newangles;
    level.var_4925ad96cef8def1[vehicleref][level.var_4925ad96cef8def1[vehicleref].size] = struct;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x184f
// Size: 0xbc
function private function_4d91efcd80ff8810(vehicleref, var_db32abf0a18cadf6) {
    if (!isdefined(level.var_4925ad96cef8def1) || !isdefined(level.var_4925ad96cef8def1[vehicleref])) {
        return var_db32abf0a18cadf6;
    }
    closest = sortbydistance(level.var_4925ad96cef8def1[vehicleref], var_db32abf0a18cadf6.origin)[0];
    if (distancesquared(var_db32abf0a18cadf6.origin, closest.origin) < 400) {
        var_db32abf0a18cadf6.origin = closest.neworigin;
        if (isdefined(closest.newangles)) {
            var_db32abf0a18cadf6.angles = closest.newangles;
        }
    }
    return var_db32abf0a18cadf6;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1913
// Size: 0x35
function function_b5f74019852e37fb() {
    wait(getdvarfloat(@"hash_9c149e5fc7b81d01", 0));
    thread vehiclespawn_hqtanks(level.tankspawnlocs_axis);
    thread vehiclespawn_hqtanks(level.tankspawnlocs_allies);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194f
// Size: 0x189
function function_67578d114d517147() {
    wait(getdvarfloat(@"hash_1f1cf80e06786f42", 4));
    registervehicletype("veh9_cougar", &function_70199cf52bda53fa);
    data = level.vehicleinfo["veh9_cougar"];
    foreach (loc in data.vehiclespawns) {
        if (!isdefined(namespace_36f464722d326bbe::getlocaleid()) || !isdefined(loc.script_noteworthy) || loc.script_noteworthy != level.localeid) {
            continue;
        }
        if (!function_e844513ae4facc56("veh9_cougar", loc.origin)) {
            continue;
        }
        loc = function_4d91efcd80ff8810("veh9_cougar", loc);
        level thread [[ data.spawncallback ]](loc);
        if (0) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
            /#
                print3d(loc.origin, "script_model" + "game_ended" + loc.origin, (1, 0, 0), 1, 1, 100000, 1);
            #/
        }
        wait(1);
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1adf
// Size: 0x18b
function vehiclespawn_hqtanks(var_9d4b9fcd75d1a736) {
    foreach (loc in var_9d4b9fcd75d1a736) {
        if (!isdefined(namespace_36f464722d326bbe::getlocaleid()) || !isdefined(loc.script_noteworthy) || loc.script_noteworthy != level.localeid) {
            continue;
        }
        if (!function_e844513ae4facc56(loc.refname, loc.origin)) {
            continue;
        }
        loc = function_4d91efcd80ff8810(loc.refname, loc);
        vehicleinfo = level.vehicleinfo[loc.refname];
        level thread [[ vehicleinfo.spawncallback ]](loc);
        if (0) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
            /#
                print3d(loc.origin, loc.refname + "game_ended" + loc.origin, (1, 0, 0), 1, 1, 100000, 1);
            #/
        }
        wait(randomfloatrange(2, 3));
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c71
// Size: 0x59
function vehiclespawn_littlebird(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("little_bird", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd2
// Size: 0x59
function vehiclespawn_atv(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("atv", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d33
// Size: 0x16b
function vehiclespawn_tank(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    spawndata.spawnmethod = "airdrop_at_position_unsafe";
    /#
        assert(isdefined(level.numhqtanks_axis), "level.numHQTanks_Axis is not defined.");
    #/
    /#
        assert(isdefined(level.numhqtanks_allies), "level.numHQTanks_Allies is not defined.");
    #/
    /#
        assert(isdefined(level.maxhqtanks), "level.maxHQTanks is not defined.");
    #/
    if (isdefined(loc.script_team) && loc.script_team == "axis") {
        if (level.numhqtanks_axis >= level.maxhqtanks) {
            return;
        }
        spawndata.var_14cde247ac3313a4 = "east";
        spawndata.team = "axis";
        level.numhqtanks_axis++;
    } else {
        if (level.numhqtanks_allies >= level.maxhqtanks) {
            return;
        }
        spawndata.var_14cde247ac3313a4 = "west";
        spawndata.team = "allies";
        level.numhqtanks_allies++;
    }
    var_fe827f03f6233be7 = namespace_1f188a13f7e79610::vehicle_spawn("light_tank", spawndata, var_ee8da5624236dc89);
    return var_fe827f03f6233be7;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea6
// Size: 0x59
function function_91397b675b427da6(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_rhib", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f07
// Size: 0x59
function function_9945b400b938a173(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_pwc", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f68
// Size: 0x59
function function_52e04331732241d7(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_jltv", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc9
// Size: 0x59
function function_4fbf67e0d91458f8(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_jltv_mg", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x202a
// Size: 0x59
function function_784aa0f6ee634ae5(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_suv_1996", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x208b
// Size: 0x59
function function_db3f4677d3b1ef4a(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_sedan_hatchback_1985", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ec
// Size: 0x59
function function_93f25760d0131658(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_mil_cargo_truck", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214d
// Size: 0x59
function function_c43c5200d882b134(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_utv", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ae
// Size: 0x59
function function_c6436c7f3e995d85(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_hummer", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220f
// Size: 0x59
function function_9d7d93def34d9958(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_overland_2016", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2270
// Size: 0x59
function function_a23b100003fc2003(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_acv_6x6", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d1
// Size: 0x59
function function_a566257e1d27492c(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh_jup_truck_tech_hmg", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2332
// Size: 0x59
function function_3086eb7fdb843535(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh_jup_orav", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2393
// Size: 0x97
function function_70199cf52bda53fa(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    spawndata.spawnmethod = "airdrop_at_position_unsafe";
    spawndata.var_14cde247ac3313a4 = ter_op(spawndata.team == "axis", "east", "west");
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_cougar", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2432
// Size: 0x97
function function_725c5ee265b286ce(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    spawndata.spawnmethod = "airdrop_at_position_unsafe";
    spawndata.var_14cde247ac3313a4 = ter_op(spawndata.team == "axis", "east", "west");
    return namespace_1f188a13f7e79610::vehicle_spawn("veh_jup_razorback", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d1
// Size: 0x59
function function_64440e5a2bfd8900(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_patrol_boat", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2532
// Size: 0x16
function function_505626ab02e6c2d6(vehicle) {
    level thread function_53f5eb5db0ae2aa1(vehicle);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x254f
// Size: 0x20
function private function_53f5eb5db0ae2aa1(vehicle) {
    flag_wait("spawn_areas_ready");
    namespace_fdd1a79841ab3fe7::rallypointvehicle_activate(vehicle);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2576
// Size: 0x96
function function_a53caaef0414a722(vehicle) {
    if (!istrue(level.showteamtanks)) {
        return;
    }
    switch (vehicle namespace_1f188a13f7e79610::function_d93ec4635290febd()) {
    case #"hash_cb2498c4a1e415fd":
        icon = "hud_icon_minimap_vehicle_tank_cougar";
        break;
    case #"hash_63cf913c1ee55d64":
        icon = "hud_icon_minimap_vehicle_razorback";
        break;
    case #"hash_7c54070d9b704f70":
    default:
        icon = "hud_icon_minimap_vehicle_tank_coscar";
        break;
    }
    level thread vehicle_createspawnselectiontankmarker(vehicle, vehicle.team, icon);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2613
// Size: 0x1c1
function vehicle_createspawnselectiontankmarker(vehicle, team, icon) {
    if (!isdefined(icon)) {
        icon = "hud_icon_minimap_vehicle_tank_coscar";
    }
    wait(1);
    marker = namespace_19b4203b51d56488::createobjidobject(vehicle.origin, team, (0, 0, 0), undefined, 0, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(marker.objidnum, team);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(marker.objidnum);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    namespace_5a22b6f3a56f7e9b::objective_pin_global(marker.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, icon);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(marker.objidnum, vehicle);
    marker.lockupdatingicons = 1;
    foreach (player in level.players) {
        if (isdefined(player) && isdefined(player.team) && player.team == team && istrue(player.inspawnselection)) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(marker.objidnum, player);
        }
    }
    vehicle.spawnselectionmarker = marker;
    thread vehicle_watchmarkedtankdeath(vehicle);
    level.trackedtanks[team][level.trackedtanks[team].size] = vehicle;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27db
// Size: 0x70
function vehicle_watchmarkedtankdeath(vehicle) {
    objidnum = vehicle.spawnselectionmarker.objidnum;
    team = vehicle.team;
    vehicle waittill("death");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(objidnum);
    level.trackedtanks[team] = array_remove(level.trackedtanks[team], vehicle);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2852
// Size: 0x168
function vehicle_showteamtanks() {
    self endon("disconnect");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (tank in level.trackedtanks[self.team]) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(tank.spawnselectionmarker.objidnum, self);
    }
    while (self.inspawnselection) {
        waitframe();
    }
    foreach (tank in level.trackedtanks["axis"]) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(tank.spawnselectionmarker.objidnum, self);
    }
    foreach (tank in level.trackedtanks["allies"]) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(tank.spawnselectionmarker.objidnum, self);
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c1
// Size: 0xa6
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    if (isdefined(loc.script_team)) {
        spawndata.team = ter_op(loc.script_team == "axis", "axis", "allies");
    }
    return spawndata;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6f
// Size: 0xaf
function droptank_playincomingdialog(spawndata) {
    team = spawndata.team;
    streakname = "bradley";
    if (level.teambased) {
        if (isdefined(level.killstreakactivatedtime[streakname])) {
            if (isdefined(level.killstreakactivatedtime[streakname][team])) {
                if (gettime() < level.killstreakactivatedtime[streakname][team]) {
                    return;
                }
            }
        }
        level.killstreakactivatedtime[streakname][team] = gettime() + namespace_9abe40d2af041eb2::getkillstreakdialogcooldown() * 1000;
    }
    leaderdialog(team + "_friendly_" + streakname + "_inbound", team, "killstreak_used");
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b25
// Size: 0x8c5
function init_rallyvehicles() {
    registersharedfunc("veh9_apc_8x8", "create", &function_505626ab02e6c2d6);
    registersharedfunc("veh9_palfa", "create", &function_505626ab02e6c2d6);
    registersharedfunc("veh9_patrol_boat", "create", &function_505626ab02e6c2d6);
    while (!isdefined(level.spawnselectionlocations)) {
        waitframe();
    }
    waitframe();
    level.rallypointvehicles = [];
    var_29354b69bd8def17 = "gw_vehicle_technical_";
    var_e6fe9018451c854c = "gw_vehicle_apc_";
    var_fb1d0f7637a20dd6 = "gw_vehicle_armored_boat_";
    var_b142fc4830a64bea = "gw_vehicle_littlebird_";
    var_60a367641181424c = [];
    var_605cd7ad6472b682 = [];
    var_7b2a53909cab7620 = [];
    foreach (team in level.teamnamelist) {
        var_60a367641181424c[team] = 0;
        var_605cd7ad6472b682[team] = 0;
        var_7b2a53909cab7620[team] = 0;
    }
    var_13b8accbd9c63733 = getstructarray("rallyPointAPC", "targetname");
    var_13b8accbd9c63733 = array_combine(var_13b8accbd9c63733, function_b08e7e3a0b14f76f("apc_russian"));
    var_13b8accbd9c63733 = array_combine(var_13b8accbd9c63733, function_b08e7e3a0b14f76f("veh9_apc_8x8"));
    foreach (loc in var_13b8accbd9c63733) {
        if (isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(loc.script_noteworthy) && loc.script_noteworthy != level.localeid) {
            continue;
        }
        if (!isdefined(loc.script_team)) {
            continue;
        }
        ref = ter_op(loc.targetname == "apc_8x8_spawn", "veh9_apc_8x8", "apc_russian");
        if (!function_e844513ae4facc56(ref, loc.origin)) {
            continue;
        }
        loc = function_4d91efcd80ff8810(ref, loc);
        if (0) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
            /#
                print3d(loc.origin, ref + "game_ended" + loc.origin, (1, 0, 0), 1, 1, 100000, 1);
            #/
        }
        /#
            issharedfuncdefined("level.numHQTanks_Allies is not defined.", "_friendly_", 1);
        #/
        if (![[ getsharedfunc("vehicle_spawn", "canSpawnVehicle") ]](ref)) {
            continue;
        }
        team = ter_op(loc.script_team == "axis", "axis", "allies");
        var_da3668523170ea04 = undefined;
        var_605cd7ad6472b682[team]++;
        if (var_605cd7ad6472b682[team] <= 2) {
            var_da3668523170ea04 = var_e6fe9018451c854c + var_605cd7ad6472b682[team];
        } else {
            /#
                assert(0, "Mode supports only 2 Rally Point APCs per team. You are trying to spawn more than 2 for Axis.");
            #/
        }
        spawndata = getrallyvehiclespawndata(loc, team, var_da3668523170ea04);
        if (loc.targetname == "apc_8x8_spawn") {
            spawndata.var_14cde247ac3313a4 = ter_op(team == "axis", "east", "west");
        }
        var_ee8da5624236dc89 = spawnstruct();
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn(ref, spawndata, var_ee8da5624236dc89);
        if (isdefined(vehicle)) {
            level.rallypointvehicles[level.rallypointvehicles.size] = vehicle;
        }
    }
    var_13b8accbd9c63733 = getstructarray("rallyPointArmoredBoat", "targetname");
    var_13b8accbd9c63733 = array_combine(var_13b8accbd9c63733, function_b08e7e3a0b14f76f("veh9_patrol_boat"));
    foreach (loc in var_13b8accbd9c63733) {
        if (isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(loc.script_noteworthy) && loc.script_noteworthy != level.localeid) {
            continue;
        }
        if (!isdefined(loc.script_team)) {
            continue;
        }
        /#
            issharedfuncdefined("level.numHQTanks_Allies is not defined.", "_friendly_", 1);
        #/
        if (![[ getsharedfunc("vehicle_spawn", "canSpawnVehicle") ]]("veh9_patrol_boat")) {
            continue;
        }
        if (!function_e844513ae4facc56("veh9_patrol_boat", loc.origin)) {
            continue;
        }
        loc = function_4d91efcd80ff8810("veh9_patrol_boat", loc);
        if (0) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
            /#
                print3d(loc.origin, "spawnPlayerToC130" + "game_ended" + loc.origin, (1, 0, 0), 1, 1, 100000, 1);
            #/
        }
        team = ter_op(loc.script_team == "axis", "axis", "allies");
        var_da3668523170ea04 = undefined;
        var_7b2a53909cab7620[team]++;
        if (var_7b2a53909cab7620[team] <= 2) {
            var_da3668523170ea04 = var_fb1d0f7637a20dd6 + var_7b2a53909cab7620[team];
        } else {
            /#
                assert(0, "Mode supports only 2 Rally Point Armored Patrol Boats per team. You are trying to spawn more than 2 for Axis.");
            #/
        }
        spawndata = getrallyvehiclespawndata(loc, team, var_da3668523170ea04);
        spawndata.var_14cde247ac3313a4 = ter_op(team == "axis", "east", "west");
        var_ee8da5624236dc89 = spawnstruct();
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn("veh9_patrol_boat", spawndata, var_ee8da5624236dc89);
        if (isdefined(vehicle)) {
            level.rallypointvehicles[level.rallypointvehicles.size] = vehicle;
        }
    }
    foreach (loc in function_b08e7e3a0b14f76f("veh9_palfa")) {
        if (isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(loc.script_noteworthy) && loc.script_noteworthy != level.localeid) {
            continue;
        }
        if (!isdefined(loc.script_team)) {
            continue;
        }
        /#
            issharedfuncdefined("level.numHQTanks_Allies is not defined.", "_friendly_", 1);
        #/
        if (![[ getsharedfunc("vehicle_spawn", "canSpawnVehicle") ]]("veh9_palfa")) {
            continue;
        }
        if (!function_e844513ae4facc56("veh9_palfa", loc.origin)) {
            continue;
        }
        loc = function_4d91efcd80ff8810("veh9_palfa", loc);
        if (0) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
            /#
                print3d(loc.origin, "<unknown string>" + "game_ended" + loc.origin, (1, 0, 0), 1, 1, 100000, 1);
            #/
        }
        team = ter_op(loc.script_team == "axis", "axis", "allies");
        var_da3668523170ea04 = undefined;
        var_60a367641181424c[team]++;
        if (var_60a367641181424c[team] <= 2) {
            var_da3668523170ea04 = var_b142fc4830a64bea + var_60a367641181424c[team];
        } else {
            /#
                assert(0, "Mode supports only 2 Rally Point PALFAs per team. You are trying to spawn more than 2 for Axis.");
            #/
        }
        spawndata = getrallyvehiclespawndata(loc, team, var_da3668523170ea04);
        spawndata.var_14cde247ac3313a4 = ter_op(team == "axis", "east", "west");
        var_ee8da5624236dc89 = spawnstruct();
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn("veh9_palfa", spawndata, var_ee8da5624236dc89);
        if (isdefined(vehicle)) {
            level.rallypointvehicles[level.rallypointvehicles.size] = vehicle;
        }
    }
    foreach (entry in level.teamnamelist) {
        while (!isdefined(level.availablespawnlocations[entry][0])) {
            waitframe();
        }
    }
    flag_set("spawn_areas_ready");
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f1
// Size: 0x94
function getrallyvehiclespawndata(loc, team, var_da3668523170ea04) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.cannotbesuspended = 1;
    spawndata.ref = var_da3668523170ea04;
    spawndata.team = team;
    return spawndata;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x348d
// Size: 0x524
function managec130spawns() {
    level endon("game_ended");
    var_33bbc02aca0008b = 6000;
    var_fdfe2d4aaf8ec33d = 12000;
    var_f382830cb3a96bf9 = 20000;
    var_b34d9378696e10bb = 1;
    var_2b4ee773f94cedcf = (0, 0, 6000);
    level.timebetweenc130passes = 0;
    level.flighttime = 20;
    level.spawnc130 = [];
    foreach (entry in level.teamnamelist) {
        level.spawnc130[entry] = undefined;
    }
    c130_pickrandomflightpath();
    level.spawnc130["axis"] = createc130("axis", level.c130pathstruct_a.startpt + var_2b4ee773f94cedcf);
    level.spawnc130["allies"] = createc130("allies", level.c130pathstruct_b.startpt + var_2b4ee773f94cedcf);
    while (!isdefined(level.spawnselectionlocations)) {
        waitframe();
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        if (!isdefined(level.timeuntilnextc130)) {
            level.timeuntilnextc130 = [];
        }
        if (!isdefined(level.timeuntilnextc130["axis"])) {
            level.timeuntilnextc130["axis"] = 0;
        }
        if (!isdefined(level.timeuntilnextc130["allies"])) {
            level.timeuntilnextc130["allies"] = 0;
        }
        timeuntilnextc130 = gettime() + (level.flighttime + level.timebetweenc130passes) * 1000;
        level.timeuntilnextc130["axis"] = timeuntilnextc130;
        level.timeuntilnextc130["allies"] = timeuntilnextc130;
        if (0) {
            thread drawline(level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, 1000, (1, 0, 0));
            thread drawline(level.c130pathstruct_b.startpt, level.c130pathstruct_b.endpt, 1000, (0, 0, 1));
        }
        if (var_b34d9378696e10bb) {
            level.spawnc130["axis"] thread handlec130motion(level.c130pathstruct_a.startpt + var_2b4ee773f94cedcf, level.c130pathstruct_a.endpt + var_2b4ee773f94cedcf, level.flighttime, "axis");
            level.spawnc130["allies"] thread handlec130motion(level.c130pathstruct_b.startpt + var_2b4ee773f94cedcf, level.c130pathstruct_b.endpt + var_2b4ee773f94cedcf, level.flighttime, "allies");
        } else {
            level.spawnc130["axis"] thread handlec130motion(level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, level.flighttime, "axis");
            level.spawnc130["allies"] thread handlec130motion(level.c130pathstruct_b.startpt, level.c130pathstruct_b.endpt, level.flighttime, "allies");
        }
        level.c130firstpassstarted = 1;
        level waittill_all_in_array([0:"C130_path_complete_axis", 1:"C130_path_complete_allies"]);
        c130_fightpathmove();
        var_ad5699efe91e15cf = level.c130pathstruct_a.startpt;
        level.c130pathstruct_a.startpt = level.c130pathstruct_a.endpt;
        level.c130pathstruct_a.endpt = var_ad5699efe91e15cf;
        var_ad5699efe91e15cf = level.c130pathstruct_b.startpt;
        level.c130pathstruct_b.startpt = level.c130pathstruct_b.endpt;
        level.c130pathstruct_b.endpt = var_ad5699efe91e15cf;
        var_b34d9378696e10bb = 0;
        if (istrue(level.usec130spawnfirstonly)) {
            level.usec130spawn = 0;
            break;
        }
    }
    namespace_8e28f8b325a83325::removedynamicspawnarea("axis", "dynamic_c130");
    namespace_8e28f8b325a83325::removedynamicspawnarea("allies", "dynamic_c130");
    namespace_8e28f8b325a83325::removespawnlocation("dynamic_c130", "axis");
    namespace_8e28f8b325a83325::removespawnlocation("dynamic_c130", "allies");
    level.spawnc130["axis"] delete();
    level.spawnc130["allies"] delete();
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b8
// Size: 0x112
function createc130(team, startpt) {
    gunship = spawn("script_model", startpt);
    gunship setmodel("veh8_mil_air_acharlie130");
    gunship setcandamage(0);
    gunship.maxhealth = 100000;
    gunship.health = gunship.maxhealth;
    gunship.playeroffsets = [0:(32, 30, 0), 1:(-32, 30, 0), 2:(0, 30, 0), 3:(16, 30, 0), 4:(-16, 30, 0)];
    gunship.currentplayeroffset = 0;
    gunship.respawnqueue = [];
    gunship.players = [];
    gunship.team = team;
    gunship playloopsound("iw8_ks_ac130_lp");
    gunship thread namespace_ad389306d44fc6b4::gunship_spawnvfx();
    return gunship;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad2
// Size: 0x1f0
function handlec130motion(startpt, endpt, time, team) {
    toend = vectornormalize(endpt - startpt);
    dist = distance(endpt, startpt);
    var_92a519173221837e = startpt + toend * dist * 0.425;
    var_e7c3539b6fc3114f = startpt + toend * dist * 0.55;
    var_3cf9c28b9cfcbdfc = time * 0.3;
    var_c27959a7028db85c = time * 0.6;
    var_678ae55ddf94d0bd = time * 0.1;
    self.canjoin = 1;
    self.canparachute = 0;
    dir = vectornormalize(endpt - startpt);
    self.angles = vectortoangles(dir);
    self.origin = startpt;
    gatherc130playerstospawn();
    self moveto(endpt, var_3cf9c28b9cfcbdfc + var_c27959a7028db85c + var_678ae55ddf94d0bd, var_3cf9c28b9cfcbdfc * 0.25);
    wait(var_3cf9c28b9cfcbdfc);
    self.canparachute = 1;
    foreach (p in self.players) {
        p notify("canParachute");
    }
    wait(var_c27959a7028db85c);
    self.canjoin = 0;
    self.canparachute = 0;
    foreach (p in self.players) {
        p notify("halo_kick_c130");
    }
    wait(var_678ae55ddf94d0bd);
    level notify("C130_path_complete_" + team);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cc9
// Size: 0x10f
function gatherc130playerstospawn() {
    self.players = array_combine(self.players, self.respawnqueue);
    self.respawnqueue = [];
    radius = 1400;
    spawnoffset = (30, 0, 0);
    initialoffset = anglestoforward(spawnoffset) * radius * -1;
    spawnpos = self gettagorigin("tag_origin") + initialoffset;
    var_b7850001037aa074 = self.angles;
    foreach (p in self.players) {
        if (!isdefined(p)) {
            continue;
        }
        p.forcespawncameraorg = spawnpos;
        p.forcespawncameraang = var_b7850001037aa074;
        p notify("c130_ready");
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ddf
// Size: 0x15
function removefromspawnselectionaftertime(time) {
    wait(time);
    removefromspawnselection();
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dfb
// Size: 0x2d
function removefromspawnselection() {
    namespace_8e28f8b325a83325::removedynamicspawnarea(self.team, "dynamic_c130");
    namespace_8e28f8b325a83325::removespawnlocation("dynamic_c130", self.team);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e2f
// Size: 0x103
function spawnplayertoc130() {
    self endon("disconnect");
    if (!isdefined(level.spawnc130[self.team])) {
        return;
    }
    self waittill("spawn_camera_idle");
    c130 = level.spawnc130[self.team];
    c130.respawnqueue[c130.respawnqueue.size] = self;
    if (istrue(c130.canjoin)) {
        c130 gatherc130playerstospawn();
    }
    if (istrue(self.inspawncamera)) {
        self waittill("spawn_camera_complete");
    } else {
        self waittill("spawned_player");
    }
    val::set("spawnPlayerToC130", "killstreaks", 0);
    self disableusability();
    self disableoffhandweapons();
    self allowmelee(0);
    self allowads(0);
    self allowfire(0);
    self setcandamage(0);
    thread jumplistener(c130, 0);
    self.br_infil_type = "c130";
    if (!isbot(self)) {
        thread namespace_ad389306d44fc6b4::orbitcam(c130);
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f39
// Size: 0x6b
function jumplistener(c130, var_1b89121ef11344d5) {
    level endon("game_ended");
    self endon("disconnect");
    self notify("jumpListener()");
    self endon("jumpListener()");
    if (isdefined(self.parachute)) {
        self.parachute delete();
    }
    self.c130 = c130;
    thread listenjump(c130, var_1b89121ef11344d5);
    thread listenkick(c130, var_1b89121ef11344d5);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fab
// Size: 0x93
function listenkick(c130, var_a3f91a4a7069575) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("br_jump");
    self notify("listenKick()");
    self endon("listenKick()");
    self waittill("halo_kick_c130");
    self cameradefault();
    self unlink();
    wait(0.1);
    if (self.sessionstate == "spectator") {
        return;
    }
    var_f9805aad354a150e = c130 namespace_5dd9c938a1d0a5bf::calctrailpoint();
    thread parachute(c130, var_a3f91a4a7069575);
    self notify("br_jump");
    self notify("stop_cam_shake");
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4045
// Size: 0xfb
function listenjump(c130, var_1b89121ef11344d5) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("br_jump");
    self notify("listenJump()");
    self endon("listenJump()");
    self notifyonplayercommand("halo_jump_c130", "+gostand");
    while (1) {
        result = waittill_either("halo_jump_c130", "canParachute");
        if (isdefined(result) && result == "canParachute") {
            self iprintlnbold("Press Jump to Parachute!");
        } else if (!istrue(c130.canparachute)) {
            self iprintlnbold("Not over the AO");
        } else {
            break;
        }
        if (self.sessionstate == "spectator") {
            return;
        }
    }
    /#
        println("<unknown string>");
    #/
    self cameradefault();
    self unlink();
    wait(0.1);
    thread parachute(c130, var_1b89121ef11344d5);
    self notify("br_jump");
    self notify("stop_cam_shake");
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4147
// Size: 0x1bf
function parachute(c130, var_1b89121ef11344d5) {
    self endon("jumpListener()");
    self notify("parachute()");
    self endon("parachute()");
    if (self.team == "axis") {
        var_69dbcc65237ec970 = level.c130pathstruct_b.midpt;
    } else {
        var_69dbcc65237ec970 = level.c130pathstruct_a.midpt;
    }
    var_c4e660d969dceee5 = vectornormalize(var_69dbcc65237ec970 - c130.origin);
    c130.players = array_remove(c130.players, self);
    if (isdefined(c130.playeroffsets) && isdefined(c130.currentplayeroffset)) {
        offset = c130.playeroffsets[c130.currentplayeroffset];
        self setorigin(c130.origin + offset, 1, 1);
        c130.currentplayeroffset++;
        if (c130.currentplayeroffset == c130.playeroffsets.size) {
            c130.currentplayeroffset = 0;
        }
    } else {
        var_e03cc98b6b9a9f1c = anglestoforward(c130.angles) * c130.br_vieworigin;
        self setorigin(c130.origin + var_e03cc98b6b9a9f1c, 1, 1);
    }
    waitframe();
    namespace_f8065cafc523dba5::function_6fb380927695ee76();
    namespace_f8065cafc523dba5::function_985b0973f29da4f8("arm_vehicles::parachute()");
    self.plotarmor = 0;
    self.c130 = undefined;
    self setplayerangles(vectortoangles(var_c4e660d969dceee5));
    thread namespace_5078ee98abb32db9::startfreefall(5, 0);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x430d
// Size: 0x166
function debug_randomflightpathstest() {
    wait(10);
    while (1) {
        c130_pickrandomflightpath();
        level.c130pathstruct_a.startpt = level.c130pathstruct_a.startpt - (0, 0, 10000);
        level.c130pathstruct_a.endpt = level.c130pathstruct_a.endpt - (0, 0, 10000);
        level.c130pathstruct_b.startpt = level.c130pathstruct_b.startpt - (0, 0, 10000);
        level.c130pathstruct_b.endpt = level.c130pathstruct_b.endpt - (0, 0, 10000);
        thread drawline(level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, 1, (1, 0, 1));
        thread drawline(level.c130pathstruct_b.startpt, level.c130pathstruct_b.endpt, 1, (1, 0, 1));
        wait(1);
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447a
// Size: 0x507
function c130_pickrandomflightpath() {
    if (istrue(level.c130alignedtolocale) && istrue(level.useobjectives)) {
        mapcenter = (level.gw_objstruct.axishqloc.trigger.origin + level.gw_objstruct.allieshqloc.trigger.origin) * 0.5;
        var_f3c9e115b49a626a = vectortoangles(level.gw_objstruct.axishqloc.trigger.origin - level.gw_objstruct.allieshqloc.trigger.origin);
        angle = var_f3c9e115b49a626a[1];
        if (0) {
            thread drawsphere(mapcenter, 1000, 100000, (0, 1, 0));
        }
    } else {
        mapcenter = (level.mapsafecorners[0] + level.mapsafecorners[1]) * 0.5;
        angle = randomfloatrange(0, 359);
    }
    var_15c3cd2dab9ea60c = makec130pathparamsstruct(mapcenter, angle - 90);
    level.c130pathstruct_a = namespace_ad389306d44fc6b4::makepathstruct(var_15c3cd2dab9ea60c);
    var_15c3cd2dab9ea60c.randomangle = var_15c3cd2dab9ea60c.randomangle + 180;
    level.c130pathstruct_b = namespace_ad389306d44fc6b4::makepathstruct(var_15c3cd2dab9ea60c);
    var_3abadab203328ad1 = 0.2;
    var_b4885b21fe401ac5 = 0;
    var_a433228cdfb64c3a = 0;
    if (istrue(level.c130spacing_usebigmapsettings)) {
        var_3abadab203328ad1 = 0.1;
        var_b4885b21fe401ac5 = randomfloatrange(-5000, 5000);
        var_a433228cdfb64c3a = randomfloatrange(-5000, 5000);
    }
    right = anglestoright(level.c130pathstruct_a.angle);
    level.c130pathstruct_a.startpt = right * level.c130distapart + level.c130pathstruct_a.startpt;
    level.c130pathstruct_a.endpt = right * level.c130distapart + level.c130pathstruct_a.endpt;
    right = anglestoright(level.c130pathstruct_b.angle);
    level.c130pathstruct_b.startpt = right * level.c130distapart + level.c130pathstruct_b.startpt;
    level.c130pathstruct_b.endpt = right * level.c130distapart + level.c130pathstruct_b.endpt;
    offset = (var_b4885b21fe401ac5, var_a433228cdfb64c3a, 0);
    level.c130pathstruct_a.startpt = level.c130pathstruct_a.startpt + offset;
    level.c130pathstruct_a.endpt = level.c130pathstruct_a.endpt + offset;
    level.c130pathstruct_a.midpt = vectorlerp(level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, 0.5);
    level.c130pathstruct_b.startpt = level.c130pathstruct_b.startpt + offset;
    level.c130pathstruct_b.endpt = level.c130pathstruct_b.endpt + offset;
    level.c130pathstruct_b.midpt = vectorlerp(level.c130pathstruct_b.startpt, level.c130pathstruct_b.endpt, 0.5);
    level.battlecenter = vectorlerp(level.c130pathstruct_a.midpt, level.c130pathstruct_b.midpt, 0.5);
    level.c130minpathmovementinterval = vectorlerp(level.c130pathstruct_a.startpt, level.c130pathstruct_b.endpt, var_3abadab203328ad1);
    level.c130minpathmovementinterval = level.c130minpathmovementinterval - level.c130pathstruct_a.startpt;
    level.c130minpathmovementinterval = vectornormalize(level.c130minpathmovementinterval) * level.c130distapart / 10;
    level.c130minpathmovementinterval = (level.c130minpathmovementinterval[0], level.c130minpathmovementinterval[1], 0);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4988
// Size: 0x97
function makec130pathparamsstruct(centerpt, angle) {
    var_f94f9769a1f2d802 = 6.28318;
    randomangle = angle;
    endangleoffset = 180;
    r = level.c130flightdist;
    var_cd37ce775909957b = spawnstruct();
    var_cd37ce775909957b.r = r;
    var_cd37ce775909957b.randomangle = randomangle;
    var_cd37ce775909957b.endangleoffset = endangleoffset;
    var_cd37ce775909957b.centerpt = centerpt;
    return var_cd37ce775909957b;
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a27
// Size: 0x673
function c130_fightpathmove() {
    if (0) {
        level.c130movementmethod = 2;
    }
    if (level.c130movementmethod == 0) {
        return;
    } else if (level.c130movementmethod == 1) {
        if (0) {
            level.c130pathkilltracker["axis"] = 1;
            level.c130pathkilltracker["allies"] = 0;
        }
        if (level.c130pathkilltracker["axis"] > level.c130pathkilltracker["allies"]) {
            if (arenextpathsinsafebounds(level.c130minpathmovementinterval)) {
                level.c130pathstruct_a.startpt = level.c130pathstruct_a.startpt + level.c130minpathmovementinterval;
                level.c130pathstruct_a.endpt = level.c130pathstruct_a.endpt + level.c130minpathmovementinterval;
                level.c130pathstruct_b.startpt = level.c130pathstruct_b.startpt + level.c130minpathmovementinterval;
                level.c130pathstruct_b.endpt = level.c130pathstruct_b.endpt + level.c130minpathmovementinterval;
            }
        } else if (arenextpathsinsafebounds(level.c130minpathmovementinterval * -1)) {
            level.c130pathstruct_a.startpt = level.c130pathstruct_a.startpt - level.c130minpathmovementinterval;
            level.c130pathstruct_a.endpt = level.c130pathstruct_a.endpt - level.c130minpathmovementinterval;
            level.c130pathstruct_b.startpt = level.c130pathstruct_b.startpt - level.c130minpathmovementinterval;
            level.c130pathstruct_b.endpt = level.c130pathstruct_b.endpt - level.c130minpathmovementinterval;
        }
        level.c130pathstruct_a.midpt = vectorlerp(level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, 0.5);
        level.c130pathstruct_b.midpt = vectorlerp(level.c130pathstruct_b.startpt, level.c130pathstruct_b.endpt, 0.5);
        level.c130pathkilltracker["axis"] = 0;
        level.c130pathkilltracker["allies"] = 0;
    } else if (level.c130movementmethod == 2) {
        var_d320310339164aac = (0, 0, 0);
        var_ee6d8b534c2ddd2d = (0, 0, 0);
        var_6d48eb54c3a800fc = 0;
        var_9297d08353baf063 = 0;
        foreach (player in level.players) {
            if (isalive(player)) {
                if (player.team == "axis") {
                    var_d320310339164aac = var_d320310339164aac + player.origin;
                    var_6d48eb54c3a800fc++;
                } else if (player.team == "allies") {
                    var_ee6d8b534c2ddd2d = var_ee6d8b534c2ddd2d + player.origin;
                    var_9297d08353baf063++;
                }
            }
        }
        if (var_6d48eb54c3a800fc == 0 || var_9297d08353baf063 == 0) {
            return;
        }
        axiscenter = var_d320310339164aac / var_6d48eb54c3a800fc;
        alliescenter = var_ee6d8b534c2ddd2d / var_9297d08353baf063;
        var_be2c550023fb372 = vectorlerp(axiscenter, alliescenter, 0.5);
        level.c130minpathmovementinterval = vectorlerp(level.battlecenter, var_be2c550023fb372, 0.5);
        level.c130minpathmovementinterval = level.c130minpathmovementinterval - level.battlecenter;
        var_37dfb4f272c7016d = distance2d(level.battlecenter, var_be2c550023fb372);
        level.c130minpathmovementinterval = vectornormalize(level.c130minpathmovementinterval) * var_37dfb4f272c7016d / 4;
        level.c130minpathmovementinterval = (level.c130minpathmovementinterval[0], level.c130minpathmovementinterval[1], 0);
        if (arenextpathsinsafebounds(level.c130minpathmovementinterval)) {
            level.c130pathstruct_a.startpt = level.c130pathstruct_a.startpt + level.c130minpathmovementinterval;
            level.c130pathstruct_a.endpt = level.c130pathstruct_a.endpt + level.c130minpathmovementinterval;
            level.c130pathstruct_a.midpt = vectorlerp(level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, 0.5);
            level.c130pathstruct_b.startpt = level.c130pathstruct_b.startpt + level.c130minpathmovementinterval;
            level.c130pathstruct_b.endpt = level.c130pathstruct_b.endpt + level.c130minpathmovementinterval;
            level.c130pathstruct_b.midpt = vectorlerp(level.c130pathstruct_b.startpt, level.c130pathstruct_b.endpt, 0.5);
            if (0) {
                thread drawsphere(level.battlecenter, 1000, 700, (1, 0, 0));
                thread drawsphere(var_be2c550023fb372, 1000, 700, (0, 1, 0));
            }
            level.battlecenter = level.battlecenter + level.c130minpathmovementinterval;
        }
    }
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50a1
// Size: 0x84
function arenextpathsinsafebounds(offset) {
    return ispointinsafebounds(level.c130pathstruct_a.startpt + offset) && ispointinsafebounds(level.c130pathstruct_a.endpt + offset) && ispointinsafebounds(level.c130pathstruct_b.startpt + offset) && ispointinsafebounds(level.c130pathstruct_b.endpt + offset);
}

// Namespace namespace_569cc561791f82ef/namespace_35f66e61f847336c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x512d
// Size: 0x62
function ispointinsafebounds(var_cdcd3178f5176585) {
    return var_cdcd3178f5176585[0] < level.mapsafecorners[0][0] && var_cdcd3178f5176585[0] > level.mapsafecorners[1][0] && var_cdcd3178f5176585[1] < level.mapsafecorners[0][1] && var_cdcd3178f5176585[1] > level.mapsafecorners[1][1];
}

