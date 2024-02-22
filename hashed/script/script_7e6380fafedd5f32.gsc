// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_77c18cdedec620b3;
#using script_38eb8f4be20d54f4;
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

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1cb
// Size: 0x47
function private function_5197cc12048f8766(type) {
    switch (type) {
    case #"hash_d9cfbe7fb5447f0e":
        return namespace_1cf0585e9841d60a::function_a5538b1593309bb0();
    case #"hash_1136bc3322c0a548":
    default:
        return namespace_d0436b1a1618abfc::function_a5538b1593309bb0();
        break;
    }
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x219
// Size: 0x9f
function private function_2845c7aff5b6d7b6(type) {
    switch (type) {
    case #"hash_d9cfbe7fb5447f0e":
        return namespace_1cf0585e9841d60a::get_chopperexfil_transient();
    case #"hash_18208461fac4f35e":
        return namespace_75ba454ed5255c2::function_2023eb5589c72085();
    case #"hash_8e482dd76314929c":
        jumpiffalse(namespace_3c37cb17ade254d::issharedfuncdefined("br_ending_chopper_no_hq", "chopperHQExfil_init")) LOC_00000044;
        return [[ namespace_3c37cb17ade254d::getsharedfunc("br_ending_chopper_no_hq", "get_chopperExfil_transient") ]]();
    case #"hash_ce37a6540166b6f7":
    LOC_00000044:
        return namespace_91542927cd719085::function_aafaf24d80927b02();
    case #"hash_1136bc3322c0a548":
    default:
        return namespace_d0436b1a1618abfc::get_chopperexfil_transient();
        break;
    }
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf
// Size: 0x15c
function function_38b44913b9bec05f(players) {
    /#
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
                namespace_e6eafa63d63ab54d::spawn_test_clients(var_b747aaa441b7aea9);
            }
            wait(1);
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
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x422
// Size: 0x2a0
function function_181c965102053e79(var_13fe2b86c5e85a64, var_9156b53bcf7ce573) {
    /#
        array = [];
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        array["<unknown string>"] = "<unknown string>";
        skinref = undefined;
        dvar = function_2ef675c13ca1c4af(@"hash_e340a5ee5afde790", self getentitynumber());
        dvarval = getdvar(dvar);
        if (dvarval != "<unknown string>" && isdefined(array[dvarval])) {
            skinref = array[dvarval];
        } else {
            var_5eddc5152a128d55 = function_7a2aaa4a09a4d250(getarraykeys(array));
            skinref = array[var_5eddc5152a128d55];
        }
        operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
        namespace_6d8da2b47f878104::createoperatorcustomization(operatorref, undefined);
        namespace_d19129e4fa5d176::giveloadout(self.team, self.class, undefined, undefined, 0);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c9
// Size: 0x65
function function_117a90f752406598() {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        setdvarifuninitialized(@"hash_5d7942ff9a328997", 1);
        if (!isdefined(level.var_c192bb3f79de7dbf)) {
            level namespace_8885c19c053dcb46::function_c24d9aca5f9eba35();
        }
        br_ending::play_ending(teams::getteamdata(host.team, "<unknown string>"), host.origin);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x735
// Size: 0x3d3
function function_9dd3d565e1ba2f03() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_117a90f752406598);
        devgui::function_fe953f000498048f();
        var_290b775dfa48665 = 0;
        var_ebe477033d06f099 = 0;
        while (!isdefined(level.players) || level.players.size == 0) {
            wait(1);
        }
        wait(20);
        while (1) {
            wait(0.1);
            if (!var_ebe477033d06f099 && !var_290b775dfa48665 && getdvarint(@"hash_19a406e3c51ce52f")) {
                level.br_ending_debugmode = 1;
                thread function_2fc595ab59dafc25("<unknown string>");
                var_290b775dfa48665 = 1;
                thread function_652652964c77da84();
                foreach (player in level.players) {
                    if (player ishost()) {
                        player thread function_facc80fe01aef30();
                    }
                }
            } else if (var_290b775dfa48665 && !getdvarint(@"hash_19a406e3c51ce52f")) {
                var_290b775dfa48665 = 0;
                level notify("<unknown string>");
                thread function_2fc595ab59dafc25("<unknown string>", 3);
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
                winners = namespace_54d20dd0dd79277f::getteamdata(player.team, "<unknown string>");
                var_a6b3fae0395f75c3 = namespace_d92c3c983abee514::function_9afbee75cfe14b8d();
                transientname = function_2845c7aff5b6d7b6(var_a6b3fae0395f75c3);
                loadinfiltransient(transientname);
                var_24b79087f3897e94 = 0;
                while (!var_24b79087f3897e94) {
                    waitframe();
                    var_24b79087f3897e94 = function_2030cc4ad67d1634(transientname);
                }
                play_ending(winners, player.origin);
                setdvar(@"hash_5be228e043cb645a", 0);
            }
            if (getdvarint(@"hash_9f63b6e7903d0e54", -1) > -1) {
                var_8f1057797cdc8d3 = getdvarint(@"hash_9f63b6e7903d0e54");
                foreach (player in level.players) {
                    if (var_8f1057797cdc8d3 == player getentitynumber()) {
                        if (isalive(player)) {
                            player kill();
                            break;
                        }
                    }
                }
                setdvar(@"hash_9f63b6e7903d0e54", -1);
            }
            if (getdvarint(@"hash_c331bd97a07debe2", -1) > -1) {
                var_63dfe2fe84d577f9 = getdvarint(@"hash_c331bd97a07debe2");
                println("<unknown string>" + var_63dfe2fe84d577f9);
                foreach (player in level.players) {
                    if (var_63dfe2fe84d577f9 == player getentitynumber()) {
                        kick(var_63dfe2fe84d577f9, "<unknown string>");
                        break;
                    }
                }
                setdvar(@"hash_c331bd97a07debe2", -1);
            }
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0f
// Size: 0x7d8
function function_facc80fe01aef30() {
    /#
        level endon("<unknown string>");
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
        var_24b79087f3897e94 = 0;
        while (!var_24b79087f3897e94) {
            waitframe();
            var_24b79087f3897e94 = function_2030cc4ad67d1634(transientname);
        }
        if (!function_b5e265cde17f09d1(var_a6b3fae0395f75c3)) {
            level.var_59d3ce664628caf4.var_4fe7323ea7b84d81 = function_b1e9104bb425eed6(var_a6b3fae0395f75c3);
        }
        childthread function_8549351ef281335c();
        while (1) {
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
                wait(0.4);
            } else if (self weaponswitchbuttonpressed()) {
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
                wait(0.4);
            } else if (self fragbuttonpressed()) {
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
                wait(0.4);
            } else if (self secondaryoffhandbuttonpressed()) {
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
                wait(0.4);
            } else if (self buttonpressed("<unknown string>")) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    origin = level.var_59d3ce664628caf4.var_9709609a00e4c585.origin + (0, 0, 6);
                    angles = level.var_59d3ce664628caf4.var_9709609a00e4c585.angles;
                    function_83f63b509c56f86c();
                    function_ce2d34095221c720();
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.origin = origin;
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.angles = angles;
                } else {
                    level.var_59d3ce664628caf4.var_15042a5b64d3849c = int(level.var_59d3ce664628caf4.var_15042a5b64d3849c + 6);
                    iprintlnbold("<unknown string>" + level.var_59d3ce664628caf4.var_15042a5b64d3849c);
                }
                wait(0.4);
            } else if (self buttonpressed("<unknown string>")) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    origin = level.var_59d3ce664628caf4.var_9709609a00e4c585.origin + (0, 0, -6);
                    angles = level.var_59d3ce664628caf4.var_9709609a00e4c585.angles;
                    function_83f63b509c56f86c();
                    function_ce2d34095221c720();
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.origin = origin;
                    level.var_59d3ce664628caf4.var_9709609a00e4c585.angles = angles;
                } else {
                    level.var_59d3ce664628caf4.var_15042a5b64d3849c = int(level.var_59d3ce664628caf4.var_15042a5b64d3849c - 6);
                    iprintlnbold("<unknown string>" + level.var_59d3ce664628caf4.var_15042a5b64d3849c);
                }
                wait(0.4);
            } else if (self buttonpressed("<unknown string>")) {
                level.var_59d3ce664628caf4.var_15042a5b64d3849c = 0;
                iprintlnbold("<unknown string>" + level.var_59d3ce664628caf4.var_15042a5b64d3849c);
                wait(0.4);
            } else if (self meleebuttonpressed()) {
                level.var_59d3ce664628caf4.var_270f34f785b2df1f = !level.var_59d3ce664628caf4.var_270f34f785b2df1f;
                if (level.var_59d3ce664628caf4.var_270f34f785b2df1f) {
                    iprintlnbold("<unknown string>");
                } else {
                    iprintlnbold("<unknown string>");
                }
                wait(0.4);
            } else if (self sprintbuttonpressed()) {
                if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                    endtime = gettime() + 2000;
                    while (gettime() < endtime && self sprintbuttonpressed()) {
                        waitframe();
                    }
                    iprintlnbold("<unknown string>");
                    function_f5c4b4c2a4e8e220(level.var_59d3ce664628caf4.var_9709609a00e4c585);
                    wait(0.4);
                } else {
                    function_2fc595ab59dafc25("<unknown string>", 1);
                }
            }
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ee
// Size: 0x20b
function function_b1e9104bb425eed6(var_a6b3fae0395f75c3) {
    /#
        array = [];
        structs = [];
        var_de6ea8141b1e5a8b = newhudelem();
        var_de6ea8141b1e5a8b.vertalign = "<unknown string>";
        var_de6ea8141b1e5a8b.horzalign = "<unknown string>";
        var_de6ea8141b1e5a8b.aligny = "<unknown string>";
        var_de6ea8141b1e5a8b.x = -250;
        var_de6ea8141b1e5a8b.y = 100;
        var_de6ea8141b1e5a8b setshader("<unknown string>", 500, 16);
        bar = newhudelem();
        bar.vertalign = "<unknown string>";
        bar.horzalign = "<unknown string>";
        bar.aligny = "<unknown string>";
        bar.x = -250 + int(2);
        bar.y = 100;
        bar.sort = 1;
        bar.maxwidth = 496;
        bar.maxheight = 12;
        bar setshader("<unknown string>", 0, 12);
        bar.percent = 0;
        level.var_59d3ce664628caf4.bar = bar;
        var_79a78f73d2d4925d = function_5197cc12048f8766(var_a6b3fae0395f75c3);
        foreach (i, var_4f1d789758fc3b7a in var_79a78f73d2d4925d) {
            structs[structs.size] = function_efc9d79fca4c313d(var_4f1d789758fc3b7a);
            function_cbe0091e35eece28(i / var_79a78f73d2d4925d.size);
        }
        bar function_cbe0091e35eece28(1);
        waitframe();
        var_de6ea8141b1e5a8b destroy();
        bar destroy();
        if (isdefined(level.var_2e10660bd87fffd9)) {
            level.var_2e10660bd87fffd9.alpha = 0;
        }
        return structs;
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1500
// Size: 0x63
function function_cbe0091e35eece28(percent) {
    /#
        bar = level.var_59d3ce664628caf4.bar;
        bar.percent = percent;
        bar scaleovertime(0.05, int(bar.maxwidth * percent), bar.maxheight);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156a
// Size: 0x18
function function_e71304c34e3c6962(var_4f1d789758fc3b7a) {
    /#
        self useanimtree(%mp_vehicles_always_loaded);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1589
// Size: 0x18
function function_9cb7084e67f532c9(var_4f1d789758fc3b7a) {
    /#
        self useanimtree(%mp_vehicles_always_loaded);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15a8
// Size: 0x31
function function_55ed5b4967f1130d(var_4f1d789758fc3b7a) {
    /#
        if (istrue(var_4f1d789758fc3b7a.var_d4364a524e8a2bcd)) {
            function_e71304c34e3c6962(var_4f1d789758fc3b7a);
        } else {
            function_9cb7084e67f532c9(var_4f1d789758fc3b7a);
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15e0
// Size: 0x2ee
function function_efc9d79fca4c313d(var_4f1d789758fc3b7a) {
    /#
        angles = (0, 0, 0);
        origin = (0, 0, 0);
        struct = spawnstruct();
        struct.var_4f1d789758fc3b7a = var_4f1d789758fc3b7a;
        if (isdefined(var_4f1d789758fc3b7a.numsegments)) {
            /#
                assert(isdefined(var_4f1d789758fc3b7a.modelname));
            #/
            /#
                assert(var_4f1d789758fc3b7a.numsegments > 0);
            #/
            model = spawn("<unknown string>", origin);
            model.angles = angles;
            model setmodel(var_4f1d789758fc3b7a.modelname);
            model function_55ed5b4967f1130d(var_4f1d789758fc3b7a);
            model animscripted(var_4f1d789758fc3b7a.var_e26f44acad48ddd1, origin, angles, var_4f1d789758fc3b7a.var_e26f44acad48ddd1, undefined, undefined, 0);
            var_83d1f8bc2e98b122 = 1 / var_4f1d789758fc3b7a.numsegments;
            struct.path = [];
            for (i = 0; i < var_4f1d789758fc3b7a.numsegments; i++) {
                model setanimtime(var_4f1d789758fc3b7a.var_e26f44acad48ddd1, var_83d1f8bc2e98b122 * i);
                wait(0.1);
                if (i > 0) {
                    jumpiffalse(distancesquared(struct.path[struct.path.size - 1], model.origin) < 2500) LOC_0000018e;
                } else {
                LOC_0000018e:
                    struct.path[struct.path.size] = model.origin;
                }
            }
            model delete();
        } else if (isdefined(var_4f1d789758fc3b7a.var_c77e7a25454430da)) {
            model = spawn("<unknown string>", origin);
            model.angles = angles;
            model setmodel(var_4f1d789758fc3b7a.modelname);
            model function_55ed5b4967f1130d(var_4f1d789758fc3b7a);
            model animscripted(var_4f1d789758fc3b7a.var_e26f44acad48ddd1, origin, angles, var_4f1d789758fc3b7a.var_e26f44acad48ddd1, undefined, undefined, 0);
            wait(0.1);
            model setanimtime(var_4f1d789758fc3b7a.var_e26f44acad48ddd1, var_4f1d789758fc3b7a.var_c447f0ac96c38753);
            wait(0.1);
            struct.origin = model.origin;
            struct.angles = model.angles;
            model delete();
        } else {
            /#
                assert(isdefined(var_4f1d789758fc3b7a.var_715d3504e80c76e9));
            #/
            struct.origin = getstartorigin(origin, angles, var_4f1d789758fc3b7a.var_e26f44acad48ddd1) + (0, 0, 2);
            struct.angles = getstartangles(origin, angles, var_4f1d789758fc3b7a.var_e26f44acad48ddd1);
            waitframe();
        }
        return struct;
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18d5
// Size: 0x167
function function_54b03fa89c164504() {
    /#
        startpos = (-60000, -60000, 0);
        structs = sortbydistance(level.var_59d3ce664628caf4.var_1c589f8f06d81b70, startpos);
        println("<unknown string>");
        println("<unknown string>");
        for (i = 0; i < structs.size; i++) {
            if (isdefined(structs[i].var_fcb6c737b5ecef23)) {
                println("<unknown string>" + i + "<unknown string>" + structs[i].origin + "<unknown string>" + structs[i].angles + "<unknown string>");
            } else {
                println("<unknown string>" + i + "<unknown string>" + structs[i].origin + "<unknown string>" + structs[i].angles + "<unknown string>");
            }
        }
        println("<unknown string>");
        total = structs.size;
        diff = total - level.var_59d3ce664628caf4.var_e4211a476e76b65a;
        thread function_2fc595ab59dafc25("<unknown string>" + total + "<unknown string>" + diff, 8);
        println("<unknown string>" + total + "<unknown string>" + diff + "<unknown string>");
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a43
// Size: 0x1d9
function function_83f63b509c56f86c() {
    /#
        var_a6b3fae0395f75c3 = function_9afbee75cfe14b8d();
        if (!isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585) || !function_b5e265cde17f09d1(var_a6b3fae0395f75c3) && !isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585.packs)) {
            return;
        }
        level.var_59d3ce664628caf4.var_9709609a00e4c585 notify("<unknown string>");
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
            level.player function_8ff8fd7841f6eba2();
        }
        level.var_59d3ce664628caf4.var_9709609a00e4c585 = undefined;
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c23
// Size: 0x3d
function function_f5c4b4c2a4e8e220(var_883967932e42da24) {
    /#
        level.var_59d3ce664628caf4.var_1c589f8f06d81b70 = array_remove(level.var_59d3ce664628caf4.var_1c589f8f06d81b70, var_883967932e42da24);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c67
// Size: 0x105
function function_ce2d34095221c720(var_204f79c2ff71fbc) {
    /#
        if (isdefined(var_204f79c2ff71fbc)) {
            animstruct = var_204f79c2ff71fbc;
        } else {
            animstruct = spawnstruct();
            animstruct.origin = level.var_59d3ce664628caf4.cursor_pos;
            animstruct.angles = level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34;
        }
        animstruct.pack = spawnstruct();
        animstruct.pack.models = [];
        animstruct.pack.players = [];
        animstruct.pack.cams = [];
        animstruct.var_ac180ceb6dc3c95b = 1;
        level.var_59d3ce664628caf4.var_9709609a00e4c585 = animstruct;
        level.br_ending = animstruct;
        level.var_59d3ce664628caf4.var_9709609a00e4c585 function_980d0b7c0096bb37();
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d73
// Size: 0x169
function function_980d0b7c0096bb37() {
    /#
        self endon("<unknown string>");
        waitframe();
        if (level.script != "<unknown string>" && !isdefined(level.var_861898b95b936d83)) {
            function_788c4eeeeb69900f();
        }
        players = array_combine([0:level.player], level.var_861898b95b936d83);
        self.winners = players;
        var_a6b3fae0395f75c3 = function_9afbee75cfe14b8d();
        set_ending_pack(var_a6b3fae0395f75c3, undefined);
        wait(1);
        if (function_b5e265cde17f09d1(var_a6b3fae0395f75c3)) {
            player = level.players[0];
            player setcinematicmotionoverride("<unknown string>");
            player utility::hidehudenable();
            childthread function_84068c30364b89cb();
        } else {
            player = level.players[0];
            player_rigs = [];
            for (i = 0; i < players.size; i++) {
                if (!isdefined(players[i])) {
                    continue;
                }
                player = players[i];
                player setcinematicmotionoverride("<unknown string>");
                player utility::hidehudenable();
                if (getdvarint(@"hash_dd3266b5409a856b") && player ishost()) {
                    continue;
                }
                player create_player_rig(player.animname, "<unknown string>", self);
                player_rigs[player_rigs.size] = player.player_rig;
            }
            childthread function_6c67cb42fa6c83d2(players, player_rigs);
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee3
// Size: 0x10f
function function_788c4eeeeb69900f() {
    /#
        var_b747aaa441b7aea9 = 3;
        namespace_e6eafa63d63ab54d::spawn_test_clients(var_b747aaa441b7aea9);
        level.var_861898b95b936d83 = [];
        foreach (player in level.players) {
            if (istestclient(player)) {
                level.var_861898b95b936d83[level.var_861898b95b936d83.size] = player;
            }
        }
        while (1) {
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
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff9
// Size: 0x38
function function_6c67cb42fa6c83d2(players, player_rigs, play_once) {
    /#
        childthread function_9b6ad484e6bfa268();
        while (1) {
            function_1c6d73d1832aefd6(players, player_rigs);
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2038
// Size: 0x4af
function function_1c6d73d1832aefd6(players, player_rigs) {
    /#
        level endon("<unknown string>");
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
                    } else {
                        thread anim_player_solo(player, player.player_rig, pack.anime);
                    }
                }
            }
            if (pack.ents.size > 0) {
                foreach (ent in pack.ents) {
                    if (!istrue(ent.var_6a704063a0555c1d)) {
                        ent dontinterpolate();
                    }
                }
                thread anim_single(pack.ents, pack.anime);
            }
            var_b5b3f37d2c2ec7ef = 0;
            if (!isdefined(level.var_59d3ce664628caf4)) {
                var_b5b3f37d2c2ec7ef = 1;
            } else if (istrue(level.var_59d3ce664628caf4.var_270f34f785b2df1f)) {
                var_b5b3f37d2c2ec7ef = 1;
            }
            if (isdefined(pack.var_437b6bb41d98df26)) {
                self.cam dontinterpolate();
                thread anim_single_solo(self.cam, pack.anime);
                foreach (player in level.players) {
                    player cameraunlink();
                }
                var_8355076d4ed3fc96 = function_4358b309fdcc6d44(pack.var_437b6bb41d98df26);
                var_8355076d4ed3fc96 = var_8355076d4ed3fc96 - 0.033;
                var_8355076d4ed3fc96 = var_8355076d4ed3fc96 - mod(var_8355076d4ed3fc96, 0.05);
                self.var_437b6bb41d98df26 = pack.var_437b6bb41d98df26;
                self.var_65c40a3d7dcd8ca3 = gettime();
                if (var_b5b3f37d2c2ec7ef) {
                    level.players[0] playxcam(pack.var_437b6bb41d98df26, 0, self.origin, self.angles);
                    self.var_1384d8bd817f644 = 1;
                }
                wait(var_8355076d4ed3fc96);
            } else {
                foreach (player in level.players) {
                    player function_8ff8fd7841f6eba2();
                }
                self.var_437b6bb41d98df26 = undefined;
                self.var_65c40a3d7dcd8ca3 = undefined;
                self.var_1384d8bd817f644 = 0;
                if (var_b5b3f37d2c2ec7ef) {
                    level.players[0] cameralinkto(self.cam, "<unknown string>", 1, 1);
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
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24ee
// Size: 0x11a
function function_9b6ad484e6bfa268() {
    /#
        wait(0.1);
        while (1) {
            if (level.var_59d3ce664628caf4.var_270f34f785b2df1f) {
                if (isdefined(self.var_437b6bb41d98df26) && isdefined(self.var_65c40a3d7dcd8ca3)) {
                    if (!istrue(self.var_1384d8bd817f644)) {
                        timeoffset = (gettime() - self.var_65c40a3d7dcd8ca3) * 0.001;
                        level.players[0] playxcam(self.var_437b6bb41d98df26, 0, self.origin, self.angles, timeoffset);
                        self.var_1384d8bd817f644 = 1;
                    }
                } else if (isdefined(level.players[0].player_rig)) {
                    level.players[0] cameralinkto(self.cam, "<unknown string>", 1, 1);
                }
            } else {
                level.players[0] cameraunlink();
                level.players[0] function_8ff8fd7841f6eba2();
                self.var_1384d8bd817f644 = 0;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x260f
// Size: 0x43c
function function_8549351ef281335c() {
    /#
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
        while (1) {
            waitframe();
            function_cb2cb72c55b4dc57();
            level.var_59d3ce664628caf4.cursor_pos = level.var_59d3ce664628caf4.cursor_pos + (0, 0, level.var_59d3ce664628caf4.var_15042a5b64d3849c);
            level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34 = angleclamp180(self.angles + (0, level.var_59d3ce664628caf4.var_563a1ce3c161c5db, 0));
            level.var_59d3ce664628caf4.cursor_highlight = undefined;
            foreach (index, struct in level.var_59d3ce664628caf4.var_1c589f8f06d81b70) {
                distsqrd = distance2dsquared(level.players[0].origin, struct.origin);
                if (distsqrd < squared(var_c5409ca7522182b3)) {
                    if (!isdefined(level.var_59d3ce664628caf4.cursor_highlight) && distance2dsquared(struct.origin, level.var_59d3ce664628caf4.cursor_pos) < 40000) {
                        level.var_59d3ce664628caf4.cursor_highlight = struct;
                        level.var_59d3ce664628caf4.cursor_pos = struct.origin;
                        level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34 = struct.angles;
                    } else {
                        alpha = 1;
                        size = 32;
                        if (distsqrd > var_785529d63cfd5142) {
                            if (!isdefined(struct.var_fcb6c737b5ecef23)) {
                                function_7835c2cb25c033c9(struct.origin, alpha, size, (1, 1, 0), undefined, index);
                            } else {
                                function_7835c2cb25c033c9(struct.origin, alpha, size, undefined, undefined, index);
                            }
                        } else {
                            draw_node(struct.origin, struct.angles, (0.9, 0.9, 0.9), size, alpha);
                        }
                    }
                }
            }
            if (isdefined(level.var_59d3ce664628caf4.cursor_highlight)) {
                function_75f7d0af300ea72a();
            } else if (isdefined(level.var_59d3ce664628caf4.var_9709609a00e4c585)) {
                draw_node(level.var_59d3ce664628caf4.var_9709609a00e4c585.origin, level.var_59d3ce664628caf4.var_9709609a00e4c585.angles, (1, 1, 0), 16, 0.8);
                draw_node(level.var_59d3ce664628caf4.var_9709609a00e4c585.origin, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (0.1, 0.9, 0.1), 16, 0.97);
            } else {
                function_c1296c6ad87a8500();
            }
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2a52
// Size: 0x126
function function_7835c2cb25c033c9(origin, alpha, size, color, var_a623f8e7a79f29da, text) {
    /#
        if (!isdefined(color)) {
            color = (0.9, 0.9, 0.9);
        }
        if (!isdefined(var_a623f8e7a79f29da)) {
            var_a623f8e7a79f29da = 1;
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
            text = "<unknown string>";
        }
        print3d(origin, text, color, alpha, size, var_a623f8e7a79f29da);
        return 1;
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b7f
// Size: 0x267
function function_75f7d0af300ea72a() {
    /#
        if (!isdefined(level.var_59d3ce664628caf4.var_4fe7323ea7b84d81)) {
            draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (1, 1, 0), 16);
            return;
        }
        color = (1, 1, 0);
        foreach (test in level.var_59d3ce664628caf4.var_4fe7323ea7b84d81) {
            if (isdefined(test.var_4f1d789758fc3b7a.numsegments)) {
                continue;
            }
            origin = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.origin, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
            angles = combineangles(level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, test.angles);
            if (isdefined(test.var_4f1d789758fc3b7a.originoffset)) {
                origin = origin + test.var_4f1d789758fc3b7a.originoffset;
            }
            if (isdefined(test.var_4f1d789758fc3b7a.var_715d3504e80c76e9)) {
                var_715d3504e80c76e9 = test.var_4f1d789758fc3b7a.var_715d3504e80c76e9;
                var_c580ce41c807e164 = test.var_4f1d789758fc3b7a.var_c580ce41c807e164;
                cylinder(origin, origin + (0, 0, var_c580ce41c807e164), var_715d3504e80c76e9, color);
            } else if (isdefined(test.var_4f1d789758fc3b7a.var_c77e7a25454430da)) {
                var_c77e7a25454430da = test.var_4f1d789758fc3b7a.var_c77e7a25454430da;
                sphere(origin, var_c77e7a25454430da, color);
            }
        }
        draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, color, 16);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ded
// Size: 0x475
function function_c1296c6ad87a8500() {
    /#
        if (!isdefined(level.var_59d3ce664628caf4.var_4fe7323ea7b84d81)) {
            draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (0.8, 0.8, 0.8), 16);
            return;
        }
        var_349566844e5285e2 = (0.8, 0.8, 0.8);
        var_eeb3a43157c13cbb = (0.8, 0, 0);
        var_24e6fc68ea102d22 = (0.8, 0.8, 0);
        var_9d987552dc67e97e = -100;
        var_818b52ae1635917c = abs(2 / var_9d987552dc67e97e);
        origin = undefined;
        angles = undefined;
        foreach (test in level.var_59d3ce664628caf4.var_4fe7323ea7b84d81) {
            if (!isdefined(test.var_4f1d789758fc3b7a.numsegments)) {
                origin = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.origin, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
                angles = combineangles(level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, test.angles);
                if (isdefined(test.var_4f1d789758fc3b7a.originoffset)) {
                    origin = origin + test.var_4f1d789758fc3b7a.originoffset;
                }
            }
            if (isdefined(test.var_4f1d789758fc3b7a.numsegments)) {
                for (i = 0; i < test.path.size - 1; i++) {
                    origin = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.path[i], level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
                    origin2 = level.var_59d3ce664628caf4.cursor_pos + rotatevector(test.path[i + 1], level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34);
                    line(origin, origin2, (1, 1, 1), 1, 1);
                }
            } else if (isdefined(test.var_4f1d789758fc3b7a.var_715d3504e80c76e9)) {
                var_715d3504e80c76e9 = test.var_4f1d789758fc3b7a.var_715d3504e80c76e9;
                var_c580ce41c807e164 = test.var_4f1d789758fc3b7a.var_c580ce41c807e164;
                var_2d556d5fbee19d44 = namespace_2a184fc4902783dc::capsule_trace(origin, origin + (0, 0, var_9d987552dc67e97e), var_715d3504e80c76e9 + 2, var_c580ce41c807e164 + 4);
                if (var_2d556d5fbee19d44["<unknown string>"] >= var_818b52ae1635917c) {
                    cylinder(origin, origin + (0, 0, var_c580ce41c807e164), var_715d3504e80c76e9, var_24e6fc68ea102d22);
                    print3d(origin, abs(var_2d556d5fbee19d44["<unknown string>"] * var_9d987552dc67e97e), var_24e6fc68ea102d22);
                } else if (namespace_2a184fc4902783dc::capsule_trace_passed(origin, origin + (0, 0, 4), var_715d3504e80c76e9 + 2, var_c580ce41c807e164 + 4)) {
                    cylinder(origin, origin + (0, 0, var_c580ce41c807e164), var_715d3504e80c76e9, var_349566844e5285e2);
                } else {
                    cylinder(origin, origin + (0, 0, var_c580ce41c807e164), var_715d3504e80c76e9, var_eeb3a43157c13cbb);
                }
            } else if (isdefined(test.var_4f1d789758fc3b7a.var_c77e7a25454430da)) {
                var_c77e7a25454430da = test.var_4f1d789758fc3b7a.var_c77e7a25454430da;
                if (namespace_2a184fc4902783dc::sphere_trace_passed(origin, origin + (0, 0, 4), var_c77e7a25454430da)) {
                    sphere(origin, var_c77e7a25454430da, var_349566844e5285e2);
                } else {
                    sphere(origin, var_c77e7a25454430da, var_eeb3a43157c13cbb);
                }
            }
        }
        draw_node(level.var_59d3ce664628caf4.cursor_pos, level.var_59d3ce664628caf4.var_6ef3ac9a0c3d9f34, (0.8, 0.8, 0.8), 16);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3269
// Size: 0x97
function function_cb2cb72c55b4dc57() {
    /#
        start = self geteye();
        forward = anglestoforward(self getplayerangles());
        start = start + forward * 30;
        end = start + forward * 20000;
        trace = ray_trace_detail(start, end);
        var_471e78cdcf5f5667 = trace["<unknown string>"];
        if (distance(trace["<unknown string>"], var_471e78cdcf5f5667) < 0.1) {
            level.var_59d3ce664628caf4.cursor_pos = var_471e78cdcf5f5667;
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3307
// Size: 0x2fd
function function_652652964c77da84() {
    /#
        minx = min(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        maxx = max(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        miny = min(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxy = max(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxz = namespace_5078ee98abb32db9::getc130height();
        minz = namespace_5078ee98abb32db9::getc130sealevel() - 5000;
        spacing = 4000;
        points = [];
        pos = (minx, miny, maxz);
        rownum = 0;
        while (getdvarint(@"hash_19a406e3c51ce52f") > 0) {
            var_3627f3c8c6351d4d = drop_to_ground(pos, 0, -20000);
            if (var_3627f3c8c6351d4d[2] > minz && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_3627f3c8c6351d4d)) {
                points[points.size] = var_3627f3c8c6351d4d;
            }
            pos = pos + (spacing, 0, 0);
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
        while (1) {
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
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x360b
// Size: 0x91
function function_ad0f628e841bd876(point) {
    /#
        range = 64000000;
        foreach (struct in level.var_59d3ce664628caf4.var_1c589f8f06d81b70) {
            if (distance2dsquared(point, struct.origin) < range) {
                return 1;
            }
        }
        return 0;
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x36a3
// Size: 0xc9
function draw_node(pos, angles, color, size, alpha, depthtest) {
    /#
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
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3773
// Size: 0x134
function draw_small_arrow(start, end, color, alpha, depthtest) {
    /#
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
        var_6d57df1b675794b6 = 5;
        forwardclose = forward * (dist - var_6d57df1b675794b6);
        right = anglestoright(angle);
        leftdraw = right * var_6d57df1b675794b6 * -1;
        rightdraw = right * var_6d57df1b675794b6;
        line(start, end, color, alpha, depthtest, 1);
        line(start, start + forwardfar, color, alpha, depthtest, 1);
        line(start + forwardfar, start + forwardclose + rightdraw, color, alpha, depthtest, 1);
        line(start + forwardfar, start + forwardclose + leftdraw, color, alpha, depthtest, 1);
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x38ae
// Size: 0x1f9
function draw_box(pos, color, angles, size, alpha, depthtest) {
    /#
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
        start = start + right * width * 0.5;
        start = start + up * height * -0.5;
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
            } else {
                line(points[i], points[i + 1], color, alpha, depthtest);
                line(points[i] + offset, points[i + 1] + offset, color, alpha, depthtest);
            }
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3aae
// Size: 0x6bd
function function_1ee78b6d0f6f10f7() {
    /#
        animstruct = spawnstruct();
        animstruct.var_ac180ceb6dc3c95b = 1;
        animstruct.origin = (-500000, -500000, 0);
        animstruct.angles = (0, 0, 0);
        structs = function_2979939f678d3ad1(function_9afbee75cfe14b8d());
        animstruct.origin = structs[0].origin;
        animstruct.angles = structs[0].angles;
        function_788c4eeeeb69900f();
        players = array_combine([0:level.player], level.var_861898b95b936d83);
        thread function_2fc595ab59dafc25("<unknown string>");
        animstruct.winners = players;
        level.br_ending = animstruct;
        wait(1);
        player = level.players[0];
        player_rigs = [];
        var_a6b3fae0395f75c3 = function_9afbee75cfe14b8d();
        animstruct set_ending_pack(var_a6b3fae0395f75c3, undefined);
        level.var_af75c6e5758a8787["<unknown string>"] = 0;
        level.var_af75c6e5758a8787["<unknown string>"] = 0;
        level.player thread function_75ef2dd1a0eee7bc(animstruct);
        if (function_b5e265cde17f09d1(var_a6b3fae0395f75c3)) {
            player = level.players[0];
            player setcinematicmotionoverride("<unknown string>");
            player utility::hidehudenable();
            index = 0;
            var_88d6da250cc3e7d8 = 0;
            while (1) {
                if (index < 0) {
                    index = 0;
                } else if (index > structs.size - 1) {
                    index = structs.size - 1;
                }
                struct = structs[index];
                if (isdefined(struct.var_fcb6c737b5ecef23)) {
                    println("<unknown string>");
                    if (index < var_88d6da250cc3e7d8) {
                        index--;
                    } else {
                        index++;
                    }
                    continue;
                }
                var_88d6da250cc3e7d8 = index;
                animstruct.origin = struct.origin;
                animstruct.angles = struct.angles;
                animstruct set_ending_pack(var_a6b3fae0395f75c3, undefined);
                waitframe();
                str = index + 1 + "<unknown string>" + structs.size + "<unknown string>" + animstruct.origin;
                thread function_2fc595ab59dafc25(str);
                animstruct function_84068c30364b89cb();
                if (level.var_af75c6e5758a8787["<unknown string>"]) {
                    index--;
                } else {
                    index++;
                }
                level.var_af75c6e5758a8787["<unknown string>"] = 0;
                level.var_af75c6e5758a8787["<unknown string>"] = 0;
            }
        } else {
            for (i = 0; i < players.size; i++) {
                if (!isdefined(players[i])) {
                    continue;
                }
                player = players[i];
                player setcinematicmotionoverride("<unknown string>");
                player utility::hidehudenable();
                player create_player_rig(player.animname, "<unknown string>", animstruct);
                player_rigs[player_rigs.size] = player.player_rig;
                namespace_d9c77dc2a6fe29c6::enableoobimmunity(player);
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
            var_88d6da250cc3e7d8 = 0;
            while (1) {
                if (index < 0) {
                    index = 0;
                } else if (index > structs.size - 1) {
                    index = structs.size - 1;
                }
                struct = structs[index];
                if (isdefined(struct.var_fcb6c737b5ecef23)) {
                    println("<unknown string>");
                    if (index < var_88d6da250cc3e7d8) {
                        index--;
                    } else {
                        index++;
                    }
                    continue;
                }
                var_88d6da250cc3e7d8 = index;
                setomnvarforallclients("<unknown string>", 0);
                animstruct.origin = struct.origin;
                animstruct.angles = struct.angles;
                animstruct chopperexfil_set_brcircle();
                animstruct.cam.origin = animstruct.origin;
                animstruct.cam stopanimscripted();
                animstruct anim_first_frame_solo(animstruct.cam, animstruct.packs[0].anime);
                foreach (player in players) {
                    player thread player_set_weapon();
                    player cameraunlink();
                    player function_8ff8fd7841f6eba2();
                    player playerlinktodelta(player.player_rig, "<unknown string>", 1, 0, 0, 0, 0, 1);
                    player.player_rig stopanimscripted();
                    player.player_rig unlink();
                    player.player_rig.origin = animstruct.origin;
                    player.linkedtoent = undefined;
                }
                waitframe();
                if (isdefined(level.players[0].player_rig)) {
                    level.players[0] cameralinkto(animstruct.cam, "<unknown string>", 1, 1);
                }
                waitframe();
                str = index + 1 + "<unknown string>" + structs.size + "<unknown string>" + animstruct.origin;
                thread function_2fc595ab59dafc25(str);
                animstruct function_1c6d73d1832aefd6(players, player_rigs);
                if (level.var_af75c6e5758a8787["<unknown string>"]) {
                    index--;
                } else {
                    index++;
                }
                level.var_af75c6e5758a8787["<unknown string>"] = 0;
                level.var_af75c6e5758a8787["<unknown string>"] = 0;
            }
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4172
// Size: 0x52
function function_ab9fd11ef489ccf3() {
    /#
        num = self getentitynumber();
        while (1) {
            line(self.origin, self.player_rig.origin);
            print3d(self.origin, num);
            waitframe();
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41cb
// Size: 0xb6
function function_75ef2dd1a0eee7bc(animstruct) {
    /#
        self endon("<unknown string>");
        while (1) {
            if (!level.var_af75c6e5758a8787["<unknown string>"] && self buttonpressed("<unknown string>")) {
                level.var_af75c6e5758a8787["<unknown string>"] = 1;
                level notify("<unknown string>");
                animstruct notify("<unknown string>");
                wait(0.4);
            } else if (!level.var_af75c6e5758a8787["<unknown string>"] && self buttonpressed("<unknown string>")) {
                level.var_af75c6e5758a8787["<unknown string>"] = 1;
                level notify("<unknown string>");
                animstruct notify("<unknown string>");
                wait(0.4);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4288
// Size: 0x132
function function_2fc595ab59dafc25(text, time) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        if (!isdefined(level.var_2e10660bd87fffd9)) {
            level.var_2e10660bd87fffd9 = newhudelem();
            level.var_2e10660bd87fffd9.archived = 0;
            level.var_2e10660bd87fffd9.vertalign = "<unknown string>";
            level.var_2e10660bd87fffd9.horzalign = "<unknown string>";
            level.var_2e10660bd87fffd9.aligny = "<unknown string>";
            level.var_2e10660bd87fffd9.alignx = "<unknown string>";
            level.var_2e10660bd87fffd9.y = 80;
            level.var_2e10660bd87fffd9.fontscale = 1.2;
        }
        level.var_2e10660bd87fffd9.alpha = 1;
        level.var_2e10660bd87fffd9 setdevtext(text);
        println(text);
        if (isdefined(time)) {
            wait(time);
            level.var_2e10660bd87fffd9.alpha = 0;
        }
    #/
}

// Namespace namespace_bc2bdb06de29485d/namespace_db13b5d5ab9bfe9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43c1
// Size: 0x23e
function function_53e397de3c413997() {
    /#
        structs = function_2979939f678d3ad1(function_9afbee75cfe14b8d());
        minx = min(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        maxx = max(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        miny = min(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxy = max(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxz = namespace_5078ee98abb32db9::getc130height();
        var_b1bed01548c8b4f7 = minx + (maxx - minx) * 0.5;
        var_b1becf1548c8b2c4 = miny + (maxy - miny) * 0.5;
        origin = (var_b1bed01548c8b4f7, var_b1becf1548c8b2c4, maxz);
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
    #/
}

