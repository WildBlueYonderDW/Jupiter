#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\player.gsc;
#using script_58f20490049af6ac;

#namespace revive_teammate;

// Namespace revive_teammate / namespace_503872f9ebd8a16f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111
// Size: 0xd
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&evaluatescore);
}

// Namespace revive_teammate / namespace_503872f9ebd8a16f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127
// Size: 0x127
function evaluatescore(bot) {
    victim = bot function_e7b671a6a101c0df();
    if (!isdefined(victim)) {
        return 0;
    }
    self.var_df9d35d9b4bee654 = createactionbase("revive_teammate", victim, "main", "", &actionprocess, self, &function_f4caae7e8af9d32c);
    var_47748ead6297784b = distance(bot.origin, victim.origin);
    basescore = function_9d1ab012058221bb(var_47748ead6297784b, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef);
    var_c3f669f8cd557637 = bot function_a0fbe39135ab0d35();
    var_20e68057b05a543 = gettime() - var_c3f669f8cd557637;
    var_da6670be3bc98f68 = function_9d1ab012058221bb(var_20e68057b05a543, self.constants.var_6477b93fa7db5161, self.constants.var_afb9ac7095182ae5);
    basescore += var_da6670be3bc98f68;
    basescore *= self.constants.var_48b2040db1860373;
    return basescore;
}

// Namespace revive_teammate / namespace_503872f9ebd8a16f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x74
function function_e7b671a6a101c0df() {
    aliveplayers = scripts\mp\utility\teams::getteamdata(self.team, "alivePlayers");
    foreach (victim in aliveplayers) {
        if (isvalidvictim(victim, self)) {
            return victim;
        }
    }
    return undefined;
}

// Namespace revive_teammate / namespace_503872f9ebd8a16f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4
// Size: 0xfb
function actionprocess(bot) {
    var_9adb3cc75347d013 = 64;
    victim = self.argument;
    assert(isdefined(victim));
    victim endon("death_or_disconnect");
    while (true) {
        bot function_9e400058ef021b03(victim.origin, var_9adb3cc75347d013);
        result = bot waittill_any_in_array_or_timeout(["goal", "bad_path"], 1);
        if (result == "bad_path") {
            return result;
        } else if (!isvalidvictim(victim, bot)) {
            return "Invalid victim";
        }
        if (distancesquared(bot.origin, victim.origin) <= var_9adb3cc75347d013 * var_9adb3cc75347d013) {
            bot function_8b201bccc0aa3695(victim.origin, 0.5);
            waitframe();
            bot botsetflag("disable_movement", 1);
            bot botclearscriptgoal();
            revivevictim(bot, victim);
            return;
        }
    }
}

// Namespace revive_teammate / namespace_503872f9ebd8a16f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d7
// Size: 0x5d
function revivevictim(reviver, victim) {
    /#
        function_f3cf203834e48c6d("<dev string:x1c>");
    #/
    presstime = level.laststandrevivetimer + 1;
    reviver botpressbutton("use", presstime);
    wait presstime + 0.5;
    /#
        function_f3cf203834e48c6d("<dev string:x25>");
    #/
}

// Namespace revive_teammate / namespace_503872f9ebd8a16f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x4e
function isvalidvictim(victim, reviver) {
    return isvalidplayer(victim) && victim != reviver && scripts\mp\utility\player::isinlaststand(victim) && namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(victim.origin) && !victim function_b74cf5eb822312cb(1);
}

// Namespace revive_teammate / namespace_503872f9ebd8a16f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x493
// Size: 0x21
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botsetflag("disable_movement", 0);
    }
}

