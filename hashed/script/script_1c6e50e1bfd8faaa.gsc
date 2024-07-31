#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7d3e27aa82b5d70b;
#using script_16428d24c490aed3;
#using script_4e6e58ab5d96c2b0;
#using script_100adcc1cc11d2fa;
#using scripts\mp\gametypes\ob.gsc;
#using scripts\common\callbacks.gsc;
#using script_2d400da2610fe542;
#using script_3f9c618c4c35ed2;
#using script_1f97a44d1761c919;
#using script_46c7c73b1a7e4773;
#using script_7edf952f8921aa6b;
#using script_7b2517368c79e5bc;
#using scripts\common\powerups.gsc;
#using script_7e41e37180e554f;
#using script_793f5fa29ca62c00;
#using script_2ac1abaaff251be6;
#using script_41387eecc35b88bf;
#using script_143ad6d9c2b4c721;
#using script_5a5fd0c909da7dac;
#using script_249b0a9054ceb230;
#using script_2f1eb9e550fc34a8;
#using script_118c3165d7948d8b;
#using script_25d5af9df677cbe;
#using script_29b50ff5f1477a5d;
#using script_685207987fef2bdc;
#using script_c6b9e8fb3a7de37;
#using script_260b46e6d2ece28a;
#using script_528320cb3630530d;
#using script_337e3ff7ad8cf996;
#using script_2e177f1d7a5b9456;
#using script_6633a5b5b878ff12;
#using script_51f24f75eec1f8a7;

