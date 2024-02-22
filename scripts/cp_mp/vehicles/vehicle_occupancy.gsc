// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\team_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_dlog.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\customization\battle_tracks.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace vehicle_occupancy;

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c31
// Size: 0x195
function vehicle_occupancy_getleveldataforvehicle(vehiclename, create) {
    if (istrue(create) && (!function_89dc39dc11f3988c(vehiclename) || !isdefined(function_29b4292c92443328(vehiclename).occupancy))) {
        data = undefined;
        if (!function_89dc39dc11f3988c(vehiclename)) {
            data = spawnstruct();
        } else {
            data = function_29b4292c92443328(vehiclename);
        }
        data.occupancy = spawnstruct();
        data.occupancy.seatdata = [];
        data.occupancy.restrictions = [];
        data.occupancy.damagemodifier = -1;
        data.occupancy.camera = "none";
        data.occupancy.threatbiasgroup = "Level_Vehicle";
        data.occupancy.exitextents = [];
        data.occupancy.exitoffsets = [];
        data.occupancy.exitdirections = [];
        data.occupancy.damagefeedbackgrouplight = "driver";
        data.occupancy.damagefeedbackgroupheavy = "all";
        level.var_a0b2c978ca57ffc5[vehiclename] = data;
    }
    if (function_89dc39dc11f3988c(vehiclename)) {
        return function_29b4292c92443328(vehiclename).occupancy;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dcd
// Size: 0x43
function private function_c9b87beb89ec12e2(player, vehicle, exitvehicle) {
    if (isdefined(player)) {
        if (player function_793f941d7dff15ed()) {
            player function_c0505f05660d120c(0, exitvehicle);
        }
        /#
            assert(!player function_793f941d7dff15ed());
        #/
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e17
// Size: 0x2f
function vehicle_occupancy_getleveldataforseat(vehiclename, seatid, create) {
    return vehicle_occupancy_getleveldataforvehicle(vehiclename).seatdata[seatid];
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4e
// Size: 0xaa
function vehicle_occupancy_registerinstance(vehicle) {
    vehicle.occupants = [];
    vehicle.occupantsreserving = [];
    vehicle.isempty = 1;
    /#
        leveldata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = array_removeundefined(leveldata.debuginstances);
        leveldata.debuginstances = array_add(leveldata.debuginstances, vehicle);
    #/
    if (issharedfuncdefined("vehicle_occupancy", "registerInstance")) {
        [[ getsharedfunc("vehicle_occupancy", "registerInstance") ]](vehicle);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eff
// Size: 0x5f
function vehicle_occupancy_deregisterinstance(vehicle) {
    vehicle.occupants = undefined;
    vehicle.occupantsreserving = undefined;
    vehicle.isempty = undefined;
    vehicle.preventspawninto = undefined;
    if (issharedfuncdefined("vehicle_occupancy", "deregisterInstance")) {
        [[ getsharedfunc("vehicle_occupancy", "deregisterInstance") ]](vehicle);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f65
// Size: 0x18
function vehicle_occupancy_instanceisregistered(vehicle) {
    return isdefined(vehicle.occupants);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f85
// Size: 0xa6
function vehicle_occupancy_getallvehicleseats(vehicle, var_6be731ec00f344cb) {
    /#
        assertex(isdefined(vehicle.vehiclename), "vehicle.vehicleName must be defined before its seats can be querried.");
    #/
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    /#
        assertex(!var_6be731ec00f344cb || isdefined(var_e2818ad39a3341b4), "vehicle_occupancy_getLevelDataForVehicle( " + vehicle.vehiclename + ", true ) must be called before this vehicle's seats can be querried.");
    #/
    if (isdefined(var_e2818ad39a3341b4) && isdefined(var_e2818ad39a3341b4.seatdata)) {
        return getarraykeys(var_e2818ad39a3341b4.seatdata);
    } else {
        return undefined;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2032
// Size: 0x84
function vehicle_occupancy_getavailablevehicleseats(vehicle) {
    var_109a35ef4925c2b1 = [];
    seatids = vehicle_occupancy_getallvehicleseats(vehicle);
    foreach (seatid in seatids) {
        if (!vehicle_occupancy_seatisavailable(vehicle, seatid)) {
            continue;
        }
        var_109a35ef4925c2b1[var_109a35ef4925c2b1.size] = seatid;
    }
    return var_109a35ef4925c2b1;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20be
// Size: 0x15e
function function_d3d95972f58ad2bc(vehicle) {
    var_109a35ef4925c2b1 = vehicle_occupancy_getavailablevehicleseats(vehicle);
    if (!isdefined(var_109a35ef4925c2b1) || var_109a35ef4925c2b1.size <= 0) {
        return undefined;
    } else if (var_109a35ef4925c2b1.size == 1) {
        return var_109a35ef4925c2b1[0];
    }
    var_585f102c0882558a = var_109a35ef4925c2b1[0];
    var_5c49327452ef41bb = -1;
    var_e1a1a4f1ce293589 = vehicle_interact_getleveldataforvehicle(vehicle.vehiclename).var_9d0537be150542b3;
    /#
        assertex(isdefined(var_e1a1a4f1ce293589), "The seatEnterArray must be defined!");
    #/
    foreach (seatid in var_109a35ef4925c2b1) {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
        spawnpriority = var_c50b485a43752fd.spawnpriority;
        var_76bb3b42bfebb3ec = array_find(var_e1a1a4f1ce293589, seatid);
        if (!isdefined(spawnpriority) && isdefined(var_76bb3b42bfebb3ec)) {
            spawnpriority = var_e1a1a4f1ce293589.size - var_76bb3b42bfebb3ec;
        } else if (!isdefined(spawnpriority)) {
            spawnpriority = 0;
        } else {
            spawnpriority = int(max(0, spawnpriority));
        }
        if (spawnpriority > var_5c49327452ef41bb) {
            var_585f102c0882558a = seatid;
            var_5c49327452ef41bb = spawnpriority;
        }
    }
    return var_585f102c0882558a;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2224
// Size: 0xa9
function vehicle_occupancy_seatisavailable(vehicle, seatid, player) {
    /#
        assertex(isdefined(vehicle.occupants) && isdefined(vehicle.occupantsreserving), "vehicle_occupancy_registerInstance() must be called on this vehicle before its seats can be querried.");
    #/
    occupant = vehicle.occupants[seatid];
    var_5dc30f34f408331d = vehicle.occupantsreserving[seatid];
    if (!isdefined(occupant) && !isdefined(var_5dc30f34f408331d)) {
        return 1;
    }
    if (isdefined(player)) {
        if (isdefined(occupant) && occupant == player) {
            return 1;
        }
        if (isdefined(var_5dc30f34f408331d) && var_5dc30f34f408331d == player) {
            return 1;
        }
    }
    return 0;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d5
// Size: 0x67
function vehicle_occupancy_getseatoccupant(vehicle, seatid, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    /#
        assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "vehicle_occupancy_registerInstance() must be called on this vehicle before its occupants can be querried.");
    #/
    if (isdefined(vehicle.occupants)) {
        return vehicle.occupants[seatid];
    } else {
        return undefined;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2343
// Size: 0x48
function vehicle_occupancy_getalloccupants(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    /#
        assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "vehicle_occupancy_registerInstance() must be called on this vehicle before its occupants can be querried.");
    #/
    return vehicle.occupants;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2393
// Size: 0x9a
function function_efa75aa7f0a1289(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    /#
        assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "vehicle_occupancy_registerInstance() must be called on this vehicle before its occupants can be querried.");
    #/
    occupants = vehicle.occupants;
    if (isdefined(vehicle.var_8784c427b1af24a6)) {
        occupants = array_combine_unique(occupants, vehicle.var_8784c427b1af24a6);
    }
    if (isdefined(vehicle.var_3a442282fb9074e1)) {
        occupants = array_combine_unique(occupants, vehicle.var_3a442282fb9074e1);
    }
    return occupants;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2435
// Size: 0x6a
function vehicle_occupancy_getalloccupantsandreserving(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    /#
        assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "vehicle_occupancy_registerInstance() must be called on this vehicle before its occupants can be querried.");
    #/
    if (!isdefined(vehicle.occupants)) {
        return undefined;
    }
    return array_combine_unique(vehicle.occupants, vehicle.occupantsreserving);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a7
// Size: 0x59
function vehicle_occupancy_getreserving(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    /#
        assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "vehicle_occupancy_registerInstance() must be called on this vehicle before its occupants can be querried.");
    #/
    if (!isdefined(vehicle.occupants)) {
        return undefined;
    }
    return vehicle.occupantsreserving;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2508
// Size: 0x86
function vehicle_occupancy_getoccupantseat(vehicle, player) {
    /#
        assertex(isdefined(vehicle.occupants), "vehicle_occupancy_registerInstance() must be called on this vehicle before its occupants can be querried.");
    #/
    foreach (seatid, occupant in vehicle.occupants) {
        if (occupant == player) {
            return seatid;
        }
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2596
// Size: 0x97
function vehicle_occupancy_occupantisvehicledriver(player) {
    if (isdefined(player.vehicle)) {
        seatid = vehicle_occupancy_getoccupantseat(player.vehicle, player);
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(player.vehicle.vehiclename, seatid);
        if (isdefined(var_c50b485a43752fd.animtag)) {
            var_c39487b3181a24dc = tolower(var_c50b485a43752fd.animtag);
            if (var_c39487b3181a24dc == "tag_seat_0") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2635
// Size: 0x39
function vehicle_occupancy_getdriver(vehicle, var_6ecb77fd1f27c667) {
    driverseatid = vehicle_occupancy_getdriverseat(vehicle, var_6ecb77fd1f27c667);
    if (isdefined(driverseatid)) {
        return vehicle_occupancy_getseatoccupant(vehicle, driverseatid, !istrue(var_6ecb77fd1f27c667));
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2676
// Size: 0xf0
function vehicle_occupancy_getdriverseat(vehicle, var_6ecb77fd1f27c667) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename, !istrue(var_6ecb77fd1f27c667));
    if (!isdefined(var_e2818ad39a3341b4)) {
        return undefined;
    }
    driverseatid = var_e2818ad39a3341b4.driverseatid;
    if (!isdefined(driverseatid)) {
        if (isdefined(var_e2818ad39a3341b4.seatdata)) {
            foreach (seatid, seatdata in var_e2818ad39a3341b4.seatdata) {
                if (isdefined(seatdata.animtag) && tolower(seatdata.animtag) == "tag_seat_0") {
                    driverseatid = seatid;
                    break;
                }
            }
        }
        var_e2818ad39a3341b4.driverseatid = driverseatid;
    }
    return driverseatid;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276e
// Size: 0x5f
function vehicle_occupancy_isdriverseat(vehicle, seatid) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (!isdefined(var_c50b485a43752fd.animtag)) {
        return 0;
    }
    if (tolower(var_c50b485a43752fd.animtag) != "tag_seat_0") {
        return 0;
    }
    return 1;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d5
// Size: 0x65c
function vehicle_occupancy_enter(vehicle, seatid, player, data, immediate) {
    /#
        assertex(isdefined(vehicle.vehiclename), "vehicle.vehicleName must be defined before this vehicle can be entered.");
    #/
    /#
        assertex(isdefined(vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename)), "vehicle_occupancy_getLevelDataForVehicle( " + vehicle.vehiclename + ", true ) must be called before this vehicle can be entered.");
    #/
    /#
        assertex(isdefined(vehicle.occupants) && isdefined(vehicle.occupantsreserving), "vehicle_occupancy_registerInstance() must be called on this vehicle before it can be entered.");
    #/
    /#
        assertex(!isdefined(data) || !isdefined(data.success), "You cannot predefine .success on data passed to vehicle_occupancy_enter().");
    #/
    var_7c80ef8134378dea = 0;
    if (isdefined(data) && isdefined(data.useonspawn)) {
        var_7c80ef8134378dea = 1;
    }
    if (!var_7c80ef8134378dea && !player _isalive()) {
        return;
    }
    if (istrue(player.inlaststand)) {
        return;
    }
    if (istrue(vehicle.isdestroyed)) {
        return;
    }
    foreach (var_5dc30f34f408331d in vehicle.occupantsreserving) {
        if (isdefined(var_5dc30f34f408331d) && var_5dc30f34f408331d == player) {
            return;
        }
    }
    var_fc7c7a874b43a31a = vehicle_occupancy_getoccupantseat(vehicle, player);
    if (istrue(vehicle_occupancy_seatisavailable(vehicle, seatid, player))) {
        vehicle_occupancy_stopmonitoringoccupant(player);
        if (!isdefined(data)) {
            data = spawnstruct();
        }
        data.immediate = istrue(immediate);
        data.raceendnotify = "vehicle_race_last_call";
        data.raceendon = "vehicle_race_finished";
        if (!data.immediate) {
            thread vehicle_occupancy_raceplayerdeathdisconnect(player, data);
            thread vehicle_occupancy_racevehicledeath(vehicle, data);
            thread vehicle_occupancy_raceseatunavailable(vehicle, player, seatid, var_fc7c7a874b43a31a, data);
            thread vehicle_occupancy_racecomplete(var_fc7c7a874b43a31a, seatid, data);
        }
        if (isdefined(var_fc7c7a874b43a31a)) {
            thread vehicle_occupancy_exitstart(vehicle, var_fc7c7a874b43a31a, seatid, player, data);
        }
        if (isdefined(seatid)) {
            thread vehicle_occupancy_enterstart(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        }
        vehicle_occupancy_updatefull(vehicle);
        vehicle_occupancy_updateempty(vehicle);
        if (!data.immediate) {
            data waittill(data.raceendnotify);
            waittillframeend();
            data notify(data.raceendon);
        }
        if (!namespace_141c4634b6ea7b27::vehicle_interact_instanceisregistered(vehicle)) {
            return;
        }
        success = vehicle_occupancy_raceresults(vehicle, player, var_fc7c7a874b43a31a, seatid, data);
        if (isdefined(var_fc7c7a874b43a31a)) {
            thread vehicle_occupancy_exitend(vehicle, var_fc7c7a874b43a31a, seatid, player, data);
        }
        if (isdefined(seatid)) {
            thread vehicle_occupancy_enterend(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        }
        vehicle_occupancy_updatefull(vehicle);
        vehicle_occupancy_updateempty(vehicle);
        if (success) {
            if (issharedfuncdefined("vehicle_occupancy", "changedSeats")) {
                [[ getsharedfunc("vehicle_occupancy", "changedSeats") ]](player, vehicle, var_fc7c7a874b43a31a, seatid);
            }
            params = {seatid:seatid, player:player, var_fc7c7a874b43a31a:var_fc7c7a874b43a31a, vehicle:vehicle};
            level callback::callback("changedSeats", params);
            thread vehicle_occupancy_monitoroccupant(vehicle, player, seatid);
            player enablereloading();
            if (isdefined(var_fc7c7a874b43a31a)) {
                var_df653126c71ef4ca = vehicle_occupancy_isdriverseat(vehicle, var_fc7c7a874b43a31a);
                if (istrue(var_df653126c71ef4ca)) {
                    player stopchallengetimer("driving");
                }
            }
            if (isdefined(seatid)) {
                var_df653126c71ef4ca = vehicle_occupancy_isdriverseat(vehicle, seatid);
                if (istrue(var_df653126c71ef4ca)) {
                    vehicle function_9e710c9f3a15ffda();
                    if (isdefined(player.vehiclecustomization)) {
                        vehicleref = vehicle function_d93ec4635290febd();
                        if (!isdefined(vehicle.mtx) && !istrue(vehicle.var_7ee6203c5532a9e6)) {
                            mtx = function_471cde1983a05f66(player, vehicleref);
                            function_4201160d49c885a7(vehicle, mtx);
                        }
                        if (isdefined(player.vehiclecustomization.var_94b01ac7cdddf04d[vehicleref])) {
                            vehicle setvehiclehornsound(player.vehiclecustomization.var_94b01ac7cdddf04d[vehicleref]);
                        } else if (isdefined(vehicle.mtx) && isdefined(vehicle.mtx.vehiclehorn)) {
                            vehicle setvehiclehornsound(vehicle.mtx.vehiclehorn);
                        } else {
                            vehicle setvehiclehornsound("");
                        }
                    }
                    player startchallengetimer("driving");
                }
            }
            if (!isdefined(var_fc7c7a874b43a31a)) {
                var_6c6d078a43295c39 = "ENTERED_VEHICLE";
                if (issharedfuncdefined("pmc_missions", "onVehicleEnter")) {
                    [[ getsharedfunc("pmc_missions", "onVehicleEnter") ]](player, vehicle);
                }
            } else {
                var_6c6d078a43295c39 = "SEAT_SWITCH";
            }
            namespace_6c0d09f1e6fc2bc5::battle_tracks_vehicleoccupancyenter(vehicle, player, seatid, var_fc7c7a874b43a31a);
            vehicle_dlog_enterevent(vehicle, player, seatid, var_6c6d078a43295c39);
        } else if (isdefined(var_fc7c7a874b43a31a) && !istrue(data.vehicledeath)) {
            if (istrue(data.playerdeath) || istrue(data.playerlaststand) || istrue(data.playerdisconnect)) {
                var_84dcd1ab2ae1dffa = spawnstruct();
                var_84dcd1ab2ae1dffa.playerdeath = data.playerdeath;
                var_84dcd1ab2ae1dffa.playerlaststand = data.playerlaststand;
                var_84dcd1ab2ae1dffa.var_d4b9aa76041ab0a9 = data.var_d4b9aa76041ab0a9;
                var_84dcd1ab2ae1dffa.playerdisconnect = data.playerdisconnect;
                thread vehicle_occupancy_exit(vehicle, var_fc7c7a874b43a31a, player, var_84dcd1ab2ae1dffa, 1);
            } else {
                vehicle_occupancy_reenter(vehicle, var_fc7c7a874b43a31a, seatid, player, data);
            }
        }
        if (istrue(player.var_65219c911f198c95)) {
            if (!isdefined(player.var_3570f4b5b40c02e4)) {
                player thread namespace_5a51aa78ea0b1b9f::play_emp_scramble(4);
                player.var_3570f4b5b40c02e4 = 1;
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e38
// Size: 0x31a
function vehicle_occupancy_exit(vehicle, seatid, player, data, immediate, var_fe757bf1a5d559b4) {
    /#
        assertex(isdefined(vehicle.vehiclename), "vehicle.vehicleName must be defined before this vehicle can be exited.");
    #/
    /#
        assertex(isdefined(vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename)), "vehicle_occupancy_getLevelDataForVehicle( " + vehicle.vehiclename + ", true ) must be called before this vehicle can be exited.");
    #/
    /#
        assertex(isdefined(vehicle.occupants) && isdefined(vehicle.occupantsreserving), "vehicle_occupancy_registerInstance() must be called on this vehicle before it can be exited.");
    #/
    if (isdefined(data)) {
        /#
            assertex(!isdefined(data.success), "You cannot predefine .success on data passed to vehicle_occupancy_exit().");
        #/
    }
    if (isdefined(player) && player function_d09168b16803f5be()) {
        player notify("interrupt_roof_exit");
    }
    var_fc7c7a874b43a31a = seatid;
    if (isdefined(player)) {
        if (!isdefined(var_fc7c7a874b43a31a)) {
            var_fc7c7a874b43a31a = vehicle_occupancy_getoccupantseat(vehicle, player);
        }
        if (!player _isalive()) {
            immediate = 1;
        }
        if (istrue(player.inlaststand)) {
            immediate = 1;
        }
        vehicle_occupancy_stopmonitoringoccupant(player);
    } else {
        immediate = 1;
        vehicle_occupancy_purgedataforseatinstance(vehicle, var_fc7c7a874b43a31a);
    }
    if (istrue(vehicle.isdestroyed)) {
        immediate = 1;
    }
    /#
        assertex(isdefined(var_fc7c7a874b43a31a), "Attempted to exit a vehicle without a valid seatId.");
    #/
    if (!isdefined(data)) {
        data = spawnstruct();
    }
    data.immediate = istrue(immediate);
    data.raceendnotify = "vehicle_race_last_call";
    data.raceendon = "vehicle_race_finished";
    if (!data.immediate) {
        thread vehicle_occupancy_raceplayerdeathdisconnect(player, data);
        thread vehicle_occupancy_racevehicledeath(vehicle, data);
        thread vehicle_occupancy_racecomplete(var_fc7c7a874b43a31a, undefined, data);
    }
    thread vehicle_occupancy_exitstart(vehicle, var_fc7c7a874b43a31a, undefined, player, data, var_fe757bf1a5d559b4);
    if (!data.immediate) {
        data waittill(data.raceendnotify);
        waittillframeend();
        data notify(data.raceendon);
    }
    success = vehicle_occupancy_raceresults(vehicle, player, var_fc7c7a874b43a31a, undefined, data);
    thread vehicle_occupancy_exitend(vehicle, var_fc7c7a874b43a31a, undefined, player, data, var_fe757bf1a5d559b4);
    vehicle_occupancy_updatefull(vehicle);
    vehicle_occupancy_updateempty(vehicle);
    if (istrue(vehicle.isheli) && istrue(vehicle.isempty)) {
        vehicle thread function_ba42cf4e5bb24367();
    }
    if (success) {
        if (isdefined(player)) {
            player enablereloading();
            var_df653126c71ef4ca = vehicle_occupancy_isdriverseat(vehicle, var_fc7c7a874b43a31a);
            if (istrue(var_df653126c71ef4ca)) {
                player stopchallengetimer("driving");
            }
        }
    } else if (!istrue(data.playerdeath) && !istrue(data.playerlaststand) && !istrue(data.var_d4b9aa76041ab0a9) && !istrue(data.var_f276d4e53593ec9a) && !istrue(data.playerdisconnect) && !istrue(data.vehicledeath)) {
        vehicle_occupancy_reenter(vehicle, var_fc7c7a874b43a31a, undefined, player, data);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3159
// Size: 0x6c
function vehicle_occupancy_isfriendlytoplayer(vehicle, player) {
    if (level.teambased) {
        return vehicle_occupancy_isfriendlytoteam(vehicle, player.team);
    } else {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return (isdefined(vehicle.playerfriendlyto) && vehicle.playerfriendlyto == player);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31cc
// Size: 0x6c
function vehicle_occupancy_isenemytoplayer(vehicle, player) {
    if (level.teambased) {
        return vehicle_occupancy_isenemytoteam(vehicle, player.team);
    } else {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return (isdefined(vehicle.playerfriendlyto) && vehicle.playerfriendlyto != player);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x323f
// Size: 0x5c
function vehicle_occupancy_isneutraltoplayer(vehicle, player) {
    if (level.teambased) {
        return vehicle_occupancy_isneutraltoteam(vehicle, player.team);
    } else {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return !isdefined(vehicle.playerfriendlyto);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a2
// Size: 0x3d
function vehicle_occupancy_getplayerfriendlyto(vehicle) {
    if (!level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return vehicle.playerfriendlyto;
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e7
// Size: 0x57
function vehicle_occupancy_isfriendlytoteam(vehicle, team) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return (isdefined(vehicle.teamfriendlyto) && vehicle.teamfriendlyto == team);
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3346
// Size: 0x57
function vehicle_occupancy_isenemytoteam(vehicle, team) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return (isdefined(vehicle.teamfriendlyto) && vehicle.teamfriendlyto != team);
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a5
// Size: 0x47
function vehicle_occupancy_isneutraltoteam(vehicle, team) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return !isdefined(vehicle.teamfriendlyto);
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f4
// Size: 0x3d
function vehicle_occupancy_getteamfriendlyto(vehicle) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return vehicle.teamfriendlyto;
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3439
// Size: 0x22
function vehicle_occupancy_setfriendlystatusdirty(vehicle) {
    vehicle.friendlystatusdirty = 1;
    namespace_141c4634b6ea7b27::vehicle_interact_setvehicledirty(vehicle);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3462
// Size: 0x29b
function vehicle_occupancy_cleanfriendlystatus(vehicle) {
    if (level.teambased) {
        var_c61ff99ab15eae4b = 0;
        var_757203a7499dfc71 = vehicle.teamfriendlyto;
        if (isdefined(vehicle.team) && vehicle.team != "neutral") {
            vehicle.teamfriendlyto = vehicle.team;
            vehicle.friendlystatusdirty = undefined;
            var_c61ff99ab15eae4b = 1;
        }
        if (!var_c61ff99ab15eae4b) {
            foreach (occupant in vehicle.occupants) {
                if (isdefined(occupant)) {
                    vehicle.teamfriendlyto = occupant.team;
                    vehicle.friendlystatusdirty = undefined;
                    var_c61ff99ab15eae4b = 1;
                    break;
                }
            }
        }
        if (!var_c61ff99ab15eae4b) {
            vehicle.teamfriendlyto = undefined;
            vehicle.friendlystatusdirty = undefined;
        }
        if (!isdefined(var_757203a7499dfc71) && !isdefined(vehicle.teamfriendlyto)) {
            return 0;
        }
        if (isdefined(var_757203a7499dfc71) && isdefined(vehicle.teamfriendlyto) && var_757203a7499dfc71 == vehicle.teamfriendlyto) {
            return 0;
        }
        vehicle_occupancy_friendlystatuschangedcallback(vehicle, var_757203a7499dfc71, vehicle.teamfriendlyto);
        return 1;
    } else {
        var_c61ff99ab15eae4b = 0;
        var_49dc0cd42efb83e9 = vehicle.playerfriendlyto;
        if (isdefined(vehicle.originalowner)) {
            vehicle.playerfriendlyto = vehicle.originalowner;
            vehicle.friendlystatusdirty = undefined;
            var_c61ff99ab15eae4b = 1;
        }
        if (!var_c61ff99ab15eae4b) {
            occupants = vehicle_occupancy_getalloccupants(vehicle);
            foreach (occupant in occupants) {
                if (isdefined(occupant)) {
                    vehicle.playerfriendlyto = occupant;
                    vehicle.friendlystatusdirty = undefined;
                    return;
                }
            }
        }
        if (!isdefined(var_49dc0cd42efb83e9) && !isdefined(vehicle.playerfriendlyto)) {
            return 0;
        }
        if (isdefined(var_49dc0cd42efb83e9) && isdefined(vehicle.playerfriendlyto) && var_49dc0cd42efb83e9 == vehicle.playerfriendlyto) {
            return 0;
        }
        vehicle_occupancy_friendlystatuschangedcallback(vehicle, var_49dc0cd42efb83e9, vehicle.playerfriendlyto);
        return 1;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3704
// Size: 0x112
function vehicle_occupancy_friendlystatuschangedcallback(vehicle, var_965ea26e6eb230b9, var_52312180ef1940be) {
    /#
        if (level.teambased) {
            /#
                assertex(!isdefined(var_965ea26e6eb230b9) || isstring(var_965ea26e6eb230b9), "vehicle.vehicleName must be defined before this vehicle can be exited.");
            #/
            /#
                assertex(!isdefined(var_52312180ef1940be) || isstring(var_52312180ef1940be), "melee");
            #/
        } else {
            /#
                assertex(!isdefined(var_965ea26e6eb230b9) || isplayer(var_965ea26e6eb230b9), "physicscontents_vehicle");
            #/
            /#
                assertex(!isdefined(var_52312180ef1940be) || isplayer(var_52312180ef1940be), "execution_victim");
            #/
        }
    #/
    namespace_2a495135d56d95b7::vehicle_compass_friendlystatuschangedcallback(vehicle, var_965ea26e6eb230b9, var_52312180ef1940be);
    if (utility::issharedfuncdefined("game", "checkInvalidOOBTriggers") && namespace_f8065cafc523dba5::function_1e4a0e61fdb00e32(vehicle)) {
        vehicle function_f3bb4f4911a1beb2("game", "checkInvalidOOBTriggers");
    }
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    if (!isdefined(var_e2818ad39a3341b4.friendlystatuschangedcallback)) {
        return;
    }
    thread [[ var_e2818ad39a3341b4.friendlystatuschangedcallback ]](vehicle, var_965ea26e6eb230b9, var_52312180ef1940be);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381d
// Size: 0x44
function vehicle_occupancy_setoriginalowner(vehicle, player) {
    /#
        assertex(!isdefined(vehicle.originalowner), "vehicle_occupancy_setOriginalOwner called when the vehicle already has an original owner.");
    #/
    vehicle.originalowner = player;
    vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3868
// Size: 0xa7
function vehicle_occupancy_setowner(vehicle, player, var_57c14bf60c5be4ab, var_13cc810b9974360e) {
    if (!isdefined(vehicle.owners)) {
        vehicle.owners = [];
    } else {
        vehicle_occupancy_clearowner(vehicle, player);
        vehicle.owners = array_removeundefined(vehicle.owners);
    }
    vehicle.owners[vehicle.owners.size] = player;
    if (isdefined(var_13cc810b9974360e) && var_13cc810b9974360e == -1) {
        goto LOC_0000009d;
    }
    thread vehicle_occupancy_watchowner(vehicle, player, var_57c14bf60c5be4ab, var_13cc810b9974360e);
LOC_0000009d:
    vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3916
// Size: 0x220
function vehicle_occupancy_updateowner(vehicle) {
    vehicle notify("vehicle_owner_update");
    previousowner = vehicle.owner;
    var_feffbdc57f0856fa = vehicle.ownerteam;
    var_b3aede46434bb626 = undefined;
    if (isdefined(vehicle.owners)) {
        for (i = vehicle.owners.size - 1; i >= 0; i--) {
            if (vehicle_occupancy_isplayervalidowner(vehicle, vehicle.owners[i])) {
                var_b3aede46434bb626 = vehicle.owners[i];
                break;
            }
        }
    }
    if (!isdefined(var_b3aede46434bb626)) {
        if (vehicle_occupancy_isplayervalidowner(vehicle, vehicle.originalowner)) {
            var_b3aede46434bb626 = vehicle.originalowner;
        }
    }
    vehicle.owner = var_b3aede46434bb626;
    ownerchanged = 0;
    if (isdefined(var_b3aede46434bb626) || isdefined(previousowner)) {
        if (!isdefined(var_b3aede46434bb626) && isdefined(previousowner)) {
            ownerchanged = 1;
        } else if (isdefined(var_b3aede46434bb626) && !isdefined(previousowner)) {
            ownerchanged = 1;
        } else if (var_b3aede46434bb626 != previousowner) {
            ownerchanged = 1;
        }
    }
    var_1fbda3bed6b9855f = 0;
    if (isdefined(var_b3aede46434bb626)) {
        if (!isdefined(var_feffbdc57f0856fa) || var_feffbdc57f0856fa != var_b3aede46434bb626.team) {
            var_1fbda3bed6b9855f = 1;
        }
        vehicle.ownerteam = var_b3aede46434bb626.team;
        namespace_2a495135d56d95b7::vehicle_compass_setteamfriendlyto(vehicle, var_b3aede46434bb626.team);
        thread vehicle_occupancy_watchownerjoinedteam(vehicle, var_b3aede46434bb626);
    } else {
        if (ownerchanged) {
            var_1fbda3bed6b9855f = 1;
        }
        vehicle.ownerteam = undefined;
    }
    if (ownerchanged) {
        if (!level.teambased) {
            vehicle_occupancy_setfriendlystatusdirty(vehicle);
        }
        vehicle function_a2d1400bcf46869a();
    }
    if (issharedfuncdefined("vehicle_occupancy", "updateOwner")) {
        [[ getsharedfunc("vehicle_occupancy", "updateOwner") ]](vehicle);
    }
    if (issharedfuncdefined(vehicle.vehiclename, "updateOwner")) {
        [[ getsharedfunc(vehicle.vehiclename, "updateOwner") ]](vehicle, var_b3aede46434bb626, ownerchanged, var_1fbda3bed6b9855f);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b3d
// Size: 0x78
function vehicle_occupancy_clearowner(vehicle, player) {
    vehicle notify("vehicle_clear_owner_" + player getentitynumber());
    if (isdefined(vehicle.owners)) {
        vehicle.owners = array_remove(vehicle.owners, player);
    }
    if (isdefined(vehicle.owner) && vehicle.owner == player) {
        vehicle_occupancy_updateowner(vehicle);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bbc
// Size: 0xbb
function vehicle_occupancy_setteam(vehicle, team) {
    var_4bcf5a0c6c1e3a44 = !isdefined(vehicle.team) || vehicle.team != team;
    vehicle.team = team;
    if (vehicle.classname == "script_vehicle") {
        vehicle setvehicleteam(team);
    }
    if (var_4bcf5a0c6c1e3a44) {
        if (level.teambased) {
            vehicle_occupancy_setfriendlystatusdirty(vehicle);
        }
    }
    if (issharedfuncdefined(vehicle.vehiclename, "updateTeam")) {
        [[ getsharedfunc(vehicle.vehiclename, "updateTeam") ]](vehicle, team, var_4bcf5a0c6c1e3a44);
    }
    vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7e
// Size: 0x1e0
function vehicle_occupancy_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_occupancy_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.occupancy), "vehicle_occupancy_init() should only be called once.");
    #/
    leveldata = spawnstruct();
    level.vehicle.occupancy = leveldata;
    leveldata.vehicledata = [];
    leveldata.var_77b46b8810cb73f3 = getdvarint(@"hash_4bf0d02ff4ac62ed", 1) > 0;
    if (leveldata.var_77b46b8810cb73f3) {
        leveldata.var_51c0466d6f15a77f = 0;
        leveldata.var_df81eeab4c9e5f64 = [];
    }
    vehicle_occupancy_initdebug();
    /#
        issharedfuncdefined("<unknown string>", "<unknown string>", 1);
    #/
    [[ getsharedfunc("vehicle_occupancy", "init") ]]();
    level.var_73d6c6366970020 = getdvarint(@"hash_abd3bd3c25a13d43", 1);
    level.var_351aab391da578a8 = getdvarint(@"hash_2bf0e47506040359", 1) == 1;
    level.var_abe9bcb8a67ff917 = getdvarfloat(@"hash_83928d2d50dc276c") + 50;
    level.var_d9dc5b053fb57856 = getdvarfloat(@"hash_c9b7b0f34821b869") + 50;
    level.var_df44f8cc05382071 = getdvarfloat(@"hash_94db90babe43cdc4", 100);
    level.var_49b09bd5297d4967 = getdvarint(@"hash_a459bb531af563b7", 1);
    if (isusingmatchrulesdata()) {
        vehicleunmannedkillprotectiontimeout = getmatchrulesdata("commonOption", "vehicleUnmannedKillProtectionTimeout");
        if (!isdefined(vehicleunmannedkillprotectiontimeout) || vehicleunmannedkillprotectiontimeout == 0) {
            vehicleunmannedkillprotectiontimeout = 4;
        }
        leveldata.var_772978c4701134fc = vehicleunmannedkillprotectiontimeout;
    }
    if (istrue(level.var_351aab391da578a8)) {
        level.scr_animtree["player_exit_vehicle_to_roof"] = %script_model;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e65
// Size: 0x144
function vehicle_occupancy_enterstart(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    data endon(data.raceendon);
    if (istrue(player.insertingarmorplate)) {
        player notify("try_armor_cancel", "vehicle_enter");
    }
    function_eae2223216b7712c(vehicle, player);
    vehicle.occupantsreserving[seatid] = player;
    player.vehiclereserved = vehicle;
    namespace_141c4634b6ea7b27::vehicle_interact_setvehicledirty(vehicle);
    namespace_141c4634b6ea7b27::vehicle_interact_setpointsdirty(vehicle);
    namespace_141c4634b6ea7b27::vehicle_interact_updateusability(vehicle);
    timestamp = undefined;
    if (data.immediate) {
        timestamp = gettime();
    }
    if (isdefined(data.enterstartwaitmsg)) {
        player waittill(data.enterstartwaitmsg);
    }
    vehicle_occupancy_deleteseatcorpse(vehicle, seatid, 1);
    enterstartcallback = vehicle_occupancy_getenterstartcallbackforseat(vehicle, seatid);
    if (isdefined(enterstartcallback)) {
        [[ enterstartcallback ]](vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
    if (!isdefined(data.enterstartcomplete)) {
        data.enterstartcomplete = 1;
    }
    if (data.immediate) {
        /#
            assertex(timestamp == gettime(), "Data specifies immediate, but enterStartCallback did not execute immediately.");
        #/
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fb0
// Size: 0x121
function vehicle_occupancy_exitstart(vehicle, seatid, var_7558f98f3236963d, player, data, var_fe757bf1a5d559b4) {
    data endon(data.raceendon);
    timestamp = undefined;
    if (data.immediate) {
        timestamp = gettime();
    }
    if (isdefined(player)) {
        seatdata = vehicle_occupancy_getleveldataforseat(vehicle function_d93ec4635290febd(), seatid);
        if (player function_a7de57196f4b5d16()) {
            player.var_8bce248ce93882f2 = 1;
        } else {
            player.var_8bce248ce93882f2 = undefined;
        }
    }
    exitstartcallback = vehicle_occupancy_getexitstartcallbackforseat(vehicle, seatid);
    if (isdefined(exitstartcallback)) {
        [[ exitstartcallback ]](vehicle, seatid, var_7558f98f3236963d, player, data, var_fe757bf1a5d559b4);
    } else {
        vehicle_occupancy_exitstartcallback(vehicle, seatid, var_7558f98f3236963d, player, data, var_fe757bf1a5d559b4);
    }
    if (!isdefined(data.exitstartcomplete)) {
        data.exitstartcomplete = 1;
    }
    if (data.immediate) {
        /#
            assertex(timestamp == gettime(), "Data specifies immediate, but exitStartCallback did not execute immediately.");
        #/
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40d8
// Size: 0x13
function function_2966f7ab8ae9ccc6(tag) {
    return tag + "_window";
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f3
// Size: 0x47
function function_43c2c433b8b9b12d(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        function_5004590331017d88(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4141
// Size: 0x37
function function_5004590331017d88(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    namespace_84cff6185e39aa66::vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417f
// Size: 0x47
function function_857bf4201a249a99(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        function_cb4191526e56163c(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41cd
// Size: 0x91
function function_cb4191526e56163c(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (!istrue(data.playerdisconnect)) {
        success = vehicle_occupancy_moveplayertoexit(vehicle, seatid, var_7558f98f3236963d, player, data);
        if (!success) {
            if (issharedfuncdefined("vehicle_occupancy", "handleSuicideFromVehicles")) {
                [[ getsharedfunc("vehicle_occupancy", "handleSuicideFromVehicles") ]](player);
            } else {
                player suicide();
            }
        }
    }
    namespace_84cff6185e39aa66::vehomn_updateomnvarsonseatexit(vehicle, seatid, var_7558f98f3236963d, player);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4265
// Size: 0xe6
function vehicle_occupancy_exitstartcallback(vehicle, seatid, var_7558f98f3236963d, player, data, var_fe757bf1a5d559b4) {
    data endon(data.raceendon);
    result = vehicle_occupancy_findplayerexit(player, vehicle, seatid, var_7558f98f3236963d, data, var_fe757bf1a5d559b4);
    if (!result) {
        data.exitstartcomplete = 0;
        vehicle_occupancy_errormessage(player, 2);
        if (!istrue(data.immediate)) {
            waitframe();
            data notify(data.raceendnotify);
        }
    } else if (isdefined(data.var_fe757bf1a5d559b4) && data.var_fe757bf1a5d559b4 == "_to_roof") {
        result = function_c5819749db1604f5(player, vehicle, seatid, data);
        if (!istrue(result)) {
            player val::function_c9d0b43701bdba00("vehicle_roof_exit");
            vehicle_occupancy_exitstartcallback(vehicle, seatid, var_7558f98f3236963d, player, data, undefined);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4352
// Size: 0x3fb
function vehicle_occupancy_enterend(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        vehicle.occupants[seatid] = player;
        vehicle.occupantsreserving[seatid] = undefined;
        player.vehicle = vehicle;
        player.vehiclereserved = undefined;
        if (issharedfuncdefined("player", "disableClassSwapAllowed")) {
            self [[ getsharedfunc("player", "disableClassSwapAllowed") ]]();
        }
        vehicle_occupancy_applyrestrictionstooccupant(vehicle, seatid, player, data);
        vehicle_occupancy_updateriotshield(player, vehicle, seatid);
        vehicle_occupancy_hideoccupant(vehicle, seatid, player, data);
        vehicle_occupancy_applycameratooccupant(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        vehicle_occupancy_applydamagemodifiertooccupant(vehicle, seatid, player, data);
        vehicle_occupancy_hidecashbag(vehicle, seatid, player, data);
        function_7c295748bbe46edf(vehicle, seatid, player, data);
        player thread function_a3428466c78231b0(vehicle, player);
        if (vehicle function_452936099dcd1b94(seatid)) {
            player thread function_e6ec777562579771(vehicle, seatid);
        }
        if (!isdefined(var_fc7c7a874b43a31a)) {
            vehicle_occupancy_onentervehicle(vehicle, seatid, player, data);
            vehicle function_7394e322c553b3f0();
            if (isdefined(player.pers["telemetry"])) {
                var_6681408ac5fcc6cf = player.pers["telemetry"];
                var_e0187e3c57f0f72e = vehicle namespace_1f188a13f7e79610::function_e0187e3c57f0f72e();
                if (isdefined(var_6681408ac5fcc6cf.ground_vehicle_used_count) && var_e0187e3c57f0f72e) {
                    var_6681408ac5fcc6cf.ground_vehicle_used_count++;
                }
                var_e9d237c4ba649649 = vehicle namespace_1f188a13f7e79610::vehiclecanfly();
                if (isdefined(var_6681408ac5fcc6cf.air_vehicle_used_count) && var_e9d237c4ba649649) {
                    var_6681408ac5fcc6cf.air_vehicle_used_count++;
                }
            }
        }
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
        if (isdefined(var_c50b485a43752fd.animtag) && tolower(var_c50b485a43752fd.animtag) == tolower("tag_seat_0")) {
            vehicle_occupancy_setowner(vehicle, player, 1);
        }
        if (!isdefined(var_fc7c7a874b43a31a)) {
            player notify("vehicle_enter");
            if (isdefined(var_c50b485a43752fd.onenterbattlechatter)) {
                thread vehicle_occupancy_handleplayerbc(player, var_c50b485a43752fd, 1);
            }
        } else {
            player notify("vehicle_change_seat");
            if (isdefined(var_c50b485a43752fd.onenterbattlechatter)) {
                thread vehicle_occupancy_handleplayerbc(player, var_c50b485a43752fd, 0);
            }
        }
        var_c6500dfc575dc550 = vehicle_occupancy_isdriverseat(vehicle, seatid);
        if (var_c6500dfc575dc550 && istrue(function_29b4292c92443328(vehicle function_d93ec4635290febd()).var_941d95491d4d4817)) {
            vehicle function_3112242e4bc392de();
        }
        if (istrue(vehicle.isheli)) {
            vehicle function_a91927df280e94e4();
        }
        if (var_c6500dfc575dc550 && istrue(vehicle.var_6179b2eea75dbfe0)) {
            vehicle function_9a816e66a02ddb40();
        }
    } else {
        if (isdefined(player)) {
            player.vehiclereserved = undefined;
        }
        if (!istrue(data.vehicledeath)) {
            vehicle.occupantsreserving[seatid] = undefined;
        }
    }
    namespace_141c4634b6ea7b27::vehicle_interact_setvehicledirty(vehicle);
    namespace_141c4634b6ea7b27::vehicle_interact_setpointsdirty(vehicle);
    namespace_141c4634b6ea7b27::vehicle_interact_updateusability(vehicle);
    timestamp = gettime();
    if (istrue(data.success)) {
        player thread vehicle_occupancy_animateplayer(vehicle, seatid, var_fc7c7a874b43a31a);
        function_c84d89e51c871aa2(vehicle, seatid, player, data);
        if (vehicle function_72f871bf74995298() && vehicle vehicle_isphysveh()) {
            vehicle function_65aa053c077c003a(1);
        }
    }
    enterendcallback = vehicle_occupancy_getenterendcallbackforseat(vehicle, seatid);
    if (isdefined(enterendcallback)) {
        [[ enterendcallback ]](vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    } else {
        function_43c2c433b8b9b12d(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
    /#
        assertex(timestamp == gettime(), "vehicle_occupancy_enterEnd did not execute immediately.");
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4754
// Size: 0x297
function vehicle_occupancy_exitend(vehicle, seatid, var_7558f98f3236963d, player, data, var_fe757bf1a5d559b4) {
    if (data.success) {
        vehicle.occupants[seatid] = undefined;
        if (isdefined(player)) {
            player notify("vehicle_seat_exit");
            if (!isdefined(var_7558f98f3236963d)) {
                player.vehicle = undefined;
            }
            vehicle_occupancy_removerestrictionsfromoccupant(vehicle, seatid, player, data);
            vehicle_occupancy_updateriotshield(player, vehicle, var_7558f98f3236963d);
            vehicle_occupancy_showoccupant(vehicle, seatid, player, data);
            function_edcb1116f9160367(vehicle, seatid, player, data);
            function_e157f2a83aa01ea2(vehicle, seatid, player, data);
            vehicle_occupancy_removecamerafromoccupant(vehicle, var_7558f98f3236963d, player, data);
            vehicle_occupancy_removedamagemodifierfromoccupant(vehicle, seatid, player, data);
            vehicle_occupancy_showcashbag(vehicle, seatid, player, data);
        }
        if (!isdefined(var_7558f98f3236963d)) {
            vehicle_occupancy_onexitvehicle(vehicle, seatid, player, data);
        }
        if (!vehicle namespace_b479ac682b93cd92::vehicle_is_stopped() && vehicle_occupancy_isdriverseat(vehicle, seatid)) {
            if (issharedfuncdefined("br", "challengeEvaluator")) {
                var_cd37ce775909957b = spawnstruct();
                var_cd37ce775909957b.exitdriver = 1;
                player thread [[ getsharedfunc("br", "challengeEvaluator") ]]("br_mastery_ghostRideWhip", var_cd37ce775909957b);
            }
        }
        if (vehicle_occupancy_isdriverseat(vehicle, seatid) && istrue(function_29b4292c92443328(vehicle function_d93ec4635290febd()).var_941d95491d4d4817)) {
            vehicle thread function_4e7868ef633f4b36();
        }
    }
    namespace_141c4634b6ea7b27::vehicle_interact_setvehicledirty(vehicle);
    namespace_141c4634b6ea7b27::vehicle_interact_setpointsdirty(vehicle);
    namespace_141c4634b6ea7b27::vehicle_interact_updateusability(vehicle);
    timestamp = gettime();
    exitendcallback = vehicle_occupancy_getexitendcallbackforseat(vehicle, seatid);
    if (isdefined(exitendcallback)) {
        [[ exitendcallback ]](vehicle, seatid, var_7558f98f3236963d, player, data);
    } else {
        function_857bf4201a249a99(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
    if (isdefined(player)) {
        player usebuttondone();
        if (!isdefined(var_7558f98f3236963d)) {
            if (isdefined(player.vehoccupancy_lastseatbc)) {
                player.vehoccupancy_lastseatbc = undefined;
            }
            if (isdefined(player.vehoccupancy_lastbctime)) {
                player.vehoccupancy_lastbctime = undefined;
            }
        }
    }
    params = {vehicle:vehicle, var_7558f98f3236963d:var_7558f98f3236963d, seatid:seatid, player:player};
    player callback::callback("player_vehicle_exit", params);
    /#
        assertex(timestamp == gettime(), "vehicle_occupancy_exitEnd did not execute immediately.");
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f2
// Size: 0xd4
function vehicle_occupancy_reenter(vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data) {
    thread vehicle_occupancy_monitoroccupant(vehicle, player, var_9de41f2ee77c33ba);
    timestamp = gettime();
    reentercallback = vehicle_occupancy_getreentercallbackforseat(vehicle, var_9de41f2ee77c33ba);
    if (isdefined(reentercallback)) {
        [[ reentercallback ]](vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data);
    } else {
        data.success = undefined;
        data.exitposition = undefined;
        data.exitangles = undefined;
        data.var_fe757bf1a5d559b4 = undefined;
        data.var_2b16a165170d3506 = undefined;
        data.var_7862c7c7ade2b42e = undefined;
        thread vehicle_occupancy_enter(vehicle, var_9de41f2ee77c33ba, player, data, 1);
    }
    /#
        assertex(timestamp == gettime(), "vehicle_occupancy_reenter did not execute immediately.");
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4acd
// Size: 0x50
function vehicle_occupancy_getleveldata() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_occupancy_getLevelData() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.occupancy), "vehicle_occupancy_getLevelData() called before vehicle_occupancy_init().");
    #/
    return level.vehicle.occupancy;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b25
// Size: 0x12f
function vehicle_occupancy_handleplayerbc(player, seatdata, var_4cbe0c5ddb047549) {
    /#
        assert(issharedfuncdefined("game", "trySayLocalSound"));
    #/
    var_9d2442a09adbb305 = 5000;
    if (istrue(var_4cbe0c5ddb047549)) {
        player.vehoccupancy_lastseatbc = seatdata.onenterbattlechatter;
        thread [[ getsharedfunc("game", "trySayLocalSound") ]](player, seatdata.onenterbattlechatter, undefined, 1);
        player.vehoccupancy_lastbctime = gettime();
    } else if (isdefined(player.vehoccupancy_lastseatbc) && isdefined(player.vehoccupancy_lastbctime) && player.vehoccupancy_lastseatbc != seatdata.onenterbattlechatter && gettime() - player.vehoccupancy_lastbctime > var_9d2442a09adbb305) {
        thread [[ getsharedfunc("game", "trySayLocalSound") ]](player, seatdata.onenterbattlechatter);
        player.vehoccupancy_lastseatbc = seatdata.onenterbattlechatter;
        player.vehoccupancy_lastbctime = gettime();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c5b
// Size: 0x2e
function vehicle_occupancy_purgedataforseatinstance(vehicle, seatid) {
    vehicle.occupants[seatid] = undefined;
    vehicle.occupantsreserving[seatid] = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c90
// Size: 0x13a
function vehicle_occupancy_onentervehicle(vehicle, var_7558f98f3236963d, player, data) {
    level notify("enter_vehicle", vehicle);
    vehicle_occupancy_setfriendlystatusdirty(vehicle);
    function_e462819da430ac92(vehicle);
    vehicle namespace_dace9d390bc4a290::vehicle_spawn_stopwatchingabandoned();
    player setstance("stand");
    player val::function_59c053b89257bc95("vehicle_occupant_common", vehicle_occupancy_getoccupantrestrictions(), 0);
    thread vehicle_occupancy_takeriotshield(player, vehicle, var_7558f98f3236963d);
    namespace_6c0d09f1e6fc2bc5::battle_tracks_onentervehicle(vehicle, player);
    namespace_141c4634b6ea7b27::function_c5fe005f06fe5684(vehicle, player);
    if (issharedfuncdefined("vehicle_occupancy", "onEnterVehicle", 1)) {
        [[ getsharedfunc("vehicle_occupancy", "onEnterVehicle") ]](vehicle, var_7558f98f3236963d, player, data);
    }
    params = {data:data, player:player, var_7558f98f3236963d:var_7558f98f3236963d, vehicle:vehicle};
    level callback::callback("onEnterVehicle", params);
    /#
        if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
            host = [[ getsharedfunc("<unknown string>", "<unknown string>") ]]();
            if (isdefined(host) && player == host) {
                level.var_284e0857e1020bee = vehicle;
            }
        }
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dd1
// Size: 0x1c0
function vehicle_occupancy_onexitvehicle(vehicle, var_fc7c7a874b43a31a, player, data) {
    level notify("exit_vehicle", vehicle);
    if (!istrue(data.playerdisconnect)) {
        player vehicle_occupancy_stopmovefeedbackforplayer();
        player vehicle_occupancy_cleardamagefeedbackforplayer();
        namespace_141c4634b6ea7b27::function_deb83798a724a77e(vehicle, player);
        if (!istrue(data.playerdeath)) {
            if (istrue(data.playerlaststand) || istrue(data.var_d4b9aa76041ab0a9)) {
                data.exittype = "DEATH";
            } else if (!isdefined(data.exittype)) {
                data.exittype = "VOLUNTARY";
            }
            thread vehicle_preventplayercollisiondamagefortimeafterexit(vehicle, player);
        } else {
            data.exittype = "DEATH";
        }
        thread vehicle_occupancy_giveriotshield(player, data.playerdeath, data.playerlaststand);
    } else {
        data.exittype = "DISCONNECT";
    }
    vehicle_occupancy_setfriendlystatusdirty(vehicle);
    function_e462819da430ac92(vehicle);
    vehicle thread namespace_dace9d390bc4a290::vehicle_spawn_watchabandoned();
    vehicle thread namespace_dace9d390bc4a290::function_6c65df1f40e10037();
    if (issharedfuncdefined("vehicle_occupancy", "onExitVehicle", 1)) {
        [[ getsharedfunc("vehicle_occupancy", "onExitVehicle") ]](vehicle, var_fc7c7a874b43a31a, player, data);
    }
    params = {data:data, player:player, var_fc7c7a874b43a31a:var_fc7c7a874b43a31a, vehicle:vehicle};
    level callback::callback("onExitVehicle", params);
    player notify("exit_vehicle");
    vehicle_dlog_exitevent(vehicle, player, var_fc7c7a874b43a31a, data.exittype);
    namespace_6c0d09f1e6fc2bc5::battle_tracks_onexitvehicle(vehicle, player, var_fc7c7a874b43a31a);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f98
// Size: 0x9f
function vehicle_occupancy_updatefull(vehicle) {
    var_5e41ee78365ed202 = vehicle_occupancy_getavailablevehicleseats(vehicle).size <= 0;
    if (var_5e41ee78365ed202) {
        if (!istrue(vehicle.isfull)) {
            vehicle_interact_setpointdirty(vehicle, "single");
            vehicle_interact_updateusability(vehicle);
            vehicle.isfull = 1;
        } else {
            vehicle_interact_updateusability(vehicle);
        }
    } else if (istrue(vehicle.isfull)) {
        vehicle.isfull = undefined;
        vehicle_interact_setpointdirty(vehicle, "single");
        vehicle_interact_updateusability(vehicle);
    } else {
        vehicle_interact_updateusability(vehicle);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503e
// Size: 0x4d
function vehicle_occupancy_updateempty(vehicle) {
    var_8224e7631d8f04f2 = vehicle_occupancy_getavailablevehicleseats(vehicle);
    var_12d36e89a6e0742e = vehicle_occupancy_getallvehicleseats(vehicle);
    isempty = var_8224e7631d8f04f2.size == var_12d36e89a6e0742e.size;
    vehicle.isempty = isempty;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5092
// Size: 0x44
function vehicle_occupancy_getenterstartcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "enterStart")) {
        return getsharedfunc(vehicle.vehiclename, "enterStart");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50dd
// Size: 0x44
function vehicle_occupancy_getenterendcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "enterEnd")) {
        return getsharedfunc(vehicle.vehiclename, "enterEnd");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5128
// Size: 0x44
function vehicle_occupancy_getexitstartcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "exitStart")) {
        return getsharedfunc(vehicle.vehiclename, "exitStart");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5173
// Size: 0x44
function vehicle_occupancy_getexitendcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "exitEnd")) {
        return getsharedfunc(vehicle.vehiclename, "exitEnd");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51be
// Size: 0x44
function vehicle_occupancy_getreentercallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "reenter")) {
        return getsharedfunc(vehicle.vehiclename, "reenter");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5209
// Size: 0x73
function vehicle_occupancy_applyrestrictionstooccupant(vehicle, var_7558f98f3236963d, player, data) {
    if (!vehicle_occupancy_movementisallowed(vehicle) && !vehicle function_f654c168752ed299()) {
        if (var_7558f98f3236963d == vehicle_occupancy_getdriverseat(vehicle)) {
            vehicle_occupancy_allowmovementplayer(vehicle, player, 0, var_7558f98f3236963d);
        }
    }
    restrictions = vehicle_occupancy_getrestrictionsforseat(vehicle, var_7558f98f3236963d);
    player val::function_59c053b89257bc95("vehicle_occupant", restrictions, 0);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5283
// Size: 0x4c
function vehicle_occupancy_removerestrictionsfromoccupant(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        vehicle_occupancy_allowmovementplayer(vehicle, player, 1, undefined);
        player val::function_c9d0b43701bdba00("vehicle_occupant");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52d6
// Size: 0x32
function function_31609728116475f() {
    if (!isdefined(level.var_12a9aac58c679eca)) {
        level.var_12a9aac58c679eca = getdvarint(@"hash_4f6bb46a93a86d18", 1);
    }
    return level.var_12a9aac58c679eca;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5310
// Size: 0x73
function vehicle_occupancy_hideoccupant(vehicle, var_7558f98f3236963d, player, data) {
    if (vehicle_shouldhideoccupantforseat(vehicle, var_7558f98f3236963d)) {
        player.nocorpse = 1;
        if (function_31609728116475f()) {
            player function_305fb8c759fa4de5();
            player function_379bb555405c16bb("vehicle_occupancy::vehicle_occupancy_hideOccupant() - _playerHideStack");
        } else {
            player function_a593971d75d82113();
            player function_379bb555405c16bb("vehicle_occupancy::vehicle_occupancy_hideOccupant()");
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538a
// Size: 0x38
function function_c84d89e51c871aa2(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (function_f3db2e446c1457f(vehicle, var_fc7c7a874b43a31a, player)) {
        player vehicle_setstowedweaponvisibility(0);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53c9
// Size: 0xa6
function function_23a58d26e5c53e1f(player, data) {
    leveldata = vehicle_occupancy_getleveldata();
    if (!leveldata.var_77b46b8810cb73f3) {
        return;
    }
    id = leveldata.var_51c0466d6f15a77f;
    leveldata.var_51c0466d6f15a77f++;
    player function_305fb8c759fa4de5();
    player function_379bb555405c16bb("vehicle_occupancy::vehicle_occupancy_hideOccupantDuringTransition() - _playerHideStack");
    leveldata.var_df81eeab4c9e5f64[id] = player;
    if (!isdefined(data.var_df81eeab4c9e5f64)) {
        data.var_df81eeab4c9e5f64 = [];
    }
    data.var_df81eeab4c9e5f64[id] = player;
    return id;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5477
// Size: 0xb8
function function_1a067f7da28ca689(id, data, var_f4fedb549a5fa44b) {
    leveldata = vehicle_occupancy_getleveldata();
    if (!leveldata.var_77b46b8810cb73f3) {
        return;
    }
    if (istrue(var_f4fedb549a5fa44b)) {
        waitframe();
        waitframe();
    }
    if (!leveldata.var_77b46b8810cb73f3) {
        return;
    }
    if (!isdefined(leveldata.var_df81eeab4c9e5f64[id])) {
        return;
    }
    player = leveldata.var_df81eeab4c9e5f64[id];
    if (isdefined(data) && isdefined(data.var_df81eeab4c9e5f64)) {
        data.var_df81eeab4c9e5f64[id] = undefined;
    }
    if (isdefined(player)) {
        player function_f81e91f54bddaf46();
        player function_985b0973f29da4f8("vehicle_occupancy::vehicle_occupancy_showOccupantAfterTransitionByEventID() - _playerShowStack");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5536
// Size: 0xdd
function function_914037c6a5cec6cd(data, var_f4fedb549a5fa44b) {
    leveldata = vehicle_occupancy_getleveldata();
    if (!leveldata.var_77b46b8810cb73f3) {
        return;
    }
    if (istrue(var_f4fedb549a5fa44b)) {
        waitframe();
        waitframe();
    }
    if (!isdefined(data.var_df81eeab4c9e5f64)) {
        return;
    }
    foreach (id, player in data.var_df81eeab4c9e5f64) {
        if (isdefined(leveldata.var_df81eeab4c9e5f64[id])) {
            leveldata.var_df81eeab4c9e5f64[id] = undefined;
            if (isdefined(player)) {
                player function_f81e91f54bddaf46();
                player function_985b0973f29da4f8("vehicle_occupancy::vehicle_occupancy_showOccupantAfterTransitionByEventID() - _playerShowStack");
            }
        }
    }
    data.var_df81eeab4c9e5f64 = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x561a
// Size: 0x84
function function_37bad8e4d4b6a7f() {
    leveldata = vehicle_occupancy_getleveldata();
    if (!leveldata.var_77b46b8810cb73f3) {
        return;
    }
    foreach (id, player in leveldata.var_df81eeab4c9e5f64) {
        if (!isdefined(player)) {
            leveldata.var_df81eeab4c9e5f64[id] = undefined;
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a5
// Size: 0x8e
function vehicle_occupancy_showoccupant(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        if (vehicle_shouldhideoccupantforseat(vehicle, var_fc7c7a874b43a31a)) {
            if (!istrue(data.nocorpse)) {
                player.nocorpse = undefined;
            }
            if (function_31609728116475f()) {
                player function_f81e91f54bddaf46();
                player function_985b0973f29da4f8("vehicle_occupancy::vehicle_occupancy_showOccupant() - _playerShowStack");
            } else {
                player function_6fb380927695ee76();
                player function_985b0973f29da4f8("vehicle_occupancy::vehicle_occupancy_showOccupant()");
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573a
// Size: 0x48
function function_edcb1116f9160367(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        if (function_f3db2e446c1457f(vehicle, var_fc7c7a874b43a31a, player)) {
            player vehicle_setstowedweaponvisibility(1);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5789
// Size: 0x4e
function function_7c295748bbe46edf(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (function_e552d137b9591a4c(vehicle, var_fc7c7a874b43a31a, player) && player tagexists("j_helmet_hide")) {
        player hidepart("j_helmet_hide", undefined, 1);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57de
// Size: 0x4e
function function_e157f2a83aa01ea2(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (function_e552d137b9591a4c(vehicle, var_fc7c7a874b43a31a, player) && player tagexists("j_helmet_hide")) {
        player showpart("j_helmet_hide", undefined, 1);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5833
// Size: 0x5c
function function_e552d137b9591a4c(vehicle, seatid, player) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    return istrue(var_c50b485a43752fd.hidehelmet);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5897
// Size: 0x72
function vehicle_occupancy_applycameratooccupant(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    camera = vehicle_getcameraforseat(vehicle, seatid);
    if (isdefined(camera) && camera != "none") {
        var_2640f93c42b5df71 = vehicle_getcameraforseat(vehicle, var_fc7c7a874b43a31a);
        if (var_2640f93c42b5df71 != camera) {
            player cameraset(camera);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5910
// Size: 0x57
function vehicle_occupancy_removecamerafromoccupant(vehicle, var_7558f98f3236963d, player, data) {
    if (isdefined(var_7558f98f3236963d)) {
        camera = vehicle_getcameraforseat(vehicle, var_7558f98f3236963d);
        if (camera == "none") {
            player cameradefault();
        }
    } else {
        player cameradefault();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x596e
// Size: 0x66
function vehicle_occupancy_applydamagemodifiertooccupant(vehicle, var_7558f98f3236963d, player, data) {
    damagemodifier = vehicle_occupancy_getdamagemodifierforseat(vehicle, var_7558f98f3236963d);
    if (isdefined(damagemodifier) && damagemodifier != -1) {
        player adddamagemodifier(vehicle.vehiclename + "_" + var_7558f98f3236963d, damagemodifier, 0, &vehicle_occupancy_damagemodifierignorefunc);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59db
// Size: 0x6f
function vehicle_occupancy_removedamagemodifierfromoccupant(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        damagemodifier = vehicle_occupancy_getdamagemodifierforseat(vehicle, var_fc7c7a874b43a31a);
        if (isdefined(damagemodifier) && damagemodifier != -1) {
            player removedamagemodifier(vehicle.vehiclename + "_" + var_fc7c7a874b43a31a, 0);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a51
// Size: 0xd7
function vehicle_occupancy_getrestrictionsforseat(vehicle, seatid) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    restrictions = ter_op(isdefined(var_c50b485a43752fd.restrictions), var_c50b485a43752fd.restrictions, var_e2818ad39a3341b4.restrictions);
    if (istrue(var_e2818ad39a3341b4.var_4b92043c00e4e91b)) {
        if (!vehicle function_b9d5a379eb1aefc7(seatid)) {
            restrictions[restrictions.size] = "vehicle_lean_out";
        } else {
            restrictions = function_6d6af8144a5131f1(restrictions, "melee");
        }
    }
    if (vehicle function_80d84f556cc8017a() && function_1003e8d7c662a2ff(vehicle function_d93ec4635290febd(), seatid)) {
        restrictions[restrictions.size] = "fire";
    }
    return restrictions;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b30
// Size: 0x74
function vehicle_shouldhideoccupantforseat(vehicle, seatid) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    if (isdefined(var_c50b485a43752fd.hideoccupant)) {
        return istrue(var_c50b485a43752fd.hideoccupant);
    } else {
        return istrue(var_e2818ad39a3341b4.hideoccupant);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bab
// Size: 0x66
function function_f3db2e446c1457f(vehicle, seatid, player) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    return player function_793f941d7dff15ed() && istrue(var_c50b485a43752fd.hidestowedweapon);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c19
// Size: 0xba
function vehicle_getcameraforseat(vehicle, seatid) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    if (isdefined(seatid)) {
        var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
        camera = var_e2818ad39a3341b4.camera;
        if (isdefined(var_c50b485a43752fd.camera)) {
            camera = var_c50b485a43752fd.camera;
        }
        if (isdefined(var_c50b485a43752fd.animtag) && tolower(var_c50b485a43752fd.animtag) == "tag_seat_0") {
            camera = "none";
        }
    } else {
        camera = "none";
    }
    return camera;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cdb
// Size: 0x70
function vehicle_occupancy_getdamagemodifierforseat(vehicle, seatid) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    return ter_op(isdefined(var_c50b485a43752fd.damagemodifier), var_c50b485a43752fd.damagemodifier, var_e2818ad39a3341b4.damagemodifier);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d53
// Size: 0x8e
function vehicle_occupancy_damagemodifierignorefunc(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    data = packdamagedata(attacker, victim, damage, objweapon, meansofdeath, inflictor);
    if (meansofdeath == "MOD_TRIGGER_HURT") {
        return 1;
    }
    if (isdefined(objweapon) && objweapon.basename == "bomb_site_mp") {
        return 1;
    }
    if (victim isstuckdamage(data)) {
        return 1;
    }
    return 0;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5de9
// Size: 0x19d
function function_a3428466c78231b0(vehicle, player) {
    level endon("game_ended");
    vehicle endon("death");
    player endon("death_or_disconnect");
    wait(0.5);
    var_e03d4ece8b05144 = vehicle.oobtriggers;
    var_f79382813390150d = player.oobtriggers;
    if (isdefined(var_e03d4ece8b05144)) {
        foreach (var_934c5047d2a77afd in var_e03d4ece8b05144) {
            var_5f699f50e6aae59c = 1;
            if (isdefined(var_f79382813390150d) && var_f79382813390150d.size > 0) {
                var_5f699f50e6aae59c = !array_contains(var_f79382813390150d, var_934c5047d2a77afd);
            }
            if (istrue(var_5f699f50e6aae59c)) {
                if (issharedfuncdefined("game", "onEnterOOBTrigger")) {
                    [[ getsharedfunc("game", "onEnterOOBTrigger") ]](var_934c5047d2a77afd, player, 1);
                }
            }
        }
    }
    if (isdefined(var_f79382813390150d)) {
        foreach (playertrigger in var_f79382813390150d) {
            var_5f699f50e6aae59c = 0;
            if (!isdefined(var_e03d4ece8b05144)) {
                var_5f699f50e6aae59c = 1;
            } else if (!array_contains(var_e03d4ece8b05144, playertrigger)) {
                var_5f699f50e6aae59c = 1;
            }
            if (istrue(var_5f699f50e6aae59c)) {
                if (issharedfuncdefined("game", "onExitOOBTrigger")) {
                    [[ getsharedfunc("game", "onExitOOBTrigger") ]](playertrigger, player);
                }
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8d
// Size: 0x61
function vehicle_occupancy_monitoroccupant(vehicle, player, seatid) {
    thread vehicle_occupancy_monitorcontrols(vehicle, player, seatid);
    if (!istrue(level.var_15c7e6ec178feef1)) {
        thread vehicle_occupancy_monitorseatswitch(vehicle, player, seatid, 1);
        thread vehicle_occupancy_monitorexit(vehicle, player, seatid);
    }
    thread vehicle_occupancy_monitorgameended(vehicle, player, seatid);
    thread vehicle_occupancy_monitorleanblocked(vehicle, player);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff5
// Size: 0x34
function vehicle_occupancy_stopmonitoringoccupant(player) {
    player notify("vehicle_occupancy_monitorControls");
    player notify("vehicle_occupancy_monitorSeatSwitch");
    player notify("vehicle_occupancy_monitorExit");
    player notify("vehicle_occupancy_monitorGameEnded");
    player notify("vehicle_occupancy_monitorLeanBlocked");
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6030
// Size: 0x77
function vehicle_occupancy_monitorleanblocked(vehicle, player) {
    player notify("vehicle_occupancy_monitorLeanBlocked");
    player endon("vehicle_occupancy_monitorLeanBlocked");
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    while (1) {
        player waittill_any_2("vehicle_leanout_attempt_denied", "vehicle_leanout_forced_return");
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ getsharedfunc("hud", "showErrorMessage") ]]("VEHICLES/LEAN_OUT_BLOCKED");
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60ae
// Size: 0x17a
function vehicle_occupancy_monitorseatswitch(vehicle, player, seatid, var_36ff66c0883b5aa6) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    vehicle endon("death");
    level endon("game_ended");
    player notify("vehicle_occupancy_monitorSeatSwitch");
    player endon("vehicle_occupancy_monitorSeatSwitch");
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    if (var_e2818ad39a3341b4.seatdata.size <= 1) {
        return;
    }
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (!isdefined(var_c50b485a43752fd.seatswitcharray) || var_c50b485a43752fd.seatswitcharray.size <= 0) {
        return;
    }
    if (!isbot(player)) {
        if (var_36ff66c0883b5aa6) {
            wait(0.2);
        }
        while (player vehswitchseatbuttonpressed() || player function_5919151dd97650d2()) {
            waitframe();
        }
        while (!player vehswitchseatbuttonpressed() && !player function_5919151dd97650d2() || istrue(player.var_ea02a8bfcfde7c4b)) {
            waitframe();
        }
        if (player function_5919151dd97650d2()) {
            var_c0125690bc99343d = function_795d10f52e5291cf(vehicle, player, seatid);
        } else {
            var_c0125690bc99343d = vehicle_occupancy_getnextavailableseat(vehicle, player, seatid);
        }
        if (isdefined(var_c0125690bc99343d)) {
            thread vehicle_occupancy_enter(vehicle, var_c0125690bc99343d, player);
        }
        vehicle_occupancy_errormessage(player, ter_op(istrue(vehicle.var_65da0a245b653cc), 3, 1));
        thread vehicle_occupancy_monitorseatswitch(vehicle, player, seatid, 0);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x622f
// Size: 0xbb
function vehicle_occupancy_getnextavailableseat(vehicle, player, seatid) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (!isdefined(var_c50b485a43752fd.seatswitcharray) || var_c50b485a43752fd.seatswitcharray.size <= 0) {
        return undefined;
    }
    foreach (var_c0125690bc99343d in var_c50b485a43752fd.seatswitcharray) {
        if (vehicle_occupancy_seatisavailable(vehicle, var_c0125690bc99343d, player)) {
            return var_c0125690bc99343d;
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f1
// Size: 0xca
function function_795d10f52e5291cf(vehicle, player, seatid) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (!isdefined(var_c50b485a43752fd.seatswitcharray) || var_c50b485a43752fd.seatswitcharray.size <= 0) {
        return undefined;
    }
    var_1ce964595aadd958 = undefined;
    foreach (var_c0125690bc99343d in var_c50b485a43752fd.seatswitcharray) {
        if (vehicle_occupancy_seatisavailable(vehicle, var_c0125690bc99343d, player)) {
            var_1ce964595aadd958 = var_c0125690bc99343d;
        }
    }
    return var_1ce964595aadd958;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63c3
// Size: 0xd3
function vehicle_occupancy_monitorexit(vehicle, player, seatid) {
    player notify("vehicle_occupancy_monitorExit");
    player endon("vehicle_occupancy_monitorExit");
    vehicle endon("death");
    level endon("game_ended");
    var_fe757bf1a5d559b4 = vehicle_occupancy_monitorexitinternal(vehicle, player, seatid);
    data = spawnstruct();
    if (isdefined(player)) {
        if (!player _isalive()) {
            data.playerdeath = 1;
        }
        if (istrue(player.inlaststand)) {
            data.playerlaststand = 1;
        }
        if (istrue(player.liveragdoll)) {
            data.var_d4b9aa76041ab0a9 = 1;
        }
    } else {
        data.playerdisconnect = 1;
    }
    thread vehicle_occupancy_exit(vehicle, seatid, player, data, undefined, var_fe757bf1a5d559b4);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x649d
// Size: 0x3a3
function vehicle_occupancy_monitorexitinternal(vehicle, player, seatid) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    player endon("enter_live_ragdoll");
    endtime = gettime() + 300;
    var_b28ed4c7d2ff1c4e = 0;
    var_c08d88c04569a00b = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd()).var_c08d88c04569a00b;
    var_6511893609889b7a = istrue(level.var_351aab391da578a8) && isdefined(var_c08d88c04569a00b) && var_c08d88c04569a00b == "stand_up";
    var_7a888fdba3dfb003 = istrue(level.var_351aab391da578a8) && isdefined(var_c08d88c04569a00b) && (var_c08d88c04569a00b == "stand_up" || player function_46ca2675c0578280());
    var_edc035ec125029eb = istrue(level.var_73d6c6366970020);
    player setclientomnvar("ui_veh_exit_button_holdtime", 0);
    while (1) {
        if (!player usebuttonpressed()) {
            var_b28ed4c7d2ff1c4e = 1;
        }
        if (var_b28ed4c7d2ff1c4e && gettime() >= endtime) {
            break;
        }
        waitframe();
    }
    updaterate = level.framedurationseconds;
    var_33193f537b85b6d4 = getdvarint(@"hash_9402582f8123db99", 250) / 1000;
    var_b24cf95b8cf123c = 0;
    var_7f08bbc709d0effc = undefined;
    while (1) {
        timeused = 0;
        var_930201649eaf32af = player getcurrentusereloadconfig();
        var_556640f47976049a = 0;
        player setclientomnvar("ui_veh_exit_button_holdtime", 0);
        while (player usebuttonpressed()) {
            player disablereloading();
            player cancelreloading();
            var_556640f47976049a = 1;
            timeused = timeused + updaterate;
            var_86eb80ff19554b0c = player usinggamepad();
            var_b97750d9099a9b79 = player getuseholdkbmprofile();
            var_73780d1b420d7903 = !var_86eb80ff19554b0c && !var_b97750d9099a9b79;
            var_caaa0275d82bfee1 = !var_86eb80ff19554b0c && var_b97750d9099a9b79;
            var_8b3c790f008214a9 = var_86eb80ff19554b0c && var_930201649eaf32af == 0;
            var_97e758980add17ef = var_86eb80ff19554b0c && var_930201649eaf32af > 0;
            var_41bd24e292fb94e0 = var_8b3c790f008214a9 || var_caaa0275d82bfee1;
            if (var_8b3c790f008214a9 || var_caaa0275d82bfee1) {
                player setclientomnvar("ui_veh_exit_button_holdtime", timeused / 0.3);
            }
            if (var_41bd24e292fb94e0 && timeused > 0.3 || var_73780d1b420d7903) {
                return ter_op(var_edc035ec125029eb && player function_a7de57196f4b5d16() && vehicle vehicle_getspeed() > 10, "_to_dive", undefined);
            } else if (var_97e758980add17ef && timeused >= var_33193f537b85b6d4) {
                player enablereloading();
                player forcereloading();
            }
            wait(updaterate);
        }
        if (var_556640f47976049a && player usinggamepad() && var_930201649eaf32af > 0 && timeused < var_33193f537b85b6d4) {
            return ter_op(var_edc035ec125029eb && player function_a7de57196f4b5d16() && vehicle vehicle_getspeed() > 10, "_to_dive", undefined);
        } else if (var_556640f47976049a) {
            player enablereloading();
            player forcereloading();
        }
        if (var_7a888fdba3dfb003) {
            var_b24cf95b8cf123c = var_b24cf95b8cf123c | player jumpbuttonpressed();
            if (player jumpbuttonpressed()) {
                var_7f08bbc709d0effc = gettime();
            } else if (var_b24cf95b8cf123c && isdefined(var_7f08bbc709d0effc) && var_7f08bbc709d0effc + 400 < gettime()) {
                var_b24cf95b8cf123c = 0;
            }
            if (var_b24cf95b8cf123c && !player function_e1b085052385d056() && (player function_46ca2675c0578280() || var_6511893609889b7a)) {
                return "_to_roof";
            }
        }
        waitframe();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6847
// Size: 0xa3
function vehicle_occupancy_errormessage(player, var_5b67bcf1fffa8112) {
    var_4a939ff1f2caed40 = undefined;
    switch (var_5b67bcf1fffa8112) {
    case 1:
        var_4a939ff1f2caed40 = "VEHICLES/SEAT_SWITCH_OCCUPIED";
        break;
    case 2:
        var_4a939ff1f2caed40 = "VEHICLES/CANNOT_EXIT";
        break;
    case 3:
        var_4a939ff1f2caed40 = "VEHICLES/GRENADE_TURRET_LOCKED";
        break;
    }
    /#
        assertex(isdefined(var_4a939ff1f2caed40), "vehicle_occupancy_errorMessage called with an invalid errorRef.");
    #/
    if (issharedfuncdefined("hud", "showErrorMessage")) {
        player [[ getsharedfunc("hud", "showErrorMessage") ]](var_4a939ff1f2caed40);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68f1
// Size: 0x55
function vehicle_occupancy_monitorgameended(vehicle, player, seatid) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    player notify("vehicle_occupancy_monitorGameEnded");
    player endon("vehicle_occupancy_monitorGameEnded");
    if (seatid == namespace_1fbd40990ee60ede::vehicle_occupancy_getdriverseat(vehicle)) {
        level waittill("game_ended");
        player allowmovement(0);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x694d
// Size: 0xb5
function vehicle_occupancy_monitorcontrols(vehicle, player, seatid) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    vehicle endon("death");
    level endon("game_ended");
    player notify("vehicle_occupancy_monitorControls");
    player endon("vehicle_occupancy_monitorControls");
    if (namespace_84cff6185e39aa66::vehomn_controlsarefadedoutorhidden(player)) {
        return;
    }
    if (-1) {
        wait(1.5);
    }
    childthread vehicle_occupancy_monitormovementcontrols(vehicle, player, seatid);
    childthread vehicle_occupancy_monitorturretcontrols(vehicle, player, seatid);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    if (isdefined(var_e2818ad39a3341b4.monitorcontrolscallback)) {
        childthread [[ var_e2818ad39a3341b4.monitorcontrolscallback ]](vehicle, player, seatid, "vehicle_occupancy_monitorControls");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a09
// Size: 0x1c
function vehicle_occupancy_fadeoutcontrols(player) {
    namespace_84cff6185e39aa66::vehomn_fadeoutcontrols(player);
    player notify("vehicle_occupancy_monitorControls");
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2c
// Size: 0x120
function vehicle_occupancy_monitormovementcontrols(vehicle, player, seatid) {
    driverseatid = vehicle_occupancy_getdriverseat(vehicle);
    if (seatid == driverseatid) {
        canfly = vehicle vehiclecanfly();
        if (canfly) {
            while (1) {
                forward = vehicle vehicle_getinputvalue(0);
                turn = vehicle vehicle_getinputvalue(2);
                strafe = vehicle vehicle_getinputvalue(1);
                var_510e41afad57494b = vehicle vehicle_getinputvalue(3);
                if (abs(forward) > 0 || abs(turn) > 0 || abs(strafe) > 0 || abs(var_510e41afad57494b) > 0) {
                    vehicle_occupancy_fadeoutcontrols(player);
                }
                wait(0.05);
            }
        } else {
            while (1) {
                var_b9e1e30f0ac5aa82 = vehicle vehicle_getinputvalue(4);
                if (abs(var_b9e1e30f0ac5aa82) >= 0.2) {
                    vehicle_occupancy_fadeoutcontrols(player);
                }
                wait(0.05);
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b53
// Size: 0x84
function vehicle_occupancy_monitorturretcontrols(vehicle, player, seatid) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (isdefined(var_c50b485a43752fd.turretobjweapon)) {
        turret = vehicle_getturretbyweapon(vehicle, var_c50b485a43752fd.turretobjweapon);
        if (isdefined(turret)) {
            turret waittill_any_2("turret_fire", "turret_reload");
            vehicle_occupancy_fadeoutcontrols(player);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6bde
// Size: 0x4d
function function_2e58e7b01554419a(vehicleref, seatid) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicleref, seatid);
    if (isdefined(var_c50b485a43752fd) && isdefined(var_c50b485a43752fd.turretobjweapon)) {
        return var_c50b485a43752fd.turretobjweapon;
    } else {
        return undefined;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c32
// Size: 0xde
function vehicle_occupancy_raceplayerdeathdisconnect(player, data) {
    data endon(data.raceendon);
    result = player waittill_any_return_no_endon_death_5("death", "disconnect", "last_stand_start", "enter_live_ragdoll", "interrupt_roof_exit");
    if (result == "death") {
        data.playerdeath = 1;
    } else if (result == "disconnect") {
        data.playerdisconnect = 1;
    } else if (result == "last_stand_start") {
        data.playerlaststand = 1;
    } else if (result == "enter_live_ragdoll") {
        data.var_d4b9aa76041ab0a9 = 1;
    } else if (result == "interrupt_roof_exit") {
        data.var_f276d4e53593ec9a = 1;
    }
    data notify(data.raceendnotify);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d17
// Size: 0x45
function vehicle_occupancy_racevehicledeath(vehicle, data) {
    data endon(data.raceendon);
    vehicle waittill("death");
    data.vehicledeath = 1;
    data notify(data.raceendnotify);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d63
// Size: 0x6d
function vehicle_occupancy_raceseatunavailable(vehicle, player, seatid, var_fc7c7a874b43a31a, data) {
    data endon(data.raceendon);
    while (isdefined(vehicle)) {
        if (!vehicle_occupancy_seatisavailable(vehicle, seatid, player)) {
            data.seatunavailable = 1;
            data notify(data.raceendnotify);
            break;
        }
        waitframe();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dd7
// Size: 0x97
function vehicle_occupancy_racecomplete(var_fc7c7a874b43a31a, var_7558f98f3236963d, data) {
    data endon(data.raceendon);
    if (isdefined(var_fc7c7a874b43a31a) && isdefined(var_7558f98f3236963d)) {
        while (!istrue(data.enterstartcomplete) || !istrue(data.exitstartcomplete)) {
            waitframe();
        }
    } else if (isdefined(var_fc7c7a874b43a31a)) {
        while (!istrue(data.exitstartcomplete)) {
            waitframe();
        }
    } else {
        while (!istrue(data.enterstartcomplete)) {
            waitframe();
        }
    }
    data notify(data.raceendnotify);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e75
// Size: 0x1e9
function vehicle_occupancy_raceresults(vehicle, player, var_fc7c7a874b43a31a, var_7558f98f3236963d, data) {
    if (!isdefined(data.success)) {
        data.success = 1;
    }
    if (data.immediate) {
        data.playerdisconnect = ter_op(isdefined(player), 0, 1);
        if (!data.playerdisconnect) {
            data.playerdeath = !player _isalive();
            data.playerlaststand = istrue(player.inlaststand);
            data.var_d4b9aa76041ab0a9 = istrue(player.liveragdoll);
        }
        data.vehicledeath = istrue(vehicle.isdestroyed);
    } else if (data.success) {
        if (isdefined(var_fc7c7a874b43a31a) && !istrue(data.exitstartcomplete)) {
            data.success = 0;
        }
        if (isdefined(var_7558f98f3236963d) && !istrue(data.enterstartcomplete)) {
            data.success = 0;
        }
        if (istrue(data.vehicledeath)) {
            data.success = 0;
        }
        if (istrue(data.var_f276d4e53593ec9a)) {
            data.success = 0;
        }
    } else {
        return 0;
    }
    if (isdefined(var_7558f98f3236963d)) {
        if (istrue(data.playerdeath) || istrue(data.var_d4b9aa76041ab0a9) || istrue(data.playerlaststand) || istrue(data.playerdisconnect) || istrue(data.vehicledeath) || istrue(data.seatunavailable)) {
            data.success = 0;
        }
        goto LOC_000001dc;
    }
LOC_000001dc:
    return data.success;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7066
// Size: 0x6f
function vehicle_occupancy_watchowner(vehicle, player, var_57c14bf60c5be4ab, var_13cc810b9974360e) {
    player endon("disconnect");
    vehicle endon("death");
    vehicle endon("vehicle_clear_owner_" + player getentitynumber());
    if (istrue(var_57c14bf60c5be4ab)) {
        player waittill("vehicle_seat_exit");
    }
    var_f86fb0e66b52ea3b = ter_op(isdefined(var_13cc810b9974360e), var_13cc810b9974360e, 20);
    wait(var_f86fb0e66b52ea3b);
    thread vehicle_occupancy_clearowner(vehicle, player);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70dc
// Size: 0x44
function vehicle_occupancy_watchownerjoinedteam(vehicle, player) {
    player endon("disconnect");
    vehicle endon("death");
    vehicle endon("vehicle_owner_update");
    player waittill_any_2("joined_team", "joined_spectators");
    thread vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7127
// Size: 0x8e
function vehicle_occupancy_isplayervalidowner(vehicle, player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (level.teambased && isdefined(vehicle.team)) {
        if (vehicle.team != "neutral" && player.team != vehicle.team) {
            return 0;
        }
    } else if (isdefined(vehicle.originalowner)) {
        if (player != vehicle.originalowner) {
            return 0;
        }
    }
    return 1;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71bd
// Size: 0x1a7
function vehicle_occupancy_animateplayer(vehicle, seatid, var_fc7c7a874b43a31a, animtype, var_d65ff23efe3b8aa9, var_3f9690fb0c8ebc84) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (!isdefined(var_c50b485a43752fd.animtag)) {
        return;
    }
    if (isdefined(var_d65ff23efe3b8aa9) || isdefined(var_3f9690fb0c8ebc84)) {
        /#
            assertex(isdefined(var_d65ff23efe3b8aa9), "tempOverrideVehicleType and tempOverrideVehicleSeat must both be defined.");
        #/
        /#
            assertex(isdefined(var_3f9690fb0c8ebc84), "tempOverrideVehicleType and tempOverrideVehicleSeat must both be defined.");
        #/
        function_d1c52700cb7ddbf3(var_d65ff23efe3b8aa9, var_3f9690fb0c8ebc84);
        thread function_233275857335e4dc(1);
    }
    self cancelmantle();
    var_f5724e9559001550 = 0;
    var_c39487b3181a24dc = var_c50b485a43752fd.animtag;
    if (issubstr(var_c39487b3181a24dc, "tag_seat_")) {
        var_f5724e9559001550 = int(getsubstr(var_c39487b3181a24dc, 9));
    } else if (issubstr(var_c39487b3181a24dc, "tag_gunner")) {
        substr = getsubstr(var_c39487b3181a24dc, 10);
        var_f5724e9559001550 = int(substr) + 10 - 1;
    } else if (issubstr(var_c39487b3181a24dc, "gunner_")) {
        var_f5724e9559001550 = int(getsubstr(var_c39487b3181a24dc, 7)) + 10 - 1;
    }
    var_a578a00ada66faa3 = !isdefined(seatid);
    function_c9b87beb89ec12e2(self, vehicle, var_a578a00ada66faa3);
    var_21b63ba00fe0b7e3 = !isdefined(var_fc7c7a874b43a31a) && isdefined(seatid);
    var_60871098a5b9c669 = self usevehicle(vehicle, var_f5724e9559001550, var_21b63ba00fe0b7e3);
    if (istrue(var_60871098a5b9c669) && vehicle function_452936099dcd1b94(seatid)) {
        vehicle function_14219d4c7d83499f(seatid);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x736b
// Size: 0x25
function function_d1c52700cb7ddbf3(type, seat) {
    self notify("OverrideVehicleSeatAnimConditionals");
    self overridevehicleseatanimconditionals(type, seat);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7397
// Size: 0x35
function function_233275857335e4dc(delayed) {
    self endon("death_or_disconnect");
    self notify("OverrideVehicleSeatAnimConditionals");
    self endon("OverrideVehicleSeatAnimConditionals");
    if (istrue(delayed)) {
        waitframe();
    }
    self overridevehicleseatanimconditionals("", 0);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73d3
// Size: 0x30
function function_ee4b8b879b1b120c() {
    if (istrue(self.isheli) && self getscriptablehaspart("Exhaust")) {
        self setscriptablepartstate("Exhaust", "off");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x740a
// Size: 0xf4
function function_ba42cf4e5bb24367() {
    var_3e9c60d3d2b4ed07 = self getscriptablehaspart("Exhaust");
    var_57638606b57e8776 = self getscriptablehaspart("NaviLights");
    if (!var_3e9c60d3d2b4ed07 && !var_57638606b57e8776) {
        return;
    }
    self endon("death");
    self notify("stopHeliEffectsAfterTime");
    self endon("stopHeliEffectsAfterTime");
    self.var_19169da06f71a4f2 = "waitingToTurnOff";
    wait(6);
    while (istrue(self.ishovering)) {
        wait(2);
    }
    if (!isdefined(self.var_19169da06f71a4f2) || self.var_19169da06f71a4f2 != "waitingToTurnOff") {
        return;
    }
    self.var_19169da06f71a4f2 = undefined;
    if (var_3e9c60d3d2b4ed07 && self getscriptablepartstate("Exhaust") == "on") {
        self setscriptablepartstate("Exhaust", "off");
    }
    if (var_57638606b57e8776 && self getscriptablepartstate("NaviLights") == "on") {
        self setscriptablepartstate("NaviLights", "off");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7505
// Size: 0x8a
function function_a91927df280e94e4() {
    if (!isdefined(self.var_19169da06f71a4f2)) {
        if (self getscriptablehaspart("Exhaust") && vehicle_damage_getstate() == "pristine" && (!isdefined(self.fuel) || self.fuel > 0)) {
            self setscriptablepartstate("Exhaust", "on");
        }
        if (self getscriptablehaspart("NaviLights")) {
            self setscriptablepartstate("NaviLights", "on");
        }
    }
    self.var_19169da06f71a4f2 = "playing";
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7596
// Size: 0x31
function function_4e7868ef633f4b36() {
    self endon("death");
    self endon("unanchored");
    while (self vehicle_getspeed() > 2) {
        wait(0.2);
    }
    self function_481c2a63f2ba3332(-1, 100);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75ce
// Size: 0x13
function function_3112242e4bc392de() {
    self notify("unanchored");
    self function_481c2a63f2ba3332(0);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e8
// Size: 0x20c
function function_a1a583c3cc871645(bool) {
    if (bool) {
        /#
            assert(isdefined(self.var_ab34d06670d41495) && self.var_ab34d06670d41495 > 0, "vehicle_occupancy_allowMovement(true) called more times than vehicle_occupancy_allowMovement(false).");
        #/
        self.var_ab34d06670d41495--;
        if (self.var_ab34d06670d41495 == 0) {
            self.var_ab34d06670d41495 = undefined;
            foreach (occupant in function_f6cb37189c84811b()) {
                occupant val::set("vehicle_occupant", "fire", 1);
            }
            if (isdefined(self.var_3a442282fb9074e1)) {
                foreach (occupant in self.var_3a442282fb9074e1) {
                    occupant val::set("vehicle_turret", "fire", 1);
                }
            }
        }
    } else {
        if (!isdefined(self.var_ab34d06670d41495)) {
            self.var_ab34d06670d41495 = 0;
        }
        self.var_ab34d06670d41495++;
        if (self.var_ab34d06670d41495 == 1) {
            foreach (occupant in function_f6cb37189c84811b()) {
                occupant val::set("vehicle_occupant", "fire", 0);
            }
            if (isdefined(self.var_3a442282fb9074e1)) {
                foreach (occupant in self.var_3a442282fb9074e1) {
                    occupant val::set("vehicle_turret", "fire", 0);
                }
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77fb
// Size: 0x22
function function_80d84f556cc8017a() {
    return isdefined(self) && isdefined(self.var_ab34d06670d41495) && self.var_ab34d06670d41495 > 0;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7825
// Size: 0xa0
function function_f6cb37189c84811b() {
    vehicleref = function_d93ec4635290febd();
    var_ff131bcd82ff52d9 = [];
    foreach (seatid in vehicle_occupancy_getallvehicleseats(self)) {
        if (function_1003e8d7c662a2ff(vehicleref, seatid)) {
            occupant = vehicle_occupancy_getseatoccupant(self, seatid, 0);
            if (isdefined(occupant) && isplayer(occupant)) {
                var_ff131bcd82ff52d9[var_ff131bcd82ff52d9.size] = occupant;
            }
        }
    }
    return var_ff131bcd82ff52d9;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78cd
// Size: 0x39
function function_1003e8d7c662a2ff(vehicleref, seatid) {
    seatdata = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforseat(vehicleref, seatid);
    return isdefined(seatdata) && istrue(seatdata.var_4c78bdf78d543129);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790e
// Size: 0x19
function function_f654c168752ed299() {
    return isdefined(self) && self vehicle_isphysveh() && self function_76fa53e72547ff02();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x792f
// Size: 0x23f
function vehicle_occupancy_allowmovement(vehicle, bool, var_ffb36a4b82c7ad04, var_f4942f1848b5b6ca) {
    if (bool) {
        /#
            assert(isdefined(vehicle.movementdisabled) && vehicle.movementdisabled > 0, "vehicle_occupancy_allowMovement(true) called more times than vehicle_occupancy_allowMovement(false).");
        #/
        vehicle.movementdisabled--;
        if (vehicle.movementdisabled == 0) {
            occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle);
            if (isdefined(occupants)) {
                namespace_84cff6185e39aa66::vehomn_hidewarning("movementDisabled", occupants, vehicle function_d93ec4635290febd());
                if (vehicle function_1e8542a707a8002("p2p")) {
                    vehicle function_77320e794d35465a("p2p", "resume", 1);
                }
                if (vehicle function_f654c168752ed299()) {
                    vehicle function_64d8ae560c3ec9b6(0);
                } else {
                    foreach (seatid, occupant in vehicle.occupants) {
                        vehicle_occupancy_allowmovementplayer(vehicle, occupant, 1, seatid);
                    }
                }
            }
            return 1;
        }
    } else {
        if (!isdefined(vehicle.movementdisabled)) {
            vehicle.movementdisabled = 0;
        }
        vehicle.movementdisabled++;
        if (vehicle.movementdisabled == 1) {
            occupants = namespace_1fbd40990ee60ede::function_efa75aa7f0a1289(vehicle);
            if (isdefined(occupants)) {
                if (!isdefined(var_ffb36a4b82c7ad04) || var_ffb36a4b82c7ad04 == 1) {
                    namespace_84cff6185e39aa66::vehomn_showwarning("movementDisabled", occupants, vehicle function_d93ec4635290febd());
                }
                if (vehicle function_1e8542a707a8002("p2p") && !istrue(var_f4942f1848b5b6ca)) {
                    vehicle function_77320e794d35465a("p2p", "pause", 1);
                }
                if (vehicle function_f654c168752ed299()) {
                    vehicle function_64d8ae560c3ec9b6(1);
                    vehicle.veh_throttle = 0;
                } else {
                    foreach (seatid, occupant in vehicle.occupants) {
                        vehicle_occupancy_allowmovementplayer(vehicle, occupant, 0, seatid);
                    }
                }
            }
            return 0;
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b75
// Size: 0x95
function vehicle_occupancy_clearallowmovement(vehicle) {
    if (vehicle function_f654c168752ed299()) {
        vehicle function_64d8ae560c3ec9b6(0);
    } else if (isdefined(vehicle.occupants)) {
        foreach (seatid, occupant in vehicle.occupants) {
            vehicle_occupancy_allowmovementplayer(1, occupant, seatid);
        }
    }
    vehicle.movementdisabled = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c11
// Size: 0xd7
function vehicle_occupancy_allowmovementplayer(vehicle, player, bool, seatid) {
    if (bool) {
        if (istrue(player.vehicledisabledmovement)) {
            if (player _isalive()) {
                player val::function_c9d0b43701bdba00("vehicle_occupancy");
            }
            player.vehicledisabledmovement = undefined;
        }
    } else {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
        if (isdefined(var_c50b485a43752fd.animtag) && var_c50b485a43752fd.animtag == "tag_seat_0") {
            if (!istrue(player.vehicledisabledmovement)) {
                if (player _isalive()) {
                    player val::set("vehicle_occupancy", "allow_movement", 0);
                    player.vehicledisabledmovement = 1;
                }
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cef
// Size: 0x42
function vehicle_occupancy_clearallowmovementplayer(player, var_fcef8d217a441961) {
    if (!istrue(var_fcef8d217a441961) && istrue(player.vehicledisabledmovement)) {
        player val::function_c9d0b43701bdba00("vehicle_occupancy");
    }
    player.vehicledisabledmovement = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d38
// Size: 0x2a
function vehicle_occupancy_movementisallowed(vehicle) {
    return !isdefined(vehicle.movementdisabled) || vehicle.movementdisabled <= 0;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6a
// Size: 0x56
function function_ac0a3326d43eb8fd() {
    vehicle_occupancy_allowmovement(self, 0, 0);
    namespace_1fbd40990ee60ede::function_d0092c44c5588870();
    if (self vehicle_isphysveh()) {
        self function_65aa053c077c003a(1);
    }
    self.islocked = 1;
    occupants = function_efa75aa7f0a1289(self);
    namespace_84cff6185e39aa66::vehomn_showwarning("locked", occupants, function_d93ec4635290febd());
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc7
// Size: 0x5c
function function_474237292e64417e() {
    vehicle_occupancy_allowmovement(self, 1, 0);
    namespace_1fbd40990ee60ede::function_7c81e0d41cbbce7f();
    namespace_1fbd40990ee60ede::function_9e710c9f3a15ffda();
    if (self vehicle_isphysveh()) {
        self function_65aa053c077c003a(0);
    }
    self.islocked = undefined;
    occupants = function_efa75aa7f0a1289(self);
    namespace_84cff6185e39aa66::vehomn_hidewarning("locked", occupants, function_d93ec4635290febd());
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2a
// Size: 0x13
function function_72f871bf74995298() {
    return isdefined(self) && istrue(self.islocked);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e45
// Size: 0x297
function vehicle_occupancy_getexitpositionandangles(vehicle, player, seatid, allowairexit, var_732c1a4dd3a04513, var_fe757bf1a5d559b4) {
    exitboundinginfo = function_517f60905f08bf96(vehicle);
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle function_d93ec4635290febd(), seatid);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    if (isdefined(var_fe757bf1a5d559b4)) {
        var_5580f4007ec05fc4 = seatid + var_fe757bf1a5d559b4;
        var_2b16a165170d3506 = var_e2818ad39a3341b4.exitdirections[var_5580f4007ec05fc4];
        position = vehicle_occupancy_getexitposition(vehicle, player, var_5580f4007ec05fc4, exitboundinginfo, 1);
        if (isdefined(position)) {
            angles = undefined;
            if (!isdefined(var_c50b485a43752fd.animtag) || var_c50b485a43752fd.animtag != "tag_seat_0") {
                angles = vehicle_occupancy_getexitangles(vehicle, player, var_5580f4007ec05fc4, var_732c1a4dd3a04513);
            }
            if (var_fe757bf1a5d559b4 == "_to_roof") {
                player notify("roof_exit");
            }
            return [0:position, 1:angles, 2:var_fe757bf1a5d559b4, 3:var_2b16a165170d3506];
        }
    }
    var_21d45f646111d24f = 0;
    /#
        var_21d45f646111d24f = getdvarint(@"hash_7ae0d88acb509143", 0);
    #/
    foreach (var_11c87faec6f85f74 in var_c50b485a43752fd.exitids) {
        var_5580f4007ec05fc4 = var_11c87faec6f85f74.var_2b16a165170d3506;
        var_2b16a165170d3506 = var_e2818ad39a3341b4.exitdirections[var_5580f4007ec05fc4];
        if (var_2b16a165170d3506 == "roof" || var_2b16a165170d3506 == "dive") {
            continue;
        }
        /#
            if (var_21d45f646111d24f > 0) {
                var_21d45f646111d24f = var_21d45f646111d24f - 1;
                goto LOC_00000241;
            }
        #/
        position = vehicle_occupancy_getexitposition(vehicle, player, var_5580f4007ec05fc4, exitboundinginfo, allowairexit);
        if (isdefined(position)) {
            angles = undefined;
            if (!isdefined(var_c50b485a43752fd.animtag) || var_c50b485a43752fd.animtag != "tag_seat_0") {
                angles = vehicle_occupancy_getexitangles(vehicle, player, var_5580f4007ec05fc4, var_732c1a4dd3a04513);
            }
            return [0:position, 1:angles, 2:undefined, 3:var_2b16a165170d3506];
        LOC_00000241:
        }
    LOC_00000241:
    }
    if (getdvarint(@"hash_9c95c78d2efca328", 1) == 1) {
        position = function_ca069b5427d4ff47(vehicle, player);
        if (isdefined(position)) {
            return [0:position, 1:undefined, 2:undefined, 3:"front"];
        }
    }
    return undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80e4
// Size: 0xc1e
function vehicle_occupancy_getexitposition(vehicle, player, var_5580f4007ec05fc4, var_1d7a120a5df60069, allowairexit) {
    if (!isdefined(vehicle) || !isdefined(player) || !isdefined(var_5580f4007ec05fc4)) {
        /#
            assertmsg("isdefined( vehicle ): " + isdefined(vehicle) + " isdefined( player ): " + isdefined(player) + " isdefined( exitID ): " + isdefined(var_5580f4007ec05fc4));
        #/
        return;
    }
    data = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    if (!isdefined(data)) {
        /#
            assertmsg("isdefined( data ): " + isdefined(data));
        #/
        return;
    }
    if (istrue(var_1d7a120a5df60069.exitsfailed[var_5580f4007ec05fc4])) {
        return;
    }
    if (isdefined(var_1d7a120a5df60069.exitpositions[var_5580f4007ec05fc4])) {
        return var_1d7a120a5df60069.exitpositions[var_5580f4007ec05fc4];
    }
    if (!isdefined(data.exitoffsets[var_5580f4007ec05fc4])) {
        /#
            assertmsg("data.exitOffsets[ " + var_5580f4007ec05fc4 + " ] must be defined.");
        #/
        return;
    }
    if (!isdefined(data.exitdirections[var_5580f4007ec05fc4])) {
        /#
            assertmsg("data.exitDirections[ " + var_5580f4007ec05fc4 + " ] must be defined.");
        #/
        return;
    }
    var_7862c7c7ade2b42e = data.exitoffsets[var_5580f4007ec05fc4];
    var_2b16a165170d3506 = data.exitdirections[var_5580f4007ec05fc4];
    /#
        if (getdvar(@"hash_6d41518ba7b7fe27", "<unknown string>") != "<unknown string>") {
            var_7862c7c7ade2b42e = getdvarvector(@"hash_6d41518ba7b7fe27", var_7862c7c7ade2b42e);
        }
    #/
    if (var_2b16a165170d3506 == "roof" && data.var_c08d88c04569a00b == "animated") {
        exitposition = vehicle.origin + rotatevector(var_7862c7c7ade2b42e, vehicle.angles);
        var_1d7a120a5df60069.exitpositions[var_5580f4007ec05fc4] = exitposition;
        return exitposition;
    }
    contents = physics_createcontents([0:"physicscontents_item", 1:"physicscontents_glass", 2:"physicscontents_vehicle", 3:"physicscontents_vehicleclip", 4:"physicscontents_playerclip"]);
    ignorelist = [];
    foreach (ent in vehicle getlinkedchildren(1)) {
        if (!isplayer(ent)) {
            ignorelist[ignorelist.size] = ent;
        }
    }
    ignorelist[ignorelist.size] = vehicle;
    ignorelist[ignorelist.size] = player;
    if (var_2b16a165170d3506 == "inside" || var_2b16a165170d3506 == "dive" || var_2b16a165170d3506 == "roof" || var_2b16a165170d3506 == "top") {
        caststart = vehicle.origin + rotatevector(var_7862c7c7ade2b42e, vehicle.angles);
        castend = caststart;
        castend = function_fe33f8f45b65696e(player, caststart, castend, ignorelist, allowairexit, var_2b16a165170d3506);
        if (!isdefined(castend)) {
            var_1d7a120a5df60069.exitsfailed[var_5580f4007ec05fc4] = 1;
            return;
        }
        var_1d7a120a5df60069.exitpositions[var_5580f4007ec05fc4] = castend;
        return castend;
    }
    if (istrue(var_1d7a120a5df60069.var_8f7c0dee5d7bdae)) {
        var_1d7a120a5df60069.exitsfailed[var_5580f4007ec05fc4] = 1;
        return;
    }
    var_385f836bd472cc20 = ter_op(vehicle tagexists("tag_body_animate"), "tag_body_animate", "tag_body");
    center = vehicle gettagorigin(var_385f836bd472cc20);
    var_b80302a5d53248b7 = anglebetweenvectors(anglestoup(vehicle.angles), (0, 0, 1)) > 90;
    var_6fd2732998d97e6d = 16;
    var_a42954201627527e = 0;
    var_3f21644696ad05f6 = 0;
    switch (var_2b16a165170d3506) {
    case #"hash_4b8799075d3a89b8":
        var_566b4a8c9324219 = vehicle.angles[0];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        var_3f21644696ad05f6 = var_33c8684fb7c8588d > 0;
        if (var_3f21644696ad05f6) {
            var_a42954201627527e = var_a42954201627527e + abs(sin(var_566b4a8c9324219)) * (data.exitextents["front"] + 16);
            var_3e656678779cc7e9 = data.exitextents["front"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + abs(cos(var_566b4a8c9324219) * var_3e656678779cc7e9);
            var_7862c7c7ade2b42e = (max(var_7862c7c7ade2b42e[0], var_6fd2732998d97e6d), var_7862c7c7ade2b42e[1], var_7862c7c7ade2b42e[2]);
        } else {
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            var_7862c7c7ade2b42e = (max(var_7862c7c7ade2b42e[0], data.exitextents["front"] + var_6fd2732998d97e6d), var_7862c7c7ade2b42e[1], var_7862c7c7ade2b42e[2]);
        }
        break;
    case #"hash_5163a22eb8c03302":
        var_566b4a8c9324219 = vehicle.angles[0];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        var_3f21644696ad05f6 = var_33c8684fb7c8588d < 0;
        if (var_3f21644696ad05f6) {
            var_a42954201627527e = var_a42954201627527e + abs(sin(var_566b4a8c9324219)) * (data.exitextents["back"] + 16);
            var_3e656678779cc7e9 = data.exitextents["back"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + abs(cos(var_566b4a8c9324219) * var_3e656678779cc7e9);
            var_7862c7c7ade2b42e = (min(var_7862c7c7ade2b42e[0], -1 * var_6fd2732998d97e6d), var_7862c7c7ade2b42e[1], var_7862c7c7ade2b42e[2]);
        } else {
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            var_7862c7c7ade2b42e = (min(var_7862c7c7ade2b42e[0], -1 * (data.exitextents["back"] + var_6fd2732998d97e6d)), var_7862c7c7ade2b42e[1], var_7862c7c7ade2b42e[2]);
        }
        break;
    case #"hash_c9b3133a17a3b2d0":
        var_566b4a8c9324219 = vehicle.angles[2];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        var_3f21644696ad05f6 = var_33c8684fb7c8588d < 0;
        if (var_3f21644696ad05f6) {
            var_a42954201627527e = var_a42954201627527e + abs(sin(var_566b4a8c9324219)) * (data.exitextents["left"] + 16);
            var_3e656678779cc7e9 = data.exitextents["left"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + abs(cos(var_566b4a8c9324219)) * var_3e656678779cc7e9;
            var_7862c7c7ade2b42e = (var_7862c7c7ade2b42e[0], max(var_7862c7c7ade2b42e[1], var_6fd2732998d97e6d), var_7862c7c7ade2b42e[2]);
        } else {
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            var_7862c7c7ade2b42e = (var_7862c7c7ade2b42e[0], max(var_7862c7c7ade2b42e[1], data.exitextents["left"] + var_6fd2732998d97e6d), var_7862c7c7ade2b42e[2]);
        }
        break;
    case #"hash_96815ce4f2a3dbc5":
        var_566b4a8c9324219 = vehicle.angles[2];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        var_3f21644696ad05f6 = var_33c8684fb7c8588d > 0;
        if (var_3f21644696ad05f6) {
            var_a42954201627527e = var_a42954201627527e + abs(sin(var_566b4a8c9324219)) * (data.exitextents["right"] + 16);
            var_3e656678779cc7e9 = data.exitextents["right"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + abs(cos(var_566b4a8c9324219)) * var_3e656678779cc7e9;
            var_7862c7c7ade2b42e = (var_7862c7c7ade2b42e[0], min(var_7862c7c7ade2b42e[1], -1 * var_6fd2732998d97e6d), var_7862c7c7ade2b42e[2]);
        } else {
            var_6fd2732998d97e6d = var_6fd2732998d97e6d + min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            var_7862c7c7ade2b42e = (var_7862c7c7ade2b42e[0], min(var_7862c7c7ade2b42e[1], -1 * (data.exitextents["right"] + var_6fd2732998d97e6d)), var_7862c7c7ade2b42e[2]);
        }
        break;
    }
    angles = ter_op(var_3f21644696ad05f6, (0, vehicle.angles[1], 0), vehicle.angles);
    var_7862c7c7ade2b42e = center + rotatevector((var_7862c7c7ade2b42e[0], var_7862c7c7ade2b42e[1], 10), angles);
    if (var_b80302a5d53248b7) {
        var_7862c7c7ade2b42e = var_7862c7c7ade2b42e + (0, 0, 20);
    }
    if (!isdefined(var_1d7a120a5df60069.var_e076f493b3f213d9)) {
        var_1d7a120a5df60069.var_e076f493b3f213d9 = 16;
    }
    var_e076f493b3f213d9 = var_1d7a120a5df60069.var_e076f493b3f213d9;
    var_145d0dc29d9bde7 = physics_spherecast(center, var_7862c7c7ade2b42e, var_e076f493b3f213d9, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1);
    while (isdefined(var_145d0dc29d9bde7) && istrue(var_145d0dc29d9bde7[1])) {
        if (var_1d7a120a5df60069.var_e076f493b3f213d9 == 16) {
            var_1d7a120a5df60069.var_e076f493b3f213d9 = 10;
        } else if (var_1d7a120a5df60069.var_e076f493b3f213d9 == 10) {
            var_1d7a120a5df60069.var_e076f493b3f213d9 = 5;
        } else {
            var_1d7a120a5df60069.var_8f7c0dee5d7bdae = 1;
            var_1d7a120a5df60069.exitsfailed[var_5580f4007ec05fc4] = 1;
            return;
        }
        var_145d0dc29d9bde7 = physics_spherecast(center, var_7862c7c7ade2b42e, var_1d7a120a5df60069.var_e076f493b3f213d9, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1);
    }
    if (isdefined(var_145d0dc29d9bde7) && (istrue(var_145d0dc29d9bde7[1]) || isdefined(var_145d0dc29d9bde7[0]) && isdefined(var_145d0dc29d9bde7[0][0]) && isdefined(var_145d0dc29d9bde7[0][0]["position"]))) {
        /#
            var_c9e915e56c1b6170 = var_7862c7c7ade2b42e;
            if (isdefined(var_145d0dc29d9bde7[0]) && isdefined(var_145d0dc29d9bde7[0][0]) && isdefined(var_145d0dc29d9bde7[0][0]["<unknown string>"])) {
                var_c9e915e56c1b6170 = var_145d0dc29d9bde7[0][0]["<unknown string>"];
            }
            if (istrue(level.var_8962097bbd2afcb4)) {
                if (isdefined(var_145d0dc29d9bde7[0]) && isdefined(var_145d0dc29d9bde7[0][0]) && isdefined(var_145d0dc29d9bde7[0][0]["<unknown string>"])) {
                    level thread function_2127168686332a93(var_145d0dc29d9bde7[0][0]["<unknown string>"], 2, 60, (1, 0, 0));
                }
                level thread function_6bb041ee1ab70e18(center, var_c9e915e56c1b6170, var_e076f493b3f213d9, 60, (0, 1, 0));
            }
        #/
        var_1d7a120a5df60069.exitsfailed[var_5580f4007ec05fc4] = 1;
        return;
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            level thread function_6bb041ee1ab70e18(center, var_7862c7c7ade2b42e, var_e076f493b3f213d9, 60, (0, 1, 0));
        }
    #/
    var_cb94032c1755440c = var_7862c7c7ade2b42e + (0, 0, 72);
    var_2c105cd38617bccf = physics_raycast(var_7862c7c7ade2b42e, var_cb94032c1755440c, contents, ignorelist, 0, "physicsquery_closest", 1);
    if (isdefined(var_2c105cd38617bccf) && isdefined(var_2c105cd38617bccf[0]) && isdefined(var_2c105cd38617bccf[0]["position"])) {
        var_cb94032c1755440c = var_2c105cd38617bccf[0]["position"];
        /#
            if (istrue(level.var_8962097bbd2afcb4)) {
                level thread function_2127168686332a93(var_cb94032c1755440c, 2, 60, (1, 0, 0));
            }
        #/
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            level thread function_a03a1d77df140f9c(var_7862c7c7ade2b42e, var_cb94032c1755440c, 60, (0, 0, 1));
        }
    #/
    var_5d1981eab4b950f0 = var_cb94032c1755440c - (0, 0, 72 + 10);
    var_df0e1a73dc741251 = var_cb94032c1755440c - (0, 0, data.exitextents["bottom"] + 125 + var_a42954201627527e);
    castend = function_fe33f8f45b65696e(player, var_5d1981eab4b950f0, var_df0e1a73dc741251, ignorelist, allowairexit, var_2b16a165170d3506);
    if (!isdefined(castend)) {
        var_1d7a120a5df60069.exitsfailed[var_5580f4007ec05fc4] = 1;
        return;
    }
    var_1d7a120a5df60069.exitpositions[var_5580f4007ec05fc4] = castend;
    return castend;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d0a
// Size: 0x515
function function_ca069b5427d4ff47(vehicle, player) {
    var_36ceaddaa67aa6bf = [];
    var_46b3d89477cbf92a = [];
    ignorelist = [0:player];
    contents = physics_createcontents([0:"physicscontents_item", 1:"physicscontents_glass", 2:"physicscontents_vehicle", 3:"physicscontents_vehicleclip", 4:"physicscontents_playerclip", 5:"physicscontents_characterproxy"]);
    if (isnavmeshloaded()) {
        var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
        if (vehicle function_a24042975031e692()) {
            points = [0:vehicle.origin + rotatevector((0, var_e2818ad39a3341b4.exitextents["left"] + 50, 0), vehicle.angles), 1:vehicle.origin + rotatevector((0, -1 * (var_e2818ad39a3341b4.exitextents["right"] + 50), 0), vehicle.angles), 2:vehicle.origin + rotatevector((-1 * (var_e2818ad39a3341b4.exitextents["back"] + 50), 0, 0), vehicle.angles), 3:vehicle.origin + rotatevector((var_e2818ad39a3341b4.exitextents["front"] + 50, 0, 0), vehicle.angles)];
        } else {
            points = [0:player.origin];
        }
        foreach (point in points) {
            var_ab2d20734dd55190 = getclosestpointonnavmesh(point);
            castend = function_fe33f8f45b65696e(player, var_ab2d20734dd55190 + (0, 0, 10), var_ab2d20734dd55190 - (0, 0, 20), ignorelist, 1, "inside");
            if (isdefined(castend)) {
                var_e021c2744cc7ed68 = physics_raycast(vehicle.origin, castend + (0, 0, 72 / 2), contents, [0:vehicle, 1:player], 0, "physicsquery_all", 1);
                /#
                    if (istrue(level.var_8962097bbd2afcb4)) {
                        thread function_a03a1d77df140f9c(vehicle.origin, castend + (0, 0, 72 / 2), 60, ter_op(isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0, (1, 0, 0), (0, 1, 1)));
                    }
                #/
                if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                    var_2a5ad6fba40d7ee = 0;
                    foreach (hit in var_e021c2744cc7ed68) {
                        if (isdefined(hit["hittype"]) && hit["hittype"] != "hittype_entity") {
                            var_2a5ad6fba40d7ee = 1;
                            break;
                        }
                    }
                    if (var_2a5ad6fba40d7ee) {
                        var_36ceaddaa67aa6bf[var_36ceaddaa67aa6bf.size] = castend;
                    } else {
                        var_46b3d89477cbf92a[var_46b3d89477cbf92a.size] = castend;
                    }
                } else {
                    return castend;
                }
            }
        }
    }
    if (var_46b3d89477cbf92a.size > 0) {
        return var_46b3d89477cbf92a[0];
    }
    if (var_36ceaddaa67aa6bf.size > 0) {
        return var_36ceaddaa67aa6bf[0];
    }
    nodes = getnodesinradiussorted(vehicle.origin, 800, 0, 250, "path");
    if (!isdefined(nodes) || nodes.size <= 0) {
        var_96020425b789949e = getrandomnavpoints(vehicle.origin, 800, 6);
        if (!isdefined(var_96020425b789949e) || var_96020425b789949e.size <= 0) {
            return;
        }
        nodes = [];
        foreach (vec in var_96020425b789949e) {
            node = spawnstruct();
            node.origin = vec;
            nodes[nodes.size] = node;
        }
        nodes = sortbydistance(nodes, vehicle.origin);
    }
    var_440d4df82fbf5096 = 0;
    foreach (node in nodes) {
        castend = function_fe33f8f45b65696e(player, node.origin, node.origin, ignorelist, 1, "inside");
        if (isdefined(castend)) {
            return castend;
        }
        var_440d4df82fbf5096 = var_440d4df82fbf5096 + 1;
        if (var_440d4df82fbf5096 > 5) {
            break;
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9226
// Size: 0xad
function private function_136fea30dbedce0f(vehicle, player, origin) {
    ignorelist = [];
    foreach (ent in vehicle getlinkedchildren(1)) {
        if (!isplayer(ent)) {
            ignorelist[ignorelist.size] = ent;
        }
    }
    ignorelist[ignorelist.size] = vehicle;
    castend = origin;
    castend = function_fe33f8f45b65696e(player, origin, castend, ignorelist, 1, "inside");
    return isdefined(castend);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x92db
// Size: 0x247
function private function_fe33f8f45b65696e(player, caststart, castend, ignorelist, allowairexit, var_2b16a165170d3506) {
    var_de8de34672903d23 = 0;
    var_dae1d7cf43d6690e = undefined;
    var_41a388afbf92867b = undefined;
    /#
        var_dae1d7cf43d6690e = caststart;
        var_41a388afbf92867b = castend;
    #/
    contents = physics_createcontents([0:"physicscontents_item", 1:"physicscontents_glass", 2:"physicscontents_vehicle", 3:"physicscontents_vehicleclip", 4:"physicscontents_playerclip", 5:"physicscontents_characterproxy"]);
    var_e021c2744cc7ed68 = physics_charactercast(caststart, castend, player, 0, (0, 0, 0), contents, ignorelist, "physicsquery_closest", "physicsquery_any");
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        if (var_e021c2744cc7ed68[1]) {
            /#
                var_41a388afbf92867b = var_dae1d7cf43d6690e;
            #/
            var_de8de34672903d23 = 1;
        } else if (var_e021c2744cc7ed68[0].size == 0) {
            if (!istrue(allowairexit)) {
                /#
                    var_41a388afbf92867b = var_dae1d7cf43d6690e;
                #/
                var_de8de34672903d23 = 1;
            } else {
                if (var_2b16a165170d3506 != "top" && var_2b16a165170d3506 != "roof" && var_2b16a165170d3506 != "inside") {
                    castend = castend + (0, 0, 40);
                }
                /#
                    var_41a388afbf92867b = castend;
                #/
            }
        } else {
            castend = var_e021c2744cc7ed68[0][0]["shape_position"];
            /#
                var_41a388afbf92867b = castend;
            #/
        }
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            var_f8a269392b9c9b15 = int(ceil(60 / level.framedurationseconds));
            thread function_dafe9f7ddcab9bf1(var_dae1d7cf43d6690e, 16, 72, undefined, (0, 1, 1), undefined, var_f8a269392b9c9b15);
            thread function_a03a1d77df140f9c(var_dae1d7cf43d6690e, var_41a388afbf92867b, 60, (0, 1, 1));
            if (var_de8de34672903d23 && isdefined(var_e021c2744cc7ed68[0][0]) && isdefined(var_e021c2744cc7ed68[0][0]["<unknown string>"])) {
                level thread function_2127168686332a93(var_e021c2744cc7ed68[0][0]["<unknown string>"], 2, 60, (1, 0, 0));
            }
        }
    #/
    if (var_de8de34672903d23) {
        return undefined;
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            thread function_2127168686332a93(var_41a388afbf92867b, 2, 60, (0, 1, 0));
        }
    #/
    return castend;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x952a
// Size: 0x7ea
function function_517f60905f08bf96(vehicle) {
    exitboundinginfo = undefined;
    if (isdefined(vehicle.exitboundinginfo) && vehicle.exitboundinginfo.timestamp == gettime()) {
        exitboundinginfo = vehicle.exitboundinginfo;
    } else {
        var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
        if (isdefined(var_e2818ad39a3341b4) && isdefined(var_e2818ad39a3341b4.exitextents)) {
            /#
                assertex(isdefined(var_e2818ad39a3341b4.exitextents["front"]), "vehicle_occupancy_getExitBoundingInfo() called with invalid exitExtents[ "front" ].");
            #/
            /#
                assertex(isdefined(var_e2818ad39a3341b4.exitextents["back"]), "vehicle_occupancy_getExitBoundingInfo() called with invalid exitExtents[ "back" ].");
            #/
            /#
                assertex(isdefined(var_e2818ad39a3341b4.exitextents["left"]), "vehicle_occupancy_getExitBoundingInfo() called with invalid exitExtents[ "left" ].");
            #/
            /#
                assertex(isdefined(var_e2818ad39a3341b4.exitextents["right"]), "vehicle_occupancy_getExitBoundingInfo() called with invalid exitExtents[ "right" ].");
            #/
            /#
                assertex(isdefined(var_e2818ad39a3341b4.exitextents["top"]), "vehicle_occupancy_getExitBoundingInfo() called with invalid exitExtents[ "top" ].");
            #/
            /#
                assertex(isdefined(var_e2818ad39a3341b4.exitextents["bottom"]), "vehicle_occupancy_getExitBoundingInfo() called with invalid exitExtents[ "bottom" ].");
            #/
            exitboundinginfo = spawnstruct();
            vehicle.exitboundinginfo = exitboundinginfo;
            exitboundinginfo = exitboundinginfo;
            exitboundinginfo.vehicle = vehicle;
            exitboundinginfo.timestamp = gettime();
            exitboundinginfo.exitsfailed = [];
            exitboundinginfo.exitpositions = [];
            exitboundinginfo.orientedboxpoints = [];
            exitboundinginfo.unorientedboxpoints = [];
            /#
                angles = vehicle.angles;
                var_35a43f1d588a99bc = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"]), angles);
                var_2e27bd18dfe68565 = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"]), angles);
                var_3034b10ee587f92e = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"]), angles);
                var_23f57be14a18a221 = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"]), angles);
                var_5de23e0bafeeeb6a = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1), angles);
                var_f5245e120de48db3 = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1), angles);
                var_2febbcb4c37b3b64 = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1), angles);
                var_3a64b6f876a6b09f = rotatevector((var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1, var_e2818ad39a3341b4.exitextents["<unknown string>"], var_e2818ad39a3341b4.exitextents["<unknown string>"] * -1), angles);
                points = [0:var_35a43f1d588a99bc, 1:var_2e27bd18dfe68565, 2:var_3034b10ee587f92e, 3:var_23f57be14a18a221, 4:var_5de23e0bafeeeb6a, 5:var_f5245e120de48db3, 6:var_2febbcb4c37b3b64, 7:var_3a64b6f876a6b09f];
                var_12ea3927e1b44942 = -99999;
                var_ee041cbc1e1f4c1c = 99999;
                var_16b7a2fe1cbcddca = -99999;
                var_8e6d35a0c2cd0b37 = 99999;
                var_5d4d3e8b839c896a = -99999;
                var_ee77c08bee0df950 = 99999;
                var_74e1fbef334a1e72 = (0, angles[1], 0);
                foreach (point in points) {
                    point = rotatevectorinverted(point, var_74e1fbef334a1e72);
                    if (point[0] > var_12ea3927e1b44942) {
                        var_12ea3927e1b44942 = point[0];
                    }
                    if (point[0] < var_ee041cbc1e1f4c1c) {
                        var_ee041cbc1e1f4c1c = point[0];
                    }
                    if (point[1] < var_8e6d35a0c2cd0b37) {
                        var_8e6d35a0c2cd0b37 = point[1];
                    }
                    if (point[1] > var_16b7a2fe1cbcddca) {
                        var_16b7a2fe1cbcddca = point[1];
                    }
                    if (point[2] > var_5d4d3e8b839c896a) {
                        var_5d4d3e8b839c896a = point[2];
                    }
                    if (point[2] < var_ee77c08bee0df950) {
                        var_ee77c08bee0df950 = point[2];
                    }
                }
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_35a43f1d588a99bc;
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_2e27bd18dfe68565;
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_3034b10ee587f92e;
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_23f57be14a18a221;
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_5de23e0bafeeeb6a;
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_f5245e120de48db3;
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_2febbcb4c37b3b64;
                exitboundinginfo.orientedboxpoints["<unknown string>"] = vehicle.origin + var_3a64b6f876a6b09f;
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_12ea3927e1b44942, var_16b7a2fe1cbcddca, var_5d4d3e8b839c896a), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_12ea3927e1b44942, var_8e6d35a0c2cd0b37, var_5d4d3e8b839c896a), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_ee041cbc1e1f4c1c, var_16b7a2fe1cbcddca, var_5d4d3e8b839c896a), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_ee041cbc1e1f4c1c, var_8e6d35a0c2cd0b37, var_5d4d3e8b839c896a), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_12ea3927e1b44942, var_16b7a2fe1cbcddca, var_ee77c08bee0df950), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_12ea3927e1b44942, var_8e6d35a0c2cd0b37, var_ee77c08bee0df950), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_ee041cbc1e1f4c1c, var_16b7a2fe1cbcddca, var_ee77c08bee0df950), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<unknown string>"] = vehicle.origin + rotatevector((var_ee041cbc1e1f4c1c, var_8e6d35a0c2cd0b37, var_ee77c08bee0df950), var_74e1fbef334a1e72);
            #/
            exitboundinginfo thread function_5142e9c0e6eebaa4();
            /#
                if (istrue(level.var_8962097bbd2afcb4)) {
                    function_6bdf9766fe9e319(exitboundinginfo);
                }
            #/
        }
    }
    return exitboundinginfo;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d1c
// Size: 0x68
function private function_5142e9c0e6eebaa4() {
    waitframe();
    if (isdefined(self.vehicle)) {
        return;
    }
    if (!isdefined(self.vehicle.exitboundinginfo)) {
        return;
    }
    if (self.vehicle.exitboundinginfo.timestamp != self.timestamp) {
        return;
    }
    self.vehicle.exitboundinginfo = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d8b
// Size: 0x2c3
function private vehicle_occupancy_getexitangles(vehicle, player, var_5580f4007ec05fc4, var_732c1a4dd3a04513) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    exitboundinginfo = function_517f60905f08bf96(vehicle);
    exitposition = exitboundinginfo.exitpositions[var_5580f4007ec05fc4];
    var_c06551440b16249c = undefined;
    var_de0520c7c9450953 = 0;
    if (istrue(var_732c1a4dd3a04513)) {
        var_c06551440b16249c = vehicle.origin + rotatevector(var_e2818ad39a3341b4.exitoffsets[var_5580f4007ec05fc4], vehicle.angles);
        var_de0520c7c9450953 = 1;
    }
    if (!isdefined(var_c06551440b16249c)) {
        var_c06551440b16249c = player getvieworigin() + anglestoforward(player getplayerangles()) * 550;
    }
    var_95ee9a642dbea4cf = undefined;
    if (istrue(var_732c1a4dd3a04513)) {
        var_95ee9a642dbea4cf = exitposition + (0, 0, 22);
    } else {
        var_95ee9a642dbea4cf = exitposition + (0, 0, 60);
    }
    var_6a8a4307ef24181d = vectornormalize(var_c06551440b16249c - var_95ee9a642dbea4cf);
    if (!var_de0520c7c9450953) {
        contents = physics_createcontents([0:"physicscontents_vehicle", 1:"physicscontents_item"]);
        var_e021c2744cc7ed68 = physics_raycast(var_95ee9a642dbea4cf, var_95ee9a642dbea4cf + var_6a8a4307ef24181d * 300, contents, undefined, 0, "physicsquery_closest", 1);
        if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
            hitent = var_e021c2744cc7ed68[0]["entity"];
            var_899fd7301d5e9fcc = 0;
            if (isdefined(hitent)) {
                var_b404aab7d45c92 = vehicle getlinkedchildren(1);
                if (!isdefined(var_b404aab7d45c92)) {
                    var_b404aab7d45c92 = [];
                }
                var_b404aab7d45c92[var_b404aab7d45c92.size] = vehicle;
                foreach (ent in var_b404aab7d45c92) {
                    if (hitent == ent) {
                        var_899fd7301d5e9fcc = 1;
                        break;
                    }
                }
            }
            if (var_899fd7301d5e9fcc) {
                var_2b16a165170d3506 = var_e2818ad39a3341b4.exitdirections[var_5580f4007ec05fc4];
                angles = (0, vehicle.angles[1], 0);
                if (var_2b16a165170d3506 == "left" || var_2b16a165170d3506 == "right") {
                    var_109bacebd7ab9a8 = anglestoright(angles);
                } else {
                    var_109bacebd7ab9a8 = anglestoforward(angles);
                }
                var_6a8a4307ef24181d = var_6a8a4307ef24181d - var_109bacebd7ab9a8 * vectordot(var_6a8a4307ef24181d, var_109bacebd7ab9a8);
            }
        }
    }
    viewangles = vectortoangles(var_6a8a4307ef24181d);
    viewangles = (clamp(viewangles[0], -12, 12), viewangles[1], 0);
    return viewangles;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa056
// Size: 0x17c
function private vehicle_occupancy_findplayerexit(player, vehicle, var_fc7c7a874b43a31a, var_7558f98f3236963d, data, var_fe757bf1a5d559b4) {
    if (!isdefined(player) || isdefined(var_7558f98f3236963d) || istrue(data.playerdeath) && !istrue(data.playerlaststand) && !istrue(data.var_d4b9aa76041ab0a9) && !istrue(data.var_e6584ec3ffc0cb7e)) {
        return 1;
    }
    /#
        function_d3f0b37c88e04e33();
    #/
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    allowairexit = istrue(var_e2818ad39a3341b4.allowairexit) || istrue(data.allowairexit) || !vehicle vehicle_isonground();
    var_29187ec6e45d7481 = vehicle_occupancy_getexitpositionandangles(vehicle, player, var_fc7c7a874b43a31a, allowairexit, data.playerlaststand, var_fe757bf1a5d559b4);
    if (isdefined(var_29187ec6e45d7481)) {
        data.exitposition = var_29187ec6e45d7481[0];
        data.exitangles = var_29187ec6e45d7481[1];
        data.var_fe757bf1a5d559b4 = var_29187ec6e45d7481[2];
        data.var_2b16a165170d3506 = var_29187ec6e45d7481[3];
        data.var_7862c7c7ade2b42e = rotatevectorinverted(data.exitposition - vehicle.origin, vehicle.angles);
        return 1;
    } else {
        return 0;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d9
// Size: 0xbc
function function_a24042975031e692() {
    if (isdefined(function_d93ec4635290febd())) {
        var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
        return (isdefined(var_e2818ad39a3341b4) && isdefined(var_e2818ad39a3341b4.exitextents) && isdefined(var_e2818ad39a3341b4.exitextents["front"]) && isdefined(var_e2818ad39a3341b4.exitextents["back"]) && isdefined(var_e2818ad39a3341b4.exitextents["left"]) && isdefined(var_e2818ad39a3341b4.exitextents["right"]) && isdefined(var_e2818ad39a3341b4.exitextents["top"]) && isdefined(var_e2818ad39a3341b4.exitextents["bottom"]));
    }
    return 0;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa29d
// Size: 0x3dd
function function_9d86fd9a89cd2702(player, vehicle, testpoint, var_f926edcf0a329428) {
    if (!isdefined(player) || !isdefined(vehicle) || !isdefined(testpoint) || !isdefined(vehicle.origin) || !isdefined(vehicle.angles)) {
        return [0:undefined, 1:undefined];
    }
    vehicleref = vehicle function_d93ec4635290febd();
    data = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforvehicle(vehicleref);
    var_858f17801ec0a1a3 = undefined;
    if (istrue(var_f926edcf0a329428)) {
        forward = anglestoforward(vehicle.angles);
        moving = vehicle vehicle_getvelocity();
        var_8423818ecf85a883 = math::anglebetweenvectors(forward, moving);
        if (var_8423818ecf85a883 < 45) {
            var_858f17801ec0a1a3 = "front";
        } else if (var_8423818ecf85a883 > 135) {
            var_858f17801ec0a1a3 = "back";
        }
    }
    var_51552a03a376d4e6 = [];
    foreach (ref, offset in data.exitoffsets) {
        dir = data.exitdirections[ref];
        if (is_equal(var_858f17801ec0a1a3, dir) || dir == "dive" || dir == "roof") {
            continue;
        }
        exit = spawnstruct();
        exit.ref = ref;
        exit.dir = dir;
        exit.origin = vehicle.origin + rotatevector(offset, vehicle.angles);
        var_51552a03a376d4e6[var_51552a03a376d4e6.size] = exit;
    }
    var_51552a03a376d4e6 = sortbydistance(var_51552a03a376d4e6, testpoint);
    exitboundinginfo = function_517f60905f08bf96(vehicle);
    isinside = istrue(vehicle function_f3bb4f4911a1beb2(vehicleref, "isInInterior", player));
    foreach (exit in var_51552a03a376d4e6) {
        var_573b4b4b98766681 = exit.dir == "top" || exit.dir == "inside";
        if (var_573b4b4b98766681 != isinside) {
            continue;
        }
        position = vehicle_occupancy_getexitposition(vehicle, player, exit.ref, exitboundinginfo, 1);
        if (isdefined(position)) {
            return [0:position, 1:exit.dir];
        }
    }
    foreach (exit in var_51552a03a376d4e6) {
        var_573b4b4b98766681 = exit.dir == "top" || exit.dir == "inside";
        if (isinside == var_573b4b4b98766681) {
            continue;
        }
        position = vehicle_occupancy_getexitposition(vehicle, player, exit.ref, exitboundinginfo, 1);
        if (isdefined(position)) {
            return [0:position, 1:exit.dir];
        }
    }
    if (getdvarint(@"hash_9c95c78d2efca328", 1) == 1) {
        position = function_ca069b5427d4ff47(vehicle, player);
        if (isdefined(position)) {
            return [0:position, 1:undefined, 2:undefined, 3:"front"];
        }
    }
    return [0:undefined, 1:undefined];
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa682
// Size: 0x2c4
function vehicle_occupancy_moveplayertoexit(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (!isdefined(player) || istrue(data.playerdeath) && !istrue(data.playerlaststand) && !istrue(data.var_d4b9aa76041ab0a9) && !istrue(data.var_f276d4e53593ec9a) || isdefined(var_7558f98f3236963d)) {
        if (isdefined(player) && !isdefined(var_7558f98f3236963d)) {
            function_c9b87beb89ec12e2(player, vehicle, !isdefined(var_7558f98f3236963d));
            player val::function_c9d0b43701bdba00("vehicle_roof_exit");
            player val::function_c9d0b43701bdba00("vehicle_occupant_common");
        }
        return 1;
    }
    var_12ae002f8d36036f = undefined;
    if (isdefined(data.var_7862c7c7ade2b42e)) {
        var_12ae002f8d36036f = vehicle.origin + rotatevector(data.var_7862c7c7ade2b42e, vehicle.angles);
    }
    if (isdefined(var_12ae002f8d36036f) && function_136fea30dbedce0f(vehicle, player, var_12ae002f8d36036f)) {
        exitposition = var_12ae002f8d36036f;
    } else {
        exitposition = data.exitposition;
    }
    if (isdefined(exitposition)) {
        if (isdefined(data.var_fe757bf1a5d559b4)) {
            if (data.var_fe757bf1a5d559b4 == "_to_roof") {
                function_aea8bd0571b7a840(player, vehicle, seatid, data);
            } else {
                player function_2e8de69e35a63f1d();
                player function_c0505f05660d120c(0, 1);
                player val::function_c9d0b43701bdba00("vehicle_roof_exit");
                player val::function_c9d0b43701bdba00("vehicle_occupant_common");
            }
        } else {
            function_c9b87beb89ec12e2(player, vehicle, !isdefined(var_7558f98f3236963d));
            if (!isdefined(player.sessionstate) || player.sessionstate != "spectator") {
                player dontinterpolate();
                if (data.var_2b16a165170d3506 == "inside" || data.var_2b16a165170d3506 == "top") {
                    player function_a055801da45d769(exitposition, vehicle);
                } else {
                    player setorigin(exitposition, 1, 1);
                }
                player setstance("stand");
                /#
                    if (istrue(level.var_8962097bbd2afcb4)) {
                        var_f8a269392b9c9b15 = int(ceil(60 / level.framedurationseconds));
                        namespace_3c37cb17ade254d::draw_capsule(exitposition, 16, 72, undefined, (1, 1, 0), undefined, var_f8a269392b9c9b15);
                    }
                #/
                if (isdefined(data.exitangles)) {
                    player setplayerangles(data.exitangles);
                }
            }
            player val::function_c9d0b43701bdba00("vehicle_roof_exit");
            player val::function_c9d0b43701bdba00("vehicle_occupant_common");
        }
        return 1;
    } else {
        function_c9b87beb89ec12e2(player, vehicle, !isdefined(var_7558f98f3236963d));
        player val::function_c9d0b43701bdba00("vehicle_roof_exit");
        player val::function_c9d0b43701bdba00("vehicle_occupant_common");
        return 0;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa94d
// Size: 0x156
function private function_aea8bd0571b7a840(player, vehicle, seatid, data) {
    vehicleref = vehicle function_d93ec4635290febd();
    var_2e7b44e2b456f504 = vehicle_occupancy_getleveldataforvehicle(vehicleref);
    if (var_2e7b44e2b456f504.var_c08d88c04569a00b == "animated") {
        var_c9e915e56c1b6170 = player function_e5d1ae0cf82e3e7a() + (0, 0, 18);
    } else {
        offset = var_2e7b44e2b456f504.exitoffsets[seatid + "_to_roof"];
        var_c9e915e56c1b6170 = vehicle.origin + rotatevector(offset, vehicle.angles);
    }
    function_c9b87beb89ec12e2(player, vehicle, 1);
    player thread vehicle_preventplayercollisiondamagefortimeafterexit(vehicle, player);
    stance = ter_op(var_2e7b44e2b456f504.var_c08d88c04569a00b == "stand_up", "stand", "crouch");
    if (isbot(player)) {
        player botsetstance(stance);
    }
    player setstance(stance, 1, 1, 1);
    player dontinterpolate();
    player function_a055801da45d769(var_c9e915e56c1b6170, vehicle);
    player val::function_c9d0b43701bdba00("vehicle_occupant_common");
    player val::function_c9d0b43701bdba00("vehicle_roof_exit");
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaaaa
// Size: 0x5a
function function_bd0403ba33ab8b6c(var_a5639d6f3f95033a, angles) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            iprintlnbold("<unknown string>" + rotatevector(self.origin - var_a5639d6f3f95033a, angles) - (0, 0, 18));
            waitframe();
        }
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab0b
// Size: 0x15f
function private function_c5819749db1604f5(player, vehicle, seatid, data) {
    vehicleref = vehicle function_d93ec4635290febd();
    var_2e7b44e2b456f504 = vehicle_occupancy_getleveldataforvehicle(vehicleref);
    if (!isdefined(var_2e7b44e2b456f504.var_c08d88c04569a00b)) {
        /#
            assertmsg("Attempted a roof exit but the roof exit type wasn't defined");
        #/
        return;
    }
    vehicle thread function_7f925d6914fa15cc(8000);
    if (var_2e7b44e2b456f504.var_c08d88c04569a00b == "animated") {
        player endon("death_or_disconnect");
        player endon("last_stand_start");
        player endon("enter_live_ragdoll");
        player endon("vehicle_roof_exit_collision_detected");
        player endon("interrupt_roof_exit");
        vehicle endon("death");
        player val::function_59c053b89257bc95("vehicle_roof_exit", [0:"script_weapon_switch", 1:"weapon_switch", 2:"melee", 3:"vehicle_seat_switch", 4:"allow_movement"], 0);
        player function_47a2fc8fdeeda75f();
        endtime = gettime() + ter_op(player function_a7de57196f4b5d16(), level.var_abe9bcb8a67ff917, level.var_d9dc5b053fb57856);
        while (!player function_d09168b16803f5be() && gettime() < endtime) {
            waitframe();
        }
        while (player function_d09168b16803f5be() && gettime() < endtime) {
            waitframe();
        }
    }
    return 1;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac72
// Size: 0x168
function private function_7f925d6914fa15cc(time) {
    if (isdefined(self.vehicletype)) {
        if (self.vehicletype == "veh9_civ_lnd_dirt_bike_physics_mp" || self.vehicletype == "veh9_civ_lnd_motorcycle_cruiser_2008_physics_mp" || self.vehicletype == "veh9_civ_lnd_scooter_eu_physics_mp") {
            return;
        }
    }
    self notify("maintainSpeedForTime");
    self endon("maintainSpeedForTime");
    if (vectordot(self vehicle_getvelocity(), anglestoforward(self.angles)) < 0 || self vehicle_getspeed() < 5) {
        return;
    }
    self endon("death");
    self.var_6179b2eea75dbfe0 = 1;
    self function_6a325f91941ed47c("player");
    self function_d2e41c7603ba7697("p2p");
    maxspeed = self vehicle_getspeed();
    endtime = gettime() + time;
    while (gettime() < endtime && istrue(self.var_6179b2eea75dbfe0) && self vehicle_getspeed() > 5) {
        self function_77320e794d35465a("p2p", "manualSpeed", namespace_3c37cb17ade254d::mph_to_ips(min(maxspeed, self vehicle_getspeed())));
        self function_77320e794d35465a("p2p", "goalPoint", self.origin + anglestoforward(self.angles) * 2000);
        waitframe();
    }
    if (!istrue(self.var_6179b2eea75dbfe0)) {
        return;
    }
    function_9a816e66a02ddb40();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xade1
// Size: 0x2b
function private function_9a816e66a02ddb40() {
    self.var_6179b2eea75dbfe0 = undefined;
    self function_77320e794d35465a("p2p", "manualSpeed", 0);
    self function_6a325f91941ed47c("p2p");
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae13
// Size: 0x36
function vehicle_occupancy_getexitcastcontents() {
    return physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_water", 2:"physicscontents_item", 3:"physicscontents_vehicle", 4:"physicscontents_playerclip"]);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae51
// Size: 0x55
function vehicle_occupancy_getexitcastignorelist(vehicle) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    ignorelist = [0:vehicle];
    if (isdefined(var_e2818ad39a3341b4.exitignorelistcallback)) {
        ignorelist = [[ var_e2818ad39a3341b4.exitignorelistcallback ]](vehicle);
    }
    return ignorelist;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaeae
// Size: 0x24
function vehicle_occupancy_watchmovefeedback(driverseatid) {
    self endon("death");
    while (1) {
        vehicle_occupancy_updatemovefeedback(driverseatid);
        waitframe();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaed9
// Size: 0x164
function vehicle_occupancy_updatemovefeedback(driverseatid) {
    driver = vehicle_occupancy_getseatoccupant(self, driverseatid);
    occupants = vehicle_occupancy_getalloccupants(self);
    if (isdefined(driver)) {
        var_e394e5e73be2f081 = driver getnormalizedmovement()[0];
        if (abs(var_e394e5e73be2f081) > 0.15) {
            foreach (occupant in occupants) {
                if (occupant _isalive()) {
                    occupant vehicle_occupancy_startmovefeedbackforplayer();
                }
            }
        } else {
            foreach (occupant in occupants) {
                if (occupant _isalive()) {
                    occupant vehicle_occupancy_stopmovefeedbackforplayer();
                }
            }
        }
    } else if (isdefined(occupants)) {
        foreach (occupant in occupants) {
            if (occupant _isalive()) {
                occupant vehicle_occupancy_stopmovefeedbackforplayer();
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb044
// Size: 0x2e
function vehicle_occupancy_startmovefeedbackforplayer() {
    if (istrue(self.vehiclemoveshakeenabled)) {
        return;
    }
    self.vehiclemoveshakeenabled = 1;
    self setscriptablepartstate("vehicleMoveShake", "active1", 0);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb079
// Size: 0x2d
function vehicle_occupancy_stopmovefeedbackforplayer() {
    if (!istrue(self.vehiclemoveshakeenabled)) {
        return;
    }
    self.vehiclemoveshakeenabled = undefined;
    self setscriptablepartstate("vehicleMoveShake", "neutral", 0);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0ad
// Size: 0x28b
function vehicle_occupancy_updatedamagefeedback(data) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(self.vehiclename);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return;
    }
    if (!isdefined(data.damage) || data.damage <= 0) {
        return;
    }
    if (!isdefined(data.meansofdeath)) {
        return;
    }
    var_655d44253941f2b = undefined;
    var_bff4b44aa047360a = undefined;
    switch (data.meansofdeath) {
    case #"hash_571e46e17a3cf2e3":
    case #"hash_5f1054c48d66fd1c":
    case #"hash_66cb246f3e55fbe2":
    case #"hash_966768b3f0c94767":
    case #"hash_a86d8c43482948a4":
    case #"hash_c22b13f81bed11f0":
        var_655d44253941f2b = "light";
        var_bff4b44aa047360a = var_e2818ad39a3341b4.damagefeedbackgrouplight;
        break;
    case #"hash_3c20f39c73a1422b":
    case #"hash_a911a1880d996edb":
    case #"hash_b1078ff213fddba6":
        var_655d44253941f2b = "heavy";
        var_bff4b44aa047360a = var_e2818ad39a3341b4.damagefeedbackgroupheavy;
        break;
    }
    if (!isdefined(var_655d44253941f2b)) {
        return;
    }
    if (!isdefined(var_bff4b44aa047360a) || var_bff4b44aa047360a == "none") {
        return;
    }
    players = [];
    if (var_bff4b44aa047360a == "driver") {
        foreach (seatid, var_c50b485a43752fd in var_e2818ad39a3341b4.seatdata) {
            if (!isdefined(var_c50b485a43752fd.animtag)) {
                continue;
            }
            if (var_c50b485a43752fd.animtag == "tag_seat_0") {
                players = [0:vehicle_occupancy_getseatoccupant(self, seatid)];
                break;
            }
        }
    } else if (var_bff4b44aa047360a == "all") {
        players = vehicle_occupancy_getalloccupants(self);
    }
    if (!isdefined(players) || players.size == 0) {
        return;
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!player _isalive()) {
            continue;
        }
        if (var_655d44253941f2b == "light") {
            player thread vehicle_occupancy_lightdamagefeedbackforplayer();
        } else if (var_655d44253941f2b == "heavy") {
            player thread vehicle_occupancy_heavydamagefeedbackforplayer();
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb33f
// Size: 0x73
function vehicle_occupancy_lightdamagefeedbackforplayer() {
    self endon("disconnect");
    self endon("vehicle_occupancy_clearLightDamageFeedbackPlayer");
    if (!isdefined(self.vehiclelightdamagefeedbackid)) {
        self.vehiclelightdamagefeedbackid = 1;
    }
    self setscriptablepartstate("vehicleDamageShakeLight", "active" + self.vehiclelightdamagefeedbackid, 0);
    self.vehiclelightdamagefeedbackid = 1 + mod(self.vehiclelightdamagefeedbackid + 1, 3);
    wait(0.15);
    thread vehicle_occupancy_clearlightdamagefeedbackplayer();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3b9
// Size: 0x27
function vehicle_occupancy_clearlightdamagefeedbackplayer() {
    self notify("vehicle_occupancy_clearLightDamageFeedbackPlayer");
    self setscriptablepartstate("vehicleDamageShakeLight", "neutral", 0);
    self.vehiclelightdamagefeedbackid = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3e7
// Size: 0x73
function vehicle_occupancy_heavydamagefeedbackforplayer() {
    self endon("disconnect");
    self endon("vehicle_occupancy_clearHeavyDamageFeedbackPlayer");
    if (!isdefined(self.vehicleheavydamagefeedbackid)) {
        self.vehicleheavydamagefeedbackid = 1;
    }
    self setscriptablepartstate("vehicleDamageShakeHeavy", "active" + self.vehicleheavydamagefeedbackid, 0);
    self.vehicleheavydamagefeedbackid = 1 + mod(self.vehicleheavydamagefeedbackid + 1, 3);
    wait(0.3);
    thread vehicle_occupancy_clearheavydamagefeedbackplayer();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb461
// Size: 0x27
function vehicle_occupancy_clearheavydamagefeedbackplayer() {
    self notify("vehicle_occupancy_clearHeavyDamageFeedbackPlayer");
    self setscriptablepartstate("vehicleDamageShakeHeavy", "neutral", 0);
    self.vehicleheavydamagefeedbackid = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb48f
// Size: 0x11
function vehicle_occupancy_cleardamagefeedbackforplayer() {
    vehicle_occupancy_clearlightdamagefeedbackplayer();
    vehicle_occupancy_clearheavydamagefeedbackplayer();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a7
// Size: 0x116
function vehicle_occupancy_giveturret(player, vehicle, objweapon) {
    player endon("disconnect");
    player endon("takeTurret");
    var_91cd55d06b5ad113 = player function_793f941d7dff15ed();
    function_c9b87beb89ec12e2(player, vehicle);
    if (var_91cd55d06b5ad113) {
        waitframe();
    }
    player namespace_1cd9f6896754adb0::set("vehicle_turret", "unresolved_collisions", 0);
    player namespace_1cd9f6896754adb0::set("vehicle_turret", "killstreaks", 0);
    if (vehicle function_80d84f556cc8017a()) {
        player namespace_1cd9f6896754adb0::set("vehicle_turret", "fire", 0);
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        player setclientomnvar("ui_br_inventory_disabled", 1);
    }
    turret = vehicle_getturretbyweapon(vehicle, objweapon);
    turret.owner = player;
    turret setotherent(player);
    turret setentityowner(player);
    turret setsentryowner(player);
    player disableturretdismount();
    if (!player hasweapon(objweapon)) {
        player _giveweapon(objweapon);
    }
    if (!player iscurrentweapon(objweapon)) {
        player childthread domonitoredweaponswitch(objweapon, 1, 1);
    }
    player controlturreton(turret);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5c4
// Size: 0x17a
function vehicle_occupancy_taketurret(player, vehicle, objweapon, data, var_504fa7a88ba40e41) {
    if (isdefined(data.raceendon)) {
        data endon(data.raceendon);
    }
    if (istrue(var_504fa7a88ba40e41)) {
        childthread vehicle_occupancy_givetaketurrettimeout(data, 1.5);
    }
    player namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("vehicle_turret");
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        player setclientomnvar("ui_br_inventory_disabled", 0);
    }
    player notify("takeTurret");
    if (player hasweapon(objweapon)) {
        result = undefined;
        thread vehicle_occupancy_clearforceweaponswitchallowed(player);
        if (player isswitchingtoweaponwithmonitoring(objweapon)) {
            /#
                assert(player getcurrentweapon().basename != objweapon);
            #/
            player abortmonitoredweaponswitch(makeweapon(objweapon));
            result = 1;
        } else {
            turret = vehicle_getturretbyweapon(vehicle, objweapon);
            if (isdefined(turret)) {
                player controlturretoff(turret);
            }
            if (player hasweapon(objweapon)) {
                var_5cd91bf870c84920 = player iscurrentweapon(objweapon);
                if (var_5cd91bf870c84920) {
                    player _takeweapon(objweapon);
                    player thread forcevalidweapon();
                } else {
                    player thread getridofweapon(objweapon, 1);
                }
            }
            result = 1;
        }
        if (isdefined(result) && !result) {
            data.success = 0;
            data notify(data.raceendnotify);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb745
// Size: 0x31
function vehicle_occupancy_givetaketurrettimeout(data, timeout) {
    wait(timeout);
    data.success = 0;
    data notify(data.raceendnotify);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb77d
// Size: 0x34
function vehicle_occupancy_clearforceweaponswitchallowed(player) {
    player notify("vehicle_occupancy_forceWeaponSwitchAllowed");
    if (player val::get("weapon_switch")) {
        player enableweaponswitch();
    } else {
        player disableweaponswitch();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7b8
// Size: 0xc7
function vehicle_occupancy_ejectalloccupants(vehicle) {
    if (vehicle namespace_1f188a13f7e79610::function_b7148a3bfc4defb2()) {
        return;
    }
    seatids = vehicle_occupancy_getallvehicleseats(vehicle);
    foreach (seatid in seatids) {
        occupant = vehicle_occupancy_getseatoccupant(vehicle, seatid);
        if (isdefined(occupant)) {
            data = spawnstruct();
            data.allowairexit = 1;
            data.exittype = "INVOLUNTARY";
            thread vehicle_occupancy_exit(vehicle, seatid, occupant, data, 1);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb886
// Size: 0xea
function function_7d1a850ac1a81925(vehicle, weapon, spawndata, attachtag, model) {
    turret = spawnturret("misc_turret", vehicle gettagorigin(attachtag), weapon, 0);
    turret linkto(vehicle, attachtag, (0, 0, 0), (0, 0, 0));
    if (isdefined(spawndata.var_14cde247ac3313a4)) {
        model = spawndata.var_14cde247ac3313a4 + "::" + model;
    }
    turret setmodel(model);
    turret setmode("sentry_offline");
    turret setsentryowner(undefined);
    turret makeunusable();
    turret setdefaultdroppitch(0);
    turret setturretmodechangewait(1);
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    return turret;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb978
// Size: 0x8c
function function_d764f933c0054e16(vehicle, weaponname, var_2af302ed18f223d3, firstraisetime) {
    raisetime = 0;
    if (istrue(vehicle.var_ecc491f42aaceaf4)) {
        raisetime = ter_op(isdefined(var_2af302ed18f223d3), var_2af302ed18f223d3, 850);
    } else {
        raisetime = ter_op(isdefined(firstraisetime), firstraisetime, 2200);
    }
    raisetime = max(raisetime, 1);
    level thread vehicle_occupancy_disablefirefortime(self, raisetime);
    thread namespace_1fbd40990ee60ede::vehicle_occupancy_giveturret(self, vehicle, weaponname);
    vehicle.var_ecc491f42aaceaf4 = 1;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xba0b
// Size: 0xa1
function function_99ec1e87f279f082(data, vehicle, weaponname) {
    turret = vehicle_getturretbyweapon(vehicle, weaponname);
    if (!istrue(data.playerdisconnect)) {
        self enableturretdismount();
        self controlturretoff(turret);
        thread vehicle_occupancy_cleardisablefirefortime(self, data.playerdeath);
        if (!istrue(data.playerdeath)) {
            thread vehicle_occupancy_taketurret(self, vehicle, weaponname, data, 1);
        }
    }
    turret.owner = undefined;
    turret setotherent(undefined);
    turret setentityowner(undefined);
    turret setsentryowner(undefined);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbab3
// Size: 0x9b
function vehicle_occupancy_getoccupantrestrictions() {
    allows = [0:"crouch", 1:"prone", 2:"sprint", 3:"mantle", 4:"mount_top", 5:"mount_side", 6:"vehicle_use", 7:"crate_use", 8:"ladder_placement", 9:"execution_attack", 10:"execution_victim", 11:"usability"];
    if (getdvarint(@"hash_6c68604cd07d358", 0) == 1) {
        allows[allows.size] = "offhand_weapons";
    }
    return allows;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb56
// Size: 0x5e
function vehicle_occupancy_getdriverrestrictions() {
    return [0:"usability", 1:"offhand_weapons", 2:"melee", 3:"fire", 4:"reload", 5:"autoreload", 6:"weapon_switch", 7:"cough_gesture", 8:"armor", 9:"killstreaks"];
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbbc
// Size: 0x55
function function_b9cc4ad5c15d3cee() {
    return [0:"usability", 1:"offhand_weapons", 2:"melee", 3:"reload", 4:"autoreload", 5:"weapon_switch", 6:"cough_gesture", 7:"armor", 8:"killstreaks"];
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc19
// Size: 0xd
function vehicle_occupancy_getcombatpassengerrestrictions() {
    return [0:"weapon_pickup"];
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc2e
// Size: 0x15
function vehicle_occupancy_getcombatcabpassengerrestrictions() {
    restrictions = vehicle_occupancy_getcombatpassengerrestrictions();
    return restrictions;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc4b
// Size: 0x9
function vehicle_occupancy_getpassivepassengerrestrictions() {
    return vehicle_occupancy_getdriverrestrictions();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc5c
// Size: 0x43
function vehicle_occupancy_getturretpassengerrestrictions() {
    restrictions = vehicle_occupancy_getcombatpassengerrestrictions();
    restrictions[restrictions.size] = "cough_gesture";
    restrictions[restrictions.size] = "offhand_weapons";
    restrictions[restrictions.size] = "armor";
    restrictions[restrictions.size] = "killstreaks";
    return array_remove_duplicates(restrictions);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbca7
// Size: 0xbf
function vehicle_occupancy_disablefirefortime(player, timems, var_7dfb5b86164129f9) {
    player endon("disconnect");
    player notify("vehicle_occupancy_disableFireForTime");
    player endon("vehicle_occupancy_disableFireForTime");
    if (!istrue(self.vehicledisablefire)) {
        player.vehicledisablefire = 1;
        player val::set("vehicleDisableFire", "fire", 0);
    }
    if (!isdefined(player.vehicledisablefireendtime) || !istrue(var_7dfb5b86164129f9)) {
        player.vehicledisablefireendtime = gettime() + timems;
    }
    while (isdefined(player.vehicledisablefireendtime) && gettime() < player.vehicledisablefireendtime) {
        wait(0.05);
    }
    thread vehicle_occupancy_cleardisablefirefortime(player);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd6d
// Size: 0x53
function vehicle_occupancy_cleardisablefirefortime(player, var_fcef8d217a441961) {
    player notify("vehicle_occupancy_disableFireForTime");
    if (isdefined(player.vehicledisablefire)) {
        if (!istrue(var_fcef8d217a441961)) {
            player val::function_c9d0b43701bdba00("vehicleDisableFire");
        }
    }
    player.vehicledisablefire = undefined;
    player.vehicledisablefireendtime = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc7
// Size: 0x45
function vehicle_occupancy_takeriotshield(player, vehicle, var_7558f98f3236963d) {
    if (issharedfuncdefined("vehicle_occupancy", "takeRiotShield")) {
        [[ getsharedfunc("vehicle_occupancy", "takeRiotShield") ]](player, vehicle, var_7558f98f3236963d);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe13
// Size: 0x45
function vehicle_occupancy_giveriotshield(player, var_fcef8d217a441961, var_8feafcea3627eb2b) {
    if (issharedfuncdefined("vehicle_occupancy", "giveRiotShield")) {
        [[ getsharedfunc("vehicle_occupancy", "giveRiotShield") ]](player, var_fcef8d217a441961, var_8feafcea3627eb2b);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe5f
// Size: 0x45
function vehicle_occupancy_updateriotshield(player, vehicle, var_7558f98f3236963d) {
    if (issharedfuncdefined("vehicle_occupancy", "updateRiotShield")) {
        [[ getsharedfunc("vehicle_occupancy", "updateRiotShield") ]](player, vehicle, var_7558f98f3236963d);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbeab
// Size: 0x4e
function vehicle_occupancy_hidecashbag(vehicle, seatid, player, data) {
    if (issharedfuncdefined("vehicle_occupancy", "hideCashBag")) {
        [[ getsharedfunc("vehicle_occupancy", "hideCashBag") ]](vehicle, seatid, player, data);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf00
// Size: 0x4e
function vehicle_occupancy_showcashbag(vehicle, seatid, player, data) {
    if (issharedfuncdefined("vehicle_occupancy", "showCashBag")) {
        [[ getsharedfunc("vehicle_occupancy", "showCashBag") ]](vehicle, seatid, player, data);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf55
// Size: 0x54
function vehicle_occupancy_registersentient(vehicle) {
    if (isdefined(vehicle.sentientdisabled) && vehicle.sentientdisabled > 0) {
        return;
    }
    if (issharedfuncdefined("vehicle_occupancy", "registerSentient")) {
        [[ getsharedfunc("vehicle_occupancy", "registerSentient") ]](vehicle);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfb0
// Size: 0x33
function vehicle_occupancy_unregistersentient(vehicle) {
    if (issharedfuncdefined("vehicle_occupancy", "unregisterSentient")) {
        [[ getsharedfunc("vehicle_occupancy", "unregisterSentient") ]](vehicle);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbfea
// Size: 0x33
function vehicle_occupancy_issentient(vehicle) {
    if (issharedfuncdefined("vehicle_occupancy", "isSentient")) {
        return [[ getsharedfunc("vehicle_occupancy", "isSentient") ]](vehicle);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc024
// Size: 0x92
function vehicle_occupancy_allowsentient(bool) {
    if (bool) {
        /#
            assert(isdefined(self.sentientdisabled) && self.sentientdisabled > 0, "vehicle_occupancy_allowSentient(true) called more times than vehicle_occupancy_allowSentient(false).");
        #/
        self.sentientdisabled--;
        if (self.sentientdisabled == 0) {
            vehicle_occupancy_registersentient(self);
        }
    } else {
        if (!isdefined(self.sentientdisabled)) {
            self.sentientdisabled = 0;
        }
        self.sentientdisabled++;
        if (self.sentientdisabled == 1) {
            vehicle_occupancy_unregistersentient(self);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0bd
// Size: 0xef
function vehicle_occupancy_linktooriginandangles(vehicle, var_6126d8436c986baf) {
    linktooriginandangles = spawnstruct();
    if (vehicle tagexists(var_6126d8436c986baf)) {
        linktooriginandangles.origin = vehicle gettagorigin(var_6126d8436c986baf);
        linktooriginandangles.angles = vehicle gettagangles(var_6126d8436c986baf);
    } else {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_6126d8436c986baf);
        if (isdefined(var_c50b485a43752fd.animtag)) {
            linktooriginandangles.origin = vehicle gettagorigin(var_c50b485a43752fd.animtag);
            linktooriginandangles.angles = vehicle gettagangles(var_c50b485a43752fd.animtag);
        } else {
            linktooriginandangles.origin = vehicle.origin;
            linktooriginandangles.angles = vehicle.angles;
        }
    }
    return linktooriginandangles;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1b4
// Size: 0x91
function vehicle_occupancy_linkseatcorpse(corpse, vehicle, var_6126d8436c986baf) {
    if (vehicle tagexists(var_6126d8436c986baf)) {
        corpse enablelinkto();
        corpse linkto(vehicle, var_6126d8436c986baf);
    } else {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_6126d8436c986baf);
        if (isdefined(var_c50b485a43752fd.animtag)) {
            corpse enablelinkto();
            corpse linkto(vehicle, var_c50b485a43752fd.animtag);
        } else {
            corpse enablelinkto();
            corpse linkto(vehicle);
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc24c
// Size: 0x86
function vehicle_occupancy_assignseatcorpse(corpse, vehicle, var_6126d8436c986baf, var_f9e25038fed22bf0) {
    /#
        assertex(!istrue(vehicle.isdestroyed), "vehicle_occupancy_assignSeatCorpse cannot be called on destroyed vehicles.");
    #/
    if (!isdefined(vehicle.corpses)) {
        vehicle.corpses = [];
    }
    vehicle_occupancy_deleteseatcorpse(vehicle, var_6126d8436c986baf, 0);
    vehicle.corpses[var_6126d8436c986baf] = corpse;
    if (!var_f9e25038fed22bf0) {
        corpse.dontdeleteonseatenter = 1;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2d9
// Size: 0x55
function vehicle_occupancy_clearseatcorpse(corpse, vehicle, var_6126d8436c986baf) {
    if (isdefined(vehicle.corpses) && isdefined(vehicle.corpses[var_6126d8436c986baf])) {
        vehicle.corpses[var_6126d8436c986baf] = undefined;
    }
    corpse.dontdeleteonseatenter = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc335
// Size: 0x8f
function vehicle_occupancy_deleteseatcorpse(vehicle, var_6126d8436c986baf, var_a710fd9108240c6a) {
    if (isdefined(vehicle.corpses) && isdefined(vehicle.corpses[var_6126d8436c986baf])) {
        corpse = vehicle.corpses[var_6126d8436c986baf];
        if (isdefined(corpse)) {
            if (!istrue(corpse.dontdeleteonseatenter) || !var_a710fd9108240c6a) {
                vehicle.corpses[var_6126d8436c986baf] delete();
                vehicle.corpses[var_6126d8436c986baf] = undefined;
            }
        }
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3cb
// Size: 0x81
function vehicle_occupancy_deleteseatcorpses(vehicle) {
    if (isdefined(vehicle.corpses)) {
        foreach (corpse in vehicle.corpses) {
            if (isdefined(corpse)) {
                corpse delete();
            }
        }
    }
    vehicle.corpses = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc453
// Size: 0xa5
function vehicle_occupancy_allowspawninto(vehicle, bool) {
    if (istrue(vehicle.isdestroyed) || !isdefined(vehicle.occupants)) {
        vehicle.preventspawninto = undefined;
        return;
    }
    if (bool) {
        /#
            assert(isdefined(vehicle.preventspawninto) && vehicle.preventspawninto > 0, "vehicle_occupancy_allowSpawnInto(true) called more times than vehicle_occupancy_allowSpawnInto(false).");
        #/
        vehicle.preventspawninto--;
    } else {
        if (!isdefined(vehicle.preventspawninto)) {
            vehicle.preventspawninto = 0;
        }
        vehicle.preventspawninto++;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4ff
// Size: 0x51
function vehicle_occupancy_canspawninto(vehicle) {
    if (istrue(vehicle.isdestroyed) || !isdefined(vehicle.occupants)) {
        return 0;
    }
    if (isdefined(vehicle.preventspawninto) && vehicle.preventspawninto > 0) {
        return 0;
    }
    return 1;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc558
// Size: 0x8b
function vehicle_occupancy_generateseatswitcharray(seatid, var_ea452afa253f8034) {
    /#
        assertex(array_contains(var_ea452afa253f8034, seatid), "seatIDArr must contain seatID.");
    #/
    var_d6d7814802640f93 = [];
    var_866452ade4626d3f = 0;
    for (i = 0; 1; i++) {
        if (!var_866452ade4626d3f) {
            if (seatid == var_ea452afa253f8034[i]) {
                var_866452ade4626d3f = 1;
            }
        } else {
            i = mod(i, var_ea452afa253f8034.size);
            if (seatid == var_ea452afa253f8034[i]) {
                break;
            }
            var_d6d7814802640f93[var_d6d7814802640f93.size] = var_ea452afa253f8034[i];
        }
    }
    return var_d6d7814802640f93;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5eb
// Size: 0x325
function vehicle_occupancy_killoccupants(vehicle, damagedata, var_29187ec6e45d7481) {
    seatids = vehicle_occupancy_getallvehicleseats(self);
    if (!isdefined(seatids)) {
        return;
    }
    if (!isdefined(damagedata.inflictor)) {
        switch (damagedata.meansofdeath) {
        case #"hash_3c20f39c73a1422b":
        case #"hash_571e46e17a3cf2e3":
        case #"hash_66cb246f3e55fbe2":
        case #"hash_c22b13f81bed11f0":
            if (isdefined(vehicle.killcament)) {
                vehicle.killcament delete();
            }
            vehicle.killcament = damagedata.inflictor;
            damagedata.inflictor = vehicle;
            break;
        }
    }
    if (!isdefined(damagedata.inflictor)) {
        damagedata.inflictor = undefined;
    }
    meansofdeath = damagedata.meansofdeath;
    if (meansofdeath == "MOD_PROJECTILE") {
        meansofdeath = "MOD_PROJECTILE_SPLASH";
    } else if (meansofdeath == "MOD_GRENADE") {
        meansofdeath = "MOD_GRENADE_SPLASH";
    }
    foreach (seatid in seatids) {
        occupant = vehicle_occupancy_getseatoccupant(self, seatid);
        if (isdefined(occupant)) {
            var_a0a415f8f5db022 = damagedata.attacker;
            if (utility::iscp()) {
                occupant.shouldskipdeathsshield = 1;
                if (!isdefined(var_a0a415f8f5db022)) {
                    if (isdefined(damagedata.inflictor)) {
                        var_a0a415f8f5db022 = damagedata.inflictor;
                    }
                }
                if (!isdefined(var_a0a415f8f5db022)) {
                    var_a0a415f8f5db022 = occupant;
                }
                if (isdefined(var_a0a415f8f5db022) && isdefined(var_a0a415f8f5db022.team)) {
                    if (var_a0a415f8f5db022.team == occupant.team) {
                        vehicle_occupancy_exit(self, seatid, occupant, undefined, 1);
                        occupant.skipvehiclespashdamage = 1;
                        continue;
                    }
                }
            } else if (!isdefined(var_a0a415f8f5db022) || !playersareenemies(var_a0a415f8f5db022, occupant)) {
                var_a0a415f8f5db022 = occupant;
            }
            occupant.donotmodifydamage = 1;
            var_ab7b2b4764cff0f5 = 0;
            if (namespace_36f464722d326bbe::isbrstylegametype() && istrue(occupant.isjuggernaut)) {
                if (isdefined(occupant.juggcontext.juggconfig.vehiclecankillhealth) && occupant.health > occupant.juggcontext.juggconfig.vehiclecankillhealth) {
                    var_ab7b2b4764cff0f5 = 1;
                }
            }
            if (!istrue(var_ab7b2b4764cff0f5) && occupant _isalive()) {
                occupant thread function_2700ef822671144a(vehicle, var_a0a415f8f5db022, damagedata, meansofdeath);
                if (isdefined(level.vehicleoccupantdeathcustomcallback)) {
                    occupant thread [[ level.vehicleoccupantdeathcustomcallback ]]();
                }
            }
            occupant.donotmodifydamage = undefined;
            thread vehicle_occupancy_exit(vehicle, seatid, occupant, var_29187ec6e45d7481, 1);
        }
    }
    vehicle_occupancy_deleteseatcorpses(vehicle);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc917
// Size: 0x8f
function private function_e462819da430ac92(vehicle) {
    if (!vehicle getscriptablehaspart("stability")) {
        return;
    }
    occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(vehicle);
    var_1d3b3a7f125be55e = namespace_3c37cb17ade254d::mph_to_ips(abs(vehicle vehicle_getspeed()));
    if (occupants.size > 0) {
        vehicle utility::function_3677f2be30fdd581("stability", "stable");
    } else if (occupants.size == 0 && var_1d3b3a7f125be55e > vehicle.var_c335ed10c38975e) {
        vehicle utility::function_3677f2be30fdd581("stability", "unstable");
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc9ad
// Size: 0xf1
function private function_2700ef822671144a(vehicle, var_a0a415f8f5db022, damagedata, meansofdeath) {
    self endon("death_or_disconnect");
    origin = vehicle.origin;
    while (self function_793f941d7dff15ed()) {
        waitframe();
    }
    attacker = damagedata.attacker;
    inflictor = damagedata.inflictor;
    if (!isdefined(attacker)) {
        attacker = ter_op(isdefined(self.var_9328ded553f15d2b) && istrue(namespace_f8065cafc523dba5::playersareenemies(self, self.var_9328ded553f15d2b)), self.var_9328ded553f15d2b, self);
    }
    if (!isdefined(attacker)) {
        if (isdefined(vehicle)) {
            attacker = vehicle;
        } else {
            attacker = self;
        }
    }
    if (!isdefined(inflictor)) {
        inflictor = self;
    }
    self dodamage(self.maxhealth, origin, attacker, inflictor, meansofdeath, damagedata.objweapon, "torso_upper");
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaa5
// Size: 0x39f
function function_34d70aa8129b0d74() {
    self endon("death");
    ref = function_d93ec4635290febd();
    onstartriding = getsharedfunc(ref, "onStartRiding");
    onendriding = getsharedfunc(ref, "onEndRiding");
    isininterior = getsharedfunc(ref, "isInInterior");
    onenterinterior = getsharedfunc(ref, "onEnterInterior");
    onexitinterior = getsharedfunc(ref, "onExitInterior");
    var_b4525aa23067a8df = isdefined(isininterior);
    self.var_8784c427b1af24a6 = [];
    var_a92d51fdc6322f7e = self vehicle_isonground();
    while (1) {
        onground = self vehicle_isonground();
        var_94f44a9bf5737c52 = [];
        foreach (player in utility::playersnear(self.origin, 550)) {
            if (isdefined(player) && player _isalive() && isdefined(player.guid) && !player function_793f941d7dff15ed() && function_f5174ac9916fe7a6(player, self) && (!function_997f45f1e19b9dc9(player.origin) || player function_415fe9eeca7b2e2b() || player ismantling())) {
                var_94f44a9bf5737c52[player.guid] = 1;
                if (!isdefined(self.var_8784c427b1af24a6[player.guid])) {
                    self.var_8784c427b1af24a6[player.guid] = player;
                    [[ onstartriding ]](player);
                    if (!onground) {
                        player vehicle_occupancy_startmovefeedbackforplayer();
                    }
                }
                if (var_b4525aa23067a8df) {
                    var_fec74450fbdbbe32 = [[ isininterior ]](player);
                    if (!istrue(player.var_1ecb70862bb22bb) && var_fec74450fbdbbe32) {
                        [[ onenterinterior ]](player);
                    } else if (istrue(player.var_1ecb70862bb22bb) && !var_fec74450fbdbbe32) {
                        [[ onexitinterior ]](player);
                    }
                    player.var_1ecb70862bb22bb = var_fec74450fbdbbe32;
                }
            }
        }
        foreach (guid, player in self.var_8784c427b1af24a6) {
            if (!istrue(var_94f44a9bf5737c52[guid])) {
                self.var_8784c427b1af24a6[guid] = undefined;
                [[ onendriding ]](player);
                if (isdefined(player)) {
                    player vehicle_occupancy_stopmovefeedbackforplayer();
                }
                if (var_b4525aa23067a8df) {
                    if (istrue(player.var_1ecb70862bb22bb)) {
                        [[ onexitinterior ]](player);
                    }
                    if (isdefined(player)) {
                        player.var_1ecb70862bb22bb = undefined;
                    }
                }
            }
        }
        if (onground != var_a92d51fdc6322f7e) {
            if (!onground) {
                foreach (player in self.var_8784c427b1af24a6) {
                    player vehicle_occupancy_startmovefeedbackforplayer();
                }
            } else {
                foreach (player in self.var_8784c427b1af24a6) {
                    player vehicle_occupancy_stopmovefeedbackforplayer();
                }
            }
        }
        var_a92d51fdc6322f7e = onground;
        wait(0.25);
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce4b
// Size: 0x86
function function_f5174ac9916fe7a6(player, var_888761054df5b48c) {
    if (isdefined(var_888761054df5b48c) && var_888761054df5b48c namespace_1f188a13f7e79610::isvehicle()) {
        var_aa72d15f98b9b21f = function_2e8745a2d6ec9fd1(player);
        if (isdefined(var_aa72d15f98b9b21f) && var_aa72d15f98b9b21f == var_888761054df5b48c) {
            return 1;
        }
    }
    var_e807d5178fb91a4f = player getmovingplatformparent();
    if (isdefined(var_888761054df5b48c) && isdefined(var_888761054df5b48c.var_d017de0e75c72d87) && isdefined(var_e807d5178fb91a4f) && var_e807d5178fb91a4f == var_888761054df5b48c.var_d017de0e75c72d87) {
        return 1;
    }
    return 0;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xced9
// Size: 0x8e
function function_2e8745a2d6ec9fd1(player) {
    if (!isdefined(player)) {
        return undefined;
    }
    var_888761054df5b48c = player getmovingplatformparent();
    if (isdefined(var_888761054df5b48c) && istrue(var_888761054df5b48c.var_102945aa439b7b3d)) {
        var_888761054df5b48c = undefined;
    }
    if (!isdefined(var_888761054df5b48c)) {
        var_888761054df5b48c = player getgroundentity();
        if (isdefined(var_888761054df5b48c) && !istrue(var_888761054df5b48c.var_102945aa439b7b3d)) {
            var_888761054df5b48c = undefined;
        }
    }
    var_5c7e5fe501d37e4a = function_b381868642836183(player);
    if (isdefined(var_5c7e5fe501d37e4a)) {
        var_888761054df5b48c = var_5c7e5fe501d37e4a;
    }
    if (isdefined(var_888761054df5b48c) && !var_888761054df5b48c namespace_1f188a13f7e79610::isvehicle()) {
        return undefined;
    }
    return var_888761054df5b48c;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf6f
// Size: 0x40
function function_3dfe65e73a7d0c86(player, vehicle) {
    if (!isdefined(player)) {
        return;
    }
    if (isdefined(vehicle) && vehicle namespace_1f188a13f7e79610::isvehicle()) {
        player.var_8d553bc2f713d356 = vehicle;
        player thread function_7f56221b97c7a6c0();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcfb6
// Size: 0x2a
function private function_7f56221b97c7a6c0() {
    self endon("disconnect");
    self endon("disabled_force_ride");
    level endon("game_ended");
    self waittill("death");
    self.var_8d553bc2f713d356 = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfe7
// Size: 0x6c
function function_69f266af27c2689(player, vehicle) {
    if (!isdefined(player)) {
        return;
    }
    if (isdefined(vehicle) && vehicle namespace_1f188a13f7e79610::isvehicle()) {
        if (isreallyalive(player)) {
            player dontinterpolate();
            player function_a055801da45d769(player.origin, vehicle);
            player notify("disabled_force_ride");
            player thread vehicle_preventplayercollisiondamagefortimeafterexit(vehicle, player);
        }
    }
    player.var_8d553bc2f713d356 = undefined;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd05a
// Size: 0x1e
function function_b381868642836183(player) {
    if (!isdefined(player)) {
        return undefined;
    }
    return player.var_8d553bc2f713d356;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd080
// Size: 0xd
function function_d419e441d20e67ac() {
    return isdefined(self.var_5be007b73e4fce3f);
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd095
// Size: 0x56
function function_7c81e0d41cbbce7f() {
    if (!isdefined(self.var_5be007b73e4fce3f)) {
        /#
            assertmsg(isdefined(self.var_5be007b73e4fce3f), "vehicle_occupancy_enableEngine: Enabled the engine more times than it was disabled");
        #/
        return;
    }
    self.var_5be007b73e4fce3f = self.var_5be007b73e4fce3f - 1;
    if (self.var_5be007b73e4fce3f <= 0) {
        self.var_5be007b73e4fce3f = undefined;
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0f2
// Size: 0x36
function function_d0092c44c5588870() {
    if (!isdefined(self.var_5be007b73e4fce3f)) {
        self.var_5be007b73e4fce3f = 0;
    }
    self.var_5be007b73e4fce3f = self.var_5be007b73e4fce3f + 1;
    function_887b4e2cbe3ab92c();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12f
// Size: 0x1a
function function_9e710c9f3a15ffda() {
    if (!function_d419e441d20e67ac()) {
        self vehicle_turnengineon();
        function_c01316c733e017b7();
    }
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd150
// Size: 0x11
function function_887b4e2cbe3ab92c() {
    self vehicle_turnengineoff();
    function_49eff91715ae3c1b();
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd168
// Size: 0xf0
function function_4e4cf75e0f7e4184(point) {
    if (!function_a24042975031e692()) {
        return 0;
    }
    var_ea3b9640a6ad3c8e = coordtransformtranspose(point, self.origin, self.angles);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
    return var_ea3b9640a6ad3c8e[0] > var_e2818ad39a3341b4.exitextents["back"] * -1 && var_ea3b9640a6ad3c8e[0] < var_e2818ad39a3341b4.exitextents["front"] && var_ea3b9640a6ad3c8e[1] > var_e2818ad39a3341b4.exitextents["left"] * -1 && var_ea3b9640a6ad3c8e[1] < var_e2818ad39a3341b4.exitextents["right"] && var_ea3b9640a6ad3c8e[2] > var_e2818ad39a3341b4.exitextents["bottom"] * -1 && var_ea3b9640a6ad3c8e[2] < var_e2818ad39a3341b4.exitextents["top"];
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd260
// Size: 0x6a
function function_997f45f1e19b9dc9(point) {
    if (!function_a24042975031e692()) {
        return 0;
    }
    var_ea3b9640a6ad3c8e = coordtransformtranspose(point, self.origin, self.angles);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
    return var_ea3b9640a6ad3c8e[2] < var_e2818ad39a3341b4.exitextents["bottom"] * -1;
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2d2
// Size: 0x2c
function vehicle_occupancy_initdebug() {
    leveldata = vehicle_occupancy_getleveldata();
    leveldata.debuginstances = [];
    /#
        thread function_866e78f157c1f5f3();
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd305
// Size: 0x311
function function_866e78f157c1f5f3() {
    /#
        leveldata = vehicle_occupancy_getleveldata();
        wait(5);
        setdevdvarifuninitialized(@"hash_2de891db9eeac685", 0);
        setdevdvarifuninitialized(@"hash_6c296dda80496851", 0);
        setdevdvarifuninitialized(@"hash_fdf60fe90077b559", 0);
        setdevdvarifuninitialized(@"hash_a864c803709b59ce", 0);
        while (1) {
            if (getdvarint(@"hash_5dd683c4da86681e", 0) > 0) {
                level.var_8962097bbd2afcb4 = 1;
            } else {
                level.var_8962097bbd2afcb4 = undefined;
            }
            foreach (vehicle in leveldata.debuginstances) {
                if (!isdefined(vehicle)) {
                    continue;
                }
                if (istrue(level.var_8962097bbd2afcb4)) {
                    exitboundinginfo = function_517f60905f08bf96(vehicle);
                }
            }
            host = undefined;
            if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                host = [[ getsharedfunc("<unknown string>", "<unknown string>") ]]();
            }
            if (isdefined(host)) {
                function_511060fa3b5d7a06(host);
            }
            if (getdvarint(@"hash_fdf60fe90077b559", 0) == 1) {
                setdvar(@"hash_fdf60fe90077b559", 0);
                if (isdefined(level.var_284e0857e1020bee) && (isdefined(level.var_e73071e66cd54b2f) || isdefined(level.var_a351483d3a2379ae))) {
                    bot = ter_op(isdefined(level.var_e73071e66cd54b2f), level.var_e73071e66cd54b2f, level.var_a351483d3a2379ae);
                    bot botpressbutton("<unknown string>");
                }
            }
            if (getdvarint(@"hash_a864c803709b59ce", 0) == 1) {
                setdvar(@"hash_a864c803709b59ce", 0);
                if (isdefined(level.var_284e0857e1020bee) && (isdefined(level.var_e73071e66cd54b2f) || isdefined(level.var_a351483d3a2379ae))) {
                    bot = ter_op(isdefined(level.var_e73071e66cd54b2f), level.var_e73071e66cd54b2f, level.var_a351483d3a2379ae);
                    bot botpressbutton("<unknown string>");
                }
            }
            if (getdvarint(@"hash_6c296dda80496851", 0) == 1) {
                setdvar(@"hash_6c296dda80496851", 0);
                if (isdefined(level.var_284e0857e1020bee) && (isdefined(level.var_e73071e66cd54b2f) || isdefined(level.var_a351483d3a2379ae))) {
                    bot = ter_op(isdefined(level.var_e73071e66cd54b2f), level.var_e73071e66cd54b2f, level.var_a351483d3a2379ae);
                    seatid = vehicle_occupancy_getoccupantseat(level.var_284e0857e1020bee, bot);
                    if (isdefined(seatid)) {
                        var_c0125690bc99343d = vehicle_occupancy_getnextavailableseat(level.var_284e0857e1020bee, bot, seatid);
                        if (isdefined(var_c0125690bc99343d)) {
                            vehicle_occupancy_enter(level.var_284e0857e1020bee, var_c0125690bc99343d, bot);
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd61d
// Size: 0x153
function function_6bdf9766fe9e319(var_67154c851970b6f1) {
    /#
        thread namespace_f2ffc0540883e1ad::drawboxfrompoints(var_67154c851970b6f1.orientedboxpoints["<unknown string>"], var_67154c851970b6f1.orientedboxpoints["<unknown string>"], var_67154c851970b6f1.orientedboxpoints["<unknown string>"], var_67154c851970b6f1.orientedboxpoints["<unknown string>"], var_67154c851970b6f1.orientedboxpoints["<unknown string>"], var_67154c851970b6f1.orientedboxpoints["<unknown string>"], var_67154c851970b6f1.orientedboxpoints["<unknown string>"], var_67154c851970b6f1.orientedboxpoints["<unknown string>"], 0.05, (1, 1, 1));
        thread namespace_f2ffc0540883e1ad::drawboxfrompoints(var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], var_67154c851970b6f1.unorientedboxpoints["<unknown string>"], 0.05, (1, 1, 0));
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd777
// Size: 0xe
function function_d3f0b37c88e04e33() {
    /#
        level notify("<unknown string>");
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd78c
// Size: 0x3b
function function_a03a1d77df140f9c(start, end, var_7cadcf765f48d20b, color) {
    /#
        level endon("<unknown string>");
        level childthread namespace_f2ffc0540883e1ad::drawline(start, end, var_7cadcf765f48d20b, color);
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd7ce
// Size: 0x3b
function function_2127168686332a93(origin, radius, var_7cadcf765f48d20b, color) {
    /#
        level endon("<unknown string>");
        level childthread namespace_f2ffc0540883e1ad::drawsphere(origin, radius, var_7cadcf765f48d20b, color);
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xd810
// Size: 0xa6
function function_dafe9f7ddcab9bf1(pos, radius, height, angles, color, depthtest, duration) {
    /#
        level endon("<unknown string>");
        var_f8a269392b9c9b15 = int(ceil(0.05 / level.framedurationseconds));
        endtime = gettime() + duration * 1000;
        while (gettime() < endtime) {
            level childthread namespace_3c37cb17ade254d::draw_capsule(pos, radius, height, angles, color, depthtest, var_f8a269392b9c9b15);
            wait(0.05);
        }
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xd8bd
// Size: 0xe3
function function_6bb041ee1ab70e18(origin, var_2ca0d3fe4d5e6583, radius, var_7cadcf765f48d20b, color) {
    /#
        level endon("<unknown string>");
        level childthread namespace_f2ffc0540883e1ad::drawsphere(origin, radius, var_7cadcf765f48d20b, color);
        level childthread namespace_f2ffc0540883e1ad::drawsphere(var_2ca0d3fe4d5e6583, radius, var_7cadcf765f48d20b, color);
        foreach (offset in [0:(radius, 0, 0), 1:(-1 * radius, 0, 0), 2:(0, radius, 0), 3:(0, -1 * radius, 0), 4:(0, 0, radius), 5:(0, 0, -1 * radius)]) {
            level childthread namespace_f2ffc0540883e1ad::drawline(origin + offset, var_2ca0d3fe4d5e6583 + offset, var_7cadcf765f48d20b, color);
        }
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a7
// Size: 0x2ea
function function_511060fa3b5d7a06(host) {
    /#
        var_30e826b2ccb3e4c0 = 0;
        var_96b6d8801043dfd5 = getdvarint(@"hash_2de891db9eeac685", 0);
        bot = undefined;
        if (!isdefined(level.var_284e0857e1020bee) || istrue(level.var_284e0857e1020bee.isdestroyed)) {
            level.var_284e0857e1020bee = undefined;
        }
        if (var_96b6d8801043dfd5 == 0) {
            return;
        }
        if (isdefined(level.var_284e0857e1020bee)) {
            switch (var_96b6d8801043dfd5) {
            case 1:
                setdevdvar(@"hash_2de891db9eeac685", 0);
                bot = level.var_e73071e66cd54b2f;
                if (isdefined(bot) && !playersareenemies(bot, host)) {
                    if (isdefined(level.var_284e0857e1020bee)) {
                        var_284e0857e1020bee = bot getvehicle();
                        if (isdefined(var_284e0857e1020bee)) {
                            if (var_284e0857e1020bee == level.var_284e0857e1020bee) {
                                var_30e826b2ccb3e4c0 = 1;
                                break;
                            } else {
                                bot = undefined;
                            }
                        }
                    }
                }
                if (!isdefined(bot)) {
                    players = getfriendlyplayers(host.team, 1);
                    foreach (player in players) {
                        if (!isbot(player)) {
                            continue;
                        }
                        bot = player;
                        break;
                    }
                }
                level.var_e73071e66cd54b2f = bot;
                break;
            case 2:
                setdevdvar(@"hash_2de891db9eeac685", 0);
                bot = level.var_a351483d3a2379ae;
                if (isdefined(bot) && playersareenemies(bot, host)) {
                    if (isdefined(level.var_284e0857e1020bee)) {
                        var_284e0857e1020bee = bot getvehicle();
                        if (isdefined(var_284e0857e1020bee)) {
                            if (var_284e0857e1020bee == level.var_284e0857e1020bee) {
                                var_30e826b2ccb3e4c0 = 1;
                                break;
                            } else {
                                bot = undefined;
                            }
                        }
                    }
                }
                if (!isdefined(bot)) {
                    players = getenemyplayers(host.team, 1);
                    foreach (player in players) {
                        if (!isbot(player)) {
                            continue;
                        }
                        bot = player;
                        break;
                    }
                }
                level.var_a351483d3a2379ae = bot;
                break;
            default:
                return;
            }
            if (isdefined(bot)) {
                if (var_30e826b2ccb3e4c0) {
                    function_80491ae71b928cfa(bot);
                } else {
                    function_5993e49922687515(host, bot);
                }
            } else if (var_96b6d8801043dfd5 != 0) {
                iprintln("<unknown string>");
            }
        } else if (var_96b6d8801043dfd5 != 0) {
            iprintln("<unknown string>");
        }
        setdevdvar(@"hash_2de891db9eeac685", 0);
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdc98
// Size: 0xe5
function function_5993e49922687515(host, bot) {
    /#
        if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
            host = [[ getsharedfunc("<unknown string>", "<unknown string>") ]]();
        }
        if (!isdefined(host)) {
            return 0;
        }
        vehicle = level.var_284e0857e1020bee;
        if (!isdefined(vehicle) || istrue(vehicle.isdestroyed)) {
            iprintln("<unknown string>");
            return 0;
        }
        occupants = vehicle_occupancy_getalloccupantsandreserving(vehicle);
        var_956fb5b2625f7cf9 = host getvehicle();
        if (vehicle_isenemytoplayer(vehicle, bot)) {
            if (occupants.size > 1) {
                iprintln("<unknown string>");
                return 0;
            } else if (isdefined(var_956fb5b2625f7cf9) && var_956fb5b2625f7cf9 == vehicle) {
                return function_62e42dbf117640e5(vehicle, bot, host);
            }
        } else {
            return function_40c538fb1bd10587(vehicle, bot);
        }
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdd84
// Size: 0xbf
function function_62e42dbf117640e5(vehicle, bot, host) {
    /#
        vehicle_interact_allowvehicleuse(vehicle, 0);
        thread vehicle_occupancy_ejectalloccupants(vehicle);
        while (1) {
            if (!isdefined(host)) {
                break;
            }
            if (!isdefined(bot)) {
                break;
            }
            if (!isdefined(vehicle)) {
                break;
            }
            var_956fb5b2625f7cf9 = host getvehicle();
            if (!isdefined(var_956fb5b2625f7cf9) || var_956fb5b2625f7cf9 != vehicle) {
                break;
            }
            waitframe();
        }
        if (!isdefined(vehicle) || istrue(vehicle.isdestroyed)) {
            iprintln("<unknown string>");
            return 0;
        } else {
            vehicle_interact_allowvehicleuse(vehicle, 1);
        }
        if (!isdefined(bot)) {
            iprintln("<unknown string>");
            return 0;
        }
        return function_40c538fb1bd10587(vehicle, bot);
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xde4a
// Size: 0x8d
function function_80491ae71b928cfa(bot) {
    /#
        vehicle = level.var_284e0857e1020bee;
        if (!isdefined(vehicle) || istrue(vehicle.isdestroyed)) {
            iprintln("<unknown string>");
            return 0;
        }
        seatid = vehicle_occupancy_getoccupantseat(vehicle, bot);
        var_c0125690bc99343d = vehicle_occupancy_getnextavailableseat(vehicle, bot, seatid);
        if (!isdefined(var_c0125690bc99343d)) {
            iprintln("<unknown string>");
            return 0;
        }
        thread vehicle_occupancy_enter(vehicle, var_c0125690bc99343d, bot);
        return 1;
    #/
}

// Namespace vehicle_occupancy/namespace_1fbd40990ee60ede
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdede
// Size: 0xbb
function function_40c538fb1bd10587(vehicle, bot) {
    /#
        var_70533a0a3679476b = function_c2f090b27fcd0e43(vehicle);
        state = function_d66fa700ce5b783();
        foreach (part in var_70533a0a3679476b) {
            if (isdefined(bot getvehicle())) {
                break;
            }
            vehicle_interact_scriptableused(vehicle getlinkedscriptableinstance(), part, state, bot, 0);
        }
        if (!isdefined(bot getvehicle())) {
            iprintln("<unknown string>");
            return 0;
        }
        return 1;
    #/
}

