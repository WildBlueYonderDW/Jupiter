// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_600b944a95c3a7bf;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_4c770a9a4ad7659c;
#using script_3f8889c16399185c;
#using script_3214e6fcdce468a7;
#using script_4a6760982b403bad;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\teams.gsc;
#using script_3aacf02225ca0da5;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\weaponrank.gsc;
#using script_3e784a4247cea64b;
#using scripts\mp\class.gsc;
#using script_2892a7e13357d95b;

#namespace namespace_3a38da80071a2614;

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3283
// Size: 0x1b7
function init() {
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_match_start", &function_393baf20db478c0d);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_match_end", &function_f5f91665fe4dba94);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_round_start", &function_8eeea3969df7e964);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_round_end", &on_round_end);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_server_exit_level", &function_69ddf7a3e512a18a);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_first_connect", &on_player_connect);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_spawned", &on_player_spawned);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_player_death", &on_player_death);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_disconnect", &on_player_disconnect);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_player_new_loadout_used", &function_60912f12edbae676);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_update_weapon_stats", &function_6a347a3138ec63e1);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_player_score_event", &function_ac6b649326f4b17e);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_game_event", &function_c72337759677531c);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_armor_auto_apply", &function_1879ce4fba1cd65d);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_reload_cancel", &function_6a9aa1d51a6bacc3);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_dmz_on_exfil", &function_675feb1c926f55a3);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_dmz_on_reinforce", &function_a884632edebe7d1e);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_dmz_on_lpcon_alert", &function_532119a556885727);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_dmz_on_container", &function_4fc7f0119fc38d0c);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_dmz_contract", &function_89d4104dbacb6aef);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_the_hunt_eom", &function_42db4e92349e1fee);
    level callback::add("on_ai_killed", &on_ai_killed);
    if (!isdefined(level.mp_ai_killed_telemetry_throttle)) {
        level.mp_ai_killed_telemetry_throttle = function_e4c99b0f178ffb98("mp_ai_killed_telemetry_throttle", 1, level.framedurationseconds);
    }
    setdvarifuninitialized(@"hash_817f686503ccdecf", 5);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3441
