// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_67fb1233e876ed8;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\stealth\event.gsc;

#namespace vehicle_interact;

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac5
// Size: 0x114
function vehicle_interact_getleveldataforvehicle(vehicleRef, create, var_6ecb77fd1f27c667) {
    if (istrue(create) && (!function_89dc39dc11f3988c(vehicleRef) || !isdefined(function_29b4292c92443328(vehicleRef).interact))) {
        data = undefined;
        if (!function_89dc39dc11f3988c(vehicleRef)) {
            data = spawnstruct();
        } else {
            data = function_29b4292c92443328(vehicleRef);
        }
        if (!isdefined(data.interact)) {
            data.interact = spawnstruct();
        }
        data.interact.var_ed5c39e0b1ef815c = [];
        data.interact.var_29f1ea79ed2b40dd = 180;
        data.interact.var_4c6d695d0920df19 = 130;
        data.interact.var_4c4a7b5d08fabef7 = 170;
        level.var_a0b2c978ca57ffc5[vehicleRef] = data;
    }
    if (function_89dc39dc11f3988c(vehicleRef)) {
        return function_29b4292c92443328(vehicleRef).interact;
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe0
// Size: 0x155
function vehicle_interact_getinstancedataforvehicle(vehicle, create, var_6ecb77fd1f27c667) {
    if (getdvarint(@"hash_74cacae425805743", 0) > 0) {
        return undefined;
    }
    var_e2818ad39a3341b4 = vehicle_interact_getleveldataforvehicle(vehicle.vehiclename, create, var_6ecb77fd1f27c667);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return undefined;
    }
    if (!isdefined(vehicle getlinkedscriptableinstance())) {
        return undefined;
    }
    var_72141eab56fb408f = vehicle.interactdata;
    if (!isdefined(var_72141eab56fb408f)) {
        if (istrue(create)) {
            var_72141eab56fb408f = spawnstruct();
            vehicle.interactdata = var_72141eab56fb408f;
            var_72141eab56fb408f.disabledbyallow = 0;
            var_72141eab56fb408f.pointdata = [];
            foreach (var_15fcf7d846a9d9a in var_e2818ad39a3341b4.var_ed5c39e0b1ef815c) {
                var_72141eab56fb408f.pointdata[var_15fcf7d846a9d9a] = vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a, create, var_6ecb77fd1f27c667);
            }
            var_72141eab56fb408f.dirty = 1;
            var_72141eab56fb408f.disabled = undefined;
            var_72141eab56fb408f.availableteam = undefined;
        } else {
            /#
                assertex(istrue(var_6ecb77fd1f27c667), "vehicle_interact_getInstanceDataForVehicle called with an invalid vehicle.");
            #/
        }
    }
    return var_72141eab56fb408f;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3d
// Size: 0x91
function function_3e11a192d07b42ea(vehicleRef, var_15fcf7d846a9d9a, var_1226c93ad199f9f1) {
    var_e2818ad39a3341b4 = vehicle_interact_getleveldataforvehicle(vehicleRef, undefined, 1);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return;
    }
    var_1b7218958dc3b187 = function_247ff3bb886c55ff(var_15fcf7d846a9d9a);
    /#
        /#
            assertex(isdefined(var_1b7218958dc3b187), "vehicle_interact_getInstanceDataForPoint called with an invalid pointRef." + var_15fcf7d846a9d9a + "current");
        #/
    #/
    var_e2818ad39a3341b4.var_ed5c39e0b1ef815c = namespace_3c37cb17ade254d::array_add(var_e2818ad39a3341b4.var_ed5c39e0b1ef815c, var_15fcf7d846a9d9a);
    function_cf0f83cc6e448deb("activate", var_15fcf7d846a9d9a, var_1226c93ad199f9f1, var_e2818ad39a3341b4);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd5
// Size: 0x43
function vehicle_interact_registerinstance(vehicle) {
    vehicle_interact_getinstancedataforvehicle(vehicle, 1);
    vehicle_interact_makeusable(vehicle);
    levelData = vehicle_interact_getleveldata();
    levelData.vehicles[vehicle getentitynumber()] = vehicle;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1f
// Size: 0x58
function vehicle_interact_deregisterinstance(vehicle) {
    levelData = vehicle_interact_getleveldata();
    if (isdefined(levelData.vehicles[vehicle getentitynumber()])) {
        vehicle_interact_makeunusable(vehicle);
    }
    levelData.vehicles[vehicle getentitynumber()] = undefined;
    vehicle.interactdata = undefined;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7e
// Size: 0x18
function vehicle_interact_instanceisregistered(vehicle) {
    return isdefined(vehicle.interactdata);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9e
// Size: 0x147
function vehicle_interact_allowvehicleuseglobal(bool) {
    levelData = vehicle_interact_getleveldata();
    if (!isdefined(levelData.vehicles)) {
        return;
    }
    if (!bool) {
        levelData.disabledbyallow++;
        if (levelData.disabledbyallow == 1) {
            foreach (vehicle in levelData.vehicles) {
                vehicle_interact_setvehicledirty(vehicle);
                vehicle_interact_updateusability(vehicle);
            }
        }
    } else {
        /#
            assertex(levelData.disabledbyallow > 0, "vehicle_interact_allowVehicleUseGlobal(" + bool + ") called when use is already allowed.");
        #/
        levelData.disabledbyallow--;
        if (levelData.disabledbyallow == 0) {
            foreach (vehicle in levelData.vehicles) {
                vehicle_interact_setvehicledirty(vehicle);
                vehicle_interact_updateusability(vehicle);
            }
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfec
// Size: 0xb2
function vehicle_interact_allowvehicleuse(vehicle, bool) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return;
    }
    if (!bool) {
        var_72141eab56fb408f.disabledbyallow++;
        if (var_72141eab56fb408f.disabledbyallow == 1) {
            vehicle_interact_setvehicledirty(vehicle);
            vehicle_interact_updateusability(vehicle);
        }
    } else {
        /#
            assertex(var_72141eab56fb408f.disabledbyallow > 0, "vehicle_interact_allowVehicleUse(" + bool + ") called when use is already allowed.");
        #/
        var_72141eab56fb408f.disabledbyallow--;
        if (var_72141eab56fb408f.disabledbyallow == 0) {
            vehicle_interact_setvehicledirty(vehicle);
            vehicle_interact_updateusability(vehicle);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a5
// Size: 0x130
function vehicle_interact_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_interact_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.interact), "vehicle_interact_init() should only be called once.");
    #/
    levelData = spawnstruct();
    level.vehicle.interact = levelData;
    levelData.vehicledata = [];
    levelData.var_ed5c39e0b1ef815c = [];
    levelData.disabledbyallow = 0;
    function_bfc085ddf18e1712("single", &function_f1f336c41f281c07, &function_cd93c6e46bc00381, &function_39c1f2552dcfd9b0, &function_c9601fed18d5b11e);
    function_bfc085ddf18e1712("upgrade", &function_2b58c6eeaea42c35, &function_d2b057155910001b, &function_2bc48c2bcc22a4fe, &function_bd192331e198be64);
    function_bfc085ddf18e1712("copyofupgrade", &function_2b58c6eeaea42c35, &function_d2b057155910001b, &function_2bc48c2bcc22a4fe, &function_bd192331e198be64);
    level thread function_f588087bf9d7fefb();
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&vehicle_interact_scriptableused);
    if (issharedfuncdefined("vehicle_interact", "init", 1)) {
        [[ getsharedfunc("vehicle_interact", "init") ]]();
    }
    level thread function_ae4888c247642906();
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11dc
// Size: 0x7f
function function_356ea06606d08642(player) {
    level endon("game_ended");
    player endon("disconnect");
    while (1) {
        notification = player waittill("luinotifyserver");
        if (!isdefined(notification)) {
            continue;
        }
        var_6681408ac5fcc6cf = player.pers["telemetry"];
        if (notification == "vehicle_cruise_control_on" && isdefined(var_6681408ac5fcc6cf.vehicle_autofwd_count)) {
            var_6681408ac5fcc6cf.vehicle_autofwd_count++;
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1262
// Size: 0x20
function function_ae4888c247642906() {
    while (1) {
        waitframe();
        waittillframeend();
        level.vehicle.partition = undefined;
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1289
// Size: 0xd6
function function_79e9116ebf7dc551() {
    if (isdefined(level.vehicle.partition)) {
        return;
    }
    vehicles = vehicle_interact_getleveldata().vehicles;
    if (isdefined(vehicles) && vehicles.size > 0) {
        level.vehicle.partition = function_21a6a1c613b50a28([], 650);
        foreach (vehicle in vehicles) {
            if (isdefined(vehicle) && isdefined(vehicle.origin)) {
                level.vehicle.partition function_24bbefb4beda630d(vehicle);
            }
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1366
// Size: 0x9b
function function_bfc085ddf18e1712(var_15fcd7d846a9934, var_da1c69068b772b09, var_9182c2dd101ae147, activatefunc, var_b5f98a8061379598) {
    levelData = vehicle_interact_getleveldata();
    var_277a287ab71bb547 = spawnstruct();
    callbacks = [];
    callbacks["useInstance"] = var_da1c69068b772b09;
    callbacks["cleanInstance"] = var_9182c2dd101ae147;
    callbacks["activate"] = activatefunc;
    callbacks["createInstance"] = var_b5f98a8061379598;
    var_277a287ab71bb547.callbacks = callbacks;
    levelData.var_ed5c39e0b1ef815c[var_15fcd7d846a9934] = var_277a287ab71bb547;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1408
// Size: 0xc0
function vehicle_interact_scriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (state == "vehicle_use") {
        vehicle = instance.entity;
        var_15fcf7d846a9d9a = part;
        /#
            assertex(isdefined(vehicle), "vehicle_interact_scriptableUsed called on an entityless scriptable.");
        #/
        if (vehicle_interact_playercanusevehicles(player)) {
            if (istrue(vehicle_interact_vehiclecanbeused(vehicle))) {
                if (vehicle_interact_playercanusevehicle(player, vehicle)) {
                    if (vehicle_interact_pointcanbeused(vehicle, var_15fcf7d846a9d9a)) {
                        var_1f4cf79f66927511 = vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a);
                        function_cf0f83cc6e448deb("useInstance", var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle, player);
                    }
                }
            }
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14cf
// Size: 0xf7
function vehicle_interact_updateplayerusability(player, vehicles) {
    levelData = vehicle_interact_getleveldata();
    if (!vehicle_interact_playercanusevehicles(player)) {
        foreach (vehicle in vehicles) {
            if (isdefined(vehicle)) {
                vehicle disablescriptableplayeruse(player);
            }
        }
        return;
    }
    foreach (vehicle in vehicles) {
        if (!isdefined(vehicle)) {
            continue;
        }
        if (istrue(vehicle_interact_vehiclecanbeused(vehicle)) && vehicle_interact_playercanusevehicle(player, vehicle)) {
            vehicle enablescriptableplayeruse(player);
        } else {
            vehicle disablescriptableplayeruse(player);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15cd
// Size: 0x3e
function vehicle_interact_monitorplayerusability(player) {
    level endon("game_ended");
    player endon("disconnect");
    while (1) {
        var_bd572a35f03ced5b = player waittill("update_vehicle_usability");
        vehicle_interact_updateplayerusability(player, var_bd572a35f03ced5b);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1612
// Size: 0x50
function vehicle_interact_getleveldata() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_interact_getLevelData() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.interact), "vehicle_interact_getLevelData() called before vehicle_interact_init().");
    #/
    return level.vehicle.interact;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166a
// Size: 0x65
function function_247ff3bb886c55ff(var_15fcf7d846a9d9a) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_interact_getLevelData() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.interact), "vehicle_interact_getLevelData() called before vehicle_interact_init().");
    #/
    return level.vehicle.interact.var_ed5c39e0b1ef815c[var_15fcf7d846a9d9a];
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d7
// Size: 0x66
function function_cf0f83cc6e448deb(var_b1b6487bc37b37fb, var_15fcf7d846a9d9a, var_ce4b3af5b29c05af, var_346563f5fda7d489, var_72eacc3730ec7823) {
    var_1b7218958dc3b187 = function_247ff3bb886c55ff(var_15fcf7d846a9d9a);
    callbackfunc = var_1b7218958dc3b187.callbacks[var_b1b6487bc37b37fb];
    if (isdefined(callbackfunc)) {
        level thread [[ callbackfunc ]](var_15fcf7d846a9d9a, var_ce4b3af5b29c05af, var_346563f5fda7d489, var_72eacc3730ec7823);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1744
// Size: 0x6b
function vehicle_interact_playercanusevehicles(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!player namespace_f8065cafc523dba5::_isalive()) {
        return 0;
    }
    if (!player val::get("vehicle_use")) {
        return 0;
    }
    if (player isparachuting() || player isskydiving()) {
        return 0;
    }
    if (player isinexecutionattack() || player isinexecutionvictim()) {
        return 0;
    }
    if (istrue(level.infiltransistioning)) {
        return 0;
    }
    return 1;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b7
// Size: 0x55
function vehicle_interact_vehiclecanbeused(vehicle) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return undefined;
    }
    if (var_72141eab56fb408f.dirty) {
        vehicle_interact_cleanvehicle(vehicle);
    }
    if (vehicle function_f9142d4bd3d810f4()) {
        return 0;
    }
    return !var_72141eab56fb408f.disabled;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1814
// Size: 0x54
function vehicle_interact_pointcanbeused(vehicle, var_15fcf7d846a9d9a) {
    var_1f4cf79f66927511 = vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a, undefined, 1);
    if (!isdefined(var_1f4cf79f66927511)) {
        return undefined;
    }
    if (var_1f4cf79f66927511.dirty) {
        vehicle_interact_cleanpoint(vehicle, var_15fcf7d846a9d9a);
    }
    return !var_1f4cf79f66927511.disabled;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1870
// Size: 0x6f
function vehicle_interact_playercanusevehicle(player, vehicle) {
    if (level.teambased) {
        team = vehicle_interact_getvehicleavailableteam(vehicle);
        if (isdefined(team) && team != player.team) {
            return 0;
        }
    } else {
        playerfriendlyto = namespace_1fbd40990ee60ede::vehicle_occupancy_getplayerfriendlyto(vehicle);
        if (isdefined(playerfriendlyto) && playerfriendlyto != player) {
            return 0;
        }
    }
    return 1;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e7
// Size: 0x49
function vehicle_interact_getvehicleavailableteam(vehicle) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return undefined;
    }
    if (var_72141eab56fb408f.dirty) {
        vehicle_interact_cleanvehicle(vehicle);
    }
    return var_72141eab56fb408f.availableteam;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1938
// Size: 0x35
function vehicle_interact_setvehicledirty(vehicle) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return;
    }
    var_72141eab56fb408f.dirty = 1;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1974
// Size: 0x48
function function_5c097a8f16a227d5(show) {
    if (isdefined(self) && self isscriptable() && self getscriptablehaspart("visibility")) {
        self setscriptablepartstate("visibility", ter_op(istrue(show), "show", "hide"));
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c3
// Size: 0x150
function vehicle_interact_cleanvehicle(vehicle) {
    levelData = vehicle_interact_getleveldata();
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return;
    }
    if (level.teambased) {
        teamfriendlyto = namespace_1fbd40990ee60ede::vehicle_occupancy_getteamfriendlyto(vehicle);
        if (isdefined(teamfriendlyto)) {
            var_72141eab56fb408f.availableteam = teamfriendlyto;
        } else {
            availableteam = undefined;
            var_db47e5ced41f6ca8 = namespace_1fbd40990ee60ede::vehicle_occupancy_getreserving(vehicle);
            foreach (player in var_db47e5ced41f6ca8) {
                if (isdefined(player)) {
                    availableteam = player.team;
                    break;
                }
            }
            var_72141eab56fb408f.availableteam = availableteam;
        }
    }
    if (levelData.disabledbyallow > 0) {
        var_72141eab56fb408f.disabled = 1;
    } else if (var_72141eab56fb408f.disabledbyallow > 0) {
        var_72141eab56fb408f.disabled = 1;
    } else {
        var_72141eab56fb408f.disabled = 0;
    }
    var_72141eab56fb408f.dirty = 0;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1a
// Size: 0xba
function vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a, create, var_6ecb77fd1f27c667) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, create, var_6ecb77fd1f27c667);
    if (!isdefined(var_72141eab56fb408f)) {
        return undefined;
    }
    var_1f4cf79f66927511 = var_72141eab56fb408f.pointdata[var_15fcf7d846a9d9a];
    if (!isdefined(var_1f4cf79f66927511) && isdefined(create)) {
        if (istrue(create)) {
            var_1f4cf79f66927511 = spawnstruct();
            var_72141eab56fb408f.pointdata[var_15fcf7d846a9d9a] = var_1f4cf79f66927511;
            var_1f4cf79f66927511.dirty = 1;
            var_1f4cf79f66927511.disabled = undefined;
            function_cf0f83cc6e448deb("createInstance", var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle);
        } else {
            /#
                assertex(istrue(var_6ecb77fd1f27c667), "vehicle_interact_getInstanceDataForPoint called with an invalid pointRef.");
            #/
        }
    }
    return var_1f4cf79f66927511;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bdc
// Size: 0x53
function vehicle_interact_pointisdisabled(vehicle, var_15fcf7d846a9d9a) {
    var_1f4cf79f66927511 = vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a, undefined, 1);
    if (!isdefined(var_1f4cf79f66927511)) {
        return undefined;
    }
    if (var_1f4cf79f66927511.dirty) {
        vehicle_interact_cleanpoint(vehicle, var_15fcf7d846a9d9a);
    }
    return var_1f4cf79f66927511.disabled;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c37
// Size: 0x53
function vehicle_interact_pointavailableseat(vehicle, var_15fcf7d846a9d9a) {
    var_1f4cf79f66927511 = vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a, undefined, 1);
    if (!isdefined(var_1f4cf79f66927511)) {
        return undefined;
    }
    if (var_1f4cf79f66927511.dirty) {
        vehicle_interact_cleanpoint(vehicle, var_15fcf7d846a9d9a);
    }
    return var_1f4cf79f66927511.availableseatid;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c92
// Size: 0x3e
function vehicle_interact_setpointdirty(vehicle, var_15fcf7d846a9d9a) {
    var_1f4cf79f66927511 = vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a, undefined, 1);
    if (!isdefined(var_1f4cf79f66927511)) {
        return;
    }
    var_1f4cf79f66927511.dirty = 1;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd7
// Size: 0x92
function vehicle_interact_setpointsdirty(vehicle) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return;
    }
    foreach (pointdata in var_72141eab56fb408f.pointdata) {
        pointdata.dirty = 1;
    }
    var_72141eab56fb408f.dirty = 1;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d70
// Size: 0x4c
function vehicle_interact_cleanpoint(vehicle, var_15fcf7d846a9d9a) {
    var_1f4cf79f66927511 = vehicle_interact_getinstancedataforpoint(vehicle, var_15fcf7d846a9d9a, undefined, 1);
    if (!isdefined(var_1f4cf79f66927511)) {
        return;
    }
    function_cf0f83cc6e448deb("cleanInstance", var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle);
    var_1f4cf79f66927511.dirty = 0;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc3
// Size: 0x30
function vehicle_interact_makeusable(vehicle) {
    if (istrue(vehicle_interact_getleveldataforvehicle(vehicle function_d93ec4635290febd()).var_6be1425a9ea8586d)) {
        return;
    }
    vehicle_interact_updateusability(vehicle);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfa
// Size: 0xb0
function vehicle_interact_makeunusable(vehicle) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return;
    }
    if (istrue(vehicle_interact_getleveldataforvehicle(vehicle function_d93ec4635290febd()).var_6be1425a9ea8586d)) {
        return;
    }
    var_70533a0a3679476b = getarraykeys(var_72141eab56fb408f.pointdata);
    foreach (var_15fcf7d846a9d9a in var_70533a0a3679476b) {
        vehicle setscriptablepartstate(var_15fcf7d846a9d9a, "vehicle_unusable");
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb1
// Size: 0x101
function vehicle_interact_updateusability(vehicle) {
    var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, undefined, 1);
    if (!isdefined(var_72141eab56fb408f)) {
        return;
    }
    if (istrue(vehicle_interact_getleveldataforvehicle(vehicle function_d93ec4635290febd()).var_6be1425a9ea8586d)) {
        return;
    }
    if (var_72141eab56fb408f.dirty) {
        vehicle_interact_cleanvehicle(vehicle);
    }
    if (var_72141eab56fb408f.disabled) {
        vehicle_interact_makeunusable(vehicle);
        return;
    }
    foreach (var_15fcf7d846a9d9a, pointdata in var_72141eab56fb408f.pointdata) {
        if (pointdata.dirty) {
            vehicle_interact_cleanpoint(vehicle, var_15fcf7d846a9d9a);
        }
        if (pointdata.disabled) {
            vehicle setscriptablepartstate(var_15fcf7d846a9d9a, "vehicle_unusable");
        } else {
            vehicle setscriptablepartstate(var_15fcf7d846a9d9a, "vehicle_use");
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb9
// Size: 0xf9
function function_f1f336c41f281c07(var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle, player) {
    seatid = var_1f4cf79f66927511.availableseatid;
    if (seatid != "driver" && seatid != "gunner") {
        seatid = function_91b9e7fb0f262529(player, vehicle, seatid);
    }
    /#
        var_d233ea035e59e2f4 = getdvarint(@"hash_fb517a5a3d736fa0", 0);
        if (var_d233ea035e59e2f4 > 0) {
            seatids = namespace_1fbd40990ee60ede::vehicle_occupancy_getallvehicleseats(vehicle);
            var_d233ea035e59e2f4 = int(min(var_d233ea035e59e2f4 - 1, seatids.size - 1));
            seatid = seatids[var_d233ea035e59e2f4];
            iprintlnbold("<unknown string>" + seatid);
        }
    #/
    thread namespace_1fbd40990ee60ede::vehicle_occupancy_enter(vehicle, seatid, player);
    params = {vehicle:vehicle, seatid:seatid, player:player};
    player callback::callback("player_vehicle_enter", params);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b9
// Size: 0xf8
function function_91b9e7fb0f262529(player, vehicle, var_812c17d89f729506) {
    var_e813fa37f0c5a3c1 = var_812c17d89f729506;
    var_e9b865f84c8eaa6b = undefined;
    foreach (seatid, seatdata in function_29b4292c92443328(vehicle function_d93ec4635290febd()).occupancy.seatdata) {
        if (namespace_1fbd40990ee60ede::vehicle_occupancy_seatisavailable(vehicle, seatid) && isdefined(seatdata.animtag)) {
            distancesqr = distancesquared(player.origin, vehicle gettagorigin(seatdata.animtag));
            if (!isdefined(var_e9b865f84c8eaa6b) || distancesqr < var_e9b865f84c8eaa6b) {
                var_e813fa37f0c5a3c1 = seatid;
                var_e9b865f84c8eaa6b = distancesqr;
            }
        }
    }
    return var_e813fa37f0c5a3c1;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b9
// Size: 0xc9
function function_cd93c6e46bc00381(var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle, var_e01d015fc5c02677) {
    var_9d0537be150542b3 = var_1f4cf79f66927511.var_9d0537be150542b3;
    /#
        assertex(isdefined(var_9d0537be150542b3), "vehicle_interact_cleanPoint pointRef has no seatEnterArray.");
    #/
    availableseatid = undefined;
    foreach (seatid in var_9d0537be150542b3) {
        if (namespace_1fbd40990ee60ede::vehicle_occupancy_seatisavailable(vehicle, seatid)) {
            availableseatid = seatid;
            break;
        }
    }
    var_1f4cf79f66927511.disabled = !isdefined(availableseatid);
    var_1f4cf79f66927511.availableseatid = availableseatid;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2289
// Size: 0x44
function function_39c1f2552dcfd9b0(var_15fcf7d846a9d9a, var_9d0537be150542b3, var_e2818ad39a3341b4, var_5721b85ea5381b5d) {
    /#
        /#
            assertex(isdefined(var_9d0537be150542b3), "<unknown string>");
        #/
    #/
    var_e2818ad39a3341b4.var_9d0537be150542b3 = var_9d0537be150542b3;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d4
// Size: 0x82
function function_c9601fed18d5b11e(var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle, var_5721b85ea5381b5d) {
    var_e2818ad39a3341b4 = vehicle_interact_getleveldataforvehicle(vehicle.vehiclename, undefined, 1);
    /#
        /#
            assertex(isdefined(var_e2818ad39a3341b4.var_9d0537be150542b3), "<unknown string>");
        #/
    #/
    var_1f4cf79f66927511.availableseatid = undefined;
    var_1f4cf79f66927511.var_9d0537be150542b3 = var_e2818ad39a3341b4.var_9d0537be150542b3;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235d
// Size: 0x53
function function_e1f37f2bd447ab19(vehicle, player) {
    if (isdefined(vehicle)) {
        if (!isdefined(vehicle.var_9aeb5660c6df86e1)) {
            vehicle.var_9aeb5660c6df86e1 = [];
        }
        vehicle.var_9aeb5660c6df86e1 = namespace_3c37cb17ade254d::array_add(vehicle.var_9aeb5660c6df86e1, player);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b7
// Size: 0x47
function function_fed77cd5c54efe19(vehicle, player) {
    if (isdefined(vehicle) && isdefined(vehicle.var_9aeb5660c6df86e1)) {
        vehicle.var_9aeb5660c6df86e1 = namespace_3c37cb17ade254d::array_remove(vehicle.var_9aeb5660c6df86e1, player);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2405
// Size: 0xd1
function function_2b58c6eeaea42c35(var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle, player) {
    if (issharedfuncdefined("vehicle_upgrade", "init")) {
        if (!isdefined(level.br_pe_data)) {
            player iprintlnbold("BR Kiosk station is not activated in this game mode");
            return;
        }
        [[ var_1f4cf79f66927511.var_4dc9e517025a78b6 ]](vehicle, player);
        player setclientomnvar("ui_buystation_override", var_1f4cf79f66927511.var_420bbde8d99ec0a);
        player.var_e5b7a6a0ec2b440e = 1;
        player.var_c77002478cdfd85f = vehicle;
        function_e1f37f2bd447ab19(vehicle, player);
        var_8ce0cddaad539b3 = getsharedfunc("vehicle_upgrade", "init");
        kiosk = function_d9750cba41de6a13(vehicle, var_15fcf7d846a9d9a);
        player thread [[ var_8ce0cddaad539b3 ]](kiosk);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24dd
// Size: 0x31
function function_d2b057155910001b(var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle, var_e01d015fc5c02677) {
    var_1f4cf79f66927511.disabled = 0;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2515
// Size: 0xad
function function_2bc48c2bcc22a4fe(var_15fcf7d846a9d9a, var_1226c93ad199f9f1, var_e2818ad39a3341b4, var_5721b85ea5381b5d) {
    if (!isdefined(var_e2818ad39a3341b4.var_ee340f5cd8ff86a6)) {
        var_e2818ad39a3341b4.var_ee340f5cd8ff86a6 = [];
    }
    if (!isdefined(var_e2818ad39a3341b4.var_cca5fc4158fd7ceb)) {
        var_e2818ad39a3341b4.var_cca5fc4158fd7ceb = [];
    }
    if (!isdefined(var_e2818ad39a3341b4.var_4dc9e517025a78b6)) {
        var_e2818ad39a3341b4.var_4dc9e517025a78b6 = [];
    }
    var_e2818ad39a3341b4.var_ee340f5cd8ff86a6[var_15fcf7d846a9d9a] = var_1226c93ad199f9f1[0];
    var_e2818ad39a3341b4.var_cca5fc4158fd7ceb[var_15fcf7d846a9d9a] = var_1226c93ad199f9f1[1];
    var_e2818ad39a3341b4.var_4dc9e517025a78b6[var_15fcf7d846a9d9a] = var_1226c93ad199f9f1[2];
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c9
// Size: 0xd3
function function_bd192331e198be64(var_15fcf7d846a9d9a, var_1f4cf79f66927511, vehicle, var_5721b85ea5381b5d) {
    var_e2818ad39a3341b4 = vehicle_interact_getleveldataforvehicle(vehicle.vehiclename, undefined, 1);
    /#
        /#
            assertex(isdefined(var_e2818ad39a3341b4.var_ee340f5cd8ff86a6), "<unknown string>");
        #/
    #/
    /#
        /#
            assertex(isdefined(var_e2818ad39a3341b4.var_ee340f5cd8ff86a6[var_15fcf7d846a9d9a]), "<unknown string>");
        #/
    #/
    var_1f4cf79f66927511.var_420bbde8d99ec0a = var_e2818ad39a3341b4.var_cca5fc4158fd7ceb[var_15fcf7d846a9d9a];
    var_1f4cf79f66927511.var_4dc9e517025a78b6 = var_e2818ad39a3341b4.var_4dc9e517025a78b6[var_15fcf7d846a9d9a];
    var_d9f0e1b450f12bbc = var_e2818ad39a3341b4.var_ee340f5cd8ff86a6[var_15fcf7d846a9d9a];
    function_16ab0dcefaa4c681(vehicle, var_15fcf7d846a9d9a, var_d9f0e1b450f12bbc);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a3
// Size: 0x5d
function function_d9750cba41de6a13(vehicle, var_47187249fc261259) {
    /#
        /#
            assertex(isdefined(vehicle.var_62f37d3cd23e2d82), "<unknown string>");
        #/
    #/
    /#
        /#
            assertex(isdefined(vehicle.var_62f37d3cd23e2d82[var_47187249fc261259]), "<unknown string>");
        #/
    #/
    return vehicle.var_62f37d3cd23e2d82[var_47187249fc261259];
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2708
// Size: 0x62
function function_16ab0dcefaa4c681(vehicle, var_47187249fc261259, var_d9f0e1b450f12bbc) {
    if (!isdefined(vehicle.var_62f37d3cd23e2d82)) {
        vehicle.var_62f37d3cd23e2d82 = [];
    }
    kiosk = spawnstruct();
    kiosk thread function_12d9b5736427fa79(vehicle, var_d9f0e1b450f12bbc);
    vehicle.var_62f37d3cd23e2d82[var_47187249fc261259] = kiosk;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2771
// Size: 0x39
function function_12d9b5736427fa79(vehicle, var_d9f0e1b450f12bbc) {
    vehicle endon("death");
    while (1) {
        self.origin = vehicle gettagorigin(var_d9f0e1b450f12bbc);
        wait(0.5);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b1
// Size: 0x52
function function_c4b9d8e33849435e(vehicle, var_5473a133b9d77893, player) {
    if (!isdefined(vehicle.var_df77eacc566f76)) {
        vehicle.var_df77eacc566f76 = [];
    }
    vehicle.var_df77eacc566f76[var_5473a133b9d77893] = 1;
    vehicle notify("give_upgrade", var_5473a133b9d77893);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280a
// Size: 0x32
function function_97c32f66eff29610(vehicle, var_5473a133b9d77893) {
    return isdefined(vehicle.var_df77eacc566f76) && istrue(vehicle.var_df77eacc566f76[var_5473a133b9d77893]);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2844
// Size: 0x38
function function_a717a31ae35ba01c() {
    if (istrue(level.var_b017944f02bb5e97)) {
        return 0;
    }
    if (getdvarint(@"hash_548a5a7dcb6bde02", 1) == 0) {
        return 0;
    }
    return getmatchrulesdata("commonOption", "vehicleFuelEnabled");
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2884
// Size: 0x196
function private function_f588087bf9d7fefb() {
    level endon("game_ended");
    waitframe();
    if (!function_a717a31ae35ba01c()) {
        return;
    }
    if (getdvarint(@"hash_48bb9b301ddec6d5", 0)) {
        flag_wait("gas_station_create_script_initialized");
    }
    var_33e3b4a298c2935 = [0:"gas_station", 1:"gas_station_marine", 2:"gas_station_charger"];
    var_354f6e3eebce5123 = [];
    foreach (var_68848470e627ce84 in var_33e3b4a298c2935) {
        if (getdvarint(function_2ef675c13ca1c4af(@"hash_ea224dc24c0b7e07", var_68848470e627ce84), 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
            namespace_7052decdced06e44::function_4f7660cfd85cd517(var_68848470e627ce84, &function_b062b902747a499e);
            namespace_7052decdced06e44::function_412f527ef0863f0e(var_68848470e627ce84, &function_23960baddc5086ed);
            namespace_7052decdced06e44::function_eded5b87f8f7bdfd(var_68848470e627ce84, &function_a15a2f4b7fdce1db);
        } else {
            var_8e0d7eb61f44d9d6 = function_b062b902747a499e(var_68848470e627ce84);
            foreach (var_c75620ca74d2e522 in var_8e0d7eb61f44d9d6) {
                scriptable = function_23960baddc5086ed(var_68848470e627ce84, var_c75620ca74d2e522);
                var_354f6e3eebce5123[var_354f6e3eebce5123.size] = scriptable;
            }
        }
    }
    function_6c429e1c6f5142ed(var_354f6e3eebce5123);
    level.var_354f6e3eebce5123 = var_354f6e3eebce5123;
    level.var_30437143ffcdc44e = undefined;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a21
// Size: 0x2ec
function function_6c429e1c6f5142ed(var_30437143ffcdc44e) {
    if (!isdefined(var_30437143ffcdc44e)) {
        return;
    }
    var_ece1ce8d6abcd4ae = [];
    foreach (var_c75620ca74d2e522 in var_30437143ffcdc44e) {
        if (!isdefined(var_c75620ca74d2e522.var_f3bc44571c85d5e1)) {
            var_ece1ce8d6abcd4ae[var_ece1ce8d6abcd4ae.size] = var_c75620ca74d2e522;
        } else {
            triggers = function_f159c10d5cf8f0b4(var_c75620ca74d2e522.var_f3bc44571c85d5e1, "targetname");
            var_c75620ca74d2e522.var_f3bc44571c85d5e1 = undefined;
            if (!isdefined(triggers) || triggers.size == 0) {
                var_ece1ce8d6abcd4ae[var_ece1ce8d6abcd4ae.size] = var_c75620ca74d2e522;
            } else if (getdvarint(@"hash_18e99507526e4c5d", 1)) {
                var_c75620ca74d2e522.triggers = triggers;
                foreach (trigger in triggers) {
                    if (isdefined(trigger.struct) && isdefined(trigger.struct.radius)) {
                        trigger.var_8fa87d2c8780e014 = trigger.struct.radius * trigger.struct.radius;
                    } else {
                        trigger.var_8fa87d2c8780e014 = var_c75620ca74d2e522.var_8fa87d2c8780e014;
                    }
                    var_c75620ca74d2e522 thread function_8c5be15142453a9b(trigger);
                }
            } else {
                if (triggers.size == 1) {
                    var_c75620ca74d2e522.trigger = triggers[0];
                } else {
                    var_c75620ca74d2e522.trigger = sortbydistance(triggers, var_c75620ca74d2e522.origin)[0];
                }
                var_c75620ca74d2e522.trigger.var_8fa87d2c8780e014 = var_c75620ca74d2e522.var_8fa87d2c8780e014;
                var_c75620ca74d2e522 thread function_8c5be15142453a9b(var_c75620ca74d2e522.trigger);
            }
        }
    }
    foreach (var_c75620ca74d2e522 in var_ece1ce8d6abcd4ae) {
        radius = int(sqrt(var_c75620ca74d2e522.var_8fa87d2c8780e014));
        var_c75620ca74d2e522.trigger = spawn("noent_volume_trigger_radius", var_c75620ca74d2e522.origin - (0, 0, 200), 0, radius, 1000);
        var_c75620ca74d2e522.trigger.var_8fa87d2c8780e014 = var_c75620ca74d2e522.var_8fa87d2c8780e014;
        var_c75620ca74d2e522 thread function_8c5be15142453a9b(var_c75620ca74d2e522.trigger);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d14
// Size: 0x124
function private function_8c5be15142453a9b(trigger) {
    while (1) {
        ent = trigger waittill("trigger");
        if (isplayer(ent) && isdefined(ent.vehicle)) {
            vehicle = ent.vehicle;
        } else {
            vehicle = ent;
        }
        if (!isdefined(vehicle) || !vehicle isvehicle() || !isdefined(vehicle.origin)) {
            continue;
        }
        if (!isdefined(vehicle.fuel)) {
            continue;
        }
        if (isdefined(vehicle.var_90c69f8ba6618910)) {
            continue;
        }
        if (istrue(self.var_6234172895d0c06f) && vehicle function_d93ec4635290febd() != "veh9_hummer") {
            continue;
        }
        if (distance2dsquared(vehicle.origin, trigger.origin) > trigger.var_8fa87d2c8780e014) {
            continue;
        }
        driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(vehicle);
        thread function_518f884fc150d957(vehicle, trigger.origin, trigger.var_8fa87d2c8780e014, driver);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e3f
// Size: 0x17a
function private function_52ba5a6617b2c059(origin, radius, scriptablename) {
    level endon("game_ended");
    if (issharedfuncdefined("poi", "isSystemActive") && [[ getsharedfunc("poi", "isSystemActive") ]]() && issharedfuncdefined("poi", "isInActivePOI") && ![[ getsharedfunc("poi", "isInActivePOI") ]](origin)) {
        return;
    }
    if (issharedfuncdefined("game", "isPointWithinInitialDangerCircle") && ![[ getsharedfunc("game", "isPointWithinInitialDangerCircle") ]](origin)) {
        return;
    }
    if (isdefined(scriptablename)) {
        /#
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                [[ getsharedfunc("<unknown string>", "<unknown string>") ]]("<unknown string>", scriptablename, "<unknown string>", undefined, undefined, undefined, undefined, origin);
            }
        #/
        if (istrue(level.var_a9ccaf325f3a76d)) {
            var_c75620ca74d2e522 = spawn("script_model", origin);
            var_c75620ca74d2e522 setmodel(scriptablename);
        } else {
            var_c75620ca74d2e522 = spawnscriptable(scriptablename, origin);
        }
    } else {
        var_c75620ca74d2e522 = spawnstruct();
        var_c75620ca74d2e522.origin = origin;
    }
    var_c75620ca74d2e522.var_8fa87d2c8780e014 = radius * radius;
    var_c75620ca74d2e522.minheight = origin[2] - 200;
    var_c75620ca74d2e522.maxheight = origin[2] + 1000 - 200;
    var_c75620ca74d2e522.var_f49fed751e517601 = gettime();
    return var_c75620ca74d2e522;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc1
// Size: 0x2e
function function_b062b902747a499e(var_cab957adc8d7710f) {
    if (!function_a717a31ae35ba01c()) {
        return;
    }
    var_8e0d7eb61f44d9d6 = getstructarray(var_cab957adc8d7710f, "targetname");
    return var_8e0d7eb61f44d9d6;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff7
// Size: 0x144
function function_23960baddc5086ed(var_cab957adc8d7710f, var_6b0d97276985d147) {
    if (var_cab957adc8d7710f == "gas_station") {
        radius = ter_op(is_equal(var_6b0d97276985d147.script_noteworthy, "large"), 600, 400);
        scriptablename = "dmz_gas_station";
    } else if (var_cab957adc8d7710f == "gas_station_marine") {
        radius = 650;
        scriptablename = "dmz_gas_station_marine";
    } else if (var_cab957adc8d7710f == "gas_station_charger") {
        radius = 400;
        if (isdefined(var_6b0d97276985d147.script_noteworthy)) {
            radius = float(var_6b0d97276985d147.script_noteworthy);
        }
    }
    scriptable = function_52ba5a6617b2c059(var_6b0d97276985d147.origin, radius, scriptablename);
    if (isdefined(scriptable)) {
        scriptable.var_6234172895d0c06f = var_cab957adc8d7710f == "gas_station_charger";
        scriptable.var_f3bc44571c85d5e1 = var_6b0d97276985d147.target;
        if (!isdefined(level.var_30437143ffcdc44e)) {
            level.var_30437143ffcdc44e = [];
        }
        if (!isdefined(level.var_30437143ffcdc44e[var_cab957adc8d7710f])) {
            level.var_30437143ffcdc44e[var_cab957adc8d7710f] = [];
        }
        level.var_30437143ffcdc44e[var_cab957adc8d7710f][level.var_30437143ffcdc44e[var_cab957adc8d7710f].size] = scriptable;
    }
    return scriptable;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3143
// Size: 0x63
function function_a15a2f4b7fdce1db(var_cab957adc8d7710f) {
    function_6c429e1c6f5142ed(level.var_30437143ffcdc44e[var_cab957adc8d7710f]);
    if (!isdefined(level.var_354f6e3eebce5123)) {
        level.var_354f6e3eebce5123 = [];
    }
    level.var_354f6e3eebce5123 = array_combine(level.var_354f6e3eebce5123, level.var_30437143ffcdc44e[var_cab957adc8d7710f]);
    level.var_30437143ffcdc44e[var_cab957adc8d7710f] = undefined;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31ad
// Size: 0xb12
function private function_518f884fc150d957(vehicle, point, var_8fa87d2c8780e014, driver) {
    level endon("game_ended");
    currenttime = gettime();
    if (currenttime - 4000 > self.var_f49fed751e517601) {
        var_d88ccaa59cb99be0 = "veh_fuel_gas_station_service_bell";
        if (istrue(self.var_6234172895d0c06f)) {
            var_d88ccaa59cb99be0 = "veh_fuel_ev_station_service_bell_enter";
        }
        playsoundatpos(self.origin + (0, 0, 100), var_d88ccaa59cb99be0);
        self.var_f49fed751e517601 = currenttime;
    }
    vehicleRef = vehicle function_d93ec4635290febd();
    var_b7898aee43bb07ef = namespace_141c4634b6ea7b27::vehicle_interact_getleveldataforvehicle(vehicleRef);
    var_29f1ea79ed2b40dd = var_b7898aee43bb07ef.var_29f1ea79ed2b40dd;
    var_4e86f19790f68bb3 = istrue(self.var_6234172895d0c06f);
    vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8(var_29f1ea79ed2b40dd, var_4e86f19790f68bb3);
    vehicle.var_7851aebdd0a34b09 = var_4e86f19790f68bb3;
    team = vehicle.team;
    var_a8cc95b22d8a90cd = istrue(var_29f1ea79ed2b40dd == -1);
    wait(1);
    if (!isdefined(vehicle) || !isdefined(vehicle.origin) || !isdefined(vehicle.maxhealth)) {
        if (isdefined(vehicle)) {
            vehicle.var_90c69f8ba6618910 = undefined;
            vehicle.var_7851aebdd0a34b09 = undefined;
        }
        return;
    }
    if (distancesquared(vehicle.origin, point) >= var_8fa87d2c8780e014 * 2.25) {
        vehicle.var_90c69f8ba6618910 = undefined;
        vehicle.var_7851aebdd0a34b09 = undefined;
        return;
    }
    timestamp = gettime();
    var_cfb86c8ec12b2d6c = function_53c4c53197386572(var_b7898aee43bb07ef.var_23f37e83b1cafb10, 30);
    if (!var_a8cc95b22d8a90cd) {
        var_a1153d5fc785fbe1 = var_29f1ea79ed2b40dd / var_cfb86c8ec12b2d6c * 0.25;
    }
    var_63eec8cc9e4260e4 = vehicle.maxhealth / var_cfb86c8ec12b2d6c * 0.25;
    objidnum = undefined;
    var_bbe8a876aba8451e = 2000;
    var_22754a38d66516ec = timestamp + 2000;
    if (!var_a8cc95b22d8a90cd && isdefined(driver) && isplayer(driver) && isdefined(driver.var_a7004ed1f5ca8132)) {
        desiredtime = var_cfb86c8ec12b2d6c * driver.var_a7004ed1f5ca8132;
        var_a1153d5fc785fbe1 = var_29f1ea79ed2b40dd / desiredtime * 0.25;
    }
    if (isdefined(driver) && isplayer(driver) && isdefined(driver.var_2da660fa32b4cd1)) {
        desiredtime = var_cfb86c8ec12b2d6c * driver.var_2da660fa32b4cd1;
        var_63eec8cc9e4260e4 = vehicle.maxhealth / desiredtime * 0.25;
        var_bbe8a876aba8451e = 2000 * driver.var_2da660fa32b4cd1;
        var_22754a38d66516ec = timestamp + var_bbe8a876aba8451e;
    }
    if (issharedfuncdefined("game", "requestObjectiveID")) {
        vehicle.curorigin = (0, 0, 0);
        vehicle.offset3d = (0, 0, 0);
        vehicle.objidnum = [[ getsharedfunc("game", "requestObjectiveID") ]](99);
        objidnum = vehicle.objidnum;
    }
    if (isdefined(objidnum) && objidnum != -1) {
        objective_delete(objidnum);
        objective_state(objidnum, "current");
        objective_setshowoncompass(objidnum, 1);
        objective_setplayintro(objidnum, 0);
        objective_setplayoutro(objidnum, 0);
        objective_setbackground(objidnum, 1);
        icon = ter_op(vehicleRef == "veh9_hummer", "ddos_emp_bolt", "ui_map_icon_gas_refuel");
        objective_icon(objidnum, icon);
        objective_onentity(objidnum, vehicle);
        objective_setzoffset(objidnum, 75);
        objective_setshowprogress(objidnum, 1);
        objective_removeallfrommask(objidnum);
        objective_showtoplayersinmask(objidnum);
    }
    var_3f95b7ac8e6598bf = 0;
    vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8(var_29f1ea79ed2b40dd, var_4e86f19790f68bb3);
    if (vehicle.var_90c69f8ba6618910 < 0.99) {
        var_3f95b7ac8e6598bf = 1;
        foreach (occupant in vehicle.occupants) {
            vehicle function_3bff37824a58ef7a(occupant, objidnum, vehicleRef);
        }
    }
    if (vehicle.health < vehicle.maxhealth && vehicle vehicle_damage_getstate() != "heavy") {
        playsoundatpos(vehicle.origin, "veh_repair_health");
    }
    if (istrue(level.var_5431e3914cfc0e23)) {
        var_4fdf99c19de6454 = 1;
        var_4fdf99c19de6454 = issharedfuncdefined("game", "isGameplayTeam") && [[ getsharedfunc("game", "isGameplayTeam") ]](team);
        if (!istrue(self.var_6234172895d0c06f) && var_4fdf99c19de6454) {
            self setscriptablepartstate(self function_ec5f4851431f3382(), "occupied");
            self function_fca5bdbe24070d20(self function_ec5f4851431f3382(), team);
            if (!isdefined(self.var_f0be68ab550cb2e6)) {
                self.var_f0be68ab550cb2e6 = [];
            }
            self.var_f0be68ab550cb2e6[self.var_f0be68ab550cb2e6.size] = team;
        }
    }
    while (isdefined(vehicle) && isdefined(vehicle.origin) && distancesquared(vehicle.origin, point) < var_8fa87d2c8780e014 * 2.25) {
        if (!vehicle function_fc271f387096702f()) {
            vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8(var_29f1ea79ed2b40dd, var_4e86f19790f68bb3);
            if (isdefined(objidnum) && objidnum != -1) {
                objective_setprogress(objidnum, vehicle.var_90c69f8ba6618910);
            }
            if (!var_3f95b7ac8e6598bf && vehicle.var_90c69f8ba6618910 < 0.99) {
                var_3f95b7ac8e6598bf = 1;
                foreach (occupant in vehicle.occupants) {
                    vehicle function_3bff37824a58ef7a(occupant, objidnum, vehicleRef);
                }
            }
            wait(0.25);
            continue;
        }
        if (!var_a8cc95b22d8a90cd) {
            vehicle.fuel = min(var_29f1ea79ed2b40dd, vehicle.fuel + var_a1153d5fc785fbe1);
            vehicle namespace_84cff6185e39aa66::function_9da76b0be4b2a2d4(vehicle.fuel, var_29f1ea79ed2b40dd);
        }
        if (!var_4e86f19790f68bb3) {
            if (vehicle.health < vehicle.maxhealth && vehicle vehicle_damage_getstate() != "heavy") {
                vehicle function_653b96ce8310763e(var_63eec8cc9e4260e4);
            }
        }
        vehicle.var_90c69f8ba6618910 = vehicle function_883613626149ebf8(var_29f1ea79ed2b40dd, var_4e86f19790f68bb3);
        if (isdefined(objidnum) && objidnum != -1) {
            objective_setprogress(objidnum, vehicle.var_90c69f8ba6618910);
        }
        if (var_3f95b7ac8e6598bf && vehicle.var_90c69f8ba6618910 >= 0.99) {
            var_3f95b7ac8e6598bf = 0;
            foreach (occupant in vehicle.occupants) {
                vehicle function_d051e5f825b704ab(occupant, objidnum, vehicleRef, 1);
            }
            if (isdefined(driver)) {
                params = spawnstruct();
                params.player = driver;
                params.vehicle = vehicle;
                callback::callback("on_vehicle_refueled", params);
            }
        }
        waittime = 0.25;
        if (!var_4e86f19790f68bb3) {
            timestamp = gettime();
            if (timestamp > var_22754a38d66516ec || timestamp + 250 >= var_22754a38d66516ec) {
                var_145c969594928415 = max(var_22754a38d66516ec - timestamp, 0);
                if (var_145c969594928415 > 0) {
                    wait(var_145c969594928415 / 1000);
                    waittime = (250 - var_145c969594928415) / 1000;
                }
                var_22754a38d66516ec = gettime() + var_bbe8a876aba8451e;
                if (isdefined(vehicle.var_f2b4d0e8470f108b)) {
                    function_e6f68a61bffc259a(vehicle, 1);
                } else {
                    function_9b27177ad97bb8d8(vehicle);
                }
            }
            if (abs(vehicle.fuel - var_29f1ea79ed2b40dd) < 1 && vehicle.health == vehicle.maxhealth && (!isdefined(vehicle.var_c48b10763f1df79a) || vehicle.var_c48b10763f1df79a.size == 0)) {
                namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onVehicleFullRefuelAndRepair", vehicle, self);
                if (!isdefined(self.var_d7889ce958977349)) {
                    self.var_d7889ce958977349 = [];
                }
                if (isdefined(vehicle.owner) && !array_contains(self.var_d7889ce958977349, vehicle)) {
                    vehicle.owner namespace_aad14af462a74d08::function_5c3aa65db46763ff(vehicle, "gas_station_refuel");
                    self.var_d7889ce958977349[self.var_d7889ce958977349.size] = vehicle;
                }
            }
        }
        wait(waittime);
    }
    if (var_3f95b7ac8e6598bf && isdefined(vehicle) && isdefined(vehicle.occupants)) {
        foreach (occupant in vehicle.occupants) {
            vehicle function_d051e5f825b704ab(occupant, objidnum, vehicleRef, 1);
        }
    }
    if (isdefined(objidnum) && objidnum != -1 && issharedfuncdefined("game", "returnObjectiveID")) {
        [[ getsharedfunc("game", "returnObjectiveID") ]](objidnum);
        if (isdefined(vehicle)) {
            vehicle.objidnum = undefined;
        }
    }
    if (isdefined(vehicle)) {
        vehicle.var_90c69f8ba6618910 = undefined;
        vehicle.var_7851aebdd0a34b09 = undefined;
    }
    if (istrue(level.var_5431e3914cfc0e23)) {
        var_4fdf99c19de6454 = 1;
        var_4fdf99c19de6454 = issharedfuncdefined("game", "isGameplayTeam") && [[ getsharedfunc("game", "isGameplayTeam") ]](team);
        if (!istrue(self.var_6234172895d0c06f) && var_4fdf99c19de6454) {
            self.var_f0be68ab550cb2e6 = function_57091b2d67654a14(self.var_f0be68ab550cb2e6, team);
            if (self.var_f0be68ab550cb2e6.size == 0) {
                self setscriptablepartstate(self function_ec5f4851431f3382(), "idle");
            } else {
                var_4fdf99c19de6454 = 1;
                var_4fdf99c19de6454 = issharedfuncdefined("game", "isGameplayTeam") && [[ getsharedfunc("game", "isGameplayTeam") ]](self.var_f0be68ab550cb2e6[0]);
                if (var_4fdf99c19de6454) {
                    self function_fca5bdbe24070d20(self function_ec5f4851431f3382(), self.var_f0be68ab550cb2e6[0]);
                }
            }
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cc6
// Size: 0x25
function function_fc271f387096702f() {
    return !isdefined(self.lasttimedamaged) || gettime() - self.lasttimedamaged >= 5000;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cf3
// Size: 0x71
function private function_883613626149ebf8(var_29f1ea79ed2b40dd, var_4e86f19790f68bb3) {
    if (var_29f1ea79ed2b40dd == -1) {
        return (self.health / self.maxhealth);
    } else if (var_4e86f19790f68bb3) {
        return (self.fuel / var_29f1ea79ed2b40dd);
    } else {
        return (0.5 * self.fuel / var_29f1ea79ed2b40dd + 0.5 * self.health / self.maxhealth);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d6b
// Size: 0x53
function function_c5fe005f06fe5684(vehicle, player) {
    if (isdefined(vehicle.var_90c69f8ba6618910) && vehicle.var_90c69f8ba6618910 < 0.99) {
        vehicle function_3bff37824a58ef7a(player, vehicle.objidnum, vehicle function_d93ec4635290febd());
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc5
// Size: 0x53
function function_deb83798a724a77e(vehicle, player) {
    if (isdefined(vehicle.var_90c69f8ba6618910) && vehicle.var_90c69f8ba6618910 < 0.99) {
        vehicle function_d051e5f825b704ab(player, vehicle.objidnum, vehicle function_d93ec4635290febd());
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e1f
// Size: 0xa4
function private function_3bff37824a58ef7a(player, objidnum, vehicleRef) {
    if (isdefined(objidnum) && objidnum != -1) {
        objective_addclienttomask(objidnum, player);
        objective_showtoplayersinmask(objidnum);
        objective_pinforclient(objidnum, player);
        function_d1b64c3d055ceeb0(2, player);
        var_e9168d98351236d7 = "MP/REFUELING";
        if (vehicleRef == "veh9_hummer") {
            var_e9168d98351236d7 = ter_op(istrue(self.var_7851aebdd0a34b09), "MP/CHARGING_FUEL_ONLY", "MP/CHARGING");
        } else if (vehicleRef == "veh9_motorcycle_blood_burner_physics") {
            var_e9168d98351236d7 = "MP/REPAIRING";
        }
        function_8b71eb96e1636edc(var_e9168d98351236d7, player);
        function_82a1c76da877f6a3(player, vehicleRef);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3eca
// Size: 0x5a
function private function_d051e5f825b704ab(player, objidnum, vehicleRef, success) {
    if (isdefined(objidnum) && objidnum != -1) {
        objective_removeclientfrommask(objidnum, player);
        objective_showtoplayersinmask(objidnum);
        objective_unpinforclient(objidnum, player);
        function_d1b64c3d055ceeb0(0, player);
        function_bd48158d51404989(player, vehicleRef, success);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f2b
// Size: 0x43
function private function_82a1c76da877f6a3(player, vehicleRef) {
    if (isdefined(player)) {
        var_a3c271bd60ec612f = ter_op(vehicleRef == "veh9_hummer", "uin_veh_fuel_ev_charger", "uin_veh_fuel_gas_ticker");
        player playlocalsound(var_a3c271bd60ec612f);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f75
// Size: 0x6e
function private function_bd48158d51404989(player, vehicleRef, success) {
    if (isdefined(player)) {
        var_a3c271bd60ec612f = "uin_veh_fuel_gas_ticker";
        var_2d2bbcca8984c48f = "uin_veh_fuel_gas_ticker_stop";
        if (vehicleRef == "veh9_hummer") {
            var_a3c271bd60ec612f = "uin_veh_fuel_ev_charger";
            var_2d2bbcca8984c48f = "uin_veh_fuel_ev_charger_stop";
        }
        player stoplocalsound(var_a3c271bd60ec612f);
        if (istrue(success)) {
            player playlocalsound(var_2d2bbcca8984c48f);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fea
// Size: 0x56
function function_a203f8033eeb57f1(vehicleRef, vehicle) {
    if (!vehicle namespace_1f188a13f7e79610::function_b7148a3bfc4defb2() && function_a717a31ae35ba01c() && !istrue(vehicle.isfromkillstreak)) {
        vehicle.fuel = function_f02703f19a787f77(vehicleRef);
        vehicle thread function_722b030261c05941(vehicleRef);
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4047
// Size: 0x5f
function private function_f02703f19a787f77(vehicleRef) {
    var_e2818ad39a3341b4 = vehicle_interact_getleveldataforvehicle(vehicleRef);
    if (var_e2818ad39a3341b4.var_4c6d695d0920df19 >= var_e2818ad39a3341b4.var_4c4a7b5d08fabef7) {
        return var_e2818ad39a3341b4.var_4c6d695d0920df19;
    }
    return randomfloatrange(var_e2818ad39a3341b4.var_4c6d695d0920df19, var_e2818ad39a3341b4.var_4c4a7b5d08fabef7);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40ae
// Size: 0x497
function private function_722b030261c05941(vehicleRef) {
    self endon("death");
    level endon("game_ended");
    var_29f1ea79ed2b40dd = vehicle_interact_getleveldataforvehicle(vehicleRef).var_29f1ea79ed2b40dd;
    if (var_29f1ea79ed2b40dd < 0) {
        return;
    }
    occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self);
    namespace_84cff6185e39aa66::vehomn_showfuel(occupants);
    namespace_84cff6185e39aa66::function_9da76b0be4b2a2d4(self.fuel, var_29f1ea79ed2b40dd);
    var_f2478a60ddde9fab = self vehicle_gettopspeedforward();
    lowFuel = 0;
    outOfFuel = 0;
    var_94d4410a7169a784 = "uin_veh_warning_low_fuel";
    var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel";
    if (istrue(namespace_dbbb37eb352edf96::ishelicopter())) {
        var_94d4410a7169a784 = "uin_veh_warning_low_fuel_heli";
        var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel_heli";
    }
    while (1) {
        wait(1);
        if (istrue(self.ishovering) || !istrue(self.isempty) && isplayer(namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self))) {
            var_15f8441922036c46 = min(ter_op(namespace_dbbb37eb352edf96::ishelicopter(), 1, self vehicle_getspeed() / var_f2478a60ddde9fab), 1);
            player = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self);
            if (!istrue(namespace_dbbb37eb352edf96::ishelicopter()) && isdefined(player.var_dc3b97ba2322ca5a)) {
                var_15f8441922036c46 = var_15f8441922036c46 * player.var_dc3b97ba2322ca5a;
            }
            /#
                var_15f8441922036c46 = var_15f8441922036c46 * getdvarfloat(@"hash_deab88f9a10a5bc8", 1);
            #/
            var_be4f52293aadb963 = var_15f8441922036c46 * function_53c4c53197386572(self.var_580db2147190028a, 1);
            self.fuel = max(self.fuel - var_be4f52293aadb963, 0);
        }
        /#
            if (getdvarint(@"hash_f6ba20712f854462", 0) == 1) {
                self.fuel = var_29f1ea79ed2b40dd;
                outOfFuel = 0;
            }
        #/
        namespace_84cff6185e39aa66::function_9da76b0be4b2a2d4(self.fuel, var_29f1ea79ed2b40dd);
        if (self.fuel <= 0 && !outOfFuel) {
            outOfFuel = 1;
            namespace_1fbd40990ee60ede::function_d0092c44c5588870();
            namespace_1fbd40990ee60ede::function_ee4b8b879b1b120c();
            namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 0, 0);
            namespace_84cff6185e39aa66::vehomn_showwarning("outOfFuel", namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self), vehicleRef);
            if (issharedfuncdefined(vehicleRef, "outOfFuel")) {
                [[ getsharedfunc(vehicleRef, "outOfFuel") ]]();
            }
            if (issharedfuncdefined("pmc_missions", "onVehicleOutOfFuel")) {
                [[ getsharedfunc("pmc_missions", "onVehicleOutOfFuel") ]](namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self));
            }
            function_5a2b3f3e2cd84eb8(var_94d4410a7169a784);
            function_7c7694a53fa6720a(var_85dfce1880d8e71d);
        } else if (self.fuel > 0 && outOfFuel) {
            outOfFuel = 0;
            function_5a2b3f3e2cd84eb8(var_85dfce1880d8e71d);
            namespace_1fbd40990ee60ede::function_7c81e0d41cbbce7f();
            namespace_1fbd40990ee60ede::function_9e710c9f3a15ffda();
            namespace_1fbd40990ee60ede::vehicle_occupancy_allowmovement(self, 1);
            namespace_84cff6185e39aa66::vehomn_hidewarning("outOfFuel", namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self), vehicleRef);
        }
        if (self.fuel <= 25 && self.fuel > 0 && !lowFuel) {
            lowFuel = 1;
            namespace_84cff6185e39aa66::vehomn_showwarning("lowFuel", namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self), vehicleRef);
            function_7c7694a53fa6720a(var_94d4410a7169a784);
            player = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(self);
            if (isdefined(player) && namespace_3c37cb17ade254d::issharedfuncdefined("ftue", "player_action")) {
                var_c4dc2501d7d2b68b = undefined;
                var_47415e4e37e805ff = undefined;
                foreach (var_c75620ca74d2e522 in level.var_354f6e3eebce5123) {
                    if (!isdefined(var_c4dc2501d7d2b68b)) {
                        var_c4dc2501d7d2b68b = var_c75620ca74d2e522;
                        var_47415e4e37e805ff = distancesquared(self.origin, var_c75620ca74d2e522.origin);
                    }
                    distancesqr = distancesquared(self.origin, var_c75620ca74d2e522.origin);
                    if (distancesqr < var_47415e4e37e805ff) {
                        var_c4dc2501d7d2b68b = var_c75620ca74d2e522;
                        var_47415e4e37e805ff = distancesquared(self.origin, var_c75620ca74d2e522.origin);
                    }
                }
                player [[ namespace_3c37cb17ade254d::getsharedfunc("ftue", "player_action") ]]("br_ftue_driving", var_c4dc2501d7d2b68b.origin);
            }
        } else if ((self.fuel > 25 || self.fuel <= 0) && lowFuel) {
            lowFuel = 0;
            namespace_84cff6185e39aa66::vehomn_hidewarning("lowFuel", namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self), vehicleRef);
            function_5a2b3f3e2cd84eb8(var_94d4410a7169a784);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454c
// Size: 0x70
function function_7c7694a53fa6720a(var_d479eeed3a4dd9df) {
    if (soundexists(var_d479eeed3a4dd9df)) {
        foreach (occupant in namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self)) {
            occupant stoplocalsound(var_d479eeed3a4dd9df);
            occupant playlocalsound(var_d479eeed3a4dd9df);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c3
// Size: 0x68
function function_5a2b3f3e2cd84eb8(var_d479eeed3a4dd9df) {
    if (soundexists(var_d479eeed3a4dd9df)) {
        foreach (occupant in namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(self)) {
            occupant stoplocalsound(var_d479eeed3a4dd9df);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4632
// Size: 0x1f4
function function_557da58e3ad8a579(var_a580bc9ccb88ccb4, var_62cc4a0ecde06ecf) {
    vehicle = namespace_f8065cafc523dba5::getvehicle();
    if (!isdefined(vehicle) || !isdefined(vehicle.fuel)) {
        if (var_62cc4a0ecde06ecf) {
            return "MP/CANNOT_USE_GAS_CAN_PALFA";
        }
        return "MP/CANNOT_USE_GAS_CAN";
    }
    ref = vehicle function_d93ec4635290febd();
    var_b7898aee43bb07ef = vehicle_interact_getleveldataforvehicle(ref);
    if (istrue(level.var_c0e521049f7ae2c9) && !var_62cc4a0ecde06ecf && ref == "veh9_palfa") {
        return "MP/CANNOT_USE_GAS_CAN_IN_PALFA";
    }
    if (var_62cc4a0ecde06ecf && ref != "veh9_palfa") {
        return "MP/CANNOT_USE_GAS_CAN_PALFA";
    }
    if (!var_62cc4a0ecde06ecf && (!isdefined(var_a580bc9ccb88ccb4.count) || var_a580bc9ccb88ccb4.count == 1)) {
        return "MP/GAS_CAN_IS_EMPTY";
    }
    if (ref == "veh9_hummer") {
        return "MP/CANNOT_USE_GAS_CAN_ELECTRIC";
    }
    if (var_b7898aee43bb07ef.var_29f1ea79ed2b40dd - vehicle.fuel < 1) {
        return "MP/VEHICLE_FULL_GAS";
    }
    var_a1153d5fc785fbe1 = var_a580bc9ccb88ccb4.count - 1;
    if (var_62cc4a0ecde06ecf && ref == "veh9_palfa") {
        var_a1153d5fc785fbe1 = 1000;
    }
    if (vehicle.fuel + var_a1153d5fc785fbe1 > var_b7898aee43bb07ef.var_29f1ea79ed2b40dd) {
        var_a1153d5fc785fbe1 = int(floor(var_b7898aee43bb07ef.var_29f1ea79ed2b40dd - vehicle.fuel));
    }
    vehicle.fuel = min(var_b7898aee43bb07ef.var_29f1ea79ed2b40dd, vehicle.fuel + var_a1153d5fc785fbe1);
    if (var_62cc4a0ecde06ecf) {
        var_a580bc9ccb88ccb4.count = 0;
    } else {
        var_a580bc9ccb88ccb4.count = int(clamp(var_a580bc9ccb88ccb4.count - var_a1153d5fc785fbe1, 1, 150));
    }
    vehicle namespace_84cff6185e39aa66::function_9da76b0be4b2a2d4();
    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onGasCanRefuel", vehicle, var_62cc4a0ecde06ecf);
    return undefined;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x482e
// Size: 0x132
function function_cf96fb01f9473d0d(var_f7658eecc6bcc46b) {
    vehicle = namespace_f8065cafc523dba5::getvehicle();
    if (!isdefined(vehicle) || !isdefined(vehicle.fuel)) {
        return [0:"MP/CANNOT_USE_GAS_CAN", 1:var_f7658eecc6bcc46b];
    }
    if (!isdefined(var_f7658eecc6bcc46b) || var_f7658eecc6bcc46b == 150) {
        return [0:"MP/GAS_CAN_FULL", 1:var_f7658eecc6bcc46b];
    }
    ref = vehicle function_d93ec4635290febd();
    var_b7898aee43bb07ef = vehicle_interact_getleveldataforvehicle(ref);
    if (ref == "veh9_hummer") {
        return [0:"MP/GAS_CAN_SIPHON_ON_EV", 1:var_f7658eecc6bcc46b];
    }
    var_8bffb7a992706b84 = 150 - var_f7658eecc6bcc46b + 1;
    if (vehicle.fuel < var_8bffb7a992706b84) {
        var_8bffb7a992706b84 = int(floor(vehicle.fuel));
    }
    vehicle.fuel = max(0, vehicle.fuel - var_8bffb7a992706b84);
    var_f7658eecc6bcc46b = int(clamp(var_f7658eecc6bcc46b + var_8bffb7a992706b84 - 1, 1, 150));
    vehicle namespace_84cff6185e39aa66::function_9da76b0be4b2a2d4();
    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onVehicleSiphoned", vehicle);
    return [0:undefined, 1:var_f7658eecc6bcc46b];
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4968
// Size: 0x1d9
function function_68cdb3d30284be07() {
    if (function_b7148a3bfc4defb2()) {
        return;
    }
    var_8797136ebd7115cb = vehicle_interact_getleveldataforvehicle(function_d93ec4635290febd());
    if (!isdefined(level.var_38cc7fdcf6109af7)) {
        level.var_38cc7fdcf6109af7 = getdvarint(@"hash_e42fc7d1e9196cff", 1) == 1;
    }
    if (!level.var_38cc7fdcf6109af7 || istrue(self.var_408e9e761c8463c5) || isdefined(self.var_c8ef06006ce062c1) && self.var_c8ef06006ce062c1 >= gettime() || !istrue(self.isempty) || !isdefined(var_8797136ebd7115cb) || !isdefined(var_8797136ebd7115cb.var_261258cc3a12af34) || var_8797136ebd7115cb.var_261258cc3a12af34 == "" || !self getscriptablehaspart(var_8797136ebd7115cb.var_261258cc3a12af34) || !self getscriptableparthasstate(var_8797136ebd7115cb.var_261258cc3a12af34, "on")) {
        return;
    }
    self notify("car_alarm_start");
    self endon("car_alarm_start");
    self endon("death");
    self setscriptablepartstate(var_8797136ebd7115cb.var_261258cc3a12af34, "on");
    namespace_92d413b0c411a750::event_broadcast_generic("cover_blown", self.origin, 2500, self);
    if (isdefined(level.var_503460970f6e03c1)) {
        self.var_c8ef06006ce062c1 = gettime() + level.var_503460970f6e03c1;
    } else {
        self.var_408e9e761c8463c5 = 1;
    }
    params = spawnstruct();
    params.vehicle = self;
    callback::callback("car_alarm_on", params);
    function_a6cf8b7a0d3630b5();
    if (self getscriptableparthasstate(var_8797136ebd7115cb.var_261258cc3a12af34, "off")) {
        self setscriptablepartstate(var_8797136ebd7115cb.var_261258cc3a12af34, "off");
    }
    callback::callback("car_alarm_off", params);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b48
// Size: 0x2e
function private function_a6cf8b7a0d3630b5(seconds) {
    self endon("vehicle_owner_update");
    if (isdefined(level.var_cb78b9c3bc5211e9)) {
        wait(level.var_cb78b9c3bc5211e9);
        return;
    }
    wait(5);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b7d
// Size: 0x1eb
function function_c01316c733e017b7() {
    if (!level.var_49b09bd5297d4967 || istrue(self.var_9d9132209b6bb2e7)) {
        return;
    }
    if (istrue(self.var_6a73f11d95750b87)) {
        return;
    }
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return;
    }
    data = function_29b4292c92443328(ref);
    if (!isdefined(data) || !isdefined(data.interact) || !isdefined(data.interact.lights) || data.interact.lights.size == 0) {
        return;
    }
    var_a75fff7173989b4d = function_5519f4e75a7e2d2b();
    foreach (light in data.interact.lights) {
        var_68d9e792fe9def4d = self getscriptablepartstate(light.tag, 1);
        if (!isdefined(var_68d9e792fe9def4d)) {
            /#
                assertmsg("part not found for light tag: " + light.tag);
            #/
        } else {
            if (light.type == "engine_is_on_day_and_night" && isdefined(var_68d9e792fe9def4d) && var_68d9e792fe9def4d == "off") {
                self setscriptablepartstate(light.tag, "on", 1);
            } else if (var_a75fff7173989b4d && light.type == "engine_is_on_at_night" && isdefined(var_68d9e792fe9def4d) && var_68d9e792fe9def4d == "off") {
                self setscriptablepartstate(light.tag, "on", 1);
            }
            self.var_6a73f11d95750b87 = 1;
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d6f
// Size: 0x1d9
function function_49eff91715ae3c1b() {
    if (!level.var_49b09bd5297d4967 || istrue(self.var_9d9132209b6bb2e7)) {
        return;
    }
    if (!istrue(self.var_6a73f11d95750b87)) {
        return;
    }
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return;
    }
    data = function_29b4292c92443328(ref);
    if (!isdefined(data) || !isdefined(data.interact) || !isdefined(data.interact.lights) || data.interact.lights.size == 0) {
        return;
    }
    var_a75fff7173989b4d = function_5519f4e75a7e2d2b();
    foreach (light in data.interact.lights) {
        if (!isdefined(self getscriptablepartstate(light.tag, 1))) {
            continue;
        }
        if (light.type == "engine_is_on_day_and_night" && self getscriptablepartstate(light.tag, 1) == "on") {
            self setscriptablepartstate(light.tag, "off", 1);
        } else if (var_a75fff7173989b4d && light.type == "engine_is_on_at_night" && self getscriptablepartstate(light.tag, 1) == "on") {
            self setscriptablepartstate(light.tag, "off", 1);
        }
    }
    self.var_6a73f11d95750b87 = undefined;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4f
// Size: 0x10b
function function_7394e322c553b3f0() {
    if (!level.var_49b09bd5297d4967 || istrue(self.var_9d9132209b6bb2e7)) {
        return;
    }
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return;
    }
    data = function_29b4292c92443328(ref);
    if (!isdefined(data) || !isdefined(data.interact) || !isdefined(data.interact.lights)) {
        return;
    }
    foreach (light in data.interact.lights) {
        if (light.type == "opening_door") {
            self setscriptablepartstate(light.tag, "on", 1);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5061
// Size: 0x22
function function_89205f33661ae7a7(var_b28b6726f299e0d0, var_715b3bac241cdb32) {
    function_8899ecb43445ed50(var_b28b6726f299e0d0, "on", var_715b3bac241cdb32);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x508a
// Size: 0x22
function function_acf62f098d0588eb(var_b28b6726f299e0d0, var_715b3bac241cdb32) {
    function_8899ecb43445ed50(var_b28b6726f299e0d0, "off", var_715b3bac241cdb32);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b3
// Size: 0x1a5
function function_8899ecb43445ed50(var_b28b6726f299e0d0, state, var_715b3bac241cdb32) {
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return;
    }
    data = function_29b4292c92443328(ref);
    if (!isdefined(data) || !isdefined(data.interact) || !isdefined(data.interact.lights)) {
        return;
    }
    foreach (light in data.interact.lights) {
        if (!self getscriptablehaspart(light.tag)) {
            continue;
        }
        if (self getscriptablepartstate(light.tag) == "death") {
            continue;
        }
        if (isdefined(var_b28b6726f299e0d0) && !isarray(var_b28b6726f299e0d0) && light.group != var_b28b6726f299e0d0) {
            continue;
        }
        if (isdefined(var_b28b6726f299e0d0) && isarray(var_b28b6726f299e0d0) && !array_contains(var_b28b6726f299e0d0, light.tag)) {
            continue;
        }
        if (isdefined(var_715b3bac241cdb32) && self getscriptablepartstate(light.tag, var_715b3bac241cdb32)) {
            self setscriptablepartstate(light.tag, var_715b3bac241cdb32);
        } else {
            self setscriptablepartstate(light.tag, state);
        }
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x525f
// Size: 0x140
function function_420769a30ab48a6b(var_b28b6726f299e0d0) {
    if (!isdefined(self) || !isdefined(self.var_aab9695c92b0ed96)) {
        return;
    }
    ref = function_d93ec4635290febd();
    if (!isdefined(ref) || !function_89dc39dc11f3988c(ref)) {
        return;
    }
    data = function_29b4292c92443328(ref);
    if (!isdefined(data) || !isdefined(data.interact) || !isdefined(data.interact.lights)) {
        return;
    }
    foreach (light in data.interact.lights) {
        if (isdefined(var_b28b6726f299e0d0) && !isarray(var_b28b6726f299e0d0) && light.group != var_b28b6726f299e0d0) {
            continue;
        }
        if (isdefined(var_b28b6726f299e0d0) && isarray(var_b28b6726f299e0d0) && !array_contains(var_b28b6726f299e0d0, light.tag)) {
            continue;
        }
        self.var_aab9695c92b0ed96[light.tag] = undefined;
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53a6
// Size: 0xe
function function_294a35251526f435() {
    self.var_9d9132209b6bb2e7 = 1;
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53bb
// Size: 0x93
function function_5519f4e75a7e2d2b() {
    /#
        if (getdvarint(@"hash_1a62e47ce9384616", 0) > 0) {
            return 1;
        }
    #/
    switch (level.script) {
    case #"hash_75b253ac88bdcfe":
    case #"hash_2920b53ef96ab8ff":
    case #"hash_2de697274b41ff79":
    case #"hash_4aa5d6e97851bdbd":
    case #"hash_7615425c9b75fff2":
    case #"hash_9606e63421f54d69":
    case #"hash_b7f388dfeb4ca432":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5455
// Size: 0x1d
function vehicle_interact_initdev() {
    var_d233ea035e59e2f4 = setdvarifuninitialized(@"hash_fb517a5a3d736fa0", 0);
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5479
// Size: 0x33
function function_c2f090b27fcd0e43(vehicle) {
    /#
        var_72141eab56fb408f = vehicle_interact_getinstancedataforvehicle(vehicle, 0);
        return getarraykeys(var_72141eab56fb408f.pointdata);
    #/
}

// Namespace vehicle_interact/namespace_141c4634b6ea7b27
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54b3
// Size: 0xc
function function_d66fa700ce5b783() {
    /#
        return "<unknown string>";
    #/
}

