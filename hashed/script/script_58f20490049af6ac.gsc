// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\utility\script.gsc;
#using script_3c46a15a541390cf;
#using scripts\mp\flags.gsc;

#namespace namespace_553788426d0f4133;

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275
// Size: 0x2d2
function function_c7f3ae56442546d1(origin, var_cf3800024083abbe, var_79a6e85c95fe549b, var_b7c9fe00120ea96c, var_437c3e3159a04f4e) {
    if (!isdefined(var_cf3800024083abbe) || var_cf3800024083abbe.size < 2 || var_cf3800024083abbe[0] <= 0) {
        return undefined;
    }
    var_38a4c729748ad94c = getdvarint(@"hash_67a8c844bad5a45b", 0);
    if (!var_38a4c729748ad94c && namespace_71073fa38f11492::isfeatureenabled("circleSnapToNavMesh")) {
        var_38a4c729748ad94c = 1;
    }
    var_8ae269616d09dfc5 = [];
    var_8ae269616d09dfc5[0] = (origin[0], origin[1], 0);
    radius = var_cf3800024083abbe[0];
    var_d6bac3bf0f64d280 = 1 - var_cf3800024083abbe[1] / radius;
    var_2082f17f2e1c69bf = var_cf3800024083abbe.size - 1;
    var_8ae269616d09dfc5[var_2082f17f2e1c69bf] = getrandompointinboundscircle(origin, radius, 0, var_d6bac3bf0f64d280, 1, var_38a4c729748ad94c, 1);
    if (istrue(var_437c3e3159a04f4e)) {
        return var_8ae269616d09dfc5;
    }
    var_7a50883c31353c77 = getdvarfloat(@"hash_917b939513f89b55", 200);
    var_11c1e6222da58849 = getdvarint(@"hash_e65611a4d524bcbe", 0);
    for (circleindex = var_2082f17f2e1c69bf - 1; circleindex >= 0; circleindex--) {
        origin = var_8ae269616d09dfc5[circleindex + 1];
        radius = var_cf3800024083abbe[circleindex];
        var_9bedd0ecb39838d6 = 0;
        var_d6bac3bf0f64d280 = 1 - var_cf3800024083abbe[circleindex + 1] / radius;
        var_b1d0bc03029f6a2c = var_9bedd0ecb39838d6 + randomfloat(var_d6bac3bf0f64d280 - var_9bedd0ecb39838d6);
        closetime = var_79a6e85c95fe549b[circleindex];
        prevradius = var_cf3800024083abbe[circleindex + 1];
        var_6041996e5ca4b1f3 = radius - prevradius;
        var_c9f9b6297ab4434a = var_6041996e5ca4b1f3 / closetime;
        var_599ca8aac66aed6f = max(0, var_7a50883c31353c77 - var_c9f9b6297ab4434a);
        var_797b88a97bedc494 = var_599ca8aac66aed6f * closetime;
        var_6443d240572e7a5b = var_797b88a97bedc494 / radius;
        var_3f139f4756ad700e = var_b1d0bc03029f6a2c > var_6443d240572e7a5b;
        if (var_3f139f4756ad700e && !istrue(var_b7c9fe00120ea96c)) {
            var_9ed6827753db2370 = var_c9f9b6297ab4434a + var_b1d0bc03029f6a2c * radius / closetime;
            dlog_recordevent("dlog_event_br_circle_speed_warning", [0:"player_speed", 1:var_7a50883c31353c77, 2:"circle_speed", 3:var_9ed6827753db2370, 4:"circle_close_time", 5:float(closetime), 6:"circle_current_radius", 7:float(radius), 8:"circle_next_radius", 9:float(prevradius)]);
        }
        if (circleindex) {
            if (var_11c1e6222da58849 && var_3f139f4756ad700e) {
                var_b1d0bc03029f6a2c = var_9bedd0ecb39838d6 + randomfloat(var_6443d240572e7a5b - var_9bedd0ecb39838d6);
            }
            var_8ae269616d09dfc5[circleindex] = getrandompointinboundscircle(origin, radius, var_b1d0bc03029f6a2c, var_b1d0bc03029f6a2c, 1, var_38a4c729748ad94c, 1);
            continue;
        }
    }
    return var_8ae269616d09dfc5;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0xdd
function function_a09532919ae80718(var_fc0802bc96b1ccbe, var_8ae269616d09dfc5, var_cf3800024083abbe, var_38a4c729748ad94c) {
    var_48c37d0bef1c3760 = [];
    for (circleindex = 1; circleindex <= var_fc0802bc96b1ccbe; circleindex++) {
        var_9d2610f6a0b725a4 = var_cf3800024083abbe[circleindex - 1];
        var_a754cfa0ff072630 = var_8ae269616d09dfc5[circleindex - 1];
        var_2e8e1bbffd8bc082 = var_cf3800024083abbe[circleindex];
        mindist = var_9d2610f6a0b725a4 + var_2e8e1bbffd8bc082 + level.br_level.br_movingcirclemovedistmin;
        maxdist = var_9d2610f6a0b725a4 + var_2e8e1bbffd8bc082 + level.br_level.br_movingcirclemovedistmax;
        var_48c37d0bef1c3760[circleindex - 1] = getrandompointinboundscircle(var_a754cfa0ff072630, maxdist, mindist / maxdist, 1, 1, var_38a4c729748ad94c, 1);
    }
    return var_48c37d0bef1c3760;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x634
// Size: 0x25
function function_d987886bb9de9137() {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return 0;
    }
    return level.br_multi_circle.var_209967c144016964;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x661
// Size: 0x3a
function function_d8fbacc18e5d8498() {
    return function_d987886bb9de9137() > 1 && level.br_circle.circleindex + 1 == level.br_multi_circle.var_c22567ed8cfe3761;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a3
// Size: 0x1f
function function_29e8194ff7e13e2e() {
    return function_49411683f5a51daa(level.br_circle.circleindex + 1);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0x75
function function_49411683f5a51daa(circleindex) {
    if (isdefined(level.br_multi_circle.var_29e8194ff7e13e2e)) {
        return [[ level.br_multi_circle.var_29e8194ff7e13e2e ]](circleindex);
    }
    return function_d987886bb9de9137() > 1 && (circleindex < level.br_multi_circle.var_8a10c39962f6d9fd || circleindex > level.br_multi_circle.var_c22567ed8cfe3761);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747
// Size: 0x80
function function_57f3fd16b628c829(circleindex) {
    var_a9ed63230d9a3c95 = level.br_level.br_circleshowdelaydanger[circleindex];
    if (var_a9ed63230d9a3c95 > 0) {
        hidedangercircle();
        delaythread(var_a9ed63230d9a3c95, &showdangercircle);
    }
    var_4f48a6344ec8a9c7 = level.br_level.br_circleshowdelaysafe[circleindex];
    if (var_4f48a6344ec8a9c7 > 0) {
        hidesafecircle();
        delaythread(var_4f48a6344ec8a9c7, &showsafecircle);
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x4f
function function_47759b7ed0818a3f(circleindex, var_f007ce073dc3c519) {
    if (canplaycircleopendialog(circleindex)) {
        if (var_f007ce073dc3c519) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("first_circle", 1, undefined, undefined, 0.5);
        } else {
            namespace_d3d40f75bb4e4c32::brleaderdialog("new_circle", 1, undefined, undefined, 0.5);
        }
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824
// Size: 0x58
function function_8d09229c08abd549(circleindex, var_6b890e6be7982efb) {
    if (canplaycircleclosedialog(circleindex)) {
        if (var_6b890e6be7982efb) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("final_circle", 1, undefined, undefined, 0.5);
        } else {
            namespace_d3d40f75bb4e4c32::brleaderdialog("circle_closing", 1, undefined, undefined, 0.5);
            thread brcirclebattlechatter(circleindex);
        }
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x883
// Size: 0xc
function function_6ab5543ce292e3fc(circleindex) {
    
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x896
// Size: 0xc
function function_d19f6d13e6cefce8(circleindex) {
    
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9
// Size: 0x12
function function_ea6cdf6492dfb4fa() {
    return getdvarint(@"hash_afe2a26cda0aaf42", 0);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c3
// Size: 0x7d
function function_8c0f978940451524(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (isdefined(level.var_9ebef1efb6e8a3a9)) {
        foreach (callback in level.var_9ebef1efb6e8a3a9) {
            [[ callback ]](var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a);
        }
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x947
// Size: 0xaf
function function_ebdd2e77a8ade959() {
    /#
    #/
    if (isdefined(level.var_c7fd2b5cf3acb3da)) {
        foreach (var_7f590f6ae7f3bc83, callback in level.var_c7fd2b5cf3acb3da) {
            var_cc99ac1efb0bda2b = [[ callback ]]();
            if (isdefined(var_cc99ac1efb0bda2b) && var_cc99ac1efb0bda2b.size > 0 && !function_ea6cdf6492dfb4fa()) {
                var_cc99ac1efb0bda2b = array_remove_duplicates(var_cc99ac1efb0bda2b);
                level.var_8a12e160a2617c92[var_7f590f6ae7f3bc83] = array_combine_unique(level.var_8a12e160a2617c92[var_7f590f6ae7f3bc83], var_cc99ac1efb0bda2b);
            }
        }
    }
    /#
    #/
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fd
// Size: 0x105
function function_799fe4ee850f911(circleindex) {
    if (!isdefined(level.br_multi_circle) || !isdefined(level.br_multi_circle.circles) || !isdefined(level.br_multi_circle.circles[circleindex]) || !isdefined(level.br_multi_circle.circles[circleindex].var_3ff449a8eec1b966)) {
        return (0, 0, 0);
    }
    var_3ff449a8eec1b966 = level.br_multi_circle.circles[circleindex].var_3ff449a8eec1b966;
    if (!isdefined(var_3ff449a8eec1b966)) {
        return (0, 0, 0);
    }
    var_2ea62e9ef5a332e8 = var_3ff449a8eec1b966.var_933b2a39ebfd2ad9;
    if (!isdefined(var_2ea62e9ef5a332e8)) {
        return (0, 0, 0);
    }
    return (var_2ea62e9ef5a332e8.origin[0], var_2ea62e9ef5a332e8.origin[1], 0);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a
// Size: 0x70
function function_8a985543e6853bbd(circleindex) {
    var_3ff449a8eec1b966 = level.br_multi_circle.circles[circleindex].var_3ff449a8eec1b966;
    if (!isdefined(var_3ff449a8eec1b966)) {
        return 0;
    }
    var_2ea62e9ef5a332e8 = var_3ff449a8eec1b966.var_933b2a39ebfd2ad9;
    if (!isdefined(var_2ea62e9ef5a332e8)) {
        return 0;
    }
    return var_2ea62e9ef5a332e8.origin[2];
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb82
// Size: 0x93
function function_755c691f70eafe3b(circleindex) {
    var_3ff449a8eec1b966 = level.br_multi_circle.circles[circleindex].var_3ff449a8eec1b966;
    if (!isdefined(var_3ff449a8eec1b966)) {
        return (0, 0, 0);
    }
    var_c74adcaae49e4e42 = var_3ff449a8eec1b966.var_46870b6fa8ad4427;
    if (!isdefined(var_c74adcaae49e4e42)) {
        return (0, 0, 0);
    }
    return (var_c74adcaae49e4e42.origin[0], var_c74adcaae49e4e42.origin[1], 0);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1d
// Size: 0x70
function function_a835b5dff878f77(circleindex) {
    var_3ff449a8eec1b966 = level.br_multi_circle.circles[circleindex].var_3ff449a8eec1b966;
    if (!isdefined(var_3ff449a8eec1b966)) {
        return 0;
    }
    var_c74adcaae49e4e42 = var_3ff449a8eec1b966.var_46870b6fa8ad4427;
    if (!isdefined(var_c74adcaae49e4e42)) {
        return 0;
    }
    return var_c74adcaae49e4e42.origin[2];
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc95
// Size: 0xd4
function function_d277283fb9ad5d46(origin, index, var_be8e05f747d3ca77) {
    var_3ff449a8eec1b966 = level.br_multi_circle.circles[index].var_3ff449a8eec1b966;
    if (!isdefined(var_3ff449a8eec1b966)) {
        return 0;
    }
    var_c74adcaae49e4e42 = var_3ff449a8eec1b966.var_46870b6fa8ad4427;
    if (!isdefined(var_c74adcaae49e4e42)) {
        return 0;
    }
    if (!isdefined(origin)) {
        return 0;
    }
    var_819edacdacb810e4 = (var_c74adcaae49e4e42.origin[0], var_c74adcaae49e4e42.origin[1], 0);
    var_e86632d645c137d0 = var_c74adcaae49e4e42.origin[2];
    if (isdefined(var_be8e05f747d3ca77)) {
        var_e86632d645c137d0 = var_e86632d645c137d0 + var_be8e05f747d3ca77;
    }
    if (distance2dsquared(var_819edacdacb810e4, origin) < var_e86632d645c137d0 * var_e86632d645c137d0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd71
// Size: 0x7e
function function_ee854fdd1e77efc4(origin, var_427d3b5a8969def8) {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return 0;
    }
    if (!isdefined(var_427d3b5a8969def8)) {
        var_427d3b5a8969def8 = 0;
    }
    var_c669c821ee772a3d = function_d987886bb9de9137();
    if (function_29e8194ff7e13e2e()) {
        var_c669c821ee772a3d = 1;
    }
    for (i = 0; i < var_c669c821ee772a3d; i++) {
        var_b7a43cf03194d69a = function_d277283fb9ad5d46(origin, i, var_427d3b5a8969def8);
        if (istrue(var_b7a43cf03194d69a)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7
// Size: 0xd6
function function_783961b002f33360(origin, index, var_be8e05f747d3ca77) {
    if (!isdefined(level.br_multi_circle.circles[index].var_3ff449a8eec1b966)) {
        return undefined;
    }
    var_2ea62e9ef5a332e8 = level.br_multi_circle.circles[index].var_3ff449a8eec1b966.var_933b2a39ebfd2ad9;
    var_add4fd7502a75a8a = (var_2ea62e9ef5a332e8.origin[0], var_2ea62e9ef5a332e8.origin[1], 0);
    var_77e882da07e78cfe = var_2ea62e9ef5a332e8.origin[2];
    if (isdefined(var_be8e05f747d3ca77)) {
        var_77e882da07e78cfe = var_77e882da07e78cfe + var_be8e05f747d3ca77;
    }
    if (distance2dsquared(var_add4fd7502a75a8a, origin) < var_77e882da07e78cfe * var_77e882da07e78cfe) {
        return 1;
    }
    return 0;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed5
// Size: 0x6d
function function_27779e30fe4c0d62(origin) {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return 0;
    }
    var_c669c821ee772a3d = function_d987886bb9de9137();
    if (function_29e8194ff7e13e2e()) {
        var_c669c821ee772a3d = 1;
    }
    for (i = 0; i < var_c669c821ee772a3d; i++) {
        var_1b33a8292e7044 = function_783961b002f33360(origin, i);
        if (istrue(var_1b33a8292e7044)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4a
// Size: 0x60
function function_77cec84f05ca9418(point1, point2, var_be8e05f747d3ca77) {
    var_c669c821ee772a3d = function_d987886bb9de9137();
    for (i = 0; i < var_c669c821ee772a3d; i++) {
        if (function_d277283fb9ad5d46(point1, i) && function_d277283fb9ad5d46(point2, i)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb2
// Size: 0x6b
function function_de2f1b656ee04ba9() {
    var_c669c821ee772a3d = function_d987886bb9de9137();
    if (var_c669c821ee772a3d > 1) {
        var_f2c46154d60d119b = [];
        for (i = 0; i < var_c669c821ee772a3d; i++) {
            safeorigin = function_799fe4ee850f911(i);
            var_f2c46154d60d119b[var_f2c46154d60d119b.size] = safeorigin;
        }
        return var_f2c46154d60d119b;
    } else {
        safeorigin = namespace_c5622898120e827f::getsafecircleorigin();
        return [0:safeorigin];
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1024
// Size: 0x6b
function function_54798383fa7f572b() {
    var_c669c821ee772a3d = function_d987886bb9de9137();
    if (var_c669c821ee772a3d > 1) {
        var_5960287de2e9eb0d = [];
        for (i = 0; i < var_c669c821ee772a3d; i++) {
            var_f434d604c09196aa = function_8a985543e6853bbd(i);
            var_5960287de2e9eb0d[var_5960287de2e9eb0d.size] = var_f434d604c09196aa;
        }
        return var_5960287de2e9eb0d;
    } else {
        var_f434d604c09196aa = namespace_c5622898120e827f::getsafecircleradius();
        return [0:var_f434d604c09196aa];
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1096
// Size: 0x6b
function function_7d381171eae99b77() {
    var_c669c821ee772a3d = function_d987886bb9de9137();
    if (var_c669c821ee772a3d > 1) {
        var_c86bc952d8cc7c15 = [];
        for (i = 0; i < var_c669c821ee772a3d; i++) {
            var_ef8f7e66dc0feb2c = function_755c691f70eafe3b(i);
            var_c86bc952d8cc7c15[var_c86bc952d8cc7c15.size] = var_ef8f7e66dc0feb2c;
        }
        return var_c86bc952d8cc7c15;
    } else {
        var_ef8f7e66dc0feb2c = namespace_c5622898120e827f::getdangercircleorigin();
        return [0:var_ef8f7e66dc0feb2c];
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1108
// Size: 0x6b
function function_bf15a5aa7e72aee9() {
    var_c669c821ee772a3d = function_d987886bb9de9137();
    if (var_c669c821ee772a3d > 1) {
        var_18a9373b09ac2fb7 = [];
        for (i = 0; i < var_c669c821ee772a3d; i++) {
            dangerradius = function_a835b5dff878f77(i);
            var_18a9373b09ac2fb7[var_18a9373b09ac2fb7.size] = dangerradius;
        }
        return var_18a9373b09ac2fb7;
    } else {
        dangerradius = namespace_c5622898120e827f::getdangercircleradius();
        return [0:dangerradius];
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117a
// Size: 0x3e
function function_a465e3c1371d7dab(point) {
    if (istrue(level.br_circle_disabled)) {
        return 1;
    } else if (namespace_bbc79db4c3949a5c::function_d987886bb9de9137() > 1) {
        return function_27779e30fe4c0d62(point);
    } else {
        return namespace_c5622898120e827f::ispointincurrentsafecircle(point);
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bf
// Size: 0x3e
function function_778a4c3d053ed0a9(point) {
    if (istrue(level.br_circle_disabled)) {
        return 1;
    } else if (namespace_bbc79db4c3949a5c::function_d987886bb9de9137() > 1) {
        return function_ee854fdd1e77efc4(point);
    } else {
        return namespace_c5622898120e827f::function_c11714256f856e10(point);
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1204
// Size: 0xa1
function function_d12a7c7251710cbf() {
    totaltime = 0;
    for (i = 0; i < level.br_level.br_circleclosetimes.size; i++) {
        totaltime = totaltime + level.br_level.br_circleclosetimes[i];
    }
    for (i = 0; i < level.br_level.br_circledelaytimes.size; i++) {
        totaltime = totaltime + level.br_level.br_circledelaytimes[i];
    }
    logstring("br_circle_util::logTotalMatchTime = " + totaltime + " seconds");
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ac
// Size: 0x38c
function function_60951b84c58915ab(testpoint, var_ff696ac4914036ee) {
    if (!isdefined(var_ff696ac4914036ee)) {
        var_ff696ac4914036ee = 0;
    }
    times = [];
    if (istrue(level.var_2df69b8e552238b6)) {
        var_ed09715e306a1455 = level.br_multi_circle;
    } else {
        var_ed09715e306a1455 = spawnstruct();
        var_ed09715e306a1455.circles[0] = spawnstruct();
        var_ed09715e306a1455.circles[0].var_8ae269616d09dfc5 = level.br_level.br_circlecenters;
    }
    for (var_c669c821ee772a3d = 0; var_c669c821ee772a3d < var_ed09715e306a1455.circles.size; var_c669c821ee772a3d++) {
        currenttime = 0;
        var_8ae269616d09dfc5 = var_ed09715e306a1455.circles[var_c669c821ee772a3d].var_8ae269616d09dfc5;
        for (i = 0; i < var_8ae269616d09dfc5.size - 1; i++) {
            currentorigin = var_8ae269616d09dfc5[i];
            nextorigin = var_8ae269616d09dfc5[i + 1];
            currentradius = level.br_level.br_circleradii[i];
            nextradius = level.br_level.br_circleradii[i + 1];
            currenttime = currenttime + level.br_level.br_circledelaytimes[i];
            ts = function_64fccd3662b256c4(testpoint, currentorigin, currentradius, nextorigin, nextradius, i);
            for (j = 0; j < ts.size; j++) {
                ts[j].time = currenttime + level.br_level.br_circleclosetimes[i] * ts[j].time;
                times[times.size] = ts[j];
            }
            currenttime = currenttime + level.br_level.br_circleclosetimes[i];
        }
    }
    var_44ae6500062c31b4 = namespace_9c840bb9f2ecbf00::quicksort(times, &function_71b56c961304206d);
    var_cbf0338845c22288 = 0;
    for (var_c669c821ee772a3d = 0; var_c669c821ee772a3d < var_ed09715e306a1455.circles.size; var_c669c821ee772a3d++) {
        var_8ae269616d09dfc5 = var_ed09715e306a1455.circles[var_c669c821ee772a3d].var_8ae269616d09dfc5;
        dist = distance2d(testpoint, var_8ae269616d09dfc5[0]);
        if (dist < level.br_level.br_circleradii[0]) {
            var_cbf0338845c22288++;
        }
    }
    times = [];
    times[0] = function_a0662c2865628336(0, ter_op(var_cbf0338845c22288 > 0, 0, 1), -1);
    for (i = 0; i < var_44ae6500062c31b4.size; i++) {
        addtime = 0;
        state = var_44ae6500062c31b4[i].state;
        if (state == 0) {
            addtime = var_cbf0338845c22288 == 0;
            var_cbf0338845c22288++;
        } else {
            /#
                assert(state == 1);
            #/
            var_cbf0338845c22288--;
            addtime = var_cbf0338845c22288 == 0;
        }
        if (addtime) {
            times[times.size] = var_44ae6500062c31b4[i];
            if (var_ff696ac4914036ee > 0 && times.size > 2) {
                deltatime = times[times.size - 1].time - times[times.size - 2].time;
                if (deltatime <= var_ff696ac4914036ee) {
                    times[times.size - 1] = undefined;
                    times[times.size - 1] = undefined;
                }
            }
        }
    }
    return times;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1640
// Size: 0x25
function function_3e0a90b32e551ad(testpoint) {
    times = function_60951b84c58915ab(testpoint);
    return function_7d8550b9a2c52852(times);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166d
// Size: 0x15
function function_7d8550b9a2c52852(times) {
    return function_97dc13fd8de003a(times, 1);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168a
// Size: 0x25
function function_f487a2a306e21bdb(testpoint) {
    times = function_60951b84c58915ab(testpoint);
    return function_169347c7de51f088(times);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b7
// Size: 0x14
function function_169347c7de51f088(times) {
    return function_97dc13fd8de003a(times, 0);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d3
// Size: 0xcc
function function_97dc13fd8de003a(times, state) {
    var_e39d8e5a89e12a3e = level.br_circle.var_5b8569581e64d55a;
    if (!isdefined(var_e39d8e5a89e12a3e)) {
        var_e39d8e5a89e12a3e = gettime();
    }
    var_f17b39dcb7f8fc64 = (gettime() - var_e39d8e5a89e12a3e) / 1000;
    time_index = 0;
    for (i = 1; i < times.size; i++) {
        if (times[i].time <= var_f17b39dcb7f8fc64) {
            time_index = i;
        }
    }
    if (times[time_index].state == state) {
        return 0;
    } else if (time_index == times.size - 1) {
        return 999999;
    } else {
        return (times[time_index + 1].time - var_f17b39dcb7f8fc64);
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a6
// Size: 0x2e
function function_d5cf183ee258befb(testpoint, var_3bc3e3faacfea87f) {
    times = function_60951b84c58915ab(testpoint);
    return function_ae20efd2c4b04628(times, var_3bc3e3faacfea87f);
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17dc
// Size: 0xf3
function function_ae20efd2c4b04628(times, var_3bc3e3faacfea87f) {
    if (!isdefined(var_3bc3e3faacfea87f)) {
        var_3bc3e3faacfea87f = 0;
    }
    var_e39d8e5a89e12a3e = level.br_circle.var_5b8569581e64d55a;
    if (!isdefined(var_e39d8e5a89e12a3e)) {
        var_e39d8e5a89e12a3e = gettime();
    }
    var_f17b39dcb7f8fc64 = (gettime() - var_e39d8e5a89e12a3e) / 1000 + var_3bc3e3faacfea87f;
    time_index = 0;
    for (i = 1; i < times.size; i++) {
        if (times[i].time <= var_f17b39dcb7f8fc64) {
            time_index = i;
        }
    }
    if (times[time_index].state == 1) {
        return times[time_index].circleindex;
    } else if (time_index == times.size - 1) {
        return (level.br_level.br_circleradii.size - 1);
    } else {
        return times[time_index + 1].circleindex;
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18d6
// Size: 0x54
function private function_a0662c2865628336(time, state, circleindex) {
    s = spawnstruct();
    s.time = time;
    s.state = state;
    s.circleindex = circleindex;
    return s;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1932
// Size: 0x53
function private function_71b56c961304206d(left, right) {
    if (left.time == right.time) {
        return (left.state == 0);
    }
    return left.time <= right.time;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x198d
// Size: 0x29c
function function_6ec3b4c4b5a9edd(time) {
    starttime = level.br_circle.var_5b8569581e64d55a;
    if (!isdefined(starttime)) {
        return undefined;
    }
    if (istrue(level.var_2df69b8e552238b6)) {
        var_ed09715e306a1455 = level.br_multi_circle;
    } else {
        var_ed09715e306a1455 = spawnstruct();
        var_ed09715e306a1455.circles[0] = spawnstruct();
        var_ed09715e306a1455.circles[0].var_8ae269616d09dfc5 = level.br_level.br_circlecenters;
    }
    var_dcd431a09a9a211 = [];
    for (var_c669c821ee772a3d = 0; var_c669c821ee772a3d < var_ed09715e306a1455.circles.size; var_c669c821ee772a3d++) {
        var_e858a946b115578a = (time - starttime) / 1000;
        var_23f4dd5f3cfee9f5 = spawnstruct();
        var_8ae269616d09dfc5 = var_ed09715e306a1455.circles[var_c669c821ee772a3d].var_8ae269616d09dfc5;
        for (i = 0; i < var_8ae269616d09dfc5.size - 1; i++) {
            currentorigin = var_8ae269616d09dfc5[i];
            currentradius = level.br_level.br_circleradii[i];
            var_e858a946b115578a = var_e858a946b115578a - level.br_level.br_circledelaytimes[i];
            if (var_e858a946b115578a <= 0) {
                var_23f4dd5f3cfee9f5.origin = currentorigin;
                var_23f4dd5f3cfee9f5.radius = currentradius;
                break;
            }
            closetime = level.br_level.br_circleclosetimes[i];
            var_e858a946b115578a = var_e858a946b115578a - closetime;
            if (var_e858a946b115578a <= 0) {
                frac = (var_e858a946b115578a + closetime) / closetime;
                frac = clamp(frac, 0, 1);
                nextorigin = var_8ae269616d09dfc5[i + 1];
                var_23f4dd5f3cfee9f5.origin = vectorlerp(currentorigin, nextorigin, frac);
                nextradius = level.br_level.br_circleradii[i + 1];
                var_23f4dd5f3cfee9f5.radius = math::lerp(currentradius, nextradius, frac);
                break;
            }
        }
        if (var_e858a946b115578a > 0) {
            var_23f4dd5f3cfee9f5.origin = var_8ae269616d09dfc5[var_8ae269616d09dfc5.size - 1];
            var_23f4dd5f3cfee9f5.radius = level.br_level.br_circleradii[var_8ae269616d09dfc5.size - 1];
        }
        var_dcd431a09a9a211[var_c669c821ee772a3d] = var_23f4dd5f3cfee9f5;
    }
    return var_dcd431a09a9a211;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c31
// Size: 0x18e
function function_8e779f490bbd1ae9() {
    if (getdvarint(@"hash_cb361ca8aa1b869f", 0) == 0) {
        return;
    }
    var_9676775270cef770 = function_a3920e4ddd93cf3();
    while (1) {
        level waittill("br_circle_set");
        var_758a502acdae3ffb = function_a3920e4ddd93cf3();
        if (var_758a502acdae3ffb.strength <= 0) {
            var_9676775270cef770 = var_758a502acdae3ffb;
            continue;
        }
        var_d04962fa7f3ef6a1 = gettime();
        var_a9e9a1c18405739c = var_d04962fa7f3ef6a1 + 10000;
        while (gettime() < var_a9e9a1c18405739c) {
            progress = (gettime() - var_d04962fa7f3ef6a1) / 10000;
            strength = namespace_d3f3cb0a543667c1::lerp(var_9676775270cef770.strength, var_758a502acdae3ffb.strength, progress);
            radius = namespace_d3f3cb0a543667c1::lerp(var_9676775270cef770.radius, var_758a502acdae3ffb.radius, progress);
            function_2eb76cbe682595c3(vectorlerp(var_9676775270cef770.origin, var_758a502acdae3ffb.origin, progress), radius + 2000, radius + 5000, 0, 4000, strength / 2, strength, 0.35, 1);
            wait(1);
        }
        function_2eb76cbe682595c3(var_758a502acdae3ffb.origin, var_758a502acdae3ffb.radius + 2000, var_758a502acdae3ffb.radius + 5000, 0, 4000, var_758a502acdae3ffb.strength / 2, var_758a502acdae3ffb.strength, 0.35, 1);
        var_9676775270cef770 = var_758a502acdae3ffb;
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dc6
// Size: 0x10e
function private function_a3920e4ddd93cf3() {
    struct = spawnstruct();
    struct.origin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(namespace_c5622898120e827f::getsafecircleorigin());
    struct.radius = namespace_c5622898120e827f::getsafecircleradius();
    var_600d2706a3f4287f = level.br_level.br_circleclosetimes.size - level.br_circle.circleindex - 1;
    switch (var_600d2706a3f4287f) {
    case 0:
        struct.strength = 300;
        break;
    case 1:
        struct.strength = 200;
        break;
    case 2:
        struct.strength = 100;
        break;
    case 3:
        struct.strength = 50;
        break;
    default:
        struct.strength = 0;
        break;
    }
    return struct;
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1edc
// Size: 0x12c
function function_62c8ef916090a2c(var_1bfc048b9cb49482, var_4643546cfff620a5) {
    function_f913ed6ea80cce0d();
    if (!level.var_da89dff7e3009777.size) {
        return;
    }
    var_c1427c3606becd8d = (level.var_779cd9f4c4324154 + 1) % level.var_da89dff7e3009777.size;
    var_85a812a8e488e444 = level.var_da89dff7e3009777[var_c1427c3606becd8d].stringref;
    var_f94237d8c14e730d = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(var_1bfc048b9cb49482, 0, -1000);
    level.var_936f588a93032e5b = spawn("script_model", var_f94237d8c14e730d);
    if (isdefined(var_4643546cfff620a5)) {
        level.var_936f588a93032e5b.angles = var_4643546cfff620a5;
    }
    level.var_936f588a93032e5b setmodel("jup_usa_electronics_casino_slot_machine_01");
    level.var_936f588a93032e5b makeusable();
    level.var_936f588a93032e5b setuseholdduration("duration_short");
    level.var_936f588a93032e5b sethintstring("MP_BR_INGAME/DEV_CIRCLE_REROLLER");
    level.var_936f588a93032e5b sethintstringparams(var_85a812a8e488e444);
    level.var_936f588a93032e5b thread function_aa86aebc45c3ebca();
    level.var_936f588a93032e5b thread function_9c170550c16f8876();
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200f
// Size: 0x3e
function function_f913ed6ea80cce0d() {
    if (!isdefined(level.var_779cd9f4c4324154)) {
        level.var_779cd9f4c4324154 = -1;
    }
    if (!isdefined(level.var_da89dff7e3009777) || !level.var_da89dff7e3009777.size) {
        br_circle::function_72cbdb2550894694();
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2054
// Size: 0x194
function function_aa86aebc45c3ebca(var_dfd8829dea17d4f5) {
    level endon("game_ended");
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        level.var_779cd9f4c4324154 = (level.var_779cd9f4c4324154 + 1) % level.var_da89dff7e3009777.size;
        level.br_circle.br_finalcircleoverride = level.var_da89dff7e3009777[level.var_779cd9f4c4324154].origin;
        var_c1427c3606becd8d = (level.var_779cd9f4c4324154 + 1) % level.var_da89dff7e3009777.size;
        var_85a812a8e488e444 = level.var_da89dff7e3009777[var_c1427c3606becd8d].stringref;
        self sethintstring("MP_BR_INGAME/DEV_CIRCLE_REROLLER");
        self sethintstringparams(var_85a812a8e488e444);
        var_824c45ed4fa2a9f1 = player;
        if (!isdefined(player)) {
            var_824c45ed4fa2a9f1 = level.player;
        }
        /#
            var_824c45ed4fa2a9f1 iprintlnbold("<unknown string>" + level.var_779cd9f4c4324154 + "<unknown string>" + level.var_da89dff7e3009777[level.var_779cd9f4c4324154].name + "<unknown string>");
        #/
        namespace_c5622898120e827f::applycirclesettings();
        level thread namespace_c5622898120e827f::_precalcsafecirclecenters(level.br_circle.br_finalcircleoverride);
        level thread namespace_d04031d92bc84201::function_e71987651701448a();
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("createC130PathStruct")) {
            level.infilstruct.c130pathstruct = namespace_71073fa38f11492::runbrgametypefunc("createC130PathStruct");
        }
    }
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ef
// Size: 0x1e
function function_9c170550c16f8876() {
    level endon("game_ended");
    waitframe();
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    self delete();
}

// Namespace namespace_553788426d0f4133/namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2214
// Size: 0x19f
function function_9dcc9c74376e3a91() {
    /#
        println("<unknown string>");
        println("<unknown string>");
        for (i = 0; i < level.br_level.br_circlecenters.size; i++) {
            origin = level.br_level.br_circlecenters[i];
            println("<unknown string>" + i + "<unknown string>" + origin + "<unknown string>");
            waitframe();
        }
        println("<unknown string>");
        for (i = 0; i < level.br_level.br_circleradii.size; i++) {
            radius = level.br_level.br_circleradii[i];
            println("<unknown string>" + i + "<unknown string>" + radius + "<unknown string>");
            waitframe();
        }
        println("<unknown string>");
        var_c669c821ee772a3d = function_d987886bb9de9137();
        for (i = 0; i < var_c669c821ee772a3d; i++) {
            for (j = 0; j < level.br_level.br_circlecenters.size; j++) {
                origin = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[j];
                println("<unknown string>" + i + "<unknown string>" + j + "<unknown string>" + origin + "<unknown string>");
                waitframe();
            }
        }
        println("<unknown string>");
        println("<unknown string>");
    #/
}

