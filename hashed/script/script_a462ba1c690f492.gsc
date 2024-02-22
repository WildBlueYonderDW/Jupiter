// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using script_398835140857d740;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_64351208cb856df9;
#using scripts\asm\shared\mp\utility.gsc;
#using script_1362708683492300;
#using scripts\mp\objidpoolmanager.gsc;
#using script_7cfaa6fd841fb4dd;
#using script_2ff6eb4f5b8663fb;
#using script_2583ee5680cf4736;
#using scripts\mp\mp_agent.gsc;
#using script_120270bd0a747a35;
#using script_42982ffd0134f28e;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_2d05e472a90adb1d;
#using scripts\common\vehicle_code.gsc;
#using script_6617e2f2bb62b52b;
#using script_2304453c69e996e2;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_6f65366f542f6627;
#using scripts\mp\scoreboard.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\perks\perkpackage.gsc;
#using script_639bf783929acf9b;
#using script_7b2517368c79e5bc;
#using script_58be75c518bf0d40;

#namespace namespace_cf011d7d8f1de3ac;

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe66
// Size: 0xf9
function function_87759397315122a3() {
    setdvar(@"hash_f1d095735ac37f33", 0);
    setdvar(@"hash_f1f518497502aea8", 1);
    level.var_54492f7bf0674200 = spawnstruct();
    level.var_54492f7bf0674200.var_7c11b077004fcf2c = 0;
    level.var_54492f7bf0674200.var_5001eff44332b8d8 = 0;
    level.var_54492f7bf0674200.n_zombies = 0;
    level.var_54492f7bf0674200.difficulty = "difficulty_normal";
    level.var_54492f7bf0674200 flag_init("merc_airborne");
    level.var_54492f7bf0674200 flag_init("ava_vehicle_go");
    callback::add("player_spawned", &on_player_spawned);
    level thread namespace_ac2dc66acdf98ed8::main();
    level._effect["c4_explosion"] = loadfx("vfx/iw9/veh/scriptables/apc/vfx_veh_apc_engine_explode.vfx");
    level.var_54492f7bf0674200 thread function_e1fdc274c6c2db37();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf66
// Size: 0x6d
function function_3e10b338f3050e84(b_skipped) {
    level endon("game_ended");
    level waittill("prematch_done");
    if (istrue(b_skipped)) {
        return;
    }
    level.var_54492f7bf0674200 thread function_de6ae73d98f28ba3();
    level.var_54492f7bf0674200 thread function_f90f151575eb87c0();
    level.var_54492f7bf0674200 thread function_28e004bcfd8a97e1();
    level.var_54492f7bf0674200 thread function_822dee14a4f0bcef();
    level waittill("story_quest_complete_step_1");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfda
// Size: 0x11
function function_e34d2618f099f04b(b_skipped) {
    if (istrue(b_skipped)) {
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xff2
// Size: 0x42
function function_3e10b638f305151d(b_skipped) {
    level endon("game_ended");
    level.var_54492f7bf0674200 function_f47554e68b1efb26();
    level.var_54492f7bf0674200 thread turret_defend_start();
    if (istrue(b_skipped)) {
        return;
    }
    level waittill("story_quest_complete_step_2");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x103b
// Size: 0x4e
function function_e34d2718f099f27e(b_skipped) {
    if (istrue(b_skipped)) {
        function_1837cd52b8f6cf0f("merc_defend_player_pos", 0);
        level.var_54492f7bf0674200 thread ava_spawn();
        namespace_5a22b6f3a56f7e9b::update_objective_state(level.var_54492f7bf0674200.var_4118ca23a8b62b78, "empty");
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1090
// Size: 0x32
function function_3e10b538f30512ea(b_skipped) {
    level endon("game_ended");
    if (istrue(b_skipped)) {
        return;
    }
    level.var_54492f7bf0674200 thread function_b7761880f3b34ef9();
    level waittill("story_quest_complete_step_3");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c9
// Size: 0x3b
function function_e34d2818f099f4b1(b_skipped) {
    if (istrue(b_skipped)) {
        function_1837cd52b8f6cf0f("merc_defend_player_pos", 0);
        level.var_54492f7bf0674200 flag_set("ava_vehicle_go");
        level notify("story_quest_complete_step_3");
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x110b
// Size: 0x31
function function_3e10b038f30507eb(b_skipped) {
    level endon("game_ended");
    if (istrue(b_skipped)) {
        return;
    }
    level.var_54492f7bf0674200 function_47ed1b5ac747e803();
    level waittill("story_quest_complete_step_4");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1143
// Size: 0x1f
function function_e34d2918f099f6e4(b_skipped) {
    if (istrue(b_skipped)) {
        /#
            iprintlnbold("evt_ob_q_object_explo");
        #/
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1169
// Size: 0x37
function function_3ff548bfc2391855() {
    while (1) {
        if (getdvarint(@"hash_a6e925b5c1930590", 0)) {
            function_87759397315122a3();
            level flag_set("init_quest");
            break;
        }
        wait(1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a7
// Size: 0x5d
function function_e1fdc274c6c2db37() {
    self.var_607fd6c265fe2a0 = getentarray("clip_zombie_breach", "targetname");
    thread function_a48af83a146872cf();
    setdvar(@"hash_f1d095735ac37f33", 0);
    level waittill("prematch_done");
    function_1837cd52b8f6cf0f("quest_start_player_pos", 1);
    thread function_cfb0f18e5cb3ce13();
    namespace_64135de19550f047::function_e9158c9e8c391f25("cover_merc_defend");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120b
// Size: 0x22
function function_cfb0f18e5cb3ce13() {
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Ava is somewhere in that building.  Let's go find her.", level.players, "always", 2000, 1);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1234
// Size: 0x3
function function_ba6167b43da41877() {
    
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123e
// Size: 0xee
function function_de6ae73d98f28ba3() {
    level endon("skipped");
    wait(1);
    self.s_interact = getstruct("breach_interact", "targetname");
    self.var_ca0439c2f79cc0fb = getstruct("breach_charge", "targetname");
    self.var_9a9028525e0e01d = utility::spawn_model("offhand_wm_briefcase_bomb_c4_cp", self.var_ca0439c2f79cc0fb.origin, self.var_ca0439c2f79cc0fb.angles);
    waitframe();
    self.var_9a9028525e0e01d hide();
    thread function_1e86be4e3accaf94();
    self.var_a1c862599a060055 = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.s_interact.origin, 64, &breach_interact, "JUP_OB_OBJECTIVES/Q0_PLANT_CHARGE");
    self.var_a1c862599a060055 waittill("charge_planted");
    self.var_a1c862599a060055 delete();
    self notify("charge_planted");
    thread function_5d024034f0b757a3();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1333
// Size: 0x198
function function_5d024034f0b757a3() {
    self.var_9a9028525e0e01d show();
    n_time = 5;
    while (n_time) {
        iprintlnbold("Bomb Countdown: " + n_time);
        n_time--;
        wait(1);
    }
    playfx(getfx("c4_explosion"), self.var_9a9028525e0e01d.origin);
    playsoundatpos(self.var_9a9028525e0e01d.origin, "evt_ob_q_object_explo");
    self.var_9a9028525e0e01d thread function_3aff99f1ebe5698b();
    waitframe();
    thread function_db21ab0a6b9e93ee(self.var_9a9028525e0e01d, 100);
    self notify("breached");
    self.var_9a9028525e0e01d delete();
    foreach (var_306aff155ed8915f in self.var_25c51a60bc088d9b) {
        var_306aff155ed8915f delete();
    }
    foreach (mdl_clip in self.var_607fd6c265fe2a0) {
        if (isdefined(mdl_clip) && isdefined(mdl_clip.script_noteworthy) && mdl_clip.script_noteworthy == "breach_entry") {
            mdl_clip connectpaths();
            wait(0.1);
            mdl_clip delete();
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d2
// Size: 0x14
function breach_interact(player) {
    self notify("charge_planted");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ed
// Size: 0x3
function function_3aff99f1ebe5698b() {
    
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7
// Size: 0x19c
function function_a48af83a146872cf() {
    self.var_e60f78a6da569e71 = [];
    self.var_25c51a60bc088d9b = [];
    self.var_2788b7f8dbde803d = [];
    self.var_686818ffab148c29 = [];
    self.a_s_barriers = getstructarray("breach_barrier", "targetname");
    foreach (s_barrier in self.a_s_barriers) {
        self.var_e60f78a6da569e71[self.var_e60f78a6da569e71.size] = utility::spawn_model("s4_barrier_wood_window_slats_48x72_01", s_barrier.origin, s_barrier.angles);
        if (isdefined(s_barrier.script_noteworthy)) {
            if (s_barrier.script_noteworthy == "entry_barrier") {
                self.var_25c51a60bc088d9b[self.var_25c51a60bc088d9b.size] = self.var_e60f78a6da569e71[self.var_e60f78a6da569e71.size - 1];
            } else if (s_barrier.script_noteworthy == "exit_barrier") {
                self.var_2788b7f8dbde803d[self.var_2788b7f8dbde803d.size] = self.var_e60f78a6da569e71[self.var_e60f78a6da569e71.size - 1];
            } else if (s_barrier.script_noteworthy == "defend_exit") {
                self.var_686818ffab148c29[self.var_686818ffab148c29.size] = self.var_e60f78a6da569e71[self.var_e60f78a6da569e71.size - 1];
            }
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169a
// Size: 0x11c
function function_f90f151575eb87c0() {
    level endon("skipped");
    var_c6e42f4c295786d2 = getstructarray("breach_spawner_entry", "targetname");
    function_331a7395643a62a3(getstruct("breach_interact", "targetname"));
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Get inside that building.", level.players, "always", 2000, 1, 1);
    n_zombies = function_20385cfdc216f458();
    for (i = 0; i < var_c6e42f4c295786d2.size; i++) {
        a_s_spawners = function_b584f143ed0ec5d0(var_c6e42f4c295786d2[i].origin, n_zombies, var_c6e42f4c295786d2[i].radius);
        foreach (s_spawner in a_s_spawners) {
            ai_zombie = spawn_zombie(s_spawner);
            waitframe();
            if (isdefined(ai_zombie)) {
                ai_zombie thread function_a250d816c3645ad2(self);
            }
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bd
// Size: 0x8f
function function_28e004bcfd8a97e1() {
    var_c6e42f4c295786d2 = getstructarray("breach_zombie_spawner", "targetname");
    foreach (var_6a6b8244a086b1c9 in var_c6e42f4c295786d2) {
        var_6a6b8244a086b1c9.s_target = getstruct(var_6a6b8244a086b1c9.target, "targetname");
        var_6a6b8244a086b1c9 thread function_a687eb1efe2bd5fd(self);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1853
// Size: 0x14e
function function_a687eb1efe2bd5fd(var_30c47c676d823fea) {
    level endon("skipped");
    self endon("spawned");
    n_dist = squared(self.s_target.radius);
    n_zombies = function_20385cfdc216f458();
    while (1) {
        foreach (player in level.players) {
            if (distance2dsquared(self.s_target.origin, player.origin) <= n_dist) {
                a_s_spawners = function_b584f143ed0ec5d0(self.origin, n_zombies, self.radius);
                foreach (s_spawner in a_s_spawners) {
                    var_30c47c676d823fea spawn_zombie(s_spawner);
                }
                self notify("spawned");
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a8
// Size: 0x10c
function spawn_zombie(s_pt, var_dc4d4adf0397344e, n_radius) {
    if (!isdefined(var_dc4d4adf0397344e)) {
        var_dc4d4adf0397344e = 0;
    }
    var_31109020393ed11b = function_af6084ba33d72168();
    aitype = getdvar(@"hash_5254c3fbd200d7ee", var_31109020393ed11b);
    pos = level.var_4db5d2aa78c050a3;
    team = "team_two_hundred";
    ai_zombie = namespace_34f6a6adabfc542d::spawnnewagentaitype(aitype, s_pt.origin, s_pt.angles, team);
    waitframe();
    if (isalive(ai_zombie)) {
        ai_zombie namespace_dd16d65e824b8e9::function_b5e57408c7878df7(&function_20a33aa40305aafc);
        ai_zombie.team = "team_two_hundred";
        if (namespace_3c37cb17ade254d::function_51d76700600cebe3(20)) {
            var_9038e48904360a14 = "super_sprint";
        } else {
            var_9038e48904360a14 = "sprint";
        }
        ai_zombie namespace_dd16d65e824b8e9::function_f1e5805da192a1ef(var_9038e48904360a14, "default", 26);
        if (var_dc4d4adf0397344e) {
            ai_zombie thread function_87cc2a188277bd3b(n_radius);
        }
        return ai_zombie;
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abb
// Size: 0x123
function function_73e02a6755676888(s_pt, var_dc4d4adf0397344e, n_radius) {
    if (!isdefined(var_dc4d4adf0397344e)) {
        var_dc4d4adf0397344e = 0;
    }
    var_4661c9a486253047 = [0:"ar", 1:"lmg", 2:"smg"];
    var_434d2faf62ed069 = namespace_64135de19550f047::function_5881a353a471bd02(random(var_4661c9a486253047), s_pt.origin, s_pt.angles, "team_hundred_ninety", 2);
    waitframe();
    if (isalive(var_434d2faf62ed069)) {
        if (isdefined(var_434d2faf62ed069)) {
            self.var_5001eff44332b8d8++;
            if (isdefined(s_pt.target)) {
                var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_4c61a6fd42fa58(getstruct(s_pt.target, "targetname"));
            } else if (isdefined(s_pt.script_noteworthy) && s_pt.script_noteworthy == "sniper") {
                var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_b11c1964f528574b(var_434d2faf62ed069, 1, s_pt.origin);
            } else {
                var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(var_434d2faf62ed069, 128, 64, s_pt.origin);
            }
            return var_434d2faf62ed069;
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be5
// Size: 0x15b
function function_9472a81e1e313004(s_pt) {
    var_31109020393ed11b = function_af6084ba33d72168();
    aitype = getdvar(@"hash_5254c3fbd200d7ee", var_31109020393ed11b);
    pos = level.var_4db5d2aa78c050a3;
    team = "team_two_hundred";
    ai_zombie = namespace_34f6a6adabfc542d::spawnnewagentaitype(aitype, s_pt.origin, s_pt.angles, team);
    if (isdefined(ai_zombie) && ai_zombie function_8fa69650e33c84ef("spawn")) {
        ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
    }
    waitframe();
    if (isalive(ai_zombie)) {
        self.n_zombies++;
        ai_zombie.team = "team_two_hundred";
        ai_zombie namespace_dd16d65e824b8e9::function_b5e57408c7878df7(&function_20a33aa40305aafc);
        if (ai_zombie.agent_type == "actor_jup_spawner_zombie_base") {
            ai_zombie thread function_46c328e4e24b334a(self);
        } else {
            self.var_7c11b077004fcf2c++;
            ai_zombie thread function_beb2cfd9b21349d5(self);
        }
        if (namespace_3c37cb17ade254d::function_51d76700600cebe3(20)) {
            var_9038e48904360a14 = "super_sprint";
        } else {
            var_9038e48904360a14 = "sprint";
        }
        ai_zombie namespace_dd16d65e824b8e9::function_f1e5805da192a1ef(var_9038e48904360a14, "default", 26);
        ai_zombie thread function_87cc2a188277bd3b(1500);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d47
// Size: 0x30
function function_46c328e4e24b334a(s_quest) {
    self waittill("death");
    if (s_quest.n_zombies > 0) {
        s_quest.n_zombies--;
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7e
// Size: 0x3c
function function_beb2cfd9b21349d5(s_quest) {
    self waittill("death");
    if (s_quest.n_zombies > 0) {
        s_quest.n_zombies--;
        s_quest.var_7c11b077004fcf2c--;
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc1
// Size: 0x39
function function_af6084ba33d72168() {
    if (namespace_3c37cb17ade254d::function_51d76700600cebe3(20) && self.var_7c11b077004fcf2c < 6) {
        var_31109020393ed11b = "jup_spawner_zombie_base_armored_heavy";
    } else {
        var_31109020393ed11b = "jup_spawner_zombie_base";
    }
    return var_31109020393ed11b;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e02
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

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eeb
// Size: 0xcd
function function_9a77b5ad8fe80b87() {
    var_607fd6c265fe2a0 = getentarray("clip_zombie_breach", "targetname");
    foreach (mdl_clip in var_607fd6c265fe2a0) {
        if (isdefined(mdl_clip)) {
            mdl_clip movez(-10000, 0.1);
        }
    }
    level flag_wait("player_spawned");
    foreach (mdl_clip in var_607fd6c265fe2a0) {
        if (isdefined(mdl_clip)) {
            mdl_clip thread function_efc91437286e0ba1();
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fbf
// Size: 0x21
function function_efc91437286e0ba1() {
    self movez(10000, 0.1);
    self waittill("movedone");
    self disconnectpaths();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe7
// Size: 0x76
function function_af6ceb543695252b() {
    var_607fd6c265fe2a0 = getentarray("clip_zombie_breach", "targetname");
    foreach (mdl_clip in var_607fd6c265fe2a0) {
        if (isdefined(mdl_clip)) {
            mdl_clip connectpaths();
            waitframe();
            mdl_clip delete();
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2064
// Size: 0xd7
function function_1e86be4e3accaf94() {
    self.var_4118ca23a8b62b78 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(0);
    waitframe();
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_4118ca23a8b62b78, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_4118ca23a8b62b78, 0);
    namespace_5a22b6f3a56f7e9b::objective_add_objective(self.var_4118ca23a8b62b78, "current");
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, self.var_ca0439c2f79cc0fb.origin);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(self.var_4118ca23a8b62b78, "icon_waypoint_objective_general");
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_4118ca23a8b62b78);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.var_4118ca23a8b62b78, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(self.var_4118ca23a8b62b78, "neutral");
    self waittill("charge_planted");
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_4118ca23a8b62b78, "empty");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2142
// Size: 0x74
function function_822dee14a4f0bcef() {
    level endon("skipped");
    function_331a7395643a62a3(getstruct("turret_defend_start", "targetname"));
    var_eb8cbfe0a64c462 = getstruct("defend_explosion", "targetname");
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_4118ca23a8b62b78, "current");
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_4118ca23a8b62b78, var_eb8cbfe0a64c462.origin);
    level notify("story_quest_complete_step_1");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21bd
// Size: 0x100
function function_f47554e68b1efb26() {
    level waittill("story_quest_complete_step_1");
    namespace_8ef157d888576350::function_610dfcbf191b189b();
    self.var_ac351578b7196874 = [];
    self.var_be6bb0d3ba2db2fe = getstructarray("turret_ava", "targetname");
    foreach (s_turret in self.var_be6bb0d3ba2db2fe) {
        s_turret.turrettype = "defend_turret";
        s_turret.team = level.players[0].team;
        s_turret.owner = level.players[0];
        s_turret.var_6d9f48354b1ae939 = 1;
        s_turret.turret = namespace_8ef157d888576350::sentryturret_create(s_turret);
        s_turret.turret thread function_88345f502d8aabca(self);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c4
// Size: 0xb
function turret_defend_start() {
    thread function_e9e6bf7d03f3f4d8();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d6
// Size: 0xed
function function_e9e6bf7d03f3f4d8() {
    a_s_spawns = getstructarray("defend_zombie_spawner", "targetname");
    switch (level.players.size) {
    case 1:
        n_active = 15;
        break;
    case 2:
        n_active = 18;
        break;
    case 3:
        n_active = 20;
        break;
    case 4:
        n_active = 24;
        break;
    default:
        n_active = 8;
        break;
    }
    function_331a7395643a62a3(getstruct("defend_start", "targetname"));
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Get to those turrets!", level.players, "always", 2000, 1, 1);
    thread function_3f64e1ac142a5bf(n_active, a_s_spawns);
    wait(60);
    self notify("defend_done");
    level notify("story_quest_complete_step_2");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ca
// Size: 0x31
function function_88345f502d8aabca(s_quest) {
    self endon("death");
    s_quest waittill("defend_done");
    self notify("stop_shooting");
    wait(0.1);
    namespace_8ef157d888576350::sentryturret_setinactive(self);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2402
// Size: 0x73
function function_3f64e1ac142a5bf(n_active, var_f10d2bae0aa4fce7) {
    self endon("defend_done");
    while (1) {
        var_f10d2bae0aa4fce7 = array_randomize(var_f10d2bae0aa4fce7);
        for (i = 0; i < var_f10d2bae0aa4fce7.size; i++) {
            if (self.n_zombies < n_active) {
                function_9472a81e1e313004(var_f10d2bae0aa4fce7[i]);
                wait(randomfloatrange(0.5, 1));
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247c
// Size: 0x159
function function_17b8713dc49bd702() {
    self.var_3b8b18103d8d23c8 = [];
    foreach (s_turret in self.var_be6bb0d3ba2db2fe) {
        self.var_3b8b18103d8d23c8[self.var_3b8b18103d8d23c8.size] = namespace_64135de19550f047::function_586d4d82f07e0d09(s_turret);
    }
    waitframe();
    foreach (e_turret in self.var_3b8b18103d8d23c8) {
        e_turret.team = level.players[0].team;
    }
    self waittill("defend_done");
    foreach (e_turret in self.var_3b8b18103d8d23c8) {
        if (isdefined(e_turret) && isdefined(e_turret.attractor)) {
            function_349b67890a05c376(e_turret.attractor);
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25dc
// Size: 0xb8
function function_4683868ff58c695d(attractor, zombie) {
    if (isdefined(zombie.var_941802a0997e0c42)) {
        return 0;
    }
    if (isdefined(level.players)) {
        player = getclosest(zombie.origin, level.players, 2000);
        if (isdefined(player) && distance2dsquared(zombie.origin, player.origin) < distance2dsquared(zombie.origin, attractor.source.origin)) {
            return 0;
        }
    }
    if (isalive(zombie) && isdefined(attractor)) {
        return 1;
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x269b
// Size: 0xf5
function function_b7761880f3b34ef9() {
    level endon("skipped");
    thread function_caf7e8e50d7bee96();
    function_6a40feac381a035f();
    self.var_6cc0b5281f51f72f = getstruct("ava_comm_unit", "targetname");
    self.var_8023393488f5e8dd = utility::spawn_model("military_hq_crate_01_proxy_cp_spawnable", self.var_6cc0b5281f51f72f.origin, self.var_6cc0b5281f51f72f.angles);
    function_331a7395643a62a3(getstruct("breach_exit_point", "targetname"));
    function_20f503076f97ec85();
    while (self.var_5001eff44332b8d8 > 3) {
        wait(1);
    }
    thread function_3d663c40d26be001(1);
    while (self.var_5001eff44332b8d8 > 5) {
        wait(1);
    }
    function_804aa1cbd49ba400(getstructarray("merc_chopper", "targetname"));
    flag_wait("merc_airborne");
    flag_set("ava_vehicle_go");
    level notify("story_quest_complete_step_3");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2797
// Size: 0x19d
function function_3d663c40d26be001(n_wave) {
    n_total = function_ee63d6fa5d4d6e87(n_wave);
    n_active = function_cbec893df583aecc();
    n_spawned = 0;
    var_4661c9a486253047 = [0:"ar", 1:"lmg", 2:"smg"];
    while (1) {
        if (self.var_5001eff44332b8d8 < n_active) {
            s_spawner = function_254323e1a248db9a(getstructarray("merc_spawn_pos", "targetname"));
            var_434d2faf62ed069 = namespace_64135de19550f047::function_5881a353a471bd02(random(var_4661c9a486253047), s_spawner.origin, s_spawner.angles, "team_hundred_ninety", 2);
            if (isdefined(var_434d2faf62ed069)) {
                self.var_5001eff44332b8d8++;
                if (isdefined(s_spawner.target)) {
                    var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_4c61a6fd42fa58(getstruct(s_spawner.target, "targetname"));
                } else if (isdefined(s_spawner.script_noteworthy) && s_spawner.script_noteworthy == "sniper") {
                    var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_b11c1964f528574b(var_434d2faf62ed069, 1, s_spawner.origin);
                } else {
                    var_434d2faf62ed069 thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(var_434d2faf62ed069, 128, 64, s_spawner.origin);
                }
                var_434d2faf62ed069 thread function_a344f88e91b8c4ee();
                var_434d2faf62ed069 thread function_d9f63cad62a5df8e(self);
                n_spawned++;
                if (n_spawned >= n_total) {
                    break;
                }
            }
        }
        wait(randomfloatrange(0.5, 1.5));
    }
    thread function_2cc571d4c77b4052();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293b
// Size: 0x27
function function_a344f88e91b8c4ee() {
    self endon("death");
    thread function_87cc2a188277bd3b(1500);
    while (1) {
        self findbestcovernode();
        wait(3);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2969
// Size: 0x2e
function function_d9f63cad62a5df8e(s_quest) {
    self waittill("death");
    if (s_quest.var_5001eff44332b8d8) {
        s_quest.var_5001eff44332b8d8--;
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299e
// Size: 0x2c6
function function_20f503076f97ec85() {
    self.var_c271e0870dfe0089 = [];
    var_a756dbc9ec43e6c4 = "veh9_techo_rebel_armor";
    self.var_f3bc9650a3828799 = [];
    self.var_f3bc9550a3828566 = [];
    self.var_f3bc9650a3828799["merc_veh_0"] = var_a756dbc9ec43e6c4;
    self.var_f3bc9550a3828566["merc_veh_1"] = var_a756dbc9ec43e6c4;
    var_d2a21a88ac01c152 = getstruct("merc_veh_0", "targetname");
    var_d2a21b88ac01c385 = getstruct("merc_veh_1", "targetname");
    wait(0.1);
    var_d2a21a88ac01c152.spawndata = spawnstruct();
    var_d2a21a88ac01c152.spawndata.angles = var_d2a21a88ac01c152.angles;
    var_d2a21a88ac01c152.spawndata.origin = var_d2a21a88ac01c152.origin;
    var_d2a21a88ac01c152.spawndata.var_f16652e1462a3739 = 1;
    var_d2a21b88ac01c385.spawndata = spawnstruct();
    var_d2a21b88ac01c385.spawndata.angles = var_d2a21b88ac01c385.angles;
    var_d2a21b88ac01c385.spawndata.origin = var_d2a21b88ac01c385.origin;
    var_d2a21b88ac01c385.spawndata.var_f16652e1462a3739 = 1;
    foreach (refname in self.var_f3bc9650a3828799) {
        self.var_c271e0870dfe0089[self.var_c271e0870dfe0089.size] = namespace_1f188a13f7e79610::vehicle_spawn(refname, var_d2a21a88ac01c152.spawndata);
    }
    foreach (refname in self.var_f3bc9550a3828566) {
        self.var_c271e0870dfe0089[self.var_c271e0870dfe0089.size] = namespace_1f188a13f7e79610::vehicle_spawn(refname, var_d2a21b88ac01c385.spawndata);
    }
    wait(0.5);
    foreach (var_4935eb9a94a96a5 in self.var_c271e0870dfe0089) {
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(var_4935eb9a94a96a5);
        var_4935eb9a94a96a5.var_22aa4aa0cf0aa6bb = 1;
        var_4935eb9a94a96a5 thread function_81736a1ad0f27c6(self);
    }
    wait(3);
    thread function_2cc571d4c77b4052();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6b
// Size: 0xbf
function function_b5d2e634d5a8cef4(var_54492f7bf0674200, var_2ac677774b7330eb) {
    for (i = 0; i < var_2ac677774b7330eb; i++) {
        var_f5c1001be3a71548 = [0:"ar", 1:"lmg", 2:"smg"];
        ai_rider = namespace_64135de19550f047::function_5881a353a471bd02(random(var_f5c1001be3a71548), self.origin + (0, 0, 128), self.angles, "team_hundred_ninety", 2);
        waitframe();
        if (isdefined(ai_rider)) {
            var_54492f7bf0674200.var_5001eff44332b8d8++;
            namespace_4ff41449ab14a3a0::guy_enter(ai_rider);
            ai_rider thread function_d9f63cad62a5df8e(var_54492f7bf0674200);
            ai_rider thread function_265fc153525cc5e3();
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d31
// Size: 0x27
function function_265fc153525cc5e3() {
    self endon("death");
    self waittill("jumpedout");
    wait(1);
    function_a344f88e91b8c4ee();
    thread function_87cc2a188277bd3b(1500);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d5f
// Size: 0x5a
function function_81736a1ad0f27c6(var_54492f7bf0674200) {
    self endon("death");
    var_d993688670684035 = getvehiclenodearray("merc_start", "targetname");
    nd_start = getclosest(self.origin, var_d993688670684035);
    function_b5d2e634d5a8cef4(var_54492f7bf0674200, 4);
    namespace_dbbb37eb352edf96::attach_vehicle_and_gopath(nd_start);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc0
// Size: 0x1b9
function function_804aa1cbd49ba400(a_s_pos) {
    foreach (s_pos in a_s_pos) {
        s_pos.spawndata = spawnstruct();
        s_pos.spawndata.origin = s_pos.origin;
        s_pos.spawndata.angles = s_pos.angles;
        s_pos.spawndata.spawntype = "GAME_MODE";
        s_pos.var_c0bd36d87d262001 = namespace_1f188a13f7e79610::vehicle_spawn("veh_jup_blima", s_pos.spawndata);
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(s_pos.var_c0bd36d87d262001);
        s_pos.var_c0bd36d87d262001 namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
        s_pos.var_c0bd36d87d262001.var_1e897ae1c018b2c2 = "team_hundred_ninety";
        s_pos.var_c0bd36d87d262001.unload_land_offset = 255;
        s_pos.var_c0bd36d87d262001.script_disconnectpaths = 1;
        s_pos.var_c0bd36d87d262001.vehiclesetuprope = 1;
        s_pos.var_c0bd36d87d262001.ignorelist = [0:s_pos.var_c0bd36d87d262001];
        s_pos.var_c0bd36d87d262001 thread function_514f522c0fd10ad7(self, getstruct(s_pos.target, "targetname"));
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f80
// Size: 0x15d
function function_514f522c0fd10ad7(var_54492f7bf0674200, s_goal) {
    self endon("death");
    self.var_f585b76d7f472cd9 = [];
    var_4661c9a486253047 = [0:"ar", 1:"lmg", 2:"smg"];
    for (i = 0; i < 5; i++) {
        var_434d2faf62ed069 = namespace_64135de19550f047::function_5881a353a471bd02(random(var_4661c9a486253047), self.origin, self.angles, "team_hundred_ninety", 2);
        if (isdefined(var_434d2faf62ed069)) {
            self.var_f585b76d7f472cd9[i] = var_434d2faf62ed069;
        }
        waitframe();
    }
    namespace_5d57e6b81b105f5d::function_35c699c709e24b69(self.var_f585b76d7f472cd9);
    self vehicle_setspeed(60, 10, 8);
    while (1) {
        if (isdefined(s_goal.script_noteworthy) && s_goal.script_noteworthy == "drop_off") {
            heli_unload(s_goal.origin);
        } else {
            self setvehgoalpos(s_goal.origin, 1);
            self waittill("goal");
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            break;
        }
    }
    var_54492f7bf0674200 flag_set("merc_airborne");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e4
// Size: 0x88
function heli_unload(var_c690b5b36d8cd7dc) {
    self setvehgoalpos(var_c690b5b36d8cd7dc, 1);
    self waittill("goal");
    var_b3941e6a151cf4d2 = namespace_b479ac682b93cd92::_vehicle_unload();
    self waittill("unloaded");
    foreach (guy in var_b3941e6a151cf4d2) {
        guy.var_f327ed481efe4857 = undefined;
    }
    return var_b3941e6a151cf4d2;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3174
// Size: 0x38
function function_baacb480af33c3a(var_54492f7bf0674200, var_d7e068451b27f650, var_c64d7f43bc274daf) {
    self endon("death");
    var_54492f7bf0674200.var_5001eff44332b8d8++;
    thread function_d9f63cad62a5df8e(var_54492f7bf0674200);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b3
// Size: 0x3
function function_47ed1b5ac747e803() {
    
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31bd
// Size: 0x288
function function_caf7e8e50d7bee96() {
    var_20e578a22db9e8e7 = "veh9_mil_cargo_truck";
    self.var_2adad5a67432a282 = undefined;
    self.var_88e38b1e209c9e97 = [];
    self.var_88e38b1e209c9e97["ava_cargo_truck_spawn"] = var_20e578a22db9e8e7;
    var_45883bdaf8a56684 = getstruct("ava_cargo_truck_spawn", "targetname");
    var_f8badd4d0d0be590 = getent("trigger_ava_vehicle", "targetname");
    wait(1);
    spawndata = spawnstruct();
    spawndata.angles = var_45883bdaf8a56684.angles;
    spawndata.origin = var_45883bdaf8a56684.origin;
    spawndata.team = level.players[0].team;
    var_f8badd4d0d0be590 enablelinkto();
    foreach (refname in self.var_88e38b1e209c9e97) {
        while (!isdefined(self.var_2adad5a67432a282)) {
            self.var_2adad5a67432a282 = namespace_1f188a13f7e79610::vehicle_spawn(refname, spawndata);
        }
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(self.var_2adad5a67432a282);
        self.var_2adad5a67432a282.nohitmarkers = 1;
        self.var_2adad5a67432a282.var_22aa4aa0cf0aa6bb = 1;
    }
    waitframe();
    var_f8badd4d0d0be590 linkto(self.var_2adad5a67432a282);
    nd_start = getvehiclenode("ava_rail_start", "targetname");
    waitframe();
    self.var_2adad5a67432a282 thread namespace_dbbb37eb352edf96::attach_vehicle(nd_start);
    flag_wait("ava_vehicle_go");
    thread function_b38b0cc78701b351();
    wait(20);
    self.var_2adad5a67432a282 thread namespace_dbbb37eb352edf96::attach_vehicle_and_gopath(nd_start);
    self.var_2adad5a67432a282 function_6086b203cd6eda0d();
    self.var_2adad5a67432a282 thread function_5401ab18e4d575fb(self);
    self.var_2adad5a67432a282 thread function_90bd7ad48c0646e5(self);
    self.var_2adad5a67432a282 thread function_f01ae83dfe738dc1(self);
    self.var_2adad5a67432a282 thread function_65c38625d2694a55(var_f8badd4d0d0be590);
    self.var_2adad5a67432a282 thread function_36ee3c256bf542de(self);
    self.var_2adad5a67432a282 thread function_14f4e7962be2643f(self);
    self.var_2adad5a67432a282 thread function_ed4651890d65a6f8(self);
    self.var_2adad5a67432a282 thread function_b38a73fc6aa9721f(self);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344c
// Size: 0x10b
function function_b38b0cc78701b351() {
    var_82a6f259e309287e = getstructarray("horde_attractor", "targetname");
    foreach (var_24c1b984117168cd in var_82a6f259e309287e) {
        var_24c1b984117168cd.attractor = namespace_5381a59d140f4df8::function_c7a50ec2829c70b3(var_24c1b984117168cd, 1, 1000, 0, undefined, &function_b38f0b92e2bc5fdb);
    }
    self.var_2adad5a67432a282 waittill("entry");
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.var_4118ca23a8b62b78, self.var_2adad5a67432a282);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.var_4118ca23a8b62b78, 64);
    foreach (var_24c1b984117168cd in var_82a6f259e309287e) {
        namespace_5381a59d140f4df8::function_349b67890a05c376(var_24c1b984117168cd.attractor);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x355e
// Size: 0x3f
function function_6086b203cd6eda0d() {
    self endon("death");
    self waittill("entry");
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Get on the Truck!", level.players, "never", 2000, 1, 1);
    self vehicle_setspeed(0, 5, 3);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a4
// Size: 0x98
function function_f01ae83dfe738dc1(s_quest) {
    var_c6e42f4c295786d2 = getstructarray("ava_vehicle_zombie_spawner", "targetname");
    foreach (var_6a6b8244a086b1c9 in var_c6e42f4c295786d2) {
        var_6a6b8244a086b1c9.s_target = getstruct(var_6a6b8244a086b1c9.target, "targetname");
        var_6a6b8244a086b1c9 thread function_c364169c42d7d5b6(s_quest);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3643
// Size: 0xa0
function function_5401ab18e4d575fb(s_quest) {
    var_fdbc62a2eb9677f = getstructarray("ava_vehicle_merc_spawner", "targetname");
    self waittill("mercs");
    foreach (var_a78bcf6ec986182 in var_fdbc62a2eb9677f) {
        s_quest function_73e02a6755676888(var_a78bcf6ec986182, 1);
    }
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Keep Ava safe!", level.players, "always", 2000, 1, 1);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ea
// Size: 0xfa
function function_c364169c42d7d5b6(var_30c47c676d823fea) {
    level endon("skipped");
    self endon("spawned");
    n_dist = squared(self.s_target.radius);
    while (1) {
        if (distance2dsquared(self.s_target.origin, var_30c47c676d823fea.var_2adad5a67432a282.origin) <= n_dist) {
            a_s_spawners = function_b584f143ed0ec5d0(self.origin, 8, self.radius);
            foreach (s_spawner in a_s_spawners) {
                var_30c47c676d823fea spawn_zombie(s_spawner, 1);
            }
            self notify("spawned");
        }
        wait(0.5);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37eb
// Size: 0x150
function function_90bd7ad48c0646e5(s_quest) {
    self endon("death");
    self endon("flats");
    var_12efaa62b82333c5 = [0:"tag_wheel_center_front_left", 1:"tag_wheel_center_front_right", 2:"tag_wheel_center_middle_left", 3:"tag_wheel_center_middle_right", 4:"tag_wheel_center_back_left", 5:"tag_wheel_center_back_right"];
    var_12efaa62b82333c5 = array_randomize(var_12efaa62b82333c5);
    damagedata = spawnstruct();
    damagedata.damage = 10;
    damagedata.meansofdeath = "MOD_RIFLE_BULLET";
    i = 0;
    while (1) {
        self waittill("flat");
        damagedata.partname = var_12efaa62b82333c5[i];
        damagedata.point = self gettagorigin(damagedata.partname);
        namespace_5a0f3ca265d3a4c8::function_152437480e61a8a2(self, damagedata, 200);
        i++;
        if (i == 1) {
            s_quest thread function_257f748de6279425();
            namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("We've got a flat!", level.players, "never", 2000, 1, 1);
        } else if (i > 2) {
            thread function_e29c6f098b10c447(s_quest);
            thread function_ad7ba8e61ac998ca(s_quest);
            wait(1.5);
            self.var_46fd5434deb2172d = 1;
            self notify("flats");
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3942
// Size: 0x40
function function_e29c6f098b10c447(s_quest) {
    self endon("death");
    self vehicle_setspeed(0, 5, 3);
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Repair the Tires!", level.players, "never", 2000, 1, 1);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3989
// Size: 0x2f
function function_257f748de6279425() {
    a_s_spawners = getstructarray("ambush_zombie_spawner", "targetname");
    n_zombies = function_ab65e0d9a8828ab2();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39bf
// Size: 0x6f
function function_ad7ba8e61ac998ca(s_quest) {
    self endon("death");
    while (1) {
        if (isdefined(self.var_58053eabd77a8c48) && !self.var_58053eabd77a8c48) {
            break;
        }
        wait(1);
    }
    self.var_46fd5434deb2172d = undefined;
    if (isdefined(s_quest.broadcast)) {
        namespace_236d5e32d01e927d::function_dacc8aa0d16e4487(level.players, s_quest.broadcast);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a35
// Size: 0x51
function function_36ee3c256bf542de(s_quest) {
    self endon("death");
    self waittill("chopper");
    s_quest thread function_328d961097692dd1();
    s_quest thread function_d58e9fe01994f55();
    wait(1);
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Destroy that chopper!", level.players, "always", 2000, 1, 1);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8d
// Size: 0x5f
function function_14f4e7962be2643f(s_quest) {
    self endon("death");
    self waittill("divert");
    s_quest.var_e5141adfc5fa60b2 notify("stop_attack");
    s_quest.var_e5141adfc5fa60b2.var_48cd7fef3ff8de9 = "flank";
    wait(3);
    s_quest.var_e5141adfc5fa60b2 thread function_5e3044d71dec3655(self);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3af3
// Size: 0x6e
function function_ed4651890d65a6f8(s_quest) {
    self endon("death");
    self waittill("turn");
    if (isdefined(s_quest.var_e5141adfc5fa60b2)) {
        s_quest.var_e5141adfc5fa60b2 notify("stop_attack");
        s_quest.var_e5141adfc5fa60b2.var_48cd7fef3ff8de9 = "forward";
    }
    wait(3);
    s_quest.var_e5141adfc5fa60b2 thread function_5e3044d71dec3655(self);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b68
// Size: 0xf5
function function_65c38625d2694a55(var_f8badd4d0d0be590) {
    self endon("death");
    self endon("reached_end_node");
    n_touching = 0;
    while (1) {
        foreach (player in level.players) {
            if (player istouching(var_f8badd4d0d0be590)) {
                n_touching++;
            }
        }
        if (n_touching != level.players.size || isdefined(self.var_46fd5434deb2172d)) {
            n_speed = 0;
        } else if (isdefined(self.var_bd3f3353ccaa316c)) {
            n_speed = self.currentnode.speed;
        } else {
            n_speed = 15;
        }
        wait(0.5);
        self vehicle_setspeed(n_speed, 5, 3);
        wait(1);
        n_touching = 0;
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c64
// Size: 0x75
function function_5c121a4085ec0536(a_s_spawners, n_zombies) {
    n_spawns = 0;
    while (1) {
        s_pt = function_7a2aaa4a09a4d250(a_s_spawners);
        ai_zombie = spawn_zombie(s_pt);
        waitframe();
        if (isdefined(ai_zombie)) {
            if (namespace_3c37cb17ade254d::function_51d76700600cebe3(50)) {
                ai_zombie thread function_87cc2a188277bd3b(1000);
            }
            n_spawns++;
            if (n_spawns >= n_zombies) {
                break;
            }
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ce0
// Size: 0x5b
function function_110ac03f5f4575e(a_s_spawners, n_zombies) {
    for (i = 0; i < n_zombies; i++) {
        s_pt = function_7a2aaa4a09a4d250(a_s_spawners);
        ai_zombie = spawn_zombie(s_pt, 1, 3000);
        wait(0.1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d42
// Size: 0x2a3
function function_328d961097692dd1() {
    var_bd437e647db702f9 = "veh_jup_hind";
    s_pos = getstruct("merc_hind", "targetname");
    s_goal = getstruct(s_pos.target, "targetname");
    spawndata = spawnstruct();
    spawndata.origin = s_pos.origin;
    spawndata.angles = s_pos.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.model = "veh9_mil_air_heli_hind_vehphys_mp";
    var_3fdedb60564fc5b5 = 3000;
    if (level.players.size > 3) {
        var_3fdedb60564fc5b5 = 5000;
    }
    var_7c7d90612cbaf0b0 = [];
    var_7c7d90612cbaf0b0["merc_hind"] = var_bd437e647db702f9;
    self.var_e5141adfc5fa60b2 = namespace_1f188a13f7e79610::vehicle_spawn(var_bd437e647db702f9, spawndata);
    self.var_e5141adfc5fa60b2.turrets = [];
    waitframe();
    self.var_e5141adfc5fa60b2.var_957ab8a408066abf = spawnturret("misc_turret", self.var_e5141adfc5fa60b2 gettagorigin("tag_rocket_right1"), "chopper_support_turret_mp");
    self.var_e5141adfc5fa60b2.var_957ab8a408066abf linkto(self.var_e5141adfc5fa60b2, "tag_turret");
    self.var_e5141adfc5fa60b2.var_957ab8a408066abf setmode("manual");
    self.var_e5141adfc5fa60b2.health = var_3fdedb60564fc5b5;
    self.var_e5141adfc5fa60b2.vehiclename = "Helicopter";
    self.var_e5141adfc5fa60b2.crashoffset = 1030;
    self.var_e5141adfc5fa60b2 thread namespace_49e272e116f37d0::function_e3ab01a91dc64df0();
    namespace_ad22b9cf6a2b30d::set_death_callback(self.var_e5141adfc5fa60b2.vehiclename, &function_82d4517b0ad36467);
    self.var_e5141adfc5fa60b2 vehicle_setspeed(160, 40, 20);
    self.var_e5141adfc5fa60b2 setlookatent(self.var_2adad5a67432a282);
    self.var_e5141adfc5fa60b2 setvehgoalpos(s_goal.origin, 0);
    self.var_e5141adfc5fa60b2 waittill("goal");
    self.var_e5141adfc5fa60b2.var_48cd7fef3ff8de9 = "rear";
    self.var_e5141adfc5fa60b2 thread function_f0b5dc7c40caf038(self.var_2adad5a67432a282);
    self.var_e5141adfc5fa60b2 thread function_5e3044d71dec3655(self.var_2adad5a67432a282);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fec
// Size: 0x10c
function function_5e3044d71dec3655(var_2adad5a67432a282) {
    self endon("death");
    self endon("stop_attack");
    var_2adad5a67432a282 endon("death");
    while (1) {
        v_target = vectornormalize(anglestoforward(var_2adad5a67432a282.angles)) * 1000 + var_2adad5a67432a282.origin;
        if (isdefined(self) && function_3b142e491735475(var_2adad5a67432a282)) {
            var_8235c33fd3999de7 = magicbullet(makeweapon("samsite_missile_weapon"), self gettagorigin("tag_rocket_right1") + (0, 0, -16), v_target + (200, 200, 200));
            var_8235c33fd3999de7 thread function_36582d5c1ccc8447();
            wait(1);
            var_8235c33fd3999de7 = magicbullet(makeweapon("samsite_missile_weapon"), self gettagorigin("tag_rocket_left1") + (0, 0, -16), v_target + (-200, -200, 200));
            var_8235c33fd3999de7 thread function_36582d5c1ccc8447();
            wait(randomfloatrange(4, 5));
        }
        wait(1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ff
// Size: 0x24
function function_36582d5c1ccc8447() {
    self waittill("death");
    if (isdefined(self)) {
        playsoundatpos(self.origin, "evt_ob_q_object_explo");
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412a
// Size: 0x109
function function_f0b5dc7c40caf038(var_2adad5a67432a282) {
    self endon("death");
    var_2adad5a67432a282 endon("death");
    while (1) {
        if (self.var_48cd7fef3ff8de9 == "rear") {
            v_goal = vectornormalize(anglestoforward(var_2adad5a67432a282.angles)) * -1500 + var_2adad5a67432a282.origin;
            n_speed = 100;
        } else if (self.var_48cd7fef3ff8de9 == "forward") {
            v_goal = vectornormalize(anglestoforward(var_2adad5a67432a282.angles)) * 2500 + var_2adad5a67432a282.origin;
            n_speed = 200;
        } else {
            v_goal = vectornormalize(anglestoright(var_2adad5a67432a282.angles)) * 2500 + var_2adad5a67432a282.origin;
            n_speed = 150;
        }
        self vehicle_setspeed(n_speed, 20, 10);
        if (n_speed) {
            self setvehgoalpos(v_goal + (0, 0, 1200), 0);
        }
        wait(1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x423a
// Size: 0x14f
function function_d58e9fe01994f55() {
    s_pos = getstruct("ava_chopper", "targetname");
    spawndata = spawnstruct();
    spawndata.origin = s_pos.origin;
    spawndata.angles = s_pos.angles;
    spawndata.spawntype = "GAME_MODE";
    self.ava_chopper = undefined;
    while (1) {
        self.ava_chopper = namespace_1f188a13f7e79610::vehicle_spawn("veh9_palfa", spawndata);
        if (isdefined(self.ava_chopper)) {
            break;
        }
        wait(0.1);
    }
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(self.ava_chopper);
    self.ava_chopper namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    self.ava_chopper.var_878914b0358bc7b5 = [];
    self.ava_chopper.var_c9164736baf0694a = [];
    self.ava_chopper.onstartriding = &function_b28cb16c37f8e7b;
    self.ava_chopper.onendriding = &function_5f4563731f3e286f;
    self.ava_chopper.unload_land_offset = 255;
    self.ava_chopper thread function_1b93f9a5bdc20396(s_pos);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4390
// Size: 0x15
function function_b28cb16c37f8e7b(player) {
    thread function_f814294925882e0(player);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43ac
// Size: 0x124
function function_f814294925882e0(player) {
    player notify("endon_enter_walkable_vehicle");
    player endon("endon_enter_walkable_vehicle");
    player endon("disconnect");
    player waittill("entered_vehicle_interior");
    self.var_878914b0358bc7b5 = function_6d6af8144a5131f1(self.var_c9164736baf0694a, player);
    namespace_d9c77dc2a6fe29c6::enableoobimmunity(player);
    player.var_68b9486f4adbcb62 = 1;
    foreach (player in self.var_878914b0358bc7b5) {
        if (!istrue(player.var_68b9486f4adbcb62)) {
            return;
        }
    }
    if (!istrue(self.leaving) && isdefined(self.var_878914b0358bc7b5) && self.var_878914b0358bc7b5.size == level.players.size) {
        if (isdefined(level.var_54492f7bf0674200.broadcast)) {
            namespace_236d5e32d01e927d::function_dacc8aa0d16e4487(level.players, level.var_54492f7bf0674200.broadcast);
        }
        thread function_3c26533e550baeb9();
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44d7
// Size: 0x66
function function_5f4563731f3e286f(player) {
    player notify("endon_enter_walkable_vehicle");
    self.var_878914b0358bc7b5[player.guid] = undefined;
    if (isdefined(player) && isint(player.oobimmunity)) {
        namespace_d9c77dc2a6fe29c6::disableoobimmunity(player);
    }
    player notify("endon_exfil_inside_vehicle_timer");
    player.var_68b9486f4adbcb62 = undefined;
    thread function_59e7feccaa753a46(player);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4544
// Size: 0x6f
function function_59e7feccaa753a46(player, var_45fd392609262a96) {
    self endon("death");
    if ((istrue(self.leaving) || istrue(var_45fd392609262a96)) && !istrue(player.var_68b9486f4adbcb62)) {
        namespace_36f464722d326bbe::function_852712268d005332(player, 1, 0.25);
        player setorigin(self gettagorigin("tag_seat_7"));
        level thread namespace_36f464722d326bbe::function_852712268d005332(player, 0, 0.25);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45ba
// Size: 0xa2
function function_3c26533e550baeb9() {
    self endon("death");
    s_start = getstruct("exfil_start", "targetname");
    s_end = getstruct(s_start.target, "targetname");
    self vehicle_setspeed(60, 10, 8);
    self setvehgoalpos(s_start.origin, 0);
    self waittill("goal");
    self vehicle_setspeed(100, 10, 8);
    self setvehgoalpos(s_end.origin, 0);
    wait(5);
    level notify("game_ended");
    level thread function_bf01aba31e9023d1();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4663
// Size: 0x131
function function_1b93f9a5bdc20396(s_pos) {
    self endon("death");
    self vehicle_setspeed(60, 10, 8);
    s_goal = getstruct(s_pos.target, "targetname");
    while (isdefined(s_goal)) {
        if (isdefined(s_goal.script_noteworthy) && s_goal.script_noteworthy == "land") {
            self vehicle_setspeed(10, 10, 8);
            self setvehgoalpos(s_goal.origin, 1);
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(level.var_54492f7bf0674200.var_4118ca23a8b62b78, self);
            namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(level.var_54492f7bf0674200.var_4118ca23a8b62b78, 48);
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
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Get to the chopper!", level.players, "always", 2000, 1, 1);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x479b
// Size: 0x23
function function_b38a73fc6aa9721f(s_quest) {
    self endon("death");
    self waittill("reached_end_node");
    level notify("story_quest_complete_step_4");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c5
// Size: 0xb8
function function_bf01aba31e9023d1() {
    foreach (player in level.players) {
        setmusicstate("gameover");
        player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
        namespace_d576b6dc7cef9c62::processlobbydataforclient(player);
        namespace_cddd3ad399b210ff::processlobbydata();
        namespace_633301c58b0b0cec::processcommonplayerdataforplayer(player);
        wait(2.5);
        level thread namespace_36f464722d326bbe::function_852712268d005332(player, 1, 1);
        thread namespace_d576b6dc7cef9c62::endgame(player.team, game["end_reason"]["objective_completed"]);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4884
// Size: 0xa3
function function_331a7395643a62a3(s_spot) {
    n_dist = squared(s_spot.radius);
    while (1) {
        foreach (player in level.players) {
            if (distance2dsquared(s_spot.origin, player.origin) < n_dist) {
                return;
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x492e
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

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49d0
// Size: 0x158
function function_6a40feac381a035f() {
    var_607fd6c265fe2a0 = getentarray("clip_zombie_breach", "targetname");
    foreach (mdl_clip in var_607fd6c265fe2a0) {
        if (isdefined(mdl_clip) && isdefined(mdl_clip.script_noteworthy) && mdl_clip.script_noteworthy == "breach_exit") {
            playfx(getfx("c4_explosion"), mdl_clip.origin);
            playsoundatpos(mdl_clip.origin, "evt_ob_q_object_explo");
            mdl_clip connectpaths();
            wait(0.1);
            mdl_clip delete();
        }
    }
    foreach (var_b30aeb64ddc7b951 in self.var_2788b7f8dbde803d) {
        var_b30aeb64ddc7b951 delete();
    }
    var_eb8cbfe0a64c462 = getstruct("defend_explosion", "targetname");
    thread function_db21ab0a6b9e93ee(var_eb8cbfe0a64c462, 100);
    thread ava_spawn();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2f
// Size: 0x7e
function function_cbec893df583aecc() {
    switch (level.players.size) {
    case 1:
        n_active = 5;
        break;
    case 2:
        n_active = 6;
        break;
    case 3:
        n_active = 8;
        break;
    case 4:
        n_active = 10;
        break;
    default:
        n_active = 13;
        break;
    }
    return n_active;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb5
// Size: 0x31
function function_ee63d6fa5d4d6e87(n_wave) {
    n_active = function_cbec893df583aecc();
    n_total = n_active + n_wave * 2 + n_wave;
    return n_total;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bee
// Size: 0x34
function function_2cc571d4c77b4052() {
    self endon("wave_done");
    thread function_8313312f00f4badd();
    while (1) {
        if (self.var_5001eff44332b8d8 < 5) {
            self notify("wave_done");
        }
        wait(1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c29
// Size: 0x20
function function_8313312f00f4badd() {
    self endon("wave_done");
    wait(20);
    while (1) {
        self notify("wave_done");
        wait(1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c50
// Size: 0x81
function function_b38f0b92e2bc5fdb(attractor, zombie) {
    if (distance2dsquared(zombie.origin, attractor.source.origin) < 1000000 && !isdefined(zombie.var_33e9b8b06770859a)) {
        zombie.var_33e9b8b06770859a = 1;
        zombie thread function_87cc2a188277bd3b(1500);
        return 0;
    }
    if (isdefined(zombie.var_33e9b8b06770859a)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cd9
// Size: 0xd2
function function_3dd03206e8d95f5d(attractor, zombie) {
    if (isdefined(level.players)) {
        player = getclosest(zombie.origin, level.players);
        if (isdefined(player) && distance2dsquared(zombie.origin, player.origin) < 40000 && isdefined(attractor.var_2adad5a67432a282) && !player istouching(attractor.var_2adad5a67432a282) && !isdefined(zombie.var_33e9b8b06770859a)) {
            zombie.var_33e9b8b06770859a = 1;
            zombie thread function_87cc2a188277bd3b(1500);
            return 0;
        }
    }
    if (isdefined(zombie.var_33e9b8b06770859a)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4db3
// Size: 0x2e
function zombie_death_watcher(s_quest) {
    self waittill("death");
    if (s_quest.n_zombies) {
        s_quest.n_zombies--;
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4de8
// Size: 0x7e
function function_d5923ceea7a3af1d() {
    switch (level.players.size) {
    case 1:
        n_active = 5;
        break;
    case 2:
        n_active = 7;
        break;
    case 3:
        n_active = 10;
        break;
    case 4:
        n_active = 12;
        break;
    default:
        n_active = 12;
        break;
    }
    return n_active;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e6e
// Size: 0x66
function function_dbfe8c600c66f236(s_quest) {
    self endon("death");
    s_quest.var_2adad5a67432a282 waittill("ambush");
    while (1) {
        if (distance2dsquared(s_quest.var_2adad5a67432a282.origin, self.origin) > 5760000) {
            self kill();
        }
        wait(0.5);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4edb
// Size: 0x1e
function function_82d4517b0ad36467(data) {
    namespace_343543689c1d8859::choppersupport_handledeathdamage(data);
    self notify("death");
    return 1;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f01
// Size: 0x59
function function_20a33aa40305aafc(params) {
    if (isdefined(params.eattacker) && params.eattacker.classname == "misc_turret") {
        return int(params.idamage * 50);
    }
    return params.idamage;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f62
// Size: 0x19
function on_player_spawned(params) {
    level flag_set("player_spawned");
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f82
// Size: 0x96
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
        return 0;
    }
    return 1;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5020
// Size: 0xa4
function function_254323e1a248db9a(a_s_spawners) {
    while (1) {
        b_can_see = 0;
        s_spawner = function_7a2aaa4a09a4d250(a_s_spawners);
        foreach (player in level.players) {
            if (player player_looking_at(s_spawner.origin)) {
                b_can_see = 1;
            }
        }
        if (!b_can_see) {
            return s_spawner;
        }
        wait(0.1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50cb
// Size: 0x11e
function function_db21ab0a6b9e93ee(var_4444dee8b3dba8fa, n_radius) {
    a_doors = [];
    var_99c4d97ba39f21cf = getentitylessscriptablearray(undefined, undefined, var_4444dee8b3dba8fa.origin, n_radius);
    foreach (scriptable in var_99c4d97ba39f21cf) {
        if (isdefined(scriptable.type) && issubstr(scriptable.type, "door")) {
            a_doors = function_6d6af8144a5131f1(a_doors, scriptable);
        }
    }
    foreach (door in a_doors) {
        if (door scriptabledoorisclosed()) {
            door scriptabledooropen("away", var_4444dee8b3dba8fa.origin);
        }
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51f0
// Size: 0x132
function defend_exit() {
    self waittill("defend_done");
    var_eb8cbfe0a64c462 = getstruct("defend_explosion", "targetname");
    playfx(getfx("c4_explosion"), var_eb8cbfe0a64c462.origin);
    playsoundatpos(var_eb8cbfe0a64c462.origin, "evt_ob_q_object_explo");
    foreach (mdl_clip in self.var_607fd6c265fe2a0) {
        if (isdefined(mdl_clip) && isdefined(mdl_clip.script_noteworthy) && mdl_clip.script_noteworthy == "defend_exit_clip") {
            mdl_clip connectpaths();
            waitframe();
            mdl_clip delete();
        }
    }
    foreach (var_b30aeb64ddc7b951 in self.var_686818ffab148c29) {
        var_b30aeb64ddc7b951 delete();
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5329
// Size: 0xc1
function ava_spawn() {
    var_b7c715b0a7324c06 = getstruct("ava_spawn", "targetname");
    self.var_5829d85af2283009 = undefined;
    while (!isdefined(self.var_5829d85af2283009)) {
        self.var_5829d85af2283009 = utility::spawn_model("body_civ_london_female_3_3", var_b7c715b0a7324c06.origin, var_b7c715b0a7324c06.angles);
        waitframe();
    }
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.var_4118ca23a8b62b78, self.var_5829d85af2283009);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.var_4118ca23a8b62b78, 72);
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Let's go!", level.players, "never", 2000, 1, 1);
    self.var_5829d85af2283009 thread function_1a42fd7a576ce0c3(self);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53f1
// Size: 0x14d
function function_1a42fd7a576ce0c3(quest) {
    function_331a7395643a62a3(getstruct("breach_exit_point", "targetname"));
    s_goal = getstruct("ava_comm_pos", "targetname");
    self moveto(s_goal.origin, 3);
    self waittill("movedone");
    self rotateto(s_goal.angles, 0.5);
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Commencing the download!  Keep them off me!", level.players, "never", 2000, 1, 1);
    quest flag_wait("ava_vehicle_go");
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Download complete!  Hang tight!", level.players, "never", 2000, 1, 1);
    s_goal = getstruct("ava_exit_pos", "targetname");
    self moveto(s_goal.origin, 1);
    self waittill("movedone");
    s_goal = getstruct("ava_truck_pos", "targetname");
    self moveto(s_goal.origin, 5);
    self waittill("movedone");
    namespace_32e74fbed1406ca3::function_5b4245d8e50d6cc3("Watch out!  Zombie horde!", level.players, "never", 2000, 1, 1);
    self delete();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5545
// Size: 0x26
function function_a250d816c3645ad2(s_quest) {
    self endon("death");
    s_quest waittill("breached");
    thread function_87cc2a188277bd3b(1500);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5572
// Size: 0x175
function function_1837cd52b8f6cf0f(var_fe068b47c5b8d085, b_start) {
    if (!b_start) {
        level notify("skipped");
        a_s_pos = getstructarray(var_fe068b47c5b8d085, "targetname");
        for (i = 0; i < a_s_pos.size; i++) {
            if (isdefined(level.players[i])) {
                level.players[i] thread teleport_player(a_s_pos[i], b_start, i);
            }
        }
    } else {
        var_ba23c084d956aad6 = getstruct("infil_chopper", "targetname");
        spawndata = spawnstruct();
        spawndata.origin = var_ba23c084d956aad6.origin;
        spawndata.angles = var_ba23c084d956aad6.angles;
        spawndata.spawntype = "GAME_MODE";
        level.var_cdac4dacd44c17c6 = namespace_1f188a13f7e79610::vehicle_spawn("veh9_palfa", spawndata);
        waitframe();
        level.var_cdac4dacd44c17c6.var_bce129fe17855f74 = 1;
        level.var_cdac4dacd44c17c6.onstartriding = &function_3321561d55e07c30;
        level.var_cdac4dacd44c17c6.onendriding = &function_453f831fdfcc5dce;
        level.var_cdac4dacd44c17c6 namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(level.var_cdac4dacd44c17c6);
        level.var_cdac4dacd44c17c6 thread function_86b4ca8e83c456e6(var_ba23c084d956aad6);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56ee
// Size: 0xde
function teleport_player(s_pos, b_start, n_index) {
    self endon("death");
    level thread namespace_36f464722d326bbe::function_852712268d005332(self, 1, 1);
    if (b_start) {
        n_pos = n_index + 4;
        level.var_cdac4dacd44c17c6.team = self.team;
        wait(1);
        self playerlinkto(level.var_cdac4dacd44c17c6, "offset_seat_ai_" + n_pos);
        wait(0.1);
        level.var_cdac4dacd44c17c6 flag_set("occupied");
        wait(3);
        self unlink();
        level thread function_ce34466b3cece887(self);
    } else {
        self setorigin(s_pos.origin);
        self setplayerangles(s_pos.angles);
    }
    level thread namespace_36f464722d326bbe::function_852712268d005332(self, 0, 2);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57d3
// Size: 0x178
function function_86b4ca8e83c456e6(s_pos) {
    self endon("death");
    self vehicle_setspeedimmediate(0, 10, 5);
    flag_wait("occupied");
    wait(1);
    self vehicle_setspeed(60, 20, 10);
    s_goal = getstruct(s_pos.target, "targetname");
    while (isdefined(s_goal)) {
        if (isdefined(s_goal.script_noteworthy) && s_goal.script_noteworthy == "land") {
            self setvehgoalpos(s_goal.origin, 1);
            self waittill("goal");
            self vehicle_setspeed(0, 10, 8);
            thread function_4d7fd5688d7a03a9();
            foreach (player in level.players) {
                namespace_d9c77dc2a6fe29c6::disableoobimmunity(player);
            }
            flag_wait("flyaway");
            self vehicle_setspeed(100, 30, 20);
        } else {
            self setvehgoalpos(s_goal.origin, 0);
            self waittill("goal");
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            s_goal = undefined;
        }
    }
    self delete();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5952
// Size: 0x1ec
function function_5f71bbea49f67e02() {
    s_pos = getstruct("rappel_chopper", "targetname");
    spawndata = spawnstruct();
    spawndata.origin = s_pos.origin;
    spawndata.angles = s_pos.angles;
    spawndata.var_f16652e1462a3739 = 1;
    var_c0bd36d87d262001 = namespace_1f188a13f7e79610::vehicle_spawn("veh_jup_blima", spawndata);
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(var_c0bd36d87d262001);
    var_c0bd36d87d262001 namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    var_c0bd36d87d262001.var_1e897ae1c018b2c2 = "team_hundred_ninety";
    var_c0bd36d87d262001.unload_land_offset = 255;
    var_c0bd36d87d262001.script_disconnectpaths = 1;
    var_c0bd36d87d262001.vehiclesetuprope = 1;
    var_c0bd36d87d262001.ignorelist = [0:var_c0bd36d87d262001];
    var_c0bd36d87d262001.var_f585b76d7f472cd9 = [];
    var_4661c9a486253047 = [0:"ar", 1:"lmg", 2:"smg"];
    for (i = 0; i < 5; i++) {
        var_434d2faf62ed069 = namespace_64135de19550f047::function_5881a353a471bd02(random(var_4661c9a486253047), var_c0bd36d87d262001.origin, var_c0bd36d87d262001.angles, "team_hundred_ninety", 2);
        if (isdefined(var_434d2faf62ed069)) {
            var_c0bd36d87d262001.var_f585b76d7f472cd9[var_c0bd36d87d262001.var_f585b76d7f472cd9.size] = var_434d2faf62ed069;
        }
        waitframe();
    }
    var_c0bd36d87d262001 namespace_5d57e6b81b105f5d::function_35c699c709e24b69(var_c0bd36d87d262001.var_f585b76d7f472cd9);
    s_goal = getstruct(s_pos.target, "targetname");
    var_c0bd36d87d262001 vehicle_setspeed(100, 10, 8);
    var_c0bd36d87d262001 setvehgoalpos(s_goal.origin, 1);
    wait(3);
    var_c0bd36d87d262001 namespace_5d57e6b81b105f5d::function_9e55d8680a23ec64(s_goal.origin);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b45
// Size: 0x1a
function function_3321561d55e07c30(player) {
    player.var_fa91f7e0c2de5846 = 1;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b66
// Size: 0x19
function function_453f831fdfcc5dce(player) {
    player.var_fa91f7e0c2de5846 = 0;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b86
// Size: 0x97
function function_4d7fd5688d7a03a9() {
    self endon("death");
    while (1) {
        var_7ec8d6ce882cf036 = 0;
        foreach (player in level.players) {
            if (istrue(player.var_fa91f7e0c2de5846)) {
                var_7ec8d6ce882cf036 = 1;
            }
        }
        if (!var_7ec8d6ce882cf036) {
            flag_set("flyaway");
            break;
        }
        wait(0.1);
    }
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c24
// Size: 0x7e
function function_ab65e0d9a8828ab2() {
    switch (level.players.size) {
    case 1:
        n_zombies = 20;
        break;
    case 2:
        n_zombies = 24;
        break;
    case 3:
        n_zombies = 28;
        break;
    case 4:
        n_zombies = 32;
        break;
    default:
        n_zombies = 40;
        break;
    }
    return n_zombies;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5caa
// Size: 0x7e
function function_20385cfdc216f458() {
    switch (level.players.size) {
    case 1:
        n_zombies = 8;
        break;
    case 2:
        n_zombies = 9;
        break;
    case 3:
        n_zombies = 11;
        break;
    case 4:
        n_zombies = 12;
        break;
    default:
        n_zombies = 8;
        break;
    }
    return n_zombies;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d30
// Size: 0x77
function function_3b142e491735475(target) {
    if (!isdefined(self)) {
        return;
    }
    var_97f0985016aa48cb = 0.8;
    var_929ad65d451ffc68 = anglestoforward(self.angles);
    var_efa57adc48838f9b = vectornormalize(target.origin - self gettagorigin("tag_rocket_right1"));
    var_ff53e400dd536b82 = vectordot(var_929ad65d451ffc68, var_efa57adc48838f9b);
    return var_ff53e400dd536b82 >= var_97f0985016aa48cb;
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5daf
// Size: 0x201
function function_ce34466b3cece887(player) {
    var_1b3072262db80fc1 = [0:"brainrot", 1:"deadwire", 2:"napalmburst", 3:"cryofreeze", 4:"shatterblast"];
    perks = [0:"specialty_juggernog", 1:"specialty_quickrevive", 2:"specialty_deadshot", 3:"specialty_speedcola", 4:"specialty_elemental_pop", 5:"specialty_death_perception", 6:"specialty_staminup", 7:"specialty_tombstone"];
    supers = [0:"super_aether_shroud", 1:"super_healing_aura", 2:"super_frost_blast", 3:"super_energy_mine", 4:"super_frenzied_guard", 5:"super_tesla_storm"];
    var_9da898f929f9f1c7 = "iw9_sm_papa90_mp";
    var_b3ba1ff750ae8edc = [];
    var_b3ba1ff750ae8edc["weapon"] = "iw9_sm_papa90_mp";
    var_b3ba1ff750ae8edc["ob_weapon"] = [0:"ob_jup_item_weapon_sm_papa90", 1:"ob_jup_item_weapon_sm_papa90_green", 2:"ob_jup_item_weapon_sm_papa90_blue", 3:"ob_jup_item_weapon_sm_papa90_purple", 4:"ob_jup_item_weapon_sm_papa90_orange"];
    player namespace_f8d3520d3483c1::setarmorhealth(self.var_8790c077c95db752);
    waitframe();
    player namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(1);
    waitframe();
    var_e1d199da4592fc05 = randomint(supers.size);
    player namespace_727d2aa1d6c72038::perkpackage_givedebug(supers[var_e1d199da4592fc05]);
    waitframe();
    player namespace_7dfc6454a70f3f39::function_3036cef61495210f("essence", 20000);
    waitframe();
    var_636981592f381ebf = spawnstruct();
    var_d7732d0238eae9ff = weaponmaxammo(var_9da898f929f9f1c7);
    var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_b3ba1ff750ae8edc["ob_weapon"][1]);
    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
    var_636981592f381ebf.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    player namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5fb7
// Size: 0x26
function function_d033372dd6129974(player, vehicle) {
    var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getsquadmembers();
}

// Namespace namespace_cf011d7d8f1de3ac/namespace_e39de371869cd948
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe4
// Size: 0x26
function function_c8bcbda102291b17(player, vehicle) {
    var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getsquadmembers();
}

