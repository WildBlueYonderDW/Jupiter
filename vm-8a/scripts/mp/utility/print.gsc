#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace print;

// Namespace print / scripts\mp\utility\print
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc3
// Size: 0x7b
function printonteam(printstring, team) {
    foreach (player in level.players) {
        if (player.team != team) {
            continue;
        }
        player iprintln(printstring);
    }
}

// Namespace print / scripts\mp\utility\print
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x146
// Size: 0x91
function printboldonteam(text, team) {
    assert(isdefined(level.players));
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
            player iprintlnbold(text);
        }
    }
}

// Namespace print / scripts\mp\utility\print
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1df
// Size: 0x9a
function printboldonteamarg(text, team, arg) {
    assert(isdefined(level.players));
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
            player iprintlnbold(text, arg);
        }
    }
}

// Namespace print / scripts\mp\utility\print
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0x9a
function printonteamarg(text, team, arg) {
    assert(isdefined(level.players));
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
            player iprintln(text, arg);
        }
    }
}

// Namespace print / scripts\mp\utility\print
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x323
// Size: 0x8c
function printonplayers(text, team) {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        if (isdefined(team)) {
            if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == team) {
                players[i] iprintln(text);
            }
            continue;
        }
        players[i] iprintln(text);
    }
}

// Namespace print / scripts\mp\utility\print
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b7
// Size: 0x22d
function printandsoundoneveryone(team, otherteam, printfriendly, printenemy, soundfriendly, soundenemy, printarg) {
    shoulddosounds = isdefined(soundfriendly);
    shoulddoenemysounds = 0;
    if (isdefined(soundenemy)) {
        assert(shoulddosounds);
        shoulddoenemysounds = 1;
    }
    if (level.splitscreen || !shoulddosounds) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            playerteam = player.team;
            if (isdefined(playerteam) && isdefined(printarg)) {
                if (playerteam == team && isdefined(printfriendly)) {
                    player iprintln(printfriendly, printarg);
                    continue;
                }
                if (playerteam == otherteam && isdefined(printenemy)) {
                    player iprintln(printenemy, printarg);
                }
            }
        }
        if (shoulddosounds) {
            assert(level.splitscreen);
            level.players[0] playlocalsound(soundfriendly);
        }
        return;
    }
    assert(shoulddosounds);
    if (shoulddoenemysounds) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            playerteam = player.team;
            if (isdefined(playerteam)) {
                if (playerteam == team) {
                    if (isdefined(printfriendly)) {
                        player iprintln(printfriendly, printarg);
                    }
                    player playlocalsound(soundfriendly);
                    continue;
                }
                if (playerteam == otherteam) {
                    if (isdefined(printenemy)) {
                        player iprintln(printenemy, printarg);
                    }
                    player playlocalsound(soundenemy);
                }
            }
        }
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        playerteam = player.team;
        if (isdefined(playerteam)) {
            if (playerteam == team) {
                if (isdefined(printfriendly)) {
                    player iprintln(printfriendly, printarg);
                }
                player playlocalsound(soundfriendly);
                continue;
            }
            if (playerteam == otherteam) {
                if (isdefined(printenemy)) {
                    player iprintln(printenemy, printarg);
                }
            }
        }
    }
}

// Namespace print / scripts\mp\utility\print
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5ec
// Size: 0x85
function printandsoundonteam(team, printstring, soundalias) {
    foreach (player in level.players) {
        if (player.team != team) {
            continue;
        }
        player printandsoundonplayer(printstring, soundalias);
    }
}

// Namespace print / scripts\mp\utility\print
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x679
// Size: 0x23
function printandsoundonplayer(printstring, soundalias) {
    self iprintln(printstring);
    self playlocalsound(soundalias);
}

// Namespace print / scripts\mp\utility\print
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a4
// Size: 0xa8
function printgameaction(msg, player) {
    if (getdvarint(@"hash_dd6678cdc48d6adf", 0) == 1) {
        return;
    }
    playerstring = "";
    if (isdefined(player)) {
        if (isplayer(player)) {
            playerstring = "[" + player getentitynumber() + ":" + player.name + "] ";
        } else {
            playerstring = "[" + player getentitynumber() + "]";
        }
    }
    println("<dev string:x1c>" + playerstring + msg + "<dev string:x21>" + gettime() + "<dev string:x24>");
}

// Namespace print / scripts\mp\utility\print
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x754
// Size: 0x86
function teamhudtutorialmessage(msg, team, time) {
    if (!getteamdata(team, "teamCount")) {
        return;
    }
    foreach (player in getteamdata(team, "players")) {
        player thread tutorialprint(msg, time);
    }
}

// Namespace print / scripts\mp\utility\print
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2
// Size: 0x44
function tutorialprint(msg, time, optional_state) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(optional_state)) {
        optional_state = 1;
    }
    self sethudtutorialmessage(msg, optional_state);
    wait time;
    self clearhudtutorialmessage();
}

// Namespace print / scripts\mp\utility\print
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82e
// Size: 0x170
function getformattedtimestamp(var_5020b0f5e510abb3) {
    if (isdefined(var_5020b0f5e510abb3)) {
        milliseconds = var_5020b0f5e510abb3;
    } else {
        milliseconds = gettime();
    }
    hours = int(milliseconds * 2.77778e-07);
    milliseconds -= hours * 3600000;
    minutes = int(milliseconds * 1.66667e-05);
    milliseconds -= minutes * 60000;
    seconds = int(milliseconds * 0.001);
    milliseconds -= seconds * 1000;
    hourtext = undefined;
    if (hours < 10) {
        hourtext = "00" + hours;
    } else if (hours < 100) {
        hourtext = "0" + hours;
    } else {
        hourtext = "" + hours;
    }
    minutetext = ter_op(minutes < 10, "0" + minutes, "" + minutes);
    secondtext = ter_op(seconds < 10, "0" + seconds, "" + seconds);
    mstext = undefined;
    if (milliseconds < 10) {
        mstext = "00" + milliseconds;
    } else if (milliseconds < 100) {
        mstext = "0" + milliseconds;
    } else {
        mstext = "" + milliseconds;
    }
    return hourtext + ":" + minutetext + ":" + secondtext + ":" + mstext;
}

// Namespace print / scripts\mp\utility\print
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9a7
// Size: 0x54
function datalogprint(message, tag) {
    if (!analyticsstreamerislogfilestreamingenabled()) {
        return;
    }
    text = "";
    if (isdefined(tag)) {
        text += "<" + tag + "> ";
    }
    text += message + "\n";
    analyticsstreamerlogfilewritetobuffer(text);
}

