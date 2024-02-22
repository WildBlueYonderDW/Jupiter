// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\cranked.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\matchdata.gsc;

#namespace game_utility;

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11cf
// Size: 0x13
function getotherteam(team) {
    return getenemyteams(team);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ea
// Size: 0x21
function getroundlength() {
    if (!isdefined(level.starttime)) {
        return 0;
    }
    return gettime() - level.starttime;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1213
// Size: 0x1e
function getgamelength() {
    if (!isdefined(game["gameLength"])) {
        return 0;
    }
    return getroundlength() + game["gameLength"];
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1239
// Size: 0x30
function gettimepassedpercentage() {
    timelimit = gettimelimit();
    if (timelimit == 0) {
        return 0;
    }
    return gettimepassed() / gettimelimit() * 1000 * 100;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1271
// Size: 0xd
function getsecondspassed() {
    return gettimepassed() / 1000;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1286
// Size: 0xc
function getminutespassed() {
    return getsecondspassed() / 60;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129a
// Size: 0x91
function setuipostgamefade(fadetoblack, delay) {
    self endon("disconnect");
    if (istrue(level.nukeinfo.detonated)) {
        return;
    }
    if (istrue(level.var_ebb6ebb71ce4a007)) {
        return;
    }
    if (isdefined(self.var_a1192fa9f37ce26d) && self.var_a1192fa9f37ce26d == fadetoblack) {
        return;
    }
    if (!fadetoblack && !istrue(self.var_a1192fa9f37ce26d)) {
        return;
    }
    if (isdefined(delay)) {
        wait(delay);
    }
    self.var_a1192fa9f37ce26d = fadetoblack;
    namespace_36f464722d326bbe::fadetoblackforplayer(self, fadetoblack, 0.5);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1332
// Size: 0xa8
function registerroundswitchdvar(dvarstring, defaultvalue, minvalue, maxvalue) {
    registerwatchdvarint("roundswitch", defaultvalue);
    dvarstring = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", dvarstring, "_roundswitch");
    level.roundswitchdvar = dvarstring;
    level.roundswitchmin = minvalue;
    level.roundswitchmax = maxvalue;
    level.roundswitch = getdvarint(dvarstring, defaultvalue);
    if (level.roundswitch < minvalue) {
        level.roundswitch = minvalue;
    } else if (level.roundswitch > maxvalue) {
        level.roundswitch = maxvalue;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0x21
function registerroundlimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("roundlimit", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1409
// Size: 0x21
function registernumteamsdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("numTeams", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1431
// Size: 0x21
function registerwinlimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("winlimit", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1459
// Size: 0x21
function registerwinbytwoenableddvar(dvarstring, defaultvalue) {
    registerwatchdvarint("winbytwoenabled", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1481
// Size: 0x21
function registerwinbytwomaxroundsdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("winbytwomaxrounds", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a9
// Size: 0x21
function registerdogtagsenableddvar(dvarstring, defaultvalue) {
    registerwatchdvarint("dogtags", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d1
// Size: 0x21
function registerscorelimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("scorelimit", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f9
// Size: 0x36
function registertimelimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarfloat("timelimit", defaultvalue);
    setdvar(@"hash_308aa4aa717d1b73", gettimelimit());
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1536
// Size: 0x36
function registerhalftimedvar(dvarstring, defaultvalue) {
    registerwatchdvarint("halftime", defaultvalue);
    setdvar(@"hash_39ee97c0c58089e1", gethalftime());
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1573
// Size: 0x21
function registernumlivesdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("numlives", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159b
// Size: 0x21
function registernumrevivesdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("numrevives", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c3
// Size: 0x21
function function_704789086c9ad943(dvarstring, defaultvalue) {
    registerwatchdvarint("pointsPerKill", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15eb
// Size: 0x1c
function setovertimelimitdvar(value) {
    setdvar(@"hash_c7938f963b6cdb73", value);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160e
// Size: 0x19
function registerlaststandhealthdvar(defaultvalue) {
    registerwatchdvarint("lastStandHealth", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162e
// Size: 0x19
function registerlaststandrevivehealthdvar(defaultvalue) {
    registerwatchdvarint("lastStandReviveHealth", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164e
// Size: 0x19
function registerlaststandtimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandTimer", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166e
// Size: 0x19
function registerlaststandrevivetimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandReviveTimer", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168e
// Size: 0x19
function registerlaststandweapondvar(defaultvalue) {
    registerwatchdvar("lastStandWeapon", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ae
// Size: 0x19
function registerlaststandweapondelaydvar(defaultvalue) {
    registerwatchdvarfloat("lastStandWeaponDelay", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ce
// Size: 0x19
function registerlaststandsuicidetimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandSuicideTimer", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ee
// Size: 0x19
function registerlaststandinvulntimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandInvulnTimer", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170e
// Size: 0x19
function registerlaststandrevivedecayscaledvar(defaultvalue) {
    registerwatchdvarfloat("lastStandReviveDecayScale", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172e
// Size: 0x19
function function_65c4cae95d0c833b(defaultvalue) {
    registerwatchdvarint("teamReviveHealth", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174e
// Size: 0x19
function function_c2bd90ff953a0ce4(defaultvalue) {
    registerwatchdvarfloat("teamReviveTime", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176e
// Size: 0x19
function function_2597b9cd72447cb6(defaultvalue) {
    registerwatchdvarfloat("teamReviveTimeout", defaultvalue);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178e
// Size: 0xa6
function isroundbased() {
    if (!level.teambased) {
        return 0;
    }
    if (level.winlimit != 1 && level.roundlimit != 1) {
        return 1;
    }
    if (getgametype() == "sr" || function_60bf8d82001fc22c() == "sd" || getgametype() == "siege" || getgametype() == "cyber" || getgametype() == "mtmc" || function_60bf8d82001fc22c() == "control" || getgametype() == "wm") {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183c
// Size: 0x22
function isfirstround() {
    if (!level.teambased) {
        return 1;
    }
    if (game["roundsPlayed"] == 0) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1866
// Size: 0x188
function nextroundisfinalround() {
    if (level.forcedend) {
        return 1;
    }
    if (!level.teambased) {
        return 1;
    }
    if (level.roundlimit > 1 && game["roundsPlayed"] >= level.roundlimit - 1 && !istimetobeatrulegametype() && !isscoretobeatrulegametype()) {
        return 1;
    }
    if (isovertimesupportedgametype() && (hitroundlimit() || hitwinlimit())) {
        if (shouldplaywinbytwo() && islastwinbytwo()) {
            return 1;
        } else if (istimetobeatrulegametype() || isscoretobeatrulegametype()) {
            if (game["overtimeRoundsPlayed"] == 1) {
                return 1;
            }
        } else if (!level.playovertime) {
            return 1;
        }
    }
    var_1aa7d78f771c4fe = 0;
    foreach (entry in level.teamnamelist) {
        roundswon = getroundswon(entry);
        if (roundswon == level.winlimit - 1) {
            var_1aa7d78f771c4fe = 1;
            break;
        }
    }
    var_2e8dfeaa03398ee5 = level.winlimit > 0 && var_1aa7d78f771c4fe;
    if (var_2e8dfeaa03398ee5 && allteamstied()) {
        if (isovertimesupportedgametype()) {
            return 0;
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f6
// Size: 0x168
function nextroundismatchpoint() {
    if (level.forcedend) {
        return 1;
    }
    if (!level.teambased) {
        return 1;
    }
    if (level.roundlimit > 1 && game["roundsPlayed"] >= level.roundlimit - 1 && !istimetobeatrulegametype() && !isscoretobeatrulegametype()) {
        return 1;
    }
    if (isovertimesupportedgametype() && (hitroundlimit() || hitwinlimit())) {
        if (shouldplaywinbytwo() && islastwinbytwo()) {
            return 1;
        } else if (istimetobeatrulegametype() || isscoretobeatrulegametype()) {
            if (game["overtimeRoundsPlayed"] == 1) {
                return 1;
            }
        } else if (!level.playovertime) {
            return 1;
        }
    }
    var_1aa7d78f771c4fe = 0;
    foreach (entry in level.teamnamelist) {
        roundswon = getroundswon(entry);
        if (roundswon == level.winlimit - 1) {
            if (shouldplaywinbytwo() && istrue(game["displayedMatchPoint"])) {
                game["displayedMatchPoint"] = 0;
            }
            return 1;
        }
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b66
// Size: 0x5e
function wasonlyround() {
    if (level.playovertime) {
        return 0;
    }
    if (!level.teambased) {
        return 1;
    }
    if (isdefined(level.onlyroundoverride)) {
        return 0;
    }
    if (level.winlimit == 1 && hitwinlimit()) {
        return 1;
    }
    if (level.roundlimit == 1) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcc
// Size: 0xe3
function waslastround() {
    if (level.forcedend) {
        return 1;
    }
    if (isdefined(level.nukeinfo) && istrue(level.nukeinfo.gameover)) {
        return 1;
    }
    if (istrue(level.ctfnukeended)) {
        return 1;
    }
    if (wasonlyround()) {
        return 1;
    }
    if (!level.teambased) {
        return 1;
    }
    if (hitroundlimit() || hitwinlimit()) {
        return !level.playovertime;
    }
    if (getgametype() == "ballmode") {
        if (game["status"] == "overtime") {
            return 1;
        }
        timeremaining = namespace_d576b6dc7cef9c62::gettimeremaining();
        if (timeremaining <= 0) {
            return 1;
        }
    }
    if (getgametype() == "wm") {
        if (game["roundsPlayed"] == 2) {
            return 1;
        }
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb7
// Size: 0x71
function iswinbytworulegametype() {
    switch (getgametype()) {
    case #"hash_53825b446469ac4c":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        return (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoEnabled"), 0) == 1);
        break;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d30
// Size: 0x2a
function getmaxwinbytworounds() {
    return getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoMaxRounds"), level.winlimit);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d62
// Size: 0x5a
function shouldplaywinbytwo() {
    alliesscore = game["roundsWon"]["allies"];
    axisscore = game["roundsWon"]["axis"];
    return iswinbytworulegametype() && abs(alliesscore - axisscore) < 2 && game["overtimeRoundsPlayed"] < getmaxwinbytworounds();
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc4
// Size: 0x1e
function islastwinbytwo() {
    return shouldplaywinbytwo() && game["overtimeRoundsPlayed"] == getmaxwinbytworounds() - 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dea
// Size: 0x3e
function function_2f1b2a4a64257bea() {
    alliesscore = game["roundsWon"]["allies"];
    axisscore = game["roundsWon"]["axis"];
    return abs(alliesscore - axisscore) < 2;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e30
// Size: 0x39
function istimetobeatrulegametype() {
    switch (getgametype()) {
    case #"hash_1a5d186c17c00d3c":
    case #"hash_51347b2eb89b24c4":
    case #"hash_c749446269c21985":
        return 1;
        break;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e71
// Size: 0x1c
function intimetobeat() {
    return isdefined(game["status"]) && game["status"] == "recordTTB";
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e95
// Size: 0xa9
function settimetobeat(team) {
    if (!istimetobeatrulegametype()) {
        return 0;
    }
    var_282ec5b083cd0bee = getsecondspassed();
    score = namespace_e8a49b70d0769b66::_getteamscore(team);
    if (!istimetobeatvalid() || var_282ec5b083cd0bee < game["timeToBeat"] && score >= game["timeToBeatScore"]) {
        if (game["timeToBeatTeam"] != "none" && game["timeToBeatTeam"] != team) {
            game["timeToBeatOld"] = game["timeToBeat"];
        }
        game["timeToBeat"] = var_282ec5b083cd0bee;
        game["timeToBeatTeam"] = team;
        game["timeToBeatScore"] = score;
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f46
// Size: 0xc
function istimetobeatvalid() {
    return game["timeToBeat"] != 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5a
// Size: 0x17
function shouldplaytimetobeatot() {
    return istimetobeatvalid() && game["overtimeRoundsPlayed"] == 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f79
// Size: 0x21
function isscoretobeatrulegametype() {
    switch (getgametype()) {
    case #"hash_8eb3658fb4985833":
        return 1;
        break;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa2
// Size: 0x156
function setscoretobeat(team, score) {
    if (!isscoretobeatrulegametype()) {
        return 0;
    }
    var_74876ceb45f023c3 = game["timeToBeatTeam"] != "none" && score == game["timeToBeatScore"];
    if (score >= game["timeToBeatScore"]) {
        if (game["timeToBeatTeam"] != "none" && game["timeToBeatTeam"] != team) {
            game["timeToBeatScoreOld"] = game["timeToBeatScore"];
        }
        game["timeToBeatTeam"] = team;
        game["timeToBeatScore"] = score;
    }
    foreach (player in level.players) {
        player setclientomnvar("ui_friendly_time_to_beat", ter_op(player.team == game["timeToBeatTeam"], game["timeToBeatScore"], game["timeToBeatScoreOld"]));
        player setclientomnvar("ui_enemy_time_to_beat", ter_op(player.team != game["timeToBeatTeam"], game["timeToBeatScore"], game["timeToBeatScoreOld"]));
    }
    if (var_74876ceb45f023c3) {
        return "tie";
    } else {
        return game["timeToBeatTeam"];
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ff
// Size: 0x17
function shouldplayscoretobeatot() {
    return isscoretobeatrulegametype() && game["overtimeRoundsPlayed"] == 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211e
// Size: 0xdc
function isovertimesupportedgametype() {
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_1a5d186c17c00d3c":
    case #"hash_1aac086c17fe5ccb":
    case #"hash_51347b2eb89b24c4":
    case #"hash_68e111ac56792b24":
    case #"hash_8eb3658fb4985833":
    case #"hash_a4803151db9c2947":
    case #"hash_b9aaf1c4459d9a15":
    case #"hash_c749446269c21985":
        return 1;
    case #"hash_53825b446469ac4c":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        return iswinbytworulegametype();
        break;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2202
// Size: 0xea
function getmaxovertimeroundsbygametype() {
    var_8127e47e743e3a3f = 0;
    switch (getgametype()) {
    case #"hash_1a5d186c17c00d3c":
    case #"hash_51347b2eb89b24c4":
    case #"hash_53825b446469ac4c":
    case #"hash_68e111ac56792b24":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_c749446269c21985":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        var_8127e47e743e3a3f = 2;
        break;
    case #"hash_1e4846dca3ccf38":
    case #"hash_1aac086c17fe5ccb":
    case #"hash_a4803151db9c2947":
    case #"hash_b9aaf1c4459d9a15":
    case #"hash_fa0ed2f6bd4f4395":
        var_8127e47e743e3a3f = 1;
        break;
    }
    if (isanymlgmatch() && !istimetobeatrulegametype()) {
        return -1;
    }
    return var_8127e47e743e3a3f;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f4
// Size: 0x56
function getwingamebytype() {
    if (!isdefined(level.wingamebytype)) {
        if (!isroundbased() || !isobjectivebased() || ismoddedroundgame()) {
            level.wingamebytype = "teamScores";
        } else {
            level.wingamebytype = "roundsWon";
        }
    }
    return level.wingamebytype;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2352
// Size: 0x33
function issimultaneouskillenabled() {
    if (!isdefined(level.simultaneouskillenabled)) {
        level.simultaneouskillenabled = getdvarint(@"hash_aa96b1e9c9809b8", 0) == 0;
    }
    return level.simultaneouskillenabled;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238d
// Size: 0x8d
function cantiebysimultaneouskill() {
    if (!issimultaneouskillenabled()) {
        return 0;
    }
    var_b6311bc566cfdd35 = 0;
    switch (getgametype()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_4b8799075d3a89b8":
    case #"hash_7485fa6c474ec865":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8f01ce022684fbc8":
    case #"hash_bc5ad0664c3cc103":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fb5b5e6c07253005":
        var_b6311bc566cfdd35 = 1;
        break;
    }
    return var_b6311bc566cfdd35;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2422
// Size: 0xbc
function shouldplayovertime() {
    var_453896f6c55ab413 = allteamstied();
    if (!hitroundlimit() && !hitwinlimit()) {
        return 0;
    }
    if (!isovertimesupportedgametype()) {
        return 0;
    }
    if (var_453896f6c55ab413 && inovertime()) {
        var_178e9c557e11fb83 = getmaxovertimeroundsbygametype();
        var_453896f6c55ab413 = ter_op(var_178e9c557e11fb83 == -1, 1, game["overtimeRoundsPlayed"] < var_178e9c557e11fb83);
    }
    var_b564bf7a9922b991 = shouldplaywinbytwo();
    var_4b3eea7964b200d2 = shouldplaytimetobeatot();
    var_974ea582db790ced = shouldplayscoretobeatot();
    return !level.forcedend && (var_453896f6c55ab413 || var_b564bf7a9922b991 || var_4b3eea7964b200d2 || var_974ea582db790ced);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e6
// Size: 0x58
function resetscoreonroundstart() {
    if (isdefined(level.resetscoreonroundstart)) {
        return [[ level.resetscoreonroundstart ]](inovertime());
    }
    return (getgametype() == "ctf" || getgametype() == "blitz") && !inovertime() && getwingamebytype() == "roundsWon";
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2546
// Size: 0x181
function canplayhalfwayvo() {
    if (!isdefined(level.didhalfscorevoboost)) {
        level.didhalfscorevoboost = 0;
    }
    if (level.didhalfscorevoboost) {
        return 0;
    }
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_ca6516c10db2c95":
    case #"hash_3a17de6e294210d2":
    case #"hash_4b8799075d3a89b8":
    case #"hash_51347b2eb89b24c4":
    case #"hash_6efb0f59a62300fb":
    case #"hash_7485fa6c474ec865":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_8f01ce022684fbc8":
    case #"hash_b9458959b10637f8":
    case #"hash_bc5ad0664c3cc103":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ddd385f0a27d71bb":
    case #"hash_ea061d29bbd1f237":
    case #"hash_ec24570718a340f5":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fa34c5f6bd6d4432":
        return 1;
    case #"hash_1a5d186c17c00d3c":
    case #"hash_53825b446469ac4c":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
    case #"hash_fb5b5e6c07253005":
        return 0;
    default:
        return 0;
        break;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ce
// Size: 0x30
function hittimelimit() {
    if (getwatcheddvar("timelimit") <= 0) {
        return 0;
    }
    timeleft = namespace_d576b6dc7cef9c62::gettimeremaining();
    if (timeleft > 0) {
        return 0;
    }
    return 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2706
// Size: 0x24
function hitroundlimit() {
    if (level.roundlimit <= 0) {
        return 0;
    }
    return game["roundsPlayed"] >= level.roundlimit;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2732
// Size: 0xf6
function hitscorelimit() {
    if (isobjectivebased()) {
        return 0;
    }
    if (level.roundscorelimit <= 0) {
        return 0;
    }
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            if (game["teamScores"][entry] >= level.roundscorelimit) {
                return 1;
            }
        }
    } else {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (isdefined(player.score) && player.score >= level.roundscorelimit) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2830
// Size: 0x87
function hitwinlimit() {
    if (level.winlimit <= 0) {
        return 0;
    }
    if (!level.teambased) {
        return 1;
    }
    foreach (entry in level.teamnamelist) {
        if (getroundswon(entry) >= level.winlimit) {
            return 1;
        }
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28bf
// Size: 0x3c
function getscorelimit() {
    if (isroundbased()) {
        if (level.roundlimit) {
            return level.roundlimit;
        } else {
            return level.winlimit;
        }
    } else {
        return level.roundscorelimit;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2902
// Size: 0x15
function getroundswon(team) {
    return game["roundsWon"][team];
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291f
// Size: 0x8a
function allteamstied() {
    wingamebytype = getwingamebytype();
    var_511cd90b67273662 = undefined;
    foreach (entry in level.teamnamelist) {
        if (!isdefined(var_511cd90b67273662)) {
            var_511cd90b67273662 = game[wingamebytype][entry];
        } else if (var_511cd90b67273662 != game[wingamebytype][entry]) {
            return 0;
        }
    }
    return 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b1
// Size: 0xc
function isobjectivebased() {
    return level.objectivebased;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c5
// Size: 0xae
function gettimelimit() {
    if (inovertime() && (!isdefined(game["inNukeOvertime"]) || !game["inNukeOvertime"])) {
        if (istrue(game["timeToBeat"])) {
            return game["timeToBeat"];
        } else {
            overtimelimit = getdvarfloat(@"hash_c7938f963b6cdb73");
            if (overtimelimit > 0) {
                return overtimelimit;
            } else {
                return getwatcheddvar("timelimit");
            }
        }
    } else if (isdefined(level.extratime) && level.extratime > 0) {
        return (getwatcheddvar("timelimit") + level.extratime);
    } else {
        return getwatcheddvar("timelimit");
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7a
// Size: 0x38
function gethalftime() {
    if (inovertime()) {
        return 0;
    } else if (isdefined(game["inNukeOvertime"]) && game["inNukeOvertime"]) {
        return 0;
    } else {
        return getwatcheddvar("halftime");
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab9
// Size: 0x1c
function inovertime() {
    return isdefined(game["status"]) && game["status"] == "overtime";
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2add
// Size: 0x93
function gamehasstarted() {
    if (isdefined(level.gamehasstarted)) {
        return level.gamehasstarted;
    }
    if (level.teambased) {
        foreach (team in level.teamnamelist) {
            if (getteamdata(team, "hasSpawned")) {
                return 1;
            }
        }
        return 0;
    }
    return level.maxplayercount > 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b78
// Size: 0xa9
function getlivingplayers(team) {
    var_f104a131c0a929a2 = [];
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (level.teambased && isdefined(team)) {
            if (team == player.pers["team"]) {
                var_f104a131c0a929a2[var_f104a131c0a929a2.size] = player;
            }
        } else {
            var_f104a131c0a929a2[var_f104a131c0a929a2.size] = player;
        }
    }
    return var_f104a131c0a929a2;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c29
// Size: 0x24
function rankingenabled() {
    if (!isplayer(self)) {
        return 0;
    }
    return level.rankedmatch && !self.usingonlinedataoffline;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c55
// Size: 0x24
function onlinestatsenabled() {
    if (!isplayer(self)) {
        return 0;
    }
    return level.onlinestatsenabled && !self.usingonlinedataoffline;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c81
// Size: 0x1e
function privatematch() {
    return level.onlinegame && getdvarint(@"hash_485ef1ed1d39d3a3");
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca7
// Size: 0x32
function lobbyteamselectenabled() {
    return level.systemlink || privatematch() && getdvarint(@"hash_eb8b825937d54d97", 0) || function_1eb7d2791d3c536f();
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce1
// Size: 0xc
function matchmakinggame() {
    return level.matchmakingmatch;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf5
// Size: 0xe
function getgametypenumlives() {
    return getwatcheddvar("numlives");
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0b
// Size: 0x28
function islifelimited() {
    if (!isdefined(level.numlifelimited)) {
        level.numlifelimited = getgametypenumlives();
    }
    return level.numlifelimited;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3b
// Size: 0xcd
function getlastlivingplayer(team) {
    var_ab9aadef5f024e12 = undefined;
    foreach (player in level.players) {
        if (isdefined(team) && player.team != team) {
            continue;
        }
        if (!player namespace_f8065cafc523dba5::_isalive() && !player namespace_99ac021a7547cae3::mayspawn()) {
            continue;
        }
        if (isdefined(player.switching_teams) && player.switching_teams) {
            continue;
        }
        /#
            assertex(!isdefined(var_ab9aadef5f024e12), "getLastLivingPlayer() found more than one live player on team.");
        #/
        var_ab9aadef5f024e12 = player;
    }
    return var_ab9aadef5f024e12;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e10
// Size: 0xa7
function trygetlastpotentiallivingplayer() {
    var_ab9aadef5f024e12 = undefined;
    foreach (player in level.players) {
        if (!player namespace_f8065cafc523dba5::_isalive() && !player namespace_99ac021a7547cae3::mayspawn()) {
            continue;
        }
        if (istrue(level.codcasterenabled)) {
            jumpiffalse(player iscodcaster()) LOC_0000007a;
        } else if (isdefined(var_ab9aadef5f024e12)) {
            return undefined;
        } else {
            var_ab9aadef5f024e12 = player;
        }
    }
    if (isdefined(var_ab9aadef5f024e12)) {
        return var_ab9aadef5f024e12;
    } else {
        return undefined;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebe
// Size: 0x95
function getpotentiallivingplayers() {
    var_677ae66df2125f53 = [];
    foreach (player in level.players) {
        if (!player namespace_f8065cafc523dba5::_isalive() && !player namespace_99ac021a7547cae3::mayspawn()) {
            continue;
        }
        if (istrue(level.codcasterenabled)) {
            jumpiffalse(player iscodcaster()) LOC_0000007a;
        } else {
        LOC_0000007a:
            var_677ae66df2125f53[var_677ae66df2125f53.size] = player;
        }
    }
    return var_677ae66df2125f53;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5b
// Size: 0x49
function denysystemicteamchoice() {
    if (!isbot(self) && !istestclient(self)) {
        if (isintournament()) {
            return 1;
        }
        if (istrue(level.codcasterenabled)) {
            return 0;
        }
    }
    if (getdvarint(@"hash_c11db9baa9e5bc9b", 0) > 0) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fac
// Size: 0x28
function allowteamassignment() {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        return level.teambased;
    }
    allowed = doesmodesupportplayerteamchoice();
    return allowed;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fdc
// Size: 0x78
function doesmodesupportplayerteamchoice() {
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        if (getgametype() == "gun" || namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
            return 0;
        }
        allowed = int(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 4));
        /#
            assert(isdefined(allowed));
        #/
        return (allowed > 0);
    }
    return istrue(level.var_62f6f7640e4431e3.var_71b14066991700ec);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305c
// Size: 0xe0
function allowclasschoice() {
    if (getdvarint(@"hash_c11db9baa9e5bc9b", 0) > 0) {
        return 0;
    }
    if (getdvarint(@"hash_f195e306ffa755d0", 0) == 1) {
        return 0;
    }
    if (isdefined(level.allowclasschoicefunc)) {
        var_874f942ccd7d034b = self [[ level.allowclasschoicefunc ]]();
        if (isdefined(var_874f942ccd7d034b)) {
            return var_874f942ccd7d034b;
        }
    }
    if (gameflag("infil_will_run") && isdefined(level.bypassclasschoicefunc)) {
        return 0;
    }
    if (istrue(level.denyclasschoice)) {
        return 0;
    }
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        allowed = int(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 5));
        /#
            assert(isdefined(allowed));
        #/
        return allowed;
    }
    return istrue(level.var_62f6f7640e4431e3.allowclasschoice);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3144
// Size: 0x4
function showfakeloadout() {
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3150
// Size: 0x8f
function setfakeloadoutweaponslot(sweapon, var_7ebc888be394a18e) {
    weaponname = namespace_e0ee43ef2dddadaa::getweaponrootname(sweapon);
    attachments = [];
    if (weaponname != "iw8_knife") {
        attachments = getweaponattachments(sweapon);
    }
    for (i = 0; i < 3; i++) {
        var_b519f801a23677bf = -1;
        if (isdefined(attachments[i])) {
            if (!namespace_68e641469fde3fa7::isattachmentsniperscopedefault(sweapon, attachments[i])) {
                var_b519f801a23677bf = tablelookuprownum("mp/attachmenttable.csv", 4, attachments[i]);
            }
        }
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e6
// Size: 0x1091
function setcommonrulesfrommatchrulesdata(skipfriendlyfire) {
    teamcount = getmatchrulesdata("commonOption", "teamCount");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_teamcount"), teamcount);
    teamsize = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_teamsize"), teamsize);
    timelimit = getmatchrulesdata("commonOption", "timeLimit");
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 1) {
        /#
            println("sr");
        #/
        if (isdefined(game["gameStateRestore"]) && game["gameStateRestore"].enabled) {
            /#
                println("blitz");
            #/
            timelimit = game["gameStateRestore"].gametime;
        }
    }
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timeLimit"), timelimit);
    registertimelimitdvar(getgametype(), timelimit);
    level.var_cbd35282359dd3fd = timelimit;
    scorelimit = getmatchrulesdata("commonOption", "scoreLimit");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_scoreLimit"), scorelimit);
    registerscorelimitdvar(getgametype(), scorelimit);
    winlimit = getmatchrulesdata("commonOption", "winLimit");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_winLimit"), winlimit);
    registerwinlimitdvar(getgametype(), winlimit);
    roundlimit = getmatchrulesdata("commonOption", "roundLimit");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundLimit"), roundlimit);
    registerroundlimitdvar(getgametype(), roundlimit);
    roundswitch = getmatchrulesdata("commonOption", "roundSwitch");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundSwitch"), roundswitch);
    registerroundswitchdvar(getgametype(), roundswitch, 0, 9);
    winbytwoenabled = getmatchrulesdata("commonOption", "winByTwoEnabled");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoEnabled"), winbytwoenabled);
    registerwinbytwoenableddvar(getgametype(), winbytwoenabled);
    winbytwomaxrounds = getmatchrulesdata("commonOption", "winByTwoMaxRounds");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoMaxRounds"), winbytwomaxrounds);
    registerwinbytwomaxroundsdvar(getgametype(), winbytwomaxrounds);
    dogtags = getmatchrulesdata("commonOption", "dogTags");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_dogTags"), dogtags);
    registerdogtagsenableddvar(getgametype(), dogtags);
    spawnprotectiontimer = getmatchrulesdata("commonOption", "spawnProtectionTimer");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_spawnProtectionTimer"), spawnprotectiontimer);
    numlives = getmatchrulesdata("commonOption", "numLives");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), numlives);
    registernumlivesdvar(getgametype(), numlives);
    numrevives = getmatchrulesdata("commonOption", "numRevives");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numRevives"), numrevives);
    registernumrevivesdvar(getgametype(), numrevives);
    setdynamicdvar(@"hash_b1d561f9a9241e09", getmatchrulesdata("commonOption", "maxHealth"));
    setdynamicdvar(@"hash_2922210021914dd7", getmatchrulesdata("commonOption", "healthRegen"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_healthregentime"), getmatchrulesdata("commonOption", "healthRegen"));
    setdynamicdvar(@"hash_a4d532f42d919827", getmatchrulesdata("commonOption", "allowArmor"));
    setdynamicdvar(@"hash_d75d5638785f3b09", getmatchrulesdata("commonOption", "spawnArmor"));
    setdynamicdvar(@"hash_a6a3fd965485d4bc", getmatchrulesdata("commonOption", "spawnArmorPlates"));
    setdynamicdvar(@"hash_8ad1ab9436bccca", getmatchrulesdata("commonOption", "dropArmorOnDeath"));
    setdynamicdvar(@"hash_28d450f7f28644b7", getmatchrulesdata("commonOption", "armorDropAmount"));
    setdynamicdvar(@"hash_dfc97948abf22f64", getmatchrulesdata("commonOption", "disableSuperSprint"));
    setdynamicdvar(@"hash_215eb9aef94dd47e", getmatchrulesdata("commonOption", "disableMount"));
    setdynamicdvar(@"hash_e723cc761de7b161", getmatchrulesdata("commonOption", "lastStand"));
    setdynamicdvar(@"hash_e4f93d764d11874d", getmatchrulesdata("commonOption", "deathsDoorEnterPct"));
    setdynamicdvar(@"hash_b84edc242cc61abf", getmatchrulesdata("commonOption", "deathsDoorExitPct"));
    laststandhealth = getmatchrulesdata("commonOption", "lastStandHealth");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandHealth"), laststandhealth);
    registerlaststandhealthdvar(laststandhealth);
    laststandrevivehealth = getmatchrulesdata("commonOption", "lastStandReviveHealth");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandReviveHealth"), laststandrevivehealth);
    registerlaststandrevivehealthdvar(laststandrevivehealth);
    laststandtimer = getmatchrulesdata("commonOption", "lastStandTimer");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandTimer"), laststandtimer);
    registerlaststandtimerdvar(laststandtimer);
    laststandrevivetimer = getmatchrulesdata("commonOption", "lastStandReviveTimer");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandReviveTimer"), laststandrevivetimer);
    registerlaststandrevivetimerdvar(laststandrevivetimer);
    laststandsuicidetimer = getmatchrulesdata("commonOption", "lastStandSuicideTimer");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandSuicideTimer"), laststandsuicidetimer);
    registerlaststandsuicidetimerdvar(laststandsuicidetimer);
    setdynamicdvar(@"hash_df1ae5a11f519ab5", getmatchrulesdata("commonOption", "reviveUseWeapon"));
    level.matchrules_damagemultiplier = 0;
    setdynamicdvar(@"hash_b5e336c86438398c", getmatchrulesdata("commonOption", "vampirism"));
    setdynamicdvar(@"hash_df992051d6fe8149", getmatchrulesdata("commonOption", "spectateModeAllowed"));
    setdynamicdvar(@"hash_399f13d1217738fe", getmatchrulesdata("commonOption", "showKillcam"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_killcamType"), getmatchrulesdata("commonOption", "killcamType"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allow3rdspectate"), getmatchrulesdata("commonOption", "spectate3rdAllowed"));
    setdynamicdvar(@"hash_2a4effcaf5954d38", getmatchrulesdata("commonOption", "enableMinimap"));
    setdynamicdvar(@"hash_f16ba8db72f34fc3", getmatchrulesdata("commonOption", "radarAlwaysOn"));
    setdynamicdvar(@"hash_36d4f05a3801af7b", getmatchrulesdata("commonOption", "radarHideShots"));
    setdynamicdvar(@"hash_cc12cd6acff9b720", getmatchrulesdata("commonOption", "compassHideEnemy"));
    setdynamicdvar(@"hash_9498c88902801ed5", getmatchrulesdata("commonOption", "compassHidePings"));
    setdynamicdvar(@"hash_5fc696f5bbb3ca62", getmatchrulesdata("commonOption", "disableSpawnCamera"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_playerrespawndelay"), getmatchrulesdata("commonOption", "respawnDelay"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_suicidespawndelay"), getmatchrulesdata("commonOption", "suicideSpawnDelay"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay"), getmatchrulesdata("commonOption", "waveRespawnDelay"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay_alt"), getmatchrulesdata("commonOption", "waveRespawnDelayAlt"));
    setdynamicdvar(@"hash_5d64cd3b24cf883a", getmatchrulesdata("commonOption", "forceRespawn"));
    level.matchrules_allowcustomclasses = getmatchrulesdata("commonOption", "allowCustomClasses");
    level.supportintel = getmatchrulesdata("commonOption", "allowIntel");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allowKillstreaks"), getmatchrulesdata("commonOption", "allowKillstreaks"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allowPerks"), getmatchrulesdata("commonOption", "allowPerks"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allowSupers"), getmatchrulesdata("commonOption", "allowSupers"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishLimit"), getmatchrulesdata("commonOption", "ffPunishLimit"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishDamageLimit"), getmatchrulesdata("commonOption", "ffPunishDamageLimit"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_ffKickKillLimit"), getmatchrulesdata("commonOption", "ffKickKillLimit"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_ffKickDamageLimit"), getmatchrulesdata("commonOption", "ffKickDamageLimit"));
    setdynamicdvar(@"hash_66c38b5b61297ac1", getmatchrulesdata("commonOption", "thirdPerson"));
    if (getdvarint(@"hash_ff21d0d18916f3a1", 0) == 1) {
        setdynamicdvar(@"hash_c00e244ea59d530e", getmatchrulesdata("commonOption", "thirdPerson"));
    }
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreaks"), getmatchrulesdata("commonOption", "roundRetainStreaks"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreakProg"), getmatchrulesdata("commonOption", "roundRetainStreakProg"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_deathRetainStreaks"), getmatchrulesdata("commonOption", "deathRetainStreaks"));
    setdynamicdvar(@"hash_a69e3d30bf0c5ff6", getmatchrulesdata("commonOption", "casualScoreStreaks"));
    setdynamicdvar(@"hash_614165a37ac2db61", getmatchrulesdata("commonOption", "wrapKillstreaks"));
    setdynamicdvar(@"hash_7d44bfc04e9b62b9", getmatchrulesdata("commonOption", "superFastChargeRate"));
    setdynamicdvar(@"hash_913a338c84e2f2f6", getmatchrulesdata("commonOption", "superPointsMod"));
    setdynamicdvar(@"hash_fbc77dbb0cf44cc7", getmatchrulesdata("commonOption", "spawnProtectionTimer"));
    setdynamicdvar(@"hash_c85a7135dce00903", getmatchrulesdata("commonOption", "equipmentDelay"));
    setdynamicdvar(@"hash_9072002890a9a121", getmatchrulesdata("commonOption", "equipmentMSProtect"));
    setdynamicdvar(@"hash_b8a0aa5681c2aa39", getmatchrulesdata("commonOption", "disableBattleChatter"));
    setdynamicdvar(@"hash_94af58bec500b3b9", getmatchrulesdata("commonOption", "disableAnnouncer"));
    setdynamicdvar(@"hash_29e6b70603680941", getmatchrulesdata("commonOption", "inGameLoot"));
    var_c84f9319fe9e602f = 0;
    /#
        if (!istrue(level.onlinegame) && getdvarint(@"hash_c55dc89ef275cdaa", 0)) {
            var_c84f9319fe9e602f = 1;
        }
        if (getdvarint(@"hash_74cacae425805743", 0) > 0) {
            var_c84f9319fe9e602f = 1;
        }
    #/
    if (var_c84f9319fe9e602f) {
        setdynamicdvar(@"hash_7194076ab4888f2b", 1);
    } else {
        setdynamicdvar(@"hash_7194076ab4888f2b", getmatchrulesdata("commonOption", "infilSkip"));
    }
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_practiceRound"), getmatchrulesdata("commonOption", "practiceRound"));
    setdynamicdvar(@"hash_d2de59939486bd5a", getmatchrulesdata("commonOption", "postGameExfil"));
    setdynamicdvar(@"hash_96dd663f32dba868", getmatchrulesdata("commonOption", "exfilExtractTimer"));
    setdynamicdvar(@"hash_645019bc959ffaf9", getmatchrulesdata("commonOption", "exfilActiveTimer"));
    level.crankedbombtimer = getmatchrulesdata("commonOption", "crankedBombTimer");
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_crankedBombTimer"), level.crankedbombtimer);
    namespace_58012cf453ba1014::registercrankedtimerdvar(getgametype(), level.crankedbombtimer);
    setdynamicdvar(@"hash_72fe29aa713ea21e", getmatchrulesdata("commonOption", "classTableOverride"));
    setdynamicdvar(@"hash_fbde2817a4a94998", getmatchrulesdata("commonOption", "magCount"));
    setdynamicdvar(@"hash_127490a7577f169f", getmatchrulesdata("commonOption", "tier1ModeEnabled"));
    setdynamicdvar(@"hash_a2c2c2007177185e", getmatchrulesdata("commonOption", "hardcoreModeOn"));
    setdynamicdvar(@"hash_a54edeed7c5b587f", getmatchrulesdata("commonOption", "headshotsOnly"));
    if (!isdefined(skipfriendlyfire)) {
        setdynamicdvar(@"hash_e5a33d679c26221f", getmatchrulesdata("commonOption", "friendlyFire"));
    }
    setdvar(@"hash_8ed4dff39f3251f5", getdvarint(@"hash_f16ba8db72f34fc3") == 1);
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), getmatchrulesdata("commonOption", "pointsPerKill"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerDeath"), getmatchrulesdata("commonOption", "pointsPerDeath"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsHeadshotBonus"), getmatchrulesdata("commonOption", "pointsHeadshotBonus"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKSKill"), getmatchrulesdata("commonOption", "pointsPerKSKill"));
    setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "");
    setdynamicdvar(@"hash_29d45d6822a1cf6d", "");
    if (privatematch() || level.systemlink || isanymlgmatch()) {
        setdynamicdvar(@"hash_704afe6f6c582ee0", getmatchrulesdata("commonOption", "matchStartTime"));
        setdynamicdvar(@"hash_da33635b62d4e5b3", getmatchrulesdata("commonOption", "roundStartTime"));
    }
    setdvar(@"hash_336f868b4d4b223", getmatchrulesdata("commonOption", "killstreakDelay"));
    if (getdvarint(@"hash_f06ae50014e12fe5") == 1) {
        setdvar(@"hash_8610ccd25560c117", getmatchrulesdata("commonOption", "dynamicMapElementsDisabled"));
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x427e
// Size: 0x59
function reinitializematchrulesonmigration() {
    /#
        assert(isusingmatchrulesdata());
    #/
    /#
        assert(isdefined(level.initializematchrules));
    #/
    while (1) {
        level waittill("host_migration_begin");
        [[ level.initializematchrules ]]();
        if (isdefined(level.var_8b131e98e1629afe)) {
            [[ level.var_8b131e98e1629afe ]]();
        }
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42de
// Size: 0x4d
function reinitializethermal(ent) {
    self endon("disconnect");
    if (isdefined(ent)) {
        ent endon("death");
    }
    while (1) {
        level waittill("host_migration_begin");
        if (isdefined(self.lastvisionsetthermal)) {
            self visionsetthermalforplayer(self.lastvisionsetthermal, 0);
        }
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4332
// Size: 0x217
function getmatchrulesspecialclass(team, index) {
    class = [];
    class["loadoutPrimaryAttachment2"] = "none";
    class["loadoutSecondaryAttachment2"] = "none";
    var_d414e906aa1e0afb = [];
    /#
        assertex(isdefined(team) && team != "none", "The team value needs to be valid in order to get the correct default loadout");
    #/
    class["loadoutPrimary"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 0, "weapon");
    class["loadoutPrimaryAttachment"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 0, "attachmentSetup");
    class["loadoutPrimaryAttachment2"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 0, "attachmentSetup");
    class["loadoutPrimaryCamo"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 0, "camo");
    class["loadoutPrimaryReticle"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 0, "reticle");
    class["loadoutSecondary"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 1, "weapon");
    class["loadoutSecondaryAttachment"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 1, "attachmentSetup");
    class["loadoutSecondaryAttachment2"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 1, "attachmentSetup");
    class["loadoutSecondaryCamo"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 1, "camo");
    class["loadoutSecondaryReticle"] = getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "weaponSetups", 1, "reticle");
    class["loadoutPerks"] = var_d414e906aa1e0afb;
    class["loadoutKillstreak1"] = namespace_d19129e4fa5d176::recipe_getkillstreak(team, index, 0);
    class["loadoutKillstreak2"] = namespace_d19129e4fa5d176::recipe_getkillstreak(team, index, 1);
    class["loadoutKillstreak3"] = namespace_d19129e4fa5d176::recipe_getkillstreak(team, index, 2);
    return class;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4551
// Size: 0x7e
function isplayeroutsideofanybombsite(objweapon) {
    if (isdefined(level.objectives)) {
        foreach (bombzone in level.objectives) {
            if (self istouching(bombzone.noweapondropallowedtrigger)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45d7
// Size: 0x3e
function gamehasneutralcrateowner(gametype) {
    switch (gametype) {
    case #"hash_415b79b2ee6a14d9":
    case #"hash_def61d8a0b05bf0d":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x461c
// Size: 0x40
function isanymlgmatch() {
    if (isusingmatchrulesdata()) {
        if (getdvarint(@"hash_65c2395ef96fc773") == 0 && getmatchrulesdata("cwlRulesEnabled") == 1) {
            return 1;
        }
    }
    return getdvarint(@"hash_9cc8c81329e0bdbf");
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4664
// Size: 0x25
function ismlgsystemlink() {
    if (level.systemlink && getdvarint(@"hash_9cc8c81329e0bdbf")) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4691
// Size: 0x22
function ismlgprivatematch() {
    if (privatematch() && getdvarint(@"hash_9cc8c81329e0bdbf")) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46bb
// Size: 0x1a
function ismlgmatch() {
    if (ismlgsystemlink() || ismlgprivatematch()) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46dd
// Size: 0x76
function ismoddedroundgame() {
    if (getgametype() == "dom" || getgametype() == "ctf" || getgametype() == "rush" || getgametype() == "blitz" || getgametype() == "rescue" || getgametype() == "ballmode" || getgametype() == "escort") {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x475b
// Size: 0x8a
function isusingdefaultclass(team, index) {
    var_7af641e395c0788c = 0;
    if (isdefined(index)) {
        if (isusingmatchrulesdata() && getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "inUse")) {
            var_7af641e395c0788c = 1;
        }
    } else {
        for (index = 0; index < 6; index++) {
            if (isusingmatchrulesdata() && getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "inUse")) {
                var_7af641e395c0788c = 1;
                break;
            }
        }
    }
    return var_7af641e395c0788c;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ed
// Size: 0x80
function getmatchrulesdatawithteamandindex(category, team, index, field, arg1, arg2, arg3) {
    if (team == "axis") {
        index = index + 6;
    }
    if (isdefined(arg3)) {
        return getmatchrulesdata(category, index, field, arg1, arg2, arg3);
    } else if (isdefined(arg2)) {
        return getmatchrulesdata(category, index, field, arg1, arg2);
    } else {
        return getmatchrulesdata(category, index, field, arg1);
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4874
// Size: 0x51
function isspawnprotected() {
    return !function_483cc81bff18273b(self) && isdefined(self.spawntime) && isdefined(level.killstreakspawnshielddelayms) && gettime() < self.spawntime + level.killstreakspawnshielddelayms && !istrue(self.clearspawnprotection);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48cd
// Size: 0xe
function clearspawnprotection() {
    self.clearspawnprotection = 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48e2
// Size: 0x2a
function ismatchstartprotected() {
    return isdefined(level.starttime) && gettime() < level.starttime + level.equipmentmatchstartshieldms;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4914
// Size: 0x9
function getgametype() {
    return namespace_36f464722d326bbe::getgametype();
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4925
// Size: 0x9
function function_60bf8d82001fc22c() {
    return namespace_36f464722d326bbe::function_60bf8d82001fc22c();
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4936
// Size: 0x1a
function function_f6bad1d33ad22078() {
    if (level.var_ec2fb549b15ad827) {
        return "mp_ranked";
    }
    return "mp";
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4958
// Size: 0x9
function getsubgametype() {
    return namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4969
// Size: 0x28
function issubgametype() {
    gametype = getgametype();
    var_faf0d2fac3f47583 = getsubgametype();
    return gametype != var_faf0d2fac3f47583;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4999
// Size: 0x39
function isteamplacementsbmmmode() {
    switch (getsubgametype()) {
    case #"hash_3c1c1566d7b3b870":
    case #"hash_9196025f8ae8e51e":
    case #"hash_fa21c4f6bd5e3815":
        return 1;
        break;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49da
// Size: 0x2d
function function_f24e99a2f548d0b8() {
    switch (getgametype()) {
    case #"hash_4cb5825e78aaa8c":
    case #"hash_a00cd1371d281532":
        return 1;
        break;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a0f
// Size: 0x81
function lpcfeaturegated() {
    if (runleanthreadmode()) {
        return 1;
    }
    switch (getgametype()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_5e78ea9021845d4a":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8f01ce022684fbc8":
    case #"hash_9a6f07d0214a87db":
    case #"hash_bc5ad0664c3cc103":
    case #"hash_c065cef60f38490a":
    case #"hash_c7f4420f385eeb3d":
        return 1;
        break;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a98
// Size: 0x37
function runleanthreadmode() {
    if (getdvarint(@"hash_63b929c96913e1d") == 1) {
        return 1;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype() || level.leanthread == 1) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ad7
// Size: 0x90
function gamehasinfil() {
    if (!isdefined(game["infil"])) {
        return 0;
    }
    var_97f23a7b99a8ccc7 = 1;
    foreach (entry in level.teamnamelist) {
        if (!isdefined(game["infil"][entry]) || !isdefined(game["infil"][entry][1])) {
            var_97f23a7b99a8ccc7 = 0;
            break;
        }
    }
    return var_97f23a7b99a8ccc7;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b6f
// Size: 0x2e
function teamhasinfil(team) {
    return gamehasinfil() && isgameplayteam(team) && isdefined(game["infil"][team][1]);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba5
// Size: 0x13
function iskillstreakdenied() {
    return namespace_5a51aa78ea0b1b9f::is_empd() || isairdenied();
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc0
// Size: 0x18
function isairdenied() {
    if (self.team == "spectator") {
        return 0;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be0
// Size: 0x67
function getmaxoutofboundstime() {
    /#
        return max(0, getdvarfloat(@"hash_b773758221a0c100", 3));
    #/
    outofboundstime = level.outofboundstime;
    if (!isdefined(outofboundstime)) {
        outofboundstime = max(0, ter_op(matchmakinggame(), getdvarfloat(@"hash_b773758221a0c100", 3), 3));
        level.outofboundstime = outofboundstime;
    }
    return outofboundstime;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4f
// Size: 0x16
function function_a01d18a56c6cc1aa() {
    return getdvarfloat(@"hash_dd59793cdeddb43f", 15);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c6d
// Size: 0x59
function getmaxoutofboundscooldown() {
    /#
        return max(0, getdvarfloat(@"hash_1e90a42100ff3964", 3));
    #/
    outofboundscooldown = level.outofboundscooldown;
    if (!isdefined(outofboundscooldown)) {
        outofboundscooldown = max(0, getdvarfloat(@"hash_1e90a42100ff3964", 3));
        level.outofboundscooldown = outofboundscooldown;
    }
    return outofboundscooldown;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cce
// Size: 0x59
function getmaxoutofboundsminefieldtime() {
    /#
        return max(0, getdvarfloat(@"hash_e4bb2af9293410e5", 3));
    #/
    outofboundstimeminefield = level.outofboundstimeminefield;
    if (!isdefined(outofboundstimeminefield)) {
        outofboundstimeminefield = max(0, getdvarfloat(@"hash_e4bb2af9293410e5", 3));
        level.outofboundstimeminefield = outofboundstimeminefield;
    }
    return outofboundstimeminefield;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2f
// Size: 0x17
function getmaxoutofboundsrestrictedtime() {
    level.outofboundstimerestricted = 10;
    return level.outofboundstimerestricted;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d4e
// Size: 0x45
function getmaxoutofboundsbrtime() {
    var_61d3a4299744033e = getdvarfloat(@"hash_b773758221a0c100", 10);
    if (var_61d3a4299744033e > 0) {
        level.outofboundstimebr = var_61d3a4299744033e;
    } else {
        level.outofboundstimebr = 10;
    }
    return level.outofboundstimebr;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d9b
// Size: 0x105
function updateobjectivetext() {
    if (self.pers["team"] == "spectator") {
        self setclientdvar(@"hash_e059919397a99593", "");
        return;
    }
    if (level.roundscorelimit > 0 && !isobjectivebased()) {
        if (isdefined(getobjectivescoretext(self.pers["team"]))) {
            if (level.splitscreen) {
                self setclientdvar(@"hash_e059919397a99593", getobjectivescoretext(self.pers["team"]));
            } else {
                self setclientdvar(@"hash_e059919397a99593", getobjectivescoretext(self.pers["team"]), level.roundscorelimit);
            }
        }
    } else if (isdefined(getobjectivetext(self.pers["team"]))) {
        self setclientdvar(@"hash_e059919397a99593", getobjectivetext(self.pers["team"]));
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea7
// Size: 0x25
function setobjectivetext(team, text) {
    game["strings"]["objective_" + team] = text;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed3
// Size: 0x25
function setobjectivescoretext(team, text) {
    game["strings"]["objective_score_" + team] = text;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eff
// Size: 0x25
function setobjectivehinttext(team, text) {
    game["strings"]["objective_hint_" + team] = text;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f2b
// Size: 0x1b
function getobjectivetext(team) {
    return game["strings"]["objective_" + team];
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4e
// Size: 0x1b
function getobjectivescoretext(team) {
    return game["strings"]["objective_score_" + team];
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f71
// Size: 0x1b
function getobjectivehinttext(team) {
    return game["strings"]["objective_hint_" + team];
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f94
// Size: 0x3f
function testgamemodestringlist(stringlist, gamemode) {
    if (!isdefined(stringlist) || stringlist == "" || !isdefined(gamemode) || gamemode == "") {
        return 0;
    }
    return issubstr(stringlist, gamemode);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fdb
// Size: 0x3b
function islaststandenabled() {
    return isdefined(level.laststand) && (level.laststand == 1 || level.laststand == 3) || istrue(level.var_78184ec36f669844);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501e
// Size: 0x2d
function isteamreviveenabled() {
    return isdefined(level.laststand) && (level.laststand == 2 || level.laststand == 3);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5053
// Size: 0x50e
function isdefending(victim) {
    var_46460432f5099265 = 0;
    switch (getgametype()) {
    case #"hash_eb5e5f470e0c1dc2":
        if (isdefined(level.cyberemp.carrier) && self.team == level.cyberemp.ownerteam && self != level.cyberemp.carrier) {
            var_abb6fbdd8cd1a1d2 = distancesquared(level.cyberemp.carrier.origin, self.origin);
            var_44096cee99b7a48b = distancesquared(level.cyberemp.carrier.origin, victim.origin);
            if (var_abb6fbdd8cd1a1d2 < 90000 || var_44096cee99b7a48b < 90000) {
                var_46460432f5099265 = 1;
                break;
            }
        }
        foreach (bombzone in level.objectives) {
            if (istrue(bombzone.trigger.trigger_off)) {
                continue;
            }
            ownerteam = bombzone.ownerteam;
            if (ownerteam == self.team) {
                var_abb6fbdd8cd1a1d2 = distancesquared(bombzone.trigger.origin, self.origin);
                var_44096cee99b7a48b = distancesquared(bombzone.trigger.origin, victim.origin);
                if (var_abb6fbdd8cd1a1d2 < 90000 || var_44096cee99b7a48b < 90000) {
                    var_46460432f5099265 = 1;
                    break;
                }
            }
        }
        break;
    case #"hash_aac44b0b52bacb8e":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        if (self.team != game["defenders"]) {
            break;
        }
        foreach (objective in level.objectives) {
            var_77ada7456cac5c0e = distancesquared(objective.trigger.origin, victim.origin);
            if (var_77ada7456cac5c0e < 90000) {
                var_46460432f5099265 = 1;
                break;
            }
        }
        break;
    case #"hash_4cb5825e78aaa8c":
    case #"hash_ca6516c10db2c95":
    case #"hash_3ae8dcf2840c03a0":
    case #"hash_5160cc5f44a0a22e":
    case #"hash_53825b446469ac4c":
    case #"hash_5e78ea9021845d4a":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_a1313b745c17c07e":
    case #"hash_d82d642e83fb9772":
    case #"hash_ec24570718a340f5":
    case #"hash_f25c018be2dd3f5f":
    case #"hash_f4a9126c03d3385b":
        foreach (objective in level.objectives) {
            if (self.team != objective.ownerteam) {
                continue;
            }
            var_2f26c572a7a12636 = distancesquared(objective.curorigin, self.origin);
            var_d0502d3fad28fa4f = distancesquared(objective.curorigin, victim.origin);
            if (var_2f26c572a7a12636 < 90000 || var_d0502d3fad28fa4f < 90000) {
                var_46460432f5099265 = 1;
                break;
            }
        }
        break;
    case #"hash_634e449bb53a8268":
    case #"hash_6efb0f59a62300fb":
    case #"hash_78ebb3b7ce8f864f":
    case #"hash_a6b6d6b8dc1096cd":
    case #"hash_b9aaf1c4459d9a15":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_fa34c5f6bd6d4432":
        if (isdefined(level.zone)) {
            var_46460432f5099265 = ispointinvolume(self.origin, level.zone.trigger) || ispointinvolume(victim.origin, level.zone.trigger);
        }
        break;
    }
    return var_46460432f5099265;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5569
// Size: 0x51a
function isassaulting(victim) {
    var_46460432f5099265 = 0;
    switch (getgametype()) {
    case #"hash_eb5e5f470e0c1dc2":
        if (istrue(victim.isbombcarrier)) {
            var_46460432f5099265 = 1;
            break;
        }
        if (isdefined(level.cyberemp.carrier) && self.team == level.cyberemp.ownerteam && self != level.cyberemp.carrier) {
            var_abb6fbdd8cd1a1d2 = distancesquared(level.cyberemp.carrier.origin, self.origin);
            var_44096cee99b7a48b = distancesquared(level.cyberemp.carrier.origin, victim.origin);
            if (var_abb6fbdd8cd1a1d2 < 90000 || var_44096cee99b7a48b < 90000) {
                var_46460432f5099265 = 1;
                break;
            }
        }
        foreach (bombzone in level.objectives) {
            if (istrue(bombzone.trigger.trigger_off)) {
                continue;
            }
            ownerteam = bombzone.ownerteam;
            if (ownerteam != self.team) {
                var_2f26c572a7a12636 = distancesquared(bombzone.trigger.origin, self.origin);
                var_d0502d3fad28fa4f = distancesquared(bombzone.trigger.origin, victim.origin);
                if (var_2f26c572a7a12636 < 90000 || var_d0502d3fad28fa4f < 90000) {
                    var_46460432f5099265 = 1;
                    break;
                }
            }
        }
        break;
    case #"hash_aac44b0b52bacb8e":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        if (self.team == game["defenders"]) {
            break;
        }
        foreach (objective in level.objectives) {
            var_77ada7456cac5c0e = distancesquared(objective.trigger.origin, victim.origin);
            if (var_77ada7456cac5c0e < 90000) {
                var_46460432f5099265 = 1;
                break;
            }
        }
        break;
    case #"hash_ca6516c10db2c95":
    case #"hash_3ae8dcf2840c03a0":
    case #"hash_5160cc5f44a0a22e":
    case #"hash_53825b446469ac4c":
    case #"hash_5e78ea9021845d4a":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_a1313b745c17c07e":
    case #"hash_d82d642e83fb9772":
    case #"hash_ec24570718a340f5":
    case #"hash_f25c018be2dd3f5f":
    case #"hash_f4a9126c03d3385b":
        foreach (objective in level.objectives) {
            if (self.team == objective.ownerteam) {
                continue;
            }
            var_2f26c572a7a12636 = distancesquared(objective.curorigin, self.origin);
            var_d0502d3fad28fa4f = distancesquared(objective.curorigin, victim.origin);
            if (var_2f26c572a7a12636 < 90000 || var_d0502d3fad28fa4f < 90000) {
                var_46460432f5099265 = 1;
                break;
            }
        }
        break;
    case #"hash_634e449bb53a8268":
    case #"hash_6efb0f59a62300fb":
    case #"hash_78ebb3b7ce8f864f":
    case #"hash_a6b6d6b8dc1096cd":
    case #"hash_b9aaf1c4459d9a15":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_fa34c5f6bd6d4432":
        if (isdefined(level.zone)) {
            var_46460432f5099265 = ispointinvolume(self.origin, level.zone.trigger) || ispointinvolume(victim.origin, level.zone.trigger);
        }
        break;
    }
    return var_46460432f5099265;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a8b
// Size: 0xe1
function gametypesupportsbasejumping() {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        return 1;
    }
    if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        return 0;
    }
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_ca6516c10db2c95":
    case #"hash_53825b446469ac4c":
    case #"hash_5e78ea9021845d4a":
    case #"hash_63fb0ba698c46db3":
    case #"hash_7485fa6c474ec865":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8f01ce022684fbc8":
    case #"hash_9a6f07d0214a87db":
    case #"hash_b9458959b10637f8":
    case #"hash_bc5ad0664c3cc103":
    case #"hash_c065cef60f38490a":
    case #"hash_c7f4420f385eeb3d":
    case #"hash_f4a9126c03d3385b":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b73
// Size: 0x10a
function mapsupportsbasejumping() {
    if (namespace_36f464722d326bbe::isdonetskmap() || namespace_36f464722d326bbe::islargemap()) {
        return 1;
    }
    switch (level.mapname) {
    case #"hash_1b3ccf154e387057":
        return 1;
    case #"hash_7b08e6b8f46bd733":
        return 1;
    case #"hash_7ff81f1cd6143d9d":
        return 1;
    case #"hash_1dda853d40d6f75e":
        return 1;
    case #"hash_5cfcc13994df1513":
        return 1;
    case #"hash_ab7026ed3aa8e85e":
        return 1;
    case #"hash_e0f4521889150186":
        return 1;
    case #"hash_d1b7841a5040962a":
        return 1;
    case #"hash_2d70196d81f685bc":
        return 1;
    case #"hash_2d701c6d81f68a75":
        return 1;
    case #"hash_2d701b6d81f688e2":
        return 1;
    case #"hash_2d70166d81f68103":
        return 1;
    case #"hash_29da5cf015f908ce":
        return 1;
    case #"hash_ffa01e486cc66390":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c84
// Size: 0x38b
function logannouncement(player, contester, message, var_456b8f0ea933d0e5, extrainfo) {
    time_from_match_start = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
    if (!isdefined(message)) {
        return;
    }
    info = "";
    if (isdefined(extrainfo)) {
        info = extrainfo;
    } else {
        info = "none";
    }
    if (!isdefined(player)) {
        if (isdefined(var_456b8f0ea933d0e5)) {
            dlog_recordevent("dlog_event_announcement", [0:"time_from_match_start", 1:time_from_match_start, 2:"announcement", 3:message, 4:"extra_info", 5:info, 6:"player_team", 7:"none", 8:"contester_team", 9:"none", 10:"zone_x", 11:var_456b8f0ea933d0e5[0], 12:"zone_y", 13:var_456b8f0ea933d0e5[1], 14:"zone_z", 15:var_456b8f0ea933d0e5[2]]);
        } else {
            dlog_recordevent("dlog_event_announcement", [0:"time_from_match_start", 1:time_from_match_start, 2:"announcement", 3:message, 4:"extra_info", 5:info]);
        }
    } else if (isdefined(contester)) {
        if (isdefined(var_456b8f0ea933d0e5)) {
            dlog_recordevent("dlog_event_announcement", [0:"player", 1:player, 2:"contester", 3:contester, 4:"time_from_match_start", 5:time_from_match_start, 6:"announcement", 7:message, 8:"extra_info", 9:info, 10:"player_team", 11:player.team, 12:"contester_team", 13:contester.team, 14:"zone_x", 15:var_456b8f0ea933d0e5[0], 16:"zone_y", 17:var_456b8f0ea933d0e5[1], 18:"zone_z", 19:var_456b8f0ea933d0e5[2]]);
        } else {
            dlog_recordevent("dlog_event_announcement", [0:"player", 1:player, 2:"contester", 3:contester, 4:"time_from_match_start", 5:time_from_match_start, 6:"announcement", 7:message, 8:"extra_info", 9:info, 10:"player_team", 11:player.team, 12:"contester_team", 13:contester.team]);
        }
    } else if (isdefined(var_456b8f0ea933d0e5)) {
        dlog_recordevent("dlog_event_announcement", [0:"player", 1:player, 2:"time_from_match_start", 3:time_from_match_start, 4:"announcement", 5:message, 6:"extra_info", 7:info, 8:"player_team", 9:player.team, 10:"contester_team", 11:"none", 12:"zone_x", 13:var_456b8f0ea933d0e5[0], 14:"zone_y", 15:var_456b8f0ea933d0e5[1], 16:"zone_z", 17:var_456b8f0ea933d0e5[2]]);
    } else {
        dlog_recordevent("dlog_event_announcement", [0:"player", 1:player, 2:"time_from_match_start", 3:time_from_match_start, 4:"announcement", 5:message, 6:"extra_info", 7:info, 8:"player_team", 9:player.team]);
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6016
// Size: 0xd
function isprophuntgametype() {
    return istrue(level.isprophunt);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x602b
// Size: 0x37
function isgroundwarcoremode() {
    return istrue(level.isgroundwarinfected) || istrue(level.isgroundwarsiege) || istrue(level.isgroundwardom) || istrue(level.var_904f766b5267e332);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x606a
// Size: 0xb2
function function_a7caa13ebe4c4ba5() {
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_ca6516c10db2c95":
    case #"hash_5e78ea9021845d4a":
    case #"hash_7f9c384a34cc392f":
    case #"hash_9a6f07d0214a87db":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_c065cef60f38490a":
    case #"hash_c7f4420f385eeb3d":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_ec086b911c1011ec":
    case #"hash_fa50b0f6bd82e972":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6123
// Size: 0x82
function isverdansksubmap() {
    switch (namespace_36f464722d326bbe::getmapname()) {
    case #"hash_12f3765ef24b4037":
    case #"hash_1bc93b88575e82eb":
    case #"hash_32eaa112f8caa7e4":
    case #"hash_3a8b050ff58578ad":
    case #"hash_50de71be6e7469ff":
    case #"hash_7a28db3c5928c489":
    case #"hash_924a3fbe9fbe15c6":
    case #"hash_e4ca6b73b5022b26":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61ac
// Size: 0x49
function function_e417d8ef1c70cbcb() {
    if (namespace_36f464722d326bbe::islargemap()) {
        return 1;
    } else if (namespace_36f464722d326bbe::isdonetskmap()) {
        return 1;
    } else if (isverdansksubmap()) {
        return 1;
    } else if (getdvarint(@"hash_e35a761bc944e0f8", 0) != 1) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61fd
// Size: 0x11b
function canparachutebecut(player) {
    var_37b3fb3ff20a3eb6 = 0;
    var_a5150dc49f8b1cc7 = 0;
    gametype = getgametype();
    if (isusingmatchrulesdata() && getmatchrulesdata("commonOption", "allowParachute") || (gametype == "arm" || gametype == "bigctf" || gametype == "conflict" || gametype == "risk" || gametype == "gwbomb" || isgroundwarcoremode()) && namespace_36f464722d326bbe::islargemap() || getdvarint(@"hash_9365c7a237edaa2f", 0) == 1 || istrue(level.var_aac427da0a1569e2)) {
        if (istrue(level.parachutecancutautodeploy)) {
            var_37b3fb3ff20a3eb6 = 1;
        }
        if (istrue(level.parachutecancutparachute) && !istrue(player.var_4da443f197c8014e)) {
            var_a5150dc49f8b1cc7 = 1;
        }
    }
    if (var_37b3fb3ff20a3eb6) {
        player skydive_cutautodeployon();
    } else {
        player skydive_cutautodeployoff();
    }
    if (var_a5150dc49f8b1cc7) {
        player skydive_cutparachuteon();
    } else {
        player skydive_cutparachuteoff();
    }
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x631f
// Size: 0x1e
function function_1e098780c33853f2() {
    return matchmakinggame() && getdvarint(@"hash_72fe29aa713ea21e", 0) != 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6345
// Size: 0x1f
function function_ac09124b4e7535a6() {
    return matchmakinggame() && getdvarint(@"hash_72fe29aa713ea21e", 0) == 1;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x636c
// Size: 0x10
function function_b7d052e4bf41ee9b() {
    if (function_1e098780c33853f2()) {
        return 1;
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6384
// Size: 0x31
function function_eb3158a25aee673a() {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        var_faf0d2fac3f47583 = getsubgametype();
        return (var_faf0d2fac3f47583 == "dmz" || var_faf0d2fac3f47583 == "exgm");
    }
    return 0;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63bd
// Size: 0x11
function function_d7ec918e29c0b2f4() {
    return getdvarint(@"hash_819016fcba31a2c2");
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63d6
// Size: 0xd
function function_f698bfd3efa33302() {
    return istrue(level.supportcranked);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63eb
// Size: 0x1e
function function_e9f3a160bbefe208(player) {
    return isdefined(player) && istrue(player.supportcranked);
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6411
// Size: 0x5b
function get_linked_vehicle_nodes() {
    array = [];
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        if (var_b11f91c17feeab8f.size == 1) {
            return getvehiclenodearray(var_b11f91c17feeab8f[0], "script_linkname");
        } else if (var_b11f91c17feeab8f.size > 1) {
            return function_df5a62cb94a82870(var_b11f91c17feeab8f, "script_linkname");
        }
    }
    return array;
}

// Namespace game_utility/namespace_cd0b2d039510b38d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6474
// Size: 0x42
function function_10007861f7386ad8() {
    if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.var_e1113fd85977023f)) {
        return level.var_62f6f7640e4431e3.var_e1113fd85977023f;
    }
    return getsubgametype();
}

