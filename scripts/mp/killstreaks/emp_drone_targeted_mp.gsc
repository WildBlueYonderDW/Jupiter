// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\killstreaks\mapselect.gsc;
#using scripts\mp\damage.gsc;

#namespace namespace_e250c661763b430b;

// Namespace namespace_e250c661763b430b / scripts/mp/killstreaks/emp_drone_targeted_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8
// Size: 0x45
function init() {
    scripts/engine/utility::registersharedfunc("empDroneTargeted", "getSelectMapPoint", &emp_drone_targeted_getmapselectpoint);
    scripts/engine/utility::registersharedfunc("empDroneTargeted", "startMapSelectSequence", &emp_drone_targeted_startmapselectsequence);
    scripts/engine/utility::registersharedfunc("empDroneTargeted", "monitorDamage", &emp_drone_targeted_monitordamage);
}

// Namespace namespace_e250c661763b430b / scripts/mp/killstreaks/emp_drone_targeted_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114
// Size: 0x25
function emp_drone_targeted_getmapselectpoint(streakinfo, selectnum, directionalselection) {
    return scripts/mp/killstreaks/mapselect::function_a5839924b6723eac(streakinfo, selectnum, directionalselection);
}

// Namespace namespace_e250c661763b430b / scripts/mp/killstreaks/emp_drone_targeted_mp
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141
// Size: 0x2f
function emp_drone_targeted_startmapselectsequence(navmesh, directionalselection, directionaltype, selectortype) {
    scripts/mp/killstreaks/mapselect::function_90f093ca8576232f(navmesh, directionalselection, directionaltype, selectortype);
}

// Namespace namespace_e250c661763b430b / scripts/mp/killstreaks/emp_drone_targeted_mp
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177
// Size: 0x4b
function emp_drone_targeted_monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken) {
    scripts/mp/damage::monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken);
}

