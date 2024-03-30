// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\events.gsc;

#namespace namespace_7218c21b35eb429b;

// Namespace namespace_7218c21b35eb429b / scripts/mp/vehicles/vehicle_damage_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1
// Size: 0x10b
function vehicle_damage_mp_init() {
    registersharedfunc("vehicle_damage", "setWeaponClassModDamageForVehicle", &set_weapon_class_mod_damage_data_for_vehicle);
    registersharedfunc("vehicle_damage", "setPerkModDamage", &set_perk_mod_damage_data);
    registersharedfunc("vehicle_damage", "setWeaponHitDamageData", &set_weapon_hit_damage_data);
    registersharedfunc("vehicle_damage", "setWeaponHitDamageDataForVehicle", &set_weapon_hit_damage_data_for_vehicle);
    registersharedfunc("vehicle_damage", "setVehicleHitDamageData", &set_vehicle_hit_damage_data);
    registersharedfunc("vehicle_damage", "setVehicleHitDamageDataForWeapon", &set_vehicle_hit_damage_data_for_weapon);
    registersharedfunc("vehicle_damage", "setPreModDamageCallback", &set_pre_mod_damage_callback);
    registersharedfunc("vehicle_damage", "setPostModDamageCallback", &set_post_mod_damage_callback);
    registersharedfunc("vehicle_damage", "setDeathCallback", &set_death_callback);
    registersharedfunc("vehicle_damage", "giveScore", &vehicle_damage_givescore);
    registersharedfunc("vehicle_damage", "giveAward", &vehicle_damage_giveaward);
    registersharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon", &vehicle_setupHitDamageOverrideForWeapon);
}

// Namespace namespace_7218c21b35eb429b / scripts/mp/vehicles/vehicle_damage_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3
// Size: 0x35
function vehicle_damage_givescore(ref, objweapon, var_fc10bb0a0aa2990) {
    if (istrue(var_fc10bb0a0aa2990)) {
        scripts/mp/rank::scoreeventpopup(ref);
        return;
    }
    scripts/mp/utility/points::doScoreEvent(ref, objweapon);
}

// Namespace namespace_7218c21b35eb429b / scripts/mp/vehicles/vehicle_damage_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f
// Size: 0x33
function vehicle_damage_giveaward(ref, objweapon, var_fc10bb0a0aa2990) {
    thread scripts/mp/events::killeventtextpopup(ref);
    if (!istrue(var_fc10bb0a0aa2990)) {
        scripts/mp/utility/points::doScoreEvent(ref, objweapon);
    }
}

// Namespace namespace_7218c21b35eb429b / scripts/mp/vehicles/vehicle_damage_mp
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359
// Size: 0x42
function vehicle_setupHitDamageOverrideForWeapon(weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, vehiclename) {
    if (isdefined(weaponhitsperattack)) {
        set_weapon_hit_damage_data_for_vehicle(weaponname, weaponhitsperattack, vehiclename);
    }
    if (isdefined(var_8b4500d6a881b7b2)) {
        set_vehicle_hit_damage_data_for_weapon(vehiclename, var_8b4500d6a881b7b2, weaponname);
    }
}

