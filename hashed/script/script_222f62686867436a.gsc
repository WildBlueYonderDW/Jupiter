// mwiii decomp prototype
#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using script_405d05c89e998922;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\asm\asm.gsc;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\common\vehicle_code.gsc;
#using script_2d05e472a90adb1d;
#using script_6bffae1b97f70547;
#using script_7c40fa80892a721;
#using script_860bfdfe82326e3;
#using script_639bf783929acf9b;
#using script_7d3e27aa82b5d70b;
#using script_2583ee5680cf4736;
#using script_485622d93fa7e4cf;
#using script_7b2517368c79e5bc;
#using script_64316dc775e91122;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_398835140857d740;
#using script_3214e6fcdce468a7;
#using scripts\engine\utility.gsc;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using script_120270bd0a747a35;
#using scripts\mp\mp_agent.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\flags.gsc;
#using script_64351208cb856df9;
#using script_4fa7e9e11630166c;
#using script_7cfaa6fd841fb4dd;
#using script_6f65366f542f6627;
#using script_2d400da2610fe542;
#using script_4e6e58ab5d96c2b0;
#using script_638d701d263ee1ed;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\anim_scene.gsc;
#using scripts\engine\scriptable.gsc;
#using script_5080d40cd904ba73;
#using scripts\common\create_script_utility.gsc;
#using script_70c2478fc6d8ef;
#using script_55221d469e7b320e;
#using scripts\mp\outofbounds.gsc;
#using script_60dd6e3992c1f29;
#using script_749ff6f56673a813;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\utility\player.gsc;
#using script_1feb0785278dafea;
#using script_72a196b6c7df2f38;
#using scripts\common\ai.gsc;
#using script_2b264b25c7da0b12;

