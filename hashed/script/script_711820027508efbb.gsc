#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using script_2583ee5680cf4736;
#using script_7b2517368c79e5bc;
#using script_22f1701e151b9d12;
#using script_7d3e27aa82b5d70b;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4fa7e9e11630166c;
#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using script_5d265b4fca61f070;
#using scripts\common\scene.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\values.gsc;
#using script_6bffae1b97f70547;
#using script_7c40fa80892a721;
#using script_639bf783929acf9b;
#using script_5640d32580c6bc7d;
#using script_485622d93fa7e4cf;
#using script_443d99fe707f1d9f;
#using script_64316dc775e91122;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_398835140857d740;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using script_71721925888affd9;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\throttle.gsc;
#using script_1059e26302ca1a7f;
#using script_18b61963cd1351ff;
#using script_214930d31a3a8321;
#using script_1f97a44d1761c919;
#using script_25d8bf4d117350f3;
#using script_4e6e58ab5d96c2b0;
#using script_100adcc1cc11d2fa;
#using script_3f9c618c4c35ed2;
#using scripts\mp\gametypes\ob.gsc;
#using script_a85dcc51940223c;
#using script_711611a499b96971;
#using script_2b264b25c7da0b12;
#using script_46c7c73b1a7e4773;
#using script_860bfdfe82326e3;
#using script_5080d40cd904ba73;
#using script_7e41e37180e554f;
#using script_3dd78271adfa603d;
#using script_609bf2ebee0114b7;
#using script_711820027508efbb;
#using script_c6b9e8fb3a7de37;
#using script_7e681eb8fbdc4f5e;
#using scripts\mp\mp_agent.gsc;
#using scripts\common\ai.gsc;
#using script_371b4c2ab5861e62;
#using script_60dd6e3992c1f29;
#using script_bee418c8d4a317c;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_832e49249d603e03;

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x147e
// Size: 0x1a3
function function_88afb65283d1a3e() {
    load_vfx();
    level thread function_35b9ded36a8bcce1();
    level flag_wait("ob_systems_init_complete");
    function_79a555dd34feed87();
    level flag_wait("ob_infil_completed");
    function_5fcb0fa5dbc72f8f();
    level.var_2e2204c429664d9b = 1;
    /#
        level thread function_16bdae112495ab84();
        level thread function_1e17ccaf1ad17400();
        level thread function_fe21e07ce7838f5f();
        level thread function_593077dfc1e1657d();
        level thread function_a00c3afcd14fd793();
        level thread function_264bba50be9515c();
        level thread function_4dc333dd10638989();
        level thread function_8ba99af63b72bb52();
        level thread function_cd8296488b7d820();
        level thread function_683d92ea9df62d79();
        level thread function_2924f46f04cd9493();
        level thread function_1f971324a3809867();
        level thread function_af19431e47ca1667();
    #/
    level thread function_30f13bfa1f16113a();
    if (getdvarint(@"hash_8845e2321e6bb67a", 0) == 0) {
        namespace_570818d1f29fa41::function_73952f00a88cf059();
    }
    callback::add("aethernest_cyst_destroyed", &function_735905adf14f7ebc);
    level thread function_160ae06b18d8a8c4();
    if (isdefined(level.players) && isdefined(level.players[0]) && isdefined(level.players[0].team)) {
        level.allyteam = level.players[0].team;
    }
    namespace_e82bfd865c02eb4b::function_8e2171f77cd463b();
    namespace_87ebdf00d835c96b::function_ea74b31deb2a73db();
    level.var_c921cb81dd47af55 namespace_87ebdf00d835c96b::function_f246b3550eda8b6f();
    wait 5;
    if (istrue(getdvarint(@"hash_d026c8ab01657c85", 0))) {
        return;
    }
    namespace_446fc987a980892f::playconversation("s2_portal_meet_intro", level.players);
    level thread namespace_b311bec7b243be6d::function_e7fbcc8e485e01de();
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1629
// Size: 0x80
function function_35b9ded36a8bcce1() {
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    level thread namespace_b3f32c8cb80b8124::function_aadc1c81b3fd1dd2(level.players);
    foreach (player in level.players) {
        player clearsoundsubmix("jup_ob_prematch", 2);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b1
// Size: 0x224
function load_vfx() {
    level._effect["protection_bubble"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_acv_protection_bubble.vfx");
    level._effect["item_glow_toxic"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_toxic_trail.vfx");
    level._effect["item_glow_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_elec_trail.vfx");
    level._effect["item_glow_fire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_fire_trail.vfx");
    level._effect["item_glow_ice"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_cryo_trail.vfx");
    level._effect["item_portal"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_geotrail_portal.vfx");
    level._effect["zombie_death"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_spawn.vfx");
    level._effect["zombie_soul"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_trail.vfx");
    level._effect["zombie_soul_impact"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_soul_impact.vfx");
    level._effect["escort_laser_ch"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_ch.vfx");
    level._effect["escort_laser_absorb"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_absorb.vfx");
    level._effect["escort_laser_sm"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_sm.vfx");
    level._effect["escort_laser_glow_energy_point"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_glow_energy_point.vfx");
    level._effect["acv_orb_activated_ground_up"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_acv_orb_activated_ground_up.vfx");
    level._effect["acv_orb_activated_ground_connected"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_acv_orb_activated_ground_connected.vfx");
    level._effect["acv_emp_blast"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_emp_blast.vfx");
    level._effect["ambient_emp_static_env"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_uav_idling_electricity_env.vfx");
    level._effect["ambient_emp_static"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_uav_idling_electricity.vfx");
    level._effect["chemist_spine"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_jup_mp_hotel_10_crystal_01_chemist.vfx");
    level._effect["chemist_head"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_jup_mp_hotel_10_crystal_06_chemist.vfx");
    level._effect["rift_teleport"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_send.vfx");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18dd
// Size: 0x94
function function_79a555dd34feed87() {
    level.var_6d298bb3b2c8bf0 = 0;
    level.var_378ba68d7497e1d8 = [];
    level.var_5f9b7aebe78d69a0 = 1;
    thread namespace_b000de497fab9bf4::function_ccde446fe7425514();
    thread namespace_88d9f8b28d831818::function_ecd079f7925cc275();
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
    level.var_3e0d352ee4dcfc14 = getstruct("emp_mimic_spawn", "script_noteworthy");
    namespace_10e75ada2a87ed56::function_2a31a579270a3a95();
    callback::add("ob_dark_aether_exit_used", &function_bb359d35003764ad);
    callback::add("teleport_movie_complete", &play_outro_movie);
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_RESCUEINTRO";
    namespace_aef5acbeff8c8d31::function_f7dcc50fd890c4d4();
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1979
// Size: 0x93
function function_5fcb0fa5dbc72f8f() {
    if (level.players.size == 1) {
        level.players[0] namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(1);
    }
    level.activeplayers = level.players;
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s2_mi_invest_rift", 3);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a14
// Size: 0x1fd
function function_63ff16d8780772f7() {
    var_da8d68cc5b875714 = getstructarray("exfil_loc", "targetname");
    foreach (s_exit in var_da8d68cc5b875714) {
        var_d0809b7599d6c0c3 = spawnscriptable("s2_ob_jup_scriptable_rift_gate_vortex", s_exit.origin, s_exit.angles);
        earthquake(0.3, 10, s_exit.origin, 30000);
    }
    var_d0809b7599d6c0c3 setscriptablepartstate("vortex", "on");
    exploder("stadium_lightnings");
    wait 3;
    var_d0809b7599d6c0c3 setscriptablepartstate("vortex", "off");
    var_e759223f74ab2a4e = spawnscriptable("s2_ob_jup_scriptable_rift_portal_formation", s_exit.origin, s_exit.angles);
    var_e759223f74ab2a4e setscriptablepartstate("formation_vfx", "active");
    if (!isdefined(level.riftgate)) {
        level.var_59a5ab1b4256bb79.vo_ent playsoundonmovingent("s2_rock_charging_completed");
    }
    level thread function_93005473aab0569f();
    wait 5;
    level notify("start_betrayal");
    wait 8.5;
    foreach (s_exit in var_da8d68cc5b875714) {
        gate_model = namespace_4164bc931714b00b::spawn_script_model(s_exit, "jup_zm_rift_portal_small", 1, 1);
        level.riftgate = gate_model;
        if (isdefined(gate_model)) {
            gate_model.targetname = "dark_aether_exit";
            level.riftgate setscriptablepartstate("aether_exit_body", "rift_mission_exit");
        }
    }
    wait 2;
    var_e759223f74ab2a4e setscriptablepartstate("formation_vfx", "off");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c19
// Size: 0x2b
function function_93005473aab0569f() {
    level endon("game_ended");
    level endon("disconnect");
    wait 0.1;
    namespace_446fc987a980892f::playevent("s2_rock_charging_success", level.players);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4c
// Size: 0x42
function function_6023fdec597394f3() {
    level.var_fe5c2634af4ea573 = "MISSION_OBJ_ESCAPE_RIFT";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["escape"]);
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c96
// Size: 0x15
function function_f531ac7f1617663c(var_aeddcd74a8fad53c) {
    wait var_aeddcd74a8fad53c;
    level notify("respawn_exit");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb3
// Size: 0x36
function function_fc99ac2e6ca4ea02() {
    thread namespace_446fc987a980892f::playevent("s2_portal_reopen", level.players);
    namespace_b000de497fab9bf4::function_e7995c28c01d9c();
    level thread namespace_446fc987a980892f::playevent("quest_s2_exfil_ready", level.players);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf1
// Size: 0x3d
function function_bb359d35003764ad(params) {
    if (isplayer(self)) {
        namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s2_mi_escape_rift", 3);
        namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s2_rift_mission_complete", 3);
        function_b8b15f7f0820954e([self]);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d36
// Size: 0x15e
function play_outro_movie(params) {
    foreach (player in level.players) {
        player stoplocalsound("mus_ob_rr_easteregg_115_instrumental");
        player setplayermusicstate("");
    }
    var_7848ff3f98ef4a73 = 0;
    var_8c6c2faac72ea626 = 10;
    videoname = "jup_ob_s2_outro";
    videoduration = 130;
    var_1bab87417f147c8f = 0;
    self setplayermusicstate("");
    self setsoundsubmix("jup_ob_endgame");
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 1, 0);
    wait 2;
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 0, 0);
    thread scripts\common\utility::letterbox_enable(1);
    level.battlechatterdisabled = 1;
    self setclientomnvar("ui_br_bink_overlay_state", var_8c6c2faac72ea626);
    utility::hidehudenable();
    self playcinematicforplayer(videoname, 1, var_1bab87417f147c8f);
    wait videoduration - 6.6;
    self stopcinematicforplayer();
    self setclientomnvar("ui_br_bink_overlay_state", var_7848ff3f98ef4a73);
    level.battlechatterdisabled = 0;
    level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(self, 1, 0);
    level thread namespace_134d54e39331ee45::function_bf01aba31e9023d1(0, [self], "mission");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9c
// Size: 0x52
function function_5b64b44ac4335194(params) {
    namespace_98c7625238714297::function_447c6ab4bea16b52("startup", "REV_OB_ZOMBIE_STRONGHOLD", &namespace_f8638ef0be82c4bd::function_1cf627178cf6bee, &namespace_76ad7cb87360f921::function_fd69cf02ba4d90a2);
    namespace_70aa82e7f409bc33::function_8b5b2a3392fc7e2a("ActivityBegin", &function_f197a9b4e6016de4, "REV_OB_ZOMBIE_STRONGHOLD");
    namespace_70aa82e7f409bc33::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_36f7ffabcc2f74b8, "REV_OB_ZOMBIE_STRONGHOLD");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef6
// Size: 0x3a
function function_6f4043d9fde2be30(infostruct) {
    var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(self);
    if (isdefined(var_d1c7613187e69022)) {
        var_d1c7613187e69022.var_3f8e801d4fddc931 = 0;
    }
    level.var_a2bcb45a0ad08c1d = self;
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f38
// Size: 0x87
function function_41c2fe3bef71c11d(infostruct) {
    wait 3;
    thread namespace_446fc987a980892f::playevent("s2_boss_death", level.players);
    wait 1;
    thread namespace_446fc987a980892f::playevent("s2_portal_reopen", level.players);
    wait 3;
    namespace_68270f885c7fd3ef::function_5314ee75857e6c63(level.riftgate);
    wait 3;
    level.var_fe5c2634af4ea573 = "MISSION_OBJ_ESCAPE_RIFT";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["escape"]);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc7
// Size: 0xdd
function function_36f7ffabcc2f74b8(infostruct) {
    if (!isdefined(self.var_779e11fc33f215f9)) {
        return;
    }
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.activeplayers);
    function_c7311cb3f768f21e("ambient_blocker_stronghold_in_progress", 0);
    wait 6;
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s2_mi_rescue_companion", 3);
    }
    level thread function_115252b53d299802();
    namespace_2abc885019e1956::function_cd45408bd44fab07("ob_jup_items_keys_rift_run_s2", 1, self.var_779e11fc33f215f9.origin + anglestoup(self.var_779e11fc33f215f9.angles) * 10, undefined, undefined, 1);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20ac
// Size: 0x36
function function_d4b6a2f00f5f8d34(infostruct) {
    if (!isdefined(self.var_75fdecfcaa65d115)) {
        return;
    }
    if (isdefined(level.Chemist)) {
        namespace_570818d1f29fa41::function_e5f38d39d7fe6cd(level.Chemist);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20ea
// Size: 0x46
function function_a420046da7bae925(params) {
    namespace_98c7625238714297::function_447c6ab4bea16b52("contract", "REV_OB_OUTLAST", &namespace_edd624734aa27359::function_42696fef39309a29, &namespace_132af1548678fcbe::function_fd69cf02ba4d90a2, ["OUTLAST_SIRA"]);
    namespace_70aa82e7f409bc33::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_4cff8aa3f0645696, "REV_OB_OUTLAST");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2138
// Size: 0x1d
function function_4cff8aa3f0645696(var_6f8af5eb76deac21) {
    level thread function_63ff16d8780772f7();
    level thread namespace_e82bfd865c02eb4b::function_8ca3825e113a2579();
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x215d
// Size: 0x188
function function_115252b53d299802() {
    while (true) {
        if (!flag("fletcher_mall_rescued")) {
            exploder("searchlights");
            level.var_376e6e8117393127 thread namespace_e82bfd865c02eb4b::function_9f0dd15f85ea6a7c();
            flag_set("fletcher_mall_rescued");
            objectivename = "regroup_acv_icon";
            level.var_378ba68d7497e1d8[objectivename] = requestobjectiveid();
            objective_add_objective(level.var_378ba68d7497e1d8[objectivename], "current", level.var_59a5ab1b4256bb79.origin + (0, 0, 40), "jup_ui_map_icon_obj_toc");
            update_objective_setbackground(level.var_378ba68d7497e1d8[objectivename], 1);
            objective_addalltomask(level.var_378ba68d7497e1d8[objectivename]);
            objective_playermask_showtoall(level.var_378ba68d7497e1d8[objectivename]);
            namespace_446fc987a980892f::playconversation("s2_jailbreak_success", level.players);
            searchlights = getstructarray("search_light", "targetname");
            foreach (light in searchlights) {
                var_d0e64214e51fdb3b = spawnscriptable("jup_ob_s2_spotlight", light.origin, light.angles);
                var_d0e64214e51fdb3b setscriptablepartstate("collision", "on");
            }
            return;
        }
        wait 1;
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ed
// Size: 0x19b
function function_20c25d1093aa4277() {
    if (!isdefined(level.var_fd811442ea11f020) || level.var_fd811442ea11f020 < 3) {
        level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_rr_bossbattle");
        level.var_da9b2f2f9f40b289 = 1;
    }
    spawnloc = getstructarray("exfil_loc", "targetname");
    var_9d75b8ed6b1f25a8 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_mangler_hvt_emp", spawnloc[0].origin, spawnloc[0].angles, "team_two_hundred");
    level.var_9d75b8ed6b1f25a8 = var_9d75b8ed6b1f25a8;
    waitframe();
    level.var_9d75b8ed6b1f25a8 setscriptablepartstate("emp_vfx", "on");
    playfxontag(getfx("rift_teleport"), level.var_9d75b8ed6b1f25a8, "tag_origin");
    var_9d75b8ed6b1f25a8.ignore_nuke = 1;
    var_9d75b8ed6b1f25a8.var_2c94b75746ceabe2 = 1;
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_BOSS";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    var_9d75b8ed6b1f25a8 scripts\common\callbacks::add("on_zombie_ai_killed", &function_acf65a6de416e746);
    var_9d75b8ed6b1f25a8 scripts\common\callbacks::add("on_zombie_ai_damaged", &function_478f7146fc154959);
    level.var_4c89f0d11877a1d0 = &function_1033d0b122c0d217;
    level.var_7b6c1188e8bce4a1 = &function_63c8f10cc5040b12;
    level.var_f793f6cdd191e2c6 = &function_f68f646faf36a1e1;
    level.var_71bc535dbd0ddb3f = &function_5c1c6e19998e77ca;
    wait 1;
    stopfxontag(getfx("rift_teleport"), level.var_9d75b8ed6b1f25a8, "tag_origin");
    wait 2;
    level.var_45cbd577bdeb831b = 1;
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2490
// Size: 0x2d3
function function_d3ae53a6be4cc8fc() {
    if (!isdefined(level.var_fd811442ea11f020) || level.var_fd811442ea11f020 < 3) {
        level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_rr_bossbattle");
        level.var_da9b2f2f9f40b289 = 1;
    }
    var_39d97be6a0b0016 = getstruct("aether_gas_spawn", "script_noteworthy");
    if (isdefined(var_39d97be6a0b0016) && distancesquared(level.var_d31429e0a68259a4.origin, var_39d97be6a0b0016.origin) > 1000000) {
        level.var_d31429e0a68259a4 forceteleport(var_39d97be6a0b0016.origin, level.var_d31429e0a68259a4.angles, 9999999, 0);
        level.var_1b8210e0db900e1a forceteleport(var_39d97be6a0b0016.origin, level.var_1b8210e0db900e1a.angles, 9999999, 0);
        level.var_2692e299e63da688 forceteleport(var_39d97be6a0b0016.origin, level.var_2692e299e63da688.angles, 9999999, 0);
    }
    level.var_325b7d271026b22d = level.var_d31429e0a68259a4.origin;
    level.var_fa910ab739efb783 = level.var_d31429e0a68259a4.angles;
    level.var_d31429e0a68259a4 forceteleport((-999999, -999999, -999999), (0, 0, 0), 9999999, 0);
    spawnloc = getstructarray("exfil_loc", "targetname");
    var_9d75b8ed6b1f25a8 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_mangler_hvt_emp", level.var_325b7d271026b22d, level.var_fa910ab739efb783, "team_two_hundred");
    level.var_9d75b8ed6b1f25a8 = var_9d75b8ed6b1f25a8;
    var_9d75b8ed6b1f25a8.ignore_nuke = 1;
    var_9d75b8ed6b1f25a8.var_2c94b75746ceabe2 = 1;
    var_9d75b8ed6b1f25a8 scripts\common\callbacks::add("on_zombie_ai_damaged", &function_478f7146fc154959);
    var_9d75b8ed6b1f25a8 scripts\common\callbacks::add("on_zombie_ai_killed", &function_acf65a6de416e746);
    level.var_4c89f0d11877a1d0 = &function_1033d0b122c0d217;
    level.var_7b6c1188e8bce4a1 = &function_63c8f10cc5040b12;
    level.var_f793f6cdd191e2c6 = &function_f68f646faf36a1e1;
    level.var_71bc535dbd0ddb3f = &function_5c1c6e19998e77ca;
    waitframe();
    var_9d75b8ed6b1f25a8 thread function_a7b05e9a9ec0a5bb();
    function_f209f2f1f11ef802();
    level thread spawn_boss_fight_emp_mimic();
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_BOSS";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    wait 1;
    level.var_d31429e0a68259a4 scripts\common\ai::stop_magic_bullet_shield();
    level.var_d31429e0a68259a4 kill();
    level.var_45cbd577bdeb831b = 1;
    level.var_c921cb81dd47af55.ignoreme = 1;
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x276b
// Size: 0xb5
function function_7dd3fcb295e8f1e9() {
    level endon("game_ended");
    level endon("disconnect");
    self endon("death");
    animstruct = spawnstruct();
    animstruct.origin = self.origin;
    animstruct.angles = self.angles;
    val::set("humangun_transformed", "damage", 0);
    val::set("humangun_transformed", "ignoreme", 1);
    scripts\asm\shared\mp\utility::animscripted_single_relative("humangun_turn_from", animstruct);
    scripts\asm\shared\mp\utility::animscripted_clear();
    val::reset("humangun_transformed", "damage");
    val::reset("humangun_transformed", "ignoreme");
    level notify("minions_transformed");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2828
// Size: 0x1f7
function function_f209f2f1f11ef802() {
    var_cc8cab888828968d = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_base_armored_light", level.var_1b8210e0db900e1a.origin, level.var_1b8210e0db900e1a.angles, "team_two_hundred");
    var_8392d4885281e667 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_base_armored_light", level.var_2692e299e63da688.origin, level.var_2692e299e63da688.angles, "team_two_hundred");
    var_cc8cab888828968d namespace_14d36171baccf528::function_c37c4f9d687074ff("body_c_jup_sp_enemy_pmc_spforce_05_zombie", "head_c_jup_ob_enemy_pmc_capt_01");
    var_8392d4885281e667 namespace_14d36171baccf528::function_c37c4f9d687074ff("body_c_jup_sp_enemy_pmc_spforce_05_zombie", "head_c_jup_ob_enemy_pmc_capt_01");
    level.var_1b8210e0db900e1a forceteleport((-999999, -999999, -999999), (0, 0, 0), 9999999, 0);
    level.var_2692e299e63da688 forceteleport((-999999, -999999, -999999), (0, 0, 0), 9999999, 0);
    var_cc8cab888828968d.health = 28000;
    var_cc8cab888828968d.maxhealth = 28000;
    var_8392d4885281e667.health = 28000;
    var_8392d4885281e667.maxhealth = 28000;
    waitframe();
    var_cc8cab888828968d thread function_7dd3fcb295e8f1e9();
    var_8392d4885281e667 thread function_7dd3fcb295e8f1e9();
    level waittill("minions_transformed");
    playfxontag(getfx("chemist_head"), var_cc8cab888828968d, "j_head");
    playfxontag(getfx("chemist_head"), var_8392d4885281e667, "j_head");
    playfxontag(getfx("chemist_spine"), var_cc8cab888828968d, "j_spine4");
    playfxontag(getfx("chemist_spine"), var_8392d4885281e667, "j_spine4");
    level.var_1b8210e0db900e1a scripts\common\ai::stop_magic_bullet_shield();
    level.var_1b8210e0db900e1a kill();
    level.var_2692e299e63da688 scripts\common\ai::stop_magic_bullet_shield();
    level.var_2692e299e63da688 kill();
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a27
// Size: 0xd6
function spawn_boss_fight_emp_mimic() {
    level notify("spawn_boss_fight_emp_mimic");
    level endon("spawn_boss_fight_emp_mimic");
    level endon("game_ended");
    level endon("disconnect");
    spawnloc = getstructarray("exfil_loc", "targetname");
    if (!isdefined(spawnloc)) {
        return;
    }
    level.var_106cf39886efa45 = undefined;
    while (!istrue(level.var_81cafec2c7b77aae)) {
        wait randomintrange(30, 60);
        if (!istrue(level.var_81cafec2c7b77aae)) {
            return;
        }
        if (!isdefined(level.var_106cf39886efa45) || !isalive(level.var_106cf39886efa45)) {
            level.var_106cf39886efa45 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_mimic_hvt_emp", spawnloc[0].origin, spawnloc[0].angles, "team_two_hundred");
        }
        level.var_106cf39886efa45 waittill("death");
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b05
// Size: 0x181
function function_acf65a6de416e746(params) {
    if (istrue(level.var_da9b2f2f9f40b289)) {
        level thread namespace_b3f32c8cb80b8124::function_115bd456be8e071d(level.players, "ob_rr_bossbattle_complete");
    }
    tempstruct = getstruct("aether_gas_spawn", "script_noteworthy");
    level.var_81cafec2c7b77aae = 1;
    function_18790a3cb3f88db7(level.var_e80226cc1c193b74);
    function_63c8f10cc5040b12();
    var_3c41e488c621880d = getaiarrayinradius(self.origin, 2000);
    foreach (zombie in var_3c41e488c621880d) {
        if (isalive(zombie) && zombie.team != level.players[0].team) {
            zombie kill();
        }
    }
    namespace_570818d1f29fa41::function_e5f38d39d7fe6cd(tempstruct);
    wait 3;
    thread namespace_446fc987a980892f::playevent("s2_boss_death", level.players);
    wait 1;
    thread namespace_446fc987a980892f::playevent("s2_portal_reopen", level.players);
    wait 3;
    namespace_68270f885c7fd3ef::function_5314ee75857e6c63(level.riftgate);
    wait 3;
    level.var_fe5c2634af4ea573 = "MISSION_OBJ_ESCAPE_RIFT";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    level.var_c921cb81dd47af55.ignoreme = 0;
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8e
// Size: 0x113
function function_30f13bfa1f16113a() {
    level endon("game_ended");
    if (!isdefined(level.var_3e0d352ee4dcfc14)) {
        return;
    }
    var_ce1ae0a8d9dba707 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_mimic_hvt_emp", level.var_3e0d352ee4dcfc14.origin, level.var_3e0d352ee4dcfc14.angles, "team_two_hundred");
    level.var_17f50033d5f526a7 = var_ce1ae0a8d9dba707;
    var_ce1ae0a8d9dba707 scripts\common\callbacks::add("on_zombie_ai_killed", &function_230027c7f7bbef74);
    var_ce1ae0a8d9dba707 scripts\common\callbacks::add("on_entity_revealed", &function_5066a465bb94cdb7);
    var_ce1ae0a8d9dba707 thread function_d7155d6a64c4bc7d();
    waitframe();
    var_19f21d182b248a8a = namespace_6119efd5d1925c17::function_7f3bb3916bbd189d([level.var_3e0d352ee4dcfc14], var_ce1ae0a8d9dba707, undefined, level.var_3e0d352ee4dcfc14.proplist, &function_78a1012c4821caf6);
    level thread function_23a764b62e9d3010(var_19f21d182b248a8a);
    level.var_bb8608068786896e = var_19f21d182b248a8a;
    var_ce1ae0a8d9dba707.ignore_nuke = 1;
    var_ce1ae0a8d9dba707 namespace_9669c43b34f7a964::function_238dbae32131b4a8(var_ce1ae0a8d9dba707.emptrigger);
    waitframe();
    var_19f21d182b248a8a setcandamage(0);
    /#
        level thread function_4dca13793f7a2348();
    #/
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2da9
// Size: 0x1a0
function function_389658cd0f8ed1() {
    level endon("game_ended");
    level endon("disconnect");
    self endon("death");
    var_969bfe6f35556161 = 500;
    var_ead31b3e65de7613 = 0;
    while (true) {
        wait 1;
        foreach (player in level.players) {
            if (istrue(distance(player.origin, self.origin) > var_969bfe6f35556161) && !var_ead31b3e65de7613) {
                var_ead31b3e65de7613 = 1;
                objectivename = "emp_enemy_icon";
                level.var_378ba68d7497e1d8[objectivename] = requestobjectiveid();
                objective_add_objective(level.var_378ba68d7497e1d8[objectivename], "current", self.origin + (0, 0, 60), "jup_ui_map_icon_obj_emp_mimic");
                update_objective_setbackground(level.var_378ba68d7497e1d8[objectivename], 1);
                objective_addalltomask(level.var_378ba68d7497e1d8[objectivename]);
                objective_playermask_showtoall(level.var_378ba68d7497e1d8[objectivename]);
                update_objective_onentity(level.var_378ba68d7497e1d8[objectivename], self);
                update_objective_setzoffset(level.var_378ba68d7497e1d8[objectivename], 120);
                continue;
            }
            if (istrue(distance(player.origin, self.origin) <= var_969bfe6f35556161) && var_ead31b3e65de7613) {
                returnreservedobjectiveid(level.var_378ba68d7497e1d8["emp_enemy_icon"]);
                var_ead31b3e65de7613 = 0;
            }
        }
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f51
// Size: 0x5a
function function_23a764b62e9d3010(var_c787fc38f4d92c14) {
    level endon("game_ended");
    level endon("disconnect");
    flag_wait("acv_emped");
    var_c787fc38f4d92c14.interact = namespace_5775ad2badedbcaa::register_interact(var_c787fc38f4d92c14, 120, &function_4b0915ccb8a33f48, %JUP_OB_S2/EMP_PROP_INTERACT);
    var_c787fc38f4d92c14.interact sethintonobstruction("show");
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb3
// Size: 0x61
function function_4b0915ccb8a33f48(player) {
    if (istrue(level.var_bb8608068786896e.interact.activated)) {
        self makeunusable();
        return;
    }
    namespace_6119efd5d1925c17::transform_spawn(level.var_bb8608068786896e, [player]);
    level.var_bb8608068786896e notify("normal_transform");
    self makeunusable();
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x301d
// Size: 0x6b
function function_d7155d6a64c4bc7d() {
    level endon("game_ended");
    self endon("death");
    flag_wait("acv_emped");
    level.var_17f50033d5f526a7 function_4b225ffb3a8f07d8();
    var_c05ab80b098477db = level.var_3e0d352ee4dcfc14.origin + (0, 0, 300);
    function_fcafad3096f98c3d(var_c05ab80b098477db, 1.5, 4);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3090
// Size: 0x107
function function_fcafad3096f98c3d(var_c05ab80b098477db, var_e86bf908ad506d54, var_e88ee708ad768d76) {
    self endon("death");
    level endon("game_ended");
    while (!istrue(self.var_9b3c46b6cb4a1aed)) {
        pulserate = randomfloatrange(var_e86bf908ad506d54, var_e88ee708ad768d76);
        playfx(getfx("acv_emp_blast"), var_c05ab80b098477db);
        playsoundatpos(var_c05ab80b098477db, "iw9_emp_blast");
        playsoundatpos(level.var_59a5ab1b4256bb79.origin, "iw9_emp_blast");
        if (!istrue(level.var_eff2e7416f18eb1c)) {
            waittime = namespace_68270f885c7fd3ef::function_c619613f382927df("dx_ob_st25_stry_acve_sty25stmescortemp");
            level.var_59a5ab1b4256bb79.vo_ent playsoundonmovingent("dx_ob_st25_stry_acve_sty25stmescortemp");
            wait waittime + 1;
            namespace_446fc987a980892f::playevent("s2_acv_emp_react", level.players);
            waittime = namespace_68270f885c7fd3ef::function_c619613f382927df("dx_ob_st25_stry_rvnv_sty25stmescortempreact");
            wait waittime + 1;
            level.var_eff2e7416f18eb1c = 1;
        }
        wait pulserate;
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x319f
// Size: 0x342
function function_78a1012c4821caf6() {
    prop_height = (0, 0, 64);
    var_807fb6a8cf7bb90e = 50;
    if (!istrue(level.var_b1d34148f101054d)) {
        return undefined;
    }
    players = scripts\cp_mp\utility\player_utility::getplayersinradius(self.origin, var_807fb6a8cf7bb90e);
    if (players.size) {
        foreach (player in players) {
            if (!isalive(player)) {
                continue;
            }
            if (istrue(player.ignoreme) || istrue(player.inlaststand)) {
                continue;
            }
            /#
                if (getdvarint(@"hash_821690ed248715f7", 0)) {
                    sphere(player.origin, 20, (0, 1, 0), 0, 1, 1);
                }
            #/
            if (isdefined(player.last_valid_position) && isdefined(self.navmesh_position)) {
                if (!scripts\engine\trace::ray_trace_passed(player.last_valid_position, self.navmesh_position, [self], scripts\engine\trace::create_default_contents(1))) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(player.last_valid_position, self.navmesh_position, (0, 1, 1), 1, 0, 1);
                            sphere(self.navmesh_position, 20, (1, 0, 0), 0, 1, 1);
                        }
                    #/
                    continue;
                }
            } else {
                player_center = player gettagorigin("j_spine4");
                player_center = scripts\engine\utility::default_to(player_center, player getcentroid());
                if (isdefined(player_center) && !sighttracepassed(self.origin + prop_height, player_center, 0, self)) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(self.origin + prop_height, player gettagorigin("<dev string:x1c>"), (1, 1, 0), 1, 0, 1);
                        }
                    #/
                    continue;
                }
            }
            traceresult = playerphysicstrace(self.origin + (0, 0, 20), player.origin + (0, 0, 36), player, undefined, self, 1);
            if (traceresult["fraction"] >= 1) {
                self notify("stop_shake_tell");
                if (isdefined(self.interact)) {
                    self.interact.activated = 1;
                    self makeunusable();
                }
                return player;
            }
            /#
                if (getdvarint(@"hash_821690ed248715f7", 0)) {
                    line(self.origin + (0, 0, 8), player.origin + (0, 0, 8), (1, 0, 0), 1, 0, 1);
                    sphere(traceresult["<dev string:x28>"], 4, (1, 0, 0), 1, 0, 10, 1);
                }
            #/
        }
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34e9
// Size: 0x75
function function_9306d91e52ec93e1(currentMission) {
    namespace_262d6474998a2356::function_641bc1548cff8210(currentMission, level.players);
    foreach (player in level.players) {
        player setclientomnvar("ui_ob_active_contract_region_difficulty", 0);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3566
// Size: 0x18e
function function_230027c7f7bbef74(params) {
    returnreservedobjectiveid(level.var_378ba68d7497e1d8["emp_enemy_icon"]);
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_f10f600ac4ee4c09("s2_mi_fix_disruption", 3);
    }
    level.var_c921cb81dd47af55.var_69b049cf4b18c73b = 1;
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_ESCORT_PRE_EMP";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    wait 0.5;
    waittime = namespace_68270f885c7fd3ef::function_c619613f382927df("dx_ob_st25_stry_acve_sty25stmescemppowerrstr");
    level.var_59a5ab1b4256bb79.vo_ent playsoundonmovingent("dx_ob_st25_stry_acve_sty25stmescemppowerrstr");
    wait waittime + 1;
    waittime = namespace_68270f885c7fd3ef::function_c619613f382927df("dx_ob_st25_stry_acve_sty25stmescempreboot1");
    level.var_59a5ab1b4256bb79.vo_ent playsoundonmovingent("dx_ob_st25_stry_acve_sty25stmescempreboot1");
    wait waittime + 1;
    flag_set("travel_boss_defeated");
    waittime = namespace_68270f885c7fd3ef::function_c619613f382927df("dx_ob_st25_stry_rvnv_sty25stmescempreboot2");
    namespace_446fc987a980892f::playevent("s2_ravenov_acv_rebooted", level.players);
    wait waittime + 1;
    returnreservedobjectiveid(level.var_378ba68d7497e1d8["emp_enemy_icon"]);
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_ESCORT_PRE_EMP";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36fc
// Size: 0x9b
function function_5066a465bb94cdb7(params) {
    level.var_c921cb81dd47af55.var_69b049cf4b18c73b = 0;
    namespace_446fc987a980892f::playevent("s2_acv_monster_sighted", level.players);
    waittime = namespace_68270f885c7fd3ef::function_c619613f382927df("dx_ob_st25_stry_rvnv_sty25stmescempmimicsght");
    wait waittime + 1;
    level.var_fe5c2634af4ea573 = "QUEST_0_RIFT_S2_ESCORT_EMP_ENEMY";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    self.var_9b3c46b6cb4a1aed = 1;
    level.var_df81407f06a59c19 = 1;
    self.ignore_nuke = 1;
    thread function_389658cd0f8ed1();
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x379f
// Size: 0xdc
function function_a5b76e0f5024cc9a(s_spot, str_notify, n_radius) {
    if (!isdefined(n_radius)) {
        n_dist = squared(int(s_spot.radius * 0.7));
    } else {
        n_dist = squared(n_radius);
    }
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(s_spot.origin, player.origin) < n_dist) {
                    level notify(str_notify);
                    return;
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3883
// Size: 0x14
function function_f197a9b4e6016de4(infostruct) {
    level thread function_44ce4b824fc6461a();
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x389f
// Size: 0x130
function function_44ce4b824fc6461a() {
    self notify("stronghold_cyst_inactive");
    self endon("stronghold_cyst_inactive");
    level endon("game_ended");
    activityinstance = function_ebcfa8f0cbb5cbf1("ZOMBIE_STRONGHOLD_SIRA_MALL");
    if (!isdefined(activityinstance)) {
        assert(0, "<dev string:x34>");
    }
    while (!istrue(level.var_767f0511c6ecd9c3)) {
        foreach (cyst in activityinstance.cysts) {
            if (!istrue(cyst.inactive)) {
                cyst setscriptablepartstate("body", "inactive");
                cyst.inactive = 1;
            }
        }
        waitframe();
    }
    foreach (cyst in activityinstance.cysts) {
        cyst setscriptablepartstate("body", "pristine");
        cyst.inactive = 0;
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39d7
// Size: 0xdc
function function_5bd3cd406505f4e9(active) {
    activityinstance = function_ebcfa8f0cbb5cbf1("ZOMBIE_STRONGHOLD_SIRA_MALL");
    if (active) {
        foreach (cyst in activityinstance.cysts) {
            cyst setscriptablepartstate("body", "pristine");
        }
        return;
    }
    foreach (cyst in activityinstance.cysts) {
        cyst setscriptablepartstate("body", "inactive");
    }
}

/#

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3abb
    // Size: 0x51
    function function_16bdae112495ab84() {
        while (true) {
            if (getdvarint(@"hash_63d16b2bfa88151", 0) == 1) {
                namespace_446fc987a980892f::playconversation("<dev string:xa3>", level.players);
                level thread namespace_68270f885c7fd3ef::function_115252b53d299802();
                setdvar(@"hash_63d16b2bfa88151", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3b14
    // Size: 0x6d
    function function_1e17ccaf1ad17400() {
        level endon("<dev string:xba>");
        waiting = 1;
        while (waiting) {
            if (getdvarint(@"hash_8f792ab1e74bb4c5", 0) == 1) {
                waiting = 0;
                setdvar(@"hash_8f792ab1e74bb4c5", 1);
                wait 2;
                function_6023fdec597394f3();
                wait 3;
                namespace_446fc987a980892f::playconversation("<dev string:xc8>", level.players);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3b89
    // Size: 0x3a
    function function_fe21e07ce7838f5f() {
        while (true) {
            if (getdvarint(@"hash_c9e753bd185ba88d", 0) == 1) {
                function_63ff16d8780772f7();
                setdvar(@"hash_c9e753bd185ba88d", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3bcb
    // Size: 0xe1
    function function_593077dfc1e1657d() {
        while (true) {
            if (getdvarint(@"hash_1ff614104639165a", 0) == 1) {
                var_39d97be6a0b0016 = getstruct("<dev string:xdf>", "<dev string:xf3>");
                if (isdefined(var_39d97be6a0b0016)) {
                    level.var_376e6e8117393127 forceteleport(var_39d97be6a0b0016.origin, var_39d97be6a0b0016.angles, 9999999, 0);
                    wait 0.5;
                    level.var_d31429e0a68259a4 forceteleport(var_39d97be6a0b0016.origin, var_39d97be6a0b0016.angles, 9999999, 0);
                    wait 0.5;
                    level.var_1b8210e0db900e1a forceteleport(var_39d97be6a0b0016.origin, var_39d97be6a0b0016.angles, 9999999, 0);
                }
                setdvar(@"hash_1ff614104639165a", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3cb4
    // Size: 0x168
    function function_a00c3afcd14fd793() {
        while (true) {
            if (getdvarint(@"hash_2861d3e78d6416a3", 0) == 1) {
                setdvar(@"hash_2861d3e78d6416a3", 0);
                var_39d97be6a0b0016 = getstruct("<dev string:xdf>", "<dev string:xf3>");
                while (!isdefined(level.var_376e6e8117393127) && !isdefined(level.var_d31429e0a68259a4) && !isdefined(level.var_1b8210e0db900e1a) && !isdefined(level.var_2692e299e63da688)) {
                    waitframe();
                }
                if (isdefined(var_39d97be6a0b0016)) {
                    level.var_376e6e8117393127 forceteleport(var_39d97be6a0b0016.origin, var_39d97be6a0b0016.angles, 9999999, 0);
                    waitframe();
                    level.var_d31429e0a68259a4 forceteleport(var_39d97be6a0b0016.origin, var_39d97be6a0b0016.angles, 9999999, 0);
                    waitframe();
                    level.var_1b8210e0db900e1a forceteleport(var_39d97be6a0b0016.origin, var_39d97be6a0b0016.angles, 9999999, 0);
                    waitframe();
                    level.var_2692e299e63da688 forceteleport(var_39d97be6a0b0016.origin, var_39d97be6a0b0016.angles, 9999999, 0);
                }
                namespace_e82bfd865c02eb4b::function_e08162326217b5c3();
                level.var_376e6e8117393127 waittill("<dev string:x108>");
                level thread function_63ff16d8780772f7();
                level thread namespace_e82bfd865c02eb4b::function_8ca3825e113a2579();
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3e24
    // Size: 0x3c
    function function_264bba50be9515c() {
        while (true) {
            if (getdvarint(@"hash_2e8a6271ae6301be", 0) == 1) {
                level thread function_306af7b795319c62();
                setdvar(@"hash_2e8a6271ae6301be", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3e68
    // Size: 0x4f
    function function_4dc333dd10638989() {
        level endon("<dev string:xba>");
        waiting = 1;
        while (waiting) {
            if (getdvarint(@"hash_809c565bbb9d0cdf", 0) == 1) {
                function_5bd3cd406505f4e9(0);
                setdvar(@"hash_809c565bbb9d0cdf", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3ebf
    // Size: 0x50
    function function_8ba99af63b72bb52() {
        level endon("<dev string:xba>");
        waiting = 1;
        while (waiting) {
            if (getdvarint(@"hash_4a2aa22d0f5dfd3c", 0) == 1) {
                function_5bd3cd406505f4e9(1);
                setdvar(@"hash_4a2aa22d0f5dfd3c", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3f17
    // Size: 0x5e
    function function_4dca13793f7a2348() {
        level endon("<dev string:xba>");
        waiting = 1;
        while (waiting) {
            if (getdvarint(@"hash_5d0355b2db99d74a", 0) == 1) {
                flag_set("<dev string:x110>");
                level.var_b1d34148f101054d = 1;
                setdvar(@"hash_5d0355b2db99d74a", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3f7d
    // Size: 0x5b
    function function_cd8296488b7d820() {
        while (true) {
            if (getdvarint(@"hash_cfa3791df8bd574e", 0) == 1) {
                function_63ff16d8780772f7();
                while (!isdefined(level.riftgate)) {
                    waitframe();
                }
                namespace_68270f885c7fd3ef::function_5314ee75857e6c63(level.riftgate);
                setdvar(@"hash_cfa3791df8bd574e", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3fe0
    // Size: 0xd8
    function function_683d92ea9df62d79() {
        while (true) {
            if (getdvarint(@"hash_ccc71745d36fd81b", 0) == 1) {
                level.var_767f0511c6ecd9c3 = 1;
                namespace_446fc987a980892f::playevent("<dev string:x11d>", level.players);
                wait 1.5;
                namespace_446fc987a980892f::playevent("<dev string:x13d>", level.players);
                var_44d600dd175b86fa = getstruct("<dev string:x15c>", "<dev string:x186>");
                function_606642b946a01237("<dev string:x15c>", var_44d600dd175b86fa.origin, 5000, 0);
                level.var_fe5c2634af4ea573 = "<dev string:x194>";
                namespace_68270f885c7fd3ef::function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
                scripts\mp\objidpoolmanager::returnreservedobjectiveid(level.var_378ba68d7497e1d8["<dev string:x1b8>"]);
                setdvar(@"hash_ccc71745d36fd81b", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x40c0
    // Size: 0xd8
    function function_2924f46f04cd9493() {
        while (true) {
            if (getdvarint(@"hash_e66bfa31a0fb28b5", 0) == 1) {
                exploder("<dev string:x1cb>");
                searchlights = getstructarray("<dev string:x1db>", "<dev string:x186>");
                foreach (light in searchlights) {
                    var_d0e64214e51fdb3b = spawnscriptable("<dev string:x1eb>", light.origin, light.angles);
                    var_d0e64214e51fdb3b setscriptablepartstate("<dev string:x202>", "<dev string:x20f>");
                }
                setdvar(@"hash_e66bfa31a0fb28b5", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x41a0
    // Size: 0x49
    function function_1f971324a3809867() {
        while (true) {
            if (getdvarint(@"hash_5dd0d08c709986a0", 0) == 1) {
                level.var_17f50033d5f526a7 kill();
                function_30f13bfa1f16113a();
                setdvar(@"hash_5dd0d08c709986a0", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x41f1
    // Size: 0x46
    function function_af19431e47ca1667() {
        while (true) {
            if (getdvarint(@"hash_9ec2240be4643d95", 0) == 1) {
                level.players[0] play_outro_movie(undefined);
                setdvar(@"hash_9ec2240be4643d95", 0);
            }
            waitframe();
        }
    }

#/

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x423f
// Size: 0x103
function function_306af7b795319c62() {
    var_d3fa44802dbd4a5d = getstruct("aether_gas_spawn", "script_noteworthy");
    if (isdefined(var_d3fa44802dbd4a5d)) {
        level.var_ccbcd3eed8bee41a = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_warlord_chemist_rift", var_d3fa44802dbd4a5d.origin, var_d3fa44802dbd4a5d.angles, "team_two_hundred");
        if (isdefined(level.var_376e6e8117393127)) {
            level.var_ccbcd3eed8bee41a.ignoreme = 1;
            level.var_ccbcd3eed8bee41a.var_5e153508f81dc019 = level.var_ccbcd3eed8bee41a.health;
            level.var_ccbcd3eed8bee41a.battlechatter.stateoverride = "combat";
            level.var_ccbcd3eed8bee41a thread function_9ce582ac851cdde5();
            level.var_ccbcd3eed8bee41a.var_970170ffd4b081ac = &function_bcc016694b09aa64;
            level.var_ccbcd3eed8bee41a callback::add("on_zombie_ai_damaged", &function_bcc016694b09aa64);
        }
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 14, eflags: 0x4
// Checksum 0x0, Offset: 0x434a
// Size: 0xbb
function private function_bcc016694b09aa64(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname, eventid) {
    if (level.var_ccbcd3eed8bee41a.health / level.var_ccbcd3eed8bee41a.var_5e153508f81dc019 <= 0.33) {
        thread namespace_446fc987a980892f::playevent("s2_boss_damaged", level.players);
    }
    return damage;
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x440e
// Size: 0xee
function private function_9ce582ac851cdde5() {
    level endon("disconnect");
    killer = self waittill("death");
    tempstruct = spawnstruct();
    tempstruct.origin = level.var_ccbcd3eed8bee41a.origin;
    tempstruct.angles = level.var_ccbcd3eed8bee41a.angles;
    namespace_570818d1f29fa41::function_e5f38d39d7fe6cd(tempstruct);
    wait 3;
    thread namespace_446fc987a980892f::playevent("s2_boss_death", level.players);
    wait 1;
    thread namespace_446fc987a980892f::playevent("s2_portal_reopen", level.players);
    wait 3;
    namespace_68270f885c7fd3ef::function_5314ee75857e6c63(level.riftgate);
    wait 3;
    level.var_fe5c2634af4ea573 = "MISSION_OBJ_ESCAPE_RIFT";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
    objective_playermask_showtoall(level.var_378ba68d7497e1d8["escape"]);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4504
// Size: 0xa1
function function_5314ee75857e6c63(gate_model) {
    level.riftgate setscriptablepartstate("aether_exit_body", "rift_mission_exit");
    gate_model.gate_interact = namespace_5775ad2badedbcaa::register_interact(gate_model.origin + (0, 0, 48), 150, &function_5927fdb24018f9c7);
    gate_model.gate_interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_5aa40913d9085c11);
    gate_model.gate_interact sethintonobstruction("hide");
    level.var_fe5c2634af4ea573 = "MISSION_OBJ_ESCAPE_RIFT";
    function_9306d91e52ec93e1(level.var_fe5c2634af4ea573);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45ad
// Size: 0x64
function function_5aa40913d9085c11(interact, player) {
    if (level.mapname == "mp_jup_bigmap") {
        return {#string:%JUP_OB_OBJECTIVES/BIGMAP_EXFILL, #type:"HINT_BUTTON"};
    }
    return {#string:%JUP_OB_S1/RIFT_EXIT, #type:"HINT_BUTTON"};
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4619
// Size: 0x24
function function_5927fdb24018f9c7(player) {
    if (istrue(player.var_f52eb40ba99ffa4c)) {
        return;
    }
    thread function_b67447cfa15eb9e6(player);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4645
// Size: 0x13
function function_b67447cfa15eb9e6(player) {
    namespace_b000de497fab9bf4::function_b67447cfa15eb9e6(player);
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4660
// Size: 0x121
function function_a7b05e9a9ec0a5bb() {
    self endon("death");
    wait 4;
    while (self.health > 0) {
        if (isdefined(level.var_4c89f0d11877a1d0) && isdefined(level.var_7b6c1188e8bce4a1)) {
            foreach (player in level.players) {
                if (isalive(player)) {
                    if (distance2dsquared(self.origin, player.origin) < 256000000) {
                        if (isdefined(self.zombieaisettings.var_e58a65b7a8f5973c.bosshealthbar)) {
                            player [[ level.var_4c89f0d11877a1d0 ]](self.zombieaisettings.var_e58a65b7a8f5973c.bosshealthbar, self);
                        }
                    } else {
                        player [[ level.var_7b6c1188e8bce4a1 ]]();
                    }
                    continue;
                }
                player [[ level.var_7b6c1188e8bce4a1 ]]();
            }
        }
        wait 2;
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4789
// Size: 0x183
function function_478f7146fc154959(sparams) {
    if (istrue(isplayer(sparams.einflictor)) && istrue(sparams.einflictor.isjuggernaut)) {
        sparams.idamage *= 10;
    }
    if (istrue(isplayer(sparams.einflictor)) && istrue(sparams.objweapon.ismelee)) {
        if (is_equal(sparams.objweapon.basename, "iw9_me_tonfa_mp")) {
            sparams.idamage *= 0.5;
        } else {
            sparams.idamage *= 0.75;
        }
    }
    if (isdefined(level.var_f793f6cdd191e2c6)) {
        foreach (player in level.players) {
            newhealth = self.health - int(sparams.idamage);
            player [[ level.var_f793f6cdd191e2c6 ]](newhealth, self.maxhealth);
            player [[ level.var_71bc535dbd0ddb3f ]](newhealth);
        }
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4914
// Size: 0xfb
function private function_1033d0b122c0d217(var_8c55111e0c85f768, var_27e88f4ca5cae4be) {
    s_bundle = getscriptbundle("bosshealthbar:" + var_8c55111e0c85f768);
    if (isdefined(s_bundle)) {
        level.var_cae1a9afa788d36 = utility::default_to(s_bundle.var_57f17703d0c54bd5, 500);
        level.var_cae1a9afa788d36 = int(level.var_cae1a9afa788d36);
        if (!level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::open(self);
        }
        if (isdefined(s_bundle.icon)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::function_c4b608fac8636725(self, s_bundle.icon);
        }
        if (isdefined(s_bundle.bossname)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::function_fa61dfb76d14641f(self, s_bundle.bossname);
        }
        function_8cc97b15dad450c8(var_27e88f4ca5cae4be.health, var_27e88f4ca5cae4be.maxhealth);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4a17
// Size: 0x72
function private function_63c8f10cc5040b12() {
    foreach (player in level.players) {
        if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(player)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::close(player);
        }
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4a91
// Size: 0xa2
function private function_f68f646faf36a1e1(health, maxhealth) {
    if (!isdefined(health)) {
        health = 0;
    }
    if (!isdefined(maxhealth)) {
        maxhealth = 1;
    }
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        maxwidth = 500;
        if (isdefined(level.var_cae1a9afa788d36)) {
            maxwidth = level.var_cae1a9afa788d36;
        }
        var_1b60b445e73cfb77 = health / maxhealth;
        if (health <= 0 || maxhealth == 1) {
            var_1b60b445e73cfb77 = 0;
        }
        var_f2dfc5643b7c0d56 = int(maxwidth * var_1b60b445e73cfb77);
        level.var_15f48d5838e26ba0 zmbosshealthbar::function_4032c55b1a2de180(self, var_f2dfc5643b7c0d56);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4b3b
// Size: 0x63
function private function_5c1c6e19998e77ca(health) {
    if (!isdefined(health)) {
        health = 0;
    }
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        if (isdefined(self.var_1d9b646d4823feea) && health < self.var_1d9b646d4823feea) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::function_7996b90ec9893e23(self, gettime());
        }
        self.var_1d9b646d4823feea = health;
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba6
// Size: 0xa3
function function_cc39c0ba7d4e88c1() {
    level waittill("swap_chemist");
    if (isdefined(level.var_a2bcb45a0ad08c1d.var_4b7032d8632723e0)) {
        level.var_8ee440b28e9cf38d = level.var_a2bcb45a0ad08c1d.var_4b7032d8632723e0;
        level.var_8ee440b28e9cf38d forceteleport(level.var_325b7d271026b22d, level.var_fa910ab739efb783, 9999999, 0);
        waitframe();
        playfxontag(getfx("chemist_spine"), level.var_8ee440b28e9cf38d, "j_spine4");
        playfxontag(getfx("chemist_head"), level.var_8ee440b28e9cf38d, "j_head");
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c51
// Size: 0xe5
function private function_735905adf14f7ebc(params) {
    if (!isplayer(self)) {
        return;
    }
    activityinstance = function_ebcfa8f0cbb5cbf1("ZOMBIE_STRONGHOLD_SIRA_MALL");
    var_42b084f64726d761 = activityinstance.cysts.size;
    if (!isdefined(level.var_d64d1cfda06aa2d2)) {
        level.var_d64d1cfda06aa2d2 = 0;
        level.var_d64d1cfda06aa2d2 += 1;
    } else {
        level.var_d64d1cfda06aa2d2 += 1;
    }
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_param", level.var_d64d1cfda06aa2d2);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4d3e
// Size: 0xcf
function private function_160ae06b18d8a8c4() {
    itembundle = getscriptbundle(%"hash_d03ed75a2d0089");
    if (!isdefined(itembundle)) {
        assertmsg("<dev string:x215>" + function_3c8848a3a11b2553(%"hash_d03ed75a2d0089") + "<dev string:x253>");
        return;
    }
    spawnlocations = getstructarray("stronghold_gasmask", "script_noteworthy");
    foreach (spawnlocation in spawnlocations) {
        item = common_item::function_c465d27f3f6066b4(itembundle, spawnlocation.origin, spawnlocation.angles, 1, 1);
    }
}

// Namespace namespace_832e49249d603e03 / namespace_68270f885c7fd3ef
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4e15
// Size: 0x2d
function private function_c619613f382927df(str_alias) {
    var_c5fd8d562611e0e4 = lookupsoundlength(str_alias);
    var_c5fd8d562611e0e4 = float(var_c5fd8d562611e0e4);
    var_c5fd8d562611e0e4 /= 1000;
    return var_c5fd8d562611e0e4;
}

