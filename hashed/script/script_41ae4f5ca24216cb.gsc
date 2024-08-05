#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using script_187a04151c40fb72;
#using script_293bc33bd79cabd1;
#using scripts\cp\cp_awards.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_74502a9e0ef1f19c;
#using script_3bcaa2cbaf54abdd;
#using scripts\cp\cp_gamescore.gsc;
#using script_467f0fdfdd155a45;
#using scripts\cp\cp_weaponrank.gsc;

#namespace points;

// Namespace points / namespace_6099285b4066f63b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4
// Size: 0x10
function initpoints() {
    level.var_97e29f66f7229f48 = &doScoreEvent;
}

// Namespace points / namespace_6099285b4066f63b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc
// Size: 0x72
function givestreakpointswithtext(event, objweapon, pointsoverride) {
    if (isdefined(level.ignorescoring)) {
        return;
    }
    if (isdefined(pointsoverride)) {
        points = pointsoverride;
    } else {
        points = namespace_5aac85eab99c40a::getscoreinfovalue(event);
        assertex(isdefined(points), "giveStreakPointsWithText() with event \"" + event + "\", but that event doesn't exist in the gametype's scoreeventlist asset.");
    }
    points = modifyunifiedpoints(event, points, objweapon);
    displayscoreeventpoints(points, event);
}

// Namespace points / namespace_6099285b4066f63b
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x436
// Size: 0x14c
function doScoreEvent(event, objweapon, pointsoverride, xpoverride, victim, var_51bdae03b05bc75e, dontwait, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo) {
    if (function_240f7f4e57340e8f()) {
        return;
    }
    if (istrue(level.gameended)) {
        isvalidevent = 0;
        if (isarray(event)) {
            if (isnumber(level.gameendtime)) {
                if (event[1] <= level.gameendtime) {
                    isvalidevent = 1;
                    event = event[0];
                }
            }
        } else if (isdefined(event)) {
            isvalidevent = 1;
        }
        if (!isvalidevent) {
            return;
        }
    } else if (isarray(event)) {
        event = event[0];
    }
    if (istrue(self.pers["ignoreWeaponKillXP"])) {
        objweapon = undefined;
    }
    showsplash = namespace_5aac85eab99c40a::function_e3dfd7e570749681(event);
    if (showsplash) {
        thread namespace_22a50d845d3deb2d::killeventtextpopup(event, 1);
    }
    if (namespace_5aac85eab99c40a::function_34294184e90b96c(event)) {
        scripts\cp\cp_awards::givemidmatchaward(event, objweapon, pointsoverride, xpoverride, var_51bdae03b05bc75e, dontwait, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo);
        return;
    }
    giveunifiedpoints(event, objweapon, pointsoverride, xpoverride, victim, cankillchain, streakinfo, var_ad8c6c5cc50af10b, eventinfo);
}

