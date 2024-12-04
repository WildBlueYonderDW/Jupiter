#using script_32abd1c08a25abb5;
#using script_37d9a569491ff1e0;
#using script_40e63dd222434655;
#using script_58f20490049af6ac;
#using script_59ff79d681bb860c;
#using script_7c40fa80892a721;
#using script_d74ae0b4aa21186;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\bots\bots_gametype_br;
#using scripts\mp\bots\bots_util;

#namespace retreat;

// Namespace retreat / namespace_2730bb41e47f262e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187
// Size: 0x15
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&evaluatescore, &createaction, 500);
}

// Namespace retreat / namespace_2730bb41e47f262e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5
// Size: 0x38a
function evaluatescore(bot) {
    if (bot isswimming()) {
        return 0;
    }
    finalscore = 0;
    target = undefined;
    nearbyevent = bot namespace_5524884c16a95af2::getevent();
    nearbyevent namespace_5524884c16a95af2::keepenemies(bot);
    nearbyevent namespace_5524884c16a95af2::indistance(self.constants.nearbyenemydistance);
    foreach (player in nearbyevent.result) {
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
        var_29a6fcf2b56726c5 = vectordot2(var_d3c92f2ee715f0, var_3fb4d99c9fb3df17);
        var_591cc61420e4b5b3 = function_9d1ab012058221bb(var_29a6fcf2b56726c5, self.constants.var_b8eb6b85b8ebb591, self.constants.var_aa7751bb8bb0bf4e);
        score += var_591cc61420e4b5b3;
        health = bot.health;
        maxhealth = bot.maxhealth;
        if (isdefined(bot.maxarmorhealth)) {
            if (bot namespace_f8d3520d3483c1::hasarmor()) {
                health += bot namespace_f8d3520d3483c1::function_ac266fc218266d08();
            }
            maxhealth += bot.maxarmorhealth;
        }
        healthpercent = health / maxhealth;
        healthmodifier = function_9d1ab012058221bb(healthpercent, self.constants.var_dff6f563a1619566, self.constants.var_6b5b5a20f3356ee3);
        score += healthmodifier;
        var_fc5d9d6dc490ce2e = bot namespace_44e61c324d97fb99::function_fc5d9d6dc490ce2e();
        armormodifier = ter_op(var_fc5d9d6dc490ce2e, self.constants.armormodifier, 0);
        score += armormodifier;
        ammoinclip = bot getweaponammoclip(bot.primaryweaponobj);
        clipsize = weaponclipsize(bot.primaryweaponobj);
        ammopercent = ammoinclip / clipsize;
        ammomodifier = function_9d1ab012058221bb(ammopercent, self.constants.var_d318160b4ec63dc6, self.constants.var_b42a419b44acd2c3);
        score += ammomodifier;
        if (score > finalscore) {
            finalscore = score;
            target = player;
        }
    }
    if (isdefined(target)) {
        self.var_df9d35d9b4bee654 = createaction(target);
    }
    return finalscore;
}

// Namespace retreat / namespace_2730bb41e47f262e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x538
// Size: 0x57
function createaction(target) {
    assert(isent(target));
    targetname = getentityname(target);
    return createactionbase("retreat", target, "main", targetname + "/" + target getentitynumber(), &actionprocess, self, &function_f4caae7e8af9d32c);
}

// Namespace retreat / namespace_2730bb41e47f262e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x598
// Size: 0x10a
function actionprocess(bot) {
    target = self.argument;
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
        result = bot waittill_any_in_array_or_timeout(["goal", "bad_path", "long_path"], 1);
        if (result == "goal") {
            break;
        }
        if (result != "timeout") {
            return result;
        }
    }
    if (result == "goal") {
        alertseconds = randomfloatrange(1, 2);
        bot function_8b201bccc0aa3695(target.origin, alertseconds);
        wait alertseconds;
    }
}

// Namespace retreat / namespace_2730bb41e47f262e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6aa
// Size: 0x22a
function function_6da2bc8030016571(bot, target) {
    var_49b762aa51419fb1 = vectornormalize2(bot.origin - target.origin);
    var_b56234440660bfdb = (0, 0, 50);
    targeteyepos = target.origin + var_b56234440660bfdb;
    var_85fdf001348a0fb9 = [240, 480, 640];
    foreach (dist in var_85fdf001348a0fb9) {
        var_575f3e579533510e = -60;
        var_7fbcf617807a62b4 = 30;
        for (angel = var_575f3e579533510e; angel <= -1 * var_575f3e579533510e; angel += var_7fbcf617807a62b4) {
            var_404ee9885d942a78 = 97000;
            var_f5dc775212e51e06 = rotatevector(var_49b762aa51419fb1, (0, angel, 0));
            var_95e0c7f3c4f7d3b6 = bot.origin + var_f5dc775212e51e06 * dist;
            var_fab2b08dc6826750 = function_f8350ab882cc2439(var_95e0c7f3c4f7d3b6);
            if (distancesquared(var_95e0c7f3c4f7d3b6, var_fab2b08dc6826750) > var_404ee9885d942a78) {
                continue;
            }
            var_7d9a6d00a336393b = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(var_95e0c7f3c4f7d3b6);
            var_52f22c4c2185736b = 5;
            if (var_7d9a6d00a336393b >= 0 & var_7d9a6d00a336393b < var_52f22c4c2185736b) {
                continue;
            }
            traceresult = scripts\engine\trace::ray_trace(targeteyepos, var_fab2b08dc6826750 + var_b56234440660bfdb, [bot, target], scripts\engine\trace::create_ainosight_contents());
            var_8e7baeb9b487cb3d = distance2dsquared(traceresult["position"], bot.origin) > var_404ee9885d942a78;
            var_1d8777f78da475b3 = traceresult["hittype"] != "hittype_none";
            if (!var_8e7baeb9b487cb3d && var_1d8777f78da475b3) {
                return var_fab2b08dc6826750;
            }
        }
    }
    self.decision function_27d1cc325885f9b9(bot.origin, target.origin);
    return undefined;
}

// Namespace retreat / namespace_2730bb41e47f262e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8dd
// Size: 0xba
function function_a01120d129fa7b98(victimorigin, attackerorigin) {
    if (isdefined(self.var_ce6cbd8283ed0ee8) && self.var_ce6cbd8283ed0ee8.size > 0) {
        foreach (failedretreat in self.var_ce6cbd8283ed0ee8) {
            var_d22fdca158e266e = 5400;
            if (distancesquared(failedretreat.victimorigin, victimorigin) < var_d22fdca158e266e && distancesquared(failedretreat.attackerorigin, attackerorigin) < var_d22fdca158e266e) {
                return true;
            }
        }
    }
    return false;
}

// Namespace retreat / namespace_2730bb41e47f262e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9a0
// Size: 0x94
function function_27d1cc325885f9b9(victimorigin, attackerorigin) {
    failedretreat = spawnstruct();
    failedretreat.victimorigin = victimorigin;
    failedretreat.attackerorigin = attackerorigin;
    if (!isdefined(self.var_ce6cbd8283ed0ee8)) {
        self.var_ce6cbd8283ed0ee8 = [];
    }
    if (self.var_ce6cbd8283ed0ee8.size >= 5) {
        self.var_ce6cbd8283ed0ee8 = array_remove_index(self.var_ce6cbd8283ed0ee8, 0);
    }
    self.var_ce6cbd8283ed0ee8[self.var_ce6cbd8283ed0ee8.size] = failedretreat;
}

// Namespace retreat / namespace_2730bb41e47f262e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3c
// Size: 0x1c
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botlookatpoint(undefined);
    }
}

