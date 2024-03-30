// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_8c2443d2e806600c;

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e7
// Size: 0x70
function vehomn_init() {
    /#
        assertex(isdefined(level.vehicle), "vehOmn_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.omnvars), "vehOmn_init() should only be called once.");
    #/
    leveldata = spawnstruct();
    level.vehicle.omnvars = leveldata;
    leveldata.vehicledata = [];
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e
// Size: 0xde
function vehomn_setvehicle(vehicleref, clients) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref);
    id = var_e2818ad39a3341b4.id;
    /#
        assertex(isdefined(id), "levelDataForVehicle for " + vehicleref + " failed to define an ID.");
    #/
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_vehicle", id);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_vehicle", id);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x843
// Size: 0xde
function vehomn_setcurrentseat(vehicle, seatref, client) {
    if (!isdefined(client)) {
        return;
    }
    vehicleref = vehicle function_d93ec4635290febd();
    id = -1;
    if (isdefined(vehicleref)) {
        var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref);
        if (isdefined(seatref)) {
            id = var_e2818ad39a3341b4.seatids[seatref];
            var_ce438350733fad27 = vehicleref == "veh_jup_orav";
            if ((var_ce438350733fad27 || istrue(var_e2818ad39a3341b4.hasdoors) && vehicle scripts/cp_mp/vehicles/vehicle_damage::function_b9d5a379eb1aefc7(seatref)) && seatref != "gunner") {
                id = id | 16;
            }
            /#
                assertex(isdefined(id), "levelDataForVehicle for " + vehicleref + " failed to define an ID for seat " + seatref + ".");
            #/
        }
    }
    client setclientomnvar("ui_veh_current_seat", id);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x928
// Size: 0x82
function vehomn_setnextseat(vehicleref, seatref, client) {
    if (!isdefined(client)) {
        return;
    }
    id = -1;
    if (isdefined(seatref)) {
        var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref);
        id = var_e2818ad39a3341b4.seatids[seatref];
        /#
            assertex(isdefined(id), "levelDataForVehicle for " + vehicleref + " failed to define an ID for seat " + seatref + ".");
        #/
    }
    client setclientomnvar("ui_veh_next_seat", id);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b1
