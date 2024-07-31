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

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156c
// Size: 0x12
function getotherteam(team) {
    return getenemyteams(team);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1587
// Size: 0x20
function getroundlength() {
    if (!isdefined(level.starttime)) {
        return 0;
    }
    return gettime() - level.starttime;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b0
// Size: 0x1d
function getgamelength() {
    if (!isdefined(game["gameLength"])) {
        return 0;
    }
    return getroundlength() + game["gameLength"];
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15d6
// Size: 0x30
function gettimepassedpercentage() {
    timelimit = gettimelimit();
    if (timelimit == 0) {
        return 0;
    }
    return gettimepassed() / gettimelimit() * 1000 * 100;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160f
// Size: 0xc
function getsecondspassed() {
    return gettimepassed() / 1000;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1624
// Size: 0xb
function getminutespassed() {
    return getsecondspassed() / 60;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1638
// Size: 0x90
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
        wait delay;
    }
    self.var_a1192fa9f37ce26d = fadetoblack;
    scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, fadetoblack, 0.5);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16d0
// Size: 0xa7
function registerroundswitchdvar(dvarstring, defaultvalue, minvalue, maxvalue) {
    registerwatchdvarint("roundswitch", defaultvalue);
    dvarstring = hashcat(@"hash_d98c82b5a26dc973", dvarstring, "_roundswitch");
    level.roundswitchdvar = dvarstring;
    level.roundswitchmin = minvalue;
    level.roundswitchmax = maxvalue;
    level.roundswitch = getdvarint(dvarstring, defaultvalue);
    if (level.roundswitch < minvalue) {
        level.roundswitch = minvalue;
        return;
    }
    if (level.roundswitch > maxvalue) {
        level.roundswitch = maxvalue;
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x177f
// Size: 0x20
function registerroundlimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("roundlimit", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17a7
// Size: 0x20
function registernumteamsdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("numTeams", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17cf
// Size: 0x20
function registerwinlimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("winlimit", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17f7
// Size: 0x20
function registerwinbytwoenableddvar(dvarstring, defaultvalue) {
    registerwatchdvarint("winbytwoenabled", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x181f
// Size: 0x20
function registerwinbytwomaxroundsdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("winbytwomaxrounds", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1847
// Size: 0x20
function registerdogtagsenableddvar(dvarstring, defaultvalue) {
    registerwatchdvarint("dogtags", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x186f
// Size: 0x20
function registerscorelimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("scorelimit", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1897
// Size: 0x35
function registertimelimitdvar(dvarstring, defaultvalue) {
    registerwatchdvarfloat("timelimit", defaultvalue);
    setdvar(@"ui_timelimit", gettimelimit());
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18d4
// Size: 0x35
function registerhalftimedvar(dvarstring, defaultvalue) {
    registerwatchdvarint("halftime", defaultvalue);
    setdvar(@"ui_halftime", gethalftime());
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1911
// Size: 0x20
function registernumlivesdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("numlives", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1939
// Size: 0x20
function registernumrevivesdvar(dvarstring, defaultvalue) {
    registerwatchdvarint("numrevives", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1961
// Size: 0x20
function function_704789086c9ad943(dvarstring, defaultvalue) {
    registerwatchdvarint("pointsPerKill", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1989
// Size: 0x1b
function setovertimelimitdvar(value) {
    setdvar(@"overtimeTimeLimit", value);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19ac
// Size: 0x18
function registerlaststandhealthdvar(defaultvalue) {
    registerwatchdvarint("lastStandHealth", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19cc
// Size: 0x18
function registerlaststandrevivehealthdvar(defaultvalue) {
    registerwatchdvarint("lastStandReviveHealth", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19ec
// Size: 0x18
function registerlaststandtimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandTimer", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0c
// Size: 0x18
function registerlaststandrevivetimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandReviveTimer", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2c
// Size: 0x18
function registerlaststandweapondvar(defaultvalue) {
    registerwatchdvar("lastStandWeapon", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4c
// Size: 0x18
function registerlaststandweapondelaydvar(defaultvalue) {
    registerwatchdvarfloat("lastStandWeaponDelay", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6c
// Size: 0x18
function registerlaststandsuicidetimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandSuicideTimer", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8c
// Size: 0x18
function registerlaststandinvulntimerdvar(defaultvalue) {
    registerwatchdvarfloat("lastStandInvulnTimer", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aac
// Size: 0x18
function registerlaststandrevivedecayscaledvar(defaultvalue) {
    registerwatchdvarfloat("lastStandReviveDecayScale", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1acc
// Size: 0x18
function function_65c4cae95d0c833b(defaultvalue) {
    registerwatchdvarint("teamReviveHealth", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aec
// Size: 0x18
function function_c2bd90ff953a0ce4(defaultvalue) {
    registerwatchdvarfloat("teamReviveTime", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0c
// Size: 0x18
function function_2597b9cd72447cb6(defaultvalue) {
    registerwatchdvarfloat("teamReviveTimeout", defaultvalue);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2c
// Size: 0xa5
function isroundbased() {
    if (!level.teambased) {
        return false;
    }
    if (level.winlimit != 1 && level.roundlimit != 1) {
        return true;
    }
    if (getgametype() == "sr" || getbasegametype() == "sd" || getgametype() == "siege" || getgametype() == "cyber" || getgametype() == "mtmc" || getbasegametype() == "control" || getgametype() == "wm") {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bda
// Size: 0x21
function isfirstround() {
    if (!level.teambased) {
        return true;
    }
    if (game["roundsPlayed"] == 0) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c04
// Size: 0x183
function nextroundisfinalround() {
    if (level.forcedend) {
        return true;
    }
    if (!level.teambased) {
        return true;
    }
    if (level.roundlimit > 1 && game["roundsPlayed"] >= level.roundlimit - 1 && !istimetobeatrulegametype() && !isscoretobeatrulegametype()) {
        return true;
    }
    if (isovertimesupportedgametype() && (hitroundlimit() || hitwinlimit())) {
        if (shouldplaywinbytwo() && islastwinbytwo()) {
            return true;
        } else if (istimetobeatrulegametype() || isscoretobeatrulegametype()) {
            if (game["overtimeRoundsPlayed"] == 1) {
                return true;
            }
        } else if (!level.playovertime) {
            return true;
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
            return false;
        } else {
            return true;
        }
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d90
// Size: 0x164
function nextroundismatchpoint() {
    if (level.forcedend) {
        return true;
    }
    if (!level.teambased) {
        return true;
    }
    if (level.roundlimit > 1 && game["roundsPlayed"] >= level.roundlimit - 1 && !istimetobeatrulegametype() && !isscoretobeatrulegametype()) {
        return true;
    }
    if (isovertimesupportedgametype() && (hitroundlimit() || hitwinlimit())) {
        if (shouldplaywinbytwo() && islastwinbytwo()) {
            return true;
        } else if (istimetobeatrulegametype() || isscoretobeatrulegametype()) {
            if (game["overtimeRoundsPlayed"] == 1) {
                return true;
            }
        } else if (!level.playovertime) {
            return true;
        }
    }
    var_1aa7d78f771c4fe = 0;
    foreach (entry in level.teamnamelist) {
        roundswon = getroundswon(entry);
        if (roundswon == level.winlimit - 1) {
            if (shouldplaywinbytwo() && istrue(game["displayedMatchPoint"])) {
                game["displayedMatchPoint"] = 0;
            }
            return true;
        }
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1efd
// Size: 0x5d
function wasonlyround() {
    if (level.playovertime) {
        return false;
    }
    if (!level.teambased) {
        return true;
    }
    if (isdefined(level.onlyroundoverride)) {
        return false;
    }
    if (level.winlimit == 1 && hitwinlimit()) {
        return true;
    }
    if (level.roundlimit == 1) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f63
// Size: 0x106
function waslastround() {
    if (level.forcedend) {
        return true;
    }
    if (isdefined(level.nukeinfo) && istrue(level.nukeinfo.gameover)) {
        return true;
    }
    if (istrue(level.ctfnukeended)) {
        return true;
    }
    if (wasonlyround()) {
        return true;
    }
    if (!level.teambased) {
        return true;
    }
    if (function_8cc09267ba72c7f7() && game["roundsPlayed"] == 1) {
        return false;
    }
    if (hitroundlimit() || hitwinlimit()) {
        return !level.playovertime;
    }
    if (getgametype() == "ballmode") {
        if (game["status"] == "overtime") {
            return true;
        }
        timeremaining = scripts\mp\gamelogic::gettimeremaining();
        if (timeremaining <= 0) {
            return true;
        }
    }
    if (getgametype() == "wm" || function_8cc09267ba72c7f7()) {
        if (game["roundsPlayed"] == 2) {
            return true;
        }
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2072
// Size: 0x70
function iswinbytworulegametype() {
    switch (getgametype()) {
    case #"hash_53825b446469ac4c":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930": 
        return (getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoEnabled"), 0) == 1);
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20eb
// Size: 0x29
function getmaxwinbytworounds() {
    return getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoMaxRounds"), level.winlimit);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x211d
// Size: 0x59
function shouldplaywinbytwo() {
    alliesscore = game["roundsWon"]["allies"];
    axisscore = game["roundsWon"]["axis"];
    return iswinbytworulegametype() && abs(alliesscore - axisscore) < 2 && game["overtimeRoundsPlayed"] < getmaxwinbytworounds();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x217f
// Size: 0x1d
function islastwinbytwo() {
    return shouldplaywinbytwo() && game["overtimeRoundsPlayed"] == getmaxwinbytworounds() - 1;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21a5
// Size: 0x3d
function function_2f1b2a4a64257bea() {
    alliesscore = game["roundsWon"]["allies"];
    axisscore = game["roundsWon"]["axis"];
    return abs(alliesscore - axisscore) < 2;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21eb
// Size: 0x38
function istimetobeatrulegametype() {
    switch (getgametype()) {
    case #"hash_1a5d186c17c00d3c":
    case #"hash_51347b2eb89b24c4":
    case #"hash_c749446269c21985": 
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x222c
// Size: 0x1b
function intimetobeat() {
    return isdefined(game["status"]) && game["status"] == "recordTTB";
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2250
// Size: 0xa8
function settimetobeat(team) {
    if (!istimetobeatrulegametype()) {
        return false;
    }
    captime = getsecondspassed();
    score = scripts\mp\gamescore::_getteamscore(team);
    if (!istimetobeatvalid() || captime < game["timeToBeat"] && score >= game["timeToBeatScore"]) {
        if (game["timeToBeatTeam"] != "none" && game["timeToBeatTeam"] != team) {
            game["timeToBeatOld"] = game["timeToBeat"];
        }
        game["timeToBeat"] = captime;
        game["timeToBeatTeam"] = team;
        game["timeToBeatScore"] = score;
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2301
// Size: 0xb
function istimetobeatvalid() {
    return game["timeToBeat"] != 0;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2315
// Size: 0x16
function shouldplaytimetobeatot() {
    return istimetobeatvalid() && game["overtimeRoundsPlayed"] == 1;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2334
// Size: 0x20
function isscoretobeatrulegametype() {
    switch (getgametype()) {
    case #"hash_8eb3658fb4985833": 
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x235d
// Size: 0x153
function setscoretobeat(team, score) {
    if (!isscoretobeatrulegametype()) {
        return 0;
    }
    istied = game["timeToBeatTeam"] != "none" && score == game["timeToBeatScore"];
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
    if (istied) {
        return "tie";
    }
    return game["timeToBeatTeam"];
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b8
// Size: 0x16
function shouldplayscoretobeatot() {
    return isscoretobeatrulegametype() && game["overtimeRoundsPlayed"] == 1;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24d7
// Size: 0xcf
function isovertimesupportedgametype() {
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_1a5d186c17c00d3c":
    case #"hash_1aac086c17fe5ccb":
    case #"hash_51347b2eb89b24c4":
    case #"hash_68e111ac56792b24":
    case #"hash_8eb3658fb4985833":
    case #"hash_a4803151db9c2947":
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
    }
    return 0;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25af
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

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a2
// Size: 0x55
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

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2700
// Size: 0x32
function issimultaneouskillenabled() {
    if (!isdefined(level.simultaneouskillenabled)) {
        level.simultaneouskillenabled = getdvarint(@"hash_aa96b1e9c9809b8", 0) == 0;
    }
    return level.simultaneouskillenabled;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x273b
// Size: 0x8d
function cantiebysimultaneouskill() {
    if (!issimultaneouskillenabled()) {
        return 0;
    }
    cantie = 0;
    switch (getgametype()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_4b8799075d3a89b8":
    case #"hash_7485fa6c474ec865":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8f01ce022684fbc8":
    case #"hash_bc5ad0664c3cc103":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fb5b5e6c07253005": 
        cantie = 1;
        break;
    }
    return cantie;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27d1
// Size: 0xb8
function shouldplayovertime() {
    tied = allteamstied();
    if (!hitroundlimit() && !hitwinlimit()) {
        return false;
    }
    if (!isovertimesupportedgametype()) {
        return false;
    }
    if (tied && inovertime()) {
        var_178e9c557e11fb83 = getmaxovertimeroundsbygametype();
        tied = ter_op(var_178e9c557e11fb83 == -1, 1, game["overtimeRoundsPlayed"] < var_178e9c557e11fb83);
    }
    var_b564bf7a9922b991 = shouldplaywinbytwo();
    var_4b3eea7964b200d2 = shouldplaytimetobeatot();
    var_974ea582db790ced = shouldplayscoretobeatot();
    return !level.forcedend && (tied || var_b564bf7a9922b991 || var_4b3eea7964b200d2 || var_974ea582db790ced);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2892
// Size: 0x57
function resetscoreonroundstart() {
    if (isdefined(level.resetscoreonroundstart)) {
        return [[ level.resetscoreonroundstart ]](inovertime());
    }
    return (getgametype() == "ctf" || getgametype() == "blitz") && !inovertime() && getwingamebytype() == "roundsWon";
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f2
// Size: 0x18c
function canplayhalfwayvo() {
    if (!isdefined(level.didhalfscorevoboost)) {
        level.didhalfscorevoboost = 0;
    }
    if (level.didhalfscorevoboost) {
        return 0;
    }
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_7e89154a96f625d":
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
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a86
// Size: 0x30
function hittimelimit() {
    if (getwatcheddvar("timelimit") <= 0) {
        return false;
    }
    timeleft = scripts\mp\gamelogic::gettimeremaining();
    if (timeleft > 0) {
        return false;
    }
    return true;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2abf
// Size: 0x23
function hitroundlimit() {
    if (level.roundlimit <= 0) {
        return false;
    }
    return game["roundsPlayed"] >= level.roundlimit;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aeb
// Size: 0xf2
function hitscorelimit() {
    if (isobjectivebased()) {
        return false;
    }
    if (level.roundscorelimit <= 0) {
        return false;
    }
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            if (game["teamScores"][entry] >= level.roundscorelimit) {
                return true;
            }
        }
    } else {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (isdefined(player.score) && player.score >= level.roundscorelimit) {
                return true;
            }
        }
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be6
// Size: 0x85
function hitwinlimit() {
    if (level.winlimit <= 0) {
        return false;
    }
    if (!level.teambased) {
        return true;
    }
    foreach (entry in level.teamnamelist) {
        if (getroundswon(entry) >= level.winlimit) {
            return true;
        }
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c74
// Size: 0x3b
function getscorelimit() {
    if (isroundbased()) {
        if (level.roundlimit) {
            return level.roundlimit;
        } else {
            return level.winlimit;
        }
        return;
    }
    return level.roundscorelimit;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb7
// Size: 0x14
function getroundswon(team) {
    return game["roundsWon"][team];
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd4
// Size: 0x86
function allteamstied() {
    wingamebytype = getwingamebytype();
    winvalue = undefined;
    foreach (entry in level.teamnamelist) {
        if (!isdefined(winvalue)) {
            winvalue = game[wingamebytype][entry];
            continue;
        }
        if (winvalue != game[wingamebytype][entry]) {
            return false;
        }
    }
    return true;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d63
// Size: 0xb
function isobjectivebased() {
    return level.objectivebased;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d77
// Size: 0xae
function gettimelimit() {
    if (inovertime() && (!isdefined(game["inNukeOvertime"]) || !game["inNukeOvertime"])) {
        if (istrue(game["timeToBeat"])) {
            return game["timeToBeat"];
        } else {
            overtimelimit = getdvarfloat(@"overtimeTimeLimit");
            if (overtimelimit > 0) {
                return overtimelimit;
            } else {
                return getwatcheddvar("timelimit");
            }
        }
        return;
    }
    if (isdefined(level.extratime) && level.extratime > 0) {
        return (getwatcheddvar("timelimit") + level.extratime);
    }
    return getwatcheddvar("timelimit");
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2d
// Size: 0x37
function gethalftime() {
    if (inovertime()) {
        return 0;
    }
    if (isdefined(game["inNukeOvertime"]) && game["inNukeOvertime"]) {
        return 0;
    }
    return getwatcheddvar("halftime");
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6c
// Size: 0x1b
function inovertime() {
    return isdefined(game["status"]) && game["status"] == "overtime";
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e90
// Size: 0x91
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

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f2a
// Size: 0xa6
function getlivingplayers(team) {
    player_array = [];
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (level.teambased && isdefined(team)) {
            if (team == player.pers["team"]) {
                player_array[player_array.size] = player;
            }
            continue;
        }
        player_array[player_array.size] = player;
    }
    return player_array;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fd9
// Size: 0x23
function rankingenabled() {
    if (!isplayer(self)) {
        return false;
    }
    return level.rankedmatch && !self.usingonlinedataoffline;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3005
// Size: 0x23
function onlinestatsenabled() {
    if (!isplayer(self)) {
        return false;
    }
    return level.onlinestatsenabled && !self.usingonlinedataoffline;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3031
// Size: 0x1d
function privatematch() {
    return level.onlinegame && getdvarint(@"xblive_privatematch");
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3057
// Size: 0x31
function lobbyteamselectenabled() {
    return level.systemlink || privatematch() && getdvarint(@"lobby_team_select", 0) || function_1eb7d2791d3c536f();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3091
// Size: 0xb
function matchmakinggame() {
    return level.matchmakingmatch;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30a5
// Size: 0xd
function getgametypenumlives() {
    return getwatcheddvar("numlives");
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30bb
// Size: 0x27
function islifelimited() {
    if (!isdefined(level.numlifelimited)) {
        level.numlifelimited = getgametypenumlives();
    }
    return level.numlifelimited;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30eb
// Size: 0xca
function getlastlivingplayer(team) {
    liveplayer = undefined;
    foreach (player in level.players) {
        if (isdefined(team) && player.team != team) {
            continue;
        }
        if (!player scripts\cp_mp\utility\player_utility::_isalive() && !player scripts\mp\playerlogic::mayspawn()) {
            continue;
        }
        if (isdefined(player.switching_teams) && player.switching_teams) {
            continue;
        }
        assertex(!isdefined(liveplayer), "<dev string:x1c>");
        liveplayer = player;
    }
    return liveplayer;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31be
// Size: 0xa4
function trygetlastpotentiallivingplayer() {
    liveplayer = undefined;
    foreach (player in level.players) {
        if (!player scripts\cp_mp\utility\player_utility::_isalive() && !player scripts\mp\playerlogic::mayspawn()) {
            continue;
        }
        if (istrue(level.codcasterenabled)) {
            if (player iscodcaster()) {
                continue;
            }
        }
        if (isdefined(liveplayer)) {
            return undefined;
        }
        liveplayer = player;
    }
    if (isdefined(liveplayer)) {
        return liveplayer;
    }
    return undefined;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x326a
// Size: 0x92
function getpotentiallivingplayers() {
    liveplayers = [];
    foreach (player in level.players) {
        if (!player scripts\cp_mp\utility\player_utility::_isalive() && !player scripts\mp\playerlogic::mayspawn()) {
            continue;
        }
        if (istrue(level.codcasterenabled)) {
            if (player iscodcaster()) {
                continue;
            }
        }
        liveplayers[liveplayers.size] = player;
    }
    return liveplayers;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3305
// Size: 0x48
function denysystemicteamchoice() {
    if (!isbot(self) && !istestclient(self)) {
        if (isintournament()) {
            return true;
        }
        if (istrue(level.codcasterenabled)) {
            return false;
        }
    }
    if (getdvarint(@"hash_c11db9baa9e5bc9b", 0) > 0) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3356
// Size: 0x28
function allowteamassignment() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return level.teambased;
    }
    allowed = doesmodesupportplayerteamchoice();
    return allowed;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3387
// Size: 0x78
function doesmodesupportplayerteamchoice() {
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        if (getgametype() == "gun" || scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
            return false;
        }
        allowed = int(tablelookup("mp/gametypesTable.csv", 0, getgametype(), 4));
        assert(isdefined(allowed));
        return (allowed > 0);
    }
    return istrue(level.gametypebundle.var_71b14066991700ec);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3408
// Size: 0xdf
function allowclasschoice() {
    if (getdvarint(@"hash_c11db9baa9e5bc9b", 0) > 0) {
        return 0;
    }
    if (getdvarint(@"hash_f195e306ffa755d0", 0) == 1) {
        return 0;
    }
    if (isdefined(level.allowclasschoicefunc)) {
        callbackresult = self [[ level.allowclasschoicefunc ]]();
        if (isdefined(callbackresult)) {
            return callbackresult;
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
        assert(isdefined(allowed));
        return allowed;
    }
    return istrue(level.gametypebundle.allowclasschoice);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34f0
// Size: 0x3
function showfakeloadout() {
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34fc
// Size: 0x8c
function setfakeloadoutweaponslot(sweapon, var_7ebc888be394a18e) {
    weaponname = namespace_e0ee43ef2dddadaa::getweaponrootname(sweapon);
    attachments = [];
    if (weaponname != "iw8_knife") {
        attachments = getweaponattachments(sweapon);
    }
    for (i = 0; i < 3; i++) {
        var_b519f801a23677bf = -1;
        if (isdefined(attachments[i])) {
            if (!scripts\mp\utility\weapon::isattachmentsniperscopedefault(sweapon, attachments[i])) {
                var_b519f801a23677bf = tablelookuprownum("mp/attachmenttable.csv", 4, attachments[i]);
            }
        }
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3590
// Size: 0x1096
function setcommonrulesfrommatchrulesdata(skipfriendlyfire) {
    teamcount = getmatchrulesdata("commonOption", "teamCount");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_teamcount"), teamcount);
    teamsize = scripts\cp_mp\utility\game_utility::function_4fb37368ae3585bb();
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_teamsize"), teamsize);
    timelimit = getmatchrulesdata("commonOption", "timeLimit");
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 1) {
        println("<dev string:x5e>");
        if (isdefined(game["gameStateRestore"]) && game["gameStateRestore"].enabled) {
            println("<dev string:x7f>");
            timelimit = game["gameStateRestore"].gametime;
        }
    }
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_timeLimit"), timelimit);
    registertimelimitdvar(getgametype(), timelimit);
    level.initialtimelimit = timelimit;
    scorelimit = getmatchrulesdata("commonOption", "scoreLimit");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_scoreLimit"), scorelimit);
    registerscorelimitdvar(getgametype(), scorelimit);
    winlimit = getmatchrulesdata("commonOption", "winLimit");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_winLimit"), winlimit);
    registerwinlimitdvar(getgametype(), winlimit);
    roundlimit = getmatchrulesdata("commonOption", "roundLimit");
    if (function_8cc09267ba72c7f7()) {
        roundlimit = 2;
    }
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_roundLimit"), roundlimit);
    registerroundlimitdvar(getgametype(), roundlimit);
    roundswitch = getmatchrulesdata("commonOption", "roundSwitch");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_roundSwitch"), roundswitch);
    registerroundswitchdvar(getgametype(), roundswitch, 0, 9);
    winbytwoenabled = getmatchrulesdata("commonOption", "winByTwoEnabled");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoEnabled"), winbytwoenabled);
    registerwinbytwoenableddvar(getgametype(), winbytwoenabled);
    winbytwomaxrounds = getmatchrulesdata("commonOption", "winByTwoMaxRounds");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_winByTwoMaxRounds"), winbytwomaxrounds);
    registerwinbytwomaxroundsdvar(getgametype(), winbytwomaxrounds);
    dogtags = getmatchrulesdata("commonOption", "dogTags");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_dogTags"), dogtags);
    registerdogtagsenableddvar(getgametype(), dogtags);
    spawnprotectiontimer = getmatchrulesdata("commonOption", "spawnProtectionTimer");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_spawnProtectionTimer"), spawnprotectiontimer);
    numlives = getmatchrulesdata("commonOption", "numLives");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), numlives);
    registernumlivesdvar(getgametype(), numlives);
    numrevives = getmatchrulesdata("commonOption", "numRevives");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_numRevives"), numrevives);
    registernumrevivesdvar(getgametype(), numrevives);
    setdynamicdvar(@"scr_player_maxhealth", getmatchrulesdata("commonOption", "maxHealth"));
    setdynamicdvar(@"scr_player_healthregentime", getmatchrulesdata("commonOption", "healthRegen"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_healthregentime"), getmatchrulesdata("commonOption", "healthRegen"));
    setdynamicdvar(@"hash_a4d532f42d919827", getmatchrulesdata("commonOption", "allowArmor"));
    setdynamicdvar(@"hash_d75d5638785f3b09", getmatchrulesdata("commonOption", "spawnArmor"));
    setdynamicdvar(@"hash_a6a3fd965485d4bc", getmatchrulesdata("commonOption", "spawnArmorPlates"));
    setdynamicdvar(@"hash_8ad1ab9436bccca", getmatchrulesdata("commonOption", "dropArmorOnDeath"));
    setdynamicdvar(@"hash_28d450f7f28644b7", getmatchrulesdata("commonOption", "armorDropAmount"));
    setdynamicdvar(@"scr_player_disableSuperSprint", getmatchrulesdata("commonOption", "disableSuperSprint"));
    setdynamicdvar(@"scr_player_disableMount", getmatchrulesdata("commonOption", "disableMount"));
    setdynamicdvar(@"scr_player_lastStand", getmatchrulesdata("commonOption", "lastStand"));
    setdynamicdvar(@"hash_e4f93d764d11874d", getmatchrulesdata("commonOption", "deathsDoorEnterPct"));
    setdynamicdvar(@"hash_b84edc242cc61abf", getmatchrulesdata("commonOption", "deathsDoorExitPct"));
    laststandhealth = getmatchrulesdata("commonOption", "lastStandHealth");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandHealth"), laststandhealth);
    registerlaststandhealthdvar(laststandhealth);
    laststandrevivehealth = getmatchrulesdata("commonOption", "lastStandReviveHealth");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandReviveHealth"), laststandrevivehealth);
    registerlaststandrevivehealthdvar(laststandrevivehealth);
    laststandtimer = getmatchrulesdata("commonOption", "lastStandTimer");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandTimer"), laststandtimer);
    registerlaststandtimerdvar(laststandtimer);
    laststandrevivetimer = getmatchrulesdata("commonOption", "lastStandReviveTimer");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandReviveTimer"), laststandrevivetimer);
    registerlaststandrevivetimerdvar(laststandrevivetimer);
    laststandsuicidetimer = getmatchrulesdata("commonOption", "lastStandSuicideTimer");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lastStandSuicideTimer"), laststandsuicidetimer);
    registerlaststandsuicidetimerdvar(laststandsuicidetimer);
    setdynamicdvar(@"hash_df1ae5a11f519ab5", getmatchrulesdata("commonOption", "reviveUseWeapon"));
    level.matchrules_damagemultiplier = 0;
    setdynamicdvar(@"scr_game_vampirism", getmatchrulesdata("commonOption", "vampirism"));
    setdynamicdvar(@"scr_game_spectatetype", getmatchrulesdata("commonOption", "spectateModeAllowed"));
    setdynamicdvar(@"scr_game_allowkillcam", getmatchrulesdata("commonOption", "showKillcam"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_killcamType"), getmatchrulesdata("commonOption", "killcamType"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allow3rdspectate"), getmatchrulesdata("commonOption", "spectate3rdAllowed"));
    setdynamicdvar(@"scr_game_enableMinimap", getmatchrulesdata("commonOption", "enableMinimap"));
    setdynamicdvar(@"scr_game_forceuav", getmatchrulesdata("commonOption", "radarAlwaysOn"));
    setdynamicdvar(@"scr_game_radarHidePings", getmatchrulesdata("commonOption", "radarHideShots"));
    setdynamicdvar(@"scr_game_navBarHideEnemy", getmatchrulesdata("commonOption", "compassHideEnemy"));
    setdynamicdvar(@"scr_game_navBarHidePings", getmatchrulesdata("commonOption", "compassHidePings"));
    setdynamicdvar(@"hash_5fc696f5bbb3ca62", getmatchrulesdata("commonOption", "disableSpawnCamera"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_playerrespawndelay"), getmatchrulesdata("commonOption", "respawnDelay"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_suicidespawndelay"), getmatchrulesdata("commonOption", "suicideSpawnDelay"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay"), getmatchrulesdata("commonOption", "waveRespawnDelay"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay_alt"), getmatchrulesdata("commonOption", "waveRespawnDelayAlt"));
    setdynamicdvar(@"scr_player_forcerespawn", getmatchrulesdata("commonOption", "forceRespawn"));
    level.matchrules_allowcustomclasses = getmatchrulesdata("commonOption", "allowCustomClasses");
    level.supportintel = getmatchrulesdata("commonOption", "allowIntel");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allowKillstreaks"), getmatchrulesdata("commonOption", "allowKillstreaks"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allowPerks"), getmatchrulesdata("commonOption", "allowPerks"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allowSupers"), getmatchrulesdata("commonOption", "allowSupers"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishLimit"), getmatchrulesdata("commonOption", "ffPunishLimit"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishDamageLimit"), getmatchrulesdata("commonOption", "ffPunishDamageLimit"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_ffKickKillLimit"), getmatchrulesdata("commonOption", "ffKickKillLimit"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_ffKickDamageLimit"), getmatchrulesdata("commonOption", "ffKickDamageLimit"));
    setdynamicdvar(@"scr_thirdperson", getmatchrulesdata("commonOption", "thirdPerson"));
    if (getdvarint(@"hash_ff21d0d18916f3a1", 0) == 1) {
        setdynamicdvar(@"camera_thirdPerson", getmatchrulesdata("commonOption", "thirdPerson"));
    }
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreaks"), getmatchrulesdata("commonOption", "roundRetainStreaks"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreakProg"), getmatchrulesdata("commonOption", "roundRetainStreakProg"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_deathRetainStreaks"), getmatchrulesdata("commonOption", "deathRetainStreaks"));
    setdynamicdvar(@"scr_game_casualScoreStreaks", getmatchrulesdata("commonOption", "casualScoreStreaks"));
    setdynamicdvar(@"hash_614165a37ac2db61", getmatchrulesdata("commonOption", "wrapKillstreaks"));
    setdynamicdvar(@"scr_game_superFastChargeRate", getmatchrulesdata("commonOption", "superFastChargeRate"));
    setdynamicdvar(@"scr_game_superPointsMod", getmatchrulesdata("commonOption", "superPointsMod"));
    setdynamicdvar(@"hash_fbc77dbb0cf44cc7", getmatchrulesdata("commonOption", "spawnProtectionTimer"));
    setdynamicdvar(@"scr_game_lethalDelay", getmatchrulesdata("commonOption", "equipmentDelay"));
    setdynamicdvar(@"scr_game_equipmentMSProtect", getmatchrulesdata("commonOption", "equipmentMSProtect"));
    setdynamicdvar(@"scr_game_disableBattleChatter", getmatchrulesdata("commonOption", "disableBattleChatter"));
    setdynamicdvar(@"scr_game_disableAnnouncer", getmatchrulesdata("commonOption", "disableAnnouncer"));
    setdynamicdvar(@"scr_game_inGameLoot", getmatchrulesdata("commonOption", "inGameLoot"));
    var_c84f9319fe9e602f = 0;
    /#
        if (!istrue(level.onlinegame) && getdvarint(@"hash_c55dc89ef275cdaa", 0)) {
            var_c84f9319fe9e602f = 1;
        }
        if (getdvarint(@"hash_74cacae425805743", 0) > 0) {
            var_c84f9319fe9e602f = 1;
        }
    #/
    if (var_c84f9319fe9e602f || function_8cc09267ba72c7f7()) {
        setdynamicdvar(@"scr_game_infilSkip", 1);
    } else {
        setdynamicdvar(@"scr_game_infilSkip", getmatchrulesdata("commonOption", "infilSkip"));
    }
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_practiceRound"), getmatchrulesdata("commonOption", "practiceRound"));
    setdynamicdvar(@"hash_d2de59939486bd5a", getmatchrulesdata("commonOption", "postGameExfil"));
    setdynamicdvar(@"hash_96dd663f32dba868", getmatchrulesdata("commonOption", "exfilExtractTimer"));
    setdynamicdvar(@"hash_645019bc959ffaf9", getmatchrulesdata("commonOption", "exfilActiveTimer"));
    level.crankedbombtimer = getmatchrulesdata("commonOption", "crankedBombTimer");
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_crankedBombTimer"), level.crankedbombtimer);
    scripts\mp\cranked::registercrankedtimerdvar(getgametype(), level.crankedbombtimer);
    setdynamicdvar(@"hash_72fe29aa713ea21e", getmatchrulesdata("commonOption", "classTableOverride"));
    setdynamicdvar(@"scr_game_magcount", getmatchrulesdata("commonOption", "magCount"));
    setdynamicdvar(@"hash_127490a7577f169f", getmatchrulesdata("commonOption", "tier1ModeEnabled"));
    setdynamicdvar(@"hash_a2c2c2007177185e", getmatchrulesdata("commonOption", "hardcoreModeOn"));
    setdynamicdvar(@"scr_game_onlyheadshots", getmatchrulesdata("commonOption", "headshotsOnly"));
    if (!isdefined(skipfriendlyfire)) {
        setdynamicdvar(@"scr_team_fftype", getmatchrulesdata("commonOption", "friendlyFire"));
    }
    setdvar(@"bg_compassShowEnemies", getdvarint(@"scr_game_forceuav") == 1);
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), getmatchrulesdata("commonOption", "pointsPerKill"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerDeath"), getmatchrulesdata("commonOption", "pointsPerDeath"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsHeadshotBonus"), getmatchrulesdata("commonOption", "pointsHeadshotBonus"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKSKill"), getmatchrulesdata("commonOption", "pointsPerKSKill"));
    setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "");
    setdynamicdvar(@"hash_29d45d6822a1cf6d", "");
    if (privatematch() || level.systemlink || isanymlgmatch()) {
        setdynamicdvar(@"hash_704afe6f6c582ee0", getmatchrulesdata("commonOption", "matchStartTime"));
        setdynamicdvar(@"hash_da33635b62d4e5b3", getmatchrulesdata("commonOption", "roundStartTime"));
    }
    setdvar(@"scr_game_killstreakdelay", getmatchrulesdata("commonOption", "killstreakDelay"));
    if (getdvarint(@"hash_f06ae50014e12fe5") == 1) {
        setdvar(@"hash_8610ccd25560c117", getmatchrulesdata("commonOption", "dynamicMapElementsDisabled"));
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x462e
// Size: 0x58
function reinitializematchrulesonmigration() {
    assert(isusingmatchrulesdata());
    assert(isdefined(level.initializematchrules));
    while (true) {
        level waittill("host_migration_begin");
        [[ level.initializematchrules ]]();
        if (isdefined(level.var_8b131e98e1629afe)) {
            [[ level.var_8b131e98e1629afe ]]();
        }
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x468e
// Size: 0x4c
function reinitializethermal(ent) {
    self endon("disconnect");
    if (isdefined(ent)) {
        ent endon("death");
    }
    while (true) {
        level waittill("host_migration_begin");
        if (isdefined(self.lastvisionsetthermal)) {
            self visionsetthermalforplayer(self.lastvisionsetthermal, 0);
        }
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46e2
// Size: 0x216
function getmatchrulesspecialclass(team, index) {
    class = [];
    class["loadoutPrimaryAttachment2"] = "none";
    class["loadoutSecondaryAttachment2"] = "none";
    var_d414e906aa1e0afb = [];
    assertex(isdefined(team) && team != "<dev string:x9b>", "<dev string:xa3>");
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
    class["loadoutKillstreak1"] = scripts\mp\class::recipe_getkillstreak(team, index, 0);
    class["loadoutKillstreak2"] = scripts\mp\class::recipe_getkillstreak(team, index, 1);
    class["loadoutKillstreak3"] = scripts\mp\class::recipe_getkillstreak(team, index, 2);
    return class;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4901
// Size: 0x7c
function isplayeroutsideofanybombsite(objweapon) {
    if (isdefined(level.objectives)) {
        foreach (bombzone in level.objectives) {
            if (self istouching(bombzone.noweapondropallowedtrigger)) {
                return false;
            }
        }
    }
    return true;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4986
// Size: 0x3d
function gamehasneutralcrateowner(gametype) {
    switch (gametype) {
    case #"hash_415b79b2ee6a14d9":
    case #"hash_def61d8a0b05bf0d": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49cb
// Size: 0x3f
function isanymlgmatch() {
    if (isusingmatchrulesdata()) {
        if (getdvarint(@"hash_65c2395ef96fc773") == 0 && getmatchrulesdata("cwlRulesEnabled") == 1) {
            return 1;
        }
    }
    return getdvarint(@"xblive_competitionmatch");
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a13
// Size: 0x24
function ismlgsystemlink() {
    if (level.systemlink && getdvarint(@"xblive_competitionmatch")) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a40
// Size: 0x21
function ismlgprivatematch() {
    if (privatematch() && getdvarint(@"xblive_competitionmatch")) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a6a
// Size: 0x19
function ismlgmatch() {
    if (ismlgsystemlink() || ismlgprivatematch()) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a8c
// Size: 0x75
function ismoddedroundgame() {
    if (getgametype() == "dom" || getgametype() == "ctf" || getgametype() == "rush" || getgametype() == "blitz" || getgametype() == "rescue" || getgametype() == "ballmode" || getbasegametype() == "escort") {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b0a
// Size: 0x8a
function isusingdefaultclass(team, index) {
    usingdefaultclass = 0;
    if (isdefined(index)) {
        if (isusingmatchrulesdata() && getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "inUse")) {
            usingdefaultclass = 1;
        }
    } else {
        for (index = 0; index < 6; index++) {
            if (isusingmatchrulesdata() && getmatchrulesdatawithteamandindex("defaultClasses", team, index, "class", "inUse")) {
                usingdefaultclass = 1;
                break;
            }
        }
    }
    return usingdefaultclass;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9d
// Size: 0x7f
function getmatchrulesdatawithteamandindex(category, team, index, field, arg1, arg2, arg3) {
    if (team == "axis") {
        index += 6;
    }
    if (isdefined(arg3)) {
        return getmatchrulesdata(category, index, field, arg1, arg2, arg3);
    }
    if (isdefined(arg2)) {
        return getmatchrulesdata(category, index, field, arg1, arg2);
    }
    return getmatchrulesdata(category, index, field, arg1);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c24
// Size: 0x50
function isspawnprotected() {
    return !function_483cc81bff18273b(self) && isdefined(self.spawntime) && isdefined(level.killstreakspawnshielddelayms) && gettime() < self.spawntime + level.killstreakspawnshielddelayms && !istrue(self.clearSpawnProtection);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c7d
// Size: 0xd
function clearSpawnProtection() {
    self.clearSpawnProtection = 1;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c92
// Size: 0x29
function ismatchstartprotected() {
    return isdefined(level.starttime) && gettime() < level.starttime + level.equipmentmatchstartshieldms;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc4
// Size: 0x8
function getgametype() {
    return scripts\cp_mp\utility\game_utility::getgametype();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cd5
// Size: 0x8
function getbasegametype() {
    return scripts\cp_mp\utility\game_utility::getbasegametype();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ce6
// Size: 0x19
function function_f6bad1d33ad22078() {
    if (level.var_ec2fb549b15ad827) {
        return "mp_ranked";
    }
    return "mp";
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d08
// Size: 0x8
function getsubgametype() {
    return scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d19
// Size: 0x27
function issubgametype() {
    gametype = getgametype();
    subgametype = getsubgametype();
    return gametype != subgametype;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d49
// Size: 0x38
function isteamplacementsbmmmode() {
    switch (getsubgametype()) {
    case #"hash_3c1c1566d7b3b870":
    case #"hash_9196025f8ae8e51e":
    case #"hash_fa21c4f6bd5e3815": 
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d8a
// Size: 0x38
function function_a305f5d1be837817() {
    switch (getgametype()) {
    case #"hash_2f5af599c5c220d3":
    case #"hash_b024b6bb2d9e8547":
    case #"hash_cf3000550ee7e8b3": 
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dcb
// Size: 0x11
function function_8cc09267ba72c7f7() {
    return getdvarint(@"hash_bc885339c750a6ee", 0);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4de5
// Size: 0x1f
function function_6c88a48a9e942c3d() {
    return function_8cc09267ba72c7f7() && self [[ getsharedfunc("escort", "isZombie") ]]();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e0d
// Size: 0x2c
function function_f24e99a2f548d0b8() {
    switch (getgametype()) {
    case #"hash_4cb5825e78aaa8c":
    case #"hash_a00cd1371d281532": 
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e42
// Size: 0x1b
function function_d75b73c443421047() {
    return getdvar(@"ui_gametype", "") == "limbo";
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e66
// Size: 0x80
function lpcfeaturegated() {
    if (runleanthreadmode()) {
        return true;
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
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4eef
// Size: 0x36
function runleanthreadmode() {
    if (getdvarint(@"hash_63b929c96913e1d") == 1) {
        return true;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() || level.leanthread == 1) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f2e
// Size: 0x8d
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

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4fc4
// Size: 0x2d
function teamhasinfil(team) {
    return gamehasinfil() && isgameplayteam(team) && isdefined(game["infil"][team][1]);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ffa
// Size: 0x12
function iskillstreakdenied() {
    return scripts\cp_mp\emp_debuff::is_empd() || isairdenied();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5015
// Size: 0x17
function isairdenied() {
    if (self.team == "spectator") {
        return false;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5035
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

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50a5
// Size: 0x15
function function_a01d18a56c6cc1aa() {
    return getdvarfloat(@"hash_dd59793cdeddb43f", 15);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50c3
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

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5125
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

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5187
// Size: 0x16
function getmaxoutofboundsrestrictedtime() {
    level.outofboundstimerestricted = 10;
    return level.outofboundstimerestricted;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51a6
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

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51f4
// Size: 0x104
function updateobjectivetext() {
    if (self.pers["team"] == "spectator") {
        self setclientdvar(@"cg_objectiveText", "");
        return;
    }
    if (level.roundscorelimit > 0 && !isobjectivebased()) {
        if (isdefined(getobjectivescoretext(self.pers["team"]))) {
            if (level.splitscreen) {
                self setclientdvar(@"cg_objectiveText", getobjectivescoretext(self.pers["team"]));
            } else {
                self setclientdvar(@"cg_objectiveText", getobjectivescoretext(self.pers["team"]), level.roundscorelimit);
            }
        }
        return;
    }
    if (isdefined(getobjectivetext(self.pers["team"]))) {
        self setclientdvar(@"cg_objectiveText", getobjectivetext(self.pers["team"]));
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5300
// Size: 0x24
function setobjectivetext(team, text) {
    game["strings"]["objective_" + team] = text;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x532c
// Size: 0x24
function setobjectivescoretext(team, text) {
    game["strings"]["objective_score_" + team] = text;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5358
// Size: 0x24
function setobjectivehinttext(team, text) {
    game["strings"]["objective_hint_" + team] = text;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5384
// Size: 0x1a
function getobjectivetext(team) {
    return game["strings"]["objective_" + team];
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53a7
// Size: 0x1a
function getobjectivescoretext(team) {
    return game["strings"]["objective_score_" + team];
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53ca
// Size: 0x1a
function getobjectivehinttext(team) {
    return game["strings"]["objective_hint_" + team];
}

// Namespace game_utility / scripts\mp\utility\game
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53ed
// Size: 0x3e
function testgamemodestringlist(stringlist, gamemode) {
    if (!isdefined(stringlist) || stringlist == "" || !isdefined(gamemode) || gamemode == "") {
        return 0;
    }
    return issubstr(stringlist, gamemode);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5434
// Size: 0x3a
function islaststandenabled() {
    return isdefined(level.laststand) && (level.laststand == 1 || level.laststand == 3) || istrue(level.var_78184ec36f669844);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5477
// Size: 0x2c
function isteamreviveenabled() {
    return isdefined(level.laststand) && (level.laststand == 2 || level.laststand == 3);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x54ac
// Size: 0x518
function isdefending(victim) {
    inobjective = 0;
    switch (getgametype()) {
    case #"hash_eb5e5f470e0c1dc2": 
        if (isdefined(level.cyberemp.carrier) && self.team == level.cyberemp.ownerteam && self != level.cyberemp.carrier) {
            var_abb6fbdd8cd1a1d2 = distancesquared(level.cyberemp.carrier.origin, self.origin);
            var_44096cee99b7a48b = distancesquared(level.cyberemp.carrier.origin, victim.origin);
            if (var_abb6fbdd8cd1a1d2 < 90000 || var_44096cee99b7a48b < 90000) {
                inobjective = 1;
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
                    inobjective = 1;
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
                inobjective = 1;
                break;
            }
        }
        break;
    case #"hash_4cb5825e78aaa8c":
    case #"hash_ca6516c10db2c95":
    case #"hash_2f5af599c5c220d3":
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
                inobjective = 1;
                break;
            }
        }
        break;
    case #"hash_634e449bb53a8268":
    case #"hash_6efb0f59a62300fb":
    case #"hash_78ebb3b7ce8f864f":
    case #"hash_a6b6d6b8dc1096cd":
    case #"hash_b9aaf1c4459d9a15":
    case #"hash_cf3000550ee7e8b3":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_fa34c5f6bd6d4432": 
        if (isdefined(level.zone)) {
            inobjective = ispointinvolume(self.origin, level.zone.trigger) || ispointinvolume(victim.origin, level.zone.trigger);
        }
        break;
    }
    return inobjective;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59cd
// Size: 0x518
function isassaulting(victim) {
    inobjective = 0;
    switch (getgametype()) {
    case #"hash_eb5e5f470e0c1dc2": 
        if (istrue(victim.isbombcarrier)) {
            inobjective = 1;
            break;
        }
        if (isdefined(level.cyberemp.carrier) && self.team == level.cyberemp.ownerteam && self != level.cyberemp.carrier) {
            var_abb6fbdd8cd1a1d2 = distancesquared(level.cyberemp.carrier.origin, self.origin);
            var_44096cee99b7a48b = distancesquared(level.cyberemp.carrier.origin, victim.origin);
            if (var_abb6fbdd8cd1a1d2 < 90000 || var_44096cee99b7a48b < 90000) {
                inobjective = 1;
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
                    inobjective = 1;
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
                inobjective = 1;
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
                inobjective = 1;
                break;
            }
        }
        break;
    case #"hash_634e449bb53a8268":
    case #"hash_6efb0f59a62300fb":
    case #"hash_78ebb3b7ce8f864f":
    case #"hash_a6b6d6b8dc1096cd":
    case #"hash_b9aaf1c4459d9a15":
    case #"hash_cf3000550ee7e8b3":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_fa34c5f6bd6d4432": 
        if (isdefined(level.zone)) {
            inobjective = ispointinvolume(self.origin, level.zone.trigger) || ispointinvolume(victim.origin, level.zone.trigger);
        }
        break;
    }
    return inobjective;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5eee
// Size: 0xe0
function gametypesupportsbasejumping() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return 1;
    }
    if (scripts\cp_mp\utility\game_utility::function_2d79a7a3b91c4c3e()) {
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
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fd6
// Size: 0x109
function mapsupportsbasejumping() {
    if (scripts\cp_mp\utility\game_utility::isdonetskmap() || scripts\cp_mp\utility\game_utility::islargemap()) {
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
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x60e7
// Size: 0x38a
function logannouncement(player, contester, message, zoneorigin, extrainfo) {
    time_from_match_start = scripts\mp\matchdata::gettimefrommatchstart(gettime());
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
        if (isdefined(zoneorigin)) {
            dlog_recordevent("dlog_event_announcement", ["time_from_match_start", time_from_match_start, "announcement", message, "extra_info", info, "player_team", "none", "contester_team", "none", "zone_x", zoneorigin[0], "zone_y", zoneorigin[1], "zone_z", zoneorigin[2]]);
        } else {
            dlog_recordevent("dlog_event_announcement", ["time_from_match_start", time_from_match_start, "announcement", message, "extra_info", info]);
        }
        return;
    }
    if (isdefined(contester)) {
        if (isdefined(zoneorigin)) {
            dlog_recordevent("dlog_event_announcement", ["player", player, "contester", contester, "time_from_match_start", time_from_match_start, "announcement", message, "extra_info", info, "player_team", player.team, "contester_team", contester.team, "zone_x", zoneorigin[0], "zone_y", zoneorigin[1], "zone_z", zoneorigin[2]]);
        } else {
            dlog_recordevent("dlog_event_announcement", ["player", player, "contester", contester, "time_from_match_start", time_from_match_start, "announcement", message, "extra_info", info, "player_team", player.team, "contester_team", contester.team]);
        }
        return;
    }
    if (isdefined(zoneorigin)) {
        dlog_recordevent("dlog_event_announcement", ["player", player, "time_from_match_start", time_from_match_start, "announcement", message, "extra_info", info, "player_team", player.team, "contester_team", "none", "zone_x", zoneorigin[0], "zone_y", zoneorigin[1], "zone_z", zoneorigin[2]]);
        return;
    }
    dlog_recordevent("dlog_event_announcement", ["player", player, "time_from_match_start", time_from_match_start, "announcement", message, "extra_info", info, "player_team", player.team]);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6479
// Size: 0xc
function isprophuntgametype() {
    return istrue(level.isprophunt);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x648e
// Size: 0x36
function isgroundwarcoremode() {
    return istrue(level.isgroundwarinfected) || istrue(level.isgroundwarsiege) || istrue(level.isgroundwardom) || istrue(level.var_904f766b5267e332);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x64cd
// Size: 0xb1
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
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6586
// Size: 0x81
function isverdansksubmap() {
    switch (scripts\cp_mp\utility\game_utility::getmapname()) {
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
    }
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x660f
// Size: 0x48
function function_e417d8ef1c70cbcb() {
    if (scripts\cp_mp\utility\game_utility::islargemap()) {
        return true;
    } else if (scripts\cp_mp\utility\game_utility::isdonetskmap()) {
        return true;
    } else if (isverdansksubmap()) {
        return true;
    } else if (getdvarint(@"hash_e35a761bc944e0f8", 0) != 1) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6660
// Size: 0x119
function canparachutebecut(player) {
    var_37b3fb3ff20a3eb6 = 0;
    var_a5150dc49f8b1cc7 = 0;
    gametype = getgametype();
    if (isusingmatchrulesdata() && getmatchrulesdata("commonOption", "allowParachute") || (gametype == "arm" || gametype == "bigctf" || gametype == "conflict" || gametype == "risk" || gametype == "gwbomb" || isgroundwarcoremode()) && scripts\cp_mp\utility\game_utility::islargemap() || getdvarint(@"hash_9365c7a237edaa2f", 0) == 1 || istrue(level.var_aac427da0a1569e2)) {
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
        return;
    }
    player skydive_cutparachuteoff();
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6781
// Size: 0x1d
function function_1e098780c33853f2() {
    return matchmakinggame() && getdvarint(@"hash_72fe29aa713ea21e", 0) != 0;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67a7
// Size: 0x1e
function function_ac09124b4e7535a6() {
    return matchmakinggame() && getdvarint(@"hash_72fe29aa713ea21e", 0) == 1;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67ce
// Size: 0x1b
function function_b7d052e4bf41ee9b() {
    if (function_1e098780c33853f2()) {
        return true;
    }
    if (function_f24e99a2f548d0b8()) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67f2
// Size: 0x31
function function_eb3158a25aee673a() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        subgametype = getsubgametype();
        return (subgametype == "dmz" || subgametype == "exgm");
    }
    return false;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x682c
// Size: 0x10
function function_d7ec918e29c0b2f4() {
    return getdvarint(@"hash_819016fcba31a2c2");
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6845
// Size: 0xc
function function_f698bfd3efa33302() {
    return istrue(level.supportcranked);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x685a
// Size: 0x1d
function function_e9f3a160bbefe208(player) {
    return isdefined(player) && istrue(player.supportcranked);
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6880
// Size: 0x5a
function get_linked_vehicle_nodes() {
    array = [];
    if (isdefined(self.script_linkto)) {
        linknames = get_links();
        if (linknames.size == 1) {
            return getvehiclenodearray(linknames[0], "script_linkname");
        } else if (linknames.size > 1) {
            return function_df5a62cb94a82870(linknames, "script_linkname");
        }
    }
    return array;
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68e3
// Size: 0x40
function function_af945a8525e5b3bb() {
    if (isdefined(level.gametypebundle) && isdefined(level.gametypebundle.var_e1113fd85977023f)) {
        return level.gametypebundle.var_e1113fd85977023f;
    }
    return "";
}

// Namespace game_utility / scripts\mp\utility\game
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x692c
// Size: 0xaa
function function_9a59855eebf296b6() {
    if (isdefined(level.var_29ed825c4a9a052c)) {
        return level.var_29ed825c4a9a052c;
    }
    primaryflags = getentarray("flag_primary", "targetname");
    foreach (flag in primaryflags) {
        if (flag.script_label == "_b") {
            level.var_29ed825c4a9a052c = flag.origin;
            break;
        }
    }
    return level.var_29ed825c4a9a052c;
}

