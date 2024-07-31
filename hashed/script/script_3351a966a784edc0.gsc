#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using script_5d265b4fca61f070;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\scene.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_6bffae1b97f70547;
#using script_7c40fa80892a721;
#using script_639bf783929acf9b;
#using script_5640d32580c6bc7d;
#using script_7d3e27aa82b5d70b;
#using script_485622d93fa7e4cf;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_64316dc775e91122;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_398835140857d740;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\engine\utility.gsc;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_3ab210ea917601e7;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64351208cb856df9;
#using script_249b0a9054ceb230;
#using script_6f65366f542f6627;
#using script_4e6e58ab5d96c2b0;
#using script_42982ffd0134f28e;
#using script_5080d40cd904ba73;
#using scripts\mp\gametypes\ob.gsc;
#using scripts\common\create_script_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\mp_agent.gsc;
#using script_55221d469e7b320e;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_749ff6f56673a813;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1f97a44d1761c919;
#using script_4fa7e9e11630166c;
#using script_7cfaa6fd841fb4dd;
#using script_638d701d263ee1ed;
#using script_64f7df26b62826a1;
#using scripts\mp\ai_behavior.gsc;
#using script_60dd6e3992c1f29;
#using script_2583ee5680cf4736;
#using scripts\common\ai.gsc;
#using script_669760f0500e4358;
#using script_2d400da2610fe542;
#using script_413d0426f154bd91;
#using script_2d05e472a90adb1d;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\utility\player.gsc;
#using script_1feb0785278dafea;
#using script_860bfdfe82326e3;
#using script_58be75c518bf0d40;
#using script_43971bbeefd98f05;
#using script_2b264b25c7da0b12;
#using scripts\mp\bots\bots.gsc;

