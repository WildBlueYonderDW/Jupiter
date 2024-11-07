#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;

#namespace namespace_fd9cce3f0a5043c9;

// Namespace namespace_fd9cce3f0a5043c9 / namespace_3568ab3cfd523b38
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc0
// Size: 0x13
function main() {
    function_c0b3ddc9a6bdcc46("veh9_mil_cargo_truck", &function_7d644f73e8a967d);
}

// Namespace namespace_fd9cce3f0a5043c9 / namespace_3568ab3cfd523b38
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdb
// Size: 0x1d
function private function_7d644f73e8a967d() {
    if (!function_9697379150687859("veh9_mil_cargo_truck")) {
        return;
    }
    function_8497e7e46b5e397("veh9_mil_cargo_truck");
}

