// mwiii decomp prototype
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;

#namespace namespace_de169b8ad93c38b5;

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c
// Size: 0x4f
function function_e1a78f7ca6c76a52() {
    function_900f562c61c6a5d6("killstreak", &use_killstreak, &function_a6c2c08d6694cda3, &function_bd6da02766cc4480, &function_d6029511a9d0984, &function_5ef81282e50397e);
    if (!isdefined(level.var_a9afa220306e1f68)) {
        level.var_a9afa220306e1f68 = inventory_isenabled();
    }
    level.deathretainstreaks = 1;
}

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192
// Size: 0xad
function use_killstreak(itembundle, item) {
    if (iskillstreakavailable()) {
        if (function_e1a7409f30e3c964()) {
            self notify("potential_killstreak_deployment_finish", "weapon_change");
        }
        if (istrue(item.var_4ec444a18e7fc2c0)) {
            var_57accdc40b2f50e = function_d6029511a9d0984();
            quantity = var_57accdc40b2f50e[1];
            var_2814cca693e6ef2d = var_57accdc40b2f50e[0];
            items_dropitem(var_2814cca693e6ef2d, quantity);
        }
        removekillstreak(1);
    }
    awardkillstreak(itembundle.ref, "other", undefined, undefined, undefined, 1);
    return item.count - 1;
}

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247
// Size: 0xb6
function function_bd6da02766cc4480(itembundle, item, autouse, allowswap) {
    if (isdefined(self.triggeringstreak) || istrue(self.enabledequipdeployvfx) || function_e1a7409f30e3c964()) {
        return false;
    }
    if (iskillstreakavailable()) {
        var_57acddc40b2f741 = function_d6029511a9d0984();
        quantity = var_57acddc40b2f741[1];
        var_2814cca693e6ef2d = var_57acddc40b2f741[0];
        if (!isdefined(var_2814cca693e6ef2d)) {
            /#
                assertmsg("CommonItemERROR: Could NOT retrieve a valid item bundle for the currently equipped killstreak");
            #/
            return false;
        }
        if (itembundle.ref == var_2814cca693e6ef2d.ref) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305
// Size: 0x5c
function function_a6c2c08d6694cda3(itembundle, item, autouse, allowswap) {
    if (isdefined(self.triggeringstreak) || istrue(self.enabledequipdeployvfx) || function_e1a7409f30e3c964()) {
        return 0;
    }
    if (iskillstreakavailable()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368
// Size: 0xb9
function function_d6029511a9d0984() {
    itembundle = undefined;
    quantity = 0;
    if (isdefined(self.streakdata) && isdefined(self.streakdata.streaks)) {
        if (iskillstreakavailable()) {
            killstreakref = self.streakdata.streaks[1].streakname;
            if (!isdefined(killstreakref)) {
                return [itembundle, quantity];
            }
            killstreakbundlename = function_61d960957fcf3ca0(killstreakref);
            if (isdefined(killstreakbundlename)) {
                itembundle = getscriptbundle("itemspawnentry:" + killstreakbundlename);
                quantity = 1;
            }
        }
    }
    return [itembundle, quantity];
}

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429
// Size: 0x15
function function_5ef81282e50397e() {
    removekillstreak(1);
    updatekillstreakuislot(1);
}

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445
// Size: 0x53
function iskillstreakavailable() {
    streakitem = self.streakdata.streaks[1];
    if (isdefined(streakitem) && isdefined(streakitem.streakname) && streakitem.available == 1) {
        return 1;
    }
    return 0;
}

// Namespace namespace_de169b8ad93c38b5 / namespace_281a923a21486535
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f
// Size: 0x12
function function_e1a7409f30e3c964() {
    return scripts/cp_mp/utility/killstreak_utility::iskillstreakdeployweapon(self.currentweapon);
}

