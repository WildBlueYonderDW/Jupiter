#using scripts\common\callbacks.gsc;
#using scripts\common\debug.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\gametypes\br_ending.gsc;
#using script_40f4c8f2b94c5cd9;
#using scripts\mp\anim.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_1fc2350d8aebb68e;
#using script_f4678c9c2a5b24e;
#using script_4803cd619738232c;
#using script_72d25fb2b703b6d5;
#using scripts\mp\dev.gsc;
#using script_6775ad452d13858;
#using scripts\mp\teams.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_6ad351ebd5a33280;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace namespace_bc2bdb06de29485d;

// Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1cb
// Size: 0x46
function private function_5197cc12048f8766(type) {
    switch (type) {
    case #"hash_d9cfbe7fb5447f0e": 
        return namespace_1cf0585e9841d60a::function_a5538b1593309bb0();
    case #"hash_1136bc3322c0a548":
    default: 
        return namespace_d0436b1a1618abfc::function_a5538b1593309bb0();
    }
}

// Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x219
// Size: 0x9e
function private function_2845c7aff5b6d7b6(type) {
    switch (type) {
    case #"hash_d9cfbe7fb5447f0e": 
        return namespace_1cf0585e9841d60a::get_chopperexfil_transient();
    case #"hash_18208461fac4f35e": 
        return namespace_75ba454ed5255c2::function_2023eb5589c72085();
    case #"hash_8e482dd76314929c": 
        if (scripts\engine\utility::issharedfuncdefined("br_ending_chopper_no_hq", "chopperHQExfil_init")) {
            return [[ scripts\engine\utility::getsharedfunc("br_ending_chopper_no_hq", "get_chopperExfil_transient") ]]();
        }
    case #"hash_ce37a6540166b6f7": 
        return namespace_91542927cd719085::function_aafaf24d80927b02();
    case #"hash_1136bc3322c0a548":
    default: 
        return namespace_d0436b1a1618abfc::get_chopperexfil_transient();
    }
}

