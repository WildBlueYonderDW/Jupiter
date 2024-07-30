#using scripts\engine\utility.gsc;
#using script_7b2517368c79e5bc;

#namespace namespace_6cc1c526f45bd479;

// Namespace namespace_6cc1c526f45bd479 / namespace_e80b54f8474f3ef9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85
// Size: 0x18
function function_628ac163573e544e() {
    function_900f562c61c6a5d6("ammo", &use_ammo, &function_67d2e1159a24893);
}

// Namespace namespace_6cc1c526f45bd479 / namespace_e80b54f8474f3ef9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5
// Size: 0xba
function function_67d2e1159a24893(item_def, item, auto_pickup, var_d3c1dfe8dea4ec26) {
    foreach (primary_weapon in self.primaryweapons) {
        if (primary_weapon.inventorytype == "primary" && !istrue(primary_weapon.ismelee)) {
            var_de8a9ead75a0581 = self getweaponammostock(primary_weapon);
            if (var_de8a9ead75a0581 < primary_weapon.maxammo) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_6cc1c526f45bd479 / namespace_e80b54f8474f3ef9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168
// Size: 0xfb
function use_ammo(item_def, item) {
    foreach (primary_weapon in self.primaryweapons) {
        if (primary_weapon.inventorytype == "primary" && !istrue(primary_weapon.ismelee)) {
            var_41fe346fd14b2567 = default_to(item.count, 20);
            maxammo = primary_weapon.maxammo;
            var_c1192c297bbf292f = maxammo * var_41fe346fd14b2567 / 100;
            currentammostock = self getweaponammostock(primary_weapon);
            var_c1192c297bbf292f = currentammostock + var_c1192c297bbf292f;
            var_c1192c297bbf292f = clamp(var_c1192c297bbf292f, 0, maxammo);
            self setweaponammostock(primary_weapon, int(var_c1192c297bbf292f));
        }
    }
    return false;
}

