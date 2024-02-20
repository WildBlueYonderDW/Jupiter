// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_72ef6b9f0cf1f55a;
#using scripts\mp\flags.gsc;

#namespace namespace_e06040b33bcef19;

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff
// Size: 0xc1
function player_init(player, var_8950ba0ebceac37b, var_639d14fd4e8eab82, pos_x, pos_y) {
    /#
        assert(isdefined(player));
    #/
    if (!player namespace_373fee410d5055ba::function_ada0825249682644(var_8950ba0ebceac37b)) {
        player.var_f2b3eb0f3505f5af = spawnstruct();
        player.var_f2b3eb0f3505f5af.objectives = [];
        player.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b = var_8950ba0ebceac37b;
        player.var_f2b3eb0f3505f5af.init_complete = 0;
        player namespace_373fee410d5055ba::function_90de31b2cbef19f9(var_8950ba0ebceac37b, var_639d14fd4e8eab82);
    }
    player thread function_2fe4757104986d63(var_8950ba0ebceac37b);
    player thread function_efca2517e81e2996(var_8950ba0ebceac37b, pos_x, pos_y);
    player thread function_372a8c2173c66c11();
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7
// Size: 0x77
function function_2fe4757104986d63(var_8950ba0ebceac37b) {
    self endon("disconnect");
    player = self;
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    player namespace_373fee410d5055ba::function_af4f62f0f944a8f1(var_8950ba0ebceac37b, "INIT");
    wait(1);
    if (isdefined(player) && isdefined(player.var_f2b3eb0f3505f5af)) {
        player.var_f2b3eb0f3505f5af.init_complete = 1;
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345
// Size: 0x4c
function function_efca2517e81e2996(var_8950ba0ebceac37b, pos_x, pos_y) {
    self endon("disconnect");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    wait(1);
    namespace_373fee410d5055ba::function_f4c37324750dc183(var_8950ba0ebceac37b, pos_x, pos_y, 0, 0);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398
// Size: 0x134
function add_objective(uid, owner, var_271db279154a39ad, var_a7c99b4e402f44ff, is_completed, var_4f1c7c8ad5d5b9e4) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(var_a7c99b4e402f44ff));
    #/
    /#
        assert(isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives));
    #/
    if (isdefined(self.var_f2b3eb0f3505f5af.objectives[uid])) {
        /#
            println("<unknown string>" + uid + "<unknown string>");
        #/
        return;
    }
    objective = spawnstruct();
    objective.uid = uid;
    objective.owner = owner;
    objective.var_271db279154a39ad = var_271db279154a39ad;
    objective.var_a7c99b4e402f44ff = var_a7c99b4e402f44ff;
    objective.is_completed = is_completed;
    objective.var_a1bb69f4fd589029 = 0;
    objective.var_4f1c7c8ad5d5b9e4 = var_4f1c7c8ad5d5b9e4;
    self.var_f2b3eb0f3505f5af.objectives[uid] = objective;
    function_298da874a45fb34c(uid);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3
// Size: 0x84
function function_2d15427fd33a134d(uid) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(uid));
    #/
    if (!isdefined(self.var_f2b3eb0f3505f5af) || !isdefined(self.var_f2b3eb0f3505f5af.objectives)) {
        return;
    }
    var_35eb8e862aa328c5 = self.var_f2b3eb0f3505f5af.objectives[uid];
    if (!isdefined(var_35eb8e862aa328c5)) {
        return;
    }
    self.var_f2b3eb0f3505f5af.objectives[uid] = undefined;
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e
// Size: 0xba
function function_c0257db3a941f1b6(uid, is_successful) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(uid));
    #/
    if (!isdefined(self.var_f2b3eb0f3505f5af) || !isdefined(self.var_f2b3eb0f3505f5af.objectives)) {
        return;
    }
    var_1d242f4c62100b9a = self.var_f2b3eb0f3505f5af.objectives[uid];
    if (!isdefined(var_1d242f4c62100b9a)) {
        return;
    }
    self.var_f2b3eb0f3505f5af.objectives[uid].is_completed = 1;
    self.var_f2b3eb0f3505f5af.objectives[uid].is_successful = is_successful;
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61f
// Size: 0x71
function function_751ff808e0219b4f(prefix) {
    if (!isdefined(level.var_f2b3eb0f3505f5af)) {
        level.var_f2b3eb0f3505f5af = spawnstruct();
        level.var_f2b3eb0f3505f5af.var_f42eade64ac30200 = 0;
    }
    uid = prefix + level.var_f2b3eb0f3505f5af.var_f42eade64ac30200;
    level.var_f2b3eb0f3505f5af.var_f42eade64ac30200++;
    return uid;
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x698
// Size: 0x91
function function_4c43cb3c8fcb9b87() {
    /#
        assert(isdefined(self));
    #/
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b)) {
        namespace_373fee410d5055ba::function_d28fa5295a04d555(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b, "FADE_OUT");
        self.var_f2b3eb0f3505f5af.var_301e67ae9379349e = undefined;
        self.var_f2b3eb0f3505f5af.var_cf707e989930334d = undefined;
        self.var_f2b3eb0f3505f5af.var_1710c224de197b0a = 0.5;
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x730
// Size: 0x123
function function_3b4b24bbf0814ee6(uid, var_a7c99b4e402f44ff, is_completed, is_successful) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(var_a7c99b4e402f44ff));
    #/
    /#
        assert(isdefined(is_completed));
    #/
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b)) {
        function_d6b2ade17408586f(self);
        namespace_373fee410d5055ba::function_af4f62f0f944a8f1(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b, var_a7c99b4e402f44ff);
        new_state = "FADE_IN_INCOMPLETE";
        if (istrue(is_completed) && isdefined(is_successful)) {
            new_state = ter_op(istrue(is_successful), "FADE_IN_SUCCESSFUL", "FADE_IN_FAILURE");
        }
        namespace_373fee410d5055ba::function_d28fa5295a04d555(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b, new_state);
        function_8374758ea95f4353(self, uid);
        self.var_f2b3eb0f3505f5af.var_301e67ae9379349e = uid;
        self.var_f2b3eb0f3505f5af.var_cf707e989930334d = is_completed;
        self.var_f2b3eb0f3505f5af.var_1710c224de197b0a = 0.5;
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85a
// Size: 0xe1
function function_7fcc6994dd0b0374(uid, var_a7c99b4e402f44ff) {
    /#
        assert(isdefined(uid));
    #/
    /#
        assert(isdefined(var_a7c99b4e402f44ff));
    #/
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b)) {
        function_d6b2ade17408586f(self);
        namespace_373fee410d5055ba::function_af4f62f0f944a8f1(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b, var_a7c99b4e402f44ff);
        namespace_373fee410d5055ba::function_d28fa5295a04d555(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b, "SUB_OBJECTIVE_UPDATE");
        function_8374758ea95f4353(self, uid);
        self.var_f2b3eb0f3505f5af.var_301e67ae9379349e = uid;
        self.var_f2b3eb0f3505f5af.var_cf707e989930334d = 0;
        self.var_f2b3eb0f3505f5af.var_1710c224de197b0a = level.framedurationseconds;
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x942
// Size: 0xb4
function function_d463ec55daebbd66(is_successful) {
    /#
        assert(isdefined(self));
    #/
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b)) {
        new_state = ter_op(istrue(is_successful), "INCOMPLETE_TO_SUCCESSFUL", "INCOMPLETE_TO_FAILURE");
        namespace_373fee410d5055ba::function_d28fa5295a04d555(self.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b, new_state);
    }
    if (isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
        uid = self.var_f2b3eb0f3505f5af.var_301e67ae9379349e;
        thread function_fbc454b8a9e01274(uid, 2);
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fd
// Size: 0x80
function function_fbc454b8a9e01274(uid, var_76bb91adcc07335f) {
    var_6ec9743461d67a13 = 0.5 * var_76bb91adcc07335f;
    wait(var_6ec9743461d67a13);
    if (isdefined(self.var_f2b3eb0f3505f5af) && isdefined(self.var_f2b3eb0f3505f5af.objectives)) {
        obj = self.var_f2b3eb0f3505f5af.objectives[uid];
        if (isdefined(obj)) {
            obj.var_a1bb69f4fd589029 = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa84
// Size: 0xc2
function function_41e69df7eeb5c17b(player, uid, totalcount) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        if (isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e) && player.var_f2b3eb0f3505f5af.var_301e67ae9379349e == uid) {
            function_9c9dc0bc7ea4a64e(player, totalcount);
        } else {
            objective = player.var_f2b3eb0f3505f5af.objectives[uid];
            objective.var_bcf3e84c9da349ba = totalcount;
            objective.var_9c9dc0bc7ea4a64e = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb4d
// Size: 0x21
function private function_9c9dc0bc7ea4a64e(player, totalcount) {
    player setclientomnvar("obj_tracker_counter_set", totalcount);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb75
// Size: 0xc2
function function_a92e843c02dc6414(player, uid, var_80b00942b8f63191) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        objective = player.var_f2b3eb0f3505f5af.objectives[uid];
        objective.var_71c3c229488a0643 = var_80b00942b8f63191;
        if (isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e) && player.var_f2b3eb0f3505f5af.var_301e67ae9379349e == uid) {
            function_b768c68c436ee397(player, var_80b00942b8f63191);
        } else {
            objective.var_b768c68c436ee397 = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc3e
// Size: 0x21
function private function_b768c68c436ee397(player, var_80b00942b8f63191) {
    player setclientomnvar("obj_tracker_counter_update", var_80b00942b8f63191);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc66
// Size: 0x28
function function_15010f27afb2d1e7(player) {
    player setclientomnvar("obj_tracker_counter_set", -1);
    player setclientomnvar("obj_tracker_counter_update", -1);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc95
// Size: 0xc2
function function_3e38fac7ccd01903(player, uid, progress) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        if (isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e) && player.var_f2b3eb0f3505f5af.var_301e67ae9379349e == uid) {
            function_6101ef6fc344c2ec(player, progress);
        } else {
            objective = player.var_f2b3eb0f3505f5af.objectives[uid];
            objective.progress_bar = progress;
            objective.var_6101ef6fc344c2ec = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd5e
// Size: 0x21
function private function_6101ef6fc344c2ec(player, progress) {
    player setclientomnvar("obj_tracker_progress_bar_update", progress);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd86
// Size: 0xc2
function function_c718b293158313c9(player, uid, state) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        if (isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e) && player.var_f2b3eb0f3505f5af.var_301e67ae9379349e == uid) {
            function_2f329f5bf42743ea(player, state);
        } else {
            objective = player.var_f2b3eb0f3505f5af.objectives[uid];
            objective.var_514bedd0e971174e = state;
            objective.var_2f329f5bf42743ea = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe4f
// Size: 0x21
function private function_2f329f5bf42743ea(player, state) {
    player setclientomnvar("obj_tracker_progress_bar_state", state);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe77
// Size: 0xc2
function function_c1edc8a24a424e72(player, uid, var_a6886ca2067e585a) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        if (isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e) && player.var_f2b3eb0f3505f5af.var_301e67ae9379349e == uid) {
            function_29e38432836c3014(player, var_a6886ca2067e585a);
        } else {
            objective = player.var_f2b3eb0f3505f5af.objectives[uid];
            objective.var_1761ad058c737404 = var_a6886ca2067e585a;
            objective.var_fa5876e527b19b0d = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf40
// Size: 0x21
function private function_29e38432836c3014(player, var_a6886ca2067e585a) {
    player setclientomnvar("obj_tracker_progress_bar_show", var_a6886ca2067e585a);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x33
function function_c69e50fb723f0078(player) {
    player setclientomnvar("obj_tracker_progress_bar_update", 0);
    player setclientomnvar("obj_tracker_progress_bar_show", 0);
    player setclientomnvar("obj_tracker_progress_bar_state", 0);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa2
// Size: 0xc2
function function_5d2c66d2ea6e4267(player, uid, endtime) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        if (isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e) && player.var_f2b3eb0f3505f5af.var_301e67ae9379349e == uid) {
            function_8024da9ac487036a(player, endtime);
        } else {
            objective = player.var_f2b3eb0f3505f5af.objectives[uid];
            objective.var_f6c472c2a6f097fc = endtime;
            objective.update_timer = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106b
// Size: 0x21
function function_8024da9ac487036a(player, endtime) {
    player setclientomnvar("obj_tracker_timer_end_time", endtime);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1093
// Size: 0x19
function function_f43cc336eb444616(player) {
    player setclientomnvar("obj_tracker_timer_end_time", 0);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b3
// Size: 0xc2
function function_8733c2caee45c023(player, uid, icon) {
    if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        if (isdefined(player.var_f2b3eb0f3505f5af.var_301e67ae9379349e) && player.var_f2b3eb0f3505f5af.var_301e67ae9379349e == uid) {
            function_1af7acac2395738(player, icon);
        } else {
            objective = player.var_f2b3eb0f3505f5af.objectives[uid];
            objective.var_909886afe973be13 = icon;
            objective.var_1af7acac2395738 = 1;
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x117c
// Size: 0x21
function private function_1af7acac2395738(player, icon) {
    player setclientomnvar("obj_tracker_icon_update", icon);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a4
// Size: 0x1a
function function_b927913602553934(player) {
    player setclientomnvar("obj_tracker_icon_update", -1);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c5
// Size: 0x1e1
function function_8374758ea95f4353(player, uid) {
    if (!isdefined(player.var_f2b3eb0f3505f5af.objectives)) {
        return;
    }
    objective = player.var_f2b3eb0f3505f5af.objectives[uid];
    if (isdefined(objective)) {
        if (istrue(objective.var_1af7acac2395738)) {
            function_1af7acac2395738(player, objective.var_909886afe973be13);
            objective.var_1af7acac2395738 = 0;
        }
        if (istrue(objective.var_9c9dc0bc7ea4a64e) && isdefined(objective.var_bcf3e84c9da349ba)) {
            function_9c9dc0bc7ea4a64e(player, objective.var_bcf3e84c9da349ba);
            objective.var_9c9dc0bc7ea4a64e = 0;
        }
        if (istrue(objective.var_b768c68c436ee397) && isdefined(objective.var_71c3c229488a0643)) {
            function_b768c68c436ee397(player, objective.var_71c3c229488a0643);
            objective.var_b768c68c436ee397 = 0;
        }
        if (istrue(objective.var_6101ef6fc344c2ec) && isdefined(objective.progress_bar)) {
            function_6101ef6fc344c2ec(player, objective.progress_bar);
            objective.var_6101ef6fc344c2ec = 0;
        }
        if (istrue(objective.var_2f329f5bf42743ea) && isdefined(objective.var_514bedd0e971174e)) {
            function_2f329f5bf42743ea(player, objective.var_514bedd0e971174e);
            objective.var_2f329f5bf42743ea = 0;
        }
        if (istrue(objective.var_fa5876e527b19b0d)) {
            function_29e38432836c3014(player, objective.var_1761ad058c737404);
            objective.var_fa5876e527b19b0d = 0;
        }
        if (istrue(objective.update_timer) && isdefined(objective.var_f6c472c2a6f097fc)) {
            function_8024da9ac487036a(player, objective.var_f6c472c2a6f097fc);
        }
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ad
// Size: 0x1c
function function_d6b2ade17408586f(player) {
    function_b927913602553934(player);
    function_c69e50fb723f0078(player);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d0
// Size: 0xc3
function function_298da874a45fb34c(uid) {
    if (!isdefined(self.var_f2b3eb0f3505f5af)) {
        return;
    }
    var_9579fa812f7e0613 = spawnstruct();
    var_9579fa812f7e0613.uid = uid;
    if (!isdefined(self.var_f2b3eb0f3505f5af.var_2a31279df671975)) {
        self.var_f2b3eb0f3505f5af.var_2a31279df671975 = var_9579fa812f7e0613;
        self.var_f2b3eb0f3505f5af.var_2b9d584de2e49065 = var_9579fa812f7e0613;
        thread function_f61660544e4b572b();
    } else {
        var_3d3ec2721aee2e4d = self.var_f2b3eb0f3505f5af.var_2b9d584de2e49065;
        var_3d3ec2721aee2e4d.var_15723b28e06b7bbe = var_9579fa812f7e0613;
        self.var_f2b3eb0f3505f5af.var_2b9d584de2e49065 = var_9579fa812f7e0613;
    }
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149a
// Size: 0xfa
function function_f61660544e4b572b() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("clear_obj_queue");
    var_d0ed7628500fde62 = level.framedurationseconds;
    while (isdefined(self.var_f2b3eb0f3505f5af.var_2a31279df671975)) {
        if (istrue(self.var_f2b3eb0f3505f5af.init_complete)) {
            if (isdefined(self.var_f2b3eb0f3505f5af.var_301e67ae9379349e)) {
                var_301e67ae9379349e = self.var_f2b3eb0f3505f5af.var_301e67ae9379349e;
                var_ab7ba5afaa592589 = self.var_f2b3eb0f3505f5af.objectives[var_301e67ae9379349e];
                if (istrue(var_ab7ba5afaa592589.is_completed) && istrue(var_ab7ba5afaa592589.var_a1bb69f4fd589029)) {
                    wait(3);
                    function_7c1e7dd73e60601c();
                }
            } else {
                function_7c1e7dd73e60601c();
            }
        }
        wait(var_d0ed7628500fde62);
    }
    self.var_f2b3eb0f3505f5af.var_2b9d584de2e49065 = undefined;
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159b
// Size: 0x5f
function function_7c1e7dd73e60601c() {
    obj = self.var_f2b3eb0f3505f5af.var_2a31279df671975;
    self.var_f2b3eb0f3505f5af.var_8489c1287642b709 = obj.uid;
    self.var_f2b3eb0f3505f5af.var_2a31279df671975 = obj.var_15723b28e06b7bbe;
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1601
// Size: 0x7b
function clear_obj_queue() {
    self notify("clear_obj_queue");
    var_15723b28e06b7bbe = self.var_f2b3eb0f3505f5af.var_2a31279df671975;
    while (isdefined(var_15723b28e06b7bbe)) {
        current_obj = var_15723b28e06b7bbe;
        var_15723b28e06b7bbe = current_obj.var_15723b28e06b7bbe;
        current_obj.var_15723b28e06b7bbe = undefined;
    }
    self.var_f2b3eb0f3505f5af.var_2a31279df671975 = undefined;
    self.var_f2b3eb0f3505f5af.var_2b9d584de2e49065 = undefined;
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1683
// Size: 0xa5
function private function_372a8c2173c66c11() {
    level endon("game_ended");
    self endon("disconnect");
    player = self;
    while (1) {
        if (!isdefined(player)) {
            break;
        }
        if (isdefined(level.var_ee1c5b2643a1c2f9)) {
            player [[ level.var_ee1c5b2643a1c2f9 ]]();
        }
        var_d0ed7628500fde62 = level.framedurationseconds;
        if (isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.var_1710c224de197b0a)) {
            var_d0ed7628500fde62 = player.var_f2b3eb0f3505f5af.var_1710c224de197b0a;
        }
        wait(var_d0ed7628500fde62);
    }
    function_f979eb22c4cee76d(player);
}

// Namespace namespace_e06040b33bcef19/namespace_c98199706c89bf3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172f
// Size: 0x8a
function function_f979eb22c4cee76d(player) {
    if (isdefined(player) && isdefined(player.var_f2b3eb0f3505f5af) && isdefined(player.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b)) {
        if (player namespace_373fee410d5055ba::function_ada0825249682644(player.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b)) {
            player namespace_373fee410d5055ba::function_fb3c9a259f146781(player.var_f2b3eb0f3505f5af.var_8950ba0ebceac37b);
        }
        player clear_obj_queue();
        player.var_f2b3eb0f3505f5af = undefined;
    }
}

