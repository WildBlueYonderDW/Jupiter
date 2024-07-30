#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_2aabac61f2ae422;
#using scripts\mp\equipment.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\stats.gsc;

#namespace weapon;

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a71
// Size: 0x3f
function getattachmenttype(attachmentname) {
    if (!isdefined(attachmentname)) {
        assertmsg("Weapon.gsc - getAttachmentType was passed an undefined attachmentName");
        return "";
    }
    attachmenttype = tablelookup("mp/attachmenttable.csv", 4, attachmentname, 2);
    return attachmenttype;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab9
// Size: 0x4f
function getcompleteweaponnamenoalt(objweapon) {
    if (!isdefined(objweapon)) {
        assertmsg("Weapon.gsc - getCompleteWeaponNameNoAlt was passed an undefined objWeapon");
        return "";
    }
    fullname = getcompleteweaponname(objweapon);
    if (istrue(objweapon.isalternate)) {
        fullname = getsubstr(fullname, 4);
    }
    return fullname;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b11
// Size: 0x265
function getweapontype(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - getWeaponType was passed an undefined weapon: " + weapon);
        return "";
    }
    if (iscacprimaryweapon(weapon)) {
        return "primary";
    }
    if (iscacsecondaryweapon(weapon)) {
        return "secondary";
    }
    if (iskillstreakweapon(weapon)) {
        return "killstreak";
    }
    if (scripts\cp_mp\utility\killstreak_utility::iskillstreakdeployweapon(weapon)) {
        return "killstreak_deploy";
    }
    if (namespace_49492dacb8708592::function_fceaa660b4da1c2b(weapon)) {
        return "super_deploy";
    }
    if (issuperweapon(weapon)) {
        return "super";
    }
    if (isgamemodeweapon(weapon)) {
        return "gamemode";
    }
    if (weapon == "iw8_turret_50cal_mp") {
        return "turret";
    }
    if (islevelweapon(weapon)) {
        return "level";
    }
    if (string_starts_with(weapon, "destructible_")) {
        return "destructible";
    }
    if (isvehicleweapon(weapon)) {
        return "vehicle";
    }
    if (isspecialmeleeweapon(weapon) || weapon == "iw8_defibrillator_mp") {
        return "special_melee";
    }
    if (isenvironmentweapon(weapon)) {
        return "environment";
    }
    equipmenttype = getequipmenttype(weapon);
    if (isdefined(equipmenttype)) {
        return equipmenttype;
    }
    if (weapon == "none" || issubstr(weapon, "execution")) {
        return "worldspawn";
    }
    if (weapon == "bomb_site_mp") {
        return weapon;
    }
    if (weapon == "iw9_racecar_mp") {
        return weapon;
    }
    if (weapon == "iw8_gunless" || weapon == "iw8_gunless_infil" || weapon == "iw9_gunless_quickdrop_mp" || weapon == "iw9_gunless_mp") {
        return "gunless";
    }
    if (weapon == "iw9_armor_plate_deploy_mp") {
        return weapon;
    }
    if (weapon == "trophy_submunition") {
        return "super";
    }
    if (weapon == "flare_dmz_pmc") {
        return "super";
    }
    if (weapon == "chopper_gunner_turret_ballistics_dmz") {
        return "turret";
    }
    if (weapon == "airdrop_escort_turret_ballistics_champion") {
        return "turret";
    }
    if (weapon == "samsite_missile_weapon") {
        return "turret";
    }
    if (weapon == "pac_sentry_turret_dmz_biolab") {
        return "turret";
    }
    if (isfistsonly(weapon)) {
        return "fists";
    }
    if (weapon == "molotov_mp") {
        return "lethal";
    }
    if (weapon == "teammate_revive_stim_mp") {
        return "revive";
    }
    if (weapon == "jup_ob_defend_turret") {
        return "turret";
    }
    if (weapon == "gas_grenade_exgm_chemist_tripwire") {
        return "lethal";
    }
    /#
        if (getdvarint(@"hash_6abd5bf5b9ec7b21", 0) > 0) {
            return "<dev string:x1c>";
        }
    #/
    return "unknown";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7f
// Size: 0x7f
function getequipmenttype(objweapon) {
    if (isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    equipmentref = default_to(objweapon.equipmentref, scripts\mp\equipment::getequipmentreffromweapon(objweapon));
    if (isdefined(equipmentref)) {
        bundle = level.equipment.table[equipmentref].bundle;
        if (isdefined(bundle)) {
            return bundle.equipmenttype;
        }
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e06
// Size: 0x94
function isenvironmentweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("isEnvironmentWeapon called without a weapon name passed in");
        return false;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_11794b1322a8395a":
    case #"hash_25aa30a2dfbe54c9":
    case #"hash_d54353bd11bf0a99":
    case #"hash_f91d639d29feb858": 
        return true;
    default: 
        break;
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea3
// Size: 0x28
function issuperweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("isSuperWeapon called without a weapon name passed in");
        return false;
    }
    return isdefined(scripts\mp\supers::getsuperrefforsuperweapon(weapon));
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed4
// Size: 0x16
function isakimbo(weapon) {
    return getweaponhasperk(weapon, "specialty_akimbo");
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef3
// Size: 0x68
function issuperdamagesource(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    if (issuperweapon(weapon)) {
        return true;
    }
    if (weaponname == "chargemode_mp") {
        return true;
    }
    if (weaponname == "micro_turret_gun_mp") {
        return true;
    }
    if (weaponname == "super_trophy_mp") {
        return true;
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f64
// Size: 0xb8
function isgamemodeweapon(weapon) {
    if (isbombsiteweapon(weapon)) {
        return true;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    if (!isdefined(weaponname)) {
        assertmsg("isGameModeWeapon() Weapon name is undefined");
        return false;
    }
    switch (weaponname) {
    case #"hash_27f14c8552651e3e":
    case #"hash_407fb430e585a663":
    case #"hash_49916cc2063b45a3":
    case #"hash_4a4a84c8d5338700":
    case #"hash_f143184c167eb256":
    case #"hash_f91d639d29feb858": 
        return true;
    default: 
        return false;
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2025
// Size: 0x69
function islevelweapon(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_6b9700922cc910a9": 
        return true;
    case #"hash_75dcb56b1fcdd293": 
        return true;
    default: 
        return false;
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2097
// Size: 0xa2
function getweapongroup(weapon) {
    group = getbaseweapongroup(weapon);
    if (!isdefined(group)) {
        if (issuperweapon(weapon)) {
            group = "super";
        } else if (iskillstreakweapon(weapon)) {
            group = "killstreak";
        } else if (isgamemodeweapon(weapon)) {
            group = "gamemode";
        } else if (isballisticspecial(weapon)) {
            group = "weapon_ballisticSpecial";
        } else if (isdragonsbreath(weapon)) {
            group = "weapon_dragonsBreath";
        } else if (isunderwaterweapon(weapon)) {
            group = "weapon_underwater";
        } else {
            group = "other";
        }
    }
    return group;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2142
// Size: 0x79
function getbaseweapongroup(weapon) {
    if (!isdefined(weapon)) {
        return "other";
    }
    if (isweapon(weapon) && isnullweapon(weapon)) {
        return "other";
    }
    if (isstring(weapon) && (weapon == "none" || weapon == "alt_none")) {
        return "other";
    }
    rootname = getweaponrootname(weapon);
    group = weapongroupmap(rootname);
    return group;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c4
// Size: 0x4c
function isunderwaterweapon(weapon) {
    if (!isdefined(weapon)) {
        return false;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    return weaponname == "iw9_me_diveknife_mp" || weaponname == "iw9_swimfists_mp";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2219
// Size: 0x3a
function function_3f15e5e526ff94ce(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    return weaponname == "iw9_me_climbfists";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225c
// Size: 0x3a
function function_1e9278ba699927f7(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    return weaponname == "iw9_pi_stimpistol_mp";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x229f
// Size: 0x53
function isdragonsbreath(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isDragonsBreath was passed an undefined weapon name");
        return false;
    }
    weaponname = "";
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    return weaponname == "dragonsbreath_mp";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22fb
// Size: 0xad
function isballisticspecial(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_104394c101679f9e":
    case #"hash_1a9da8a4fac9fde4":
    case #"hash_83d55c8dbb9f72ba":
    case #"hash_9b89ea95df7dfadb":
    case #"hash_a49fac234083ff01":
    case #"hash_b8c7008e1d8543df":
    case #"hash_d30bcd7e470500f3":
    case #"hash_d78eda24c2fd8252": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23b0
// Size: 0xae
function getallselectableattachments(weapon) {
    weaponname = getweaponrootname(weapon);
    weaponstrtok = strtok(weaponname, "_");
    gunname = weaponstrtok[2];
    attachments = [];
    foreach (attachmentindex, attachment in level.weaponattachments) {
        if (issubstr(attachmentindex, gunname)) {
            attachments[attachments.size] = attachmentindex;
        }
    }
    return attachments;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2467
// Size: 0x5e
function getdefaultweaponbasename(basename) {
    rootname = getweaponrootname(basename);
    if (isdefined(level.weaponmapdata[rootname]) && isdefined(level.weaponmapdata[rootname].assetname)) {
        basename = level.weaponmapdata[rootname].assetname;
    }
    return basename;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ce
// Size: 0x40
function getweaponbasenamescript(weapon) {
    if (isweapon(weapon)) {
        return weapon.basename;
    }
    if (isstring(weapon) && weapon == "none") {
        return "none";
    }
    return getweaponbasename(weapon);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2517
// Size: 0x59
function getweapongunsmithattachmenttable(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    var_49e6ef3edadd524e = getweaponrootname(weaponname);
    return "mp/gunsmith/" + getsubstr(var_49e6ef3edadd524e, 4) + "_attachments.csv";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2579
// Size: 0x27
function getaltmodeweapon(objweapon) {
    if (isdefined(objweapon.underbarrel)) {
        return objweapon.underbarrel;
    }
    return undefined;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a9
// Size: 0x27
function function_b53839dc08a64fde(objweapon) {
    if (isdefined(objweapon.underbarrelvarindex)) {
        return objweapon.underbarrelvarindex;
    }
    return undefined;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d9
// Size: 0x23
function isaltmodeweapon(weaponname) {
    if (weaponname == "none") {
        return false;
    }
    return weaponinventorytype(weaponname) == "altmode";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2605
// Size: 0x20
function removealtmodefromweaponname(weaponname) {
    if (isaltmodeweapon(weaponname)) {
        weaponname = getsubstr(weaponname, 4);
    }
    return weaponname;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x262e
// Size: 0xaa
function getvalidextraammoweapons() {
    weaponlist = [];
    primarylist = self getweaponslistprimaries();
    foreach (primary in primarylist) {
        weapclass = weaponclass(primary);
        if (!iskillstreakweapon(primary) && weapclass != "grenade" && weapclass != "rocketlauncher" && self getweaponammostock(primary) != 0) {
            weaponlist[weaponlist.size] = primary;
        }
    }
    return weaponlist;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e1
// Size: 0xbe
function ispickedupweapon(weapon) {
    if (iscacprimaryorsecondary(weapon)) {
        weapname = undefined;
        if (isweapon(weapon)) {
            weapname = getcompleteweaponname(weapon getnoaltweapon());
        } else if (isstring(weapon)) {
            weapname = weapon;
            if (issubstr(weapname, "alt_")) {
                weapname = getsubstr(weapname, 4, weapon.size);
            }
        }
        var_d721c63a9570d5c = isdefined(scripts\mp\utility\stats::getpersstat("primaryWeapon")) && scripts\mp\utility\stats::getpersstat("primaryWeapon") == weapname;
        var_7df1c1394810bf14 = isdefined(scripts\mp\utility\stats::getpersstat("secondaryWeapon")) && scripts\mp\utility\stats::getpersstat("secondaryWeapon") == weapname;
        if (!var_d721c63a9570d5c && !var_7df1c1394810bf14) {
            return true;
        }
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a8
// Size: 0x19
function iscacprimaryweapon(weapon) {
    return iscacprimaryweapongroup(getweapongroup(weapon), weapon);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ca
// Size: 0xb1
function iscacprimaryweapongroup(weapongroup, weapon) {
    switch (weapongroup) {
    case #"hash_bef5ec0b3e197ae":
    case #"hash_16cf6289ab06bd30":
    case #"hash_2535634d8bb5c955":
    case #"hash_3df32e3d76b9b4d4":
    case #"hash_47368bc0d2ef1565":
    case #"hash_86b11ac21f992552":
    case #"hash_8af0086b038622b5":
    case #"hash_ab10f9c080fe4faf":
    case #"hash_beb5fb9bd9c6cc5c":
    case #"hash_c095d67337b1f5a1":
    case #"hash_dd616da0b395a0b0": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2883
// Size: 0x19
function iscacsecondaryweapon(weapon) {
    return iscacsecondaryweapongroup(getweapongroup(weapon), weapon);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a5
// Size: 0x69
function iscacsecondaryweapongroup(weapongroup, weapon) {
    switch (weapongroup) {
    case #"hash_34340d457a63e7f1":
    case #"hash_9d18adab1b65a661": 
        return 1;
    case #"hash_a1f27f97be15d620": 
        return !isspecialmeleeweapon(weapon);
    case #"hash_a4b73ae5b4b9158b": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2916
// Size: 0x31
function iscacprimaryorsecondary(weapon) {
    weapongroup = getweapongroup(weapon);
    return iscacprimaryweapongroup(weapongroup, weapon) || iscacsecondaryweapongroup(weapongroup, weapon);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2950
// Size: 0x2f
function iscacmeleeweapon(weapon) {
    group = getweapongroup(weapon);
    return group == "weapon_melee" || group == "weapon_melee2";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2988
// Size: 0x2a
function enableweaponlaser() {
    if (!isdefined(self.weaponlasercalls)) {
        self.weaponlasercalls = 0;
    }
    self.weaponlasercalls++;
    self laseron();
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ba
// Size: 0x5c
function disableweaponlaser() {
    assertex(isdefined(self.weaponlasercalls), "disableWeaponLaser() called before at least one enableWeaponLaser() call.");
    self.weaponlasercalls--;
    assertex(self.weaponlasercalls >= 0, "disableWeaponLaser() called at least one more time than enableWeaponLaser() causing a negative call count.");
    if (self.weaponlasercalls == 0) {
        self laseroff();
        self.weaponlasercalls = undefined;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1e
// Size: 0x63
function weaponperkmap(weaponroot) {
    assertex(isdefined(level.weaponmapdata), "weaponPerkMap() called without first calling buildWeaponMap().");
    if (isdefined(level.weaponmapdata[weaponroot]) && isdefined(level.weaponmapdata[weaponroot].perk)) {
        return level.weaponmapdata[weaponroot].perk;
    }
    return undefined;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8a
// Size: 0x35
function getrandomweaponfromgroup(group) {
    index = randomintrange(0, level.weapongroupdata[group].size);
    return level.weapongroupdata[group][index];
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac8
// Size: 0xa9
function getweaponvariantids(weaponroot, blockedids) {
    assertex(isdefined(level.weaponlootmapdata), "getWeaponValidVariantIDs() called without level.weaponLootMapData being populated.");
    if (!isdefined(blockedids)) {
        blockedids = [];
    }
    id = 1;
    variantids = [];
    while (true) {
        variantkey = weaponroot + "|" + id;
        if (!isdefined(level.weaponlootmapdata[variantkey])) {
            break;
        }
        if (!level.weaponlootmapdata[variantkey].islocked && !array_contains(blockedids, id)) {
            variantids[variantids.size] = id;
        }
        id++;
    }
    return variantids;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7a
// Size: 0x65
function getweaponrandomvariantid(weaponroot, blockedids) {
    assertex(isdefined(level.weaponlootmapdata), "getWeaponRandomValidVariantID() called without level.weaponLootMapData being populated.");
    if (!isdefined(blockedids)) {
        blockedids = [];
    }
    id = 0;
    validids = getweaponvariantids(weaponroot, blockedids);
    if (validids.size > 0) {
        id = validids[randomint(validids.size)];
    }
    return id;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be8
// Size: 0x17
function weaponexistsinstatstable(weaponroot) {
    return isdefined(level.weaponmapdata[weaponroot]);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c08
// Size: 0x85
function weaponisvalid(weaponroot, variantid) {
    validroot = weaponexistsinstatstable(weaponroot);
    validvariant = 1;
    if (validroot) {
        if (isdefined(isdefined(variantid)) && variantid > 0) {
            variantkey = weaponroot + "|" + variantid;
            validvariant = isdefined(level.weaponlootmapdata[variantkey]) && !istrue(level.weaponlootmapdata[variantkey].islocked);
        }
    }
    return validroot && validvariant;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c96
// Size: 0x31
function isattachmentsniperscopedefault(weaponname, attachname) {
    tokens = strtok(weaponname, "_");
    return isattachmentsniperscopedefaulttokenized(tokens, attachname);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd0
// Size: 0xba
function isattachmentsniperscopedefaulttokenized(weapontokens, attachname) {
    assertex(isarray(weapontokens), "isAttachmentSniperScopeDefaultTokenized() called with non array weapon name.");
    result = 0;
    if (weapontokens.size && isdefined(attachname)) {
        idx = 0;
        if (weapontokens[0] == "alt") {
            idx = 1;
        }
        if (weapontokens.size >= 3 + idx && (weapontokens[idx] == "iw6" || weapontokens[idx] == "iw7")) {
            if (weaponclass(weapontokens[idx] + "_" + weapontokens[idx + 1] + "_" + weapontokens[idx + 2]) == "sniper") {
                result = weapontokens[idx + 1] + "scope" == attachname;
            }
        }
    }
    return result;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d93
// Size: 0x9e
function getnonopticattachmentlistbasenames() {
    attachmentlist = [];
    numrows = tablelookupgetnumrows("mp/attachmenttable.csv");
    for (index = 0; index < numrows; index++) {
        attachmentname = tablelookupbyrow("mp/attachmenttable.csv", index, 5);
        group = tablelookupbyrow("mp/attachmenttable.csv", index, 2);
        if (attachmentname != "" && group != "none" && group != "rail" && !array_contains(attachmentlist, attachmentname)) {
            attachmentlist[attachmentlist.size] = attachmentname;
        }
    }
    return attachmentlist;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3a
// Size: 0xbc
function getopticattachmentlistbasenames() {
    if (isdefined(level.opticattachmentbasenames)) {
        return level.opticattachmentbasenames;
    }
    attachmentlist = [];
    numrows = tablelookupgetnumrows("mp/attachmenttable.csv");
    for (index = 0; index < numrows; index++) {
        group = tablelookupbyrow("mp/attachmenttable.csv", index, 2);
        attachmentname = tablelookupbyrow("mp/attachmenttable.csv", index, 5);
        if (attachmentname != "" && group == "rail" && !array_contains(attachmentlist, attachmentname)) {
            attachmentlist[attachmentlist.size] = attachmentname;
        }
    }
    level.opticattachmentbasenames = attachmentlist;
    return level.opticattachmentbasenames;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eff
// Size: 0x306
function mapweapon(objweapon, inflictor, var_a2c7a399ae430eb) {
    var_eef5ad438e5fa0c2 = objweapon;
    if (!isdefined(objweapon)) {
        var_eef5ad438e5fa0c2 = nullweapon();
    }
    var_ea958bd2fa62a2fa = 0;
    if (var_eef5ad438e5fa0c2.basename != "none") {
        if (isdefined(inflictor) && !isplayer(inflictor)) {
            altweapon = getaltmodeweapon(objweapon);
            if (isdefined(altweapon)) {
                switch (altweapon) {
                case #"hash_46f5e5d5dcc40a15":
                case #"hash_4adaf4a688093960":
                case #"hash_91c4e6c99dbd12fa":
                case #"hash_bf9186d366bb0638": 
                    var_eef5ad438e5fa0c2 = makeweapon("concussion_grenade_mp");
                    break;
                case #"hash_4aeb965aa988c369":
                case #"hash_d376328b0052cc6d":
                case #"hash_d78170432d48ea13":
                case #"hash_e6645051b5b4b0d4": 
                    var_eef5ad438e5fa0c2 = makeweapon("flash_grenade_mp");
                    break;
                case #"hash_3596cbf1c0965027":
                case #"hash_8677a757b3bfd260":
                case #"hash_9bf42678b7ceca81":
                case #"hash_ad541933b23baadd": 
                    var_eef5ad438e5fa0c2 = makeweapon("snapshot_grenade_mp");
                    break;
                case #"hash_1e9751b75f7cf232":
                case #"hash_9bdd4a77de2178e1":
                case #"hash_a29ecb3d754c1403":
                case #"hash_a3991996e09eb513": 
                    var_eef5ad438e5fa0c2 = makeweapon("thermite_mp");
                    break;
                case #"hash_1f2ad6f0a8a0da6b":
                case #"hash_4d0defb6d4c7dd6c":
                case #"hash_64b33ac96ed2f791":
                case #"hash_a54bf40834af0df5": 
                    var_eef5ad438e5fa0c2 = makeweapon("semtex_mp");
                    break;
                case #"hash_f8bbf06ce7865e4":
                case #"hash_75e72e81c0590e87":
                case #"hash_c3d0fe2d2f18a4fa":
                case #"hash_e1e8d438ee4215de": 
                    var_eef5ad438e5fa0c2 = makeweapon("bunkerbuster_mp");
                    break;
                case #"hash_b317f7e501b82072": 
                    if (objweapon.isalternate) {
                        var_eef5ad438e5fa0c2 = makeweapon("jup_flash_grenade_ob");
                    }
                    break;
                }
            }
        }
        switch (var_eef5ad438e5fa0c2.basename) {
        case #"hash_b833f98278746f9b": 
            var_eef5ad438e5fa0c2 = makeweapon("pop_rocket_mp");
            break;
        case #"hash_9a3452323e288ff3":
        case #"hash_c05ea160f6d9bb25": 
            var_eef5ad438e5fa0c2 = makeweapon("iw8_turret_50cal_mp");
            break;
        case #"hash_5f2ad7140f378ee1": 
            var_eef5ad438e5fa0c2 = nullweapon();
            break;
        }
    } else if (isdefined(inflictor)) {
        if (isdefined(inflictor.objweapon)) {
            var_eef5ad438e5fa0c2 = makeweapon(inflictor.objweapon.basename);
            var_ea958bd2fa62a2fa = 1;
        } else if (isdefined(inflictor.weapon_name)) {
            var_eef5ad438e5fa0c2 = makeweapon(inflictor.weapon_name);
            var_ea958bd2fa62a2fa = 1;
        }
    }
    if (var_ea958bd2fa62a2fa && !istrue(var_a2c7a399ae430eb)) {
        var_eef5ad438e5fa0c2 = mapweapon(var_eef5ad438e5fa0c2, inflictor, 1);
    }
    return var_eef5ad438e5fa0c2;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x320e
// Size: 0x7d
function attachmentsfilterforstats(attachments, weapon) {
    filtered = [];
    if (!isdefined(attachments)) {
        return filtered;
    }
    foreach (a in attachments) {
        if (attachmentlogsstats(a, weapon)) {
            filtered[filtered.size] = a;
        }
    }
    return filtered;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3294
// Size: 0x3f
function attachmentlogsstats(attachment, weapon) {
    if (attachmentiscosmetic(attachment)) {
        return false;
    }
    if (!attachmentisselectable(weapon, attachment)) {
        return false;
    }
    if (string_starts_with(attachment, "laststand_")) {
        return false;
    }
    return true;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32dc
// Size: 0x88
function weaponhasattachment(weapon, attachmentname) {
    if (!isdefined(weapon) || !isdefined(attachmentname)) {
        return false;
    }
    weaponattachments = getweaponattachments(weapon);
    if (!isdefined(weaponattachments)) {
        return false;
    }
    foreach (attachment in weaponattachments) {
        if (attachment == attachmentname) {
            return true;
        }
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336d
// Size: 0xe9
function function_8a4f25fb9d4c43c8(weapon) {
    if (!isdefined(weapon)) {
        return false;
    }
    group = getweapongroup(weapon);
    switch (group) {
    case #"hash_16cf6289ab06bd30": 
        if (weapon.basename == "iw9_sh_mviktor_mp") {
            return true;
        } else {
            return false;
        }
    case #"hash_86b11ac21f992552":
    case #"hash_9d18adab1b65a661":
    case #"hash_a1f27f97be15d620": 
        return false;
    }
    if (isdefined(weapon.basename)) {
        switch (weapon.basename) {
        case #"hash_1ee4b4461a10e3f1":
        case #"hash_36493c758ad2ab7e":
        case #"hash_5e7bf75eb9db150e":
        case #"hash_87262a67e163f7c9":
        case #"hash_a86d4075406d2de4":
        case #"hash_d2d2f2854b7d8b7d": 
            return false;
        }
    }
    return true;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345f
// Size: 0xbc
function setrecoilscale(scaler, scaleoverride) {
    if (!isdefined(scaler)) {
        scaler = 0;
    }
    if (!isdefined(self.recoilscale)) {
        self.recoilscale = scaler;
    } else {
        self.recoilscale += scaler;
    }
    if (isdefined(scaleoverride)) {
        if (isdefined(self.recoilscale) && scaleoverride < self.recoilscale) {
            scaleoverride = self.recoilscale;
        }
        scale = 100 - scaleoverride;
    } else {
        scale = 100 - self.recoilscale;
    }
    scale = int(clamp(scale, 0, 255));
    if (scale == 100) {
        self player_recoilscaleoff();
        return;
    }
    self player_recoilscaleon(scale);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3523
// Size: 0x91
function _launchgrenade(weaponname, origin, velocity, var_c301d652d9a73075, notthrown, var_997a34f6ab5cb7fc, var_48a4928bab483049) {
    grenade = self launchgrenade(weaponname, origin, velocity, var_c301d652d9a73075, var_997a34f6ab5cb7fc);
    if (!isdefined(notthrown)) {
        grenade.notthrown = 1;
    } else {
        grenade.notthrown = notthrown;
    }
    if (isdefined(var_48a4928bab483049)) {
        grenade.tickpercent = var_48a4928bab483049;
    }
    grenade setotherent(self);
    return grenade;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35bd
// Size: 0x27
function grenadethrown(grenade) {
    return !isdefined(grenade.notthrown) || !grenade.notthrown;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35ed
// Size: 0xe
function grenadeinpullback() {
    return !isnullweapon(self getheldoffhand());
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3604
// Size: 0x99
function weaponignoresblastshield(objweapon, shitloc) {
    weaponbasename = objweapon.basename;
    if (issuperweapon(weaponbasename)) {
        return 1;
    }
    if (iskillstreakweapon(weaponbasename)) {
        return 1;
    }
    switch (weaponbasename) {
    case #"hash_1ed1da8a2c218aa7":
    case #"hash_34e7a4cd11aed6bc":
    case #"hash_4cd748aa3895508a":
    case #"hash_aec9c140fca96664":
    case #"hash_d072a0adddda0068": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a5
// Size: 0xd6
function issinglehitweapon(weaponname) {
    weaponname = getweaponbasenamescript(weaponname);
    switch (weaponname) {
    case #"hash_13a265ac820ea0df":
    case #"hash_1717a0115ff7a1c4":
    case #"hash_3e782fd775b72022":
    case #"hash_51a6d4a5612754d2":
    case #"hash_5c272c0617caebf0":
    case #"hash_5cbb3a1a84d47f1d":
    case #"hash_6b9700922cc910a9":
    case #"hash_a86d4075406d2de4":
    case #"hash_a9e31b8ffd42a67b":
    case #"hash_b5e9f2d6fac1a505":
    case #"hash_c500a77b6bb7c5d0":
    case #"hash_d2d2f2854b7d8b7d":
    case #"hash_e704ecf8710c6f57":
    case #"hash_f55c20924061bd15": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3783
// Size: 0x2d
function attachmentisselectable(weaponobj, attachment) {
    rootname = getweaponrootname(weaponobj);
    return attachmentisselectablerootname(rootname, attachment);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b9
// Size: 0x7d
function attachmentisselectablerootname(var_49e6ef3edadd524e, attachment) {
    if (isdefined(level.weaponmapdata[var_49e6ef3edadd524e]) && isdefined(level.weaponmapdata[var_49e6ef3edadd524e].assetname)) {
        slot = function_6730d890f604cabe(level.weaponmapdata[var_49e6ef3edadd524e].assetname, attachment);
        if (isdefined(slot) && slot != -1) {
            return isdefined(level.weaponattachments[attachment]);
        }
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383f
// Size: 0x95
function weapongetflinchtype(weaponobj) {
    class = "none";
    var_6651def69449c4a3 = -1;
    if (isdefined(weaponobj) && !isnullweapon(weaponobj)) {
        class = weaponclass(weaponobj);
        switch (class) {
        case #"hash_719417cb1de832b6": 
            var_6651def69449c4a3 = 1;
            break;
        case #"hash_6191aaef9f922f96": 
            if (getweapongroup(weaponobj) == "weapon_dmr") {
                var_6651def69449c4a3 = 3;
            } else {
                var_6651def69449c4a3 = 4;
            }
            break;
        default: 
            var_6651def69449c4a3 = 0;
            break;
        }
    }
    return var_6651def69449c4a3;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38dd
// Size: 0x9d
function isbombsiteweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isBombSiteWeapon was passed an undefined weapon");
        return false;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_1ed1da8a2c218aa7":
    case #"hash_3ff5a88e48058543":
    case #"hash_447f8dfa61b03b5c":
    case #"hash_dd61f56b858a29f6":
    case #"hash_e6e5011c399831fc":
    case #"hash_ed9908a0ec6ad309": 
        return true;
    }
    return false;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3983
// Size: 0x2d
function iskillstreakvehicleinflictor(einflictor) {
    return isdefined(einflictor) && isdefined(einflictor.vehiclename) && isdefined(einflictor.streakinfo);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b9
// Size: 0x84
function weaponbypassspawnprotection(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - weaponBypassSpawnProtection was passed an undefined weapon");
        return 0;
    }
    bypass = 1;
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    if (iskillstreakweapon(weapon) && weaponname != "manual_turret_mp" && weaponname != "pac_sentry_turret_mp" && !isminigunweapon(weaponname)) {
        bypass = 0;
    }
    return bypass;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a46
// Size: 0x3c2
function isvehicleweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isVehicleWeapon was passed an undefined weapon");
        return 0;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_78ee9dd491b3907":
    case #"hash_79ee9dd492804fa":
    case #"hash_996455d7b14b362":
    case #"hash_12a2863ecf2eeecd":
    case #"hash_1ba6982534c8d1d6":
    case #"hash_1cb3f2dbe85b8540":
    case #"hash_20305144649233ed":
    case #"hash_221038ee7ceb69fc":
    case #"hash_254b6e155434f84d":
    case #"hash_259ae6e25d936c3e":
    case #"hash_25fc06d658620968":
    case #"hash_284c201e9a29be96":
    case #"hash_2f1a9d8e2f127205":
    case #"hash_31aebb2fa566704a":
    case #"hash_3226ebed78234b14":
    case #"hash_33aef56fb95396fd":
    case #"hash_359ac460bda5f9b8":
    case #"hash_3eff7af9e42baade":
    case #"hash_3f2944fd91792508":
    case #"hash_471c36daeb2a655a":
    case #"hash_4e213f6d3f76b400":
    case #"hash_4fd5d83c1a7f06a7":
    case #"hash_51f4f5345b01f136":
    case #"hash_5c9a53dd34badd94":
    case #"hash_62a9688b69906271":
    case #"hash_6ac8f418ee829465":
    case #"hash_708fb6e22f87a3a4":
    case #"hash_73b4956c8f4b5217":
    case #"hash_806bdb595fd497d7":
    case #"hash_82a5b9368f3f35ae":
    case #"hash_85af56f5faab2a04":
    case #"hash_892911bfe6164871":
    case #"hash_8d7aa4b158a0e9a9":
    case #"hash_9386cafe3d8d6d59":
    case #"hash_9a70af630b5b1849":
    case #"hash_a0bfc30978e56904":
    case #"hash_a622e958420b92a0":
    case #"hash_a9e5050965551dca":
    case #"hash_acaf314732f4c8e4":
    case #"hash_aef479d2af969a2d":
    case #"hash_af540b603005b109":
    case #"hash_af7c176030248498":
    case #"hash_b1091bccb52690e0":
    case #"hash_b1d4d0d68c2b0c0f":
    case #"hash_b4fb660fd7773831":
    case #"hash_bac656916e53b91c":
    case #"hash_badacfdae124cc01":
    case #"hash_bb463b7f255eafce":
    case #"hash_be853f8547df0df3":
    case #"hash_c5b0e60bae8c9b0f":
    case #"hash_cd6b1f03c24c25ff":
    case #"hash_cf8515f17748a7d2":
    case #"hash_d1ffad9819388638":
    case #"hash_d30fa952a74e1642":
    case #"hash_d4532f8e0fa86548":
    case #"hash_d6d8360ddf1f4d6b":
    case #"hash_d7f368cf53337cfd":
    case #"hash_e1e4906cafc3af9d":
    case #"hash_e7af9caef1aa7899":
    case #"hash_e9ee40174ddfa406":
    case #"hash_ec580a77ee20c7bd":
    case #"hash_edf51f8e5118b630":
    case #"hash_ee243b8e513db31d":
    case #"hash_f003a3dc14dbdf3f":
    case #"hash_f1450013ec0ad0d5":
    case #"hash_f5f81c45da642380":
    case #"hash_f816d2efb1dcbed0":
    case #"hash_fbca161190fca27d":
    case #"hash_fc4c0a8ee31549bb":
    case #"hash_fd76dc693da26245":
    case #"hash_fd79e0693da4a728":
    case #"hash_fd9c279f85990dad": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e10
// Size: 0x86
function function_858ed945747dfb28(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isHelicopterWeapon was passed an undefined weapon");
        return 0;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_1cb3f2dbe85b8540":
    case #"hash_33aef56fb95396fd":
    case #"hash_fc4c0a8ee31549bb": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e9e
// Size: 0x72
function isgesture(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isGesture was passed an undefined weapon");
        return 0;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    if (issubstr(weaponname, "ges_plyr")) {
        return 1;
    }
    if (issubstr(weaponname, "devilhorns_mp")) {
        return 1;
    }
    return 0;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f18
// Size: 0x35
function getweaponfullname(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - getWeaponFullName was passed an undefined weapon");
        return 0;
    }
    if (isstring(weapon)) {
        return weapon;
    }
    return getcompleteweaponname(weapon);
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f55
// Size: 0x337
function playdeatomizefx(soundoverride, offset) {
    loc[0][0]["org"] = self gettagorigin("j_spineupper");
    loc[0][0]["angles"] = self gettagangles("j_spineupper");
    loc[0][1]["org"] = self gettagorigin("j_spinelower");
    loc[0][1]["angles"] = self gettagangles("j_spinelower");
    loc[0][2]["org"] = self gettagorigin("j_head");
    loc[0][2]["angles"] = self gettagangles("j_head");
    loc[1][0]["org"] = self gettagorigin("j_knee_ri");
    loc[1][0]["angles"] = self gettagangles("j_knee_ri");
    loc[1][1]["org"] = self gettagorigin("j_knee_le");
    loc[1][1]["angles"] = self gettagangles("j_knee_le");
    loc[1][2]["org"] = self gettagorigin("j_elbow_ri");
    loc[1][2]["angles"] = self gettagangles("j_elbow_ri");
    loc[1][3]["org"] = self gettagorigin("j_elbow_le");
    loc[1][3]["angles"] = self gettagangles("j_elbow_le");
    loc[2][0]["org"] = self gettagorigin("j_ankle_le");
    loc[2][0]["angles"] = self gettagangles("j_ankle_le");
    loc[2][1]["org"] = self gettagorigin("j_ankle_ri");
    loc[2][1]["angles"] = self gettagangles("j_ankle_ri");
    loc[2][2]["org"] = self gettagorigin("j_wrist_le");
    loc[2][2]["angles"] = self gettagangles("j_wrist_le");
    loc[2][3]["org"] = self gettagorigin("j_wrist_ri");
    loc[2][3]["angles"] = self gettagangles("j_wrist_ri");
    soundtoplay = "bullet_atomizer_impact_npc";
    fxoffset = (0, 0, 0);
    if (isdefined(offset)) {
        fxoffset = offset;
    }
    if (isdefined(soundoverride)) {
        soundtoplay = soundoverride;
    }
    self playsound(soundtoplay);
    foreach (entry in loc) {
        foreach (spot in entry) {
            playfx(level._effect["atomize_body"], spot["org"] + fxoffset, anglestoforward(spot["angles"]));
        }
        wait 0.01;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4294
// Size: 0xc7
function isprimaryweapon(objweapon) {
    if (isnullweapon(objweapon)) {
        assertmsg("Weapon.gsc - isPrimaryWeapon was passed an undefined objWeapon");
        return 0;
    }
    if (objweapon.inventorytype != "primary" && objweapon.inventorytype != "altmode") {
        return 0;
    }
    switch (objweapon.classname) {
    case #"hash_690c0d6a821b42e":
    case #"hash_6191aaef9f922f96":
    case #"hash_61e969dacaaf9881":
    case #"hash_719417cb1de832b6":
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_900cb96c552c5e8e":
    case #"hash_fa24dff6bd60a12d": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4363
// Size: 0x6d
function ismeleeoverrideweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isMeleeOverrideWeapon was passed an undefined weapon");
        return false;
    }
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = weapon;
    }
    return weaponname == "iw9_knifestab_mp" || weaponname == "iw9_knifestab_mp" || weaponname == "iw8_throwingknife_fire_melee_mp" || weaponname == "iw8_throwingknife_electric_melee_mp";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d9
// Size: 0x4a
function ismeleeonly(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isMeleeOnly was passed an undefined weapon");
        return 0;
    }
    if (isstring(weapon)) {
        assertmsg("<isMeleeOnly> requires an objweapon, <" + weapon + "> is a string");
    }
    return weapon.ismelee;
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442c
// Size: 0x3e
function isfistsonly(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isFistsOnly was passed an undefined weapon");
        return false;
    }
    return getweaponrootname(weapon) == "iw9_me_fists" || getweaponrootname(weapon) == "iw9_me_superfists";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4473
// Size: 0x46
function isballweapon(objweapon) {
    if (!isdefined(objweapon)) {
        assertmsg("Weapon.gsc - isBallWeapon was passed an undefined objWeapon");
        return false;
    }
    return objweapon.basename == "iw9_cyberemp_mp" || objweapon.basename == "iw7_tdefball_mp";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44c2
// Size: 0x2d
function isaxeweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isAxeWeapon was passed an undefined weapon name");
        return false;
    }
    return getweaponrootname(weapon) == "iw7_axe";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f8
// Size: 0x3e
function isakimbomeleeweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isAkimboMeleeWeapon was passed an undefined weapon name");
        return false;
    }
    return getweaponrootname(weapon) == "iw8_me_akimboblunt" || getweaponrootname(weapon) == "iw8_me_akimboblades";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x453f
// Size: 0x79
function isthrowingknife(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isThrowingKnife was passed an undefined weapon name");
        return false;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return issubstr(weapname, "throwingknife") || issubstr(weapname, "shuriken");
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c1
// Size: 0x6a
function function_160a992c78bdf589(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isThrowingStar was passed an undefined weapon name");
        return 0;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return 0;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return 0;
        }
        weapname = weapon;
    }
    return issubstr(weapname, "throwstar");
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4634
// Size: 0x79
function issnowball(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isSnowball was passed an undefined weapon name");
        return false;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return issubstr(weapname, "snowball") || issubstr(weapname, "pball");
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46b6
// Size: 0x6a
function function_6acbd7091f4b88ea(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isSnowballGolden was passed an undefined weapon name");
        return 0;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return 0;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return 0;
        }
        weapname = weapon;
    }
    return issubstr(weapname, "pball");
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4729
// Size: 0x6a
function function_ef71b0d20683d9aa(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isGoldenGun was passed an undefined weapon name");
        return 0;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return 0;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return 0;
        }
        weapname = weapon;
    }
    return issubstr(weapname, "goldengun");
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x479c
// Size: 0x73
function isspecialmeleeweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isSpecialMeleeWeapon was passed an undefined weapon name");
        return false;
    }
    if (ismeleeoverrideweapon(weapon)) {
        return true;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return weapname == "iw9_me_fists_mp_ls";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4818
// Size: 0x92
function isgunlessweapon(weapon) {
    if (!isdefined(weapon)) {
        assertmsg("Weapon.gsc - isGunlessWeapon was passed an undefined weapon name");
        return false;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return weapname == "iw8_gunless" || weapname == "iw8_gunless_infil" || weapname == "iw8_gunless_last_stand_enter" || weapname == "iw9_gunless" || weapname == "iw9_gunless_mp";
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b3
// Size: 0xb5
function infiniteammothread(waittime, weapons, refreshweaponlist) {
    self endon("death_or_disconnect");
    self endon("stop_infinite_ammo_thread");
    if (!isdefined(waittime)) {
        waittime = level.framedurationseconds;
    }
    while (true) {
        if (!isdefined(weapons) || istrue(refreshweaponlist)) {
            weapons = self.equippedweapons;
        }
        foreach (weapon in weapons) {
            self givemaxammo(weapon);
            self setweaponammoclip(weapon, weaponclipsize(weapon));
        }
        wait waittime;
    }
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4970
// Size: 0xa
function stopinfiniteammothread() {
    self notify("stop_infinite_ammo_thread");
}

// Namespace weapon / scripts\mp\utility\weapon
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4982
// Size: 0x7b
function function_72ce982d9fc26f1c(weapon) {
    if (isdefined(weapon.attachments)) {
        foreach (attachment in weapon.attachments) {
            if (issubstr(attachment, "backup_pistol")) {
                return true;
            }
        }
    }
    return false;
}

