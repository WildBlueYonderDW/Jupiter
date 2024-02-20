// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;

#namespace namespace_9e66f70aad951124;

// Namespace namespace_9e66f70aad951124/namespace_a8c01726524388f5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c
// Size: 0x14
function main() {
    function_c0b3ddc9a6bdcc46("atv", &atv_init);
}

// Namespace namespace_9e66f70aad951124/namespace_a8c01726524388f5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa7
// Size: 0x1e
function private atv_init() {
    if (!function_9697379150687859("atv")) {
        return;
    }
    function_8497e7e46b5e397("atv");
}

