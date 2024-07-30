#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;

#namespace namespace_5b55a39d45a8a3ed;

// Namespace namespace_5b55a39d45a8a3ed / namespace_19f9046b14b6bdf2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3
// Size: 0x13
function main() {
    function_c0b3ddc9a6bdcc46("veh9_civ_lnd_scooter_eu", &function_9ba16c90d67c5692);
}

// Namespace namespace_5b55a39d45a8a3ed / namespace_19f9046b14b6bdf2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xde
// Size: 0x27
function private function_9ba16c90d67c5692() {
    if (!function_9697379150687859("veh9_civ_lnd_scooter_eu")) {
        return;
    }
    if (iscp()) {
        return;
    }
    function_8497e7e46b5e397("veh9_civ_lnd_scooter_eu");
}

