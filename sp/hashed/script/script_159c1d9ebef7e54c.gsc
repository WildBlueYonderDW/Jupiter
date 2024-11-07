#using scripts\common\ai.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_build.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using script_3433ee6b63c7e243;
#using script_1031976741eb6674;
#using script_f8531dcf975a7a7;
#using script_1cc61c7403dfc55f;
#using scripts\sp\colors.gsc;
#using scripts\sp\equipment\molotov.gsc;
#using scripts\sp\trigger.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\vehicle.gsc;
#using script_a5d836e2cde0ea2;
#using scripts\asm\soldier\long_death.gsc;
#using script_60add030ce1a42b6;

#namespace namespace_edf401999ae22ce6;

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ecb
    // Size: 0x5
    function function_1cb24ec7edf7a7f4() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed8
// Size: 0x56
function function_953f62e8fcae5280(var_500fcf7ffb362498) {
    var_500fcf7ffb362498 = default_to(var_500fcf7ffb362498, 0);
    if (istrue(var_500fcf7ffb362498)) {
        utility::flag_set("flag_farah_ambient_fight_vehicle_fire_1");
    } else {
        level thread function_908eb4a8d48a5243();
        level thread function_5d6da6b9d0e126fd();
        level thread function_c6c3d07120038cf3();
        level thread function_669d671122b2e4c5();
    }
    level thread function_fbd69a7543771454();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f36
// Size: 0xf3
function function_c6c3d07120038cf3() {
    level.player endon("death");
    level endon("flag_forest_vista_08");
    level endon("flag_lumbermill_ambient_enemies_cleared");
    if (level utility::flag("flag_lumbermill_ambient_enemies_cleared") || level utility::flag("flag_forest_vista_08")) {
        return;
    }
    var_57310a9d6d428ac8 = getstructarray("s_lumber_mill_fake_mg_start", "targetname");
    utility::flag_wait("flag_farah_ambient_fight_vehicle_fire_1");
    while (true) {
        wait randomfloatrange(4, 6);
        var_57310a9d6d428ac8 = utility::array_randomize(var_57310a9d6d428ac8);
        for (i = 0; i < var_57310a9d6d428ac8.size; i++) {
            struct = var_57310a9d6d428ac8[i];
            magicgrenade("frag", struct.origin + (0, 0, 8), struct.origin, 0.1, 0);
            wait randomfloatrange(5, 15);
        }
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2031
// Size: 0x1ba
function function_669d671122b2e4c5() {
    var_945814a4dcbdfb2b = getstructarray("s_lumber_mill_fake_mb_start", "targetname");
    var_42cbbd9b12a4a581 = [];
    foreach (struct in var_945814a4dcbdfb2b) {
        ent = utility::spawn_script_origin(struct.origin, (0, 0, 0));
        ent.var_13ef9eb9a1fafd67 = "iw9_ar_mcharlie_sp";
        if (isdefined(struct.script_noteworthy)) {
            switch (struct.script_noteworthy) {
            case #"hash_e10498e41d09d698":
                ent.var_13ef9eb9a1fafd67 = "iw9_sn_alpha50_sp";
                break;
            case #"hash_4ea48d83c2efebe0":
                ent.var_13ef9eb9a1fafd67 = "iw9_sm_papa90_sp";
                break;
            case #"hash_44874483bced75f5":
                ent.var_13ef9eb9a1fafd67 = "iw9_lm_rkilo_sp";
                break;
            default:
                ent.var_13ef9eb9a1fafd67 = "iw9_ar_mcharlie_sp";
                break;
            }
        }
        var_42cbbd9b12a4a581 = utility::array_add(var_42cbbd9b12a4a581, ent);
    }
    utility::array_thread(var_42cbbd9b12a4a581, &function_bb70e26e71208bf4);
    level utility::flag_wait_any("flag_forest_vista_08", "flag_lumbermill_ambient_enemies_cleared");
    var_42cbbd9b12a4a581 = sortbydistance(var_42cbbd9b12a4a581, level.player.origin);
    for (i = 0; i < var_42cbbd9b12a4a581.size; i++) {
        var_42cbbd9b12a4a581[i] delete();
        wait randomfloatrange(0.1, 0.3);
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21f3
// Size: 0x1f3
function function_bb70e26e71208bf4() {
    self endon("death");
    level.player endon("death");
    var_fdf6127164f383c = getstructarray("s_lumber_mill_fake_target", "targetname");
    var_9b6928c0e76d8eb = weaponfiretime(self.var_13ef9eb9a1fafd67);
    n_clipsize = weaponclipsize(self.var_13ef9eb9a1fafd67);
    var_10b43267699335c1 = n_clipsize;
    while (true) {
        wait randomfloatrange(1, 9);
        var_fdf6127164f383c = utility::array_randomize(var_fdf6127164f383c);
        var_6d4fe6502abaa270 = undefined;
        foreach (struct in var_fdf6127164f383c) {
            var_6ce473d9377310ff = sighttracepassed(self.origin, struct.origin, 1, undefined);
            if (!istrue(var_6ce473d9377310ff)) {
                var_6d4fe6502abaa270 = struct;
                break;
            }
            waitframe();
        }
        if (!isdefined(var_6d4fe6502abaa270)) {
            wait 1;
            continue;
        }
        if (self.var_13ef9eb9a1fafd67 == "iw9_lm_rkilo_sp" || self.var_13ef9eb9a1fafd67 == "iw9_sm_papa90_sp" || self.var_13ef9eb9a1fafd67 == "iw9_ar_mcharlie_sp") {
            var_10b43267699335c1 = randomintrange(int(n_clipsize * 0.5), n_clipsize);
        }
        for (i = 0; i < var_10b43267699335c1; i++) {
            var_7a4513b7078de9aa = randomfloatrange(-32, 32);
            var_7a4514b7078debdd = randomfloatrange(-32, 32);
            var_7a4511b7078de544 = randomfloatrange(-32, 32);
            magicbullet(self.var_13ef9eb9a1fafd67, self.origin, var_6d4fe6502abaa270.origin + (var_7a4513b7078de9aa, var_7a4514b7078debdd, var_7a4511b7078de544));
            wait var_9b6928c0e76d8eb;
        }
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23ee
// Size: 0x135
function function_908eb4a8d48a5243() {
    var_220f6803418e4442 = getentarray("script_model_vehicle_debris_1", "targetname");
    array_thread(var_220f6803418e4442, &hide_entity);
    vehicle = spawn_vehicle_from_targetname("veh_lumbermill_ambient_fight_1");
    utility::flag_wait("flag_lumbermill_vista_explosions");
    rocket = magicbullet("iw9_la_rpapa7_sp_ai_straight", level.farah.origin + (0, 0, 92), vehicle.origin);
    rocket waittill("explode", origin);
    playrumbleonposition("damage_light", level.player.origin);
    earthquake(0.3, 0.2, level.player.origin, 128);
    exploder("vfx_veh_fire_sm");
    exploder("vfx_veh_explo");
    vehicle vehicle::function_538ef15c254e4d34();
    vehicle waittill("vehicle_huskCreation", husk);
    husk delete();
    array_thread(var_220f6803418e4442, &show_entity);
    utility::flag_set("flag_farah_ambient_fight_vehicle_fire_1");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x252b
// Size: 0x270
function function_5d6da6b9d0e126fd() {
    level.var_bae84594e3e7c82 = [];
    array_spawn_function_noteworthy("ai_lumbermill_ambient", &function_174b1a9a5add377c);
    var_4c1483f246fb0fed = array_spawn_targetname("ai_lumbermill_ambient_back_center", 1, 1);
    var_24abe296e2af0b56 = spawnstruct();
    var_24abe296e2af0b56 thread function_5d6e9df45105c9ea(var_4c1483f246fb0fed);
    level.var_bae84594e3e7c82 = array_combine(level.var_bae84594e3e7c82, var_4c1483f246fb0fed);
    waitframe();
    var_9423ff0c1b7a3c19 = array_spawn_targetname("ai_lumbermill_ambient_front_center", 1, 1);
    var_384f044c29b5048 = spawnstruct();
    var_384f044c29b5048 thread function_5d6e9df45105c9ea(var_9423ff0c1b7a3c19);
    level.var_bae84594e3e7c82 = array_combine(level.var_bae84594e3e7c82, var_9423ff0c1b7a3c19);
    waitframe();
    var_b00230be66728125 = array_spawn_targetname("ai_lumbermill_ambient_back_left", 1, 1);
    var_5d3f55a7151a138a = spawnstruct();
    var_5d3f55a7151a138a thread function_5d6e9df45105c9ea(var_b00230be66728125);
    level.var_bae84594e3e7c82 = array_combine(level.var_bae84594e3e7c82, var_b00230be66728125);
    waitframe();
    var_6bdb39cdc406c73e = array_spawn_targetname("ai_lumbermill_ambient_back_right", 1, 1);
    var_85955f3054ccfbf7 = spawnstruct();
    var_85955f3054ccfbf7 thread function_5d6e9df45105c9ea(var_6bdb39cdc406c73e);
    level.var_bae84594e3e7c82 = array_combine(level.var_bae84594e3e7c82, var_6bdb39cdc406c73e);
    waitframe();
    var_6f9ec2ea7a0db561 = array_spawn_targetname("ai_lumbermill_ambient_front_left", 1, 1);
    var_c6fff7ee79dde084 = spawnstruct();
    var_c6fff7ee79dde084 thread function_5d6e9df45105c9ea(var_6f9ec2ea7a0db561);
    level.var_bae84594e3e7c82 = array_combine(level.var_bae84594e3e7c82, var_6f9ec2ea7a0db561);
    waitframe();
    var_5469b4f6ee2f6a42 = array_spawn_targetname("ai_lumbermill_ambient_front_right", 1, 1);
    var_ce66735b79e8c551 = spawnstruct();
    var_ce66735b79e8c551 thread function_5d6e9df45105c9ea(var_5469b4f6ee2f6a42);
    level.var_bae84594e3e7c82 = array_combine(level.var_bae84594e3e7c82, var_5469b4f6ee2f6a42);
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(level.var_bae84594e3e7c82, "flag_lumbermill_ambient_enemies_cleared");
    utility::flag_wait("flag_forest_vista_08");
    kill_exploder("vfx_veh_explo");
    wait 1;
    level.var_bae84594e3e7c82 = array_removedead_or_dying(level.var_bae84594e3e7c82);
    if (level.var_bae84594e3e7c82.size > 0) {
        array_delete(level.var_bae84594e3e7c82);
        waitframe();
    }
    level.var_bae84594e3e7c82 = undefined;
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a3
// Size: 0x115
function function_174b1a9a5add377c() {
    set_attackeraccuracy(0.5);
    set_baseaccuracy(0.5);
    set_ignoresuppression(1);
    self.coversearchinterval = int(function_a5b14435e3229bed(randomfloatrange(5, 10)));
    self.forcesuppressai = 1;
    self.providecoveringfire = 1;
    self.var_669866694e190a3d = 1;
    self function_95d5375059c2a022("default_longrange", 1);
    self.maxsightdistsqrd = 64000000;
    self.maxvisibledist = 8192;
    self setengagementmaxdist(5000, 6000);
    thread utility::deletable_magic_bullet_shield();
    while (!isdefined(level.farah)) {
        waitframe();
    }
    self.lastenemysightpos = level.farah.origin;
    level utility::flag_wait("flag_forest_vista_04");
    thread ai::stop_magic_bullet_shield();
    self waittill("death", attacker);
    if (isdefined(attacker) && isplayer(attacker)) {
        level utility::flag_set("flag_lumbermill_ambient_enemies_player_kill");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28c0
// Size: 0xaa
function function_da766ccaa723a361(ai_array, str_targetname) {
    level.player endon("death");
    level endon("flag_forest_vista_08");
    level endon("lumbermill_ambient_waves_refilled");
    if (cointoss()) {
        var_6331a531d1d5beee = ai_array.size - 1;
    } else {
        var_6331a531d1d5beee = ai_array.size;
    }
    waittill_dead_or_dying(ai_array, var_6331a531d1d5beee);
    spawners = getspawnerarray(str_targetname);
    var_efe3093c766b6fdb = array_spawn(spawners, 1, 1);
    level.var_bae84594e3e7c82 = array_combine(level.var_bae84594e3e7c82, var_efe3093c766b6fdb);
    thread function_5d6e9df45105c9ea(var_efe3093c766b6fdb);
    level notify("lumbermill_ambient_waves_refilled");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2972
// Size: 0x200
function function_fbd69a7543771454() {
    trigger_off("t_lumber_mill_farah_rpg_fire", "targetname");
    utility::flag_wait_any("flag_forest_vista_10", "flag_forest_vista_complete");
    var_3b18bb07ceb06a35 = utility::array_spawn_targetname("ai_lumber_mill_topoflogs");
    var_3010523faaeca66a = spawnstruct();
    var_3010523faaeca66a thread function_5d6e9df45105c9ea(var_3b18bb07ceb06a35);
    s_target = getstruct("s_lumbermill_farah_target", "targetname");
    while (!flag("flag_lumbermill_logstorage_frontline_enemies")) {
        if (flag("flag_forest_vista_complete") && within_fov_of_players(s_target.origin, cos(30))) {
            break;
        }
        wait 0.1;
    }
    var_3b18bb07ceb06a35 = array_removedead_or_dying(var_3b18bb07ceb06a35);
    if (var_3b18bb07ceb06a35.size > 0) {
        rocket = magicbullet("iw9_la_rpapa7_sp_ai_straight", level.farah.origin + (0, 0, 92), s_target.origin + (0, 0, 0));
        rocket waittill("explode", origin);
        playrumbleonposition("grenade_rumble", level.player.origin);
        earthquake(0.4, 0.2, level.player.origin, 128);
        trigger_on("t_lumber_mill_farah_rpg_fire", "targetname");
        exploder("vfx_rpg_explo");
        foreach (ai in var_3b18bb07ceb06a35) {
            if (isdefined(ai) && isalive(ai)) {
                ai dodamage(ai.maxhealth + 1000, origin, level.farah, undefined, "MOD_EXPLOSIVE");
            }
        }
    }
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b7a
    // Size: 0x5
    function function_25855b4f91920255() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b87
// Size: 0xac
function function_979ccc727f468b3e() {
    namespace_8339f6377b6ba60e::function_4c28f0141619d61a();
    utility::set_start_location("s_start_lumber_mill", [level.player]);
    utility::set_start_location("s_start_lumber_mill", level.tundra_allies);
    level utility::flag_set("flag_lumbermill_vista_explosions");
    level function_d08b184a0f5cca2d();
    level thread function_987973f684e540d0();
    level thread function_b52473880235aa();
    level thread function_953f62e8fcae5280(1);
    level thread function_b2ee17a0796ff7e6();
    level thread namespace_191bb1c1589b3acb::function_84746c3250d67674();
    level thread function_a9ef4c11b383cd35();
    level thread function_89b3f6cded94fd0();
    exploder("vfx_veh_fire_sm");
    level thread function_2380d3aa1c1eafdb();
    level thread function_b5f3357d5500263e();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3b
// Size: 0x155
function function_1f0f73377673d767() {
    utility::autosave_by_name("lumber_mill_at_entrance");
    utility::flag_set("flag_lumbermill_player_entered");
    level thread function_a3cc4854c09a3a19();
    level.var_a1495556b1cb21a5 = [];
    level.var_bbc6d6d49fb243d0 = [];
    level thread function_8d8336a40ad05db0();
    level thread function_53f23d38856581b6();
    level thread function_6fe431ffa0b905bf();
    level thread namespace_191bb1c1589b3acb::function_2d2ffb46cf33661e();
    level thread function_ff79345c805e7866();
    level.farah thread function_b571dd13b8a88c13();
    level thread function_f402dfd4e8814fe5();
    level thread function_cf63d71a59a34220();
    level thread function_8b713341e36926a1();
    a_ai_allies = [level.soap, level.gaz, level.shepherd];
    array_thread(a_ai_allies, &function_3c51401b9f9cbe3e);
    level thread function_113a318e4855793c();
    level thread function_cc8f6de92164bd04();
    level thread function_915e35a8d3ed5cc0();
    level thread function_327e7751c8c605c4();
    level thread function_e5d86625057be5c3();
    level thread function_7848f624652a226a();
    level thread function_44e2342f3f647da();
    level thread function_103682a8e71ae4a();
    level thread function_29904208f729440e();
    level thread namespace_5f9a73fb2d310d21::function_da7a442dfd5f9958();
    level thread function_6d7b1343a3025a10();
    level thread function_ce782c69a8298b44();
    utility::flag_wait("flag_lumbermill_complete");
    level namespace_8339f6377b6ba60e::function_aec5169b5cad5be3("flag_mill_stop_nags");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d98
// Size: 0x26
function function_e9156a415d1dd024() {
    utility::flag_set("flag_lumbermill_all_enemies_cleared");
    utility::flag_set("flag_cliff_allies_move_2");
    utility::flag_set("flg_audio_bird_done");
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2dc6
    // Size: 0x5
    function function_5391b2dcd887fd7c() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd3
// Size: 0x115
function function_987973f684e540d0() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    var_27338ee38c9ed39e = [level.shepherd, level.gaz, level.soap];
    foreach (var_afd30ab6a0aa96 in var_27338ee38c9ed39e) {
        var_afd30ab6a0aa96 setthreatbiasgroup("lumber_mill_allies");
    }
    level.player setthreatbiasgroup("lumber_mill_allies");
    utility::flag_wait("flag_lumbermill_vehicle_spectacle");
    foreach (var_afd30ab6a0aa96 in var_27338ee38c9ed39e) {
        var_afd30ab6a0aa96 setthreatbiasgroup();
    }
    level.player setthreatbiasgroup();
    level.farah setthreatbiasgroup();
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2ef0
    // Size: 0x5
    function function_1d286a0e0b1f5110() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2efd
// Size: 0x3b5
function function_ce782c69a8298b44() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    utility::flag_wait("flag_lumbermill_vehicle_spectacle");
    level.var_a1495556b1cb21a5 = utility::array_removedead_or_dying(level.var_a1495556b1cb21a5);
    foreach (guy in level.var_a1495556b1cb21a5) {
        if (isdefined(guy) && isalive(guy)) {
            guy thread function_f3dd5a66b28dda10();
            guy setthreatbiasgroup();
            guy.var_669866694e190a3d = 0;
            if (isdefined(guy.script_noteworthy) && guy.script_noteworthy == "ai_lumber_mill_JLTV1") {
                continue;
            }
            if (guy.targetname == "ai_lumbermill_snipersnest_spawners") {
                if (utility::flag("flag_lumbermill_vehicle_spectacle_lower")) {
                    guy.var_669866694e190a3d = 0;
                    guy.dontattackme = 0;
                    guy function_19d6e99d74acefe5("v_lumbermill_snipersnest_balcony", undefined, 1);
                }
                continue;
            }
            guy function_19d6e99d74acefe5("v_lumbermill_sawdust");
            guy utility::set_attackeraccuracy(2);
            guy ai::function_dd21d67ede8ba22(int(guy.health * 0.5) + 1);
        }
    }
    utility::flag_wait("flag_lumbermill_vehicle_spectacle_complete");
    level.var_a1495556b1cb21a5 = utility::array_removedead_or_dying(level.var_a1495556b1cb21a5);
    var_661b8e720c0506b9 = 7;
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(level.var_a1495556b1cb21a5, "flag_lumbermill_force_vehicle_reinforcement", var_661b8e720c0506b9);
    utility::flag_wait_any("flag_lumbermill_vehicle_reinforcement_complete", "flag_lumbermill_player_at_exit");
    while (level.var_a1495556b1cb21a5.size > 5) {
        if (level utility::flag("flag_lumbermill_player_approaching_exit") || level utility::flag("flag_lumbermill_player_at_exit")) {
            break;
        }
        level.var_a1495556b1cb21a5 = utility::array_removedead_or_dying(level.var_a1495556b1cb21a5);
        wait 1;
    }
    level.var_a1495556b1cb21a5 = utility::array_removedead_or_dying(level.var_a1495556b1cb21a5);
    flag_set("flag_lumbermill_enemy_laststand");
    foreach (guy in level.var_a1495556b1cb21a5) {
        if (isdefined(guy) && isalive(guy)) {
            if (isdefined(guy.script_noteworthy) && guy.script_noteworthy == "lumber_mill_snipersnest_sniper") {
                if (utility::within_fov_of_players(guy geteye(), cos(45))) {
                    guy.var_669866694e190a3d = 0;
                    guy.dontattackme = 0;
                    guy thread function_19d6e99d74acefe5("v_lumbermill_snipersnest_balcony", "clear", 1);
                } else {
                    guy notify("stop_sniper_ai_death_monitor");
                    guy delete();
                    continue;
                }
            } else if (flag("flag_lumbermill_player_insnipersnest")) {
                guy thread function_19d6e99d74acefe5("v_lumbermill_sawdust", level.player, 1);
            } else {
                guy thread function_19d6e99d74acefe5("v_lumbermill_nomansland", level.player, 1);
                guy utility::delaythread(randomfloatrange(5, 10), &player_seek_enable);
            }
            guy utility::set_attackeraccuracy(5);
            guy ai::function_dd21d67ede8ba22(int(guy.health * 0.25) + 1);
            guy.balwayscoverexposed = 1;
        }
    }
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(level.var_a1495556b1cb21a5, "flag_lumbermill_all_enemies_cleared");
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x32ba
    // Size: 0x5
    function function_6e4f2cae1089f284() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32c7
// Size: 0x201
function function_327e7751c8c605c4() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    utility::flag_wait("flag_lumbermill_warehouse_room1_enemies");
    if (level flag("flag_lumbermill_warehouse_room2_enemies")) {
        return;
    }
    array_spawn_function_targetname("ai_lumbermill_warehouse_room1_spawners", &function_c62d43acd232b24d, "flag_lumbermill_vehicle_spectacle_lower");
    if (level flag("flag_lumbermill_vehicle_spectacle_lower")) {
        return;
    }
    var_6cae31b0727ad0b4 = array_spawn_targetname("ai_lumbermill_warehouse_room1_spawners", 1, 1);
    level.var_a1495556b1cb21a5 = array_combine(level.var_a1495556b1cb21a5, var_6cae31b0727ad0b4);
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_6cae31b0727ad0b4, "flag_lumbermill_warehouse_room1_enemies_cleared");
    foreach (ai in var_6cae31b0727ad0b4) {
        ai.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    }
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_6cae31b0727ad0b4, "flg_lumbermill_warehouse_room1_enemies_cleared");
    if (level flag("flag_lumbermill_running_enemies_alerted")) {
        var_9e75737de50b44f0 = getent("v_lumbermill_warehouse_room1", "targetname");
        var_5c9bef7861708dc6 = 1;
    } else {
        var_9e75737de50b44f0 = getent("v_lumbermill_warehouse_outside", "targetname");
        var_5c9bef7861708dc6 = 0;
    }
    foreach (ai in var_6cae31b0727ad0b4) {
        ai setgoalvolumeauto(var_9e75737de50b44f0);
    }
    var_3d02b43a32f3b42d = spawnstruct();
    var_3d02b43a32f3b42d.var_5c9bef7861708dc6 = var_5c9bef7861708dc6;
    var_3d02b43a32f3b42d thread function_5d6e9df45105c9ea(var_6cae31b0727ad0b4);
    var_ff332ae1d7a37e8c = 1;
    waittill_dead_or_dying(var_6cae31b0727ad0b4, var_6cae31b0727ad0b4.size - var_ff332ae1d7a37e8c);
    var_6cae31b0727ad0b4 = utility::array_removedead_or_dying(var_6cae31b0727ad0b4, 1);
    level array_thread(var_6cae31b0727ad0b4, &function_19d6e99d74acefe5, "v_lumbermill_warehouse_room2", level.player);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34d0
// Size: 0x1f9
function function_e5d86625057be5c3() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    msg = utility::flag_wait_any_return("flag_lumbermill_warehouse_room2_enemies_interior", "flag_lumbermill_warehouse_room2_enemies_exterior");
    level namespace_79f48325b39cc7bd::flag_set("flag_lumbermill_warehouse_room2_enemies");
    array_spawn_function_targetname("ai_lumbermill_warehouse_room2_spawners", &function_c62d43acd232b24d, "flag_lumbermill_vehicle_spectacle_lower");
    array_spawn_function_targetname("ai_lumbermill_warehouse_room2_spawners", &set_favoriteenemy, level.player);
    if (level flag("flag_lumbermill_vehicle_spectacle_lower")) {
        return;
    }
    var_6cae34b0727ad74d = array_spawn_targetname("ai_lumbermill_warehouse_room2_spawners", 1, 1);
    level.var_a1495556b1cb21a5 = array_combine(level.var_a1495556b1cb21a5, var_6cae34b0727ad74d);
    foreach (ai in var_6cae34b0727ad74d) {
        ai.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    }
    waitframe();
    if (msg == "flag_lumbermill_warehouse_room2_enemies_exterior") {
        foreach (guy in var_6cae34b0727ad74d) {
            guy function_19d6e99d74acefe5("v_lumbermill_warehouse_outside");
        }
    }
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_6cae34b0727ad74d, "flag_lumbermill_warehouse_room2_enemies_cleared");
    var_ff332ae1d7a37e8c = 1;
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_6cae34b0727ad74d, "flag_lumbermill_warehouse_room2_fallback", var_6cae34b0727ad74d.size - var_ff332ae1d7a37e8c);
    msg = level utility::flag_wait_any_return("flag_lumbermill_warehouse_room2_fallback", "flag_lumbermill_vehicle_spectacle");
    var_6cae34b0727ad74d = utility::array_removedead_or_dying(var_6cae34b0727ad74d, 1);
    if (var_6cae34b0727ad74d.size == 0) {
        return;
    }
    if (!flag("flag_lumbermill_playerpath_right")) {
        var_f26b270cf6935ac1 = "v_lumbermill_nomansland";
    } else {
        var_f26b270cf6935ac1 = "v_lumbermill_snipersnest_inside";
    }
    level array_thread(var_6cae34b0727ad74d, &function_19d6e99d74acefe5, var_f26b270cf6935ac1);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36d1
// Size: 0x2fa
function function_113a318e4855793c() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    utility::flag_wait("flag_lumbermill_player_entered");
    v_lumbermill_snipersnest_inside = getent("v_lumbermill_snipersnest_inside", "targetname");
    array_spawn_function_noteworthy("lumber_mill_snipersnest_sniper", &namespace_8339f6377b6ba60e::function_30c5a9670baa5108, undefined, 0, 1, v_lumbermill_snipersnest_inside);
    var_3f621455414845ac = utility::array_spawn_targetname("ai_lumbermill_snipersnest_spawners", 1, 1);
    level.var_a1495556b1cb21a5 = utility::array_combine(level.var_a1495556b1cb21a5, var_3f621455414845ac);
    var_890ce06a2b0076b1 = spawnstruct();
    var_890ce06a2b0076b1 thread function_5d6e9df45105c9ea(var_3f621455414845ac, 0, "flag_lumbermill_snipersnest_enemies_alerted", "flag_lumbermill_snipersnest_enemies_force_alert");
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_3f621455414845ac, "flag_lumbermill_snipersnest_enemies_cleared");
    foreach (guy in var_3f621455414845ac) {
        guy thermaldrawdisable();
        guy utility::set_attackeraccuracy(0.1);
        guy utility::set_baseaccuracy(2);
        guy thread namespace_c5f28ee126743bce::function_1ddcdf764c5bdd84();
        guy.dontshootwhilemoving = 1;
        guy.disablerunngun = 1;
        guy.dontattackme = 1;
        guy.allowstrafe = 0;
        guy.dontmeleeme = 1;
        guy.disablegrenaderesponse = 1;
        guy.grenadeammo = 0;
        guy ai::gun_remove();
        gun = utility::make_weapon("iw9_sn_alpha50_notherm_sp");
        guy namespace_223959d3e5206cfb::forceuseweapon(gun, "primary");
        guy.dropweapon = 0;
        guy.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    }
    level utility::flag_wait("flag_lumbermill_player_insnipersnest");
    var_3f621455414845ac = utility::array_removedead_or_dying(var_3f621455414845ac);
    foreach (guy in var_3f621455414845ac) {
        guy.var_669866694e190a3d = 0;
        guy.dontattackme = 0;
        guy utility::set_attackeraccuracy(0.75);
    }
    level utility::flag_set("flag_lumbermill_snipersnest_enemies_force_alert");
    foreach (guy in var_3f621455414845ac) {
        if (isdefined(guy.script_noteworthy) && guy.script_noteworthy == "lumber_mill_snipersnest_sniper") {
            guy utility::set_fixednode_false();
            guy.script_fixednode = 0;
            guy utility::set_favoriteenemy(level.player);
            guy thread function_19d6e99d74acefe5("v_lumbermill_snipersnest_inside");
        }
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39d3
// Size: 0xc3
function function_915e35a8d3ed5cc0() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    level endon("flag_lumbermill_allymovement_soap_6");
    level utility::flag_wait("flag_lumbermill_stairs_grenade");
    var_3a793156808ebdf3 = spawn_targetname("ai_lumbermill_warehouse_shotgun_spawners", 1);
    level.var_a1495556b1cb21a5 = array_add(level.var_a1495556b1cb21a5, var_3a793156808ebdf3);
    var_3a793156808ebdf3 endon("death");
    var_3a793156808ebdf3 set_favoriteenemy(level.player);
    var_3a793156808ebdf3 thread function_cd91d3cc5631a048();
    var_3a793156808ebdf3.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    utility::flag_wait("flag_lumbermill_player_insnipersnest");
    var_3a793156808ebdf3 set_fixednode_false();
    var_3a793156808ebdf3 setgoalpos(var_3a793156808ebdf3.origin);
    var_3a793156808ebdf3 thread player_seek_enable();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9e
// Size: 0xdb
function function_cd91d3cc5631a048() {
    self endon("death");
    level endon("flag_lumbermill_complete");
    s_lumber_mill_stairs_grenade_throwfrom = utility::getstruct("s_lumber_mill_stairs_grenade_throwfrom", "targetname");
    s_lumber_mill_stairs_grenade_throwto = utility::getstruct("s_lumber_mill_stairs_grenade_throwto", "targetname");
    self.disablegrenaderesponse = 1;
    self.grenadeammo = 0;
    vol = getent("v_lumbermill_grenade_doorway", "targetname");
    a_ai_enemies = vol utility::get_ai_touching_volume("axis");
    if (a_ai_enemies.size > 0 || cointoss()) {
        return;
    }
    level utility::flag_set("flag_lumbermill_stairs_grenade_thrown");
    grenade = magicgrenade("frag", s_lumber_mill_stairs_grenade_throwfrom.origin, s_lumber_mill_stairs_grenade_throwto.origin, 3);
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3b81
    // Size: 0x5
    function function_93a76ac6fde073ba() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b8e
// Size: 0x13d
function function_44e2342f3f647da() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    var_2babe6f72d801819 = array_spawn_targetname("ai_lumbermill_nomansland_spawners", 1, 1);
    level.var_a1495556b1cb21a5 = array_combine(level.var_a1495556b1cb21a5, var_2babe6f72d801819);
    var_5d62c1236331dca6 = spawnstruct();
    var_5d62c1236331dca6 thread function_5d6e9df45105c9ea(var_2babe6f72d801819);
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_2babe6f72d801819, "flag_lumbermill_nomansland_enemies_cleared");
    foreach (ai in var_2babe6f72d801819) {
        ai.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    }
    var_ff332ae1d7a37e8c = 1;
    waittill_dead_or_dying(var_2babe6f72d801819, var_2babe6f72d801819.size - var_ff332ae1d7a37e8c);
    var_2babe6f72d801819 = utility::array_removedead_or_dying(var_2babe6f72d801819, 1);
    foreach (ai in var_2babe6f72d801819) {
        ai function_19d6e99d74acefe5("v_lumbermill_sawdust");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd3
// Size: 0x128
function function_a9ef4c11b383cd35() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    guy = spawn_targetname("ai_lumbermill_crawling_guy", 1);
    guy.ignoreall = 1;
    guy.ignoreme = 1;
    guy enable_long_death();
    guy.force_num_crawls = 15;
    guy.forcelongdeathskipintroanim = 1;
    guy.forcelongdeath = 3;
    guy enable_long_death();
    guy.diequietly = 1;
    guy setlookatentity(level.player);
    waitframe();
    guy asmsetstate(guy.asmname, "choose_long_death");
    guy notify("long_death");
    if (!guy scripts\engine\utility::doinglongdeath()) {
        guy.doinglongdeath = 1;
    }
    guy thread scripts\asm\soldier\long_death::dodyingcrawlbloodsmear();
    guy thread function_27ea98ff9be9aceb();
    playfxontag(level._effect["vfx_tun_env_fire_crawl_1"], guy, "j_chest");
    level utility::flag_wait_or_timeout("flag_lumbermill_vehicle_spectacle_lower", 15);
    if (isdefined(guy)) {
        guy notify("end_crawl");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e03
// Size: 0x28
function function_27ea98ff9be9aceb() {
    self endon("death");
    self endon("entitydeleted");
    waittill_any("end_crawl", "damage");
    self kill();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e33
// Size: 0x198
function function_cc8f6de92164bd04() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    utility::flag_wait("flag_lumbermill_player_entered");
    array_spawn_function_targetname("ai_lumbermill_frontline_spawners", &function_c62d43acd232b24d, "flag_lumbermill_player_insnipersnest");
    var_2e08003c3235a3c3 = array_spawn_targetname("ai_lumbermill_frontline_spawners", 1, 1);
    level.var_a1495556b1cb21a5 = array_combine(level.var_a1495556b1cb21a5, var_2e08003c3235a3c3);
    var_e49efa4c0da2feae = spawnstruct();
    var_e49efa4c0da2feae thread function_5d6e9df45105c9ea(var_2e08003c3235a3c3);
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_2e08003c3235a3c3, "flag_lumbermill_frontline_enemies_cleared");
    foreach (ai in var_2e08003c3235a3c3) {
        ai.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    }
    var_ff332ae1d7a37e8c = 1;
    waittill_dead_or_dying(var_2e08003c3235a3c3, var_2e08003c3235a3c3.size - var_ff332ae1d7a37e8c);
    var_2e08003c3235a3c3 = utility::array_removedead_or_dying(var_2e08003c3235a3c3, 1);
    foreach (ai in var_2e08003c3235a3c3) {
        if (isdefined(ai.script_noteworthy) && (ai.script_noteworthy == "lumber_mill_frontline_ground" || ai.script_noteworthy == "lumber_mill_shotgun")) {
            ai function_19d6e99d74acefe5("v_lumbermill_road");
        }
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd3
// Size: 0x124
function function_7848f624652a226a() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    utility::flag_wait("flag_lumbermill_logstorage_frontline_enemies");
    array_spawn_function_targetname("ai_lumbermill_logstorage_spawners", &function_c62d43acd232b24d, "flag_lumbermill_player_insnipersnest");
    var_8c2c1a1be0803ebd = array_spawn_targetname("ai_lumbermill_logstorage_spawners", 1, 1);
    level.var_a1495556b1cb21a5 = array_combine(level.var_a1495556b1cb21a5, var_8c2c1a1be0803ebd);
    var_ff39dc9cd8e579ae = spawnstruct();
    var_ff39dc9cd8e579ae thread function_5d6e9df45105c9ea(var_8c2c1a1be0803ebd);
    level thread namespace_8339f6377b6ba60e::function_7cf3b8f1b807889a(var_8c2c1a1be0803ebd, "flag_lumbermill_logsstorage_enemies_cleared");
    foreach (ai in var_8c2c1a1be0803ebd) {
        ai.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    }
    var_ff332ae1d7a37e8c = 1;
    waittill_dead_or_dying(var_8c2c1a1be0803ebd, var_8c2c1a1be0803ebd.size - var_ff332ae1d7a37e8c);
    var_8c2c1a1be0803ebd = utility::array_removedead_or_dying(var_8c2c1a1be0803ebd, 1);
    level array_thread(var_8c2c1a1be0803ebd, &function_19d6e99d74acefe5, "v_lumbermill_road");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40ff
// Size: 0x1ac
function function_103682a8e71ae4a() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    utility::flag_wait("flag_lumbermill_player_entered");
    array_spawn_function_targetname("ai_lumbermill_logstorage_running_enemies", &function_c62d43acd232b24d, "flag_lumbermill_player_insnipersnest");
    var_5cdbeacdc85860c2 = array_spawn_targetname("ai_lumbermill_logstorage_running_enemies", 1, 1);
    level.var_a1495556b1cb21a5 = array_combine(level.var_a1495556b1cb21a5, var_5cdbeacdc85860c2);
    var_f4c17224e31b09f8 = spawnstruct();
    var_f4c17224e31b09f8 thread function_5d6e9df45105c9ea(var_5cdbeacdc85860c2, 1, "flag_lumbermill_running_enemies_alerted");
    foreach (ai in var_5cdbeacdc85860c2) {
        if (utility::percent_chance(75)) {
            ai utility::demeanor_override("sprint");
        }
        ai.var_669866694e190a3d = 1;
        ai.enemyselector = function_40fd49171fad19d3("enemyselector_sp_jup_tundra_lumbermill");
    }
    level flag_wait("flag_lumbermill_running_enemies_alerted");
    var_5cdbeacdc85860c2 = utility::array_removedead_or_dying(var_5cdbeacdc85860c2, 1);
    foreach (ai in var_5cdbeacdc85860c2) {
        ai utility::clear_demeanor_override();
        ai utility::set_fixednode_false();
    }
    var_ff332ae1d7a37e8c = 2;
    waittill_dead_or_dying(var_5cdbeacdc85860c2, var_5cdbeacdc85860c2.size - var_ff332ae1d7a37e8c);
    var_5cdbeacdc85860c2 = utility::array_removedead_or_dying(var_5cdbeacdc85860c2, 1);
    level array_thread(var_5cdbeacdc85860c2, &function_19d6e99d74acefe5, "v_lumbermill_outside_fallback");
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x42b3
    // Size: 0x5
    function function_b211aec8a60becd8() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42c0
// Size: 0xbc
function function_b52473880235aa() {
    level.farah = undefined;
    function_12af163adcd1c7e6("s_lumbermill_farah_pos", 1);
    level.farah setthreatbiasgroup("lumber_mill_farah");
    flag_set("lumber_mill_farah_spawned");
    nd_start = getnode("nd_lumbermill_farah_start", "targetname");
    level.farah utility::set_fixednode_true();
    level.farah utility::set_goal_node(nd_start);
    level.farah utility::set_ignoresuppression(1);
    level.farah.var_669866694e190a3d = 1;
    level.farah function_95d5375059c2a022("default_longrange", 1);
    level thread function_20cf5e5d3c58f3c7();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4384
// Size: 0xb5
function function_20cf5e5d3c58f3c7() {
    level.player endon("death");
    while (!utility::flag("flag_lumbermill_vehicle_spectacle")) {
        a_ai_enemies = getaiarrayinradius(level.farah.origin, 1024, "axis");
        if (a_ai_enemies.size == 0) {
            a_ai_enemies = getaiarrayinradius(level.farah.origin, 2048, "axis");
        }
        if (a_ai_enemies.size > 0) {
            ai_enemy = utility::random(a_ai_enemies);
            level.farah getenemyinfo(ai_enemy);
            wait randomfloatrange(10, 20);
        }
        wait 1;
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4441
// Size: 0x49
function function_f402dfd4e8814fe5() {
    level endon("flag_lumbermill_complete");
    level endon("flag_lumbermill_all_enemies_cleared");
    level thread function_20975eb1e2767d08("flag_lumbermill_farah_rpg_shoot_logs", "s_lumber_mill_RPGtarget_logs");
    level thread function_20975eb1e2767d08("flag_lumbermill_farah_rpg_shoot_road", "s_lumber_mill_RPGtarget_road");
    level thread function_20975eb1e2767d08("flag_lumbermill_farah_rpg_shoot_warehouse", "s_lumber_mill_RPGtarget_warehouse");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4492
// Size: 0x182
function function_20975eb1e2767d08(var_4351daa719f72255, var_beb9ed0e4b7d655c) {
    level endon("flag_lumbermill_complete");
    level.player endon("death");
    level endon("flag_lumbermill_farah_shot_RPG");
    level endon("flag_lumbermill_all_enemies_cleared");
    s_target = getstruct(var_beb9ed0e4b7d655c, "targetname");
    level utility::flag_wait(var_4351daa719f72255);
    var_fbb6852ca18bd530 = squared(256);
    var_1f859102b3b18244 = within_fov_of_players(level.farah geteye(), cos(45));
    var_4deafe6569c8eb89 = distance2dsquared(level.player.origin, s_target.origin) < var_fbb6852ca18bd530;
    if (var_1f859102b3b18244 || var_4deafe6569c8eb89 || flag("flag_lumbermill_farah_shot_RPG")) {
        return;
    }
    rocket = magicbullet("iw9_la_rpapa7_sp_ai_straight", level.farah.origin + (0, 0, 92), s_target.origin);
    rocket waittill("explode", origin);
    level.farah radiusdamage(origin, 256, 500, 50, level.farah, "MOD_EXPLOSIVE");
    playrumbleonposition("grenade_rumble", origin);
    earthquake(0.5, 0.3, origin, 768);
    level utility::flag_set("flag_lumbermill_farah_shot_RPG");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x461c
// Size: 0xd7
function function_ff79345c805e7866() {
    s_lookat = getstruct("s_lumber_mill_farah_meetup_objective", "targetname");
    time = 5;
    counter = 0;
    flag_wait("flag_lumbermill_vehicle_reinforcement_end_path");
    level.farah thread function_ea60d8a423561207();
    while (!flag("flag_lumbermill_player_at_exit")) {
        if (utility::within_fov_of_players(s_lookat.origin, cos(30)) && flag("flag_lumbermill_player_approaching_exit")) {
            if (level.player issprinting()) {
                break;
            }
            counter++;
        } else {
            counter = 0;
        }
        if (counter >= time) {
            break;
        }
        wait 0.1;
    }
    flag_wait_any("flag_lumbermill_farah_outofview", "flag_lumbermill_player_at_exit");
    flag_set("flag_lumbermill_exit_farah_rappel_ready");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46fb
// Size: 0xab
function function_ea60d8a423561207() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    level endon("flag_lumbermill_exit_farah_rappel_ready");
    if (level flag("flag_lumbermill_exit_farah_rappel_ready")) {
        return;
    }
    nd_farah_rooftop_outofsight = getnode("nd_farah_rooftop_outofsight", "targetname");
    level utility::flag_wait_any("flag_lumbermill_all_enemies_cleared", "flag_lumbermill_player_approaching_exit");
    if (!isdefined(nd_farah_rooftop_outofsight)) {
        flag_set("flag_lumbermill_farah_outofview");
        /#
            iprintlnbold("<dev string:x1c>");
        #/
        return;
    }
    self setgoalpos(self.origin);
    self setgoalnode(nd_farah_rooftop_outofsight);
    ent_flag_wait("ent_flag_lumbermill_farah_outofsight");
    flag_set("flag_lumbermill_farah_outofview");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47ae
// Size: 0x90
function function_b571dd13b8a88c13() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    flag_wait("flag_lumbermill_allymovement_soap_2");
    var_7a13b3b2bf608154 = getent("v_lumbermill_farah_catwalk", "targetname");
    if (istrue(self.fixednode)) {
        self.script_fixednode = 0;
        utility::set_fixednode_false();
    }
    self.var_669866694e190a3d = 0;
    self function_95d5375059c2a022(undefined, 1);
    utility::set_ignoresuppression(0);
    self setgoalpos(self.origin);
    self setgoalvolumeauto(var_7a13b3b2bf608154);
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4846
    // Size: 0x5
    function function_6944226e9e44fd81() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4853
// Size: 0x25e
function function_cf63d71a59a34220() {
    level endon("flag_lumbermill_complete");
    level utility::flag_wait_any("flag_lumbermill_player_entered", "flag_lumbermill_player_gave_orders");
    utility::activate_trigger_with_targetname("trig_lumbermill_gaz_0");
    level.gaz notify("stop_going_to_node");
    level.gaz set_fixednode_false();
    level.gaz set_goal_radius(32);
    level.gaz setgoalpos(level.gaz.origin);
    level.gaz.disableplayeradsloscheck = 0;
    level.gaz.pushable = 1;
    level.gaz pushplayer(0);
    level.gaz set_fixednode_false();
    level.gaz namespace_8339f6377b6ba60e::function_4cf134efffb1de77("g");
    level.shepherd notify("stop_going_to_node");
    level.shepherd set_fixednode_false();
    level.shepherd set_goal_radius(32);
    level.shepherd setgoalpos(level.shepherd.origin);
    level.shepherd.disableplayeradsloscheck = 0;
    level.shepherd.pushable = 1;
    level.shepherd pushplayer(0);
    level.shepherd set_fixednode_false();
    level.shepherd.allowstrafe = 0;
    level.shepherd namespace_8339f6377b6ba60e::function_4cf134efffb1de77("y");
    /#
        iprintln("<dev string:x71>");
    #/
    utility::flag_wait_any("flag_lumbermill_vehicle_spectacle", "flag_lumbermill_allymovement_soap_5");
    utility::flag_set("flag_lumbermill_gaz_shepherd_moveup");
    if (!utility::flag("flag_lumbermill_allymovement_soap_6")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_gaz_1");
        /#
            iprintln("<dev string:x90>");
        #/
        utility::flag_wait_any("flag_lumbermill_vehicle_spectacle_complete", "flag_lumbermill_allymovement_soap_6");
    }
    utility::activate_trigger_with_targetname("trig_lumbermill_gaz_2");
    /#
        iprintln("<dev string:xaf>");
    #/
    level.shepherd.allowstrafe = 1;
    flag_wait("flag_lumbermill_enemy_laststand");
    utility::activate_trigger_with_targetname("trig_lumbermill_gaz_3");
    /#
        iprintln("<dev string:xce>");
    #/
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab9
// Size: 0x4b1
function function_8b713341e36926a1() {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    level utility::flag_wait_any("flag_lumbermill_player_entered", "flag_lumbermill_player_gave_orders");
    level.soap notify("stop_going_to_node");
    level.soap set_fixednode_false();
    level.soap set_goal_radius(32);
    level.soap setgoalpos(level.soap.origin);
    level.soap.disableplayeradsloscheck = 0;
    level.soap.pushable = 1;
    level.soap pushplayer(0);
    utility::activate_trigger_with_targetname("trig_lumbermill_right_0");
    level.soap namespace_8339f6377b6ba60e::function_4cf134efffb1de77("b", 128);
    /#
        iprintln("<dev string:xed>");
    #/
    level utility::flag_wait("flag_lumbermill_allymovement_soap_1");
    if (level flag("flag_lumbermill_playerpath_left")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_left_1");
        /#
            iprintln("<dev string:x101>");
        #/
    } else {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_1");
        /#
            iprintln("<dev string:x11c>");
        #/
    }
    level utility::flag_wait("flag_lumbermill_allymovement_soap_2");
    if (level flag("flag_lumbermill_playerpath_left")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_left_2");
        /#
            iprintln("<dev string:x138>");
        #/
    } else {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_2");
        /#
            iprintln("<dev string:x153>");
        #/
    }
    level utility::flag_wait("flag_lumbermill_allymovement_soap_3");
    if (level flag("flag_lumbermill_playerpath_left")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_left_3");
        /#
            iprintln("<dev string:x16f>");
        #/
    } else if (level flag("flag_lumbermill_playerpath_right")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_3");
        /#
            iprintln("<dev string:x18a>");
        #/
    } else {
        utility::activate_trigger_with_targetname("trig_lumbermill_center_3");
        /#
            iprintln("<dev string:x1a6>");
        #/
    }
    level utility::flag_wait("flag_lumbermill_allymovement_soap_4");
    if (level flag("flag_lumbermill_playerpath_left")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_left_4");
        /#
            iprintln("<dev string:x1c3>");
        #/
    } else if (level flag("flag_lumbermill_playerpath_right")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_4");
        /#
            iprintln("<dev string:x1de>");
        #/
    } else {
        utility::activate_trigger_with_targetname("trig_lumbermill_center_4");
        /#
            iprintln("<dev string:x1fa>");
        #/
    }
    level utility::flag_wait("flag_lumbermill_allymovement_soap_5");
    if (level flag("flag_lumbermill_playerpath_left")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_left_5");
        /#
            iprintln("<dev string:x217>");
        #/
    } else if (level flag("flag_lumbermill_playerpath_right")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_5");
        /#
            iprintln("<dev string:x232>");
        #/
    } else {
        utility::activate_trigger_with_targetname("trig_lumbermill_center_5");
        /#
            iprintln("<dev string:x24e>");
        #/
    }
    level utility::flag_wait("flag_lumbermill_allymovement_soap_6");
    if (level flag("flag_lumbermill_playerpath_left")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_left_6");
        /#
            iprintln("<dev string:x26b>");
        #/
    } else {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_6");
        /#
            iprintln("<dev string:x286>");
        #/
    }
    msg = level utility::flag_wait_any_return("flag_lumbermill_allymovement_soap_7", "flag_lumbermill_vehicle_reinforcement_complete");
    if (msg == "flag_lumbermill_allymovement_soap_7") {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_7");
        /#
            iprintln("<dev string:x2a2>");
        #/
    }
    msg = level utility::flag_wait_any_return("flag_lumbermill_allymovement_soap_8", "flag_lumbermill_vehicle_reinforcement_complete");
    if (msg == "flag_lumbermill_allymovement_soap_8") {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_8");
        /#
            iprintln("<dev string:x2be>");
        #/
    }
    utility::flag_wait("flag_lumbermill_vehicle_spectacle");
    if (level flag("flag_lumbermill_playerpath_right")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_9");
        /#
            iprintln("<dev string:x2da>");
        #/
    }
    utility::flag_wait("flag_lumbermill_vehicle_reinforcement_complete");
    if (level flag("flag_lumbermill_playerpath_right")) {
        utility::activate_trigger_with_targetname("trig_lumbermill_right_10");
        /#
            iprintln("<dev string:x2f6>");
        #/
    }
    utility::flag_wait("flag_lumbermill_player_on_road");
    vol = getent("v_lumbermill_road", "targetname");
    while (true) {
        a_ai_enemies = vol utility::get_ai_touching_volume("axis");
        if (a_ai_enemies.size == 0) {
            return;
        }
        wait 1;
    }
    utility::activate_trigger_with_targetname("trig_lumbermill_center_9");
    /#
        iprintln("<dev string:x312>");
    #/
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f72
// Size: 0x19d
function function_3c51401b9f9cbe3e() {
    msg = utility::flag_wait_any_return("flag_lumbermill_all_enemies_cleared", "flag_lumbermill_player_at_exit");
    if (msg == "flag_lumbermill_all_enemies_cleared") {
        s_lumbermill_exit_start = namespace_8339f6377b6ba60e::function_bdc421f433af10c7("s_lumbermill_exit_start");
    } else {
        s_lumbermill_exit_start = namespace_8339f6377b6ba60e::function_bdc421f433af10c7("s_lumbermill_exit_combat_start");
    }
    level utility::flag_set("flag_lumbermill_allies_moving_to_exit");
    utility::clear_force_color();
    self setgoalpos(self.origin);
    thread function_11fc094b83527d81(s_lumbermill_exit_start);
    level utility::flag_wait_any("flag_lumbermill_farah_on_ground", "flag_lumbermill_complete");
    switch (self.animname) {
    case #"hash_df31f98a0b34e496":
        wait 0.5;
        break;
    case #"hash_fb36726c0708cd6d":
        wait 0.1;
        break;
    case #"hash_831c7a280af6bbca":
    default:
        wait 1.5;
        break;
    }
    if (level utility::flag("flag_lumbermill_complete")) {
        return;
    }
    var_5fc071aaa33f9e8c = namespace_8339f6377b6ba60e::function_bdc421f433af10c7("nd_lumbermill_exit_end");
    if (isdefined(level.var_a1495556b1cb21a5)) {
        var_a1495556b1cb21a5 = utility::array_removedead_or_dying(level.var_a1495556b1cb21a5);
        if (var_a1495556b1cb21a5.size > 0) {
            var_5fc071aaa33f9e8c = namespace_8339f6377b6ba60e::function_bdc421f433af10c7("nd_lumbermill_exit_combat_end");
        }
    }
    if (isdefined(var_5fc071aaa33f9e8c.script_flag_wait) && level utility::flag(var_5fc071aaa33f9e8c.script_flag_wait)) {
        var_f2dc54937e1d656e = getstruct(var_5fc071aaa33f9e8c.target, "targetname");
        if (isdefined(var_f2dc54937e1d656e)) {
            var_5fc071aaa33f9e8c = var_f2dc54937e1d656e;
        }
    }
    thread function_11fc094b83527d81(var_5fc071aaa33f9e8c);
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5117
    // Size: 0x5
    function function_357b257d0c73c0b2() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5124
// Size: 0x42f
function function_6fe431ffa0b905bf() {
    level endon("flag_lumbermill_complete");
    array_spawn_function_noteworthy("ai_lumber_mill_JLTV1", &function_83a4c94feaf4003e);
    level thread function_d9a06c430c8ae5e6();
    utility::flag_wait_any("flag_lumbermill_force_vehicle_spectacle", "flag_lumbermill_vehicle_spectacle_upper", "flag_lumbermill_vehicle_spectacle_lower");
    utility::flag_set("flag_lumbermill_vehicle_spectacle");
    wait 1;
    if (utility::flag("flag_lumbermill_vehicle_spectacle_upper") || utility::flag("flag_lumbermill_force_vehicle_spectacle")) {
        function_ae420ea4b3c51398("veh_jltv_dropoff_tundra_lumbermill_sawdust");
        var_3a1cc22a7d8798ba = vehicle::spawn_vehicle_from_targetname("veh_jltv_dropoff_tundra_lumbermill_sawdust");
        var_3e63548ba661f7d = getscriptablearray("scriptable_lumber_fence_sawdust", "targetname");
        var_be557a9393ba9348 = getentarray("lumbermill_smashed_gate_col_sawdust", "targetname");
        var_6553b345676f320f = "ai_lumbermill_sawdust_spawners";
        var_9f096263a302e2f1 = getent("v_lumbermill_sawdust_badplace", "targetname");
        var_db9709d5cee65340 = spawn_script_origin((-1848, 3469, 357));
        var_3a1cc22a7d8798ba thread namespace_f74ba02cf5fc717a::function_50c54ccefd9163de();
    } else if (utility::flag("flag_lumbermill_vehicle_spectacle_lower")) {
        function_ae420ea4b3c51398("veh_jltv_dropoff_tundra_lumbermill_eastroad");
        var_3a1cc22a7d8798ba = vehicle::spawn_vehicle_from_targetname("veh_jltv_dropoff_tundra_lumbermill_eastroad");
        var_3e63548ba661f7d = getscriptablearray("scriptable_lumber_fence_eastroad", "targetname");
        var_be557a9393ba9348 = getentarray("lumbermill_smashed_gate_col_eastroad", "targetname");
        var_6553b345676f320f = "ai_lumbermill_eastroad_spawners";
        var_9f096263a302e2f1 = getent("v_lumbermill_eastroad_badplace", "targetname");
        var_db9709d5cee65340 = spawn_script_origin((-518, 4393, 357));
        var_3a1cc22a7d8798ba thread namespace_f74ba02cf5fc717a::function_163cc1ee70056ff();
    }
    var_3a1cc22a7d8798ba function_cdbb9f5511d53838();
    navobstacleid = createnavbadplacebyent(var_9f096263a302e2f1);
    msg = var_3a1cc22a7d8798ba utility::waittill_notify_or_timeout_return("spawnedRiders", 3);
    if (msg == "timeout") {
        veh_spawner = utility::getvehiclespawner(var_3a1cc22a7d8798ba.targetname, "targetname");
        var_2e56f6e54f1d0851 = getspawnerarray(veh_spawner.target);
        assertex(var_3a1cc22a7d8798ba.riders.size > 0, "Vehicle " + var_3a1cc22a7d8798ba.targetname + " does not have any riders after 3 second wait...");
    }
    var_3a1cc22a7d8798ba thread function_ec66e964d0d7a3a3(var_3e63548ba661f7d, var_db9709d5cee65340);
    var_3a1cc22a7d8798ba thread function_c206c7a97e6040d0(var_be557a9393ba9348);
    var_3a1cc22a7d8798ba thread function_870be6878c8eebf5("flag_lumbermill_vehicle_spectacle_end_path", "flag_lumbermill_vehicle_spectacle_complete");
    var_3a1cc22a7d8798ba thread function_e839b7e34032b9e5();
    var_3a1cc22a7d8798ba thread function_e213e6f56b75cd62("flag_lumbermill_vehicle_spectacle_dead");
    var_3a1cc22a7d8798ba thread namespace_8339f6377b6ba60e::function_a766c8499d8da8c0();
    var_3a1cc22a7d8798ba thread namespace_8339f6377b6ba60e::function_965963a12a43eeeb();
    var_3a1cc22a7d8798ba thread namespace_8339f6377b6ba60e::function_57887b971037db5();
    var_3a1cc22a7d8798ba thread namespace_f74ba02cf5fc717a::function_7f440c78fa69709();
    var_3a1cc22a7d8798ba.var_85d14fa7217047a4 = getfx("vfx_lumber_veh_tread_kickups");
    playfxontag(var_3a1cc22a7d8798ba.var_85d14fa7217047a4, var_3a1cc22a7d8798ba, "tag_origin");
    var_3a1cc22a7d8798ba vehicle_turnengineon();
    var_3a1cc22a7d8798ba thread function_6b4c0678eb3a553a(var_3a1cc22a7d8798ba.targetname + "_start", "script_noteworthy");
    var_3a1cc22a7d8798ba thread function_c899c2d562c0ceca();
    waitframe();
    level notify("audio_lumbermill_vehicle_started");
    level thread function_53b2afdb4cdb17b0(30, var_3a1cc22a7d8798ba);
    msg = level utility::flag_wait_any_return("flag_lumbermill_vehicle_spectacle_end_path", "flag_lumbermill_vehicle_spectacle_dead");
    destroynavobstacle(navobstacleid);
    if (msg == "flag_lumbermill_vehicle_spectacle_end_path") {
        var_3a1cc22a7d8798ba thread namespace_8339f6377b6ba60e::function_5717b4e7fcce1693(0, 0, "vfx_lumber_veh_tread_kickups", 1);
    }
    var_916b92b027b9d883 = [];
    var_a1495556b1cb21a5 = array_removedead_or_dying(level.var_a1495556b1cb21a5);
    if (var_a1495556b1cb21a5.size < 12 || msg == "flag_lumbermill_vehicle_spectacle_dead" && var_a1495556b1cb21a5.size < 16) {
        var_916b92b027b9d883 = array_spawn_targetname(var_6553b345676f320f, 1, 1);
        level.var_a1495556b1cb21a5 = array_combine(level.var_a1495556b1cb21a5, var_916b92b027b9d883);
    }
    utility::flag_set("flag_lumbermill_vehicle_spectacle_complete");
    level thread function_93d86e60f0a2c604();
    var_f585b76d7f472cd9 = get_living_ai_array("ai_lumber_mill_JLTV1", "script_noteworthy");
    var_f585b76d7f472cd9 = array_combine(var_f585b76d7f472cd9, var_916b92b027b9d883);
    var_8bdfff48dfbbe712 = 3;
    if (var_f585b76d7f472cd9.size >= var_8bdfff48dfbbe712) {
        waittill_dead_or_dying(var_f585b76d7f472cd9, var_f585b76d7f472cd9.size - var_8bdfff48dfbbe712);
    }
    utility::flag_set("flag_lumbermill_force_vehicle_reinforcement");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x555b
// Size: 0x9d
function function_ec66e964d0d7a3a3(var_3d845752dbca79ec, var_db9709d5cee65340) {
    exploder("vfx_vehicle_gate_crash_1");
    self endon("death");
    ent_flag_wait("lumbermill_veh_gate_smash");
    foreach (gate in var_3d845752dbca79ec) {
        gate setscriptablepartstate("main", "smash");
    }
    var_db9709d5cee65340 playsound("evt_tun_lumbermill_gate_smash");
    wait 4;
    var_db9709d5cee65340 delete();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5600
// Size: 0xb3
function function_ec66ea64d0d7a5d6(var_3d845752dbca79ec) {
    exploder("vfx_vehicle_gate_crash_2");
    self endon("death");
    var_859e6c8fcab11328 = spawn_script_origin((-1632, 4992, 357));
    ent_flag_wait("lumbermill_veh_gate_smash");
    foreach (gate in var_3d845752dbca79ec) {
        gate setscriptablepartstate("main", "smash");
    }
    var_859e6c8fcab11328 playsound("evt_tun_lumbermill_gate_smash");
    wait 4;
    var_859e6c8fcab11328 delete();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56bb
// Size: 0x77
function function_2380d3aa1c1eafdb() {
    var_9e4a6f90b018b4a5 = getentarray("lumbermill_smashed_gate_col_eastroad", "targetname");
    array_thread(var_9e4a6f90b018b4a5, &hide_entity);
    var_85db43a2b6ea415d = getentarray("lumbermill_smashed_gate_col_back", "targetname");
    array_thread(var_85db43a2b6ea415d, &hide_entity);
    var_3bb26c16f4a67c3d = getentarray("lumbermill_smashed_gate_col_sawdust", "targetname");
    array_thread(var_3bb26c16f4a67c3d, &hide_entity);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x573a
// Size: 0x1b
function function_c206c7a97e6040d0(var_fb75899a616794c5) {
    wait 3;
    array_thread(var_fb75899a616794c5, &show_entity);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x575d
// Size: 0x25
function function_b5f3357d5500263e() {
    wait 5;
    thread function_5adbe6347e9f355f();
    thread function_5adbe7347e9f3792();
    thread function_5adbe8347e9f39c5();
    thread function_5adbe1347e9f2a60();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x578a
// Size: 0x7a
function function_5adbe6347e9f355f() {
    var_49186db926e4859f = getentarray("jup_lumbermill_forklift_01", "targetname");
    trigger_wait_targetname("jup_lumbermill_forklift_dmg_tri_01");
    foreach (var_313e3b7b823bdba4 in var_49186db926e4859f) {
        var_313e3b7b823bdba4 setscriptablepartstate("base", "gastankexplo");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x580c
// Size: 0x7a
function function_5adbe7347e9f3792() {
    var_491365b926de4b30 = getentarray("jup_lumbermill_forklift_02", "targetname");
    trigger_wait_targetname("jup_lumbermill_forklift_dmg_tri_02");
    foreach (var_313e3b7b823bdba4 in var_491365b926de4b30) {
        var_313e3b7b823bdba4 setscriptablepartstate("base", "gastankexplo");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x588e
// Size: 0x7a
function function_5adbe8347e9f39c5() {
    var_490f65b926da5559 = getentarray("jup_lumbermill_forklift_03", "targetname");
    trigger_wait_targetname("jup_lumbermill_forklift_dmg_tri_03");
    foreach (var_313e3b7b823bdba4 in var_490f65b926da5559) {
        var_313e3b7b823bdba4 setscriptablepartstate("base", "gastankexplo");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5910
// Size: 0x7a
function function_5adbe1347e9f2a60() {
    var_492e6db926fcb8d2 = getentarray("jup_lumbermill_forklift_04", "targetname");
    trigger_wait_targetname("jup_lumbermill_forklift_dmg_tri_04");
    foreach (var_313e3b7b823bdba4 in var_492e6db926fcb8d2) {
        var_313e3b7b823bdba4 setscriptablepartstate("base", "gastankexplo");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5992
// Size: 0x2f
function function_e839b7e34032b9e5() {
    self waittill("vehicle_huskCreation", husk);
    waitframe();
    level.var_bbc6d6d49fb243d0 = array_add(level.var_bbc6d6d49fb243d0, husk);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59c9
// Size: 0x60
function function_83a4c94feaf4003e() {
    if (isdefined(self.script_startingposition) && (self.script_startingposition == 4 || self.script_startingposition == 5)) {
        self.vehiclerunexit = 0;
    } else {
        self.vehiclerunexit = 1;
    }
    level.var_a1495556b1cb21a5 = utility::array_add(level.var_a1495556b1cb21a5, self);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a31
// Size: 0x3e
function function_e213e6f56b75cd62(var_ef2ce443bff9166c) {
    self waittill("death", attacker);
    if (isdefined(attacker) && isplayer(attacker)) {
        level notify("lumbermill_vehicle_player_kill");
    }
    level utility::flag_set(var_ef2ce443bff9166c);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5a77
// Size: 0x26
function function_870be6878c8eebf5(var_ef2ce443bff9166c, var_7c21eef8aedc2e4) {
    level endon(var_7c21eef8aedc2e4);
    self waittill("unloading");
    utility::flag_set(var_ef2ce443bff9166c);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5aa5
// Size: 0x1b5
function function_53b2afdb4cdb17b0(waittime, var_3a1cc22a7d8798ba) {
    if (!isdefined(waittime)) {
        waittime = 10;
    }
    level.player endon("death");
    level endon("flag_lumbermill_vehicle_spectacle_dead");
    level endon("flag_lumbermill_all_enemies_cleared");
    level endon("flag_lumbermill_exit_farah_rappel_ready");
    var_c67d1c9ddadad79a = 12;
    counter = 0;
    while (!flag("flag_lumbermill_vehicle_spectacle_end_path")) {
        counter++;
        wait 1;
        if (counter == var_c67d1c9ddadad79a) {
            flag_set("lumber_mill_vehicle_skipto_farah_solve");
            /#
                iprintln("<dev string:x32f>");
            #/
            break;
        }
    }
    if (!flag("lumber_mill_vehicle_skipto_farah_solve")) {
        /#
            iprintln("<dev string:x38a>");
        #/
        wait waittime;
    }
    var_fbb6852ca18bd530 = squared(384);
    var_1f859102b3b18244 = within_fov_of_players(level.farah geteye(), cos(45));
    var_4deafe6569c8eb89 = distance2dsquared(level.player.origin, var_3a1cc22a7d8798ba.origin) < var_fbb6852ca18bd530;
    if (var_1f859102b3b18244 || var_4deafe6569c8eb89) {
        return;
    }
    if (isdefined(var_3a1cc22a7d8798ba)) {
        /#
            iprintln("<dev string:x3d8>");
        #/
        utility::flag_set("flag_lumbermill_vehicle_farah_intervention");
        rocket = magicbullet("iw9_la_rpapa7_sp_ai_straight", level.farah.origin + (0, 0, 92), var_3a1cc22a7d8798ba.origin + (0, 0, 32));
        if (isdefined(rocket)) {
            rocket waittill("explode");
            if (vehicle_code::vehicle_isalive(var_3a1cc22a7d8798ba)) {
                var_3a1cc22a7d8798ba kill();
            }
        }
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c62
// Size: 0x2c8
function function_93d86e60f0a2c604() {
    array_spawn_function_noteworthy("ai_lumber_mill_JLTV2", &function_83a4c94feaf4003e);
    level thread utility::flag_set_delayed("flag_lumbermill_vehicle_reinforcement_ready", 5);
    level utility::flag_wait_any_timeout(30, "flag_lumbermill_player_on_road", "flag_lumbermill_vehicle_spectacle_dead", "flag_lumbermill_force_vehicle_reinforcement");
    if (!level utility::flag("flag_lumbermill_player_on_road")) {
        level utility::flag_wait("flag_lumbermill_vehicle_reinforcement_ready");
    }
    utility::flag_set("flag_lumbermill_vehicle_reinforcement_begin");
    function_ae420ea4b3c51398("veh_jltv_dropoff_tundra_lumbermill_backroad");
    var_a18aaa6de92c3c58 = vehicle::spawn_vehicle_from_targetname("veh_jltv_dropoff_tundra_lumbermill_backroad");
    var_9f096263a302e2f1 = getent("v_lumbermill_backroad_badplace", "targetname");
    navobstacleid = createnavbadplacebyent(var_9f096263a302e2f1);
    msg = var_a18aaa6de92c3c58 utility::waittill_notify_or_timeout_return("spawnedRiders", 3);
    if (msg == "timeout") {
        veh_spawner = utility::getvehiclespawner(var_a18aaa6de92c3c58.targetname, "targetname");
        var_2e56f6e54f1d0851 = getspawnerarray(veh_spawner.target);
        assertex(var_a18aaa6de92c3c58.riders.size > 0, "Vehicle " + var_a18aaa6de92c3c58.targetname + " does not have any riders after 10 second wait...");
    }
    var_3e63548ba661f7d = getscriptablearray("scriptable_lumber_fence_back", "targetname");
    var_be557a9393ba9348 = getentarray("lumbermill_smashed_gate_col_back", "targetname");
    var_a18aaa6de92c3c58 thread function_ec66ea64d0d7a5d6(var_3e63548ba661f7d);
    var_a18aaa6de92c3c58 thread function_c206c7a97e6040d0(var_be557a9393ba9348);
    var_a18aaa6de92c3c58 thread function_870be6878c8eebf5("flag_lumbermill_vehicle_reinforcement_end_path", "flag_lumbermill_vehicle_reinforcement_complete");
    var_a18aaa6de92c3c58 thread function_e839b7e34032b9e5();
    var_a18aaa6de92c3c58 thread function_e213e6f56b75cd62("flag_lumbermill_vehicle_reinforcement_dead");
    var_a18aaa6de92c3c58 thread namespace_8339f6377b6ba60e::function_a766c8499d8da8c0();
    var_a18aaa6de92c3c58 thread namespace_8339f6377b6ba60e::function_965963a12a43eeeb();
    var_a18aaa6de92c3c58 thread namespace_8339f6377b6ba60e::function_57887b971037db5();
    var_a18aaa6de92c3c58 thread namespace_f74ba02cf5fc717a::function_620ba573390478ce();
    var_a18aaa6de92c3c58 thread namespace_f74ba02cf5fc717a::function_7f440c78fa69709();
    var_a18aaa6de92c3c58 function_cdbb9f5511d53838();
    var_a18aaa6de92c3c58.var_85d14fa7217047a4 = getfx("vfx_lumber_veh_tread_kickups");
    playfxontag(var_a18aaa6de92c3c58.var_85d14fa7217047a4, var_a18aaa6de92c3c58, "tag_origin");
    var_a18aaa6de92c3c58 vehicle_turnengineon();
    var_a18aaa6de92c3c58 thread function_6b4c0678eb3a553a(var_a18aaa6de92c3c58.targetname + "_start", "script_noteworthy");
    var_a18aaa6de92c3c58 thread function_c899c2d562c0ceca();
    msg = level utility::flag_wait_any_return("flag_lumbermill_vehicle_reinforcement_end_path", "flag_lumbermill_vehicle_reinforcement_dead");
    destroynavobstacle(navobstacleid);
    if (msg == "flag_lumbermill_vehicle_reinforcement_end_path") {
        var_a18aaa6de92c3c58 thread namespace_8339f6377b6ba60e::function_5717b4e7fcce1693(0, 0, "vfx_lumber_veh_tread_kickups", 1);
    }
    utility::flag_set("flag_lumbermill_vehicle_reinforcement_complete");
    level thread namespace_8339f6377b6ba60e::function_82af1f637fed6a38("flag_lumbermill_player_at_exit", "flag_lumbermill_complete", level.var_a1495556b1cb21a5, ["flag_lumbermill_all_enemies_cleared", "flag_cliff_helo_flyby_1"]);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f32
// Size: 0x1a7
function function_ae420ea4b3c51398(veh_targetname) {
    var_a1495556b1cb21a5 = array_removedead_or_dying(level.var_a1495556b1cb21a5);
    var_847bdc11c3b45b98 = 0;
    if (var_a1495556b1cb21a5.size > 20) {
        var_847bdc11c3b45b98 = 1;
    } else if (var_a1495556b1cb21a5.size < 12) {
        return;
    }
    /#
        if (istrue(var_847bdc11c3b45b98)) {
            iprintln("<dev string:x416>" + 20 + "<dev string:x42d>" + veh_targetname);
        } else {
            iprintln("<dev string:x416>" + 12 + "<dev string:x45c>" + veh_targetname);
        }
    #/
    veh_spawner = utility::getvehiclespawner(veh_targetname, "targetname");
    if (isdefined(veh_spawner.target)) {
        a_spawners = getspawnerarray(veh_spawner.target);
        foreach (spawner in a_spawners) {
            if (istrue(var_847bdc11c3b45b98)) {
                if (isdefined(spawner.script_startingposition) && (spawner.script_startingposition == 2 || spawner.script_startingposition == 3 || spawner.script_startingposition == 4 || spawner.script_startingposition == 5)) {
                    spawner delete();
                }
                continue;
            }
            if (isdefined(spawner.script_startingposition) && (spawner.script_startingposition == 4 || spawner.script_startingposition == 5)) {
                spawner delete();
            }
        }
    }
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x60e1
    // Size: 0x5
    function function_8b43fb10bf6c0a90() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60ee
// Size: 0x73
function function_d08b184a0f5cca2d() {
    createthreatbiasgroup("lumber_mill_enemies");
    createthreatbiasgroup("lumber_mill_player");
    createthreatbiasgroup("lumber_mill_allies");
    createthreatbiasgroup("lumber_mill_farah");
    setthreatbias("lumber_mill_farah", "lumber_mill_enemies", 10000);
    setthreatbias("lumber_mill_player", "lumber_mill_enemies", 100);
    setignoremegroup("lumber_mill_allies", "lumber_mill_enemies");
    setignoremegroup("lumber_mill_enemies", "lumber_mill_allies");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6169
// Size: 0x2b
function function_89b3f6cded94fd0() {
    utility::array_spawn_function_targetname("ai_lumbermill_corpse", &namespace_8339f6377b6ba60e::function_a05bb3a974bf2561);
    var_ca50063debf07a4a = utility::array_spawn_targetname("ai_lumbermill_corpse", 1);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x619c
// Size: 0x3a2
function function_5d6e9df45105c9ea(var_413dd584bdc1a48b, var_683a84d6f403c03e, var_d104f26b38cd6ebd, var_f96ef8c73c8c896e) {
    level.player endon("death");
    level endon("flag_lumbermill_complete");
    var_683a84d6f403c03e = default_to(var_683a84d6f403c03e, 0);
    if (istrue(var_683a84d6f403c03e)) {
        level endon("flag_lumbermill_vehicle_spectacle");
    }
    a_s_targets = getstructarray("s_lumber_mill_fake_target", "targetname");
    while (true) {
        if (isdefined(level.farah) && isai(level.farah)) {
            break;
        }
        waitframe();
    }
    if (isstruct(self)) {
        var_e652a31262ce23e8 = self;
    } else {
        var_e652a31262ce23e8 = spawnstruct();
    }
    if (!istrue(var_e652a31262ce23e8.var_5c9bef7861708dc6)) {
        var_e652a31262ce23e8.var_5c9bef7861708dc6 = 0;
        group_name = var_413dd584bdc1a48b[0].targetname;
        foreach (ai in var_413dd584bdc1a48b) {
            ai set_favoriteenemy(level.farah);
            ai getenemyinfo(level.farah);
            ai function_9215ce6fc83759b9(5000);
            ai setengagementmaxdist(5000, 6000);
            ai.var_669866694e190a3d = 1;
            ai setthreatbiasgroup("lumber_mill_enemies");
            ai utility::set_attackeraccuracy(0.1);
            ai thread function_f90f7075fbff16ed(var_e652a31262ce23e8);
            ai thread function_9a13871e5ce66e5d(var_e652a31262ce23e8);
            ai thread function_7ff64df0137e89d3(var_e652a31262ce23e8);
            ai thread function_11139faf4046a0f4(var_e652a31262ce23e8);
        }
        if (istrue(var_683a84d6f403c03e)) {
            var_e652a31262ce23e8 thread function_9c76f7f5a6175aa4(var_f96ef8c73c8c896e);
        }
        a_notifies = ["ai_damaged_by_player", "ai_killed_by_player", "ai_close_to_player", "ai_whizby_from_player", "ai_force_attack_player"];
        msg = var_e652a31262ce23e8 waittill_any_in_array_return(a_notifies);
        var_e652a31262ce23e8 notify("stop_ai_group_monitor");
        if (msg != "ai_force_attack_player") {
            /#
                iprintln("<dev string:x484>" + group_name + "<dev string:x4a3>" + msg);
            #/
        }
        var_e652a31262ce23e8.var_5c9bef7861708dc6 = 1;
    }
    if (isdefined(var_d104f26b38cd6ebd)) {
        level utility::flag_set(var_d104f26b38cd6ebd);
    }
    var_413dd584bdc1a48b = array_removedead_or_dying(var_413dd584bdc1a48b);
    var_413dd584bdc1a48b = sortbydistance(var_413dd584bdc1a48b, level.player.origin);
    for (i = 0; i < var_413dd584bdc1a48b.size; i++) {
        if (isdefined(var_413dd584bdc1a48b[i]) && isalive(var_413dd584bdc1a48b[i])) {
            guy = var_413dd584bdc1a48b[i];
            guy setthreatbiasgroup();
            guy ent_flag_set("flag_lumbermill_enemy_attacking_player");
            guy.var_669866694e190a3d = 0;
            guy utility::set_attackeraccuracy(0.5);
            guy utility::set_favoriteenemy(undefined);
            guy getenemyinfo(level.player);
            if (isdefined(self.fixednode) && istrue(self.fixednode)) {
                set_fixednode_false();
            }
            guy thread function_ac3003763e67403a();
            if (isdefined(msg) && msg != "ai_force_attack_player") {
                if (istrue(var_683a84d6f403c03e) || guy function_20c0e397ce8b072a()) {
                    guy thread function_548784a738aeb28a();
                }
            }
            volume = guy getgoalvolume();
            if (isdefined(volume) && !guy istouching(volume)) {
                guy thread function_548784a738aeb28a(volume);
            }
        }
        wait randomfloatrange(0.1, 0.3);
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6546
// Size: 0x4a
function function_548784a738aeb28a(volume) {
    self endon("death");
    self setgoalpos(self.origin);
    wait randomfloatrange(3, 6);
    if (isdefined(volume)) {
        self setgoalvolumeauto(volume);
        return;
    }
    thread player_seek_enable();
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6598
// Size: 0x26
function function_20c0e397ce8b072a() {
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "lumber_mill_shotgun") {
        return true;
    }
    return false;
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x65c7
// Size: 0x47
function function_c62d43acd232b24d(str_flag, f_delay) {
    self endon("death");
    if (isarray(str_flag)) {
        level utility::function_665d474ff040b446(str_flag);
    } else {
        level utility::flag_wait(str_flag);
    }
    thread function_33ca9e74d13d95be(1, 256);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6616
// Size: 0x4b
function function_9c76f7f5a6175aa4(var_f96ef8c73c8c896e) {
    self endon("stop_ai_group_monitor");
    if (isdefined(var_f96ef8c73c8c896e)) {
        utility::flag_wait_any("flag_lumbermill_vehicle_spectacle", var_f96ef8c73c8c896e);
    } else {
        utility::flag_wait("flag_lumbermill_vehicle_spectacle");
    }
    wait randomfloatrange(1, 3);
    self notify("ai_force_attack_player");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6669
// Size: 0x5e
function function_f90f7075fbff16ed(struct) {
    self endon("death");
    level.player endon("death");
    struct endon("stop_ai_group_monitor");
    while (true) {
        self waittill("bulletwhizby", attacker);
        if (isdefined(attacker) && isplayer(attacker)) {
            break;
        }
        waitframe();
    }
    struct notify("ai_whizby_from_player");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66cf
// Size: 0x69
function function_9a13871e5ce66e5d(struct) {
    self endon("death");
    level.player endon("death");
    struct endon("stop_ai_group_monitor");
    while (true) {
        self waittill("damage", amount, attacker);
        if (isdefined(attacker) && isplayer(attacker)) {
            break;
        }
        waitframe();
    }
    struct notify("ai_damaged_by_player");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6740
// Size: 0x108
function function_7ff64df0137e89d3(struct) {
    self endon("death");
    level.player endon("death");
    struct endon("stop_ai_group_monitor");
    var_914b47911f0d74fd = squared(192);
    far_dist_sq = squared(384);
    count = 0;
    while (true) {
        var_b183161a9e5cab9a = distance2dsquared(self.origin, level.player.origin);
        if (level.player getstance() != "stand") {
            var_b183161a9e5cab9a *= 0.25;
        }
        if (var_b183161a9e5cab9a < var_914b47911f0d74fd) {
            count++;
        } else if (var_b183161a9e5cab9a < far_dist_sq && self cansee(level.player)) {
            count++;
        } else {
            count = 0;
        }
        if (count > 3) {
            break;
        }
        wait 0.5;
    }
    struct thread utility::notify_delay("ai_close_to_player", randomfloatrange(0.8, 1.2));
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6850
// Size: 0x70
function function_61d946b5dbeee4f6(struct) {
    level.player endon("death");
    struct endon("stop_ai_group_monitor");
    while (true) {
        if (isdefined(self.enemy) && self.enemy != level.farah && isplayer(self.enemy)) {
            break;
        }
        wait 1;
    }
    struct notify("ai_targeting_player");
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68c8
// Size: 0x4b
function function_11139faf4046a0f4(struct) {
    level.player endon("death");
    struct endon("stop_ai_group_monitor");
    self waittill("death", attacker);
    if (isdefined(attacker) && isplayer(attacker)) {
        struct notify("ai_killed_by_player");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x691b
// Size: 0x63
function function_f3dd5a66b28dda10() {
    level.player endon("death");
    level endon("flag_lumbermill_all_enemies_cleared");
    level endon("flag_lumbermill_player_at_exit");
    self waittill("death", attacker, meansofdeath);
    if (isdefined(attacker) && isplayer(attacker)) {
        if (isdefined(meansofdeath) && isexplosivedamagemod(meansofdeath)) {
            level notify("lumbermill_explosive_player_kill");
        }
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6986
// Size: 0xf1
function function_6d7b1343a3025a10() {
    var_7e4eacd4b564b40c = utility::getstructarray("s_lumbermill_semtex", "targetname");
    var_7c760871476912f0 = utility::getstructarray("s_lumbermill_frag", "targetname");
    foreach (struct in var_7e4eacd4b564b40c) {
        var_de5a11a623a00b82 = struct namespace_8339f6377b6ba60e::function_527133d02bd11634("semtex", undefined, undefined, "flag_cliff_allies_move_2");
    }
    foreach (struct in var_7c760871476912f0) {
        var_34f7c3d8345bed2e = struct namespace_8339f6377b6ba60e::function_527133d02bd11634("frag", undefined, undefined, "flag_cliff_allies_move_2");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a7f
// Size: 0xff
function function_a3cc4854c09a3a19() {
    level utility::flag_wait("flag_lumbermill_player_entered");
    level thread namespace_8339f6377b6ba60e::function_b3e858ac93d180e9(240, undefined, "flag_mill_stop_nags", "mill_player_progress");
    level thread namespace_8339f6377b6ba60e::function_4fb957efd679cf35("flag_lumbermill_complete", "mill_player_progress");
    level utility::flag_wait("flag_lumbermill_allymovement_soap_2");
    level thread namespace_8339f6377b6ba60e::function_53670f3fa1413a29("mill_player_progress");
    level utility::flag_wait("flag_lumbermill_allymovement_soap_4");
    level thread namespace_8339f6377b6ba60e::function_53670f3fa1413a29("mill_player_progress");
    level utility::flag_wait("flag_lumbermill_allymovement_soap_6");
    level thread namespace_8339f6377b6ba60e::function_53670f3fa1413a29("mill_player_progress");
    level utility::flag_wait("flag_lumbermill_vehicle_spectacle");
    level namespace_8339f6377b6ba60e::function_aec5169b5cad5be3("flag_mill_stop_nags");
    level utility::flag_wait("flag_lumbermill_vehicle_reinforcement_complete");
    utility::autosave_tactical();
    msg = level utility::flag_wait_any_return("flag_lumbermill_all_enemies_cleared", "flag_lumbermill_complete");
    utility::autosave_tactical();
    if (level utility::flag("flag_lumbermill_all_enemies_cleared")) {
        level thread namespace_8339f6377b6ba60e::function_b3e858ac93d180e9(180, undefined, "flag_mill_stop_nags", "mill_player_progress");
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b86
// Size: 0x79
function function_29904208f729440e() {
    utility::flag_wait("flag_cliff_allies_move_3");
    level.var_a1495556b1cb21a5 = array_removedead_or_dying(level.var_a1495556b1cb21a5);
    if (level.var_a1495556b1cb21a5.size > 0) {
        array_delete(level.var_a1495556b1cb21a5);
    }
    if (level.var_bbc6d6d49fb243d0.size > 0) {
        array_delete(level.var_bbc6d6d49fb243d0);
    }
    waitframe();
    level.var_a1495556b1cb21a5 = undefined;
    level.var_bbc6d6d49fb243d0 = undefined;
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6c07
// Size: 0x11b
function function_19d6e99d74acefe5(var_7a13b3b2bf608154, var_a8c5b1c2f345dac6, var_3303481e64e3a94f) {
    if (!isdefined(self) || !isalive(self)) {
        return 0;
    }
    if (isdefined(var_3303481e64e3a94f) && istrue(var_3303481e64e3a94f)) {
        ai::function_dd21d67ede8ba22(int(self.health * 0.25) + 1);
        utility::set_baseaccuracy(0.75);
        utility::set_attackeraccuracy(3);
    }
    if (isdefined(var_a8c5b1c2f345dac6)) {
        if (isstring(var_a8c5b1c2f345dac6) && var_a8c5b1c2f345dac6 == "clear") {
            utility::set_favoriteenemy(undefined);
            self getenemyinfo(level.player);
        } else {
            utility::set_favoriteenemy(var_a8c5b1c2f345dac6);
        }
    } else if (!isdefined(self.favoriteenemy)) {
        self getenemyinfo(level.player);
    }
    if (isstring(var_7a13b3b2bf608154)) {
        var_7a13b3b2bf608154 = getent(var_7a13b3b2bf608154, "targetname");
    }
    if (istrue(self.fixednode)) {
        self.script_fixednode = 0;
        utility::set_fixednode_false();
    }
    self notify("stop_player_seek");
    self setgoalpos(self.origin);
    self setgoalvolumeauto(var_7a13b3b2bf608154);
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6d2a
    // Size: 0x5
    function function_8fd9602f29fe930d() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d37
// Size: 0x100
function function_b2ee17a0796ff7e6() {
    var_68753956667cddb1 = "flag_cliff_allies_move_3";
    var_5f96f747716609a5 = getentarray("tundra_small_fire", "targetname");
    foreach (var_916a452ebae0a089 in var_5f96f747716609a5) {
        var_916a452ebae0a089 thread function_983950d299b93b00("small", var_916a452ebae0a089.script_noteworthy, var_68753956667cddb1);
    }
    var_bc542afec457aff = getentarray("tundra_medium_fire", "targetname");
    foreach (var_99cb3464ad501e9b in var_bc542afec457aff) {
        var_99cb3464ad501e9b thread function_983950d299b93b00("medium", var_99cb3464ad501e9b.script_noteworthy, var_68753956667cddb1);
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6e3f
// Size: 0x11d
function function_983950d299b93b00(size, var_4015fbc3fbd66550, var_68753956667cddb1) {
    level endon(var_68753956667cddb1);
    self hide();
    triggerradius = 64;
    if (size == "medium") {
        triggerradius = 128;
    }
    triggerheight = triggerradius;
    if (self.script_noteworthy == "flag_change_me") {
        self waittill(var_4015fbc3fbd66550);
    } else {
        level waittill(var_4015fbc3fbd66550);
    }
    trigger = spawn("trigger_radius_fire", self.origin, 0, triggerradius, triggerheight);
    thread trigger_fire(trigger);
    self notify("end_interact_monitor");
    fire = spawn_tag_origin();
    vfx = "vfx_tun_env_fire_smoke_veh_1_sm";
    if (size == "medium") {
        vfx = "vfx_tun_env_fire_smoke_veh_1_med";
        fire.origin += (0, 0, 0);
    }
    self.vfx = playfxontag(getfx(vfx), fire, "tag_origin");
    thread function_ba4873e483e29790(vfx, fire, var_68753956667cddb1, trigger);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6f64
// Size: 0x41
function function_ba4873e483e29790(vfx, fire, var_68753956667cddb1, trigger) {
    self waittill(var_68753956667cddb1);
    trigger delete();
    stopfxontag(getfx(vfx), fire, "tag_origin");
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6fad
    // Size: 0x5
    function function_9c80586ecfc3c9a() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fba
// Size: 0x88
function function_53f23d38856581b6() {
    var_68753956667cddb1 = "flag_cliff_allies_move_3";
    var_d9acc6c19c733aa0 = getstructarray("tundra_veh_suv", "targetname");
    foreach (var_ed52d81a1e869f1c in var_d9acc6c19c733aa0) {
        var_ed52d81a1e869f1c thread function_5b5d8ee4dcbf37e8("iw9_la_rpapa7_sp_ai_straight", var_ed52d81a1e869f1c.script_noteworthy, var_68753956667cddb1);
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x704a
// Size: 0x13a
function function_5b5d8ee4dcbf37e8(type, var_4015fbc3fbd66550, var_68753956667cddb1) {
    level endon(var_68753956667cddb1);
    if (self.script_noteworthy == "flag_change_me") {
        self waittill(var_4015fbc3fbd66550);
    } else {
        level waittill(var_4015fbc3fbd66550);
    }
    if (type == "iw9_ar_mike4_sp") {
        s_source = getstruct(self.target, "targetname");
        magicbullet(type, s_source.origin, self.origin);
        var_aca68979461ad4fa = spawn_tag_origin();
        thread function_8880100b396c9aec(var_aca68979461ad4fa, undefined, s_source.angles, (0, 0, 0), 1);
        magicgrenade("frag", self.origin + (0, 0, 2), self.origin, 0.1, 0);
        self notify("end_damage_monitor");
    } else {
        s_target = getstruct(self.target, "targetname");
        magicbullet(type, self.origin, s_target.origin);
    }
    flag_clear(var_4015fbc3fbd66550);
    self notify("end_interact_monitor");
}

/#

    // Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x718c
    // Size: 0x5
    function function_dd120410e3accba1() {
        
    }

#/

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7199
// Size: 0x100
function function_8d8336a40ad05db0() {
    var_68753956667cddb1 = "flag_cliff_allies_move_3";
    var_fab5525dad1d6971 = getentarray("tundra_lobbed_molotov", "targetname");
    var_e0f1e774067d69de = getentarray("tundra_lobbed_smoke", "targetname");
    foreach (molotov in var_fab5525dad1d6971) {
        molotov thread function_bb00d4946b5df582("molotov", molotov.script_noteworthy, var_68753956667cddb1);
    }
    foreach (smoke in var_e0f1e774067d69de) {
        smoke thread function_bb00d4946b5df582("smoke", smoke.script_noteworthy, var_68753956667cddb1);
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x72a1
// Size: 0xb6
function function_bb00d4946b5df582(type, var_4015fbc3fbd66550, var_68753956667cddb1) {
    level endon(var_68753956667cddb1);
    source = getstruct(self.target, "targetname");
    self hide();
    if (self.script_noteworthy == "flag_change_me") {
        self waittill(var_4015fbc3fbd66550);
    } else {
        level waittill(var_4015fbc3fbd66550);
    }
    grenade = magicgrenade(type, source.origin, self.origin, 0, 0);
    if (type == "molotov") {
        grenade thread function_8163ab86b16c0735(source.angles);
    }
    self notify("end_interact_monitor");
    flag_clear(var_4015fbc3fbd66550);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x735f
// Size: 0x70
function function_8163ab86b16c0735(var_6951cf1f43bc8ebe) {
    self waittill("missile_stuck", stuckto, hitentpart, surfacetype, velocity, origin, normal);
    self playsound("iw9_weap_molotov_bottle");
    thread function_8880100b396c9aec(self, undefined, var_6951cf1f43bc8ebe, velocity, 1);
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x73d7
// Size: 0xfb
function function_8880100b396c9aec(grenade, stuckto, var_6951cf1f43bc8ebe, impactvelocity, b_hide) {
    angles = undefined;
    forward = vectornormalize(impactvelocity);
    up = anglestoup(grenade.angles);
    right = anglestoright(var_6951cf1f43bc8ebe);
    if (abs(vectordot(forward, up)) >= 0.9848) {
        angles = scripts\sp\equipment\molotov::molotov_rebuild_angles_up_right(up, right);
    } else {
        angles = scripts\sp\equipment\molotov::molotov_rebuild_angles_up_forward(up, forward);
    }
    grenade.angles = angles;
    grenade notify("death");
    grenade.owner = level.player;
    scripts\sp\equipment\molotov::molotov_simulate_impact(grenade, grenade.origin, angles, stuckto, impactvelocity, gettime(), undefined);
    if (isdefined(self)) {
        if (istrue(b_hide)) {
            self hide();
        }
    }
}

// Namespace namespace_edf401999ae22ce6 / namespace_5775a1a12081a26
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74da
// Size: 0xa7
function function_d9a06c430c8ae5e6() {
    level.player endon("death");
    level endon("flag_lumbermill_vehicle_spectacle_lower");
    level endon("flag_lumbermill_vehicle_spectacle");
    trig_lumbermill_lower_forward = getent("trig_lumbermill_lower_forward", "targetname");
    assertex(isdefined(trig_lumbermill_lower_forward), "WARNING: 'trig_lumbermill_lower_forward' was not found.");
    flag_wait("flag_lumbermill_farah_callout_snipersnest");
    while (true) {
        var_f5c40d62d769e1cf = trig_lumbermill_lower_forward utility::get_ai_touching_volume("axis");
        var_f5c40d62d769e1cf = array_removedead_or_dying(var_f5c40d62d769e1cf);
        if (flag("flag_lumbermill_lower_forward") && var_f5c40d62d769e1cf.size <= 4) {
            flag_set("flag_lumbermill_vehicle_spectacle_lower");
            return;
        }
        wait 3.5;
    }
}

