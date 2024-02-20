// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_37d9a569491ff1e0;
#using script_7c40fa80892a721;

#namespace equip_armor;

// Namespace equip_armor/namespace_44e61c324d97fb99
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd
// Size: 0x13
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction);
}

// Namespace equip_armor/namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8
// Size: 0x114
function function_e0844a2b7f904b14(bot) {
    if (!bot function_fc5d9d6dc490ce2e()) {
        return 0;
    }
    if (bot.armorhealth >= self.constants.var_ae436a56f4dc7add) {
        return 0;
    }
    var_fdf6f26abee82b42 = bot namespace_5524884c16a95af2::function_7e7ddfa33eff2c11();
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_2f1735d1cb737a0c(bot);
    var_c530728f20222d70 = self.constants.var_71bdba3f5c7a939d[self.constants.var_71bdba3f5c7a939d.size - 1];
    if (var_fdf6f26abee82b42.result.size > 0) {
        player = var_fdf6f26abee82b42.result[0];
        var_c530728f20222d70 = function_9d1ab012058221bb(distance(player.origin, bot.origin), self.constants.var_a8d37f0ea66f877f, self.constants.var_71bdba3f5c7a939d);
    }
    return self.constants.basescore + var_c530728f20222d70;
}

// Namespace equip_armor/namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214
// Size: 0x2d
function createaction(bot) {
    return function_ff35a4d756374ede("Equip Armor", undefined, "upper body", "", &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
}

// Namespace equip_armor/namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x47
function function_35671b7b1a04bf58(bot) {
    if (!bot function_fc5d9d6dc490ce2e()) {
        return "Can't equip";
    }
    bot botsetflag("ignore_script_weapon", 0);
    bot namespace_f8d3520d3483c1::function_9f1608bd570dd94c(1);
    bot waittill_any_in_array_or_timeout([0:"insertArmorComplete"], 5);
}

// Namespace equip_armor/namespace_44e61c324d97fb99
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x297
// Size: 0x3b
function function_fc5d9d6dc490ce2e() {
    return istrue(level.allowArmor) && !istrue(self.insertingarmorplate) && namespace_f8d3520d3483c1::function_600f6cf462e983f() > 0 && namespace_f8d3520d3483c1::function_cf37789d18fbcc1b() && !self isswitchingweapon();
}

// Namespace equip_armor/namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0x23
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botsetflag("ignore_script_weapon", 1);
    }
}

