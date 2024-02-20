// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using script_4a852353eb9522f6;
#using script_4f2ec5e36fe18c11;
#using script_54e6d1e4fb728cb8;
#using script_89c4e8e66e8a360;
#using script_5a37c8d34c31ea89;
#using script_53fe1a91461cecb9;
#using script_3d3a4f9a13038759;
#using script_2f981f68661d5e1a;
#using script_5dfa1fb6b030bdcb;
#using script_35ee5e2cef30eea2;
#using script_6981400abfcd765c;
#using script_79b958000e312a8;
#using script_32d93a194074fa6a;
#using script_47a7dd805c87b33f;
#using script_27af1dac0930f28e;
#using script_781de0ee4cd5153;
#using scripts\mp\teams.gsc;
#using script_2669878cf5a1b6bc;

#namespace namespace_4916c580915e64ba;

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4e8
// Size: 0x83
function function_326cc1213268415a(message, time, var_3d39b8e45c2ae4d6, var_3d39b9e45c2ae709) {
    /#
        if (!isdefined(time)) {
            time = 2;
        }
        if (!isdefined(var_3d39b8e45c2ae4d6)) {
            var_3d39b8e45c2ae4d6 = 10;
        }
        if (!isdefined(var_3d39b9e45c2ae709)) {
            var_3d39b9e45c2ae709 = 200;
        }
        if (isdefined(message)) {
            starttime = gettime();
            while (gettime() - starttime <= time * 1000) {
                printtoscreen2d(var_3d39b8e45c2ae4d6, var_3d39b9e45c2ae709, message, (1, 1, 1), 2);
                waitframe();
            }
        }
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x572
// Size: 0x421
function function_56ddff8548c968d6() {
    while (!isdefined(level.players)) {
        waitframe();
    }
    while (!isdefined(level.players[0])) {
        waitframe();
    }
    level.player = level.players[0];
    while (level.player.sessionstate == "spectator" || level.player.sessionstate == "intermission") {
        waitframe();
    }
    level.player setsoundsubmix("fade_to_black_all_except_music", 0, 1);
    level.player setclientomnvar("ui_br_extended_load_screen", 1);
    level.player function_670863fc4008c3d8(level.var_dbf4d97004e64bd5.var_3d84eef8b3afe5eb);
    while (!level.player isadditionalstreamposready()) {
        waitframe();
    }
    level.player function_e4a38a7c9732f011("autoGrabWeapons", 0);
    level.player function_e4a38a7c9732f011("toggleADSEnabledTouch", 1);
    level.player function_e4a38a7c9732f011("autoFireTouch", 0);
    vehicle_allowplayeruse(level.player, 0);
    level.player skydive_interrupt();
    level.player function_67d00e6b876c5ee2(level.var_dbf4d97004e64bd5.var_3d84eef8b3afe5eb, level.var_dbf4d97004e64bd5.var_9d94e563e4be46b8);
    level.player namespace_6d8da2b47f878104::createoperatorcustomization(level.var_dbf4d97004e64bd5.var_56e53e400a2d0f31[0], level.var_dbf4d97004e64bd5.var_56e53e400a2d0f31[1]);
    level.player takeallweapons();
    startingweapon = namespace_e0ee43ef2dddadaa::buildweapon(level.var_dbf4d97004e64bd5.var_1176926a4b469eac, undefined, undefined, undefined, -1, undefined, undefined, undefined, 0);
    level.player giveweapon(startingweapon);
    level.player switchtoweapon(startingweapon);
    level.player allowfire(0);
    if (level.var_dbf4d97004e64bd5.var_6de4e8c345415ade) {
        function_e27c8ead6ab015fa(level.var_dbf4d97004e64bd5.walls);
    }
    if (level.var_dbf4d97004e64bd5.var_74f9d8bedfda6770) {
        function_ce9d634e565ef6de(level.var_dbf4d97004e64bd5.vehicles);
    }
    if (level.var_dbf4d97004e64bd5.var_9572c127e918050c) {
        function_de1acb2ec7807e38();
    }
    if (level.var_dbf4d97004e64bd5.var_212875d77b9905f5) {
        function_9813640fb9b49e46(level.var_dbf4d97004e64bd5.var_c0271a486aa56405);
    }
    if (level.var_dbf4d97004e64bd5.var_df53369f451f4139) {
        function_9813640fb9b49e46(level.var_dbf4d97004e64bd5.var_395082021dfc3ae9);
    }
    if (isdefined(level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")].var_e0e1c48a5393d3d1)) {
        level.var_3896bf00e9c5ca00 = level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")].var_e0e1c48a5393d3d1;
    }
    level.player thread function_f83c33a014ee22fe();
    level.player setstance(level.var_dbf4d97004e64bd5.var_396891c2565891d8);
    level.player.armorhealth = 0;
    level.player setclientomnvar("ui_armor_percent", 0);
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 setstance(level.var_dbf4d97004e64bd5.var_8c5da83724fd450b);
    }
    wait(3);
    level.player setclientomnvar("ui_br_extended_load_screen", 0);
    level.player clearadditionalstreampos();
    level.player clearsoundsubmix("fade_to_black_all_except_music", 0);
    function_6481fdd7c2eb7d5c();
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99a
// Size: 0x44
function infilSequence() {
    level.player function_9c8e6a1620edc3b9(#"hash_3d6c462c919908fc");
    level.player freezecontrols(1);
    function_1748039e0a11f61b();
    level.player freezecontrols(0);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e5
// Size: 0xb4
function function_be0865890f99c70e() {
    if (!isdefined(level.var_3896bf00e9c5ca00) || !isdefined(level.var_dbf4d97004e64bd5.var_c0271a486aa56405[function_1823ff50bb28148d("ExecuteBot_1")].var_e0e1c48a5393d3d1)) {
        return;
    }
    level.player function_9c8e6a1620edc3b9(#"hash_3d6c462c919908fc");
    level.var_3896bf00e9c5ca00 function_e333732833f72059("crouch");
    level.var_3896bf00e9c5ca00 function_d780d856d7d110a4(level.var_dbf4d97004e64bd5.var_c0271a486aa56405[function_1823ff50bb28148d("ExecuteBot_1")].var_e0e1c48a5393d3d1, 0.8, "execution_000", &function_687173e2ce46615f);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa0
// Size: 0x18
function function_687173e2ce46615f() {
    level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xabf
// Size: 0xe4
function function_20e6c27a91c3accd() {
    var_4d32aaa310660a55 = level.player usinggamepad();
    if (!var_4d32aaa310660a55 || getdvarint(@"hash_585200eddaebfa78", 1) == 0) {
        return;
    }
    level.player freezecontrols(1);
    var_e9444163ee17c4ac = level.var_dbf4d97004e64bd5.var_744254a0a817ff39;
    var_e9444163ee17c4ac.sound = 0;
    level.player function_9e0151baa208fe9e(#"hash_89c40638d930baa1", var_e9444163ee17c4ac);
    level.player function_9c8e6a1620edc3b9(#"hash_3d6c462c919908fc");
    level.player function_36939d27ae6df257(&function_76e49c16322efa47);
    flag_init("ftue_player_no_controller_popup");
    flag_wait("ftue_player_no_controller_popup");
    level.player freezecontrols(0);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbaa
// Size: 0x1d
function function_76e49c16322efa47(var_c550577b692b6c54) {
    if (isdefined(var_c550577b692b6c54)) {
        flag_set("ftue_player_no_controller_popup");
    }
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbce
// Size: 0x12a
function function_49cab10caac7c6cd() {
    /#
        thread function_326cc1213268415a("TAKE_AMMO_STEP_1", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_3d6c462c919908fc", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"hash_3d6c462c919908fc");
    level.player allowmovement(0);
    level.player allowsprint(0);
    level.player allowjump(0);
    level.player function_105bd25b72f6ea55(level.var_dbf4d97004e64bd5.var_49cab10caac7c6cd.var_d9b20fb7b6b1ceed);
    level.player allowmovement(1);
    level.player allowsprint(1);
    level.player allowjump(1);
    level.player function_f339c5c73d11ea20(#"hash_3d6c462c919908fc", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("FINAL_COMBAT_STEP", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcff
// Size: 0xc7
function function_4d9206a74adb396e() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"walkTip", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"walkTip");
    level.player function_33749fefab503510(level.var_dbf4d97004e64bd5.var_4d9206a74adb396e.var_2975304aa952edef);
    level.player function_f339c5c73d11ea20(#"walkTip", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdcd
// Size: 0xe4
function function_b5799765f0103e33() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_3c784dd3eb7a421f", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"hash_3c784dd3eb7a421f");
    level.player function_4f94f7b207e54b3f(level.var_dbf4d97004e64bd5.var_b5799765f0103e33.var_b4651e34ae901b3e, level.var_dbf4d97004e64bd5.var_b5799765f0103e33.var_d9b20fb7b6b1ceed);
    level.player function_f339c5c73d11ea20(#"hash_3c784dd3eb7a421f", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb8
// Size: 0x37a
function function_91b5b282cb2b18fc(var_c96b95f99b74b4ab) {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    var_25261199a27252e = namespace_3c37cb17ade254d::drop_to_ground((level.var_dbf4d97004e64bd5.var_25261199a27252e.positions[var_c96b95f99b74b4ab][0], level.var_dbf4d97004e64bd5.var_25261199a27252e.positions[var_c96b95f99b74b4ab][1], level.var_dbf4d97004e64bd5.var_25261199a27252e.positions[var_c96b95f99b74b4ab][2] + 50), level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_329c3ac67930d855);
    var_5c9e22ae1ec6cb1b = undefined;
    var_34e326b47a846f0b = "moveToPositionDefaultTip";
    objectivetext = "FTUE_MOBILE/MOVE_TO_POSITION_OBJ";
    switch (var_c96b95f99b74b4ab) {
    case 0:
        var_34e326b47a846f0b = "walkTip";
        if (isdefined(level.var_3896bf00e9c5ca00)) {
            level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
            level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("MOVE_TO_STEP", 0.8);
        }
        break;
    case 1:
        var_34e326b47a846f0b = "moveToPosition2Tip";
        if (isdefined(level.var_3896bf00e9c5ca00)) {
            level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
            level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("ADS_STEP");
        }
        break;
    case 2:
        var_34e326b47a846f0b = "moveToPosition3Tip";
        break;
    case 3:
        if (isdefined(level.var_3896bf00e9c5ca00)) {
            level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
            level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("EXTRACTION_STEP");
        }
        var_34e326b47a846f0b = "moveToPosition4Tip";
        objectivetext = "FTUE_MOBILE/REACH_EXTRACTION_POINT_OBJ";
        break;
    default:
        break;
    }
    level.player function_9c8e6a1620edc3b9(var_34e326b47a846f0b);
    level.player function_9e0151baa208fe9e(var_34e326b47a846f0b, level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    var_5c9e22ae1ec6cb1b = function_e5524fb8509827bf(var_25261199a27252e, objectivetext, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_a800cab3e0c11173, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_4d9bfada768597a1);
    function_191d4de725937c3(var_25261199a27252e, 1.8);
    level.player thread function_87682c85d41c2e13(level.var_dbf4d97004e64bd5.var_25261199a27252e.positions[var_c96b95f99b74b4ab], level.var_dbf4d97004e64bd5.var_75e74a5148c1d441);
    while (!level.player.var_919769d433a608f3) {
        waitframe();
    }
    function_4d03b9ef456d0972(var_5c9e22ae1ec6cb1b);
    thread function_191d4de725937c3((0, 0, 0), 0);
    level.player function_f339c5c73d11ea20(var_34e326b47a846f0b, 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1239
// Size: 0x304
function function_931dc024b9a4425d() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_b3731417d1bf213d", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"hash_b3731417d1bf213d");
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("TAKE_WEAPON_STEP");
    }
    weaponname = level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_c2e05bd1d324f3d3;
    weaponattachments = level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_3e64b0476403507a;
    var_c5be665c35f0dacb = level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_d651012a7700b7e[0];
    var_c5be655c35f0d898 = level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_d651012a7700b7e[1];
    var_e46130a1f1555462 = namespace_3c37cb17ade254d::drop_to_ground((var_c5be665c35f0dacb, var_c5be655c35f0d898, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_329c3ac67930d855));
    var_9cbcd63169ebe6b9 = level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_ed077719222ad193;
    var_d7f262d1696ea41a = function_e5524fb8509827bf(var_e46130a1f1555462 + level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_b4cf16890b8820ed, "FTUE_MOBILE/MOVE_TO_POSITION_OBJ", level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_a800cab3e0c11173, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_4d9bfada768597a1);
    function_191d4de725937c3(var_e46130a1f1555462, 1.8, level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_62a3b08574578b5c);
    level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_b55314bfaef43c59 = function_e6019a2d874f8c36(weaponname, weaponattachments, var_e46130a1f1555462, var_9cbcd63169ebe6b9);
    while (!level.player function_b69898678ed4466d(var_e46130a1f1555462, level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_d2d2c2efeca7f10d, level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_62a3b08574578b5c)) {
        wait(0.5);
    }
    function_4d03b9ef456d0972(var_d7f262d1696ea41a);
    level.player function_f339c5c73d11ea20(#"hash_b3731417d1bf213d", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1544
// Size: 0xfb
function function_6c00d659b72888bf() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_7d89ec3036d059ee", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"hash_7d89ec3036d059ee");
    while (isdefined(level.var_dbf4d97004e64bd5.var_6c00d659b72888bf.var_b55314bfaef43c59)) {
        waitframe();
    }
    level notify("stop_dynamic_mark");
    thread function_191d4de725937c3((0, 0, 0), 0);
    level.player function_f339c5c73d11ea20(#"hash_7d89ec3036d059ee", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    waittime = level.player playviewmodelanim("vm_ar_mike4_inspect_generic");
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1646
// Size: 0xb
function function_e919b21af04165a2() {
    level notify("ftue_weapon_picked_up");
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1658
// Size: 0x227
function function_4b422fdc1b596ef9() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_b300bd6b62343918", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"hash_b300bd6b62343918");
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("TAKE_AMMO_STEP_1", undefined, &function_b157f7093578c486);
    }
    var_f4242b7556f8af91 = level.var_dbf4d97004e64bd5.var_4b422fdc1b596ef9.var_bddb37f38f87a338[0];
    var_f4242a7556f8ad5e = level.var_dbf4d97004e64bd5.var_4b422fdc1b596ef9.var_bddb37f38f87a338[1];
    var_c9f65801a0258b90 = namespace_3c37cb17ade254d::drop_to_ground((var_f4242b7556f8af91, var_f4242a7556f8ad5e, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_329c3ac67930d855));
    var_cdfe671b1f557f44 = function_e5524fb8509827bf(var_c9f65801a0258b90 + level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_b4cf16890b8820ed, "FTUE_MOBILE/PICK_UP_AMMO_OBJ", level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_a800cab3e0c11173, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_4d9bfada768597a1);
    function_191d4de725937c3(var_c9f65801a0258b90, 1.8);
    var_8b46cae7d035a67c = function_40f588e8c075f3a1(var_c9f65801a0258b90);
    while (isdefined(var_8b46cae7d035a67c)) {
        waitframe();
    }
    function_4d03b9ef456d0972(var_cdfe671b1f557f44);
    thread function_191d4de725937c3((0, 0, 0), 0);
    level.player function_f339c5c73d11ea20(#"hash_b300bd6b62343918", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1886
// Size: 0x88
function function_b157f7093578c486() {
    level.var_3896bf00e9c5ca00.var_bc97abf5a86e403f = 0;
    level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("TAKE_AMMO_STEP_2", 0.3);
    level.var_3896bf00e9c5ca00 function_9cd34cbd05a34bf2(level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")].var_e5c38be28345c687["TAKE_AMMO_STEP_2"][1]);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1915
// Size: 0xc4
function function_ee69c387d92c4b38() {
    level.player freezecontrols(1);
    level.player function_9c8e6a1620edc3b9(#"hash_f3f80c8c82f50c9");
    var_e9444163ee17c4ac = level.var_dbf4d97004e64bd5.var_744254a0a817ff39;
    var_e9444163ee17c4ac.sound = 0;
    level.player function_9e0151baa208fe9e(#"hash_f3f80c8c82f50c9", var_e9444163ee17c4ac);
    level.player function_36939d27ae6df257(&function_974735ad95de2ebf);
    level.player function_ae00f22f048a1f57("uin_choosefiremode_appearance");
    flag_init("ftue_player_autofire_popup");
    flag_wait("ftue_player_autofire_popup");
    level.player freezecontrols(0);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19e0
// Size: 0x1d
function function_974735ad95de2ebf(var_c550577b692b6c54) {
    if (isdefined(var_c550577b692b6c54)) {
        flag_set("ftue_player_autofire_popup");
    }
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a04
// Size: 0x18a
function function_b6001ea887635de4(var_ded14ae1ea8c4446) {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_5b8855e71e410176", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player allowfire(1);
    level.player thread function_a074c3f0d66ba8e0();
    level.player function_e4a38a7c9732f011("autoFireTouch", 0);
    foreach (enemybot in var_ded14ae1ea8c4446) {
        thread function_931679c28a759f96(level.var_dbf4d97004e64bd5.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)], "shooting");
    }
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        wait(0.5);
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("AUTO_FIRE_STEP");
    }
    function_fe4aefebd9992d47(var_ded14ae1ea8c4446, 1, undefined);
    level.player function_f339c5c73d11ea20(#"hash_5b8855e71e410176", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b95
// Size: 0x11c
function function_f438de09fa371cfa() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_9851e78bf30e58f9", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"hash_9851e78bf30e58f9");
    level.player notify("clip_limited");
    level.player disableautoreload();
    while (level.var_dbf4d97004e64bd5.var_f438de09fa371cfa.needtoreload) {
        if (level.player isreloading()) {
            level.var_dbf4d97004e64bd5.var_f438de09fa371cfa.needtoreload = 0;
        }
        waitframe();
    }
    level.player enableautoreload();
    level.player function_f339c5c73d11ea20(#"hash_9851e78bf30e58f9", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb8
// Size: 0x2bf
function function_8ab6a96b2278d5cf() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9e0151baa208fe9e(#"hash_57fc723896d68a65", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_9c8e6a1620edc3b9(#"hash_57fc723896d68a65");
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("TAKE_ARMOR_STEP");
    }
    var_f838308c6674637e = level.var_dbf4d97004e64bd5.var_4084605d5216bc12.var_c9746086dbdd302d[0];
    var_f838318c667465b1 = level.var_dbf4d97004e64bd5.var_4084605d5216bc12.var_c9746086dbdd302d[1];
    var_f1e0fdae661fa0ab = namespace_3c37cb17ade254d::drop_to_ground((var_f838308c6674637e, var_f838318c667465b1, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_329c3ac67930d855));
    var_3f00185d759781c0 = function_e5524fb8509827bf(var_f1e0fdae661fa0ab + level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_b4cf16890b8820ed, "FTUE_MOBILE/ARMOR_UP_OBJ", level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_a800cab3e0c11173, level.var_dbf4d97004e64bd5.var_3c5ef1ed040af91c.var_4d9bfada768597a1);
    function_191d4de725937c3(var_f1e0fdae661fa0ab, 1.8);
    var_3d42898277f45f44 = function_cdf4890b38273393(level.player, var_f1e0fdae661fa0ab, &function_ece067e4f23075cf);
    while (isdefined(var_3d42898277f45f44)) {
        waitframe();
    }
    function_4d03b9ef456d0972(var_3f00185d759781c0);
    thread function_191d4de725937c3((0, 0, 0), 0);
    level.player function_f339c5c73d11ea20(#"hash_57fc723896d68a65", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    level.player function_9c8e6a1620edc3b9(#"hash_c772a505e8b8896");
    level.player function_9e0151baa208fe9e(#"hash_c772a505e8b8896", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    function_d92343be83930b25(level.player, &function_a6c9d2e9bb210c22);
    level waittill("ftue_armor_plate_equipped");
    level.player function_f339c5c73d11ea20(#"hash_c772a505e8b8896", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f7e
// Size: 0xb
function function_ece067e4f23075cf() {
    level notify("ftue_armor_plate_picked");
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f90
// Size: 0xb
function function_a6c9d2e9bb210c22() {
    level notify("ftue_armor_plate_equipped");
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa2
// Size: 0x104
function function_ed36379da3790cba() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9c8e6a1620edc3b9(#"hash_82a0b07c378acd4c");
    level.player function_9e0151baa208fe9e(#"hash_82a0b07c378acd4c", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_e4a38a7c9732f011("toggleADSEnabledTouch", 1);
    while (level.var_dbf4d97004e64bd5.var_59575bf55f0d3987.var_88a418affb89d5ea) {
        if (level.player adsbuttonpressed()) {
            level.var_dbf4d97004e64bd5.var_59575bf55f0d3987.var_88a418affb89d5ea = 0;
            level.player function_f339c5c73d11ea20(#"hash_82a0b07c378acd4c", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
        }
        waitframe();
    }
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20ad
// Size: 0x1c3
function function_3de63bdbd1b3e065(var_ded14ae1ea8c4446) {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9c8e6a1620edc3b9(#"hash_9dc870828f874777");
    level.player function_9e0151baa208fe9e(#"hash_9dc870828f874777", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    foreach (enemybot in var_ded14ae1ea8c4446) {
        thread function_931679c28a759f96(level.var_dbf4d97004e64bd5.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)], "moving");
    }
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("ADS_COMBAT_STEP");
        level.var_3896bf00e9c5ca00 function_a7fc1ce7540e5915(var_ded14ae1ea8c4446);
    }
    function_fe4aefebd9992d47(var_ded14ae1ea8c4446, 1, undefined);
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("MANUAL_COMBAT_STEP");
    }
    level.player function_f339c5c73d11ea20(#"hash_9dc870828f874777", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2277
// Size: 0xee
function function_7931a9f93d82dd27() {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9c8e6a1620edc3b9(#"hash_ec1ba88e1d3dca0e");
    level.player function_9e0151baa208fe9e(#"hash_ec1ba88e1d3dca0e", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    while (level.var_dbf4d97004e64bd5.var_7931a9f93d82dd27.var_77ed397326eddf57) {
        if (!level.player adsbuttonpressed()) {
            level.var_dbf4d97004e64bd5.var_7931a9f93d82dd27.var_77ed397326eddf57 = 0;
        }
        waitframe();
    }
    level.player function_f339c5c73d11ea20(#"hash_ec1ba88e1d3dca0e", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x236c
// Size: 0xc4
function function_463d388fed95c483() {
    level.player freezecontrols(1);
    level.player function_9c8e6a1620edc3b9(#"hash_d2bbdd7874ff7a8");
    var_e9444163ee17c4ac = level.var_dbf4d97004e64bd5.var_744254a0a817ff39;
    var_e9444163ee17c4ac.sound = 0;
    level.player function_9e0151baa208fe9e(#"hash_d2bbdd7874ff7a8", var_e9444163ee17c4ac);
    level.player function_36939d27ae6df257(&function_cbdfd292cbcb65e0);
    level.player function_ae00f22f048a1f57("uin_choosefiremode_appearance");
    flag_init("ftue_player_manualfire_popup");
    flag_wait("ftue_player_manualfire_popup");
    level.player freezecontrols(0);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2437
// Size: 0x1d
function function_cbdfd292cbcb65e0(var_c550577b692b6c54) {
    if (isdefined(var_c550577b692b6c54)) {
        flag_set("ftue_player_manualfire_popup");
    }
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x245b
// Size: 0x13f
function function_a31a8245682550c1(var_ded14ae1ea8c4446) {
    level.player function_9c8e6a1620edc3b9(#"hash_9be39d751f81a0b1");
    level.player function_9e0151baa208fe9e(#"hash_9be39d751f81a0b1", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    level.player function_e4a38a7c9732f011("autoFireTouch", 2);
    foreach (enemybot in var_ded14ae1ea8c4446) {
        thread function_931679c28a759f96(level.var_dbf4d97004e64bd5.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)], "shooting");
    }
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_3896bf00e9c5ca00 function_a7fc1ce7540e5915(var_ded14ae1ea8c4446);
    }
    function_fe4aefebd9992d47(var_ded14ae1ea8c4446, 1, undefined);
    level.player function_f339c5c73d11ea20(#"hash_9be39d751f81a0b1", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a1
// Size: 0x110
function function_de9508d62f36ec59() {
    level.player function_9c8e6a1620edc3b9(#"hash_2adb50b104c42707");
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")] function_f5ce7d12b7b279d3("FINAL_COMBAT_STEP");
    }
    level.player freezecontrols(1);
    var_e9444163ee17c4ac = level.var_dbf4d97004e64bd5.var_744254a0a817ff39;
    var_e9444163ee17c4ac.sound = 0;
    level.player function_9e0151baa208fe9e(#"hash_2adb50b104c42707", var_e9444163ee17c4ac);
    level.player function_36939d27ae6df257(&function_9dcc1a6d7d189448);
    level.player function_ae00f22f048a1f57("uin_choosefiremode_appearance");
    flag_init("ftue_player_choose_fire_mode");
    flag_wait("ftue_player_choose_fire_mode");
    level.player freezecontrols(0);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26b8
// Size: 0x1d
function function_9dcc1a6d7d189448(var_c550577b692b6c54) {
    if (isdefined(var_c550577b692b6c54)) {
        flag_set("ftue_player_choose_fire_mode");
    }
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26dc
// Size: 0x161
function function_7f36a1282a73e40f(var_ded14ae1ea8c4446) {
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
    level.player function_9c8e6a1620edc3b9(#"hash_825b9a861aafa726");
    level.player function_9e0151baa208fe9e(#"hash_825b9a861aafa726", level.var_dbf4d97004e64bd5.var_744254a0a817ff39);
    foreach (enemybot in var_ded14ae1ea8c4446) {
        thread function_931679c28a759f96(level.var_dbf4d97004e64bd5.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)], "moving");
        wait(0.5);
    }
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_3896bf00e9c5ca00 function_a7fc1ce7540e5915(var_ded14ae1ea8c4446);
    }
    function_fe4aefebd9992d47(var_ded14ae1ea8c4446, 1, undefined);
    if (!function_a791a878e9049670("heli_destruction")) {
        level.player function_f339c5c73d11ea20(#"hash_825b9a861aafa726", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
    }
    /#
        thread function_326cc1213268415a("<unknown string>", 3);
    #/
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2844
// Size: 0x160
function function_e48318bd7516fde6() {
    level.var_dbf4d97004e64bd5.vehicles[function_1823ff50bb28148d("LittleBird_1")].vehicleentity function_cb90a442bf4d8100("immuneToPlayer");
    level.var_dbf4d97004e64bd5.vehicles[function_1823ff50bb28148d("LittleBird_1")].vehicleentity function_944743524ecaea3((26842, -6050, 150), 100, 125, -170, (1, 1, 1));
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_e333732833f72059("stand");
        level.var_3896bf00e9c5ca00 function_3a31862196d98146("attack");
        level.var_3896bf00e9c5ca00 function_deafdba8d60e4c3b(level.var_dbf4d97004e64bd5.vehicles[function_1823ff50bb28148d("LittleBird_1")].vehicleentity, level.var_dbf4d97004e64bd5.var_395082021dfc3ae9[function_1823ff50bb28148d("AllyBot_1")].var_e5c38be28345c687["RPG_STEP"][0], &function_5399588ffb3350b9);
    }
    level waittill("destruction_sequence_completed");
    level.player function_f339c5c73d11ea20(#"hash_825b9a861aafa726", 1, level.var_dbf4d97004e64bd5.var_f09f2ffd8a67fe03);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29ab
// Size: 0x4c
function function_5399588ffb3350b9() {
    level.var_dbf4d97004e64bd5.vehicles[function_1823ff50bb28148d("LittleBird_1")].vehicleentity function_11cc5dbd12cb9f9e((27083, -5516, -500), 40);
    wait(1);
    level notify("destruction_sequence_completed");
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29fe
// Size: 0x6b
function function_ab5ab2886323a8a5() {
    /#
        thread function_326cc1213268415a("<unknown string>", 20);
    #/
    if (isdefined(level.var_3896bf00e9c5ca00)) {
        level.var_3896bf00e9c5ca00 function_390c90207bac8552();
    }
    level.var_6f626f29ffd28538.var_d0baa670c4fcf6ff = 1;
    level.player function_e05669c955312c22(2, 1);
    level function_c155068cdb5d5105();
    function_422c480d1e41bff2();
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a70
// Size: 0x6f
function function_f68e1a166600bcdf(var_cf60a913480c34e2) {
    if (isdefined(level.var_dbf4d97004e64bd5.var_b5f719818090a874[var_cf60a913480c34e2])) {
        level.var_dbf4d97004e64bd5.var_b5f719818090a874[var_cf60a913480c34e2].wall = function_e27c8ead6ab015fa([0:level.var_dbf4d97004e64bd5.var_b5f719818090a874[var_cf60a913480c34e2].data]);
    }
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae6
// Size: 0x55
function function_ec363f75c60d5900(var_cf60a913480c34e2) {
    if (isdefined(level.var_dbf4d97004e64bd5.var_b5f719818090a874[var_cf60a913480c34e2].wall)) {
        function_8ec6ff395f428891(level.var_dbf4d97004e64bd5.var_b5f719818090a874[var_cf60a913480c34e2].wall);
    }
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b42
// Size: 0x110
function function_fe5abc4fb25c1701(var_bdb110a067c516c3) {
    if (isdefined(var_bdb110a067c516c3.function) && function_a791a878e9049670(var_bdb110a067c516c3.id)) {
        /#
            if (isdefined(var_bdb110a067c516c3.var_554eda1e779cd2b1) && var_bdb110a067c516c3.var_554eda1e779cd2b1) {
                thread function_326cc1213268415a("<unknown string>" + var_bdb110a067c516c3.id + "<unknown string>", 1, 10, 120);
            } else {
                thread function_326cc1213268415a("<unknown string>" + var_bdb110a067c516c3.id, 1, 10, 120);
            }
        #/
        level.var_6f626f29ffd28538.var_5f5f6fb97e94ac59 = 1;
        if (isdefined(var_bdb110a067c516c3.param)) {
            [[ var_bdb110a067c516c3.function ]](var_bdb110a067c516c3.param);
        } else {
            [[ var_bdb110a067c516c3.function ]]();
        }
        level.var_6f626f29ffd28538.var_5f5f6fb97e94ac59 = 0;
    }
    level.var_6f626f29ffd28538.var_e950dfdd6e1577dc++;
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c59
// Size: 0x86
function function_c699558663f2308a(var_5acbea480d34f416, var_b0f0026f732dd7f1, var_3dbb8fd808f67b78) {
    var_bdb110a067c516c3 = spawnstruct();
    var_bdb110a067c516c3.id = var_5acbea480d34f416;
    var_bdb110a067c516c3.function = var_b0f0026f732dd7f1;
    if (isdefined(var_3dbb8fd808f67b78)) {
        var_bdb110a067c516c3.param = var_3dbb8fd808f67b78;
    }
    level.var_6f626f29ffd28538.steps = array_add(level.var_6f626f29ffd28538.steps, var_bdb110a067c516c3);
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce6
// Size: 0xd8
function function_7cd3d20e755ec81d(var_5acbea480d34f416, var_22bc00c6b9c5d4ea, var_ef53d8fdac5647f5, var_9a561299bae38294) {
    for (i = 0; i < level.var_6f626f29ffd28538.steps.size; i++) {
        if (level.var_6f626f29ffd28538.steps[i].id == var_5acbea480d34f416) {
            var_bdb110a067c516c3 = spawnstruct();
            var_bdb110a067c516c3.id = var_22bc00c6b9c5d4ea;
            var_bdb110a067c516c3.function = var_ef53d8fdac5647f5;
            var_bdb110a067c516c3.var_554eda1e779cd2b1 = 1;
            if (isdefined(var_9a561299bae38294)) {
                var_bdb110a067c516c3.param = var_9a561299bae38294;
            }
            level.var_6f626f29ffd28538.steps[i] = var_bdb110a067c516c3;
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_4916c580915e64ba/namespace_5d5a41995566cfa7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc6
// Size: 0x94
function function_a791a878e9049670(var_5acbea480d34f416) {
    foreach (step in level.var_6f626f29ffd28538.steps) {
        if (step.id == var_5acbea480d34f416 && !issubstr(getdvar(@"hash_7c6ebe8894cf9ebf", ""), var_5acbea480d34f416)) {
            return 1;
        }
    }
    return 0;
}