// Namespace points / namespace_6099285b4066f63b
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x58a
// Size: 0x352
function giveunifiedpoints(event, objweapon, pointsoverride, xpoverride, victim, cankillchain, streakinfo, var_827c276da1cdcf23, eventinfo) {
    if (function_240f7f4e57340e8f()) {
        return;
    }
    if (istrue(level.gameended)) {
        isvalidevent = 0;
        if (isarray(event)) {
            if (isnumber(level.gameendtime)) {
                if (event[1] <= level.gameendtime) {
                    isvalidevent = 1;
                    event = event[0];
                }
            }
        } else if (isdefined(event)) {
            isvalidevent = 1;
        }
        if (!isvalidevent) {
            return;
        }
    } else if (isarray(event)) {
        event = event[0];
    }
    if (istrue(self.pers["ignoreWeaponKillXP"])) {
        objweapon = undefined;
    }
    if (!function_d03495fe6418377b(event)) {
        assertex(1, event);
        event = function_1823ff50bb28148d(event);
    }
    if (istrue(level.ignorescoring)) {
        var_587eb1f4e11a34f3 = 1;
        var_e7a7e20ec68138e3 = scripts\cp_mp\utility\game_utility::isbrstylegametype() && !scripts\cp\utility::gameflag("prematch_done");
        if (var_e7a7e20ec68138e3) {
            var_587eb1f4e11a34f3 = 0;
        }
        if (var_587eb1f4e11a34f3) {
            return;
        }
    }
    if (istrue(game["practiceRound"])) {
        return;
    }
    if (isdefined(pointsoverride)) {
        points = pointsoverride;
    } else {
        points = namespace_5aac85eab99c40a::getscoreinfovalue(event);
        assertex(isdefined(points), "giveUnifiedPoints() with event \"" + function_3c8848a3a11b2553(event) + "\", but that event doesn't exist in the gametype's scoreeventlist asset");
        if (!isdefined(points)) {
            points = 0;
        }
    }
    points = modifyunifiedpoints(event, points, objweapon);
    if (isdefined(objweapon)) {
        weaponobj = namespace_a0628d6954815ef8::mapweapon(objweapon);
        sweapon = getcompleteweaponname(weaponobj);
    }
    if (isdefined(streakinfo)) {
        streakinfo.score += points;
    }
    isassist = event == #"assist";
    iskill = event == #"kill";
    supermultiplier = 1;
    if (iskill || isassist) {
    }
    var_798ada8b24ba4887 = 1;
    if (isdefined(xpoverride) && xpoverride < 0) {
        var_798ada8b24ba4887 = 0;
    }
    if (var_798ada8b24ba4887) {
        xp = xpoverride;
        if (!isdefined(xp)) {
            if (isdefined(pointsoverride)) {
                xp = points;
            } else {
                xp = namespace_5aac85eab99c40a::getscoreinfoxp(event);
            }
        }
        xp = default_to(xp, 0);
        if (iskill) {
            if (isdefined(objweapon)) {
                var_9bcadacc6ecad1 = objweapon hasattachment("gunperk_xp") || _hasperk("specialty_gunperk_xp");
                if (var_9bcadacc6ecad1) {
                    xp += 20;
                }
            }
        }
        var_e9f5dfee6649f67a = isdefined(self.pers) && istrue(self.pers["ignoreWeaponKillXP"]);
        thread namespace_5aac85eab99c40a::giverankxp(event, xp, objweapon, undefined, undefined, var_e9f5dfee6649f67a, undefined, eventinfo);
    }
    thread namespace_22a50d845d3deb2d::killeventtextpopup(event, 0);
    if (istrue(level.var_1e17e3480b1d264d) && isdefined(level.var_9c1e3c18b99409e9) && points > 0 && event != "br_kioskBuy") {
        /#
        #/
        self [[ level.var_9c1e3c18b99409e9 ]](points);
    }
}

// Namespace points / namespace_6099285b4066f63b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e4
// Size: 0xc8
function give_munition_currency(amount) {
    var_8334742fe1363a27 = namespace_6c67e93a4c487d83::get_player_munition_currency();
    amount = scripts\cp\cp_gamescore::round_up_to_nearest(amount, 5);
    if (isdefined(self.totalmuncurrencyearned) && isdefined(self.maxmuncurrencycap)) {
        if (self.totalmuncurrencyearned > self.maxmuncurrencycap) {
            /#
                if (isdefined(self.totalweaponxpearned)) {
                    self iprintln("<dev string:x1c>" + self.totalweaponxpearned);
                }
            #/
            amount = 0;
        } else {
            self.totalmuncurrencyearned += amount;
        }
    }
    var_b4187ec006e2d1e2 = namespace_6c67e93a4c487d83::get_player_max_currency();
    var_98afd1ce36f4905a = var_8334742fe1363a27 + amount;
    var_98afd1ce36f4905a = min(var_98afd1ce36f4905a, var_b4187ec006e2d1e2);
    namespace_6c67e93a4c487d83::set_player_munition_currency(var_98afd1ce36f4905a);
}

// Namespace points / namespace_6099285b4066f63b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9b4
// Size: 0x84
function modifyunifiedpoints(event, points, objweapon) {
    if (event == #"damage") {
        return 0;
    }
    var_a485d3a2171216fe = 0;
    if (isdefined(objweapon)) {
        if (event == "kill" && objweapon hasattachment("gunperk_xp")) {
            var_a485d3a2171216fe += 20;
        }
    }
    points += var_a485d3a2171216fe;
    if (isdefined(level.modifyunifiedpointscallback)) {
        points = [[ level.modifyunifiedpointscallback ]](points, event, self, objweapon);
    }
    return int(points);
}

