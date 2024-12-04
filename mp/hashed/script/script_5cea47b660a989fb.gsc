#using scripts\common\utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\utility;

#namespace namespace_4c0bc0cafd66edf2;

// Namespace namespace_4c0bc0cafd66edf2 / namespace_9be32bbbe37779ab
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xc2
// Size: 0x1e
function autoexec main() {
    level.var_7bf42d565645a485 = 1;
    function_c0b3ddc9a6bdcc46("veh_jup_blima", &function_99154a866980515f);
}

// Namespace namespace_4c0bc0cafd66edf2 / namespace_9be32bbbe37779ab
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe8
// Size: 0x29
function private function_99154a866980515f() {
    callbacks = [];
    callbacks["spawn"] = &function_cbf697bfc601a8bc;
    function_8497e7e46b5e397("veh_jup_blima", callbacks);
}

// Namespace namespace_4c0bc0cafd66edf2 / namespace_9be32bbbe37779ab
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x119
// Size: 0xbd
function private function_cbf697bfc601a8bc(spawndata, faildata) {
    vehicle = function_bba34cf920370ff4("veh_jup_blima", spawndata, faildata);
    if (!isdefined(vehicle)) {
        return undefined;
    }
    if (istrue(spawndata.initai)) {
        vehicle.unload_hover_offset = 537;
        vehicle.unload_land_offset = 165;
        vehicle.script_badplace = 0;
        vehicle.vehiclesetuprope = 1;
        vehicle vehicle_setspeed(60, 20, 10);
        vehicle.preventrespawn = 1;
        vehicle.var_a8f4bb03b366aa80 = 1;
        vehicle.deathfunc = &vehicle_death;
        vehicle scripts\cp_mp\vehicles\vehicle_occupancy::function_a91927df280e94e4();
    }
    return vehicle;
}

