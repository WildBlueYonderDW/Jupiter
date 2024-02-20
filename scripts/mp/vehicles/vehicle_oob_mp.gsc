// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_a892509dac574128;

// Namespace namespace_a892509dac574128/namespace_1cad239ed01de62d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2
// Size: 0x34
function vehicle_oob_mp_registeroutoftimecallback(vehiclename, callback) {
    levelData = vehicle_oob_mp_getleveldata();
    levelData.outoftimecallbacks[vehiclename] = callback;
}

// Namespace namespace_a892509dac574128/namespace_1cad239ed01de62d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x92
function vehicle_oob_mp_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_oob_mp_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.oob), "vehicle_oob_mp_init() should only be called once.");
    #/
    levelData = spawnstruct();
    levelData.outoftimecallbacks = [];
    level.vehicle.oob = levelData;
    registerooboutoftimecallback("vehicle", &vehicle_oob_mp_outoftimecallback);
    registeroobclearcallback("vehicle", &vehicle_oob_mp_clearcallback);
}

// Namespace namespace_a892509dac574128/namespace_1cad239ed01de62d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6
// Size: 0x50
function vehicle_oob_mp_getleveldata() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_oob_mp_getLevelData() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.oob), "vehicle_oob_mp_getLevelData() called before vehicle_oob_mp_init().");
    #/
    return level.vehicle.oob;
}

// Namespace namespace_a892509dac574128/namespace_1cad239ed01de62d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e
// Size: 0x65
function vehicle_oob_mp_outoftimecallback(var_2f57cfae824ca728, var_93f5db7e81311353) {
    levelData = vehicle_oob_mp_getleveldata();
    callback = levelData.outoftimecallbacks[self.vehiclename];
    /#
        assertex(isdefined(callback), "vehicle_oob_mp_outOfTimeCallback() called on a vehicle without a valid outOfTimeCallback.");
    #/
    self.var_a8f4bb03b366aa80 = 1;
    self [[ callback ]]();
}

// Namespace namespace_a892509dac574128/namespace_1cad239ed01de62d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a
// Size: 0x67
function vehicle_oob_mp_clearcallback() {
    occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(self);
    foreach (occupant in occupants) {
        occupant setclientomnvar("ui_out_of_bounds_countdown", 0);
    }
}

