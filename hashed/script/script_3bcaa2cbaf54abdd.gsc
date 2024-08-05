#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\perks\cp_perk_utility.gsc;
#using script_3f8889c16399185c;
#using script_66122a002aff5d57;
#using script_187a04151c40fb72;
#using script_41ae4f5ca24216cb;
#using script_467f0fdfdd155a45;
#using scripts\cp\cp_merits.gsc;
#using scripts\cp\cp_analytics.gsc;

#namespace persistence;

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4db
// Size: 0x17
function get_player_munition_currency() {
    return self getplayerdata("cp", "coopCareerStats", "currency");
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fb
// Size: 0x2e
function get_player_currency() {
    if (isdefined(self.plundercount)) {
        return self.plundercount;
    }
    return self getplayerdata("cp", "alienSession", "currency");
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x532
// Size: 0xb
function get_player_max_currency() {
    return self.maxcurrency;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x546
// Size: 0xa
function take_all_currency() {
    set_player_currency(0);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x558
// Size: 0x3c
function get_starting_currency() {
    var_c7a775ac491b210f = getdvarint(@"hash_66d046d1cfe3ecc9", 0);
    if (var_c7a775ac491b210f != 0) {
        return var_c7a775ac491b210f;
    }
    if (isdefined(level.starting_currency)) {
        return level.starting_currency;
    }
    return 0;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59d
// Size: 0x27
function wait_to_set_player_currency(amount) {
    self endon("disconnect");
    level endon("game_ended");
    wait 3;
    set_player_currency(amount);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc
// Size: 0x27
function set_player_munition_currency(amount) {
    self setplayerdata("cp", "coopCareerStats", "currency", int(amount));
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fb
// Size: 0x3d
function function_5d7c28c83d8da818(var_6b05369a767e9dbc) {
    var_8334742fe1363a27 = get_player_currency();
    var_98afd1ce36f4905a = int(max(0, var_8334742fe1363a27 + var_6b05369a767e9dbc));
    set_player_currency(var_98afd1ce36f4905a);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x640
// Size: 0x5a
function set_player_currency(amount, var_8e67a20d8e88db4d) {
    self.plundercount = amount;
    if (!istrue(var_8e67a20d8e88db4d)) {
        namespace_6250b14b3f614101::function_46ee9182cf6872d5(amount);
    }
    self setplayerdata("cp", "alienSession", "currency", int(amount));
    eog_player_update_stat("currency", int(amount), 1);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x6a2
// Size: 0x2e2
function give_player_currency(amount, font_size, shitloc, var_4a46dc3f73a35cb, give_type, var_1e921a3666f3d7ec) {
    if (isdefined(level.gametype) && level.gametype == "dungeons") {
        return;
    }
    if (!isplayer(self)) {
        return;
    }
    assert(amount >= 0);
    if (isdefined(level.currency_scale_func)) {
        amount = [[ level.currency_scale_func ]](self, amount);
    }
    var_8334742fe1363a27 = get_player_currency();
    var_b4187ec006e2d1e2 = get_player_max_currency();
    var_98afd1ce36f4905a = var_8334742fe1363a27 + amount;
    if (!isdefined(var_b4187ec006e2d1e2)) {
        assertmsg("give_player_currency is trying to give currency but player(" + self getentitynumber() + ").maxCurrency is undefined");
        var_b4187ec006e2d1e2 = 0;
    }
    var_98afd1ce36f4905a = min(var_98afd1ce36f4905a, var_b4187ec006e2d1e2);
    if (!isdefined(self.total_currency_earned)) {
        self.total_currency_earned = amount;
    }
    if (is_valid_give_type(give_type)) {
        self.total_currency_earned += var_98afd1ce36f4905a - var_8334742fe1363a27;
        self notify("consumable_charge", amount * 0.5);
    }
    level notify("currency_changed");
    eog_player_update_stat("currencytotal", int(self.total_currency_earned), 1);
    if (function_f993f83a21fc44b2() && getdvarint(@"hash_d4ed36d1f90ca352", 0) && (!isdefined(give_type) || give_type == "debug")) {
        set_player_currency(var_98afd1ce36f4905a);
        thread namespace_5aac85eab99c40a::scorepointspopup(amount, 1);
    } else if (function_f993f83a21fc44b2() && getdvarint(@"hash_d4ed36d1f90ca352", 0) && isdefined(give_type) && give_type == "bounty") {
        set_player_currency(var_98afd1ce36f4905a);
        thread namespace_6099285b4066f63b::doScoreEvent(#"bounty", undefined, amount);
    } else if (is_wave_gametype() || isdefined(give_type) && give_type == "cash_pickup") {
        if (!istrue(level.var_8fde5731bb1ba3bb) || isdefined(give_type) && give_type == "cash_pickup") {
            set_player_currency(var_98afd1ce36f4905a);
        }
        thread namespace_5aac85eab99c40a::scorepointspopup(amount, 1);
    } else {
        return;
    }
    if (isdefined(level.update_money_performance)) {
        [[ level.update_money_performance ]](self, amount);
    }
    current_time = gettime();
    if (var_98afd1ce36f4905a >= var_b4187ec006e2d1e2) {
        if (!isdefined(self.next_maxmoney_hint_time)) {
            self.next_maxmoney_hint_time = current_time + 30000;
        } else if (current_time < self.next_maxmoney_hint_time) {
            return;
        }
        if (!level.gameended) {
            setlowermessage("maxmoney", %COOP_GAME_PLAY/MONEY_MAX, 4);
            self.next_maxmoney_hint_time = current_time + 30000;
        }
    }
    if (is_valid_give_type(give_type)) {
        thread add_to_notify_queue("player_earned_money", amount);
    }
    self notify("currency_earned", amount);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98c
// Size: 0x15
function is_valid_give_type(give_type) {
    if (!isdefined(give_type)) {
        return true;
    }
    return true;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9ad
// Size: 0x71
function take_player_currency(amount, var_268300d5f447c80c, var_e42f7eb456b932f2, weapon_ref) {
    assert(amount >= 0);
    var_8334742fe1363a27 = get_player_currency();
    var_98afd1ce36f4905a = max(0, var_8334742fe1363a27 - amount);
    var_d5cea5c370608022 = int(var_8334742fe1363a27 - var_98afd1ce36f4905a);
    set_player_currency(var_98afd1ce36f4905a);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa26
// Size: 0x71
function player_has_enough_currency(amount, spend_type) {
    assert(amount >= 0);
    if (!isdefined(spend_type) || isdefined(spend_type) && spend_type != "atm" && spend_type != "laststand" && spend_type != "bleedoutPenalty") {
        if (is_consumable_active("next_purchase_free")) {
            amount = 0;
        }
    }
    currency = get_player_currency();
    return currency >= amount;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa0
// Size: 0x25
function try_take_player_currency(amount) {
    if (player_has_enough_currency(amount)) {
        take_player_currency(amount);
        return 1;
    }
    return 0;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacd
// Size: 0x1c
function player_persistence_init() {
    level.zombie_xp = undefined;
    set_player_session_xp(0);
    set_player_session_rankup(0);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xaf1
// Size: 0x142
function setcoopplayerdata_for_everyone(param0, param1, param2, param3, param4) {
    foreach (player in level.players) {
        if (isdefined(param0) && isdefined(param1) && isdefined(param2) && isdefined(param3) && isdefined(param4)) {
            player setplayerdata("cp", param0, param1, param2, param3, param4);
            continue;
        }
        if (isdefined(param0) && isdefined(param1) && isdefined(param2) && isdefined(param3) && !isdefined(param4)) {
            player setplayerdata("cp", param0, param1, param2, param3);
            continue;
        }
        if (isdefined(param0) && isdefined(param1) && isdefined(param2) && !isdefined(param3) && !isdefined(param4)) {
            player setplayerdata("cp", param0, param1, param2);
            continue;
        }
        if (isdefined(param0) && isdefined(param1) && !isdefined(param2) && !isdefined(param3) && !isdefined(param4)) {
            player setplayerdata("cp", param0, param1);
        }
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3b
// Size: 0x18
function session_stats_init() {
    parse_eog_tracking_table();
    eog_setup_track_items();
    thread eog_player_tracking_init();
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc5b
// Size: 0x69
function parse_eog_tracking_table() {
    level.eogtracking = [];
    table = "cp/cp_eog_tracking_types.csv";
    for (row = 0; true; row++) {
        index = tablelookupbyrow(table, row, 0);
        if (index == "") {
            break;
        }
        level.eogtracking[row] = tablelookup(table, 0, row, 1);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xccc
// Size: 0x37f
function eog_player_tracking_init() {
    self endon("disconnect");
    wait 0.5;
    entity_num = self getentitynumber();
    player_name = "unknownPlayer";
    if (isdefined(self.name)) {
        player_name = self.name;
    }
    if (self isconsoleplayer()) {
        if (have_clan_tag(player_name)) {
            player_name = remove_clan_tag(player_name);
        }
    }
    numplayers = 8;
    for (i = 0; i < numplayers; i++) {
        self setplayerdata("cp", "EoGPlayer", i, "connected", 0);
    }
    foreach (player in level.players) {
        /#
            if (getdvarint(@"hash_b4f399ba2ad6131f") == 1) {
                iprintln("<dev string:x1c>" + entity_num + "<dev string:x33>" + "<dev string:x41>" + player getentitynumber());
            }
        #/
        player reset_eog_stats(entity_num);
        player setplayerdata("cp", "EoGPlayer", entity_num, "connected", 1);
        player setplayerdata("cp", "EoGPlayer", entity_num, "name", player_name);
        player setplayerdata("common", "round", "totalXp", 0);
    }
    var_f8335a1c04fb409f = [0, 0, 0, 0];
    foreach (p in level.players) {
        var_35162790aacfaf47 = p getentitynumber();
        var_f8335a1c04fb409f[int(var_35162790aacfaf47)] = 1;
        if (p == self) {
            continue;
        }
        entity_num = p getentitynumber();
        connected = p getplayerdata("cp", "EoGPlayer", entity_num, "connected");
        self setplayerdata("cp", "EoGPlayer", entity_num, "connected", connected);
        /#
            if (getdvarint(@"hash_25d628943cd6ea20") == 1) {
                iprintln("<dev string:x4a>" + self getentitynumber() + "<dev string:x5f>" + entity_num);
            }
        #/
        for (i = 0; i < level.eogtracking.size; i++) {
            value = p getplayerdata("cp", "EoGPlayer", entity_num, level.eogtracking[i]);
            if (level.eogtracking[i] != "currency") {
                self setplayerdata("cp", "EoGPlayer", entity_num, level.eogtracking[i], value);
            }
        }
    }
    foreach (index, result in var_f8335a1c04fb409f) {
        if (!result) {
            /#
                if (getdvarint(@"hash_25d628943cd6ea20") == 1) {
                    iprintln("<dev string:x4a>" + self getentitynumber() + "<dev string:x72>" + index);
                }
            #/
            reset_eog_stats(index);
        }
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1053
// Size: 0xdf
function reset_eog_stats(clientnum) {
    for (i = 0; i < level.eogtracking.size; i++) {
        if (level.eogtracking[i] == "name") {
            self setplayerdata("cp", "EoGPlayer", clientnum, level.eogtracking[i], "");
            continue;
        }
        value = 0;
        if (isdefined(self.pers["counting_stats"]) && isdefined(self.pers["counting_stats"][level.eogtracking[i]])) {
            value = self.pers["counting_stats"][level.eogtracking[i]];
        }
        self setplayerdata("cp", "EoGPlayer", clientnum, level.eogtracking[i], value);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x113a
// Size: 0xa7
function eog_setup_track_items() {
    if (!isdefined(level.eogscoreboard)) {
        level.eogscoreboard = ["currency", "kills", "headShots", "downs", "revives"];
    }
    clear_eog_tracking_types();
    for (i = 0; i < level.eogscoreboard.size; i++) {
        idx = int(get_eog_tracking_idx(level.eogscoreboard[i]));
        self setplayerdata("cp", "CPSession", "eogTrackingIdx", i, idx);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e9
// Size: 0x34
function clear_eog_tracking_types() {
    for (i = 0; i < 7; i++) {
        self setplayerdata("cp", "CPSession", "eogTrackingIdx", i, 99);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1225
// Size: 0x19
function get_eog_tracking_idx(ref) {
    return tablelookup("cp/cp_eog_tracking_types.csv", 1, ref, 0);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1247
// Size: 0x39
function eog_update_on_player_disconnect(var_2421296ba8ccb5ee) {
    if (namespace_1d99ddaf3fc03543::gamealreadyended()) {
        return;
    }
    entity_num = var_2421296ba8ccb5ee getentitynumber();
    setcoopplayerdata_for_everyone("EoGPlayer", entity_num, "connected", 0);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1288
// Size: 0x9f
function eog_player_update_stat(var_6bd45b7708ce4099, amount, var_9e3067e82ad0cae3) {
    entity_num = self getentitynumber();
    var_98afd1ce36f4905a = amount;
    if (!isdefined(var_9e3067e82ad0cae3) || !var_9e3067e82ad0cae3) {
        var_cec495acc42b7073 = self getplayerdata("cp", "EoGPlayer", entity_num, var_6bd45b7708ce4099);
        var_98afd1ce36f4905a = int(var_cec495acc42b7073) + int(amount);
    }
    try_update_lb_playerdata(var_6bd45b7708ce4099, var_98afd1ce36f4905a, 1);
    setcoopplayerdata_for_everyone("EoGPlayer", entity_num, var_6bd45b7708ce4099, var_98afd1ce36f4905a);
    if (isdefined(level.eogscoringtable)) {
        update_eog_totals_for_stat_ref(var_6bd45b7708ce4099, var_98afd1ce36f4905a);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x132f
// Size: 0x3a
function function_c0480dc3a45ef6(var_6bd45b7708ce4099) {
    entity_num = self getentitynumber();
    return_value = self getplayerdata("cp", "EoGPlayer", entity_num, var_6bd45b7708ce4099);
    return return_value;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1372
// Size: 0x65
function update_eog_totals_for_stat_ref(var_6bd45b7708ce4099, amount) {
    for (i = 0; i < level.eogscoringtable.size; i++) {
        if (level.eogscoringtable[i].ref == var_6bd45b7708ce4099) {
            level.eogscoringtable[i].curamount = amount;
        }
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13df
// Size: 0x3d
function try_update_lb_playerdata(var_7b71a32fa025f6e0, var_98afd1ce36f4905a, var_9e3067e82ad0cae3) {
    var_d5755432fbfacdbd = get_mapped_lb_ref_from_eog_ref(var_7b71a32fa025f6e0);
    if (!isdefined(var_d5755432fbfacdbd)) {
        return;
    }
    lb_player_update_stat(var_d5755432fbfacdbd, var_98afd1ce36f4905a, var_9e3067e82ad0cae3);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1424
// Size: 0xd
function enable_leaderboard() {
    level.leaderboard_enabled = 1;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1439
// Size: 0x55
function increment_player_career_total_waves(player) {
    if (isdefined(player.wave_num_when_joined)) {
        increment_zombiecareerstats(player, "Total_Waves", level.wave_num - player.wave_num_when_joined);
        return;
    }
    increment_zombiecareerstats(player, "Total_Waves", level.wave_num);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1496
// Size: 0x23
function increment_player_career_total_score(player) {
    increment_zombiecareerstats(player, "Total_Score", player.score_earned);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14c1
// Size: 0x63
function lb_player_update_stat(var_218835b4b69dbd26, amount, var_9e3067e82ad0cae3) {
    if (istrue(var_9e3067e82ad0cae3)) {
        new_value = amount;
    } else {
        old_value = self getplayerdata("cp", "alienSession", var_218835b4b69dbd26);
        new_value = old_value + amount;
    }
    self setplayerdata("cp", "alienSession", var_218835b4b69dbd26, new_value);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x152c
// Size: 0x1c8
function rank_init() {
    ranktablebundle = function_766b80da1f882fc3();
    level.zombie_ranks = [];
    level.zombie_max_rank = ranktablebundle.maxrank;
    assertex(isdefined(level.zombie_max_rank) && level.zombie_max_rank);
    for (i = 0; i <= level.zombie_max_rank; i++) {
        var_1a9b1fc7643483dc = getrankbundle(ranktablebundle.ranklist[i].rank);
        if (!isdefined(level.zombie_ranks[i])) {
            rank = spawnstruct();
            rank.id = i;
            rank.lvl = var_1a9b1fc7643483dc.ingamerank;
            rank.xp = [];
            rank.xp["min"] = var_1a9b1fc7643483dc.minxp;
            rank.xp["next"] = var_1a9b1fc7643483dc.xptonext;
            rank.xp["max"] = var_1a9b1fc7643483dc.maxxp;
            rank.name = [];
            rank.name["short"] = var_1a9b1fc7643483dc.var_f2837d47b0aa16e8;
            rank.name["full"] = var_1a9b1fc7643483dc.var_bc23bd04c0a75755;
            rank.name["ingame"] = var_1a9b1fc7643483dc.var_7118a72fe332609d;
            rank.splash = var_1a9b1fc7643483dc.splash;
            level.zombie_ranks[i] = rank;
        }
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16fc
// Size: 0x20
function get_splash_by_id(id) {
    return level.zombie_ranks[id].splash;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1725
// Size: 0x1c
function get_player_rank() {
    return self getplayerdata("cp", "progression", "playerLevel", "rank");
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x174a
// Size: 0x1c
function get_player_xp() {
    return self getplayerdata("cp", "progression", "playerLevel", "xp");
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x176f
// Size: 0x17
function get_player_session_xp() {
    return self getplayerdata("cp", "alienSession", "experience");
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x178f
// Size: 0x22
function set_player_session_xp(experience) {
    self setplayerdata("cp", "alienSession", "experience", experience);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17b9
// Size: 0x32
function give_player_session_xp(amount) {
    var_14df04841b1b0b82 = get_player_session_xp();
    var_212f891deb05826f = amount + var_14df04841b1b0b82;
    set_player_session_xp(var_212f891deb05826f);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17f3
// Size: 0x27
function set_player_session_rankup(var_bcc31a3789b5b577) {
    self setplayerdata("cp", "alienSession", "ranked_up", int(var_bcc31a3789b5b577));
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1822
// Size: 0x17
function get_player_session_rankup() {
    return self getplayerdata("cp", "alienSession", "ranked_up");
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1842
// Size: 0x3b
function update_player_session_rankup(var_bcc31a3789b5b577) {
    if (!isdefined(var_bcc31a3789b5b577)) {
        var_bcc31a3789b5b577 = 1;
    }
    var_fe4aaed2e4a534d9 = get_player_session_rankup();
    var_e1709efacf76886 = var_bcc31a3789b5b577 + var_fe4aaed2e4a534d9;
    set_player_session_rankup(var_e1709efacf76886);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1885
// Size: 0x27
function set_player_rank(rank) {
    self setplayerdata("cp", "progression", "playerLevel", "rank", rank);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18b4
// Size: 0x53
function set_player_xp(xp) {
    self setplayerdata("cp", "progression", "playerLevel", "xp", xp);
    if (isdefined(self.totalxpearned)) {
        self setplayerdata("common", "round", "totalXp", self.totalxpearned);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x190f
// Size: 0x5f
function set_player_prestige(prestige) {
    self setplayerdata("cp", "progression", "playerLevel", "prestige", prestige);
    self setplayerdata("cp", "progression", "playerLevel", "xp", 0);
    self setplayerdata("cp", "progression", "playerLevel", "rank", 0);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1976
// Size: 0xd2
function get_rank_by_xp(xp) {
    rank = 0;
    if (xp >= level.zombie_ranks[level.zombie_max_rank].xp["max"]) {
        return level.zombie_max_rank;
    }
    if (isdefined(level.zombie_ranks)) {
        for (i = 0; i < level.zombie_ranks.size; i++) {
            if (xp >= level.zombie_ranks[i].xp["min"]) {
                if (xp < level.zombie_ranks[i].xp["max"]) {
                    rank = level.zombie_ranks[i].id;
                    break;
                }
            }
        }
    }
    return rank;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a51
// Size: 0x29
function get_scaled_xp(player, xp) {
    return int(xp * get_level_xp_scale(player) * get_weapon_passive_xp_scale(player));
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a83
// Size: 0x2c
function get_level_xp_scale(player) {
    if (isdefined(player.xpscale)) {
        return player.xpscale;
    }
    return 1;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab7
// Size: 0x49
function get_weapon_passive_xp_scale(player) {
    if (isdefined(player.weapon_passive_xp_multiplier) && istrue(player.kill_with_extra_xp_passive)) {
        player.kill_with_extra_xp_passive = 0;
        return player.weapon_passive_xp_multiplier;
    }
    return 1;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b08
// Size: 0x1a0
function give_player_xp(xp, display) {
    xp = get_scaled_xp(self, xp);
    if (isdefined(self.totalxpearned)) {
        self.totalxpearned += xp;
    }
    thread give_player_session_xp(xp);
    var_8d8b9714bd8cf0e0 = 0;
    var_f5c2afa38c91f575 = get_player_rank();
    var_510e99bb3be09f77 = get_player_xp();
    var_9fa0365ab7bbe59e = var_510e99bb3be09f77 + xp;
    /#
        if (getdvarint(@"hash_3f0687e1f394289") == 1) {
            iprintln("<dev string:x83>" + xp + "<dev string:x85>" + var_9fa0365ab7bbe59e + "<dev string:x8a>");
        }
    #/
    set_player_xp(var_9fa0365ab7bbe59e);
    if (istrue(display) && xp > 0 && !is_wave_gametype()) {
        self setclientomnvar("zom_xp_reward", xp);
        self setclientomnvar("zom_xp_notify", gettime());
    }
    var_491e3024dc27dde0 = get_rank_by_xp(var_9fa0365ab7bbe59e);
    if (var_491e3024dc27dde0 > var_f5c2afa38c91f575) {
        if (var_491e3024dc27dde0 == level.zombie_max_rank + 1) {
            var_8d8b9714bd8cf0e0 = 1;
        }
        set_player_rank(var_491e3024dc27dde0);
        if (var_8d8b9714bd8cf0e0 == 0) {
            var_eca9164292a71214 = var_491e3024dc27dde0 + 1;
            splashref = get_splash_by_id(var_491e3024dc27dde0);
            self notify("ranked_up", var_491e3024dc27dde0);
            update_player_session_rankup();
            /#
                if (getdvarint(@"hash_3f0687e1f394289") == 1) {
                    iprintlnbold("<dev string:x8c>" + var_491e3024dc27dde0 + "<dev string:x9b>" + var_9fa0365ab7bbe59e + "<dev string:x8a>");
                }
            #/
        }
        process_rank_merits(var_491e3024dc27dde0);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb0
// Size: 0xc2
function process_rank_merits(rank) {
    scripts\cp\cp_merits::processmerit("mt_prestige_1");
    if (rank >= 40) {
        scripts\cp\cp_merits::processmerit("mt_prestige_2");
    }
    if (rank >= 60) {
        scripts\cp\cp_merits::processmerit("mt_prestige_3");
    }
    if (rank >= 80) {
        scripts\cp\cp_merits::processmerit("mt_prestige_4");
    }
    if (rank >= 100) {
        scripts\cp\cp_merits::processmerit("mt_prestige_5");
    }
    if (rank >= 120) {
        scripts\cp\cp_merits::processmerit("mt_prestige_6");
    }
    if (rank >= 140) {
        scripts\cp\cp_merits::processmerit("mt_prestige_7");
    }
    if (rank >= 160) {
        scripts\cp\cp_merits::processmerit("mt_prestige_8");
    }
    if (rank >= 180) {
        scripts\cp\cp_merits::processmerit("mt_prestige_9");
    }
    if (rank >= 200) {
        scripts\cp\cp_merits::processmerit("mt_prestige_10");
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d7a
// Size: 0x25
function have_clan_tag(player_name) {
    return issubstr(player_name, "[") && issubstr(player_name, "]");
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1da8
// Size: 0x25
function remove_clan_tag(player_name) {
    var_da6c08cd3d3bf1d6 = strtok(player_name, "]");
    return var_da6c08cd3d3bf1d6[1];
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd6
// Size: 0xa3
function register_eog_to_lb_playerdata_mapping() {
    var_ed47df0b615478af = [];
    eog_to_lb_playerdata_mapping["kills"] = "kills";
    eog_to_lb_playerdata_mapping["deployables"] = "deployables";
    eog_to_lb_playerdata_mapping["drillplants"] = "drillPlants";
    eog_to_lb_playerdata_mapping["revives"] = "revives";
    eog_to_lb_playerdata_mapping["downs"] = "downed";
    eog_to_lb_playerdata_mapping["drillrestarts"] = "repairs";
    eog_to_lb_playerdata_mapping["score"] = "score";
    eog_to_lb_playerdata_mapping["currencyspent"] = "currencySpent";
    eog_to_lb_playerdata_mapping["currencytotal"] = "currencyTotal";
    eog_to_lb_playerdata_mapping["waveNum"] = "waveNum";
    level.eog_to_lb_playerdata_mapping = eog_to_lb_playerdata_mapping;
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e81
// Size: 0x16
function get_mapped_lb_ref_from_eog_ref(var_7b71a32fa025f6e0) {
    return level.eog_to_lb_playerdata_mapping[var_7b71a32fa025f6e0];
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea0
// Size: 0x9e
function record_player_kills(sweapon, shitloc, smeansofdeath, player) {
    if (isheadshot(sweapon, shitloc, smeansofdeath, player)) {
        increment_player_career_headshot_kills(player);
        player eog_player_update_stat("headShots", 1);
    }
    player increment_player_career_kills(player);
    player eog_player_update_stat("kills", 1);
    player scripts\cp\cp_analytics::log_event("zombie_death", 1, [player.clientid], [player.clientid], [player.clientid]);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f46
// Size: 0x1a
function increment_player_career_shots_fired(player) {
    increment_zombiecareerstats(player, "Shots_Fired", 1);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f68
// Size: 0x48
function increment_player_career_downs(player) {
    player increment_zombiecareerstats(player, "Downs", 1);
    if (should_update_leaderboard_stats()) {
        updateleaderboardstats(player, "Downs", 1, level.script, level.players.size, 1);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb8
// Size: 0x47
function increment_player_career_kills(player) {
    increment_zombiecareerstats(player, "Kills", 1);
    if (should_update_leaderboard_stats()) {
        updateleaderboardstats(player, "Kills", 1, level.script, level.players.size, 1);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2007
// Size: 0x48
function increment_player_career_headshot_kills(player) {
    player increment_zombiecareerstats(player, "Headshot_Kills", 1);
    if (should_update_leaderboard_stats()) {
        updateleaderboardstats(player, "Headshots", 1, level.script, level.players.size, 1);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2057
// Size: 0x48
function increment_player_career_revives(player) {
    player increment_zombiecareerstats(player, "Revives", 1);
    if (should_update_leaderboard_stats()) {
        updateleaderboardstats(player, "Revives", 1, level.script, level.players.size, 1);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20a7
// Size: 0xc
function should_update_leaderboard_stats() {
    return istrue(level.leaderboard_enabled);
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x20bc
// Size: 0x64
function update_player_career_highest_wave(player, var_5675a729bbd6aa36, var_de7821bc51ab43a0) {
    if (is_wave_gametype()) {
        updateifgreaterthan_zombiecareerstats(player, "Highest_Wave", var_5675a729bbd6aa36);
        check_and_update_best_stats(player, var_5675a729bbd6aa36, "Highest_Wave", level.script, var_de7821bc51ab43a0);
        updateleaderboardstats(player, "Rounds", var_5675a729bbd6aa36, level.script, var_de7821bc51ab43a0, 1);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2128
// Size: 0x66
function increment_zombiecareerstats(player, var_bb14a323e2bd7ce, var_4e71bbae7e003263) {
    if (!isdefined(var_4e71bbae7e003263)) {
        var_4e71bbae7e003263 = 1;
    }
    old_value = player getplayerdata("cp", "coopCareerStats", var_bb14a323e2bd7ce);
    new_value = old_value + var_4e71bbae7e003263;
    player setplayerdata("cp", "coopCareerStats", var_bb14a323e2bd7ce, int(new_value));
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2196
// Size: 0x50
function updateifgreaterthan_zombiecareerstats(player, var_bb14a323e2bd7ce, new_value) {
    old_value = player getplayerdata("cp", "coopCareerStats", var_bb14a323e2bd7ce);
    if (new_value > old_value) {
        player setplayerdata("cp", "coopCareerStats", var_bb14a323e2bd7ce, new_value);
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x21ee
// Size: 0xaa
function check_and_update_best_stats(player, new_value, var_bb14a323e2bd7ce, map_name, var_de7821bc51ab43a0, reverse) {
    if (should_update_leaderboard_stats()) {
        old_value = player getplayerdata("cp", "leaderboarddata", map_name, "leaderboardDataPerMap", var_de7821bc51ab43a0, var_bb14a323e2bd7ce);
        if (!istrue(reverse)) {
            if (new_value > old_value) {
                player setplayerdata("cp", "leaderboarddata", map_name, "leaderboardDataPerMap", var_de7821bc51ab43a0, var_bb14a323e2bd7ce, new_value);
            }
            return;
        }
        if (new_value < old_value) {
            player setplayerdata("cp", "leaderboarddata", map_name, "leaderboardDataPerMap", var_de7821bc51ab43a0, var_bb14a323e2bd7ce, new_value);
        }
    }
}

// Namespace persistence / namespace_6c67e93a4c487d83
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x22a0
// Size: 0x8f
function updateleaderboardstats(player, var_bb14a323e2bd7ce, new_value, map_name, var_de7821bc51ab43a0, var_4e71bbae7e003263) {
    if (should_update_leaderboard_stats()) {
        if (!isdefined(var_4e71bbae7e003263)) {
            var_4e71bbae7e003263 = 1;
        }
        old_value = player getplayerdata("cp", "leaderboarddata", map_name, "leaderboardDataPerMap", var_de7821bc51ab43a0, var_bb14a323e2bd7ce);
        new_value = old_value + var_4e71bbae7e003263;
        if (new_value > old_value) {
            player setplayerdata("cp", "leaderboarddata", map_name, "leaderboardDataPerMap", var_de7821bc51ab43a0, var_bb14a323e2bd7ce, new_value);
        }
    }
}