// Namespace points / namespace_6099285b4066f63b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa41
// Size: 0xa1
function displayscoreeventpoints(points, event) {
    if (getdvarint(@"scr_disableScoreSplash", 0) == 1) {
        return;
    }
    if (function_93d685ac42f15c61()) {
        return;
    } else if (isdefined(self.totalxpearned) && isdefined(self.maxxpcap)) {
        if (self.totalxpearned >= self.maxxpcap) {
            return;
        }
    }
    if (!isdefined(level.skippointdisplayxp)) {
        var_dc03362b77c5058d = 0;
        if (issimultaneouskillenabled()) {
            var_dc03362b77c5058d = event == #"kill";
        }
        thread namespace_5aac85eab99c40a::scorepointspopup(points, var_dc03362b77c5058d);
    }
}

// Namespace points / namespace_6099285b4066f63b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaea
// Size: 0x5e
function isnokillstreakprogressweapon(objweapon) {
    if (!isdefined(objweapon)) {
        return false;
    }
    if (isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    switch (objweapon.basename) {
    case #"hash_2f1a9d8e2f127205":
    case #"hash_a622e958420b92a0":
    case #"hash_fd9c279f85990dad": 
        return true;
    }
    return false;
}

// Namespace points / namespace_6099285b4066f63b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb51
// Size: 0x6a
function isforcekillstreakprogressweapon(objweapon) {
    if (!isdefined(objweapon)) {
        return false;
    }
    if (isstring(objweapon)) {
        objweapon = makeweapon(objweapon);
    }
    switch (objweapon.basename) {
    case #"hash_2de2eefce564d9cc":
    case #"hash_448b7248104bfa9c":
    case #"hash_a13a4988b0d2c105":
    case #"hash_aacdf3a6d5b91585": 
        return true;
    }
    return false;
}

// Namespace points / namespace_6099285b4066f63b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbc4
// Size: 0x93
function calculatematchbonus(matchresult, gamelength) {
    matchbonusbaseline = 250;
    var_f5c150745db5bf66 = gamelength / 60;
    var_30fb07c2ca202ff = namespace_5aac85eab99c40a::function_6d17f84162f0d8f0(matchresult);
    modescalar = namespace_5aac85eab99c40a::getgametypexpmultiplier();
    if (scripts\cp\utility::function_138028ca2b958511()) {
        var_479ff69364253676 = getdvarint(@"hash_7f9d5cd3ca6245a4", 4);
        modescalar *= var_479ff69364253676;
    }
    matchbonus = int(matchbonusbaseline * var_30fb07c2ca202ff * modescalar);
    return matchbonus;
}

// Namespace points / namespace_6099285b4066f63b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc60
// Size: 0x3af
function updatematchbonusscores(winner) {
    gamelength = namespace_1d99ddaf3fc03543::get_play_time() / 1000;
    gamelength = min(gamelength, 1200);
    if (level.teambased) {
        if (winner != "tie") {
            setwinningteam(winner);
        }
        foreach (player in level.players) {
            if (isdefined(player.connectedpostgame)) {
                continue;
            }
            if (player.timeplayed["total"] < 1 || player.pers["participation"] < 1) {
                continue;
            }
            if (istrue(level.hostforcedend) && player ishost()) {
                continue;
            }
            if (!istrue(player.pers["hasDoneAnyCombat"])) {
                continue;
            }
            if (winner == "tie") {
                playerscore = player calculatematchbonus("tie", gamelength);
                player thread givematchbonus("tie", playerscore);
                player.matchbonus = playerscore;
            } else if (isdefined(player.pers["team"]) && player.pers["team"] == winner) {
                playerscore = player calculatematchbonus("win", gamelength);
                player thread givematchbonus("win", playerscore);
                player.matchbonus = playerscore;
            } else if (isdefined(player.pers["team"]) && player.pers["team"] != winner) {
                playerscore = player calculatematchbonus("loss", gamelength);
                player thread givematchbonus("loss", playerscore);
                player.matchbonus = playerscore;
            }
            player calculateweaponmatchbonus(gamelength);
        }
        return;
    }
    winnerresult = "win";
    loserresult = "loss";
    if (!isdefined(winner)) {
        winnerresult = "tie";
        loserresult = "tie";
    }
    foreach (player in level.players) {
        if (isdefined(player.connectedpostgame)) {
            continue;
        }
        if (player.timeplayed["total"] < 1 || player.pers["participation"] < 1) {
            continue;
        }
        if (!istrue(player.pers["hasDoneAnyCombat"])) {
            continue;
        }
        iswinner = 0;
        for (pidx = 0; pidx < min(level.placement["all"].size, 3); pidx++) {
            if (level.placement["all"][pidx] != player) {
                continue;
            }
            iswinner = 1;
        }
        if (iswinner) {
            playerscore = player calculatematchbonus(winnerresult, gamelength);
            player thread givematchbonus("win", playerscore);
            player.matchbonus = playerscore;
        } else {
            playerscore = player calculatematchbonus(loserresult, gamelength);
            player thread givematchbonus("loss", playerscore);
            player.matchbonus = playerscore;
        }
        player calculateweaponmatchbonus(gamelength);
    }
}

// Namespace points / namespace_6099285b4066f63b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1017
// Size: 0x87
function givematchbonus(scoretype, score) {
    self endon("disconnect");
    level waittill("give_match_bonus");
    namespace_5aac85eab99c40a::giverankxp(function_1823ff50bb28148d(scoretype), score);
    if (scoretype == "win") {
        thread doScoreEvent(#"hash_fe606101a22e3e79");
        return;
    }
    assertex(scoretype == "tie" || scoretype == "loss", "Unexpected scoreType for giveMatchBonus(), \"" + scoretype + "\"");
    thread doScoreEvent(#"match_complete");
}

// Namespace points / namespace_6099285b4066f63b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a6
// Size: 0x2d5
function calculateweaponmatchbonus(gamelength) {
    gamelength = 600;
    if (istrue(self.pers["ignoreWeaponMatchBonus"]) || !isdefined(self.pers["killsPerWeapon"])) {
        return;
    }
    var_11865501de9083d = scripts\cp\cp_weaponrank::getgametypekillsperhouravg() / 60;
    var_f5c150745db5bf66 = gamelength / 60;
    var_162a122a3e3cce1a = int(var_11865501de9083d * var_f5c150745db5bf66);
    killincrement = int(50);
    var_9bf173c2aa7eb966 = killincrement * 1;
    var_4b7cf89acaabdcac = int(var_162a122a3e3cce1a * var_9bf173c2aa7eb966);
    var_4b7cf89acaabdcac -= int(self.pers["weaponMatchBonusKills"] * var_9bf173c2aa7eb966);
    if (var_4b7cf89acaabdcac <= 0) {
        return;
    }
    totaldiff = 0;
    foreach (data in self.pers["killsPerWeapon"]) {
        totaldiff += var_162a122a3e3cce1a - data.killcount;
    }
    if (totaldiff <= 0) {
        return;
    }
    foreach (data in self.pers["killsPerWeapon"]) {
        ratio = (var_162a122a3e3cce1a - data.killcount) / totaldiff;
        xpgain = int(var_4b7cf89acaabdcac * ratio);
        namespace_5aac85eab99c40a::incrankxp(0, data, xpgain, function_1823ff50bb28148d("WeaponMatchBonus"));
        foreach (datastruct in self.pers["weaponStats"]) {
            if (issubstr(var_10ca4bf7aa9c3ed2, weaponkey)) {
                if (isdefined(datastruct.stats["kills"]) && data.killcount > 0) {
                    specificratio = ratio * datastruct.stats["kills"] / data.killcount;
                    xpgain = int(var_4b7cf89acaabdcac * specificratio);
                    if (isdefined(datastruct.stats["xp_earned"])) {
                        datastruct.stats["xp_earned"] = datastruct.stats["xp_earned"] + xpgain;
                        continue;
                    }
                    datastruct.stats["xp_earned"] = xpgain;
                }
            }
        }
    }
}

// Namespace points / namespace_6099285b4066f63b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1383
// Size: 0x62
function sethasdonecombat(player, newhasdonecombat) {
    if (newhasdonecombat && !istrue(player.hasdonecombat)) {
    }
    player.hasdonecombat = newhasdonecombat;
    if (newhasdonecombat && !istrue(player.pers["hasDoneAnyCombat"])) {
        player.pers["hasDoneAnyCombat"] = 1;
    }
}

