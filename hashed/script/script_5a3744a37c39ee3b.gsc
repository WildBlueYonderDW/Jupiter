// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_4a6760982b403bad;
#using script_16ea1b94f0f381b3;
#using script_639bf783929acf9b;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_3214e6fcdce468a7;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_482376d10f69832c;
#using script_2590b7a7de3dfc79;
#using scripts\mp\rank.gsc;
#using script_58be75c518bf0d40;
#using scripts\mp\vehicles\damage.gsc;
#using script_2669878cf5a1b6bc;
#using script_64316dc775e91122;
#using script_6f65366f542f6627;
#using script_638d701d263ee1ed;
#using script_2707474774db34b;

#namespace namespace_7045c8949b4275bb;

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113b
// Size: 0x18b
function function_af225185d1ae2dee() {
    level callback::add("on_ai_killed", &on_ai_killed);
    callback::add("player_spawned", &on_player_spawned);
    callback::add("on_pmc_mission_completed", &function_135da259745a566d);
    callback::add("player_revived", &on_player_revived);
    callback::add("lootcache_looted", &function_666ae1db00355d4e);
    callback::add("encampment_key_looted", &function_c26e120a006454f3);
    callback::add("stronghold_key_looted", &function_f9799c83791f6627);
    callback::add("warlord_damaged", &function_c469f9ef817befa);
    callback::add("warlord_killed", &function_35dc543a1cdaf196);
    callback::add("analytics_proximity_activity_start", &function_8d63eecaeee93b02);
    callback::add("analytics_proximity_activity_abandon", &function_7abcee67f1c861eb);
    callback::add("analytics_proximity_activity_completed", &function_3a269816a495421e);
    callback::add("analytics_proximity_activity_failed", &function_a7a86fb367a570);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_disconnect", &on_player_disconnect);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_server_exit_level", &function_69ddf7a3e512a18a);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_ob_on_exfil", &function_6b954969ae3c0e97);
    callback::add("register_activities", &function_af4c6a6a1f2e94f7);
    callback::add("player_vehicle_enter", &function_5f169bceaf46be72);
    callback::add("player_vehicle_exit", &function_a35b022f55e9ed64);
    callback::add("on_vehicle_tire_repaired", &function_3e4b26b7b8eb8be2);
    callback::add("on_vehicle_refueled", &on_vehicle_refueled);
    callback::add("on_vehicle_spawned", &on_vehicle_spawned);
    callback::add("on_ob_infil_complete", &on_ob_infil_complete);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12cd
