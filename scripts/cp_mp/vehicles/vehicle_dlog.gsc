// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_afc3fdfb787b1a22;

// Namespace namespace_afc3fdfb787b1a22/namespace_d28769d7bb5c026b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b
// Size: 0xf7
function vehicle_dlog_spawnevent(vehicle, spawntype, vehicletype) {
    instancedata = vehicle_dlog_getinstancedata(vehicle, 1);
    if (!isdefined(instancedata)) {
        return;
    }
    if (!isdefined(vehicletype)) {
        vehicletype = vehicle.vehiclename;
    }
    if (!isdefined(spawntype)) {
        return;
    }
    if (!isdefined(vehicletype)) {
        return;
    }
    dlog_recordevent("dlog_event_vehicle_spawn", [0:"vehicle_spawn_id", 1:instancedata.id, 2:"pos_x", 3:vehicle.origin[0], 4:"pos_y", 5:vehicle.origin[1], 6:"pos_z", 7:vehicle.origin[2], 8:"matchtime_ms", 9:namespace_36f464722d326bbe::gettimesincegamestart(), 10:"spawn_type", 11:spawntype, 12:"vehicle_type", 13:vehicletype]);
}

// Namespace namespace_afc3fdfb787b1a22/namespace_d28769d7bb5c026b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359
// Size: 0xf6
function vehicle_dlog_exitevent(vehicle, player, seatid, exittype) {
    if (!isplayer(player)) {
        return;
    }
    instancedata = vehicle_dlog_getinstancedata(vehicle);
    if (!isdefined(instancedata)) {
        return;
    }
    if (!isdefined(seatid)) {
        return;
    }
    if (!isdefined(exittype)) {
        return;
    }
    player dlog_recordplayerevent("dlog_event_player_vehicle_exit", [0:"vehicle_spawn_id", 1:instancedata.id, 2:"exit_pos_x", 3:vehicle.origin[0], 4:"exit_pos_y", 5:vehicle.origin[1], 6:"exit_pos_z", 7:vehicle.origin[2], 8:"exit_seat_id", 9:seatid, 10:"exit_matchtime_ms", 11:namespace_36f464722d326bbe::gettimesincegamestart(), 12:"exit_type", 13:exittype]);
}

// Namespace namespace_afc3fdfb787b1a22/namespace_d28769d7bb5c026b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456
// Size: 0xf6
function vehicle_dlog_enterevent(vehicle, player, seatid, var_6c6d078a43295c39) {
    if (!isplayer(player)) {
        return;
    }
    instancedata = vehicle_dlog_getinstancedata(vehicle);
    if (!isdefined(instancedata)) {
        return;
    }
    if (!isdefined(seatid)) {
        return;
    }
    if (!isdefined(var_6c6d078a43295c39)) {
        return;
    }
    player dlog_recordplayerevent("dlog_event_player_vehicle_enter", [0:"vehicle_spawn_id", 1:instancedata.id, 2:"enter_pos_x", 3:vehicle.origin[0], 4:"enter_pos_y", 5:vehicle.origin[1], 6:"enter_pos_z", 7:vehicle.origin[2], 8:"enter_seat_id", 9:seatid, 10:"enter_matchtime_ms", 11:namespace_36f464722d326bbe::gettimesincegamestart(), 12:"enter_type", 13:var_6c6d078a43295c39]);
}

// Namespace namespace_afc3fdfb787b1a22/namespace_d28769d7bb5c026b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x553
// Size: 0x70
function vehicle_dlog_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_dlog_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.dlogdata), "vehicle_dlog_init() should only be called once.");
    #/
    levelData = spawnstruct();
    levelData.uniqueid = 0;
    level.vehicle.dlogdata = levelData;
}

// Namespace namespace_afc3fdfb787b1a22/namespace_d28769d7bb5c026b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ca
// Size: 0x38
function vehicle_dlog_getleveldata() {
    /#
        assertex(isdefined(level.vehicle.dlogdata), "vehicle_dlog_getLevelData() called before vehicle_dlog_init().");
    #/
    return level.vehicle.dlogdata;
}

// Namespace namespace_afc3fdfb787b1a22/namespace_d28769d7bb5c026b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60a
// Size: 0x7f
function vehicle_dlog_getinstancedata(vehicle, create) {
    levelData = vehicle_dlog_getleveldata();
    instancedata = vehicle.dlogdata;
    if (!isdefined(instancedata) && istrue(create)) {
        instancedata = spawnstruct();
        vehicle.dlogdata = instancedata;
        instancedata.id = levelData.uniqueid;
        levelData.uniqueid++;
    }
    return instancedata;
}

// Namespace namespace_afc3fdfb787b1a22/namespace_d28769d7bb5c026b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x691
// Size: 0x17
function vehicle_dlog_getuniqueid(vehicle) {
    return vehicle.dlogid;
}

