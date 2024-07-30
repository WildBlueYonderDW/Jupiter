#using script_2669878cf5a1b6bc;
#using scripts\mp\class.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_cbc0dc8b9328d67d;

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe
// Size: 0x173
function overrideweapons(loadout) {
    if (getdvarint(@"hash_bfeff1537a1a0edc", 0)) {
        var_58bf9fc74049f30 = "weapon_sniper";
    }
    primaryweaponclass = function_b8811a0fc04e4b9d(loadout.loadoutprimary, #"menuclass");
    if (isdefined(var_58bf9fc74049f30) && primaryweaponclass != var_58bf9fc74049f30 || weaponisrestricted(loadout.loadoutprimary) || isdefined(primaryweaponclass) && function_dc0d4632189b623a(primaryweaponclass)) {
        fallbackprimary = scripts\mp\class::table_getweapon(level.classtablename, 0, 0);
        loadout.loadoutprimary = fallbackprimary;
        loadout.loadoutprimaryattachments = [];
        if (scripts\mp\utility\game::function_f24e99a2f548d0b8()) {
            loadout.loadoutprimaryvariantid = -1;
        }
    }
    secondaryweaponclass = function_b8811a0fc04e4b9d(loadout.loadoutsecondary, #"menuclass");
    if (isdefined(var_58bf9fc74049f30) && secondaryweaponclass != var_58bf9fc74049f30 || weaponisrestricted(loadout.loadoutsecondary) || isdefined(secondaryweaponclass) && function_dc0d4632189b623a(secondaryweaponclass)) {
        fallbacksecondary = scripts\mp\class::table_getweapon(level.classtablename, 0, 1);
        loadout.loadoutsecondary = fallbacksecondary;
        loadout.loadoutsecondaryattachments = [];
        if (scripts\mp\utility\game::function_f24e99a2f548d0b8()) {
            loadout.loadoutsecondaryvariantid = -1;
        }
    }
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a
// Size: 0x42
function overrideprimaryweapon(loadout) {
    fallbackprimary = scripts\mp\class::table_getweapon(level.classtablename, 0, 0);
    loadout.loadoutprimary = fallbackprimary;
    loadout.loadoutprimaryattachments = [];
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5
// Size: 0x43
function overridesecondaryweapon(loadout) {
    fallbacksecondary = scripts\mp\class::table_getweapon(level.classtablename, 0, 1);
    loadout.loadoutsecondary = fallbacksecondary;
    loadout.loadoutsecondaryattachments = [];
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0xad
function function_754c5fbcd73cf12d(loadout) {
    msg = "Overriding FLC Perks. ";
    for (i = 0; i < loadout.loadoutperks.size; i++) {
        msg += "Perk " + i + ": " + loadout.loadoutperks[i];
    }
    /#
        assertmsg(msg);
        for (perkindex = 0; perkindex < loadout.loadoutperks.size; perkindex++) {
            loadout.loadoutperks[perkindex] = scripts\mp\class::function_f8e92e6cd8007d6b(level.classtablename, 0, perkindex);
        }
    #/
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7
// Size: 0x44
function function_625a1bdd25647c6b(loadout) {
    loadout.loadoutequipmentprimary = scripts\mp\class::table_getequipmentprimary(level.classtablename, 0);
    loadout.loadoutextraequipmentprimary = scripts\mp\class::table_getFlcExtraEquipmentPrimary(level.classtablename, 0);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x414
// Size: 0x44
function function_1ccfa7dccda7da0f(loadout) {
    loadout.loadoutequipmentsecondary = scripts\mp\class::table_getequipmentsecondary(level.classtablename, 0);
    loadout.loadoutextraequipmentsecondary = scripts\mp\class::table_getFlcExtraEquipmentSecondary(level.classtablename, 0);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x461
// Size: 0x29
function overridesuper(loadout) {
    loadout.loadoutfieldupgrade1 = scripts\mp\class::table_getsuper(level.classtablename, 0, 0);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x493
// Size: 0x42
function function_2981e0130f5d0598(loadout) {
    loadout = overrideprimaryweapon(loadout);
    loadout = overridesecondaryweapon(loadout);
    loadout = function_754c5fbcd73cf12d(loadout);
    loadout = function_625a1bdd25647c6b(loadout);
    loadout = function_1ccfa7dccda7da0f(loadout);
    loadout = overridesuper(loadout);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4de
// Size: 0xa1
function function_ec995ec88ab7fb6c(loadout) {
    vestperk = "specialty_null";
    foreach (perk in loadout.loadoutperks) {
        if (isdefined(perk) && isdefined(level.perkbundles[perk])) {
            if (level.perkbundles[perk].var_70774aeb81261100 == "vest") {
                vestperk = perk;
            }
        }
    }
    return vestperk;
}

// Namespace namespace_cbc0dc8b9328d67d / namespace_89e4915e27d8b4fc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x588
// Size: 0x164
function function_8cdbad2a3681247e(perk, vestperk) {
    returnvalue = 0;
    if (isdefined(perk) && isdefined(level.perkbundles[perk])) {
        switch (level.perkbundles[perk].var_70774aeb81261100) {
        case #"hash_8cbf71797441f513": 
            returnvalue = 1;
            break;
        case #"hash_6fb5d66c124bebf7": 
            if (level.perkbundles[vestperk].var_885724e5007453be.gloves == 0) {
                returnvalue = 0;
            } else {
                returnvalue = 1;
            }
            break;
        case #"hash_998e90e64af76252": 
            if (level.perkbundles[vestperk].var_885724e5007453be.footwear == 0) {
                returnvalue = 0;
            } else {
                returnvalue = 1;
            }
            break;
        case #"hash_60a8910f025fc58e": 
            if (level.perkbundles[vestperk].var_885724e5007453be.gearone == 0 && level.perkbundles[vestperk].var_885724e5007453be.geartwo == 0) {
                returnvalue = 0;
            } else {
                returnvalue = 1;
            }
            break;
        default: 
            returnvalue = 0;
            break;
        }
    }
    assert(returnvalue, "FLC Perk not available in vest. Perk: " + perk);
    return returnvalue;
}

