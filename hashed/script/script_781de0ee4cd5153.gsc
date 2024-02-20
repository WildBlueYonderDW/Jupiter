// mwiii decomp prototype
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;

#namespace namespace_357503b62afdbcce;

// Namespace namespace_357503b62afdbcce/namespace_29d0f7f595f86b3f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc4
// Size: 0x8a
function function_e6019a2d874f8c36(weaponname, var_fc5b5cabb888a488, position, angles) {
    var_e7cd53fcb3b3e346 = strtok(var_fc5b5cabb888a488, "+");
    weaponobj = buildweapon(weaponname, var_e7cd53fcb3b3e346, undefined, undefined, -1, undefined, undefined, undefined, 0);
    var_cb4fad49263e20c4 = getitemdropinfo(position, angles);
    weaponpickup = spawnpickup("brloot_weapon_generic_ar", var_cb4fad49263e20c4, 30, 1, weaponobj, 0, 0, 0);
    return weaponpickup;
}

// Namespace namespace_357503b62afdbcce/namespace_29d0f7f595f86b3f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156
// Size: 0x4a
function function_40f588e8c075f3a1(var_c9f65801a0258b90) {
    objweapon = level.player getcurrentweapon();
    var_811abfdb6c33f17f = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(objweapon);
    var_9c6a94f2fb790c57 = spawnscriptable(var_811abfdb6c33f17f, var_c9f65801a0258b90);
    return var_9c6a94f2fb790c57;
}

// Namespace namespace_357503b62afdbcce/namespace_29d0f7f595f86b3f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8
// Size: 0x2c
function function_198b77714911ae07(var_2ab69f8accb95d4a) {
    self endon("death");
    self endon("disconnect");
    while (!self isreloading()) {
        waitframe();
    }
    self [[ var_2ab69f8accb95d4a ]]();
}

// Namespace namespace_357503b62afdbcce/namespace_29d0f7f595f86b3f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x32
function function_d88d4f1f9cbb8512() {
    var_7803c95645e637e1 = getfirstprimaryweapon();
    if (isdefined(var_7803c95645e637e1) && var_7803c95645e637e1.basename != "iw9_me_fists_mp") {
        return 1;
    }
    return 0;
}

