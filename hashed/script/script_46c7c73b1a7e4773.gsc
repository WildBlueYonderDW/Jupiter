// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\challenges.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\common\vehicle.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_6a8ec730b2bfa844;
#using script_2669878cf5a1b6bc;
#using script_2590b7a7de3dfc79;
#using script_58be75c518bf0d40;
#using script_64316dc775e91122;
#using script_639bf783929acf9b;
#using script_38eb8f4be20d54f4;
#using script_427ce33ec0c820cf;
#using script_3214e6fcdce468a7;
#using scripts\engine\math.gsc;
#using script_600b944a95c3a7bf;
#using script_686729055b66c6e4;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using script_398835140857d740;
#using script_749ff6f56673a813;
#using script_3e2f8cc477d57433;
#using script_1f97a44d1761c919;
#using scripts\mp\supers.gsc;
#using scripts\mp\flags.gsc;
#using script_5d8202968463a21d;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\cp_mp\dragonsbreath.gsc;
#using scripts\cp_mp\crossbow.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_7c40fa80892a721;

#namespace namespace_9dcaa84266dc73e2;

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c2a
// Size: 0x9a5
function function_ea5d8dfcc9a28411() {
    if (!challengesenabled()) {
        return;
    }
    level.var_3fe26a6edf03f4f5 = [];
    level.var_176c53feca4a2a03 = [];
    level.var_fd85a760f9e601f6 = throttle::function_e4c99b0f178ffb98("zombieChallengesOnZombieAiKilled", 1, level.framedurationseconds);
    level.var_1ba18dd27f458f88 = throttle::function_e4c99b0f178ffb98("playerChallengesOnAgentAiKilled", 1, level.framedurationseconds);
    callback::add("on_pmc_mission_completed", &function_135da259745a566d);
    callback::add("on_pmc_mission_step_complete", &function_20a93cb9e4f580fe);
    callback::add("on_pmc_mission_tier_complete", &function_9fe3364da6f70780);
    callback::add("player_spawned", &on_player_spawned);
    callback::add("magicbox_purchase", &function_6a7cf6856f3e681);
    callback::add("wallbuy_purchase", &function_de9f828fd5fb2dc3);
    callback::add("on_ai_killed", &function_e5ea18b76842725f);
    callback::add("player_item_pickup", &on_item_pickup);
    callback::add("loot_crystal_destroyed", &loot_crystal_destroyed);
    callback::add("on_zombie_ai_spawned", &on_zombie_ai_spawned);
    callback::add("on_vehicle_spawned", &on_vehicle_spawned);
    callback::add("on_pap_machine_purchase", &on_pap_machine_purchase);
    callback::add("on_tesla_storm_stunned", &on_tesla_storm_stunned);
    callback::add("ammomod_proc", &function_7e993967c3cfc6c9);
    callback::add("on_tacmap_ping_scriptable_or_ent", &on_tacmap_ping_scriptable_or_ent);
    callback::add("register_activities", &function_af4c6a6a1f2e94f7);
    callback::add("exfil_success", &function_70fef3c29291be77);
    callback::add("on_turret_trap_circuit_added", &function_625e98d18b3d55a2);
    callback::add("item_exfiled", &function_93a828d2f14b2a77);
    callback::add("weapon_exfiled", &function_1a63a8486a277ac8);
    callback::add("ob_weaponstash_drill_notPaused", &function_654c053523c6f5f6);
    callback::add("safe_opened", &function_c170c9d5fe107d4c);
    callback::add("merc_stronghold_cleared", &function_438364b427391b60);
    callback::add("zm_perk_obtained", &function_def7cd4658600e1a);
    callback::add("player_region_difficulty_change", &function_61691a3175d3e844);
    callback::add("on_spawn_redeploy_drone", &function_4f322f99eb988e83);
    callback::add("ava_activated_uavTower", &function_948301ad97e24c18);
    callback::add("ava_located", &function_a7cf9a60c8407c0);
    callback::add("ava_defended", &function_28c89f81cdaa9d97);
    callback::add("escaped_with_ava", &function_2a7867137131b412);
    callback::add("destroyed_sam_shepherd", &function_5f52ca88d2ee165);
    callback::add("secured_airdrop_shepherd", &function_c3cb09ac0cc5bb8c);
    callback::add("escorted_vehicle_shepherd", &function_5f4bea465b992020);
    callback::add("defended_escort_shepherd", &function_9cf351a917bdb260);
    callback::add("fight_to_stronghold_zakhaev", &function_b08965cd9e357396);
    callback::add("place_explosive_zakhaev", &function_7ddbc5d5709f0565);
    callback::add("clear_stronghold_zakhaev", &function_4dc500ccd9ff3cbc);
    callback::add("defend_scrambler_zakhaev", &function_6cfc34c8585e3810);
    callback::add("defeat_worm_zakhaev", &function_bd6f213cdc70081);
    callback::add("player_entered_radiation", &function_4ffcd177964e72b2);
    callback::add("player_exited_radiation", &function_1fb60c4452a392c8);
    callback::add("ammo_mod_equipped", &function_b05b488b03740449);
    callback::add("infilled_with_super", &function_979b0b77c84e497f);
    callback::add("player_near_extractor", &function_1e972a37f996a61c);
    callback::add("player_near_radio_tower", &function_ea321f874c7d825);
    callback::add("player_tac_map_toggled", &function_7078fecde61ab0db);
    callback::add("player_vehicle_enter", &function_5f169bceaf46be72);
    callback::add("magicbox_used", &function_eb1506a06c31da2b);
    callback::add("remote_turret_deployed", &function_7758c4422a68f415);
    callback::add("aethernest_approach", &function_8e07c089e889784f);
    callback::add("big_bounty_started", &function_da6e19f48f3340b8);
    callback::add("on_vehicle_tire_repaired", &function_4b8d35d7af7fd960);
    callback::add("on_vehicle_refueled", &on_vehicle_refueled);
    callback::add("zm_packed_weapon", &function_984089fc6559a650);
    callback::add("lootcache_looted", &function_8b134141131f364a);
    callback::add("on_used_super", &function_a5e16566a91e9488);
    callback::add("on_turned", &function_65ec7747ff7a397a);
    callback::add("spore_control_started", &function_628a2357515e077a);
    callback::add("cargo_delivery_started", &function_fbab6a79ccb766d2);
    callback::add("approached_merc_camp", &function_a9d19f968e2f15e9);
    callback::add("merc_camp_success", &function_ed0bb8717f31f954);
    callback::add("merc_camp_fail", &function_d88408f2a5adf639);
    callback::add("merc_camp_looted", &function_5470291610d91652);
    callback::add("player_laststand", &on_player_laststand);
    callback::add("on_spawn_redeploy_drone", &on_spawn_redeploy_drone);
    callback::add("on_spawn_harvester_orb", &function_83ba63f5ccc1143e);
    callback::add("weapon_stash_started", &function_a14a93ab2f0b86d1);
    callback::add("killstreak_equipped", &function_3cde22ad6d42a269);
    callback::add("zombie_score_event", &function_c99db6b18ad62976);
    callback::add("on_exfil_exiting_ao", &on_exfil_exiting_ao);
    callback::add("player_damaged", &on_player_damaged);
    callback::add("on_soldier_ai_damaged", &function_3cd8cd54ce47110a);
    callback::add("on_zombie_ai_damaged", &function_3cd8cd54ce47110a);
    callback::add("on_outlast_arrive", &on_outlast_arrive);
    callback::add("on_approach_zm_stronghold", &on_approach_zm_stronghold);
    callback::add("approached_gunship", &function_7f2dd34d9517d2c6);
    callback::add("kiosk_item_sold", &function_c9293fc51ab4bfeb);
    callback::add("abomination_swallow_grenade", &function_876eed02bb717d72);
    callback::add("energy_mine_convoy_stopped", &function_1d29b3ce33c72a69);
    callback::add("harvester_orb_damaged", &function_22de5391f273b6bf);
    callback::add("player_revived", &on_player_revived);
    callback::add("zm_perk_elemental_pop_proc", &function_900df0cbd73e399b);
    callback::add("aethernest_cyst_destroyed", &function_735905adf14f7ebc);
    callback::add("on_approach_convoy", &on_approach_convoy);
    callback::add("on_convoy_begin", &on_convoy_begin);
    callback::add("on_engage_convoy", &on_engage_convoy);
    callback::add("on_destroy_convoy", &on_destroy_convoy);
    callback::add("veh_on_convoy_ended", &veh_on_convoy_ended);
    callback::add("on_approach_merc_stronghold", &on_approach_merc_stronghold);
    callback::add("merc_stronghold_nokey", &function_816b42385497212a);
    callback::add("on_unlock_merc_stronghold", &on_unlock_merc_stronghold);
    callback::add("on_merc_stronghold_cleared_vo", &on_merc_stronghold_cleared_vo);
    callback::add("on_merc_stronghold_reinforcement", &on_merc_stronghold_reinforcement);
    callback::add("on_outlast_start", &on_outlast_start);
    callback::add("on_approach_outlast_pnd", &on_approach_outlast_pnd);
    callback::add("on_outlast_progress_degrade", &on_outlast_progress_degrade);
    callback::add("on_outlast_success", &on_outlast_success);
    callback::add("on_abandon_outlast_contract", &on_abandon_outlast_contract);
    callback::add("on_sabotage_start", &on_sabotage_start);
    callback::add("on_abandon_sabotage_contract", &on_abandon_sabotage_contract);
    callback::add("on_sabotage_failure_nocannister", &on_sabotage_failure_nocannister);
    callback::add("on_sabotage_success_nocannister", &on_sabotage_success_nocannister);
    callback::add("on_sabotage_success_withcannister", &on_sabotage_success_withcannister);
    callback::add("on_merc_defend_started", &on_merc_defend_started);
    callback::add("on_merc_defend_approach_refractor", &on_merc_defend_approach_refractor);
    callback::add("on_merc_defend_damage_25", &on_merc_defend_damage_25);
    callback::add("on_merc_defend_success", &on_merc_defend_success);
    callback::add("merc_warlord_success", &function_d4f961679a3612e2);
    callback::add("merc_warlord_death", &function_2ca2263723de3b23);
    callback::add("player_used_item", &function_94545a9bb0878e0e);
    callback::add("phd_flopper_killed", &function_defeb316e4a936c);
    callback::add("weapon_stash_completed", &function_81747fd819153293);
    callback::add("on_super_ready", &on_super_ready);
    callback::add("exfil_acknowledged", &function_7c8dbb063c0e860c);
    callback::add("field_upgrade_used", &function_6685ae90a5b68220);
    callback::add("on_merc_camp_recon_destroyed", &on_merc_camp_recon_destroyed);
    callback::add("vehicle_explode", &function_c2fa6446b3ec956f);
    callback::add("on_enemy_cryofreeze", &function_73246c2cbf5948fb);
    callback::add("on_powerup_nuke_pickup", &on_powerup_nuke_pickup);
    level function_53f4bb14857d9b44("id_assignPlayerKillModifiersTrimmed", &function_3875d2b5b87e7e7d);
    level function_53f4bb14857d9b44("id_healing_aura_heal", &function_cf64989979528904);
    level.var_3dacdac07404670c = [];
    level thread function_68feab32966b29b8();
    level.var_4a486ba98909b396 = 1;
    level.var_53677277fc550387 = &function_380c0caf9e64a771;
    level.var_f932763b261a721f = &function_9c039c6daa449c38;
    level.var_87a8b21898e26133 = &function_182aeec2e4e170de;
    level.var_667b02b5d11ccfcb = &function_35b3a590197d97a6;
    function_340f1f6cb09800d6();
    level.var_cf8d941509d44c64 = function_e4c99b0f178ffb98("zombie_challenges_heli", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
    level.var_16aba0b1e426588e = function_e4c99b0f178ffb98("zombie_challenges_convoy", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
    level.var_844aeaa09ef5dd5a = function_e4c99b0f178ffb98("zombie_challenges_destconvoy", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
    level.var_1d8645b41c9cb6a0 = function_e4c99b0f178ffb98("zombie_challenges_drone", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
    level.var_972268e38976b7a9 = function_e4c99b0f178ffb98("zombie_challenges_orb", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
    /#
        level thread function_a0dc56fbe58ef8c3();
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55d6
// Size: 0x3b
function function_340f1f6cb09800d6() {
    function_6c8b18941d0a604d();
    function_adb26e28d3408dac();
    function_63663f994d4e7634();
    function_d89978ce1f60dfc();
    function_cde7564c165a0bf1();
    function_2647e6d2c835793e();
    function_569430d5aed94ffd();
    function_82d4524b2566958a();
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5618
// Size: 0x5d
function function_af4c6a6a1f2e94f7(params) {
    if (isdefined(level.var_83abcb9b3a5dbe24)) {
        function_8b5b2a3392fc7e2a("ActivitySuccess", &function_4b0eddcc1928fa56);
        function_8b5b2a3392fc7e2a("ActivityFailure", &function_748c2bebf6e2765b);
        function_8b5b2a3392fc7e2a("ActivityBegin", &function_16afc8d96fd3de0c);
        function_8b5b2a3392fc7e2a("PlayerJoin", &function_3b2ed72578533fe0);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x567c
// Size: 0x8c2
function function_be1f0a84acb0ed97(var_3a99d1cafe4a4bac, var_d27680ff86693f5c, var_d4a58a5ad5a66ed, var_494c20dbf01ad08c, var_a0aa10131c98134a) {
    var_fc650d192ee6243 = var_d4a58a5ad5a66ed;
    var_151fa81d56a14612 = var_494c20dbf01ad08c;
    var_d28c6116660bb280 = var_a0aa10131c98134a;
    var_fe5a1e73a59d3b04 = spawnstruct();
    throttle::function_f632348cbb773537(level.var_fd85a760f9e601f6, var_fe5a1e73a59d3b04);
    var_cb9bc0821d0eee8d = function_6c8b18941d0a604d();
    var_7f56c75cde4fea6c = function_adb26e28d3408dac();
    var_3e963b841cdedb62 = function_63663f994d4e7634();
    if (isplayer(var_d27680ff86693f5c.eattacker)) {
        if (!isdefined(var_d27680ff86693f5c.eattacker.var_ae035a44da08bfab)) {
            var_d27680ff86693f5c.eattacker.var_ae035a44da08bfab = 0;
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.var_ae035a44da08bfab)) {
            var_d27680ff86693f5c.eattacker.var_ae035a44da08bfab++;
        }
        if (function_18a53d77df35c4c9(var_d27680ff86693f5c.eattacker, 16819) && !mod(var_d27680ff86693f5c.eattacker.var_ae035a44da08bfab, 5)) {
            if (var_d27680ff86693f5c.eattacker ent_flag("frenzied_guard_active")) {
                item = function_38e113a4c30f6c0d("obloot_ava_intel_frenzied_guard", var_3a99d1cafe4a4bac.origin, var_3a99d1cafe4a4bac.angles, 0, 1);
                if (isdefined(item)) {
                    var_d27680ff86693f5c.eattacker thread function_c537a191b851482f(item, "obloot_ava_intel_frenzied_guard");
                }
            }
        }
    }
    if (isplayer(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.sweapon)) {
        var_d28c6116660bb280 = level function_32126a54e0e1055c(var_d28c6116660bb280, var_3a99d1cafe4a4bac.subclass, var_3a99d1cafe4a4bac.var_53525e5d094a332b, var_3a99d1cafe4a4bac.var_aaf0465944b061ed);
        if (var_d27680ff86693f5c.eattacker ent_flag("frenzied_guard_active")) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["frenzied_guard_kill"]);
            if (isdefined(var_3a99d1cafe4a4bac.aicategory) && (var_3a99d1cafe4a4bac.aicategory == "special" || var_3a99d1cafe4a4bac.aicategory == "elite")) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["special_elite_frenzied_guard_kill"]);
            }
            var_d27680ff86693f5c.eattacker thread function_da06d69b0b66e612(14882, "quest_s0a1t5_bringemon_start", undefined, 1);
        }
        if (istrue(var_d27680ff86693f5c.eattacker.var_f2f5db77ae69537f)) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["aether_shroud_kill_zombie"]);
        }
        if (var_3a99d1cafe4a4bac.tesla_storm_stunned) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["tesla_storm_kill_zombie"]);
        }
        if (var_3a99d1cafe4a4bac.cryofreeze_active) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["cryofreeze_kill"]);
        }
        if (var_3a99d1cafe4a4bac.frost_blast_active) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["frost_blast_kill"]);
        }
        if (var_3a99d1cafe4a4bac.energy_mine_kill) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["energy_mine_kill_zombie"]);
        }
        if (function_fc64178f71375137(level.var_3fe26a6edf03f4f5, var_d27680ff86693f5c.sweapon)) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["wallbuy_kill"]);
        }
        if (function_fc64178f71375137(level.var_176c53feca4a2a03, var_d27680ff86693f5c.sweapon)) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["magicbox_kill"]);
        }
        if (issharedfuncdefined("zombie", "get_pap_level")) {
            var_29a8ba8c9dd43fd2 = var_d27680ff86693f5c.eattacker function_af5127390d3221e9(var_d27680ff86693f5c.sweapon);
        }
        if (isdefined(var_29a8ba8c9dd43fd2) && var_29a8ba8c9dd43fd2 >= 1) {
            if (isdefined(level.var_8241e0d86017df29)) {
                var_988cd9a9c749ee11 = [[ level.var_8241e0d86017df29 ]](var_3a99d1cafe4a4bac.origin);
                switch (var_988cd9a9c749ee11) {
                case #"hash_5343b465e56ec9a4":
                case #"hash_651f76c0ad6741ec":
                case #"hash_7bb2cd766703d463":
                case #"hash_af83e47edfa8900a":
                    var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["pap_kill_zombie_level_1_yellow_or_higher"]);
                    break;
                }
            }
        }
        if (isdefined(var_29a8ba8c9dd43fd2) && var_29a8ba8c9dd43fd2 >= 2) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["pap_kill_zombie_level_2"]);
            if (is_equal(var_3a99d1cafe4a4bac.aicategory, "special")) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["pap_kill_zombie_special_level_2"]);
            }
        }
        if (isdefined(var_29a8ba8c9dd43fd2) && var_29a8ba8c9dd43fd2 >= 3) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["pap_kill_zombie_level_3"]);
            if (is_equal(var_3a99d1cafe4a4bac.aicategory, "elite")) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["pap_kill_zombie_elite_level_3"]);
            }
        }
        if (isdefined(var_29a8ba8c9dd43fd2) && var_29a8ba8c9dd43fd2 != 0) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["pap_kill"]);
        }
        if (isdefined(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24.var_6346961d07f668fe)) {
            var_fc650d192ee6243 = level function_9966e6739036c441(var_fc650d192ee6243, var_d27680ff86693f5c, "zombie", var_3a99d1cafe4a4bac.subclass, var_3a99d1cafe4a4bac.var_53525e5d094a332b);
            var_151fa81d56a14612 = level function_128985eaf12e0ed8(var_151fa81d56a14612, var_d27680ff86693f5c, "zombie", var_3a99d1cafe4a4bac.subclass, var_3a99d1cafe4a4bac.var_53525e5d094a332b);
        }
        if (isdefined(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.eattacker.var_f0571de00436dc5)) {
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["redeploy_drone_zombie_kill"]);
        }
        if (isdefined(var_d27680ff86693f5c.eattacker) && var_d27680ff86693f5c.eattacker ent_flag_exist("in_radiation")) {
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["aether_storm_orange_zombie_kill"]);
            if (isdefined(var_3a99d1cafe4a4bac.subclass) && var_3a99d1cafe4a4bac.subclass == "zombie_disciple_hvt_stormcaller") {
                var_d27680ff86693f5c.eattacker function_f10f600ac4ee4c09("aether_storm_special_intel_collected", 2);
            }
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.vehicle) && is_equal(var_d27680ff86693f5c.eattacker.currentweapon.classname, "turret")) {
            var_69997e51685c46d9 = var_cb9bc0821d0eee8d["vehicle_turret_zombie_kill"];
            if (isdefined(var_69997e51685c46d9)) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
            }
        }
        switch (var_3a99d1cafe4a4bac.subclass) {
        case #"hash_2f5c52f1e6ef9284":
            if (var_3a99d1cafe4a4bac.napalm_burned) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["napalmburst_burning_kill"]);
            }
            break;
        default:
            break;
        }
        if (isdefined(var_3a99d1cafe4a4bac.subclass) && var_3a99d1cafe4a4bac.subclass == "zombie_hellhound") {
            if (var_3a99d1cafe4a4bac.cryofreeze_active) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["schematic_cryofreeze_kill"]);
            }
        }
        if (isdefined(var_d27680ff86693f5c.einflictor.streakinfo) && isdefined(var_d27680ff86693f5c.einflictor.streakinfo.streakname)) {
            if (var_d27680ff86693f5c.einflictor.streakinfo.streakname == "sentry_gun") {
                var_69997e51685c46d9 = var_cb9bc0821d0eee8d["killstreak_turret_zombie_kill"];
                if (isdefined(var_69997e51685c46d9)) {
                    var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
                }
            }
        }
        if (isdefined(var_d27680ff86693f5c.einflictor)) {
            if (isdefined(var_d27680ff86693f5c.einflictor.code_classname) && var_d27680ff86693f5c.einflictor.code_classname == "script_vehicle") {
                var_69997e51685c46d9 = var_cb9bc0821d0eee8d["vehicle_kill"];
                if (isdefined(var_69997e51685c46d9)) {
                    var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
                }
            }
        }
    } else {
        var_42a08b1fb177cfa0 = undefined;
        if (isdefined(var_d27680ff86693f5c.eattacker) && isplayer(var_d27680ff86693f5c.eattacker.var_941802a0997e0c42)) {
            var_42a08b1fb177cfa0 = var_d27680ff86693f5c.eattacker.var_941802a0997e0c42;
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["brainrot_kill"]);
        }
        if (isdefined(var_42a08b1fb177cfa0)) {
            return [0:var_fc650d192ee6243, 1:var_151fa81d56a14612, 2:var_d28c6116660bb280, 3:var_42a08b1fb177cfa0];
        }
    }
    return [0:var_fc650d192ee6243, 1:var_151fa81d56a14612, 2:var_d28c6116660bb280];
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f46
// Size: 0x4ac
function function_e5ea18b76842725f(var_d27680ff86693f5c) {
    player = var_d27680ff86693f5c.eattacker;
    var_3a99d1cafe4a4bac = spawnstruct();
    var_3a99d1cafe4a4bac.subclass = self.subclass;
    var_3a99d1cafe4a4bac.aicategory = self.aicategory;
    var_3a99d1cafe4a4bac.origin = self.origin;
    var_3a99d1cafe4a4bac.angles = self.angles;
    var_3a99d1cafe4a4bac.tesla_storm_stunned = ent_flag("tesla_storm_stunned");
    var_3a99d1cafe4a4bac.cryofreeze_active = ent_flag("cryofreeze_active");
    var_3a99d1cafe4a4bac.frost_blast_active = ent_flag("frost_blast_active");
    var_3a99d1cafe4a4bac.energy_mine_kill = ent_flag("energy_mine_kill");
    var_3a99d1cafe4a4bac.napalm_burned = ent_flag("napalm_burned");
    var_3a99d1cafe4a4bac.var_53525e5d094a332b = spawnstruct();
    var_3a99d1cafe4a4bac.var_53525e5d094a332b.ent_flag = self.ent_flag;
    var_3a99d1cafe4a4bac.team = self.team;
    var_3a99d1cafe4a4bac.var_272746d0afd144b6 = namespace_3bbb5a98b932c46f::isstunnedorblinded();
    var_3a99d1cafe4a4bac.unittype = self.unittype;
    var_3a99d1cafe4a4bac.var_ec0a5c743cc6a4da = self.var_ec0a5c743cc6a4da;
    var_3a99d1cafe4a4bac.var_b626e0a33fcf8cd = gettime();
    var_3a99d1cafe4a4bac.var_21a8839dd03e31cd = self.var_21a8839dd03e31cd;
    var_3a99d1cafe4a4bac.var_aaf0465944b061ed = self.var_aaf0465944b061ed;
    if (isdefined(player)) {
        var_bafbdb422ea9eaae = function_137b512700167b00(player, self);
        var_bafbdb422ea9eaae.var_21a8839dd03e31cd = var_3a99d1cafe4a4bac.var_21a8839dd03e31cd;
        if (isplayer(player) && isweapon(var_d27680ff86693f5c.sweapon)) {
            if (!isdefined(player.var_603a8aa6efd893c9)) {
                player.var_603a8aa6efd893c9 = [];
            }
            var_904c82687ddfeb02 = weapon::function_89a83ae9a4c4142a(var_d27680ff86693f5c.sweapon);
            if (isdefined(var_904c82687ddfeb02)) {
                if (!isdefined(player.var_603a8aa6efd893c9[var_904c82687ddfeb02])) {
                    player.var_603a8aa6efd893c9[var_904c82687ddfeb02] = 0;
                }
                player.var_603a8aa6efd893c9[var_904c82687ddfeb02]++;
            }
        }
    }
    var_cb9bc0821d0eee8d = function_6c8b18941d0a604d();
    var_7f56c75cde4fea6c = function_adb26e28d3408dac();
    var_3e963b841cdedb62 = function_63663f994d4e7634();
    var_fc650d192ee6243 = 0;
    var_151fa81d56a14612 = 0;
    var_d28c6116660bb280 = 0;
    var_b33db8aa71151cab = function_61dbb8ade69346c1(var_fc650d192ee6243, var_151fa81d56a14612, var_d27680ff86693f5c);
    var_fc650d192ee6243 = var_b33db8aa71151cab[0];
    var_151fa81d56a14612 = var_b33db8aa71151cab[1];
    if (isdefined(var_3a99d1cafe4a4bac.unittype)) {
        switch (var_3a99d1cafe4a4bac.unittype) {
        case #"hash_44aaeb0edd152195":
            if (!isplayer(player) || !isdefined(var_d27680ff86693f5c.sweapon)) {
                return;
            }
            var_758af3a43f3f8c8b = function_9de7a3128f548745(var_fc650d192ee6243, var_151fa81d56a14612, var_d28c6116660bb280, var_d27680ff86693f5c);
            var_fc650d192ee6243 = var_758af3a43f3f8c8b[0];
            var_151fa81d56a14612 = var_758af3a43f3f8c8b[1];
            var_d28c6116660bb280 = var_758af3a43f3f8c8b[2];
            var_d28c6116660bb280 = function_4030ef122da1cf5c(var_d28c6116660bb280);
            break;
        case #"hash_f695947f7a9ce23f":
            var_331e81b3297cdd35 = level function_be1f0a84acb0ed97(var_3a99d1cafe4a4bac, var_d27680ff86693f5c, var_fc650d192ee6243, var_151fa81d56a14612, var_d28c6116660bb280);
            var_fc650d192ee6243 = var_331e81b3297cdd35[0];
            var_151fa81d56a14612 = var_331e81b3297cdd35[1];
            var_d28c6116660bb280 = var_331e81b3297cdd35[2];
            if (isdefined(var_331e81b3297cdd35[3]) && isplayer(var_331e81b3297cdd35[3])) {
                player = var_331e81b3297cdd35[3];
            }
            if (var_3a99d1cafe4a4bac.var_aaf0465944b061ed == "deathworm_kia") {
                level function_7d81180cfc146b9a(var_3a99d1cafe4a4bac);
                if (isdefined(var_bafbdb422ea9eaae)) {
                    var_bafbdb422ea9eaae.var_379d31f8d73d8b2f = 0;
                }
            }
            break;
        default:
            break;
        }
    }
    if (isplayer(player)) {
        player function_3875d2b5b87e7e7d(var_3a99d1cafe4a4bac, var_d27680ff86693f5c.sweapon, var_d27680ff86693f5c.smeansofdeath, var_d27680ff86693f5c.einflictor);
        var_1d68c79557cc54ea = [];
        var_1d68c79557cc54ea[0] = var_fc650d192ee6243;
        var_1d68c79557cc54ea[1] = var_151fa81d56a14612;
        var_1d68c79557cc54ea[2] = var_d28c6116660bb280;
        level function_5a0ae8bc2b80c0c0(var_d27680ff86693f5c.einflictor, player, var_d27680ff86693f5c.idamage, var_d27680ff86693f5c.smeansofdeath, var_d27680ff86693f5c.sweapon, var_d27680ff86693f5c.shitloc, player.modifiers, var_1d68c79557cc54ea, var_3a99d1cafe4a4bac.team, var_bafbdb422ea9eaae);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f9
// Size: 0x3e8
function function_9de7a3128f548745(var_d4a58a5ad5a66ed, var_494c20dbf01ad08c, var_a0aa10131c98134a, var_d27680ff86693f5c) {
    var_cb9bc0821d0eee8d = function_6c8b18941d0a604d();
    var_7f56c75cde4fea6c = function_adb26e28d3408dac();
    var_3e963b841cdedb62 = function_63663f994d4e7634();
    var_fc650d192ee6243 = var_d4a58a5ad5a66ed;
    var_151fa81d56a14612 = var_494c20dbf01ad08c;
    var_d28c6116660bb280 = var_a0aa10131c98134a;
    if (ent_flag("energy_mine_kill")) {
        var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["energy_mine_kill_soldier"]);
    }
    if (istrue(var_d27680ff86693f5c.eattacker.var_f2f5db77ae69537f)) {
        var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["aether_shroud_kill_soldier"]);
    }
    if (issharedfuncdefined("zombie", "get_pap_level")) {
        var_29a8ba8c9dd43fd2 = var_d27680ff86693f5c.eattacker function_af5127390d3221e9(var_d27680ff86693f5c.sweapon);
    }
    if (self.agent_type == "actor_jup_ob_enemy_specialist_captain") {
        var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["soldier_captain_kill"]);
    }
    if (self.agent_type == "actor_jup_ob_enemy_specialist_commander") {
        var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["soldier_commander_kill"]);
    }
    if (isdefined(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24.var_6346961d07f668fe)) {
        var_fc650d192ee6243 = function_9966e6739036c441(var_fc650d192ee6243, var_d27680ff86693f5c, "soldier", self.subclass, self);
        var_151fa81d56a14612 = function_128985eaf12e0ed8(var_151fa81d56a14612, var_d27680ff86693f5c, "soldier", self.subclass, self);
    } else if (ent_flag_exist("activity_mercCamp_spawned")) {
        var_fc650d192ee6243 = function_9966e6739036c441(var_fc650d192ee6243, var_d27680ff86693f5c, "soldier", self.subclass, self);
    }
    if (isdefined(self.subclass)) {
        switch (self.subclass) {
        case #"hash_8c92249632740ac":
        case #"hash_12daa0cbf50f6442":
        case #"hash_d646bb7570717551":
        case #"hash_dde105a699b160b3":
            if (gettime() < 420000) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["warlord_speedrun"]);
            }
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["storm_castle_warlord_kill"]);
            break;
        default:
            break;
        }
    }
    if (!isplayer(var_d27680ff86693f5c.einflictor)) {
        if (isdefined(var_d27680ff86693f5c.einflictor.streakinfo) && isdefined(var_d27680ff86693f5c.einflictor.streakinfo.streakname)) {
            if (var_d27680ff86693f5c.einflictor.streakinfo.streakname == "precision_airstrike") {
                var_69997e51685c46d9 = var_7f56c75cde4fea6c["precision_airstrike_soldier_kill"];
                if (isdefined(var_69997e51685c46d9)) {
                    var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_69997e51685c46d9);
                    if (ent_flag_exist("activity_mercCamp_spawned") && isdefined(var_d27680ff86693f5c.eattacker)) {
                        var_d27680ff86693f5c.eattacker function_f10f600ac4ee4c09("precision_airstrike_merc_camp", 2);
                    }
                }
            }
            if (var_d27680ff86693f5c.einflictor.streakinfo.streakname == "sentry_gun") {
                var_69997e51685c46d9 = var_cb9bc0821d0eee8d["killstreak_turret_soldier_kill"];
                if (isdefined(var_69997e51685c46d9)) {
                    var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
                }
                if (function_5acc35fc66331385(var_d27680ff86693f5c.eattacker, 16139) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
                    function_38e113a4c30f6c0d("obloot_ava_intel_soldier", self.origin, self.angles, 0, 1);
                }
            }
        }
    }
    return [0:var_fc650d192ee6243, 1:var_151fa81d56a14612, 2:var_d28c6116660bb280];
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67e9
// Size: 0xad5
function function_61dbb8ade69346c1(var_d4a58a5ad5a66ed, var_494c20dbf01ad08c, var_d27680ff86693f5c) {
    var_cb9bc0821d0eee8d = function_6c8b18941d0a604d();
    var_7f56c75cde4fea6c = function_adb26e28d3408dac();
    var_fc650d192ee6243 = var_d4a58a5ad5a66ed;
    var_151fa81d56a14612 = var_494c20dbf01ad08c;
    if (isplayer(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.sweapon)) {
        if (issharedfuncdefined("zombie", "get_pap_level")) {
            var_29a8ba8c9dd43fd2 = var_d27680ff86693f5c.eattacker function_af5127390d3221e9(var_d27680ff86693f5c.sweapon);
        }
        if (isdefined(var_29a8ba8c9dd43fd2) && var_29a8ba8c9dd43fd2 != 0) {
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["pap_kill_general"]);
        }
        if (array_contains(level.var_3fe26a6edf03f4f5, var_d27680ff86693f5c.sweapon)) {
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["wallbuy_kill_general"]);
        }
        if (array_contains(level.var_176c53feca4a2a03, var_d27680ff86693f5c.sweapon)) {
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["magicbox_kill_general"]);
        }
        if (isdefined(self.var_d37b75616f7c2ee) && isdefined(self.var_d37b75616f7c2ee.var_14edc6d1db3695bc) && self.var_d37b75616f7c2ee.var_14edc6d1db3695bc == 1) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["critical_kill"]);
        }
        if (weapon::iskillstreakweapon(var_d27680ff86693f5c.sweapon)) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["killstreak_kill"]);
        }
        if (var_d27680ff86693f5c.eattacker ent_flag("frenzied_guard_active") || istrue(var_d27680ff86693f5c.eattacker.var_f2f5db77ae69537f) || ent_flag("energy_mine_kill") || ent_flag("frost_blast_active") || ent_flag("tesla_storm_stunned")) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["field_upgrade_kill"]);
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.var_e44a614acd5d4984) && abs(var_d27680ff86693f5c.eattacker.var_e44a614acd5d4984 - gettime()) <= 5000) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["kill_after_field_upgrade_used"]);
        }
        if (ent_flag("frost_blast_active")) {
            function_648b4b8e2ec610d8();
        }
        if (weapon::function_4652ef19cc5bbe0f(var_d27680ff86693f5c.sweapon)) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["equipment_kill"]);
        }
        if (isdefined(var_d27680ff86693f5c.eattacker) && var_d27680ff86693f5c.eattacker ent_flag_exist("in_radiation")) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["aether_storm_kill"]);
        }
        if (isdefined(var_d27680ff86693f5c.smeansofdeath)) {
            var_2bd7283211fa61e7 = points::function_591305dc9c07499b(var_d27680ff86693f5c.sweapon, var_d27680ff86693f5c.eattacker, var_d27680ff86693f5c.smeansofdeath);
            if (!isdefined(self.var_9a5071c6ea11a014)) {
                self.var_9a5071c6ea11a014 = [];
            }
            if (var_2bd7283211fa61e7 == "fire" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_FIRE") {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["fire_damage"]);
                self.var_9a5071c6ea11a014["fire"] = 1;
            } else if (var_2bd7283211fa61e7 == "cold" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_COLD") {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["frost_damage"]);
                self.var_9a5071c6ea11a014["cold"] = 1;
            } else if (var_2bd7283211fa61e7 == "electrical" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_ELEC" || var_d27680ff86693f5c.sweapon.basename == "jup_shock_stick_ob") {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["electric_damage"]);
                self.var_9a5071c6ea11a014["electrical"] = 1;
            } else if (var_2bd7283211fa61e7 == "toxic" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_TOXIC") {
                var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["toxic_damage"]);
                self.var_9a5071c6ea11a014["toxic"] = 1;
            }
            if (isdefined(var_d27680ff86693f5c.smeansofdeath) && var_d27680ff86693f5c.smeansofdeath == "MOD_EXPLOSIVE" || var_d27680ff86693f5c.smeansofdeath == "MOD_PROJECTILE" || var_d27680ff86693f5c.smeansofdeath == "MOD_PROJECTILE_SPLASH" || var_d27680ff86693f5c.smeansofdeath == "MOD_GRENADE_SPLASH") {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["explosive_damage"]);
            }
        }
        if (isarray(self.var_9a5071c6ea11a014)) {
            if (self.var_9a5071c6ea11a014.size >= 2) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["elemental_combo"]);
            }
        }
        if (var_d27680ff86693f5c.eattacker ent_flag("speedcola_schematic_active") && isdefined(var_d27680ff86693f5c.eattacker.var_6502bc23ef7b1744)) {
            if (gettime() <= var_d27680ff86693f5c.eattacker.var_6502bc23ef7b1744 + 5000) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["schematic_speedcola_kill"]);
            } else {
                var_d27680ff86693f5c.eattacker ent_flag_clear("speedcola_schematic_active");
            }
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.perks_active)) {
            if (isdefined(var_d27680ff86693f5c.eattacker.perks_active.size) && var_d27680ff86693f5c.eattacker.perks_active.size >= 4) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["kill_four_perks"]);
            }
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.perks_active)) {
            foreach (perk in var_d27680ff86693f5c.eattacker.perks_active) {
                bit = undefined;
                switch (perk) {
                case #"hash_4485ea5afc8ef4ec":
                    bit = var_cb9bc0821d0eee8d["juggernog_equipped"];
                    break;
                case #"hash_47874f94af82bbae":
                    bit = var_cb9bc0821d0eee8d["quickrevive_equipped"];
                    break;
                case #"hash_8f7f900f28dfcf96":
                    bit = var_cb9bc0821d0eee8d["deadshot_daiquiri_equipped"];
                    break;
                case #"hash_5b88c6956390309e":
                    bit = var_cb9bc0821d0eee8d["speedcola_equipped"];
                    break;
                case #"hash_d5e621d55a8082dd":
                    bit = var_cb9bc0821d0eee8d["elemental_pop_equipped"];
                    break;
                case #"hash_f8756efed2ffb6f4":
                    bit = var_cb9bc0821d0eee8d["death_perception_equipped"];
                    break;
                case #"hash_8ce81fd37af3e66b":
                    bit = var_cb9bc0821d0eee8d["staminup_equipped"];
                    break;
                case #"hash_474f00cba8142b0b":
                    bit = var_cb9bc0821d0eee8d["phd_flopper_equipped"];
                    break;
                default:
                    break;
                }
                if (isdefined(bit)) {
                    var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, bit);
                }
            }
        }
        if (isdefined(level.var_8241e0d86017df29)) {
            var_988cd9a9c749ee11 = [[ level.var_8241e0d86017df29 ]](var_d27680ff86693f5c.eattacker.origin);
            switch (var_988cd9a9c749ee11) {
            case #"hash_7bb2cd766703d463":
                if (isweapon(var_d27680ff86693f5c.sweapon) && isdefined(var_d27680ff86693f5c.sweapon)) {
                    if (var_d27680ff86693f5c.eattacker function_ed7c10f78d0598f2(var_d27680ff86693f5c.sweapon) >= 4) {
                        var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["low_threat_legendary_wep_kill"]);
                    }
                }
                break;
            case #"hash_af83e47edfa8900a":
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["yellow_region_kill"]);
                break;
            case #"hash_5343b465e56ec9a4":
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["red_region_kill"]);
                break;
            default:
                break;
            }
        }
        rarity = var_d27680ff86693f5c.eattacker function_ed7c10f78d0598f2(var_d27680ff86693f5c.sweapon);
        switch (rarity) {
        case 1:
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["uncommon"]);
            break;
        case 2:
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["rare"]);
            break;
        case 3:
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["epic"]);
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["epic_or_higher_rarity"]);
            break;
        case 4:
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["legendary"]);
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["full_attachements_kill"]);
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["epic_or_higher_rarity"]);
            break;
        case 5:
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["epic_or_higher_rarity"]);
            break;
        default:
            break;
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.var_b57b122cb903fddf) && var_d27680ff86693f5c.eattacker.var_b57b122cb903fddf != 0 && var_d27680ff86693f5c.eattacker.var_b57b122cb903fddf % 10 == 0) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["jackrabbit"]);
        }
        if (function_ce3c3c0439296754()) {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_cb9bc0821d0eee8d["tactical_affected_kill"]);
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.var_2d9a19517f7a4632) && isdefined(var_d27680ff86693f5c.eattacker.var_2d9a19517f7a4632["elemental_kill_electrical"]) && var_d27680ff86693f5c.eattacker.var_2d9a19517f7a4632["elemental_kill_electrical"].var_b1be67b61f13e5c9 != 0) {
            if (var_d27680ff86693f5c.eattacker.var_2d9a19517f7a4632["elemental_kill_electrical"].var_b1be67b61f13e5c9 % 10 == 0) {
                var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["conductive"]);
            }
        }
        if (isdefined(var_d27680ff86693f5c.einflictor.turrettype) && issubstr(var_d27680ff86693f5c.einflictor.turrettype, "defend_turret")) {
            var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_7f56c75cde4fea6c["deadbolt_turret_kill"]);
        }
    }
    return [0:var_fc650d192ee6243, 1:var_151fa81d56a14612];
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72c6
// Size: 0x2b6
function function_9966e6739036c441(var_398aced5a2239dca, var_d27680ff86693f5c, var_c5b28f88d9b3bfd7, subclass, var_53525e5d094a332b) {
    var_fc650d192ee6243 = var_398aced5a2239dca;
    var_16713e93b3812fc6 = function_6c8b18941d0a604d();
    if (isdefined(var_d27680ff86693f5c.eattacker) && isplayer(var_d27680ff86693f5c.eattacker) && var_53525e5d094a332b ent_flag_exist("activity_mercCamp_spawned")) {
        var_69997e51685c46d9 = var_16713e93b3812fc6["merc_camp_kill"];
        if (isdefined(var_69997e51685c46d9) && var_c5b28f88d9b3bfd7 == "soldier") {
            var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
        }
    }
    if (isdefined(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24.var_6346961d07f668fe)) {
        activity = function_1f3e343912ae15c5(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24.var_6346961d07f668fe);
        if (!isdefined(activity.type)) {
            activity.type = "";
        }
        switch (activity.type) {
        case #"hash_5191681fd986c4eb":
            var_69997e51685c46d9 = var_16713e93b3812fc6["aether_sabotage_soldier_kill"];
            if (isdefined(var_69997e51685c46d9) && var_c5b28f88d9b3bfd7 == "soldier" && var_53525e5d094a332b ent_flag_exist("activity_sabotage_spawned")) {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
            }
            break;
        case #"hash_87fc920520ec2075":
        case #"hash_bcceffcc02978e65":
            switch (var_c5b28f88d9b3bfd7) {
            case #"hash_44aaeb0edd152195":
                if (isdefined(activity.safe) && isdefined(activity.safe.var_208c5333afcd7102)) {
                    var_69997e51685c46d9 = var_16713e93b3812fc6["weapon_stash_guard_kill"];
                    if (isdefined(var_69997e51685c46d9) && var_53525e5d094a332b ent_flag_exist("activity_safe_attracted")) {
                        var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
                    }
                }
                break;
            case #"hash_f695947f7a9ce23f":
                if (isdefined(activity.safe) && isdefined(activity.safe.var_208c5333afcd7102)) {
                    var_69997e51685c46d9 = var_16713e93b3812fc6["weapon_stash_guard_kill"];
                    if (isdefined(var_69997e51685c46d9) && var_53525e5d094a332b ent_flag_exist("activity_safe_attracted")) {
                        var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
                    }
                }
                break;
            }
            break;
        case #"hash_40d422a1ae5ecf0f":
            var_69997e51685c46d9 = var_16713e93b3812fc6["escort_zombie_kill"];
            if (isdefined(var_69997e51685c46d9) && var_c5b28f88d9b3bfd7 == "zombie") {
                var_fc650d192ee6243 = function_6d40f12a09494350(var_fc650d192ee6243, var_69997e51685c46d9);
            }
            break;
        }
    }
    return var_fc650d192ee6243;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7584
// Size: 0x1da
function function_128985eaf12e0ed8(var_22958a4f33c2a347, var_d27680ff86693f5c, var_c5b28f88d9b3bfd7, subclass, var_53525e5d094a332b) {
    var_151fa81d56a14612 = var_22958a4f33c2a347;
    var_741c0fba7bde178b = function_adb26e28d3408dac();
    if (isdefined(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24) && isdefined(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24.var_6346961d07f668fe)) {
        activity = function_1f3e343912ae15c5(var_d27680ff86693f5c.eattacker.var_83abcb9b3a5dbe24.var_6346961d07f668fe);
        if (!isdefined(activity.type)) {
            activity.type = "";
        }
        switch (activity.type) {
        case #"hash_bcceffcc02978e65":
            switch (var_c5b28f88d9b3bfd7) {
            case #"hash_f695947f7a9ce23f":
                var_69997e51685c46d9 = var_741c0fba7bde178b["safe_drill_attract_kill"];
                if (isdefined(var_69997e51685c46d9) && var_53525e5d094a332b ent_flag_exist("activity_safe_attracted")) {
                    var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_69997e51685c46d9);
                }
                break;
            }
            break;
        case #"hash_b034a4d29df58c9a":
            var_69997e51685c46d9 = var_741c0fba7bde178b["merc_defend_soldier_kill"];
            if (isdefined(var_69997e51685c46d9) && var_c5b28f88d9b3bfd7 == "soldier" && var_53525e5d094a332b ent_flag_exist("activity_merc_defend_spawned")) {
                var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_69997e51685c46d9);
            }
            break;
        case #"hash_17b1c4f2de901a59":
            var_69997e51685c46d9 = var_741c0fba7bde178b["contaminated_space_zombie_kill"];
            if (isdefined(var_69997e51685c46d9) && var_c5b28f88d9b3bfd7 == "zombie" && var_53525e5d094a332b ent_flag_exist("activity_outlast_spawned")) {
                var_151fa81d56a14612 = function_6d40f12a09494350(var_151fa81d56a14612, var_69997e51685c46d9);
            }
            break;
        }
    }
    return var_151fa81d56a14612;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7766
