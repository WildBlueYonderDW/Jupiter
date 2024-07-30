#using script_89c4e8e66e8a360;
#using script_2f981f68661d5e1a;
#using script_5dfa1fb6b030bdcb;
#using script_32d93a194074fa6a;
#using script_47a7dd805c87b33f;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_fbc22dc6f2271b4;

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0x1e
function function_77b897f7716b8ff8(firingtargets) {
    function_a9984444514ff39a();
    wait 2;
    thread function_a587d9fffed95ccf(firingtargets);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c
// Size: 0xc6
function function_a9984444514ff39a() {
    flag_init("ftue_player_walked");
    flag_init("ftue_player_sprinted");
    flag_init("ftue_player_tactial_sprinted");
    flag_init("ftue_player_auto_sprinted");
    flag_init("ftue_player_moved_camera");
    flag_init("ftue_player_moved_camera_and_walked");
    flag_init("ftue_player_gas_minimap");
    thread function_33749fefab503510(getdvarint(@"hash_ee469d27e4289247", 2));
    thread function_348924356f8bad24();
    thread function_d4a746782d28e9ad();
    thread function_4cf7b50740f57f7b();
    thread function_105bd25b72f6ea55(getdvarint(@"hash_662138da96c93838", 90));
    thread function_4f94f7b207e54b3f(getdvarint(@"hash_23cd75bde42da8fa", 2), getdvarint(@"hash_687f1b162dc45a02", 90));
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31a
// Size: 0x18d
function function_a587d9fffed95ccf(firingtargets) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("ftue_completed");
    function_88c0dc3a363b9d3(getdvarint(@"hash_d97115f3374e6f10", 2), &function_a68431a04c04726a, &function_f586b8896b2759b3);
    flag_wait("ftue_player_walked");
    function_7fd621b8ba80e652();
    function_916ba40ea734f75a(getdvarint(@"hash_6ecd83ec95c61773", 2), &function_6b645084fae7a31d, &function_8043b1f8506098);
    flag_wait("ftue_player_sprinted");
    function_7fd621b8ba80e652();
    function_9b8b2a6fd4a868b(getdvarint(@"hash_c211b7f4a4014a19", 2), &function_87f2199e3e30690a, &function_bf9901ce62634b7b);
    flag_wait("ftue_player_tactial_sprinted");
    function_7fd621b8ba80e652();
    function_1fbdad041cade585(getdvarint(@"hash_ac9065e141511f57", 2), &function_9190de7599424864, &function_f4173cc2bd202aa5);
    flag_wait("ftue_player_auto_sprinted");
    function_7fd621b8ba80e652();
    function_44f78ee91dcbe658(getdvarint(@"hash_25b38d4a50722d1a", 2), &function_d8acf8fde84000d7, &function_e8a74242053642aa);
    flag_wait("ftue_player_moved_camera");
    function_7fd621b8ba80e652();
    function_d5254a5df1ead52d(getdvarint(@"hash_ee37365ae1bbdbb6", 2), &function_ddf68434578cbc75, &function_82852a9b4b43a5a8);
    flag_wait("ftue_player_moved_camera_and_walked");
    function_7fd621b8ba80e652();
    function_fa5e2cb288f43afb(firingtargets);
    flag_wait("ftue_player_fired");
    function_7fd621b8ba80e652();
    function_9e0151baa208fe9e(#"hash_832d3da8b0e1bea7", 5);
    self notify("ftue_completed");
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4af
// Size: 0x26
function function_88c0dc3a363b9d3(var_2ca8d0a52885d908, positivecallback, negativecallback) {
    thread function_7c4b6588a387e2d5(var_2ca8d0a52885d908, positivecallback, negativecallback);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd
// Size: 0x17
function function_a68431a04c04726a(player) {
    flag_set("ftue_player_walked");
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4fc
// Size: 0x1e
function function_f586b8896b2759b3(player) {
    player function_9e0151baa208fe9e(#"walkTip", 5);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x522
// Size: 0x26
function function_916ba40ea734f75a(var_2ca8d0a52885d908, positivecallback, negativecallback) {
    thread function_ee0f48a23c219539(var_2ca8d0a52885d908, positivecallback, negativecallback);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x550
// Size: 0x17
function function_6b645084fae7a31d(player) {
    flag_set("ftue_player_sprinted");
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56f
// Size: 0x1e
function function_8043b1f8506098(player) {
    player function_9e0151baa208fe9e(#"sprinttip", 5);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x595
// Size: 0x26
function function_9b8b2a6fd4a868b(var_2ca8d0a52885d908, positivecallback, negativecallback) {
    thread function_4dfbc95b23a556f4(var_2ca8d0a52885d908, positivecallback, negativecallback);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3
// Size: 0x1e
function function_bf9901ce62634b7b(player) {
    player function_9e0151baa208fe9e(#"hash_e3b4235c0ca36fd5", 5);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e9
// Size: 0x17
function function_87f2199e3e30690a(player) {
    flag_set("ftue_player_tactial_sprinted");
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x608
// Size: 0x26
function function_1fbdad041cade585(var_2ca8d0a52885d908, positivecallback, negativecallback) {
    thread function_768aaa759077df62(var_2ca8d0a52885d908, positivecallback, negativecallback);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x636
// Size: 0x1e
function function_f4173cc2bd202aa5(player) {
    player function_9e0151baa208fe9e(#"hash_b225d2992d771e07", 5);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65c
// Size: 0x17
function function_9190de7599424864(player) {
    flag_set("ftue_player_auto_sprinted");
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x67b
// Size: 0x26
function function_44f78ee91dcbe658(var_2ca8d0a52885d908, positivecallback, negativecallback) {
    thread function_e58bb74ec5f54731(var_2ca8d0a52885d908, positivecallback, negativecallback);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a9
// Size: 0x1e
function function_e8a74242053642aa(player) {
    player function_9e0151baa208fe9e(#"hash_3d6c462c919908fc", 5);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6cf
// Size: 0x17
function function_d8acf8fde84000d7(player) {
    flag_set("ftue_player_moved_camera");
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6ee
// Size: 0x26
function function_d5254a5df1ead52d(var_2ca8d0a52885d908, positivecallback, negativecallback) {
    thread function_e7a33bfb4cba7633(var_2ca8d0a52885d908, positivecallback, negativecallback);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x71c
// Size: 0x1e
function function_82852a9b4b43a5a8(player) {
    player function_9e0151baa208fe9e(#"hash_9d2c341d798189a", 5);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x742
// Size: 0x17
function function_ddf68434578cbc75(player) {
    flag_set("ftue_player_moved_camera_and_walked");
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x761
// Size: 0x84
function function_fa5e2cb288f43afb(firingtargets) {
    function_9e0151baa208fe9e(#"hash_fb30dff35889cbbf", 5);
    self.targetcount = firingtargets.size;
    foreach (target in firingtargets) {
        target function_6b3a1552a79f4cff(self, 0, &function_b8d2cfca22b74498);
        target setcandamage(1);
    }
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7ed
// Size: 0x52
function function_6b3a1552a79f4cff(player, var_a519a2a30c26b6da, damagecallback) {
    objectivelabel = var_a519a2a30c26b6da ? %FTUE_MOBILE/SHOOT_ADS_TEST : %FTUE_MOBILE/SHOOT_TEST;
    function_70e0de6281199e7(self, objectivelabel, "icon_waypoint_objective_general", 5);
    function_1efd3ef097bc71ef(player, var_a519a2a30c26b6da, damagecallback);
}

// Namespace namespace_fbc22dc6f2271b4 / namespace_edbfe2ac1e82e56f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x847
// Size: 0x6f
function function_b8d2cfca22b74498(player) {
    if (!isdefined(player.firedshots)) {
        player.firedshots = 0;
    }
    function_b30874d13004d4c5(self);
    player.firedshots += 1;
    if (player.firedshots == player.targetcount) {
        flag_set("ftue_player_fired");
    }
}

