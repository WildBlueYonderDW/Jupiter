// mwiii decomp prototype
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_23a295a7d3a949db;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_1070be3357c9454c;
#using script_163ad3ccb646c1fa;
#using scripts\mp\potg.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_6981400abfcd765c;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using script_548072087c9fd504;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_629a97c763e17711;
#using script_697b7ae06ba9b28c;
#using scripts\mp\gametypes\br_public.gsc;
#using script_6ad351ebd5a33280;
#using script_4cdabcd91a92977;
#using scripts\mp\class.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\load.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\infilexfil\infilexfil.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_451a1a9bd9613164;
#using scripts\mp\utility\player_frame_update_aggregator.gsc;
#using script_436add9de781cdfb;
#using script_15de7dc4d21f1da3;
#using scripts\cp_mp\ent_manager.gsc;
#using script_509d466932bca53e;
#using scripts\cp_mp\utility\team_utility.gsc;
#using script_76cc264b397db9cb;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6853191397ec0259;
#using script_65a96ea484cf876d;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\killcam.gsc;
#using scripts\mp\final_killcam.gsc;
#using script_cbb0697de4c5728;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\playercards.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\hud.gsc;
#using scripts\mp\serversettings.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\outline.gsc;
#using scripts\mp\shellshock.gsc;
#using scripts\mp\deathicons.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\lightarmor.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\brmatchdata.gsc;
#using scripts\mp\brclientmatchdata.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\clientmatchdata.gsc;
#using scripts\mp\awards.gsc;
#using scripts\mp\passives.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_4bac13d511590220;
#using scripts\cp_mp\killstreaks\init.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\archetypes\archcommon.gsc;
#using script_509a21c5f4cea6ae;
#using scripts\mp\whizby.gsc;
#using script_4192352a88553d67;
#using scripts\mp\analyticslog.gsc;
#using script_45f403e1732217d3;
#using script_180407b61054c278;
#using script_404f1aef8aea990;
#using script_7c40fa80892a721;
#using script_600b944a95c3a7bf;
#using scripts\mp\loot.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\callouts.gsc;
#using scripts\mp\bounty.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\gestures_mp.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\arbitrary_up.gsc;
#using script_6a522b6159eb03da;
#using scripts\mp\turret.gsc;
#using script_2b264b25c7da0b12;
#using scripts\mp\laststand.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\matchstats.gsc;
#using scripts\mp\playerstats.gsc;
#using script_6dea01cba2381958;
#using scripts\cp_mp\auto_ascender.gsc;
#using scripts\cp_mp\auto_ascender_solo.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\door.gsc;
#using scripts\mp\flashpoint.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_5f903436642211af;
#using scripts\mp\hud_message.gsc;
#using script_3fa1bf21e3fc7b80;
#using scripts\mp\accolades.gsc;
#using scripts\mp\ammorestock.gsc;
#using script_55e6a436b6b3048c;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\bots\bots_loadout.gsc;
#using script_60dd02bec5783ecd;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_285752b1f53ed9f1;
#using script_4a6760982b403bad;
#using script_7ab5b649fa408138;
#using script_108faf3dabbc3e99;
#using script_15eddb0fac236a22;
#using script_189b67b2735b981d;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\ui.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\scoreboard.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\print.gsc;

