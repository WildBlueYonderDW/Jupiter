// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using script_5438ebe20b6ec614;
#using script_638d701d263ee1ed;
#using script_19c169a442d5975a;

#namespace namespace_c19d6eef1c23c28f;

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x1b
function function_b17698b01ef99a95() {
    callback::add("player_region_difficulty_change", &function_f83939ddb2573de8);
    init_internal();
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280
// Size: 0x6a
function function_da135ec070e2e6e8(var_b00bc1491af07dd5, var_7433545f29b128f7, var_25ec1993359bcfdf) {
    root = function_53f47ae03d865dab();
    if (isdefined(var_b00bc1491af07dd5)) {
        root.var_53002f091d94773a = var_b00bc1491af07dd5;
    }
    if (isdefined(var_7433545f29b128f7)) {
        root.var_e190a9f1018c081a = var_7433545f29b128f7;
    }
    if (isdefined(var_25ec1993359bcfdf)) {
        root.var_25ec1993359bcfdf = var_25ec1993359bcfdf;
    }
    init_internal();
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f1
// Size: 0x38
function private init_internal() {
    init_vfx();
    root = function_53f47ae03d865dab();
    level callback::add("player_spawned", &on_player_spawn);
    /#
        level function_5cf9263cdde7f142();
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x330
// Size: 0x74
function private on_player_spawn(params) {
    function_88a46f47b1a8afa8();
    root = function_53f47ae03d865dab();
    thread namespace_6c72573a48881070::function_cb1caaf18300a508();
    if (isdefined(root.var_e190a9f1018c081a)) {
        function_dd25c590d4badd78(root.var_e190a9f1018c081a);
    }
    if (isdefined(root.var_53002f091d94773a)) {
        waitframe();
        namespace_6c72573a48881070::function_27a921508cb04613(root.var_53002f091d94773a, 0.25);
    }
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ab
// Size: 0x76
function private function_f83939ddb2573de8(params) {
    player = params.player;
    var_21ec7a51a6627b28 = params.var_4225006ce1ae149b;
    var_c31923566c85f07 = params.var_eb044317218e44d6;
    player function_dd25c590d4badd78(function_a981dfc82d83237(var_21ec7a51a6627b28));
    player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(var_21ec7a51a6627b28));
    player thread function_bd72e98353976267(var_21ec7a51a6627b28);
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x428
// Size: 0x80
function private function_bd72e98353976267(var_267b90aba888d27d) {
    vision = function_a99354442cd0039f(var_267b90aba888d27d);
    var_5fd6f4e328427746 = self.var_d68047cbd7bc9d3b;
    if (isdefined(var_5fd6f4e328427746) && var_5fd6f4e328427746 == vision) {
        return 0;
    }
    if (istrue(namespace_6c72573a48881070::function_8e888e08a6ab22d3(vision))) {
        return 0;
    }
    if (isdefined(var_5fd6f4e328427746) && var_5fd6f4e328427746 != vision) {
        namespace_6c72573a48881070::function_9a92ae402e209ecc(var_5fd6f4e328427746, 0.25);
        waitframe();
    }
    namespace_6c72573a48881070::function_27a921508cb04613(vision, 0.25);
    self.var_d68047cbd7bc9d3b = vision;
    return 1;
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b0
// Size: 0x72
function private function_a99354442cd0039f(var_267b90aba888d27d) {
    var_406a809d7d37445 = "mp_jup_bigmap_green";
    if (isdefined(var_267b90aba888d27d)) {
        switch (var_267b90aba888d27d) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec":
            var_406a809d7d37445 = "mp_jup_bigmap_red";
            break;
        case #"hash_af83e47edfa8900a":
            var_406a809d7d37445 = "mp_jup_bigmap_yellow";
            break;
        default:
            break;
        }
    }
    return var_406a809d7d37445;
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x52a
// Size: 0xaf
function private function_5cf9263cdde7f142() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_3177516336fdefc3);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_3177516336fdefc3);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_3177516336fdefc3);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_97ec04fd36f9b911);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_46a1a0c6592edc27);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_34ec067faab1f472);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5e0
// Size: 0x85
function private function_3177516336fdefc3(params) {
    /#
        if (!isdefined(params[0]) || is_equal(params[0], "<unknown string>")) {
            return;
        }
        level.player function_dd25c590d4badd78(function_a981dfc82d83237(params[0]));
        level.player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(params[0]));
        level.player thread function_bd72e98353976267(params[0]);
        iprintlnbold("<unknown string>" + function_a99354442cd0039f(params[0]));
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x66c
// Size: 0x82
function private function_34ec067faab1f472(params) {
    /#
        foreach (player in level.players) {
            if (isalive(player) && isplayer(player)) {
                player namespace_6c72573a48881070::function_cb1caaf18300a508();
            }
        }
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6f5
// Size: 0x68
function private function_97ec04fd36f9b911(params) {
    /#
        level.player function_dd25c590d4badd78("<unknown string>");
        level.player function_e6965cda6f8ff5d("<unknown string>");
        level.player function_e6965cda6f8ff5d("<unknown string>");
        level.player namespace_6c72573a48881070::function_27a921508cb04613("<unknown string>", 0.25);
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x764
// Size: 0x91
function private function_46a1a0c6592edc27(params) {
    /#
        foreach (player in level.players) {
            if (isalive(player)) {
                player function_dd25c590d4badd78("<unknown string>");
                player function_e6965cda6f8ff5d("<unknown string>");
                player namespace_6c72573a48881070::function_27a921508cb04613("<unknown string>", 0.5);
            }
        }
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc
// Size: 0xa8
function function_29b46d591982c45a() {
    init_vfx();
    var_17e4f9de4e9c7906 = function_5244353dfc2d15ff();
    level thread namespace_ced1636a962433d2::init(var_17e4f9de4e9c7906);
    level callback::add("player_connect", &on_connect);
    level callback::add("player_region_difficulty_change", &function_3388294e62fdd0bc);
    /#
        level function_1ad29958b0c16235();
    #/
    utility::flag_wait("aether_storm_initialized");
    level.var_24b61da48c7bdf06.radiation callback::add("player_entered_radiation", &function_cecaf5099ed3aa41);
    level.var_24b61da48c7bdf06.radiation callback::add("player_exited_radiation", &function_78983343268efcab);
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ab
// Size: 0xa8
function function_e466816b861caf8b() {
    init_vfx();
    var_17e4f9de4e9c7906 = function_5244353dfc2d15ff();
    level thread namespace_ced1636a962433d2::init(var_17e4f9de4e9c7906);
    level callback::add("player_connect", &on_connect);
    level callback::add("player_spawned", &function_a3ffb5ca860e0fcb);
    /#
        level function_1ad29958b0c16235();
    #/
    utility::flag_wait("aether_storm_initialized");
    level.var_24b61da48c7bdf06.radiation callback::add("player_entered_radiation", &function_cecaf5099ed3aa41);
    level.var_24b61da48c7bdf06.radiation callback::add("player_exited_radiation", &function_a3ffb5ca860e0fcb);
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x95a
// Size: 0x13
function private on_connect(params) {
    function_88a46f47b1a8afa8();
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x974
// Size: 0x40
function private function_88a46f47b1a8afa8() {
    root = function_53f47ae03d865dab();
    if (!isdefined(root.inited)) {
        root.inited = 1;
        if (!istrue(root.var_25ec1993359bcfdf)) {
        }
    }
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bb
// Size: 0x8
function private function_5244353dfc2d15ff() {
    return "jup_ob_moodlist_default";
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9cb
// Size: 0x138
function private function_3388294e62fdd0bc(params) {
    player = params.player;
    var_21ec7a51a6627b28 = params.var_4225006ce1ae149b;
    var_c31923566c85f07 = params.var_eb044317218e44d6;
    if (!isdefined(var_21ec7a51a6627b28)) {
        return;
    }
    if (isdefined(player.var_56b758046d7fc64f) && player.var_56b758046d7fc64f == var_21ec7a51a6627b28) {
        return;
    }
    player endon("death");
    level endon("game_ended");
    /#
        var_1e6ab50ecbd9cfaa = function_a659642818f62c93(var_21ec7a51a6627b28);
        if (isdefined(var_1e6ab50ecbd9cfaa)) {
            iprintlnbold(var_1e6ab50ecbd9cfaa.state.var_5fa416aa85e45ade + "<unknown string>" + var_21ec7a51a6627b28);
        }
    #/
    if (!isdefined(player.var_1bb44c81edf3f3a9) && !istrue(player.var_5872a7af669d9983)) {
        player.var_5872a7af669d9983 = 1;
    }
    player function_dd25c590d4badd78(function_a981dfc82d83237(var_21ec7a51a6627b28));
    player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(var_21ec7a51a6627b28));
    player function_37ff5d03f010f57e(function_a659642818f62c93(var_21ec7a51a6627b28));
    if (istrue(player.var_5872a7af669d9983)) {
        waitframe();
        player.var_5872a7af669d9983 = 0;
    }
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb0a
// Size: 0x41
function private function_cecaf5099ed3aa41(params) {
    player = params.player;
    if (isdefined(player)) {
        player function_dd25c590d4badd78("jup_ob_aether_storm_fx");
        player function_e6965cda6f8ff5d("mp_jup_ob_red_zone_fx");
    }
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb52
// Size: 0x8e
function private function_78983343268efcab(params) {
    player = params.player;
    if (isdefined(player) && isdefined(player.origin)) {
        difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(player.origin);
        player function_dd25c590d4badd78(function_a981dfc82d83237(difficulty));
        player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(difficulty));
        if (istrue(player.var_5872a7af669d9983)) {
            waitframe();
            player.var_5872a7af669d9983 = 0;
        }
    }
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe7
// Size: 0x33
function private function_a3ffb5ca860e0fcb(params) {
    function_dd25c590d4badd78("jup_ob_rift_run_fx");
    function_e6965cda6f8ff5d("mp_jup_ob_red_zone_fx");
    function_37ff5d03f010f57e(namespace_ced1636a962433d2::function_8eb04af4a1b02597(3));
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc21
// Size: 0x6e
function private function_a659642818f62c93(var_fc4ffac4746eb217) {
    var_3139c10f4e00ac55 = 0;
    if (isdefined(var_fc4ffac4746eb217)) {
        switch (var_fc4ffac4746eb217) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec":
            var_3139c10f4e00ac55 = 2;
            break;
        case #"hash_af83e47edfa8900a":
            var_3139c10f4e00ac55 = 1;
            break;
        default:
            break;
        }
    }
    return namespace_ced1636a962433d2::function_8eb04af4a1b02597(var_3139c10f4e00ac55);
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc97
// Size: 0x27
function private function_53f47ae03d865dab() {
    if (!isdefined(level.var_c19d6eef1c23c28f)) {
        level.var_c19d6eef1c23c28f = spawnstruct();
    }
    return level.var_c19d6eef1c23c28f;
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcc6
// Size: 0x173
function private function_1ad29958b0c16235() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_37d964772b906469);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_227fb4c15557c902);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_227fb4c15557c902);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_227fb4c15557c902);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_8d0e7f7fe911132a);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_943833c459d1100);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_227fb4c15557c902);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_227fb4c15557c902);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>", &function_227fb4c15557c902);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_8d0e7f7fe911132a);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_943833c459d1100);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe40
// Size: 0xe0
function private function_227fb4c15557c902(params) {
    /#
        if (!isdefined(params[0]) || is_equal(params[0], "<unknown string>")) {
            return;
        }
        level.player function_dd25c590d4badd78(function_a981dfc82d83237(params[0]));
        level.player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(params[0]));
        if (isdefined(params[1]) && params[1] == "<unknown string>") {
            level.var_5872a7af669d9983 = 1;
            level.var_5feb27af9025d27 = 1;
            level.player function_37ff5d03f010f57e(function_a659642818f62c93(params[0]));
            level.var_5872a7af669d9983 = 0;
            level.var_5feb27af9025d27 = 0;
        } else {
            level.player function_37ff5d03f010f57e(function_a659642818f62c93(params[0]));
        }
        iprintln("<unknown string>" + params[0]);
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf27
// Size: 0xab
function private function_8d0e7f7fe911132a(params) {
    /#
        if (isdefined(params[0]) && params[0] == "<unknown string>") {
            level.var_5872a7af669d9983 = 1;
            level.var_5feb27af9025d27 = 1;
        }
        foreach (player in level.players) {
            if (isalive(player)) {
                player function_a3ffb5ca860e0fcb();
            }
        }
        level.var_5872a7af669d9983 = 0;
        level.var_5feb27af9025d27 = 0;
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xfd9
// Size: 0xac
function private function_943833c459d1100(params) {
    /#
        if (isdefined(params[0]) && params[0] == "<unknown string>") {
            level.var_5872a7af669d9983 = 1;
            level.var_5feb27af9025d27 = 1;
        }
        foreach (player in level.players) {
            function_cecaf5099ed3aa41({player:player});
        }
        level.var_5872a7af669d9983 = 0;
        level.var_5feb27af9025d27 = 0;
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x108c
// Size: 0x45
function private function_37d964772b906469(params) {
    /#
        level.player function_dd25c590d4badd78("<unknown string>");
        level.player function_e6965cda6f8ff5d(undefined);
        level.player function_eb0326e0c8803f41(0);
    #/
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d8
// Size: 0x3
function private init_vfx() {
    
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10e2
// Size: 0x19
function private function_dd25c590d4badd78(var_7433545f29b128f7) {
    utility::function_3677f2be30fdd581("jup_ob_fx", var_7433545f29b128f7);
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1102
// Size: 0x72
function private function_a981dfc82d83237(var_267b90aba888d27d) {
    fx_name = "jup_ob_fx_off";
    if (isdefined(var_267b90aba888d27d)) {
        switch (var_267b90aba888d27d) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec":
            fx_name = "jup_ob_red_zone_fx";
            break;
        case #"hash_af83e47edfa8900a":
            fx_name = "jup_ob_yellow_zone_fx";
            break;
        default:
            break;
        }
    }
    return fx_name;
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x117c
// Size: 0x72
function private function_e6965cda6f8ff5d(var_8acbdb03885a9d78) {
    if (isdefined(self.var_1a56b3933b0e630c) && isdefined(var_8acbdb03885a9d78) && self.var_1a56b3933b0e630c == var_8acbdb03885a9d78) {
        return;
    }
    if (isdefined(self.var_1a56b3933b0e630c)) {
        function_fb39412d7c61e5c7(self.var_1a56b3933b0e630c, 1, self);
        self.var_1a56b3933b0e630c = undefined;
    }
    if (!isdefined(var_8acbdb03885a9d78)) {
        return;
    }
    function_aa6da985e05e2780(var_8acbdb03885a9d78, 1, self);
    self.var_1a56b3933b0e630c = var_8acbdb03885a9d78;
}

// Namespace namespace_c19d6eef1c23c28f/namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11f5
// Size: 0x6e
function private function_d8ad2691db50eb0(var_267b90aba888d27d) {
    var_ebaf68bccbb3010 = undefined;
    if (isdefined(var_267b90aba888d27d)) {
        switch (var_267b90aba888d27d) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec":
            var_ebaf68bccbb3010 = "mp_jup_ob_red_zone_fx";
            break;
        case #"hash_af83e47edfa8900a":
            var_ebaf68bccbb3010 = "mp_jup_ob_yellow_zone_fx";
            break;
        default:
            break;
        }
    }
    return var_ebaf68bccbb3010;
}

