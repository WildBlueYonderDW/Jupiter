#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace vehicle_oob_mp;

// Namespace vehicle_oob_mp / scripts\mp\vehicles\vehicle_oob_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2
// Size: 0x33
function vehicle_oob_mp_registeroutoftimecallback(vehiclename, callback) {
    leveldata = vehicle_oob_mp_getleveldata();
    leveldata.outoftimecallbacks[vehiclename] = callback;
}

// Namespace vehicle_oob_mp / scripts\mp\vehicles\vehicle_oob_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x91
function vehicle_oob_mp_init() {
    assertex(isdefined(level.vehicle), "vehicle_oob_mp_init() called before vehicle_init().");
    assertex(!isdefined(level.vehicle.oob), "vehicle_oob_mp_init() should only be called once.");
    leveldata = spawnstruct();
    leveldata.outoftimecallbacks = [];
    level.vehicle.oob = leveldata;
    registerooboutoftimecallback("vehicle", &vehicle_oob_mp_outoftimecallback);
    registeroobclearcallback("vehicle", &vehicle_oob_mp_clearcallback);
}

// Namespace vehicle_oob_mp / scripts\mp\vehicles\vehicle_oob_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6
// Size: 0x4f
function vehicle_oob_mp_getleveldata() {
    assertex(isdefined(level.vehicle), "vehicle_oob_mp_getLevelData() called before vehicle_init().");
    assertex(isdefined(level.vehicle.oob), "vehicle_oob_mp_getLevelData() called before vehicle_oob_mp_init().");
    return level.vehicle.oob;
}

// Namespace vehicle_oob_mp / scripts\mp\vehicles\vehicle_oob_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e
// Size: 0x64
function vehicle_oob_mp_outoftimecallback(timeoutendnotify, clearnotify) {
    leveldata = vehicle_oob_mp_getleveldata();
    callback = leveldata.outoftimecallbacks[self.vehiclename];
    assertex(isdefined(callback), "vehicle_oob_mp_outOfTimeCallback() called on a vehicle without a valid outOfTimeCallback.");
    self.var_a8f4bb03b366aa80 = 1;
    self [[ callback ]]();
}

// Namespace vehicle_oob_mp / scripts\mp\vehicles\vehicle_oob_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a
// Size: 0x66
function vehicle_oob_mp_clearcallback() {
    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(self);
    foreach (occupant in occupants) {
        occupant setclientomnvar("ui_out_of_bounds_countdown", 0);
    }
}

