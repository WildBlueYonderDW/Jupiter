#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_37d9a569491ff1e0;
#using script_7c40fa80892a721;

#namespace equip_armor;

// Namespace equip_armor / namespace_44e61c324d97fb99
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd
// Size: 0x12
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&evaluatescore, &createaction);
}

// Namespace equip_armor / namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8
// Size: 0x113
function evaluatescore(bot) {
    if (!bot function_fc5d9d6dc490ce2e()) {
        return 0;
    }
    if (bot.armorhealth >= self.constants.var_ae436a56f4dc7add) {
        return 0;
    }
    nearbyevent = bot namespace_5524884c16a95af2::getevent();
    nearbyevent namespace_5524884c16a95af2::keepenemies(bot);
    threatmodifier = self.constants.var_71bdba3f5c7a939d[self.constants.var_71bdba3f5c7a939d.size - 1];
    if (nearbyevent.result.size > 0) {
        player = nearbyevent.result[0];
        threatmodifier = function_9d1ab012058221bb(distance(player.origin, bot.origin), self.constants.var_a8d37f0ea66f877f, self.constants.var_71bdba3f5c7a939d);
    }
    return self.constants.basescore + threatmodifier;
}

// Namespace equip_armor / namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214
// Size: 0x2c
function createaction(bot) {
    return createactionbase("Equip Armor", undefined, "upper body", "", &actionprocess, self, &function_f4caae7e8af9d32c);
}

// Namespace equip_armor / namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x46
function actionprocess(bot) {
    if (!bot function_fc5d9d6dc490ce2e()) {
        return "Can't equip";
    }
    bot botsetflag("ignore_script_weapon", 0);
    bot namespace_f8d3520d3483c1::function_9f1608bd570dd94c(1);
    bot waittill_any_in_array_or_timeout(["insertArmorComplete"], 5);
}

// Namespace equip_armor / namespace_44e61c324d97fb99
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x297
// Size: 0x3a
function function_fc5d9d6dc490ce2e() {
    return istrue(level.allowArmor) && !istrue(self.insertingarmorplate) && namespace_f8d3520d3483c1::function_600f6cf462e983f() > 0 && namespace_f8d3520d3483c1::function_cf37789d18fbcc1b() && !self isswitchingweapon();
}

// Namespace equip_armor / namespace_44e61c324d97fb99
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0x22
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botsetflag("ignore_script_weapon", 1);
    }
}

