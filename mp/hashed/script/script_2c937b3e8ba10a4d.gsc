#using scripts\cp_mp\loot\common_item;
#using scripts\engine\utility;

#namespace namespace_6cc1c526f45bd479;

// Namespace namespace_6cc1c526f45bd479 / namespace_e80b54f8474f3ef9
// Params 0
// Checksum 0x0, Offset: 0xab
// Size: 0x18
function function_628ac163573e544e()
{
    function_900f562c61c6a5d6( "ammo", &use_ammo, &function_67d2e1159a24893 );
}

// Namespace namespace_6cc1c526f45bd479 / namespace_e80b54f8474f3ef9
// Params 4
// Checksum 0x0, Offset: 0xcb
// Size: 0xb8, Type: bool
function function_67d2e1159a24893( item_def, item, auto_pickup, var_d3c1dfe8dea4ec26 )
{
    foreach ( primary_weapon in self.primaryweapons )
    {
        if ( primary_weapon.inventorytype == "primary" && !istrue( primary_weapon.ismelee ) )
        {
            current_ammo = self getweaponammostock( primary_weapon );
            
            if ( current_ammo < primary_weapon.maxammo )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace namespace_6cc1c526f45bd479 / namespace_e80b54f8474f3ef9
// Params 2
// Checksum 0x0, Offset: 0x18c
// Size: 0xf6, Type: bool
function use_ammo( item_def, item )
{
    foreach ( primary_weapon in self.primaryweapons )
    {
        if ( primary_weapon.inventorytype == "primary" && !istrue( primary_weapon.ismelee ) )
        {
            ammoamount = default_to( item.count, 20 );
            maxammo = primary_weapon.maxammo;
            var_c1192c297bbf292f = maxammo * ammoamount / 100;
            currentammostock = self getweaponammostock( primary_weapon );
            var_c1192c297bbf292f = currentammostock + var_c1192c297bbf292f;
            var_c1192c297bbf292f = clamp( var_c1192c297bbf292f, 0, maxammo );
            self setweaponammostock( primary_weapon, int( var_c1192c297bbf292f ) );
        }
    }
    
    return false;
}

