// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using script_37d9a569491ff1e0;
#using script_7c40fa80892a721;
#using script_32abd1c08a25abb5;
#using script_58f20490049af6ac;
#using scripts\engine\trace.gsc;

#namespace retreat;

// Namespace retreat/namespace_2730bb41e47f262e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d
// Size: 0x16
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction, 500);
}

// Namespace retreat/namespace_2730bb41e47f262e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b
// Size: 0x3a0
function function_e0844a2b7f904b14(bot) {
    if (bot isswimming()) {
        return 0;
    }
    var_72bb89e60d3674df = 0;
    target = undefined;
    var_fdf6f26abee82b42 = bot namespace_5524884c16a95af2::function_7e7ddfa33eff2c11();
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_2f1735d1cb737a0c(bot);
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_8500e6ae452b1e19(self.constants.var_93102c55f2858271);
    foreach (player in var_fdf6f26abee82b42.result) {
        if (isbot(player)) {
            continue;
        }
        if (!bot function_3569a4bec8b9af17(player)) {
            continue;
        }
        if (function_a01120d129fa7b98(bot.origin, player.origin)) {
            continue;
        }
        distancetoplayer = distance(bot.origin, player.origin);
        if (distancetoplayer > 15600) {
            continue;
        }
        basescore = function_9d1ab012058221bb(distancetoplayer, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef);
        score = basescore;
        var_d3c92f2ee715f0 = player.origin - bot.origin;
        var_3fb4d99c9fb3df17 = anglestoforward(bot.angles);
        var_29a6fcf2b56726c5 = function_c1aa7c066ec92ca5(var_d3c92f2ee715f0, var_3fb4d99c9fb3df17);
        var_591cc61420e4b5b3 = function_9d1ab012058221bb(var_29a6fcf2b56726c5, self.constants.var_b8eb6b85b8ebb591, self.constants.var_aa7751bb8bb0bf4e);
        score = score + var_591cc61420e4b5b3;
        health = bot.health;
        maxhealth = bot.maxhealth;
        if (isdefined(bot.var_8790c077c95db752)) {
            if (bot namespace_f8d3520d3483c1::hasarmor()) {
                health = health + bot namespace_f8d3520d3483c1::function_ac266fc218266d08();
            }
            maxhealth = maxhealth + bot.var_8790c077c95db752;
        }
        var_559a0810819cf4f0 = health / maxhealth;
        var_1a8e8250c82242e2 = function_9d1ab012058221bb(var_559a0810819cf4f0, self.constants.var_dff6f563a1619566, self.constants.var_6b5b5a20f3356ee3);
        score = score + var_1a8e8250c82242e2;
        var_fc5d9d6dc490ce2e = bot namespace_44e61c324d97fb99::function_fc5d9d6dc490ce2e();
        var_527a822fe7f798a1 = ter_op(var_fc5d9d6dc490ce2e, self.constants.var_527a822fe7f798a1, 0);
        score = score + var_527a822fe7f798a1;
        ammoinclip = bot getweaponammoclip(bot.primaryweaponobj);
        clipsize = weaponclipsize(bot.primaryweaponobj);
        var_d2a5d6a23f329f50 = ammoinclip / clipsize;
        var_3e095565a4b9c4c2 = function_9d1ab012058221bb(var_d2a5d6a23f329f50, self.constants.var_d318160b4ec63dc6, self.constants.var_b42a419b44acd2c3);
        score = score + var_3e095565a4b9c4c2;
        if (score > var_72bb89e60d3674df) {
            var_72bb89e60d3674df = score;
            target = player;
        }
    }
    if (isdefined(target)) {
        self.var_df9d35d9b4bee654 = createaction(target);
    }
    return var_72bb89e60d3674df;
}