#namespace gamelogic;

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460c
// Size: 0x23f
function onforfeit(team) {
    if (isdefined(level.forfeitinprogress)) {
        return;
    }
    level endon("abort_forfeit");
    level thread forfeitwaitforabort();
    level.forfeitinprogress = 1;
    level.canprocessot = 0;
    if (!level.teambased && level.players.size > 1) {
        wait(10);
    } else {
        wait(1.05);
    }
    level.forfeit_aborted = 0;
    forfeit_delay = 20;
    matchforfeittimer(forfeit_delay);
    endreason = "";
    if (!isdefined(team)) {
        endreason = game["end_reason"]["players_forfeited"];
        winner = level.players[0];
    } else {
        if (team == "allies") {
            endreason = game["end_reason"]["spetsnaz_forfeited"];
        } else {
            endreason = game["end_reason"]["marines_forfeited"];
        }
        winner = team;
        if (istrue(level.var_ec2fb549b15ad827)) {
            var_faa1b667d8025c6d = ter_op(winner == "allies", "axis", "allies");
            game["roundsWon"][winner] = ter_op(isroundbased(), getscorelimit(), 1);
            game["roundsWon"][var_faa1b667d8025c6d] = 0;
            game["teamScores"][winner] = getscorelimit();
            game["teamScores"][var_faa1b667d8025c6d] = 0;
            setteamscore(winner, 1);
            setteamscore(var_faa1b667d8025c6d, 0);
        }
    }
    level.forcedend = 1;
    if (isdefined(winner)) {
        if (isplayer(winner)) {
            logstring("forfeit, win: " + winner getxuid() + "(" + winner.name + ")");
        } else {
            logstring("forfeit, win: " + winner);
            foreach (entry in level.teamnamelist) {
                logstring(entry + ":" + game["teamScores"][entry]);
            }
        }
    }
    thread endgame(winner, endreason);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4852
// Size: 0xba
function forfeitwaitforabort() {
    level endon("game_ended");
    if (getdvarfloat(@"hash_739bbd49f9779978") == 1) {
        level.disableforfeit = 1;
        level notify("abort_forfeit");
    } else {
        level waittill("abort_forfeit");
    }
    level.forfeit_aborted = 1;
    level.canprocessot = 1;
    foreach (p in level.players) {
        p setclientomnvar("ui_match_start_countdown", 0);
        p setclientomnvar("ui_match_in_progress", 1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4913
// Size: 0x119
function matchforfeittimer_internal(counttime) {
    waittillframeend();
    level endon("match_forfeit_timer_beginning");
    while (counttime > 0 && !level.gameended && !level.forfeit_aborted && !level.ingraceperiod) {
        foreach (p in level.players) {
            p setclientomnvar("ui_match_start_countdown", counttime);
            p setclientomnvar("ui_match_in_progress", 0);
        }
        counttime--;
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1);
    }
    foreach (p in level.players) {
        p setclientomnvar("ui_match_start_countdown", 0);
        p setclientomnvar("ui_match_in_progress", 1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a33
// Size: 0x3d
function matchforfeittimer(duration) {
    level notify("match_forfeit_timer_beginning");
    counttime = int(duration);
    setomnvar("ui_match_start_text", "opponent_forfeiting_in");
    matchforfeittimer_internal(counttime);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a77
// Size: 0x3be
function default_ondeadevent(team) {
    logstring("team eliminated: " + team);
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        foreach (player in getteamdata(team, "players")) {
            result = undefined;
            if (istrue(player namespace_3c5a4254f2b957ea::getpersstat("hasDoneAnyCombat")) || istrue(player namespace_3c5a4254f2b957ea::getpersstat("participation"))) {
                result = "eliminated";
            }
            player namespace_36f464722d326bbe::stopkeyearning(result);
        }
        function_eb1a045a6d299c6a();
        function_53f71c9dbfe19ce9(team);
    }
    if (team == "all") {
        logstring("tie");
        foreach (entry in level.teamnamelist) {
            logstring(entry + ": " + game["teamScores"][entry]);
        }
        if (level.teambased) {
            thread endgame("tie", game["end_reason"]["tie"]);
        } else {
            thread endgame(undefined, game["end_reason"]["tie"]);
        }
    } else {
        var_b0c33d224b825287 = getenemyteams(team);
        livescount = [];
        foreach (entry in var_b0c33d224b825287) {
            livescount[entry] = 0;
        }
        if (!istrue(level.disablespawning)) {
            foreach (entry in var_b0c33d224b825287) {
                foreach (player in getteamdata(entry, "players")) {
                    if (!istrue(player.hasspawned)) {
                        continue;
                    }
                    livescount[entry] = livescount[entry] + player namespace_3c5a4254f2b957ea::getpersstat("lives");
                }
            }
        }
        var_a9ceb9b39c78fb07 = [];
        foreach (entry in var_b0c33d224b825287) {
            alivecount = getteamdata(entry, "aliveCount");
            /#
                assert(alivecount >= 0);
            #/
            UIBotCount = 0;
            if (isdefined(level.var_7b37b2193f163b9b)) {
                UIBotCount = getteamdata(entry, "UIBotCount");
                /#
                    assert(UIBotCount >= 0);
                #/
            }
            if (alivecount > 0 || UIBotCount > 0 || livescount[entry]) {
                var_a9ceb9b39c78fb07[var_a9ceb9b39c78fb07.size] = entry;
            }
        }
        var_947925f5fc6939a3 = 1;
        if (isdefined(level.var_947925f5fc6939a3)) {
            var_947925f5fc6939a3 = [[ level.var_947925f5fc6939a3 ]]();
        }
        if (var_a9ceb9b39c78fb07.size == 1 && !namespace_d20f8ef223912e12::function_a587b0b0998c6d13() && var_947925f5fc6939a3) {
            thread endgame(var_a9ceb9b39c78fb07[0], game["end_reason"]["enemies_eliminated"], game["end_reason"]["br_eliminated"]);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3c
// Size: 0x8b
function default_ononeleftevent(team) {
    if (level.teambased) {
        /#
            assert(array_contains(level.teamnamelist, team));
        #/
        lastplayer = getlastlivingplayer(team);
        if (isdefined(lastplayer)) {
            lastplayer thread givelastonteamwarning();
        }
    } else {
        lastplayer = getlastlivingplayer();
        logstring("last one alive, win: " + lastplayer.name);
        thread endgame(lastplayer, game["end_reason"]["enemies_eliminated"]);
    }
    return 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ecf
// Size: 0x373
function roundend_checkscorelimit(team, var_6e5149ef941c9008) {
    checkteamscorelimitsoon(team);
    var_745e98aa8eb3eb8f = "score_limit_reached";
    if (isdefined(level.var_4817bac75a8b9eff)) {
        var_745e98aa8eb3eb8f = level.var_4817bac75a8b9eff;
    }
    if (istrue(var_6e5149ef941c9008)) {
        level notify("roundEnd_CheckScoreLimit");
        level endon("roundEnd_CheckScoreLimit");
        waitframe();
    }
    wingamebytype = getwingamebytype();
    if (inovertime() || intimetobeat()) {
        if (istimetobeatrulegametype()) {
            if (settimetobeat(team)) {
                foreach (player in level.players) {
                    player setclientomnvar("ui_friendly_time_to_beat", ter_op(player.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    player setclientomnvar("ui_enemy_time_to_beat", ter_op(player.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                }
                thread endgame(team, game["end_reason"][var_745e98aa8eb3eb8f]);
            }
        } else {
            if (isscoretobeatrulegametype()) {
                goto LOC_000001d7;
            }
            thread endgame(team, game["end_reason"][var_745e98aa8eb3eb8f]);
        LOC_000001d7:
        }
    LOC_000001d7:
    } else if (level.roundscorelimit > 0) {
        var_fd63d90025d110ed = [];
        if (getgametype() == "ballmode") {
            var_fd63d90025d110ed[0] = team;
        } else {
            foreach (entry in level.teamnamelist) {
                if (game["teamScores"][entry] >= level.roundscorelimit) {
                    var_fd63d90025d110ed[var_fd63d90025d110ed.size] = entry;
                }
            }
        }
        if (var_fd63d90025d110ed.size > 0) {
            if (var_fd63d90025d110ed.size > 1) {
                highestscore = 0;
                var_1ff67ba127220e2 = undefined;
                var_ca17acb9ea3fa61d = 0;
                foreach (entry in var_fd63d90025d110ed) {
                    teamscore = game["teamScores"][entry];
                    if (!isdefined(var_1ff67ba127220e2)) {
                        highestscore = teamscore;
                        var_1ff67ba127220e2 = entry;
                        var_ca17acb9ea3fa61d = 0;
                    } else if (teamscore > highestscore) {
                        highestscore = teamscore;
                        var_1ff67ba127220e2 = entry;
                        var_ca17acb9ea3fa61d = 0;
                    } else if (teamscore == highestscore) {
                        var_ca17acb9ea3fa61d = 1;
                    }
                }
                if (var_ca17acb9ea3fa61d) {
                    if (isdefined(level.onscorelimit)) {
                        [[ level.onscorelimit ]]("tie");
                    }
                    thread endgame("tie", game["end_reason"][var_745e98aa8eb3eb8f]);
                } else {
                    if (isdefined(level.onscorelimit)) {
                        [[ level.onscorelimit ]](var_1ff67ba127220e2);
                    }
                    thread endgame(var_1ff67ba127220e2, game["end_reason"][var_745e98aa8eb3eb8f]);
                }
            } else {
                if (isdefined(level.onscorelimit)) {
                    [[ level.onscorelimit ]](var_fd63d90025d110ed[0]);
                }
                thread endgame(var_fd63d90025d110ed[0], game["end_reason"][var_745e98aa8eb3eb8f]);
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5249
// Size: 0x161
function default_ontimelimit() {
    winner = "tie";
    if (level.teambased) {
        if (inovertime() || intimetobeat()) {
            if (isscoretobeatrulegametype()) {
                score = game["overtimeProgress"] + game["overtimeProgressFrac"];
                winner = setscoretobeat(game["attackers"], score * 60);
            } else if (istimetobeatvalid()) {
                winner = game["timeToBeatTeam"];
            }
        } else {
            winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
        }
        logstring("time limit, win: " + winner);
        foreach (entry in level.teamnamelist) {
            logstring(entry + ":" + game["teamScores"][entry]);
        }
    } else {
        winner = namespace_e8a49b70d0769b66::gethighestscoringplayer();
        if (namespace_e8a49b70d0769b66::ishighestscoringplayertied()) {
            winner = "tie";
        }
        if (isdefined(winner) && isplayer(winner)) {
            logstring("time limit, win: " + winner.name);
        } else {
            logstring("time limit, tie");
        }
    }
    thread endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53b1
// Size: 0x29
function default_onhalftime() {
    winner = undefined;
    thread endgame("halftime", game["end_reason"]["time_limit_reached"]);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53e1
// Size: 0x241
function forceend(reason) {
    if (level.hostforcedend || level.forcedend) {
        return;
    }
    namespace_e8a49b70d0769b66::updateplacement();
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            namespace_e8a49b70d0769b66::updatetotalteamscore(entry);
        }
    }
    winner = undefined;
    if (level.teambased) {
        winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
        logstring("host ended game, win: " + winner);
        foreach (entry in level.teamnamelist) {
            logstring(entry + ":" + game["teamScores"][entry]);
        }
    } else {
        winner = namespace_e8a49b70d0769b66::gethighestscoringplayer();
        if (isdefined(winner)) {
            logstring("host ended game, win: " + winner.name);
        } else {
            logstring("host ended game, tie");
        }
    }
    level.forcedend = 1;
    level.hostforcedend = 1;
    if (level.splitscreen) {
        endstring = game["end_reason"]["ended_game"];
    } else {
        endstring = game["end_reason"]["host_ended_game"];
    }
    if (isdefined(reason) && reason == 2) {
        if (level.teambased) {
            if (winner == "allies") {
                endreason = game["end_reason"]["spetsnaz_forfeited"];
            } else {
                endreason = game["end_reason"]["marines_forfeited"];
            }
        } else {
            endreason = game["end_reason"]["players_forfeited"];
        }
    } else if (istrue(level.var_ec2fb549b15ad827) && istrue(level.var_15c7d73680ea5496)) {
        winner = "tie";
        endstring = game["end_reason"]["lp_match_cancelled"];
    }
    level notify("force_end");
    thread endgame(winner, endstring);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5629
// Size: 0x1f4
function onscorelimit(var_6e5149ef941c9008) {
    var_a138e6484a996bda = game["end_reason"]["score_limit_reached"];
    winner = "tie";
    if (level.teambased) {
        winner = namespace_e8a49b70d0769b66::calculatewinningteam();
        if (winner == "none") {
            winner = "tie";
        }
        logstring("scorelimit, win: " + winner);
        foreach (entry in level.teamnamelist) {
            logstring(entry + ":" + game["teamScores"][entry]);
        }
    } else {
        winner = namespace_e8a49b70d0769b66::gethighestscoringplayer();
        if (istrue(var_6e5149ef941c9008) && namespace_e8a49b70d0769b66::ishighestscoringplayertied()) {
            winner = "tie";
        }
        if (isdefined(winner) && isplayer(winner)) {
            logstring("scorelimit, win: " + winner.name);
        } else {
            logstring("scorelimit, tie");
        }
        var_f3adc82c7b8b4249 = winner namespace_58a74e7d54b56e8d::calcstreakcost("nuke");
        if (getscorelimit() == var_f3adc82c7b8b4249 && winner.pers["cur_kill_streak"] == var_f3adc82c7b8b4249) {
            level.modescorewinner = winner;
            var_eb5f2cffbf051614 = function_3514ae5d09f47ed2("timeLimit");
            level.starttime = gettime();
            level.discardtime = 0;
            level.timerpausetime = 0;
            level.watchdvars[var_eb5f2cffbf051614].value = 30;
            level.overridewatchdvars[var_eb5f2cffbf051614] = 30;
            level.dontendonscore = 1;
            return;
        }
    }
    if (isdefined(level.onscorelimit)) {
        [[ level.onscorelimit ]](winner);
    }
    thread endgame(winner, var_a138e6484a996bda);
    return 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5825
// Size: 0x9e9
function updategameevents() {
    totalplayers = 0;
    level.teamswithplayers = [];
    foreach (team in level.teamnamelist) {
        teamcount = getteamdata(team, "teamCount");
        totalplayers = totalplayers + teamcount;
        if (teamcount) {
            level.teamswithplayers[level.teamswithplayers.size] = team;
        }
    }
    if (matchmakinggame() && !gameflag("prematch_done")) {
        return;
    }
    if (matchmakinggame() && !level.ingraceperiod && (!isdefined(level.disableforfeit) || !level.disableforfeit)) {
        if (level.teambased) {
            if (level.teamswithplayers.size == 1 && game["state"] == "playing") {
                thread onforfeit(level.teamswithplayers[0]);
                return;
            }
            if (level.teamswithplayers.size > 1) {
                level.forfeitinprogress = undefined;
                level notify("abort_forfeit");
            }
        } else {
            playercount = 0;
            foreach (entry in level.teamnamelist) {
                playercount = playercount + getteamdata(entry, "teamCount");
            }
            if (playercount == 1 && level.maxplayercount > 1) {
                thread onforfeit();
                return;
            }
            if (playercount > 1) {
                level.forfeitinprogress = undefined;
                level notify("abort_forfeit");
            }
        }
    }
    if (level.teamswithplayers.size == 1 && (istrue(level.br_debugsolotest) || !namespace_36f464722d326bbe::isBRStyleGameType())) {
        return;
    }
    if (!getgametypenumlives() && (!isdefined(level.disablespawning) || !level.disablespawning)) {
        return;
    }
    if (!gamehasstarted()) {
        return;
    }
    if (level.ingraceperiod && !isdefined(level.overrideingraceperiod)) {
        return;
    }
    if (level.teambased) {
        livescount = [];
        foreach (entry in level.teamnamelist) {
            livescount[entry] = 0;
        }
        foreach (player in level.players) {
            if (!istrue(player.hasspawned) || player.team == "spectator" || player.team == "codcaster" || player.team == "free") {
                continue;
            }
            livescount[player.team] = livescount[player.team] + player namespace_3c5a4254f2b957ea::getpersstat("lives");
        }
        if (istrue(level.disablespawning)) {
            foreach (entry in level.teamnamelist) {
                livescount[entry] = 0;
            }
        }
        var_4351d3695cbe4fd7 = 0;
        foreach (entry in level.teamnamelist) {
            if (getteamdata(entry, "aliveCount")) {
                var_4351d3695cbe4fd7 = 1;
                break;
            }
        }
        var_3ed276c562480671 = 0;
        foreach (count in livescount) {
            if (count) {
                var_3ed276c562480671 = 1;
                break;
            }
        }
        if (!var_4351d3695cbe4fd7 && !var_3ed276c562480671) {
            if (istrue(level.postgameexfil) && level.gameended) {
                level notify("exfil_continue_game_end");
            }
            if (istrue(level.nukeinfo.var_9dccaba98b643cad)) {
                return;
            }
            if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
                logstring("IWH-315293: GIBBERFISH: onDeadEvent - all");
            }
            return [[ level.ondeadevent ]]("all");
        }
        foreach (entry in level.teamnamelist) {
            if (!getteamdata(entry, "aliveCount") && !livescount[entry]) {
                if (istrue(level.postgameexfil) && level.gameended) {
                    level notify("exfil_continue_game_end");
                }
                if (!istrue(level.skipondeadevent)) {
                    if (istrue(level.nukeinfo.var_9dccaba98b643cad)) {
                        return;
                    }
                    if (level.multiteambased) {
                        if (!getteamdata(entry, "deathEvent") && getteamdata(entry, "hasSpawned")) {
                            if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
                                logstring("IWH-315293: GIBBERFISH: onDeadEvent - entry MultiteamBased");
                            }
                            setteamdata(entry, "deathEvent", 1);
                            [[ level.ondeadevent ]](entry);
                        }
                    } else {
                        if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
                            logstring("IWH-315293: GIBBERFISH: onDeadEvent - entry Team based");
                        }
                        return [[ level.ondeadevent ]](entry);
                    }
                }
            }
        }
        foreach (entry in level.teamnamelist) {
            var_a27052041bc3242b = getteamdata(entry, "aliveCount");
            if (var_a27052041bc3242b == 1 || var_a27052041bc3242b == 2 || function_60bf8d82001fc22c() == "control") {
                var_91595db4ccf80384 = 0;
                var_43e4262d6ea97013 = undefined;
                players = getteamdata(entry, "players");
                aliveplayers = [];
                foreach (player in players) {
                    if (!isalive(player)) {
                        var_91595db4ccf80384 = var_91595db4ccf80384 + player namespace_3c5a4254f2b957ea::getpersstat("lives");
                    } else {
                        aliveplayers[aliveplayers.size] = player;
                    }
                }
                if (var_a27052041bc3242b != 1) {
                    setteamdata(entry, "oneLeft", 0);
                }
                var_129ccb16298ea627 = 0;
                if (function_60bf8d82001fc22c() == "control") {
                    livescount = getteamdata(entry, "livesCount");
                    alivecount = getteamdata(entry, "aliveCount");
                    var_ae75a4d0dcb50f69 = livescount + alivecount;
                    if (var_ae75a4d0dcb50f69 == 1 && level.numteamlives != 0) {
                        var_129ccb16298ea627 = 1;
                    }
                } else if (var_91595db4ccf80384 == 0) {
                    var_129ccb16298ea627 = 1;
                }
                if (var_129ccb16298ea627) {
                    if (var_a27052041bc3242b == 1 && !getteamdata(entry, "oneLeft") && gettime() > getteamdata(entry, "oneLeftTime") + 5000) {
                        setteamdata(entry, "oneLeftTime", gettime());
                        setteamdata(entry, "oneLeft", 1);
                        if (players.size > 1) {
                            [[ level.ononeleftevent ]](entry);
                        }
                    }
                }
            } else {
                setteamdata(entry, "oneLeft", 0);
            }
        }
    } else {
        livescount = 0;
        foreach (player in level.players) {
            if (player.team == "spectator" || player.team == "codcaster") {
                continue;
            }
            livescount = livescount + player namespace_3c5a4254f2b957ea::getpersstat("lives");
        }
        var_1f7bcaa53ca6d399 = 0;
        foreach (entry in level.teamnamelist) {
            var_1f7bcaa53ca6d399 = var_1f7bcaa53ca6d399 + getteamdata(entry, "aliveCount");
        }
        if (!var_1f7bcaa53ca6d399 && !livescount) {
            if (istrue(level.nukeinfo.var_9dccaba98b643cad)) {
                return;
            }
            return [[ level.ondeadevent ]]("all");
        }
        var_677ae66df2125f53 = getpotentiallivingplayers();
        if (var_677ae66df2125f53.size == 1) {
            return [[ level.ononeleftevent ]]("all");
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6215
// Size: 0x72
function timelimitclock_intermission(waittime) {
    setgameendtime(gettime() + int(waittime * 1000));
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    if (waittime >= 10) {
        wait(waittime - 10);
    }
    for (;;) {
        clockobject playsound("ui_mp_timer_countdown");
        wait(1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x628e
// Size: 0x32c
function waitforplayers(maxtime, var_c8c8535645d45985, var_4670fd6135253c34) {
    starttime = gettime();
    if (istrue(game["isLaunchChunk"])) {
        mintime = 0;
    } else if (maxtime > 5) {
        mintime = gettime() + getdvarint(@"hash_4e2f47a7b2856857") * 1000;
    } else {
        mintime = 0;
    }
    if (var_4670fd6135253c34) {
        var_26cd2fe9d9c7396a = max(1, level.connectingplayers);
    } else {
        var_26cd2fe9d9c7396a = max(1, level.connectingplayers / 2);
    }
    if (getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "ob") {
        var_26cd2fe9d9c7396a = level.connectingplayers;
    }
    namespace_4b0406965e556711::gameflagwait("infil_setup_complete");
    var_7d3c76f0163532bd = 0;
    var_dc74b0012af15741 = 0;
    while (1) {
        if (istrue(game["roundsPlayed"]) && !namespace_36f464722d326bbe::function_d04af493b6e718ac()) {
            break;
        }
        var_d2a0f17e8e173e01 = level.maxplayercount;
        var_b7652eea48ae3d62 = getstreamedinplayercount();
        if (!var_7d3c76f0163532bd) {
            if (var_b7652eea48ae3d62 > 0) {
                starttime = gettime();
                var_7d3c76f0163532bd = 1;
            } else {
                waitframe();
                continue;
            }
        }
        curtime = gettime();
        var_54ab13ac8f1a59cd = var_d2a0f17e8e173e01 >= var_26cd2fe9d9c7396a;
        var_fd915e8bd20b6d09 = 0;
        if (isdefined(level.var_fd915e8bd20b6d09)) {
            var_fd915e8bd20b6d09 = [[ level.var_fd915e8bd20b6d09 ]]();
        } else {
            var_fd915e8bd20b6d09 = var_b7652eea48ae3d62 >= var_26cd2fe9d9c7396a;
        }
        if (var_fd915e8bd20b6d09) {
            foreach (entry in level.teamnamelist) {
                if (!checkrequiredteamcount(entry)) {
                    var_54ab13ac8f1a59cd = 0;
                    break;
                }
            }
        }
        foreach (entry in level.teamnamelist) {
            if (!checkrequiredteamstreamcount(entry)) {
                if (getgametype() == "arena" && !var_dc74b0012af15741) {
                    setomnvar("ui_match_start_text", "waiting_for_teams");
                }
                var_fd915e8bd20b6d09 = 0;
                break;
            }
        }
        endtime = starttime + level.prematchperiod * 1000 - 200;
        if (namespace_4b0406965e556711::gameflag("infil_will_run") || istrue(var_c8c8535645d45985)) {
            if (var_fd915e8bd20b6d09 && curtime > mintime || curtime > endtime) {
                break;
            }
        } else if (var_fd915e8bd20b6d09 && var_54ab13ac8f1a59cd && curtime > mintime || curtime > endtime) {
            break;
        }
        waitframe();
    }
    /#
        totaltime = gettime() - starttime;
        println("lives" + totaltime + "lp_match_cancelled");
    #/
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65c1
// Size: 0x514
function function_d084af239c9a23c(duration, var_c8c8535645d45985) {
    if (istrue(game["roundsPlayed"])) {
        return;
    }
    starttime = gettime();
    endtime = starttime + duration * 1000;
    mintime = gettime() + getdvarint(@"hash_4e2f47a7b2856857") * 1000;
    var_26cd2fe9d9c7396a = level.requiredplayercount["allies"] + level.requiredplayercount["axis"];
    var_7d3c76f0163532bd = 0;
    var_a11aee8da78e2638 = 0;
    var_6591c2949d00ee51 = 0;
    var_37bc68c6b6e75de1 = 0;
    if (getdvarint(@"hash_e7fd1773dcd3056b", 0) && var_c8c8535645d45985) {
        var_26cd2fe9d9c7396a = var_26cd2fe9d9c7396a - getdvarint(@"hash_e7fd1773dcd3056b", 0);
    }
    while (1) {
        curtime = gettime();
        var_d2a0f17e8e173e01 = level.maxplayercount;
        var_b7652eea48ae3d62 = getstreamedinplayercount();
        if (!var_7d3c76f0163532bd) {
            if (var_b7652eea48ae3d62 > 0) {
                starttime = gettime();
                var_7d3c76f0163532bd = 1;
                if (getdvarint(@"hash_5886df61b04d3129", 0)) {
                    break;
                }
            } else {
                /#
                    if (curtime - var_37bc68c6b6e75de1 > 3000) {
                        println("oneLeft" + var_b7652eea48ae3d62 + "match_starting_in");
                        var_37bc68c6b6e75de1 = curtime;
                    }
                #/
                waitframe();
                continue;
            }
        }
        var_54ab13ac8f1a59cd = var_d2a0f17e8e173e01 >= var_26cd2fe9d9c7396a;
        var_93e3fe0e5693889b = var_b7652eea48ae3d62 >= var_26cd2fe9d9c7396a;
        /#
            if (curtime - var_37bc68c6b6e75de1 > 3000) {
                var_acce55f72d869802 = 0;
                var_7d07bcc667393cdf = 0;
                var_d0287c2035478fe = 0;
                foreach (player in level.players) {
                    if (!isdefined(player.team)) {
                        var_d0287c2035478fe++;
                    } else if (player.team == "gameEndFreeze") {
                        var_acce55f72d869802++;
                    } else if (player.team == "give_match_bonus") {
                        var_7d07bcc667393cdf++;
                    }
                }
                println("oneLeft" + var_acce55f72d869802 + "killsPerWeapon");
                println("oneLeft" + var_7d07bcc667393cdf + "match_ending_soon");
                println("oneLeft" + var_d0287c2035478fe + "prematch_music");
            }
        #/
        if (var_93e3fe0e5693889b) {
            foreach (entry in level.teamnamelist) {
                if (!checkrequiredteamcount(entry)) {
                    var_54ab13ac8f1a59cd = 0;
                    break;
                }
            }
        }
        if (istrue(var_c8c8535645d45985) && var_93e3fe0e5693889b && curtime > mintime) {
            break;
        } else if (var_54ab13ac8f1a59cd && curtime > mintime) {
            break;
        }
        if (!var_c8c8535645d45985 && getdvarint(@"hash_5886df61b04d3129", 0) == 0 && !istrue(level.var_60f7d8bd0181980f) && getactiveclientcount(1) < var_26cd2fe9d9c7396a) {
            level.var_60f7d8bd0181980f = 1;
            setomnvarforallclients("ui_leagueplay_allow_quit", 1);
            thread function_46eb417b582d5179(endtime - curtime);
        }
        if (curtime > endtime) {
            var_a11aee8da78e2638 = 1;
            /#
                println("waypoint_taking_b" + level.var_c8001f5313a05589 + "waypoint_blocking_c");
            #/
            break;
        }
        if (!var_c8c8535645d45985 && !var_6591c2949d00ee51 && curtime + level.prematchperiodend * 1000 > endtime) {
            foreach (player in level.players) {
                if (istrue(player.waitingtoselectclass)) {
                    var_ed6036c19a695cd2 = player getplayerdata(level.loadoutsgroup, "customizationFavorites", "favoriteLoadoutIndex");
                    var_235c2a26e9117e24 = ter_op(isdefined(var_ed6036c19a695cd2), var_ed6036c19a695cd2, 0);
                    player notify("loadout_class_selected", var_235c2a26e9117e24);
                    player setclientomnvar("ui_options_menu", 0);
                }
            }
            var_6591c2949d00ee51 = 1;
        }
        /#
            if (curtime - var_37bc68c6b6e75de1 > 3000) {
                println("oneLeft" + var_b7652eea48ae3d62 + "match_starting_in");
                println("oneLeft" + var_d2a0f17e8e173e01 + "waypoint_contested_b");
                var_37bc68c6b6e75de1 = curtime;
            }
        #/
        waitframe();
    }
    /#
        totaltime = gettime() - starttime;
        println("waypoint_clearing_d" + totaltime + "lp_match_cancelled");
    #/
    if (getdvarint(@"hash_c03a546c561f9ef", 0) || var_c8c8535645d45985) {
        return;
    }
    if (var_a11aee8da78e2638) {
        namespace_82872106c3e3314d::function_dc56b195bbf80d31();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6adc
// Size: 0x70
function getstreamedinplayercount() {
    count = 0;
    foreach (player in level.players) {
        if (istrue(player namespace_3c5a4254f2b957ea::getpersstat("streamSyncComplete"))) {
            count++;
        }
    }
    return count;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b54
// Size: 0x24
function checkrequiredteamcount(team) {
    return getteamdata(team, "hasSpawned") >= level.requiredplayercount[team];
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b80
// Size: 0xa6
function checkrequiredteamstreamcount(team) {
    count = 0;
    foreach (player in level.players) {
        if (isdefined(player.team) && player.team == team && istrue(player namespace_3c5a4254f2b957ea::getpersstat("streamSyncComplete"))) {
            count++;
        }
    }
    return count >= level.requiredplayercount[team];
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c2e
// Size: 0x61f
function prematchperiod() {
    level endon("game_ended");
    level.connectingplayers = getdvarint(@"hash_6317f96738d7a501");
    if (getdvarint(@"hash_f77b78837563fb9a", 0) == 1 && !istrue(level.skipprematch)) {
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            /#
                assertmsg("IWH-315293: BELUGA: " + "Gametype:" + getgametype() + " inLiveLobby, we shouldn't be");
            #/
        }
        game["inLiveLobby"] = 1;
        if (getdvarint(@"hash_466714dad346a907", 0) == 1) {
            level thread watchdevoverridematchstart();
        }
        level thread watchforlowpopmatchstart(1);
        level thread watchforminplayersmatchstart();
        level waittill("start_prematch");
        if (level.var_77907d733abe8b63) {
            level thread namespace_2c7976a64ea24d6a::function_562f080949959cfc();
            level thread namespace_2c7976a64ea24d6a::function_d794d8a20e142efa();
        }
        setdvar(@"hash_f77b78837563fb9a", 0);
        game["inLiveLobby"] = 0;
        game["liveLobbyCompleted"] = 1;
        var_ae27de936bab61ad = 30;
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            var_ae27de936bab61ad = getmatchrulesdata("brData", "preMatchStartTimer");
        }
        /#
            if (getdvarfloat(@"hash_7a1447160ba151fe", 0) > 0) {
                var_ae27de936bab61ad = getdvarfloat(@"hash_7a1447160ba151fe", 0);
            }
            if (getdvarfloat(@"hash_1c528462a5c6a55d", 0) > 0) {
                var_6b572c7fae671883 = getdvarfloat(@"hash_1c528462a5c6a55d", 0);
            }
        #/
        level.allowprematchdamage = 0;
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            if (!istrue(level.var_78db23c4f4816114)) {
                level.allowprematchdamage = 1;
            }
            level thread namespace_d3d40f75bb4e4c32::br_delaynojip();
        }
        level livelobbymatchstarttimer("match_starting_in", var_ae27de936bab61ad);
        level notify("start_prematch");
        level.prematchperiod = 0;
        game["blockJIP"] = 1;
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            level thread namespace_8885c19c053dcb46::function_c24d9aca5f9eba35();
        }
        if (!privatematch()) {
            if (getdvarint(@"hash_22eddf44003baf9", 0) != 0 && function_7eda3128313bb227()) {
                /#
                    println("MP_INGAME_ONLY/OBJ_DEFUSING_CAPS");
                #/
                setdvar(@"hash_925f7dceb8e6205e", 1);
                namespace_bf9ffd2b22c7d819::function_c5728699e6b79552(1);
            } else {
                /#
                    println("waypoint_dogtags");
                #/
                setdvar(@"hash_925f7dceb8e6205e", 0);
            }
        } else if (getdvarint(@"hash_22eddf44003baf9", 0) != 0 && getdvarint(@"hash_8af519063ce59ce9", 0) != 0) {
            /#
                println("select_spawn");
            #/
            setdvar(@"hash_15dc0d6798e4bdd8", 1);
            setdvar(@"hash_925f7dceb8e6205e", 1);
            namespace_bf9ffd2b22c7d819::function_c5728699e6b79552(1);
        }
    } else if (!istrue(level.skipprematch)) {
        if (namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm") {
            minplayers = getdvarint(@"hash_faf1db5754891b2d");
            if (minplayers != 0) {
                level thread watchforlowpopmatchstart();
                level thread brwatchforminplayersmatchstart();
                level waittill("start_prematch");
                if (namespace_36f464722d326bbe::isBRStyleGameType()) {
                    level thread namespace_8885c19c053dcb46::function_c24d9aca5f9eba35();
                }
                if (level.var_77907d733abe8b63) {
                    level thread namespace_2c7976a64ea24d6a::function_562f080949959cfc();
                    level thread namespace_2c7976a64ea24d6a::function_d794d8a20e142efa();
                }
                /#
                    var_98c4343376bcedb9 = 0;
                    while (istrue(level.var_9bb484946bcc49b2)) {
                        var_98c4343376bcedb9 = 1;
                        waitframe();
                    }
                    foreach (player in level.players) {
                        if (!isdefined(player)) {
                            continue;
                        }
                        if (isbot(player) || istestclient(player)) {
                            while (isdefined(player) && !player.hasspawned) {
                                waitframe();
                            }
                        }
                    }
                    if (var_98c4343376bcedb9) {
                        wait(1);
                    }
                #/
            }
            var_ae27de936bab61ad = 15;
            /#
                if (getdvarfloat(@"hash_7a1447160ba151fe", 0) > 0) {
                    var_ae27de936bab61ad = getdvarfloat(@"hash_7a1447160ba151fe", 0);
                }
            #/
            level.allowprematchdamage = 0;
            if (namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz") {
                level.allowprematchdamage = 1;
            }
            level livelobbymatchstarttimer("match_starting_in", var_ae27de936bab61ad);
        }
    }
    /#
        if (level.mapname == "roundlimit" && !isprophuntgametype() && getdvarint(@"hash_ff65c25889692db8", 0) != 1) {
            level thread givebmodevloadouts();
        }
    #/
    if (istrue(level.skipprematch)) {
        while (!level.players.size) {
            waitframe();
        }
        if (matchmakinggame() && namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            var_1580cb21313fb11c = 2000;
            var_2c5e9beb8228e58a = gettime() + var_1580cb21313fb11c;
            var_458c943d98a7ed1a = function_fe94aaedd1047d50();
            /#
                assert(var_458c943d98a7ed1a > 0);
            #/
            while (gettime() < var_2c5e9beb8228e58a && function_e48deb3d75ab2e92() < var_458c943d98a7ed1a) {
                waitframe();
            }
        }
    }
    if (istrue(game["matchStartRequiresInput"])) {
        level waittill("pressToStartMatch");
    }
    if (istrue(game["blockJIP"])) {
        setnojipscore(1, 1);
        setnojiptime(1, 1);
        level.nojip = 1;
    }
    if (istrue(level.var_15c7d73680ea5496)) {
        return;
    }
    level notify("prematch_started");
    if (istrue(level.var_66113aa6fc12be57)) {
        level.parachuterestoreweaponscb = &namespace_d20f8ef223912e12::nakeddrop;
    }
    if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
        logstring("IWH-315293: CEPHALOPOD: prematch_started notified");
    }
    updatetournamentroundtime(gettimeremaining(), 2);
    level.prematchstarted = 1;
    if (level.prematchperiodend > 0) {
        matchstarttimerwaitforplayers();
    } else {
        matchstarttimerskip();
    }
    namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    updatetournamentroundtime(gettimeremaining(), 0);
    if (game["state"] != "playing") {
        return;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7254
// Size: 0x1d
function function_1147bbc93ea9b83c() {
    return !istrue(level.skipprematch) && !namespace_4b0406965e556711::gameflag("prematch_done");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7279
// Size: 0x77
function givebmodevloadouts() {
    wait(3);
    if (isdefined(level.parachuterestoreweaponscb)) {
        foreach (player in level.players) {
            if (isreallyalive(player)) {
                player [[ level.parachuterestoreweaponscb ]]();
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f7
// Size: 0x130
function graceperiod() {
    level endon("game_ended");
    if (!isdefined(game["clientActive"])) {
        while (getactiveclientcount() == 0) {
            waitframe();
        }
        game["clientActive"] = 1;
    }
    while (level.ingraceperiod > 0) {
        wait(1);
        level.ingraceperiod--;
    }
    level notify("grace_period_ending");
    waitframe();
    namespace_4b0406965e556711::gameflagset("graceperiod_done");
    level.ingraceperiod = 0;
    if (game["state"] != "playing") {
        if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
            logstring("IWH-315293: FROGFISH: game[ state ] != playing");
        }
        return;
    }
    if (getgametypenumlives()) {
        players = level.players;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player.hasspawned && player.sessionteam != "spectator" && !isalive(player)) {
                player.statusicon = "hud_status_dead";
            }
        }
    }
    level thread [[ level.updategameevents ]]();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x742e
// Size: 0xf3
function sethasdonecombat(player, var_d6fb9fb787eb9cf) {
    if (!isdefined(player.hasDoneAnyCombat)) {
        player.hasDoneAnyCombat = player namespace_3c5a4254f2b957ea::getpersstat("hasDoneAnyCombat");
    }
    if (var_d6fb9fb787eb9cf && !istrue(player.hasdonecombat)) {
        namespace_d19129e4fa5d176::disableclassswapallowed();
    }
    player.hasdonecombat = var_d6fb9fb787eb9cf;
    if (namespace_36f464722d326bbe::isBRStyleGameType() && !namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    if (var_d6fb9fb787eb9cf && !istrue(player.hasDoneAnyCombat)) {
        player.pers["hasDoneAnyCombat"] = 1;
        player.hasDoneAnyCombat = 1;
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            player namespace_3c5a4254f2b957ea::incpersstat("gamesPlayed", 1);
        }
        if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("hasMatchLoss")) && player namespace_3c5a4254f2b957ea::getpersstat("hasMatchLoss")) {
            return;
        }
        namespace_d576b6dc7cef9c62::updatelossstats(player);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7528
// Size: 0x18e
function updatewinstats(winner) {
    /#
        println("update_winlimit" + winner getentitynumber());
    #/
    if (!winner onlinestatsenabled()) {
        /#
            println("IWH-315293: ELECTRICEEL: Prematch done");
        #/
        return;
    }
    if (!istrue(winner namespace_3c5a4254f2b957ea::getpersstat("hasDoneAnyCombat"))) {
        /#
            println("intermission");
        #/
        return;
    }
    if (istrue(winner namespace_3c5a4254f2b957ea::getpersstat("recordedLoss"))) {
        winner addtoplayerstat(-1, "matchStats", "losses");
    }
    /#
        println("alliesScore" + winner getplayerstat("scripted", "script_model"));
        println("death_or_disconnect" + winner getplayerstat("scripted", "script_model"));
        println("Gamelogic - trackAttackerLeaderboardDeathState - attempting to use undefined victim");
    #/
    winner addtoplayerstat(1, "matchStats", "wins");
    /#
        println("death_or_disconnect" + winner getplayerstat("scripted", "script_model"));
    #/
    winner addtoplayerstat(1, "matchStats", "currentWinStreak");
    winner addtoplayerstat(1, "modeRecords", function_60bf8d82001fc22c());
    cur_win_streak = winner getplayerstat("matchStats", "currentWinStreak");
    if (cur_win_streak > winner getplayerstat("bestStats", "longestWinStreak")) {
        winner setplayerstat(cur_win_streak, "bestStats", "longestWinStreak");
    }
    winner namespace_2685ec368e022695::statsetchild("round", "win", 1);
    winner namespace_2685ec368e022695::statsetchild("round", "loss", 0);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76bd
// Size: 0x99
function updatelossstats(loser) {
    if (!loser onlinestatsenabled()) {
        return;
    }
    if (!istrue(loser namespace_3c5a4254f2b957ea::getpersstat("hasDoneAnyCombat"))) {
        return;
    }
    loser.pers["hasMatchLoss"] = 1;
    if (!istrue(self.joinedinprogress)) {
        loser addtoplayerstat(1, "matchStats", "losses");
        loser.pers["recordedLoss"] = 1;
    }
    loser addtoplayerstat(1, "matchStats", "gamesPlayed");
    loser namespace_2685ec368e022695::statsetchild("round", "loss", 1);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x775d
// Size: 0x86
function updatetiestats(loser) {
    if (!loser onlinestatsenabled()) {
        return;
    }
    if (!istrue(loser namespace_3c5a4254f2b957ea::getpersstat("hasDoneAnyCombat"))) {
        return;
    }
    if (istrue(loser namespace_3c5a4254f2b957ea::getpersstat("recordedLoss"))) {
        loser addtoplayerstat(-1, "matchStats", "losses");
        loser setplayerstat(0, "matchStats", "currentWinStreak");
    }
    loser addtoplayerstat(1, "matchStats", "ties");
    loser namespace_2685ec368e022695::statsetchild("round", "loss", 0);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77ea
// Size: 0x37c
function updatewinlossstats(winner) {
    /#
        println("topTwentyFive");
    #/
    if (privatematch()) {
        /#
            println("extrascore0");
        #/
        return;
    }
    if (!waslastround()) {
        /#
            println("mount32");
        #/
        return;
    }
    level.processedwinloss = 1;
    players = level.players;
    updateplayercombatstatus();
    if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
        /#
            println("dlog_event_player_field_rep_eom_report");
        #/
        foreach (player in level.players) {
            if (isdefined(player.connectedpostgame)) {
                continue;
            }
            if (level.hostforcedend && player ishost()) {
                player setplayerstat(0, "matchStats", "currentWinStreak");
            } else {
                updatetiestats(player);
            }
        }
    } else if (isplayer(winner)) {
        /#
            println("<unknown string>");
        #/
        if (level.hostforcedend && winner ishost()) {
            winner setplayerstat(0, "matchStats", "currentWinStreak");
            return;
        }
        if (isdefined(level.lastplayerwins) || players.size <= 3) {
            updatewinstats(level.placement["all"][0]);
        } else {
            for (pidx = 0; pidx < min(level.placement["all"].size, 3); pidx++) {
                updatewinstats(level.placement["all"][pidx]);
            }
        }
    } else if (isstring(winner)) {
        /#
            println("<unknown string>" + winner + "<unknown string>");
        #/
        foreach (player in level.players) {
            /#
                println("<unknown string>" + player getentitynumber() + "<unknown string>" + player.name + "<unknown string>");
            #/
            if (isdefined(player.connectedpostgame)) {
                /#
                    println("<unknown string>");
                #/
            } else if (level.hostforcedend && player ishost()) {
                /#
                    println("<unknown string>");
                #/
                player setplayerstat(0, "matchStats", "currentWinStreak");
            } else if (winner == "tie") {
                /#
                    println("<unknown string>");
                #/
                updatetiestats(player);
            } else if (player.pers["team"] == winner) {
                /#
                    println("<unknown string>");
                #/
                updatewinstats(player);
            } else {
                /#
                    println("<unknown string>");
                #/
                if (istrue(player.pers["recordedLoss"])) {
                    /#
                        println("<unknown string>");
                    #/
                    player setplayerstat(0, "matchStats", "currentWinStreak");
                }
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b6d
// Size: 0xc3
function updateplayercombatstatus() {
    if (!namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        return;
    }
    foreach (player in level.players) {
        if (player.sessionstate == "spectator" && !player.spectatekillcam) {
            continue;
        } else if (istrue(player.pers["hasDoneAnyCombat"])) {
            continue;
        } else if (player.team == "axis") {
            continue;
        } else {
            player sethasdonecombat(player, 1);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c37
// Size: 0x6b
function freezeplayerforroundend(delay) {
    self endon("disconnect");
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    namespace_58fb4f2e73fd41a0::clearlowermessages();
    if (!isdefined(delay)) {
        delay = level.framedurationseconds;
    }
    wait(delay);
    val::function_3633b947164be4f3("gameEndFreeze", 0);
    if (self isonground() || self isonladder()) {
        self allowmovement(0);
    } else {
        thread gameendfreezemovement();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca9
// Size: 0x5a
function gameendfreezemovement() {
    self endon("disconnect");
    timecheck = 0;
    while (timecheck < 1) {
        if (!self isonground()) {
            timecheck = timecheck + level.framedurationseconds;
        } else {
            self allowmovement(0);
            break;
        }
        wait(level.framedurationseconds);
    }
    self allowmovement(0);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d0a
// Size: 0x49e
function updatematchbonusscores(winner) {
    if (!game["timePassed"]) {
        return;
    }
    if (!matchmakinggame()) {
        return;
    }
    if (!gettimelimit() || level.forcedend) {
        gamelength = gettimepassed() / 1000;
        gamelength = min(gamelength, 1200);
    } else {
        gamelength = int(floor(namespace_cd0b2d039510b38d::getroundlength() / 1000));
    }
    if (level.teambased) {
        if (isdefined(winner) && isgameplayteam(winner) && winner != "tie") {
            setwinningteam(winner);
        }
        if (namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "kingslayer" && getsubgametype() != "rumble_mgl") {
            return;
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.connectedpostgame)) {
                continue;
            }
            if (!player rankingenabled()) {
                continue;
            }
            if (player.timeplayed["total"] < 1 || player namespace_3c5a4254f2b957ea::getpersstat("participation") < 1) {
                continue;
            }
            if (level.hostforcedend && player ishost()) {
                continue;
            }
            if (!istrue(player namespace_3c5a4254f2b957ea::getpersstat("hasDoneAnyCombat"))) {
                continue;
            }
            playerteam = player namespace_3c5a4254f2b957ea::getpersstat("team");
            if (winner == "tie") {
                playerscore = player calculatematchbonus("tie", gamelength);
                player givematchbonus("tie", playerscore);
                player.matchbonus = playerscore;
            } else if (isdefined(playerteam) && playerteam == winner) {
                playerscore = player calculatematchbonus("win", gamelength);
                player givematchbonus("win", playerscore);
                player.matchbonus = playerscore;
            } else if (isdefined(playerteam) && isgameplayteam(playerteam) && playerteam != winner) {
                playerscore = player calculatematchbonus("loss", gamelength);
                player givematchbonus("loss", playerscore);
                player.matchbonus = playerscore;
            }
            player calculateweaponmatchbonus(gamelength);
        }
    } else {
        if (namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "kingslayer" && getsubgametype() != "rumble_mgl") {
            return;
        }
        var_dbbfd0e462584b9b = "win";
        var_b1efc8448d0e3b3 = "loss";
        if (!isdefined(winner)) {
            var_dbbfd0e462584b9b = "tie";
            var_b1efc8448d0e3b3 = "tie";
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.connectedpostgame)) {
                continue;
            }
            if (player.timeplayed["total"] < 1 || player namespace_3c5a4254f2b957ea::getpersstat("participation") < 1) {
                continue;
            }
            if (!istrue(player namespace_3c5a4254f2b957ea::getpersstat("hasDoneAnyCombat"))) {
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
                playerscore = player calculatematchbonus(var_dbbfd0e462584b9b, gamelength);
                player givematchbonus("win", playerscore);
                player.matchbonus = playerscore;
            } else {
                playerscore = player calculatematchbonus(var_b1efc8448d0e3b3, gamelength);
                player givematchbonus("loss", playerscore);
                player.matchbonus = playerscore;
            }
            player calculateweaponmatchbonus(gamelength);
        }
    }
    level notify("give_match_bonus");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81af
// Size: 0xba
function calculatematchbonus(matchresult, gamelength) {
    var_acd7dff57c94292a = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_matchbonus_baseline"), 250);
    var_f5c150745db5bf66 = gamelength / 60;
    var_30fb07c2ca202ff = namespace_62c556437da28f50::function_6d17f84162f0d8f0(matchresult);
    var_4335fe32113ac6cb = self.timeplayed["total"] / gamelength;
    var_c1495b0f54d34dd6 = namespace_62c556437da28f50::getgametypexpmultiplier();
    matchbonus = int(var_acd7dff57c94292a * var_30fb07c2ca202ff * var_f5c150745db5bf66 * var_4335fe32113ac6cb * var_c1495b0f54d34dd6);
    matchbonus = int(min(matchbonus, 16384));
    return matchbonus;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8271
// Size: 0xb1
function givematchbonus(scoretype, score) {
    if (getdvarint(@"hash_1f9e52c91272c80d", 1) == 0) {
        return;
    }
    thread namespace_62c556437da28f50::giverankxp(function_1823ff50bb28148d(scoretype), score, undefined, 1, 1, 1);
    if (scoretype == "win") {
        thread namespace_48a08c5037514e04::doScoreEvent(#"hash_fe606101a22e3e79", undefined, undefined, undefined, undefined, undefined, 1, undefined, undefined, undefined, undefined, 1);
    } else {
        /#
            assertex(scoretype == "tie" || scoretype == "loss", "Unexpected scoreType for giveMatchBonus(), "" + scoretype + """);
        #/
        thread namespace_48a08c5037514e04::doScoreEvent(#"hash_dc98011722824bd8", undefined, undefined, undefined, undefined, undefined, 1, undefined, undefined, undefined, undefined, 1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8329
// Size: 0x2f8
function calculateweaponmatchbonus(gamelength) {
    if (getdvarint(@"hash_f80c5403193b015f", 1) == 0) {
        return;
    }
    if (istrue(namespace_3c5a4254f2b957ea::getpersstat("ignoreWeaponMatchBonus")) || !isdefined(namespace_3c5a4254f2b957ea::getpersstat("killsPerWeapon"))) {
        return;
    }
    var_11865501de9083d = namespace_4cd6e0abb58d4200::getgametypekillsperhouravg() / 60;
    var_f5c150745db5bf66 = gamelength / 60;
    var_162a122a3e3cce1a = int(var_11865501de9083d * var_f5c150745db5bf66);
    var_63f737a3357b557e = int(50);
    var_4335fe32113ac6cb = self.timeplayed["total"] / gamelength;
    var_9bf173c2aa7eb966 = var_63f737a3357b557e * var_4335fe32113ac6cb;
    var_4b7cf89acaabdcac = int(var_162a122a3e3cce1a * var_9bf173c2aa7eb966);
    var_4b7cf89acaabdcac = var_4b7cf89acaabdcac - int(namespace_3c5a4254f2b957ea::getpersstat("weaponMatchBonusKills") * var_9bf173c2aa7eb966);
    if (var_4b7cf89acaabdcac <= 0) {
        return;
    }
    var_ce22c9b0708caf7e = 0;
    foreach (data in namespace_3c5a4254f2b957ea::getpersstat("killsPerWeapon")) {
        var_ce22c9b0708caf7e = var_ce22c9b0708caf7e + var_162a122a3e3cce1a - data.killcount;
    }
    if (var_ce22c9b0708caf7e <= 0) {
        return;
    }
    foreach (var_5dc27a5bf459c504, data in namespace_3c5a4254f2b957ea::getpersstat("killsPerWeapon")) {
        ratio = (var_162a122a3e3cce1a - data.killcount) / var_ce22c9b0708caf7e;
        var_c01ee836ef4a7e4a = int(var_4b7cf89acaabdcac * ratio);
        namespace_62c556437da28f50::incrankxp(0, data, var_c01ee836ef4a7e4a, function_1823ff50bb28148d("WeaponMatchBonus"));
        foreach (var_10ca4bf7aa9c3ed2, var_5842e592ddcef384 in namespace_3c5a4254f2b957ea::getpersstat("weaponStats")) {
            if (issubstr(var_10ca4bf7aa9c3ed2, var_5dc27a5bf459c504)) {
                if (isdefined(var_5842e592ddcef384.stats["kills"]) && data.killcount > 0) {
                    var_c40aa4f6f34ffdc4 = ratio * var_5842e592ddcef384.stats["kills"] / data.killcount;
                    var_c01ee836ef4a7e4a = int(var_4b7cf89acaabdcac * var_c40aa4f6f34ffdc4);
                    if (isdefined(var_5842e592ddcef384.stats["xp_earned"])) {
                        var_5842e592ddcef384.stats["xp_earned"] = var_5842e592ddcef384.stats["xp_earned"] + var_c01ee836ef4a7e4a;
                    } else {
                        var_5842e592ddcef384.stats["xp_earned"] = var_c01ee836ef4a7e4a;
                    }
                }
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8628
// Size: 0x8d
function setxenonranks(winner) {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player.score) || !isdefined(player.pers["team"])) {
            continue;
        }
    }
    for (i = 0; i < players.size; i++) {
        player = players[i];
        _setplayerteamrank(player);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86bc
// Size: 0x452
function _setplayerteamrank(player, teamplacement) {
    if (!isdefined(player)) {
        return;
    }
    if (istrue(player.pers["xenonRankSet"])) {
        return;
    }
    if (!isdefined(player.kills) || !isdefined(player.deaths)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (getgametype() == "arena") {
        if (1 > player.timeplayed["total"]) {
            return;
        }
        if (!isdefined(player.arenadamage)) {
            return;
        }
        damage = player.arenadamage;
        /#
            println("<unknown string>" + damage);
        #/
        setplayerteamrank(player, player.clientid, damage);
        player.pers["xenonRankSet"] = 1;
    } else if (isteamplacementsbmmmode()) {
        if (!isdefined(teamplacement)) {
            teamplacement = function_53c4c53197386572(player.teamplacement, 0);
        }
        playerscore = 1000 - teamplacement;
        setplayerteamrank(player, player.clientid, playerscore);
        player.pers["xenonRankSet"] = 1;
    } else if (istrue(level.var_b9c6856f5ab5f70f)) {
        var_32ea0136e9afcd9a = function_53c4c53197386572(player.kills, 0);
        var_2b00eaa34070c8f7 = function_53c4c53197386572(player.var_2b00eaa34070c8f7, 0);
        downs = function_53c4c53197386572(player.pers["downs"], 0);
        deaths = function_53c4c53197386572(player.deaths, 0);
        suicides = function_53c4c53197386572(player getpersstat("suicides"), 0);
        var_8d738248e5c26cf9 = function_53c4c53197386572(player namespace_6d8da2b47f878104::function_19300abfbb10928b() / 60, 1);
        if (var_8d738248e5c26cf9 == 0) {
            var_8d738248e5c26cf9 = 1;
        }
        var_f7ad089e7173ef76 = (var_32ea0136e9afcd9a - downs + deaths - suicides) / var_8d738248e5c26cf9;
        var_9a98108bc0622435 = (var_2b00eaa34070c8f7 - downs + deaths - suicides) / var_8d738248e5c26cf9;
        var_ba0bea5b319c5b2d = getdvarfloat(@"hash_9cdadf8cf57f485e", 0.75);
        var_af48040f4e0ce6f2 = getdvarfloat(@"hash_f4a4d4df91cf9f67", 0.25);
        rank = var_f7ad089e7173ef76 * var_ba0bea5b319c5b2d + var_9a98108bc0622435 * var_af48040f4e0ce6f2;
        /#
            println("<unknown string>" + rank);
        #/
        /#
            println("<unknown string>" + var_ba0bea5b319c5b2d + "<unknown string>" + var_32ea0136e9afcd9a + "<unknown string>" + downs + "<unknown string>" + deaths + "<unknown string>" + suicides + "<unknown string>" + var_8d738248e5c26cf9 + "<unknown string>");
        #/
        /#
            println("<unknown string>" + var_af48040f4e0ce6f2 + "<unknown string>" + var_2b00eaa34070c8f7 + "<unknown string>" + downs + "<unknown string>" + deaths + "<unknown string>" + suicides + "<unknown string>" + var_8d738248e5c26cf9 + "<unknown string>");
        #/
        setplayerteamrank(player, player.clientid, rank);
        player.pers["xenonRankSet"] = 1;
    } else {
        if (120 > player.timeplayed["total"]) {
            return;
        }
        suicides = 0;
        if (getdvarint(@"hash_8613ee8086b0e0f6") == 1) {
            suicides = player getpersstat("suicides");
        }
        kd = (player.kills - player.deaths - suicides) / player.timeplayed["total"] / 60;
        /#
            println("<unknown string>" + player.kills + "<unknown string>" + player.deaths + "<unknown string>" + suicides + "<unknown string>" + player.timeplayed["<unknown string>"] / 60 + "<unknown string>" + kd);
        #/
        setplayerteamrank(player, player.clientid, kd);
        player.pers["xenonRankSet"] = 1;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b15
// Size: 0x412
function checktimelimit(var_f177bc3f3b9e94b1) {
    if (isdefined(level.timelimitoverride) && level.timelimitoverride) {
        return;
    }
    if (game["state"] != "playing") {
        setgameendtime(0);
        return;
    }
    runjiprules();
    if (gettimelimit() <= 0) {
        if (isdefined(level.starttime)) {
            setgameendtime(level.starttime);
        } else {
            setgameendtime(0);
        }
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        setgameendtime(0);
        return;
    }
    if (!isdefined(level.starttime)) {
        return;
    }
    if (istrue(level.timerstopped)) {
        return;
    }
    timeleft = gettimeremaining();
    setgameendtime(gettime() + int(timeleft));
    var_83af6c8b7cee31c8 = istrue(level.ontimelimitgraceperiod);
    if (timeleft > 0 && !isdefined(level.forceotlogictorun)) {
        if (var_83af6c8b7cee31c8) {
            if (namespace_4b0406965e556711::levelflag("over_time_entered")) {
                namespace_4b0406965e556711::levelflagclear("over_time_entered");
            }
            if (istrue(level.setallclientomnvarot)) {
                setomnvarforallclients("ui_overtime_timer_show", 0);
            } else {
                setomnvar("ui_overtime_timer_show", 0);
            }
        }
        if (!isdefined(level.var_5821aa8d232fffa1) && isdefined(level.var_cbd35282359dd3fd) && level.var_cbd35282359dd3fd > 180 && int(timeleft / 1000) < int(level.var_cbd35282359dd3fd / 2)) {
            level.var_5821aa8d232fffa1 = 1;
            level thread function_f08a48e620ec4480();
        }
        return;
    } else if (getgametype() == "wm" && timeleft <= 0 && !namespace_4b0406965e556711::levelflag("over_time_entered")) {
        namespace_26a75045c9dd4bcb::showsplashtoall("wm_last_chance");
        namespace_4b0406965e556711::levelflagset("over_time_entered");
    }
    if (var_83af6c8b7cee31c8) {
        namespace_4b0406965e556711::gameflagset("overtime_started");
        if (!isdefined(level.overtimetotal)) {
            level.overtimetotal = 0;
        } else {
            level.overtimetotal = level.overtimetotal + level.frameduration;
        }
        if (isdefined(level.ontimelimitot)) {
            [[ level.ontimelimitot ]]();
            level.ontimelimitot = undefined;
        }
        if (istrue(level.canprocessot)) {
            level.currenttimelimitdelay = level.currenttimelimitdelay + level.framedurationseconds;
        } else {
            level.currenttimelimitdelay = 0;
        }
        progress = clamp(1 - level.currenttimelimitdelay / level.ontimelimitgraceperiod, 0, 1);
        if (level.currenttimelimitdelay < level.ontimelimitgraceperiod) {
            if (istrue(level.setallclientomnvarot)) {
                if (!isdefined(level.forcehideottimer)) {
                    setomnvarforallclients("ui_overtime_timer_show", 1);
                }
                setomnvarforallclients("ui_overtime_timer", progress);
            } else {
                setomnvar("ui_overtime_timer_show", 1);
                setomnvar("ui_overtime_timer", progress);
            }
            if (getsubgametype() == "champion") {
                setomnvar("ui_overtime_time", gettime() + (level.ontimelimitgraceperiod - level.currenttimelimitdelay) * 1000);
            } else {
                setomnvar("ui_overtime_time", gettime() + level.ontimelimitgraceperiod * 1000);
            }
        } else {
            if (istrue(level.setallclientomnvarot)) {
                setomnvarforallclients("ui_overtime_timer_show", 0);
                setomnvarforallclients("ui_overtime_timer", progress);
            } else {
                setomnvar("ui_overtime_timer_show", 0);
                setomnvar("ui_overtime_timer", progress);
            }
            if (getsubgametype() == "champion") {
                setomnvar("ui_overtime_time", gettime());
            } else {
                setomnvar("ui_overtime_time", gettime() + level.ontimelimitgraceperiod * 1000);
            }
        }
        if (level.currenttimelimitdelay < level.ontimelimitgraceperiod) {
            return;
        }
    }
    [[ level.ontimelimit ]]();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f2e
// Size: 0xb6
function function_f08a48e620ec4480() {
    if (level.teambased) {
        if (inovertime() || intimetobeat()) {
            if (isscoretobeatrulegametype()) {
                score = game["overtimeProgress"] + game["overtimeProgressFrac"];
                winner = setscoretobeat(game["attackers"], score * 60);
            } else if (istimetobeatvalid()) {
                winner = game["timeToBeatTeam"];
            }
        } else {
            winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
        }
        if (winner != "tie") {
            level thread function_af05f2d3b126a9d0(winner);
        }
    } else {
        var_6dd753add7d1c236 = namespace_e8a49b70d0769b66::gethighestscoringplayer();
        level thread function_af05f2d3b126a9d0(var_6dd753add7d1c236);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8feb
// Size: 0xcf
function function_af05f2d3b126a9d0(winner) {
    if (!isdefined(winner)) {
        return;
    }
    if (!isplayer(winner)) {
        namespace_944ddf7b8df1b0e3::leaderdialog("halfway_friendly_time", winner, "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("halfway_enemy_time", getotherteam(winner)[0], "status");
    } else {
        if (isdefined(winner)) {
            winner thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer("halfway_friendly_time");
        }
        var_15030f107e796007 = namespace_e8a49b70d0769b66::getlosingplayers();
        foreach (player in var_15030f107e796007) {
            if (is_equal(player, winner)) {
                continue;
            }
            player thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer("halfway_enemy_time");
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90c1
// Size: 0x1f
function enableovertimegameplay() {
    level.ontimelimitgraceperiod = 5;
    level.currenttimelimitdelay = 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90e7
// Size: 0x198
function runjiprules() {
    if (!level.matchmakingmatch) {
        return;
    }
    if (!isdefined(level.nojip)) {
        level.nojip = 0;
    }
    if (!level.nojip) {
        if (isroundbased() && !level.nojip) {
            switch (getgametype()) {
            case #"hash_4b8799075d3a89b8":
            case #"hash_f4a9126c03d3385b":
                var_310caaf87186cd6 = checkdomjiprules();
                break;
            case #"hash_53825b446469ac4c":
            case #"hash_5ff8e011d5b9d1c8":
            case #"hash_aac44b0b52bacb8e":
            case #"hash_e2e043391c7c9074":
            case #"hash_eb5e5f470e0c1dc2":
            case #"hash_fa37b7f6bd6f6cbf":
            case #"hash_fa50b0f6bd82e972":
            case #"hash_fa50baf6bd82f930":
                var_310caaf87186cd6 = function_8e22bfd7b2fc9dda();
                break;
            case #"hash_1a5d186c17c00d3c":
                var_310caaf87186cd6 = checkctfjiprules();
                break;
            case #"hash_51347b2eb89b24c4":
                var_310caaf87186cd6 = checkballjiprules();
                break;
            case #"hash_fa0ed2f6bd4f4395":
                var_310caaf87186cd6 = checkddjiprules();
                break;
            default:
                var_310caaf87186cd6 = checkdefaultjiprules();
                break;
            }
            if (var_310caaf87186cd6) {
                setnojipscore(1, 1);
                setnojiptime(1, 1);
                level.nojip = 1;
            }
        } else if (gettimepassedpercentage() > level.timepercentagecutoff) {
            setnojiptime(1, 1);
            level.nojip = 1;
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9286
// Size: 0x79
function checkdomjiprules() {
    if (!isfirstround()) {
        foreach (entry in level.teamnamelist) {
            if (getteamscoreint(entry) > 150) {
                return 1;
            }
        }
        if (gettimepassedpercentage() > 75) {
            return 1;
        }
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9307
// Size: 0x125
function function_8e22bfd7b2fc9dda() {
    var_bdb5de4f9346b298 = 3;
    switch (getgametype()) {
    case #"hash_aac44b0b52bacb8e":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_53825b446469ac4c":
        var_bdb5de4f9346b298 = 2;
        break;
    case #"hash_eb5e5f470e0c1dc2":
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_5ff8e011d5b9d1c8":
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_fa37b7f6bd6f6cbf":
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_e2e043391c7c9074":
        var_bdb5de4f9346b298 = 2;
        break;
    default:
        var_bdb5de4f9346b298 = 3;
        break;
    }
    if (isanymlgmatch()) {
        var_bdb5de4f9346b298 = 5;
    }
    foreach (entry in level.teamnamelist) {
        if (getroundswon(entry) >= var_bdb5de4f9346b298) {
            return 1;
        }
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9434
// Size: 0xda
function checkctfjiprules() {
    if (!isfirstround()) {
        if (gettimepassedpercentage() > level.timepercentagecutoff) {
            return 1;
        }
    }
    var_4244662178fa8083 = undefined;
    highestscore = undefined;
    foreach (entry in level.teamnamelist) {
        teamscore = getteamscoreint(entry);
        if (!isdefined(var_4244662178fa8083) || teamscore < var_4244662178fa8083) {
            var_4244662178fa8083 = teamscore;
        }
        if (!isdefined(highestscore) || teamscore > highestscore) {
            highestscore = teamscore;
        }
    }
    delta = abs(highestscore - var_4244662178fa8083);
    if (delta > 10) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9516
// Size: 0xda
function checkballjiprules() {
    if (!isfirstround()) {
        if (gettimepassedpercentage() > level.timepercentagecutoff) {
            return 1;
        }
    }
    var_4244662178fa8083 = undefined;
    highestscore = undefined;
    foreach (entry in level.teamnamelist) {
        teamscore = getteamscoreint(entry);
        if (!isdefined(var_4244662178fa8083) || teamscore < var_4244662178fa8083) {
            var_4244662178fa8083 = teamscore;
        }
        if (!isdefined(highestscore) || teamscore > highestscore) {
            highestscore = teamscore;
        }
    }
    delta = abs(highestscore - var_4244662178fa8083);
    if (delta > 15) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f8
// Size: 0x72
function checkddjiprules() {
    var_743180d464fc06d1 = 0;
    foreach (entry in level.teamnamelist) {
        var_743180d464fc06d1 = var_743180d464fc06d1 + getroundswon(entry);
    }
    if (var_743180d464fc06d1 >= 2) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9672
// Size: 0x23
function checkdefaultjiprules() {
    if (nextroundisfinalround()) {
        if (gettimepassedpercentage() > level.timepercentagecutoff) {
            return 1;
        }
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x969d
// Size: 0x1a
function getteamscoreint(team) {
    return int(game["teamScores"][team]);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96bf
// Size: 0x3a
function gettimeremaining() {
    var_cc683b074a559f27 = 0;
    if (isdefined(level.var_cc683b074a559f27)) {
        var_cc683b074a559f27 = level.var_cc683b074a559f27;
    }
    return gettimelimit() * 1000 - gettimepassed() - var_cc683b074a559f27;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9701
// Size: 0x22
function gettimeremainingpercentage() {
    timelimit = gettimelimit() * 1000;
    return (timelimit - gettimepassed()) / timelimit;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972b
// Size: 0x21e
function checkteamscorelimitsoon(team) {
    /#
        assert(isdefined(team));
    #/
    if (level.roundscorelimit <= 0 || isobjectivebased()) {
        return;
    }
    if (isdefined(level.scorelimitoverride) && level.scorelimitoverride) {
        return;
    }
    if (getgametype() == "jugg") {
        return;
    }
    if (!level.teambased) {
        return;
    }
    var_d68c5a87ff60523 = 0;
    if (shouldcheckcustomclosetoscorelimit()) {
        var_d68c5a87ff60523 = closetoscorelimit(team);
    } else if (getgametype() == "arm" || getgametype() == "conflict") {
        var_389a5f5663132900 = closetoscorelimit(team);
        var_77c63f5cd9656bdb = gettimeremaining() < gettimelimit() * 0.075;
        var_d68c5a87ff60523 = var_389a5f5663132900 || var_77c63f5cd9656bdb;
    } else if (gettimepassed() > 45000) {
        var_d68c5a87ff60523 = estimatedtimetillscorelimit(team) < 0.5;
    }
    if (!isdefined(level.playedmatchendingsoon)) {
        level.playedmatchendingsoon = 0;
    }
    if (!level.playedmatchendingsoon && var_d68c5a87ff60523) {
        level.playedmatchendingsoon = 1;
        level notify("match_ending_soon", "score");
    }
    if (!level.playedmatchendingsoon && canplayhalfwayvo()) {
        if (getteamscore(team) >= int(level.scorelimit * level.currentround - level.scorelimit / 2)) {
            namespace_944ddf7b8df1b0e3::leaderdialog("halfway_friendly_score", team, "status");
            thread namespace_3bde6869e44a2770::midpoint_music(team);
            var_b0c33d224b825287 = getenemyteams(team);
            foreach (entry in var_b0c33d224b825287) {
                namespace_944ddf7b8df1b0e3::leaderdialog("halfway_enemy_score", entry, "status");
            }
            level.didhalfscorevoboost = 1;
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9950
// Size: 0x5e
function shouldcheckcustomclosetoscorelimit() {
    switch (getgametype()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_3a17de6e294210d2":
    case #"hash_7f9c384a34cc392f":
    case #"hash_ea061d29bbd1f237":
    case #"hash_f4a9126c03d3385b":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99b5
// Size: 0x91
function checkplayerscorelimitsoon() {
    if (level.roundscorelimit <= 0 || isobjectivebased()) {
        return;
    }
    if (level.teambased) {
        return;
    }
    if (gettimepassed() < 60000) {
        return;
    }
    namespace_e8a49b70d0769b66::checkffascorejip();
    if (getgametype() == "gun") {
        if (self.score == 14) {
            level notify("match_ending_soon", "score");
        }
    } else {
        timeleft = estimatedtimetillscorelimit();
        if (timeleft < 2) {
            level notify("match_ending_soon", "score");
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a4d
// Size: 0x15b
function checkscorelimit(var_6e5149ef941c9008) {
    if (cantiebysimultaneouskill()) {
        var_6e5149ef941c9008 = 1;
    }
    if (istrue(var_6e5149ef941c9008)) {
        if (isplayer(self) && !level.teambased && self.score >= level.roundscorelimit) {
            level.scorelimitreached = 1;
        }
        level notify("checkScoreLimit");
        level endon("checkScoreLimit");
        waitframe();
    }
    if (isobjectivebased()) {
        return 0;
    }
    if (isdefined(level.scorelimitoverride) && level.scorelimitoverride) {
        return 0;
    }
    if (game["state"] != "playing") {
        return 0;
    }
    if (level.roundscorelimit <= 0) {
        return 0;
    }
    if (level.teambased) {
        var_bb9dc32b46ac2c1a = 0;
        for (i = 0; i < level.teamnamelist.size; i++) {
            if (game["teamScores"][level.teamnamelist[i]] >= level.roundscorelimit) {
                var_bb9dc32b46ac2c1a = 1;
            }
        }
        if (!var_bb9dc32b46ac2c1a) {
            return 0;
        }
    } else {
        if (!isplayer(self)) {
            return 0;
        }
        if (self.score < level.roundscorelimit && !istrue(level.scorelimitreached)) {
            return 0;
        }
    }
    if (!istrue(level.dontendonscore)) {
        return onscorelimit(var_6e5149ef941c9008);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9baf
// Size: 0x43
function updategametypedvars() {
    level endon("game_ended");
    while (game["state"] == "playing") {
        if (isdefined(level.starttime)) {
            if (gettimeremaining() < 3000) {
                wait(0.1);
                continue;
            }
        }
        wait(1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bf9
// Size: 0x1b2
function matchstarttimerwaitforplayers() {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("infilSequence")) {
        if (!istrue(level.var_72e1667d06ab98db)) {
            setomnvar("ui_in_infil", 3);
        }
    }
    if (istrue(level.var_ec2fb549b15ad827)) {
        function_d084af239c9a23c(level.var_c8001f5313a05589, 1);
        level thread prematchcountdownnotify();
    } else {
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            thread matchstarttimer("match_starting_in", level.prematchperiod + level.prematchperiodend);
        }
        level thread prematchcountdownnotify();
        waitforplayers(level.prematchperiod, 0, istrue(level.var_d0074a54d755766b));
    }
    if (level.prematchperiodend > 0 && !isdefined(level.hostmigrationtimer)) {
        var_3142592a7f2064f5 = level.prematchperiodend;
        level notify("match_start_real_countdown", var_3142592a7f2064f5);
        if (istrue(level.var_ec2fb549b15ad827)) {
            var_3b0d320c2be79893 = level.prematchperiod * 2 + var_3142592a7f2064f5;
            level.leaguePlayLoadingComplete = 1;
            level notify("leaguePlayLoadingComplete");
            setomnvar("ui_mp_extended_load_screen", 0);
            setomnvar("ui_match_start_text", "waiting_for_players");
            function_d084af239c9a23c(var_3b0d320c2be79893, 0);
            level.var_60f7d8bd0181980f = 0;
        }
        if (!gameflag("infil_will_run") && game["roundsPlayed"] == 0 && !namespace_36f464722d326bbe::isarenamap() && getsubgametype() != "dmz" && getsubgametype() != "exgm") {
            level thread showmapchyron();
        }
        thread matchstarttimer("match_starting_in", var_3142592a7f2064f5);
        thread prematchcountdownnotify(var_3142592a7f2064f5);
        level waittill("matchStartTimer_done");
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9db2
// Size: 0x3d
function showmapchyron() {
    if (istrue(level.var_4df4777277c281ff)) {
        return;
    }
    setomnvar("ui_in_infil", 1);
    level waittill_notify_or_timeout("matchStartTimer_done", 8);
    setomnvar("ui_in_infil", -1);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9df6
// Size: 0x57
function prematchcountdownnotify(var_38a6b48a5f70c0b8) {
    level notify("prematchCountdownNotify");
    level endon("prematchCountdownNotify");
    if (isdefined(var_38a6b48a5f70c0b8)) {
        wait(max(var_38a6b48a5f70c0b8 - 5, 0));
    } else {
        wait(max(level.prematchperiod + level.prematchperiodend - 5, 0));
    }
    namespace_4b0406965e556711::gameflagset("prematch_countdown");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e54
// Size: 0x64
function startmodeobjidnotify(time) {
    self notify("startOBJID");
    self endon("startOBJID");
    if (function_60bf8d82001fc22c() == "sd") {
        notifytime = 6;
    } else {
        notifytime = 5;
    }
    if (time > notifytime) {
        time = time - notifytime;
        max(time, 0);
        wait(time);
    } else {
        wait(0.5);
    }
    level notify("start_mode_setup");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ebf
// Size: 0x149
function matchstarttimer(type, duration) {
    self notify("matchStartTimer");
    self endon("matchStartTimer");
    level notify("match_start_timer_beginning");
    counttime = int(duration);
    level thread startmodeobjidnotify(counttime);
    if (counttime >= 2) {
        setomnvar("ui_match_start_text", type);
        matchstarttimerperplayer_internal(counttime);
    }
    visionsetnaked("", 0);
    level notify("matchStartTimer_done");
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924() || istrue(level.testrandomrealismclients)) {
        foreach (player in level.players) {
            if (istrue(level.testrandomrealismclients)) {
                if (!isdefined(player.isrealismenabled)) {
                    if (cointoss()) {
                        player setclientomnvar("ui_realism_hud", 0);
                        player setclientomnvar("ui_realism_hud", 1);
                        player.isrealismenabled = 1;
                    }
                }
            } else {
                player setclientomnvar("ui_realism_hud", 0);
                player setclientomnvar("ui_realism_hud", 1);
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa00f
// Size: 0x12a
function matchstarttimerperplayer_internal(counttime) {
    waittillframeend();
    level endon("match_start_timer_beginning");
    level endon("match_cancel_timer_beginning");
    var_c835a7183d47607b = int(counttime);
    if (namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm") {
        thread namespace_d3d40f75bb4e4c32::applyprematchplotarmor(var_c835a7183d47607b);
    }
    foreach (entry in level.teamnamelist) {
        childthread teamstarttimer(entry, var_c835a7183d47607b);
    }
    var_f246834464c55d65 = [0:"spectator", 1:"codcaster"];
    foreach (entry in var_f246834464c55d65) {
        childthread teamstarttimer(entry, var_c835a7183d47607b);
    }
    childthread clearvisionsettimer(var_c835a7183d47607b);
    wait(var_c835a7183d47607b);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa140
// Size: 0x2bb
function teamstarttimer(team, counttime) {
    level endon("match_start_timer_beginning");
    level endon("match_cancel_timer_beginning");
    level.matchcountdowntime = ter_op(isdefined(level.var_c8761d87ed1399df), level.var_c8761d87ed1399df, counttime);
    if (!level.gameended) {
        var_fdd4cb56c3b978a3 = namespace_36f464722d326bbe::isBRStyleGameType();
        if (var_fdd4cb56c3b978a3) {
            thread namespace_d3d40f75bb4e4c32::prematchmusic(team);
            thread namespace_d3d40f75bb4e4c32::prematchdialog(team);
        }
        var_92d0054b383f50d5 = !var_fdd4cb56c3b978a3 && level.teambased && team != "spectator" && team != "codcaster" && getdvarint(@"hash_be73a4d94209c1e6") == 0;
        if (var_92d0054b383f50d5) {
            var_c6b6dab35a7bf3b3 = 5;
        }
        while (counttime > 0 && !level.gameended) {
            teamarray = getteamdata(team, "players");
            if (var_92d0054b383f50d5) {
                var_75acdb03f713b07d = counttime <= 8 && counttime >= var_c6b6dab35a7bf3b3;
            }
            foreach (player in teamarray) {
                if (counttime <= 80 && !istrue(player.var_f4bb3d8522246fdc)) {
                    if (var_92d0054b383f50d5) {
                        player setclientomnvar("ui_show_subfaction_splash", var_75acdb03f713b07d);
                    }
                    player setclientomnvar("ui_match_start_countdown", counttime);
                    player setclientomnvar("ui_match_in_progress", 0);
                }
            }
            counttime--;
            level.matchcountdowntime = counttime;
            if (counttime <= 4 && !isdefined(level.playedstartingmusic)) {
                level notify("prematch_music");
            }
            wait(1);
            var_bb0d1ba749ac56dd = namespace_f5675568ccc8acc6::function_6fc852802774b304(1, counttime * 1000);
            if (var_bb0d1ba749ac56dd > 0 && counttime <= 10) {
                if (!gameflag("prematch_done")) {
                    var_bb0d1ba749ac56dd = 10;
                }
                counttime = var_bb0d1ba749ac56dd;
            }
        }
        namespace_f5675568ccc8acc6::function_7a921eb7b2cbb5d();
        level.matchcountdowntime = undefined;
        teamarray = getteamdata(team, "players");
        foreach (player in teamarray) {
            namespace_99ac021a7547cae3::clearprematchlook(player);
            player _freezecontrols(0, 1);
            player setclientomnvar("ui_match_start_countdown", -1);
            player setclientomnvar("ui_match_in_progress", 1);
        }
        namespace_4b0406965e556711::gameflagset("prematch_values_reset");
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa402
// Size: 0xe1
function function_46eb417b582d5179(timems, var_4c918b514697b434) {
    level notify("match_cancel_timer_beginning");
    level endon("match_cancel_timer_beginning");
    var_3b49a6b4425c3bdf = "match_cancelling_in";
    if (isdefined(var_4c918b514697b434)) {
        var_3b49a6b4425c3bdf = var_4c918b514697b434;
    }
    setomnvar("ui_match_start_text", var_3b49a6b4425c3bdf);
    counttime = int(timems / 1000);
    waittillframeend();
    while (counttime > 0 && level.var_60f7d8bd0181980f) {
        foreach (p in level.players) {
            p setclientomnvar("ui_match_start_countdown", counttime);
            p setclientomnvar("ui_match_in_progress", 0);
        }
        counttime--;
        wait(1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4ea
// Size: 0x37
function clearvisionsettimer(counttime) {
    while (counttime > 0 && !level.gameended) {
        counttime--;
        wait(1);
    }
    visionsetnaked("", 0);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa528
// Size: 0x17
function matchstarttimerskip() {
    visionsetnaked("", 0);
    level notify("match_start_timer_skip");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa546
// Size: 0x13d
function onroundswitch(overtime) {
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (overtime) {
        level.halftimetype = "overtime";
        if (islastwinbytwo()) {
            aheadteam = getbetterteam();
            if (aheadteam != game["defenders"]) {
                game["switchedsides"] = !game["switchedsides"];
                level.switchedsides = 1;
            } else {
                level.switchedsides = undefined;
            }
        } else {
            game["switchedsides"] = !game["switchedsides"];
            level.switchedsides = 1;
        }
    } else if (istrue(level.skipdefendersadvantage)) {
        game["switchedsides"] = !game["switchedsides"];
        level.switchedsides = 1;
    } else if (shouldgivedefendersadvantage()) {
        aheadteam = getbetterteam();
        if (aheadteam != game["defenders"]) {
            game["switchedsides"] = !game["switchedsides"];
            level.switchedsides = 1;
        } else {
            level.switchedsides = undefined;
        }
    } else {
        level.halftimetype = "halftime";
        game["switchedsides"] = !game["switchedsides"];
        level.switchedsides = 1;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa68a
// Size: 0x3f
function shouldgivedefendersadvantage() {
    return game["roundsWon"]["allies"] == getwatcheddvar("winlimit") - 1 && game["roundsWon"]["axis"] == getwatcheddvar("winlimit") - 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6d1
// Size: 0x80
function checkroundswitch(overtime) {
    if (!level.teambased) {
        return 0;
    }
    if (!isdefined(level.roundswitch) || !level.roundswitch) {
        return 0;
    }
    /#
        assert(game["roundsPlayed"] > 0);
    #/
    if (function_ac027009283233c6()) {
        if (function_e3058efbdb62a578()) {
            return 1;
        }
    } else if (game["roundsPlayed"] % level.roundswitch == 0 || overtime) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa759
// Size: 0x59
function function_ac027009283233c6() {
    switch (level.gametype) {
    case #"hash_5ff8e011d5b9d1c8":
        if (level.roundswitch == 2 && getdvarint(@"hash_b2d6a287c0521607", 2) == 2) {
            return 1;
        }
        return 0;
    default:
        return 0;
        break;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7b9
// Size: 0x4a
function function_e3058efbdb62a578() {
    switch (level.gametype) {
    case #"hash_5ff8e011d5b9d1c8":
        if (game["roundsPlayed"] % level.roundswitch == 1) {
            return 1;
        }
        return 0;
    default:
        return 0;
        break;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa80a
// Size: 0xcc
function timeuntilroundend() {
    if (level.gameended) {
        timepassed = (gettime() - level.gameendtime) / 1000;
        timeremaining = level.postroundtime - timepassed;
        if (timeremaining < 0) {
            return 0;
        }
        return timeremaining;
    }
    if (gettimelimit() <= 0) {
        return undefined;
    }
    if (!isdefined(level.starttime)) {
        return undefined;
    }
    var_cdde4978f529a4a9 = gettimelimit();
    timepassed = (gettime() - level.starttime) / 1000;
    timeremaining = level.discardtime / 1000 + gettimelimit() - timepassed;
    if (isdefined(level.timepaused)) {
        timeremaining = timeremaining + level.timepaused;
    }
    return timeremaining + level.postroundtime;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8de
// Size: 0x11d
function freegameplayhudelems() {
    if (isdefined(self.perkicon)) {
        if (isdefined(self.perkicon[0])) {
            self.perkicon[0] destroyelem();
            self.perkname[0] destroyelem();
        }
        if (isdefined(self.perkicon[1])) {
            self.perkicon[1] destroyelem();
            self.perkname[1] destroyelem();
        }
        if (isdefined(self.perkicon[2])) {
            self.perkicon[2] destroyelem();
            self.perkname[2] destroyelem();
        }
    }
    self notify("perks_hidden");
    if (!level.doeomcombat) {
        self.lowermessage destroyelem();
        self.lowertimer destroyelem();
    }
    if (isdefined(self.proxbar)) {
        self.proxbar destroyelem();
    }
    if (isdefined(self.proxbartext)) {
        self.proxbartext destroyelem();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa02
// Size: 0x45
function gethostplayer() {
    players = getentarray("player", "classname");
    for (index = 0; index < players.size; index++) {
        if (players[index] ishost()) {
            return players[index];
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa4e
// Size: 0x72
function function_8464fd951b451534(var_df1b054c1838d0de) {
    foreach (player in level.players) {
        if (!isbot(player)) {
            if (isdefined(var_df1b054c1838d0de) && var_df1b054c1838d0de != player) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaac8
// Size: 0x3c
function hostidledout() {
    hostplayer = gethostplayer();
    if (isdefined(hostplayer) && !hostplayer.hasspawned && !isdefined(hostplayer.selectedclass)) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab0c
// Size: 0xc5
function roundendwait(defaultdelay) {
    if (!level.doeomcombat) {
        wait(level.postgamehitmarkerwaittime + 0.1);
        setomnvarforallclients("post_game_state", 2);
    }
    var_8d539c1577794d34 = 0;
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (player iscodcaster()) {
            var_8d539c1577794d34 = level.var_7210bb7b0bfbcfdb;
        }
    }
    wait(defaultdelay);
    wait(var_8d539c1577794d34);
    setomnvarforallclients("post_game_state", 1);
    level notify("round_end_finished");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabd8
// Size: 0x13
function roundenddof(time) {
    setdof_spectator();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf2
// Size: 0x90
function setwaypointiconinfo(name, var_96d1603beeefa4ea, var_673b3cdbd1f53958, string, icon, var_b50e35d9c370899b, iconid) {
    level.waypointcolors[name] = var_673b3cdbd1f53958;
    level.waypointbgtype[name] = var_96d1603beeefa4ea;
    level.waypointstring[name] = string;
    level.waypointshader[name] = icon;
    level.waypointpulses[name] = var_b50e35d9c370899b;
    level.var_ed9acfb4a79fb6be[name] = iconid;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac89
// Size: 0x1b39
function initwaypointbackgrounds() {
    var_a443300a7cc92ef0 = 0;
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_4cb5825e78aaa8c":
    case #"hash_ca6516c10db2c95":
    case #"hash_1b1eecd3863a50cf":
    case #"hash_3ae8dcf2840c03a0":
    case #"hash_53825b446469ac4c":
    case #"hash_63fb0ba698c46db3":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_99a69534b169e838":
    case #"hash_9ccabb62c3d37fb0":
    case #"hash_a1313b745c17c07e":
    case #"hash_d82d642e83fb9772":
    case #"hash_f25c018be2dd3f5f":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa44d9f6bd7a2fa1":
        setwaypointiconinfo("icon_waypoint_dom_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("icon_waypoint_dom_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("icon_waypoint_dom_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("icon_waypoint_dom_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_taking_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_taking_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_taking_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_taking_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_taking_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_taking_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_taking_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_taking_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_taking_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_capture_a", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_capture_b", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_capture_c", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_capture_d", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_capture_e", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_capture_f", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_capture_g", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_capture_h", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_capture_i", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_defend_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_defend_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defend_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_defend_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defend_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defend_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defend_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_defend_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_defend_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_defending_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_defending_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defending_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_defending_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defending_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defending_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defending_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_defending_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_defending_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_blocking_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_blocking_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_blocking_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_blocking_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_blocked_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_blocked_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_blocked_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_losing_a", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_losing_b", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_losing_c", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_losing_d", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_losing_e", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_losing_f", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_losing_g", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_losing_h", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_losing_i", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_captureneutral_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_captureneutral_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_captureneutral_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_captureneutral_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_contested_a", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_contested_b", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_contested_c", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_contested_d", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_contested_e", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_contested_f", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_contested_g", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_contested_h", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_contested_i", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_dom_target_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_dom_target_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_dom_target_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_dom_target_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_clearing_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_clearing_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_clearing_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_clearing_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_reinforcing_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_reinforcing_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_reinforcing_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_locked_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 3);
        setwaypointiconinfo("waypoint_locked_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 5);
        setwaypointiconinfo("waypoint_locked_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 7);
        setwaypointiconinfo("waypoint_locked_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_captured", var_a443300a7cc92ef0, "codcaster", "", "esports_codcaster_minimap_checkmark", 0, 11);
        break;
    case #"hash_514cd9d568e312b0":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa50b0f6bd82e972":
        setwaypointiconinfo("waypoint_bomb", 2, "friendly", "MP_INGAME_ONLY/OBJ_BOMB_CAPS", "icon_waypoint_bomb", 1, 15);
        setwaypointiconinfo("icon_waypoint_escort_bomb", 2, "neutral", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_bomb", 0, 10);
        setwaypointiconinfo("codcaster_enemy_escort_bomb", 1, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_bomb", 0, 10);
        setwaypointiconinfo("waypoint_target_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_target_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_bomb_defusing_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_bomb_defusing_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_b", 0, 6);
        setwaypointiconinfo("waypoint_bomb_planting_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_bomb_planting_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defuse_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb", 0, 4);
        setwaypointiconinfo("waypoint_defuse_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb", 0, 6);
        setwaypointiconinfo("waypoint_bomb_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, 4);
        setwaypointiconinfo("waypoint_bomb_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, 6);
        setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defend_c", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_defend_d", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_d", 0, 8);
        setwaypointiconinfo("waypoint_defend_e", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, 9);
        setwaypointiconinfo("waypoint_defuse_nt_a", 0, "enemy", "", "icon_waypoint_dom_a", 0, 4);
        setwaypointiconinfo("waypoint_defuse_nt_b", 0, "enemy", "", "icon_waypoint_dom_b", 0, 6);
        setwaypointiconinfo("waypoint_bomb_defend_nt_a", 0, "friendly", "", "icon_waypoint_dom_a", 0, 4);
        setwaypointiconinfo("waypoint_bomb_defend_nt_b", 0, "friendly", "", "icon_waypoint_dom_b", 0, 6);
        break;
    case #"hash_9a6f07d0214a87db":
        setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_defend_c", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_defend_d", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defend_e", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defend_f", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_target_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_target_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_target_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_target_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_target_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_target_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_c", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_d", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_e", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_f", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_a", 0, "enemy", "", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_b", 0, "enemy", "", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_c", 0, "enemy", "", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_d", 0, "enemy", "", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_e", 0, "enemy", "", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_f", 0, "enemy", "", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_a", 0, "friendly", "", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_b", 0, "friendly", "", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_c", 0, "friendly", "", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_d", 0, "friendly", "", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_e", 0, "friendly", "", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_f", 0, "friendly", "", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_locked_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_locked_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_locked_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_locked_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_locked_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_locked_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_f", 0, undefined);
        break;
    case #"hash_214e6c6c1b43ae4a":
    case #"hash_aada280b52cbdd96":
    case #"hash_c7f4420f385eeb3d":
    case #"hash_fa34c5f6bd6d4432":
        setwaypointiconinfo("hq_destroy", 0, "enemy", "MP_INGAME_ONLY/OBJ_DESTROY_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_defend", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_defending", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_neutral", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_contested", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_losing", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 2);
        setwaypointiconinfo("hq_taking", 0, "friendly", "MP_INGAME_ONLY/OBJ_DESTROYING_CAPS", "icon_waypoint_hq", 0, 1);
    case #"hash_c065cef60f38490a":
        setwaypointiconinfo("carepackage_incoming", 1, "neutral", "MP_INGAME_ONLY/INCOMING_OBJ_CAPS", "hud_icon_killstreak_carepackage", 0, undefined);
        setwaypointiconinfo("carepackage", 1, "neutral", "", "hud_icon_killstreak_carepackage", 0, undefined);
        break;
    default:
        break;
    }
    if (getgametype() == "conf_v") {
        setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_vial", 0, 15);
        setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_vial", 0, 15);
    } else {
        setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_misc_dog_tag", 0, 15);
        setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_misc_dog_tag", 0, 15);
    }
    setwaypointiconinfo("icon_waypoint_locked", 0, "neutral", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_locked", 0, undefined);
    setwaypointiconinfo("waypoint_capture_kill", 0, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0, undefined);
    setwaypointiconinfo("waypoint_escort", 2, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_escort", 0, undefined);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7c9
// Size: 0x3ad
function function_1765528a2562ebf8(var_74d54b1c99b011db) {
    /#
        println("<unknown string>");
    #/
    if (isdefined(var_74d54b1c99b011db)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            playerclientnum = player getentitynumber();
            selectedplayer = player;
            if (playerclientnum == var_74d54b1c99b011db) {
                /#
                    println("<unknown string>" + var_74d54b1c99b011db + "<unknown string>" + playerclientnum + "<unknown string>" + player.name);
                #/
                var_bab0d10e51188531 = getteamdata(player.team, "players");
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    selectedplayer = player getothersplitscreenplayer();
                }
                if (isdefined(selectedplayer.var_a111e3eabe27d512)) {
                    selectedplayer.var_a111e3eabe27d512 = !selectedplayer.var_a111e3eabe27d512;
                } else {
                    selectedplayer.var_a111e3eabe27d512 = 1;
                }
                hostxuid = getteamdata(player.team, "playagainHostXuid");
                playerxuid = selectedplayer getxuid();
                if (selectedplayer.var_a111e3eabe27d512) {
                    if (hostxuid == "0") {
                        /#
                            println("<unknown string>" + var_74d54b1c99b011db + "<unknown string>" + player.name + "<unknown string>" + playerxuid);
                        #/
                        setteamdata(player.team, "playagainHostXuid", playerxuid);
                    }
                } else if (hostxuid == playerxuid) {
                    /#
                        println("<unknown string>" + var_74d54b1c99b011db + "<unknown string>" + player.name + "<unknown string>");
                    #/
                    var_f7795a328ac962d5 = "0";
                    foreach (teammate in var_bab0d10e51188531) {
                        if (isdefined(teammate) && !isbot(teammate) && teammate issplitscreenplayerprimary()) {
                            var_f7795a328ac962d5 = teammate getxuid();
                            break;
                        }
                    }
                    setteamdata(player.team, "playagainHostXuid", var_f7795a328ac962d5);
                }
                if (istrue(matchmakinggame())) {
                    if (isdefined(player) && player isfireteamleader()) {
                        var_8015767bddc80d67 = player getfireteammembers();
                        foreach (member in var_8015767bddc80d67) {
                            if (!isdefined(member)) {
                                continue;
                            }
                            var_ca55d7efebc143e0 = member getentitynumber();
                            if (var_ca55d7efebc143e0 != playerclientnum) {
                                if (isdefined(member.var_a111e3eabe27d512)) {
                                    member.var_a111e3eabe27d512 = !member.var_a111e3eabe27d512;
                                } else {
                                    member.var_a111e3eabe27d512 = 1;
                                }
                                foreach (teammate in var_bab0d10e51188531) {
                                    if (isdefined(teammate)) {
                                    }
                                }
                            }
                        }
                    }
                }
                break;
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb7e
// Size: 0x222
function function_c3365e6cf89ada44() {
    /#
        println("<unknown string>");
    #/
    var_f9c8fadcb7dacf3a = 0;
    if (!privatematch() && !namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        var_2fd13845453e50e8 = [];
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.var_a111e3eabe27d512) && player.var_a111e3eabe27d512) {
                playerteam = player.team;
                var_ff74eeb3aea4d0be = 0;
                var_da0aca95052ad7d2 = var_2fd13845453e50e8.size;
                for (index = 0; index < var_da0aca95052ad7d2; index++) {
                    if (var_2fd13845453e50e8[index] == playerteam) {
                        var_ff74eeb3aea4d0be = 1;
                    }
                }
                if (!var_ff74eeb3aea4d0be) {
                    var_2fd13845453e50e8[var_da0aca95052ad7d2] = playerteam;
                    teamarray = getteamdata(playerteam, "players");
                    var_6d13f1bf72d13931 = [];
                    playagainHostXuid = getteamdata(playerteam, "playagainHostXuid");
                    foreach (player in teamarray) {
                        if (!isdefined(player)) {
                            continue;
                        }
                        /#
                            println("<unknown string>" + player.name + "<unknown string>" + player.team);
                        #/
                        if (isdefined(player.var_a111e3eabe27d512) && player.var_a111e3eabe27d512) {
                            /#
                                println("<unknown string>" + player.name + "<unknown string>" + player.team + "<unknown string>" + playagainHostXuid);
                            #/
                            var_6d13f1bf72d13931[var_6d13f1bf72d13931.size] = player;
                        }
                    }
                    function_c36e3161b08cc355(var_6d13f1bf72d13931, playagainHostXuid);
                    waitframe();
                }
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcda7
// Size: 0x1a9
function function_b782e1ea0877f735() {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    playerposition = 0;
    while (1) {
        var_5bf95b9affe746b3 = getdvarint(@"hash_4f6750c34be606ee");
        if (isdefined(level.players[0])) {
            playerposition = level.players[0] getclientomnvar("ui_br_player_position");
        }
        switch (var_5bf95b9affe746b3) {
        case 1:
            if (playerposition != 1) {
                level.players[0] setclientomnvar("ui_br_player_position", 1);
                wait(8);
                level.players[0] setclientomnvar("ui_br_player_position", 150);
            }
            break;
        case 2:
            if (playerposition != 4) {
                level.players[0] setclientomnvar("ui_br_player_position", 4);
                wait(8);
                level.players[0] setclientomnvar("ui_br_player_position", 5);
            }
            break;
        case 3:
            if (playerposition != 22) {
                level.players[0] setclientomnvar("ui_br_player_position", 22);
                wait(8);
                level.players[0] setclientomnvar("ui_br_player_position", 150);
            }
            break;
        case 4:
            if (playerposition != 15) {
                level.players[0] setclientomnvar("ui_br_player_position", 15);
                wait(8);
                level.players[0] setclientomnvar("ui_br_player_position", 150);
            }
            break;
        default:
            break;
        }
        waitframe();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf57
// Size: 0x216b
function callback_startgametype() {
    namespace_3ee2bb4833156856::main();
    if (!isdefined(game["roundsPlayed"])) {
        if (analyticsstreamerislogfilestreamingenabled()) {
            analyticsstreamerlogfilestartstream();
        }
        game["matchHasMoreThan1Player"] = 0;
        game["numPlayersConsideredPlaying"] = 0;
    }
    namespace_4b0406965e556711::gameflaginit("prematch_done", 0);
    namespace_4b0406965e556711::gameflaginit("prematch_fade_done", 0);
    namespace_4b0406965e556711::gameflaginit("prematch_countdown", 0);
    namespace_4b0406965e556711::gameflaginit("graceperiod_done", 0);
    namespace_4b0406965e556711::gameflaginit("prematch_values_reset", 0);
    namespace_4b0406965e556711::gameflaginit("infil_setup_complete", 0);
    namespace_4b0406965e556711::gameflaginit("infil_will_run", 0);
    namespace_4b0406965e556711::gameflaginit("infil_started", 0);
    namespace_4b0406965e556711::gameflaginit("infil_animatic_complete", 0);
    namespace_4b0406965e556711::gameflaginit("overtime_started", 0);
    namespace_4b0406965e556711::levelflaginit("round_over", 0);
    namespace_4b0406965e556711::levelflaginit("game_over", 0);
    namespace_4b0406965e556711::levelflaginit("block_notifies", 0);
    namespace_4b0406965e556711::levelflaginit("post_game_level_event_active", 0);
    namespace_4b0406965e556711::levelflaginit("final_killcam_preloaded", 0);
    flags::levelflaginit("over_time_entered", 0);
    level.prematchperiod = 0;
    level.prematchperiodend = 0;
    level.postgamenotifies = 0;
    level.intermission = 0;
    level.var_7210bb7b0bfbcfdb = getdvarfloat(@"hash_cba7d6083c9553b8");
    setdvar(@"hash_8ed4dff39f3251f5", getdvarint(@"hash_f16ba8db72f34fc3") == 1);
    setdvar(@"hash_ed150ed3d105dab0", istrue(level.noweaponfalloff));
    if (getdvarint(@"hash_a4d532f42d919827", 0) == 1) {
        if (!isdefined(level.armoronweaponswitchlongpress)) {
            level.armoronweaponswitchlongpress = 1;
        }
    }
    setdvar(@"hash_ce882ca282c2f85e", istrue(level.armoronweaponswitchlongpress));
    if (matchmakinggame()) {
        setdvar(@"hash_ccf9753c4ee466cc", 1);
    } else {
        setdvar(@"hash_ccf9753c4ee466cc", 0);
    }
    level thread initwaypointbackgrounds();
    if (!isdefined(game["gamestarted"])) {
        game["clientid"] = 0;
        game["truncated_killcams"] = 0;
        game["life_count"] = 0;
        if (!isdefined(game["attackers"]) || !isdefined(game["defenders"])) {
            thread error("No attackers or defenders team defined in level .gsc.");
        }
        if (!isdefined(game["attackers"])) {
            game["attackers"] = "allies";
        }
        if (!isdefined(game["defenders"])) {
            game["defenders"] = "axis";
        }
        if (!isdefined(game["state"])) {
            game["state"] = "playing";
        }
        game["strings"]["press_to_spawn"] = "MP/PRESS_TO_SPAWN";
        game["strings"]["spawn_next_round"] = "MP/SPAWN_NEXT_ROUND";
        game["strings"]["spawn_flag_wait"] = "MP/SPAWN_FLAG_WAIT";
        game["strings"]["spawn_point_capture_wait"] = "MP/SPAWN_POINT_CAPTURE_WAIT";
        game["strings"]["spawn_revive_wait"] = "MP/SPAWN_REVIVE_WAIT";
        game["strings"]["spawn_revive_wait_bleedout"] = "MP/SPAWN_REVIVE_WAIT_BLEEDOUT";
        game["strings"]["spawn_revive_remote"] = "MP/SPAWN_REVIVE_REMOTE";
        game["strings"]["spawn_tag_wait"] = "MP/SPAWN_TAG_WAIT";
        game["strings"]["waiting_to_spawn"] = "MP/WAITING_TO_SPAWN";
        game["strings"]["next_team_spawn"] = "MP/NEXT_TEAM_SPAWN";
        game["strings"]["match_starting"] = "MP/MATCH_STARTING";
        game["strings"]["change_class"] = "MP/CHANGE_CLASS_NEXT_SPAWN";
        game["strings"]["revive_class"] = "MP/CHANGE_CLASS_NEXT_ROUND";
        game["strings"]["change_rig"] = "LUA_MENU_MP/CHANGE_RIG_NEXT_SPAWN";
        game["strings"]["must_select_loadout_to_spawn"] = "MP_INGAME_ONLY/SELECT_LOADOUT_TO_SPAWN";
        game["strings"]["select_spawn"] = "MP/SELECT_SPAWN";
        game["strings"]["down_give_up"] = "MP/DOWN_GIVE_UP";
        level namespace_58fb4f2e73fd41a0::function_5a98c45a6252b4a();
        game["colors"]["black"] = (0, 0, 0);
        game["colors"]["white"] = (1, 1, 1);
        game["colors"]["grey"] = (0.5, 0.5, 0.5);
        game["colors"]["cyan"] = (0.35, 0.7, 0.9);
        game["colors"]["orange"] = (0.9, 0.6, 0);
        game["colors"]["blue"] = (0.2, 0.3, 0.7);
        game["colors"]["red"] = (0.75, 0.25, 0.25);
        game["colors"]["green"] = (0.25, 0.75, 0.25);
        game["colors"]["yellow"] = (0.65, 0.65, 0);
        game["colors"]["friendly"] = (0.258824, 0.639216, 0.87451);
        game["colors"]["enemy"] = (0.929412, 0.231373, 0.141176);
        game["colors"]["contest"] = (1, 0.858824, 0);
        game["colors"]["neutral"] = (1, 1, 1);
        [[ level.onprecachegametype ]]();
        setdvarifuninitialized(@"hash_4e2f47a7b2856857", 5);
        if (!level.splitscreen) {
            level.prematchperiod = namespace_775507ba36294dfb::gettweakablevalue("game", "graceperiod");
            level.prematchperiodend = getdvarint(@"hash_704afe6f6c582ee0", 15);
            /#
                level.prematchperiodend = getdvarint(@"hash_704afe6f6c582ee0", 0);
                level.prematchperiodend = getdvarint(@"hash_26f3f803c983760d", level.prematchperiodend);
            #/
        }
        if (function_1eb7d2791d3c536f()) {
            setnojipscore(1, 1);
            setnojiptime(1, 1);
        } else {
            setnojipscore(0, 1);
            setnojiptime(0, 1);
        }
    } else {
        setdvarifuninitialized(@"hash_4e2f47a7b2856857", 5);
        if (!level.splitscreen) {
            namespace_775507ba36294dfb::gettweakablevalue("game", "graceperiod");
            level.prematchperiodend = getdvarint(@"hash_da33635b62d4e5b3", 5);
        }
    }
    if (!isdefined(game["allies"])) {
        game["allies"] = "SAS";
    }
    if (!isdefined(game["axis"])) {
        game["axis"] = "RUSF";
    }
    if (!isdefined(game["team_three"])) {
        game["team_three"] = "USMC";
    }
    if (!isdefined(game["team_four"])) {
        game["team_four"] = "ZVIR";
    }
    if (!isdefined(game["team_five"])) {
        game["team_five"] = "ICORPS";
    }
    if (!isdefined(game["team_six"])) {
        game["team_six"] = "GRP9";
    }
    if (!isdefined(game["status"])) {
        game["status"] = "normal";
    }
    setdvar(@"hash_caa6faec79f2c4c2", inovertime());
    if (!isdefined(game["timePassed"])) {
        game["timePassed"] = 0;
    }
    if (!isdefined(game["roundsPlayed"])) {
        game["roundsPlayed"] = 0;
    }
    if (!isdefined(game["overtimeRoundsPlayed"])) {
        game["overtimeRoundsPlayed"] = 0;
    }
    if (!isdefined(game["matchPoint"])) {
        game["matchPoint"] = 0;
    }
    if (!isdefined(game["finalRound"])) {
        game["finalRound"] = 0;
    }
    if (!isdefined(game["previousWinningTeam"])) {
        game["previousWinningTeam"] = "";
    }
    setomnvar("ui_last_round", game["finalRound"]);
    if (!isdefined(game["roundsWon"])) {
        game["roundsWon"] = [];
    }
    if (!isdefined(game["teamScores"])) {
        game["teamScores"] = [];
    }
    if (!isdefined(game["timeToBeat"])) {
        game["timeToBeat"] = 0;
    }
    if (!isdefined(game["timeToBeatOld"])) {
        game["timeToBeatOld"] = 0;
    }
    if (!isdefined(game["timeToBeatTeam"])) {
        game["timeToBeatTeam"] = "none";
    }
    if (!isdefined(game["timeToBeatScore"])) {
        game["timeToBeatScore"] = 0;
    }
    if (!isdefined(game["timeToBeatScoreOld"])) {
        game["timeToBeatScoreOld"] = 0;
    }
    level.currentclientmatchdataid = 0;
    level.gameended = 0;
    level.forcedend = 0;
    level.hostforcedend = 0;
    setdvarifuninitialized(@"hash_b66208719c6bae6a", 0);
    /#
        setdvar(@"hash_b66208719c6bae6a", 0);
    #/
    setdvarifuninitialized(@"hash_e32ebdbb97a1ec4e", 0);
    level.disablepersonalnuke = isanymlgmatch();
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        logstring("game modifier: tier 1 mode");
    } else if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        logstring("game modifier: hardcore mode");
    }
    level.var_dc65c33dfdd9efe8 = getdvarint(@"hash_66c38b5b61297ac1");
    level.diehardmode = getdvarint(@"hash_4a2b3d01a81655a6");
    level.casualscorestreaks = getdvarint(@"hash_a69e3d30bf0c5ff6");
    level.var_7dfad9748480c388 = getdvarint(@"hash_614165a37ac2db61");
    if (!isdefined(level.crankedbombtimer)) {
        level.crankedbombtimer = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_crankedBombTimer"), 0);
    }
    level.supportcranked = ter_op(getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_crankedBombTimer")) > 0, 1, 0);
    if (!level.teambased) {
        level.diehardmode = 0;
    }
    if (level.diehardmode) {
        logstring("game mode: diehard");
    }
    level.matchrules_damagemultiplier = 0;
    level.matchrules_vampirism = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_vampirism"), @"hash_b5e336c86438398c");
    if (level.matchrules_vampirism) {
        level.modifyplayerdamage = &namespace_3e725f3cc58bddd3::gamemodemodifyplayerdamage;
    }
    level.finalkillcamtype = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_killcamType"), @"hash_769d7362e31fdf55");
    if (level.finalkillcamtype == 2) {
        level.skipfinalkillcam = 1;
    }
    if (level.finalkillcamtype == 1 && getdvarint(@"hash_6625c2cb0de90a41", 0) == 0) {
        level.finalkillcamtype = 0;
    }
    level.allowkillstreaks = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allowKillstreaks"), @"hash_eaf0d9c00f9805b6");
    level.roundretainstreaks = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreaks"), @"hash_29a0f7140921aa26");
    level.roundretainstreakprog = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreakProg"), @"hash_3aff5631b3f222a9");
    level.deathretainstreaks = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_deathRetainStreaks"), @"hash_30e6d371dab88960");
    level.allowperks = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allowPerks"), @"hash_e37a87a327aa48ac");
    level.allowsupers = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allowSupers"), @"hash_c3a18965db644b6b");
    level.superfastchargerate = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_superFastChargeRate"), @"hash_7d44bfc04e9b62b9");
    level.superpointsmod = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_superPointsMod"), @"hash_913a338c84e2f2f6");
    level.spawnprotectiontimer = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_spawnProtectionTimer"), @"hash_fbc77dbb0cf44cc7");
    level.lethaldelay = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), @"hash_c85a7135dce00903");
    level.equipmentmatchstartshieldms = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_equipmentMSProtect"), @"hash_9072002890a9a121") * 1000;
    level.magcount = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_magcount"), @"hash_fbde2817a4a94998");
    if (!isdefined(level.practiceround)) {
        level.practiceround = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_practiceRound"), @"hash_3672666b944c115");
    }
    level.postgameexfil = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_postGameExfil"), @"hash_d2de59939486bd5a");
    level.exfilactivetimer = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_exfilActiveTimer"), @"hash_645019bc959ffaf9");
    level.exfilextracttimer = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_exfilExtractTimer"), @"hash_96dd663f32dba868");
    level.useammorestocklocs = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_useAmmoRestockLocs"), @"hash_d7c8c17cb33a48f7");
    level.var_f1f253aee175ff4 = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_agent_kills_killstreak_count"), @"hash_46eaad837c804540");
    level.spectate3rdallowed = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_allow3rdspectate"), @"hash_433ce15d514ef091");
    setdvar(@"hash_4871f220778a4649", level.spectate3rdallowed);
    level.var_7ebad80a50484a39 = getdvarint(@"hash_8d427bce0148af0e", 0) || getgametype() == "conf_v";
    namespace_7db13bdf599e41a6::init();
    if (issubgametype()) {
        checkforsubgametypeoverrides();
    }
    level.minimaponbydefault = (getdvarint(@"hash_2a4effcaf5954d38") != 0 || getdvarint(@"hash_bc802deb1ff2a842") != 0) && !istrue(game["isLaunchChunk"]) && !namespace_36f464722d326bbe::function_21322da268e71c19();
    var_74e69087b1755cc = getgametype();
    level.radarhideshots = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", var_74e69087b1755cc, "_radarHidePings"), @"hash_36d4f05a3801af7b");
    setomnvar("ui_compass_hide_weapon_pings_minimap", level.radarhideshots);
    level.navbarhideshots = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", var_74e69087b1755cc, "_navBarHidePings"), @"hash_9498c88902801ed5");
    setomnvar("ui_compass_hide_weapon_pings_navbar", level.navbarhideshots);
    level.navbarhideenemies = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", var_74e69087b1755cc, "_navBarHideEnemy"), @"hash_cc12cd6acff9b720");
    setomnvar("ui_compass_hide_enemy_navbar", level.navbarhideenemies);
    level.disablesupersprint = getdvarint(@"hash_dfc97948abf22f64");
    level.disablemount = getdvarint(@"hash_215eb9aef94dd47e");
    level.disablebattlechatter = getdvarint(@"hash_b8a0aa5681c2aa39");
    level.disableannouncer = getdvarint(@"hash_94af58bec500b3b9");
    level.scoremod = [];
    level.scoremod["kill"] = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"));
    level.scoremod["death"] = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerDeath"));
    level.scoremod["headshot"] = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsHeadshotBonus"));
    level.scoremod["kskill"] = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKSKill"));
    if (level.practiceround && !isdefined(game["practiceRound"])) {
        game["practiceRound"] = 1;
        level.roundretainstreaks = 0;
        level.roundretainstreakprog = 0;
        level.ignorescoring = 1;
        game["dialog"]["offense_obj"] = "gamestate_practice";
        game["dialog"]["defense_obj"] = "gamestate_practice";
    }
    if (!isdefined(game["gameLength"])) {
        game["gameLength"] = 0;
    }
    if (getdvarint(@"hash_ac31997b109b6bc5", 0) == 1) {
        game["attackers"] = "axis";
        game["defenders"] = "allies";
    }
    setomnvar("ui_match_timer_hidden", 1);
    isarenamap = namespace_36f464722d326bbe::isarenamap();
    if (isarenamap) {
        level.allowkillstreaks = 0;
        level.allowsupers = 0;
        setomnvar("ui_disable_killstreaks", 1);
        setomnvar("ui_disable_fieldupgrades", 1);
    } else {
        setomnvar("ui_disable_killstreaks", 0);
        setomnvar("ui_disable_fieldupgrades", 0);
    }
    level.disablecopycatloadout = 1;
    setomnvar("ui_killcam_copycat", 0);
    namespace_36f464722d326bbe::getlocaleid();
    /#
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>" + level.script);
        println("<unknown string>" + getgametype());
        println("<unknown string>" + namespace_36f464722d326bbe::function_21322da268e71c19());
        println("<unknown string>" + namespace_36f464722d326bbe::function_b2c4b42f9236924());
        println("<unknown string>" + level.diehardmode);
        println("<unknown string>" + getdvarint(@"hash_66c38b5b61297ac1"));
        println("<unknown string>" + getdvarint(@"hash_c00e244ea59d530e"));
        println("<unknown string>" + game["<unknown string>"]);
        println("<unknown string>" + getgametype() + "<unknown string>" + getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>")));
        println("<unknown string>" + getgametype() + "<unknown string>" + getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>")));
        println("<unknown string>" + getgametype() + "<unknown string>" + getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>")));
        println("<unknown string>" + getgametype() + "<unknown string>" + getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>")));
        println("<unknown string>" + getgametype() + "<unknown string>" + getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>")));
        println("<unknown string>" + getgametype() + "<unknown string>" + getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>")));
        println("<unknown string>" + getgametype() + "<unknown string>" + getdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "<unknown string>")));
        println("<unknown string>");
    #/
    level.usestartspawns = 1;
    level thread namespace_75b74605b6915713::infil_init();
    namespace_71eef510d7f364cf::init();
    namespace_3846cfb60b2ef12f::init();
    namespace_bc0abb78a303bb78::init();
    namespace_be1f190b46fee430::init();
    namespace_d9d9691c846bdad7::init();
    namespace_a2c409363d7f24e7::init();
    namespace_2a9588dfac284b77::init();
    namespace_99ac021a7547cae3::init();
    namespace_36f464722d326bbe::initchallengeandeventglobals();
    gametype = getgametype();
    level.var_6706aad138cbc31d = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishDamageLimit"), @"hash_3b51bf9adf9c599");
    level.var_843399bee19793fe = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_ffKickDamageLimit"), @"hash_bd496f8d66908cb0");
    level.maxallowedteamkills = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishLimit"), @"hash_46055360c134e4f6");
    thread namespace_1bb1b009684a30dc::init();
    thread namespace_6d8da2b47f878104::init();
    namespace_72db5b57938f0d6d::function_a92ed2f4c44e5ffa();
    namespace_9bb409deb69fb31d::init();
    namespace_f8065cafc523dba5::initdismembermentlist();
    namespace_36f464722d326bbe::function_ea9801bff6ccf12a();
    thread namespace_1ce798d596a27341::init();
    thread namespace_36f464722d326bbe::game_utility_init();
    thread namespace_35979fbc98ad96b9::init();
    thread namespace_aad14af462a74d08::init();
    level.var_c36a65204e26168e = 1;
    level.var_1fa9e6ecce90d2c2 = 0;
    if (issharedfuncdefined("display_transition", "using_new_transitions")) {
        level.var_1fa9e6ecce90d2c2 = [[ getsharedfunc("display_transition", "using_new_transitions") ]]();
    }
    thread namespace_34eb47d51c422b79::init();
    thread namespace_70d685b02aaee20e::initfinalkillcam();
    namespace_46e942396566f2da::function_3b59b4d385a202e6();
    namespace_944ddf7b8df1b0e3::initstatusdialog();
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        thread namespace_25c5a6f43bb97b43::init();
    } else if (!runleanthreadmode()) {
        thread namespace_25c5a6f43bb97b43::init();
    } else {
        level.battlechatterenabled = 0;
    }
    thread namespace_3bde6869e44a2770::init();
    thread namespace_d19129e4fa5d176::init();
    if (!namespace_cd0b2d039510b38d::runleanthreadmode()) {
        thread namespace_2685ec368e022695::init();
    }
    thread namespace_62c556437da28f50::init();
    thread namespace_7ce6abcc96b367be::init();
    thread namespace_e5ed2f5a5ee8410e::init();
    thread namespace_95fef46456ed271b::init();
    thread namespace_878eaea13c948edc::init();
    thread namespace_3bbb5a98b932c46f::init();
    thread namespace_b903a23a81915f18::init();
    thread namespace_6de0840c25c8dc22::init();
    thread namespace_b984803e2ef247a2::init();
    thread namespace_e072c8407b2a861c::function_6b5e33c2f005f4a6();
    thread namespace_41cb45263e591751::init();
    thread namespace_19b4203b51d56488::init();
    thread namespace_5aeecefc462876::init();
    thread namespace_b2d5aa2baf2b5701::init();
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        thread namespace_5d2a2ec56e561e3::init();
        thread namespace_699c56a9ffbfd9a2::init();
    } else {
        thread namespace_eb72aa155b5e14e7::init();
        thread namespace_be615288a18d4796::init();
    }
    thread namespace_46006c5769c2ac90::init();
    thread namespace_48a08c5037514e04::function_8e9b2e8ba0328e3c();
    thread namespace_99ac021a7547cae3::initsegmentstats();
    if (!runleanthreadmode()) {
        namespace_be1f190b46fee430::registerplayerframeupdatecallback(&namespace_f8065cafc523dba5::updateinputtypewatcher);
    }
    namespace_be1f190b46fee430::registerplayerframeupdatecallback(&namespace_3bbb5a98b932c46f::grenadehealthatdeathframeupdatecallback);
    namespace_bf9ffd2b22c7d819::main();
    thread namespace_8885c19c053dcb46::init();
    if (level.var_ec2fb549b15ad827) {
        namespace_82872106c3e3314d::init();
    }
    if (level.var_77907d733abe8b63) {
        namespace_2c7976a64ea24d6a::init();
    }
    thread namespace_d42f0311f511b910::init();
    thread namespace_b6a8027f477010e1::init();
    namespace_75ccc7a377fd7988::function_a114d6863af2f149();
    if (!istrue(game["isLaunchChunk"])) {
        thread namespace_1f188a13f7e79610::vehicle_init();
        thread namespace_9246f10206f50768::function_7dcad89b9c0264a6();
        thread namespace_30557bca2fe18d4::init();
        thread namespace_b6a8027f477010e1::initspecialistkillstreaks();
    }
    if (!istrue(level.disablescoreevents)) {
        thread namespace_391de535501b0143::function_6e80b5ddded67c23();
    }
    thread namespace_93ae9c099aee8626::init();
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        namespace_e6e035262e5f01a2::init();
    }
    if (!runleanthreadmode()) {
        thread namespace_3357ae493a0ac10f::init();
    }
    thread namespace_627d023f48c9561::init();
    thread namespace_bd0162aedd8c8594::init();
    thread namespace_e77194a0203f683::init();
    thread namespace_30dbbb8647994e6e::init();
    thread namespace_d564b97030b0868::init();
    level namespace_f8d3520d3483c1::init();
    if (!istrue(game["isLaunchChunk"])) {
        if (istrue(level.var_36304cc9071bf738)) {
            thread namespace_38b993c4618e76cd::init();
        }
        thread namespace_3f0ea7483345a2c0::init();
        thread namespace_85d036cb78063c4a::init();
        thread namespace_85d036cb78063c4a::watchsuperdelay();
    }
    thread namespace_8554064ba5e7d07::init();
    thread namespace_7ff762d1c2a7da35::init();
    thread allow_weapon_mp_init();
    thread ismp_init();
    level.players thread function_b782e1ea0877f735();
    thread namespace_46e9069d8502773a::init();
    thread namespace_e44030e132d2f79e::init_mp();
    thread namespace_f446f6030ca8cff8::execution_init();
    thread namespace_6d9917c3dc05dbe9::init();
    thread namespace_5a22b6f3a56f7e9b::init();
    thread namespace_ab403fa2c6c142a4::initarbitraryuptriggers();
    thread namespace_f77f8b2f20f85e34::init();
    if (!istrue(game["isLaunchChunk"])) {
        thread namespace_5b5a9f15cf585890::init();
    }
    thread namespace_1d863a7bbc05fc52::init();
    thread namespace_10260b963310d30e::init();
    thread namespace_1a507865f681850e::init();
    thread namespace_96723478405aa192::init();
    thread namespace_3300a08ae9755a72::init();
    if (getdvarint(@"hash_81a618a6e6973ed3", 0) == 1) {
        thread namespace_144a3b0d146004de::init();
    }
    thread namespace_cefad0e4840165ba::init();
    if (!istrue(game["isLaunchChunk"])) {
        thread namespace_c851aa543ccfe72f::init();
        thread namespace_dbfefbfabc3195f::init();
        thread namespace_d9c77dc2a6fe29c6::initoob();
        thread namespace_f48c22429667eba9::init();
    }
    thread namespace_ab70c875589b8f6a::init();
    thread namespace_f1565a2788ab1e89::triggerutilityinit();
    thread namespace_7bdde15c3500a23f::init();
    if (!istrue(game["isLaunchChunk"])) {
        thread namespace_8e28f8b325a83325::init();
        thread namespace_d7fe36703a9572fe::init();
        thread namespace_68f1873625691c6::init();
        thread namespace_66efdc90612cfc0a::door_dynamic_setup();
        thread namespace_8af839578a30040a::init();
        thread namespace_5a51aa78ea0b1b9f::emp_debuff_init();
        thread namespace_272931699e2fe8e9::function_d8de1e0bc05f3b3a();
    }
    thread namespace_44abc05161e2e2cb::init();
    thread namespace_3fe5772ba4970d56::init();
    level.allowreviveweapons = getdvarint(@"hash_df1ae5a11f519ab5", 0);
    val::function_2d6e7e0b80767910("reviveShoot", [0:"weapon_switch", 1:"offhand_weapons", 2:"gesture", 3:"killstreaks", 4:"supers", 5:"ads", 6:"reload", 7:"autoreload"]);
    val::function_2d6e7e0b80767910("gameEndFreeze", [0:"usability", 1:"ads", 2:"fire", 3:"weapon_switch", 4:"offhand_weapons", 5:"offhand_primary_weapons", 6:"offhand_secondary_weapons", 7:"killstreaks", 8:"supers", 9:"allow_jump", 10:"sprint", 11:"stance_change", 12:"melee"]);
    thread namespace_801bcc0d4eadf9a1::init();
    thread namespace_8d949790b9957051::init();
    thread namespace_9ba985cbac6de93c::init();
    if (getdvarint(@"hash_8a1945c94d5092c2") == 1) {
        namespace_cb965d2f71fefddc::br_pickups_init();
        namespace_c6ccccd95254983f::init();
    }
    level namespace_446fc987a980892f::init();
    level namespace_8be37ac443f7f654::init();
    level thread namespace_f1565a2788ab1e89::function_d7f524cd920e0c79();
    if (level.teambased) {
        foreach (team in level.teamnamelist) {
            if (!isdefined(game["roundsWon"][team])) {
                game["roundsWon"][team] = 0;
            }
            if (!isdefined(game["teamScores"][team])) {
                game["teamScores"][team] = 0;
            }
        }
    }
    if (game["status"] != "overtime" && game["status"] != "halftime") {
        if (!(game["roundsPlayed"] > 0 && ismoddedroundgame()) && resetscoreonroundstart()) {
            game["teamScores"]["allies"] = 0;
            game["teamScores"]["axis"] = 0;
        }
    }
    setomnvar("ui_in_overtime_round", game["status"] == "overtime");
    game["gamestarted"] = 1;
    level.currentround = game["roundsPlayed"] + 1;
    level.maxplayercount = 0;
    level.activeplayers = [];
    foreach (entry in level.teamnamelist) {
        level.wavedelay[entry] = 0;
        level.lastwave[entry] = 0;
        level.waveplayerspawnindex[entry] = 0;
        level.aliveplayers[entry] = [];
        if (!istrue(level.requiredplayercountoveride)) {
            level.requiredplayercount[entry] = 0;
        }
    }
    setomnvar("ui_scorelimit", 0);
    setdvar(@"hash_9995278b4b4099ae", 1);
    if (!istrue(game["isLaunchChunk"])) {
        setomnvar("ui_round_hint_override_attackers", 0);
        setomnvar("ui_round_hint_override_defenders", 0);
    }
    if (getgametypenumlives()) {
        setdvar(@"hash_c6ca3fbc35dd960", 0);
    } else {
        setdvar(@"hash_c6ca3fbc35dd960", 1);
    }
    updatewavespawndelay();
    level.graceperiod = 15;
    level.ingraceperiod = level.graceperiod;
    if (!isdefined(level.roundenddelay)) {
        level.roundenddelay = 6;
    }
    level.playovertime = 0;
    level.finalroundenddelay = 3;
    level.halftimeroundenddelay = 3;
    level.postgamehitmarkerwaittime = 0.25;
    level.scorelimit = getwatcheddvar("scorelimit");
    level.roundlimit = getwatcheddvar("roundlimit");
    level.winlimit = getwatcheddvar("winlimit");
    if (istrue(game["isLaunchChunk"])) {
        setomnvar("ui_current_round", level.currentround);
    } else if (level.roundlimit != 1) {
        setomnvar("ui_current_round", level.currentround);
    }
    if (level.scorelimit == 1) {
        level.roundscorelimit = 1;
        level.totalscorelimit = level.winlimit;
    } else {
        level.roundscorelimit = level.scorelimit * (game["roundsPlayed"] + 1);
        level.totalscorelimit = level.scorelimit * level.roundlimit;
    }
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 1) {
        namespace_78664ff0ec715b75::function_bc001c2ebd383fff();
    }
    if (resetscoreonroundstart()) {
        level.roundscorelimit = level.scorelimit;
        level.totalscorelimit = level.scorelimit;
        game["teamScores"][game["attackers"]] = 0;
        setteamscore(game["attackers"], 0);
        game["teamScores"][game["defenders"]] = 0;
        setteamscore(game["defenders"], 0);
    }
    if (isovertimesupportedgametype() && inovertime()) {
        namespace_e8a49b70d0769b66::updateovertimescore();
    }
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            namespace_e8a49b70d0769b66::updateteamscore(entry);
        }
    }
    thread updateuiscorelimit();
    level notify("update_scorelimit");
    if (isdefined(level.matchrecording_init)) {
        level thread [[ level.matchrecording_init ]]();
    }
    if (getdvarint(@"hash_8dd1d0af528859be", 0) == 0 || function_1e098780c33853f2() && getgametype() != "war_snipers" && getgametype() != "dom_snipers") {
        setomnvar("ui_only_default_loadouts", 1);
    }
    namespace_310ba947928891df::function_3149b2e03ce13dd9();
    [[ level.onstartgametype ]]();
    level namespace_3c37cb17ade254d::flag_set("onStartGameTypeFinished");
    if (isdefined(level.var_952bd6e10104d8a)) {
        if (getdvarint(@"hash_7a6c6ee4d8db3bbd", 0) == 0) {
            [[ level.var_952bd6e10104d8a ]]();
        }
    }
    function_75092ad1ff9da748();
    level thread namespace_310ba947928891df::onplayerconnectcommon();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&namespace_310ba947928891df::onplayerdisconnectcommon);
    level.scorepercentagecutoff = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_score_percentage_cut_off"), 70);
    level.timepercentagecutoff = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_time_percentage_cut_off"), 70);
    /#
        setdvarifuninitialized(@"hash_ff657c87711b0cd6", 1);
        if (getdvarint(@"hash_ff657c87711b0cd6", 1)) {
            level.scorepercentagecutoff = 100;
            level.timepercentagecutoff = 100;
        }
    #/
    /#
        thread [[ level.var_265ab5777a0770aa ]]();
    #/
    level thread namespace_f735e08357a3310b::function_9030ff462f3daa1a();
    if (getdvar(@"hash_8588ca386dbff67") == "dedicated LAN server" || getdvar(@"hash_8588ca386dbff67") == "dedicated internet server") {
        thread verifydedicatedconfiguration();
    }
    namespace_f5675568ccc8acc6::function_6fc852802774b304(0, 0);
    thread startgame();
    level thread updatewatcheddvars();
    if (!istrue(level.istacops)) {
        level thread timelimitthread();
    }
    level thread updateleaderboardstatscontinuous();
    level thread removepatchablecollision_delayed();
    level namespace_3c37cb17ade254d::flag_set("StartGameTypeCallbackFinished");
    if (isfirstround()) {
        level thread function_236fb1c819bcd1f();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0c9
// Size: 0x2b
function function_236fb1c819bcd1f() {
    if (getdvarint(@"hash_830d682c147b23bb", 0) > 0) {
        level waittill("telemetry_init");
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_server_start");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0fb
// Size: 0x1f9
function updatewavespawndelay(var_932972ebb2dfef2b, var_ab1e2d0bc30658b0) {
    if (isdefined(var_932972ebb2dfef2b)) {
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay"), var_932972ebb2dfef2b);
    }
    if (isdefined(var_ab1e2d0bc30658b0)) {
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay_alt"), var_ab1e2d0bc30658b0);
    }
    wavedelay = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay"));
    var_4a995b19cb008113 = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay_alt"));
    var_26eec74e639ec81d = isdefined(level.var_567ac33c91cda90a) && level.var_567ac33c91cda90a == 1;
    if (wavedelay || var_26eec74e639ec81d) {
        if (!var_26eec74e639ec81d) {
            foreach (entry in level.teamnamelist) {
                level.wavedelay[entry] = wavedelay;
                level.lastwave[entry] = 0;
            }
        } else {
            if (!istrue(game["switchedsides"])) {
                level.wavedelay[game["attackers"]] = level.var_14fbf4f9c4db773c;
                level.wavedelay[game["defenders"]] = level.var_6ae9b718b9d76d70;
            } else {
                level.wavedelay[game["attackers"]] = level.var_6ae9b718b9d76d70;
                level.wavedelay[game["defenders"]] = level.var_14fbf4f9c4db773c;
            }
            level.lastwave[game["attackers"]] = 0;
            level.lastwave[game["defenders"]] = 0;
        }
        level thread namespace_d576b6dc7cef9c62::wavespawntimer();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2fb
// Size: 0x6a
function verifydedicatedconfiguration() {
    for (;;) {
        for (;;) {
            if (level.rankedmatch) {
                exitlevel(0);
            }
            if (!getdvarint(@"hash_485ef1ed1d39d3a3")) {
                exitlevel(0);
            }
            if (getdvar(@"hash_8588ca386dbff67") != "dedicated LAN server" && getdvar(@"hash_8588ca386dbff67") != "dedicated internet server") {
                exitlevel(0);
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf36c
// Size: 0x6f
function timelimitthread() {
    level endon("game_ended");
    var_f177bc3f3b9e94b1 = gettimepassed();
    while (game["state"] == "playing") {
        waittillframeend();
        thread checktimelimit(var_f177bc3f3b9e94b1);
        var_f177bc3f3b9e94b1 = gettimepassed();
        if (isdefined(level.starttime)) {
            if (gettimeremaining() < 3000 || istrue(level.forceotlogictorun)) {
                waitframe();
                continue;
            }
        }
        wait(1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3e2
// Size: 0x271
function updateuiscorelimit() {
    for (;;) {
        level waittill_either("update_scorelimit", "update_winlimit");
        if (inovertime() || intimetobeat()) {
            if (istimetobeatrulegametype()) {
                foreach (player in level.players) {
                    player setclientomnvar("ui_friendly_time_to_beat", ter_op(player.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    player setclientomnvar("ui_enemy_time_to_beat", ter_op(player.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                }
                setomnvar("ui_scorelimit", ter_op(istimetobeatvalid(), game["timeToBeatScore"], 1));
            } else if (isscoretobeatrulegametype()) {
                foreach (player in level.players) {
                    player setclientomnvar("ui_friendly_time_to_beat", ter_op(player.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    player setclientomnvar("ui_enemy_time_to_beat", ter_op(player.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                }
                setomnvar("ui_scorelimit", ter_op(istimetobeatvalid(), game["timeToBeatScore"], 1));
            } else if (iswinbytworulegametype()) {
                var_a7f1a64a712bc7cc = game["roundsWon"][game["defenders"]];
                var_2a6a46646c25a5a8 = game["roundsWon"][game["attackers"]];
                var_882b7ad682ff97ce = 0;
                if (var_a7f1a64a712bc7cc == var_2a6a46646c25a5a8) {
                    var_882b7ad682ff97ce = var_a7f1a64a712bc7cc + 2;
                } else if (var_a7f1a64a712bc7cc > var_2a6a46646c25a5a8) {
                    var_882b7ad682ff97ce = var_a7f1a64a712bc7cc + 1;
                } else {
                    var_882b7ad682ff97ce = var_2a6a46646c25a5a8 + 1;
                }
                setomnvar("ui_scorelimit", var_882b7ad682ff97ce);
            } else {
                usenormalscorelimit();
            }
        } else {
            usenormalscorelimit();
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf65a
// Size: 0x74
function usenormalscorelimit() {
    if ((!isroundbased() || !isobjectivebased() || ismoddedroundgame()) && getgametype() != "rescue" && getgametype() != "ballmode") {
        setomnvar("ui_scorelimit", level.totalscorelimit);
        thread checkscorelimit();
    } else {
        setomnvar("ui_scorelimit", level.winlimit);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6d5
// Size: 0xbe
function playtickingsound() {
    self endon("death");
    self endon("stop_ticking");
    level endon("game_ended");
    time = level.bombtimer;
    if (isdefined(level.defusetime)) {
        var_e5c7562119f14dc3 = level.defusetime + 1;
    } else {
        var_e5c7562119f14dc3 = 6;
    }
    while (1) {
        if (time > 15) {
            self playsound("ui_mp_suitcasebomb_timer");
            time = time - 1;
            wait(1);
        } else if (time > var_e5c7562119f14dc3) {
            self playsound("ui_mp_suitcasebomb_timer_urgent");
            time = time - 1;
            wait(1);
        } else {
            self playsound("ui_mp_timer_countdown_half_sec");
            time = time - 0.5;
            wait(0.5);
        }
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf79a
// Size: 0xb
function stoptickingsound() {
    self notify("stop_ticking");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7ac
// Size: 0x55
function getclocksoundaliasfortimeleft(timeleft) {
    if (timeleft > 20) {
        return "ui_mp_timer_countdown";
    } else if (timeleft > 10) {
        return "ui_mp_timer_countdown_10";
    } else if (timeleft > 5) {
        return "ui_mp_timer_countdown_half_sec";
    } else if (timeleft > 1.5) {
        return "ui_mp_timer_countdown_quarter_sec";
    } else {
        return "ui_mp_timer_countdown_1";
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf808
// Size: 0x2b2
function timelimitclock() {
    level endon("cancel_announcer_dialog");
    waitframe();
    if (gettimelimit() == 0) {
        return;
    }
    if (istrue(level.var_92b187a00d3dd091)) {
        return;
    }
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    var_98f7893e84443025 = 0;
    var_3117f65f501d4162 = 0;
    var_dd0b8fe8f045aa9f = 0;
    if (namespace_36f464722d326bbe::function_a3a69db84e39e0b8()) {
        var_98f7893e84443025 = 1;
    }
    var_70e5d40612c9c78a = ter_op(isanymlgmatch(), 5, 2);
    while (game["state"] == "playing") {
        if (!level.timerstopped && gettimelimit() && !istrue(level.bombsplanted) && !istrue(level.var_423b7147b1256abd) && !istrue(level.var_d50739af5c160f54)) {
            timeleft = gettimeremaining() / 1000;
            timeleftint = int(timeleft + 0.5);
            var_a8088865fd3efd6d = 0;
            if (var_70e5d40612c9c78a == 2 && timeleftint % 2 == 1) {
                var_a8088865fd3efd6d = 1;
            }
            if (!var_98f7893e84443025 && (var_a8088865fd3efd6d == 1 && timeleftint == 61 || var_a8088865fd3efd6d == 0 && timeleftint == 60)) {
                level namespace_3bde6869e44a2770::matchendingsoonleaderdialog("timesup_sixty");
                level notify("match_ending_soon", "time");
                var_98f7893e84443025 = 1;
            } else if (!var_3117f65f501d4162 && (var_a8088865fd3efd6d == 1 && timeleftint == 31 || var_a8088865fd3efd6d == 0 && timeleftint == 30)) {
                level namespace_3bde6869e44a2770::matchendingsoonleaderdialog("timesup_thirty");
                level notify("match_ending_soon", "time");
                var_3117f65f501d4162 = 1;
            } else if (!var_dd0b8fe8f045aa9f) {
                if (var_a8088865fd3efd6d == 1 && timeleftint == 11 || var_a8088865fd3efd6d == 0 && timeleftint == 10) {
                    level namespace_3bde6869e44a2770::matchendingsoonleaderdialog("timesup_ten");
                    var_dd0b8fe8f045aa9f = 1;
                } else if (var_a8088865fd3efd6d == 1 && timeleftint <= 2 || var_a8088865fd3efd6d == 0 && timeleftint <= 1) {
                    level namespace_3bde6869e44a2770::matchendingsoonleaderdialog("timesup");
                    var_dd0b8fe8f045aa9f = 1;
                }
            }
            if (timeleftint <= 10 || timeleftint <= 30 && timeleftint % var_70e5d40612c9c78a == var_a8088865fd3efd6d) {
                level notify("match_ending_very_soon");
                if (timeleftint == 0) {
                    break;
                }
                if (!isdefined(level.overridetimelimitclock) || level.overridetimelimitclock >= timeleftint) {
                    var_14ccd6e81fce3bd4 = getclocksoundaliasfortimeleft(timeleft);
                    clockobject playsound(var_14ccd6e81fce3bd4);
                }
            }
            if (timeleft - floor(timeleft) >= 0.05) {
                wait(timeleft - floor(timeleft));
                continue;
            }
        }
        wait(1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfac1
// Size: 0x46
function shouldmodelognotify() {
    switch (getgametype()) {
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_fa50b0f6bd82e972":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb0e
// Size: 0x1d8
function gametimer() {
    level endon("game_ended");
    if (isdefined(game["startTimeFromMatchStart"])) {
        level.starttimefrommatchstart = game["startTimeFromMatchStart"];
    }
    if (function_3b6961b424a382f() && getdvarint(@"hash_49bbeacaa2e89deb", 0) != 0) {
        level.discardtime = 0;
    }
    level waittill("prematch_over");
    level.starttime = gettime();
    level.discardtime = 0;
    level.overtimetotal = 0;
    if (!isdefined(game["startTimeFromMatchStart"])) {
        game["startTimeFromMatchStart"] = gettime();
        level.starttimefrommatchstart = gettime();
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_match_start");
    }
    if (isdefined(game["roundMillisecondsAlreadyPassed"])) {
        level.starttime = level.starttime - game["roundMillisecondsAlreadyPassed"];
        game["roundMillisecondsAlreadyPassed"] = undefined;
    }
    if (game["roundsPlayed"] < 24) {
        setmatchdata("utcRoundStartTimeSeconds", game["roundsPlayed"], getsystemtime());
        if (namespace_36f464722d326bbe::function_d04af493b6e718ac()) {
            setomnvar("ui_round_start_time", getsystemtime());
        }
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_round_start");
    if (namespace_de6e6777b0937bd7::function_9ce94b15ee6758ee("callback_player_round_start")) {
        foreach (player in level.players) {
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_round_start", player);
        }
    }
    prevtime = gettime();
    while (game["state"] == "playing") {
        if (!level.timerstopped) {
            game["timePassed"] = game["timePassed"] + gettime() - prevtime;
        }
        prevtime = gettime();
        wait(1);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfced
// Size: 0x117
function updatetimerpausedness(var_5a6706a7ded54bda) {
    shouldbestopped = level.timerstoppedforgamemode || isdefined(level.hostmigrationtimer);
    if (!level.timerstopped && shouldbestopped) {
        level.timerstopped = 1;
        level.timerpausetime = gettime();
        timeleft = gettimeremaining();
        if (isdefined(var_5a6706a7ded54bda)) {
            setgameendtime(int(var_5a6706a7ded54bda));
        } else {
            setgameendtime(gettime() + int(timeleft));
        }
        setomnvar("ui_match_timer_stopped", 1);
    } else if (level.timerstopped && !shouldbestopped) {
        level.timerstopped = 0;
        level.discardtime = level.discardtime + gettime() - level.timerpausetime;
        timeleft = gettimeremaining();
        if (isdefined(var_5a6706a7ded54bda)) {
            setgameendtime(int(var_5a6706a7ded54bda));
        } else {
            setgameendtime(gettime() + int(timeleft));
        }
        setomnvar("ui_match_timer_stopped", 0);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe0b
// Size: 0x2b
function pausetimer(var_e0968d887a942520) {
    if (!level.timerstoppedforgamemode) {
        level.timerstoppedforgamemode = 1;
        updatetimerpausedness(var_e0968d887a942520);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe3d
// Size: 0x2a
function resumetimer(var_e0968d887a942520) {
    if (level.timerstoppedforgamemode) {
        level.timerstoppedforgamemode = 0;
        updatetimerpausedness(var_e0968d887a942520);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe6e
// Size: 0x1ab
function startgame() {
    setslowmotion(1, 1, 0);
    thread gametimer();
    level.timerstopped = 0;
    level.timerstoppedforgamemode = 0;
    setomnvar("ui_prematch_period", 1);
    prematchperiod();
    sysprint("Ready for Compass");
    thread namespace_bd0162aedd8c8594::logevent_sendplayerindexdata();
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_prematch_over");
    namespace_4b0406965e556711::gameflagset("prematch_done");
    level notify("prematch_over");
    setomnvar("ui_prematch_period", 0);
    level.var_5fbdcf40b68612a5 = gettime();
    foreach (player in level.players) {
        player namespace_3e725f3cc58bddd3::resetattackerlist();
    }
    if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
        logstring("IWH-315293: ELECTRICEEL: Prematch done");
    }
    updatetimerpausedness();
    timelimit = gettimelimit();
    if (timelimit > 0 && !namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        level thread waitthenshowtimer();
    } else {
        setomnvar("ui_match_timer_hidden", 1);
    }
    cleanpatchablecollision();
    thread timelimitclock();
    thread graceperiod();
    thread namespace_aad14af462a74d08::roundbegin();
    if (getdvarint(@"hash_818c699a5caaee4f", 0) > 30) {
        setdvar(@"hash_a85ba82ffd9faefe", 1);
    }
    thread namespace_bd0162aedd8c8594::recordbreadcrumbdata();
    if (getdvarint(@"hash_2745598e35a47913") == 1) {
        thread namespace_f5675568ccc8acc6::function_b6fd5f72a2973c10();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10020
// Size: 0x22
function waitthenshowtimer() {
    setomnvar("ui_match_timer_hidden", 1);
    wait(0.25);
    setomnvar("ui_match_timer_hidden", 0);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10049
// Size: 0x2b7
function cleanpatchablecollision() {
    patch = [];
    patch[0] = getent("clip32x32x8", "targetname");
    patch[1] = getent("clip32x32x128", "targetname");
    patch[2] = getent("clip64x64x256", "targetname");
    patch[3] = getent("clip32x32x32", "targetname");
    patch[4] = getent("clip64x64x128", "targetname");
    patch[5] = getent("clip64x64x64", "targetname");
    patch[6] = getent("clip64x64x8", "targetname");
    patch[7] = getent("clip128x128x256", "targetname");
    patch[8] = getent("clip128x128x128", "targetname");
    patch[9] = getent("clip128x128x8", "targetname");
    patch[10] = getent("clip256x256x256", "targetname");
    patch[11] = getent("clip256x256x128", "targetname");
    patch[12] = getent("clip256x256x8", "targetname");
    patch[13] = getent("clip512x512x8", "targetname");
    patch[14] = getent("clip32x32x256", "targetname");
    patch[15] = getent("player32x32x8", "targetname");
    patch[16] = getent("player32x32x32", "targetname");
    patch[17] = getent("player32x32x128", "targetname");
    patch[18] = getent("player32x32x256", "targetname");
    patch[19] = getent("player64x64x256", "targetname");
    patch[20] = getent("player64x64x128", "targetname");
    patch[21] = getent("player64x64x64", "targetname");
    patch[22] = getent("player64x64x8", "targetname");
    patch[23] = getent("player128x128x256", "targetname");
    patch[24] = getent("player128x128x128", "targetname");
    patch[25] = getent("player128x128x8", "targetname");
    patch[26] = getent("player256x256x256", "targetname");
    patch[27] = getent("player256x256x128", "targetname");
    patch[28] = getent("player256x256x8", "targetname");
    patch[29] = getent("player512x512x8", "targetname");
    foreach (p in patch) {
        if (isdefined(p)) {
            p delete();
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10307
// Size: 0xce
function wavespawntimer() {
    level endon("game_ended");
    level notify("waveSpawnTimer");
    level endon("waveSpawnTimer");
    while (game["state"] == "playing") {
        time = gettime();
        foreach (entry in level.teamnamelist) {
            if (time - level.lastwave[entry] > level.wavedelay[entry] * 1000) {
                level notify("wave_respawn_" + entry);
                level.lastwave[entry] = time;
                level.waveplayerspawnindex[entry] = 0;
            }
        }
        waitframe();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103dc
// Size: 0x47
function wavetimerwatcher() {
    level endon("waveSpawnTimer");
    while (1) {
        waittill_any_2("wave_respawn_allies", "wave_respawn_axis");
        setomnvar("ui_hardpoint_timer", gettime() + 1000 * level.wavedelay["allies"]);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1042a
// Size: 0x241
function getbetterteam() {
    kills = [];
    deaths = [];
    foreach (entry in level.teamnamelist) {
        kills[entry] = 0;
        deaths[entry] = 0;
    }
    foreach (player in level.players) {
        team = player namespace_3c5a4254f2b957ea::getpersstat("team");
        if (isdefined(team) && isgameplayteam(team)) {
            kills[team] = kills[team] + player.kills;
            deaths[team] = deaths[team] + player.deaths;
        }
    }
    var_54401ff0f381643a = undefined;
    var_26dab44600e577c2 = undefined;
    var_eef1f945d8b0c9fd = 0;
    var_8a05eaa536fb112 = undefined;
    var_8637b9eeda41c9a = undefined;
    var_b788609f6e686a95 = 0;
    foreach (entry in level.teamnamelist) {
        killcount = kills[entry];
        if (!isdefined(var_54401ff0f381643a) || killcount > var_54401ff0f381643a) {
            var_54401ff0f381643a = killcount;
            var_26dab44600e577c2 = entry;
            var_eef1f945d8b0c9fd = 0;
        } else if (var_54401ff0f381643a == killcount) {
            var_eef1f945d8b0c9fd = 1;
        }
        deathcount = deaths[entry];
        if (!isdefined(var_8a05eaa536fb112) || deathcount < var_8a05eaa536fb112) {
            var_8a05eaa536fb112 = deathcount;
            var_8637b9eeda41c9a = entry;
            var_b788609f6e686a95 = 0;
        } else if (var_8a05eaa536fb112 == deathcount) {
            var_b788609f6e686a95 = 1;
        }
    }
    if (!var_eef1f945d8b0c9fd) {
        return var_26dab44600e577c2;
    }
    if (!var_b788609f6e686a95) {
        return var_8637b9eeda41c9a;
    }
    var_7be710153f5d3671 = randomint(level.teamnamelist.size);
    return level.teamnamelist[var_7be710153f5d3671];
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10673
// Size: 0x49
function rankedmatchupdates(winner) {
    if (matchmakinggame()) {
        setxenonranks();
        if (hostidledout()) {
            level.hostforcedend = 1;
            logstring("host idled out");
            endlobby();
        }
    }
    updatewinlossstats(winner);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106c3
// Size: 0x193
function displayroundend(winner, endreasontext, var_656b99fc50e799ae) {
    thread namespace_3bde6869e44a2770::round_end_music(winner, endreasontext, var_656b99fc50e799ae);
    if (istrue(level.var_ee656bfaf5da1c13)) {
        thread function_90b7bf366e1e6be9(winner);
    }
    if (!level.doeomcombat && ismoddedroundgame() && game["finalRound"] == 0) {
        winner = "roundend";
    }
    level.roundendextramessage = 0;
    if (!waslastround() && getgametype() == "arena" && !istrue(game["practiceRound"])) {
        if (checkroundswitch(level.playovertime)) {
            level.roundendextramessage = game["round_end_exmsg"]["switching_sides"];
        }
    }
    if (waslastround() && iswinbytworulegametype() && function_2f1b2a4a64257bea()) {
        winner = "tie";
        endreasontext = game["end_reason"]["win_by_two_tie"];
        var_656b99fc50e799ae = game["end_reason"]["win_by_two_tie"];
    }
    foreach (player in level.players) {
        if (isalive(player)) {
            player thread namespace_3bbb5a98b932c46f::savealtstates();
        }
        if (level.teambased) {
            player thread namespace_44abc05161e2e2cb::teamoutcomenotify(winner, 1, endreasontext, var_656b99fc50e799ae, level.roundendextramessage);
        } else {
            player thread namespace_44abc05161e2e2cb::outcomenotify(winner, endreasontext, var_656b99fc50e799ae);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1085d
// Size: 0xe0
function displaygameend(winner, endreasontext, var_656b99fc50e799ae) {
    setomnvar("ui_match_over", 1);
    if (waslastround() && iswinbytworulegametype() && function_2f1b2a4a64257bea()) {
        winner = "tie";
        endreasontext = game["end_reason"]["win_by_two_tie"];
        var_656b99fc50e799ae = game["end_reason"]["win_by_two_tie"];
    }
    foreach (player in level.players) {
        if (level.teambased) {
            player thread namespace_44abc05161e2e2cb::teamoutcomenotify(winner, 0, endreasontext, var_656b99fc50e799ae);
        } else {
            player thread namespace_44abc05161e2e2cb::outcomenotify(winner, endreasontext, var_656b99fc50e799ae);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10944
// Size: 0x89
function function_90b7bf366e1e6be9(winner) {
    if (winner == game["attackers"] && isdefined(level.var_fcb88e09334f2385)) {
        namespace_e688cd9db0404268::function_f1aed36ab4598ea(level.var_fcb88e09334f2385);
        wait(45);
        namespace_e688cd9db0404268::function_f4e0ff5cb899686d(level.var_fcb88e09334f2385);
    } else if (winner == game["defenders"] && isdefined(level.var_587955703c59a8a5)) {
        namespace_e688cd9db0404268::function_f1aed36ab4598ea(level.var_587955703c59a8a5);
        wait(45);
        namespace_e688cd9db0404268::function_f4e0ff5cb899686d(level.var_587955703c59a8a5);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109d4
// Size: 0x2d8
function displayroundswitch() {
    level notify("spawning_intermission");
    var_d8cb902ebfc7b2a2 = getintermissionspawnpointoverride();
    foreach (player in level.players) {
        player thread namespace_99ac021a7547cae3::spawnintermission(var_d8cb902ebfc7b2a2);
    }
    switchtype = level.halftimetype;
    if (switchtype == "halftime") {
        if (level.roundlimit) {
            if (game["roundsPlayed"] * 2 == level.roundlimit) {
                switchtype = "halftime";
            } else {
                switchtype = "intermission";
            }
        } else {
            switchtype = "intermission";
        }
    }
    level notify("round_switch", switchtype);
    endreason = 0;
    if (game["finalRound"] == 1) {
        switchtype = "final_round";
    } else if (game["matchPoint"] == 1) {
        switchtype = "match_point";
        if (iswinbytworulegametype() && game["roundsWon"]["allies"] == game["roundsWon"]["axis"]) {
            switchtype = "win_by_two";
        }
    }
    if (isdefined(level.switchedsides)) {
        endreason = game["end_reason"]["switching_sides"];
        level.roundendextramessage = 0;
        if (switchtype != "final_round" && switchtype != "match_point") {
            switchtype = "switching_sides";
        }
    }
    foreach (player in level.players) {
        player thread namespace_44abc05161e2e2cb::teamoutcomenotify(switchtype, 1, endreason, endreason, level.roundendextramessage);
    }
    if (switchtype == "final_round" && function_60bf8d82001fc22c() == "control") {
        roundendwait(level.roundenddelay);
        wait(level.postgamehitmarkerwaittime);
        var_eca75127d562ae19 = namespace_7a8c259516666df3::function_287623bbb15154be();
        reason = var_eca75127d562ae19[1];
        var_2e912abc2c41e4da = var_eca75127d562ae19[0];
        var_516add8de56dd7c4 = ter_op(var_2e912abc2c41e4da == "axis", 1, 0);
        setomnvar("ui_control_axis_defending", var_516add8de56dd7c4);
        foreach (player in level.players) {
            player thread namespace_44abc05161e2e2cb::teamoutcomenotify("switching_sides", 1, reason, reason, 0);
        }
    }
    roundendwait(level.halftimeroundenddelay);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cb3
// Size: 0x192
function freezeallplayers(delay, var_8c7ca5de1b4ed9a8, var_7e99ec33d27a716e, var_a977282059392b6) {
    if (!isdefined(delay)) {
        delay = 0;
    }
    if (!isdefined(var_a977282059392b6)) {
        var_a977282059392b6 = 0;
    }
    if (delay > 0 && var_a977282059392b6) {
        thread slowmotionendofgame(delay);
    }
    thread sendgameendedfrozennotify(delay);
    foreach (player in level.players) {
        player enableplayerbreathsystem(0);
        player thread freezeplayerforroundend(delay);
        player thread roundenddof(4);
        player freegameplayhudelems();
        player setclientdvars(@"hash_cc2997fd2acb23e0", 1, @"hash_9cb529b37532dcc4", 0);
        if (isdefined(var_8c7ca5de1b4ed9a8) && isdefined(var_7e99ec33d27a716e)) {
            if (var_8c7ca5de1b4ed9a8 == @"hash_682a9bc40f96ca4a" && player issplitscreenplayer()) {
                player setclientdvars(var_8c7ca5de1b4ed9a8, 0.75);
            }
            player setclientdvars(var_8c7ca5de1b4ed9a8, var_7e99ec33d27a716e);
        }
    }
    if (isdefined(level.agentarray)) {
        foreach (agent in level.agentarray) {
            agent _freezecontrols(1, undefined, "freezeAllPlayers");
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4c
// Size: 0x2a
function endofroundvisionset(delay) {
    if (isdefined(delay) && delay > 0) {
        wait(delay);
    }
    visionsetfadetoblack("bw", 0.75);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e7d
// Size: 0x41
function slowmotionendofgame(delay) {
    setslowmotion(1, 0.4, delay);
    setendofroundsoundtimescalefactor();
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(delay);
    setslowmotion(1, 1, 0);
    resetsoundtimescalefactor();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ec5
// Size: 0x30
function setendofroundsoundtimescalefactor() {
    if (!isdefined(level.endround_timescalefactor)) {
        soundsettimescalefactorfromtable("end_of_round");
        level.endround_timescalefactor = 1;
        level.reset_timescalefactor = undefined;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10efc
// Size: 0x43
function resetsoundtimescalefactor() {
    if (!isdefined(level.reset_timescalefactor)) {
        soundsettimescalefactorfromtable("reset");
        level.endround_timescalefactor = undefined;
        level.nukeinfo.var_6d77c28b2dbed93d = undefined;
        level.reset_timescalefactor = 1;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f46
// Size: 0x16
function sendgameendedfrozennotify(delay) {
    wait(delay);
    level notify("game_ended_frozen");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f63
// Size: 0x97
function restart() {
    foreach (player in level.players) {
        player thread setuipostgamefade(1);
    }
    wait(0.5);
    if (isdefined(level.onmaprestart)) {
        [[ level.onmaprestart ]]();
    }
    level notify("restarting");
    game["state"] = "playing";
    map_restart(1);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11001
// Size: 0xbb
function function_52dde37b8fcf63ff() {
    if (!function_6b9f8406e6153597()) {
        return;
    }
    summary = spawnstruct();
    summary.var_20698198296b24ae = gettimepassed();
    function_7a37f9bab9677061(summary);
    foreach (player in level.players) {
        if (!isplayer(player) || isbot(player)) {
            continue;
        }
        playerstats = namespace_99ac021a7547cae3::function_358a3ae71b7d1935(player);
        if (!isdefined(playerstats)) {
            continue;
        }
        player function_fe84f716b4611373(playerstats);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110c3
// Size: 0xaa
function endgame(winner, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b) {
    if (isdefined(level.var_dbf03354f99ebab2)) {
        var_8e75e25718adee6d = [[ level.var_dbf03354f99ebab2 ]]();
        if (istrue(var_8e75e25718adee6d)) {
            return;
        }
    }
    level notify("start_game_ended");
    level.var_3940d363b8fb58c3 = winner;
    if (isdefined(level.modescorewinner)) {
        winner = level.modescorewinner;
    }
    if (isdefined(level.endgame)) {
        [[ level.endgame ]](winner, endreasontext, nukedetonated);
    } else {
        endgame_regularmp(winner, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11174
// Size: 0x62d
function endgame_regularmp(winner, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b, var_2f96189808d67a6b) {
    if (!isdefined(nukedetonated)) {
        nukedetonated = 0;
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType() && level.gameended) {
        return;
    }
    if (game["roundsPlayed"] < 24) {
        setmatchdata("utcRoundEndTimeSeconds", game["roundsPlayed"], getsystemtime());
    }
    if (namespace_36f464722d326bbe::function_d04af493b6e718ac()) {
        setomnvar("ui_round_end_time", getsystemtime());
    }
    utility::trycall(level.matchdata_onroundend);
    level.var_cc2c79de99db62c = 1;
    var_24b6a4267aacb19f = 0;
    if (level.hostforcedend || level.forcedend) {
        var_24b6a4267aacb19f = 1;
    }
    if (inovertime()) {
        if (game["overtimeRoundsPlayed"] == 0) {
            setmatchdata("firstOvertimeRoundIndex", game["roundsPlayed"]);
        }
        if (!var_24b6a4267aacb19f) {
            game["overtimeRoundsPlayed"]++;
        }
    }
    if (level.teambased) {
        if (isgameplayteam(winner)) {
            if (!var_24b6a4267aacb19f) {
                if (isdefined(var_8e4a26ed257a393b)) {
                    game["roundsWon"][winner] = game["roundsWon"][winner] + var_8e4a26ed257a393b;
                } else {
                    game["roundsWon"][winner]++;
                }
            }
            if (!isdefined(level.finalkillcam_winner)) {
                level.finalkillcam_winner = winner;
            }
        } else {
            if (!var_24b6a4267aacb19f && isdefined(winner) && winner == "tie" && shouldmodescoreonties()) {
                foreach (entry in level.teamnamelist) {
                    if (isdefined(var_2f96189808d67a6b) && isarray(var_2f96189808d67a6b) && isdefined(var_2f96189808d67a6b[entry])) {
                        game["roundsWon"][entry] = game["roundsWon"][entry] + var_2f96189808d67a6b[entry];
                    } else {
                        game["roundsWon"][entry]++;
                    }
                }
            }
            if (!isdefined(level.finalkillcam_winner)) {
                level.finalkillcam_winner = "none";
            }
        }
        if (!istrue(game["practiceRound"])) {
            foreach (entry in level.teamnamelist) {
                namespace_e8a49b70d0769b66::updateteamscore(entry);
            }
            if (isroundbased() && game["roundsPlayed"] < 24 && function_60bf8d82001fc22c() != "koth") {
                setmatchdata("alliesRoundScore", game["roundsPlayed"], getteamscore("allies"));
                setmatchdata("axisRoundScore", game["roundsPlayed"], getteamscore("axis"));
            }
        }
    } else {
        if (isdefined(winner) && isplayer(winner) && !var_24b6a4267aacb19f) {
            game["roundsWon"][winner.guid]++;
        }
        if (!isdefined(level.finalkillcam_winner)) {
            if (!isdefined(winner) || isstring(winner) && (winner == "tie" || winner == "none")) {
                level.finalkillcam_winner = "none";
            } else {
                level.finalkillcam_winner = winner.guid;
            }
        }
    }
    namespace_e8a49b70d0769b66::updateplacement();
    if (!var_24b6a4267aacb19f) {
        game["roundsPlayed"]++;
    }
    level.playovertime = shouldplayovertime();
    if (nextroundisfinalround()) {
        game["finalRound"] = 1;
    } else if (nextroundismatchpoint()) {
        game["matchPoint"] = 1;
    }
    if (isdefined(winner) && waslastround()) {
        winner = checkmodeoverridetie(winner);
    }
    level.ctfnukeended = istrue(nukedetonated) && getgametype() == "ctf";
    if (isdefined(winner) && level.ctfnukeended) {
        otherteam = ter_op(winner == "allies", "axis", "allies");
        game["roundsWon"][winner] = 1;
        game["roundsWon"][otherteam] = 0;
        game["teamScores"][winner] = 1;
        game["teamScores"][otherteam] = 0;
        setteamscore(winner, 1);
        setteamscore(otherteam, 0);
    }
    if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
        if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
            function_4c6436a7855aacd();
        }
    }
    updatematchbonusscores(winner);
    if (wasonlyround() || waslastround()) {
        foreach (player in level.players) {
            player namespace_6b49ddb858f34366::function_adcb155953291ec7(undefined, 1);
            player namespace_36f464722d326bbe::stopkeyearning(winner);
        }
    }
    if (level.var_1fa9e6ecce90d2c2) {
        var_fb23f88e5b048669 = endgame_endround(winner, endreasontext, var_656b99fc50e799ae, nukedetonated);
    } else {
        var_fb23f88e5b048669 = function_968a297e2b343c7c(winner, endreasontext, var_656b99fc50e799ae, nukedetonated);
    }
    foreach (player in level.players) {
        if (!isbot(player) && isdefined(player.team) && player.team != "spectator" && player.team != "codcaster") {
            logendofround(player);
        }
    }
    if (var_fb23f88e5b048669 && waslastround()) {
        function_8abcf76787cc51aa();
        if (level.var_1fa9e6ecce90d2c2) {
            endgame_endgame(winner, endreasontext, var_656b99fc50e799ae, nukedetonated);
        } else {
            function_7d6052ee2ccb8d2(winner, endreasontext, var_656b99fc50e799ae, nukedetonated);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117a8
// Size: 0xb
function shouldmodescoreonties() {
    return istrue(game["canScoreOnTie"]);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117bb
// Size: 0xbe
function checkmodeoverridetie(winner) {
    var_e0800c286f7f2d30 = shouldmodescoreonties() && winner == "tie";
    var_88189c9b48dac5e = getgametype() == "ctf" && winner == "tie" && !level.winrule;
    if (var_e0800c286f7f2d30 || var_88189c9b48dac5e) {
        namespace_e8a49b70d0769b66::updatetotalteamscore("axis");
        namespace_e8a49b70d0769b66::updatetotalteamscore("allies");
        alliesscore = getteamscore("allies");
        axisscore = getteamscore("axis");
        if (alliesscore != axisscore) {
            winner = ter_op(alliesscore > axisscore, "allies", "axis");
        }
    }
    return winner;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11881
// Size: 0xd5
function endgame_showkillcam() {
    if (istrue(level.nukeinfo.detonated)) {
        return;
    }
    if (istrue(level.brdisablefinalkillcam)) {
        return;
    }
    if (istrue(level.var_ee656bfaf5da1c13)) {
        return;
    }
    if (getdvarint(@"hash_166b51bf7450fc22", 0) == 1) {
        return;
    }
    if (istrue(level.skipfinalkillcam)) {
        return;
    }
    namespace_4b0406965e556711::levelflagwait("final_killcam_preloaded");
    if (level.finalkillcamenabled) {
        var_1cf6fd3396dce827 = 0;
        if (isdefined(level.finalkillcam_winner)) {
            var_1cf6fd3396dce827 = 1;
        }
        if (var_1cf6fd3396dce827) {
            var_1cf6fd3396dce827 = level namespace_70d685b02aaee20e::dofinalkillcam();
        }
        if (isdefined(var_1cf6fd3396dce827) && !var_1cf6fd3396dce827) {
            postroundfadenokillcam();
        }
    } else if (level.potgenabled) {
        function_a310b626ca04b8c2();
    } else {
        /#
            assertmsg("endGame_ShowKillCam() -- Neither Final-Kill killcam nor POTG enabled. Probably a mistake.");
        #/
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1195d
// Size: 0x5c
function function_a310b626ca04b8c2() {
    var_cc46931e59a508d3 = namespace_ab70c875589b8f6a::getcurpotgscene();
    if (isdefined(var_cc46931e59a508d3.primaryentity)) {
        level namespace_70d685b02aaee20e::dopotgkillcam();
    } else {
        level.finalkillcamenabled = 1;
        var_1cf6fd3396dce827 = level namespace_70d685b02aaee20e::dofinalkillcam();
        if (isdefined(var_1cf6fd3396dce827) && !var_1cf6fd3396dce827) {
            postroundfadenokillcam();
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119c0
// Size: 0xc8
function postroundfadenokillcam() {
    foreach (player in level.players) {
        if (isbot(player)) {
            continue;
        }
        if (level.gametype == "ballmode") {
            if (waslastround()) {
                player setclientomnvar("post_game_state", 2);
            }
        } else if (level.gametype == "arena") {
            player setclientomnvar("post_game_state", 1);
        } else {
            player setclientomnvar("post_game_state", 2);
        }
        player thread predictandclearintermissionstreaming();
    }
    wait(0.5);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8f
// Size: 0x4b
function predictandclearintermissionstreaming() {
    self endon("disconnect");
    var_baf0448298aa5c79 = namespace_99ac021a7547cae3::getspectatepoint();
    self function_bc667001f9dd3808(var_baf0448298aa5c79.origin);
    while (self.sessionstate != "intermission") {
        waitframe();
    }
    waitframe();
    self clearpredictedstreampos();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ae1
// Size: 0x3a
function setgameendflagsandnotifies(winner) {
    game["state"] = "postgame";
    level notify("game_ended", winner);
    namespace_4b0406965e556711::levelflagset("game_over");
    namespace_4b0406965e556711::levelflagset("block_notifies");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b22
// Size: 0x3c
function endgame_luidecisionreceived(value) {
    if (isdefined(value)) {
        if (value == 1 || value == 2) {
            level._waitforlui = 0;
            level._luidecision = value;
            level notify("madeLUIDecision");
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b65
// Size: 0xcba
function function_968a297e2b343c7c(winner, endreasontext, var_656b99fc50e799ae, nukedetonated) {
    level.gameendtime = gettime();
    level.gameended = 1;
    level.ingraceperiod = 0;
    level.doeomcombat = 0;
    if (!isdefined(winner)) {
        if (isroundbased()) {
            logstring("IWH-315293: HALIBUT: winner undefined, related to CL 7682409 where wasLastRound() would not be set in round based mode");
            level.forcedend = 1;
        }
        return 1;
    }
    namespace_27c74152ccb91331::function_27fe46449778a3e3(winner);
    if (getdvarint(@"hash_c6492f4edd9202d3")) {
        if (getgametype() == "ballmode" || waslastround() && getgametype() != "arena") {
            level.doeomcombat = 1;
        }
    }
    updateleaderboardstats();
    waitframe();
    namespace_e8a49b70d0769b66::updateplacement();
    level.recordfinalkillcam = 0;
    level.ignorescoring = 1;
    thread namespace_ab70c875589b8f6a::onroundended(winner);
    thread namespace_70d685b02aaee20e::preloadfinalkillcam();
    level notify("cancel_announcer_dialog");
    if (isteamreviveenabled()) {
        thread namespace_7db13bdf599e41a6::cleanuprevivetriggericons();
    }
    if (waslastround()) {
        if (matchmakinggame()) {
            if (getdvarint(@"hash_d9b8563acb5ea299", 0) != 0) {
                if (getdvarint(@"hash_8465b31049c6168d", 0) == 1) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 2) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 3) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(1);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 4) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(1);
                }
            }
        }
        if (getgametype() == "arena") {
            if (isgameplayteam(winner)) {
                topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
            } else {
                topplayers = level.placement["all"];
            }
            var_5145219fe86af824 = int(min(3, topplayers.size));
            foreach (player in level.players) {
                var_f2440d5d88deb7df = 0;
                for (i = 0; i < var_5145219fe86af824; i++) {
                    if (player == topplayers[i]) {
                        var_f2440d5d88deb7df = 1;
                    }
                }
                if (var_f2440d5d88deb7df) {
                    if (player == topplayers[0]) {
                        player namespace_74465391b3cf76b::addwatch2v2topscore();
                    }
                }
            }
        }
        level notify("start_game_win_audio", winner);
        if (istrue(level.postgameexfil) && !level.forcedend) {
            if (winner != "tie") {
                level waittill("exfil_continue_game_end");
            }
        }
    } else {
        level notify("round_end_music", winner);
    }
    if (level.doeomcombat) {
        if (istrue(level.docmdoutro)) {
            thread waitforhitmarkerspostgame();
            setgameendflagsandnotifies(winner);
            level waittill("cmd_continue_game_end");
            setomnvarforallclients("post_game_state", 2);
            foreach (player in level.players) {
                if (level.teambased) {
                    player thread namespace_44abc05161e2e2cb::teamoutcomenotify(winner, 0, endreasontext, var_656b99fc50e799ae);
                } else {
                    player thread namespace_44abc05161e2e2cb::outcomenotify(winner, endreasontext, var_656b99fc50e799ae);
                }
            }
            freezeallplayers(3, @"hash_682a9bc40f96ca4a", 1, 1);
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(3);
        } else if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, var_656b99fc50e799ae);
            game["state"] = "postgame";
            level notify("game_ended", winner);
            namespace_4b0406965e556711::levelflagset("game_over");
            namespace_4b0406965e556711::levelflagset("block_notifies");
            waitframe();
        } else if (getgametype() == "ballmode") {
            level notify("game_ended", winner);
            if (waslastround() || level.playovertime) {
                if (level.playovertime) {
                    winner = "overtime";
                }
                thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, var_656b99fc50e799ae);
            }
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        } else {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, var_656b99fc50e799ae);
            freezeallplayers(2.5, @"hash_682a9bc40f96ca4a", 1, 1);
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        }
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if (wasonlyround() || waslastround()) {
                player namespace_58a74e7d54b56e8d::clearkillstreaks();
                player namespace_7ff762d1c2a7da35::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
    } else {
        thread waitforhitmarkerspostgame();
        setgameendflagsandnotifies(winner);
        waitframe();
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if ((wasonlyround() || waslastround()) && !istrue(game["isLaunchChunk"])) {
                player namespace_58a74e7d54b56e8d::clearkillstreaks();
                player namespace_7ff762d1c2a7da35::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
        freezeallplayers(1, @"hash_682a9bc40f96ca4a", 1, 0);
    }
    setgameendtime(0);
    game["gameLength"] = game["gameLength"] + namespace_cd0b2d039510b38d::getroundlength();
    thread namespace_bd0162aedd8c8594::logevent_sendplayerindexdata();
    if (namespace_bd0162aedd8c8594::analyticsspawnlogenabled()) {
        namespace_bd0162aedd8c8594::analyticsstorespawndata();
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.end_reason = endreasontext;
    var_7e2c53b0bcf117d9.winner = winner;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_round_end", var_7e2c53b0bcf117d9);
    if (namespace_de6e6777b0937bd7::function_9ce94b15ee6758ee("callback_player_round_end")) {
        foreach (player in level.players) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.player = player;
            var_7e2c53b0bcf117d9.winner = winner;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_round_end", var_7e2c53b0bcf117d9);
        }
    }
    clearmatchhasmorethan1playervariablesonroundend();
    if (isdefined(level.matchrecording_dump)) {
        [[ level.matchrecording_dump ]]();
    }
    rankedmatchupdates(winner);
    setdvar(@"hash_c6ca3fbc35dd960", 1);
    setdvar(@"hash_9995278b4b4099ae", 0);
    setdvar(@"hash_8ed4dff39f3251f5", 0);
    /#
        sendscriptusageanalysisdata(1, 1);
    #/
    foreach (player in level.players) {
        player namespace_d19129e4fa5d176::loadout_clearperks();
        player.deathsdoor = 0;
    }
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["roundsPlayed"] = 0;
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
        }
        winner = "tie";
        endreasontext = game["end_reason"]["practice_round_over"];
    }
    var_c58f71396bb03715 = 1;
    if (getgametype() == "ballmode") {
        var_c58f71396bb03715 = waslastround() || level.playovertime;
    }
    if (var_c58f71396bb03715) {
        displayroundend(winner, endreasontext, var_656b99fc50e799ae);
        level thread endofroundvisionset(level.roundenddelay - 1);
    }
    if (!waslastround()) {
        level notify("round_win", winner);
        roundendwait(level.roundenddelay);
    } else {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.winner = winner;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_match_end", var_7e2c53b0bcf117d9);
        roundendwait(level.roundenddelay);
    }
    level notify("game_cleanup");
    endgame_showkillcam();
    if (istrue(level.var_ee656bfaf5da1c13)) {
        function_cc892bd20a432474(winner);
    }
    setslowmotion(1, 1, 0);
    resetsoundtimescalefactor();
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["practiceRound"] = 0;
        if (level.allowsupers && !runleanthreadmode()) {
            foreach (player in level.players) {
                player namespace_85d036cb78063c4a::clearsuper();
                player namespace_727d2aa1d6c72038::perkpackage_reset();
            }
        }
        namespace_4b0406965e556711::levelflagclear("block_notifies");
        restart();
        return 0;
    } else {
        if (level.teambased) {
            foreach (entry in level.teamnamelist) {
                namespace_e8a49b70d0769b66::updatetotalteamscore(entry);
            }
        }
        if (!wasonlyround()) {
            if (!waslastround()) {
                if (level.playovertime) {
                    winner = "overtime";
                    game["status"] = "overtime";
                }
                namespace_4b0406965e556711::levelflagclear("block_notifies");
                var_fd4901c8a1a1cf9a = checkroundswitch(level.playovertime);
                if (var_fd4901c8a1a1cf9a) {
                    onroundswitch(level.playovertime);
                }
                if (var_fd4901c8a1a1cf9a || game["finalRound"] == 1 || game["matchPoint"] == 1) {
                    shouldDisplayRoundSwitch = 1;
                    if (getgametype() == "arena") {
                        if (shouldplaywinbytwo()) {
                            goto LOC_00000b6e;
                        }
                        if (game["matchPoint"] == 1 && !istrue(game["displayedMatchPoint"])) {
                            game["displayedMatchPoint"] = 1;
                        } else if (game["finalRound"] != 1) {
                            shouldDisplayRoundSwitch = 0;
                        LOC_00000b6e:
                        }
                    LOC_00000b6e:
                    } else if (getgametype() == "ballmode") {
                        shouldDisplayRoundSwitch = 0;
                    }
                    if (shouldDisplayRoundSwitch) {
                        displayroundswitch();
                    }
                }
                foreach (player in level.players) {
                    player.pers["stats"] = player.stats;
                    if (namespace_7e17181d03156026::isreallyalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.var_6f9bbed303902680)) {
                        var_642470e1abc1bbf9 = spawnstruct();
                        var_642470e1abc1bbf9.victim = player;
                        var_642470e1abc1bbf9.attacker = undefined;
                        var_642470e1abc1bbf9.meansofdeath = "MOD_ROUND_ENDED";
                        var_642470e1abc1bbf9.weaponfullstring = "none";
                        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", var_642470e1abc1bbf9);
                    }
                }
                restart();
                return 0;
            }
            if (!level.forcedend) {
                endreasontext = updateroundendreasontext(winner);
            }
        }
    }
    return 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12827
// Size: 0xcf2
function endgame_endround(winner, endreasontext, var_656b99fc50e799ae, nukedetonated) {
    level.gameendtime = gettime();
    level.gameended = 1;
    level.ingraceperiod = 0;
    level.doeomcombat = 0;
    if (!isdefined(winner)) {
        if (isroundbased()) {
            logstring("IWH-315293: HALIBUT: winner undefined, related to CL 7682409 where wasLastRound() would not be set in round based mode");
            level.forcedend = 1;
        }
        return 1;
    }
    if (getdvarint(@"hash_c6492f4edd9202d3")) {
        if (getgametype() == "ballmode" || waslastround() && getgametype() != "arena") {
            level.doeomcombat = 1;
        }
    }
    updateleaderboardstats();
    waitframe();
    namespace_e8a49b70d0769b66::updateplacement();
    level.recordfinalkillcam = 0;
    level.ignorescoring = 1;
    thread namespace_ab70c875589b8f6a::onroundended(winner);
    thread namespace_70d685b02aaee20e::preloadfinalkillcam();
    level notify("cancel_announcer_dialog");
    if (isteamreviveenabled()) {
        thread namespace_7db13bdf599e41a6::cleanuprevivetriggericons();
    }
    if (waslastround()) {
        if (matchmakinggame()) {
            if (getdvarint(@"hash_d9b8563acb5ea299", 0) != 0) {
                if (getdvarint(@"hash_8465b31049c6168d", 0) == 1) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 2) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 3) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(1);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 4) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(1);
                }
            }
        }
        if (getgametype() == "arena") {
            if (isgameplayteam(winner)) {
                topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
            } else {
                topplayers = level.placement["all"];
            }
            var_5145219fe86af824 = int(min(3, topplayers.size));
            foreach (player in level.players) {
                var_f2440d5d88deb7df = 0;
                for (i = 0; i < var_5145219fe86af824; i++) {
                    if (player == topplayers[i]) {
                        var_f2440d5d88deb7df = 1;
                    }
                }
                if (var_f2440d5d88deb7df) {
                    if (player == topplayers[0]) {
                        player namespace_74465391b3cf76b::addwatch2v2topscore();
                    }
                }
            }
        }
        level notify("start_game_win_audio", winner);
        if (istrue(level.postgameexfil) && !level.forcedend) {
            if (winner != "tie") {
                level waittill("exfil_continue_game_end");
            }
        }
    } else {
        level notify("round_end_music", winner);
    }
    if (level.doeomcombat) {
        if (istrue(level.docmdoutro)) {
            thread waitforhitmarkerspostgame();
            setgameendflagsandnotifies(winner);
            level waittill("cmd_continue_game_end");
            setomnvarforallclients("post_game_state", 2);
            foreach (player in level.players) {
                if (level.teambased) {
                    player thread namespace_44abc05161e2e2cb::teamoutcomenotify(winner, 0, endreasontext, var_656b99fc50e799ae);
                } else {
                    player thread namespace_44abc05161e2e2cb::outcomenotify(winner, endreasontext, var_656b99fc50e799ae);
                }
            }
            freezeallplayers(3, @"hash_682a9bc40f96ca4a", 1, 1);
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(3);
        } else if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, var_656b99fc50e799ae);
            game["state"] = "postgame";
            level notify("game_ended", winner);
            namespace_4b0406965e556711::levelflagset("game_over");
            namespace_4b0406965e556711::levelflagset("block_notifies");
            waitframe();
        } else if (getgametype() == "ballmode") {
            level notify("game_ended", winner);
            if (waslastround() || level.playovertime) {
                if (level.playovertime) {
                    winner = "overtime";
                }
                thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, var_656b99fc50e799ae);
            }
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        } else {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, var_656b99fc50e799ae);
            freezeallplayers(2.5, @"hash_682a9bc40f96ca4a", 1, 1);
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        }
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if (wasonlyround() || waslastround()) {
                player namespace_58a74e7d54b56e8d::clearkillstreaks();
                player namespace_7ff762d1c2a7da35::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
    } else {
        thread waitforhitmarkerspostgame();
        setgameendflagsandnotifies(winner);
        waitframe();
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if ((wasonlyround() || waslastround()) && !istrue(game["isLaunchChunk"])) {
                player namespace_58a74e7d54b56e8d::clearkillstreaks();
                player namespace_7ff762d1c2a7da35::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
        freezeallplayers(1, @"hash_682a9bc40f96ca4a", 1, 0);
    }
    setgameendtime(0);
    game["gameLength"] = game["gameLength"] + namespace_cd0b2d039510b38d::getroundlength();
    thread namespace_bd0162aedd8c8594::logevent_sendplayerindexdata();
    if (namespace_bd0162aedd8c8594::analyticsspawnlogenabled()) {
        namespace_bd0162aedd8c8594::analyticsstorespawndata();
    }
    if (waslastround()) {
        level namespace_7f0bcee5d45a1dea::callback("game_ended");
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.end_reason = endreasontext;
    var_7e2c53b0bcf117d9.winner = winner;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_round_end", var_7e2c53b0bcf117d9);
    if (namespace_de6e6777b0937bd7::function_9ce94b15ee6758ee("callback_player_round_end")) {
        foreach (player in level.players) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.player = player;
            var_7e2c53b0bcf117d9.winner = winner;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_round_end", var_7e2c53b0bcf117d9);
        }
    }
    clearmatchhasmorethan1playervariablesonroundend();
    if (isdefined(level.matchrecording_dump)) {
        [[ level.matchrecording_dump ]]();
    }
    rankedmatchupdates(winner);
    setdvar(@"hash_c6ca3fbc35dd960", 1);
    setdvar(@"hash_9995278b4b4099ae", 0);
    setdvar(@"hash_8ed4dff39f3251f5", 0);
    /#
        sendscriptusageanalysisdata(1, 1);
    #/
    foreach (player in level.players) {
        player namespace_d19129e4fa5d176::loadout_clearperks();
        player.deathsdoor = 0;
    }
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["roundsPlayed"] = 0;
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
        }
        winner = "tie";
        endreasontext = game["end_reason"]["practice_round_over"];
    }
    if (issharedfuncdefined("display_transition", "display_round_end")) {
        outcome = spawnstruct();
        outcome.winner = winner;
        outcome.end_reason = endreasontext;
        [[ getsharedfunc("display_transition", "display_round_end") ]](outcome);
    }
    var_c58f71396bb03715 = 1;
    if (getgametype() == "ballmode") {
        var_c58f71396bb03715 = waslastround() || level.playovertime;
    }
    if (var_c58f71396bb03715) {
        displayroundend(winner, endreasontext, var_656b99fc50e799ae);
        level thread endofroundvisionset(level.roundenddelay - 1);
    }
    if (!waslastround()) {
        level notify("round_win", winner);
        roundendwait(level.roundenddelay);
    } else {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.winner = winner;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_match_end", var_7e2c53b0bcf117d9);
        roundendwait(level.roundenddelay);
    }
    level notify("game_cleanup");
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["practiceRound"] = 0;
        if (level.allowsupers && !runleanthreadmode()) {
            foreach (player in level.players) {
                player namespace_85d036cb78063c4a::clearsuper();
                player namespace_727d2aa1d6c72038::perkpackage_reset();
            }
        }
        namespace_4b0406965e556711::levelflagclear("block_notifies");
        restart();
        return 0;
    } else {
        if (level.teambased) {
            foreach (entry in level.teamnamelist) {
                namespace_e8a49b70d0769b66::updatetotalteamscore(entry);
            }
        }
        if (!wasonlyround()) {
            if (!waslastround()) {
                if (level.playovertime) {
                    winner = "overtime";
                    game["status"] = "overtime";
                }
                namespace_4b0406965e556711::levelflagclear("block_notifies");
                var_fd4901c8a1a1cf9a = checkroundswitch(level.playovertime);
                if (var_fd4901c8a1a1cf9a) {
                    onroundswitch(level.playovertime);
                }
                if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
                    game["shouldDisplayRoundSwitch"] = var_fd4901c8a1a1cf9a;
                }
                if (var_fd4901c8a1a1cf9a || game["finalRound"] == 1 || game["matchPoint"] == 1) {
                    shouldDisplayRoundSwitch = 1;
                    if (getgametype() == "arena") {
                        if (game["matchPoint"] == 1 && !istrue(game["displayedMatchPoint"])) {
                            game["displayedMatchPoint"] = 1;
                        } else if (game["finalRound"] != 1) {
                            shouldDisplayRoundSwitch = 0;
                        }
                    } else if (getgametype() == "ballmode") {
                        shouldDisplayRoundSwitch = 0;
                    }
                    if (shouldDisplayRoundSwitch) {
                        displayroundswitch();
                    }
                }
                foreach (player in level.players) {
                    player.pers["stats"] = player.stats;
                    if (namespace_7e17181d03156026::isreallyalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.var_6f9bbed303902680)) {
                        var_642470e1abc1bbf9 = spawnstruct();
                        var_642470e1abc1bbf9.victim = player;
                        var_642470e1abc1bbf9.attacker = undefined;
                        var_642470e1abc1bbf9.meansofdeath = "MOD_ROUND_ENDED";
                        var_642470e1abc1bbf9.weaponfullstring = "none";
                        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", var_642470e1abc1bbf9);
                    }
                }
                restart();
                return 0;
            }
            if (!level.forcedend) {
                endreasontext = updateroundendreasontext(winner);
            }
        }
    }
    return 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13521
// Size: 0x11c
function tacopsroundendwait(defaultdelay) {
    var_e41a0047b2421a2c = 0;
    while (!var_e41a0047b2421a2c) {
        players = level.players;
        var_e41a0047b2421a2c = 1;
        foreach (player in players) {
            if (!player namespace_44abc05161e2e2cb::isdoingsplash()) {
                continue;
            }
            var_e41a0047b2421a2c = 0;
        }
        wait(0.5);
    }
    var_8d539c1577794d34 = 0;
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (player iscodcaster()) {
            var_8d539c1577794d34 = level.var_7210bb7b0bfbcfdb;
        }
    }
    wait(defaultdelay + var_8d539c1577794d34);
    setomnvarforallclients("post_game_state", 1);
    level notify("round_end_finished");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13644
// Size: 0x2b
function compare_player_score(left, right) {
    return left.score >= right.score;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13677
// Size: 0xd28
function function_7d6052ee2ccb8d2(winner, endreasontext, var_656b99fc50e799ae, nukedetonated) {
    canceljoins();
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && !level.forcedend) {
        level._waitforlui = 1;
        level namespace_61d0e47c5dff187c::lui_registercallback("exit_squad_eliminated", &endgame_luidecisionreceived);
    }
    if (!istrue(level.processedwinloss) && (istrue(level.forfeitinprogress) || level.forcedend)) {
        updatewinlossstats(winner);
    }
    namespace_aad14af462a74d08::roundend(winner);
    checkforpersonalbests();
    updatespmstats();
    namespace_2685ec368e022695::writebestscores();
    level notify("stop_leaderboard_stats");
    updateleaderboardstats();
    level namespace_801bcc0d4eadf9a1::evaluateallaccolades();
    if (isdefined(level.winners_circle)) {
        level.var_286c2c7b34d03b04 = [[ level.winners_circle.init ]](winner);
    } else {
        level.var_286c2c7b34d03b04 = 0;
    }
    if (!level.var_286c2c7b34d03b04) {
        level notify("spawning_intermission");
        var_d8cb902ebfc7b2a2 = getintermissionspawnpointoverride();
        foreach (player in level.players) {
            player thread setuipostgamefade(0);
            if (!isdefined(level.modespawnendofgame) || !player [[ level.modespawnendofgame ]]()) {
                player thread namespace_99ac021a7547cae3::spawnintermission(var_d8cb902ebfc7b2a2);
            }
        }
    }
    if (istrue(nukedetonated) && isdefined(level.nukeinfo.visionset) && !istrue(level.nukeinfo.cancelled)) {
        _visionsetnaked(level.nukeinfo.visionset, 0);
        visionsetfadetoblack("", 0.75);
    } else {
        _visionsetnaked("", 0);
        visionsetfadetoblack("", 0.75);
    }
    displaygameend(winner, endreasontext, var_656b99fc50e799ae);
    namespace_4b0406965e556711::levelflagclear("block_notifies");
    namespace_bf9ffd2b22c7d819::function_4064a2271de12b97();
    if (level.var_ec2fb549b15ad827) {
        namespace_82872106c3e3314d::match_end(winner);
    }
    level.intermission = 1;
    if (!level.var_286c2c7b34d03b04) {
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            namespace_c5622898120e827f::hidedangercircle();
            setomnvarforallclients("ui_br_transition_type", 0);
            if (function_7c386b2db63d6fb6()) {
                setomnvarforallclients("post_game_state", 14);
            }
            if (!namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
                wait_time = getdvarint(@"hash_54481201f477f78f", 120);
                if (getdvarint(@"hash_8772eff48f8bc5f2") == 1) {
                    wait(25);
                } else if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
                    wait(wait_time);
                } else if (getdvarfloat(@"hash_e94e38873c94b670", 0) > 0) {
                    waitframe();
                } else {
                    wait(25);
                }
            } else {
                if (istrue(level._waitforlui)) {
                    level waittill("madeLUIDecision");
                }
                level.postroundtime = 0;
            }
        }
        if (level.gametype != "arena" && function_9243d6bcfd2f6b49()) {
            setomnvarforallclients("post_game_state", 5);
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            roundendwait(level.postroundtime);
        }
        if (level.gametype == "arena" && function_9243d6bcfd2f6b49()) {
            setomnvarforallclients("post_game_state", 5);
        }
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType() || getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || isprophuntgametype() || getsubgametype() == "rumble_mgl") {
        processlobbydata();
    }
    if (level.var_286c2c7b34d03b04) {
        setomnvarforallclients("post_game_state", 6);
        wait(0.1);
        [[ level.winners_circle.start ]](winner);
        level waittill("taunts_timed_out");
        [[ level.winners_circle.end ]]();
    }
    if (level.teambased) {
        if (isgameplayteam(winner)) {
            setmatchdata("victor", winner);
            topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
        } else {
            setmatchdata("victor", "none");
            topplayers = level.placement["all"];
        }
        setmatchdata("alliesScore", getteamscore("allies"));
        setmatchdata("axisScore", getteamscore("axis"));
    } else {
        setmatchdata("victor", "none");
        topplayers = level.placement["all"];
    }
    if (getdvarint(@"hash_7d55907df966fbb0")) {
        setomnvarforallclients("post_game_state", 6);
    }
    function_eb1a045a6d299c6a();
    foreach (player in level.players) {
        if (!isdefined(endreasontext)) {
            /#
                iprintlnbold("<unknown string>");
            #/
            endreasontext = game["end_reason"]["objective_completed"];
        }
        player setplayerdata("common", "round", "endReasonTextIndex", endreasontext);
        if (isalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.var_6f9bbed303902680)) {
            var_642470e1abc1bbf9 = spawnstruct();
            var_642470e1abc1bbf9.victim = player;
            var_642470e1abc1bbf9.attacker = undefined;
            var_642470e1abc1bbf9.meansofdeath = "MOD_GAME_ENDED";
            var_642470e1abc1bbf9.weaponfullstring = "none";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", var_642470e1abc1bbf9);
        }
        var_5145219fe86af824 = int(min(3, topplayers.size));
        var_f2440d5d88deb7df = 0;
        for (i = 0; i < var_5145219fe86af824; i++) {
            if (player == topplayers[i]) {
                var_f2440d5d88deb7df = 1;
            }
        }
        if (var_f2440d5d88deb7df) {
            player namespace_74465391b3cf76b::addwatchchargewintop3();
        }
        if (level.teambased) {
            if (isgameplayteam(winner)) {
                if (isdefined(player.team)) {
                    if (player.team == winner) {
                        player namespace_74465391b3cf76b::addwatchchargewin();
                        player.pers["match_outcome"] = "win";
                    } else {
                        player.pers["match_outcome"] = "loss";
                    }
                }
            } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
                player.pers["match_outcome"] = "tie";
            }
        } else if (isplayer(winner)) {
            if (isdefined(level.lastplayerwins)) {
                if (player == level.placement["all"][0]) {
                    player namespace_74465391b3cf76b::addwatchchargewin();
                    player.pers["match_outcome"] = "win";
                } else {
                    player.pers["match_outcome"] = "loss";
                }
            } else if (var_f2440d5d88deb7df) {
                player namespace_74465391b3cf76b::addwatchchargewin();
                player.pers["match_outcome"] = "win";
            } else {
                player.pers["match_outcome"] = "loss";
            }
        } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
            player.pers["match_outcome"] = "tie";
        }
        if (player onlinestatsenabled()) {
            player setplayerdata(level.var_5d69837cf4db0407, "playerStats", "comparisonSeason", getdvarint(@"hash_71ef9b867531fea1"));
            elapsedtime = int(getsecondspassed());
            foreach (scope in [0:"lifetimeStats", 1:"seasonalStats"]) {
                oldval = 0;
                if (player hasplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent")) {
                    oldval = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent");
                }
                player setplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent", oldval + elapsedtime);
            }
        }
        player utility::trycall(level.matchdata_logplayerdata);
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_server_exit_level");
    utility::trycall(level.matchdata_recordrecentlyplayeddata);
    onmatchend();
    sendendofmatchdata();
    function_85f0e7abca18ad51();
    foreach (player in level.players) {
        player.pers["stats"] = player.stats;
    }
    function_52dde37b8fcf63ff();
    if (istrue(game["isLaunchChunk"])) {
        wait(1);
    } else if (!nukedetonated && !level.postgamenotifies) {
        if (!level.var_286c2c7b34d03b04) {
            if (!wasonlyround()) {
                wait(6);
            } else if (getdvarfloat(@"hash_e94e38873c94b670", 0) > 0) {
                wait(1);
            } else if (!istrue(namespace_36f464722d326bbe::isBRStyleGameType()) && level.matchmakingmatch && !level.var_ec2fb549b15ad827 && !level.var_77907d733abe8b63 && !istrue(namespace_36f464722d326bbe::function_22cd3d64fdb05892())) {
                wait(min(10, 5 + level.postgamenotifies));
            } else {
                wait(min(5, 4 + level.postgamenotifies));
            }
        }
    } else {
        wait(min(10, 4 + level.postgamenotifies));
    }
    function_a30e6bfa5c581e40();
    settournamentwinner(winner);
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        setomnvarforallclients("post_game_state", 15);
        var_53804dbeed3da40 = getdvarint(@"hash_b6ae6a9d61d4326a", 0);
        wait(var_53804dbeed3da40);
    }
    wait(1);
    function_a30e6bfa5c581e40();
    setomnvarforallclients("post_game_state", 1);
    namespace_4b0406965e556711::levelflagwaitopen("post_game_level_event_active");
    if (istrue(game["isLaunchChunk"])) {
        namespace_4b0406965e556711::levelflagclear("block_notifies");
        game["launchChunkWinner"] = 1;
        game["timePassed"] = 0;
        game["roundsPlayed"] = 0;
        game["overtimeRoundsPlayed"] = 0;
        game["matchPoint"] = 0;
        game["finalRound"] = 0;
        game["gamestarted"] = undefined;
        game["previousWinningTeam"] = "";
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
            setteamscore(team, int(0));
        }
        if (game["launchChunkRuleSet"] == 3) {
            if (isdefined(level.droplaunchchunkbots)) {
                level [[ level.droplaunchchunkbots ]]();
            }
            wait(1);
        }
        if (!level.hostforcedend && !level.forcedend) {
            restart();
            return 0;
        }
    }
    level notify("exitLevel_called");
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && isdefined(level._luidecision) && level._luidecision == 2) {
        namespace_e4a5fcd525f0b19b::drop_bots(1, level.player.team);
        namespace_d576b6dc7cef9c62::restart();
    } else {
        exitlevel(0);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143a6
// Size: 0xa4
function function_b17d29b68a88995e(var_8a5e17fab329354c) {
    level notify("spawning_intermission");
    var_d8cb902ebfc7b2a2 = getintermissionspawnpointoverride();
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (!isdefined(level.modespawnendofgame) || !player [[ level.modespawnendofgame ]]()) {
            player thread namespace_99ac021a7547cae3::spawnintermission(var_d8cb902ebfc7b2a2);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14451
// Size: 0xb0a
function endgame_endgame(winner, endreasontext, var_656b99fc50e799ae, nukedetonated) {
    canceljoins();
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && !level.forcedend) {
        level._waitforlui = 1;
        level namespace_61d0e47c5dff187c::lui_registercallback("exit_squad_eliminated", &endgame_luidecisionreceived);
    }
    if (!istrue(level.processedwinloss) && (istrue(level.forfeitinprogress) || level.forcedend)) {
        updatewinlossstats(winner);
    }
    namespace_aad14af462a74d08::roundend(winner);
    checkforpersonalbests();
    updatespmstats();
    namespace_2685ec368e022695::writebestscores();
    level notify("stop_leaderboard_stats");
    updateleaderboardstats();
    level namespace_801bcc0d4eadf9a1::evaluateallaccolades();
    if (issharedfuncdefined("display_transition", "display_match_end")) {
        outcome = spawnstruct();
        outcome.winner = winner;
        outcome.end_reason = endreasontext;
        outcome.var_84d0ba6d7bfaca5f = var_656b99fc50e799ae;
        [[ getsharedfunc("display_transition", "display_match_end") ]](outcome);
    }
    if (!istrue(level.var_286c2c7b34d03b04)) {
        [[ level.spawnintermission ]](1);
    }
    if (istrue(nukedetonated) && isdefined(level.nukeinfo.visionset) && !istrue(level.nukeinfo.cancelled)) {
        _visionsetnaked(level.nukeinfo.visionset, 0);
        visionsetfadetoblack("", 0.75);
    } else {
        _visionsetnaked("", 0);
        visionsetfadetoblack("", 0.75);
    }
    displaygameend(winner, endreasontext, var_656b99fc50e799ae);
    namespace_4b0406965e556711::levelflagclear("block_notifies");
    namespace_bf9ffd2b22c7d819::function_4064a2271de12b97();
    if (level.var_ec2fb549b15ad827) {
        namespace_82872106c3e3314d::match_end(winner);
    }
    level.intermission = 1;
    if (!istrue(level.var_286c2c7b34d03b04)) {
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            namespace_c5622898120e827f::hidedangercircle();
            setomnvarforallclients("ui_br_transition_type", 0);
            if (function_7c386b2db63d6fb6()) {
                setomnvarforallclients("post_game_state", 14);
            }
            if (!namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
                if (getdvarint(@"hash_8772eff48f8bc5f2") == 1) {
                    wait(25);
                } else {
                    wait(25);
                }
            } else {
                if (istrue(level._waitforlui)) {
                    level waittill("madeLUIDecision");
                }
                level.postroundtime = 0;
            }
        }
        if (function_9243d6bcfd2f6b49()) {
            setomnvarforallclients("post_game_state", 5);
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            roundendwait(level.postroundtime);
        }
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType() || getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || isprophuntgametype() || getsubgametype() == "rumble_mgl") {
        processlobbydata();
    }
    if (level.teambased) {
        if (isgameplayteam(winner)) {
            setmatchdata("victor", winner);
            topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
        } else {
            setmatchdata("victor", "none");
            topplayers = level.placement["all"];
        }
        setmatchdata("alliesScore", getteamscore("allies"));
        setmatchdata("axisScore", getteamscore("axis"));
    } else {
        setmatchdata("victor", "none");
        topplayers = level.placement["all"];
    }
    function_eb1a045a6d299c6a();
    foreach (player in level.players) {
        player setplayerdata("common", "round", "endReasonTextIndex", endreasontext);
        if (isalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.var_6f9bbed303902680)) {
            var_642470e1abc1bbf9 = spawnstruct();
            var_642470e1abc1bbf9.victim = player;
            var_642470e1abc1bbf9.attacker = undefined;
            var_642470e1abc1bbf9.meansofdeath = "MOD_GAME_ENDED";
            var_642470e1abc1bbf9.weaponfullstring = "none";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", var_642470e1abc1bbf9);
        }
        var_5145219fe86af824 = int(min(3, topplayers.size));
        var_f2440d5d88deb7df = 0;
        for (i = 0; i < var_5145219fe86af824; i++) {
            if (player == topplayers[i]) {
                var_f2440d5d88deb7df = 1;
            }
        }
        if (var_f2440d5d88deb7df) {
            player namespace_74465391b3cf76b::addwatchchargewintop3();
        }
        if (level.teambased) {
            if (isgameplayteam(winner)) {
                if (isdefined(player.team)) {
                    if (player.team == winner) {
                        player namespace_74465391b3cf76b::addwatchchargewin();
                        player.pers["match_outcome"] = "win";
                    } else {
                        player.pers["match_outcome"] = "loss";
                    }
                }
            } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
                player.pers["match_outcome"] = "tie";
            }
        } else if (isplayer(winner)) {
            if (isdefined(level.lastplayerwins)) {
                if (player == level.placement["all"][0]) {
                    player namespace_74465391b3cf76b::addwatchchargewin();
                    player.pers["match_outcome"] = "win";
                } else {
                    player.pers["match_outcome"] = "loss";
                }
            } else if (var_f2440d5d88deb7df) {
                player namespace_74465391b3cf76b::addwatchchargewin();
                player.pers["match_outcome"] = "win";
            } else {
                player.pers["match_outcome"] = "loss";
            }
        } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
            player.pers["match_outcome"] = "tie";
        }
        if (player onlinestatsenabled()) {
            player setplayerdata(level.var_5d69837cf4db0407, "playerStats", "comparisonSeason", getdvarint(@"hash_71ef9b867531fea1"));
            elapsedtime = int(getsecondspassed());
            foreach (scope in [0:"lifetimeStats", 1:"seasonalStats"]) {
                oldval = 0;
                if (player hasplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent")) {
                    oldval = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent");
                }
                player setplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent", oldval + elapsedtime);
            }
        }
        player utility::trycall(level.matchdata_logplayerdata);
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_server_exit_level");
    utility::trycall(level.matchdata_recordrecentlyplayeddata);
    onmatchend();
    sendendofmatchdata();
    function_a30e6bfa5c581e40();
    function_85f0e7abca18ad51();
    foreach (player in level.players) {
        player.pers["stats"] = player.stats;
    }
    function_52dde37b8fcf63ff();
    if (istrue(game["isLaunchChunk"])) {
        wait(1);
    } else if (!nukedetonated && !level.postgamenotifies) {
        if (!istrue(level.var_286c2c7b34d03b04)) {
            if (!wasonlyround()) {
                wait(6);
            } else {
                wait(min(5, 4 + level.postgamenotifies));
            }
        }
    } else {
        wait(min(10, 4 + level.postgamenotifies));
    }
    settournamentwinner(winner);
    setomnvarforallclients("post_game_state", 1);
    namespace_4b0406965e556711::levelflagwaitopen("post_game_level_event_active");
    if (istrue(game["isLaunchChunk"])) {
        namespace_4b0406965e556711::levelflagclear("block_notifies");
        game["launchChunkWinner"] = 1;
        game["timePassed"] = 0;
        game["roundsPlayed"] = 0;
        game["overtimeRoundsPlayed"] = 0;
        game["matchPoint"] = 0;
        game["finalRound"] = 0;
        game["gamestarted"] = undefined;
        game["previousWinningTeam"] = "";
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
            setteamscore(team, int(0));
        }
        if (game["launchChunkRuleSet"] == 3) {
            if (isdefined(level.droplaunchchunkbots)) {
                level [[ level.droplaunchchunkbots ]]();
            }
            wait(1);
        }
        if (!level.hostforcedend && !level.forcedend) {
            restart();
            return 0;
        }
    }
    level notify("exitLevel_called");
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && isdefined(level._luidecision) && level._luidecision == 2) {
        namespace_e4a5fcd525f0b19b::drop_bots(1, level.player.team);
        namespace_d576b6dc7cef9c62::restart();
    } else {
        exitlevel(0);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f62
// Size: 0x14
function function_7c386b2db63d6fb6() {
    return !function_52a79582296d478f() || !function_e2dbe7460083c35();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7e
// Size: 0x23
function function_9243d6bcfd2f6b49() {
    return !istrue(level.var_c94add55a8ad5938) && (!function_52a79582296d478f() || !function_e2dbe7460083c35());
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fa9
// Size: 0x9
function function_52a79582296d478f() {
    return namespace_b97271dc63a81cc0::function_94b952789d039abb();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fba
// Size: 0x1c
function function_e2dbe7460083c35() {
    return getdvar(@"hash_12e53040d5281856", "") == "scripted";
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fde
// Size: 0xb1
function sendendofmatchdata() {
    if (!isdefined(level.endofmatchdatasent)) {
        if (getdvarint(@"hash_4ba1427c86b79dc5") != 0) {
            setmatchdata("host", level.hostname);
            if (matchmakinggame()) {
                setmatchdata("playlistVersion", getplaylistversion());
                setmatchdata("playlistID", getplaylistid());
                setmatchdata("playlist_name", getplaylistname());
                setmatchdata("isDedicated", isdedicatedserver());
                setmatchdata("party_maxplayers", getdvarint(@"hash_818c699a5caaee4f", 0));
            }
            function_9d1e19c311cbe199();
            sendmatchdata();
        }
    }
    level.endofmatchdatasent = 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15096
// Size: 0xa5
function settournamentwinner(winner) {
    if (!isdefined(winner)) {
        return;
    }
    if (!level.teambased) {
        dotournamentendgame(winner);
        return;
    } else if (winner != "allies" && winner != "axis") {
        numallies = getteamdata("allies", "players");
        var_95a21b6abca6b0ca = getteamdata("axis", "players");
        if (numallies.size == 0) {
            winner = "axis";
        } else if (var_95a21b6abca6b0ca.size == 0) {
            winner = "allies";
        } else {
            winner = getbetterteam();
        }
    }
    dotournamentendgame(winner);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15142
// Size: 0x22
function waitforhitmarkerspostgame() {
    wait(level.postgamehitmarkerwaittime);
    level notify("post_game_ui_start");
    setomnvarforallclients("post_game_state", 1);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1516b
// Size: 0xca
function eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, var_656b99fc50e799ae) {
    wait(level.postgamehitmarkerwaittime);
    level notify("post_game_ui_start");
    if (!namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "ob") {
        setomnvarforallclients("post_game_state", 2);
    }
    foreach (player in level.players) {
        if (level.teambased) {
            player thread namespace_44abc05161e2e2cb::teamoutcomenotify(winner, 0, endreasontext, var_656b99fc50e799ae);
        } else {
            player thread namespace_44abc05161e2e2cb::outcomenotify(winner, endreasontext, var_656b99fc50e799ae);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1523c
// Size: 0x171
function getintermissionspawnpointoverride() {
    spawnpoint = undefined;
    switch (level.mapname) {
    case #"hash_a62df42a13dad323":
        spawnpoint = spawnstruct();
        spawnpoint.origin = (1478, -3039, 981);
        spawnpoint.angles = (388.74, 144.97, 0);
        break;
    case #"hash_81c63d549bea3339":
        spawnpoint = spawnstruct();
        spawnpoint.origin = (1835, 1347, 749);
        spawnpoint.angles = (361, 224, 0);
        break;
    case #"hash_8eb456b9e1d842c7":
        spawnpoint = spawnstruct();
        spawnpoint.origin = (-871, -1578, 458);
        spawnpoint.angles = (6, 65, 0);
        break;
    }
    if (getgametype() == "brtdm" || getgametype() == "brtdm_mgl") {
        spawnpoint = spawnstruct();
        spawnpoint.origin = level.brtdm_config.spectatepoint.origin;
        spawnpoint.angles = level.brtdm_config.spectatepoint.angles;
    }
    return spawnpoint;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x153b5
// Size: 0x20d
function eomcamerapullout(delay) {
    if (isdefined(delay) && delay > 0) {
        wait(delay);
    }
    foreach (player in level.players) {
        if (!player namespace_f8065cafc523dba5::_isalive()) {
            continue;
        }
        player val::set("eomCameraPullOut", "ads", 0);
        startpos = player geteye() + (0, 0, 1) * 100 + anglestoforward(player.angles) * -100;
        cameraent = spawn("script_model", startpos);
        cameraent setmodel("tag_origin");
        cameraent.angles = player.angles;
        player.spawncameraent = cameraent;
        targetpos = player geteye();
        targetangles = player.angles;
        var_4158f3e6af3fc2e7 = startpos + (0, 0, 5000);
        var_4158f3e6af3fc2e7 = var_4158f3e6af3fc2e7 + anglestoforward(targetangles) * -100;
        player cameralinkto(player.spawncameraent, "tag_origin", 1, 1);
        player.spawncameraent moveto(var_4158f3e6af3fc2e7, 5, 4, 0.1);
        fwd = vectornormalize(targetpos - cameraent.origin);
        goalangles = vectortoanglessafe(fwd, (0, 0, 1));
        player.spawncameraent.angles = goalangles;
        player thread lookatplayerupdate(targetangles);
        wait(2);
        player visionsetnakedforplayer("respawn_camera", 2);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155c9
// Size: 0x8d
function lookatplayerupdate(var_fe0c08ddc602e96) {
    self endon("disconnect");
    self endon("lookAtPlayerUpdate_stop");
    while (1) {
        targetpos = self geteye();
        fwd = vectornormalize(targetpos - self.spawncameraent.origin);
        goalangles = vectortoanglessafe(fwd, (0, 0, 1));
        self.spawncameraent rotateto(goalangles, 0.75);
        waitframe();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1565d
// Size: 0x90
function updateroundendreasontext(winner) {
    if (!level.teambased) {
        return 1;
    }
    if (ismoddedroundgame()) {
        if (hitscorelimit()) {
            return game["end_reason"]["score_limit_reached"];
        }
        if (hittimelimit()) {
            return game["end_reason"]["time_limit_reached"];
        }
    } else if (hitroundlimit()) {
        return game["end_reason"]["round_limit_reached"];
    }
    if (hitwinlimit()) {
        return game["end_reason"]["score_limit_reached"];
    }
    return game["end_reason"]["objective_completed"];
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156f5
// Size: 0x90
function estimatedtimetillscorelimit(team) {
    /#
        assert(isplayer(self) || isdefined(team));
    #/
    if (!ismoddedroundgame()) {
        scoreperminute = getscoreperminute(team);
        scoreremaining = getscoreremaining(team);
        var_e415364de8d3892d = 999999;
        if (scoreperminute) {
            var_e415364de8d3892d = scoreremaining / scoreperminute;
        }
        return var_e415364de8d3892d;
    } else {
        scoreperminute = getscoreperminute(team);
        scoreremaining = getscoreperminute(team);
        var_e415364de8d3892d = 999999;
        if (scoreperminute) {
            var_e415364de8d3892d = scoreremaining / scoreperminute;
        }
        return var_e415364de8d3892d;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1578c
// Size: 0xf7
function closetoscorelimit(team) {
    /#
        assert(isplayer(self) || isdefined(team));
    #/
    var_394d614159379768 = 10;
    var_616beac13fedff48 = 20;
    scorelimit = level.roundscorelimit;
    switch (getgametype()) {
    case #"hash_3a17de6e294210d2":
    case #"hash_f4a9126c03d3385b":
        var_616beac13fedff48 = 20;
        break;
    case #"hash_ea061d29bbd1f237":
        var_616beac13fedff48 = 10;
    case #"hash_ca6516c10db2c95":
    case #"hash_7f9c384a34cc392f":
        var_616beac13fedff48 = scorelimit * 0.1;
        break;
    default:
        break;
    }
    teamscore = getteamscore(team);
    var_6d82488e12c4b8b0 = scorelimit - teamscore;
    if (var_6d82488e12c4b8b0 <= ter_op(istrue(game["finalRound"]), var_616beac13fedff48, var_394d614159379768)) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1588b
// Size: 0x69
function getscoreperminute(team) {
    /#
        assert(isplayer(self) || isdefined(team));
    #/
    minutespassed = gettimepassed() / 60000 + 0.0001;
    if (isplayer(self)) {
        scoreperminute = self.score / minutespassed;
    } else {
        scoreperminute = getteamscore(team) / minutespassed;
    }
    return scoreperminute;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158fc
// Size: 0x62
function getscoreremaining(team) {
    /#
        assert(isplayer(self) || isdefined(team));
    #/
    scorelimit = level.roundscorelimit;
    if (isplayer(self)) {
        scoreremaining = scorelimit - self.score;
    } else {
        scoreremaining = scorelimit - getteamscore(team);
    }
    return scoreremaining;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15966
// Size: 0xa2
function getscoreperminuteroundbased(team) {
    scorelimit = level.roundscorelimit;
    if (!game["switchedsides"]) {
        scorelimit = scorelimit / 2;
        minutespassed = gettimepassed() / 60000 + 0.0001;
        scoreperminute = getteamscore(team) / minutespassed;
    } else {
        scorelimit = int(scorelimit / 2);
        minutespassed = gettimepassed() / 60000 + 0.0001;
        teamscore = getteamscore(team);
        if (teamscore >= scorelimit) {
            scoreperminute = (teamscore - scorelimit) / minutespassed;
        } else {
            return 0;
        }
    }
    return scoreperminute;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a10
// Size: 0xc3
function givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    foreach (teamname in level.teamnamelist) {
        if (self.pers["team"] != teamname) {
            thread teamplayercardsplash("callout_lastenemyalive", self, teamname);
        }
    }
    level notify("last_alive", self);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ada
// Size: 0xc2
function processlobbydata() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        processlobbydataforclient(player);
    }
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        if (matchmakinggame() && !privatematch()) {
            setclientmatchdata("isPublicMatch", 1);
        } else {
            setclientmatchdata("isPublicMatch", 0);
        }
    }
    namespace_633301c58b0b0cec::processlobbyscoreboards();
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        sendclientmatchdata();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ba3
// Size: 0x40
function assignclientmatchdataid(player) {
    if (isdefined(player) && !isdefined(player.clientmatchdataid)) {
        player.clientmatchdataid = level.currentclientmatchdataid;
        level.currentclientmatchdataid++;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15bea
// Size: 0x1ee
function processlobbydataforclient(player) {
    if (istrue(player.processlobbydataforclient)) {
        return;
    }
    player.processlobbydataforclient = 1;
    assignclientmatchdataid(player);
    playername = player.name;
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        setclientmatchdata("players", player.clientmatchdataid, "clanTag", player getclantag());
        setclientmatchdata("players", player.clientmatchdataid, "xuidHigh", player getxuidhigh());
        setclientmatchdata("players", player.clientmatchdataid, "xuidLow", player getxuidlow());
        setclientmatchdata("players", player.clientmatchdataid, "isBot", isbot(player));
        setclientmatchdata("players", player.clientmatchdataid, "uniqueClientId", player.clientid);
        setclientmatchdata("players", player.clientmatchdataid, "username", playername);
        if (player isps4player()) {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "ps4");
        } else if (player isxb3player()) {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "xb3");
        } else if (player ispcplayer()) {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "bnet");
        } else {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "none");
        }
    }
    player setplayerdata("common", "round", "clientMatchIndex", player.clientmatchdataid);
    player namespace_633301c58b0b0cec::setplayerscoreboardinfo();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ddf
// Size: 0x8b
function trackleaderboarddeathstats(attacker, victim, sweapon, smeansofdeath) {
    if (isdefined(victim.var_f08da114ffd85042) && victim.var_f08da114ffd85042 == victim.lifeid) {
        return;
    }
    victim thread threadedsetweaponstatbyname(sweapon, 1, "deaths", attacker);
    victim thread threadedsetweaponstatbyname(sweapon, distancesquared(attacker.origin, victim.origin), "cumulative_death_distance_sq");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e71
// Size: 0x12f
function trackattackerleaderboarddeathstats(attacker, victim, sweapon, smeansofdeath) {
    if (isdefined(attacker) && isplayer(attacker)) {
        if (isdefined(smeansofdeath) && smeansofdeath.size > 0) {
            if (isdefined(sweapon) && sweapon.size > 0) {
                if (isdefined(victim)) {
                    if (isdefined(attacker)) {
                        if (smeansofdeath != "MOD_FALLING") {
                            if (istrue(attacker.modifiers["ads"])) {
                                attacker thread threadedsetweaponstatbyname(sweapon, 1, "ads_kills", victim);
                            }
                            attacker thread threadedsetweaponstatbyname(sweapon, 1, "kills");
                            attacker thread threadedsetweaponstatbyname(sweapon, distancesquared(attacker.origin, victim.origin), "cumulative_kill_distance_sq");
                        }
                        if (smeansofdeath == "MOD_HEAD_SHOT") {
                            attacker thread threadedsetweaponstatbyname(sweapon, 1, "headShots", victim);
                        }
                    } else {
                        /#
                            assertex(isdefined(victim), "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use undefined attacker");
                        #/
                    }
                } else {
                    /#
                        assertex(isdefined(victim), "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use undefined victim");
                    #/
                }
            } else {
                /#
                    assertex(smeansofdeath.size > 0, "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use an undefined or empty sWeapon string");
                #/
            }
        } else {
            /#
                assertex(smeansofdeath.size > 0, "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use an undefined or empty sMeansOfDeath string");
            #/
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fa7
// Size: 0x85f
function setweaponstat(weapon, var_a1d4e7d5ef9da660, statname, otherent) {
    if (!var_a1d4e7d5ef9da660) {
        return;
    }
    if (getdvarint(@"hash_1b5abaf35dfdb4e4", 1) == 1 && istrue(game["inLiveLobby"])) {
        return;
    }
    objweapon = undefined;
    if (isweapon(weapon)) {
        objweapon = weapon;
    } else {
        objweapon = makeweaponfromstring(weapon);
    }
    objweapon = function_1e3102980c3a4cc1(objweapon);
    if (!isdefined(objweapon)) {
        return;
    }
    weaponname = objweapon.basename;
    var_cf4209c200f8bbf4 = getweapongroup(objweapon);
    variantid = getweaponvariantindex(objweapon);
    var_11d2f075e9a0e643 = getequipmenttype(weapon);
    if (isdefined(var_11d2f075e9a0e643) && var_11d2f075e9a0e643 == "lethal") {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
        var_7e2c53b0bcf117d9.statname = statname;
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = var_a1d4e7d5ef9da660;
        var_7e2c53b0bcf117d9.variantid = variantid;
        var_7e2c53b0bcf117d9.weaponobj = objweapon;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        return;
    }
    if (var_cf4209c200f8bbf4 == "super") {
        shouldtracksuperweaponstats = namespace_85d036cb78063c4a::shouldtracksuperweaponstats(objweapon);
        if (isdefined(shouldtracksuperweaponstats) && !shouldtracksuperweaponstats) {
            return;
        }
    }
    if (var_cf4209c200f8bbf4 == "killstreak" || var_cf4209c200f8bbf4 == "other" && weaponname != "trophy_mp" || var_cf4209c200f8bbf4 == "other" && weaponname != "player_trophy_system_mp" || var_cf4209c200f8bbf4 == "other" && weaponname != "super_trophy_mp") {
        return;
    }
    if (isenvironmentweapon(objweapon)) {
        return;
    }
    if (var_cf4209c200f8bbf4 == "weapon_grenade" || var_cf4209c200f8bbf4 == "weapon_explosive" || weaponname == "trophy_mp" || weaponname == "forcepush_mp") {
        weaponname = strip_suffix(weaponname, "_mp");
        namespace_2685ec368e022695::incrementweaponstat(weaponname, statname, var_a1d4e7d5ef9da660);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
        var_7e2c53b0bcf117d9.statname = statname;
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = var_a1d4e7d5ef9da660;
        var_7e2c53b0bcf117d9.variantid = variantid;
        var_7e2c53b0bcf117d9.weaponobj = objweapon;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        return;
    }
    if (!isdefined(self.trackingweapon)) {
        self.trackingweapon = objweapon;
    }
    if (objweapon != self.trackingweapon) {
        namespace_2685ec368e022695::updateweaponbufferedstats();
        self.trackingweapon = objweapon;
    }
    switch (statname) {
    case #"hash_1f658b3efcf092d2":
        if (!isdefined(self.trackingweaponshots)) {
            self.trackingweaponshots = 0;
        }
        self.trackingweaponshots = self.trackingweaponshots + var_a1d4e7d5ef9da660;
        break;
    case #"hash_7b99e54a94aa5fb":
        if (!isdefined(self.trackingweaponhits)) {
            self.trackingweaponhits = 0;
        }
        self.trackingweaponhits = self.trackingweaponhits + var_a1d4e7d5ef9da660;
        break;
    case #"hash_dae69d0191cb02b2":
        if (!isdefined(self.var_a00eddcf879bdbc3)) {
            self.var_a00eddcf879bdbc3 = 0;
        }
        self.var_a00eddcf879bdbc3 = self.var_a00eddcf879bdbc3 + var_a1d4e7d5ef9da660;
        break;
    case #"hash_f75b5b7a407db7e3":
        if (!isdefined(self.var_ca6e0d389c0ca0a7)) {
            self.var_ca6e0d389c0ca0a7 = 0;
        }
        self.var_ca6e0d389c0ca0a7 = self.var_ca6e0d389c0ca0a7 + var_a1d4e7d5ef9da660;
        break;
    case #"hash_297da132d2f8bf70":
        if (!isdefined(self.trackingweaponheadshots)) {
            self.trackingweaponheadshots = 0;
        }
        self.trackingweaponheadshots = self.trackingweaponheadshots + var_a1d4e7d5ef9da660;
        if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_5fac5778fe3fdc1c)) {
                self.var_5fac5778fe3fdc1c = 0;
            }
            self.var_5fac5778fe3fdc1c = self.var_5fac5778fe3fdc1c + var_a1d4e7d5ef9da660;
        }
        break;
    case #"hash_abcbd371534e7e1b":
        if (!isdefined(self.var_9a2fd6f8771f2e58)) {
            self.var_9a2fd6f8771f2e58 = 0;
        }
        self.var_9a2fd6f8771f2e58 = self.var_9a2fd6f8771f2e58 + var_a1d4e7d5ef9da660;
        break;
    case #"hash_14c0eea23e1cfd58":
        if (!isdefined(self.var_5fac5778fe3fdc1c)) {
            self.var_5fac5778fe3fdc1c = 0;
        }
        self.var_5fac5778fe3fdc1c = self.var_5fac5778fe3fdc1c + var_a1d4e7d5ef9da660;
        break;
    case #"hash_f459561578093b3e":
        if (!isdefined(self.trackingweaponkills)) {
            self.trackingweaponkills = 0;
        }
        self.trackingweaponkills = self.trackingweaponkills + var_a1d4e7d5ef9da660;
        break;
    case #"hash_406d7407b0a31c77":
        if (!isdefined(self.var_e16d751a51153a7b)) {
            self.var_e16d751a51153a7b = 0;
        }
        self.var_e16d751a51153a7b = self.var_e16d751a51153a7b + var_a1d4e7d5ef9da660;
        if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_1fe884779e5f4dbe)) {
                self.var_1fe884779e5f4dbe = 0;
            }
            self.var_1fe884779e5f4dbe = self.var_1fe884779e5f4dbe + var_a1d4e7d5ef9da660;
        }
        break;
    case #"hash_9c5319f6e55cbcfc":
        if (!isdefined(self.var_2bf7b072e416002a)) {
            self.var_2bf7b072e416002a = 0;
        }
        self.var_2bf7b072e416002a = self.var_2bf7b072e416002a + var_a1d4e7d5ef9da660;
        break;
    case #"hash_72d0fd0488636e3f":
        if (!isdefined(self.var_1fe884779e5f4dbe)) {
            self.var_1fe884779e5f4dbe = 0;
        }
        self.var_1fe884779e5f4dbe = self.var_1fe884779e5f4dbe + var_a1d4e7d5ef9da660;
        break;
    case #"hash_88d1683fbcbbc7fa":
        if (function_2b8d709c5b78bbef(otherent)) {
            if (!isdefined(self.var_f00517aa8f668932)) {
                self.var_f00517aa8f668932 = 0;
            }
            self.var_f00517aa8f668932 = self.var_f00517aa8f668932 + var_a1d4e7d5ef9da660;
        } else if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_14cec2ba65099256)) {
                self.var_14cec2ba65099256 = 0;
            }
            self.var_14cec2ba65099256 = self.var_14cec2ba65099256 + var_a1d4e7d5ef9da660;
        }
        break;
    case #"hash_1cc8a923a608c2a0":
        if (!isdefined(self.var_883957b1c1ef6745)) {
            self.var_883957b1c1ef6745 = 0;
        }
        self.var_883957b1c1ef6745 = self.var_883957b1c1ef6745 + var_a1d4e7d5ef9da660;
        if (function_2b8d709c5b78bbef(otherent)) {
            if (!isdefined(self.var_7b522bf6f7aeca98)) {
                self.var_7b522bf6f7aeca98 = 0;
            }
            self.var_7b522bf6f7aeca98 = self.var_7b522bf6f7aeca98 + var_a1d4e7d5ef9da660;
        } else if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_bf617879def40524)) {
                self.var_bf617879def40524 = 0;
            }
            self.var_bf617879def40524 = self.var_bf617879def40524 + var_a1d4e7d5ef9da660;
        }
        break;
    }
    if (statname == "deaths") {
        /#
            if (getdvarint(@"hash_f42eefd3e1b79376")) {
                println("<unknown string>");
            }
        #/
        var_efd23879ffb610bd = undefined;
        var_49e6ef3edadd524e = getweaponrootname(objweapon);
        if (!iscacprimaryweapon(var_49e6ef3edadd524e) && !iscacsecondaryweapon(var_49e6ef3edadd524e)) {
            return;
        }
        attachments = getweaponattachments(objweapon);
        namespace_2685ec368e022695::incrementweaponstat(var_49e6ef3edadd524e, statname, var_a1d4e7d5ef9da660);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = var_49e6ef3edadd524e;
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
        var_7e2c53b0bcf117d9.statname = "deaths";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = var_a1d4e7d5ef9da660;
        var_7e2c53b0bcf117d9.variantid = variantid;
        var_7e2c53b0bcf117d9.weaponobj = objweapon;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        foreach (attachment in attachments) {
            namespace_2685ec368e022695::incrementattachmentstat(attachment, statname, var_a1d4e7d5ef9da660, objweapon);
            utility::trycall(level.matchdata_logattachmentstat, attachment, statname, var_a1d4e7d5ef9da660, objweapon);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1680d
// Size: 0xca
function setinflictorstat(einflictor, eattacker, sweapon) {
    if (!isdefined(eattacker)) {
        return;
    }
    if (!isdefined(einflictor)) {
        eattacker setweaponstat(sweapon, 1, "hits");
        return;
    }
    if (!isdefined(einflictor.playeraffectedarray)) {
        einflictor.playeraffectedarray = [];
    }
    foundnewplayer = 1;
    for (i = 0; i < einflictor.playeraffectedarray.size; i++) {
        if (einflictor.playeraffectedarray[i] == self) {
            foundnewplayer = 0;
            break;
        }
    }
    if (foundnewplayer) {
        einflictor.playeraffectedarray[einflictor.playeraffectedarray.size] = self;
        eattacker setweaponstat(sweapon, 1, "hits");
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168de
// Size: 0x37
function threadedsetweaponstatbyname(name, var_a1d4e7d5ef9da660, statname, otherent) {
    self endon("disconnect");
    waittillframeend();
    setweaponstat(name, var_a1d4e7d5ef9da660, statname, otherent);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1691c
// Size: 0x2f
function function_a3f0b7aba215ef11(otherent) {
    if (!isdefined(otherent)) {
        return 0;
    }
    if (isagent(otherent)) {
        return 2;
    } else if (isplayer(otherent)) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16953
// Size: 0x28
function function_2b8d709c5b78bbef(ent) {
    type = function_a3f0b7aba215ef11(ent);
    return isdefined(type) && type == 2;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16983
// Size: 0x28
function function_2e31277709b9f493(ent) {
    type = function_a3f0b7aba215ef11(ent);
    return isdefined(type) && type == 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169b3
// Size: 0x290
function updatespmstats() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player onlinestatsenabled()) {
            spm = getmatchspm(player);
            var_3bb40b75eecb6f17 = ter_op(level.teambased, player.score, player namespace_3c5a4254f2b957ea::getpersstat("gamemodeScore"));
            globalSPM = player getplayerdata(level.var_5d69837cf4db0407, "globalSPM");
            gamesplayed = player getplayerstat("matchStats", "gamesPlayed");
            globalSPM = globalSPM * (gamesplayed - 1);
            var_cff58b2c41422f10 = spm;
            if (gamesplayed > 0) {
                var_cff58b2c41422f10 = (globalSPM + spm) / gamesplayed;
            }
            player setplayerdata(level.var_5d69837cf4db0407, "globalSPM", int(var_cff58b2c41422f10));
            var_4c1b06f2836318d9 = getgametypeindex(getgametype());
            maxgamemodescorehistory = 5;
            maxgamemodes = 32;
            if (var_4c1b06f2836318d9 >= 0 && var_4c1b06f2836318d9 < maxgamemodes) {
                for (i = 0; i < 4; i++) {
                    prev = player getplayerdata(level.var_5d69837cf4db0407, "gameModeHistory", i + 1);
                    player setplayerdata(level.var_5d69837cf4db0407, "gameModeHistory", i, prev);
                }
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeHistory", 4, function_60bf8d82001fc22c());
                var_d5999635907b7eef = player getplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", var_4c1b06f2836318d9, "index");
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", var_4c1b06f2836318d9, "scores", var_d5999635907b7eef, int(spm));
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", var_4c1b06f2836318d9, "actualScores", var_d5999635907b7eef, int(var_3bb40b75eecb6f17));
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", var_4c1b06f2836318d9, "gameMode", function_60bf8d82001fc22c());
                var_d5999635907b7eef = (var_d5999635907b7eef + 1) % maxgamemodescorehistory;
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", var_4c1b06f2836318d9, "index", var_d5999635907b7eef);
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c4a
// Size: 0x2a2
function checkforpersonalbests() {
    var_46cb15851fd25568 = undefined;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player onlinestatsenabled()) {
            var_7269c381eaf9b5d4 = player getplayerdata("common", "round", "kills");
            var_b25c6bcd4fd1f8f0 = player getplayerdata("common", "round", "deaths");
            var_c36875d4bea155cf = player namespace_3c5a4254f2b957ea::getpersstat("summary")["xp"];
            bestkills = player getplayerstat("bestStats", "killsInAMatch");
            mostDeaths = player getplayerstat("bestStats", "deathsInAMatch");
            var_4e7118fde602d1e = player getplayerstat("bestStats", "xpInAMatch");
            bestSPM = player getplayerdata(level.var_5d69837cf4db0407, "bestSPM", "score");
            bestKD = player getplayerdata(level.var_5d69837cf4db0407, "bestKD", "score");
            if (var_7269c381eaf9b5d4 > bestkills) {
                player setplayerstat(var_7269c381eaf9b5d4, "bestStats", "killsInAMatch");
            }
            if (var_c36875d4bea155cf > var_4e7118fde602d1e) {
                player setplayerstat(var_c36875d4bea155cf, "bestStats", "xpInAMatch");
            }
            if (var_b25c6bcd4fd1f8f0 > mostDeaths) {
                player setplayerstat(var_b25c6bcd4fd1f8f0, "bestStats", "deathsInAMatch");
            }
            kd = var_7269c381eaf9b5d4;
            if (var_b25c6bcd4fd1f8f0 > 1) {
                kd = kd / var_b25c6bcd4fd1f8f0;
            }
            kd = int(kd * 1000);
            if (kd > bestKD) {
                player setplayerdata(level.var_5d69837cf4db0407, "bestKD", "score", kd);
                player setplayerdata(level.var_5d69837cf4db0407, "bestKD", "time", getsystemtime());
            }
            spm = getmatchspm(player);
            if (spm > bestSPM) {
                player setplayerdata(level.var_5d69837cf4db0407, "bestSPM", "score", int(spm));
                player setplayerdata(level.var_5d69837cf4db0407, "bestSPM", "time", getsystemtime());
            }
            if (!isdefined(var_46cb15851fd25568)) {
                var_46cb15851fd25568 = function_9f76a26987e2aa4e();
            }
            player checkforbestweapon(var_46cb15851fd25568);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ef3
// Size: 0x16
function allowleaderboardstatsupdates() {
    return level.onlinestatsenabled && isleaderboardsupportedmode();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f11
// Size: 0x9e
function updateleaderboardstatscontinuous() {
    level endon("game_ended");
    level endon("stop_leaderboard_stats");
    if (!allowleaderboardstatsupdates()) {
        return;
    }
    for (playerindex = 0; 1; playerindex++) {
        while (!isdefined(level.players) || level.players.size == 0) {
            waitframe();
        }
        if (playerindex >= level.players.size) {
            playerindex = 0;
        }
        player = level.players[playerindex];
        if (!isdefined(player) || isai(player)) {
            waitframe();
        } else {
            player updateplayerleaderboardstatsinternal();
            wait(0.1);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fb6
// Size: 0x75
function updateleaderboardstats() {
    if (!allowleaderboardstatsupdates()) {
        return;
    }
    foreach (player in level.players) {
        if (!isdefined(player) || isai(player)) {
            continue;
        }
        player updateplayerleaderboardstatsinternal();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17032
// Size: 0x25
function updateplayerleaderboardstats() {
    if (!allowleaderboardstatsupdates()) {
        return;
    }
    if (!isdefined(self) || isai(self)) {
        return;
    }
    updateplayerleaderboardstatsinternal();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1705e
// Size: 0x1e3
function isleaderboardsupportedmode() {
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        return 1;
    }
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        var_50df43417b876c9f = "hc_";
    } else {
        var_50df43417b876c9f = "";
    }
    var_50df43417b876c9f = var_50df43417b876c9f + getgametype();
    switch (var_50df43417b876c9f) {
    case #"hash_ca6516c10db2c95":
    case #"hash_1a5d186c17c00d3c":
    case #"hash_1aac086c17fe5ccb":
    case #"hash_1b1eecd3863a50cf":
    case #"hash_2946b34dbd2b86c6":
    case #"hash_53825b446469ac4c":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_61ac7a98039e2d86":
    case #"hash_6efb0f59a62300fb":
    case #"hash_7485fa6c474ec865":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_9424bbb71eb7d064":
    case #"hash_a93dacd349d98a99":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_aada280b52cbdd96":
    case #"hash_ab00240b52e9ec5e":
    case #"hash_b9458959b10637f8":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ea061d29bbd1f237":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_ec24570718a340f5":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_f4a9126c03d3385b":
    case #"hash_f55ec3d372444a79":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fa2ae2f6bd652314":
    case #"hash_fa34c5f6bd6d4432":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
    case #"hash_fa7b69e7b63430d3":
    case #"hash_fb5b5e6c07253005":
        return 1;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17249
// Size: 0x51
function function_8f54deec605690d1(type) {
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        return 1;
    }
    return isdefined(type) && (type == "dmz" || type == "exgm" || type == "plunder" || type == "risk" || type == "kingslayer");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172a2
// Size: 0x8e6
function updateplayerleaderboardstatsinternal() {
    var_50df43417b876c9f = undefined;
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        var_50df43417b876c9f = "hc_";
    } else {
        var_50df43417b876c9f = "";
    }
    var_50df43417b876c9f = var_50df43417b876c9f + getgametype();
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_9f2feddfe7ed94d3 = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        switch (var_9f2feddfe7ed94d3) {
        case #"hash_a3f25a001a121f":
        case #"hash_59b8e9d05b31ff9":
        case #"hash_16dd223e5a8b22c8":
        case #"hash_343d3f3f77c83350":
        case #"hash_5e0a8ff36bce5106":
        case #"hash_8299694594ab149d":
        case #"hash_bfabc434c59611fa":
        case #"":
        case #"hash_cfb0c3041d1bdc10":
        case #"hash_dddecc2751311914":
        case #"hash_f4afff6c03d92aa0":
        case #"hash_fa21c4f6bd5e3815":
            break;
        case #"hash_3c1c1566d7b3b870":
            break;
        default:
            return;
        }
    }
    var_438d6fde6ab2875c = ter_op(level.teambased, self.score, self.leaderboarddata["gamemodeScore"]);
    incrementleaderboardstat("score", var_50df43417b876c9f, var_438d6fde6ab2875c);
    timeplayed = namespace_2685ec368e022695::statgetchildbuffered("round", "timePlayed", 0);
    incrementleaderboardstat("timePlayed", var_50df43417b876c9f, timeplayed);
    incrementleaderboardstat("kills", var_50df43417b876c9f, self.leaderboarddata["kills"]);
    incrementleaderboardstat("deaths", var_50df43417b876c9f, self.leaderboarddata["deaths"]);
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        incrementleaderboardstat("downs", var_50df43417b876c9f, self.leaderboarddata["downs"]);
        incrementleaderboardstat("contracts", var_50df43417b876c9f, self.leaderboarddata["contracts"]);
        incrementleaderboardstat("wins", var_50df43417b876c9f, self.leaderboarddata["wins"]);
        incrementleaderboardstat("topFive", var_50df43417b876c9f, self.leaderboarddata["topFive"]);
        incrementleaderboardstat("topTen", var_50df43417b876c9f, self.leaderboarddata["topTen"]);
        incrementleaderboardstat("topTwentyFive", var_50df43417b876c9f, self.leaderboarddata["topTwentyFive"]);
        incrementleaderboardstat("gamesPlayed", var_50df43417b876c9f, self.leaderboarddata["gamesPlayed"]);
        incrementleaderboardstat("revives", var_50df43417b876c9f, self.leaderboarddata["rescues"]);
        incrementleaderboardstat("cash", var_50df43417b876c9f, self.leaderboarddata["cash"]);
        incrementleaderboardstat("eliteStarted", var_50df43417b876c9f, self.leaderboarddata["eliteStarted"]);
        incrementleaderboardstat("eliteCompleted", var_50df43417b876c9f, self.leaderboarddata["eliteCompleted"]);
        incrementleaderboardstat("eliteBlocked", var_50df43417b876c9f, self.leaderboarddata["eliteBlocked"]);
        incrementleaderboardstat("secondaryVictories", var_50df43417b876c9f, self.leaderboarddata["secondaryVictories"]);
        incrementleaderboardstat("weaponCaseExfils", var_50df43417b876c9f, self.leaderboarddata["weaponCaseExfils"]);
        incrementleaderboardstat("weaponCaseWins", var_50df43417b876c9f, self.leaderboarddata["weaponCaseWins"]);
    } else {
        switch (getgametype()) {
        case #"hash_7485fa6c474ec865":
            incrementleaderboardstat("assists", var_50df43417b876c9f, self.leaderboarddata["assists"]);
            break;
        case #"hash_5ff8e011d5b9d1c8":
            incrementleaderboardstat("damage", var_50df43417b876c9f, self.leaderboarddata["damage"]);
            incrementleaderboardstat("assists", var_50df43417b876c9f, self.leaderboarddata["assists"]);
            break;
        case #"hash_973d1db8b6644466":
            incrementleaderboardstat("assists", var_50df43417b876c9f, self.leaderboarddata["assists"]);
            incrementleaderboardstat("hvtKills", var_50df43417b876c9f, self.leaderboarddata["hvtKills"]);
        case #"hash_ca6516c10db2c95":
        case #"hash_7f9c384a34cc392f":
            incrementleaderboardstat("captures", var_50df43417b876c9f, self.leaderboarddata["captures"]);
            incrementleaderboardstat("defends", var_50df43417b876c9f, self.leaderboarddata["defends"]);
            break;
        case #"hash_eb5e5f470e0c1dc2":
            incrementleaderboardstat("revives", var_50df43417b876c9f, self.leaderboarddata["rescues"]);
            incrementleaderboardstat("plants", var_50df43417b876c9f, self.leaderboarddata["plants"]);
            break;
        case #"hash_fa0ed9f6bd4f4e9a":
            updateleaderboardstatmaximum("streak", var_50df43417b876c9f, self.leaderboarddata["killChains"]);
            break;
        case #"hash_f4a9126c03d3385b":
            incrementleaderboardstat("captures", var_50df43417b876c9f, self.leaderboarddata["captures"]);
            incrementleaderboardstat("defends", var_50df43417b876c9f, self.leaderboarddata["defends"]);
            break;
        case #"hash_fa50b0f6bd82e972":
            incrementleaderboardstat("plants", var_50df43417b876c9f, self.leaderboarddata["plants"]);
            incrementleaderboardstat("defuses", var_50df43417b876c9f, self.leaderboarddata["defuses"]);
            break;
        case #"hash_ea061d29bbd1f237":
            incrementleaderboardstat("confirms", var_50df43417b876c9f, self.leaderboarddata["confirmed"]);
            incrementleaderboardstat("denies", var_50df43417b876c9f, self.leaderboarddata["denied"]);
            break;
        case #"hash_fa34c5f6bd6d4432":
            incrementleaderboardstat("captures", var_50df43417b876c9f, self.leaderboarddata["captures"]);
            incrementleaderboardstat("defends", var_50df43417b876c9f, self.leaderboarddata["defends"]);
            break;
        case #"hash_6efb0f59a62300fb":
        case #"hash_ec72fd25bbbac99e":
            incrementleaderboardstat("objTime", var_50df43417b876c9f, self.leaderboarddata["objTime"]);
            incrementleaderboardstat("defends", var_50df43417b876c9f, self.leaderboarddata["defends"]);
            break;
        case #"hash_1a5d186c17c00d3c":
            incrementleaderboardstat("captures", var_50df43417b876c9f, self.leaderboarddata["captures"]);
            incrementleaderboardstat("returns", var_50df43417b876c9f, self.leaderboarddata["returns"]);
            break;
        case #"hash_fa50baf6bd82f930":
            incrementleaderboardstat("plants", var_50df43417b876c9f, self.leaderboarddata["plants"]);
            incrementleaderboardstat("rescues", var_50df43417b876c9f, self.leaderboarddata["rescues"]);
            break;
        case #"hash_53825b446469ac4c":
            incrementleaderboardstat("captures", var_50df43417b876c9f, self.leaderboarddata["captures"]);
            incrementleaderboardstat("revives", var_50df43417b876c9f, self.leaderboarddata["rescues"]);
            break;
        case #"hash_ec24570718a340f5":
            incrementleaderboardstat("banks", var_50df43417b876c9f, self.leaderboarddata["confirmed"]);
            incrementleaderboardstat("denies", var_50df43417b876c9f, self.leaderboarddata["denied"]);
            break;
        case #"hash_b9458959b10637f8":
            incrementleaderboardstat("time", var_50df43417b876c9f, getpersstat("extrascore0"));
            incrementleaderboardstat("infected", var_50df43417b876c9f, self.leaderboarddata["killsAsInfected"]);
            break;
        case #"hash_fb5b5e6c07253005":
            incrementleaderboardstat("stabs", var_50df43417b876c9f, self.leaderboarddata["stabs"]);
            incrementleaderboardstat("setBacks", var_50df43417b876c9f, self.leaderboarddata["setbacks"]);
            break;
        case #"hash_dd5b900f435d3f36":
            incrementleaderboardstat("objTime", var_50df43417b876c9f, self.leaderboarddata["objTime"]);
            incrementleaderboardstat("defends", var_50df43417b876c9f, self.leaderboarddata["defends"]);
            break;
        case #"hash_1aac086c17fe5ccb":
            incrementleaderboardstat("assists", var_50df43417b876c9f, self.leaderboarddata["assists"]);
            incrementleaderboardstat("captures", var_50df43417b876c9f, self.leaderboarddata["captures"]);
            incrementleaderboardstat("defends", var_50df43417b876c9f, self.leaderboarddata["defends"]);
            break;
        case #"hash_8c758b84936e8d42":
            incrementleaderboardstat("banks", var_50df43417b876c9f, self.leaderboarddata["confirmed"]);
            incrementleaderboardstat("denies", var_50df43417b876c9f, self.leaderboarddata["denied"]);
            break;
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b8f
// Size: 0xb3
function incrementleaderboardstat(stat, var_50df43417b876c9f, var_41ea0c22879b01d3) {
    if (!isdefined(self.leaderboardstartvalues)) {
        self.leaderboardstartvalues = [];
    }
    if (!isdefined(self.leaderboardstartvalues[stat])) {
        self.leaderboardstartvalues[stat] = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", var_50df43417b876c9f, stat);
    }
    var_d1044cf8ef47f871 = int(max(self.leaderboardstartvalues[stat] + var_41ea0c22879b01d3, self.leaderboardstartvalues[stat]));
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", var_50df43417b876c9f, stat, var_d1044cf8ef47f871);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c49
// Size: 0x65
function updateleaderboardstatmaximum(stat, var_50df43417b876c9f, var_a775792b5f1aa47c) {
    var_afdfad231e44e710 = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", var_50df43417b876c9f, stat);
    if (var_a775792b5f1aa47c > var_afdfad231e44e710) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", var_50df43417b876c9f, stat, var_a775792b5f1aa47c);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cb5
// Size: 0x7b
function getmatchspm(player) {
    spm = ter_op(level.teambased, player.score, player namespace_3c5a4254f2b957ea::getpersstat("gamemodeScore"));
    seconds = player namespace_2685ec368e022695::statgetchildbuffered("round", "timePlayed", 0);
    if (isdefined(seconds) && seconds > 0) {
        minutes = seconds / 60;
        spm = spm / minutes;
    }
    return spm;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d38
// Size: 0x4c
function isvalidbestweapon(rootname) {
    group = getweapongroup(rootname);
    return isdefined(rootname) && rootname != "" && !iskillstreakweapon(rootname) && group != "killstreak" && group != "other";
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d8c
// Size: 0x9f
function function_9f76a26987e2aa4e() {
    var_4099730bcfeba731 = utility::trycall(level.matchdata_buildweaponrootlist);
    /#
        assert(isdefined(var_4099730bcfeba731));
    #/
    result = [];
    for (i = 0; i < var_4099730bcfeba731.size; i++) {
        weaponname = var_4099730bcfeba731[i];
        weaponname = getweaponrootname(weaponname);
        if (isvalidbestweapon(weaponname)) {
            if (!isenumvaluevalid(level.var_5d69837cf4db0407, "WeaponStats", weaponname)) {
                /#
                    assertmsg("Weapon not added to WeaponStats enum in playerdata: " + weaponname);
                #/
            } else {
                result[result.size] = weaponname;
            }
        }
    }
    return result;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e33
// Size: 0x1e2
function checkforbestweapon(var_46cb15851fd25568) {
    var_312ee165e8200728 = "";
    var_f58a5057a72ba410 = -1;
    for (i = 0; i < var_46cb15851fd25568.size; i++) {
        weaponname = var_46cb15851fd25568[i];
        weaponkills = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", weaponname, "kills");
        if (weaponkills > var_f58a5057a72ba410) {
            var_312ee165e8200728 = weaponname;
            var_f58a5057a72ba410 = weaponkills;
        }
    }
    var_6662868ee2bc382a = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", var_312ee165e8200728, "shots");
    var_ecd73324545cd738 = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", var_312ee165e8200728, "headShots");
    var_76087327b8e72023 = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", var_312ee165e8200728, "hits");
    var_4c6269c801c04292 = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", var_312ee165e8200728, "deaths");
    var_cc603e175abfef2d = 0;
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "kills", var_f58a5057a72ba410);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "shots", var_6662868ee2bc382a);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "headShots", var_ecd73324545cd738);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "hits", var_76087327b8e72023);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "deaths", var_4c6269c801c04292);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeaponXP", var_cc603e175abfef2d);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1801c
// Size: 0x70
function allow_weapon_mp(bool) {
    self notify("allow_weapon_mp()");
    if (bool) {
        if (isdefined(self.allowweaponcache) && !self hasweapon(self.allowweaponcache) && !namespace_a2f809133c566621::isjuggernaut()) {
            namespace_92e4af149e72dc29::switchtolastweapon();
        }
        self.allowweaponcache = undefined;
    } else {
        self.allowweaponcache = self.lastnormalweaponobj;
        thread watchinvalidweaponswitchduringdisableweapon();
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18093
// Size: 0x11
function allow_weapon_mp_init() {
    level.allow_weapon_mp = &allow_weapon_mp;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180ab
// Size: 0x3d
function watchinvalidweaponswitchduringdisableweapon() {
    self endon("death");
    self endon("disconnect");
    self endon("allow_weapon_mp()");
    while (1) {
        var_ddf65301f7d23098 = self waittill("weapon_switch_invalid");
        self.allowweaponcache = var_ddf65301f7d23098;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180ef
// Size: 0xe
function ismp_init() {
    level.ismp = 1;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18104
// Size: 0x20e
function watchforlowpopmatchstart(var_eb2b338ec4671678) {
    if (!istrue(level.lowpopcheck)) {
        return;
    }
    if (!isdefined(var_eb2b338ec4671678)) {
        var_eb2b338ec4671678 = 0;
    }
    level endon("start_prematch");
    var_80593585eb825ba2 = getdvarint(@"hash_5e1370f70979f8b", 1);
    var_b81adef81193b335 = -1;
    starttime = gettime();
    while (1) {
        var_490292acb7f40a1e = getdvarint(@"hash_40d1fe46f9d6f48e", 50);
        var_5f5b788d766145c0 = getdvarfloat(@"hash_6ef3783f07957a9b", 300) * 1000;
        playercount = ter_op(var_eb2b338ec4671678, getactiveclientcount(var_80593585eb825ba2), level.players.size);
        if (var_b81adef81193b335 >= 0) {
            var_a28594c1b7cc010c = var_b81adef81193b335 + var_5f5b788d766145c0;
            if (playercount >= var_490292acb7f40a1e && gettime() >= var_a28594c1b7cc010c && !istrue(level.devoverridematchstart)) {
                break;
            }
        } else if (playercount >= var_490292acb7f40a1e) {
            var_b81adef81193b335 = gettime();
        }
        waitframe();
    }
    var_5ddc7308babf9834 = getdvarint(@"hash_40aef046f9b08e0c", 100);
    playercount = ter_op(var_eb2b338ec4671678, getactiveclientcount(var_80593585eb825ba2), level.players.size);
    if (playercount <= var_5ddc7308babf9834) {
        level.lowpopstart = 1;
        waittime = gettime() - starttime;
        var_2aacacc9b90e191d = getdvarfloat(@"hash_6ef3783f07957a9b", 300);
        dlog_recordevent("dlog_event_low_pop_start", [0:"start_players", 1:playercount, 2:"wait_time_ms", 3:waittime, 4:"active_client_count", 5:var_eb2b338ec4671678, 6:"lowpop_min", 7:var_490292acb7f40a1e, 8:"lowpop_max", 9:var_5ddc7308babf9834, 10:"lowpop_time", 11:var_2aacacc9b90e191d]);
        if (isdefined(level.onlowpopstart)) {
            [[ level.onlowpopstart ]]();
        }
    }
    waitframe();
    level notify("start_prematch");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18319
// Size: 0x57
function function_8396da2a86270f7d(maxplayers) {
    minplayers = getdvarint(@"hash_cb2d56d085e5a9b9");
    if (minplayers > maxplayers) {
        /#
            println("<unknown string>" + minplayers + "<unknown string>" + maxplayers);
        #/
        setdvar(@"hash_cb2d56d085e5a9b9", maxplayers);
        minplayers = maxplayers;
    }
    return minplayers;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18378
// Size: 0x1b9
function watchforminplayersmatchstart() {
    level endon("start_prematch");
    var_80593585eb825ba2 = getdvarint(@"hash_5e1370f70979f8b", 1);
    var_428422cf7b2eb8ac = gettime();
    var_e5eae91657533f2 = var_428422cf7b2eb8ac;
    maxplayers = getdvarint(@"hash_818c699a5caaee4f");
    minplayers = function_8396da2a86270f7d(maxplayers);
    var_7cc9d575418d740e = getdvarint(@"hash_961774a7c9cf5b66", 0);
    if (var_7cc9d575418d740e > maxplayers) {
        /#
            println("<unknown string>" + var_7cc9d575418d740e + "<unknown string>" + maxplayers + "<unknown string>");
        #/
        var_7cc9d575418d740e = maxplayers;
    }
    if (minplayers != 0) {
        while (1) {
            if (istrue(level.devoverridematchstart)) {
                break;
            }
            if (getdvarint(@"hash_51aa9c88bb0c1224", 1) == 1 && level.var_77907d733abe8b63) {
                level waittill("leagueplay_br_backfill_closed");
                break;
            }
            var_ac0f8be89fa21057 = (var_e5eae91657533f2 - var_428422cf7b2eb8ac) / 1000;
            var_a37e3649cfb19f73 = getdvarint(@"hash_f79cd84983250eda", 300);
            if (var_a37e3649cfb19f73 > 0 && var_ac0f8be89fa21057 >= var_a37e3649cfb19f73) {
                if (var_7cc9d575418d740e == 0 || var_7cc9d575418d740e <= getactiveclientcount(var_80593585eb825ba2)) {
                    break;
                }
            }
            if (var_ac0f8be89fa21057 <= getdvarint(@"hash_738a4f27bfac1d24", 15)) {
                if (getactiveclientcount(0) >= function_8396da2a86270f7d(maxplayers)) {
                    break;
                }
            } else if (getactiveclientcount(var_80593585eb825ba2) >= function_8396da2a86270f7d(maxplayers)) {
                break;
            }
            if (isdefined(level.var_cb87db3f189cf3f1)) {
                [[ level.var_cb87db3f189cf3f1 ]](var_a37e3649cfb19f73, var_ac0f8be89fa21057);
            }
            waitframe();
            var_e5eae91657533f2 = gettime();
        }
    }
    waitframe();
    level notify("start_prematch");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18538
// Size: 0x41
function brwatchforminplayersmatchstart() {
    level endon("start_prematch");
    while (level.players.size < getdvarint(@"hash_faf1db5754891b2d") || istrue(level.devoverridematchstart)) {
        waitframe();
    }
    waitframe();
    level notify("start_prematch");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18580
// Size: 0x18c
function watchdevoverridematchstart() {
    level.startbuttons = [];
    var_8811d5121ba0a25a = getentarray("start_lobby_trigger", "targetname");
    level thread waitforoverridematchstartdvar();
    level thread waitforoverridematchstartnotify();
    if (var_8811d5121ba0a25a.size == 0) {
        level thread waitforinitialplayerloadspawnflag();
    } else {
        foreach (trigger in var_8811d5121ba0a25a) {
            if (isdefined(trigger.target)) {
                visuals[0] = getent(trigger.target, "targetname");
            } else {
                visuals[0] = spawn("script_model", trigger.origin);
                visuals[0].angles = trigger.angles;
            }
            var_241255daed14734b = namespace_19b4203b51d56488::createuseobject("neutral", trigger, visuals, (0, 0, 64), undefined, 1);
            var_241255daed14734b namespace_19b4203b51d56488::allowuse("any");
            var_241255daed14734b.id = "use";
            var_241255daed14734b.trigger setuseprioritymax();
            var_241255daed14734b namespace_19b4203b51d56488::setusetime(3);
            var_241255daed14734b namespace_19b4203b51d56488::setusehinttext("MP_INGAME_ONLY/HOLD_TO_START_GAME");
            var_241255daed14734b.onuse = &startbutton_onuse;
            level.startbuttons[level.startbuttons.size] = var_241255daed14734b;
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18713
// Size: 0x366
function waitforinitialplayerloadspawnflag() {
    level endon("game_ended");
    level endon("start_prematch");
    player = level waittill("connected");
    player waittill("giveLoadout");
    waitframe();
    visuals[0] = spawn("script_model", player.origin);
    trigger = visuals[0];
    visuals[0] setmodel("tag_origin");
    useteam = "any";
    usetime = 3;
    org = (31983, -35229, -458);
    trigger.team = "neutral";
    level.startbuttons[0] = namespace_19b4203b51d56488::createholduseobject(useteam, trigger, visuals, (0, 0, 0));
    level.startbuttons[0].curorigin = org;
    level.startbuttons[0].trigger.origin = org;
    level.startbuttons[0].visuals[0].origin = org;
    level.startbuttons[0].trigger makeusable();
    level.startbuttons[0].ownerteam = trigger.team;
    level.startbuttons[0].trigger.owner = level.players[0];
    level.startbuttons[0].interactteam = "any";
    level.startbuttons[0].curprogress = 0;
    level.startbuttons[0].userate = 1;
    level.startbuttons[0].id = "use";
    level.startbuttons[0].exclusiveuse = 0;
    level.startbuttons[0].exclusiveclaim = 1;
    level.startbuttons[0].skiptouching = 1;
    level.startbuttons[0].skipminimapids = 1;
    level.startbuttons[0].trigger setcursorhint("HINT_NOICON");
    level.startbuttons[0].trigger setusehideprogressbar(1);
    level.startbuttons[0].trigger sethintstring("MP_INGAME_ONLY/HOLD_TO_START_GAME");
    level.startbuttons[0].trigger setuseprioritymax();
    level.startbuttons[0].onuse = &startbutton_onuse;
    level.startbuttons[0].flagmodel = spawn("script_model", org);
    level.startbuttons[0].flagmodel setmodel("prop_flag_neutral");
    level.startbuttons[0].usabilitytrigger = spawn("trigger_radius", org, 0, 32, 128);
    level.startbuttons[0] namespace_19b4203b51d56488::setusetime(usetime);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a80
// Size: 0x4e
function waitforoverridematchstartdvar() {
    level endon("game_ended");
    level endon("dev_force_start_completed");
    /#
        setdevdvarifuninitialized(@"hash_a2aaa37f176aa49", 0);
    #/
    while (1) {
        if (getdvarint(@"hash_a2aaa37f176aa49", 0)) {
            dev_forcelivelobbystart();
            break;
        }
        wait(0.5);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ad5
// Size: 0x20
function waitforoverridematchstartnotify() {
    level endon("game_ended");
    level endon("dev_force_start_completed");
    level waittill("forcematchstart");
    dev_forcelivelobbystart();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18afc
// Size: 0x20
function startbutton_onuse(player) {
    player setclientomnvar("ui_securing", 0);
    dev_forcelivelobbystart();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b23
// Size: 0x12e
function dev_forcelivelobbystart() {
    level thread namespace_a34451ae3d453e::playsoundonplayers("mp_dom_flag_captured");
    foreach (team in level.teamnamelist) {
        namespace_68747ec28caa9f9e::teamhudtutorialmessage("MP_INGAME_ONLY/GAME_FORCE_STARTED", team, 10);
    }
    setdvar(@"hash_faf1db5754891b2d", 1);
    setdvar(@"hash_cb2d56d085e5a9b9", 1);
    level notify("start_prematch");
    foreach (button in level.startbuttons) {
        button namespace_19b4203b51d56488::allowuse("none");
        button.trigger = undefined;
        button.visibleteam = "none";
        button.flagmodel delete();
        button notify("deleted");
    }
    level notify("dev_force_start_completed");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c58
// Size: 0xf7
function livelobbyrestart() {
    level.gameendtime = gettime();
    level.gameended = 1;
    level.ingraceperiod = 0;
    level.doeomcombat = 0;
    game["blockJIP"] = 1;
    waitframe();
    setgameendflagsandnotifies(undefined);
    waitframe();
    setgameendtime(0);
    thread namespace_bd0162aedd8c8594::logevent_sendplayerindexdata();
    if (namespace_bd0162aedd8c8594::analyticsspawnlogenabled()) {
        namespace_bd0162aedd8c8594::analyticsstorespawndata();
    }
    if (isdefined(level.matchrecording_dump)) {
        [[ level.matchrecording_dump ]]();
    }
    setdvar(@"hash_c6ca3fbc35dd960", 1);
    setdvar(@"hash_9995278b4b4099ae", 0);
    setdvar(@"hash_8ed4dff39f3251f5", 0);
    /#
        sendscriptusageanalysisdata(1, 1);
    #/
    livelobbyroundendwait(1);
    level notify("game_cleanup");
    setslowmotion(1, 0.4, 3);
    resetsoundtimescalefactor();
    namespace_4b0406965e556711::levelflagclear("block_notifies");
    restart();
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d56
// Size: 0x8f
function livelobbyroundendwait(defaultdelay) {
    var_8d539c1577794d34 = 0;
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (player iscodcaster()) {
            var_8d539c1577794d34 = level.var_7210bb7b0bfbcfdb;
        }
    }
    wait(defaultdelay + var_8d539c1577794d34);
    level notify("round_end_finished");
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18dec
// Size: 0x7c
function livelobbymatchstarttimer(type, duration) {
    self notify("matchStartTimer");
    self endon("matchStartTimer");
    level endon("match_cancel_timer_beginning");
    level notify("match_start_timer_beginning");
    if (istrue(level.var_60f7d8bd0181980f)) {
        return;
    }
    counttime = int(duration);
    if (counttime >= 2) {
        setomnvar("ui_match_start_text", type);
        matchstarttimerperplayer_internal(counttime);
    }
    visionsetnaked("", 0);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e6f
// Size: 0x15
function clearmatchhasmorethan1playervariablesonroundend() {
    game["numPlayersConsideredPlaying"] = 0;
    game["matchHasMoreThan1Player"] = 0;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e8b
// Size: 0x96
function updatematchhasmorethan1playeromnvaronplayersfirstspawn() {
    var_2d9482a14615cc39 = game["matchHasMoreThan1Player"];
    game["numPlayersConsideredPlaying"]++;
    if (!game["matchHasMoreThan1Player"]) {
        if (game["numPlayersConsideredPlaying"] > 1) {
            game["matchHasMoreThan1Player"] = 1;
        }
    }
    if (game["matchHasMoreThan1Player"]) {
        if (!var_2d9482a14615cc39) {
            for (i = 0; i < level.players.size; i++) {
                level.players[i] setclientomnvar("match_has_more_than_1_player", 1);
            }
        } else {
            self setclientomnvar("match_has_more_than_1_player", 1);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f28
// Size: 0x83
function updatematchhasmorethan1playeromnvaronplayerdisconnect() {
    var_2d9482a14615cc39 = game["matchHasMoreThan1Player"];
    game["numPlayersConsideredPlaying"]--;
    if (game["matchHasMoreThan1Player"]) {
        if (game["numPlayersConsideredPlaying"] <= 1) {
            game["matchHasMoreThan1Player"] = 0;
        }
    }
    if (!game["matchHasMoreThan1Player"]) {
        if (var_2d9482a14615cc39) {
            for (i = 0; i < level.players.size; i++) {
                level.players[i] setclientomnvar("match_has_more_than_1_player", 0);
            }
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fb2
// Size: 0x12c
function removepatchablecollision_delayed() {
    wait(10);
    var_5c2c9d034ebe9dcd = [];
    var_5c2c9d034ebe9dcd[1] = "tactical_ladder_col";
    var_5c2c9d034ebe9dcd[2] = "clip8x8x256";
    var_5c2c9d034ebe9dcd[3] = "player8x8x256";
    var_5c2c9d034ebe9dcd[4] = "ladderMetal264";
    var_5c2c9d034ebe9dcd[5] = "ladderWood192";
    var_5c2c9d034ebe9dcd[6] = "ladderMetal192";
    var_5c2c9d034ebe9dcd[7] = "mount128";
    var_5c2c9d034ebe9dcd[8] = "mount64";
    var_5c2c9d034ebe9dcd[9] = "mount32";
    var_5c2c9d034ebe9dcd[10] = "mount256";
    var_5c2c9d034ebe9dcd[11] = "ladderWood264";
    var_5c2c9d034ebe9dcd[12] = "nosight256x256x8";
    var_5c2c9d034ebe9dcd[13] = "nosight128x128x8";
    var_5c2c9d034ebe9dcd[14] = "mountCorner128";
    var_5c2c9d034ebe9dcd[15] = "mantle256";
    var_5c2c9d034ebe9dcd[16] = "mantle128";
    var_5c2c9d034ebe9dcd[17] = "mantle64";
    var_5c2c9d034ebe9dcd[18] = "mantle32";
    var_5c2c9d034ebe9dcd[19] = "stairsHalfFlight128";
    var_5c2c9d034ebe9dcd[20] = "stairsFullFlight128";
    foreach (name in var_5c2c9d034ebe9dcd) {
        namespace_36f464722d326bbe::removematchingents_bykey(name, "targetname");
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190e5
// Size: 0x5
function getbrendsplashpostgamestate() {
    return 8;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190f2
// Size: 0x33
function checkforsubgametypeoverrides() {
    level.allowsupers = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getsubgametype(), "_allowSupers"), level.allowsupers);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1912c
// Size: 0x143
function logendofround(player) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    if (!istrue(level.teambased) || istrue(level.multiteambased)) {
        return;
    }
    time_from_match_start = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
    playerteam = player.team;
    enemyteam = level.teamnamelist[0];
    if (playerteam == enemyteam) {
        enemyteam = level.teamnamelist[1];
    }
    var_f7f56e673c9f849d = getteamscore(playerteam);
    var_83fddf5a1089e6dc = getteamscore(enemyteam);
    var_400e97cc26b2638e = 0;
    if (isdefined(player.damagethisround)) {
        var_400e97cc26b2638e = player.damagethisround;
    }
    player dlog_recordplayerevent("dlog_event_end_of_round", [0:"time_from_match_start", 1:time_from_match_start, 2:"player_team_name", 3:playerteam, 4:"enemy_team_name", 5:enemyteam, 6:"player_team_score", 7:var_f7f56e673c9f849d, 8:"enemy_team_score", 9:var_83fddf5a1089e6dc, 10:"damage_this_round", 11:var_400e97cc26b2638e]);
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19276
// Size: 0x76
function function_fe94aaedd1047d50() {
    var_df6674bbd4c24df5 = 0;
    var_786f842d5771cdb6 = function_538e92208b641725();
    foreach (var_e72dfdb2a9343f1b in var_786f842d5771cdb6) {
        if (!var_e72dfdb2a9343f1b.isai) {
            var_df6674bbd4c24df5++;
        }
    }
    return var_df6674bbd4c24df5;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192f4
// Size: 0x69
function function_e48deb3d75ab2e92() {
    var_df6674bbd4c24df5 = 0;
    foreach (player in level.players) {
        if (!isai(player)) {
            var_df6674bbd4c24df5++;
        }
    }
    return var_df6674bbd4c24df5;
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19365
// Size: 0x66
function function_75092ad1ff9da748() {
    if (!isdefined(game["attackers"])) {
        setomnvar("ui_attacking_team", 0);
    }
    if (game["attackers"] == "axis") {
        setomnvar("ui_attacking_team", 1);
    } else if (game["attackers"] == "allies") {
        setomnvar("ui_attacking_team", 2);
    } else {
        setomnvar("ui_attacking_team", 0);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193d2
// Size: 0x579
function function_4c6436a7855aacd() {
    foreach (player in level.players) {
        player.featured_operator_skin_equipped = 0;
        if (issharedfuncdefined("seasonalevents", "hasFieldRepOperatorSkinEquipped")) {
            if (player function_f3bb4f4911a1beb2("seasonalevents", "hasFieldRepOperatorSkinEquipped")) {
                player.featured_operator_skin_equipped = 1;
            }
        }
        player.featured_operator_skin_bonus_active = 0;
        player.field_rep_xp_combat = 0;
        player.field_rep_xp_recon = 0;
        player.field_rep_xp_strategy = 0;
        player.field_rep_xp_support = 0;
        player.field_rep_xp_logistics = 0;
        player.field_rep_xp_featured_operator_skin_bonus = 0;
        player.player_match_time = 0;
        mode = undefined;
        sub_mode = undefined;
    }
    if (level function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
        if (function_ec3aea190c440d29(@"hash_a8f4c9a06bff4b76")) {
            var_2b4d2ddc4cefed8b = getdvarint(@"hash_a8f4c9a06bff4b76");
        } else {
            var_2b4d2ddc4cefed8b = 1000;
        }
        if (function_ec3aea190c440d29(@"hash_4906b1516f388c3b")) {
            var_3e0d9ec3b338973 = getdvarint(@"hash_4906b1516f388c3b");
        } else {
            var_3e0d9ec3b338973 = 240;
        }
        if (issharedfuncdefined("game_utility", "getTimeSinceGameStart")) {
            timesincestart = int(level function_f3bb4f4911a1beb2("game_utility", "getTimeSinceGameStart") / 1000) - 15;
        }
        if (timesincestart < var_3e0d9ec3b338973) {
            var_3e0d9ec3b338973 = timesincestart;
        }
        foreach (player in level.players) {
            timeplayed = player namespace_2685ec368e022695::statgetchildbuffered("round", "timePlayed", 0);
            if (player function_f3bb4f4911a1beb2("seasonalevents", "hasFieldRepOperatorSkinEquipped") && timeplayed >= var_3e0d9ec3b338973) {
                if (issharedfuncdefined("rank", "giveRankXP") && !istrue(player.var_a89b9be6ddf3798b)) {
                    player [[ getsharedfunc("rank", "giveRankXP") ]](#"hash_494bf50723a4f1e6", var_2b4d2ddc4cefed8b, undefined, 1, 1, 1);
                    player.var_a89b9be6ddf3798b = 1;
                }
                totalplayercount = 0;
                foreach (entry in level.teamnamelist) {
                    totalplayercount = totalplayercount + getteamdata(entry, "teamCount");
                    if (totalplayercount >= 2) {
                        player.pers["aarData"]["use_featured_operator_skin_xp"] = var_2b4d2ddc4cefed8b;
                        player.featured_operator_skin_bonus_active = 1;
                        player.field_rep_xp_featured_operator_skin_bonus = var_2b4d2ddc4cefed8b;
                        break;
                    }
                }
            }
        }
    }
    mode = getgametype();
    sub_mode = getsubgametype();
    foreach (player in level.players) {
        var_d51a5d00a613b0e8 = player namespace_3c5a4254f2b957ea::getpersstat("aarData");
        if (isdefined(var_d51a5d00a613b0e8["combat_xp"])) {
            player.field_rep_xp_combat = var_d51a5d00a613b0e8["combat_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["recon_xp"])) {
            player.field_rep_xp_recon = var_d51a5d00a613b0e8["recon_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["strategy_xp"])) {
            player.field_rep_xp_strategy = var_d51a5d00a613b0e8["strategy_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["support_xp"])) {
            player.field_rep_xp_support = var_d51a5d00a613b0e8["support_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["logistics_xp"])) {
            player.field_rep_xp_logistics = var_d51a5d00a613b0e8["logistics_xp"];
        }
        player.player_match_time = player namespace_2685ec368e022695::statgetchildbuffered("round", "timePlayed", 0);
        player dlog_recordplayerevent("dlog_event_player_field_rep_eom_report", [0:"featured_operator_skin_equipped", 1:player.featured_operator_skin_equipped, 2:"featured_operator_skin_bonus_active", 3:player.featured_operator_skin_bonus_active, 4:"field_rep_xp_combat", 5:player.field_rep_xp_combat, 6:"field_rep_xp_recon", 7:player.field_rep_xp_recon, 8:"field_rep_xp_strategy", 9:player.field_rep_xp_strategy, 10:"field_rep_xp_support", 11:player.field_rep_xp_support, 12:"field_rep_xp_logistics", 13:player.field_rep_xp_logistics, 14:"field_rep_xp_featured_operator_skin_bonus", 15:player.field_rep_xp_featured_operator_skin_bonus, 16:"player_match_time", 17:player.player_match_time, 18:"mode", 19:mode, 20:"sub_mode", 21:sub_mode]);
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19952
// Size: 0x16e
function function_3f2ab7272697e5b8(inplayer) {
    var_2b4d2ddc4cefed8b = getdvarint(@"hash_a8f4c9a06bff4b76", 1000);
    var_3e0d9ec3b338973 = getdvarint(@"hash_4906b1516f388c3b", 240);
    if (!isdefined(inplayer) || isbot(inplayer) || istestclient(inplayer)) {
        return;
    }
    if (!game["timePassed"]) {
        return;
    }
    if (!(matchmakinggame() || getdvarint(@"hash_37acf332efd205cc"))) {
        return;
    }
    if (isdefined(self.brbonusxpallowed) && self.brbonusxpallowed == 0) {
        return;
    }
    if (isdefined(level.startofxptime)) {
        timeplayed = (gettime() - level.startofxptime) / 1000;
    } else {
        timeplayed = inplayer namespace_2685ec368e022695::statgetchildbuffered("round", "timePlayed", 0);
    }
    if (inplayer function_f3bb4f4911a1beb2("seasonalevents", "hasFieldRepOperatorSkinEquipped") && timeplayed >= var_3e0d9ec3b338973) {
        if (issharedfuncdefined("rank", "giveRankXP") && !istrue(inplayer.var_a89b9be6ddf3798b)) {
            inplayer [[ getsharedfunc("rank", "giveRankXP") ]](#"hash_494bf50723a4f1e6", var_2b4d2ddc4cefed8b, undefined, 1, 1, 1);
            inplayer.var_a89b9be6ddf3798b = 1;
        }
        inplayer.pers["aarData"]["use_featured_operator_skin_xp"] = var_2b4d2ddc4cefed8b;
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ac7
// Size: 0x74
function function_8abcf76787cc51aa(player) {
    gametype = getgametype();
    if (isdefined(gametype) && (gametype == "koth_horde" || gametype == "br" || gametype == "ob")) {
        if (isdefined(player) && isplayer(player)) {
            player function_3fec3b7eff58e283(gametype);
        } else {
            utility::array_thread(level.players, &function_3fec3b7eff58e283, gametype);
        }
    }
}

// Namespace gamelogic/namespace_d576b6dc7cef9c62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b42
// Size: 0x1c3
function function_3fec3b7eff58e283(gametype) {
    player = self;
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && istrue(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").var_5340761ae0b3ecee)) {
        return;
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = undefined;
    var_7e2c53b0bcf117d9.playlistid = -1;
    var_7e2c53b0bcf117d9.mode = "undefined";
    var_7e2c53b0bcf117d9.sub_mode = "undefined";
    var_7e2c53b0bcf117d9.var_7a6ac7215233ccec = 0;
    var_7e2c53b0bcf117d9.var_672fddf6e349a36e = 0;
    var_7e2c53b0bcf117d9.var_c51d1b15c65d5d90 = 0;
    var_7e2c53b0bcf117d9.var_f27f3e1f5b37b692 = 0;
    var_7e2c53b0bcf117d9.player = player;
    var_7e2c53b0bcf117d9.playlistid = getplaylistid();
    var_7e2c53b0bcf117d9.mode = gametype;
    var_7e2c53b0bcf117d9.sub_mode = getsubgametype();
    if (isdefined(player.var_74ac8f1bfad7368b)) {
        var_7e2c53b0bcf117d9.var_7a6ac7215233ccec = player.var_74ac8f1bfad7368b;
    }
    if (isdefined(player.var_d0b217f00fef3917)) {
        var_7e2c53b0bcf117d9.var_672fddf6e349a36e = player.var_d0b217f00fef3917;
    }
    if (isdefined(player.var_d848e2025d8597d2)) {
        var_7e2c53b0bcf117d9.var_c51d1b15c65d5d90 = player.var_d848e2025d8597d2;
    }
    if (isdefined(player.var_92e210c188ad9778)) {
        var_7e2c53b0bcf117d9.var_f27f3e1f5b37b692 = player.var_92e210c188ad9778;
    }
    player.pers["telemetry"].var_5340761ae0b3ecee = 1;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_the_hunt_eom", var_7e2c53b0bcf117d9);
}

