// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_6981400abfcd765c;
#using script_4a6760982b403bad;

#namespace namespace_d48f5ddc4356145f;

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0x33
function function_a6ca80cf4f22e262(var_8dceeda8be90dd95) {
    if (function_94b952789d039abb()) {
        var_1c32a202e5e6e499 = getscriptbundle(var_8dceeda8be90dd95);
        if (isdefined(var_1c32a202e5e6e499)) {
            function_495a84d8124ff118(var_1c32a202e5e6e499);
        }
    }
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x246
// Size: 0x19
function function_5135b05917b91c1b() {
    self.var_45e9d104c0a834c7 = spawnstruct();
    function_60994558e6d2f494(0);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x266
// Size: 0xe8
function private function_495a84d8124ff118(var_3c9993aed2da47e6) {
    level.var_cf6b53e10210d950 = [];
    level.var_e88f11422f545fe2 = [];
    index = 1;
    foreach (bundle in var_3c9993aed2da47e6.var_a43c3448b149524) {
        var_2fb2aed4c21ba3b0 = bundle.ref;
        if (isdefined(var_2fb2aed4c21ba3b0)) {
            var_e98d60032aa37ef6 = spawnstruct();
            var_e98d60032aa37ef6.id = index;
            var_e98d60032aa37ef6.bundle = bundle.bundle;
            level.var_cf6b53e10210d950[var_2fb2aed4c21ba3b0] = var_e98d60032aa37ef6;
            level.var_e88f11422f545fe2[index] = var_2fb2aed4c21ba3b0;
        }
        index++;
    }
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x355
// Size: 0x1c
function function_e4d0f9efe9c2bca1() {
    /#
        assert(isplayer(self));
    #/
    return istrue(self.var_fa35b4a136b27acd);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379
// Size: 0xa8
function function_9e0151baa208fe9e(ref, params) {
    if (!isdefined(params)) {
        params = spawnstruct();
    }
    if (!isdefined(level.var_cf6b53e10210d950)) {
        return;
    }
    /#
        assert(isplayer(self));
    #/
    if (isdefined(params.sound) && params.sound) {
        self playlocalsound("uin_tip_appearance");
    }
    if (isdefined(params.var_c0c66e575a4e28d5)) {
        self.var_c0c66e575a4e28d5 = params.var_c0c66e575a4e28d5;
    }
    function_34d38a99558eb2a2(ref, params.callback, params.duration);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x428
// Size: 0x8b
function private function_34d38a99558eb2a2(ref, callback, duration) {
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    var_4202e8261e8725f2 = function_388a7f4b869568cc(ref);
    if (!isdefined(var_4202e8261e8725f2)) {
        /#
            assertmsg("ftue_tip_showTip_internal() called for ref "" + ref + "" but could not find it in level.ftuetips_table");
        #/
        return;
    }
    function_60994558e6d2f494(var_4202e8261e8725f2);
    self function_45af0f78c1d76035(var_4202e8261e8725f2);
    thread function_3a1f121991c200e3(ref, 0);
    self notify("newtip");
    if (isdefined(duration)) {
        wait(duration);
        function_7fd621b8ba80e652();
    }
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba
// Size: 0x113
function function_f339c5c73d11ea20(ref, var_c1b8ae0865b5f1f7, params) {
    if (!isdefined(ref)) {
        /#
            assertmsg("ftue_tip_completeTip() called for ref "" + ref + "" but could not find it in " + level.var_cf6b53e10210d950);
        #/
        return;
    }
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(params)) {
        params = spawnstruct();
    }
    if (!function_4352a63d3925798b()) {
        function_9e0151baa208fe9e(ref);
        function_d9f9951c566c97e1(1, params.duration);
    }
    if (isdefined(params.sound) && params.sound) {
        sound = "uin_tip_complete";
        if (!var_c1b8ae0865b5f1f7) {
            sound = "uin_tip_failed";
        }
        self playlocalsound(sound);
    }
    function_508d3de0ee3046dd(ref, var_c1b8ae0865b5f1f7);
    result = "SUCCESS";
    if (!var_c1b8ae0865b5f1f7) {
        result = "FAILED";
    }
    thread function_3a1f121991c200e3(ref, 1, result);
    function_d9f9951c566c97e1(0.8, params.duration);
    function_7fd621b8ba80e652(params.duration);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4
// Size: 0x53
function function_6fba31415caeee6e(var_64b90336285c86b6, params) {
    var_34e326b47a846f0b = function_91e510bcc622bfd0();
    if (var_34e326b47a846f0b == 0) {
        return;
    }
    var_4b2538e850df3357 = function_bf44b38db65d0bf9(var_34e326b47a846f0b);
    /#
        assert(isdefined(var_4b2538e850df3357));
    #/
    function_f339c5c73d11ea20(var_4b2538e850df3357, var_64b90336285c86b6, params);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x40
function function_508d3de0ee3046dd(ref, var_c1b8ae0865b5f1f7) {
    if (!isdefined(level.var_cf6b53e10210d950)) {
        return;
    }
    /#
        assert(isplayer(self));
    #/
    function_ff85bc42d440477b(ref, function_63e0c93eb50543f(var_c1b8ae0865b5f1f7));
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x675
// Size: 0x26
function private function_ff85bc42d440477b(ref, newstate) {
    if (!isplayer(self)) {
        return;
    }
    self function_1807967ea2130c2d(newstate);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6a2
// Size: 0x2d
function private function_63e0c93eb50543f(var_c1b8ae0865b5f1f7) {
    newstate = 0;
    if (isdefined(var_c1b8ae0865b5f1f7)) {
        if (var_c1b8ae0865b5f1f7) {
            newstate = 1;
        } else {
            newstate = 2;
        }
    }
    return newstate;
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d7
// Size: 0x28
function function_7fd621b8ba80e652(var_4048e94312776eed) {
    function_60994558e6d2f494(0);
    self function_4eb77980affdbefb();
    function_d9f9951c566c97e1(0.5, var_4048e94312776eed);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x706
// Size: 0x30
function private function_d9f9951c566c97e1(var_77bd26029c485466, var_4048e94312776eed) {
    waittime = var_77bd26029c485466;
    if (isdefined(var_4048e94312776eed)) {
        waittime = var_4048e94312776eed;
    }
    if (waittime > 0) {
        wait(waittime);
    }
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73d
// Size: 0x1a
function function_36939d27ae6df257(callback) {
    if (isdefined(callback)) {
        thread function_ff3f2188762b9896(callback);
    }
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75e
// Size: 0x93
function private function_ff3f2188762b9896(callback) {
    self endon("disconnect");
    level endon("game_ended");
    if (!isdefined(self.var_45e9d104c0a834c7)) {
        return;
    }
    if (!isdefined(callback)) {
        return;
    }
    while (1) {
        value = event = self waittill("luinotifyserver");
        if (isdefined(event) && event == "ftuetip_completed") {
            if (isdefined(value) && value == function_91e510bcc622bfd0()) {
                var_4b2538e850df3357 = function_bf44b38db65d0bf9(value);
                if (isdefined(var_4b2538e850df3357)) {
                    self [[ callback ]](var_4b2538e850df3357);
                    return;
                }
            }
        }
    }
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f8
// Size: 0x17
function private function_bf44b38db65d0bf9(index) {
    return level.var_e88f11422f545fe2[index];
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x817
// Size: 0x2d
function private function_388a7f4b869568cc(var_f325d04ebcba01d4) {
    id = level.var_cf6b53e10210d950[var_f325d04ebcba01d4].id;
    return id;
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c
// Size: 0x2d
function function_7052cffee37e6327(var_f325d04ebcba01d4) {
    id = level.var_cf6b53e10210d950[var_f325d04ebcba01d4].bundle;
    return id;
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x881
// Size: 0x18
function private function_4352a63d3925798b() {
    return self.var_45e9d104c0a834c7.var_1624b445a428c297 != 0;
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a1
// Size: 0x16
function private function_91e510bcc622bfd0() {
    return self.var_45e9d104c0a834c7.var_1624b445a428c297;
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8bf
// Size: 0x21
function private function_60994558e6d2f494(var_bf334f5702551108) {
    self.var_45e9d104c0a834c7.var_1624b445a428c297 = var_bf334f5702551108;
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e7
// Size: 0x121
function private function_3a1f121991c200e3(ref, finished, result) {
    var_34e326b47a846f0b = function_7052cffee37e6327(ref);
    var_1656b06379e3e9d8 = [0:#"hash_3c8456c54e76812c", 1:#"hash_fdb2304a21c8dace", 2:#"hash_473b9dcba8d00879", 3:#"hash_a8be9518a2a9868", 4:#"hash_80f6033e24a2bf4"];
    var_5814d27874b48e54 = function_50f8a8f765bad85e(function_2ef675c13ca1c4af(%"hash_6b016976aff9ae9f", var_34e326b47a846f0b), var_1656b06379e3e9d8);
    /#
        assertex(isdefined(var_5814d27874b48e54), "Could not find data for tip id " + var_34e326b47a846f0b);
    #/
    if (!function_acbac8f30b95d690(var_5814d27874b48e54)) {
        return;
    }
    var_5814d27874b48e54.player = self;
    callback = "mobile_ftue_step_start";
    if (istrue(var_5814d27874b48e54.var_bbf88c7737619325)) {
        var_5814d27874b48e54.result = "SUCCESS";
        callback = "mobile_ftue_step_single";
    } else if (finished) {
        var_5814d27874b48e54.result = result;
        callback = "mobile_ftue_step_finished";
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836(callback, var_5814d27874b48e54);
}

// Namespace namespace_d48f5ddc4356145f/namespace_b1d233abf1e31488
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa0f
// Size: 0x2d
function private function_acbac8f30b95d690(var_5814d27874b48e54) {
    return isdefined(var_5814d27874b48e54.var_42bb97b677759800) && var_5814d27874b48e54.var_42bb97b677759800 != "";
}

