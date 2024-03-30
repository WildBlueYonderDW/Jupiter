// mwiii decomp prototype
#using scripts\common\vehicle_build.gsc;

#namespace empty_heli;

// Namespace empty_heli / scripts/vehicle/empty_heli
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x84
// Size: 0x37
function main(model, type, classname) {
    build_template("empty_heli", model, type, classname);
    build_is_helicopter("empty_heli");
}