/#

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2bf
    // Size: 0x15b
    function function_38b44913b9bec05f(players) {
        if (!isdefined(players)) {
            players = level.players;
        }
        var_b747aaa441b7aea9 = getdvarint(@"hash_85485bbe1bfbee98");
        if (var_b747aaa441b7aea9 > 0) {
            level.custom_giveloadout = &function_181c965102053e79;
            count = 0;
            foreach (player in level.players) {
                if (istestclient(player)) {
                    count++;
                }
            }
            if (count < var_b747aaa441b7aea9) {
                scripts\mp\dev::spawn_test_clients(var_b747aaa441b7aea9);
            }
            wait 1;
            var_d39eb0d89e4b241f = 7;
            if (var_b747aaa441b7aea9 >= var_d39eb0d89e4b241f) {
                players = [];
                for (i = 1; i < level.players.size; i++) {
                    players[players.size] = level.players[i];
                }
            } else {
                size = players.size;
                diff = var_d39eb0d89e4b241f - size;
                if (diff > 0) {
                    for (i = 0; i < diff; i++) {
                        players[players.size] = level.players[i + size];
                    }
                }
            }
        }
        return players;
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x422
    // Size: 0x29f
    function function_181c965102053e79(fauxspawn, revivespawn) {
        array = [];
        array["<dev string:x1c>"] = "<dev string:x23>";
        array["<dev string:x34>"] = "<dev string:x3e>";
        array["<dev string:x50>"] = "<dev string:x58>";
        array["<dev string:x6a>"] = "<dev string:x70>";
        array["<dev string:x80>"] = "<dev string:x86>";
        array["<dev string:x96>"] = "<dev string:x9e>";
        array["<dev string:xad>"] = "<dev string:xb1>";
        array["<dev string:xbf>"] = "<dev string:xc4>";
        array["<dev string:xd3>"] = "<dev string:xd8>";
        array["<dev string:xe7>"] = "<dev string:xec>";
        array["<dev string:xfb>"] = "<dev string:x101>";
        array["<dev string:x111>"] = "<dev string:x117>";
        array["<dev string:x127>"] = "<dev string:x12d>";
        array["<dev string:x13d>"] = "<dev string:x14a>";
        array["<dev string:x159>"] = "<dev string:x167>";
        array["<dev string:x178>"] = "<dev string:x186>";
        array["<dev string:x197>"] = "<dev string:x1a5>";
        array["<dev string:x1b6>"] = "<dev string:x1c4>";
        array["<dev string:x1d5>"] = "<dev string:x1e3>";
        array["<dev string:x1f4>"] = "<dev string:x202>";
        array["<dev string:x213>"] = "<dev string:x221>";
        array["<dev string:x232>"] = "<dev string:x240>";
        array["<dev string:x251>"] = "<dev string:x256>";
        array["<dev string:x265>"] = "<dev string:x269>";
        array["<dev string:x277>"] = "<dev string:x27f>";
        array["<dev string:x291>"] = "<dev string:x297>";
        array["<dev string:x2a7>"] = "<dev string:x2ac>";
        array["<dev string:x2bb>"] = "<dev string:x2c0>";
        array["<dev string:x2cf>"] = "<dev string:x2d4>";
        array["<dev string:x2e3>"] = "<dev string:x2e9>";
        array["<dev string:x2f9>"] = "<dev string:x2ff>";
        array["<dev string:x30f>"] = "<dev string:x317>";
        array["<dev string:x327>"] = "<dev string:x330>";
        array["<dev string:x341>"] = "<dev string:x349>";
        array["<dev string:x359>"] = "<dev string:x361>";
        array["<dev string:x371>"] = "<dev string:x37a>";
        skinref = undefined;
        dvar = hashcat(@"hash_e340a5ee5afde790", self getentitynumber());
        dvarval = getdvar(dvar);
        if (dvarval != "<dev string:x38e>" && isdefined(array[dvarval])) {
            skinref = array[dvarval];
        } else {
            randomkey = array_random(getarraykeys(array));
            skinref = array[randomkey];
        }
        operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
        scripts\mp\teams::createoperatorcustomization(operatorref, undefined);
        scripts\mp\class::giveloadout(self.team, self.class, undefined, undefined, 0);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6c9
    // Size: 0x64
    function function_117a90f752406598() {
        host = scripts\mp\gamelogic::gethostplayer();
        setdvarifuninitialized(@"hash_5d7942ff9a328997", 1);
        if (!isdefined(level.var_c192bb3f79de7dbf)) {
            level namespace_8885c19c053dcb46::function_c24d9aca5f9eba35();
        }
        br_ending::play_ending(teams::getteamdata(host.team, "<dev string:x38f>"), host.origin);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x735
    // Size: 0x3d2
    function function_9dd3d565e1ba2f03() {
        devgui::function_6e7290c8ee4f558b("<dev string:x397>");
        devgui::function_a9a864379a098ad6("<dev string:x3a4>", "<dev string:x3bb>", &function_117a90f752406598);
        devgui::function_fe953f000498048f();
        var_290b775dfa48665 = 0;
        var_ebe477033d06f099 = 0;
        while (!isdefined(level.players) || level.players.size == 0) {
            wait 1;
        }
        wait 20;
        while (true) {
            wait 0.1;
            if (!var_ebe477033d06f099 && !var_290b775dfa48665 && getdvarint(@"hash_19a406e3c51ce52f")) {
                level.br_ending_debugmode = 1;
                thread function_2fc595ab59dafc25("<dev string:x3ca>");
                var_290b775dfa48665 = 1;
                thread function_652652964c77da84();
                foreach (player in level.players) {
                    if (player ishost()) {
                        player thread function_facc80fe01aef30();
                    }
                }
            } else if (var_290b775dfa48665 && !getdvarint(@"hash_19a406e3c51ce52f")) {
                var_290b775dfa48665 = 0;
                level notify("<dev string:x3e7>");
                thread function_2fc595ab59dafc25("<dev string:x403>", 3);
                level.br_ending_debugmode = undefined;
            } else if (!var_290b775dfa48665 && !var_ebe477033d06f099 && getdvarint(@"hash_2d200a3da7fb2518")) {
                level.br_ending_debugmode = 1;
                mode = getdvarint(@"hash_2d200a3da7fb2518");
                if (mode == 2) {
                    function_53e397de3c413997();
                } else {
                    function_1ee78b6d0f6f10f7();
                }
                level.br_ending_debugmode = undefined;
            } else if (!var_290b775dfa48665 && !var_ebe477033d06f099 && getdvarint(@"hash_5be228e043cb645a")) {
                player = level.players[0];
                winners = scripts\mp\utility\teams::getteamdata(player.team, "<dev string:x38f>");
                var_a6b3fae0395f75c3 = scripts\mp\gametypes\br_ending::function_9afbee75cfe14b8d();
                transientname = function_2845c7aff5b6d7b6(var_a6b3fae0395f75c3);
                loadinfiltransient(transientname);
                for (var_24b79087f3897e94 = 0; !var_24b79087f3897e94; var_24b79087f3897e94 = function_2030cc4ad67d1634(transientname)) {
                    waitframe();
                }
                play_ending(winners, player.origin);
                setdvar(@"hash_5be228e043cb645a", 0);
            }
            if (getdvarint(@"hash_9f63b6e7903d0e54", -1) > -1) {
                killnum = getdvarint(@"hash_9f63b6e7903d0e54");
                foreach (player in level.players) {
                    if (killnum == player getentitynumber()) {
                        if (isalive(player)) {
                            player kill();
                            break;
                        }
                    }
                }
                setdvar(@"hash_9f63b6e7903d0e54", -1);
            }
            if (getdvarint(@"hash_c331bd97a07debe2", -1) > -1) {
                kicknum = getdvarint(@"hash_c331bd97a07debe2");
                println("<dev string:x421>" + kicknum);
                foreach (player in level.players) {
                    if (kicknum == player getentitynumber()) {
                        kick(kicknum, "<dev string:x431>");
                        break;
                    }
                }
                setdvar(@"hash_c331bd97a07debe2", -1);
            }
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb0f
    // Size: 0x7d7
    function function_facc80fe01aef30() {
        level endon("<dev string:x3e7>");
        level.var_59d3ce664628caf4 = spawnstruct();
        level.var_59d3ce664628caf4.var_1c589f8f06d81b70 = function_bd87576b75af246();
        level.var_59d3ce664628caf4.var_e4211a476e76b65a = level.var_59d3ce664628caf4.var_1c589f8f06d81b70.size;
        level.var_59d3ce664628caf4.var_270f34f785b2df1f = 0;
        foreach (struct in level.var_59d3ce664628caf4.var_1c589f8f06d81b70) {
            if (!isdefined(struct.angles)) {
                struct.angles = (0, 0, 0);
            }
        }
        var_a6b3fae0395f75c3 = function_9afbee75cfe14b8d();
        transientname = function_2845c7aff5b6d7b6(var_a6b3fae0395f75c3);
        loadinfiltransient(transientname);
        for (var_24b79087f3897e94 = 0; !var_24b79087f3897e94; var_24b79087f3897e94 = function_2030cc4ad67d1634(transientname)) {
            waitframe();
        }
        if (!function_b5e265cde17f09d1(var_a6b3fae0395f75c3)) {
            level.var_59d3ce664628caf4.collision_tests = function_b1e9104bb425eed6(var_a6b3fae0395f75c3);
        }
        childthread cursor_think();
        while (true) {
            waitframe();
            if (self usebuttonpressed()) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    function_83f63b509c56f86c();
                } else if (isdefined(level.var_59d3ce664628caf4.cursor_highlight)) {
                    function_ce2d34095221c720(level.var_59d3ce664628caf4.cursor_highlight);
                    level.var_59d3ce664628caf4.cursor_highlight = undefined;
                } else {
                    function_ce2d34095221c720();
                }
                wait 0.4;
                continue;
            }
            if (self weaponswitchbuttonpressed()) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    level.var_59d3ce664628caf4.var_1c589f8f06d81b70[level.var_59d3ce664628caf4.var_1c589f8f06d81b70.size] = level.var_59d3ce664628caf4.var_9709609a00e4c585;
                    function_83f63b509c56f86c();
                } else {
                    endtime = gettime() + 2000;
                    while (gettime() < endtime && self weaponswitchbuttonpressed()) {
                        waitframe();
                    }
                    if (self weaponswitchbuttonpressed()) {
                        function_54b03fa89c164504();
                    }
                }
                wait 0.4;
                continue;
            }
            if (self fragbuttonpressed()) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    origin = level.var_59d3ce664628caf4.var_9709609a00e4c585.origin;
                    angles = level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34;
                    function_83f63b509c56f86c();
                    function_ce2d34095221c720();
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.origin = origin;
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.angles = angles;
                } else {
                    level.var_59d3ce664628caf4.var_563a1ce3c161c5db = angleclamp180(level.var_59d3ce664628caf4.var_563a1ce3c161c5db - 10);
                }
                wait 0.4;
                continue;
            }
            if (self secondaryoffhandbuttonpressed()) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    origin = level.var_59d3ce664628caf4.var_9709609a00e4c585.origin;
                    angles = level.var_59d3ce664628caf4.var_9709609a00e4c585.angles;
                    function_83f63b509c56f86c();
                    function_ce2d34095221c720();
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.origin = origin;
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.angles = angles;
                } else {
                    level.var_59d3ce664628caf4.var_563a1ce3c161c5db = angleclamp180(level.var_59d3ce664628caf4.var_563a1ce3c161c5db + 10);
                }
                wait 0.4;
                continue;
            }
            if (self buttonpressed("<dev string:x442>")) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    origin = level.var_59d3ce664628caf4.var_9709609a00e4c585.origin + (0, 0, 6);
                    angles = level.var_59d3ce664628caf4.var_9709609a00e4c585.angles;
                    function_83f63b509c56f86c();
                    function_ce2d34095221c720();
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.origin = origin;
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.angles = angles;
                } else {
                    level.var_59d3ce664628caf4.var_15042a5b64d3849c = int(level.var_59d3ce664628caf4.var_15042a5b64d3849c + 6);
                    iprintlnbold("<dev string:x44a>" + level.var_59d3ce664628caf4.var_15042a5b64d3849c);
                }
                wait 0.4;
                continue;
            }
            if (self buttonpressed("<dev string:x45f>")) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    origin = level.var_59d3ce664628caf4.var_9709609a00e4c585.origin + (0, 0, -6);
                    angles = level.var_59d3ce664628caf4.var_9709609a00e4c585.angles;
                    function_83f63b509c56f86c();
                    function_ce2d34095221c720();
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.origin = origin;
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.angles = angles;
                } else {
                    level.var_59d3ce664628caf4.var_15042a5b64d3849c = int(level.var_59d3ce664628caf4.var_15042a5b64d3849c - 6);
                    iprintlnbold("<dev string:x44a>" + level.var_59d3ce664628caf4.var_15042a5b64d3849c);
                }
                wait 0.4;
                continue;
            }
            if (self buttonpressed("<dev string:x469>")) {
                level.var_59d3ce664628caf4.var_15042a5b64d3849c = 0;
                iprintlnbold("<dev string:x44a>" + level.var_59d3ce664628caf4.var_15042a5b64d3849c);
                wait 0.4;
                continue;
            }
            if (self meleebuttonpressed()) {
                level.var_59d3ce664628caf4.var_270f34f785b2df1f = !level.var_59d3ce664628caf4.var_270f34f785b2df1f;
                if (level.var_59d3ce664628caf4.var_270f34f785b2df1f) {
                    iprintlnbold("<dev string:x473>");
                } else {
                    iprintlnbold("<dev string:x48b>");
                }
                wait 0.4;
                continue;
            }
            if (self sprintbuttonpressed()) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    endtime = gettime() + 2000;
                    while (gettime() < endtime && self sprintbuttonpressed()) {
                        waitframe();
                    }
                    iprintlnbold("<dev string:x4a4>");
                    function_f5c4b4c2a4e8e220(level.var_59d3ce664628caf4.var_9709609a00e4c585);
                    wait 0.4;
                    continue;
                }
                function_2fc595ab59dafc25("<dev string:x4c8>", 1);
            }
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x12ee
    // Size: 0x20a
    function function_b1e9104bb425eed6(var_a6b3fae0395f75c3) {
        array = [];
        structs = [];
        bgbar = newhudelem();
        bgbar.vertalign = "<dev string:x4eb>";
        bgbar.horzalign = "<dev string:x4f2>";
        bgbar.aligny = "<dev string:x4eb>";
        bgbar.x = -250;
        bgbar.y = 100;
        bgbar setshader("<dev string:x4f9>", 500, 16);
        bar = newhudelem();
        bar.vertalign = "<dev string:x4eb>";
        bar.horzalign = "<dev string:x4f2>";
        bar.aligny = "<dev string:x4eb>";
        bar.x = -250 + int(2);
        bar.y = 100;
        bar.sort = 1;
        bar.maxwidth = 496;
        bar.maxheight = 12;
        bar setshader("<dev string:x4ff>", 0, 12);
        bar.percent = 0;
        level.var_59d3ce664628caf4.bar = bar;
        var_79a78f73d2d4925d = function_5197cc12048f8766(var_a6b3fae0395f75c3);
        foreach (i, argstruct in var_79a78f73d2d4925d) {
            structs[structs.size] = function_efc9d79fca4c313d(argstruct);
            adjust_bar(i / var_79a78f73d2d4925d.size);
        }
        bar adjust_bar(1);
        waitframe();
        bgbar destroy();
        bar destroy();
        if (isdefined(level.var_2e10660bd87fffd9)) {
            level.var_2e10660bd87fffd9.alpha = 0;
        }
        return structs;
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1500
    // Size: 0x62
    function adjust_bar(percent) {
        bar = level.var_59d3ce664628caf4.bar;
        bar.percent = percent;
        bar scaleovertime(0.05, int(bar.maxwidth * percent), bar.maxheight);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x156a
    // Size: 0x17
    function function_e71304c34e3c6962(argstruct) {
        self useanimtree(%mp_vehicles_always_loaded);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1589
    // Size: 0x17
    function function_9cb7084e67f532c9(argstruct) {
        self useanimtree(%script_model);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x15a8
    // Size: 0x30
    function function_55ed5b4967f1130d(argstruct) {
        if (istrue(argstruct.var_d4364a524e8a2bcd)) {
            function_e71304c34e3c6962(argstruct);
            return;
        }
        function_9cb7084e67f532c9(argstruct);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x15e0
    // Size: 0x2ed
    function function_efc9d79fca4c313d(argstruct) {
        angles = (0, 0, 0);
        origin = (0, 0, 0);
        struct = spawnstruct();
        struct.argstruct = argstruct;
        if (isdefined(argstruct.numsegments)) {
            assert(isdefined(argstruct.modelname));
            assert(argstruct.numsegments > 0);
            model = spawn("<dev string:x505>", origin);
            model.angles = angles;
            model setmodel(argstruct.modelname);
            model function_55ed5b4967f1130d(argstruct);
            model animscripted(argstruct.animref, origin, angles, argstruct.animref, undefined, undefined, 0);
            fracdiff = 1 / argstruct.numsegments;
            struct.path = [];
            for (i = 0; i < argstruct.numsegments; i++) {
                model setanimtime(argstruct.animref, fracdiff * i);
                wait 0.1;
                if (i > 0) {
                    if (distancesquared(struct.path[struct.path.size - 1], model.origin) < 2500) {
                        continue;
                    }
                }
                struct.path[struct.path.size] = model.origin;
            }
            model delete();
        } else if (isdefined(argstruct.sphereradius)) {
            model = spawn("<dev string:x505>", origin);
            model.angles = angles;
            model setmodel(argstruct.modelname);
            model function_55ed5b4967f1130d(argstruct);
            model animscripted(argstruct.animref, origin, angles, argstruct.animref, undefined, undefined, 0);
            wait 0.1;
            model setanimtime(argstruct.animref, argstruct.animpct);
            wait 0.1;
            struct.origin = model.origin;
            struct.angles = model.angles;
            model delete();
        } else {
            assert(isdefined(argstruct.cylinderradius));
            struct.origin = getstartorigin(origin, angles, argstruct.animref) + (0, 0, 2);
            struct.angles = getstartangles(origin, angles, argstruct.animref);
            waitframe();
        }
        return struct;
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18d5
    // Size: 0x166
    function function_54b03fa89c164504() {
        startpos = (-60000, -60000, 0);
        structs = sortbydistance(level.var_59d3ce664628caf4.var_1c589f8f06d81b70, startpos);
        println("<dev string:x512>");
        println("<dev string:x38e>");
        for (i = 0; i < structs.size; i++) {
            if (isdefined(structs[i].var_fcb6c737b5ecef23)) {
                println("<dev string:x56b>" + i + "<dev string:x575>" + structs[i].origin + "<dev string:x58a>" + structs[i].angles + "<dev string:x58d>");
                continue;
            }
            println("<dev string:x56b>" + i + "<dev string:x575>" + structs[i].origin + "<dev string:x58a>" + structs[i].angles + "<dev string:x594>");
        }
        println("<dev string:x38e>");
        total = structs.size;
        diff = total - level.var_59d3ce664628caf4.var_e4211a476e76b65a;
        thread function_2fc595ab59dafc25("<dev string:x598>" + total + "<dev string:x5bc>" + diff, 8);
        println("<dev string:x5c3>" + total + "<dev string:x609>" + diff + "<dev string:x610>");
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a43
    // Size: 0x1d8
    function function_83f63b509c56f86c() {
        var_a6b3fae0395f75c3 = function_9afbee75cfe14b8d();
        if (!isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585) || !function_b5e265cde17f09d1(var_a6b3fae0395f75c3) && !isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585.packs)) {
            return;
        }
        level.var_59d3ce664628caf4.var_9709609a00e4c585 notify("<dev string:x632>");
        if (!function_b5e265cde17f09d1(var_a6b3fae0395f75c3)) {
            foreach (pack in level.var_59d3ce664628caf4.var_9709609a00e4c585.packs) {
                foreach (ent in pack.ents) {
                    if (!isdefined(ent)) {
                        continue;
                    }
                    if (isdefined(ent.linkedents)) {
                        array_delete(ent.linkedents);
                    }
                    ent delete();
                }
            }
            if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585.cam)) {
                level.var_59d3ce664628caf4.var_9709609a00e4c585.cam delete();
            }
            level.player cameraunlink();
            level.player stopxcam();
        }
        level.var_59d3ce664628caf4.var_9709609a00e4c585 = undefined;
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c23
    // Size: 0x3c
    function function_f5c4b4c2a4e8e220(removestruct) {
        level.var_59d3ce664628caf4.var_1c589f8f06d81b70 = array_remove(level.var_59d3ce664628caf4.var_1c589f8f06d81b70, removestruct);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c67
    // Size: 0x104
    function function_ce2d34095221c720(structoverride) {
        if (isdefined(structoverride)) {
            animstruct = structoverride;
        } else {
            animstruct = spawnstruct();
            animstruct.origin = level.var_59d3ce664628caf4.cursor_pos;
            animstruct.angles = level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34;
        }
        animstruct.pack = spawnstruct();
        animstruct.pack.models = [];
        animstruct.pack.players = [];
        animstruct.pack.cams = [];
        animstruct.istemp = 1;
        level.var_59d3ce664628caf4.var_9709609a00e4c585 = animstruct;
        level.br_ending = animstruct;
        level.var_59d3ce664628caf4.var_9709609a00e4c585 function_980d0b7c0096bb37();
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d73
    // Size: 0x168
    function function_980d0b7c0096bb37() {
        self endon("<dev string:x632>");
        waitframe();
        if (level.script != "<dev string:x647>" && !isdefined(level.var_861898b95b936d83)) {
            function_788c4eeeeb69900f();
        }
        players = array_combine([level.player], level.var_861898b95b936d83);
        self.winners = players;
        var_a6b3fae0395f75c3 = function_9afbee75cfe14b8d();
        set_ending_pack(var_a6b3fae0395f75c3, undefined);
        wait 1;
        if (function_b5e265cde17f09d1(var_a6b3fae0395f75c3)) {
            player = level.players[0];
            player setcinematicmotionoverride("<dev string:x654>");
            player utility::hidehudenable();
            childthread function_84068c30364b89cb();
            return;
        }
        player = level.players[0];
        player_rigs = [];
        for (i = 0; i < players.size; i++) {
            if (!isdefined(players[i])) {
                continue;
            }
            player = players[i];
            player setcinematicmotionoverride("<dev string:x654>");
            player utility::hidehudenable();
            if (getdvarint(@"hash_dd3266b5409a856b") && player ishost()) {
                continue;
            }
            player create_player_rig(player.animname, "<dev string:x65d>", self);
            player_rigs[player_rigs.size] = player.player_rig;
        }
        childthread function_6c67cb42fa6c83d2(players, player_rigs);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ee3
    // Size: 0x10e
    function function_788c4eeeeb69900f() {
        var_b747aaa441b7aea9 = 3;
        scripts\mp\dev::spawn_test_clients(var_b747aaa441b7aea9);
        level.var_861898b95b936d83 = [];
        foreach (player in level.players) {
            if (istestclient(player)) {
                level.var_861898b95b936d83[level.var_861898b95b936d83.size] = player;
            }
        }
        while (true) {
            spawncount = 0;
            foreach (player in level.var_861898b95b936d83) {
                if (istrue(player.hasspawned)) {
                    spawncount++;
                }
            }
            if (spawncount == level.var_861898b95b936d83.size) {
                break;
            }
            waitframe();
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ff9
    // Size: 0x37
    function function_6c67cb42fa6c83d2(players, player_rigs, play_once) {
        childthread function_9b6ad484e6bfa268();
        while (true) {
            function_1c6d73d1832aefd6(players, player_rigs);
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x2038
    // Size: 0x4ae
    function function_1c6d73d1832aefd6(players, player_rigs) {
        level endon("<dev string:x670>");
        foreach (pack in self.packs) {
            if (isdefined(pack.startfunc)) {
                [[ pack.startfunc ]](pack.paramarray);
            }
            if (pack.players.size > 0) {
                pack.players = array_removeundefined(pack.players);
                foreach (player in pack.players) {
                    player dontinterpolate();
                    if (isdefined(player.linkedtoent)) {
                        player.linkedtoent thread anim_player_solo(player, player.player_rig, pack.anime, player.linkedtotag);
                        continue;
                    }
                    thread anim_player_solo(player, player.player_rig, pack.anime);
                }
            }
            if (pack.ents.size > 0) {
                foreach (ent in pack.ents) {
                    if (!istrue(ent.dontteleport)) {
                        ent dontinterpolate();
                    }
                }
                thread anim_single(pack.ents, pack.anime);
            }
            shouldattach = 0;
            if (!isdefined(level.var_59d3ce664628caf4)) {
                shouldattach = 1;
            } else if (istrue(level.var_59d3ce664628caf4.var_270f34f785b2df1f)) {
                shouldattach = 1;
            }
            if (isdefined(pack.xcamasset)) {
                self.cam dontinterpolate();
                thread anim_single_solo(self.cam, pack.anime);
                foreach (player in level.players) {
                    player cameraunlink();
                }
                xcamlength = getxcamlength(pack.xcamasset);
                xcamlength -= 0.033;
                xcamlength -= mod(xcamlength, 0.05);
                self.xcamasset = pack.xcamasset;
                self.xcamtime = gettime();
                if (shouldattach) {
                    level.players[0] playxcam(pack.xcamasset, 0, self.origin, self.angles);
                    self.var_1384d8bd817f644 = 1;
                }
                wait xcamlength;
            } else {
                foreach (player in level.players) {
                    player stopxcam();
                }
                self.xcamasset = undefined;
                self.xcamtime = undefined;
                self.var_1384d8bd817f644 = 0;
                if (shouldattach) {
                    level.players[0] cameralinkto(self.cam, "<dev string:x68e>", 1, 1);
                }
                self.cam dontinterpolate();
                anim_single_solo(self.cam, pack.anime);
            }
            waitframe();
            if (isdefined(pack.endfunc)) {
                [[ pack.endfunc ]](pack.var_315361abd838fad4);
            }
        }
        foreach (player in level.players) {
            player.linkedtoent = undefined;
            player.linkedtotag = undefined;
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x24ee
    // Size: 0x119
    function function_9b6ad484e6bfa268() {
        wait 0.1;
        while (true) {
            if (level.var_59d3ce664628caf4.var_270f34f785b2df1f) {
                if (isdefined(self.xcamasset) && isdefined(self.xcamtime)) {
                    if (!istrue(self.var_1384d8bd817f644)) {
                        timeoffset = (gettime() - self.xcamtime) * 0.001;
                        level.players[0] playxcam(self.xcamasset, 0, self.origin, self.angles, timeoffset);
                        self.var_1384d8bd817f644 = 1;
                    }
                } else if (isdefined(level.players[0].player_rig)) {
                    level.players[0] cameralinkto(self.cam, "<dev string:x68e>", 1, 1);
                }
            } else {
                level.players[0] cameraunlink();
                level.players[0] stopxcam();
                self.var_1384d8bd817f644 = 0;
            }
            waitframe();
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x260f
    // Size: 0x43b
    function cursor_think() {
        level.var_59d3ce664628caf4.var_563a1ce3c161c5db = 0;
        level.var_59d3ce664628caf4.var_15042a5b64d3849c = 0;
        level.var_59d3ce664628caf4.cursor_pos = self.origin;
        level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34 = self.angles;
        level.var_59d3ce664628caf4.cursor_highlight = undefined;
        var_c5409ca7522182b3 = 500000;
        var_5adc3ff44d7a1b85 = var_c5409ca7522182b3 * 0.8;
        var_57206f9835a87bc5 = var_5adc3ff44d7a1b85 * var_5adc3ff44d7a1b85;
        var_b8de365ae15a4559 = var_c5409ca7522182b3 - var_5adc3ff44d7a1b85;
        var_fdf5a004367563ac = 1000;
        var_785529d63cfd5142 = squared(var_fdf5a004367563ac);
        var_25cf9efcc9b2800 = var_c5409ca7522182b3 - var_fdf5a004367563ac;
        while (true) {
            waitframe();
            update_cursor();
            level.var_59d3ce664628caf4.cursor_pos += (0, 0, level.var_59d3ce664628caf4.var_15042a5b64d3849c);
            level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34 = angleclamp180(self.angles + (0, level.var_59d3ce664628caf4.var_563a1ce3c161c5db, 0));
            level.var_59d3ce664628caf4.cursor_highlight = undefined;
            foreach (index, struct in level.var_59d3ce664628caf4.var_1c589f8f06d81b70) {
                distsqrd = distance2dsquared(level.players[0].origin, struct.origin);
                if (distsqrd < squared(var_c5409ca7522182b3)) {
                    if (!isdefined(level.var_59d3ce664628caf4.cursor_highlight) && distance2dsquared(struct.origin, level.var_59d3ce664628caf4.cursor_pos) < 40000) {
                        level.var_59d3ce664628caf4.cursor_highlight = struct;
                        level.var_59d3ce664628caf4.cursor_pos = struct.origin;
                        level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34 = struct.angles;
                        continue;
                    }
                    alpha = 1;
                    size = 32;
                    if (distsqrd > var_785529d63cfd5142) {
                        if (!isdefined(struct.var_fcb6c737b5ecef23)) {
                            function_7835c2cb25c033c9(struct.origin, alpha, size, (1, 1, 0), undefined, index);
                        } else {
                            function_7835c2cb25c033c9(struct.origin, alpha, size, undefined, undefined, index);
                        }
                        continue;
                    }
                    draw_node(struct.origin, struct.angles, (0.9, 0.9, 0.9), size, alpha);
                }
            }
            if (isdefined(level.var_59d3ce664628caf4.cursor_highlight)) {
                function_75f7d0af300ea72a();
                continue;
            }
            if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                draw_node(level.var_59d3ce664628caf4.var_9709609a00e4c585.origin, level.var_59d3ce664628caf4.var_9709609a00e4c585.angles, (1, 1, 0), 16, 0.8);
                draw_node(level.var_59d3ce664628caf4.var_9709609a00e4c585.origin, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (0.1, 0.9, 0.1), 16, 0.97);
                continue;
            }
            function_c1296c6ad87a8500();
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x2a52
    // Size: 0x125
    function function_7835c2cb25c033c9(origin, alpha, size, color, serverduration, text) {
        if (!isdefined(color)) {
            color = (0.9, 0.9, 0.9);
        }
        if (!isdefined(serverduration)) {
            serverduration = 1;
        }
        if (distance2dsquared(level.players[0].origin, origin) > 24000 * 24000) {
            return 0;
        }
        dist = distance2d(level.players[0].origin, origin);
        frac = (dist - 24000) / (30000 - 24000 * 24000);
        alpha = math::lerp(1, 0.2, frac);
        if (dist > 1000) {
            frac = (dist - 1000) / 29000;
            size = math::lerp(size, 100, frac);
            alpha = math::lerp(alpha, 0.5, frac);
        }
        if (!isdefined(text)) {
            text = "<dev string:x699>";
        }
        print3d(origin, text, color, alpha, size, serverduration);
        return 1;
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b7f
    // Size: 0x266
    function function_75f7d0af300ea72a() {
        if (!isdefined(level.var_59d3ce664628caf4.collision_tests)) {
            draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (1, 1, 0), 16);
            return;
        }
        color = (1, 1, 0);
        foreach (test in level.var_59d3ce664628caf4.collision_tests) {
            if (isdefined(test.argstruct.numsegments)) {
                continue;
            }
            origin = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.origin, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
            angles = combineangles(level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, test.angles);
            if (isdefined(test.argstruct.originoffset)) {
                origin += test.argstruct.originoffset;
            }
            if (isdefined(test.argstruct.cylinderradius)) {
                cylinderradius = test.argstruct.cylinderradius;
                cylinderheight = test.argstruct.cylinderheight;
                cylinder(origin, origin + (0, 0, cylinderheight), cylinderradius, color);
                continue;
            }
            if (isdefined(test.argstruct.sphereradius)) {
                sphereradius = test.argstruct.sphereradius;
                sphere(origin, sphereradius, color);
            }
        }
        draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, color, 16);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2ded
    // Size: 0x474
    function function_c1296c6ad87a8500() {
        if (!isdefined(level.var_59d3ce664628caf4.collision_tests)) {
            draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (0.8, 0.8, 0.8), 16);
            return;
        }
        okcolor = (0.8, 0.8, 0.8);
        badcolor = (0.8, 0, 0);
        warningcolor = (0.8, 0.8, 0);
        floattracedist = -100;
        var_818b52ae1635917c = abs(2 / floattracedist);
        origin = undefined;
        angles = undefined;
        foreach (test in level.var_59d3ce664628caf4.collision_tests) {
            if (!isdefined(test.argstruct.numsegments)) {
                origin = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.origin, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
                angles = combineangles(level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, test.angles);
                if (isdefined(test.argstruct.originoffset)) {
                    origin += test.argstruct.originoffset;
                }
            }
            if (isdefined(test.argstruct.numsegments)) {
                for (i = 0; i < test.path.size - 1; i++) {
                    origin = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.path[i], level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
                    origin2 = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.path[i + 1], level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
                    line(origin, origin2, (1, 1, 1), 1, 1);
                }
                continue;
            }
            if (isdefined(test.argstruct.cylinderradius)) {
                cylinderradius = test.argstruct.cylinderradius;
                cylinderheight = test.argstruct.cylinderheight;
                floatingtrace = scripts\engine\trace::capsule_trace(origin, origin + (0, 0, floattracedist), cylinderradius + 2, cylinderheight + 4);
                if (floatingtrace["<dev string:x69b>"] >= var_818b52ae1635917c) {
                    cylinder(origin, origin + (0, 0, cylinderheight), cylinderradius, warningcolor);
                    print3d(origin, abs(floatingtrace["<dev string:x69b>"] * floattracedist), warningcolor);
                } else if (scripts\engine\trace::capsule_trace_passed(origin, origin + (0, 0, 4), cylinderradius + 2, cylinderheight + 4)) {
                    cylinder(origin, origin + (0, 0, cylinderheight), cylinderradius, okcolor);
                } else {
                    cylinder(origin, origin + (0, 0, cylinderheight), cylinderradius, badcolor);
                }
                continue;
            }
            if (isdefined(test.argstruct.sphereradius)) {
                sphereradius = test.argstruct.sphereradius;
                if (scripts\engine\trace::sphere_trace_passed(origin, origin + (0, 0, 4), sphereradius)) {
                    sphere(origin, sphereradius, okcolor);
                    continue;
                }
                sphere(origin, sphereradius, badcolor);
            }
        }
        draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (0.8, 0.8, 0.8), 16);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3269
    // Size: 0x96
    function update_cursor() {
        start = self geteye();
        forward = anglestoforward(self getplayerangles());
        start += forward * 30;
        end = start + forward * 20000;
        trace = ray_trace_detail(start, end);
        phys_trace = trace["<dev string:x6a4>"];
        if (distance(trace["<dev string:x6a4>"], phys_trace) < 0.1) {
            level.var_59d3ce664628caf4.cursor_pos = phys_trace;
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3307
    // Size: 0x2fc
    function function_652652964c77da84() {
        minx = min(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        maxx = max(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        miny = min(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxy = max(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxz = scripts\cp_mp\parachute::getc130height();
        minz = scripts\cp_mp\parachute::getc130sealevel() - 5000;
        spacing = 4000;
        points = [];
        pos = (minx, miny, maxz);
        rownum = 0;
        while (getdvarint(@"hash_19a406e3c51ce52f") > 0) {
            droppedpos = drop_to_ground(pos, 0, -20000);
            if (droppedpos[2] > minz && !scripts\mp\outofbounds::ispointinoutofbounds(droppedpos)) {
                points[points.size] = droppedpos;
            }
            pos += (spacing, 0, 0);
            if (pos[0] > maxx) {
                rownum++;
                pos = (minx, miny + rownum * spacing, maxz);
            }
            if (pos[1] > maxy) {
                break;
            }
            waitframe();
        }
        setdvarifuninitialized(@"hash_803d18a7732cb24b", points.size / 4);
        setdvarifuninitialized(@"hash_ef8fb66dfac2f050", 5);
        while (true) {
            var_327957576570ece5 = getdvarint(@"hash_803d18a7732cb24b");
            drawcount = 0;
            foreach (point in points) {
                inrange = 0;
                if (function_ad0f628e841bd876(point)) {
                    inrange = function_7835c2cb25c033c9(point, 1, 24, (0, 1, 0), getdvarint(@"hash_ef8fb66dfac2f050"));
                } else {
                    inrange = function_7835c2cb25c033c9(point, 1, 24, (1, 0, 0), getdvarint(@"hash_ef8fb66dfac2f050"));
                }
                if (inrange) {
                    drawcount++;
                    if (var_327957576570ece5 > 0 && drawcount >= var_327957576570ece5) {
                        drawcount = 0;
                        waitframe();
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x360b
    // Size: 0x90
    function function_ad0f628e841bd876(point) {
        range = 64000000;
        foreach (struct in level.var_59d3ce664628caf4.var_1c589f8f06d81b70) {
            if (distance2dsquared(point, struct.origin) < range) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x36a3
    // Size: 0xc8
    function draw_node(pos, angles, color, size, alpha, depthtest) {
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
        if (!isdefined(size)) {
            size = 32;
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(depthtest)) {
            depthtest = 0;
        }
        up = anglestoup(angles);
        fwd = anglestoforward(angles);
        start = pos + up;
        end = start + fwd * size;
        draw_small_arrow(start, end, color, alpha, depthtest);
        draw_box(pos, color, angles, size, alpha, depthtest);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x3773
    // Size: 0x133
    function draw_small_arrow(start, end, color, alpha, depthtest) {
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(depthtest)) {
            depthtest = 0;
        }
        angle = vectortoangles(end - start);
        dist = length(end - start);
        forward = anglestoforward(angle);
        forwardfar = forward * dist;
        arrow_size = 5;
        forwardclose = forward * (dist - arrow_size);
        right = anglestoright(angle);
        leftdraw = right * arrow_size * -1;
        rightdraw = right * arrow_size;
        line(start, end, color, alpha, depthtest, 1);
        line(start, start + forwardfar, color, alpha, depthtest, 1);
        line(start + forwardfar, start + forwardclose + rightdraw, color, alpha, depthtest, 1);
        line(start + forwardfar, start + forwardclose + leftdraw, color, alpha, depthtest, 1);
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x38ae
    // Size: 0x1f8
    function draw_box(pos, color, angles, size, alpha, depthtest) {
        if (!isdefined(size)) {
            width = 32;
            height = 32;
        } else if (!isarray(size)) {
            width = size;
            height = size;
        } else {
            width = size[0];
            height = size[1];
        }
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(depthtest)) {
            depthtest = 0;
        }
        forward = anglestoforward(angles);
        right = anglestoright(angles);
        up = anglestoup(angles);
        start = pos + forward * width * 0.5;
        start += right * width * 0.5;
        start += up * height * -0.5;
        points = [];
        points[points.size] = start;
        points[points.size] = points[points.size - 1] + forward * width * -1;
        points[points.size] = points[points.size - 1] + right * width * -1;
        points[points.size] = points[points.size - 1] + forward * width;
        offset = height * up;
        for (i = 0; i < points.size; i++) {
            line(points[i], points[i] + offset, color, alpha, depthtest);
            if (i == points.size - 1) {
                line(points[i], points[0], color, alpha, depthtest);
                line(points[i] + offset, points[0] + offset, color, alpha, depthtest);
                continue;
            }
            line(points[i], points[i + 1], color, alpha, depthtest);
            line(points[i] + offset, points[i + 1] + offset, color, alpha, depthtest);
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3aae
    // Size: 0x6bc
    function function_1ee78b6d0f6f10f7() {
        animstruct = spawnstruct();
        animstruct.istemp = 1;
        animstruct.origin = (-500000, -500000, 0);
        animstruct.angles = (0, 0, 0);
        structs = function_2979939f678d3ad1(function_9afbee75cfe14b8d());
        animstruct.origin = structs[0].origin;
        animstruct.angles = structs[0].angles;
        function_788c4eeeeb69900f();
        players = array_combine([level.player], level.var_861898b95b936d83);
        thread function_2fc595ab59dafc25("<dev string:x6ad>");
        animstruct.winners = players;
        level.br_ending = animstruct;
        wait 1;
        player = level.players[0];
        player_rigs = [];
        var_a6b3fae0395f75c3 = function_9afbee75cfe14b8d();
        animstruct set_ending_pack(var_a6b3fae0395f75c3, undefined);
        level.var_af75c6e5758a8787["<dev string:x6cd>"] = 0;
        level.var_af75c6e5758a8787["<dev string:x6d2>"] = 0;
        level.player thread function_75ef2dd1a0eee7bc(animstruct);
        if (function_b5e265cde17f09d1(var_a6b3fae0395f75c3)) {
            player = level.players[0];
            player setcinematicmotionoverride("<dev string:x654>");
            player utility::hidehudenable();
            index = 0;
            previndex = 0;
            while (true) {
                if (index < 0) {
                    index = 0;
                } else if (index > structs.size - 1) {
                    index = structs.size - 1;
                }
                struct = structs[index];
                if (isdefined(struct.var_fcb6c737b5ecef23)) {
                    println("<dev string:x6d8>");
                    if (index < previndex) {
                        index--;
                    } else {
                        index++;
                    }
                    continue;
                }
                previndex = index;
                animstruct.origin = struct.origin;
                animstruct.angles = struct.angles;
                animstruct set_ending_pack(var_a6b3fae0395f75c3, undefined);
                waitframe();
                str = index + 1 + "<dev string:x6fd>" + structs.size + "<dev string:x701>" + animstruct.origin;
                thread function_2fc595ab59dafc25(str);
                animstruct function_84068c30364b89cb();
                if (level.var_af75c6e5758a8787["<dev string:x6cd>"]) {
                    index--;
                } else {
                    index++;
                }
                level.var_af75c6e5758a8787["<dev string:x6cd>"] = 0;
                level.var_af75c6e5758a8787["<dev string:x6d2>"] = 0;
            }
            return;
        }
        for (i = 0; i < players.size; i++) {
            if (!isdefined(players[i])) {
                continue;
            }
            player = players[i];
            player setcinematicmotionoverride("<dev string:x654>");
            player utility::hidehudenable();
            player create_player_rig(player.animname, "<dev string:x65d>", animstruct);
            player_rigs[player_rigs.size] = player.player_rig;
            scripts\mp\outofbounds::enableoobimmunity(player);
        }
        animstruct.cam delete();
        foreach (pack in animstruct.packs) {
            foreach (ent in pack.ents) {
                if (!isdefined(ent)) {
                    continue;
                }
                if (isdefined(ent.linkedents)) {
                    array_delete(ent.linkedents);
                }
                ent delete();
            }
        }
        animstruct set_ending_pack(var_a6b3fae0395f75c3, undefined);
        index = 0;
        previndex = 0;
        while (true) {
            if (index < 0) {
                index = 0;
            } else if (index > structs.size - 1) {
                index = structs.size - 1;
            }
            struct = structs[index];
            if (isdefined(struct.var_fcb6c737b5ecef23)) {
                println("<dev string:x6d8>");
                if (index < previndex) {
                    index--;
                } else {
                    index++;
                }
                continue;
            }
            previndex = index;
            setomnvarforallclients("<dev string:x703>", 0);
            animstruct.origin = struct.origin;
            animstruct.angles = struct.angles;
            animstruct chopperexfil_set_brcircle();
            animstruct.cam.origin = animstruct.origin;
            animstruct.cam stopanimscripted();
            animstruct anim_first_frame_solo(animstruct.cam, animstruct.packs[0].anime);
            foreach (player in players) {
                player thread player_set_weapon();
                player cameraunlink();
                player stopxcam();
                player playerlinktodelta(player.player_rig, "<dev string:x68e>", 1, 0, 0, 0, 0, 1);
                player.player_rig stopanimscripted();
                player.player_rig unlink();
                player.player_rig.origin = animstruct.origin;
                player.linkedtoent = undefined;
            }
            waitframe();
            if (isdefined(level.players[0].player_rig)) {
                level.players[0] cameralinkto(animstruct.cam, "<dev string:x68e>", 1, 1);
            }
            waitframe();
            str = index + 1 + "<dev string:x6fd>" + structs.size + "<dev string:x701>" + animstruct.origin;
            thread function_2fc595ab59dafc25(str);
            animstruct function_1c6d73d1832aefd6(players, player_rigs);
            if (level.var_af75c6e5758a8787["<dev string:x6cd>"]) {
                index--;
            } else {
                index++;
            }
            level.var_af75c6e5758a8787["<dev string:x6cd>"] = 0;
            level.var_af75c6e5758a8787["<dev string:x6d2>"] = 0;
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4172
    // Size: 0x51
    function function_ab9fd11ef489ccf3() {
        num = self getentitynumber();
        while (true) {
            line(self.origin, self.player_rig.origin);
            print3d(self.origin, num);
            waitframe();
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x41cb
    // Size: 0xb5
    function function_75ef2dd1a0eee7bc(animstruct) {
        self endon("<dev string:x711>");
        while (true) {
            if (!level.var_af75c6e5758a8787["<dev string:x6cd>"] && self buttonpressed("<dev string:x71c>")) {
                level.var_af75c6e5758a8787["<dev string:x6d2>"] = 1;
                level notify("<dev string:x670>");
                animstruct notify("<dev string:x632>");
                wait 0.4;
            } else if (!level.var_af75c6e5758a8787["<dev string:x6d2>"] && self buttonpressed("<dev string:x727>")) {
                level.var_af75c6e5758a8787["<dev string:x6cd>"] = 1;
                level notify("<dev string:x670>");
                animstruct notify("<dev string:x632>");
                wait 0.4;
            }
            waitframe();
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4288
    // Size: 0x131
    function function_2fc595ab59dafc25(text, time) {
        level notify("<dev string:x731>");
        level endon("<dev string:x731>");
        if (!isdefined(level.var_2e10660bd87fffd9)) {
            level.var_2e10660bd87fffd9 = newhudelem();
            level.var_2e10660bd87fffd9.archived = 0;
            level.var_2e10660bd87fffd9.vertalign = "<dev string:x4eb>";
            level.var_2e10660bd87fffd9.horzalign = "<dev string:x4f2>";
            level.var_2e10660bd87fffd9.aligny = "<dev string:x4eb>";
            level.var_2e10660bd87fffd9.alignx = "<dev string:x4f2>";
            level.var_2e10660bd87fffd9.y = 80;
            level.var_2e10660bd87fffd9.fontscale = 1.2;
        }
        level.var_2e10660bd87fffd9.alpha = 1;
        level.var_2e10660bd87fffd9 setdevtext(text);
        println(text);
        if (isdefined(time)) {
            wait time;
            level.var_2e10660bd87fffd9.alpha = 0;
        }
    }

    // Namespace namespace_bc2bdb06de29485d / namespace_db13b5d5ab9bfe9c
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x43c1
    // Size: 0x23d
    function function_53e397de3c413997() {
        structs = function_2979939f678d3ad1(function_9afbee75cfe14b8d());
        minx = min(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        maxx = max(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        miny = min(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxy = max(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxz = scripts\cp_mp\parachute::getc130height();
        midpointx = minx + (maxx - minx) * 0.5;
        midpointy = miny + (maxy - miny) * 0.5;
        origin = (midpointx, midpointy, maxz);
        angles = (72, 90, 0);
        if (!level.player isnoclip()) {
            level.player noclip();
        }
        level.player setorigin(origin);
        level.player setplayerangles(angles);
        while (getdvarint(@"hash_2d200a3da7fb2518") == 2) {
            foreach (struct in structs) {
                function_7835c2cb25c033c9(struct.origin, 1, 1000);
            }
            waitframe();
        }
    }

#/
