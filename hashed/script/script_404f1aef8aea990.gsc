// mwiii decomp prototype
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

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0x73
function init() {
    if (!namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        return;
    }
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_server_exit_level", &function_69ddf7a3e512a18a);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_disconnect", &on_player_disconnect);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_spawned", &on_player_spawned);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_update_weapon_stats", &function_6a347a3138ec63e1);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_prematch_over", &function_37f53cf222f43271);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_bot_set_difficulty", &function_488bfc3e01722743);
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346
// Size: 0x75
function function_69ddf7a3e512a18a() {
    foreach (player in level.players) {
        data = spawnstruct();
        data.player = player;
        function_ce976ee0200475a2(data);
    }
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2
// Size: 0x1d8
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
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
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
            if (isdefined(player.var_e2055bf088954e86)) {
                bot_mind_personality = player.var_e2055bf088954e86;
            }
        }
        player dlog_recordplayerevent("dlog_event_mobile_player_match_end", [0:"place", 1:place, 2:"survival_time", 3:survival_time, 4:"bot_difficulty", 5:bot_difficulty, 6:"bot_mind_personality", 7:bot_mind_personality]);
        player.pers["telemetry"].var_c804fa67733b8ef5 = 1;
    }
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a1
// Size: 0x2a
function on_player_disconnect(data) {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        function_6b12cc412aa6ea91(data);
    }
    function_ce976ee0200475a2(data);
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d2
// Size: 0x90
function on_player_spawned(player) {
    if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        prematch = player.pers["telemetry"].prematch;
        if (!isdefined(prematch)) {
            prematch = spawnstruct();
            player.pers["telemetry"].prematch = prematch;
            prematch.spawns = 0;
        } else {
            prematch.spawns++;
        }
    }
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x669
// Size: 0x97
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

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x707
// Size: 0x51
function function_488bfc3e01722743(data) {
    bot = data.bot;
    if (!isbot(bot)) {
        return;
    }
    bot dlog_recordplayerevent("dlog_event_mobile_bot_set_difficulty", [0:"difficulty", 1:data.difficulty]);
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f
// Size: 0x15c
function function_522ebd007aa28658(data) {
    prematch = self.pers["telemetry"].prematch;
    if (!isdefined(prematch)) {
        return;
    }
    if (data.statname == "shots") {
        if (!isdefined(prematch.shots)) {
            prematch.shots = data.var_a1d4e7d5ef9da660;
        } else {
            prematch.shots = prematch.shots + data.var_a1d4e7d5ef9da660;
        }
    } else if (data.statname == "hits") {
        if (!isdefined(prematch.hits)) {
            prematch.hits = data.var_a1d4e7d5ef9da660;
        } else {
            prematch.hits = prematch.hits + data.var_a1d4e7d5ef9da660;
        }
    } else if (data.statname == "kills") {
        if (!isdefined(prematch.kills)) {
            prematch.kills = data.var_a1d4e7d5ef9da660;
        } else {
            prematch.kills = prematch.kills + data.var_a1d4e7d5ef9da660;
        }
    }
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c2
// Size: 0x30
function function_6a347a3138ec63e1(data) {
    currenttime = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    if (currenttime <= 0) {
        function_522ebd007aa28658(data);
    }
}

// Namespace namespace_36cfc486ea2fec3b/namespace_d564b97030b0868
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x2fc
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
        var_fdf9b22d16276454 = 0;
        if (isdefined(player.pers["telemetry"].utc_connect_time_s)) {
            var_fdf9b22d16276454 = player.pers["telemetry"].utc_connect_time_s;
        }
        spawns = function_53c4c53197386572(prematch.spawns, 0);
        hits = player.trackingweaponhits;
        if (isdefined(prematch.hits)) {
            hits = hits + prematch.hits;
        }
        shots = function_53c4c53197386572(player.trackingweaponshots, 0);
        if (isdefined(prematch.shots)) {
            shots = shots + prematch.shots;
        }
        kills = function_53c4c53197386572(player.trackingweaponkills, 0);
        if (isdefined(prematch.kills)) {
            kills = kills + prematch.kills;
        }
        distancetotal = function_53c4c53197386572(player.pers["distanceTotal"], 0);
        var_b92c01f350d85fe3 = 0;
        if (isdefined(player.pers["movementUpdateCount"]) && player.pers["movementUpdateCount"] >= 30) {
            var_b92c01f350d85fe3 = player.pers["distanceTotal"] / player.pers["movementUpdateCount"];
        }
        currentweapon = player getcurrentweapon();
        weaponname = currentweapon.basename;
        player dlog_recordplayerevent("dlog_event_mobile_prematch_end", [0:"spawns", 1:spawns, 2:"kills", 3:kills, 4:"distance_moved", 5:distancetotal, 6:"speed", 7:var_b92c01f350d85fe3, 8:"shots", 9:shots, 10:"hits", 11:hits, 12:"last_weapon_at_hand", 13:weaponname, 14:"connect_time", 15:var_fdf9b22d16276454, 16:"disconnect_time", 17:getsystemtime()]);
        player.pers["telemetry"].var_c0e398db99db74ed = 1;
    }
}

