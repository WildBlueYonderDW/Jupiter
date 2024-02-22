// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_6617e2f2bb62b52b;
#using script_24f248b33b79e48d;
#using script_41387eecc35b88bf;
#using script_72ef6b9f0cf1f55a;
#using script_413d0426f154bd91;

#namespace namespace_20c011482c0cdeb0;

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371
// Size: 0x5e
function function_16fe68fcacc54f0f() {
    if (!function_ada0825249682644("string_messaging")) {
        function_90de31b2cbef19f9("string_messaging", "scripted_widget_objective_group");
    }
    if (!isdefined(self.var_92f4eecabdc55527)) {
        function_52eefbdaca62890f();
    }
    if (!isdefined(self.var_f950fdb9893b4448)) {
        function_5818764082f27b98();
    }
    if (!isdefined(self.var_10ef8425f61dad4c)) {
        function_472f3ec43b453640();
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d6
// Size: 0xcb
function function_52eefbdaca62890f() {
    self.var_e606088079f4b1aa = [];
    self.var_92f4eecabdc55527 = [];
    for (i = 0; i < 2; i++) {
        var_5835392cd585a7ac = spawnstruct();
        var_5835392cd585a7ac.idx = i;
        var_11b0b741637704b5 = 6 + i;
        var_5835392cd585a7ac.var_10c8d71bc8626dfc = "objective_param_" + var_11b0b741637704b5;
        var_5835392cd585a7ac.var_a45e383a1223c992 = "objective_count_" + var_11b0b741637704b5;
        var_5835392cd585a7ac.var_a45e373a1223c75f = "objective_max_count_" + var_11b0b741637704b5;
        var_5835392cd585a7ac.var_1cd064e212d04ea0 = "objective_state_" + var_11b0b741637704b5;
        var_5835392cd585a7ac thread function_2d6129b5199a8578(self);
        self.var_e606088079f4b1aa = array_add(self.var_e606088079f4b1aa, var_5835392cd585a7ac);
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0xcb
function function_472f3ec43b453640() {
    self.var_eb666c0aadcb83f = [];
    self.var_10ef8425f61dad4c = [];
    for (i = 0; i < 2; i++) {
        dialog = spawnstruct();
        dialog.idx = i;
        var_11b0b741637704b5 = 8 + i;
        dialog.var_10c8d71bc8626dfc = "objective_param_" + var_11b0b741637704b5;
        dialog.var_a45e383a1223c992 = "objective_count_" + var_11b0b741637704b5;
        dialog.var_a45e373a1223c75f = "objective_max_count_" + var_11b0b741637704b5;
        dialog.var_1cd064e212d04ea0 = "objective_state_" + var_11b0b741637704b5;
        dialog thread function_135c6d3761c72e5(self);
        self.var_eb666c0aadcb83f = array_add(self.var_eb666c0aadcb83f, dialog);
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x347
function function_33b31258dfa4019e(broadcast, message) {
    var_7bf6ef44012436e7 = spawnstruct();
    var_7bf6ef44012436e7.uniqueid = broadcast function_cf54c2c8650d9688();
    if (isnumber(var_7bf6ef44012436e7.uniqueid)) {
        var_7bf6ef44012436e7.uniqueid = string(var_7bf6ef44012436e7.uniqueid);
    }
    var_7bf6ef44012436e7.groupid = broadcast function_178a0ef658e52420();
    if (isnumber(var_7bf6ef44012436e7.groupid)) {
        var_7bf6ef44012436e7.groupid = string(var_7bf6ef44012436e7.groupid);
    }
    var_e4b329e4ecea4119 = broadcast function_c0e15a98cb263ae6();
    var_7bf6ef44012436e7.priority = var_e4b329e4ecea4119;
    var_7bf6ef44012436e7.var_40d7bdeb3c285019 = var_e4b329e4ecea4119;
    var_7bf6ef44012436e7.param = function_2756e9e9dc98a709(message);
    var_e224abe1b8496ede = function_b683ad721a792a8e(message);
    var_291b4a38da6ea2e6 = var_e224abe1b8496ede.var_9c774b4866e33235;
    var_425fd88686e6fbe = function_4e3ccf5ebd81daea(message);
    if (var_425fd88686e6fbe == "StringMessagingUtil_Splash") {
        switch (var_291b4a38da6ea2e6) {
        case #"hash_a30f8a4037eef549":
            var_7bf6ef44012436e7.state = "show_title_toast";
            break;
        case #"hash_176327485b96c4a9":
            var_7bf6ef44012436e7.state = "show_desc_toast";
            break;
        case #"hash_e2bf296211079750":
            var_7bf6ef44012436e7.state = "success";
            break;
        case #"hash_c70936445ab69671":
            var_7bf6ef44012436e7.state = "failure";
            break;
        default:
            var_7bf6ef44012436e7.state = "show_title_toast";
            break;
        }
    } else if (var_425fd88686e6fbe == "StringMessagingUtil_Dialog") {
        switch (var_291b4a38da6ea2e6) {
        case #"hash_a30f8a4037eef549":
            var_7bf6ef44012436e7.state = "show_title_dialog";
            break;
        case #"hash_176327485b96c4a9":
            var_7bf6ef44012436e7.state = "show_desc_dialog";
            break;
        case #"hash_e2bf296211079750":
            var_7bf6ef44012436e7.state = "success";
            break;
        case #"hash_c70936445ab69671":
            var_7bf6ef44012436e7.state = "failure";
            break;
        default:
            var_7bf6ef44012436e7.state = "show_title_dialog";
            break;
        }
    } else {
        switch (var_291b4a38da6ea2e6) {
        case #"hash_a30f8a4037eef549":
            var_7bf6ef44012436e7.state = "show_title";
            break;
        case #"hash_176327485b96c4a9":
            var_7bf6ef44012436e7.state = "show_desc";
            break;
        case #"hash_e2bf296211079750":
            var_7bf6ef44012436e7.state = "success";
            break;
        case #"hash_c70936445ab69671":
            var_7bf6ef44012436e7.state = "failure";
            break;
        default:
            var_7bf6ef44012436e7.state = "show_title";
            break;
        }
    }
    function_a089f504ca0b69(broadcast, message, var_7bf6ef44012436e7);
    return var_7bf6ef44012436e7;
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c9
// Size: 0x149
function private function_a089f504ca0b69(broadcast, var_479a4f2240611b51, var_f2fbc144bdaf1629) {
    var_fba0765ddf2a220f = 0;
    var_2f0f46533ea736d6 = 0;
    var_949db43ec6f96c1e = function_684411bce1d1c8bc(broadcast, var_479a4f2240611b51, var_fba0765ddf2a220f);
    while (isdefined(var_949db43ec6f96c1e) && var_2f0f46533ea736d6 < 2) {
        if (var_949db43ec6f96c1e.type == "ProgressTracker") {
            var_5414a0c8b564c288 = var_949db43ec6f96c1e.value;
            var_282d8fbc14c52547 = function_298a9e5ee57b3737(var_949db43ec6f96c1e.format, var_5414a0c8b564c288.var_cc3e7fbaface5a17, var_5414a0c8b564c288.var_621cb2c0d9b1cdae, var_5414a0c8b564c288.var_b76b3aee05993635);
            if (isdefined(var_282d8fbc14c52547[0])) {
                var_de55a99e4d89d8c4 = function_9b777cc810bb4b7f(var_f2fbc144bdaf1629, var_282d8fbc14c52547[0], "Integer", var_2f0f46533ea736d6);
                if (var_de55a99e4d89d8c4) {
                    var_2f0f46533ea736d6++;
                }
            }
            if (isdefined(var_282d8fbc14c52547[1])) {
                var_de55a99e4d89d8c4 = function_9b777cc810bb4b7f(var_f2fbc144bdaf1629, var_282d8fbc14c52547[1], "Integer", var_2f0f46533ea736d6);
                if (var_de55a99e4d89d8c4) {
                    var_2f0f46533ea736d6++;
                }
            }
        } else {
            var_de55a99e4d89d8c4 = function_9b777cc810bb4b7f(var_f2fbc144bdaf1629, var_949db43ec6f96c1e.value, var_949db43ec6f96c1e.type, var_2f0f46533ea736d6);
            if (var_de55a99e4d89d8c4) {
                var_2f0f46533ea736d6++;
            }
        }
        var_fba0765ddf2a220f++;
        var_949db43ec6f96c1e = function_684411bce1d1c8bc(broadcast, var_479a4f2240611b51, var_fba0765ddf2a220f);
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa19
// Size: 0x7b
function private function_9b777cc810bb4b7f(var_3dce99648a5de321, value, type, index) {
    if (index < 2) {
        if (type == "Integer" || type == "Float") {
            if (index == 0) {
                var_3dce99648a5de321.data1 = int(value);
                return 1;
            } else if (index == 1) {
                var_3dce99648a5de321.data2 = int(value);
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9c
// Size: 0xe3
function function_8aed3f7a425cb7f9(players, var_67d14e776339d361) {
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        foreach (message in player.var_92f4eecabdc55527) {
            if (var_67d14e776339d361.uniqueid == message.uniqueid) {
                message.var_e9a2d4d493e53ce3 = 0;
            }
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb86
// Size: 0xe3
function function_cf9e932200fe6f5a(players, var_67d14e776339d361) {
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        foreach (message in player.var_10ef8425f61dad4c) {
            if (var_67d14e776339d361.uniqueid == message.uniqueid) {
                message.var_e9a2d4d493e53ce3 = 0;
            }
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc70
// Size: 0x63b
function function_2d6129b5199a8578(player) {
    player endon("disconnect");
    while (isdefined(player) && isdefined(player.var_92f4eecabdc55527)) {
        if (player.var_92f4eecabdc55527.size <= self.idx || !isdefined(player.var_92f4eecabdc55527[self.idx])) {
            if (isdefined(self.param)) {
                player function_7bcc010e56714f9e("hidden", self.var_1cd064e212d04ea0);
                self.param = undefined;
                self.state = undefined;
                self.data1 = undefined;
                self.data2 = undefined;
            }
        } else if (!isdefined(self.param) || player.var_92f4eecabdc55527[self.idx].var_ec6d72b2772d8c04) {
            self.param = player.var_92f4eecabdc55527[self.idx].param;
            player function_c410a369495445aa(self.param, self.var_10c8d71bc8626dfc);
            self.state = player.var_92f4eecabdc55527[self.idx].state;
            player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
            if (isdefined(player.var_92f4eecabdc55527[self.idx].data1)) {
                self.data1 = player.var_92f4eecabdc55527[self.idx].data1;
                player function_b32b3c68376b18fd(self.data1, self.var_a45e383a1223c992);
            }
            if (isdefined(player.var_92f4eecabdc55527[self.idx].data2)) {
                self.data2 = player.var_92f4eecabdc55527[self.idx].data2;
                player function_b32b3c68376b18fd(self.data2, self.var_a45e373a1223c75f);
            }
            player.var_92f4eecabdc55527[self.idx].var_ec6d72b2772d8c04 = 0;
        } else if (player.var_92f4eecabdc55527[self.idx].var_21d480cc82e3f417) {
            player.var_92f4eecabdc55527 = array_remove(player.var_92f4eecabdc55527, player.var_92f4eecabdc55527[self.idx]);
        } else {
            if (player.var_92f4eecabdc55527[self.idx].var_e9a2d4d493e53ce3 > 0) {
                player.var_92f4eecabdc55527[self.idx].var_e9a2d4d493e53ce3 = player.var_92f4eecabdc55527[self.idx].var_e9a2d4d493e53ce3 - 0.1;
            }
            if (self.param != player.var_92f4eecabdc55527[self.idx].param) {
                self.param = player.var_92f4eecabdc55527[self.idx].param;
                player function_c410a369495445aa(self.param, self.var_10c8d71bc8626dfc);
            }
            if (self.state != player.var_92f4eecabdc55527[self.idx].state) {
                self.state = player.var_92f4eecabdc55527[self.idx].state;
                player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
            }
            if (isdefined(player.var_92f4eecabdc55527[self.idx].data1)) {
                if (!isdefined(self.data1) || self.data1 != player.var_92f4eecabdc55527[self.idx].data1) {
                    self.data1 = player.var_92f4eecabdc55527[self.idx].data1;
                    player function_b32b3c68376b18fd(self.data1, self.var_a45e383a1223c992);
                }
            }
            if (isdefined(player.var_92f4eecabdc55527[self.idx].data2)) {
                if (!isdefined(self.data2) || self.data2 != player.var_92f4eecabdc55527[self.idx].data2) {
                    self.data2 = player.var_92f4eecabdc55527[self.idx].data2;
                    player function_b32b3c68376b18fd(self.data2, self.var_a45e373a1223c75f);
                }
            }
        }
        if (isdefined(player.var_92f4eecabdc55527[self.idx])) {
            if (isdefined(player.var_92f4eecabdc55527[self.idx].var_e9a2d4d493e53ce3) && player.var_92f4eecabdc55527[self.idx].var_e9a2d4d493e53ce3 <= 0) {
                if (self.state != "hidden") {
                    player.var_92f4eecabdc55527[self.idx].state = "hidden";
                    self.state = "hidden";
                    player.var_92f4eecabdc55527[self.idx].var_e9a2d4d493e53ce3 = 0.5;
                    player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
                } else {
                    player.var_92f4eecabdc55527[self.idx].var_21d480cc82e3f417 = 1;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b2
// Size: 0x63b
function function_135c6d3761c72e5(player) {
    player endon("disconnect");
    while (isdefined(player) && isdefined(player.var_10ef8425f61dad4c)) {
        if (player.var_10ef8425f61dad4c.size <= self.idx || !isdefined(player.var_10ef8425f61dad4c[self.idx])) {
            if (isdefined(self.param)) {
                player function_7bcc010e56714f9e("hidden", self.var_1cd064e212d04ea0);
                self.param = undefined;
                self.state = undefined;
                self.data1 = undefined;
                self.data2 = undefined;
            }
        } else if (!isdefined(self.param) || player.var_10ef8425f61dad4c[self.idx].var_ec6d72b2772d8c04) {
            self.param = player.var_10ef8425f61dad4c[self.idx].param;
            player function_c410a369495445aa(self.param, self.var_10c8d71bc8626dfc);
            self.state = player.var_10ef8425f61dad4c[self.idx].state;
            player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
            if (isdefined(player.var_10ef8425f61dad4c[self.idx].data1)) {
                self.data1 = player.var_10ef8425f61dad4c[self.idx].data1;
                player function_b32b3c68376b18fd(self.data1, self.var_a45e383a1223c992);
            }
            if (isdefined(player.var_10ef8425f61dad4c[self.idx].data2)) {
                self.data2 = player.var_10ef8425f61dad4c[self.idx].data2;
                player function_b32b3c68376b18fd(self.data2, self.var_a45e373a1223c75f);
            }
            player.var_10ef8425f61dad4c[self.idx].var_ec6d72b2772d8c04 = 0;
        } else if (player.var_10ef8425f61dad4c[self.idx].var_21d480cc82e3f417) {
            player.var_10ef8425f61dad4c = array_remove(player.var_10ef8425f61dad4c, player.var_10ef8425f61dad4c[self.idx]);
        } else {
            if (player.var_10ef8425f61dad4c[self.idx].var_e9a2d4d493e53ce3 > 0) {
                player.var_10ef8425f61dad4c[self.idx].var_e9a2d4d493e53ce3 = player.var_10ef8425f61dad4c[self.idx].var_e9a2d4d493e53ce3 - 0.1;
            }
            if (self.param != player.var_10ef8425f61dad4c[self.idx].param) {
                self.param = player.var_10ef8425f61dad4c[self.idx].param;
                player function_c410a369495445aa(self.param, self.var_10c8d71bc8626dfc);
            }
            if (self.state != player.var_10ef8425f61dad4c[self.idx].state) {
                self.state = player.var_10ef8425f61dad4c[self.idx].state;
                player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
            }
            if (isdefined(player.var_10ef8425f61dad4c[self.idx].data1)) {
                if (!isdefined(self.data1) || self.data1 != player.var_10ef8425f61dad4c[self.idx].data1) {
                    self.data1 = player.var_10ef8425f61dad4c[self.idx].data1;
                    player function_b32b3c68376b18fd(self.data1, self.var_a45e383a1223c992);
                }
            }
            if (isdefined(player.var_10ef8425f61dad4c[self.idx].data2)) {
                if (!isdefined(self.data2) || self.data2 != player.var_10ef8425f61dad4c[self.idx].data2) {
                    self.data2 = player.var_10ef8425f61dad4c[self.idx].data2;
                    player function_b32b3c68376b18fd(self.data2, self.var_a45e373a1223c75f);
                }
            }
        }
        if (isdefined(player.var_10ef8425f61dad4c[self.idx])) {
            if (isdefined(player.var_10ef8425f61dad4c[self.idx].var_e9a2d4d493e53ce3) && player.var_10ef8425f61dad4c[self.idx].var_e9a2d4d493e53ce3 <= 0) {
                if (self.state != "hidden") {
                    player.var_10ef8425f61dad4c[self.idx].state = "hidden";
                    self.state = "hidden";
                    player.var_10ef8425f61dad4c[self.idx].var_e9a2d4d493e53ce3 = 0.5;
                    player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
                } else {
                    player.var_10ef8425f61dad4c[self.idx].var_21d480cc82e3f417 = 1;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f4
// Size: 0x13c
function function_516fd8a6749c3726(players, var_8b000f9816c87eae, var_283e7af20911133a) {
    var_bb3ad4f8c423dc3d = var_8b000f9816c87eae function_7437a8d48556e45e();
    for (var_9bdd2f2cb0e678b0 = 0; var_9bdd2f2cb0e678b0 < var_bb3ad4f8c423dc3d.size; var_9bdd2f2cb0e678b0++) {
        broadcast_message = var_bb3ad4f8c423dc3d[var_9bdd2f2cb0e678b0];
        var_efb534936831e765 = function_33b31258dfa4019e(var_8b000f9816c87eae, broadcast_message);
        var_efb534936831e765.uniqueid = var_8b000f9816c87eae function_cf54c2c8650d9688() + "_messageId:_" + var_9bdd2f2cb0e678b0;
        var_425fd88686e6fbe = function_4e3ccf5ebd81daea(broadcast_message);
        if (var_425fd88686e6fbe == "StringMessagingUtil_Splash") {
            if (var_283e7af20911133a == 2) {
                function_8aed3f7a425cb7f9(players, var_efb534936831e765);
            } else if (var_283e7af20911133a == 0) {
                function_90aa487b23e54e57(players, var_efb534936831e765);
            }
        } else if (var_425fd88686e6fbe == "StringMessagingUtil_Dialog") {
            if (var_283e7af20911133a == 2) {
                function_cf9e932200fe6f5a(players, var_efb534936831e765);
            } else if (var_283e7af20911133a == 0) {
                function_818b83330689fe30(players, var_efb534936831e765);
            }
        } else if (var_425fd88686e6fbe == "StringMessagingUtil_MinimapWidget") {
            if (var_283e7af20911133a == 0) {
                function_aadccf880d10d728(players, var_efb534936831e765);
            } else if (var_283e7af20911133a == 1) {
                function_f1ecaebb6fbfe630(players, var_efb534936831e765);
            } else if (var_283e7af20911133a == 2) {
                function_db2e4b8d29881d41(players, var_efb534936831e765);
            }
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a37
// Size: 0x1d2
function function_90aa487b23e54e57(players, var_efb534936831e765) {
    if (!isarray(players)) {
        players = [0:players];
    }
    if (!isdefined(var_efb534936831e765.priority)) {
        var_efb534936831e765.priority = 999;
    }
    if (!isdefined(var_efb534936831e765.var_e9a2d4d493e53ce3)) {
        var_efb534936831e765.var_e9a2d4d493e53ce3 = 12;
    }
    var_efb534936831e765.var_ec6d72b2772d8c04 = 1;
    var_efb534936831e765.var_21d480cc82e3f417 = 0;
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        if (!isdefined(player.var_92f4eecabdc55527)) {
            player function_16fe68fcacc54f0f();
        }
        var_82af0bc82d09574f = 0;
        for (i = 0; i < player.var_92f4eecabdc55527.size; i++) {
            if (var_efb534936831e765.priority < player.var_92f4eecabdc55527[i].priority) {
                player.var_92f4eecabdc55527 = array_insert(player.var_92f4eecabdc55527, var_efb534936831e765, i);
                var_973fad7f53ec7115 = 1;
                break;
            }
        }
        if (!var_82af0bc82d09574f) {
            player.var_92f4eecabdc55527 = array_add(player.var_92f4eecabdc55527, var_efb534936831e765);
        }
        if (player.var_92f4eecabdc55527.size > player.var_e606088079f4b1aa.size) {
            player.var_92f4eecabdc55527 = array_remove_index(player.var_92f4eecabdc55527, 0);
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c10
// Size: 0x1bf
function function_818b83330689fe30(players, var_efb534936831e765) {
    if (!isarray(players)) {
        players = [0:players];
    }
    if (!isdefined(var_efb534936831e765.priority)) {
        var_efb534936831e765.priority = 999;
    }
    if (!isdefined(var_efb534936831e765.var_e9a2d4d493e53ce3)) {
        var_efb534936831e765.var_e9a2d4d493e53ce3 = 12;
    }
    var_efb534936831e765.var_ec6d72b2772d8c04 = 1;
    var_efb534936831e765.var_21d480cc82e3f417 = 0;
    foreach (player in players) {
        if (!isdefined(player.var_10ef8425f61dad4c)) {
            player function_16fe68fcacc54f0f();
        }
        var_82af0bc82d09574f = 0;
        for (i = 0; i < player.var_10ef8425f61dad4c.size; i++) {
            if (var_efb534936831e765.priority < player.var_10ef8425f61dad4c[i].priority) {
                player.var_10ef8425f61dad4c = array_insert(player.var_10ef8425f61dad4c, var_efb534936831e765, i);
                var_973fad7f53ec7115 = 1;
                break;
            }
        }
        if (!var_82af0bc82d09574f) {
            player.var_10ef8425f61dad4c = array_add(player.var_10ef8425f61dad4c, var_efb534936831e765);
        }
        if (player.var_10ef8425f61dad4c.size > player.var_eb666c0aadcb83f.size) {
            player.var_10ef8425f61dad4c = array_remove_index(player.var_10ef8425f61dad4c, 0);
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd6
// Size: 0xe5
function function_5818764082f27b98() {
    self.var_3f98b2e95a91cc7b = [];
    self.var_f950fdb9893b4448 = [];
    for (i = 0; i < 5; i++) {
        slot = spawnstruct();
        slot.idx = i;
        var_11b0b741637704b5 = 1 + i;
        slot.var_10c8d71bc8626dfc = "objective_param_" + var_11b0b741637704b5;
        slot.var_a45e383a1223c992 = "objective_count_" + var_11b0b741637704b5;
        slot.var_a45e373a1223c75f = "objective_max_count_" + var_11b0b741637704b5;
        slot.var_1cd064e212d04ea0 = "objective_state_" + var_11b0b741637704b5;
        slot.var_85ddfa37e9569787 = 0;
        slot.var_8d18770972d0a7a9 = 0;
        slot thread function_d5f74832bcb9e4cd(self);
        self.var_3f98b2e95a91cc7b = array_add(self.var_3f98b2e95a91cc7b, slot);
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec2
// Size: 0x549
function function_d5f74832bcb9e4cd(player) {
    player endon("disconnect");
    while (isdefined(player) && isdefined(player.var_f950fdb9893b4448)) {
        self.var_85ddfa37e9569787 = function_752ef78bc0af677f(player);
        if (player.var_3f98b2e95a91cc7b.size - self.idx - 1 < self.var_85ddfa37e9569787) {
            if (isdefined(self.state) && self.state != "hidden") {
                self.state = "hidden";
                player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
            }
        } else if (player.var_f950fdb9893b4448.size <= self.idx || !isdefined(player.var_f950fdb9893b4448[self.idx])) {
            if (isdefined(self.param)) {
                player function_7bcc010e56714f9e("hidden", self.var_1cd064e212d04ea0);
                self.param = undefined;
                self.state = undefined;
                self.data1 = undefined;
                self.data2 = undefined;
            }
        } else if (!isdefined(self.param) || player.var_f950fdb9893b4448[self.idx].var_ec6d72b2772d8c04) {
            self.param = player.var_f950fdb9893b4448[self.idx].param;
            player function_c410a369495445aa(self.param, self.var_10c8d71bc8626dfc);
            self.state = player.var_f950fdb9893b4448[self.idx].state;
            player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
            if (isdefined(player.var_f950fdb9893b4448[self.idx].data1)) {
                self.data1 = player.var_f950fdb9893b4448[self.idx].data1;
                player function_b32b3c68376b18fd(self.data1, self.var_a45e383a1223c992);
            }
            if (isdefined(player.var_f950fdb9893b4448[self.idx].data2)) {
                self.data2 = player.var_f950fdb9893b4448[self.idx].data2;
                player function_b32b3c68376b18fd(self.data2, self.var_a45e373a1223c75f);
            }
            player.var_f950fdb9893b4448[self.idx].var_ec6d72b2772d8c04 = 0;
        } else if (player.var_f950fdb9893b4448[self.idx].var_21d480cc82e3f417) {
            player.var_f950fdb9893b4448 = array_remove(player.var_f950fdb9893b4448, player.var_f950fdb9893b4448[self.idx]);
        } else {
            if (self.param != player.var_f950fdb9893b4448[self.idx].param) {
                self.param = player.var_f950fdb9893b4448[self.idx].param;
                player function_c410a369495445aa(self.param, self.var_10c8d71bc8626dfc);
            }
            if (self.state != player.var_f950fdb9893b4448[self.idx].state) {
                self.state = player.var_f950fdb9893b4448[self.idx].state;
                player function_7bcc010e56714f9e(self.state, self.var_1cd064e212d04ea0);
            }
            if (isdefined(player.var_f950fdb9893b4448[self.idx].data1)) {
                if (!isdefined(self.data1) || self.data1 != player.var_f950fdb9893b4448[self.idx].data1) {
                    self.data1 = player.var_f950fdb9893b4448[self.idx].data1;
                    player function_b32b3c68376b18fd(self.data1, self.var_a45e383a1223c992);
                }
            }
            if (isdefined(player.var_f950fdb9893b4448[self.idx].data2)) {
                if (!isdefined(self.data2) || self.data2 != player.var_f950fdb9893b4448[self.idx].data2) {
                    self.data2 = player.var_f950fdb9893b4448[self.idx].data2;
                    player function_b32b3c68376b18fd(self.data2, self.var_a45e373a1223c75f);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2412
// Size: 0x87
function function_752ef78bc0af677f(player) {
    var_c9d426c25376f103 = 0;
    for (i = player.var_f950fdb9893b4448.size - 1; i > self.idx; i--) {
        if (player.var_f950fdb9893b4448[i].groupid == player.var_f950fdb9893b4448[self.idx].groupid) {
            var_c9d426c25376f103 = var_c9d426c25376f103 + 1;
        }
    }
    return var_c9d426c25376f103;
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a1
// Size: 0x2e5
function function_aadccf880d10d728(players, var_efb534936831e765) {
    if (!isarray(players)) {
        players = [0:players];
    }
    var_efb534936831e765.var_ec6d72b2772d8c04 = 1;
    var_efb534936831e765.var_21d480cc82e3f417 = 0;
    if (!isdefined(var_efb534936831e765.priority)) {
        var_efb534936831e765.priority = 999;
    }
    if (!isdefined(var_efb534936831e765.var_40d7bdeb3c285019)) {
        var_efb534936831e765.var_40d7bdeb3c285019 = 999;
    }
    foreach (player in players) {
        if (!isdefined(player.var_f950fdb9893b4448)) {
            player function_16fe68fcacc54f0f();
        }
        var_cf90b7f7fda6036f = 0;
        var_973fad7f53ec7115 = 0;
        var_e7414da6236efc6f = -1;
        for (i = 0; i < player.var_f950fdb9893b4448.size; i++) {
            if (player.var_f950fdb9893b4448[i].uniqueid == var_efb534936831e765.uniqueid) {
                var_cf90b7f7fda6036f = 1;
            }
            if (player.var_f950fdb9893b4448[i].groupid == var_efb534936831e765.groupid && var_e7414da6236efc6f < 0) {
                var_e7414da6236efc6f = i;
            }
        }
        if (!var_cf90b7f7fda6036f) {
            if (var_e7414da6236efc6f >= 0) {
                for (i = var_e7414da6236efc6f; i < player.var_f950fdb9893b4448.size; i++) {
                    var_a53d960182b1683b = 0;
                    if (player.var_f950fdb9893b4448[i].groupid == var_efb534936831e765.groupid) {
                        var_a53d960182b1683b = 1;
                    }
                    if (var_a53d960182b1683b && player.var_f950fdb9893b4448[i].priority > var_efb534936831e765.priority) {
                        player.var_f950fdb9893b4448 = array_insert(player.var_f950fdb9893b4448, var_efb534936831e765, i);
                        var_973fad7f53ec7115 = 1;
                        break;
                    } else if (!var_a53d960182b1683b) {
                        player.var_f950fdb9893b4448 = array_insert(player.var_f950fdb9893b4448, var_efb534936831e765, i);
                        var_973fad7f53ec7115 = 1;
                        break;
                    }
                }
            } else {
                for (i = 0; i < player.var_f950fdb9893b4448.size; i++) {
                    if (player.var_f950fdb9893b4448[i].var_40d7bdeb3c285019 > var_efb534936831e765.var_40d7bdeb3c285019) {
                        player.var_f950fdb9893b4448 = array_insert(player.var_f950fdb9893b4448, var_efb534936831e765, i);
                        var_973fad7f53ec7115 = 1;
                        break;
                    }
                }
            }
            if (!var_973fad7f53ec7115) {
                player.var_f950fdb9893b4448 = array_add(player.var_f950fdb9893b4448, var_efb534936831e765);
            }
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278d
// Size: 0xe4
function function_db2e4b8d29881d41(players, var_67d14e776339d361) {
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        foreach (message in player.var_f950fdb9893b4448) {
            if (message.uniqueid == var_67d14e776339d361.uniqueid) {
                message.var_21d480cc82e3f417 = 1;
            }
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2878
// Size: 0x215
function function_f1ecaebb6fbfe630(players, var_98d7bd5dba470a9c) {
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        var_cf90b7f7fda6036f = 0;
        foreach (message in player.var_f950fdb9893b4448) {
            if (message.uniqueid == var_98d7bd5dba470a9c.uniqueid) {
                var_cf90b7f7fda6036f = 1;
                if (isdefined(var_98d7bd5dba470a9c.param)) {
                    if (message.param != var_98d7bd5dba470a9c.param) {
                        message.param = var_98d7bd5dba470a9c.param;
                    }
                }
                if (isdefined(var_98d7bd5dba470a9c.state)) {
                    if (message.state != var_98d7bd5dba470a9c.state) {
                        message.state = var_98d7bd5dba470a9c.state;
                    }
                }
                if (isdefined(var_98d7bd5dba470a9c.data1)) {
                    if (isdefined(message.data1) && message.data1 != var_98d7bd5dba470a9c.data1) {
                        message.data1 = var_98d7bd5dba470a9c.data1;
                    }
                }
                if (isdefined(var_98d7bd5dba470a9c.data2)) {
                    if (isdefined(message.data2) && message.data2 != var_98d7bd5dba470a9c.data2) {
                        message.data2 = var_98d7bd5dba470a9c.data2;
                    }
                }
            }
        }
        if (!var_cf90b7f7fda6036f) {
            function_aadccf880d10d728(players, var_98d7bd5dba470a9c);
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a94
// Size: 0x5d
function function_157ef4a3b9c1af16() {
    level.var_b3efbddcabfb0fe0 = [];
    level.var_b3efbddcabfb0fe0["create"] = &function_fb241036d1b1909d;
    level.var_b3efbddcabfb0fe0["update"] = &function_d4ef0f8a2c8f16bb;
    level.var_b3efbddcabfb0fe0["cleanup"] = &function_d037c4085e209ab2;
    function_8b5b2a3392fc7e2a("ActivityEnd", &function_d037c4085e209ab2);
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af8
// Size: 0x9e
function function_fb241036d1b1909d(player) {
    text = newclienthudelem(player);
    text.alpha = 0;
    text.alignx = "center";
    text.aligny = "top";
    text.fontscale = 3;
    text.x = 320;
    text.y = 115;
    text.color = (1, 0, 0);
    player.var_472652e4cdbaf2e7 = text;
    return text;
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9e
// Size: 0x198
function function_d4ef0f8a2c8f16bb(player, time) {
    if (!isdefined(player.var_472652e4cdbaf2e7)) {
        return;
    }
    player.var_472652e4cdbaf2e7.alpha = 1;
    var_928b160c136333a8 = ceil(5 - time);
    if (!isdefined(player.var_472652e4cdbaf2e7.var_eabc3e093012354c) || var_928b160c136333a8 < player.var_472652e4cdbaf2e7.var_eabc3e093012354c) {
        player.var_472652e4cdbaf2e7.var_eabc3e093012354c = var_928b160c136333a8;
        var_1e69af2894af8840 = string(var_928b160c136333a8);
        switch (var_1e69af2894af8840) {
        case #"hash_31100bbc01bd3230":
            player.var_472652e4cdbaf2e7 settext("JUP_OB_OBJECTIVES/LEAVE_WARNING_5_DESC");
            break;
        case #"hash_31100cbc01bd33c3":
            player.var_472652e4cdbaf2e7 settext("JUP_OB_OBJECTIVES/LEAVE_WARNING_4_DESC");
            break;
        case #"hash_311011bc01bd3ba2":
            player.var_472652e4cdbaf2e7 settext("JUP_OB_OBJECTIVES/LEAVE_WARNING_3_DESC");
            break;
        case #"hash_311012bc01bd3d35":
            player.var_472652e4cdbaf2e7 settext("JUP_OB_OBJECTIVES/LEAVE_WARNING_2_DESC");
            break;
        case #"hash_31100fbc01bd387c":
            player.var_472652e4cdbaf2e7 settext("JUP_OB_OBJECTIVES/LEAVE_WARNING_1_DESC");
            break;
        default:
            player.var_472652e4cdbaf2e7 settext("JUP_OB_OBJECTIVES/LEAVE_WARNING_1_DESC");
            break;
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3d
// Size: 0x85
function function_d037c4085e209ab2(var_b381b0883bcd4847) {
    foreach (player in var_b381b0883bcd4847.playerlist) {
        if (isplayer(player) && isdefined(player.var_472652e4cdbaf2e7)) {
            player.var_472652e4cdbaf2e7 destroy();
        }
    }
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc9
// Size: 0x1ae
function function_fdbb9c9eed1c0159(stringreference, var_d3eca865f6bf6555, var_7a9374539cd2a477, priority) {
    var_d3eca865f6bf6555 = function_53c4c53197386572(var_d3eca865f6bf6555, "StringMessagingUtil_Splash");
    var_7a9374539cd2a477 = function_53c4c53197386572(var_7a9374539cd2a477, "Title");
    priority = function_53c4c53197386572(priority, "Medium");
    broadcast = function_3186d88f9311acf4("StringReference");
    broadcast.var_ec75cb30b9c76451 = spawnstruct();
    broadcast.var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4 = spawnstruct();
    broadcast.var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.priority = priority;
    var_4ed40899ed266f0f = spawnstruct();
    var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4 = spawnstruct();
    var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.stringreference = stringreference;
    var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117 = [];
    var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117[0] = spawnstruct();
    var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117[0].var_cf0d4d8cc5ac99a4 = spawnstruct();
    var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117[0].var_cf0d4d8cc5ac99a4.var_d3eca865f6bf6555 = var_d3eca865f6bf6555;
    var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117[0].var_cf0d4d8cc5ac99a4.var_9c774b4866e33235 = var_7a9374539cd2a477;
    broadcast.var_82be66848b872db4[0] = var_4ed40899ed266f0f;
    return broadcast;
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7f
// Size: 0x22
function function_c410a369495445aa(param, omnvar) {
    function_af4f62f0f944a8f1("scripted_widget_objective_text", param, omnvar);
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa8
// Size: 0x22
function function_7bcc010e56714f9e(state, omnvar) {
    function_d28fa5295a04d555("scripted_widget_objective_text", state, omnvar);
}

// Namespace namespace_20c011482c0cdeb0/namespace_62c11776e6b6ad74
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd1
// Size: 0x22
function function_b32b3c68376b18fd(data, omnvar) {
    function_b52897e8afbb0968("scripted_widget_objective_text", data, omnvar);
}

