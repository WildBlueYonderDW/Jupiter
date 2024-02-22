// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\equipment.gsc;
#using script_2d9d24f7c63ac143;
#using script_600b944a95c3a7bf;

#namespace throwstar_mp;

// Namespace throwstar_mp/namespace_bdc206d01804f08f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8
// Size: 0x45
function function_12d7ca3ff609caba() {
    registersharedfunc("throwStar", "onGive", &function_e7715ffb329c1b40);
    registersharedfunc("throwStar", "onTake", &function_92e126d1a5d3fb2);
    registersharedfunc("throwstar", "tryToPickup", &function_94dcdd399513b2ce);
}

// Namespace throwstar_mp/namespace_bdc206d01804f08f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x134
// Size: 0x1c
function function_e7715ffb329c1b40(equipmentref, var_cbb2b3d05e48bd27, variantid) {
    
}

// Namespace throwstar_mp/namespace_bdc206d01804f08f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x157
// Size: 0x14
function function_92e126d1a5d3fb2(equipmentref, var_cbb2b3d05e48bd27) {
    
}

// Namespace throwstar_mp/namespace_bdc206d01804f08f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x172
// Size: 0x8e
function function_94dcdd399513b2ce(equipmentref) {
    if (!isdefined(equipmentref)) {
        /#
            self iprintlnbold("<unknown string>");
        #/
        return 0;
    }
    if (namespace_1a507865f681850e::hasequipment(equipmentref) && namespace_1a507865f681850e::getequipmentammo(equipmentref) < namespace_1a507865f681850e::getequipmentmaxammo(equipmentref)) {
        namespace_1a507865f681850e::incrementequipmentammo(equipmentref);
    } else if (namespace_aead94004cf4c147::function_7e103028c464ab9a(namespace_38b993c4618e76cd::function_b88cfb4893ceedac(equipmentref)) && namespace_aead94004cf4c147::function_8a160d9935d47f5e(equipmentref, "equipment", 1)) {
        namespace_aead94004cf4c147::additemtobackpackbyref(equipmentref, "equipment", 1);
    } else {
        return 0;
    }
    hudicontype("throwstar");
    return 1;
}

