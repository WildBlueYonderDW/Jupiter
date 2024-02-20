// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_93eecc7204143fa9;

// Namespace namespace_93eecc7204143fa9/namespace_68d1bc1bac7da538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1
// Size: 0x25
function init_vehicles() {
    create_func_ref("fastrope_anim", &fastrope_anim);
    create_func_ref("vehicle_door_anim", &function_93eecc7204143fa9);
}

// Namespace namespace_93eecc7204143fa9/namespace_68d1bc1bac7da538
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d
// Size: 0x4e
function fastrope_anim(model, animation, flag) {
    model dontinterpolate();
    model scriptmodelclearanim();
    model scriptmodelplayanimdeltamotionfrompos(getanimname(animation), model.origin, model.angles, flag);
}

// Namespace namespace_93eecc7204143fa9/namespace_68d1bc1bac7da538
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162
// Size: 0xb3
function function_93eecc7204143fa9(vehicle, animation) {
    if (isdefined(vehicle)) {
        if (istrue(vehicle.var_7b349dc60a25d9fe)) {
            if (!istrue(vehicle.var_28140f53a0386f0e)) {
                vehicle.var_28140f53a0386f0e = 1;
                vehicle animscripted("placeholder", vehicle.scenenode.origin, vehicle.scenenode.angles, animation);
            }
        } else {
            vehicle animscripted("placeholder", vehicle.origin, vehicle.angles, mp_vehicles_always_loaded%iw9_veh_blank_5_seconds);
            vehicle vehicleplayanim(animation, 0);
        }
    }
}

// Namespace namespace_93eecc7204143fa9/namespace_68d1bc1bac7da538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c
// Size: 0x14
function vehicleaniminit() {
    namespace_3c37cb17ade254d::create_func_ref("use_turret", &utility::use_turret);
}

// Namespace namespace_93eecc7204143fa9/namespace_68d1bc1bac7da538
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x237
// Size: 0xd
function set_vehicle_anims_mkilo23_ai_infil(positions) {
    return positions;
}

// Namespace namespace_93eecc7204143fa9/namespace_68d1bc1bac7da538
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24c
// Size: 0xd
function set_vehicle_anims_umike(positions) {
    return positions;
}

