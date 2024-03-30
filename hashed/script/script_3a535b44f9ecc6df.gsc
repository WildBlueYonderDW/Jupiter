// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;

#namespace namespace_60a636790355dd76;

// Namespace namespace_60a636790355dd76 / namespace_15896d40cab0d429
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116
// Size: 0x14
function main() {
    function_c0b3ddc9a6bdcc46("veh9_sedan_hatchback_1985", &function_2c9651adad47c81f);
}

// Namespace namespace_60a636790355dd76 / namespace_15896d40cab0d429
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x131
// Size: 0x34
function private function_2c9651adad47c81f() {
    if (!function_9697379150687859("veh9_sedan_hatchback_1985")) {
        return;
    }
    registersharedfunc("veh9_sedan_hatchback_1985_nitrous", "spawn", &function_87c1d62f952bef20);
    function_8497e7e46b5e397("veh9_sedan_hatchback_1985");
}

// Namespace namespace_60a636790355dd76 / namespace_15896d40cab0d429
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c
// Size: 0xc2
function private function_87c1d62f952bef20(spawndata, faildata) {
    spawndata = function_37480e9c9c701cf2("veh9_sedan_hatchback_1985", spawndata);
    spawndata.vehicletype = "veh9_sedan_hatchback_1985_physics_nitrous_mp";
    vehicle = _spawnvehicle(spawndata, faildata);
    if (!isdefined(vehicle)) {
        return undefined;
    }
    vehicle_create(vehicle, "veh9_sedan_hatchback_1985", spawndata);
    vehicle.objweapon = makeweapon(function_7aaa7ae503292f43("veh9_sedan_hatchback_1985"));
    vehicle_compass_registerinstance(vehicle);
    vehicle_createlate(vehicle, spawndata);
    vehicle thread vehicle_watchflipped();
    vehicle thread function_1b69321ff9937fc5();
    if (issharedfuncdefined("veh9_sedan_hatchback_1985", "create")) {
        [[ getsharedfunc("veh9_sedan_hatchback_1985", "create") ]](vehicle);
    }
    return vehicle;
}

