// mwiii decomp prototype
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\trigger.gsc;

#namespace namespace_91faf49cc72f0b47;

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x244
// Size: 0x8a
function function_b8554b5efa2488b0() {
    var_45e51f698992d648 = self;
    var_b55fd7d854233d03 = getent(var_45e51f698992d648.target, "targetname");
    a_e_lights = getentarray("security_light", "targetname");
    var_6a4f1cc271876221 = getentarray("rollup_window_1", "targetname");
    function_b56c65359567813a(a_e_lights, 0);
    function_15e73138168942f(var_6a4f1cc271876221);
    if (isdefined(var_45e51f698992d648) && isdefined(var_b55fd7d854233d03)) {
        function_a67b8af5f3b9e6c8(var_45e51f698992d648, var_b55fd7d854233d03, var_6a4f1cc271876221, a_e_lights);
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d5
// Size: 0x106
function function_95e1d0440e05beae(var_5118606b880c9c9d) {
    switch (var_5118606b880c9c9d) {
    case #"hash_24337a349f9057f5":
        self function_dfb78b3e724ad620(1);
        self sethintstring("MP/SECURITY_ACTIVATE");
        self setcursorhint("HINT_BUTTON");
        self sethintinoperable(0);
        break;
    case #"hash_e867cf0bf08fa2b0":
        self function_dfb78b3e724ad620(1);
        self sethintstring("MP/SECURITY_REBOOTING");
        self setcursorhint("HINT_NOICON");
        self sethintinoperable(1);
        break;
    case #"hash_d9a7b65f9477385c":
        self function_dfb78b3e724ad620(1);
        self sethintstring("MP/SECURITY_DEACTIVATE");
        self setcursorhint("HINT_BUTTON");
        self sethintinoperable(0);
        break;
    case #"hash_35bb36c485686365":
        self function_dfb78b3e724ad620(1);
        self sethintstring("MP/SECURITY_DISABLED");
        self setcursorhint("HINT_NOICON");
        self sethintinoperable(1);
        break;
    default:
        break;
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0x158
function function_a67b8af5f3b9e6c8(var_45e51f698992d648, var_b55fd7d854233d03, var_6a4f1cc271876221, a_e_lights) {
    while (1) {
        var_45e51f698992d648 function_95e1d0440e05beae("deactivated");
        var_b55fd7d854233d03 function_95e1d0440e05beae("deactivated");
        var_45e51f698992d648 thread function_6610d00055855f9f();
        var_b55fd7d854233d03 thread function_6610d00055855f9f();
        level waittill("security_activated");
        var_45e51f698992d648 function_95e1d0440e05beae("rebooting");
        var_b55fd7d854233d03 function_95e1d0440e05beae("rebooting");
        var_85f56e9a9c3b5c96 = spawn("script_model", var_45e51f698992d648.origin);
        var_85f56e9a9c3b5c96 playloopsound("evt_pent_shutter_alarm_loop");
        function_b56c65359567813a(a_e_lights, 1);
        function_1c486f0bbda89a7c(var_6a4f1cc271876221);
        wait(max(2, -1));
        var_85f56e9a9c3b5c96 stopsounds();
        wait(0.1);
        var_85f56e9a9c3b5c96 delete();
        var_45e51f698992d648 function_95e1d0440e05beae("activated");
        var_45e51f698992d648 thread function_8c0ecc0f9e248efc();
        var_b55fd7d854233d03 function_95e1d0440e05beae("activated");
        var_b55fd7d854233d03 function_4f22646b4fb36daa();
        var_b55fd7d854233d03 thread function_8c0ecc0f9e248efc();
        var_b55fd7d854233d03 thread function_6b0b609cf632580c();
        level waittill("security_deactivated");
        var_45e51f698992d648 function_95e1d0440e05beae("rebooting");
        var_b55fd7d854233d03 remove_waypoint();
        var_b55fd7d854233d03 function_95e1d0440e05beae("rebooting");
        function_b56c65359567813a(a_e_lights, 0);
        function_15e73138168942f(var_6a4f1cc271876221);
        wait(max(2, 4));
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x541
// Size: 0x74
function function_b56c65359567813a(a_e_lights, b_turn_on) {
    foreach (e_light in a_e_lights) {
        if (b_turn_on) {
            e_light setlightintensity(0.6);
        } else {
            e_light setlightintensity(0);
        }
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bc
// Size: 0x2e
function function_6610d00055855f9f() {
    level endon("security_activated");
    e_player = self waittill("trigger");
    if (isplayer(e_player)) {
        level notify("security_activated");
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f1
// Size: 0x2e
function function_8c0ecc0f9e248efc() {
    level endon("security_deactivated");
    e_player = self waittill("trigger");
    if (isplayer(e_player)) {
        level notify("security_deactivated");
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x626
// Size: 0x15
function function_6b0b609cf632580c() {
    level endon("security_deactivated");
    wait(30);
    level notify("security_deactivated");
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x642
// Size: 0x5d
function function_15e73138168942f(var_6a4f1cc271876221) {
    foreach (var_50af587713e41b09 in var_6a4f1cc271876221) {
        var_50af587713e41b09 thread function_ec8a822eb48b5e54();
    }
    wait(6);
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a6
// Size: 0x18
function function_ec8a822eb48b5e54() {
    self movez(175, 6);
    wait(6);
    self hide();
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c5
// Size: 0x66
function function_1c486f0bbda89a7c(var_6a4f1cc271876221) {
    foreach (var_50af587713e41b09 in var_6a4f1cc271876221) {
        var_50af587713e41b09 show();
        var_50af587713e41b09 movez(-175, 6);
    }
    wait(6);
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x732
// Size: 0xfe
function function_4f22646b4fb36daa() {
    var_657e98da077c31ce = 200;
    var_1406c49029c3803b = 300;
    var_e260cabe9157b975 = (0, 0, -64);
    var_31038865a09f1f70 = self.origin + var_e260cabe9157b975;
    self.var_e61c947dd774e8f = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    objective_setlabel(self.var_e61c947dd774e8f, "MP_INGAME_ONLY/SECURITY_DEACTIVATE");
    objective_position(self.var_e61c947dd774e8f, var_31038865a09f1f70);
    objective_setzoffset(self.var_e61c947dd774e8f, 90);
    objective_setbackground(self.var_e61c947dd774e8f, 1);
    objective_icon(self.var_e61c947dd774e8f, "icon_waypoint_locked");
    objective_setplayoutro(self.var_e61c947dd774e8f, 0);
    objective_setplayintro(self.var_e61c947dd774e8f, 0);
    objective_state(self.var_e61c947dd774e8f, "current");
    function_c047d7ffe7a83501(self.var_e61c947dd774e8f, var_657e98da077c31ce, var_1406c49029c3803b, 1);
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x837
// Size: 0x27
function remove_waypoint() {
    objective_state(self.var_e61c947dd774e8f, "done");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_e61c947dd774e8f);
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x865
// Size: 0x4c
function function_b52b870c97ccf5c4() {
    var_206de6eee20933a = getentarray("sliding_bookshelf_trig", "script_noteworthy");
    var_75b351416918d890 = getent("sliding_bookshelf", "script_noteworthy");
    if (isdefined(var_206de6eee20933a) && isdefined(var_75b351416918d890)) {
        var_75b351416918d890 thread function_42da2f31f927060c(var_206de6eee20933a);
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b8
// Size: 0x121
function function_42da2f31f927060c(var_206de6eee20933a) {
    if (isdefined(self.target)) {
        var_f09a304ba855fb33 = getent(self.target, "targetname");
        var_f09a304ba855fb33 linkto(self);
    }
    while (1) {
        foreach (var_6f78735e2fb5eb7e in var_206de6eee20933a) {
            var_6f78735e2fb5eb7e function_dfb78b3e724ad620(1);
            var_6f78735e2fb5eb7e sethintstring("MP/DOOR_USE_OPEN");
            var_6f78735e2fb5eb7e setcursorhint("HINT_BUTTON");
            var_6f78735e2fb5eb7e thread function_3e107c8da951fc4c(self);
        }
        self waittill("bookshelf_used");
        foreach (var_6f78735e2fb5eb7e in var_206de6eee20933a) {
            var_6f78735e2fb5eb7e function_dfb78b3e724ad620(0);
        }
        self movex(100, 1);
        wait(11);
        self movex(-100, 1);
        wait(1);
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e0
// Size: 0x2e
function function_3e107c8da951fc4c(var_75b351416918d890) {
    var_75b351416918d890 endon("bookshelf_used");
    e_player = self waittill("trigger");
    var_75b351416918d890 notify("bookshelf_used");
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa15
// Size: 0x74
function function_a26f592a97bf14d0() {
    var_39725c38968e8ea2 = function_f159c10d5cf8f0b4("no_prone_trigger", "script_noteworthy");
    foreach (var_14746754a0f92b39 in var_39725c38968e8ea2) {
        namespace_f1565a2788ab1e89::makeenterexittrigger(var_14746754a0f92b39, &function_cb60cd4afb884862, &function_df2a2bf55e01b1f4);
    }
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa90
// Size: 0x1c
function private function_cb60cd4afb884862(e_player, trigger) {
    e_player allowprone(0);
}

// Namespace namespace_91faf49cc72f0b47/namespace_c8d559a623e8708f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xab3
// Size: 0x1d
function private function_df2a2bf55e01b1f4(e_player, trigger) {
    e_player allowprone(1);
}

