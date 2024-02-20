// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_7ab5b649fa408138;
#using script_3314add7998ab13;
#using script_1174abedbefe9ada;

#namespace namespace_4d654b0182b207d5;

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x751
// Size: 0x37
function private function_7e508409c4935112(music) {
    musicstate = function_17ee301cf0b5ba85(music);
    if (musicstate == "" && music != "") {
        musicstate = music;
    }
    return musicstate;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790
// Size: 0x2d
function function_9941dad3d3d51468(var_6b9a0dbbf039dece) {
    var_cbfb00f6fdb0afba = undefined;
    if (!isdefined(var_6b9a0dbbf039dece)) {
        return;
    }
    if (var_6b9a0dbbf039dece == 1) {
        var_cbfb00f6fdb0afba = "_classic";
    }
    return var_cbfb00f6fdb0afba;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0xa1
function function_caeaf68ab0e87565(players, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    /#
        assertex(isarray(players), "dmz_playMusicForPlayers: players was not an array!");
    #/
    /#
        assertex(isstring(music), "dmz_playMusicForPlayers: music was not a string!");
    #/
    delaytime = function_53c4c53197386572(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    var_cbfb00f6fdb0afba = function_7e508409c4935112(var_6b9a0dbbf039dece);
    level delaythread(delaytime, &namespace_e688cd9db0404268::function_fe75a89529dd0fd0, players, musicstate, undefined, undefined, var_cbfb00f6fdb0afba);
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86d
// Size: 0xa0
function function_c1fd3441ccfba6f8(teamname, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    /#
        assertex(isstring(music), "dmz_playMusicForTeam: music was not a string!");
    #/
    /#
        assertex(isstring(teamname), "dmz_playMusicForTeam: teamName was not a string!");
    #/
    delaytime = function_53c4c53197386572(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    var_cbfb00f6fdb0afba = function_7e508409c4935112(var_6b9a0dbbf039dece);
    level delaythread(delaytime, &namespace_e688cd9db0404268::function_46979d2fd81a6d4b, teamname, musicstate, undefined, var_cbfb00f6fdb0afba);
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x914
// Size: 0x76
function function_9b8077b5cd6f43b1(teams, music) {
    /#
        assertex(isarray(teams), "dmz_playMusicForTeams: teams was not an array!");
    #/
    foreach (team in teams) {
        function_c1fd3441ccfba6f8(music, team);
    }
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x991
// Size: 0xb5
function function_202ae29f54b67993(teamname, var_6e077719c0efcb61, radius, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    /#
        assertex(isnumber(radius), "dmz_playMusicForTeamPlayersInRadius: radius was not a number!");
    #/
    /#
        assertex(isstring(music), "dmz_playMusicForTeamPlayersInRadius: music was not a string!");
    #/
    /#
        assertex(isstring(teamname), "dmz_playMusicForTeamPlayersInRadius: teamName was not a string!");
    #/
    delaytime = function_53c4c53197386572(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    level delaythread(delaytime, &namespace_e688cd9db0404268::function_fdd0934f1a32f70d, var_6e077719c0efcb61, radius, musicstate, teamname, var_6b9a0dbbf039dece);
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4d
// Size: 0x14f
function function_4231b99c9d0e1875(var_45a0ffa62aa6bfa8, players, music, delay, var_6b9a0dbbf039dece) {
    /#
        assertex(isent(var_45a0ffa62aa6bfa8) || isstruct(var_45a0ffa62aa6bfa8), "dmz_playTrackedMusicForPlayers: unexpected music target");
    #/
    /#
        assertex(isarray(var_45a0ffa62aa6bfa8.var_85e53e70c7110da), "dmz_playTrackedMusicForPlayers: unexpected musicPlayers");
    #/
    /#
        assertex(isarray(players), "dmz_playTrackedMusicForPlayers: unexpected players");
    #/
    players = array_remove_array(players, var_45a0ffa62aa6bfa8.var_85e53e70c7110da);
    if (isarray(players) && players.size > 0) {
        var_cbfb00f6fdb0afba = undefined;
        if (isdefined(var_6b9a0dbbf039dece)) {
            var_cbfb00f6fdb0afba = music + function_9941dad3d3d51468(var_6b9a0dbbf039dece);
        }
        function_caeaf68ab0e87565(players, music, delay, var_cbfb00f6fdb0afba);
        foreach (player in players) {
            if (isplayer(player)) {
                playerentnum = player getentitynumber();
                var_45a0ffa62aa6bfa8.var_85e53e70c7110da[playerentnum] = player;
                player.var_ac30570114234210 = 1;
            }
        }
    }
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba3
// Size: 0x10d
function function_30f2d27959ca7507(var_45a0ffa62aa6bfa8, players, music, delay) {
    /#
        assertex(isent(var_45a0ffa62aa6bfa8) || isstruct(var_45a0ffa62aa6bfa8), "dmz_stopTrackedMusicForPlayers: unexpected music target");
    #/
    /#
        assertex(isarray(var_45a0ffa62aa6bfa8.var_85e53e70c7110da), "dmz_stopTrackedMusicForPlayers: unexpected musicPlayers");
    #/
    /#
        assertex(isarray(players), "dmz_stopTrackedMusicForPlayers: unexpected players");
    #/
    if (isarray(players) && players.size > 0) {
        function_caeaf68ab0e87565(players, music, delay);
        foreach (player in players) {
            if (isplayer(player)) {
                playerentnum = player getentitynumber();
                var_45a0ffa62aa6bfa8.var_85e53e70c7110da[playerentnum] = undefined;
                player.var_ac30570114234210 = undefined;
            }
        }
    }
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb7
// Size: 0x9c
function function_889b71cbcb02d4e1(var_45a0ffa62aa6bfa8, var_6e077719c0efcb61, radius, team, music, delay, var_6b9a0dbbf039dece) {
    /#
        assertex(isent(var_45a0ffa62aa6bfa8) || isstruct(var_45a0ffa62aa6bfa8), "dmz_playTrackedMusicForPlayersTeamInRadius: unexpected music target");
    #/
    /#
        assertex(isarray(var_45a0ffa62aa6bfa8.var_85e53e70c7110da), "dmz_playTrackedMusicForPlayersTeamInRadius: unexpected musicPlayers");
    #/
    players = function_d6fe092bc83da45b(var_6e077719c0efcb61, radius, team);
    function_4231b99c9d0e1875(var_45a0ffa62aa6bfa8, players, music, delay, var_6b9a0dbbf039dece);
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5a
// Size: 0x128
function function_ae73dbedf54b701f(players, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    /#
        assertex(isstring(music), "dmz_tryPlayBossApproachMusicForPlayers: music was not a string!");
    #/
    delaytime = function_53c4c53197386572(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    var_330af766290f5bfa = [];
    foreach (player in players) {
        if (isplayer(player)) {
            var_e499790b0786eb88 = istrue(player.var_ac30570114234210) || istrue(player.var_2441210fe6eea080);
            if (!var_e499790b0786eb88) {
                var_330af766290f5bfa = array_add(var_330af766290f5bfa, player);
            }
        }
    }
    var_cbfb00f6fdb0afba = undefined;
    if (isdefined(var_6b9a0dbbf039dece)) {
        var_cbfb00f6fdb0afba = music + function_9941dad3d3d51468(var_6b9a0dbbf039dece);
    }
    function_caeaf68ab0e87565(var_330af766290f5bfa, music, delaytime, var_cbfb00f6fdb0afba);
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xe89
// Size: 0x8d
function function_5c07a5046a6dc0f4(team_name, var_6e077719c0efcb61, radius, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    /#
        assertex(isnumber(radius), "dmz_tryPlayBossApproachMusicForTeamPlayers: radius was not a number!");
    #/
    /#
        assertex(isstring(team_name), "dmz_tryPlayBossApproachMusicForTeamPlayers: team_name was not a string!");
    #/
    players = function_d6fe092bc83da45b(var_6e077719c0efcb61, radius, team_name);
    function_ae73dbedf54b701f(players, music, delaytime, var_6b9a0dbbf039dece);
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1d
// Size: 0x7d
function function_12bb57e8dd07e939(array) {
    newarray = [];
    foreach (member in array) {
        var_b30b086ebfeb7f53 = isreallyalive(member);
        if (!var_b30b086ebfeb7f53) {
            continue;
        }
        newarray[newarray.size] = member;
    }
    return newarray;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa2
// Size: 0x5f
function function_38d3ca2b80804e24(players, origin, radius, team) {
    var_878914b0358bc7b5 = function_d6fe092bc83da45b(origin, radius, team);
    var_49d97c7342a0b24c = array_difference(players, var_878914b0358bc7b5);
    var_fa817b3e1d246130 = function_12bb57e8dd07e939(var_49d97c7342a0b24c);
    return var_fa817b3e1d246130;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1009
// Size: 0x32
function function_ba92e3ab3234f345(players) {
    var_fa817b3e1d246130 = function_12bb57e8dd07e939(players);
    var_20900957e6d2013f = array_difference(players, var_fa817b3e1d246130);
    return var_20900957e6d2013f;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1043
// Size: 0x87
function function_882459b3aa239c4(players, origin, radius, team) {
    var_878914b0358bc7b5 = function_d6fe092bc83da45b(origin, radius, team);
    var_49d97c7342a0b24c = array_difference(players, var_878914b0358bc7b5);
    var_fa817b3e1d246130 = function_12bb57e8dd07e939(var_878914b0358bc7b5);
    var_20900957e6d2013f = array_difference(var_878914b0358bc7b5, var_fa817b3e1d246130);
    var_c071b5d1b8fa53fd = array_combine(var_49d97c7342a0b24c, var_20900957e6d2013f);
    return var_c071b5d1b8fa53fd;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d2
// Size: 0x188
function function_62ca322dde3ab783(agent, var_e52f572dfadb149f, var_e23b09de2e27ed9) {
    var_e52f572dfadb149f = function_53c4c53197386572(var_e52f572dfadb149f, 12000);
    var_e23b09de2e27ed9 = function_53c4c53197386572(var_e23b09de2e27ed9, 30000);
    if (!isdefined(agent)) {
        return undefined;
    }
    state = undefined;
    if (isnumber(agent.health) && agent.health <= 0) {
        state = "dead";
        return state;
    }
    var_82d990c965650a23 = function_53c4c53197386572(agent.lastenemysighttime, 0);
    if (isarray(agent.attackerdata)) {
        foreach (attackerdata in agent.attackerdata) {
            if (isnumber(attackerdata.lasttimedamaged) && attackerdata.lasttimedamaged > var_82d990c965650a23) {
                var_82d990c965650a23 = attackerdata.lasttimedamaged;
            }
        }
    }
    if (var_82d990c965650a23 == 0) {
        state = "idle";
    } else {
        now = gettime();
        var_50a2b6968424656c = now - var_82d990c965650a23;
        if (var_50a2b6968424656c >= var_e23b09de2e27ed9) {
            state = "idle";
        } else if (var_50a2b6968424656c >= var_e52f572dfadb149f) {
            state = "alert";
        } else if (var_50a2b6968424656c < var_e52f572dfadb149f) {
            state = "combat";
        }
    }
    return state;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1262
// Size: 0x135
function function_cadc473b3a7d171c(vehicle, var_e52f572dfadb149f, var_e23b09de2e27ed9) {
    var_e52f572dfadb149f = function_53c4c53197386572(var_e52f572dfadb149f, 12000);
    var_e23b09de2e27ed9 = function_53c4c53197386572(var_e23b09de2e27ed9, 30000);
    state = undefined;
    if (isdefined(vehicle) && isstring(vehicle.currentstate)) {
        state = vehicle.currentstate;
    }
    if (!isdefined(vehicle.var_8a2a32e2464a95db)) {
        vehicle.var_8a2a32e2464a95db = 0;
    }
    if (isstring(state) && (state == "attack" || state == "combat")) {
        vehicle.var_8a2a32e2464a95db = gettime();
    }
    if (isnumber(vehicle.var_8a2a32e2464a95db)) {
        if (vehicle.var_8a2a32e2464a95db == 0) {
            state = "idle";
        } else {
            now = gettime();
            var_779cc6bbba56fa06 = now - vehicle.var_8a2a32e2464a95db;
            if (var_779cc6bbba56fa06 >= var_e23b09de2e27ed9) {
                state = "idle";
            } else if (var_779cc6bbba56fa06 >= var_e52f572dfadb149f) {
                state = "alert";
            } else if (var_779cc6bbba56fa06 < var_e52f572dfadb149f) {
                state = "combat";
            }
        }
    }
    return state;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139f
// Size: 0x86
function function_2d29365e60139df1(ent, var_e52f572dfadb149f, var_e23b09de2e27ed9) {
    state = "???";
    if (isdefined(ent) && isstring(ent.classname)) {
        if (isagent(ent)) {
            state = function_62ca322dde3ab783(ent, var_e52f572dfadb149f, var_e23b09de2e27ed9);
        } else if (ent.classname == "script_vehicle") {
            state = function_cadc473b3a7d171c(ent);
        }
    }
    if (!isdefined(state)) {
        state = "???";
    }
    return state;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142d
// Size: 0xf9
function function_2351f113d5579540(ent) {
    enemy = undefined;
    if (isdefined(ent) && isstring(ent.classname)) {
        if (isagent(ent)) {
            enemy = ent.enemy;
        } else if (ent.classname == "script_vehicle") {
            if (isstring(ent.vehiclename) && ent.vehiclename == "dmz_boss_chopper" && issharedfuncdefined("dmz_bosses_chopper", "chopper_getCurrentTargetPlayer")) {
                enemy = level [[ getsharedfunc("dmz_bosses_chopper", "chopper_getCurrentTargetPlayer") ]](ent);
            } else if (isstring(ent.vehiclename) && ent.vehiclename == "pac_sentry") {
                enemy = ent.var_c6dfdd9743149226;
            } else {
                enemy = ent.enemy;
            }
        }
    }
    return enemy;
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x152e
// Size: 0x427
function function_b5be3a44077aec21(var_566868292ee2a1b, var_985ae874212b863e, var_e52f572dfadb149f, var_e23b09de2e27ed9, var_6b9a0dbbf039dece) {
    level endon("game_ended");
    var_566868292ee2a1b notify("stop_boss_ai_music_thread");
    var_566868292ee2a1b endon("stop_boss_ai_music_thread");
    /#
        assertex(isnumber(level.var_b1149892b2595056), "dmz_runBossAIMusicStateThread: unexpected level.bossMusicPlayDistance");
    #/
    /#
        assertex(isnumber(level.var_7b10b08ddb3f610f), "dmz_runBossAIMusicStateThread: unexpected level.bossMusicEvadeDistance");
    #/
    /#
        assertex(isstruct(var_566868292ee2a1b), "dmz_runBossAIMusicStateThread: unexpected bossInstance");
    #/
    /#
        assertex(isarray(var_985ae874212b863e), "dmz_runBossAIMusicStateThread: unexpected musicStateArray");
    #/
    if (!isarray(var_566868292ee2a1b.var_85e53e70c7110da)) {
        var_566868292ee2a1b.var_85e53e70c7110da = [];
    }
    var_566868292ee2a1b.var_56524c0776d62d8c = var_e52f572dfadb149f;
    var_566868292ee2a1b.var_1910de7604c2d4a0 = var_e23b09de2e27ed9;
    state = "idle";
    enemy = undefined;
    var_acd9b4729d23197 = "idle";
    var_5da6e5da7bd60520 = undefined;
    killer = undefined;
    var_cbfb00f6fdb0afba = undefined;
    while (!istrue(var_566868292ee2a1b.killed)) {
        boss = function_53c4c53197386572(var_566868292ee2a1b.boss, var_566868292ee2a1b.agent);
        state = function_2d29365e60139df1(boss, var_e52f572dfadb149f, var_e23b09de2e27ed9);
        enemy = function_2351f113d5579540(boss);
        var_276addad006d7d88 = isstring(state) && state != var_acd9b4729d23197;
        var_d5f4a3adcdda8a85 = isdefined(enemy) && isdefined(var_5da6e5da7bd60520) && enemy != var_5da6e5da7bd60520 || isdefined(enemy) && !isdefined(var_5da6e5da7bd60520);
        /#
            assertex(isarray(var_566868292ee2a1b.var_85e53e70c7110da), "dmz_runBossAIMusicStateThread: unexpected musicPlayers");
        #/
        if (var_276addad006d7d88 || var_d5f4a3adcdda8a85) {
            if (state == "dead") {
                break;
            }
            var_1d509f7271d9be18 = var_985ae874212b863e[state];
            if (isarray(var_1d509f7271d9be18) && isstring(var_1d509f7271d9be18[0])) {
                music = var_1d509f7271d9be18[0];
                delay = var_1d509f7271d9be18[1];
                var_9df00c73e6741337 = isplayer(enemy) && !array_contains(var_566868292ee2a1b.var_85e53e70c7110da, enemy);
                if (state == "combat" && var_9df00c73e6741337) {
                    function_889b71cbcb02d4e1(var_566868292ee2a1b, enemy, level.var_b1149892b2595056, enemy.team, music, delay, var_6b9a0dbbf039dece);
                } else if (state == "idle" && var_566868292ee2a1b.var_85e53e70c7110da.size > 0) {
                    function_30f2d27959ca7507(var_566868292ee2a1b, var_566868292ee2a1b.var_85e53e70c7110da, music, delay);
                }
            }
        }
        if (var_566868292ee2a1b.var_85e53e70c7110da.size > 0) {
            var_1d509f7271d9be18 = var_985ae874212b863e["idle"];
            var_749ad895ea80d046 = isent(boss) && isvector(boss.origin);
            var_bb7805258a1f947d = undefined;
            if (istrue(var_749ad895ea80d046)) {
                var_bb7805258a1f947d = function_38d3ca2b80804e24(var_566868292ee2a1b.var_85e53e70c7110da, boss.origin, level.var_7b10b08ddb3f610f);
            }
            if (isarray(var_bb7805258a1f947d) && var_bb7805258a1f947d.size > 0 && isarray(var_1d509f7271d9be18) && isstring(var_1d509f7271d9be18[0])) {
                music = var_1d509f7271d9be18[0];
                delay = var_1d509f7271d9be18[1];
                function_30f2d27959ca7507(var_566868292ee2a1b, var_bb7805258a1f947d, music, delay);
            }
            var_20900957e6d2013f = function_ba92e3ab3234f345(var_566868292ee2a1b.var_85e53e70c7110da);
            if (isarray(var_20900957e6d2013f) && var_20900957e6d2013f.size > 0) {
                music = "dmz_activity_lose";
                delay = 0;
                function_30f2d27959ca7507(var_566868292ee2a1b, var_20900957e6d2013f, music, delay);
            }
        }
        var_acd9b4729d23197 = state;
        var_5da6e5da7bd60520 = enemy;
        var_d8e566314371b23 = randomintrange(1, 5);
        waittime = var_d8e566314371b23 * 0.05;
        if (isent(boss)) {
            boss waittill_any_timeout_1(waittime, "death");
        } else {
            wait(waittime);
        }
    }
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x195c
// Size: 0x105
function function_73f954808739f7bc(var_566868292ee2a1b, killer, var_f5d18545cc5b0616, var_1ccbc0e90fcc38ca, var_75aa8f7260caaaf2, var_d4222fe9c4d26866) {
    /#
        assertex(isstruct(var_566868292ee2a1b), "dmz_SetDeathBossAIMusicState: unexpected bossInstance");
    #/
    /#
        assertex(isent(killer), "dmz_SetDeathBossAIMusicState: unexpected killer");
    #/
    var_566868292ee2a1b notify("stop_boss_ai_music_thread");
    if (isarray(var_566868292ee2a1b.var_85e53e70c7110da) && var_566868292ee2a1b.var_85e53e70c7110da.size > 0) {
        var_d10123541bce9c64 = level.var_b1149892b2595056 * 2;
        var_a0585bc229dcd714 = function_d6fe092bc83da45b(killer, var_d10123541bce9c64, killer.team);
        function_30f2d27959ca7507(var_566868292ee2a1b, var_a0585bc229dcd714, var_f5d18545cc5b0616, var_1ccbc0e90fcc38ca);
        if (isdefined(var_75aa8f7260caaaf2)) {
            var_75aa8f7260caaaf2 = function_53c4c53197386572(var_75aa8f7260caaaf2, "dmz_activity_lose");
            var_d4222fe9c4d26866 = function_53c4c53197386572(var_d4222fe9c4d26866, 3);
            function_30f2d27959ca7507(var_566868292ee2a1b, var_566868292ee2a1b.var_85e53e70c7110da, var_75aa8f7260caaaf2, var_d4222fe9c4d26866);
        }
    }
}

// Namespace namespace_4d654b0182b207d5/namespace_b1b96b070bb1349c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a68
// Size: 0x9c
function function_2e4afbf3aeaf31e4(var_566868292ee2a1b, music, var_54307d62e05248f8) {
    /#
        assertex(isstruct(var_566868292ee2a1b), "dmz_SetDeathBossAIMusicState: unexpected bossInstance");
    #/
    var_566868292ee2a1b notify("stop_boss_ai_music_thread");
    if (isarray(var_566868292ee2a1b.var_85e53e70c7110da) && var_566868292ee2a1b.var_85e53e70c7110da.size > 0) {
        var_5efaa35d4e74ff73 = level.var_b1149892b2595056 * 2;
        players = function_d6fe092bc83da45b(var_566868292ee2a1b.boss, var_5efaa35d4e74ff73);
        function_30f2d27959ca7507(var_566868292ee2a1b, players, music, var_54307d62e05248f8);
    }
}

