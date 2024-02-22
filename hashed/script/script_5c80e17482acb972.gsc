// mwiii decomp prototype
#using script_2669878cf5a1b6bc;
#using scripts\mp\class.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_cbc0dc8b9328d67d;

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe
// Size: 0x174
function function_b51c1b732564e22a(loadout) {
    if (getdvarint(@"hash_bfeff1537a1a0edc", 0)) {
        var_58bf9fc74049f30 = "weapon_sniper";
    }
    primaryweaponclass = function_b8811a0fc04e4b9d(loadout.loadoutprimary, #"menuclass");
    if (isdefined(var_58bf9fc74049f30) && primaryweaponclass != var_58bf9fc74049f30 || weaponisrestricted(loadout.loadoutprimary) || isdefined(primaryweaponclass) && function_dc0d4632189b623a(primaryweaponclass)) {
        var_5e6961853f911abf = namespace_d19129e4fa5d176::table_getweapon(level.classtablename, 0, 0);
        loadout.loadoutprimary = var_5e6961853f911abf;
        loadout.loadoutprimaryattachments = [];
        if (namespace_cd0b2d039510b38d::function_f24e99a2f548d0b8()) {
            loadout.loadoutprimaryvariantid = -1;
        }
    }
    secondaryweaponclass = function_b8811a0fc04e4b9d(loadout.loadoutsecondary, #"menuclass");
    if (isdefined(var_58bf9fc74049f30) && secondaryweaponclass != var_58bf9fc74049f30 || weaponisrestricted(loadout.loadoutsecondary) || isdefined(secondaryweaponclass) && function_dc0d4632189b623a(secondaryweaponclass)) {
        var_fbc41ef364d09cdb = namespace_d19129e4fa5d176::table_getweapon(level.classtablename, 0, 1);
        loadout.loadoutsecondary = var_fbc41ef364d09cdb;
        loadout.loadoutsecondaryattachments = [];
        if (namespace_cd0b2d039510b38d::function_f24e99a2f548d0b8()) {
            loadout.loadoutsecondaryvariantid = -1;
        }
    }
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a
// Size: 0x43
function function_156ccc6dd647aa1(loadout) {
    var_5e6961853f911abf = namespace_d19129e4fa5d176::table_getweapon(level.classtablename, 0, 0);
    loadout.loadoutprimary = var_5e6961853f911abf;
    loadout.loadoutprimaryattachments = [];
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5
// Size: 0x44
function function_32d6f8a1b0a2e3c1(loadout) {
    var_fbc41ef364d09cdb = namespace_d19129e4fa5d176::table_getweapon(level.classtablename, 0, 1);
    loadout.loadoutsecondary = var_fbc41ef364d09cdb;
    loadout.loadoutsecondaryattachments = [];
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0xae
function function_754c5fbcd73cf12d(loadout) {
    msg = "Overriding FLC Perks. ";
    for (i = 0; i < loadout.loadoutperks.size; i++) {
        msg = msg + "Perk " + i + ": " + loadout.loadoutperks[i];
    }
    /#
        /#
            assertmsg(msg);
        #/
        for (perkindex = 0; perkindex < loadout.loadoutperks.size; perkindex++) {
            loadout.loadoutperks[perkindex] = namespace_d19129e4fa5d176::function_f8e92e6cd8007d6b(level.classtablename, 0, perkindex);
        }
    #/
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7
// Size: 0x45
function function_625a1bdd25647c6b(loadout) {
    loadout.loadoutequipmentprimary = namespace_d19129e4fa5d176::table_getequipmentprimary(level.classtablename, 0);
    loadout.loadoutextraequipmentprimary = namespace_d19129e4fa5d176::table_getflcextraequipmentprimary(level.classtablename, 0);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x414
// Size: 0x45
function function_1ccfa7dccda7da0f(loadout) {
    loadout.loadoutequipmentsecondary = namespace_d19129e4fa5d176::table_getequipmentsecondary(level.classtablename, 0);
    loadout.loadoutextraequipmentsecondary = namespace_d19129e4fa5d176::table_getflcextraequipmentsecondary(level.classtablename, 0);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x461
// Size: 0x2a
function function_e856b1cacdcceca8(loadout) {
    loadout.loadoutfieldupgrade1 = namespace_d19129e4fa5d176::table_getsuper(level.classtablename, 0, 0);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x493
// Size: 0x43
function function_2981e0130f5d0598(loadout) {
    loadout = function_156ccc6dd647aa1(loadout);
    loadout = function_32d6f8a1b0a2e3c1(loadout);
    loadout = function_754c5fbcd73cf12d(loadout);
    loadout = function_625a1bdd25647c6b(loadout);
    loadout = function_1ccfa7dccda7da0f(loadout);
    loadout = function_e856b1cacdcceca8(loadout);
    return loadout;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4de
// Size: 0xa2
function function_ec995ec88ab7fb6c(loadout) {
    var_47533ef376cbeb37 = "specialty_null";
    foreach (perk in loadout.loadoutperks) {
        if (isdefined(perk) && isdefined(level.var_a1ad2758fcbd2f5e[perk])) {
            if (level.var_a1ad2758fcbd2f5e[perk].var_70774aeb81261100 == "vest") {
                var_47533ef376cbeb37 = perk;
            }
        }
    }
    return var_47533ef376cbeb37;
}

// Namespace namespace_cbc0dc8b9328d67d/namespace_89e4915e27d8b4fc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x588
// Size: 0x165
function function_8cdbad2a3681247e(perk, var_47533ef376cbeb37) {
    returnvalue = 0;
    if (isdefined(perk) && isdefined(level.var_a1ad2758fcbd2f5e[perk])) {
        switch (level.var_a1ad2758fcbd2f5e[perk].var_70774aeb81261100) {
        case #"hash_8cbf71797441f513":
            returnvalue = 1;
            break;
        case #"hash_6fb5d66c124bebf7":
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.gloves == 0) {
                returnvalue = 0;
            } else {
                returnvalue = 1;
            }
            break;
        case #"hash_998e90e64af76252":
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.footwear == 0) {
                returnvalue = 0;
            } else {
                returnvalue = 1;
            }
            break;
        case #"hash_60a8910f025fc58e":
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_7a0fa1d60675a7a2 == 0 && level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_185b68d5c03fde98 == 0) {
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
    /#
        assert(returnvalue, "FLC Perk not available in vest. Perk: " + perk);
    #/
    return returnvalue;
}