// Size: 0x27f
function function_393baf20db478c0d() {
    utc_start_time_s = getsystemtime();
    setmatchdata("commonMatchData", "utc_start_time_s", utc_start_time_s);
    setmatchdata("commonMatchData", "player_count_start", level.players.size);
    if (isdefined(game["telemetry"])) {
        game["telemetry"].utc_start_time_s = utc_start_time_s;
    }
    game_type = getgametype();
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        game_type = game_type + " hc";
    }
    sub_game_type = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    playlist_id = 0;
    playlist_name = "";
    if (matchmakinggame()) {
        playlist_id = getplaylistid();
        playlist_name = getplaylistname();
    }
    is_ranked = 0;
    if (istrue(level.var_ec2fb549b15ad827) || istrue(level.var_77907d733abe8b63)) {
        is_ranked = 1;
    }
    max_players_allowed = getdvarint(@"hash_818c699a5caaee4f", -1);
    frame_duration = function_676cfe2ab64ea758();
    dlog_recordevent("dlog_event_mp_server_match_start", [0:"utc_start_time_s", 1:utc_start_time_s, 2:"map", 3:level.script, 4:"game_type", 5:game_type, 6:"is_playtest", 7:getdvarint(@"hash_2e58447fa1ca4f20") && getdvarint(@"hash_51f11c2e135abc7"), 8:"experiment_name", 9:getdvar(@"hash_409a139e3e0eb905"), 10:"dedi_server_guid", 11:getdediserverguid(), 12:"sub_game_type", 13:sub_game_type, 14:"playlist_id", 15:playlist_id, 16:"playlist_name", 17:playlist_name, 18:"is_offline", 19:!level.onlinegame, 20:"max_players_allowed", 21:max_players_allowed, 22:"frame_duration", 23:frame_duration, 24:"is_ranked", 25:is_ranked]);
    var_37aab353fe84a505 = "{"game_type":"" + game_type + "","sub_game_type":"" + sub_game_type + "","map":"" + level.script + ""}";
    function_7bcd667fc073fc12("server_match_start", var_37aab353fe84a505);
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        utility::trycall(level.matchdata_br_onmatchstart);
    }
    onmatchbegin();
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c7
// Size: 0x305
function function_f5f91665fe4dba94(data) {
    utc_start_time_s = 0;
    total_player_connections = 0;
    life_count = 0;
    game_type = getgametype();
    game_event_count = 0;
    if (isdefined(game["telemetry"].utc_start_time_s)) {
        utc_start_time_s = game["telemetry"].utc_start_time_s;
    }
    if (isdefined(game["telemetry"].total_player_connections)) {
        total_player_connections = game["telemetry"].total_player_connections;
    }
    if (isdefined(game["telemetry"].life_count)) {
        life_count = game["telemetry"].life_count;
    }
    if (isdefined(game["telemetry"].game_event_count)) {
        game_event_count = game["telemetry"].game_event_count;
    }
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        game_type = game_type + " hc";
    }
    playlist_id = 0;
    playlist_name = "";
    if (matchmakinggame()) {
        playlist_id = getplaylistid();
        playlist_name = getplaylistname();
    }
    allies_score = 0;
    axis_score = 0;
    team_three_score = 0;
    if (level.teambased) {
        allies_score = getteamscore("allies");
        axis_score = getteamscore("axis");
        if (isgameplayteam("team_three")) {
            team_three_score = getteamscore("team_three");
        }
    }
    max_players_allowed = getdvarint(@"hash_818c699a5caaee4f", -1);
    is_ranked = 0;
    if (istrue(level.var_ec2fb549b15ad827) || istrue(level.var_77907d733abe8b63)) {
        is_ranked = 1;
    }
    var_d4687bb3ed2b03b3 = function_6b9f8406e6153597();
    dlog_recordevent("dlog_event_mp_server_match_end", [0:"utc_start_time_s", 1:utc_start_time_s, 2:"utc_end_time_s", 3:getsystemtime(), 4:"total_player_connections", 5:total_player_connections, 6:"life_count", 7:life_count, 8:"playlist_id", 9:playlist_id, 10:"playlist_name", 11:playlist_name, 12:"game_type", 13:game_type, 14:"map", 15:level.script, 16:"is_offline", 17:!level.onlinegame, 18:"allies_score", 19:allies_score, 20:"axis_score", 21:axis_score, 22:"team_three_score", 23:team_three_score, 24:"game_event_count", 25:game_event_count, 26:"weapon_map_watermark", 27:function_949690bfcbcdc8cf(), 28:"max_players_allowed", 29:max_players_allowed, 30:"is_ranked", 31:is_ranked, 32:"is_archive_replay_recorded", 33:var_d4687bb3ed2b03b3]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d3
// Size: 0x34
function function_8eeea3969df7e964(data) {
    if (isdefined(game["telemetry"])) {
        game["telemetry"].round_start_time_ms = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a0e
// Size: 0xca
function on_round_end(data) {
    round_start_time_ms = 0;
    if (isdefined(game["telemetry"].round_start_time_ms)) {
        round_start_time_ms = game["telemetry"].round_start_time_ms;
    }
    allies_score = 0;
    axis_score = 0;
    if (level.teambased) {
        allies_score = getteamscore("allies");
        axis_score = getteamscore("axis");
    }
    dlog_recordevent("dlog_event_mp_server_round_end", [0:"round_start_time_ms", 1:round_start_time_ms, 2:"round_end_time_ms", 3:namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime()), 4:"allies_score", 5:allies_score, 6:"axis_score", 7:axis_score]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3adf
// Size: 0x98e
function on_player_connect(player) {
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
        return;
    }
    if (!isdefined(player.pers["telemetry"]) || !isdefined(player.pers["telemetry"].connected)) {
        if (!isdefined(player.pers["telemetry"])) {
            player.pers["telemetry"] = spawnstruct();
        }
        if (isdefined(game["telemetry"]) && isdefined(game["telemetry"].total_player_connections)) {
            player.pers["telemetry"].connect_index = game["telemetry"].total_player_connections;
            game["telemetry"].total_player_connections++;
        } else {
            /#
                println("");
            #/
            return;
        }
        player.pers["telemetry"].utc_connect_time_s = getsystemtime();
        player.pers["telemetry"].connected = 1;
        player.pers["telemetry"].shots = 0;
        player.pers["telemetry"].hits = 0;
        if (player rankingenabled() && player hasplayerdata()) {
            xp_at_start = player getplayerdata("common", "mpProgression", "playerLevel", "xp");
            player.pers["telemetry"].xp_at_start = xp_at_start;
            player.pers["telemetry"].rank_at_start = player getrankforxp(xp_at_start);
            player.pers["telemetry"].score_at_start = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchStats", "score");
            player.pers["telemetry"].prestige_at_start = player getplayerdata(level.loadoutsgroup, "squadMembers", "season_rank");
        } else {
            player.pers["telemetry"].xp_at_start = 0;
            player.pers["telemetry"].rank_at_start = 0;
            player.pers["telemetry"].score_at_start = 0;
            player.pers["telemetry"].prestige_at_start = 0;
        }
        is_party_host = 0;
        if (level.onlinegame) {
            is_party_host = player isfireteamleader();
        }
        operator_allies = "";
        operator_axis = "";
        operator_allies_skin = -1;
        operator_axis_skin = -1;
        operator_allies_execution_ref = "none";
        operator_axis_execution_ref = "none";
        game_type = getgametype();
        if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
            game_type = game_type + " hc";
        }
        sub_game_type = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        playlist_id = 0;
        playlist_name = "";
        if (matchmakinggame()) {
            playlist_id = getplaylistid();
            playlist_name = getplaylistname();
        }
        connect_index = 0;
        if (isdefined(player.pers["telemetry"].connect_index)) {
            connect_index = player.pers["telemetry"].connect_index;
        }
        lobby_id = function_4f9373a1227db35c();
        if (!isdefined(lobby_id)) {
            lobby_id = "";
        }
        var_5a0fc1d304e970ea = "unset";
        if (isdefined(player.sessionteam)) {
            var_5a0fc1d304e970ea = player.sessionteam;
        }
        if (isdefined(player.team)) {
            var_5a0fc1d304e970ea = player.team;
        }
        is_ranked = 0;
        ranked_skill_rating = 0;
        if (istrue(level.var_ec2fb549b15ad827)) {
            is_ranked = 1;
            xuid = player getxuid();
            ranked_skill_rating = function_904672268eb8e3fe(xuid);
        } else if (istrue(level.var_77907d733abe8b63)) {
            is_ranked = 1;
        }
        is_controller = player usinggamepad();
        player dlog_recordplayerevent("dlog_event_mp_player_match_start", [0:"utc_connect_time_s", 1:player.pers["telemetry"].utc_connect_time_s, 2:"team", 3:var_5a0fc1d304e970ea, 4:"join_type", 5:player getjointype(), 6:"skill", 7:player getskill(), 8:"party_id", 9:player getpartyid(), 10:"is_party_host", 11:is_party_host, 12:"was_keyboardmouse", 13:player function_989faa3e2f2d8c47() != 1, 14:"operator_allies", 15:operator_allies, 16:"operator_axis", 17:operator_axis, 18:"operator_allies_skin", 19:operator_allies_skin, 20:"operator_axis_skin", 21:operator_axis_skin, 22:"operator_allies_execution_ref", 23:operator_allies_execution_ref, 24:"operator_axis_execution_ref", 25:operator_axis_execution_ref, 26:"map", 27:level.script, 28:"playlist_id", 29:playlist_id, 30:"playlist_name", 31:playlist_name, 32:"game_type", 33:game_type, 34:"sub_game_type", 35:sub_game_type, 36:"connect_index", 37:connect_index, 38:"lobby_id", 39:lobby_id, 40:"is_ranked", 41:is_ranked, 42:"ranked_skill_rating", 43:ranked_skill_rating, 44:"map_voting_options", 45:player function_d5eb9e0d720451d2(), 46:"map_voted_for", 47:player function_2e4d79c3a2ff19f1(), 48:"mode_voting_options", 49:player function_c0efdb4dd083127f(), 50:"mode_voted_for", 51:player function_fd9ddaae72038754(), 52:"is_controller", 53:is_controller]);
        function_7bcd667fc073fc12("player_match_start", "");
        if (!isdefined(player.pers["telemetry"].player_score_event_count)) {
            player.pers["telemetry"].player_score_event_count = 0;
        }
        if (!isdefined(player.pers["telemetry"].player_weapon_stats_count)) {
            player.pers["telemetry"].player_weapon_stats_count = 0;
        }
        if (!isdefined(player.pers["telemetry"].kill_streak_expired_count)) {
            player.pers["telemetry"].kill_streak_expired_count = 0;
        }
        if (!isdefined(player.pers["telemetry"].player_loadout_count)) {
            player.pers["telemetry"].player_loadout_count = 0;
        }
        if (!isdefined(player.pers["telemetry"].ai_agent_kills)) {
            player.pers["telemetry"].ai_agent_kills = 0;
        }
        if (!isdefined(player.pers["telemetry"].armor_collected)) {
            player.pers["telemetry"].armor_collected = 0;
        }
        if (!isdefined(player.pers["telemetry"].armor_equipped)) {
            player.pers["telemetry"].armor_equipped = 0;
        }
        if (!isdefined(player.pers["telemetry"].armor_destroyed)) {
            player.pers["telemetry"].armor_destroyed = 0;
        }
        if (!isdefined(player.pers["telemetry"].vehicle_autofwd_count)) {
            player.pers["telemetry"].vehicle_autofwd_count = 0;
        }
        if (!isdefined(player.pers["telemetry"].ground_vehicle_used_count)) {
            player.pers["telemetry"].ground_vehicle_used_count = 0;
        }
        if (!isdefined(player.pers["telemetry"].air_vehicle_used_count)) {
            player.pers["telemetry"].air_vehicle_used_count = 0;
        }
        if (!isdefined(player.pers["telemetry"].var_a3ef8d971ec61fc7)) {
            player.pers["telemetry"].var_a3ef8d971ec61fc7 = 0;
        }
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4474
// Size: 0x1c5
function on_player_spawned(player) {
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
        return;
    }
    if (!isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry"))) {
        player.pers["telemetry"] = spawnstruct();
    }
    if (!isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life)) {
        player.pers["telemetry"].life = spawnstruct();
    }
    if (isdefined(game["telemetry"]) && isdefined(game["telemetry"].life_count)) {
        player.pers["telemetry"].life.life_index = game["telemetry"].life_count;
        game["telemetry"].life_count++;
    }
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("summary")["xp"])) {
        player.pers["telemetry"].life.var_2148fb703835ec1f = player namespace_3c5a4254f2b957ea::getpersstat("summary")["xp"];
    } else {
        player.pers["telemetry"].life.var_2148fb703835ec1f = 0;
    }
    if (isdefined(player.score)) {
        player.pers["telemetry"].life.var_7e5250b5700df037 = player.score;
    } else {
        player.pers["telemetry"].life.var_7e5250b5700df037 = 0;
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4640
// Size: 0x75
function function_69ddf7a3e512a18a() {
    foreach (player in level.players) {
        data = spawnstruct();
        data.player = player;
        function_6447f24addc0137e(data);
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46bc
// Size: 0x1acb
function function_6447f24addc0137e(data) {
    player = data.player;
    if (!isdefined(player.pers["telemetry"].var_d6caa636bc3fce32)) {
        if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
            return;
        }
        if (istrue(player.var_6a91d0e80cc504e) && !istrue(level.gameended)) {
            return;
        }
        var_fdf9b22d16276454 = 0;
        if (isdefined(player.pers["telemetry"].utc_connect_time_s)) {
            var_fdf9b22d16276454 = player.pers["telemetry"].utc_connect_time_s;
        }
        disconnect_reason = #"";
        if (isdefined(data.var_934dc135aaf6f953)) {
            disconnect_reason = data.var_934dc135aaf6f953;
        }
        team_xp_modifier = 0;
        if (level.teambased) {
            team_xp_modifier = int(player namespace_62c556437da28f50::getteamrankxpmultiplier(player.team));
        }
        connect_index = 0;
        if (isdefined(player.pers["telemetry"].connect_index)) {
            connect_index = player.pers["telemetry"].connect_index;
        }
        total_xp = 0;
        score_xp = 0;
        challenge_xp = 0;
        match_xp = 0;
        medal_xp = 0;
        bonus_xp = 0;
        misc_xp = 0;
        accolade_xp = 0;
        weapon_xp = 0;
        operator_xp = 0;
        clan_xp = 0;
        battlepass_xp = 0;
        if (player onlinestatsenabled()) {
            if (isdefined(player.pers["summary"]["xp"])) {
                total_xp = player.pers["summary"]["xp"];
            }
            if (isdefined(player.pers["summary"]["score"])) {
                score_xp = player.pers["summary"]["score"];
            }
            if (isdefined(player.pers["summary"]["challenge"])) {
                challenge_xp = player.pers["summary"]["challenge"];
            }
            if (isdefined(player.pers["summary"]["match"])) {
                match_xp = player.pers["summary"]["match"];
            }
            if (isdefined(player.pers["summary"]["medal"])) {
                medal_xp = player.pers["summary"]["medal"];
            }
            if (isdefined(player.pers["summary"]["bonusXP"])) {
                bonus_xp = player.pers["summary"]["bonusXP"];
            }
            if (isdefined(player.pers["summary"]["misc"])) {
                misc_xp = player.pers["summary"]["misc"];
            }
            if (isdefined(player.pers["summary"]["accolade"])) {
                accolade_xp = player.pers["summary"]["accolade"];
            }
            if (isdefined(player.pers["summary"]["weaponXP"])) {
                weapon_xp = player.pers["summary"]["weaponXP"];
            }
            if (isdefined(player.pers["summary"]["operatorXP"])) {
                operator_xp = player.pers["summary"]["operatorXP"];
            }
            if (isdefined(player.pers["summary"]["clanXP"])) {
                clan_xp = player.pers["summary"]["clanXP"];
            }
            if (isdefined(player.pers["summary"]["battlepassXP"])) {
                battlepass_xp = int(player.pers["summary"]["battlepassXP"]);
            }
        }
        var_b0f8f036d47c34ba = spawnstruct();
        var_b0f8f036d47c34ba.rank_at_start = 0;
        if (isdefined(player.pers["telemetry"].rank_at_start)) {
            var_b0f8f036d47c34ba.rank_at_start = player.pers["telemetry"].rank_at_start;
        }
        var_b0f8f036d47c34ba.xp_at_start = 0;
        if (isdefined(player.pers["telemetry"].xp_at_start)) {
            var_b0f8f036d47c34ba.xp_at_start = player.pers["telemetry"].xp_at_start;
        }
        var_b0f8f036d47c34ba.score_at_start = 0;
        if (isdefined(player.pers["telemetry"].score_at_start)) {
            var_b0f8f036d47c34ba.score_at_start = player.pers["telemetry"].score_at_start;
        }
        var_b0f8f036d47c34ba.prestige_at_start = 0;
        if (isdefined(player.pers["telemetry"].prestige_at_start)) {
            var_b0f8f036d47c34ba.prestige_at_start = player.pers["telemetry"].prestige_at_start;
        }
        if (player rankingenabled() && player hasplayerdata()) {
            var_b0f8f036d47c34ba.xp_at_end = player getplayerdata("common", "mpProgression", "playerLevel", "xp");
            var_b0f8f036d47c34ba.rank_at_end = player getrankforxp(var_b0f8f036d47c34ba.xp_at_end);
            var_b0f8f036d47c34ba.score_at_end = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchStats", "score");
            var_b0f8f036d47c34ba.prestige_at_end = player getplayerdata(level.loadoutsgroup, "squadMembers", "season_rank");
            var_b0f8f036d47c34ba.lifetime_kills = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "combatStats", "kills");
            var_b0f8f036d47c34ba.lifetime_deaths = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "combatStats", "deaths");
            var_b0f8f036d47c34ba.lifetime_wins = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchStats", "wins");
            var_b0f8f036d47c34ba.lifetime_losses = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchStats", "losses");
            var_b0f8f036d47c34ba.lifetime_hits = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "combatStats", "hits");
            var_b0f8f036d47c34ba.lifetime_misses = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "combatStats", "misses");
            var_b0f8f036d47c34ba.lifetime_wall_bangs = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "combatStats", "wallbangs");
            var_b0f8f036d47c34ba.lifetime_near_misses = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "combatStats", "nearMisses");
            var_b0f8f036d47c34ba.lifetime_games_played = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchStats", "gamesPlayed");
            var_b0f8f036d47c34ba.lifetime_time_played_total = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", "matchStats", "timePlayedTotal");
        } else {
            var_b0f8f036d47c34ba.xp_at_end = 0;
            var_b0f8f036d47c34ba.rank_at_end = 0;
            var_b0f8f036d47c34ba.score_at_end = 0;
            var_b0f8f036d47c34ba.prestige_at_end = 0;
            var_b0f8f036d47c34ba.lifetime_kills = 0;
            var_b0f8f036d47c34ba.lifetime_deaths = 0;
            var_b0f8f036d47c34ba.lifetime_wins = 0;
            var_b0f8f036d47c34ba.lifetime_losses = 0;
            var_b0f8f036d47c34ba.lifetime_hits = 0;
            var_b0f8f036d47c34ba.lifetime_misses = 0;
            var_b0f8f036d47c34ba.lifetime_wall_bangs = 0;
            var_b0f8f036d47c34ba.lifetime_near_misses = 0;
            var_b0f8f036d47c34ba.lifetime_games_played = 0;
            var_b0f8f036d47c34ba.lifetime_time_played_total = 0;
        }
        player_quit_round_number = -1;
        player_quit_team_score = 0;
        player_quit_opposing_team_score = 0;
        if (isdefined(data.var_934dc135aaf6f953)) {
            if (isroundbased()) {
                player_quit_round_number = game["roundsPlayed"];
            }
            if (level.teambased) {
                if (isdefined(player.team)) {
                    if (player.team == "allies") {
                        player_quit_team_score = getteamscore("allies");
                        player_quit_opposing_team_score = getteamscore("axis");
                    } else if (player.team == "axis") {
                        player_quit_team_score = getteamscore("axis");
                        player_quit_opposing_team_score = getteamscore("allies");
                    }
                }
            }
        }
        percent_time_moving = 0;
        average_speed_during_match = 0;
        if (isdefined(player.pers["movementUpdateCount"]) && player.pers["movementUpdateCount"] >= 30) {
            percent_time_moving = player.pers["movingTotal"] / player.pers["movementUpdateCount"] / 5 * 100;
            average_speed_during_match = player.pers["distanceTotal"] / player.pers["movementUpdateCount"];
        }
        damage_done = player getpersstat("damage");
        if (!isdefined(damage_done)) {
            damage_done = 0;
        }
        damage_taken = player getpersstat("damageTaken");
        if (!isdefined(damage_taken)) {
            damage_taken = 0;
        }
        distance_traveled = 0;
        if (isdefined(player.pers["totalDistTraveled"])) {
            distance_traveled = float(player.pers["totalDistTraveled"]);
        }
        weapon_accuracy = 0;
        totalshots = player namespace_a9b836227bcbf6e6::getplayerstat("combatStats", "totalShots");
        totalhits = player namespace_a9b836227bcbf6e6::getplayerstat("combatStats", "hits");
        if (isdefined(totalshots) && isdefined(totalhits) && totalshots > 0) {
            weapon_accuracy = float(totalhits / totalshots * 100);
        }
        suicides = 0;
        if (isdefined(player.pers["suicides"])) {
            suicides = player getpersstat("suicides");
        }
        gw_spawn_method_press_rclick = 0;
        gw_spawn_method_press_lclick = 0;
        gw_spawn_method_press_activate = 0;
        gw_spawn_method_press_gostand = 0;
        if ((getgametype() == "arm" || getgametype() == "conflict") && isdefined(player.gwinputtypesused)) {
            gw_spawn_method_press_rclick = istrue(player.gwinputtypesused["rightmouseup"]);
            gw_spawn_method_press_lclick = istrue(player.gwinputtypesused["leftmouseup"]);
            gw_spawn_method_press_activate = istrue(player.gwinputtypesused["activate"]);
            gw_spawn_method_press_gostand = istrue(player.gwinputtypesused["gostand"]);
        }
        game_type = getgametype();
        if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
            game_type = game_type + " hc";
        }
        playlist_id = 0;
        playlist_name = "";
        if (matchmakinggame()) {
            playlist_id = getplaylistid();
            playlist_name = getplaylistname();
        }
        match_outcome = "loss";
        if (isdefined(player.pers["match_outcome"])) {
            match_outcome = player.pers["match_outcome"];
        }
        shots = 0;
        if (isdefined(player.pers["telemetry"].shots)) {
            shots = player.pers["telemetry"].shots;
        }
        hits = 0;
        if (isdefined(player.pers["telemetry"].hits)) {
            hits = player.pers["telemetry"].hits;
        }
        var_afbdfaa766bb101 = spawnstruct();
        var_afbdfaa766bb101.player_score_event_count = 0;
        if (isdefined(player.pers["telemetry"].player_score_event_count)) {
            var_afbdfaa766bb101.player_score_event_count = player.pers["telemetry"].player_score_event_count;
        }
        player namespace_3bbb5a98b932c46f::function_c49a0d832ace8e5e();
        player namespace_2685ec368e022695::updateweaponbufferedstats();
        function_8076b5556f48a6cd(player);
        var_afbdfaa766bb101.player_weapon_stats_count = 0;
        if (isdefined(player.pers["telemetry"].player_weapon_stats_count)) {
            var_afbdfaa766bb101.player_weapon_stats_count = player.pers["telemetry"].player_weapon_stats_count;
        }
        var_afbdfaa766bb101.kill_streak_expired_count = 0;
        if (isdefined(player.pers["telemetry"].kill_streak_expired_count)) {
            var_afbdfaa766bb101.kill_streak_expired_count = player.pers["telemetry"].kill_streak_expired_count;
        }
        var_afbdfaa766bb101.player_loadout_count = 0;
        if (isdefined(player.pers["telemetry"].player_loadout_count)) {
            var_afbdfaa766bb101.player_loadout_count = player.pers["telemetry"].player_loadout_count;
        }
        var_afbdfaa766bb101.ai_agent_kills = 0;
        if (isdefined(player.pers["telemetry"].ai_agent_kills)) {
            var_afbdfaa766bb101.ai_agent_kills = player.pers["telemetry"].ai_agent_kills;
        }
        var_93136a376f20de5c = spawnstruct();
        var_93136a376f20de5c.operator = "";
        var_93136a376f20de5c.operator_skin = "";
        var_93136a376f20de5c.operator_execution_ref = "none";
        if (isdefined(player) && !isbot(player) && isdefined(player.team)) {
            var_93136a376f20de5c.operator = player namespace_6d8da2b47f878104::lookupcurrentoperator(player.team);
            var_93136a376f20de5c.operator_skin = player namespace_6d8da2b47f878104::function_ed273e317490cb02(var_93136a376f20de5c.operator);
            var_93136a376f20de5c.execution = player namespace_6d8da2b47f878104::getoperatorexecution(var_93136a376f20de5c.operator);
            if (isdefined(var_93136a376f20de5c.execution)) {
                var_93136a376f20de5c.operator_execution_ref = var_93136a376f20de5c.execution;
            }
        }
        lobby_id = function_4f9373a1227db35c();
        if (!isdefined(lobby_id)) {
            lobby_id = "";
        }
        current_season = getdvarint(@"hash_71ef9b867531fea1", -1);
        var_5a0fc1d304e970ea = "unset";
        if (isdefined(player.sessionteam)) {
            var_5a0fc1d304e970ea = player.sessionteam;
        }
        if (isdefined(player.team)) {
            var_5a0fc1d304e970ea = player.team;
        }
        player_placement = -1;
        if (isdefined(player.pers["telemetry"].teamplacement)) {
            player_placement = player.pers["telemetry"].teamplacement;
        }
        is_ranked = 0;
        if (istrue(level.var_ec2fb549b15ad827) || istrue(level.var_77907d733abe8b63)) {
            is_ranked = 1;
        }
        armor_collected = 0;
        if (isdefined(player.pers["telemetry"].armor_collected)) {
            armor_collected = player.pers["telemetry"].armor_collected;
        }
        armor_equipped = 0;
        if (isdefined(player.pers["telemetry"].armor_equipped)) {
            armor_equipped = player.pers["telemetry"].armor_equipped;
        }
        armor_destroyed = 0;
        if (isdefined(player.pers["telemetry"].armor_destroyed)) {
            armor_destroyed = player.pers["telemetry"].armor_destroyed;
        }
        var_8069c698315a4e16 = 0;
        if (isdefined(player.pers["telemetry"].var_8069c698315a4e16)) {
            var_8069c698315a4e16 = player.pers["telemetry"].var_8069c698315a4e16;
        }
        vehicle_autofwd_count = 0;
        if (isdefined(player.pers["telemetry"].vehicle_autofwd_count)) {
            vehicle_autofwd_count = player.pers["telemetry"].vehicle_autofwd_count;
        }
        ground_vehicle_used_count = 0;
        if (isdefined(player.pers["telemetry"].ground_vehicle_used_count)) {
            ground_vehicle_used_count = player.pers["telemetry"].ground_vehicle_used_count;
        }
        air_vehicle_used_count = 0;
        if (isdefined(player.pers["telemetry"].air_vehicle_used_count)) {
            air_vehicle_used_count = player.pers["telemetry"].air_vehicle_used_count;
        }
        is_controller = player usinggamepad();
        secondary_victory = istrue(player.extracted);
        holding_weapon_case = namespace_a8b2b88699fc40fb::function_5a7168b0b511bec3(player);
        best_squad_wipe_streak = 0;
        if (isdefined(player.team) && namespace_54d20dd0dd79277f::function_ef7cf07ba921200e(player.team, "best_squad_wipes")) {
            best_squad_wipe_streak = namespace_54d20dd0dd79277f::getteamdata(player.team, "best_squad_wipes");
        }
        player dlog_recordplayerevent("dlog_event_mp_player_match_end", [0:"utc_connect_time_s", 1:var_fdf9b22d16276454, 2:"utc_disconnect_time_s", 3:getsystemtime(), 4:"team", 5:var_5a0fc1d304e970ea, 6:"score", 7:player getpersstat("score"), 8:"placement", 9:player_placement, 10:"assists", 11:player getpersstat("assists"), 12:"longest_streak", 13:player getpersstat("longestStreak"), 14:"kills", 15:player getpersstat("kills"), 16:"ai_agent_kills", 17:var_afbdfaa766bb101.ai_agent_kills, 18:"deaths", 19:player getpersstat("deaths"), 20:"headshots", 21:player getpersstat("headshots"), 22:"executions", 23:player getpersstat("executions"), 24:"player_xp_modifier", 25:int(player namespace_62c556437da28f50::getrankxpmultiplier()), 26:"team_xp_modifier", 27:team_xp_modifier, 28:"weapon_xp_modifier", 29:int(player namespace_4cd6e0abb58d4200::getweaponrankxpmultiplier()), 30:"disconnect_reason", 31:disconnect_reason, 32:"player_quit_round_number", 33:player_quit_round_number, 34:"player_quit_team_score", 35:player_quit_team_score, 36:"player_quit_opposing_team_score", 37:player_quit_opposing_team_score, 38:"average_speed_during_match", 39:average_speed_during_match, 40:"percent_time_moving", 41:percent_time_moving, 42:"damage_done", 43:damage_done, 44:"damage_taken", 45:damage_taken, 46:"distance_traveled", 47:distance_traveled, 48:"weapon_accuracy", 49:weapon_accuracy, 50:"suicides", 51:suicides, 52:"game_type", 53:game_type, 54:"gw_spawn_method_press_activate", 55:gw_spawn_method_press_activate, 56:"gw_spawn_method_press_gostand", 57:gw_spawn_method_press_gostand, 58:"gw_spawn_method_press_lclick", 59:gw_spawn_method_press_lclick, 60:"gw_spawn_method_press_rclick", 61:gw_spawn_method_press_rclick, 62:"playlist_id", 63:playlist_id, 64:"playlist_name", 65:playlist_name, 66:"map", 67:level.script, 68:"connect_index", 69:connect_index, 70:"match_outcome", 71:match_outcome, 72:"rank_at_start", 73:var_b0f8f036d47c34ba.rank_at_start, 74:"rank_at_end", 75:var_b0f8f036d47c34ba.rank_at_end, 76:"xp_at_start", 77:var_b0f8f036d47c34ba.xp_at_start, 78:"xp_at_end", 79:var_b0f8f036d47c34ba.xp_at_end, 80:"score_at_start", 81:var_b0f8f036d47c34ba.score_at_start, 82:"score_at_end", 83:var_b0f8f036d47c34ba.score_at_end, 84:"prestige_at_start", 85:var_b0f8f036d47c34ba.prestige_at_start, 86:"prestige_at_end", 87:var_b0f8f036d47c34ba.prestige_at_end, 88:"lifetime_kills", 89:var_b0f8f036d47c34ba.lifetime_kills, 90:"lifetime_deaths", 91:var_b0f8f036d47c34ba.lifetime_deaths, 92:"lifetime_wins", 93:var_b0f8f036d47c34ba.lifetime_wins, 94:"lifetime_losses", 95:var_b0f8f036d47c34ba.lifetime_losses, 96:"lifetime_hits", 97:var_b0f8f036d47c34ba.lifetime_hits, 98:"lifetime_misses", 99:var_b0f8f036d47c34ba.lifetime_misses, 100:"lifetime_wall_bangs", 101:var_b0f8f036d47c34ba.lifetime_wall_bangs, 102:"lifetime_near_misses", 103:var_b0f8f036d47c34ba.lifetime_near_misses, 104:"lifetime_games_played", 105:var_b0f8f036d47c34ba.lifetime_games_played, 106:"lifetime_time_played_total", 107:var_b0f8f036d47c34ba.lifetime_time_played_total, 108:"total_xp", 109:total_xp, 110:"score_xp", 111:score_xp, 112:"challenge_xp", 113:challenge_xp, 114:"match_xp", 115:match_xp, 116:"medal_xp", 117:medal_xp, 118:"bonus_xp", 119:bonus_xp, 120:"misc_xp", 121:misc_xp, 122:"accolade_xp", 123:accolade_xp, 124:"weapon_xp", 125:weapon_xp, 126:"operator_xp", 127:operator_xp, 128:"clan_xp", 129:clan_xp, 130:"battlepass_xp", 131:battlepass_xp, 132:"shots", 133:shots, 134:"hits", 135:hits, 136:"player_score_event_count", 137:var_afbdfaa766bb101.player_score_event_count, 138:"player_weapon_stats_count", 139:var_afbdfaa766bb101.player_weapon_stats_count, 140:"kill_streak_expired_count", 141:var_afbdfaa766bb101.kill_streak_expired_count, 142:"player_loadout_count", 143:var_afbdfaa766bb101.player_loadout_count, 144:"operator", 145:var_93136a376f20de5c.operator, 146:"operator_skin", 147:var_93136a376f20de5c.operator_skin, 148:"operator_execution_ref", 149:var_93136a376f20de5c.operator_execution_ref, 150:"lobby_id", 151:lobby_id, 152:"current_season", 153:current_season, 154:"voice_chat_used", 155:player function_5fe468c5d49ce7c(), 156:"is_ranked", 157:is_ranked, 158:"armor_collected", 159:armor_collected, 160:"armor_equipped", 161:armor_equipped, 162:"armor_destroyed", 163:armor_destroyed, 164:"win_challenge_points_earned", 165:var_8069c698315a4e16, 166:"vehicle_autofwd_count", 167:vehicle_autofwd_count, 168:"ground_vehicle_used_count", 169:ground_vehicle_used_count, 170:"air_vehicle_used_count", 171:air_vehicle_used_count, 172:"is_controller", 173:is_controller, 174:"secondary_victory", 175:secondary_victory, 176:"holding_weapon_case", 177:holding_weapon_case, 178:"wall_bangs", 179:player getpersstat("wallbangs"), 180:"best_squad_wipe_streak", 181:best_squad_wipe_streak]);
        var_d45168df05638abc = "";
        if (isdefined(data.var_934dc135aaf6f953)) {
            if (function_d03495fe6418377b(data.var_934dc135aaf6f953) || function_73e183e02834309d(data.var_934dc135aaf6f953) || function_28eeffcb2337321e(data.var_934dc135aaf6f953)) {
                var_d45168df05638abc = function_f28fd66285fa2c9(data.var_934dc135aaf6f953);
            } else {
                var_d45168df05638abc = data.var_934dc135aaf6f953;
            }
        }
        var_37aab353fe84a505 = "{"disconnect_reason":"" + var_d45168df05638abc + ""}";
        function_7bcd667fc073fc12("player_match_end", var_37aab353fe84a505);
        player.pers["telemetry"].var_d6caa636bc3fce32 = 1;
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x618e
// Size: 0x178
function on_ai_killed(params) {
    if (!istrue(level.disablestattracking)) {
        if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(params.eattacker)) {
            return;
        }
        var_c11d6c177d7ab5a2 = spawnstruct();
        function_f632348cbb773537(level.mp_ai_killed_telemetry_throttle, var_c11d6c177d7ab5a2);
        if (!isdefined(params.eattacker)) {
            return;
        }
        if (isdefined(params.eattacker namespace_3c5a4254f2b957ea::getpersstat("telemetry").ai_agent_kills)) {
            params.eattacker.pers["telemetry"].ai_agent_kills++;
        }
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = namespace_e0ee43ef2dddadaa::getweaponrootname(params.sweapon);
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(params.sweapon);
        var_7e2c53b0bcf117d9.statname = "ai_agent_kills";
        var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = 1;
        var_7e2c53b0bcf117d9.variantid = getweaponvariantindex(params.sweapon);
        var_7e2c53b0bcf117d9.weaponobj = params.sweapon;
        /#
            assertex(level.var_ec2c9117bd4b336b["callback_update_weapon_stats"].size == 1, "More than 1 Telemetry Callback hooked up to ai killed");
        #/
        params.eattacker function_6a347a3138ec63e1(var_7e2c53b0bcf117d9);
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x630d
// Size: 0xe89
function on_player_death(data) {
    attacker = data.attacker;
    victim = data.victim;
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(victim)) {
        return;
    }
    var_132360a247a77fa7 = "";
    if (isdefined(data.weaponfullstring)) {
        var_132360a247a77fa7 = data.weaponfullstring;
    }
    means_of_death = "";
    if (isdefined(data.meansofdeath)) {
        means_of_death = data.meansofdeath;
    }
    if (var_132360a247a77fa7 == "agent_mp") {
        attacker_weapon_attachments = [];
    } else {
        var_ba6f272fe15ef31b = getweaponattachments(var_132360a247a77fa7);
        attacker_weapon_attachments = attachmentsfilterforstats(var_ba6f272fe15ef31b, var_132360a247a77fa7);
    }
    spawntime = 0;
    if (isdefined(victim.spawntime)) {
        spawntime = victim.spawntime;
    }
    spawn_time_from_match_start_ms = namespace_de6e6777b0937bd7::function_1b15450e092933cf(spawntime);
    death_time_from_match_start_ms = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    life_index = -1;
    if (isdefined(victim namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = victim namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    if (isdefined(victim namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.var_d8bae1f0e4d5e27e) && victim namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.var_d8bae1f0e4d5e27e == life_index) {
        return;
    }
    attacker_life_index = -1;
    attacker_loadout_index = -1;
    attacker_death_modifiers = [];
    attacker_was_ai = 0;
    ai_tier = "";
    if (namespace_de6e6777b0937bd7::function_892570944f6b6a2(attacker)) {
        attacker_weapon = getweaponbasename(var_132360a247a77fa7);
        var_41fb323b39c88db5 = attacker;
        attacker_weapon_picked_up = attacker ispickedupweapon(var_132360a247a77fa7);
        attacker_weapon_alt_mode = attacker isalternatemode(var_132360a247a77fa7);
        attacker_ads_value = 0;
        if (iscacprimaryorsecondary(var_132360a247a77fa7)) {
            attacker_ads_value = attacker playerads();
        }
        attacker_was_in_victim_fov = within_fov(victim.origin, victim.angles, attacker.origin, 0.4226);
        victim_was_in_attacker_fov = within_fov(attacker.origin, attacker.angles, victim.origin, 0.4226);
        attacker_mount_type = attacker namespace_de6e6777b0937bd7::function_50989a55805a440b();
        var_198c8ea3b4d37527 = attacker.origin;
        var_522fed3f783c2e47 = attacker.angles;
        if (isdefined(attacker namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
            attacker_life_index = attacker namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
        }
        if (isdefined(attacker.loadoutindex)) {
            attacker_loadout_index = attacker.loadoutindex;
        }
        attacker_death_modifiers = attacker namespace_7349d2dcd492da87::function_1c355f42faf7f4bb();
    } else {
        var_41fb323b39c88db5 = undefined;
        if (isdefined(attacker) && isagent(attacker)) {
            attacker_was_ai = 1;
            ai_tier = attacker.agent_type;
            attacker_weapon = "";
            attacker_weapon_picked_up = 0;
            attacker_weapon_alt_mode = 0;
            attacker_ads_value = 0;
            attacker_was_in_victim_fov = within_fov(victim.origin, victim.angles, attacker.origin, 0.4226);
            victim_was_in_attacker_fov = within_fov(attacker.origin, attacker.angles, victim.origin, 0.4226);
            attacker_mount_type = "MOUNT_NONE";
            var_198c8ea3b4d37527 = attacker.origin;
            var_522fed3f783c2e47 = attacker.angles;
        } else {
            attacker_weapon = "";
            attacker_weapon_picked_up = 0;
            attacker_weapon_alt_mode = 0;
            attacker_ads_value = 0;
            attacker_was_in_victim_fov = 0;
            victim_was_in_attacker_fov = 0;
            attacker_mount_type = "MOUNT_NONE";
            var_198c8ea3b4d37527 = (0, 0, 0);
            var_522fed3f783c2e47 = (0, 0, 0);
        }
    }
    victim_death_modifiers = victim namespace_7349d2dcd492da87::function_1c355f42faf7f4bb();
    victim_weapon_attachments = [];
    victim_weapon = "";
    var_520d9a7c62087eb6 = ter_op(namespace_7e17181d03156026::isinlaststand(victim) && isdefined(victim.laststandoldweaponobj), victim.laststandoldweaponobj, victim.lastweaponused);
    if (isdefined(var_520d9a7c62087eb6)) {
        var_fb475ef768b518c0 = getweaponattachments(var_520d9a7c62087eb6);
        victim_weapon_attachments = attachmentsfilterforstats(var_fb475ef768b518c0, var_520d9a7c62087eb6);
        victim_weapon = getweaponbasename(var_520d9a7c62087eb6);
        if (victim_weapon == "iw8_gunless") {
            DevOp(0x94);
        }
        victim_weapon_picked_up = victim ispickedupweapon(var_520d9a7c62087eb6);
        victim_weapon_alt_mode = victim isalternatemode(var_520d9a7c62087eb6, 0, 1);
        victim_ads_value = victim playerads();
    } else {
        victim_weapon_picked_up = 0;
        victim_weapon_alt_mode = 0;
        victim_ads_value = 0;
    }
    victim_mount_type = victim namespace_de6e6777b0937bd7::function_50989a55805a440b();
    victim_loadout_index = -1;
    if (isdefined(victim.loadoutindex)) {
        victim_loadout_index = victim.loadoutindex;
    }
    xp_earned = 0;
    if (isdefined(victim namespace_3c5a4254f2b957ea::getpersstat("summary")["xp"])) {
        var_1822f368857bc036 = victim namespace_3c5a4254f2b957ea::getpersstat("summary")["xp"];
        xp_earned = var_1822f368857bc036 - victim namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.var_2148fb703835ec1f;
    }
    score_earned = victim.score - victim namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.var_7e5250b5700df037;
    round = -1;
    if (isroundbased()) {
        round = game["roundsPlayed"];
        if (means_of_death == "MOD_GAME_ENDED" || means_of_death == "MOD_ROUND_ENDED") {
            round--;
            if (round < 0) {
                round = 0;
            }
        }
    }
    is_hipfire = 0;
    if (isdefined(attacker) && isdefined(attacker.modifiers)) {
        is_hipfire = istrue(attacker.modifiers["hipfire"]);
    }
    spawn_pos = (0, 0, 0);
    if (isdefined(victim.spawnpos)) {
        spawn_pos = victim.spawnpos;
    }
    was_tactical_insertion = 0;
    if (isdefined(victim.wasti)) {
        was_tactical_insertion = victim.wasti;
    }
    spawn_evaluation_id = 0;
    if (isdefined(victim.spawndata) && isdefined(victim.spawndata.spawnpoint) && isdefined(victim.spawndata.spawnpoint.var_59a3c934f709a06e)) {
        spawn_evaluation_id = victim.spawndata.spawnpoint.var_59a3c934f709a06e;
    }
    attacker_shooting_mode = "1st";
    if (isdefined(attacker) && isdefined(attacker.pers) && isdefined(attacker namespace_3c5a4254f2b957ea::getpersstat("shootingMode"))) {
        attacker_shooting_mode = attacker namespace_3c5a4254f2b957ea::getpersstat("shootingMode");
    }
    victim_shooting_mode = "1st";
    if (isdefined(victim namespace_3c5a4254f2b957ea::getpersstat("shootingMode"))) {
        victim_shooting_mode = victim namespace_3c5a4254f2b957ea::getpersstat("shootingMode");
    }
    first_damage_delivered_time_ms = 0;
    if (isdefined(victim.var_198b774c93c48891)) {
        first_damage_delivered_time_ms = namespace_de6e6777b0937bd7::function_1b15450e092933cf(victim.var_198b774c93c48891);
    }
    first_damage_received_time_ms = 0;
    if (isdefined(victim.var_9691e7d8cde294f2)) {
        first_damage_received_time_ms = namespace_de6e6777b0937bd7::function_1b15450e092933cf(victim.var_9691e7d8cde294f2);
    }
    if (isstring(means_of_death)) {
        var_20e794ee21ccc0c3 = function_1823ff50bb28148d(means_of_death);
    } else {
        var_20e794ee21ccc0c3 = means_of_death;
    }
    var_431bd3e5830d66f8 = -1;
    var_51334e7082b98cbe = -1;
    if (isdefined(victim.var_489f22c08f63bc0f)) {
        var_431bd3e5830d66f8 = victim.var_489f22c08f63bc0f;
    }
    if (isdefined(victim.var_91ff03702332cc07)) {
        var_51334e7082b98cbe = victim.var_91ff03702332cc07;
    }
    var_b94cd1b61321122a = 0;
    if (isdefined(victim.var_ddae1352e36165f6)) {
        var_b94cd1b61321122a = victim.var_ddae1352e36165f6;
    }
    var_99ec0e0e7687c243 = 0;
    if (isdefined(attacker) && isdefined(attacker.currentprimaryweapon)) {
        var_99ec0e0e7687c243 = attacker function_c603bed3b1c8d11(attacker.currentprimaryweapon, 0);
    }
    victim dlog_recordplayerevent("dlog_event_mp_life", [0:"attacker", 1:var_41fb323b39c88db5, 2:"spawn_time_from_match_start_ms", 3:spawn_time_from_match_start_ms, 4:"life_index", 5:life_index, 6:"spawn_evaluation_id", 7:spawn_evaluation_id, 8:"spawn_pos_x", 9:spawn_pos[0], 10:"spawn_pos_y", 11:spawn_pos[1], 12:"spawn_pos_z", 13:spawn_pos[2], 14:"team", 15:victim.team, 16:"is_host", 17:victim ishost(), 18:"was_tactical_insertion", 19:was_tactical_insertion, 20:"death_time_from_match_start_ms", 21:death_time_from_match_start_ms, 22:"victim_weapon", 23:victim_weapon, 24:"victim_weapon_attachments", 25:victim_weapon_attachments, 26:"attacker_weapon", 27:attacker_weapon, 28:"attacker_weapon_attachments", 29:attacker_weapon_attachments, 30:"victim_death_modifiers", 31:victim_death_modifiers, 32:"attacker_death_modifiers", 33:attacker_death_modifiers, 34:"death_pos_x", 35:victim.origin[0], 36:"death_pos_y", 37:victim.origin[1], 38:"death_pos_z", 39:victim.origin[2], 40:"death_angle_x", 41:victim.angles[0], 42:"death_angle_y", 43:victim.angles[1], 44:"death_angle_z", 45:victim.angles[2], 46:"attacker_pos_x", 47:var_198c8ea3b4d37527[0], 48:"attacker_pos_y", 49:var_198c8ea3b4d37527[1], 50:"attacker_pos_z", 51:var_198c8ea3b4d37527[2], 52:"attacker_angle_x", 53:var_522fed3f783c2e47[0], 54:"attacker_angle_y", 55:var_522fed3f783c2e47[1], 56:"attacker_angle_z", 57:var_522fed3f783c2e47[2], 58:"means_of_death", 59:var_20e794ee21ccc0c3, 60:"attacker_weapon_alt_mode", 61:attacker_weapon_alt_mode, 62:"attacker_weapon_picked_up", 63:attacker_weapon_picked_up, 64:"victim_weapon_alt_mode", 65:victim_weapon_alt_mode, 66:"victim_weapon_picked_up", 67:victim_weapon_picked_up, 68:"attacker_ads_value", 69:attacker_ads_value, 70:"victim_ads_value", 71:victim_ads_value, 72:"attacker_was_in_victim_fov", 73:attacker_was_in_victim_fov, 74:"victim_was_in_attacker_fov", 75:victim_was_in_attacker_fov, 76:"attacker_mount_type", 77:attacker_mount_type, 78:"victim_mount_type", 79:victim_mount_type, 80:"xp_earned", 81:xp_earned, 82:"score_earned", 83:score_earned, 84:"victim_loadout_index", 85:victim_loadout_index, 86:"attacker_life_index", 87:attacker_life_index, 88:"attacker_loadout_index", 89:attacker_loadout_index, 90:"victim_was_reloading", 91:victim isreloading(), 92:"victim_was_executing", 93:victim isinexecutionattack(), 94:"round", 95:round, 96:"is_hipfire", 97:is_hipfire, 98:"attacker_shooting_mode", 99:attacker_shooting_mode, 100:"victim_shooting_mode", 101:victim_shooting_mode, 102:"first_damage_delivered_time_ms", 103:first_damage_delivered_time_ms, 104:"first_damage_received_time_ms", 105:first_damage_received_time_ms, 106:"attacker_was_ai", 107:attacker_was_ai, 108:"lifetime_damage_dealt", 109:float(var_51334e7082b98cbe), 110:"lifetime_damage_received", 111:float(var_431bd3e5830d66f8), 112:"ai_tier", 113:ai_tier, 114:"victim_in_tac_stance", 115:var_b94cd1b61321122a, 116:"attacker_in_tac_stance", 117:var_99ec0e0e7687c243]);
    victim.pers["telemetry"].life.var_d8bae1f0e4d5e27e = life_index;
    if (namespace_de6e6777b0937bd7::function_892570944f6b6a2(attacker)) {
        logtournamentdeath(victim getxuid(), attacker getxuid(), var_132360a247a77fa7, means_of_death == "MOD_HEAD_SHOT");
        if (isdefined(level.matchrecording_logevent)) {
            time = gettime();
            [[ level.matchrecording_logevent ]](victim.clientid, victim.team, "DEATH", victim.origin[0], victim.origin[1], time);
            if (issubstr(tolower(means_of_death), "bullet") && isdefined(var_132360a247a77fa7) && !iskillstreakweapon(var_132360a247a77fa7)) {
                [[ level.matchrecording_logevent ]](attacker.clientid, attacker.team, "BULLET", attacker.origin[0], attacker.origin[1], time, undefined, victim.origin[0], victim.origin[1]);
            }
        }
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x719d
// Size: 0x18e
function on_player_disconnect(data) {
    function_6447f24addc0137e(data);
    var_a4772a08b422271f = -1;
    if (namespace_de6e6777b0937bd7::function_4b974d822d418a06(data) && isdefined(data.player.pers["telemetry"].life.var_d8bae1f0e4d5e27e)) {
        var_a4772a08b422271f = data.player.pers["telemetry"].life.var_d8bae1f0e4d5e27e;
    }
    lifeindex = -1;
    if (namespace_de6e6777b0937bd7::function_4b974d822d418a06(data) && isdefined(data.player.pers["telemetry"].life.life_index)) {
        lifeindex = data.player.pers["telemetry"].life.life_index;
    }
    if (var_a4772a08b422271f != lifeindex) {
        var_94529caaa418b01b = spawnstruct();
        var_94529caaa418b01b.victim = data.player;
        var_94529caaa418b01b.attacker = undefined;
        var_94529caaa418b01b.weaponfullstring = "none";
        var_94529caaa418b01b.meansofdeath = "";
        if (isdefined(data.var_934dc135aaf6f953)) {
            var_94529caaa418b01b.meansofdeath = "MOD_DISCONNECTED";
        }
        on_player_death(var_94529caaa418b01b);
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7332
// Size: 0x13bc
function function_60912f12edbae676(data) {
    if (isdefined(data.lifeindex)) {
        var_8f7e680ac270abc2 = data.lifeindex;
    } else {
        var_8f7e680ac270abc2 = -1;
    }
    var_23c8431f71e1530f = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    classstruct = data.classstruct;
    var_b98a554f5fc058c2 = classstruct.loadoutprimary;
    primaryweaponobj = classstruct.loadoutprimaryobject;
    var_7da5c09e8cc677d1 = [];
    var_ca61fd2a03b0c30d = namespace_d19129e4fa5d176::getmaxprimaryattachments();
    loadoutprimaryattachments = classstruct.loadoutprimaryattachments;
    for (attachmentindex = 0; attachmentindex < var_ca61fd2a03b0c30d; attachmentindex++) {
        var_61f20abec1e31454 = loadoutprimaryattachments[attachmentindex];
        if (isdefined(var_61f20abec1e31454)) {
            var_c130cd8c126c9aad = function_1823ff50bb28148d(var_61f20abec1e31454);
        } else {
            var_c130cd8c126c9aad = #"";
        }
        var_7da5c09e8cc677d1[attachmentindex] = var_c130cd8c126c9aad;
    }
    var_d4d89beaf7dcfa0a = classstruct.loadoutprimarycamo;
    var_684a28861c742b36 = classstruct.loadoutprimaryreticle;
    var_267cee921deab64e = classstruct.loadoutprimarylootitemid;
    var_3a7820a8ca123ece = classstruct.loadoutprimaryvariantid;
    var_e86b5ff35057c02 = classstruct.loadoutsecondary;
    secondaryweaponobj = classstruct.loadoutsecondaryobject;
    var_f67a501a2ba8c411 = [];
    var_1f095b8fda524b85 = namespace_d19129e4fa5d176::getmaxsecondaryattachments();
    loadoutsecondaryattachments = classstruct.loadoutsecondaryattachments;
    for (attachmentindex = 0; attachmentindex < var_1f095b8fda524b85; attachmentindex++) {
        var_3e6adb432df0d894 = loadoutsecondaryattachments[attachmentindex];
        if (isdefined(var_3e6adb432df0d894)) {
            var_3595c5a4bef8f5ed = function_1823ff50bb28148d(var_3e6adb432df0d894);
        } else {
            var_3595c5a4bef8f5ed = #"";
        }
        var_f67a501a2ba8c411[attachmentindex] = var_3595c5a4bef8f5ed;
    }
    var_9b18f02999b23b4a = classstruct.loadoutsecondarycamo;
    var_f3f8fd2658d0a576 = classstruct.loadoutsecondaryreticle;
    var_d063e05308a9da8e = classstruct.loadoutsecondarylootitemid;
    var_dd47d5b37f1b770e = classstruct.loadoutsecondaryvariantid;
    primarygrenade = classstruct.loadoutequipmentprimary;
    tacticalgear = classstruct.loadoutequipmentsecondary;
    var_cda5f3d036862ee = classstruct.loadoutstandardperks.size;
    var_5e16b98fc67f9d0a = #"specialty_null";
    var_1135208ed2c7cb70 = #"specialty_null";
    vest_perk = #"specialty_null";
    glove_perk = #"specialty_null";
    boot_perk = #"specialty_null";
    var_15434209a30e5984 = #"specialty_null";
    var_5db02909d819dafa = #"specialty_null";
    foreach (perk in classstruct.loadoutstandardperks) {
        var_1036048ad7fae159 = level.var_a1ad2758fcbd2f5e[perk];
        if (isdefined(var_1036048ad7fae159)) {
            switch (var_1036048ad7fae159.var_70774aeb81261100) {
            case #"hash_8cbf71797441f513":
                vest_perk = perk;
                break;
            case #"hash_6fb5d66c124bebf7":
                glove_perk = perk;
                break;
            case #"hash_998e90e64af76252":
                boot_perk = perk;
                break;
            case #"hash_60a8910f025fc58e":
                if (var_15434209a30e5984 == #"specialty_null") {
                    var_15434209a30e5984 = perk;
                } else {
                    var_5db02909d819dafa = perk;
                }
                break;
            }
        }
    }
    if (isdefined(classstruct.var_15f3e6df722fb1cf)) {
        var_13db3ca1ad2db644 = classstruct.var_15f3e6df722fb1cf;
    } else {
        var_13db3ca1ad2db644 = #"specialty_null";
    }
    if (isdefined(classstruct.var_15f3e5df722faf9c)) {
        var_34fdca49e62d81ee = classstruct.var_15f3e5df722faf9c;
    } else {
        var_34fdca49e62d81ee = #"specialty_null";
    }
    extra_loadout_perk_2 = #"hash_208442e5e74e8368";
    if (isdefined(classstruct.loadoutextraperks[0])) {
        extra_loadout_perk_1 = classstruct.loadoutextraperks[0];
    } else {
        extra_loadout_perk_1 = #"hash_208442e5e74e8368";
    }
    if (isdefined(classstruct.loadoutextraperks[1])) {
        extra_loadout_perk_2 = classstruct.loadoutextraperks[1];
    } else {
        extra_loadout_perk_2 = #"hash_208442e5e74e8368";
    }
    if (isdefined(data.player.loadoutfieldupgrade1)) {
        var_8ecf289c70dd61eb = data.player.loadoutfieldupgrade1;
    } else {
        var_8ecf289c70dd61eb = #"none";
    }
    if (isdefined(data.player.loadoutfieldupgrade2)) {
        var_f5bb419cbccebbe5 = data.player.loadoutfieldupgrade2;
    } else {
        var_f5bb419cbccebbe5 = #"none";
    }
    if (isdefined(self.pers["shootingMode"])) {
        shooting_mode = self.pers["shootingMode"];
    } else {
        shooting_mode = "1st";
    }
    var_85598e67455e57c4 = function_b4ed203552f83bca(primaryweaponobj);
    var_79dd046c94822604 = function_b4ed203552f83bca(secondaryweaponobj);
    if (isdefined(data.var_d445f727570e7250)) {
        primary_blueprint = data.var_d445f727570e7250.blueprintname;
        var_2ad1ad717553a993 = primary_blueprint;
        var_e2d36e4ccdafb38d = data.var_d445f727570e7250.lootid;
        var_7a6106e50e8ed5e7 = 1;
    } else {
        primary_blueprint = #"";
        var_e2d36e4ccdafb38d = 0;
        var_2ad1ad717553a993 = #"";
        var_7a6106e50e8ed5e7 = 0;
    }
    if (isdefined(data.var_425ddba200712090)) {
        secondary_blueprint = data.var_425ddba200712090.blueprintname;
        var_e334663a75cc67d3 = secondary_blueprint;
        var_1c313515279349cd = data.var_425ddba200712090.lootid;
        var_35bc7057db6ba727 = 1;
    } else {
        secondary_blueprint = #"";
        var_1c313515279349cd = 0;
        var_e334663a75cc67d3 = #"";
        var_35bc7057db6ba727 = 0;
    }
    if (isdefined(self.loadoutclass)) {
        var_8af798e2f33c8f7e = getsubstr(self.loadoutclass, 0, 7) == "default";
    } else {
        var_8af798e2f33c8f7e = 0;
    }
    var_8a4ffee432ca8d5e = 0;
    var_6dfa4cce4ce056b6 = 0;
    if (isdefined(primaryweaponobj)) {
        if (isdefined(primaryweaponobj.var_75a7008e426d90db)) {
            if (primaryweaponobj.var_75a7008e426d90db.size > 0) {
                var_8a4ffee432ca8d5e = 1;
            }
        }
        if (isdefined(primaryweaponobj.blueprinttuned)) {
            var_6dfa4cce4ce056b6 = 1;
        }
    }
    var_dc067331d5eee29e = 0;
    var_d5539868aaef02f6 = 0;
    if (isdefined(secondaryweaponobj)) {
        if (isdefined(secondaryweaponobj.var_75a7008e426d90db)) {
            if (secondaryweaponobj.var_75a7008e426d90db.size > 0) {
                var_dc067331d5eee29e = 1;
            }
        }
        if (isdefined(secondaryweaponobj.blueprinttuned)) {
            var_d5539868aaef02f6 = 1;
        }
    }
    streaktype = "Killstreaks";
    if (istrue(self.var_8bc1ddad56ab00bf)) {
        streaktype = "Points";
    }
    var_7b50c54dfbdce819 = function_deef6a4f7fbec3b8(primaryweaponobj);
    var_bb5da1da48de6259 = function_deef6a4f7fbec3b8(secondaryweaponobj);
    var_d3cf11436c80a43e = data.player dlog_recordplayerevent("dlog_event_mp_player_loadout", [0:"loadout_index", 1:data.loadoutindex, 2:"class_type", 3:function_1823ff50bb28148d(data.var_fd84df04adead383), 4:"mid_match_edit_count", 5:data.var_15bab3eaa5df4c14, 6:"first_use_life_index", 7:var_8f7e680ac270abc2, 8:"time_from_match_start_ms", 9:var_23c8431f71e1530f, 10:"primary_weapon_setup_camo", 11:function_1823ff50bb28148d(var_d4d89beaf7dcfa0a), 12:"primary_weapon_setup_reticle", 13:var_684a28861c742b36, 14:"primary_weapon_setup_loot_item_id", 15:var_267cee921deab64e, 16:"primary_weapon_setup_variant_id", 17:var_3a7820a8ca123ece, 18:"secondary_weapon_setup_camo", 19:function_1823ff50bb28148d(var_9b18f02999b23b4a), 20:"secondary_weapon_setup_reticle", 21:var_f3f8fd2658d0a576, 22:"secondary_weapon_setup_loot_item_id", 23:var_d063e05308a9da8e, 24:"secondary_weapon_setup_variant_id", 25:var_dd47d5b37f1b770e, 26:"primary_grenade", 27:function_1823ff50bb28148d(primarygrenade), 28:"tactical_gear", 29:function_1823ff50bb28148d(tacticalgear), 30:"base_perk_1", 31:function_1823ff50bb28148d(var_5e16b98fc67f9d0a), 32:"base_perk_2", 33:function_1823ff50bb28148d(var_1135208ed2c7cb70), 34:"bonus_perk", 35:function_1823ff50bb28148d(var_13db3ca1ad2db644), 36:"ultimate_perk", 37:function_1823ff50bb28148d(var_34fdca49e62d81ee), 38:"extra_loadout_perk_1", 39:function_1823ff50bb28148d(extra_loadout_perk_1), 40:"extra_loadout_perk_2", 41:function_1823ff50bb28148d(extra_loadout_perk_2), 42:"killstreak_0", 43:function_1823ff50bb28148d(classstruct.loadoutkillstreak1), 44:"killstreak_1", 45:function_1823ff50bb28148d(classstruct.loadoutkillstreak2), 46:"killstreak_2", 47:function_1823ff50bb28148d(classstruct.loadoutkillstreak3), 48:"field_upgrade_0", 49:function_1823ff50bb28148d(var_8ecf289c70dd61eb), 50:"field_upgrade_1", 51:function_1823ff50bb28148d(var_f5bb419cbccebbe5), 52:"shooting_mode", 53:function_1823ff50bb28148d(shooting_mode), 54:"primary_blueprint", 55:function_1823ff50bb28148d(primary_blueprint), 56:"secondary_blueprint", 57:function_1823ff50bb28148d(secondary_blueprint), 58:"primary_weapon_receiver", 59:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_receiver), 60:"primary_weapon_front_piece", 61:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_front_piece), 62:"primary_weapon_back_piece", 63:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_back_piece), 64:"primary_weapon_magazine", 65:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_magazine), 66:"primary_weapon_optic", 67:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_optic), 68:"primary_weapon_underbarrel", 69:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_underbarrel), 70:"primary_weapon_modifier", 71:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_modifier), 72:"primary_weapon_muzzle", 73:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_muzzle), 74:"primary_weapon_rear_grip", 75:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_rear_grip), 76:"primary_weapon_trigger", 77:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_trigger), 78:"primary_weapon_extra", 79:function_1823ff50bb28148d(var_85598e67455e57c4.weapon_extra), 80:"primary_lid_receiver", 81:var_85598e67455e57c4.lid_receiver, 82:"primary_lid_front_piece", 83:var_85598e67455e57c4.lid_front_piece, 84:"primary_lid_back_piece", 85:var_85598e67455e57c4.lid_back_piece, 86:"primary_lid_magazine", 87:var_85598e67455e57c4.lid_magazine, 88:"primary_lid_optic", 89:var_85598e67455e57c4.lid_optic, 90:"primary_lid_underbarrel", 91:var_85598e67455e57c4.lid_underbarrel, 92:"primary_lid_modifier", 93:var_85598e67455e57c4.lid_modifier, 94:"primary_lid_muzzle", 95:var_85598e67455e57c4.lid_muzzle, 96:"primary_lid_rear_grip", 97:var_85598e67455e57c4.lid_rear_grip, 98:"primary_lid_trigger", 99:var_85598e67455e57c4.lid_trigger, 100:"primary_lid_extra", 101:var_85598e67455e57c4.lid_extra, 102:"primary_tv_receiver", 103:var_85598e67455e57c4.tv_receiver, 104:"primary_tv_front_piece", 105:var_85598e67455e57c4.tv_front_piece, 106:"primary_tv_back_piece", 107:var_85598e67455e57c4.tv_back_piece, 108:"primary_tv_magazine", 109:var_85598e67455e57c4.tv_magazine, 110:"primary_tv_optic", 111:var_85598e67455e57c4.tv_optic, 112:"primary_tv_underbarrel", 113:var_85598e67455e57c4.tv_underbarrel, 114:"primary_tv_modifier", 115:var_85598e67455e57c4.tv_modifier, 116:"primary_tv_muzzle", 117:var_85598e67455e57c4.tv_muzzle, 118:"primary_tv_rear_grip", 119:var_85598e67455e57c4.tv_rear_grip, 120:"primary_tv_trigger", 121:var_85598e67455e57c4.tv_trigger, 122:"primary_tv_extra", 123:var_85598e67455e57c4.tv_extra, 124:"primary_is_bp_tuned", 125:var_85598e67455e57c4.var_f58b539a89b0bc91, 126:"secondary_weapon_receiver", 127:function_1823ff50bb28148d(var_79dd046c94822604.weapon_receiver), 128:"secondary_weapon_front_piece", 129:function_1823ff50bb28148d(var_79dd046c94822604.weapon_front_piece), 130:"secondary_weapon_back_piece", 131:function_1823ff50bb28148d(var_79dd046c94822604.weapon_back_piece), 132:"secondary_weapon_magazine", 133:function_1823ff50bb28148d(var_79dd046c94822604.weapon_magazine), 134:"secondary_weapon_optic", 135:function_1823ff50bb28148d(var_79dd046c94822604.weapon_optic), 136:"secondary_weapon_underbarrel", 137:function_1823ff50bb28148d(var_79dd046c94822604.weapon_underbarrel), 138:"secondary_weapon_modifier", 139:function_1823ff50bb28148d(var_79dd046c94822604.weapon_modifier), 140:"secondary_weapon_muzzle", 141:function_1823ff50bb28148d(var_79dd046c94822604.weapon_muzzle), 142:"secondary_weapon_rear_grip", 143:function_1823ff50bb28148d(var_79dd046c94822604.weapon_rear_grip), 144:"secondary_weapon_trigger", 145:function_1823ff50bb28148d(var_79dd046c94822604.weapon_trigger), 146:"secondary_weapon_extra", 147:function_1823ff50bb28148d(var_79dd046c94822604.weapon_extra), 148:"secondary_lid_receiver", 149:var_79dd046c94822604.lid_receiver, 150:"secondary_lid_front_piece", 151:var_79dd046c94822604.lid_front_piece, 152:"secondary_lid_back_piece", 153:var_79dd046c94822604.lid_back_piece, 154:"secondary_lid_magazine", 155:var_79dd046c94822604.lid_magazine, 156:"secondary_lid_optic", 157:var_79dd046c94822604.lid_optic, 158:"secondary_lid_underbarrel", 159:var_79dd046c94822604.lid_underbarrel, 160:"secondary_lid_modifier", 161:var_79dd046c94822604.lid_modifier, 162:"secondary_lid_muzzle", 163:var_79dd046c94822604.lid_muzzle, 164:"secondary_lid_rear_grip", 165:var_79dd046c94822604.lid_rear_grip, 166:"secondary_lid_trigger", 167:var_79dd046c94822604.lid_trigger, 168:"secondary_lid_extra", 169:var_79dd046c94822604.lid_extra, 170:"secondary_tv_receiver", 171:var_79dd046c94822604.tv_receiver, 172:"secondary_tv_front_piece", 173:var_79dd046c94822604.tv_front_piece, 174:"secondary_tv_back_piece", 175:var_79dd046c94822604.tv_back_piece, 176:"secondary_tv_magazine", 177:var_79dd046c94822604.tv_magazine, 178:"secondary_tv_optic", 179:var_79dd046c94822604.tv_optic, 180:"secondary_tv_underbarrel", 181:var_79dd046c94822604.tv_underbarrel, 182:"secondary_tv_modifier", 183:var_79dd046c94822604.tv_modifier, 184:"secondary_tv_muzzle", 185:var_79dd046c94822604.tv_muzzle, 186:"secondary_tv_rear_grip", 187:var_79dd046c94822604.tv_rear_grip, 188:"secondary_tv_trigger", 189:var_79dd046c94822604.tv_trigger, 190:"secondary_tv_extra", 191:var_79dd046c94822604.tv_extra, 192:"secondary_is_bp_tuned", 193:var_79dd046c94822604.var_f58b539a89b0bc91, 194:"is_default_loadout", 195:var_8af798e2f33c8f7e, 196:"primary_is_a_blueprint_weapon", 197:var_7a6106e50e8ed5e7, 198:"primary_blueprint_name", 199:function_1823ff50bb28148d(var_2ad1ad717553a993), 200:"primary_blueprint_id", 201:var_e2d36e4ccdafb38d, 202:"primary_is_pro_tuned", 203:var_6dfa4cce4ce056b6, 204:"primary_is_player_tuned", 205:var_8a4ffee432ca8d5e, 206:"primary_weapon_setup_attachment_0", 207:var_7da5c09e8cc677d1[0], 208:"primary_weapon_setup_attachment_1", 209:var_7da5c09e8cc677d1[1], 210:"primary_weapon_setup_attachment_2", 211:var_7da5c09e8cc677d1[2], 212:"primary_weapon_setup_attachment_3", 213:var_7da5c09e8cc677d1[3], 214:"primary_weapon_setup_attachment_4", 215:var_7da5c09e8cc677d1[4], 216:"secondary_is_a_blueprint_weapon", 217:var_35bc7057db6ba727, 218:"secondary_blueprint_name", 219:function_1823ff50bb28148d(var_e334663a75cc67d3), 220:"secondary_blueprint_id", 221:var_1c313515279349cd, 222:"secondary_is_pro_tuned", 223:var_d5539868aaef02f6, 224:"secondary_is_player_tuned", 225:var_dc067331d5eee29e, 226:"secondary_weapon_setup_attachment_0", 227:var_f67a501a2ba8c411[0], 228:"secondary_weapon_setup_attachment_1", 229:var_f67a501a2ba8c411[1], 230:"secondary_weapon_setup_attachment_2", 231:var_f67a501a2ba8c411[2], 232:"secondary_weapon_setup_attachment_3", 233:var_f67a501a2ba8c411[3], 234:"secondary_weapon_setup_attachment_4", 235:var_f67a501a2ba8c411[4], 236:"streak_type", 237:function_1823ff50bb28148d(streaktype), 238:"vest_perk", 239:function_1823ff50bb28148d(vest_perk), 240:"glove_perk", 241:function_1823ff50bb28148d(glove_perk), 242:"boot_perk", 243:function_1823ff50bb28148d(boot_perk), 244:"gear_perk_1", 245:function_1823ff50bb28148d(var_15434209a30e5984), 246:"gear_perk_2", 247:function_1823ff50bb28148d(var_5db02909d819dafa), 248:"primary_amp_data", 249:var_7b50c54dfbdce819, 250:"secondary_amp_data", 251:var_bb5da1da48de6259, 252:"primary_weapon_name", 253:var_b98a554f5fc058c2, 254:"secondary_weapon_name", 255:var_e86b5ff35057c02]);
    if (isdefined(data.player.pers["telemetry"].player_loadout_count) && istrue(var_d3cf11436c80a43e)) {
        data.player.pers["telemetry"].player_loadout_count++;
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86f5
// Size: 0x132b
function function_8076b5556f48a6cd(player) {
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
        return;
    }
    if (isbot(player) || istestclient(player) || isai(player)) {
        return;
    }
    player_xp = player getplayerdata(level.loadoutsgroup, "squadMembers", "player_xp");
    weaponstats = player.pers["weaponStats"];
    foreach (var_5842e592ddcef384 in weaponstats) {
        var_21812d5f48574e1 = 0;
        var_a02c59f5f82efeca = 0;
        deaths = 0;
        ai_deaths = 0;
        player_deaths = 0;
        headshots = 0;
        ai_headshots = 0;
        player_headshots = 0;
        hits = 0;
        ai_hits = 0;
        player_hits = 0;
        kills = 0;
        ai_agent_kills = 0;
        ads_kills = 0;
        ai_ads_kills = 0;
        player_ads_kills = 0;
        shots = 0;
        timeused = 0;
        damage = 0;
        ai_damage = 0;
        player_damage = 0;
        var_9eefff5886bccdb9 = 0;
        weapon_normal_zombie_kills = 0;
        weapon_special_zombie_kills = 0;
        weapon_elite_zombie_kills = 0;
        weapon_boss_zombie_kills = 0;
        weapon_pack_a_punch_kills = 0;
        weapon_critical_kills = 0;
        weapon_soldier_kills = 0;
        weapon_white_rarity_kills = 0;
        weapon_green_rarity_kills = 0;
        weapon_blue_rarity_kills = 0;
        weapon_purple_rarity_kills = 0;
        weapon_orange_rarity_kills = 0;
        if (isenumvaluevalid("common", "LoadoutWeapon", var_5842e592ddcef384.weapon)) {
            var_21812d5f48574e1 = player getplayerdata(level.loadoutsgroup, "squadMembers", "weapon_xp", var_5842e592ddcef384.weapon);
            var_9eefff5886bccdb9 = namespace_4cd6e0abb58d4200::getweaponrankforxp(var_21812d5f48574e1);
        }
        if (isdefined(var_5842e592ddcef384.stats["xp_earned"])) {
            var_a02c59f5f82efeca = var_a02c59f5f82efeca + var_5842e592ddcef384.stats["xp_earned"];
        }
        if (isdefined(var_5842e592ddcef384.stats["deaths"])) {
            deaths = deaths + var_5842e592ddcef384.stats["deaths"];
        }
        if (isdefined(var_5842e592ddcef384.stats["ai_deaths"])) {
            ai_deaths = ai_deaths + var_5842e592ddcef384.stats["ai_deaths"];
        }
        if (isdefined(var_5842e592ddcef384.stats["player_deaths"])) {
            player_deaths = player_deaths + var_5842e592ddcef384.stats["player_deaths"];
        }
        if (isdefined(var_5842e592ddcef384.stats["headshots"])) {
            headshots = headshots + var_5842e592ddcef384.stats["headshots"];
        }
        if (isdefined(var_5842e592ddcef384.stats["ai_headshots"])) {
            ai_headshots = ai_headshots + var_5842e592ddcef384.stats["ai_headshots"];
        }
        if (isdefined(var_5842e592ddcef384.stats["player_headshots"])) {
            player_headshots = player_headshots + var_5842e592ddcef384.stats["player_headshots"];
        }
        if (isdefined(var_5842e592ddcef384.stats["hits"])) {
            hits = hits + var_5842e592ddcef384.stats["hits"];
        }
        if (isdefined(var_5842e592ddcef384.stats["ai_hits"])) {
            ai_hits = ai_hits + var_5842e592ddcef384.stats["ai_hits"];
        }
        if (isdefined(var_5842e592ddcef384.stats["player_hits"])) {
            player_hits = player_hits + var_5842e592ddcef384.stats["player_hits"];
        }
        if (isdefined(var_5842e592ddcef384.stats["kills"])) {
            kills = kills + var_5842e592ddcef384.stats["kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["ads_kills"])) {
            ads_kills = ads_kills + var_5842e592ddcef384.stats["ads_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["ai_ads_kills"])) {
            ai_ads_kills = ai_ads_kills + var_5842e592ddcef384.stats["ai_ads_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["player_ads_kills"])) {
            player_ads_kills = player_ads_kills + var_5842e592ddcef384.stats["player_ads_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["shots"])) {
            shots = shots + var_5842e592ddcef384.stats["shots"];
        }
        if (isdefined(var_5842e592ddcef384.stats["timeUsed"])) {
            timeused = timeused + var_5842e592ddcef384.stats["timeUsed"];
        }
        if (isdefined(var_5842e592ddcef384.stats["damage"])) {
            damage = damage + var_5842e592ddcef384.stats["damage"];
        }
        if (isdefined(var_5842e592ddcef384.stats["ai_damage"])) {
            ai_damage = ai_damage + var_5842e592ddcef384.stats["ai_damage"];
        }
        if (isdefined(var_5842e592ddcef384.stats["player_damage"])) {
            player_damage = player_damage + var_5842e592ddcef384.stats["player_damage"];
        }
        if (isdefined(var_5842e592ddcef384.stats["ai_agent_kills"])) {
            ai_agent_kills = ai_agent_kills + var_5842e592ddcef384.stats["ai_agent_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_normal_zombie_kills"])) {
            weapon_normal_zombie_kills = weapon_normal_zombie_kills + var_5842e592ddcef384.stats["weapon_normal_zombie_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_special_zombie_kills"])) {
            weapon_special_zombie_kills = weapon_special_zombie_kills + var_5842e592ddcef384.stats["weapon_special_zombie_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_elite_zombie_kills"])) {
            weapon_elite_zombie_kills = weapon_elite_zombie_kills + var_5842e592ddcef384.stats["weapon_elite_zombie_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_boss_zombie_kills"])) {
            weapon_boss_zombie_kills = weapon_boss_zombie_kills + var_5842e592ddcef384.stats["weapon_boss_zombie_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_pack_a_punch_kills"])) {
            weapon_pack_a_punch_kills = weapon_pack_a_punch_kills + var_5842e592ddcef384.stats["weapon_pack_a_punch_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_critical_kills"])) {
            weapon_critical_kills = weapon_critical_kills + var_5842e592ddcef384.stats["weapon_critical_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_soldier_kills"])) {
            weapon_soldier_kills = weapon_soldier_kills + var_5842e592ddcef384.stats["weapon_soldier_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_white_rarity_kills"])) {
            weapon_white_rarity_kills = weapon_white_rarity_kills + var_5842e592ddcef384.stats["weapon_white_rarity_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_green_rarity_kills"])) {
            weapon_green_rarity_kills = weapon_green_rarity_kills + var_5842e592ddcef384.stats["weapon_green_rarity_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_blue_rarity_kills"])) {
            weapon_blue_rarity_kills = weapon_blue_rarity_kills + var_5842e592ddcef384.stats["weapon_blue_rarity_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_purple_rarity_kills"])) {
            weapon_purple_rarity_kills = weapon_purple_rarity_kills + var_5842e592ddcef384.stats["weapon_purple_rarity_kills"];
        }
        if (isdefined(var_5842e592ddcef384.stats["weapon_orange_rarity_kills"])) {
            weapon_orange_rarity_kills = weapon_orange_rarity_kills + var_5842e592ddcef384.stats["weapon_orange_rarity_kills"];
        }
        var_160345544d655de0 = function_b4ed203552f83bca(var_5842e592ddcef384.weaponobj);
        var_904c82687ddfeb02 = function_ccb453b7ef932cea(var_5842e592ddcef384.weaponobj);
        var_e96a2497012e529b = 0;
        var_6cec5443c5a603c1 = 0;
        blueprintname = "";
        var_c0c48db16bab2fca = 0;
        var_23f43530281513a2 = 0;
        var_67e0508f0cc1e07d = "none";
        if (isdefined(var_5842e592ddcef384.weaponobj)) {
            if (isdefined(var_5842e592ddcef384.weaponobj.camo)) {
                var_67e0508f0cc1e07d = var_5842e592ddcef384.weaponobj.camo;
            }
            if (isdefined(var_5842e592ddcef384.weaponobj.var_75a7008e426d90db)) {
                if (var_5842e592ddcef384.weaponobj.var_75a7008e426d90db.size > 0) {
                    var_c0c48db16bab2fca = 1;
                }
            }
            var_23f43530281513a2 = istrue(var_5842e592ddcef384.weaponobj.blueprinttuned);
            var_fedb77aad2340743 = getweaponvariantindex(var_5842e592ddcef384.weaponobj);
            if (isdefined(var_fedb77aad2340743)) {
                var_a6ed1602a5107749 = getweaponrootname(var_5842e592ddcef384.weaponobj) + "|" + var_fedb77aad2340743;
                if (isdefined(var_a6ed1602a5107749)) {
                    blueprint = level.weaponlootmapdata[var_a6ed1602a5107749];
                    if (isdefined(blueprint)) {
                        var_e96a2497012e529b = 1;
                        var_6cec5443c5a603c1 = blueprint.lootid;
                        blueprintname = var_a6ed1602a5107749;
                    }
                }
            }
        }
        var_b67ddc26c0a0609d = [];
        for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxprimaryattachments(); attachmentindex++) {
            var_b67ddc26c0a0609d[attachmentindex] = "";
            if (isdefined(var_5842e592ddcef384.weaponobj)) {
                if (isdefined(var_5842e592ddcef384.weaponobj.attachments[attachmentindex])) {
                    var_b67ddc26c0a0609d[attachmentindex] = var_5842e592ddcef384.weaponobj.attachments[attachmentindex];
                }
            }
        }
        var_b96152cb873a0080 = 0;
        if (isdefined(var_5842e592ddcef384.stats) && isdefined(var_5842e592ddcef384.stats["xp_earned"])) {
            if (isenumvaluevalid("common", "LoadoutWeapon", var_5842e592ddcef384.weapon)) {
                var_21812d5f48574e1 = player getplayerdata(level.loadoutsgroup, "squadMembers", "weapon_xp", var_5842e592ddcef384.weapon);
                var_20022a4d67cb2a26 = var_5842e592ddcef384.stats["xp_earned"];
                var_63a461789fca386a = var_21812d5f48574e1 + var_20022a4d67cb2a26;
                var_b96152cb873a0080 = namespace_4cd6e0abb58d4200::getweaponrankforxp(var_63a461789fca386a);
            }
            if (!isdefined(var_b96152cb873a0080) && !isint(var_b96152cb873a0080)) {
                var_b96152cb873a0080 = 0;
            }
        }
        var_7249f84dc6294efa = isdefined(player.pers["telemetry"].var_a3ef8d971ec61fc7) ? 0 : player.pers["telemetry"].var_a3ef8d971ec61fc7;
        var_7b50c54dfbdce819 = [];
        var_bb5da1da48de6259 = [];
        if (isdefined(self.primaryweapons)) {
            if (isdefined(self.primaryweapons[0])) {
                var_7b50c54dfbdce819 = function_deef6a4f7fbec3b8(self.primaryweapons[0]);
            }
            if (isdefined(self.primaryweapons[1])) {
                var_bb5da1da48de6259 = function_deef6a4f7fbec3b8(self.primaryweapons[1]);
            }
        }
        var_d3cf11436c80a43e = player dlog_recordplayerevent("dlog_event_mp_player_weapon_stats", [0:"weapon", 1:var_5842e592ddcef384.weapon, 2:"variant_id", 3:var_5842e592ddcef384.variantid, 4:"attachments", 5:var_5842e592ddcef384.weaponattachments, 6:"loadout_index", 7:var_5842e592ddcef384.loadoutindex, 8:"is_picked_up", 9:var_5842e592ddcef384.var_61022cd5389d83d0, 10:"starting_weapon_xp", 11:var_21812d5f48574e1, 12:"xp_earned", 13:var_a02c59f5f82efeca, 14:"deaths", 15:deaths, 16:"ai_deaths", 17:ai_deaths, 18:"player_deaths", 19:player_deaths, 20:"headshots", 21:headshots, 22:"ai_headshots", 23:ai_headshots, 24:"player_headshots", 25:player_headshots, 26:"hits", 27:hits, 28:"ai_hits", 29:ai_hits, 30:"player_hits", 31:player_hits, 32:"kills", 33:kills, 34:"ai_agent_kills", 35:ai_agent_kills, 36:"ads_kills", 37:ads_kills, 38:"ai_ads_kills", 39:ai_ads_kills, 40:"player_ads_kills", 41:player_ads_kills, 42:"shots", 43:shots, 44:"time_used_s", 45:float(timeused), 46:"damage", 47:damage, 48:"ai_damage", 49:ai_damage, 50:"player_damage", 51:player_damage, 52:"weapon_receiver", 53:var_160345544d655de0.weapon_receiver, 54:"weapon_front_piece", 55:var_160345544d655de0.weapon_front_piece, 56:"weapon_back_piece", 57:var_160345544d655de0.weapon_back_piece, 58:"weapon_magazine", 59:var_160345544d655de0.weapon_magazine, 60:"weapon_optic", 61:var_160345544d655de0.weapon_optic, 62:"weapon_underbarrel", 63:var_160345544d655de0.weapon_underbarrel, 64:"weapon_modifier", 65:var_160345544d655de0.weapon_modifier, 66:"weapon_muzzle", 67:var_160345544d655de0.weapon_muzzle, 68:"weapon_rear_grip", 69:var_160345544d655de0.weapon_rear_grip, 70:"weapon_trigger", 71:var_160345544d655de0.weapon_trigger, 72:"weapon_extra", 73:var_160345544d655de0.weapon_extra, 74:"lid_receiver", 75:var_160345544d655de0.lid_receiver, 76:"lid_front_piece", 77:var_160345544d655de0.lid_front_piece, 78:"lid_back_piece", 79:var_160345544d655de0.lid_back_piece, 80:"lid_magazine", 81:var_160345544d655de0.lid_magazine, 82:"lid_optic", 83:var_160345544d655de0.lid_optic, 84:"lid_underbarrel", 85:var_160345544d655de0.lid_underbarrel, 86:"lid_modifier", 87:var_160345544d655de0.lid_modifier, 88:"lid_muzzle", 89:var_160345544d655de0.lid_muzzle, 90:"lid_rear_grip", 91:var_160345544d655de0.lid_rear_grip, 92:"lid_trigger", 93:var_160345544d655de0.lid_trigger, 94:"lid_extra", 95:var_160345544d655de0.lid_extra, 96:"tv_receiver", 97:var_160345544d655de0.tv_receiver, 98:"tv_front_piece", 99:var_160345544d655de0.tv_front_piece, 100:"tv_back_piece", 101:var_160345544d655de0.tv_back_piece, 102:"tv_magazine", 103:var_160345544d655de0.tv_magazine, 104:"tv_optic", 105:var_160345544d655de0.tv_optic, 106:"tv_underbarrel", 107:var_160345544d655de0.tv_underbarrel, 108:"tv_modifier", 109:var_160345544d655de0.tv_modifier, 110:"tv_muzzle", 111:var_160345544d655de0.tv_muzzle, 112:"tv_rear_grip", 113:var_160345544d655de0.tv_rear_grip, 114:"tv_trigger", 115:var_160345544d655de0.tv_trigger, 116:"tv_extra", 117:var_160345544d655de0.tv_extra, 118:"is_bp_tuned", 119:var_160345544d655de0.var_f58b539a89b0bc91, 120:"weapon_lootid", 121:var_904c82687ddfeb02, 122:"is_a_blueprint_weapon", 123:var_e96a2497012e529b, 124:"blueprint_id", 125:var_6cec5443c5a603c1, 126:"blueprint_name", 127:blueprintname, 128:"is_player_tuned", 129:var_c0c48db16bab2fca, 130:"is_pro_tuned", 131:var_23f43530281513a2, 132:"camo_equipped_id", 133:var_67e0508f0cc1e07d, 134:"weapon_setup_attachment_0", 135:var_b67ddc26c0a0609d[0], 136:"weapon_setup_attachment_1", 137:var_b67ddc26c0a0609d[1], 138:"weapon_setup_attachment_2", 139:var_b67ddc26c0a0609d[2], 140:"weapon_setup_attachment_3", 141:var_b67ddc26c0a0609d[3], 142:"weapon_setup_attachment_4", 143:var_b67ddc26c0a0609d[4], 144:"weapon_rank_start", 145:var_9eefff5886bccdb9, 146:"weapon_rank_end", 147:var_b96152cb873a0080, 148:"weapon_unique_session_event_id", 149:var_7249f84dc6294efa, 150:"primary_amp_data", 151:var_7b50c54dfbdce819, 152:"secondary_amp_data", 153:var_bb5da1da48de6259, 154:"wall_bangs", 155:player getpersstat("wallbangs")]);
        if (getgametype() == "ob" || getgametype() == "ob_rift_run") {
            player dlog_recordplayerevent("dlog_event_ob_player_weapon_stats", [0:"weapon", 1:var_5842e592ddcef384.weapon, 2:"weapon_normal_zombie_kills", 3:weapon_normal_zombie_kills, 4:"weapon_special_zombie_kills", 5:weapon_special_zombie_kills, 6:"weapon_elite_zombie_kills", 7:weapon_elite_zombie_kills, 8:"weapon_boss_zombie_kills", 9:weapon_boss_zombie_kills, 10:"weapon_pack_a_punch_kills", 11:weapon_pack_a_punch_kills, 12:"weapon_critical_kills", 13:weapon_critical_kills, 14:"weapon_soldier_kills", 15:weapon_soldier_kills, 16:"weapon_white_rarity_kills", 17:weapon_white_rarity_kills, 18:"weapon_green_rarity_kills", 19:weapon_green_rarity_kills, 20:"weapon_blue_rarity_kills", 21:weapon_blue_rarity_kills, 22:"weapon_purple_rarity_kills", 23:weapon_purple_rarity_kills, 24:"weapon_orange_rarity_kills", 25:weapon_orange_rarity_kills, 26:"weapon_unique_session_event_id", 27:var_7249f84dc6294efa]);
        }
        if (isdefined(player.pers["telemetry"].player_weapon_stats_count) && istrue(var_d3cf11436c80a43e)) {
            player.pers["telemetry"].player_weapon_stats_count++;
        }
        if (isdefined(player.pers["telemetry"].var_a3ef8d971ec61fc7)) {
            player.pers["telemetry"].var_a3ef8d971ec61fc7++;
        }
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a27
// Size: 0xcf2
function function_b4ed203552f83bca(weapon) {
    data = spawnstruct();
    data.var_f58b539a89b0bc91 = 0;
    data.weapon_receiver = "";
    data.lid_receiver = 0;
    data.tv_receiver = [0:0, 1:0];
    data.weapon_front_piece = "";
    data.lid_front_piece = 0;
    data.tv_front_piece = [0:0, 1:0];
    data.weapon_back_piece = "";
    data.lid_back_piece = 0;
    data.tv_back_piece = [0:0, 1:0];
    data.weapon_magazine = "";
    data.lid_magazine = 0;
    data.tv_magazine = [0:0, 1:0];
    data.weapon_optic = "";
    data.lid_optic = 0;
    data.tv_optic = [0:0, 1:0];
    data.weapon_underbarrel = "";
    data.lid_underbarrel = 0;
    data.tv_underbarrel = [0:0, 1:0];
    data.weapon_modifier = "";
    data.lid_modifier = 0;
    data.tv_modifier = [0:0, 1:0];
    data.weapon_muzzle = "";
    data.lid_muzzle = 0;
    data.tv_muzzle = [0:0, 1:0];
    data.weapon_rear_grip = "";
    data.lid_rear_grip = 0;
    data.tv_rear_grip = [0:0, 1:0];
    data.weapon_trigger = "";
    data.lid_trigger = 0;
    data.tv_trigger = [0:0, 1:0];
    data.weapon_extra = "";
    data.lid_extra = 0;
    data.tv_extra = [0:0, 1:0];
    if (!isdefined(weapon)) {
        return data;
    }
    if (isdefined(weapon.blueprinttuned)) {
        data.var_f58b539a89b0bc91 = weapon.blueprinttuned;
    }
    basename = weapon.basename;
    var_75a7008e426d90db = weapon.var_75a7008e426d90db;
    receiver = weapon.receiver;
    if (isdefined(receiver)) {
        data.weapon_receiver = receiver;
        data.lid_receiver = function_693e108cb61ceeb5(basename, receiver);
        var_91508dc8cd30163e = var_75a7008e426d90db[receiver];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_receiver[0] = -1e+06;
            } else {
                data.tv_receiver[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_receiver[1] = -1e+06;
            } else {
                data.tv_receiver[1] = var_47681252dc0d55dd;
            }
        }
    }
    frontpiece = weapon.frontpiece;
    if (isdefined(frontpiece)) {
        data.weapon_front_piece = frontpiece;
        data.lid_front_piece = function_693e108cb61ceeb5(basename, frontpiece);
        var_91508dc8cd30163e = var_75a7008e426d90db[frontpiece];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_front_piece[0] = -1e+06;
            } else {
                data.tv_front_piece[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_front_piece[1] = -1e+06;
            } else {
                data.tv_front_piece[1] = var_47681252dc0d55dd;
            }
        }
    }
    backpiece = weapon.backpiece;
    if (isdefined(backpiece)) {
        data.weapon_back_piece = backpiece;
        data.lid_back_piece = function_693e108cb61ceeb5(basename, backpiece);
        var_91508dc8cd30163e = var_75a7008e426d90db[backpiece];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_back_piece[0] = -1e+06;
            } else {
                data.tv_back_piece[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_back_piece[1] = -1e+06;
            } else {
                data.tv_back_piece[1] = var_47681252dc0d55dd;
            }
        }
    }
    magazine = weapon.magazine;
    if (isdefined(magazine)) {
        data.weapon_magazine = magazine;
        data.lid_magazine = function_693e108cb61ceeb5(basename, magazine);
        var_91508dc8cd30163e = var_75a7008e426d90db[magazine];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_magazine[0] = -1e+06;
            } else {
                data.tv_magazine[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_magazine[1] = -1e+06;
            } else {
                data.tv_magazine[1] = var_47681252dc0d55dd;
            }
        }
    }
    scope = weapon.scope;
    if (isdefined(scope)) {
        data.weapon_optic = scope;
        data.lid_optic = function_693e108cb61ceeb5(basename, scope);
        var_91508dc8cd30163e = var_75a7008e426d90db[scope];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_optic[0] = -1e+06;
            } else {
                data.tv_optic[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_optic[1] = -1e+06;
            } else {
                data.tv_optic[1] = var_47681252dc0d55dd;
            }
        }
    }
    underbarrel = weapon.underbarrel;
    if (isdefined(underbarrel)) {
        data.weapon_underbarrel = underbarrel;
        data.lid_underbarrel = function_693e108cb61ceeb5(basename, underbarrel);
        var_91508dc8cd30163e = var_75a7008e426d90db[underbarrel];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_underbarrel[0] = -1e+06;
            } else {
                data.tv_underbarrel[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_underbarrel[1] = -1e+06;
            } else {
                data.tv_underbarrel[1] = var_47681252dc0d55dd;
            }
        }
    }
    modifier = weapon.modifier;
    if (isdefined(modifier)) {
        data.weapon_modifier = modifier;
        data.lid_modifier = function_693e108cb61ceeb5(basename, modifier);
        var_91508dc8cd30163e = var_75a7008e426d90db[modifier];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_modifier[0] = -1e+06;
            } else {
                data.tv_modifier[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_modifier[1] = -1e+06;
            } else {
                data.tv_modifier[1] = var_47681252dc0d55dd;
            }
        }
    }
    muzzle = weapon.muzzle;
    if (isdefined(muzzle)) {
        data.weapon_muzzle = muzzle;
        data.lid_muzzle = function_693e108cb61ceeb5(basename, muzzle);
        var_91508dc8cd30163e = var_75a7008e426d90db[muzzle];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_muzzle[0] = -1e+06;
            } else {
                data.tv_muzzle[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_muzzle[1] = -1e+06;
            } else {
                data.tv_muzzle[1] = var_47681252dc0d55dd;
            }
        }
    }
    reargrip = weapon.reargrip;
    if (isdefined(reargrip)) {
        data.var_d8276d9eb2e2c788 = reargrip;
        data.var_ed3583ab0834ea1d = function_693e108cb61ceeb5(basename, reargrip);
        var_91508dc8cd30163e = var_75a7008e426d90db[reargrip];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.var_f3a41b9191dfcb0e[0] = -1e+06;
            } else {
                data.var_f3a41b9191dfcb0e[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.var_f3a41b9191dfcb0e[1] = -1e+06;
            } else {
                data.var_f3a41b9191dfcb0e[1] = var_47681252dc0d55dd;
            }
        }
    }
    trigger = weapon.trigger;
    if (isdefined(trigger)) {
        data.weapon_trigger = trigger;
        data.lid_trigger = function_693e108cb61ceeb5(basename, trigger);
        if (isdefined(var_75a7008e426d90db[trigger])) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_trigger[0] = -1e+06;
            } else {
                data.tv_trigger[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_trigger[1] = -1e+06;
            } else {
                data.tv_trigger[1] = var_47681252dc0d55dd;
            }
        }
    }
    extra = weapon.extra;
    if (isdefined(extra)) {
        data.weapon_extra = extra;
        data.lid_extra = function_693e108cb61ceeb5(basename, extra);
        var_91508dc8cd30163e = var_75a7008e426d90db[extra];
        if (isdefined(var_91508dc8cd30163e)) {
            var_47681252dc0d55dd = var_91508dc8cd30163e[0];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_extra[0] = -1e+06;
            } else {
                data.tv_extra[0] = var_47681252dc0d55dd;
            }
            var_47681252dc0d55dd = var_91508dc8cd30163e[1];
            if (!isdefined(var_47681252dc0d55dd) || !isfloat(var_47681252dc0d55dd)) {
                /#
                    assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
                #/
                data.tv_extra[1] = -1e+06;
            } else {
                data.tv_extra[1] = var_47681252dc0d55dd;
            }
        }
    }
    return data;
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa721
// Size: 0x3dc
function function_6a347a3138ec63e1(data) {
    currenttime = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    if (currenttime <= 0 && (!isdefined(self.loadoutindex) || self.loadoutindex == -1)) {
        return;
    }
    if (!isdefined(self.pers) || !isdefined(namespace_3c5a4254f2b957ea::getpersstat("weaponStats"))) {
        return;
    }
    if (iskillstreakweapon(data.weaponname) || isvehicleweapon(data.weaponname) || isfistsonly(data.weaponname)) {
        return;
    }
    key = data.fullweaponname;
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("weaponStats")[key])) {
        var_fc0c136f54847d43 = getdvarint(@"hash_817f686503ccdecf", 5);
        if (namespace_3c5a4254f2b957ea::getpersstat("weaponStats").size >= var_fc0c136f54847d43) {
            function_8076b5556f48a6cd(self);
            self.pers["weaponStats"] = [];
        }
        if (data.fullweaponname == "agent_mp") {
            weaponattachments = [];
        } else {
            var_2ba4a91944e009e8 = getweaponattachments(data.fullweaponname);
            weaponattachments = attachmentsfilterforstats(var_2ba4a91944e009e8, data.fullweaponname);
        }
        var_61022cd5389d83d0 = -1;
        if (namespace_de6e6777b0937bd7::function_892570944f6b6a2(self)) {
            var_61022cd5389d83d0 = ispickedupweapon(data.fullweaponname);
        }
        loadoutindex = -1;
        if (isdefined(self.loadoutindex) && !var_61022cd5389d83d0) {
            loadoutindex = self.loadoutindex;
        }
        newentry = spawnstruct();
        newentry.stats = [];
        newentry.weapon = data.weaponname;
        newentry.weaponattachments = weaponattachments;
        newentry.loadoutindex = loadoutindex;
        newentry.var_61022cd5389d83d0 = var_61022cd5389d83d0;
        newentry.weaponobj = data.weaponobj;
        if (isdefined(data.variantid)) {
            newentry.variantid = data.variantid;
        } else {
            newentry.variantid = -1;
        }
        self.pers["weaponStats"][key] = newentry;
    }
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("weaponStats")[key].stats[data.statname])) {
        self.pers["weaponStats"][key].stats[data.statname] = data.var_a1d4e7d5ef9da660;
    } else {
        self.pers["weaponStats"][key].stats[data.statname] = self.pers["weaponStats"][key].stats[data.statname] + data.var_a1d4e7d5ef9da660;
    }
    if (data.statname == "shots") {
        self.pers["telemetry"].shots = self.pers["telemetry"].shots + data.var_a1d4e7d5ef9da660;
    } else if (data.statname == "hits") {
        self.pers["telemetry"].hits = self.pers["telemetry"].hits + data.var_a1d4e7d5ef9da660;
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab04
// Size: 0x139
function function_ac6b649326f4b17e(data) {
    /#
        assertex(namespace_36f464722d326bbe::isgameparticipant(data.player), "data.player is not a player: " + data.player.code_classname);
    #/
    player = data.player;
    if (namespace_36f464722d326bbe::isgameparticipant(player) == 0) {
        return;
    }
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
        return;
    }
    if (isbot(player) || istestclient(player) || isai(player)) {
        return;
    }
    var_ed6c4157feea476b = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    scoreevent = data.scoreevent;
    if (function_d03495fe6418377b(scoreevent)) {
        scoreevent = function_f28fd66285fa2c9(scoreevent);
    }
    var_d3cf11436c80a43e = player dlog_recordplayerevent("dlog_event_mp_player_score_event", [0:"time_from_match_start_ms", 1:var_ed6c4157feea476b, 2:"score_event", 3:scoreevent]);
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").player_score_event_count) && istrue(var_d3cf11436c80a43e)) {
        player.pers["telemetry"].player_score_event_count++;
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac44
// Size: 0xd1
function function_6a9aa1d51a6bacc3(data) {
    player = data.player;
    var_c198f7ca473378fb = data.var_c198f7ca473378fb;
    var_fc40287339bfe643 = data.var_c739ba1eb6635b73;
    var_f325fe524d4336b = player function_3b6bbfec65cc4ee3();
    if (!var_f325fe524d4336b) {
        return;
    }
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
        return;
    }
    if (isbot(player) || istestclient(player) || isai(player)) {
        return;
    }
    if (!isdefined(var_c198f7ca473378fb)) {
        var_c198f7ca473378fb = "DEFAULT";
    }
    player dlog_recordplayerevent("dlog_event_reload_cancel_reason", [0:"reload_cancel_time", 1:var_fc40287339bfe643, 2:"reload_canceled", 3:1, 4:"reload_cancel_type", 5:var_c198f7ca473378fb]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad1c
// Size: 0x1ac
function function_c72337759677531c(data) {
    player = undefined;
    lifeindex = -1;
    if (isdefined(data.player) && namespace_de6e6777b0937bd7::function_892570944f6b6a2(data.player) && namespace_36f464722d326bbe::isgameparticipant(data.player)) {
        player = data.player;
        if (isdefined(data.player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
            lifeindex = data.player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
        }
    }
    var_ed6c4157feea476b = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    dlog_recordevent("dlog_event_mp_game_event", [0:"client", 1:player, 2:"event_name", 3:data.eventname, 4:"time_from_match_start_ms", 5:var_ed6c4157feea476b, 6:"player_life_index", 7:lifeindex, 8:"pos_x", 9:data.position[0], 10:"pos_y", 11:data.position[1], 12:"pos_z", 13:data.position[2]]);
    if (isdefined(game["telemetry"]) && isdefined(game["telemetry"].game_event_count)) {
        game["telemetry"].game_event_count++;
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaecf
// Size: 0x1b2
function private function_1a88d4daa0cb7e1f(var_e75f0523bc1dbde8, var_ad20d588bce2ce99) {
    var_57549abbd404feb4 = [];
    var_57549abbd404feb4["armor_plate_done"] = "NONE";
    var_57549abbd404feb4["death"] = "DEATH";
    var_57549abbd404feb4["mantle_start"] = "MANTLE_STARTED";
    var_57549abbd404feb4["last_stand_start"] = "LAST_STAND_STARTED";
    var_57549abbd404feb4["scr_change_swim_state"] = "SWIM_STATE_CHANGED";
    var_57549abbd404feb4["special_weapon_fired"] = "SPECIAL_WEAPON_FIRED";
    var_57549abbd404feb4["try_armor_cancel"] = [];
    var_57549abbd404feb4["try_armor_cancel"]["damage_received"] = "DAMAGE_RECEIVED";
    var_57549abbd404feb4["try_armor_cancel"]["parachuting"] = "PARACHUTING";
    var_57549abbd404feb4["try_armor_cancel"]["last_stand_reviver_start"] = "LAST_STAND_REVIVER_STARTED";
    var_57549abbd404feb4["try_armor_cancel"]["armory_kiosk_used"] = "ARMORY_KIOSK_USED";
    var_57549abbd404feb4["try_armor_cancel"]["interrogation_interrogator_start"] = "INTERROGATION_INTERROGATOR_STARTED";
    var_57549abbd404feb4["try_armor_cancel"]["vehicle_enter"] = "VEHICLE_ENTER";
    var_57549abbd404feb4["try_armor_cancel"]["game_end"] = "GAME_END";
    var_57549abbd404feb4["try_armor_cancel"]["all_armor_plates_dropped"] = "ALL_ARMOR_PLATES_DROPPED";
    var_57549abbd404feb4["try_armor_cancel"]["loadout_open"] = "LOADOUT_OPEN";
    var_57549abbd404feb4["try_armor_cancel"]["ladder_used"] = "LADDER_USED";
    var_57549abbd404feb4["try_armor_cancel"]["player_switched_weapon"] = "PLAYER_SWITCHED_WEAPON";
    var_57549abbd404feb4["try_armor_cancel"]["player_switched_to_grenade"] = "PLAYER_SWITCHED_TO_GRENADE";
    var_57549abbd404feb4["try_armor_cancel"]["player_interaction"] = "PLAYER_DIRECT_ACTION";
    var_57549abbd404feb4["try_armor_cancel"]["armor_unselected"] = "OTHER_ARMOR_UNSELECTED";
    var_6058620ee3a64145 = var_57549abbd404feb4[var_e75f0523bc1dbde8];
    if (isdefined(var_6058620ee3a64145) && isarray(var_6058620ee3a64145)) {
        var_6058620ee3a64145 = var_57549abbd404feb4[var_e75f0523bc1dbde8][var_ad20d588bce2ce99];
    }
    if (!isdefined(var_6058620ee3a64145)) {
        var_6058620ee3a64145 = "OTHER";
    }
    return var_6058620ee3a64145;
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb089
// Size: 0x61
function function_1879ce4fba1cd65d(data) {
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(data.player)) {
        return;
    }
    data.player dlog_recordplayerevent("dlog_event_player_armor_auto_equip_cancel", [0:"cancel_reason", 1:function_1a88d4daa0cb7e1f(data.var_e75f0523bc1dbde8, data.var_ad20d588bce2ce99)]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0f1
// Size: 0x1eb
function function_675feb1c926f55a3(data) {
    data.player dlog_recordplayerevent("dlog_event_dmz_player_extraction_complete", [0:"team", 1:data.var_5a0fc1d304e970ea, 2:"player_x", 3:data.x, 4:"player_y", 5:data.y, 6:"player_z", 7:data.z, 8:"player_pitch", 9:data.var_6437fc57f57c9ad8, 10:"player_yaw", 11:data.var_fe76a03a13318315, 12:"player_roll", 13:data.zrot, 14:"lpcon_level", 15:data.var_9c02e895e4dbdc3b, 16:"match_time_elapsed", 17:data.var_c983d3abb7ec13d9, 18:"extraction_type", 19:data.var_fcc975ee4c8b02cc, 20:"cash_total", 21:data.var_42623c2865853280, 22:"backpack_items", 23:data.var_8003724ead57ba09, 24:"stowed_weapon", 25:data.stowedweapon, 26:"loadout_items", 27:data.var_8919314d1df8d669, 28:"mission_1_status", 29:data.var_3d1611a538e77206, 30:"mission_2_status", 31:data.var_3e8d5a83ae37a4ff, 32:"mission_3_status", 33:data.var_d9bb11bff39d0bac, 34:"new_items_unlocked", 35:data.var_d35c23115990e1ce, 36:"exfilstreak", 37:data.exfilstreak]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2e3
// Size: 0x143
function function_4fc7f0119fc38d0c(data) {
    data.player dlog_recordplayerevent("dlog_event_dmz_container_open", [0:"team", 1:data.var_5a0fc1d304e970ea, 2:"player_x", 3:data.x, 4:"player_y", 5:data.y, 6:"player_z", 7:data.z, 8:"player_pitch", 9:data.var_6437fc57f57c9ad8, 10:"player_yaw", 11:data.var_fe76a03a13318315, 12:"player_roll", 13:data.zrot, 14:"lpcon_level", 15:data.var_9c02e895e4dbdc3b, 16:"match_time_elapsed", 17:data.var_c983d3abb7ec13d9, 18:"item_ids", 19:data.var_9846f3da68a7d5bc, 20:"item_counts", 21:data.var_cf765966d1ee56d6, 22:"container_type", 23:data.container_type]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb42d
// Size: 0x113
function function_89d4104dbacb6aef(data) {
    data.player dlog_recordplayerevent("dlog_event_dmz_contract_complete", [0:"contract_name", 1:data.var_68deae7cbf3a47be, 2:"result", 3:data.result, 4:"team", 5:data.teamid, 6:"endx", 7:data.x, 8:"endy", 9:data.y, 10:"endz", 11:data.z, 12:"startx", 13:data.var_3addc209d947fb9b, 14:"starty", 15:data.var_3addc109d947f968, 16:"startz", 17:data.var_3addc409d9480001, 18:"poi", 19:data.poi]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb547
// Size: 0x55
function function_260df5ddbfebac5f(player) {
    var_5a0fc1d304e970ea = "unset";
    if (isdefined(player.sessionteam)) {
        var_5a0fc1d304e970ea = player.sessionteam;
    }
    if (isdefined(player.team)) {
        var_5a0fc1d304e970ea = player.team;
    }
    return var_5a0fc1d304e970ea;
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5a4
// Size: 0x1bc
function function_1ef65d2654424502(activity, result, var_5e671fc71e72d5e8) {
    if (!isdefined(activity)) {
        return;
    }
    if (!isdefined(activity.name)) {
        return;
    }
    if (!isdefined(result)) {
        result = "fail";
    }
    players = namespace_54d20dd0dd79277f::getteamdata(var_5e671fc71e72d5e8, "players");
    foreach (player in players) {
        var_5a0fc1d304e970ea = function_260df5ddbfebac5f(player);
        data = spawnstruct();
        data.var_68deae7cbf3a47be = activity.name;
        data.player = player;
        data.result = result;
        data.teamid = var_5a0fc1d304e970ea;
        data.x = player.origin[0];
        data.y = player.origin[1];
        data.z = player.origin[2];
        data.var_3addc209d947fb9b = activity.origin[0];
        data.var_3addc109d947f968 = activity.origin[1];
        data.var_3addc409d9480001 = activity.origin[2];
        data.poi = activity.poi;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_dmz_contract", data);
    }
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb767
// Size: 0x1c7
function function_a884632edebe7d1e(data) {
    if (!isdefined(data)) {
        return;
    }
    if (!isdefined(data.agents)) {
        return;
    }
    matchtime = int(getsecondspassed());
    location = data.var_c5e7fce963586ec0;
    if (!isdefined(location)) {
        location = (0, 0, 0);
    }
    poi = data.poi;
    if (!isdefined(poi)) {
        poi = "none";
    }
    var_d3d06e31985486a6 = [];
    foreach (agent in data.agents) {
        if (isdefined(agent.agent_type)) {
            var_d3d06e31985486a6[var_d3d06e31985486a6.size] = agent.agent_type;
        }
    }
    var_9c02e895e4dbdc3b = "0";
    if (isdefined(level.var_a7b62649c81b481a) && isdefined(level.var_a7b62649c81b481a.var_acc161de36707de2)) {
        var_9c02e895e4dbdc3b = namespace_3c37cb17ade254d::string(level.var_a7b62649c81b481a.var_acc161de36707de2);
    }
    dlog_recordevent("dlog_event_dmz_reinforcement_triggered", [0:"time_elapsed", 1:matchtime, 2:"lpcon_level", 3:var_9c02e895e4dbdc3b, 4:"pos_x", 5:location[0], 6:"pos_y", 7:location[1], 8:"pos_z", 9:location[2], 10:"poi", 11:poi, 12:"agents", 13:var_d3d06e31985486a6]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb935
// Size: 0xf6
function function_532119a556885727(data) {
    var_c983d3abb7ec13d9 = -1;
    if (isdefined(data.var_c983d3abb7ec13d9)) {
        var_c983d3abb7ec13d9 = data.var_c983d3abb7ec13d9;
    }
    var_75a8eb8af196b837 = -1;
    if (isdefined(data.var_75a8eb8af196b837)) {
        var_75a8eb8af196b837 = data.var_75a8eb8af196b837;
    }
    agentskilled = -1;
    if (isdefined(data.agentskilled)) {
        agentskilled = data.agentskilled;
    }
    var_9c02e895e4dbdc3b = #"undefined";
    if (isdefined(data.var_9c02e895e4dbdc3b)) {
        var_9c02e895e4dbdc3b = namespace_500325c20d920621::function_c43f9411e4146fbd();
    }
    dlog_recordevent("dlog_event_dmz_biolab_lpcon", [0:"match_time_elapsed", 1:var_c983d3abb7ec13d9, 2:"teams_remaining", 3:var_75a8eb8af196b837, 4:"agents_killed", 5:agentskilled, 6:"lpcon_level", 7:var_9c02e895e4dbdc3b]);
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba32
// Size: 0x17f
function function_ccb453b7ef932cea(weaponobj) {
    if (!isdefined(weaponobj)) {
        return "invalid";
    }
    if (isdefined(weaponobj.weaponblueprint) && isdefined(weaponobj.weaponblueprint.lootid)) {
        return utility::string(weaponobj.weaponblueprint.lootid);
    }
    weaponref = weapon::function_23defc57f8da7fbc(weaponobj.basename);
    lootid = loot::getlootidfromref(weaponref);
    if (isdefined(lootid) && lootid != 0) {
        return utility::string(lootid);
    }
    if (isdefined(level.killstreakweaponmap) && isdefined(level.killstreakweaponmap[weaponobj.basename])) {
        lootid = loot::getlootidfromref(level.killstreakweaponmap[weaponobj.basename]);
        if (isdefined(lootid) && lootid != 0) {
            return utility::string(lootid);
        }
    }
    var_ebec497ff8b18a45 = supers::getsuperrefforsuperweapon(weaponobj);
    lootid = loot::getlootidfromref(var_ebec497ff8b18a45);
    if (isdefined(lootid) && lootid != 0) {
        return utility::string(lootid);
    }
    equipmentref = equipment::getequipmentreffromweapon(weaponobj);
    lootid = loot::getlootidfromref(equipmentref);
    if (isdefined(lootid) && lootid != 0) {
        return utility::string(lootid);
    }
    weaponref = weapon::getweaponrootname(weaponobj);
    lootid = loot::getlootidfromref(weaponref);
    if (isdefined(lootid) && lootid != 0) {
        return utility::string(lootid);
    }
    return "invalid";
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb9
// Size: 0x42d
function function_deef6a4f7fbec3b8(weaponobj) {
    var_9067e5ad39ae6bd5 = [];
    var_9067e5ad39ae6bd5[0] = "";
    var_9067e5ad39ae6bd5[1] = "";
    var_9067e5ad39ae6bd5[2] = "";
    var_9067e5ad39ae6bd5[3] = "";
    var_9067e5ad39ae6bd5[4] = "";
    var_9067e5ad39ae6bd5[5] = "";
    var_9067e5ad39ae6bd5[6] = "";
    var_9067e5ad39ae6bd5[7] = "";
    var_9067e5ad39ae6bd5[8] = "";
    var_9067e5ad39ae6bd5[9] = "";
    var_9067e5ad39ae6bd5[10] = "";
    var_9067e5ad39ae6bd5[11] = "";
    var_9067e5ad39ae6bd5[12] = "";
    if (isdefined(weaponobj)) {
        if (weaponobj hasattachment("jup_jp12_pi_mike93_bar_hvyconvert")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp12_pi_mike93_bar_hvyconvert";
            var_9067e5ad39ae6bd5[1] = "jup_jp12_pi_mike93_bar_hvyconvert";
            var_9067e5ad39ae6bd5[5] = "jup_jp12_mike93_grip_amp_vert";
            var_9067e5ad39ae6bd5[2] = "jup_jp12_pi_mike93_stock";
            var_9067e5ad39ae6bd5[4] = "jup_mike93_ironsdefault_stockp";
        } else if (weaponobj hasattachment("jup_bromeo2m_amp")) {
            var_9067e5ad39ae6bd5[11] = "jup_bromeo2m_amp";
            var_9067e5ad39ae6bd5[0] = "jup_bromeo2m_rec";
            var_9067e5ad39ae6bd5[6] = "ammo_762s";
            var_9067e5ad39ae6bd5[1] = "jup_jp02_ar_bromeo2m_bar_heavy_short";
            var_9067e5ad39ae6bd5[2] = "jup_jp02_br_bromeo2_stock_folding";
            var_9067e5ad39ae6bd5[3] = "jup_jp02_ar_bromeo2m_mag_30_762s";
            var_9067e5ad39ae6bd5[4] = "jup_bromeo2m_ironsdefault";
            var_9067e5ad39ae6bd5[8] = "jup_jp02_br_bromeo2_pgrip_ass";
        } else if (weaponobj hasattachment("jup_cp24_sm_glima21_bar_convert")) {
            var_9067e5ad39ae6bd5[11] = "jup_cp24_sm_glima21_bar_convert";
            var_9067e5ad39ae6bd5[1] = "jup_cp24_sm_glima21_bar_convert";
        } else if (weaponobj hasattachment("jup_pkilop_amp_bull")) {
            var_9067e5ad39ae6bd5[11] = "jup_pkilop_amp_bull";
            var_9067e5ad39ae6bd5[1] = "jup_jp06_lm_pkilob_bar_bullshort";
            var_9067e5ad39ae6bd5[2] = "jup_jp06_lm_pkilob_stock_pad";
            var_9067e5ad39ae6bd5[3] = "jup_jp06_lm_pkilob_belt_100_762n";
            var_9067e5ad39ae6bd5[4] = "jup_pkilob_ironsdefault";
            var_9067e5ad39ae6bd5[0] = "jup_pkilob_rec";
        } else if (weaponobj hasattachment("jup_jp07_sm_uzulu_22_45acp")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp07_sm_uzulu_22_45acp";
            var_9067e5ad39ae6bd5[1] = "jup_jp07_sm_uzulu_bar_amp_45";
            var_9067e5ad39ae6bd5[2] = "jup_jp07_sm_uzulu_stock_amp_45";
            var_9067e5ad39ae6bd5[3] = "jup_jp07_sm_uzulu_22_45acp";
            var_9067e5ad39ae6bd5[6] = "ammo_45acp";
            var_9067e5ad39ae6bd5[0] = "jup_uzulu_rec_amp";
            var_9067e5ad39ae6bd5[5] = "jup_grip_uzulup1_amp";
        } else if (weaponobj hasattachment("jup_jp07_sm_uzulup_stock_brace")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp07_sm_uzulup_stock_brace";
            var_9067e5ad39ae6bd5[2] = "jup_jp07_sm_uzulup_stock_brace";
            var_9067e5ad39ae6bd5[12] = "jup_uzulup_akimbo";
        } else if (weaponobj hasattachment("jup_acharlie_amp_300blk")) {
            var_9067e5ad39ae6bd5[11] = "jup_acharlie_amp_300blk";
            var_9067e5ad39ae6bd5[0] = "jup_acharlie300_rec";
            var_9067e5ad39ae6bd5[6] = "ammo_blk";
            var_9067e5ad39ae6bd5[1] = "jup_jp19_ar_acharlie300_bar_lgtlong";
            var_9067e5ad39ae6bd5[2] = "jup_jp19_ar_acharlie300_stockno";
            var_9067e5ad39ae6bd5[3] = "jup_jp19_ar_acharlie300_mag_30_blk";
            var_9067e5ad39ae6bd5[4] = "jup_acharlie300_ironsdefault";
            var_9067e5ad39ae6bd5[8] = "jup_jp19_ar_acharlie300_pgrip_ass";
        } else if (weaponobj hasattachment("jup_jp08_ar_qbravo95_amp_t95")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp08_ar_qbravo95_amp_t95";
            var_9067e5ad39ae6bd5[0] = "jup_qbravo95_rec";
            var_9067e5ad39ae6bd5[1] = "jup_jp08_ar_qbravo95_bar";
            var_9067e5ad39ae6bd5[3] = "jup_jp08_ar_qbravo95_mag_30_58";
            var_9067e5ad39ae6bd5[4] = "jup_qbravo95_ironsdefault";
            var_9067e5ad39ae6bd5[8] = "jup_jp08_ar_qbravo95_pgrip";
        } else if (weaponobj hasattachment("jup_jp19_dm_acharlied_mag_20_68r_amp")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp19_dm_acharlied_mag_20_68r_amp";
            var_9067e5ad39ae6bd5[0] = "jup_acharlied_amp_rec";
            var_9067e5ad39ae6bd5[2] = "jup_jp19_dm_acharlied_stock_tacheavy";
            var_9067e5ad39ae6bd5[12] = "jup_acharlied_selectauto";
        } else if (weaponobj hasattachment("jup_jp14_pi_rsierra12_bar_amp")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp14_pi_rsierra12_bar_amp";
            var_9067e5ad39ae6bd5[0] = "jup_rsierra12_convert_rec";
            var_9067e5ad39ae6bd5[2] = "jup_jp14_pi_rsierra12_stock_amp";
            var_9067e5ad39ae6bd5[8] = "jup_jp14_pi_rsierra12_pgrip_amp";
            var_9067e5ad39ae6bd5[4] = "jup_rsierra12_irons_stock";
        } else if (weaponobj hasattachment("jup_jp19_br_acharlie450_drum_50_450b")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp19_br_acharlie450_drum_50_450b";
            var_9067e5ad39ae6bd5[0] = "jup_acharlie450_rec_amp";
        } else if (weaponobj hasattachment("jup_jp02_sm_scharlie3_bar_amp")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp02_sm_scharlie3_bar_amp";
            var_9067e5ad39ae6bd5[0] = "jup_scharlie3_rec_amp";
            var_9067e5ad39ae6bd5[7] = "jup_comp_sm_14_amp";
        } else if (weaponobj hasattachment("jup_jp01_ar_golf36_bar_amp")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp01_ar_golf36_bar_amp";
            var_9067e5ad39ae6bd5[0] = "jup_golf36_rec_amp";
            var_9067e5ad39ae6bd5[4] = "jup_reflex08_tall_amp";
        } else if (weaponobj hasattachment("jup_jp01_dm_slima8_bar_amp")) {
            var_9067e5ad39ae6bd5[11] = "jup_jp01_dm_slima8_bar_amp";
            var_9067e5ad39ae6bd5[0] = "jup_slima8_rec_amp";
            var_9067e5ad39ae6bd5[4] = "jup_reflex08_tall_amp";
        } else if (weaponobj hasattachment("jup_cp01_sm_coscar635_bar_amp")) {
            var_9067e5ad39ae6bd5[11] = "jup_cp01_sm_coscar635_bar_amp";
            var_9067e5ad39ae6bd5[0] = "jup_coscar635_amp_rec";
        }
    }
    return var_9067e5ad39ae6bd5;
}

// Namespace namespace_3a38da80071a2614/namespace_e77194a0203f683
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfee
// Size: 0xcb
function function_42db4e92349e1fee(data) {
    data.player dlog_recordplayerevent("dlog_event_player_the_hunt_report", [0:"playlist_id", 1:data.playlistid, 2:"mode", 3:data.mode, 4:"sub_mode", 5:data.sub_mode, 6:"bones_zombies", 7:data.bones_zombies, 8:"skulls_armored_zombies", 9:data.skulls_armored_zombies, 10:"skulls_hellhounds", 11:data.skulls_hellhounds, 12:"skulls_mimics", 13:data.skulls_mimics]);
}

