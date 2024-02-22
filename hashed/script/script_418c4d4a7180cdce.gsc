// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_3b64eb40368c1450;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\mp\utility\game.gsc;
#using script_4c770a9a4ad7659c;

#namespace smoke;

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x459
// Size: 0x18
function private function_ddcb9338c5cd1d29(params) {
    ent_flag_clear("player_smoke_active");
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x478
// Size: 0x1c
function private screenshot(text) {
    function_7147a75d24ed663(4, "screenshot:" + text);
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b
// Size: 0x194
function function_d63760cb7c36587(var_d805910cf2ef79c7) {
    level notify("smoke_test_monitor_singleton");
    level endon("smoke_test_monitor_singleton");
    /#
        println("_");
    #/
    while (!function_464c7c47f88f997f()) {
        wait(0.1);
    }
    /#
        println("crouch");
    #/
    callback::add("player_death", &function_ddcb9338c5cd1d29);
    callback::add("player_disconnect", &function_ddcb9338c5cd1d29);
    while (1) {
        setdvar(@"hash_f231356c584a015b", 0);
        var_4516a055a41b717e = getdvarint(@"hash_b5b5a0b219992b30", 0);
        if (var_4516a055a41b717e > 0) {
            if (!istrue(level.var_9e8792374ac10384)) {
                function_ee2a48ffc8fda458();
                function_7147a75d24ed663(4, [0:"DVAR_SETTING:", 1:var_4516a055a41b717e, 2:"GameType:", 3:getgametype()]);
                switch (var_4516a055a41b717e) {
                case 1:
                    function_7147a75d24ed663(4, "case 1");
                    thread smoke_level_1();
                    break;
                case 2:
                    function_7147a75d24ed663(4, "case 2");
                    player = getentarray("player", "classname")[0];
                    if (isdefined(player) && isalive(player)) {
                        player thread smoke_level_2();
                    }
                    break;
                default:
                    function_7147a75d24ed663(4, "default");
                    break;
                }
            }
        }
        setdvar(@"hash_b5b5a0b219992b30", 0);
        wait(1);
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x636
// Size: 0x42
function private function_ee2a48ffc8fda458() {
    level.var_9e8792374ac10384 = 1;
    level.var_88a8efeaa91fabba = 0;
    level.var_6492adee56d19067 = function_b6dccdc08d6a79cf(1, 0);
    level.var_d267f6e95a74866d = 0;
    level.var_54eac48bbc0e31af = spawnstruct();
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x67f
// Size: 0x25
function private function_464c7c47f88f997f() {
    return isdefined(level.maxplayercount) && namespace_cd0b2d039510b38d::gamehasstarted() && isdefined(level.players);
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6ac
// Size: 0x25
function private function_3c56204f7d2b532b(stat) {
    if (isdefined(self.pers)) {
        return self.pers[stat];
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d8
// Size: 0x34
function private function_63406a3b87272a0f(stat, value) {
    if (isdefined(self.pers) && isdefined(value)) {
        self.pers[stat] = value;
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x713
// Size: 0x51
function private function_aadecbc412d792b5() {
    kills = function_3c56204f7d2b532b("kills");
    if (kills >= 3) {
        function_7147a75d24ed663(3, "Kills reached:" + kills);
        function_63406a3b87272a0f("kills", 0);
        return 1;
    }
    function_7147a75d24ed663(3, "Kills not reached:" + kills);
    return 0;
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x76c
// Size: 0x19c
function private function_3ef591377c2b6fd1(var_fb42390beea59462) {
    if (isdefined(level.var_54eac48bbc0e31af) && isdefined(var_fb42390beea59462)) {
        level.var_54eac48bbc0e31af.dt = getdatetime();
        level.var_54eac48bbc0e31af.st = gettime();
        level.var_54eac48bbc0e31af.event = "TEST_START";
        level.var_54eac48bbc0e31af.var_fb42390beea59462 = "SMOKE_TEST: " + var_fb42390beea59462;
        level.var_54eac48bbc0e31af.result = "INIT";
        level.var_54eac48bbc0e31af.duration = 0;
        level.var_54eac48bbc0e31af.build_id = getdvar(@"hash_444503022bc062df", "0");
        level.var_54eac48bbc0e31af.test_session_id = getdvar(@"hash_79ed55a7f6c778a4", "0");
    }
    function_7147a75d24ed663(2, function_4cafad2d016399da());
    dlog_recordevent("dlog_event_automation_smoketest_start", [0:"test_name", 1:level.var_54eac48bbc0e31af.var_fb42390beea59462, 2:"test_additional_info", 3:level.var_54eac48bbc0e31af.event, 4:"test_session_id", 5:level.var_54eac48bbc0e31af.test_session_id, 6:"build_id", 7:level.var_54eac48bbc0e31af.build_id]);
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90f
// Size: 0x161
function private function_a48370b9ea15e2f0(status) {
    if (isdefined(level.var_54eac48bbc0e31af)) {
        level.var_54eac48bbc0e31af.var_ce203b78f5721f78 = gettime();
        level.var_54eac48bbc0e31af.result = status;
        level.var_54eac48bbc0e31af.event = "TEST_END";
        level.var_54eac48bbc0e31af.duration = int(function_c89ed1840c8d0f0f(level.var_54eac48bbc0e31af.var_ce203b78f5721f78 - level.var_54eac48bbc0e31af.st));
    }
    function_7147a75d24ed663(2, function_4cafad2d016399da());
    dlog_recordevent("dlog_event_automation_smoketest_end", [0:"test_name", 1:level.var_54eac48bbc0e31af.var_fb42390beea59462, 2:"test_duration_seconds", 3:level.var_54eac48bbc0e31af.duration, 4:"test_result", 5:level.var_54eac48bbc0e31af.result, 6:"test_additional_info", 7:level.var_54eac48bbc0e31af.event, 8:"test_session_id", 9:level.var_54eac48bbc0e31af.test_session_id]);
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa77
// Size: 0x122
function private function_4cafad2d016399da() {
    if (isdefined(level.var_54eac48bbc0e31af)) {
        var_a11bb506470b6274 = function_996b01cd49d0128d(level.var_54eac48bbc0e31af.dt, "_") + "|" + level.var_54eac48bbc0e31af.event + "|" + level.var_54eac48bbc0e31af.var_fb42390beea59462 + "|" + level.var_54eac48bbc0e31af.result + "|" + "Error:" + level.var_6492adee56d19067.messages[0] + "|" + "Warn:" + level.var_6492adee56d19067.messages[1] + "|" + level.var_54eac48bbc0e31af.build_id + "|" + level.var_54eac48bbc0e31af.test_session_id + "|" + level.var_54eac48bbc0e31af.duration + "s";
        return var_a11bb506470b6274;
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba0
// Size: 0x9b
function function_243de27a2b9ecbbe(origin, angles, dist) {
    if (!function_464c7c47f88f997f()) {
        return 0;
    }
    dist = ter_op(isdefined(dist), dist, 80);
    if (isdefined(origin) && isdefined(angles) && isdefined(dist)) {
        castend = origin + angles * dist;
        trace = ray_trace(origin, castend);
        if (isdefined(trace) && ter_op(trace["hittype"] == "hittype_none", 1, 0)) {
            function_7147a75d24ed663(4, trace["hittype"]);
            return 1;
        }
    }
    return 0;
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc43
// Size: 0x5c
function function_e8bd86d0c0f85749(var_6c3200050ed240a2, wait_time) {
    if (isdefined(self) && isdefined(var_6c3200050ed240a2)) {
        wait_time = function_53c4c53197386572(wait_time, 1);
        function_7147a75d24ed663(4, "plr: " + self.clientid + " " + var_6c3200050ed240a2);
        self botpressbutton(var_6c3200050ed240a2);
        screenshot(var_6c3200050ed240a2);
        wait(wait_time);
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca6
// Size: 0x5c
function function_852d53e299c34e9c(stance, wait_time) {
    if (isdefined(self) && isdefined(stance)) {
        wait_time = function_53c4c53197386572(wait_time, 1);
        function_7147a75d24ed663(4, "plr: " + self.clientid + " " + stance);
        self botsetstance(stance);
        screenshot(stance);
        wait(wait_time);
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd09
// Size: 0x15b
function private smoke_level_1() {
    level notify("smoke_singleton");
    level endon("smoke_singleton");
    while (!function_464c7c47f88f997f()) {
        wait(0.05);
    }
    function_3ef591377c2b6fd1("SMOKE_LEVEL_1");
    foreach (player in level.players) {
        if (isalive(player) && isplayer(player) && !player ent_flag("player_smoke_active")) {
            player thread function_c7aeb5253e41a015();
        }
    }
    var_733899cede023a70 = 1;
    while (var_733899cede023a70) {
        wait(2);
        var_733899cede023a70 = 0;
        foreach (player in level.players) {
            if (isalive(player) && isplayer(player) && player ent_flag("player_smoke_active")) {
                var_733899cede023a70 = 1;
                break;
            }
        }
    }
    function_a48370b9ea15e2f0("PASS");
    level.var_9e8792374ac10384 = 0;
    setdvar(@"hash_f231356c584a015b", 1);
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe6b
// Size: 0x23d
function private function_c7aeb5253e41a015() {
    self notify("player_smoke_loop_singleton");
    self endon("player_smoke_loop_singleton");
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    player = self;
    player ent_flag_set("player_smoke_active");
    setdvar(@"hash_a48570b2b90adb33", 1);
    dist = 200;
    if (!function_243de27a2b9ecbbe(player.origin, anglestoforward(player.angles), dist)) {
        function_7147a75d24ed663(1, "plr: " + player.clientid + " Spawning bot with ray collision from players forward angles.");
    }
    spawndata = function_afc83012117903d9(player, dist);
    level thread [[ level.bot_funcs["bots_spawn"] ]](1, player.team, undefined, undefined, undefined, undefined, spawndata);
    bot = undefined;
    wait(1);
    if (!isdefined(bot)) {
        players = getentarray("player", "classname");
        for (index = 0; index < players.size; index++) {
            plr = players[index];
            if (isbot(plr) && isalive(plr)) {
                bot = plr;
                break;
            }
        }
    }
    if (isdefined(bot)) {
        bot.ignoreall = 1;
        bot botsetflag("disable_movement", 1);
        bot botsetflag("disable_random_goal", 1);
        bot function_e8bd86d0c0f85749("jump");
        bot function_e8bd86d0c0f85749("melee");
        bot function_e8bd86d0c0f85749("attack");
        bot function_e8bd86d0c0f85749("lethal");
        bot function_e8bd86d0c0f85749("tactical");
        bot function_852d53e299c34e9c("crouch");
        bot function_852d53e299c34e9c("prone");
        bot function_e8bd86d0c0f85749("attack");
        bot function_852d53e299c34e9c("crouch");
        bot function_852d53e299c34e9c("stand");
        function_7147a75d24ed663(4, "plr: " + self.clientid + " ads");
        bot botpressbutton("ads", 0.5);
        wait(1);
    }
    player ent_flag_clear("player_smoke_active");
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10af
// Size: 0x110
function private smoke_level_2() {
    self endon("disconnect");
    self endon("death");
    level notify("smoke_singleton");
    level endon("smoke_singleton");
    player = self;
    function_3ef591377c2b6fd1("SMOKE_LEVEL_2");
    setdvar(@"hash_a48570b2b90adb33", 1);
    player function_9fc451f8cce8fc98(3);
    playerkills = player function_3c56204f7d2b532b("kills");
    while (!player function_aadecbc412d792b5()) {
        function_7147a75d24ed663(4, "StartForcedFire");
        player startforcedfire();
        wait(0.5);
        screenshot("StartForcedFire");
        player stopforcedfire();
        wait(1);
        function_7147a75d24ed663(4, "StopForcedFire");
        screenshot("StopForcedFire");
        playerkills = player function_3c56204f7d2b532b("kills");
        function_7147a75d24ed663(4, "Kill Count:" + playerkills);
    }
    level.var_88a8efeaa91fabba = level.var_88a8efeaa91fabba + 1;
    function_a48370b9ea15e2f0("PASS" + " SMOKE_BOTS_KILLS:" + playerkills);
    function_7d933ec423d9d4f5();
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11c6
// Size: 0x27
function private function_7d933ec423d9d4f5() {
    if (function_1c00590758e63257()) {
        level.var_9e8792374ac10384 = 0;
        setdvar(@"hash_f231356c584a015b", 1);
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11f4
// Size: 0x9
function private function_1c00590758e63257() {
    return function_59399abfaa25ec21();
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1205
// Size: 0xf
function private function_59399abfaa25ec21() {
    return level.var_88a8efeaa91fabba == 1;
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x121c
// Size: 0x125
function private function_9fc451f8cce8fc98(var_b7891bdcdcda7208, botteam, spawndata) {
    self endon("disconnect");
    while (!function_464c7c47f88f997f()) {
        wait(0.05);
    }
    if (!isdefined(var_b7891bdcdcda7208)) {
        var_b7891bdcdcda7208 = 1;
    }
    if (!isdefined(botteam)) {
        switch (self.team) {
        case #"hash_7c2d091e6337bf54":
            botteam = "allies";
            break;
        case #"hash_5f54b9bf7583687f":
            botteam = "axis";
            break;
        default:
            break;
        }
    }
    while (isdefined(level.var_d267f6e95a74866d) && level.var_d267f6e95a74866d < var_b7891bdcdcda7208) {
        spawndata = function_afc83012117903d9(self, level.var_d267f6e95a74866d * 24 + 48);
        function_7147a75d24ed663(4, "Spawning bot:" + level.var_d267f6e95a74866d);
        level thread [[ level.bot_funcs["bots_spawn"] ]](1, botteam, undefined, undefined, undefined, undefined, spawndata);
        level.var_d267f6e95a74866d = level.var_d267f6e95a74866d + 1;
        wait(0.25);
    }
    function_7147a75d24ed663(2, "Spawned bot(s):" + var_b7891bdcdcda7208);
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1348
// Size: 0x41
function private function_deadcc8fc572657d(duration) {
    self endon("disconnect");
    if (!isdefined(duration)) {
        duration = 3;
    }
    while (!function_464c7c47f88f997f()) {
        wait(0.05);
    }
    for (;;) {
        self startforcedfire();
        wait(duration);
        self stopforcedfire();
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1390
// Size: 0x6a
function private function_3819840818a6b8b6(var_66280091b78eaf4f, var_3de7070b177a28fa, var_2d2c97482d5ac17, duration) {
    self endon("disconnect");
    while (!function_464c7c47f88f997f()) {
        wait(0.05);
    }
    var_b3225133eb7f5842 = var_66280091b78eaf4f;
    for (;;) {
        self setplayerangles((0, var_b3225133eb7f5842, 0));
        if (var_b3225133eb7f5842 > var_3de7070b177a28fa) {
            var_b3225133eb7f5842 = var_66280091b78eaf4f;
        } else {
            var_b3225133eb7f5842 = var_b3225133eb7f5842 + var_2d2c97482d5ac17;
            wait(duration);
        }
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1401
// Size: 0x1b1
function private function_6e02da7fde448d84(var_a011729d000a28d2) {
    while (!function_464c7c47f88f997f()) {
        wait(0.05);
    }
    if (!isdefined(var_a011729d000a28d2)) {
        var_a011729d000a28d2 = self.origin;
    }
    j = 1;
    foreach (p in level.players) {
        if (isalive(p) && isbot(p) && p.team != "spectator") {
            p.var_a7191a813d8d9620 = function_afc83012117903d9(self, j * 24 + 48);
            if (!isdefined(p.var_a7191a813d8d9620)) {
                continue;
            }
            forward = anglestoforward(self.angles);
            p.ignoreall = 1;
            p botsetflag("disable_movement", 1);
            p botsetflag("disable_random_goal", 1);
            p setorigin(p.var_a7191a813d8d9620.origin);
            p setplayerangles((0, p.var_a7191a813d8d9620.angles[1], 0));
            function_7147a75d24ed663(3, [0:"Moved bot to:", 1:p.var_a7191a813d8d9620.origin, 2:" Angles:", 3:p.var_a7191a813d8d9620.angles]);
            j = j + 1;
        }
    }
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15b9
// Size: 0xc1
function private function_afc83012117903d9(player, spawndist) {
    if (!isdefined(player)) {
        player = getentarray("player", "classname")[0];
    }
    if (!isdefined(spawndist)) {
        spawndist = 75;
    }
    angles = player getplayerangles();
    fwd = anglestoforward(angles);
    spawnorigin = player.origin + (0, 0, 30) + fwd * spawndist;
    spawnangles = (0, angles[1] + 180, 0);
    spawndata = spawnstruct();
    spawndata.origin = spawnorigin;
    spawndata.angles = spawnangles;
    return spawndata;
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1682
// Size: 0xbd
function function_b6dccdc08d6a79cf(enabled, var_b8cb1cd979acd1a7) {
    var_2ba3653db0fcae69 = spawnstruct();
    var_2ba3653db0fcae69.enabled = function_53c4c53197386572(enabled, 1);
    var_2ba3653db0fcae69.var_b8cb1cd979acd1a7 = function_53c4c53197386572(var_b8cb1cd979acd1a7, 0);
    var_2ba3653db0fcae69.messages = [];
    for (i = 0; i < 5; i++) {
        var_2ba3653db0fcae69.messages[i] = 0;
    }
    var_2ba3653db0fcae69.var_e7fdad8568d246a9 = [0:"[SMOKE_ERROR]", 1:"[SMOKE_WARN]", 2:"[SMOKE_INFO]", 3:"[SMOKE_DEBUG]", 4:"[SMOKE_TRACE]"];
    return var_2ba3653db0fcae69;
}

// Namespace smoke/namespace_1676ee684fdab294
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1747
// Size: 0x124
function private function_7147a75d24ed663(var_d3967d9b1bf53375, var_2c3911d4a8350ba7) {
    if (var_d3967d9b1bf53375 < 5 && isdefined(var_2c3911d4a8350ba7)) {
        /#
            if (isarray(var_2c3911d4a8350ba7)) {
                var_2c3911d4a8350ba7 = function_996b01cd49d0128d(var_2c3911d4a8350ba7, "<unknown string>");
            }
            switch (level.var_6492adee56d19067.var_b8cb1cd979acd1a7) {
            case 0:
                println(level.var_6492adee56d19067.var_e7fdad8568d246a9[var_d3967d9b1bf53375] + "<unknown string>" + var_2c3911d4a8350ba7);
                break;
            case 1:
                iprintln(level.var_6492adee56d19067.var_e7fdad8568d246a9[var_d3967d9b1bf53375] + "<unknown string>" + var_2c3911d4a8350ba7);
                break;
            default:
                /#
                    assertmsg("<unknown string>" + function_53c4c53197386572(level.var_6492adee56d19067.var_b8cb1cd979acd1a7, "<unknown string>"));
                #/
                break;
            }
        #/
        level.var_6492adee56d19067.messages[var_d3967d9b1bf53375] = level.var_6492adee56d19067.messages[var_d3967d9b1bf53375] + 1;
    }
}

