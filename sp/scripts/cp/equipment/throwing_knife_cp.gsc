#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_354c862768cfe202;
#using script_66122a002aff5d57;
#using script_5762ac2f22202ba2;

#namespace namespace_707dcb67ace81b4b;

// Namespace namespace_707dcb67ace81b4b / scripts\cp\equipment\throwing_knife_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d
// Size: 0x18
function throwing_knife_cp_init() {
    scripts\engine\utility::registersharedfunc("throwing_knife", "tryToPickup", &throwing_knife_cp_trytopickup);
}

// Namespace namespace_707dcb67ace81b4b / scripts\cp\equipment\throwing_knife_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0x9d
function function_e12d03bb90954276(equipmentref) {
    if (namespace_4fb9dddfb8c1a67a::hasequipment("equip_throwing_knife")) {
        equipment_name = "equip_throwing_knife";
    } else if (namespace_4fb9dddfb8c1a67a::hasequipment("equip_throwing_knife_fire")) {
        equipment_name = "equip_throwing_knife_fire";
    } else {
        return false;
    }
    var_caf75c2ba47b7261 = namespace_4fb9dddfb8c1a67a::getequipmentammo(equipment_name);
    var_9b4fb988b660eb30 = namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipment_name);
    if (var_caf75c2ba47b7261 + 1 > var_9b4fb988b660eb30) {
        return false;
    }
    var_caf75c2ba47b7261 = int(min(var_caf75c2ba47b7261 + 1, var_9b4fb988b660eb30));
    namespace_4fb9dddfb8c1a67a::setequipmentammo(equipment_name, var_caf75c2ba47b7261);
    namespace_3d3d5211c3029f82::hudicontype("throwingknife");
    return true;
}

// Namespace namespace_707dcb67ace81b4b / scripts\cp\equipment\throwing_knife_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3
// Size: 0x89
function throwing_knife_cp_trytopickup(equipmentref) {
    if (namespace_4fb9dddfb8c1a67a::hasequipment(equipmentref) && namespace_4fb9dddfb8c1a67a::getequipmentammo(equipmentref) < namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipmentref)) {
        namespace_4fb9dddfb8c1a67a::incrementequipmentammo(equipmentref);
    } else if (namespace_6250b14b3f614101::isbackpackinventoryenabled() && namespace_6250b14b3f614101::function_8a160d9935d47f5e(equipmentref, "equipment", 1)) {
        namespace_6250b14b3f614101::function_9d094fac5ae6454e(equipmentref, "equipment", 1);
    } else {
        return false;
    }
    if (equipmentref == "equip_throwing_knife_fire") {
        namespace_e072c8407b2a861c::hudicontype("throwingknife_fire");
    } else {
        namespace_e072c8407b2a861c::hudicontype("throwingknife");
    }
    return true;
}

