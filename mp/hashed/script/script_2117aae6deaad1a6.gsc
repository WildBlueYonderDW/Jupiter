#using script_4c543f01345a2c04;
#using script_22f1701e151b9d12;
#using script_1d306ffd8d10d8d0;
#using script_4fa7e9e11630166c;
#using script_71721925888affd9;
#using scripts\common\callbacks.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\common\string.gsc;
#using scripts\mp\utility\player.gsc;
#using script_48814951e916af89;
#using script_42fadda36015f142;

#namespace namespace_6ace6c3e1e794ef6;

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf14
// Size: 0x11
function function_fe9f67aed00a33a() {
    thread function_fcc6252deeb51f3e();
    function_f0c3d97d3267bb99();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2d
// Size: 0x28
function function_1ed5091b83546ef1() {
    function_69d0ff3471d9f2b();
    function_c152b7e99a61a1ba();
    thread function_d431d0e29384eecd();
    thread function_e97732e8c14dc5e4();
    thread function_6af34d368a20da3b();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf5d
// Size: 0x65
function function_a1005e06a26908ab() {
    function_8cedc263b475c0ca();
    function_ca39bf5d30808a2(self.entitydata.spawnlocation);
    function_b45b78aa06b629c3();
    function_b3697a75a11fa7fa();
    function_159acdf8d431fa01();
    function_9bbc5dc3c5041320();
    function_d8745fad7e6b8728();
    function_3f925d6c15e205a6();
    thread EntityBoss_SetupBossStartAudio();
    thread function_d3e9cb6967f7e32();
    thread function_8903bf90630bd772();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfca
// Size: 0x46
function private function_8cedc263b475c0ca() {
    if (!isdefined(self.var_4e54c3ab5875f278)) {
        self.var_4e54c3ab5875f278 = spawnstruct();
    }
    self.var_4e54c3ab5875f278.var_9267ed46ecdf37c5 = 0;
    thread function_d21ac02b3c58910c();
    flag_clear("entity_boss_fake_death");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1018
// Size: 0x49
function private function_d21ac02b3c58910c() {
    level endon("game_ended");
    self endon("death");
    self.var_5323a94889eff1de = 1;
    self.var_8e2f2a391a0169c1 = 10000;
    namespace_bfef6903bca5845d::function_f55d225b544277e8(self, 10);
    ent_flag_wait("stealth_enabled");
    self setstealthstate("combat");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1069
// Size: 0x32
function private function_69d0ff3471d9f2b() {
    flag_init("entity_start_spawn_zombies");
    flag_init("entity_boss_fake_death");
    flag_init("entity_arena_arrive");
    flag_init("entity_shutdown_encounter");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10a3
// Size: 0x46
function private function_b3697a75a11fa7fa() {
    callback::add("on_zombie_ai_killed", &function_fdd5e0d9768b174b);
    callback::add("on_zombie_ai_damaged", &function_35558b097e2e2af3);
    callback::add("zombie_entity_pre_teleport_callback", &function_54e48fcfe13a22ad);
    callback::add("zombie_entity_post_teleport_callback", &function_4a16b80442a45f66);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10f1
// Size: 0x46
function private function_63e46bd0d616316b() {
    callback::remove("on_zombie_ai_killed", &function_fdd5e0d9768b174b);
    callback::remove("on_zombie_ai_damaged", &function_35558b097e2e2af3);
    callback::remove("zombie_entity_pre_teleport_callback", &function_54e48fcfe13a22ad);
    callback::remove("zombie_entity_post_teleport_callback", &function_4a16b80442a45f66);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x113f
// Size: 0x81
function private function_fdd5e0d9768b174b(params) {
    self.var_4e54c3ab5875f278 = undefined;
    function_59467b7569ee98ab();
    function_1a93a03740225ecf();
    function_5f9fa5db9197d79b();
    function_48a5fa56f9aebad9();
    if (isdefined(level.var_ad5d9c2f5d7df9b9)) {
        level.var_ad5d9c2f5d7df9b9 notify("lightbomb_beam_end");
        level.var_ad5d9c2f5d7df9b9 notify("lightbomb_beam_origin_end");
    }
    function_63e46bd0d616316b();
    if (isdefined(self.var_b58b1d878321b783)) {
        self.var_b58b1d878321b783 delete();
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x11c8
// Size: 0x13
function private function_35558b097e2e2af3(params) {
    function_f35bfeb5ba127255(params);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11e3
// Size: 0x4e
function function_f18f39783c8cedc4(var_e6a4d8c8216e66fc, var_92ba40b46d0eed9, var_cf4a720b9f17cbdb) {
    if (isdefined(var_e6a4d8c8216e66fc)) {
        function_9b8829ab4092a7d7("ob_rift_story", var_e6a4d8c8216e66fc);
    }
    if (isdefined(var_92ba40b46d0eed9)) {
        function_9b8829ab4092a7d7("ob_zombie_ambient_s3_story", var_92ba40b46d0eed9);
    }
    if (isdefined(var_cf4a720b9f17cbdb)) {
        function_9b8829ab4092a7d7("ob_zombie_ambient_s5_mimic_story", var_cf4a720b9f17cbdb);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1239
// Size: 0xa8
function private function_d8745fad7e6b8728() {
    foreach (player in level.players) {
        player callback::add("exfil_success", &function_f46839e2181a3943);
        player callback::add("ob_dark_aether_exit_used", &function_f46839e2181a3943);
        player callback::add("player_disconnect", &function_f46839e2181a3943);
        player callback::add("bleedout_tick", &function_7b0b4cc4d84856d);
        player callback::add("player_revived", &function_78cbdc873439af6b);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x12e9
// Size: 0x13
function private function_f46839e2181a3943(params) {
    function_1e1bc1b8c9a34a3(params);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1304
// Size: 0x56
function private function_1a93a03740225ecf() {
    foreach (player in level.players) {
        player function_b4f01be2fbe86632();
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1362
// Size: 0x57
function private function_b4f01be2fbe86632() {
    callback::remove("exfil_success", &function_f46839e2181a3943);
    callback::remove("ob_dark_aether_exit_used", &function_f46839e2181a3943);
    callback::remove("player_disconnect", &function_f46839e2181a3943);
    callback::remove("bleedout_tick", &function_7b0b4cc4d84856d);
    callback::remove("player_revived", &function_78cbdc873439af6b);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x13c1
// Size: 0x35
function private function_d3e9cb6967f7e32(var_c738c3b00598761c) {
    level endon("game_ended");
    self endon("death");
    self waittill("fake_death");
    flag_set("entity_boss_fake_death");
    thread function_33331be1f0728f19();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13fe
// Size: 0x9e
function function_fcc6252deeb51f3e() {
    level endon("game_ended");
    self endon("death");
    s_trigger = getstruct("beat_04_trigger_teleport_fall", "targetname");
    level.var_8e0f6e362bf57e99 = getstruct("beat_04_trigger_teleport_dest", "targetname");
    teleport_trigger = spawn("trigger_box", s_trigger.origin, 0, (48000, 48000, 128), (48000, 48000, 0));
    teleport_trigger thread function_8c72f70385789705();
    registersharedfunc("blackhole_bomb", "override_teleport", &function_b32b7fe44ae26b3a);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x14a4
// Size: 0x67
function private function_d753fe889a24d565() {
    var_799015587fcdda8f = level.var_8e0f6e362bf57e99;
    var_799015587fcdda8f.origin = function_b541fc0ccbdcb0bf(var_799015587fcdda8f.origin, 150);
    var_799015587fcdda8f.angles = vectortoangles(level.var_8e0f6e362bf57e99.origin - var_799015587fcdda8f.origin);
    return var_799015587fcdda8f;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1514
// Size: 0x51
function private function_b541fc0ccbdcb0bf(origin, radius) {
    theta = randomint(360);
    offset = (radius * cos(theta), radius * sin(theta), 0);
    randompoint = origin + offset;
    return randompoint;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x156e
// Size: 0x16
function private function_b32b7fe44ae26b3a(player) {
    player thread function_5fa720955875d01d();
    return true;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x158d
// Size: 0x3f
function private function_5fa720955875d01d() {
    level endon("game_ended");
    self endon("death");
    var_795faa0fc41daa4e = function_d753fe889a24d565();
    level namespace_daf861dc59373546::function_c4ab3b08781de0ed(self, undefined, var_795faa0fc41daa4e, 1, 1, 1);
    ent_flag_clear("blackhole_teleporting");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15d4
// Size: 0xa5
function private function_8c72f70385789705() {
    level endon("game_ended");
    self endon("death");
    /#
        if (getdvarint(@"hash_f20cdcca886b211b", 0)) {
            var_be2d1602782c929e = getdvarint(@"hash_f20cdcca886b211b", 0);
        }
    #/
    while (true) {
        self waittill("trigger", player);
        if (isplayer(player)) {
            if (player ent_flag("teleporting")) {
                continue;
            }
            if (istrue(player.var_77286dec820ab001)) {
                continue;
            }
            var_795faa0fc41daa4e = function_d753fe889a24d565();
            player thread Player_FallTelport_Watcher(var_795faa0fc41daa4e, 30, self);
        }
        waitframe();
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1681
// Size: 0x15
function private function_55466301c92c12e2(params) {
    self.var_77286dec820ab001 = 0;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x169e
// Size: 0xdd
function private Player_FallTelport_Watcher(var_795faa0fc41daa4e, damage, trigger) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("Player_FallTelport_Watcher");
    self endon("Player_FallTelport_Watcher");
    self.var_77286dec820ab001 = 1;
    callback::add("player_bleedout", &function_55466301c92c12e2);
    for (i = 1; i <= 2; i++) {
        if (istrue(self.inlaststand)) {
            break;
        }
        self dodamage(damage, trigger.origin, trigger, undefined, "MOD_TRIGGER_HURT", "<explicitweaponnone>");
        self playsoundtoplayer("ob_entity_idle_damage_hit_plr", self);
        wait 0.4;
    }
    level namespace_daf861dc59373546::function_c4ab3b08781de0ed(self, undefined, var_795faa0fc41daa4e, 1, 1, 1);
    callback::remove("player_bleedout", &function_55466301c92c12e2);
    self.var_77286dec820ab001 = 0;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1783
// Size: 0x50
function private function_c152b7e99a61a1ba() {
    level._effect["lightbomb_beam_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_megabomb_beam.vfx");
    level._effect["abom_mega_beam_hit_fx"] = loadfx("vfx/jup/ob/gameplay/riftrun/s5_5/story_mission/vfx_lightbomb_imp_lrg.vfx");
    level._effect["abom_mega_beam_tip_fx"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_megabomb_beam_tip.vfx");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17db
// Size: 0x47
function private function_3f925d6c15e205a6() {
    var_82a1ec83be1be850 = getstruct("ob_circle_boss", "targetname");
    if (isdefined(var_82a1ec83be1be850) && isdefined(var_82a1ec83be1be850.origin)) {
        self function_65cdab0fc78aba8f(var_82a1ec83be1be850.origin, 10000);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x182a
// Size: 0x9c
function function_b45b78aa06b629c3() {
    triggerorigin = self.origin - (0, 0, 1500);
    var_b58b1d878321b783 = spawn("trigger_radius", triggerorigin, 0, 600, 3000);
    var_b58b1d878321b783 enablelinkto();
    var_b58b1d878321b783 linkto(self);
    self.var_b58b1d878321b783 = var_b58b1d878321b783;
    var_b62109ffa270f8f2 = getstruct("beat_04_trigger_teleport_dest", "targetname");
    var_b58b1d878321b783 thread function_a6e3ca2faa32794b(self, var_b62109ffa270f8f2);
    /#
        if (getdvarint(@"hash_2462bc3bd33193a9", 0)) {
            thread function_ee5861facd0b08a2();
        }
    #/
}

/#

    // Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x18ce
    // Size: 0x8d
    function private function_ee5861facd0b08a2() {
        level endon("<dev string:x1c>");
        self endon("<dev string:x2a>");
        while (true) {
            triggerorigin = self.origin - (0, 0, 1500);
            draw_circle(triggerorigin, 600, (1, 1, 0), 1, 0, 1);
            draw_circle(triggerorigin + (0, 0, 3000), 600, (1, 1, 0), 1, 0, 1);
            waitframe();
        }
    }

#/

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1963
// Size: 0x64
function private function_a6e3ca2faa32794b(var_35b6397afde1bae7, var_b62109ffa270f8f2) {
    level endon("game_ended");
    self endon("death");
    while (true) {
        self waittill("trigger", player);
        if (isplayer(player)) {
            if (player ent_flag("teleporting")) {
                continue;
            }
            player thread Player_KillField_Teleport(var_35b6397afde1bae7, var_b62109ffa270f8f2);
        }
        waitframe();
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x19cf
// Size: 0xf5
function private Player_KillField_Teleport(var_35b6397afde1bae7, var_bcc0f894a6733feb) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("Player_KillField_Teleport");
    self endon("Player_KillField_Teleport");
    ent_flag_set("teleporting");
    val::set("aether_tear", "damage", 0);
    self playsoundevent("snd_aethertear_teleport_plr");
    self freezecontrols(1);
    playfx(getfx("aethertear_teleport_vfx"), self.origin);
    thread namespace_daf861dc59373546::function_c39cc8ea8a52f609(1.25);
    wait 1;
    self freezecontrols(0);
    val::set("aether_tear", "damage", 1);
    self setorigin(var_bcc0f894a6733feb.origin);
    wait 0.2;
    ent_flag_clear("teleporting");
    if (isalive(var_35b6397afde1bae7)) {
        self dodamage(self.maxhealth, self.origin, var_35b6397afde1bae7, var_35b6397afde1bae7, "MOD_IMPACT");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1acc
// Size: 0xe
function function_f14e2b18d9628796() {
    flag_set("entity_start_spawn_zombies");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae2
// Size: 0x99
function function_629b56ecce32d438() {
    if (isdefined(level.var_25a729512e633df2) && level.var_25a729512e633df2.size > 0) {
        foreach (encounter in level.var_25a729512e633df2) {
            if (isdefined(encounter.id)) {
                function_adcc96a7d541aa36(encounter.id, 1);
            }
        }
    }
    flag_set("entity_shutdown_encounter");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b83
// Size: 0xbd
function private function_6af34d368a20da3b() {
    level endon("game_ended");
    flag_wait("entity_start_spawn_zombies");
    var_28eb4771af752acd = getstructarray("beat_04_enc_sml", "script_noteworthy");
    var_78a88cc24d9e6707 = getstructarray("beat_04_enc_med", "script_noteworthy");
    var_118cd042493e019f = getstructarray("beat_04_enc_main", "script_noteworthy");
    function_9b8829ab4092a7d7("ob_rift_story_s5_boss", 1);
    level callback::add("on_ai_killed", &function_8aa9050c1c2dbbc1);
    function_dc81ba8ecf1a803b(320, var_28eb4771af752acd, 6, 1);
    function_dc81ba8ecf1a803b(440, var_78a88cc24d9e6707, 10, 3);
    function_dc81ba8ecf1a803b(720, var_118cd042493e019f, 15, 4);
    flag_clear("entity_start_spawn_zombies");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1c48
// Size: 0x25b
function function_dc81ba8ecf1a803b(f_radius, var_88628ddbe8fc955d, var_f0baff2492ed03ac, var_7699b30e98c23733) {
    level.var_d1ae7b187bf453fb = 0.95;
    foreach (var_ceee63874d54e2ae in var_88628ddbe8fc955d) {
        for (var_ab0031fe8073f6da = 1; var_ab0031fe8073f6da <= 2; var_ab0031fe8073f6da++) {
            size = var_ceee63874d54e2ae.script_label;
            if (var_ab0031fe8073f6da == 2) {
                var_7d648dea441f35a7 = size + "_elites";
            } else {
                var_7d648dea441f35a7 = size;
            }
            var_323e6f8904ab5390 = spawn_request("ai_flood_fill_encounter:s5_rift_sm_boss_phase_01_" + var_7d648dea441f35a7, var_ceee63874d54e2ae.origin, var_ceee63874d54e2ae.radius, 1, 1, 0);
            function_adcc96a7d541aa36(var_323e6f8904ab5390, 0);
            var_cccd6771a9656b96 = var_ceee63874d54e2ae.targetname;
            if (isdefined(var_323e6f8904ab5390)) {
                if (var_ab0031fe8073f6da == 2) {
                    level.var_25a729512e633df2[var_323e6f8904ab5390] = structcopy(var_ceee63874d54e2ae);
                    level.var_25a729512e633df2[var_323e6f8904ab5390].structname = var_cccd6771a9656b96 + "_elites";
                    level.var_25a729512e633df2[var_323e6f8904ab5390].targetname = var_cccd6771a9656b96 + "_elites";
                    level.var_25a729512e633df2[var_323e6f8904ab5390].iselite = 1;
                    level.var_25a729512e633df2[var_323e6f8904ab5390].var_adf6f96283e41c95 = var_7699b30e98c23733;
                    level.var_25a729512e633df2[var_323e6f8904ab5390].var_1f061a8830dd6c7b = 0;
                } else {
                    level.var_25a729512e633df2[var_323e6f8904ab5390] = var_ceee63874d54e2ae;
                    level.var_25a729512e633df2[var_323e6f8904ab5390].structname = var_cccd6771a9656b96;
                    level.var_25a729512e633df2[var_323e6f8904ab5390].iselite = 0;
                    function_100a116a829b9b77(var_323e6f8904ab5390, var_7d648dea441f35a7, var_f0baff2492ed03ac);
                }
                level.var_25a729512e633df2[var_323e6f8904ab5390].id = var_323e6f8904ab5390;
                level.var_25a729512e633df2[var_323e6f8904ab5390].var_60bfb35fb6d50606 = var_7d648dea441f35a7;
                function_73147cdf5c28d10c(var_323e6f8904ab5390, &function_4780846da6c234a8, var_323e6f8904ab5390);
                function_bc5315dc37ae4cf(var_323e6f8904ab5390, &function_8c2d63c53a4dd06a, level.var_d1ae7b187bf453fb);
                function_e4a67fe4ddca7ed5(var_323e6f8904ab5390, &function_f70a742664e8a1a6, self);
            }
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eab
// Size: 0xa0
function function_1ef7a5d5735e50c() {
    if (isdefined(level.var_25a729512e633df2) && level.var_25a729512e633df2.size > 0) {
        foreach (encounter in level.var_25a729512e633df2) {
            if (isdefined(encounter.id)) {
                function_adcc96a7d541aa36(encounter.id, 1);
                function_9950e6e485bf5261(encounter.id, 0);
            }
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f53
// Size: 0xd6
function function_100a116a829b9b77(encounterid, size, var_f0baff2492ed03ac) {
    squadsize = level.players.size;
    if ((squadsize > 1 || getdvarint(@"hash_35c5ed076ebf750a", 0)) && size != "sml") {
        var_f59ab661ba766221 = squadsize * 2;
        var_f59ab661ba766221 = int(min(squadsize, 4)) * 2;
        if (getdvarint(@"hash_35c5ed076ebf750a", 0)) {
            var_f59ab661ba766221 = getdvarint(@"hash_35c5ed076ebf750a");
        }
        var_f59ab661ba766221 += var_f0baff2492ed03ac;
        level.var_25a729512e633df2[encounterid].aicount = var_f59ab661ba766221;
        function_4b7d420e1bad897f(encounterid, var_f59ab661ba766221);
        return;
    }
    level.var_25a729512e633df2[encounterid].aicount = var_f0baff2492ed03ac;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2031
// Size: 0xf
function function_f81d9514815ccfcc() {
    function_9b8829ab4092a7d7("ob_rift_story_s5_boss_elites", 1);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2048
// Size: 0xa5
function function_f70a742664e8a1a6(requestid, instance, agent, ai_data) {
    agent function_65cdab0fc78aba8f(agent.origin, 1024);
    if (isdefined(level.var_25a729512e633df2[requestid]) && istrue(level.var_25a729512e633df2[requestid].iselite)) {
        if (level.var_25a729512e633df2[requestid].var_1f061a8830dd6c7b <= level.var_25a729512e633df2[requestid].var_adf6f96283e41c95) {
            level.var_25a729512e633df2[requestid].var_1f061a8830dd6c7b++;
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20f5
// Size: 0x11b
function function_2fa941ea332291e5(var_d1ae7b187bf453fb, iselite) {
    squadsize = level.players.size;
    if (iselite) {
        var_a2d386b38e9c732e = 5;
        var_e28126f456d8fcc8 = 10;
    } else {
        var_709e51a3b4a33e1a = 2;
        var_e28126f456d8fcc8 = 8;
    }
    if (isdefined(level.var_db4f032e4875e23a)) {
        var_5e1b773e28f589df = float(level.var_db4f032e4875e23a function_6a493253ff0a74bd() / level.var_db4f032e4875e23a function_539a480132aefe25());
    } else {
        var_5e1b773e28f589df = 1;
    }
    var_8ff174be99bff6d2 = clamp(squadsize, 1, 3);
    var_d1ae7b187bf453fb = (level.var_36e0429c9cc73b40 + 1) * level.var_d1ae7b187bf453fb;
    var_415fd8a0dbe8422f = 2 / var_8ff174be99bff6d2;
    var_ebae3ffd14f48d6e = 8 / var_8ff174be99bff6d2;
    waveinterval = 2 + (var_ebae3ffd14f48d6e - var_415fd8a0dbe8422f) * (1 + var_5e1b773e28f589df) / var_d1ae7b187bf453fb;
    waittime = waveinterval + level.var_6d298bb3b2c8bf0;
    if (!isdefined(waittime)) {
        waittime = 2;
    }
    return waittime;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2219
// Size: 0x84
function private function_76a5c6bbfdf5fc99(requestid, var_35b6397afde1bae7) {
    if (!(isdefined(var_35b6397afde1bae7) && isdefined(var_35b6397afde1bae7.var_4e54c3ab5875f278)) || !isalive(var_35b6397afde1bae7)) {
        return false;
    }
    if (flag("entity_shutdown_encounter")) {
        return false;
    }
    if (flag("entity_boss_fake_death") || !var_35b6397afde1bae7 ent_flag("entity_spawnanim_finished")) {
        return false;
    }
    if (!(isdefined(level.var_25a729512e633df2) && isdefined(level.var_25a729512e633df2[requestid]))) {
        return false;
    }
    return true;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22a6
// Size: 0x250
function function_8c2d63c53a4dd06a(requestid, var_d1ae7b187bf453fb) {
    var_35b6397afde1bae7 = level.var_db4f032e4875e23a;
    if (!function_76a5c6bbfdf5fc99(requestid, var_35b6397afde1bae7)) {
        return false;
    }
    encounter = level.var_25a729512e633df2[requestid];
    if (isdefined(encounter.lastspawntime)) {
        if (var_35b6397afde1bae7 ent_flag("entity_ready_for_lightbomb")) {
            waittime = function_9fd790edd94c8736(level.var_31cfa03a7e864f49);
        } else if (istrue(var_35b6397afde1bae7.var_4e54c3ab5875f278.var_9267ed46ecdf37c5)) {
            waittime = function_2fa941ea332291e5(var_d1ae7b187bf453fb, encounter.iselite);
        }
        if (isdefined(waittime)) {
            waittime = clamp(waittime, 2, 15);
            waittime *= 1000;
            if (gettime() < encounter.lastspawntime + waittime) {
                return false;
            }
        }
    }
    if (isdefined(level.var_ad5d9c2f5d7df9b9) && isdefined(level.var_ad5d9c2f5d7df9b9.var_eeedaa69c3d8a6d5) && flag("stop_lightbomb_zombies")) {
        if (requestid == level.var_ad5d9c2f5d7df9b9.var_eeedaa69c3d8a6d5 || encounter.structname == level.var_ad5d9c2f5d7df9b9.target + "_elites") {
            return false;
        }
    }
    entitystruct = var_35b6397afde1bae7 function_9d343b075a77dcba();
    if (isdefined(entitystruct)) {
        var_a89ee7c900ada430 = entitystruct.script_parameters;
    } else {
        var_a89ee7c900ada430 = "NoEntityStruct";
    }
    var_d2d4fb8c1973e6d0 = encounter.script_parameters;
    if (!isdefined(var_d2d4fb8c1973e6d0)) {
        var_d2d4fb8c1973e6d0 = "NoEncounter";
    }
    if (istrue(var_35b6397afde1bae7.var_4e54c3ab5875f278.var_9267ed46ecdf37c5) && var_a89ee7c900ada430 == var_d2d4fb8c1973e6d0) {
        if (istrue(level.var_e1ee0c91c12c017b)) {
            if (getdvarint(@"hash_9e62db1761cac6cc", 0)) {
                return false;
            }
        } else if (level.var_36e0429c9cc73b40 == 0) {
            return false;
        }
    }
    if (isdefined(encounter.var_1f061a8830dd6c7b) && encounter.var_1f061a8830dd6c7b == encounter.var_adf6f96283e41c95) {
        return false;
    }
    level.var_25a729512e633df2[requestid].lastspawntime = gettime();
    return true;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24ff
// Size: 0x75
function function_8aa9050c1c2dbbc1(params) {
    if (isdefined(level.var_25a729512e633df2) && isdefined(self.var_ad46aadd4e3290d7)) {
        encounter = level.var_25a729512e633df2[self.var_ad46aadd4e3290d7];
        if (isdefined(encounter) && istrue(encounter.iselite)) {
            if (encounter.var_1f061a8830dd6c7b > 0) {
                encounter.var_1f061a8830dd6c7b--;
            }
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x257c
// Size: 0x29
function function_4780846da6c234a8(requestid, userdata) {
    if (flag("entity_shutdown_encounter")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25ad
// Size: 0x324
function function_d431d0e29384eecd() {
    assertex(isdefined(level.var_a4cba23c9788f32b) && level.var_a4cba23c9788f32b.size > 0, "<dev string:x33>");
    structs = level.var_a4cba23c9788f32b;
    var_c5e64707d1197842 = getscriptablearray("beamloc_boss", "targetname");
    level.var_3dc08a6f2ec67556 = [];
    level.var_c0238cac3e5ba2dd = undefined;
    for (i = 1; i <= 4; i++) {
        level.var_3dc08a6f2ec67556[i] = spawnstruct();
        level.var_3dc08a6f2ec67556[i].var_47a3a239c6b7196a = [];
        level.var_3dc08a6f2ec67556[i].index = 0;
    }
    foreach (struct in level.var_a4cba23c9788f32b) {
        var_a93406c9902bd15d = struct.origin + (0, 0, 40);
        var_dadcf7b6f4bc223b = struct.origin + (0, 0, 40) + (0, 0, 24);
        foreach (beam in var_c5e64707d1197842) {
            if (beam.script_noteworthy == struct.script_noteworthy) {
                struct.var_69e6b818ca7c77c9 = beam;
            }
        }
        struct.var_3d46bbaedc22240a = spawnscriptable("jup_zm_rift_s5_pedestal_orb_scriptable", var_a93406c9902bd15d, struct.angles);
        struct.var_3d46bbaedc22240a setscriptablepartstate("body", "off");
        struct.var_69e6b818ca7c77c9 setscriptablepartstate("beam", "off");
        var_50c9fe046a33ac45 = string_split(struct.var_737867c8af16d15a, ",");
        /#
            if (getdvarint(@"hash_b5024b31d9ec2722", 0)) {
                iprintln(var_50c9fe046a33ac45[0]);
            }
        #/
        structname = struct.script_noteworthy;
        for (i = 1; i <= 4; i++) {
            indexstr = to_string(i);
            if (array_contains(var_50c9fe046a33ac45, indexstr)) {
                level.var_3dc08a6f2ec67556[i].var_47a3a239c6b7196a[level.var_3dc08a6f2ec67556[i].var_47a3a239c6b7196a.size] = struct;
            }
        }
    }
    for (i = 1; i <= 4; i++) {
        level.var_3dc08a6f2ec67556[i].var_47a3a239c6b7196a = array_randomize(level.var_3dc08a6f2ec67556[i].var_47a3a239c6b7196a);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d9
// Size: 0x1c
function function_e97732e8c14dc5e4() {
    flag_wait("entity_phase_02_spawned");
    level.var_d1ae7b187bf453fb = 0.5;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28fd
// Size: 0x17f
function function_a86701f2ed0c0cd0() {
    entitystruct = level.var_db4f032e4875e23a function_9d343b075a77dcba();
    level.entitypos = entitystruct.origin;
    locationindex = int(entitystruct.script_parameters);
    var_47a3a239c6b7196a = level.var_3dc08a6f2ec67556[locationindex].var_47a3a239c6b7196a;
    arrayindex = level.var_3dc08a6f2ec67556[locationindex].index;
    if (isdefined(level.var_c0238cac3e5ba2dd)) {
        if (level.var_c0238cac3e5ba2dd == var_47a3a239c6b7196a[arrayindex]) {
            if (arrayindex < var_47a3a239c6b7196a.size - 1) {
                arrayindex++;
            } else {
                arrayindex = 0;
            }
        }
    }
    level.var_ad5d9c2f5d7df9b9 = var_47a3a239c6b7196a[arrayindex];
    level.var_c0238cac3e5ba2dd = var_47a3a239c6b7196a[arrayindex];
    level.var_ad5d9c2f5d7df9b9.var_9bbca044327b6388 = 0;
    if (arrayindex < var_47a3a239c6b7196a.size - 1) {
        arrayindex++;
    } else {
        arrayindex = 0;
    }
    level.var_3dc08a6f2ec67556[locationindex].index = arrayindex;
    var_3eaa15f9a7737fc3 = level.var_ad5d9c2f5d7df9b9.origin;
    end_angle = vectortoangles(level.entitypos - var_3eaa15f9a7737fc3);
    level.var_ad5d9c2f5d7df9b9.angles = end_angle;
    level.var_ad5d9c2f5d7df9b9.vfxorigin = var_3eaa15f9a7737fc3 + (0, 0, 170);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a84
// Size: 0xbd
function function_ba1032e495c9c1ca() {
    if (!isdefined(level.var_ad5d9c2f5d7df9b9)) {
        level.var_ad5d9c2f5d7df9b9 = spawnstruct();
    }
    flag_clear("entity_phase_02_lightbomb_charged");
    function_a86701f2ed0c0cd0();
    switch (level.var_ad5d9c2f5d7df9b9.script_parameters) {
    case #"hash_900cb06c552c5063":
        level.var_ad5d9c2f5d7df9b9.var_890b325b9fc98921 = 320;
        break;
    case #"hash_28a7ce6c1f1955d9":
        level.var_ad5d9c2f5d7df9b9.var_890b325b9fc98921 = 440;
        break;
    case #"hash_faea0534e49cf368":
        level.var_ad5d9c2f5d7df9b9.var_890b325b9fc98921 = 720;
        break;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b49
// Size: 0x3c
function function_7a3d254a251a6d49() {
    level.var_f0a816d0cf9f949e = level.var_98c031b802e80cdd[level.var_31cfa03a7e864f49] * (1 + 0.6 * (min(level.players.size, 3) - 1));
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8d
// Size: 0xc1
function function_4ce64c508cf1094b() {
    self.var_3d46bbaedc22240a setscriptablepartstate("body", "active");
    self.var_69e6b818ca7c77c9 setscriptablepartstate("beam", "on");
    function_7a3d254a251a6d49();
    /#
        if (getdvarint(@"hash_87dd3a01c7e61bb3", 0)) {
            level.var_f0a816d0cf9f949e = getdvarint(@"hash_87dd3a01c7e61bb3", 0);
        }
    #/
    level callback::add("on_ai_killed", &function_35460ce5848546aa);
    level callback::add("player_laststand", &function_c87db1eca7d00763);
    /#
        if (getdvarint(@"hash_abcde77137628726", 0)) {
            level.var_ad5d9c2f5d7df9b9 function_f6edc2a8de195f9d();
            return;
        }
    #/
    function_5c571f1a684a7054();
    thread function_edeb8f5e6ee2dc7f();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c56
// Size: 0x10e
function function_5c571f1a684a7054() {
    flag_clear("stop_lightbomb_zombies");
    foreach (encounter in level.var_25a729512e633df2) {
        if (encounter.structname == self.target && !istrue(encounter.iselite)) {
            self.var_eeedaa69c3d8a6d5 = encounter.id;
            switch (encounter.var_60bfb35fb6d50606) {
            case #"hash_900cb06c552c5063":
                var_f59ab661ba766221 = 2;
                break;
            case #"hash_28a7ce6c1f1955d9":
                var_f59ab661ba766221 = 5;
                break;
            case #"hash_faea0534e49cf368":
                var_f59ab661ba766221 = 7;
                break;
            }
            var_f59ab661ba766221 += encounter.aicount;
            function_4b7d420e1bad897f(encounter.id, var_f59ab661ba766221);
            break;
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6c
// Size: 0x139
function function_edeb8f5e6ee2dc7f() {
    while (!flag("entity_phase_02_lightbomb_charged")) {
        var_9ca36a8adbb2c7f6 = getaiarrayinradius(self.origin, 1280);
        foreach (zombie in var_9ca36a8adbb2c7f6) {
            if (!isdefined(zombie.var_f89106513931332c)) {
                zombie.var_f89106513931332c = 0;
            }
            var_52d83275cdaec498 = distance2dsquared(zombie.origin, self.origin) < 1638400;
            if (var_52d83275cdaec498 == 1 && zombie.var_f89106513931332c == 0 && isalive(zombie)) {
                zombie function_3ab9164ef76940fd("obelisk_vfx", "electric");
                zombie.var_f89106513931332c = 1;
                continue;
            }
            if (var_52d83275cdaec498 == 0 && zombie.var_f89106513931332c == 1) {
                zombie function_3ab9164ef76940fd("obelisk_vfx", "off");
                zombie.var_f89106513931332c = 0;
            }
        }
        wait 0.2;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ead
// Size: 0xa2
function function_c87db1eca7d00763(params) {
    if (isdefined(level.var_ad5d9c2f5d7df9b9) && level.var_6d298bb3b2c8bf0 == 0) {
        if (distance2dsquared(self.origin, level.var_ad5d9c2f5d7df9b9.origin) < 1638400) {
            if (level.var_62e6cd77567f71b9 < level.var_7fa7689c48de2dd5.size) {
                level.var_6d298bb3b2c8bf0 = level.var_7fa7689c48de2dd5[level.var_62e6cd77567f71b9];
                level.var_62e6cd77567f71b9++;
                wait level.var_6d298bb3b2c8bf0;
                level.var_6d298bb3b2c8bf0 = 0;
            }
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f57
// Size: 0x10b
function function_9fd790edd94c8736(var_31cfa03a7e864f49) {
    squadsize = level.players.size;
    if (isdefined(level.var_f0a816d0cf9f949e)) {
        if (level.var_f0a816d0cf9f949e <= 0) {
            function_7a3d254a251a6d49();
        }
    } else {
        function_7a3d254a251a6d49();
    }
    var_b4a0bb985e832edf = level.var_f2d34ed1ef9932b2 / level.var_f0a816d0cf9f949e;
    var_8ff174be99bff6d2 = int(clamp(squadsize, 1, 3));
    var_e8af229da6f05788 = max(3 - var_31cfa03a7e864f49, 0);
    var_415fd8a0dbe8422f = 1.5 / var_8ff174be99bff6d2 + 0.1 * var_e8af229da6f05788 - 0.5;
    var_ebae3ffd14f48d6e = 4.5 / var_8ff174be99bff6d2 + 0.2 * var_e8af229da6f05788 - 0.5;
    waveinterval = var_415fd8a0dbe8422f + (var_ebae3ffd14f48d6e - var_415fd8a0dbe8422f) * (1 - var_b4a0bb985e832edf);
    waittime = waveinterval + level.var_6d298bb3b2c8bf0;
    if (!isdefined(waittime)) {
        waittime = 2;
    }
    return waittime;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x306b
// Size: 0x34
function function_dd8885eb3cf2a013(requestid, userdata) {
    if (flag("stop_lightbomb_zombies") || flag("entity_defeated")) {
        return true;
    }
    return false;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x30a8
// Size: 0x3a
function function_3fc9d7352c4d0d8f(requestid, var_11d1110a1c76035a, zombie, ai_data) {
    zombie function_65cdab0fc78aba8f(var_11d1110a1c76035a.origin, 1920);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30ea
// Size: 0xe5
function function_35460ce5848546aa(params) {
    self function_9322f3cb1cd4111a();
    function_3ab9164ef76940fd("obelisk_vfx", "off");
    var_fd6371771ec8a0b9 = level.var_ad5d9c2f5d7df9b9.origin;
    if (distance2dsquared(self.origin, var_fd6371771ec8a0b9) < 1638400) {
        playfx(getfx("zombie_death"), self.origin);
        if (level.var_f2d34ed1ef9932b2 < level.var_f0a816d0cf9f949e) {
            level.var_f2d34ed1ef9932b2 += getdvarint(@"hash_7caea3d340faf9d0", 1) * 1;
            function_1955c76206169bc4(self.origin + (0, 0, 40), var_fd6371771ec8a0b9 + (0, 0, 170), 0.25);
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31d7
// Size: 0x77
function function_1955c76206169bc4(spawn_origin, goal_position, var_6feb1183955c97a0) {
    var_6feb1183955c97a0 = utility::default_to(var_6feb1183955c97a0, 0);
    trail = utility::spawn_model("tag_origin", spawn_origin);
    trail.goal_position = goal_position;
    playfxontag(getfx("zombie_soul"), trail, "tag_origin");
    trail thread function_e1564df8c754fbd3(var_6feb1183955c97a0);
    trail playsound("evt_ai_jansen_lightbomb_soul_gather_death");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3256
// Size: 0xae
function function_e1564df8c754fbd3(var_6feb1183955c97a0) {
    self endon("death");
    level endon("game_ended");
    self playsound("evt_ob_rr_obelisk_soul_spawn");
    self playloopsound("evt_ob_rr_obelisk_soul_lp");
    if (var_6feb1183955c97a0 > 0) {
        wait var_6feb1183955c97a0;
    }
    self moveto(self.goal_position, 0.8, 0.2);
    self waittill("movedone");
    playfx(getfx("zombie_soul_impact"), self.goal_position);
    killfxontag(getfx("zombie_soul"), self, "tag_origin");
    playsoundatpos(self.origin, "evt_ob_rr_obelisk_soul_impact");
    function_c405adbb787d14e0();
    self delete();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x330c
// Size: 0xa1
function function_c405adbb787d14e0() {
    var_c94e551e37ac5b3 = min(level.var_f2d34ed1ef9932b2 / level.var_f0a816d0cf9f949e, 1);
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_progress_bar", int(var_c94e551e37ac5b3 * 100));
    }
    if (var_c94e551e37ac5b3 >= 1) {
        level.var_ad5d9c2f5d7df9b9 function_f6edc2a8de195f9d();
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33b5
// Size: 0x100
function function_88bbdcf6389f97b6(var_d3b289facfea28ff) {
    explosionzombies = getaiarrayinradius(var_d3b289facfea28ff, 1600, "team_two_hundred");
    foreach (zombie in explosionzombies) {
        if (isalive(zombie)) {
            zombie function_3ab9164ef76940fd("obelisk_vfx", "off");
            zombie kill();
            corpse = zombie getcorpseentity();
            if (isdefined(corpse)) {
                var_a33d2a2c3ffecb81 = corpse.origin - var_d3b289facfea28ff + (0, 0, 60);
                var_83fd98f3ac829176 = max(500 - distance2d(corpse.origin, var_d3b289facfea28ff), 0) / 4;
                corpse startragdollfromimpact("torso_upper", var_a33d2a2c3ffecb81 * var_83fd98f3ac829176);
            }
        }
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34bd
// Size: 0x16c
function function_f6edc2a8de195f9d() {
    if (level.var_31cfa03a7e864f49 < 3) {
        level.var_31cfa03a7e864f49++;
    }
    level.var_62e6cd77567f71b9 = 0;
    level.var_f2d34ed1ef9932b2 = 0;
    level callback::remove("on_ai_killed", &function_35460ce5848546aa);
    level callback::remove("player_laststand", &function_c87db1eca7d00763);
    var_d3b289facfea28ff = self.origin;
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_progress_bar", 0);
    }
    flag_set("stop_lightbomb_zombies");
    waitframe();
    function_88bbdcf6389f97b6(var_d3b289facfea28ff);
    if (isdefined(self.var_eeedaa69c3d8a6d5)) {
        function_4b7d420e1bad897f(self.var_eeedaa69c3d8a6d5, level.var_25a729512e633df2[self.var_eeedaa69c3d8a6d5].aicount);
    }
    if (isdefined(level.var_db4f032e4875e23a)) {
        level.var_db4f032e4875e23a callback::callback("entity_boss_lightbomb_completed");
    }
    waitframe();
    flag_set("entity_phase_02_lightbomb_charged");
    function_45b8b7da9ab11092();
    flag_wait("throw_lightbomb");
    thread throw_lightbomb(var_d3b289facfea28ff);
    flag_wait("orb_destroyed");
    function_88bbdcf6389f97b6(var_d3b289facfea28ff);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3631
// Size: 0xb3
function throw_lightbomb(var_c2d35eda877c6b2c) {
    level endon("game_ended");
    self notify("throw_lightbomb");
    self endon("throw_lightbomb");
    thread function_6286d85f8a5d2858();
    flag_wait("orb_destroyed");
    if (isdefined(level.var_db4f032e4875e23a)) {
        level.var_db4f032e4875e23a callback::callback("entity_boss_throw_lightbomb");
    }
    flag_clear("throw_lightbomb");
    flag_clear("orb_destroyed");
    level.var_db4f032e4875e23a ent_flag_wait("entity_vulnerable");
    level.var_db4f032e4875e23a ent_flag_wait("entity_not_vulnerable");
    level.var_644d2d519cd520be = "";
    flag_clear("stop_lightbomb_zombies");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x36ec
// Size: 0x80
function private function_1548c956a38e88ec(target, bone, endnotify) {
    if (!isdefined(self.var_630fe06d3b5faee6) && isdefined(target)) {
        self.var_630fe06d3b5faee6 = spawn("script_model", target gettagorigin(bone));
        self.var_630fe06d3b5faee6 setmodel("tag_origin");
        self.var_630fe06d3b5faee6 linkto(target, bone);
        thread function_5ee1730c2e122134(self.var_630fe06d3b5faee6, endnotify);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3774
// Size: 0x92
function private function_45b8b7da9ab11092() {
    function_1548c956a38e88ec(level.var_db4f032e4875e23a, "tag_vfx_dmg_mid_chest", "lightbomb_beam_end");
    direction = vectornormalize(self.var_630fe06d3b5faee6.origin - self.vfxorigin);
    var_903fdc9e417d21f6 = spawnfx(getfx("abom_mega_beam_tip_fx"), self.vfxorigin, direction);
    if (isdefined(var_903fdc9e417d21f6)) {
        triggerfx(var_903fdc9e417d21f6);
        var_903fdc9e417d21f6 function_cea710f9d017694a(1);
        thread function_5ee1730c2e122134(var_903fdc9e417d21f6, "lightbomb_beam_origin_end");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x380e
// Size: 0x75
function private function_9a195e28df161379(scriptmodel) {
    direction = vectornormalize(self.vfxorigin - scriptmodel.origin);
    var_a308f283d2cf5c4c = playfxontag(getfx("abom_mega_beam_hit_fx"), scriptmodel, "tag_origin");
    if (isdefined(var_a308f283d2cf5c4c)) {
        triggerfx(var_a308f283d2cf5c4c);
        var_a308f283d2cf5c4c function_cea710f9d017694a(1);
        thread function_5ee1730c2e122134(var_a308f283d2cf5c4c, "lightbomb_beam_end");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x388b
// Size: 0x30d
function function_6286d85f8a5d2858() {
    level endon("game_ended");
    if (isdefined(level.var_db4f032e4875e23a)) {
        level.var_db4f032e4875e23a endon("death");
        level.var_db4f032e4875e23a endon("Entity_Death_Starting");
    }
    self.var_7fb15984f4f0a480 = utility::spawn_model("tag_origin", self.vfxorigin, (0, 0, 0));
    thread function_5ee1730c2e122134(self.var_7fb15984f4f0a480, "lightbomb_beam_end");
    if (!isdefined(self.targetent)) {
        self.targetent = utility::spawn_model("tag_origin", self.vfxorigin, (0, 0, 0));
        thread function_5ee1730c2e122134(self.targetent, "lightbomb_beam_end");
    }
    function_1548c956a38e88ec(level.var_db4f032e4875e23a, "tag_vfx_dmg_mid_chest", "lightbomb_beam_end");
    self.beamvfx = playfxontagsbetweenclients(getfx("lightbomb_beam_fx"), self.var_7fb15984f4f0a480, "tag_origin", self.targetent, "tag_origin");
    if (isdefined(self.beamvfx)) {
        self.beamvfx function_cea710f9d017694a(1);
        thread function_5ee1730c2e122134(self.beamvfx, "lightbomb_beam_end");
        starttime = gettime();
        var_46809cd706f6f4d6 = 750;
        var_1087015a8b17a32a = self.var_7fb15984f4f0a480.origin;
        while (true) {
            currenttime = gettime();
            timediff = currenttime - starttime;
            var_28cb541c5cee16ab = self.var_630fe06d3b5faee6.origin;
            var_f90fc4432c850665 = vectorlerp(var_1087015a8b17a32a, var_28cb541c5cee16ab, timediff / var_46809cd706f6f4d6);
            self.targetent.origin = var_f90fc4432c850665;
            waitframe();
            if (timediff / var_46809cd706f6f4d6 >= 1) {
                break;
            }
        }
        function_9a195e28df161379(self.targetent);
        wait 0.5;
        self notify("lightbomb_beam_origin_end");
        self.var_3d46bbaedc22240a setscriptablepartstate("body", "done");
        self.var_69e6b818ca7c77c9 setscriptablepartstate("beam", "off");
        level.var_db4f032e4875e23a playsound("evt_ai_jansen_lightbomb_entity_explo");
        level.var_db4f032e4875e23a ent_flag_set("entity_lightbomb_hit");
        starttime = gettime();
        while (true) {
            currenttime = gettime();
            timediff = currenttime - starttime;
            var_28cb541c5cee16ab = self.var_630fe06d3b5faee6.origin;
            self.targetent.origin = self.var_630fe06d3b5faee6.origin;
            var_f90fc4432c850665 = vectorlerp(var_1087015a8b17a32a, var_28cb541c5cee16ab, timediff / var_46809cd706f6f4d6);
            self.var_7fb15984f4f0a480.origin = var_f90fc4432c850665;
            waitframe();
            if (timediff / var_46809cd706f6f4d6 >= 1) {
                break;
            }
        }
        self notify("lightbomb_beam_end");
    }
    flag_set("orb_destroyed");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ba0
// Size: 0x1fe
function function_3546f2dacbfd6d45() {
    index = 0;
    self.var_a88cf56769e54b8c = self.origin;
    self.orb = spawnscriptable("jup_zm_rift_orb", self.origin + (0, 0, 170));
    self.orb.move_to_point = spawn("script_model", self.orb.origin);
    self.orb.move_to_point setmodel("tag_origin");
    self.orb.move = spawn("script_model", self.orb.origin);
    self.orb.move setmodel("jup_zm_harvester_orb_invisible");
    self.orb utility::function_6e506f39f121ea8a(self.orb.move);
    self.orb.end_point = level.var_db4f032e4875e23a.origin + (0, 0, 1024);
    self.orb.var_b36f416ea2901969 = 128;
    self.orb.var_4b277984303eb7df = 96;
    self.orb.movespeed = 512;
    wait 0.1;
    self.orb setscriptablepartstate("audio_loop", "on");
    self.orb setscriptablepartstate("orb_vfx", "idle");
    self.orb setscriptablepartstate("orb_trail_vfx", "on");
    flag_wait("throw_lightbomb");
    self.orb function_d1097fde26527288(index);
    flag_wait("orb_destroyed");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3da6
// Size: 0xc2
function function_d1097fde26527288(index) {
    level endon("game_ended");
    self endon("orb_destroyed");
    traveltime = function_4109edaf4da7c260(self.origin, self.end_point, self.movespeed * 2);
    self.move playsoundonmovingent("ob_entity_orb_movement");
    self.move moveto(self.end_point, traveltime);
    self.currentpoint = self.end_point;
    self.movespeed = 512;
    wait traveltime;
    self setscriptablepartstate("orb_vfx", "destroy");
    flag_set("orb_destroyed");
    self.move delete();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e70
// Size: 0x31
function function_4109edaf4da7c260(startpos, endpos, movespeed) {
    movetime = distance(startpos, endpos) / movespeed;
    return movetime;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3eaa
// Size: 0x52
function private function_54e48fcfe13a22ad(params) {
    function_2f710ce06e18d447(self.entitydata.spawnlocation);
    if (!istrue(self.var_4e54c3ab5875f278.var_9267ed46ecdf37c5)) {
        self.var_4e54c3ab5875f278.var_9267ed46ecdf37c5 = 1;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3f04
// Size: 0x25
function private function_4a16b80442a45f66(params) {
    function_ca39bf5d30808a2(self.entitydata.spawnlocation);
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3f31
// Size: 0x81
function private function_ca39bf5d30808a2(positionindex) {
    if (!isdefined(positionindex)) {
        return;
    }
    switch (positionindex) {
    case 0:
        function_7b292e2041de06e3();
        break;
    case 1:
        function_7b292f2041de0916();
        break;
    case 2:
        function_7b29302041de0b49();
        break;
    case 3:
        function_7b29312041de0d7c();
        break;
    default:
        break;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3fba
// Size: 0x87
function private function_2f710ce06e18d447(positionindex) {
    if (!isdefined(positionindex)) {
        function_5f9fa5db9197d79b();
    }
    switch (positionindex) {
    case 0:
        function_558b781842a5f957();
        break;
    case 1:
        function_558b791842a5fb8a();
        break;
    case 2:
        function_558b7a1842a5fdbd();
        break;
    case 3:
        function_558b731842a5ee58();
        break;
    default:
        break;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4049
// Size: 0xc5
function private function_159acdf8d431fa01() {
    level endon("game_ended");
    level endon("entity_defeated");
    var_188600927dd732e2 = getstructarray("beat_04_amb_vfx", "script_noteworthy");
    foreach (struct in var_188600927dd732e2) {
        structname = struct.targetname;
        level.var_bf336ada1101f604[structname] = struct;
        level.var_bf336ada1101f604[structname].scriptable = spawnscriptable("jup_zm_rift_entity_boss_ambient_vfx", struct.origin);
    }
    level.var_8df5ecdc6687dcda = 0;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4116
// Size: 0xd6
function private function_f35bfeb5ba127255(sparams) {
    level endon("game_ended");
    level endon("entity_defeated");
    health = function_6a493253ff0a74bd();
    maxhealth = function_539a480132aefe25();
    if (health <= maxhealth * 0.75 && level.var_8df5ecdc6687dcda == 0) {
        exploder("beat_04_amb_vfx_stage_01");
        level.var_8df5ecdc6687dcda = 1;
        return;
    }
    if (health <= maxhealth * 0.5 && level.var_8df5ecdc6687dcda == 1) {
        exploder("beat_04_amb_vfx_stage_02");
        level.var_8df5ecdc6687dcda = 2;
        return;
    }
    if (health <= maxhealth * 0.25 && level.var_8df5ecdc6687dcda == 2) {
        exploder("beat_04_amb_vfx_stage_03");
        level.var_8df5ecdc6687dcda = 3;
        return;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x41f4
// Size: 0x26
function private function_48a5fa56f9aebad9() {
    stop_exploder("beat_04_amb_vfx_stage_01");
    stop_exploder("beat_04_amb_vfx_stage_02");
    stop_exploder("beat_04_amb_vfx_stage_03");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4222
// Size: 0x103
function private function_8903bf90630bd772() {
    level endon("game_ended");
    self endon("death");
    self endon("fake_death");
    rumblestruct = getstruct("beat_04_jansen_cleanserelic_animnode", "targetname");
    var_bc4fedabd73e1ca5 = level waittill_any_return_2("entity_intro_earthquake", "entity_phase_02_scream_earthquake_01");
    if (var_bc4fedabd73e1ca5 == "entity_intro_earthquake") {
        earthquake(0.3, 3, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_scream_phase_01", rumblestruct.origin);
        return;
    }
    if (var_bc4fedabd73e1ca5 == "entity_phase_02_scream_earthquake_01") {
        earthquake(0.2, 3.5, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_scream_phase_02_01", rumblestruct.origin);
        level waittill("entity_phase_02_scream_earthquake_02");
        earthquake(0.3, 4, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_scream_phase_02_02", rumblestruct.origin);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x432d
// Size: 0x153
function private function_33331be1f0728f19() {
    level endon("game_ended");
    level endon("entity_defeated");
    self endon("death");
    var_e1d24a7bbd26f0 = level waittill_any_return_2("entity_phase_01_death_scream_01", "entity_phase_02_death_scream_01");
    if (var_e1d24a7bbd26f0 == "entity_phase_01_death_scream_01") {
        earthquake(0.2, 1, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_death_scream_01", self.origin);
        level waittill("entity_phase_01_death_scream_02");
        earthquake(0.3, 1.5, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_death_scream_01", self.origin);
        return;
    }
    if (var_e1d24a7bbd26f0 == "entity_phase_02_death_scream_01") {
        earthquake(0.2, 1.5, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_death_scream_01", self.origin);
        level waittill("entity_phase_02_death_scream_02");
        earthquake(0.25, 2, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_death_scream_02", self.origin);
        level waittill("entity_phase_02_death_explosion");
        earthquake(0.3, 2, self.origin, 30000);
        playrumbleonposition("jup_ob_s5_entity_death_explosion_01", self.origin);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4488
// Size: 0x12
function function_f0c3d97d3267bb99() {
    thread EntityBoss_ArenaArrivalMonitor();
    thread EntityBoss_BeamSubmixMonitor();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44a2
// Size: 0xe
function function_ee2610f7b788365() {
    flag_set("entity_beam_submix_start");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44b8
// Size: 0xe
function function_47c10ac7b6912dde() {
    flag_set("entity_arena_arrive");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44ce
// Size: 0x15
function function_3b61dc2fc60b81d7() {
    thread EntityBoss_SFX_ClearDefaultSubmix();
    setmusicstate("ob_underscore");
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x44eb
// Size: 0x42
function private EntityBoss_SetupBossStartAudio() {
    level endon("game_ended");
    self endon("death");
    self endon("fake_death");
    self notify("EntityBoss_SetupBossStartAudio");
    self endon("EntityBoss_SetupBossStartAudio");
    flag_wait("entity_spawned");
    childthread function_3a58c9c581f341e();
    childthread function_549280d231631b51();
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4535
// Size: 0x3f
function private EntityBoss_ArenaArrivalMonitor() {
    level endon("game_ended");
    self notify("EntityBoss_ArenaArrivalMonitor");
    self endon("EntityBoss_ArenaArrivalMonitor");
    while (true) {
        flag_wait("entity_arena_arrive");
        function_bdb7ef8622092c9a();
        flag_clear("entity_arena_arrive");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x457c
// Size: 0x3f
function private EntityBoss_BeamSubmixMonitor() {
    level endon("game_ended");
    self notify("EntityBoss_BeamSubmixMonitor");
    self endon("EntityBoss_BeamSubmixMonitor");
    while (true) {
        flag_wait("entity_beam_submix_start");
        function_ca31eed77070670b();
        flag_clear("entity_beam_submix_start");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x45c3
// Size: 0x5a
function private function_549280d231631b51() {
    foreach (player in level.players) {
        player setsoundsubmix("jup_ob_s5_entity_boss_fight");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4625
// Size: 0x70
function private EntityBoss_SFX_ClearDefaultSubmix() {
    level endon("game_ended");
    self notify("EntityBoss_SFX_ClearDefaultSubmix");
    self endon("EntityBoss_SFX_ClearDefaultSubmix");
    foreach (player in level.players) {
        player clearsoundsubmix("jup_ob_s5_entity_boss_fight");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x469d
// Size: 0x5a
function private function_ca31eed77070670b() {
    foreach (player in level.players) {
        player setsoundsubmix("jup_ob_entity_beam_reduce");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x46ff
// Size: 0x5a
function private function_3a58c9c581f341e() {
    foreach (player in level.players) {
        player clearsoundsubmix("jup_ob_entity_beam_reduce");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4761
// Size: 0x5a
function private function_bdb7ef8622092c9a() {
    foreach (player in level.players) {
        player playlocalsound("evt_ob_entity_arena_arrive_stinger");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47c3
// Size: 0x9f
function function_9bbc5dc3c5041320() {
    level.var_a71f33e89f5cc14b = &function_3e3ed60bca3347c1;
    level.var_c618a44ce790e386 = &function_ed3db891980e83e8;
    level.var_395ecc56eeec7045 = &function_4cc0b7ef9c88cffe;
    level.var_f057eaa585cd99c5 = &function_a6a8edd868f1b3d6;
    level.var_ac59490b47d635b6 = &function_38400c8c7558d015;
    foreach (player in level.players) {
        player.var_1d9b646d4823feea = undefined;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x486a
// Size: 0x1e5
function function_a6a8edd868f1b3d6() {
    self endon("death");
    level endon("game_ended");
    self.var_1e0eb63ecb3f1e2 = 0;
    ent_flag_wait("entity_spawnanim_finished");
    while (function_6a493253ff0a74bd() >= 0) {
        if (isdefined(level.var_a71f33e89f5cc14b) && isdefined(level.var_c618a44ce790e386)) {
            foreach (player in level.players) {
                if (istrue(player.var_9d8c3db9f8241188)) {
                    continue;
                }
                if (istrue(player.var_7263836b2a3f8641)) {
                    if (function_d58d9fad4c55a9b8(player)) {
                        spectatingplayer = player getspectatingplayer();
                        if (!isdefined(spectatingplayer) || spectatingplayer == player) {
                            player [[ level.var_c618a44ce790e386 ]]();
                            continue;
                        } else {
                            player.var_7263836b2a3f8641 = 0;
                        }
                    } else {
                        continue;
                    }
                }
                if (isalive(player)) {
                    if (!isdefined(player.var_1d9b646d4823feea)) {
                        player.var_1d9b646d4823feea = function_6a493253ff0a74bd();
                    }
                    if (player.var_1d9b646d4823feea <= 0) {
                        continue;
                    }
                    if (distance2dsquared(self.origin, player.origin) < 256000000) {
                        if (isdefined(self.zombieaisettings.var_e58a65b7a8f5973c.bosshealthbar)) {
                            player [[ level.var_a71f33e89f5cc14b ]](self.zombieaisettings.var_e58a65b7a8f5973c.bosshealthbar, self);
                        }
                    } else {
                        player [[ level.var_c618a44ce790e386 ]]();
                    }
                    continue;
                }
                player [[ level.var_c618a44ce790e386 ]]();
            }
        }
        waittill_any_timeout_1(2, "damaged_recently");
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4a57
// Size: 0x12f
function private function_3e3ed60bca3347c1(var_8c55111e0c85f768, var_35b6397afde1bae7) {
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
        health = var_35b6397afde1bae7 function_6a493253ff0a74bd();
        maxhealth = var_35b6397afde1bae7 function_539a480132aefe25();
        function_4cc0b7ef9c88cffe(health, maxhealth);
        invulnerable = 0;
        if (var_35b6397afde1bae7 ent_flag("entity_not_vulnerable")) {
            invulnerable = 1;
        }
        function_eae49fe605d1ae07(invulnerable);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8e
// Size: 0x7d
function function_59467b7569ee98ab() {
    foreach (player in level.players) {
        if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(player)) {
            level.var_15f48d5838e26ba0 zmbosshealthbar::close(player);
        }
        player.var_1d9b646d4823feea = undefined;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4c13
// Size: 0x26
function private function_ed3db891980e83e8() {
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        level.var_15f48d5838e26ba0 zmbosshealthbar::close(self);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c41
// Size: 0x30
function private function_eae49fe605d1ae07(enabled) {
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        level.var_15f48d5838e26ba0 zmbosshealthbar::function_205b1b924ed09c63(self, enabled);
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4c79
// Size: 0xa2
function private function_4cc0b7ef9c88cffe(health, maxhealth) {
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

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4d23
// Size: 0x63
function private function_38400c8c7558d015(health) {
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

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4d8e
// Size: 0x48
function private function_1e1bc1b8c9a34a3(params) {
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        level.var_15f48d5838e26ba0 zmbosshealthbar::close(self);
        self function_60b58156b10af556();
    }
    function_b4f01be2fbe86632();
    self.var_9d8c3db9f8241188 = 1;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4dde
// Size: 0x1b
function private function_7b0b4cc4d84856d(params) {
    if (function_ec7f0a063aba255f()) {
        function_831db2f37b895418();
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4e01
// Size: 0x22
function private function_78cbdc873439af6b(params) {
    if (istrue(self.var_7263836b2a3f8641)) {
        self.var_7263836b2a3f8641 = 0;
    }
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e2b
// Size: 0x38
function private function_831db2f37b895418() {
    if (level.var_15f48d5838e26ba0 zmbosshealthbar::is_open(self)) {
        level.var_15f48d5838e26ba0 zmbosshealthbar::close(self);
        self function_60b58156b10af556();
    }
    self.var_7263836b2a3f8641 = 1;
}

// Namespace namespace_6ace6c3e1e794ef6 / namespace_5cd4e41e27cb1308
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e6b
// Size: 0x3b
function private function_ec7f0a063aba255f() {
    if (istrue(self.inlaststand) && isdefined(self.timeuntilbleedout) && self.timeuntilbleedout < 1 && !getbeingrevivedinternal()) {
        return true;
    }
    return false;
}

