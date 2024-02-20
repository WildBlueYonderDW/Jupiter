// mwiii decomp prototype
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace riotshield;

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325
// Size: 0x8b
function function_3f6d1c80aac1b91() {
    weaponlist = self getweaponslistprimaries();
    var_232d7ef9f0f8baa8 = undefined;
    /#
        assert(!riotshield_hastwo(), "Player should only have one shield normally. Ignore or remove this SRE if have two shields on purpose");
    #/
    foreach (weapon in weaponlist) {
        if (isriotshield(weapon)) {
            var_232d7ef9f0f8baa8 = weapon;
            break;
        }
    }
    return var_232d7ef9f0f8baa8;
}

// Namespace riotshield/namespace_c245eb2dd079e63d
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

// Namespace riotshield/namespace_c245eb2dd079e63d
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

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bf
// Size: 0x96
function riotshield_attach(var_f8ee3e194415c066, var_a6ef975da2ddff4b) {
    var_8f79d15efb6089c2 = undefined;
    if (var_f8ee3e194415c066) {
        /#
            assertex(!isdefined(self.riotshieldmodel), "riotShield_attach() called on player with no riot shield model on the arm");
        #/
        self.riotshieldmodel = var_a6ef975da2ddff4b;
        var_8f79d15efb6089c2 = "j_shield_ri";
    } else {
        /#
            assertex(!isdefined(self.riotshieldmodelstowed), "riotShield_attach() called on player with no riot shield model stowed");
        #/
        self.riotshieldmodelstowed = var_a6ef975da2ddff4b;
        var_8f79d15efb6089c2 = "tag_shield_back";
    }
    self attachshieldmodel(var_a6ef975da2ddff4b, var_8f79d15efb6089c2, 0, !var_f8ee3e194415c066);
    self.hasriotshield = riotshield_hasweapon();
}

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55c
// Size: 0xb2
function riotshield_detach(var_f8ee3e194415c066) {
    var_a6ef975da2ddff4b = undefined;
    var_8053d7b86373d568 = undefined;
    if (var_f8ee3e194415c066) {
        /#
            assertex(isdefined(self.riotshieldmodel), "riotShield_detach() called on player with no riot shield model on arm");
        #/
        var_a6ef975da2ddff4b = self.riotshieldmodel;
        var_8053d7b86373d568 = "j_shield_ri";
    } else {
        /#
            assertex(isdefined(self.riotshieldmodelstowed), "riotShield_detach() called on player with no riot shield model stowed");
        #/
        var_a6ef975da2ddff4b = self.riotshieldmodelstowed;
        var_8053d7b86373d568 = "tag_shield_back";
    }
    self detachshieldmodel(var_a6ef975da2ddff4b, var_8053d7b86373d568);
    if (var_f8ee3e194415c066) {
        self.riotshieldmodel = undefined;
    } else {
        self.riotshieldmodelstowed = undefined;
    }
    self.hasriotshield = riotshield_hasweapon();
}

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0xd3
function riotshield_move(var_9a9844b3a758c1c9) {
    var_2fb5a158f53218ed = undefined;
    var_c5e1be4d30cc7d74 = undefined;
    var_a6ef975da2ddff4b = undefined;
    if (var_9a9844b3a758c1c9) {
        /#
            assertex(isdefined(self.riotshieldmodel), "riotShield_move() called on player with no riot shield model on arm");
        #/
        var_a6ef975da2ddff4b = self.riotshieldmodel;
        var_2fb5a158f53218ed = "j_shield_ri";
        var_c5e1be4d30cc7d74 = "tag_shield_back";
    } else {
        /#
            assertex(isdefined(self.riotshieldmodelstowed), "riotShield_move() called on player with no riot shield model stowed");
        #/
        var_a6ef975da2ddff4b = self.riotshieldmodelstowed;
        var_2fb5a158f53218ed = "tag_shield_back";
        var_c5e1be4d30cc7d74 = "j_shield_ri";
    }
    self moveshieldmodel(var_a6ef975da2ddff4b, var_2fb5a158f53218ed, var_c5e1be4d30cc7d74, var_9a9844b3a758c1c9);
    if (var_9a9844b3a758c1c9) {
        self.riotshieldmodelstowed = var_a6ef975da2ddff4b;
        self.riotshieldmodel = undefined;
    } else {
        self.riotshieldmodel = var_a6ef975da2ddff4b;
        self.riotshieldmodelstowed = undefined;
    }
}

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ef
// Size: 0x21
function riotshield_clear() {
    self.hasriotshield = 0;
    self.riotshieldmodelstowed = undefined;
    self.riotshieldmodel = undefined;
}

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717
// Size: 0x9e
function riotshield_getmodel() {
    weaponlist = self getweaponslistprimaries();
    foreach (weapon in weaponlist) {
        if (isriotshield(weapon)) {
            var_eb1cf0643b4a4706 = getweaponattachmentworldmodels(weapon);
            /#
                assert(var_eb1cf0643b4a4706.size == 1, "riotshield.gsc - Riot shield does not have exactly 1 attachmentModel.");
            #/
            return var_eb1cf0643b4a4706[0];
        }
    }
    /#
        assertmsg("riotShield_getModel called - but no riotshield weapon found.");
    #/
    return "empty_model";
}

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bd
// Size: 0xe
function setignoreriotshieldxp() {
    self.ignoreriotshieldxp = 1;
}

// Namespace riotshield/namespace_c245eb2dd079e63d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d2
// Size: 0xd
function clearignoreriotshieldxp() {
    self.ignoreriotshieldxp = undefined;
}

