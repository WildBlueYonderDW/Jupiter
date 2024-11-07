#using scripts\cp\utility.gsc;
#using script_187a04151c40fb72;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_3f8889c16399185c;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp\cp_debug.gsc;
#using scripts\cp\cp_agent_utils.gsc;
#using script_25845aca699d038d;
#using script_afb7e332aee4bf2;
#using script_5e5507d57bbbb709;
#using script_116171939929af39;
#using script_3adfc798ed499f31;
#using script_66122a002aff5d57;
#using scripts\common\create_script_utility.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\cp\cp_outline.gsc;
#using script_3bcaa2cbaf54abdd;
#using scripts\cp\loot_system.gsc;
#using script_644c18834356d9dc;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using script_56ef8d52fe1b48a1;
#using scripts\cp_mp\killstreaks\nuke.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_74502a9e0ef1f19c;
#using scripts\engine\trace.gsc;
#using scripts\mp\mp_agent.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace namespace_748fe2e59aef2dea;

/#

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18c
    // Size: 0xc8
    function debuginit() {
        level.devgui_setup_func = &onplayerspawneddevguisetup;
        level thread function_aa8545c4caff39ef();
        level thread function_699304dd575765c9(@"hash_1cee6e7b1ba9672d", &function_1559d3b069709441);
        level thread function_699304dd575765c9(@"debug_nuke", &debug_nuke);
        level thread scripts\cp_mp\utility\debug_utility::function_bb5850f548a9d261();
        setdevdvarifuninitialized(@"hash_5f5c12c95c44f093", 0);
        setdevdvarifuninitialized(@"hash_9a43fe5e759216e2", 0);
        level thread traversal_test();
        level thread function_de48ebe7dd8ff882();
        flag_init("<dev string:x1c>");
        cmd = "<dev string:x2f>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x86>";
        addentrytodevgui(cmd);
        for (;;) {
            wait 0.05;
            scripts\cp\cp_debug::updateminimapsetting();
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x25c
    // Size: 0x7b
    function function_aa8545c4caff39ef() {
        if (flag_exist("<dev string:xe9>")) {
            flag_wait("<dev string:xe9>");
        }
        foreach (player in level.players) {
            player thread function_d8acbb08ac0dc074(player);
        }
        level thread function_d028c8aea81e0fb0();
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2df
    // Size: 0xc2
    function function_d028c8aea81e0fb0() {
        while (true) {
            level waittill("<dev string:xf7>", player);
            if (!isdefined(level.players) || level.players.size <= 0) {
                if (isdefined(level.devgui_setup_func)) {
                    player thread [[ level.devgui_setup_func ]](player);
                }
                continue;
            }
            if (isdefined(level.devgui_setup_func)) {
                foreach (guy in level.players) {
                    guy thread [[ level.devgui_setup_func ]](guy);
                }
            }
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3a9
    // Size: 0x80
    function function_d8acbb08ac0dc074(player) {
        player waittill("<dev string:x101>", player);
        wait 1;
        if (isdefined(level.devgui_setup_func)) {
            foreach (guy in level.players) {
                guy thread [[ level.devgui_setup_func ]](guy);
            }
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x431
    // Size: 0x107
    function debug_circle(center, radius, duration, color, startdelay, var_d5c216e05ee2afc5) {
        circle_sides = 16;
        anglefrac = 360 / circle_sides;
        circlepoints = [];
        for (i = 0; i < circle_sides; i++) {
            angle = anglefrac * i;
            var_8a9f895755fd607e = cos(angle) * radius;
            var_d867033ab311670b = sin(angle) * radius;
            x = center[0] + var_8a9f895755fd607e;
            y = center[1] + var_d867033ab311670b;
            z = center[2];
            circlepoints[circlepoints.size] = (x, y, z);
        }
        if (isdefined(startdelay)) {
            wait startdelay;
        }
        thread function_74b455b83954e07b(circlepoints, duration, color, var_d5c216e05ee2afc5, center);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x540
    // Size: 0xa8
    function function_74b455b83954e07b(circlepoints, duration, color, var_d5c216e05ee2afc5, center) {
        if (!isdefined(var_d5c216e05ee2afc5)) {
            var_d5c216e05ee2afc5 = 0;
        }
        if (!isdefined(center)) {
            var_d5c216e05ee2afc5 = 0;
        }
        for (i = 0; i < circlepoints.size; i++) {
            start = circlepoints[i];
            if (i + 1 >= circlepoints.size) {
                end = circlepoints[0];
            } else {
                end = circlepoints[i + 1];
            }
            thread scripts\cp\cp_debug::debug_line(start, end, duration, color);
            if (var_d5c216e05ee2afc5) {
                thread scripts\cp\cp_debug::debug_line(center, start, duration, color);
            }
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5f0
    // Size: 0x79
    function function_de48ebe7dd8ff882() {
        level waittill("<dev string:x10c>");
        debuginit();
        if (isdefined(level.devgui_setup_func)) {
            foreach (guy in level.players) {
                guy thread [[ level.devgui_setup_func ]](guy);
            }
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x671
    // Size: 0xa9
    function debug_nuke(result) {
        if (isdefined(level.hostmigrationtimer)) {
            return;
        }
        var_fc9ac45209f959bb = scripts\cp\cp_agent_utils::getaliveagentsofteam("<dev string:x11f>");
        foreach (soldier in var_fc9ac45209f959bb) {
            if (!istrue(soldier.var_976f32ce5275baaa)) {
                soldier kill(level.players[0].origin, level.players[0]);
            }
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x722
    // Size: 0x72
    function function_f0c33657d300e414(var_9d4c90f08c9ee5f8) {
        var_b30f056f6acd0fc3 = scripts\cp\cp_agent_utils::getaliveagentsofteam("<dev string:x11f>");
        foreach (guy in var_b30f056f6acd0fc3) {
            guy.scripted_mode = var_9d4c90f08c9ee5f8;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x79c
    // Size: 0xe5d
    function function_1559d3b069709441(itemref) {
        items = strtok(itemref, "<dev string:x124>");
        playertoks = strtok(itemref, "<dev string:x126>");
        args = strtok(itemref, "<dev string:x128>");
        player = undefined;
        if (playertoks.size > 1) {
            playerint = int(playertoks[1]);
            player = level.players[playerint];
        }
        switch (items[0]) {
        case #"hash_e0713abaaea01856":
            for (i = 0; i < level.players.size; i++) {
                level.players[i] namespace_1b51be0488919ce5::enabledeathsdoor();
            }
            break;
        case #"hash_ab563e303c80f69a":
            if (isdefined(level.players[1])) {
                level.players[1] thread namespace_d4aab8c9cb8ecb14::function_a44f7e2d76d0108();
            } else {
                level.players[0] thread namespace_d4aab8c9cb8ecb14::function_a44f7e2d76d0108();
            }
            break;
        case #"hash_751df69b8ed1cae7":
            if (isdefined(level.players[1])) {
                level.players[1] thread namespace_d4aab8c9cb8ecb14::function_3d86b15e0372a8c1();
            } else {
                level.players[0] thread namespace_d4aab8c9cb8ecb14::function_3d86b15e0372a8c1();
            }
            break;
        case #"hash_df6b3b2585101bc7":
            if (function_b19fd14df486e090(items, 1, "<dev string:x162>")) {
                if (isdefined(player)) {
                    player.var_230a3287f9ad2965 = 1;
                    player.shouldskipdeathsshield = 1;
                    player dodamage(player.maxhealth, player.origin);
                } else {
                    for (i = 0; i < level.players.size; i++) {
                        level.players[i].var_230a3287f9ad2965 = 1;
                        level.players[i].shouldskipdeathsshield = 1;
                        level.players[i] dodamage(level.players[i].maxhealth, level.players[i].origin);
                    }
                }
            }
            break;
        case #"hash_e534fd8ec73eafb4":
            if (isdefined(items[1]) && items[1] == "<dev string:x16e>") {
                setdvar(@"hash_b0c572ab1605350a", 1);
            } else if (isdefined(items[1]) && items[1] == "<dev string:x17b>") {
                setdvar(@"hash_b0c572ab1605350a", 0);
            }
            break;
        case #"hash_60ff2e599f07dd6c":
            if (isdefined(items[1]) && items[1] == "<dev string:x18f>") {
                if (isdefined(player)) {
                    player namespace_1f50a6a7107e9381::function_abe664c11f9d4b73();
                } else {
                    for (i = 0; i < level.players.size; i++) {
                        level.players[i] namespace_1f50a6a7107e9381::function_abe664c11f9d4b73();
                    }
                }
            } else if (isdefined(items[1]) && (items[1] == "<dev string:x196>" || items[1] == "<dev string:x19c>" || items[1] == "<dev string:x1a2>")) {
                if (isdefined(player)) {
                    player namespace_1f50a6a7107e9381::function_c3cb4bdae301d5b4("<dev string:x1aa>" + items[1], undefined, undefined, 1);
                } else {
                    for (i = 0; i < level.players.size; i++) {
                        level.players[i] namespace_1f50a6a7107e9381::function_abe664c11f9d4b73();
                    }
                }
            } else if (isdefined(items[1]) && items[1] == "<dev string:x1ae>") {
                if (isdefined(player)) {
                    currentKit = player namespace_1f50a6a7107e9381::function_cc1ccc9e93b22c24();
                    player namespace_1f50a6a7107e9381::function_c3cb4bdae301d5b4(currentKit, 1, undefined, 1);
                    rank = player namespace_1f50a6a7107e9381::function_ca8c9ff1ff9db6e(undefined, 1);
                    announcement("<dev string:x1b3>" + rank);
                }
            }
            break;
        case #"hash_309209099c1d9c73":
            level thread namespace_162cff1cf88b9bbf::function_3543eaafa6b72b85();
            break;
        case #"hash_6daeaf0994ae1479":
            level.players[0] namespace_d4aab8c9cb8ecb14::function_9d6ac1baf6c44970();
            break;
        case #"hash_c1aba9fdbe36d291":
            level thread namespace_88f49e01608e39bf::function_bb0ca5b4f194444a();
            break;
        case #"hash_d1936be15a0595d8":
            dropinfo = namespace_6250b14b3f614101::getitemdropinfo(level.players[0].origin);
            item = namespace_6250b14b3f614101::spawnpickup(args[1], dropinfo);
            item namespace_6250b14b3f614101::function_86321fc8f45c2a9b(1);
            item namespace_6250b14b3f614101::function_b10ee40ed82d45c9(1);
            break;
        case #"hash_ac2bc98328cb0bdb":
            player thread function_ede8c0811092fd7e();
            break;
        case #"hash_afeffb83784fa493":
            scripts\common\create_script_utility::cleanup_cs_file_objects(args[1]);
            break;
        case #"hash_4c9ad5aaf840f8f8":
            if (isdefined(player)) {
                player thread namespace_4fb9dddfb8c1a67a::giveequipment("<dev string:x221>", "<dev string:x235>");
            }
            break;
        case #"hash_3c18ef21854dddc":
            if (istrue(level.mortar_debug)) {
                level.mortar_debug = undefined;
            } else {
                level notify("<dev string:x244>");
                level.mortar_debug = 1;
            }
            break;
        case #"hash_f4cfb31523436f37":
            var_f9788b8e98c2aa1e = "<dev string:x256>";
            var_f9788b8e98c2aa1e += items[1];
            for (i = 2; i < items.size; i++) {
                var_f9788b8e98c2aa1e += "<dev string:x124>" + items[i];
            }
            if (flag_exist(var_f9788b8e98c2aa1e)) {
                flag_set(var_f9788b8e98c2aa1e);
            }
            break;
        case #"hash_ea5a11659959d3fa":
            thread function_3d8bf9aa27135ec7();
            break;
        case #"hash_b5028789f5b468d7":
            if (isdefined(player)) {
                if (player namespace_d4aab8c9cb8ecb14::hasselfrevivetoken()) {
                    player namespace_6250b14b3f614101::removeselfrevivetoken();
                } else {
                    player namespace_6250b14b3f614101::addselfrevivetoken();
                }
            } else {
                for (i = 0; i < level.players.size; i++) {
                    if (level.players[i] namespace_d4aab8c9cb8ecb14::hasselfrevivetoken()) {
                        level.players[i] namespace_6250b14b3f614101::removeselfrevivetoken();
                        continue;
                    }
                    level.players[i] namespace_6250b14b3f614101::addselfrevivetoken();
                }
            }
            break;
        case #"hash_f4a879c6a099e6a3":
            weapon = getsubstr(playertoks[0], 8, itemref.size);
            if (isdefined(player)) {
                if (player isignoremeenabled()) {
                    player allow_player_ignore_me(0);
                } else {
                    player allow_player_ignore_me(1);
                }
            } else {
                foreach (player in level.players) {
                    if (player isignoremeenabled()) {
                        player allow_player_ignore_me(0);
                        continue;
                    }
                    player allow_player_ignore_me(1);
                }
            }
            break;
        case #"hash_819aac6f5ae2fb78":
            itemref = items[1];
            player = level.players[0];
            if (itemref == "<dev string:x274>") {
                level thread function_820980394909e1d0(player);
            }
            break;
        case #"hash_fe3fcfddba61609b":
            level notify("<dev string:x281>");
            if (!isdefined(level.var_ac2adb7e903da3bc)) {
                level.var_ac2adb7e903da3bc = 1;
            } else {
                level.var_ac2adb7e903da3bc = undefined;
            }
            level thread function_f0c33657d300e414(level.var_ac2adb7e903da3bc);
            break;
        case #"hash_56b42909b06107e7":
            level thread function_2a95abf02f97e4d9();
            break;
        case #"hash_2183bc199b5c559d":
            if (isdefined(level.debug_outline)) {
                level.debug_outline = undefined;
                scripts\cp\cp_outline::unset_outline();
                iprintln("<dev string:x2a2>");
            } else {
                level.debug_outline = 1;
                level thread scripts\cp\cp_outline::set_outline("<dev string:x2be>");
                iprintln("<dev string:x2d2>");
            }
            break;
        case #"hash_df41f48a0b41a8aa":
            break;
        case #"hash_8b6f52b74161a558":
            break;
        case #"hash_fab8b4f6bdd4e035":
        case #"hash_fa53d4f6bd8560b5":
            power = getsubstr(playertoks[0], 3, itemref.size);
            if (isdefined(player)) {
                player thread function_54d5d4cc17f56f47(power, "<dev string:x235>");
            } else {
                foreach (player in level.players) {
                    player thread function_54d5d4cc17f56f47(power, "<dev string:x235>");
                }
            }
            break;
        case #"hash_fa27bcf6bd62a8ab":
        case #"hash_fa8c9cf6bdb2282b":
            power = getsubstr(playertoks[0], 3, itemref.size);
            if (isdefined(player)) {
                player thread function_54d5d4cc17f56f47(power, "<dev string:x308>");
            } else {
                foreach (player in level.players) {
                    player thread function_54d5d4cc17f56f47(power, "<dev string:x308>");
                }
            }
            break;
        case #"hash_7b6614415d1b2e48":
            if (itemref[1] == "<dev string:x31b>") {
                if (istrue(level.cooldown_override)) {
                    level.cooldown_override = undefined;
                } else {
                    level notify("<dev string:x327>");
                    level.cooldown_override = 1;
                }
            } else {
                level thread function_73d9eaa6e1027f0();
            }
            break;
        case #"hash_27124c6c97ccffa1":
        case #"hash_e578803bbb7b94a3":
        case #"hash_c61546c10a51754":
        case #"hash_f7ec746c8ba016b4":
        case #"hash_fa412bc481a3043d":
        case #"hash_ab671284a3fc4e3d":
        case #"hash_a6f2bc30ca30e75d":
            break;
        case #"hash_ca51c18a00a0a89c":
            if (getdvar(@"hash_c6850adebe128e2", "<dev string:x256>") == "<dev string:x256>") {
                level notify("<dev string:x362>");
                setdvar(@"hash_c6850adebe128e2", "<dev string:x376>");
            } else {
                level notify("<dev string:x362>");
                setdvar(@"hash_c6850adebe128e2", "<dev string:x256>");
            }
            break;
        case #"hash_80804c8d4d60b774":
            gesture = getsubstr(itemref, 8, itemref.size);
            var_e3fc3c4ab75476a4 = 0;
            foreach (player in level.players) {
                player notify("<dev string:x380>");
                player thread function_ddf400276902cc4c(gesture);
            }
            break;
        case #"hash_217d33e0bf6a240d":
            gesture = getsubstr(itemref, 12, itemref.size);
            var_e3fc3c4ab75476a4 = 0;
            foreach (player in level.players) {
                player notify("<dev string:x380>");
                player thread function_b59fbb83ab7bc4ab(gesture);
            }
            break;
        case #"hash_20abc2900079fb87":
            foreach (player in level.players) {
                player namespace_6c67e93a4c487d83::give_player_xp(int(items[1]), 1);
            }
            break;
        case #"hash_fa66c6f6bd945535":
            foreach (player in level.players) {
                player namespace_6c67e93a4c487d83::give_player_xp(int(items[1]), 1);
            }
            break;
        case #"hash_974c1e9493d997b8":
            foreach (player in level.players) {
                player namespace_6c67e93a4c487d83::set_player_prestige(int(items[1]));
            }
            break;
        case #"hash_1da4229a165378a0":
            foreach (player in level.players) {
                player namespace_6c67e93a4c487d83::set_player_rank(0);
                player namespace_6c67e93a4c487d83::set_player_xp(0);
                player namespace_6c67e93a4c487d83::set_player_prestige(0);
            }
            break;
        case #"hash_6f080666c0ee9d9f":
            var_d5b78e9654ad7150 = items[1];
            level thread function_64a0dbcbf99e6f9d(var_d5b78e9654ad7150);
            break;
        case #"hash_a2937f8adf677a96":
            foreach (player in level.players) {
                player namespace_6c67e93a4c487d83::give_player_currency(25000);
            }
            break;
        case #"hash_fe7a56a0d5738fc1":
            foreach (player in level.players) {
                if (items.size == 3) {
                    munition = items[1] + "<dev string:x124>" + items[2];
                } else {
                    munition = items[1];
                }
                if (scripts\cp\loot_system::is_empty_or_none(0)) {
                    player namespace_94359011b63230a6::give_munition_to_slot(munition, 0);
                } else if (function_240f7f4e57340e8f()) {
                    player thread namespace_1f50a6a7107e9381::function_4a1fd54affdaa367(munition, 1, 0, 0, 1);
                } else {
                    player thread namespace_94359011b63230a6::give_munition_to_slot(munition, 1);
                }
                player notify("<dev string:x3d9>");
            }
            break;
        case #"hash_ccb7ac0211160bf3":
            if (isdefined(player)) {
                player notify("<dev string:x3fa>");
            }
            break;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1601
    // Size: 0x2c
    function function_b19fd14df486e090(var_2d385bc9ad36a118, index, value) {
        return isdefined(var_2d385bc9ad36a118[index]) && var_2d385bc9ad36a118[index] == value;
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1635
    // Size: 0x54
    function function_ede8c0811092fd7e() {
        level endon("<dev string:x407>");
        self endon("<dev string:x101>");
        self setclientomnvar("<dev string:x412>", -1);
        self setclientomnvar("<dev string:x41e>", 2);
        waittill_any_2("<dev string:x42e>", "<dev string:x43c>");
        wait 0.25;
        self setclientomnvar("<dev string:x412>", -2);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1691
    // Size: 0xd5
    function function_64a0dbcbf99e6f9d(var_d5b78e9654ad7150) {
        level endon("<dev string:x407>");
        println("<dev string:x450>");
        println("<dev string:x481>" + var_d5b78e9654ad7150);
        println("<dev string:x450>");
        var_8c934bb344dc69e3 = 8;
        var_c7d1b7b8d19ba156 = level.players.size;
        if (var_c7d1b7b8d19ba156 == var_8c934bb344dc69e3) {
            iprintlnbold("<dev string:x49a>" + var_c7d1b7b8d19ba156 + "<dev string:x4a8>");
            return;
        }
        if (istrue(level.var_8de7cfbce88fff85)) {
            return;
        }
        level.var_8de7cfbce88fff85 = 1;
        var_d57f35c33d655d4b = min(var_8c934bb344dc69e3 - var_c7d1b7b8d19ba156, int(var_d5b78e9654ad7150));
        for (i = 0; i < var_d57f35c33d655d4b; i++) {
            function_ca3d5c40fd2b74a();
            wait 0.2;
        }
        level.var_8de7cfbce88fff85 = undefined;
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x176e
    // Size: 0x80
    function function_ca3d5c40fd2b74a() {
        tc = undefined;
        while (true) {
            tc = addtestclient();
            if (isdefined(tc)) {
                break;
            }
            println("<dev string:x4be>");
            wait 1;
        }
        connecting = spawnstruct();
        connecting.tc = tc;
        connecting.ready = 0;
        connecting.abort = 0;
        connecting.tc thread inittestclientlatent();
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x17f6
    // Size: 0x3c
    function inittestclientlatent() {
        while (!self canspawnbotortestclient()) {
            waitframe();
            if (!isdefined(self)) {
                return;
            }
        }
        self spawnbotortestclient();
        if (getdvarint(@"hash_55c81a85c562a11f", 0) != 0) {
            thread function_7c47b94209827432(self);
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x183a
    // Size: 0x3a
    function function_7c47b94209827432(var_1d7355cdbac5b871) {
        while (true) {
            sphere(var_1d7355cdbac5b871.origin, 100, (0, 1, 0), 0, 2);
            waitframe();
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x187c
    // Size: 0x72
    function function_ddf400276902cc4c(gesture) {
        level endon("<dev string:x407>");
        self endon("<dev string:x101>");
        self endon("<dev string:x380>");
        self notifyonplayercommand("<dev string:x4ef>", "<dev string:x503>");
        var_e3fc3c4ab75476a4 = 0;
        iprintln("<dev string:x511>" + gesture + "<dev string:x52a>");
        while (true) {
            self waittill("<dev string:x4ef>");
            self playgestureviewmodel(gesture, undefined, var_e3fc3c4ab75476a4, 0.5);
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x18f6
    // Size: 0x6d
    function function_b59fbb83ab7bc4ab(weapon) {
        level endon("<dev string:x407>");
        self endon("<dev string:x101>");
        self endon("<dev string:x380>");
        self notifyonplayercommand("<dev string:x4ef>", "<dev string:x503>");
        var_e3fc3c4ab75476a4 = 0;
        iprintln("<dev string:x511>" + weapon + "<dev string:x52a>");
        while (true) {
            self waittill("<dev string:x4ef>");
            thread firegesturegrenade(self, weapon);
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x196b
    // Size: 0x6c
    function function_66d023795a43c715() {
        if (isdefined(level.var_e3f40cd279339928)) {
            foreach (item in level.var_e3f40cd279339928) {
                item destroy();
            }
        }
        level.var_e3f40cd279339928 = [];
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19df
    // Size: 0x3e4
    function function_3d8bf9aa27135ec7() {
        level notify("<dev string:x533>");
        level notify("<dev string:x548>");
        level endon("<dev string:x548>");
        level endon("<dev string:x533>");
        function_66d023795a43c715();
        if (istrue(level.var_5971f579c15e2d5)) {
            level.var_5971f579c15e2d5 = undefined;
            return;
        } else {
            level.var_5971f579c15e2d5 = 1;
        }
        var_fb118aca74cba38e = newhudelem();
        var_fb118aca74cba38e.location = 0;
        var_fb118aca74cba38e.foreground = 1;
        var_fb118aca74cba38e.fontscale = 0.7;
        var_fb118aca74cba38e.sort = 20;
        var_fb118aca74cba38e.alpha = 0;
        var_fb118aca74cba38e.x = -100;
        var_fb118aca74cba38e.y = 0;
        level.var_e3f40cd279339928[level.var_e3f40cd279339928.size] = var_fb118aca74cba38e;
        var_fb118bca74cba5c1 = newhudelem();
        var_fb118bca74cba5c1.location = 0;
        var_fb118bca74cba5c1.foreground = 1;
        var_fb118bca74cba5c1.fontscale = 0.7;
        var_fb118bca74cba5c1.sort = 20;
        var_fb118bca74cba5c1.alpha = 0;
        var_fb118bca74cba5c1.x = -100;
        var_fb118bca74cba5c1.y = 10;
        level.var_e3f40cd279339928[level.var_e3f40cd279339928.size] = var_fb118bca74cba5c1;
        var_fb1188ca74cb9f28 = newhudelem();
        var_fb1188ca74cb9f28.location = 0;
        var_fb1188ca74cb9f28.foreground = 1;
        var_fb1188ca74cb9f28.fontscale = 0.7;
        var_fb1188ca74cb9f28.sort = 20;
        var_fb1188ca74cb9f28.alpha = 0;
        var_fb1188ca74cb9f28.x = -100;
        var_fb1188ca74cb9f28.y = 20;
        level.var_e3f40cd279339928[level.var_e3f40cd279339928.size] = var_fb1188ca74cb9f28;
        var_fb1189ca74cba15b = newhudelem();
        var_fb1189ca74cba15b.location = 0;
        var_fb1189ca74cba15b.foreground = 1;
        var_fb1189ca74cba15b.fontscale = 0.7;
        var_fb1189ca74cba15b.sort = 20;
        var_fb1189ca74cba15b.alpha = 0;
        var_fb1189ca74cba15b.x = -100;
        var_fb1189ca74cba15b.y = 30;
        level.var_e3f40cd279339928[level.var_e3f40cd279339928.size] = var_fb1189ca74cba15b;
        while (true) {
            for (i = 0; i < level.players.size; i++) {
                var_92ae92da3e2da03b = "<dev string:x556>";
                if (isdefined(level.players[i].var_fda6e62e0765c0f4) && level.players[i].var_fda6e62e0765c0f4.size >= 1) {
                    var_92ae92da3e2da03b = "<dev string:x55d>" + level.players[i].var_fda6e62e0765c0f4[0];
                    foreach (item in level.players[i].var_fda6e62e0765c0f4) {
                        if (index == 0) {
                            continue;
                        }
                        var_92ae92da3e2da03b += "<dev string:x560>" + item;
                    }
                }
                level.var_e3f40cd279339928[i].alpha = 1;
                level.var_e3f40cd279339928[i] setdevtext("<dev string:x568>" + level.players[i].name + "<dev string:x56b>" + "<dev string:x56e>" + "<dev string:x572>" + getcompleteweaponname(level.players[i] getcurrentweapon()) + "<dev string:x575>" + var_92ae92da3e2da03b);
            }
            wait 1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dcb
    // Size: 0x35
    function function_54d5d4cc17f56f47(equipment, slot) {
        if (slot == "<dev string:x308>") {
            namespace_4fb9dddfb8c1a67a::giveequipment(equipment, slot);
            return;
        }
        namespace_4fb9dddfb8c1a67a::giveequipment(equipment, slot);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e08
    // Size: 0x47
    function function_73d9eaa6e1027f0() {
        if (isdefined(level.var_2824d9ed9338d048)) {
            level.var_2824d9ed9338d048 = undefined;
            level.powershortcooldown = undefined;
            return;
        }
        level notify("<dev string:x583>");
        level.var_2824d9ed9338d048 = 1;
        level.powershortcooldown = 1;
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e57
    // Size: 0x95
    function function_8349169ca175da89(str, color) {
        if (!isdefined(color)) {
            color = (255, 255, 255);
        }
        self notify("<dev string:x598>");
        level endon("<dev string:x407>");
        self endon("<dev string:x5a8>");
        self endon("<dev string:x598>");
        var_fb0310c3eefd5e4d = 0;
        while (var_fb0310c3eefd5e4d < 60) {
            var_191599aed14aafe6 = self.origin + (0, 0, 48);
            print3d(var_191599aed14aafe6, str, color, 1, 1);
            var_fb0310c3eefd5e4d++;
            wait 0.05;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ef4
    // Size: 0x7a
    function function_5a8be901363195e6() {
        setdvar(@"r_hudoutlineFillColor0", "<dev string:x5ae>");
        setdvar(@"r_hudoutlineFillColor1", "<dev string:x5b9>");
        setdvar(@"r_hudoutlineOccludedOutlineColor", "<dev string:x5c2>");
        setdvar(@"r_hudoutlineOccludedInlineColor", "<dev string:x5ce>");
        setdvar(@"r_hudoutlineOccludedInteriorColor", "<dev string:x5d9>");
        setdvar(@"r_hudOutlineOccludedColorFromFill", 1);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f76
    // Size: 0x1d3
    function function_2a95abf02f97e4d9() {
        if (!flag("<dev string:x5e1>")) {
            flag_wait("<dev string:x5e1>");
        }
        if (!flag("<dev string:x5f5>")) {
            flag_wait("<dev string:x5f5>");
        }
        items = getstructarray("<dev string:x31b>", "<dev string:x60b>");
        items = sortbydistance(items, level.players[0].origin);
        zones = getentarray("<dev string:x616>", "<dev string:x60b>");
        area = undefined;
        println("<dev string:x623>");
        foreach (item in items) {
            if (!isdefined(item.name)) {
                wait 0.05;
                continue;
            }
            if (item.name == "<dev string:x66c>") {
                foreach (zone in zones) {
                    if (ispointinvolume(item.origin, zone)) {
                        area = zone;
                        break;
                    }
                }
                println(item.script_noteworthy + "<dev string:x675>" + area.basename + "<dev string:x56e>" + item.origin + "<dev string:x67b>" + level.interactions[item.script_noteworthy].cost);
            }
        }
        println("<dev string:x623>");
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x2151
    // Size: 0x16
    function function_820980394909e1d0(player, seatid) {
        
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x216f
    // Size: 0x1b7
    function function_479b34b1e0b9bca(guy) {
        guy endon("<dev string:x5a8>");
        if (getdvar(@"hash_4ac136ddbca2d9d8", "<dev string:x685>") == "<dev string:x685>") {
            return;
        }
        starting_pos = (0, 0, 72);
        offset = (0, 0, -8);
        var_6ab199e209d55ca0 = [];
        while (true) {
            if (isdefined(guy.var_25b46137084e8f4f)) {
                counter = 0;
                foreach (asmname, var_e84621d0fbb9408d in guy.var_25b46137084e8f4f) {
                    if (!scripts\engine\utility::array_contains(var_6ab199e209d55ca0, guy.var_25b46137084e8f4f[asmname].var_293af010052e93ca)) {
                        println("<dev string:x687>");
                        println("<dev string:x6bd>" + guy.var_25b46137084e8f4f[asmname].var_293af010052e93ca);
                        println("<dev string:x687>");
                        var_6ab199e209d55ca0[var_6ab199e209d55ca0.size] = guy.var_25b46137084e8f4f[asmname].var_293af010052e93ca;
                    }
                    pos = starting_pos + counter * offset;
                    print3d(guy.origin + pos, "<dev string:x6c7>" + asmname + "<dev string:x6cc>" + guy.var_25b46137084e8f4f[asmname].var_293af010052e93ca, (0.8, 0.3, 0), 1, 0.4, 1);
                    counter++;
                }
            }
            waitframe();
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x232e
    // Size: 0xbf
    function onplayerspawneddevguisetup(player) {
        playername = player.name;
        playernum = undefined;
        if (!isdefined(level.players) || level.players.size <= 0) {
            playernum = 0;
        } else {
            foreach (guy in level.players) {
                if (guy == player) {
                    playernum = int(index);
                    break;
                }
            }
        }
        if (isdefined(playernum)) {
            player thread setupdevguientries(player, playername, playernum);
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x23f5
    // Size: 0xea
    function setupdevguientries(player, name, num) {
        player thread function_dafd118808f0b454(player, name, num);
        player thread function_4b1729191c1cb70e(player, name, num);
        player thread function_708486c040194410(player, name, num);
        player thread function_d87e1e35d2489bbd(player, name, num);
        player thread function_3df260d02a8b80b8(player, name, num);
        player thread function_91f322ea6e260b5(player, name, num);
        player thread function_79be5189da2cd8a1(player, name, num);
        player thread function_6229249f8fe9d964(player, name, num);
        player thread function_8de7cf646dc4d70b(player, name, num);
        player thread function_8917ac39ebff34c5(player, name, num);
        player thread function_93d6ca5e374f1fc1(player, name, num);
        player thread function_f072024057cb6337(player, name, num);
        player thread function_b38a5be1f066c94b(player, name, num);
        player thread function_f2c7f65e88d51c6f(player, name, num);
        player thread function_104d4cbe8bab9fe3(player, name, num);
        player thread function_711d30eca76e8787(player, name, num);
        player thread function_155ac860c7fd00aa(player, name, num);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x24e7
    // Size: 0x102
    function function_dafd118808f0b454(player, playername, ip1) {
        if (is_specops_gametype()) {
            return;
        }
        flag_wait("<dev string:x6cf>");
        setdvarifuninitialized(@"hash_2e4537ecf3b8864f", 0);
        player thread function_d883c7a0295ccd92();
        player thread function_7538161c9f63be60();
        player thread rank_up();
        cmd = "<dev string:x6e8>";
        addentrytodevgui(cmd);
        counter = 0;
        foreach (array in level.scoreinfo) {
            typename = function_3c8848a3a11b2553(type);
            cmd = "<dev string:x730>" + typename + "<dev string:x763>" + typename + "<dev string:x77d>";
            addentrytodevgui(cmd);
            counter++;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x25f1
    // Size: 0xb8
    function rank_up() {
        self notify("<dev string:x781>");
        self endon("<dev string:x781>");
        while (true) {
            if (getdvarint(@"hash_46c23f34012ec0ef", 0) != 0) {
                currank = level.players[0] namespace_5aac85eab99c40a::getrank();
                if (currank != level.maxrank) {
                    curxp = level.players[0] getrankxp();
                    neededxp = getrankinfomaxxp(currank) - curxp;
                    level.players[0] thread namespace_5aac85eab99c40a::giverankxp(#"kill", neededxp);
                }
                setdevdvar(@"hash_46c23f34012ec0ef", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x26b1
    // Size: 0xbb
    function function_7538161c9f63be60() {
        self notify("<dev string:x789>");
        self endon("<dev string:x789>");
        while (true) {
            dvarvalue = getdvar(@"hash_4fc6daf665167bfe", "<dev string:x256>");
            while (true) {
                if (getdvar(@"hash_4fc6daf665167bfe") != dvarvalue) {
                    break;
                }
                wait 1;
            }
            event = getdvar(@"hash_4fc6daf665167bfe");
            if (!function_d03495fe6418377b(event)) {
                event = function_1823ff50bb28148d(event);
            }
            points = namespace_5aac85eab99c40a::getscoreinfovalue(event);
            thread namespace_5aac85eab99c40a::giverankxp(event, points);
            setdvar(@"hash_4fc6daf665167bfe", "<dev string:x256>");
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2774
    // Size: 0x2d6
    function function_d883c7a0295ccd92() {
        self notify("<dev string:x797>");
        self endon("<dev string:x797>");
        prevxp = getrankxp();
        notbot = self;
        while (true) {
            dvarvalue = getdvarint(@"hash_2e4537ecf3b8864f");
            while (true) {
                if (getdvarint(@"hash_2e4537ecf3b8864f") != dvarvalue) {
                    break;
                }
                wait 1;
            }
            switch (getdvarint(@"hash_2e4537ecf3b8864f")) {
            case 0:
                notbot notify("<dev string:x7a6>");
                if (isdefined(notbot.var_450ee4f468089512)) {
                    notbot.var_450ee4f468089512 destroyelem();
                }
                if (isdefined(notbot.var_44cdc709e589d8b9)) {
                    notbot.var_44cdc709e589d8b9 destroyelem();
                }
                level.playerxpenabled = 0;
                notbot.pers["<dev string:x7b6>"] = notbot getplayerdata("<dev string:x7bd>", "<dev string:x7c8>", "<dev string:x7d5>");
                prestige = notbot getplayerdata("<dev string:x7df>", "<dev string:x7e6>", "<dev string:x7f4>", "<dev string:x3a9>");
                if (!isdefined(notbot.pers["<dev string:x800>"])) {
                    notbot.pers["<dev string:x800>"] = 0;
                }
                continue;
            case 1:
                notbot.var_450ee4f468089512 = notbot createprimaryprogressbar(200, 200);
                notbot.var_44cdc709e589d8b9 = notbot createprimaryprogressbartext(200, 200);
                notbot.var_44cdc709e589d8b9 settext("<dev string:x812>");
                notbot thread function_c932c71bd99a784a();
                level.playerxpenabled = 1;
                if (level.playerxpenabled) {
                    notbot.pers["<dev string:x7b6>"] = notbot getplayerdata("<dev string:x7bd>", "<dev string:x7c8>", "<dev string:x7d5>");
                    prestige = notbot getplayerdata("<dev string:x7df>", "<dev string:x7e6>", "<dev string:x7f4>", "<dev string:x3a9>");
                    if (!isdefined(notbot.pers["<dev string:x800>"])) {
                        notbot.pers["<dev string:x800>"] = 0;
                    }
                    currxp = getrankxp();
                    rank = getrankforxp(currxp);
                    minxp = getrankinfominxp(rank);
                    nextxp = getrankinfoxpamt(rank);
                    barfrac = (currxp - minxp) / nextxp;
                    if (barfrac > 1) {
                        barfrac = 1;
                    }
                    self.var_450ee4f468089512 updatebar(barfrac, 0);
                }
                continue;
            default:
                continue;
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2a52
    // Size: 0xd9
    function function_c932c71bd99a784a() {
        level endon("<dev string:x407>");
        self endon("<dev string:x7a6>");
        prevxp = getrankxp();
        while (true) {
            currxp = getrankxp();
            if (prevxp != currxp) {
                rank = getrankforxp(currxp);
                minxp = getrankinfominxp(rank);
                nextxp = getrankinfoxpamt(rank);
                barfrac = (currxp - minxp) / nextxp;
                if (barfrac > 1) {
                    barfrac = 1;
                }
                self.var_450ee4f468089512 updatebar(barfrac, 0);
                prevxp = currxp;
                self.var_44cdc709e589d8b9 settext("<dev string:x81c>" + currxp + "<dev string:x827>" + nextxp + "<dev string:x834>" + rank + 1);
            }
            waitframe();
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b33
    // Size: 0x5b
    function function_4b1729191c1cb70e(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_1b2b3be864823718();
        cmd = "<dev string:x83b>" + playername + "<dev string:x855>" + ip1 + "<dev string:x77d>";
        addentrytodevgui(cmd);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b96
    // Size: 0x67
    function function_1b2b3be864823718() {
        self notify("<dev string:x886>");
        self endon("<dev string:x886>");
        while (true) {
            var_dc8309190668e7b1 = getdvar(@"hash_6cceeb64d45cccd", "<dev string:x256>");
            if (var_dc8309190668e7b1 != "<dev string:x256>") {
                scripts\cp_mp\killstreaks\juggernaut::tryusejuggernaut(1);
                setdvar(@"hash_6cceeb64d45cccd", "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2c05
    // Size: 0x5b
    function function_708486c040194410(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_1441206cc9a8ae6c();
        cmd = "<dev string:x83b>" + playername + "<dev string:x89b>" + ip1 + "<dev string:x77d>";
        addentrytodevgui(cmd);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2c68
    // Size: 0x66
    function function_1441206cc9a8ae6c() {
        self notify("<dev string:x8c7>");
        self endon("<dev string:x8c7>");
        while (true) {
            var_dc8309190668e7b1 = getdvar(@"hash_c593d7de8cb2698d", "<dev string:x256>");
            if (var_dc8309190668e7b1 != "<dev string:x256>") {
                thread namespace_44edfb3e2b433c17::function_6b384ba557a25934();
                setdvar(@"hash_c593d7de8cb2698d", "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2cd6
    // Size: 0x5b
    function function_93d6ca5e374f1fc1(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_64fd756c73647b0f();
        cmd = "<dev string:x83b>" + playername + "<dev string:x8eb>" + ip1 + "<dev string:x77d>";
        addentrytodevgui(cmd);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2d39
    // Size: 0x65
    function function_64fd756c73647b0f() {
        self notify("<dev string:x913>");
        self endon("<dev string:x913>");
        while (true) {
            var_dc8309190668e7b1 = getdvar(@"hash_68fc287b704f98ca", "<dev string:x256>");
            if (var_dc8309190668e7b1 != "<dev string:x256>") {
                scripts\cp_mp\killstreaks\nuke::tryusenuke();
                setdvar(@"hash_68fc287b704f98ca", "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2da6
    // Size: 0x5a
    function function_155ac860c7fd00aa(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_6557ba532305ceea();
        cmd = "<dev string:x924>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x97d>";
        addentrytodevgui(cmd);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2e08
    // Size: 0x6b
    function function_6557ba532305ceea() {
        self notify("<dev string:x9e2>");
        self endon("<dev string:x9e2>");
        setdvarifuninitialized(@"hash_985a6eb7146ff86e", 0);
        setdvarifuninitialized(@"hash_8beca11d7b55550e", 0);
        while (true) {
            var_fd3b6539095a87f8 = getdvarint(@"hash_985a6eb7146ff86e", 0);
            if (var_fd3b6539095a87f8 != 0) {
                level thread scripts\cp\cp_debug::function_c8ce49adbbdfe59b();
            }
            wait 0.05;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2e7b
    // Size: 0x67
    function function_6229249f8fe9d964(player, playername, ip1) {
        var_89d75b24ca02680a = "<dev string:x83b>" + playername + "<dev string:x9f7>" + ip1 + "<dev string:xa42>";
        addentrytodevgui(var_89d75b24ca02680a);
        thread function_c8eccd66a1715ec3(ip1);
        var_89d75a24ca0265d7 = "<dev string:xa45>";
        addentrytodevgui(var_89d75a24ca0265d7);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2eea
    // Size: 0xb9
    function function_c8eccd66a1715ec3(ip1) {
        level endon("<dev string:x407>");
        self notify("<dev string:xaaf>");
        self endon("<dev string:xaaf>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(@"hash_a9731006e5999532", -1);
        while (true) {
            var_de67598f57ba7a81 = getdvarint(@"hash_a9731006e5999532", -1);
            if (var_de67598f57ba7a81 != -1) {
                if (var_de67598f57ba7a81 == ip1) {
                    if (istrue(self.inlaststand)) {
                        thread function_77492b4a8d785f9b(self);
                    } else if (isdefined(self.dogtag)) {
                        namespace_d4aab8c9cb8ecb14::instant_revive(self);
                        self notify("<dev string:xac4>");
                    }
                    setdvar(@"hash_a9731006e5999532", -1);
                }
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2fab
    // Size: 0x47
    function function_77492b4a8d785f9b(downedplayer) {
        downedplayer namespace_d4aab8c9cb8ecb14::finishreviveplayer("<dev string:xad8>", downedplayer);
        if (istrue(downedplayer.var_b24e609023ce8208)) {
            downedplayer.var_b24e609023ce8208 = undefined;
            return;
        }
        downedplayer notify("<dev string:xaec>");
        downedplayer notify("<dev string:xac4>");
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2ffa
    // Size: 0x77
    function function_8de7cf646dc4d70b(player, playername, ip1) {
        var_89d75b24ca02680a = "<dev string:x83b>" + playername + "<dev string:xaff>" + ip1 + "<dev string:xa42>";
        var_89d75a24ca0265d7 = "<dev string:x83b>" + playername + "<dev string:xb37>" + ip1 + "<dev string:xa42>";
        addentrytodevgui(var_89d75b24ca02680a);
        addentrytodevgui(var_89d75a24ca0265d7);
        thread function_d7263ea139cf4ec9(ip1);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x3079
    // Size: 0x3e
    function function_8917ac39ebff34c5(player, playername, ip1) {
        var_89d75b24ca02680a = "<dev string:x83b>" + playername + "<dev string:xb72>";
        addentrytodevgui(var_89d75b24ca02680a);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x30bf
    // Size: 0x9f
    function function_d7263ea139cf4ec9(ip1) {
        level endon("<dev string:x407>");
        self notify("<dev string:xbaa>");
        self endon("<dev string:xbaa>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(@"hash_1a3b7bfa8b28ddd9", -1);
        while (true) {
            var_4f9df27618277b1e = getdvarint(@"hash_1a3b7bfa8b28ddd9", -1);
            if (var_4f9df27618277b1e != -1) {
                if (var_4f9df27618277b1e == ip1) {
                    setdvar(@"hash_1a3b7bfa8b28ddd9", -1);
                    self.var_6a91d0e80cc504e = 1;
                    kick(self getentitynumber(), "<dev string:xbc2>");
                }
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x3166
    // Size: 0x133
    function function_d87e1e35d2489bbd(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_8b22b513ea60f11e(ip1, 0);
        player thread function_8b22b513ea60f11e(ip1, 1);
        player thread function_8b22b513ea60f11e(ip1, 2);
        player thread function_8b22b513ea60f11e(ip1, 3);
        var_89d75b24ca02680a = "<dev string:x83b>" + playername + "<dev string:xbdf>" + ip1 + "<dev string:xa42>";
        var_89d75a24ca0265d7 = "<dev string:x83b>" + playername + "<dev string:xc26>" + ip1 + "<dev string:xa42>";
        var_89d75924ca0263a4 = "<dev string:x83b>" + playername + "<dev string:xc6d>" + ip1 + "<dev string:xa42>";
        var_89d75824ca026171 = "<dev string:x83b>" + playername + "<dev string:xcb4>" + ip1 + "<dev string:xa42>";
        addentrytodevgui(var_89d75b24ca02680a);
        addentrytodevgui(var_89d75a24ca0265d7);
        addentrytodevgui(var_89d75924ca0263a4);
        addentrytodevgui(var_89d75824ca026171);
        level thread function_cb19d47a9bbe348();
        var_89d75724ca025f3e = "<dev string:x83b>" + playername + "<dev string:xcfb>" + ip1 + "<dev string:xa42>";
        addentrytodevgui(var_89d75724ca025f3e);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x32a1
    // Size: 0x1a7
    function function_8b22b513ea60f11e(ip1, var_eefe729306ff3256) {
        self notify("<dev string:xd3f>" + ip1 + "<dev string:x124>" + var_eefe729306ff3256);
        self endon("<dev string:xd3f>" + ip1 + "<dev string:x124>" + var_eefe729306ff3256);
        self endon("<dev string:x101>");
        dvarname = hashcat(@"hash_77d700d951c18d6d", var_eefe729306ff3256);
        var_83be170f54304b94 = 0;
        while (true) {
            var_17dd2d8cd6087d67 = getdvar(dvarname, "<dev string:x256>");
            if (var_17dd2d8cd6087d67 != "<dev string:x256>") {
                if (int(var_17dd2d8cd6087d67) == ip1) {
                    if (var_eefe729306ff3256 == ip1 || int(var_17dd2d8cd6087d67) == var_eefe729306ff3256) {
                        self iprintlnbold("<dev string:xd53>" + var_eefe729306ff3256 + "<dev string:xd61>");
                    } else if (isdefined(level.players[var_eefe729306ff3256]) && isplayer(level.players[var_eefe729306ff3256])) {
                        self setorigin(level.players[var_eefe729306ff3256].origin);
                        self setplayerangles(level.players[var_eefe729306ff3256] getplayerangles());
                        stance = level.players[var_eefe729306ff3256] getstance();
                        if (isdefined(stance)) {
                            self setstance(stance, 1, 1);
                        }
                    } else {
                        self iprintlnbold("<dev string:xd53>" + var_eefe729306ff3256 + "<dev string:xd72>");
                    }
                    setdvar(dvarname, "<dev string:x256>");
                    var_83be170f54304b94 = 0;
                }
                var_83be170f54304b94++;
                if (var_83be170f54304b94 > level.players.size + 1) {
                    setdvar(dvarname, "<dev string:x256>");
                    var_83be170f54304b94 = 0;
                    announcement("<dev string:xd53>" + var_eefe729306ff3256 + "<dev string:xd72>");
                }
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3450
    // Size: 0xa6
    function function_cb19d47a9bbe348() {
        level notify("<dev string:xd7f>");
        level endon("<dev string:xd7f>");
        while (true) {
            var_de67598f57ba7a81 = getdvar(@"hash_ca0c5f76e99af4c5", "<dev string:x256>");
            if (var_de67598f57ba7a81 != "<dev string:x256>") {
                for (i = 0; i < level.players.size; i++) {
                    if (isdefined(level.players[i])) {
                        level.players[i] iprintlnbold("<dev string:xd98>" + i);
                    }
                }
                setdvar(@"hash_ca0c5f76e99af4c5", "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x34fe
    // Size: 0x5c
    function function_79be5189da2cd8a1(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_b4c9318e9e615135(ip1);
        var_89d75b24ca02680a = "<dev string:x83b>" + playername + "<dev string:xda4>" + ip1 + "<dev string:xa42>";
        addentrytodevgui(var_89d75b24ca02680a);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3562
    // Size: 0x84
    function function_b4c9318e9e615135(ip1) {
        self notify("<dev string:xdf3>");
        self endon("<dev string:xdf3>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(@"hash_fab427697d5df265", -1);
        while (true) {
            var_de67598f57ba7a81 = getdvarint(@"hash_fab427697d5df265", -1);
            if (var_de67598f57ba7a81 != -1) {
                if (var_de67598f57ba7a81 == ip1) {
                    thread scripts\cp\cp_debug::function_695edac42cd3e5();
                    setdvar(@"hash_fab427697d5df265", -1);
                }
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x35ee
    // Size: 0xc0
    function function_3df260d02a8b80b8(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_f2a111d7bd870c3e(ip1);
        player thread function_8eae4a8b95372738(ip1);
        player thread function_3c048e3631577168(ip1);
        var_89d75b24ca02680a = "<dev string:x83b>" + playername + "<dev string:xe13>" + ip1 + "<dev string:xe52>";
        var_89d75a24ca0265d7 = "<dev string:x83b>" + playername + "<dev string:xe57>" + ip1 + "<dev string:xe52>";
        var_89d75924ca0263a4 = "<dev string:x83b>" + playername + "<dev string:xe9e>" + ip1 + "<dev string:xe52>";
        addentrytodevgui(var_89d75b24ca02680a);
        addentrytodevgui(var_89d75a24ca0265d7);
        addentrytodevgui(var_89d75924ca0263a4);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x36b6
    // Size: 0x9c
    function function_f2a111d7bd870c3e(ip1) {
        self notify("<dev string:xeea>");
        self endon("<dev string:xeea>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(hashcat(@"hash_a19487f14a991443", ip1), "<dev string:x256>");
        while (true) {
            var_de67598f57ba7a81 = getdvar(hashcat(@"hash_a19487f14a991443", ip1), "<dev string:x256>");
            if (var_de67598f57ba7a81 != "<dev string:x256>") {
                thread scripts\cp\cp_debug::function_6eafd30d4e01bd76();
                setdvar(hashcat(@"hash_a19487f14a991443", ip1), "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x375a
    // Size: 0x9e
    function function_8eae4a8b95372738(ip1) {
        self notify("<dev string:xf01>");
        self endon("<dev string:xf01>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(hashcat(@"hash_8d7e52b4bde27ab5", ip1), "<dev string:x256>");
        while (true) {
            var_de67598f57ba7a81 = getdvar(hashcat(@"hash_8d7e52b4bde27ab5", ip1), "<dev string:x256>");
            if (var_de67598f57ba7a81 != "<dev string:x256>") {
                thread scripts\cp\cp_debug::function_6eafd30d4e01bd76(10);
                setdvar(hashcat(@"hash_8d7e52b4bde27ab5", ip1), "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3800
    // Size: 0xd0
    function function_3c048e3631577168(ip1) {
        self notify("<dev string:xf1c>");
        self endon("<dev string:xf1c>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(hashcat(@"hash_c464744f71b99da5", ip1), "<dev string:x256>");
        while (true) {
            var_de67598f57ba7a81 = getdvar(hashcat(@"hash_c464744f71b99da5", ip1), "<dev string:x256>");
            if (var_de67598f57ba7a81 != "<dev string:x256>") {
                for (i = 0; i < 5; i++) {
                    announcement("<dev string:xf3a>" + ip1 + "<dev string:xf3d>" + 5 - i);
                    wait 1;
                }
                thread scripts\cp\cp_debug::function_6eafd30d4e01bd76();
                setdvar(hashcat(@"hash_c464744f71b99da5", ip1), "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x38d8
    // Size: 0x8e
    function function_91f322ea6e260b5(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_f7c9d3814670e8f6(ip1);
        player thread function_585374cccbfdd255(ip1);
        var_89d75b24ca02680a = "<dev string:x83b>" + playername + "<dev string:xf49>" + ip1 + "<dev string:xa42>";
        var_89d75a24ca0265d7 = "<dev string:x83b>" + playername + "<dev string:xf8c>" + ip1 + "<dev string:xa42>";
        addentrytodevgui(var_89d75b24ca02680a);
        addentrytodevgui(var_89d75a24ca0265d7);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x396e
    // Size: 0x144
    function function_f7c9d3814670e8f6(ip1) {
        self notify("<dev string:xfca>");
        self endon("<dev string:xfca>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(@"hash_e0094f0f725edbe1", -1);
        while (true) {
            var_de67598f57ba7a81 = getdvarint(@"hash_e0094f0f725edbe1", -1);
            if (var_de67598f57ba7a81 != -1) {
                if (var_de67598f57ba7a81 == ip1) {
                    if (istrue(self.invulnerable)) {
                        announcement("<dev string:xfe1>" + ip1 + "<dev string:xfe4>");
                    }
                    if (scripts\cp\utility::getdamagemodifiertotal() <= 0) {
                        announcement("<dev string:xfe1>" + ip1 + "<dev string:xff5>");
                        foreach (player in level.players) {
                            player thread scripts\cp\utility::hint_prompt("<dev string:x1011>", 1, 3);
                        }
                    }
                    self.var_230a3287f9ad2965 = 1;
                    self.shouldskipdeathsshield = 1;
                    self dodamage(self.maxhealth, self.origin);
                    setdvar(@"hash_e0094f0f725edbe1", -1);
                }
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3aba
    // Size: 0x14f
    function function_585374cccbfdd255(ip1) {
        self notify("<dev string:x101e>");
        self endon("<dev string:x101e>");
        self endon("<dev string:x101>");
        setdvarifuninitialized(@"hash_2bd2e0f0a2fac412", -1);
        while (true) {
            var_de67598f57ba7a81 = getdvarint(@"hash_2bd2e0f0a2fac412", -1);
            if (var_de67598f57ba7a81 != -1) {
                if (var_de67598f57ba7a81 == ip1) {
                    if (istrue(self.invulnerable)) {
                        announcement("<dev string:xfe1>" + ip1 + "<dev string:xfe4>");
                    }
                    if (scripts\cp\utility::getdamagemodifiertotal() <= 0) {
                        announcement("<dev string:xfe1>" + ip1 + "<dev string:xff5>");
                        foreach (player in level.players) {
                            player thread scripts\cp\utility::hint_prompt("<dev string:x1011>", 1, 3);
                        }
                    }
                    self.shouldskiplaststand = 1;
                    self.var_230a3287f9ad2965 = 1;
                    self.shouldskipdeathsshield = 1;
                    self dodamage(self.maxhealth, self.origin);
                    setdvar(@"hash_2bd2e0f0a2fac412", -1);
                }
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x3c11
    // Size: 0xc1
    function function_f072024057cb6337(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_f7c7f3e8a319957b();
        player thread function_e2a42a69394ce830();
        cmd = "<dev string:x83b>" + playername + "<dev string:x1033>" + ip1 + "<dev string:x106b>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x1070>" + ip1 + "<dev string:x106b>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x10b0>" + ip1 + "<dev string:x77d>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x10df>" + ip1 + "<dev string:x77d>";
        addentrytodevgui(cmd);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3cda
    // Size: 0x6e
    function function_e2a42a69394ce830() {
        self notify("<dev string:x1112>");
        self endon("<dev string:x1112>");
        while (true) {
            var_dc8309190668e7b1 = getdvar(@"hash_eb6ab35872090cd1", "<dev string:x256>");
            if (var_dc8309190668e7b1 != "<dev string:x256>") {
                thread scripts\cp_mp\gasmask::removegasmask();
                self notify("<dev string:x1128>");
                setdvar(@"hash_eb6ab35872090cd1", "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d50
    // Size: 0x86
    function function_f7c7f3e8a319957b() {
        self notify("<dev string:x1138>");
        self endon("<dev string:x1138>");
        while (true) {
            var_dc8309190668e7b1 = getdvar(@"hash_89c147d46ef27320", "<dev string:x256>");
            if (var_dc8309190668e7b1 != "<dev string:x256>") {
                self.gasmaskhealth = 180;
                scripts\cp_mp\gasmask::equipgasmask();
                thread function_dc327722eb30355c();
                setdvar(@"hash_89c147d46ef27320", "<dev string:x256>");
                self setclientomnvar("<dev string:x114b>", 2);
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3dde
    // Size: 0x2f
    function function_dc327722eb30355c() {
        self notify("<dev string:x115f>");
        self endon("<dev string:x115f>");
        self endon("<dev string:x1128>");
        while (true) {
            processdamage(5);
            wait 1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3e15
    // Size: 0xd4
    function processdamage(damage) {
        self.gasmaskhealth -= damage;
        self.gasmaskhealth = max(0, self.gasmaskhealth);
        self setclientomnvar("<dev string:x117c>", self.gasmaskhealth / 180);
        if (self.gasmaskhealth <= 0) {
            scripts\cp_mp\gasmask::breakgasmask();
            self notify("<dev string:x1128>");
        }
        if (!isdefined(self.gasdamagebuffer)) {
            self.gasdamagebuffer = 0;
        }
        self.gasdamagebuffer += damage * 0.2;
        damagetoplayer = floor(self.gasdamagebuffer);
        if (damagetoplayer >= 1) {
            self.gasdamagebuffer -= damagetoplayer;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x3ef1
    // Size: 0xd6
    function function_b38a5be1f066c94b(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_305243d817bfd3e2();
        wait 1;
        var_1b7b9126aecf575c = level.weaponmapdata;
        var_1b7b9126aecf575c = namespace_a0628d6954815ef8::eliminatenullweapons(var_1b7b9126aecf575c);
        counter = 0;
        foreach (var_f9c849ee9004aedc in var_1b7b9126aecf575c) {
            cmd = "<dev string:x118e>" + var_f9c849ee9004aedc.assetname + "<dev string:x11c5>" + weaponbasename + "<dev string:x77d>";
            addentrytodevgui(cmd);
            counter++;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3fcf
    // Size: 0xdd
    function function_305243d817bfd3e2() {
        while (true) {
            var_dc8309190668e7b1 = getdvar(@"hash_a5aae21b5186cfba", "<dev string:x256>");
            if (var_dc8309190668e7b1 != "<dev string:x256>") {
                loadoutprimary = var_dc8309190668e7b1;
                loadoutprimaryobject = namespace_e0ee43ef2dddadaa::buildweapon(loadoutprimary);
                loadoutprimaryfullname = getcompleteweaponname(loadoutprimaryobject);
                var_986cbcea81712875 = getvalidtakeweapon();
                self takeweapon(var_986cbcea81712875);
                var_b56ca02611905136 = weaponclipsize(loadoutprimaryobject);
                ammocount = weaponmaxammo(loadoutprimaryobject);
                self giveweapon(loadoutprimaryobject);
                self setweaponammoclip(loadoutprimaryobject, var_b56ca02611905136);
                self setweaponammostock(loadoutprimaryobject, ammocount);
                self switchtoweaponimmediate(loadoutprimaryobject);
                setdvar(@"hash_a5aae21b5186cfba", "<dev string:x256>");
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x40b4
    // Size: 0x10a
    function function_f2c7f65e88d51c6f(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        wait 1;
        array = ["<dev string:x11e2>", "<dev string:x11e8>", "<dev string:x11ed>", "<dev string:x11f7>", "<dev string:x11fc>", "<dev string:x1204>", "<dev string:x1210>", "<dev string:x121d>", "<dev string:x1226>", "<dev string:x122d>"];
        foreach (element in array) {
            cmd = "<dev string:x1233>" + element + "<dev string:x1270>" + element + "<dev string:x1293>" + "<dev string:x126>" + ip1 + "<dev string:x77d>";
            addentrytodevgui(cmd);
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x41c6
    // Size: 0x45
    function function_104d4cbe8bab9fe3(player, playername, ip1) {
        cmd = "<dev string:x83b>" + playername + "<dev string:x1296>" + ip1 + "<dev string:x77d>";
        adddebugcommand(cmd);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x4213
    // Size: 0x129
    function function_711d30eca76e8787(player, playername, ip1) {
        script_func("<dev string:x12c6>", player, playername, ip1);
        var_94aedd2c2b88c863 = ["<dev string:x12dc>", "<dev string:x12de>", "<dev string:x12e0>", "<dev string:x12e2>", "<dev string:x12e4>"];
        cmd = "<dev string:x83b>" + playername + "<dev string:x12e6>" + ip1 + "<dev string:x1311>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x131b>" + ip1 + "<dev string:x1346>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x1350>" + ip1 + "<dev string:x1379>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x1381>" + ip1 + "<dev string:x13ab>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x13b4>" + ip1 + "<dev string:x13e0>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x83b>" + playername + "<dev string:x13eb>" + ip1 + "<dev string:x77d>";
        addentrytodevgui(cmd);
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4344
    // Size: 0x70
    function function_39e85e162399b4cb() {
        self endon("<dev string:x101>");
        while (true) {
            attachmentname = getdvar(@"hash_27bccd081631b25a", "<dev string:x256>");
            if (attachmentname != "<dev string:x256>") {
                var_b81306d5e961a031 = self getcurrentweapon();
                namespace_a0628d6954815ef8::addattachmenttoweapon(var_b81306d5e961a031, attachmentname);
                setdvar(@"hash_27bccd081631b25a", "<dev string:x256>");
            }
            wait 0.05;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x43bc
    // Size: 0x117
    function function_3cd94be00685c3b(player, playername, ip1) {
        flag_wait("<dev string:x6cf>");
        player thread function_8e00410980ce6efb();
        wait 1;
        array = ["<dev string:x1421>", "<dev string:x142d>", "<dev string:x143f>", "<dev string:x1457>", "<dev string:x1464>", "<dev string:x1472>", "<dev string:x1481>", "<dev string:x1492>", "<dev string:x14a6>", "<dev string:x14b2>", "<dev string:x14bd>"];
        foreach (element in array) {
            cmd = "<dev string:x14d5>" + element + "<dev string:x151a>" + index + "<dev string:x126>" + ip1 + "<dev string:x77d>";
            addentrytodevgui(cmd);
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x44db
    // Size: 0x122a
    function function_8e00410980ce6efb() {
        weapons = [];
        while (true) {
            var_b3fa9cff9eb43159 = int(getdvar(@"hash_88751acbcaa56240", -1));
            if (var_b3fa9cff9eb43159 != -1) {
                struct = spawnstruct();
                switch (var_b3fa9cff9eb43159) {
                case 0:
                    struct.loadoutprimary = "<dev string:x153a>";
                    struct.loadoutprimaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x154d>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 1:
                    struct.loadoutprimary = "<dev string:x155b>";
                    struct.loadoutprimaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x1569>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 2:
                    struct.loadoutprimary = "<dev string:x1579>";
                    struct.loadoutprimaryattachments = ["<dev string:x1588>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x158d>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 3:
                    struct.loadoutprimary = "<dev string:x159b>";
                    struct.loadoutprimaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x1569>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 4:
                    struct.loadoutprimary = "<dev string:x15aa>";
                    struct.loadoutprimaryattachments = ["<dev string:x15b9>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x154d>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 5:
                    struct.loadoutprimary = "<dev string:x15bc>";
                    struct.loadoutprimaryattachments = ["<dev string:x15ca>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x158d>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 6:
                    struct.loadoutprimary = "<dev string:x15d0>";
                    struct.loadoutprimaryattachments = ["<dev string:x15ca>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x154d>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 7:
                    struct.loadoutprimary = "<dev string:x15aa>";
                    struct.loadoutprimaryattachments = ["<dev string:x15de>", "<dev string:x15ee>", "<dev string:x15f5>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x15fd>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 8:
                    struct.loadoutprimary = "<dev string:x160b>";
                    struct.loadoutprimaryattachments = ["<dev string:x15b9>", "<dev string:x1588>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x154d>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 9:
                    struct.loadoutprimary = "<dev string:x1618>";
                    struct.loadoutprimaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x1626>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                case 10:
                    struct.loadoutprimary = "<dev string:x1618>";
                    struct.loadoutprimaryattachments = ["<dev string:x1635>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutprimarycamo = "<dev string:x1548>";
                    struct.loadoutprimaryreticle = "<dev string:x1548>";
                    struct.loadoutprimaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.loadoutprimarypaintjobid = 0;
                    struct.loadoutprimarycosmeticattachment = "<dev string:x1548>";
                    struct.loadoutsecondary = "<dev string:x154d>";
                    struct.loadoutsecondaryattachments = ["<dev string:x1635>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>", "<dev string:x1548>"];
                    struct.loadoutsecondarycamo = "<dev string:x1548>";
                    struct.loadoutsecondaryreticle = "<dev string:x1548>";
                    struct.loadoutsecondaryvariantid = -1;
                    self.entnumber = self getentitynumber();
                    struct.var_33e425a1f6c8b34d = 0;
                    struct.loadoutsecondarycosmeticattachment = "<dev string:x1548>";
                    break;
                default:
                    self iprintln("<dev string:x163e>");
                    break;
                }
                struct.loadoutprimaryobject = namespace_e0ee43ef2dddadaa::buildweapon(struct.loadoutprimary, struct.loadoutprimaryattachments, struct.loadoutprimarycamo, struct.loadoutprimaryreticle, struct.loadoutprimaryvariantid, self getentitynumber(), self.clientid, struct.loadoutprimarypaintjobid, struct.loadoutprimarycosmeticattachment);
                struct.loadoutprimaryfullname = getcompleteweaponname(struct.loadoutprimaryobject);
                if (struct.loadoutsecondary == "<dev string:x1548>") {
                    struct.loadoutsecondaryfullname = "<dev string:x1548>";
                    struct.loadoutsecondaryobject = undefined;
                } else {
                    struct.loadoutsecondaryobject = namespace_e0ee43ef2dddadaa::buildweapon(struct.loadoutsecondary, struct.loadoutsecondaryattachments, struct.loadoutsecondarycamo, struct.loadoutsecondaryreticle, struct.loadoutsecondaryvariantid, self getentitynumber(), self.clientid, struct.var_33e425a1f6c8b34d, struct.loadoutsecondarycosmeticattachment);
                    struct.loadoutsecondaryfullname = getcompleteweaponname(struct.loadoutsecondaryobject);
                }
                self takeallweapons();
                var_b56ca02611905136 = weaponclipsize(struct.loadoutprimaryobject);
                ammocount = weaponmaxammo(struct.loadoutprimaryobject);
                self giveweapon(struct.loadoutprimaryobject);
                self setweaponammoclip(struct.loadoutprimaryobject, var_b56ca02611905136);
                self setweaponammostock(struct.loadoutprimaryobject, ammocount);
                var_b56ca02611905136 = weaponclipsize(struct.loadoutsecondaryobject);
                ammocount = weaponmaxammo(struct.loadoutsecondaryobject);
                self giveweapon(struct.loadoutsecondaryobject);
                self setweaponammoclip(struct.loadoutsecondaryobject, var_b56ca02611905136);
                self setweaponammostock(struct.loadoutsecondaryobject, ammocount);
                self switchtoweaponimmediate(struct.loadoutprimaryobject);
                setdvar(@"hash_88751acbcaa56240", -1);
            }
            wait 0.1;
        }
    }

    // Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x570d
    // Size: 0x2fa
    function function_64b61158328bca1c(color) {
        level endon("<dev string:x407>");
        while (true) {
            if (getdvarint(@"hash_ec179f7878942f06") != 1) {
                wait 1;
                continue;
            }
            thread draw_entity_bounds(self, 2.5, (1, 0, 1), 0);
            if (self.struct.angles == (0, 0, 0)) {
                sphere(self.struct.origin, self.struct.radius, color, 1, 50);
            } else {
                up = anglestoup(self.struct.angles) * self.struct.radius;
                left = anglestoleft(self.struct.angles) * self.struct.radius;
                right = anglestoright(self.struct.angles) * self.struct.radius;
                line(self.struct.origin - up + left, self.struct.origin - up + left + anglestoforward(self.struct.angles) * self.struct.height / 2, color, 1, 1, 50);
                line(self.struct.origin - up + right, self.struct.origin - up + right + anglestoforward(self.struct.angles) * self.struct.height / 2, color, 1, 1, 50);
                line(self.struct.origin + left, self.struct.origin + left + anglestoforward(self.struct.angles) * self.struct.height / 2, color, 1, 1, 50);
                line(self.struct.origin + right, self.struct.origin + right + anglestoforward(self.struct.angles) * self.struct.height / 2, color, 1, 1, 50);
            }
            wait 2.5;
        }
    }

#/

// Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a0f
// Size: 0x3a
function traversal_test() {
    while (!isdefined(level.players) || level.players.size < 1) {
        wait 1;
    }
    level.players[0] thread traversal_test_logic();
}

// Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a51
// Size: 0x10a
function traversal_test_logic() {
    while (true) {
        if (getdvarint(@"hash_ee095ca95d44710") < 1) {
            wait 1;
            continue;
        }
        while (!self usebuttonpressed()) {
            wait 0.05;
        }
        while (self usebuttonpressed()) {
            wait 0.05;
        }
        trace = scripts\engine\trace::ray_trace(self geteye(), self geteye() + anglestoforward(self getplayerangles()) * 16000);
        pos = getclosestpointonnavmesh(trace["position"]);
        guy = scripts\mp\mp_agent::spawnnewagentaitype("actor_enemy_cp_shotgun_tier1_aq", pos, (0, 0, 0));
        guy.ignoreall = 1;
        guy.ignoreme = 1;
        guy.fixednode = 1;
        guy scripts\asm\asm_bb::bb_setanimscripted();
        guy.goalradius = 8;
        thread traversal_test_think(guy);
        thread kill_traversal_test_guy(guy);
        guy waittill("death");
    }
}

// Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b63
// Size: 0x47
function kill_traversal_test_guy(guy) {
    while (!level.players[0] meleebuttonpressed()) {
        wait 0.05;
    }
    guy dodamage(guy.health + 100, guy.origin);
}

// Namespace namespace_748fe2e59aef2dea / namespace_c0269b8ac4e7a573
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5bb2
// Size: 0x67
function traversal_test_think(guy) {
    while (true) {
        self waittill("weapon_fired");
        trace = scripts\engine\trace::ray_trace(self geteye(), self geteye() + anglestoforward(self getplayerangles()) * 16000);
        pos = getclosestpointonnavmesh(trace["position"]);
        guy setgoalpos(pos);
    }
}

