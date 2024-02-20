// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\killstreaks\mapselect.gsc;
#using scripts\mp\damage.gsc;

#namespace namespace_e250c661763b430b;

// Namespace namespace_e250c661763b430b/namespace_2abc0d4edfa3b1e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8
// Size: 0x45
function init() {
    namespace_3c37cb17ade254d::registersharedfunc("empDroneTargeted", "getSelectMapPoint", &emp_drone_targeted_getmapselectpoint);
    namespace_3c37cb17ade254d::registersharedfunc("empDroneTargeted", "startMapSelectSequence", &emp_drone_targeted_startmapselectsequence);
    namespace_3c37cb17ade254d::registersharedfunc("empDroneTargeted", "monitorDamage", &emp_drone_targeted_monitordamage);
}

// Namespace namespace_e250c661763b430b/namespace_2abc0d4edfa3b1e2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114
// Size: 0x25
function emp_drone_targeted_getmapselectpoint(streakinfo, var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff) {
    return namespace_bc3bdbac7cebdc14::function_a5839924b6723eac(streakinfo, var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff);
}

// Namespace namespace_e250c661763b430b/namespace_2abc0d4edfa3b1e2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141
// Size: 0x2f
function emp_drone_targeted_startmapselectsequence(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3, var_3922786267ccc2a8) {
    namespace_bc3bdbac7cebdc14::function_90f093ca8576232f(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3, var_3922786267ccc2a8);
}

// Namespace namespace_e250c661763b430b/namespace_2abc0d4edfa3b1e2
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177
// Size: 0x4b
function emp_drone_targeted_monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650) {
    namespace_3e725f3cc58bddd3::monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650);
}