#namespace namespace_89d581f5dfa382c2;

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23ec
// Size: 0x194
function quest_init() {
    if (flag("jup_quest_act1_init")) {
        return;
    }
    flag_set("jup_quest_act1_init");
    if (getdvarint(@"hash_f0651f120dc9412d", 0)) {
        mapname = getmapname();
        if (mapname == "mp_jup_st_c_gw") {
            setdvar(@"hash_f1d095735ac37f33", 0);
            setdvar(@"hash_f1f518497502aea8", 1);
            setdvar(@"hash_37edd5a66bd29f3d", 2);
            setdvar(@"hash_2fe0283b419ff08a", 1);
            level._effect["computer_idle"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_idle.vfx");
            level._effect["computer_active"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_mercdefend_active.vfx");
            level.var_9979559855d31f5a = -1;
            level.n_time_remaining = 30;
            level.quest_airstrike = 1;
            level.var_a9e2544b9283299b = 1;
            callback::add("player_spawned", &on_player_spawned);
            callback::add("player_connect", &on_player_connected);
            namespace_8ef157d888576350::function_610dfcbf191b189b();
            scripts\engine\scriptable::scriptable_adddamagedcallback(&namespace_134d54e39331ee45::function_61c4487eafc2bc4c);
            level.var_cced1297c1210e46 = throttle_initialize("explosive_barrel", 1, default_to(level.framedurationseconds, 0.1));
            level.infil_throttle = throttle_initialize("infil_kill", 1, default_to(level.framedurationseconds, 0.1));
            level thread quest_start();
            return;
        }
        callback::add("exfil_to_s0_act1", &function_2a6c134406898721);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2588
// Size: 0x8b
function quest_start() {
    level flag_set("powerup_disable_nuke");
    level function_24f7bf25b01b1d1f();
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
    scripts\common\create_script_utility::wait_for_cs_flag("jup_ob_quest_s0_act_1_cs");
    level quest_setup();
    level flag_wait("player_ready");
    if (!getdvarint(@"hash_ca560be49771e1b9", 0) && !getdvarint(@"hash_60b77f399408654c", 0)) {
        level.var_54492f7bf0674200 thread function_bf1087ba40d8d354();
        level.var_54492f7bf0674200 function_74139ae6c2c53345();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x261b
// Size: 0x1bc
function quest_setup() {
    level.var_54492f7bf0674200 = spawnstruct();
    level.var_54492f7bf0674200.var_d5b8ef36ed91386a = 0;
    level.var_54492f7bf0674200.var_87da3b5200f9f001 = 0;
    level.var_54492f7bf0674200.var_718d9cc814712443 = 0;
    level.var_54492f7bf0674200.n_specials = 0;
    level.var_54492f7bf0674200.var_7c11b077004fcf2c = 0;
    level.var_54492f7bf0674200.n_mercs = 0;
    level.var_54492f7bf0674200.n_zombies = 0;
    level.var_54492f7bf0674200.n_defend = 0;
    level.var_54492f7bf0674200.var_64ba305be127e7dc = 0;
    level.var_54492f7bf0674200.n_players = 0;
    level.var_54492f7bf0674200.n_heavy = 0;
    level.var_54492f7bf0674200.n_captain = 0;
    level.var_54492f7bf0674200.n_rusher = 0;
    level.var_54492f7bf0674200.difficulty = "difficulty_normal";
    level.var_54492f7bf0674200.var_f84c04cd2ceb77b5 = [];
    level.var_54492f7bf0674200.var_ee3ea8d303c9025c = ["jup_ob_enemy_basic_grunt_short", "jup_ob_enemy_basic_grunt_long", "jup_ob_enemy_basic_soldier_long", "jup_ob_enemy_basic_soldier_short"];
    level.battlechatterdisabled = 1;
    script_model_anims();
    level.var_54492f7bf0674200 thread setup_props();
    level.var_54492f7bf0674200 thread start_quest();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27df
// Size: 0x56
function on_player_connected(params) {
    self endon("disconnect");
    if (!getdvarint(@"hash_ca560be49771e1b9", 0) && !getdvarint(@"hash_60b77f399408654c", 0) && getdvarint(@"hash_f0651f120dc9412d", 0)) {
        scripts\cp_mp\utility\game_utility::function_852712268d005332(self, 1, 0);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x283d
// Size: 0x13b
function on_player_spawned(params) {
    if (getdvarint(@"hash_f0651f120dc9412d", 0) && getdvarint(@"hash_c221795287935921", 0)) {
        thread function_ce34466b3cece887();
    }
    level flag_set("player_ready");
    level.var_9979559855d31f5a++;
    if (!getdvarint(@"hash_ca560be49771e1b9", 0) && !getdvarint(@"hash_60b77f399408654c", 0) && !level flag("chopper_end")) {
        self.n_pos = level.var_9979559855d31f5a + 1;
        level flag_wait("chopper_ready");
        thread function_1e66bb8b54246d6b();
        if (level flag("countdown") && !isdefined(self.var_73f4fb8b53668a5c) && level.n_time_remaining > 1) {
            self.var_73f4fb8b53668a5c = 1;
            thread function_69c1532c14dde0f1(level.var_54492f7bf0674200.infil_chopper, level.var_54492f7bf0674200);
        }
        return;
    }
    if (!getdvarint(@"hash_ca560be49771e1b9", 0) && !getdvarint(@"hash_60b77f399408654c", 0)) {
        function_ac62c6628f23f82d();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2980
// Size: 0xe5
function function_ac62c6628f23f82d() {
    self endon("death");
    var_f10d2bae0aa4fce7 = getstructarray("infil_spawn_pt", "targetname");
    v_spawn = undefined;
    scripts\cp_mp\utility\game_utility::function_852712268d005332(self, 1, 0);
    player_freeze(1);
    while (true) {
        s_pt = array_random(var_f10d2bae0aa4fce7);
        v_pos = getclosestpointonnavmesh(s_pt.origin);
        if (isdefined(v_pos) && !positionwouldtelefrag(v_pos)) {
            break;
        }
        waitframe();
    }
    self setorigin(v_pos);
    self setplayerangles(s_pt.angles);
    flag_set("player_onboard");
    level flag_set("all_players_onboard");
    level.var_54492f7bf0674200 flag_wait("drop_off");
    scripts\cp_mp\utility\game_utility::function_852712268d005332(self, 0, 1);
    player_freeze(0);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6d
// Size: 0x317
function start_quest() {
    if (getdvarint(@"hash_ca560be49771e1b9", 0)) {
        thread ava_spawn();
        thread watch_defend();
        flag_set("tower_activated");
        var_446a0ad9faf42765 = getstruct("player_teleport_ava", "targetname");
        thread teleport_players(var_446a0ad9faf42765);
        while (!isdefined(self.var_2ada333c838a2316)) {
            waitframe();
        }
        self.var_4118ca23a8b62b78 = scripts\mp\objidpoolmanager::requestobjectiveid(0);
        scripts\mp\objidpoolmanager::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::objective_add_objective(self.var_4118ca23a8b62b78, "current");
        scripts\mp\objidpoolmanager::update_objective_icon(self.var_4118ca23a8b62b78, "jup_ui_map_icon_generic_marker");
        scripts\mp\objidpoolmanager::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
        scripts\mp\objidpoolmanager::update_objective_setbackground(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::function_98ba077848896a3(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::update_objective_onentity(self.var_4118ca23a8b62b78, self.var_2ada333c838a2316);
        scripts\mp\objidpoolmanager::update_objective_setzoffset(self.var_4118ca23a8b62b78, 80);
        return;
    }
    if (getdvarint(@"hash_60b77f399408654c", 0)) {
        level flag_wait("player_ready");
        var_446a0ad9faf42765 = getstruct("helipad_watcher", "targetname");
        s_ava = getstruct("ava_helipad_end", "script_noteworthy");
        self.var_2ada333c838a2316 = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_ally_ava_base", s_ava.origin, s_ava.angles, "allies");
        self.var_2ada333c838a2316.var_9f009877c3bea958 = 1;
        waitframe();
        self.var_2ada333c838a2316.ignoreall = 1;
        self.var_4118ca23a8b62b78 = scripts\mp\objidpoolmanager::requestobjectiveid(0);
        scripts\mp\objidpoolmanager::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::objective_add_objective(self.var_4118ca23a8b62b78, "current");
        scripts\mp\objidpoolmanager::update_objective_icon(self.var_4118ca23a8b62b78, "jup_ui_map_icon_generic_marker");
        scripts\mp\objidpoolmanager::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
        scripts\mp\objidpoolmanager::update_objective_setbackground(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::function_98ba077848896a3(self.var_4118ca23a8b62b78, 1);
        scripts\mp\objidpoolmanager::update_objective_onentity(self.var_4118ca23a8b62b78, self.var_2ada333c838a2316);
        scripts\mp\objidpoolmanager::update_objective_setzoffset(self.var_4118ca23a8b62b78, 80);
        thread teleport_players(var_446a0ad9faf42765);
        thread function_b73cbb48a2997167();
        s_start = getstruct("ava_helipad_end", "script_noteworthy");
        self.var_2ada333c838a2316 thread behavior_guard(s_start.origin, 8);
        msg = self.var_2ada333c838a2316 waittill_any_timeout_2(5, "goal");
        flag_wait("ava_chopper_go");
        return;
    }
    function_3e10b338f3050e84();
    function_3e10b638f305151d();
    function_3e10b538f30512ea();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8c
// Size: 0x1a8
function function_3e10b338f3050e84() {
    level endon("game_ended");
    level flag_wait("all_players_onboard");
    level thread namespace_134d54e39331ee45::function_7a5ab9d5c8dbfe6a();
    level.var_54492f7bf0674200 thread oob_triggers();
    level.var_54492f7bf0674200 thread function_69bd847b57aaf41d();
    level.var_54492f7bf0674200 thread function_26a51c18464ebae2();
    level.var_54492f7bf0674200 thread function_aa0d525c497e873c();
    level.var_54492f7bf0674200 thread function_968199c59a40e7d7();
    level.var_54492f7bf0674200 thread function_3a4979a2d7882196();
    level.var_54492f7bf0674200 thread merc_outpost_sniper();
    level.var_54492f7bf0674200 thread function_577419b6760f20e();
    level.var_54492f7bf0674200 thread function_594b8c2b03233424();
    wait 3;
    level.var_54492f7bf0674200 thread function_707d51c6800465c7();
    level.var_54492f7bf0674200 thread function_1e86be4e3accaf94();
    level.var_54492f7bf0674200 thread tower_engagement();
    level.var_54492f7bf0674200 thread tower_entry();
    level.var_54492f7bf0674200 thread function_93ed60fe55d1bf3e();
    level.var_54492f7bf0674200 thread function_f1b16a36fd9df9fe();
    level.var_54492f7bf0674200 thread tower_stairs();
    level.var_54492f7bf0674200 thread tower_captain();
    level.var_54492f7bf0674200 thread function_d109f93f4609bfe0();
    wait 1;
    level.var_54492f7bf0674200 thread function_81152d7f8762edb();
    level.var_54492f7bf0674200 thread function_ba543323950453aa();
    level.var_54492f7bf0674200 thread function_166b8b1cf4563ddb();
    level.var_54492f7bf0674200 thread courtyard_engagement();
    level flag_wait("story_quest_complete_step_1");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f3c
// Size: 0x33
function function_3e10b638f305151d() {
    level endon("game_ended");
    level.var_54492f7bf0674200 thread ava_spawn();
    level.var_54492f7bf0674200 thread watch_defend();
    level waittill("story_quest_complete_step_2");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f77
// Size: 0x10
function function_e34d2718f099f27e(b_skipped) {
    if (istrue(b_skipped)) {
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8f
// Size: 0x22
function function_3e10b538f30512ea() {
    level endon("game_ended");
    level.var_54492f7bf0674200 thread function_8f13615465f68ee();
    level waittill("story_quest_complete_step_3");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb9
// Size: 0x10
function function_e34d2818f099f4b1(b_skipped) {
    if (istrue(b_skipped)) {
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fd1
// Size: 0x20
function function_3e10b038f30507eb(b_skipped) {
    level endon("game_ended");
    if (istrue(b_skipped)) {
        return;
    }
    level waittill("story_quest_complete_step_4");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ff9
// Size: 0x10
function function_e34d2918f099f6e4(b_skipped) {
    if (istrue(b_skipped)) {
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3011
// Size: 0x37
function setup_props() {
    level flag_wait("all_players_onboard");
    thread function_367231fc37094e7b();
    thread setup_barrels();
    thread setup_mines();
    thread setup_barriers();
    thread function_5734daa7a8ef6bd();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3050
// Size: 0x57
function function_2a6c134406898721(params) {
    if (!isdefined(params.player)) {
        return;
    }
    level.var_9ec4962076db301b["s0_act1"].var_576f57af0204c38c = params.exfil_chopper;
    level flag_set("exfil_to_s0_act_1");
    level thread function_700e95e77f71e457(params);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30af
// Size: 0x6e
function function_700e95e77f71e457(params) {
    if (!isplayer(params.player)) {
        return;
    }
    var_684092929dab076f = [params.player];
    var_576f57af0204c38c = level.var_9ec4962076db301b["s0_act1"].var_576f57af0204c38c;
    level thread namespace_bbc151ced3ff8d46::map_transition(var_684092929dab076f, var_576f57af0204c38c, "s0_act1");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3125
// Size: 0x242
function function_74139ae6c2c53345() {
    s_pos = getstruct("infil_chopper", "targetname");
    s_goal = getstruct(s_pos.target, "targetname");
    spawndata = spawnstruct();
    spawndata.origin = s_pos.origin;
    spawndata.angles = s_pos.angles;
    spawndata.preventrespawn = 1;
    spawndata.var_699ac4a9c9e9f0ec = 1;
    spawndata.var_24993ee24f7c7c0 = 1;
    self.infil_chopper = undefined;
    while (true) {
        self.infil_chopper = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh9_palfa", spawndata);
        if (isdefined(self.infil_chopper)) {
            self.infil_chopper.e_linkto = getent("linkto_clip_infil_chopper", "targetname");
            mdl_clip = getent("clip_infil_chopper", "targetname");
            self.infil_chopper.mdl_clip = mdl_clip;
            self.infil_chopper.mdl_clip linkto(self.infil_chopper.e_linkto);
            break;
        }
        waitframe();
    }
    self.infil_chopper.e_linkto rotateto(self.infil_chopper.angles, 0.05);
    self.infil_chopper.e_linkto moveto(self.infil_chopper.origin, 0.05);
    self.infil_chopper.e_linkto waittill("movedone");
    self.infil_chopper.e_linkto linkto(self.infil_chopper);
    self.infil_chopper.var_9bd69326cfeb9fe9 = 1;
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable(self.infil_chopper);
    self.infil_chopper scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_setcandamage(0);
    self.infil_chopper thread function_86b4ca8e83c456e6(self, s_goal);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x336f
// Size: 0x42a
function function_86b4ca8e83c456e6(s_quest, s_goal) {
    self endon("death");
    self.team = level.players[0].team;
    namespace_9f6a961447bab709::function_a609274d97743733();
    self vehicle_setspeed(45, 20, 8);
    self setvehgoalpos(self.origin, 1);
    self waittill("goal");
    self setgoalyaw(flat_angle(s_goal.angles)[1]);
    level flag_set("chopper_ready");
    level flag_wait("all_players_onboard");
    s_quest thread players_infil();
    wait 1;
    level thread intro_music();
    while (true) {
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "infil_start") {
                self vehicle_setspeed(30, 20, 8);
                self setvehgoalpos(s_goal.origin, 0);
            } else if (s_goal.script_noteworthy == "drop_off") {
                s_quest flag_set("dropped_off");
                self setvehgoalpos(s_goal.origin, 1);
                self setgoalyaw(flat_angle(s_goal.angles)[1]);
            } else if (s_goal.script_noteworthy == "slow") {
                s_quest flag_set("wakeup");
                self vehicle_setspeed(30, 20, 8);
                self setvehgoalpos(s_goal.origin, 0);
            } else if (s_goal.script_noteworthy == "detonate") {
                s_quest flag_set("infil_rush");
                s_quest flag_set("detonate");
                s_quest thread mine_detonate();
                self setvehgoalpos(s_goal.origin, 0);
            } else if (s_goal.script_noteworthy == "depart") {
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
                level thread vo_infil();
                s_quest thread infil_objective();
            } else if (s_goal.script_noteworthy == "slow") {
                s_quest flag_set("infil_mines");
            } else if (s_goal.script_noteworthy == "rpg") {
                s_quest flag_set("rpg");
                s_quest thread tower_rpg();
                s_quest thread infil_airstrike();
            } else if (s_goal.script_noteworthy == "detonate") {
                s_quest flag_set("tunnel_mine");
            } else if (s_goal.script_noteworthy == "drop_off") {
                level flag_set("chopper_end");
                self.mdl_clip notsolid();
                self.e_linkto unlink();
                thread function_83ff2df370bc359b(s_quest);
                s_quest flag_set("drop_off");
                s_quest flag_wait("players_disembarked");
                level.battlechatterdisabled = 0;
            } else if (s_goal.script_noteworthy == "depart") {
                self vehicle_setspeed(75, 20, 10);
            }
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
            continue;
        }
        self setvehgoalpos(self.origin, 1);
        if (isdefined(self.pilots)) {
            foreach (pilot in self.pilots) {
                pilot delete();
            }
        }
        scripts\cp_mp\vehicles\vehicle::vehicle_explode();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37a1
// Size: 0x7a
function infil_objective() {
    wait 1.5;
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("quest_s0_act1_start", level.players);
    level flag_wait("chopper_end");
    level thread namespace_446fc987a980892f::playconversation("quest_s0a1t7_rooftop_insertion", level.players, 0, 1);
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_INFILTRATE", level.players);
    flag_wait("players_disembarked");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_ACT1_RADIO_TOWER", level.players);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3823
// Size: 0x1c
function intro_music() {
    flags::gameflagwait("prematch_done");
    wait 1;
    setmusicstate("mx_jup_ob_activity_action_loop5_high");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3847
// Size: 0xeb
function tower_rpg() {
    self.infil_chopper endon("death");
    wait 9;
    e_projectile = magicbullet("iw9_la_rpapa7_mp", self.s_rpg.origin + (-20, -33, 54), self.infil_chopper.origin + (200, 0, 200));
    if (isdefined(e_projectile)) {
        e_projectile thread rpg_explode(self.infil_chopper);
    }
    wait 1;
    e_projectile = magicbullet("iw9_la_rpapa7_mp", self.s_rpg.origin + (94, -98, 54), self.infil_chopper.origin + (0, 0, -500));
    if (isdefined(e_projectile)) {
        e_projectile thread rpg_explode(self.infil_chopper);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x393a
// Size: 0x6c
function rpg_explode(vh_chopper) {
    self waittill("death");
    if (isdefined(self)) {
        v_pos = self.origin;
    }
    if (isdefined(v_pos)) {
        if (distancesquared(vh_chopper.origin, v_pos) <= 250000) {
            earthquake(0.3, 1, v_pos, 600);
            vh_chopper playrumbleonentity("artillery_rumble_heavy");
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39ae
// Size: 0x231
function function_bf1087ba40d8d354() {
    thread function_804aa1cbd49ba400(getstructarray("intro_chopper", "targetname"), 1);
    var_ee3ea8d303c9025c = ["jup_ob_enemy_basic_grunt_short", "jup_ob_enemy_basic_grunt_long", "jup_ob_enemy_basic_soldier_long", "jup_ob_enemy_basic_soldier_short"];
    foreach (s_merc in getstructarray("intro_guard", "targetname")) {
        var_da3a55eabb666c32 = function_5e715be63f9f20de(s_merc, 7, var_ee3ea8d303c9025c);
        foreach (merc in var_da3a55eabb666c32) {
            merc.var_a1794b19d6c5fa07 = 1;
            merc.var_7e4b076a06c6df27 = 1;
            merc thread function_a6ad68d6b07acf11(self);
            merc thread function_f74c0a3914a4fad(self);
        }
    }
    foreach (s_spawn in getstructarray("intro_zombie", "targetname")) {
        a_zombies = function_7ea5453572655fab(s_spawn, 16, 1);
        foreach (zombie in a_zombies) {
            zombie.var_7e4b076a06c6df27 = 1;
            zombie.no_powerups = 1;
            zombie thread function_a6ad68d6b07acf11(self);
            zombie thread function_f74c0a3914a4fad(self);
        }
    }
    ai_merc = undefined;
    while (true) {
        ai_merc = array_random(var_da3a55eabb666c32);
        if (isdefined(ai_merc)) {
            thread function_bad6b2e5083694fc(ai_merc);
            break;
        }
        waitframe();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3be7
// Size: 0xf9
function function_bad6b2e5083694fc(ai_merc) {
    flag_wait("infil_start");
    var_f75ab33b14599ef5 = getstructarray("intro_mine", "targetname");
    a_mines = [];
    foreach (s_mine in var_f75ab33b14599ef5) {
        if (isdefined(ai_merc)) {
            mine = namespace_64135de19550f047::function_908ec13fb4d6cede(s_mine.origin, undefined, ai_merc);
            wait 1;
            if (isdefined(mine)) {
                a_mines[a_mines.size] = mine;
            }
        }
    }
    flag_wait("infil_mines");
    for (i = 0; i < a_mines.size; i++) {
        if (isdefined(a_mines[i])) {
            a_mines[i] thread mine_explode();
        }
        wait randomfloatrange(0.1, 0.3);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ce8
// Size: 0x21
function mine_explode() {
    self endon("death");
    wait randomfloatrange(0.5, 2);
    self notify("detonateExplosive");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d11
// Size: 0x53
function function_f74c0a3914a4fad(s_quest) {
    self endon("death");
    s_quest flag_wait("drop_off");
    if (scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        scripts\cp_mp\vehicles\vehicle::vehicle_explode();
        return;
    }
    scripts\engine\throttle::function_f632348cbb773537(level.infil_throttle, self);
    if (isalive(self)) {
        self kill();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6c
// Size: 0x4a
function infil_airstrike() {
    wait 6;
    var_635c801e4a33337f = getstruct("airstrike_loc", "targetname");
    thread namespace_64135de19550f047::ob_airstrike(var_635c801e4a33337f.origin, "precision_airstrike", 1, 0, var_635c801e4a33337f.angles[1]);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dbe
// Size: 0x70
function function_aa0d525c497e873c() {
    n_spawns = function_ab65e0d9a8828ab2();
    foreach (s_spawner in getstructarray("zombie_proximity", "targetname")) {
        s_spawner thread function_a8219a727c620d1e(self, n_spawns);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e36
// Size: 0xb8
function function_a8219a727c620d1e(s_quest, n_spawns) {
    v_forward = vectornormalize(anglestoforward(self.angles)) * self.radius + self.origin;
    a_s_pts = function_b584f143ed0ec5d0(v_forward, n_spawns, self.radius);
    proximity_watcher(self);
    foreach (s_pt in a_s_pts) {
        s_quest zombie_spawn(s_pt, 0, 1);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ef6
// Size: 0xc9
function function_69bd847b57aaf41d() {
    a_s_spawns = getstructarray("zombie_ambient_tower_assault", "targetname");
    foreach (s_spawn in a_s_spawns) {
        a_zombies = function_7ea5453572655fab(s_spawn, function_73448c42e4da54e3(1), 1);
        foreach (zombie in a_zombies) {
            zombie thread function_a6ad68d6b07acf11(self);
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc7
// Size: 0x1d6
function function_26a51c18464ebae2() {
    flag_wait("wakeup");
    a_s_spawns = getstructarray("zombie_ambient_infil", "targetname");
    foreach (s_spawn in a_s_spawns) {
        if (isdefined(s_spawn.script_noteworthy) && s_spawn.script_noteworthy == "mangler") {
            var_fb98743d75ac80a0 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_spawner_zombie_mangler", s_spawn.origin, s_spawn.angles, "team_two_hundred");
            if (isdefined(var_fb98743d75ac80a0)) {
                var_fb98743d75ac80a0 namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
                var_fb98743d75ac80a0 thread attack_player(4000);
            }
        }
        a_zombies = function_7ea5453572655fab(s_spawn, 15, 0);
        foreach (zombie in a_zombies) {
            zombie thread function_a6ad68d6b07acf11(self);
        }
    }
    flag_wait("infil_rush");
    wait 5;
    var_82a6f259e309287e = getstructarray("infil_rush_pt", "targetname");
    foreach (s_spot in var_82a6f259e309287e) {
        var_24c1b984117168cd = namespace_5381a59d140f4df8::add_attractor(s_spot, 1, 3000, 0);
        if (isdefined(var_24c1b984117168cd)) {
            var_24c1b984117168cd thread function_5e9dcb918e174673(self);
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41a5
// Size: 0x20
function function_5e9dcb918e174673(s_quest) {
    s_quest flag_wait("drop_off");
    namespace_5381a59d140f4df8::remove_attractor(self);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41cd
// Size: 0x3c
function function_c4e6dd901fb283cf(s_quest) {
    self endon("death");
    thread attack_player(3000);
    s_quest flag_wait("players_disembarked");
    self notify("clear_attack");
    wait 1;
    self function_9322f3cb1cd4111a();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4211
// Size: 0xb7
function function_df436df126b4644(ai_merc) {
    var_f75ab33b14599ef5 = getstructarray("infil_mine", "targetname");
    foreach (s_mine in var_f75ab33b14599ef5) {
        if (isdefined(ai_merc)) {
            mine = namespace_64135de19550f047::function_908ec13fb4d6cede(s_mine.origin, undefined, ai_merc);
        }
        wait 1;
        if (isdefined(mine)) {
            mine.allowfriendlyfire = 1;
            self.a_mines[self.a_mines.size] = mine;
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d0
// Size: 0xaf
function function_82f03f7b5003b2e9() {
    var_4d54f56d6576df65 = getstruct("infil_mine_tunnel", "targetname");
    var_da3a55eabb666c32 = getaiarray("team_hundred_ninety");
    if (isdefined(var_da3a55eabb666c32) && var_da3a55eabb666c32.size) {
        mine = namespace_64135de19550f047::function_908ec13fb4d6cede(var_4d54f56d6576df65.origin, undefined, var_da3a55eabb666c32[0]);
    }
    flag_wait("tunnel_mine");
    wait 3;
    thread function_dffaa73b0cf0069f();
    if (isdefined(mine)) {
        mine notify("detonateExplosive");
    }
    wait 0.2;
    if (isdefined(self.barrel_tunnel)) {
        self.barrel_tunnel setscriptablepartstate("state", "explode");
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4387
// Size: 0x5c
function function_dffaa73b0cf0069f() {
    s_zombie = getstruct("tunnel_zombie", "script_noteworthy");
    for (i = 0; i < 2; i++) {
        ai_zombie = zombie_spawn(s_zombie, 0, 0);
        if (isdefined(ai_zombie)) {
            ai_zombie tunnel_zombie();
        }
        wait 1.5;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43eb
// Size: 0x18
function tunnel_zombie() {
    self endon("death");
    namespace_c45a18a82a9bca6b::function_9f7e53b0c8a95ee(1, self, "MOD_FIRE");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x440b
// Size: 0x19a
function function_166b8b1cf4563ddb() {
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("s_subbase_interior", "targetname"));
    thread function_a5b76e0f5024cc9a(getstruct("s_courtyard", "targetname"), "courtyard_interior", 4000);
    a_s_spawns = getstructarray("zombie_ambient_subbase", "targetname");
    foreach (s_spawn in a_s_spawns) {
        a_ai_zombies = function_7ea5453572655fab(s_spawn, int(function_73448c42e4da54e3() * 0.5), 1);
        foreach (ai_zombie in a_ai_zombies) {
            ai_zombie thread ai_aware(4000);
        }
    }
    self waittill("courtyard_interior");
    foreach (s_spawn in getstructarray("subbase_interior_guard", "targetname")) {
        ai_merc = s_spawn merc_spawn(array_random(self.var_ee3ea8d303c9025c));
        if (isdefined(ai_merc)) {
            ai_merc thread function_705ba97bcb60165f(s_spawn);
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45ad
// Size: 0x30
function function_705ba97bcb60165f(s_pt) {
    self endon("death");
    thread scripts\mp\ai_behavior::function_4c61a6fd42fa58(getstruct(s_pt.target, "targetname"));
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45e5
// Size: 0x9a
function function_d109f93f4609bfe0() {
    flag_wait("tower_activated");
    s_tower = getstruct("tower_radio", "targetname");
    a_ai_zombies = getaiarrayinradius(s_tower.origin, 3000, "team_two_hundred");
    foreach (ai_zombie in a_ai_zombies) {
        ai_zombie thread ai_aware(3000);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4687
// Size: 0x112
function function_9cf8db85d41361b9() {
    flag_wait("players_disembarked");
    var_c526816466cb748 = getstructarray("mimic_point_firehouse", "targetname");
    var_a7d607292b151567 = random(var_c526816466cb748);
    ai_mimic = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_spawner_zombie_mimic", var_a7d607292b151567.origin, var_a7d607292b151567.angles, "team_two_hundred");
    if (isdefined(ai_mimic)) {
        ai_mimic namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        namespace_6119efd5d1925c17::function_232cabbc43f9536(var_a7d607292b151567.origin, ai_mimic, undefined, 1, 200);
    }
    var_760f49b53b209495 = getstructarray("mimic_point_subbase", "targetname");
    var_e92ccff5ddfc9118 = random(var_760f49b53b209495);
    ai_mimic = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_spawner_zombie_mimic", var_e92ccff5ddfc9118.origin, var_e92ccff5ddfc9118.angles, "team_two_hundred");
    if (isdefined(ai_mimic)) {
        ai_mimic namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        namespace_6119efd5d1925c17::function_232cabbc43f9536(var_e92ccff5ddfc9118.origin, ai_mimic, undefined, 1, 200);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47a1
// Size: 0x1b2
function function_968199c59a40e7d7() {
    flag_wait("infil_rush");
    wait 5;
    a_s_spawners = getstructarray("merc_infil_reinforce", "targetname");
    var_4661c9a486253047 = ["jup_ob_enemy_basic_soldier_long", "jup_ob_enemy_basic_soldier_short"];
    n_active = 6;
    var_c3e372c13072cd80 = getstructarray("merc_infil", "targetname");
    foreach (s_infil in var_c3e372c13072cd80) {
        var_da3a55eabb666c32 = function_5e715be63f9f20de(s_infil, n_active);
        foreach (ai_merc in var_da3a55eabb666c32) {
            ai_merc thread function_6deadc04f0369507(array_random(var_4661c9a486253047), a_s_spawners, "infil_done");
        }
    }
    s_sniper = getstruct("merc_infil_sniper", "targetname");
    ai_sniper = s_sniper merc_spawn("jup_ob_enemy_specialist_sniper");
    if (isdefined(ai_sniper)) {
        ai_merc thread behavior_guard(s_sniper.origin, 100);
    }
    s_captain = getstruct("merc_infil_captain", "targetname");
    ai_captain = s_captain merc_spawn("jup_ob_enemy_specialist_captain");
    thread function_df436df126b4644(var_da3a55eabb666c32[0]);
    thread function_82f03f7b5003b2e9();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x495b
// Size: 0x87
function function_6deadc04f0369507(var_31109020393ed11b, a_s_spawners, str_endon) {
    level.var_54492f7bf0674200 endon(str_endon);
    var_4661c9a486253047 = ["jup_ob_enemy_basic_soldier_long", "jup_ob_enemy_basic_soldier_short"];
    self waittill("death");
    s_spawner = array_random(a_s_spawners);
    ai_merc = s_spawner merc_spawn(var_31109020393ed11b);
    if (isdefined(ai_merc)) {
        ai_merc thread function_6deadc04f0369507(array_random(var_4661c9a486253047), a_s_spawners, str_endon);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x49ea
// Size: 0x64
function zombie_respawn(var_82b85a4681c4251f, s_spawn_loc, str_endon) {
    level.var_54492f7bf0674200 endon(str_endon);
    var_31109020393ed11b = function_3710d6038aec505(var_82b85a4681c4251f);
    self waittill("death");
    ai_zombie = s_spawn_loc function_14e039b1ae1b318d(var_31109020393ed11b);
    if (isdefined(ai_zombie)) {
        ai_zombie thread zombie_respawn(var_31109020393ed11b, s_spawn_loc, str_endon);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a56
// Size: 0xa9
function function_14e039b1ae1b318d(var_31109020393ed11b) {
    var_f10d2bae0aa4fce7 = function_b584f143ed0ec5d0(self.origin, 1, self.radius);
    ai_zombie = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, var_f10d2bae0aa4fce7[0].origin, var_f10d2bae0aa4fce7[0].angles, "team_two_hundred", "difficulty_yellow");
    if (isdefined(ai_zombie)) {
        ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        if (isdefined(ai_zombie) && ai_zombie function_8fa69650e33c84ef("spawn")) {
            ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
        }
        return ai_zombie;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b07
// Size: 0x77
function function_3710d6038aec505(var_82b85a4681c4251f) {
    switch (var_82b85a4681c4251f) {
    case #"hash_4991b3feaad95740": 
        var_31109020393ed11b = "jup_spawner_zombie_hellhound";
        break;
    case #"hash_8a106081e93141a4": 
        var_31109020393ed11b = "jup_spawner_zombie_base";
        break;
    case #"hash_2c79a6e3e10b6266": 
        var_31109020393ed11b = "jup_spawner_zombie_base_armored_light";
        break;
    default: 
        var_31109020393ed11b = "jup_spawner_zombie_base";
        break;
    }
    return var_31109020393ed11b;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b87
// Size: 0xdd
function function_367231fc37094e7b() {
    var_69ed13f0558a23a7 = getstruct("tower_radio_interact", "targetname");
    s_tower = getstruct("tower_radio", "targetname");
    self.mdl_tower = utility::spawn_model("military_uav_tower_01", s_tower.origin, s_tower.angles);
    self.e_interact = namespace_5775ad2badedbcaa::register_interact(var_69ed13f0558a23a7.origin, 64, &tower_interact, %JUP_OB_OBJECTIVES/INTERACT_ACTIVATE);
    self.e_interact waittill("tower_done");
    self.e_interact delete();
    flag_set("tower_activated");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("ava_activated_uavTower");
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c6c
// Size: 0x83
function merc_outpost_sniper() {
    flag_wait("players_disembarked");
    s_spawner = getstruct("merc_outpost_sniper", "targetname");
    s_pos = getstruct("outpost_sniper_pos", "targetname");
    ai_merc = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_ob_enemy_specialist_sniper", s_spawner.origin, s_spawner.angles, "team_hundred_ninety");
    if (isdefined(ai_merc)) {
        ai_merc thread function_ef0a7624ee198fb5(s_pos);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf7
// Size: 0x6c
function function_ef0a7624ee198fb5(s_pos) {
    self endon("death");
    self.ignoreme = 1;
    scripts\common\ai::magic_bullet_shield();
    thread behavior_guard(s_pos.origin, 8);
    var_69ed13f0558a23a7 = getstruct("tower_radio_interact", "targetname");
    function_a5b76e0f5024cc9a(var_69ed13f0558a23a7, "tower_interact", 5000);
    scripts\common\ai::stop_magic_bullet_shield();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6b
// Size: 0x29e
function function_3a4979a2d7882196() {
    var_4661c9a486253047 = ["jup_ob_enemy_basic_soldier_long", "jup_ob_enemy_basic_soldier_short"];
    a_s_spawners = getstructarray("merc_outpost_guard", "targetname");
    for (i = 0; i < a_s_spawners.size; i++) {
        if (isdefined(a_s_spawners[i].script_noteworthy)) {
            if (a_s_spawners[i].script_noteworthy == "rpg") {
                self.s_rpg = a_s_spawners[i];
                var_31109020393ed11b = "jup_ob_enemy_basic_soldier_long";
            } else {
                var_31109020393ed11b = "jup_ob_enemy_specialist_" + a_s_spawners[i].script_noteworthy;
            }
        } else {
            var_31109020393ed11b = random(var_4661c9a486253047);
        }
        aitype = getdvar(@"hash_5254c3fbd200d7ee", var_31109020393ed11b);
        ai_merc = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(aitype, a_s_spawners[i].origin, a_s_spawners[i].angles, "team_hundred_ninety");
        if (isdefined(ai_merc)) {
            if (isdefined(a_s_spawners[i].script_noteworthy) && a_s_spawners[i].script_noteworthy == "sniper") {
                ai_merc.ignoreme = 1;
            }
            ai_merc thread function_a6ad68d6b07acf11(self);
            if (isdefined(a_s_spawners[i].script_noteworthy) && (a_s_spawners[i].script_noteworthy == "sniper" || a_s_spawners[i].script_noteworthy == "rocketeer")) {
                ai_merc thread behavior_guard(a_s_spawners[i].origin, 100);
                ai_merc thread function_a5edc0a1e822d97b();
            } else {
                ai_merc thread scripts\mp\ai_behavior::function_9bbf1713a14fa580(ai_merc, 64, 32, a_s_spawners[i].origin);
            }
            self.var_f84c04cd2ceb77b5[self.var_f84c04cd2ceb77b5.size] = ai_merc;
        }
    }
    foreach (ai_merc in self.var_f84c04cd2ceb77b5) {
        if (isalive(ai_merc)) {
            ai_merc scripts\common\ai::magic_bullet_shield();
        }
    }
    flag_wait("players_disembarked");
    foreach (ai_merc in self.var_f84c04cd2ceb77b5) {
        if (isalive(ai_merc)) {
            ai_merc scripts\common\ai::stop_magic_bullet_shield();
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5011
// Size: 0x140
function setup_barrels() {
    explosive_barrels = [];
    a_s_barrels = getstructarray("barrel_explosive", "targetname");
    foreach (s_barrel in a_s_barrels) {
        var_ca6d90a11ccbbf85 = spawnscriptable("barrel_toggleable_red", s_barrel.origin, s_barrel.angles);
        if (isdefined(var_ca6d90a11ccbbf85)) {
            namespace_134d54e39331ee45::activate_barrel(var_ca6d90a11ccbbf85);
            if (isdefined(s_barrel.script_noteworthy)) {
                self.barrel_tunnel = var_ca6d90a11ccbbf85;
            }
            if (isdefined(s_barrel.script_noteworthy) && s_barrel.script_noteworthy == "rooftop_barrel") {
                explosive_barrels[explosive_barrels.size] = var_ca6d90a11ccbbf85;
            }
        }
    }
    proximity_watcher(getstruct("tower_radio_interact", "targetname"));
    for (i = 0; i < explosive_barrels.size; i++) {
        if (isdefined(explosive_barrels[i])) {
            explosive_barrels[i] setscriptablepartstate("state", "explode");
            wait randomfloatrange(1.5, 3);
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5159
// Size: 0xde
function setup_mines() {
    while (!self.var_f84c04cd2ceb77b5.size) {
        wait 0.1;
    }
    self.a_mines = [];
    var_f75ab33b14599ef5 = getstructarray("sentry_mine", "targetname");
    foreach (s_mine in var_f75ab33b14599ef5) {
        wait randomfloat(1);
        mine = namespace_64135de19550f047::function_908ec13fb4d6cede(s_mine.origin, undefined, self.var_f84c04cd2ceb77b5[0]);
        wait 1;
        if (isdefined(mine)) {
            mine.allowfriendlyfire = 1;
            self.a_mines[self.a_mines.size] = mine;
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x523f
// Size: 0x66
function mine_detonate() {
    wait 5;
    if (!isdefined(self.a_mines)) {
        return;
    }
    for (i = 0; i < self.a_mines.size; i++) {
        if (isdefined(self.a_mines[i])) {
            self.a_mines[i] notify("detonateExplosive");
        }
        wait randomfloatrange(0.75, 2);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52ad
// Size: 0x68
function function_707d51c6800465c7() {
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("tower_radio_interact", "targetname"));
    thread function_9cf8db85d41361b9();
    thread function_804aa1cbd49ba400(getstructarray("merc_chopper_outpost", "targetname"));
    flag_wait("chopper_approach");
    level thread namespace_446fc987a980892f::playevent("quest_s0a1t7_merc_helicopters", level.players);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x531d
// Size: 0x6b
function function_25e754c30394817f() {
    switch (level.players.size) {
    case 1: 
        n_riders = 6;
        break;
    case 2: 
        n_riders = 6;
        break;
    case 3: 
        n_riders = 6;
        break;
    default: 
        n_riders = 6;
        break;
    }
    return n_riders;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5391
// Size: 0x56
function tower_interact(player) {
    level.var_54492f7bf0674200 flag_set("comms_interact");
    s_interact = getstruct("s_comm_tower", "targetname");
    s_interact namespace_872204d77e9872c0::function_678ea4319b42dfed(player);
    level thread function_3e4793d6623fc9e0();
    self notify("tower_done");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53ef
// Size: 0x40
function function_3e4793d6623fc9e0() {
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_activate_tower", level.players, 1, 1);
    level flag_set("jansen_coords");
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_activate_tower_2", level.players, 0, 1);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5437
// Size: 0x317
function script_model_anims() {
    level.scr_animtree["uav_tower"] = %script_model;
    level.scr_anim["uav_tower"]["use_uav_tower_enter"] = script_model%dmz_uav_tower_enter;
    level.scr_eventanim["uav_tower"]["use_uav_tower_enter"] = %"use_uav_tower_enter";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_enter"] = "dmz_uav_tower_enter";
    level.scr_anim["uav_tower"]["use_uav_tower_idle"] = script_model%dmz_uav_tower_idle;
    level.scr_eventanim["uav_tower"]["use_uav_tower_idle"] = %"use_uav_tower_idle";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_idle"] = "dmz_uav_tower_idle";
    level.scr_anim["uav_tower"]["use_uav_tower_exit"] = script_model%dmz_uav_tower_exit;
    level.scr_eventanim["uav_tower"]["use_uav_tower_exit"] = %"use_uav_tower_exit";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_exit"] = "dmz_uav_tower_exit";
    level.towerusetime = getdvarfloat(@"hash_401140680b9e3119", 1);
    level.var_6acf91bbf5273e8f = getdvarint(@"hash_bd581b3a13b81db8", 5000);
    level.var_39f69f7dfc40a323 = getdvarint(@"hash_e466d59282ecb790", 3000);
    level.var_ab2c4542c95656cb = getdvarint(@"hash_d6193a209d3948a4", 3);
    level.var_20ebe48820fd70a2 = getdvarint(@"hash_62ba9cf492c77f30", 40);
    level.var_c5bbb7914cb760cf = getdvarint(@"hash_25af310c5bc4bc7c", 3);
    level.var_eb56ea0bfdaa4011 = getdvarint(@"hash_4704cc015db60ad2", 3);
    level.var_174fe9ecce8fb96b = randomintrange(level.var_c5bbb7914cb760cf, level.var_eb56ea0bfdaa4011 + 1);
    level.var_8703df33a53750c6 = getdvarint(@"hash_f741c76d2b72d5c5", 1);
    level.var_81018c8d037da6c8 = getdvarint(@"hash_d78433447211bc33", 1);
    level.towercooldown = getmatchrulesdata("commonOption", "uavTowerCooldown");
    level.var_815479da1dafbdb0 = getdvarint(@"hash_45f42bcb4e5d758d", 1);
    level.var_66bf5bfca21a8d52 = getdvarint(@"hash_c7c9d45312dd7ec", 1);
    level.var_d507e35282b50614 = getdvarint(@"hash_87edec4ce0d7b969", 200);
    level.var_db9587440497015c = getdvarint(@"hash_86826c94b10ecab", 1);
    level.var_9f740c9281d0c7f4 = getdvarint(@"hash_5569456c0eff0d5b", 1);
    level.var_21da00da533a4de5 = getdvarint(@"hash_2d4b53ed39fc8215", 1);
    level.var_6bacc8cb646fa5cd = getdvarint(@"hash_21c230525b7cf2be", 1);
    level.var_4414dbbf9d80d75d = [];
    level.var_38c78bab762bfff6 = [];
    level.activetowers = [];
    level.uavtowers = [];
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5756
// Size: 0x10d
function tower_engagement() {
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("tower_radio", "targetname"));
    var_da3a55eabb666c32 = function_5e715be63f9f20de("merc_outpost_ground", 6);
    var_c63bd0ed83de244d = getstructarray("zombie_outpost", "targetname");
    foreach (s_spawnloc in var_c63bd0ed83de244d) {
        a_ai_zombies = function_7ea5453572655fab(s_spawnloc, function_73448c42e4da54e3(), 0, 1);
    }
    foreach (ai_zombie in a_ai_zombies) {
        if (isalive(ai_zombie)) {
            ai_zombie thread ai_aware(4000);
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x586b
// Size: 0x74
function tower_entry() {
    var_e8fddf5fbff00195 = getstructarray("building_entry", "targetname");
    level.var_8481b09f86090f95 = 0;
    foreach (s_entry in var_e8fddf5fbff00195) {
        s_entry thread function_771a10056b185b4e(self);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58e7
// Size: 0x57
function function_771a10056b185b4e(s_quest) {
    s_quest endon("tower_activated");
    self endon("entered_building");
    proximity_watcher(self);
    if (!level.var_8481b09f86090f95) {
        level.var_8481b09f86090f95 = 1;
        level thread namespace_446fc987a980892f::playevent("quest_s0a1t7_enter_tower", level.players);
    }
    self notify("entered_building");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5946
// Size: 0x114
function function_93ed60fe55d1bf3e() {
    self endon("tower_entered ");
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("tower_entry", "targetname"));
    a_s_spawners = getstructarray("tower_entry_guard", "targetname");
    var_490ca443f06fe6e6 = [];
    for (i = 0; i < a_s_spawners.size; i++) {
        if (isdefined(a_s_spawners[i].script_noteworthy)) {
            var_490ca443f06fe6e6[var_490ca443f06fe6e6.size] = a_s_spawners[i] thread merc_spawn("jup_ob_enemy_specialist_" + a_s_spawners[i].script_noteworthy);
        } else {
            var_490ca443f06fe6e6[var_490ca443f06fe6e6.size] = a_s_spawners[i] thread merc_spawn(array_random(self.var_ee3ea8d303c9025c));
        }
        wait 0.1;
    }
    if (isdefined(var_490ca443f06fe6e6[0])) {
        var_490ca443f06fe6e6[0] smoke_screen(getstruct("outpost_stairs_smoke", "targetname").origin);
    }
    level thread namespace_446fc987a980892f::playevent("quest_s0a1t7_stairwell_smoke", level.players, 1);
    self notify("tower_entered ");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a62
// Size: 0x97
function function_f1b16a36fd9df9fe() {
    self endon("tower_entered ");
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("tower_rooftop", "targetname"));
    a_s_spawners = getstructarray("rooftop_guard", "targetname");
    var_490ca443f06fe6e6 = [];
    for (i = 0; i < a_s_spawners.size; i++) {
        var_490ca443f06fe6e6[var_490ca443f06fe6e6.size] = a_s_spawners[i] thread merc_spawn(array_random(self.var_ee3ea8d303c9025c));
        wait 0.1;
    }
    self notify("tower_entered ");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b01
// Size: 0xcd
function tower_stairs() {
    self endon("tower_entered ");
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("tower_stairs", "targetname"));
    a_s_spawners = getstructarray("rooftop_guard", "targetname");
    var_490ca443f06fe6e6 = [];
    for (i = 0; i < a_s_spawners.size; i++) {
        if (isdefined(a_s_spawners[i].script_noteworthy)) {
            var_490ca443f06fe6e6[var_490ca443f06fe6e6.size] = a_s_spawners[i] thread merc_spawn("jup_ob_enemy_specialist_" + a_s_spawners[i].script_noteworthy);
        } else {
            var_490ca443f06fe6e6[var_490ca443f06fe6e6.size] = a_s_spawners[i] thread merc_spawn(array_random(self.var_ee3ea8d303c9025c));
        }
        wait 0.1;
    }
    self notify("tower_entered ");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bd6
// Size: 0x7c
function tower_captain() {
    proximity_watcher(getstruct("tower_entry_upstairs", "targetname"));
    s_spawner = getstruct("tower_entry_captain", "targetname");
    ai_merc = s_spawner thread merc_spawn("jup_ob_enemy_specialist_" + s_spawner.script_noteworthy);
    if (isdefined(ai_merc)) {
        ai_merc thread behavior_guard(s_spawner.origin, 100);
        ai_merc thread function_a5edc0a1e822d97b();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c5a
// Size: 0x2e0
function function_81152d7f8762edb() {
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("s_subbase_entry", "targetname"));
    var_3bd9c7c764cd027d = getstructarray("subbase_building_guard", "targetname");
    foreach (s_guard in var_3bd9c7c764cd027d) {
        if (isdefined(s_guard.script_noteworthy)) {
            var_31109020393ed11b = "jup_ob_enemy_specialist_" + s_guard.script_noteworthy;
            ai_guard = s_guard merc_spawn(var_31109020393ed11b);
        }
        ai_guard = s_guard merc_spawn(array_random(self.var_ee3ea8d303c9025c));
    }
    var_9ccf3f46133c3105 = getstruct("subbase_building_tower", "targetname");
    var_9ccf3f46133c3105 thread merc_spawn("jup_ob_enemy_specialist_sniper");
    thread function_a5b76e0f5024cc9a(getstruct("s_subbase_entry", "targetname"), "subbase_entry");
    a_s_spawners = getstructarray("subbase_entry_guard", "targetname");
    foreach (s_spawner in a_s_spawners) {
        var_da3a55eabb666c32 = function_5e715be63f9f20de(s_spawner, 8);
        foreach (ai_merc in var_da3a55eabb666c32) {
            ai_merc thread function_6deadc04f0369507(array_random(self.var_ee3ea8d303c9025c), getstructarray("subbase_entry_respawn", "targetname"), "subbase_entry");
        }
    }
    var_c63bd0ed83de244d = getstructarray("zombie_subbase_entry", "targetname");
    foreach (s_spawnloc in var_c63bd0ed83de244d) {
        a_ai_zombies = function_7ea5453572655fab(s_spawnloc, 6, 1);
        foreach (ai_zombie in a_ai_zombies) {
            ai_zombie thread zombie_respawn(ai_zombie.agent_type, s_spawnloc, "subbase_entry");
        }
    }
    level flag_set("story_quest_complete_step_1");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f42
// Size: 0x251
function function_ba543323950453aa() {
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("s_subbase", "targetname"));
    thread function_a5b76e0f5024cc9a(getstruct("s_subbase", "targetname"), "subbase_entered", 4000);
    var_47b02dbbc6990b0b = getstructarray("subbase_guard", "targetname");
    foreach (s_merc in var_47b02dbbc6990b0b) {
        var_da3a55eabb666c32 = function_5e715be63f9f20de(s_merc, 3);
        foreach (ai_merc in var_da3a55eabb666c32) {
            ai_merc thread function_6deadc04f0369507(array_random(self.var_ee3ea8d303c9025c), getstructarray("subbase_entry_respawn", "targetname"), "subbase_entered");
        }
    }
    var_f75ab33b14599ef5 = getstructarray("subbase_mine", "targetname");
    for (i = 0; i < var_f75ab33b14599ef5.size; i++) {
        wait randomfloat(1);
        var_92d4ce54ed9b75fd = undefined;
        while (!isdefined(var_92d4ce54ed9b75fd)) {
            var_92d4ce54ed9b75fd = array_random(var_da3a55eabb666c32);
            if (isalive(var_92d4ce54ed9b75fd)) {
                break;
            }
            waitframe();
        }
        mine = namespace_64135de19550f047::function_908ec13fb4d6cede(var_f75ab33b14599ef5[i].origin, undefined, var_92d4ce54ed9b75fd);
        wait 2;
        if (isdefined(mine)) {
            mine.allowfriendlyfire = 1;
        }
    }
    var_c63bd0ed83de244d = getstructarray("zombie_subbase", "targetname");
    var_5ed57d0baaed88f9 = array_random(var_c63bd0ed83de244d);
    var_5ed57d0baaed88f9 thread spawn_mangler();
    foreach (s_spawnloc in var_c63bd0ed83de244d) {
        function_7ea5453572655fab(s_spawnloc, function_73448c42e4da54e3(), 1);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x619b
// Size: 0x284
function dock_engagement() {
    flag_wait("players_disembarked");
    var_2252b33747fd0598 = getstructarray("s_pier", "targetname");
    foreach (s_pier in var_2252b33747fd0598) {
        s_pier thread function_842494f2ffb0f18d(self);
    }
    flag_wait("pier_approach");
    thread proximity_notify(getstruct("pier_entry", "targetname"), "pier_entry");
    var_fdbc62a2eb9677f = getstructarray("pier_guard", "targetname");
    var_8d226ab25b468a08 = getstructarray("pier_guard_reinforcement", "targetname");
    foreach (s_merc in var_fdbc62a2eb9677f) {
        var_da3a55eabb666c32 = function_5e715be63f9f20de(s_merc, 4);
        foreach (ai_merc in var_da3a55eabb666c32) {
            if (isalive(ai_merc)) {
                ai_merc thread function_6deadc04f0369507(array_random(self.var_ee3ea8d303c9025c), var_8d226ab25b468a08, "pier_entry");
            }
        }
    }
    var_c63bd0ed83de244d = getstructarray("zombie_pier", "targetname");
    foreach (s_spawnloc in var_c63bd0ed83de244d) {
        a_ai_zombies = function_7ea5453572655fab(s_spawnloc, 5, 1);
        foreach (ai_zombie in a_ai_zombies) {
            ai_zombie thread zombie_respawn(ai_zombie.agent_type, s_spawnloc, "pier_entry");
        }
    }
    var_5ed57d0baaed88f9 = array_random(var_c63bd0ed83de244d);
    var_5ed57d0baaed88f9 thread spawn_mangler();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6427
// Size: 0xd2
function proximity_notify(s_spot, str_notify) {
    if (!isdefined(s_spot.radius)) {
        n_dist = 250000;
    } else {
        n_dist = squared(s_spot.radius);
    }
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distance2dsquared(s_spot.origin, player.origin) < n_dist) {
                    self notify(str_notify);
                    return;
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6501
// Size: 0x5a
function function_d95626b24483d40e() {
    self endon("death");
    while (true) {
        a_ai_zombies = getaiarrayinradius(self.origin, 2000, "team_two_hundred");
        if (!isdefined(a_ai_zombies)) {
            break;
        }
        if (isdefined(a_ai_zombies) && a_ai_zombies.size < 1) {
            break;
        }
        wait 1;
    }
    thread ai_aware(2000);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6563
// Size: 0x2e
function function_842494f2ffb0f18d(s_quest) {
    self endon("pier_approach");
    proximity_watcher(self);
    flag_set("pier_approach");
    self notify("pier_approach");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6599
// Size: 0x299
function courtyard_engagement() {
    flag_wait("players_disembarked");
    proximity_watcher(getstruct("s_courtyard", "targetname"));
    thread function_a5b76e0f5024cc9a(getstruct("s_courtyard", "targetname"), "courtyard_entry", 2500);
    var_fdbc62a2eb9677f = getstructarray("courtyard_guard", "targetname");
    foreach (s_merc in var_fdbc62a2eb9677f) {
        var_31109020393ed11b = random(self.var_ee3ea8d303c9025c);
        if (isdefined(s_merc.script_noteworthy)) {
            var_da3a55eabb666c32 = function_5e715be63f9f20de(s_merc, 1);
            foreach (ai_merc in var_da3a55eabb666c32) {
                if (isdefined(ai_merc)) {
                    ai_merc thread behavior_guard(s_merc.origin, 100);
                    ai_merc thread function_a5edc0a1e822d97b();
                    ai_merc thread function_6deadc04f0369507(array_random(self.var_ee3ea8d303c9025c), getstructarray("courtyard_guard_respawn", "targetname"), "courtyard_entry");
                }
            }
            continue;
        }
        var_da3a55eabb666c32 = function_5e715be63f9f20de(s_merc, 8);
        foreach (ai_merc in var_da3a55eabb666c32) {
            ai_merc thread function_6deadc04f0369507(array_random(self.var_ee3ea8d303c9025c), getstructarray("courtyard_guard_respawn", "targetname"), "courtyard_entry");
        }
    }
    s_spawn = getstruct("zombie_courtyard", "targetname");
    a_ai_zombies = function_7ea5453572655fab(s_spawn, 6, 0);
    foreach (ai_zombie in a_ai_zombies) {
        ai_zombie thread zombie_respawn(ai_zombie.agent_type, s_spawn, "courtyard_entry");
    }
    proximity_watcher(getstruct("s_courtyard_entry", "targetname"));
    thread function_185e53a9f62133b4();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x683a
// Size: 0x64
function zombie_setup(str_loc) {
    self endon("death");
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.ignore_nuke = 1;
    proximity_watcher(getstruct(str_loc, "targetname"));
    self.ignoreme = 0;
    self.ignoreall = 0;
    self.ignore_nuke = 0;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68a6
// Size: 0x88
function function_185e53a9f62133b4() {
    self endon("courtyard_done");
    n_spawns = 0;
    n_total = function_d5027e6e46ac2ace() * 2;
    var_c6e42f4c295786d2 = getstructarray("zombie_courtyard_support", "targetname");
    while (true) {
        s_spawnpt = array_random(var_c6e42f4c295786d2);
        ai_zombie = zombie_spawn(s_spawnpt, 1);
        if (isdefined(ai_zombie)) {
            n_spawns++;
            if (n_spawns >= n_total) {
                self notify("courtyard_done");
            }
        }
        wait 1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6936
// Size: 0x107
function ava_spawn() {
    flag_wait("tower_activated");
    s_ava = getstruct("ava_model", "targetname");
    self.var_2ada333c838a2316 = undefined;
    while (!isdefined(self.var_2ada333c838a2316)) {
        self.var_2ada333c838a2316 = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_ally_ava_base", s_ava.origin, s_ava.angles, "allies");
        waitframe();
    }
    self.var_2ada333c838a2316 forcenetfieldhighlod(1);
    self.var_2ada333c838a2316.var_69b049cf4b18c73b = 1;
    self.var_2ada333c838a2316 thread function_dcaa7c5b6871bf98(self);
    self.var_2ada333c838a2316 thread function_e6fba762c142fad4(self);
    self.var_2ada333c838a2316.var_9f009877c3bea958 = 1;
    self.var_2ada333c838a2316 setscriptablepartstate("minimap", "active");
    self.s_comm = getstruct("ava_comm", "targetname");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a45
// Size: 0xe5
function function_dcaa7c5b6871bf98(s_quest) {
    self endon("death");
    s_quest endon("ava_go");
    self.var_5800fdbb6bec4c73 = getstruct("ava_computer_tag_align", "targetname");
    self.var_5800fdbb6bec4c73 thread scripts\common\scene::play(self, "ava_typing_idle", "jup_cin_zm_vig_s0_act1_quest_ava_computer");
    wait 1;
    mdl_scene = self.var_5800fdbb6bec4c73.scenedata.var_214d924f4e137244[1].entity;
    v_org = mdl_scene.origin;
    v_ang = mdl_scene.angles;
    var_4ca09653a3c1488a = spawnscriptable("ob_ava_computer", v_org, v_ang);
    var_4ca09653a3c1488a setscriptablepartstate("state", "visible");
    wait 0.1;
    mdl_scene hide();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b32
// Size: 0xe1
function function_5904ee3f83f622ba() {
    self endon("death");
    self.var_2ada333c838a2316 notify("board");
    s_start = getstruct("ava_helipad_end", "script_noteworthy");
    s_board = getstruct("ava_helipad_board", "script_noteworthy");
    self.var_2ada333c838a2316 setgoalpos(s_board.origin, 4);
    msg = self.var_2ada333c838a2316 waittill_any_timeout_2(5, "goal");
    self.ava_chopper scene::play(self.var_2ada333c838a2316, "ava_exfil_entry_f", "jup_cin_zm_vig_s0_act1_quest_ava_exfil_entry");
    self.ava_chopper thread scene::play(self.var_2ada333c838a2316, "ava_exfil_entry_idle", "jup_cin_zm_vig_s0_act1_quest_ava_exfil_entry");
    wait 1;
    flag_set("ava_seated");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c1b
// Size: 0x2d1
function function_e6fba762c142fad4(s_quest) {
    self endon("death");
    self endon("helipad");
    self.health = 1000;
    if (isdefined(level.players[0])) {
        self.team = level.players[0].team;
    }
    self.ignoreall = 1;
    self.ignoreme = 1;
    scripts\common\ai::magic_bullet_shield();
    self setgoalpos(self.origin, 4);
    thread function_e7e794b8f5df5ba2();
    s_quest flag_wait("ava_go");
    s_quest notify("ava_go");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("ava_defended");
    }
    if (s_quest.var_1c67ae607a61c6bb) {
        s_quest namespace_262d6474998a2356::function_24d7e633e4a9c5c8(100, undefined, level.players);
        s_quest namespace_262d6474998a2356::function_5f6fd55a55ffbc6c(100, level.players);
    }
    wait 1;
    self.var_5800fdbb6bec4c73 scripts\common\scene::stop();
    self.ignoreall = 0;
    self.ignoreme = 0;
    s_start = getstruct("ava_goal", "targetname");
    s_goal = getstruct("ava_outside", "targetname");
    self setgoalpos(s_start.origin, 16);
    waittill_any_timeout_2(5, "goal");
    self setgoalpos(s_goal.origin, 16);
    waittill_any_timeout_2(5, "goal");
    thread behavior_guard(s_goal.origin, 16);
    thread function_c5c7ffe1d92cd484();
    thread function_20f1139466345bf3();
    thread function_18c29cc704cb571f();
    flag_wait("player_close");
    s_start = s_goal;
    s_goal = getstruct(s_goal.target, "targetname");
    setmusicstate("mx_jup_ob_q_energy_medium");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT1_DEFEND_MERCS", level.players);
    while (true) {
        self setgoalpos(s_goal.origin, 4);
        msg = waittill_any_timeout_2(20, "goal");
        if (msg != "reached") {
            self forceteleport(s_goal.origin, s_goal.angles);
            self notify("teleported");
        } else {
            thread behavior_guard(s_goal.origin, 16);
        }
        if (isdefined(s_goal.script_noteworthy)) {
            thread function_c71a8f0ae166b4c3(s_goal);
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
            continue;
        }
        break;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ef4
// Size: 0xad
function function_ed6f3e8d1b1ed54a(s_goal) {
    self notify("wander");
    level.var_54492f7bf0674200 endon("ava_helipad");
    self endon("death");
    self endon("wander");
    self endon("board");
    self endon("helipad");
    self endon("reached");
    self endon("teleported");
    v_goal = function_a6ca9a67e26dba6c(s_goal);
    n_goal_rad = squared(128);
    while (true) {
        self setgoalpos(v_goal, 128);
        wait 1;
        if (distancesquared(self.origin, v_goal) <= n_goal_rad) {
            self notify("reached");
            continue;
        }
        v_goal = function_a6ca9a67e26dba6c(s_goal);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fa9
// Size: 0x70
function function_c5c7ffe1d92cd484() {
    self notify("player_check");
    self endon("death");
    self endon("player_close");
    self endon("player_check");
    while (true) {
        player = getclosest(self.origin, level.players, 250);
        if (isalive(player)) {
            self notify("release");
            flag_set("player_close");
        }
        wait 0.1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7021
// Size: 0x49
function function_a6ca9a67e26dba6c(s_goal) {
    v_pos = self getclosestreachablepointonnavmesh(s_goal.origin);
    if (isdefined(v_pos)) {
        v_goal = v_pos;
    } else {
        v_goal = s_goal.origin;
    }
    return v_goal;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7073
// Size: 0xe3
function function_18c29cc704cb571f() {
    var_72197e516436cc5c = getstructarray("ava_at_door", "script_noteworthy");
    foreach (s_door in var_72197e516436cc5c) {
        s_door.a_doors = [];
        doors = namespace_f6368c72597c6d90::function_ad1b6accbaab404e(s_door, s_door.a_doors, "ava_door", 0);
        foreach (door in doors) {
            if (door scriptabledoorisclosed()) {
                door scriptabledooropen();
            }
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x715e
// Size: 0x14
function function_20f1139466345bf3() {
    self endon("death");
    wait 30;
    self notify("release");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x717a
// Size: 0x6d
function function_7d30ea5abff206b3(s_goal) {
    self notify("failsafe_active");
    self endon("death");
    self endon("goal");
    self endon("failsafe_active");
    self endon("board");
    self endon("helipad");
    self endon("reached");
    wait 30;
    self notify("teleported");
    self forceteleport(s_goal.origin, s_goal.angles);
    self notify("reached");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71ef
// Size: 0x152
function function_c71a8f0ae166b4c3(s_goal) {
    switch (s_goal.script_noteworthy) {
    case #"hash_ca5b10ae04f83da4": 
        flag_set("no_stopping");
        level.var_54492f7bf0674200 thread function_49ab35bd0de0200a();
        break;
    case #"hash_1c96de0ebbe1c7b9": 
        level.var_54492f7bf0674200 thread merc_escort();
        break;
    case #"hash_c58358037fb30ce5": 
        level thread namespace_446fc987a980892f::playconversation("quest_s0a1t7_helipad_holdout", level.players, 0, 1);
        break;
    case #"hash_bb1acfc05ac8a9cf": 
        level.var_54492f7bf0674200 flag_set("ava_helipad");
        break;
    case #"hash_549ded1c0b52b5c": 
        level.var_54492f7bf0674200 thread function_aaaeffbc76cddf72();
        break;
    case #"hash_560f570cbc31032f": 
        level thread namespace_446fc987a980892f::playevent("quest_s0a1t7_escort_jansen_pause1", level.players);
        break;
    case #"hash_21f195297b30dcd1": 
        level thread namespace_446fc987a980892f::playevent("quest_s0a1t7_escort_jansen_pause2", level.players);
        wait 5;
        break;
    case #"hash_e06704d35db30cb5": 
        self notify("helipad");
        thread behavior_guard(s_goal.origin, 32);
        break;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7349
// Size: 0x84
function merc_escort() {
    n_spawns = function_ee63d6fa5d4d6e87();
    n_spawned = 0;
    while (n_spawned < n_spawns) {
        s_merc = function_254323e1a248db9a(getstructarray("merc_escort", "targetname"));
        if (isdefined(s_merc)) {
            ai_merc = s_merc merc_spawn(array_random(self.var_ee3ea8d303c9025c));
            if (isdefined(ai_merc)) {
                n_spawned++;
                ai_merc thread merc_attack();
            }
        }
        wait 0.5;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x73d5
// Size: 0x18b
function function_e7e794b8f5df5ba2() {
    self endon("death");
    s_door = getstruct("ava_door", "targetname");
    var_1832389abbb68924 = getstruct("ava_goal", "targetname");
    a_doors = [];
    door1 = namespace_f6368c72597c6d90::function_ad1b6accbaab404e(var_1832389abbb68924, a_doors, "fortress", 0);
    door2 = namespace_f6368c72597c6d90::function_ad1b6accbaab404e(s_door, a_doors, "fortress", 0);
    foreach (door in door1) {
        if (!door scriptabledoorisclosed()) {
            door scriptabledoorclose();
        }
        namespace_f6368c72597c6d90::function_fbbfe6f05eda5eb1(door);
    }
    foreach (door in door2) {
        if (!door scriptabledoorisclosed()) {
            door scriptabledoorclose();
        }
        namespace_f6368c72597c6d90::function_fbbfe6f05eda5eb1(door);
    }
    level.var_54492f7bf0674200 flag_wait("ava_go");
    foreach (door in door1) {
        namespace_f6368c72597c6d90::function_b092780f9ec4496e(door);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7568
// Size: 0x122
function function_cbc88994059ada5(n_radius) {
    self endon("death");
    n_dist_sq = squared(n_radius);
    n_counter = 0;
    while (true) {
        var_da3a55eabb666c32 = getaiarrayinradius(self.origin, n_radius, "team_hundred_ninety");
        a_ai_zombies = getaiarrayinradius(self.origin, n_radius, "team_two_hundred");
        a_ai_enemies = array_combine(var_da3a55eabb666c32, a_ai_zombies);
        var_da3a55eabb666c32 = [];
        foreach (ai_merc in a_ai_enemies) {
            if (isalive(ai_merc)) {
                if (distancesquared(self.origin, ai_merc.origin) <= n_dist_sq) {
                    var_da3a55eabb666c32[var_da3a55eabb666c32.size] = ai_merc;
                }
            }
        }
        if (!isdefined(var_da3a55eabb666c32)) {
            return;
        }
        if (isdefined(var_da3a55eabb666c32) && var_da3a55eabb666c32.size < 1) {
            return;
        }
        wait 0.25;
        n_counter++;
        if (n_counter > 20) {
            return;
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7692
// Size: 0xc9
function function_49ab35bd0de0200a() {
    a_s_spawners = getstructarray("zombie_escort", "targetname");
    foreach (s_spawner in a_s_spawners) {
        a_ai_zombies = function_7ea5453572655fab(s_spawner, function_d5027e6e46ac2ace(), 0, 1);
        foreach (ai_zombie in a_ai_zombies) {
            ai_zombie ai_aware(3000);
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7763
// Size: 0x146
function function_aaaeffbc76cddf72() {
    var_c6e42f4c295786d2 = getstructarray("zombie_helipad", "targetname");
    n_zombies = function_93ef9151abe5a399();
    for (i = 0; i < n_zombies; i++) {
        wait randomfloatrange(0.05, 0.25);
        s_zombie = array_random(var_c6e42f4c295786d2);
        ai_zombie = zombie_spawn(s_zombie, 1, 0);
    }
    s_helipad = getstruct("s_helipad", "targetname");
    self.var_2ada333c838a2316 function_1ea1425ea7332478(s_helipad);
    flag_wait("evacuate");
    s_helipad.attractor = namespace_5381a59d140f4df8::add_attractor(s_helipad, 1, 5000, 0, undefined, &function_b38f0b92e2bc5fdb);
    var_509d7d169e04b11f = getstructarray("zombie_helipad_horde", "targetname");
    foreach (var_7a6ea3d91b32f0eb in var_509d7d169e04b11f) {
        a_ai_zombies = function_7ea5453572655fab(var_7a6ea3d91b32f0eb, 60, 0, 1);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78b1
// Size: 0x80
function function_b38f0b92e2bc5fdb(attractor, zombie) {
    if (distance2dsquared(zombie.origin, attractor.source.origin) < 1000000 && !isdefined(zombie.var_33e9b8b06770859a)) {
        zombie.var_33e9b8b06770859a = 1;
        zombie thread attack_player(1500);
        return false;
    }
    if (isdefined(zombie.var_33e9b8b06770859a)) {
        return false;
    }
    return true;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x793a
// Size: 0x5b
function function_1ea1425ea7332478(s_loc) {
    self endon("death");
    n_dist = squared(s_loc.radius);
    while (true) {
        if (distancesquared(s_loc.origin, self.origin) < n_dist) {
            return;
        }
        wait 0.1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x799d
// Size: 0xd8
function function_8f13615465f68ee() {
    self endon("ava_seated");
    flag_wait("ava_helipad");
    proximity_watcher(getstruct("helipad_watcher", "targetname"));
    thread function_7b8fb231d12e4259();
    thread function_b73cbb48a2997167();
    var_c6e42f4c295786d2 = getstructarray("zombie_helipad_defend", "targetname");
    n_zombies = function_93ef9151abe5a399();
    while (true) {
        var_c6e42f4c295786d2 = array_randomize(var_c6e42f4c295786d2);
        for (i = 0; i < var_c6e42f4c295786d2.size; i++) {
            if (self.n_defend < n_zombies) {
                ai_zombie = zombie_spawn(var_c6e42f4c295786d2[i], 1, 1);
                if (isdefined(ai_zombie)) {
                    self.n_defend++;
                    ai_zombie thread zombie_death_watcher(self);
                }
            }
            wait 0.1;
        }
        wait 1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a7d
// Size: 0x11
function function_7b8fb231d12e4259() {
    wait 30;
    flag_set("evacuate");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a96
// Size: 0xf9
function watch_defend() {
    self endon("defend_done");
    proximity_watcher(getstruct("ava_comm", "targetname"));
    flag_set("ava_located");
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
    setmusicstate("");
    foreach (player in level.players) {
        player callback::callback("ava_located");
    }
    self.var_2ada333c838a2316 thread function_3b0e39fb737b1bc0();
    self.var_2ada333c838a2316 waittill("start");
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT1_ZOMBIE_DEFEND", level.players);
    setmusicstate("mx_jup_ob_worldboss_2");
    thread zombie_docks();
    thread function_34fdc8fb3881db53();
    thread function_e64fc61cbee31134();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b97
// Size: 0xbb
function function_9f308a99617d2c20(s_pos) {
    if (!isdefined(s_pos.radius)) {
        n_radius = 500;
    } else {
        n_radius = s_pos.radius;
    }
    var_2d5b80c94b21ea0e = getplayersinradius(s_pos.origin, n_radius);
    var_8d779aa90bd160ad = [];
    foreach (player in level.players) {
        if (!array_contains(var_2d5b80c94b21ea0e, player)) {
            var_8d779aa90bd160ad[var_8d779aa90bd160ad.size] = player;
        }
    }
    return var_8d779aa90bd160ad;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c5b
// Size: 0x5e
function function_3b0e39fb737b1bc0() {
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_approach_jansen", level.players, 0, 1);
    self notify("start");
    wait 0.5;
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_jansen_defend", level.players, 0, 1);
    wait 2.5;
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_jansen_progress_50", level.players, 0, 1);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cc1
// Size: 0x1c7
function function_e64fc61cbee31134() {
    self.var_1c67ae607a61c6bb = 1;
    self.var_40b691c0a6852f73 = [];
    self.var_14a8920a25d8a7a1 = [];
    namespace_e82a1efb852543c9::function_4d1de11b1a5630ec(self);
    namespace_e82a1efb852543c9::addcallback(&function_6fe8aa8dfb9111eb);
    foreach (player in level.players) {
        namespace_262d6474998a2356::function_24d7e633e4a9c5c8(0, undefined, level.players);
        namespace_262d6474998a2356::function_5f6fd55a55ffbc6c(0, level.players);
    }
    self.n_percent = 0;
    n_progress = int(1.66667);
    n_percent = n_progress;
    var_53dc8bda971f857f = 0;
    var_53ea1ada972ed481 = 0;
    while (true) {
        if (flag("ava_go")) {
            break;
        }
        namespace_262d6474998a2356::function_24d7e633e4a9c5c8(n_percent, undefined, level.players);
        namespace_262d6474998a2356::function_5f6fd55a55ffbc6c(n_percent, level.players);
        n_percent += n_progress;
        if (n_percent >= 85 && !var_53ea1ada972ed481) {
            var_53ea1ada972ed481 = 1;
            self.var_2ada333c838a2316 thread function_d05b59450a9aa51d();
        }
        if (n_percent >= 100) {
            break;
        }
        wait 1;
    }
    namespace_262d6474998a2356::function_24d7e633e4a9c5c8(100, undefined, level.players);
    namespace_262d6474998a2356::function_5f6fd55a55ffbc6c(100, level.players);
    wait 1;
    flag_set("ava_go");
    thread merc_window();
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_jansen_defend_done", level.players, 0, 1);
    wait 1;
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_jansen_emerges", level.players, 0, 1);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e90
// Size: 0x21
function function_d02ad2450a651ffb() {
    self endon("death");
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_jansen_progress_50", level.players, 0, 1);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7eb9
// Size: 0x21
function function_d05b59450a9aa51d() {
    self endon("death");
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_jansen_progress_85", level.players, 0, 1);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ee2
// Size: 0xd
function defend_timer() {
    wait 60;
    self notify("defend_done");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ef7
// Size: 0xa9
function zombie_docks() {
    self endon("defend_done");
    var_c6e42f4c295786d2 = getstructarray("zombie_docks", "targetname");
    var_c6e42f4c295786d2 = array_randomize(var_c6e42f4c295786d2);
    self.var_64ba305be127e7dc = function_d5027e6e46ac2ace();
    n_index = 0;
    while (true) {
        if (self.n_defend < self.var_64ba305be127e7dc) {
            ai_zombie = zombie_spawn(var_c6e42f4c295786d2[n_index], 1, 1);
            if (isdefined(ai_zombie)) {
                self.n_defend++;
                ai_zombie thread zombie_death_watcher(self);
                n_index++;
                if (n_index >= var_c6e42f4c295786d2.size) {
                    n_index = 0;
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fa8
// Size: 0x61
function function_34fdc8fb3881db53() {
    wait int(15);
    function_804aa1cbd49ba400(getstructarray("merc_chopper_reinforcement", "targetname"));
    wait 2;
    thread defend_timer();
    thread merc_assault();
    thread function_382e11e69e6f60d3();
    wait 15;
    function_804aa1cbd49ba400(getstructarray("merc_chopper", "targetname"));
    level notify("story_quest_complete_step_2");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8011
// Size: 0x8f
function merc_assault() {
    n_mercs = function_25e754c30394817f();
    for (i = 0; i < n_mercs; i++) {
        s_spawner = function_254323e1a248db9a(getstructarray("merc_assault", "targetname"));
        ai_merc = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_ob_enemy_basic_specialforce_short", s_spawner.origin, s_spawner.angles, "team_hundred_ninety");
        if (isdefined(ai_merc)) {
            ai_merc thread merc_attack();
        }
        wait 0.5;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80a8
// Size: 0x20
function function_382e11e69e6f60d3() {
    self endon("merc_reinforce");
    wait 15;
    flag_set("merc_reinforce");
    self notify("merc_reinforce");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80d0
// Size: 0x8a
function function_5b22fa0f624d2ae4() {
    self endon("death");
    a_ai_zombies = getaiarrayinradius(self.origin, 2000, "team_two_hundred");
    var_da3a55eabb666c32 = getaiarrayinradius(self.origin, 2000, "team_hundred_ninety");
    a_ai_enemies = array_combine(a_ai_zombies, var_da3a55eabb666c32);
    for (i = 0; i < a_ai_enemies.size; i++) {
        if (isalive(a_ai_enemies[i])) {
            a_ai_enemies[i] kill();
        }
        waitframe();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8162
// Size: 0x79
function behavior_goto(origin, n_radius) {
    self endon("death");
    self endon("reached");
    self endon("teleported");
    n_radius_sq = n_radius * n_radius;
    v_org = getclosestpointonnavmesh(origin);
    while (true) {
        if (distancesquared(v_org, self.origin) > n_radius_sq) {
            self setgoalpos(v_org);
        } else {
            self notify("reached");
        }
        wait 2;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x81e3
// Size: 0x98
function behavior_guard(origin, n_radius) {
    self endon("death");
    self endon("teleported");
    self endon("board");
    self endon("release");
    self endon("player_close");
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    if (isdefined(n_radius)) {
        n_goal_radius = n_radius;
    } else {
        n_goal_radius = 32;
    }
    while (true) {
        if (isdefined(origin) && distancesquared(origin, self.origin) > 256) {
            self setgoalpos(origin, 8);
            self waittill("goal");
        }
        wait 2;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8283
// Size: 0x2e
function function_a5edc0a1e822d97b() {
    self endon("death");
    self endon("combat");
    waittill_any_3("damage", "bulletwhizby", "grenade danger");
    self notify("combat");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82b9
// Size: 0x3c
function merc_spawn(var_31109020393ed11b) {
    ai_merc = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, self.origin, self.angles, "team_hundred_ninety");
    if (isdefined(ai_merc)) {
        return ai_merc;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82fd
// Size: 0xd5
function merc_window() {
    proximity_watcher(getstruct("merc_window_watcher", "targetname"));
    a_s_spawners = getstructarray("merc_window_spawn", "targetname");
    foreach (s_spawn in a_s_spawners) {
        ai_merc = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(array_random(self.var_ee3ea8d303c9025c), s_spawn.origin, s_spawn.angles, "team_hundred_ninety");
        if (isdefined(ai_merc)) {
            ai_merc thread scripts\mp\ai_behavior::function_4c61a6fd42fa58(getstruct(s_spawn.target, "targetname"));
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83da
// Size: 0x92
function merc_attack() {
    self endon("death");
    self endon("clear_attack");
    self endon("goal");
    self.goalradius = randomintrange(800, 1500);
    while (true) {
        player = getclosest(self.origin, level.players);
        if (isalive(player)) {
            pos_on_navmesh = getclosestpointonnavmesh(player.origin);
            if (isdefined(pos_on_navmesh)) {
                self setgoalpos(pos_on_navmesh);
                thread function_ea9c9fa94fbf39f1();
            }
        }
        wait 8;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8474
// Size: 0x28
function function_ea9c9fa94fbf39f1() {
    self notify("new_target");
    self endon("death");
    self endon("new_target");
    self waittill("goal");
    self notify("clear_attack");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84a4
// Size: 0xa0
function function_254323e1a248db9a(a_s_spawners) {
    while (true) {
        b_can_see = 0;
        s_spawner = array_random(a_s_spawners);
        foreach (player in level.players) {
            if (player player_looking_at(s_spawner.origin)) {
                b_can_see = 1;
            }
        }
        if (!b_can_see) {
            return s_spawner;
        }
        wait 0.1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x854c
// Size: 0xa7
function function_d9f63cad62a5df8e(s_quest, var_31109020393ed11b) {
    self waittill("death");
    if (var_31109020393ed11b == "jup_ob_enemy_specialist_heavytactician" && self.n_heavy > 0) {
        self.n_heavy--;
        return;
    }
    if (var_31109020393ed11b == "jup_ob_enemy_specialist_rusher" && self.n_rusher > 0) {
        self.n_rusher--;
        return;
    }
    if (var_31109020393ed11b == "jup_ob_enemy_specialist_captain" && self.n_captain > 0) {
        self.n_captain--;
        return;
    }
    if (s_quest.n_mercs) {
        s_quest.n_mercs--;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85fb
// Size: 0x6b
function function_cbec893df583aecc() {
    switch (level.players.size) {
    case 1: 
        n_active = 3;
        break;
    case 2: 
        n_active = 4;
        break;
    case 3: 
        n_active = 5;
        break;
    default: 
        n_active = 7;
        break;
    }
    return n_active;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x866f
// Size: 0x6b
function function_ee63d6fa5d4d6e87() {
    switch (level.players.size) {
    case 1: 
        n_total = 4;
        break;
    case 2: 
        n_total = 5;
        break;
    case 3: 
        n_total = 6;
        break;
    default: 
        n_total = 7;
        break;
    }
    return n_total;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x86e3
// Size: 0x275
function function_804aa1cbd49ba400(a_s_pos, var_3db5d03d7aac2a57) {
    self.var_da3a55eabb666c32 = [];
    foreach (s_pos in a_s_pos) {
        s_pos.spawndata = spawnstruct();
        s_pos.spawndata.origin = s_pos.origin;
        s_pos.spawndata.angles = s_pos.angles;
        s_pos.spawndata.spawntype = "GAME_MODE";
        s_pos.spawndata.preventrespawn = 1;
        s_pos.v_chopper = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh_jup_blima_anim_infil", s_pos.spawndata);
        if (isdefined(s_pos.v_chopper)) {
            scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable(s_pos.v_chopper);
            s_pos.v_chopper.callingteam = "team_hundred_ninety";
            s_pos.v_chopper.unload_land_offset = 255;
            s_pos.v_chopper.script_disconnectpaths = 1;
            s_pos.v_chopper.vehiclesetuprope = 1;
            s_pos.v_chopper.ignorelist = [s_pos.v_chopper];
            s_pos.v_chopper vehicle_setspeed(60, 10, 8);
            s_pos.v_chopper setvehgoalpos(s_pos.v_chopper.origin, 1);
            if (isdefined(s_pos.script_noteworthy)) {
                s_pos.v_chopper.var_1a10217ff7d12743 = 1;
            }
            if (isdefined(var_3db5d03d7aac2a57)) {
                s_pos.v_chopper thread function_c776ee14bbf6320e(self, getstruct(s_pos.target, "targetname"));
                continue;
            }
            s_pos.v_chopper thread function_514f522c0fd10ad7(self, getstruct(s_pos.target, "targetname"));
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8960
// Size: 0x128
function function_514f522c0fd10ad7(s_quest, s_goal) {
    self endon("death");
    self.var_f585b76d7f472cd9 = [];
    n_special = 0;
    var_4661c9a486253047 = ["jup_ob_enemy_basic_soldier_long", "jup_ob_enemy_basic_soldier_short", "jup_ob_enemy_basic_specialforce_long"];
    n_riders = function_25e754c30394817f();
    for (i = 0; i < n_riders; i++) {
        var_31109020393ed11b = array_random(var_4661c9a486253047);
        if (var_31109020393ed11b == "jup_ob_enemy_basic_specialforce_long") {
            n_special++;
            if (n_special > 2) {
                var_31109020393ed11b = "jup_ob_enemy_basic_soldier_long";
            }
        }
        ai_merc = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, self.origin, self.angles, "team_hundred_ninety");
        if (isdefined(ai_merc)) {
            ai_merc.ignore_nuke = 1;
            s_quest.var_da3a55eabb666c32[s_quest.var_da3a55eabb666c32.size] = ai_merc;
            self.var_f585b76d7f472cd9[i] = ai_merc;
        }
        waitframe();
    }
    namespace_5d57e6b81b105f5d::function_35c699c709e24b69(self.var_f585b76d7f472cd9);
    function_c776ee14bbf6320e(s_quest, s_goal);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8a90
// Size: 0x1d4
function function_c776ee14bbf6320e(s_quest, s_goal) {
    self vehicle_setspeed(60, 10, 8);
    if (istrue(self.var_1a10217ff7d12743)) {
        wait 15;
    }
    while (true) {
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
        if (isdefined(s_goal.script_noteworthy)) {
            if (s_goal.script_noteworthy == "approach") {
                if (isdefined(s_goal.target2)) {
                    thread smoke_screen(getstruct(s_goal.target2, "targetname").origin);
                }
            } else if (s_goal.script_noteworthy == "chopper_approach") {
                s_quest flag_set("chopper_approach");
            }
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
            continue;
        }
        break;
    }
    var_f585b76d7f472cd9 = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(self, 0);
    foreach (ai_rider in var_f585b76d7f472cd9) {
        if (isalive(ai_rider)) {
            ai_rider kill();
        }
    }
    scripts\cp_mp\vehicles\vehicle::vehicle_explode();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c6c
// Size: 0x3f
function smoke_screen(v_pos) {
    magicgrenademanual("smoke_grenade_mp", v_pos, (0, 0, -10), 0.5);
    thread play_sound_in_space("smoke_grenade_expl_trans", self.origin);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8cb3
// Size: 0xe4
function heli_unload(s_loc) {
    self setvehgoalpos(s_loc.origin, 1);
    self waittill("goal");
    self sethoverparams(0);
    if (isdefined(s_loc.target2)) {
        thread smoke_screen(getstruct(s_loc.target2, "targetname").origin);
    }
    var_b3941e6a151cf4d2 = scripts\common\vehicle_code::_vehicle_unload();
    self waittill("unloaded");
    foreach (guy in var_b3941e6a151cf4d2) {
        guy.var_f327ed481efe4857 = undefined;
        guy.ignore_nuke = 0;
        guy thread merc_attack();
    }
    return var_b3941e6a151cf4d2;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8da0
// Size: 0x12e
function function_7ea5453572655fab(s_loc, n_spawns, var_e6642530bf08708e, b_anim) {
    var_badfa29531597077 = [];
    var_f10d2bae0aa4fce7 = function_b584f143ed0ec5d0(s_loc.origin, n_spawns, s_loc.radius);
    for (i = 0; i < var_f10d2bae0aa4fce7.size; i++) {
        var_31109020393ed11b = get_ai_type(var_e6642530bf08708e);
        ai_zombie = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, var_f10d2bae0aa4fce7[i].origin, var_f10d2bae0aa4fce7[i].angles, "team_two_hundred", "difficulty_yellow");
        if (isdefined(ai_zombie) && ai_zombie function_8fa69650e33c84ef("spawn") && isdefined(b_anim)) {
            ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
        }
        waitframe();
        if (isdefined(ai_zombie)) {
            ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
            var_badfa29531597077[var_badfa29531597077.size] = ai_zombie;
            if (ai_zombie.agent_type == "actor_jup_spawner_zombie_hellhound") {
                ai_zombie thread function_f8c34c9553ad2581(self);
                self.var_718d9cc814712443++;
            }
        }
    }
    return var_badfa29531597077;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8ed7
// Size: 0x5c
function function_e936caaa4fa54518(requestid, userdata, zombie, data) {
    zombie endon("death");
    s_quest = userdata[0];
    if (isalive(zombie)) {
        s_quest.var_badfa29531597077[s_quest.var_badfa29531597077.size] = zombie;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f3b
// Size: 0xa4
function function_73448c42e4da54e3(b_reduce) {
    switch (level.players.size) {
    case 1: 
        if (isdefined(b_reduce)) {
            n_spawns = 5;
        } else {
            n_spawns = 9;
        }
        break;
    case 2: 
        if (isdefined(b_reduce)) {
            n_spawns = 6;
        } else {
            n_spawns = 11;
        }
        break;
    case 3: 
        if (isdefined(b_reduce)) {
            n_spawns = 8;
        } else {
            n_spawns = 14;
        }
        break;
    default: 
        if (isdefined(b_reduce)) {
            n_spawns = 9;
        } else {
            n_spawns = 16;
        }
        break;
    }
    return n_spawns;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8fe8
// Size: 0x30
function function_a6ad68d6b07acf11(s_quest) {
    self endon("death");
    self forcenetfieldhighlod(1);
    s_quest flag_wait("dropped_off");
    self forcenetfieldhighlod(0);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9020
// Size: 0x109
function zombie_spawn(s_pt, b_attack, b_anim) {
    var_31109020393ed11b = get_ai_type();
    ai_zombie = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, s_pt.origin, s_pt.angles, "team_two_hundred", "difficulty_yellow");
    if (isdefined(ai_zombie) && ai_zombie function_8fa69650e33c84ef("spawn") && isdefined(b_anim) && b_anim) {
        ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
        ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
    }
    waitframe();
    if (isalive(ai_zombie)) {
        ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        self.n_zombies++;
        ai_zombie.team = "team_two_hundred";
        str_speed = "sprint";
        ai_zombie namespace_dd16d65e824b8e9::function_f1e5805da192a1ef(str_speed, "default", 26);
        if (isdefined(b_attack)) {
            ai_zombie thread attack_player(2000);
        }
        return ai_zombie;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9131
// Size: 0x158
function function_1e66bb8b54246d6b() {
    self endon("death");
    player_freeze(1);
    self.var_cac91eb6521df629 = level.var_54492f7bf0674200.infil_chopper;
    self.ignoreme = 1;
    v_pos = namespace_134d54e39331ee45::function_44dc89f43f1c1e1c(self.n_pos, level.var_54492f7bf0674200.infil_chopper);
    self setorigin(v_pos);
    self setplayerangles(level.var_54492f7bf0674200.infil_chopper.angles * -1);
    waitframe();
    self playerlinkto(level.var_54492f7bf0674200.infil_chopper);
    self playerlinkedoffsetenable();
    flag_set("player_onboard");
    if (!isdefined(level.player_boarded)) {
        level.player_boarded = 1;
        level thread function_392d108673953c27();
    }
    level.var_54492f7bf0674200 flag_wait("infil_start");
    if (level.var_54492f7bf0674200.infil_chopper function_c80b9a252474413b(self)) {
        scripts\cp_mp\utility\game_utility::function_852712268d005332(self, 0, 1);
    }
    self unlink();
    wait 2;
    player_freeze(0);
    if (!level.var_54492f7bf0674200.infil_chopper function_c80b9a252474413b(self)) {
        function_ac62c6628f23f82d();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9291
// Size: 0x12
function function_392d108673953c27() {
    wait 3;
    level flag_set("all_players_onboard");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92ab
// Size: 0xe9
function players_infil() {
    for (i = 0; i < level.players.size; i++) {
        if (isalive(level.players[i])) {
            level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(level.players[i], 0, 0);
            level.players[i] setplayerangles(self.infil_chopper.angles * -1);
        }
    }
    flag_wait("detonate");
    for (i = 0; i < level.players.size; i++) {
        if (isalive(level.players[i])) {
            level.players[i].ignoreme = 0;
        }
    }
    flag_wait("drop_off");
    if (getdvarint(@"hash_732447df682be5db", 0)) {
        level thread function_4c3b4b4059b45fba();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x939c
// Size: 0x23
function vo_infil() {
    wait 5.5;
    level thread namespace_446fc987a980892f::playconversation("quest_s0a1t7_infil", level.players, 2, 1);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93c7
// Size: 0x182
function function_83ff2df370bc359b(s_quest) {
    self endon("death");
    s_quest endon("infil_done");
    level flag_set("countdown");
    thread infil_timeout(s_quest);
    foreach (player in level.players) {
        player.var_73f4fb8b53668a5c = 1;
        player thread function_69c1532c14dde0f1(self, s_quest);
    }
    while (true) {
        self.var_9c80d69eb7a7d6cd = 0;
        foreach (player in level.players) {
            if (function_c80b9a252474413b(player)) {
                self.var_9c80d69eb7a7d6cd = 1;
            }
        }
        if (!self.var_9c80d69eb7a7d6cd) {
            break;
        }
        wait 0.1;
    }
    wait 2;
    foreach (player in level.players) {
        player setclientomnvar("ui_match_start_countdown", -1);
    }
    s_quest flag_set("players_disembarked");
    s_quest notify("infil_done");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9551
// Size: 0x80
function function_69c1532c14dde0f1(vh_chopper, s_quest) {
    self endon("death");
    s_quest endon("infil_done");
    s_quest endon("players_disembarked");
    while (true) {
        self setclientomnvar("ui_match_start_countdown", level.n_time_remaining);
        if (!vh_chopper function_c80b9a252474413b(self)) {
            self setclientomnvar("ui_match_start_countdown", -1);
            break;
        }
        wait 1;
        level.n_time_remaining--;
        if (level.n_time_remaining < 1) {
            break;
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95d9
// Size: 0x8b
function infil_timeout(s_quest) {
    self endon("death");
    s_quest endon("infil_done");
    wait 30;
    foreach (player in level.players) {
        player setclientomnvar("ui_match_start_countdown", -1);
    }
    s_quest flag_set("players_disembarked");
    s_quest notify("infil_done");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x966c
// Size: 0x52
function function_c80b9a252474413b(player) {
    if (!isdefined(self) || !isalive(self) || !isdefined(self.origin) || !isdefined(player) || !isdefined(player.origin)) {
        return 0;
    }
    return function_f69d383479425bfa(player.origin);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96c7
// Size: 0xee
function function_f69d383479425bfa(origin) {
    forward = anglestoforward(self.angles);
    up = anglestoup(self.angles);
    toorigin = origin - self.origin;
    transform = coordtransformtranspose(origin, self.origin, self.angles);
    forwarddist = transform[0];
    sidedist = transform[1];
    verticaldist = transform[2];
    withinforward = forwarddist > -360 && forwarddist < 350;
    withinside = sidedist > -60 && sidedist < 60;
    withinvertical = verticaldist > -255 && verticaldist < -115;
    return withinforward && withinside && withinvertical;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97be
// Size: 0x70
function get_ai_type(var_c57356660fb937af) {
    if (isdefined(var_c57356660fb937af) && var_c57356660fb937af) {
        if (scripts\engine\utility::percent_chance(10) && self.var_718d9cc814712443 < 8) {
            var_31109020393ed11b = "jup_spawner_zombie_hellhound";
            return var_31109020393ed11b;
        }
    }
    if (scripts\engine\utility::percent_chance(20) && self.var_7c11b077004fcf2c < 6) {
        var_31109020393ed11b = "jup_spawner_zombie_base_armored_light";
    } else {
        var_31109020393ed11b = "jup_spawner_zombie_base";
    }
    return var_31109020393ed11b;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9837
// Size: 0x2e
function ai_aware(n_radius) {
    self endon("death");
    while (true) {
        self function_65cdab0fc78aba8f(self.origin, n_radius);
        wait 3;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x986d
// Size: 0xa2
function attack_player(n_radius) {
    self endon("death");
    self endon("clear_attack");
    while (true) {
        if (isdefined(level.players) && level.players.size) {
            player = getclosest(self.origin, level.players);
            if (isalive(player)) {
                if (!isdefined(n_radius)) {
                    n_radius = distance2d(self.origin, player.origin) + 100;
                }
                self function_65cdab0fc78aba8f(player.origin, n_radius);
            }
        }
        wait 10;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9917
// Size: 0xea
function function_b584f143ed0ec5d0(origin, num_spots, n_radius) {
    var_f10d2bae0aa4fce7 = [];
    if (!isdefined(n_radius)) {
        n_radius = 100;
    }
    while (true) {
        var_2a74fdb9fac967ff = randomintrange(n_radius * -1, n_radius + 1);
        var_2a74fcb9fac965cc = randomintrange(n_radius * -1, n_radius + 1);
        pos = origin + (var_2a74fdb9fac967ff, var_2a74fcb9fac965cc, 0);
        pos_on_navmesh = getclosestpointonnavmesh(pos);
        if (isdefined(pos_on_navmesh) && !scripts\mp\outofbounds::ispointinoutofbounds(pos_on_navmesh)) {
            s_spot = spawnstruct();
            if (isdefined(s_spot)) {
                s_spot.origin = pos_on_navmesh;
                s_spot.angles = (0, 0, 0);
            }
            var_f10d2bae0aa4fce7[var_f10d2bae0aa4fce7.size] = s_spot;
            if (var_f10d2bae0aa4fce7.size >= num_spots) {
                break;
            }
        }
        waitframe();
    }
    return var_f10d2bae0aa4fce7;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a0a
// Size: 0x2b3
function function_1e86be4e3accaf94() {
    flag_wait("players_disembarked");
    wait 3;
    var_69ed13f0558a23a7 = getstruct("tower_radio_interact", "targetname");
    s_entry = getstruct("s_entry", "targetname");
    self.var_4118ca23a8b62b78 = scripts\mp\objidpoolmanager::requestobjectiveid(0);
    waitframe();
    scripts\mp\objidpoolmanager::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::objective_add_objective(self.var_4118ca23a8b62b78, "current");
    scripts\mp\objidpoolmanager::update_objective_position(self.var_4118ca23a8b62b78, var_69ed13f0558a23a7.origin + (0, 0, 280));
    scripts\mp\objidpoolmanager::update_objective_icon(self.var_4118ca23a8b62b78, "jup_ui_map_icon_generic_marker");
    scripts\mp\objidpoolmanager::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
    scripts\mp\objidpoolmanager::update_objective_setbackground(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::function_98ba077848896a3(self.var_4118ca23a8b62b78, 1);
    function_a5b76e0f5024cc9a(var_69ed13f0558a23a7, "tower_interact", 500);
    scripts\mp\objidpoolmanager::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::update_objective_position(self.var_4118ca23a8b62b78, var_69ed13f0558a23a7.origin);
    flag_wait("comms_interact");
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(self.var_4118ca23a8b62b78);
    level flag_wait("jansen_coords");
    s_obj = getstruct("s_ava_obj", "targetname");
    scripts\mp\objidpoolmanager::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::update_objective_position(self.var_4118ca23a8b62b78, s_obj.origin + (0, 0, 280));
    scripts\mp\objidpoolmanager::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
    function_9766d0b79eada249(self.var_4118ca23a8b62b78, 1);
    function_6b6b6273f8180522("Quest_Ob", s_obj.origin, s_obj.radius);
    function_6988310081de7b45();
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT1_LOCATE_AVA", level.players);
    flag_wait("ava_located");
    function_af5604ce591768e1();
    function_9766d0b79eada249(self.var_4118ca23a8b62b78, 0);
    scripts\mp\objidpoolmanager::objective_set_play_intro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::objective_set_play_outro(self.var_4118ca23a8b62b78, 1);
    scripts\mp\objidpoolmanager::update_objective_onentity(self.var_4118ca23a8b62b78, self.var_2ada333c838a2316);
    scripts\mp\objidpoolmanager::update_objective_setzoffset(self.var_4118ca23a8b62b78, 80);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9cc5
// Size: 0x1b2
function function_5e715be63f9f20de(var_b1a583aed2813bb7, n_spawns, var_ee3ea8d303c9025c) {
    var_da3a55eabb666c32 = [];
    if (isstruct(var_b1a583aed2813bb7)) {
        s_spawner = var_b1a583aed2813bb7;
    } else {
        s_spawner = getstruct(var_b1a583aed2813bb7, "targetname");
    }
    var_f10d2bae0aa4fce7 = function_b584f143ed0ec5d0(s_spawner.origin, n_spawns, s_spawner.radius);
    if (isdefined(var_ee3ea8d303c9025c)) {
        var_4661c9a486253047 = var_ee3ea8d303c9025c;
    } else {
        var_4661c9a486253047 = ["jup_ob_enemy_basic_soldier_long", "jup_ob_enemy_basic_soldier_short"];
    }
    for (i = 0; i < var_f10d2bae0aa4fce7.size; i++) {
        if (isdefined(var_f10d2bae0aa4fce7[i].script_noteworthy)) {
            var_31109020393ed11b = "jup_ob_enemy_specialist_" + var_f10d2bae0aa4fce7[i].script_noteworthy;
        } else {
            var_31109020393ed11b = random(var_4661c9a486253047);
        }
        aitype = getdvar(@"hash_5254c3fbd200d7ee", var_31109020393ed11b);
        ai_merc = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(aitype, var_f10d2bae0aa4fce7[i].origin, var_f10d2bae0aa4fce7[i].angles, "team_hundred_ninety");
        if (isdefined(ai_merc)) {
            var_da3a55eabb666c32[var_da3a55eabb666c32.size] = ai_merc;
            if (isdefined(var_f10d2bae0aa4fce7[i].script_noteworthy) && var_f10d2bae0aa4fce7[i].script_noteworthy == "sniper") {
                ai_merc thread behavior_guard(var_f10d2bae0aa4fce7[i].origin, 100);
                ai_merc thread function_a5edc0a1e822d97b();
                continue;
            }
            ai_merc thread scripts\mp\ai_behavior::function_9bbf1713a14fa580(ai_merc, 64, 32, var_f10d2bae0aa4fce7[i].origin);
        }
    }
    return var_da3a55eabb666c32;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e80
// Size: 0x56
function spawn_mangler() {
    v_org = getclosestpointonnavmesh(self.origin);
    var_fb98743d75ac80a0 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc("jup_spawner_zombie_mangler", v_org, (0, 225, 0), "team_two_hundred");
    if (isdefined(var_fb98743d75ac80a0)) {
        var_fb98743d75ac80a0 namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ede
// Size: 0x18e
function function_b73cbb48a2997167() {
    s_pos = getstruct("exfil_chopper", "targetname");
    spawndata = spawnstruct();
    spawndata.origin = s_pos.origin;
    spawndata.angles = s_pos.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.preventrespawn = 1;
    spawndata.var_699ac4a9c9e9f0ec = 1;
    spawndata.var_24993ee24f7c7c0 = 1;
    self.ava_chopper = undefined;
    while (true) {
        self.ava_chopper = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("veh9_palfa", spawndata);
        if (isdefined(self.ava_chopper)) {
            break;
        }
        wait 0.1;
    }
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable(self.ava_chopper);
    self.ava_chopper scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_setcandamage(0);
    self.ava_chopper.playersinside = [];
    self.ava_chopper.var_c9164736baf0694a = [];
    self.ava_chopper.onStartRiding = &function_b28cb16c37f8e7b;
    self.ava_chopper.onEndRiding = &function_5f4563731f3e286f;
    self.ava_chopper.unload_land_offset = 255;
    self.ava_chopper.var_9bd69326cfeb9fe9 = 1;
    self.ava_chopper thread function_1b93f9a5bdc20396(s_pos);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa074
// Size: 0x10c
function function_db1aed1808fcbfaa(s_quest) {
    self endon("death");
    while (true) {
        self.var_9c80d69eb7a7d6cd = 1;
        foreach (player in level.players) {
            if (!function_c80b9a252474413b(player) && isalive(player)) {
                self.var_9c80d69eb7a7d6cd = 0;
            }
        }
        if (self.var_9c80d69eb7a7d6cd) {
            break;
        }
        wait 0.1;
    }
    wait 1;
    s_quest flag_set("players_boarded");
    foreach (player in level.players) {
        player callback::callback("escaped_with_ava");
        scripts\mp\outofbounds::enableoobimmunity(player);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa188
// Size: 0x14
function function_b28cb16c37f8e7b(player) {
    thread function_f814294925882e0(player);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1a4
// Size: 0xe1
function function_f814294925882e0(player) {
    player notify("endon_enter_walkable_vehicle");
    player endon("endon_enter_walkable_vehicle");
    player endon("disconnect");
    player waittill("entered_vehicle_interior");
    self.playersinside = function_6d6af8144a5131f1(self.var_c9164736baf0694a, player);
    scripts\mp\outofbounds::enableoobimmunity(player);
    player.var_68b9486f4adbcb62 = 1;
    foreach (player in self.playersinside) {
        if (!istrue(player.var_68b9486f4adbcb62)) {
            return;
        }
    }
    if (!istrue(self.leaving) && isdefined(self.playersinside) && self.playersinside.size == level.players.size) {
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa28d
// Size: 0x65
function function_5f4563731f3e286f(player) {
    player notify("endon_enter_walkable_vehicle");
    self.playersinside[player.guid] = undefined;
    if (isdefined(player) && isint(player.oobimmunity)) {
        scripts\mp\outofbounds::disableoobimmunity(player);
    }
    player notify("endon_exfil_inside_vehicle_timer");
    player.var_68b9486f4adbcb62 = undefined;
    thread function_59e7feccaa753a46(player);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa2fa
// Size: 0x6e
function function_59e7feccaa753a46(player, var_45fd392609262a96) {
    self endon("death");
    if ((istrue(self.leaving) || istrue(var_45fd392609262a96)) && !istrue(player.var_68b9486f4adbcb62)) {
        scripts\cp_mp\utility\game_utility::function_852712268d005332(player, 1, 0.25);
        player setorigin(self gettagorigin("tag_seat_7"));
        level thread scripts\cp_mp\utility\game_utility::function_852712268d005332(player, 0, 0.25);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa370
// Size: 0xf4
function function_3c26533e550baeb9() {
    self endon("death");
    level.var_54492f7bf0674200 flag_wait("players_boarded");
    level.var_54492f7bf0674200 flag_wait("ava_seated");
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(level.var_54492f7bf0674200.var_4118ca23a8b62b78);
    s_start = getstruct("exfil_start", "targetname");
    s_end = getstruct(s_start.target, "targetname");
    wait 2;
    setmusicstate("");
    thread function_e5357c2e96727192();
    self vehicle_setspeed(60, 10, 8);
    self setvehgoalpos(s_start.origin, 0);
    self waittill("goal");
    level thread function_4c3b4b4059b45fba();
    self setvehgoalpos(s_end.origin, 1);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa46c
// Size: 0x9b
function function_e5357c2e96727192() {
    self.e_linkto = getent("linkto_clip_infil_chopper", "targetname");
    self.mdl_clip = getent("clip_infil_chopper", "targetname");
    self.e_linkto rotateto(self.angles, 0.05);
    self.e_linkto moveto(self.origin, 0.05);
    self.e_linkto waittill("movedone");
    self.e_linkto linkto(self);
    self.mdl_clip solid();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa50f
// Size: 0x2e6
function function_4c3b4b4059b45fba() {
    level.battlechatterdisabled = 1;
    namespace_446fc987a980892f::playconversation("quest_s0a1t7_exfil_success", level.players, 0, 1);
    foreach (player in level.players) {
        if (scripts\mp\utility\player::isinlaststand(player)) {
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
            level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 1, 0);
            player hidehudenable();
        }
    }
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
    namespace_134d54e39331ee45::ai_cleanup();
    wait 1;
    foreach (player in level.players) {
        if (isalive(player)) {
            player setclientdvar(@"ui_opensummary", 1);
            level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 0, 0);
            player thread scripts\common\utility::letterbox_enable(1);
            player.var_59e5ea44ba5aff1 = 1;
        }
    }
    play_movie("jup_ob_act1_cine_outro");
    level.battlechatterdisabled = 0;
    level thread namespace_134d54e39331ee45::function_bf01aba31e9023d1();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa7fd
// Size: 0x110
function play_movie(str_movie) {
    var_7848ff3f98ef4a73 = 0;
    var_8c6c2faac72ea626 = 10;
    videoname = str_movie;
    videoduration = 134;
    var_1bab87417f147c8f = 0;
    foreach (player in level.players) {
        player setclientomnvar("ui_br_bink_overlay_state", var_8c6c2faac72ea626);
    }
    playcinematicforall(videoname, 1, var_1bab87417f147c8f);
    wait videoduration;
    stopcinematicforall();
    foreach (player in level.players) {
        player setclientomnvar("ui_br_bink_overlay_state", var_7848ff3f98ef4a73);
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 1, 0);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa915
// Size: 0x2aa
function function_1b93f9a5bdc20396(s_pos) {
    self endon("death");
    level.var_13791bd2b9e65efa = spawn_model("c_jup_zmb_npc_fang_fb", self.origin, self.angles);
    level.var_1da22412ed7ad03b = spawn_model("c_jup_zmb_ravenov_fb", self.origin, self.angles);
    waitframe();
    if (isdefined(level.var_13791bd2b9e65efa)) {
        thread scripts\common\scene::play(level.var_13791bd2b9e65efa, "soap_exfil_entry_idle", "jup_cin_zm_vig_s0_act1_quest_ava_exfil_entry");
    }
    if (isdefined(level.var_1da22412ed7ad03b)) {
        thread scripts\common\scene::play(level.var_1da22412ed7ad03b, "ravenov_exfil_entry_idle", "jup_cin_zm_vig_s0_act1_quest_ava_exfil_entry");
    }
    self vehicle_setspeed(60, 10, 8);
    s_goal = getstruct(s_pos.target, "targetname");
    while (isdefined(s_goal)) {
        if (isdefined(s_goal.script_noteworthy)) {
            self vehicle_setspeed(20, 10, 8);
            if (s_goal.script_noteworthy == "land") {
                self setvehgoalpos(s_goal.origin, 1);
                self setgoalyaw(flat_angle(s_goal.angles)[1]);
                self settargetyaw(flat_angle(s_goal.angles)[1]);
                self sethoverparams(0);
                scripts\mp\objidpoolmanager::objective_set_play_intro(level.var_54492f7bf0674200.var_4118ca23a8b62b78, 1);
                scripts\mp\objidpoolmanager::objective_set_play_outro(level.var_54492f7bf0674200.var_4118ca23a8b62b78, 1);
                scripts\mp\objidpoolmanager::update_objective_onentity(level.var_54492f7bf0674200.var_4118ca23a8b62b78, self);
                scripts\mp\objidpoolmanager::update_objective_setzoffset(level.var_54492f7bf0674200.var_4118ca23a8b62b78, 48);
            } else if (s_goal.script_noteworthy == "hover") {
                self setvehgoalpos(s_goal.origin, 1);
                wait 6;
            }
        } else {
            self setvehgoalpos(s_goal.origin, 0);
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            s_goal = undefined;
        }
        self waittill("goal");
    }
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT1_EXFIL", level.players);
    level.var_54492f7bf0674200 flag_set("ava_chopper_go");
    wait 0.1;
    level.var_54492f7bf0674200 thread function_5904ee3f83f622ba();
    thread function_db1aed1808fcbfaa(level.var_54492f7bf0674200);
    thread function_3c26533e550baeb9();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabc7
// Size: 0x22
function function_b38a73fc6aa9721f(s_quest) {
    self endon("death");
    self waittill("reached_end_node");
    level notify("story_quest_complete_step_4");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xabf1
// Size: 0x38
function oob_triggers() {
    flag_wait("players_disembarked");
    level notify("switch_oob");
    waitframe();
    level.outofboundstriggers = getentarray("OutOfBounds_ob_story", "targetname");
    level thread scripts\mp\outofbounds::watchoobtriggers();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac31
// Size: 0x6b
function function_ab65e0d9a8828ab2() {
    switch (level.players.size) {
    case 1: 
        n_spawns = 8;
        break;
    case 2: 
        n_spawns = 10;
        break;
    case 3: 
        n_spawns = 13;
        break;
    default: 
        n_spawns = 10;
        break;
    }
    return n_spawns;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaca5
// Size: 0xc6
function proximity_watcher(s_spot) {
    if (!isdefined(s_spot.radius)) {
        n_dist = 250000;
    } else {
        n_dist = squared(s_spot.radius);
    }
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                if (distancesquared(s_spot.origin, player.origin) < n_dist) {
                    return;
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xad73
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
                    self notify(str_notify);
                    return;
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae57
// Size: 0x29
function clip_handler() {
    mdl_clip = getent("clip_subbase", "targetname");
    if (isdefined(mdl_clip)) {
        mdl_clip delete();
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae88
// Size: 0x133
function setup_barriers() {
    var_54265127f0e33c43 = getstructarray("ladder_blocker", "targetname");
    foreach (s_ladder in var_54265127f0e33c43) {
        var_165d83ee50ae70dd = spawnscriptable("blocker_toggleable_mine_ladder", s_ladder.origin, s_ladder.angles);
        var_165d83ee50ae70dd setscriptablepartstate("state", "visible");
    }
    var_abf141deb485e6eb = getstructarray("barricade_ava", "targetname");
    foreach (s_blocker in var_abf141deb485e6eb) {
        blocker_scriptable = spawnscriptable("blocker_toggleable_window_security_bars", s_blocker.origin, s_blocker.angles);
        blocker_scriptable setscriptablepartstate("state", "visible");
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafc3
// Size: 0x3f
function zombie_death_watcher(s_quest) {
    self waittill("death");
    if (isdefined(s_quest.n_defend) && s_quest.n_defend > 0) {
        s_quest.n_defend--;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb00a
// Size: 0x3b
function function_4d201d5295b76e9e(s_quest) {
    self waittill("death");
    if (s_quest.n_zombies > 0) {
        s_quest.n_zombies--;
        s_quest.var_7c11b077004fcf2c--;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb04d
// Size: 0x2f
function function_f8c34c9553ad2581(s_quest) {
    self waittill("death");
    if (s_quest.var_718d9cc814712443 > 0) {
        s_quest.var_718d9cc814712443--;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb084
// Size: 0x76
function function_d5027e6e46ac2ace() {
    n_players = level.players.size;
    switch (n_players) {
    case 1: 
        n_zombies = 12;
        break;
    case 2: 
        n_zombies = 14;
        break;
    case 3: 
        n_zombies = 17;
        break;
    default: 
        n_zombies = 19;
        break;
    }
    return n_zombies;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb103
// Size: 0x76
function function_93ef9151abe5a399() {
    n_players = level.players.size;
    switch (n_players) {
    case 1: 
        n_zombies = 11;
        break;
    case 2: 
        n_zombies = 13;
        break;
    case 3: 
        n_zombies = 15;
        break;
    default: 
        n_zombies = 19;
        break;
    }
    return n_zombies;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb182
// Size: 0x91
function player_looking_at(start, dot) {
    if (!isdefined(dot)) {
        dot = 0.8;
    }
    end = self geteye();
    angles = vectortoangles(start - end);
    forward = anglestoforward(angles);
    player_angles = self getplayerangles();
    player_forward = anglestoforward(player_angles);
    new_dot = vectordot(forward, player_forward);
    if (new_dot < dot) {
        return false;
    }
    return true;
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb21c
// Size: 0x1d6
function function_2e0dc001c9a5c661() {
    var_d08f3ac86be7ae9e = getstructarray("map_transition", "targetname");
    self.var_a5016e4b6acfea47 = [];
    level waittill("prematch_done");
    thread function_a49ca0a80cb63664();
    foreach (var_751df20fceaee5 in var_d08f3ac86be7ae9e) {
        var_751df20fceaee5.var_d182b8d3f3aaa93b = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5, "ob_quest_exfil_site_xmodel", 1, 1);
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_site", "standby");
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_icon", "default_icon");
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_smoke", "smoking");
        self.var_a5016e4b6acfea47[self.var_a5016e4b6acfea47.size] = var_751df20fceaee5.var_d182b8d3f3aaa93b;
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::register_interact(var_751df20fceaee5.var_d182b8d3f3aaa93b, 120, &function_a1778cdfcc8373ae, %JUP_OB_OBJECTIVES/QUEST_0_ACT1_TRANSITION);
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact sethintonobstruction("show");
        var_751df20fceaee5 thread function_e3ba83b1bb428b8e();
    }
    level flag_wait("exfil_to_ava");
    foreach (var_751df20fceaee5 in var_d08f3ac86be7ae9e) {
        if (isdefined(var_751df20fceaee5.n_obj_id)) {
            scripts\mp\objidpoolmanager::returnobjectiveid(var_751df20fceaee5.n_obj_id);
            var_751df20fceaee5.n_obj_id = undefined;
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3fa
// Size: 0x90
function function_a49ca0a80cb63664() {
    level flag_wait("exfil_to_ava");
    wait 1;
    foreach (var_d182b8d3f3aaa93b in self.var_a5016e4b6acfea47) {
        if (isdefined(var_d182b8d3f3aaa93b) && isdefined(var_d182b8d3f3aaa93b.interact)) {
            var_d182b8d3f3aaa93b.interact delete();
        }
        if (isdefined(var_d182b8d3f3aaa93b)) {
            var_d182b8d3f3aaa93b delete();
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb492
// Size: 0xbb
function function_e3ba83b1bb428b8e() {
    self.n_obj_id = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    scripts\mp\objidpoolmanager::objective_set_play_intro(self.n_obj_id, 1);
    scripts\mp\objidpoolmanager::objective_set_play_outro(self.n_obj_id, 1);
    scripts\mp\objidpoolmanager::objective_add_objective(self.n_obj_id, "invisible", self.var_d182b8d3f3aaa93b.origin, "ui_map_icon_ob_quest_exfil", "icon_small");
    scripts\mp\objidpoolmanager::update_objective_onentity(self.n_obj_id, self.var_d182b8d3f3aaa93b);
    scripts\mp\objidpoolmanager::function_c3c6bff089dfdd34(self.n_obj_id, "icon_regular");
    objective_setlabel(self.n_obj_id, %SHARED_HINTSTRINGS/EXFIL);
    objective_setplayintro(self.n_obj_id, 0);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb555
// Size: 0x59
function function_a1778cdfcc8373ae(player) {
    self function_dfb78b3e724ad620(0);
    if (isdefined(level.var_d8b6115a502e7e76)) {
        if (!self [[ level.var_d8b6115a502e7e76 ]](player)) {
            self playsoundtoplayer("ui_zm_core_door_purchase_deny", player);
            return;
        }
    }
    map_transition();
    level flag_set("exfil_to_ava");
    self delete();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb5b6
// Size: 0x156
function map_transition(var_684092929dab076f, var_576f57af0204c38c) {
    a_squads = [];
    while (true) {
        player = var_684092929dab076f[0];
        var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
        var_22d2a2a72fc2c595 = [];
        foreach (squad_member in var_c9b69aecc5c631ed) {
            if (var_576f57af0204c38c function_c80b9a252474413b(squad_member)) {
                var_22d2a2a72fc2c595[var_22d2a2a72fc2c595.size] = squad_member;
            }
        }
        a_squads[a_squads.size] = var_22d2a2a72fc2c595;
        foreach (squad_member in var_22d2a2a72fc2c595) {
            var_684092929dab076f = array_remove(var_684092929dab076f, squad_member);
        }
        if (!var_684092929dab076f.size) {
            break;
        }
        waitframe();
    }
    foreach (squad in a_squads) {
        level thread ob_exfil::function_e229d89e0c38206d(squad, 1001);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb714
// Size: 0x59
function function_6c281221ef7a2f() {
    self endon("death");
    while (true) {
        n_damage, attacker = self waittill("damage");
        var_1591dd951131edd5 = int(n_damage * 0.9);
        self.health += var_1591dd951131edd5;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb775
// Size: 0x9b
function function_5734daa7a8ef6bd() {
    var_77ae610b84ee2e95 = getstructarray("ammo_restock", "targetname");
    foreach (var_94050959266e1ba9 in var_77ae610b84ee2e95) {
        var_28b750103c3b51fb = spawnscriptable("military_ammo_restock_noent", var_94050959266e1ba9.origin, var_94050959266e1ba9.angles);
        var_28b750103c3b51fb setscriptablepartstate("military_ammo_restock", "useable_on");
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb818
// Size: 0x4d
function setup_cache() {
    s_cache = getstruct("ava_cache", "targetname");
    cache = common_cache::cache_spawncache(#"hash_9f528a48605451", s_cache.origin, s_cache.angles);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb86d
// Size: 0xa0
function function_594b8c2b03233424() {
    a_s_keys = getstructarray("turret_trap_key", "targetname");
    foreach (s_key in a_s_keys) {
        var_cdb87a0f2b9aece5 = function_962b0a5c4028e615();
        item_intel = function_38e113a4c30f6c0d(var_cdb87a0f2b9aece5, s_key.origin, (0, 0, 0), 0, 1, 1, 1);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb915
// Size: 0x1aa
function function_577419b6760f20e() {
    var_be6bb0d3ba2db2fe = getstructarray("turret_trap", "targetname");
    foreach (s_turret in var_be6bb0d3ba2db2fe) {
        s_turret.turrettype = "defend_turret";
        s_turret.angles += (0, -90, 0);
        if (isdefined(level.players) && isdefined(level.players[0])) {
            player_owner = level.players[0];
            turret_team = level.players[0].team;
            s_turret.team = turret_team;
            s_turret.owner = player_owner;
            s_turret.var_6d9f48354b1ae939 = 1;
            s_turret.var_12c37b454baa515d = 1;
            s_turret.var_12e39261f1ccd13c = 1;
            s_turret.var_1fe0a3ddc9b60566 = getstruct(s_turret.target, "targetname");
            s_turret.turret = namespace_a5c2977d842bbf87::function_936a5eebf22b23e1(s_turret.script_noteworthy, s_turret.origin, s_turret.angles, s_turret.var_1fe0a3ddc9b60566.origin, s_turret.var_1fe0a3ddc9b60566.angles);
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbac7
// Size: 0x13
function function_d52be86cf922bec2(instance, player) {
    
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbae2
// Size: 0x111
function function_beffaa7f40862259(params) {
    opener = params.opener;
    self setscriptablepartstate("body_turret_trap_panel", "closed_usable");
    foreach (item in self.contents) {
        if (!isdefined(item.lootid) || item.lootid == 0) {
            continue;
        }
        bundlename = function_fc925a153c7fd55c(item.lootid);
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        scriptablename = itembundle.scriptable;
        itemtype = itembundle.type;
        if (function_3712c4e725d18962(bundlename)) {
            function_1459744b58026a21(bundlename, opener);
            return;
        }
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbfb
// Size: 0x4c
function function_962b0a5c4028e615() {
    var_bfb567bc6dd16556 = ["obloot_valuable_turret_trap_circuit", "obloot_valuable_turret_trap_circuit_brainrot", "obloot_valuable_turret_trap_circuit_cryofreeze", "obloot_valuable_turret_trap_circuit_deadwire", "obloot_valuable_turret_trap_circuit_napalmburst", "obloot_valuable_turret_trap_circuit_shatterblast"];
    return array_random(var_bfb567bc6dd16556);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc50
// Size: 0x74
function function_3712c4e725d18962(key_name) {
    if (!isdefined(key_name)) {
        return 0;
    }
    switch (key_name) {
    case #"hash_1f23f2d7229b106f":
    case #"hash_379852440f304dad":
    case #"hash_483ff783c4453bc4":
    case #"hash_93a010c3c96c8ddb":
    case #"hash_dab26a1803e7a077":
    case #"hash_fbe6c6a21682f349": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbccc
// Size: 0x27d
function function_1459744b58026a21(key_name, owner) {
    self setscriptablepartstate("body_turret_trap_panel", "closed_unusable");
    function_2b164bf1240548cd(self.turret, owner);
    turreticon = "icon_minimap_micro_turret_friendly";
    if (issharedfuncdefined("game", "createObjective")) {
        self.turret.minimapid = self.turret [[ getsharedfunc("game", "createObjective") ]](turreticon, self.turret.team, undefined, 1, 1);
    }
    turret_info = self.turret getturretweaponinfo();
    var_5a5520aa86c1e979 = 1;
    switch (key_name) {
    case #"hash_1f23f2d7229b106f": 
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(turret_info, "brainrot");
        break;
    case #"hash_379852440f304dad": 
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(turret_info, "deadwire");
        break;
    case #"hash_483ff783c4453bc4": 
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(turret_info, "cryofreeze");
        break;
    case #"hash_93a010c3c96c8ddb": 
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(turret_info, "napalmburst");
        break;
    case #"hash_dab26a1803e7a077": 
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(turret_info, "shatterblast");
        break;
    default: 
        self.turret.owner namespace_dc2e59577d3a271f::function_b4da81e43557ada1(turret_info);
        var_5a5520aa86c1e979 = 0;
        break;
    }
    if (!istrue(self.var_9cc74ce986b31dfb)) {
        self.var_9cc74ce986b31dfb = 1;
        if (isdefined(self.playerlist)) {
            foreach (player in self.playerlist) {
                player callback::callback("on_turret_trap_circuit_added");
            }
        } else {
            owner callback::callback("on_turret_trap_circuit_added");
        }
    }
    thread function_bd241b99658cd3c8();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf51
// Size: 0xc
function function_bd241b99658cd3c8() {
    wait 120;
    function_cea4bfa4bc0fabf6();
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf65
// Size: 0x90
function function_cea4bfa4bc0fabf6() {
    self setscriptablepartstate("body_turret_trap_panel", "closed_usable");
    if (isdefined(self.turret.minimapid)) {
        if (issharedfuncdefined("game", "returnObjectiveID")) {
            [[ getsharedfunc("game", "returnObjectiveID") ]](self.turret.minimapid);
        }
        self.turret.minimapid = undefined;
    }
    self.var_9cc74ce986b31dfb = 0;
    sentryturret_setinactive(self.turret);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xbffd
// Size: 0x8b
function function_245e4c4f2c8f50df(container, player, lootid, quantity, itemtype, itemindex) {
    noextract = undefined;
    backpackquantity = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        backpackquantity = namespace_3883e3399f2870b5::function_8e5978971b5dcd16(player, itemindex);
    }
    if (!isdefined(itemtype)) {
        itemtype = 0;
    }
    if (!isdefined(itemindex)) {
        itemindex = 0;
    }
    player notify("item_added_to_cache", itemtype, itemindex, lootid, backpackquantity);
    return [lootid, noextract];
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc091
// Size: 0x2d7
function function_ce34466b3cece887() {
    ammo_mods = ["brainrot", "deadwire", "napalmburst", "cryofreeze", "shatterblast"];
    perks = ["specialty_juggernog", "specialty_quickrevive", "specialty_deadshot", "specialty_speedcola", "specialty_elemental_pop", "specialty_death_perception", "specialty_staminup"];
    supers = ["super_aether_shroud", "super_healing_aura", "super_frost_blast", "super_energy_mine", "super_frenzied_guard", "super_tesla_storm"];
    if (isdefined(self.has_power)) {
        return;
    }
    self.has_power = 1;
    armor::setArmorHealth(self.maxarmorhealth);
    waitframe();
    armor::function_9c6e9a6643b6c9a6(1);
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
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 240;
    item_entry = "ob_jup_item_weapon_ar_kilo53_purple";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = common_item::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    common_item::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 48;
    item_entry = "ob_jup_item_weapon_sh_mbravo_purple";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = common_item::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    common_item::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
    wait 0.5;
    a_weapons = self getweaponslist("primary");
    for (i = 0; i < 2; i++) {
        pack_a_punch::pap_weapon(a_weapons[i], 0);
        waitframe();
        var_4bc27b790622bd85 = randomint(ammo_mods.size);
        ammo_mod::function_6c40f58b29a952a9(a_weapons[i], ammo_mods[var_4bc27b790622bd85]);
    }
    waitframe();
    zombie_perks::give_perk(perks[0], 0);
    wait 0.25;
    zombie_perks::give_perk(perks[1], 0);
    wait 0.25;
    zombie_perks::give_perk(perks[2], 0);
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc370
// Size: 0x9c
function teleport_players(var_446a0ad9faf42765) {
    level flag_wait("player_ready");
    var_f10d2bae0aa4fce7 = function_b584f143ed0ec5d0(var_446a0ad9faf42765.origin, 6, var_446a0ad9faf42765.radius);
    for (i = 0; i < level.players.size; i++) {
        level.players[i] setorigin(var_f10d2bae0aa4fce7[i].origin);
        level.players[i] setplayerangles(var_446a0ad9faf42765.angles);
    }
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc414
// Size: 0x38
function test_bots() {
    wait 15;
    level thread scripts\mp\bots\bots::spawn_bots(1, "allies", undefined, undefined, undefined, "recruit");
    wait 5;
    level thread scripts\mp\bots\bots::spawn_bots(1, "allies", undefined, undefined, undefined, "recruit");
}

// Namespace namespace_89d581f5dfa382c2 / namespace_609a42b1d504aad6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc454
// Size: 0x142
function player_freeze(b_state) {
    val::set("exfil", "crouch", !b_state);
    val::set("exfil", "gesture", !b_state);
    val::set("exfil", "allow_jump", !b_state);
    val::set("exfil", "killstreaks", !b_state);
    val::set("exfil", "melee", !b_state);
    val::set("exfil", "offhand_weapons", !b_state);
    val::set("exfil", "prone", !b_state);
    val::set("exfil", "sprint", !b_state);
    val::set("exfil", "supers", !b_state);
    val::set("exfil", "usability", !b_state);
    val::set("exfil", "weapon", !b_state);
    val::set("exfil", "allow_movement", !b_state);
    val::set("exfil", "fire", !b_state);
    val::set("exfil", "weapon_switch", !b_state);
    val::set("exfil", "damage", !b_state);
    val::set("exfil", "ignoreme", b_state);
    self freezecontrols(b_state);
}