// Size: 0x4a
function on_vehicle_spawned(var_d27680ff86693f5c) {
    waitframe();
    vehicle = var_d27680ff86693f5c.vehicle;
    if (!isdefined(vehicle.vehiclename)) {
        return;
    }
    namespace_ad22b9cf6a2b30d::function_21a469b6e2805cf1(vehicle.vehiclename, &function_eef88565476a2f1a);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131e
// Size: 0x128
function function_eef88565476a2f1a(data) {
    if (!isdefined(data)) {
        return;
    }
    var_73069b4add1e8094 = "difficulty_easy";
    if (isfunction(level.var_8241e0d86017df29)) {
        var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](self.origin);
    }
    if (isplayer(data.attacker)) {
        data.attacker dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", [0:"enter", 1:0, 2:"exit", 3:0, 4:"refuel", 5:0, 6:"repair_tire", 7:0, 8:"destroyed", 9:1, 10:"name", 11:self.vehiclename, 12:"threat_level", 13:var_73069b4add1e8094, 14:"vehicle_x", 15:self.origin[0], 16:"vehicle_y", 17:self.origin[1], 18:"vehicle_z", 19:self.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144d
// Size: 0x16e
function function_5f169bceaf46be72(params) {
    if (isdefined(params.vehicle) && isent(params.vehicle) && isplayer(self)) {
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", [0:"enter", 1:1, 2:"exit", 3:0, 4:"refuel", 5:0, 6:"repair_tire", 7:0, 8:"destroyed", 9:0, 10:"name", 11:params.vehicle.vehiclename, 12:"threat_level", 13:var_73069b4add1e8094, 14:"vehicle_x", 15:params.vehicle.origin[0], 16:"vehicle_y", 17:params.vehicle.origin[1], 18:"vehicle_z", 19:params.vehicle.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c2
// Size: 0x191
function function_a35b022f55e9ed64(params) {
    if (isdefined(params.vehicle) && isent(params.vehicle) && isplayer(self)) {
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        if (isdefined(params.vehicle) && isent(params.vehicle)) {
            self dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", [0:"enter", 1:0, 2:"exit", 3:1, 4:"refuel", 5:0, 6:"repair_tire", 7:0, 8:"destroyed", 9:0, 10:"name", 11:params.vehicle.vehiclename, 12:"threat_level", 13:var_73069b4add1e8094, 14:"vehicle_x", 15:params.vehicle.origin[0], 16:"vehicle_y", 17:params.vehicle.origin[1], 18:"vehicle_z", 19:params.vehicle.origin[2]]);
        }
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175a
// Size: 0x16e
function function_3e4b26b7b8eb8be2(params) {
    if (isdefined(params.vehicle) && isent(params.vehicle) && isplayer(self)) {
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", [0:"enter", 1:0, 2:"exit", 3:0, 4:"refuel", 5:0, 6:"repair_tire", 7:1, 8:"destroyed", 9:0, 10:"name", 11:params.vehicle.vehiclename, 12:"threat_level", 13:var_73069b4add1e8094, 14:"vehicle_x", 15:params.vehicle.origin[0], 16:"vehicle_y", 17:params.vehicle.origin[1], 18:"vehicle_z", 19:params.vehicle.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cf
// Size: 0x192
function on_vehicle_refueled(params) {
    if (isdefined(params.vehicle) && isdefined(params.player) && isent(params.vehicle) && isplayer(params.player)) {
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        params.player dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", [0:"enter", 1:0, 2:"exit", 3:0, 4:"refuel", 5:1, 6:"repair_tire", 7:0, 8:"destroyed", 9:0, 10:"name", 11:params.vehicle.vehiclename, 12:"threat_level", 13:var_73069b4add1e8094, 14:"vehicle_x", 15:params.vehicle.origin[0], 16:"vehicle_y", 17:params.vehicle.origin[1], 18:"vehicle_z", 19:params.vehicle.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a68
// Size: 0x5d
function function_af4c6a6a1f2e94f7(params) {
    if (isdefined(level.var_83abcb9b3a5dbe24)) {
        namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("PlayerAbandon", &function_bf9ed28219b4e9b9);
        namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_90b2469c5d2c8332);
        namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("ActivityFailure", &function_ecc4c25753cd6d64);
        namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("ActivityBegin", &function_f1845574e88cb9ee);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1acc
// Size: 0xc9d
function on_player_spawned(params) {
    self endon("disconnect");
    while (!isdefined(self.pers["telemetry"])) {
        waitframe();
    }
    if (!isdefined(self.pers["telemetry"].zombie_kills)) {
        self.pers["telemetry"].zombie_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].soldier_kills)) {
        self.pers["telemetry"].soldier_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].boss_kills)) {
        self.pers["telemetry"].boss_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].elite_kills)) {
        self.pers["telemetry"].elite_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].special_kills)) {
        self.pers["telemetry"].special_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].normal_kills)) {
        self.pers["telemetry"].normal_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].critical_kills)) {
        self.pers["telemetry"].critical_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].pack_a_punch_kills)) {
        self.pers["telemetry"].pack_a_punch_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].looted_containers)) {
        self.pers["telemetry"].looted_containers = 0;
    }
    if (!isdefined(self.pers["telemetry"].teammates_revived)) {
        self.pers["telemetry"].teammates_revived = 0;
    }
    if (!isdefined(self.pers["telemetry"].one_shot_kills)) {
        self.pers["telemetry"].one_shot_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_earned)) {
        self.pers["telemetry"].essence_earned = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_spent)) {
        self.pers["telemetry"].essence_spent = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_cache)) {
        self.pers["telemetry"].essence_from_cache = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_pickup)) {
        self.pers["telemetry"].essence_from_pickup = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_kills)) {
        self.pers["telemetry"].essence_from_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_activities)) {
        self.pers["telemetry"].essence_from_activities = 0;
    }
    if (!isdefined(self.pers["telemetry"].match_time_elapsed)) {
        self.pers["telemetry"].match_time_elapsed = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_easy_difficulty)) {
        self.pers["telemetry"].essence_from_easy_difficulty = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_normal_difficulty)) {
        self.pers["telemetry"].essence_from_normal_difficulty = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_hard_difficulty)) {
        self.pers["telemetry"].essence_from_hard_difficulty = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_from_darkaether_difficulty)) {
        self.pers["telemetry"].essence_from_darkaether_difficulty = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_spent_wallbuy)) {
        self.pers["telemetry"].essence_spent_wallbuy = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_spent_pack)) {
        self.pers["telemetry"].essence_spent_pack = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_spent_magicbox)) {
        self.pers["telemetry"].essence_spent_magicbox = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_spent_perk)) {
        self.pers["telemetry"].essence_spent_perk = 0;
    }
    if (!isdefined(self.pers["telemetry"].perks_obtained)) {
        self.pers["telemetry"].perks_obtained = [];
    }
    if (!isdefined(self.pers["telemetry"].essence_from_buystation)) {
        self.pers["telemetry"].essence_from_buystation = 0;
    }
    if (!isdefined(self.pers["telemetry"].essence_spent_buystation)) {
        self.pers["telemetry"].essence_spent_buystation = 0;
    }
    if (!isdefined(self.pers["telemetry"].mangler_kills)) {
        self.pers["telemetry"].mangler_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].mimic_kills)) {
        self.pers["telemetry"].mimic_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].disciple_kills)) {
        self.pers["telemetry"].disciple_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].hellhound_kills)) {
        self.pers["telemetry"].hellhound_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].base_zombie_kills)) {
        self.pers["telemetry"].base_zombie_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].light_armor_zombie_kills)) {
        self.pers["telemetry"].light_armor_zombie_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].heavy_armor_zombie_kills)) {
        self.pers["telemetry"].heavy_armor_zombie_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].abomination_kills)) {
        self.pers["telemetry"].abomination_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].deathworm_kills)) {
        self.pers["telemetry"].deathworm_kills = 0;
    }
    if (!isdefined(self.pers["telemetry"].ai_attackers_on_bleedout)) {
        self.pers["telemetry"].ai_attackers_on_bleedout = [];
    }
    if (!isdefined(self.pers["telemetry"].ai_attackers_on_laststand)) {
        self.pers["telemetry"].ai_attackers_on_laststand = [];
    }
    if (!isdefined(self.pers["telemetry"].contracts_completed)) {
        self.pers["telemetry"].contracts_completed = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_f1f0e54434cdf293)) {
        self.pers["telemetry"].var_f1f0e54434cdf293 = 0;
    }
    if (!isdefined(self.pers["telemetry"].activities_completed)) {
        self.pers["telemetry"].activities_completed = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_355ce2c63476b983)) {
        self.pers["telemetry"].var_355ce2c63476b983 = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_5a383b47b09076a6)) {
        self.pers["telemetry"].var_5a383b47b09076a6 = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_af3f574708e215b8)) {
        self.pers["telemetry"].var_af3f574708e215b8 = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_b0def0662a1a3bdb)) {
        self.pers["telemetry"].var_b0def0662a1a3bdb = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_943eae82c17be7a)) {
        self.pers["telemetry"].var_943eae82c17be7a = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_1e793bda8b84600f)) {
        self.pers["telemetry"].var_1e793bda8b84600f = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_f9df09327f6519ea)) {
        self.pers["telemetry"].var_f9df09327f6519ea = 0;
    }
    if (!isdefined(self.pers["telemetry"].looted_stronghold_keys)) {
        self.pers["telemetry"].looted_stronghold_keys = 0;
    }
    if (!isdefined(self.pers["telemetry"].damaged_warlords)) {
        self.pers["telemetry"].damaged_warlords = 0;
    }
    if (!isdefined(self.pers["telemetry"].killed_warlords)) {
        self.pers["telemetry"].killed_warlords = 0;
    }
    if (!isdefined(self.pers["telemetry"].infil_essence)) {
        self.pers["telemetry"].infil_essence = 0;
    }
    if (ent_flag("ob_analytics_player_callbacks")) {
        return;
    }
    ent_flag_set("ob_analytics_player_callbacks");
    callback::add("currency_add", &function_9e622ced1b338442);
    callback::add("currency_sub", &function_961056ec584817fb);
    callback::add("currency_set", &function_95ca4cec57fb728d);
    callback::add("player_item_pickup", &on_item_pickup);
    callback::add("player_bleedout", &on_player_bleedout);
    callback::add("player_laststand", &on_player_laststand);
    callback::add("player_death", &on_player_death);
    callback::add("zm_perk_purchased", &function_7e6c3d2a433ea927);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2770
