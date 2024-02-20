// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace debug;

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82
// Size: 0x96
function function_a2eaafb222316a2(ent) {
    /#
        if (!isdefined(ent)) {
            return "<unknown string>";
        }
        text = "<unknown string>" + "<unknown string>" + ent getentitynumber();
        if (isdefined(ent.classname)) {
            text = text + "<unknown string>" + ent.classname + "<unknown string>";
        }
        if (isdefined(ent.model)) {
            text = text + "<unknown string>" + ent.model + "<unknown string>";
        }
        text = text + "<unknown string>";
        return text;
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11f
// Size: 0x9d
function function_57f3a2089db4a571(corpse) {
    /#
        if (getdvarint(@"hash_f806a3434286263f", 0) != 0) {
            level.var_57f3a2089db4a571 = 1;
            if (isdefined(corpse)) {
                entnum = corpse getentitynumber();
                cmd = "<unknown string>" + entnum + "<unknown string>" + entnum;
                adddebugcommand(cmd + "<unknown string>");
            }
        } else if (isdefined(level.var_57f3a2089db4a571) && level.var_57f3a2089db4a571) {
            adddebugcommand("<unknown string>");
            level.var_57f3a2089db4a571 = undefined;
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3
// Size: 0x30
function function_600b37e8cf3f2de9(ent) {
    /#
        if (!isdefined(ent)) {
            return "<unknown string>";
        }
        if (isent(ent)) {
            return ("<unknown string>" + ent getentitynumber());
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x2d
function function_e8ee861a699bea81(variable, var_b3faf4cc160dc6be) {
    if (isdefined(variable)) {
        return (variable + "");
    }
    if (isdefined(var_b3faf4cc160dc6be)) {
        return var_b3faf4cc160dc6be;
    }
    return "";
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0xa0
function function_f9304b74bdeafdb0(button, var_f816676ecdbb0e28, var_4b3406bb2856b79d) {
    self endon("death");
    while (1) {
        if (!self buttonpressed(button)) {
            break;
        }
        waitframe();
    }
    while (1) {
        if (isdefined(var_f816676ecdbb0e28)) {
            /#
                printtoscreen2d(10, 100, "<unknown string>" + button + "<unknown string>" + var_f816676ecdbb0e28, (1, 1, 1), 2);
            #/
        }
        if (self buttonpressed(button)) {
            break;
        }
        waitframe();
    }
    if (isdefined(var_4b3406bb2856b79d)) {
        iprintlnbold(var_4b3406bb2856b79d);
    } else if (isdefined(var_f816676ecdbb0e28)) {
        iprintlnbold("Performed:" + var_f816676ecdbb0e28);
    }
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6
// Size: 0x108
function function_7320cd1e4f724899(text, color, duration, x, y, scale) {
    /#
        if (!isdefined(level.var_252b0cb021ff0964)) {
            level.var_e28e2fe7eef54cc2 = [];
            level.var_44bacfb643ca44f = [];
            level.var_1ed355bf4419acb4 = [];
            level.var_252b0cb021ff0964 = 0;
            level thread function_64f6fe11a0db2eef(x, y, scale);
        }
        if (!isdefined(text)) {
            text = "<unknown string>";
            return;
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (!isdefined(duration)) {
            duration = getdvarfloat(@"hash_e7c6b5ac109cff25", 2);
        }
        level.var_e28e2fe7eef54cc2[level.var_252b0cb021ff0964] = text;
        level.var_44bacfb643ca44f[level.var_252b0cb021ff0964] = gettime() + duration * 1000;
        level.var_1ed355bf4419acb4[level.var_252b0cb021ff0964] = color;
        level.var_252b0cb021ff0964++;
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5
// Size: 0x212
function function_64f6fe11a0db2eef(x, y, scale) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        if (!isdefined(x)) {
            x = getdvarint(@"hash_fd8a279c8461a319", 850);
        }
        if (!isdefined(y)) {
            y = getdvarint(@"hash_fd8a269c8461a0e6", 100);
        }
        if (!isdefined(scale)) {
            scale = getdvarfloat(@"hash_5663361c05f69c73", 2);
        }
        while (1) {
            waittillframeend();
            if (getdvarint(@"hash_e4ceb718c4811e97", 1)) {
                keys = getarraykeys(level.var_44bacfb643ca44f);
                if (keys.size > 0) {
                    var_aaaa8a8df8f5c537 = getdvarint(@"hash_b7c9a158890bce5a");
                    var_ab5696f7e031e1ba = getdvarint(@"hash_9139b4ad2f235c95");
                    var_39c991ead8822d9b = getdvarint(@"hash_b7c9a158890bce5a") / 1920;
                    var_3f109f5aaf427a = getdvarint(@"hash_9139b4ad2f235c95") / 1080;
                    var_dcebffdb83b0ff93 = x * var_39c991ead8822d9b;
                    var_dcebfedb83b0fd60 = y * var_3f109f5aaf427a;
                    var_1499c6e91b1a2b2d = scale * var_3f109f5aaf427a;
                }
                time = gettime();
                linecount = 0;
                foreach (i in keys) {
                    if (time > level.var_44bacfb643ca44f[i]) {
                        level.var_44bacfb643ca44f[i] = undefined;
                        level.var_e28e2fe7eef54cc2[i] = undefined;
                        level.var_1ed355bf4419acb4[i] = undefined;
                    } else {
                        linecount++;
                        printtoscreen2d(var_dcebffdb83b0ff93, var_dcebfedb83b0fd60 + var_1499c6e91b1a2b2d * 12 * linecount, level.var_e28e2fe7eef54cc2[i], level.var_1ed355bf4419acb4[i], var_1499c6e91b1a2b2d);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe
// Size: 0x46
function debug_sphere(target, radius, color, seconds, level_endon, var_d21e977d907c82bf) {
    /#
        level thread function_2061efdf2b62dcdc(target, radius, color, seconds, level_endon, var_d21e977d907c82bf);
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x64b
// Size: 0x10b
function function_2061efdf2b62dcdc(target, radius, color, seconds, level_endon, var_d21e977d907c82bf) {
    /#
        if (!isdefined(radius)) {
            radius = 10;
        }
        var_a0e7fed53853fdbe = undefined;
        if (isvector(target)) {
            var_a0e7fed53853fdbe = target;
        }
        if (isdefined(color) && isstring(color)) {
            color = function_9dd540534e35295b(color);
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        end_time = undefined;
        if (isdefined(seconds)) {
            end_time = gettime() + seconds * 1000;
        }
        if (isdefined(level_endon)) {
            level endon(level_endon);
        }
        if (isdefined(var_d21e977d907c82bf)) {
            /#
                assertex(!isvector(target), "<unknown string>");
            #/
            target endon(var_d21e977d907c82bf);
        }
        while (isdefined(target)) {
            if (isdefined(end_time) && end_time < gettime()) {
                return;
            }
            if (!isvector(target)) {
                var_a0e7fed53853fdbe = target.origin;
            }
            sphere(var_a0e7fed53853fdbe, radius, color, 0, 1);
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x75d
// Size: 0x50
function debug_line(target, target2, color, seconds, level_endon, var_d21e977d907c82bf, var_68a63cb65faa05d) {
    /#
        level thread function_43a9c3a623a796bd(target, target2, color, seconds, level_endon, var_d21e977d907c82bf, var_68a63cb65faa05d);
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x7b4
// Size: 0x168
function function_43a9c3a623a796bd(target, target2, color, seconds, level_endon, var_d21e977d907c82bf, var_68a63cb65faa05d) {
    /#
        var_a0e7fed53853fdbe = undefined;
        if (isvector(target)) {
            var_a0e7fed53853fdbe = target;
        }
        var_bd0b475d289e654 = undefined;
        if (isvector(target2)) {
            var_bd0b475d289e654 = target2;
        }
        if (isdefined(color) && isstring(color)) {
            color = function_9dd540534e35295b(color);
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        end_time = undefined;
        if (isdefined(seconds)) {
            end_time = gettime() + seconds * 1000;
        }
        if (isdefined(level_endon)) {
            level endon(level_endon);
        }
        if (isdefined(var_d21e977d907c82bf)) {
            /#
                assertex(!isvector(target), "<unknown string>");
            #/
            target endon(var_d21e977d907c82bf);
        }
        if (isdefined(var_68a63cb65faa05d)) {
            /#
                assertex(!isvector(target2), "<unknown string>");
            #/
            target2 endon(var_68a63cb65faa05d);
        }
        while (isdefined(target) && isdefined(target2)) {
            if (isdefined(end_time) && end_time < gettime()) {
                return;
            }
            if (!isvector(target)) {
                var_a0e7fed53853fdbe = target.origin;
            }
            if (!isvector(target2)) {
                var_bd0b475d289e654 = target2.origin;
            }
            line(var_a0e7fed53853fdbe, var_bd0b475d289e654, color, 1, 0, 1);
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x923
// Size: 0x46
function draw_angles(target, angles, radius, seconds, level_endon, var_d21e977d907c82bf) {
    /#
        level thread function_3a97db5a17888208(target, angles, radius, seconds, level_endon, var_d21e977d907c82bf);
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x970
// Size: 0x176
function function_3a97db5a17888208(target, angles, radius, seconds, level_endon, var_d21e977d907c82bf) {
    /#
        if (!isdefined(radius)) {
            radius = 100;
        }
        var_a0e7fed53853fdbe = undefined;
        if (isvector(target)) {
            var_a0e7fed53853fdbe = target;
        }
        end_time = undefined;
        if (isdefined(seconds)) {
            end_time = gettime() + seconds * 1000;
        }
        if (isdefined(level_endon)) {
            level endon(level_endon);
        }
        if (isdefined(var_d21e977d907c82bf)) {
            /#
                assertex(!isvector(target), "<unknown string>");
            #/
            target endon(var_d21e977d907c82bf);
        }
        while (isdefined(target)) {
            if (isdefined(end_time) && end_time < gettime()) {
                return;
            }
            if (!isvector(target)) {
                var_a0e7fed53853fdbe = target.origin;
                angles = target.angles;
            }
            forward = anglestoforward(angles);
            right = anglestoright(angles);
            up = anglestoup(angles);
            line(var_a0e7fed53853fdbe, var_a0e7fed53853fdbe + forward * radius, (1, 0, 0), 1, 0, 1);
            line(var_a0e7fed53853fdbe, var_a0e7fed53853fdbe + right * radius, (0, 1, 0), 1, 0, 1);
            line(var_a0e7fed53853fdbe, var_a0e7fed53853fdbe + up * radius, (0, 0, 1), 1, 0, 1);
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0xaed
// Size: 0x78
function interact(target, text, var_2a93c830452b3daf, var_38669543a34ecd14, var_69e39122bf13efba, level_endon, var_d21e977d907c82bf, color, z_offset, alpha, scale) {
    /#
        level thread function_46c553af09559125(target, text, var_2a93c830452b3daf, var_38669543a34ecd14, var_69e39122bf13efba, level_endon, var_d21e977d907c82bf, color, z_offset, alpha, scale);
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params b, eflags: 0x0
// Checksum 0x0, Offset: 0xb6c
// Size: 0x235
function function_46c553af09559125(target, text, var_2a93c830452b3daf, var_38669543a34ecd14, var_69e39122bf13efba, level_endon, var_d21e977d907c82bf, color, z_offset, alpha, scale) {
    /#
        if (!isdefined(var_69e39122bf13efba)) {
            var_69e39122bf13efba = 0;
        }
        if (!isdefined(z_offset)) {
            z_offset = 10;
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(scale)) {
            scale = 1;
        }
        v_target = undefined;
        if (isvector(target)) {
            v_target = target;
        } else {
            v_target = target.origin;
        }
        interact = undefined;
        if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
            interact = [[ getsharedfunc("<unknown string>", "<unknown string>") ]](v_target, "<unknown string>", undefined, undefined, 5, "<unknown string>", "<unknown string>", 100, 90, 100, 90);
        } else {
            /#
                assertmsg("<unknown string>");
            #/
        }
        if (isent(target)) {
            interact linkto(target);
            interact thread utility::function_fe32d769b4bbd6a1(target, "<unknown string>");
            target endon("<unknown string>");
        }
        if (isdefined(level_endon)) {
            level endon(level_endon);
            interact thread utility::function_fe32d769b4bbd6a1(level, level_endon);
        }
        if (isdefined(var_d21e977d907c82bf)) {
            /#
                assertex(!isvector(target), "<unknown string>");
            #/
            target endon(var_d21e977d907c82bf);
            interact thread utility::function_fe32d769b4bbd6a1(target, var_d21e977d907c82bf);
        }
        if (isdefined(color) && isstring(color)) {
            color = function_9dd540534e35295b(color);
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (isdefined(text)) {
            childthread function_bbc7faeb2e19df2d(interact, text, color, undefined, undefined, undefined, alpha, scale, z_offset);
        }
        childthread function_2061efdf2b62dcdc(interact, 2, color);
        while (isdefined(target)) {
            player = interact waittill("<unknown string>");
            if (isdefined(var_2a93c830452b3daf)) {
                if (isdefined(var_38669543a34ecd14)) {
                    if (!isarray(var_38669543a34ecd14)) {
                        var_38669543a34ecd14 = [0:var_38669543a34ecd14];
                    }
                    level thread utility::single_func_argarray(player, var_2a93c830452b3daf, var_38669543a34ecd14);
                } else {
                    player thread [[ var_2a93c830452b3daf ]]();
                }
            }
            if (var_69e39122bf13efba) {
                interact delete();
                return;
            }
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xda8
// Size: 0x64
function debug_print3d(target, text, color, seconds, level_endon, var_d21e977d907c82bf, alpha, scale, z_offset) {
    /#
        level thread function_bbc7faeb2e19df2d(target, text, color, seconds, level_endon, var_d21e977d907c82bf, alpha, scale, z_offset);
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xe13
// Size: 0x147
function function_bbc7faeb2e19df2d(target, text, color, seconds, level_endon, var_d21e977d907c82bf, alpha, scale, z_offset) {
    /#
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(scale)) {
            scale = 1;
        }
        if (!isdefined(z_offset)) {
            z_offset = 0;
        }
        v_target = undefined;
        if (isvector(target)) {
            v_target = target;
        }
        if (isdefined(color) && isstring(color)) {
            color = function_9dd540534e35295b(color);
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        end_time = undefined;
        if (isdefined(seconds)) {
            end_time = gettime() + seconds * 1000;
        }
        if (isdefined(level_endon)) {
            level endon(level_endon);
        }
        if (isdefined(var_d21e977d907c82bf)) {
            /#
                assertex(!isvector(target), "<unknown string>");
            #/
            target endon(var_d21e977d907c82bf);
        }
        while (isdefined(target)) {
            if (isdefined(end_time) && end_time < gettime()) {
                return;
            }
            if (!isvector(target)) {
                v_target = target.origin;
            }
            print3d(v_target + (0, 0, z_offset), text, color, alpha, scale, 1, 1);
            waitframe();
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf61
// Size: 0x2e8
function function_9dd540534e35295b(color) {
    /#
        switch (color) {
        case #"hash_97430f6c58e61cbc":
            return (1, 0, 0);
        case #"hash_35bb3bd014c77f4b":
            return (1, 0.5, 0);
        case #"hash_2ac407c1cd5943a9":
            return (1, 1, 0);
        case #"hash_883ff07272b4f9c":
            return (0, 1, 0);
        case #"hash_6686d129776d649a":
            return (0, 1, 1);
        case #"hash_778bb52ecd08072d":
            return (0, 0, 1);
        case #"hash_40fc63173753ec52":
            return (1, 0.5, 1);
        case #"hash_598a30e44f53045f":
            return (0.5, 0, 1);
        case #"hash_6eb69eb2e91f9fc8":
            return (1, 0, 1);
        case #"hash_8c6e8e84936881cd":
            return (1, 0.75, 0.75);
        case #"hash_1393412d7401c646":
            return (1, 1, 1);
        case #"hash_a4324aac758f0a84":
            return (0, 0, 0);
        case #"hash_dd71850f436e7706":
        case #"hash_dd7e8d0f437910fa":
            return (0.75, 0.75, 0.75);
        case #"hash_2748da0737956f91":
        case #"hash_82bae0726e5ab95":
            return (0.1, 0.1, 0.1);
        case #"hash_82bab0726e5a6dc":
        case #"hash_2748d70737956ad8":
            return (0.2, 0.2, 0.2);
        case #"hash_82bac0726e5a86f":
        case #"hash_2748d80737956c6b":
            return (0.3, 0.3, 0.3);
        case #"hash_82ba90726e5a3b6":
        case #"hash_2748dd073795744a":
            return (0.4, 0.4, 0.4);
        case #"hash_82baa0726e5a549":
        case #"hash_2748de07379575dd":
            return (0.5, 0.5, 0.5);
        case #"hash_2748db0737957124":
        case #"hash_82ba70726e5a090":
            return (0.6, 0.6, 0.6);
        case #"hash_82ba80726e5a223":
        case #"hash_2748dc07379572b7":
            return (0.7, 0.7, 0.7);
        case #"hash_82bb50726e5b69a":
        case #"hash_2748d10737956166":
            return (0.8, 0.8, 0.8);
        case #"hash_82bb60726e5b82d":
        case #"hash_2748d207379562f9":
            return (0.9, 0.9, 0.9);
        default:
            /#
                assertmsg("<unknown string>");
            #/
            return undefined;
            break;
        }
    #/
}

// Namespace debug/namespace_d8bd5ac27a00a48d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1250
// Size: 0x532
function function_8245dce28f1f395c(var_8132f3edc308582c, var_cb794eb7a3de6a82, var_457344c56579fa6d, var_e9a2d4d493e53ce3, var_3885be3158ac58d8, var_3b3652114fdefa9f) {
    /#
        if (!isdefined(var_e9a2d4d493e53ce3)) {
            var_e9a2d4d493e53ce3 = 5;
        }
        if (!isdefined(var_3885be3158ac58d8)) {
            var_3885be3158ac58d8 = 0.25;
        }
        if (!isdefined(var_3b3652114fdefa9f)) {
            var_3b3652114fdefa9f = 1;
        }
        if (!isdefined(var_8132f3edc308582c) || isdefined(var_8132f3edc308582c) && !isarray(var_8132f3edc308582c)) {
            return;
        }
        if (!isdefined(self)) {
            return;
        }
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_0000012e;
        }
        einflictor = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_00000146;
        }
        eattacker = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_0000015e;
        }
        idamage = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_00000176;
        }
        smod = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_0000018e;
        }
        sweapon = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_000001a6;
        }
        vpoint = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_000001be;
        }
        vdir = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_000001d6;
        }
        shitloc = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_000001ee;
        }
        objweapon = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_00000206;
        }
        partname = var_8132f3edc308582c["<unknown string>"];
        if (!isdefined(var_8132f3edc308582c["<unknown string>"])) {
            goto LOC_0000021e;
        }
        tagname = var_8132f3edc308582c["<unknown string>"];
        if (istrue(var_3b3652114fdefa9f)) {
            if (!isdefined(eattacker) || isdefined(eattacker) && !isplayer(eattacker) && (!isdefined(einflictor) || isdefined(einflictor) && !isplayer(einflictor))) {
                return;
            }
        }
        if (is_equal(var_e9a2d4d493e53ce3, -1)) {
            var_e9a2d4d493e53ce3 = undefined;
        }
        s = "<unknown string>" + self getentitynumber();
        if (isdefined(einflictor)) {
            s = s + "<unknown string>" + einflictor getentitynumber();
        }
        if (isdefined(eattacker)) {
            s = s + "<unknown string>" + eattacker getentitynumber();
        }
        if (isdefined(shitloc)) {
            s = s + "<unknown string>" + shitloc;
        }
        s2 = "<unknown string>";
        s2 = s2 + "<unknown string>" + idamage;
        if (isdefined(var_cb794eb7a3de6a82) && var_cb794eb7a3de6a82 != idamage) {
            s2 = s2 + "<unknown string>" + var_cb794eb7a3de6a82;
        }
        if (isdefined(smod)) {
            s2 = s2 + "<unknown string>" + smod;
        }
        s3 = "<unknown string>";
        if (isdefined(self) && isdefined(self.health) && isdefined(self.maxhealth)) {
            if (istrue(var_457344c56579fa6d)) {
                s3 = "<unknown string>" + self.health - idamage + "<unknown string>" + self.maxhealth;
            } else {
                s3 = "<unknown string>" + self.health + "<unknown string>" + self.maxhealth;
            }
        }
        s4 = "<unknown string>";
        if (isdefined(sweapon)) {
            if (isstring(sweapon)) {
                s4 = "<unknown string>" + sweapon;
            } else if (isdefined(sweapon.basename)) {
                s4 = "<unknown string>" + sweapon.basename;
            }
        } else if (isdefined(objweapon)) {
            if (isdefined(objweapon.basename)) {
                s4 = "<unknown string>" + objweapon.basename;
            }
        }
        if (isdefined(einflictor) && isdefined(einflictor.weapon_name)) {
            s4 = s4 + "<unknown string>" + einflictor.weapon_name;
            weap_name = einflictor.weapon_name;
        }
        s5 = "<unknown string>";
        var_511045aef9937a0a = undefined;
        if (isdefined(vpoint)) {
            var_511045aef9937a0a = vpoint;
        } else if (isdefined(self.origin)) {
            var_511045aef9937a0a = self.origin;
        }
        if (getdvarint(@"hash_81d89e4abec64203", 0) == 1 && isdefined(var_511045aef9937a0a)) {
            debug_print3d(var_511045aef9937a0a, s, undefined, var_e9a2d4d493e53ce3, undefined, undefined, undefined, var_3885be3158ac58d8);
            debug_print3d(var_511045aef9937a0a, s2, undefined, var_e9a2d4d493e53ce3, undefined, undefined, undefined, var_3885be3158ac58d8, -5);
            debug_print3d(var_511045aef9937a0a, s3, undefined, var_e9a2d4d493e53ce3, undefined, undefined, undefined, var_3885be3158ac58d8, -10);
            debug_print3d(var_511045aef9937a0a, s4, undefined, var_e9a2d4d493e53ce3, undefined, undefined, undefined, var_3885be3158ac58d8, -15);
        } else if (isdefined(var_e9a2d4d493e53ce3)) {
            function_7320cd1e4f724899(s5, undefined, var_e9a2d4d493e53ce3);
            function_7320cd1e4f724899(s4, undefined, var_e9a2d4d493e53ce3);
            function_7320cd1e4f724899(s3, undefined, var_e9a2d4d493e53ce3);
            function_7320cd1e4f724899(s2, undefined, var_e9a2d4d493e53ce3);
            function_7320cd1e4f724899(s, undefined, var_e9a2d4d493e53ce3);
        } else {
            function_7320cd1e4f724899(s5, undefined, 300);
            function_7320cd1e4f724899(s4, undefined, 300);
            function_7320cd1e4f724899(s3, undefined, 300);
            function_7320cd1e4f724899(s2, undefined, 300);
            function_7320cd1e4f724899(s, undefined, 300);
        }
    #/
}

