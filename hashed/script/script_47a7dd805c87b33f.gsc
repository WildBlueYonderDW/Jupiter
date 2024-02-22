// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_5dfa1fb6b030bdcb;
#using script_32d93a194074fa6a;

#namespace namespace_ac3046f64a1306ea;

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0x158
function function_e27c8ead6ab015fa(var_a45669cf75867ed7) {
    if (!isdefined(var_a45669cf75867ed7)) {
        return;
    }
    var_ab3d60d5a354d4da = [];
    foreach (wall in var_a45669cf75867ed7) {
        var_9f711536be9153eb = [];
        var_9f711536be9153eb = array_add(var_9f711536be9153eb, function_f74cacfd2004dc6d(wall[0], wall[1], wall[2]));
        direction = anglestoleft(wall[2]);
        var_9a9fa9a5d71889fb = vectornormalize(direction) * (1, 1, 0);
        switch (wall[0]) {
        case #"hash_3ad7f4106022290a":
            var_e2622d8d804c74f6 = var_9a9fa9a5d71889fb * 192;
            break;
        case #"hash_671771ce3aeca79a":
            var_e2622d8d804c74f6 = var_9a9fa9a5d71889fb * 64;
            break;
        default:
            var_e2622d8d804c74f6 = var_9a9fa9a5d71889fb * 192;
            break;
        }
        for (i = 1; i < wall[3]; i++) {
            var_9f711536be9153eb = array_add(var_9f711536be9153eb, function_f74cacfd2004dc6d(wall[0], wall[1] + var_e2622d8d804c74f6 * i, wall[2]));
        }
        var_ab3d60d5a354d4da = array_add(var_ab3d60d5a354d4da, var_9f711536be9153eb);
    }
    return var_ab3d60d5a354d4da;
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d
// Size: 0x47
function function_f74cacfd2004dc6d(scriptable, position, rotation) {
    return spawnscriptable(level.ftuedata.var_2d519d04932f812e.scriptables[function_1823ff50bb28148d(scriptable)], position, rotation);
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36c
// Size: 0x9f
function function_8ec6ff395f428891(var_a45669cf75867ed7) {
    foreach (walls in var_a45669cf75867ed7) {
        foreach (wall in walls) {
            function_7a423436aaaf2e58(wall);
        }
    }
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412
// Size: 0x25
function function_7a423436aaaf2e58(wall) {
    wall.origin = (0, 0, 0);
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43e
// Size: 0xa6
function function_de1acb2ec7807e38() {
    if (!isdefined(level.ftuedata.var_e82a930c823a7b9c)) {
        return;
    }
    foreach (asset in level.ftuedata.var_e82a930c823a7b9c) {
        spawnscriptable(level.ftuedata.var_a1c8c05e25923460.scriptables[function_1823ff50bb28148d(asset[0])], asset[1], asset[2]);
    }
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb
// Size: 0x1b8
function function_fe4aefebd9992d47(var_ded14ae1ea8c4446, var_400586a35fa91e76, objectivetext) {
    if (var_400586a35fa91e76) {
        foreach (enemybot in var_ded14ae1ea8c4446) {
            level.ftuedata.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)].var_e0e1c48a5393d3d1 function_4148171500445ead(objectivetext);
        }
    }
    var_b599e3f9981dec25 = 0;
    while (var_b599e3f9981dec25 < var_ded14ae1ea8c4446.size) {
        foreach (enemybot in var_ded14ae1ea8c4446) {
            if (isdefined(level.ftuedata.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)].var_e0e1c48a5393d3d1) && level.ftuedata.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)].var_e0e1c48a5393d3d1.health <= 0) {
                var_b599e3f9981dec25++;
                function_b30874d13004d4c5(level.ftuedata.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)].var_e0e1c48a5393d3d1);
                level.ftuedata.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)] notify("death_or_disconnect");
                level.ftuedata.var_c0271a486aa56405[function_1823ff50bb28148d(enemybot)].var_e0e1c48a5393d3d1 = undefined;
            }
        }
        waitframe();
    }
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6aa
// Size: 0x8e
function function_4148171500445ead(objectivetext) {
    markeroffset = getdvarint(@"hash_7e3a7d1b515ef19e", 77);
    if (isdefined(objectivetext)) {
        objectivelabel = undefined;
        switch (objectivetext) {
        case #"hash_e810fefe7ef7f725":
            objectivelabel = "FTUE_MOBILE/SHOOT_TEST";
            break;
        case #"hash_f850836c8bee4d31":
            objectivelabel = "FTUE_MOBILE/SHOOT_ADS_TEST";
            break;
        }
        function_70e0de6281199e7(self, objectivelabel, "mgl_ui_icon_ping_tacmap_enemy", markeroffset);
    } else {
        function_70e0de6281199e7(self, undefined, "mgl_ui_icon_ping_tacmap_enemy", markeroffset);
    }
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f
// Size: 0x9f
function function_191d4de725937c3(position, spawndelay, var_fc5aaa4c4a896663) {
    if (!isdefined(level.ftuedata.var_fe2a7b46304fe2d5.var_7520d86455f99294)) {
        return;
    }
    if (isdefined(spawndelay)) {
        wait(spawndelay);
    }
    level.ftuedata.var_3c5ef1ed040af91c.var_7520d86455f99294.origin = position + (0, 0, level.ftuedata.var_3c5ef1ed040af91c.var_8535c66bd370de4b);
    if (isdefined(var_fc5aaa4c4a896663)) {
        level thread function_4da0c02be23df7d(position, var_fc5aaa4c4a896663);
    }
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e5
// Size: 0x61
function private function_4da0c02be23df7d(position, var_fc5aaa4c4a896663) {
    level endon("stop_dynamic_mark");
    while (1) {
        if (distance(level.player.origin, position) < var_fc5aaa4c4a896663) {
            function_191d4de725937c3((0, 0, 0));
        } else {
            function_191d4de725937c3(position);
        }
        waitframe();
    }
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x84d
// Size: 0xba
function function_8e8398e14bc1f418(triggerorigin, triggerradius, triggerheight, objectivetext, objectiveicon, var_41c04358e0645eed) {
    trigger = spawn("trigger_radius", triggerorigin, 0, triggerradius, triggerheight);
    trigger.radius = triggerradius;
    trigger.height = triggerheight;
    if (isdefined(objectivetext) && isdefined(objectiveicon) && isdefined(var_41c04358e0645eed)) {
        objectiveid = function_e5524fb8509827bf(triggerorigin, objectivetext, objectiveicon, var_41c04358e0645eed);
        trigger.objectiveid = objectiveid;
    }
    if (getdvarint(@"hash_66535d0f1ce2e9ff", 0)) {
        trigger thread function_5557a3c447c06db9();
    }
    return trigger;
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90f
// Size: 0x53
function private function_5557a3c447c06db9() {
    self endon("entitydeleted");
    while (getdvarint(@"hash_66535d0f1ce2e9ff", 0)) {
        namespace_3c37cb17ade254d::draw_capsule(self.origin, self.radius, self.height, undefined, (1, 0, 0), 0, 1);
        waitframe();
    }
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x969
// Size: 0x25
function function_167d907cc0817d4(var_14e976b5d4a4eab0) {
    function_4d03b9ef456d0972(var_14e976b5d4a4eab0.objectiveid);
    var_14e976b5d4a4eab0 delete();
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x995
// Size: 0x66
function function_a52fb2b2cd1bcefa(var_96caeca39a49d120, var_91887005c7b1a4d2) {
    if (isdefined(level.ftuedata.var_3d84eef8b3afe5eb)) {
        return [0:level.ftuedata.var_3d84eef8b3afe5eb, 1:level.ftuedata.var_9d94e563e4be46b8];
    }
    return [0:var_96caeca39a49d120, 1:var_91887005c7b1a4d2];
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa03
// Size: 0x47
function function_1be67d0cda80cbd4(var_97d0b950cf73b59e) {
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAbortEnded");
    self waittill("currentContextualTipAborted");
    if (isdefined(var_97d0b950cf73b59e)) {
        self [[ var_97d0b950cf73b59e ]]();
    }
    function_6fba31415caeee6e(0, level.ftuedata.var_f09f2ffd8a67fe03);
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa51
// Size: 0x6b
function function_7fdf3cf66304f3c5(player, var_ee011d69b16ff21d, var_6ce5a1bc0748ca1e) {
    player endon("currentContextualTipCompleted");
    player endon("currentContextualTipAborted");
    player endon("currentContextualTipAbortEnded");
    /#
        var_97072eeae32ebd38 = getdvarint(@"hash_2fa12b4488f98d13", 0);
        if (var_97072eeae32ebd38 != 0) {
            var_ee011d69b16ff21d = var_97072eeae32ebd38;
        }
    #/
    player thread function_1be67d0cda80cbd4(var_6ce5a1bc0748ca1e);
    wait(var_ee011d69b16ff21d);
    player notify("currentContextualTipAborted");
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac3
// Size: 0x14
function function_81771105fc1a47cb(player) {
    player notify("currentContextualTipAbortEnded");
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xade
// Size: 0xd2
function function_c0e79dfb73eaae6a(var_2193fde10bf4b43a, start_alpha, player) {
    if (isdefined(player)) {
        overlay = newclienthudelem(player);
    } else {
        overlay = newhudelem();
    }
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader(var_2193fde10bf4b43a, 640, 480);
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = start_alpha;
    overlay.foreground = 1;
    return overlay;
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbb8
// Size: 0x49
function function_dc51de4e8cbd07b(pos, angles) {
    cameraent = spawn("script_model", pos);
    if (isdefined(angles)) {
        cameraent.angles = angles;
    }
    cameraent setmodel("tag_origin");
    return cameraent;
}

// Namespace namespace_ac3046f64a1306ea/namespace_c7fbb8d68025450d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc09
// Size: 0x65
function function_f59685a8f8990601(message) {
    /#
        if (getdvarint(@"hash_5bcd0aca8a94e5a7", 0) == 0) {
            return;
        }
        if (isdefined(message)) {
            starttime = gettime();
            while (gettime() - starttime <= 2000) {
                printtoscreen2d(10, 200, message, (1, 1, 1), 2);
                waitframe();
            }
        }
    #/
}