// Size: 0x1e4
function vehomn_setseatentity(vehicleref, seatref, seatentity, clients) {
    id = -1;
    if (isdefined(vehicleref)) {
        var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref);
        if (isdefined(seatref)) {
            id = var_e2818ad39a3341b4.seatids[seatref];
            /#
                assertex(isdefined(id), "levelDataForVehicle for " + vehicleref + " failed to define an ID for seat " + seatref + ".");
            #/
        }
    }
    omnvar = undefined;
    switch (id) {
    case 0:
        omnvar = "ui_veh_occupant_0";
        break;
    case 1:
        omnvar = "ui_veh_occupant_1";
        break;
    case 2:
        omnvar = "ui_veh_occupant_2";
        break;
    case 3:
        omnvar = "ui_veh_occupant_3";
        break;
    case 4:
        omnvar = "ui_veh_occupant_4";
        break;
    case 5:
        omnvar = "ui_veh_occupant_5";
        break;
    case 6:
        omnvar = "ui_veh_occupant_6";
        break;
    }
    /#
        assertex(isdefined(omnvar), "seatRef does not map to an omnvar.");
    #/
    var_8a36524e347d4ac2 = -1;
    if (isdefined(seatentity)) {
        var_8a36524e347d4ac2 = seatentity getentitynumber();
    }
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar(omnvar, var_8a36524e347d4ac2);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar(omnvar, var_8a36524e347d4ac2);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9c
// Size: 0x27
function vehomn_clearseatentity(vehicleref, seatref, clients) {
    vehomn_setseatentity(vehicleref, seatref, undefined, clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbca
// Size: 0xae
function vehomn_sethealthpercent(var_52616aae7b55d981, clients) {
    if (!isdefined(var_52616aae7b55d981)) {
        var_52616aae7b55d981 = 0;
    }
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_health_percent", int(var_52616aae7b55d981));
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_health_percent", int(var_52616aae7b55d981));
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7f
// Size: 0x15
function vehomn_clearhealthpercent(clients) {
    vehomn_sethealthpercent(undefined, clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9b
// Size: 0x96
function vehomn_showhealth(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_show_health", 1);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_show_health", 1);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd38
// Size: 0x94
function vehomn_hidehealth(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_show_health", 0);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_show_health", 0);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdd3
// Size: 0x23
function vehomn_clearshowhealth(clients) {
    if (false) {
        vehomn_showhealth(clients);
        return;
    }
    vehomn_hidehealth(clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd
// Size: 0xae
function vehomn_settimepercent(var_3b0524215d2eae6, clients) {
    if (!isdefined(var_3b0524215d2eae6)) {
        var_3b0524215d2eae6 = 0;
    }
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_time_percent", int(var_3b0524215d2eae6));
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_time_percent", int(var_3b0524215d2eae6));
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb2
// Size: 0x15
function vehomn_cleartimepercent(clients) {
    vehomn_settimepercent(undefined, clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xece
// Size: 0x96
function vehomn_showtime(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_show_time", 1);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_show_time", 1);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6b
// Size: 0x94
function vehomn_hidetime(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_show_time", 0);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_show_time", 0);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1006
// Size: 0x23
function vehomn_clearshowtime(clients) {
    if (false) {
        vehomn_showtime(clients);
        return;
    }
    vehomn_hidetime(clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1030
// Size: 0x42
function function_9da76b0be4b2a2d4(currentfuel, maxfuel) {
    fuelpercentage = function_f1c6c7fa7cc97826(currentfuel, maxfuel);
    occupants = scripts/cp_mp/vehicles/vehicle_occupancy::function_efa75aa7f0a1289(self);
    scripts/cp_mp/utility/vehicle_omnvar_utility::vehomn_setfuelpercent(fuelpercentage, occupants);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1079
// Size: 0x38
function function_272f4112182763bd(player, currentfuel, maxfuel) {
    fuelpercentage = function_f1c6c7fa7cc97826(currentfuel, maxfuel);
    scripts/cp_mp/utility/vehicle_omnvar_utility::vehomn_setfuelpercent(fuelpercentage, player);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10b8
// Size: 0x6a
function private function_f1c6c7fa7cc97826(currentfuel, maxfuel) {
    if (!isdefined(currentfuel)) {
        currentfuel = self.fuel;
    }
    if (!isdefined(maxfuel)) {
        maxfuel = scripts/cp_mp/vehicles/vehicle_interact::vehicle_interact_getleveldataforvehicle(self.vehiclename).maxfuel;
    }
    if (maxfuel == -1) {
        return 100;
    }
    /#
        assertex(isdefined(currentfuel) && isdefined(maxfuel), "vehOmn_getFuelPercent: Called while self.fuel or (vehicle interact level data).maxFuel is undefined");
    #/
    return currentfuel / maxfuel * 100;
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112a
// Size: 0xaf
function vehomn_setfuelpercent(var_15174a10eca23d37, clients) {
    if (!isdefined(var_15174a10eca23d37)) {
        var_15174a10eca23d37 = 100;
    }
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_fuel_percent", int(var_15174a10eca23d37));
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_fuel_percent", int(var_15174a10eca23d37));
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11e0
// Size: 0xc
function vehomn_clearfuelpercent(clients) {
    
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f3
// Size: 0x96
function vehomn_showfuel(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_show_fuel", 1);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_show_fuel", 1);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1290
// Size: 0xc
function vehomn_hidefuel(clients) {
    
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a3
// Size: 0xc
function vehomn_clearshowfuel(clients) {
    
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b6
// Size: 0x187
function vehomn_setammo(vehicleref, ammoref, ammovalue, clients) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref);
    id = var_e2818ad39a3341b4.ammoids[ammoref];
    /#
        assertex(isdefined(id), "levelDataForVehicle for " + vehicleref + " failed to define an ID for ammoRef " + ammoref + ".");
    #/
    omnvar = undefined;
    switch (id) {
    case 0:
        omnvar = "ui_veh_ammo_0";
        break;
    case 1:
        omnvar = "ui_veh_ammo_1";
        break;
    case 2:
        omnvar = "ui_veh_ammo_2";
        break;
    }
    /#
        assertex(isdefined(omnvar), "ammoRef does not map to an omnvar.");
    #/
    if (!isdefined(ammovalue)) {
        ammovalue = -1;
    } else if (isstring(ammovalue) && ammovalue == "infinite") {
        ammovalue = -2;
    }
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar(omnvar, ammovalue);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar(omnvar, ammovalue);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1444
// Size: 0x27
function vehomn_clearammo(vehicleref, ammoref, clients) {
    vehomn_setammo(vehicleref, ammoref, undefined, clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1472
// Size: 0x54
function vehomn_showammo(vehicleref, ammoref, ammovalue, clients) {
    /#
        assertex(isstring(ammovalue) || ammovalue != -1, "vehOmn_showAmmo cannot be called with a value of " + -1 + ".");
    #/
    vehomn_setammo(vehicleref, ammoref, ammovalue, clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14cd
// Size: 0x28
function vehomn_hideammo(vehicleref, ammoref, clients) {
    vehomn_setammo(vehicleref, ammoref, -1, clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fc
// Size: 0x144
function vehomn_showwarning(warningref, clients, vehicleref) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref, 1);
    id = var_e2818ad39a3341b4.warningbits[warningref];
    /#
        assertex(id < 11, "vehOmn_showWarning called with warningRef index " + id + ". Should be below " + 11 + ".");
    #/
    if (isdefined(clients)) {
        var_721785e70a9bf412 = var_e2818ad39a3341b4.warningstartcallbacks[warningref];
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvarbit("ui_veh_warning", id, 1);
                    if (isdefined(var_721785e70a9bf412)) {
                        thread [[ var_721785e70a9bf412 ]](client, "ui_veh_warning" + "_omnvar_modified");
                    }
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvarbit("ui_veh_warning", id, 1);
            if (isdefined(var_721785e70a9bf412)) {
                thread [[ var_721785e70a9bf412 ]](clients, "ui_veh_warning" + "_omnvar_modified");
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1647
// Size: 0x142
function vehomn_hidewarning(warningref, clients, vehicleref) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref, 1);
    id = var_e2818ad39a3341b4.warningbits[warningref];
    /#
        assertex(id < 11, "vehOmn_showWarning called with warningRef index " + id + ". Should be below " + 11 + ".");
    #/
    if (isdefined(clients)) {
        warningendcallback = var_e2818ad39a3341b4.warningendcallbacks[warningref];
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvarbit("ui_veh_warning", id, 0);
                    if (isdefined(warningendcallback)) {
                        thread [[ warningendcallback ]](client, "ui_veh_warning" + "_omnvar_modified");
                    }
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvarbit("ui_veh_warning", id, 0);
            if (isdefined(warningendcallback)) {
                thread [[ warningendcallback ]](clients, "ui_veh_warning" + "_omnvar_modified");
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1790
// Size: 0x18e
function vehomn_clearwarnings(clients, vehicleref) {
    if (isdefined(clients)) {
        var_e2818ad39a3341b4 = undefined;
        if (isdefined(vehicleref)) {
            var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref, undefined, 1);
        }
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar("ui_veh_warning", 0);
                    function_6f848816a946e419(client);
                    if (isdefined(var_e2818ad39a3341b4)) {
                        foreach (var_fdf4854fd7b654e7 in var_e2818ad39a3341b4.warningclearcallbacks) {
                            if (isdefined(var_fdf4854fd7b654e7)) {
                                thread [[ var_fdf4854fd7b654e7 ]](client);
                            }
                        }
                    }
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_warning", 0);
            function_6f848816a946e419(clients);
            if (isdefined(var_e2818ad39a3341b4)) {
                foreach (var_fdf4854fd7b654e7 in var_e2818ad39a3341b4.warningclearcallbacks) {
                    if (isdefined(var_fdf4854fd7b654e7)) {
                        thread [[ var_fdf4854fd7b654e7 ]](clients);
                    }
                }
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1925
// Size: 0xa2
function function_6f848816a946e419(client) {
    if (soundexists("uin_veh_warning_low_fuel")) {
        client stoplocalsound("uin_veh_warning_low_fuel");
    }
    if (soundexists("uin_veh_warning_low_fuel_heli")) {
        client stoplocalsound("uin_veh_warning_low_fuel_heli");
    }
    if (soundexists("uin_veh_warning_out_of_fuel")) {
        client stoplocalsound("uin_veh_warning_out_of_fuel");
    }
    if (soundexists("uin_veh_warning_out_of_fuel_heli")) {
        client stoplocalsound("uin_veh_warning_out_of_fuel_heli");
    }
    if (soundexists("veh_warning_missile_locking")) {
        client stoplocalsound("veh_warning_missile_locking");
    }
    if (soundexists("veh_warning_missile_incoming")) {
        client stoplocalsound("veh_warning_missile_incoming");
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ce
// Size: 0x187
function vehomn_setrotation(vehicleref, rotationref, rotationvalue, clients) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref);
    id = var_e2818ad39a3341b4.rotationids[rotationref];
    /#
        assertex(isdefined(id), "levelDataForVehicle for " + vehicleref + " failed to define an ID for rotationRef " + rotationref + ".");
    #/
    omnvar = undefined;
    switch (id) {
    case 0:
        omnvar = "ui_veh_degrees_0";
        break;
    case 1:
        omnvar = "ui_veh_degrees_1";
        break;
    }
    /#
        assertex(isdefined(omnvar), "rotationRef does not map to an omnvar.");
    #/
    if (!isdefined(rotationvalue)) {
        rotationvalue = 0;
    }
    if (isdefined(clients)) {
        remainder = rotationvalue - floor(rotationvalue);
        if (remainder >= 0.5) {
            rotationvalue = ceil(rotationvalue);
        } else {
            rotationvalue = floor(rotationvalue);
        }
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client setclientomnvar(omnvar, rotationvalue);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar(omnvar, rotationvalue);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5c
// Size: 0x27
function vehomn_clearrotation(vehicleref, rotationref, clients) {
    vehomn_setrotation(vehicleref, rotationref, undefined, clients);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8a
// Size: 0xc8
function vehomn_showcontrols(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client notify("vehOmn_modified_controls");
                    client.vehomncontrols = "show";
                    client setclientomnvar("ui_veh_controls", 1);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients notify("vehOmn_modified_controls");
            clients.vehomncontrols = "show";
            clients setclientomnvar("ui_veh_controls", 1);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c59
// Size: 0xc6
function vehomn_hidecontrols(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client notify("vehOmn_modified_controls");
                    client.vehomncontrols = "hide";
                    client setclientomnvar("ui_veh_controls", 0);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients notify("vehOmn_modified_controls");
            clients.vehomncontrols = "hide";
            clients setclientomnvar("ui_veh_controls", 0);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d26
// Size: 0x8c
function vehomn_fadeoutcontrols(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    thread vehomn_fadeoutcontrolsforclient(client);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            thread vehomn_fadeoutcontrolsforclient(clients);
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db9
// Size: 0x7f
function vehomn_fadeoutcontrolsforclient(client) {
    client endon("death_or_disconnect");
    client endon("vehOmn_modified_controls");
    if (!isdefined(client.vehomncontrols) || client.vehomncontrols != "hide" && client.vehomncontrols != "fadeOut") {
        client.vehomncontrols = "fadeOut";
        client setclientomnvar("ui_veh_controls", 2);
        wait(3);
        thread vehomn_hidecontrols(client);
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3f
// Size: 0xaa
function vehomn_clearcontrols(clients) {
    if (isdefined(clients)) {
        if (isarray(clients)) {
            foreach (client in clients) {
                if (isdefined(client) && isplayer(client)) {
                    client.vehomncontrols = undefined;
                    client setclientomnvar("ui_veh_controls", 0);
                }
            }
            return;
        }
        if (isplayer(clients)) {
            clients setclientomnvar("ui_veh_controls", 0);
            clients.vehomncontrols = undefined;
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef0
// Size: 0x43
function vehomn_controlsarefadedoutorhidden(client) {
    return !isdefined(client.vehomncontrols) || client.vehomncontrols == "fadeOut" || client.vehomncontrols == "hide";
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f3b
// Size: 0x50
function vehomn_getleveldata() {
    /#
        assertex(isdefined(level.vehicle), "vehOmn_getLevelData() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.omnvars), "vehOmn_getLevelData() called before vehOmn_init().");
    #/
    return level.vehicle.omnvars;
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f93
// Size: 0x2b9
function vehomn_getleveldataforvehicle(vehicleref, create, var_6ecb77fd1f27c667) {
    if (istrue(create) && (!function_89dc39dc11f3988c(vehicleref) || !isdefined(function_29b4292c92443328(vehicleref).occupancy) || !isdefined(function_29b4292c92443328(vehicleref).occupancy.seatids))) {
        data = undefined;
        if (function_89dc39dc11f3988c(vehicleref)) {
            data = function_29b4292c92443328(vehicleref);
        } else {
            data = spawnstruct();
        }
        if (!isdefined(data.occupancy)) {
            data.occupancy = spawnstruct();
        }
        data.occupancy.seatids = [];
        data.occupancy.ammoids = [];
        data.occupancy.rotationids = [];
        data.occupancy.warningbits = [];
        data.occupancy.warningstartcallbacks = [];
        data.occupancy.warningendcallbacks = [];
        data.occupancy.warningclearcallbacks = [];
        data.occupancy.rotationrefsbyseatandweapon = [];
        data.occupancy.warningbits["burningDown"] = 1;
        data.occupancy.warningbits["missileLocking"] = 2;
        data.occupancy.warningbits["missileIncoming"] = 4;
        data.occupancy.warningbits["movementDisabled"] = 3;
        data.occupancy.warningbits["outOfFuel"] = 6;
        data.occupancy.warningbits["lowFuel"] = 5;
        data.occupancy.warningbits["BunkerBusterAttached"] = 7;
        data.occupancy.warningbits["shockStickAttached"] = 8;
        data.occupancy.warningbits["DDoSed"] = 9;
        data.occupancy.warningbits["locked"] = 10;
        level.var_a0b2c978ca57ffc5[vehicleref] = data;
    }
    if (function_89dc39dc11f3988c(vehicleref)) {
        return function_29b4292c92443328(vehicleref).occupancy;
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2253
// Size: 0x9c
function vehomn_clearleveldataforvehicle(vehicleref, create, var_6ecb77fd1f27c667) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref, create, var_6ecb77fd1f27c667);
    if (isdefined(var_e2818ad39a3341b4)) {
        var_e2818ad39a3341b4.seatids = [];
        var_e2818ad39a3341b4.ammoids = [];
        var_e2818ad39a3341b4.rotationids = [];
        var_e2818ad39a3341b4.warningbits = [];
        var_e2818ad39a3341b4.warningstartcallbacks = [];
        var_e2818ad39a3341b4.warningendcallbacks = [];
        var_e2818ad39a3341b4.warningclearcallbacks = [];
        var_e2818ad39a3341b4.id = undefined;
    }
    return var_e2818ad39a3341b4;
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f7
// Size: 0x77
function vehomn_clearall(clients, vehicleref) {
    if (isarray(clients)) {
        foreach (client in clients) {
            vehomn_clearallinternal(client, vehicleref);
        }
        return;
    }
    vehomn_clearallinternal(clients, vehicleref);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2375
// Size: 0x145
function private vehomn_clearallinternal(client, vehicleref) {
    if (isdefined(client) && isplayer(client)) {
        client setclientomnvar("ui_veh_vehicle", -1);
        client setclientomnvar("ui_veh_current_seat", -1);
        client setclientomnvar("ui_veh_next_seat", -1);
        client setclientomnvar("ui_veh_occupant_0", -1);
        client setclientomnvar("ui_veh_occupant_1", -1);
        client setclientomnvar("ui_veh_occupant_2", -1);
        client setclientomnvar("ui_veh_occupant_3", -1);
        client setclientomnvar("ui_veh_occupant_4", -1);
        client setclientomnvar("ui_veh_occupant_5", -1);
        client setclientomnvar("ui_veh_occupant_6", -1);
        client setclientomnvar("ui_veh_health_percent", 0);
        client setclientomnvar("ui_veh_show_health", 0);
        client setclientomnvar("ui_veh_time_percent", 0);
        client setclientomnvar("ui_veh_show_time", 0);
        client setclientomnvar("ui_veh_fuel_percent", 100);
        client setclientomnvar("ui_veh_show_fuel", 0);
        client setclientomnvar("ui_veh_ammo_0", -1);
        client setclientomnvar("ui_veh_ammo_1", -1);
        vehomn_clearwarnings(client, vehicleref);
        client setclientomnvar("ui_veh_degrees_0", 0);
        client setclientomnvar("ui_veh_degrees_1", 0);
        vehomn_clearcontrols(client);
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c1
// Size: 0x463
function vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, var_7558f98f3236963d, player) {
    vehomn_setvehicle(vehicle.vehiclename, player);
    vehomn_setcurrentseat(vehicle, var_7558f98f3236963d, player);
    var_94d4410a7169a784 = "uin_veh_warning_low_fuel";
    var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel";
    if (istrue(vehicle scripts/common/vehicle::ishelicopter())) {
        var_94d4410a7169a784 = "uin_veh_warning_low_fuel_heli";
        var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel_heli";
    }
    everyone = function_efa75aa7f0a1289(vehicle);
    if (isdefined(var_fc7c7a874b43a31a)) {
        vehomn_clearseatentity(vehicle.vehiclename, var_fc7c7a874b43a31a, everyone);
    } else {
        foreach (seatid, occupant in vehicle_occupancy_getalloccupants(vehicle)) {
            if (isdefined(occupant) && occupant != player) {
                vehomn_setseatentity(vehicle.vehiclename, seatid, occupant, player);
            }
        }
    }
    vehomn_setseatentity(vehicle.vehiclename, var_7558f98f3236963d, player, everyone);
    vehomn_updatenextseatomnvars(vehicle);
    if (vehicle.health < vehicle.maxhealth) {
        vehomn_updateomnvarsondamage(vehicle);
    }
    if (scripts/cp_mp/vehicles/vehicle_interact::function_a717a31ae35ba01c() && isdefined(vehicle.fuel)) {
        vehicle vehomn_showfuel(player);
        vehicle function_272f4112182763bd(player);
    }
    vehomn_showcontrols(player);
    veh_updateomnvarsperframeforclient(vehicle, player, var_7558f98f3236963d);
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicle.vehiclename);
    if (istrue(vehicle.var_15c05fe1c0f6de03)) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["BunkerBusterAttached"])) {
            vehomn_showwarning("BunkerBusterAttached", player, vehicle.vehiclename);
        }
    }
    if (scripts/cp_mp/utility/weapon_utility::islockedonto(vehicle)) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["missileLocking"])) {
            vehomn_showwarning("missileLocking", player, vehicle.vehiclename);
        }
    }
    if (scripts/cp_mp/utility/weapon_utility::hasincoming(vehicle)) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["missileIncoming"])) {
            vehomn_showwarning("missileIncoming", player, vehicle.vehiclename);
        }
    }
    if (!scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_movementisallowed(vehicle)) {
        if (istrue(vehicle.islocked)) {
            if (isdefined(var_e2818ad39a3341b4.warningbits["locked"])) {
                vehomn_showwarning("locked", player, vehicle.vehiclename);
            }
        } else if (vehicle scripts/cp_mp/emp_debuff::is_empd() && !isdefined(vehicle.ksempd)) {
            vehomn_showwarning("DDoSed", player, vehicle.vehiclename);
        } else if (isdefined(vehicle.fuel) && vehicle.fuel <= 0 && isdefined(var_e2818ad39a3341b4.warningbits["outOfFuel"])) {
            vehomn_showwarning("outOfFuel", player, vehicle.vehiclename);
        } else if (isdefined(var_e2818ad39a3341b4.warningbits["movementDisabled"]) && !isdefined(vehicle.ksempd)) {
            vehomn_showwarning("movementDisabled", player, vehicle.vehiclename);
        }
        if (soundexists(var_85dfce1880d8e71d) && !isdefined(var_fc7c7a874b43a31a)) {
            player stoplocalsound(var_85dfce1880d8e71d);
            player playlocalsound(var_85dfce1880d8e71d);
        }
    }
    if (vehicle scripts/cp_mp/vehicles/vehicle_damage::vehicle_damage_isburningdown()) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["burningDown"])) {
            vehomn_showwarning("burningDown", player, vehicle.vehiclename);
        }
    }
    if (isdefined(vehicle.fuel) && vehicle.fuel <= 25 && vehicle.fuel > 0) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["lowFuel"])) {
            vehomn_showwarning("lowFuel", player, vehicle.vehiclename);
            if (soundexists(var_85dfce1880d8e71d) && !isdefined(var_fc7c7a874b43a31a)) {
                player stoplocalsound(var_94d4410a7169a784);
                player playlocalsound(var_94d4410a7169a784);
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x292b
// Size: 0x3ca
function function_d2d9c09551d91164(vehicle, player) {
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
        return;
    }
    vehomn_setvehicle(vehicle.vehiclename, player);
    var_94d4410a7169a784 = "uin_veh_warning_low_fuel";
    var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel";
    foreach (seatid, occupant in vehicle_occupancy_getalloccupants(vehicle)) {
        if (isdefined(occupant) && occupant != player) {
            vehomn_setseatentity(vehicle.vehiclename, seatid, occupant, player);
        }
    }
    if (istrue(scripts/common/vehicle::ishelicopter())) {
        var_94d4410a7169a784 = "uin_veh_warning_low_fuel_heli";
        var_85dfce1880d8e71d = "uin_veh_warning_out_of_fuel_heli";
    }
    if (vehicle.health < vehicle.maxhealth) {
        vehomn_updateomnvarsondamage(vehicle);
    }
    if (scripts/cp_mp/vehicles/vehicle_interact::function_a717a31ae35ba01c() && isdefined(vehicle.fuel)) {
        vehicle vehomn_showfuel(player);
        vehicle function_272f4112182763bd(player);
    }
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicle.vehiclename);
    if (scripts/cp_mp/utility/weapon_utility::function_f18dbd353f3e1570(vehicle)) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["missileLocking"])) {
            vehomn_showwarning("missileLocking", player, vehicle.vehiclename);
        }
    }
    if (scripts/cp_mp/utility/weapon_utility::islockedonto(vehicle)) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["missileLocking"])) {
            vehomn_showwarning("missileLocking", player, vehicle.vehiclename);
        }
    }
    if (scripts/cp_mp/utility/weapon_utility::hasincoming(vehicle)) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["missileIncoming"])) {
            vehomn_showwarning("missileIncoming", player, vehicle.vehiclename);
        }
    }
    if (!scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_movementisallowed(vehicle)) {
        if (istrue(vehicle.islocked)) {
            if (isdefined(var_e2818ad39a3341b4.warningbits["locked"])) {
                vehomn_showwarning("locked", player, vehicle.vehiclename);
            }
        } else if (vehicle scripts/cp_mp/emp_debuff::is_empd() && !isdefined(vehicle.ksempd)) {
            vehomn_showwarning("DDoSed", player, vehicle.vehiclename);
        } else if (isdefined(vehicle.fuel) && vehicle.fuel <= 0 && isdefined(var_e2818ad39a3341b4.warningbits["outOfFuel"])) {
            vehomn_showwarning("outOfFuel", player, vehicle.vehiclename);
            if (soundexists(var_85dfce1880d8e71d)) {
                player playlocalsound(var_85dfce1880d8e71d);
            }
        } else if (isdefined(var_e2818ad39a3341b4.warningbits["movementDisabled"]) && !isdefined(vehicle.ksempd)) {
            vehomn_showwarning("movementDisabled", player, vehicle.vehiclename);
        }
    }
    if (vehicle scripts/cp_mp/vehicles/vehicle_damage::vehicle_damage_isburningdown()) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["burningDown"])) {
            vehomn_showwarning("burningDown", player, vehicle.vehiclename);
        }
    }
    if (isdefined(vehicle.fuel) && vehicle.fuel <= 25 && vehicle.fuel > 0) {
        if (isdefined(var_e2818ad39a3341b4.warningbits["lowFuel"])) {
            vehomn_showwarning("lowFuel", player, vehicle.vehiclename);
            if (soundexists(var_94d4410a7169a784)) {
                player playlocalsound(var_94d4410a7169a784);
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cfc
// Size: 0x74
function vehomn_updateomnvarsonseatexit(vehicle, var_fc7c7a874b43a31a, var_7558f98f3236963d, player) {
    if (!isdefined(var_7558f98f3236963d)) {
        if (isdefined(var_fc7c7a874b43a31a)) {
            vehomn_clearall(player, vehicle.vehiclename);
            if (isdefined(vehicle)) {
                occupants = function_efa75aa7f0a1289(vehicle);
                vehomn_clearseatentity(vehicle.vehiclename, var_fc7c7a874b43a31a, occupants);
                vehomn_updatenextseatomnvars(vehicle);
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d77
// Size: 0x27
function function_5211953231a09ed5(vehicle, player) {
    vehomn_clearall(player, vehicle.vehiclename);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da5
// Size: 0xa7
function vehomn_updateomnvarsondamage(vehicle, data) {
    occupants = scripts/cp_mp/vehicles/vehicle_occupancy::function_efa75aa7f0a1289(vehicle, 0);
    if (!isdefined(data)) {
        healthpercent = int(clamp(vehicle.health / vehicle.maxhealth * 100, 0, 100));
    } else {
        healthpercent = int(clamp((vehicle.health - data.damage) / vehicle.maxhealth * 100, 0, 100));
    }
    vehomn_showhealth(occupants);
    vehomn_sethealthpercent(healthpercent, occupants);
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e53
// Size: 0xd5
function vehomn_updateomnvarsperframe(vehicle, data) {
    if (!isdefined(data)) {
        data = spawnstruct();
    }
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicle.vehiclename, undefined, 1);
    occupants = scripts/cp_mp/vehicles/vehicle_occupancy::function_efa75aa7f0a1289(vehicle);
    if (isdefined(occupants) && isdefined(var_e2818ad39a3341b4)) {
        if (isdefined(occupants) && occupants.size > 0) {
            foreach (seatid, occupant in occupants) {
                if (isdefined(occupant) && isplayer(occupant) && occupant scripts/cp_mp/utility/player_utility::_isalive()) {
                    veh_updateomnvarsperframeforclient(vehicle, occupant, seatid, data);
                }
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f2f
// Size: 0x76
function veh_updateomnvarsperframeforclient(vehicle, client, seatid, data) {
    if (!isdefined(seatid)) {
        seatid = scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_getoccupantseat(vehicle, client);
    }
    /#
        assertex(isdefined(seatid), "veh_updateOmnvarsPerFrameForClient could not find a seatID for client " + client getentitynumber() + ".");
    #/
    if (istrue(scripts/cp_mp/utility/vehicle_omnvar_utility::vehomn_getleveldataforvehicle(vehicle function_d93ec4635290febd()).var_bd169af9b46727ef)) {
        vehomn_updaterotationomnvarsperframeforclient(vehicle, client, seatid, data);
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fac
// Size: 0x8b
function vehomn_updatenextseatomnvars(vehicle) {
    occupants = scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_getalloccupants(vehicle);
    foreach (seatid, occupant in occupants) {
        var_9b1113f768b290d8 = scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_getnextavailableseat(vehicle, occupant, seatid);
        vehomn_setnextseat(vehicle.vehiclename, var_9b1113f768b290d8, occupant);
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303e
// Size: 0x1dd
function vehomn_updaterotationomnvarsperframeforclient(vehicle, client, seatid, data) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicle.vehiclename);
    if (var_e2818ad39a3341b4.rotationrefsbyseatandweapon.size > 0 && isdefined(var_e2818ad39a3341b4.rotationrefsbyseatandweapon[seatid])) {
        usingCamera = scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_isdriverseat(vehicle, seatid);
        var_c50b485a43752fd = scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_getleveldataforseat(vehicle.vehiclename, seatid);
        if (usingCamera) {
            if (isdefined(vehicle.objweapon)) {
                rotationref = var_e2818ad39a3341b4.rotationrefsbyseatandweapon[seatid][vehicle.objweapon.basename];
                if (isdefined(rotationref)) {
                    var_451362a0c7f69e04 = invertangles(client getplayerangles());
                    angles = vehicle.angles;
                    entangles = combineangles(var_451362a0c7f69e04, angles);
                    entrotation = angleclamp(entangles[1]);
                    vehomn_setrotation(vehicle.vehiclename, rotationref, entrotation, client);
                }
            }
        }
        var_d22f47766862a420 = vehomn_getrotationentangles(vehicle, data);
        if (isdefined(var_d22f47766862a420)) {
            foreach (weaponname, rotationref in var_e2818ad39a3341b4.rotationrefsbyseatandweapon[seatid]) {
                entangles = var_d22f47766862a420[weaponname];
                if (isdefined(entangles)) {
                    entrotation = angleclamp(entangles[1]);
                    vehomn_setrotation(vehicle.vehiclename, rotationref, entrotation, client);
                }
            }
        }
    }
}

// Namespace namespace_8c2443d2e806600c / scripts/cp_mp/utility/vehicle_omnvar_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3222
// Size: 0x138
function vehomn_getrotationentangles(vehicle, data) {
    if (isdefined(data) && isdefined(data.localangles)) {
        return data.rotationentangles;
    }
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicle function_d93ec4635290febd(), 1);
    ents = scripts/cp_mp/vehicles/vehicle::vehicle_getturrets(vehicle);
    if (isdefined(var_e2818ad39a3341b4.mainturretweapon) && isdefined(vehicle gettagorigin("tag_flash"))) {
        ents[var_e2818ad39a3341b4.mainturretweapon] = vehicle;
    }
    if (isdefined(ents) && ents.size > 0) {
        entangles = [];
        var_3199bd878b193472 = invertangles(vehicle.angles);
        foreach (weaponname, ent in ents) {
            entangles[weaponname] = combineangles(var_3199bd878b193472, ent gettagangles("tag_flash"));
        }
        if (isdefined(data)) {
            data.rotationentangles = entangles;
        }
        return entangles;
    }
    return undefined;
}

