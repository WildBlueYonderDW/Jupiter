#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\inventory_utility.gsc;

#namespace inventory_utility;

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8
// Size: 0x42
function _giveweapon(weapon, variant, dualwieldoverride, usedbefore) {
    if (!isdefined(variant)) {
        variant = -1;
    }
    if (!isdefined(usedbefore)) {
        usedbefore = 0;
    }
    self giveweapon(weapon, variant, istrue(dualwieldoverride), -1, usedbefore);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x342
// Size: 0x23
function _switchtoweapon(weapon) {
    /#
        debugweaponchangeprint("<dev string:x1c>", weapon);
    #/
    self switchtoweapon(weapon);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36d
// Size: 0x23
function _switchtoweaponimmediate(weapon) {
    /#
        debugweaponchangeprint("<dev string:x34>", weapon);
    #/
    self switchtoweaponimmediate(weapon);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x398
// Size: 0xd6
function _takeweapon(weapon) {
    /#
        if (getdvarint(@"hash_e6a5211d6811a3e", 0) != 0) {
            debugweaponchangeprint("<dev string:x55>", weapon);
            if (iscurrentweapon(weapon)) {
                println("<dev string:x69>");
            }
        }
    #/
    var_fa1a9e12f5788a39 = 0;
    if (isweapon(weapon)) {
        var_fa1a9e12f5788a39 = self gethighpriorityweapon() == weapon;
    } else {
        assert(isstring(weapon));
        var_fa1a9e12f5788a39 = getcompleteweaponname(self gethighpriorityweapon()) == weapon;
    }
    if (var_fa1a9e12f5788a39) {
        weaponstring = weapon;
        if (!isstring(weaponstring) && isweapon(weapon)) {
            weaponstring = getcompleteweaponname(weapon);
        }
        assertmsg("<dev string:x88>" + weaponstring + "<dev string:xcf>");
        self clearhighpriorityweapon(weapon);
    }
    self takeweapon(weapon);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x476
// Size: 0x7b
function takeweaponwhensafe(weapon) {
    self endon("death");
    self endon("disconnect");
    while (true) {
        var_8dcc03beca90a5de = 0;
        if (!iscurrentweapon(weapon)) {
            var_91ede5f353376127 = self getweaponmeleeslot();
            if (!isnullweapon(var_91ede5f353376127) && self.currentweapon == var_91ede5f353376127) {
                var_8dcc03beca90a5de = 0;
            } else {
                var_8dcc03beca90a5de = 1;
            }
        }
        if (var_8dcc03beca90a5de) {
            break;
        }
        waitframe();
    }
    _takeweapon(weapon);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f9
// Size: 0x27
function getcurrentmonitoredweaponswitchweapon() {
    validatehighpriorityflag();
    var_d93faf2b91e9b072 = self gethighpriorityweapon();
    if (isnullweapon(var_d93faf2b91e9b072)) {
        return undefined;
    }
    return var_d93faf2b91e9b072;
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x529
// Size: 0x9
function isanymonitoredweaponswitchinprogress() {
    return isdefined(getcurrentmonitoredweaponswitchweapon());
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53b
// Size: 0x42
function isswitchingtoweaponwithmonitoring(weapon) {
    if (isstring(weapon)) {
        weapon = makeweaponfromstring(weapon);
    }
    currentswitchweapon = getcurrentmonitoredweaponswitchweapon();
    return isdefined(currentswitchweapon) && currentswitchweapon == weapon && !iscurrentweapon(weapon);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x586
// Size: 0x109
function candomonitoredswitchtoweapon(weapon, var_26ca36763fa5b82) {
    if (!self hasweapon(weapon)) {
        return false;
    }
    if (!val::get("weapon")) {
        return false;
    }
    if (!istrue(var_26ca36763fa5b82) && !val::get("weapon_switch") && !val::get("script_weapon_switch")) {
        return false;
    }
    if (getdvarint(@"hash_c2eb94ce7d7bc097", 0) && self isviewmodelanimplaying()) {
        return false;
    }
    var_d93faf2b91e9b072 = getcurrentmonitoredweaponswitchweapon();
    if (isdefined(var_d93faf2b91e9b072)) {
        weaponbasename = getweaponbasename(weapon);
        var_958b9a25c5911d97 = 0;
        if (weaponbasename == "briefcase_bomb_mp" || weaponbasename == "briefcase_bomb_mp_nuke" || weaponbasename == "briefcase_bomb_defuse_mp" || weaponbasename == "iw9_cyberemp_mp" || weaponbasename == "iw7_tdefball_mp") {
            var_958b9a25c5911d97 = 1;
        } else if (weaponinventorytype(var_d93faf2b91e9b072) == "primary") {
            var_958b9a25c5911d97 = 1;
        }
        if (!var_958b9a25c5911d97) {
            return false;
        }
    }
    if (iscurrentweapon(weapon)) {
        return false;
    }
    return true;
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x698
// Size: 0x4c
function abortmonitoredweaponswitch(weapon) {
    /#
        debugweaponchangeprint("<dev string:xf0>", weapon);
    #/
    assertex(!iscurrentweapon(weapon), "<dev string:xfd>");
    if (self gethighpriorityweapon() == weapon) {
        self clearhighpriorityweapon(weapon);
    }
    _takeweapon(weapon);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6ed
// Size: 0x14e
function domonitoredweaponswitch(weapon, switchimmediate, var_26ca36763fa5b82, canceloffhand) {
    self endon("disconnect");
    self endon("death");
    if (!isdefined(weapon)) {
        return 0;
    }
    /#
        debugweaponchangeprint("<dev string:x14a>", weapon);
    #/
    if (!candomonitoredswitchtoweapon(weapon, var_26ca36763fa5b82)) {
        /#
            debugweaponchangeprint("<dev string:x171>", weapon);
        #/
        return 0;
    }
    if (isanymonitoredweaponswitchinprogress()) {
        self clearhighpriorityweapon(getcurrentmonitoredweaponswitchweapon());
    }
    self sethighpriorityweapon(weapon);
    if (istrue(switchimmediate)) {
        _switchtoweaponimmediate(weapon);
    }
    while (true) {
        if (iscurrentweapon(weapon)) {
            validatehighpriorityflag();
            /#
                debugweaponchangeprint("<dev string:x19f>", weapon);
            #/
            return 1;
        }
        if (!self ishighpriorityweapon(weapon) || !self hasweapon(weapon)) {
            /#
                debugweaponchangeprint("<dev string:x1c8>", weapon);
            #/
            return 0;
        }
        if (!val::get("weapon") || !istrue(var_26ca36763fa5b82) && !val::get("weapon_switch") && !val::get("script_weapon_switch")) {
            /#
                debugweaponchangeprint("<dev string:x20d>", weapon);
            #/
            self clearhighpriorityweapon(weapon);
            return 0;
        }
        if (istrue(canceloffhand) && !isnullweapon(self getheldoffhand())) {
            self function_187fb04ebd01baea();
        }
        waitframe();
    }
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x843
// Size: 0x7
function function_ed0dd95e839cd2a9() {
    return "iw9_gunless_mp";
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x853
// Size: 0x7
function function_3d5c51904fd25773() {
    return "iw9_gunless_quickdrop_mp";
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x863
// Size: 0x18
function function_fc6a5b145563be33(switchimmediate) {
    return function_6d53276bd8e3c46d(switchimmediate, function_ed0dd95e839cd2a9());
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x884
// Size: 0x18
function function_f1e9d0c09f38006b(switchimmediate) {
    return function_6d53276bd8e3c46d(switchimmediate, function_3d5c51904fd25773());
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8a5
// Size: 0xee
function function_6d53276bd8e3c46d(switchimmediate, weaponname) {
    self endon("death_or_disconnect");
    if (!isdefined(weaponname)) {
        return;
    }
    if (isdefined(self.gunnlessweapon)) {
        return;
    }
    gunless = makeweapon(weaponname);
    scripts\cp_mp\utility\inventory_utility::_giveweapon(gunless, undefined, undefined, 1);
    self.gunnlessweapon = gunless;
    val::reset_all("gunless");
    val::set("gunless", "script_weapon_switch", 1);
    println(self.name + "<dev string:x245>");
    if (!isdefined(switchimmediate)) {
        switchimmediate = 0;
    }
    success = scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch(gunless, switchimmediate);
    if (!success) {
        if (!isnullweapon(gunless)) {
            scripts\cp_mp\utility\inventory_utility::_takeweapon(gunless);
        }
        scripts\cp_mp\utility\inventory_utility::forcevalidweapon();
    }
    val::set("gunless", "script_weapon_switch", 0);
    println(self.name + "<dev string:x270>");
    return success;
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99c
// Size: 0x128
function function_9897d143c3feee05() {
    self endon("death_or_disconnect");
    if (!isdefined(self.gunnlessweapon)) {
        return;
    }
    if (!self hasweapon(self.gunnlessweapon)) {
        self.gunnlessweapon = undefined;
        return;
    }
    if (ent_flag_exist("swapLoadout_pending") && ent_flag("swapLoadout_pending")) {
        ent_flag_wait("swapLoadout_complete");
    }
    val::reset_all("gunless");
    val::set("gunless", "script_weapon_switch", 1);
    println(self.name + "<dev string:x29b>");
    while (isdefined(self.gunnlessweapon) && self hasweapon(self.gunnlessweapon)) {
        if (!scripts\cp_mp\utility\inventory_utility::iscurrentweapon(self.gunnlessweapon)) {
            scripts\cp_mp\utility\inventory_utility::abortmonitoredweaponswitch(self.gunnlessweapon);
        } else {
            scripts\cp_mp\utility\inventory_utility::_takeweapon(self.gunnlessweapon);
            scripts\cp_mp\utility\inventory_utility::forcevalidweapon();
        }
        waitframe();
    }
    self.gunnlessweapon = undefined;
    val::set("gunless", "script_weapon_switch", 0);
    println(self.name + "<dev string:x2c6>");
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacc
// Size: 0x26
function validatehighpriorityflag() {
    currentweapon = self getcurrentweapon();
    if (self ishighpriorityweapon(currentweapon)) {
        self clearhighpriorityweapon(currentweapon);
    }
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xafa
// Size: 0xb6
function getridofweapon(weapon, switchimmediate) {
    self endon("death");
    self endon("disconnect");
    if (!self hasweapon(weapon)) {
        return false;
    }
    if (!iscurrentweapon(weapon)) {
        _takeweapon(weapon);
        return true;
    }
    while (isanymonitoredweaponswitchinprogress()) {
        waitframe();
    }
    if (!iscurrentweapon(weapon)) {
        _takeweapon(weapon);
        return true;
    }
    switchresult = domonitoredweaponswitch(self.lastdroppableweaponobj, switchimmediate);
    if (isbot(self)) {
        self switchtoweaponimmediate(nullweapon());
        switchresult = 1;
    }
    _takeweapon(weapon);
    self notify("bomb_allow_offhands");
    if (!switchresult) {
        forcevalidweapon();
    }
    return true;
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb9
// Size: 0x290
function forcevalidweapon(bestweaponobj) {
    self endon("death");
    self endon("disconnect");
    while (isnullweapon(self getcurrentweapon())) {
        if (self isswitchingweapon() || isanymonitoredweaponswitchinprogress()) {
            waitframe();
            continue;
        }
        var_78660c26e2d18376 = bestweaponobj;
        if (istrue(self.isjuggernaut)) {
            var_d5a7e66722df9836 = undefined;
            if (utility::iscp()) {
                var_d5a7e66722df9836 = "iw9_lm_dblmg2_cp";
            } else {
                var_d5a7e66722df9836 = "iw9_minigunksjugg_mp";
            }
            if (issharedfuncdefined("juggernaut", "getMinigunWeapon")) {
                var_d5a7e66722df9836 = self [[ getsharedfunc("juggernaut", "getMinigunWeapon") ]]();
            }
            if (issharedfuncdefined("juggernaut", "canUseWeaponPickups")) {
                canUseWeaponPickups = self [[ getsharedfunc("juggernaut", "canUseWeaponPickups") ]]();
                if (istrue(canUseWeaponPickups)) {
                    if (isdefined(self.lastdroppableweaponobj) && self hasweapon(self.lastdroppableweaponobj)) {
                        var_d5a7e66722df9836 = self.lastdroppableweaponobj;
                    } else {
                        currentprimaries = getcurrentprimaryweaponsminusalt();
                        if (currentprimaries.size > 0) {
                            var_d5a7e66722df9836 = currentprimaries[0];
                        }
                    }
                }
            }
            if (isstring(var_d5a7e66722df9836)) {
                var_78660c26e2d18376 = makeweapon(var_d5a7e66722df9836);
            } else {
                var_78660c26e2d18376 = var_d5a7e66722df9836;
            }
        } else {
            currentprimaries = getcurrentprimaryweaponsminusalt();
            if (!isdefined(var_78660c26e2d18376) || !self hasweapon(var_78660c26e2d18376)) {
                if ((!isdefined(self.lastdroppableweaponobj) || self.lastdroppableweaponobj.basename == "none") && !self hasweapon("iw9_me_fists_mp")) {
                    assertmsg("<dev string:x2f1>");
                    break;
                }
                if (self hasweapon(self.lastdroppableweaponobj)) {
                    var_78660c26e2d18376 = self.lastdroppableweaponobj;
                } else if (currentprimaries.size > 0) {
                    var_78660c26e2d18376 = currentprimaries[0];
                }
            }
            if (isdefined(var_78660c26e2d18376) && getweaponbasename(var_78660c26e2d18376) == "iw7_axe_mp" && self getweaponammoclip(var_78660c26e2d18376) == 0 && currentprimaries.size == 1) {
                var_78660c26e2d18376.basename = "iw9_me_fists_mp";
            } else if (self hasweapon("iw9_me_fists_mp")) {
                if (currentprimaries.size == 1) {
                    var_78660c26e2d18376 = currentprimaries[0];
                } else if (currentprimaries.size == 2 && (self hasweapon("iw9_knifestab_mp") || self hasweapon("iw8_throwingknife_fire_melee_mp") || self hasweapon("iw8_throwingknife_electric_melee_mp"))) {
                    if (currentprimaries[0].basename == "iw9_me_fists_mp") {
                        var_78660c26e2d18376 = currentprimaries[0];
                    } else {
                        var_78660c26e2d18376 = currentprimaries[1];
                    }
                }
            }
        }
        domonitoredweaponswitch(var_78660c26e2d18376);
        waitframe();
    }
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe51
// Size: 0x2a
function iscurrentweapon(weapon) {
    if (isstring(weapon)) {
        weapon = makeweaponfromstring(weapon);
    }
    return issameweapon(self getcurrentweapon(), weapon, 1);
}

// Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe84
// Size: 0x76
function getcurrentprimaryweaponsminusalt() {
    primaryweapons = [];
    currentweapons = self getweaponslistprimaries();
    foreach (weapon in currentweapons) {
        if (!weapon.isalternate) {
            primaryweapons[primaryweapons.size] = weapon;
        }
    }
    return primaryweapons;
}

/#

    // Namespace inventory_utility / scripts\cp_mp\utility\inventory_utility
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xf03
    // Size: 0x5d
    function debugweaponchangeprint(message, weapon) {
        weaponstring = undefined;
        if (isstring(weapon)) {
            weaponstring = weapon;
        } else {
            weaponstring = getcompleteweaponname(weapon);
        }
        if (getdvarint(@"hash_e6a5211d6811a3e", 0) != 0) {
            println(message + "<dev string:x356>" + weaponstring);
        }
    }

#/
