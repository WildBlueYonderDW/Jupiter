// mwiii decomp prototype
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;

#namespace namespace_7f5956e577370452;

// Namespace namespace_7f5956e577370452 / namespace_e9b191b702a11f6b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x80
// Size: 0x26
function function_82b422f2ec92a2b7(vehiclename, vehicle) {
    if (function_4b8893bb155fc08b(vehiclename)) {
        function_cf493e05d95647(vehicle);
    }
}

// Namespace namespace_7f5956e577370452 / namespace_e9b191b702a11f6b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad
// Size: 0x73
function function_4b8893bb155fc08b(vehname) {
    dvarstring = hashcat(@"hash_d98c82b5a26dc973", vehname);
    if (getdvar(dvarstring, "") == "") {
        setdvar(dvarstring, "enable");
    }
    /#
        println("<unknown string>" + vehname);
    #/
    dvarstatus = getdvar(dvarstring, "enable") == "disable";
    return dvarstatus;
}

// Namespace namespace_7f5956e577370452 / namespace_e9b191b702a11f6b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x128
// Size: 0x23
function function_cf493e05d95647(vehicle) {
    /#
        println("<unknown string>");
    #/
    scripts/cp_mp/vehicles/vehicle_interact::vehicle_interact_allowvehicleuse(vehicle, 0);
}

