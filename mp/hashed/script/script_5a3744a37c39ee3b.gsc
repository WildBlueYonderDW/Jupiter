#using script_16ea1b94f0f381b3;
#using script_185660037b9236c1;
#using script_2590b7a7de3dfc79;
#using script_2669878cf5a1b6bc;
#using script_2707474774db34b;
#using script_41387eecc35b88bf;
#using script_482376d10f69832c;
#using script_4a6760982b403bad;
#using script_58be75c518bf0d40;
#using script_638d701d263ee1ed;
#using script_639bf783929acf9b;
#using script_64316dc775e91122;
#using script_6f65366f542f6627;
#using script_7cfaa6fd841fb4dd;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\engine\throttle;
#using scripts\engine\utility;
#using scripts\mp\rank;
#using scripts\mp\utility\game;
#using scripts\mp\vehicles\damage;

#namespace namespace_7045c8949b4275bb;

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1416
// Size: 0x18a
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

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15a8
// Size: 0x4a
function on_vehicle_spawned(sparams) {
    waitframe();
    vehicle = sparams.vehicle;
    if (!isdefined(vehicle.vehiclename)) {
        return;
    }
    scripts\mp\vehicles\damage::function_21a469b6e2805cf1(vehicle.vehiclename, &function_eef88565476a2f1a);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15fa
// Size: 0x128
function function_eef88565476a2f1a(data) {
    if (!isdefined(data)) {
        return;
    }
    regiondifficulty = "difficulty_easy";
    if (isfunction(level.var_8241e0d86017df29)) {
        regiondifficulty = [[ level.var_8241e0d86017df29 ]](self.origin);
    }
    if (isplayer(data.attacker)) {
        data.attacker dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", ["enter", 0, "exit", 0, "refuel", 0, "repair_tire", 0, "destroyed", 1, "name", self.vehiclename, "threat_level", regiondifficulty, "vehicle_x", self.origin[0], "vehicle_y", self.origin[1], "vehicle_z", self.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x172a
// Size: 0x16e
function function_5f169bceaf46be72(params) {
    if (isdefined(params.vehicle) && isent(params.vehicle) && isplayer(self)) {
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", ["enter", 1, "exit", 0, "refuel", 0, "repair_tire", 0, "destroyed", 0, "name", params.vehicle.vehiclename, "threat_level", regiondifficulty, "vehicle_x", params.vehicle.origin[0], "vehicle_y", params.vehicle.origin[1], "vehicle_z", params.vehicle.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a0
// Size: 0x191
function function_a35b022f55e9ed64(params) {
    if (isdefined(params.vehicle) && isent(params.vehicle) && isplayer(self)) {
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        if (isdefined(params.vehicle) && isent(params.vehicle)) {
            self dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", ["enter", 0, "exit", 1, "refuel", 0, "repair_tire", 0, "destroyed", 0, "name", params.vehicle.vehiclename, "threat_level", regiondifficulty, "vehicle_x", params.vehicle.origin[0], "vehicle_y", params.vehicle.origin[1], "vehicle_z", params.vehicle.origin[2]]);
        }
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a39
// Size: 0x16e
function function_3e4b26b7b8eb8be2(params) {
    if (isdefined(params.vehicle) && isent(params.vehicle) && isplayer(self)) {
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", ["enter", 0, "exit", 0, "refuel", 0, "repair_tire", 1, "destroyed", 0, "name", params.vehicle.vehiclename, "threat_level", regiondifficulty, "vehicle_x", params.vehicle.origin[0], "vehicle_y", params.vehicle.origin[1], "vehicle_z", params.vehicle.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1baf
// Size: 0x192
function on_vehicle_refueled(params) {
    if (isdefined(params.vehicle) && isdefined(params.player) && isent(params.vehicle) && isplayer(params.player)) {
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](params.vehicle.origin);
        }
        params.player dlog_recordplayerevent("dlog_event_ob_player_vehicle_interact", ["enter", 0, "exit", 0, "refuel", 1, "repair_tire", 0, "destroyed", 0, "name", params.vehicle.vehiclename, "threat_level", regiondifficulty, "vehicle_x", params.vehicle.origin[0], "vehicle_y", params.vehicle.origin[1], "vehicle_z", params.vehicle.origin[2]]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d49
// Size: 0x5c
function function_af4c6a6a1f2e94f7(params) {
    if (isdefined(level.activities)) {
        activity_common::function_8b5b2a3392fc7e2a("PlayerAbandon", &function_bf9ed28219b4e9b9);
        activity_common::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_90b2469c5d2c8332);
        activity_common::function_8b5b2a3392fc7e2a("ActivityFailure", &function_ecc4c25753cd6d64);
        activity_common::function_8b5b2a3392fc7e2a("ActivityBegin", &function_f1845574e88cb9ee);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dad
// Size: 0xcd4
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
    if (!isdefined(self.pers["telemetry"].zombie_kills_xp)) {
        self.pers["telemetry"].zombie_kills_xp = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_af3f574708e215b8)) {
        self.pers["telemetry"].var_af3f574708e215b8 = 0;
    }
    if (!isdefined(self.pers["telemetry"].var_b0def0662a1a3bdb)) {
        self.pers["telemetry"].var_b0def0662a1a3bdb = 0;
    }
    if (!isdefined(self.pers["telemetry"].misc_combat)) {
        self.pers["telemetry"].misc_combat = 0;
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
    if (!isdefined(self.pers["telemetry"].third_person)) {
        self.pers["telemetry"].third_person = 0;
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

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a89
// Size: 0x1a9
function on_player_laststand(params) {
    if (isplayer(self) && isagent(self.attacker)) {
        if (isdefined(self.attacker.subclass)) {
            self.pers["telemetry"].ai_attackers_on_laststand[self.pers["telemetry"].ai_attackers_on_laststand.size] = self.attacker.subclass;
        }
        self.lastattacker = self.attacker;
        attackerclass = isdefined(self.attacker.subclass) ? self.attacker.subclass : "unknown";
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](self.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_death", ["was_knocked", 1, "was_killed", 0, "was_revived", 0, "location_x", self.origin[0], "location_y", self.origin[1], "location_z", self.origin[2], "difficulty", regiondifficulty, "attacker", attackerclass]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3a
// Size: 0x81
function on_player_bleedout(params) {
    if (isplayer(self) && isdefined(self.attacker)) {
        if (isdefined(self.attacker.subclass)) {
            self.pers["telemetry"].ai_attackers_on_bleedout[self.pers["telemetry"].ai_attackers_on_bleedout.size] = self.attacker.subclass;
        }
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc3
// Size: 0x13
function on_player_disconnect(data) {
    function_937c131dcec8e814(data);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cde
// Size: 0x73
function function_69ddf7a3e512a18a(data) {
    foreach (player in level.players) {
        data = spawnstruct();
        data.player = player;
        function_937c131dcec8e814(data);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d59
// Size: 0x168
function function_7f921b653404b03c(amount) {
    regiondifficulty = "difficulty_easy";
    if (isfunction(level.var_8241e0d86017df29)) {
        regiondifficulty = [[ level.var_8241e0d86017df29 ]](self.origin);
    }
    switch (regiondifficulty) {
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

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec9
// Size: 0x15c
function function_9e622ced1b338442(sparams) {
    self.pers["telemetry"].essence_earned = self.pers["telemetry"].essence_earned + sparams.amount;
    function_7f921b653404b03c(sparams.amount);
    if (isdefined(sparams.reason)) {
        if (sparams.reason == #"cache") {
            self.pers["telemetry"].essence_from_cache = self.pers["telemetry"].essence_from_cache + sparams.amount;
            return;
        }
        if (sparams.reason == #"sold") {
            self.pers["telemetry"].essence_from_buystation = self.pers["telemetry"].essence_from_buystation + sparams.amount;
            return;
        }
        if (sparams.reason == #"infil_essence") {
            self.pers["telemetry"].infil_essence = sparams.amount;
        }
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x302d
// Size: 0x3b8
function function_961056ec584817fb(sparams) {
    self.pers["telemetry"].essence_spent = self.pers["telemetry"].essence_spent + sparams.amount;
    str_type = "unknown";
    str_specific = "unknown";
    if (isdefined(sparams.reason)) {
        if (sparams.reason == #"magicbox") {
            self.pers["telemetry"].essence_spent_magicbox = self.pers["telemetry"].essence_spent_magicbox + sparams.amount;
            str_type = "magicbox";
        } else if (sparams.reason == #"packapunch") {
            self.pers["telemetry"].essence_spent_pack = self.pers["telemetry"].essence_spent_pack + sparams.amount;
            str_type = "packapunch";
        } else if (sparams.reason == #"perk") {
            self.pers["telemetry"].essence_spent_perk = self.pers["telemetry"].essence_spent_perk + sparams.amount;
            str_type = "perk";
            str_specific = isdefined(sparams.info) ? sparams.info : "unknown";
        } else if (sparams.reason == #"wallbuy") {
            self.pers["telemetry"].essence_spent_wallbuy = self.pers["telemetry"].essence_spent_wallbuy + sparams.amount;
            str_type = "wallbuy";
            str_specific = isdefined(sparams.info) ? sparams.info : "unknown";
        } else if (sparams.reason == #"buystation") {
            self.pers["telemetry"].essence_spent_buystation = self.pers["telemetry"].essence_spent_buystation + sparams.amount;
            str_type = "buystation";
            str_specific = isdefined(sparams.info) ? sparams.info : "unknown";
        } else if (sparams.reason == #"zip_door") {
            str_type = "zip_door";
        }
    }
    regiondifficulty = "difficulty_easy";
    if (isfunction(level.var_8241e0d86017df29)) {
        regiondifficulty = [[ level.var_8241e0d86017df29 ]](self.origin);
    }
    self dlog_recordplayerevent("dlog_event_ob_player_purchase", ["pos_x", self.origin[0], "pos_y", self.origin[1], "pos_z", self.origin[2], "difficulty", regiondifficulty, "essence_spent", sparams.amount, "type_purchased", str_type, "info_purchased", str_specific]);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33ed
// Size: 0x15e
function function_95ca4cec57fb728d(sparams) {
    if (isdefined(sparams.var_65b4e89f87e61c2) && isdefined(sparams.amount) && sparams.var_65b4e89f87e61c2 < sparams.amount) {
        var_9771dcd8890aebbb = sparams.amount - sparams.var_65b4e89f87e61c2;
        self.pers["telemetry"].essence_earned = self.pers["telemetry"].essence_earned + var_9771dcd8890aebbb;
        if (isdefined(sparams.reason) && sparams.reason == #"kill") {
            self.pers["telemetry"].essence_from_kills = self.pers["telemetry"].essence_from_kills + var_9771dcd8890aebbb;
        }
        if (isdefined(sparams.reason) && sparams.reason == #"activity_reward") {
            self.pers["telemetry"].essence_from_activities = self.pers["telemetry"].essence_from_activities + var_9771dcd8890aebbb;
        }
        function_7f921b653404b03c(var_9771dcd8890aebbb);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3553
// Size: 0x91
function on_item_pickup(sparams) {
    if (isdefined(sparams.item) && isdefined(sparams.itembundle)) {
        if (istrue(sparams.itembundle.type == "currency")) {
            self.pers["telemetry"].essence_from_pickup = self.pers["telemetry"].essence_from_pickup + sparams.item.count;
        }
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35ec
// Size: 0x860
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
        player dlog_recordplayerevent("dlog_event_ob_combat_record", ["zombie_kills", player.pers["telemetry"].zombie_kills, "soldier_kills", player.pers["telemetry"].soldier_kills, "boss_kills", player.pers["telemetry"].boss_kills, "elite_kills", player.pers["telemetry"].elite_kills, "special_kills", player.pers["telemetry"].special_kills, "normal_kills", player.pers["telemetry"].normal_kills, "critical_kills", player.pers["telemetry"].critical_kills, "pack_a_punch_kills", player.pers["telemetry"].pack_a_punch_kills, "essence_total", essence_total, "looted_containers", player.pers["telemetry"].looted_containers, "teammates_revived", player.pers["telemetry"].teammates_revived, "contracts_completed", player.pers["telemetry"].contracts_completed, "one_shot_kills", player.pers["telemetry"].one_shot_kills, "essence_earned", player.pers["telemetry"].essence_earned, "essence_spent", player.pers["telemetry"].essence_spent, "essence_from_cache", player.pers["telemetry"].essence_from_cache, "essence_from_pickup", player.pers["telemetry"].essence_from_pickup, "essence_from_kills", player.pers["telemetry"].essence_from_kills, "essence_from_activities", player.pers["telemetry"].essence_from_activities, "match_time_elapsed", player.pers["telemetry"].match_time_elapsed, "essence_from_easy_difficulty", player.pers["telemetry"].essence_from_easy_difficulty, "essence_from_normal_difficulty", player.pers["telemetry"].essence_from_normal_difficulty, "essence_from_hard_difficulty", player.pers["telemetry"].essence_from_hard_difficulty, "essence_from_darkaether_difficulty", player.pers["telemetry"].essence_from_darkaether_difficulty, "essence_spent_wallbuy", player.pers["telemetry"].essence_spent_wallbuy, "essence_spent_pack", player.pers["telemetry"].essence_spent_pack, "essence_spent_magicbox", player.pers["telemetry"].essence_spent_magicbox, "essence_spent_perk", player.pers["telemetry"].essence_spent_perk, "perks_obtained", player.pers["telemetry"].perks_obtained, "essence_from_buystation", player.pers["telemetry"].essence_from_buystation, "essence_spent_buystation", player.pers["telemetry"].essence_spent_buystation, "mangler_kills", player.pers["telemetry"].mangler_kills, "mimic_kills", player.pers["telemetry"].mimic_kills, "disciple_kills", player.pers["telemetry"].disciple_kills, "hellhound_kills", player.pers["telemetry"].hellhound_kills, "base_zombie_kills", player.pers["telemetry"].base_zombie_kills, "light_armor_zombie_kills", player.pers["telemetry"].light_armor_zombie_kills, "heavy_armor_zombie_kills", player.pers["telemetry"].heavy_armor_zombie_kills, "abomination_kills", player.pers["telemetry"].abomination_kills, "deathworm_kills", player.pers["telemetry"].deathworm_kills, "ai_attackers_on_bleedout", player.pers["telemetry"].ai_attackers_on_bleedout, "ai_attackers_on_laststand", player.pers["telemetry"].ai_attackers_on_laststand, "looted_encamptment_keys", player.pers["telemetry"].var_f9df09327f6519ea, "looted_stronghold_keys", player.pers["telemetry"].looted_stronghold_keys, "damaged_warlords", player.pers["telemetry"].damaged_warlords, "killed_warlords", player.pers["telemetry"].killed_warlords, "activities_completed", player.pers["telemetry"].activities_completed, "infil_essence", player.pers["telemetry"].infil_essence, "third_person", player.pers["telemetry"].third_person]);
        player.pers["telemetry"].var_7f5d11228750d896 = 1;
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3e54
// Size: 0x34a
function private function_a6db08193cf5c2dc(attacker, params) {
    player = attacker;
    if (isplayer(player.var_941802a0997e0c42)) {
        player.pers["telemetry"].misc_combat++;
        player.pers["telemetry"].var_1e793bda8b84600f = player.pers["telemetry"].var_1e793bda8b84600f + (isdefined(rank::getscoreinfoxp(#"brainrot_kill")) ? rank::getscoreinfoxp(#"brainrot_kill") : 0);
    }
    if (isdefined(self.var_5ede61272f442abd)) {
        player.pers["telemetry"].misc_combat++;
        player.pers["telemetry"].var_1e793bda8b84600f = player.pers["telemetry"].var_1e793bda8b84600f + (isdefined(rank::getscoreinfoxp(self.var_5ede61272f442abd)) ? rank::getscoreinfoxp(self.var_5ede61272f442abd) : 0);
    }
    if (isdefined(params.sweapon) && isdefined(params.smeansofdeath) && isplayer(params.eattacker)) {
        var_2bd7283211fa61e7 = function_591305dc9c07499b(params.sweapon, params.eattacker, params.smeansofdeath);
        var_4106d2021e226fcd = "none";
        if (var_2bd7283211fa61e7 == "fire" || params.smeansofdeath == "MOD_ELEMENTAL_FIRE") {
            if (!isdefined(params.einflictor) || !is_equal(params.einflictor.weapon_name, "hellhound_molotov")) {
                var_4106d2021e226fcd = #"hash_f09b4f756df11aa4";
                player.pers["telemetry"].misc_combat++;
            }
        } else if (var_2bd7283211fa61e7 == "cold" || params.smeansofdeath == "MOD_ELEMENTAL_COLD") {
            var_4106d2021e226fcd = #"hash_a62035653525d27e";
            player.pers["telemetry"].misc_combat++;
        } else if (var_2bd7283211fa61e7 == "electrical" || params.smeansofdeath == "MOD_ELEMENTAL_ELEC") {
            var_4106d2021e226fcd = #"hash_f48e7e053c787be5";
            player.pers["telemetry"].misc_combat++;
        } else if (var_2bd7283211fa61e7 == "toxic" || params.smeansofdeath == "MOD_ELEMENTAL_TOXIC") {
            var_4106d2021e226fcd = #"hash_e1c37b28b02f43bf";
            player.pers["telemetry"].misc_combat++;
        }
        player.pers["telemetry"].var_1e793bda8b84600f = player.pers["telemetry"].var_1e793bda8b84600f + (isdefined(scripts\mp\rank::getscoreinfoxp(var_4106d2021e226fcd)) ? scripts\mp\rank::getscoreinfoxp(var_4106d2021e226fcd) : 0);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41a6
// Size: 0xa5e
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
    if (isdefined(self) && isdefined(self.var_aaf0465944b061ed) && self.var_aaf0465944b061ed == "warlord_kia" && !isplayer(attacker)) {
        attacker = namespace_64135de19550f047::function_3bd4148272ae66ee(params);
    }
    if (isplayer(attacker)) {
        player = attacker;
        if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
            return;
        }
        if (!isdefined(self.var_d37b75616f7c2ee)) {
            return;
        }
        num_hits = self.var_d37b75616f7c2ee.num_hits;
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
        if (num_hits == 1) {
            player.pers["telemetry"].one_shot_kills++;
        }
        if (vehicle_kill) {
            var_aaf0465944b061ed = points::function_818ac0c0b8f0b22(var_aaf0465944b061ed, "_vehicle");
        }
        if (isdefined(sweapon)) {
            if (!isdefined(level.ob_ai_killed_telemetry_throttle)) {
                level.ob_ai_killed_telemetry_throttle = throttle_initialize("ob_ai_killed_telemetry_throttle", 1, level.framedurationseconds);
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
                var_973199e4a96e0929.incvalue = 1;
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
                    player.pers["telemetry"].var_b0def0662a1a3bdb = player.pers["telemetry"].var_b0def0662a1a3bdb + (isdefined(rank::getscoreinfoxp(var_aaf0465944b061ed)) ? rank::getscoreinfoxp(var_aaf0465944b061ed) : 0);
                    var_973199e4a96e0929.statname = "weapon_boss_zombie_kills";
                }
                player namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_973199e4a96e0929);
            }
            if (player namespace_a4ff02beedc1bce8::get_pap_level(sweapon) > 0) {
                var_2f6c0e8dface9b8c = spawnstruct();
                var_2f6c0e8dface9b8c.weaponname = weaponname;
                var_2f6c0e8dface9b8c.fullweaponname = fullweaponname;
                var_2f6c0e8dface9b8c.incvalue = 1;
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
                var_9a1d6caefd24b9a7.incvalue = 1;
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
                var_afb46069ccac43c8.incvalue = 1;
                var_afb46069ccac43c8.variantid = variantindex;
                var_afb46069ccac43c8.weaponobj = sweapon;
                player.pers["telemetry"].soldier_kills++;
                var_afb46069ccac43c8.statname = "weapon_soldier_kills";
                player namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_afb46069ccac43c8);
                player.pers["telemetry"].var_af3f574708e215b8 = player.pers["telemetry"].var_af3f574708e215b8 + (isdefined(rank::getscoreinfoxp(var_aaf0465944b061ed)) ? rank::getscoreinfoxp(var_aaf0465944b061ed) : 0);
            } else if (type == "zombie") {
                player.pers["telemetry"].zombie_kills++;
                player.pers["telemetry"].zombie_kills_xp = player.pers["telemetry"].zombie_kills_xp + (isdefined(rank::getscoreinfoxp(var_aaf0465944b061ed)) ? rank::getscoreinfoxp(var_aaf0465944b061ed) : 0);
            }
            var_3a0b9ff4afaae205 = spawnstruct();
            var_3a0b9ff4afaae205.weaponname = weaponname;
            var_3a0b9ff4afaae205.fullweaponname = fullweaponname;
            var_3a0b9ff4afaae205.incvalue = 1;
            var_3a0b9ff4afaae205.variantid = variantindex;
            var_3a0b9ff4afaae205.weaponobj = sweapon;
            var_3a0b9ff4afaae205.statname = "weapon_white_rarity_kills";
            rarity_weapon = player function_ed7c10f78d0598f2(sweapon);
            if (isdefined(rarity_weapon)) {
                switch (rarity_weapon) {
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

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c0c
// Size: 0x170
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
        player dlog_recordplayerevent("dlog_event_ob_player_infil_complete", ["player_x", player.origin[0], "player_y", player.origin[1], "player_z", player.origin[2], "backpack_items", var_7838b9df983ad1ea, "loadout_items", var_a1fc16d2ea055338, "acquisition_items", var_e41a3129bc5710b, "schematic_items", var_a91c6541c62b2649]);
        waitframe();
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d84
// Size: 0x18a
function function_6b954969ae3c0e97(data) {
    data.player dlog_recordplayerevent("dlog_event_ob_player_extraction_complete", ["team", data.current_team, "player_x", data.x, "player_y", data.y, "player_z", data.z, "player_pitch", data.xrot, "player_yaw", data.yrot, "player_roll", data.zrot, "match_time_elapsed", data.matchtimeelapsed, "extraction_type", data.var_a6b3fae0395f75c3, "essence_total", data.essence_total, "backpack_items", data.backpackitems, "loadout_items", data.loadoutitems, "acquisition_items", data.acquisitionitems, "schematic_items", data.schematicitems, "threat_level", data.difficulty]);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f16
// Size: 0x65
function function_135da259745a566d(params) {
    if (isplayer(params.player)) {
        params.player dlog_recordplayerevent("dlog_event_ob_player_mission_completed", ["id", params.id, "ref", params.ref]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f83
// Size: 0x19b
function on_player_death(params) {
    if (isplayer(self) && isagent(self.lastattacker)) {
        attackerclass = isdefined(self.lastattacker.subclass) ? self.lastattacker.subclass : "unknown";
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](self.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_death", ["was_knocked", 0, "was_killed", 1, "was_revived", 0, "location_x", self.origin[0], "location_y", self.origin[1], "location_z", self.origin[2], "difficulty", regiondifficulty, "attacker", attackerclass]);
    }
    squadmembers = squad_utility::getsquadmembers();
    foreach (player in squadmembers) {
        if (isalive(player)) {
            return;
        }
    }
    function_4828fb386ec572ba();
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5126
// Size: 0xc4
function function_4828fb386ec572ba() {
    activitystruct = namespace_cde84ab88f41f1a5::function_5cc2fd3d10cbab56(self);
    if (isdefined(activitystruct.var_6346961d07f668fe)) {
        var_2d25d18d189a363a = namespace_70aa82e7f409bc33::function_1f3e343912ae15c5(activitystruct.var_6346961d07f668fe);
        activity_type = var_2d25d18d189a363a.type;
    }
    dlog_recordevent("dlog_event_ob_team_eliminated", ["team", self.team, "survival_time", gettime() - level.starttime, "activity_type", isdefined(activity_type) ? activity_type : "none", "was_rift_run", istrue(self.rift_run)]);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51f2
// Size: 0x171
function on_player_revived(params) {
    if (isplayer(params.reviver)) {
        params.reviver.pers["telemetry"].teammates_revived++;
    }
    if (isplayer(self) && isagent(self.lastattacker)) {
        attackerclass = isdefined(self.lastattacker.subclass) ? self.lastattacker.subclass : "unknown";
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](self.origin);
        }
        self dlog_recordplayerevent("dlog_event_ob_player_death", ["was_knocked", 0, "was_killed", 0, "was_revived", 1, "location_x", self.origin[0], "location_y", self.origin[1], "location_z", self.origin[2], "difficulty", regiondifficulty, "attacker", attackerclass]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x536b
// Size: 0x1c5
function function_666ae1db00355d4e(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].looted_containers++;
    }
    if (isdefined(params) && isdefined(params.cacheinstance) && isdefined(params.items)) {
        regiondifficulty = "difficulty_easy";
        if (isfunction(level.var_8241e0d86017df29)) {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]](params.cacheinstance.origin);
        }
        cache_items = [];
        foreach (item in params.items) {
            if (isdefined(item.lootid)) {
                cache_items[cache_items.size] = item.lootid;
            }
        }
        dlog_recordevent("dlog_event_ob_cache_looted", ["cache_type", params.cacheinstance.type, "cache_threat_level", regiondifficulty, "cache_location_x", params.cacheinstance.origin[0], "cache_location_y", params.cacheinstance.origin[1], "cache_location_z", params.cacheinstance.origin[2], "items", cache_items]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5538
// Size: 0xcd
function function_c26e120a006454f3(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].var_f9df09327f6519ea++;
    }
    if (isdefined(params.cacheinstance)) {
        dlog_recordevent("dlog_event_ob_human_faction_squad_get_encampment_key", ["key_cache_location_x", params.cacheinstance.origin[0], "key_cache_location_y", params.cacheinstance.origin[0], "key_cache_location_z", params.cacheinstance.origin[0], "merc_camp_name", params.merc_camp_name]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x560d
// Size: 0xcd
function function_f9799c83791f6627(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].looted_stronghold_keys++;
    }
    if (isdefined(params.cacheinstance)) {
        dlog_recordevent("dlog_event_ob_human_faction_squad_get_stronghold_key", ["key_cache_location_x", params.cacheinstance.origin[0], "key_cache_location_y", params.cacheinstance.origin[0], "key_cache_location_z", params.cacheinstance.origin[0], "stronghold_name", params.stronghold_name]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56e2
// Size: 0x61
function function_c469f9ef817befa(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].damaged_warlords++;
    }
    if (isdefined(params.cacheinstance)) {
        dlog_recordevent("dlog_event_ob_human_faction_squad_damage_warlord", ["warlord_name", params.warlord_name]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x574b
// Size: 0x118
function function_35dc543a1cdaf196(params) {
    if (isplayer(self)) {
        self.pers["telemetry"].killed_warlords++;
    }
    if (isdefined(params)) {
        dlog_recordevent("dlog_event_ob_human_faction_warlord_kill", ["warlord_name", params.warlord_name]);
        dlog_recordevent("dlog_event_ob_human_faction_warlord_death_means", ["warlord_means", params.var_48abf05cf6177c50, "warlord_name", params.warlord_name]);
        timedifference = params.var_5b949a992945023b - params.var_542053df5d1c8da8;
        dlog_recordevent("dlog_event_ob_human_faction_time_to_death", ["warlord_name", params.warlord_name, "stronghold_open_time", params.var_542053df5d1c8da8, "warlord_death_time", params.var_5b949a992945023b, "time_difference", timedifference]);
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x586b
// Size: 0x1d8
function function_8f83b501bb98e017() {
    if (!isdefined(self.difficulty_region)) {
        self.difficulty_region = "difficulty_undefined";
    }
    if (isdefined(self.region_difficulty) && self.region_difficulty != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.region_difficulty;
    } else if (isdefined(self.var_9b1cc6696e335d3) && self.var_9b1cc6696e335d3 != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.var_9b1cc6696e335d3;
    } else if (isdefined(self.region_string) && self.region_string != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.region_string;
    } else if (isdefined(self.difficulty_settings) && isstring(self.difficulty_settings) && self.difficulty_settings != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.difficulty_settings;
    } else if (isdefined(self.routedifficulty) && self.routedifficulty != "difficulty_undefined" && self.difficulty_region == "difficulty_undefined") {
        self.difficulty_region = self.routedifficulty;
    }
    if (self.difficulty_region == "difficulty_undefined" && isdefined(level.var_fac39a693f085779)) {
        self.difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_4fda5d7358015a06::function_8988a4c89289d7f4(self));
    }
    return self.difficulty_region;
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a4c
// Size: 0x1f
function function_bf9ed28219b4e9b9(var_6f8af5eb76deac21) {
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_7abcee67f1c861eb();
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a73
// Size: 0x1d9
function function_90b2469c5d2c8332(var_6f8af5eb76deac21) {
    if (isdefined(var_6f8af5eb76deac21.playerlist) && isarray(var_6f8af5eb76deac21.playerlist)) {
        self.difficulty_region = function_8f83b501bb98e017();
        foreach (player in var_6f8af5eb76deac21.playerlist) {
            if (isplayer(player)) {
                if (self.category == "Contract") {
                    player.pers["telemetry"].contracts_completed++;
                    scoreeventstring = function_9d71b982e1eb2f81(self.difficulty_region);
                    player.pers["telemetry"].var_f1f0e54434cdf293 = player.pers["telemetry"].var_f1f0e54434cdf293 + (isdefined(rank::getscoreinfoxp(scoreeventstring)) ? rank::getscoreinfoxp(scoreeventstring) : 0);
                    continue;
                }
                if (self.category == "Activity") {
                    player.pers["telemetry"].activities_completed++;
                    if (isdefined(self.var_b90c26f642e9b96e)) {
                        player.pers["telemetry"].var_355ce2c63476b983 = player.pers["telemetry"].var_355ce2c63476b983 + (isdefined(rank::getscoreinfoxp(self.var_b90c26f642e9b96e)) ? rank::getscoreinfoxp(self.var_b90c26f642e9b96e) : 0);
                    }
                }
            }
        }
    }
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_3a269816a495421e();
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c54
// Size: 0x1f
function function_ecc4c25753cd6d64(var_6f8af5eb76deac21) {
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_a7a86fb367a570();
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c7b
// Size: 0x1f
function function_f1845574e88cb9ee(var_6f8af5eb76deac21) {
    if (!istrue(self.var_bbbbbc7263f1c834)) {
        function_8d63eecaeee93b02();
    }
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5ca2
// Size: 0x9c
function private function_7abcee67f1c861eb(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_abandoned", ["activity_type", self.type, "activity_threat_level", self.difficulty_region, "activity_location_x", self.var_35ee2a06aa1f8973[0], "activity_location_y", self.var_35ee2a06aa1f8973[1], "activity_location_z", self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5d46
// Size: 0x9c
function private function_8d63eecaeee93b02(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_started", ["activity_type", self.type, "activity_threat_level", self.difficulty_region, "activity_location_x", self.var_35ee2a06aa1f8973[0], "activity_location_y", self.var_35ee2a06aa1f8973[1], "activity_location_z", self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5dea
// Size: 0x9c
function private function_3a269816a495421e(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_completed", ["activity_type", self.type, "activity_threat_level", self.difficulty_region, "activity_location_x", self.var_35ee2a06aa1f8973[0], "activity_location_y", self.var_35ee2a06aa1f8973[1], "activity_location_z", self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5e8e
// Size: 0x9c
function private function_a7a86fb367a570(params) {
    self.difficulty_region = function_8f83b501bb98e017();
    dlog_recordevent("dlog_event_ob_activity_failed", ["activity_type", self.type, "activity_threat_level", self.difficulty_region, "activity_location_x", self.var_35ee2a06aa1f8973[0], "activity_location_y", self.var_35ee2a06aa1f8973[1], "activity_location_z", self.var_35ee2a06aa1f8973[2]]);
}

// Namespace namespace_7045c8949b4275bb / namespace_eb8f5865ee35e03b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f32
// Size: 0x5a
function function_7e6c3d2a433ea927(sparams) {
    if (isdefined(sparams.perkref)) {
        self.pers["telemetry"].perks_obtained[self.pers["telemetry"].perks_obtained.size] = sparams.perkref;
    }
}

