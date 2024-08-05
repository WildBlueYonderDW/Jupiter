#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_166b4f052da169a7;

#namespace vo;

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x262
// Size: 0x8d
function function_83b8144a47850cdd() {
    level.vo_priority_level = ["highest", "high", "medium", "low"];
    level.vo_alias_data = [];
    level.vo_categories = [];
    level.vo_category_last_played_time = [];
    level.vo_dialogue_prefix = [];
    level.vo_table = "cp/" + getdvar(@"ui_mapname") + "_vo_table.csv";
    level thread parse_vo_table();
    level thread nag_vo_handler();
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7
// Size: 0x1a
function function_36bcbfd3365dc368() {
    init_vo_system();
    thread start_vo_system();
    level thread game_ended_vo_watcher();
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x319
// Size: 0xbf
function init_vo_system() {
    vo_system = spawnstruct();
    vo_system.vo_currently_playing = undefined;
    vo_system.interrupt_vo = undefined;
    vo_system.is_playing = 0;
    vo_queue = [];
    if (isdefined(level.vo_priority_level)) {
        foreach (var_23118ee0bf20f77c in level.vo_priority_level) {
            vo_queue[var_23118ee0bf20f77c] = [];
        }
    }
    vo_system.vo_queue = vo_queue;
    self.vo_system = vo_system;
    flag_init("vo_system_busy");
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e0
// Size: 0x1dd
function parse_vo_table() {
    table = level.vo_table;
    row = 0;
    if (!tableexists(table)) {
        return;
    }
    while (true) {
        id = tablelookupbyrow(table, row, 0);
        if (id == "") {
            break;
        }
        alias_name = tablelookupbyrow(table, row, 1);
        cooldown = int(tablelookupbyrow(table, row, 2));
        chance_to_play = int(tablelookupbyrow(table, row, 3));
        max_plays = int(tablelookupbyrow(table, row, 4));
        category_1 = tablelookupbyrow(table, row, 5);
        category_2 = tablelookupbyrow(table, row, 6);
        waittillnotifyorflag = tablelookupbyrow(table, row, 7);
        dialogueprefix = tablelookupbyrow(table, row, 8);
        var_79ade81a56cbf98b = tablelookupbyrow(table, row, 9);
        onlylocal = int(tablelookupbyrow(table, row, 10));
        timeout = int(tablelookupbyrow(table, row, 11));
        priority = tablelookupbyrow(table, row, 12);
        var_4c576d2cfbdbe34 = int(tablelookupbyrow(table, row, 13));
        missingstub = tablelookupbyrow(table, row, 15);
        register_vo(id, alias_name, cooldown, chance_to_play, max_plays, category_1, category_2, waittillnotifyorflag, dialogueprefix, var_79ade81a56cbf98b, onlylocal, timeout, priority, var_4c576d2cfbdbe34, missingstub);
        if (row % 5 == 1) {
            wait 0.05;
        }
        row++;
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 15, eflags: 0x0
// Checksum 0x0, Offset: 0x5c5
// Size: 0x2f2
function register_vo(id, alias_name, cooldown, chance_to_play, max_plays, category_1, category_2, waittillnotifyorflag, dialogueprefix, nextdialogue, onlylocal, timeout, priority, pause_time, missingstub) {
    struct = spawnstruct();
    if (isdefined(cooldown) && cooldown > 0) {
        struct.cooldown = cooldown;
        struct.lastplayedtime = 0;
    }
    if (isdefined(missingstub)) {
        struct.missingstub = missingstub;
    }
    if (isdefined(pause_time) && pause_time > 0) {
        struct.pause_time = pause_time;
    }
    if (istrue(onlylocal)) {
        struct.onlylocal = 1;
    } else {
        struct.onlylocal = 0;
    }
    if (isdefined(timeout) && timeout > 0) {
        struct.timeout = timeout;
    }
    if (isdefined(priority)) {
        struct.priority = priority;
    }
    if (isdefined(max_plays) && max_plays > 0) {
        struct.max_plays = max_plays;
    }
    if (isdefined(chance_to_play) && chance_to_play > 0) {
        struct.chance_to_play = chance_to_play;
    }
    if (isdefined(waittillnotifyorflag) && waittillnotifyorflag != "") {
        struct.waittillnotifyorflag = waittillnotifyorflag;
    }
    if (isdefined(category_1) && category_1 != "") {
        if (!isdefined(level.vo_categories[category_1])) {
            level.vo_categories[category_1] = [];
        }
        struct.category_1 = category_1;
        level.vo_categories[category_1][level.vo_categories[category_1].size] = alias_name;
        if (!isdefined(level.vo_category_last_played_time[category_1])) {
            level.vo_category_last_played_time[category_1] = 0;
        }
    }
    if (isdefined(category_2) && category_2 != "") {
        if (!isdefined(level.vo_categories[category_2])) {
            level.vo_categories[category_2] = [];
        }
        struct.category_2 = category_2;
        level.vo_categories[category_2][level.vo_categories[category_2].size] = alias_name;
        if (!isdefined(level.vo_category_last_played_time[category_2])) {
            level.vo_category_last_played_time[category_2] = 0;
        }
    }
    if (isdefined(dialogueprefix) && dialogueprefix != "") {
        if (!isdefined(level.vo_dialogue_prefix[dialogueprefix])) {
            level.vo_dialogue_prefix[dialogueprefix] = [];
        }
        struct.dialogueprefix = dialogueprefix;
        level.vo_dialogue_prefix[alias_name] = dialogueprefix;
    }
    if (isdefined(nextdialogue) && nextdialogue != "") {
        struct.nextdialogue = nextdialogue;
    }
    level.vo_alias_data[alias_name] = struct;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8bf
// Size: 0x7d
function start_vo_system() {
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        if (is_vo_system_busy()) {
            if (flag_exist("vo_system_busy")) {
                flag_waitopen("vo_system_busy");
            }
        }
        var_2ef8438b8626c369 = get_vo_to_play();
        if (!isdefined(var_2ef8438b8626c369)) {
            set_vo_system_playing(0);
            self waittill("play_VO_system");
            if (is_vo_system_paused()) {
                self waittill("unpause_VO_system");
            }
            continue;
        }
        play_vo_system(var_2ef8438b8626c369);
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x944
// Size: 0x3a
function play_vo_system(var_2ef8438b8626c369) {
    self endon("disconnect");
    set_vo_system_playing(1);
    set_vo_currently_playing(var_2ef8438b8626c369);
    play_vo(var_2ef8438b8626c369);
    pause_between_vo(var_2ef8438b8626c369);
    unset_vo_currently_playing();
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x986
// Size: 0x81
function get_vo_to_play() {
    var_2ef8438b8626c369 = retrieve_interrupt_vo();
    if (isdefined(var_2ef8438b8626c369)) {
        return var_2ef8438b8626c369;
    }
    if (isdefined(level.vo_priority_level)) {
        foreach (var_23118ee0bf20f77c in level.vo_priority_level) {
            var_2ef8438b8626c369 = retrieve_vo_from_queue(var_23118ee0bf20f77c);
            if (isdefined(var_2ef8438b8626c369)) {
                return var_2ef8438b8626c369;
            }
        }
    }
    return undefined;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa10
// Size: 0x28
function retrieve_interrupt_vo() {
    interrupt_vo = self.vo_system.interrupt_vo;
    reset_interrupt_vo();
    return interrupt_vo;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa41
// Size: 0x15
function reset_interrupt_vo() {
    self.vo_system.interrupt_vo = undefined;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5e
// Size: 0x1a
function retrieve_vo_from_queue(priority) {
    remove_expired_vo_from_queue(priority);
    return pop_first_vo_out_of_queue(priority);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa81
// Size: 0xc2
function pop_first_vo_out_of_queue(priority) {
    var_bcdb765ea42a9545 = self.vo_system.vo_queue[priority][0];
    if (!isdefined(var_bcdb765ea42a9545)) {
        return var_bcdb765ea42a9545;
    }
    new_array = [];
    for (array_index = 1; array_index < self.vo_system.vo_queue[priority].size; array_index++) {
        if (!isdefined(self.vo_system.vo_queue[priority][array_index])) {
            break;
        }
        new_array[array_index - 1] = self.vo_system.vo_queue[priority][array_index];
    }
    self.vo_system.vo_queue[priority] = new_array;
    return var_bcdb765ea42a9545;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb4c
// Size: 0xdd
function remove_expired_vo_from_queue(priority) {
    current_time = gettime();
    new_array = [];
    foreach (vo_data in self.vo_system.vo_queue[priority]) {
        if (!vo_expired(vo_data, current_time)) {
            new_array[new_array.size] = self.vo_system.vo_queue[priority][array_index];
            continue;
        }
        println("<dev string:x1c>" + vo_data.alias + "<dev string:x36>");
    }
    self.vo_system.vo_queue[priority] = new_array;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc31
// Size: 0x20
function vo_expired(vo_data, current_time) {
    return current_time > vo_data.expire_time;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc5a
// Size: 0x39
function set_vo_system_playing(bool) {
    if (!isplayer(self) || !isdefined(self.vo_system)) {
        return;
    }
    self.vo_system.is_playing = bool;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9b
// Size: 0xc
function is_vo_system_paused() {
    return istrue(self.pause_vo_system);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb0
// Size: 0xd
function is_vo_system_busy() {
    return flag("vo_system_busy");
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc6
// Size: 0x34
function set_vo_system_busy(bool) {
    level.vo_system_busy = bool;
    if (!bool) {
        flag_clear("vo_system_busy");
        return;
    }
    flag_set("vo_system_busy");
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd02
// Size: 0x20
function set_vo_currently_playing(var_2ef8438b8626c369) {
    self.vo_system.vo_currently_playing = var_2ef8438b8626c369;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd2a
// Size: 0x43d
function game_ended_vo_watcher() {
    var_fcdd6de74efe1b44 = "";
    level waittill("game_ended");
    foreach (player in level.players) {
        foreach (var_23118ee0bf20f77c in level.vo_priority_level) {
            if (isdefined(player.vo_system.vo_queue[var_23118ee0bf20f77c]) && player.vo_system.vo_queue[var_23118ee0bf20f77c].size > 0) {
                foreach (vo_data in player.vo_system.vo_queue[var_23118ee0bf20f77c]) {
                    if (isdefined(vo_data)) {
                        if (soundexists(vo_data.alias)) {
                            player stoplocalsound(vo_data.alias);
                        }
                    }
                }
                player.vo_system.vo_queue[var_23118ee0bf20f77c] = [];
            }
        }
        if (isdefined(level.dialogue_arr) && level.dialogue_arr.size > 0) {
            foreach (alias in level.dialogue_arr) {
                if (issubstr(alias, "pg_")) {
                    player stoplocalsound(alias);
                }
                if (soundexists(player.vo_prefix + alias)) {
                    player stoplocalsound(player.vo_prefix + alias);
                }
                if (soundexists(player.vo_prefix + "plr_" + alias)) {
                    player stoplocalsound(player.vo_prefix + "plr_" + alias);
                }
            }
        }
        if (isdefined(player.current_vo_queue) && player.current_vo_queue.size > 0) {
            foreach (element in player.current_vo_queue) {
                if (isdefined(element)) {
                    if (soundexists(element)) {
                        player stoplocalsound(element);
                        continue;
                    }
                    if (soundexists(player.vo_prefix + element)) {
                        player stoplocalsound(player.vo_prefix + element);
                        continue;
                    }
                    if (soundexists(player.vo_prefix + "plr_" + element)) {
                        player stoplocalsound(player.vo_prefix + "plr_" + element);
                    }
                }
            }
        }
        if (!isdefined(player.vo_prefix)) {
            return;
        }
        switch (player.vo_prefix) {
        case #"hash_8a36186c5286bc5f": 
            var_fcdd6de74efe1b44 = "_valley_girl";
            break;
        case #"hash_8a33186c52847dc8": 
            var_fcdd6de74efe1b44 = "_nerd";
            break;
        case #"hash_8a30586c5282a3f1": 
            var_fcdd6de74efe1b44 = "_rapper";
            break;
        case #"hash_8a2d586c5280655a": 
            var_fcdd6de74efe1b44 = "_jock";
            break;
        case #"hash_8a2a186c527dc203": 
            var_fcdd6de74efe1b44 = "_jock";
            break;
        }
        var_aca2e0282cbd3cfe = "mus_zombies" + var_fcdd6de74efe1b44;
        if (soundexists(var_aca2e0282cbd3cfe)) {
            player stoplocalsound("mus_zombies" + var_fcdd6de74efe1b44);
        }
        var_aca2e0282cbd3cfe = "mus_zombies" + var_fcdd6de74efe1b44 + "_lsrs";
        if (soundexists(var_aca2e0282cbd3cfe)) {
            player stoplocalsound("mus_zombies" + var_fcdd6de74efe1b44 + "_lsrs");
        }
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116f
// Size: 0x2d5
function play_vo(var_2ef8438b8626c369) {
    self endon("interrupt_current_VO");
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    if (self.sessionstate != "playing") {
        return;
    }
    alias = var_2ef8438b8626c369.alias;
    if (!soundexists(alias)) {
        if (isdefined(level.vo_alias_data[alias]) && isdefined("level.vo_alias_data[alias].missingStub")) {
            /#
                iprintln(level.vo_alias_data[alias].missingstub);
            #/
        } else {
            /#
                iprintln("<dev string:x4b>" + alias);
            #/
        }
        wait 0.1;
        return;
    }
    self.vo_system_playing_vo = 1;
    if (is_playing_pain_breathing_sfx(self)) {
        var_bccc90d7df4fe4b7 = get_pain_breathing_sfx_alias(self);
        if (isdefined(var_bccc90d7df4fe4b7)) {
            self stoplocalsound(var_bccc90d7df4fe4b7);
        }
    }
    println("<dev string:x57>" + alias);
    if (isdefined(var_2ef8438b8626c369.basealias)) {
        var_e77296b7f0ba0679 = var_2ef8438b8626c369.basealias;
    } else {
        var_e77296b7f0ba0679 = alias;
    }
    foreach (player in level.players) {
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        if (isdefined(player.current_vo_queue)) {
            player.current_vo_queue = array_add(player.current_vo_queue, var_e77296b7f0ba0679);
        }
        if (player == self) {
            if (isdefined(level.get_alias_2d_func)) {
                var_c3ec9cd6da50d1b2 = [[ level.get_alias_2d_func ]](player, alias, var_e77296b7f0ba0679);
            } else {
                var_c3ec9cd6da50d1b2 = get_alias_2d_version(player, alias, var_e77296b7f0ba0679);
            }
            if (isdefined(var_c3ec9cd6da50d1b2)) {
                player playlocalsound_safe(var_c3ec9cd6da50d1b2);
            } else {
                player playlocalsound_safe(alias);
            }
            continue;
        }
        if (!istrue(var_2ef8438b8626c369.only_local) && soundexists(alias)) {
            self playsoundtoplayer(alias, player);
        }
    }
    foreach (category in var_2ef8438b8626c369.categories) {
        level.vo_category_last_played_time[category] = gettime();
    }
    if (!isdefined(self.num_of_plays[var_e77296b7f0ba0679])) {
        self.num_of_plays[var_e77296b7f0ba0679] = 1;
    } else {
        self.num_of_plays[var_e77296b7f0ba0679]++;
    }
    wait namespace_49f64a73fb8b35eb::get_sound_length(alias);
    self.vo_system_playing_vo = 0;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x144c
// Size: 0x2c
function alias_2d_version_exists(player, alias) {
    var_89ebbf7a77d639f9 = get_alias_2d_version(player, alias);
    return soundexists(var_89ebbf7a77d639f9);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1481
// Size: 0xa2
function get_alias_2d_version(player, alias, var_81ad18b8e83e126b) {
    var_f6f217ea2aa761f9 = strtok(alias, "_");
    if (var_f6f217ea2aa761f9[0] == "ww" || var_f6f217ea2aa761f9[0] == "dj" || var_f6f217ea2aa761f9[0] == "ks") {
        return alias;
    }
    if (isdefined(player.vo_prefix)) {
        var_635a078d549357e2 = player.vo_prefix + "plr_" + var_81ad18b8e83e126b;
    } else {
        var_635a078d549357e2 = "plr_" + var_81ad18b8e83e126b;
    }
    if (soundexists(var_635a078d549357e2)) {
        return var_635a078d549357e2;
    }
    return undefined;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x152b
// Size: 0xa7
function get_alias_3d_version(player, alias) {
    if (issubstr(alias, "ww_") || issubstr(alias, "dj_") || issubstr(alias, "p1_") || issubstr(alias, "p2_") || issubstr(alias, "p3_") || issubstr(alias, "p4_") || issubstr(alias, "jaroslav_anc")) {
        return alias;
    }
    var_d76b0a8e2967c78d = getsubstr(alias, player.vo_prefix.size);
    return player.vo_prefix + var_d76b0a8e2967c78d;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15db
// Size: 0x84
function get_sound_length(alias) {
    if (!soundexists(alias)) {
        return 0;
    }
    var_e9adc33e7669585 = lookupsoundlength(alias) / 1000 + 0.4;
    if (getdvarint(@"loc_language") != 0 && getdvarint(@"loc_language") != 1) {
        var_e9adc33e7669585 += 1.5;
    }
    var_86141e72c449a0f = get_length_from_table(alias);
    if (isdefined(var_86141e72c449a0f) && var_86141e72c449a0f != 0) {
        var_e9adc33e7669585 = var_86141e72c449a0f;
    }
    return var_e9adc33e7669585;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1668
// Size: 0x38
function pause_between_vo(var_2ef8438b8626c369) {
    if (is_vo_system_paused()) {
        self waittill("unpause_VO_system");
    }
    if (var_2ef8438b8626c369.pause_time > 0) {
        wait var_2ef8438b8626c369.pause_time;
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a8
// Size: 0x15
function unset_vo_currently_playing() {
    self.vo_system.vo_currently_playing = undefined;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x16c5
// Size: 0x177
function try_to_play_vo_on_team(alias, team, var_ec7e52b2773f5000, var_4a4111c81451ca93, var_e2ce4e21e9100cb9) {
    players = getplayersinteam(team);
    if (!isdefined(alias)) {
        return;
    }
    if (players.size <= 0) {
        return;
    }
    if (!istrue(var_ec7e52b2773f5000)) {
        level thread function_ae413ff331faa146(alias);
        if (isplayer(self) || self == level || !isent(self)) {
            foreach (player in players) {
                player thread play_cp_comment_vo(alias, "cp_comment_vo", "highest", 10, 0, 0, 1);
            }
        } else {
            thread scripts\cp\utility::playsoundatpos_safe(self.origin, alias);
        }
        wait namespace_49f64a73fb8b35eb::get_sound_length(alias);
        return;
    }
    var_ee94080f12348d8a = 45;
    if (isdefined(var_e2ce4e21e9100cb9)) {
        var_ee94080f12348d8a = var_e2ce4e21e9100cb9;
    }
    var_5b67f9f4c3a53fb3 = 60;
    if (isdefined(var_4a4111c81451ca93)) {
        var_5b67f9f4c3a53fb3 = var_4a4111c81451ca93;
    }
    foreach (player in players) {
        player thread namespace_49f64a73fb8b35eb::add_to_nag_vo(alias, "cp_comment_vo", var_5b67f9f4c3a53fb3, var_ee94080f12348d8a, 6, 1);
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1844
// Size: 0x3e
function function_ae413ff331faa146(alias) {
    level endon("game_ended");
    level notify("delayvoplaying");
    level endon("delayvoplaying");
    level.isteamvoplaying = 1;
    wait namespace_49f64a73fb8b35eb::get_sound_length(alias);
    level.isteamvoplaying = 0;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x188a
// Size: 0x9d
function try_to_play_vo_for_one_player(alias, player, var_ec7e52b2773f5000, var_4a4111c81451ca93, var_e2ce4e21e9100cb9) {
    if (!isdefined(alias)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    if (!istrue(var_ec7e52b2773f5000)) {
        player thread try_to_play_vo(alias, "cp_comment_vo", "highest", 10, 0, 0, 1, 100);
        return;
    }
    var_ee94080f12348d8a = 45;
    if (isdefined(var_e2ce4e21e9100cb9)) {
        var_ee94080f12348d8a = var_e2ce4e21e9100cb9;
    }
    var_5b67f9f4c3a53fb3 = 60;
    if (isdefined(var_4a4111c81451ca93)) {
        var_5b67f9f4c3a53fb3 = var_4a4111c81451ca93;
    }
    player thread namespace_49f64a73fb8b35eb::add_to_nag_vo(alias, "cp_comment_vo", var_5b67f9f4c3a53fb3, var_ee94080f12348d8a, 6, 1);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x192f
// Size: 0xee
function try_to_play_vo_on_all_players(alias, var_ec7e52b2773f5000) {
    if (!isdefined(alias)) {
        return;
    }
    if (!isdefined(level.players)) {
        return;
    }
    if (!istrue(var_ec7e52b2773f5000)) {
        foreach (player in level.players) {
            player thread try_to_play_vo(alias, "zmb_comment_vo", "highest", 10, 0, 0, 1, 100);
        }
        return;
    }
    foreach (player in level.players) {
        player thread namespace_49f64a73fb8b35eb::add_to_nag_vo(alias, "zmb_comment_vo", 60, 45, 6, 1);
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a25
// Size: 0x184
function function_775cd164c569e279(alias, player, priority) {
    level endon("game_ended");
    len = namespace_49f64a73fb8b35eb::get_sound_length(alias);
    waittime = gettime() + len + 3000;
    while (istrue(level.isteamvoplaying) && gettime() < waittime) {
        waitframe();
    }
    level.var_bfe5bb3ba83502e3 = 1;
    if (!isdefined(priority)) {
        priority = "high";
    }
    level.var_bfe5bb3ba83502e3 = 1;
    wait 0.1;
    if (isdefined(player)) {
        player.bcdisabled = 1;
        player namespace_49f64a73fb8b35eb::try_to_play_vo(alias, "cp_comment_vo", priority, 10, 0, 0, 1, 100);
        player.bcdisabled = undefined;
    } else {
        foreach (player in level.players) {
            player.bcdisabled = 1;
        }
        level namespace_49f64a73fb8b35eb::try_to_play_vo_on_team(alias, "allies");
        wait 0.1;
        foreach (player in level.players) {
            player.bcdisabled = undefined;
        }
    }
    level.var_bfe5bb3ba83502e3 = 0;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb1
// Size: 0x24b
function try_to_play_vo(var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local, chance_to_play) {
    var_c95bef4257b44781 = isdefined(level.vo_alias_data[var_d35946b8550701a5]);
    var_42547671df42d8db = ter_op(var_c95bef4257b44781, level.vo_alias_data[var_d35946b8550701a5], undefined);
    if (!isdefined(chance_to_play)) {
        if (var_c95bef4257b44781) {
            if (isdefined(var_42547671df42d8db.chance_to_play)) {
                chance_to_play = var_42547671df42d8db.chance_to_play;
            }
        } else {
            chance_to_play = 100;
        }
    }
    /#
        if (getdvarint(@"hash_2074ff36773f5d85", 0) != 0) {
            chance_to_play = 100;
        }
    #/
    if (randomint(100) > chance_to_play) {
        return;
    }
    if (should_play_vo(var_d35946b8550701a5)) {
        /#
            if (getdvarint(@"hash_1ff01a5d033f1ce0", 0) != 0 && istrue(interrupt)) {
                iprintln("<dev string:x80>" + var_d35946b8550701a5);
            }
        #/
        if (!isdefined(pause_time) && var_c95bef4257b44781 && isdefined(var_42547671df42d8db.pause_time)) {
            pause_time = var_42547671df42d8db.pause_time;
        }
        if (!isdefined(only_local) && var_c95bef4257b44781 && isdefined(var_42547671df42d8db.only_local)) {
            only_local = var_42547671df42d8db.onlylocal;
        }
        if (!isdefined(timeout) && var_c95bef4257b44781 && isdefined(var_42547671df42d8db.timeout)) {
            timeout = var_42547671df42d8db.timeout;
        }
        if (!isdefined(priority) && var_c95bef4257b44781 && isdefined(var_42547671df42d8db.priority)) {
            priority = var_42547671df42d8db.priority;
        }
        categories = get_categories_from_alias(var_d35946b8550701a5);
        foreach (category in categories) {
            level.vo_category_last_played_time[category] = gettime();
        }
        if (var_c95bef4257b44781 && isdefined(var_42547671df42d8db.lastplayedtime)) {
            var_42547671df42d8db.lastplayedtime = gettime();
        }
        thread add_to_vo_queue(var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local);
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e04
// Size: 0x244
function should_play_vo(var_d35946b8550701a5) {
    /#
        if (getdvarint(@"hash_2074ff36773f5d85", 0) != 0) {
            return 1;
        }
    #/
    if (!isdefined(level.vo_alias_data[var_d35946b8550701a5])) {
        return 1;
    }
    time = gettime();
    if (isdefined(level.vo_alias_data[var_d35946b8550701a5].cooldown) && isdefined(level.vo_alias_data[var_d35946b8550701a5].lastplayedtime)) {
        if (time < level.vo_alias_data[var_d35946b8550701a5].lastplayedtime + level.vo_alias_data[var_d35946b8550701a5].cooldown * 1000) {
            println("<dev string:x9a>" + var_d35946b8550701a5 + "<dev string:xaa>");
            return 0;
        }
    }
    categories = get_categories_from_alias(var_d35946b8550701a5);
    foreach (category in categories) {
        cooldown = ter_op(isdefined(level.vo_alias_data[var_d35946b8550701a5].cooldown), level.vo_alias_data[var_d35946b8550701a5].cooldown, 30);
        if (time < level.vo_category_last_played_time[category] + cooldown * 1000) {
            println("<dev string:xbc>" + category + "<dev string:xcf>" + var_d35946b8550701a5 + "<dev string:xe0>");
            return 0;
        }
    }
    if (isdefined(level.vo_alias_data[var_d35946b8550701a5].max_plays)) {
        if (!isdefined(self.num_of_plays)) {
            self.num_of_plays = [];
        }
        if (!isdefined(self.num_of_plays[var_d35946b8550701a5])) {
            self.num_of_plays[var_d35946b8550701a5] = 0;
        }
        if (self.num_of_plays[var_d35946b8550701a5] < level.vo_alias_data[var_d35946b8550701a5].max_plays) {
            return 1;
        } else {
            println("<dev string:xf3>" + var_d35946b8550701a5 + "<dev string:xfa>" + self.num_of_plays[var_d35946b8550701a5] + "<dev string:x12d>");
            return 0;
        }
        return;
    }
    return 1;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2050
// Size: 0x9c
function get_categories_from_alias(var_d35946b8550701a5) {
    if (!isdefined(level.vo_categories)) {
        return [];
    }
    keys = getarraykeys(level.vo_categories);
    temp_array = [];
    foreach (key in keys) {
        if (array_contains(level.vo_categories[key], var_d35946b8550701a5)) {
            temp_array[temp_array.size] = key;
        }
    }
    return temp_array;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x20f5
// Size: 0x183
function play_cp_comment_vo(var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local) {
    level endon("game_ended");
    level.announcer_vo_playing = 1;
    player_array = level.players;
    if (isplayer(self)) {
        player_array = [self];
    }
    foreach (player in player_array) {
        if (!isdefined(player)) {
            continue;
        }
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        /#
            println("<dev string:x132>" + var_d35946b8550701a5 + "<dev string:x155>");
            if (getdvarint(@"hash_1ff01a5d033f1ce0") == 1) {
                iprintlnbold("<dev string:x159>" + var_d35946b8550701a5);
            }
        #/
        var_2ef8438b8626c369 = namespace_49f64a73fb8b35eb::create_vo_data(var_d35946b8550701a5, timeout, pause_time, only_local);
        player thread namespace_49f64a73fb8b35eb::play_vo_system(var_2ef8438b8626c369);
    }
    wait namespace_49f64a73fb8b35eb::get_sound_length(var_d35946b8550701a5);
    foreach (player in player_array) {
        player set_vo_system_playing(0);
    }
    level.announcer_vo_playing = 0;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2280
// Size: 0xf0
function add_to_vo_queue(var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local) {
    if (isdefined(vo_type) && isdefined(level.vo_functions[vo_type])) {
        self thread [[ level.vo_functions[vo_type] ]](var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local);
        return;
    }
    if (isdefined(vo_type) && vo_type == "cp_comment_vo") {
        play_cp_comment_vo(var_d35946b8550701a5, vo_type, priority, timeout, interrupt, pause_time, only_local);
        return;
    }
    if (isplayer(self)) {
        if (isdefined(self.vo_prefix)) {
            alias = self.vo_prefix + var_d35946b8550701a5;
        } else {
            alias = var_d35946b8550701a5;
        }
        thread play_vo_on_player(alias, priority, timeout, interrupt, pause_time, only_local, var_d35946b8550701a5);
        return;
    }
    alias = var_d35946b8550701a5;
    level thread play_vo_on_all_players(alias, priority, timeout, interrupt, pause_time, only_local, var_d35946b8550701a5);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2378
// Size: 0xbc
function play_vo_on_all_players(alias, priority, timeout, interrupt, pause_time, only_local, basealias) {
    /#
        if (getdvarint(@"hash_1ff01a5d033f1ce0") == 1) {
            iprintlnbold("<dev string:x159>" + alias);
        }
    #/
    foreach (player in level.players) {
        player add_to_vo_system(alias, priority, timeout, interrupt, pause_time, only_local, basealias);
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x243c
// Size: 0x6f
function play_vo_on_player(alias, priority, timeout, interrupt, pause_time, only_local, basealias) {
    /#
        if (getdvarint(@"hash_1ff01a5d033f1ce0") == 1) {
            iprintlnbold("<dev string:x159>" + alias);
        }
    #/
    add_to_vo_system(alias, priority, timeout, interrupt, pause_time, only_local, basealias);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x24b3
// Size: 0x62
function add_to_vo_system(alias, priority, timeout, interrupt, pause_time, only_local, basealias) {
    if (!isdefined(self.current_vo_queue)) {
        self.current_vo_queue = [];
    }
    thread add_to_vo_system_internal(alias, priority, timeout, interrupt, pause_time, only_local, basealias);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x251d
// Size: 0xb2
function add_to_vo_system_internal(alias, priority, timeout, interrupt, pause_time, only_local, basealias) {
    priority = get_validated_priority(priority);
    println("<dev string:x174>" + alias + "<dev string:x195>");
    vo_data = create_vo_data(alias, timeout, pause_time, only_local, basealias);
    if (should_interrupt_vo_system(interrupt)) {
        add_to_interrupt_vo(vo_data);
        if (is_vo_system_playing()) {
            interrupt_current_vo();
        }
    } else {
        add_to_queue_at_priority(vo_data, priority);
    }
    if (!is_vo_system_playing()) {
        notify_system_to_grab_next_vo_from_queue();
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25d7
// Size: 0x4f
function get_validated_priority(priority) {
    if (!isdefined(priority)) {
        return level.vo_priority_level[level.vo_priority_level.size - 1];
    }
    assertex(scripts\engine\utility::array_contains(level.vo_priority_level, priority), "'" + priority + "' is not a valid priority level.");
    return priority;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x262f
// Size: 0xf7
function create_vo_data(alias, timeout, pause_time, only_local, basealias) {
    var_acf8c89042bd6d7a = 999;
    var_356385d16d2bfe7a = 1.5;
    var_2909ac11ec70c778 = 3;
    vo_data = spawnstruct();
    vo_data.alias = alias;
    vo_data.categories = get_categories_from_alias(alias);
    vo_data.basealias = basealias;
    if (!isdefined(timeout)) {
        timeout = var_acf8c89042bd6d7a;
    }
    vo_data.expire_time = gettime() + timeout * 1000;
    if (!isdefined(pause_time)) {
        pause_time = randomfloatrange(var_356385d16d2bfe7a, var_2909ac11ec70c778);
    }
    vo_data.pause_time = pause_time;
    if (istrue(only_local)) {
        vo_data.only_local = 1;
    } else {
        vo_data.only_local = 0;
    }
    return vo_data;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x272f
// Size: 0x12
function should_interrupt_vo_system(interrupt) {
    return isdefined(interrupt) && interrupt;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x274a
// Size: 0x20
function add_to_interrupt_vo(vo_data) {
    self.vo_system.interrupt_vo = vo_data;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2772
// Size: 0x16
function is_vo_system_playing() {
    return istrue(self.vo_system.is_playing);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2791
// Size: 0x28
function interrupt_current_vo() {
    var_1d8a79fc1b6b46cf = get_current_vo_alias();
    if (isdefined(var_1d8a79fc1b6b46cf)) {
        self stoplocalsound(var_1d8a79fc1b6b46cf);
    }
    self notify("interrupt_current_VO");
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c1
// Size: 0x66
function get_current_vo_alias() {
    if (isdefined(self.vo_system)) {
        if (isdefined(self.vo_system.vo_currently_playing)) {
            if (isdefined(self.vo_system.vo_currently_playing.alias)) {
                return self.vo_system.vo_currently_playing.alias;
            }
        }
    }
    return undefined;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2830
// Size: 0x41
function add_to_queue_at_priority(vo_data, priority) {
    self.vo_system.vo_queue[priority][self.vo_system.vo_queue[priority].size] = vo_data;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2879
// Size: 0xa
function notify_system_to_grab_next_vo_from_queue() {
    self notify("play_VO_system");
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x288b
// Size: 0xe2
function remove_vo_data(var_69b068fe56fdad37, priority) {
    new_array = [];
    foreach (vo_data in self.vo_system.vo_queue[priority]) {
        if (!(vo_data.alias == self.vo_prefix + var_69b068fe56fdad37 || vo_data.alias == self.vo_prefix + "plr_" + var_69b068fe56fdad37)) {
            new_array[new_array.size] = self.vo_system.vo_queue[priority][array_index];
        }
    }
    self.vo_system.vo_queue[priority] = new_array;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2975
// Size: 0x75
function pause_vo_system(player_list) {
    if (player_list.size == 1) {
        player_list[0].pause_vo_system = 1;
        return;
    }
    foreach (player in player_list) {
        player.pause_vo_system = 1;
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29f2
// Size: 0x99
function unpause_vo_system(player_list) {
    foreach (player in player_list) {
        player.pause_vo_system = 0;
    }
    foreach (player in player_list) {
        player notify("unpause_VO_system");
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a93
// Size: 0x1a8
function nag_vo_handler() {
    level endon("game_ended");
    if (!isdefined(level.nag_vo)) {
        level.nag_vo = [];
        level.nag_vo_never_play_again = [];
        level.pause_nag_vo = 0;
    }
    var_4a4111c81451ca93 = 60;
    while (true) {
        while (level.pause_nag_vo) {
            wait 0.1;
        }
        time = gettime();
        foreach (alias, var_380e909d074ff217 in level.nag_vo) {
            if (time > var_380e909d074ff217.next_play_time) {
                if (isdefined(var_380e909d074ff217.scope)) {
                    var_380e909d074ff217.scope try_to_play_vo(alias, var_380e909d074ff217.vo_type, "low", 3, 0, 0, var_380e909d074ff217.only_local);
                } else {
                    level try_to_play_vo(alias, var_380e909d074ff217.vo_type, "low", 3, 0, 0, var_380e909d074ff217.only_local);
                }
                var_380e909d074ff217.times_played++;
                if (var_380e909d074ff217.max_times != -1 && var_380e909d074ff217.max_times <= var_380e909d074ff217.times_played) {
                    remove_from_nag_vo(alias);
                }
                var_380e909d074ff217.next_play_time = time + var_380e909d074ff217.cooldown * min(var_380e909d074ff217.times_played, 3) * 1000;
                wait var_4a4111c81451ca93;
            }
        }
        wait 1;
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2c43
// Size: 0x177
function add_to_nag_vo(alias, vo_type, cooldown_time, var_1e486b6da797b22, max_times, only_local) {
    if (!isdefined(level.nag_vo)) {
        level.nag_vo = [];
        level.nag_vo_never_play_again = [];
        level.pause_nag_vo = 0;
    }
    if (isdefined(level.nag_vo[alias])) {
        return;
    }
    if (isdefined(level.nag_vo_never_play_again[alias])) {
        return;
    }
    if (!isdefined(cooldown_time)) {
        cooldown_time = 60;
    }
    if (!isdefined(vo_type)) {
        vo_type = "zmb_comment_vo";
    }
    var_824f2b2e30140569 = undefined;
    if (isplayer(self)) {
        var_824f2b2e30140569 = self;
    }
    var_a68342c9c3067ef7 = spawnstruct();
    var_a68342c9c3067ef7.times_played = 0;
    var_a68342c9c3067ef7.cooldown = cooldown_time;
    var_a68342c9c3067ef7.vo_type = vo_type;
    if (isdefined(var_824f2b2e30140569)) {
        var_a68342c9c3067ef7.scope = var_824f2b2e30140569;
    }
    if (isdefined(only_local)) {
        var_a68342c9c3067ef7.only_local = only_local;
    } else {
        var_a68342c9c3067ef7.only_local = 0;
    }
    if (isdefined(var_1e486b6da797b22)) {
        var_a68342c9c3067ef7.next_play_time = gettime() + var_1e486b6da797b22 * 1000;
    } else {
        var_a68342c9c3067ef7.next_play_time = 0;
    }
    if (isdefined(max_times)) {
        var_a68342c9c3067ef7.max_times = max_times;
    } else {
        var_a68342c9c3067ef7.max_times = -1;
    }
    level.nag_vo[alias] = var_a68342c9c3067ef7;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc2
// Size: 0x41
function remove_from_nag_vo(alias, var_8a46c5a3eb5e99be) {
    level.nag_vo = array_remove_index(level.nag_vo, alias, 1);
    if (istrue(var_8a46c5a3eb5e99be)) {
        level.nag_vo_never_play_again[alias] = 1;
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e0b
// Size: 0x34
function get_length_from_table(alias) {
    len = tablelookup("cp/cp_vo_lookup.csv", 0, alias, 1);
    if (isdefined(len)) {
        len = float(len);
        return len;
    }
    return undefined;
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2e48
// Size: 0xd4
function function_929bb46251e5e4f2(pingindex, pingtype, var_3ef0fdcee94cadff, var_c1074ab6cac2169f) {
    if (function_c648f0fd527e089a(pingtype)) {
        return;
    }
    if (function_d3789a9a4be5df2e(pingtype)) {
        ent = self calloutmarkerping_getent(pingindex);
        if (isdefined(ent)) {
            if (_calloutmarkerping_isenemy(ent, self)) {
                function_5f2cbfbab811d7a4(pingindex, pingtype, var_3ef0fdcee94cadff, var_c1074ab6cac2169f, ent);
            } else if (!isplayer(ent)) {
                level notify("player_pinged_object", self, ent, pingindex);
            }
        }
        return;
    }
    if (function_74ec310d8f99b6e2(pingtype)) {
        return;
    }
    switch (pingtype) {
    case 6: 
        break;
    case 5: 
        break;
    case 2: 
        break;
    case 4: 
        break;
    }
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2f24
// Size: 0x36
function function_5f2cbfbab811d7a4(pingindex, pingtype, var_3ef0fdcee94cadff, var_c1074ab6cac2169f, ent) {
    level notify("player_pinged_enemy", self, ent, pingindex);
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f62
// Size: 0x54
function function_6de0ba6c3c3b7e34(alias) {
    if (!flag_exist("overlord_vo_cleared")) {
        flag_init("overlord_vo_cleared");
    }
    flag_clear("overlord_vo_cleared");
    var_4ab28bc6d5ad3d7a = lookupsoundlength(alias) / 1000;
    wait var_4ab28bc6d5ad3d7a;
    flag_set("overlord_vo_cleared");
}

// Namespace vo / namespace_49f64a73fb8b35eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbe
// Size: 0x27
function function_e4f581fd683684a5() {
    wait 0.05;
    if (istrue(level.var_bfe5bb3ba83502e3)) {
        flag_wait("overlord_vo_cleared");
    }
    wait 0.05;
}

