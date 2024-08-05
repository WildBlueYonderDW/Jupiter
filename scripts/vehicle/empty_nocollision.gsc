#using scripts\common\vehicle_build.gsc;

#namespace namespace_51245272d927355c;

// Namespace namespace_51245272d927355c / scripts\vehicle\empty_nocollision
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x79
// Size: 0x45
function main(model, type, classname) {
    build_template(type, model, undefined, classname);
    build_localinit(&init_local);
    build_life(90000);
    build_is_airplane();
}

// Namespace namespace_51245272d927355c / scripts\vehicle\empty_nocollision
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6
// Size: 0x14
function init_local() {
    self.disable_wash = 1;
    self hideallparts();
}

