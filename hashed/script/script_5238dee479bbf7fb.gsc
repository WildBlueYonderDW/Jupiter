// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\utility\lower_message.gsc;

#namespace namespace_1a2fa2b6ae5d223c;

// Namespace namespace_1a2fa2b6ae5d223c/namespace_981ad73f8047222f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b
// Size: 0xa1
function setupcirclepeek() {
    if (istrue(level.br_circle_disabled) || istrue(level.br_level.staticcircle) || istrue(level.var_cb9a9bfbbc8b8a0f)) {
        return;
    }
    /#
        assertex(!isdefined(level.circlepeeks), "setupCirclePeek called too many times. Circle Peeks are already set up.");
    #/
    level.circlepeeks = [];
    level.teamswithcirclepeek = [];
    for (index = 1; index < level.br_level.br_circleradii.size; index++) {
        function_587a4ae46d3a9611(index);
    }
    level thread function_27d74f1cf559ca7b();
}

// Namespace namespace_1a2fa2b6ae5d223c/namespace_981ad73f8047222f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f3
// Size: 0xb1
function function_126f8eca2fa7d72() {
    foreach (var_582e2e465a7917ee in level.circlepeeks) {
        foreach (var_cbc7b6c43788bdbd in var_582e2e465a7917ee.var_b0f4bf8621b96c0a) {
            var_cbc7b6c43788bdbd function_af5604ce591768e1();
        }
    }
    level.circlepeeks = undefined;
}

// Namespace namespace_1a2fa2b6ae5d223c/namespace_981ad73f8047222f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab
// Size: 0x12d
function function_587a4ae46d3a9611(circleindex) {
    if (!isdefined(level.circlepeeks)) {
        return;
    }
    level.circlepeeks[circleindex] = spawnstruct();
    level.circlepeeks[circleindex].var_b0f4bf8621b96c0a = [];
    circleradius = level.br_level.br_circleradii[circleindex];
    multicirclecount = namespace_bbc79db4c3949a5c::function_d987886bb9de9137();
    if (multicirclecount > 1) {
        var_ed09715e306a1455 = level.br_multi_circle;
        if (circleindex < level.br_multi_circle.var_8a10c39962f6d9fd || circleindex >= level.br_multi_circle.var_c22567ed8cfe3761) {
            multicirclecount = 1;
        }
        for (i = 0; i < multicirclecount; i++) {
            circleorigin = var_ed09715e306a1455.circles[i].var_8ae269616d09dfc5[circleindex];
            function_ec0ff24840e615d5(circleindex, circleorigin, circleradius);
        }
    } else {
        circleorigin = level.br_level.br_circlecenters[circleindex];
        function_ec0ff24840e615d5(circleindex, circleorigin, circleradius);
    }
}

// Namespace namespace_1a2fa2b6ae5d223c/namespace_981ad73f8047222f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df
// Size: 0x8d
function function_ec0ff24840e615d5(circleindex, circleorigin, circleradius) {
    if (!isdefined(level.circlepeeks[circleindex])) {
        return;
    }
    var_cbc7b6c43788bdbd = spawnstruct();
    var_cbc7b6c43788bdbd function_6b6b6273f8180522("PeekCircle_Br", circleorigin, circleradius);
    var_cbc7b6c43788bdbd function_4eaf685bc40a3b9();
    size = level.circlepeeks[circleindex].var_b0f4bf8621b96c0a.size;
    level.circlepeeks[circleindex].var_b0f4bf8621b96c0a[size] = var_cbc7b6c43788bdbd;
}

// Namespace namespace_1a2fa2b6ae5d223c/namespace_981ad73f8047222f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x473
// Size: 0x112
function function_27d74f1cf559ca7b() {
    self endon("game_ended");
    level endon("CirclePeekCleanup");
    while (1) {
        level waittill("br_circle_set");
        foreach (var_cbc7b6c43788bdbd in level.circlepeeks[level.br_circle.circleindex + 1].var_b0f4bf8621b96c0a) {
            var_cbc7b6c43788bdbd function_af5604ce591768e1();
        }
        foreach (team in getarraykeys(level.teamswithcirclepeek)) {
            level.teamswithcirclepeek[team]--;
            if (level.teamswithcirclepeek[team] < 0) {
                level.teamswithcirclepeek[team] = 0;
            }
        }
    }
}

// Namespace namespace_1a2fa2b6ae5d223c/namespace_981ad73f8047222f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0x2e3
function function_647a8c40104e4866(team) {
    if (istrue(level.br_circle_disabled)) {
        return;
    }
    if (!isdefined(level.teamswithcirclepeek[team])) {
        level.teamswithcirclepeek[team] = 0;
    }
    var_f33d844d70bc5292 = -1;
    if (level.teamswithcirclepeek[team] == 0) {
        var_be2eea72dfa2c196 = getdvarint(@"hash_a8b73338df20273", 15);
        if (var_be2eea72dfa2c196 >= namespace_c5622898120e827f::function_abbfb4d18d1a9ca7()) {
            level.teamswithcirclepeek[team]++;
            var_f33d844d70bc5292 = level.teamswithcirclepeek[team] + level.br_circle.circleindex + 1;
        }
    }
    level.teamswithcirclepeek[team]++;
    index = level.teamswithcirclepeek[team] + level.br_circle.circleindex + 1;
    if (!isdefined(level.circlepeeks[index])) {
        foreach (player in getteamdata(team, "players")) {
            if (var_f33d844d70bc5292 != -1 && isdefined(level.circlepeeks[var_f33d844d70bc5292])) {
                foreach (var_cbc7b6c43788bdbd in level.circlepeeks[var_f33d844d70bc5292].var_b0f4bf8621b96c0a) {
                    var_cbc7b6c43788bdbd function_cfd53c8f6878014f(player);
                }
            }
            player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("circle_peek_limit", undefined, 5);
        }
        return;
    }
    foreach (player in getteamdata(team, "players")) {
        foreach (var_cbc7b6c43788bdbd in level.circlepeeks[index].var_b0f4bf8621b96c0a) {
            var_cbc7b6c43788bdbd function_cfd53c8f6878014f(player);
        }
        if (var_f33d844d70bc5292 != -1) {
            foreach (var_cbc7b6c43788bdbd in level.circlepeeks[var_f33d844d70bc5292].var_b0f4bf8621b96c0a) {
                var_cbc7b6c43788bdbd function_cfd53c8f6878014f(player);
            }
        }
    }
}

// Namespace namespace_1a2fa2b6ae5d223c/namespace_981ad73f8047222f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x876
// Size: 0x186
function function_b8022b0e5e976f66(oldteam, newteam) {
    if (istrue(level.br_circle_disabled)) {
        return;
    }
    if (!isdefined(level.teamswithcirclepeek[oldteam])) {
        level.teamswithcirclepeek[oldteam] = 0;
    }
    if (!isdefined(level.teamswithcirclepeek[newteam])) {
        level.teamswithcirclepeek[newteam] = 0;
    }
    if (level.teamswithcirclepeek[oldteam] > level.teamswithcirclepeek[newteam]) {
        level.teamswithcirclepeek[newteam] = level.teamswithcirclepeek[oldteam];
    }
    index = level.teamswithcirclepeek[newteam] + level.br_circle.circleindex + 1;
    if (!isdefined(level.circlepeeks[index])) {
        return;
    }
    foreach (player in getteamdata(newteam, "players")) {
        foreach (var_cbc7b6c43788bdbd in level.circlepeeks[index].var_b0f4bf8621b96c0a) {
            var_cbc7b6c43788bdbd function_cfd53c8f6878014f(player);
        }
    }
}