// Size: 0x1aa
function on_player_laststand(params) {
    if (isplayer(self) && isagent(self.attacker)) {
        if (isdefined(self.attacker.subclass)) {
            self.pers["telemetry"].ai_attackers_on_laststand[self.pers["telemetry"].ai_attackers_on_laststand.size] = self.attacker.subclass;
        }
        self.lastattacker = self.attacker;
        var_f17f74f4ddb3fd12 = isdefined(self.attacker.subclass) ? "unknown" : self.attacker.subclass;
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](self.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_death", [0:"was_knocked", 1:1, 2:"was_killed", 3:0, 4:"was_revived", 5:0, 6:"location_x", 7:self.origin[0], 8:"location_y", 9:self.origin[1], 10:"location_z", 11:self.origin[2], 12:"difficulty", 13:var_73069b4add1e8094, 14:"attacker", 15:var_f17f74f4ddb3fd12]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2921
// Size: 0x82
function on_player_bleedout(params) {
    if (isplayer(self) && isdefined(self.attacker)) {
        if (isdefined(self.attacker.subclass)) {
            self.pers["telemetry"].ai_attackers_on_bleedout[self.pers["telemetry"].ai_attackers_on_bleedout.size] = self.attacker.subclass;
        }
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29aa
// Size: 0x14
function on_player_disconnect(data) {
    function_937c131dcec8e814(data);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c5
// Size: 0x75
function function_69ddf7a3e512a18a(data) {
    foreach (player in level.players) {
        data = spawnstruct();
        data.player = player;
        function_937c131dcec8e814(data);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a41
// Size: 0x168
function function_7f921b653404b03c(amount) {
    var_73069b4add1e8094 = "difficulty_easy";
    if (isfunction(level.var_8241e0d86017df29)) {
        var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](self.origin);
    }
    switch (var_73069b4add1e8094) {
    case #"hash_7bb2cd766703d463":
    case #"hash_a1e09f51896088fb":
        self.pers["telemetry"].essence_from_easy_difficulty = self.pers["telemetry"].essence_from_easy_difficulty + amount;
        break;
    case #"hash_af83e47edfa8900a":
        self.pers["telemetry"].essence_from_normal_difficulty = self.pers["telemetry"].essence_from_normal_difficulty + amount;
        break;
    case #"hash_5343b465e56ec9a4":
        self.pers["telemetry"].essence_from_hard_difficulty = self.pers["telemetry"].essence_from_hard_difficulty + amount;
        break;
    case #"hash_651f76c0ad6741ec":
        self.pers["telemetry"].essence_from_darkaether_difficulty = self.pers["telemetry"].essence_from_darkaether_difficulty + amount;
        break;
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb0
// Size: 0x15d
function function_9e622ced1b338442(var_d27680ff86693f5c) {
    self.pers["telemetry"].essence_earned = self.pers["telemetry"].essence_earned + var_d27680ff86693f5c.amount;
    function_7f921b653404b03c(var_d27680ff86693f5c.amount);
    if (isdefined(var_d27680ff86693f5c.reason)) {
        if (var_d27680ff86693f5c.reason == #"cache") {
            self.pers["telemetry"].essence_from_cache = self.pers["telemetry"].essence_from_cache + var_d27680ff86693f5c.amount;
        } else if (var_d27680ff86693f5c.reason == #"sold") {
            self.pers["telemetry"].essence_from_buystation = self.pers["telemetry"].essence_from_buystation + var_d27680ff86693f5c.amount;
        } else if (var_d27680ff86693f5c.reason == #"infil_essence") {
            self.pers["telemetry"].infil_essence = var_d27680ff86693f5c.amount;
        }
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d14
// Size: 0x3ba
function function_961056ec584817fb(var_d27680ff86693f5c) {
    self.pers["telemetry"].essence_spent = self.pers["telemetry"].essence_spent + var_d27680ff86693f5c.amount;
    str_type = "unknown";
    var_ece4e1b399eb9fd = "unknown";
    if (isdefined(var_d27680ff86693f5c.reason)) {
        if (var_d27680ff86693f5c.reason == #"magicbox") {
            self.pers["telemetry"].essence_spent_magicbox = self.pers["telemetry"].essence_spent_magicbox + var_d27680ff86693f5c.amount;
            str_type = "magicbox";
        } else if (var_d27680ff86693f5c.reason == #"packapunch") {
            self.pers["telemetry"].essence_spent_pack = self.pers["telemetry"].essence_spent_pack + var_d27680ff86693f5c.amount;
            str_type = "packapunch";
        } else if (var_d27680ff86693f5c.reason == #"perk") {
            self.pers["telemetry"].essence_spent_perk = self.pers["telemetry"].essence_spent_perk + var_d27680ff86693f5c.amount;
            str_type = "perk";
            var_ece4e1b399eb9fd = isdefined(var_d27680ff86693f5c.info) ? "unknown" : var_d27680ff86693f5c.info;
        } else if (var_d27680ff86693f5c.reason == #"wallbuy") {
            self.pers["telemetry"].essence_spent_wallbuy = self.pers["telemetry"].essence_spent_wallbuy + var_d27680ff86693f5c.amount;
            str_type = "wallbuy";
            var_ece4e1b399eb9fd = isdefined(var_d27680ff86693f5c.info) ? "unknown" : var_d27680ff86693f5c.info;
        } else if (var_d27680ff86693f5c.reason == #"buystation") {
            self.pers["telemetry"].essence_spent_buystation = self.pers["telemetry"].essence_spent_buystation + var_d27680ff86693f5c.amount;
            str_type = "buystation";
            var_ece4e1b399eb9fd = isdefined(var_d27680ff86693f5c.info) ? "unknown" : var_d27680ff86693f5c.info;
        } else if (var_d27680ff86693f5c.reason == #"zip_door") {
            str_type = "zip_door";
        }
    }
    var_73069b4add1e8094 = "difficulty_easy";
    if (isfunction(level.var_8241e0d86017df29)) {
        var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](self.origin);
    }
    self dlog_recordplayerevent("dlog_event_ob_player_purchase", [0:"pos_x", 1:self.origin[0], 2:"pos_y", 3:self.origin[1], 4:"pos_z", 5:self.origin[2], 6:"difficulty", 7:var_73069b4add1e8094, 8:"essence_spent", 9:var_d27680ff86693f5c.amount, 10:"type_purchased", 11:str_type, 12:"info_purchased", 13:var_ece4e1b399eb9fd]);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d5
// Size: 0x15e
function function_95ca4cec57fb728d(var_d27680ff86693f5c) {
    if (isdefined(var_d27680ff86693f5c.var_65b4e89f87e61c2) && isdefined(var_d27680ff86693f5c.amount) && var_d27680ff86693f5c.var_65b4e89f87e61c2 < var_d27680ff86693f5c.amount) {
        var_9771dcd8890aebbb = var_d27680ff86693f5c.amount - var_d27680ff86693f5c.var_65b4e89f87e61c2;
        self.pers["telemetry"].essence_earned = self.pers["telemetry"].essence_earned + var_9771dcd8890aebbb;
        if (isdefined(var_d27680ff86693f5c.reason) && var_d27680ff86693f5c.reason == #"kill") {
            self.pers["telemetry"].essence_from_kills = self.pers["telemetry"].essence_from_kills + var_9771dcd8890aebbb;
        }
        if (isdefined(var_d27680ff86693f5c.reason) && var_d27680ff86693f5c.reason == #"hash_e4190edf8f5e7356") {
            self.pers["telemetry"].essence_from_activities = self.pers["telemetry"].essence_from_activities + var_9771dcd8890aebbb;
        }
        function_7f921b653404b03c(var_9771dcd8890aebbb);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x323a
// Size: 0x92
function on_item_pickup(var_d27680ff86693f5c) {
    if (isdefined(var_d27680ff86693f5c.item) && isdefined(var_d27680ff86693f5c.itembundle)) {
        if (istrue(var_d27680ff86693f5c.itembundle.type == "currency")) {
            self.pers["telemetry"].essence_from_pickup = self.pers["telemetry"].essence_from_pickup + var_d27680ff86693f5c.item.count;
        }
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d3
// Size: 0x839
function function_937c131dcec8e814(data) {
    player = data.player;
    if (!isdefined(player.pers["telemetry"].var_7f5d11228750d896)) {
        if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
            return;
        }
        if (istrue(player.var_6a91d0e80cc504e) && !istrue(level.gameended)) {
            return;
        }
        player.pers["telemetry"].match_time_elapsed = int(getsecondspassed());
        essence_total = player currency::function_15975e20bbd2c824("essence");
        player dlog_recordplayerevent("dlog_event_ob_combat_record", [0:"zombie_kills", 1:player.pers["telemetry"].zombie_kills, 2:"soldier_kills", 3:player.pers["telemetry"].soldier_kills, 4:"boss_kills", 5:player.pers["telemetry"].boss_kills, 6:"elite_kills", 7:player.pers["telemetry"].elite_kills, 8:"special_kills", 9:player.pers["telemetry"].special_kills, 10:"normal_kills", 11:player.pers["telemetry"].normal_kills, 12:"critical_kills", 13:player.pers["telemetry"].critical_kills, 14:"pack_a_punch_kills", 15:player.pers["telemetry"].pack_a_punch_kills, 16:"essence_total", 17:essence_total, 18:"looted_containers", 19:player.pers["telemetry"].looted_containers, 20:"teammates_revived", 21:player.pers["telemetry"].teammates_revived, 22:"contracts_completed", 23:player.pers["telemetry"].contracts_completed, 24:"one_shot_kills", 25:player.pers["telemetry"].one_shot_kills, 26:"essence_earned", 27:player.pers["telemetry"].essence_earned, 28:"essence_spent", 29:player.pers["telemetry"].essence_spent, 30:"essence_from_cache", 31:player.pers["telemetry"].essence_from_cache, 32:"essence_from_pickup", 33:player.pers["telemetry"].essence_from_pickup, 34:"essence_from_kills", 35:player.pers["telemetry"].essence_from_kills, 36:"essence_from_activities", 37:player.pers["telemetry"].essence_from_activities, 38:"match_time_elapsed", 39:player.pers["telemetry"].match_time_elapsed, 40:"essence_from_easy_difficulty", 41:player.pers["telemetry"].essence_from_easy_difficulty, 42:"essence_from_normal_difficulty", 43:player.pers["telemetry"].essence_from_normal_difficulty, 44:"essence_from_hard_difficulty", 45:player.pers["telemetry"].essence_from_hard_difficulty, 46:"essence_from_darkaether_difficulty", 47:player.pers["telemetry"].essence_from_darkaether_difficulty, 48:"essence_spent_wallbuy", 49:player.pers["telemetry"].essence_spent_wallbuy, 50:"essence_spent_pack", 51:player.pers["telemetry"].essence_spent_pack, 52:"essence_spent_magicbox", 53:player.pers["telemetry"].essence_spent_magicbox, 54:"essence_spent_perk", 55:player.pers["telemetry"].essence_spent_perk, 56:"perks_obtained", 57:player.pers["telemetry"].perks_obtained, 58:"essence_from_buystation", 59:player.pers["telemetry"].essence_from_buystation, 60:"essence_spent_buystation", 61:player.pers["telemetry"].essence_spent_buystation, 62:"mangler_kills", 63:player.pers["telemetry"].mangler_kills, 64:"mimic_kills", 65:player.pers["telemetry"].mimic_kills, 66:"disciple_kills", 67:player.pers["telemetry"].disciple_kills, 68:"hellhound_kills", 69:player.pers["telemetry"].hellhound_kills, 70:"base_zombie_kills", 71:player.pers["telemetry"].base_zombie_kills, 72:"light_armor_zombie_kills", 73:player.pers["telemetry"].light_armor_zombie_kills, 74:"heavy_armor_zombie_kills", 75:player.pers["telemetry"].heavy_armor_zombie_kills, 76:"abomination_kills", 77:player.pers["telemetry"].abomination_kills, 78:"deathworm_kills", 79:player.pers["telemetry"].deathworm_kills, 80:"ai_attackers_on_bleedout", 81:player.pers["telemetry"].ai_attackers_on_bleedout, 82:"ai_attackers_on_laststand", 83:player.pers["telemetry"].ai_attackers_on_laststand, 84:"looted_encamptment_keys", 85:player.pers["telemetry"].var_f9df09327f6519ea, 86:"looted_stronghold_keys", 87:player.pers["telemetry"].looted_stronghold_keys, 88:"damaged_warlords", 89:player.pers["telemetry"].damaged_warlords, 90:"killed_warlords", 91:player.pers["telemetry"].killed_warlords, 92:"activities_completed", 93:player.pers["telemetry"].activities_completed, 94:"infil_essence", 95:player.pers["telemetry"].infil_essence]);
        player.pers["telemetry"].var_7f5d11228750d896 = 1;
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b13
// Size: 0x34c
function private function_a6db08193cf5c2dc(attacker, params) {
    player = attacker;
    if (isplayer(player.var_941802a0997e0c42)) {
        player.pers["telemetry"].var_943eae82c17be7a++;
        player.pers["telemetry"].var_1e793bda8b84600f = player.pers["telemetry"].var_1e793bda8b84600f + (isdefined(rank::getscoreinfoxp(#"brainrot_kill")) ? 0 : rank::getscoreinfoxp(#"brainrot_kill"));
    }
    if (isdefined(self.var_5ede61272f442abd)) {
        player.pers["telemetry"].var_943eae82c17be7a++;
        player.pers["telemetry"].var_1e793bda8b84600f = player.pers["telemetry"].var_1e793bda8b84600f + (isdefined(rank::getscoreinfoxp(self.var_5ede61272f442abd)) ? 0 : rank::getscoreinfoxp(self.var_5ede61272f442abd));
    }
    if (isdefined(params.sweapon) && isdefined(params.smeansofdeath) && isplayer(params.eattacker)) {
        var_2bd7283211fa61e7 = function_591305dc9c07499b(params.sweapon, params.eattacker, params.smeansofdeath);
        var_4106d2021e226fcd = "none";
        if (var_2bd7283211fa61e7 == "fire" || params.smeansofdeath == "MOD_ELEMENTAL_FIRE") {
            if (!isdefined(params.einflictor) || !is_equal(params.einflictor.weapon_name, "hellhound_molotov")) {
                var_4106d2021e226fcd = #"hash_f09b4f756df11aa4";
                player.pers["telemetry"].var_943eae82c17be7a++;
            }
        } else if (var_2bd7283211fa61e7 == "cold" || params.smeansofdeath == "MOD_ELEMENTAL_COLD") {
            var_4106d2021e226fcd = #"hash_a62035653525d27e";
            player.pers["telemetry"].var_943eae82c17be7a++;
        } else if (var_2bd7283211fa61e7 == "electrical" || params.smeansofdeath == "MOD_ELEMENTAL_ELEC") {
            var_4106d2021e226fcd = #"hash_f48e7e053c787be5";
            player.pers["telemetry"].var_943eae82c17be7a++;
        } else if (var_2bd7283211fa61e7 == "toxic" || params.smeansofdeath == "MOD_ELEMENTAL_TOXIC") {
            var_4106d2021e226fcd = #"hash_e1c37b28b02f43bf";
            player.pers["telemetry"].var_943eae82c17be7a++;
        }
        player.pers["telemetry"].var_1e793bda8b84600f = player.pers["telemetry"].var_1e793bda8b84600f + (isdefined(namespace_62c556437da28f50::getscoreinfoxp(var_4106d2021e226fcd)) ? 0 : namespace_62c556437da28f50::getscoreinfoxp(var_4106d2021e226fcd));
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e66
// Size: 0xa38
function on_ai_killed(params) {
    if (!isdefined(params.eattacker)) {
        return;
    }
    vehicle_kill = 0;
    attacker = params.eattacker;
    if (params.eattacker vehicle::isvehicle()) {
        attacker = params.eattacker getvehicleowner();
        vehicle_kill = 1;
    } else if (params.einflictor vehicle::isvehicle()) {
        attacker = params.einflictor getvehicleowner();
        vehicle_kill = 1;
    } else if (isdefined(params.eattacker.owner) && isplayer(params.eattacker.owner)) {
        attacker = params.eattacker.owner;
    } else if (isdefined(params.einflictor.owner) && isplayer(params.einflictor.owner)) {
        attacker = params.einflictor.owner;
    }
    if (isplayer(attacker)) {
        player = attacker;
        if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
            return;
        }
        if (!isdefined(self.var_d37b75616f7c2ee)) {
            return;
        }
        var_9b9dbc948c253172 = self.var_d37b75616f7c2ee.var_9b9dbc948c253172;
        sweapon = self.var_d37b75616f7c2ee.sweapon;
        aicategory = self.aicategory;
        var_aaf0465944b061ed = self.var_aaf0465944b061ed;
        var_14edc6d1db3695bc = self.var_d37b75616f7c2ee.var_14edc6d1db3695bc;
        unittype = self.unittype;
        type = self.type;
        subclass = self.subclass;
        if (!isdefined(aicategory) && var_aaf0465944b061ed == "warlord_kia") {
            aicategory = "boss";
        }
        if (var_9b9dbc948c253172 == 1) {
            player.pers["telemetry"].one_shot_kills++;
        }
        if (vehicle_kill) {
            var_aaf0465944b061ed = points::function_818ac0c0b8f0b22(var_aaf0465944b061ed, "_vehicle");
        }
        if (isdefined(sweapon)) {
            if (!isdefined(level.ob_ai_killed_telemetry_throttle)) {
                level.ob_ai_killed_telemetry_throttle = function_e4c99b0f178ffb98("ob_ai_killed_telemetry_throttle", 1, level.framedurationseconds);
            }
            var_c11d6c177d7ab5a2 = spawnstruct();
            function_f632348cbb773537(level.ob_ai_killed_telemetry_throttle, var_c11d6c177d7ab5a2);
            function_a6db08193cf5c2dc(attacker, params);
            if (isdefined(subclass)) {
                if (subclass == "zombie_base_armored_heavy") {
                    player.pers["telemetry"].heavy_armor_zombie_kills++;
                } else if (subclass == "zombie_abom" || subclass == "zombie_abom_mega" || subclass == "zombie_abom_mega_hvt") {
                    player.pers["telemetry"].abomination_kills++;
                } else if (subclass == "zombie_hellhound") {
                    player.pers["telemetry"].hellhound_kills++;
                } else if (subclass == "zombie_mangler") {
                    player.pers["telemetry"].mangler_kills++;
                } else if (subclass == "zombie_mimic") {
                    player.pers["telemetry"].mimic_kills++;
                } else if (subclass == "zombie_disciple") {
                    player.pers["telemetry"].disciple_kills++;
                } else if (subclass == "zombie_disciple_hvt_stormcaller") {
                    player.pers["telemetry"].disciple_kills++;
                } else if (subclass == "zombie_base_armored_light") {
                    player.pers["telemetry"].light_armor_zombie_kills++;
                } else if (subclass == "zombie_deathworm") {
                    player.pers["telemetry"].deathworm_kills++;
                }
            }
            weaponname = namespace_e0ee43ef2dddadaa::getweaponrootname(sweapon);
            fullweaponname = getcompleteweaponname(sweapon);
            variantindex = getweaponvariantindex(sweapon);
            if (isdefined(aicategory)) {
                var_973199e4a96e0929 = spawnstruct();
                var_973199e4a96e0929.weaponname = weaponname;
                var_973199e4a96e0929.fullweaponname = fullweaponname;
                var_973199e4a96e0929.var_a1d4e7d5ef9da660 = 1;
                var_973199e4a96e0929.variantid = variantindex;
                var_973199e4a96e0929.weaponobj = sweapon;
                if (aicategory == "normal") {
                    player.pers["telemetry"].normal_kills++;
                    var_973199e4a96e0929.statname = "weapon_normal_zombie_kills";
                } else if (aicategory == "special") {
                    player.pers["telemetry"].special_kills++;
                    var_973199e4a96e0929.statname = "weapon_special_zombie_kills";
                } else if (aicategory == "elite") {
                    player.pers["telemetry"].elite_kills++;
                    var_973199e4a96e0929.statname = "weapon_elite_zombie_kills";
                } else if (aicategory == "boss" || var_aaf0465944b061ed == "deathworm_kia" || var_aaf0465944b061ed == "warlord_kia") {
                    player.pers["telemetry"].boss_kills++;
                    player.pers["telemetry"].var_b0def0662a1a3bdb = player.pers["telemetry"].var_b0def0662a1a3bdb + (isdefined(rank::getscoreinfoxp(var_aaf0465944b061ed)) ? 0 : rank::getscoreinfoxp(var_aaf0465944b061ed));
                    var_973199e4a96e0929.statname = "weapon_boss_zombie_kills";
                }
                player namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_973199e4a96e0929);
            }
            if (player namespace_a4ff02beedc1bce8::get_pap_level(sweapon) > 0) {
                var_2f6c0e8dface9b8c = spawnstruct();
                var_2f6c0e8dface9b8c.weaponname = weaponname;
                var_2f6c0e8dface9b8c.fullweaponname = fullweaponname;
                var_2f6c0e8dface9b8c.var_a1d4e7d5ef9da660 = 1;
                var_2f6c0e8dface9b8c.variantid = variantindex;
                var_2f6c0e8dface9b8c.weaponobj = sweapon;
                player.pers["telemetry"].pack_a_punch_kills++;
                var_2f6c0e8dface9b8c.statname = "weapon_pack_a_punch_kills";
                player namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_2f6c0e8dface9b8c);
            }
            if (istrue(var_14edc6d1db3695bc)) {
                var_9a1d6caefd24b9a7 = spawnstruct();
                var_9a1d6caefd24b9a7.weaponname = weaponname;
                var_9a1d6caefd24b9a7.fullweaponname = fullweaponname;
                var_9a1d6caefd24b9a7.var_a1d4e7d5ef9da660 = 1;
                var_9a1d6caefd24b9a7.variantid = variantindex;
                var_9a1d6caefd24b9a7.weaponobj = sweapon;
                player.pers["telemetry"].critical_kills++;
                var_9a1d6caefd24b9a7.statname = "weapon_critical_kills";
                player namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_9a1d6caefd24b9a7);
            }
            if (unittype == "soldier") {
                var_afb46069ccac43c8 = spawnstruct();
                var_afb46069ccac43c8.weaponname = weaponname;
                var_afb46069ccac43c8.fullweaponname = fullweaponname;
                var_afb46069ccac43c8.var_a1d4e7d5ef9da660 = 1;
                var_afb46069ccac43c8.variantid = variantindex;
                var_afb46069ccac43c8.weaponobj = sweapon;
                player.pers["telemetry"].soldier_kills++;
                var_afb46069ccac43c8.statname = "weapon_soldier_kills";
                player namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_afb46069ccac43c8);
                player.pers["telemetry"].var_af3f574708e215b8 = player.pers["telemetry"].var_af3f574708e215b8 + (isdefined(rank::getscoreinfoxp(var_aaf0465944b061ed)) ? 0 : rank::getscoreinfoxp(var_aaf0465944b061ed));
            } else if (type == "zombie") {
                player.pers["telemetry"].zombie_kills++;
                player.pers["telemetry"].var_5a383b47b09076a6 = player.pers["telemetry"].var_5a383b47b09076a6 + (isdefined(rank::getscoreinfoxp(var_aaf0465944b061ed)) ? 0 : rank::getscoreinfoxp(var_aaf0465944b061ed));
            }
            var_3a0b9ff4afaae205 = spawnstruct();
            var_3a0b9ff4afaae205.weaponname = weaponname;
            var_3a0b9ff4afaae205.fullweaponname = fullweaponname;
            var_3a0b9ff4afaae205.var_a1d4e7d5ef9da660 = 1;
            var_3a0b9ff4afaae205.variantid = variantindex;
            var_3a0b9ff4afaae205.weaponobj = sweapon;
            var_3a0b9ff4afaae205.statname = "weapon_white_rarity_kills";
            var_dc06d61937139b33 = player function_ed7c10f78d0598f2(sweapon);
            if (isdefined(var_dc06d61937139b33)) {
                switch (var_dc06d61937139b33) {
                case 0:
                    var_3a0b9ff4afaae205.statname = "weapon_white_rarity_kills";
                    break;
                case 1:
                    var_3a0b9ff4afaae205.statname = "weapon_green_rarity_kills";
                    break;
                case 2:
                    var_3a0b9ff4afaae205.statname = "weapon_blue_rarity_kills";
                    break;
                case 3:
                    var_3a0b9ff4afaae205.statname = "weapon_purple_rarity_kills";
                    break;
                case 4:
                    var_3a0b9ff4afaae205.statname = "weapon_orange_rarity_kills";
                    break;
                }
            }
            player namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_3a0b9ff4afaae205);
        }
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a5
// Size: 0x179
function on_ob_infil_complete(params) {
    players = level.players;
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        var_57ad0dc40b2fdda = player namespace_cddd3ad399b210ff::function_a9ef0214509af471();
        var_a91c6541c62b2649 = var_57ad0dc40b2fdda[2];
        var_e41a3129bc5710b = var_57ad0dc40b2fdda[1];
        var_7838b9df983ad1ea = var_57ad0dc40b2fdda[0];
        str_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(player.origin);
        var_a1fc16d2ea055338 = [];
        var_a1fc16d2ea055338 = player namespace_cddd3ad399b210ff::function_dd632640ede8012(var_a1fc16d2ea055338);
        player dlog_recordplayerevent("dlog_event_ob_player_infil_complete", [0:"player_x", 1:player.origin[0], 2:"player_y", 3:player.origin[1], 4:"player_z", 5:player.origin[2], 6:"backpack_items", 7:var_7838b9df983ad1ea, 8:"loadout_items", 9:var_a1fc16d2ea055338, 10:"acquisition_items", 11:var_e41a3129bc5710b, 12:"schematic_items", 13:var_a91c6541c62b2649]);
        waitframe();
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a25
// Size: 0x18b
function function_6b954969ae3c0e97(data) {
    data.player dlog_recordplayerevent("dlog_event_ob_player_extraction_complete", [0:"team", 1:data.var_5a0fc1d304e970ea, 2:"player_x", 3:data.x, 4:"player_y", 5:data.y, 6:"player_z", 7:data.z, 8:"player_pitch", 9:data.var_6437fc57f57c9ad8, 10:"player_yaw", 11:data.var_fe76a03a13318315, 12:"player_roll", 13:data.zrot, 14:"match_time_elapsed", 15:data.var_c983d3abb7ec13d9, 16:"extraction_type", 17:data.var_a6b3fae0395f75c3, 18:"essence_total", 19:data.essence_total, 20:"backpack_items", 21:data.var_8003724ead57ba09, 22:"loadout_items", 23:data.var_8919314d1df8d669, 24:"acquisition_items", 25:data.var_61bda934e88cac0c, 26:"schematic_items", 27:data.var_27974d271f391cc2, 28:"threat_level", 29:data.difficulty]);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb7
// Size: 0x66
function function_135da259745a566d(params) {
    if (isplayer(params.player)) {
        params.player dlog_recordplayerevent("dlog_event_ob_player_mission_completed", [0:"id", 1:params.id, 2:"ref", 3:params.ref]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c24
// Size: 0x1a0
function on_player_death(params) {
    if (isplayer(self) && isagent(self.lastattacker)) {
        var_f17f74f4ddb3fd12 = isdefined(self.lastattacker.subclass) ? "unknown" : self.lastattacker.subclass;
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](self.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_death", [0:"was_knocked", 1:0, 2:"was_killed", 3:1, 4:"was_revived", 5:0, 6:"location_x", 7:self.origin[0], 8:"location_y", 9:self.origin[1], 10:"location_z", 11:self.origin[2], 12:"difficulty", 13:var_73069b4add1e8094, 14:"attacker", 15:var_f17f74f4ddb3fd12]);
    }
    squadmembers = squad_utility::getSquadMembers();
    foreach (player in squadmembers) {
        if (isalive(player)) {
            return;
        }
    }
    function_4828fb386ec572ba();
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dcb
// Size: 0xc6
function function_4828fb386ec572ba() {
    var_a21d92f62733e9c9 = namespace_cde84ab88f41f1a5::function_5cc2fd3d10cbab56(self);
    if (isdefined(var_a21d92f62733e9c9.var_6346961d07f668fe)) {
        var_2d25d18d189a363a = namespace_70aa82e7f409bc33::function_1f3e343912ae15c5(var_a21d92f62733e9c9.var_6346961d07f668fe);
        activity_type = var_2d25d18d189a363a.type;
    }
    dlog_recordevent("dlog_event_ob_team_eliminated", [0:"team", 1:self.team, 2:"survival_time", 3:gettime() - level.starttime, 4:"activity_type", 5:isdefined(activity_type) ? "none" : activity_type, 6:"was_rift_run", 7:istrue(self.rift_run)]);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e98
// Size: 0x172
function on_player_revived(params) {
    if (isplayer(params.reviver)) {
        params.reviver.pers["telemetry"].teammates_revived++;
    }
    if (isplayer(self) && isagent(self.lastattacker)) {
        var_f17f74f4ddb3fd12 = isdefined(self.lastattacker.subclass) ? "unknown" : self.lastattacker.subclass;
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](self.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_death", [0:"was_knocked", 1:0, 2:"was_killed", 3:0, 4:"was_revived", 5:1, 6:"location_x", 7:self.origin[0], 8:"location_y", 9:self.origin[1], 10:"location_z", 11:self.origin[2], 12:"difficulty", 13:var_73069b4add1e8094, 14:"attacker", 15:var_f17f74f4ddb3fd12]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5011
// Size: 0x1c9
function function_666ae1db00355d4e(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].looted_containers++;
    }
    if (isdefined(params) && isdefined(params.var_beeb487603b69a3e) && isdefined(params.items)) {
        var_73069b4add1e8094 = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](params.var_beeb487603b69a3e.origin);
        }
        var_a444efe034b95926 = [];
        foreach (item in params.items) {
            if (isdefined(item.lootid)) {
                var_a444efe034b95926[var_a444efe034b95926.size] = item.lootid;
            }
        }
        dlog_recordevent("dlog_event_ob_cache_looted", [0:"cache_type", 1:params.var_beeb487603b69a3e.type, 2:"cache_threat_level", 3:var_73069b4add1e8094, 4:"cache_location_x", 5:params.var_beeb487603b69a3e.origin[0], 6:"cache_location_y", 7:params.var_beeb487603b69a3e.origin[1], 8:"cache_location_z", 9:params.var_beeb487603b69a3e.origin[2], 10:"items", 11:var_a444efe034b95926]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e1
// Size: 0xce
function function_c26e120a006454f3(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].var_f9df09327f6519ea++;
    }
    if (isdefined(params.var_beeb487603b69a3e)) {
        dlog_recordevent("dlog_event_ob_human_faction_squad_get_encampment_key", [0:"key_cache_location_x", 1:params.var_beeb487603b69a3e.origin[0], 2:"key_cache_location_y", 3:params.var_beeb487603b69a3e.origin[0], 4:"key_cache_location_z", 5:params.var_beeb487603b69a3e.origin[0], 6:"merc_camp_name", 7:params.merc_camp_name]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b6
// Size: 0xce
function function_f9799c83791f6627(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].looted_stronghold_keys++;
    }
    if (isdefined(params.var_beeb487603b69a3e)) {
        dlog_recordevent("dlog_event_ob_human_faction_squad_get_stronghold_key", [0:"key_cache_location_x", 1:params.var_beeb487603b69a3e.origin[0], 2:"key_cache_location_y", 3:params.var_beeb487603b69a3e.origin[0], 4:"key_cache_location_z", 5:params.var_beeb487603b69a3e.origin[0], 6:"stronghold_name", 7:params.stronghold_name]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538b
// Size: 0x62
function function_c469f9ef817befa(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].damaged_warlords++;
    }
    if (isdefined(params.var_beeb487603b69a3e)) {
        dlog_recordevent("dlog_event_ob_human_faction_squad_damage_warlord", [0:"warlord_name", 1:params.warlord_name]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53f4
// Size: 0x118
function function_35dc543a1cdaf196(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].killed_warlords++;
    }
    if (isdefined(params)) {
        dlog_recordevent("dlog_event_ob_human_faction_warlord_kill", [0:"warlord_name", 1:params.warlord_name]);
        dlog_recordevent("dlog_event_ob_human_faction_warlord_death_means", [0:"warlord_means", 1:params.var_48abf05cf6177c50, 2:"warlord_name", 3:params.warlord_name]);
        var_208a9bd22d08b9db = params.var_5b949a992945023b - params.var_542053df5d1c8da8;
        dlog_recordevent("dlog_event_ob_human_faction_time_to_death", [0:"warlord_name", 1:params.warlord_name, 2:"stronghold_open_time", 3:params.var_542053df5d1c8da8, 4:"warlord_death_time", 5:params.var_5b949a992945023b, 6:"time_difference", 7:var_208a9bd22d08b9db]);
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5513
// Size: 0x1d9
function function_8f83b501bb98e017() {
    if (!isdefined(self.difficulty_region)) {
        self.difficulty_region = "difficulty_undefined";
    }
    if (isdefined(self.var_fc4ffac4746eb217) && self.var_fc4ffac4746eb217 != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.var_fc4ffac4746eb217;
    } else if (isdefined(self.var_9b1cc6696e335d3) && self.var_9b1cc6696e335d3 != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.var_9b1cc6696e335d3;
    } else if (isdefined(self.var_97e3283eeb5e237b) && self.var_97e3283eeb5e237b != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.var_97e3283eeb5e237b;
    } else if (isdefined(self.var_d9b35da3ea2ca0c4) && isstring(self.var_d9b35da3ea2ca0c4) && self.var_d9b35da3ea2ca0c4 != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.var_d9b35da3ea2ca0c4;
    } else if (isdefined(self.var_71ad773e63984917) && self.var_71ad773e63984917 != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.var_71ad773e63984917;
    }
    if (self.difficulty_region == "difficulty_undefined" && isdefined(level.var_fac39a693f085779)) {
        self.difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_4fda5d7358015a06::function_8988a4c89289d7f4(self));
    }
    return self.difficulty_region;
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f4
// Size: 0x20
function function_bf9ed28219b4e9b9(var_6f8af5eb76deac21) {
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_7abcee67f1c861eb();
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x571b
// Size: 0x1dc
function function_90b2469c5d2c8332(var_6f8af5eb76deac21) {
    if (isdefined(var_6f8af5eb76deac21.playerlist) && isarray(var_6f8af5eb76deac21.playerlist)) {
        self.difficulty_region = function_8f83b501bb98e017();
        foreach (player in var_6f8af5eb76deac21.playerlist) {
            if (isplayer(player)) {
                if (self.category == "Contract") {
                    player.pers["telemetry"].contracts_completed++;
                    var_c9b91b9df43b9cb6 = function_9d71b982e1eb2f81(self.difficulty_region);
                    player.pers["telemetry"].var_f1f0e54434cdf293 = player.pers["telemetry"].var_f1f0e54434cdf293 + (isdefined(rank::getscoreinfoxp(var_c9b91b9df43b9cb6)) ? 0 : rank::getscoreinfoxp(var_c9b91b9df43b9cb6));
                } else if (self.category == "Activity") {
                    player.pers["telemetry"].activities_completed++;
                    if (isdefined(self.var_b90c26f642e9b96e)) {
                        player.pers["telemetry"].var_355ce2c63476b983 = player.pers["telemetry"].var_355ce2c63476b983 + (isdefined(rank::getscoreinfoxp(self.var_b90c26f642e9b96e)) ? 0 : rank::getscoreinfoxp(self.var_b90c26f642e9b96e));
                    }
                }
            }
        }
    }
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_3a269816a495421e();
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58fe
// Size: 0x20
function function_ecc4c25753cd6d64(var_6f8af5eb76deac21) {
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_a7a86fb367a570();
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5925
// Size: 0x20
function function_f1845574e88cb9ee(var_6f8af5eb76deac21) {
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_8d63eecaeee93b02();
    }
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x594c
// Size: 0x9d
function private function_7abcee67f1c861eb(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_abandoned", [0:"activity_type", 1:self.type, 2:"activity_threat_level", 3:self.difficulty_region, 4:"activity_location_x", 5:self.var_35ee2a06aa1f8973[0], 6:"activity_location_y", 7:self.var_35ee2a06aa1f8973[1], 8:"activity_location_z", 9:self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x59f0
// Size: 0x9d
function private function_8d63eecaeee93b02(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_started", [0:"activity_type", 1:self.type, 2:"activity_threat_level", 3:self.difficulty_region, 4:"activity_location_x", 5:self.var_35ee2a06aa1f8973[0], 6:"activity_location_y", 7:self.var_35ee2a06aa1f8973[1], 8:"activity_location_z", 9:self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a94
// Size: 0x9d
function private function_3a269816a495421e(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_completed", [0:"activity_type", 1:self.type, 2:"activity_threat_level", 3:self.difficulty_region, 4:"activity_location_x", 5:self.var_35ee2a06aa1f8973[0], 6:"activity_location_y", 7:self.var_35ee2a06aa1f8973[1], 8:"activity_location_z", 9:self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b38
// Size: 0x9d
function private function_a7a86fb367a570(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_failed", [0:"activity_type", 1:self.type, 2:"activity_threat_level", 3:self.difficulty_region, 4:"activity_location_x", 5:self.var_35ee2a06aa1f8973[0], 6:"activity_location_y", 7:self.var_35ee2a06aa1f8973[1], 8:"activity_location_z", 9:self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb/namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bdc
// Size: 0x5b
function function_7e6c3d2a433ea927(var_d27680ff86693f5c) {
    if (isdefined(var_d27680ff86693f5c.perkref)) {
        self.pers["telemetry"].perks_obtained[self.pers["telemetry"].perks_obtained.size] = var_d27680ff86693f5c.perkref;
    }
}

