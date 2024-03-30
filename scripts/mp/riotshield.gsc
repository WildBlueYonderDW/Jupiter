// mwiii decomp prototype
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace riotshield;

// Namespace riotshield / scripts/mp/riotshield
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325
// Size: 0x8b
function function_3f6d1c80aac1b91() {
    weaponlist = self getweaponslistprimaries();
    shieldweapon = undefined;
    /#
        assert(!riotshield_hastwo(), "Player should only have one shield normally. Ignore or remove this SRE if have two shields on purpose");
    #/
    foreach (weapon in weaponlist) {
        if (isriotshield(weapon)) {
            shieldweapon = weapon;
            break;
        }
    }
    return shieldweapon;
}

// Namespace riotshield / scripts/mp/riotshield
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8
// Size: 0x77
function riotshield_hasweapon() {
    result = 0;
    weaponlist = self getweaponslistprimaries();
    foreach (weapon in weaponlist) {
        if (isriotshield(weapon)) {
            result = 1;
            break;
        }
    }
    return result;
}

// Namespace riotshield / scripts/mp/riotshield
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x437
// Size: 0x80
function riotshield_hastwo() {
    count = 0;
    weapons = self getweaponslistprimaries();
    foreach (weapon in weapons) {
        if (isriotshield(weapon)) {
            count++;
        }
        if (count == 2) {
            break;
        }
    }
    return count == 2;
}

// Namespace riotshield / scripts/mp/riotshield
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bf
// Size: 0x96
function riotshield_attach(onarm, modelshield) {
    tagattach = undefined;
    if (onarm) {
        /#
            assertex(!isdefined(self.riotshieldmodel), "riotShield_attach() called on player with no riot shield model on the arm");
        #/
        self.riotshieldmodel = modelshield;
        tagattach = "j_shield_ri";
    } else {
        /#
            assertex(!isdefined(self.riotshieldmodelstowed), "riotShield_attach() called on player with no riot shield model stowed");
        #/
        self.riotshieldmodelstowed = modelshield;
        tagattach = "tag_shield_back";
    }
    self attachshieldmodel(modelshield, tagattach, 0, !onarm);
    self.hasriotshield = riotshield_hasweapon();
}

// Namespace riotshield / scripts/mp/riotshield
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55c
// Size: 0xb2
function riotshield_detach(onarm) {
    modelshield = undefined;
    tagdetach = undefined;
    if (onarm) {
        /#
            assertex(isdefined(self.riotshieldmodel), "riotShield_detach() called on player with no riot shield model on arm");
        #/
        modelshield = self.riotshieldmodel;
        tagdetach = "j_shield_ri";
    } else {
        /#
            assertex(isdefined(self.riotshieldmodelstowed), "riotShield_detach() called on player with no riot shield model stowed");
        #/
        modelshield = self.riotshieldmodelstowed;
        tagdetach = "tag_shield_back";
    }
    self detachshieldmodel(modelshield, tagdetach);
    if (onarm) {
        self.riotshieldmodel = undefined;
    } else {
        self.riotshieldmodelstowed = undefined;
    }
    self.hasriotshield = riotshield_hasweapon();
}

// Namespace riotshield / scripts/mp/riotshield
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0xd3
function riotshield_move(var_9a9844b3a758c1c9) {
    tagstart = undefined;
    tagend = undefined;
    modelshield = undefined;
    if (var_9a9844b3a758c1c9) {
        /#
            assertex(isdefined(self.riotshieldmodel), "riotShield_move() called on player with no riot shield model on arm");
        #/
        modelshield = self.riotshieldmodel;
        tagstart = "j_shield_ri";
        tagend = "tag_shield_back";
    } else {
        /#
            assertex(isdefined(self.riotshieldmodelstowed), "riotShield_move() called on player with no riot shield model stowed");
        #/
        modelshield = self.riotshieldmodelstowed;
        tagstart = "tag_shield_back";
        tagend = "j_shield_ri";
    }
    self moveshieldmodel(modelshield, tagstart, tagend, var_9a9844b3a758c1c9);
    if (var_9a9844b3a758c1c9) {
        self.riotshieldmodelstowed = modelshield;
        self.riotshieldmodel = undefined;
        return;
    }
    self.riotshieldmodel = modelshield;
    self.riotshieldmodelstowed = undefined;
}

// Namespace riotshield / scripts/mp/riotshield
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ef
// Size: 0x21
function riotshield_clear() {
    self.hasriotshield = 0;
    self.riotshieldmodelstowed = undefined;
    self.riotshieldmodel = undefined;
}

// Namespace riotshield / scripts/mp/riotshield
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717
// Size: 0x9e
function riotshield_getmodel() {
    weaponlist = self getweaponslistprimaries();
    foreach (weapon in weaponlist) {
        if (isriotshield(weapon)) {
            attachmentmodels = getweaponattachmentworldmodels(weapon);
            /#
                assert(attachmentmodels.size == 1, "riotshield.gsc - Riot shield does not have exactly 1 attachmentModel.");
            #/
            return attachmentmodels[0];
        }
    }
    /#
        assertmsg("riotShield_getModel called - but no riotshield weapon found.");
    #/
    return "empty_model";
}

// Namespace riotshield / scripts/mp/riotshield
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bd
// Size: 0xe
function setignoreriotshieldxp() {
    self.ignoreriotshieldxp = 1;
}

// Namespace riotshield / scripts/mp/riotshield
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d2
// Size: 0xd
function clearignoreriotshieldxp() {
    self.ignoreriotshieldxp = undefined;
}

