// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\weapons.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using script_2d9d24f7c63ac143;
#using script_600b944a95c3a7bf;

#namespace namespace_70a9c767ad1878e5;

// Namespace namespace_70a9c767ad1878e5 / scripts/mp/equipment/throwing_knife_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144
// Size: 0x45
function throwing_knife_mp_init() {
    registersharedfunc("throwing_knife", "onGive", &throwing_knife_mp_ongive);
    registersharedfunc("throwing_knife", "onTake", &throwing_knife_mp_ontake);
    registersharedfunc("throwing_knife", "tryToPickup", &throwing_knife_mp_trytopickup);
}

// Namespace namespace_70a9c767ad1878e5 / scripts/mp/equipment/throwing_knife_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190
// Size: 0xc0
function throwing_knife_mp_ongive(equipmentref, equipmentslot, variantid) {
    if (_hasperk("specialty_equip_throwingKnife")) {
        scripts/mp/weapons::function_ec132c173d4532ee("specialty_equip_throwingKnife");
    }
    if (!isdefined(variantid) && isdefined(self.var_a6dd5c7e74106ce3) && isdefined(self.var_a6dd5c7e74106ce3[equipmentref])) {
        variantid = self.var_a6dd5c7e74106ce3[equipmentref];
    }
    if (equipmentref == "equip_shuriken") {
        return;
    }
    if (isdefined(variantid) && variantid > 0) {
        self.throwingknifemelee = namespace_e0ee43ef2dddadaa::buildweapon_blueprint("iw9_knifestab_mp", "none", "none", variantid);
    } else {
        self.throwingknifemelee = function_eeaa22f0cd1ff845("iw9_knifestab_mp");
    }
    scripts/mp/weapons::weapon_giveperk("specialty_equip_throwingKnife");
}

// Namespace namespace_70a9c767ad1878e5 / scripts/mp/equipment/throwing_knife_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x38
function throwing_knife_mp_ontake(equipmentref, equipmentslot) {
    if (scripts/mp/weapons::weapon_hasperk("specialty_equip_throwingKnife")) {
        scripts/mp/weapons::function_ec132c173d4532ee("specialty_equip_throwingKnife");
    }
    self.throwingknifemelee = undefined;
}

// Namespace namespace_70a9c767ad1878e5 / scripts/mp/equipment/throwing_knife_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296
// Size: 0xa5
function throwing_knife_mp_trytopickup(equipmentref, variantid) {
    if (!isdefined(equipmentref)) {
        /#
            self iprintlnbold("<unknown string>");
        #/
        return false;
    }
    if (scripts/mp/equipment::hasequipment(equipmentref) && scripts/mp/equipment::getequipmentammo(equipmentref) < scripts/mp/equipment::getequipmentmaxammo(equipmentref)) {
        scripts/mp/equipment::incrementequipmentammo(equipmentref, 1, undefined, 1);
        throwing_knife_mp_ongive(equipmentref, undefined, variantid);
    } else if (namespace_aead94004cf4c147::function_7e103028c464ab9a(namespace_38b993c4618e76cd::function_b88cfb4893ceedac(equipmentref)) && namespace_aead94004cf4c147::function_8a160d9935d47f5e(equipmentref, "equipment", 1)) {
        namespace_aead94004cf4c147::addItemToBackpackByRef(equipmentref, "equipment", 1);
    } else {
        return false;
    }
    hudicontype("throwingknife");
    return true;
}