#namespace namespace_6f390e4fde2064d;

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x788
// Size: 0xde
function function_2dcca6d862cc31d5(params) {
    utility::function_3677f2be30fdd581("jup_ob_fx", "jup_ob_rift_run_fx");
    namespace_618dd2e6238edda3::function_9075c9a5985b8ac0(self);
    self.rift_run = 1;
    difficulty = "normal";
    if (getdvarint(@"hash_73cfb77eb49c943", 0)) {
        difficulty = "hard";
    }
    self dlog_recordplayerevent("dlog_event_ob_player_rift_run", ["started", 1, "difficulty", difficulty]);
    if (isplayer(self)) {
        foreach (weapon in self.primaryweapons) {
            self givemaxammo(weapon);
        }
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86e
// Size: 0xb9
function function_4dd5d69d550c0999() {
    level endon("game_ended");
    scrambler = spawn("script_model", function_dc80e43dced96932());
    n_radius = int(default_to(function_868dda939525d6dd(), 10000));
    while (true) {
        if (!isdefined(level.players) || level.players.size < 1) {
            waitframe();
            continue;
        }
        owner = random(level.players);
        scrambler.team = owner.team;
        scrambler makescrambler(owner, undefined, n_radius, 1);
        owner waittill("disconnect");
        scrambler clearscrambler();
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x92f
// Size: 0x92
function private function_dc80e43dced96932() {
    var_a284af43d8329f61 = getstructarray("minimap_corner", "targetname");
    v_loc = (0, 0, 0);
    if (var_a284af43d8329f61.size) {
        foreach (corner in var_a284af43d8329f61) {
            v_loc += corner.origin;
        }
        v_loc /= var_a284af43d8329f61.size;
    }
    return v_loc;
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9ca
// Size: 0x4d
function private function_868dda939525d6dd() {
    var_a284af43d8329f61 = getstructarray("minimap_corner", "targetname");
    if (var_a284af43d8329f61.size > 1) {
        return (distance2d(var_a284af43d8329f61[0].origin, var_a284af43d8329f61[1].origin) / 1.9);
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1f
// Size: 0x80
function function_35b9ded36a8bcce1() {
    level waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    level thread namespace_b3f32c8cb80b8124::function_aadc1c81b3fd1dd2(level.players);
    foreach (player in level.players) {
        player clearsoundsubmix("jup_ob_prematch", 2);
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa7
// Size: 0xe6
function function_b74088644ee18731() {
    thread function_4dd5d69d550c0999();
    thread namespace_b000de497fab9bf4::function_ccde446fe7425514();
    thread function_35b9ded36a8bcce1();
    level flag_wait("ai_spawn_director_initialized");
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&scripts\mp\gametypes\ob::function_91d032246bb24684);
    level.var_a3605064bf81a95c = 0;
    scripts\common\callbacks::add("ob_locked_space_unlocked", &function_c30596883f5589b7);
    thread namespace_f6368c72597c6d90::function_2a56c656879dbf63();
    thread function_d20174d63594a712();
    thread function_95484dc1fa0e07fc();
    thread function_61cd13522a6c6045();
    thread function_f86a7718dec2e17();
    thread function_8d61e53700cfa26d();
    thread namespace_88d9f8b28d831818::function_ecd079f7925cc275();
    thread function_d6be862ee76f002c();
    namespace_b000de497fab9bf4::function_a13799ae222a8b48("exit_portal");
    level.var_e345b15591192b73 = 0;
    function_8b5b2a3392fc7e2a("ActivitySuccess", &function_83d43ec21f04f972, "REV_OB_OUTLAST");
    function_8b5b2a3392fc7e2a("ActivitySuccess", &function_83d43ec21f04f972, "REV_OB_SABOTAGE");
    function_8b5b2a3392fc7e2a("ActivitySuccess", &function_83d43ec21f04f972, "REV_OB_ESCORT_ZOMBIES");
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb95
// Size: 0x29
function function_61aea37385c298a9(params) {
    self endon("death_or_disconnect");
    namespace_446fc987a980892f::playevent("rift_run_s1_exit", [self], 0.5);
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc6
// Size: 0xbb
function function_83d43ec21f04f972(var_6f8af5eb76deac21) {
    level.var_e345b15591192b73++;
    foreach (player in level.players) {
        player namespace_838b439602b3acc7::function_9db4c37d4f1415f("rift_run_contract_completed");
        if (getdvarint(@"hash_73cfb77eb49c943", 0)) {
            player namespace_838b439602b3acc7::function_9db4c37d4f1415f("rift_run_hard_contract_completed");
        }
    }
    if (randomint(100) < 33) {
        level endon("game_ended");
        namespace_446fc987a980892f::playevent("rift_run_s1_contract_complete", level.players, 4.5);
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc89
// Size: 0x2d
function function_8d61e53700cfa26d() {
    level endon("game_ended");
    level utility::flag_wait("ob_infil_completed");
    namespace_446fc987a980892f::playevent("rift_run_s1_arrive", level.players, 7);
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcbe
// Size: 0x297
function function_f86a7718dec2e17() {
    level._effect["mrpeeks_intro_glow"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_activity_mrpeeks_amb.vfx");
    level._effect["mrpeeks_launch_glow"] = loadfx("vfx/s4/gamemode/vfx_alps_spotlight_glow_blue.vfx");
    a_spawns = getstructarray("mrpeeks_intro", "targetname");
    var_763be5feec8258b8 = [];
    a_models = [];
    while (var_763be5feec8258b8.size < 3) {
        waitframe();
        var_763be5feec8258b8 = getstructarray("activity_nexus_instance_joiner", "targetname");
    }
    for (i = 0; i < a_spawns.size; i++) {
        v_target = undefined;
        foreach (var_9eb7ab2bffa0be65 in var_763be5feec8258b8) {
            if (var_9eb7ab2bffa0be65.script_noteworthy == a_spawns[i].script_noteworthy) {
                v_target = var_9eb7ab2bffa0be65.origin;
                if (var_9eb7ab2bffa0be65.script_noteworthy == "OUTLAST_FORT") {
                    b_invert = 1;
                    s_trigger = a_spawns[i];
                } else {
                    b_invert = 0;
                }
                break;
            }
        }
        if (isdefined(v_target)) {
            e_model = utility::spawn_model("ob_mrp", a_spawns[i].origin, a_spawns[i].angles);
            e_model thread function_786907b8e0e31227(v_target, b_invert);
            playfxontag(level._effect["mrpeeks_intro_glow"], e_model, "tag_origin");
            a_models[a_models.size] = e_model;
            if (b_invert) {
                var_e81207e336379e6d = e_model;
            }
        }
    }
    if (!a_models.size) {
        return;
    }
    var_e81207e336379e6d playloopsound("evt_ob_rr_bunny_attract_lp");
    trigger = getent("mrpeeks_intro_trigger", "targetname");
    while (isdefined(trigger)) {
        ent = trigger waittill("trigger");
        if (isplayer(ent)) {
            var_e81207e336379e6d stoploopsound();
            playsoundatpos(var_e81207e336379e6d.origin, "evt_ob_rr_bunny_flyaway");
            foreach (e_model in a_models) {
                playfxontag(level._effect["mrpeeks_launch_glow"], e_model, "tag_origin");
                e_model notify("bunny_launch_time");
                wait 0.4;
            }
            return;
        }
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf5d
// Size: 0xe5
function private function_786907b8e0e31227(v_target, b_invert) {
    self endon("death");
    thread function_e6dbdae3069edce4(b_invert);
    self waittill("bunny_launch_time");
    time = 4;
    v_start = self.origin;
    gravity = getdvarint(@"bg_gravity", 0) * -1;
    dist = distance(v_start, v_target);
    power = dist / time;
    delta = v_target - v_start;
    drop = 0.5 * gravity * time * time;
    velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    self movegravity(velocity, time);
    wait time;
    self delete();
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x104a
// Size: 0x78
function private function_e6dbdae3069edce4(b_invert) {
    self endon("death");
    self endon("bunny_launch_time");
    n_move_time = 1.25;
    n_dist = 32;
    if (b_invert) {
        n_dist *= -1;
    }
    while (true) {
        self moveto(self.origin - (0, 0, n_dist), n_move_time);
        wait n_move_time;
        self moveto(self.origin + (0, 0, n_dist), n_move_time);
        wait n_move_time;
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ca
// Size: 0x1ae
function function_c30596883f5589b7(params) {
    level.var_a3605064bf81a95c++;
    if (level.var_a3605064bf81a95c > 6) {
        /#
            iprintlnbold("<dev string:x1c>");
        #/
        level endon("game_ended");
        level scripts\common\callbacks::remove("ob_locked_space_unlocked", &function_c30596883f5589b7);
        level scripts\common\callbacks::add("on_zombie_ai_spawned", &function_29ed201ad0740f4e);
        a_ai = getaiarray();
        foreach (ai in a_ai) {
            if (isalive(ai)) {
                ai namespace_dd16d65e824b8e9::function_f1e5805da192a1ef("walk", "walker_ee", 99);
            }
        }
        wait 60;
        level scripts\common\callbacks::remove("on_zombie_ai_spawned", &function_29ed201ad0740f4e);
        a_ai = getaiarray();
        foreach (ai in a_ai) {
            if (isalive(ai)) {
                for (i = 0; i < ai.var_caeb5ca53668812c.size; i++) {
                    current = ai.var_caeb5ca53668812c[i];
                    if (isdefined(current) && current.id == "walker_ee") {
                        ai.var_caeb5ca53668812c = array_remove_index(ai.var_caeb5ca53668812c, i);
                        break;
                    }
                }
                ai namespace_dd16d65e824b8e9::function_f1e5805da192a1ef();
            }
        }
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1280
// Size: 0x4a
function function_c0ec711e1ca76fd7(params) {
    if (self.aicategory == "elite") {
        self._blackboard.var_2af8408672f2a570 = 250;
        self._blackboard.var_2ad5368672cc47ba = 300;
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d2
// Size: 0x8a
function function_d6be862ee76f002c() {
    level flag_wait("ob_infil_completed");
    var_3ba758145a58afe0 = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "nexus_activity_joiner_phone");
    foreach (scriptable in var_3ba758145a58afe0) {
        if (scriptable getscriptablehaspart("nexus_activity_joiner_phone")) {
            scriptable setscriptablepartstate("nexus_activity_joiner_phone", "visible_rift_run");
        }
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1364
// Size: 0x1c
function function_3b588416e348d52a(player) {
    self setscriptablepartstate("nexus_activity_joiner_phone", "hidden");
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1388
// Size: 0x9c
function function_d20174d63594a712() {
    var_29a3db0499a2874 = array_randomize(getstructarray("ob_locked_space_loot", "targetname"));
    foreach (var_f9916153a8893c5b in var_29a3db0499a2874) {
        namespace_2abc885019e1956::function_cd45408bd44fab07("ob_jup_items_rift_run_locked_spaces_loot", 1, var_f9916153a8893c5b.origin, var_f9916153a8893c5b.angles + (0, 90, 0), 1, 1);
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x142c
// Size: 0xa7
function function_95484dc1fa0e07fc() {
    var_4bd4a641e714664d = getstructarray("ob_locked_space_key", "targetname");
    foreach (var_40232f10bc2d69b8 in var_4bd4a641e714664d) {
        itembundle = getscriptbundle("itemspawnentry:" + var_40232f10bc2d69b8.script_noteworthy);
        if (isdefined(itembundle)) {
            namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, var_40232f10bc2d69b8.origin, var_40232f10bc2d69b8.angles, 1, 1);
        }
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14db
// Size: 0xce
function function_61cd13522a6c6045() {
    level flag_wait("ob_infil_completed");
    level flag_wait("drop_powerups");
    var_f6e2fa7c17f84498 = getstructarray("ob_locked_space_powerup", "targetname");
    offset = (0, 0, scripts\common\powerups::function_edeba0070ca0709e("drop_height_offset"));
    foreach (var_b2ef8a26b8e2267f in var_f6e2fa7c17f84498) {
        if (isdefined(var_b2ef8a26b8e2267f.script_noteworthy)) {
            level thread scripts\common\powerups::function_d4be622286a198(var_b2ef8a26b8e2267f.script_noteworthy, var_b2ef8a26b8e2267f.origin + offset, var_b2ef8a26b8e2267f.angles);
            waitframe();
        }
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b1
// Size: 0x3f
function function_e6dfeb25a36940f3(infostruct) {
    if (!isdefined(self.doghouse_struct)) {
        return;
    }
    namespace_2abc885019e1956::function_cd45408bd44fab07("ob_jup_items_keys_rift_run_s1", 1, self.doghouse_struct.origin, undefined, 1, 1);
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15f8
// Size: 0x57
function function_a91a31131747f347(infostruct) {
    if (!isdefined(self.orb) || !isdefined(self.orb.var_f6f7b435e792fcd4)) {
        return;
    }
    namespace_2abc885019e1956::function_cd45408bd44fab07("ob_jup_items_keys_rift_run_s1", 1, self.orb.var_f6f7b435e792fcd4, undefined, undefined, 1);
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1657
// Size: 0x5a
function function_6036b23af9df84a3(infostruct) {
    if (!isdefined(self.var_779e11fc33f215f9)) {
        return;
    }
    namespace_2abc885019e1956::function_cd45408bd44fab07("ob_jup_items_keys_rift_run_s1", 1, self.var_779e11fc33f215f9.origin + anglestoup(self.var_779e11fc33f215f9.angles) * 10, undefined, undefined, 1);
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16b9
// Size: 0xd4
function function_94d29d832035af94(params) {
    namespace_98c7625238714297::function_447c6ab4bea16b52("global", "REV_OB_DOGHOUSE", &namespace_f82e883a38a92b9a::function_58fb23fc08762d69, &namespace_a73abb0dcbe359ce::function_fd69cf02ba4d90a2);
    namespace_70aa82e7f409bc33::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_e6dfeb25a36940f3, "REV_OB_DOGHOUSE");
    namespace_98c7625238714297::function_447c6ab4bea16b52("activity", "REV_OB_HARVESTERORB", &namespace_74c17ccb56a8563f::function_28cb7cb9dd6c20c2, &namespace_b86da4cec945c2::function_fd69cf02ba4d90a2);
    namespace_70aa82e7f409bc33::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_a91a31131747f347, "REV_OB_HARVESTERORB");
    namespace_98c7625238714297::function_447c6ab4bea16b52("global", "REV_OB_TURRET_TRAP", &namespace_47d96238dd467828::function_3d88cdeba8222b15, &namespace_9607052b3c2afb1a::function_fd69cf02ba4d90a2);
    namespace_98c7625238714297::function_447c6ab4bea16b52("global", "REV_OB_AETHERTEAR", &namespace_5d8c3870222947b5::function_483ef1bf0c76bedc, &namespace_ab27c6145201fe44::function_fd69cf02ba4d90a2);
    namespace_98c7625238714297::function_447c6ab4bea16b52("activity", "REV_OB_AETHERNEST", &namespace_b45a9c6ad5a91687::function_cf070c7d20b69e36, &namespace_3cb017699ecfb3ae::function_fd69cf02ba4d90a2);
    namespace_70aa82e7f409bc33::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_6036b23af9df84a3, "REV_OB_AETHERNEST");
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1795
// Size: 0x5c
function function_5d39bca170851543(params) {
    namespace_98c7625238714297::function_447c6ab4bea16b52("contract", "REV_OB_OUTLAST", &namespace_edd624734aa27359::function_42696fef39309a29, &namespace_75285dec588fecb6::function_fd69cf02ba4d90a2);
    namespace_98c7625238714297::function_447c6ab4bea16b52("contract", "REV_OB_ESCORT_ZOMBIES", &namespace_d38a1af3e02dea2f::function_de62bc27675c1bfc, &namespace_26d7ef0567e3c3d4::function_fd69cf02ba4d90a2);
    namespace_98c7625238714297::function_447c6ab4bea16b52("contract", "REV_OB_SABOTAGE", &namespace_ea045e2c848ddf3c::function_923e85d3bf0ec24b, &namespace_6410a814a444bcf4::function_fd69cf02ba4d90a2);
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17f9
// Size: 0x42
function function_dc150a1bb8f2dfde(params) {
    namespace_3d4b3a42272925::main();
    function_79eeaeaaa71ade27();
    if (getdvarint(@"hash_73cfb77eb49c943", 0)) {
        level flag_set("begin_floater_movement");
        return;
    }
    function_8814bf1a3819a8de();
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1843
// Size: 0x11c
function function_79eeaeaaa71ade27() {
    var_f8bf483b77217871 = getstructarray("ob_floater", "targetname");
    foreach (var_5309b78f7ad7d3c4 in var_f8bf483b77217871) {
        if (isdefined(var_5309b78f7ad7d3c4.script_noteworthy)) {
            e_floater = spawn("script_model", var_5309b78f7ad7d3c4.origin);
            e_floater.angles = var_5309b78f7ad7d3c4.angles;
            e_floater.var_fafa04e766ba2e01 = e_floater.origin;
            e_floater.var_3527bee7b3a69a0f = e_floater.angles;
            e_floater.radius = int(default_to(var_5309b78f7ad7d3c4.radius, 200));
            e_floater setmodel(var_5309b78f7ad7d3c4.script_noteworthy);
            e_floater thread function_25ec394f5469ed5b();
            e_floater thread function_18954968a63cc736();
            waitframe();
        }
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1967
// Size: 0xbe
function function_25ec394f5469ed5b() {
    self endon("death");
    self endon("pause_floater");
    level endon("game_ended");
    level flag_wait("begin_floater_movement");
    if (self.origin != self.var_fafa04e766ba2e01) {
        self moveto(self.var_fafa04e766ba2e01, 8, 3, 3);
        wait 8.2;
    }
    while (true) {
        var_bde0a0fd36314443 = randomfloatrange(50, 150);
        n_time = randomfloatrange(8, 11);
        self movez(var_bde0a0fd36314443, n_time, 3, 3);
        wait n_time + 0.2;
        n_time = randomfloatrange(8, 11);
        self movez(var_bde0a0fd36314443 * -1, n_time, 3, 3);
        wait n_time + 0.2;
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2d
// Size: 0xa3
function function_18954968a63cc736() {
    self endon("death");
    self endon("pause_floater");
    level endon("game_ended");
    level flag_wait("begin_floater_movement");
    wait randomfloatrange(2, 5);
    while (true) {
        n_rotate = randomfloatrange(10, 25);
        n_time = randomfloatrange(8, 11);
        if (utility::cointoss()) {
            n_rotate *= -1;
        }
        self rotateby((n_rotate, n_rotate, n_rotate), n_time);
        wait n_time + 0.2;
        n_time = randomfloatrange(8, 11);
        self rotateby((n_rotate, n_rotate, n_rotate) * -1, n_time);
        wait n_time + 0.2;
    }
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad8
// Size: 0xe6
function function_8814bf1a3819a8de() {
    level flag_wait("drop_powerups");
    var_f6e2fa7c17f84498 = getstructarray("ob_floater_powerup", "targetname");
    offset = scripts\common\powerups::function_edeba0070ca0709e("drop_height_offset");
    foreach (var_b2ef8a26b8e2267f in var_f6e2fa7c17f84498) {
        if (isdefined(var_b2ef8a26b8e2267f.script_noteworthy)) {
            var_7c5f128ad799ba66 = anglestoup(var_b2ef8a26b8e2267f.angles) * offset;
            level scripts\common\powerups::function_d4be622286a198(var_b2ef8a26b8e2267f.script_noteworthy, var_b2ef8a26b8e2267f.origin + var_7c5f128ad799ba66, var_b2ef8a26b8e2267f.angles);
            waitframe();
        }
    }
    level flag_set("begin_floater_movement");
}

// Namespace namespace_6f390e4fde2064d / namespace_a2e8eaa629316056
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc6
// Size: 0x1e
function function_29ed201ad0740f4e(params) {
    namespace_dd16d65e824b8e9::function_f1e5805da192a1ef("walk", "ee", 99);
}

