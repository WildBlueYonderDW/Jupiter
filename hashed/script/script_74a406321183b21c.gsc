// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\equipment.gsc;

#namespace namespace_200cccfc0de17d4e;

// Namespace namespace_200cccfc0de17d4e/namespace_7943786f962b6434
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b
// Size: 0x16
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction, 2000);
}

// Namespace namespace_200cccfc0de17d4e/namespace_7943786f962b6434
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x289
// Size: 0x2a4
function function_e0844a2b7f904b14(bot) {
    var_cf5cd4f2d94252bf = bot.equipment["super"];
    if (!isdefined(var_cf5cd4f2d94252bf)) {
        return 0;
    }
    var_7211c2f25e275c26 = "equip_munitionsbox";
    var_a3ba12c6175cdc5f = "equip_armorbox";
    if (var_cf5cd4f2d94252bf == var_a3ba12c6175cdc5f) {
        var_5324597edfaff57c = bot namespace_1a507865f681850e::getequipmentslotammo("health");
        if (isdefined(var_5324597edfaff57c) && var_5324597edfaff57c >= 2) {
            return 0;
        }
    } else if (var_cf5cd4f2d94252bf == var_7211c2f25e275c26) {
        primaryweapon = bot.primaryweaponobj;
        var_8c25727711ed9168 = [0:"rifle", 1:"smg", 2:"sniper", 3:"mg"];
        var_6be76f0842d9ed3f = 1;
        if (isdefined(primaryweapon)) {
            primaryweaponclass = weaponclass(primaryweapon);
            foreach (item in var_8c25727711ed9168) {
                if (primaryweaponclass == item) {
                    var_6be76f0842d9ed3f = 0;
                    break;
                }
            }
        }
        if (var_6be76f0842d9ed3f) {
            return 0;
        }
        if (bot function_813a1a6f2c5abddb(primaryweapon, 0.3)) {
            return 0;
        }
        var_40c280849dce2292 = getentarray("grenade", "classname");
        var_2e5c1e9548e8884f = 0;
        foreach (item in var_40c280849dce2292) {
            issameteam = isdefined(item.team) && item.team == bot.team;
            var_bc26a0088814dc94 = isdefined(item.weapon_name) && item.weapon_name == "support_box_mp";
            var_a25e384b96346a66 = isdefined(item.origin) && distancesquared(bot.origin, item.origin) < self.constants.var_2070b5f48167a4a;
            if (issameteam && var_bc26a0088814dc94 && var_a25e384b96346a66) {
                var_2e5c1e9548e8884f = 1;
                break;
            }
        }
        if (var_2e5c1e9548e8884f) {
            return 0;
        }
    } else {
        return 0;
    }
    return self.constants.basescore;
}

// Namespace namespace_200cccfc0de17d4e/namespace_7943786f962b6434
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x535
// Size: 0x39
function createaction(bot) {
    return function_ff35a4d756374ede("Use field upgrade box", undefined, "main", bot.equipment["super"], &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
}

// Namespace namespace_200cccfc0de17d4e/namespace_7943786f962b6434
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x576
// Size: 0x2f3
function function_35671b7b1a04bf58(bot) {
    bot botsetflag("disable_movement", 1);
    self.var_e042806c3ece447a = 1;
    while (bot isgestureplaying()) {
        wait(0.1);
    }
    bot enableoffhandweapons();
    bot function_f9594ee32c931a2e();
    bot botlookatpoint(bot gettagorigin("j_mainroot"), 0.75);
    bot botpressbutton("special", 0.5);
    /#
        function_f3cf203834e48c6d(", IsSwimming");
        logstring("<unknown string>" + bot.name + "<unknown string>");
    #/
    wait(4);
    /#
        function_f3cf203834e48c6d("<unknown string>");
    #/
    bot botsetflag("disable_movement", 0);
    var_c34ce1f95c70c360 = bot function_d244cc7c3f9b8eae();
    if (!isdefined(var_c34ce1f95c70c360)) {
        var_6a7656aecbf92e60 = "[Mind] Use field upgrade failed: ";
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot isswitchingweapon(), ", IsSwitchingWeapon", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot isreloading(), ", IsReloading", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot ismantling(), ", IsMantling", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot isthrowinggrenade(), ", IsThrowingGrenade", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot israisingweapon(), ", IsRaisingWeapon", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot ismeleeing(), ", IsMeleeing", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot isparachuting(), ", IsParachuting", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot isskydiving(), ", IsSkydiving", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot issprintsliding(), ", IsSprintSliding", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot isjumping(), ", IsJumping", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot isswimming(), ", IsSwimming", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(bot function_6f55d55ccff20d14(), ", IsSwimUnderwater", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ter_op(istrue(bot.inlaststand), ", IsInLastStand", "");
        var_6a7656aecbf92e60 = var_6a7656aecbf92e60 + ", bot stance:" + bot getstance() + "
";
        /#
            assertmsg("No supply box thrown" + var_6a7656aecbf92e60);
        #/
        return "No supply box thrown";
    }
    targetpos = function_f8350ab882cc2439(var_c34ce1f95c70c360.origin);
    bot function_9e400058ef021b03(targetpos, 32);
    while (1) {
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 5);
        if (result == "goal") {
            bot botlookatpoint(targetpos, 0.75);
            bot botpressbutton("use", 0.5);
            break;
        } else if (result != "timeout") {
            return result;
        }
    }
}

// Namespace namespace_200cccfc0de17d4e/namespace_7943786f962b6434
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x870
// Size: 0x3f
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        if (action.var_e042806c3ece447a) {
            self.equipment["super"] = undefined;
        }
        self botsetflag("disable_movement", 0);
    }
}

// Namespace namespace_200cccfc0de17d4e/namespace_7943786f962b6434
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b6
// Size: 0xb3
function function_d244cc7c3f9b8eae() {
    var_40c280849dce2292 = getentarray("grenade", "classname");
    var_c34ce1f95c70c360 = undefined;
    foreach (item in var_40c280849dce2292) {
        if (isdefined(item.owner) && item.owner == self) {
            if (!isdefined(var_c34ce1f95c70c360) || item.var_928e982159b87e18 > var_c34ce1f95c70c360.var_928e982159b87e18) {
                var_c34ce1f95c70c360 = item;
            }
        }
    }
    return var_c34ce1f95c70c360;
}

