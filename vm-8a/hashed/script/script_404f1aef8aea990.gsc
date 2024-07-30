#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\flags.gsc;

#namespace namespace_36cfc486ea2fec3b;

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0x72
function init() {
    if (!scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        return;
    }
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_server_exit_level", &function_69ddf7a3e512a18a);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_disconnect", &on_player_disconnect);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_spawned", &on_player_spawned);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_update_weapon_stats", &function_6a347a3138ec63e1);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_prematch_over", &function_37f53cf222f43271);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_bot_set_difficulty", &function_488bfc3e01722743);
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346
// Size: 0x74
function function_69ddf7a3e512a18a() {
    foreach (player in level.players) {
        data = spawnstruct();
        data.player = player;
        function_ce976ee0200475a2(data);
    }
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2
// Size: 0x1d7
function function_ce976ee0200475a2(data) {
    player = data.player;
    if (!isdefined(player.pers["telemetry"].var_c804fa67733b8ef5)) {
        if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
            return;
        }
        if (istrue(player.var_6a91d0e80cc504e) && !istrue(level.gameended)) {
            return;
        }
        place = -1;
        survival_time = 0;
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            if (isdefined(player.pers["br_place"])) {
                place = player.pers["br_place"];
            }
            if (!isdefined(player.pers["br_survival_time"]) && isdefined(level.starttime)) {
                gameendtime = level.gameendtime;
                if (!isdefined(gameendtime)) {
                    gameendtime = gettime();
                }
                player.pers["br_survival_time"] = gameendtime - level.starttime;
                survival_time = player.pers["br_survival_time"];
            }
        }
        bot_difficulty = "";
        bot_mind_personality = "";
        if (isbot(player)) {
            bot_difficulty = player botgetdifficulty();
            if (isdefined(player.mind_personality)) {
                bot_mind_personality = player.mind_personality;
            }
        }
        player dlog_recordplayerevent("dlog_event_mobile_player_match_end", ["place", place, "survival_time", survival_time, "bot_difficulty", bot_difficulty, "bot_mind_personality", bot_mind_personality]);
        player.pers["telemetry"].var_c804fa67733b8ef5 = 1;
    }
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a1
// Size: 0x29
function on_player_disconnect(data) {
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        function_6b12cc412aa6ea91(data);
    }
    function_ce976ee0200475a2(data);
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d2
// Size: 0x8f
function on_player_spawned(player) {
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
        return;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        prematch = player.pers["telemetry"].prematch;
        if (!isdefined(prematch)) {
            prematch = spawnstruct();
            player.pers["telemetry"].prematch = prematch;
            prematch.spawns = 0;
            return;
        }
        prematch.spawns++;
    }
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x669
// Size: 0x96
function function_37f53cf222f43271() {
    if (istrue(getdvarint(@"hash_b46c28f676772bd2", 0)) || istrue(level.skipprematch)) {
        return;
    }
    foreach (player in level.players) {
        data = spawnstruct();
        data.player = player;
        function_6b12cc412aa6ea91(data);
    }
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x707
// Size: 0x50
function function_488bfc3e01722743(data) {
    bot = data.bot;
    if (!isbot(bot)) {
        return;
    }
    bot dlog_recordplayerevent("dlog_event_mobile_bot_set_difficulty", ["difficulty", data.difficulty]);
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f
// Size: 0x15b
function function_522ebd007aa28658(data) {
    prematch = self.pers["telemetry"].prematch;
    if (!isdefined(prematch)) {
        return;
    }
    if (data.statname == "shots") {
        if (!isdefined(prematch.shots)) {
            prematch.shots = data.incvalue;
        } else {
            prematch.shots += data.incvalue;
        }
        return;
    }
    if (data.statname == "hits") {
        if (!isdefined(prematch.hits)) {
            prematch.hits = data.incvalue;
        } else {
            prematch.hits += data.incvalue;
        }
        return;
    }
    if (data.statname == "kills") {
        if (!isdefined(prematch.kills)) {
            prematch.kills = data.incvalue;
            return;
        }
        prematch.kills += data.incvalue;
    }
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c2
// Size: 0x2f
function function_6a347a3138ec63e1(data) {
    currenttime = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    if (currenttime <= 0) {
        function_522ebd007aa28658(data);
    }
}

// Namespace namespace_36cfc486ea2fec3b / namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x2fb
function function_6b12cc412aa6ea91(data) {
    player = data.player;
    if (!isdefined(player.pers["telemetry"].var_c0e398db99db74ed)) {
        if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
            return;
        }
        if (istrue(player.var_6a91d0e80cc504e)) {
            return;
        }
        prematch = player.pers["telemetry"].prematch;
        if (!isdefined(prematch)) {
            return;
        }
        utc_connect_time = 0;
        if (isdefined(player.pers["telemetry"].utc_connect_time_s)) {
            utc_connect_time = player.pers["telemetry"].utc_connect_time_s;
        }
        spawns = default_to(prematch.spawns, 0);
        hits = player.trackingweaponhits;
        if (isdefined(prematch.hits)) {
            hits += prematch.hits;
        }
        shots = default_to(player.trackingweaponshots, 0);
        if (isdefined(prematch.shots)) {
            shots += prematch.shots;
        }
        kills = default_to(player.trackingweaponkills, 0);
        if (isdefined(prematch.kills)) {
            kills += prematch.kills;
        }
        distanceTotal = default_to(player.pers["distanceTotal"], 0);
        var_b92c01f350d85fe3 = 0;
        if (isdefined(player.pers["movementUpdateCount"]) && player.pers["movementUpdateCount"] >= 30) {
            var_b92c01f350d85fe3 = player.pers["distanceTotal"] / player.pers["movementUpdateCount"];
        }
        currentweapon = player getcurrentweapon();
        weaponname = currentweapon.basename;
        player dlog_recordplayerevent("dlog_event_mobile_prematch_end", ["spawns", spawns, "kills", kills, "distance_moved", distanceTotal, "speed", var_b92c01f350d85fe3, "shots", shots, "hits", hits, "last_weapon_at_hand", weaponname, "connect_time", utc_connect_time, "disconnect_time", getsystemtime()]);
        player.pers["telemetry"].var_c0e398db99db74ed = 1;
    }
}

