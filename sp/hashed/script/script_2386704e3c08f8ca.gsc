#using scripts\engine\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\values.gsc;
#using scripts\stealth\utility.gsc;

#namespace namespace_e893cfa0f958c981;

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0x30f
function function_bbe32b4b9157ffd(var_62a0d160f7e4dbe6) {
    bundlename = "stealthaimusicbundle:" + var_62a0d160f7e4dbe6;
    bundle = getscriptbundle(bundlename);
    if (isdefined(bundle)) {
        self.var_c0578325b5b24a5b = spawnstruct();
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f = [];
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["idle"] = bundle.var_398e8318dc77f236;
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["investigate"] = bundle.var_9fc97536d296595d;
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["investigate_to_idle"] = bundle.var_9b8298d7cb7f882e;
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["hunt"] = bundle.var_c958377c5a4a7f65;
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["hunt_to_idle"] = bundle.var_3784481c6c21da06;
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["combat_1"] = bundle.var_4e523c36234b18f0;
        self.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["combat_2"] = bundle.var_df13241b720b6c6a;
        self.var_c0578325b5b24a5b.grace_periods = [];
        self.var_c0578325b5b24a5b.grace_periods["idle"] = bundle.var_3a88892f0baddaab;
        self.var_c0578325b5b24a5b.grace_periods["investigate"] = bundle.var_402340fdc5a42df0;
        self.var_c0578325b5b24a5b.grace_periods["combat"] = bundle.var_9b45682d3e9f92ed;
        self.var_c0578325b5b24a5b.grace_periods["hunt"] = bundle.var_1990431b5300298;
        self.var_c0578325b5b24a5b.grace_periods["investigate_to_idle"] = bundle.var_4ee7638cf2547383;
        self.var_c0578325b5b24a5b.grace_periods["hunt_to_idle"] = bundle.var_b5eabfd911fb10ed;
        self.var_c0578325b5b24a5b.grace_periods["combat_to_escalated"] = bundle.var_31da0095ac09fdb0;
        self.var_c0578325b5b24a5b.var_700449fcc91e7a55 = bundle.var_396eb58ed10581f8;
        self.var_c0578325b5b24a5b.var_9e9c353989e501e7 = bundle.var_14fe954fc4a52b28;
        self.var_c0578325b5b24a5b.var_5a25fdf720439106 = bundle.var_d22cf2bef49eb113 * 1000;
        self.var_c0578325b5b24a5b.var_868389572674fa47 = bundle.var_fe8343b6dc6074cf;
        return 1;
    }
    assertmsg("Stealth AI Music Bundle: '" + var_62a0d160f7e4dbe6 + "' not found.\n");
    return 0;
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5bb
// Size: 0x11d
function function_53b88af7755302d2(var_62a0d160f7e4dbe6, var_a3c70453bb4a5462) {
    if (!level function_bbe32b4b9157ffd(var_62a0d160f7e4dbe6)) {
        assertmsg("Stealth AI Music not setup correctly.");
        return;
    }
    setsaveddvar(@"hash_cc8e0b21d7f14dee", 1);
    /#
        level.var_3b5a6b2ae3ab823e = "<dev string:x1c>";
        level.var_85c67f587c0d4f5c = "<dev string:x21>";
        setdvarifuninitialized(@"hash_634f1db2948c6cfc", 0);
        setdvarifuninitialized(@"hash_271dd5f8dfd8a033", 400);
        setdvarifuninitialized(@"hash_271dd4f8dfd89e00", 200);
        setdvarifuninitialized(@"hash_6fc700b1ebe5fbcd", 1.25);
        setdvarifuninitialized(@"hash_3914181cb45675f4", 0.3);
        setdvarifuninitialized(@"hash_3bc43b3be58c2513", 5000);
        setdvarifuninitialized(@"hash_88509bf2e2f7ec7b", 0);
        setdvarifuninitialized(@"hash_a0351e4be96620c9", 0);
        level thread function_319a84095ab6fa2a();
    #/
    flag_wait("player_spawned_pre_loadout");
    flag_wait("flag_dungeon_intro_complete");
    if (!isdefined(var_a3c70453bb4a5462) || !var_a3c70453bb4a5462) {
        function_6ae6331457ff833d();
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e0
// Size: 0x9b
function function_ab896f241797c649() {
    level.player endon("death");
    level.player endon("disconnect");
    level.player endon("dungeons_stealth_ai_music_stop");
    while (true) {
        level waittill("ai_killed", var_c9b351269a319209, sweapon, smeansofdeath, eattacker, evictim, team);
        if (smeansofdeath == "MOD_EXECUTION") {
            level.player notify("killed_ai_in_execution");
        }
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x783
// Size: 0x21
function function_a48e0ce94e6264d9() {
    if (function_8f63b34b24e150de() || function_43686a66968a63ce() || function_6e7eeaf3dc05e54e()) {
        return false;
    }
    return true;
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ad
// Size: 0x21
function function_d4dd82f70477e0e() {
    if (function_8f63b34b24e150de() && !function_43686a66968a63ce() && !function_6e7eeaf3dc05e54e()) {
        return true;
    }
    return false;
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d7
// Size: 0x1c
function function_75d8d5ad2dfaa11a(var_4e81b67b18703077) {
    level.var_f579a2baf358aa24 = var_4e81b67b18703077;
    setmusicstate(var_4e81b67b18703077);
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fb
// Size: 0xad
function function_195260d94ed11e68() {
    self endon("death");
    self endon("disconnect");
    self endon("dungeons_stealth_ai_music_stop");
    var_8be12c262cb81e53 = level.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["idle"];
    assert(isplayer(self));
    while (true) {
        while (!function_a48e0ce94e6264d9() || !flag("flag_dungeon_stealth_ai_idle_ready")) {
            waitframe();
        }
        function_96815072b333a92b("idle");
        if (!function_a48e0ce94e6264d9()) {
            continue;
        }
        /#
            level.var_3b5a6b2ae3ab823e = "<dev string:x22>";
        #/
        function_75d8d5ad2dfaa11a(var_8be12c262cb81e53);
        while (function_a48e0ce94e6264d9()) {
            waitframe();
        }
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b0
// Size: 0x107
function function_8e0c5e09b16cc301() {
    self endon("death");
    self endon("disconnect");
    self endon("dungeons_stealth_ai_music_stop");
    var_c735ff198998554 = level.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["investigate"];
    var_c8e3755bc4b1ee65 = level.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["investigate_to_idle"];
    assert(isplayer(self));
    while (true) {
        while (!function_d4dd82f70477e0e()) {
            waitframe();
        }
        function_96815072b333a92b("investigate");
        if (!function_d4dd82f70477e0e()) {
            continue;
        }
        flag_clear("flag_dungeon_stealth_ai_idle_ready");
        /#
            level.var_3b5a6b2ae3ab823e = "<dev string:x27>";
        #/
        function_75d8d5ad2dfaa11a(var_c735ff198998554);
        while (function_d4dd82f70477e0e()) {
            waitframe();
        }
        if (function_a48e0ce94e6264d9()) {
            /#
                level.var_3b5a6b2ae3ab823e = "<dev string:x33>";
            #/
            function_75d8d5ad2dfaa11a(var_c8e3755bc4b1ee65);
            function_96815072b333a92b("investigate_to_idle");
        }
        flag_set("flag_dungeon_stealth_ai_idle_ready");
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bf
// Size: 0x53
function function_9fa335917d15b6c6() {
    if (!isdefined(level.var_11253856c7fac15f) || level.var_11253856c7fac15f["offense"].size == 0) {
        return (function_18c3ac39f4e482c1() >= level.var_c0578325b5b24a5b.var_868389572674fa47);
    }
    return level.var_11253856c7fac15f["offense"].size >= 1;
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1b
// Size: 0x3b
function function_f26d6483461ffcc1() {
    if (!isdefined(level.var_11253856c7fac15f) || level.var_11253856c7fac15f["offense"].size == 0) {
        return false;
    }
    return level.var_11253856c7fac15f["offense"].size >= 1;
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa5f
// Size: 0x11
function function_43686a66968a63ce() {
    return function_f26d6483461ffcc1() || function_1bb1470f934a81eb();
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa79
// Size: 0x14f
function function_3ffb5b94e9e0f76e() {
    self endon("death");
    self endon("disconnect");
    self endon("dungeons_stealth_ai_music_stop");
    var_1143761f85e37ced = level.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["combat_1"];
    var_fdf0156458b2b3f8 = level.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["combat_2"];
    level.var_19af88b332cae335 = var_1143761f85e37ced;
    assert(isplayer(self));
    while (true) {
        while (!function_9fa335917d15b6c6()) {
            waitframe();
        }
        function_96815072b333a92b("combat");
        if (!function_9fa335917d15b6c6()) {
            continue;
        }
        /#
            level.var_3b5a6b2ae3ab823e = "<dev string:x47>";
        #/
        function_75d8d5ad2dfaa11a(var_1143761f85e37ced);
        while (function_9fa335917d15b6c6()) {
            if (function_152615a02ccdcd7d() && level.var_19af88b332cae335 != var_fdf0156458b2b3f8) {
                /#
                    level.var_3b5a6b2ae3ab823e = "<dev string:x4e>";
                #/
                function_75d8d5ad2dfaa11a(var_fdf0156458b2b3f8);
                level.var_19af88b332cae335 = var_fdf0156458b2b3f8;
            } else if (!function_152615a02ccdcd7d() && level.var_19af88b332cae335 == var_fdf0156458b2b3f8) {
                /#
                    level.var_3b5a6b2ae3ab823e = "<dev string:x47>";
                #/
                function_75d8d5ad2dfaa11a(var_1143761f85e37ced);
                level.var_19af88b332cae335 = var_1143761f85e37ced;
            }
            waitframe();
        }
        level.var_19af88b332cae335 = var_1143761f85e37ced;
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd0
// Size: 0x16
function function_152615a02ccdcd7d() {
    if (istrue(level.var_3b1ccf105481b5e6)) {
        return 0;
    }
    return function_3f51c5f6398bff45();
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbef
// Size: 0x124
function function_c3689d8d2de72567() {
    self endon("death");
    self endon("disconnect");
    self endon("dungeons_stealth_ai_music_stop");
    var_2d7a844d6621424 = level.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["hunt"];
    var_c8e3755bc4b1ee65 = level.var_c0578325b5b24a5b.var_4eacfce5726f6c9f["hunt_to_idle"];
    assert(isplayer(self));
    while (true) {
        while (!function_6e7eeaf3dc05e54e() || function_43686a66968a63ce()) {
            waitframe();
        }
        function_96815072b333a92b("hunt");
        if (!function_6e7eeaf3dc05e54e() || function_43686a66968a63ce()) {
            continue;
        }
        flag_clear("flag_dungeon_stealth_ai_idle_ready");
        /#
            level.var_3b5a6b2ae3ab823e = "<dev string:x58>";
        #/
        function_75d8d5ad2dfaa11a(var_2d7a844d6621424);
        while (function_6e7eeaf3dc05e54e() && !function_43686a66968a63ce()) {
            waitframe();
        }
        if (function_a48e0ce94e6264d9()) {
            /#
                level.var_3b5a6b2ae3ab823e = "<dev string:x5d>";
            #/
            function_75d8d5ad2dfaa11a(var_c8e3755bc4b1ee65);
            function_96815072b333a92b("hunt_to_idle");
        }
        flag_set("flag_dungeon_stealth_ai_idle_ready");
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1b
// Size: 0x197
function function_8ff63d221aacd6f2() {
    self endon("death");
    self endon("disconnect");
    self endon("dungeons_stealth_ai_music_stop");
    level.var_2ae00232eb3193a7 = 0;
    while (true) {
        waitframe();
        if (function_43686a66968a63ce()) {
            continue;
        }
        elapsed_time = gettime() - level.var_2ae00232eb3193a7;
        if (elapsed_time < level.var_c0578325b5b24a5b.var_5a25fdf720439106) {
            continue;
        }
        level.var_7713ae2bf0fb4533 = 0;
        var_e521ef7b296b23b7 = getaiarray("axis");
        foreach (guy in var_e521ef7b296b23b7) {
            if (!isdefined(guy) || !isalive(guy) || guy.health <= 0 || !isai(guy)) {
                continue;
            }
            var_24ecba3ef46051fd = lengthsquared(guy.origin - self.origin);
            if (var_24ecba3ef46051fd > level.var_c0578325b5b24a5b.var_700449fcc91e7a55) {
                continue;
            }
            if (level.player scripts\stealth\utility::is_visible(guy)) {
                level.var_7713ae2bf0fb4533 += 1;
            }
            if (level.var_7713ae2bf0fb4533 >= level.var_c0578325b5b24a5b.var_9e9c353989e501e7) {
                level.var_2ae00232eb3193a7 = gettime();
                self notify("ai_in_close_proximity");
            }
        }
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeba
// Size: 0xa8
function function_a0eba6afd8a539f0() {
    self endon("death");
    self endon("disconnect");
    self endon("dungeons_stealth_ai_music_stop");
    while (true) {
        waitframe();
        msg = waittill_any_return_3("ai_in_close_proximity", "execution_begin", "killed_ai_in_execution");
        if (!isdefined(msg)) {
            continue;
        }
        if (msg == "ai_in_close_proximity") {
            level.player playsound("temp_jup_d002_proximityoneshot");
            continue;
        }
        if (msg == "execution_begin") {
            level.player playsound("temp_jup_d002_takedownoneshot");
            continue;
        }
        if (msg == "killed_ai_in_execution") {
            level.player playsound("temp_jup_d002_killoneshot");
        }
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6a
// Size: 0x89
function function_6ae6331457ff833d() {
    flag_set("flag_dungeon_stealth_ai_idle_ready");
    level.player thread function_195260d94ed11e68();
    level.player thread function_8e0c5e09b16cc301();
    level.player thread function_3ffb5b94e9e0f76e();
    level.player thread function_c3689d8d2de72567();
    level.player thread function_8ff63d221aacd6f2();
    level.player thread function_a0eba6afd8a539f0();
    level thread function_ab896f241797c649();
    /#
        level thread function_e7d972eb870870a6();
    #/
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xffb
// Size: 0xa4
function function_ebd9a9c9789d200f() {
    clearmusicstate();
    level.player notify("dungeons_stealth_ai_music_stop");
    var_e521ef7b296b23b7 = getaiarray("axis");
    foreach (guy in var_e521ef7b296b23b7) {
        if (!isdefined(guy) || !isalive(guy) || guy.health <= 0 || !isai(guy)) {
            continue;
        }
        guy notify("dungeons_stealth_ai_music_stop");
    }
}

// Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a7
// Size: 0x50
function function_96815072b333a92b(state) {
    /#
        level.var_85c67f587c0d4f5c = "<dev string:x6a>" + state + "<dev string:x74>" + level.var_c0578325b5b24a5b.grace_periods[state];
    #/
    wait level.var_c0578325b5b24a5b.grace_periods[state];
}

/#

    // Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10ff
    // Size: 0x44c
    function function_e7d972eb870870a6() {
        self.player endon("<dev string:x85>");
        level.var_c0578325b5b24a5b.debug = spawnstruct();
        while (true) {
            waitframe();
            if (!getdvarint(@"hash_634f1db2948c6cfc", 0)) {
                continue;
            }
            x = getdvarint(@"hash_271dd5f8dfd8a033", 400);
            y = getdvarint(@"hash_271dd4f8dfd89e00", 200);
            scale = getdvarint(@"hash_6fc700b1ebe5fbcd", 1.25);
            var_26f37fdbb80dc467 = 15 * scale;
            printtoscreen2d(x, y, "<dev string:xa4>", (1, 1, 1), scale);
            y += var_26f37fdbb80dc467;
            var_12eeae7f1680b5f6 = function_18c3ac39f4e482c1();
            var_1c646566fb012aa5 = function_6e7eeaf3dc05e54e();
            var_cda02ddadc6bbf43 = function_8f63b34b24e150de();
            y += var_26f37fdbb80dc467;
            var_f1475fc4d1ceb0a1 = isdefined(level.var_11253856c7fac15f) ? level.var_11253856c7fac15f["<dev string:xb7>"].size : 0;
            msg = "<dev string:xbf>" + var_f1475fc4d1ceb0a1;
            printtoscreen2d(x, y, msg, (1, 1, 1), scale);
            if (!istrue(level.var_3b1ccf105481b5e6)) {
                var_ac2ac5238e8d587d = level.valstruct val::get_last("<dev string:xe7>");
                if (isdefined(var_ac2ac5238e8d587d) && var_ac2ac5238e8d587d >= 0) {
                    y += var_26f37fdbb80dc467;
                    msg = "<dev string:x104>" + function_3e00b40f72895078() + "<dev string:x130>" + var_ac2ac5238e8d587d;
                    printtoscreen2d(x, y, msg, (1, 1, 1), scale);
                }
                var_4b159a580d33d17c = level.valstruct val::get_last("<dev string:x132>");
                if (isdefined(var_4b159a580d33d17c)) {
                    var_10014b971c1f9d21 = int(function_39493dc5cfe8e056() * var_4b159a580d33d17c);
                    y += var_26f37fdbb80dc467;
                    msg = "<dev string:x14f>" + var_12eeae7f1680b5f6 + "<dev string:x130>" + var_10014b971c1f9d21;
                    printtoscreen2d(x, y, msg, (1, 1, 1), scale);
                }
            } else {
                y += var_26f37fdbb80dc467;
                msg = "<dev string:x173>";
                printtoscreen2d(x, y, msg, (1, 1, 1), scale);
            }
            y += var_26f37fdbb80dc467;
            msg = "<dev string:x188>" + var_1c646566fb012aa5;
            printtoscreen2d(x, y, msg, (1, 1, 1), scale);
            y += var_26f37fdbb80dc467;
            msg = "<dev string:x19a>" + var_cda02ddadc6bbf43;
            printtoscreen2d(x, y, msg, (1, 1, 1), scale);
            y += var_26f37fdbb80dc467;
            msg = "<dev string:x1b3>" + level.var_3b5a6b2ae3ab823e;
            printtoscreen2d(x, y, msg, (1, 1, 1), scale);
            y += var_26f37fdbb80dc467;
            msg = "<dev string:x1c1>" + level.var_85c67f587c0d4f5c;
            printtoscreen2d(x, y, msg, (1, 1, 1), scale);
            var_cf24c09b6f305a34 = getaiarray();
            foreach (guy in var_cf24c09b6f305a34) {
                if (!isdefined(guy) || !isalive(guy) || guy.health <= 0 || !isai(guy)) {
                    continue;
                }
                if (!isdefined(guy.stealth) || !isdefined(guy.var_fe5ebefa740c7106)) {
                    y += var_26f37fdbb80dc467;
                    var_458c7a875747dcad = guy getentitynumber();
                    var_a77658803495bc50 = ter_op(isdefined(guy.classname), guy.classname, "<dev string:x21>");
                    msg = "<dev string:x1d0>" + var_458c7a875747dcad + "<dev string:x1d5>" + var_a77658803495bc50 + "<dev string:x1e6>";
                    printtoscreen2d(x, y, msg, (1, 0, 0), scale);
                }
            }
        }
    }

    // Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1553
    // Size: 0x10
    function function_39493dc5cfe8e056() {
        return getaicount("<dev string:x1fc>");
    }

    // Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x156b
    // Size: 0xdf
    function function_3e00b40f72895078() {
        var_facfcfd6b22cf447 = 0;
        var_e521ef7b296b23b7 = getaiarray("<dev string:x1fc>");
        foreach (guy in var_e521ef7b296b23b7) {
            if (!isdefined(guy) || !isalive(guy) || guy.health <= 0 || !isai(guy)) {
                continue;
            }
            if (isdefined(guy.var_fe5ebefa740c7106) && guy.var_fe5ebefa740c7106 == 3) {
                var_9a7be71d3cdb8d0f = gettime() - guy.starttimestamp;
                var_facfcfd6b22cf447 += var_9a7be71d3cdb8d0f;
            }
        }
        return function_c89ed1840c8d0f0f(var_facfcfd6b22cf447);
    }

    // Namespace namespace_e893cfa0f958c981 / namespace_b96fa4d8ce10f926
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1652
    // Size: 0x60
    function function_319a84095ab6fa2a() {
        while (true) {
            waitframe();
            if (getdvarint(@"hash_88509bf2e2f7ec7b", 0)) {
                function_6ae6331457ff833d();
                setdvar(@"hash_88509bf2e2f7ec7b", 0);
            }
            if (getdvarint(@"hash_a0351e4be96620c9", 0)) {
                function_ebd9a9c9789d200f();
                setdvar(@"hash_a0351e4be96620c9", 0);
            }
        }
    }

#/
