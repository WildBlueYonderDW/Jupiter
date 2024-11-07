#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using script_166b4f052da169a7;

#namespace namespace_cc8f563756534739;

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x700
// Size: 0xa4
function init() {
    flag_init("vo_system_setup_done");
    flag_init("dialogue_done");
    function_83b8144a47850cdd();
    level thread onplayerconnect();
    level thread scriptable_vo_handler();
    if (!isdefined(game["music"])) {
        game["music"]["cp_heli_infil"] = [];
        game["music"]["spawn_player"] = [];
        function_21168b5cd3f92925();
    }
    if (!isdefined(level.vo_functions)) {
        level.vo_functions = [];
    }
    if (isdefined(level.level_specific_vo_callouts)) {
        level.vo_functions = [[ level.level_specific_vo_callouts ]](level.vo_functions);
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ac
// Size: 0x906
function function_21168b5cd3f92925() {
    function_83b8144a47850cdd();
    game["dialogue"]["axis_male_cough"] = [];
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_1";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_2";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_3";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_4";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_5";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_6";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_7";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_3_enemy_8";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_1";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_2";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_3";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_4";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_5";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_6";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_7";
    game["dialogue"]["axis_male_cough"][game["dialogue"]["axis_male_cough"].size] = "generic_cough_fit_enemy_8";
    game["dialogue"]["axis_female_cough"] = [];
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_1";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_2";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_3";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_4";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_5";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_6";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_7";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_3_friendly_8";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_1";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_2";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_3";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_4";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_5";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_6";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_7";
    game["dialogue"]["axis_female_cough"][game["dialogue"]["axis_female_cough"].size] = "woman_cough_fit_friendly_8";
    game["dialogue"]["allies_male_cough"] = [];
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_1";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_2";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_3";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_4";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_5";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_6";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_7";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_3_friendly_8";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_1";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_2";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_3";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_4";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_5";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_6";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_7";
    game["dialogue"]["allies_male_cough"][game["dialogue"]["allies_male_cough"].size] = "generic_cough_fit_friendly_8";
    game["dialogue"]["allies_female_cough"] = [];
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_1";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_2";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_3";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_4";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_5";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_6";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_7";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_3_friendly_8";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_1";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_2";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_3";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_4";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_5";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_6";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_7";
    game["dialogue"]["allies_female_cough"][game["dialogue"]["allies_female_cough"].size] = "woman_cough_fit_friendly_8";
    if (!isdefined(level.vo_functions)) {
        level.vo_functions = [];
    }
    if (isdefined(level.level_specific_vo_callouts)) {
        level.vo_functions = [[ level.level_specific_vo_callouts ]](level.vo_functions);
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10ba
// Size: 0x2
function blank() {
    
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c4
// Size: 0x3c
function can_play_dialogue_system() {
    /#
        if (getdvarint(@"hash_f3a851c7e7a172af", 0) == 1) {
            return true;
        }
    #/
    if (level.players.size != 4) {
        return false;
    }
    if (is_vo_system_busy()) {
        return false;
    }
    return true;
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1109
// Size: 0x84
function vo_is_playing() {
    if (istrue(level.announcer_vo_playing)) {
        return true;
    } else if (istrue(level.player_vo_playing)) {
        return true;
    } else {
        foreach (player in level.players) {
            if (istrue(player.vo_system_playing_vo)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1196
// Size: 0x58
function getlengthofconversation(var_2463023b7a8fd31c) {
    time = 0;
    for (i = 0; i < var_2463023b7a8fd31c.size; i++) {
        var_a2306fc3519e2472 = level.vo_dialogue_prefix[var_2463023b7a8fd31c[i]];
        time += namespace_49f64a73fb8b35eb::get_sound_length(var_a2306fc3519e2472 + var_2463023b7a8fd31c[i]);
    }
    return time;
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11f7
// Size: 0x8e
function getarrayofdialoguealiases(var_d35946b8550701a5, var_42547671df42d8db) {
    temparray = [var_d35946b8550701a5];
    var_7b429d357acf4247 = var_d35946b8550701a5;
    while (true) {
        if (var_42547671df42d8db && isdefined(level.vo_alias_data[var_7b429d357acf4247].nextdialogue)) {
            temparray[temparray.size] = level.vo_alias_data[var_7b429d357acf4247].nextdialogue;
            var_7b429d357acf4247 = level.vo_alias_data[var_7b429d357acf4247].nextdialogue;
            continue;
        }
        break;
    }
    return temparray;
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128e
// Size: 0x21
function onplayerconnect() {
    for (;;) {
        level waittill("connected", player);
        player thread onplayerspawned();
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b7
// Size: 0xb6
function onplayerspawned() {
    self endon("disconnect");
    self waittill("spawned_player");
    scripts\engine\utility::ent_flag_wait("intro_binks_complete");
    if (!level.splitscreen || level.splitscreen && !isdefined(level.playedstartingmusic)) {
        if (level.splitscreen) {
            level.playedstartingmusic = 1;
        }
        var_14c1526a25b2b2df = game["music"]["spawn_player"].size;
        var_d2e335568dffe831 = randomint(var_14c1526a25b2b2df);
        self setplayermusicstate(game["music"]["spawn_player"][var_d2e335568dffe831]);
    }
    if (!flag("vo_system_setup_done")) {
        flag_set("vo_system_setup_done");
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1375
// Size: 0x50
function playvofordowned(player, var_d35946b8550701a5) {
    if (isplayingsolo() || level.only_one_player) {
        return;
    }
    line = player.vo_prefix + "laststand";
    player thread play_vo_on_player(line);
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13cd
// Size: 0x39
function playvoforrevived(player, var_d35946b8550701a5) {
    line = player.vo_prefix + "reviving";
    player thread play_vo_on_player(line);
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x140e
// Size: 0xe9
function playvoforscriptable(var_91839babd32261f4) {
    var_e3c20a88291cf3af = 45000;
    current_time = gettime();
    if (!isdefined(level.next_scriptable_vo_time) || level.next_scriptable_vo_time < current_time) {
        if (isdefined(level.next_scriptable_vo_time)) {
            if (randomint(100) < 60) {
                return;
            }
        }
        level.next_scriptable_vo_time = current_time + randomintrange(var_e3c20a88291cf3af, var_e3c20a88291cf3af + 5000);
        players = get_array_of_valid_players();
        player = random(players);
        if (!isdefined(player)) {
            return;
        }
        switch (var_91839babd32261f4) {
        case #"hash_14d8cee9efde6d97":
        case #"hash_2b9bfba8d9b531a5":
            line = player.vo_prefix + "alien_approach_truck";
            player play_vo_on_player(line);
            break;
        }
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ff
// Size: 0x38
function scriptable_vo_handler() {
    level endon("game_ended");
    level.scriptable_vo_played = [];
    while (true) {
        level waittill("scriptable", var_91839babd32261f4);
        level thread playvoforscriptable(var_91839babd32261f4);
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x153f
// Size: 0x57
function play_solo_vo(line, priority, timeout, interrupt, pause_time, only_local) {
    var_b1b1ff3f53f08719 = line + "_solo";
    if (soundexists(var_b1b1ff3f53f08719)) {
        play_vo_on_player(var_b1b1ff3f53f08719);
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x159e
// Size: 0x22f
function playsoundonplayers(sound, team, excludelist) {
    assert(isdefined(level.players));
    if (level.splitscreen) {
        if (isdefined(level.players[0])) {
            level.players[0] playlocalsound(sound);
        }
        return;
    }
    if (isdefined(team)) {
        if (isdefined(excludelist)) {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    continue;
                }
                if (isdefined(player.pers["team"]) && player.pers["team"] == team && !isexcluded(player, excludelist)) {
                    player playlocalsound(sound);
                }
            }
        } else {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    continue;
                }
                if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
                    player playlocalsound(sound);
                }
            }
        }
        return;
    }
    if (isdefined(excludelist)) {
        for (i = 0; i < level.players.size; i++) {
            if (level.players[i] issplitscreenplayer() && !level.players[i] issplitscreenplayerprimary()) {
                continue;
            }
            if (!isexcluded(level.players[i], excludelist)) {
                level.players[i] playlocalsound(sound);
            }
        }
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] issplitscreenplayer() && !level.players[i] issplitscreenplayerprimary()) {
            continue;
        }
        level.players[i] playlocalsound(sound);
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17d5
// Size: 0x38
function isexcluded(entity, entitylist) {
    for (index = 0; index < entitylist.size; index++) {
        if (entity == entitylist[index]) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1816
// Size: 0x89
function playeventvo(var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local) {
    players = get_array_of_valid_players();
    if (players.size < 1) {
        return;
    }
    player = random(players);
    alias = player.vo_prefix + var_d35946b8550701a5;
    player play_vo_on_player(alias);
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18a7
// Size: 0x53
function playvoforlaststand(player, var_d35946b8550701a5) {
    if (isplayingsolo() || level.only_one_player) {
        return;
    }
    line = player.vo_prefix + "last_stand";
    player thread play_vo_on_player(line, undefined, 1);
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1902
// Size: 0x9f
function player_casualty_vo(var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local) {
    if (!isplayer(self)) {
        return;
    }
    players = get_array_of_valid_players();
    players = array_remove(players, self);
    if (players.size < 1) {
        return;
    }
    player = players[0];
    line = player.vo_prefix + "reaction_casualty_generic";
    player play_vo_on_player(line, undefined, 1);
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19a9
// Size: 0x38
function is_in_array(var_fd434d3dfd963ecf, var_a9782c100e40da81) {
    for (i = 0; i < var_fd434d3dfd963ecf.size; i++) {
        if (var_fd434d3dfd963ecf[i] == var_a9782c100e40da81) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ea
// Size: 0xd7
function debug_change_vo_prefix_watcher() {
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        vo_prefix = getdvarint(@"hash_c62b3fa19dc0eed5", 0);
        if (vo_prefix != 0) {
            switch (vo_prefix) {
            case 1:
                self.vo_prefix = "p1_";
                break;
            case 2:
                self.vo_prefix = "p2_";
                break;
            case 3:
                self.vo_prefix = "p3_";
                break;
            case 4:
                self.vo_prefix = "p4_";
                break;
            default:
                break;
            }
            setdvar(@"hash_c62b3fa19dc0eed5", 0);
        }
        wait 1;
    }
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac9
// Size: 0xfd
function add_to_ambient_sound_queue(alias, play_origin, min_delay, max_delay, max_player_distance, chance_to_play, predelay) {
    if (!isdefined(level.ambient_sound_queue)) {
        level.ambient_sound_queue = [];
        level thread ambient_sound_queue();
    }
    var_85790f5a5b2bcb95 = spawnstruct();
    var_85790f5a5b2bcb95.alias = alias;
    var_85790f5a5b2bcb95.play_origin = play_origin;
    var_85790f5a5b2bcb95.min_delay = min_delay;
    var_85790f5a5b2bcb95.max_delay = max_delay;
    var_85790f5a5b2bcb95.next_play_time = 0;
    var_85790f5a5b2bcb95.chance_to_play = chance_to_play;
    var_85790f5a5b2bcb95.max_player_distance = max_player_distance;
    if (isdefined(predelay)) {
        var_85790f5a5b2bcb95.next_play_time = gettime() + predelay * 1000;
    }
    level.ambient_sound_queue = array_add_safe(level.ambient_sound_queue, var_85790f5a5b2bcb95);
}

// Namespace namespace_cc8f563756534739 / scripts\cp\cp_music_and_dialog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bce
// Size: 0x1a1
function ambient_sound_queue() {
    while (true) {
        while (level.ambient_sound_queue.size == 0) {
            wait 1;
        }
        ambient_sound_queue = array_randomize(level.ambient_sound_queue);
        foreach (sound in ambient_sound_queue) {
            if (gettime() < sound.next_play_time) {
                continue;
            }
            pause_time = randomintrange(sound.min_delay, sound.max_delay + 1);
            chance_to_play = sound.chance_to_play;
            if (any_player_nearby(sound.play_origin, 4096)) {
                wait 1;
                continue;
            }
            var_1e1d3c697a810903 = any_player_nearby(sound.play_origin, sound.max_player_distance);
            if (!var_1e1d3c697a810903 || randomint(100) > chance_to_play) {
                wait 1;
                continue;
            }
            alias = sound.alias;
            if (isarray(sound.alias)) {
                alias = random(sound.alias);
            }
            if (soundexists(alias)) {
                playsoundatpos(sound.play_origin, alias);
            }
            sound.next_play_time = gettime() + pause_time * 1000;
            wait 1;
        }
        wait 1;
    }
}

