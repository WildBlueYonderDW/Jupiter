#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x130c
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x14a9
// Size: 0x42
function private function_c9b87beb89ec12e2(player, vehicle, exitvehicle) {
    if (isdefined(player)) {
        if (player function_793f941d7dff15ed()) {
            player leavevehicle(0, exitvehicle);
        }
        assert(!player function_793f941d7dff15ed());
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14f3
// Size: 0x2e
function vehicle_occupancy_getleveldataforseat(vehiclename, seatid, create) {
    return vehicle_occupancy_getleveldataforvehicle(vehiclename).seatdata[seatid];
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x152a
// Size: 0xaa
function vehicle_occupancy_registerinstance(vehicle) {
    vehicle.occupants = [];
    vehicle.occupantsreserving = [];
    vehicle.isempty = 1;
    /#
        leveldata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldata();
        leveldata.debuginstances = array_removeundefined(leveldata.debuginstances);
        leveldata.debuginstances = array_add(leveldata.debuginstances, vehicle);
    #/
    if (issharedfuncdefined("vehicle_occupancy", "registerInstance")) {
        [[ getsharedfunc("vehicle_occupancy", "registerInstance") ]](vehicle);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15dc
// Size: 0x5e
function vehicle_occupancy_deregisterinstance(vehicle) {
    vehicle.occupants = undefined;
    vehicle.occupantsreserving = undefined;
    vehicle.isempty = undefined;
    vehicle.preventspawninto = undefined;
    if (issharedfuncdefined("vehicle_occupancy", "deregisterInstance")) {
        [[ getsharedfunc("vehicle_occupancy", "deregisterInstance") ]](vehicle);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1642
// Size: 0x17
function vehicle_occupancy_instanceisregistered(vehicle) {
    return isdefined(vehicle.occupants);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1662
// Size: 0xa6
function vehicle_occupancy_getallvehicleseats(vehicle, var_6be731ec00f344cb) {
    assertex(isdefined(vehicle.vehiclename), "<dev string:x1c>");
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    assertex(!var_6be731ec00f344cb || isdefined(var_e2818ad39a3341b4), "<dev string:x65>" + vehicle.vehiclename + "<dev string:x93>");
    if (isdefined(var_e2818ad39a3341b4) && isdefined(var_e2818ad39a3341b4.seatdata)) {
        return getarraykeys(var_e2818ad39a3341b4.seatdata);
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1710
// Size: 0x80
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1799
// Size: 0x155
function function_d3d95972f58ad2bc(vehicle) {
    var_109a35ef4925c2b1 = vehicle_occupancy_getavailablevehicleseats(vehicle);
    if (!isdefined(var_109a35ef4925c2b1) || var_109a35ef4925c2b1.size <= 0) {
        return undefined;
    } else if (var_109a35ef4925c2b1.size == 1) {
        return var_109a35ef4925c2b1[0];
    }
    bestseat = var_109a35ef4925c2b1[0];
    bestpriority = -1;
    var_e1a1a4f1ce293589 = vehicle_interact_getleveldataforvehicle(vehicle.vehiclename).var_9d0537be150542b3;
    assertex(isdefined(var_e1a1a4f1ce293589), "<dev string:xdb>");
    foreach (seatid in var_109a35ef4925c2b1) {
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
        spawnpriority = var_c50b485a43752fd.spawnpriority;
        seatorder = array_find(var_e1a1a4f1ce293589, seatid);
        if (!isdefined(spawnpriority) && isdefined(seatorder)) {
            spawnpriority = var_e1a1a4f1ce293589.size - seatorder;
        } else if (!isdefined(spawnpriority)) {
            spawnpriority = 0;
        } else {
            spawnpriority = int(max(0, spawnpriority));
        }
        if (spawnpriority > bestpriority) {
            bestseat = seatid;
            bestpriority = spawnpriority;
        }
    }
    return bestseat;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18f7
// Size: 0xa8
function vehicle_occupancy_seatisavailable(vehicle, seatid, player) {
    assertex(isdefined(vehicle.occupants) && isdefined(vehicle.occupantsreserving), "<dev string:x102>");
    occupant = vehicle.occupants[seatid];
    var_5dc30f34f408331d = vehicle.occupantsreserving[seatid];
    if (!isdefined(occupant) && !isdefined(var_5dc30f34f408331d)) {
        return true;
    }
    if (isdefined(player)) {
        if (isdefined(occupant) && occupant == player) {
            return true;
        }
        if (isdefined(var_5dc30f34f408331d) && var_5dc30f34f408331d == player) {
            return true;
        }
    }
    return false;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19a8
// Size: 0x66
function vehicle_occupancy_getseatoccupant(vehicle, seatid, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "<dev string:x16b>");
    if (isdefined(vehicle.occupants)) {
        return vehicle.occupants[seatid];
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a16
// Size: 0x47
function vehicle_occupancy_getalloccupants(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "<dev string:x16b>");
    return vehicle.occupants;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a66
// Size: 0x9a
function function_efa75aa7f0a1289(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "<dev string:x16b>");
    occupants = vehicle.occupants;
    if (isdefined(vehicle.ridingplayers)) {
        occupants = array_combine_unique(occupants, vehicle.ridingplayers);
    }
    if (isdefined(vehicle.turretoccupants)) {
        occupants = array_combine_unique(occupants, vehicle.turretoccupants);
    }
    return occupants;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b09
// Size: 0x69
function vehicle_occupancy_getalloccupantsandreserving(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "<dev string:x16b>");
    if (!isdefined(vehicle.occupants)) {
        return undefined;
    }
    return array_combine_unique(vehicle.occupants, vehicle.occupantsreserving);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7b
// Size: 0x58
function vehicle_occupancy_getreserving(vehicle, var_6be731ec00f344cb) {
    if (!isdefined(var_6be731ec00f344cb)) {
        var_6be731ec00f344cb = 1;
    }
    assertex(!var_6be731ec00f344cb || isdefined(vehicle.occupants), "<dev string:x16b>");
    if (!isdefined(vehicle.occupants)) {
        return undefined;
    }
    return vehicle.occupantsreserving;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bdc
// Size: 0x84
function vehicle_occupancy_getoccupantseat(vehicle, player) {
    assertex(isdefined(vehicle.occupants), "<dev string:x16b>");
    foreach (seatid, occupant in vehicle.occupants) {
        if (occupant == player) {
            return seatid;
        }
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c69
// Size: 0x95
function vehicle_occupancy_occupantisvehicledriver(player) {
    if (isdefined(player.vehicle)) {
        seatid = vehicle_occupancy_getoccupantseat(player.vehicle, player);
        var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(player.vehicle.vehiclename, seatid);
        if (isdefined(var_c50b485a43752fd.animtag)) {
            seattag = tolower(var_c50b485a43752fd.animtag);
            if (seattag == "tag_seat_0") {
                return true;
            }
        }
    }
    return false;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d07
// Size: 0x39
function vehicle_occupancy_getdriver(vehicle, var_6ecb77fd1f27c667) {
    driverseatid = vehicle_occupancy_getdriverseat(vehicle, var_6ecb77fd1f27c667);
    if (isdefined(driverseatid)) {
        return vehicle_occupancy_getseatoccupant(vehicle, driverseatid, !istrue(var_6ecb77fd1f27c667));
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d49
// Size: 0xec
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3e
// Size: 0x5f
function vehicle_occupancy_isdriverseat(vehicle, seatid) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (!isdefined(var_c50b485a43752fd.animtag)) {
        return false;
    }
    if (tolower(var_c50b485a43752fd.animtag) != "tag_seat_0") {
        return false;
    }
    return true;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea6
// Size: 0x661
function vehicle_occupancy_enter(vehicle, seatid, player, data, immediate) {
    assertex(isdefined(vehicle.vehiclename), "<dev string:x1d8>");
    assertex(isdefined(vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename)), "<dev string:x65>" + vehicle.vehiclename + "<dev string:x223>");
    assertex(isdefined(vehicle.occupants) && isdefined(vehicle.occupantsreserving), "<dev string:x262>");
    assertex(!isdefined(data) || !isdefined(data.success), "<dev string:x2c3>");
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
        if (!scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_instanceisregistered(vehicle)) {
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
            params = {#seatid:seatid, #player:player, #var_fc7c7a874b43a31a:var_fc7c7a874b43a31a, #vehicle:vehicle};
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
                        if (isdefined(player.vehiclecustomization.horns[vehicleref])) {
                            vehicle setvehiclehornsound(player.vehiclecustomization.horns[vehicleref]);
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
                entertype = "ENTERED_VEHICLE";
                if (issharedfuncdefined("pmc_missions", "onVehicleEnter")) {
                    [[ getsharedfunc("pmc_missions", "onVehicleEnter") ]](player, vehicle);
                }
                player scripts\cp_mp\challenges::function_5c3aa65db46763ff(vehicle, "enter_vehicle");
            } else {
                entertype = "SEAT_SWITCH";
            }
            scripts\cp_mp\vehicles\customization\battle_tracks::battle_tracks_vehicleoccupancyenter(vehicle, player, seatid, var_fc7c7a874b43a31a);
            vehicle_dlog_enterevent(vehicle, player, seatid, entertype);
        } else if (isdefined(var_fc7c7a874b43a31a) && !istrue(data.vehicledeath)) {
            if (istrue(data.playerdeath) || istrue(data.playerlaststand) || istrue(data.playerdisconnect)) {
                _data = spawnstruct();
                _data.playerdeath = data.playerdeath;
                _data.playerlaststand = data.playerlaststand;
                _data.var_d4b9aa76041ab0a9 = data.var_d4b9aa76041ab0a9;
                _data.playerdisconnect = data.playerdisconnect;
                thread vehicle_occupancy_exit(vehicle, var_fc7c7a874b43a31a, player, _data, 1);
            } else {
                vehicle_occupancy_reenter(vehicle, var_fc7c7a874b43a31a, seatid, player, data);
            }
        }
        if (istrue(player.ksempd)) {
            if (!isdefined(player.var_3570f4b5b40c02e4)) {
                player thread scripts\cp_mp\emp_debuff::play_emp_scramble(4);
                player.var_3570f4b5b40c02e4 = 1;
            }
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x250f
// Size: 0x318
function vehicle_occupancy_exit(vehicle, seatid, player, data, immediate, specialexit) {
    assertex(isdefined(vehicle.vehiclename), "<dev string:x311>");
    assertex(isdefined(vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename)), "<dev string:x65>" + vehicle.vehiclename + "<dev string:x35b>");
    assertex(isdefined(vehicle.occupants) && isdefined(vehicle.occupantsreserving), "<dev string:x399>");
    if (isdefined(data)) {
        assertex(!isdefined(data.success), "<dev string:x3f9>");
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
    assertex(isdefined(var_fc7c7a874b43a31a), "<dev string:x446>");
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
    thread vehicle_occupancy_exitstart(vehicle, var_fc7c7a874b43a31a, undefined, player, data, specialexit);
    if (!data.immediate) {
        data waittill(data.raceendnotify);
        waittillframeend();
        data notify(data.raceendon);
    }
    success = vehicle_occupancy_raceresults(vehicle, player, var_fc7c7a874b43a31a, undefined, data);
    thread vehicle_occupancy_exitend(vehicle, var_fc7c7a874b43a31a, undefined, player, data, specialexit);
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
        return;
    }
    if (!istrue(data.playerdeath) && !istrue(data.playerlaststand) && !istrue(data.var_d4b9aa76041ab0a9) && !istrue(data.var_f276d4e53593ec9a) && !istrue(data.playerdisconnect) && !istrue(data.vehicledeath)) {
        vehicle_occupancy_reenter(vehicle, var_fc7c7a874b43a31a, undefined, player, data);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x282f
// Size: 0x6b
function vehicle_occupancy_isfriendlytoplayer(vehicle, player) {
    if (level.teambased) {
        return vehicle_occupancy_isfriendlytoteam(vehicle, player.team);
    }
    if (istrue(vehicle.friendlystatusdirty)) {
        vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
    }
    return isdefined(vehicle.playerfriendlyto) && vehicle.playerfriendlyto == player;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28a2
// Size: 0x6b
function vehicle_occupancy_isenemytoplayer(vehicle, player) {
    if (level.teambased) {
        return vehicle_occupancy_isenemytoteam(vehicle, player.team);
    }
    if (istrue(vehicle.friendlystatusdirty)) {
        vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
    }
    return isdefined(vehicle.playerfriendlyto) && vehicle.playerfriendlyto != player;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2915
// Size: 0x5b
function vehicle_occupancy_isneutraltoplayer(vehicle, player) {
    if (level.teambased) {
        return vehicle_occupancy_isneutraltoteam(vehicle, player.team);
    }
    if (istrue(vehicle.friendlystatusdirty)) {
        vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
    }
    return !isdefined(vehicle.playerfriendlyto);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2978
// Size: 0x3c
function vehicle_occupancy_getplayerfriendlyto(vehicle) {
    if (!level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return vehicle.playerfriendlyto;
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29bd
// Size: 0x56
function vehicle_occupancy_isfriendlytoteam(vehicle, team) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return (isdefined(vehicle.teamfriendlyto) && vehicle.teamfriendlyto == team);
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1c
// Size: 0x56
function vehicle_occupancy_isenemytoteam(vehicle, team) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return (isdefined(vehicle.teamfriendlyto) && vehicle.teamfriendlyto != team);
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7b
// Size: 0x46
function vehicle_occupancy_isneutraltoteam(vehicle, team) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return !isdefined(vehicle.teamfriendlyto);
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2aca
// Size: 0x3c
function vehicle_occupancy_getteamfriendlyto(vehicle) {
    if (level.teambased) {
        if (istrue(vehicle.friendlystatusdirty)) {
            vehicle vehicle_occupancy_cleanfriendlystatus(vehicle);
        }
        return vehicle.teamfriendlyto;
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0f
// Size: 0x21
function vehicle_occupancy_setfriendlystatusdirty(vehicle) {
    vehicle.friendlystatusdirty = 1;
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_setvehicledirty(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b38
// Size: 0x293
function vehicle_occupancy_cleanfriendlystatus(vehicle) {
    if (level.teambased) {
        cleaned = 0;
        var_757203a7499dfc71 = vehicle.teamfriendlyto;
        if (isdefined(vehicle.team) && vehicle.team != "neutral") {
            vehicle.teamfriendlyto = vehicle.team;
            vehicle.friendlystatusdirty = undefined;
            cleaned = 1;
        }
        if (!cleaned) {
            foreach (occupant in vehicle.occupants) {
                if (isdefined(occupant)) {
                    vehicle.teamfriendlyto = occupant.team;
                    vehicle.friendlystatusdirty = undefined;
                    cleaned = 1;
                    break;
                }
            }
        }
        if (!cleaned) {
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
    }
    cleaned = 0;
    var_49dc0cd42efb83e9 = vehicle.playerfriendlyto;
    if (isdefined(vehicle.originalowner)) {
        vehicle.playerfriendlyto = vehicle.originalowner;
        vehicle.friendlystatusdirty = undefined;
        cleaned = 1;
    }
    if (!cleaned) {
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd3
// Size: 0x112
function vehicle_occupancy_friendlystatuschangedcallback(vehicle, var_965ea26e6eb230b9, var_52312180ef1940be) {
    /#
        if (level.teambased) {
            assertex(!isdefined(var_965ea26e6eb230b9) || isstring(var_965ea26e6eb230b9), "<dev string:x47d>");
            assertex(!isdefined(var_52312180ef1940be) || isstring(var_52312180ef1940be), "<dev string:x4c5>");
        } else {
            assertex(!isdefined(var_965ea26e6eb230b9) || isplayer(var_965ea26e6eb230b9), "<dev string:x50d>");
            assertex(!isdefined(var_52312180ef1940be) || isplayer(var_52312180ef1940be), "<dev string:x555>");
        }
    #/
    scripts\cp_mp\vehicles\vehicle_compass::vehicle_compass_friendlystatuschangedcallback(vehicle, var_965ea26e6eb230b9, var_52312180ef1940be);
    if (utility::issharedfuncdefined("game", "checkInvalidOOBTriggers") && scripts\cp_mp\utility\player_utility::function_1e4a0e61fdb00e32(vehicle)) {
        vehicle function_f3bb4f4911a1beb2("game", "checkInvalidOOBTriggers");
    }
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    if (!isdefined(var_e2818ad39a3341b4.friendlystatuschangedcallback)) {
        return;
    }
    thread [[ var_e2818ad39a3341b4.friendlystatuschangedcallback ]](vehicle, var_965ea26e6eb230b9, var_52312180ef1940be);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2eed
// Size: 0x43
function vehicle_occupancy_setoriginalowner(vehicle, player) {
    assertex(!isdefined(vehicle.originalowner), "<dev string:x59d>");
    vehicle.originalowner = player;
    vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f38
// Size: 0xa6
function vehicle_occupancy_setowner(vehicle, player, var_57c14bf60c5be4ab, timeroverride) {
    if (!isdefined(vehicle.owners)) {
        vehicle.owners = [];
    } else {
        vehicle_occupancy_clearowner(vehicle, player);
        vehicle.owners = array_removeundefined(vehicle.owners);
    }
    vehicle.owners[vehicle.owners.size] = player;
    if (isdefined(timeroverride) && timeroverride == -1) {
    } else {
        thread vehicle_occupancy_watchowner(vehicle, player, var_57c14bf60c5be4ab, timeroverride);
    }
    vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fe6
// Size: 0x21b
function vehicle_occupancy_updateowner(vehicle) {
    vehicle notify("vehicle_owner_update");
    previousowner = vehicle.owner;
    previousownerteam = vehicle.ownerteam;
    bestowner = undefined;
    if (isdefined(vehicle.owners)) {
        for (i = vehicle.owners.size - 1; i >= 0; i--) {
            if (vehicle_occupancy_isplayervalidowner(vehicle, vehicle.owners[i])) {
                bestowner = vehicle.owners[i];
                break;
            }
        }
    }
    if (!isdefined(bestowner)) {
        if (vehicle_occupancy_isplayervalidowner(vehicle, vehicle.originalowner)) {
            bestowner = vehicle.originalowner;
        }
    }
    vehicle.owner = bestowner;
    ownerchanged = 0;
    if (isdefined(bestowner) || isdefined(previousowner)) {
        if (!isdefined(bestowner) && isdefined(previousowner)) {
            ownerchanged = 1;
        } else if (isdefined(bestowner) && !isdefined(previousowner)) {
            ownerchanged = 1;
        } else if (bestowner != previousowner) {
            ownerchanged = 1;
        }
    }
    ownerteamchanged = 0;
    if (isdefined(bestowner)) {
        if (!isdefined(previousownerteam) || previousownerteam != bestowner.team) {
            ownerteamchanged = 1;
        }
        vehicle.ownerteam = bestowner.team;
        scripts\cp_mp\vehicles\vehicle_compass::vehicle_compass_setteamfriendlyto(vehicle, bestowner.team);
        thread vehicle_occupancy_watchownerjoinedteam(vehicle, bestowner);
    } else {
        if (ownerchanged) {
            ownerteamchanged = 1;
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
        [[ getsharedfunc(vehicle.vehiclename, "updateOwner") ]](vehicle, bestowner, ownerchanged, ownerteamchanged);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3209
// Size: 0x77
function vehicle_occupancy_clearowner(vehicle, player) {
    vehicle notify("vehicle_clear_owner_" + player getentitynumber());
    if (isdefined(vehicle.owners)) {
        vehicle.owners = array_remove(vehicle.owners, player);
    }
    if (isdefined(vehicle.owner) && vehicle.owner == player) {
        vehicle_occupancy_updateowner(vehicle);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3288
// Size: 0xbb
function vehicle_occupancy_setteam(vehicle, team) {
    teamchanged = !isdefined(vehicle.team) || vehicle.team != team;
    vehicle.team = team;
    if (vehicle.classname == "script_vehicle") {
        vehicle setvehicleteam(team);
    }
    if (teamchanged) {
        if (level.teambased) {
            vehicle_occupancy_setfriendlystatusdirty(vehicle);
        }
    }
    if (issharedfuncdefined(vehicle.vehiclename, "updateTeam")) {
        [[ getsharedfunc(vehicle.vehiclename, "updateTeam") ]](vehicle, team, teamchanged);
    }
    vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x334b
// Size: 0x1df
function vehicle_occupancy_init() {
    assertex(isdefined(level.vehicle), "<dev string:x5fa>");
    assertex(!isdefined(level.vehicle.occupancy), "<dev string:x634>");
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
        issharedfuncdefined("<dev string:x66c>", "<dev string:x681>", 1);
    #/
    [[ getsharedfunc("vehicle_occupancy", "init") ]]();
    level.var_73d6c6366970020 = getdvarint(@"hash_abd3bd3c25a13d43", 1);
    level.var_351aab391da578a8 = getdvarint(@"hash_2bf0e47506040359", 1) == 1;
    level.var_abe9bcb8a67ff917 = getdvarfloat(@"hash_83928d2d50dc276c") + 50;
    level.var_d9dc5b053fb57856 = getdvarfloat(@"hash_c9b7b0f34821b869") + 50;
    level.var_df44f8cc05382071 = getdvarfloat(@"hash_94db90babe43cdc4", 100);
    level.var_49b09bd5297d4967 = getdvarint(@"hash_a459bb531af563b7", 1);
    if (isusingmatchrulesdata()) {
        vehicleUnmannedKillProtectionTimeout = getmatchrulesdata("commonOption", "vehicleUnmannedKillProtectionTimeout");
        if (!isdefined(vehicleUnmannedKillProtectionTimeout) || vehicleUnmannedKillProtectionTimeout == 0) {
            vehicleUnmannedKillProtectionTimeout = 4;
        }
        leveldata.var_772978c4701134fc = vehicleUnmannedKillProtectionTimeout;
    }
    if (istrue(level.var_351aab391da578a8)) {
        level.scr_animtree["player_exit_vehicle_to_roof"] = %script_model;
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3532
// Size: 0x143
function vehicle_occupancy_enterstart(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    data endon(data.raceendon);
    if (istrue(player.insertingarmorplate)) {
        player notify("try_armor_cancel", "vehicle_enter");
    }
    function_eae2223216b7712c(vehicle, player);
    vehicle.occupantsreserving[seatid] = player;
    player.vehiclereserved = vehicle;
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_setvehicledirty(vehicle);
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_setpointsdirty(vehicle);
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_updateusability(vehicle);
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
        assertex(timestamp == gettime(), "<dev string:x689>");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x367d
// Size: 0x11f
function vehicle_occupancy_exitstart(vehicle, seatid, var_7558f98f3236963d, player, data, specialexit) {
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
        [[ exitstartcallback ]](vehicle, seatid, var_7558f98f3236963d, player, data, specialexit);
    } else {
        vehicle_occupancy_exitstartcallback(vehicle, seatid, var_7558f98f3236963d, player, data, specialexit);
    }
    if (!isdefined(data.exitstartcomplete)) {
        data.exitstartcomplete = 1;
    }
    if (data.immediate) {
        assertex(timestamp == gettime(), "<dev string:x6da>");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37a4
// Size: 0x12
function function_2966f7ab8ae9ccc6(tag) {
    return tag + "_window";
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x37bf
// Size: 0x46
function function_43c2c433b8b9b12d(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        function_5004590331017d88(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x380d
// Size: 0x36
function function_5004590331017d88(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x384b
// Size: 0x46
function function_857bf4201a249a99(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        function_cb4191526e56163c(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3899
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
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_updateomnvarsonseatexit(vehicle, seatid, var_7558f98f3236963d, player);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3932
// Size: 0xe6
function vehicle_occupancy_exitstartcallback(vehicle, seatid, var_7558f98f3236963d, player, data, specialexit) {
    data endon(data.raceendon);
    result = vehicle_occupancy_findplayerexit(player, vehicle, seatid, var_7558f98f3236963d, data, specialexit);
    if (!result) {
        data.exitstartcomplete = 0;
        vehicle_occupancy_errormessage(player, 2);
        if (!istrue(data.immediate)) {
            waitframe();
            data notify(data.raceendnotify);
        }
        return;
    }
    if (isdefined(data.specialexit) && data.specialexit == "_to_roof") {
        result = function_c5819749db1604f5(player, vehicle, seatid, data);
        if (!istrue(result)) {
            player val::reset_all("vehicle_roof_exit");
            vehicle_occupancy_exitstartcallback(vehicle, seatid, var_7558f98f3236963d, player, data, undefined);
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3a20
// Size: 0x3f5
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
                isgroundvehicle = vehicle scripts\cp_mp\vehicles\vehicle::isgroundvehicle();
                if (isdefined(var_6681408ac5fcc6cf.ground_vehicle_used_count) && isgroundvehicle) {
                    var_6681408ac5fcc6cf.ground_vehicle_used_count++;
                }
                var_e9d237c4ba649649 = vehicle scripts\cp_mp\vehicles\vehicle::vehiclecanfly();
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
        wasdriver = vehicle_occupancy_isdriverseat(vehicle, seatid);
        if (wasdriver && istrue(function_29b4292c92443328(vehicle function_d93ec4635290febd()).isboat)) {
            vehicle function_3112242e4bc392de();
        }
        if (istrue(vehicle.isheli)) {
            vehicle function_a91927df280e94e4();
        }
        if (wasdriver && istrue(vehicle.var_6179b2eea75dbfe0)) {
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
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_setvehicledirty(vehicle);
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_setpointsdirty(vehicle);
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_updateusability(vehicle);
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
    assertex(timestamp == gettime(), "<dev string:x72a>");
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1d
// Size: 0x294
function vehicle_occupancy_exitend(vehicle, seatid, var_7558f98f3236963d, player, data, specialexit) {
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
        if (!vehicle scripts\common\vehicle_code::vehicle_is_stopped() && vehicle_occupancy_isdriverseat(vehicle, seatid)) {
            if (issharedfuncdefined("br", "challengeEvaluator")) {
                paramstruct = spawnstruct();
                paramstruct.exitdriver = 1;
                player thread [[ getsharedfunc("br", "challengeEvaluator") ]]("br_mastery_ghostRideWhip", paramstruct);
            }
        }
        if (vehicle_occupancy_isdriverseat(vehicle, seatid) && istrue(function_29b4292c92443328(vehicle function_d93ec4635290febd()).isboat)) {
            vehicle thread function_4e7868ef633f4b36();
        }
    }
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_setvehicledirty(vehicle);
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_setpointsdirty(vehicle);
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_updateusability(vehicle);
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
    params = {#vehicle:vehicle, #var_7558f98f3236963d:var_7558f98f3236963d, #seatid:seatid, #player:player};
    player callback::callback("player_vehicle_exit", params);
    assertex(timestamp == gettime(), "<dev string:x765>");
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x40b9
// Size: 0xd3
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
        data.specialexit = undefined;
        data.exitdirection = undefined;
        data.exitoffset = undefined;
        thread vehicle_occupancy_enter(vehicle, var_9de41f2ee77c33ba, player, data, 1);
    }
    assertex(timestamp == gettime(), "<dev string:x79f>");
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4194
// Size: 0x4f
function vehicle_occupancy_getleveldata() {
    assertex(isdefined(level.vehicle), "<dev string:x7d9>");
    assertex(isdefined(level.vehicle.occupancy), "<dev string:x81b>");
    return level.vehicle.occupancy;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x41ec
// Size: 0x12f
function vehicle_occupancy_handleplayerbc(player, seatdata, var_4cbe0c5ddb047549) {
    assert(issharedfuncdefined("<dev string:x867>", "<dev string:x86f>"));
    var_9d2442a09adbb305 = 5000;
    if (istrue(var_4cbe0c5ddb047549)) {
        player.vehoccupancy_lastseatbc = seatdata.onenterbattlechatter;
        thread [[ getsharedfunc("game", "trySayLocalSound") ]](player, seatdata.onenterbattlechatter, undefined, 1);
        player.vehoccupancy_lastbctime = gettime();
        return;
    }
    if (isdefined(player.vehoccupancy_lastseatbc) && isdefined(player.vehoccupancy_lastbctime) && player.vehoccupancy_lastseatbc != seatdata.onenterbattlechatter && gettime() - player.vehoccupancy_lastbctime > var_9d2442a09adbb305) {
        thread [[ getsharedfunc("game", "trySayLocalSound") ]](player, seatdata.onenterbattlechatter);
        player.vehoccupancy_lastseatbc = seatdata.onenterbattlechatter;
        player.vehoccupancy_lastbctime = gettime();
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4323
// Size: 0x2d
function vehicle_occupancy_purgedataforseatinstance(vehicle, seatid) {
    vehicle.occupants[seatid] = undefined;
    vehicle.occupantsreserving[seatid] = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4358
// Size: 0x139
function vehicle_occupancy_onentervehicle(vehicle, var_7558f98f3236963d, player, data) {
    level notify("enter_vehicle", vehicle, player);
    vehicle_occupancy_setfriendlystatusdirty(vehicle);
    function_e462819da430ac92(vehicle);
    vehicle scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_stopwatchingabandoned();
    player setstance("stand");
    player val::set_array("vehicle_occupant_common", vehicle_occupancy_getoccupantrestrictions(), 0);
    thread vehicle_occupancy_takeriotshield(player, vehicle, var_7558f98f3236963d);
    scripts\cp_mp\vehicles\customization\battle_tracks::battle_tracks_onentervehicle(vehicle, player);
    scripts\cp_mp\vehicles\vehicle_interact::function_c5fe005f06fe5684(vehicle, player);
    if (issharedfuncdefined("vehicle_occupancy", "onEnterVehicle", 1)) {
        [[ getsharedfunc("vehicle_occupancy", "onEnterVehicle") ]](vehicle, var_7558f98f3236963d, player, data);
    }
    params = {#data:data, #player:player, #var_7558f98f3236963d:var_7558f98f3236963d, #vehicle:vehicle};
    level callback::callback("onEnterVehicle", params);
    /#
        if (issharedfuncdefined("<dev string:x867>", "<dev string:x883>")) {
            host = [[ getsharedfunc("<dev string:x867>", "<dev string:x883>") ]]();
            if (isdefined(host) && player == host) {
                level.botvehicle = vehicle;
            }
        }
    #/
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4499
// Size: 0x1c0
function vehicle_occupancy_onexitvehicle(vehicle, var_fc7c7a874b43a31a, player, data) {
    level notify("exit_vehicle", vehicle, player);
    if (!istrue(data.playerdisconnect)) {
        player vehicle_occupancy_stopmovefeedbackforplayer();
        player vehicle_occupancy_cleardamagefeedbackforplayer();
        scripts\cp_mp\vehicles\vehicle_interact::function_deb83798a724a77e(vehicle, player);
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
    vehicle thread scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_watchabandoned();
    vehicle thread scripts\cp_mp\vehicles\vehicle_spawn::function_6c65df1f40e10037();
    if (issharedfuncdefined("vehicle_occupancy", "onExitVehicle", 1)) {
        [[ getsharedfunc("vehicle_occupancy", "onExitVehicle") ]](vehicle, var_fc7c7a874b43a31a, player, data);
    }
    params = {#data:data, #player:player, #var_fc7c7a874b43a31a:var_fc7c7a874b43a31a, #vehicle:vehicle};
    level callback::callback("onExitVehicle", params);
    player notify("exit_vehicle");
    vehicle_dlog_exitevent(vehicle, player, var_fc7c7a874b43a31a, data.exittype);
    scripts\cp_mp\vehicles\customization\battle_tracks::battle_tracks_onexitvehicle(vehicle, player, var_fc7c7a874b43a31a);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4661
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
        return;
    }
    if (istrue(vehicle.isfull)) {
        vehicle.isfull = undefined;
        vehicle_interact_setpointdirty(vehicle, "single");
        vehicle_interact_updateusability(vehicle);
        return;
    }
    vehicle_interact_updateusability(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4708
// Size: 0x4b
function vehicle_occupancy_updateempty(vehicle) {
    var_8224e7631d8f04f2 = vehicle_occupancy_getavailablevehicleseats(vehicle);
    var_12d36e89a6e0742e = vehicle_occupancy_getallvehicleseats(vehicle);
    isempty = var_8224e7631d8f04f2.size == var_12d36e89a6e0742e.size;
    vehicle.isempty = isempty;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x475b
// Size: 0x43
function vehicle_occupancy_getenterstartcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "enterStart")) {
        return getsharedfunc(vehicle.vehiclename, "enterStart");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47a6
// Size: 0x43
function vehicle_occupancy_getenterendcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "enterEnd")) {
        return getsharedfunc(vehicle.vehiclename, "enterEnd");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47f1
// Size: 0x43
function vehicle_occupancy_getexitstartcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "exitStart")) {
        return getsharedfunc(vehicle.vehiclename, "exitStart");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x483c
// Size: 0x43
function vehicle_occupancy_getexitendcallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "exitEnd")) {
        return getsharedfunc(vehicle.vehiclename, "exitEnd");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4887
// Size: 0x43
function vehicle_occupancy_getreentercallbackforseat(vehicle, seatid) {
    if (issharedfuncdefined(vehicle.vehiclename, "reenter")) {
        return getsharedfunc(vehicle.vehiclename, "reenter");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x48d2
// Size: 0x73
function vehicle_occupancy_applyrestrictionstooccupant(vehicle, var_7558f98f3236963d, player, data) {
    if (!vehicle_occupancy_movementisallowed(vehicle) && !vehicle function_f654c168752ed299()) {
        if (var_7558f98f3236963d == vehicle_occupancy_getdriverseat(vehicle)) {
            vehicle_occupancy_allowmovementplayer(vehicle, player, 0, var_7558f98f3236963d);
        }
    }
    restrictions = vehicle_occupancy_getrestrictionsforseat(vehicle, var_7558f98f3236963d);
    player val::set_array("vehicle_occupant", restrictions, 0);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x494d
// Size: 0x4b
function vehicle_occupancy_removerestrictionsfromoccupant(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        vehicle_occupancy_allowmovementplayer(vehicle, player, 1, undefined);
        player val::reset_all("vehicle_occupant");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49a0
// Size: 0x31
function function_31609728116475f() {
    if (!isdefined(level.var_12a9aac58c679eca)) {
        level.var_12a9aac58c679eca = getdvarint(@"hash_4f6bb46a93a86d18", 1);
    }
    return level.var_12a9aac58c679eca;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x49da
// Size: 0x72
function vehicle_occupancy_hideoccupant(vehicle, var_7558f98f3236963d, player, data) {
    if (vehicle_shouldhideoccupantforseat(vehicle, var_7558f98f3236963d)) {
        player.nocorpse = 1;
        if (function_31609728116475f()) {
            player function_305fb8c759fa4de5();
            player function_379bb555405c16bb("vehicle_occupancy::vehicle_occupancy_hideOccupant() - _playerHideStack");
            return;
        }
        player function_a593971d75d82113();
        player function_379bb555405c16bb("vehicle_occupancy::vehicle_occupancy_hideOccupant()");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4a54
// Size: 0x37
function function_c84d89e51c871aa2(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (function_f3db2e446c1457f(vehicle, var_fc7c7a874b43a31a, player)) {
        player vehicle_setstowedweaponvisibility(0);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a93
// Size: 0xa5
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4b41
// Size: 0xb7
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c00
// Size: 0xda
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ce2
// Size: 0x81
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6b
// Size: 0x8d
function vehicle_occupancy_showoccupant(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        if (vehicle_shouldhideoccupantforseat(vehicle, var_fc7c7a874b43a31a)) {
            if (!istrue(data.nocorpse)) {
                player.nocorpse = undefined;
            }
            if (function_31609728116475f()) {
                player function_f81e91f54bddaf46();
                player function_985b0973f29da4f8("vehicle_occupancy::vehicle_occupancy_showOccupant() - _playerShowStack");
                return;
            }
            player function_6fb380927695ee76();
            player function_985b0973f29da4f8("vehicle_occupancy::vehicle_occupancy_showOccupant()");
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4e00
// Size: 0x47
function function_edcb1116f9160367(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        if (function_f3db2e446c1457f(vehicle, var_fc7c7a874b43a31a, player)) {
            player vehicle_setstowedweaponvisibility(1);
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4e4f
// Size: 0x4d
function function_7c295748bbe46edf(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (function_e552d137b9591a4c(vehicle, var_fc7c7a874b43a31a, player) && player tagexists("j_helmet_hide")) {
        player hidepart("j_helmet_hide", undefined, 1);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ea4
// Size: 0x4d
function function_e157f2a83aa01ea2(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (function_e552d137b9591a4c(vehicle, var_fc7c7a874b43a31a, player) && player tagexists("j_helmet_hide")) {
        player showpart("j_helmet_hide", undefined, 1);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ef9
// Size: 0x5b
function function_e552d137b9591a4c(vehicle, seatid, player) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    return istrue(var_c50b485a43752fd.hidehelmet);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5d
// Size: 0x71
function vehicle_occupancy_applycameratooccupant(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    camera = vehicle_getcameraforseat(vehicle, seatid);
    if (isdefined(camera) && camera != "none") {
        oldcamera = vehicle_getcameraforseat(vehicle, var_fc7c7a874b43a31a);
        if (oldcamera != camera) {
            player cameraset(camera);
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4fd6
// Size: 0x57
function vehicle_occupancy_removecamerafromoccupant(vehicle, var_7558f98f3236963d, player, data) {
    if (isdefined(var_7558f98f3236963d)) {
        camera = vehicle_getcameraforseat(vehicle, var_7558f98f3236963d);
        if (camera == "none") {
            player cameradefault();
        }
        return;
    }
    player cameradefault();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5035
// Size: 0x66
function vehicle_occupancy_applydamagemodifiertooccupant(vehicle, var_7558f98f3236963d, player, data) {
    damagemodifier = vehicle_occupancy_getdamagemodifierforseat(vehicle, var_7558f98f3236963d);
    if (isdefined(damagemodifier) && damagemodifier != -1) {
        player adddamagemodifier(vehicle.vehiclename + "_" + var_7558f98f3236963d, damagemodifier, 0, &vehicle_occupancy_damagemodifierignorefunc);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x50a3
// Size: 0x6f
function vehicle_occupancy_removedamagemodifierfromoccupant(vehicle, var_fc7c7a874b43a31a, player, data) {
    if (!istrue(data.playerdeath)) {
        damagemodifier = vehicle_occupancy_getdamagemodifierforseat(vehicle, var_fc7c7a874b43a31a);
        if (isdefined(damagemodifier) && damagemodifier != -1) {
            player removedamagemodifier(vehicle.vehiclename + "_" + var_fc7c7a874b43a31a, 0);
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x511a
// Size: 0xe2
function vehicle_occupancy_getrestrictionsforseat(vehicle, seatid) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    restrictions = ter_op(isdefined(var_c50b485a43752fd.restrictions), var_c50b485a43752fd.restrictions, var_e2818ad39a3341b4.restrictions);
    if (istrue(var_e2818ad39a3341b4.var_4b92043c00e4e91b)) {
        if (vehicle function_6c49fb45260b8c4c(seatid)) {
            restrictions[restrictions.size] = "vehicle_lean_out";
        } else {
            restrictions = function_6d6af8144a5131f1(restrictions, "melee");
        }
    } else {
        restrictions[restrictions.size] = "vehicle_lean_out";
    }
    if (vehicle function_80d84f556cc8017a() && function_1003e8d7c662a2ff(vehicle function_d93ec4635290febd(), seatid)) {
        restrictions[restrictions.size] = "fire";
    }
    return restrictions;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5205
// Size: 0x73
function vehicle_shouldhideoccupantforseat(vehicle, seatid) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    if (isdefined(var_c50b485a43752fd.hideoccupant)) {
        return istrue(var_c50b485a43752fd.hideoccupant);
    }
    return istrue(var_e2818ad39a3341b4.hideoccupant);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5280
// Size: 0x65
function function_f3db2e446c1457f(vehicle, seatid, player) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    return player function_793f941d7dff15ed() && istrue(var_c50b485a43752fd.hidestowedweapon);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x52ee
// Size: 0xb8
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53af
// Size: 0x6f
function vehicle_occupancy_getdamagemodifierforseat(vehicle, seatid) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    var_c50b485a43752fd = var_e2818ad39a3341b4.seatdata[seatid];
    return ter_op(isdefined(var_c50b485a43752fd.damagemodifier), var_c50b485a43752fd.damagemodifier, var_e2818ad39a3341b4.damagemodifier);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5427
// Size: 0x8e
function vehicle_occupancy_damagemodifierignorefunc(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    data = packdamagedata(attacker, victim, damage, objweapon, meansofdeath, inflictor);
    if (meansofdeath == "MOD_TRIGGER_HURT") {
        return true;
    }
    if (isdefined(objweapon) && objweapon.basename == "bomb_site_mp") {
        return true;
    }
    if (victim isstuckdamage(data)) {
        return true;
    }
    return false;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x54be
// Size: 0x195
function function_a3428466c78231b0(vehicle, player) {
    level endon("game_ended");
    vehicle endon("death");
    player endon("death_or_disconnect");
    wait 0.5;
    vehicleoobtriggers = vehicle.oobtriggers;
    playeroobtriggers = player.oobtriggers;
    if (isdefined(vehicleoobtriggers)) {
        foreach (vehicletrigger in vehicleoobtriggers) {
            refreshoob = 1;
            if (isdefined(playeroobtriggers) && playeroobtriggers.size > 0) {
                refreshoob = !array_contains(playeroobtriggers, vehicletrigger);
            }
            if (istrue(refreshoob)) {
                if (issharedfuncdefined("game", "onEnterOOBTrigger")) {
                    [[ getsharedfunc("game", "onEnterOOBTrigger") ]](vehicletrigger, player, 1);
                }
            }
        }
    }
    if (isdefined(playeroobtriggers)) {
        foreach (playertrigger in playeroobtriggers) {
            refreshoob = 0;
            if (!isdefined(vehicleoobtriggers)) {
                refreshoob = 1;
            } else if (!array_contains(vehicleoobtriggers, playertrigger)) {
                refreshoob = 1;
            }
            if (istrue(refreshoob)) {
                if (issharedfuncdefined("game", "onExitOOBTrigger")) {
                    [[ getsharedfunc("game", "onExitOOBTrigger") ]](playertrigger, player);
                }
            }
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x565b
// Size: 0x60
function vehicle_occupancy_monitoroccupant(vehicle, player, seatid) {
    thread vehicle_occupancy_monitorcontrols(vehicle, player, seatid);
    if (!istrue(level.var_15c7e6ec178feef1)) {
        thread vehicle_occupancy_monitorseatswitch(vehicle, player, seatid, 1);
        thread vehicle_occupancy_monitorexit(vehicle, player, seatid);
    }
    thread vehicle_occupancy_monitorgameended(vehicle, player, seatid);
    thread vehicle_occupancy_monitorLeanBlocked(vehicle, player);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56c3
// Size: 0x33
function vehicle_occupancy_stopmonitoringoccupant(player) {
    player notify("vehicle_occupancy_monitorControls");
    player notify("vehicle_occupancy_monitorSeatSwitch");
    player notify("vehicle_occupancy_monitorExit");
    player notify("vehicle_occupancy_monitorGameEnded");
    player notify("vehicle_occupancy_monitorLeanBlocked");
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x56fe
// Size: 0x76
function vehicle_occupancy_monitorLeanBlocked(vehicle, player) {
    player notify("vehicle_occupancy_monitorLeanBlocked");
    player endon("vehicle_occupancy_monitorLeanBlocked");
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    while (true) {
        player waittill_any_2("vehicle_leanout_attempt_denied", "vehicle_leanout_forced_return");
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ getsharedfunc("hud", "showErrorMessage") ]]("VEHICLES/LEAN_OUT_BLOCKED");
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x577c
// Size: 0x178
function vehicle_occupancy_monitorseatswitch(vehicle, player, seatid, applydelay) {
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
        if (applydelay) {
            wait 0.2;
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x58fc
// Size: 0xb8
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x59bc
// Size: 0xc6
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5a8b
// Size: 0xd2
function vehicle_occupancy_monitorexit(vehicle, player, seatid) {
    player notify("vehicle_occupancy_monitorExit");
    player endon("vehicle_occupancy_monitorExit");
    vehicle endon("death");
    level endon("game_ended");
    specialexit = vehicle_occupancy_monitorexitinternal(vehicle, player, seatid);
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
    thread vehicle_occupancy_exit(vehicle, seatid, player, data, undefined, specialexit);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5b65
// Size: 0x357
function vehicle_occupancy_monitorexitinternal(vehicle, player, seatid) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    player endon("enter_live_ragdoll");
    endtime = gettime() + 300;
    buttonreleased = 0;
    roofexittype = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd()).roofexittype;
    var_7a888fdba3dfb003 = istrue(level.var_351aab391da578a8) && isdefined(roofexittype) && player function_46ca2675c0578280();
    var_edc035ec125029eb = istrue(level.var_73d6c6366970020);
    player setclientomnvar("ui_veh_exit_button_holdtime", 0);
    while (true) {
        if (!player usebuttonpressed()) {
            buttonreleased = 1;
        }
        if (buttonreleased && gettime() >= endtime) {
            break;
        }
        waitframe();
    }
    updaterate = level.framedurationseconds;
    var_33193f537b85b6d4 = getdvarint(@"hash_9402582f8123db99", 250) / 1000;
    var_b24cf95b8cf123c = 0;
    var_7f08bbc709d0effc = undefined;
    while (true) {
        timeused = 0;
        var_930201649eaf32af = player getcurrentusereloadconfig();
        var_556640f47976049a = 0;
        player setclientomnvar("ui_veh_exit_button_holdtime", 0);
        while (player usebuttonpressed()) {
            player disablereloading();
            player cancelreloading();
            var_556640f47976049a = 1;
            timeused += updaterate;
            isgamepad = player usinggamepad();
            var_b97750d9099a9b79 = player getuseholdkbmprofile();
            var_73780d1b420d7903 = !isgamepad && !var_b97750d9099a9b79;
            var_caaa0275d82bfee1 = !isgamepad && var_b97750d9099a9b79;
            var_8b3c790f008214a9 = isgamepad && var_930201649eaf32af == 0;
            var_97e758980add17ef = isgamepad && var_930201649eaf32af > 0;
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
            wait updaterate;
        }
        if (var_556640f47976049a && player usinggamepad() && var_930201649eaf32af > 0 && timeused < var_33193f537b85b6d4) {
            return ter_op(var_edc035ec125029eb && player function_a7de57196f4b5d16() && vehicle vehicle_getspeed() > 10, "_to_dive", undefined);
        } else if (var_556640f47976049a) {
            player enablereloading();
            player forcereloading();
        }
        if (var_7a888fdba3dfb003) {
            var_b24cf95b8cf123c |= player jumpbuttonpressed();
            if (player jumpbuttonpressed()) {
                var_7f08bbc709d0effc = gettime();
            } else if (var_b24cf95b8cf123c && isdefined(var_7f08bbc709d0effc) && var_7f08bbc709d0effc + 400 < gettime()) {
                var_b24cf95b8cf123c = 0;
            }
            if (var_b24cf95b8cf123c && !player function_e1b085052385d056() && player function_46ca2675c0578280()) {
                return "_to_roof";
            }
        }
        waitframe();
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ec4
// Size: 0xa3
function vehicle_occupancy_errormessage(player, errorref) {
    errorstr = undefined;
    switch (errorref) {
    case 1: 
        errorstr = "VEHICLES/SEAT_SWITCH_OCCUPIED";
        break;
    case 2: 
        errorstr = "VEHICLES/CANNOT_EXIT";
        break;
    case 3: 
        errorstr = "VEHICLES/GRENADE_TURRET_LOCKED";
        break;
    }
    assertex(isdefined(errorstr), "<dev string:x894>");
    if (issharedfuncdefined("hud", "showErrorMessage")) {
        player [[ getsharedfunc("hud", "showErrorMessage") ]](errorstr);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f6f
// Size: 0x54
function vehicle_occupancy_monitorgameended(vehicle, player, seatid) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    player notify("vehicle_occupancy_monitorGameEnded");
    player endon("vehicle_occupancy_monitorGameEnded");
    if (seatid == scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriverseat(vehicle)) {
        level waittill("game_ended");
        player allowmovement(0);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5fcb
// Size: 0xb5
function vehicle_occupancy_monitorcontrols(vehicle, player, seatid) {
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    vehicle endon("death");
    level endon("game_ended");
    player notify("vehicle_occupancy_monitorControls");
    player endon("vehicle_occupancy_monitorControls");
    if (scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_controlsarefadedoutorhidden(player)) {
        return;
    }
    if (true) {
        wait 1.5;
    }
    childthread vehicle_occupancy_monitormovementcontrols(vehicle, player, seatid);
    childthread vehicle_occupancy_monitorturretcontrols(vehicle, player, seatid);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle.vehiclename);
    if (isdefined(var_e2818ad39a3341b4.monitorcontrolscallback)) {
        childthread [[ var_e2818ad39a3341b4.monitorcontrolscallback ]](vehicle, player, seatid, "vehicle_occupancy_monitorControls");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6088
// Size: 0x1b
function vehicle_occupancy_fadeoutcontrols(player) {
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_fadeoutcontrols(player);
    player notify("vehicle_occupancy_monitorControls");
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x60ab
// Size: 0x11a
function vehicle_occupancy_monitormovementcontrols(vehicle, player, seatid) {
    driverseatid = vehicle_occupancy_getdriverseat(vehicle);
    if (seatid == driverseatid) {
        canfly = vehicle vehiclecanfly();
        if (canfly) {
            while (true) {
                forward = vehicle vehicle_getinputvalue(0);
                turn = vehicle vehicle_getinputvalue(2);
                strafe = vehicle vehicle_getinputvalue(1);
                ascend = vehicle vehicle_getinputvalue(3);
                if (abs(forward) > 0 || abs(turn) > 0 || abs(strafe) > 0 || abs(ascend) > 0) {
                    vehicle_occupancy_fadeoutcontrols(player);
                }
                wait 0.05;
            }
            return;
        }
        while (true) {
            gasinput = vehicle vehicle_getinputvalue(4);
            if (abs(gasinput) >= 0.2) {
                vehicle_occupancy_fadeoutcontrols(player);
            }
            wait 0.05;
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x61cd
// Size: 0x83
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6258
// Size: 0x4d
function function_2e58e7b01554419a(vehicleref, seatid) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicleref, seatid);
    if (isdefined(var_c50b485a43752fd) && isdefined(var_c50b485a43752fd.turretobjweapon)) {
        return var_c50b485a43752fd.turretobjweapon;
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62ad
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6393
// Size: 0x44
function vehicle_occupancy_racevehicledeath(vehicle, data) {
    data endon(data.raceendon);
    vehicle waittill("death");
    data.vehicledeath = 1;
    data notify(data.raceendnotify);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x63df
// Size: 0x6c
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6453
// Size: 0x96
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x64f1
// Size: 0x1e8
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
    }
    return data.success;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x66e2
// Size: 0x6f
function vehicle_occupancy_watchowner(vehicle, player, var_57c14bf60c5be4ab, timeroverride) {
    player endon("disconnect");
    vehicle endon("death");
    vehicle endon("vehicle_clear_owner_" + player getentitynumber());
    if (istrue(var_57c14bf60c5be4ab)) {
        player waittill("vehicle_seat_exit");
    }
    var_f86fb0e66b52ea3b = ter_op(isdefined(timeroverride), timeroverride, 20);
    wait var_f86fb0e66b52ea3b;
    thread vehicle_occupancy_clearowner(vehicle, player);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6759
// Size: 0x43
function vehicle_occupancy_watchownerjoinedteam(vehicle, player) {
    player endon("disconnect");
    vehicle endon("death");
    vehicle endon("vehicle_owner_update");
    player waittill_any_2("joined_team", "joined_spectators");
    thread vehicle_occupancy_updateowner(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67a4
// Size: 0x8d
function vehicle_occupancy_isplayervalidowner(vehicle, player) {
    if (!isdefined(player)) {
        return false;
    }
    if (level.teambased && isdefined(vehicle.team)) {
        if (vehicle.team != "neutral" && player.team != vehicle.team) {
            return false;
        }
    } else if (isdefined(vehicle.originalowner)) {
        if (player != vehicle.originalowner) {
            return false;
        }
    }
    return true;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x683a
// Size: 0x1a1
function vehicle_occupancy_animateplayer(vehicle, seatid, var_fc7c7a874b43a31a, animtype, var_d65ff23efe3b8aa9, var_3f9690fb0c8ebc84) {
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
    if (!isdefined(var_c50b485a43752fd.animtag)) {
        return;
    }
    if (isdefined(var_d65ff23efe3b8aa9) || isdefined(var_3f9690fb0c8ebc84)) {
        assertex(isdefined(var_d65ff23efe3b8aa9), "<dev string:x8d7>");
        assertex(isdefined(var_3f9690fb0c8ebc84), "<dev string:x8d7>");
        function_d1c52700cb7ddbf3(var_d65ff23efe3b8aa9, var_3f9690fb0c8ebc84);
        thread function_233275857335e4dc(1);
    }
    self cancelmantle();
    enterseatindex = 0;
    seattag = var_c50b485a43752fd.animtag;
    if (issubstr(seattag, "tag_seat_")) {
        enterseatindex = int(getsubstr(seattag, 9));
    } else if (issubstr(seattag, "tag_gunner")) {
        substr = getsubstr(seattag, 10);
        enterseatindex = int(substr) + 10 - 1;
    } else if (issubstr(seattag, "gunner_")) {
        enterseatindex = int(getsubstr(seattag, 7)) + 10 - 1;
    }
    isexitvehicle = !isdefined(seatid);
    function_c9b87beb89ec12e2(self, vehicle, isexitvehicle);
    isentervehicle = !isdefined(var_fc7c7a874b43a31a) && isdefined(seatid);
    var_60871098a5b9c669 = self usevehicle(vehicle, enterseatindex, isentervehicle);
    if (istrue(var_60871098a5b9c669) && vehicle function_452936099dcd1b94(seatid)) {
        vehicle function_14219d4c7d83499f(seatid);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x69e3
// Size: 0x24
function function_d1c52700cb7ddbf3(type, seat) {
    self notify("OverrideVehicleSeatAnimConditionals");
    self overridevehicleseatanimconditionals(type, seat);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a0f
// Size: 0x34
function function_233275857335e4dc(delayed) {
    self endon("death_or_disconnect");
    self notify("OverrideVehicleSeatAnimConditionals");
    self endon("OverrideVehicleSeatAnimConditionals");
    if (istrue(delayed)) {
        waitframe();
    }
    self overridevehicleseatanimconditionals("", 0);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a4b
// Size: 0x2f
function function_ee4b8b879b1b120c() {
    if (istrue(self.isheli) && self getscriptablehaspart("Exhaust")) {
        self setscriptablepartstate("Exhaust", "off");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a82
// Size: 0xf3
function function_ba42cf4e5bb24367() {
    hasexhaust = self getscriptablehaspart("Exhaust");
    haslights = self getscriptablehaspart("NaviLights");
    if (!hasexhaust && !haslights) {
        return;
    }
    self endon("death");
    self notify("stopHeliEffectsAfterTime");
    self endon("stopHeliEffectsAfterTime");
    self.var_19169da06f71a4f2 = "waitingToTurnOff";
    wait 6;
    while (istrue(self.ishovering)) {
        wait 2;
    }
    if (!isdefined(self.var_19169da06f71a4f2) || self.var_19169da06f71a4f2 != "waitingToTurnOff") {
        return;
    }
    self.var_19169da06f71a4f2 = undefined;
    if (hasexhaust && self getscriptablepartstate("Exhaust") == "on") {
        self setscriptablepartstate("Exhaust", "off");
    }
    if (haslights && self getscriptablepartstate("NaviLights") == "on") {
        self setscriptablepartstate("NaviLights", "off");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b7d
// Size: 0x89
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c0e
// Size: 0x30
function function_4e7868ef633f4b36() {
    self endon("death");
    self endon("unanchored");
    while (self vehicle_getspeed() > 2) {
        wait 0.2;
    }
    self function_481c2a63f2ba3332(-1, 100);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c46
// Size: 0x12
function function_3112242e4bc392de() {
    self notify("unanchored");
    self function_481c2a63f2ba3332(0);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c60
// Size: 0x204
function function_a1a583c3cc871645(bool) {
    if (bool) {
        assert(isdefined(self.firedisabled) && self.firedisabled > 0, "<dev string:x924>");
        self.firedisabled--;
        if (self.firedisabled == 0) {
            self.firedisabled = undefined;
            foreach (occupant in function_f6cb37189c84811b()) {
                occupant val::set("vehicle_occupant", "fire", 1);
            }
            if (isdefined(self.turretoccupants)) {
                foreach (occupant in self.turretoccupants) {
                    occupant val::set("vehicle_turret", "fire", 1);
                }
            }
        }
        return;
    }
    if (!isdefined(self.firedisabled)) {
        self.firedisabled = 0;
    }
    self.firedisabled++;
    if (self.firedisabled == 1) {
        foreach (occupant in function_f6cb37189c84811b()) {
            occupant val::set("vehicle_occupant", "fire", 0);
        }
        if (isdefined(self.turretoccupants)) {
            foreach (occupant in self.turretoccupants) {
                occupant val::set("vehicle_turret", "fire", 0);
            }
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e6c
// Size: 0x21
function function_80d84f556cc8017a() {
    return isdefined(self) && isdefined(self.firedisabled) && self.firedisabled > 0;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e96
// Size: 0x9b
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f3a
// Size: 0x39
function function_1003e8d7c662a2ff(vehicleref, seatid) {
    seatdata = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldataforseat(vehicleref, seatid);
    return isdefined(seatdata) && istrue(seatdata.var_4c78bdf78d543129);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f7c
// Size: 0x18
function function_f654c168752ed299() {
    return isdefined(self) && self vehicle_isphysveh() && self function_76fa53e72547ff02();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6f9d
// Size: 0x23b
function vehicle_occupancy_allowmovement(vehicle, bool, showwarning, var_f4942f1848b5b6ca) {
    if (bool) {
        assert(isdefined(vehicle.movementdisabled) && vehicle.movementdisabled > 0, "<dev string:x924>");
        vehicle.movementdisabled--;
        if (vehicle.movementdisabled == 0) {
            occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289(vehicle);
            if (isdefined(occupants)) {
                scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning("movementDisabled", occupants, vehicle function_d93ec4635290febd());
                if (vehicle hascomponent("p2p")) {
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
        return;
    }
    if (!isdefined(vehicle.movementdisabled)) {
        vehicle.movementdisabled = 0;
    }
    vehicle.movementdisabled++;
    if (vehicle.movementdisabled == 1) {
        occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289(vehicle);
        if (isdefined(occupants)) {
            if (!isdefined(showwarning) || showwarning == 1) {
                scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning("movementDisabled", occupants, vehicle function_d93ec4635290febd());
            }
            if (vehicle hascomponent("p2p") && !istrue(var_f4942f1848b5b6ca)) {
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71e0
// Size: 0x93
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x727b
// Size: 0xd7
function vehicle_occupancy_allowmovementplayer(vehicle, player, bool, seatid) {
    if (bool) {
        if (istrue(player.vehicledisabledmovement)) {
            if (player _isalive()) {
                player val::reset_all("vehicle_occupancy");
            }
            player.vehicledisabledmovement = undefined;
        }
        return;
    }
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x735a
// Size: 0x41
function vehicle_occupancy_clearallowmovementplayer(player, fromdeath) {
    if (!istrue(fromdeath) && istrue(player.vehicledisabledmovement)) {
        player val::reset_all("vehicle_occupancy");
    }
    player.vehicledisabledmovement = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73a3
// Size: 0x29
function vehicle_occupancy_movementisallowed(vehicle) {
    return !isdefined(vehicle.movementdisabled) || vehicle.movementdisabled <= 0;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x73d5
// Size: 0x56
function function_ac0a3326d43eb8fd() {
    vehicle_occupancy_allowmovement(self, 0, 0);
    scripts\cp_mp\vehicles\vehicle_occupancy::function_d0092c44c5588870();
    if (self vehicle_isphysveh()) {
        self function_65aa053c077c003a(1);
    }
    self.islocked = 1;
    occupants = function_efa75aa7f0a1289(self);
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning("locked", occupants, function_d93ec4635290febd());
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7433
// Size: 0x5c
function function_474237292e64417e() {
    vehicle_occupancy_allowmovement(self, 1, 0);
    scripts\cp_mp\vehicles\vehicle_occupancy::function_7c81e0d41cbbce7f();
    scripts\cp_mp\vehicles\vehicle_occupancy::function_9e710c9f3a15ffda();
    if (self vehicle_isphysveh()) {
        self function_65aa053c077c003a(0);
    }
    self.islocked = undefined;
    occupants = function_efa75aa7f0a1289(self);
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning("locked", occupants, function_d93ec4635290febd());
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7497
// Size: 0x12
function function_72f871bf74995298() {
    return isdefined(self) && istrue(self.islocked);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x74b2
// Size: 0x28d
function vehicle_occupancy_getexitpositionandangles(vehicle, player, seatid, allowairexit, islaststand, specialexit) {
    exitboundinginfo = function_517f60905f08bf96(vehicle);
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle function_d93ec4635290febd(), seatid);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    if (isdefined(specialexit)) {
        exitid = seatid + specialexit;
        exitdirection = var_e2818ad39a3341b4.exitdirections[exitid];
        position = vehicle_occupancy_getexitposition(vehicle, player, exitid, exitboundinginfo, 1);
        if (isdefined(position)) {
            angles = undefined;
            if (!isdefined(var_c50b485a43752fd.animtag) || var_c50b485a43752fd.animtag != "tag_seat_0") {
                angles = vehicle_occupancy_getexitangles(vehicle, player, exitid, islaststand);
            }
            if (specialexit == "_to_roof") {
                player notify("roof_exit");
            }
            return [position, angles, specialexit, exitdirection];
        }
    }
    skipexits = 0;
    /#
        skipexits = getdvarint(@"hash_7ae0d88acb509143", 0);
    #/
    foreach (exitstruct in var_c50b485a43752fd.exitids) {
        exitid = exitstruct.exitdirection;
        exitdirection = var_e2818ad39a3341b4.exitdirections[exitid];
        if (exitdirection == "roof" || exitdirection == "dive") {
            continue;
        }
        /#
            if (skipexits > 0) {
                skipexits -= 1;
                continue;
            }
        #/
        position = vehicle_occupancy_getexitposition(vehicle, player, exitid, exitboundinginfo, allowairexit);
        if (isdefined(position)) {
            angles = undefined;
            if (!isdefined(var_c50b485a43752fd.animtag) || var_c50b485a43752fd.animtag != "tag_seat_0") {
                angles = vehicle_occupancy_getexitangles(vehicle, player, exitid, islaststand);
            }
            return [position, angles, undefined, exitdirection];
        }
    }
    if (getdvarint(@"hash_9c95c78d2efca328", 1) == 1) {
        position = function_ca069b5427d4ff47(vehicle, player);
        if (isdefined(position)) {
            return [position, undefined, undefined, "front"];
        }
    }
    return undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7748
// Size: 0xc03
function vehicle_occupancy_getexitposition(vehicle, player, exitid, exitinfo, allowairexit) {
    if (!isdefined(vehicle) || !isdefined(player) || !isdefined(exitid)) {
        assertmsg("<dev string:x98c>" + isdefined(vehicle) + "<dev string:x9a6>" + isdefined(player) + "<dev string:x9c0>" + isdefined(exitid));
        return;
    }
    data = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    if (!isdefined(data)) {
        assertmsg("<dev string:x9da>" + isdefined(data));
        return;
    }
    if (istrue(exitinfo.exitsfailed[exitid])) {
        return;
    }
    if (isdefined(exitinfo.exitpositions[exitid])) {
        return exitinfo.exitpositions[exitid];
    }
    if (!isdefined(data.exitoffsets[exitid])) {
        assertmsg("<dev string:x9f1>" + exitid + "<dev string:xa07>");
        return;
    }
    if (!isdefined(data.exitdirections[exitid])) {
        assertmsg("<dev string:xa1e>" + exitid + "<dev string:xa07>");
        return;
    }
    exitoffset = data.exitoffsets[exitid];
    exitdirection = data.exitdirections[exitid];
    /#
        if (getdvar(@"hash_6d41518ba7b7fe27", "<dev string:xa37>") != "<dev string:xa37>") {
            exitoffset = getdvarvector(@"hash_6d41518ba7b7fe27", exitoffset);
        }
    #/
    if (exitdirection == "roof" && data.roofexittype == "animated") {
        exitposition = vehicle.origin + rotatevector(exitoffset, vehicle.angles);
        exitinfo.exitpositions[exitid] = exitposition;
        return exitposition;
    }
    contents = physics_createcontents(["physicscontents_item", "physicscontents_glass", "physicscontents_vehicle", "physicscontents_vehicleclip", "physicscontents_playerclip"]);
    ignorelist = [];
    foreach (ent in vehicle getlinkedchildren(1)) {
        if (!isplayer(ent)) {
            ignorelist[ignorelist.size] = ent;
        }
    }
    ignorelist[ignorelist.size] = vehicle;
    ignorelist[ignorelist.size] = player;
    if (exitdirection == "inside" || exitdirection == "dive" || exitdirection == "roof" || exitdirection == "top") {
        caststart = vehicle.origin + rotatevector(exitoffset, vehicle.angles);
        castend = caststart;
        castend = function_fe33f8f45b65696e(player, caststart, castend, ignorelist, allowairexit, exitdirection);
        if (!isdefined(castend)) {
            exitinfo.exitsfailed[exitid] = 1;
            return;
        }
        exitinfo.exitpositions[exitid] = castend;
        return castend;
    }
    if (istrue(exitinfo.var_8f7c0dee5d7bdae)) {
        exitinfo.exitsfailed[exitid] = 1;
        return;
    }
    centertag = ter_op(vehicle tagexists("tag_body_animate"), "tag_body_animate", "tag_body");
    center = vehicle gettagorigin(centertag);
    isflipped = anglebetweenvectors(anglestoup(vehicle.angles), (0, 0, 1)) > 90;
    tiltoffset = 16;
    downoffset = 0;
    castingdown = 0;
    switch (exitdirection) {
    case #"hash_4b8799075d3a89b8": 
        var_566b4a8c9324219 = vehicle.angles[0];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        castingdown = var_33c8684fb7c8588d > 0;
        if (castingdown) {
            downoffset += abs(sin(var_566b4a8c9324219)) * (data.exitextents["front"] + 16);
            var_3e656678779cc7e9 = data.exitextents["front"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            tiltoffset += abs(cos(var_566b4a8c9324219) * var_3e656678779cc7e9);
            exitoffset = (max(exitoffset[0], tiltoffset), exitoffset[1], exitoffset[2]);
        } else {
            tiltoffset += min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            exitoffset = (max(exitoffset[0], data.exitextents["front"] + tiltoffset), exitoffset[1], exitoffset[2]);
        }
        break;
    case #"hash_5163a22eb8c03302": 
        var_566b4a8c9324219 = vehicle.angles[0];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        castingdown = var_33c8684fb7c8588d < 0;
        if (castingdown) {
            downoffset += abs(sin(var_566b4a8c9324219)) * (data.exitextents["back"] + 16);
            var_3e656678779cc7e9 = data.exitextents["back"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            tiltoffset += abs(cos(var_566b4a8c9324219) * var_3e656678779cc7e9);
            exitoffset = (min(exitoffset[0], -1 * tiltoffset), exitoffset[1], exitoffset[2]);
        } else {
            tiltoffset += min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            exitoffset = (min(exitoffset[0], -1 * (data.exitextents["back"] + tiltoffset)), exitoffset[1], exitoffset[2]);
        }
        break;
    case #"hash_c9b3133a17a3b2d0": 
        var_566b4a8c9324219 = vehicle.angles[2];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        castingdown = var_33c8684fb7c8588d < 0;
        if (castingdown) {
            downoffset += abs(sin(var_566b4a8c9324219)) * (data.exitextents["left"] + 16);
            var_3e656678779cc7e9 = data.exitextents["left"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            tiltoffset += abs(cos(var_566b4a8c9324219)) * var_3e656678779cc7e9;
            exitoffset = (exitoffset[0], max(exitoffset[1], tiltoffset), exitoffset[2]);
        } else {
            tiltoffset += min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            exitoffset = (exitoffset[0], max(exitoffset[1], data.exitextents["left"] + tiltoffset), exitoffset[2]);
        }
        break;
    case #"hash_96815ce4f2a3dbc5": 
        var_566b4a8c9324219 = vehicle.angles[2];
        if (var_566b4a8c9324219 == 90 || var_566b4a8c9324219 == 270) {
            var_33c8684fb7c8588d = 1;
        } else {
            var_33c8684fb7c8588d = tan(var_566b4a8c9324219);
        }
        castingdown = var_33c8684fb7c8588d > 0;
        if (castingdown) {
            downoffset += abs(sin(var_566b4a8c9324219)) * (data.exitextents["right"] + 16);
            var_3e656678779cc7e9 = data.exitextents["right"] + abs(var_33c8684fb7c8588d) * data.exitextents["top"];
            tiltoffset += abs(cos(var_566b4a8c9324219)) * var_3e656678779cc7e9;
            exitoffset = (exitoffset[0], min(exitoffset[1], -1 * tiltoffset), exitoffset[2]);
        } else {
            tiltoffset += min(abs(var_33c8684fb7c8588d), 1) * (data.exitextents["bottom"] + 10);
            exitoffset = (exitoffset[0], min(exitoffset[1], -1 * (data.exitextents["right"] + tiltoffset)), exitoffset[2]);
        }
        break;
    }
    angles = ter_op(castingdown, (0, vehicle.angles[1], 0), vehicle.angles);
    exitoffset = center + rotatevector((exitoffset[0], exitoffset[1], 10), angles);
    if (isflipped) {
        exitoffset += (0, 0, 20);
    }
    if (!isdefined(exitinfo.var_e076f493b3f213d9)) {
        exitinfo.var_e076f493b3f213d9 = 16;
    }
    var_e076f493b3f213d9 = exitinfo.var_e076f493b3f213d9;
    for (var_145d0dc29d9bde7 = physics_spherecast(center, exitoffset, var_e076f493b3f213d9, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1); isdefined(var_145d0dc29d9bde7) && istrue(var_145d0dc29d9bde7[1]); var_145d0dc29d9bde7 = physics_spherecast(center, exitoffset, exitinfo.var_e076f493b3f213d9, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1)) {
        if (exitinfo.var_e076f493b3f213d9 == 16) {
            exitinfo.var_e076f493b3f213d9 = 10;
            continue;
        }
        if (exitinfo.var_e076f493b3f213d9 == 10) {
            exitinfo.var_e076f493b3f213d9 = 5;
            continue;
        }
        exitinfo.var_8f7c0dee5d7bdae = 1;
        exitinfo.exitsfailed[exitid] = 1;
        return;
    }
    if (isdefined(var_145d0dc29d9bde7) && (istrue(var_145d0dc29d9bde7[1]) || isdefined(var_145d0dc29d9bde7[0]) && isdefined(var_145d0dc29d9bde7[0][0]) && isdefined(var_145d0dc29d9bde7[0][0]["position"]))) {
        /#
            finalposition = exitoffset;
            if (isdefined(var_145d0dc29d9bde7[0]) && isdefined(var_145d0dc29d9bde7[0][0]) && isdefined(var_145d0dc29d9bde7[0][0]["<dev string:xa3c>"])) {
                finalposition = var_145d0dc29d9bde7[0][0]["<dev string:xa3c>"];
            }
            if (istrue(level.var_8962097bbd2afcb4)) {
                if (isdefined(var_145d0dc29d9bde7[0]) && isdefined(var_145d0dc29d9bde7[0][0]) && isdefined(var_145d0dc29d9bde7[0][0]["<dev string:xa4e>"])) {
                    level thread function_2127168686332a93(var_145d0dc29d9bde7[0][0]["<dev string:xa4e>"], 2, 60, (1, 0, 0));
                }
                level thread function_6bb041ee1ab70e18(center, finalposition, var_e076f493b3f213d9, 60, (0, 1, 0));
            }
        #/
        exitinfo.exitsfailed[exitid] = 1;
        return;
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            level thread function_6bb041ee1ab70e18(center, exitoffset, var_e076f493b3f213d9, 60, (0, 1, 0));
        }
    #/
    var_cb94032c1755440c = exitoffset + (0, 0, 72);
    castup = physics_raycast(exitoffset, var_cb94032c1755440c, contents, ignorelist, 0, "physicsquery_closest", 1);
    if (isdefined(castup) && isdefined(castup[0]) && isdefined(castup[0]["position"])) {
        var_cb94032c1755440c = castup[0]["position"];
        /#
            if (istrue(level.var_8962097bbd2afcb4)) {
                level thread function_2127168686332a93(var_cb94032c1755440c, 2, 60, (1, 0, 0));
            }
        #/
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            level thread function_a03a1d77df140f9c(exitoffset, var_cb94032c1755440c, 60, (0, 0, 1));
        }
    #/
    finalcaststart = var_cb94032c1755440c - (0, 0, 72 + 10);
    finalcastend = var_cb94032c1755440c - (0, 0, data.exitextents["bottom"] + 125 + downoffset);
    castend = function_fe33f8f45b65696e(player, finalcaststart, finalcastend, ignorelist, allowairexit, exitdirection);
    if (!isdefined(castend)) {
        exitinfo.exitsfailed[exitid] = 1;
        return;
    }
    exitinfo.exitpositions[exitid] = castend;
    return castend;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8354
// Size: 0x4fd
function function_ca069b5427d4ff47(vehicle, player) {
    var_36ceaddaa67aa6bf = [];
    var_46b3d89477cbf92a = [];
    ignorelist = [player];
    contents = physics_createcontents(["physicscontents_item", "physicscontents_glass", "physicscontents_vehicle", "physicscontents_vehicleclip", "physicscontents_playerclip", "physicscontents_characterproxy"]);
    if (isnavmeshloaded()) {
        var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
        if (vehicle function_a24042975031e692()) {
            points = [vehicle.origin + rotatevector((0, var_e2818ad39a3341b4.exitextents["left"] + 50, 0), vehicle.angles), vehicle.origin + rotatevector((0, -1 * (var_e2818ad39a3341b4.exitextents["right"] + 50), 0), vehicle.angles), vehicle.origin + rotatevector((-1 * (var_e2818ad39a3341b4.exitextents["back"] + 50), 0, 0), vehicle.angles), vehicle.origin + rotatevector((var_e2818ad39a3341b4.exitextents["front"] + 50, 0, 0), vehicle.angles)];
        } else {
            points = [player.origin];
        }
        foreach (point in points) {
            onnavmesh = getclosestpointonnavmesh(point);
            castend = function_fe33f8f45b65696e(player, onnavmesh + (0, 0, 10), onnavmesh - (0, 0, 20), ignorelist, 1, "inside");
            if (isdefined(castend)) {
                castresults = physics_raycast(vehicle.origin, castend + (0, 0, 72 / 2), contents, [vehicle, player], 0, "physicsquery_all", 1);
                /#
                    if (istrue(level.var_8962097bbd2afcb4)) {
                        thread function_a03a1d77df140f9c(vehicle.origin, castend + (0, 0, 72 / 2), 60, ter_op(isdefined(castresults) && castresults.size > 0, (1, 0, 0), (0, 1, 1)));
                    }
                #/
                if (isdefined(castresults) && castresults.size > 0) {
                    throughwall = 0;
                    foreach (hit in castresults) {
                        if (isdefined(hit["hittype"]) && hit["hittype"] != "hittype_entity") {
                            throughwall = 1;
                            break;
                        }
                    }
                    if (throughwall) {
                        var_36ceaddaa67aa6bf[var_36ceaddaa67aa6bf.size] = castend;
                    } else {
                        var_46b3d89477cbf92a[var_46b3d89477cbf92a.size] = castend;
                    }
                    continue;
                }
                return castend;
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
        vecs = getrandomnavpoints(vehicle.origin, 800, 6);
        if (!isdefined(vecs) || vecs.size <= 0) {
            return;
        }
        nodes = [];
        foreach (vec in vecs) {
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
        var_440d4df82fbf5096 += 1;
        if (var_440d4df82fbf5096 > 5) {
            break;
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x8859
// Size: 0xa9
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x890b
// Size: 0x242
function private function_fe33f8f45b65696e(player, caststart, castend, ignorelist, allowairexit, exitdirection) {
    castfailed = 0;
    debuglinestart = undefined;
    debuglineend = undefined;
    /#
        debuglinestart = caststart;
        debuglineend = castend;
    #/
    contents = physics_createcontents(["physicscontents_item", "physicscontents_glass", "physicscontents_vehicle", "physicscontents_vehicleclip", "physicscontents_playerclip", "physicscontents_characterproxy"]);
    castresults = physics_charactercast(caststart, castend, player, 0, (0, 0, 0), contents, ignorelist, "physicsquery_closest", "physicsquery_any");
    if (isdefined(castresults) && castresults.size > 0) {
        if (castresults[1]) {
            /#
                debuglineend = debuglinestart;
            #/
            castfailed = 1;
        } else if (castresults[0].size == 0) {
            if (!istrue(allowairexit)) {
                /#
                    debuglineend = debuglinestart;
                #/
                castfailed = 1;
            } else {
                if (exitdirection != "top" && exitdirection != "roof" && exitdirection != "inside") {
                    castend += (0, 0, 40);
                }
                /#
                    debuglineend = castend;
                #/
            }
        } else {
            castend = castresults[0][0]["shape_position"];
            /#
                debuglineend = castend;
            #/
        }
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            drawframes = int(ceil(60 / level.framedurationseconds));
            thread function_dafe9f7ddcab9bf1(debuglinestart, 16, 72, undefined, (0, 1, 1), undefined, drawframes);
            thread function_a03a1d77df140f9c(debuglinestart, debuglineend, 60, (0, 1, 1));
            if (castfailed && isdefined(castresults[0][0]) && isdefined(castresults[0][0]["<dev string:xa4e>"])) {
                level thread function_2127168686332a93(castresults[0][0]["<dev string:xa4e>"], 2, 60, (1, 0, 0));
            }
        }
    #/
    if (castfailed) {
        return undefined;
    }
    /#
        if (istrue(level.var_8962097bbd2afcb4)) {
            thread function_2127168686332a93(debuglineend, 2, 60, (0, 1, 0));
        }
    #/
    return castend;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b56
// Size: 0x7d5
function function_517f60905f08bf96(vehicle) {
    exitboundinginfo = undefined;
    if (isdefined(vehicle.exitboundinginfo) && vehicle.exitboundinginfo.timestamp == gettime()) {
        exitboundinginfo = vehicle.exitboundinginfo;
    } else {
        var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
        if (isdefined(var_e2818ad39a3341b4) && isdefined(var_e2818ad39a3341b4.exitextents)) {
            assertex(isdefined(var_e2818ad39a3341b4.exitextents["<dev string:xa5a>"]), "<dev string:xa63>");
            assertex(isdefined(var_e2818ad39a3341b4.exitextents["<dev string:xaba>"]), "<dev string:xac2>");
            assertex(isdefined(var_e2818ad39a3341b4.exitextents["<dev string:xb18>"]), "<dev string:xb20>");
            assertex(isdefined(var_e2818ad39a3341b4.exitextents["<dev string:xb76>"]), "<dev string:xb7f>");
            assertex(isdefined(var_e2818ad39a3341b4.exitextents["<dev string:xbd6>"]), "<dev string:xbdd>");
            assertex(isdefined(var_e2818ad39a3341b4.exitextents["<dev string:xc32>"]), "<dev string:xc3c>");
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
                topleftfront = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xa5a>"], var_e2818ad39a3341b4.exitextents["<dev string:xb18>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xbd6>"]), angles);
                toprightfront = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xa5a>"], var_e2818ad39a3341b4.exitextents["<dev string:xb76>"], var_e2818ad39a3341b4.exitextents["<dev string:xbd6>"]), angles);
                topleftback = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xaba>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xb18>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xbd6>"]), angles);
                toprightback = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xaba>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xb76>"], var_e2818ad39a3341b4.exitextents["<dev string:xbd6>"]), angles);
                bottomleftfront = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xa5a>"], var_e2818ad39a3341b4.exitextents["<dev string:xb18>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xc32>"] * -1), angles);
                bottomrightfront = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xa5a>"], var_e2818ad39a3341b4.exitextents["<dev string:xb76>"], var_e2818ad39a3341b4.exitextents["<dev string:xc32>"] * -1), angles);
                var_2febbcb4c37b3b64 = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xaba>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xb18>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xc32>"] * -1), angles);
                var_3a64b6f876a6b09f = rotatevector((var_e2818ad39a3341b4.exitextents["<dev string:xaba>"] * -1, var_e2818ad39a3341b4.exitextents["<dev string:xb76>"], var_e2818ad39a3341b4.exitextents["<dev string:xc32>"] * -1), angles);
                points = [topleftfront, toprightfront, topleftback, toprightback, bottomleftfront, bottomrightfront, var_2febbcb4c37b3b64, var_3a64b6f876a6b09f];
                bestfront = -99999;
                bestback = 99999;
                bestleft = -99999;
                bestright = 99999;
                besttop = -99999;
                bestbot = 99999;
                var_74e1fbef334a1e72 = (0, angles[1], 0);
                foreach (point in points) {
                    point = rotatevectorinverted(point, var_74e1fbef334a1e72);
                    if (point[0] > bestfront) {
                        bestfront = point[0];
                    }
                    if (point[0] < bestback) {
                        bestback = point[0];
                    }
                    if (point[1] < bestright) {
                        bestright = point[1];
                    }
                    if (point[1] > bestleft) {
                        bestleft = point[1];
                    }
                    if (point[2] > besttop) {
                        besttop = point[2];
                    }
                    if (point[2] < bestbot) {
                        bestbot = point[2];
                    }
                }
                exitboundinginfo.orientedboxpoints["<dev string:xc94>"] = vehicle.origin + topleftfront;
                exitboundinginfo.orientedboxpoints["<dev string:xca4>"] = vehicle.origin + toprightfront;
                exitboundinginfo.orientedboxpoints["<dev string:xcb5>"] = vehicle.origin + topleftback;
                exitboundinginfo.orientedboxpoints["<dev string:xcc4>"] = vehicle.origin + toprightback;
                exitboundinginfo.orientedboxpoints["<dev string:xcd4>"] = vehicle.origin + bottomleftfront;
                exitboundinginfo.orientedboxpoints["<dev string:xce7>"] = vehicle.origin + bottomrightfront;
                exitboundinginfo.orientedboxpoints["<dev string:xcfb>"] = vehicle.origin + var_2febbcb4c37b3b64;
                exitboundinginfo.orientedboxpoints["<dev string:xd0d>"] = vehicle.origin + var_3a64b6f876a6b09f;
                exitboundinginfo.unorientedboxpoints["<dev string:xc94>"] = vehicle.origin + rotatevector((bestfront, bestleft, besttop), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<dev string:xca4>"] = vehicle.origin + rotatevector((bestfront, bestright, besttop), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<dev string:xcb5>"] = vehicle.origin + rotatevector((bestback, bestleft, besttop), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<dev string:xcc4>"] = vehicle.origin + rotatevector((bestback, bestright, besttop), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<dev string:xcd4>"] = vehicle.origin + rotatevector((bestfront, bestleft, bestbot), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<dev string:xce7>"] = vehicle.origin + rotatevector((bestfront, bestright, bestbot), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<dev string:xcfb>"] = vehicle.origin + rotatevector((bestback, bestleft, bestbot), var_74e1fbef334a1e72);
                exitboundinginfo.unorientedboxpoints["<dev string:xd0d>"] = vehicle.origin + rotatevector((bestback, bestright, bestbot), var_74e1fbef334a1e72);
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9334
// Size: 0x67
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x93a3
// Size: 0x2b1
function private vehicle_occupancy_getexitangles(vehicle, player, exitid, islaststand) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    exitboundinginfo = function_517f60905f08bf96(vehicle);
    exitposition = exitboundinginfo.exitpositions[exitid];
    var_c06551440b16249c = undefined;
    ignorelos = 0;
    if (istrue(islaststand)) {
        var_c06551440b16249c = vehicle.origin + rotatevector(var_e2818ad39a3341b4.exitoffsets[exitid], vehicle.angles);
        ignorelos = 1;
    }
    if (!isdefined(var_c06551440b16249c)) {
        var_c06551440b16249c = player getvieworigin() + anglestoforward(player getplayerangles()) * 550;
    }
    viewposition = undefined;
    if (istrue(islaststand)) {
        viewposition = exitposition + (0, 0, 22);
    } else {
        viewposition = exitposition + (0, 0, 60);
    }
    viewdirection = vectornormalize(var_c06551440b16249c - viewposition);
    if (!ignorelos) {
        contents = physics_createcontents(["physicscontents_vehicle", "physicscontents_item"]);
        castresults = physics_raycast(viewposition, viewposition + viewdirection * 300, contents, undefined, 0, "physicsquery_closest", 1);
        if (isdefined(castresults) && castresults.size > 0) {
            hitent = castresults[0]["entity"];
            viewblocked = 0;
            if (isdefined(hitent)) {
                hitlist = vehicle getlinkedchildren(1);
                if (!isdefined(hitlist)) {
                    hitlist = [];
                }
                hitlist[hitlist.size] = vehicle;
                foreach (ent in hitlist) {
                    if (hitent == ent) {
                        viewblocked = 1;
                        break;
                    }
                }
            }
            if (viewblocked) {
                exitdirection = var_e2818ad39a3341b4.exitdirections[exitid];
                angles = (0, vehicle.angles[1], 0);
                if (exitdirection == "left" || exitdirection == "right") {
                    canceldirection = anglestoright(angles);
                } else {
                    canceldirection = anglestoforward(angles);
                }
                viewdirection -= canceldirection * vectordot(viewdirection, canceldirection);
            }
        }
    }
    viewangles = vectortoangles(viewdirection);
    viewangles = (clamp(viewangles[0], -12, 12), viewangles[1], 0);
    return viewangles;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x965d
// Size: 0x17a
function private vehicle_occupancy_findplayerexit(player, vehicle, var_fc7c7a874b43a31a, var_7558f98f3236963d, data, specialexit) {
    if (!isdefined(player) || isdefined(var_7558f98f3236963d) || istrue(data.playerdeath) && !istrue(data.playerlaststand) && !istrue(data.var_d4b9aa76041ab0a9) && !istrue(data.var_e6584ec3ffc0cb7e)) {
        return 1;
    }
    /#
        function_d3f0b37c88e04e33();
    #/
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    allowairexit = istrue(var_e2818ad39a3341b4.allowairexit) || istrue(data.allowairexit) || !vehicle vehicle_isonground();
    exitdata = vehicle_occupancy_getexitpositionandangles(vehicle, player, var_fc7c7a874b43a31a, allowairexit, data.playerlaststand, specialexit);
    if (isdefined(exitdata)) {
        data.exitposition = exitdata[0];
        data.exitangles = exitdata[1];
        data.specialexit = exitdata[2];
        data.exitdirection = exitdata[3];
        data.exitoffset = rotatevectorinverted(data.exitposition - vehicle.origin, vehicle.angles);
        return 1;
    }
    return 0;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97df
// Size: 0xbc
function function_a24042975031e692() {
    if (isdefined(function_d93ec4635290febd())) {
        var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
        return (isdefined(var_e2818ad39a3341b4) && isdefined(var_e2818ad39a3341b4.exitextents) && isdefined(var_e2818ad39a3341b4.exitextents["front"]) && isdefined(var_e2818ad39a3341b4.exitextents["back"]) && isdefined(var_e2818ad39a3341b4.exitextents["left"]) && isdefined(var_e2818ad39a3341b4.exitextents["right"]) && isdefined(var_e2818ad39a3341b4.exitextents["top"]) && isdefined(var_e2818ad39a3341b4.exitextents["bottom"]));
    }
    return false;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x98a4
// Size: 0x3ca
function function_9d86fd9a89cd2702(player, vehicle, testpoint, skipmovementdirection) {
    if (!isdefined(player) || !isdefined(vehicle) || !isdefined(testpoint) || !isdefined(vehicle.origin) || !isdefined(vehicle.angles)) {
        return [undefined, undefined];
    }
    vehicleref = vehicle function_d93ec4635290febd();
    data = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getleveldataforvehicle(vehicleref);
    skipdirection = undefined;
    if (istrue(skipmovementdirection)) {
        forward = anglestoforward(vehicle.angles);
        moving = vehicle vehicle_getvelocity();
        between = math::anglebetweenvectors(forward, moving);
        if (between < 45) {
            skipdirection = "front";
        } else if (between > 135) {
            skipdirection = "back";
        }
    }
    exits = [];
    foreach (ref, offset in data.exitoffsets) {
        dir = data.exitdirections[ref];
        if (is_equal(skipdirection, dir) || dir == "dive" || dir == "roof") {
            continue;
        }
        exit = spawnstruct();
        exit.ref = ref;
        exit.dir = dir;
        exit.origin = vehicle.origin + rotatevector(offset, vehicle.angles);
        exits[exits.size] = exit;
    }
    exits = sortbydistance(exits, testpoint);
    exitboundinginfo = function_517f60905f08bf96(vehicle);
    isinside = istrue(vehicle function_f3bb4f4911a1beb2(vehicleref, "isInInterior", player));
    foreach (exit in exits) {
        exitinside = exit.dir == "top" || exit.dir == "inside";
        if (exitinside != isinside) {
            continue;
        }
        position = vehicle_occupancy_getexitposition(vehicle, player, exit.ref, exitboundinginfo, 1);
        if (isdefined(position)) {
            return [position, exit.dir];
        }
    }
    foreach (exit in exits) {
        exitinside = exit.dir == "top" || exit.dir == "inside";
        if (isinside == exitinside) {
            continue;
        }
        position = vehicle_occupancy_getexitposition(vehicle, player, exit.ref, exitboundinginfo, 1);
        if (isdefined(position)) {
            return [position, exit.dir];
        }
    }
    if (getdvarint(@"hash_9c95c78d2efca328", 1) == 1) {
        position = function_ca069b5427d4ff47(vehicle, player);
        if (isdefined(position)) {
            return [position, undefined, undefined, "front"];
        }
    }
    return [undefined, undefined];
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x9c77
// Size: 0x2c2
function vehicle_occupancy_moveplayertoexit(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (!isdefined(player) || istrue(data.playerdeath) && !istrue(data.playerlaststand) && !istrue(data.var_d4b9aa76041ab0a9) && !istrue(data.var_f276d4e53593ec9a) || isdefined(var_7558f98f3236963d)) {
        if (isdefined(player) && !isdefined(var_7558f98f3236963d)) {
            function_c9b87beb89ec12e2(player, vehicle, !isdefined(var_7558f98f3236963d));
            player val::reset_all("vehicle_roof_exit");
            player val::reset_all("vehicle_occupant_common");
        }
        return 1;
    }
    var_12ae002f8d36036f = undefined;
    if (isdefined(data.exitoffset)) {
        var_12ae002f8d36036f = vehicle.origin + rotatevector(data.exitoffset, vehicle.angles);
    }
    if (isdefined(var_12ae002f8d36036f) && function_136fea30dbedce0f(vehicle, player, var_12ae002f8d36036f)) {
        exitposition = var_12ae002f8d36036f;
    } else {
        exitposition = data.exitposition;
    }
    if (isdefined(exitposition)) {
        if (isdefined(data.specialexit)) {
            if (data.specialexit == "_to_roof") {
                function_aea8bd0571b7a840(player, vehicle, seatid, data);
            } else {
                player function_2e8de69e35a63f1d();
                player leavevehicle(0, 1);
                player val::reset_all("vehicle_roof_exit");
                player val::reset_all("vehicle_occupant_common");
            }
        } else {
            function_c9b87beb89ec12e2(player, vehicle, !isdefined(var_7558f98f3236963d));
            if (!isdefined(player.sessionstate) || player.sessionstate != "spectator") {
                player dontinterpolate();
                if (data.exitdirection == "inside" || data.exitdirection == "top") {
                    player function_a055801da45d769(exitposition, vehicle);
                } else {
                    player setorigin(exitposition, 1, 1);
                }
                player setstance("stand");
                /#
                    if (istrue(level.var_8962097bbd2afcb4)) {
                        drawframes = int(ceil(60 / level.framedurationseconds));
                        scripts\engine\utility::draw_capsule(exitposition, 16, 72, undefined, (1, 1, 0), undefined, drawframes);
                    }
                #/
                if (isdefined(data.exitangles)) {
                    player setplayerangles(data.exitangles);
                }
            }
            player val::reset_all("vehicle_roof_exit");
            player val::reset_all("vehicle_occupant_common");
        }
        return 1;
    }
    function_c9b87beb89ec12e2(player, vehicle, !isdefined(var_7558f98f3236963d));
    player val::reset_all("vehicle_roof_exit");
    player val::reset_all("vehicle_occupant_common");
    return 0;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x9f41
// Size: 0x152
function private function_aea8bd0571b7a840(player, vehicle, seatid, data) {
    vehicleref = vehicle function_d93ec4635290febd();
    var_2e7b44e2b456f504 = vehicle_occupancy_getleveldataforvehicle(vehicleref);
    if (var_2e7b44e2b456f504.roofexittype == "animated") {
        finalposition = player function_e5d1ae0cf82e3e7a() + (0, 0, 18);
    } else {
        offset = var_2e7b44e2b456f504.exitoffsets[seatid + "_to_roof"];
        finalposition = vehicle.origin + rotatevector(offset, vehicle.angles);
    }
    function_c9b87beb89ec12e2(player, vehicle, 1);
    player thread vehicle_preventplayercollisiondamagefortimeafterexit(vehicle, player);
    stance = ter_op(var_2e7b44e2b456f504.roofexittype == "stand_up", "stand", "crouch");
    if (isbot(player)) {
        player botsetstance(stance);
    }
    player setstance(stance, 1, 1, 1);
    player dontinterpolate();
    player function_a055801da45d769(finalposition, vehicle);
    player val::reset_all("vehicle_occupant_common");
    player val::reset_all("vehicle_roof_exit");
}

/#

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa09b
    // Size: 0x59
    function function_bd0403ba33ab8b6c(startingposition, angles) {
        self notify("<dev string:xd20>");
        self endon("<dev string:xd20>");
        while (true) {
            iprintlnbold("<dev string:xd3b>" + rotatevector(self.origin - startingposition, angles) - (0, 0, 18));
            waitframe();
        }
    }

#/

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xa0fc
// Size: 0x15d
function private function_c5819749db1604f5(player, vehicle, seatid, data) {
    vehicleref = vehicle function_d93ec4635290febd();
    var_2e7b44e2b456f504 = vehicle_occupancy_getleveldataforvehicle(vehicleref);
    if (!isdefined(var_2e7b44e2b456f504.roofexittype)) {
        assertmsg("<dev string:xd3f>");
        return;
    }
    vehicle thread function_7f925d6914fa15cc(8000);
    if (var_2e7b44e2b456f504.roofexittype == "animated") {
        player endon("death_or_disconnect");
        player endon("last_stand_start");
        player endon("enter_live_ragdoll");
        player endon("vehicle_roof_exit_collision_detected");
        player endon("interrupt_roof_exit");
        vehicle endon("death");
        player val::set_array("vehicle_roof_exit", ["script_weapon_switch", "weapon_switch", "melee", "vehicle_seat_switch", "allow_movement"], 0);
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa262
// Size: 0x167
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
    self removecomponent("player");
    self addcomponent("p2p");
    maxspeed = self vehicle_getspeed();
    endtime = gettime() + time;
    while (gettime() < endtime && istrue(self.var_6179b2eea75dbfe0) && self vehicle_getspeed() > 5) {
        self function_77320e794d35465a("p2p", "manualSpeed", scripts\engine\utility::mph_to_ips(min(maxspeed, self vehicle_getspeed())));
        self function_77320e794d35465a("p2p", "goalPoint", self.origin + anglestoforward(self.angles) * 2000);
        waitframe();
    }
    if (!istrue(self.var_6179b2eea75dbfe0)) {
        return;
    }
    function_9a816e66a02ddb40();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa3d1
// Size: 0x2a
function private function_9a816e66a02ddb40() {
    self.var_6179b2eea75dbfe0 = undefined;
    self function_77320e794d35465a("p2p", "manualSpeed", 0);
    self removecomponent("p2p");
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa403
// Size: 0x35
function vehicle_occupancy_getexitcastcontents() {
    return physics_createcontents(["physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle", "physicscontents_playerclip"]);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa441
// Size: 0x54
function vehicle_occupancy_getexitcastignorelist(vehicle) {
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(vehicle function_d93ec4635290febd());
    ignorelist = [vehicle];
    if (isdefined(var_e2818ad39a3341b4.exitignorelistcallback)) {
        ignorelist = [[ var_e2818ad39a3341b4.exitignorelistcallback ]](vehicle);
    }
    return ignorelist;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa49e
// Size: 0x23
function vehicle_occupancy_watchmovefeedback(driverseatid) {
    self endon("death");
    while (true) {
        vehicle_occupancy_updatemovefeedback(driverseatid);
        waitframe();
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa4c9
// Size: 0x15b
function vehicle_occupancy_updatemovefeedback(driverseatid) {
    driver = vehicle_occupancy_getseatoccupant(self, driverseatid);
    occupants = vehicle_occupancy_getalloccupants(self);
    if (isdefined(driver)) {
        driverinput = driver getnormalizedmovement()[0];
        if (abs(driverinput) > 0.15) {
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
        return;
    }
    if (isdefined(occupants)) {
        foreach (occupant in occupants) {
            if (occupant _isalive()) {
                occupant vehicle_occupancy_stopmovefeedbackforplayer();
            }
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa62c
// Size: 0x2d
function vehicle_occupancy_startmovefeedbackforplayer() {
    if (istrue(self.vehiclemoveshakeenabled)) {
        return;
    }
    self.vehiclemoveshakeenabled = 1;
    self setscriptablepartstate("vehicleMoveShake", "active1", 0);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa661
// Size: 0x2c
function vehicle_occupancy_stopmovefeedbackforplayer() {
    if (!istrue(self.vehiclemoveshakeenabled)) {
        return;
    }
    self.vehiclemoveshakeenabled = undefined;
    self setscriptablepartstate("vehicleMoveShake", "neutral", 0);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa695
// Size: 0x282
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
    damagefeedbacktype = undefined;
    damagefeedbackgroup = undefined;
    switch (data.meansofdeath) {
    case #"hash_571e46e17a3cf2e3":
    case #"hash_5f1054c48d66fd1c":
    case #"hash_66cb246f3e55fbe2":
    case #"hash_966768b3f0c94767":
    case #"hash_a86d8c43482948a4":
    case #"hash_c22b13f81bed11f0": 
        damagefeedbacktype = "light";
        damagefeedbackgroup = var_e2818ad39a3341b4.damagefeedbackgrouplight;
        break;
    case #"hash_3c20f39c73a1422b":
    case #"hash_a911a1880d996edb":
    case #"hash_b1078ff213fddba6": 
        damagefeedbacktype = "heavy";
        damagefeedbackgroup = var_e2818ad39a3341b4.damagefeedbackgroupheavy;
        break;
    }
    if (!isdefined(damagefeedbacktype)) {
        return;
    }
    if (!isdefined(damagefeedbackgroup) || damagefeedbackgroup == "none") {
        return;
    }
    players = [];
    if (damagefeedbackgroup == "driver") {
        foreach (seatid, var_c50b485a43752fd in var_e2818ad39a3341b4.seatdata) {
            if (!isdefined(var_c50b485a43752fd.animtag)) {
                continue;
            }
            if (var_c50b485a43752fd.animtag == "tag_seat_0") {
                players = [vehicle_occupancy_getseatoccupant(self, seatid)];
                break;
            }
        }
    } else if (damagefeedbackgroup == "all") {
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
        if (damagefeedbacktype == "light") {
            player thread vehicle_occupancy_lightdamagefeedbackforplayer();
            continue;
        }
        if (damagefeedbacktype == "heavy") {
            player thread vehicle_occupancy_heavydamagefeedbackforplayer();
        }
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa91f
// Size: 0x72
function vehicle_occupancy_lightdamagefeedbackforplayer() {
    self endon("disconnect");
    self endon("vehicle_occupancy_clearLightDamageFeedbackPlayer");
    if (!isdefined(self.vehiclelightdamagefeedbackid)) {
        self.vehiclelightdamagefeedbackid = 1;
    }
    self setscriptablepartstate("vehicleDamageShakeLight", "active" + self.vehiclelightdamagefeedbackid, 0);
    self.vehiclelightdamagefeedbackid = 1 + mod(self.vehiclelightdamagefeedbackid + 1, 3);
    wait 0.15;
    thread vehicle_occupancy_clearlightdamagefeedbackplayer();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa999
// Size: 0x26
function vehicle_occupancy_clearlightdamagefeedbackplayer() {
    self notify("vehicle_occupancy_clearLightDamageFeedbackPlayer");
    self setscriptablepartstate("vehicleDamageShakeLight", "neutral", 0);
    self.vehiclelightdamagefeedbackid = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9c7
// Size: 0x72
function vehicle_occupancy_heavydamagefeedbackforplayer() {
    self endon("disconnect");
    self endon("vehicle_occupancy_clearHeavyDamageFeedbackPlayer");
    if (!isdefined(self.vehicleheavydamagefeedbackid)) {
        self.vehicleheavydamagefeedbackid = 1;
    }
    self setscriptablepartstate("vehicleDamageShakeHeavy", "active" + self.vehicleheavydamagefeedbackid, 0);
    self.vehicleheavydamagefeedbackid = 1 + mod(self.vehicleheavydamagefeedbackid + 1, 3);
    wait 0.3;
    thread vehicle_occupancy_clearheavydamagefeedbackplayer();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa41
// Size: 0x26
function vehicle_occupancy_clearheavydamagefeedbackplayer() {
    self notify("vehicle_occupancy_clearHeavyDamageFeedbackPlayer");
    self setscriptablepartstate("vehicleDamageShakeHeavy", "neutral", 0);
    self.vehicleheavydamagefeedbackid = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa6f
// Size: 0x10
function vehicle_occupancy_cleardamagefeedbackforplayer() {
    vehicle_occupancy_clearlightdamagefeedbackplayer();
    vehicle_occupancy_clearheavydamagefeedbackplayer();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaa87
// Size: 0x139
function vehicle_occupancy_giveturret(player, vehicle, objweapon, var_26ea07f74a18905d) {
    player endon("disconnect");
    player endon("takeTurret");
    player endon("death");
    var_91cd55d06b5ad113 = player function_793f941d7dff15ed();
    function_c9b87beb89ec12e2(player, vehicle);
    if (var_91cd55d06b5ad113) {
        waitframe();
    }
    player scripts\common\values::set("vehicle_turret", "unresolved_collisions", 0);
    player scripts\common\values::set("vehicle_turret", "killstreaks", 0);
    if (vehicle function_80d84f556cc8017a()) {
        player scripts\common\values::set("vehicle_turret", "fire", 0);
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
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
        if (istrue(var_26ea07f74a18905d)) {
            player domonitoredweaponswitch(objweapon, 1, 1);
        } else {
            player childthread domonitoredweaponswitch(objweapon, 1, 1);
        }
    }
    player controlturreton(turret);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xabc8
// Size: 0x178
function vehicle_occupancy_taketurret(player, vehicle, objweapon, data, shouldtimeout) {
    if (isdefined(data.raceendon)) {
        data endon(data.raceendon);
    }
    if (istrue(shouldtimeout)) {
        childthread vehicle_occupancy_givetaketurrettimeout(data, 1.5);
    }
    player scripts\common\values::reset_all("vehicle_turret");
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        player setclientomnvar("ui_br_inventory_disabled", 0);
    }
    player notify("takeTurret");
    if (player hasweapon(objweapon)) {
        result = undefined;
        thread vehicle_occupancy_clearforceweaponswitchallowed(player);
        if (player isswitchingtoweaponwithmonitoring(objweapon)) {
            assert(player getcurrentweapon().basename != objweapon);
            player abortmonitoredweaponswitch(makeweapon(objweapon));
            result = 1;
        } else {
            turret = vehicle_getturretbyweapon(vehicle, objweapon);
            if (isdefined(turret)) {
                player controlturretoff(turret);
            }
            if (player hasweapon(objweapon)) {
                holdingweapon = player iscurrentweapon(objweapon);
                if (holdingweapon) {
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xad48
// Size: 0x30
function vehicle_occupancy_givetaketurrettimeout(data, timeout) {
    wait timeout;
    data.success = 0;
    data notify(data.raceendnotify);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad80
// Size: 0x33
function vehicle_occupancy_clearforceweaponswitchallowed(player) {
    player notify("vehicle_occupancy_forceWeaponSwitchAllowed");
    if (player val::get("weapon_switch")) {
        player enableweaponswitch();
        return;
    }
    player disableweaponswitch();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xadbb
// Size: 0xc2
function vehicle_occupancy_ejectalloccupants(vehicle) {
    if (vehicle scripts\cp_mp\vehicles\vehicle::isvehiclehusk()) {
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xae85
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaf78
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
    thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_giveturret(self, vehicle, weaponname);
    vehicle.var_ecc491f42aaceaf4 = 1;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb00c
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0b5
// Size: 0x9b
function vehicle_occupancy_getoccupantrestrictions() {
    allows = ["crouch", "prone", "sprint", "mantle", "mount_top", "mount_side", "vehicle_use", "crate_use", "ladder_placement", "execution_attack", "execution_victim", "usability"];
    if (getdvarint(@"hash_6c68604cd07d358", 0) == 1) {
        allows[allows.size] = "offhand_weapons";
    }
    return allows;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb159
// Size: 0x5d
function vehicle_occupancy_getdriverrestrictions() {
    return ["usability", "offhand_weapons", "melee", "fire", "reload", "autoreload", "weapon_switch", "cough_gesture", "armor", "killstreaks"];
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1bf
// Size: 0x54
function function_b9cc4ad5c15d3cee() {
    return ["usability", "offhand_weapons", "melee", "reload", "autoreload", "weapon_switch", "cough_gesture", "armor", "killstreaks"];
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb21c
// Size: 0xc
function vehicle_occupancy_getcombatpassengerrestrictions() {
    return ["weapon_pickup"];
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb231
// Size: 0x15
function vehicle_occupancy_getcombatcabpassengerrestrictions() {
    restrictions = vehicle_occupancy_getcombatpassengerrestrictions();
    return restrictions;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb24f
// Size: 0x8
function vehicle_occupancy_getpassivepassengerrestrictions() {
    return vehicle_occupancy_getdriverrestrictions();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb260
// Size: 0x43
function vehicle_occupancy_getturretpassengerrestrictions() {
    restrictions = vehicle_occupancy_getcombatpassengerrestrictions();
    restrictions[restrictions.size] = "cough_gesture";
    restrictions[restrictions.size] = "offhand_weapons";
    restrictions[restrictions.size] = "armor";
    restrictions[restrictions.size] = "killstreaks";
    return array_remove_duplicates(restrictions);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb2ac
// Size: 0xbe
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
        wait 0.05;
    }
    thread vehicle_occupancy_cleardisablefirefortime(player);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb372
// Size: 0x52
function vehicle_occupancy_cleardisablefirefortime(player, fromdeath) {
    player notify("vehicle_occupancy_disableFireForTime");
    if (isdefined(player.vehicledisablefire)) {
        if (!istrue(fromdeath)) {
            player val::reset_all("vehicleDisableFire");
        }
    }
    player.vehicledisablefire = undefined;
    player.vehicledisablefireendtime = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb3cc
// Size: 0x44
function vehicle_occupancy_takeriotshield(player, vehicle, var_7558f98f3236963d) {
    if (issharedfuncdefined("vehicle_occupancy", "takeRiotShield")) {
        [[ getsharedfunc("vehicle_occupancy", "takeRiotShield") ]](player, vehicle, var_7558f98f3236963d);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb418
// Size: 0x44
function vehicle_occupancy_giveriotshield(player, fromdeath, fromlaststand) {
    if (issharedfuncdefined("vehicle_occupancy", "giveRiotShield")) {
        [[ getsharedfunc("vehicle_occupancy", "giveRiotShield") ]](player, fromdeath, fromlaststand);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb464
// Size: 0x44
function vehicle_occupancy_updateriotshield(player, vehicle, var_7558f98f3236963d) {
    if (issharedfuncdefined("vehicle_occupancy", "updateRiotShield")) {
        [[ getsharedfunc("vehicle_occupancy", "updateRiotShield") ]](player, vehicle, var_7558f98f3236963d);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb4b0
// Size: 0x4d
function vehicle_occupancy_hidecashbag(vehicle, seatid, player, data) {
    if (issharedfuncdefined("vehicle_occupancy", "hideCashBag")) {
        [[ getsharedfunc("vehicle_occupancy", "hideCashBag") ]](vehicle, seatid, player, data);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb505
// Size: 0x4d
function vehicle_occupancy_showcashbag(vehicle, seatid, player, data) {
    if (issharedfuncdefined("vehicle_occupancy", "showCashBag")) {
        [[ getsharedfunc("vehicle_occupancy", "showCashBag") ]](vehicle, seatid, player, data);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb55a
// Size: 0x53
function vehicle_occupancy_registersentient(vehicle) {
    if (isdefined(vehicle.sentientdisabled) && vehicle.sentientdisabled > 0) {
        return;
    }
    if (issharedfuncdefined("vehicle_occupancy", "registerSentient")) {
        [[ getsharedfunc("vehicle_occupancy", "registerSentient") ]](vehicle);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5b5
// Size: 0x32
function vehicle_occupancy_unregistersentient(vehicle) {
    if (issharedfuncdefined("vehicle_occupancy", "unregisterSentient")) {
        [[ getsharedfunc("vehicle_occupancy", "unregisterSentient") ]](vehicle);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5ef
// Size: 0x32
function vehicle_occupancy_issentient(vehicle) {
    if (issharedfuncdefined("vehicle_occupancy", "isSentient")) {
        return [[ getsharedfunc("vehicle_occupancy", "isSentient") ]](vehicle);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb629
// Size: 0x91
function vehicle_occupancy_allowsentient(bool) {
    if (bool) {
        assert(isdefined(self.sentientdisabled) && self.sentientdisabled > 0, "<dev string:xd7e>");
        self.sentientdisabled--;
        if (self.sentientdisabled == 0) {
            vehicle_occupancy_registersentient(self);
        }
        return;
    }
    if (!isdefined(self.sentientdisabled)) {
        self.sentientdisabled = 0;
    }
    self.sentientdisabled++;
    if (self.sentientdisabled == 1) {
        vehicle_occupancy_unregistersentient(self);
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb6c2
// Size: 0xee
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb7b9
// Size: 0x91
function vehicle_occupancy_linkseatcorpse(corpse, vehicle, var_6126d8436c986baf) {
    if (vehicle tagexists(var_6126d8436c986baf)) {
        corpse enablelinkto();
        corpse linkto(vehicle, var_6126d8436c986baf);
        return;
    }
    var_c50b485a43752fd = vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, var_6126d8436c986baf);
    if (isdefined(var_c50b485a43752fd.animtag)) {
        corpse enablelinkto();
        corpse linkto(vehicle, var_c50b485a43752fd.animtag);
        return;
    }
    corpse enablelinkto();
    corpse linkto(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb852
// Size: 0x85
function vehicle_occupancy_assignseatcorpse(corpse, vehicle, var_6126d8436c986baf, var_f9e25038fed22bf0) {
    assertex(!istrue(vehicle.isdestroyed), "<dev string:xde6>");
    if (!isdefined(vehicle.corpses)) {
        vehicle.corpses = [];
    }
    vehicle_occupancy_deleteseatcorpse(vehicle, var_6126d8436c986baf, 0);
    vehicle.corpses[var_6126d8436c986baf] = corpse;
    if (!var_f9e25038fed22bf0) {
        corpse.dontdeleteonseatenter = 1;
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb8df
// Size: 0x54
function vehicle_occupancy_clearseatcorpse(corpse, vehicle, var_6126d8436c986baf) {
    if (isdefined(vehicle.corpses) && isdefined(vehicle.corpses[var_6126d8436c986baf])) {
        vehicle.corpses[var_6126d8436c986baf] = undefined;
    }
    corpse.dontdeleteonseatenter = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb93b
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb9d2
// Size: 0x7f
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba59
// Size: 0xa4
function vehicle_occupancy_allowspawninto(vehicle, bool) {
    if (istrue(vehicle.isdestroyed) || !isdefined(vehicle.occupants)) {
        vehicle.preventspawninto = undefined;
        return;
    }
    if (bool) {
        assert(isdefined(vehicle.preventspawninto) && vehicle.preventspawninto > 0, "<dev string:xe34>");
        vehicle.preventspawninto--;
        return;
    }
    if (!isdefined(vehicle.preventspawninto)) {
        vehicle.preventspawninto = 0;
    }
    vehicle.preventspawninto++;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb05
// Size: 0x50
function vehicle_occupancy_canspawninto(vehicle) {
    if (istrue(vehicle.isdestroyed) || !isdefined(vehicle.occupants)) {
        return false;
    }
    if (isdefined(vehicle.preventspawninto) && vehicle.preventspawninto > 0) {
        return false;
    }
    return true;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbb5e
// Size: 0x89
function vehicle_occupancy_generateseatswitcharray(seatid, var_ea452afa253f8034) {
    assertex(array_contains(var_ea452afa253f8034, seatid), "<dev string:xe9e>");
    var_d6d7814802640f93 = [];
    var_866452ade4626d3f = 0;
    for (i = 0; true; i++) {
        if (!var_866452ade4626d3f) {
            if (seatid == var_ea452afa253f8034[i]) {
                var_866452ade4626d3f = 1;
            }
            continue;
        }
        i = mod(i, var_ea452afa253f8034.size);
        if (seatid == var_ea452afa253f8034[i]) {
            break;
        }
        var_d6d7814802640f93[var_d6d7814802640f93.size] = var_ea452afa253f8034[i];
    }
    return var_d6d7814802640f93;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbbf0
// Size: 0x31e
function vehicle_occupancy_killoccupants(vehicle, damagedata, exitdata) {
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
            if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && istrue(occupant.isjuggernaut)) {
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
            thread vehicle_occupancy_exit(vehicle, seatid, occupant, exitdata, 1);
        }
    }
    vehicle_occupancy_deleteseatcorpses(vehicle);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbf16
// Size: 0x8e
function private function_e462819da430ac92(vehicle) {
    if (!vehicle getscriptablehaspart("stability")) {
        return;
    }
    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
    var_1d3b3a7f125be55e = scripts\engine\utility::mph_to_ips(abs(vehicle vehicle_getspeed()));
    if (occupants.size > 0) {
        vehicle utility::function_3677f2be30fdd581("stability", "stable");
        return;
    }
    if (occupants.size == 0 && var_1d3b3a7f125be55e > vehicle.var_c335ed10c38975e) {
        vehicle utility::function_3677f2be30fdd581("stability", "unstable");
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xbfac
// Size: 0xef
function private function_2700ef822671144a(vehicle, var_a0a415f8f5db022, damagedata, meansofdeath) {
    self endon("death_or_disconnect");
    origin = vehicle.origin;
    while (self function_793f941d7dff15ed()) {
        waitframe();
    }
    attacker = damagedata.attacker;
    inflictor = damagedata.inflictor;
    if (!isdefined(attacker)) {
        attacker = ter_op(isdefined(self.var_9328ded553f15d2b) && istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self, self.var_9328ded553f15d2b)), self.var_9328ded553f15d2b, self);
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

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc0a3
// Size: 0x3c6
function function_34d70aa8129b0d74() {
    self endon("death");
    ref = function_d93ec4635290febd();
    onStartRiding = getsharedfunc(ref, "onStartRiding");
    onEndRiding = getsharedfunc(ref, "onEndRiding");
    isInInterior = getsharedfunc(ref, "isInInterior");
    onEnterInterior = getsharedfunc(ref, "onEnterInterior");
    onExitInterior = getsharedfunc(ref, "onExitInterior");
    hasinterior = isdefined(isInInterior);
    self.ridingplayers = [];
    prevonground = self vehicle_isonground();
    while (true) {
        onground = self vehicle_isonground();
        var_94f44a9bf5737c52 = [];
        foreach (player in utility::playersnear(self.origin, 550)) {
            if (isdefined(player) && player _isalive() && isdefined(player.guid) && !player function_793f941d7dff15ed() && function_f5174ac9916fe7a6(player, self) && (!function_997f45f1e19b9dc9(player.origin) || player ishanging() || player ismantling())) {
                var_94f44a9bf5737c52[player.guid] = 1;
                if (!isdefined(self.ridingplayers[player.guid])) {
                    self.ridingplayers[player.guid] = player;
                    if (self.vehiclename == "veh9_palfa") {
                        player.var_c6b64cf71bf74d14 = 1;
                    }
                    [[ onStartRiding ]](player);
                    if (!onground) {
                        player vehicle_occupancy_startmovefeedbackforplayer();
                    }
                }
                if (hasinterior) {
                    ininterior = [[ isInInterior ]](player);
                    if (!istrue(player.var_1ecb70862bb22bb) && ininterior) {
                        [[ onEnterInterior ]](player);
                    } else if (istrue(player.var_1ecb70862bb22bb) && !ininterior) {
                        [[ onExitInterior ]](player);
                    }
                    player.var_1ecb70862bb22bb = ininterior;
                }
            }
        }
        foreach (guid, player in self.ridingplayers) {
            if (!istrue(var_94f44a9bf5737c52[guid])) {
                self.ridingplayers[guid] = undefined;
                if (isdefined(player.var_c6b64cf71bf74d14)) {
                    player.var_c6b64cf71bf74d14 = undefined;
                }
                [[ onEndRiding ]](player);
                if (isdefined(player)) {
                    player vehicle_occupancy_stopmovefeedbackforplayer();
                }
                if (hasinterior) {
                    if (istrue(player.var_1ecb70862bb22bb)) {
                        [[ onExitInterior ]](player);
                    }
                    if (isdefined(player)) {
                        player.var_1ecb70862bb22bb = undefined;
                    }
                }
            }
        }
        if (onground != prevonground) {
            if (!onground) {
                foreach (player in self.ridingplayers) {
                    player vehicle_occupancy_startmovefeedbackforplayer();
                }
            } else {
                foreach (player in self.ridingplayers) {
                    player vehicle_occupancy_stopmovefeedbackforplayer();
                }
            }
        }
        prevonground = onground;
        wait 0.25;
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc471
// Size: 0x85
function function_f5174ac9916fe7a6(player, vehicleplatform) {
    if (isdefined(vehicleplatform) && vehicleplatform scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        playerplatform = function_2e8745a2d6ec9fd1(player);
        if (isdefined(playerplatform) && playerplatform == vehicleplatform) {
            return true;
        }
    }
    var_e807d5178fb91a4f = player getmovingplatformparent();
    if (isdefined(vehicleplatform) && isdefined(vehicleplatform.e_navmesh) && isdefined(var_e807d5178fb91a4f) && var_e807d5178fb91a4f == vehicleplatform.e_navmesh) {
        return true;
    }
    return false;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc4ff
// Size: 0x8d
function function_2e8745a2d6ec9fd1(player) {
    if (!isdefined(player)) {
        return undefined;
    }
    vehicleplatform = player getmovingplatformparent();
    if (isdefined(vehicleplatform) && istrue(vehicleplatform.var_102945aa439b7b3d)) {
        vehicleplatform = undefined;
    }
    if (!isdefined(vehicleplatform)) {
        vehicleplatform = player getgroundentity();
        if (isdefined(vehicleplatform) && !istrue(vehicleplatform.var_102945aa439b7b3d)) {
            vehicleplatform = undefined;
        }
    }
    var_5c7e5fe501d37e4a = function_b381868642836183(player);
    if (isdefined(var_5c7e5fe501d37e4a)) {
        vehicleplatform = var_5c7e5fe501d37e4a;
    }
    if (isdefined(vehicleplatform) && !vehicleplatform scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        return undefined;
    }
    return vehicleplatform;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc595
// Size: 0x3f
function function_3dfe65e73a7d0c86(player, vehicle) {
    if (!isdefined(player)) {
        return;
    }
    if (isdefined(vehicle) && vehicle scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        player.var_8d553bc2f713d356 = vehicle;
        player thread function_7f56221b97c7a6c0();
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc5dc
// Size: 0x29
function private function_7f56221b97c7a6c0() {
    self endon("disconnect");
    self endon("disabled_force_ride");
    level endon("game_ended");
    self waittill("death");
    self.var_8d553bc2f713d356 = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc60d
// Size: 0x6b
function function_69f266af27c2689(player, vehicle) {
    if (!isdefined(player)) {
        return;
    }
    if (isdefined(vehicle) && vehicle scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        if (isreallyalive(player)) {
            player dontinterpolate();
            player function_a055801da45d769(player.origin, vehicle);
            player notify("disabled_force_ride");
            player thread vehicle_preventplayercollisiondamagefortimeafterexit(vehicle, player);
        }
    }
    player.var_8d553bc2f713d356 = undefined;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc680
// Size: 0x1d
function function_b381868642836183(player) {
    if (!isdefined(player)) {
        return undefined;
    }
    return player.var_8d553bc2f713d356;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6a6
// Size: 0xc
function function_d419e441d20e67ac() {
    return isdefined(self.enginedisabled);
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6bb
// Size: 0x55
function function_7c81e0d41cbbce7f() {
    if (!isdefined(self.enginedisabled)) {
        assertmsg(isdefined(self.enginedisabled), "<dev string:xec0>");
        return;
    }
    self.enginedisabled -= 1;
    if (self.enginedisabled <= 0) {
        self.enginedisabled = undefined;
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc718
// Size: 0x35
function function_d0092c44c5588870() {
    if (!isdefined(self.enginedisabled)) {
        self.enginedisabled = 0;
    }
    self.enginedisabled += 1;
    function_887b4e2cbe3ab92c();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc755
// Size: 0x19
function function_9e710c9f3a15ffda() {
    if (!function_d419e441d20e67ac()) {
        self vehicle_turnengineon();
        function_c01316c733e017b7();
    }
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc776
// Size: 0x10
function function_887b4e2cbe3ab92c() {
    self vehicle_turnengineoff();
    function_49eff91715ae3c1b();
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc78e
// Size: 0xef
function function_4e4cf75e0f7e4184(point) {
    if (!function_a24042975031e692()) {
        return false;
    }
    localorigin = coordtransformtranspose(point, self.origin, self.angles);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
    return localorigin[0] > var_e2818ad39a3341b4.exitextents["back"] * -1 && localorigin[0] < var_e2818ad39a3341b4.exitextents["front"] && localorigin[1] > var_e2818ad39a3341b4.exitextents["left"] * -1 && localorigin[1] < var_e2818ad39a3341b4.exitextents["right"] && localorigin[2] > var_e2818ad39a3341b4.exitextents["bottom"] * -1 && localorigin[2] < var_e2818ad39a3341b4.exitextents["top"];
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc886
// Size: 0x69
function function_997f45f1e19b9dc9(point) {
    if (!function_a24042975031e692()) {
        return false;
    }
    localorigin = coordtransformtranspose(point, self.origin, self.angles);
    var_e2818ad39a3341b4 = vehicle_occupancy_getleveldataforvehicle(function_d93ec4635290febd());
    return localorigin[2] < var_e2818ad39a3341b4.exitextents["bottom"] * -1;
}

// Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8f8
// Size: 0x2c
function vehicle_occupancy_initdebug() {
    leveldata = vehicle_occupancy_getleveldata();
    leveldata.debuginstances = [];
    /#
        thread function_866e78f157c1f5f3();
    #/
}

/#

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xc92c
    // Size: 0x309
    function function_866e78f157c1f5f3() {
        leveldata = vehicle_occupancy_getleveldata();
        wait 5;
        setdevdvarifuninitialized(@"hash_2de891db9eeac685", 0);
        setdevdvarifuninitialized(@"hash_6c296dda80496851", 0);
        setdevdvarifuninitialized(@"hash_fdf60fe90077b559", 0);
        setdevdvarifuninitialized(@"hash_a864c803709b59ce", 0);
        while (true) {
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
            if (issharedfuncdefined("<dev string:x867>", "<dev string:x883>")) {
                host = [[ getsharedfunc("<dev string:x867>", "<dev string:x883>") ]]();
            }
            if (isdefined(host)) {
                function_511060fa3b5d7a06(host);
            }
            if (getdvarint(@"hash_fdf60fe90077b559", 0) == 1) {
                setdvar(@"hash_fdf60fe90077b559", 0);
                if (isdefined(level.botvehicle) && (isdefined(level.friendlyvehiclebot) || isdefined(level.enemyvehiclebot))) {
                    bot = ter_op(isdefined(level.friendlyvehiclebot), level.friendlyvehiclebot, level.enemyvehiclebot);
                    bot botpressbutton("<dev string:xf16>");
                }
            }
            if (getdvarint(@"hash_a864c803709b59ce", 0) == 1) {
                setdvar(@"hash_a864c803709b59ce", 0);
                if (isdefined(level.botvehicle) && (isdefined(level.friendlyvehiclebot) || isdefined(level.enemyvehiclebot))) {
                    bot = ter_op(isdefined(level.friendlyvehiclebot), level.friendlyvehiclebot, level.enemyvehiclebot);
                    bot botpressbutton("<dev string:xf1e>");
                }
            }
            if (getdvarint(@"hash_6c296dda80496851", 0) == 1) {
                setdvar(@"hash_6c296dda80496851", 0);
                if (isdefined(level.botvehicle) && (isdefined(level.friendlyvehiclebot) || isdefined(level.enemyvehiclebot))) {
                    bot = ter_op(isdefined(level.friendlyvehiclebot), level.friendlyvehiclebot, level.enemyvehiclebot);
                    seatid = vehicle_occupancy_getoccupantseat(level.botvehicle, bot);
                    if (isdefined(seatid)) {
                        var_c0125690bc99343d = vehicle_occupancy_getnextavailableseat(level.botvehicle, bot, seatid);
                        if (isdefined(var_c0125690bc99343d)) {
                            vehicle_occupancy_enter(level.botvehicle, var_c0125690bc99343d, bot);
                        }
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xcc3d
    // Size: 0x152
    function function_6bdf9766fe9e319(var_67154c851970b6f1) {
        thread scripts\cp_mp\utility\debug_utility::drawboxfrompoints(var_67154c851970b6f1.orientedboxpoints["<dev string:xc94>"], var_67154c851970b6f1.orientedboxpoints["<dev string:xca4>"], var_67154c851970b6f1.orientedboxpoints["<dev string:xcb5>"], var_67154c851970b6f1.orientedboxpoints["<dev string:xcc4>"], var_67154c851970b6f1.orientedboxpoints["<dev string:xcd4>"], var_67154c851970b6f1.orientedboxpoints["<dev string:xce7>"], var_67154c851970b6f1.orientedboxpoints["<dev string:xcfb>"], var_67154c851970b6f1.orientedboxpoints["<dev string:xd0d>"], 0.05, (1, 1, 1));
        thread scripts\cp_mp\utility\debug_utility::drawboxfrompoints(var_67154c851970b6f1.unorientedboxpoints["<dev string:xc94>"], var_67154c851970b6f1.unorientedboxpoints["<dev string:xca4>"], var_67154c851970b6f1.unorientedboxpoints["<dev string:xcb5>"], var_67154c851970b6f1.unorientedboxpoints["<dev string:xcc4>"], var_67154c851970b6f1.unorientedboxpoints["<dev string:xcd4>"], var_67154c851970b6f1.unorientedboxpoints["<dev string:xce7>"], var_67154c851970b6f1.unorientedboxpoints["<dev string:xcfb>"], var_67154c851970b6f1.unorientedboxpoints["<dev string:xd0d>"], 0.05, (1, 1, 0));
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcd97
    // Size: 0xd
    function function_d3f0b37c88e04e33() {
        level notify("<dev string:xf27>");
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xcdac
    // Size: 0x3a
    function function_a03a1d77df140f9c(start, end, drawtimeseconds, color) {
        level endon("<dev string:xf27>");
        level childthread scripts\cp_mp\utility\debug_utility::drawline(start, end, drawtimeseconds, color);
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xcdee
    // Size: 0x3a
    function function_2127168686332a93(origin, radius, drawtimeseconds, color) {
        level endon("<dev string:xf27>");
        level childthread scripts\cp_mp\utility\debug_utility::drawsphere(origin, radius, drawtimeseconds, color);
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0xce30
    // Size: 0xa5
    function function_dafe9f7ddcab9bf1(pos, radius, height, angles, color, depthtest, duration) {
        level endon("<dev string:xf27>");
        drawframes = int(ceil(0.05 / level.framedurationseconds));
        endtime = gettime() + duration * 1000;
        while (gettime() < endtime) {
            level childthread scripts\engine\utility::draw_capsule(pos, radius, height, angles, color, depthtest, drawframes);
            wait 0.05;
        }
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0xcedd
    // Size: 0xe1
    function function_6bb041ee1ab70e18(origin, otherorigin, radius, drawtimeseconds, color) {
        level endon("<dev string:xf27>");
        level childthread scripts\cp_mp\utility\debug_utility::drawsphere(origin, radius, drawtimeseconds, color);
        level childthread scripts\cp_mp\utility\debug_utility::drawsphere(otherorigin, radius, drawtimeseconds, color);
        foreach (offset in [(radius, 0, 0), (-1 * radius, 0, 0), (0, radius, 0), (0, -1 * radius, 0), (0, 0, radius), (0, 0, -1 * radius)]) {
            level childthread scripts\cp_mp\utility\debug_utility::drawline(origin + offset, otherorigin + offset, drawtimeseconds, color);
        }
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xcfc6
    // Size: 0x2e1
    function function_511060fa3b5d7a06(host) {
        switchseat = 0;
        addid = getdvarint(@"hash_2de891db9eeac685", 0);
        bot = undefined;
        if (!isdefined(level.botvehicle) || istrue(level.botvehicle.isdestroyed)) {
            level.botvehicle = undefined;
        }
        if (addid == 0) {
            return;
        }
        if (isdefined(level.botvehicle)) {
            switch (addid) {
            case 1: 
                setdevdvar(@"hash_2de891db9eeac685", 0);
                bot = level.friendlyvehiclebot;
                if (isdefined(bot) && !playersareenemies(bot, host)) {
                    if (isdefined(level.botvehicle)) {
                        botvehicle = bot getvehicle();
                        if (isdefined(botvehicle)) {
                            if (botvehicle == level.botvehicle) {
                                switchseat = 1;
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
                level.friendlyvehiclebot = bot;
                break;
            case 2: 
                setdevdvar(@"hash_2de891db9eeac685", 0);
                bot = level.enemyvehiclebot;
                if (isdefined(bot) && playersareenemies(bot, host)) {
                    if (isdefined(level.botvehicle)) {
                        botvehicle = bot getvehicle();
                        if (isdefined(botvehicle)) {
                            if (botvehicle == level.botvehicle) {
                                switchseat = 1;
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
                level.enemyvehiclebot = bot;
                break;
            default: 
                return;
            }
            if (isdefined(bot)) {
                if (switchseat) {
                    function_80491ae71b928cfa(bot);
                } else {
                    function_5993e49922687515(host, bot);
                }
            } else if (addid != 0) {
                iprintln("<dev string:xf35>");
            }
        } else if (addid != 0) {
            iprintln("<dev string:xf52>");
        }
        setdevdvar(@"hash_2de891db9eeac685", 0);
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xd2af
    // Size: 0xe3
    function function_5993e49922687515(host, bot) {
        if (issharedfuncdefined("<dev string:x867>", "<dev string:x883>")) {
            host = [[ getsharedfunc("<dev string:x867>", "<dev string:x883>") ]]();
        }
        if (!isdefined(host)) {
            return 0;
        }
        vehicle = level.botvehicle;
        if (!isdefined(vehicle) || istrue(vehicle.isdestroyed)) {
            iprintln("<dev string:xf52>");
            return 0;
        }
        occupants = vehicle_occupancy_getalloccupantsandreserving(vehicle);
        hostvehicle = host getvehicle();
        if (vehicle_isenemytoplayer(vehicle, bot)) {
            if (occupants.size > 1) {
                iprintln("<dev string:xf71>");
                return 0;
            } else if (isdefined(hostvehicle) && hostvehicle == vehicle) {
                return function_62e42dbf117640e5(vehicle, bot, host);
            }
            return;
        }
        return function_40c538fb1bd10587(vehicle, bot);
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xd39a
    // Size: 0xbf
    function function_62e42dbf117640e5(vehicle, bot, host) {
        vehicle_interact_allowvehicleuse(vehicle, 0);
        thread vehicle_occupancy_ejectalloccupants(vehicle);
        while (true) {
            if (!isdefined(host)) {
                break;
            }
            if (!isdefined(bot)) {
                break;
            }
            if (!isdefined(vehicle)) {
                break;
            }
            hostvehicle = host getvehicle();
            if (!isdefined(hostvehicle) || hostvehicle != vehicle) {
                break;
            }
            waitframe();
        }
        if (!isdefined(vehicle) || istrue(vehicle.isdestroyed)) {
            iprintln("<dev string:xf8b>");
            return 0;
        } else {
            vehicle_interact_allowvehicleuse(vehicle, 1);
        }
        if (!isdefined(bot)) {
            iprintln("<dev string:xf8b>");
            return 0;
        }
        return function_40c538fb1bd10587(vehicle, bot);
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xd461
    // Size: 0x8b
    function function_80491ae71b928cfa(bot) {
        vehicle = level.botvehicle;
        if (!isdefined(vehicle) || istrue(vehicle.isdestroyed)) {
            iprintln("<dev string:xf52>");
            return 0;
        }
        seatid = vehicle_occupancy_getoccupantseat(vehicle, bot);
        var_c0125690bc99343d = vehicle_occupancy_getnextavailableseat(vehicle, bot, seatid);
        if (!isdefined(var_c0125690bc99343d)) {
            iprintln("<dev string:xfa8>");
            return 0;
        }
        thread vehicle_occupancy_enter(vehicle, var_c0125690bc99343d, bot);
        return 1;
    }

    // Namespace vehicle_occupancy / scripts\cp_mp\vehicles\vehicle_occupancy
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xd4f4
    // Size: 0xb7
    function function_40c538fb1bd10587(vehicle, bot) {
        pointrefs = function_c2f090b27fcd0e43(vehicle);
        state = function_d66fa700ce5b783();
        foreach (part in pointrefs) {
            if (isdefined(bot getvehicle())) {
                break;
            }
            vehicle_interact_scriptableused(vehicle getlinkedscriptableinstance(), part, state, bot, 0);
        }
        if (!isdefined(bot getvehicle())) {
            iprintln("<dev string:xf8b>");
            return 0;
        }
        return 1;
    }

#/
