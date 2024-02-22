// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_13b6108ed675735e;

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72d
// Size: 0x294
function function_209b4f3cbe639411() {
    if (getdvarint(@"hash_ff65c25889692db8", 0) == 1) {
        return;
    }
    if (getdvarint(@"hash_9c43b60485fbd92e", 0) == 1) {
        if (!istrue(level.var_72e1667d06ab98db)) {
            level thread function_362c40666180cacc();
        }
        return;
    }
    level.var_b0a252247b4d921c = 1;
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_ab0f4e43e75a740d);
    level.var_4ca71df7c9f87195 = getdvarint(@"hash_b4dd40c7e16f3a0d", 1);
    level.var_6032d9d6e714a2a3 = getdvarint(@"hash_4788d52ad8b0d95b", 3);
    level.var_9474fd9f170eb8bb = getdvarint(@"hash_bc48245cbef08083", 10);
    level.var_8bb73eb201b171e2 = getdvarint(@"hash_966200778cf1b8aa", 0);
    level.var_400484d15c2cfd6b = getdvarint(@"hash_1e69ef33b46f5773", 400);
    level.var_ef3308c96486e0a9 = getdvarint(@"hash_403f394c8232fdb1", 0);
    level.var_2d08577efb11dacb = getdvarint(@"hash_b6a86be8437bb573", 5);
    level.var_e97fd1b659d67f4f = getdvarint(@"hash_f5a76c762ab2ad27", -1);
    level.var_74e71ad99c620255 = [];
    level.var_fd915e8bd20b6d09 = &function_93e3fe0e5693889b;
    foreach (team in level.teamnamelist) {
        level.requiredplayercount[team] = 0;
    }
    level.prematchperiod = getdvarint(@"hash_c653d32c30815d2b", 60);
    var_ba9a385288d1a919 = getanimlength(script_model%iw9_mp_dmz_infil_player1_cam);
    level.matchcountdowntime = var_ba9a385288d1a919 + level.var_2d08577efb11dacb;
    level.prematchperiodend = var_ba9a385288d1a919 + level.var_2d08577efb11dacb;
    level.var_7df8a2d09a6044a2 = getanimlength(script_model%iw9_mp_dmz_infil_player1_intro);
    level.var_7df8a2d09a6044a2 = level.var_7df8a2d09a6044a2 + getanimlength(script_model%iw9_mp_dmz_infil_player1_exit);
    level.var_7df8a2d09a6044a2 = level.var_7df8a2d09a6044a2 + level.var_2d08577efb11dacb;
    thread namespace_d576b6dc7cef9c62::matchstarttimer("match_starting_in", level.prematchperiod + level.prematchperiodend);
    /#
        if (getdvarint(@"hash_617f9fc340dd3ac6", 0) == 1) {
            level thread function_9360ab8d73d433f8();
        }
    #/
    function_354e8d20fb63725d();
    level thread function_ef34013df19c0ee3();
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c8
// Size: 0x29
function function_ab0f4e43e75a740d(channel, val) {
    if (channel == "ui_dmz_mission_overlay") {
        self.var_9de396b15a642de3 = 1;
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f8
// Size: 0x1f
function function_362c40666180cacc() {
    level.var_466a09c79541fc26 = 1;
    level waittill("match_start_real_countdown");
    level thread function_7114995a34df9681();
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1e
// Size: 0xe6
function function_9360ab8d73d433f8() {
    wait(10);
    foreach (point in level.startpoints) {
        level thread function_336d34d696729f31(point.origin);
        if (isdefined(point.target)) {
            ent = getstruct(point.target, "targetname");
            level thread function_336d34d696729f31(ent.origin);
            if (isdefined(ent.target)) {
                ent = getstruct(ent.target, "targetname");
                level thread function_336d34d696729f31(ent.origin);
            }
        }
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0b
// Size: 0x52
function function_336d34d696729f31(pos) {
    color = (randomfloat(1), randomfloat(1), randomfloat(1));
    interval = 1;
    while (1) {
        level thread namespace_d028276791d9cff6::drawsphere(pos, 32, interval, color);
        wait(interval);
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb64
// Size: 0x260
function function_93e3fe0e5693889b() {
    var_a95b157b75c7b989 = getdvarint(@"hash_753d5d5f25ef4ef3", 1) == 1;
    if (!isdefined(level.var_d2a500c04f275698)) {
        level.var_d2a500c04f275698 = gettime();
    }
    if (!isdefined(level.var_d5464d9d1aa6dcff)) {
        level.var_d5464d9d1aa6dcff = gettime();
    } else {
        level.var_7e910037d1fd046a = gettime();
    }
    var_19cc131bc3772e16 = 0;
    var_71b179643f3088fe = function_425d34ddd114f3de();
    if (level.players.size < var_71b179643f3088fe) {
        level.var_d2a500c04f275698 = gettime();
        return 0;
    }
    if (gettime() - level.var_d2a500c04f275698 < level.var_400484d15c2cfd6b) {
        return 0;
    }
    if (level.players.size > 0) {
        var_19cc131bc3772e16 = 1;
        foreach (team in level.teamnamelist) {
            players = getteamdata(team, "players");
            foreach (player in players) {
                if (var_a95b157b75c7b989 && !player ispredictedstreamposready()) {
                    var_19cc131bc3772e16 = 0;
                    break;
                }
                if (!istrue(player.pers["streamSyncComplete"]) || player.model == "") {
                    if (!istrue(player.pers["streamSyncComplete"])) {
                        if (!isdefined(player.var_560490e2dbf6bffd)) {
                            player.var_560490e2dbf6bffd = gettime();
                        } else {
                            player.var_d8ef71a0ac335d44 = gettime();
                        }
                    }
                    if (player.model == "") {
                        if (!isdefined(player.var_b1641227c0a9ffcd)) {
                            player.var_b1641227c0a9ffcd = gettime();
                        } else {
                            player.var_85a6b126d7750a54 = gettime();
                        }
                    }
                    var_19cc131bc3772e16 = 0;
                    break;
                }
            }
            if (!var_19cc131bc3772e16) {
                break;
            }
        }
    }
    return var_19cc131bc3772e16;
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0x21e
function function_ef34013df19c0ee3() {
    level waittill("match_start_real_countdown");
    level thread function_7114995a34df9681();
    /#
        if (isdefined(level.var_d5464d9d1aa6dcff)) {
            logstring("mp_dmz_hydro" + level.var_d5464d9d1aa6dcff);
        }
        if (isdefined(level.var_7e910037d1fd046a)) {
            logstring("script_model" + level.var_7e910037d1fd046a);
        }
    #/
    foreach (teamname in level.teamnamelist) {
        teamcount = getteamdata(teamname, "teamCount");
        if (teamcount) {
            level thread function_c9001909b0e28b18(teamname, "dmz_infil_");
        }
    }
    /#
        while (1) {
            if (getdvarint(@"hash_7c2b5166dae9ac87", 0) == 1) {
                foreach (teamname in level.teamswithplayers) {
                    function_c9001909b0e28b18(teamname, "<unknown string>");
                }
                setdvar(@"hash_7c2b5166dae9ac87", 0);
            }
            if (getdvarint(@"hash_5265d7653ffa2075", 0) == 1) {
                level thread function_6d198a62f4efe4a7();
                setdvar(@"hash_5265d7653ffa2075", 0);
            }
            if (getdvarint(@"hash_36d8fafa1638eac", 0) == 1) {
                level thread function_843789f93292c6b7();
                setdvar(@"hash_36d8fafa1638eac", 0);
            }
            if (getdvarint(@"hash_449f5bb718a70589", 0) != 0) {
                level thread function_97a8d8477d7b7d01(getdvarint(@"hash_449f5bb718a70589", 0));
                setdvar(@"hash_449f5bb718a70589", 0);
            }
            if (getdvarint(@"hash_59ece44a02195133", 0) == 1) {
                level.var_4dec411f05d13caa = 1;
                setdvar(@"hash_59ece44a02195133", 0);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff1
// Size: 0x5a
function function_7114995a34df9681() {
    level notify("dmzInfil_start");
    setomnvar("ui_in_infil", 1);
    wait(level.prematchperiodend - 4);
    setomnvar("ui_in_infil", 2);
    level notify("dmzInfil_countdownStart");
    level waittill("prematch_done");
    setomnvar("ui_in_infil", -1);
    level notify("dmzInfil_start");
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1052
// Size: 0x1c7
function function_ef949b68ad626c8e() {
    timer = 0;
    if (level.var_8bb73eb201b171e2) {
        maxplayers = getdvarint(@"hash_818c699a5caaee4f", 0);
        while (level.players.size < maxplayers) {
            timer = timer + level.framedurationseconds;
            if (timer > level.var_9474fd9f170eb8bb) {
                return timer;
            }
            waitframe();
        }
    }
    if (level.var_6032d9d6e714a2a3 > 0) {
        foreach (team in level.teamnamelist) {
            if (getteamdata(team, "teamCount")) {
                var_19cc131bc3772e16 = 0;
                players = getteamdata(team, "players");
                while (players.size < level.var_6032d9d6e714a2a3 || !var_19cc131bc3772e16) {
                    timer = timer + level.framedurationseconds;
                    if (players.size >= level.var_6032d9d6e714a2a3) {
                        var_19cc131bc3772e16 = 1;
                        foreach (player in players) {
                            if (!istrue(player.pers["streamSyncComplete"]) || player.model == "") {
                                var_19cc131bc3772e16 = 0;
                            }
                        }
                    }
                    if (timer > level.var_9474fd9f170eb8bb) {
                        return timer;
                    }
                    waitframe();
                    players = getteamdata(team, "players");
                }
            }
        }
    }
    return timer;
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1221
// Size: 0x432
function function_354e8d20fb63725d() {
    level.scr_anim["dmzExfil_player0"]["dmz_infil_proto_a"] = script_model%iw9_mp_infil_proto_a_guy_a;
    level.scr_eventanim["dmzExfil_player0"]["dmz_infil_proto_a"] = getanimname(script_model%iw9_mp_infil_proto_a_guy_a);
    level.scr_anim["dmzExfil_player1"]["dmz_infil_proto_a"] = script_model%iw9_mp_infil_proto_a_guy_b;
    level.scr_eventanim["dmzExfil_player1"]["dmz_infil_proto_a"] = getanimname(script_model%iw9_mp_infil_proto_a_guy_b);
    level.scr_anim["dmzExfil_player2"]["dmz_infil_proto_a"] = script_model%iw9_mp_infil_proto_a_guy_c;
    level.scr_eventanim["dmzExfil_player2"]["dmz_infil_proto_a"] = getanimname(script_model%iw9_mp_infil_proto_a_guy_c);
    level.scr_anim["dmzExfil_player0"]["dmz_infil_intro"] = script_model%iw9_mp_dmz_infil_player1_intro;
    level.scr_eventanim["dmzExfil_player0"]["dmz_infil_intro"] = getanimname(script_model%iw9_mp_dmz_infil_player1_intro);
    level.scr_anim["dmzExfil_player0"]["dmz_infil_idle"] = script_model%iw9_mp_dmz_infil_player1_idle;
    level.scr_eventanim["dmzExfil_player0"]["dmz_infil_idle"] = getanimname(script_model%iw9_mp_dmz_infil_player1_idle);
    level.scr_anim["dmzExfil_player0"]["dmz_infil_exit"] = script_model%iw9_mp_dmz_infil_player1_exit;
    level.scr_eventanim["dmzExfil_player0"]["dmz_infil_exit"] = getanimname(script_model%iw9_mp_dmz_infil_player1_exit);
    level.scr_anim["dmzExfil_player1"]["dmz_infil_intro"] = script_model%iw9_mp_dmz_infil_player2_intro;
    level.scr_eventanim["dmzExfil_player1"]["dmz_infil_intro"] = getanimname(script_model%iw9_mp_dmz_infil_player2_intro);
    level.scr_anim["dmzExfil_player1"]["dmz_infil_idle"] = script_model%iw9_mp_dmz_infil_player2_idle;
    level.scr_eventanim["dmzExfil_player1"]["dmz_infil_idle"] = getanimname(script_model%iw9_mp_dmz_infil_player2_idle);
    level.scr_anim["dmzExfil_player1"]["dmz_infil_exit"] = script_model%iw9_mp_dmz_infil_player2_exit;
    level.scr_eventanim["dmzExfil_player1"]["dmz_infil_exit"] = getanimname(script_model%iw9_mp_dmz_infil_player2_exit);
    level.scr_anim["dmzExfil_player2"]["dmz_infil_intro"] = script_model%iw9_mp_dmz_infil_player3_intro;
    level.scr_eventanim["dmzExfil_player2"]["dmz_infil_intro"] = getanimname(script_model%iw9_mp_dmz_infil_player3_intro);
    level.scr_anim["dmzExfil_player2"]["dmz_infil_idle"] = script_model%iw9_mp_dmz_infil_player3_idle;
    level.scr_eventanim["dmzExfil_player2"]["dmz_infil_idle"] = getanimname(script_model%iw9_mp_dmz_infil_player3_idle);
    level.scr_anim["dmzExfil_player2"]["dmz_infil_exit"] = script_model%iw9_mp_dmz_infil_player3_exit;
    level.scr_eventanim["dmzExfil_player2"]["dmz_infil_exit"] = getanimname(script_model%iw9_mp_dmz_infil_player3_exit);
    if (getdvarint(@"hash_947a9b74fcbd8126", 1) == 1) {
        level.scr_anim["dmzExfil_cam"]["dmz_infil_"] = script_model%iw9_mp_dmz_infil_player1_cam;
        level.scr_anim["dmzExfil_cam"]["dmz_infil_1"] = script_model%iw9_mp_dmz_infil_player1_cam;
        level.scr_anim["dmzExfil_cam"]["dmz_infil_2"] = script_model%iw9_mp_dmz_infil_player2_cam;
        level.scr_anim["dmzExfil_cam"]["dmz_infil_3"] = script_model%iw9_mp_dmz_infil_player3_cam;
        level.scr_anim["dmzExfil_cam"]["dmz_infil_low"] = script_model%iw9_mp_dmz_infil_player1_lowcam_test;
    } else if (getdvarint(@"hash_d38ab35efdb1a60d", 1) == 1) {
        level.scr_anim["dmzExfil_cam"]["dmz_infil_proto_a"] = script_model%iw9_mp_infil_proto_a_guy_cam_alt;
    } else {
        level.scr_anim["dmzExfil_cam"]["dmz_infil_proto_a"] = script_model%iw9_mp_infil_proto_a_guy_cam;
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165a
// Size: 0x63
function function_e5f3a754c68ef261(pos, angles) {
    cameraent = spawn("script_model", pos);
    if (isdefined(angles)) {
        cameraent.angles = angles;
    }
    cameraent setmodel("tag_origin");
    cameraent.animname = "dmzExfil_cam";
    cameraent useanimtree(%script_model);
    return cameraent;
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c5
// Size: 0x5fb
function function_c9001909b0e28b18(teamname, var_e26f44acad48ddd1, var_cfc2ca5ebfa83db2) {
    if (level.mapname == "mp_dmz_hydro") {
        setglobalsoundcontext("wind", "heavy", 0.05);
    }
    players = getteamdata(teamname, "players");
    spawnpoint = ter_op(isdefined(var_cfc2ca5ebfa83db2), var_cfc2ca5ebfa83db2, level.teamdata[teamname]["startPoint"]);
    foreach (player in players) {
        if (isdefined(player.var_b1641227c0a9ffcd)) {
            logstring("Player " + player.name + " Model Load Time Start: " + player.var_b1641227c0a9ffcd);
        }
        if (isdefined(player.var_85a6b126d7750a54)) {
            logstring("Player " + player.name + " Model Load Time End: " + player.var_85a6b126d7750a54);
        }
        if (isdefined(player.var_560490e2dbf6bffd)) {
            logstring("Player " + player.name + " Stream Sync Time Start: " + player.var_560490e2dbf6bffd);
        }
        if (isdefined(player.var_d8ef71a0ac335d44)) {
            logstring("Player " + player.name + " Stream Sync Time End: " + player.var_d8ef71a0ac335d44);
        }
        logstring("Player " + player.name + " Infil Started: " + gettime());
    }
    if (getdvarint(@"hash_696cc1e380833ac0", 0) == 1) {
        players = array_randomize(players);
    }
    /#
        assertex(players.size <= 3, "Team sizes greater than 4 are not supported by DMZ infils.");
    #/
    /#
        assertex(players.size > 0, "Infil attempted on a team with no players.");
    #/
    players = getteamdata(teamname, "players");
    if (players.size < 1) {
        return;
    }
    level.var_466a09c79541fc26 = 1;
    if (isdefined(level.var_796ae5bb031f323d)) {
        spawnpoint = players[0] [[ level.var_796ae5bb031f323d ]]();
    }
    var_daf67907b493b764 = function_e5f3a754c68ef261(spawnpoint.origin, spawnpoint.angles);
    animstruct = function_236f4cbf385b007f(players[0], var_daf67907b493b764, undefined, spawnpoint);
    var_bbf920aff68a45f0 = animstruct;
    if (isdefined(players[0]) && players[0].model != "") {
        players[0] namespace_bc4a4b9456315863::anim_first_frame_solo(animstruct.cam, var_e26f44acad48ddd1, "tag_origin");
    }
    animlength = getanimlength(level.scr_anim[animstruct.cam.animname][var_e26f44acad48ddd1]);
    teamsize = min(players.size, 3);
    if (players.size > 3) {
        for (i = int(teamsize); i < players.size; i++) {
            players[i] _freezecontrols(0);
            players[i] _freezelookcontrols(0);
        }
    }
    for (i = 0; i < teamsize; i++) {
        if (!isdefined(players[i]) || players[i].model == "") {
            continue;
        }
        var_9f18e73f8f2216f5 = undefined;
        players[i].var_1cd92a64c5b20fa0 = "dmzExfil_player" + i;
        if (isdefined(spawnpoint) && isdefined(spawnpoint.target)) {
            structs = getstructarray(spawnpoint.target, "targetname");
            foreach (struct in structs) {
                if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "infil_camera") {
                    var_9f18e73f8f2216f5 = struct;
                }
            }
        }
        if (i > 0) {
            if (isdefined(spawnpoint) && isdefined(spawnpoint.target)) {
                structs = getstructarray(spawnpoint.target, "targetname");
                foreach (struct in structs) {
                    if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "infil_camera") {
                        var_9f18e73f8f2216f5 = struct;
                    } else {
                        spawnpoint = struct;
                    }
                }
            } else {
                spawnpoint = undefined;
            }
            if (isdefined(level.var_796ae5bb031f323d)) {
                spawnpoint = players[i] [[ level.var_796ae5bb031f323d ]]();
            }
            if (level.var_4ca71df7c9f87195 == 1) {
                var_daf67907b493b764 = function_e5f3a754c68ef261(players[i].origin);
                animstruct = function_236f4cbf385b007f(players[i], var_daf67907b493b764, var_bbf920aff68a45f0, spawnpoint, var_e26f44acad48ddd1);
                if (isdefined(players[i]) && players[i].model != "") {
                    players[i] namespace_bc4a4b9456315863::anim_first_frame_solo(animstruct.cam, var_e26f44acad48ddd1 + i + 1, "tag_origin");
                }
            } else {
                animstruct = function_236f4cbf385b007f(players[i], var_daf67907b493b764, var_bbf920aff68a45f0, spawnpoint, var_e26f44acad48ddd1);
            }
        }
        players[i] thread function_67ad64ccfb9082a8(animstruct, var_e26f44acad48ddd1, var_9f18e73f8f2216f5);
    }
    if (level.var_4ca71df7c9f87195 == 0) {
        players[0] thread namespace_bc4a4b9456315863::anim_single_solo(animstruct.cam, var_e26f44acad48ddd1, "tag_origin");
    }
    level thread function_1e328368618d72da(teamname);
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc7
// Size: 0x34a
function function_236f4cbf385b007f(player, cam, var_acf69b6c3fbfe7b0, spawnpoint, var_e26f44acad48ddd1) {
    startpoint = undefined;
    if (level.var_ef3308c96486e0a9 == 1 && isdefined(level.var_74e71ad99c620255[player.team])) {
        startpoint = level.var_74e71ad99c620255[player.team];
    } else if (isdefined(spawnpoint)) {
        startpoint = spawnpoint;
    } else {
        startpoint = level.teamdata[player.team]["startPoint"];
    }
    /#
        assertex(isdefined(startpoint), "StartPoint for the team is undefined.");
    #/
    animstruct = spawnstruct();
    animstruct.origin = player_drop_to_ground(startpoint.origin, 32, undefined, undefined, (0, 0, 1));
    animstruct.angles = startpoint.angles;
    animstruct.cam = cam;
    if (isdefined(startpoint.script_parameters)) {
        animstruct.script_parameters = startpoint.script_parameters;
    }
    if (isdefined(var_acf69b6c3fbfe7b0)) {
        var_e68cf76e0696ca00 = getoriginforanimtime(var_acf69b6c3fbfe7b0.origin, var_acf69b6c3fbfe7b0.angles, level.scr_anim[player.var_1cd92a64c5b20fa0][var_e26f44acad48ddd1 + "intro"], 1);
        var_689a1188271a0be5 = player_drop_to_ground(var_e68cf76e0696ca00, 32, undefined, undefined, (0, 0, 1));
        targetpos = var_acf69b6c3fbfe7b0.origin;
        if (isdefined(spawnpoint)) {
            var_e68cf76e0696ca00 = getoriginforanimtime(spawnpoint.origin, spawnpoint.angles, level.scr_anim[player.var_1cd92a64c5b20fa0][var_e26f44acad48ddd1 + "intro"], 1);
            var_689a1188271a0be5 = player_drop_to_ground(spawnpoint.origin, 32, undefined, undefined, (0, 0, 1));
            targetpos = spawnpoint.origin + spawnpoint.origin - var_e68cf76e0696ca00;
        }
        var_32149f41ab89b731 = var_acf69b6c3fbfe7b0.origin[2];
        if (isdefined(spawnpoint)) {
            var_32149f41ab89b731 = spawnpoint.origin[2];
        }
        animstruct.origin = (targetpos[0], targetpos[1], var_32149f41ab89b731 + var_689a1188271a0be5[2] - var_e68cf76e0696ca00[2]);
        animstruct.angles = var_acf69b6c3fbfe7b0.angles;
        animstruct.campos = spawnstruct();
        animstruct.campos.origin = var_689a1188271a0be5;
        animstruct.campos.angles = animstruct.angles;
    } else {
        animstruct.campos = spawnstruct();
        animstruct.campos.origin = animstruct.origin;
        animstruct.campos.angles = animstruct.angles;
    }
    return animstruct;
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2019
// Size: 0x63
function function_1e328368618d72da(team) {
    wait(2);
    if (namespace_d696adde758cbe79::function_a7f9424636f37fb1()) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("match_intro_generic", team);
    } else {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("match_intro", team);
    }
    wait(15);
    if (!istrue(level.var_644a33d86d8514bf)) {
        namespace_d696adde758cbe79::showdmzsplash("dmz_contract_reminder", getteamdata(team, "players"));
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2083
// Size: 0x189
function function_706eaf553cdb684(var_5940f376a254619d, path, time) {
    starttime = gettime();
    totaldist = 0;
    for (i = path.size - 1; i > 0; i--) {
        path[i].dist = distance(path[i].origin, path[i - 1].origin);
        totaldist = totaldist + path[i].dist;
    }
    var_969e785c4e00a1d1 = 0;
    var_976824f5544dc282 = 0;
    for (i = path.size - 1; i > 0; i--) {
        var_e4419d3414abdd13 = path[i].dist / totaldist;
        var_969e785c4e00a1d1 = var_976824f5544dc282;
        var_976824f5544dc282 = var_976824f5544dc282 + var_e4419d3414abdd13;
        var_77b3f0514a25c019 = (gettime() - starttime) / 1000 / time;
        while (var_77b3f0514a25c019 < var_976824f5544dc282) {
            var_77b3f0514a25c019 = (gettime() - starttime) / 1000 / time;
            var_774e0f07388b5aab = (var_77b3f0514a25c019 - var_969e785c4e00a1d1) / var_e4419d3414abdd13;
            var_5940f376a254619d.angles = anglelerpquatfrac(path[i].angles, path[i - 1].angles, var_774e0f07388b5aab);
            var_5940f376a254619d.origin = vectorlerp(path[i].origin, path[i - 1].origin, var_774e0f07388b5aab);
            waitframe();
        }
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2213
// Size: 0x393
function function_67ad64ccfb9082a8(animstruct, var_e26f44acad48ddd1, var_9f18e73f8f2216f5) {
    /#
        assertex(isdefined(animstruct), "DMZ INFIL ANIMSTRUCT UNDEFINED!");
    #/
    self notify("dmz_playInfil");
    self endon("disconnect");
    thread function_4a22eef220bff896();
    thread namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    thread namespace_7624a117b05021c5::infil_player_rig_updated(self.var_1cd92a64c5b20fa0, self.origin, self.angles);
    self cameraunlink();
    animstruct namespace_bc4a4b9456315863::anim_first_frame_solo(self.player_rig, var_e26f44acad48ddd1 + "intro");
    self cameralinkto(animstruct.cam, "tag_origin", 1, 1);
    self setclientdvar(@"hash_df1dc712c4a91588", 40);
    if (isdefined(var_9f18e73f8f2216f5) && getdvarint(@"hash_5bda28fa688a245c", 0) == 1) {
        var_51434ce2f3ac3cff = [0:var_9f18e73f8f2216f5];
        var_c80eaeac6487d3b9 = var_9f18e73f8f2216f5;
        while (isdefined(var_c80eaeac6487d3b9.target)) {
            var_c80eaeac6487d3b9 = getstruct(var_c80eaeac6487d3b9.target, "targetname");
            var_51434ce2f3ac3cff[var_51434ce2f3ac3cff.size] = var_c80eaeac6487d3b9;
        }
        animstruct thread function_706eaf553cdb684(animstruct.cam, var_51434ce2f3ac3cff, getanimlength(script_model%iw9_mp_dmz_infil_player1_intro));
    } else if (level.var_4ca71df7c9f87195 == 1) {
        var_4752910cfaba108a = var_e26f44acad48ddd1;
        if (isdefined(animstruct.script_parameters)) {
            var_4752910cfaba108a = animstruct.script_parameters;
        }
        animstruct.campos thread namespace_bc4a4b9456315863::anim_single_solo(animstruct.cam, var_4752910cfaba108a);
    }
    self attach("offhand2h_wm_tablet_dmz", "tag_accessory_left");
    animstruct thread anim_player_solo(self, self.player_rig, var_e26f44acad48ddd1 + "intro");
    self playlocalsound("dmz_camera_zoom_in");
    var_ac1ea7394a9a1a08 = getanimlength(script_model%iw9_mp_dmz_infil_player1_intro);
    wait(var_ac1ea7394a9a1a08 - 1.8);
    if (isdefined(self.hidehudenabled)) {
        utility::hidehuddisable();
    }
    if (getdvarint(@"hash_8da4a5e690432cd0", 1) == 1) {
        thread function_dff9480861b2acb1();
        _freezecontrols(0, 1);
    }
    wait(1.8);
    if (level.var_e97fd1b659d67f4f == -1) {
        thread function_e31ab6a7ebef3680();
    } else {
        thread function_80959dd6d2c10831(level.var_e97fd1b659d67f4f);
    }
    self clearadditionalstreampos();
    function_2b14c4dbf6ebd391(animstruct, var_e26f44acad48ddd1, 1);
    animstruct thread anim_player_solo(self, self.player_rig, var_e26f44acad48ddd1 + "exit");
    if (getdvarint(@"hash_e985d309e4bf9569", 0) == 1) {
        thread function_f43a907c9b43b440(animstruct.cam);
    } else {
        thread function_f687b7ea0da59a4c(animstruct);
    }
    var_539a64d23aa56d91 = getanimlength(script_model%iw9_mp_dmz_infil_player1_exit);
    wait(var_539a64d23aa56d91);
    attachsize = self getattachsize();
    for (i = 0; i < attachsize; i++) {
        attached = self getattachmodelname(i);
        if (attached == "offhand2h_wm_tablet_dmz") {
            self detach("offhand2h_wm_tablet_dmz", "tag_accessory_left");
        }
    }
    if (getdvarint(@"hash_8da4a5e690432cd0", 1) == 0) {
        _freezecontrols(0);
    }
    _freezelookcontrols(0);
    if (level.var_4ca71df7c9f87195 == 1) {
        animstruct.cam delete();
    }
    self notify("dmzInfil_complete");
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ad
// Size: 0x57
function function_4a22eef220bff896() {
    self endon("disconnect");
    waittill_any_timeout_1(30, "dmzInfil_complete");
    wait(5);
    if (self getclientomnvar("ui_world_fade") > 0) {
        namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0.5);
    }
    if (self getclientomnvar("ui_total_fade") > 0) {
        namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.5);
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x260b
// Size: 0x2e
function function_e31ab6a7ebef3680() {
    self endon("death_or_disconnect");
    self endon("dmzInfil_stopIdle");
    level waittill("prematch_done");
    self setclientomnvar("ui_dmz_mission_overlay", 0);
    self notify("dmzInfil_stopIdle");
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2640
// Size: 0x31
function function_80959dd6d2c10831(maxtime) {
    self endon("death_or_disconnect");
    self endon("dmzInfil_stopIdle");
    wait(maxtime);
    self setclientomnvar("ui_dmz_mission_overlay", 0);
    self notify("dmzInfil_stopIdle");
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2678
// Size: 0x4f
function function_2b14c4dbf6ebd391(animstruct, var_e26f44acad48ddd1, var_906a882502dd814a) {
    self endon("death_or_disconnect");
    self endon("dmzInfil_stopIdle");
    thread function_c5693aee7d75230a(animstruct, var_e26f44acad48ddd1);
    wait(var_906a882502dd814a);
    while (!istrue(self.var_9de396b15a642de3)) {
        waitframe();
    }
    self notify("dmzInfil_stopIdle");
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ce
// Size: 0xbd
function function_c5693aee7d75230a(animstruct, var_e26f44acad48ddd1) {
    self endon("death_or_disconnect");
    self endon("dmzInfil_stopIdle");
    animlength = getanimlength(level.scr_anim[self.player_rig.animname][var_e26f44acad48ddd1 + "idle"]);
    if (animlength < 0.1) {
        return;
    } else {
        while (1) {
            if (!isdefined(self) || !isdefined(self.player_rig) || !isreallyalive(self) || !isdefined(animstruct)) {
                /#
                    println("<unknown string>");
                #/
                return;
            }
            animstruct thread anim_player_solo(self, self.player_rig, var_e26f44acad48ddd1 + "idle");
            wait(animlength);
        }
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2792
// Size: 0x11
function function_dff9480861b2acb1() {
    self setclientomnvar("ui_dmz_mission_overlay", 1);
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27aa
// Size: 0xcb
function function_301d27fda3ec6b41(teamname) {
    timer = 0;
    players = getteamdata(teamname, "players");
    while (1) {
        timer = timer + level.framedurationseconds;
        var_19cc131bc3772e16 = 1;
        foreach (player in players) {
            if (!istrue(player.pers["streamSyncComplete"]) || player.model == "") {
                var_19cc131bc3772e16 = 0;
            }
        }
        if (var_19cc131bc3772e16) {
            return;
        }
        waitframe();
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x287c
// Size: 0x2b
function function_f58b70c3d35c2f5() {
    _freezecontrols(1);
    _freezelookcontrols(1);
    while (self.model == "") {
        waitframe();
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ae
// Size: 0xbf
function function_f687b7ea0da59a4c(animstruct) {
    self endon("disconnect");
    namespace_36f464722d326bbe::function_852712268d005332(self, 1, 0.5);
    self lerpfovbypreset("default");
    self cameraunlink();
    if (isreallyalive(self)) {
        if (isdefined(self.player_rig)) {
            self.player_rig namespace_7624a117b05021c5::handleweaponstatenotetrack("drop");
        }
        wait(0.2);
        if (!isdefined(self)) {
            return;
        }
        if (isdefined(self.player_rig)) {
            self.player_rig namespace_7624a117b05021c5::handleweaponstatenotetrack("raise");
        }
    }
    self setplayerangles(animstruct.angles);
    self notify("remove_rig");
    self notify("screen_completely_black");
    namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0.5);
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2974
// Size: 0xa7
function function_f43a907c9b43b440(cam) {
    var_64177b5a8b8adba4 = function_e5f3a754c68ef261(cam.origin, cam.angles);
    targetpos = self geteye();
    targetangles = self.angles;
    self cameralinkto(var_64177b5a8b8adba4, "tag_origin", 1, 1);
    var_64177b5a8b8adba4 moveto(targetpos, 1);
    var_64177b5a8b8adba4 rotateto(targetangles, 1, 0.5);
    wait(1);
    self lerpfovbypreset("default");
    self cameraunlink();
    self notify("remove_rig");
    var_64177b5a8b8adba4 delete();
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a22
// Size: 0x3a
function function_c8556d47c98bb0ec(teamname, node) {
    level.var_ef3308c96486e0a9 = 1;
    level.var_74e71ad99c620255[teamname] = node;
    function_c9001909b0e28b18(teamname, "dmz_infil_", node);
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a63
// Size: 0x1ea
function function_6d198a62f4efe4a7() {
    if (!isdefined(level.playerteams)) {
        level.playerteams = [];
        foreach (player in level.players) {
            if (array_contains(level.playerteams, player.team)) {
                continue;
            }
            level.playerteams[level.playerteams.size] = player.team;
        }
    }
    level.var_4dec411f05d13caa = 0;
    player = level.players[0];
    level.var_9a816ff63217244a = array_combine(level.startpoints[0].points, level.startpoints[1].points);
    for (i = 0; i < level.var_9a816ff63217244a.size; i++) {
        offset = 0;
        foreach (team in level.playerteams) {
            index = i + offset;
            if (index > level.var_9a816ff63217244a.size) {
                index = index - level.var_9a816ff63217244a.size;
            }
            function_c8556d47c98bb0ec(team, level.var_9a816ff63217244a[index]);
            offset = offset + 1;
        }
        var_937491868c5da50f = level.var_7df8a2d09a6044a2;
        if (istrue(level.var_4dec411f05d13caa)) {
            return;
        }
        wait(var_937491868c5da50f);
        if (istrue(level.var_4dec411f05d13caa)) {
            return;
        }
    }
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c54
// Size: 0x54
function function_97a8d8477d7b7d01(index) {
    player = level.players[0];
    level.var_4dec411f05d13caa = 1;
    function_c8556d47c98bb0ec(player.team, level.startpoints.points[index]);
}

// Namespace namespace_13b6108ed675735e/namespace_3a88b1955556fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2caf
// Size: 0x162
function function_843789f93292c6b7() {
    player = level.players[0];
    level.var_4dec411f05d13caa = 1;
    closestdist = distancesquared(level.startpoints[0].points[0].origin, player.origin);
    targetnode = level.startpoints[0].points[0];
    foreach (var_9bf46f9d9e9f78f4 in level.startpoints) {
        foreach (point in var_9bf46f9d9e9f78f4.points) {
            dist = distancesquared(point.origin, player.origin);
            if (closestdist > dist) {
                targetnode = point;
            }
        }
    }
    function_c8556d47c98bb0ec(player.team, targetnode);
}

