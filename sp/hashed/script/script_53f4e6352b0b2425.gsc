#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_6bf6c8e2e1fdccaa;
#using script_19163c4e4e504a5e;
#using script_162c770c1453a845;
#using script_53f4e6352b0b2425;

#namespace snd;

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8a
// Size: 0x114
function snd_init() {
    if (!isdefined(level.snd)) {
        level.snd = spawnstruct();
        level.snd.var_78f5f86726c0fdb5 = 1;
        level.snd.callbacks = [];
        level.snd.objects = [];
        level.snd.var_a79bb46c42ffe2fd = [];
        level.snd.var_6bb7b2b49f3454a1 = "gentity";
        level.snd.var_c5b5d16976d4a8ef = 0;
        level.snd.callbacks["player_view"] = &function_cfd6fc964dca520a;
        level.snd.callbacks["player_angles"] = &function_d4503656fc0a9c48;
        level.snd.callbacks["player_fov"] = &function_6c8d0689823981ab;
    }
    function_301f98e25e20c1ab();
    /#
        level thread function_28988b4602b0b747();
    #/
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a6
// Size: 0x6d
function function_b3e5599c9f6a8895(obj) {
    assert(obj == level || isstruct(obj) || isent(obj));
    if (!isstruct(obj.snd)) {
        obj.snd = spawnstruct();
    }
    assertex(isstruct(obj.snd), "snd_init_obj obj.snd is not a struct");
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111b
// Size: 0x2f
function function_4677a3d91779f0e() {
    now = gettime();
    var_62b0f3e6017d4cee = function_f0b5522ee5ce0cb1() == 0 || now <= 300;
    return var_62b0f3e6017d4cee;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1153
// Size: 0x17
function function_f0b5522ee5ce0cb1() {
    if (isstruct(level.snd)) {
        return true;
    }
    return false;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1173
// Size: 0x11
function function_40a17693396019a7() {
    while (function_f0b5522ee5ce0cb1() == 0) {
        waitframe();
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x118c
// Size: 0x46
function snd_play(soundalias, targets) {
    soundtype = level.snd.var_6bb7b2b49f3454a1;
    var_972270fb4a04f3bf = function_88c8b4d475d4cfd(soundtype, soundalias, targets);
    return var_972270fb4a04f3bf;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11db
// Size: 0x65
function function_9185173ee7017a51(var_972270fb4a04f3bf, var_c09e956d9fbc81a6) {
    foreach (var_4caf7493cc02619d in function_5762e7cb509e83c0(var_972270fb4a04f3bf)) {
        level thread function_114485fecd709d37(var_4caf7493cc02619d, var_c09e956d9fbc81a6);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1248
// Size: 0xd9
function snd_stop_alias(soundalias, targets, var_c09e956d9fbc81a6) {
    if (function_110d3ab280057f5b(!isdefined(soundalias), "snd_stop_alias with undefined soundalias")) {
        return 0;
    }
    soundalias = tolower(soundalias);
    var_65b244a3c8e429a4 = function_a922099e0d89c828(targets);
    var_cadaa7a8d37a5adc = 0;
    foreach (var_4caf7493cc02619d in var_65b244a3c8e429a4) {
        if (!isdefined(var_4caf7493cc02619d.soundalias)) {
            continue;
        }
        if (issubstr(tolower(var_4caf7493cc02619d.soundalias), soundalias)) {
            function_9185173ee7017a51(var_4caf7493cc02619d, var_c09e956d9fbc81a6);
            var_cadaa7a8d37a5adc = int(var_cadaa7a8d37a5adc + 1);
        }
    }
    return var_cadaa7a8d37a5adc;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x132a
// Size: 0xbc
function function_c5647295e3ac75df(var_972270fb4a04f3bf, notifyentity, notifystring, var_c09e956d9fbc81a6) {
    if (function_110d3ab280057f5b(!function_f0a31c88dbf01c1(var_972270fb4a04f3bf), "snd_stop_on_ent_notify soundObject is not a snd object")) {
        return;
    }
    if (function_110d3ab280057f5b(!isent(notifyentity), "snd_stop_on_ent_notify notifyEntity is not an entity")) {
        return;
    }
    if (function_110d3ab280057f5b(!isstring(notifystring), "snd_stop_on_ent_notify notifyString is not a string")) {
        return;
    }
    foreach (var_4caf7493cc02619d in function_5762e7cb509e83c0(var_972270fb4a04f3bf)) {
        notifyentity thread function_696597962461161(var_4caf7493cc02619d, notifyentity, notifystring, var_c09e956d9fbc81a6);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13ee
// Size: 0xa0
function function_a9bcfafb96e69580(var_972270fb4a04f3bf, var_5b982a11c50c429e, var_c09e956d9fbc81a6) {
    if (function_110d3ab280057f5b(!function_f0a31c88dbf01c1(var_972270fb4a04f3bf), "stop_on_ent_death soundObject is not a snd object")) {
        return;
    }
    if (function_110d3ab280057f5b(!isent(var_5b982a11c50c429e), "stop_on_ent_death deathEntity is not an entity")) {
        return;
    }
    foreach (var_4caf7493cc02619d in function_5762e7cb509e83c0(var_972270fb4a04f3bf)) {
        var_5b982a11c50c429e thread function_696597962461161(var_4caf7493cc02619d, var_5b982a11c50c429e, "death", var_c09e956d9fbc81a6);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1496
// Size: 0x9b
function function_74726126b3d8b0aa(var_972270fb4a04f3bf, var_38887ada292d9569, var_c09e956d9fbc81a6) {
    if (function_110d3ab280057f5b(!function_f0a31c88dbf01c1(var_972270fb4a04f3bf), "stop_on_level_notify soundObject is not a snd object")) {
        return;
    }
    if (function_110d3ab280057f5b(!isstring(var_38887ada292d9569), "snd_stop_on_level_notify: levelNotifyString is not a string")) {
        return;
    }
    foreach (var_4caf7493cc02619d in function_5762e7cb509e83c0(var_972270fb4a04f3bf)) {
        level thread function_eddfe63d2da7ee5c(var_4caf7493cc02619d, var_38887ada292d9569, var_c09e956d9fbc81a6);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1539
// Size: 0xe9
function function_62b51aa15506bcbc(var_972270fb4a04f3bf) {
    if (function_110d3ab280057f5b(!isdefined(var_972270fb4a04f3bf), "snd_wait with undefined soundObject")) {
        return 0;
    }
    starttime = gettime();
    waittime = 0;
    while (true) {
        var_e7662060a76bac2b = 0;
        var_65b244a3c8e429a4 = function_5762e7cb509e83c0(var_972270fb4a04f3bf);
        var_65b244a3c8e429a4 = array_removeundefined(var_65b244a3c8e429a4);
        foreach (var_4caf7493cc02619d in var_65b244a3c8e429a4) {
            if (function_f0a31c88dbf01c1(var_4caf7493cc02619d)) {
                var_e7662060a76bac2b = 1;
                break;
            }
        }
        if (var_e7662060a76bac2b == 0) {
            break;
        }
        waitframe();
    }
    endtime = gettime();
    waittime = endtime - starttime;
    waittime /= 1000;
    return waittime;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x162b
// Size: 0x24
function function_f0a31c88dbf01c1(var_972270fb4a04f3bf) {
    if (isdefined(var_972270fb4a04f3bf) && isdefined(var_972270fb4a04f3bf.soundtype)) {
        return true;
    }
    return false;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1658
// Size: 0x106
function function_a922099e0d89c828(targets) {
    var_e70663ccf183b3ce = [];
    foreach (target in function_5762e7cb509e83c0(targets)) {
        if (!isdefined(target)) {
            var_e70663ccf183b3ce = array_combine(var_e70663ccf183b3ce, level.snd.objects);
            continue;
        }
        if (function_110d3ab280057f5b(isnumber(target), "snd: get_sound_objects invalid target was a number")) {
            /#
                if (function_6fa24a43c981460a()) {
                    DevOp(0x94);
                }
            #/
            continue;
        }
        if (target == level) {
            var_e70663ccf183b3ce = array_combine(var_e70663ccf183b3ce, level.snd.var_a79bb46c42ffe2fd);
            continue;
        }
        if (isdefined(target.snd.objects)) {
            var_e70663ccf183b3ce = array_combine(var_e70663ccf183b3ce, target.snd.objects);
        }
    }
    return var_e70663ccf183b3ce;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1767
// Size: 0x189
function function_40970b59b11f71d3(soundalias, targets) {
    if (function_110d3ab280057f5b(!isdefined(soundalias), "snd_get_alias_objects with undefined soundalias")) {
        return 0;
    }
    soundaliases = [];
    if (isarray(soundalias)) {
        foreach (alias in soundalias) {
            soundaliases[soundaliases.size] = tolower(alias);
        }
    } else if (isstring(soundalias)) {
        soundaliases = [tolower(soundalias)];
    }
    assertex(isarray(soundaliases), "snd_get_alias_objects: soundaliases is not an array");
    var_65b244a3c8e429a4 = function_a922099e0d89c828(targets);
    var_97247ad1e88ffc61 = [];
    foreach (var_4caf7493cc02619d in var_65b244a3c8e429a4) {
        if (!isdefined(var_4caf7493cc02619d.soundalias)) {
            continue;
        }
        foreach (alias in soundaliases) {
            if (issubstr(tolower(var_4caf7493cc02619d.soundalias), alias)) {
                var_97247ad1e88ffc61[var_97247ad1e88ffc61.size] = var_4caf7493cc02619d;
            }
        }
    }
    return var_97247ad1e88ffc61;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f9
// Size: 0x164
function function_c2524740dbf249bd(var_879128515ec2caa2) {
    var_879128515ec2caa2 = default_to(var_879128515ec2caa2, 1);
    if (!isdefined(level.snd.fnplaysoundonentity)) {
        level.snd.fnplaysoundonentity = level.fnplaysoundonentity;
        level.snd.fnplaysoundontag = level.fnplaysoundontag;
        level.snd.fnnotetrackprefixhandler = level.fnnotetrackprefixhandler;
        level.snd.var_f7ce8811120b418e = anim.callbacks["PlaySoundAtViewHeight"];
    }
    if (var_879128515ec2caa2) {
        level.fnplaysoundonentity = &function_ee9c171db1ae676e;
        level.fnplaysoundontag = &function_ee1f9b08b748b2bf;
        level.fnnotetrackprefixhandler = &function_f1fa7d6753f06a41;
        anim.callbacks["PlaySoundAtViewHeight"] = &function_4df9eee6e5769696;
        return;
    }
    level.fnplaysoundonentity = level.snd.fnplaysoundonentity;
    level.fnplaysoundontag = level.snd.fnplaysoundontag;
    level.fnnotetrackprefixhandler = level.snd.fnnotetrackprefixhandler;
    anim.callbacks["PlaySoundAtViewHeight"] = level.snd.var_f7ce8811120b418e;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a65
// Size: 0x4a
function function_3b12d9c60745e066(var_972270fb4a04f3bf) {
    if (isdefined(level.snd.callbacks["volume_get"])) {
        return [[ level.snd.callbacks["volume_get"] ]](var_972270fb4a04f3bf);
    }
    return 1;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab8
// Size: 0x69
function function_e70d88e85d5fb19a(var_972270fb4a04f3bf, volume, timeinseconds, curve, callbackfunc) {
    if (isdefined(level.snd.callbacks["volume_set"])) {
        [[ level.snd.callbacks["volume_set"] ]](var_972270fb4a04f3bf, volume, timeinseconds, curve, callbackfunc);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b29
// Size: 0x4a
function function_f54bdc273c4ca53a(var_972270fb4a04f3bf) {
    if (isdefined(level.snd.callbacks["pitch_get"])) {
        return [[ level.snd.callbacks["pitch_get"] ]](var_972270fb4a04f3bf);
    }
    return 1;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7c
// Size: 0x69
function function_a2c9c85b2af7c7fe(var_972270fb4a04f3bf, pitch, timeinseconds, curve, callbackfunc) {
    if (isdefined(level.snd.callbacks["pitch_set"])) {
        [[ level.snd.callbacks["pitch_set"] ]](var_972270fb4a04f3bf, pitch, timeinseconds, curve, callbackfunc);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bed
// Size: 0x24
function function_fb2fb41ac5ab1d47() {
    if (istrue(level.snd.var_ab52ccadc04df539)) {
        return "centity";
    }
    return "gentity";
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1a
// Size: 0x15
function function_47659f446bf756a4() {
    return level.snd.var_6bb7b2b49f3454a1;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c38
// Size: 0x35
function function_202b3d1e393890(type) {
    type = default_to(type, function_fb2fb41ac5ab1d47());
    level.snd.var_6bb7b2b49f3454a1 = function_21d5c74cfbf9ebcb(type);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c75
// Size: 0x2b
function function_77d8a00d3187f85c(var_972270fb4a04f3bf) {
    if (isdefined(var_972270fb4a04f3bf.soundtype)) {
        return var_972270fb4a04f3bf.soundtype;
    }
    return "";
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca9
// Size: 0x87
function function_21d5c74cfbf9ebcb(soundtype) {
    var_1b0e0f838932e059 = undefined;
    switch (soundtype) {
    case #"hash_59f13b3cf23ba655":
        var_1b0e0f838932e059 = "gentity";
        break;
    case #"hash_9ffcd1094df9c111":
        var_1b0e0f838932e059 = "centity";
        break;
    case #"hash_cb36e64f12ba9ad":
        var_1b0e0f838932e059 = "emitter";
        break;
    default:
        var_1b0e0f838932e059 = undefined;
        break;
    }
    assertex(isdefined(var_1b0e0f838932e059), "snd: illegal soundtype string" + soundtype);
    return var_1b0e0f838932e059;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1d39
// Size: 0xb2
function private function_bf5653c442222ab8(var_1b0e0f838932e059, var_2da794626caca098, item) {
    assertex(isstruct(level.snd), "snd was not initialized");
    assertex(isdefined(level.snd.objects), "snd was not initialized");
    switch (var_1b0e0f838932e059) {
    default:
        assertex(0, "unknown snd type");
        break;
    case #"hash_59f13b3cf23ba655":
    case #"hash_9ffcd1094df9c111":
        level.snd.objects[var_2da794626caca098] = item;
        break;
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1df3
// Size: 0xd8
function private function_23a8f89921cec8a3(var_1b0e0f838932e059, var_2da794626caca098, item) {
    assertex(isstruct(level.snd), "snd was not initialized");
    assertex(isdefined(level.snd.objects), "snd was not initialized");
    switch (var_1b0e0f838932e059) {
    default:
        assertex(0, "unknown snd type");
        break;
    case #"hash_59f13b3cf23ba655":
    case #"hash_9ffcd1094df9c111":
        assertex(array_contains(level.snd.objects, item), "snd freed entity was not allocated");
        level.snd.objects[var_2da794626caca098] = undefined;
        break;
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ed3
// Size: 0x3c
function private function_f6cebff1cb2afece() {
    var_1b0e0f838932e059 = self.soundtype;
    var_2da794626caca098 = self.soundkey;
    self waittill("death");
    function_23a8f89921cec8a3(var_1b0e0f838932e059, var_2da794626caca098, self);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1f17
// Size: 0x132
function private function_2743b5d65cb4aa61(ent, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a) {
    assertex(isdefined(ent), "snd: undefined gentity");
    assertex(isdefined(ent.soundkey), "snd: undefined soundkey");
    if (isdefined(var_71ae8cfae0fb6eb7)) {
        var_e959ada5ef77e30a = var_71ae8cfae0fb6eb7 function_1437d15fc0a0a804(var_e959ada5ef77e30a);
        var_4695031a9d372b57 = (0, 0, 0);
        var_dacd11f4622ffe8c = (0, 0, 0);
        if (isdefined(var_b042ad1a3b3400e8)) {
            var_4695031a9d372b57 = var_b042ad1a3b3400e8;
        }
        assertex(isdefined(var_e959ada5ef77e30a), "snd: undefined linkedBoneTag");
        ent linkto(var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a, var_4695031a9d372b57, var_dacd11f4622ffe8c);
        function_b3e5599c9f6a8895(var_71ae8cfae0fb6eb7);
        if (!isarray(var_71ae8cfae0fb6eb7.snd.objects)) {
            var_71ae8cfae0fb6eb7.snd.objects = [];
        }
        var_71ae8cfae0fb6eb7.snd.objects[ent.soundkey] = ent;
        return;
    }
    level.snd.var_a79bb46c42ffe2fd[ent.soundkey] = ent;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x2051
// Size: 0x159
function private function_32231133ccc402ee(soundalias, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a) {
    ent = undefined;
    spawnorigin = undefined;
    if (isdefined(var_71ae8cfae0fb6eb7) && isdefined(var_e959ada5ef77e30a) && isdefined(var_b042ad1a3b3400e8)) {
        spawnorigin = var_71ae8cfae0fb6eb7 gettagorigin(var_e959ada5ef77e30a);
        spawnorigin += var_b042ad1a3b3400e8;
    } else if (isdefined(var_71ae8cfae0fb6eb7) && isdefined(var_e959ada5ef77e30a)) {
        spawnorigin = var_71ae8cfae0fb6eb7 gettagorigin(var_e959ada5ef77e30a);
    } else if (isdefined(var_71ae8cfae0fb6eb7)) {
        spawnorigin = var_71ae8cfae0fb6eb7.origin;
    } else if (!isdefined(var_71ae8cfae0fb6eb7) && !isdefined(var_b042ad1a3b3400e8)) {
        var_7473306a600cd2ec = (0, 0, -32768);
        spawnorigin = var_7473306a600cd2ec;
    } else {
        spawnorigin = var_b042ad1a3b3400e8;
    }
    assertex(isdefined(spawnorigin));
    ent = undefined;
    if (isdefined(var_71ae8cfae0fb6eb7)) {
        ent = spawn("script_model", spawnorigin);
        if (isent(ent)) {
            ent setmodel("tag_origin");
        }
    } else {
        ent = spawn("script_origin", spawnorigin);
    }
    assertex(isdefined(ent), "snd: could not spawn/allocate entity");
    if (isent(ent)) {
        ent.var_c55912d11e27cbee = var_71ae8cfae0fb6eb7;
        ent.soundtype = "gentity";
        ent.soundkey = ent getentitynumber();
        ent.targetname = "snd " + soundalias;
    }
    return ent;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x21b3
// Size: 0x113
function private function_3faaafc0bfa48453(ent) {
    if (function_110d3ab280057f5b(!isdefined(ent) || function_5b8457b9d8edb521(ent), "snd: free on deleted entity!")) {
        /#
            if (function_6fa24a43c981460a()) {
                DevOp(0x94);
            }
        #/
        return;
    }
    if (isdefined(ent.var_c55912d11e27cbee) && isarray(ent.var_c55912d11e27cbee.snd.objects)) {
        var_71ae8cfae0fb6eb7 = ent.var_c55912d11e27cbee;
        var_25fdd8d118c2da05 = isdefined(var_71ae8cfae0fb6eb7.snd.objects[ent.soundkey]);
        if (var_25fdd8d118c2da05 == 1) {
            var_71ae8cfae0fb6eb7.snd.objects[ent.soundkey] = undefined;
        } else {
            /#
                if (function_6fa24a43c981460a()) {
                    DevOp(0x94);
                }
            #/
        }
    } else {
        level.snd.var_a79bb46c42ffe2fd[ent.soundkey] = undefined;
    }
    waittillframeend();
    ent delete();
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x22ce
// Size: 0x1ab
function private function_2a7a90760153d57b(var_972270fb4a04f3bf, soundalias, var_d8dba5e985305199, delaytime) {
    ent = var_972270fb4a04f3bf;
    currentvolume = undefined;
    ent endon("death");
    assert(isdefined(ent));
    assert(isstring(soundalias));
    currentvolume = function_3b12d9c60745e066(ent);
    if (!isdefined(var_d8dba5e985305199) && isdefined(currentvolume)) {
        var_d8dba5e985305199 = currentvolume;
    }
    if (function_4677a3d91779f0e()) {
        var_14cbdbf60f75e20b = !isdefined(delaytime) || isnumber(delaytime) && delaytime == 0;
        if (function_110d3ab280057f5b(var_14cbdbf60f75e20b, "snd: delayed due to first frame!")) {
            delaytime = 0.05;
        }
    }
    if (isnumber(delaytime) && delaytime > 0) {
        wait delaytime;
    }
    assertex(soundexists(soundalias), "snd alias does not exist: " + soundalias);
    if (soundislooping(soundalias)) {
        ent playloopsound(soundalias);
    } else {
        var_6d31f6e629595f83 = "sounddone";
        if (utility::issp()) {
            ent playsound(soundalias, var_6d31f6e629595f83);
            var_549286f0044c1565 = 0;
            if (var_549286f0044c1565) {
                ent thread function_9dc92ee851117f94(soundalias, var_6d31f6e629595f83);
            } else {
                ent thread function_f5abe4d9a18d99c7(var_6d31f6e629595f83);
            }
        } else {
            if (isdefined(ent.var_c55912d11e27cbee) && isdefined(level.snd.var_5ee4aba82383469e)) {
                waitframe();
                ent [[ level.snd.var_5ee4aba82383469e ]](soundalias);
            } else {
                ent playsound(soundalias);
            }
            ent thread function_9dc92ee851117f94(soundalias, var_6d31f6e629595f83);
        }
    }
    ent.soundalias = soundalias;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2481
// Size: 0xb9
function private function_e1f20b9363ca750d(var_972270fb4a04f3bf, var_c09e956d9fbc81a6) {
    var_972270fb4a04f3bf endon("death");
    ent = var_972270fb4a04f3bf;
    if (function_110d3ab280057f5b(!isdefined(ent) || function_5b8457b9d8edb521(ent), "snd: stop on deleted entity!")) {
        /#
            if (function_6fa24a43c981460a()) {
                DevOp(0x94);
            }
        #/
        return;
    }
    soundalias = ent.soundalias;
    var_c09e956d9fbc81a6 = default_to(var_c09e956d9fbc81a6, 0);
    if (isstring(soundalias)) {
        if (istrue(soundislooping(soundalias))) {
            ent stoploopsound();
        } else {
            ent stopsounds();
        }
        waitframe();
        ent.soundalias = undefined;
    }
    ent.soundtype = undefined;
    function_3faaafc0bfa48453(ent);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2542
// Size: 0x89
function private function_9dc92ee851117f94(soundalias, done) {
    ent = self;
    ent endon("death");
    waittime = lookupsoundlength(soundalias);
    waittime *= 1.25;
    waittime /= 1000;
    pitchmin = function_f0ef19ea41182a49(soundalias, "pitch_min");
    if (isdefined(pitchmin)) {
        waittime *= 1 / pitchmin;
    }
    wait waittime;
    ent notify(done, ent.soundalias);
    function_3faaafc0bfa48453(ent);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x25d3
// Size: 0x39
function private function_f5abe4d9a18d99c7(done) {
    ent = self;
    ent endon("death");
    ent waittill(done);
    ent notify(done, ent.soundalias);
    function_3faaafc0bfa48453(ent);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x2614
// Size: 0x32
function private function_ff4680a250fab665(ent, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a) {
    assertex(0, "snd: server centity unsupported");
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x264e
// Size: 0x33
function private function_7940c57b609bed52(soundalias, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a) {
    assertex(0, "snd: server centity unsupported");
    return undefined;
}

/#

    // Namespace snd / namespace_53c50dd747d66443
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x268a
    // Size: 0x1a
    function private function_4269910fc1e0759f(ent) {
        assertex(0, "snd: server centity unsupported");
    }

#/

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x26ac
// Size: 0x32
function private function_9802311630468f27(var_972270fb4a04f3bf, soundalias, var_d8dba5e985305199, delaytime) {
    assertex(0, "snd: server centity unsupported");
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x26e6
// Size: 0x22
function private function_e1ad0c284215f3b1(var_972270fb4a04f3bf, var_c09e956d9fbc81a6) {
    assertex(0, "snd: server centity unsupported");
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2710
// Size: 0x20
function private function_cfd6fc964dca520a() {
    player = self;
    vieworigin = player geteye();
    return vieworigin;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2739
// Size: 0x20
function private function_d4503656fc0a9c48() {
    player = self;
    viewangles = player getplayerangles();
    return viewangles;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2762
// Size: 0x2a
function private function_6c8d0689823981ab() {
    player = self;
    fov = getdvarfloat(@"cg_fov", 65);
    return fov;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2795
// Size: 0x103
function private function_f94e1534de6d5409(var_669be993dde00b14) {
    delaytime = 0;
    soundalias = undefined;
    var_d17ef5b1986147e1 = undefined;
    if (isarray(var_669be993dde00b14)) {
        keys = var_669be993dde00b14;
        soundalias = undefined;
        aliasindex = keys.size + 1;
        foreach (i, key in keys) {
            if (isstring(key)) {
                soundalias = key;
                aliasindex = i;
            }
            if (isnumber(key) && i < aliasindex) {
                delaytime = key;
            }
            if (isnumber(key) && i > aliasindex) {
                var_d17ef5b1986147e1 = key;
            }
        }
    } else if (isstring(var_669be993dde00b14)) {
        soundalias = var_669be993dde00b14;
    }
    var_76a5f6db226544b5 = [delaytime, soundalias, var_d17ef5b1986147e1];
    return var_76a5f6db226544b5;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x28a1
// Size: 0x2b5
function private function_d3655eaed7181b30(targ) {
    targets = [];
    if (!isdefined(targ)) {
        foreach (player in function_db2dac8138d9a79e()) {
            tagname = player function_1437d15fc0a0a804("j_head");
            if (player.model != "" && tagname != "") {
                targets[targets.size] = [player, tagname];
                continue;
            }
            targets[targets.size] = player;
        }
    } else if (isarray(targ)) {
        if (function_110d3ab280057f5b(targ.size == 0, "snd: zero-sized array used for targ")) {
            return undefined;
        } else if (targ.size == 2) {
            if (isent(targ[0]) && isstring(targ[1])) {
                targets = [targ];
            } else if (isent(targ[0]) && isvector(targ[1])) {
                targets = [targ];
            } else if (isent(targ[0]) && !isdefined(targ[1])) {
                targets = [targ[0]];
            } else if (isstring(targ[0]) && isstring(targ[1])) {
                var_4704c0b01a9fd8c1 = function_f2cff95560b91d22(targ[0]);
                var_a5a424346d41034d = function_f2cff95560b91d22(targ[1]);
                targets = array_combine(var_4704c0b01a9fd8c1, var_a5a424346d41034d);
            } else {
                targets = targ;
            }
        } else {
            targets = [];
            foreach (key in targ) {
                if (isent(key) || isstruct(key) && isdefined(key.origin) || isvector(key) || isarray(key)) {
                    targets[targets.size] = key;
                    continue;
                }
                if (isstring(key)) {
                    var_f27e0324d376071d = function_f2cff95560b91d22(key);
                    foreach (t in var_f27e0324d376071d) {
                        targets[targets.size] = t;
                    }
                }
            }
        }
    } else if (isstring(targ)) {
        targets = function_f2cff95560b91d22(targ);
    } else {
        targets = [targ];
    }
    return targets;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x2b5f
// Size: 0x5b6
function private function_88c8b4d475d4cfd(soundtype, soundalias, var_56cc972df3606c48, var_ee21476b751693ab) {
    if (function_110d3ab280057f5b(!function_f0b5522ee5ce0cb1(), "snd was not initialized!")) {
        /#
            if (function_6fa24a43c981460a()) {
                DevOp(0x94);
            }
        #/
        return undefined;
    }
    if (function_110d3ab280057f5b(!isdefined(soundalias), "snd_play: sound alias undefined")) {
        return undefined;
    }
    level.snd.callbacks["stop"] = &function_9185173ee7017a51;
    assertex(isdefined(level.snd.var_6bb7b2b49f3454a1), "snd was not initialized");
    soundtype = default_to(soundtype, level.snd.var_6bb7b2b49f3454a1);
    var_65b244a3c8e429a4 = [];
    targets = [];
    var_17ac63276cb6feb9 = function_f94e1534de6d5409(soundalias);
    assertex(isarray(var_17ac63276cb6feb9) && var_17ac63276cb6feb9.size == 3, "snd unexpected soundparam");
    delaytime = var_17ac63276cb6feb9[0];
    soundalias = var_17ac63276cb6feb9[1];
    var_d17ef5b1986147e1 = var_17ac63276cb6feb9[2];
    var_d8dba5e985305199 = undefined;
    if (function_110d3ab280057f5b(isstring(soundalias) && soundalias == "", "snd_play: empty sound alias \"\"")) {
        return undefined;
    }
    assertex(isstring(soundalias), "snd: soundalias undefined");
    islooping = soundislooping(soundalias);
    var_ffd068e9a4029ae4 = soundexists(soundalias);
    if (function_110d3ab280057f5b(!var_ffd068e9a4029ae4, "snd: sound alias '" + soundalias + "' does not exist!")) {
        /#
            if (function_6fa24a43c981460a()) {
                DevOp(0x94);
            }
        #/
        return undefined;
    }
    if (!isdefined(var_d17ef5b1986147e1)) {
        if (islooping) {
            var_d17ef5b1986147e1 = level.snd.var_c5b5d16976d4a8ef;
        } else {
            var_d17ef5b1986147e1 = 0;
        }
    }
    if (isdefined(var_d17ef5b1986147e1) && var_d17ef5b1986147e1 > 0) {
        var_d8dba5e985305199 = 0;
    }
    assert(isdefined(var_d17ef5b1986147e1));
    targets = function_d3655eaed7181b30(var_56cc972df3606c48);
    if (function_110d3ab280057f5b(!isdefined(targets), "snd: undefined targets")) {
        return undefined;
    }
    foreach (t in targets) {
        var_71ae8cfae0fb6eb7 = undefined;
        var_e959ada5ef77e30a = undefined;
        var_b042ad1a3b3400e8 = undefined;
        var_972270fb4a04f3bf = undefined;
        ise = isent(t);
        isr = function_5b8457b9d8edb521(t);
        iss = isstruct(t);
        isv = isvector(t);
        var_fed16703f679b53d = isstring(t);
        var_fed15803f6799440 = isarray(t);
        if (ise) {
            var_71ae8cfae0fb6eb7 = t;
            var_b042ad1a3b3400e8 = (0, 0, 0);
        } else if (function_110d3ab280057f5b(isr, "snd: could not play on removed entity")) {
            continue;
        } else if (iss) {
            if (function_110d3ab280057f5b(!isdefined(t.origin), "snd: sound alias '" + soundalias + "' played on struct with no origin!")) {
                continue;
            } else {
                var_b042ad1a3b3400e8 = t.origin;
            }
        } else if (isv) {
            var_b042ad1a3b3400e8 = t;
        } else if (var_fed16703f679b53d) {
        } else if (isarray(t)) {
            if (!isdefined(t[0]) || function_5b8457b9d8edb521(t[0])) {
                continue;
            } else if (isent(t[0]) && isstring(t[1])) {
                var_71ae8cfae0fb6eb7 = t[0];
                var_e959ada5ef77e30a = t[1];
                var_b042ad1a3b3400e8 = (0, 0, 0);
            } else if (isent(t[0]) && isvector(t[1])) {
                var_71ae8cfae0fb6eb7 = t[0];
                var_b042ad1a3b3400e8 = t[1];
            } else if (function_110d3ab280057f5b(1, "snd: unexpected target array combination")) {
            }
        }
        switch (soundtype) {
        default:
            assertex(0, "snd: unknown soundtype");
            break;
        case #"hash_59f13b3cf23ba655":
            var_972270fb4a04f3bf = function_32231133ccc402ee(soundalias, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a);
            if (isent(var_972270fb4a04f3bf)) {
                function_2743b5d65cb4aa61(var_972270fb4a04f3bf, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a);
                function_bf5653c442222ab8("gentity", var_972270fb4a04f3bf.soundkey, var_972270fb4a04f3bf);
                var_972270fb4a04f3bf thread function_f6cebff1cb2afece();
            }
            break;
        case #"hash_9ffcd1094df9c111":
            var_972270fb4a04f3bf = function_7940c57b609bed52(soundalias, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a);
            if (isent(var_972270fb4a04f3bf)) {
                function_ff4680a250fab665(var_972270fb4a04f3bf, var_b042ad1a3b3400e8, var_71ae8cfae0fb6eb7, var_e959ada5ef77e30a);
                function_bf5653c442222ab8("centity", var_972270fb4a04f3bf.soundkey, var_972270fb4a04f3bf);
                var_972270fb4a04f3bf thread function_f6cebff1cb2afece();
            }
            break;
        }
        if (isdefined(var_972270fb4a04f3bf) && function_f0a31c88dbf01c1(var_972270fb4a04f3bf)) {
            switch (soundtype) {
            case #"hash_59f13b3cf23ba655":
            default:
                var_972270fb4a04f3bf thread function_2a7a90760153d57b(var_972270fb4a04f3bf, soundalias, var_d8dba5e985305199, delaytime);
                break;
            case #"hash_9ffcd1094df9c111":
                var_972270fb4a04f3bf thread function_9802311630468f27(var_972270fb4a04f3bf, soundalias, var_d8dba5e985305199, delaytime);
                break;
            }
            if (var_d17ef5b1986147e1 > 0) {
                if (soundtype == "gentity" && isdefined(var_71ae8cfae0fb6eb7)) {
                    delaytime += 0.05;
                }
                var_972270fb4a04f3bf thread function_b1fd36299b09c0f5(var_972270fb4a04f3bf, var_d17ef5b1986147e1, delaytime);
            }
            var_65b244a3c8e429a4[var_65b244a3c8e429a4.size] = var_972270fb4a04f3bf;
        }
    }
    if (function_110d3ab280057f5b(var_65b244a3c8e429a4.size == 0, "snd: zero sound objects played")) {
        return undefined;
    }
    return function_3782ee9519fb76c3(var_65b244a3c8e429a4);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x311e
// Size: 0x21b
function private function_114485fecd709d37(var_972270fb4a04f3bf, var_c09e956d9fbc81a6) {
    if (function_110d3ab280057f5b(!isstruct(level.snd) || !isdefined(level.snd.var_6bb7b2b49f3454a1), "snd was not initialized")) {
        return;
    }
    if (function_110d3ab280057f5b(!isdefined(var_972270fb4a04f3bf) || function_5b8457b9d8edb521(var_972270fb4a04f3bf), "snd_stop with undefined soundObject")) {
        return;
    }
    if (function_110d3ab280057f5b(!isdefined(var_972270fb4a04f3bf.soundtype), "snd_stop with unknown type")) {
        return;
    }
    assertex(isdefined(level.snd.var_6bb7b2b49f3454a1), "snd was not initialized");
    assertex(isdefined(var_972270fb4a04f3bf), "snd call missing soundObject parameter");
    assertex(isdefined(var_972270fb4a04f3bf.soundtype), "snd with unknown type");
    if (var_972270fb4a04f3bf.soundtype == "emitter") {
        var_972270fb4a04f3bf notify("snd_emitter_stop");
        var_972270fb4a04f3bf.soundtype = undefined;
        var_972270fb4a04f3bf.soundalias = undefined;
        var_972270fb4a04f3bf.var_c55912d11e27cbee = undefined;
        var_972270fb4a04f3bf.origin = undefined;
        var_972270fb4a04f3bf.angles = undefined;
        return;
    }
    var_972270fb4a04f3bf endon("death");
    soundtype = var_972270fb4a04f3bf.soundtype;
    soundalias = var_972270fb4a04f3bf.soundalias;
    islooping = undefined;
    if (isstring(soundalias)) {
        islooping = soundislooping(soundalias);
    }
    if (istrue(islooping) && !isdefined(var_c09e956d9fbc81a6)) {
        var_c09e956d9fbc81a6 = float(level.snd.var_c5b5d16976d4a8ef);
    } else if (isnumber(var_c09e956d9fbc81a6)) {
        var_c09e956d9fbc81a6 = float(var_c09e956d9fbc81a6);
    }
    if (isdefined(soundalias) && isfloat(var_c09e956d9fbc81a6)) {
        function_e70d88e85d5fb19a(var_972270fb4a04f3bf, 0, var_c09e956d9fbc81a6);
        wait var_c09e956d9fbc81a6;
        waitframe();
        if (function_5b8457b9d8edb521(var_972270fb4a04f3bf)) {
            return;
        }
    }
    switch (soundtype) {
    case #"hash_59f13b3cf23ba655":
    default:
        function_e1f20b9363ca750d(var_972270fb4a04f3bf, var_c09e956d9fbc81a6);
        break;
    case #"hash_9ffcd1094df9c111":
        function_e1ad0c284215f3b1(var_972270fb4a04f3bf, var_c09e956d9fbc81a6);
        break;
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3341
// Size: 0x41
function private function_696597962461161(var_972270fb4a04f3bf, notifyentity, notifystring, var_c09e956d9fbc81a6) {
    var_972270fb4a04f3bf endon("death");
    notifyentity waittill_any_2("death", notifystring);
    function_114485fecd709d37(var_972270fb4a04f3bf, var_c09e956d9fbc81a6);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x338a
// Size: 0x2f
function private function_eddfe63d2da7ee5c(var_972270fb4a04f3bf, var_38887ada292d9569, var_c09e956d9fbc81a6) {
    var_972270fb4a04f3bf endon("death");
    level waittill(var_38887ada292d9569);
    function_114485fecd709d37(var_972270fb4a04f3bf, var_c09e956d9fbc81a6);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x33c1
// Size: 0x8b
function private function_b1fd36299b09c0f5(var_972270fb4a04f3bf, var_d17ef5b1986147e1, delaytime) {
    if (function_110d3ab280057f5b(!isdefined(var_972270fb4a04f3bf) || function_5b8457b9d8edb521(var_972270fb4a04f3bf), "snd: fade in on deleted gentity!")) {
        return;
    }
    assert(isdefined(var_972270fb4a04f3bf));
    var_972270fb4a04f3bf endon("death");
    var_972270fb4a04f3bf endon("stopfade");
    delaytime = default_to(delaytime, 0);
    function_e70d88e85d5fb19a(var_972270fb4a04f3bf, 0, 0);
    if (delaytime > 0) {
        wait delaytime;
    }
    function_e70d88e85d5fb19a(var_972270fb4a04f3bf, 1, var_d17ef5b1986147e1);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3454
// Size: 0x65
function function_7670acb4b00bb0ac(target) {
    position = undefined;
    if (isvector(target)) {
        position = target;
    } else if (function_d221a0d675bf19d9(target)) {
        position = target function_97f58d285dd23025();
    } else if (!function_5b8457b9d8edb521(target) && isdefined(target.origin)) {
        position = target.origin;
    }
    return position;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x34c2
// Size: 0x142
function private function_2e4ee66733c986ee(var_de4004608595aec8) {
    var_57338c9e11b3e93 = randomfloatrange(-180, 180);
    rotation = 0;
    if (isarray(var_de4004608595aec8)) {
        if (var_de4004608595aec8.size == 1) {
            var_de4004608595aec8 = var_de4004608595aec8[0];
        } else if (var_de4004608595aec8.size == 2) {
            rotation = function_4f102469dc90a19a(var_de4004608595aec8);
        } else if (var_de4004608595aec8.size == 3) {
            var_57338c9e11b3e93 = var_de4004608595aec8[0];
            rotation = function_4f102469dc90a19a(var_de4004608595aec8);
            var_cd04a8e443a298ea = [var_de4004608595aec8[1], var_de4004608595aec8[2]];
            rotation = function_4f102469dc90a19a(var_cd04a8e443a298ea);
        } else if (var_de4004608595aec8.size >= 4) {
            var_1c6878741047dda8 = [var_de4004608595aec8[0], var_de4004608595aec8[1]];
            var_57338c9e11b3e93 = function_4f102469dc90a19a(var_1c6878741047dda8);
            var_cd04a8e443a298ea = [var_de4004608595aec8[2], var_de4004608595aec8[3]];
            rotation = function_4f102469dc90a19a(var_cd04a8e443a298ea);
        }
    }
    if (isnumber(var_de4004608595aec8) && var_de4004608595aec8 != 0) {
        var_88c3d105609b2841 = abs(var_de4004608595aec8);
        min = -1 * var_88c3d105609b2841;
        max = var_88c3d105609b2841;
        rotation = randomfloatrange(min, max);
    }
    return [var_57338c9e11b3e93, rotation];
}

// Namespace snd / namespace_53c50dd747d66443
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x360d
// Size: 0x1cb
function private function_fe69ae3b76d26efa(target, dist, var_57338c9e11b3e93, var_90889775c87a2590, rotation) {
    self endon("death");
    self endon("sounddone");
    if (isdefined(rotation) == 0 || rotation == 0) {
        return;
    }
    assertex(isent(target) || isstruct(target) && isdefined(target.origin) || isvector(target), "");
    assertex(isnumber(dist), "");
    assertex(isnumber(var_57338c9e11b3e93), "");
    assertex(isnumber(rotation), "");
    /#
        if (function_ec24f13736bfc421() > 2) {
            var_3d2faad2c6500351 = randomfloat(1);
            var_c5cc167969b1a925 = randomfloat(1);
            var_262ec316cd3f0d72 = randomfloat(1);
            var_16b7a27a638991b1 = (var_3d2faad2c6500351, var_c5cc167969b1a925, var_262ec316cd3f0d72);
            var_16b7a27a638991b1 = vectornormalize(var_16b7a27a638991b1);
            function_15c2c9757e8c8e38(self, var_16b7a27a638991b1);
        }
    #/
    movetime = function_e448203aedcadcf8() * 2;
    var_1a2cb88f1608dd11 = rotation * movetime;
    while (true) {
        centerorigin = function_7670acb4b00bb0ac(target);
        if (!isvector(centerorigin)) {
            break;
        }
        position = function_3ad9433c6a61f479(centerorigin, dist, var_57338c9e11b3e93, var_90889775c87a2590);
        self moveto(position, movetime, 0, 0);
        var_57338c9e11b3e93 += var_1a2cb88f1608dd11;
        wait movetime;
        /#
            if (function_ec24f13736bfc421() <= 2) {
                self notify("<dev string:x1c>");
            }
        #/
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x37e0
// Size: 0x136
function private function_71b899d04c402bb5(emitter) {
    iss = isstruct(emitter);
    hast = isdefined(emitter.soundtype);
    ist = emitter.soundtype == "emitter";
    var_1781ca309b9a4f38 = iss && hast && ist;
    if (function_110d3ab280057f5b(var_1781ca309b9a4f38 == 0, "snd emitter stop not an emitter")) {
        return;
    }
    assertex(isdefined(emitter.soundkey), "snd_emitter with no soundkey");
    assertex(isdefined(level.snd.var_e8ec270a2ff548e0), "snd_emitter not initialized");
    assertex(isdefined(level.snd.emitters), "snd_emitters array not initialized");
    level.snd.emitters[emitter.soundkey] = undefined;
    emitter notify("snd_emitter_stop");
    emitter.soundtype = undefined;
    emitter.soundalias = undefined;
    emitter.var_c55912d11e27cbee = undefined;
    emitter.origin = undefined;
    emitter.angles = undefined;
    emitter = undefined;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x391e
// Size: 0x294
function private function_5a53ef7be394d4a8(soundalias, target, var_a3babc421280c85a, var_4e43f4679036cddb, var_de4004608595aec8, var_c1acbb1d24b6efc5) {
    self endon("snd_emitter_stop");
    level endon("snd_emitter_stop");
    assertex(isdefined(target) && isarray(target) == 0, "snd_emitter target must be entity or vector");
    if (isvector(target)) {
        target = self;
    }
    targetposition = undefined;
    position = undefined;
    dist = function_4f102469dc90a19a(default_to(var_4e43f4679036cddb, 0));
    var_ee2e91a46457edcd = function_2e4ee66733c986ee(var_de4004608595aec8);
    assert(isarray(var_ee2e91a46457edcd) && var_ee2e91a46457edcd.size != 0);
    var_57338c9e11b3e93 = var_ee2e91a46457edcd[0];
    rotation = var_ee2e91a46457edcd[1];
    var_90889775c87a2590 = function_4f102469dc90a19a(default_to(var_c1acbb1d24b6efc5, 0));
    if (isarray(var_a3babc421280c85a) && var_a3babc421280c85a.size >= 4) {
        assertex(var_a3babc421280c85a.size == 4, "snd_emitter spawnTimeRange array size must be exactly 2 or 4 in size.");
        var_e500e5a50841701e = [var_a3babc421280c85a[0], var_a3babc421280c85a[1]];
        spawntime = function_4f102469dc90a19a(var_e500e5a50841701e, 0.05);
        wait spawntime;
        targetposition = function_7670acb4b00bb0ac(target);
        position = function_3ad9433c6a61f479(targetposition, dist, var_57338c9e11b3e93, var_90889775c87a2590);
        var_f2c9577ddcf63a89 = snd_play(soundalias, position);
        if (isdefined(var_f2c9577ddcf63a89) && isdefined(dist) && dist > 0 && isdefined(rotation) && rotation != 0) {
            var_f2c9577ddcf63a89 thread function_fe69ae3b76d26efa(target, dist, var_57338c9e11b3e93, rotation);
            var_a3babc421280c85a = [var_a3babc421280c85a[2], var_a3babc421280c85a[3]];
        }
    }
    while (true) {
        spawntime = function_4f102469dc90a19a(var_a3babc421280c85a, 0.05);
        wait spawntime;
        if (!isdefined(target)) {
            break;
        }
        dist = function_4f102469dc90a19a(default_to(var_4e43f4679036cddb, 0));
        var_ee2e91a46457edcd = function_2e4ee66733c986ee(var_de4004608595aec8);
        assert(isarray(var_ee2e91a46457edcd) && var_ee2e91a46457edcd.size != 0);
        var_57338c9e11b3e93 = var_ee2e91a46457edcd[0];
        rotation = var_ee2e91a46457edcd[1];
        var_90889775c87a2590 = function_4f102469dc90a19a(default_to(var_c1acbb1d24b6efc5, 0));
        targetposition = function_7670acb4b00bb0ac(target);
        position = function_3ad9433c6a61f479(targetposition, dist, var_57338c9e11b3e93, var_90889775c87a2590);
        var_f2c9577ddcf63a89 = snd_play(soundalias, position);
        if (isdefined(var_f2c9577ddcf63a89) && isdefined(dist) && dist > 0 && isdefined(rotation) && rotation != 0) {
            var_f2c9577ddcf63a89 thread function_fe69ae3b76d26efa(target, dist, var_57338c9e11b3e93, var_90889775c87a2590, rotation);
        }
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3bba
// Size: 0x324
function function_15920617b1c19549(soundalias, target, spawntime, var_4e43f4679036cddb, rotation, var_90889775c87a2590) {
    emitters = [];
    targets = target;
    islooping = soundislooping(soundalias);
    var_62635ab23c82dd69 = isdefined(islooping);
    if (function_110d3ab280057f5b(!var_62635ab23c82dd69, "snd_emitter soundalias does not exist: " + soundalias)) {
        return undefined;
    }
    if (function_110d3ab280057f5b(islooping, "snd_emitter cannot emit looping alias: " + soundalias)) {
        return undefined;
    }
    if (!isdefined(level.snd.var_e8ec270a2ff548e0)) {
        level.snd.var_e8ec270a2ff548e0 = 2432;
        level.snd.emitters = [];
    }
    assertex(isdefined(level.snd.var_e8ec270a2ff548e0), "snd_emitter not initialized");
    assertex(soundexists(soundalias), "snd_emitter soundalias does not exist: " + soundalias);
    assertex(isdefined(target), "snd_emitter target is undefined");
    assertex(isdefined(spawntime), "snd_emitter spawnTime is undefined");
    if (isarray(targets) == 0) {
        targets = [target];
    }
    foreach (t in targets) {
        ise = isent(t);
        isv = isvector(t);
        if (ise || isv) {
            emitter = spawnstruct();
            emitter.soundtype = "emitter";
            emitter.soundalias = soundalias;
            emitter.spawntime = spawntime;
            emitter.var_4e43f4679036cddb = var_4e43f4679036cddb;
            emitter.rotation = rotation;
            emitter.var_90889775c87a2590 = var_90889775c87a2590;
            level.snd.var_e8ec270a2ff548e0 = int(level.snd.var_e8ec270a2ff548e0 + 1);
            emitter.soundkey = "" + level.snd.var_e8ec270a2ff548e0;
            level.snd.emitters[emitter.soundkey] = emitter;
            if (ise) {
                emitter.var_c55912d11e27cbee = t;
            }
            if (isv) {
                emitter.origin = t;
                emitter.angles = (0, 0, 0);
            }
            emitter thread function_5a53ef7be394d4a8(soundalias, t, spawntime, var_4e43f4679036cddb, rotation, var_90889775c87a2590);
            emitters[emitters.size] = emitter;
            continue;
        }
        function_110d3ab280057f5b(ise == 0 && isv == 0, "snd_emitter target '" + t + "' was not an entity or vector.");
    }
    function_110d3ab280057f5b(emitters.size == 0, "snd_emitter resulted in zero emitter targets");
    return function_3782ee9519fb76c3(emitters);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x3ee7
// Size: 0xcd
function private function_ee1f9b08b748b2bf(alias, tag, ends_on_death, var_b426f32755673ba6, radio_dialog) {
    if (is_dead_sentient()) {
        return;
    }
    target = [self, tag];
    snd = namespace_53c50dd747d66443::function_88c8b4d475d4cfd(level.snd.var_6bb7b2b49f3454a1, alias, target);
    /#
        if (isdefined(level.player_radio_emitter) && self == level.player_radio_emitter) {
            println("<dev string:x2e>" + alias);
        }
    #/
    if (isdefined(ends_on_death)) {
        assertex(ends_on_death, "ends_on_death must be true or undefined");
        namespace_53c50dd747d66443::function_a9bcfafb96e69580(snd, self);
    }
    namespace_53c50dd747d66443::function_62b51aa15506bcbc(snd);
    if (isdefined(var_b426f32755673ba6)) {
        self notify(var_b426f32755673ba6);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3fbc
// Size: 0x33
function private function_ee9c171db1ae676e(alias, var_b426f32755673ba6) {
    assertex(!isspawner(self), "Spawner tried to play a sound");
    function_ee1f9b08b748b2bf(alias, undefined, undefined, var_b426f32755673ba6);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x3ff7
// Size: 0x8b
function private function_4df9eee6e5769696(soundalias, notifystring, var_fe0cdb15e0d3c83f) {
    var_fe0cdb15e0d3c83f = default_to(var_fe0cdb15e0d3c83f, 0);
    if (is_dead_sentient()) {
        return;
    }
    target = [self, "j_head"];
    snd = function_88c8b4d475d4cfd(level.snd.var_6bb7b2b49f3454a1, soundalias, target);
    if (var_fe0cdb15e0d3c83f) {
        namespace_53c50dd747d66443::function_a9bcfafb96e69580(snd, self);
    }
    if (isdefined(notifystring)) {
        thread function_1cf95ea7031cf826(snd, notifystring);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x408a
// Size: 0x1f
function private function_1cf95ea7031cf826(snd, notifystring) {
    namespace_53c50dd747d66443::function_62b51aa15506bcbc(snd);
    self notify(notifystring);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x40b1
// Size: 0xfb
function private function_f1fa7d6753f06a41(notetrack) {
    prefix = getsubstr(notetrack, 0, 3);
    if (prefix == "ps_") {
        alias = getsubstr(notetrack, 3);
        params = strtok(alias, ",");
        if (params.size < 2) {
            thread function_ee1f9b08b748b2bf(alias, undefined, 1);
        } else {
            thread function_ee1f9b08b748b2bf(params[0], params[1], 1);
        }
        return 1;
    }
    if (prefix == "vo_") {
        alias = getsubstr(notetrack, 3);
        if (isdefined(self.anim_playsound_func)) {
            self thread [[ self.anim_playsound_func ]](alias, "j_head", 1);
        } else {
            thread function_ee1f9b08b748b2bf(alias, "j_head", 1, alias);
        }
        return 1;
    }
    if (isdefined(level.snd.fnnotetrackprefixhandler)) {
        return self [[ level.snd.fnnotetrackprefixhandler ]](notetrack);
    }
    return 0;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41b5
// Size: 0x2bd
function function_a0b9c82d6558a5b5(curve, size) {
    lut = [];
    step = 1 / (size - 1);
    for (i = 0; i < size; i++) {
        x = i * step;
        y = 0;
        switch (curve) {
        default:
            assert(0);
            break;
        case #"hash_28724bf44fcad5a":
        case #"hash_a07b7ad0ae57b120":
            lut[0] = 0;
            lut[1] = 1;
            return lut;
        case #"hash_d14c288a042b2358":
            y = 0.5 + cos(x * 180) * -0.5;
            break;
        case #"hash_e5b5c9bbaf55cda4":
            y = 1 - cos(x * 90);
            break;
        case #"hash_c61d0274ec76f271":
            y = sin(x * 90);
            break;
        case #"hash_6975a515a3376748":
            y = 3 * pow(x, 2) - 2 * pow(x, 3);
            break;
        case #"hash_2e3e9521be134e7f":
            y = 1 - sqrt(1 - x * x);
            break;
        case #"hash_9e33f1e4dcc4f04":
            y = sqrt(1 - (1 - x) * (1 - x));
            break;
        case #"hash_e004d61d10ac743f":
            lut[0] = 0;
            lut[1] = 0.0158489;
            lut[2] = 0.0251189;
            lut[3] = 0.0398107;
            lut[4] = 0.0630957;
            lut[5] = 0.1;
            lut[6] = 0.158489;
            lut[7] = 0.251189;
            lut[8] = 0.398107;
            lut[9] = 0.630957;
            lut[10] = 1;
            return lut;
        case #"hash_3906f2285eb98bad":
            lut[0] = 0;
            lut[1] = 1.97531e-05;
            lut[2] = 0.000316049;
            lut[3] = 0.0016;
            lut[4] = 0.00505679;
            lut[5] = 0.0123457;
            lut[6] = 0.0256;
            lut[7] = 0.0474272;
            lut[8] = 0.0809086;
            lut[9] = 0.1296;
            lut[10] = 0.197531;
            lut[11] = 0.289205;
            lut[12] = 0.4096;
            lut[13] = 0.564168;
            lut[14] = 0.758835;
            lut[15] = 1;
            return lut;
        }
        lut[lut.size] = y;
    }
    return lut;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x447b
// Size: 0x1c3
function function_301f98e25e20c1ab(size) {
    size = default_to(size, 11);
    assertex(isstruct(level.snd), "snd was not initialized.");
    level.snd.var_d9a7fd05360ff6c9 = [];
    level.snd.var_d9a7fd05360ff6c9["linear"] = function_a0b9c82d6558a5b5("linear", size);
    level.snd.var_d9a7fd05360ff6c9["sine"] = function_a0b9c82d6558a5b5("sine", size);
    level.snd.var_d9a7fd05360ff6c9["easein"] = function_a0b9c82d6558a5b5("easein", size);
    level.snd.var_d9a7fd05360ff6c9["easeout"] = function_a0b9c82d6558a5b5("easeout", size);
    level.snd.var_d9a7fd05360ff6c9["easeinout"] = function_a0b9c82d6558a5b5("easeinout", size);
    level.snd.var_d9a7fd05360ff6c9["circularin"] = function_a0b9c82d6558a5b5("circularin", size);
    level.snd.var_d9a7fd05360ff6c9["circularout"] = function_a0b9c82d6558a5b5("circularout", size);
    level.snd.var_d9a7fd05360ff6c9["exponential_40db"] = function_a0b9c82d6558a5b5("exponential_40db", size);
    level.snd.var_d9a7fd05360ff6c9["exponential_60db"] = function_a0b9c82d6558a5b5("exponential_60db", size);
    level.snd.var_d9a7fd05360ff6c9["default_vfcurve"] = function_a0b9c82d6558a5b5("default_vfcurve", size);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4646
// Size: 0x32
function private function_f3a9bb58d29c733a(alias) {
    if (!isdefined(alias)) {
        return "easeout";
    }
    switch (alias) {
    case #"hash_e72a3996c47e1ac9":
        return "easeout";
    }
    return alias;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4681
// Size: 0x3a
function function_f17e814008bf23a4(curve) {
    lut = level.snd.var_d9a7fd05360ff6c9[function_f3a9bb58d29c733a(curve)];
    if (isdefined(lut)) {
        return lut.size;
    }
    return 0;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46c4
// Size: 0x34
function function_115055e88972de05(curve) {
    lut = level.snd.var_d9a7fd05360ff6c9[curve];
    if (isdefined(lut)) {
        return true;
    }
    return false;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4701
// Size: 0x166
function function_e6ef280f5472a1d2(inval, curve) {
    curve = function_f3a9bb58d29c733a(curve);
    lut = level.snd.var_d9a7fd05360ff6c9[curve];
    assertex(isdefined(lut), "snd_curve_value: could not find lookup table " + curve);
    inval = clamp(inval, 0, 1);
    outval = 0;
    step = 1 / (lut.size - 1);
    if (inval == 0) {
        return 0;
    }
    if (inval == 1) {
        return 1;
    }
    for (i = 0; i < lut.size; i++) {
        stepx = i * step;
        stepn = (i + 1) * step;
        if (inval >= stepx && inval <= stepn) {
            var_90d06984580a3902 = inval - stepx;
            var_90d05384580a08a0 = stepn - stepx;
            diff = var_90d06984580a3902 / var_90d05384580a08a0;
            var_d1fc9d25e43749a8 = lut[i];
            valn = lut[i + 1];
            var_811b0d0e1fb7f707 = valn - var_d1fc9d25e43749a8;
            outval = var_d1fc9d25e43749a8 + var_811b0d0e1fb7f707 * diff;
            break;
        }
    }
    return outval;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4870
// Size: 0x20b
function private function_b8022e006c096aa7(name) {
    if (isdefined(self.snd.params) == 0) {
        return;
    }
    if (isdefined(name)) {
        if (isdefined(self.snd.params[name])) {
            if (isdefined(self.snd.params[name].var_e40ffb8a0a4cdc32)) {
                self [[ self.snd.params[name].var_e40ffb8a0a4cdc32 ]](self.snd.params[name].userdata);
            }
            self.snd.params[name] = undefined;
        }
    } else {
        foreach (p in self.snd.params) {
            if (isdefined(p.var_e40ffb8a0a4cdc32)) {
                self [[ p.var_e40ffb8a0a4cdc32 ]](p.userdata);
            }
            self.snd.params = undefined;
        }
    }
    if (isdefined(self.snd.params) == 0 || self.snd.params.size == 0) {
        level.snd.var_abb6af59fd674229 = array_remove(level.snd.var_abb6af59fd674229, self);
        level.snd.var_abb6af59fd674229 = array_removeundefined(level.snd.var_abb6af59fd674229);
        self.snd.params = undefined;
        self.snd.var_704048a9c299409a = undefined;
        self notify("param_stop");
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4a83
// Size: 0x21
function private function_6833106b5e960c6b() {
    self endon("param_stop");
    waittill_any_2("death", "disconnect");
    function_b8022e006c096aa7();
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4aac
// Size: 0x24b
function private function_da383238aee79a39() {
    if (isdefined(self.snd.var_704048a9c299409a)) {
        return;
    }
    self.snd.var_704048a9c299409a = getthread();
    thread function_6833106b5e960c6b();
    self endon("disconnect");
    self endon("param_stop");
    while (function_5b8457b9d8edb521(self) == 0 && isdefined(self.snd.params) && self.snd.params.size > 0) {
        now = gettime();
        foreach (p in self.snd.params) {
            p.isprocessing = 1;
            if (isdefined(p.var_b5c1225c75a89360)) {
                assertex(isent(self), "snd_param ent is not valid. was there a wait in an input callback?");
                p.inputvalue = self [[ p.var_b5c1225c75a89360 ]](p.userdata);
                assertex(gettime() == now, "snd_param input callback must return without waiting!");
            }
            if (isdefined(p.var_1892f15c80279110)) {
                if (p.userdata.size > 0) {
                    assertex(p.var_1892f15c80279110.size == p.userdata.size, "snd_param has invalid output / userdata state");
                }
                foreach (var_e76053c83c3fbac3 in p.var_1892f15c80279110) {
                    if (isent(self)) {
                        userdata = undefined;
                        if (p.userdata.size > 0) {
                            userdata = p.userdata[index];
                        }
                        self thread [[ var_e76053c83c3fbac3 ]](p.inputvalue, userdata);
                    }
                }
            }
            p.isprocessing = undefined;
        }
        waitframe();
    }
    if (function_5b8457b9d8edb521(self)) {
        function_b8022e006c096aa7();
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4cff
// Size: 0x13a
function private function_afa0d9063a40dfe(name) {
    if (isdefined(level.snd.var_abb6af59fd674229) == 0) {
        level.snd.var_abb6af59fd674229 = [];
    }
    assertex(isarray(level.snd.var_abb6af59fd674229), "snd_param not initialized on level");
    function_b3e5599c9f6a8895(self);
    if (isdefined(self.snd.params) == 0) {
        self.snd.params = [];
    }
    assertex(isarray(self.snd.params), "snd_param not initialized on entity");
    if (isdefined(self.snd.params[name]) == 0) {
        self.snd.params[name] = spawnstruct();
    }
    if (array_contains(level.snd.var_abb6af59fd674229, self) == 0) {
        level.snd.var_abb6af59fd674229[level.snd.var_abb6af59fd674229.size] = self;
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e41
// Size: 0x63
function function_1bec576d8688dbc1(name, var_b5c1225c75a89360) {
    function_afa0d9063a40dfe(name);
    self.snd.params[name].var_b5c1225c75a89360 = var_b5c1225c75a89360;
    self.snd.params[name].inputvalue = undefined;
    thread function_da383238aee79a39();
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4eac
// Size: 0x21a
function function_775073c6517ceb5e(name, var_e76053c83c3fbac3, userdata) {
    function_afa0d9063a40dfe(name);
    if (isdefined(self.snd.params[name].var_1892f15c80279110) == 0) {
        self.snd.params[name].var_1892f15c80279110 = [];
    }
    assertex(isdefined(self.snd.params[name]), "snd_param input '" + name + "' not initialized on entity");
    assertex(isdefined(self.snd.params[name].var_1892f15c80279110), "snd_param not initialized on entity");
    assertex(isarray(self.snd.params[name].var_1892f15c80279110), "snd_param not initialized on entity");
    var_91920809a5e8e2b9 = self.snd.params[name].var_1892f15c80279110.size;
    self.snd.params[name].var_1892f15c80279110[var_91920809a5e8e2b9] = var_e76053c83c3fbac3;
    if (isdefined(self.snd.params[name].userdata) == 0) {
        self.snd.params[name].userdata = [];
    }
    if (array_contains(self.snd.params[name].userdata, userdata) == 0) {
        var_f2eecdc2a1583a82 = self.snd.params[name].userdata.size;
        self.snd.params[name].userdata[var_f2eecdc2a1583a82] = userdata;
    } else {
        /#
            if (function_a3da201852146397()) {
                DevOp(0x94);
            }
        #/
    }
    thread function_da383238aee79a39();
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x50ce
// Size: 0xab
function private function_eef3b433a76adca0(name, startcallback, var_e40ffb8a0a4cdc32) {
    function_afa0d9063a40dfe(name);
    self.snd.params[name].startcallback = startcallback;
    self.snd.params[name].var_e40ffb8a0a4cdc32 = var_e40ffb8a0a4cdc32;
    if (isdefined(self.snd.params[name].startcallback)) {
        self [[ self.snd.params[name].startcallback ]]();
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5181
// Size: 0x13
function function_96d11f9981c0fe4b(name) {
    function_b8022e006c096aa7(name);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x519c
// Size: 0x50
function function_40ac4860117f2c0e(name, startcallback, var_b5c1225c75a89360, var_e76053c83c3fbac3, var_e40ffb8a0a4cdc32, userdata) {
    function_eef3b433a76adca0(name, startcallback, var_e40ffb8a0a4cdc32);
    function_1bec576d8688dbc1(name, var_b5c1225c75a89360);
    function_775073c6517ceb5e(name, var_e76053c83c3fbac3, userdata);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51f4
// Size: 0xb9
function function_feb1a4f9eda07b44(name) {
    if (isdefined(self.snd.params) && isdefined(self.snd.params[name]) && isdefined(self.snd.params[name].var_b5c1225c75a89360)) {
        p = self.snd.params[name];
        if (isdefined(p.inputvalue)) {
            return p.inputvalue;
        } else {
            return self [[ p.var_b5c1225c75a89360 ]](p.userdata);
        }
    }
    return undefined;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52b6
// Size: 0x5c
function function_db43aa8b88926353(name) {
    if (isdefined(self.snd.params) && isarray(self.snd.params) && isdefined(self.snd.params[name])) {
        return true;
    }
    return false;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x531b
// Size: 0xa5
function function_1fc874ce2bd0cc74(var_b5c1225c75a89360) {
    if (isdefined(self.snd.params) && isarray(self.snd.params)) {
        foreach (p in self.snd.params) {
            if (p.var_b5c1225c75a89360 == var_b5c1225c75a89360) {
                return true;
            }
        }
    }
    return false;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x53c9
// Size: 0xd5
function private function_95848ecd26935b4b(userdata) {
    assert(isdefined(self.origin));
    now = gettime();
    if (isdefined(self.origin_velocity_time) && self.origin_velocity_time == now) {
        assert(isdefined(self.origin_velocity));
        return self.origin_velocity;
    }
    if (isdefined(self.origin_last) == 0) {
        self.origin_last = self.origin;
    }
    delta = self.origin - self.origin_last;
    self.origin_velocity = delta;
    self.origin_velocity_time = now;
    self.origin_last = self.origin;
    return self.origin_velocity;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x54a7
// Size: 0x23f
function private function_f2d694165b0e0e17(userdata) {
    assert(isdefined(self.origin));
    assert(isdefined(self.snd));
    assert(isdefined(self.snd.var_b99a486feaa332df));
    velocity = function_95848ecd26935b4b();
    speed = length(velocity);
    self.snd.var_b99a486feaa332df = function_eb651502ea5a7ea8(speed, self.snd.var_b99a486feaa332df, 0.05);
    /#
        if (function_ec24f13736bfc421() >= 2) {
            var_42e352e263117637 = self.snd.var_b99a486feaa332df;
            if (var_42e352e263117637 < 0.001) {
                var_42e352e263117637 = 0;
            }
            var_750a2993c537e7b0 = function_692101820901e01a(var_42e352e263117637 * function_9f6e6c09d0cac253() * 0.0568182, 1) + "<dev string:x4d>" + function_692101820901e01a(var_42e352e263117637, 1) + "<dev string:x55>";
            debugcolor = level.snd.debug.var_e4769c746e55e346;
            var_556d54c953ffe160 = 0.9;
            var_de81b175de6cc8a8 = var_556d54c953ffe160 * var_556d54c953ffe160;
            var_120536851fd5eb6 = level.snd.debug.var_2374fbb1ac1a1179;
            colorscale = level.snd.debug.var_e91591dae0dbb685;
            debugcolor = function_1f9e5d44e92014a5(debugcolor, colorscale * 10);
            debugframes = 1;
            var_2503a9925b14bfa7 = (0, 0, 4 * var_120536851fd5eb6 * 16);
            function_5e035a2095a884bf(var_750a2993c537e7b0, self.origin + var_2503a9925b14bfa7, -1 * var_120536851fd5eb6, "<dev string:x5a>", debugcolor, var_556d54c953ffe160, (0, 0, 0), var_de81b175de6cc8a8, (1, 1, 1), var_de81b175de6cc8a8, debugframes);
        }
    #/
    return self.snd.var_b99a486feaa332df;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x56ef
// Size: 0x184
function private function_bfab56d23a4691f8(userdata) {
    assert(isdefined(self.angles));
    now = gettime();
    if (isdefined(self.var_c54e394ce4c29130) && self.var_c54e394ce4c29130 == now) {
        assert(isdefined(self.snd.angles));
        return self.snd.angles;
    }
    angles = self.angles;
    if (function_d221a0d675bf19d9(self)) {
        angles = function_d8b4c23126bf4d7b();
    } else if (isdefined(self.model)) {
        hastag = 0;
        if (hastag == 0) {
            angles = self gettagangles("tag_origin");
        }
    }
    angles = function_c4cc5b1e29ed927(angles);
    if (isdefined(self.snd.angles) == 0) {
        self.snd.angles = angles;
    }
    if (isdefined(self.snd.var_3eeb21c724f0672a) == 0) {
        self.snd.var_3eeb21c724f0672a = angles;
    }
    self.snd.var_3eeb21c724f0672a = self.snd.angles;
    self.snd.angles = angles;
    return self.snd.angles;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x587c
// Size: 0x59
function private function_ab6b2e892ee33fe3(userdata) {
    angles = function_bfab56d23a4691f8(userdata);
    self.snd.var_7ad7ef45634b4c0e = angles - self.snd.var_3eeb21c724f0672a;
    return self.snd.var_7ad7ef45634b4c0e;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x58de
// Size: 0x73
function private function_9af2a1ae11395b08(var_52901f31330a6489, var_d8dba5e985305199, var_5c2b139a8e01d14b) {
    var_52901f31330a6489.snd = snd_play(var_52901f31330a6489.soundalias, var_52901f31330a6489.target);
    function_e70d88e85d5fb19a(var_52901f31330a6489.snd, var_d8dba5e985305199, 0);
    function_a2c9c85b2af7c7fe(var_52901f31330a6489.snd, var_5c2b139a8e01d14b, 0);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x5959
// Size: 0x94
function private function_d1642191e07fc7f0(var_52901f31330a6489, fadetime, var_c8de3d87b32f7596) {
    if (isdefined(var_52901f31330a6489) && isdefined(var_52901f31330a6489.snd)) {
        fadetime = default_to(fadetime, 0);
        var_c8de3d87b32f7596 = default_to(var_c8de3d87b32f7596, "easeinout");
        if (isdefined(fadetime) && fadetime > 0) {
            function_e70d88e85d5fb19a(var_52901f31330a6489.snd, 0, fadetime, var_c8de3d87b32f7596);
            wait fadetime;
        }
        function_9185173ee7017a51(var_52901f31330a6489.snd);
        var_52901f31330a6489.snd = undefined;
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x59f5
// Size: 0x2e3
function private function_653bedee3bcc58bd(inputvalue, userdata) {
    speed = inputvalue;
    v = userdata;
    if (speed < 0.01) {
        speed = 0;
    }
    var_640a3fbfe37f7312 = v.var_270c723c3b5f910b["speed"][0];
    var_63e749bfe3594158 = v.var_270c723c3b5f910b["speed"][1];
    var_7f89dca4fd0c82e5 = v.var_270c723c3b5f910b["scale"][0];
    var_7fade6a4fd35139b = v.var_270c723c3b5f910b["scale"][1];
    var_46888f3bd141799a = v.var_270c723c3b5f910b["curve"][0];
    var_57dd5bc37ee77d94 = v.var_bb71b5efdeeee611["speed"][0];
    var_580149c37f0fd0b6 = v.var_bb71b5efdeeee611["speed"][1];
    var_df0dce5971287c53 = v.var_bb71b5efdeeee611["scale"][0];
    var_df30e459714ef46d = v.var_bb71b5efdeeee611["scale"][1];
    var_e40094849aabcb2c = v.var_bb71b5efdeeee611["curve"][0];
    volume = function_4297a4ed38531b7f(speed, var_640a3fbfe37f7312, var_63e749bfe3594158, var_7f89dca4fd0c82e5, var_7fade6a4fd35139b);
    pitch = function_4297a4ed38531b7f(speed, var_57dd5bc37ee77d94, var_580149c37f0fd0b6, var_df0dce5971287c53, var_df30e459714ef46d);
    if (isdefined(self.snd.doppler) && isdefined(self.snd.doppler.value)) {
        pitch *= self.snd.doppler.value;
    }
    if (isdefined(v.snd) && volume <= 0.001) {
        thread function_d1642191e07fc7f0(v);
        return;
    } else if (isdefined(v.snd) == 0 && volume > 0.001) {
        function_9af2a1ae11395b08(v, volume, pitch);
        v.var_cfec60ca756d76ed = speed;
        return;
    }
    if (isdefined(v.snd) && isdefined(v.var_cfec60ca756d76ed)) {
        var_8dff9f9edde9a29d = abs(speed - v.var_cfec60ca756d76ed);
        if (var_8dff9f9edde9a29d > 0.01) {
            function_e70d88e85d5fb19a(v.snd, volume, 0.05, var_46888f3bd141799a);
            function_a2c9c85b2af7c7fe(v.snd, pitch, 0.05, var_e40094849aabcb2c);
            v.var_cfec60ca756d76ed = speed;
        }
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5ce0
// Size: 0xe4
function private function_28a90b1ade70dc5c(userdata) {
    fadeout = self.snd.var_ad373b5c81f9c52d;
    fadeoutcurve = self.snd.var_82f743323a519d6c;
    if (isdefined(userdata)) {
        foreach (v in userdata) {
            thread function_d1642191e07fc7f0(v, fadeout, fadeoutcurve);
        }
    }
    self.snd.var_bdb184b54e906021 = undefined;
    self.snd.var_ad373b5c81f9c52d = undefined;
    self.snd.var_82f743323a519d6c = undefined;
    self.snd.speeds = undefined;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x5dcc
// Size: 0x23e
function private function_d80f1d438bdc691f(target, soundalias, var_bb71b5efdeeee611, var_270c723c3b5f910b) {
    ent = undefined;
    islooping = soundislooping(soundalias);
    if (!isarray(target)) {
        ent = target;
    } else if (target.size > 0) {
        ent = target[0];
    }
    if (function_110d3ab280057f5b(!isent(ent), "snd_speed: target entity not found!")) {
        return;
    }
    if (function_110d3ab280057f5b(!isdefined(islooping), "snd_speed: alias '" + soundalias + "' does not exist!")) {
        return;
    }
    if (function_110d3ab280057f5b(!istrue(islooping), "snd_speed: alias '" + soundalias + "' is not looping!")) {
        return;
    }
    if (function_110d3ab280057f5b(!isarray(var_bb71b5efdeeee611), "snd_speed: pitchDict is not an array!")) {
        return;
    }
    if (function_110d3ab280057f5b(!isarray(var_270c723c3b5f910b), "snd_speed: volumeDict is not an array!")) {
        return;
    }
    function_b3e5599c9f6a8895(ent);
    assertex(isstruct(ent.snd), "_snd_speed_main ent with no snd init");
    var_52901f31330a6489 = spawnstruct();
    var_52901f31330a6489.soundalias = soundalias;
    var_52901f31330a6489.target = target;
    var_52901f31330a6489.var_bb71b5efdeeee611 = var_bb71b5efdeeee611;
    var_52901f31330a6489.var_270c723c3b5f910b = var_270c723c3b5f910b;
    var_52901f31330a6489.var_bb71b5efdeeee611["curve"] = default_to(var_52901f31330a6489.var_bb71b5efdeeee611["curve"], ["linear"]);
    var_52901f31330a6489.var_270c723c3b5f910b["curve"] = default_to(var_52901f31330a6489.var_270c723c3b5f910b["curve"], ["xfade"]);
    ent.snd.speeds = default_to(ent.snd.speeds, []);
    ent.snd.speeds[ent.snd.speeds.size] = var_52901f31330a6489;
    ent.snd.var_b99a486feaa332df = 0;
    ent function_40ac4860117f2c0e("speed", undefined, &function_f2d694165b0e0e17, &function_653bedee3bcc58bd, &function_28a90b1ade70dc5c, var_52901f31330a6489);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6012
// Size: 0xc7
function function_fd77ba9b1a318099(target, fadeout, fadeoutcurve) {
    fadeout = default_to(fadeout, 0.05);
    fadeoutcurve = default_to(fadeoutcurve, "easeinout");
    ent = undefined;
    if (!isarray(target)) {
        ent = target;
    } else if (target.size > 0) {
        ent = target[0];
    }
    if (function_110d3ab280057f5b(!isent(ent), "snd_speed: target entity not found!")) {
        return;
    }
    ent.snd.var_bdb184b54e906021 = 1;
    ent.snd.var_ad373b5c81f9c52d = fadeout;
    ent.snd.var_82f743323a519d6c = fadeoutcurve;
    ent function_96d11f9981c0fe4b("speed");
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x60e1
// Size: 0x30
function function_70fc1cabb1a0936c(target, alias, var_bb71b5efdeeee611, var_270c723c3b5f910b) {
    level thread function_d80f1d438bdc691f(target, alias, var_bb71b5efdeeee611, var_270c723c3b5f910b);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x6119
// Size: 0x1e7
function function_ad44dad83d5fa19e(var_218e34a1d650f0c0, var_4169a0a62719db05, var_d4ae98a76ada6df4, var_723c5bf3e20d02b7, var_9d165087bc5f007a, var_1a3ea74c57cf7019, var_83c847736bed906) {
    assert(isvector(var_218e34a1d650f0c0));
    assert(isvector(var_4169a0a62719db05));
    assert(isvector(var_723c5bf3e20d02b7));
    assert(isvector(var_9d165087bc5f007a));
    var_d4ae98a76ada6df4 = default_to(var_d4ae98a76ada6df4, 1);
    var_1a3ea74c57cf7019 = default_to(var_1a3ea74c57cf7019, 1);
    var_83c847736bed906 = default_to(var_83c847736bed906, 343.3);
    if (var_d4ae98a76ada6df4 == 0 && var_1a3ea74c57cf7019 == 0 || var_83c847736bed906 == 0) {
        return [0, 0, 0];
    }
    var_d1b36d182e789860 = 39.3701 * var_83c847736bed906;
    assert(isnumber(var_d4ae98a76ada6df4));
    assert(isnumber(var_1a3ea74c57cf7019));
    assert(isnumber(var_d1b36d182e789860));
    var_895973f66ba77998 = var_218e34a1d650f0c0 - var_723c5bf3e20d02b7;
    len = length(var_895973f66ba77998);
    var_82fbb6e7bc0e9a16 = 0;
    var_d3203d6399241453 = 0;
    if (var_d4ae98a76ada6df4 > 0 && var_4169a0a62719db05 != (0, 0, 0)) {
        var_82fbb6e7bc0e9a16 = vectordot(var_4169a0a62719db05, var_895973f66ba77998) / len;
        var_82fbb6e7bc0e9a16 *= var_d4ae98a76ada6df4;
    }
    if (var_1a3ea74c57cf7019 > 0 && var_9d165087bc5f007a != (0, 0, 0)) {
        var_d3203d6399241453 = vectordot(var_9d165087bc5f007a, var_895973f66ba77998) / len;
        var_d3203d6399241453 *= var_1a3ea74c57cf7019;
    }
    dopplerscale = (var_d1b36d182e789860 - var_82fbb6e7bc0e9a16) / (var_d1b36d182e789860 - var_d3203d6399241453);
    return [dopplerscale, var_82fbb6e7bc0e9a16, var_d3203d6399241453];
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6309
// Size: 0x2
function private function_73239e48c1f6929b() {
    
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6313
// Size: 0x112
function private function_c69efdf57402f1c3(userdata) {
    var_52017d9bfee9e3a4 = arraycopy(level.snd.var_abb6af59fd674229);
    var_9a197a3837525172 = 0;
    var_dfc140baf957db23 = [];
    var_52017d9bfee9e3a4 = array_remove(var_52017d9bfee9e3a4, self);
    foreach (var_8d9574b86ef251bf in var_52017d9bfee9e3a4) {
        if (var_8d9574b86ef251bf function_db43aa8b88926353("doppler")) {
            var_9a197a3837525172 += 1;
            if (function_d221a0d675bf19d9(var_8d9574b86ef251bf)) {
                var_dfc140baf957db23[var_dfc140baf957db23.size] = var_8d9574b86ef251bf;
            }
        }
    }
    if (var_9a197a3837525172 == var_dfc140baf957db23.size) {
        foreach (player in var_dfc140baf957db23) {
            player function_96d11f9981c0fe4b("doppler");
        }
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x642d
// Size: 0x46b
function private function_3e1c8ad0ace0b40a(inputvalue, userdata) {
    player = userdata;
    if (!function_d221a0d675bf19d9(player)) {
        return;
    }
    assert(isdefined(player));
    assert(isdefined(self));
    assert(isdefined(self.snd));
    assert(isdefined(self.snd.doppler));
    assert(isdefined(self.snd.doppler.scale));
    assert(isdefined(self.snd.doppler.var_bf6e88ccc7f378f6));
    var_218e34a1d650f0c0 = self.origin;
    var_4169a0a62719db05 = inputvalue;
    var_d4ae98a76ada6df4 = self.snd.doppler.scale;
    var_723c5bf3e20d02b7 = player function_97f58d285dd23025();
    var_9d165087bc5f007a = player function_feb1a4f9eda07b44("doppler");
    var_1a3ea74c57cf7019 = self.snd.doppler.var_bf6e88ccc7f378f6;
    if (isdefined(var_9d165087bc5f007a) == 0 || self.snd.doppler.var_bf6e88ccc7f378f6 == 0) {
        var_9d165087bc5f007a = (0, 0, 0);
    }
    assert(isvector(var_218e34a1d650f0c0));
    assert(isvector(var_4169a0a62719db05));
    assert(isnumber(var_d4ae98a76ada6df4));
    assert(isvector(var_723c5bf3e20d02b7));
    assert(isvector(var_9d165087bc5f007a));
    assert(isnumber(var_1a3ea74c57cf7019));
    var_b6e775fcff80d699 = function_ad44dad83d5fa19e(var_218e34a1d650f0c0, var_4169a0a62719db05, var_d4ae98a76ada6df4, var_723c5bf3e20d02b7, var_9d165087bc5f007a, var_1a3ea74c57cf7019);
    dopplerscale = var_b6e775fcff80d699[0];
    if (isdefined(self.snd.doppler.pitchscale)) {
        dopplerscale *= self.snd.doppler.pitchscale;
    }
    dopplerscale = clamp(dopplerscale, 0.01, 2);
    self.snd.doppler.value = dopplerscale;
    if (function_f0a31c88dbf01c1(self)) {
        function_a2c9c85b2af7c7fe(self, dopplerscale, function_e448203aedcadcf8());
    }
    /#
        if (function_ec24f13736bfc421() > 1) {
            var_120536851fd5eb6 = level.snd.debug.var_2374fbb1ac1a1179;
            var_c5c80003d40904a8 = level.snd.debug.var_e4769c746e55e346;
            colorscale = level.snd.debug.var_e91591dae0dbb685;
            var_19ad00a4b81e54ec = function_1f9e5d44e92014a5(var_c5c80003d40904a8, colorscale * 10);
            var_313ae10332ea71c8 = var_b6e775fcff80d699[1];
            dist = distance(var_218e34a1d650f0c0, var_723c5bf3e20d02b7);
            var_abeed90f073feea9 = dist * 0.002;
            scale = var_120536851fd5eb6 * 0.666 * var_abeed90f073feea9;
            alpha = 1;
            var_3fb9d6859e6d3a47 = alpha * alpha;
            var_aca821760f2f4441 = "<dev string:x61>";
            var_512eadbfa4e5120 = dopplerscale + "<dev string:x6b>" + var_313ae10332ea71c8;
            function_5e035a2095a884bf(var_aca821760f2f4441, var_218e34a1d650f0c0 + (0, 0, -1 * scale * 16), scale, "<dev string:x6f>", var_19ad00a4b81e54ec, alpha, (0, 0, 0), var_3fb9d6859e6d3a47, (1, 1, 1), var_3fb9d6859e6d3a47, 1);
            function_5e035a2095a884bf(var_512eadbfa4e5120, var_218e34a1d650f0c0 + (0, 0, -1 * scale * 16), scale, "<dev string:x75>", var_19ad00a4b81e54ec, alpha, (0, 0, 0), var_3fb9d6859e6d3a47, (1, 1, 1), var_3fb9d6859e6d3a47, 1);
        }
    #/
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x68a0
// Size: 0x12b
function private _snd_doppler_main(player, dopplerscale, pitchscale, var_aa54cc5521fdb017) {
    assert(function_d221a0d675bf19d9(player));
    dopplerscale = default_to(dopplerscale, 1);
    pitchscale = default_to(pitchscale, 1);
    var_aa54cc5521fdb017 = default_to(var_aa54cc5521fdb017, 1);
    assert(isdefined(player));
    if (var_aa54cc5521fdb017 > 0) {
        player function_40ac4860117f2c0e("doppler", undefined, &function_95848ecd26935b4b);
    }
    if (function_5b8457b9d8edb521(self)) {
        return;
    }
    function_b3e5599c9f6a8895(self);
    self.snd.doppler = spawnstruct();
    self.snd.doppler.scale = dopplerscale;
    self.snd.doppler.pitchscale = pitchscale;
    self.snd.doppler.var_bf6e88ccc7f378f6 = var_aa54cc5521fdb017;
    function_40ac4860117f2c0e("doppler", undefined, &function_95848ecd26935b4b, &function_3e1c8ad0ace0b40a, &function_c69efdf57402f1c3, player);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x69d3
// Size: 0x95
function snd_doppler(var_972270fb4a04f3bf, player, dopplerscale, pitchscale, var_aa54cc5521fdb017) {
    if (function_110d3ab280057f5b(isdefined(var_972270fb4a04f3bf) == 0, "snd_doppler with undefined soundObject")) {
        return;
    }
    foreach (var_4caf7493cc02619d in function_5762e7cb509e83c0(var_972270fb4a04f3bf)) {
        var_4caf7493cc02619d thread _snd_doppler_main(player, dopplerscale, pitchscale, var_aa54cc5521fdb017);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a70
// Size: 0x6d
function snd_doppler_stop(var_972270fb4a04f3bf) {
    if (function_110d3ab280057f5b(isdefined(var_972270fb4a04f3bf) == 0, "snd_doppler_stop with undefined soundObject")) {
        return;
    }
    foreach (var_4caf7493cc02619d in function_5762e7cb509e83c0(var_972270fb4a04f3bf)) {
        var_4caf7493cc02619d function_c69efdf57402f1c3();
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6ae5
// Size: 0xec
function private function_80aa5254a4d828d6(callback, var_2339bd3df9d7bc35) {
    level notify("snd_stop_start");
    level endon("snd_stop_start");
    var_2339bd3df9d7bc35 = default_to(var_2339bd3df9d7bc35, 1);
    assertex(isstruct(level.snd), "snd was not initialized.");
    assert(function_ddfae8737d397b02(callback));
    assert(isdefined(var_2339bd3df9d7bc35));
    flag_wait("start_is_set");
    start_points = [];
    start_point = function_80ab0bb7534149c0();
    while (true) {
        level waittill("start_logic", start_point);
        level.snd.start_point = start_point;
        waittillframeend();
        if (!isstring(start_point) || start_point == "") {
            continue;
        }
        if (var_2339bd3df9d7bc35 || !var_2339bd3df9d7bc35 && !isdefined(start_points[start_point])) {
            level thread [[ callback ]](start_point);
            start_points[start_point] = 1;
        }
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6bd9
// Size: 0x1e
function function_c10ad7950de75f96(callback, var_2339bd3df9d7bc35) {
    level thread function_80aa5254a4d828d6(callback, var_2339bd3df9d7bc35);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6bff
// Size: 0x99
function private function_bafbd550ab234c4f(trigger, player) {
    if (!function_d221a0d675bf19d9(player)) {
        return;
    }
    is_touching = 0;
    if (isent(trigger)) {
        is_touching = player istouching(trigger);
    } else if (trigger == level) {
        if (!isdefined(player.snd.trigger) || isdefined(player.snd.trigger) && player.snd.trigger == level) {
            is_touching = 1;
        }
    }
    return is_touching;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6ca1
// Size: 0x5a
function private function_63e183cd49335a12() {
    waitforplayers();
    waitframe();
    waittillframeend();
    foreach (player in function_db2dac8138d9a79e()) {
        level notify("trigger", player);
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6d03
// Size: 0x415
function private function_ce7cbb5aae13431e(callback) {
    level endon("game_ended");
    self endon("death");
    var_c99614f77dcbfb9a = [level];
    trigger = self;
    assert(isdefined(trigger));
    while (true) {
        player = undefined;
        trigger waittill("trigger", player);
        is_touching = function_bafbd550ab234c4f(trigger, player);
        function_b3e5599c9f6a8895(player);
        assertex(isstruct(player.snd), "_snd_trigger_main player with no snd init");
        if (is_touching) {
            player.snd.triggers = default_to(player.snd.triggers, var_c99614f77dcbfb9a);
            assert(isarray(player.snd.triggers) && isdefined(player.snd.triggers[0]) && player.snd.triggers[0] == level);
            if (trigger != level) {
                player.snd.triggers[player.snd.triggers.size] = trigger;
            }
            var_9281e790cb901e4f = isdefined(player.snd.trigger.script_ambientpriority) && isdefined(trigger.script_ambientpriority);
            var_cb7cb2b095f4a00 = var_9281e790cb901e4f && int(player.snd.trigger.script_ambientpriority) <= int(trigger.script_ambientpriority);
            if (!isdefined(player.snd.trigger) || var_9281e790cb901e4f && var_cb7cb2b095f4a00 || !var_9281e790cb901e4f) {
                player.snd.trigger = trigger;
                trigger thread [[ callback ]](player, trigger, 1);
            }
            while (is_touching) {
                is_touching = function_bafbd550ab234c4f(trigger, player);
                waitframe();
            }
            if (!isdefined(player)) {
                continue;
            }
            if (trigger != level) {
                player.snd.triggers = array_remove(player.snd.triggers, trigger);
            }
            if (player.snd.trigger == trigger) {
                var_dce63f20663b7dbf = undefined;
                if (var_9281e790cb901e4f) {
                    var_dce63f20663b7dbf = level;
                    var_9ff9530a034ae58 = -1;
                    for (i = player.snd.triggers.size - 1; i > 0; i--) {
                        var_8df8a9ed72c2bdaa = player.snd.triggers[i];
                        if (isdefined(var_8df8a9ed72c2bdaa.script_ambientpriority)) {
                            var_8d0c6ccd9012df37 = int(var_8df8a9ed72c2bdaa.script_ambientpriority);
                            if (var_8d0c6ccd9012df37 > var_9ff9530a034ae58) {
                                var_dce63f20663b7dbf = var_8df8a9ed72c2bdaa;
                                var_9ff9530a034ae58 = var_8d0c6ccd9012df37;
                            }
                        }
                    }
                } else {
                    assert(player.snd.triggers.size > 0);
                    index = player.snd.triggers.size - 1;
                    assert(index >= 0);
                    var_dce63f20663b7dbf = player.snd.triggers[index];
                }
                if (isdefined(var_dce63f20663b7dbf)) {
                    player.snd.trigger = var_dce63f20663b7dbf;
                    var_dce63f20663b7dbf thread [[ callback ]](player, var_dce63f20663b7dbf, 0);
                    continue;
                }
                player.snd.trigger = undefined;
                level notify("trigger", player);
            }
        }
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7120
// Size: 0x109
function function_37a9b1e456beb42a(callback, name, key) {
    name = default_to(name, "ambient_package");
    key = default_to(key, "targetname");
    triggers = [level];
    var_97087726674fbf39 = undefined;
    if (istrue(level.snd.var_78f5f86726c0fdb5)) {
        var_97087726674fbf39 = getentarray(name, key);
    } else if (istrue(level.snd.var_ab52ccadc04df539)) {
        var_97087726674fbf39 = getentarray(0, name, key);
    }
    if (isarray(var_97087726674fbf39)) {
        triggers = array_combine(triggers, var_97087726674fbf39);
    }
    foreach (trigger in function_5762e7cb509e83c0(triggers)) {
        trigger thread function_ce7cbb5aae13431e(callback);
    }
    level thread function_63e183cd49335a12();
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7231
// Size: 0x117
function function_54c3fa447687f86(name, elements) {
    assert(function_f0b5522ee5ce0cb1());
    var_28b2ea06db7db7d3 = isstring(name);
    var_c59b3d0a5b387b2d = isarray(elements) && elements.size > 0 && isarray(elements[0]);
    var_f468c22613f33b97 = isarray(elements) && elements.size >= 3 && isstring(elements[0]);
    var_ce692c7a46788fa6 = isstring(elements);
    var_3561ce9cbee3e19f = var_28b2ea06db7db7d3 && (var_c59b3d0a5b387b2d || var_f468c22613f33b97 || var_ce692c7a46788fa6);
    if (function_110d3ab280057f5b(!var_3561ce9cbee3e19f, "snd: element_init invalid")) {
        /#
            if (function_6fa24a43c981460a()) {
                DevOp(0x94);
            }
        #/
    }
    if (var_ce692c7a46788fa6 && !isdefined(level.snd.elements[elements])) {
        /#
            if (function_6fa24a43c981460a()) {
                DevOp(0x94);
            }
        #/
    }
    if (var_f468c22613f33b97) {
        elements = [elements];
    }
    level.snd.elements[name] = elements;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7350
// Size: 0xbc
function private function_a694f301951b340(element) {
    assertex(isstruct(level.snd), "snd was not initialized.");
    if (isarray(level.snd.elements) && isstring(element)) {
        var_997a4ca42f79efd8 = level.snd.elements[element];
        var_563f0fdd4afa1de5 = isarray(var_997a4ca42f79efd8);
        var_85434fa931ce44d1 = isstring(var_997a4ca42f79efd8);
        if (var_563f0fdd4afa1de5) {
            return element;
        } else if (var_85434fa931ce44d1 && isarray(level.snd.elements[var_997a4ca42f79efd8])) {
            return var_997a4ca42f79efd8;
        }
    }
    return undefined;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7415
// Size: 0x9b
function private function_1038bc878bfe6a5a(element) {
    assertex(isstruct(level.snd), "snd was not initialized.");
    if (isarray(element)) {
        return element;
    } else if (isarray(level.snd.elements) && isstring(element)) {
        element = function_a694f301951b340(element);
        var_997a4ca42f79efd8 = level.snd.elements[element];
        var_a9cc843c3422bd78 = isarray(var_997a4ca42f79efd8);
        if (var_a9cc843c3422bd78) {
            return var_997a4ca42f79efd8;
        }
    }
    return undefined;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74b9
// Size: 0x32e
function function_54b7b0779da7f0c0(player, element) {
    isplayervalid = function_d221a0d675bf19d9(player);
    if (function_110d3ab280057f5b(!isplayervalid, "snd: set_element invalid player")) {
        return;
    }
    function_b3e5599c9f6a8895(player);
    var_a9cc843c3422bd78 = isarray(element);
    var_ce692c7a46788fa6 = isstring(element);
    var_2a5c31386af49af6 = !isdefined(element);
    var_3561ce9cbee3e19f = var_a9cc843c3422bd78 || var_ce692c7a46788fa6 || var_2a5c31386af49af6;
    if (function_110d3ab280057f5b(!var_3561ce9cbee3e19f, "snd: set_element invalid element")) {
        return;
    }
    if (var_a9cc843c3422bd78) {
        player.snd.element = "**** custom ****";
    } else if (var_ce692c7a46788fa6) {
        current = function_a694f301951b340(player.snd.element);
        var_c0dd80da86c0245f = function_a694f301951b340(element);
        isequal = isstring(current) && isstring(var_c0dd80da86c0245f) && current == var_c0dd80da86c0245f;
        player.snd.element = element;
        if (isequal) {
            return;
        }
    }
    if (isplayervalid && isarray(player.snd.emitters)) {
        function_9185173ee7017a51(player.snd.emitters);
        player.snd.emitters = undefined;
    }
    if (var_2a5c31386af49af6) {
        player.snd.element = undefined;
        return;
    }
    elements = function_1038bc878bfe6a5a(element);
    var_c59b3d0a5b387b2d = isarray(elements);
    if (function_110d3ab280057f5b(!var_c59b3d0a5b387b2d, "snd: set_element '" + player.snd.element + "' undefined")) {
        /#
            if (function_6fa24a43c981460a()) {
                DevOp(0x94);
            }
        #/
        return;
    }
    assert(isplayervalid);
    assert(var_c59b3d0a5b387b2d);
    player.snd.emitters = [];
    foreach (e in elements) {
        alias = e[0];
        target = default_to(e[1], player);
        spawntime = e[2];
        var_4e43f4679036cddb = e[3];
        rotation = e[4];
        var_90889775c87a2590 = e[5];
        var_c329cd03ca26a1f5 = function_15920617b1c19549(alias, target, spawntime, var_4e43f4679036cddb, rotation, var_90889775c87a2590);
        if (isdefined(var_c329cd03ca26a1f5)) {
            player.snd.emitters[player.snd.emitters.size] = var_c329cd03ca26a1f5;
        }
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x77ef
// Size: 0x206
function private function_b73221aba7ab22bc(var_972270fb4a04f3bf, player, var_c13ff1030606c1d6, var_5e08ee058aba29d3) {
    assert(function_f0a31c88dbf01c1(var_972270fb4a04f3bf));
    assert(function_d221a0d675bf19d9(player));
    assert(isvector(var_c13ff1030606c1d6));
    assert(isvector(var_5e08ee058aba29d3));
    var_972270fb4a04f3bf endon("death");
    var_972270fb4a04f3bf notify("snd_line_detach");
    var_972270fb4a04f3bf endon("snd_line_detach");
    while (function_d221a0d675bf19d9(player) && function_f0a31c88dbf01c1(var_972270fb4a04f3bf)) {
        var_50330d936466457f = player function_97f58d285dd23025();
        org = pointonsegmentnearesttopoint(var_c13ff1030606c1d6, var_5e08ee058aba29d3, var_50330d936466457f);
        var_972270fb4a04f3bf.origin = org;
        /#
            if (function_ec24f13736bfc421() > 1) {
                var_b9fbe576b97885d5 = 24;
                var_c463d2fbca684d3f = 0;
                var_b222ae878464448b = (0.97254, 0.72974, 0.72974);
                var_e594ba746f90bed7 = (0.72974, 0.97254, 0.72974);
                var_e598bc746f94b914 = (0.72974, 0.72974, 0.97254);
                line(var_c13ff1030606c1d6, var_5e08ee058aba29d3, var_b222ae878464448b, 1, var_c463d2fbca684d3f, 1);
                var_7a731aa3220b34bc = vectortoangles(var_5e08ee058aba29d3 - var_c13ff1030606c1d6);
                var_91e2210d8709a5a = anglestoright(var_7a731aa3220b34bc);
                line_up = anglestoup(var_7a731aa3220b34bc);
                line(var_c13ff1030606c1d6 - var_91e2210d8709a5a * var_b9fbe576b97885d5, var_c13ff1030606c1d6 + var_91e2210d8709a5a * var_b9fbe576b97885d5, var_e594ba746f90bed7, 1, var_c463d2fbca684d3f, 1);
                line(var_c13ff1030606c1d6 - line_up * var_b9fbe576b97885d5, var_c13ff1030606c1d6 + line_up * var_b9fbe576b97885d5, var_e598bc746f94b914, 1, var_c463d2fbca684d3f, 1);
                line(var_5e08ee058aba29d3 - var_91e2210d8709a5a * var_b9fbe576b97885d5, var_5e08ee058aba29d3 + var_91e2210d8709a5a * var_b9fbe576b97885d5, var_e594ba746f90bed7, 1, var_c463d2fbca684d3f, 1);
                line(var_5e08ee058aba29d3 - line_up * var_b9fbe576b97885d5, var_5e08ee058aba29d3 + line_up * var_b9fbe576b97885d5, var_e598bc746f94b914, 1, var_c463d2fbca684d3f, 1);
            }
        #/
        waitframe();
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x79fd
// Size: 0x8a
function function_f4103b35bbe765f1(var_972270fb4a04f3bf, player, var_c13ff1030606c1d6, var_5e08ee058aba29d3) {
    if (function_110d3ab280057f5b(!function_f0a31c88dbf01c1(var_972270fb4a04f3bf), "snd_line_attach with invalid soundObject")) {
        return;
    }
    if (function_110d3ab280057f5b(!function_d221a0d675bf19d9(player), "snd_line_attach with invalid player")) {
        return;
    }
    if (function_110d3ab280057f5b(!isvector(var_c13ff1030606c1d6), "snd_line_attach with invalid start position")) {
        return;
    }
    if (function_110d3ab280057f5b(!isvector(var_5e08ee058aba29d3), "snd_line_attach with invalid end position")) {
        return;
    }
    var_972270fb4a04f3bf thread function_b73221aba7ab22bc(var_972270fb4a04f3bf, player, var_c13ff1030606c1d6, var_5e08ee058aba29d3);
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7a8f
// Size: 0x25
function snd_line_detach(var_972270fb4a04f3bf) {
    if (function_110d3ab280057f5b(!isdefined(var_972270fb4a04f3bf), "snd_line_detach with undefined soundObject")) {
        return;
    }
    var_972270fb4a04f3bf notify("snd_line_detach");
}

// Namespace snd / namespace_53c50dd747d66443
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7abc
// Size: 0x7f
function private function_5b159f140bd186df() {
    function_40a17693396019a7();
    if (!isarray(level.snd.var_828ab610e771905)) {
        level.snd.var_828ab610e771905 = [];
    }
    if (!isent(level.snd.var_4388174fd6467686)) {
        level.snd.var_4388174fd6467686 = spawn("sound_transient_soundbanks", (0, 0, 0));
    }
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b43
// Size: 0x52
function function_1186ca4e2e51afea(name) {
    if (isstruct(level.snd) && isdefined(level.snd.var_828ab610e771905) && isdefined(level.snd.var_828ab610e771905[name])) {
        return true;
    }
    return false;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b9e
// Size: 0xf0
function function_f1aed36ab4598ea(name) {
    function_5b159f140bd186df();
    assert(function_f0b5522ee5ce0cb1());
    assert(isent(level.snd.var_4388174fd6467686));
    assert(isarray(level.snd.var_828ab610e771905));
    assertex(isstring(name), "snd_transient_load requires a name argument");
    isloaded = function_1186ca4e2e51afea(name);
    if (function_110d3ab280057f5b(isloaded, "snd_transient_load loaded '" + name + "'")) {
        return;
    }
    level.snd.var_4388174fd6467686 settransientsoundbank(name + ".all", 1);
    level.snd.var_828ab610e771905[name] = level.snd.var_828ab610e771905.size;
}

// Namespace snd / namespace_53c50dd747d66443
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c96
// Size: 0xd8
function function_f4e0ff5cb899686d(name) {
    function_5b159f140bd186df();
    assert(function_f0b5522ee5ce0cb1());
    assert(isent(level.snd.var_4388174fd6467686));
    assert(isarray(level.snd.var_828ab610e771905));
    assertex(isstring(name), "snd_transient_unload requires a name argument");
    isloaded = function_1186ca4e2e51afea(name);
    if (function_110d3ab280057f5b(!isloaded, "snd_transient_unload '" + name + "' not loaded")) {
        return;
    }
    level.snd.var_4388174fd6467686 settransientsoundbank(name + ".all", 0);
    level.snd.var_828ab610e771905[name] = undefined;
}

