// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace devgui;

// Namespace devgui/namespace_b032b0cc17b10064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80
// Size: 0x6c
function init_devgui() {
    /#
        if (!isdefined(level.var_7eea2b6a60c0f768)) {
            level.var_7eea2b6a60c0f768 = [];
        }
        if (!isdefined(level.var_a7a2b0c1756d86a3)) {
            level.var_a7a2b0c1756d86a3 = [];
        }
        if (!isdefined(level.var_e58e712fadbe091d)) {
            level.var_e58e712fadbe091d = [];
        }
        level notify("<unknown string>");
        level thread function_73fc458f28e40f0();
        setdevdvarifuninitialized(@"hash_81d89e4abec64203", 0);
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3
// Size: 0xb8
function function_de5696a0706893d4() {
    /#
        if (isdefined(level.var_3abeb9746c41d178)) {
            return;
        }
        if (level.var_de5696a0706893d4.size == 0) {
            return;
        }
        level.var_3abeb9746c41d178 = 1;
        if (!utility::issp()) {
            level namespace_3c37cb17ade254d::flag_wait("<unknown string>");
        }
        while (!isdefined(level.player)) {
            waitframe();
        }
        for (i = 0; i < level.var_de5696a0706893d4.size; i++) {
            cmd = level.var_de5696a0706893d4[i];
            adddebugcommand(cmd + "<unknown string>");
            if (i % 5 == 0) {
                waitframe();
            }
        }
        level.var_3abeb9746c41d178 = undefined;
        level.var_de5696a0706893d4 = undefined;
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2
// Size: 0x44
function add_debug_command(cmd) {
    /#
        if (!isdefined(level.var_de5696a0706893d4)) {
            level.var_de5696a0706893d4 = [];
        }
        level.var_de5696a0706893d4[level.var_de5696a0706893d4.size] = cmd;
        thread function_de5696a0706893d4();
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd
// Size: 0xc1
function function_a2fe753948998c89(path, cmd, index) {
    /#
        if (!isdefined(index)) {
            /#
                assert(isdefined(level.var_d8852dd07270dbac));
            #/
            index = level.var_d8852dd07270dbac.index;
            level.var_d8852dd07270dbac.index++;
        }
        if (isdefined(level.var_d8852dd07270dbac) && isdefined(level.var_d8852dd07270dbac.var_e687163b40d0fe22)) {
            path = level.var_d8852dd07270dbac.var_e687163b40d0fe22 + path;
        }
        thread add_debug_command("<unknown string>" + path + "<unknown string>" + index + "<unknown string>" + cmd + "<unknown string>");
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2c5
// Size: 0xf1
function function_a9a864379a098ad6(path, name, func, toggle, index) {
    /#
        if (!isdefined(index)) {
            /#
                assert(isdefined(level.var_d8852dd07270dbac));
            #/
            index = level.var_d8852dd07270dbac.index;
            level.var_d8852dd07270dbac.index++;
        }
        if (isdefined(level.var_d8852dd07270dbac) && isdefined(level.var_d8852dd07270dbac.var_e687163b40d0fe22)) {
            path = level.var_d8852dd07270dbac.var_e687163b40d0fe22 + path;
        }
        thread add_debug_command("<unknown string>" + path + "<unknown string>" + index + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "<unknown string>");
        level.var_7eea2b6a60c0f768[name] = function_6f12fd05ab99fa52(func, toggle);
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd
// Size: 0xc1
function function_df648211d66cd3dd(path, dvar, index) {
    /#
        if (!isdefined(index)) {
            /#
                assert(isdefined(level.var_d8852dd07270dbac));
            #/
            index = level.var_d8852dd07270dbac.index;
            level.var_d8852dd07270dbac.index++;
        }
        if (isdefined(level.var_d8852dd07270dbac) && isdefined(level.var_d8852dd07270dbac.var_e687163b40d0fe22)) {
            path = level.var_d8852dd07270dbac.var_e687163b40d0fe22 + path;
        }
        thread add_debug_command("<unknown string>" + path + "<unknown string>" + index + "<unknown string>" + dvar + "<unknown string>");
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x485
// Size: 0xce
function function_b2159fbbd7ac094e(path, var_eab44bfaa256f64b, index) {
    /#
        if (!isdefined(index)) {
            /#
                assert(isdefined(level.var_d8852dd07270dbac));
            #/
            index = level.var_d8852dd07270dbac.index;
            level.var_d8852dd07270dbac.index++;
        }
        if (isdefined(level.var_d8852dd07270dbac) && isdefined(level.var_d8852dd07270dbac.var_e687163b40d0fe22)) {
            path = level.var_d8852dd07270dbac.var_e687163b40d0fe22 + path;
        }
        setdevdvarifuninitialized(var_eab44bfaa256f64b, 0);
        thread add_debug_command("<unknown string>" + path + "<unknown string>" + index + "<unknown string>" + function_3c8848a3a11b2553(var_eab44bfaa256f64b) + "<unknown string>");
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x55a
// Size: 0x12d
function function_b23a59dfb4ca49a1(path, var_9af94c1035c9530e, func, toggle, index) {
    /#
        tokens = strtok(var_9af94c1035c9530e, "<unknown string>");
        name = tokens[0];
        params = namespace_3c37cb17ade254d::array_remove_index(tokens, 0, 0);
        if (!isdefined(index)) {
            /#
                assert(isdefined(level.var_d8852dd07270dbac));
            #/
            index = level.var_d8852dd07270dbac.index;
            level.var_d8852dd07270dbac.index++;
        }
        if (isdefined(level.var_d8852dd07270dbac) && isdefined(level.var_d8852dd07270dbac.var_e687163b40d0fe22)) {
            path = level.var_d8852dd07270dbac.var_e687163b40d0fe22 + path;
        }
        thread add_debug_command("<unknown string>" + path + "<unknown string>" + index + "<unknown string>" + "<unknown string>" + "<unknown string>" + var_9af94c1035c9530e + "<unknown string>");
        level.var_a7a2b0c1756d86a3[name] = function_6f12fd05ab99fa52(func, toggle);
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68e
// Size: 0x8f
function function_6e7290c8ee4f558b(var_e687163b40d0fe22) {
    /#
        /#
            assertex(!isdefined(level.var_d8852dd07270dbac), "<unknown string>");
        #/
        if (isdefined(level.var_d8852dd07270dbac)) {
            /#
                assertmsg("<unknown string>" + level.var_d8852dd07270dbac.var_e687163b40d0fe22);
            #/
        }
        level.var_d8852dd07270dbac = spawnstruct();
        level.var_d8852dd07270dbac.index = 0;
        level.var_d8852dd07270dbac.var_e687163b40d0fe22 = var_e687163b40d0fe22;
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x724
// Size: 0x23
function function_fe953f000498048f() {
    /#
        /#
            assert(isdefined(level.var_d8852dd07270dbac));
        #/
        level.var_d8852dd07270dbac = undefined;
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74e
// Size: 0xb1
function function_9b4c82dba041b23d() {
    /#
        player = level.players[0];
        player_forward = anglestoforward(player getplayerangles());
        result = namespace_2a184fc4902783dc::ray_trace(player geteye(), player geteye() + player_forward * 10000);
        if (isdefined(result["<unknown string>"]) && isdefined(result["<unknown string>"]) && result["<unknown string>"] < 1) {
            new_pos = drop_to_ground(result["<unknown string>"] + -1 * player_forward * 32, 24, -300) + (0, 0, 16);
            return new_pos;
        }
        return undefined;
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x806
// Size: 0x6b
function function_5ee398aaf3f11e0d(params) {
    /#
        model = params[0];
        spawn_location = function_9b4c82dba041b23d();
        var_3f04053a805fbbc5 = getdvarfloat(@"hash_2ae4e76b04454913", 0);
        var_c64066808cdd43e5 = spawn("<unknown string>", spawn_location + (0, 0, var_3f04053a805fbbc5));
        var_c64066808cdd43e5 setmodel(model);
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x878
// Size: 0x42
function function_2fb888667001fc39(dvar, var_ed4175c5eac291bd) {
    /#
        iprintlnbold("<unknown string>" + dvar + "<unknown string>" + !getdvarint(var_ed4175c5eac291bd, 0));
        setdvar(var_ed4175c5eac291bd, !getdvarint(var_ed4175c5eac291bd, 0));
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c1
// Size: 0x30
function function_7ac3c4c1bce16dd2(name) {
    /#
        return isdefined(self) && isdefined(self.var_e58e712fadbe091d) && isdefined(self.var_e58e712fadbe091d[name]);
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8f8
// Size: 0xad
function function_247e482e7f9314ee(name, func, params) {
    /#
        if (!isdefined(self.var_e58e712fadbe091d)) {
            self.var_e58e712fadbe091d = [];
        }
        if (function_7ac3c4c1bce16dd2(name)) {
            self.var_e58e712fadbe091d[name] notify("<unknown string>");
            self.var_e58e712fadbe091d[name] = undefined;
            return;
        }
        self.var_e58e712fadbe091d[name] = spawnstruct();
        self.var_e58e712fadbe091d[name] endon("<unknown string>");
        self.var_e58e712fadbe091d[name] endon("<unknown string>");
        if (isdefined(params)) {
            [[ func ]](params);
        } else {
            [[ func ]]();
        }
        self.var_e58e712fadbe091d[name] = undefined;
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9ac
// Size: 0x14d
function private function_73fc458f28e40f0() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            waitframe();
            name = getdvar(@"hash_f8ef099ef036c45e");
            if (name == "<unknown string>") {
                continue;
            }
            setdvar(@"hash_f8ef099ef036c45e", "<unknown string>");
            if (isdefined(level.var_7eea2b6a60c0f768[name])) {
                if (level.var_7eea2b6a60c0f768[name].toggle) {
                    level thread function_247e482e7f9314ee(name, level.var_7eea2b6a60c0f768[name].func);
                } else {
                    [[ level.var_7eea2b6a60c0f768[name].func ]]();
                }
                continue;
            }
            tokens = strtok(name, "<unknown string>");
            name = tokens[0];
            params = namespace_3c37cb17ade254d::array_remove_index(tokens, 0, 0);
            if (isdefined(level.var_a7a2b0c1756d86a3[name])) {
                if (level.var_a7a2b0c1756d86a3[name].toggle) {
                    level thread function_247e482e7f9314ee(name, level.var_a7a2b0c1756d86a3[name].func, params);
                } else {
                    [[ level.var_a7a2b0c1756d86a3[name].func ]](params);
                }
            }
        }
    #/
}

// Namespace devgui/namespace_b032b0cc17b10064
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xb00
// Size: 0x44
function private function_6f12fd05ab99fa52(func, toggle) {
    /#
        cmd = spawnstruct();
        cmd.func = func;
        cmd.toggle = istrue(toggle);
        return cmd;
    #/
}

