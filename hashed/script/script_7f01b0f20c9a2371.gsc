// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_1076881dd9127338;
#using script_37d9a569491ff1e0;

#namespace sniper_combat;

// Namespace sniper_combat/namespace_82adac1fd015a505
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace sniper_combat/namespace_82adac1fd015a505
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4
// Size: 0x9c
function function_e0844a2b7f904b14(bot) {
    var_ced0426e7e729ed5 = function_1613f016af44e830(bot);
    if (!isdefined(var_ced0426e7e729ed5) || !isdefined(var_ced0426e7e729ed5.target)) {
        return 0;
    }
    target = var_ced0426e7e729ed5.target;
    targetname = function_ee72e3f03e5196b7(target);
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("sniper_combat", target, "main", targetname + "/" + target getentitynumber(), &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
    return var_ced0426e7e729ed5.score;
}

// Namespace sniper_combat/namespace_82adac1fd015a505
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188
// Size: 0x2bf
function function_1613f016af44e830(bot) {
    /#
        if (getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
            return undefined;
        }
    #/
    var_49fffc1ce970e26d = isdefined(bot.primaryweaponobj) && bot namespace_bc2665cbe6cf4e1f::function_813a1a6f2c5abddb(bot.primaryweaponobj, self.constants.var_d0708c53f9aedbbe);
    if (!var_49fffc1ce970e26d) {
        return undefined;
    }
    var_b01971ef554bac8 = bot namespace_1bebff3a2e9afaca::function_7e7ddfa33eff2c11();
    var_80d16926274a0f94 = getclosest(bot.origin, var_b01971ef554bac8);
    if (!isdefined(var_80d16926274a0f94)) {
        return undefined;
    }
    var_3b3d162ce953d1dc = var_80d16926274a0f94 get_target_array();
    var_5debf83062cf0194 = getclosest(bot.origin, var_3b3d162ce953d1dc, self.constants.var_b9de038abd473868);
    if (!isdefined(var_5debf83062cf0194)) {
        return undefined;
    }
    var_fdf6f26abee82b42 = bot namespace_5524884c16a95af2::function_7e7ddfa33eff2c11();
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_2f1735d1cb737a0c(bot);
    maxdistance = self.constants.var_96af88c97db9ed21[self.constants.var_96af88c97db9ed21.size - 1];
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_8500e6ae452b1e19(maxdistance);
    var_72bb89e60d3674df = 0;
    target = undefined;
    foreach (player in var_fdf6f26abee82b42.result) {
        /#
            if (!isbot(player) && getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
                goto LOC_00000287;
            }
        #/
        distancetoplayer = distance(bot.origin, player.origin);
        basescore = function_9d1ab012058221bb(distancetoplayer, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef);
        var_6ca288ca3f0ca3a0 = bot function_3569a4bec8b9af17(player);
        if (var_6ca288ca3f0ca3a0) {
            basescore = basescore + self.constants.var_ed9b346626f27a7f;
        }
        if (basescore > var_72bb89e60d3674df && (var_6ca288ca3f0ca3a0 || bot botcanseeentity(player))) {
            var_72bb89e60d3674df = basescore;
            target = player;
        LOC_00000287:
        }
    LOC_00000287:
    }
    result = spawnstruct();
    result.score = var_72bb89e60d3674df;
    result.target = target;
    return result;
}

// Namespace sniper_combat/namespace_82adac1fd015a505
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x95
function function_35671b7b1a04bf58(bot) {
    /#
        assert(isplayer(self.var_ec02147fee952ce2));
    #/
    target = self.var_ec02147fee952ce2;
    target endon("death_or_disconnect");
    bot allowmovement(0);
    bot botsetstance(bot getstance());
    bot function_2c2b5b435027f895(target);
    while (isvalidplayer(target)) {
        if (self.decision.constants.var_c1f6d75f14545b1f) {
            bot function_cf1a9e98122e3931(target);
        }
        wait(1);
    }
}

// Namespace sniper_combat/namespace_82adac1fd015a505
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x2a
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botsetstance("none");
        self allowmovement(1);
    }
}

