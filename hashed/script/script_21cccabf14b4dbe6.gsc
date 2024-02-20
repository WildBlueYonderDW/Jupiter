// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_3c46a15a541390cf;
#using scripts\mp\flags.gsc;

#namespace namespace_9ced0748cfd1d189;

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0
// Size: 0xa7
function init() {
    if (getdvarint(@"hash_ddf454c0808d773", 0) == 0) {
        return;
    }
    var_d5bb10777af0fdb1 = undefined;
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("createMultiCircleObjectivesStruct")) {
        var_d5bb10777af0fdb1 = namespace_71073fa38f11492::runbrgametypefunc("createMultiCircleObjectivesStruct");
    }
    if (!isdefined(var_d5bb10777af0fdb1)) {
        return;
    }
    logstring("br_multi_circle_objectives::init");
    if (getdvarint(@"hash_5bd161f5b9367829", 1) != 0) {
        namespace_71073fa38f11492::enablefeature("circleEarlyStart");
    }
    function_ccacfdcc7aa6b6d7();
    function_4139b5956f07453b(var_d5bb10777af0fdb1);
    level.var_80c1e8e18146024f = &function_931e40c0a6e8719b;
    level.var_b31733f431ed12e0.var_29e8194ff7e13e2e = &function_29e8194ff7e13e2e;
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e
// Size: 0x1e6
function function_ccacfdcc7aa6b6d7() {
    level.var_cb9a9bfbbc8b8a0f = 1;
    level.var_2df69b8e552238b6 = 1;
    level.br_circle.circleindex = 0;
    level.var_b31733f431ed12e0 = spawnstruct();
    level.var_b31733f431ed12e0.var_209967c144016964 = 2;
    level.var_b31733f431ed12e0.var_8a10c39962f6d9fd = -1;
    level.var_b31733f431ed12e0.var_c22567ed8cfe3761 = -1;
    level.var_b31733f431ed12e0.var_f3ea1a173901b831 = getdvarint(@"hash_744515d8c05e3243", 1);
    level.var_b31733f431ed12e0.var_c73cd3ac9dde962f = getdvarint(@"hash_c8f6fbc981b7f489", 0);
    level.var_9ced0748cfd1d189 = spawnstruct();
    level.var_9ced0748cfd1d189.var_81e334fd07982878 = getdvarfloat(@"hash_917b939513f89b55", 100);
    level.var_9ced0748cfd1d189.var_305a01b53523b8ce = getdvarfloat(@"hash_f181e180ed21f06b", 0.4);
    level.var_9ced0748cfd1d189.var_ebdbc6f4c094c765 = getdvarint(@"hash_52c6a551a325bc17", 1);
    level.var_9ced0748cfd1d189.var_1afd23e03d011ec6 = getdvarint(@"hash_25e2efa14945cadc", 3000);
    level.var_9ced0748cfd1d189.var_a30bae6d138c2730 = getdvarint(@"hash_ad4aea439f3dd156", 15000);
    level.var_b31733f431ed12e0.var_55cbe3b0d58b0604 = 1;
    level.var_ea923bf109f8a376 = &function_2788e39d9b57d9fb;
    var_48380029fbb1007a = spawnstruct();
    var_48380029fbb1007a.createfunc = &function_82664500e421fe22;
    level.var_b31733f431ed12e0.config = var_48380029fbb1007a;
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x45b
// Size: 0xa2
function createMultiCircleObjectivesStruct(var_9da79c80305f58db, var_d002102fa7e0d9cb, var_647b7cd7ece0574a, var_ff7362b4fb7ddab7, var_7c18d35896440dcb, circleradius) {
    var_d5bb10777af0fdb1 = spawnstruct();
    var_d5bb10777af0fdb1.var_9da79c80305f58db = var_9da79c80305f58db;
    var_d5bb10777af0fdb1.var_d002102fa7e0d9cb = var_d002102fa7e0d9cb;
    var_d5bb10777af0fdb1.var_647b7cd7ece0574a = var_647b7cd7ece0574a;
    var_d5bb10777af0fdb1.var_ff7362b4fb7ddab7 = var_ff7362b4fb7ddab7;
    var_d5bb10777af0fdb1.var_7c18d35896440dcb = var_7c18d35896440dcb;
    var_d5bb10777af0fdb1.circleradius = circleradius;
    var_d5bb10777af0fdb1.var_c9c7a1dc12875b46 = var_7c18d35896440dcb.size;
    return var_d5bb10777af0fdb1;
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505
// Size: 0x185
function function_4139b5956f07453b(var_d5bb10777af0fdb1) {
    var_d5bb10777af0fdb1.var_4ab02385b70ecb03 = [];
    var_d5bb10777af0fdb1.var_260f61b74d1459ff = [];
    for (i = 0; i < var_d5bb10777af0fdb1.var_c9c7a1dc12875b46 - 1; i++) {
        var_c661e5b77c016382 = int(min(var_d5bb10777af0fdb1.var_647b7cd7ece0574a, var_d5bb10777af0fdb1.var_d002102fa7e0d9cb[i]));
        var_e911a9691e72d18 = distance2d(var_d5bb10777af0fdb1.var_7c18d35896440dcb[i], var_d5bb10777af0fdb1.var_7c18d35896440dcb[i + 1]);
        var_fd0a56e53772cdba = var_d5bb10777af0fdb1.var_ff7362b4fb7ddab7[i] + var_d5bb10777af0fdb1.var_d002102fa7e0d9cb[i + 1] - var_c661e5b77c016382 - 1;
        var_d5bb10777af0fdb1.var_4ab02385b70ecb03[i] = var_c661e5b77c016382;
        circlecenter = var_d5bb10777af0fdb1.var_7c18d35896440dcb[i];
        circleradius = var_d5bb10777af0fdb1.circleradius[i];
        var_1cf46931e8999a1 = var_d5bb10777af0fdb1.var_7c18d35896440dcb[i + 1];
        var_17c97f1f748be50e = var_d5bb10777af0fdb1.circleradius[i + 1];
        var_d5bb10777af0fdb1.var_260f61b74d1459ff[i] = function_10a532c516175bbe(circlecenter, var_1cf46931e8999a1, circleradius, var_17c97f1f748be50e, var_fd0a56e53772cdba);
    }
    level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1 = var_d5bb10777af0fdb1;
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x691
// Size: 0x6f
function function_10a532c516175bbe(var_7c472ec4204b05dc, centertarget, var_918d83c6c0649565, var_50d4baf06b853472, maxduration) {
    var_6041996e5ca4b1f3 = var_918d83c6c0649565 - var_50d4baf06b853472;
    var_3e21ca4fffcea5e6 = distance2d(var_7c472ec4204b05dc, centertarget) + var_6041996e5ca4b1f3;
    return int(min(var_3e21ca4fffcea5e6 / level.var_9ced0748cfd1d189.var_81e334fd07982878, maxduration));
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708
// Size: 0x2b
function function_2788e39d9b57d9fb() {
    level.var_b88975a1f2a5e092 = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.var_7c18d35896440dcb[0];
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73a
// Size: 0x16d
function function_82664500e421fe22() {
    level.br_level.br_circlecenters = [];
    level.br_level.br_circleradii = [];
    level.br_level.br_circledelaytimes = [];
    level.br_level.br_circleclosetimes = [];
    var_d5bb10777af0fdb1 = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1;
    function_1949107e97911ea5(0, 0, 0, 0);
    level.br_level.br_circleradii[0] = level.br_level.br_circleradii[0] + 1;
    var_35c9dcaf6de45f41 = var_d5bb10777af0fdb1.var_9da79c80305f58db + var_d5bb10777af0fdb1.var_d002102fa7e0d9cb[0];
    var_4f81729168c0b8a = var_d5bb10777af0fdb1.var_260f61b74d1459ff[0];
    for (i = 0; i < var_d5bb10777af0fdb1.var_c9c7a1dc12875b46; i++) {
        function_1949107e97911ea5(i + 1, i, var_35c9dcaf6de45f41, var_4f81729168c0b8a);
        if (i < var_d5bb10777af0fdb1.var_c9c7a1dc12875b46 - 1) {
            var_35c9dcaf6de45f41 = var_d5bb10777af0fdb1.var_d002102fa7e0d9cb[i + 1] + var_d5bb10777af0fdb1.var_ff7362b4fb7ddab7[i] - var_d5bb10777af0fdb1.var_260f61b74d1459ff[i];
            var_4f81729168c0b8a = var_d5bb10777af0fdb1.var_260f61b74d1459ff[i + 1];
        }
    }
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ae
// Size: 0x115
function function_1949107e97911ea5(circleindex, positionindex, var_35c9dcaf6de45f41, var_4f81729168c0b8a) {
    var_d5bb10777af0fdb1 = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1;
    level.br_level.br_circledelaytimes[circleindex] = var_35c9dcaf6de45f41;
    level.br_level.br_circleclosetimes[circleindex] = var_4f81729168c0b8a;
    level.br_level.br_circleradii[circleindex] = var_d5bb10777af0fdb1.circleradius[positionindex];
    level.br_level.br_circlecenters[circleindex] = var_d5bb10777af0fdb1.var_7c18d35896440dcb[positionindex];
    level.var_b31733f431ed12e0.circles[0].var_8ae269616d09dfc5[circleindex] = var_d5bb10777af0fdb1.var_7c18d35896440dcb[positionindex];
    level.var_b31733f431ed12e0.circles[1].var_8ae269616d09dfc5[circleindex] = var_d5bb10777af0fdb1.var_7c18d35896440dcb[positionindex];
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ca
// Size: 0x1f
function function_29e8194ff7e13e2e(circleindex) {
    return level.var_b31733f431ed12e0.var_55cbe3b0d58b0604;
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f1
// Size: 0x201
function function_931e40c0a6e8719b(var_7b6d5db8cb3c5782) {
    level endon("game_ended");
    level endon("br_stop_multi_circle_objectives");
    if (!istrue(level.var_cb9a9bfbbc8b8a0f)) {
        return;
    }
    setomnvar("ui_br_circle_num", level.var_b31733f431ed12e0.var_209967c144016964);
    namespace_d04031d92bc84201::function_ebfd46aa8754608();
    namespace_d04031d92bc84201::function_74c4ed830065b00c();
    level thread namespace_d04031d92bc84201::function_4c7e6f6847607c99();
    level thread namespace_d04031d92bc84201::function_5d02313c7d7c9d62();
    if (istrue(var_7b6d5db8cb3c5782)) {
        namespace_4b0406965e556711::gameflagwait("infil_animatic_complete");
    }
    level.var_9ced0748cfd1d189.var_b0f77e41b73f0632 = level.var_9ced0748cfd1d189.var_1afd23e03d011ec6;
    setomnvar("ui_br_minimap_radius", level.var_9ced0748cfd1d189.var_1afd23e03d011ec6);
    var_d5bb10777af0fdb1 = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1;
    level.br_circle.var_5b8569581e64d55a = gettime();
    level.br_circle.starttime = gettime();
    level notify("br_circle_set");
    level notify("br_circle_started");
    wait(var_d5bb10777af0fdb1.var_9da79c80305f58db);
    level notify("update_circle_hide");
    for (i = 0; i < var_d5bb10777af0fdb1.var_c9c7a1dc12875b46 - 1; i++) {
        wait(var_d5bb10777af0fdb1.var_d002102fa7e0d9cb[i] - var_d5bb10777af0fdb1.var_4ab02385b70ecb03[i]);
        function_78ca95c1137689e6(i + 1, var_d5bb10777af0fdb1.var_4ab02385b70ecb03[i]);
        wait(var_d5bb10777af0fdb1.var_4ab02385b70ecb03[i]);
        if (i < var_d5bb10777af0fdb1.var_c9c7a1dc12875b46 - 1) {
            level.br_circle.circleindex++;
            level.br_circle.starttime = gettime();
        }
        staticcircle(0);
        thread function_a3eb5d233829a440(i + 1);
        wait(var_d5bb10777af0fdb1.var_ff7362b4fb7ddab7[i]);
        level notify("br_circle_set");
    }
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf9
// Size: 0x1d4
function function_78ca95c1137689e6(var_dcef536353ea980b, duration) {
    level.var_b31733f431ed12e0.var_55cbe3b0d58b0604 = 0;
    var_888577293524a715 = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.var_7c18d35896440dcb[var_dcef536353ea980b];
    var_4a3b04a9deb6b922 = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.circleradius[var_dcef536353ea980b];
    if (level.var_9ced0748cfd1d189.var_ebdbc6f4c094c765) {
        var_4991709acb54032c = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.var_7c18d35896440dcb[var_dcef536353ea980b - 1];
        var_1563b2559ae1197b = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.circleradius[var_dcef536353ea980b - 1];
        var_919b5b92f6f9dd99 = distance2d(var_888577293524a715, var_4991709acb54032c);
        var_e9be70cb585ff69a = (var_1563b2559ae1197b - var_919b5b92f6f9dd99 - var_4a3b04a9deb6b922) / var_1563b2559ae1197b;
        if (var_e9be70cb585ff69a < level.var_9ced0748cfd1d189.var_305a01b53523b8ce) {
            var_a4fbc0922141f271 = level.var_9ced0748cfd1d189.var_305a01b53523b8ce * var_1563b2559ae1197b + var_919b5b92f6f9dd99 - var_1563b2559ae1197b;
            var_fb23773e4ef56cd = (var_a4fbc0922141f271 - var_4a3b04a9deb6b922) / 2;
            var_ffdc18b96eedd636 = var_fb23773e4ef56cd / var_919b5b92f6f9dd99;
            var_3b6bdc41ced85d07 = var_4991709acb54032c[0] - var_888577293524a715[0];
            var_3b6bdb41ced85ad4 = var_4991709acb54032c[1] - var_888577293524a715[1];
            var_888577293524a715 = (var_888577293524a715[0] + var_3b6bdc41ced85d07 * var_ffdc18b96eedd636, var_888577293524a715[1] + var_3b6bdb41ced85ad4 * var_ffdc18b96eedd636, 0);
            var_4a3b04a9deb6b922 = var_4a3b04a9deb6b922 + var_fb23773e4ef56cd;
        }
    }
    function_f8d91790d1f698f2(0, duration, var_888577293524a715, var_4a3b04a9deb6b922);
    thread function_272ddfaeb01d36fc(duration, 1);
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd4
// Size: 0xa7
function function_a3eb5d233829a440(var_dcef536353ea980b) {
    level endon("game_ended");
    level endon("br_stop_multi_circle_objectives");
    var_647b7cd7ece0574a = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.var_260f61b74d1459ff[var_dcef536353ea980b - 1];
    function_c46c9f4152d58c74(0, var_dcef536353ea980b, var_647b7cd7ece0574a);
    function_c46c9f4152d58c74(1, var_dcef536353ea980b, var_647b7cd7ece0574a);
    thread function_272ddfaeb01d36fc(level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.var_ff7362b4fb7ddab7[var_dcef536353ea980b - 1]);
    wait(var_647b7cd7ece0574a);
    staticcircle(1);
    level.var_b31733f431ed12e0.var_55cbe3b0d58b0604 = 1;
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe82
// Size: 0x8e
function staticcircle(circleindex) {
    var_2dcf644323bdfedb = level.var_b31733f431ed12e0.circles[circleindex].var_3ff449a8eec1b966;
    var_2dcf644323bdfedb.var_ddeec615921cc88c.origin = var_2dcf644323bdfedb.var_58308f5095b6080e.origin;
    waitframe();
    namespace_d04031d92bc84201::function_1139f778f794ff98(var_2dcf644323bdfedb.var_46870b6fa8ad4427, var_2dcf644323bdfedb.var_58308f5095b6080e, var_2dcf644323bdfedb.var_ddeec615921cc88c, 999, 0);
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf17
// Size: 0x90
function function_c46c9f4152d58c74(circleindex, var_dcef536353ea980b, duration) {
    level.var_b31733f431ed12e0.var_55cbe3b0d58b0604 = 0;
    targetorigin = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.var_7c18d35896440dcb[var_dcef536353ea980b];
    var_154ef61b7a7f747a = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.circleradius[var_dcef536353ea980b];
    function_f8d91790d1f698f2(circleindex, duration, targetorigin, var_154ef61b7a7f747a);
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfae
// Size: 0x12e
function function_f8d91790d1f698f2(circleindex, duration, position, radius) {
    var_2dcf644323bdfedb = level.var_b31733f431ed12e0.circles[circleindex].var_3ff449a8eec1b966;
    var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin = (position[0], position[1], radius);
    var_2dcf644323bdfedb.var_58308f5095b6080e.origin = var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin;
    var_2dcf644323bdfedb.var_ddeec615921cc88c.origin = var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin;
    if (circleindex == 0) {
        function_edf140306fca3e8b(position, radius);
    }
    if (duration <= 0) {
        duration = 0.001;
    }
    namespace_d04031d92bc84201::function_898ca8fcdf7d6479(var_2dcf644323bdfedb.var_46870b6fa8ad4427, var_2dcf644323bdfedb.var_58308f5095b6080e, var_2dcf644323bdfedb.var_ddeec615921cc88c, var_2dcf644323bdfedb.var_933b2a39ebfd2ad9, duration, 0);
    var_2dcf644323bdfedb.var_46870b6fa8ad4427 brcirclemoveto(position[0], position[1], radius, duration);
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e3
// Size: 0xb5
function function_edf140306fca3e8b(position, radius) {
    var_2dcf644323bdfedb = level.var_b31733f431ed12e0.circles[1].var_3ff449a8eec1b966;
    var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin = (position[0], position[1], radius);
    var_2dcf644323bdfedb.var_58308f5095b6080e.origin = var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin;
    namespace_d04031d92bc84201::function_1139f778f794ff98(var_2dcf644323bdfedb.var_46870b6fa8ad4427, var_2dcf644323bdfedb.var_58308f5095b6080e, var_2dcf644323bdfedb.var_ddeec615921cc88c, 999, 0);
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x119f
// Size: 0x218
function function_628f61246095f688(positionindex, var_71fff10567e5cb68) {
    level notify("br_stop_multi_circle_objectives");
    level.var_b31733f431ed12e0.var_55cbe3b0d58b0604 = 0;
    var_7050c7a80b60748 = level.var_b31733f431ed12e0.circles[0].var_3ff449a8eec1b966.var_46870b6fa8ad4427.origin;
    var_9a0bb8aefc9fb57 = level.var_b31733f431ed12e0.circles[0].var_3ff449a8eec1b966.var_46870b6fa8ad4427.origin[2];
    var_4991709acb54032c = level.var_b31733f431ed12e0.circles[1].var_3ff449a8eec1b966.var_46870b6fa8ad4427.origin;
    var_1563b2559ae1197b = level.var_b31733f431ed12e0.circles[1].var_3ff449a8eec1b966.var_46870b6fa8ad4427.origin[2];
    var_1cf46931e8999a1 = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.var_7c18d35896440dcb[positionindex];
    var_17c97f1f748be50e = level.var_9ced0748cfd1d189.var_d5bb10777af0fdb1.circleradius[positionindex];
    var_c661e5b77c016382 = function_10a532c516175bbe(var_7050c7a80b60748, var_1cf46931e8999a1, var_9a0bb8aefc9fb57, var_17c97f1f748be50e, var_71fff10567e5cb68);
    var_2511192c6ea17576 = function_10a532c516175bbe(var_4991709acb54032c, var_1cf46931e8999a1, var_1563b2559ae1197b, var_17c97f1f748be50e, var_71fff10567e5cb68);
    var_647b7cd7ece0574a = int(max(var_c661e5b77c016382, var_2511192c6ea17576));
    function_c46c9f4152d58c74(0, positionindex, var_647b7cd7ece0574a);
    function_c46c9f4152d58c74(1, positionindex, var_647b7cd7ece0574a);
    thread function_272ddfaeb01d36fc(var_647b7cd7ece0574a);
    wait(var_647b7cd7ece0574a);
    staticcircle(0);
    staticcircle(1);
    level.var_b31733f431ed12e0.var_55cbe3b0d58b0604 = 1;
}

// Namespace namespace_9ced0748cfd1d189/namespace_813f5a035e59565a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13be
// Size: 0x130
function function_272ddfaeb01d36fc(var_661a636dbc7d54b5, var_bdd2033513b6269a) {
    level notify("br_multi_circle_objectives_minimap_zoom");
    level endon("br_multi_circle_objectives_minimap_zoom");
    level endon("game_ended");
    if (istrue(var_bdd2033513b6269a)) {
        var_48d779f8598f6791 = level.var_9ced0748cfd1d189.var_a30bae6d138c2730;
    } else {
        var_48d779f8598f6791 = level.var_9ced0748cfd1d189.var_1afd23e03d011ec6;
    }
    var_d4659de197d07387 = level.var_9ced0748cfd1d189.var_b0f77e41b73f0632;
    if (var_48d779f8598f6791 == var_d4659de197d07387) {
        return;
    }
    var_d533f7d3fb526d13 = 0.05;
    var_7f479bce3abf8b1b = var_661a636dbc7d54b5 / var_d533f7d3fb526d13;
    var_777913b6f66c8417 = int((var_d4659de197d07387 - var_48d779f8598f6791) / var_7f479bce3abf8b1b);
    var_d1f50321d77c76dc = var_d4659de197d07387;
    for (i = 0; i < var_7f479bce3abf8b1b; i++) {
        var_d1f50321d77c76dc = var_d1f50321d77c76dc - var_777913b6f66c8417;
        level.var_9ced0748cfd1d189.var_b0f77e41b73f0632 = var_d1f50321d77c76dc;
        setomnvar("ui_br_minimap_radius", var_d1f50321d77c76dc);
        wait(var_d533f7d3fb526d13);
    }
    setomnvar("ui_br_minimap_radius", var_48d779f8598f6791);
    level.var_9ced0748cfd1d189.var_b0f77e41b73f0632 = var_48d779f8598f6791;
}

