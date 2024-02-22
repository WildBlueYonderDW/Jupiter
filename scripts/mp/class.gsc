// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_2669878cf5a1b6bc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\riotshield.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\accessories.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\archetypes\archcommon.gsc;
#using scripts\mp\perks\weaponpassives.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using script_15eddb0fac236a22;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\bots\bots_loadout.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\validation.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\archetypes\archassault.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\equipment\nvg.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_5e2dcb7fb9811781;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\loot.gsc;
#using scripts\mp\passives.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\equipment\flash_grenade.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using script_6d68cfdf0836123c;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\outline.gsc;

#namespace class;

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2068
// Size: 0x3f8
function init() {
    level.classmap["gamemode"] = 0;
    level.classmap["callback"] = 0;
    level.classmap["juggernaut"] = 0;
    if (istrue(level.var_7ebad80a50484a39)) {
        level.classmap["superpower"] = 0;
    }
    for (i = 0; i <= 2; i++) {
        level.classmap["class" + i] = 0;
    }
    for (i = 1; i <= 12; i++) {
        level.classmap["custom" + i] = i - 1;
    }
    for (i = 1; i <= 6; i++) {
        level.classmap["axis_recipe" + i] = i - 1;
        level.classmap["allies_recipe" + i] = i - 1;
    }
    for (i = 1; i <= 11; i++) {
        level.classmap["default" + i] = i - 1;
    }
    level.defaultclass = "CLASS_ASSAULT";
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0) && (namespace_36f464722d326bbe::isbrstylegametype() || level.gametype == "brtdm" || level.gametype == "brtdm_mgl")) {
        level.classtablename = "classtable:classtable_br_default_mgl";
    } else if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz") {
        level.classtablename = "classtable:classtable_dmz_default";
    } else if (getdvarint(@"hash_72fe29aa713ea21e", 0) != 0) {
        var_2e37e0f4abe00fd7 = getdvarint(@"hash_72fe29aa713ea21e", 0);
        switch (var_2e37e0f4abe00fd7) {
        case 1:
            level.classtablename = "classtable:classtable_snipers_only";
            if (function_3cb5da19764baa3() == "JUP") {
                level.classtablename = level.classtablename + "_jup";
            }
            break;
        default:
            level.classtablename = "classtable:classtable";
            break;
        }
        setomnvar("ui_classtable_override", var_2e37e0f4abe00fd7);
    } else if (getdvarint(@"hash_1e31d1da0a5b6558", 0)) {
        level.classtablename = "classtable:classtable_weapon_test";
    } else if (getdvarint(@"hash_48b4d51ad390da4f", 0)) {
        level.classtablename = "classtable:classtable_gwplus";
    } else if (isanymlgmatch()) {
        level.classtablename = "classtable:classtable_cdl";
    } else if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.classtable)) {
        level.classtablename = "classtable:" + level.var_62f6f7640e4431e3.classtable;
    } else if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.classtable)) {
        level.classtablename = "classtable:" + level.var_1a2b600a06ec21f4.classtable;
    } else if (getdvarint(@"hash_9fdeab749d8f74a1", 0)) {
        level.classtablename = "classtable:" + level.var_1a2b600a06ec21f4.var_6452bbdfe7671a5d;
    }
    /#
        assertex(isdefined(level.classtablename), "Define a Class Table in the gamemodebundle asset for this mode");
    #/
    var_b231ad92292e3018 = getdvar(@"hash_a746a84a9d4c8ee6", "");
    if (var_b231ad92292e3018 != "") {
        level.var_b231ad92292e3018 = strtok(var_b231ad92292e3018, ",");
    }
    if (isusingmatchrulesdata()) {
        level.var_dd07587af7d0ec5e = getmatchrulesdata("commonOption", "backupPistol");
        level.var_6ff4dcd4533c4a93 = getmatchrulesdata("commonOption", "backupPistolReload");
    }
    level thread onplayerconnecting();
    level thread onplayerspawned();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2467