// Namespace retreat/namespace_2730bb41e47f262e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503
// Size: 0x57
function createaction(target) {
    /#
        assert(isent(target));
    #/
    targetname = function_ee72e3f03e5196b7(target);
    return function_ff35a4d756374ede("retreat", target, "main", targetname + "/" + target getentitynumber(), &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
}

// Namespace retreat/namespace_2730bb41e47f262e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x562
// Size: 0x10e
function function_35671b7b1a04bf58(bot) {
    target = self.var_ec02147fee952ce2;
    target endon("death_or_disconnect");
    pointonnavmesh = function_6da2bc8030016571(bot, target);
    if (!isdefined(pointonnavmesh)) {
        return "No destination";
    }
    bot botsetstance("stand");
    bot function_9e400058ef021b03(pointonnavmesh, 40);
    result = undefined;
    timeout = gettime() + 10000;
    while (gettime() < timeout) {
        bot botpressbutton("sprint", 1);
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path", 2:"long_path"], 1);
        if (result == "goal") {
            break;
        } else if (result != "timeout") {
            return result;
        }
    }
    if (result == "goal") {
        var_dfe9ec231aa6a11a = randomfloatrange(1, 2);
        bot function_8b201bccc0aa3695(target.origin, var_dfe9ec231aa6a11a);
        wait(var_dfe9ec231aa6a11a);
    }
}

// Namespace retreat/namespace_2730bb41e47f262e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x677
// Size: 0x23c
function function_6da2bc8030016571(bot, target) {
    var_49b762aa51419fb1 = function_767cea82b001f645(bot.origin - target.origin);
    var_b56234440660bfdb = (0, 0, 50);
    var_5dc6e1ba94643e35 = target.origin + var_b56234440660bfdb;
    var_85fdf001348a0fb9 = [0:240, 1:480, 2:640];
    foreach (dist in var_85fdf001348a0fb9) {
        var_575f3e579533510e = -60;
        var_7fbcf617807a62b4 = 30;
        var_73b73a6a4727117e = var_575f3e579533510e;
        while (var_73b73a6a4727117e <= -1 * var_575f3e579533510e) {
            var_404ee9885d942a78 = 97000;
            var_f5dc775212e51e06 = rotatevector(var_49b762aa51419fb1, (0, var_73b73a6a4727117e, 0));
            var_95e0c7f3c4f7d3b6 = bot.origin + var_f5dc775212e51e06 * dist;
            var_fab2b08dc6826750 = function_f8350ab882cc2439(var_95e0c7f3c4f7d3b6);
            if (distancesquared(var_95e0c7f3c4f7d3b6, var_fab2b08dc6826750) > var_404ee9885d942a78) {
                goto LOC_000001f7;
            }
            var_7d9a6d00a336393b = namespace_bbc79db4c3949a5c::function_3e0a90b32e551ad(var_95e0c7f3c4f7d3b6);
            var_52f22c4c2185736b = 5;
            if (var_7d9a6d00a336393b >= 0 & var_7d9a6d00a336393b < var_52f22c4c2185736b) {
                goto LOC_000001f7;
            }
            traceresult = namespace_2a184fc4902783dc::ray_trace(var_5dc6e1ba94643e35, var_fab2b08dc6826750 + var_b56234440660bfdb, [0:bot, 1:target], namespace_2a184fc4902783dc::create_ainosight_contents());
            var_8e7baeb9b487cb3d = distance2dsquared(traceresult["position"], bot.origin) > var_404ee9885d942a78;
            var_1d8777f78da475b3 = traceresult["hittype"] != "hittype_none";
            if (!var_8e7baeb9b487cb3d && var_1d8777f78da475b3) {
                return var_fab2b08dc6826750;
            LOC_000001f7:
            }
        LOC_000001f7:
            var_73b73a6a4727117e = var_73b73a6a4727117e + var_7fbcf617807a62b4;
        }
    }
    self.var_a0185a724941f02f function_27d1cc325885f9b9(bot.origin, target.origin);
    return undefined;
}

// Namespace retreat/namespace_2730bb41e47f262e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bb
// Size: 0xbd
function function_a01120d129fa7b98(victimorigin, attackerorigin) {
    if (isdefined(self.var_ce6cbd8283ed0ee8) && self.var_ce6cbd8283ed0ee8.size > 0) {
        foreach (var_5eff58562be2dd0b in self.var_ce6cbd8283ed0ee8) {
            var_d22fdca158e266e = 5400;
            if (distancesquared(var_5eff58562be2dd0b.victimorigin, victimorigin) < var_d22fdca158e266e && distancesquared(var_5eff58562be2dd0b.attackerorigin, attackerorigin) < var_d22fdca158e266e) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace retreat/namespace_2730bb41e47f262e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x980
// Size: 0x94
function function_27d1cc325885f9b9(victimorigin, attackerorigin) {
    var_5eff58562be2dd0b = spawnstruct();
    var_5eff58562be2dd0b.victimorigin = victimorigin;
    var_5eff58562be2dd0b.attackerorigin = attackerorigin;
    if (!isdefined(self.var_ce6cbd8283ed0ee8)) {
        self.var_ce6cbd8283ed0ee8 = [];
    }
    if (self.var_ce6cbd8283ed0ee8.size >= 5) {
        self.var_ce6cbd8283ed0ee8 = array_remove_index(self.var_ce6cbd8283ed0ee8, 0);
    }
    self.var_ce6cbd8283ed0ee8[self.var_ce6cbd8283ed0ee8.size] = var_5eff58562be2dd0b;
}

// Namespace retreat/namespace_2730bb41e47f262e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1b
// Size: 0x1d
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botlookatpoint(undefined);
    }
}

