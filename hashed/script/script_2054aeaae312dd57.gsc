// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_59ff79d681bb860c;
#using script_3d2770dc09c1243;
#using scripts\engine\dev.gsc;
#using script_2054aeaae312dd57;
#using script_2986aa4b0ff2bddf;

#namespace namespace_260e96ab038c8919;

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98
// Size: 0x12d
function function_66c502dfb1c607b2() {
    /#
        if (getdvarint(@"hash_16a69b03592ae6ea", 0) == 0) {
            return;
        }
        setdvar(@"hash_a9944abc2f276e96", 1);
        setdvar(@"hash_824c718cad3c0f17", 0);
        setdvar(@"hash_a26ae46918350c7", 0);
        setdvar(@"hash_b0eefb927ba15201", 0);
        setdvar(@"hash_eb781589d9dabf4f", 0);
        setdvar(@"hash_a941d4176a868108", 0);
        setdvar(@"hash_d80fe743cdb59418", 2);
        setdvar(@"hash_e49da8458f06fe4f", 1);
        setdvar(@"hash_f245a011cef948e0", 1);
        setdvar(@"hash_9cb701e1b4aa2385", 5);
        setdvar(@"hash_2f602ff4fd08630f", 2);
        level thread namespace_f013313a9982546e::function_4da869df964b68db(@"hash_f97641d4915507b5", &namespace_9fa112241a70b32b::function_caa3566cb86d5538);
        level thread namespace_f013313a9982546e::function_4da869df964b68db(@"hash_b32ed87f6e94907d", &namespace_9fa112241a70b32b::function_4166f565abe2876a);
        level thread namespace_f013313a9982546e::function_4da869df964b68db(@"hash_5ad71dff2cbc6584", &namespace_9fa112241a70b32b::function_13c592c4aa8f479f);
        level thread namespace_f013313a9982546e::function_4da869df964b68db(@"hash_7d823f893b3e9d9f", &namespace_9fa112241a70b32b::function_78bb9ce9a224428f);
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0x2a
function function_caa3566cb86d5538(command, arglist) {
    /#
        function_c5fb911b37a009a9(arglist, 2, 3, 1, "<unknown string>");
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd
// Size: 0x2a
function function_4166f565abe2876a(command, arglist) {
    /#
        function_c5fb911b37a009a9(arglist, 2, 3, 1, "<unknown string>");
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x2a
function function_13c592c4aa8f479f(command, arglist) {
    /#
        function_c5fb911b37a009a9(arglist, 2, 3, 1, "<unknown string>");
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x25f
// Size: 0x10b
function private function_c5fb911b37a009a9(arglist, var_591e1600d834e1df, var_de528f4c380636d4, var_d9b34d95d095735, var_7d55b15ae98b5e95) {
    /#
        var_99365d3c8898a908 = "<unknown string>";
        foreach (arg in arglist) {
            var_99365d3c8898a908 = var_99365d3c8898a908 + arg + "<unknown string>";
        }
        startpos = function_c296da4701b1ce9b(var_99365d3c8898a908, var_591e1600d834e1df);
        targetpos = function_c296da4701b1ce9b(var_99365d3c8898a908, var_de528f4c380636d4);
        var_3e3677f1ea837499 = function_c296da4701b1ce9b(var_99365d3c8898a908, var_d9b34d95d095735);
        if (!isvector(startpos) || !isvector(targetpos) || !isvector(var_3e3677f1ea837499)) {
            iprintlnbold(var_7d55b15ae98b5e95);
            return;
        }
        function_96aa55e08b9d714f(startpos, targetpos);
        thread function_3f27417cba3bd71c(startpos, targetpos, var_3e3677f1ea837499);
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x371
// Size: 0x1db
function function_96aa55e08b9d714f(startpos, targetpos) {
    /#
        level.var_367c15041e69a2a9.var_ff4e5b2de820cb1 = spawnstruct();
        level.var_367c15041e69a2a9.var_ff4e5b2de820cb1.startpos = startpos;
        level.var_367c15041e69a2a9.var_ff4e5b2de820cb1.targetpos = targetpos;
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(level.var_367c15041e69a2a9.var_fbb0c17bb4e37ee8)) {
                if (level.var_367c15041e69a2a9.var_fbb0c17bb4e37ee8 == player.clientid) {
                    player kill();
                    break;
                }
            } else if (isbot(player)) {
                level.var_367c15041e69a2a9.var_fbb0c17bb4e37ee8 = player.clientid;
                player kill();
                break;
            }
        }
        if (!isdefined(level.var_367c15041e69a2a9.var_fbb0c17bb4e37ee8)) {
            botinfo = spawnstruct();
            botinfo.name = "<unknown string>";
            var_43ef75c950adab71 = level function_7d92b857142dbdc6([0:botinfo], "<unknown string>", undefined, undefined, "<unknown string>");
            if (isarray(var_43ef75c950adab71) && isdefined(var_43ef75c950adab71[0])) {
                level.var_367c15041e69a2a9.var_fbb0c17bb4e37ee8 = var_43ef75c950adab71[0].clientid;
            } else {
                /#
                    assert("<unknown string>");
                #/
            }
        }
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x553
// Size: 0x115
function function_caedac3a0de734d() {
    /#
        startpos = level.var_367c15041e69a2a9.var_ff4e5b2de820cb1.startpos;
        targetpos = level.var_367c15041e69a2a9.var_ff4e5b2de820cb1.targetpos;
        level.var_367c15041e69a2a9.var_ff4e5b2de820cb1 = undefined;
        var_ade7a7f9806809fb = level.players[0];
        var_ade7a7f9806809fb dontinterpolate();
        if (!var_ade7a7f9806809fb isnoclip()) {
            var_ade7a7f9806809fb noclip();
        }
        var_ade7a7f9806809fb setorigin(startpos + (0, 0, 36));
        var_ade7a7f9806809fb setplayerangles(vectortoangles(startpos - var_ade7a7f9806809fb.origin));
        wait(0.5);
        var_d22fdca158e266e = 50;
        var_7d2294c58a5c346 = 100;
        var_fc77e2b383d17ec9 = function_721588ae374756b5(startpos, var_d22fdca158e266e, var_7d2294c58a5c346);
        if (isdefined(var_fc77e2b383d17ec9)) {
            /#
                assert("<unknown string>");
            #/
            return;
        }
        namespace_4dbcecb8aa6160e3::function_ffd4129f1032e796(targetpos);
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66f
// Size: 0x54
function function_e1745dae8cdd8388() {
    /#
        return isdefined(level.var_367c15041e69a2a9.var_ff4e5b2de820cb1) && isdefined(level.var_367c15041e69a2a9.var_fbb0c17bb4e37ee8) && self.clientid == level.var_367c15041e69a2a9.var_fbb0c17bb4e37ee8;
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ca
// Size: 0xca
function function_78bb9ce9a224428f(command, args) {
    /#
        var_99365d3c8898a908 = "<unknown string>";
        foreach (arg in args) {
            var_99365d3c8898a908 = var_99365d3c8898a908 + arg + "<unknown string>";
        }
        pos1 = function_c296da4701b1ce9b(var_99365d3c8898a908, 1);
        pos2 = function_c296da4701b1ce9b(var_99365d3c8898a908, 2);
        if (!isvector(pos1) || !isvector(pos2)) {
            iprintlnbold("<unknown string>");
            return;
        }
        thread function_3f27417cba3bd71c(pos1, pos2);
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x79b
// Size: 0x58
function private function_7b2ccc3cb0f1d842(str) {
    /#
        output = undefined;
        values = strtok(str, "<unknown string>");
        if (values.size == 3) {
            output = (float(values[0]), float(values[1]), float(values[2]));
        }
        return output;
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x7fa
// Size: 0x4d
function private function_1e5dca407ad4bf4a(str, var_a55e8303b4062418, startindex) {
    /#
        if (!isdefined(startindex)) {
            startindex = 0;
        }
        for (i = startindex; i < str.size; i++) {
            if (str[i] == var_a55e8303b4062418) {
                return i;
            }
        }
        return -1;
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x84e
// Size: 0x90
function private function_c296da4701b1ce9b(var_9dbfa659b21102e3, index) {
    /#
        count = 0;
        var_b2f125581538bafc = -1;
        var_53b4c911d83a4925 = -1;
        while (count < index) {
            var_b2f125581538bafc = function_1e5dca407ad4bf4a(var_9dbfa659b21102e3, "<unknown string>", var_53b4c911d83a4925 + 1);
            var_53b4c911d83a4925 = function_1e5dca407ad4bf4a(var_9dbfa659b21102e3, "<unknown string>", var_b2f125581538bafc + 1);
            if (var_b2f125581538bafc == -1 || var_53b4c911d83a4925 == -1) {
                return undefined;
            }
            count++;
        }
        return function_7b2ccc3cb0f1d842(getsubstr(var_9dbfa659b21102e3, var_b2f125581538bafc + 1, var_53b4c911d83a4925));
    #/
}

// Namespace namespace_260e96ab038c8919/namespace_9fa112241a70b32b
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x8e5
// Size: 0x1dd
function private function_3f27417cba3bd71c(startpos, endpos, var_3e3677f1ea837499) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_38427195fcd6fbb2 = level.players[0] findpath(startpos, endpos);
        if (!isdefined(var_38427195fcd6fbb2) || var_38427195fcd6fbb2.size == 0) {
            printtoscreen2d(700, 150, "<unknown string>", (1, 0, 0), 3, 100);
        } else if (distance2dsquared(var_38427195fcd6fbb2[var_38427195fcd6fbb2.size - 1], endpos) > 2) {
            printtoscreen2d(700, 150, "<unknown string>", (1, 0, 0), 3, 100);
        }
        while (1) {
            sphere(startpos, 8, (1, 0, 1), 0, level.var_e117330e38c95d0b);
            sphere(endpos, 8, (0, 0, 1), 0, level.var_e117330e38c95d0b);
            if (isvector(var_3e3677f1ea837499)) {
                sphere(var_3e3677f1ea837499, 8, (1, 0, 0), 0, level.var_e117330e38c95d0b);
            }
            foreach (point in var_38427195fcd6fbb2) {
                sphere(point, 4, (0, 1, 0), 0, level.var_e117330e38c95d0b);
            }
            for (i = 0; i < var_38427195fcd6fbb2.size - 1; i++) {
                line(var_38427195fcd6fbb2[i], var_38427195fcd6fbb2[i + 1], (1, 0.5, 0), 1, 0, level.var_e117330e38c95d0b);
            }
            wait(level.var_5683153ad305ce08);
        }
    #/
}

