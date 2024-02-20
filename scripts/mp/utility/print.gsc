// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace print;

// Namespace print/namespace_68747ec28caa9f9e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc3
// Size: 0x7c
function printonteam(var_3b3911dbb789b1d, team) {
    foreach (player in level.players) {
        if (player.team != team) {
            continue;
        }
        player iprintln(var_3b3911dbb789b1d);
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x146
// Size: 0x92
function printboldonteam(text, team) {
    /#
        assert(isdefined(level.players));
    #/
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
            player iprintlnbold(text);
        }
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1df
// Size: 0x9b
function printboldonteamarg(text, team, arg) {
    /#
        assert(isdefined(level.players));
    #/
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
            player iprintlnbold(text, arg);
        }
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0x9b
function printonteamarg(text, team, arg) {
    /#
        assert(isdefined(level.players));
    #/
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
            player iprintln(text, arg);
        }
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x323
// Size: 0x8d
function printonplayers(text, team) {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        if (isdefined(team)) {
            if (isdefined(players[i].pers["team"]) && players[i].pers["team"] == team) {
                players[i] iprintln(text);
            }
        } else {
            players[i] iprintln(text);
        }
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b7
// Size: 0x22e
function printandsoundoneveryone(team, otherteam, printfriendly, printenemy, soundfriendly, soundenemy, printarg) {
    shoulddosounds = isdefined(soundfriendly);
    shoulddoenemysounds = 0;
    if (isdefined(soundenemy)) {
        /#
            assert(shoulddosounds);
        #/
        shoulddoenemysounds = 1;
    }
    if (level.splitscreen || !shoulddosounds) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            playerteam = player.team;
            if (isdefined(playerteam) && isdefined(printarg)) {
                if (playerteam == team && isdefined(printfriendly)) {
                    player iprintln(printfriendly, printarg);
                } else if (playerteam == otherteam && isdefined(printenemy)) {
                    player iprintln(printenemy, printarg);
                }
            }
        }
        if (shoulddosounds) {
            /#
                assert(level.splitscreen);
            #/
            level.players[0] playlocalsound(soundfriendly);
        }
    } else {
        /#
            assert(shoulddosounds);
        #/
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
                    } else if (playerteam == otherteam) {
                        if (isdefined(printenemy)) {
                            player iprintln(printenemy, printarg);
                        }
                        player playlocalsound(soundenemy);
                    }
                }
            }
        } else {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                playerteam = player.team;
                if (isdefined(playerteam)) {
                    if (playerteam == team) {
                        if (isdefined(printfriendly)) {
                            player iprintln(printfriendly, printarg);
                        }
                        player playlocalsound(soundfriendly);
                    } else if (playerteam == otherteam) {
                        if (isdefined(printenemy)) {
                            player iprintln(printenemy, printarg);
                        }
                    }
                }
            }
        }
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5ec
// Size: 0x86
function printandsoundonteam(team, var_3b3911dbb789b1d, soundalias) {
    foreach (player in level.players) {
        if (player.team != team) {
            continue;
        }
        player printandsoundonplayer(var_3b3911dbb789b1d, soundalias);
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x679
// Size: 0x24
function printandsoundonplayer(var_3b3911dbb789b1d, soundalias) {
    self iprintln(var_3b3911dbb789b1d);
    self playlocalsound(soundalias);
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a4
// Size: 0xa9
function printgameaction(msg, player) {
    if (getdvarint(@"hash_dd6678cdc48d6adf", 0) == 1) {
        return;
    }
    var_4ff53c0f1206c71d = "";
    if (isdefined(player)) {
        if (isplayer(player)) {
            var_4ff53c0f1206c71d = "[" + player getentitynumber() + ":" + player.name + "] ";
        } else {
            var_4ff53c0f1206c71d = "[" + player getentitynumber() + "]";
        }
    }
    /#
        println("<unknown string>" + var_4ff53c0f1206c71d + msg + "<unknown string>" + gettime() + "<unknown string>");
    #/
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x754
// Size: 0x87
function teamhudtutorialmessage(msg, team, time) {
    if (!getteamdata(team, "teamCount")) {
        return;
    }
    foreach (player in getteamdata(team, "players")) {
        player thread tutorialprint(msg, time);
    }
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2
// Size: 0x45
function tutorialprint(msg, time, var_b64fb86f3b6ecb4b) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(var_b64fb86f3b6ecb4b)) {
        var_b64fb86f3b6ecb4b = 1;
    }
    self sethudtutorialmessage(msg, var_b64fb86f3b6ecb4b);
    wait(time);
    self clearhudtutorialmessage();
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82e
// Size: 0x171
function getformattedtimestamp(var_5020b0f5e510abb3) {
    if (isdefined(var_5020b0f5e510abb3)) {
        milliseconds = var_5020b0f5e510abb3;
    } else {
        milliseconds = gettime();
    }
    hours = int(milliseconds * 2.77778e-07);
    milliseconds = milliseconds - hours * 3600000;
    minutes = int(milliseconds * 1.66667e-05);
    milliseconds = milliseconds - minutes * 60000;
    seconds = int(milliseconds * 0.001);
    milliseconds = milliseconds - seconds * 1000;
    var_6053dcee5c49332c = undefined;
    if (hours < 10) {
        var_6053dcee5c49332c = "00" + hours;
    } else if (hours < 100) {
        var_6053dcee5c49332c = "0" + hours;
    } else {
        var_6053dcee5c49332c = "" + hours;
    }
    var_ba1d3b06acd32166 = ter_op(minutes < 10, "0" + minutes, "" + minutes);
    var_5580595a2aa92d9a = ter_op(seconds < 10, "0" + seconds, "" + seconds);
    var_ba25552e1955513e = undefined;
    if (milliseconds < 10) {
        var_ba25552e1955513e = "00" + milliseconds;
    } else if (milliseconds < 100) {
        var_ba25552e1955513e = "0" + milliseconds;
    } else {
        var_ba25552e1955513e = "" + milliseconds;
    }
    return var_6053dcee5c49332c + ":" + var_ba1d3b06acd32166 + ":" + var_5580595a2aa92d9a + ":" + var_ba25552e1955513e;
}

// Namespace print/namespace_68747ec28caa9f9e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9a7
// Size: 0x55
function datalogprint(message, tag) {
    if (!analyticsstreamerislogfilestreamingenabled()) {
        return;
    }
    text = "";
    if (isdefined(tag)) {
        text = text + "<" + tag + "> ";
    }
    text = text + message + "
";
    analyticsstreamerlogfilewritetobuffer(text);
}