// Size: 0x5e
function function_e83615f8a92e4378(rootname, attachments, camo, reticle, variantid, var_f3464d71f01f614e, cosmeticattachment, stickers, var_11a1fa68aeb971c0) {
    return buildweapon(rootname, attachments, camo, reticle, variantid, var_f3464d71f01f614e, cosmeticattachment, stickers, var_11a1fa68aeb971c0);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24cd
// Size: 0x22
function getclasschoice(response) {
    /#
        assert(isdefined(level.classmap[response]));
    #/
    return response;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f7
// Size: 0x39
function getweaponchoice(response) {
    tokens = strtok(response, ",");
    if (tokens.size > 1) {
        return int(tokens[1]);
    } else {
        return 0;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2537
// Size: 0x39
function cac_getweapon(classindex, weaponindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "weapon");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2578
// Size: 0x6d
function cac_getweaponattachment(classindex, weaponindex, attachmentindex) {
    var_10dc579c373a93dd = self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "attachment");
    weapon = cac_getweapon(classindex, weaponindex);
    return namespace_e0ee43ef2dddadaa::function_6e7bc1b23afa0ea8(weapon, var_10dc579c373a93dd);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ed
// Size: 0x47
function cac_getweaponattachmentid(classindex, weaponindex, attachmentindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "variantID");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263c
// Size: 0xca
function function_a4065e820eb1f919(classindex, weaponindex, attachmentindex) {
    var_803ecabb6f57b183 = self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "customTune", 0);
    var_803ecbbb6f57b3b6 = self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "customTune", 1);
    var_bf247e07a72958e = self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "hasBPTune");
    return function_a5d1432d54033ea9(var_803ecabb6f57b183, var_803ecbbb6f57b3b6, var_bf247e07a72958e);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270e
// Size: 0x8d
function function_a5d1432d54033ea9(var_803ecabb6f57b183, var_803ecbbb6f57b3b6, var_bf247e07a72958e) {
    if (var_bf247e07a72958e == 1 && var_803ecabb6f57b183 == 0 && var_803ecbbb6f57b3b6 == 0) {
        var_a3ddb63bdd450f67 = "clr";
        var_62365e59d2d3fabc = "clr";
    } else {
        var_a3ddb63bdd450f67 = function_f76ff66a6601d9c9(var_803ecabb6f57b183);
        var_62365e59d2d3fabc = function_f76ff66a6601d9c9(var_803ecbbb6f57b3b6);
    }
    if (!isdefined(var_a3ddb63bdd450f67) || !isdefined(var_62365e59d2d3fabc)) {
        return undefined;
    } else {
        var_803e8cbb6f572929 = [0:var_a3ddb63bdd450f67, 1:var_62365e59d2d3fabc];
        return var_803e8cbb6f572929;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a2
// Size: 0x39
function cac_getweaponlootitemid(classindex, weaponindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "lootItemID");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e3
// Size: 0x39
function cac_getweaponvariantid(classindex, weaponindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "variantID");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2824
// Size: 0x39
function cac_getweaponcamo(classindex, weaponindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "camo");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2865
// Size: 0x39
function cac_getweaponreticle(classindex, weaponindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "reticle");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a6
// Size: 0x1ae
function cac_getkillstreak(index, class) {
    var_6c131a37b5df1aac = self getplayerdata(level.loadoutdata, "squadMembers", "killstreakSetups", index, "killstreak");
    var_8dfcebbe026021fc = getdvarint(@"hash_c71c23fbd639d5d3", 0);
    if (var_8dfcebbe026021fc && namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        switch (index) {
        case 0:
            var_6c131a37b5df1aac = "uav";
            break;
        case 1:
            var_6c131a37b5df1aac = "toma_strike";
            break;
        case 2:
            var_6c131a37b5df1aac = "directional_uav";
            break;
        default:
            break;
        }
    }
    if (isdefined(level.var_c26d962ddc188b43) && level.gametype == "conf_v") {
        switch (index) {
        case 0:
            var_6c131a37b5df1aac = "none";
            break;
        case 1:
            var_6c131a37b5df1aac = "electric_discharge";
            break;
        case 2:
            var_6c131a37b5df1aac = "laser_charge";
            break;
        case 3:
            var_6c131a37b5df1aac = "none";
            break;
        default:
            break;
        }
        return var_6c131a37b5df1aac;
    }
    if (isdefined(level.var_b231ad92292e3018) && (getdvarint(@"hash_a464cb031c16ee87", 0) > 0 || getdvarint(@"hash_8b17e0ec412187d3", 0) > 0)) {
        var_a7f68d4ad3aaa3a3 = level.var_b231ad92292e3018[index];
        if (!isdefined(var_a7f68d4ad3aaa3a3)) {
            var_a7f68d4ad3aaa3a3 = "";
        }
        return var_a7f68d4ad3aaa3a3;
    }
    return var_6c131a37b5df1aac;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5c
// Size: 0x96
function function_3d362af202938e22(index, class) {
    var_8dfcebbe026021fc = getdvarint(@"hash_c71c23fbd639d5d3", 0);
    if (var_8dfcebbe026021fc && namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        return 0;
    }
    if (isdefined(level.var_b231ad92292e3018) && (getdvarint(@"hash_a464cb031c16ee87", 0) > 0 || getdvarint(@"hash_8b17e0ec412187d3", 0) > 0)) {
        return 0;
    }
    return self getplayerdata(level.loadoutdata, "squadMembers", "killstreakSetups", index, "blueprintIndex");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2afa
// Size: 0x29
function cac_getcharacterarchetype() {
    if (isdefined(self.changedarchetypeinfo)) {
        return self.changedarchetypeinfo.archetype;
    }
    return "archetype_assault";
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b2b
// Size: 0x31
function cac_getequipmentprimary(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 0, "equipment");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b64
// Size: 0x31
function function_9c883cb23c614891(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 0, "variantID");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9d
// Size: 0x31
function cac_getextraequipmentprimary(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 0, "extraCharge");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd6
// Size: 0x31
function cac_getflcextraequipmentprimary(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 0, "flcExtraEquipment");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c0f
// Size: 0x32
function cac_getequipmentsecondary(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 1, "equipment");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c49
// Size: 0x32
function function_d9e6d0a8cbe6b48d(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 1, "variantID");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c83
// Size: 0x32
function cac_getextraequipmentsecondary(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 1, "extraCharge");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cbd
// Size: 0x32
function cac_getflcextraequipmentsecondary(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", 1, "flcExtraEquipment");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf7
// Size: 0x7a
function cac_getfieldupgrade(classindex, var_a780f473a6275df4) {
    var_cafe84b3bb165c25 = getdvarint(@"hash_6f667009cb37e9a0", 0);
    if (var_cafe84b3bb165c25 && namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        return "super_ammo_drop";
    }
    if (istrue(level.var_4b56eabbc77bfd21)) {
        return "none";
    }
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "fieldUpgradeSetups", var_a780f473a6275df4, "fieldUpgrade");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d79
// Size: 0x72
function function_a2a7f87d758bbfb8(classindex, var_a780f473a6275df4) {
    var_cafe84b3bb165c25 = getdvarint(@"hash_6f667009cb37e9a0", 0);
    if (var_cafe84b3bb165c25 && namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        return 0;
    }
    if (istrue(level.var_4b56eabbc77bfd21)) {
        return 0;
    }
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "fieldUpgradeSetups", var_a780f473a6275df4, "blueprintIndex");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2df3
// Size: 0x34
function function_db6f12d0d1006658(classindex, var_a780f473a6275df4) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "fieldUpgradeUses", var_a780f473a6275df4);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2f
// Size: 0x8e
function cac_getgesture() {
    var_da50f25e979bab7d = "none";
    if (isdefined(self.changedarchetypeinfo)) {
        var_6d1a148efa806994 = level.archetypeids[self.changedarchetypeinfo.archetype];
        var_da50f25e979bab7d = self getplayerdata(level.loadoutsgroup, "squadMembers", "archetypePreferences", var_6d1a148efa806994, "gesture");
    } else {
        var_da50f25e979bab7d = self getplayerdata(level.loadoutsgroup, "squadMembers", "gesture");
    }
    return namespace_46e9069d8502773a::getgesturedata(var_da50f25e979bab7d);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec5
// Size: 0x2e
function cac_getaccessoryweapon() {
    var_160f3cb2bb4232d3 = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorWatch");
    return namespace_93104865b3b8748::getaccessoryweaponbyindex(var_160f3cb2bb4232d3);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efb
// Size: 0x2e
function cac_getaccessorydata() {
    var_160f3cb2bb4232d3 = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorWatch");
    return namespace_93104865b3b8748::getaccessorydatabyindex(var_160f3cb2bb4232d3);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f31
// Size: 0x2e
function cac_getaccessorylogic() {
    var_160f3cb2bb4232d3 = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorWatch");
    return namespace_93104865b3b8748::getaccessorylogicbyindex(var_160f3cb2bb4232d3);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f67
// Size: 0x34
function cac_getloadoutperk(classindex, perkindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "loadoutPerks", perkindex);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa3
// Size: 0x11a
function function_12b59a6e11ff097f(var_604f6052c4c383f5) {
    var_c71ab9f1f2fb1217 = function_3bb637a8e8d0a7c8();
    var_131c7a07fd534436 = 6;
    if (isdefined(var_c71ab9f1f2fb1217)) {
        if (getdvarint(@"hash_b8e2aa1e6fa68b8d", 0)) {
            var_131c7a07fd534436 = var_c71ab9f1f2fb1217.var_1dace216d1a32d14.size;
        } else {
            var_131c7a07fd534436 = var_c71ab9f1f2fb1217.var_c683714070dd7eb8;
        }
    }
    if (var_604f6052c4c383f5 < var_131c7a07fd534436) {
        return function_5d63ef3292dd14b9(var_c71ab9f1f2fb1217.var_1dace216d1a32d14[var_604f6052c4c383f5].package);
    } else {
        var_604f6052c4c383f5 = var_604f6052c4c383f5 - var_131c7a07fd534436;
    }
    var_23cc182d2553796a = [];
    var_23cc182d2553796a[0] = self getplayerdata(level.loadoutsgroup, "customPerkPackage", var_604f6052c4c383f5, "perks", 0);
    var_23cc182d2553796a[1] = self getplayerdata(level.loadoutsgroup, "customPerkPackage", var_604f6052c4c383f5, "perks", 1);
    var_23cc182d2553796a[2] = self getplayerdata(level.loadoutsgroup, "customPerkPackage", var_604f6052c4c383f5, "perks", 2);
    var_23cc182d2553796a[3] = self getplayerdata(level.loadoutsgroup, "customPerkPackage", var_604f6052c4c383f5, "perks", 3);
    return var_23cc182d2553796a;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c5
// Size: 0x1e
function function_7e02bbbe3ca7ac36(perksarray) {
    return !isdefined(perksarray[0]) || perksarray[0] == "specialty_null";
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30eb
// Size: 0x45
function function_ab0d3a90ebca6e74(perksarray, package) {
    if (perksarray.size != package.size) {
        return 0;
    }
    for (i = 0; i < perksarray.size; i++) {
        if (package[i] != perksarray[i]) {
            return 0;
        }
    }
    return 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3138
// Size: 0x95
function function_ed0c3acfdac0baed(perksarray) {
    if (function_7e02bbbe3ca7ac36(perksarray)) {
        return -1;
    }
    var_c71ab9f1f2fb1217 = function_3bb637a8e8d0a7c8();
    if (isdefined(var_c71ab9f1f2fb1217)) {
        var_131c7a07fd534436 = var_c71ab9f1f2fb1217.var_1dace216d1a32d14.size;
        for (i = 0; i < var_131c7a07fd534436; i++) {
            package = function_5d63ef3292dd14b9(var_c71ab9f1f2fb1217.var_1dace216d1a32d14[i].package);
            if (function_ab0d3a90ebca6e74(perksarray, package)) {
                return i;
            }
        }
    }
    return -2;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d5
// Size: 0x2b
function function_3c33d2d97119a585(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equippedPerkPackageIndex");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3208
// Size: 0x34
function cac_getloadoutextraperk(classindex, perkindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "extraPerks", perkindex);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3244
// Size: 0x34
function function_e329ffc7ff0dcf96(classindex, perkindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "flcPerks", perkindex);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3280
// Size: 0x3d
function cac_getloadoutarchetypeperk() {
    if (isdefined(self.changedarchetypeinfo)) {
        return self.changedarchetypeinfo.trait;
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "archetypePerk");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c5
// Size: 0xde
function function_3bb637a8e8d0a7c8() {
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        bundlename = "perkpackagelist_mgl";
    } else {
        bundlename = "perkpackagelist_iw9";
    }
    if (istrue(level.var_ec2fb549b15ad827)) {
        bundlename = "ranked_perkpackagelist_iw9";
    } else if (namespace_36f464722d326bbe::isbrstylegametype()) {
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            bundlename = "br_perkpackagelist_mgl";
        } else {
            bundlename = "perkpackagelist_wz";
        }
    }
    var_4442a79a262baec5 = getscriptbundle("perkpackagelist:" + bundlename);
    var_4442a79a262baec5.var_c683714070dd7eb8 = var_4442a79a262baec5.var_1dace216d1a32d14.size;
    for (i = var_4442a79a262baec5.var_1dace216d1a32d14.size - 1; i >= 0; i--) {
        if (!isdefined(var_4442a79a262baec5.var_1dace216d1a32d14[i].package)) {
            var_4442a79a262baec5.var_1dace216d1a32d14[i] = undefined;
        }
    }
    return var_4442a79a262baec5;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ab
// Size: 0x2b
function cac_getusingspecialist(classindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "usingSpecialist");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33de
// Size: 0x39
function cac_getweaponcosmeticattachment(classindex, weaponindex) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "cosmeticAttachment");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341f
// Size: 0x42
function cac_getweaponsticker(classindex, weaponindex, var_36d2abbdcbcb186c) {
    return self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "sticker", var_36d2abbdcbcb186c);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3469
// Size: 0x39
function recipe_getkillstreak(classteam, classindex, streakindex) {
    return getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "kilstreakSetups", streakindex, "killstreak");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34aa
// Size: 0x20
function function_de324c78ecdc7acd(player) {
    return player getplayerdata(level.var_5d69837cf4db0407, "enableDefaultDMZLoadouts");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d2
// Size: 0x2a
function function_cfa0343e808b7421(player, enabled) {
    player setplayerdata(level.var_5d69837cf4db0407, "enableDefaultDMZLoadouts", enabled);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3503
// Size: 0xab
function function_acad491093697c6c(tablename) {
    if (!isdefined(level.var_f64740277f13e29b) || level.var_f64740277f13e29b.id != tablename) {
        level.var_f64740277f13e29b = spawnstruct();
        level.var_f64740277f13e29b.id = tablename;
        level.var_f64740277f13e29b.classes = [];
        level.var_f64740277f13e29b.classtable = getscriptbundle(tablename);
        /#
            assert(isdefined(level.var_f64740277f13e29b.classtable));
        #/
    }
    return level.var_f64740277f13e29b;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b6
// Size: 0x95
function function_c7a0b640c398497(tablename, classindex) {
    var_f64740277f13e29b = function_acad491093697c6c(tablename);
    if (!isdefined(var_f64740277f13e29b.classes[classindex])) {
        var_5ff608a2cf5c041b = var_f64740277f13e29b.classtable.var_8d5460be7db831c3[classindex];
        /#
            assert(isdefined(var_5ff608a2cf5c041b));
        #/
        var_f64740277f13e29b.classes[classindex] = getscriptbundle("classtableentry:" + var_5ff608a2cf5c041b.entry);
    }
    return var_f64740277f13e29b.classes[classindex];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3653
// Size: 0x34
function function_df2933f96d726d71(tablename) {
    var_f64740277f13e29b = function_acad491093697c6c(tablename);
    return var_f64740277f13e29b.classtable.var_8d5460be7db831c3.size;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368f
// Size: 0x2f
function table_getaddblueprintattachments(tablename, classindex, weaponindex) {
    return table_getweapon(tablename, classindex, weaponindex).var_8886d83d8d183347;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c6
// Size: 0x73
function function_aacbcd2576b3af83(tablename, classindex, weaponindex) {
    weaponinfo = function_c7a0b640c398497(tablename, classindex);
    switch (weaponindex) {
    case 0:
        return weaponinfo.primaryweapon;
    case 1:
        return weaponinfo.secondaryweapon;
        break;
    }
    return weaponinfo.tertiaryweapon;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3741
// Size: 0x2f
function table_getweapon(tablename, classindex, weaponindex) {
    return function_aacbcd2576b3af83(tablename, classindex, weaponindex).weapon;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3778
// Size: 0x2ee
function table_getweaponattachment(tablename, classindex, weaponindex, attachmentindex) {
    tempname = "none";
    classstruct = function_c7a0b640c398497(tablename, classindex);
    if (!isdefined(classstruct.primaryweapon.attachments)) {
        classstruct.primaryweapon.attachments = [0:classstruct.primaryweapon.attachment1, 1:classstruct.primaryweapon.attachment2, 2:classstruct.primaryweapon.attachment3, 3:classstruct.primaryweapon.attachment4, 4:classstruct.primaryweapon.attachment5, 5:classstruct.primaryweapon.attachment6];
    }
    if (!isdefined(classstruct.secondaryweapon.attachments)) {
        classstruct.secondaryweapon.attachments = [0:classstruct.secondaryweapon.attachment1, 1:classstruct.secondaryweapon.attachment2, 2:classstruct.secondaryweapon.attachment3, 3:classstruct.secondaryweapon.attachment4, 4:classstruct.secondaryweapon.attachment5];
    }
    if (istrue(level.var_9e090a159cb48220)) {
        if (!isdefined(classstruct.tertiaryweapon.attachments)) {
            classstruct.tertiaryweapon.attachments = [0:classstruct.tertiaryweapon.attachment1, 1:classstruct.tertiaryweapon.attachment2, 2:classstruct.tertiaryweapon.attachment3, 3:classstruct.tertiaryweapon.attachment4, 4:classstruct.tertiaryweapon.attachment5];
        }
    }
    if (weaponindex == 0) {
        tempname = classstruct.primaryweapon.attachments[attachmentindex];
    } else if (weaponindex == 1) {
        tempname = classstruct.secondaryweapon.attachments[attachmentindex];
    } else {
        tempname = classstruct.tertiaryweapon.attachments[attachmentindex];
    }
    if (!isdefined(tempname) || tempname == "") {
        return "none";
    } else {
        return tempname;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6d
// Size: 0x2f
function table_getweaponcamo(tablename, classindex, weaponindex) {
    return function_aacbcd2576b3af83(tablename, classindex, weaponindex).camo;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa4
// Size: 0x2f
function table_getweaponreticle(tablename, classindex, weaponindex) {
    return function_aacbcd2576b3af83(tablename, classindex, weaponindex).reticle;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3adb
// Size: 0x4a
function table_getweaponvariantid(tablename, classindex, weaponindex, rootweapon) {
    var_1092bc40c58c1c9a = function_aacbcd2576b3af83(tablename, classindex, weaponindex).variantid;
    return table_parseweaponvariantidvalue(rootweapon, var_1092bc40c58c1c9a);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b2d
// Size: 0x3c0
function table_parseweaponvariantidvalue(rootweapon, value) {
    if (rootweapon == "none") {
        return 0;
    }
    if (!isdefined(level.blockedvariantidsmap)) {
        level.blockedvariantidsmap = [];
        level.blockedvariantidsmap["iw8_ar_tango21"] = [0:1];
        level.blockedvariantidsmap["iw8_ar_mike4"] = [0:5];
        level.blockedvariantidsmap["iw8_ar_kilo433"] = [0:3];
        level.blockedvariantidsmap["iw8_ar_scharlie"] = [0:3];
        level.blockedvariantidsmap["iw8_sm_uzulu"] = [0:4];
        level.blockedvariantidsmap["iw8_sh_romeo870"] = [0:5];
        level.blockedvariantidsmap["iw8_sh_dpapa12"] = [0:3];
        level.blockedvariantidsmap["iw8_lm_mgolf34"] = [0:4];
        level.blockedvariantidsmap["iw8_sn_kilo98"] = [0:16];
        level.blockedvariantidsmap["iw8_sn_alpha50"] = [0:2];
        level.blockedvariantidsmap["iw8_sn_hdromeo"] = [0:4];
        level.blockedvariantidsmap["iw8_pi_golf21"] = [0:3];
        level.blockedvariantidsmap["iw8_pi_cpapa"] = [0:15];
        var_a6f6c01484bd5665 = getdvar(@"hash_4caa11caeebf587b", "");
        if (var_a6f6c01484bd5665 != "") {
            var_9c58c4f8acc9cf26 = strtok(var_a6f6c01484bd5665, ",");
            foreach (var_9da910194dabeabe in var_9c58c4f8acc9cf26) {
                var_cbf22c9edb76e72d = strtok(var_9da910194dabeabe, "|");
                if (var_cbf22c9edb76e72d.size == 2) {
                    var_34b5cb87e576c08a = var_cbf22c9edb76e72d[0];
                    var_d37ab34e1f353f3d = int(var_cbf22c9edb76e72d[1]);
                    if (!isdefined(level.blockedvariantidsmap[var_34b5cb87e576c08a])) {
                        level.blockedvariantidsmap[var_34b5cb87e576c08a] = [];
                    }
                    level.blockedvariantidsmap[var_34b5cb87e576c08a][level.blockedvariantidsmap[var_34b5cb87e576c08a].size] = var_d37ab34e1f353f3d;
                }
            }
        }
    }
    var_60ee6a5bae11a91b = undefined;
    if (isdefined(level.blockedvariantidsmap[rootweapon])) {
        var_60ee6a5bae11a91b = level.blockedvariantidsmap[rootweapon];
    }
    variantid = 0;
    var_b3a4d54288759d77 = getdvarint(@"hash_c895ae760d4177d4", 0);
    if (var_b3a4d54288759d77 == 1) {
        variantid = getweaponrandomvariantid(rootweapon, var_60ee6a5bae11a91b);
    } else {
        var_2891e3df80a13684 = strtok(value, " ");
        var_c0aa7602b6bbc954 = [];
        foreach (sid in var_2891e3df80a13684) {
            var_fe5e8103f5fac595 = int(sid);
            if (!isdefined(var_60ee6a5bae11a91b) || !array_contains(var_60ee6a5bae11a91b, var_fe5e8103f5fac595)) {
                var_c0aa7602b6bbc954[var_c0aa7602b6bbc954.size] = var_fe5e8103f5fac595;
            }
        }
        if (var_c0aa7602b6bbc954.size != 0) {
            variantid = var_c0aa7602b6bbc954[randomint(var_c0aa7602b6bbc954.size)];
        }
    }
    if (variantid == -1) {
        variantid = getweaponrandomvariantid(rootweapon, var_60ee6a5bae11a91b);
    }
    var_3f57e7eddc8a4779 = weaponisvalid(rootweapon, variantid);
    /#
        assertex(var_3f57e7eddc8a4779, "getWeaponVariantFromTableValue() found invalid weapon: " + rootweapon + "|" + variantid);
    #/
    if (!var_3f57e7eddc8a4779) {
        variantid = 0;
    }
    return variantid;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef5
// Size: 0xb0
function table_getperk(tablename, classindex, perkindex) {
    /#
        assert(perkindex <= 3);
    #/
    classstruct = function_c7a0b640c398497(tablename, classindex);
    if (!isdefined(classstruct.perksarray)) {
        classstruct.perksarray = [0:classstruct.perks.perk1, 1:classstruct.perks.perk2, 2:classstruct.perks.perk3];
    }
    return classstruct.perksarray[perkindex];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fad
// Size: 0x3f
function function_f9c715f78b428034(tablename, classindex) {
    var_5ed4f9b02e1d9c1c = function_c7a0b640c398497(tablename, classindex).perkpackage;
    if (isdefined(var_5ed4f9b02e1d9c1c)) {
        return function_5d63ef3292dd14b9(var_5ed4f9b02e1d9c1c);
    }
    return undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff4
// Size: 0xb0
function table_getextraperk(tablename, classindex, perkindex) {
    /#
        assert(perkindex <= 3);
    #/
    classstruct = function_c7a0b640c398497(tablename, classindex);
    if (!isdefined(classstruct.var_9e0a050f0398edc3)) {
        classstruct.var_9e0a050f0398edc3 = [0:classstruct.extraperks.perk1, 1:classstruct.extraperks.perk2, 2:classstruct.extraperks.perk3];
    }
    return classstruct.var_9e0a050f0398edc3[perkindex];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ac
// Size: 0x114
function function_f8e92e6cd8007d6b(tablename, classindex, perkindex) {
    /#
        assert(perkindex <= 5);
    #/
    classstruct = function_c7a0b640c398497(tablename, classindex);
    if (!isdefined(classstruct.var_d664a7af3b17529e)) {
        classstruct.var_d664a7af3b17529e = [0:classstruct.flcperks.perk1, 1:classstruct.flcperks.perk2, 2:classstruct.flcperks.perk3, 3:classstruct.flcperks.var_16680fbd1742cb4f, 4:classstruct.flcperks.var_16680ebd1742c91c, 5:classstruct.flcperks.var_166811bd1742cfb5, 6:classstruct.flcperks.var_166810bd1742cd82];
    }
    return classstruct.var_d664a7af3b17529e[perkindex];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c8
// Size: 0x30
function table_getequipmentprimary(tablename, classindex) {
    return function_c7a0b640c398497(tablename, classindex).equipment.primary;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4200
// Size: 0x45
function table_getextraequipmentprimary(tablename, classindex) {
    value = function_c7a0b640c398497(tablename, classindex).var_ad6972268c86a2be.primary;
    return isdefined(value) && value == 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x424d
// Size: 0x45
function table_getflcextraequipmentprimary(tablename, classindex) {
    value = function_c7a0b640c398497(tablename, classindex).flcextraequipment.primary;
    return isdefined(value) && value == 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429a
// Size: 0x30
function table_getequipmentsecondary(tablename, classindex) {
    return function_c7a0b640c398497(tablename, classindex).equipment.secondary;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d2
// Size: 0x45
function table_getextraequipmentsecondary(tablename, classindex) {
    value = function_c7a0b640c398497(tablename, classindex).var_ad6972268c86a2be.secondary;
    return isdefined(value) && value == 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431f
// Size: 0x45
function table_getflcextraequipmentsecondary(tablename, classindex) {
    value = function_c7a0b640c398497(tablename, classindex).flcextraequipment.secondary;
    return isdefined(value) && value == 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436c
// Size: 0x7b
function table_getsuper(tablename, classindex, index) {
    classstruct = function_c7a0b640c398497(tablename, classindex);
    classstruct.var_ed1e9520c9e770ea = [0:classstruct.fieldupgrades.var_7e397f4ce66bffd0, 1:classstruct.fieldupgrades.var_7e39824ce66c0669];
    return classstruct.var_ed1e9520c9e770ea[index];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43ef
// Size: 0x7b
function function_fc81ca208ad5823f(tablename, classindex, index) {
    classstruct = function_c7a0b640c398497(tablename, classindex);
    classstruct.var_9934efcb7046574a = [0:classstruct.var_c0936af6fe335d3c.var_7e397f4ce66bffd0, 1:classstruct.var_c0936af6fe335d3c.var_7e39824ce66c0669];
    return classstruct.var_9934efcb7046574a[index];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4472
// Size: 0x3b
function table_getspecialist(tablename, classindex) {
    value = function_c7a0b640c398497(tablename, classindex).specialist;
    return isdefined(value) && value == 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44b5
// Size: 0x26
function table_getgesture(tablename, classindex) {
    return function_c7a0b640c398497(tablename, classindex).gesture;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44e3
// Size: 0x26
function table_getexecution(tablename, classindex) {
    return function_c7a0b640c398497(tablename, classindex).execution;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4511
// Size: 0x87
function loadout_getplayerstreaktype(loadoutstreaktype) {
    /#
        assertex(isdefined(loadoutstreaktype), "loadout_getPlayerStreakType() passed loadout struct without defined loadoutStreakType.");
    #/
    result = undefined;
    switch (loadoutstreaktype) {
    case #"hash_e23522b86eb526c3":
        result = "support";
        break;
    case #"hash_946bfb43e361a475":
        result = "specialist";
        break;
    case #"hash_84b8b53bd4ec32c0":
        result = "resource";
        break;
    default:
        result = "assault";
        break;
    }
    return result;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a0
// Size: 0x9d
function function_5d63ef3292dd14b9(bundlename) {
    var_6db51b5b1a26eea7 = getscriptbundle("perkpackage:" + bundlename);
    perkpackage = [0:4];
    perkpackage[0] = var_6db51b5b1a26eea7.perks.var_89ba9d57a95da53b;
    perkpackage[1] = var_6db51b5b1a26eea7.perks.var_89ba9e57a95da76e;
    perkpackage[2] = var_6db51b5b1a26eea7.perks.var_13db3ca1ad2db644;
    perkpackage[3] = var_6db51b5b1a26eea7.perks.var_34fdca49e62d81ee;
    return perkpackage;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4645
// Size: 0x85
function getloadoutstreaktypefromstreaktype(streaktype) {
    if (!isdefined(streaktype)) {
        /#
            assertmsg("getLoadoutStreakTypeFromStreakType() called with undefined streaktype");
        #/
        return "streaktype_assault";
    }
    switch (streaktype) {
    case #"hash_605929bc0f7f95c8":
        return "streaktype_support";
    case #"hash_2bee0bf604b15c84":
        return "streaktype_specialist";
    case #"hash_d4f05e450448c3ec":
        return "streaktype_assault";
    default:
        /#
            assertex(0, "getLoadoutStreakTypeFromStreakType() called with unknown streaktype");
        #/
        return "streaktype_assault";
        break;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d1
// Size: 0x63
function loadout_getclassteam(class) {
    if (self.team == "spectator") {
        class = "none";
    }
    classteam = "none";
    if (issubstr(class, "axis")) {
        classteam = "axis";
    } else if (issubstr(class, "allies")) {
        classteam = "allies";
    }
    return classteam;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x473c
// Size: 0x85
function loadout_clearplayer(var_bea1f8064eda3de9) {
    loadout_clearweapons(var_bea1f8064eda3de9);
    _detachall(var_bea1f8064eda3de9);
    namespace_1a507865f681850e::clearallequipment();
    if (isdefined(self.loadoutarchetype)) {
        clearscriptable();
    }
    namespace_93ae9c099aee8626::removearchetype(self.loadoutarchetype);
    loadout_clearperks(var_bea1f8064eda3de9);
    namespace_bc06084df083b232::forgetpassives();
    namespace_46e9069d8502773a::cleargesture();
    namespace_f446f6030ca8cff8::_clearexecution();
    namespace_93104865b3b8748::clearplayeraccessory();
    namespace_727d2aa1d6c72038::perkpackage_resetoverridefieldupgrades();
    if (!istrue(var_bea1f8064eda3de9)) {
        resetfunctionality();
        resetactionslots();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c8
// Size: 0xde
function loadout_clearweapons(var_bea1f8064eda3de9) {
    if (istrue(var_bea1f8064eda3de9)) {
        if (isdefined(self.primaryweaponobj)) {
            _takeweapon(self.primaryweaponobj);
        }
        if (isdefined(self.secondaryweaponobj) && self.secondaryweaponobj.basename != "none") {
            _takeweapon(self.secondaryweaponobj);
        }
        if (isdefined(self.var_36940c335e7cc50c) && self.var_36940c335e7cc50c.basename != "none") {
            _takeweapon(self.var_36940c335e7cc50c);
        }
    } else {
        self takeallweapons();
    }
    self.primaryweapon = undefined;
    self.primaryweaponobj = undefined;
    self.secondaryweapon = undefined;
    self.secondaryweaponobj = undefined;
    thread namespace_6b49ddb858f34366::function_adcb155953291ec7(undefined, 0);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48ad
// Size: 0x51
function loadout_giveperk(perkname) {
    if (!isdefined(self.loadoutperks)) {
        self.loadoutperks = [];
    }
    giveperk(perkname);
    self.loadoutperks[self.loadoutperks.size] = perkname;
    function_df87366a6b9bc3a0(self.loadoutperks);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4905
// Size: 0xaf
function loadout_removeperk(perkname) {
    if (isdefined(self.loadoutperks)) {
        var_5de1358070f8daaf = 0;
        var_f04f11d62e9174ab = [];
        foreach (var_780be7dac4190bb5 in self.loadoutperks) {
            if (!var_5de1358070f8daaf) {
                jumpiffalse(var_780be7dac4190bb5 == perkname) LOC_00000083;
                removeperk(var_780be7dac4190bb5);
                var_5de1358070f8daaf = 1;
            } else {
            LOC_00000083:
                var_f04f11d62e9174ab[var_f04f11d62e9174ab.size] = var_780be7dac4190bb5;
            }
        }
        self.loadoutperks = var_f04f11d62e9174ab;
        function_df87366a6b9bc3a0(var_f04f11d62e9174ab);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x49bb
// Size: 0xce
function private function_df87366a6b9bc3a0(var_ca5ad0c2334c4a6c) {
    if (isdefined(self.pers)) {
        loadoutperks = [];
        extraperks = [];
        var_d4fa758998a39bfd = undefined;
        var_4c152a7907b0248e = undefined;
        if (isdefined(var_ca5ad0c2334c4a6c) && var_ca5ad0c2334c4a6c.size > 0) {
            foreach (perk in var_ca5ad0c2334c4a6c) {
                slot = namespace_b6a8027f477010e1::getperkslot(perk);
                if (isdefined(slot)) {
                    loadoutperks[loadoutperks.size] = perk;
                }
            }
        }
        self.pers["loadoutPerks"] = loadoutperks;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a90
// Size: 0x214
function loadout_clearperks(var_bea1f8064eda3de9, var_8be0f967aaa6eca6) {
    if (!isdefined(var_8be0f967aaa6eca6)) {
        var_8be0f967aaa6eca6 = 0;
    }
    if (getdvarint(@"hash_6a4d5cd30c97a609", 0)) {
        /#
            assertmsg("PERKS BUG LOGGING - clearing player perks");
        #/
    }
    if (istrue(var_bea1f8064eda3de9)) {
        if (isdefined(self.loadoutperks) && !istrue(self.var_43d76c324d4f0d86)) {
            foreach (perkname in self.loadoutperks) {
                removeperk(perkname);
            }
        }
        foreach (perkname, value in self.perks) {
            if (isdefined(self.var_15f3e6df722fb1cf) && perkname == self.var_15f3e6df722fb1cf) {
                removeperk(self.var_15f3e6df722fb1cf);
            }
            if (isdefined(self.var_15f3e5df722faf9c) && perkname == self.var_15f3e5df722faf9c) {
                removeperk(self.var_15f3e5df722faf9c);
            }
        }
    } else {
        if (var_8be0f967aaa6eca6) {
            namespace_b6a8027f477010e1::function_29ef7a1951b051f7();
        } else {
            namespace_b6a8027f477010e1::_clearperks();
        }
        self notify("all_perks_cleared");
    }
    if (getdvarint(@"hash_6a4d5cd30c97a609", 0)) {
        logstring("
 PERKS BUG LOGGING - After clear, player has " + self.perks.size + " perks.");
        foreach (idx, perk in self.perks) {
            logstring("
" + idx);
        }
    }
    self.loadoutperks = [];
    function_df87366a6b9bc3a0();
    self notify("loadout_perks_cleared");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cab
// Size: 0x4ed
function loadout_getclassstruct() {
    struct = spawnstruct();
    struct.loadoutarchetype = "none";
    struct.loadoutprimary = "none";
    struct.loadoutprimaryattachments = [];
    struct.loadoutprimaryattachmentids = [];
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        struct.loadoutprimaryattachments[attachmentindex] = "none";
        struct.loadoutprimaryattachmentids[attachmentindex] = 0;
    }
    struct.loadoutprimarycamo = "none";
    struct.loadoutprimaryreticle = "none";
    struct.loadoutprimarylootitemid = 0;
    struct.loadoutprimaryvariantid = -1;
    struct.loadoutprimarycosmeticattachment = "none";
    struct.loadoutprimarystickers = [];
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = "none";
    }
    struct.loadoutsecondary = "none";
    struct.loadoutsecondaryattachments = [];
    struct.loadoutsecondaryattachmentids = [];
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        struct.loadoutsecondaryattachments[attachmentindex] = "none";
        struct.loadoutsecondaryattachmentids[attachmentindex] = 0;
    }
    struct.loadoutsecondarycamo = "none";
    struct.loadoutsecondaryreticle = "none";
    struct.loadoutsecondarylootitemid = 0;
    struct.loadoutsecondaryvariantid = -1;
    struct.loadoutsecondarycosmeticattachment = "none";
    struct.loadoutsecondarystickers = [];
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = "none";
    }
    if (istrue(level.var_9e090a159cb48220)) {
        struct.loadouttertiary = "none";
        struct.var_494870a5978b5a09 = [];
        struct.var_6bfdc660c23f71ea = [];
        for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
            struct.var_494870a5978b5a09[attachmentindex] = "none";
            struct.var_6bfdc660c23f71ea[attachmentindex] = 0;
        }
        struct.loadouttertiarycamo = "none";
        struct.loadouttertiaryreticle = "none";
        struct.var_64e57707d385a2f5 = 0;
        struct.loadouttertiaryvariantid = -1;
        struct.var_372f30ef6d6882ab = "none";
        struct.var_afb9de90c523d105 = [];
        for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
            struct.var_afb9de90c523d105[var_36d2abbdcbcb186c] = "none";
        }
    }
    if (function_da27e3343b019fde()) {
        struct.var_dd07587af7d0ec5e = level.var_dd07587af7d0ec5e;
    }
    struct.loadoutmeleeslot = "none";
    struct.loadoutperksfromgamemode = 0;
    struct.loadoutperks = [];
    struct.loadoutstandardperks = [];
    struct.loadoutextraperks = [];
    struct.loadoutrigtrait = "specialty_null";
    struct.loadoutusingspecialist = 0;
    struct.loadoutequipmentprimary = "none";
    struct.var_b68e3a0a9c628d23 = 0;
    struct.loadoutextraequipmentprimary = 0;
    struct.loadoutequipmentsecondary = "none";
    struct.var_a1dfc5ce15795a3 = 0;
    struct.loadoutextraequipmentsecondary = 0;
    struct.loadoutsuper = "none";
    struct.loadoutgesture = "none";
    struct.loadoutaccessorydata = "none";
    struct.loadoutaccessoryweapon = "none";
    struct.loadoutfieldupgrade1 = "none";
    struct.var_4c4f03fa00925daf = 0;
    struct.loadoutfieldupgrade2 = "none";
    struct.var_2907f1614fe4e5f2 = 0;
    struct.loadoutswimweapon = "none";
    struct.var_887f342b4c851024 = "none";
    struct.loadoutstreaksfilled = 0;
    struct.loadoutstreaktype = "streaktype_assault";
    struct.loadoutkillstreak1 = "none";
    struct.loadoutkillstreak2 = "none";
    struct.loadoutkillstreak3 = "none";
    struct.var_70f190143fb74941 = 0;
    struct.var_2b902dfc607c8860 = 0;
    struct.var_7e3e3c6aebc4618f = 0;
    struct.tweakedbyplayerduringmatch = 0;
    struct.gamemodeforcednewloadout = 0;
    struct.iscopiedclass = 0;
    return struct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a0
// Size: 0x58d
function loadout_copyclassstruct(classstruct) {
    var_b1186edca9e8aef1 = spawnstruct();
    var_b1186edca9e8aef1.loadoutarchetype = classstruct.loadoutarchetype;
    if (isdefined(classstruct.loadoutprimaryaddblueprintattachments)) {
        var_b1186edca9e8aef1.loadoutprimaryaddblueprintattachments = classstruct.loadoutprimaryaddblueprintattachments;
    }
    var_b1186edca9e8aef1.loadoutprimary = classstruct.loadoutprimary;
    var_b1186edca9e8aef1.loadoutprimaryattachments = classstruct.loadoutprimaryattachments;
    var_b1186edca9e8aef1.loadoutprimaryattachmentids = classstruct.loadoutprimaryattachmentids;
    var_b1186edca9e8aef1.loadoutprimarycamo = classstruct.loadoutprimarycamo;
    var_b1186edca9e8aef1.loadoutprimaryreticle = classstruct.loadoutprimaryreticle;
    var_b1186edca9e8aef1.loadoutprimarylootitemid = classstruct.loadoutprimarylootitemid;
    var_b1186edca9e8aef1.loadoutprimaryvariantid = classstruct.loadoutprimaryvariantid;
    var_b1186edca9e8aef1.loadoutprimarycosmeticattachment = classstruct.loadoutprimarycosmeticattachment;
    var_b1186edca9e8aef1.loadoutprimarystickers = classstruct.loadoutprimaryweaponstickers;
    if (isdefined(classstruct.loadoutsecondaryaddblueprintattachments)) {
        var_b1186edca9e8aef1.loadoutsecondaryaddblueprintattachments = classstruct.loadoutsecondaryaddblueprintattachments;
    }
    var_b1186edca9e8aef1.loadoutsecondary = classstruct.loadoutsecondary;
    var_b1186edca9e8aef1.loadoutsecondaryattachments = classstruct.loadoutsecondaryattachments;
    var_b1186edca9e8aef1.loadoutsecondaryattachmentids = classstruct.loadoutsecondaryattachmentids;
    var_b1186edca9e8aef1.loadoutsecondarycamo = classstruct.loadoutsecondarycamo;
    var_b1186edca9e8aef1.loadoutsecondaryreticle = classstruct.loadoutsecondaryreticle;
    var_b1186edca9e8aef1.loadoutsecondarylootitemid = classstruct.loadoutsecondarylootitemid;
    var_b1186edca9e8aef1.loadoutsecondaryvariantid = classstruct.loadoutsecondaryvariantid;
    var_b1186edca9e8aef1.loadoutsecondarycosmeticattachment = classstruct.loadoutsecondarycosmeticattachment;
    var_b1186edca9e8aef1.loadoutsecondarystickers = classstruct.loadoutsecondarystickers;
    if (istrue(level.var_9e090a159cb48220)) {
        if (isdefined(classstruct.loadouttertiaryaddblueprintattachments)) {
            var_b1186edca9e8aef1.loadouttertiaryaddblueprintattachments = classstruct.loadouttertiaryaddblueprintattachments;
        }
        var_b1186edca9e8aef1.loadouttertiary = classstruct.loadouttertiary;
        var_b1186edca9e8aef1.var_494870a5978b5a09 = classstruct.var_494870a5978b5a09;
        var_b1186edca9e8aef1.var_6bfdc660c23f71ea = classstruct.var_6bfdc660c23f71ea;
        var_b1186edca9e8aef1.loadouttertiarycamo = classstruct.loadouttertiarycamo;
        var_b1186edca9e8aef1.loadouttertiaryreticle = classstruct.loadouttertiaryreticle;
        var_b1186edca9e8aef1.var_64e57707d385a2f5 = classstruct.var_64e57707d385a2f5;
        var_b1186edca9e8aef1.loadouttertiaryvariantid = classstruct.loadouttertiaryvariantid;
        var_b1186edca9e8aef1.var_372f30ef6d6882ab = classstruct.var_372f30ef6d6882ab;
        var_b1186edca9e8aef1.var_afb9de90c523d105 = classstruct.var_afb9de90c523d105;
    }
    if (function_da27e3343b019fde()) {
        var_b1186edca9e8aef1.var_dd07587af7d0ec5e = classstruct.var_dd07587af7d0ec5e;
    }
    var_b1186edca9e8aef1.loadoutmeleeslot = classstruct.loadoutmeleeslot;
    var_b1186edca9e8aef1.loadoutperksfromgamemode = classstruct.loadoutperksfromgamemode;
    var_b1186edca9e8aef1.loadoutperks = classstruct.loadoutperks;
    var_b1186edca9e8aef1.loadoutstandardperks = classstruct.loadoutstandardperks;
    var_b1186edca9e8aef1.loadoutextraperks = classstruct.loadoutextraperks;
    var_b1186edca9e8aef1.loadoutrigtrait = classstruct.loadoutrigtrait;
    var_b1186edca9e8aef1.loadoutusingspecialist = classstruct.loadoutusingspecialist;
    var_b1186edca9e8aef1.loadoutequipmentprimary = classstruct.loadoutequipmentprimary;
    var_b1186edca9e8aef1.loadoutextraequipmentprimary = classstruct.loadoutextraequipmentprimary;
    var_b1186edca9e8aef1.loadoutequipmentsecondary = classstruct.loadoutequipmentsecondary;
    var_b1186edca9e8aef1.loadoutextraequipmentsecondary = classstruct.loadoutextraequipmentsecondary;
    var_b1186edca9e8aef1.loadoutsuper = classstruct.loadoutsuper;
    var_b1186edca9e8aef1.loadoutgesture = classstruct.loadoutgesture;
    var_b1186edca9e8aef1.loadoutaccessorydata = classstruct.loadoutaccessorydata;
    var_b1186edca9e8aef1.loadoutaccessoryweapon = classstruct.loadoutaccessoryweapon;
    var_b1186edca9e8aef1.loadoutfieldupgrade1 = classstruct.loadoutfieldupgrade1;
    var_b1186edca9e8aef1.loadoutfieldupgrade2 = classstruct.loadoutfieldupgrade2;
    var_b1186edca9e8aef1.loadoutstreaksfilled = classstruct.loadoutstreaksfilled;
    var_b1186edca9e8aef1.loadoutstreaktype = classstruct.loadoutstreaktype;
    var_b1186edca9e8aef1.loadoutkillstreak1 = classstruct.loadoutkillstreak1;
    var_b1186edca9e8aef1.loadoutkillstreak2 = classstruct.loadoutkillstreak2;
    var_b1186edca9e8aef1.loadoutkillstreak3 = classstruct.loadoutkillstreak3;
    var_b1186edca9e8aef1.tweakedbyplayerduringmatch = classstruct.tweakedbyplayerduringmatch;
    var_b1186edca9e8aef1.gamemodeforcednewloadout = classstruct.gamemodeforcednewloadout;
    var_b1186edca9e8aef1.iscopiedclass = classstruct.iscopiedclass;
    var_b1186edca9e8aef1 = loadout_updateclass(var_b1186edca9e8aef1, "copied");
    return var_b1186edca9e8aef1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5735
// Size: 0x473
function loadout_updateclassteam(struct, class, classteam) {
    classteam = loadout_getclassteam(class);
    classindex = getclassindex(class);
    self.class_num = classindex;
    self.classteam = classteam;
    struct.loadoutarchetype = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "archetype");
    struct.loadoutprimary = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 0, "weapon");
    if (struct.loadoutprimary == "none") {
        struct.loadoutprimary = "iw9_me_fists";
    } else {
        for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
            struct.loadoutprimaryattachments[attachmentindex] = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 0, "attachmentSetup");
        }
        for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
            struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 0, "sticker");
        }
    }
    struct.loadoutprimarycamo = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 0, "camo");
    struct.loadoutprimaryreticle = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 0, "reticle");
    struct.loadoutsecondary = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "weapon");
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        struct.loadoutsecondaryattachments[attachmentindex] = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "attachmentSetup");
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "sticker");
    }
    struct.loadoutsecondarycamo = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "camo");
    struct.loadoutsecondaryreticle = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "reticle");
    if (istrue(level.var_9e090a159cb48220)) {
        struct.loadouttertiary = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "weapon");
        for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
            struct.var_494870a5978b5a09[attachmentindex] = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "attachmentSetup");
        }
        for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
            struct.var_afb9de90c523d105[var_36d2abbdcbcb186c] = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "sticker");
        }
        struct.loadouttertiarycamo = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "camo");
        struct.loadouttertiaryreticle = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "weaponSetups", 1, "reticle");
    }
    struct.loadoutmeleeslot = "none";
    struct.loadoutequipmentprimary = "none";
    struct.loadoutextraequipmentprimary = 0;
    struct.loadoutequipmentsecondary = "none";
    struct.loadoutextraequipmentsecondary = 0;
    struct.loadoutfieldupgrade1 = "none";
    struct.loadoutfieldupgrade2 = "none";
    struct.loadoutgesture = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "gesture");
    struct.loadoutstreaksfilled = 1;
    struct.loadoutkillstreak1 = recipe_getkillstreak(classteam, classindex, 0);
    struct.loadoutkillstreak2 = recipe_getkillstreak(classteam, classindex, 1);
    struct.loadoutkillstreak3 = recipe_getkillstreak(classteam, classindex, 2);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5baf
// Size: 0x572
function loadout_updateclasscustom(struct, class, var_6b02e0d0b48f639a) {
    if (issharedfuncdefined("instanceInventory", "updateCustomClassStruct")) {
        [[ getsharedfunc("instanceInventory", "updateCustomClassStruct") ]](self, struct, class);
        return;
    }
    classindex = getclassindex(class);
    self.class_num = classindex;
    struct.loadoutarchetype = cac_getcharacterarchetype();
    struct.loadoutprimary = cac_getweapon(classindex, 0);
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        attachmentname = cac_getweaponattachment(classindex, 0, attachmentindex);
        struct.loadoutprimaryattachments[attachmentindex] = attachmentname;
        struct.loadoutprimaryattachmentids[attachmentindex] = cac_getweaponattachmentid(classindex, 0, attachmentindex);
        if (!istrue(var_6b02e0d0b48f639a)) {
            var_c19231fe2990712e = function_a4065e820eb1f919(classindex, 0, attachmentindex);
            if (isdefined(var_c19231fe2990712e)) {
                struct.var_193bf3cfb8aeaf0f[attachmentname] = var_c19231fe2990712e;
            }
        }
    }
    struct.loadoutprimarycamo = cac_getweaponcamo(classindex, 0);
    struct.loadoutprimaryreticle = cac_getweaponreticle(classindex, 0);
    struct.loadoutprimarylootitemid = cac_getweaponlootitemid(classindex, 0);
    struct.loadoutprimaryvariantid = cac_getweaponvariantid(classindex, 0);
    struct.loadoutprimarycosmeticattachment = cac_getweaponcosmeticattachment(classindex, 0);
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = cac_getweaponsticker(classindex, 0, var_36d2abbdcbcb186c);
    }
    struct.loadoutsecondary = cac_getweapon(classindex, 1);
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        attachmentname = cac_getweaponattachment(classindex, 1, attachmentindex);
        struct.loadoutsecondaryattachments[attachmentindex] = attachmentname;
        struct.loadoutsecondaryattachmentids[attachmentindex] = cac_getweaponattachmentid(classindex, 1, attachmentindex);
        if (!istrue(var_6b02e0d0b48f639a)) {
            var_c19231fe2990712e = function_a4065e820eb1f919(classindex, 1, attachmentindex);
            if (isdefined(var_c19231fe2990712e)) {
                struct.var_ead3720e647f74a3[attachmentname] = var_c19231fe2990712e;
            }
        }
    }
    struct.loadoutsecondarycamo = cac_getweaponcamo(classindex, 1);
    struct.loadoutsecondaryreticle = cac_getweaponreticle(classindex, 1);
    struct.loadoutsecondarylootitemid = cac_getweaponlootitemid(classindex, 1);
    struct.loadoutsecondaryvariantid = cac_getweaponvariantid(classindex, 1);
    struct.loadoutsecondarycosmeticattachment = cac_getweaponcosmeticattachment(classindex, 1);
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = cac_getweaponsticker(classindex, 1, var_36d2abbdcbcb186c);
    }
    if (istrue(level.var_9e090a159cb48220)) {
        struct.loadouttertiary = cac_getweapon(classindex, 2);
        for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
            attachmentname = cac_getweaponattachment(classindex, 2, attachmentindex);
            struct.var_494870a5978b5a09[attachmentindex] = attachmentname;
            struct.var_6bfdc660c23f71ea[attachmentindex] = cac_getweaponattachmentid(classindex, 2, attachmentindex);
            var_c19231fe2990712e = function_a4065e820eb1f919(classindex, 2, attachmentindex);
            if (isdefined(var_c19231fe2990712e)) {
                struct.var_b58a085466758039[attachmentname] = var_c19231fe2990712e;
            }
        }
        struct.loadouttertiarycamo = cac_getweaponcamo(classindex, 2);
        struct.loadouttertiaryreticle = cac_getweaponreticle(classindex, 2);
        struct.var_64e57707d385a2f5 = cac_getweaponlootitemid(classindex, 2);
        struct.loadouttertiaryvariantid = cac_getweaponvariantid(classindex, 2);
        struct.var_372f30ef6d6882ab = cac_getweaponcosmeticattachment(classindex, 2);
        for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
            struct.var_afb9de90c523d105[var_36d2abbdcbcb186c] = cac_getweaponsticker(classindex, 2, var_36d2abbdcbcb186c);
        }
    }
    struct.loadoutequipmentprimary = cac_getequipmentprimary(classindex);
    struct.var_b68e3a0a9c628d23 = function_9c883cb23c614891(classindex);
    struct.loadoutextraequipmentprimary = cac_getextraequipmentprimary(classindex);
    struct.loadoutequipmentsecondary = cac_getequipmentsecondary(classindex);
    struct.var_a1dfc5ce15795a3 = function_d9e6d0a8cbe6b48d(classindex);
    struct.loadoutextraequipmentsecondary = cac_getextraequipmentsecondary(classindex);
    struct.loadoutgesture = cac_getgesture();
    struct.loadoutaccessoryweapon = cac_getaccessoryweapon();
    struct.loadoutaccessorydata = cac_getaccessorydata();
    struct.loadoutaccessorylogic = cac_getaccessorylogic();
    struct.loadoutfieldupgrade1 = cac_getfieldupgrade(classindex, 0);
    struct.var_4c4f03fa00925daf = function_a2a7f87d758bbfb8(classindex, 0);
    struct.loadoutfieldupgrade2 = cac_getfieldupgrade(classindex, 1);
    struct.var_2907f1614fe4e5f2 = function_a2a7f87d758bbfb8(classindex, 1);
    struct.loadoutstreaksfilled = 1;
    struct.loadoutkillstreak1 = cac_getkillstreak(0, class);
    struct.loadoutkillstreak2 = cac_getkillstreak(1, class);
    struct.loadoutkillstreak3 = cac_getkillstreak(2, class);
    struct.var_70f190143fb74941 = function_3d362af202938e22(0, class);
    struct.var_2b902dfc607c8860 = function_3d362af202938e22(1, class);
    struct.var_7e3e3c6aebc4618f = function_3d362af202938e22(2, class);
    struct.loadoutusingspecialist = cac_getusingspecialist(classindex);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6128
// Size: 0x79c
function loadout_updateclassgamemode(struct, class) {
    if (!isdefined(self.pers["gamemodeLoadout"]) && isbot(self)) {
        namespace_8be37ac443f7f654::function_a693c24def6fb1ed();
        loadout_updateclasscallback(struct);
        return;
    }
    self.class_num = getclassindex(class);
    gamemodeloadout = self.pers["gamemodeLoadout"];
    if (!isdefined(gamemodeloadout["loadoutArchetype"])) {
        if (isbot(self)) {
            struct.loadoutarchetype = "archetype_assault";
        } else {
            struct.loadoutarchetype = cac_getcharacterarchetype();
        }
    } else {
        struct.loadoutarchetype = gamemodeloadout["loadoutArchetype"];
    }
    if (isdefined(gamemodeloadout["loadoutRigTrait"])) {
        struct.loadoutrigtrait = gamemodeloadout["loadoutRigTrait"];
    }
    if (isdefined(gamemodeloadout["loadoutPrimaryAddBlueprintAttachments"])) {
        struct.loadoutprimaryaddblueprintattachments = gamemodeloadout["loadoutPrimaryAddBlueprintAttachments"];
    }
    if (isdefined(gamemodeloadout["loadoutPrimary"])) {
        struct.loadoutprimary = gamemodeloadout["loadoutPrimary"];
    }
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        var_efbdcd88107af5f9 = getattachmentloadoutstring(attachmentindex, #"primary");
        if (isdefined(gamemodeloadout[var_efbdcd88107af5f9])) {
            struct.loadoutprimaryattachments[attachmentindex] = gamemodeloadout[var_efbdcd88107af5f9];
        }
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        var_5e5774b116a39979 = getstickerloadoutstring(var_36d2abbdcbcb186c, #"primary");
        if (isdefined(gamemodeloadout[var_5e5774b116a39979])) {
            struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = gamemodeloadout[var_5e5774b116a39979];
        }
    }
    if (isdefined(gamemodeloadout["loadoutPrimaryCamo"])) {
        struct.loadoutprimarycamo = gamemodeloadout["loadoutPrimaryCamo"];
    }
    if (isdefined(gamemodeloadout["loadoutPrimaryCosmeticAttachment"])) {
        struct.loadoutprimarycosmeticattachment = gamemodeloadout["loadoutPrimaryCosmeticAttachment"];
    }
    if (isdefined(gamemodeloadout["loadoutPrimaryReticle"])) {
        struct.loadoutprimaryreticle = gamemodeloadout["loadoutPrimaryReticle"];
    }
    if (isdefined(gamemodeloadout["loadoutPrimaryVariantID"])) {
        struct.loadoutprimaryvariantid = gamemodeloadout["loadoutPrimaryVariantID"];
    }
    if (isdefined(gamemodeloadout["loadoutPrimaryVariantID"]) && getgametype() == "arena") {
        if (isdefined(gamemodeloadout["roundWinStreakPrimaryCamoTeam"]) && isdefined(self.pers["team"]) && gamemodeloadout["roundWinStreakPrimaryCamoTeam"] == self.pers["team"]) {
            if (isdefined(gamemodeloadout["roundWinStreakPrimaryCamo"])) {
                struct.loadoutprimarycamo = gamemodeloadout["roundWinStreakPrimaryCamo"];
            }
        }
        if (gamemodeloadout["loadoutPrimaryVariantID"] != -1) {
            setomnvar("ui_arena_primaryVariantID", gamemodeloadout["loadoutPrimaryVariantID"]);
        }
    }
    if (isdefined(gamemodeloadout["loadoutSecondaryAddBlueprintAttachments"])) {
        struct.loadoutsecondaryaddblueprintattachments = gamemodeloadout["loadoutSecondaryAddBlueprintAttachments"];
    }
    if (isdefined(gamemodeloadout["loadoutSecondary"])) {
        struct.loadoutsecondary = gamemodeloadout["loadoutSecondary"];
    }
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        var_efbdcd88107af5f9 = getattachmentloadoutstring(attachmentindex, #"secondary");
        if (isdefined(gamemodeloadout[var_efbdcd88107af5f9])) {
            struct.loadoutsecondaryattachments[attachmentindex] = gamemodeloadout[var_efbdcd88107af5f9];
        }
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        var_5e5774b116a39979 = getstickerloadoutstring(var_36d2abbdcbcb186c, #"secondary");
        if (isdefined(gamemodeloadout[var_5e5774b116a39979])) {
            struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = gamemodeloadout[var_5e5774b116a39979];
        }
    }
    if (isdefined(gamemodeloadout["loadoutSecondaryCamo"])) {
        struct.loadoutsecondarycamo = gamemodeloadout["loadoutSecondaryCamo"];
    }
    if (isdefined(gamemodeloadout["loadoutSecondaryCosmeticAttachment"])) {
        struct.loadoutsecondarycosmeticattachment = gamemodeloadout["loadoutSecondaryCosmeticAttachment"];
    }
    if (isdefined(gamemodeloadout["loadoutSecondaryReticle"])) {
        struct.loadoutsecondaryreticle = gamemodeloadout["loadoutSecondaryReticle"];
    }
    if (isdefined(gamemodeloadout["loadoutSecondaryVariantID"])) {
        struct.loadoutsecondaryvariantid = gamemodeloadout["loadoutSecondaryVariantID"];
    }
    if (isdefined(gamemodeloadout["loadoutSecondaryVariantID"]) && getgametype() == "arena" && gamemodeloadout["loadoutSecondaryVariantID"] != -1) {
        if (isdefined(gamemodeloadout["roundWinStreakecondaryCamoTeam"]) && isdefined(self.pers["team"]) && gamemodeloadout["roundWinStreakecondaryCamoTeam"] == self.pers["team"]) {
            if (isdefined(gamemodeloadout["roundWinStreakSecondaryCamo"])) {
                struct.loadoutsecondarycamo = gamemodeloadout["roundWinStreakSecondaryCamo"];
            }
        }
        if (gamemodeloadout["loadoutSecondaryVariantID"] != -1) {
            setomnvar("ui_arena_secondaryVariantID", gamemodeloadout["loadoutSecondaryVariantID"]);
        }
    }
    if (isdefined(gamemodeloadout["loadoutMeleeSlot"])) {
        struct.loadoutmeleeslot = gamemodeloadout["loadoutMeleeSlot"];
    }
    if (isdefined(gamemodeloadout["loadoutSwimWeapon"])) {
        struct.loadoutswimweapon = gamemodeloadout["loadoutSwimWeapon"];
    }
    struct.loadoutperksfromgamemode = isdefined(gamemodeloadout["loadoutPerks"]);
    if (isdefined(gamemodeloadout["loadoutPerks"])) {
        struct.loadoutperks = gamemodeloadout["loadoutPerks"];
    }
    struct.loadoutextraperksfromgamemode = isdefined(gamemodeloadout["loadoutExtraPerks"]);
    if (isdefined(gamemodeloadout["loadoutExtraPerks"])) {
        struct.loadoutextraperks = gamemodeloadout["loadoutExtraPerks"];
    }
    if (isdefined(gamemodeloadout["loadoutEquipmentPrimary"])) {
        struct.loadoutequipmentprimary = gamemodeloadout["loadoutEquipmentPrimary"];
    }
    if (isdefined(gamemodeloadout["loadoutExtraEquipmentPrimary"])) {
        struct.loadoutextraequipmentprimary = gamemodeloadout["loadoutExtraEquipmentPrimary"];
    }
    if (isdefined(gamemodeloadout["loadoutEquipmentSecondary"])) {
        struct.loadoutequipmentsecondary = gamemodeloadout["loadoutEquipmentSecondary"];
    }
    if (isdefined(gamemodeloadout["loadoutExtraEquipmentSecondary"])) {
        struct.loadoutextraequipmentsecondary = gamemodeloadout["loadoutExtraEquipmentSecondary"];
    }
    if (isdefined(gamemodeloadout["loadoutSuper"])) {
        struct.loadoutsuper = gamemodeloadout["loadoutSuper"];
    }
    if (isdefined(gamemodeloadout["loadoutFieldUpgrade1"])) {
        struct.loadoutfieldupgrade1 = gamemodeloadout["loadoutFieldUpgrade1"];
    }
    if (isdefined(gamemodeloadout["loadoutFieldUpgrade2"])) {
        struct.loadoutfieldupgrade2 = gamemodeloadout["loadoutFieldUpgrade2"];
    }
    if (isdefined(gamemodeloadout["disableBackupPistol"])) {
        struct.disablebackuppistol = gamemodeloadout["disableBackupPistol"];
    }
    if (isbot(self)) {
        struct.loadoutaccessoryweapon = "none";
        struct.loadoutaccessorydata = "none";
        struct.loadoutaccessorylogic = "none";
    } else {
        struct.loadoutaccessoryweapon = cac_getaccessoryweapon();
        struct.loadoutaccessorydata = cac_getaccessorydata();
        struct.loadoutaccessorylogic = cac_getaccessorylogic();
    }
    if (isdefined(gamemodeloadout["loadoutGesture"])) {
        if (gamemodeloadout["loadoutGesture"] == "playerData") {
            if (isbot(self)) {
                struct.loadoutgesture = "none";
            } else {
                struct.loadoutgesture = cac_getgesture();
            }
        } else {
            struct.loadoutgesture = gamemodeloadout["loadoutGesture"];
        }
    }
    if (isdefined(gamemodeloadout["loadoutKillstreak1"]) && gamemodeloadout["loadoutKillstreak1"] != "specialty_null" || isdefined(gamemodeloadout["loadoutKillstreak2"]) && gamemodeloadout["loadoutKillstreak2"] != "specialty_null" || isdefined(gamemodeloadout["loadoutKillstreak3"]) && gamemodeloadout["loadoutKillstreak3"] != "specialty_null") {
        struct.loadoutstreaksfilled = 1;
        struct.loadoutkillstreak1 = gamemodeloadout["loadoutKillstreak1"];
        struct.loadoutkillstreak2 = gamemodeloadout["loadoutKillstreak2"];
        struct.loadoutkillstreak3 = gamemodeloadout["loadoutKillstreak3"];
    }
    if (isdefined(gamemodeloadout["loadoutUsingSpecialist"])) {
        struct.loadoutusingspecialist = 1;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68cb
// Size: 0xe5e
function loadout_updateclasscallback(struct) {
    if (!isdefined(self.classcallback)) {
        error("self.classCallback function reference required for class 'callback'");
    }
    var_2d720734d96cd35e = self [[ self.classcallback ]]();
    if (!isdefined(var_2d720734d96cd35e)) {
        error("array required from self.classCallback for class 'callback'");
    }
    if (isbot(self)) {
        if (isdefined(var_2d720734d96cd35e.archetype)) {
            struct.loadoutarchetype = "archetype_" + tolower(var_2d720734d96cd35e.archetype);
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.weapon)) {
            struct.loadoutprimary = var_2d720734d96cd35e.primaryweapon.weapon;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.attachment1)) {
            struct.loadoutprimaryattachments[struct.loadoutprimaryattachments.size] = var_2d720734d96cd35e.primaryweapon.attachment1;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.attachment2)) {
            struct.loadoutprimaryattachments[struct.loadoutprimaryattachments.size] = var_2d720734d96cd35e.primaryweapon.attachment2;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.attachment3)) {
            struct.loadoutprimaryattachments[struct.loadoutprimaryattachments.size] = var_2d720734d96cd35e.primaryweapon.attachment3;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.attachment4)) {
            struct.loadoutprimaryattachments[struct.loadoutprimaryattachments.size] = var_2d720734d96cd35e.primaryweapon.attachment4;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.attachment5)) {
            struct.loadoutprimaryattachments[struct.loadoutprimaryattachments.size] = var_2d720734d96cd35e.primaryweapon.attachment5;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.attachment6)) {
            struct.loadoutprimaryattachments[struct.loadoutprimaryattachments.size] = var_2d720734d96cd35e.primaryweapon.attachment6;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.camo)) {
            struct.loadoutprimarycamo = var_2d720734d96cd35e.primaryweapon.camo;
        }
        if (isdefined(var_2d720734d96cd35e.primaryweapon.reticle)) {
            struct.loadoutprimaryreticle = var_2d720734d96cd35e.primaryweapon.reticle;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.weapon)) {
            struct.loadoutsecondary = var_2d720734d96cd35e.secondaryweapon.weapon;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.attachment1)) {
            struct.loadoutsecondaryattachments[struct.loadoutsecondaryattachments.size] = var_2d720734d96cd35e.secondaryweapon.attachment1;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.attachment2)) {
            struct.loadoutsecondaryattachments[struct.loadoutsecondaryattachments.size] = var_2d720734d96cd35e.secondaryweapon.attachment2;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.attachment3)) {
            struct.loadoutsecondaryattachments[struct.loadoutsecondaryattachments.size] = var_2d720734d96cd35e.secondaryweapon.attachment3;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.attachment4)) {
            struct.loadoutsecondaryattachments[struct.loadoutsecondaryattachments.size] = var_2d720734d96cd35e.secondaryweapon.attachment4;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.attachment5)) {
            struct.loadoutsecondaryattachments[struct.loadoutsecondaryattachments.size] = var_2d720734d96cd35e.secondaryweapon.attachment5;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.camo)) {
            struct.loadoutsecondarycamo = var_2d720734d96cd35e.secondaryweapon.camo;
        }
        if (isdefined(var_2d720734d96cd35e.secondaryweapon.reticle)) {
            struct.loadoutsecondaryreticle = var_2d720734d96cd35e.secondaryweapon.reticle;
        }
        if (isdefined(var_2d720734d96cd35e.tertiaryweapon)) {
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.weapon)) {
                struct.loadouttertiary = var_2d720734d96cd35e.tertiaryweapon.weapon;
            }
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.attachment1)) {
                struct.var_494870a5978b5a09[struct.var_494870a5978b5a09.size] = var_2d720734d96cd35e.tertiaryweapon.attachment1;
            }
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.attachment2)) {
                struct.var_494870a5978b5a09[struct.var_494870a5978b5a09.size] = var_2d720734d96cd35e.tertiaryweapon.attachment2;
            }
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.attachment3)) {
                struct.var_494870a5978b5a09[struct.var_494870a5978b5a09.size] = var_2d720734d96cd35e.tertiaryweapon.attachment3;
            }
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.attachment4)) {
                struct.var_494870a5978b5a09[struct.var_494870a5978b5a09.size] = var_2d720734d96cd35e.tertiaryweapon.attachment4;
            }
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.attachment5)) {
                struct.var_494870a5978b5a09[struct.var_494870a5978b5a09.size] = var_2d720734d96cd35e.tertiaryweapon.attachment5;
            }
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.camo)) {
                struct.loadouttertiarycamo = var_2d720734d96cd35e.tertiaryweapon.camo;
            }
            if (isdefined(var_2d720734d96cd35e.tertiaryweapon.reticle)) {
                struct.loadouttertiaryreticle = var_2d720734d96cd35e.tertiaryweapon.reticle;
            }
        }
        if (isdefined(var_2d720734d96cd35e.equipment.primary)) {
            struct.loadoutequipmentprimary = var_2d720734d96cd35e.equipment.primary;
        }
        if (isdefined(var_2d720734d96cd35e.equipment.secondary)) {
            struct.loadoutequipmentsecondary = var_2d720734d96cd35e.equipment.secondary;
        }
        if (isdefined(var_2d720734d96cd35e.perks.perk1)) {
            struct.loadoutperks[struct.loadoutperks.size] = var_2d720734d96cd35e.perks.perk1;
        }
        if (isdefined(var_2d720734d96cd35e.perks.perk2)) {
            struct.loadoutperks[struct.loadoutperks.size] = var_2d720734d96cd35e.perks.perk2;
        }
        if (isdefined(var_2d720734d96cd35e.perks.perk3)) {
            struct.loadoutperks[struct.loadoutperks.size] = var_2d720734d96cd35e.perks.perk3;
        }
        if (isdefined(var_2d720734d96cd35e.extraperks.perk1)) {
            struct.loadoutperks[struct.loadoutperks.size] = var_2d720734d96cd35e.extraperks.perk1;
        }
        if (isdefined(var_2d720734d96cd35e.extraperks.perk2)) {
            struct.loadoutperks[struct.loadoutperks.size] = var_2d720734d96cd35e.extraperks.perk2;
        }
        if (isdefined(var_2d720734d96cd35e.extraperks.perk3)) {
            struct.loadoutperks[struct.loadoutperks.size] = var_2d720734d96cd35e.extraperks.perk3;
        }
        if (isdefined(var_2d720734d96cd35e.gesture)) {
            struct.loadoutgesture = var_2d720734d96cd35e.gesture;
        }
        if (isdefined(var_2d720734d96cd35e.var_7e397f4ce66bffd0)) {
            struct.loadoutfieldupgrade1 = var_2d720734d96cd35e.var_7e397f4ce66bffd0;
        }
        if (isdefined(var_2d720734d96cd35e.var_7e39824ce66c0669)) {
            struct.loadoutfieldupgrade2 = var_2d720734d96cd35e.var_7e39824ce66c0669;
        }
        if (isdefined(var_2d720734d96cd35e.specialist)) {
            struct.loadoutusingspecialist = var_2d720734d96cd35e.specialist;
        }
    } else {
        if (isdefined(var_2d720734d96cd35e["loadoutArchetype"])) {
            struct.loadoutarchetype = var_2d720734d96cd35e["loadoutArchetype"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutPrimaryAddBlueprintAttachments"])) {
            struct.loadoutprimaryaddblueprintattachments = var_2d720734d96cd35e["loadoutPrimaryAddBlueprintAttachments"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutPrimary"])) {
            struct.loadoutprimary = var_2d720734d96cd35e["loadoutPrimary"];
        }
        for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
            var_efbdcd88107af5f9 = getattachmentloadoutstring(attachmentindex, #"primary");
            if (isdefined(var_2d720734d96cd35e[var_efbdcd88107af5f9])) {
                struct.loadoutprimaryattachments[attachmentindex] = var_2d720734d96cd35e[var_efbdcd88107af5f9];
            }
        }
        if (isdefined(var_2d720734d96cd35e["loadoutPrimaryCamo"])) {
            struct.loadoutprimarycamo = var_2d720734d96cd35e["loadoutPrimaryCamo"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutPrimaryReticle"])) {
            struct.loadoutprimaryreticle = var_2d720734d96cd35e["loadoutPrimaryReticle"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutPrimaryVariantID"])) {
            struct.loadoutprimaryvariantid = var_2d720734d96cd35e["loadoutPrimaryVariantID"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutSecondaryAddBlueprintAttachments"])) {
            struct.loadoutsecondaryaddblueprintattachments = var_2d720734d96cd35e["loadoutSecondaryAddBlueprintAttachments"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutSecondary"])) {
            struct.loadoutsecondary = var_2d720734d96cd35e["loadoutSecondary"];
        }
        for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
            var_efbdcd88107af5f9 = getattachmentloadoutstring(attachmentindex, #"secondary");
            if (isdefined(var_2d720734d96cd35e[var_efbdcd88107af5f9])) {
                struct.loadoutsecondaryattachments[attachmentindex] = var_2d720734d96cd35e[var_efbdcd88107af5f9];
            }
        }
        if (isdefined(var_2d720734d96cd35e["loadoutSecondaryCamo"])) {
            struct.loadoutsecondarycamo = var_2d720734d96cd35e["loadoutSecondaryCamo"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutSecondaryReticle"])) {
            struct.loadoutsecondaryreticle = var_2d720734d96cd35e["loadoutSecondaryReticle"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutSecondaryVariantID"])) {
            struct.loadoutsecondaryvariantid = var_2d720734d96cd35e["loadoutSecondaryVariantID"];
        }
        if (istrue(level.var_9e090a159cb48220)) {
            if (isdefined(var_2d720734d96cd35e["loadoutTertiaryAddBlueprintAttachments"])) {
                struct.loadouttertiaryaddblueprintattachments = var_2d720734d96cd35e["loadoutTertiaryAddBlueprintAttachments"];
            }
            if (isdefined(var_2d720734d96cd35e["loadoutTertiary"])) {
                struct.loadouttertiary = var_2d720734d96cd35e["loadoutTertiary"];
            }
            for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
                var_efbdcd88107af5f9 = getattachmentloadoutstring(attachmentindex, #"tertiary");
                if (isdefined(var_2d720734d96cd35e[var_efbdcd88107af5f9])) {
                    struct.var_494870a5978b5a09[attachmentindex] = var_2d720734d96cd35e[var_efbdcd88107af5f9];
                }
            }
            if (isdefined(var_2d720734d96cd35e["loadoutTertiaryCamo"])) {
                struct.loadouttertiarycamo = var_2d720734d96cd35e["loadoutTertiaryCamo"];
            }
            if (isdefined(var_2d720734d96cd35e["loadoutTertiaryReticle"])) {
                struct.loadouttertiaryreticle = var_2d720734d96cd35e["loadoutTertiaryReticle"];
            }
            if (isdefined(var_2d720734d96cd35e["loadoutTertiaryVariantID"])) {
                struct.loadouttertiaryvariantid = var_2d720734d96cd35e["loadoutTertiaryVariantID"];
            }
        }
        if (isdefined(var_2d720734d96cd35e["loadoutMeleeSlot"])) {
            struct.loadoutmeleeslot = var_2d720734d96cd35e["loadoutMeleeSlot"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutEquipmentPrimary"])) {
            struct.loadoutequipmentprimary = var_2d720734d96cd35e["loadoutEquipmentPrimary"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutExtraEquipmentPrimary"])) {
            struct.loadoutextraequipmentprimary = var_2d720734d96cd35e["loadoutExtraEquipmentPrimary"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutEquipmentSecondary"])) {
            struct.loadoutequipmentsecondary = var_2d720734d96cd35e["loadoutEquipmentSecondary"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutExtraEquipmentSecondary"])) {
            struct.loadoutextraequipmentsecondary = var_2d720734d96cd35e["loadoutExtraEquipmentSecondary"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutSuper"])) {
            struct.loadoutsuper = var_2d720734d96cd35e["loadoutSuper"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutGesture"])) {
            struct.loadoutgesture = var_2d720734d96cd35e["loadoutGesture"];
        }
        struct.loadoutstreaksfilled = isdefined(var_2d720734d96cd35e["loadoutStreak1"]) || isdefined(var_2d720734d96cd35e["loadoutStreak2"]) || isdefined(var_2d720734d96cd35e["loadoutStreak3"]);
        if (isdefined(var_2d720734d96cd35e["loadoutStreakType"])) {
            struct.loadoutstreaktype = var_2d720734d96cd35e["loadoutStreakType"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutStreak1"])) {
            struct.loadoutkillstreak1 = var_2d720734d96cd35e["loadoutStreak1"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutStreak2"])) {
            struct.loadoutkillstreak2 = var_2d720734d96cd35e["loadoutStreak2"];
        }
        if (isdefined(var_2d720734d96cd35e["loadoutStreak3"])) {
            struct.loadoutkillstreak3 = var_2d720734d96cd35e["loadoutStreak3"];
        }
        if (isdefined(var_2d720734d96cd35e["disableBackupPistol"])) {
            struct.disablebackuppistol = var_2d720734d96cd35e["disableBackupPistol"];
        }
    }
    struct.var_de7fe0f200a1deff = isdefined(struct.loadoutperks) && struct.loadoutperks.size > 0;
    struct.var_b5c2d62f9d1dae7b = isdefined(struct.loadoutextraperks) && struct.loadoutextraperks.size > 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7730
// Size: 0x21a
function loadout_updateclassdefault(struct, class) {
    classindex = getclassindex(class);
    self.class_num = classindex;
    loadout_updateclassdefault_weapons(struct, classindex);
    struct.loadoutequipmentprimary = table_getequipmentprimary(level.classtablename, classindex);
    struct.loadoutextraequipmentprimary = table_getextraequipmentprimary(level.classtablename, classindex);
    struct.loadoutequipmentsecondary = table_getequipmentsecondary(level.classtablename, classindex);
    struct.loadoutextraequipmentsecondary = table_getextraequipmentsecondary(level.classtablename, classindex);
    struct.loadoutgesture = table_getgesture(level.classtablename, classindex);
    struct.loadoutusingspecialist = table_getspecialist(level.classtablename, classindex);
    struct.loadoutfieldupgrade1 = table_getsuper(level.classtablename, classindex, 0);
    struct.loadoutfieldupgrade2 = table_getsuper(level.classtablename, classindex, 1);
    struct.loadoutaccessoryweapon = cac_getaccessoryweapon();
    struct.loadoutaccessorydata = cac_getaccessorydata();
    struct.loadoutaccessorylogic = cac_getaccessorylogic();
    struct.loadoutarchetype = cac_getcharacterarchetype();
    struct.loadoutkillstreak1 = cac_getkillstreak(0, class);
    struct.loadoutkillstreak2 = cac_getkillstreak(1, class);
    struct.loadoutkillstreak3 = cac_getkillstreak(2, class);
    struct.var_70f190143fb74941 = function_3d362af202938e22(0, class);
    struct.var_2b902dfc607c8860 = function_3d362af202938e22(1, class);
    struct.var_7e3e3c6aebc4618f = function_3d362af202938e22(2, class);
    struct.loadoutrigtrait = cac_getloadoutarchetypeperk();
    if (issharedfuncdefined("instanceInventory", "updateDefaultClassStruct")) {
        [[ getsharedfunc("instanceInventory", "updateDefaultClassStruct") ]](self, struct);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7951
// Size: 0x1c7
function loadout_updateclassdefault_weapons(struct, classindex) {
    struct.loadoutprimary = table_getweapon(level.classtablename, classindex, 0);
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        struct.loadoutprimaryattachments[attachmentindex] = table_getweaponattachment(level.classtablename, classindex, 0, attachmentindex);
    }
    struct.loadoutprimarycamo = table_getweaponcamo(level.classtablename, classindex, 0);
    struct.loadoutprimaryreticle = table_getweaponreticle(level.classtablename, classindex, 0);
    struct.loadoutsecondary = table_getweapon(level.classtablename, classindex, 1);
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        struct.loadoutsecondaryattachments[attachmentindex] = table_getweaponattachment(level.classtablename, classindex, 1, attachmentindex);
    }
    struct.loadoutsecondarycamo = table_getweaponcamo(level.classtablename, classindex, 1);
    struct.loadoutsecondaryreticle = table_getweaponreticle(level.classtablename, classindex, 1);
    if (istrue(level.var_9e090a159cb48220)) {
        struct.loadouttertiary = table_getweapon(level.classtablename, classindex, 2);
        for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
            struct.var_494870a5978b5a09[attachmentindex] = table_getweaponattachment(level.classtablename, classindex, 2, attachmentindex);
        }
        struct.loadouttertiarycamo = table_getweaponcamo(level.classtablename, classindex, 2);
        struct.loadouttertiaryreticle = table_getweaponreticle(level.classtablename, classindex, 2);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b1f
// Size: 0x318
function loadout_updateclassdefault_weaponsheadless(struct) {
    if (!isdefined(self.headlessloadoutindexprimary)) {
        if (!isdefined(level.headlessloadoutindexprimary)) {
            offset = randomint(200);
            level.headlessloadoutindexprimary = offset;
            level.headlessloadoutindexsecondary = offset;
        } else {
            level.headlessloadoutindexprimary++;
            level.headlessloadoutindexsecondary++;
        }
        self.headlessloadoutindexprimary = level.headlessloadoutindexprimary;
        self.headlessloadoutindexsecondary = level.headlessloadoutindexsecondary;
    }
    var_686861dafaeb67ba = loadout_updateclassdefault_headlessgetweaponn(self.headlessloadoutindexprimary, 1);
    var_e6107d9d2a8cf0fd = var_686861dafaeb67ba[0];
    var_ec53cce80ba56e52 = var_686861dafaeb67ba[1];
    struct.loadoutprimary = var_e6107d9d2a8cf0fd;
    foreach (attachment, id in var_ec53cce80ba56e52.attachcustomtoidmap) {
        struct.loadoutprimaryattachments[struct.loadoutprimaryattachments.size] = attachment;
        struct.loadoutprimaryattachmentids[struct.loadoutprimaryattachmentids.size] = id;
    }
    struct.loadoutprimaryvariantid = var_ec53cce80ba56e52.variantid;
    var_3b584d0e4acc08fa = loadout_updateclassdefault_headlessgetweaponn(self.headlessloadoutindexsecondary, 0);
    var_4f5fadac618f5add = var_3b584d0e4acc08fa[0];
    var_396b20660f5aba3e = var_3b584d0e4acc08fa[1];
    struct.loadoutsecondary = var_4f5fadac618f5add;
    foreach (attachment, id in var_396b20660f5aba3e.attachcustomtoidmap) {
        struct.loadoutsecondaryattachments[struct.loadoutsecondaryattachments.size] = attachment;
        struct.loadoutsecondaryattachmentids[struct.loadoutsecondaryattachmentids.size] = id;
    }
    struct.loadoutsecondaryvariantid = var_396b20660f5aba3e.variantid;
    if (istrue(level.var_9e090a159cb48220)) {
        var_b11f66fe609e2564 = loadout_updateclassdefault_headlessgetweaponn(self.var_49f7f5b78e79b56c, 0);
        var_cbf04d21c906f2af = var_b11f66fe609e2564[0];
        var_886ab8d288b46b2e = var_b11f66fe609e2564[1];
        struct.loadouttertiary = var_cbf04d21c906f2af;
        foreach (attachment, id in var_886ab8d288b46b2e.attachcustomtoidmap) {
            struct.var_494870a5978b5a09[struct.var_494870a5978b5a09.size] = attachment;
            struct.var_6bfdc660c23f71ea[struct.var_6bfdc660c23f71ea.size] = id;
        }
        struct.loadouttertiaryvariantid = var_886ab8d288b46b2e.variantid;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e3e
// Size: 0xf2
function loadout_updateclassdefault_headlessgetweaponn(index, var_b61841814cc99f42) {
    var_b590dd50c4fe1f77 = 0;
    var_f56e5c9fa79ac6b6 = -1;
    while (1) {
        foreach (key, struct in level.weaponlootmapdata) {
            if (struct.variantid == 0 || struct.islocked || !isdefined(struct.attachcustomtoidmap)) {
                continue;
            }
            root = strtok(key, "|")[0];
            if (var_b61841814cc99f42 != iscacprimaryweapon(root)) {
                continue;
            }
            var_f56e5c9fa79ac6b6++;
            if (var_f56e5c9fa79ac6b6 == index) {
                return [0:root, 1:struct];
            }
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f37
// Size: 0x4f
function loadout_updatestreaktype(struct) {
    if (istrue(struct.loadoutusingspecialist)) {
        self.streaktype = "streaktype_specialist";
    } else {
        self.streaktype = "streaktype_assault";
    }
    struct.loadoutstreaktype = self.streaktype;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f8d
// Size: 0x880
function loadout_updateabilities(struct, class) {
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7() && getdvarint(@"hash_48587f2cfa448879", 1) == 1) {
        return;
    }
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("loadoutPerks"))) {
        self.pers["loadoutPerks"] = [];
    }
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("loadoutStandardPerks"))) {
        self.pers["loadoutStandardPerks"] = [];
    }
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("loadoutExtraPerks"))) {
        self.pers["loadoutExtraPerks"] = [];
    }
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("loadoutRigTrait"))) {
        self.pers["loadoutRigTrait"] = [];
    }
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("loadoutUsingSpecialist"))) {
        self.pers["loadoutUsingSpecialist"] = 0;
    }
    var_8cdaa5e3e1ccbe02 = getsubstr(class, 0, 7) == "default";
    if (istrue(struct.loadoutperksfromgamemode) || istrue(struct.var_de7fe0f200a1deff)) {
        loadoutperks = struct.loadoutperks;
        struct.loadoutperks = [];
        foreach (perk in loadoutperks) {
            if (!isdefined(perk) || perk == "specialty_null") {
                continue;
            }
            slot = namespace_b6a8027f477010e1::getperkslot(perk);
            if (!isdefined(slot)) {
                continue;
            }
            if (level.var_f3a9bf9e4404820f) {
                switch (slot) {
                case 2:
                    struct.var_15f3e6df722fb1cf = perk;
                    break;
                case 3:
                    struct.var_15f3e5df722faf9c = perk;
                    break;
                default:
                    struct.loadoutperks[struct.loadoutperks.size] = perk;
                    struct.loadoutstandardperks[struct.loadoutstandardperks.size] = perk;
                    break;
                }
            } else {
                struct.loadoutperks[struct.loadoutperks.size] = perk;
                struct.loadoutstandardperks[struct.loadoutstandardperks.size] = perk;
            }
        }
        if (istrue(struct.loadoutextraperksfromgamemode) || istrue(struct.var_b5c2d62f9d1dae7b)) {
            struct.loadoutextraperks = struct.loadoutextraperks;
        }
    } else if (!perksenabled()) {
        return;
    } else {
        if (class == "juggernaut" || class == "copied" || class == "superpower") {
            goto LOC_00000805;
        }
        classteam = loadout_getclassteam(class);
        perkpackage = [];
        if (level.var_606eb45e074ff204) {
            if (classteam != "none") {
                goto LOC_000003c8;
            }
            if (var_8cdaa5e3e1ccbe02) {
                classindex = getclassindex(class);
                var_7ca920f6d0b36b7e = function_f9c715f78b428034(level.classtablename, classindex);
                if (isdefined(var_7ca920f6d0b36b7e)) {
                    perkpackage = var_7ca920f6d0b36b7e;
                }
            } else {
                var_27cb4aafca7d6e65 = function_3c33d2d97119a585(self.class_num);
                perkpackage = function_12b59a6e11ff097f(var_27cb4aafca7d6e65);
            LOC_000003c8:
            }
        LOC_000003c8:
        }
    LOC_000003c8:
        /#
            if (perkpackage.size > 0) {
                foreach (perk in perkpackage) {
                    if (perk != "commonOption") {
                        var_e8826231d6ac089d = 1;
                        break;
                    }
                }
                /#
                    assertex(var_e8826231d6ac089d, "killstreak");
                #/
            }
        #/
        var_a220faf2607a348f = function_ea4c5dc15c3bbdd9();
        if (var_a220faf2607a348f) {
            for (perkindex = 0; perkindex < 5; perkindex++) {
                perk = "specialty_null";
                if (classteam != "none") {
                    classindex = getclassindex(class);
                    perk = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "loadoutPerks");
                } else if (var_8cdaa5e3e1ccbe02) {
                    classindex = getclassindex(class);
                    perk = function_f8e92e6cd8007d6b(level.classtablename, classindex, perkindex);
                } else {
                    perk = function_e329ffc7ff0dcf96(self.class_num, perkindex);
                }
                if (isdefined(perk) && perk != "specialty_null") {
                    struct.loadoutperks[struct.loadoutperks.size] = perk;
                    struct.loadoutstandardperks[struct.loadoutstandardperks.size] = perk;
                }
            }
        } else {
            var_c0725ee5a4ed7a7a = int(max(3, perkpackage.size));
            if (level.var_f3a9bf9e4404820f) {
                var_c0725ee5a4ed7a7a = 3;
            }
            for (perkindex = 0; perkindex < var_c0725ee5a4ed7a7a; perkindex++) {
                perk = "specialty_null";
                if (level.var_606eb45e074ff204) {
                    perk = perkpackage[perkindex];
                } else if (classteam != "none") {
                    classindex = getclassindex(class);
                    perk = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "loadoutPerks");
                } else if (var_8cdaa5e3e1ccbe02) {
                    classindex = getclassindex(class);
                    perk = table_getperk(level.classtablename, classindex, perkindex);
                } else {
                    perk = cac_getloadoutperk(self.class_num, perkindex);
                }
                if (isdefined(perk) && perk != "specialty_null") {
                    if (level.var_f3a9bf9e4404820f) {
                        if (3 < perkindex) {
                            struct.var_15f3e6df722fb1cf = perk;
                        } else {
                            struct.loadoutperks[struct.loadoutperks.size] = perk;
                            struct.loadoutstandardperks[struct.loadoutstandardperks.size] = perk;
                        }
                    } else {
                        struct.loadoutperks[struct.loadoutperks.size] = perk;
                        struct.loadoutstandardperks[struct.loadoutstandardperks.size] = perk;
                    }
                }
            }
            for (perkindex = 0; perkindex < 3; perkindex++) {
                perk = "specialty_null";
                if (classteam != "none") {
                    classindex = getclassindex(class);
                    perk = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "extraPerks");
                } else if (var_8cdaa5e3e1ccbe02) {
                    classindex = getclassindex(class);
                    perk = table_getextraperk(level.classtablename, classindex, perkindex);
                } else {
                    perk = cac_getloadoutextraperk(self.class_num, perkindex);
                }
                if (isdefined(perk) && perk != "specialty_null") {
                    if (level.var_f3a9bf9e4404820f) {
                        if (perkindex == 0) {
                            struct.var_15f3e5df722faf9c = perkpackage[3];
                        }
                        struct.loadoutextraperks[struct.loadoutextraperks.size] = perk;
                        if (perk == "specialty_third_person") {
                            struct.loadoutperks[struct.loadoutperks.size] = perk;
                        }
                    } else {
                        struct.loadoutextraperks[struct.loadoutextraperks.size] = perk;
                        struct.var_15f3e5df722faf9c = perk;
                    }
                }
            }
        }
        perk = "specialty_null";
        if (classteam != "none") {
            classindex = getclassindex(class);
            perk = getmatchrulesdatawithteamandindex("defaultClasses", classteam, classindex, "class", "archetypePerk");
        } else {
            perk = cac_getloadoutarchetypeperk();
        }
        if (isdefined(perk) && perk != "specialty_null") {
            struct.loadoutperks[struct.loadoutperks.size] = perk;
            self.pers["loadoutRigTrait"] = perk;
            struct.loadoutrigtrait = perk;
        LOC_00000805:
        }
    LOC_00000805:
    }
LOC_00000805:
    /#
        /#
            assert(isdefined(level.var_a1ad2758fcbd2f5e));
        #/
        foreach (perk in struct.loadoutperks) {
            /#
                assertex(isdefined(level.var_a1ad2758fcbd2f5e[perk]) && isdefined(level.var_d5f3dcf05b7e8be6[perk]), "iw8_pi_cpapa" + perk);
            #/
        }
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8814
// Size: 0xc3
function loadout_getclasstype(classname) {
    classteam = loadout_getclassteam(classname);
    if (classteam == "none" && !isdefined(classname)) {
        return "custom";
    }
    if (classteam != "none") {
        return "team";
    } else if (issubstr(classname, "custom")) {
        return "custom";
    } else if (classname == "gamemode") {
        return "gamemode";
    } else if (classname == "callback") {
        return "callback";
    } else if (classname == "juggernaut") {
        return "juggernaut";
    } else if (classname == "superpower") {
        return "superpower";
    } else if (classname == "copied") {
        return "copied";
    } else {
        return "default";
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88de
// Size: 0x49
function function_72aa88e22948f6c5() {
    if (istrue(level.var_ec2fb549b15ad827)) {
        if (level.var_bbcb5f6b1b0a78ae == 1 && getdvarint(@"hash_ca2769e986904fa", 0) == 1 || level.var_bbcb5f6b1b0a78ae != 1) {
            return 1;
        }
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x892f
// Size: 0x93
function loadout_updateglobalclass(globalstruct, class) {
    var_fd84df04adead383 = loadout_getclasstype(class);
    switch (var_fd84df04adead383) {
    case #"hash_33857c6e26098e6c":
        break;
    case #"hash_44e999799ff10fce":
        break;
    case #"hash_412d4adaf2412dc0":
        loadout_updateglobalclassgamemode(globalstruct, class);
        break;
    case #"hash_43e76e9ca2c4666":
        break;
    case #"hash_7038dec66d8275be":
        break;
    case #"hash_4ad475e6e15635bd":
        break;
    }
    return globalstruct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89ca
// Size: 0x23
function function_7ef7699b039b00e3() {
    if (isdefined(level.var_127cc78420f659f8)) {
        return [[ level.var_127cc78420f659f8 ]]();
    }
    return !namespace_36f464722d326bbe::isbrstylegametype();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89f5
// Size: 0x21c
function loadout_updateclass(struct, class) {
    if (!isagent(self) && self isplayerheadless() && function_7ef7699b039b00e3()) {
        class = "default" + randomint(5) + 1;
    }
    if (!(istrue(level.var_ec2fb549b15ad827) || istrue(level.var_77907d733abe8b63))) {
        if (function_de324c78ecdc7acd(self) && (getsubgametype() == "dmz" || getsubgametype() == "ob")) {
            var_a300fa75277719ee = function_df2933f96d726d71(level.classtablename);
            loadoutindex = randomint(var_a300fa75277719ee);
            class = "default" + loadoutindex + 1;
        }
    }
    var_fd84df04adead383 = loadout_getclasstype(class);
    var_6b02e0d0b48f639a = function_72aa88e22948f6c5();
    switch (var_fd84df04adead383) {
    case #"hash_33857c6e26098e6c":
        loadout_updateclassteam(struct, class);
        break;
    case #"hash_44e999799ff10fce":
        loadout_updateclasscustom(struct, class, var_6b02e0d0b48f639a);
        break;
    case #"hash_412d4adaf2412dc0":
        loadout_updateclassgamemode(struct, class);
        break;
    case #"hash_43e76e9ca2c4666":
        loadout_updateclasscallback(struct);
        break;
    case #"hash_7038dec66d8275be":
        loadout_updateclassdefault(struct, class);
        break;
    case #"hash_4ad475e6e15635bd":
        break;
    case #"hash_80a9479df6c38d3d":
        break;
    case #"hash_bd4afc9a088efe45":
        break;
    }
    if (!istrue(game["isLaunchChunk"])) {
        self.pers["defaultOperatorSkinIndex"] = namespace_6d8da2b47f878104::pickdefaultoperatorskin(struct.loadoutprimary);
    }
    loadout_updatehasnvg(struct);
    loadout_updateclassfistweapons(struct);
    function_2dad855d27735128(struct);
    function_fb9c11aeb7909511(struct);
    loadout_updatestreaktype(struct);
    loadout_updateabilities(struct, class);
    struct = loadout_validateclass(struct, class);
    loadout_updateclassfinalweapons(struct);
    if (isdefined(level.modeupdateloadoutclass)) {
        self [[ level.modeupdateloadoutclass ]](struct);
    }
    return struct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c19
// Size: 0x366
function function_1d52554d28b51cbc(struct, classindex, table) {
    struct.loadoutarchetype = "archetype_assault";
    struct.loadoutprimary = function_c7a0b640c398497(table, classindex).primaryweapon.weapon;
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxprimaryattachments(); attachmentindex++) {
        struct.loadoutprimaryattachments[attachmentindex] = table_getweaponattachment(table, classindex, 0, attachmentindex);
    }
    struct.loadoutprimarycamo = function_c7a0b640c398497(table, classindex).primaryweapon.camo;
    struct.loadoutprimaryreticle = function_c7a0b640c398497(table, classindex).primaryweapon.reticle;
    struct.loadoutsecondary = function_c7a0b640c398497(table, classindex).secondaryweapon.weapon;
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxsecondaryattachments(); attachmentindex++) {
        struct.loadoutsecondaryattachment[attachmentindex] = table_getweaponattachment(table, classindex, 1, attachmentindex);
    }
    struct.loadoutsecondarycamo = function_c7a0b640c398497(table, classindex).secondaryweapon.camo;
    struct.loadoutsecondaryreticle = function_c7a0b640c398497(table, classindex).secondaryweapon.reticle;
    struct.loadoutmeleeslot = "none";
    struct.loadoutequipmentprimary = function_c7a0b640c398497(table, classindex).equipment.primary;
    struct.loadoutequipmentsecondary = function_c7a0b640c398497(table, classindex).equipment.secondary;
    struct.loadoutstreaktype = "assault";
    struct.loadoutkillstreak1 = "none";
    struct.loadoutkillstreak2 = "none";
    struct.loadoutkillstreak3 = "none";
    struct.var_70f190143fb74941 = 0;
    struct.var_2b902dfc607c8860 = 0;
    struct.var_7e3e3c6aebc4618f = 0;
    struct.loadoutfieldupgrade1 = "super_br_extract";
    struct.loadoutfieldupgrade2 = "none";
    struct.var_4c4f03fa00925daf = 0;
    struct.var_2907f1614fe4e5f2 = 0;
    struct.loadoutperks = [0:function_c7a0b640c398497(table, classindex).perks.perk1, 1:function_c7a0b640c398497(table, classindex).perks.perk2, 2:function_c7a0b640c398497(table, classindex).perks.perk3, 3:function_c7a0b640c398497(table, classindex).extraperks.perk1, 4:function_c7a0b640c398497(table, classindex).extraperks.perk2, 5:function_c7a0b640c398497(table, classindex).extraperks.perk3];
    struct.loadoutgesture = "playerData";
    return struct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f87
// Size: 0xe7
function loadout_updateclassfistweapons(struct) {
    if (struct.loadoutprimary == "none") {
        struct.loadoutprimary = "iw9_me_fists";
    }
    if (function_b7d052e4bf41ee9b()) {
        if (struct.loadoutsecondary == "none") {
            struct.loadoutsecondary = "none";
        }
    } else if (struct.loadoutsecondary == "none" && struct.loadoutprimary != "iw9_me_fists" && !istrue(self.isjuggernaut)) {
        struct.loadoutsecondary = "iw9_me_fists";
    } else if (struct.loadoutprimary == "iw9_me_fists" && struct.loadoutsecondary == "iw9_me_fists") {
        struct.loadoutsecondary = "none";
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9075
// Size: 0x9e
function function_2dad855d27735128(struct) {
    if (struct.loadoutswimweapon == "none") {
        if (getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "mini" || getsubgametype() == "plunder" || getsubgametype() == "br" || namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            struct.loadoutswimweapon = "iw9_swimfists_mp";
        } else {
            struct.loadoutswimweapon = "iw9_me_diveknife_mp";
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x911a
// Size: 0x31
function function_fb9c11aeb7909511(struct) {
    if (struct.var_887f342b4c851024 == "none") {
        struct.var_887f342b4c851024 = "iw9_me_climbfists";
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9152
// Size: 0x23
function loadout_updatehasnvg(struct) {
    if (namespace_36f464722d326bbe::function_d2d2b803a7b741a4()) {
        struct.loadouthasnvg = 1;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x917c
// Size: 0xf8
function loadout_validateclass(struct, class) {
    var_c9a3e851ee6c762a = getgametype() == "gold_gun" && getdvarint(@"hash_131708578e1fbe81", 1);
    var_c06f071f7e2f617e = isdefined(level.var_62f6f7640e4431e3.namekey) && (level.var_62f6f7640e4431e3.namekey == "br_ranked" || level.var_62f6f7640e4431e3.namekey == "resranked");
    var_27cecb4114a00360 = (var_c9a3e851ee6c762a || var_c06f071f7e2f617e || isanymlgmatch()) && issubstr(class, "default");
    if (issubstr(class, "custom") || var_27cecb4114a00360) {
        if (isdefined(level.var_8b5c3bda53460402)) {
            return [[ level.var_8b5c3bda53460402 ]](struct);
        }
        return namespace_6502912624889105::validateloadout(struct);
    }
    return struct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x927c
// Size: 0xed
function loadout_forcearchetype(struct) {
    var_c69b13a67fe9879f = getdvarint(@"hash_d45a3508858994dc", 0);
    if (var_c69b13a67fe9879f > 0) {
        idx = getdvarint(@"hash_d45a3508858994dc", 0);
        switch (idx) {
        case 1:
            struct.loadoutarchetype = "archetype_assault";
            break;
        default:
            /#
                assertmsg("forceArchetype test dvar set to invalid index. Forcing assault.");
            #/
            struct.loadoutarchetype = "archetype_assault";
            break;
        }
    } else if (var_c69b13a67fe9879f == -1) {
        archetypes = [0:"archetype_assault"];
        rand = randomint(archetypes.size);
        struct.loadoutarchetype = archetypes[rand];
        self iprintlnbold("Random Archetype: " + archetypes[rand]);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9370
// Size: 0x283
function loadout_updateplayerarchetype(struct) {
    /#
        loadout_forcearchetype(struct);
    #/
    if (!istrue(self.btestclient)) {
        if (!isdefined(level.aonrules) || level.aonrules == 0) {
            /#
                assertex(struct.loadoutarchetype != "none", "struct.loadoutArchetype should never be "none" in loadout_updatePlayerArchetype()");
            #/
        }
    }
    self.loadoutarchetype = struct.loadoutarchetype;
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    var_b6592bb80f5ee4f5 = 1;
    var_ad84adcb356cfce = 2;
    var_cb3e24e9928efa4f = 4;
    var_f9b7d099aa487fa8 = 8;
    var_9ce56ebbdec8a388 = 0;
    var_98a729282e6315ad = undefined;
    clothtype = undefined;
    var_f91d73bcc743d785 = 400;
    var_db92d9da17c77527 = 400;
    var_a8e6644fda18165a = 900;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        var_db92d9da17c77527 = 133.333;
        var_a8e6644fda18165a = 1800;
    }
    switch (self.loadoutarchetype) {
    case #"hash_98ff6f21872f18e0":
        var_9ce56ebbdec8a388 = var_b6592bb80f5ee4f5 | var_ad84adcb356cfce | var_cb3e24e9928efa4f;
        var_98a729282e6315ad = &namespace_c3864852d989b3e2::applyarchetype;
        clothtype = "vestlight";
        self.clothtype = clothtype;
        break;
    default:
        if (!istrue(self.btestclient)) {
            if (!isdefined(level.aonrules) || level.aonrules == 0) {
                /#
                    assertmsg("loadout_updatePlayerArchetype() not set up for loadoutArchetype: " + struct.loadoutarchetype);
                #/
            }
        }
        break;
    }
    /#
        setdevdvarifuninitialized(@"hash_ba3719a1ad298b5", 0);
    #/
    if (getdvarint(@"hash_ba3719a1ad298b5")) {
        self allowdoublejump(var_9ce56ebbdec8a388 & var_b6592bb80f5ee4f5);
        self allowwallrun(var_9ce56ebbdec8a388 & var_cb3e24e9928efa4f);
        self allowdodge(var_9ce56ebbdec8a388 & var_f9b7d099aa487fa8);
    } else {
        self allowdoublejump(0);
        self allowwallrun(0);
        self allowdodge(0);
    }
    self allowslide(var_9ce56ebbdec8a388 & var_ad84adcb356cfce);
    self allowlean(0);
    self energy_setmax(0, var_f91d73bcc743d785);
    self energy_setenergy(0, var_f91d73bcc743d785);
    self energy_setrestorerate(0, var_db92d9da17c77527);
    self energy_setresttimems(0, var_a8e6644fda18165a);
    self energy_setmax(1, 50);
    self energy_setenergy(1, 50);
    self energy_setrestorerate(1, 10);
    self energy_setresttimems(1, ter_op(isanymlgmatch(), 2500, 0));
    if (isdefined(var_98a729282e6315ad)) {
        self [[ var_98a729282e6315ad ]]();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95fa
// Size: 0x419
function loadout_updateclassfinalweapons(struct) {
    if (istrue(struct.loadoutprimaryaddblueprintattachments)) {
        struct.loadoutprimaryobject = buildweapon_blueprint(struct.loadoutprimary, struct.loadoutprimarycamo, struct.loadoutprimaryreticle, struct.loadoutprimaryvariantid, struct.loadoutprimarycosmeticattachment, struct.loadoutprimarystickers, istrue(struct.loadouthasnvg));
    } else {
        struct.loadoutprimaryobject = buildweapon(struct.loadoutprimary, struct.loadoutprimaryattachments, struct.loadoutprimarycamo, struct.loadoutprimaryreticle, struct.loadoutprimaryvariantid, struct.loadoutprimaryattachmentids, struct.loadoutprimarycosmeticattachment, struct.loadoutprimarystickers, istrue(struct.loadouthasnvg), struct.var_193bf3cfb8aeaf0f);
    }
    struct.loadoutprimaryfullname = getcompleteweaponname(struct.loadoutprimaryobject);
    if (struct.loadoutsecondary == "none") {
        struct.loadoutsecondaryfullname = "none";
        struct.loadoutsecondaryobject = undefined;
    } else {
        if (istrue(struct.loadoutsecondaryaddblueprintattachments)) {
            struct.loadoutsecondaryobject = buildweapon_blueprintwithcustomattachments(struct.loadoutsecondary, struct.loadoutsecondaryattachments, struct.loadoutsecondarycamo, struct.loadoutsecondaryreticle, struct.loadoutsecondaryvariantid, struct.loadoutsecondaryattachmentids, struct.loadoutsecondarycosmeticattachment, struct.loadoutsecondarystickers, istrue(struct.loadouthasnvg));
        } else {
            struct.loadoutsecondaryobject = buildweapon(struct.loadoutsecondary, struct.loadoutsecondaryattachments, struct.loadoutsecondarycamo, struct.loadoutsecondaryreticle, struct.loadoutsecondaryvariantid, struct.loadoutsecondaryattachmentids, struct.loadoutsecondarycosmeticattachment, struct.loadoutsecondarystickers, istrue(struct.loadouthasnvg), struct.var_ead3720e647f74a3);
        }
        struct.loadoutsecondaryfullname = getcompleteweaponname(struct.loadoutsecondaryobject);
    }
    if (istrue(level.var_9e090a159cb48220)) {
        if (!isdefined(struct.loadouttertiary) || struct.loadouttertiary == "none") {
            struct.var_e3f8e7ca9c87781f = "none";
            struct.var_cc881f2bd3565d22 = undefined;
        } else {
            if (istrue(struct.loadouttertiaryaddblueprintattachments)) {
                struct.var_cc881f2bd3565d22 = buildweapon_blueprintwithcustomattachments(struct.loadouttertiary, struct.var_494870a5978b5a09, struct.loadouttertiarycamo, struct.loadouttertiaryreticle, struct.loadouttertiaryvariantid, struct.var_6bfdc660c23f71ea, struct.var_372f30ef6d6882ab, struct.var_afb9de90c523d105, istrue(struct.loadouthasnvg));
            } else {
                struct.var_cc881f2bd3565d22 = buildweapon(struct.loadouttertiary, struct.var_494870a5978b5a09, struct.loadouttertiarycamo, struct.loadouttertiaryreticle, struct.loadouttertiaryvariantid, struct.var_6bfdc660c23f71ea, struct.var_372f30ef6d6882ab, struct.var_afb9de90c523d105, istrue(struct.loadouthasnvg), struct.var_b58a085466758039);
            }
            struct.var_e3f8e7ca9c87781f = getcompleteweaponname(struct.var_cc881f2bd3565d22);
        }
    }
    if (function_da27e3343b019fde()) {
        struct.var_91e10e152b08ec1d = buildweapon(struct.var_dd07587af7d0ec5e, [0:"backup_pistol"]);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a1a
// Size: 0x24d
function loadout_updateplayerweapons(struct, class, var_4d71ac90487ba0d7, skipfirstraise) {
    respawnitems = respawnitems_getrespawnitems();
    var_b86cf5cef6838543 = respawnitems_hasweapondata(respawnitems);
    var_10b09490bb78e90e = level.magcount;
    var_3920d61392aec9d5 = loadout_giveprimaryweapon(struct, respawnitems, var_b86cf5cef6838543);
    var_976a64288e459315 = undefined;
    var_f4aa3ed154783647 = !isdefined(respawnitems) || isdefined(respawnitems.weapons) && isdefined(respawnitems.weapons["secondary"]);
    if (var_f4aa3ed154783647) {
        var_976a64288e459315 = loadout_givesecondaryweapon(struct, respawnitems, var_b86cf5cef6838543);
    }
    namespace_6b49ddb858f34366::function_e90bd443e0a197dd(var_3920d61392aec9d5, var_976a64288e459315);
    var_166a71f33928f623 = undefined;
    if (istrue(level.var_9e090a159cb48220)) {
        var_9be1ec9738546b41 = !isdefined(respawnitems) || isdefined(respawnitems.weapons["tertiary"]);
        if (var_9be1ec9738546b41) {
            var_166a71f33928f623 = function_6927b3b638f60d97(struct, respawnitems, var_b86cf5cef6838543);
        }
    }
    if (function_da27e3343b019fde()) {
        function_4ffce833ce15363c(struct);
    }
    function_9743c56a4d2dc135(struct);
    function_a80b77a2abaa376e(struct);
    function_607536857fac2407(struct);
    loadout_updateammo(struct, var_3920d61392aec9d5, var_976a64288e459315, var_166a71f33928f623, respawnitems, var_b86cf5cef6838543, var_10b09490bb78e90e);
    self.loadoutmeleeslot = struct.loadoutmeleeslot;
    if (!isdefined(var_3920d61392aec9d5)) {
        if (isdefined(struct.loadoutprimary)) {
            logstring("IW9-688909: primaryGiveWeaponObj is undefined, weapon name is " + struct.loadoutprimary);
        } else {
            logstring("IW9-688909: primaryGiveWeaponObj is undefined, weapon name is also undefined");
        }
    }
    if (self hasweapon(var_3920d61392aec9d5)) {
        spawnweaponobj = var_3920d61392aec9d5;
    } else {
        spawnweaponobj = var_976a64288e459315;
    }
    if (isdefined(var_976a64288e459315) && var_976a64288e459315.basename != "none" && isdefined(var_3920d61392aec9d5) && var_3920d61392aec9d5.basename == "iw9_me_fists_mp") {
        spawnweaponobj = var_976a64288e459315;
    }
    if (!isai(self)) {
        _switchtoweapon(spawnweaponobj);
    }
    if (!isdefined(var_4d71ac90487ba0d7) || var_4d71ac90487ba0d7) {
        skipfirstraise = function_bae2a0b1db21cab9(spawnweaponobj, skipfirstraise);
        if (!isagent(self)) {
            self setspawnweapon(spawnweaponobj, !skipfirstraise);
        }
    }
    self.spawnweaponobj = spawnweaponobj;
    loadout_updateweapondependentsettings();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c6e
// Size: 0xbf
function loadout_finalizeweapons() {
    self notify("loadout_weapon_finalize");
    var_e5c5201a787eeb87 = 0;
    if (isdefined(self.primaryweaponobj) && !self hasweapon(self.primaryweaponobj)) {
        loadout_giveprimaryweapon(self.classstruct);
        var_e5c5201a787eeb87 = 1;
    }
    if (isdefined(self.secondaryweaponobj) && !self hasweapon(self.secondaryweaponobj)) {
        loadout_givesecondaryweapon(self.classstruct);
        var_e5c5201a787eeb87 = 1;
    }
    if (isdefined(self.var_36940c335e7cc50c) && !self hasweapon(self.var_36940c335e7cc50c)) {
        function_6927b3b638f60d97(self.classstruct);
        var_e5c5201a787eeb87 = 1;
    }
    if (var_e5c5201a787eeb87) {
        thread trackriotshield_monitorshieldattach();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d34
// Size: 0x119
function loadout_giveprimaryweapon(struct, respawnitems, var_b86cf5cef6838543) {
    self.loadoutprimary = struct.loadoutprimary;
    self.loadoutprimarycamo = struct.loadoutprimarycamo;
    self.loadoutprimaryattachments = struct.loadoutprimaryattachments;
    self.loadoutprimaryattachmentids = struct.loadoutprimaryattachmentids;
    self.loadoutprimaryreticle = struct.loadoutprimaryreticle;
    self.loadoutprimarylootitemid = struct.loadoutprimarylootitemid;
    self.loadoutprimaryvariantid = struct.loadoutprimaryvariantid;
    var_3920d61392aec9d5 = loadout_giveweaponobj("primary", struct.loadoutprimaryobject, respawnitems, var_b86cf5cef6838543);
    self.primaryweapon = struct.loadoutprimaryfullname;
    self.primaryweaponobj = struct.loadoutprimaryobject;
    namespace_6b49ddb858f34366::function_adcb155953291ec7(1, 0);
    self.pers["primaryWeapon"] = struct.loadoutprimaryfullname;
    return var_3920d61392aec9d5;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e55
// Size: 0x118
function loadout_givesecondaryweapon(struct, respawnitems, var_b86cf5cef6838543) {
    self.loadoutsecondary = struct.loadoutsecondary;
    self.loadoutsecondarycamo = struct.loadoutsecondarycamo;
    self.loadoutsecondaryattachments = struct.loadoutsecondaryattachments;
    self.loadoutsecondaryattachmentids = struct.loadoutsecondaryattachmentids;
    self.loadoutsecondaryreticle = struct.loadoutsecondaryreticle;
    self.loadoutsecondarylootitemid = struct.loadoutsecondarylootitemid;
    self.loadoutsecondaryvariantid = struct.loadoutsecondaryvariantid;
    var_976a64288e459315 = loadout_giveweaponobj("secondary", struct.loadoutsecondaryobject, respawnitems, var_b86cf5cef6838543);
    self.secondaryweapon = struct.loadoutsecondaryfullname;
    self.secondaryweaponobj = struct.loadoutsecondaryobject;
    namespace_6b49ddb858f34366::function_adcb155953291ec7(0, 0);
    self.pers["secondaryWeapon"] = struct.loadoutsecondaryfullname;
    return var_976a64288e459315;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f75
// Size: 0x136
function function_6927b3b638f60d97(struct, respawnitems, var_b86cf5cef6838543) {
    self.loadouttertiary = struct.loadouttertiary;
    self.loadouttertiarycamo = struct.loadouttertiarycamo;
    self.var_494870a5978b5a09 = struct.var_494870a5978b5a09;
    self.var_6bfdc660c23f71ea = struct.var_6bfdc660c23f71ea;
    self.loadouttertiaryreticle = struct.loadouttertiaryreticle;
    self.var_64e57707d385a2f5 = struct.var_64e57707d385a2f5;
    self.loadouttertiaryvariantid = struct.loadouttertiaryvariantid;
    var_166a71f33928f623 = loadout_giveweaponobj("tertiary", struct.var_cc881f2bd3565d22, respawnitems, var_b86cf5cef6838543);
    self.tertiaryweapon = struct.var_e3f8e7ca9c87781f;
    self.var_36940c335e7cc50c = struct.var_cc881f2bd3565d22;
    self.pers["tertiaryWeapon"] = struct.var_e3f8e7ca9c87781f;
    if (!isundefinedweapon(var_166a71f33928f623) && getdvarint(@"hash_547403d0bcc39f5") == 1) {
        self assignweaponmeleeslot(var_166a71f33928f623);
    }
    return var_166a71f33928f623;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0b3
// Size: 0x5b
function function_4ffce833ce15363c(struct) {
    if (istrue(struct.disablebackuppistol)) {
        return;
    }
    self giveweapon(struct.var_91e10e152b08ec1d, 0, 0, 0, 1, 1);
    thread function_c8d94b3795b095d4(struct.var_91e10e152b08ec1d);
    thread function_1ca935941daaf046(struct.var_91e10e152b08ec1d);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa115
// Size: 0xab
function loadout_giveweaponobj(weaponslot, weaponobj, respawnitems, var_b86cf5cef6838543) {
    var_6199e5b093c84749 = undefined;
    if (!istrue(var_b86cf5cef6838543)) {
        var_6199e5b093c84749 = weaponobj;
    } else {
        var_6199e5b093c84749 = respawnitems_getweaponobj(respawnitems, weaponslot);
    }
    if (!isundefinedweapon(var_6199e5b093c84749)) {
        if (function_38642db3c423bcdc(var_6199e5b093c84749) && !namespace_4b0406965e556711::gameflag("prematch_done") && namespace_4b0406965e556711::gameflag("infil_will_run")) {
            thread function_c6cd33220cce845a(weaponslot, weaponobj, respawnitems, var_b86cf5cef6838543);
        } else {
            var_6199e5b093c84749 = namespace_3bbb5a98b932c46f::updatesavedaltstate(var_6199e5b093c84749);
            _giveweapon(var_6199e5b093c84749, undefined, undefined, 1);
            namespace_3bbb5a98b932c46f::updatetogglescopestate(var_6199e5b093c84749);
            namespace_bc06084df083b232::loadoutweapongiven(var_6199e5b093c84749);
        }
    }
    return var_6199e5b093c84749;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1c8
// Size: 0xa2
function function_c6cd33220cce845a(weaponslot, weaponobj, respawnitems, var_b86cf5cef6838543) {
    self endon("death_or_disconnect");
    self endon("swapLoadout");
    self endon("giveLoadout_start");
    level waittill("prematch_over");
    var_6199e5b093c84749 = undefined;
    if (!istrue(var_b86cf5cef6838543)) {
        var_6199e5b093c84749 = weaponobj;
    } else {
        var_6199e5b093c84749 = respawnitems_getweaponobj(respawnitems, weaponslot);
    }
    if (!isundefinedweapon(var_6199e5b093c84749)) {
        var_6199e5b093c84749 = namespace_3bbb5a98b932c46f::updatesavedaltstate(var_6199e5b093c84749);
        _giveweapon(var_6199e5b093c84749, undefined, undefined, 1);
        namespace_3bbb5a98b932c46f::updatetogglescopestate(var_6199e5b093c84749);
        namespace_bc06084df083b232::loadoutweapongiven(var_6199e5b093c84749);
    }
    if (weaponslot == "primary") {
        _switchtoweapon(var_6199e5b093c84749);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa271
// Size: 0x58
function function_9743c56a4d2dc135(struct) {
    if (struct.loadoutswimweapon != "none") {
        var_6199e5b093c84749 = buildweapon(struct.loadoutswimweapon);
        self giveweapon(var_6199e5b093c84749);
    }
    self.var_350710ea016eac45 = struct.loadoutswimweapon;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2d0
// Size: 0x58
function function_a80b77a2abaa376e(struct) {
    if (struct.var_887f342b4c851024 != "none") {
        var_6199e5b093c84749 = buildweapon(struct.var_887f342b4c851024);
        self giveweapon(var_6199e5b093c84749);
    }
    self.var_f1ddb2e2f886e31e = struct.var_887f342b4c851024;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa32f
// Size: 0x4c
function function_607536857fac2407(struct) {
    if (struct.loadoutmeleeslot != "none") {
        var_6199e5b093c84749 = buildweapon(struct.loadoutmeleeslot);
        self giveweapon(var_6199e5b093c84749);
        self assignweaponmeleeslot(var_6199e5b093c84749);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa382
// Size: 0x348
function loadout_updateammo(struct, var_3920d61392aec9d5, var_976a64288e459315, var_166a71f33928f623, respawnitems, var_b86cf5cef6838543, var_10b09490bb78e90e) {
    var_ff9807daeec4751c = [];
    var_94d101fa8c9c2da4 = 0;
    if (isdefined(struct.loadoutprimaryobject) && struct.loadoutprimaryobject.basename != "none") {
        var_ff9807daeec4751c[var_ff9807daeec4751c.size] = struct.loadoutprimaryobject;
    }
    if (isdefined(struct.loadoutsecondaryobject) && struct.loadoutsecondaryobject.basename != "none") {
        var_ff9807daeec4751c[var_ff9807daeec4751c.size] = struct.loadoutsecondaryobject;
    }
    if (isdefined(struct.var_cc881f2bd3565d22) && struct.var_cc881f2bd3565d22.basename != "none") {
        var_ff9807daeec4751c[var_ff9807daeec4751c.size] = struct.var_cc881f2bd3565d22;
    }
    if (function_da27e3343b019fde() && isdefined(struct.var_91e10e152b08ec1d) && struct.var_91e10e152b08ec1d.basename != "none") {
        var_ff9807daeec4751c[var_ff9807daeec4751c.size] = struct.var_91e10e152b08ec1d;
    }
    if (isdefined(level.modeloadoutupdateammo)) {
        self [[ level.modeloadoutupdateammo ]](var_ff9807daeec4751c);
    } else if (istrue(var_b86cf5cef6838543)) {
        respawnitems_giveweaponammo(respawnitems, "primary");
        respawnitems_giveweaponammo(respawnitems, "secondary");
        respawnitems_giveweaponammo(respawnitems, "tertiary");
    } else if (var_10b09490bb78e90e != 3) {
        if (isdefined(var_3920d61392aec9d5)) {
            spawnammocountoverride_giveweaponammo(var_3920d61392aec9d5, "primary", var_10b09490bb78e90e);
        }
        if (isdefined(var_976a64288e459315)) {
            spawnammocountoverride_giveweaponammo(var_976a64288e459315, "secondary", var_10b09490bb78e90e);
        }
        if (isdefined(var_166a71f33928f623)) {
            spawnammocountoverride_giveweaponammo(var_166a71f33928f623, "tertiary", var_10b09490bb78e90e);
        }
    } else {
        foreach (weapon in var_ff9807daeec4751c) {
            if (function_f30a6d3194f97c09(weapon, "specialty_extraclip")) {
                var_23887d8d62685e16 = self getweaponammoclip(weapon);
                if (var_23887d8d62685e16 < 6) {
                    var_23887d8d62685e16 = 6;
                }
                var_dd2decf8db7e69b8 = self getweaponammostock(weapon);
                self setweaponammostock(weapon, var_dd2decf8db7e69b8 + var_23887d8d62685e16);
            }
        }
    }
    if (!istrue(var_b86cf5cef6838543) && var_10b09490bb78e90e == 3) {
        foreach (weapon in var_ff9807daeec4751c) {
            if (istrue(weapon.hasalternate)) {
                var_6890a4ce965bba99 = weapon getaltweapon();
                var_91093ef03654702c = weaponclass(var_6890a4ce965bba99);
                if (var_91093ef03654702c == "grenade") {
                    self setweaponammostock(var_6890a4ce965bba99, 1);
                }
            } else if (isakimbo(weapon)) {
                self setweaponammostock(weapon, self getweaponammostock(weapon) + weaponclipsize(weapon) * 3);
            }
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6d1
// Size: 0xa
function loadout_updateweapondependentsettings() {
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa6e2
// Size: 0x185
function function_f94ec5ad05cc1001(classindex, isprimary) {
    class = namespace_e5ed2f5a5ee8410e::getclasschoice(classindex);
    struct = loadout_getclassstruct();
    var_6b02e0d0b48f639a = function_72aa88e22948f6c5();
    loadout_updateclasscustom(struct, class, var_6b02e0d0b48f639a);
    loadout_updatehasnvg(struct);
    struct = loadout_validateclass(struct, class);
    if (isprimary) {
        struct.loadoutprimaryobject = buildweapon(struct.loadoutprimary, struct.loadoutprimaryattachments, struct.loadoutprimarycamo, struct.loadoutprimaryreticle, struct.loadoutprimaryvariantid, struct.loadoutprimaryattachmentids, struct.loadoutprimarycosmeticattachment, struct.loadoutprimarystickers, istrue(struct.loadouthasnvg), struct.var_193bf3cfb8aeaf0f);
        return struct.loadoutprimaryobject;
    } else {
        struct.loadoutsecondaryobject = buildweapon(struct.loadoutsecondary, struct.loadoutsecondaryattachments, struct.loadoutsecondarycamo, struct.loadoutsecondaryreticle, struct.loadoutsecondaryvariantid, struct.loadoutsecondaryattachmentids, struct.loadoutsecondarycosmeticattachment, struct.loadoutsecondarystickers, istrue(struct.loadouthasnvg), struct.var_ead3720e647f74a3);
        return struct.loadoutsecondaryobject;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa86e
// Size: 0xdd
function function_87c3b562f2b366ee(player) {
    perks = [0:"specialty_selectivehearing", 1:"specialty_pistoldraw", 2:"specialty_location_marking"];
    if (namespace_cd0b2d039510b38d::islaststandenabled()) {
        perks[perks.size] = "specialty_pistoldeath";
    }
    if (namespace_36f464722d326bbe::isnightmap() && namespace_36f464722d326bbe::function_d2d2b803a7b741a4()) {
        if (getdvarint(@"hash_58735393383459d4", 1) == 1) {
            perks[perks.size] = "specialty_spygame";
        }
    }
    if (istrue(player.var_8bc1ddad56ab00bf)) {
        perks[perks.size] = "specialty_strategist";
    }
    if (istrue(level.var_7f3aafcf56c9ce14) && isdefined(player.var_4045f099f3da4bd)) {
        perks[perks.size] = namespace_cb965d2f71fefddc::function_77702c2321292aa3(player.var_4045f099f3da4bd);
    }
    if (istrue(level.var_1bc9ccb3f47cf947)) {
        perks[perks.size] = "specialty_br_movement_mod";
    }
    return perks;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa953
// Size: 0x527
function loadout_updateplayerperks(struct, class) {
    loadoutperks = struct.loadoutperks;
    var_15f3e6df722fb1cf = struct.var_15f3e6df722fb1cf;
    var_15f3e5df722faf9c = struct.var_15f3e5df722faf9c;
    loadoutstandardperks = namespace_3c5a4254f2b957ea::getpersstat("loadoutStandardPerks");
    loadoutextraperks = namespace_3c5a4254f2b957ea::getpersstat("loadoutExtraPerks");
    loadoutrigtrait = namespace_3c5a4254f2b957ea::getpersstat("loadoutRigTrait");
    loadoutusingspecialist = namespace_3c5a4254f2b957ea::getpersstat("loadoutUsingSpecialist");
    perkpackageprogress = namespace_3c5a4254f2b957ea::getpersstat("perkPackageProgress");
    perkpackagetier2earned = namespace_3c5a4254f2b957ea::getpersstat("perkPackageTier2Earned");
    perkpackagetier3state = namespace_3c5a4254f2b957ea::getpersstat("perkPackageTier3State");
    respawnitems = respawnitems_getrespawnitems();
    if (function_b19856925ddabd5a(respawnitems)) {
        loadoutperks = function_40a3148d5514ffa3(respawnitems);
        var_15f3e6df722fb1cf = function_dc2f8c385699a6e8(respawnitems);
        var_15f3e5df722faf9c = function_dc2f8d385699a91b(respawnitems);
        loadoutstandardperks = function_64d9f4542fdd7b14(respawnitems);
        loadoutextraperks = function_dc35cb143c497599(respawnitems);
        loadoutrigtrait = function_7f47875b5fd88f24(respawnitems);
        loadoutusingspecialist = function_eba2981fa45ae3bf(respawnitems);
        perkpackageprogress = function_33e44385e17eecc1(respawnitems);
        perkpackagetier2earned = function_7af26fc564e26a5f(respawnitems);
        perkpackagetier3state = function_7d2ba1e36afe24b0(respawnitems);
    } else {
        var_96e16459d5114277 = function_87c3b562f2b366ee(self);
        foreach (perk in var_96e16459d5114277) {
            loadout_giveperk(perk);
        }
    }
    if (!isdefined(class) || class != "juggernaut") {
        if (isdefined(loadoutperks) && loadoutperks.size > 0) {
            var_4699b9f7e9066068 = function_834af98b3970133b(struct);
            if (istrue(var_4699b9f7e9066068)) {
                namespace_b6a8027f477010e1::giveperks(struct.loadoutperks);
            } else {
                namespace_b6a8027f477010e1::giveperks(loadoutperks);
            }
            if (!istrue(level.var_606eb45e074ff204) && function_ea4c5dc15c3bbdd9()) {
                namespace_b6a8027f477010e1::giveperks(loadoutextraperks);
            } else {
                namespace_b6a8027f477010e1::function_4613ec15f87b7cf2(var_15f3e6df722fb1cf, var_15f3e5df722faf9c);
            }
            if (getdvarint(@"hash_9fdeab749d8f74a1", 0)) {
                if (!istrue(level.var_606eb45e074ff204) && function_ea4c5dc15c3bbdd9()) {
                    namespace_b6a8027f477010e1::giveperks(struct.loadoutextraperks);
                }
                self.shooting_mode = "1st";
                foreach (perk in loadoutperks) {
                    if (perk == "specialty_third_person") {
                        self.shooting_mode = "3rd";
                    }
                }
                self.pers["shootingMode"] = self.shooting_mode;
            }
        }
        if (istrue(level.var_606eb45e074ff204)) {
            if (istrue(perkpackagetier2earned) && isdefined(var_15f3e6df722fb1cf) && (!isdefined(loadoutperks) || !array_contains(loadoutperks, var_15f3e6df722fb1cf))) {
                namespace_82dcd1d5ae30ff7::giveperk(var_15f3e6df722fb1cf);
            }
            if (isdefined(perkpackagetier3state) && isdefined(var_15f3e5df722faf9c) && perkpackagetier3state >= 2 && (!isdefined(loadoutperks) || !array_contains(loadoutperks, var_15f3e5df722faf9c))) {
                namespace_82dcd1d5ae30ff7::giveperk(var_15f3e5df722faf9c);
            }
        }
        self.pers["loadoutPerks"] = loadoutperks;
        self.pers["loadoutStandardPerks"] = loadoutstandardperks;
        self.pers["loadoutExtraPerks"] = loadoutextraperks;
        self.pers["loadoutRigTrait"] = loadoutrigtrait;
        self.pers["loadoutUsingSpecialist"] = loadoutusingspecialist;
        if (isdefined(self.avoidkillstreakonspawntimer) && self.avoidkillstreakonspawntimer > 0) {
            thread namespace_b6a8027f477010e1::giveperksafterspawn();
        }
        if (!isagent(self) && namespace_296c793a004e81b3::getintproperty(@"hash_5cb1a62baf307905", 1) == 1 && game["state"] != "postgame") {
            perksarray = isdefined(loadoutperks) ? [] : loadoutperks;
            var_9e0a050f0398edc3 = isdefined(loadoutextraperks) ? [] : loadoutextraperks;
            if (istrue(level.var_606eb45e074ff204) || istrue(level.var_9a849908e60b857c)) {
                perksarray[perksarray.size] = var_15f3e6df722fb1cf;
                perksarray[perksarray.size] = var_15f3e5df722faf9c;
            }
            namespace_b6a8027f477010e1::function_7c8cc44b58093ce4(perksarray);
            namespace_b6a8027f477010e1::setomnvarsforperklist("ui_spawn_perk_", perksarray, var_9e0a050f0398edc3);
        }
    }
    if (getdvarint(@"hash_6a4d5cd30c97a609", 0)) {
        logstring("
 PERKS BUG LOGGING - After update, player has " + self.perks.size + " perks.");
        foreach (idx, perk in self.perks) {
            logstring("
" + idx);
        }
    }
    function_dc63eafe3f6318df();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae81
// Size: 0xfc
function function_834af98b3970133b(struct) {
    var_47533ef376cbeb37 = function_5d4e4fb280574542(struct);
    if (isdefined(var_47533ef376cbeb37)) {
        var_756aa31d4082215 = function_2ab1572c5a4fce7c(var_47533ef376cbeb37);
        if (!isdefined(var_756aa31d4082215)) {
            return 0;
        }
        if (!isarray(var_756aa31d4082215)) {
            var_756aa31d4082215 = [0:var_756aa31d4082215];
        }
        foreach (var_67e2df7332d2ed8d in var_756aa31d4082215) {
            foreach (perk in struct.loadoutperks) {
                if (perk == var_67e2df7332d2ed8d) {
                    return function_cd922f6a30d9f3e8(var_47533ef376cbeb37, var_67e2df7332d2ed8d, struct);
                }
            }
        }
        return 0;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf84
// Size: 0x119
function function_5d4e4fb280574542(struct) {
    var_ff08a8d642ef2d44 = [0:"specialty_infantry_vest", 1:"specialty_grenadier_vest", 2:"specialty_cct_vest", 3:"specialty_overkill_vest", 4:"specialty_tac_vest", 5:"specialty_gunner_vest", 6:"specialty_scout_vest", 7:"specialty_marksman_vest", 8:"specialty_ninja_vest"];
    foreach (perk in struct.loadoutperks) {
        if (array_contains(var_ff08a8d642ef2d44, perk)) {
            return perk;
        }
    }
    foreach (perk in struct.loadoutextraperks) {
        if (array_contains(var_ff08a8d642ef2d44, perk)) {
            return perk;
        }
    }
    return undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a5
// Size: 0xb0
function function_2ab1572c5a4fce7c(var_47533ef376cbeb37) {
    switch (var_47533ef376cbeb37) {
    case #"hash_568523fdd9886154":
        return "specialty_running_sneakers";
    case #"hash_2fbe6bc056549a68":
        return undefined;
    case #"hash_c1dfdb4041d59e89":
        return "specialty_intel_jacker";
    case #"hash_522bef19e9286b39":
        return [0:"specialty_custom_gloves", 1:"specialty_silicon_gloves"];
    case #"hash_82a9f5a3ce609b36":
        return "specialty_fast_reload";
    case #"hash_39fbb731f952e175":
        return "specialty_ghost_camo";
    case #"hash_24af5eb2e03b90bd":
        return "specialty_marksman_gloves";
    case #"hash_ceead0eadcdc2887":
        return "specialty_canvas_sneakers";
        break;
    }
    return undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb15d
// Size: 0x170
function function_cd922f6a30d9f3e8(var_47533ef376cbeb37, var_756aa31d4082215, struct) {
    var_652429904b5eb1c5 = undefined;
    switch (var_47533ef376cbeb37) {
    case #"hash_568523fdd9886154":
        var_652429904b5eb1c5 = "specialty_ultra_light_boots";
        break;
    case #"hash_c1dfdb4041d59e89":
        var_652429904b5eb1c5 = "specialty_hardline";
        break;
    case #"hash_522bef19e9286b39":
        var_652429904b5eb1c5 = "specialty_marksman_gloves";
        break;
    case #"hash_82a9f5a3ce609b36":
        var_652429904b5eb1c5 = "specialty_hardline";
        break;
    case #"hash_39fbb731f952e175":
        var_652429904b5eb1c5 = "specialty_covert_ops";
        break;
    case #"hash_24af5eb2e03b90bd":
        var_652429904b5eb1c5 = "specialty_custom_gloves";
        break;
    case #"hash_ceead0eadcdc2887":
        var_652429904b5eb1c5 = "specialty_running_sneakers";
        break;
    }
    if (var_47533ef376cbeb37 == "specialty_tac_vest" && (array_contains(struct.loadoutperks, "specialty_hardline") || array_contains(struct.loadoutextraperks, "specialty_hardline"))) {
        var_652429904b5eb1c5 = "specialty_tac_mask";
    }
    key = array_find(struct.loadoutperks, var_756aa31d4082215);
    if (isdefined(key)) {
        struct.loadoutperks[key] = var_652429904b5eb1c5;
        return 1;
    } else {
        key = array_find(struct.loadoutextraperks, var_756aa31d4082215);
        if (isdefined(key)) {
            struct.loadoutextraperks[key] = var_652429904b5eb1c5;
            return 1;
        }
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2d5
// Size: 0x1fa
function function_dc63eafe3f6318df() {
    if (!isdefined(level.var_41cf8d43ac1cd207)) {
        return;
    }
    var_329ba2d003b49f7 = [];
    foreach (perkname, perk in self.perks) {
        foreach (var_f7887a5764a7d38c in level.var_41cf8d43ac1cd207) {
            bundle = level.var_a1ad2758fcbd2f5e[perkname];
            if (!isdefined(bundle) || !isdefined(bundle.var_8bf15bcb91a06389)) {
                continue;
            }
            if (bundle.var_8bf15bcb91a06389 == var_f7887a5764a7d38c.var_11b93a30c2542078) {
                if (!isdefined(var_329ba2d003b49f7[var_f7887a5764a7d38c.var_11b93a30c2542078])) {
                    var_242ad3ba69a75390 = spawnstruct();
                    var_242ad3ba69a75390.var_f7887a5764a7d38c = var_f7887a5764a7d38c;
                    var_242ad3ba69a75390.var_a4e37b03b37efdfc = 1;
                    var_329ba2d003b49f7[var_f7887a5764a7d38c.var_11b93a30c2542078] = var_242ad3ba69a75390;
                } else if (!istrue(var_329ba2d003b49f7[var_f7887a5764a7d38c.var_11b93a30c2542078].var_c98c1a5eef30bada)) {
                    var_329ba2d003b49f7[var_f7887a5764a7d38c.var_11b93a30c2542078].var_a4e37b03b37efdfc++;
                    if (var_329ba2d003b49f7[var_f7887a5764a7d38c.var_11b93a30c2542078].var_a4e37b03b37efdfc == var_f7887a5764a7d38c.var_1a254f1dc28ba4ad) {
                        var_13db3ca1ad2db644 = level.var_f54c174ff247a969[var_f7887a5764a7d38c.bundle];
                        /#
                            assert(isdefined(var_13db3ca1ad2db644));
                        #/
                        if (isdefined(var_13db3ca1ad2db644)) {
                            loadout_giveperk(var_13db3ca1ad2db644);
                        }
                        var_329ba2d003b49f7[var_f7887a5764a7d38c.var_11b93a30c2542078].var_c98c1a5eef30bada = 1;
                    }
                }
            }
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4d6
// Size: 0x1e6
function loadout_updateplayerequipment(struct, class) {
    respawnitems = respawnitems_getrespawnitems();
    var_b86cf5cef6838543 = respawnitems_hasequipmentdata(respawnitems);
    self.loadoutequipmentprimary = struct.loadoutequipmentprimary;
    self.loadoutequipmentsecondary = struct.loadoutequipmentsecondary;
    var_e7d8e765ac9243a6 = undefined;
    if (!var_b86cf5cef6838543) {
        var_e7d8e765ac9243a6 = struct.loadoutequipmentprimary;
    } else {
        var_e7d8e765ac9243a6 = respawnitems_getequipmentref(respawnitems, "primary");
    }
    var_6dc747a4410e0395 = struct.var_b68e3a0a9c628d23;
    var_604669419e2560e6 = undefined;
    if (!var_b86cf5cef6838543) {
        var_604669419e2560e6 = struct.loadoutequipmentsecondary;
    } else {
        var_604669419e2560e6 = respawnitems_getequipmentref(respawnitems, "secondary");
    }
    var_203895659950911d = level.equipment.table[self.loadoutequipmentsecondary].weaponname;
    var_6e8f0546b97c1dd5 = struct.var_a1dfc5ce15795a3;
    namespace_1a507865f681850e::giveequipment(var_e7d8e765ac9243a6, "primary", class, var_6dc747a4410e0395);
    namespace_1a507865f681850e::giveequipment(var_604669419e2560e6, "secondary", class, var_6e8f0546b97c1dd5);
    if (_hasperk("specialty_extra_tactical")) {
        namespace_1a507865f681850e::incrementequipmentammo(var_604669419e2560e6);
    }
    var_fd84df04adead383 = loadout_getclasstype(class);
    var_1bc3bf54ae8e6ed7 = equipment::function_11a4d197e8db4f(var_fd84df04adead383);
    var_20327dd6b8d19acf = equipment::function_58ea099b568dbfaf(var_fd84df04adead383);
    if (var_1bc3bf54ae8e6ed7) {
        namespace_1a507865f681850e::incrementequipmentammo(var_e7d8e765ac9243a6, undefined, class);
    }
    if (var_20327dd6b8d19acf) {
        namespace_1a507865f681850e::incrementequipmentammo(var_604669419e2560e6, undefined, class);
    }
    if (var_b86cf5cef6838543) {
        respawnitems_giveequipmentammo(respawnitems, "primary");
        respawnitems_giveequipmentammo(respawnitems, "secondary");
    }
    if (namespace_32b635fd0594e0cc::function_258c5e445c8b7f80()) {
        thread namespace_32b635fd0594e0cc::runnvg();
        thread loadout_updateplayernvgs();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6c3
// Size: 0xdf
function loadout_updateplayernvgs() {
    self endon("death_or_disconnect");
    self notify("loadout_updatePlayerNVGs");
    self endon("loadout_updatePlayerNVGs");
    apply = 0;
    if (game["roundsPlayed"] == 0 && !istrue(self.hasspawned) && (namespace_36f464722d326bbe::isnightmap() || getdvarint(@"hash_68a323d5bd07266c", 0) == 1)) {
        if (!gameflag("infil_will_run") || gameflag("infil_started")) {
            apply = 1;
        }
    } else if (istrue(self.pers["useNVG"])) {
        apply = 1;
    }
    if (istrue(self.inspawncamera)) {
        waittill_any_2("spawned_player", "fadeUp_start");
    }
    while (!isdefined(self.operatorcustomization)) {
        waitframe();
    }
    if (apply) {
        self nightvisionviewon(1);
    }
    namespace_32b635fd0594e0cc::nvg_update3rdperson(apply);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7a9
// Size: 0x164
function loadout_updateplayersuper(struct) {
    var_3ee5f90ec4d78460 = struct.loadoutsuper;
    respawnitems = respawnitems_getrespawnitems();
    var_b86cf5cef6838543 = respawnitems_hassuperdata(respawnitems);
    if (var_b86cf5cef6838543) {
        var_3ee5f90ec4d78460 = respawnitems_getsuperref(respawnitems);
    }
    if (isdefined(namespace_85d036cb78063c4a::getcurrentsuper())) {
        var_d3c112e63bf53ee5 = namespace_85d036cb78063c4a::getcurrentsuperref();
        if (var_d3c112e63bf53ee5 == var_3ee5f90ec4d78460 && !haschangedarchetype()) {
            namespace_85d036cb78063c4a::givesuperweapon(self.super);
            return;
        }
    }
    if (var_3ee5f90ec4d78460 == "none" || !level.allowsupers) {
        namespace_85d036cb78063c4a::clearsuper();
        self.loadoutsuper = undefined;
    } else if (level.allowsupers && isdefined(self.pers["gamemodeLoadout"]) && isdefined(self.pers["gamemodeLoadout"]["loadoutSuper"])) {
        self.loadoutsuper = self.pers["gamemodeLoadout"]["loadoutSuper"];
        namespace_85d036cb78063c4a::givesuper(self.loadoutsuper, 1);
    } else {
        self.loadoutsuper = struct.loadoutsuper;
        namespace_85d036cb78063c4a::givesuper(var_3ee5f90ec4d78460, 1);
        if (var_b86cf5cef6838543) {
            namespace_85d036cb78063c4a::setsuperbasepoints(respawnitems_getsuperpoints(respawnitems));
            namespace_85d036cb78063c4a::setsuperextrapoints(respawnitems_getsuperextrapoints(respawnitems));
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb914
// Size: 0x53
function loadout_updateplayergesture(struct) {
    if (!istrue(self.btestclient)) {
        if (struct.loadoutgesture != "none") {
            self.loadoutgesture = struct.loadoutgesture;
            namespace_46e9069d8502773a::givegesture(struct.loadoutgesture);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb96e
// Size: 0x8d
function loadout_updateplayeraccessory(struct) {
    if (!istrue(self.btestclient)) {
        if (isdefined(struct.loadoutaccessoryweapon) && struct.loadoutaccessoryweapon != "none") {
            self.loadoutaccessorydata = struct.loadoutaccessorydata;
            self.loadoutaccessoryweapon = struct.loadoutaccessoryweapon;
            namespace_93104865b3b8748::giveplayeraccessory(struct.loadoutaccessorydata, struct.loadoutaccessoryweapon, struct.loadoutaccessorylogic);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba02
// Size: 0xc3
function loadout_updateplayerstreaktype(struct) {
    self.streaktype = loadout_getplayerstreaktype(struct.loadoutstreaktype);
    var_7f10159f1efb1ca8 = isdefined(level.var_62f6f7640e4431e3) && istrue(level.var_62f6f7640e4431e3.var_b0455df76d97746a);
    if (isdefined(level.gametype) && !namespace_36f464722d326bbe::isbrstylegametype() && !var_7f10159f1efb1ca8) {
        var_fa1875dbac819c2f = self getplayerdata(level.loadoutdata, "squadMembers", "scoreStreak");
        /#
            if (!istrue(var_fa1875dbac819c2f)) {
                var_b7696d5ab59f553c = getdvarint(@"hash_6644f43939a024", 0);
                var_fa1875dbac819c2f = var_b7696d5ab59f553c;
            }
        #/
        self.var_8bc1ddad56ab00bf = istrue(var_fa1875dbac819c2f);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbacc
// Size: 0x449
function loadout_updateplayerkillstreaks(struct, class) {
    if (level.var_1a2b600a06ec21f4.var_c4809f80b4230099 == #"score") {
        namespace_82dcd1d5ae30ff7::giveperk("specialty_killstreak_to_scorestreak");
    }
    if (!level.allowkillstreaks) {
        struct.loadoutkillstreak1 = "none";
        struct.loadoutkillstreak2 = "none";
        struct.loadoutkillstreak3 = "none";
        struct.var_70f190143fb74941 = 0;
        struct.var_2b902dfc607c8860 = 0;
        struct.var_7e3e3c6aebc4618f = 0;
    }
    if (struct.loadoutstreaksfilled == 0 && isdefined(self.streakdata) && self.streakdata.streaks.size > 0 && class == "gamemode") {
        var_3b991f00e2e091e4 = 0;
        foreach (killstreak in self.streakdata.streaks) {
            if (var_3b991f00e2e091e4 == 0) {
                struct.loadoutkillstreak1 = killstreak.streakname;
                struct.var_70f190143fb74941 = 0;
                var_3b991f00e2e091e4++;
            } else if (var_3b991f00e2e091e4 == 1) {
                struct.loadoutkillstreak2 = killstreak.streakname;
                struct.var_2b902dfc607c8860 = 0;
                var_3b991f00e2e091e4++;
            } else if (var_3b991f00e2e091e4 == 2) {
                struct.loadoutkillstreak3 = killstreak.streakname;
                struct.var_7e3e3c6aebc4618f = 0;
                break;
            }
        }
    }
    var_66383c9fdf2d18c4 = [0:struct.loadoutkillstreak1, 1:struct.loadoutkillstreak2, 2:struct.loadoutkillstreak3];
    if (level.allowkillstreaks) {
        self.pers["hackedStreaks"] = 0;
        var_66383c9fdf2d18c4 = [0:struct.loadoutkillstreak1, 1:struct.loadoutkillstreak2, 2:struct.loadoutkillstreak3];
    }
    self.loadoutusingspecialist = ter_op(istrue(level.var_606eb45e074ff204), 0, struct.loadoutusingspecialist);
    if (!istrue(level.var_606eb45e074ff204) && struct.loadoutusingspecialist && level.allowkillstreaks) {
        var_66383c9fdf2d18c4 = replacewithspecialistkillstreaks(struct);
    }
    respawnitems = respawnitems_getrespawnitems();
    var_b86cf5cef6838543 = respawnitems_hasstreakdata(respawnitems);
    if (var_b86cf5cef6838543 && level.allowkillstreaks) {
        var_66383c9fdf2d18c4 = respawnitems_getstreaks(respawnitems);
    }
    if (level.allowkillstreaks) {
        var_66383c9fdf2d18c4 = sortkillstreaksbycost(var_66383c9fdf2d18c4);
    }
    if (!isagent(self)) {
        var_92bbbe3246f6a87b = namespace_58a74e7d54b56e8d::arekillstreaksequipped(var_66383c9fdf2d18c4);
        if (!var_92bbbe3246f6a87b) {
            self notify("givingLoadout");
            var_8d31993278c0bbe1 = namespace_58a74e7d54b56e8d::getgimmeslotkillstreakstructs();
            var_e6f8bd2478b0e77d = namespace_58a74e7d54b56e8d::getavailableequippedkillstreakstructs();
            if (!_hasperk("specialty_support_killstreaks") && !isdefined(self.earnedmaxkillstreak)) {
                namespace_58a74e7d54b56e8d::clearkillstreaks();
            }
            for (streakindex = 0; streakindex < var_66383c9fdf2d18c4.size; streakindex++) {
                streak = var_66383c9fdf2d18c4[streakindex];
                if (isdefined(streak) && streak != "none" && streak != "") {
                    namespace_58a74e7d54b56e8d::equipkillstreak(streak, streakindex + 1);
                }
            }
            for (var_ce1a78c55bdd4530 = var_8d31993278c0bbe1.size - 1; var_ce1a78c55bdd4530 >= 0; var_ce1a78c55bdd4530--) {
                streak = var_8d31993278c0bbe1[var_ce1a78c55bdd4530];
                if (!streak.isspecialist) {
                    namespace_58a74e7d54b56e8d::awardkillstreakfromstruct(var_8d31993278c0bbe1[var_ce1a78c55bdd4530], "other");
                }
            }
            for (var_ce1a78c55bdd4530 = 0; var_ce1a78c55bdd4530 < var_e6f8bd2478b0e77d.size; var_ce1a78c55bdd4530++) {
                streak = var_e6f8bd2478b0e77d[var_ce1a78c55bdd4530];
                if (!streak.isspecialist) {
                    namespace_58a74e7d54b56e8d::awardkillstreakfromstruct(var_e6f8bd2478b0e77d[var_ce1a78c55bdd4530], "other");
                }
            }
        }
    }
    self notify("equipKillstreaksFinished");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf1c
// Size: 0xcf
function sortkillstreaksbycost(var_400d80e48322c797) {
    for (i = 0; i < var_400d80e48322c797.size - 1; i++) {
        if (isdefined(var_400d80e48322c797[i]) && var_400d80e48322c797[i] != "none" && var_400d80e48322c797[i] != "") {
            for (j = i + 1; j < var_400d80e48322c797.size; j++) {
                if (isdefined(var_400d80e48322c797[j]) && var_400d80e48322c797[j] != "none" && var_400d80e48322c797[j] != "") {
                    currentcost = namespace_58a74e7d54b56e8d::calcstreakcost(var_400d80e48322c797[i]);
                    var_6e1140a41607a4c1 = namespace_58a74e7d54b56e8d::calcstreakcost(var_400d80e48322c797[j]);
                    if (var_6e1140a41607a4c1 < currentcost) {
                        ref = var_400d80e48322c797[j];
                        var_400d80e48322c797[j] = var_400d80e48322c797[i];
                        var_400d80e48322c797[i] = ref;
                    }
                }
            }
        }
    }
    return var_400d80e48322c797;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbff3
// Size: 0x22
function loadout_updateplayeractionslots(struct, class) {
    self setactionslot(3, "altmode");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc01c
// Size: 0x32d
function loadout_updatefieldupgrades(struct, class) {
    if (class == "juggernaut" || class == "superpower") {
        return;
    }
    respawnitems = respawnitems_getrespawnitems();
    if (respawnitems_hassuperdata(respawnitems)) {
        var_c017426249a4726a = function_2f17741f5c15a7d6(respawnitems);
        self.loadoutfieldupgrade2 = var_c017426249a4726a[1];
        self.loadoutfieldupgrade1 = var_c017426249a4726a[0];
    } else {
        self.loadoutfieldupgrade1 = struct.loadoutfieldupgrade1;
        self.var_4c4f03fa00925daf = struct.var_4c4f03fa00925daf;
        self.loadoutfieldupgrade2 = struct.loadoutfieldupgrade2;
        self.var_2907f1614fe4e5f2 = struct.var_39aa4db252bf8db2;
    }
    if (superisrestricted(self.loadoutfieldupgrade1)) {
        self.loadoutfieldupgrade1 = "super_deadsilence";
        var_4c4f03fa00925daf = 0;
    }
    if (superisrestricted(self.loadoutfieldupgrade2)) {
        self.loadoutfieldupgrade2 = "super_deadsilence";
        self.var_2907f1614fe4e5f2 = 0;
    }
    if (isanymlgmatch() || self.loadoutfieldupgrade1 == self.loadoutfieldupgrade2) {
        self.loadoutfieldupgrade2 = "none";
        var_2907f1614fe4e5f2 = 0;
    }
    if (level.allowsupers) {
        mapname = namespace_36f464722d326bbe::getmapname();
        if (issubstr(mapname, "mp_m_") && mapname != "mp_m_speed") {
            self.loadoutfieldupgrade1 = function_15da17f6ac6380af(self.loadoutfieldupgrade1);
            self.loadoutfieldupgrade2 = function_15da17f6ac6380af(self.loadoutfieldupgrade2);
            if (self.loadoutfieldupgrade1 == self.loadoutfieldupgrade2) {
                self.loadoutfieldupgrade2 = "none";
                self.var_2907f1614fe4e5f2 = 0;
            }
        }
        thread namespace_85d036cb78063c4a::watchplayersuperdelayweapon();
        thread namespace_727d2aa1d6c72038::perkpackage_initperkpackages();
        if (!istrue(level.var_4b56eabbc77bfd21) && (namespace_36f464722d326bbe::isbrstylegametype() || getgametype() == "gwai")) {
            super = fixsuperforbr(self.loadoutfieldupgrade1);
            if (isdefined(level.forcegivesuper)) {
                self [[ level.forcegivesuper ]](super);
            }
        }
    } else if (!istrue(level.var_4b56eabbc77bfd21) && namespace_36f464722d326bbe::isbrstylegametype()) {
        self.loadoutbrfieldupgrade = fixsuperforbr(self.loadoutfieldupgrade1);
        self.loadoutfieldupgrade1 = "none";
        self.var_4c4f03fa00925daf = 0;
        self.loadoutfieldupgrade2 = "none";
        self.var_2907f1614fe4e5f2 = 0;
        if (getdvarint(@"hash_52994f8fc649c87a", 0) == 0) {
            namespace_727d2aa1d6c72038::perkpackage_initpersdata();
        }
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() && isdefined(level.forcegivesuper)) {
            self [[ level.forcegivesuper ]](self.loadoutbrfieldupgrade);
        }
    }
    if (self.loadoutfieldupgrade1 != "super_emp_pulse" && self.loadoutfieldupgrade2 != "super_emp_pulse") {
        namespace_15f48ac5c4673765::function_75baa17a54260f6f(0);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc350
// Size: 0x6f
function fixsuperforbr(var_ebec497ff8b18a45) {
    if (!istrue(level.var_d040719163e20394) && !isdefined(var_ebec497ff8b18a45)) {
        return "super_ammo_drop";
    } else {
        var_55319c52de1e69f5 = !namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() || getsubgametype() == "rumble_mgl";
        if (var_ebec497ff8b18a45 == "none" && var_55319c52de1e69f5 && !namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            return "super_ammo_drop";
        } else {
            return var_ebec497ff8b18a45;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3c6
// Size: 0x53
function function_15da17f6ac6380af(var_fed7b85886638423) {
    switch (var_fed7b85886638423) {
    case #"hash_699e6c3e460adde4":
    case #"hash_7266a252f51150e9":
    case #"hash_ac520bae8aaba66b":
        var_fed7b85886638423 = "super_ammo_drop";
        break;
    default:
        break;
    }
    return var_fed7b85886638423;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc421
// Size: 0x21f
function loadout_updateplayer(globalstruct, struct, class, var_4d71ac90487ba0d7, skipfirstraise) {
    loadout_updateplayerstreaktype(struct);
    loadout_updateplayerarchetype(struct);
    if (!istrue(level.noweaponsonstart)) {
        loadout_updateplayerweapons(struct, class, var_4d71ac90487ba0d7, skipfirstraise);
    }
    loadout_updateplayerperks(struct, class);
    if (!istrue(level.noweaponsonstart)) {
        loadout_updateplayerequipment(struct, class);
    }
    if (!istrue(game["isLaunchChunk"]) && !namespace_36f464722d326bbe::isbrstylegametype() && !(isdefined(level.var_62f6f7640e4431e3) && istrue(level.var_62f6f7640e4431e3.var_71b7ca11bb26d366))) {
        loadout_updateplayerkillstreaks(struct, class);
    }
    loadout_updateplayeractionslots(struct, class);
    if (!istrue(game["isLaunchChunk"])) {
        loadout_updatefieldupgrades(struct, class);
    }
    self.pers["lastClass"] = self.class;
    self.lastclass = self.class;
    self.lastarchetypeinfo = self.changedarchetypeinfo;
    if (isdefined(self.gamemode_chosenclass)) {
        self.pers["class"] = self.gamemode_chosenclass;
        self.pers["lastClass"] = self.gamemode_chosenclass;
        self.class = self.gamemode_chosenclass;
        self.lastclass = self.gamemode_chosenclass;
        self.gamemode_chosenclass = undefined;
    }
    if (isdefined(self.revive_chosenclass)) {
        self.pers["class"] = self.revive_chosenclass;
        self.pers["lastClass"] = self.revive_chosenclass;
        self.class = self.revive_chosenclass;
        self.lastclass = self.revive_chosenclass;
    }
    namespace_6d8da2b47f878104::setupplayermodel();
    function_c5ce8711741e44b8();
    loadout_updateplayeraccessory(struct);
    if (issharedfuncdefined("instanceInventory", "updateInstanceInventoryFromDefault")) {
        [[ getsharedfunc("instanceInventory", "updateInstanceInventoryFromDefault") ]](self);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc647
// Size: 0x2f0
function setmlgspectatorclientloadoutdata(player, struct) {
    if (isagent(player)) {
        return;
    }
    player endon("disconnect");
    player notify("setMLGSpectatorClientLoadoutData()");
    player endon("setMLGSpectatorClientLoadoutData()");
    player setclientweaponinfo(0, struct.loadoutprimaryfullname);
    player setclientweaponinfo(1, struct.loadoutsecondaryfullname);
    if (isdefined(self.equipment["primary"])) {
        var_9da2f83262bca52f = namespace_1a507865f681850e::getequipmenttableinfo(self.equipment["primary"]);
        if (isdefined(var_9da2f83262bca52f)) {
            player setclientloadoutinfo("primaryPower", var_9da2f83262bca52f.id);
        }
    } else {
        player setclientloadoutinfo("primaryPower", 0);
    }
    if (isdefined(self.equipment["secondary"])) {
        var_ef8ce378a3dc072b = namespace_1a507865f681850e::getequipmenttableinfo(self.equipment["secondary"]);
        if (isdefined(var_ef8ce378a3dc072b)) {
            player setclientloadoutinfo("secondaryPower", var_ef8ce378a3dc072b.id);
        }
    } else {
        player setclientloadoutinfo("secondaryPower", 0);
    }
    player setclientloadoutinfo("fieldUpgrade", namespace_85d036cb78063c4a::getsuperid(self.loadoutfieldupgrade1));
    var_c59e88d893128017 = namespace_85d036cb78063c4a::getsuperid(struct.loadoutsuper);
    player setclientloadoutinfo("super", var_c59e88d893128017);
    if (isai(player)) {
        for (perkindex = 0; perkindex < struct.loadoutperks.size; perkindex++) {
            perk = struct.loadoutperks[perkindex];
            var_8852e1da266fea14 = namespace_b6a8027f477010e1::getperkid(perk);
            player setclientloadoutinfo(perkindex + 1 + "_perk", var_8852e1da266fea14);
        }
    } else {
        if (struct.loadoutperksfromgamemode) {
            struct.loadoutstandardperks = struct.loadoutperks;
        }
        for (perkindex = 0; perkindex < self.pers["loadoutPerks"].size; perkindex++) {
            perk = self.pers["loadoutPerks"][perkindex];
            var_8852e1da266fea14 = namespace_b6a8027f477010e1::getperkid(perk);
            player setclientloadoutinfo(perkindex + 1 + "_perk", var_8852e1da266fea14);
        }
        for (perkindex = 0; perkindex < struct.loadoutextraperks.size; perkindex++) {
            perk = struct.loadoutextraperks[perkindex];
            var_8852e1da266fea14 = namespace_b6a8027f477010e1::getperkid(perk);
            player setclientloadoutinfo(perkindex + 1 + "_extraPerk", var_8852e1da266fea14);
        }
    }
    rigtrait = struct.loadoutrigtrait;
    var_cadb7e2a87892576 = namespace_b6a8027f477010e1::getperkid(rigtrait);
    player setclientloadoutinfo("rigTrait", var_cadb7e2a87892576);
    var_6d1a148efa806994 = namespace_93ae9c099aee8626::getrigindexfromarchetyperef(struct.loadoutarchetype);
    player setclientloadoutinfo("archetype", var_6d1a148efa806994);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc93e
// Size: 0x2e
function shouldallowinstantclassswap() {
    if (namespace_f8065cafc523dba5::isinvehicle(1)) {
        disableclassswapallowed();
    }
    if (!isdefined(self.instantclassswapallowed)) {
        return 1;
    }
    return self.instantclassswapallowed;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc974
// Size: 0x15f
function swaploadout() {
    if (ent_flag_exist("swapLoadout_blocked") && ent_flag("swapLoadout_blocked")) {
        self endon("death_or_disconnect");
        self endon("joined_team");
        self endon("joined_spectators");
        self notify("swapLoadout");
        self endon("swapLoadout");
        if (!ent_flag("swapLoadout_pending")) {
            ent_flag_set("swapLoadout_pending");
        }
        self waittill("swapLoadout_blocked");
    }
    namespace_d19129e4fa5d176::setclass(self.pers["class"]);
    self.tag_stowed_back = undefined;
    self.tag_stowed_hip = undefined;
    namespace_3bbb5a98b932c46f::savetogglescopestates();
    namespace_3bbb5a98b932c46f::savealtstates();
    if (allowclasschoice()) {
        namespace_3c5a4254f2b957ea::incpersstat("classChanges", 1);
    }
    namespace_d19129e4fa5d176::giveloadout(self.pers["team"], self.pers["class"], undefined, 1);
    var_2b89ca43cac539d8 = namespace_36f464722d326bbe::isbrstylegametype() && !namespace_4b0406965e556711::gameflag("prematch_done");
    if (var_2b89ca43cac539d8 && isdefined(level.var_b89a535236a6f3d8) && !istrue(level.var_8281a47e2cecb257)) {
        self [[ level.var_b89a535236a6f3d8 ]]();
    }
    if (ent_flag_exist("swapLoadout_pending") && ent_flag("swapLoadout_pending")) {
        ent_flag_clear("swapLoadout_pending");
        ent_flag_set("swapLoadout_complete");
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcada
// Size: 0x4d
function function_a1c8aa2264227d22(class) {
    /#
        if (isbot(self)) {
            var_61f5d15d65ccb2ba = getdvarint(@"hash_3b22f26edfbc398", 0);
            if (var_61f5d15d65ccb2ba > 0) {
                class = "loadoutPrimaryCosmeticAttachment" + var_61f5d15d65ccb2ba;
                self.preloadedclassstruct = undefined;
            }
        }
        return class;
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb2e
// Size: 0x398
function giveloadout(team, class, var_4d71ac90487ba0d7, var_bea1f8064eda3de9, skipfirstraise, var_f15fdb6dca506606) {
    self notify("giveLoadout_start");
    self.gettingloadout = 1;
    if (getdvarint(@"hash_6a4d5cd30c97a609", 0)) {
        /#
            assertmsg("PERKS BUG LOGGING - giving player loadout with class: " + class);
        #/
        logstring("
 Player already has " + self.perks.size + " perks.");
        foreach (idx, perk in self.perks) {
            logstring("
" + idx);
        }
    }
    if (isdefined(self.perks)) {
        self.oldperks = self.perks;
    }
    var_99ef88e44462109e = self.attached_bag;
    loadout_clearplayer(var_bea1f8064eda3de9);
    /#
        class = function_a1c8aa2264227d22(class);
    #/
    globalstruct = loadout_getglobalclassstruct();
    globalstruct = loadout_updateglobalclass(globalstruct, class);
    self.globalstruct = globalstruct;
    struct = undefined;
    if (isdefined(self.preloadedclassstruct)) {
        struct = self.preloadedclassstruct;
        self.preloadedclassstruct = undefined;
        self.class_num = getclassindex(class);
    } else {
        struct = loadout_getclassstruct();
        struct = loadout_updateclass(struct, class);
    }
    self.classstruct = struct;
    loadout_updateplayer(globalstruct, struct, class, var_4d71ac90487ba0d7, skipfirstraise);
    if (class != "juggernaut" || class != "superpower") {
        function_200c71e93799b32f(struct);
        if (gameflag("prematch_done")) {
            loadout_lognewlygivenloadout(globalstruct, struct, class);
        }
    }
    self.gettingloadout = 0;
    if (isdefined(var_99ef88e44462109e) && istrue(var_f15fdb6dca506606)) {
        namespace_d696adde758cbe79::function_c3f3fceeddda6f6(var_99ef88e44462109e);
    }
    respawnitems_clear();
    self notify("changed_kit");
    self notify("giveLoadout");
    namespace_62c556437da28f50::tryresetrankxp();
    if (!istrue(game["isLaunchChunk"]) && !isagent(self)) {
        namespace_58a74e7d54b56e8d::resetforloadoutswitch();
    }
    namespace_99ac021a7547cae3::trydisableminimap();
    if (getdvarint(@"hash_61b02b55a172e917", 0) == 1) {
        time = getdvarfloat(@"hash_e8b67c3d7a0df987", 2.2);
        scale = getdvarfloat(@"hash_86724d0d77c5e70c", 1.35);
        thread function_222538ff1074a754(time, scale);
    }
    var_740fb89f7c4097d1 = getdvarint(@"hash_71175162fc904ea1", 0);
    var_c913859735abb981 = getdvarint(@"hash_cc275c16edd52097", 0);
    if (var_740fb89f7c4097d1 > 0) {
        thread function_1efc9881377752ac(var_740fb89f7c4097d1);
    }
    if (var_c913859735abb981 > 0) {
        thread function_f3ee15ceb4922f2(var_c913859735abb981);
    }
    if (getdvarint(@"hash_845243985c59afcc", 0) == 1) {
        thread function_866622357ab7abae();
    }
    if (getdvarint(@"hash_ae93197786d503ec", 0) == 1) {
        thread monitorstowedriotshieldspeed();
    }
    if (getdvar(@"hash_138eb261013ca091") != "") {
        thread function_cfb799b827f505af();
    }
    if (getdvarint(@"hash_862eba26990b004c", 0) == 1) {
        thread function_3f6e46db719fb8f2();
    }
    if (getdvarint(@"hash_f834da80397b0ab6", 0) == 1) {
        thread function_dcea859f45fd42e4();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcecd
// Size: 0x65
function function_dcea859f45fd42e4() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        waitframe();
        if (isdefined(self.var_6900f3419d3c4dd0) && self.var_6900f3419d3c4dd0 == 0) {
            continue;
        }
        if (self isjumping()) {
            function_d4a512c33a86e3d1(0);
            while (self isjumping()) {
                wait(0.1);
            }
            function_d4a512c33a86e3d1(1);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf39
// Size: 0x44
function function_3f6e46db719fb8f2() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        if (self issprinting() && self getstance() == "prone") {
            self setstance("stand");
        }
        wait(0.1);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf84
// Size: 0xe0
function function_cfb799b827f505af() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(0.3);
    execution = getdvar(@"hash_138eb261013ca091");
    if (isdefined(execution) && execution != "") {
        if (isplayer(self)) {
            self clearexecution();
            if (isdefined(self.equippedweapons)) {
                foreach (weapon in self.equippedweapons) {
                    if (issubstr(weapon.basename, "iw8_execution_")) {
                        self takeweapon(weapon);
                    }
                }
            }
            namespace_f446f6030ca8cff8::_giveexecution(execution);
            self iprintlnbold("Execution Equipped:" + execution);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd06b
// Size: 0x42
function function_200c71e93799b32f(struct) {
    if (istrue(level.codcasterenabled)) {
        if (!isplayer(self) && !isalive(self)) {
            return;
        }
        if (isagent(self)) {
            return;
        }
        thread setmlgspectatorclientloadoutdata(self, struct);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0b4
// Size: 0x4c2
function loadout_lognewlygivenloadout(globalstruct, struct, class) {
    if (!isplayer(self) && !isalive(self)) {
        return;
    }
    if (isagent(self)) {
        return;
    }
    if (istrue(level.codcasterenabled)) {
        thread setmlgspectatorclientloadoutdata(self, struct);
    }
    if (getdvarint(@"hash_4ba1427c86b79dc5") == 0) {
        return;
    }
    if (istrue(self.var_2676523c73704bb0)) {
        return;
    }
    if (struct.iscopiedclass) {
        var_2654b22c71e9aafc = 99;
        var_fd84df04adead383 = "copied";
    } else {
        var_2654b22c71e9aafc = getclassindex(class);
        var_fd84df04adead383 = loadout_getclasstype(class);
        var_8cdaa5e3e1ccbe02 = getsubstr(class, 0, 7) == "default";
        self.loadoutclass = class;
        if (var_8cdaa5e3e1ccbe02) {
            var_2654b22c71e9aafc = var_2654b22c71e9aafc + 20;
        }
    }
    var_4c5b4888ff814cde = struct.tweakedbyplayerduringmatch || struct.gamemodeforcednewloadout;
    struct.tweakedbyplayerduringmatch = 0;
    struct.gamemodeforcednewloadout = 0;
    var_15bab3eaa5df4c14 = 0;
    if (!isdefined(self.pers["loggedClasses"])) {
        self.pers["loggedClasses"] = [];
    }
    loadoutindex = -1;
    foreach (index, var_73f89b0786eef941 in self.pers["loggedClasses"]) {
        var_b7bfc64a828a13ff = self.pers["loggedClasses"][index];
        if (var_b7bfc64a828a13ff == var_2654b22c71e9aafc) {
            if (var_4c5b4888ff814cde) {
                var_15bab3eaa5df4c14 = var_15bab3eaa5df4c14 + 1;
            } else {
                loadoutindex = index;
            }
        }
    }
    var_d445f727570e7250 = undefined;
    var_425ddba200712090 = undefined;
    if (loadoutindex == -1 || struct.iscopiedclass) {
        loadoutindex = self.pers["loggedClasses"].size;
        self.pers["loggedClasses"][loadoutindex] = var_2654b22c71e9aafc;
        primaryweapon = struct.loadoutprimaryobject;
        if (isdefined(primaryweapon)) {
            var_fd464247e82127cb = getweaponvariantindex(primaryweapon);
            if (isdefined(var_fd464247e82127cb)) {
                var_8ef2c236f415dcd = getweaponrootname(primaryweapon) + "|" + var_fd464247e82127cb;
                blueprint = level.weaponlootmapdata[var_8ef2c236f415dcd];
                if (isdefined(blueprint)) {
                    var_d445f727570e7250 = blueprint;
                    var_d445f727570e7250.blueprintname = var_8ef2c236f415dcd;
                }
            }
        }
        secondaryweapon = struct.loadoutsecondaryobject;
        if (isdefined(secondaryweapon)) {
            var_bb70007d1fdc480b = getweaponvariantindex(secondaryweapon);
            if (isdefined(var_bb70007d1fdc480b)) {
                var_f5763b2cfaf2080d = getweaponrootname(secondaryweapon) + "|" + var_bb70007d1fdc480b;
                blueprint = level.weaponlootmapdata[var_f5763b2cfaf2080d];
                if (isdefined(blueprint)) {
                    var_425ddba200712090 = blueprint;
                    var_425ddba200712090.blueprintname = var_f5763b2cfaf2080d;
                }
            }
        }
        var_7e2c53b0bcf117d9 = spawnstruct();
        if (isdefined(self.pers["telemetry"]) && isdefined(self.pers["telemetry"].life) && isdefined(self.pers["telemetry"].life.life_index)) {
            var_7e2c53b0bcf117d9.lifeindex = self.pers["telemetry"].life.life_index;
        }
        if (isdefined(var_d445f727570e7250)) {
            var_7e2c53b0bcf117d9.var_d445f727570e7250 = var_d445f727570e7250;
        }
        if (isdefined(var_425ddba200712090)) {
            var_7e2c53b0bcf117d9.var_425ddba200712090 = var_425ddba200712090;
        }
        var_7e2c53b0bcf117d9.globalstruct = globalstruct;
        var_7e2c53b0bcf117d9.classstruct = struct;
        var_7e2c53b0bcf117d9.var_fd84df04adead383 = var_fd84df04adead383;
        var_7e2c53b0bcf117d9.loadoutindex = loadoutindex;
        var_7e2c53b0bcf117d9.var_15bab3eaa5df4c14 = var_15bab3eaa5df4c14;
        var_7e2c53b0bcf117d9.player = self;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_new_loadout_used", var_7e2c53b0bcf117d9);
    }
    if (!isdefined(self.loadoutindex) || self.loadoutindex != loadoutindex) {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = self;
        var_7e2c53b0bcf117d9.globalstruct = globalstruct;
        var_7e2c53b0bcf117d9.struct = struct;
        var_7e2c53b0bcf117d9.class = class;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_loadout_changed", var_7e2c53b0bcf117d9);
    }
    self.loadoutindex = loadoutindex;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd57d
// Size: 0x36
function hasvalidationinfraction() {
    return isdefined(self.pers) && isdefined(self.pers["validationInfractions"]) && self.pers["validationInfractions"] > 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5bb
// Size: 0x46
function recordvalidationinfraction() {
    if (isdefined(self.pers) && isdefined(self.pers["validationInfractions"])) {
        self.pers["validationInfractions"] = self.pers["validationInfractions"] + 1;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd608
// Size: 0x62
function _detachall(var_be69c03caa346d6c) {
    if (!istrue(var_be69c03caa346d6c)) {
        self.headmodel = undefined;
    }
    if (isdefined(self.riotshieldmodel)) {
        riotshield_detach(1);
    }
    if (isdefined(self.riotshieldmodelstowed)) {
        riotshield_detach(0);
    }
    if (!istrue(var_be69c03caa346d6c)) {
        namespace_d696adde758cbe79::function_6d569066ac5f3df0();
        self detachall();
    }
    namespace_32b635fd0594e0cc::clearnvg(istrue(var_be69c03caa346d6c));
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd671
// Size: 0x89
function trackriotshield_ontrophystow() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    while (1) {
        objweapon = self waittill("grenade_pullback");
        if (objweapon.basename != "trophy_mp") {
            continue;
        }
        if (!isdefined(self.riotshieldmodel)) {
            continue;
        }
        riotshield_move(1);
        self waittill("offhand_end");
        if (isriotshield(self getcurrentweapon()) && isdefined(self.riotshieldmodelstowed)) {
            riotshield_move(0);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd701
// Size: 0x78
function istwohandedoffhand(grenade) {
    if (isdefined(grenade) && grenade.basename != "none") {
        if (issuperweapon(grenade.basename) && !namespace_e0ee43ef2dddadaa::function_6c51b05ce2e9aed3(grenade.basename)) {
            return 1;
        }
        var_11d2f075e9a0e643 = getequipmenttype(grenade);
        if (isdefined(var_11d2f075e9a0e643) && var_11d2f075e9a0e643 == "lethal") {
            return 1;
        }
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd781
// Size: 0x59
function trackriotshield_grenadepullbackforc4() {
    while (1) {
        grenade = self waittill("grenade_pullback");
        if (!isnullweapon(grenade) && grenade.basename == "c4_mp" && isriotshield(self getcurrentweapon())) {
            self.onriotshieldstow_force = 1;
        }
        waitframe();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7e1
// Size: 0x66
function trackriotshield_updateoffhandstowignorec4() {
    if (!istrue(self.onriotshieldstow_force)) {
        weaponobj = self getheldoffhand();
        if (!isnullweapon(weaponobj) && weaponobj.basename != "c4_mp" && isriotshield(self getcurrentweapon()) && istwohandedoffhand(weaponobj)) {
            self.onriotshieldstow_force = 1;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd84e
// Size: 0x64
function trackriotshield_watchswitchawayfromshield() {
    self.riotshieldswitchawaytimer = undefined;
    self.riotshieldswitchaway = undefined;
    while (1) {
        weapon = self waittill("weapon_switch_started");
        if (!isriotshield(weapon)) {
            self.riotshieldswitchawaytimer = gettime() + 200;
        } else {
            self.riotshieldswitchawaytimer = undefined;
            self.riotshieldswitchaway = undefined;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8b9
// Size: 0x3d
function trackriotshield_watchcancelswitchaway() {
    while (1) {
        weapon = self waittill("weapon_switch_canceled");
        waittillframeend();
        if (isriotshield(weapon)) {
            self.riotshieldswitchawaytimer = undefined;
            self.riotshieldswitchaway = undefined;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8fd
// Size: 0x1db
function trackriotshield_monitorshieldattach(wasinlaststand) {
    self notify("trackRiotShield_monitorShieldAttach");
    self endon("trackRiotShield_monitorShieldAttach");
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("riotshield_detach");
    if (isdefined(self.infil)) {
        gameflagwait("prematch_done");
    }
    childthread trackriotshield_grenadepullbackforc4();
    if (isdefined(wasinlaststand)) {
        self.wasinlaststand = wasinlaststand;
    } else if (!isdefined(self.wasinlaststand)) {
        self.wasinlaststand = 0;
    }
    while (riotshield_hasweapon()) {
        trackriotshield_updateoffhandstowignorec4();
        if (!istrue(self.inlaststand)) {
            if (self.wasinlaststand) {
                self.laststandforceback = 1;
                self.laststandforcebackendtime = gettime() + 1000;
            } else if (isdefined(self.laststandforcebackendtime) && gettime() >= self.laststandforcebackendtime) {
                self.laststandforceback = undefined;
                self.laststandforcebackendtime = undefined;
            }
            self.wasinlaststand = 0;
        } else {
            self.laststandforceback = undefined;
            self.laststandforcebackendtime = undefined;
            self.wasinlaststand = 1;
        }
        if (self isonladder()) {
            trackriotshield_tryback();
        } else if (self isinexecutionattack()) {
            trackriotshield_tryback();
        } else if (self isinexecutionvictim()) {
            trackriotshield_trydetach();
        } else if (self isparachuting() || self isskydiving()) {
            trackriotshield_tryback();
        } else if (istrue(self.laststandforceback)) {
            trackriotshield_tryback();
        } else if (istrue(self.onriotshieldstow_force)) {
            if (isnullweapon(self getheldoffhand())) {
                self.onriotshieldstow_force = undefined;
                trackriotshield_tryreset();
            } else {
                trackriotshield_tryback();
            }
        } else {
            trackriotshield_tryreset();
        }
        waitframe();
    }
    trackriotshield_tryreset();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdadf
// Size: 0x4f
function trackriotshield_tryback() {
    var_f8ee3e194415c066 = isdefined(self.riotshieldmodel);
    onback = isdefined(self.riotshieldmodelstowed);
    if (!onback) {
        if (var_f8ee3e194415c066) {
            riotshield_move(1);
        } else {
            riotshield_attach(0, riotshield_getmodel());
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb35
// Size: 0x4f
function trackriotshield_tryarm() {
    var_f8ee3e194415c066 = isdefined(self.riotshieldmodel);
    onback = isdefined(self.riotshieldmodelstowed);
    if (!var_f8ee3e194415c066) {
        if (onback) {
            riotshield_move(0);
        } else {
            riotshield_attach(1, riotshield_getmodel());
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb8b
// Size: 0x46
function trackriotshield_trydetach() {
    var_f8ee3e194415c066 = isdefined(self.riotshieldmodel);
    onback = isdefined(self.riotshieldmodelstowed);
    if (var_f8ee3e194415c066) {
        riotshield_detach(1);
    }
    if (onback) {
        riotshield_detach(0);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbd8
// Size: 0x7e
function trackriotshield_tryreset() {
    if (riotshield_hasweapon()) {
        var_e04977fba6749bed = isriotshield(self getcurrentweapon());
        if (var_e04977fba6749bed) {
            trackriotshield_tryarm();
        } else {
            trackriotshield_tryback();
        }
    } else {
        var_f8ee3e194415c066 = isdefined(self.riotshieldmodel);
        onback = isdefined(self.riotshieldmodelstowed);
        if (var_f8ee3e194415c066) {
            riotshield_detach(1);
        }
        if (onback) {
            riotshield_detach(0);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc5d
// Size: 0x36
function riotshieldonweaponchange(objweapon) {
    if (riotshield_hasweapon()) {
        thread trackriotshield_monitorshieldattach();
    } else {
        trackriotshield_tryreset();
        riotshieldclearvars();
        self notify("riotshield_detach");
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc9a
// Size: 0x57
function riotshieldclearvars(var_fcef8d217a441961) {
    self.laststandforceback = undefined;
    self.laststandforcebackendtime = undefined;
    self.wasinlaststand = undefined;
    if (istrue(var_fcef8d217a441961)) {
        self.hasriotshield = undefined;
        self.hasriotshieldequipped = undefined;
        self.riotshieldmodel = undefined;
        self.riotshieldmodelstowed = undefined;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcf8
// Size: 0x12
function isweaponsilenced(weapon) {
    return weapon issilenced();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd12
// Size: 0x1c
function getweaponpassives(var_5c3f9357f11d2223, variantid) {
    return namespace_3f0ea7483345a2c0::getpassivesforweapon(var_5c3f9357f11d2223, variantid);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdd36
// Size: 0x8f
function weaponhaspassive(var_5c3f9357f11d2223, variantid, passive) {
    passives = getweaponpassives(var_5c3f9357f11d2223, variantid);
    if (!isdefined(passives) || passives.size <= 0) {
        return 0;
    }
    foreach (var_d8da47e8daa32ce6 in passives) {
        if (passive == var_d8da47e8daa32ce6) {
            return 1;
        }
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xddcd
// Size: 0xa0
function getweaponvariantattachments(var_5c3f9357f11d2223, variantid) {
    attachments = [];
    passives = getweaponpassives(var_5c3f9357f11d2223, variantid);
    if (isdefined(passives)) {
        foreach (passive in passives) {
            var_77134c6dd01475f = namespace_d42f0311f511b910::getpassiveattachment(passive);
            if (!isdefined(var_77134c6dd01475f)) {
                continue;
            }
            attachments[attachments.size] = var_77134c6dd01475f;
        }
    }
    return attachments;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde75
// Size: 0xb7
function replenishloadout() {
    team = self.pers["team"];
    class = self.pers["class"];
    weaponslist = self getweaponslistall();
    for (idx = 0; idx < weaponslist.size; idx++) {
        weapon = weaponslist[idx];
        self givemaxammo(weapon);
        self setweaponammoclip(weapon, 9999);
        weaponname = weapon.basename;
        if (weaponname == "claymore_mp" || weaponname == "claymore_detonator_mp") {
            self setweaponammostock(weapon, 2);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf33
// Size: 0x103
function onplayerconnecting() {
    for (;;) {
        player = level waittill("connected");
        player enableplayerbreathsystem(0);
        if (!isdefined(player.pers["class"])) {
            player.pers["class"] = "";
        }
        if (!isdefined(player.pers["lastClass"])) {
            player.pers["lastClass"] = "";
        }
        player.class = player.pers["class"];
        player.lastclass = player.pers["lastClass"];
        player.changedarchetypeinfo = player.pers["changedArchetypeInfo"];
        player.lastarchetypeinfo = undefined;
        if (!isdefined(player.pers["validationInfractions"])) {
            player.pers["validationInfractions"] = 0;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe03d
// Size: 0x3a1
function onplayerspawned() {
    level endon("game_ended");
    while (1) {
        player = level waittill("player_spawned");
        if (!isdefined(player)) {
            continue;
        }
        player enableplayerbreathsystem(1);
        if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref + "" == "355") {
            player function_555e2d32e2756625("gasmask_female");
        } else if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.gender) && player.operatorcustomization.gender == "female") {
            player function_555e2d32e2756625("female");
        } else if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref + "" == "319") {
            player setentitysoundcontext("gender", "bongmask_male");
        } else if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.skinref) && player.operatorcustomization.skinref + "" == "597") {
            player setentitysoundcontext("gender", "bongmask_male");
        } else {
            player function_555e2d32e2756625("");
        }
        player stoplocalsound("deaths_door_death");
        if (isdefined(level.var_d39aa4b67cefa0d6)) {
            player stoplocalsound(level.var_d39aa4b67cefa0d6);
        }
        player clearsoundsubmix("player_swimming_underwater", 1);
        player clearsoundsubmix("mp_juggernaut", 0.5);
        player clearsoundsubmix("iw9_mp_soccer_goal", 1);
        player setentitysoundcontext("atmosphere", "", 1);
        player clearclienttriggeraudiozone(2);
        if (isdefined(player.operatorsfx)) {
            player clearsoundsubmix("iw8_mp_spawn_camera");
            player.operatorsfx stoploopsound(self.operatorsfxalias);
            player.operatorsfx delete();
            player.operatorsfx = undefined;
            player.operatorsfxalias = undefined;
        }
        if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.clothtype) && player.operatorcustomization.clothtype != "") {
            player setclothtype(function_1823ff50bb28148d(player.operatorcustomization.clothtype));
        } else {
            player setclothtype(#"vestlight");
        }
        if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.var_400ef51562606e7a) && player.operatorcustomization.var_400ef51562606e7a != "") {
            player function_8abe5a968cc3c220(function_1823ff50bb28148d(player.operatorcustomization.var_400ef51562606e7a));
        } else {
            player function_8abe5a968cc3c220(#"millghtgr");
        }
        if (level.gametype == "dungeons") {
            player namespace_f446f6030ca8cff8::_giveexecution("jup_execution_first_person_000", 1);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe3e5
// Size: 0x28
function fadeaway(waitdelay, var_6ea9cf1222359e6) {
    wait(waitdelay);
    self fadeovertime(var_6ea9cf1222359e6);
    self.alpha = 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe414
// Size: 0x16
function setclass(newclass) {
    self.curclass = newclass;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe431
// Size: 0x6b
function haschangedclass() {
    if (isdefined(self.lastclass) && self.lastclass != self.class || !isdefined(self.lastclass)) {
        return 1;
    }
    if (namespace_36f464722d326bbe::function_2536e99eb6586f8f() && (!isdefined(self.last_infected_class) || self.last_infected_class != self.infected_class)) {
        return 1;
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4a4
// Size: 0x3a
function haschangedarchetype() {
    if (isdefined(self.changedarchetypeinfo)) {
        if (!isdefined(self.lastarchetypeinfo)) {
            return 1;
        }
        if (self.changedarchetypeinfo != self.lastarchetypeinfo) {
            return 1;
        }
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4e6
// Size: 0x79
function resetactionslots() {
    self setactionslot(1, "");
    self setactionslot(2, "");
    self setactionslot(3, "");
    self setactionslot(4, "");
    if (!isagent(self) && !self isconsoleplayer()) {
        self setactionslot(5, "");
        self setactionslot(6, "");
        self setactionslot(7, "");
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe566
// Size: 0x149
function resetfunctionality() {
    self enableequipdeployvfx(0);
    if (!isagent(self)) {
        if (!istrue(self.var_65219c911f198c95)) {
            namespace_7e17181d03156026::hidehudclear();
        }
        vehicle_allowplayeruse(self, 1);
        if (level.minimaponbydefault || namespace_36f464722d326bbe::isbrstylegametype() && istrue(game["inLiveLobby"])) {
            self setclientomnvar("ui_hide_minimap", 0);
        } else {
            self setclientomnvar("ui_hide_minimap", 1);
        }
    }
    val::function_8b5f9e0014775208();
    namespace_1fbd40990ee60ede::vehicle_occupancy_clearallowmovementplayer(self, 1);
    self.doublejumpenergy = undefined;
    self.doublejumpenergyrestorerate = undefined;
    self.enabledcollisionnotifies = undefined;
    self.enabledequipdeployvfx = undefined;
    self.minimapstatetracker = undefined;
    self.isstunned = undefined;
    self.isblinded = undefined;
    self.nocorpse = undefined;
    self.prematchlook = undefined;
    self.ladderexecutionblocked = undefined;
    namespace_3e725f3cc58bddd3::resetattackerlist();
    namespace_3e725f3cc58bddd3::clearcorpsetablefuncs();
    namespace_d19129e4fa5d176::riotshieldclearvars();
    namespace_f8065cafc523dba5::cleardemeanorsafe();
    namespace_3bbb5a98b932c46f::function_6b4a68dbdae21499(1);
    namespace_df478cc572a311d3::molotov_clear_fx();
    namespace_5e840d01a2244aea::clearflash(1);
    namespace_d39a86483d995ed1::gas_clear(1);
    if (!isagent(self)) {
        namespace_893ac0cf28c5af44::function_a867654273504370();
    }
    namespace_e765f0aad2368473::clearloopingcoughaudio();
    _resetenableignoreme();
    namespace_f8065cafc523dba5::function_c28310e3b33872cb();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6b6
// Size: 0x14
function clearscriptable() {
    self setscriptablepartstate("CompassIcon", "defaultIcon");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe6d1
// Size: 0x135
function changearchetype(archetype, super, trait) {
    if (isdefined(self.changedarchetypeinfo)) {
        var_1df3c8537ebf5ed5 = self.changedarchetypeinfo;
        if (var_1df3c8537ebf5ed5.archetype == archetype && var_1df3c8537ebf5ed5.super == super && var_1df3c8537ebf5ed5.trait == trait) {
            return;
        }
    }
    changedarchetypeinfo = spawnstruct();
    changedarchetypeinfo.archetype = archetype;
    changedarchetypeinfo.super = super;
    changedarchetypeinfo.trait = trait;
    self.changedarchetypeinfo = changedarchetypeinfo;
    self.pers["changedArchetypeInfo"] = changedarchetypeinfo;
    if (isdefined(self.pers["class"]) && self.pers["class"] != "") {
        preloadandqueueclass(self.pers["class"]);
        if (shouldallowinstantclassswap()) {
            thread swaploadout();
        } else if (isalive(self)) {
            self iprintlnbold(game["strings"]["change_rig"]);
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe80d
// Size: 0xa9
function getattachmentloadoutstring(attachmentindex, slot) {
    /#
        assert(function_d03495fe6418377b(slot));
    #/
    if (!isdefined(level.var_e6667ec6ac57b25a)) {
        level.var_e6667ec6ac57b25a = [];
        level.var_e6667ec6ac57b25a[#"primary"] = "loadoutPrimaryAttachment";
        level.var_e6667ec6ac57b25a[#"secondary"] = "loadoutSecondaryAttachment";
        level.var_e6667ec6ac57b25a[#"tertiary"] = "loadoutTertiaryAttachment";
    }
    base = level.var_e6667ec6ac57b25a[slot];
    if (attachmentindex == 0) {
        return base;
    }
    return base + attachmentindex + 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8be
// Size: 0xa9
function getstickerloadoutstring(var_36d2abbdcbcb186c, slot) {
    /#
        assert(function_d03495fe6418377b(slot));
    #/
    if (!isdefined(level.var_8058980ac78604fe)) {
        level.var_8058980ac78604fe = [];
        level.var_8058980ac78604fe[#"primary"] = "loadoutPrimarySticker";
        level.var_8058980ac78604fe[#"secondary"] = "loadoutSecondarySticker";
        level.var_8058980ac78604fe[#"tertiary"] = "loadoutTertiarySticker";
    }
    base = level.var_8058980ac78604fe[slot];
    if (var_36d2abbdcbcb186c == 0) {
        return base;
    }
    return base + var_36d2abbdcbcb186c + 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe96f
// Size: 0x5
function getmaxprimaryattachments() {
    return 7;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe97c
// Size: 0x5
function getmaxsecondaryattachments() {
    return 7;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe989
// Size: 0x5
function function_ed8babbe1912171f() {
    return 5;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe996
// Size: 0x5
function function_fba1013e19eb56c3() {
    return 5;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9a3
// Size: 0x5
function function_4073b3f145413cd() {
    return 7;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe9b0
// Size: 0x8b
function getmaxattachments(weaponslot) {
    /#
        assert(function_d03495fe6418377b(weaponslot));
    #/
    if (!isdefined(level.maxattachments)) {
        level.maxattachments = [];
        level.maxattachments[#"primary"] = getmaxprimaryattachments();
        level.maxattachments[#"secondary"] = getmaxsecondaryattachments();
        level.maxattachments[#"tertiary"] = function_4073b3f145413cd();
    }
    return level.maxattachments[weaponslot];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xea43
// Size: 0x184
function fillemptystreakslots(var_66383c9fdf2d18c4, struct) {
    if (!level.allowkillstreaks) {
        return;
    }
    var_3c96db658445965e = [];
    var_5feb6adfd05e27f1 = [];
    foreach (index, streak in var_66383c9fdf2d18c4) {
        if (streak == "none") {
            var_3c96db658445965e[var_3c96db658445965e.size] = index;
        } else {
            var_5feb6adfd05e27f1[var_5feb6adfd05e27f1.size] = streak;
        }
    }
    if (var_3c96db658445965e.size > 0) {
        self.pers["hackedStreaks"] = 1;
    }
    foreach (slot in var_3c96db658445965e) {
        var_9215d4aee874a4db = findfirststreakdifferentcost(var_5feb6adfd05e27f1);
        if (slot + 1 == 1) {
            struct.loadoutkillstreak1 = var_9215d4aee874a4db;
        } else if (slot + 1 == 2) {
            struct.loadoutkillstreak2 = var_9215d4aee874a4db;
        } else {
            struct.loadoutkillstreak3 = var_9215d4aee874a4db;
        }
        var_5feb6adfd05e27f1[var_5feb6adfd05e27f1.size] = var_9215d4aee874a4db;
    }
    return [0:struct.loadoutkillstreak1, 1:struct.loadoutkillstreak2, 2:struct.loadoutkillstreak3];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebcf
// Size: 0x105
function findfirststreakdifferentcost(var_5feb6adfd05e27f1) {
    var_7b0a8d49f719a44e = [];
    foreach (var_2b7cf61af0cb9960, bundle in level.var_b23156d776b1d85.var_38f2a11237246ac) {
        if (!istrue(bundle.var_594af43597023062)) {
            continue;
        }
        var_7a93db468bfa64c4 = 0;
        foreach (var_ace49e98dec89e03 in var_5feb6adfd05e27f1) {
            if (var_2b7cf61af0cb9960 == var_ace49e98dec89e03 || namespace_58a74e7d54b56e8d::calcstreakcost(var_2b7cf61af0cb9960) == namespace_58a74e7d54b56e8d::calcstreakcost(var_ace49e98dec89e03)) {
                var_7a93db468bfa64c4 = 1;
                break;
            }
        }
        if (!istrue(var_7a93db468bfa64c4)) {
            var_7b0a8d49f719a44e[var_7b0a8d49f719a44e.size] = var_2b7cf61af0cb9960;
        }
    }
    return var_7b0a8d49f719a44e[0];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecdc
// Size: 0x31
function replacewithspecialistkillstreaks(struct) {
    return [0:"specialist_perk_1", 1:"specialist_perk_2", 2:"specialist_perk_3", 3:"specialist_perk_bonus"];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed15
// Size: 0x77
function updateinstantclassswapallowed() {
    self endon("disconnect");
    self endon("death");
    level endon("game_ended");
    self.instantclassswapallowed = 1;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        var_cd83a28652a3f837 = namespace_d576b6dc7cef9c62::function_8f54deec605690d1(getsubgametype());
        if (var_cd83a28652a3f837) {
            namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
            updateinstantclassswapallowedinternal();
        }
    } else {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        updateinstantclassswapallowedinternal();
    }
    disableclassswapallowed();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed93
// Size: 0x6f
function updateinstantclassswapallowedinternal() {
    self endon("death");
    graceperiod = ter_op(ismlgmatch(), 5, 15);
    if (namespace_d576b6dc7cef9c62::function_8f54deec605690d1(getsubgametype())) {
        while (isdefined(self.c130)) {
            waitframe();
        }
        self waittill("parachute_complete");
    }
    if (_hasperk("specialty_tune_up")) {
        graceperiod = ter_op(ismlgmatch(), 5, 5);
    }
    wait(graceperiod);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee09
// Size: 0x5c
function disableclassswapallowed() {
    if (istrue(level.var_f55a78de40f16b44)) {
        return;
    }
    if (istrue(self.instantclassswapallowed)) {
        self.instantclassswapallowed = 0;
        if (isteamreviveenabled()) {
            self.revive_chosenclass = self.class;
            self.pers["next_round_class"] = self.class;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee6c
// Size: 0x19
function isvalidclass(class) {
    return isdefined(class) && class != "";
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee8d
// Size: 0x39
function getclassindex(classname) {
    /#
        assertex(isdefined(level.classmap[classname]), "ERROR: Unknown classMap '" + classname + "'");
    #/
    return level.classmap[classname];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeece
// Size: 0x30
function preloadandqueueclass(class, var_1dce12d4eaf02799) {
    struct = loadout_getorbuildclassstruct(class);
    preloadandqueueclassstruct(struct, var_1dce12d4eaf02799);
    return struct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef06
// Size: 0x47
function preloadandqueueclassstruct(classstruct, var_1dce12d4eaf02799, var_8c3977c9c8dc729b) {
    var_1583b947947ad005 = namespace_99ac021a7547cae3::getplayerassets(classstruct);
    namespace_99ac021a7547cae3::loadplayerassets([0:var_1583b947947ad005], var_1dce12d4eaf02799, var_8c3977c9c8dc729b);
    self.preloadedclassstruct = classstruct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef54
// Size: 0x18c
function loadout_getorbuildclassstruct(classname) {
    if (self.team == "spectator" && !isdefined(classname)) {
        classname = "custom1";
    }
    var_fd84df04adead383 = loadout_getclasstype(classname);
    var_b96b2d290a5d5dbe = getcachedloadoutstruct(classname, var_fd84df04adead383);
    if (isdefined(var_b96b2d290a5d5dbe)) {
        if (!isdefined(var_b96b2d290a5d5dbe.loadoutprimaryobject) && isdefined(var_b96b2d290a5d5dbe.loadoutprimaryfullname)) {
            var_b96b2d290a5d5dbe.loadoutprimaryobject = makeweaponfromstring(var_b96b2d290a5d5dbe.loadoutprimaryfullname);
        }
        if (!isdefined(var_b96b2d290a5d5dbe.loadoutsecondaryobject) && isdefined(var_b96b2d290a5d5dbe.loadoutsecondaryfullname)) {
            var_b96b2d290a5d5dbe.loadoutsecondaryobject = makeweaponfromstring(var_b96b2d290a5d5dbe.loadoutsecondaryfullname);
        }
        if (!isdefined(var_b96b2d290a5d5dbe.var_cc881f2bd3565d22) && isdefined(var_b96b2d290a5d5dbe.var_e3f8e7ca9c87781f)) {
            var_b96b2d290a5d5dbe.var_cc881f2bd3565d22 = makeweaponfromstring(var_b96b2d290a5d5dbe.var_e3f8e7ca9c87781f);
        }
    }
    if (isdefined(var_b96b2d290a5d5dbe)) {
        if (classname == "gamemode") {
            var_92db85c8dcf21152 = loadout_getclassstruct();
            var_92db85c8dcf21152 = loadout_updateclass(var_92db85c8dcf21152, classname);
            var_94a93d61b8c3e782 = compareclassstructs(var_92db85c8dcf21152, var_b96b2d290a5d5dbe);
            if (!var_94a93d61b8c3e782) {
                var_92db85c8dcf21152.gamemodeforcednewloadout = 1;
                trytocacheclassstruct(var_92db85c8dcf21152, classname, var_fd84df04adead383);
                return var_92db85c8dcf21152;
            }
        }
        return var_b96b2d290a5d5dbe;
    }
    classstruct = loadout_getclassstruct();
    classstruct = loadout_updateclass(classstruct, classname);
    trytocacheclassstruct(classstruct, classname, var_fd84df04adead383);
    return classstruct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0e8
// Size: 0x2c
function loadout_getglobalclassstruct() {
    if (!isdefined(self.pers["globalLoadoutStruct"])) {
        loadout_updateglobalclassstruct();
    }
    return self.pers["globalLoadoutStruct"];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf11c
// Size: 0xb1
function loadout_updateglobalclassstruct() {
    struct = spawnstruct();
    struct.loadoutfieldupgrade1 = "none";
    struct.loadoutfieldupgrade2 = "none";
    if (!isagent(self)) {
        if (!isdefined(self.loadoutfieldupgrade1) && getdvarint(@"hash_a464cb031c16ee87", 0)) {
            if (getdvar(@"hash_953b8c504c0dd6f2", "") == "zm_t10") {
                struct.loadoutfieldupgrade1 = "super_aether_shroud";
            } else {
                struct.loadoutfieldupgrade1 = "super_trophy";
            }
        }
    }
    self.pers["globalLoadoutStruct"] = struct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1d4
// Size: 0x67
function loadout_editglobalclassstruct() {
    var_24e17785934294e8 = loadout_getglobalclassstruct();
    loadout_updateglobalclassstruct();
    var_b7c2ff3894e369a3 = loadout_getglobalclassstruct();
    if (var_24e17785934294e8.loadoutfieldupgrade1 != var_b7c2ff3894e369a3.loadoutfieldupgrade1) {
        return 1;
    }
    if (var_24e17785934294e8.loadoutfieldupgrade2 != var_b7c2ff3894e369a3.loadoutfieldupgrade2) {
        return 1;
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf243
// Size: 0x6f
function loadout_updateglobalclassgamemode(globalstruct, class) {
    gamemodeloadout = self.pers["gamemodeLoadout"];
    if (isdefined(gamemodeloadout)) {
        if (isdefined(gamemodeloadout["loadoutFieldUpgrade1"])) {
            globalstruct.loadoutfieldupgrade1 = gamemodeloadout["loadoutFieldUpgrade1"];
        }
        if (isdefined(gamemodeloadout["loadoutFieldUpgrade2"])) {
            globalstruct.loadoutfieldupgrade2 = gamemodeloadout["loadoutFieldUpgrade2"];
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2b9
// Size: 0x84
function loadout_editcachedclassstruct(classname) {
    var_fd84df04adead383 = loadout_getclasstype(classname);
    var_b96b2d290a5d5dbe = getcachedloadoutstruct(classname, var_fd84df04adead383);
    if (isdefined(var_b96b2d290a5d5dbe)) {
        var_92db85c8dcf21152 = loadout_getclassstruct();
        var_92db85c8dcf21152 = loadout_updateclass(var_92db85c8dcf21152, classname);
        var_94a93d61b8c3e782 = compareclassstructs(var_92db85c8dcf21152, var_b96b2d290a5d5dbe);
        if (!var_94a93d61b8c3e782) {
            var_92db85c8dcf21152.tweakedbyplayerduringmatch = 1;
            trytocacheclassstruct(var_92db85c8dcf21152, classname, var_fd84df04adead383);
            return 1;
        }
    }
    return 0;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf345
// Size: 0x6a
function getcachedloadoutstruct(classname, var_fd84df04adead383) {
    switch (var_fd84df04adead383) {
    case #"hash_412d4adaf2412dc0":
    case #"hash_44e999799ff10fce":
    case #"hash_7038dec66d8275be":
        if (!isdefined(self.pers["classCache"])) {
            break;
        }
        return self.pers["classCache"][classname];
        break;
    }
    return undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3b7
// Size: 0x55
function trytocacheclassstruct(classstruct, classname, var_fd84df04adead383) {
    switch (var_fd84df04adead383) {
    case #"hash_412d4adaf2412dc0":
    case #"hash_44e999799ff10fce":
    case #"hash_7038dec66d8275be":
        addclassstructtocache(classstruct, classname);
        break;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf413
// Size: 0x4d
function addclassstructtocache(classstruct, classname) {
    if (!isdefined(self.pers["classCache"])) {
        self.pers["classCache"][classname] = [];
    }
    self.pers["classCache"][classname] = classstruct;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf467
// Size: 0x31
function loadout_emptycacheofloadout(classname) {
    if (!isdefined(self.pers["classCache"])) {
        return;
    }
    self.pers["classCache"][classname] = undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf49f
// Size: 0x18
function loadout_gamemodeloadoutchanged() {
    self.pers["classCache"]["gamemode"] = undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4be
// Size: 0xa9
function copyclassfornextlife(otherplayer) {
    self setclientomnvar("ui_loadout_copied", gettime());
    thread _loadout_setcopyloadoutomvnaronspawn();
    loadout = undefined;
    if (isdefined(otherplayer.juggcontext) && isdefined(otherplayer.juggcontext.prevclassstruct)) {
        loadout = otherplayer.juggcontext.prevclassstruct;
    } else {
        loadout = otherplayer.classstruct;
    }
    self.pers["copiedClass"] = loadout_copyclassstruct(loadout);
    self.pers["lastKiller"] = otherplayer;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf56e
// Size: 0x27
function _loadout_setcopyloadoutomvnaronspawn() {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("spawned");
    self setclientomnvar("ui_loadout_changed", 13);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf59c
// Size: 0x10b
function loadout_fixcopiedclassstruct(var_23665705a38d7d0c, classstruct) {
    var_23665705a38d7d0c.loadoutsuper = classstruct.loadoutsuper;
    var_23665705a38d7d0c.loadoutstreaksfilled = classstruct.loadoutstreaksfilled;
    var_23665705a38d7d0c.loadoutstreaktype = classstruct.loadoutstreaktype;
    var_23665705a38d7d0c.loadoutkillstreak1 = classstruct.loadoutkillstreak1;
    var_23665705a38d7d0c.loadoutkillstreak2 = classstruct.loadoutkillstreak2;
    var_23665705a38d7d0c.loadoutkillstreak3 = classstruct.loadoutkillstreak3;
    var_23665705a38d7d0c.loadoutaccessoryweapon = classstruct.loadoutaccessoryweapon;
    var_23665705a38d7d0c.loadoutaccessorydata = classstruct.loadoutaccessorydata;
    var_23665705a38d7d0c.loadoutaccessorylogic = classstruct.loadoutaccessorylogic;
    var_23665705a38d7d0c.tweakedbyplayerduringmatch = 0;
    var_23665705a38d7d0c.gamemodeforcednewloadout = 0;
    var_23665705a38d7d0c.iscopiedclass = 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6ae
// Size: 0x49
function function_bae2a0b1db21cab9(weaponobj, skipfirstraise) {
    if (!isdefined(skipfirstraise)) {
        skipfirstraise = 0;
    }
    if (namespace_36f464722d326bbe::shouldskipfirstraise() && istrue(self.hasspawned)) {
        skipfirstraise = 1;
    }
    if (istrue(self.wassquadspawned)) {
        skipfirstraise = 1;
    }
    return skipfirstraise;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6ff
// Size: 0x9c
function respawnitems_saveplayeritemstostruct(var_56e2f00432ccdf01, var_b8750288d505bb24, var_f8ce8528a93f0a9f, var_6454c461f07b0789, var_d517ef3586612fc7) {
    respawnitems = spawnstruct();
    if (!isdefined(var_56e2f00432ccdf01) || var_56e2f00432ccdf01) {
        respawnitems_saveweapons(respawnitems);
    }
    if (!isdefined(var_b8750288d505bb24) || var_b8750288d505bb24) {
        respawnitems_saveequipmentitems(respawnitems);
    }
    if (!isdefined(var_f8ce8528a93f0a9f) || var_f8ce8528a93f0a9f) {
        respawnitems_savestreaks(respawnitems);
    }
    if (!isdefined(var_6454c461f07b0789) || var_6454c461f07b0789) {
        function_1a5ecf82792e6bb8(respawnitems);
    }
    if (!isdefined(var_d517ef3586612fc7) || var_d517ef3586612fc7) {
        respawnitems_savesuper(respawnitems);
    }
    return respawnitems;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7a3
// Size: 0x16
function respawnitems_assignrespawnitems(respawnitems) {
    self.respawnitems = respawnitems;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf7c0
// Size: 0xd
function respawnitems_hasrespawnitems() {
    return isdefined(self.respawnitems);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7d5
// Size: 0x1b
function respawnitems_getrespawnitems() {
    if (isdefined(self.respawnitems)) {
        return self.respawnitems;
    }
    return undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7f8
// Size: 0xd
function respawnitems_clear() {
    self.respawnitems = undefined;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf80c
// Size: 0x1fc
function respawnitems_saveweapons(respawnitems) {
    var_7682d2d8788db683 = [];
    var_5bc770e98fe2f25e = self.primaryweapons;
    var_b27047c65737f75b = self.currentweapon;
    foreach (weapon in var_5bc770e98fe2f25e) {
        if (iscacprimaryorsecondary(weapon)) {
            var_7682d2d8788db683[var_7682d2d8788db683.size] = weapon;
        }
    }
    /#
        assertex(var_7682d2d8788db683.size <= 2, "respawnItems_saveItems() - player has more than 2 CAC weapons. (Not handled)");
    #/
    if (isdefined(self.var_64a7c6d08000be36)) {
        var_7682d2d8788db683 = self.var_64a7c6d08000be36;
        self.var_64a7c6d08000be36 = undefined;
    }
    primaryweaponobj = undefined;
    if (isdefined(self.var_b43e8623c0dd6a67)) {
        primaryweaponobj = self.var_b43e8623c0dd6a67;
        self.var_b43e8623c0dd6a67 = undefined;
    } else if (isdefined(self.lastcacweaponobj) && self hasweapon(self.lastcacweaponobj)) {
        primaryweaponobj = self.lastcacweaponobj;
    } else if (iscacprimaryorsecondary(self.currentweapon)) {
        primaryweaponobj = self.currentweapon;
    } else if (var_7682d2d8788db683.size > 0) {
        primaryweaponobj = var_7682d2d8788db683[0];
    }
    if (isundefinedweapon(primaryweaponobj)) {
        primaryweaponobj = makeweapon("iw9_me_fists_mp");
    }
    respawnitems_saveweapon(primaryweaponobj, "primary", respawnitems);
    secondaryweaponobj = undefined;
    foreach (weapon in var_7682d2d8788db683) {
        if (!issameweapon(weapon, primaryweaponobj, 1)) {
            secondaryweaponobj = weapon;
            break;
        }
    }
    if (isdefined(secondaryweaponobj)) {
        respawnitems_saveweapon(secondaryweaponobj, "secondary", respawnitems);
    }
    /#
        function_58e92934b81cbc64(respawnitems);
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa0f
// Size: 0xcf
function respawnitems_saveweapon(weaponobj, weaponslot, respawnitems) {
    if (!isdefined(respawnitems.weapons)) {
        respawnitems.weapons = [];
    }
    weaponinfo = spawnstruct();
    respawnitems.weapons[weaponslot] = weaponinfo;
    weaponinfo.weaponobj = weaponobj;
    weaponinfo.clipammo = self getweaponammoclip(weaponobj);
    weaponinfo.stockammo = self getweaponammostock(weaponobj);
    if (weaponobj.hasalternate) {
        var_6890a4ce965bba99 = weaponobj getaltweapon();
        weaponinfo.altclipammo = self getweaponammoclip(var_6890a4ce965bba99);
        weaponinfo.altstockammo = self getweaponammostock(var_6890a4ce965bba99);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfae5
// Size: 0x116
function function_58e92934b81cbc64(respawnitems) {
    /#
        if (!isdefined(respawnitems.weapons)) {
            return;
        }
        /#
            assert(isdefined(respawnitems.weapons["loadoutSecondaryAddBlueprintAttachments"]) && isdefined(respawnitems.weapons["loadoutSecondaryAddBlueprintAttachments"].weaponobj) && isdefined(respawnitems.weapons["loadoutSecondaryAddBlueprintAttachments"].clipammo) && isdefined(respawnitems.weapons["loadoutSecondaryAddBlueprintAttachments"].stockammo));
        #/
        /#
            assert(!isdefined(respawnitems.weapons["ui_arena_secondaryVariantID"]) || isdefined(respawnitems.weapons["ui_arena_secondaryVariantID"].weaponobj) && isdefined(respawnitems.weapons["ui_arena_secondaryVariantID"].clipammo) && isdefined(respawnitems.weapons["ui_arena_secondaryVariantID"].stockammo));
        #/
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc02
// Size: 0x31
function respawnitems_saveequipmentitems(respawnitems) {
    respawnitems_saveequipment("primary", respawnitems);
    respawnitems_saveequipment("secondary", respawnitems);
    /#
        function_fddb6546d1d0bc28(respawnitems);
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc3a
// Size: 0xb1
function respawnitems_saveequipment(slot, respawnitems) {
    var_cb325ddb4a764623 = namespace_1a507865f681850e::getcurrentequipment(slot);
    if (!isdefined(var_cb325ddb4a764623)) {
        var_cb325ddb4a764623 = "none";
    }
    if (!isdefined(respawnitems.equipment)) {
        respawnitems.equipment = [];
    }
    var_9b83efba8bfecc3f = spawnstruct();
    respawnitems.equipment[slot] = var_9b83efba8bfecc3f;
    var_9b83efba8bfecc3f.item = var_cb325ddb4a764623;
    if (var_cb325ddb4a764623 != "none") {
        var_9b83efba8bfecc3f.ammo = namespace_1a507865f681850e::getequipmentammo(var_9b83efba8bfecc3f.item);
    } else {
        var_9b83efba8bfecc3f.ammo = 0;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfcf2
// Size: 0xd7
function function_fddb6546d1d0bc28(respawnitems) {
    /#
        if (!isdefined(respawnitems.equipment)) {
            return;
        }
        /#
            assert(!isdefined(respawnitems.equipment["loadoutSecondaryAddBlueprintAttachments"]) || isdefined(respawnitems.equipment["loadoutSecondaryAddBlueprintAttachments"].item) && isdefined(respawnitems.equipment["loadoutSecondaryAddBlueprintAttachments"].ammo));
        #/
        /#
            assert(!isdefined(respawnitems.equipment["ui_arena_secondaryVariantID"]) || isdefined(respawnitems.equipment["ui_arena_secondaryVariantID"].item) && isdefined(respawnitems.equipment["ui_arena_secondaryVariantID"].ammo));
        #/
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdd0
// Size: 0x118
function respawnitems_savestreaks(respawnitems) {
    streakstate = spawnstruct();
    streakstate.streaks = [];
    streakstate.streakpoints = self.streakpoints;
    if (!isdefined(self.streakpoints)) {
        return;
    }
    streakinfo = namespace_58a74e7d54b56e8d::getkillstreakinslot(1);
    if (isdefined(streakinfo)) {
        streakstate.streaks[streakstate.streaks.size] = streakinfo.streakname;
    }
    streakinfo = namespace_58a74e7d54b56e8d::getkillstreakinslot(2);
    if (isdefined(streakinfo)) {
        streakstate.streaks[streakstate.streaks.size] = streakinfo.streakname;
    }
    streakinfo = namespace_58a74e7d54b56e8d::getkillstreakinslot(3);
    if (isdefined(streakinfo)) {
        streakstate.streaks[streakstate.streaks.size] = streakinfo.streakname;
    }
    if (streakstate.streaks.size <= 0) {
        return;
    }
    respawnitems.streakstate = streakstate;
    /#
        function_18e339bfd7cb9efa(respawnitems);
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfeef
// Size: 0x79
function function_18e339bfd7cb9efa(respawnitems) {
    /#
        if (!isdefined(respawnitems.streakstate)) {
            return;
        }
        /#
            assert(isdefined(respawnitems.streakstate.streakpoints));
        #/
        /#
            assert(isdefined(respawnitems.streakstate.streaks) && respawnitems.streakstate.streaks.size > 0);
        #/
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff6f
// Size: 0x130
function function_1a5ecf82792e6bb8(respawnitems) {
    var_239fb3af0cf6eeb2 = spawnstruct();
    respawnitems.var_239fb3af0cf6eeb2 = var_239fb3af0cf6eeb2;
    var_239fb3af0cf6eeb2.loadoutperks = self.loadoutperks;
    var_239fb3af0cf6eeb2.var_15f3e6df722fb1cf = self.var_15f3e6df722fb1cf;
    var_239fb3af0cf6eeb2.var_15f3e5df722faf9c = self.var_15f3e5df722faf9c;
    var_239fb3af0cf6eeb2.loadoutstandardperks = self.pers["loadoutStandardPerks"];
    var_239fb3af0cf6eeb2.loadoutextraperks = self.pers["loadoutExtraPerks"];
    var_239fb3af0cf6eeb2.loadoutrigtrait = self.pers["loadoutRigTrait"];
    var_239fb3af0cf6eeb2.loadoutusingspecialist = self.pers["loadoutUsingSpecialist"];
    var_239fb3af0cf6eeb2.perkpackageprogress = self.pers["perkPackageProgress"];
    var_239fb3af0cf6eeb2.perkpackagetier2earned = self.pers["perkPackageTier2Earned"];
    var_239fb3af0cf6eeb2.perkpackagetier3state = self.pers["perkPackageTier3State"];
    /#
        function_f1babd693e0a8c44(respawnitems);
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x100a6
// Size: 0x145
function function_f1babd693e0a8c44(respawnitems) {
    /#
        if (!isdefined(respawnitems.var_239fb3af0cf6eeb2)) {
            return;
        }
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7() && getdvarint(@"hash_48587f2cfa448879", 1) == 1) {
            return;
        }
        /#
            assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.loadoutperks));
        #/
        /#
            assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.loadoutstandardperks));
        #/
        /#
            assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.loadoutextraperks));
        #/
        /#
            assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.loadoutrigtrait));
        #/
        /#
            assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.loadoutusingspecialist));
        #/
        if (istrue(level.var_606eb45e074ff204)) {
            /#
                assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.perkpackageprogress));
            #/
            /#
                assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.perkpackagetier2earned));
            #/
            /#
                assert(isdefined(respawnitems.var_239fb3af0cf6eeb2.perkpackagetier3state));
            #/
        }
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101f2
// Size: 0xc5
function respawnitems_savesuper(respawnitems) {
    var_ebec497ff8b18a45 = namespace_85d036cb78063c4a::getcurrentsuperref();
    if (!isdefined(var_ebec497ff8b18a45)) {
        return;
    }
    superstate = spawnstruct();
    respawnitems.superstate = superstate;
    superstate.super = var_ebec497ff8b18a45;
    superstate.superpoints = namespace_85d036cb78063c4a::getcurrentsuperbasepoints();
    superstate.extrapoints = namespace_85d036cb78063c4a::getcurrentsuperextrapoints();
    if (var_ebec497ff8b18a45 == "super_select") {
        var_d3c112e63bf53ee5 = namespace_85d036cb78063c4a::getcurrentsuper();
        superstate.firstupgrade = var_d3c112e63bf53ee5.firstupgrade;
        superstate.secondupgrade = var_d3c112e63bf53ee5.secondupgrade;
    }
    /#
        function_6f401b52c8322c1b(respawnitems);
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102be
// Size: 0xd8
function function_6f401b52c8322c1b(respawnitems) {
    /#
        if (!isdefined(respawnitems.superstate)) {
            return;
        }
        /#
            assert(isdefined(respawnitems.superstate.super));
        #/
        /#
            assert(isdefined(respawnitems.superstate.superpoints));
        #/
        /#
            assert(isdefined(respawnitems.superstate.extrapoints));
        #/
        if (respawnitems.superstate.super == "loadoutFieldUpgrade2") {
            /#
                assert(isdefined(respawnitems.superstate.firstupgrade));
            #/
            /#
                assert(isdefined(respawnitems.superstate.secondupgrade));
            #/
        }
    #/
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1039d
// Size: 0x1f
function respawnitems_hasweapondata(respawnitems) {
    if (!isdefined(respawnitems)) {
        return 0;
    }
    return isdefined(respawnitems.weapons);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103c4
// Size: 0x2b
function respawnitems_getweaponobj(respawnitems, weaponslot) {
    return respawnitems.weapons[weaponslot].weaponobj;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103f7
// Size: 0xc5
function respawnitems_giveweaponammo(respawnitems, weaponslot) {
    weaponinfo = respawnitems.weapons[weaponslot];
    if (!isdefined(weaponinfo)) {
        return;
    }
    self setweaponammoclip(weaponinfo.weaponobj, weaponinfo.clipammo);
    self setweaponammostock(weaponinfo.weaponobj, weaponinfo.stockammo);
    if (weaponinfo.weaponobj.hasalternate) {
        var_6890a4ce965bba99 = weaponinfo.weaponobj getaltweapon();
        self setweaponammoclip(var_6890a4ce965bba99, weaponinfo.altclipammo);
        self setweaponammostock(var_6890a4ce965bba99, weaponinfo.altstockammo);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104c3
// Size: 0x1f
function respawnitems_hasequipmentdata(respawnitems) {
    if (!isdefined(respawnitems)) {
        return 0;
    }
    return isdefined(respawnitems.equipment);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104ea
// Size: 0x2b
function respawnitems_getequipmentref(respawnitems, slot) {
    return respawnitems.equipment[slot].item;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1051d
// Size: 0x6a
function respawnitems_giveequipmentammo(respawnitems, slot) {
    item = respawnitems_getequipmentref(respawnitems, slot);
    if (!isdefined(item) || item == "none") {
        return;
    }
    ammo = respawnitems.equipment[slot].ammo;
    if (!isdefined(ammo)) {
        return;
    }
    namespace_1a507865f681850e::setequipmentammo(item, ammo);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1058e
// Size: 0x1f
function respawnitems_hasstreakdata(respawnitems) {
    if (!isdefined(respawnitems)) {
        return 0;
    }
    return isdefined(respawnitems.streakstate);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x105b5
// Size: 0x21
function respawnitems_getstreakpoints(respawnitems) {
    return respawnitems.streakstate.streakpoints;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105de
// Size: 0x21
function respawnitems_getstreaks(respawnitems) {
    return respawnitems.streakstate.streaks;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10607
// Size: 0x1f
function function_b19856925ddabd5a(respawnitems) {
    if (!isdefined(respawnitems)) {
        return 0;
    }
    return isdefined(respawnitems.var_239fb3af0cf6eeb2);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1062e
// Size: 0x21
function function_40a3148d5514ffa3(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.loadoutperks;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10657
// Size: 0x21
function function_dc2f8c385699a6e8(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.var_15f3e6df722fb1cf;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10680
// Size: 0x21
function function_dc2f8d385699a91b(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.var_15f3e5df722faf9c;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106a9
// Size: 0x21
function function_64d9f4542fdd7b14(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.loadoutstandardperks;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106d2
// Size: 0x21
function function_dc35cb143c497599(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.loadoutextraperks;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106fb
// Size: 0x21
function function_7f47875b5fd88f24(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.loadoutrigtrait;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10724
// Size: 0x21
function function_eba2981fa45ae3bf(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.loadoutusingspecialist;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1074d
// Size: 0x21
function function_33e44385e17eecc1(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.perkpackageprogress;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10776
// Size: 0x21
function function_7af26fc564e26a5f(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.perkpackagetier2earned;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1079f
// Size: 0x21
function function_7d2ba1e36afe24b0(respawnitems) {
    return respawnitems.var_239fb3af0cf6eeb2.perkpackagetier3state;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107c8
// Size: 0x1f
function respawnitems_hassuperdata(respawnitems) {
    if (!isdefined(respawnitems)) {
        return 0;
    }
    return isdefined(respawnitems.superstate);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107ef
// Size: 0x21
function respawnitems_getsuperref(respawnitems) {
    return respawnitems.superstate.super;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10818
// Size: 0x21
function respawnitems_getsuperpoints(respawnitems) {
    return respawnitems.superstate.superpoints;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10841
// Size: 0x21
function respawnitems_getsuperextrapoints(respawnitems) {
    return respawnitems.superstate.extrapoints;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1086a
// Size: 0x65
function function_2f17741f5c15a7d6(respawnitems) {
    if (respawnitems_getsuperref(respawnitems) == "super_select") {
        return [0:respawnitems.superstate.firstupgrade, 1:respawnitems.superstate.secondupgrade];
    }
    return [0:respawnitems_getsuperref(respawnitems), 1:"none"];
}

// Namespace class/namespace_d19129e4fa5d176
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108d7
// Size: 0x15f
function spawnammocountoverride_giveweaponammo(weaponobj, weaponslot, var_10b09490bb78e90e) {
    weaponinfo = weaponobj;
    var_640c8b74fc979400 = !var_10b09490bb78e90e;
    if (var_640c8b74fc979400 && !ismeleeweapon(weaponobj)) {
        clipsize = 0;
        var_96f765c1bfec9e65 = 0;
        if (weaponobj.isdualwield) {
            self setweaponammoclip(weaponinfo, clipsize, "left");
        }
    } else {
        clipsize = weaponinfo.clipsize;
        var_96f765c1bfec9e65 = var_10b09490bb78e90e - 1;
    }
    if (var_10b09490bb78e90e == 7) {
        var_96f765c1bfec9e65 = weaponmaxammo(weaponinfo);
    } else if (issubstr(weaponinfo.basename, "iw8_sh_charlie725") && !var_640c8b74fc979400) {
        var_96f765c1bfec9e65 = weaponinfo.clipsize * var_96f765c1bfec9e65 + 18;
    } else {
        var_96f765c1bfec9e65 = weaponinfo.clipsize * var_96f765c1bfec9e65;
    }
    self setweaponammoclip(weaponinfo, clipsize);
    self setweaponammostock(weaponinfo, var_96f765c1bfec9e65);
    if (weaponobj.hasalternate) {
        var_6890a4ce965bba99 = weaponobj getaltweapon();
        if (var_640c8b74fc979400) {
            altclipammo = 0;
            altstockammo = 0;
        } else {
            altclipammo = self getweaponammoclip(var_6890a4ce965bba99);
            altstockammo = self getweaponammostock(var_6890a4ce965bba99);
        }
        self setweaponammoclip(var_6890a4ce965bba99, altclipammo);
        self setweaponammostock(var_6890a4ce965bba99, altstockammo);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a3d
// Size: 0x73
function ismeleeweapon(objweapon) {
    ismeleeweapon = isknifeonly(objweapon.basename) || isakimbomeleeweapon(objweapon.basename) || isaxeweapon(objweapon.basename) || ismeleeoverrideweapon(objweapon) || isriotshield(objweapon.basename);
    return ismeleeweapon;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ab8
// Size: 0x53c
function compareclassstructs(var_fd10cbc8e506f14e, var_fd10cac8e506ef1b) {
    if (var_fd10cbc8e506f14e.loadoutarchetype != var_fd10cac8e506ef1b.loadoutarchetype) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutprimary != var_fd10cac8e506ef1b.loadoutprimary) {
        return 0;
    }
    if (!checkclassstructarray(var_fd10cbc8e506f14e.loadoutprimaryattachments, var_fd10cac8e506ef1b.loadoutprimaryattachments)) {
        return 0;
    }
    if (!checkclassstructarray(var_fd10cbc8e506f14e.loadoutprimaryattachmentids, var_fd10cac8e506ef1b.loadoutprimaryattachmentids)) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutprimarycamo != var_fd10cac8e506ef1b.loadoutprimarycamo) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutprimaryreticle != var_fd10cac8e506ef1b.loadoutprimaryreticle) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutprimarylootitemid != var_fd10cac8e506ef1b.loadoutprimarylootitemid) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutprimaryvariantid != var_fd10cac8e506ef1b.loadoutprimaryvariantid) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutprimarycosmeticattachment != var_fd10cac8e506ef1b.loadoutprimarycosmeticattachment) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutsecondary != var_fd10cac8e506ef1b.loadoutsecondary) {
        return 0;
    }
    if (!checkclassstructarray(var_fd10cbc8e506f14e.loadoutsecondaryattachments, var_fd10cac8e506ef1b.loadoutsecondaryattachments)) {
        return 0;
    }
    if (!checkclassstructarray(var_fd10cbc8e506f14e.loadoutsecondaryattachmentids, var_fd10cac8e506ef1b.loadoutsecondaryattachmentids)) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutsecondarycamo != var_fd10cac8e506ef1b.loadoutsecondarycamo) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutsecondaryreticle != var_fd10cac8e506ef1b.loadoutsecondaryreticle) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutsecondarylootitemid != var_fd10cac8e506ef1b.loadoutsecondarylootitemid) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutsecondaryvariantid != var_fd10cac8e506ef1b.loadoutsecondaryvariantid) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutsecondarycosmeticattachment != var_fd10cac8e506ef1b.loadoutsecondarycosmeticattachment) {
        return 0;
    }
    if (istrue(level.var_9e090a159cb48220)) {
        if (!checkclassstructarray(var_fd10cbc8e506f14e.var_494870a5978b5a09, var_fd10cac8e506ef1b.var_494870a5978b5a09)) {
            return 0;
        }
        if (!checkclassstructarray(var_fd10cbc8e506f14e.var_6bfdc660c23f71ea, var_fd10cac8e506ef1b.var_6bfdc660c23f71ea)) {
            return 0;
        }
        if (var_fd10cbc8e506f14e.loadouttertiarycamo != var_fd10cac8e506ef1b.loadouttertiarycamo) {
            return 0;
        }
        if (var_fd10cbc8e506f14e.loadouttertiaryreticle != var_fd10cac8e506ef1b.loadouttertiaryreticle) {
            return 0;
        }
        if (var_fd10cbc8e506f14e.var_64e57707d385a2f5 != var_fd10cac8e506ef1b.var_64e57707d385a2f5) {
            return 0;
        }
        if (var_fd10cbc8e506f14e.loadouttertiaryvariantid != var_fd10cac8e506ef1b.loadouttertiaryvariantid) {
            return 0;
        }
        if (var_fd10cbc8e506f14e.var_372f30ef6d6882ab != var_fd10cac8e506ef1b.var_372f30ef6d6882ab) {
            return 0;
        }
    }
    if (!checkclassstructarray(var_fd10cbc8e506f14e.loadoutperks, var_fd10cac8e506ef1b.loadoutperks)) {
        return 0;
    }
    if (!checkclassstructarray(var_fd10cbc8e506f14e.loadoutstandardperks, var_fd10cac8e506ef1b.loadoutstandardperks)) {
        return 0;
    }
    if (!checkclassstructarray(var_fd10cbc8e506f14e.loadoutextraperks, var_fd10cac8e506ef1b.loadoutextraperks)) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutusingspecialist != var_fd10cac8e506ef1b.loadoutusingspecialist) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutmeleeslot != var_fd10cac8e506ef1b.loadoutmeleeslot) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutperksfromgamemode != var_fd10cac8e506ef1b.loadoutperksfromgamemode) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutrigtrait != var_fd10cac8e506ef1b.loadoutrigtrait) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutequipmentprimary != var_fd10cac8e506ef1b.loadoutequipmentprimary) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.var_b68e3a0a9c628d23 != var_fd10cac8e506ef1b.var_b68e3a0a9c628d23) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutextraequipmentprimary != var_fd10cac8e506ef1b.loadoutextraequipmentprimary) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutequipmentsecondary != var_fd10cac8e506ef1b.loadoutequipmentsecondary) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.var_a1dfc5ce15795a3 != var_fd10cac8e506ef1b.var_a1dfc5ce15795a3) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutextraequipmentsecondary != var_fd10cac8e506ef1b.loadoutextraequipmentsecondary) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutfieldupgrade1 != var_fd10cac8e506ef1b.loadoutfieldupgrade1) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutfieldupgrade2 != var_fd10cac8e506ef1b.loadoutfieldupgrade2) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutgesture != var_fd10cac8e506ef1b.loadoutgesture) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutstreaksfilled != var_fd10cac8e506ef1b.loadoutstreaksfilled) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutstreaktype != var_fd10cac8e506ef1b.loadoutstreaktype) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutkillstreak1 != var_fd10cac8e506ef1b.loadoutkillstreak1) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutkillstreak2 != var_fd10cac8e506ef1b.loadoutkillstreak2) {
        return 0;
    }
    if (var_fd10cbc8e506f14e.loadoutkillstreak3 != var_fd10cac8e506ef1b.loadoutkillstreak3) {
        return 0;
    }
    return 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ffc
// Size: 0x78
function checkclassstructarray(var_4f6fc34f222a98e1, var_4f6fc04f222a9248) {
    if (var_4f6fc34f222a98e1.size != var_4f6fc04f222a9248.size) {
        return 0;
    }
    foreach (key, value in var_4f6fc34f222a98e1) {
        if (!isdefined(var_4f6fc04f222a9248[key])) {
            return 0;
        }
        if (var_4f6fc04f222a9248[key] != value) {
            return 0;
        }
    }
    return 1;
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1107c
// Size: 0x33
function blockclasschange() {
    ent_flag_init("swapLoadout_blocked");
    ent_flag_init("swapLoadout_pending");
    ent_flag_init("swapLoadout_complete");
    ent_flag_set("swapLoadout_blocked");
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110b6
// Size: 0x33
function unblockclasschange() {
    self endon("death_or_disconnect");
    if (ent_flag_exist("swapLoadout_blocked") && ent_flag("swapLoadout_blocked")) {
        ent_flag_clear("swapLoadout_blocked");
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110f0
// Size: 0xfc
function function_c5ce8711741e44b8() {
    if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
        self setcamerathirdperson(0);
        thread restoregameplaythirdperson();
    } else if (istrue(self.var_9e3bdda27a519a9f)) {
        self setcamerathirdperson(1);
    } else if (istrue(self.liveragdoll)) {
        self setcamerathirdperson(1);
    } else {
        switch (level.thirdpersonmode) {
        case 1:
            self setcamerathirdperson(1);
            break;
        case 2:
            self setcamerathirdperson(self.team == "allies");
            break;
        case 3:
            self setcamerathirdperson(self.team == "axis");
            break;
        default:
            if (!istrue(level.var_6bec823e343dacea)) {
                self setcamerathirdperson(0);
            }
            break;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111f3
// Size: 0x2c
function restoregameplaythirdperson() {
    self endon("death_or_disconnect");
    self notify("restoreGameplayThirdPerson");
    self endon("restoreGameplayThirdPerson");
    gameflagwait("prematch_done");
    function_c5ce8711741e44b8();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11226
// Size: 0x8
function alwaysgamemodeclass() {
    return "gamemode";
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11236
// Size: 0x82
function function_a16868d4dcd81a4b() {
    self setclientomnvar("ui_skip_loadout", 1);
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self.lastclass = self.pers["lastClass"];
    if (isbot(self)) {
        self.classcallback = "gamemode";
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112bf
// Size: 0x111
function function_286b27e21ed2cf0c() {
    self endon("death_or_disconnect");
    self endon("game_ended");
    var_68a1bcd6d4d1978c = self.laststance;
    while (1) {
        if (var_68a1bcd6d4d1978c != self.laststance && self.laststance == "prone") {
            timer = 0;
            var_e04b4ccb1dfc6b18 = 0;
            var_a1620866eed6b2de = 0;
            var_19067c8c80afb50 = 25;
            if (var_68a1bcd6d4d1978c == "stand") {
                timer = 0.68;
                var_e04b4ccb1dfc6b18 = 0.4;
                var_a1620866eed6b2de = 0.6;
            } else if (var_68a1bcd6d4d1978c == "crouch") {
                timer = 0.35;
                var_e04b4ccb1dfc6b18 = 0.3;
                var_a1620866eed6b2de = 0.5;
            }
            thread function_32397139046948fc(timer, var_e04b4ccb1dfc6b18, var_a1620866eed6b2de, var_19067c8c80afb50);
            var_e9d7f01676217b00 = timer / 3;
            setrecoilscale(-15);
            wait(var_e9d7f01676217b00);
            setrecoilscale(-15);
            wait(var_e9d7f01676217b00);
            setrecoilscale(-15);
            wait(var_e9d7f01676217b00);
            setrecoilscale(45);
        }
        var_68a1bcd6d4d1978c = self.laststance;
        waitframe();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113d7
// Size: 0x47
function function_32397139046948fc(timedelay, _scale, var_2a4ded5f8588e496, var_176c1e7e3d86bbc8) {
    self endon("death_or_disconnect");
    self endon("game_ended");
    wait(timedelay);
    self earthquakeforplayer(_scale, var_2a4ded5f8588e496, self.origin, var_176c1e7e3d86bbc8);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11425
// Size: 0x4f
function function_222538ff1074a754(_time, _scale) {
    self endon("death_or_disconnect");
    self endon("game_ended");
    if (!gameflag("prematch_done")) {
        level waittill("prematch_over");
    }
    wait(0.3);
    self setmovespeedscale(_scale);
    wait(_time);
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1147b
// Size: 0xe6
function function_1efc9881377752ac(var_740fb89f7c4097d1) {
    self endon("death_or_disconnect");
    self endon("game_ended");
    while (!isdefined(self.team)) {
        waitframe();
    }
    while (!isdefined(getotherteam(self.team))) {
        waitframe();
    }
    while (!isalive(self)) {
        waitframe();
    }
    waitframe();
    switch (var_740fb89f7c4097d1) {
    case 2:
        namespace_cbd3754a0c69cc63::outlineenableforteam(self, self.team, "jup_teammate_outline", "lowest");
        break;
    case 1:
        namespace_cbd3754a0c69cc63::outlineenableforteam(self, self.team, "jup_teammate_outline_beforetrans", "lowest");
        break;
    case 3:
        namespace_cbd3754a0c69cc63::outlineenableforteam(self, self.team, "jup_teammate_outline_nodistance", "lowest");
        break;
    default:
        break;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11568
// Size: 0x12d
function function_f3ee15ceb4922f2(var_c913859735abb981) {
    self endon("death_or_disconnect");
    self endon("game_ended");
    while (!isdefined(self.team)) {
        waitframe();
    }
    while (!isdefined(getotherteam(self.team))) {
        waitframe();
    }
    while (!isalive(self)) {
        waitframe();
    }
    waitframe();
    var_d44b7b1a5d0e8f39 = getotherteam(self.team);
    foreach (team in var_d44b7b1a5d0e8f39) {
        switch (var_c913859735abb981) {
        case 1:
            namespace_cbd3754a0c69cc63::outlineenableforteam(self, team, "jup_enemy_outline", "lowest");
            break;
        case 2:
            namespace_cbd3754a0c69cc63::outlineenableforteam(self, team, "jup_enemy_outline_beforetrans", "lowest");
            break;
        case 3:
            namespace_cbd3754a0c69cc63::outlineenableforteam(self, team, "jup_enemy_outline_nodistance", "lowest");
            break;
        default:
            break;
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1169c
// Size: 0x116
function function_866622357ab7abae() {
    self endon("death_or_disconnect");
    self endon("game_ended");
    var_b6113f673c358828 = 1100;
    var_31c162c014de780f = 0;
    var_5b040c05d821c54e = 0;
    var_172bca13bc22f2c2 = 0;
    while (1) {
        if (self sprintbuttonpressed() && !var_172bca13bc22f2c2) {
            var_172bca13bc22f2c2 = 1;
            var_8688305e20be67c8 = self getleftsticky();
            var_e6b931eec6ea0e5 = self getleftstickx();
            if (!var_5b040c05d821c54e && self sprintbuttonpressed() && self isonground() && var_8688305e20be67c8 < 0.15 && !(var_8688305e20be67c8 == 0 && var_e6b931eec6ea0e5 == 0)) {
                var_5b040c05d821c54e = 1;
                self.var_4d20a0d53cfa029 = function_c6071a6e72a4f025(308, 294, 100, 4);
                self.var_4d20a0d53cfa029 updatebar(0, 0.909091);
                wait(1.2);
                self.var_4d20a0d53cfa029 destroyelem();
                var_5b040c05d821c54e = 0;
            }
        }
        if (var_172bca13bc22f2c2 && self sprintbuttonpressed() == 0) {
            var_172bca13bc22f2c2 = 0;
        }
        wait(0.05);
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117b9
// Size: 0x13d
function monitorstowedriotshieldspeed() {
    self endon("death_or_disconnect");
    self endon("game_ended");
    self notify("monitorStowedRiotshieldSpeed");
    self endon("monitorStowedRiotshieldSpeed");
    while (1) {
        self waittill("weapon_change");
        waitframe();
        if (istrue(self.isjuggernaut) || istrue(self.isjuggernautrecon)) {
            continue;
        }
        self.var_8f81da056a13679e = 0;
        if (isdefined(self.weaponlist)) {
            foreach (weap in self.weaponlist) {
                if (weap == self.currentprimaryweapon && issubstr(weap.basename, "riotshield")) {
                    continue;
                }
                if (issubstr(weap.basename, "riotshield")) {
                    var_d9dce4d225162eb4 = getdvarfloat(@"hash_ed3656881cc512d9", 0.9);
                    self setmovespeedscale(var_d9dce4d225162eb4);
                    self.var_8f81da056a13679e = 1;
                }
            }
        }
        if (!istrue(self.var_8f81da056a13679e)) {
            self setmovespeedscale(1);
        }
        waitframe();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118fd
// Size: 0x33
function function_da27e3343b019fde() {
    return isdefined(level.var_dd07587af7d0ec5e) && level.var_dd07587af7d0ec5e != "" && level.var_dd07587af7d0ec5e != "none";
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11938
// Size: 0xd9
function function_c19397c712573e87(player) {
    usingpistol = 0;
    var_8b95cef36cc88f1 = 0;
    var_19879fe5885f9498 = 0;
    var_edb6c01f47321941 = 0;
    while (1) {
        if (usingpistol && !player function_415fe9eeca7b2e2b() && !player isonladder() && !player function_6f55d55ccff20d14()) {
            usingpistol = 0;
            var_8b95cef36cc88f1 = 1;
            var_19879fe5885f9498 = gettime() + level.var_6ff4dcd4533c4a93 - var_edb6c01f47321941;
        } else if (!usingpistol && (player function_415fe9eeca7b2e2b() || player isonladder() || player function_6f55d55ccff20d14())) {
            if (var_19879fe5885f9498 > gettime()) {
                var_edb6c01f47321941 = var_19879fe5885f9498 - gettime();
            } else {
                var_edb6c01f47321941 = 0;
            }
            var_8b95cef36cc88f1 = 0;
            usingpistol = 1;
        }
        if (var_8b95cef36cc88f1 && var_19879fe5885f9498 < gettime()) {
            break;
        }
        waitframe();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a18
// Size: 0xda
function function_1ca935941daaf046(weaponobj) {
    self endon("death_or_disconnect");
    waittillframeend();
    self endon("giveLoadout");
    while (1) {
        function_c19397c712573e87(self);
        clipsize = weaponclipsize(weaponobj);
        ammo = self getweaponammoclip(weaponobj);
        var_c1192c297bbf292f = 0;
        if (ammo < clipsize) {
            if (isdefined(level.var_d95b39e262c1049a)) {
                var_31b36738ff4eacd = self [[ level.var_d95b39e262c1049a ]](weaponobj);
            } else {
                var_31b36738ff4eacd = self getweaponammostock(weaponobj);
            }
            var_c1192c297bbf292f = var_c1192c297bbf292f + clipsize - ammo;
            if (var_c1192c297bbf292f > var_31b36738ff4eacd) {
                var_c1192c297bbf292f = var_31b36738ff4eacd;
            }
            if (var_c1192c297bbf292f > 0) {
                self setweaponammoclip(weaponobj, clipsize);
                if (isdefined(level.var_f1659f4dcd686291)) {
                    self [[ level.var_f1659f4dcd686291 ]](weaponobj, var_c1192c297bbf292f);
                } else {
                    self setweaponammostock(weaponobj, var_31b36738ff4eacd - var_c1192c297bbf292f);
                }
            }
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11af9
// Size: 0xf2
function function_c8d94b3795b095d4(var_d792416e0edaee34) {
    player = self;
    player endon("death_or_disconnect");
    waittillframeend();
    player endon("giveLoadout");
    player enableweaponpickup();
    player function_9db12c3737627ac7();
    var_a3661cffa8311604 = spawnstruct();
    var_a3661cffa8311604.isunderwater = 0;
    var_a3661cffa8311604.var_5996df3d783693e8 = undefined;
    var_a3661cffa8311604.backuppistol = var_d792416e0edaee34;
    while (1) {
        if (player function_6f55d55ccff20d14()) {
            if (!var_a3661cffa8311604.isunderwater) {
                var_a3661cffa8311604.isunderwater = 1;
                player function_415e5061f6389e8a(var_a3661cffa8311604);
                player thread function_7f1c954f80ee4bb9(var_a3661cffa8311604);
            }
        } else if (var_a3661cffa8311604.isunderwater) {
            player notify("player_backup_pistol_surfaced");
            player function_7d89af78724b2cb8(var_a3661cffa8311604);
            var_a3661cffa8311604.isunderwater = 0;
            var_a3661cffa8311604.var_902575cfc6aa32c1 = 0;
            var_a3661cffa8311604.var_5996df3d783693e8 = undefined;
        }
        waitframe();
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bf2
// Size: 0xcf
function function_415e5061f6389e8a(var_a3661cffa8311604) {
    player = self;
    player disableweaponpickup();
    player function_9db12c3737627ac7();
    var_a3661cffa8311604.var_5996df3d783693e8 = player getcurrentprimaryweapon();
    var_929540bb89d0a925 = var_a3661cffa8311604.backuppistol;
    foreach (weap in player.primaryweapons) {
        if (weap != var_a3661cffa8311604.backuppistol && weaponclass(weap) == "pistol") {
            var_929540bb89d0a925 = weap;
            break;
        }
    }
    player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(var_929540bb89d0a925, 0, 1);
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11cc8
// Size: 0xb2
function function_93d99d806146e8d7(var_a3661cffa8311604) {
    player = self;
    if (!isdefined(var_a3661cffa8311604.var_5996df3d783693e8) || var_a3661cffa8311604.backuppistol == var_a3661cffa8311604.var_5996df3d783693e8) {
        foreach (weap in player.primaryweapons) {
            if (weap != var_a3661cffa8311604.backuppistol) {
                var_a3661cffa8311604.var_5996df3d783693e8 = weap;
                break;
            }
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d81
// Size: 0x9a
function function_7d89af78724b2cb8(var_a3661cffa8311604) {
    player = self;
    var_820724b64fc1515 = player getcurrentprimaryweapon();
    player enableweaponpickup();
    player function_9db12c3737627ac7();
    if (!isdefined(var_820724b64fc1515) || var_a3661cffa8311604.backuppistol == var_820724b64fc1515) {
        player function_93d99d806146e8d7(var_a3661cffa8311604);
        result = 0;
        while (!result) {
            result = player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(var_a3661cffa8311604.var_5996df3d783693e8, 0, 1);
            if (!result) {
                waitframe();
                player function_93d99d806146e8d7(var_a3661cffa8311604);
            }
        }
        var_a3661cffa8311604.var_5996df3d783693e8 = undefined;
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e22
// Size: 0x120
function function_7f1c954f80ee4bb9(var_a3661cffa8311604) {
    player = self;
    player endon("giveLoadout");
    player endon("death_or_disconnect");
    player endon("player_backup_pistol_surfaced");
    var_9d18b2fd550333 = getdvarint(@"hash_5eb644efd8a6bf0b", 7);
    var_7d93ddf544fcc473 = 0;
    while (1) {
        var_820724b64fc1515 = player getcurrentprimaryweapon();
        if (weaponclass(var_820724b64fc1515) != "pistol") {
            player enableweaponpickup();
            player function_65905adc3194c79e();
            var_7d93ddf544fcc473 = 1;
        } else {
            player function_9db12c3737627ac7();
        }
        if (!var_7d93ddf544fcc473) {
            var_7d93ddf544fcc473 = 0;
            msg = player waittill_any_in_array_return([0:"weapon_switch_done", 1:"weapon_change", 2:"weapon_change_complete"]);
        } else {
            msg = player waittill_any_in_array_or_timeout([0:"damage", 1:"weapon_switch_done", 2:"weapon_change", 3:"weapon_change_complete"], var_9d18b2fd550333);
            if (msg == "timeout" || msg == "damage") {
                player function_415e5061f6389e8a(var_a3661cffa8311604);
            }
        }
    }
}

// Namespace class/namespace_d19129e4fa5d176
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f49
// Size: 0x56
function function_c782e5bc12dc2966() {
    var_1afed0877937f203 = self getcurrentprimaryweapon();
    if (isdefined(self.classstruct) && isdefined(self.classstruct.var_91e10e152b08ec1d) && isdefined(var_1afed0877937f203)) {
        return (var_1afed0877937f203 == self.classstruct.var_91e10e152b08ec1d);
    }
    return 0;
}