// Size: 0x49
function function_18a53d77df35c4c9(player, missionid) {
    if (!isdefined(player) || !isdefined(missionid)) {
        return 0;
    }
    return function_c7d3c1cb4a3958cf(player, missionid) && !function_62b41959b3c5a9ca(player, missionid) || getdvarint(@"hash_7c5a823345cc6183", 0);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77b7
// Size: 0x227
function function_7e993967c3cfc6c9(params) {
    if (!isplayer(self)) {
        return;
    }
    var_2632b2da60d34841 = params.var_2632b2da60d34841;
    is_special = params.var_19560ec564499c6c;
    if (isdefined(params.zombie)) {
        zombie = params.zombie;
    }
    if (isdefined(var_2632b2da60d34841)) {
        var_7c6183ce9e04512e = #"hash_3e734e36bbe882eb";
        var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
        gamemode = challenges::getchallengegamemode(self);
        gametype = challenges::function_17c5d7feb226e256();
        if (var_2632b2da60d34841 == "deadwire") {
            if (isdefined(zombie) && isdefined(zombie.var_a65cf0af898fe81a)) {
                return;
            }
            zombie.var_a65cf0af898fe81a = 1;
            var_3401eec8341e5cd1 = "deadwire_proc";
            if (istrue(is_special)) {
                var_3401eec8341e5cd1 = "deadwire_stun_special";
            }
        } else if (var_2632b2da60d34841 == "napalmburst") {
            if (isdefined(zombie) && isdefined(zombie.napalmburst_proc)) {
                return;
            }
            zombie.napalmburst_proc = 1;
            var_3401eec8341e5cd1 = "napalmburst_proc";
            if (istrue(is_special)) {
                var_3401eec8341e5cd1 = "napalmburst_special_proc";
            }
        } else if (var_2632b2da60d34841 == "brainrot") {
            var_3401eec8341e5cd1 = "brainrot_proc";
        }
        if (isdefined(var_a7a6077754bbc2f8) && isdefined(var_3401eec8341e5cd1)) {
            var_df29e0eadd94197c = function_d89978ce1f60dfc();
            var_6f888ca41c95dce7 = 0;
            var_6f888ca41c95dce7 = function_6d40f12a09494350(var_6f888ca41c95dce7, var_df29e0eadd94197c[var_3401eec8341e5cd1]);
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2b9333cc10a910d9"), 1:var_6f888ca41c95dce7, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79e5
// Size: 0x67
function on_tesla_storm_stunned(params) {
    if (isplayer(params.eattacker) && is_equal(self.unittype, "soldier") && !istrue(self.var_1979f554dfbc890b)) {
        params.eattacker function_f10f600ac4ee4c09("tesla_storm_stun_soldier");
        self.var_1979f554dfbc890b = 1;
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a53
// Size: 0x17e
function function_de9f828fd5fb2dc3(var_d27680ff86693f5c) {
    thread function_5e1833b74c8dc68f();
    if (isdefined(var_d27680ff86693f5c.objweapon) && isweapon(var_d27680ff86693f5c.objweapon)) {
        level.var_3fe26a6edf03f4f5 = array_add(level.var_3fe26a6edf03f4f5, var_d27680ff86693f5c.objweapon);
        if (istrue(var_d27680ff86693f5c.objweapon.hasalternate)) {
            altweapon = var_d27680ff86693f5c.objweapon getaltweapon();
            level.var_3fe26a6edf03f4f5 = array_add(level.var_3fe26a6edf03f4f5, altweapon);
        }
    }
    var_7d9803744a905b95 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e6b742f2dbcdaa7a", #"wallbuy"));
    var_707bc435f8518b62 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"buy"));
    var_f237807396377232 = spawnstruct();
    if (isweapon(var_d27680ff86693f5c.objweapon)) {
        var_f237807396377232.rarity = namespace_736197e4d378b91b::function_75e73212bbe447d9(var_d27680ff86693f5c.objweapon);
    }
    var_f237807396377232.var_7d9803744a905b95 = var_7d9803744a905b95;
    challenges::function_1ba256da09a9878a(self, var_d27680ff86693f5c.lootid, undefined, undefined, 1, var_d27680ff86693f5c.cost, var_707bc435f8518b62, var_f237807396377232);
    function_cadbe7496c7c80ee(var_d27680ff86693f5c.objweapon);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bd8
// Size: 0x419
function on_item_pickup(var_d27680ff86693f5c) {
    if (isdefined(var_d27680ff86693f5c.item)) {
        if (istrue(var_d27680ff86693f5c.item.var_1c9b1e35f32a7097)) {
            function_f243f33d3935b4f8();
        } else if (istrue(var_d27680ff86693f5c.item.var_5d482f7364fad176)) {
            function_f10f600ac4ee4c09("loot_harvester_orb_end", 2);
        }
        switch (var_d27680ff86693f5c.var_fbe755f0978c0369) {
        case #"hash_7c4ae75afa6d0b90":
            function_f10f600ac4ee4c09("pickup_gas_mask");
            break;
        case #"hash_26ac0d5fd9f65d60":
            function_f10f600ac4ee4c09("pickup_gas_mask");
            break;
        case #"hash_35336c7481df7ce2":
            function_f0156d5e3908b93b();
            thread function_da06d69b0b66e612(16822, "quest_s0a1t6_alab_loottablet", 1);
            break;
        case #"hash_edfb85cb31838c9":
            function_f10f600ac4ee4c09("shatterblast_obtain");
            break;
        case #"hash_74b351733941de9b":
            if (istrue(var_d27680ff86693f5c.item.var_1018ba92f1186325)) {
                function_f10f600ac4ee4c09("pickup_keycard_from_convoy");
                thread function_da06d69b0b66e612(16095, "quest_s0a1t2_cnvy_keylooted", 1);
            } else {
                function_f10f600ac4ee4c09("used_stronghold_key", 2);
            }
            break;
        case #"hash_fcf503d2ae6bc4f0":
            function_f10f600ac4ee4c09("pickup_ava_intel_from_frenzied_guard_special_elite");
            break;
        case #"hash_d6c8c974b4fb2e01":
            function_f10f600ac4ee4c09("pickup_ava_intel_from_aether_nest");
            break;
        case #"hash_ed44a06281542bd4":
            function_f10f600ac4ee4c09("pickup_ava_intel_by_armored_zombie");
            break;
        case #"hash_e42806c4e3d8eaa3":
            function_f10f600ac4ee4c09("pickup_ava_intel_from_soldier");
            break;
        case #"hash_c1d8ea8609e37fc5":
            function_f10f600ac4ee4c09("stronghold_special_intel", 2);
            thread function_da06d69b0b66e612(16946, "quest_s0a1t4_mstr_dossiersucc", 1);
            break;
        case #"hash_2d418737827b9bda":
            function_f10f600ac4ee4c09("zombie_stronghold_intel_tablet_collected", 2);
            break;
        case #"hash_931bacafb159989a":
            function_f10f600ac4ee4c09("pickup_essence_bazaar", 2);
            thread function_da06d69b0b66e612(16655, "quest_s0a2t3_essaether_start");
            break;
        case #"hash_32fefbc1ade48d6a":
            function_f10f600ac4ee4c09("pickup_essence_retail", 2);
            thread function_da06d69b0b66e612(16655, "quest_s0a2t3_essaether_start");
            break;
        case #"hash_35508910428bf454":
            function_f10f600ac4ee4c09("pickup_essence_shops", 2);
            thread function_da06d69b0b66e612(16655, "quest_s0a2t3_essaether_start");
            break;
        case #"hash_de70b56562925f9e":
            function_98c3f4e720f6089c();
            self.var_8fb5cf84d3fec2ed = 1;
            break;
        case #"hash_6ae12cc9d2961da1":
            thread function_da06d69b0b66e612(17078, "quest_s0a3t3_merccamp_research", 1);
            function_f10f600ac4ee4c09("jup_strauss_research_tablet");
            break;
        }
        if (isdefined(var_d27680ff86693f5c.itembundle) && isdefined(var_d27680ff86693f5c.itembundle.ref)) {
            switch (var_d27680ff86693f5c.itembundle.ref) {
            case #"hash_362af22ed7a7952":
            case #"hash_2cf17c998fa6c370":
            case #"hash_8f0b03ed1c07c01a":
            case #"hash_968017ca0fcdc9b0":
            case #"hash_9e489735d19803e5":
                function_bcfb5a0e96552599();
                break;
            default:
                break;
            }
        }
    }
    if (isdefined(var_d27680ff86693f5c.item) && isdefined(var_d27680ff86693f5c.itembundle)) {
        rarity = function_56e47c52dfb878e1(var_d27680ff86693f5c.itembundle.var_386890528da51c45);
        lootid = loot::function_a50b607d2500dda5(var_d27680ff86693f5c.itembundle.ref);
        var_f237807396377232 = spawnstruct();
        var_f237807396377232.rarity = rarity;
        challenges::function_8359cadd253f9604(self, undefined, var_d27680ff86693f5c.item.count, 0, lootid, var_f237807396377232);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ff8
// Size: 0xa8
function function_56e47c52dfb878e1(var_386890528da51c45) {
    if (isdefined(var_386890528da51c45)) {
        var_f9e057498069b28e = getscriptbundle(var_386890528da51c45);
        var_d645c0a118d2626d = var_f9e057498069b28e.var_644c50c3cc6c10a6;
        switch (var_d645c0a118d2626d) {
        case #"hash_db653a4972b3c13b":
            return 0;
        case #"hash_540f19f4cb02adc3":
            return 1;
        case #"hash_209fa8900070d83d":
            return 2;
        case #"hash_95068103fe897bc8":
            return 3;
        case #"hash_d6c98e710a88aa4a":
            return 4;
        case #"hash_22aea56c1711fd5":
            return 5;
        default:
            return 0;
            break;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80a7
// Size: 0x184
function function_94545a9bb0878e0e(params) {
    if (isdefined(params.itembundle.var_72340ceb276c0f64) && istrue(params.itembundle.var_72340ceb276c0f64)) {
        if (!isdefined(self.var_1e70ca7c886956a0)) {
            self.var_1e70ca7c886956a0 = 0;
        }
        if (gettime() > self.var_1e70ca7c886956a0 + 30000) {
            self.var_1e70ca7c886956a0 = 0;
            self.var_22d1f71559f6524a = 0;
        }
        if (self.var_1e70ca7c886956a0 == 0) {
            self.var_1e70ca7c886956a0 = gettime();
        }
        if (!isdefined(self.var_22d1f71559f6524a)) {
            self.var_22d1f71559f6524a = 0;
        }
        self.var_22d1f71559f6524a++;
        if (self.var_22d1f71559f6524a >= 5) {
            function_f10f600ac4ee4c09("use_acquisitions_thirty", 1, 0);
        }
    }
    if (isdefined(params.itembundle) && isdefined(params.item)) {
        rarity = function_56e47c52dfb878e1(params.itembundle.var_386890528da51c45);
        lootid = loot::function_a50b607d2500dda5(params.itembundle.ref);
        var_f237807396377232 = spawnstruct();
        var_f237807396377232.rarity = rarity;
        challenges::function_cfeb523fd3aa9ecf(self, lootid, undefined, 0, params.item.count, var_f237807396377232);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8232
// Size: 0x150
function private function_c9293fc51ab4bfeb(params) {
    var_76f28326961ae32d = [];
    if (isdefined(params.bundle)) {
        var_76f28326961ae32d[#"hash_5579154124d68ab2"] = params.value;
    }
    if (isdefined(params.ref)) {
        switch (params.ref) {
        case #"hash_7787d60b15bab3cd":
            function_f10f600ac4ee4c09("flesh_chunk_sold");
            break;
        }
    }
    function_8f4f9e5b10af310d(#"hash_3e734e36bbe882eb", var_76f28326961ae32d);
    if (isdefined(params.bundle)) {
        rarity = function_56e47c52dfb878e1(params.bundle.var_386890528da51c45);
        lootid = loot::function_a50b607d2500dda5(params.bundle.ref);
        var_f237807396377232 = spawnstruct();
        var_f237807396377232.rarity = rarity;
        var_f237807396377232.var_7d9803744a905b95 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e6b742f2dbcdaa7a", #"buy_station"));
        challenges::function_ea50038423fc4cfc(undefined, undefined, lootid, params.var_6d5e047412a465f6, params.value, var_f237807396377232);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8389
// Size: 0x14c
function function_8f4f9e5b10af310d(var_aaff38ee691a18b0, var_88a8f75abf8b400f) {
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_aaff38ee691a18b0);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_6f14c6fa29f154d6 = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_aaff38ee691a18b0, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_aaff38ee691a18b0, #"gamemode"), 3:gamemode, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_aaff38ee691a18b0, #"gametype"), 5:gametype];
        foreach (key, value in var_88a8f75abf8b400f) {
            if (namespace_ec6836c9475c9d18::function_5ca3bdbcf741615f(var_aaff38ee691a18b0, key)) {
                var_6f14c6fa29f154d6[var_6f14c6fa29f154d6.size] = namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_aaff38ee691a18b0, key);
                var_6f14c6fa29f154d6[var_6f14c6fa29f154d6.size] = value;
            }
        }
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, var_6f14c6fa29f154d6);
        }
    } else {
        /#
            /#
                assertmsg("ava_activated_uavTower");
            #/
        #/
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84dc
// Size: 0x10a
function function_d000329f6edb1510() {
    var_7c6183ce9e04512e = #"kill";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_cb9bc0821d0eee8d = function_6c8b18941d0a604d();
        var_d8b20b99033c0c4c = 0;
        params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_648b2ad7f16589f0"), 1:var_d8b20b99033c0c4c, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85ed
// Size: 0x68
function on_player_spawned(params) {
    var_674c247b5e3b128 = pmc_missions::function_62b41959b3c5a9ca(self, 16141);
    var_1cd9b9791cfeb624 = pmc_missions::function_62b41959b3c5a9ca(self, 16142);
    if (var_674c247b5e3b128 && !var_1cd9b9791cfeb624) {
        self.var_74d8dcd67ff30483 = "jup_ob_zombie_weapon_stash_kills";
    } else if (!var_674c247b5e3b128 && var_1cd9b9791cfeb624) {
        self.var_74d8dcd67ff30483 = "jup_ob_loot_safes";
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x865c
// Size: 0x123
function function_cadbe7496c7c80ee(objweapon) {
    var_7c6183ce9e04512e = #"hash_3e734e36bbe882eb";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_df29e0eadd94197c = function_d89978ce1f60dfc();
        var_6f888ca41c95dce7 = 0;
        var_6f888ca41c95dce7 = function_6d40f12a09494350(var_6f888ca41c95dce7, var_df29e0eadd94197c["wallbuy_purchase"]);
        params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2b9333cc10a910d9"), 1:var_6f888ca41c95dce7, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8786
// Size: 0x1bf
function function_6a7cf6856f3e681(var_d27680ff86693f5c) {
    if (isdefined(var_d27680ff86693f5c.objweapon) && isweapon(var_d27680ff86693f5c.objweapon)) {
        level.var_176c53feca4a2a03 = array_add(level.var_176c53feca4a2a03, var_d27680ff86693f5c.objweapon);
        if (istrue(var_d27680ff86693f5c.objweapon.hasalternate)) {
            altweapon = var_d27680ff86693f5c.objweapon getaltweapon();
            level.var_176c53feca4a2a03 = array_add(level.var_176c53feca4a2a03, altweapon);
        }
    }
    function_68052c69f0f90df8();
    if (isweapon(var_d27680ff86693f5c.objweapon) && isdefined(var_d27680ff86693f5c.objweapon.basename)) {
        if (namespace_736197e4d378b91b::function_75e73212bbe447d9(var_d27680ff86693f5c.objweapon) >= 4) {
            function_f10f600ac4ee4c09("magicbox_legendary_ww_pickup");
        }
    }
    var_18cefa3acf061993 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e6b742f2dbcdaa7a", #"magicbox"));
    var_707bc435f8518b62 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"buy"));
    cost = 950;
    var_f237807396377232 = spawnstruct();
    if (isweapon(var_d27680ff86693f5c.objweapon)) {
        var_f237807396377232.rarity = namespace_736197e4d378b91b::function_75e73212bbe447d9(var_d27680ff86693f5c.objweapon);
    }
    var_f237807396377232.var_7d9803744a905b95 = var_18cefa3acf061993;
    challenges::function_1ba256da09a9878a(self, var_d27680ff86693f5c.lootid, undefined, undefined, 1, cost, var_707bc435f8518b62, var_f237807396377232);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x894c
// Size: 0x12d
function function_68052c69f0f90df8(objweapon) {
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_3e734e36bbe882eb";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_df29e0eadd94197c = function_d89978ce1f60dfc();
        var_6f888ca41c95dce7 = 0;
        var_6f888ca41c95dce7 = function_6d40f12a09494350(var_6f888ca41c95dce7, var_df29e0eadd94197c["magicbox_purchase"]);
        params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2b9333cc10a910d9"), 1:var_6f888ca41c95dce7, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a80
// Size: 0xd1
function on_pap_machine_purchase(params) {
    if (isdefined(params.var_29a8ba8c9dd43fd2)) {
        switch (params.var_29a8ba8c9dd43fd2) {
        case 1:
            thread function_568866da0244ea3();
            function_f10f600ac4ee4c09("pap_purchase_level_1");
            break;
        case 2:
            thread function_da06d69b0b66e612(14967, "quest_s0a2t3_firepower_start", undefined, 1);
            function_f10f600ac4ee4c09("pap_purchase_level_1");
            function_f10f600ac4ee4c09("pap_purchase_level_2");
            break;
        case 3:
            thread function_da06d69b0b66e612(14972, "quest_s0_a3t2_mostfirepwr_start", undefined, 1);
            function_f10f600ac4ee4c09("pap_purchase_level_1");
            function_f10f600ac4ee4c09("pap_purchase_level_2");
            function_f10f600ac4ee4c09("pap_purchase_level_3");
            break;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b58
// Size: 0x124
function function_f243f33d3935b4f8() {
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_3e734e36bbe882eb";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_df29e0eadd94197c = function_d89978ce1f60dfc();
        var_6f888ca41c95dce7 = 0;
        var_6f888ca41c95dce7 = function_6d40f12a09494350(var_6f888ca41c95dce7, var_df29e0eadd94197c["pickup_item_from_crystal"]);
        params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_2b9333cc10a910d9"), 1:var_6f888ca41c95dce7, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c83
// Size: 0x1f
function loot_crystal_destroyed(var_d27680ff86693f5c) {
    if (isplayer(var_d27680ff86693f5c.var_535d9c3fdddab5a9)) {
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ca9
// Size: 0x5b
function function_9ef71ee9309e7fcb() {
    var_7c6183ce9e04512e = #"hash_3e734e36bbe882eb";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gametype = level.gametype;
    function_f10f600ac4ee4c09("aether_extractor_destroy", 2);
    thread function_da06d69b0b66e612(16132, "quest_s0a1t3_saboteur_success");
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d0b
// Size: 0xe2
function aether_extractor_disabled(var_d27680ff86693f5c) {
    if (!isplayer(var_d27680ff86693f5c.player)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_3e734e36bbe882eb";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gametype = level.gametype;
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_df29e0eadd94197c = function_d89978ce1f60dfc();
        var_6f888ca41c95dce7 = 0;
        var_6f888ca41c95dce7 = challenges::function_6d40f12a09494350(var_6f888ca41c95dce7, var_df29e0eadd94197c["aether_extractor_destroy"]);
        params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_b431eec04f47bf51"), 1:var_6f888ca41c95dce7];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            var_d27680ff86693f5c.player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8df4
// Size: 0x885
function function_6c8b18941d0a604d() {
    if (isarray(level.var_cb9bc0821d0eee8d) && level.var_cb9bc0821d0eee8d.size > 0) {
        return level.var_cb9bc0821d0eee8d;
    }
    var_cb9bc0821d0eee8d = [];
    var_cb9bc0821d0eee8d["wallbuy_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"wallbuy_kill");
    var_cb9bc0821d0eee8d["magicbox_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"magicbox_kill");
    var_cb9bc0821d0eee8d["frenzied_guard_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"frenzied_guard_kill");
    var_cb9bc0821d0eee8d["special_elite_frenzied_guard_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"special_elite_frenzied_guard_kill");
    var_cb9bc0821d0eee8d["cryofreeze_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"cryofreeze_kill");
    var_cb9bc0821d0eee8d["frost_blast_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"frost_blast_kill");
    var_cb9bc0821d0eee8d["energy_mine_kill_zombie"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"energy_mine_kill_zombie");
    var_cb9bc0821d0eee8d["energy_mine_kill_soldier"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"energy_mine_kill_soldier");
    var_cb9bc0821d0eee8d["aether_shroud_kill_zombie"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"aether_shroud_kill_zombie");
    var_cb9bc0821d0eee8d["aether_shroud_kill_soldier"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"aether_shroud_kill_soldier");
    var_cb9bc0821d0eee8d["tesla_storm_kill_zombie"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"tesla_storm_kill_zombie");
    var_cb9bc0821d0eee8d["pap_kill_zombie_level_1_yellow_or_higher"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"pap_kill_zombie_level_1_yellow_or_higher");
    var_cb9bc0821d0eee8d["pap_kill_zombie_level_2"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"pap_kill_zombie_level_2");
    var_cb9bc0821d0eee8d["pap_kill_zombie_special_level_2"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"pap_kill_zombie_special_level_2");
    var_cb9bc0821d0eee8d["pap_kill_zombie_level_3"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"pap_kill_zombie_level_3");
    var_cb9bc0821d0eee8d["pap_kill_zombie_elite_level_3"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"pap_kill_zombie_elite_level_3");
    var_cb9bc0821d0eee8d["brainrot_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"brainrot_kill");
    var_cb9bc0821d0eee8d["napalmburst_burning_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"napalmburst_burning_kill");
    var_cb9bc0821d0eee8d["deadwire_execution_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"deadwire_execution_kill");
    var_cb9bc0821d0eee8d["soldier_captain_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"soldier_captain_kill");
    var_cb9bc0821d0eee8d["soldier_commander_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"soldier_commander_kill");
    var_cb9bc0821d0eee8d["killstreak_turret_soldier_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"killstreak_turret_soldier_kill");
    var_cb9bc0821d0eee8d["killstreak_turret_zombie_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"killstreak_turret_zombie_kill");
    var_cb9bc0821d0eee8d["vehicle_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"vehicle_kill");
    var_cb9bc0821d0eee8d["vehicle_turret_zombie_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"hash_4608211df0e156df");
    var_cb9bc0821d0eee8d["aether_sabotage_soldier_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"aether_sabotage_soldier_kill");
    var_cb9bc0821d0eee8d["merc_camp_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"merc_camp_kill");
    var_cb9bc0821d0eee8d["weapon_stash_guard_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"weapon_stash_guard_kill");
    var_cb9bc0821d0eee8d["weapon_stash_zombie_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"weapon_stash_zombie_kill");
    var_cb9bc0821d0eee8d["escort_zombie_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"escort_zombie_kill");
    var_cb9bc0821d0eee8d["storm_castle_warlord_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"storm_castle_warlord_kill");
    var_cb9bc0821d0eee8d["pap_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"pap_kill");
    var_cb9bc0821d0eee8d["field_upgrade_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"field_upgrade_kill");
    var_cb9bc0821d0eee8d["critical_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"critical_kill");
    var_cb9bc0821d0eee8d["killstreak_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"killstreak_kill");
    var_cb9bc0821d0eee8d["equipment_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"equipment_kill");
    var_cb9bc0821d0eee8d["aether_storm_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"aether_storm_kill");
    var_cb9bc0821d0eee8d["fire_damage"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"fire_damage");
    var_cb9bc0821d0eee8d["electric_damage"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"electric_damage");
    var_cb9bc0821d0eee8d["frost_damage"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"frost_damage");
    var_cb9bc0821d0eee8d["explosive_damage"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"explosive_damage");
    var_cb9bc0821d0eee8d["elemental_combo"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"elemental_combo");
    var_cb9bc0821d0eee8d["warlord_speedrun"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"warlord_speedrun");
    var_cb9bc0821d0eee8d["deathworm_solo_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"deathworm_solo_kill");
    var_cb9bc0821d0eee8d["abomination_grenade_swallow"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"abomination_grenade_swallow");
    var_cb9bc0821d0eee8d["schematic_speedcola_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"schematic_speedcola_kill");
    var_cb9bc0821d0eee8d["schematic_cryofreeze_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"schematic_cryofreeze_kill");
    var_cb9bc0821d0eee8d["phd_flopper"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"phd_flopper");
    var_cb9bc0821d0eee8d["yellow_region_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"yellow_region_kill");
    var_cb9bc0821d0eee8d["red_region_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"red_region_kill");
    var_cb9bc0821d0eee8d["kill_four_perks"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"kill_four_perks");
    var_cb9bc0821d0eee8d["juggernog_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"juggernog_equipped");
    var_cb9bc0821d0eee8d["quickrevive_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"quickrevive_equipped");
    var_cb9bc0821d0eee8d["deadshot_daiquiri_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"deadshot_daiquiri_equipped");
    var_cb9bc0821d0eee8d["speedcola_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"speedcola_equipped");
    var_cb9bc0821d0eee8d["elemental_pop_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"elemental_pop_equipped");
    var_cb9bc0821d0eee8d["death_perception_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"death_perception_equipped");
    var_cb9bc0821d0eee8d["staminup_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"staminup_equipped");
    var_cb9bc0821d0eee8d["phd_flopper_equipped"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"phd_flopper_equipped");
    var_cb9bc0821d0eee8d["kills_and_exfil"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"kills_and_exfil");
    var_cb9bc0821d0eee8d["jackrabbit"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"jackrabbit");
    var_cb9bc0821d0eee8d["full_attachements_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"full_attachements_kill");
    var_cb9bc0821d0eee8d["epic_or_higher_rarity"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"epic_or_higher_rarity");
    var_cb9bc0821d0eee8d["one_shot_three_kills"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"one_shot_three_kills");
    var_cb9bc0821d0eee8d["kill_after_field_upgrade_used"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"kill_after_field_upgrade_used");
    var_cb9bc0821d0eee8d["tactical_affected_kill"] = function_e2ff8f4b4e94f723(#"hash_648b2ad7f16589f0", #"tactical_affected_kill");
    level.var_cb9bc0821d0eee8d = var_cb9bc0821d0eee8d;
    return var_cb9bc0821d0eee8d;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9681
// Size: 0x265
function function_adb26e28d3408dac() {
    if (isarray(level.var_7f56c75cde4fea6c) && level.var_7f56c75cde4fea6c.size > 0) {
        return level.var_7f56c75cde4fea6c;
    }
    var_7f56c75cde4fea6c = [];
    var_7f56c75cde4fea6c["safe_drill_attract_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"safe_drill_attract_kill");
    var_7f56c75cde4fea6c["merc_defend_soldier_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"merc_defend_soldier_kill");
    var_7f56c75cde4fea6c["precision_airstrike_soldier_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"precision_airstrike_soldier_kill");
    var_7f56c75cde4fea6c["redeploy_drone_zombie_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"redeploy_drone_zombie_kill");
    var_7f56c75cde4fea6c["contaminated_space_zombie_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"contaminated_space_zombie_kill");
    var_7f56c75cde4fea6c["aether_storm_orange_zombie_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"aether_storm_orange_zombie_kill");
    var_7f56c75cde4fea6c["low_threat_legendary_wep_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"low_threat_legendary_wep_kill");
    var_7f56c75cde4fea6c["pap_kill_general"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"pap_kill_general");
    var_7f56c75cde4fea6c["wallbuy_kill_general"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"wallbuy_kill_general");
    var_7f56c75cde4fea6c["magicbox_kill_general"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"magicbox_kill_general");
    var_7f56c75cde4fea6c["uncommon"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"uncommon");
    var_7f56c75cde4fea6c["rare"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"rare");
    var_7f56c75cde4fea6c["epic"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"epic");
    var_7f56c75cde4fea6c["legendary"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"legendary");
    var_7f56c75cde4fea6c["toxic_damage"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"toxic_damage");
    var_7f56c75cde4fea6c["conductive"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"conductive");
    var_7f56c75cde4fea6c["deadbolt_turret_kill"] = function_e2ff8f4b4e94f723(#"hash_3e038eef2f8914a6", #"deadbolt_turret_kill");
    level.var_7f56c75cde4fea6c = var_7f56c75cde4fea6c;
    return var_7f56c75cde4fea6c;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98ee
// Size: 0x345
function function_63663f994d4e7634() {
    if (isarray(level.var_1a027888c7b365e9) && level.var_1a027888c7b365e9.size > 0) {
        return level.var_1a027888c7b365e9;
    }
    var_1a027888c7b365e9 = [];
    var_1a027888c7b365e9["zombie_general"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"zombie_general");
    var_1a027888c7b365e9["zombie_base"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_9e928d4f429db5e3");
    var_1a027888c7b365e9["zombie_base_armored_heavy"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_2e33fb6219268242");
    var_1a027888c7b365e9["zombie_base_armored_light"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_2e33fb6219268242");
    var_1a027888c7b365e9["zombie_abom"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_18af518f7f491249");
    var_1a027888c7b365e9["zombie_mangler"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_e5cc9ba2d564d960");
    var_1a027888c7b365e9["zombie_mimic"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_d92e9d5d34383289");
    var_1a027888c7b365e9["zombie_disciple"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_111eeb7c9c836183");
    var_1a027888c7b365e9["zombie_normal_hellhound"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"zombie_normal_hellhound");
    var_1a027888c7b365e9["zombie_deathworm"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"hash_d08cb8b650fe3185");
    var_1a027888c7b365e9["merc_general"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_general");
    var_1a027888c7b365e9["merc_warlord"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_warlord");
    var_1a027888c7b365e9["merc_specialist"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_specialist");
    var_1a027888c7b365e9["soldier_captain_kill"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"soldier_captain_kill");
    var_1a027888c7b365e9["soldier_commander_kill"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"soldier_commander_kill");
    var_1a027888c7b365e9["merc_specialist_sniper"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_specialist_sniper");
    var_1a027888c7b365e9["merc_specialist_shielded"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_specialist_shielded");
    var_1a027888c7b365e9["merc_specialist_support"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_specialist_support");
    var_1a027888c7b365e9["merc_specialist_rusher"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_specialist_rusher");
    var_1a027888c7b365e9["merc_specialist_rocketeer"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_specialist_rocketeer");
    var_1a027888c7b365e9["merc_specialist_heavytactician"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"merc_specialist_heavytactician");
    var_1a027888c7b365e9["big_bounty_target"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"big_bounty_target");
    var_1a027888c7b365e9["zombie_elite_general"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"zombie_elite_general");
    var_1a027888c7b365e9["zombie_special_general"] = function_e2ff8f4b4e94f723(#"hash_4a2a8345ce12358", #"zombie_special_general");
    level.var_1a027888c7b365e9 = var_1a027888c7b365e9;
    return var_1a027888c7b365e9;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c3b
// Size: 0x330
function function_32126a54e0e1055c(var_398aced5a2239dca, subclass, var_53525e5d094a332b, var_aaf0465944b061ed) {
    var_3e963b841cdedb62 = function_63663f994d4e7634();
    var_d28c6116660bb280 = var_398aced5a2239dca;
    if (isdefined(var_3e963b841cdedb62["zombie_general"])) {
        var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_general"]);
    }
    if (isdefined(subclass)) {
        switch (subclass) {
        case #"hash_1380581f5144c465":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_base"]);
            break;
        case #"hash_99a38be9e88b5244":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_base_armored_heavy"]);
            break;
        case #"hash_f297af39454fdc7b":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_base_armored_light"]);
            break;
        case #"hash_3d51cb1a1a5f356b":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_abom"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_elite_general"]);
            break;
        case #"hash_1967f0e49ca5666a":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_abom"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_elite_general"]);
            break;
        case #"hash_7ba1ac4906d2dfde":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_abom"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_elite_general"]);
            break;
        case #"hash_a18ec1c48b974dc7":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_abom"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_elite_general"]);
            break;
        case #"hash_2f5c52f1e6ef9284":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_mangler"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_special_general"]);
            break;
        case #"hash_60cbd0daf82a39c9":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_mangler"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_special_general"]);
            break;
        case #"hash_59740dd906312a95":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_mimic"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_special_general"]);
            break;
        case #"hash_c1fa8721b046b258":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_mimic"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_special_general"]);
            break;
        case #"hash_3e4a9c816939eeef":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_disciple"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_special_general"]);
            break;
        case #"hash_c1b612499d7bd4a":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_disciple"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_special_general"]);
            break;
        case #"hash_9bc2060c1da7a187":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_disciple"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_special_general"]);
            break;
        case #"hash_99d5ac2f7a4d8083":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_normal_hellhound"]);
            break;
        default:
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["zombie_base"]);
            break;
        }
    }
    if (isdefined(var_53525e5d094a332b) && var_53525e5d094a332b ent_flag_exist("big_bounty_target")) {
        var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["big_bounty_target"]);
    }
    return var_d28c6116660bb280;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f73
// Size: 0x25a
function function_4030ef122da1cf5c(var_398aced5a2239dca) {
    var_3e963b841cdedb62 = function_63663f994d4e7634();
    var_d28c6116660bb280 = var_398aced5a2239dca;
    if (isdefined(var_3e963b841cdedb62["merc_general"])) {
        var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_general"]);
    }
    if (isdefined(self.subclass)) {
        switch (self.subclass) {
        case #"hash_8c92249632740ac":
        case #"hash_12daa0cbf50f6442":
        case #"hash_d646bb7570717551":
        case #"hash_dde105a699b160b3":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_warlord"]);
            break;
        default:
            break;
        }
    }
    if (isdefined(self.agent_type)) {
        switch (self.agent_type) {
        case #"hash_494c78d0fe9c3cb4":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["soldier_captain_kill"]);
            break;
        case #"hash_11b7036e79b0edc2":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["soldier_commander_kill"]);
            break;
        case #"hash_4468b0fd141b9355":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist_sniper"]);
            break;
        case #"hash_2b1c70e7844f2db0":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist_shielded"]);
            break;
        case #"hash_b5d278bc9bea747":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist_support"]);
            break;
        case #"hash_931849f4ce03d0e1":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist_rusher"]);
            break;
        case #"hash_caea87203ab0bcf4":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist_rocketeer"]);
            break;
        case #"hash_f5d5b7476b6cc681":
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist"]);
            var_d28c6116660bb280 = function_6d40f12a09494350(var_d28c6116660bb280, var_3e963b841cdedb62["merc_specialist_heavytactician"]);
            break;
        default:
            break;
        }
    }
    return var_d28c6116660bb280;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d5
// Size: 0x2c9
function function_484194ec6ace15bb(var_d29889468d853030, var_f2b106a03cdbf1, var_5670f984dc9565b5, var_828f250005b03c8e) {
    if (!isdefined(var_f2b106a03cdbf1)) {
        var_f2b106a03cdbf1 = 1;
    }
    if (!isdefined(var_5670f984dc9565b5)) {
        var_5670f984dc9565b5 = 1;
    }
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"kill";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    var_904c82687ddfeb02 = 0;
    if (isweapon(var_828f250005b03c8e)) {
        var_904c82687ddfeb02 = weapon::function_89a83ae9a4c4142a(var_828f250005b03c8e);
    }
    if (!isdefined(var_904c82687ddfeb02)) {
        var_904c82687ddfeb02 = 0;
    }
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_98d7770882ef67de = [];
        var_800fb1078b834513 = "";
        var_69997e51685c46d9 = 0;
        switch (var_f2b106a03cdbf1) {
        case 1:
            var_98d7770882ef67de = function_6c8b18941d0a604d();
            var_800fb1078b834513 = #"hash_648b2ad7f16589f0";
            break;
        case 2:
            var_98d7770882ef67de = function_adb26e28d3408dac();
            var_800fb1078b834513 = #"hash_3e038eef2f8914a6";
            break;
        case 3:
            var_98d7770882ef67de = function_63663f994d4e7634();
            var_800fb1078b834513 = #"hash_4a2a8345ce12358";
            break;
        default:
            var_98d7770882ef67de = function_6c8b18941d0a604d();
            var_800fb1078b834513 = #"hash_648b2ad7f16589f0";
            break;
        }
        if (array_contains_key(var_98d7770882ef67de, var_d29889468d853030)) {
            var_69997e51685c46d9 = function_6d40f12a09494350(var_69997e51685c46d9, var_98d7770882ef67de[var_d29889468d853030]);
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, var_800fb1078b834513), 1:var_69997e51685c46d9, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 9:var_904c82687ddfeb02];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
            if (istrue(var_5670f984dc9565b5)) {
                challenges::function_fee0bee456eac877(self, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, var_800fb1078b834513), 1:var_69997e51685c46d9, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_786f9c01adc0d384"), 9:var_904c82687ddfeb02]);
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4a5
// Size: 0x645
function function_d89978ce1f60dfc() {
    if (isarray(level.var_adeac835ef495aab) && level.var_adeac835ef495aab.size > 0) {
        return level.var_adeac835ef495aab;
    }
    var_df29e0eadd94197c = [];
    var_df29e0eadd94197c["wallbuy_purchase"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"wallbuy_purchase");
    var_df29e0eadd94197c["magicbox_purchase"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"magicbox_purchase");
    var_df29e0eadd94197c["pap_purchase_level_1"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pap_purchase_level_1");
    var_df29e0eadd94197c["pap_purchase_level_2"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pap_purchase_level_2");
    var_df29e0eadd94197c["pap_purchase_level_3"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pap_purchase_level_3");
    var_df29e0eadd94197c["pickup_ava_intel_from_aether_nest"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pickup_ava_intel_from_aether_nest");
    var_df29e0eadd94197c["pickup_ava_intel_from_frenzied_guard_special_elite"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pickup_ava_intel_from_frenzied_guard_special_elite");
    var_df29e0eadd94197c["pickup_ava_intel_from_soldier"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pickup_ava_intel_from_soldier");
    var_df29e0eadd94197c["pickup_ava_intel_by_armored_zombie"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pickup_ava_intel_by_armored_zombie");
    var_df29e0eadd94197c["pickup_item_from_crystal"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pickup_item_from_crystal");
    var_df29e0eadd94197c["destroy_crystal_vehicle"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"destroy_crystal_vehicle");
    var_df29e0eadd94197c["cryofreeze_hit_hellhound"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"cryofreeze_hit_hellhound");
    var_df29e0eadd94197c["cryofreeze_hit_zombie"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"cryofreeze_hit_zombie");
    var_df29e0eadd94197c["frost_blast_freeze_mimic"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"frost_blast_freeze_mimic");
    var_df29e0eadd94197c["frost_blast_freeze_zombie"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"frost_blast_freeze_zombie");
    var_df29e0eadd94197c["enegry_mine_destroy_vehicle"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"enegry_mine_destroy_vehicle");
    var_df29e0eadd94197c["shatterblast_obtain"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"shatterblast_obtain");
    var_df29e0eadd94197c["shatterblast_destroy_armor"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"shatterblast_destroy_armor");
    var_df29e0eadd94197c["healing_aura_heal"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"healing_aura_heal");
    var_df29e0eadd94197c["tesla_storm_stun_soldier"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"tesla_storm_stun_soldier");
    var_df29e0eadd94197c["pickup_keycard_from_convoy"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pickup_keycard_from_convoy");
    var_df29e0eadd94197c["deadwire_proc"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"deadwire_proc");
    var_df29e0eadd94197c["napalmburst_proc"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"napalmburst_proc");
    var_df29e0eadd94197c["brainrot_proc"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"brainrot_proc");
    var_df29e0eadd94197c["deadwire_stun_special"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"deadwire_stun_special");
    var_df29e0eadd94197c["napalmburst_special_proc"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"napalmburst_special_proc");
    var_df29e0eadd94197c["direct_line_ping"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"direct_line_ping");
    var_df29e0eadd94197c["direct_line_activity_complete"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"direct_line_activity_complete");
    var_df29e0eadd94197c["vehicle_tire_repair"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"vehicle_tire_repair");
    var_df29e0eadd94197c["turret_trap_ammoMod"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"hash_feb08ead2a3ba075");
    var_df29e0eadd94197c["aether_sabotage_completed"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"aether_sabotage_completed");
    var_df29e0eadd94197c["loaded_helicopter_destroyed"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"hash_288723b94e2627d0");
    var_df29e0eadd94197c["loot_merc_camps"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"loot_merc_camps");
    var_df29e0eadd94197c["pickup_gas_mask"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"pickup_gas_mask");
    var_df29e0eadd94197c["maintain_escort_health"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"maintain_escort_health");
    var_df29e0eadd94197c["heli_chase_destroy"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"heli_chase_destroy");
    var_df29e0eadd94197c["drink_gas_station_perk"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"drink_gas_station_perk");
    var_df29e0eadd94197c["energy_mine_stop_convoy"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"energy_mine_stop_convoy");
    var_df29e0eadd94197c["crate_looted"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"crate_looted");
    var_df29e0eadd94197c["jup_strauss_research_tablet"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"hash_f245aa8279cf6615");
    var_df29e0eadd94197c["perk_drank"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"perk_drank");
    var_df29e0eadd94197c["magicbox_legendary_ww_pickup"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"magicbox_legendary_ww_pickup");
    var_df29e0eadd94197c["befriend_hellish_companion"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"befriend_hellish_companion");
    var_df29e0eadd94197c["flesh_chunk_sold"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"flesh_chunk_sold");
    var_df29e0eadd94197c["schematic_juggernog_bigbounty"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"schematic_juggernog_bigbounty");
    var_df29e0eadd94197c["schematic_quickrevive_revive"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"schematic_quickrevive_revive");
    var_df29e0eadd94197c["use_acquisitions_thirty"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"use_acquisitions_thirty");
    var_df29e0eadd94197c["loot_cache_looted"] = function_e2ff8f4b4e94f723(#"hash_2b9333cc10a910d9", #"loot_cache_looted");
    level.var_adeac835ef495aab = var_df29e0eadd94197c;
    return var_df29e0eadd94197c;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaf2
// Size: 0x665
function function_cde7564c165a0bf1() {
    if (isarray(level.var_c4b0e79d3e523e7b) && level.var_c4b0e79d3e523e7b.size > 0) {
        return level.var_c4b0e79d3e523e7b;
    }
    var_a9f49527ae46e371 = [];
    var_a9f49527ae46e371["cargo_vehicle_scuttle"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"cargo_vehicle_scuttle");
    var_a9f49527ae46e371["safe_drill_no_pause"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"safe_drill_no_pause");
    var_a9f49527ae46e371["used_stronghold_key"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"used_stronghold_key");
    var_a9f49527ae46e371["stronghold_special_intel"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"stronghold_special_intel");
    var_a9f49527ae46e371["stronghold_safe_opened"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"stronghold_safe_opened");
    var_a9f49527ae46e371["zombie_stronghold_intel_tablet_collected"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"zombie_stronghold_intel_tablet_collected");
    var_a9f49527ae46e371["loot_harvester_orb_end"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"loot_harvester_orb_end");
    var_a9f49527ae46e371["maintain_computer_health"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"maintain_computer_health");
    var_a9f49527ae46e371["precision_airstrike_merc_camp"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"precision_airstrike_merc_camp");
    var_a9f49527ae46e371["precision_airstrike_merc_convoy"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"precision_airstrike_merc_convoy");
    var_a9f49527ae46e371["redeploy_drone_region"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"redeploy_drone_region");
    var_a9f49527ae46e371["outlast_pnd_no_pause"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"outlast_pnd_no_pause");
    var_a9f49527ae46e371["outlast_space_entered"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"outlast_space_entered");
    var_a9f49527ae46e371["pickup_ava_tablet_from_outlast"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"pickup_ava_tablet_from_outlast");
    var_a9f49527ae46e371["aether_extractor_destroy"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"aether_extractor_destroy");
    var_a9f49527ae46e371["aether_extractor_pickup_container"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"aether_extractor_pickup_container");
    var_a9f49527ae46e371["activate_uav_tower_ava"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"activate_uav_tower_ava");
    var_a9f49527ae46e371["locate_ava"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"locate_ava");
    var_a9f49527ae46e371["defend_ava"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"defend_ava");
    var_a9f49527ae46e371["escape_with_ava"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"escape_with_ava");
    var_a9f49527ae46e371["destroy_sam_shepherd"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"destroy_sam_shepherd");
    var_a9f49527ae46e371["secure_airdrop_shepherd"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"secure_airdrop_shepherd");
    var_a9f49527ae46e371["escort_vehicle_shepherd"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"escort_vehicle_shepherd");
    var_a9f49527ae46e371["defend_escort_shepherd"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"defend_escort_shepherd");
    var_a9f49527ae46e371["clear_zombies_mercs_zakhaev"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"hash_889cc431b3eb5887");
    var_a9f49527ae46e371["place_explosive_zakhaev"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"place_explosive_zakhaev");
    var_a9f49527ae46e371["clear_stronghold_zakhaev"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"clear_stronghold_zakhaev");
    var_a9f49527ae46e371["defend_scrambler_zakhaev"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"defend_scrambler_zakhaev");
    var_a9f49527ae46e371["defeat_worm_zakhaev"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"defeat_worm_zakhaev");
    var_a9f49527ae46e371["spore_regen_denied"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"spore_regen_denied");
    var_a9f49527ae46e371["aether_storm_entered"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"aether_storm_entered");
    var_a9f49527ae46e371["aether_storm_special_intel_collected"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"aether_storm_special_intel_collected");
    var_a9f49527ae46e371["heli_destroyed"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"heli_destroyed");
    var_a9f49527ae46e371["gunship_commander_destroy"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"gunship_commander_destroy");
    var_a9f49527ae46e371["pickup_essence_bazaar"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"pickup_essence_bazaar");
    var_a9f49527ae46e371["pickup_essence_shops"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"pickup_essence_shops");
    var_a9f49527ae46e371["pickup_essence_retail"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"pickup_essence_retail");
    var_a9f49527ae46e371["s1_mi_invest_rift"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"s1_mi_invest_rift");
    var_a9f49527ae46e371["s1_mi_destroy_seals"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"s1_mi_destroy_seals");
    var_a9f49527ae46e371["s1_mi_escape_to_beach"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"s1_mi_escape_to_beach");
    var_a9f49527ae46e371["s1_mi_defeat_worm"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"s1_mi_defeat_worm");
    var_a9f49527ae46e371["s1_mi_leave_rift"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"s1_mi_leave_rift");
    var_a9f49527ae46e371["s1_rift_mission_complete"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"s1_rift_mission_complete");
    var_a9f49527ae46e371["s1_rift_gate_unlock"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"s1_rift_gate_unlock");
    var_a9f49527ae46e371["punched_deathworm"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"punched_deathworm");
    var_a9f49527ae46e371["schematic_elementalpop_proc"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"schematic_elementalpop_proc");
    var_a9f49527ae46e371["cyst_kill_death_perception"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"cyst_kill_death_perception");
    var_a9f49527ae46e371["merc_camp_recon_destroyed"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"merc_camp_recon_destroyed");
    var_a9f49527ae46e371["powerup_nuke_pickup"] = function_e2ff8f4b4e94f723(#"hash_b431eec04f47bf51", #"powerup_nuke_pickup");
    level.var_c4b0e79d3e523e7b = var_a9f49527ae46e371;
    return var_a9f49527ae46e371;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb15f
// Size: 0x241
function function_f10f600ac4ee4c09(var_e8046e3623e8effe, var_f2b106a03cdbf1, var_5670f984dc9565b5) {
    if (!isdefined(var_f2b106a03cdbf1)) {
        var_f2b106a03cdbf1 = 1;
    }
    if (!isdefined(var_5670f984dc9565b5)) {
        var_5670f984dc9565b5 = 1;
    }
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_3e734e36bbe882eb";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_df29e0eadd94197c = [];
        var_ff89a661dac34339 = "";
        var_6f888ca41c95dce7 = 0;
        switch (var_f2b106a03cdbf1) {
        case 1:
            var_df29e0eadd94197c = function_d89978ce1f60dfc();
            var_ff89a661dac34339 = #"hash_2b9333cc10a910d9";
            break;
        case 2:
            var_df29e0eadd94197c = function_cde7564c165a0bf1();
            var_ff89a661dac34339 = #"hash_b431eec04f47bf51";
            break;
        default:
            var_df29e0eadd94197c = function_d89978ce1f60dfc();
            var_ff89a661dac34339 = #"hash_2b9333cc10a910d9";
            break;
        }
        if (array_contains_key(var_df29e0eadd94197c, var_e8046e3623e8effe)) {
            var_6f888ca41c95dce7 = function_6d40f12a09494350(var_6f888ca41c95dce7, var_df29e0eadd94197c[var_e8046e3623e8effe]);
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, var_ff89a661dac34339), 1:var_6f888ca41c95dce7, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
            if (istrue(var_5670f984dc9565b5)) {
                challenges::function_fee0bee456eac877(self, var_7c6183ce9e04512e, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, var_ff89a661dac34339), 1:var_6f888ca41c95dce7, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype]);
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3a7
// Size: 0x525
function function_2647e6d2c835793e() {
    if (isarray(level.var_aaf1e130f5165019) && level.var_aaf1e130f5165019.size > 0) {
        return level.var_aaf1e130f5165019;
    }
    var_e6a72373966a02cc = [];
    var_e6a72373966a02cc["jup_schematic_speedcola"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_d0f2aef4eafb7cb8");
    var_e6a72373966a02cc["jup_schematic_juggernog"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_f4cd7510d63d0f6a");
    var_e6a72373966a02cc["jup_schematic_staminup"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_f1c9e6cd47be4f27");
    var_e6a72373966a02cc["jup_schematic_ammo_cryofreeze"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_60664ebd2a0f163e");
    var_e6a72373966a02cc["jup_schematic_deadshot"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_1f37a7272aecfbe6");
    var_e6a72373966a02cc["jup_schematic_quickrevive"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_f47f1141ed38094");
    var_e6a72373966a02cc["jup_schematic_elementalpop"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_d95c0afa6378870");
    var_e6a72373966a02cc["jup_schematic_phdflopper"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_9aafbe7ae04e2500");
    var_e6a72373966a02cc["jup_schematic_deathperception"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_204a269c7e66f26c");
    var_e6a72373966a02cc["jup_schematic_tombstone"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_1ab75fcce3b54279");
    var_e6a72373966a02cc["jup_schematic_ammo_deadwire"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_e56c1fcc36b6a733");
    var_e6a72373966a02cc["jup_schematic_ammo_napalm"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_debd36a473f74204");
    var_e6a72373966a02cc["jup_schematic_ammo_brainrot"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_2727de000a800334");
    var_e6a72373966a02cc["jup_schematic_ammo_shatter"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_3646e7f9447b7cca");
    var_e6a72373966a02cc["jup_schematic_case_dg2"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_3d6e5a0e94a252e2");
    var_e6a72373966a02cc["jup_schematic_case_raygun"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_f8ea41787f2487f9");
    var_e6a72373966a02cc["jup_schematic_case_plasmagun"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_ecc602c881811bb1");
    var_e6a72373966a02cc["jup_schematic_aecrystal_1"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_37757eb54f3cc475");
    var_e6a72373966a02cc["jup_schematic_aecrystal_2"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_44647ffb162dc04c");
    var_e6a72373966a02cc["jup_schematic_aecrystal_3"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_5df2c1bc2f02616a");
    var_e6a72373966a02cc["jup_schematic_aetool_uncomm"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_9497a27d8fc155a6");
    var_e6a72373966a02cc["jup_schematic_aetool_rare"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_b823ef263ffd4fc0");
    var_e6a72373966a02cc["jup_schematic_aetool_epic"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_f02f95884a581d5f");
    var_e6a72373966a02cc["jup_schematic_aetool_lege"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_dc9f33d810173aa9");
    var_e6a72373966a02cc["jup_schematic_classified_bloodburner"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_da8e652e39d6b5fe");
    var_e6a72373966a02cc["jup_schematic_classified_golden_armor_plate"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_85a88c5b64999a7");
    var_e6a72373966a02cc["jup_schematic_classified_dog_bone"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_252abcfeac8c1933");
    var_e6a72373966a02cc["jup_schematic_classified_aetherblade"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_9c6b1915c323c0d5");
    var_e6a72373966a02cc["jup_schematic_classified_golden_ammo"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_e30781d9e7408550");
    var_e6a72373966a02cc["direct_line_exfil"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"direct_line_exfil");
    var_e6a72373966a02cc["jup_obloot_quest_a2t4_container"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"hash_85664cfd5cb98224");
    var_e6a72373966a02cc["exfil_success"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"exfil_success");
    var_e6a72373966a02cc["exfil_schematic"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"exfil_schematic");
    var_e6a72373966a02cc["five_contracts_completed"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"five_contracts_completed");
    var_e6a72373966a02cc["contracts_all_regions"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"contracts_all_regions");
    var_e6a72373966a02cc["never_downed"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"never_downed");
    var_e6a72373966a02cc["exfil_acquisition"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"exfil_acquisition");
    var_e6a72373966a02cc["exfil_pap_legendary_weapons"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"exfil_pap_legendary_weapons");
    var_e6a72373966a02cc["exfil_three_schematics"] = function_e2ff8f4b4e94f723(#"hash_8a4cf5bfff2c6109", #"exfil_three_schematics");
    level.var_aaf1e130f5165019 = var_e6a72373966a02cc;
    return var_e6a72373966a02cc;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8d4
// Size: 0x24
function function_4f87d9f22ebe1197() {
    var_63c0537a30bfebdc = [];
    var_63c0537a30bfebdc[var_63c0537a30bfebdc.size] = "direct_line_exfil";
    var_63c0537a30bfebdc[var_63c0537a30bfebdc.size] = "exfil_success";
    return var_63c0537a30bfebdc;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb900
// Size: 0x28
function private function_7c8dbb063c0e860c(params) {
    if (isplayer(self)) {
        wait(9);
        self.var_bee88b1ed3560170 = thread function_e783a5b7a0b0d983();
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb92f
// Size: 0x1b2
function private function_70fef3c29291be77(params) {
    var_6d28db65431f615a = function_4f87d9f22ebe1197();
    var_76f28326961ae32d = [];
    if (isarray(var_6d28db65431f615a)) {
        foreach (challenge in var_6d28db65431f615a) {
            if (isdefined(challenge)) {
                if (challenge == "direct_line_exfil") {
                    if (function_62b41959b3c5a9ca(self, 16937) && function_62b41959b3c5a9ca(self, 15725)) {
                        function_d1142b1749e61e85(challenge);
                    }
                } else {
                    function_d1142b1749e61e85(challenge);
                }
            }
        }
    }
    if (isdefined(self.var_9f9e2d9b18ce67bd) && self.var_9f9e2d9b18ce67bd >= 5) {
        function_d1142b1749e61e85("five_contracts_completed");
    }
    if (!ent_flag_exist("downed_before_exfil")) {
        function_d1142b1749e61e85("never_downed");
        if (isdefined(self.var_5dd9b65d7da434e3) && self.var_5dd9b65d7da434e3.size >= 3) {
            function_d1142b1749e61e85("contracts_all_regions");
        }
    }
    if (istrue(self.var_820d7adde5a94ed7)) {
        function_d1142b1749e61e85("jup_obloot_quest_a2t4_container");
    }
    var_b01d4c5ede595f2e = currency::function_15975e20bbd2c824("essence");
    if (isdefined(var_b01d4c5ede595f2e)) {
        var_76f28326961ae32d[#"hash_c818f0081a5df0ba"] = var_b01d4c5ede595f2e;
    }
    var_e0a3d6344b51cf96 = 0;
    if (isdefined(self.pers["currency_spent"])) {
        var_e0a3d6344b51cf96 = self.pers["currency_spent"];
        var_76f28326961ae32d[#"hash_592c86646af0c302"] = var_e0a3d6344b51cf96;
    }
    function_8f4f9e5b10af310d(#"hash_cacaabd5a014e897", var_76f28326961ae32d);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbae8
// Size: 0x139
function function_d1142b1749e61e85(var_c2004d6a416c93b9) {
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_cacaabd5a014e897";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    var_cd903eafd4933a21 = [];
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_cd903eafd4933a21 = function_2647e6d2c835793e();
        var_aca4d8f379381e77 = 0;
        if (array_contains_key(var_cd903eafd4933a21, var_c2004d6a416c93b9)) {
            var_aca4d8f379381e77 = function_6d40f12a09494350(var_aca4d8f379381e77, var_cd903eafd4933a21[var_c2004d6a416c93b9]);
            params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_8a4cf5bfff2c6109"), 1:var_aca4d8f379381e77, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
            if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
                function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc28
// Size: 0x240
function function_3053004c06f9c2ed(param) {
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_cacaabd5a014e897";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    lootid = param.lootid;
    var_3586af2f3cced9c4 = param.ref;
    rarity = param.rarity;
    var_dc90dedcb800b720 = param.var_dc90dedcb800b720;
    var_cd903eafd4933a21 = [];
    if (!isdefined(lootid)) {
        lootid = 0;
    }
    if (!isdefined(rarity)) {
        rarity = 0;
    }
    if (!isdefined(var_dc90dedcb800b720)) {
        var_dc90dedcb800b720 = 0;
    }
    if (!isdefined(var_3586af2f3cced9c4)) {
        var_3586af2f3cced9c4 = 0;
    }
    gametype = challenges::function_68ffb11dc4c6b979(gametype, var_7c6183ce9e04512e);
    gamemode = challenges::function_68ffb11dc4c6b979(gamemode, var_7c6183ce9e04512e);
    lootid = challenges::function_68ffb11dc4c6b979(lootid, var_7c6183ce9e04512e);
    rarity = challenges::function_68ffb11dc4c6b979(rarity, var_7c6183ce9e04512e);
    var_dc90dedcb800b720 = challenges::function_68ffb11dc4c6b979(var_dc90dedcb800b720, var_7c6183ce9e04512e);
    if (isdefined(var_a7a6077754bbc2f8)) {
        var_cd903eafd4933a21 = function_2647e6d2c835793e();
        var_aca4d8f379381e77 = 0;
        var_aca4d8f379381e77 = function_6d40f12a09494350(var_aca4d8f379381e77, var_cd903eafd4933a21[var_3586af2f3cced9c4]);
        if (!array_contains_key(var_cd903eafd4933a21, var_3586af2f3cced9c4)) {
            var_aca4d8f379381e77 = 0;
        }
        params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_8a4cf5bfff2c6109"), 1:var_aca4d8f379381e77, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype, 8:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_48f6b92ad0c610b2"), 9:rarity, 10:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_c1df2daa62247afe"), 11:var_dc90dedcb800b720, 12:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id"), 13:lootid];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe6f
// Size: 0x141
function private function_93a828d2f14b2a77(params) {
    if (!isdefined(params.lootid)) {
        return;
    }
    var_fbe755f0978c0369 = namespace_49e179ec476603d6::function_fc925a153c7fd55c(params.lootid);
    if (isdefined(var_fbe755f0978c0369)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        if (isdefined(itembundle)) {
            var_f13ea961840d3c2d = spawnstruct();
            var_f13ea961840d3c2d.lootid = params.lootid;
            var_f13ea961840d3c2d.rarity = itembundle.rarity;
            var_f13ea961840d3c2d.ref = itembundle.ref;
            function_3053004c06f9c2ed(var_f13ea961840d3c2d);
            if (isdefined(itembundle.type) && itembundle.type == "schematic") {
                function_d1142b1749e61e85("exfil_schematic");
                if (!isdefined(self.var_bc212fd29900efbc)) {
                    self.var_bc212fd29900efbc = 1;
                } else {
                    self.var_bc212fd29900efbc++;
                    if (self.var_bc212fd29900efbc >= 3) {
                        function_d1142b1749e61e85("exfil_three_schematics");
                    }
                }
            }
            if (istrue(itembundle.var_72340ceb276c0f64)) {
                function_d1142b1749e61e85("exfil_acquisition");
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbfb7
// Size: 0x182
function private function_1a63a8486a277ac8(params) {
    if (!isdefined(params.weapon)) {
        return;
    }
    weapon = params.weapon;
    rarity = namespace_736197e4d378b91b::function_75e73212bbe447d9(weapon);
    var_dc90dedcb800b720 = pack_a_punch::get_pap_level(weapon);
    lootid = params.lootid;
    if (isdefined(rarity) && isdefined(var_dc90dedcb800b720) && isdefined(lootid)) {
        if (rarity >= 4 && var_dc90dedcb800b720 == 3) {
            if (!isdefined(self.var_884d5b5d3e94747c)) {
                self.var_884d5b5d3e94747c = [];
            }
            self.var_884d5b5d3e94747c[lootid] = weapon;
            if (self.var_884d5b5d3e94747c.size == 2) {
                function_d1142b1749e61e85("exfil_pap_legendary_weapons");
            }
        }
        var_f13ea961840d3c2d = spawnstruct();
        var_f13ea961840d3c2d.lootid = lootid;
        var_f13ea961840d3c2d.rarity = rarity;
        var_f13ea961840d3c2d.var_dc90dedcb800b720 = var_dc90dedcb800b720;
        function_3053004c06f9c2ed(var_f13ea961840d3c2d);
    }
    if (isweapon(weapon)) {
        var_904c82687ddfeb02 = weapon::function_89a83ae9a4c4142a(weapon);
        if (isdefined(var_904c82687ddfeb02) && isdefined(self.var_603a8aa6efd893c9) && isdefined(self.var_603a8aa6efd893c9[var_904c82687ddfeb02])) {
            weaponkills = self.var_603a8aa6efd893c9[var_904c82687ddfeb02];
            if (isdefined(weaponkills) && weaponkills >= 100) {
                function_484194ec6ace15bb("kills_and_exfil", 1, 0, weapon);
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc140
// Size: 0x185
function function_569430d5aed94ffd() {
    if (isarray(level.var_f1828b269521df25) && level.var_f1828b269521df25.size > 0) {
        return level.var_f1828b269521df25;
    }
    var_f1828b269521df25 = [];
    var_f1828b269521df25["aethernest_completed"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"hash_523eb625a0f903bb");
    var_f1828b269521df25["merc_stronghold_completed"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_merc_stronhghold");
    var_f1828b269521df25["ob_harvester_orb"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_harvester_orb");
    var_f1828b269521df25["ob_zombie_stronghold_orange"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_zombie_stronghold_orange");
    var_f1828b269521df25["ob_armored_convoy"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_armored_convoy");
    var_f1828b269521df25["ob_gunship"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_gunship");
    var_f1828b269521df25["ob_merc_camp"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_merc_camp");
    var_f1828b269521df25["ob_merc_stronhghold"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_merc_stronhghold");
    var_f1828b269521df25["ob_harvester_orb_speedrun"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_harvester_orb_speedrun");
    var_f1828b269521df25["ob_zombie_stronghold"] = function_e2ff8f4b4e94f723(#"hash_152317d21c601575", #"ob_zombie_stronghold");
    level.var_f1828b269521df25 = var_f1828b269521df25;
    return var_f1828b269521df25;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2cd
// Size: 0x131
function function_78816b77271b0f4e(var_41acd4d450f972a5) {
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_9fc2564f412be74e";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    var_a172e130e75deb31 = function_569430d5aed94ffd();
    var_8f3ec2e571213968 = 0;
    if (array_contains_key(var_a172e130e75deb31, var_41acd4d450f972a5)) {
        var_8f3ec2e571213968 = function_6d40f12a09494350(var_8f3ec2e571213968, var_a172e130e75deb31[var_41acd4d450f972a5]);
        params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_152317d21c601575"), 1:var_8f3ec2e571213968, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc405
// Size: 0x265
function function_82d4524b2566958a() {
    if (isarray(level.var_57493830ad320944) && level.var_57493830ad320944.size > 0) {
        return level.var_57493830ad320944;
    }
    var_57493830ad320944 = [];
    var_57493830ad320944["weapons_stash_looted"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"ob_weapons_stash");
    var_57493830ad320944["bounty_hunter_complete_green"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"hash_e410c12d3edc0f1");
    var_57493830ad320944["bounty_hunter_complete_yellow"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"hash_d9fd21fa744d244e");
    var_57493830ad320944["bounty_hunter_complete_orange"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"hash_d21fcdb5cdfb6580");
    var_57493830ad320944["spore_control_completed"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"hash_10f69eb4e0309664");
    var_57493830ad320944["ob_cargo_delivery"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"ob_cargo_delivery");
    var_57493830ad320944["escort_zombie_completed"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"hash_32e4e69007048ea9");
    var_57493830ad320944["ob_weapons_stash"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"ob_weapons_stash");
    var_57493830ad320944["ob_merc_defend"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"ob_merc_defend");
    var_57493830ad320944["contract_region_red"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"contract_region_red");
    var_57493830ad320944["zero_damage_taken"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"zero_damage_taken");
    var_57493830ad320944["contract_region_green"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"contract_region_green");
    var_57493830ad320944["contract_region_yellow"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"contract_region_yellow");
    var_57493830ad320944["six_player_squad"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"six_player_squad");
    var_57493830ad320944["contract_general_speedrun"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"contract_general_speedrun");
    var_57493830ad320944["rift_run_contract_completed"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"rift_run_contract_completed");
    var_57493830ad320944["rift_run_hard_contract_completed"] = function_e2ff8f4b4e94f723(#"hash_8b2d3cef621fca38", #"rift_run_hard_contract_completed");
    level.var_57493830ad320944 = var_57493830ad320944;
    return var_57493830ad320944;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc672
// Size: 0x103
function function_9db4c37d4f1415f(var_5b84ea62d085c322) {
    if (!isplayer(self)) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_37e7fee4c79581a9";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    gamemode = challenges::getchallengegamemode(self);
    gametype = challenges::function_17c5d7feb226e256();
    var_be5e44033dbc0348 = function_82d4524b2566958a();
    var_84257eefaf85807b = 0;
    if (array_contains_key(var_be5e44033dbc0348, var_5b84ea62d085c322)) {
        var_84257eefaf85807b = function_6d40f12a09494350(var_84257eefaf85807b, var_be5e44033dbc0348[var_5b84ea62d085c322]);
        self function_db073176839d77fb(var_a7a6077754bbc2f8, [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_8b2d3cef621fca38"), 1:var_84257eefaf85807b, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 3:1, 4:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gamemode"), 5:gamemode, 6:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"gametype"), 7:gametype]);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc77c
// Size: 0x38
function private function_53f4bb14857d9b44(str_id, func) {
    if (!isdefined(level.var_9dd45392c2bffc71)) {
        level.var_9dd45392c2bffc71 = [];
    }
    level.var_9dd45392c2bffc71[str_id] = func;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc7bb
// Size: 0xc4
function private on_zombie_ai_spawned(var_d27680ff86693f5c) {
    if (isdefined(self.subclass) && (self.subclass == "zombie_hellhound" || self.subclass == "zombie_base" || self.subclass == "zombie_base_armored_heavy" || self.subclass == "zombie_base_armored_light") || self.subclass == "zombie_mimic") {
        thread function_147cc8860b90f396();
    }
    if (isdefined(self.subclass) && (self.subclass == "zombie_base_armored_heavy" || self.subclass == "zombie_base_armored_light")) {
        callback::add("metabone_destroyed", &function_5fa99f9f82669144);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc886
// Size: 0x3b
function private function_147cc8860b90f396() {
    level endon("game_ended");
    self endon("death");
    while (isagent(self)) {
        self waittill("start_status_effects_monitor");
        waitframe();
        if (ent_flag("frost_blast_active")) {
            function_648b4b8e2ec610d8();
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc8c8
// Size: 0x6c
function private function_73246c2cbf5948fb(params) {
    if (isdefined(self.var_fb0325e04fae6ce8) && !istrue(self.var_7bae08b99e089ca4)) {
        self.var_7bae08b99e089ca4 = 1;
        var_e8046e3623e8effe = "cryofreeze_hit_zombie";
        if (self.subclass == "zombie_hellhound") {
            var_e8046e3623e8effe = "cryofreeze_hit_hellhound";
        }
        self.var_fb0325e04fae6ce8 function_f10f600ac4ee4c09(var_e8046e3623e8effe);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc93b
// Size: 0x63
function private function_648b4b8e2ec610d8() {
    if (isdefined(self.var_fb0325e04fae6ce8) && !isdefined(self.var_a15161793868922)) {
        self.var_a15161793868922 = 1;
        var_e8046e3623e8effe = "frost_blast_freeze_zombie";
        if (self.subclass == "zombie_mimic") {
            var_e8046e3623e8effe = "frost_blast_freeze_mimic";
        }
        self.var_fb0325e04fae6ce8 function_f10f600ac4ee4c09(var_e8046e3623e8effe);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc9a5
// Size: 0x176
function private function_5fa99f9f82669144(var_d27680ff86693f5c) {
    if (isplayer(var_d27680ff86693f5c.eattacker) && ent_flag("shatterblast_damaged_armor") && !istrue(self.var_62b7c7f34c3ca8ff)) {
        if (!isdefined(var_d27680ff86693f5c.eattacker.var_ed974fbcac8d27f5)) {
            var_d27680ff86693f5c.eattacker.var_ed974fbcac8d27f5 = 0;
        }
        if (isdefined(var_d27680ff86693f5c.eattacker.var_ed974fbcac8d27f5)) {
            var_d27680ff86693f5c.eattacker.var_ed974fbcac8d27f5++;
        }
        var_d27680ff86693f5c.eattacker function_f10f600ac4ee4c09("shatterblast_destroy_armor");
        self.var_62b7c7f34c3ca8ff = 1;
        if (function_18a53d77df35c4c9(var_d27680ff86693f5c.eattacker, 14634) && !mod(var_d27680ff86693f5c.eattacker.var_ed974fbcac8d27f5, 3)) {
            switch (self.subclass) {
            case #"hash_99a38be9e88b5244":
            case #"hash_f297af39454fdc7b":
                item = function_38e113a4c30f6c0d("obloot_ava_intel_armored_zombie", self.origin, self.angles, 0, 1);
                jumpiffalse(isdefined(item)) LOC_0000014a;
                var_d27680ff86693f5c.eattacker thread function_c537a191b851482f(item, "obloot_ava_intel_armored_zombie");
            default:
            LOC_0000014a:
                break;
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb22
// Size: 0xb5
function function_c537a191b851482f(item, var_4fe22e2b8a9b92e2) {
    itembundle = getscriptbundle("itemspawnentry:" + var_4fe22e2b8a9b92e2);
    lootid = function_6d15e119c2779a93(itembundle);
    var_6e161a7b73a6cca1 = namespace_ca7b90256548aa40::getSquadMembers();
    foreach (member in var_6e161a7b73a6cca1) {
        member namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(14, item.origin, item.index, lootid);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcbde
// Size: 0xf
function private function_cf64989979528904() {
    function_f10f600ac4ee4c09("healing_aura_heal");
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcbf4
// Size: 0xb3
function private on_vehicle_spawned(var_d27680ff86693f5c) {
    waitframe();
    vehicle = var_d27680ff86693f5c.vehicle;
    if (!isdefined(vehicle.vehiclename)) {
        return;
    }
    switch (vehicle.vehiclename) {
    case #"hash_174ce9a6344b18a4":
    case #"hash_66c8846b85d8c948":
    case #"hash_6c8a74960d04b922":
    case #"hash_bc31095b59d83674":
    case #"hash_ca9945ca2bd4d081":
        if (!istrue(vehicle.var_4a4265af0a6f92e9)) {
            thread function_1ab983924d3621aa();
        }
        break;
    }
    namespace_ad22b9cf6a2b30d::function_21a469b6e2805cf1(vehicle.vehiclename, &function_eef88565476a2f1a);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xccae
// Size: 0x326
function private function_eef88565476a2f1a(data) {
    if (!isdefined(data) || !isdefined(data.attacker) || !isdefined(self)) {
        return;
    }
    if (ent_flag_exist("energy_mine_kill") && !istrue(self.var_f6517a11d37da125)) {
        data.attacker function_f10f600ac4ee4c09("enegry_mine_destroy_vehicle");
        self.var_f6517a11d37da125 = 1;
    }
    if (isdefined(data.inflictor) && isdefined(data.inflictor.streakinfo) && isdefined(data.inflictor.streakinfo.streakname)) {
        if (data.inflictor.streakinfo.streakname == "precision_airstrike" && ent_flag_exist("armored_convoy_spawned")) {
            data.attacker function_f10f600ac4ee4c09("precision_airstrike_merc_convoy", 2);
        }
    }
    if (isdefined(self.classname_mp) && isdefined(self.targetname) && isdefined(data.attacker)) {
        if (self.targetname == "veh_jup_blima_anim_infil") {
            data.attacker function_f10f600ac4ee4c09("loaded_helicopter_destroyed");
        }
    }
    if (istrue(self.isheli) && isdefined(data.attacker)) {
        data.attacker function_f10f600ac4ee4c09("heli_destroyed", 2);
    }
    if (isdefined(self.vehiclename) && isdefined(data.attacker) && self.vehiclename == "veh_jup_hind") {
        data.attacker function_f10f600ac4ee4c09("gunship_commander_destroy", 2);
    }
    if (isdefined(self.task) && isdefined(self.task.var_b189a678c1c3489a) && isdefined(self.task.var_b189a678c1c3489a.var_2f5d509d7b71ce9a) && isdefined(self.task.var_b189a678c1c3489a.var_2f5d509d7b71ce9a.type)) {
        if (self.task.var_b189a678c1c3489a.var_2f5d509d7b71ce9a.type == "REV_OB_VEHICLE_DRIVE" && self.spawndata.vehicletype == "veh_apache_mp_phys") {
            data.attacker function_f10f600ac4ee4c09("heli_chase_destroy");
            data.attacker function_f10f600ac4ee4c09("heli_destroyed", 2);
        }
    }
    if (ent_flag_exist("REV_OB_VEHICLE_DRIVE") && isdefined(data.attacker)) {
        player = data.attacker;
        if (ent_flag_exist("cargo_delivered")) {
            player function_f10f600ac4ee4c09("cargo_vehicle_scuttle", 2);
            ent_flag_clear("cargo_delivered", 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcfdb
// Size: 0xca
function private function_c2fa6446b3ec956f(params) {
    if (!isdefined(self)) {
        return;
    }
    if (ent_flag_exist("REV_OB_VEHICLE_DRIVE") && isarray(self.attackerdata)) {
        foreach (var_13aaab0ee500428d in self.attackerdata) {
            if (ent_flag_exist("cargo_delivered") && isdefined(var_13aaab0ee500428d) && isdefined(var_13aaab0ee500428d.attacker)) {
                var_13aaab0ee500428d.attacker function_f10f600ac4ee4c09("cargo_vehicle_scuttle", 2);
                ent_flag_clear("cargo_delivered", 1);
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd0ac
// Size: 0x7f
function private on_vehicle_refueled(params) {
    if (isdefined(params.vehicle) && !isdefined(params.vehicle.var_317b653ebff8473a)) {
        params.player function_f10f600ac4ee4c09("drink_gas_station_perk");
        params.vehicle.var_317b653ebff8473a = 1;
    }
    params.player thread function_da06d69b0b66e612(16148, "quest_s0a1t3_restock_start");
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd132
// Size: 0x18
function private function_4b8d35d7af7fd960(params) {
    function_f10f600ac4ee4c09("vehicle_tire_repair");
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd151
// Size: 0x46
function private on_tacmap_ping_scriptable_or_ent(params) {
    if (isdefined(params) && isdefined(params.target)) {
        if (isdefined(params.target.var_2f5d509d7b71ce9a)) {
            function_f10f600ac4ee4c09("direct_line_ping");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd19e
// Size: 0x67c
function private function_4b0eddcc1928fa56(var_b381b0883bcd4847) {
    activity = self;
    playerlist = var_b381b0883bcd4847.playerlist;
    var_1a3dbe8eb2705a9f = 0;
    if (isdefined(activity.category)) {
        var_1a3dbe8eb2705a9f = activity.category == "Contract";
    }
    if (isdefined(playerlist) && isdefined(activity)) {
        foreach (player in playerlist) {
            if (istrue(var_1a3dbe8eb2705a9f)) {
                player function_f10f600ac4ee4c09("direct_line_activity_complete", 1, 0);
                if (isdefined(player.var_e4f61eff2606b60c) && istrue(player.var_e4f61eff2606b60c)) {
                    player function_9db4c37d4f1415f("zero_damage_taken");
                }
                if (isdefined(playerlist.size) && playerlist.size >= 6) {
                    player function_9db4c37d4f1415f("six_player_squad");
                }
                if (isdefined(activity.starttime) && abs(activity.starttime - gettime()) <= 180000) {
                    player function_9db4c37d4f1415f("contract_general_speedrun");
                }
                if (isfunction(level.var_fac39a693f085779)) {
                    difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_4fda5d7358015a06::function_8988a4c89289d7f4(activity));
                    if (!isdefined(player.var_5dd9b65d7da434e3)) {
                        player.var_5dd9b65d7da434e3 = [];
                    }
                    switch (difficulty_region) {
                    case #"hash_7bb2cd766703d463":
                        player function_9db4c37d4f1415f("contract_region_green");
                        player.var_5dd9b65d7da434e3["green"] = 1;
                        break;
                    case #"hash_af83e47edfa8900a":
                        player function_9db4c37d4f1415f("contract_region_yellow");
                        player.var_5dd9b65d7da434e3["yellow"] = 1;
                        break;
                    case #"hash_5343b465e56ec9a4":
                        player function_9db4c37d4f1415f("contract_region_red");
                        player.var_5dd9b65d7da434e3["orange"] = 1;
                        break;
                    default:
                        break;
                    }
                }
                if (!isdefined(player.var_9f9e2d9b18ce67bd)) {
                    player.var_9f9e2d9b18ce67bd = 0;
                }
                player.var_9f9e2d9b18ce67bd++;
                player challenges::oncontractend(1, 1, 1);
            }
            switch (activity.type) {
            case #"hash_5253ef0f4683b778":
                params = spawnstruct();
                params.var_2f5d509d7b71ce9a = activity;
                player function_7fab27036d043e38(params);
                if (player namespace_876b4362ef613d7a::has_perk("specialty_juggernog")) {
                    player function_f10f600ac4ee4c09("schematic_juggernog_bigbounty", 1, 0);
                }
                break;
            case #"hash_427820bb3395e2bf":
                player function_9db4c37d4f1415f("spore_control_completed");
                timeSpent = abs(activity.starttime - gettime());
                if (timeSpent < 150000) {
                    player function_f10f600ac4ee4c09("spore_regen_denied", 2, 0);
                    player thread function_da06d69b0b66e612(16640, "quest_s0a2t5_extr_success");
                }
                break;
            case #"hash_5191681fd986c4eb":
                player function_9ef71ee9309e7fcb();
                player function_f10f600ac4ee4c09("aether_sabotage_completed", 1, 0);
                break;
            case #"hash_18347fa7b15eb832":
                player function_78816b77271b0f4e("ob_merc_camp");
                break;
            case #"hash_bcceffcc02978e65":
                player function_9db4c37d4f1415f("ob_weapons_stash");
                break;
            case #"hash_f0f77ef6300b1970":
                player function_78816b77271b0f4e("aethernest_completed");
                break;
            case #"hash_40d422a1ae5ecf0f":
                player function_9db4c37d4f1415f("escort_zombie_completed");
                if (isdefined(activity.var_1ff927c3faaf9638)) {
                    var_1d41f01d9ef686fa = player getclientomnvar("ui_br_objective_progress_bar");
                    if (isdefined(var_1d41f01d9ef686fa)) {
                        if (var_1d41f01d9ef686fa >= 50) {
                            player function_f10f600ac4ee4c09("maintain_escort_health", 1, 0);
                        }
                    }
                }
                break;
            case #"hash_b034a4d29df58c9a":
                player function_9db4c37d4f1415f("ob_merc_defend");
                var_f6225ddf8978c5fb = player getclientomnvar("ui_br_objective_param");
                if (isdefined(var_f6225ddf8978c5fb)) {
                    if (var_f6225ddf8978c5fb >= 60) {
                        player function_f10f600ac4ee4c09("maintain_computer_health", 2, 0);
                    }
                }
                break;
            case #"hash_113756c907deb5be":
                player function_9db4c37d4f1415f("ob_cargo_delivery");
                break;
            case #"hash_bc2e36acd99d4454":
                player function_78816b77271b0f4e("ob_harvester_orb");
                if (isdefined(activity.var_f3da409905b9608a) && activity.var_f3da409905b9608a < 45) {
                    player function_78816b77271b0f4e("ob_harvester_orb_speedrun");
                }
                break;
            case #"hash_cf6a24d2fd4c1930":
                player function_78816b77271b0f4e("ob_zombie_stronghold");
                if (isfunction(level.var_fac39a693f085779)) {
                    difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_4fda5d7358015a06::function_8988a4c89289d7f4(activity));
                    if (difficulty_region == "difficulty_hard") {
                        player function_78816b77271b0f4e("ob_zombie_stronghold_orange");
                    }
                }
                break;
            case #"hash_17b1c4f2de901a59":
                if (isdefined(self.var_18aaec4c8e0a3ddf) && self.var_18aaec4c8e0a3ddf == 0) {
                    player function_f10f600ac4ee4c09("outlast_pnd_no_pause", 2, 0);
                }
                player function_f10f600ac4ee4c09("outlast_space_entered", 2, 0);
                break;
            case #"hash_cf18a80d017267ca":
                player function_78816b77271b0f4e("ob_armored_convoy");
                break;
            case #"hash_2f4998a4a5760392":
                player function_78816b77271b0f4e("ob_gunship");
                break;
            case #"hash_84c8d0e39c86ae55":
                player function_f10f600ac4ee4c09("befriend_hellish_companion", 1, 0);
                break;
            }
        }
    }
    if (isdefined(activity) && isdefined(activity.var_a1f47d5c26653165)) {
        foreach (player in activity.var_a1f47d5c26653165) {
            switch (activity.type) {
            case #"hash_87fc920520ec2075":
                player function_78816b77271b0f4e("ob_merc_stronhghold");
                break;
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd821
// Size: 0xdb
function private function_748c2bebf6e2765b(var_b381b0883bcd4847) {
    activity = self;
    playerlist = var_b381b0883bcd4847.playerlist;
    if (isdefined(playerlist) && isdefined(activity)) {
        foreach (player in playerlist) {
            switch (activity.type) {
            case #"hash_18347fa7b15eb832":
                player function_78816b77271b0f4e("ob_merc_camp");
                if (isdefined(player.var_e4f61eff2606b60c) && player.var_e4f61eff2606b60c == 1) {
                    player function_9db4c37d4f1415f("zero_damage_taken");
                }
                break;
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd903
// Size: 0x14e
function private function_16afc8d96fd3de0c(var_b381b0883bcd4847) {
    activity = self;
    playerlist = var_b381b0883bcd4847.playerlist;
    if (isdefined(activity)) {
        activity.starttime = gettime();
        foreach (player in playerlist) {
            player.var_e4f61eff2606b60c = 1;
        }
        if (isdefined(activity.var_a1f47d5c26653165)) {
            foreach (player in activity.var_a1f47d5c26653165) {
                switch (activity.type) {
                case #"hash_87fc920520ec2075":
                    break;
                }
            }
        } else {
            switch (activity.type) {
            case #"hash_40d422a1ae5ecf0f":
                activity thread function_db6c1cb0e91c7041(playerlist);
                break;
            default:
                break;
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda58
// Size: 0x65
function private function_3b2ed72578533fe0(var_b381b0883bcd4847) {
    activity = self;
    playerlist = var_b381b0883bcd4847.playerlist;
    var_97ebad77fdbb25c9 = var_b381b0883bcd4847.var_b494ea8c4b70490;
    if (isdefined(activity) && isdefined(activity.type) && isdefined(playerlist) && isdefined(var_97ebad77fdbb25c9)) {
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdac4
// Size: 0x31
function private function_22de5391f273b6bf(params) {
    if (isdefined(self) && !isdefined(self.var_f3da409905b9608a)) {
        self.var_f3da409905b9608a = 0;
        thread function_ebbb949856b57930();
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdafc
// Size: 0x44
function private function_ebbb949856b57930() {
    level endon("game_ended");
    self endon("harvesterorb_end");
    self endon("orb_cleaned_up");
    if (isdefined(self.var_f3da409905b9608a)) {
        while (self.var_f3da409905b9608a <= 45) {
            wait(1);
            self.var_f3da409905b9608a++;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb47
// Size: 0xd0
function private function_7fab27036d043e38(params) {
    if (!isfunction(level.var_fac39a693f085779)) {
        return;
    }
    if (isdefined(params.var_2f5d509d7b71ce9a) && isdefined(params.var_2f5d509d7b71ce9a.ai_type)) {
        var_31109020393ed11b = params.var_2f5d509d7b71ce9a.ai_type;
        switch (var_31109020393ed11b) {
        case #"hash_57f1e1130e644c8e":
            function_9db4c37d4f1415f("bounty_hunter_complete_orange");
            break;
        case #"hash_d5d252eb91d1700b":
            function_9db4c37d4f1415f("bounty_hunter_complete_green");
            break;
        case #"hash_8b1acdb45ebb6052":
            function_9db4c37d4f1415f("bounty_hunter_complete_yellow");
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdc1e
// Size: 0x18
function private function_625e98d18b3d55a2(params) {
    function_f10f600ac4ee4c09("turret_trap_ammoMod");
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdc3d
// Size: 0x88
function private function_f6832a11ac7b3d16(var_b381b0883bcd4847) {
    activity = self;
    playerlist = activity.var_6c29f2fdb0054bbe;
    if (isdefined(activity)) {
        foreach (player in playerlist) {
            player function_f10f600ac4ee4c09("outlast_space_entered", 2, 0);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdccc
// Size: 0x1a
function private function_948301ad97e24c18(params) {
    function_f10f600ac4ee4c09("activate_uav_tower_ava", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdced
// Size: 0x1a
function private function_a7cf9a60c8407c0(params) {
    function_f10f600ac4ee4c09("locate_ava", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd0e
// Size: 0x1a
function private function_28c89f81cdaa9d97(params) {
    function_f10f600ac4ee4c09("defend_ava", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd2f
// Size: 0x1a
function private function_2a7867137131b412(params) {
    function_f10f600ac4ee4c09("escape_with_ava", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd50
// Size: 0x1a
function private function_5f52ca88d2ee165(params) {
    function_f10f600ac4ee4c09("destroy_sam_shepherd", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd71
// Size: 0x1a
function private function_c3cb09ac0cc5bb8c(params) {
    function_f10f600ac4ee4c09("secure_airdrop_shepherd", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd92
// Size: 0x1a
function private function_5f4bea465b992020(params) {
    function_f10f600ac4ee4c09("escort_vehicle_shepherd", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xddb3
// Size: 0x1a
function private function_9cf351a917bdb260(params) {
    function_f10f600ac4ee4c09("defend_escort_shepherd", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xddd4
// Size: 0x1a
function private function_b08965cd9e357396(params) {
    function_f10f600ac4ee4c09("clear_zombies_mercs_zakhaev", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xddf5
// Size: 0x1a
function private function_7ddbc5d5709f0565(params) {
    function_f10f600ac4ee4c09("place_explosive_zakhaev", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde16
// Size: 0x1a
function private function_4dc500ccd9ff3cbc(params) {
    function_f10f600ac4ee4c09("clear_stronghold_zakhaev", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde37
// Size: 0x1a
function private function_6cfc34c8585e3810(params) {
    function_f10f600ac4ee4c09("defend_scrambler_zakhaev", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde58
// Size: 0x1a
function private function_bd6f213cdc70081(params) {
    function_f10f600ac4ee4c09("defeat_worm_zakhaev", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde79
// Size: 0x1a
function private function_654c053523c6f5f6(params) {
    function_f10f600ac4ee4c09("safe_drill_no_pause", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde9a
// Size: 0x85
function private function_f0156d5e3908b93b(params) {
    playerlist = namespace_ca7b90256548aa40::getSquadMembers();
    if (isdefined(playerlist)) {
        foreach (player in playerlist) {
            player function_f10f600ac4ee4c09("pickup_ava_tablet_from_outlast", 2, 0);
            player.var_820d7adde5a94ed7 = 1;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdf26
// Size: 0x98
function private function_98c3f4e720f6089c(params) {
    playerlist = namespace_ca7b90256548aa40::getSquadMembers();
    if (isdefined(playerlist)) {
        foreach (player in playerlist) {
            if (player ent_flag("quest_s0a2t4_heist_extsuccess_conv")) {
                player thread function_da06d69b0b66e612(16445, "quest_s0a2t4_heist_cancollected_conv", 1);
            }
            player function_f10f600ac4ee4c09("aether_extractor_pickup_container", 2);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdfc5
// Size: 0x117
function private function_c170c9d5fe107d4c(var_b381b0883bcd4847) {
    activity = self;
    if (!isdefined(activity)) {
        return;
    }
    playerlist = activity.var_6c29f2fdb0054bbe;
    if (isdefined(activity.var_a1f47d5c26653165) && istrue(var_b381b0883bcd4847.safe.var_2091b0afd53afd0)) {
        playerlist = activity.var_a1f47d5c26653165;
    }
    foreach (player in playerlist) {
        if (isdefined(var_b381b0883bcd4847) && isdefined(var_b381b0883bcd4847.safe)) {
            if (istrue(var_b381b0883bcd4847.safe.var_2091b0afd53afd0)) {
                player function_f10f600ac4ee4c09("stronghold_safe_opened", 2, 0);
            }
            if (istrue(var_b381b0883bcd4847.safe.var_10505f0fb3d81db4)) {
                player thread function_da06d69b0b66e612(16140, "quest_s0a1t5_raiders_start");
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe0e3
// Size: 0x85
function private function_438364b427391b60(var_b381b0883bcd4847) {
    activity = self;
    playerlist = activity.var_6c29f2fdb0054bbe;
    if (isdefined(activity)) {
        foreach (player in playerlist) {
            player function_78816b77271b0f4e("ob_merc_stronhghold");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe16f
// Size: 0x4b
function private function_def7cd4658600e1a(params) {
    function_f10f600ac4ee4c09("perk_drank");
    if (!isdefined(params) || !isdefined(params.var_b256730ecb362423)) {
        return;
    }
    if (params.var_b256730ecb362423 == "specialty_speedcola") {
        thread function_3115bc3519ac2ea1();
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe1c1
// Size: 0x57
function private function_6e7c3cd09cadb943(params) {
    if (isdefined(params) && isdefined(params.perk_machine) && isdefined(params.perk_machine.var_6e601a7f04ef5591)) {
        function_f10f600ac4ee4c09("drink_gas_station_perk");
        thread function_da06d69b0b66e612(16148, "quest_s0a1t3_restock_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe21f
// Size: 0x4e
function private function_61691a3175d3e844(params) {
    if (isdefined(params.player) && istrue(params.player.var_f0571de00436dc5)) {
        params.player function_f10f600ac4ee4c09("redeploy_drone_region", 2);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe274
// Size: 0x1d
function private function_4f322f99eb988e83(params) {
    scriptable::scriptable_addusedcallbackbypart("redeploy_drone_interact", &function_7be71446bbc4e06f);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe298
// Size: 0x4b
function function_7be71446bbc4e06f(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    player.var_f0571de00436dc5 = 1;
    player thread function_df09572b35cbd84c();
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2ea
// Size: 0x38
function function_df09572b35cbd84c() {
    level endon("game_ended");
    self endon("death");
    wait(2);
    while (!self isonground()) {
        waitframe();
    }
    if (isdefined(self.var_f0571de00436dc5)) {
        self.var_f0571de00436dc5 = undefined;
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe329
// Size: 0x68
function function_4ffcd177964e72b2(params) {
    if (isdefined(params.player)) {
        params.player thread function_da06d69b0b66e612(17082, "quest_s0_a3t4_closetime_start");
        player = params.player;
        player ent_flag_init("in_radiation");
        player function_f10f600ac4ee4c09("aether_storm_entered", 2);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe398
// Size: 0x4f
function function_1fb60c4452a392c8(params) {
    if (isdefined(params.player)) {
        player = params.player;
        if (player ent_flag_exist("in_radiation")) {
            player ent_flag_clear("in_radiation", 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3ee
// Size: 0x6d
function function_b05b488b03740449(params) {
    if (!isplayer(params.player)) {
        return;
    }
    var_bfd8e1203313f055 = function_a7ea8cc17447e576(params);
    if (isdefined(var_bfd8e1203313f055.var_1863d82b6dd463a9)) {
        params.player thread function_da06d69b0b66e612(var_bfd8e1203313f055.var_391e7bba92e85f93, var_bfd8e1203313f055.var_1863d82b6dd463a9, undefined, 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe462
// Size: 0x10f
function function_a7ea8cc17447e576(params) {
    var_bfd8e1203313f055 = spawnstruct();
    switch (params.var_362a3a0a1e485bf6) {
    case #"hash_853faa00a9ff1020":
        var_bfd8e1203313f055.var_391e7bba92e85f93 = 14960;
        var_bfd8e1203313f055.var_1863d82b6dd463a9 = undefined;
        break;
    case #"hash_fe0fd5228eda0f07":
        var_bfd8e1203313f055.var_391e7bba92e85f93 = 14856;
        var_bfd8e1203313f055.var_1863d82b6dd463a9 = "quest_s0a1t3_freezbrn_start";
        break;
    case #"hash_afaaf053b2461f8a":
        var_bfd8e1203313f055.var_391e7bba92e85f93 = 14994;
        var_bfd8e1203313f055.var_1863d82b6dd463a9 = undefined;
        break;
    case #"hash_4f5cd54aaf7f106":
        var_bfd8e1203313f055.var_391e7bba92e85f93 = 14991;
        var_bfd8e1203313f055.var_1863d82b6dd463a9 = "quest_s0_a3t2_firestarter_start";
        break;
    case #"hash_41d942d30dd3f804":
        var_bfd8e1203313f055.var_391e7bba92e85f93 = 14885;
        var_bfd8e1203313f055.var_1863d82b6dd463a9 = "quest_s0a1t5_blasted_start";
        break;
    }
    return var_bfd8e1203313f055;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe579
// Size: 0x52
function private on_super_ready(params) {
    if (isplayer(params.player) && params.var_ebec497ff8b18a45 == "super_energy_mine") {
        params.player thread function_da06d69b0b66e612(14883, "quest_s0a1t3_bomb_start", undefined, 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5d2
// Size: 0x107
function function_a5e16566a91e9488(params) {
    if (isplayer(params.player) && isdefined(params.var_19163e14365d9264)) {
        if (params.var_19163e14365d9264.staticdata.ref == "super_frost_blast") {
            params.player thread function_da06d69b0b66e612(16629, "quest_s0a2t5_frostbite_start", undefined, 1);
        } else if (params.var_19163e14365d9264.staticdata.ref == "super_tesla_storm") {
            params.player thread function_da06d69b0b66e612(14975, "quest_s0_a3t2_ac_start", undefined, 1);
        } else if (params.var_19163e14365d9264.staticdata.ref == "super_aether_shroud") {
            params.player thread function_da06d69b0b66e612(14976, "quest_s0_a3t2_ghosted_start", undefined, 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6e0
// Size: 0x49
function function_3cde22ad6d42a269(params) {
    if (isplayer(self)) {
        if (isdefined(params.streakname) && params.streakname == "precision_airstrike") {
            thread function_da06d69b0b66e612(17074, "quest_s0_a3t2_painttarget_start");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe730
// Size: 0x4d
function function_c99db6b18ad62976(params) {
    if (isdefined(params.scoreevent) && params.scoreevent == "deadwire_aoe_kill" && isplayer(self)) {
        thread function_da06d69b0b66e612(14994, "quest_s0_a2t2_shocked_start", undefined, 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe784
// Size: 0x40
function on_exfil_exiting_ao(params) {
    if (isplayer(self)) {
        if (!function_d1b7b365deeebee7()) {
            if (isdefined(params.var_751df20fceaee5)) {
                thread namespace_9f6a961447bab709::function_36d898a4d1fd0a31(params.var_751df20fceaee5);
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7cb
// Size: 0x25
function on_outlast_start(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16822, "quest_s0a1t6_alab_outstart");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7f7
// Size: 0x44
function on_outlast_arrive(params) {
    if (isplayer(self)) {
        played = thread function_da06d69b0b66e612(16822, "quest_s0a1t6_alab_outarrive");
        if (!istrue(played)) {
            thread function_da06d69b0b66e612(17090, "quest_s0_a3t4_hold_start");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe842
// Size: 0x25
function private on_outlast_progress_degrade(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16822, "quest_s0a1t6_alab_outprogressdegrade");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe86e
// Size: 0x25
function private on_approach_outlast_pnd(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16822, "quest_s0a1t6_alab_outapproachpnd");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe89a
// Size: 0x27
function private on_outlast_success(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16822, "quest_s0a1t6_alab_outsuccess", 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe8c8
// Size: 0x25
function private on_abandon_outlast_contract(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16822, "quest_s0a1t6_alab_outcontractcancel");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f4
// Size: 0x25
function on_approach_zm_stronghold(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(17086, "quest_s0_a3t4_springcln_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe920
// Size: 0x25
function function_7f2dd34d9517d2c6(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(17077, "quest_s0_a3t2_crashburn_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe94c
// Size: 0x90
function private function_e783a5b7a0b0d983() {
    self endon("death");
    player = self;
    backpackSize = player namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < backpackSize; i++) {
        var_eeeae9defa0c1e95 = player namespace_feea61bc660e9e0f::function_d870b2c45335bd88(i);
        if (!isdefined(var_eeeae9defa0c1e95) || var_eeeae9defa0c1e95 == 0) {
            continue;
        }
        switch (var_eeeae9defa0c1e95) {
        case 29666:
            player thread function_b46c28df3a5f6156(17090, "quest_s0_a3t4_hold_success");
            return 1;
            continue;
        }
    }
    return 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe9e4
// Size: 0x144
function private function_d1b7b365deeebee7() {
    self endon("death");
    player = self;
    backpackSize = player namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < backpackSize; i++) {
        var_eeeae9defa0c1e95 = player namespace_feea61bc660e9e0f::function_d870b2c45335bd88(i);
        if (!isdefined(var_eeeae9defa0c1e95) || var_eeeae9defa0c1e95 == 0) {
            continue;
        }
        switch (var_eeeae9defa0c1e95) {
        case 29660:
            player thread function_b46c28df3a5f6156(16132, "quest_s0a1t3_sabo_exfil");
            return 1;
            continue;
        case 29652:
            continue;
        case 29662:
            continue;
        case 29659:
            player thread function_b46c28df3a5f6156(16640, "quest_s0a2t5_extr_exfil_success");
            return 1;
            continue;
        case 29649:
            player thread function_b46c28df3a5f6156(17070, "quest_s0a3t1_s2fa_exfil");
            return 1;
            continue;
        }
    }
    if (function_62b41959b3c5a9ca(player, 16821)) {
        player thread function_b46c28df3a5f6156(16822, "quest_s0a1t6_alab_exfil");
        return 1;
    }
    if (function_62b41959b3c5a9ca(player, 16937) && function_62b41959b3c5a9ca(player, 15725)) {
        player thread function_b46c28df3a5f6156(16939, "quest_s0a1t1_dlsuccess");
        return 1;
    }
    return 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb30
// Size: 0xb2
function function_b46c28df3a5f6156(var_391e7bba92e85f93, var_4152d19cb7e28515, var_9bdbff1841712808) {
    if (isdefined(level.var_7f1d1c7c6153a9bf)) {
        if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
            return 0;
        }
    }
    if (isplayer(self)) {
        player = self;
        if (function_c7d3c1cb4a3958cf(player, var_391e7bba92e85f93) || getdvarint(@"hash_7846a66ee6afec3e", 0)) {
            if (!player ent_flag(var_4152d19cb7e28515)) {
                player ent_flag_set(var_4152d19cb7e28515);
                if (istrue(var_9bdbff1841712808)) {
                    namespace_446fc987a980892f::function_c1c677ed7a1b1128(var_4152d19cb7e28515, [0:player], undefined, 0);
                } else {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5(var_4152d19cb7e28515, [0:player], undefined, undefined, 1);
                }
                return 1;
            } else {
                return 0;
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebe9
// Size: 0x76
function function_380c0caf9e64a771(squad) {
    if (function_f578373042c34e16(16939, "quest_s0a1t1_dlsuccess", squad)) {
        return 1;
    }
    if (function_f578373042c34e16(16132, "quest_s0a1t3_sabo_exfil", squad)) {
        return 1;
    }
    if (function_f578373042c34e16(16640, "quest_s0a2t5_extr_exfil_success", squad)) {
        return 1;
    }
    if (function_f578373042c34e16(17070, "quest_s0a3t1_s2fa_exfil", squad)) {
        return 1;
    }
    if (function_f578373042c34e16(16822, "quest_s0a1t6_alab_exfil", squad)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec67
// Size: 0x18
function function_35b3a590197d97a6(player) {
    return istrue(player.var_bee88b1ed3560170);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec87
// Size: 0x3d
function function_65ec7747ff7a397a(params) {
    if (isplayer(params.attacker)) {
        params.attacker thread function_da06d69b0b66e612(14960, "quest_s0a2t5_mindctrl_start", undefined, 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeccb
// Size: 0xe9
function function_979b0b77c84e497f(params) {
    if (isdefined(params.player)) {
        player = params.player;
        player endon("remove_super");
        player endon("death_or_disconnect");
        level endon("game_ended");
        player waittill("super_ready");
        super = player namespace_85d036cb78063c4a::getcurrentsuper();
        if (isdefined(super) && isdefined(super.staticdata) && isdefined(super.staticdata.ref)) {
            switch (super.staticdata.ref) {
            case #"hash_25d6c8e468976601":
                params.var_ebec497ff8b18a45 = super.staticdata.ref;
                callback::callback("on_super_ready", params);
                break;
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedbb
// Size: 0x1c
function function_bcfb5a0e96552599() {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16130, "quest_s0a1t3_itsatrap_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedde
// Size: 0x25
function function_1e972a37f996a61c(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16132, "quest_s0a1t3_saboteur_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee0a
// Size: 0x2f
function function_ea321f874c7d825(params) {
    if (isplayer(params.player)) {
        thread function_da06d69b0b66e612(15917, "quest_s0a1t3_6gst_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee40
// Size: 0x17b
function function_9fe3364da6f70780(params) {
    if (isplayer(params.player) && isdefined(params.ref)) {
        squadmembers = params.player namespace_ca7b90256548aa40::getSquadMembers();
        switch (params.ref) {
        case #"hash_b5dfe711233e9965":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t1_complete", [0:params.player], undefined, 0);
            break;
        case #"hash_b5dfe511233e963f":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t3_complete", squadmembers, undefined, 0);
            break;
        case #"hash_26dd8a57fed58730":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t45_complete", squadmembers, undefined, 0);
            break;
        case #"hash_a3e2c43acf843284":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a2t15_complete", squadmembers, undefined, 0);
            break;
        case #"hash_a3e2c73acf84373d":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a2t25_complete", squadmembers, undefined, 0);
            break;
        case #"hash_a3e2c03acf842c38":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a2t5_complete", squadmembers, undefined, 0);
            break;
        case #"hash_26dd9057fed590a2":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t2_complete", squadmembers, undefined, 0);
            break;
        case #"hash_b5dfe311233e9319":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t5_tiercomplete", squadmembers, undefined, 0);
            break;
        case #"hash_a3e2c63acf8435aa":
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a2t3_complete", squadmembers, undefined, 0);
            break;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefc2
// Size: 0xc8
function function_20a93cb9e4f580fe(params) {
    if (isplayer(params.player) && isdefined(params.var_5c1182cb547ca916) && isdefined(params.var_63242b74ae47b604)) {
        player = params.player;
        squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
        if (params.var_5c1182cb547ca916 == "jup_ob_raiders_of_the_lost_arms_complete") {
            if (params.var_63242b74ae47b604 == "jup_ob_loot_safes") {
                player.var_74d8dcd67ff30483 = "jup_ob_zombie_weapon_stash_kills";
            } else if (params.var_63242b74ae47b604 == "jup_ob_zombie_weapon_stash_kills") {
                player.var_74d8dcd67ff30483 = "jup_ob_loot_safes";
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf091
// Size: 0x674
function function_135da259745a566d(params) {
    if (isplayer(params.player) && isdefined(params.ref)) {
        player = params.player;
        squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
        var_1b903f780de3dc79 = spawnstruct();
        var_1b903f780de3dc79.scoreevent = #"hash_6d940c2bed869116";
        player callback::callback("zombie_score_event", var_1b903f780de3dc79);
        foreach (squadmember in squadmembers) {
            squadmember callback::callback("zombie_score_event", var_1b903f780de3dc79);
        }
        var_faab44449b51b7af = getrandomnavpoint(player.origin, 128);
        powerups::function_c38c89a662ac4f51("free_perk", var_faab44449b51b7af);
        if (isdefined(level.var_7f1d1c7c6153a9bf)) {
            if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
                return;
            }
        }
        player notify("mission_completed");
        switch (params.ref) {
        case #"hash_bf1e6b896218cdb":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t3_freezbrn_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_8a462acade0f335":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t3_itsatrap_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_ce8a39861430c5a8":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t3_6gst_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_464392e7ead3c3e4":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t1_fpsuccess", [0:player], undefined, undefined, 1);
            break;
        case #"hash_30e76e472fb048c9":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t1_gmbl_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_f5926de8272ccb1c":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t1_rwsuccess", [0:player], undefined, undefined, 1);
            break;
        case #"hash_cf42a9d8fc805d2f":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t1_wpsuccess", [0:player], undefined, undefined, 1);
            break;
        case #"hash_e8628ada6c23b518":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t5_blasted_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_68a1047a927afa1e":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t5_chaperone_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_33ca1415455ce28c":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t5_bringemon_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_1d78519cac9a446b":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t5_handsoff_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_8fd365e3bdbfbd91":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t5_nestwrecker_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_ad60eaa0e207438d":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t3_essaether_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_a66e8b09b5bd2bb5":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t3_bountyhunt_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_b5dbe8aa3dccbcd4":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t3_firepower_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_c433b2f38213a21c":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t3_restock_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_1627ae9ae7126532":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t5_frostbite_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_c8f86603ffc5a2d4":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t5_mindctrl_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_94bedd94f7ef2baf":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t1_delivery_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_4d6354242f93af13":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t2_mercclean_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_615a25c0ff004cd2":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t2_guardangel_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_6b9b64f5b9a1f92e":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t2_ascension_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_a682549e428cf4b0":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a2t2_reaper_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_c8842fe1f0db90be":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t2_shocked_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_dd1abfdefd6588b3":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t2_ac_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_4884cf3af5825a29":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t2_ghosted_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_b21a7398a3158cae":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t2_mostfirepwr_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_c26ddb64ed821cad":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t2_painttarget_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_d0152c167157b2b4":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t4_springcln_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_d20dd052e2ca08ce":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t4_closetime_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_b4085c6adbd2d722":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t2_firestarter_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_2d47f015d1d0be40":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a3t2_crashburn_success", squadmembers, undefined, undefined, 1);
            break;
        case #"hash_cec11b508f832d53":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t1_treasure_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_4ae55b1005252a01":
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t3_bomb_success", [0:player], undefined, undefined, 1);
            break;
        case #"hash_6749f49c81821f0c":
            if (isdefined(player) && isdefined(player.var_74d8dcd67ff30483)) {
                if (player.var_74d8dcd67ff30483 == "jup_ob_loot_safes") {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t5_raiders_safe", squadmembers, undefined, undefined, 1);
                } else if (player.var_74d8dcd67ff30483 == "jup_ob_zombie_weapon_stash_kills") {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a1t5_raiders_kill", squadmembers, undefined, undefined, 1);
                }
            }
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf70c
// Size: 0x32
function function_7078fecde61ab0db(params) {
    if (isplayer(params.player)) {
        params.player thread function_6db576722ffc548d();
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf745
// Size: 0xbe
function function_6db576722ffc548d() {
    if (isdefined(level.var_7f1d1c7c6153a9bf)) {
        if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
            return;
        }
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    if (isplayer(self)) {
        player = self;
        if ((function_c7d3c1cb4a3958cf(player, 16939) || getdvarint(@"hash_7846a66ee6afec3e", 0)) && !player ent_flag("heard_s0a1t1_directline_start_vo") && !function_62b41959b3c5a9ca(player, 16937)) {
            player ent_flag_set("heard_s0a1t1_directline_start_vo");
            var_ee18493f0e4d06c = randomintrange(1, 3);
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t1_dlstart" + string(var_ee18493f0e4d06c), [0:player], undefined, 0);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf80a
// Size: 0x8e
function function_568866da0244ea3() {
    if (isdefined(level.var_7f1d1c7c6153a9bf)) {
        if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
            return;
        }
    }
    if (isplayer(self)) {
        player = self;
        if (function_c7d3c1cb4a3958cf(player, 14966) && !player ent_flag("heard_s0a1t1_firepower_start_vo")) {
            player ent_flag_set("heard_s0a1t1_firepower_start_vo");
            var_ee18493f0e4d06c = randomintrange(1, 3);
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t1_fpstart" + string(var_ee18493f0e4d06c), [0:player], undefined, 0);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf89f
// Size: 0x14
function function_5f169bceaf46be72(params) {
    thread function_dc85f56a56f1d2c1();
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8ba
// Size: 0x8e
function function_dc85f56a56f1d2c1() {
    if (isdefined(level.var_7f1d1c7c6153a9bf)) {
        if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
            return;
        }
    }
    if (isplayer(self)) {
        player = self;
        if (function_c7d3c1cb4a3958cf(player, 15770) && !player ent_flag("heard_s0a1t1_rw_start_vo")) {
            player ent_flag_set("heard_s0a1t1_rw_start_vo");
            var_ee18493f0e4d06c = randomintrange(1, 3);
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t1_rwstart" + string(var_ee18493f0e4d06c), [0:player], undefined, 0);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf94f
// Size: 0x8e
function function_5e1833b74c8dc68f() {
    if (isdefined(level.var_7f1d1c7c6153a9bf)) {
        if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
            return;
        }
    }
    if (isplayer(self)) {
        player = self;
        if (function_c7d3c1cb4a3958cf(player, 14765) && !player ent_flag("heard_s0a1t1_wp_start_vo")) {
            player ent_flag_set("heard_s0a1t1_wp_start_vo");
            var_ee18493f0e4d06c = randomintrange(1, 3);
            namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t1_wpstart" + string(var_ee18493f0e4d06c), [0:player], undefined, 0);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9e4
// Size: 0x5f
function function_db6c1cb0e91c7041(a_players) {
    self waittill("escort_mission_vo");
    for (i = 0; i < a_players.size; i++) {
        if (isalive(a_players[i])) {
            player = a_players[i];
            break;
        }
    }
    if (isdefined(player)) {
        player thread function_da06d69b0b66e612(17060, "quest_s0a1t5_chaperone_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa4a
// Size: 0x3d
function function_eb1506a06c31da2b(params) {
    if (isplayer(params.player)) {
        params.player thread function_da06d69b0b66e612(14837, "quest_s0a1t1_gmbl_start", undefined, 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa8e
// Size: 0x3a
function function_7758c4422a68f415(params) {
    if (isplayer(params.player)) {
        params.player thread function_da06d69b0b66e612(16136, "quest_s0a1t5_handsoff_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfacf
// Size: 0x3a
function function_8e07c089e889784f(params) {
    if (isplayer(params.player)) {
        params.player thread function_da06d69b0b66e612(16144, "quest_s0a1t5_nestwrecker_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb10
// Size: 0x3a
function function_da6e19f48f3340b8(params) {
    if (isplayer(params.player)) {
        params.player thread function_da06d69b0b66e612(16651, "quest_s0a2t3_bountyhunt_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb51
// Size: 0x25
function function_628a2357515e077a(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16640, "quest_s0a2t5_extr_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb7d
// Size: 0x3a
function function_fbab6a79ccb766d2(params) {
    if (isplayer(params.player)) {
        params.player thread function_da06d69b0b66e612(16625, "quest_s0a2t1_delivery_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfbbe
// Size: 0x101
function private function_8b134141131f364a(params) {
    if (isdefined(params.var_beeb487603b69a3e) && isdefined(params.var_beeb487603b69a3e.type) && !istrue(params.var_beeb487603b69a3e.var_ae47fb2dd3b3a15f)) {
        function_f10f600ac4ee4c09("loot_cache_looted");
        switch (params.var_beeb487603b69a3e.type) {
        case #"hash_4cfd32bbd2544dc2":
        case #"hash_69b00973eec22e7e":
        case #"hash_8dc697e88cc411b2":
        case #"hash_a862ca2b6614f16e":
            function_f10f600ac4ee4c09("crate_looted");
            break;
        default:
            break;
        }
        if (istrue(params.var_beeb487603b69a3e.var_69971d3fabc4c29b)) {
            function_f10f600ac4ee4c09("loot_merc_camps", 1, 0);
        }
        thread function_da06d69b0b66e612(21175, "quest_s0a1t1_treasure_start", undefined, 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfcc6
// Size: 0x1a8
function private function_984089fc6559a650(params) {
    if (!isdefined(params)) {
        return;
    }
    var_4606405a751def54 = params.w_new getaltweapon();
    if (isdefined(params.w_take)) {
        if (isdefined(params.w_new)) {
            params.objweapon = params.w_new;
            level thread function_2862ad8db68c4dde(params);
        }
        if (isdefined(var_4606405a751def54)) {
            params.objweapon = var_4606405a751def54;
            level thread function_2862ad8db68c4dde(params);
        }
    }
    callback::callback("on_pap_machine_purchase", params);
    var_18cefa3acf061993 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_e6b742f2dbcdaa7a", #"pack_a_punch"));
    var_707bc435f8518b62 = function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_80f9b45ba3e6882e", #"buy"));
    lootid = 0;
    rarity = 0;
    if (isdefined(params.w_take)) {
        lootid = weapon::function_9c331f88be5a1478(params.w_take);
        if (isweapon(params.w_take)) {
            rarity = namespace_736197e4d378b91b::function_75e73212bbe447d9(params.w_take);
        }
    }
    var_f237807396377232 = spawnstruct();
    var_f237807396377232.rarity = rarity;
    var_f237807396377232.var_7d9803744a905b95 = var_18cefa3acf061993;
    var_f237807396377232.var_5c63b3413b883ca7 = params.var_29a8ba8c9dd43fd2;
    challenges::function_1ba256da09a9878a(self, lootid, undefined, undefined, 1, params.cost, var_707bc435f8518b62, var_f237807396377232);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfe75
// Size: 0x51
function private on_player_damaged(params) {
    if (isplayer(params.victim)) {
        player = params.victim;
        if (isdefined(player.var_e4f61eff2606b60c)) {
            player.var_e4f61eff2606b60c = 0;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfecd
// Size: 0x299
function private function_3cd8cd54ce47110a(var_d27680ff86693f5c) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.var_9a5071c6ea11a014)) {
        self.var_9a5071c6ea11a014 = [];
    }
    if (!isdefined(self.var_8e7883d15a62cbaf)) {
        self.var_8e7883d15a62cbaf = 0;
    }
    if (isdefined(var_d27680ff86693f5c.sweapon) && isdefined(var_d27680ff86693f5c.smeansofdeath)) {
        var_2bd7283211fa61e7 = points::function_591305dc9c07499b(var_d27680ff86693f5c.sweapon, var_d27680ff86693f5c.eattacker, var_d27680ff86693f5c.smeansofdeath);
        if (var_2bd7283211fa61e7 == "fire" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_FIRE") {
            if (!isdefined(self.var_9a5071c6ea11a014["fire"])) {
                self.var_9a5071c6ea11a014["fire"] = 1;
                function_726462b7bf0052b7();
            }
        } else if (var_2bd7283211fa61e7 == "cold" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_COLD") {
            if (!isdefined(self.var_9a5071c6ea11a014["cold"])) {
                self.var_9a5071c6ea11a014["cold"] = 1;
                function_726462b7bf0052b7();
            }
        } else if (var_2bd7283211fa61e7 == "electrical" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_ELEC" || var_d27680ff86693f5c.sweapon.basename == "jup_shock_stick_ob") {
            if (!isdefined(self.var_9a5071c6ea11a014["electrical"])) {
                self.var_9a5071c6ea11a014["electrical"] = 1;
                function_726462b7bf0052b7();
            }
        } else if (var_2bd7283211fa61e7 == "toxic" || var_d27680ff86693f5c.smeansofdeath == "MOD_ELEMENTAL_TOXIC") {
            if (!isdefined(self.var_9a5071c6ea11a014["toxic"])) {
                self.var_9a5071c6ea11a014["toxic"] = 1;
                function_726462b7bf0052b7();
            }
        }
    }
    if (isdefined(self.var_aaf0465944b061ed) && self.var_aaf0465944b061ed == "deathworm_kia") {
        if (isplayer(var_d27680ff86693f5c.eattacker)) {
            if (var_d27680ff86693f5c.eattacker.currentweapon.basename == "iw9_me_fists_mp") {
                var_d27680ff86693f5c.eattacker function_f10f600ac4ee4c09("punched_deathworm", 2);
            }
        }
    }
    if (isdefined(self.health) && isdefined(self.maxhealth) && self.health >= self.maxhealth) {
        self.var_ec0a5c743cc6a4da = gettime();
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1016d
// Size: 0x3d
function private function_726462b7bf0052b7() {
    if (!isagent(self)) {
        return;
    }
    self.var_8e7883d15a62cbaf = 0;
    if (!isdefined(level.var_3dacdac07404670c[self getentitynumber()])) {
        level.var_3dacdac07404670c[self getentitynumber()] = self;
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x101b1
// Size: 0x133
function private function_68feab32966b29b8() {
    level endon("game_ended");
    while (1) {
        wait(1);
        if (level.var_3dacdac07404670c.size > 0) {
            level.var_3dacdac07404670c = function_fdc9d5557c53078e(level.var_3dacdac07404670c, 1);
            i = 0;
            foreach (enemy in level.var_3dacdac07404670c) {
                if (isalive(enemy) && isdefined(enemy.var_8e7883d15a62cbaf) && isdefined(enemy.var_9a5071c6ea11a014)) {
                    if (enemy.var_8e7883d15a62cbaf > 5) {
                        enemy.var_8e7883d15a62cbaf = 0;
                        enemy.var_9a5071c6ea11a014 = [];
                        index = enemy getentitynumber();
                        level.var_3dacdac07404670c = array_remove_index(level.var_3dacdac07404670c, index, 1);
                    } else {
                        enemy.var_8e7883d15a62cbaf++;
                        i++;
                        if (i % 5 == 0) {
                            waitframe();
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102eb
// Size: 0x136
function function_ce3c3c0439296754() {
    if (!isagent(self)) {
        return;
    }
    var_ef6231bf3b964f83 = undefined;
    if (isdefined(self.var_ab04e643f38307e7) && isdefined(self.var_ab04e643f38307e7.source)) {
        if (isdefined(self.var_ab04e643f38307e7.source.grenade) && isdefined(self.var_ab04e643f38307e7.source.grenade.equipmentref) && self.var_ab04e643f38307e7.source.grenade.equipmentref == "equip_monkey_bomb") {
            var_ef6231bf3b964f83 = "equip_monkey_bomb";
        } else if (isdefined(self.var_ab04e643f38307e7.source.equipmentref)) {
            var_ef6231bf3b964f83 = "equip_decoy";
        }
    }
    return namespace_3bbb5a98b932c46f::isstunnedorblinded() || namespace_a624a0178cc156e4::is_stunned() || function_809f44597eff7229() || isdefined(var_ef6231bf3b964f83) || function_4a588aa51c7a9b4e() || function_e270857762b60945() || function_9ccbbc7f4170babf() || function_fe9986961a6c036e();
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10429
// Size: 0x25
function function_809f44597eff7229() {
    return isdefined(self._blackboard) && istrue(self._blackboard.var_f65c4810e7a7571f);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10456
// Size: 0x25
function function_4a588aa51c7a9b4e() {
    return isdefined(self.var_45483f8609f54440) && abs(self.var_45483f8609f54440 - gettime());
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10483
// Size: 0x21
function function_e270857762b60945() {
    return isarray(self.var_801217fe248465c4) && self.var_801217fe248465c4.size > 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104ac
// Size: 0x29
function function_9ccbbc7f4170babf() {
    return isdefined(self.lastsnapshotgrenadetime) && abs(self.lastsnapshotgrenadetime - gettime()) <= 5000;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104dd
// Size: 0x29
function function_fe9986961a6c036e() {
    return isdefined(self.var_4a9b1a3e622f082) && abs(self.var_4a9b1a3e622f082 - gettime()) <= 2000;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1050e
// Size: 0xd1
function private function_2862ad8db68c4dde(params) {
    var_2e82d0da8e21f4ae = params.w_take getaltweapon();
    if (array_contains(level.var_3fe26a6edf03f4f5, params.w_take) || array_contains(level.var_3fe26a6edf03f4f5, var_2e82d0da8e21f4ae)) {
        level.var_3fe26a6edf03f4f5 = array_add(level.var_3fe26a6edf03f4f5, params.objweapon);
        return;
    }
    if (array_contains(level.var_176c53feca4a2a03, params.w_take) || array_contains(level.var_176c53feca4a2a03, var_2e82d0da8e21f4ae)) {
        level.var_176c53feca4a2a03 = array_add(level.var_176c53feca4a2a03, params.objweapon);
        return;
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x105e6
// Size: 0x5c
function private function_d88408f2a5adf639(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_merccamp_fail");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10649
// Size: 0x5c
function private function_ed0bb8717f31f954(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_merccamp_success");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x106ac
// Size: 0x5e
function private function_5470291610d91652(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_merccamp_loot", 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10711
// Size: 0x7f
function private function_a9d19f968e2f15e9(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 16152)) {
            player thread function_da06d69b0b66e612(16152, "quest_s0a2t2_mercclean_start");
        } else if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_merccamp_approach", 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10797
// Size: 0x7a
function private on_player_laststand(params) {
    if (isplayer(self)) {
        trigger_struct = spawnstruct();
        trigger_struct.origin = self.origin;
        trigger_struct.radius = 600;
        trigger_struct.height = 10;
        function_729d94c0071a8916(trigger_struct);
        if (isdefined(self) && isplayer(self)) {
            ent_flag_init("downed_before_exfil");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10818
// Size: 0x86
function function_729d94c0071a8916(var_ceab0569f6f2612b) {
    self.trigger = spawn("trigger_radius", var_ceab0569f6f2612b.origin, 0, var_ceab0569f6f2612b.radius, var_ceab0569f6f2612b.height);
    thread function_ab0d44e43142e74e(self.trigger);
    waittill_any_2("death_or_disconnect", "laststand_revived");
    waitframe();
    if (isdefined(self) && isdefined(self.trigger)) {
        self.trigger delete();
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108a5
// Size: 0x52
function function_ab0d44e43142e74e(trigger) {
    self endon("death_or_disconnect");
    self endon("laststand_revived");
    while (1) {
        ent = trigger waittill("trigger");
        if (isplayer(ent)) {
            ent thread function_da06d69b0b66e612(15914, "quest_s0a2t2_guardangel_start", undefined, 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108fe
// Size: 0xc2
function on_spawn_redeploy_drone(params) {
    self endon("redeploy_drone_destroyed");
    level endon("game_ended");
    while (1) {
        throttle::function_f632348cbb773537(level.var_1d8645b41c9cb6a0, self);
        if (isdefined(self)) {
            players = getplayersinradius(self.origin, 400, 10000);
            if (players.size > 0) {
                foreach (player in players) {
                    if (isdefined(player)) {
                        player thread function_da06d69b0b66e612(16645, "quest_s0a2t2_ascension_start", undefined, 1);
                    }
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109c7
// Size: 0xe6
function function_83ba63f5ccc1143e(params) {
    level endon("game_ended");
    self endon("harvesterorb_end");
    self endon("orb_cleaned_up");
    while (1) {
        throttle::function_f632348cbb773537(level.var_972268e38976b7a9, self);
        if (isdefined(self)) {
            players = getplayersinradius(self.origin, 200, 10000);
            if (players.size > 0) {
                foreach (player in players) {
                    if (isdefined(player) && function_5acc35fc66331385(player, 16648) || getdvarint(@"hash_7846a66ee6afec3e", 0)) {
                        player thread function_da06d69b0b66e612(16648, "quest_s0a2t2_reaper_start");
                    }
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ab4
// Size: 0xd7
function function_1ab983924d3621aa() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        throttle::function_f632348cbb773537(level.var_cf8d941509d44c64, self);
        if (isdefined(self)) {
            players = getplayersinradius(self.origin, 800, 10000);
            if (players.size > 0) {
                foreach (player in players) {
                    if (isdefined(player) && function_5acc35fc66331385(player, 17077) || getdvarint(@"hash_7846a66ee6afec3e", 0)) {
                        player thread function_da06d69b0b66e612(17077, "quest_s0_a3t2_crashburn_start");
                    }
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b92
// Size: 0x25
function function_a14a93ab2f0b86d1(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16635, "quest_s0a2t2_safecrack_start");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10bbe
// Size: 0x25
function function_81747fd819153293(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16635, "quest_s0a2t2_safecrack_success");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10bea
// Size: 0x1e6
function private function_da06d69b0b66e612(var_391e7bba92e85f93, var_4152d19cb7e28515, var_9bdbff1841712808, var_9f67e993dd8f40d5) {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    if (isdefined(level.var_7f1d1c7c6153a9bf)) {
        if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
            return 0;
        }
    }
    if (isplayer(self)) {
        player = self;
        if (istrue(var_9f67e993dd8f40d5)) {
            if ((function_c7d3c1cb4a3958cf(player, var_391e7bba92e85f93) || getdvarint(@"hash_7846a66ee6afec3e", 0)) && !player ent_flag(var_4152d19cb7e28515)) {
                player ent_flag_set(var_4152d19cb7e28515);
                if (istrue(var_9bdbff1841712808)) {
                    namespace_446fc987a980892f::function_c1c677ed7a1b1128(var_4152d19cb7e28515, [0:player], undefined, 0);
                } else {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5(var_4152d19cb7e28515, [0:player], undefined, undefined, 1);
                }
                return 1;
            } else {
                return 0;
            }
        } else {
            squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
            if (function_f578373042c34e16(var_391e7bba92e85f93, var_4152d19cb7e28515, squadmembers)) {
                var_d4b7bf65cde0ce23 = 0;
                foreach (member in squadmembers) {
                    if (member ent_flag(var_4152d19cb7e28515)) {
                        var_d4b7bf65cde0ce23 = 1;
                    }
                }
                if (!var_d4b7bf65cde0ce23) {
                    foreach (member in squadmembers) {
                        member ent_flag_set(var_4152d19cb7e28515);
                    }
                    if (istrue(var_9bdbff1841712808)) {
                        namespace_446fc987a980892f::function_c1c677ed7a1b1128(var_4152d19cb7e28515, squadmembers, undefined, 0);
                    } else {
                        namespace_446fc987a980892f::function_d87d5deb069bf8e5(var_4152d19cb7e28515, squadmembers, undefined, undefined, 1);
                    }
                    return 1;
                } else {
                    return 0;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10dd8
// Size: 0xb3
function function_f578373042c34e16(var_391e7bba92e85f93, var_84e2ca49013808d2, players) {
    should_play_vo = 0;
    foreach (player in players) {
        if ((function_c7d3c1cb4a3958cf(player, var_391e7bba92e85f93) || getdvarint(@"hash_7846a66ee6afec3e", 0) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) && !player ent_flag(var_84e2ca49013808d2)) {
            should_play_vo = 1;
            break;
        }
    }
    return should_play_vo;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e93
// Size: 0xa0
function function_5acc35fc66331385(player, var_391e7bba92e85f93) {
    if (isplayer(player)) {
        squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
        foreach (member in squadmembers) {
            if (isplayer(member) && (function_c7d3c1cb4a3958cf(member, var_391e7bba92e85f93) || getdvarint(@"hash_7846a66ee6afec3e", 0))) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f3b
// Size: 0x3f
function function_182aeec2e4e170de(player) {
    if ((function_5acc35fc66331385(self, 17077) || getdvarint(@"hash_7846a66ee6afec3e", 0)) && !ent_flag("quest_s0_a3t2_crashburn_start")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10f82
// Size: 0x14
function private function_876eed02bb717d72(params) {
    thread function_1052ebe04c0369ac();
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10f9d
// Size: 0x38
function private function_1052ebe04c0369ac() {
    waitframe();
    if (isagent(self)) {
        if (!isalive(self)) {
            if (isdefined(self.lastattacker)) {
                self.lastattacker function_484194ec6ace15bb("abomination_grenade_swallow");
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10fdc
// Size: 0x5b
function private function_1d29b3ce33c72a69(params) {
    if (isdefined(params.player) && isdefined(params.vehicle)) {
        if (params.vehicle ent_flag_exist("armored_convoy_spawned")) {
            params.player function_f10f600ac4ee4c09("energy_mine_stop_convoy");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1103e
// Size: 0x61
function private function_3115bc3519ac2ea1() {
    self endon("death_or_disconnect");
    self.var_dd9a638faa62f464 = 0;
    while (namespace_876b4362ef613d7a::has_perk("specialty_speedcola")) {
        self waittill("reload");
        if (!ent_flag("speedcola_schematic_active")) {
            ent_flag_init("speedcola_schematic_active");
            ent_flag_set("speedcola_schematic_active");
            self.var_6502bc23ef7b1744 = gettime();
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x110a6
// Size: 0x68
function private on_player_revived(params) {
    if (!isdefined(params.reviver) || !isdefined(self)) {
        return;
    }
    if (squad_utility::function_9b1d18c04d310cfc(params.reviver, self)) {
        if (params.reviver namespace_876b4362ef613d7a::has_perk("specialty_quickrevive")) {
            params.reviver function_f10f600ac4ee4c09("schematic_quickrevive_revive");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11115
// Size: 0x28
function private function_900df0cbd73e399b(params) {
    if (namespace_876b4362ef613d7a::has_perk("specialty_elemental_pop")) {
        function_f10f600ac4ee4c09("schematic_elementalpop_proc", 2);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11144
// Size: 0x38
function private function_defeb316e4a936c(params) {
    if (isdefined(params) && isdefined(params.player)) {
        params.player function_484194ec6ace15bb("phd_flopper");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11183
// Size: 0x3b
function private function_735905adf14f7ebc(params) {
    if (!isplayer(self)) {
        return;
    }
    thread function_503c8745be6d4249(params);
    if (namespace_876b4362ef613d7a::has_perk("specialty_death_perception")) {
        function_f10f600ac4ee4c09("cyst_kill_death_perception", 2);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x111c5
// Size: 0x4a
function private on_merc_camp_recon_destroyed(params) {
    if (!isdefined(params.player) || !isplayer(params.player)) {
        return;
    }
    params.player function_f10f600ac4ee4c09("merc_camp_recon_destroyed", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11216
// Size: 0x8d
function private function_503c8745be6d4249(params) {
    level endon("game_ended");
    self endon("disconnect");
    wait(0.5);
    if (!isplayer(self)) {
        return;
    }
    location = vectorlerp(self.origin, params.var_db662a244a03025a.origin, 0.5);
    if (function_18a53d77df35c4c9(params.player, 16147)) {
        function_38e113a4c30f6c0d("obloot_ava_intel_aether_nest", location, self.angles, 0, 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x112aa
// Size: 0x4a
function private on_powerup_nuke_pickup(params) {
    if (!isdefined(params.player) || !isplayer(params.player)) {
        return;
    }
    params.player function_f10f600ac4ee4c09("powerup_nuke_pickup", 2);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x112fb
// Size: 0x10c
function private function_7d81180cfc146b9a(var_3a99d1cafe4a4bac) {
    if (!isdefined(var_3a99d1cafe4a4bac)) {
        return;
    }
    if (!isdefined(var_3a99d1cafe4a4bac.var_d9765f2679be19b9)) {
        var_3a99d1cafe4a4bac.var_d9765f2679be19b9 = [];
    }
    if (isdefined(var_3a99d1cafe4a4bac.var_21a8839dd03e31cd)) {
        if (var_3a99d1cafe4a4bac.var_21a8839dd03e31cd.size == 1) {
            var_3a99d1cafe4a4bac.var_21a8839dd03e31cd[0] function_484194ec6ace15bb("deathworm_solo_kill", 1, 0);
        }
        foreach (player in var_3a99d1cafe4a4bac.var_21a8839dd03e31cd) {
            if (array_contains(var_3a99d1cafe4a4bac.var_d9765f2679be19b9, player)) {
                continue;
            }
            player function_484194ec6ace15bb("zombie_deathworm", 3, 0);
            player function_484194ec6ace15bb("zombie_elite_general", 3, 0);
            var_3a99d1cafe4a4bac.var_d9765f2679be19b9[var_3a99d1cafe4a4bac.var_d9765f2679be19b9.size] = player;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1140e
// Size: 0x24
function private function_6685ae90a5b68220(params) {
    if (!isplayer(self)) {
        return;
    }
    self.var_e44a614acd5d4984 = gettime();
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11439
// Size: 0x9d
function private function_a0dc56fbe58ef8c3() {
    /#
        function_6e7290c8ee4f558b("on_merc_defend_success");
        function_a9a864379a098ad6("quest_s0a1t5_bringemon_start", "actor_jup_ob_enemy_specialist_commander", &function_8da31be1c7c3ed93);
        function_a9a864379a098ad6("equipment_kill", "tactical_affected_kill", &function_5342bd4e7a1c6d83);
        function_a9a864379a098ad6("deadwire_stun_special", "deathworm_solo_kill", &function_12a19de3d2346cbe);
        function_a9a864379a098ad6("merc_specialist_rusher", "destroy_sam_shepherd", &function_cd70135e68209b24);
        function_a9a864379a098ad6("jup_schematic_juggernog", "merc_stronghold_completed", &function_44bea892ed0bc101);
        function_a9a864379a098ad6("zero_damage_taken", "quest_s0a1t3_bomb_start", &function_5d400e584442179b);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x114dd
// Size: 0xa9
function private function_8da31be1c7c3ed93() {
    /#
        foreach (player in level.players) {
            for (i = 0; i < 50; i++) {
                player function_484194ec6ace15bb("quest_s0_a3t4_springcln_start");
            }
            player function_f10f600ac4ee4c09("quest_s0a1t3_6gst_success", 1, 0);
            for (i = 0; i < 10; i++) {
                player function_f10f600ac4ee4c09("quest_s0_a3t4_springcln_success", 1, 0);
            }
        }
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1158d
// Size: 0x96
function private function_5342bd4e7a1c6d83() {
    /#
        foreach (player in level.players) {
            for (i = 0; i < 50; i++) {
                player function_484194ec6ace15bb("equip_decoy");
            }
            player function_9db4c37d4f1415f("disconnect");
            player function_f10f600ac4ee4c09("quest_s0a2t4_heist_extfailure_conv", 1, 0);
        }
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1162a
// Size: 0x98
function private function_12a19de3d2346cbe() {
    /#
        foreach (player in level.players) {
            for (i = 0; i < 50; i++) {
                player function_484194ec6ace15bb("MOD_HEAD_SHOT", 2);
            }
            player function_f10f600ac4ee4c09("hipfire", 2, 0);
            player function_9db4c37d4f1415f("after_sprint_kill");
        }
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x116c9
// Size: 0x70
function private function_cd70135e68209b24() {
    /#
        foreach (player in level.players) {
            player function_f10f600ac4ee4c09("fullarmor", 2, 0);
            player function_9db4c37d4f1415f("<unknown string>");
        }
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11740
// Size: 0x98
function private function_44bea892ed0bc101() {
    /#
        foreach (player in level.players) {
            for (i = 0; i < 50; i++) {
                player function_484194ec6ace15bb("<unknown string>", 2);
            }
            player function_f10f600ac4ee4c09("<unknown string>", 2, 0);
            player function_9db4c37d4f1415f("<unknown string>");
        }
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x117df
// Size: 0x98
function private function_5d400e584442179b() {
    /#
        foreach (player in level.players) {
            for (i = 0; i < 50; i++) {
                player function_484194ec6ace15bb("<unknown string>", 2);
            }
            player function_f10f600ac4ee4c09("<unknown string>", 2, 0);
            player function_9db4c37d4f1415f("<unknown string>");
        }
    #/
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1187e
// Size: 0xc
function private on_approach_convoy(params) {
    
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11891
// Size: 0x1c
function private on_convoy_begin(params) {
    thread function_6efeef8ea59e4541();
    thread function_fd34dfd4299a5170();
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x118b4
// Size: 0xe6
function private function_fd34dfd4299a5170() {
    self endon("death");
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    while (1) {
        throttle::function_f632348cbb773537(level.var_16aba0b1e426588e, self);
        var_dca8f1d4194d00ca = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
        if (isdefined(self)) {
            foreach (player in level.players) {
                if (isdefined(player) && isdefined(var_dca8f1d4194d00ca)) {
                    if (distance2dsquared(player.origin, var_dca8f1d4194d00ca) <= squared(1200)) {
                        player thread function_da06d69b0b66e612(16095, "quest_s0a1t2_cnvy_approach");
                    }
                }
                wait(0.1);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x119a1
// Size: 0x177
function private function_6efeef8ea59e4541() {
    self endon("death");
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_fe525c27d1d0619e = namespace_8480efeffcd6e233::function_5bbdc39a533d9d57(self, "Awareness_Zone");
    var_d018f00fe7ac52a2 = namespace_8480efeffcd6e233::function_2403f7fe5d40cecc(var_fe525c27d1d0619e[0]);
    while (1) {
        throttle::function_f632348cbb773537(level.var_16aba0b1e426588e, self);
        if (isdefined(self)) {
            foreach (player in level.players) {
                var_dca8f1d4194d00ca = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
                if (isdefined(var_dca8f1d4194d00ca) && isdefined(player) && isdefined(player.origin)) {
                    var_d5c95aa3dab18949 = distance2dsquared(player.origin, var_dca8f1d4194d00ca);
                    if (var_d5c95aa3dab18949 <= squared(var_d018f00fe7ac52a2 * 1.75) && var_d5c95aa3dab18949 > squared(1200)) {
                        if (isdefined(player) && !player ent_flag("quest_s0a1t2_cnvy_approach") && (function_5acc35fc66331385(player, 16095) || getdvarint(@"hash_7846a66ee6afec3e", 0))) {
                            player thread function_da06d69b0b66e612(16095, "quest_s0a1t2_cnvy_farapproach");
                        }
                    }
                }
                wait(0.1);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11b1f
// Size: 0x25
function private on_engage_convoy(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16095, "quest_s0a1t2_cnvy_engage");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11b4b
// Size: 0x34
function private on_destroy_convoy(params) {
    if (isplayer(self) && !ent_flag("quest_s0a1t2_cnvy_keylooted")) {
        thread function_da06d69b0b66e612(16095, "quest_s0a1t2_cnvy_vehicledestroyed");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11b86
// Size: 0x15
function private veh_on_convoy_ended(params) {
    thread function_5528c46bef03fb6b(params);
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11ba2
// Size: 0x122
function private function_5528c46bef03fb6b(params) {
    params.var_2f5d509d7b71ce9a endon("instance_destroyed");
    self endon("death");
    while (1) {
        throttle::function_f632348cbb773537(level.var_844aeaa09ef5dd5a, self);
        if (isdefined(self) && vehicle::isvehicle() && isdefined(self.origin)) {
            players = getplayersinradius(self.origin, 240);
            if (players.size > 0) {
                foreach (player in players) {
                    wait(0.1);
                    if (isdefined(player) && (function_5acc35fc66331385(player, 16095) || getdvarint(@"hash_7846a66ee6afec3e", 0)) && player ent_flag("quest_s0a1t2_cnvy_vehicledestroyed") && !player ent_flag("quest_s0a1t2_cnvy_keylooted")) {
                        player thread function_da06d69b0b66e612(16095, "quest_s0a1t2_cnvy_closedestconvoy");
                    }
                }
            }
        } else {
            return;
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11ccb
// Size: 0x9d
function private on_approach_merc_stronghold(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 16946)) {
            player thread function_da06d69b0b66e612(16946, "quest_s0a1t4_mstr_approach");
        } else if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_mercstronghold_approach");
            if (isdefined(params.var_74368588170b0497)) {
                player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_mercstronghold_allforone_intro");
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11d6f
// Size: 0x3c
function private function_816b42385497212a(params) {
    player = params.player;
    if (isplayer(player)) {
        player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_mercstronghold_nokey");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11db2
// Size: 0x7d
function private on_unlock_merc_stronghold(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 16946)) {
            player thread function_da06d69b0b66e612(16946, "quest_s0a1t4_mstr_unlockdoor");
        } else if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_mercstronghold_unlock");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11e36
// Size: 0x7d
function private on_merc_stronghold_cleared_vo(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 16946)) {
            player thread function_da06d69b0b66e612(16946, "quest_s0a1t4_mstr_lastenemydown");
        } else if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_mercstronghold_lastenemy");
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11eba
// Size: 0x81
function private on_merc_stronghold_reinforcement(params) {
    player = params.player;
    if (isplayer(player)) {
        if (function_5acc35fc66331385(player, 16946)) {
            player thread function_da06d69b0b66e612(16946, "quest_s0a1t4_mstr_reenforce", 1);
        } else if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_mercstronghold_reinforce_resp", 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11f42
// Size: 0x75
function private function_d4f961679a3612e2(params) {
    player = params.player;
    warlord = params.warlord;
    if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
        if (warlord == "allforone") {
            player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_merccamp_allforone_success", 1);
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11fbe
// Size: 0x27
function private on_sabotage_start(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16445, "quest_s0a2t4_heist_extstart_conv", 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11fec
// Size: 0x25
function private on_abandon_sabotage_contract(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16445, "quest_s0a2t4_heist_extcontractcancel");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12018
// Size: 0x27
function private on_sabotage_failure_nocannister(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16445, "quest_s0a2t4_heist_extfailure_conv", 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12046
// Size: 0x27
function private on_sabotage_success_nocannister(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16445, "quest_s0a2t4_heist_extsuccess_conv", 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12074
// Size: 0x27
function private on_sabotage_success_withcannister(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(16445, "quest_s0a2t4_heist_extsuccess_cannister_conv", 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120a2
// Size: 0x25
function private on_merc_defend_started(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(17070, "quest_s0a3t1_s2fa_mdfcontractstart");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120ce
// Size: 0x25
function private on_merc_defend_approach_refractor(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(17070, "quest_s0a3t1_s2fa_mdfrefractor");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120fa
// Size: 0x25
function private on_merc_defend_damage_25(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(17070, "quest_s0a3t1_s2fa_mdfdamage25");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12126
// Size: 0x27
function private on_merc_defend_success(params) {
    if (isplayer(self)) {
        thread function_da06d69b0b66e612(17070, "quest_s0a3t1_s2fa_mdfsuccess_conv", 1);
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12154
// Size: 0x53
function private function_2ca2263723de3b23(params) {
    player = params.player;
    if (function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
        player thread function_da06d69b0b66e612(17078, "quest_s0a3t3_mercstronghold_allforone_success");
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x121ae
// Size: 0x64
function private function_9c039c6daa449c38(player) {
    squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
    if (function_f578373042c34e16(14966, "heard_s0a1t1_firepower_start_vo", squadmembers)) {
        return 1;
    } else if (function_f578373042c34e16(14967, "quest_s0a2t3_firepower_start", squadmembers)) {
        return 1;
    } else if (function_f578373042c34e16(14972, "quest_s0_a3t2_mostfirepwr_start", squadmembers)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1221a
// Size: 0x1f00
function function_3875d2b5b87e7e7d(var_3a99d1cafe4a4bac, objweapon, meansofdeath, inflictor) {
    self.modifiers = [];
    self.modifiers["mask"] = 0;
    self.modifiers["mask2"] = 0;
    self.modifiers["mask3"] = 0;
    self.modifiers["attachment_flags"] = 0;
    curtime = gettime();
    var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(objweapon);
    var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
    var_fe5a1e73a59d3b04 = spawnstruct();
    throttle::function_f632348cbb773537(level.var_1ba18dd27f458f88, var_fe5a1e73a59d3b04);
    if (!iskillstreakweapon(objweapon) && isplayer(self)) {
        attackerisinflictor = namespace_391de535501b0143::attackerisinflictor(self, inflictor, objweapon, meansofdeath);
        var_6456645411de0ee9 = self getvelocity();
        var_63d7d6bf10076ecb = vectornormalize(var_6456645411de0ee9);
        var_a2c3fea3986af52a = anglestoforward(self getplayerangles());
        var_776dafcc4fadbc14 = vectordot(var_a2c3fea3986af52a, var_63d7d6bf10076ecb);
        var_414d20858ffe7335 = length2dsquared(var_6456645411de0ee9);
        if (isdefined(var_3a99d1cafe4a4bac.attackerposition)) {
            attackerposition = var_3a99d1cafe4a4bac.attackerposition;
        } else {
            attackerposition = self.origin;
        }
        if (isdefined(var_6456645411de0ee9)) {
            if (var_6456645411de0ee9[0] != 0 || var_6456645411de0ee9[1] != 0 || var_6456645411de0ee9[2] != 0) {
                self.modifiers["moving_kill"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"moving_kill"));
            }
        }
        isbulletdamage = isbulletdamage(meansofdeath);
        ismeleedamage = ismeleedamage(meansofdeath);
        if ((isbulletdamage || ismeleedamage) && isdefined(var_776dafcc4fadbc14) && isdefined(var_414d20858ffe7335)) {
            if (abs(var_776dafcc4fadbc14) < 0.8 && var_414d20858ffe7335 > 50) {
                self.modifiers["strafing_kill"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"strafing_kill"));
            }
        }
        if (meansofdeath == "MOD_EXECUTION") {
            self.modifiers["execution"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"execution"));
        }
        if (!isdefined(objweapon) || !isdefined(objweapon.basename) || objweapon.basename == "none") {
            return;
        }
        if (function_fbb73b9050299404(var_3a99d1cafe4a4bac, objweapon, meansofdeath, curtime, var_cf4209c200f8bbf4)) {
            self.modifiers["oneshotkill"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_603a0dde50c94e47"));
        }
        if (meansofdeath == "MOD_MELEE") {
            self.modifiers["melee"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"melee"));
            if (var_cf4209c200f8bbf4 != "weapon_melee" && var_cf4209c200f8bbf4 != "weapon_melee2") {
                self.modifiers["gunbutt"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"gunbutt"));
            }
        }
        if (meansofdeath != "MOD_GRENADE" && meansofdeath == "MOD_HEAD_SHOT") {
            self.modifiers["headshot"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"headshot"));
        }
        if (!istrue(self isnightvisionon())) {
            self.modifiers["withoutnvgs"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"withoutnvgs"));
        }
        if (attackerisinflictor) {
            var_3c709d201f0772ad = namespace_391de535501b0143::getshotdistancetype(self, objweapon, meansofdeath, attackerposition, var_3a99d1cafe4a4bac);
            var_1fc88419bec39729 = math::round_float(distance(attackerposition, var_3a99d1cafe4a4bac.origin) / 39.37, 2);
            switch (var_3c709d201f0772ad) {
            case #"hash_e1ae7daca67ccc55":
                self.modifiers["pointblank"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_9235fb411f7d6762"));
                break;
            case #"hash_bbddd8225d923d3":
                self.modifiers["longshot"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_df27e56253c3dc8"));
                self setclientomnvar("ui_longshot_dist", var_1fc88419bec39729);
                self setclientomnvar("ui_longshot_special", islongshotspecial(attackerposition, var_3a99d1cafe4a4bac, objweapon));
                break;
            case #"hash_4364fa08acd17954":
                self.modifiers["longshot"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_df27e56253c3dc8"));
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_72a2c2883e780324"));
                self.modifiers["very_longshot"] = 1;
                self setclientomnvar("ui_longshot_dist", var_1fc88419bec39729);
                self setclientomnvar("ui_longshot_special", islongshotspecial(attackerposition, var_3a99d1cafe4a4bac, objweapon));
                break;
            }
            if (istrue(self.focus) || isdefined(self.var_54f2b36b0d0243e) && isdefined(self.lastshotfiredtime) && self.lastshotfiredtime == self.var_54f2b36b0d0243e && curtime - self.var_54f2b36b0d0243e <= 6000) {
                self.modifiers["holdingbreath"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"holdbreath"));
            }
            if (namespace_d19129e4fa5d176::isweaponsilenced(objweapon)) {
                self.modifiers["silencedkill"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"silenced"));
            }
            if (istrue(var_3a99d1cafe4a4bac.var_272746d0afd144b6)) {
                self.modifiers["victimimpairedkill"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_c7bef9ff3af2dead"));
                self.modifiers["detectedimpairedkill"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_9a9737f7fd4326f"));
            }
            if (namespace_3bbb5a98b932c46f::grenadeheldatdeath()) {
                self.modifiers["clutchkill"] = 1;
            }
            if (namespace_391de535501b0143::issurvivorkill(self)) {
                self.modifiers["low_health_kill"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"lowhealth"));
            }
            if (!self isonground()) {
                self.modifiers["airborne"] = 1;
            }
            if (self playermount() >= 0.5) {
                self.modifiers["mounted"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"mounted"));
            }
            if (self function_415fe9eeca7b2e2b()) {
                self.modifiers["ledgehanging"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"ledgehanging"));
            }
            if (isbulletdamage) {
                self.modifiers["bullet_damage"] = 1;
                var_3483795b0a68eb95 = self getweaponammoclip(objweapon);
                if (var_3483795b0a68eb95 <= 0) {
                    self.modifiers["last_bullet_kill"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_f0e5dbdf51c4ed5"));
                }
                var_ff3b6faa21cbea11 = objweapon.isauto;
                var_31a90ef4f5a008a8 = objweapon.issemiauto;
                var_31b6205854e6e340 = objweapon.burstcount;
                if (isdefined(var_ff3b6faa21cbea11) && istrue(var_ff3b6faa21cbea11)) {
                    self.modifiers["full_auto_kill"] = 1;
                    self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"full_auto_kill"));
                }
                if (isdefined(var_31a90ef4f5a008a8) && istrue(var_31a90ef4f5a008a8)) {
                    self.modifiers["semi_auto_kill"] = 1;
                    self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"semi_auto_kill"));
                }
                if (isdefined(var_31b6205854e6e340) && var_31b6205854e6e340 > 0) {
                    self.modifiers["burst_kill"] = 1;
                    self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"burst_kill"));
                }
                if (namespace_7e17181d03156026::isplayerads()) {
                    var_4da4661d6f703308 = self function_c603bed3b1c8d11(self.currentprimaryweapon);
                    if (var_4da4661d6f703308) {
                        self.modifiers["tac_stance"] = 1;
                        self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_3d20b9f56f230af1"));
                    } else {
                        self.modifiers["ads"] = 1;
                        self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ads"));
                    }
                } else {
                    self.modifiers["hipfire"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hipfire"));
                }
            } else if (var_cf4209c200f8bbf4 == "weapon_wonder") {
                if (namespace_7e17181d03156026::isplayerads()) {
                    self.modifiers["ads"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ads"));
                } else {
                    self.modifiers["hipfire"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hipfire"));
                }
            }
            if (namespace_3bbb5a98b932c46f::isstunnedorblinded()) {
                self.modifiers["impaired"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_811d4b3127f49d8a"));
            }
            if (namespace_391de535501b0143::events_issliding()) {
                self.modifiers["slidekill"] = 1;
                self.modifiers["sliding"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"slide"));
            } else if (self isonladder()) {
                self.modifiers["onladder"] = 1;
                self.modifiers["mask3"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask3"], function_e2ff8f4b4e94f723(#"hash_7f94e61c1787fc14", #"onladder"));
            } else if (namespace_391de535501b0143::function_78dbf8d8bcbed882(self, meansofdeath)) {
                self.modifiers["jumpkill"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"jumpkill"));
            }
            vehicle = namespace_f8065cafc523dba5::getvehicle(1);
            if (!isdefined(vehicle)) {
                stance = self getstance();
                switch (stance) {
                case #"hash_c6775c88e38f7803":
                    self.modifiers["standing_kill"] = 1;
                    self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"standing"));
                    break;
                case #"hash_d91940431ed7c605":
                    self.modifiers["prone_kill"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"prone"));
                    break;
                case #"hash_3fed0cbd303639eb":
                    self.modifiers["crouch_kill"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"crouch"));
                    break;
                }
            }
        } else if (var_cf4209c200f8bbf4 == "weapon_projectile") {
            if (isdefined(inflictor) && isdefined(inflictor.adsfire)) {
                if (inflictor.adsfire) {
                    self.modifiers["ads"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"ads"));
                } else {
                    self.modifiers["hipfire"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hipfire"));
                }
            }
        }
        vehicle = namespace_f8065cafc523dba5::getvehicle(1);
        if (isdefined(vehicle)) {
            self.modifiers["in_vehicle"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"invehicle"));
        }
        if (isdefined(inflictor) && istrue(inflictor.isequipment) && meansofdeath == "MOD_IMPACT" && !isthrowingknife(objweapon)) {
            self.modifiers["item_impact"] = 1;
        }
        if (namespace_a12dc1d0c8a64946::islauncherdirectimpactdamage(objweapon, meansofdeath)) {
            self.modifiers["launcher_impact"] = 1;
        }
        if (namespace_a12dc1d0c8a64946::islauncherdirectimpactdamage(objweapon, meansofdeath, 1)) {
            self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"launcher_impact"));
        }
        if (isdefined(self.lastadsstarttime) && curtime - self.lastadsstarttime <= 500 && (var_cf4209c200f8bbf4 == "weapon_sniper" || var_cf4209c200f8bbf4 == "weapon_dmr")) {
            self.modifiers["quickscope"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"quickscope"));
        }
        if (isdefined(self.lastweaponchangetime) && curtime - self.lastweaponchangetime <= 2500) {
            self.modifiers["weapon_change_kill"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_cc8e8817e7c0ad52"));
        }
        if (isdefined(self.lastreloadtime) && curtime - self.lastreloadtime <= 5000) {
            self.modifiers["reload_kill"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_99de7d2145a3c5b3"));
        }
        if (isdefined(self.var_887efc1f015b6a78) && curtime - self.var_887efc1f015b6a78 <= 5000) {
            self.modifiers["after_sprint_kill"] = 1;
            self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"after_sprint_kill"));
        }
        if (isdefined(self.secondaryweaponobj) && objweapon == self.secondaryweaponobj) {
            self.modifiers["secondary_weapon"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_1e98fcf253027213"));
        }
        if (istrue(self.inlaststand)) {
            self.modifiers["last_stand"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"laststand"));
        }
        if (self function_a7de57196f4b5d16()) {
            self.modifiers["vehiclelean"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"vehiclelean"));
        }
        if (meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_HEAD_SHOT" || weaponclass(objweapon) == "spread") {
            thread function_670f85d113f86acb();
            if (!isdefined(self.var_39a4aa8a028cb36e)) {
                self.var_39a4aa8a028cb36e = 1;
            } else {
                self.var_39a4aa8a028cb36e++;
                if (self.var_39a4aa8a028cb36e >= 2) {
                    namespace_391de535501b0143::function_c5f08330d9923476(self.var_39a4aa8a028cb36e);
                    if (self.var_39a4aa8a028cb36e >= 3) {
                        function_484194ec6ace15bb("one_shot_three_kills", 1, 0, objweapon);
                    }
                }
            }
        }
        if (isdefined(meansofdeath)) {
            switch (meansofdeath) {
            case #"hash_d8646db4e6ee3658":
                self.modifiers["fire_damage"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"fire"));
                break;
            case #"hash_b1078ff213fddba6":
                self.modifiers["impact_damage"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_40fb6aa7198fdbfd"));
                break;
            case #"hash_abb1587cdc6def23":
                self.modifiers["crush_damage"] = 1;
                self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"crush"));
                break;
            default:
                break;
            }
        }
        if (isdefined(objweapon.basename) && issubstr(objweapon.basename, "molotov") || issubstr(objweapon.basename, "thermite") || namespace_8472f410cbc5f0c::isdragonsbreathweapon(objweapon) || namespace_3544bf049e15c786::function_fc87aff67fb01e6f(objweapon)) {
            self.modifiers["fire_damage"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"fire"));
        }
        if (isdefined(inflictor) && isdefined(inflictor.equipmentref)) {
            if (inflictor.equipmentref == "equip_c4" || inflictor.equipmentref == "equip_claymore") {
                stuckto = inflictor getlinkedparent();
                if (isdefined(stuckto) && isdefined(stuckto.helperdronetype) && stuckto.helperdronetype == "radar_drone_recon") {
                    self.modifiers["recon_drone_explosive"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_8aff26c8039fd55d"));
                    if (level.challengesallowed && isdefined(stuckto.owner)) {
                        self.recondroneteammate = stuckto.owner;
                    }
                } else if (isdefined(stuckto) && stuckto namespace_1f188a13f7e79610::isvehicle()) {
                    self.modifiers["vehicle_explosive"] = 1;
                    self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_52873298033accf6"));
                    if (stuckto namespace_dbbb37eb352edf96::ishelicopter()) {
                        self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_a056c283bb968e1c"));
                    }
                }
            }
        }
        if (namespace_68e641469fde3fa7::isvehicleweapon(objweapon) && meansofdeath == "MOD_EXPLOSIVE") {
            self.modifiers["vehicle_explosive"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"hash_52873298033accf6"));
            if (function_858ed945747dfb28(objweapon)) {
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_a056c283bb968e1c"));
            }
        }
        if (namespace_f8d3520d3483c1::hasarmor()) {
            self.modifiers["wearingarmor"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"wearingarmor"));
        }
        if (namespace_f8d3520d3483c1::function_9bca5c1d23a3e0b3()) {
            self.modifiers["fullarmor"] = 1;
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"fullarmor"));
        }
        if (isdefined(objweapon.scope)) {
            var_7a4444efa68407fa = objweapon.scope;
            var_1439f86640d42e34 = function_7c612ac92ba98dcb(objweapon, var_7a4444efa68407fa);
            if (var_1439f86640d42e34 == "ironsdefault") {
                self.modifiers["attachment_flags"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"hash_866806f3e564c3f8"));
            } else if (var_1439f86640d42e34 == "reflex" || var_1439f86640d42e34 == "minireflex") {
                self.modifiers["attachment_flags"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"reflex"));
            } else if (var_1439f86640d42e34 == "hybrid") {
                self.modifiers["attachment_flags"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"hybrid"));
            } else if (var_1439f86640d42e34 == "acog") {
                self.modifiers["attachment_flags"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"acog"));
            } else if (var_1439f86640d42e34 == "holo") {
                self.modifiers["attachment_flags"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"holo"));
            }
            if (function_ec9cd761df1a3271(objweapon, var_7a4444efa68407fa)) {
                self.modifiers["attachment_flags"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"thermal"));
            }
        }
        var_e951084886b44231 = objweapon issilenced();
        if (istrue(var_e951084886b44231)) {
            self.modifiers["attachment_flags"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["attachment_flags"], function_e2ff8f4b4e94f723(#"hash_1ce058287dc8c73b", #"suppressor"));
        }
        if (meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH") {
            if (isdefined(inflictor.iscooked) && inflictor.iscooked) {
                self.modifiers["with_cooked_grenade_kill"] = 1;
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"hash_5b4eb501eaf86d4e"));
            }
        }
        namespace_391de535501b0143::function_245eb5b8f095001b(objweapon, meansofdeath, inflictor);
        var_5383eeee9c6e12d4 = self playergetzoomfov();
        if (isdefined(var_5383eeee9c6e12d4) && var_5383eeee9c6e12d4 <= 22) {
            self.modifiers["extreme_magnification_kill"] = 1;
            self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"extreme_magnification_kill"));
        }
        if (istrue(objweapon.isalternate)) {
            self.modifiers["isaltmode"] = 1;
            self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"isaltmode"));
        }
        if (self isswimming()) {
            self.modifiers["mask"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask"], function_e2ff8f4b4e94f723(#"hash_7f94e81c1787ff7a", #"swimming"));
            if (self function_6f55d55ccff20d14()) {
                self.modifiers["mask2"] = namespace_aad14af462a74d08::function_6d40f12a09494350(self.modifiers["mask2"], function_e2ff8f4b4e94f723(#"hash_7f94e71c1787fdc7", #"underwater"));
            }
        }
    }
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14121
// Size: 0x30
function function_670f85d113f86acb() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("watchForMoreBulletKillsInAFrameAE");
    self endon("watchForMoreBulletKillsInAFrameAE");
    wait(0.1);
    self.var_39a4aa8a028cb36e = 0;
}

// Namespace namespace_9dcaa84266dc73e2/namespace_838b439602b3acc7
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14158
// Size: 0xab
function function_fbb73b9050299404(var_3a99d1cafe4a4bac, objweapon, meansofdeath, curtime, var_cf4209c200f8bbf4) {
    if (var_cf4209c200f8bbf4 == "other" || var_cf4209c200f8bbf4 == "weapon_projectile") {
        return 0;
    }
    if (meansofdeath == "MOD_MELEE" || meansofdeath == "MOD_EXPLOSIVE") {
        return 0;
    }
    if (isdefined(var_3a99d1cafe4a4bac.var_ec0a5c743cc6a4da) && isdefined(var_3a99d1cafe4a4bac.var_b626e0a33fcf8cd)) {
        timediff = abs(var_3a99d1cafe4a4bac.var_ec0a5c743cc6a4da - var_3a99d1cafe4a4bac.var_b626e0a33fcf8cd);
        if (timediff <= 25) {
            return 1;
        }
    }
    return 0;
}

