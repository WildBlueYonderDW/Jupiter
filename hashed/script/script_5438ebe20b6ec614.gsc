// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_ced1636a962433d2;

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x187
function init(var_17e4f9de4e9c7906) {
    if (!isdefined(var_17e4f9de4e9c7906) || var_17e4f9de4e9c7906 == "") {
        return;
    }
    scriptbundle = getscriptbundle(function_2ef675c13ca1c4af(%"hash_2bbcecc836419d0b", var_17e4f9de4e9c7906));
    if (!isdefined(scriptbundle)) {
        return;
    }
    var_17e4f9de4e9c7906 = scriptbundle.var_ef1866c5d314a352;
    if (!isdefined(var_17e4f9de4e9c7906) || var_17e4f9de4e9c7906.size == 0) {
        return;
    }
    totalweight = 0;
    var_7a9dd2ffe1aede2a = strtok(getdvar(@"hash_8422039c51781bf1", ""), " ");
    for (k = 0; k < var_17e4f9de4e9c7906.size; k++) {
        if (var_7a9dd2ffe1aede2a.size > 0 && isdefined(var_7a9dd2ffe1aede2a[k])) {
            var_17e4f9de4e9c7906[k].weight = float(var_7a9dd2ffe1aede2a[k]);
        }
        if (!isdefined(var_17e4f9de4e9c7906[k].weight)) {
            var_17e4f9de4e9c7906[k].weight = 0;
        }
        totalweight = totalweight + var_17e4f9de4e9c7906[k].weight;
    }
    var_55bedc0453a6c09b = randomfloat(totalweight);
    var_c2a009e075d70716 = 0;
    for (i = 0; i < var_17e4f9de4e9c7906.size; i++) {
        var_b953c4b1e9ed888c = var_c2a009e075d70716 + var_17e4f9de4e9c7906[i].weight;
        if (var_b953c4b1e9ed888c > var_55bedc0453a6c09b) {
            var_41368388d296a0d0 = var_17e4f9de4e9c7906[i];
            setup(var_41368388d296a0d0.var_5f23c51aa82af90a);
            return;
        }
        var_c2a009e075d70716 = var_b953c4b1e9ed888c;
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a
// Size: 0x1b0
function setup(var_5f23c51aa82af90a) {
    if (!isdefined(var_5f23c51aa82af90a) || var_5f23c51aa82af90a == "") {
        return;
    }
    scriptbundle = getscriptbundle(function_2ef675c13ca1c4af(%"hash_7d9482f6248686c3", var_5f23c51aa82af90a));
    if (!isdefined(scriptbundle)) {
        return;
    }
    if (!isdefined(scriptbundle.var_be7c088a50041a3b) || scriptbundle.var_be7c088a50041a3b.size == 0) {
        return;
    }
    level.var_e198c297ceb14c19 = getdvarint(@"hash_37763c7311e5b8da", 256);
    level.var_fbca612d854a3975 = getdvarfloat(@"hash_d1676be1e671f038", 0.306);
    level.var_ae361b9fc9ed6213 = getdvarfloat(@"hash_8eebbbe30d21a94a", 1);
    level.var_8ee11212ceb130ef = getdvarfloat(@"hash_64e3e719e88b3ffa", 0.922347);
    level.var_f8397ff86c4282e8 = getdvarfloat(@"hash_2b9d51c935985eff", 0.870588);
    level.var_be7c088a50041a3b = scriptbundle.var_be7c088a50041a3b;
    for (i = 0; i < level.var_be7c088a50041a3b.size; i++) {
        level.var_be7c088a50041a3b[i].state = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6b3d349b362ec62", level.var_be7c088a50041a3b[i].state));
    }
    var_7d5a0b947d8df8c3 = function_8725cc1e47d95528(-1);
    if (isdefined(var_7d5a0b947d8df8c3) && isdefined(var_7d5a0b947d8df8c3.state)) {
        level thread function_5d6d8ec8b7599cfd(var_7d5a0b947d8df8c3);
    }
    level thread function_e79d5aa841abecc9();
    level thread function_76a30c6e8bc2a46d();
    /#
        level thread debug_init();
    #/
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x421
// Size: 0xfe
function function_47c350f5d0fb2ef0(var_1e6ab50ecbd9cfaa) {
    if (!isdefined(var_1e6ab50ecbd9cfaa)) {
        return;
    }
    if (isdefined(level.var_1bb44c81edf3f3a9)) {
        if (level.var_1bb44c81edf3f3a9.var_cb8ac82927b49276 == "circles" && var_1e6ab50ecbd9cfaa.var_cb8ac82927b49276 == "circles") {
            var_d3b9d5681defbb4e = isdefined(var_1e6ab50ecbd9cfaa.circleindex) ? 0 : var_1e6ab50ecbd9cfaa.circleindex;
            var_d3b9d4681defb91b = isdefined(level.var_1bb44c81edf3f3a9.circleindex) ? 0 : level.var_1bb44c81edf3f3a9.circleindex;
            if (var_d3b9d5681defbb4e == var_d3b9d4681defb91b) {
                return;
            }
        }
    }
    if (!isdefined(var_1e6ab50ecbd9cfaa.state)) {
        return;
    }
    level.var_1bb44c81edf3f3a9 = var_1e6ab50ecbd9cfaa;
    level thread function_95fa48154c5f317c();
    level function_519c36cfe2838f8a();
    level function_24427ed3f5c1ccc3();
    level thread function_d579bab00a3ef871();
    level thread function_2ef05a1df426a720();
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x526
// Size: 0xfb
function function_37ff5d03f010f57e(var_1e6ab50ecbd9cfaa) {
    if (!isdefined(var_1e6ab50ecbd9cfaa)) {
        return;
    }
    if (!isdefined(self.var_1bb44c81edf3f3a9)) {
        self.var_1bb44c81edf3f3a9 = level.var_1bb44c81edf3f3a9;
    }
    if (isdefined(self.var_1bb44c81edf3f3a9)) {
        if (self.var_1bb44c81edf3f3a9.var_cb8ac82927b49276 == "circles" && var_1e6ab50ecbd9cfaa.var_cb8ac82927b49276 == "circles") {
            var_d3b9d5681defbb4e = isdefined(var_1e6ab50ecbd9cfaa.circleindex) ? 0 : var_1e6ab50ecbd9cfaa.circleindex;
            var_d3b9d4681defb91b = isdefined(self.var_1bb44c81edf3f3a9.circleindex) ? 0 : self.var_1bb44c81edf3f3a9.circleindex;
            if (var_d3b9d5681defbb4e == var_d3b9d4681defb91b) {
                return;
            }
        }
    }
    self.var_1bb44c81edf3f3a9 = var_1e6ab50ecbd9cfaa;
    thread function_95fa48154c5f317c(self);
    function_519c36cfe2838f8a(self);
    function_24427ed3f5c1ccc3(self);
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x628
// Size: 0xd7
function function_95fa48154c5f317c(player) {
    suffix = self.var_1bb44c81edf3f3a9.state.var_5fa416aa85e45ade;
    if (!isdefined(suffix)) {
        suffix = "";
    }
    duration = 0;
    if (isdefined(self.var_1bb44c81edf3f3a9.transitiontime) && self.var_1bb44c81edf3f3a9.transitiontime >= 0) {
        duration = self.var_1bb44c81edf3f3a9.transitiontime;
    }
    /#
        if (istrue(level.var_5872a7af669d9983)) {
            duration = 0;
        }
    #/
    if (istrue(self.var_5872a7af669d9983)) {
        duration = 0;
    }
    if (isdefined(player) && isplayer(player)) {
        self function_eb0326e0c8803f41(duration, suffix);
    } else {
        function_f92878651d302fe9(duration, suffix);
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706
// Size: 0x6b
function function_5d6d8ec8b7599cfd(var_1e6ab50ecbd9cfaa) {
    level endon("prematch_fade_done");
    if (!isdefined(var_1e6ab50ecbd9cfaa.state)) {
        return;
    }
    level.var_1bb44c81edf3f3a9 = var_1e6ab50ecbd9cfaa;
    thread function_d579bab00a3ef871();
    while (1) {
        player = level waittill("connected");
        player thread function_a56c4e72231ce9a2();
        thread function_519c36cfe2838f8a(player);
        thread function_24427ed3f5c1ccc3(player);
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x778
// Size: 0x48
function function_a56c4e72231ce9a2() {
    self waittill("spawned_player");
    duration = 0;
    suffix = level.var_1bb44c81edf3f3a9.state.var_5fa416aa85e45ade;
    self function_eb0326e0c8803f41(duration, suffix);
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c7
// Size: 0x51
function function_e79d5aa841abecc9() {
    level endon("game_ended");
    while (1) {
        level waittill("br_circle_set");
        var_8cdb14d4a73a90a6 = function_8725cc1e47d95528(level.br_circle.circleindex);
        if (isdefined(var_8cdb14d4a73a90a6)) {
            function_47c350f5d0fb2ef0(var_8cdb14d4a73a90a6);
        } else {
            continue;
        }
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f
// Size: 0xb6
function function_76a30c6e8bc2a46d() {
    level endon("game_ended");
    level waittill("prematch_fade_done");
    if (!isdefined(level.starttime)) {
        level.starttime = gettime();
    }
    waittime = 60;
    var_8cdb14d4a73a90a6 = undefined;
    var_35963274858b5330 = 1;
    while (1) {
        if (isdefined(var_8cdb14d4a73a90a6)) {
            function_47c350f5d0fb2ef0(var_8cdb14d4a73a90a6);
            var_8cdb14d4a73a90a6 = undefined;
            waittime = 60;
            continue;
        } else {
            var_8cdb14d4a73a90a6 = function_12f05fef0df24cd7(waittime, var_35963274858b5330);
            var_35963274858b5330 = 0;
        }
        if (isdefined(var_8cdb14d4a73a90a6)) {
            waittime = var_8cdb14d4a73a90a6.starttime * 60 - (gettime() - level.starttime) / 1000;
            waittime = max(waittime, 0);
        }
        wait(waittime);
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc
// Size: 0xaa
function function_8725cc1e47d95528(index) {
    foreach (var_1e6ab50ecbd9cfaa in level.var_be7c088a50041a3b) {
        if (var_1e6ab50ecbd9cfaa.var_cb8ac82927b49276 != "circles") {
            continue;
        }
        if (!isdefined(var_1e6ab50ecbd9cfaa.circleindex)) {
            if (index == 0) {
                var_1e6ab50ecbd9cfaa.circleindex = index;
                return var_1e6ab50ecbd9cfaa;
            }
        } else if (var_1e6ab50ecbd9cfaa.circleindex == index) {
            return var_1e6ab50ecbd9cfaa;
        }
    }
    return undefined;
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98e
// Size: 0xf9
function function_12f05fef0df24cd7(timedelta, var_35963274858b5330) {
    currenttime = gettime() - level.starttime;
    currenttime = currenttime / 1000;
    foreach (var_1e6ab50ecbd9cfaa in level.var_be7c088a50041a3b) {
        if (var_1e6ab50ecbd9cfaa.var_cb8ac82927b49276 != "time") {
            continue;
        }
        if (!isdefined(var_1e6ab50ecbd9cfaa.starttime)) {
            var_1e6ab50ecbd9cfaa.starttime = 0;
        }
        if (istrue(var_35963274858b5330) && var_1e6ab50ecbd9cfaa.starttime == 0) {
            return var_1e6ab50ecbd9cfaa;
        }
        var_9275f91463ad3fcb = var_1e6ab50ecbd9cfaa.starttime * 60;
        if (var_9275f91463ad3fcb > currenttime && var_9275f91463ad3fcb - currenttime <= timedelta) {
            return var_1e6ab50ecbd9cfaa;
        }
    }
    return undefined;
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8f
// Size: 0x92
function function_519c36cfe2838f8a(player) {
    exploders = self.var_1bb44c81edf3f3a9.state.exploders;
    if (!isdefined(exploders) || exploders.size == 0) {
        return;
    }
    foreach (exploder in exploders) {
        exploder thread function_a3875f674f301be6(player);
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28
// Size: 0xde
function function_a3875f674f301be6(player) {
    level endon("game_ended");
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.delay)) {
        delay = self.delay;
        /#
            if (istrue(level.var_5872a7af669d9983)) {
                delay = 0;
            }
        #/
        if (istrue(player.var_5872a7af669d9983)) {
            delay = 0;
        }
        wait(delay);
    }
    if (istrue(self.active)) {
        if (isdefined(player) && isplayer(player)) {
            player waittill("spawned_player");
            activateclientexploder(self.name, player, gettime(), level.var_e198c297ceb14c19);
        } else {
            activateclientexploder(self.name, level.players, gettime(), level.var_e198c297ceb14c19);
        }
    } else {
        stopclientexploder(self.name);
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0d
// Size: 0x92
function function_24427ed3f5c1ccc3(player) {
    var_e4dd95ba8d116cbe = self.var_1bb44c81edf3f3a9.state.var_e4dd95ba8d116cbe;
    if (!isdefined(var_e4dd95ba8d116cbe) || var_e4dd95ba8d116cbe.size == 0) {
        return;
    }
    foreach (var_e32e4b2941460e39 in var_e4dd95ba8d116cbe) {
        var_e32e4b2941460e39 thread function_6fad46877de34a3b(player);
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca6
// Size: 0x121
function function_6fad46877de34a3b(index, player) {
    level endon("game_ended");
    if (!isdefined(self)) {
        return;
    }
    id = isdefined(self.id) ? "" : self.id;
    state = isdefined(self.state) ? "" : self.state;
    fadetime = 10;
    var_c6d7a76cce0ad3ef = level.var_1bb44c81edf3f3a9.var_c55ce35ed96a2d2c;
    if (isdefined(var_c6d7a76cce0ad3ef) && isdefined(var_c6d7a76cce0ad3ef[index])) {
        fadetime = isdefined(var_c6d7a76cce0ad3ef[index].fadetime) ? fadetime : var_c6d7a76cce0ad3ef[index].fadetime;
    }
    /#
        if (istrue(level.var_5872a7af669d9983)) {
            fadetime = 0;
        }
    #/
    if (istrue(player.var_5872a7af669d9983)) {
        fadetime = 0;
    }
    if (isdefined(player) && isplayer(player)) {
        player waittill("spawned_player");
        setaudiotriggerstate(id, state, fadetime, player);
    } else {
        setaudiotriggerstate(id, state, fadetime);
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdce
// Size: 0x1f3
function function_d579bab00a3ef871() {
    level endon("game_ended");
    if (level.var_1bb44c81edf3f3a9.var_cb8ac82927b49276 == "circles" && isdefined(level.var_1bb44c81edf3f3a9.circleindex) && level.var_1bb44c81edf3f3a9.circleindex == -1 && !istrue(level.var_5feb27af9025d27)) {
        level waittill("prematch_fade_done");
    }
    if (!isdefined(level.var_1bb44c81edf3f3a9.state.sunlight)) {
        return;
    }
    sunlight = [];
    if (isdefined(level.var_1bb44c81edf3f3a9.state.sunlight.color) && level.var_1bb44c81edf3f3a9.state.sunlight.color != "") {
        tokens = strtok(level.var_1bb44c81edf3f3a9.state.sunlight.color, " ");
        red = float(tokens[0]);
        green = float(tokens[1]);
        blue = float(tokens[2]);
        if (red != 0) {
            goto LOC_0000017c;
        }
        sunlight[sunlight.size] = undefined;
        if (green != 0) {
            goto LOC_00000190;
        }
        sunlight[sunlight.size] = undefined;
        if (blue != 0) {
            goto LOC_000001a4;
        }
        sunlight[sunlight.size] = undefined;
    }
    sunlight[sunlight.size] = level.var_1bb44c81edf3f3a9.state.sunlight.intensity;
    thread function_e926344af0b8a54e(sunlight, level.var_1bb44c81edf3f3a9.transitiontime);
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc8
// Size: 0x35d
function function_e926344af0b8a54e(final, time) {
    level endon("game_ended");
    if (!isdefined(final)) {
        return;
    }
    /#
        if (istrue(level.var_5872a7af669d9983)) {
            time = 0;
        }
    #/
    var_7a8d2cb8d7089e94 = isdefined(final[0]) && isdefined(final[1]) && isdefined(final[2]);
    var_e951e895fb5d8c46 = isdefined(final[3]) || isdefined(final[0]) && !var_7a8d2cb8d7089e94;
    if (!istrue(var_7a8d2cb8d7089e94) && !istrue(var_e951e895fb5d8c46)) {
        return;
    }
    if (!isdefined(level.var_8c4540ab5278f235)) {
        level.var_8c4540ab5278f235 = [];
    }
    initial = [];
    if (var_7a8d2cb8d7089e94) {
        if (!isdefined(level.var_8c4540ab5278f235[0])) {
            goto LOC_0000010e;
        }
        initial[0] = level.var_8c4540ab5278f235[0];
        initial[1] = isdefined(level.var_8c4540ab5278f235[1]) ? level.var_8ee11212ceb130ef : level.var_8c4540ab5278f235[1];
        if (!isdefined(level.var_8c4540ab5278f235[2])) {
            goto LOC_00000167;
        }
        initial[2] = level.var_8c4540ab5278f235[2];
    }
    if (var_e951e895fb5d8c46) {
        if (var_7a8d2cb8d7089e94) {
            index = 3;
        } else {
            index = 0;
        }
        initial[index] = isdefined(level.var_8c4540ab5278f235[3]) ? level.var_fbca612d854a3975 : level.var_8c4540ab5278f235[3];
    }
    if (isdefined(time) && time > 0) {
        range = [];
        for (i = 0; i < final.size; i++) {
            if (isdefined(final[i])) {
                range[i] = final[i] - initial[i];
            }
        }
        next = initial;
        interval = 0.25;
        count = int(time / interval);
        if (count > 0) {
            delta = [];
            for (i = 0; i < range.size; i++) {
                if (isdefined(range[i])) {
                    delta[i] = range[i] / count;
                }
            }
            while (count) {
                for (i = 0; i < delta.size; i++) {
                    if (isdefined(delta[i])) {
                        next[i] = next[i] + delta[i];
                    }
                }
                if (var_7a8d2cb8d7089e94 && var_e951e895fb5d8c46) {
                    setsuncolorandintensity(next[0], next[1], next[2], next[3]);
                } else if (var_7a8d2cb8d7089e94) {
                    setsuncolorandintensity(next[0], next[1], next[2]);
                } else {
                    setsuncolorandintensity(next[0]);
                }
                wait(interval);
                count--;
            }
        }
    }
    if (var_7a8d2cb8d7089e94 && var_e951e895fb5d8c46) {
        setsuncolorandintensity(final[0], final[1], final[2], final[3]);
        level.var_8c4540ab5278f235[0] = final[0];
        level.var_8c4540ab5278f235[1] = final[1];
        level.var_8c4540ab5278f235[2] = final[2];
        level.var_8c4540ab5278f235[3] = final[3];
    } else if (var_7a8d2cb8d7089e94) {
        setsuncolorandintensity(final[0], final[1], final[2]);
        level.var_8c4540ab5278f235[0] = final[0];
        level.var_8c4540ab5278f235[1] = final[1];
        level.var_8c4540ab5278f235[2] = final[2];
    } else {
        setsuncolorandintensity(final[0]);
        level.var_8c4540ab5278f235[3] = final[0];
    }
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132c
// Size: 0x1f8
function function_2ef05a1df426a720(player, var_44c0bd46a9c3517e) {
    level endon("game_ended");
    if (!isdefined(self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d)) {
        return;
    }
    if (isdefined(self.var_b50a28b117aa65cd)) {
        function_90fb4916aa7fd9f3(self.var_b50a28b117aa65cd);
    }
    if (isdefined(self.var_1bb44c81edf3f3a9.var_e3cf72e793015995)) {
        delay = self.var_1bb44c81edf3f3a9.var_e3cf72e793015995;
        /#
            if (istrue(level.var_5872a7af669d9983)) {
                delay = 0;
            }
        #/
        if (istrue(self.var_5872a7af669d9983)) {
            delay = 0;
        }
        wait(delay);
    }
    if (isdefined(player) && isplayer(player)) {
        if (istrue(var_44c0bd46a9c3517e)) {
            player waittill("spawned_player");
        }
        player function_451319f93d30ebe5(self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d);
    } else {
        /#
            if (istrue(level.var_5872a7af669d9983)) {
                function_ee7c0ccde65de2ec(self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d);
                self.var_b50a28b117aa65cd = self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d;
                return;
            }
        #/
        if (istrue(self.var_5872a7af669d9983)) {
            function_ee7c0ccde65de2ec(self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d);
            self.var_b50a28b117aa65cd = self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d;
            return;
        }
        function_7c2e0421aa80f818(self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d, 15000, "MIDDLE");
    }
    self.var_b50a28b117aa65cd = self.var_1bb44c81edf3f3a9.state.var_dc80fd8052e1c26d;
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152b
// Size: 0x17
function function_8eb04af4a1b02597(var_4fba68bebfee306e) {
    return level.var_be7c088a50041a3b[var_4fba68bebfee306e];
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x154a
// Size: 0xd
function debug_init() {
    /#
        devgui_init();
    #/
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x155e
// Size: 0xcb
function devgui_init() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_40c5de300f64bca5);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        for (i = 0; i < level.var_be7c088a50041a3b.size; i++) {
            namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>" + i);
            namespace_b032b0cc17b10064::function_fe953f000498048f();
            namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>" + i + "<unknown string>");
            namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + i, &function_9fb263cc4b9c7d63);
            namespace_b032b0cc17b10064::function_fe953f000498048f();
            namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>" + i + "<unknown string>");
            namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + i, &function_557893706e808ca5);
            namespace_b032b0cc17b10064::function_fe953f000498048f();
        }
    #/
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1630
// Size: 0x52
function function_9fb263cc4b9c7d63(params) {
    /#
        index = int(params[0]);
        level.var_5feb27af9025d27 = 1;
        level.player function_37ff5d03f010f57e(level.var_be7c088a50041a3b[index]);
        level.var_5feb27af9025d27 = 0;
    #/
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1689
// Size: 0x67
function function_557893706e808ca5(params) {
    /#
        level.var_5872a7af669d9983 = 1;
        level.var_5feb27af9025d27 = 1;
        index = int(params[0]);
        level.player function_37ff5d03f010f57e(level.var_be7c088a50041a3b[index]);
        level.var_5872a7af669d9983 = 0;
        level.var_5feb27af9025d27 = 0;
    #/
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f7
// Size: 0xca
function function_40c5de300f64bca5() {
    /#
        if (!isdefined(level.var_8c4540ab5278f235)) {
            return;
        }
        final = level.var_8c4540ab5278f235;
        var_eab84e8d7c1ceee3 = isdefined(final[0]) && isdefined(final[1]) && isdefined(final[2]);
        var_1ddfaa063cde100d = isdefined(final[3]);
        if (var_eab84e8d7c1ceee3 && var_1ddfaa063cde100d) {
            setsuncolorandintensity(level.var_ae361b9fc9ed6213, level.var_8ee11212ceb130ef, level.var_f8397ff86c4282e8, level.var_fbca612d854a3975);
        } else if (var_eab84e8d7c1ceee3) {
            setsuncolorandintensity(level.var_ae361b9fc9ed6213, level.var_8ee11212ceb130ef, level.var_f8397ff86c4282e8);
        } else if (var_1ddfaa063cde100d) {
            setsuncolorandintensity(level.var_fbca612d854a3975);
        }
    #/
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c8
// Size: 0x29
function function_aaadc13812c2ef4b() {
    /#
        function_f92878651d302fe9(0, "<unknown string>");
        if (isdefined(level.var_1bb44c81edf3f3a9)) {
            level.var_1bb44c81edf3f3a9 = undefined;
        }
    #/
}

// Namespace namespace_ced1636a962433d2/namespace_269e196d86dd1752
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17f8
// Size: 0x9f
function function_abcd11e9abe86202() {
    /#
        function_40c5de300f64bca5();
        function_aaadc13812c2ef4b();
        function_cac2f4c1694c723f();
        if (isdefined(level.var_98c604069085fc53)) {
            foreach (var_8927e0f5f68e6073, active in level.var_98c604069085fc53) {
                if (istrue(level.var_98c604069085fc53[var_8927e0f5f68e6073])) {
                    stopclientexploder(var_8927e0f5f68e6073);
                    level.var_98c604069085fc53[var_8927e0f5f68e6073] = undefined;
                }
            }
            level.var_98c604069085fc53 = undefined;
        }
    #/
}