#namespace namespace_89d57ff5dfa37e5c;

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe6
// Size: 0x1fe
function function_5d445c791ef3fc0a() {
    if (level flag("jup_quest_act3_init")) {
        return;
    }
    level flag_set("jup_quest_act3_init");
    if (getdvarint(@"hash_f0651d120dc93cc7", 0)) {
        mapname = getmapname();
        if (mapname == "mp_jup_gw_fallout") {
            setdvar(@"hash_f1d095735ac37f33", 0);
            setdvar(@"hash_f1f518497502aea8", 1);
            setdvar(@"hash_37edd5a66bd29f3d", 2);
            setdvar(@"hash_2fe0283b419ff08a", 1);
            level.var_9979559855d31f5a = -1;
            level.n_time_remaining = 30;
            level.var_3f4534fb14cca909 = &function_151037a96443f076;
            level.quest_airstrike = 1;
            level.var_a9e2544b9283299b = 1;
            level.var_4c272da3f0a1a024 = getentarray("clip_zombie_container_opening", "targetname");
            level.var_a9e3bda690cc504c = getentarray("clip_zombie_container_door", "targetname");
            callback::add("player_spawned", &on_player_spawned);
            callback::add("player_connect", &on_player_connected);
            namespace_17c25f0877bfb620::scriptable_adddamagedcallback(&namespace_134d54e39331ee45::function_61c4487eafc2bc4c);
            level.var_cced1297c1210e46 = function_e4c99b0f178ffb98("explosive_barrel", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
            level.var_943fa6331a3cf64e = function_e4c99b0f178ffb98("airstrike_infil", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
            level.var_70ec6a3c1cc881e1 = function_e4c99b0f178ffb98("fuel_airstrike", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
            function_c25a40ae517ef340();
            level._effect["chopper_explosion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_explo_heli_act_3.vfx");
            level._effect["enrichment_explosion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_enrichment_device_exp.vfx");
            level thread function_3564accd04e57c8a();
        } else {
            callback::add("exfil_to_s0_act3", &function_2a6c134406898721);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21eb
// Size: 0x54d
function function_3564accd04e57c8a() {
    level flag_set("powerup_disable_nuke");
    level function_24f7bf25b01b1d1f();
    namespace_a0229183a28ffd3::wait_for_cs_flag("jup_ob_quest_s0_act_3_cs");
    level function_e9aa7259fb72d085();
    level flag_wait("player_has_spawned");
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&namespace_d1df78f2235ca173::function_91d032246bb24684);
    level.var_98539610199d2422 thread function_5555f62a6cc0f560();
    level.var_98539610199d2422 thread function_5734daa7a8ef6bd();
    level.var_98539610199d2422 thread function_fbfcd9d440346989();
    level.var_98539610199d2422 thread oob_triggers();
    if (getdvarint(@"hash_feadf2b99c87b563", 0)) {
        level.var_98539610199d2422 function_1e86be4e3accaf94();
        level.var_98539610199d2422 thread teleport_players("player_deathworm_pt");
        level.var_98539610199d2422 thread function_385b258887a1f451();
        level.var_98539610199d2422 thread function_3e10b038f30507eb();
        level.var_98539610199d2422 thread function_d58e9fe01994f55();
        level.var_98539610199d2422 thread function_5cb2f7158d07480c();
        level.var_98539610199d2422 flag_set("charge_planted");
        level.var_98539610199d2422 flag_set("approach_neutralizer");
        level.var_98539610199d2422 flag_set("neutralizer_dropped");
        level.var_98539610199d2422 flag_set("neutralizer_reached");
        level.var_98539610199d2422 flag_set("infil_start");
    } else if (getdvarint(@"hash_2966c4d5e406fbac", 0)) {
        setmusicstate("");
        level.var_98539610199d2422 function_1e86be4e3accaf94();
        level.var_98539610199d2422 thread teleport_players("player_deathworm_pt");
        level.var_98539610199d2422 thread function_385b258887a1f451();
        level.var_98539610199d2422 thread function_3e10b038f30507eb();
        level.var_98539610199d2422 thread function_5cb2f7158d07480c();
        level.var_98539610199d2422 thread function_47e9b34b3e46619();
        level thread function_262e81479efcd17a();
        level.var_98539610199d2422 flag_set("charge_planted");
        level.var_98539610199d2422 flag_set("approach_neutralizer");
        level.var_98539610199d2422 flag_set("neutralizer_dropped");
        level.var_98539610199d2422 flag_set("neutralizer_reached");
        level.var_98539610199d2422 flag_set("ava_arrived");
        var_a6cd1b1206e83312 = getstruct("neutralizer", "targetname");
        var_4b712b6b83e1a330 = getrandomnavpoint(var_a6cd1b1206e83312.origin, 500);
        var_ba8620293ff4622d = getrandomnavpoint(var_a6cd1b1206e83312.origin, 500);
        level.a_ai_allies = [];
        var_1edd111b66027300 = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("ava_jansen")[0];
        level.var_8b573403a20a7229 = namespace_34f6a6adabfc542d::spawnnewagentaitype(var_1edd111b66027300, var_4b712b6b83e1a330, var_a6cd1b1206e83312.angles, level.players[0].team);
        level.var_8b573403a20a7229 function_f6991c09ecd5b798();
        var_67cd14c1cc125b93 = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("sergei_ravenov")[0];
        level.ravenov = namespace_34f6a6adabfc542d::spawnnewagentaitype(var_67cd14c1cc125b93, var_ba8620293ff4622d, var_a6cd1b1206e83312.angles, level.players[0].team);
        level.ravenov function_f6991c09ecd5b798();
        level.a_ai_allies[level.a_ai_allies.size] = level.var_8b573403a20a7229;
        level.a_ai_allies[level.a_ai_allies.size] = level.ravenov;
    } else if (getdvarint(@"hash_22a4c737ce7f7f1e", 0)) {
        level.var_98539610199d2422 function_1e86be4e3accaf94();
        level.var_98539610199d2422 thread function_47e9b34b3e46619();
        level.var_98539610199d2422 thread function_3a8fc38da7251e76();
        level.var_98539610199d2422 thread function_de6ae73d98f28ba3();
        wait(0.1);
        level.var_98539610199d2422 notify("entrance_found");
        level.var_98539610199d2422 thread teleport_players("enrichment_pos");
    } else if (getdvarint(@"hash_6e43d255b2ec9206", 0)) {
        level.var_98539610199d2422 function_1e86be4e3accaf94();
        level.var_98539610199d2422 thread function_340a2b1d87903294();
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(level.var_98539610199d2422.var_4118ca23a8b62b78);
        namespace_5a22b6f3a56f7e9b::update_objective_position(level.var_98539610199d2422.var_4118ca23a8b62b78, level.var_98539610199d2422.var_11d2e045f1efdf0f.origin);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(level.var_98539610199d2422.var_4118ca23a8b62b78, 0);
        level.var_98539610199d2422 thread function_6ddbbcc69eb0e369();
        level.var_98539610199d2422 thread teleport_players("player_deathworm_pt");
    } else {
        level.var_98539610199d2422 thread function_74139ae6c2c53345();
        level.var_98539610199d2422 thread function_ecf84ae0ccf5e133();
        level.var_98539610199d2422 thread function_11547bb002dd118c();
        level.var_98539610199d2422 thread start_quest();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273f
// Size: 0x22c
function function_e9aa7259fb72d085() {
    level.var_98539610199d2422 = spawnstruct();
    level.var_98539610199d2422.var_5001eff44332b8d8 = 0;
    level.var_98539610199d2422.n_zombies = 0;
    level.var_98539610199d2422.var_7c11b077004fcf2c = 0;
    level.var_98539610199d2422.var_8947dd7e97fc5ea1 = 0;
    level.var_98539610199d2422.var_cf47493985378a8e = 0;
    level.var_98539610199d2422.difficulty = "difficulty_normal";
    level.var_98539610199d2422.var_ee3ea8d303c9025c = [0:"jup_ob_enemy_basic_soldier_long", 1:"jup_ob_enemy_basic_soldier_short"];
    level.var_98539610199d2422.s_stronghold = getstruct("stronghold_proximity", "targetname");
    level.var_98539610199d2422.var_4f78c7c9dc4c2271 = getstruct("stronghold_entrance", "targetname");
    level.var_98539610199d2422.var_b86bcfae24242151 = getstruct("enrichment_device", "targetname");
    level.var_98539610199d2422.var_ca71d43d32b11703 = getstruct("stronghold_interior", "targetname");
    level.var_98539610199d2422.var_ca0439c2f79cc0fb = getstruct("explosive_charge", "targetname");
    level.var_98539610199d2422.var_a6cd1b1206e83312 = getstruct("neutralizer", "targetname");
    level.var_98539610199d2422.var_d40a3dadfbf95c42 = getstruct("s_enrichment_room", "targetname");
    level.var_98539610199d2422.var_33ff83242dcaad2b = getstruct("facility_exit", "targetname");
    level.var_98539610199d2422.s_machine = getstruct("enrichment_machine", "targetname");
    level.var_98539610199d2422.var_11d2e045f1efdf0f = getstruct("neutralizer_panel", "targetname");
    level.var_eee94908df4c2824 = 0;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2972
// Size: 0x3b
function start_quest() {
    namespace_64135de19550f047::function_e9158c9e8c391f25("scriptable_cover");
    level thread function_3820b80f0cb764ba();
    function_1e86be4e3accaf94();
    function_3e10b338f3050e84();
    function_3e10b638f305151d();
    function_3e10b538f30512ea();
    function_3e10b038f30507eb();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b4
// Size: 0x20
function function_3820b80f0cb764ba() {
    flags::gameflagwait("prematch_done");
    wait(0.5);
    setmusicstate("mx_ob_q3_infil");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29db
// Size: 0x4b
function function_3e10b338f3050e84() {
    level thread namespace_134d54e39331ee45::function_7a5ab9d5c8dbfe6a();
    thread function_60721b5cb1eee95c();
    thread function_d88d2af5d12ad7ac("barrel_explosive_river");
    thread function_addfb21bf2f5d717();
    thread function_1c3939b802f05136();
    thread function_aa0d525c497e873c();
    thread function_a606113e8150b7e4("mus_zombiepen_open", "mx_ob_q3_action_high");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2d
// Size: 0x69
function function_3e10b638f305151d() {
    thread function_3a8fc38da7251e76();
    thread function_3f90c8202c9d37cb();
    thread function_de6ae73d98f28ba3();
    thread merc_stronghold();
    thread function_47e9b34b3e46619();
    thread function_391d1a22ef94feab();
    flag_wait("charge_planted");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("place_explosive_zakhaev");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9d
// Size: 0x54
function function_3e10b538f30512ea() {
    thread function_5cb2f7158d07480c();
    thread approach_neutralizer();
    thread merc_facility_exit();
    thread function_c40217c3d33491b2();
    thread function_de7c83bd54fe6c54();
    thread function_385b258887a1f451();
    thread merc_chopper_neutralizer();
    thread function_fc5245e119c3f4e5();
    thread function_d58e9fe01994f55();
    level thread function_262e81479efcd17a();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af8
// Size: 0x13
function function_3e10b038f30507eb() {
    thread function_1a18a6d6a5cee94d();
    thread function_44e1fb35d5a39cc1();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b12
// Size: 0x46
function on_player_connected(params) {
    self endon("disconnect");
    if (getdvarint(@"hash_f0651d120dc93cc7", 0) && !namespace_41bcc2f40ffd0e7f::function_7bfb1ccacdacfd26()) {
        self setsoundsubmix("jup_ob_q3_infil");
        namespace_36f464722d326bbe::function_852712268d005332(self, 1, 0);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b5f
// Size: 0x155
function on_player_spawned(params) {
    level flag_set("player_has_spawned");
    if (getdvarint(@"hash_f0651d120dc93cc7", 0) && getdvarint(@"hash_c221795287935921", 0)) {
        thread function_ce34466b3cece887();
    }
    if (getdvarint(@"hash_2966c4d5e406fbac", 0) || getdvarint(@"hash_22a4c737ce7f7f1e", 0) || getdvarint(@"hash_feadf2b99c87b563", 0) || getdvarint(@"hash_6e43d255b2ec9206", 0)) {
        level flag_set("player_has_spawned");
        namespace_36f464722d326bbe::function_852712268d005332(self, 0, 1);
        return;
    }
    level.var_9979559855d31f5a++;
    if (!level flag("chopper_end")) {
        self.n_pos = level.var_9979559855d31f5a + 1;
        level flag_wait("chopper_ready");
        thread function_1e66bb8b54246d6b();
        if (level flag("countdown") && !isdefined(self.var_73f4fb8b53668a5c) && level.n_time_remaining > 1) {
            self.var_73f4fb8b53668a5c = 1;
            thread function_69c1532c14dde0f1(level.var_98539610199d2422.infil_chopper, level.var_98539610199d2422);
        }
    }
    flag_set("player_ready");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cbb
// Size: 0x12f
function function_1e66bb8b54246d6b() {
    self endon("death");
    function_9d04463dd59c306(1);
    self.var_cac91eb6521df629 = level.var_98539610199d2422.infil_chopper;
    self.ignoreme = 1;
    v_pos = namespace_134d54e39331ee45::function_44dc89f43f1c1e1c(self.n_pos, level.var_98539610199d2422.infil_chopper);
    self setorigin(v_pos);
    self setplayerangles(level.var_98539610199d2422.infil_chopper.angles * -1);
    waitframe();
    self playerlinkto(level.var_98539610199d2422.infil_chopper);
    self playerlinkedoffsetenable();
    if (!isdefined(level.player_boarded)) {
        level.player_boarded = 1;
        level thread function_392d108673953c27();
    }
    level.var_98539610199d2422 flag_wait("infil_start");
    namespace_36f464722d326bbe::function_852712268d005332(self, 0, 1);
    self unlink();
    wait(2);
    function_9d04463dd59c306(0);
    if (!level.var_98539610199d2422.infil_chopper function_c80b9a252474413b(self)) {
        function_ac62c6628f23f82d();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df1
// Size: 0x13
function function_392d108673953c27() {
    wait(3);
    level flag_set("all_players_onboard");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0b
// Size: 0xf5
function function_12daf479a21bb2b0() {
    for (i = 0; i < level.players.size; i++) {
        if (isalive(level.players[i])) {
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(level.players[i], 0, 0);
            level.players[i] setplayerangles(self.infil_chopper.angles * -1);
        }
    }
    flag_wait("bridge");
    for (i = 0; i < level.players.size; i++) {
        if (isalive(level.players[i])) {
            level.players[i].ignoreme = 0;
        }
    }
    flag_wait("drop_off");
    flag_set("zombies_cleared");
    if (getdvarint(@"hash_732447df682be5db", 0)) {
        level thread function_4c3b4b4059b45fba();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f07
// Size: 0x1ce
function function_83ff2df370bc359b(s_quest) {
    self endon("death");
    s_quest endon("infil_done");
    level flag_set("countdown");
    self.mdl_clip delete();
    self.e_linkto delete();
    thread function_621f245a42a08405(s_quest);
    foreach (player in level.players) {
        player.var_73f4fb8b53668a5c = 1;
        player thread function_69c1532c14dde0f1(self, s_quest);
    }
    while (1) {
        self.var_9c80d69eb7a7d6cd = 0;
        foreach (player in level.players) {
            if (function_c80b9a252474413b(player)) {
                self.var_9c80d69eb7a7d6cd = 1;
            }
        }
        if (!self.var_9c80d69eb7a7d6cd) {
            break;
        }
        wait(0.1);
    }
    wait(2);
    foreach (player in level.players) {
        player clearsoundsubmix("jup_ob_q3_infil");
        player setclientomnvar("ui_match_start_countdown", -1);
    }
    s_quest flag_set("players_disembarked");
    s_quest notify("infil_done");
    if (getdvarint(@"hash_732447df682be5db", 0)) {
        level thread function_4c3b4b4059b45fba();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30dc
// Size: 0x81
function function_69c1532c14dde0f1(vh_chopper, s_quest) {
    self endon("death");
    s_quest endon("infil_done");
    s_quest endon("players_disembarked");
    while (1) {
        self setclientomnvar("ui_match_start_countdown", level.n_time_remaining);
        if (!vh_chopper function_c80b9a252474413b(self)) {
            self setclientomnvar("ui_match_start_countdown", -1);
            break;
        }
        wait(1);
        level.n_time_remaining--;
        if (level.n_time_remaining < 1) {
            break;
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3164
// Size: 0x8d
function function_621f245a42a08405(s_quest) {
    self endon("death");
    s_quest endon("infil_done");
    wait(30);
    foreach (player in level.players) {
        player setclientomnvar("ui_match_start_countdown", -1);
    }
    s_quest flag_set("players_disembarked");
    s_quest notify("infil_done");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f8
// Size: 0x53
function function_c80b9a252474413b(player) {
    if (!isdefined(self) || !isalive(self) || !isdefined(self.origin) || !isdefined(player) || !isdefined(player.origin)) {
        return 0;
    }
    return function_f69d383479425bfa(player.origin);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3253
// Size: 0xf7
function function_f69d383479425bfa(origin) {
    forward = anglestoforward(self.angles);
    up = anglestoup(self.angles);
    var_a011729d000a28d2 = origin - self.origin;
    transform = coordtransformtranspose(origin, self.origin, self.angles);
    forwarddist = transform[0];
    var_b383c5f0357008ae = transform[1];
    var_74da97ebca1ba2e7 = transform[2];
    var_9aa67bdf5007e363 = forwarddist > -360 && forwarddist < 350;
    var_91678d915537fe2d = var_b383c5f0357008ae > -60 && var_b383c5f0357008ae < 60;
    var_cbb36d65c8c53644 = var_74da97ebca1ba2e7 > -255 && var_74da97ebca1ba2e7 < -115;
    return var_9aa67bdf5007e363 && var_91678d915537fe2d && var_cbb36d65c8c53644;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3352
// Size: 0xdc
function function_ac62c6628f23f82d() {
    self endon("death");
    var_f10d2bae0aa4fce7 = getstructarray("player_pos", "targetname");
    v_spawn = undefined;
    namespace_36f464722d326bbe::function_852712268d005332(self, 1, 0);
    function_9d04463dd59c306(1);
    while (1) {
        s_pt = function_7a2aaa4a09a4d250(var_f10d2bae0aa4fce7);
        v_pos = getclosestpointonnavmesh(s_pt.origin);
        if (isdefined(v_pos) && !positionwouldtelefrag(v_pos)) {
            break;
        }
        waitframe();
    }
    self setorigin(v_pos);
    self setplayerangles(s_pt.angles);
    level flag_set("all_players_onboard");
    level.var_98539610199d2422 flag_wait("drop_off");
    namespace_36f464722d326bbe::function_852712268d005332(self, 0, 1);
    function_9d04463dd59c306(0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3435
// Size: 0x58
function function_2a6c134406898721(params) {
    if (!isdefined(params.player)) {
        return;
    }
    level.var_9ec4962076db301b["s0_act3"].var_576f57af0204c38c = params.exfil_chopper;
    level flag_set("exfil_to_s0_act_3");
    level thread function_700e95e77f71e457(params);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3494
// Size: 0x6f
function function_700e95e77f71e457(params) {
    if (!isplayer(params.player)) {
        return;
    }
    var_684092929dab076f = [0:params.player];
    var_576f57af0204c38c = level.var_9ec4962076db301b["s0_act3"].var_576f57af0204c38c;
    level thread namespace_bbc151ced3ff8d46::map_transition(var_684092929dab076f, var_576f57af0204c38c, "s0_act3");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x350a
// Size: 0x39
function oob_triggers() {
    flag_wait("players_disembarked");
    level notify("switch_oob");
    waitframe();
    level.outofboundstriggers = getentarray("OutOfBounds_ob_story", "targetname");
    level thread namespace_d9c77dc2a6fe29c6::watchoobtriggers();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x354a
// Size: 0x9f
function function_5734daa7a8ef6bd() {
    var_77ae610b84ee2e95 = getstructarray("ammo_restock", "targetname");
    foreach (var_94050959266e1ba9 in var_77ae610b84ee2e95) {
        var_28b750103c3b51fb = spawnscriptable("military_ammo_restock_noent", var_94050959266e1ba9.origin, var_94050959266e1ba9.angles);
        var_28b750103c3b51fb setscriptablepartstate("military_ammo_restock", "useable_on");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f0
// Size: 0x9f
function function_5555f62a6cc0f560() {
    var_33d6eed4b1e47fb8 = getstructarray("buystation", "targetname");
    foreach (var_3568daf74e7c3eff in var_33d6eed4b1e47fb8) {
        var_1811ae8d6e2868d = spawnscriptable("br_plunder_box", var_3568daf74e7c3eff.origin, var_3568daf74e7c3eff.angles);
        var_1811ae8d6e2868d setscriptablepartstate("br_plunder_box", "visible");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3696
// Size: 0xac
function function_fbfcd9d440346989() {
    var_4b5db131cccce121 = getstructarray("mimic_prop", "targetname");
    var_4b5db131cccce121 = array_randomize(var_4b5db131cccce121);
    for (i = 0; i < int(var_4b5db131cccce121.size * 0.5); i++) {
        ai_mimic = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_spawner_zombie_mimic", var_4b5db131cccce121[i].origin, var_4b5db131cccce121[i].angles, "team_two_hundred");
        if (isdefined(ai_mimic)) {
            ai_mimic namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
            namespace_6119efd5d1925c17::function_232cabbc43f9536(var_4b5db131cccce121[i].origin, ai_mimic, undefined, 1, 200);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3749
// Size: 0xa2
function function_f2b4f1b990effe1(n_pos) {
    self endon("death");
    level flag_wait("raft_ready");
    if (n_pos == 0) {
        self.var_1b99e092c4e3bb6c = "front_right";
    } else if (n_pos == 1) {
        self.var_1b99e092c4e3bb6c = "back_left";
    } else if (n_pos == 2) {
        self.var_1b99e092c4e3bb6c = "back_right";
    }
    if (isdefined(self.var_1b99e092c4e3bb6c)) {
        namespace_1fbd40990ee60ede::vehicle_occupancy_enter(level.var_2bba185063eeab0c, self.var_1b99e092c4e3bb6c, self, level.var_12081cfb0589668c, 1);
    }
    flag_set("player_boarded");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37f2
// Size: 0x252
function function_74139ae6c2c53345() {
    s_pos = getstruct("infil_chopper", "targetname");
    if (isdefined(s_pos)) {
        s_goal = getstruct(s_pos.target, "targetname");
    }
    spawndata = spawnstruct();
    spawndata.origin = s_pos.origin;
    spawndata.angles = s_pos.angles;
    spawndata.var_22aa4aa0cf0aa6bb = 1;
    self.infil_chopper = undefined;
    while (1) {
        self.infil_chopper = namespace_1f188a13f7e79610::vehicle_spawn("veh9_palfa", spawndata);
        if (isdefined(self.infil_chopper)) {
            self.infil_chopper.e_linkto = getentarray("linkto_clip_infil_chopper", "targetname")[0];
            self.infil_chopper.mdl_clip = getentarray("clip_infil_chopper", "targetname")[0];
            self.infil_chopper.mdl_clip linkto(self.infil_chopper.e_linkto);
            break;
        }
        waitframe();
    }
    self.infil_chopper.e_linkto rotateto(self.infil_chopper.angles, 0.05);
    self.infil_chopper.e_linkto moveto(self.infil_chopper.origin, 0.05);
    self.infil_chopper.e_linkto waittill("movedone");
    self.infil_chopper.e_linkto linkto(self.infil_chopper);
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(self.infil_chopper);
    self.infil_chopper namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    v_pos = self.infil_chopper gettagorigin("tag_door_rear");
    v_pos = vectornormalize(anglestoforward(self.infil_chopper.angles)) * 100 + v_pos;
    self.infil_chopper thread function_86b4ca8e83c456e6(self, s_goal);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a4b
// Size: 0x341
function function_86b4ca8e83c456e6(s_quest, s_goal) {
    self endon("death");
    self.team = level.players[0].team;
    namespace_9f6a961447bab709::function_a609274d97743733();
    self vehicle_setspeed(40, 20, 8);
    self setvehgoalpos(self.origin, 1);
    self waittill("goal");
    level flag_set("chopper_ready");
    level flag_wait("all_players_onboard");
    s_quest thread function_12daf479a21bb2b0();
    s_quest thread function_9ff68acffe6bd859();
    s_quest thread function_cb086b60e05cf8f7();
    wait(1);
    while (1) {
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "infil_start") {
                self vehicle_setspeed(30, 20, 8);
                self setvehgoalpos(s_goal.origin, 0);
            } else if (s_goal.script_noteworthy == "bridge") {
                self setvehgoalpos(s_goal.origin, 0);
            } else if (s_goal.script_noteworthy == "drop_off") {
                self setgoalyaw(flat_angle(s_goal.angles)[1]);
                self setvehgoalpos(s_goal.origin, 1);
            } else if (s_goal.script_noteworthy == "depart") {
                self cleargoalyaw();
                self vehicle_setspeed(60, 20, 10);
                self setvehgoalpos(s_goal.origin, 0);
            }
        } else {
            self setvehgoalpos(s_goal.origin, 0);
        }
        self waittill("goal");
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "infil_start") {
                s_quest flag_set("infil_start");
            } else if (s_goal.script_noteworthy == "bridge") {
                s_quest flag_set("airstrike");
                s_quest flag_set("bridge");
            } else if (s_goal.script_noteworthy == "drop_off") {
                self setgoalyaw(flat_angle(s_goal.angles)[1]);
                level flag_set("chopper_end");
                thread function_83ff2df370bc359b(s_quest);
                s_quest flag_set("drop_off");
                s_quest flag_wait("players_disembarked");
            } else if (s_goal.script_noteworthy == "depart") {
                self vehicle_setspeed(75, 20, 10);
            }
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            self setvehgoalpos(self.origin, 1);
            if (isdefined(self.var_b23e608ef55db7fa)) {
                foreach (pilot in self.var_b23e608ef55db7fa) {
                    pilot delete();
                }
            }
            namespace_1f188a13f7e79610::vehicle_explode();
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d93
// Size: 0x17f
function function_9ff68acffe6bd859() {
    var_635c801e4a33337f = getstruct("airstrike1", "targetname");
    var_b7a10f9d2e99d257 = getstruct("airstrike3", "targetname");
    var_b7a10e9d2e99d024 = getstruct("airstrike2", "targetname");
    self.var_3dacfe63d95c9458 = [0:var_635c801e4a33337f, 1:var_b7a10f9d2e99d257, 2:var_b7a10e9d2e99d024];
    var_c6e42f4c295786d2 = getstructarray("zombie_infil", "targetname");
    foreach (var_6a6b8244a086b1c9 in var_c6e42f4c295786d2) {
        a_ai_zombies = function_7ea5453572655fab(var_6a6b8244a086b1c9, 25, 0, 0);
        foreach (ai_zombie in a_ai_zombies) {
            ai_zombie.var_7e4b076a06c6df27 = 1;
        }
    }
    flag_wait("infil_start");
    thread function_dffbcd1cb3f42eee();
    namespace_64135de19550f047::function_4a9c0f41ba33e74d(var_635c801e4a33337f.origin, "quest_airstrike", 1, 0, var_635c801e4a33337f.angles[1]);
    thread airstrike();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f19
// Size: 0x3d
function airstrike() {
    wait(4.5);
    thread function_24139a9152fb7c1d(getstruct("airstrike3", "targetname"));
    wait(4);
    function_24139a9152fb7c1d(getstruct("airstrike2", "targetname"), 1);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5d
// Size: 0x183
function function_dffbcd1cb3f42eee() {
    self endon("airstrike_done");
    self.var_dc3f16d6cd6a2471 = 0;
    while (1) {
        level waittill("airstrike_explode");
        wait(0.5);
        self.var_dc3f16d6cd6a2471++;
        if (self.var_dc3f16d6cd6a2471 > 2) {
            a_ai_zombies = getaiarrayinradius(self.var_3dacfe63d95c9458[self.var_dc3f16d6cd6a2471 - 1].origin, self.var_3dacfe63d95c9458[self.var_dc3f16d6cd6a2471 - 1].radius * 2);
        } else {
            a_ai_zombies = getaiarrayinradius(self.var_3dacfe63d95c9458[self.var_dc3f16d6cd6a2471 - 1].origin, self.var_3dacfe63d95c9458[self.var_dc3f16d6cd6a2471 - 1].radius);
        }
        foreach (ai_zombie in a_ai_zombies) {
            if (isalive(ai_zombie)) {
                namespace_f6b8dbdf5c7eed7::function_f632348cbb773537(level.var_943fa6331a3cf64e, ai_zombie);
                if (isalive(ai_zombie)) {
                    ai_zombie dodamage(ai_zombie.health, ai_zombie.origin, undefined, undefined, "MOD_EXPLOSIVE");
                }
            }
        }
        if (self.var_dc3f16d6cd6a2471 > 2) {
            self notify("airstrike_done");
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e7
// Size: 0x4c
function function_24139a9152fb7c1d(var_635c801e4a33337f, b_last) {
    namespace_64135de19550f047::function_4a9c0f41ba33e74d(var_635c801e4a33337f.origin, "quest_airstrike", 1, 0, var_635c801e4a33337f.angles[1]);
    self waittill("airstrike_done");
    thread function_3b71972269735715();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x413a
// Size: 0x1ac
function function_204e2be0365dc7fb() {
    level.var_15c7e6ec178feef1 = 1;
    wait(1.1);
    s_pos = getstruct("infil_zodiac", "targetname");
    level.var_2bba185063eeab0c = vehicle::vehicle_spawn("veh9_rhib", s_pos);
    level.var_2bba185063eeab0c vehicle_turnengineon();
    if (isdefined(level.var_2bba185063eeab0c)) {
        level.var_2bba185063eeab0c vehicle_damage::vehicle_damage_setcandamage(0);
        level.var_12081cfb0589668c = namespace_1fbd40990ee60ede::vehicle_occupancy_getleveldataforvehicle(level.var_2bba185063eeab0c.vehiclename);
        wait(1);
        level flag_set("raft_ready");
        if (isdefined(level.var_2bba185063eeab0c)) {
            level.var_2bba185063eeab0c thread function_4ace4fbc603f978f();
            level.var_2bba185063eeab0c function_f46a6ba1faf07ca8(s_pos);
        }
        wait(3);
        if (isdefined(level.var_2bba185063eeab0c)) {
            level.var_2bba185063eeab0c function_481c2a63f2ba3332(1);
            level.var_2bba185063eeab0c vehicle_turnengineoff();
        }
        foreach (player in level.players) {
            player clearsoundsubmix("jup_ob_q3_infil");
        }
        waitframe();
        self notify("players_unloaded");
        if (isdefined(level.var_98539610199d2422)) {
            level.var_98539610199d2422 flag_wait("players_unloaded");
        }
        thread function_b1aa1fb6109a052b();
        if (isdefined(level.var_2bba185063eeab0c)) {
            level.var_2bba185063eeab0c thread function_6fbb75ffd02779d4();
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42ed
// Size: 0x1f1
function function_f46a6ba1faf07ca8(s_pos) {
    self endon("death");
    self endon("failsafe");
    self endon("infil_done");
    function_2cc3ca6a47e4797e();
    s_goal = getstruct(s_pos.target, "targetname");
    self function_77320e794d35465a("p2p", "brakeAtGoal", 0);
    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(1.5));
    self function_77320e794d35465a("p2p", "goalPoint", s_goal.origin);
    function_19574bce39210b90(s_goal);
    level thread function_cb086b60e05cf8f7();
    while (1) {
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        }
        if (isdefined(s_goal)) {
            self function_77320e794d35465a("p2p", "goalPoint", s_goal.origin);
            function_19574bce39210b90(s_goal);
            if (isdefined(s_goal.script_noteworthy)) {
                if (s_goal.script_noteworthy == "unload") {
                    self notify("infil_done");
                } else if (s_goal.script_noteworthy == "hold") {
                    self function_77320e794d35465a("p2p", "manualSpeed", 0);
                    self function_481c2a63f2ba3332(1);
                    wait(2);
                    level.var_98539610199d2422 flag_set("hold");
                    wait(4.5);
                    self function_481c2a63f2ba3332(0);
                    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(2.5));
                } else if (s_goal.script_noteworthy == "approach") {
                    level.var_98539610199d2422 flag_set("players_unloaded");
                    namespace_1fbd40990ee60ede::vehicle_occupancy_ejectalloccupants(self);
                    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(self);
                    thread function_50913934d674d3aa();
                }
            }
        }
        if (!isdefined(s_goal.target)) {
            break;
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e5
// Size: 0x34
function function_6fbb75ffd02779d4() {
    s_stronghold_approach = getstruct("s_stronghold_approach", "targetname");
    function_312c0192743dc215(s_stronghold_approach);
    namespace_5a0f3ca265d3a4c8::function_d0df49de517ded03();
    namespace_1f188a13f7e79610::vehicle_explode();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4520
// Size: 0x34
function function_50913934d674d3aa() {
    self endon("death");
    while (1) {
        wait(1);
        occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(self);
        if (isdefined(occupants)) {
            namespace_1fbd40990ee60ede::vehicle_occupancy_ejectalloccupants(self);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455b
// Size: 0x50
function function_19574bce39210b90(s_goal) {
    self endon("death");
    self endon("goal_reached");
    while (1) {
        if (distance2dsquared(self.origin, s_goal.origin) <= 40000) {
            self notify("goal_reached");
        }
        wait(0.5);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b2
// Size: 0x14
function function_4ace4fbc603f978f() {
    self endon("death");
    self endon("players_unloaded");
    wait(30);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45cd
// Size: 0x1c1
function function_2cc3ca6a47e4797e() {
    if (!self function_1e8542a707a8002("p2p")) {
        self function_d2e41c7603ba7697("p2p");
    }
    if (!self function_1e8542a707a8002("path")) {
        self function_d2e41c7603ba7697("path");
    }
    self function_77320e794d35465a("p2p", "brakeAtGoal", 0);
    self function_77320e794d35465a("p2p", "automaticFast", 1);
    self function_77320e794d35465a("p2p", "brakeOnGoalGasbrake", 1);
    self function_77320e794d35465a("p2p", "goalPoint", self.origin);
    self function_77320e794d35465a("p2p", "goalThreshold", 500);
    self function_77320e794d35465a("p2p", "throttleSpeedClose", 1);
    self function_77320e794d35465a("p2p", "throttleSpeedThreshold", 1);
    self function_77320e794d35465a("p2p", "automaticFastTopspeedFraction", 1);
    self function_77320e794d35465a("p2p", "throttleSpeedFarBelow", 10);
    self function_77320e794d35465a("p2p", "throttleSpeedFarAbove", 1);
    self function_77320e794d35465a("p2p", "throttleSpeedClose", 1);
    self function_77320e794d35465a("p2p", "gasToStopMovement", 1);
    self function_77320e794d35465a("p2p", "steeringMultiplier", 0.5);
    self function_77320e794d35465a("p2p", "reverseGasNormal", 0.1);
    self function_77320e794d35465a("path", "radiusToStep", 300);
    self function_77320e794d35465a("path", "stepSpeedFactor", 2);
    self function_77320e794d35465a("path", "yawHelper", 0);
    self.dontunloadonend = 1;
    self.donotunloadondriverdeath = 1;
    self.dontunloadondeath = 1;
    self.stopping = 0;
    self function_481c2a63f2ba3332(0);
    self vehicle_turnengineon();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4795
// Size: 0xe0
function function_ecf84ae0ccf5e133() {
    var_c6e42f4c295786d2 = getstructarray("zombie_intro", "targetname");
    foreach (var_6a6b8244a086b1c9 in var_c6e42f4c295786d2) {
        a_ai_zombies = function_7ea5453572655fab(var_6a6b8244a086b1c9, 25, 0, 0);
        foreach (ai_zombie in a_ai_zombies) {
            ai_zombie.var_7e4b076a06c6df27 = 1;
            ai_zombie callback::add("on_zombie_ai_damaged", &on_zombie_ai_damaged);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x487c
// Size: 0x37
function function_d104044235189c3b(s_quest) {
    self endon("death");
    s_quest flag_wait("zombies_cleared");
    self kill(self.origin, self, self, "MOD_PROJECTILE_SPLASH");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48ba
// Size: 0xd7
function function_d88d2af5d12ad7ac(var_43791d56126e3075) {
    explosive_barrels = [];
    a_s_barrels = getstructarray(var_43791d56126e3075, "targetname");
    foreach (s_barrel in a_s_barrels) {
        var_ca6d90a11ccbbf85 = spawnscriptable("barrel_toggleable_red", s_barrel.origin, s_barrel.angles);
        if (isdefined(var_ca6d90a11ccbbf85)) {
            namespace_134d54e39331ee45::function_5086e0629a1b455(var_ca6d90a11ccbbf85);
            if (isdefined(s_barrel.script_noteworthy) && s_barrel.script_noteworthy == "rooftop_barrel") {
                explosive_barrels[explosive_barrels.size] = var_ca6d90a11ccbbf85;
            }
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4998
// Size: 0xe3
function function_d363528f975069cd(str_name) {
    while (1) {
        var_da3a55eabb666c32 = getaiarray("team_hundred_ninety");
        if (isdefined(var_da3a55eabb666c32) && var_da3a55eabb666c32.size) {
            break;
        }
        wait(0.1);
    }
    var_5ef3badcbe1b5057 = [];
    var_f75ab33b14599ef5 = getstructarray(str_name, "targetname");
    foreach (var_46a34af7197a5a98 in var_f75ab33b14599ef5) {
        waitframe();
        mine = namespace_17b45e55cf344cda::function_908ec13fb4d6cede(var_46a34af7197a5a98.origin, undefined, var_da3a55eabb666c32[0]);
        if (isdefined(mine)) {
            mine.allowfriendlyfire = 1;
            var_5ef3badcbe1b5057[var_5ef3badcbe1b5057.size] = mine;
        }
    }
    return var_5ef3badcbe1b5057;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a83
// Size: 0x115
function function_3b71972269735715() {
    a_s_locs = getstructarray("s_fallback", "targetname");
    var_6a4e378d83f4ed19 = getstructarray("zombie_intro", "targetname");
    foreach (s_loc in a_s_locs) {
        if (level.players.size < 3) {
            var_c41ff3df2633113b = function_5e715be63f9f20de(s_loc, 1);
        } else {
            var_c41ff3df2633113b = function_5e715be63f9f20de(s_loc, 2);
        }
        foreach (var_a900fbd079a2fd56 in var_c41ff3df2633113b) {
            var_a900fbd079a2fd56 thread function_9081e87a119b8461(function_7a2aaa4a09a4d250(var_6a4e378d83f4ed19).origin, 200);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b9f
// Size: 0x278
function function_addfb21bf2f5d717() {
    s_stronghold_approach = getstruct("s_stronghold_approach", "targetname");
    thread function_a5b76e0f5024cc9a(s_stronghold_approach, "river_crossed", 9500);
    thread function_a5b76e0f5024cc9a(s_stronghold_approach, "train_tracks", 6000);
    function_312c0192743dc215(s_stronghold_approach);
    thread function_d363528f975069cd("sentry_mine_tracks");
    var_f10d2bae0aa4fce7 = getstructarray("merc_frontline_spawnpt", "targetname");
    var_ee3ea8d303c9025c = [0:"jup_ob_enemy_basic_grunt_short", 1:"jup_ob_enemy_basic_grunt_long", 2:"jup_ob_enemy_basic_soldier_short", 3:"jup_ob_enemy_basic_soldier_long"];
    foreach (s_spawnpt in var_f10d2bae0aa4fce7) {
        if (isdefined(s_spawnpt.script_noteworthy)) {
            var_31109020393ed11b = "jup_ob_enemy_specialist_" + s_spawnpt.script_noteworthy;
        } else {
            var_31109020393ed11b = function_7a2aaa4a09a4d250(var_ee3ea8d303c9025c);
        }
        var_434d2faf62ed069 = s_spawnpt merc_spawn(var_31109020393ed11b);
        if (isdefined(var_434d2faf62ed069)) {
            if (var_434d2faf62ed069.agent_type == "actor_jup_ob_enemy_specialist_sniper") {
                var_434d2faf62ed069 thread function_9081e87a119b8461(s_spawnpt.origin);
                var_434d2faf62ed069 thread function_da159dba71d973c2(5000);
                var_434d2faf62ed069 thread function_a079767f0ca0d4c4(self);
            } else {
                var_434d2faf62ed069 thread function_c3e93b21ceeb1d92(self);
            }
        }
    }
    var_5692132c514fc1d0 = getstruct("merc_sniper_tower", "targetname");
    var_219647f911c4ca77 = var_5692132c514fc1d0 merc_spawn("jup_ob_enemy_specialist_sniper");
    if (isdefined(var_219647f911c4ca77)) {
        var_219647f911c4ca77 thread function_9081e87a119b8461(var_5692132c514fc1d0.origin);
        var_219647f911c4ca77 thread function_da159dba71d973c2(5000);
        var_219647f911c4ca77 thread function_a079767f0ca0d4c4(self);
        var_219647f911c4ca77 thread merc_sniper_tower(var_5692132c514fc1d0);
    }
    var_5692132c514fc1d0 = getstruct("merc_facility_sniper", "targetname");
    s_goal = getstruct(var_5692132c514fc1d0.target, "targetname");
    var_31109020393ed11b = "jup_ob_enemy_specialist_" + var_5692132c514fc1d0.script_noteworthy;
    function_312c0192743dc215(var_5692132c514fc1d0);
    var_219647f911c4ca77 = s_spawnpt merc_spawn(var_31109020393ed11b);
    if (isdefined(var_219647f911c4ca77)) {
        var_219647f911c4ca77 thread function_9081e87a119b8461(s_goal.origin);
        var_219647f911c4ca77 thread function_da159dba71d973c2(5000);
        var_219647f911c4ca77 thread function_a079767f0ca0d4c4(self);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e1e
// Size: 0x6f
function merc_sniper_tower(var_5692132c514fc1d0) {
    self waittill("death");
    if (isdefined(self)) {
        v_forward = vectornormalize(anglestoforward(var_5692132c514fc1d0.angles)) * 4 + self.origin;
    }
    waitframe();
    if (isdefined(self)) {
        e_corpse = self getcorpseentity();
    }
    if (isdefined(e_corpse)) {
        e_corpse startragdollfromimpact("torso_lower", v_forward);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e94
// Size: 0x23
function function_c3e93b21ceeb1d92(s_quest) {
    self endon("death");
    s_quest waittill("train_tracks");
    thread merc_attack();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ebe
// Size: 0x27
function function_a079767f0ca0d4c4(s_quest) {
    self endon("death");
    s_quest flag_wait("charge_planted");
    self kill();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eec
// Size: 0x151
function function_1c3939b802f05136() {
    var_462dea9bc3c97dc3 = getstructarray("zombie_pen", "targetname");
    foreach (var_fdb3d2fd433a9856 in var_462dea9bc3c97dc3) {
        var_fdb3d2fd433a9856.var_fb0b130aadea0e12 = spawnscriptable("ob_zombie_shipping_container", var_fdb3d2fd433a9856.origin, var_fdb3d2fd433a9856.angles);
        var_fdb3d2fd433a9856.var_fb0b130aadea0e12 setscriptablepartstate("state", "visible");
        var_fdb3d2fd433a9856 thread function_ea9c9fa94fbf39f1();
    }
    var_1c0f03f93fb4f5b = getstructarray("zombie_container", "targetname");
    foreach (var_743fa49ab0bd5436 in var_1c0f03f93fb4f5b) {
        var_fb0b130aadea0e12 = spawnscriptable("ob_zombie_shipping_container_ambient", var_743fa49ab0bd5436.origin, var_743fa49ab0bd5436.angles);
        var_fb0b130aadea0e12 setscriptablepartstate("state", "visible");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5044
// Size: 0x7f
function function_3f90c8202c9d37cb() {
    function_312c0192743dc215(getstruct("s_zombie_water", "targetname"));
    a_s_spawners = getstructarray("zombie_water", "targetname");
    flag_set("alerted");
    self notify("alerted");
    for (i = 0; i < a_s_spawners.size; i++) {
        zombie_spawn(a_s_spawners[i], 0, 1);
        wait(randomfloatrange(0.25, 0.5));
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50ca
// Size: 0xc7
function function_1e86be4e3accaf94() {
    self.var_4118ca23a8b62b78 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(0);
    waitframe();
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_add_objective(self.var_4118ca23a8b62b78, "current");
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.s_stronghold.origin + (0, 0, 280));
    namespace_5a22b6f3a56f7e9b::update_objective_icon(self.var_4118ca23a8b62b78, "jup_ui_map_icon_generic_marker");
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.var_4118ca23a8b62b78);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::function_98ba077848896a3(self.var_4118ca23a8b62b78, 1);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5198
// Size: 0xce
function function_60721b5cb1eee95c() {
    level flag_wait("chopper_end");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_INFILTRATE", level.players);
    namespace_d696adde758cbe79::showdmzsplash("quest_s0_act3_start", level.players);
    flag_wait("players_disembarked");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT3_REACH_FACILITY", level.players);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
    thread function_a5b76e0f5024cc9a(getstruct("enrichment_machine", "targetname"), "facility_approach", 1000);
    level thread function_a0c0fd784f3d1882();
    self waittill("facility_approach");
    self notify("entrance_found");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("fight_to_stronghold_zakhaev");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x526d
// Size: 0x188
function function_3a8fc38da7251e76() {
    self waittill("entrance_found");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT3_LOCATE_DEVICE", level.players);
    waitframe();
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.var_d40a3dadfbf95c42.origin + (0, 0, 68));
    function_312c0192743dc215(self.var_d40a3dadfbf95c42);
    level flag_set("facility_entered");
    setmusicstate("mx_ob_q3_action_low");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.s_machine.origin + (0, 0, 80));
    function_312c0192743dc215(self.s_machine);
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT3_PLANT_EXPLOSIVE", level.players);
    self notify("device_found");
    waitframe();
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
    function_9766d0b79eada249(self.var_4118ca23a8b62b78, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.var_ca0439c2f79cc0fb.origin);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53fc
// Size: 0x52
function approach_neutralizer() {
    function_312c0192743dc215(self.var_33ff83242dcaad2b, 8500);
    flag_set("approach_neutralizer");
    flag_wait("neutralizer_dropped");
    function_a5b76e0f5024cc9a(self.var_a6cd1b1206e83312, "neutralizer_reached", 700);
    flag_set("neutralizer_reached");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5455
// Size: 0x2b9
function function_5cb2f7158d07480c() {
    flag_wait("charge_planted");
    setmusicstate("mx_ob_q3_action_high");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT3_PROCEED_LZ", level.players);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.var_a6cd1b1206e83312.origin + (0, 0, 42));
    flag_wait("approach_neutralizer");
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.var_4118ca23a8b62b78);
    while (!isdefined(self.var_4ec719f9f007acbc)) {
        wait(0.1);
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.var_4118ca23a8b62b78, self.var_4ec719f9f007acbc);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.var_4118ca23a8b62b78, 248);
    flag_wait("neutralizer_dropped");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.var_a6cd1b1206e83312.origin + (0, 0, 100));
    thread function_340a2b1d87903294();
    flag_wait("neutralizer_reached");
    setmusicstate("mx_ob_q3_action_exit");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT3_ACTIVATE_NEUTRALIZER", level.players);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.var_11d2e045f1efdf0f.origin);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.var_4118ca23a8b62b78, 0);
    thread function_6ddbbcc69eb0e369();
    flag_wait("neutralizer_on");
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.var_4118ca23a8b62b78);
    flag_wait("chopper_obj");
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.var_4118ca23a8b62b78, self.var_43a004d463dee018);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.var_4118ca23a8b62b78, 100);
    wait(1);
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT3_NEUTRALIZER_DEFEND", level.players);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5715
// Size: 0xe2
function function_340a2b1d87903294() {
    var_f38ceacaaaab305a = spawnscriptable("ob_quest_neutralizer", self.var_a6cd1b1206e83312.origin, self.var_a6cd1b1206e83312.angles);
    var_f38ceacaaaab305a setscriptablepartstate("state", "visible");
    flag_wait("neutralizer_on");
    wait(1);
    var_f38ceacaaaab305a setscriptablepartstate("state", "ready");
    wait(10);
    var_f38ceacaaaab305a setscriptablepartstate("state", "activate");
    wait(8);
    var_f38ceacaaaab305a setscriptablepartstate("state", "twentyfive");
    wait(8);
    var_f38ceacaaaab305a setscriptablepartstate("state", "fifty");
    wait(8);
    var_f38ceacaaaab305a setscriptablepartstate("state", "seventyfive");
    wait(8);
    var_f38ceacaaaab305a setscriptablepartstate("state", "onehundred");
    level waittill("deathworm_dead");
    var_f38ceacaaaab305a freescriptable();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x57fe
// Size: 0xd0
function function_19c6345441a07ac8(var_2ef3cbe9c4dcfae, str_endon, n_radius) {
    self endon(str_endon);
    n_dist = squared(n_radius);
    while (1) {
        foreach (player in level.players) {
            if (isalive(player)) {
                if (distancesquared(var_2ef3cbe9c4dcfae, player.origin) < n_dist) {
                    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.var_4118ca23a8b62b78, player);
                } else {
                    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.var_4118ca23a8b62b78, player);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58d5
// Size: 0x1db
function function_2e0dc001c9a5c661() {
    var_d08f3ac86be7ae9e = getstructarray("map_transition_to_act3", "targetname");
    self.var_a5016e4b6acfea47 = [];
    level waittill("prematch_done");
    thread function_a49ca0a80cb63664();
    foreach (var_751df20fceaee5 in var_d08f3ac86be7ae9e) {
        var_751df20fceaee5.var_d182b8d3f3aaa93b = namespace_4e16584f2211900a::spawn_script_model(var_751df20fceaee5, "ob_quest_exfil_site_xmodel", 1, 1);
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_site", "standby");
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_icon", "default_icon");
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_smoke", "smoking");
        self.var_a5016e4b6acfea47[self.var_a5016e4b6acfea47.size] = var_751df20fceaee5.var_d182b8d3f3aaa93b;
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact = interaction::function_90472496b91b94b3(var_751df20fceaee5.var_d182b8d3f3aaa93b, 80, &function_a1778cdfcc8373ae, "JUP_OB_OBJECTIVES/QUEST_0_ACT3_TRANSITION");
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact sethintonobstruction("show");
        var_751df20fceaee5 thread function_e3ba83b1bb428b8e();
    }
    level flag_wait("exfil_nuclear");
    foreach (var_751df20fceaee5 in var_d08f3ac86be7ae9e) {
        if (isdefined(var_751df20fceaee5.n_obj_id)) {
            namespace_6c8a837ec98fe0b8::returnobjectiveid(var_751df20fceaee5.n_obj_id);
            var_751df20fceaee5.n_obj_id = undefined;
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ab7
// Size: 0x92
function function_a49ca0a80cb63664() {
    level flag_wait("exfil_nuclear");
    wait(1);
    foreach (var_d182b8d3f3aaa93b in self.var_a5016e4b6acfea47) {
        if (isdefined(var_d182b8d3f3aaa93b) && isdefined(var_d182b8d3f3aaa93b.interact)) {
            var_d182b8d3f3aaa93b.interact delete();
        }
        if (isdefined(var_d182b8d3f3aaa93b)) {
            var_d182b8d3f3aaa93b delete();
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b50
// Size: 0x98
function function_e3ba83b1bb428b8e() {
    self.n_obj_id = namespace_6c8a837ec98fe0b8::requestobjectiveid(1);
    namespace_6c8a837ec98fe0b8::objective_add_objective(self.n_obj_id, "invisible", self.var_d182b8d3f3aaa93b.origin, "ui_map_icon_ob_quest_exfil", "icon_small");
    namespace_6c8a837ec98fe0b8::update_objective_onentity(self.n_obj_id, self.var_d182b8d3f3aaa93b);
    namespace_6c8a837ec98fe0b8::function_c3c6bff089dfdd34(self.n_obj_id, "icon_regular");
    objective_setlabel(self.n_obj_id, "SHARED_HINTSTRINGS/EXFIL");
    objective_setplayintro(self.n_obj_id, 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bef
// Size: 0x55
function function_a1778cdfcc8373ae(player) {
    if (isdefined(level.var_d8b6115a502e7e76)) {
        if (!self [[ level.var_d8b6115a502e7e76 ]](player)) {
            self playsoundtoplayer("ui_zm_core_door_purchase_deny", player);
            return;
        }
    }
    level flag_set("exfil_nuclear");
    level thread map_transition();
    self function_dfb78b3e724ad620(0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c4b
// Size: 0x161
function map_transition(var_684092929dab076f, var_576f57af0204c38c) {
    var_61dbf957f494509e = [];
    while (1) {
        player = var_684092929dab076f[0];
        var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
        var_22d2a2a72fc2c595 = [];
        foreach (var_9191cfe9f04a69a8 in var_c9b69aecc5c631ed) {
            if (var_576f57af0204c38c function_c80b9a252474413b(var_9191cfe9f04a69a8)) {
                var_22d2a2a72fc2c595[var_22d2a2a72fc2c595.size] = var_9191cfe9f04a69a8;
            }
        }
        var_61dbf957f494509e[var_61dbf957f494509e.size] = var_22d2a2a72fc2c595;
        foreach (var_9191cfe9f04a69a8 in var_22d2a2a72fc2c595) {
            var_684092929dab076f = array_remove(var_684092929dab076f, var_9191cfe9f04a69a8);
        }
        if (!var_684092929dab076f.size) {
            break;
        }
        waitframe();
    }
    foreach (squad in var_61dbf957f494509e) {
        level thread namespace_41bcc2f40ffd0e7f::function_e229d89e0c38206d(squad, 1003);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5db3
// Size: 0x5c
function player_setup() {
    self.ignoreme = 1;
    self allowfire(0);
    hidehudenable();
    if (isdefined(level.var_98539610199d2422)) {
        level.var_98539610199d2422 flag_wait("players_unloaded");
    }
    wait(1);
    self.ignoreme = 0;
    self allowfire(1);
    hidehuddisable();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e16
// Size: 0x16e
function function_804aa1cbd49ba400(var_bb4d3effa86edc82, s_pos, var_496dfdff0596a91d) {
    s_pos.spawndata = spawnstruct();
    s_pos.spawndata.origin = s_pos.origin;
    s_pos.spawndata.angles = s_pos.angles;
    s_pos.spawndata.var_22aa4aa0cf0aa6bb = 1;
    vh_chopper = vehicle::vehicle_spawn(var_bb4d3effa86edc82, s_pos.spawndata);
    if (isdefined(vh_chopper)) {
        vehicle_interact::vehicle_interact_makeunusable(vh_chopper);
        vh_chopper.var_1e897ae1c018b2c2 = "team_hundred_ninety";
        vh_chopper.unload_land_offset = 255;
        vh_chopper.script_disconnectpaths = 1;
        vh_chopper.ignorelist = [0:vh_chopper];
        if (var_496dfdff0596a91d) {
            vh_chopper vehicle_setspeed(60, 15, 10);
            vh_chopper.vehiclesetuprope = 1;
            vh_chopper function_bf804dfb24daddd5(self);
        } else {
            vh_chopper vehicle_setspeed(80, 25, 15);
            vh_chopper.var_bdec9a74b3b2a503 = vh_chopper function_61650f275ef0266f("tag_rocket_left1");
            vh_chopper.var_2d5a32b6a40fda8c = vh_chopper function_61650f275ef0266f("tag_rocket_right1");
        }
        vh_chopper setvehgoalpos(vh_chopper.origin, 1);
        return vh_chopper;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8b
// Size: 0xb3
function function_bf804dfb24daddd5(s_quest) {
    self endon("death");
    self.var_f585b76d7f472cd9 = [];
    var_2ac677774b7330eb = function_25e754c30394817f("chopper");
    for (i = 0; i < var_2ac677774b7330eb; i++) {
        var_31109020393ed11b = function_7a2aaa4a09a4d250(s_quest.var_ee3ea8d303c9025c);
        var_434d2faf62ed069 = namespace_2b1145f62aa835b8::spawnnewaitype_sharedfunc(var_31109020393ed11b, self.origin, self.angles, "team_hundred_ninety");
        if (isdefined(var_434d2faf62ed069)) {
            self.var_f585b76d7f472cd9[i] = var_434d2faf62ed069;
        }
        waitframe();
    }
    namespace_d595138a91ee4a1d::function_35c699c709e24b69(self.var_f585b76d7f472cd9);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6045
// Size: 0x426
function function_467714861e4130a5(s_start) {
    self endon("death");
    self.var_e1f4682a6a54b921 = "left";
    s_goal = getstruct(s_start.target, "targetname");
    while (1) {
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "fire") {
                self setvehgoalpos(s_goal.origin, 1);
            } else if (s_goal.script_noteworthy == "wait") {
                self setvehgoalpos(s_goal.origin, 1);
            }
        } else {
            self setvehgoalpos(s_goal.origin, 0);
        }
        self waittill("goal");
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "fire") {
                if (isdefined(s_start.script_noteworthy) && isdefined(self.var_8b485876981911ff) && self.var_8b485876981911ff) {
                    self.var_8b485876981911ff = 0;
                    var_6a30ee288bc70c5d = getstruct("first_shot", "script_noteworthy");
                    var_6a30eb288bc705c4 = getstruct("second_shot", "script_noteworthy");
                    var_88f4e815dfb6e9ac = spawn_model("tag_origin", var_6a30ee288bc70c5d.origin);
                    var_88f4eb15dfb6f045 = spawn_model("tag_origin", var_6a30eb288bc705c4.origin);
                    self setlookatent(var_88f4e815dfb6e9ac);
                    while (1) {
                        if (function_3b142e491735475(var_88f4e815dfb6e9ac) || !isalive(var_88f4e815dfb6e9ac)) {
                            break;
                        }
                        wait(0.1);
                    }
                    function_50446d8d9c77ea2e(var_88f4e815dfb6e9ac);
                    wait(1);
                    function_50446d8d9c77ea2e(var_88f4eb15dfb6f045);
                    self clearlookatent();
                    var_88f4e815dfb6e9ac delete();
                    var_88f4eb15dfb6f045 delete();
                    wait(1);
                    level.var_98539610199d2422 thread function_76ab8d60113c9c8f();
                }
                a_ai_zombies = getaiarrayinradius(self.origin, s_goal.radius, "team_two_hundred");
                while (!level.var_98539610199d2422 flag("hold")) {
                    ai_target = function_7a2aaa4a09a4d250(a_ai_zombies);
                    if (isdefined(ai_target)) {
                        self setlookatent(ai_target);
                        while (1) {
                            if (function_3b142e491735475(ai_target) || !isalive(ai_target)) {
                                break;
                            }
                            wait(0.1);
                        }
                        wait(1);
                        function_50446d8d9c77ea2e(ai_target);
                        self clearlookatent();
                    }
                    a_ai_zombies = array_removedead(a_ai_zombies);
                    wait(randomfloatrange(1, 1.5));
                }
                level.var_98539610199d2422 flag_set("zombies_cleared");
                self clearlookatent();
            } else if (s_goal.script_noteworthy == "wait") {
                level.var_98539610199d2422 flag_wait("zombies_cleared");
                wait(randomfloatrange(1.8, 2.2));
            } else if (s_goal.script_noteworthy == "unload") {
                self setgoalyaw(flat_angle(s_goal.angles)[1]);
                self sethoverparams(0);
                self.var_da3a55eabb666c32 = heli_unload(s_goal);
                self notify("unloaded_mercs");
                self cleargoalyaw();
            }
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            var_f585b76d7f472cd9 = getaiarrayinradius(self.origin, 500, "team_hundred_ninety");
            foreach (ai_rider in var_f585b76d7f472cd9) {
                if (isalive(ai_rider)) {
                    ai_rider kill();
                }
            }
            thread function_2464d79a2aec25f();
            namespace_5a0f3ca265d3a4c8::function_d0df49de517ded03();
            namespace_1f188a13f7e79610::vehicle_explode();
            break;
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6472
// Size: 0x1ba
function function_50446d8d9c77ea2e(e_target) {
    if (self.var_e1f4682a6a54b921 == "left") {
        self.var_bdec9a74b3b2a503 thread namespace_b1378d83bac67c85::choppergunner_firemissilefx(1);
        self.var_b8ee7ddd93755f86 = self.var_bdec9a74b3b2a503;
        self.str_tag = "tag_rocket_left1";
        self.var_e1f4682a6a54b921 = "right";
    } else {
        self.var_2d5a32b6a40fda8c thread namespace_b1378d83bac67c85::choppergunner_firemissilefx(2);
        self.var_b8ee7ddd93755f86 = self.var_2d5a32b6a40fda8c;
        self.str_tag = "tag_rocket_right1";
        self.var_e1f4682a6a54b921 = "left";
    }
    var_48c7944ad56a77ec = self gettagorigin(self.str_tag);
    if (isvector(e_target)) {
        var_85fa3cdcb19d2a9c = e_target;
    } else {
        var_85fa3cdcb19d2a9c = e_target.origin;
    }
    var_a437f2b6d33146eb = vectornormalize(var_85fa3cdcb19d2a9c - var_48c7944ad56a77ec);
    var_b979f793dccb4061 = self.var_b8ee7ddd93755f86.origin * (1, 1, 0) + (0, 0, var_48c7944ad56a77ec[2]);
    var_429aae2e6e20f85 = var_b979f793dccb4061 + var_a437f2b6d33146eb * 100;
    var_ab7356fd109d3e8d = "chopper_gunner_proj_dmz";
    missile = namespace_d325722f2754c2c4::_magicbullet(makeweapon(var_ab7356fd109d3e8d), var_429aae2e6e20f85, var_85fa3cdcb19d2a9c);
    missile.owner = self;
    wait(0.25);
    if (isdefined(missile) && isdefined(e_target)) {
        if (isai(e_target)) {
            missile thread function_9a12e4ae660ebeb9(e_target);
        } else if (isplayer(e_target)) {
            missile thread function_9a4e1c2bf172c26b(e_target);
        }
    }
    missile missile_settargetpos(var_85fa3cdcb19d2a9c);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6633
// Size: 0x41
function function_9a4e1c2bf172c26b(e_target) {
    self waittill("death");
    if (isdefined(self)) {
        v_impact = self.origin;
        radiusdamage(v_impact, 600, 60, 20, self, "MOD_PROJECTILE_SPLASH");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667b
// Size: 0xc1
function function_9a12e4ae660ebeb9(e_target) {
    self waittill("death");
    n_radius = 800;
    if (isdefined(self)) {
        if (isalive(e_target)) {
            e_target dodamage(50, self.origin);
        }
        a_ai_zombies = getaiarrayinradius(self.origin, n_radius, "team_two_hundred");
        foreach (ai_zombie in a_ai_zombies) {
            if (isalive(ai_zombie)) {
                ai_zombie dodamage(50, self.origin);
            }
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6743
// Size: 0xb2
function function_a5e63dc4b0096441() {
    n_index = randomint(6);
    switch (n_index) {
    case 0:
        str_hit_loc = "head";
        break;
    case 1:
        str_hit_loc = "right_leg_lower";
        break;
    case 2:
        str_hit_loc = "left_leg_lower";
        break;
    case 3:
        str_hit_loc = "torso_lower";
        break;
    case 4:
        str_hit_loc = "right_arm_upper";
        break;
    case 5:
        str_hit_loc = "left_arm_upper";
        break;
    }
    if (isdefined(str_hit_loc)) {
        return str_hit_loc;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67fc
// Size: 0x79
function function_61650f275ef0266f(tag) {
    var_b8ee7ddd93755f86 = spawn("script_model", self gettagorigin(tag));
    var_b8ee7ddd93755f86 setmodel("ks_chopper_gunner_turret_mp");
    var_b8ee7ddd93755f86 show();
    var_b8ee7ddd93755f86.angles = self.angles;
    var_b8ee7ddd93755f86 linkto(self, tag);
    var_b8ee7ddd93755f86 setotherent(self);
    var_b8ee7ddd93755f86.heli = self;
    var_b8ee7ddd93755f86 thread function_c6366a8fc111f210(self);
    return var_b8ee7ddd93755f86;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687d
// Size: 0x20
function function_c6366a8fc111f210(heli) {
    heli waittill("death");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68a4
// Size: 0x77
function function_3b142e491735475(target) {
    if (!isdefined(self)) {
        return;
    }
    var_97f0985016aa48cb = 0.8;
    var_929ad65d451ffc68 = anglestoforward(self.angles);
    var_efa57adc48838f9b = vectornormalize(target.origin - self gettagorigin("tag_origin"));
    var_ff53e400dd536b82 = vectordot(var_929ad65d451ffc68, var_efa57adc48838f9b);
    return var_ff53e400dd536b82 >= var_97f0985016aa48cb;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6923
// Size: 0x14b
function function_c776ee14bbf6320e(s_quest, s_goal) {
    self vehicle_setspeed(60, 10, 8);
    while (1) {
        if (isdefined(s_goal.script_noteworthy) && s_goal.script_noteworthy == "drop_off") {
            heli_unload(s_goal);
        } else {
            if (isdefined(s_goal.script_noteworthy)) {
                if (s_goal.script_noteworthy == "approach") {
                    self setvehgoalpos(s_goal.origin, 1);
                }
            } else {
                self setvehgoalpos(s_goal.origin, 0);
            }
            self waittill("goal");
        }
        if (isdefined(s_goal.script_noteworthy) && s_goal.script_noteworthy == "approach") {
            if (isdefined(s_goal.target2)) {
                thread smoke_screen(getstruct(s_goal.target2, "targetname").origin);
            }
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            break;
        }
    }
    thread function_2464d79a2aec25f();
    namespace_5a0f3ca265d3a4c8::function_d0df49de517ded03();
    namespace_1f188a13f7e79610::vehicle_explode();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a75
// Size: 0x79
function function_2464d79a2aec25f() {
    var_f585b76d7f472cd9 = getaiarrayinradius(self.origin, 500, "team_hundred_ninety");
    foreach (ai_rider in var_f585b76d7f472cd9) {
        if (isalive(ai_rider)) {
            ai_rider kill();
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af5
// Size: 0x3f
function smoke_screen(v_pos) {
    magicgrenademanual("smoke_grenade_mp", v_pos, (0, 0, -10), 0.5);
    play_sound_in_space("smoke_grenade_expl_trans", self.origin);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b3b
// Size: 0x10e
function function_25e754c30394817f(var_262e2e52c4899135) {
    switch (level.players.size) {
    case 1:
        if (var_262e2e52c4899135 == "truck") {
            var_2ac677774b7330eb = 3;
        } else if (var_262e2e52c4899135 == "chopper") {
            var_2ac677774b7330eb = 6;
        }
        break;
    case 2:
        if (var_262e2e52c4899135 == "truck") {
            var_2ac677774b7330eb = 4;
        } else if (var_262e2e52c4899135 == "chopper") {
            var_2ac677774b7330eb = 6;
        }
        break;
    case 3:
        if (var_262e2e52c4899135 == "truck") {
            var_2ac677774b7330eb = 5;
        } else if (var_262e2e52c4899135 == "chopper") {
            var_2ac677774b7330eb = 6;
        }
        break;
    case 4:
        if (var_262e2e52c4899135 == "truck") {
            var_2ac677774b7330eb = 5;
        } else if (var_262e2e52c4899135 == "chopper") {
            var_2ac677774b7330eb = 6;
        }
        break;
    default:
        if (var_262e2e52c4899135 == "truck") {
            var_2ac677774b7330eb = 5;
        } else if (var_262e2e52c4899135 == "chopper") {
            var_2ac677774b7330eb = 6;
        }
        break;
    }
    return var_2ac677774b7330eb;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c51
// Size: 0x81
function heli_unload(s_loc) {
    self setvehgoalpos(s_loc.origin, 1);
    self waittill("goal");
    self sethoverparams(0);
    if (isdefined(s_loc.target2)) {
        thread smoke_screen(getstruct(s_loc.target2, "targetname").origin);
    }
    var_b3941e6a151cf4d2 = namespace_bf4f6ba196da1351::_vehicle_unload();
    self waittill("unloaded");
    return var_b3941e6a151cf4d2;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cda
// Size: 0x6c
function function_11547bb002dd118c() {
    var_72197e516436cc5c = getstructarray("door_lock", "targetname");
    foreach (s_door in var_72197e516436cc5c) {
        s_door thread function_5118998628125357();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d4d
// Size: 0xbf
function function_5118998628125357() {
    level endon("facility_entered");
    function_312c0192743dc215(self);
    a_s_spawners = getstructarray(self.target, "targetname");
    var_ee3ea8d303c9025c = [0:"jup_ob_enemy_basic_grunt_short", 1:"jup_ob_enemy_basic_grunt_long", 2:"jup_ob_enemy_basic_soldier_short", 3:"jup_ob_enemy_basic_soldier_long"];
    foreach (s_spawner in a_s_spawners) {
        var_434d2faf62ed069 = s_spawner merc_spawn(function_7a2aaa4a09a4d250(var_ee3ea8d303c9025c));
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e13
// Size: 0x10f
function merc_interior() {
    var_ca71d43d32b11703 = getstruct("s_merc_interior", "targetname");
    function_312c0192743dc215(var_ca71d43d32b11703);
    setmusicstate("mx_ob_q3_action_high");
    var_ca71d43d32b11703 smoke_screen(var_ca71d43d32b11703.origin);
    var_fdbc62a2eb9677f = getstructarray("merc_interior", "targetname");
    var_ee3ea8d303c9025c = [0:"jup_ob_enemy_basic_grunt_short", 1:"jup_ob_enemy_basic_grunt_long", 2:"jup_ob_enemy_basic_soldier_short", 3:"jup_ob_enemy_basic_soldier_long"];
    foreach (var_a78bcf6ec986182 in var_fdbc62a2eb9677f) {
        if (isdefined(var_a78bcf6ec986182.script_noteworthy)) {
            var_434d2faf62ed069 = var_a78bcf6ec986182 merc_spawn("jup_ob_enemy_specialist_shielded");
        } else {
            var_434d2faf62ed069 = var_a78bcf6ec986182 merc_spawn(function_7a2aaa4a09a4d250(var_ee3ea8d303c9025c));
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f29
// Size: 0x48
function function_47e9b34b3e46619() {
    var_b86bcfae24242151 = getstruct("enrichment_machine", "targetname");
    self.var_5123e9bb49af57bf = spawn_model("jup_zm_enrichment_device", var_b86bcfae24242151.origin, var_b86bcfae24242151.angles);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f78
// Size: 0x211
function merc_stronghold() {
    function_312c0192743dc215(getstruct("enrichment_device", "targetname"));
    var_fdbc62a2eb9677f = getstructarray("merc_stronghold", "targetname");
    var_ee3ea8d303c9025c = [0:"jup_ob_enemy_basic_grunt_short", 1:"jup_ob_enemy_basic_grunt_long", 2:"jup_ob_enemy_basic_soldier_short", 3:"jup_ob_enemy_basic_soldier_long"];
    self.var_690609742a2905ca = [];
    foreach (var_a78bcf6ec986182 in var_fdbc62a2eb9677f) {
        if (isdefined(var_a78bcf6ec986182.script_noteworthy) && var_a78bcf6ec986182.script_noteworthy == "sniper") {
            var_31109020393ed11b = "jup_ob_enemy_specialist_sniper";
        } else {
            var_31109020393ed11b = function_7a2aaa4a09a4d250(var_ee3ea8d303c9025c);
        }
        var_434d2faf62ed069 = var_a78bcf6ec986182 merc_spawn(var_31109020393ed11b);
        if (isdefined(var_434d2faf62ed069)) {
            if (var_434d2faf62ed069.agent_type == "actor_jup_ob_enemy_specialist_sniper") {
                var_434d2faf62ed069 thread function_9081e87a119b8461(var_a78bcf6ec986182.origin);
                var_434d2faf62ed069 thread function_da159dba71d973c2(2000);
                var_434d2faf62ed069 thread function_e5e953525a087911(self);
            } else if (isdefined(var_a78bcf6ec986182.script_noteworthy) && var_a78bcf6ec986182.script_noteworthy == "enrichment_guard") {
                var_434d2faf62ed069 thread function_9081e87a119b8461(var_a78bcf6ec986182.origin);
                var_434d2faf62ed069 thread function_517d8a84dba86a25(self);
                var_434d2faf62ed069 thread function_b864a4bcc824dd72(self);
            }
            var_434d2faf62ed069 thread function_d9f63cad62a5df8e(self);
            self.var_690609742a2905ca[self.var_690609742a2905ca.size] = var_434d2faf62ed069;
        }
    }
    self.var_3367ed0e23330295 = self.var_690609742a2905ca.size;
    self.var_5be1f3a546b3c772 = int(self.var_3367ed0e23330295 * 0.66);
    self.var_be02557153721f54 = int(self.var_3367ed0e23330295 * 0.33);
    self.n_kills = 0;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7190
// Size: 0xa8
function function_d9f63cad62a5df8e(s_quest) {
    self waittill("death");
    if (isdefined(s_quest.var_690609742a2905ca) && s_quest.var_690609742a2905ca.size) {
        s_quest.n_kills++;
        if (s_quest.n_kills == s_quest.var_be02557153721f54) {
            level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_first_stronghold", level.players, 0, 0);
        } else if (s_quest.n_kills == s_quest.var_5be1f3a546b3c772) {
            level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_second_stronghold", level.players, 0, 0);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x723f
// Size: 0x33
function function_b864a4bcc824dd72(s_quest) {
    self endon("death");
    self endon("combat");
    waittill_any_2("damage", "grenade danger");
    self notify("combat");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7279
// Size: 0x2a
function function_517d8a84dba86a25(s_quest) {
    self endon("death");
    self endon("combat");
    s_quest waittill("device_found");
    self notify("combat");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72aa
// Size: 0x2f
function function_e5e953525a087911(s_quest) {
    self endon("death");
    self endon("combat");
    s_quest flag_wait("charge_planted");
    self notify("combat");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e0
// Size: 0xa4
function function_de6ae73d98f28ba3() {
    self.s_interact = getstruct("explosive_charge", "targetname");
    waitframe();
    self.var_a1c862599a060055 = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.s_interact.origin, 64, &function_f8c746d5482f6937, "JUP_OB_OBJECTIVES/Q0_PLANT_CHARGE");
    wait(0.1);
    self.var_a1c862599a060055 setcursorhint("HINT_BUTTON");
    self.var_a1c862599a060055 sethinticon("hud_icon_c4_plant");
    self.var_a1c862599a060055 waittill("charge_planted");
    self.var_a1c862599a060055 delete();
    flag_set("charge_planted");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x738b
// Size: 0x257
function function_ecaaf38e23ec16b5(device, player) {
    level endon("game_ended");
    device.scenenode = getstruct("c4_scene_node", "targetname");
    actorplayer = anim_scene_create_actor(player, "player_rig_sm", 1);
    c4 = spawn_model("offhand_2h_c4_prop_ob", actorplayer.entity gettagorigin("tag_accessory_right"));
    c4 hide();
    c4.angles = actorplayer.entity gettagangles("tag_accessory_right");
    c4 dontinterpolate();
    c4 linkto(actorplayer.entity, "tag_accessory_right");
    level thread function_dabfdf04f879bc4f(c4);
    c4 thread function_e9508a0db7cc3e83();
    var_db3b2bd857f61ae6 = device.scenenode anim_scene([0:actorplayer], "samsite_plant_f");
    c4 unlink();
    actorplayer = undefined;
    var_2ce69f8431572669 = undefined;
    level thread function_d0b233de2e4f5720();
    c4 setscriptablepartstate("effects", "danger");
    if (isdefined(level.var_3f4534fb14cca909)) {
        var_d451d5dcb3dd5dc9 = [[ level.var_3f4534fb14cca909 ]](c4, device, player);
        if (!istrue(var_d451d5dcb3dd5dc9)) {
            c4 hide();
            return;
        }
    }
    playfx(getfx("enrichment_explosion"), self.var_5123e9bb49af57bf.origin, anglestoforward(self.var_5123e9bb49af57bf.angles), anglestoup(self.var_5123e9bb49af57bf.angles));
    earthquake(0.6, 0.7, self.var_5123e9bb49af57bf.origin, 800);
    playrumbleonposition("grenade_rumble", self.var_5123e9bb49af57bf.origin);
    playsoundatpos(self.var_5123e9bb49af57bf.origin, "c4_expl_trans");
    radiusdamage(self.var_5123e9bb49af57bf.origin, 256, 500, 50, self.var_5123e9bb49af57bf, "MOD_EXPLOSIVE", undefined, 0, 0);
    waitframe();
    self.var_5123e9bb49af57bf delete();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e9
// Size: 0x181
function function_151037a96443f076(c4, samsite, player) {
    samsite endon("samsite_cancel_bomb_countdown");
    currenttime = gettime();
    totaltime = 15000;
    var_f28399727742eb23 = int(currenttime + totaltime);
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    while (var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 < 1500) {
            if (var_c301d652d9a73075 <= 250) {
                if (soundexists("breach_warning_beep_05")) {
                    c4 playsound("breach_warning_beep_05");
                }
            } else if (var_c301d652d9a73075 < 500) {
                if (soundexists("breach_warning_beep_04")) {
                    c4 playsound("breach_warning_beep_04");
                }
            } else if (var_c301d652d9a73075 < 1500) {
                if (soundexists("breach_warning_beep_03")) {
                    c4 playsound("breach_warning_beep_03");
                }
            } else if (soundexists("breach_warning_beep_02")) {
                c4 playsound("breach_warning_beep_02");
            }
            wait(0.25);
        } else if (var_c301d652d9a73075 < 3500) {
            if (soundexists("breach_warning_beep_02")) {
                c4 playsound("breach_warning_beep_02");
            }
            wait(0.5);
        } else {
            if (soundexists("breach_warning_beep_01")) {
                c4 playsound("breach_warning_beep_01");
            }
            wait(1);
        }
        if (var_c301d652d9a73075 < 0) {
            break;
        }
    }
    samsite notify("samsite_bomb_detonated");
    level.var_98539610199d2422 thread function_f7508e8886ce452b(c4);
    return 1;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7772
// Size: 0x1f
function function_e9508a0db7cc3e83() {
    wait(1);
    if (soundexists("weap_samsite_plant_c4")) {
        self playsound("weap_samsite_plant_c4");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7798
// Size: 0x1d
function function_dabfdf04f879bc4f(c4) {
    c4 endon("death");
    wait(1);
    c4 show();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77bc
// Size: 0x13e
function function_c25a40ae517ef340() {
    level.scr_animtree["player_rig_sm"] = %script_model;
    level.scr_anim["player_rig_sm"]["samsite_plant_l"] = script_model%iw9_sam_breach_charge_left;
    level.scr_eventanim["player_rig_sm"]["samsite_plant_l"] = %"iw9_sam_breach_charge_left";
    level.scr_anim["player_rig_sm"]["samsite_plant_r"] = script_model%iw9_sam_breach_charge_right;
    level.scr_eventanim["player_rig_sm"]["samsite_plant_r"] = %"iw9_sam_breach_charge_right";
    level.scr_anim["player_rig_sm"]["samsite_plant_f"] = script_model%iw9_cp_sam_breach_charge_front;
    level.scr_eventanim["player_rig_sm"]["samsite_plant_f"] = %"hash_7e94c3dd66a3eca0";
    level.scr_animtree["c4_prop"] = %script_model;
    level.scr_anim["c4_prop"]["samsite_plant_l"] = script_model%iw9_cp_sam_breach_charge_left_c4;
    level.scr_anim["c4_prop"]["samsite_plant_r"] = script_model%iw9_cp_sam_breach_charge_right_c4;
    level.scr_anim["c4_prop"]["samsite_plant_f"] = script_model%iw9_cp_sam_breach_charge_front_c4;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7901
// Size: 0x1f
function function_f7508e8886ce452b(var_9a9028525e0e01d) {
    flag_set("charge_exploded");
    var_9a9028525e0e01d delete();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7927
// Size: 0x34
function function_f8c746d5482f6937(player) {
    player callback::callback("clear_stronghold_zakhaev");
    level.var_98539610199d2422 thread function_ecaaf38e23ec16b5(self, player);
    self notify("charge_planted");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7962
// Size: 0x38e
function function_ea9c9fa94fbf39f1() {
    self.var_ef1bc48fde3da78 = getclosest(self.origin, level.var_4c272da3f0a1a024);
    self.var_e4558c4bf7159860 = getclosest(self.origin, level.var_a9e3bda690cc504c);
    function_312c0192743dc215(self);
    if (function_51d76700600cebe3(30) && level.var_eee94908df4c2824 < 2) {
        n_spawns = function_dceb0638996decee("mimic");
        var_31109020393ed11b = "jup_spawner_zombie_mimic";
        level.var_eee94908df4c2824++;
        self.var_2be52f64c1fda163 = 1;
    } else {
        n_spawns = function_ab65e0d9a8828ab2("container");
    }
    self.v_forward = vectornormalize(anglestoforward(self.angles));
    self.v_right = vectornormalize(anglestoright(self.angles));
    self.v_left = vectornormalize(anglestoright(self.angles) * -1);
    var_31c7c79d67de5b32 = 20;
    var_595c4a700ef4f046 = 20;
    self.a_ai_zombies = [];
    for (i = 0; i < n_spawns; i++) {
        if (!isdefined(self.var_2be52f64c1fda163)) {
            var_31109020393ed11b = "jup_spawner_zombie_base";
        }
        ai_zombie = namespace_2b1145f62aa835b8::spawnnewaitype_sharedfunc(var_31109020393ed11b, self.origin, self.angles + (0, 90, 0), "team_two_hundred", "difficulty_yellow");
        if (isdefined(ai_zombie)) {
            ai_zombie thread namespace_f721fc7d0d2d0f47::function_4a4fab5fd0b06d7b("difficulty_normal");
            self.a_ai_zombies[self.a_ai_zombies.size] = ai_zombie;
            if (i == 0) {
                v_pos = self.origin + self.v_forward * var_31c7c79d67de5b32;
            } else if (i == 1) {
                v_pos = self.origin + self.v_forward * var_31c7c79d67de5b32 * -1;
            } else if (i < 7) {
                if (mod(i, 2)) {
                    v_pos = self.origin + self.v_forward * var_31c7c79d67de5b32 + self.v_right * var_595c4a700ef4f046 * (i - 1);
                } else {
                    v_pos = self.origin + self.v_forward * var_31c7c79d67de5b32 * -1 + self.v_right * var_595c4a700ef4f046 * (i - 1);
                }
            } else if (mod(i, 2)) {
                v_pos = self.origin + self.v_forward * var_31c7c79d67de5b32 + self.v_left * var_595c4a700ef4f046 * (i - 6);
            } else {
                v_pos = self.origin + self.v_forward * var_31c7c79d67de5b32 * -1 + self.v_left * var_595c4a700ef4f046 * (i - 6);
            }
        }
    }
    self.var_fb0b130aadea0e12 setscriptablepartstate("audio", "warning");
    wait(0.2);
    thread function_9d280317afc39370();
    wait(0.6);
    self.var_fb0b130aadea0e12 setscriptablepartstate("state", "activate");
    if (!isdefined(level.var_4c070f191f0dac1e)) {
        level.var_4c070f191f0dac1e = 1;
        level thread function_4c070f191f0dac1e();
    }
    self.var_ef1bc48fde3da78 connectpaths();
    self.var_e4558c4bf7159860 solid();
    self.var_e4558c4bf7159860 disconnectpaths();
    level.var_98539610199d2422 notify("mus_zombiepen_open");
    self.var_ef1bc48fde3da78 delete();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cf7
// Size: 0x72
function function_9d280317afc39370() {
    foreach (ai_zombie in self.a_ai_zombies) {
        if (isalive(ai_zombie)) {
            ai_zombie.ignoreall = 0;
            ai_zombie thread function_87cc2a188277bd3b(2000);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d70
// Size: 0x6e
function function_dceb0638996decee(str_type) {
    switch (level.players.size) {
    case 1:
    case 2:
        if (str_type == "mimic") {
            n_spawns = 1;
        }
        break;
    default:
        if (str_type == "mimic") {
            n_spawns = 2;
        }
        break;
    }
    return n_spawns;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7de6
// Size: 0x168
function function_ab65e0d9a8828ab2(str_type) {
    switch (level.players.size) {
    case 1:
        if (str_type == "container") {
            n_spawns = 9;
        } else if (str_type == "neutralizer") {
            n_spawns = 8;
        } else if (str_type == "horde") {
            n_spawns = 14;
        } else if (str_type == "ground") {
            n_spawns = 4;
        }
        break;
    case 2:
        if (str_type == "container") {
            n_spawns = 13;
        } else if (str_type == "neutralizer") {
            n_spawns = 12;
        } else if (str_type == "horde") {
            n_spawns = 16;
        } else if (str_type == "ground") {
            n_spawns = 5;
        }
        break;
    case 3:
        if (str_type == "container") {
            n_spawns = 16;
        } else if (str_type == "neutralizer") {
            n_spawns = 18;
        } else if (str_type == "horde") {
            n_spawns = 21;
        } else if (str_type == "ground") {
            n_spawns = 6;
        }
        break;
    default:
        if (str_type == "container") {
            n_spawns = 16;
        } else if (str_type == "neutralizer") {
            n_spawns = 20;
        } else if (str_type == "horde") {
            n_spawns = 27;
        } else if (str_type == "ground") {
            n_spawns = 8;
        }
        break;
    }
    return n_spawns;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f56
// Size: 0x7e
function function_ee63d6fa5d4d6e87() {
    switch (level.players.size) {
    case 1:
        n_spawns = 4;
        break;
    case 2:
        n_spawns = 5;
        break;
    case 3:
        n_spawns = 7;
        break;
    case 4:
        n_spawns = 9;
        break;
    default:
        n_spawns = 10;
        break;
    }
    return n_spawns;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fdc
// Size: 0x78
function function_391d1a22ef94feab() {
    flag_wait("charge_planted");
    var_7be0d181e782868e = getstructarray("s_ambient", "targetname");
    foreach (s_ambient in var_7be0d181e782868e) {
        s_ambient thread function_602096dbb1212f80();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x805b
// Size: 0x1cf
function function_602096dbb1212f80() {
    a_s_locs = getstructarray(self.target, "targetname");
    n_zombies = randomintrange(int(function_ab65e0d9a8828ab2("container") * 0.75), int(function_ab65e0d9a8828ab2("container") * 1.5));
    var_5001eff44332b8d8 = randomintrange(int(function_ee63d6fa5d4d6e87() * 0.75), int(function_ee63d6fa5d4d6e87() * 1.5));
    function_312c0192743dc215(self);
    foreach (s_loc in a_s_locs) {
        if (s_loc.script_noteworthy == "zombie") {
            a_ai_zombies = function_7ea5453572655fab(s_loc, n_zombies, 0, 1);
            foreach (ai_zombie in a_ai_zombies) {
                ai_zombie thread function_da159dba71d973c2(2000);
            }
        } else {
            var_c41ff3df2633113b = level.var_98539610199d2422 function_5e715be63f9f20de(s_loc, var_5001eff44332b8d8);
            foreach (var_a900fbd079a2fd56 in var_c41ff3df2633113b) {
                var_a900fbd079a2fd56 thread function_da159dba71d973c2(2000);
            }
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8231
// Size: 0xd7
function merc_facility_exit() {
    var_a78bcf6ec986182 = getstruct("merc_facility_exit", "targetname");
    s_door = getstruct("facility_exit", "script_noteworthy");
    a_doors = [];
    a_doors = namespace_f6368c72597c6d90::function_ad1b6accbaab404e(s_door, a_doors, "fortress", 1);
    foreach (door in a_doors) {
        door.var_707cd84a8924ef55 = undefined;
        namespace_f6368c72597c6d90::function_b092780f9ec4496e(door);
    }
    var_434d2faf62ed069 = var_a78bcf6ec986182 merc_spawn("jup_ob_enemy_specialist_heavytactician");
    if (isdefined(var_434d2faf62ed069)) {
        var_434d2faf62ed069 thread function_87cc2a188277bd3b(2000);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x830f
// Size: 0x15d
function function_c40217c3d33491b2() {
    thread function_d363528f975069cd("sentry_mine_facility");
    function_312c0192743dc215(self.var_33ff83242dcaad2b);
    var_fdbc62a2eb9677f = getstructarray("merc_exterior", "targetname");
    var_c6e42f4c295786d2 = getstructarray("zombie_exterior", "targetname");
    foreach (var_6a6b8244a086b1c9 in var_c6e42f4c295786d2) {
        a_ai_zombies = function_7ea5453572655fab(var_6a6b8244a086b1c9, 10, 0, 1);
    }
    foreach (var_a78bcf6ec986182 in var_fdbc62a2eb9677f) {
        var_c41ff3df2633113b = function_5e715be63f9f20de(var_a78bcf6ec986182, 4);
        foreach (var_a900fbd079a2fd56 in var_c41ff3df2633113b) {
            var_a900fbd079a2fd56 thread function_75555ebca72dc039();
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8473
// Size: 0x9b
function function_de7c83bd54fe6c54() {
    var_c6e42f4c295786d2 = getstructarray("zombie_exterior_reinforce", "targetname");
    function_a5b76e0f5024cc9a(self.var_33ff83242dcaad2b, "zombie_reinforce", 10000);
    foreach (var_6a6b8244a086b1c9 in var_c6e42f4c295786d2) {
        a_ai_zombies = function_7ea5453572655fab(var_6a6b8244a086b1c9, 10, 0, 1);
        var_6a6b8244a086b1c9 thread function_fd1639378ffccd1f();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8515
// Size: 0x57
function function_fd1639378ffccd1f() {
    v_org = getclosestpointonnavmesh(self.origin);
    var_fb98743d75ac80a0 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_spawner_zombie_mangler", v_org, (0, 225, 0), "team_two_hundred");
    if (isdefined(var_fb98743d75ac80a0)) {
        var_fb98743d75ac80a0 namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8573
// Size: 0xca
function function_76ab8d60113c9c8f() {
    while (1) {
        var_da3a55eabb666c32 = getaiarray("team_hundred_ninety");
        if (isdefined(var_da3a55eabb666c32) && var_da3a55eabb666c32.size) {
            break;
        }
        wait(0.1);
    }
    var_f75ab33b14599ef5 = getstructarray("sentry_mine_river", "targetname");
    foreach (var_46a34af7197a5a98 in var_f75ab33b14599ef5) {
        if (isdefined(var_da3a55eabb666c32[0])) {
            mine = namespace_64135de19550f047::function_908ec13fb4d6cede(var_46a34af7197a5a98.origin, undefined, var_da3a55eabb666c32[0]);
            if (isdefined(mine)) {
                mine thread function_b11dc3c5df6aa7c7(self);
            }
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8644
// Size: 0x38
function function_b11dc3c5df6aa7c7(s_quest) {
    self endon("death");
    s_quest flag_wait("zombies_cleared");
    wait(randomfloatrange(0.5, 1));
    self notify("detonateExplosive");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8683
// Size: 0x1e
function function_75555ebca72dc039() {
    self endon("death");
    thread namespace_2000a83505151e5b::function_b11c1964f528574b(self, 1, self.origin);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x86a8
// Size: 0x93
function function_b38f0b92e2bc5fdb(attractor, zombie) {
    if (!isdefined(zombie.var_d0bf92fd0dbeaeaf)) {
        return 0;
    }
    if (isdefined(zombie.var_7ed69b80f3271e5b) && attractor != zombie.var_7ed69b80f3271e5b) {
        return 0;
    }
    if (isdefined(zombie.var_7ed69b80f3271e5b) && distance2dsquared(zombie.origin, zombie.var_7ed69b80f3271e5b.source.origin) <= 1000000) {
        return 0;
    }
    return 1;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8743
// Size: 0x7a
function function_fc5245e119c3f4e5() {
    function_312c0192743dc215(self.var_a6cd1b1206e83312);
    foreach (var_434d2faf62ed069 in self.var_49395449fb8335d7) {
        var_434d2faf62ed069 thread function_125fba683fe2c7db(self);
    }
    function_c7d2e6ec814c4d5c(self.var_49395449fb8335d7);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c4
// Size: 0x90
function function_385b258887a1f451() {
    flag_wait("approach_neutralizer");
    wait(2);
    level thread function_4a90f330cfe1aca4();
    spawndata = spawnstruct();
    spawndata.angles = self.var_a6cd1b1206e83312.angles;
    spawndata.team = "allies";
    spawndata.origin = self.var_a6cd1b1206e83312.origin;
    spawndata.var_22aa4aa0cf0aa6bb = 1;
    function_66c684fea143fbfd(spawndata);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x885b
// Size: 0x1ec
function function_66c684fea143fbfd(spawndata) {
    scenenode = spawn("script_model", spawndata.origin);
    scenenode.angles = spawndata.angles;
    scenenode setmodel("tag_origin");
    parachute = spawn("script_model", spawndata.origin);
    parachute.angles = spawndata.angles;
    parachute.animname = "parachute";
    parachute setmodel("veh8_mil_lnd_bromeo_parachute_green");
    parachute namespace_bc4a4b9456315863::setanimtree();
    parachute hide();
    carrier = spawn("script_model", spawndata.origin);
    carrier.angles = spawndata.angles;
    carrier.animname = "ac130";
    carrier setmodel("veh9_mil_air_cargo_plane_wm");
    carrier namespace_bc4a4b9456315863::setanimtree();
    carrier hide();
    level.var_98539610199d2422.var_4ec719f9f007acbc = spawn_model("jup_zm_act_3_neutralizer_fxanim", spawndata.origin, spawndata.angles);
    level.var_98539610199d2422.var_4ec719f9f007acbc linkto(parachute);
    level.var_98539610199d2422.var_4ec719f9f007acbc hide();
    scenenode.vehicle = level.var_98539610199d2422.var_4ec719f9f007acbc;
    scenenode.parachute = parachute;
    scenenode.carrier = carrier;
    scenenode.starttime = gettime() + level.frameduration;
    scenenode.endtime = gettime();
    scenenode thread function_c4f85850fb179639(spawndata);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a4e
// Size: 0x13b
function private function_c4f85850fb179639(spawndata) {
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.parachute, "veh_jup_ob_tank_escort_drop");
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.carrier, "veh_jup_ob_tank_escort_drop");
    waitframe();
    if (isdefined(self.vehicle)) {
        self.vehicle show();
    }
    if (isdefined(self.parachute)) {
        self.parachute show();
        thread namespace_bc4a4b9456315863::anim_single_solo(self.parachute, "veh_jup_ob_tank_escort_drop");
    }
    if (isdefined(self.carrier)) {
        self.carrier show();
        self.carrier playloopsound("iw8_bradley_drop_c130");
        thread namespace_bc4a4b9456315863::anim_single_solo(self.carrier, "veh_jup_ob_tank_escort_drop");
    }
    wait(getanimlength(level.scr_anim["parachute"]["veh_jup_ob_tank_escort_drop"]) - 2.8);
    function_b708213b1c5dc2a8(self.vehicle);
    if (isdefined(self.parachute)) {
        self.parachute delete();
    }
    if (isdefined(self.carrier)) {
        self.carrier delete();
    }
    self delete();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b90
// Size: 0x3f
function private function_b708213b1c5dc2a8(var_d41b7d5f40f6a360, spawndata) {
    self.vehicle = undefined;
    if (!isdefined(var_d41b7d5f40f6a360)) {
        return;
    }
    level.var_98539610199d2422.var_4ec719f9f007acbc thread function_f694f53c094603a();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8bd6
// Size: 0x35
function private function_f694f53c094603a() {
    self endon("death");
    self notify("freefall");
    playsoundatpos(self.origin, "iw9_drop_chute_release_whoosh");
    self unlink();
    waitframe();
    function_1fd2dce85778a06a();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c12
// Size: 0xd8
function private function_1fd2dce85778a06a() {
    self rotateto(level.var_98539610199d2422.var_a6cd1b1206e83312.angles, 0.2);
    self moveto(level.var_98539610199d2422.var_a6cd1b1206e83312.origin, 0.2);
    self waittill("movedone");
    playsoundatpos(self.origin, "iw9_tank_land");
    earthquake(0.4, 0.8, self.origin, 1200);
    playrumbleonposition("artillery_rumble", self.origin);
    physicsexplosionsphere(self.origin, 800, 400, 0.5);
    waitframe();
    level.var_98539610199d2422 flag_set("neutralizer_dropped");
    self delete();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf1
// Size: 0xc0
function merc_chopper_neutralizer() {
    self.var_49395449fb8335d7 = [];
    var_447e08a8adea1db3 = getstructarray("merc_chopper_neutralizer", "targetname");
    function_a5b76e0f5024cc9a(self.var_a6cd1b1206e83312, "neutralizer_reached", 8000);
    level thread function_601c9eb68a44a33();
    foreach (var_ba23c084d956aad6 in var_447e08a8adea1db3) {
        var_582d83559bcdf09b = function_804aa1cbd49ba400("veh_jup_blima_anim_infil", var_ba23c084d956aad6, 1);
        if (isdefined(var_582d83559bcdf09b)) {
            var_582d83559bcdf09b thread function_467714861e4130a5(var_ba23c084d956aad6);
            var_582d83559bcdf09b thread function_85c71338d7d317a9(self);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db8
// Size: 0x94
function function_85c71338d7d317a9(s_quest) {
    self endon("death");
    self waittill("unloaded_mercs");
    foreach (var_434d2faf62ed069 in self.var_da3a55eabb666c32) {
        if (isalive(var_434d2faf62ed069)) {
            s_quest.var_49395449fb8335d7[s_quest.var_49395449fb8335d7.size] = var_434d2faf62ed069;
            var_434d2faf62ed069 thread function_ef47d41add506150();
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e53
// Size: 0x78
function function_ef47d41add506150() {
    self endon("death");
    level flag_wait("chopper_crash");
    wait(randomfloatrange(1, 2));
    var_8f552b849231fff0 = getstructarray("s_ambient", "targetname");
    s_goal = getclosest(self.origin, var_8f552b849231fff0);
    function_f58e9823d9626edf(s_goal.origin, 100);
    self kill();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ed2
// Size: 0x49
function function_9a8bf9fe77ccef72(s_quest) {
    self endon("death");
    v_goal = getrandomnavpoint(s_quest.var_a6cd1b1206e83312.origin, 1000);
    if (isdefined(v_goal)) {
        thread function_9081e87a119b8461(v_goal);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f22
// Size: 0x103
function function_98c2f84917ad6342() {
    self endon("death");
    self.var_e1f4682a6a54b921 = "left";
    a_e_targets = sortbydistance(level.players, self.origin);
    n_timeout = 0;
    if (isdefined(a_e_targets) && a_e_targets.size) {
        n_index = int(mod(a_e_targets.size - 1, 2));
        e_target = a_e_targets[n_index];
        if (isdefined(e_target)) {
            self setlookatent(e_target);
            while (1) {
                if (function_3b142e491735475(e_target) || !isalive(e_target) || n_timeout > 100) {
                    break;
                }
                n_timeout++;
                wait(0.1);
            }
            var_f006e22388424ec7 = 2;
            for (i = 0; i < var_f006e22388424ec7; i++) {
                function_50446d8d9c77ea2e(e_target);
                wait(randomfloatrange(0.5, 0.8));
            }
            self clearlookatent();
        }
    }
    wait(1.5);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x902c
// Size: 0x9b
function function_6ddbbcc69eb0e369() {
    self.var_1e935517ae0435cb = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_11d2e045f1efdf0f.origin, 64, &function_9aed6bedca2e5b3, "JUP_OB_OBJECTIVES/QUEST_0_ACT3_NEUTRALIZER_ACTIVATE");
    self.var_1e935517ae0435cb waittill("neutralizer_activated");
    self.var_1e935517ae0435cb delete();
    self.var_94a0d29675a6cdf4 = spawn_model("tag_origin", self.var_11d2e045f1efdf0f.origin);
    flag_set("neutralizer_on");
    self notify("neutralizer_on");
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90ce
// Size: 0x20
function function_9aed6bedca2e5b3(player) {
    player playrumbleonentity("damage_light");
    self notify("neutralizer_activated");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90f5
// Size: 0x2e4
function function_d58e9fe01994f55() {
    var_ba23c084d956aad6 = getstruct("chopper_ava", "targetname");
    spawndata = spawnstruct();
    spawndata.origin = var_ba23c084d956aad6.origin;
    spawndata.angles = var_ba23c084d956aad6.angles;
    spawndata.var_22aa4aa0cf0aa6bb = 1;
    function_a5b76e0f5024cc9a(self.var_a6cd1b1206e83312, "neutralizer_reached", 6800);
    vh_chopper = undefined;
    while (!isdefined(vh_chopper)) {
        vh_chopper = vehicle::vehicle_spawn("veh9_palfa", spawndata);
        waitframe();
    }
    vh_chopper vehicle_setspeed(60, 10, 8);
    vh_chopper vehicle_damage::vehicle_damage_setcandamage(0);
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(vh_chopper);
    vh_chopper namespace_9f6a961447bab709::function_a609274d97743733();
    level.var_8b573403a20a7229 = namespace_34f6a6adabfc542d::spawnnewagentaitype("jup_ob_ally_ava_base", vh_chopper.origin, vh_chopper.angles, level.players[0].team);
    level.ravenov = namespace_34f6a6adabfc542d::spawnnewagentaitype("jup_ob_ally_ravenov_base", vh_chopper.origin, vh_chopper.angles, level.players[0].team);
    vh_chopper thread function_f63c838ca2ec948c();
    s_goal = getstruct(var_ba23c084d956aad6.target, "targetname");
    while (1) {
        if (isdefined(s_goal.script_noteworthy)) {
            vh_chopper vehicle_setspeed(20, 10, 8);
            vh_chopper setvehgoalpos(s_goal.origin, 1);
            if (s_goal.script_noteworthy == "unload") {
                vh_chopper setgoalyaw(flat_angle(s_goal.angles)[1]);
            }
        } else {
            vh_chopper setvehgoalpos(s_goal.origin, 0);
        }
        vh_chopper waittill("goal");
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "unload") {
                vh_chopper sethoverparams(0);
                vh_chopper vehicle_setspeedimmediate(0);
                wait(2);
                vh_chopper notify("unload");
                wait(8);
                vh_chopper vehicle_setspeed(60, 10, 8);
            }
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            break;
        }
    }
    if (isdefined(self.var_b23e608ef55db7fa)) {
        foreach (pilot in self.var_b23e608ef55db7fa) {
            pilot delete();
        }
    }
    vh_chopper namespace_5a0f3ca265d3a4c8::function_d0df49de517ded03();
    vh_chopper namespace_1f188a13f7e79610::vehicle_explode();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93e0
// Size: 0x56
function function_b1aa1fb6109a052b() {
    level.var_48c43821515d2330 = 0;
    if (isdefined(level.players) && level.players.size == 1) {
        level.players[0].var_ac45ef94bf07d7d0 = 1;
        level.players[0] thread player_revive_monitor();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x943d
// Size: 0x9f
function player_revive_monitor() {
    self endon("death");
    self endon("revive_used");
    while (1) {
        if (namespace_7e17181d03156026::isinlaststand(self) && !isdefined(self.var_a1624ae8e40315d) && isdefined(self.var_dddc97480e104865) && !self.var_dddc97480e104865 && isdefined(level.a_ai_allies)) {
            self.var_a1624ae8e40315d = getclosest(self.origin, level.a_ai_allies);
            if (isdefined(self.var_a1624ae8e40315d)) {
                self.var_a1624ae8e40315d function_2f10cefc09778367(self);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94e3
// Size: 0xab
function function_2f10cefc09778367(player) {
    self notify("reviving");
    while (1) {
        if (isdefined(player) && distance2dsquared(player.origin, self.origin) > 4096) {
            namespace_2000a83505151e5b::function_304da84d9a815c01(player.origin, 50, 1);
        } else {
            break;
        }
        wait(1);
    }
    if (namespace_7e17181d03156026::isinlaststand(player)) {
        player namespace_f585f5e438cbdbc8::function_70abe785d3a8636d(self);
    }
    level.var_48c43821515d2330++;
    if (level.var_48c43821515d2330 > 2) {
        player.var_a1624ae8e40315d = undefined;
        player.var_ac45ef94bf07d7d0 = undefined;
        player notify("revive_used");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9595
// Size: 0xff
function function_f63c838ca2ec948c() {
    var_a6cd1b1206e83312 = getstruct("neutralizer", "targetname");
    thread namespace_32d725839544d40a::play(level.var_8b573403a20a7229, "ava_infil_exit_idle", "jup_cin_zm_vig_s0_act3_quest_ava_infil_exit");
    thread namespace_32d725839544d40a::play(level.ravenov, "ravenov_infil_exit_idle", "jup_cin_zm_vig_s0_act3_quest_ava_infil_exit");
    self waittill("unload");
    level.var_8b573403a20a7229 thread function_a96ad3789e72a939(self, "ava_infil_exit_f");
    level.ravenov thread function_a96ad3789e72a939(self, "ravenov_infil_exit_f");
    level.a_ai_allies = [];
    if (isdefined(level.var_8b573403a20a7229)) {
        level.a_ai_allies[level.a_ai_allies.size] = level.var_8b573403a20a7229;
    }
    if (isdefined(level.ravenov)) {
        level.a_ai_allies[level.a_ai_allies.size] = level.ravenov;
    }
    level.var_98539610199d2422 flag_set("ava_arrived");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x969b
// Size: 0x6c
function function_a96ad3789e72a939(vh_chopper, str_anim) {
    vh_chopper namespace_32d725839544d40a::play(self, str_anim, "jup_cin_zm_vig_s0_act3_quest_ava_infil_exit");
    thread function_f58e9823d9626edf(level.var_98539610199d2422.var_11d2e045f1efdf0f.origin + (randomintrange(-300, 300), randomintrange(-300, 300), 0), 300);
    thread function_f6991c09ecd5b798();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970e
// Size: 0x97
function function_f6991c09ecd5b798() {
    function_7f18d1a95e354b02();
    namespace_6205bc7c5e394598::magic_bullet_shield();
    self.var_9f009877c3bea958 = 1;
    self.var_69b049cf4b18c73b = 1;
    self setscriptablepartstate("minimap", "active");
    if (!threatbiasgroupexists("ally_ai")) {
        createthreatbiasgroup("ally_ai");
    }
    self setthreatbiasgroup("ally_ai");
    self function_65cdab0fc78aba8f(self.origin, 3000);
    thread function_9081e87a119b8461(level.var_98539610199d2422.var_11d2e045f1efdf0f.origin, 800);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97ac
// Size: 0x30
function function_7f18d1a95e354b02() {
    if (isdefined(level.players[0])) {
        self.team = level.players[0].team;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97e3
// Size: 0xbe
function function_1a18a6d6a5cee94d() {
    var_ba23c084d956aad6 = getstruct("chopper_victim", "targetname");
    s_goal = getstruct(var_ba23c084d956aad6.target, "targetname");
    flag_wait("neutralizer_on");
    wait(7);
    flag_set("chopper_obj");
    self.var_43a004d463dee018 = function_804aa1cbd49ba400("veh_jup_hind", var_ba23c084d956aad6, 0);
    if (isdefined(self.var_43a004d463dee018)) {
        self.var_43a004d463dee018 thread function_2049da5e77063ab();
        self.var_43a004d463dee018 function_1080daa8e7a43c1d(s_goal);
    } else {
        wait(10);
        flag_set("deathworm_spawn");
        level flag_set("dw_approach");
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98a8
// Size: 0x1f
function function_2049da5e77063ab() {
    level endon("dw_approach");
    self waittill("death");
    level flag_set("dw_approach");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98ce
// Size: 0x214
function function_1080daa8e7a43c1d(s_goal) {
    self endon("death");
    self vehicle_setspeed(80, 40, 30);
    while (1) {
        if (isdefined(self.var_be23774716c337f3)) {
            if (!isdefined(self.var_a37a05e7b9193bd4)) {
                self.var_a37a05e7b9193bd4 = 1;
            } else {
                self setvehgoalpos(s_goal.origin, 0);
            }
        } else if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "fire") {
                self setvehgoalpos(s_goal.origin, 0);
            } else if (s_goal.script_noteworthy == "hover") {
                level flag_set("dw_approach");
                thread function_fa3a82932733eb0a();
                self setmaxpitchroll(45, 60);
                self setlookatent(level.var_98539610199d2422.var_94a0d29675a6cdf4);
                self setvehgoalpos(s_goal.origin, 1);
            } else {
                self setvehgoalpos(s_goal.origin, 1);
            }
        } else {
            self setvehgoalpos(s_goal.origin, 0);
        }
        if (isdefined(self.var_be23774716c337f3)) {
            wait(2);
        } else {
            self waittill("goal");
        }
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "fire") {
                thread function_98c2f84917ad6342();
                self vehicle_setspeed(60, 40, 30);
            } else if (s_goal.script_noteworthy == "hover") {
                flag_set("deathworm_spawn");
                self setvehgoalpos(self.origin + (0, 0, 350), 1);
                level flag_wait("chopper_crash");
                thread function_eec0f7ff1ab97935(s_goal, 160);
                self.var_be23774716c337f3 = 1;
            }
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            break;
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ae9
// Size: 0xcd
function function_fa3a82932733eb0a() {
    self endon("death");
    var_50f71b2b6716d3a6 = getstruct("chopper_target_1", "targetname");
    var_50f71a2b6716d173 = getstruct("chopper_target_2", "targetname");
    var_8be33d6c4c340688 = spawn_model("tag_origin", var_50f71b2b6716d3a6.origin);
    var_8be3406c4c340d21 = spawn_model("tag_origin", var_50f71a2b6716d173.origin);
    if (isdefined(level.var_98539610199d2422.var_94a0d29675a6cdf4)) {
        wait(5);
        self.var_e1f4682a6a54b921 = "left";
        thread function_50446d8d9c77ea2e(var_8be33d6c4c340688);
        wait(1);
        self.var_e1f4682a6a54b921 = "right";
        thread function_50446d8d9c77ea2e(var_8be3406c4c340d21);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bbd
// Size: 0x98
function function_7a6182b94b39e9ee(s_quest, v_org, v_ang) {
    var_2ac677774b7330eb = 1;
    for (i = 0; i < var_2ac677774b7330eb; i++) {
        var_31109020393ed11b = function_7a2aaa4a09a4d250(s_quest.var_ee3ea8d303c9025c);
        var_434d2faf62ed069 = namespace_2b1145f62aa835b8::spawnnewaitype_sharedfunc(var_31109020393ed11b, v_org + (randomintrange(-10, 10), randomintrange(-10, 10), 0), v_ang, "team_hundred_ninety");
        waitframe();
        if (isdefined(var_434d2faf62ed069)) {
            var_434d2faf62ed069 kill();
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c5c
// Size: 0x15e
function function_eec0f7ff1ab97935(s_goal, speed) {
    self endon("death");
    self setmaxpitchroll(90, 120);
    self setyawspeed(600, 300);
    self setvehgoalpos(s_goal.origin, 0);
    self vehicle_setspeed(400, 100, 20);
    self clearlookatent();
    self dodamage(int(self.health * 0.5), self.origin);
    thread function_7a6182b94b39e9ee(level.var_98539610199d2422, self.origin, self.angles);
    ref = function_d93ec4635290febd();
    data = function_29b4292c92443328(ref);
    var_f48d20dfef6af564 = data.var_14090bc312dbf6c8;
    var_240a4f3d560753ff = self gettagorigin(var_f48d20dfef6af564.tag);
    playfx(getfx("chopper_explosion"), var_240a4f3d560753ff, anglestoforward(self.angles), anglestoup(self.angles));
    if (isdefined(level.var_98539610199d2422.var_4118ca23a8b62b78)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.var_98539610199d2422.var_4118ca23a8b62b78);
    }
    waitframe();
    namespace_1f188a13f7e79610::vehicle_explode();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dc1
// Size: 0xb0
function function_44e1fb35d5a39cc1() {
    flag_wait("deathworm_warn");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("defend_scrambler_zakhaev");
    }
    var_f261322cc6e930cb = getstruct("death_worm", "targetname");
    var_31109020393ed11b = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("zombie_deathworm_quest")[0];
    var_814b1ce165108544 = undefined;
    while (!isdefined(var_814b1ce165108544)) {
        var_814b1ce165108544 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, var_f261322cc6e930cb.origin, (0, 35, 0), "team_two_hundred");
        waitframe();
    }
    var_814b1ce165108544 thread function_75b832fe9dfd7797();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e78
// Size: 0x1cb
function function_75b832fe9dfd7797() {
    self endon("death");
    asm::asm_setstate("emerge_attack_swallow");
    utility::function_3ab9164ef76940fd("audio", "emerge_sharkbite");
    earthquake(0.8, 1.5, self.origin, 5000);
    foreach (player in level.players) {
        player playrumbleonentity("artillery_rumble");
    }
    thread function_19f687607002ef81();
    namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
    if (!threatbiasgroupexists("deathworm")) {
        createthreatbiasgroup("deathworm");
    }
    self setthreatbiasgroup("deathworm");
    setignoremegroup("ally_ai", "deathworm");
    setmusicstate("mx_ob_q3_boss");
    if (!threatbiasgroupexists("neutralizer_zombies")) {
        createthreatbiasgroup("neutralizer_zombies");
    }
    thread function_8b929ecbaad4582f();
    thread function_e2b79a69b7adcb1c();
    thread function_e2eb505173fb0a65();
    self waittill("swallow_in_air");
    level flag_set("chopper_crash");
    earthquake(0.8, 1, self.origin, 5000);
    foreach (player in level.players) {
        player playrumbleonentity("artillery_rumble");
    }
    wait(1);
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
    wait(2);
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT3_DEFEAT_WORM", level.players);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04a
// Size: 0x4f
function function_8b929ecbaad4582f() {
    self waittill("death");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("defeat_worm_zakhaev");
    }
    level notify("deathworm_dead");
    level thread function_962746693f32aa97();
    level thread function_4c3b4b4059b45fba();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa0a0
// Size: 0x49
function private function_19f687607002ef81() {
    self endon("death");
    self waittill("spittle_start");
    self.var_cfa89ff2e0efade1 = 1;
    while (self.health / self.maxhealth > 0.5) {
        wait(1);
    }
    self.var_cfa89ff2e0efade1 = 0;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f0
// Size: 0xc5
function function_962746693f32aa97() {
    a_ai_zombies = getaiarray("team_two_hundred");
    foreach (ai_zombie in a_ai_zombies) {
        if (isalive(ai_zombie)) {
            ai_zombie kill();
        }
    }
    level.ravenov.ignoreme = 1;
    level.ravenov.ignoreall = 1;
    level.var_8b573403a20a7229.ignoreme = 1;
    level.var_8b573403a20a7229.ignoreall = 1;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1bc
// Size: 0x29
function function_e2b79a69b7adcb1c() {
    self endon("death");
    while (1) {
        self waittill("emerge_from_ground");
        function_a668fa35458e61e3();
        thread function_1085884764c903c0();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1ec
// Size: 0x7a
function function_a668fa35458e61e3() {
    self endon("death");
    a_s_pts = getstructarray("zombie_neutralizer", "targetname");
    a_s_spawns = sortbydistance(a_s_pts, self.origin);
    self.var_75fb15af31b0815c = [];
    for (i = 0; i < 9; i++) {
        self.var_75fb15af31b0815c[self.var_75fb15af31b0815c.size] = a_s_spawns[i];
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa26d
// Size: 0xfc
function function_1085884764c903c0() {
    self endon("death");
    n_max_active = function_ab65e0d9a8828ab2("neutralizer");
    level.var_b722fd5cac961153 = 0;
    while (1) {
        if (level.var_98539610199d2422.var_8947dd7e97fc5ea1 < n_max_active) {
            var_6a6b8244a086b1c9 = function_7a2aaa4a09a4d250(self.var_75fb15af31b0815c);
            if (isdefined(var_6a6b8244a086b1c9)) {
                level.var_98539610199d2422.var_8947dd7e97fc5ea1++;
                ai_zombie = level.var_98539610199d2422 zombie_spawn(var_6a6b8244a086b1c9, 1, 1);
                if (isdefined(ai_zombie)) {
                    if (level.var_b722fd5cac961153 < 2) {
                        level.var_b722fd5cac961153++;
                        ai_zombie.var_2442daf1f2504be9 = 1;
                    } else {
                        ai_zombie setthreatbiasgroup("neutralizer_zombies");
                        setignoremegroup("ally_ai", "neutralizer_zombies");
                    }
                    ai_zombie thread function_539b9a8c7e674d75(level.var_98539610199d2422);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa370
// Size: 0x6f
function function_cb086b60e05cf8f7() {
    flag_wait("infil_start");
    wait(3);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_infil_1", level.players, 0, 0);
    var_4f78c7c9dc4c2271 = getstruct("stronghold_entrance", "targetname");
    function_a5b76e0f5024cc9a(var_4f78c7c9dc4c2271, "approaching", 10500);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_merc_helicopters", level.players, 0, 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3e6
// Size: 0x1f
function function_4c070f191f0dac1e() {
    wait(2);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_container_zombies", level.players, 0, 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa40c
// Size: 0x63
function function_a0c0fd784f3d1882() {
    level endon("facility_entered");
    function_312c0192743dc215(getstruct("stronghold_entrance", "targetname"));
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_entry_approach", level.players, 0, 0);
    level.var_98539610199d2422 waittill("entrance_found");
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_clear_stronghold", level.players, 0, 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa476
// Size: 0x50
function function_d0b233de2e4f5720() {
    wait(1);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_plant_explosive", level.players, 0, 0);
    level.var_98539610199d2422 flag_wait("charge_exploded");
    wait(2);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_enricher_explodes", level.players, 0, 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4cd
// Size: 0x1c
function function_4a90f330cfe1aca4() {
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_see_airdrop", level.players, 0, 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4f0
// Size: 0x54
function function_601c9eb68a44a33() {
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_terminus_drop_33", level.players, 0, 0);
    wait(4);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_drop_site_choppers", level.players, 0, 0);
    wait(5);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_terminus_drop_66", level.players, 0, 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa54b
// Size: 0xd0
function function_262e81479efcd17a() {
    level.var_98539610199d2422 flag_wait("ava_arrived");
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_approach_drop_site", level.players, 0, 0);
    level.var_98539610199d2422 flag_wait("neutralizer_on");
    wait(2);
    namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_power_neutralizer", level.players, 0, 0);
    level.var_98539610199d2422 flag_wait("chopper_obj");
    wait(1.5);
    level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_neutralizer_helo", level.players, 0, 0);
    level flag_wait("dw_approach");
    namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_death_worm_arrival", level.players, 0, 0);
    wait(4);
    level.var_98539610199d2422 flag_set("deathworm_warn");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa622
// Size: 0x141
function function_e2eb505173fb0a65() {
    self endon("death");
    self.n_start_health = self.health;
    self.var_50fd23a0151b7f82 = int(self.n_start_health * 0.5);
    self.var_9465212fa2c7d453 = int(self.n_start_health * 0.1);
    while (1) {
        self waittill("damage");
        if (!isdefined(self.var_2911be99626c1c49)) {
            self.var_2911be99626c1c49 = 1;
            str_vo = function_d601c1decbbc86a7();
            if (isdefined(str_vo)) {
                level thread namespace_446fc987a980892f::function_d87d5deb069bf8e5(str_vo, level.players, 1);
            }
        }
        if (!isdefined(self.var_c9dbeab9ac3e2c9a) && self.health <= self.var_50fd23a0151b7f82) {
            self.var_c9dbeab9ac3e2c9a = 1;
            level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_boss_fight_50", level.players, 0, 0);
        }
        if (!isdefined(self.var_4a5dc763ed6d37c9) && self.health <= self.var_9465212fa2c7d453) {
            self.var_4a5dc763ed6d37c9 = 1;
            level thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0a3t5_defeat_zakhaev_success", level.players, 1);
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa76a
// Size: 0x28
function function_d601c1decbbc86a7() {
    var_68114aa2f03a9916 = [0:"quest_s0a3t5_boss_fight_start_soap", 1:"quest_s0a3t5_boss_fight_start_greene"];
    return random(var_68114aa2f03a9916);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa79a
// Size: 0x3c
function merc_spawn(var_31109020393ed11b) {
    var_434d2faf62ed069 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, self.origin, self.angles, "team_hundred_ninety");
    if (isdefined(var_434d2faf62ed069)) {
        return var_434d2faf62ed069;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7dd
// Size: 0x73
function function_f58e9823d9626edf(origin, n_radius) {
    self endon("death");
    self endon("reached");
    n_radius_sq = n_radius * n_radius;
    v_org = getclosestpointonnavmesh(origin);
    while (1) {
        if (distance2dsquared(v_org, self.origin) > n_radius_sq) {
            self setgoalpos(v_org);
        } else {
            self notify("reached");
        }
        wait(2);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa857
// Size: 0x8b
function function_9081e87a119b8461(origin, n_radius) {
    self endon("death");
    self endon("combat");
    self endon("reviving");
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    if (isdefined(n_radius)) {
        n_goal_radius = n_radius;
    } else {
        n_goal_radius = 32;
    }
    while (1) {
        if (isdefined(origin) && distance2dsquared(origin, self.origin) > 4096) {
            namespace_2000a83505151e5b::function_304da84d9a815c01(origin, n_goal_radius, 1);
            self waittill("goal");
        }
        wait(2);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8e9
// Size: 0xc8
function function_312c0192743dc215(s_spot, n_radius) {
    if (isdefined(n_radius)) {
        n_dist = squared(n_radius);
    } else {
        n_dist = squared(s_spot.radius);
    }
    while (1) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distancesquared(s_spot.origin, player.origin) < n_dist) {
                    return;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9b8
// Size: 0xdf
function function_a5b76e0f5024cc9a(s_spot, str_notify, n_radius) {
    if (!isdefined(n_radius)) {
        n_dist = squared(int(s_spot.radius * 0.7));
    } else {
        n_dist = squared(n_radius);
    }
    while (1) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(s_spot.origin, player.origin) < n_dist) {
                    self notify(str_notify);
                    return;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xaa9e
// Size: 0xdf
function function_64fc67793461fff2(s_spot, str_notify, n_radius) {
    if (!isdefined(n_radius)) {
        n_dist = squared(int(s_spot.radius * 0.7));
    } else {
        n_dist = squared(n_radius);
    }
    while (1) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(s_spot.origin, player.origin) > n_dist) {
                    self notify(str_notify);
                    return;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab84
// Size: 0x3e
function get_ai_type() {
    if (function_51d76700600cebe3(30)) {
        var_31109020393ed11b = "jup_spawner_zombie_base_armored_heavy";
    } else if (function_51d76700600cebe3(25)) {
        var_31109020393ed11b = "jup_spawner_zombie_base_armored_light";
    } else {
        var_31109020393ed11b = "jup_spawner_zombie_base";
    }
    return var_31109020393ed11b;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabca
// Size: 0x40
function zombie_death_watcher(s_quest) {
    self waittill("death");
    if (isdefined(s_quest.var_f6d7c4e398ce13e2) && s_quest.var_f6d7c4e398ce13e2 > 0) {
        s_quest.var_f6d7c4e398ce13e2--;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac11
// Size: 0x66
function function_539b9a8c7e674d75(s_quest) {
    self waittill("death");
    if (isdefined(s_quest.var_8947dd7e97fc5ea1) && s_quest.var_8947dd7e97fc5ea1 > 0) {
        s_quest.var_8947dd7e97fc5ea1--;
    }
    if (isdefined(self.var_2442daf1f2504be9) && level.var_b722fd5cac961153 > 0) {
        level.var_b722fd5cac961153--;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac7e
// Size: 0x3c
function function_4d201d5295b76e9e(s_quest) {
    self waittill("death");
    if (s_quest.n_zombies > 0) {
        s_quest.n_zombies--;
        s_quest.var_7c11b077004fcf2c--;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xacc1
// Size: 0x30
function function_fc70e8ce750f8776(s_quest) {
    self waittill("death");
    if (s_quest.var_d5b8ef36ed91386a > 0) {
        s_quest.var_d5b8ef36ed91386a--;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xacf8
// Size: 0x30
function function_c506ee385d7c18cf(s_quest) {
    self waittill("death");
    if (s_quest.var_87da3b5200f9f001 > 0) {
        s_quest.var_87da3b5200f9f001--;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad2f
// Size: 0xe1
function function_b584f143ed0ec5d0(origin, num_spots, n_radius) {
    var_f10d2bae0aa4fce7 = [];
    for (i = 0; i < num_spots; i++) {
        var_2a74fdb9fac967ff = randomintrange(n_radius * -1, n_radius + 1);
        var_2a74fcb9fac965cc = randomintrange(n_radius * -1, n_radius + 1);
        pos = origin + (var_2a74fdb9fac967ff, var_2a74fcb9fac965cc, 0);
        pos_on_navmesh = getclosestpointonnavmesh(pos);
        s_spot = spawnstruct();
        if (isdefined(s_spot)) {
            s_spot.origin = pos_on_navmesh;
            s_spot.angles = (0, 0, 0);
        }
        if (isdefined(pos_on_navmesh)) {
            var_f10d2bae0aa4fce7[var_f10d2bae0aa4fce7.size] = s_spot;
        }
    }
    return var_f10d2bae0aa4fce7;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae18
// Size: 0x9b
function function_87cc2a188277bd3b(n_radius) {
    self endon("death");
    while (1) {
        if (isdefined(level.players) && level.players.size) {
            player = getclosest(self.origin, level.players);
            if (isalive(player)) {
                if (!isdefined(n_radius)) {
                    n_radius = distance2d(self.origin, player.origin) + 100;
                }
                self function_65cdab0fc78aba8f(player.origin, n_radius);
            }
        }
        wait(5);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaeba
// Size: 0x2f
function function_da159dba71d973c2(n_radius) {
    self endon("death");
    while (1) {
        self function_65cdab0fc78aba8f(self.origin, n_radius);
        wait(3);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaef0
// Size: 0x1ae
function function_5e715be63f9f20de(var_b1a583aed2813bb7, n_spawns) {
    var_da3a55eabb666c32 = [];
    if (isstruct(var_b1a583aed2813bb7)) {
        s_spawner = var_b1a583aed2813bb7;
    } else {
        s_spawner = getstruct(var_b1a583aed2813bb7, "targetname");
    }
    var_f10d2bae0aa4fce7 = function_b584f143ed0ec5d0(s_spawner.origin, n_spawns, s_spawner.radius);
    var_ee3ea8d303c9025c = [0:"jup_ob_enemy_basic_grunt_short", 1:"jup_ob_enemy_basic_grunt_long", 2:"jup_ob_enemy_basic_soldier_short", 3:"jup_ob_enemy_basic_soldier_long"];
    for (i = 0; i < var_f10d2bae0aa4fce7.size; i++) {
        if (isdefined(var_f10d2bae0aa4fce7[i].script_noteworthy)) {
            var_31109020393ed11b = "jup_ob_enemy_specialist_" + var_f10d2bae0aa4fce7[i].script_noteworthy;
        } else {
            var_31109020393ed11b = function_7a2aaa4a09a4d250(var_ee3ea8d303c9025c);
        }
        aitype = getdvar(@"hash_5254c3fbd200d7ee", var_31109020393ed11b);
        var_434d2faf62ed069 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(aitype, var_f10d2bae0aa4fce7[i].origin, var_f10d2bae0aa4fce7[i].angles, "team_hundred_ninety");
        if (isdefined(var_434d2faf62ed069)) {
            var_da3a55eabb666c32[var_da3a55eabb666c32.size] = var_434d2faf62ed069;
            if (isdefined(var_f10d2bae0aa4fce7[i].script_noteworthy) && var_f10d2bae0aa4fce7[i].script_noteworthy == "sniper") {
                var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_b11c1964f528574b(var_434d2faf62ed069, 1, var_f10d2bae0aa4fce7[i].origin);
            } else {
                var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(var_434d2faf62ed069, 64, 32, var_f10d2bae0aa4fce7[i].origin);
            }
        }
    }
    return var_da3a55eabb666c32;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a6
// Size: 0x49
function function_aa1b5db86c89322d(var_a52cc872582c05ac) {
    mdl_clip = getent("zombie_pen_clip", "targetname");
    if (!isdefined(mdl_clip)) {
        return;
    }
    if (var_a52cc872582c05ac) {
        mdl_clip movez(512, 1);
    } else {
        mdl_clip delete();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb0f6
// Size: 0x9f
function function_f0d01ab513778a71(s_quest) {
    self endon("death");
    s_quest endon("alerted");
    while (1) {
        foreach (player in level.players) {
            if (isalive(player)) {
                if (function_59565896f06f1220(self, player)) {
                    s_quest flag_set("alerted");
                    s_quest notify("alerted");
                    return;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb19c
// Size: 0x43
function function_8e7a3cfb8fc2d5df(s_quest) {
    self endon("death");
    waittill_any_4("damage", "bulletwhizby", "grenade danger", "gunshot");
    s_quest flag_set("alerted");
    s_quest notify("alerted");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb1e6
// Size: 0x33
function function_b628c2d5434b3cbc(s_quest) {
    self endon("death");
    s_quest flag_wait("alerted");
    self notify("startCombatRush");
    thread function_87cc2a188277bd3b(3000);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb220
// Size: 0x64
function function_c7d2e6ec814c4d5c(var_da3a55eabb666c32) {
    self endon("lz_cleared");
    thread function_962cd4f0b2c0e5fb();
    while (1) {
        var_da3a55eabb666c32 = array_removedead(var_da3a55eabb666c32);
        if (isdefined(var_da3a55eabb666c32)) {
            if (!var_da3a55eabb666c32.size) {
                flag_set("lz_cleared");
                self notify("lz_cleared");
            } else if (var_da3a55eabb666c32.size < 4) {
                flag_set("merc_attack");
            }
        }
        wait(1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28b
// Size: 0x28
function function_125fba683fe2c7db(s_quest) {
    self endon("death");
    s_quest flag_wait("merc_attack");
    thread merc_attack();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2ba
// Size: 0x97
function merc_attack() {
    self endon("death");
    self endon("clear_attack");
    self endon("goal");
    self.goalradius = randomintrange(800, 1500);
    while (1) {
        player = getclosest(self.origin, level.players);
        if (isalive(player)) {
            pos_on_navmesh = getclosestpointonnavmesh(player.origin);
            if (isdefined(pos_on_navmesh)) {
                thread namespace_2000a83505151e5b::function_304da84d9a815c01(pos_on_navmesh, self.goalradius, 1);
            }
        }
        wait(8);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb358
// Size: 0x21
function function_962cd4f0b2c0e5fb() {
    self endon("lz_cleared");
    wait(180);
    flag_set("lz_cleared");
    self notify("lz_cleared");
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb380
// Size: 0x14e
function zombie_spawn(s_pt, var_dc4d4adf0397344e, var_b5de2f493f49bdfb) {
    var_31109020393ed11b = get_ai_type();
    ai_zombie = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, s_pt.origin, s_pt.angles, "team_two_hundred", "difficulty_yellow");
    if (isdefined(ai_zombie) && ai_zombie function_8fa69650e33c84ef("spawn") && var_b5de2f493f49bdfb) {
        ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
    }
    waitframe();
    if (isalive(ai_zombie)) {
        ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        level.var_98539610199d2422.n_zombies++;
        ai_zombie.team = "team_two_hundred";
        if (ai_zombie.agent_type == "actor_jup_spawner_zombie_base") {
            ai_zombie thread zombie_death_watcher(self);
        } else {
            level.var_98539610199d2422.var_7c11b077004fcf2c++;
            ai_zombie thread function_4d201d5295b76e9e(self);
        }
        var_9038e48904360a14 = "sprint";
        ai_zombie namespace_dd16d65e824b8e9::function_f1e5805da192a1ef(var_9038e48904360a14, "default", 26);
        if (isdefined(var_dc4d4adf0397344e)) {
            ai_zombie thread function_87cc2a188277bd3b(2000);
        }
        return ai_zombie;
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4d5
// Size: 0x114
function function_7ea5453572655fab(s_loc, n_spawns, var_e6642530bf08708e, var_b5de2f493f49bdfb) {
    var_badfa29531597077 = [];
    var_f10d2bae0aa4fce7 = function_b584f143ed0ec5d0(s_loc.origin, n_spawns, s_loc.radius);
    for (i = 0; i < var_f10d2bae0aa4fce7.size; i++) {
        var_31109020393ed11b = get_ai_type();
        ai_zombie = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, var_f10d2bae0aa4fce7[i].origin, var_f10d2bae0aa4fce7[i].angles, "team_two_hundred", "difficulty_yellow");
        if (isdefined(ai_zombie) && ai_zombie function_8fa69650e33c84ef("spawn") && var_b5de2f493f49bdfb) {
            ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
            ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        }
        waitframe();
        if (isdefined(ai_zombie)) {
            ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
            var_badfa29531597077[var_badfa29531597077.size] = ai_zombie;
        }
    }
    return var_badfa29531597077;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5f1
// Size: 0x77
function function_aa0d525c497e873c() {
    n_spawns = function_ab65e0d9a8828ab2("ground");
    foreach (s_spawner in getstructarray("zombie_proximity", "targetname")) {
        s_spawner thread function_a8219a727c620d1e(n_spawns);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb66f
// Size: 0xbb
function function_a8219a727c620d1e(n_spawns) {
    v_forward = vectornormalize(anglestoforward(self.angles)) * self.radius + self.origin;
    a_s_pts = function_b584f143ed0ec5d0(v_forward, n_spawns, self.radius);
    function_312c0192743dc215(self);
    foreach (s_pt in a_s_pts) {
        level.var_98539610199d2422 zombie_spawn(s_pt, 0, 1);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb731
// Size: 0x10f
function on_zombie_ai_damaged(var_d74fc41b6b10ccf5) {
    if (isdefined(var_d74fc41b6b10ccf5.einflictor) && var_d74fc41b6b10ccf5.einflictor.classname == "rocket") {
        if (function_51d76700600cebe3(40)) {
            if (isdefined(self.var_7050024e5f8ca246)) {
                self [[ self.var_7050024e5f8ca246 ]]();
            }
            self kill();
        } else if (function_51d76700600cebe3(40)) {
            function_bce021b0a87015f6(1);
            waitframe();
            self kill(self.origin, var_d74fc41b6b10ccf5.einflictor, var_d74fc41b6b10ccf5.einflictor, "MOD_PROJECTILE_SPLASH");
        } else if (level.var_98539610199d2422.var_cf47493985378a8e < 7) {
            level.var_98539610199d2422.var_cf47493985378a8e++;
            function_10c494811ab99382(var_d74fc41b6b10ccf5);
        } else {
            self kill(self.origin, var_d74fc41b6b10ccf5.einflictor, var_d74fc41b6b10ccf5.einflictor, "MOD_PROJECTILE_SPLASH");
        }
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb847
// Size: 0x11a
function function_10c494811ab99382(var_d74fc41b6b10ccf5) {
    if (!isalive(self)) {
        return;
    }
    if (isdefined(self.var_11a6c5f1d5527c1c)) {
        return;
    }
    self.var_11a6c5f1d5527c1c = 1;
    v_dir = vectornormalize(anglestoforward(var_d74fc41b6b10ccf5.einflictor.owner.angles)) * randomintrange(25, 40) + var_d74fc41b6b10ccf5.einflictor.owner.origin;
    v_launch = v_dir + (randomintrange(100, 500), 0, randomintrange(1000, 2500));
    self kill(var_d74fc41b6b10ccf5.einflictor.origin, var_d74fc41b6b10ccf5.einflictor, var_d74fc41b6b10ccf5.einflictor, "MOD_PROJECTILE_SPLASH");
    waitframe();
    if (isdefined(self)) {
        e_corpse = self getcorpseentity();
    }
    if (isdefined(e_corpse)) {
        e_corpse startragdollfromimpact("torso_lower", v_launch);
        e_corpse thread function_8cf6b513dbb21225();
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb968
// Size: 0x22
function function_8cf6b513dbb21225() {
    while (isdefined(self)) {
        wait(1);
    }
    level.var_98539610199d2422.var_cf47493985378a8e--;
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb991
// Size: 0x2f6
function function_4c3b4b4059b45fba() {
    setmusicstate("");
    level.var_91a8c7abdf195c70 = 1;
    foreach (player in level.players) {
        if (namespace_7e17181d03156026::isinlaststand(player)) {
            player namespace_f585f5e438cbdbc8::revive_player();
        }
        player setsoundsubmix("jup_ob_endgame");
        if (isalive(player)) {
            player val::set("exfil", "breath_system", 0);
            player val::set("exfil", "cg_drawcrosshair", 0);
            player val::set("exfil", "crouch", 0);
            player val::set("exfil", "damage", 0);
            player val::set("exfil", "gesture", 0);
            player val::set("exfil", "allow_jump", 0);
            player val::set("exfil", "killstreaks", 0);
            player val::set("exfil", "melee", 0);
            player val::set("exfil", "allow_movement", 0);
            player val::set("exfil", "offhand_weapons", 0);
            player val::set("exfil", "prone", 0);
            player val::set("exfil", "sprint", 0);
            player val::set("exfil", "supers", 0);
            player val::set("exfil", "usability", 0);
            player val::set("exfil", "weapon", 0);
            player val::set("exfil", "fire", 0);
            player val::set("exfil", "weapon_switch", 0);
            player val::set("exfil", "freezecontrols", 1);
            player val::set("exfil", "ignoreme", 1);
            player val::set("exfil", "show_weapon_hud", 0);
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 1, 0);
            player hidehudenable();
            player callback::callback("ob_act3_completed");
        }
    }
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
    namespace_134d54e39331ee45::ai_cleanup();
    wait(1);
    foreach (player in level.players) {
        if (isdefined(level.var_14a0183a6880d101)) {
            player [[ level.var_14a0183a6880d101 ]]();
        }
        if (isalive(player)) {
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 0, 0);
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            player thread namespace_448ccf1ca136fbbe::function_a7634932f5d9565c(1);
        }
    }
    play_movie("jup_ob_act3_cine_outro");
    level.var_91a8c7abdf195c70 = 0;
    level thread namespace_134d54e39331ee45::function_bf01aba31e9023d1();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc8e
// Size: 0x127
function play_movie(str_movie) {
    var_7848ff3f98ef4a73 = 0;
    var_8c6c2faac72ea626 = 10;
    var_4f105563ca74cf73 = str_movie;
    var_29d5d36a262c1250 = 160;
    var_1bab87417f147c8f = 0;
    foreach (player in level.players) {
        player setclientomnvar("ui_br_bink_overlay_state", var_8c6c2faac72ea626);
        player.var_59e5ea44ba5aff1 = 1;
    }
    playcinematicforall(var_4f105563ca74cf73, 1, var_1bab87417f147c8f);
    wait(var_29d5d36a262c1250);
    stopcinematicforall();
    foreach (player in level.players) {
        player setclientomnvar("ui_br_bink_overlay_state", var_7848ff3f98ef4a73);
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 1, 0);
    }
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdbc
// Size: 0xc6
function teleport_players(str_loc) {
    level flag_set("player_has_spawned");
    wait(3);
    var_f10d2bae0aa4fce7 = getstructarray(str_loc, "targetname");
    for (i = 0; i < level.players.size; i++) {
        level.players[i] setorigin(var_f10d2bae0aa4fce7[i].origin);
        level.players[i] setplayerangles((0, 90, 0));
        level.players[i] flag_set("player_boarded");
        level.players[i] flag_set("players_unloaded");
    }
    thread function_b1aa1fb6109a052b();
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe89
// Size: 0x332
function function_ce34466b3cece887() {
    var_1b3072262db80fc1 = [0:"brainrot", 1:"deadwire", 2:"napalmburst", 3:"cryofreeze", 4:"shatterblast"];
    perks = [0:"specialty_juggernog", 1:"specialty_quickrevive", 2:"specialty_deadshot", 3:"specialty_speedcola", 4:"specialty_elemental_pop", 5:"specialty_death_perception", 6:"specialty_staminup"];
    supers = [0:"super_aether_shroud", 1:"super_healing_aura", 2:"super_frost_blast", 3:"super_energy_mine", 4:"super_frenzied_guard", 5:"super_tesla_storm"];
    if (isdefined(self.var_5c9a354e091a8501)) {
        return;
    }
    self.var_5c9a354e091a8501 = 1;
    self.var_bed158a6dfac230d = 2;
    self.var_8790c077c95db752 = self.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    waitframe();
    armor::setarmorhealth(self.var_8790c077c95db752);
    waitframe();
    armor::function_9c6e9a6643b6c9a6(3);
    waitframe();
    namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(1);
    waitframe();
    var_e1d199da4592fc05 = randomint(supers.size);
    perkpackage::perkpackage_givedebug(supers[var_e1d199da4592fc05]);
    waitframe();
    currency::function_3036cef61495210f("essence", 10000);
    waitframe();
    a_weapons = self getweaponslist("primary");
    foreach (weapon in a_weapons) {
        self takeweapon(weapon);
    }
    waitframe();
    var_636981592f381ebf = spawnstruct();
    var_d7732d0238eae9ff = 240;
    var_84255b4b28279219 = "ob_jup_item_weapon_ar_kilo53_blue";
    var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_84255b4b28279219);
    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
    var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
    var_636981592f381ebf = spawnstruct();
    var_d7732d0238eae9ff = 48;
    var_84255b4b28279219 = "ob_jup_item_weapon_sh_mbravo_blue";
    var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_84255b4b28279219);
    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
    var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
    wait(0.5);
    a_weapons = self getweaponslist("primary");
    for (i = 0; i < 2; i++) {
        pack_a_punch::pap_weapon(a_weapons[i], 1);
        waitframe();
        var_4bc27b790622bd85 = randomint(var_1b3072262db80fc1.size);
        namespace_2e04133215e83a48::function_6c40f58b29a952a9(a_weapons[i], var_1b3072262db80fc1[var_4bc27b790622bd85]);
    }
    waitframe();
    zombie_perks::give_perk(perks[0], 0);
    wait(0.25);
    zombie_perks::give_perk(perks[1], 0);
    wait(0.25);
    zombie_perks::give_perk(perks[2], 0);
    wait(0.25);
    zombie_perks::give_perk(perks[3], 0);
    wait(0.25);
    zombie_perks::give_perk(perks[4], 0);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1c2
// Size: 0x28
function function_a606113e8150b7e4(str_notify, musicstate) {
    self endon("end_music_watcher_" + str_notify);
    self waittill(str_notify);
    setmusicstate(musicstate);
}

// Namespace namespace_89d57ff5dfa37e5c/namespace_609a40b1d504a670
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1f1
// Size: 0x143
function function_9d04463dd59c306(var_3aa0162eb497c8a7) {
    val::set("exfil", "crouch", !var_3aa0162eb497c8a7);
    val::set("exfil", "gesture", !var_3aa0162eb497c8a7);
    val::set("exfil", "allow_jump", !var_3aa0162eb497c8a7);
    val::set("exfil", "killstreaks", !var_3aa0162eb497c8a7);
    val::set("exfil", "melee", !var_3aa0162eb497c8a7);
    val::set("exfil", "offhand_weapons", !var_3aa0162eb497c8a7);
    val::set("exfil", "prone", !var_3aa0162eb497c8a7);
    val::set("exfil", "sprint", !var_3aa0162eb497c8a7);
    val::set("exfil", "supers", !var_3aa0162eb497c8a7);
    val::set("exfil", "usability", !var_3aa0162eb497c8a7);
    val::set("exfil", "weapon", !var_3aa0162eb497c8a7);
    val::set("exfil", "allow_movement", !var_3aa0162eb497c8a7);
    val::set("exfil", "fire", !var_3aa0162eb497c8a7);
    val::set("exfil", "weapon_switch", !var_3aa0162eb497c8a7);
    val::set("exfil", "damage", !var_3aa0162eb497c8a7);
    val::set("exfil", "ignoreme", var_3aa0162eb497c8a7);
    self freezecontrols(var_3aa0162eb497c8a7);
}

