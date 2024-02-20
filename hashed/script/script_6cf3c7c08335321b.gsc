// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\mp\class.gsc;

#namespace namespace_adb7b959cd708574;

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0xd
function function_907a472bb2ab01e() {
    level.var_c1154388bad688d8 = [];
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce
// Size: 0x7a
function function_aea2aa66a0043475() {
    playerentnum = self getentitynumber();
    if (!isdefined(level.var_c1154388bad688d8[playerentnum])) {
        level.var_c1154388bad688d8[playerentnum] = spawnstruct();
    }
    function_fd0efa5a567ad260(playerentnum);
    function_870ae5df493cb4ad(playerentnum);
    level.var_c1154388bad688d8[playerentnum].perks = [];
    level.var_c1154388bad688d8[playerentnum].perks = self.loadoutperks;
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34f
// Size: 0x113
function function_fd0efa5a567ad260(playerentnum) {
    level.var_c1154388bad688d8[playerentnum].weapons = [];
    for (weaponid = 0; weaponid < self.primaryweapons.size; weaponid++) {
        level.var_c1154388bad688d8[playerentnum].weapons[weaponid] = spawnstruct();
        level.var_c1154388bad688d8[playerentnum].weapons[weaponid].weapon = self.primaryweapons[weaponid];
        level.var_c1154388bad688d8[playerentnum].weapons[weaponid].ammostock = self getweaponammostock(self.primaryweapons[weaponid]);
        level.var_c1154388bad688d8[playerentnum].weapons[weaponid].ammoclip = self getweaponammoclip(self.primaryweapons[weaponid]);
    }
    level.var_c1154388bad688d8[playerentnum].currentweapon = self.currentweapon;
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x469
// Size: 0x16b
function function_870ae5df493cb4ad(playerentnum) {
    level.var_c1154388bad688d8[playerentnum].equipment = [];
    if (isdefined(self.equipment["primary"])) {
        level.var_c1154388bad688d8[playerentnum].equipment["primary"] = spawnstruct();
        level.var_c1154388bad688d8[playerentnum].equipment["primary"].equipment = self.equipment["primary"];
        level.var_c1154388bad688d8[playerentnum].equipment["primary"].ammo = getequipmentammo(self.equipment["primary"]);
    }
    if (isdefined(self.equipment["secondary"])) {
        level.var_c1154388bad688d8[playerentnum].equipment["secondary"] = spawnstruct();
        level.var_c1154388bad688d8[playerentnum].equipment["secondary"].equipment = self.equipment["secondary"];
        level.var_c1154388bad688d8[playerentnum].equipment["secondary"].ammo = getequipmentammo(self.equipment["secondary"]);
    }
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5db
// Size: 0xaa
function function_d942e259aef953c0() {
    playerentnum = self getentitynumber();
    if (!isdefined(level.var_c1154388bad688d8[playerentnum])) {
        /#
            assertmsg("Tried to retrieve a loadout that was never stored!");
        #/
        return;
    }
    function_b1aab57e7ea64c45(playerentnum);
    function_6ef8e341d1ca3ef8(playerentnum);
    namespace_d19129e4fa5d176::loadout_clearperks();
    foreach (perk in level.var_c1154388bad688d8[playerentnum].perks) {
        namespace_d19129e4fa5d176::loadout_giveperk(perk);
    }
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c
// Size: 0xe9
function function_b1aab57e7ea64c45(playerentnum) {
    self takeallweapons();
    foreach (weaponstruct in level.var_c1154388bad688d8[playerentnum].weapons) {
        namespace_df5cfdbe6e2d3812::_giveweapon(weaponstruct.weapon, undefined, undefined, 1);
        self setweaponammostock(weaponstruct.weapon, weaponstruct.ammostock);
        self setweaponammoclip(weaponstruct.weapon, weaponstruct.ammoclip);
    }
    currentweapon = level.var_c1154388bad688d8[playerentnum].currentweapon;
    if (isdefined(currentweapon)) {
        namespace_df5cfdbe6e2d3812::_switchtoweapon(currentweapon);
    }
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0xc8
function function_6ef8e341d1ca3ef8(playerentnum) {
    clearallequipment();
    var_5c32b638bb67c982 = level.var_c1154388bad688d8[playerentnum].equipment["primary"];
    if (isdefined(var_5c32b638bb67c982)) {
        namespace_4fb9dddfb8c1a67a::giveequipment(var_5c32b638bb67c982.equipment, "primary");
        namespace_4fb9dddfb8c1a67a::setequipmentammo(var_5c32b638bb67c982.equipment, var_5c32b638bb67c982.ammo);
    }
    var_5c32b638bb67c982 = level.var_c1154388bad688d8[playerentnum].equipment["secondary"];
    if (isdefined(var_5c32b638bb67c982)) {
        namespace_4fb9dddfb8c1a67a::giveequipment(var_5c32b638bb67c982.equipment, "secondary");
        namespace_4fb9dddfb8c1a67a::setequipmentammo(var_5c32b638bb67c982.equipment, var_5c32b638bb67c982.ammo);
    }
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84b
// Size: 0xa8
function function_76e32a123417cd84(var_b9c1cb17ee62925b) {
    if (isdefined(var_b9c1cb17ee62925b)) {
        self.pers["gamemodeLoadout"] = var_b9c1cb17ee62925b;
        self.class = "gamemode";
        self.prevweaponobj = undefined;
        struct = namespace_d19129e4fa5d176::loadout_getclassstruct();
        struct = namespace_d19129e4fa5d176::loadout_updateclass(struct, "gamemode");
        namespace_d19129e4fa5d176::preloadandqueueclassstruct(struct, 1, 1);
        namespace_d19129e4fa5d176::giveloadout(self.team, "gamemode", 0, 0);
        self givestartammo(struct.loadoutprimaryobject);
        self givestartammo(struct.loadoutsecondaryobject);
        self notify("ammo_update");
    }
}

// Namespace namespace_adb7b959cd708574/namespace_ef3e1105afde5f69
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fa
// Size: 0x2a6
function function_32d0db3e4198e55d(var_6c2912cf6ca76e62) {
    loadout = [];
    loadout["loadoutArchetype"] = var_6c2912cf6ca76e62.role;
    loadout["loadoutPrimary"] = var_6c2912cf6ca76e62.primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = var_6c2912cf6ca76e62.primaryweapon.attachment1;
    loadout["loadoutPrimaryAttachment2"] = var_6c2912cf6ca76e62.primaryweapon.attachment2;
    loadout["loadoutPrimaryCamo"] = var_6c2912cf6ca76e62.primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = var_6c2912cf6ca76e62.primaryweapon.reticle;
    loadout["loadoutSecondary"] = var_6c2912cf6ca76e62.secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = var_6c2912cf6ca76e62.secondaryweapon.attachment1;
    loadout["loadoutSecondaryAttachment2"] = var_6c2912cf6ca76e62.secondaryweapon.attachment2;
    loadout["loadoutSecondaryCamo"] = var_6c2912cf6ca76e62.secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = var_6c2912cf6ca76e62.secondaryweapon.reticle;
    loadout["loadoutMeleeSlot"] = var_6c2912cf6ca76e62.var_4aae736dc859984b;
    loadout["loadoutEquipmentPrimary"] = var_6c2912cf6ca76e62.equipment.primary;
    loadout["loadoutEquipmentSecondary"] = var_6c2912cf6ca76e62.equipment.secondary;
    loadout["loadoutKillstreak1"] = var_6c2912cf6ca76e62.killstreaks.killstreak1;
    loadout["loadoutKillstreak2"] = var_6c2912cf6ca76e62.killstreaks.killstreak2;
    loadout["loadoutKillstreak3"] = var_6c2912cf6ca76e62.killstreaks.killstreak3;
    loadout["loadoutSuper"] = var_6c2912cf6ca76e62.super;
    loadout["loadoutPerks"] = [0:var_6c2912cf6ca76e62.perks.perk1, 1:var_6c2912cf6ca76e62.perks.perk2, 2:var_6c2912cf6ca76e62.perks.perk3];
    loadout["loadoutGesture"] = var_6c2912cf6ca76e62.gesture;
    loadout["loadoutFieldUpgrade1"] = var_6c2912cf6ca76e62.fieldUpgrades.var_7e397f4ce66bffd0;
    loadout["loadoutFieldUpgrade2"] = var_6c2912cf6ca76e62.fieldUpgrades.var_7e39824ce66c0669;
    return loadout;
}

