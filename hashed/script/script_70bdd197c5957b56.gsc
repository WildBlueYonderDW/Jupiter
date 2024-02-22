// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_c7a00602fb8e464;
#using script_61565a6c1fdee6ac;
#using script_3f3c7170aedfefd7;
#using script_89c4e8e66e8a360;
#using script_5961052449eb875f;
#using script_b5c3028255f05a7;
#using script_2f981f68661d5e1a;
#using script_5dfa1fb6b030bdcb;
#using script_35ee5e2cef30eea2;
#using script_6981400abfcd765c;
#using script_32d93a194074fa6a;
#using script_4bcf78b337139620;
#using script_458ce44388c14a5f;
#using script_47a7dd805c87b33f;
#using script_239a365a92ee4476;
#using script_45e6947be98e16e3;

#namespace namespace_5026cc22a303fab7;

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x5d
function function_578b87d7eb32541c() {
    function_9e0151baa208fe9e(#"hash_5145401edfbf737d");
    ascenders = function_866b54331a9baec7(self, 2000);
    self.var_657f5a0d17435bc.var_82caa11345c69977.var_48476cf9cf37777e = function_e09fe43dabd5e4cf(self, ascenders);
    function_b06dec4dbf57b06b();
    childthread function_5c154fbf6a4ff505();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x15e
function function_5c154fbf6a4ff505() {
    while (self.var_657f5a0d17435bc.var_82caa11345c69977.var_3af3cd0524977042) {
        var_ae695132befabc19 = distancesquared(self.var_657f5a0d17435bc.var_82caa11345c69977.var_48476cf9cf37777e.origin, self.origin);
        if (var_ae695132befabc19 < 10000 && self.var_657f5a0d17435bc.var_82caa11345c69977.var_aba64102edbf2cd0) {
            function_7fd621b8ba80e652();
            function_a1a89aeb095402f2();
            childthread function_9e0151baa208fe9e(#"hash_1ec2183747b3d52e");
        }
        if (var_ae695132befabc19 >= 10000 && var_ae695132befabc19 <= 4000000 && !self.var_657f5a0d17435bc.var_82caa11345c69977.var_aba64102edbf2cd0) {
            function_7fd621b8ba80e652();
            function_b06dec4dbf57b06b();
            childthread function_9e0151baa208fe9e(#"hash_5145401edfbf737d");
        }
        if (var_ae695132befabc19 > 9000000) {
            self.var_657f5a0d17435bc.var_82caa11345c69977.var_3af3cd0524977042 = 0;
            function_a1a89aeb095402f2();
            function_f339c5c73d11ea20(#"hash_5145401edfbf737d", 0, level.ftuedata.var_f09f2ffd8a67fe03);
            self notify("currentContextualTipAborted");
        }
        waitframe();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x442
// Size: 0x95
function function_b06dec4dbf57b06b() {
    position = self.var_657f5a0d17435bc.var_82caa11345c69977.var_48476cf9cf37777e.origin + (0, 0, 15);
    self.var_657f5a0d17435bc.var_82caa11345c69977.waypoint = function_e5524fb8509827bf(position, "FTUE_MOBILE/GO_HERE", "icon_waypoint_objective_general", 15, self);
    self.var_657f5a0d17435bc.var_82caa11345c69977.var_aba64102edbf2cd0 = 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4de
// Size: 0x46
function function_a1a89aeb095402f2() {
    function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_82caa11345c69977.waypoint);
    self.var_657f5a0d17435bc.var_82caa11345c69977.var_aba64102edbf2cd0 = 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52b
// Size: 0x83
function function_549535e92d5c8d97() {
    function_9e0151baa208fe9e(#"hash_8cf6f845e104583d");
    self.var_657f5a0d17435bc.var_480aa6483c54887.objectiveid = function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin, "FTUE_MOBILE/OPEN", "icon_waypoint_objective_general", 40, self);
    childthread function_dadee81d5ce668bd(&function_549537e92d5c91fd);
    childthread function_cd83759e21f3ff42(&function_549536e92d5c8fca);
    childthread function_96c1d0188650c7a2();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b5
// Size: 0x9e
function function_549536e92d5c8fca() {
    function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_480aa6483c54887.objectiveid);
    function_f339c5c73d11ea20(#"hash_8cf6f845e104583d", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self.var_657f5a0d17435bc.var_480aa6483c54887.var_b6ffaaa84babd1bc = #"hash_570dd05e461590ee";
    childthread function_9e0151baa208fe9e(#"hash_570dd05e461590ee");
    childthread function_b40f17685dbcc4e6(&function_ee934ee06dde4bf4);
    childthread function_4bfc467c67d38fe0(&function_cfec8edeb2fc6dd5);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65a
// Size: 0x84
function function_549537e92d5c91fd() {
    function_f339c5c73d11ea20(self.var_657f5a0d17435bc.var_480aa6483c54887.var_b6ffaaa84babd1bc, 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self.var_657f5a0d17435bc.var_480aa6483c54887.var_2a182e08ecbc0bd6 = 1;
    self.var_657f5a0d17435bc.var_480aa6483c54887.var_78c14e981c4a4a62 = 1;
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e5
// Size: 0x41
function function_cfec8edeb2fc6dd5() {
    function_7fd621b8ba80e652();
    self.var_657f5a0d17435bc.var_480aa6483c54887.var_b6ffaaa84babd1bc = #"hash_b2359857a05db957";
    function_9e0151baa208fe9e(#"hash_b2359857a05db957");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72d
// Size: 0x31
function function_ee934ee06dde4bf4() {
    if (!self.var_657f5a0d17435bc.var_480aa6483c54887.var_2a182e08ecbc0bd6) {
        function_7fd621b8ba80e652();
        function_549535e92d5c8d97();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x765
// Size: 0xd7
function function_96c1d0188650c7a2() {
    self.var_657f5a0d17435bc.var_480aa6483c54887.var_78c14e981c4a4a62 = 0;
    while (!self.var_657f5a0d17435bc.var_480aa6483c54887.var_78c14e981c4a4a62) {
        dist = distance(self.origin, self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin);
        if (dist > 1500) {
            self.var_657f5a0d17435bc.var_480aa6483c54887.var_78c14e981c4a4a62 = 1;
            function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_480aa6483c54887.objectiveid);
            function_7fd621b8ba80e652();
            self notify("currentContextualTipAborted");
        }
        waitframe();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x843
// Size: 0x4
function function_49a922d5b933eb1f() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84f
// Size: 0x6e
function function_79858f3473b63cc5(alive) {
    if (alive) {
        function_f339c5c73d11ea20(#"hash_bb1f816dd31911f9", 1, level.ftuedata.var_f09f2ffd8a67fe03);
        self notify("currentContextualTipCompleted");
    } else {
        function_7fd621b8ba80e652();
        self notify("currentContextualTipAborted");
    }
    self.var_657f5a0d17435bc.var_9daf1075af0426fa.var_3af3cd0524977042 = 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c4
// Size: 0xd1
function function_fa8e7d5852d94142() {
    var_bb918f79c008801e = 1;
    while (self.var_657f5a0d17435bc.var_9daf1075af0426fa.var_3af3cd0524977042) {
        dist = distance(self.origin, self.var_657f5a0d17435bc.var_9daf1075af0426fa.var_8b6f5f93a32bba7f.origin);
        maxdistance = 3300;
        if (dist > maxdistance && var_bb918f79c008801e) {
            function_7fd621b8ba80e652();
            function_9e0151baa208fe9e(#"hash_6f2d59859a7174aa");
            var_bb918f79c008801e = 0;
        }
        if (dist <= 3000 && !var_bb918f79c008801e) {
            function_7fd621b8ba80e652();
            function_9e0151baa208fe9e(#"hash_bb1f816dd31911f9");
            var_bb918f79c008801e = 1;
        }
        waitframe();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99c
// Size: 0x40
function function_79858e3473b63a92() {
    function_f339c5c73d11ea20(#"hash_6f2d59859a7174aa", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    function_9e0151baa208fe9e(#"hash_bb1f816dd31911f9");
    childthread function_fa8e7d5852d94142();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e3
// Size: 0xc3
function function_79858d3473b6385f() {
    function_9e0151baa208fe9e(#"hash_6f2d59859a7174aa");
    function_f0027ce50e5ef437(&function_79858e3473b63a92);
    foreach (ally in self.var_ffddba74f404a30) {
        if (istrue(ally.inlaststand)) {
            self.var_657f5a0d17435bc.var_9daf1075af0426fa.var_8b6f5f93a32bba7f = ally;
        }
    }
    function_79ff3ea7e538a94a(self.var_657f5a0d17435bc.var_9daf1075af0426fa.var_8b6f5f93a32bba7f, &function_79858f3473b63cc5);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaad
// Size: 0xb
function function_4f790fe93cb38325() {
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xabf
// Size: 0x52
function function_4f790ee93cb380f2() {
    self endon("FTUEAbortedTipParachute");
    childthread function_9e0151baa208fe9e(#"hash_288de16a57a01c2");
    function_a67db5cf006fc19e(50, 30);
    function_f339c5c73d11ea20(#"hash_288de16a57a01c2", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    function_4f790fe93cb38325();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb18
// Size: 0x36
function function_4f7909e93cb375f3() {
    function_914e9d5e71cc6efb();
    function_f339c5c73d11ea20(#"hash_e76f36104d89edbb", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    function_4f790ee93cb380f2();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb55
// Size: 0x3f
function function_4f7908e93cb373c0() {
    function_f339c5c73d11ea20(#"hash_4288e609a7c5b000", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    function_9e0151baa208fe9e(#"hash_e76f36104d89edbb");
    function_4f7909e93cb375f3();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9b
// Size: 0x1f
function function_4f790be93cb37a59() {
    function_9e0151baa208fe9e(#"hash_4288e609a7c5b000");
    function_ba481c5cd3c4f5b4(&function_4f7908e93cb373c0);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc1
// Size: 0x2a
function function_abca315d6e0d1a92() {
    self notify("waypoint_active");
    function_9e0151baa208fe9e(#"hash_a0cc0ba4a902563a");
    childthread function_ec7f69bba0f79ee7(&function_cbb841015b2745f2, 1);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf2
// Size: 0x26
function function_cbb841015b2745f2() {
    wait(1);
    self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_71aff0f17d48e44b = 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1f
// Size: 0xce
function function_28e0fc227558e22d() {
    if (!isdefined(self.lootcachesopened)) {
        self.var_657f5a0d17435bc.lootcachesopened = 0;
    } else {
        self.var_657f5a0d17435bc.lootcachesopened = self.lootcachesopened;
    }
    self.var_657f5a0d17435bc.var_bdbb54412eeff8e7 = "lootCrate2Tip";
    self.var_657f5a0d17435bc.var_3bc7a9defa307c4c = "lootCrate1Tip";
    self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_2f8a41afc9ebef12 = function_6fbf6c2055aeee37();
    if (!isdefined(self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_2f8a41afc9ebef12)) {
        self notify("currentContextualTipAborted");
        return 0;
    }
    childthread function_fa457bbe0f704b56();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf4
// Size: 0xa5
function function_fa457bbe0f704b56() {
    while (self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_3af3cd0524977042) {
        if (isdefined(self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_2f8a41afc9ebef12.itemsdropped)) {
            self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_3af3cd0524977042 = 0;
            function_661ea9bd573dd789();
            function_f339c5c73d11ea20(#"hash_56654f7a895c860f", 1, level.ftuedata.var_f09f2ffd8a67fe03);
            self notify("currentContextualTipCompleted");
        }
        waitframe();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda0
// Size: 0x11b
function function_d299302042f1def3() {
    while (self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_3af3cd0524977042) {
        var_9bb5914ddafa7f59 = distancesquared(self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_2f8a41afc9ebef12.origin, self.origin);
        if (var_9bb5914ddafa7f59 < 10000 && self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_aba64102edbf2cd0) {
            function_661ea9bd573dd789();
        }
        if (var_9bb5914ddafa7f59 >= 10000 && var_9bb5914ddafa7f59 <= 2250000 && !self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_aba64102edbf2cd0) {
            function_13f06d25094c35de();
        }
        if (var_9bb5914ddafa7f59 > 2250000) {
            self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_3af3cd0524977042 = 0;
            function_661ea9bd573dd789();
            function_f339c5c73d11ea20(#"hash_56654f7a895c860f", 0);
            self notify("currentContextualTipAborted");
        }
        waitframe();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec2
// Size: 0x89
function function_13f06d25094c35de() {
    self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_aba64102edbf2cd0 = 1;
    self.var_657f5a0d17435bc.var_ebf862078b683a7a.waypoint = function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_2f8a41afc9ebef12.origin + (0, 0, 18), "FTUE_MOBILE/OPEN", "icon_waypoint_objective_general", 15, self);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf52
// Size: 0x46
function function_661ea9bd573dd789() {
    self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_aba64102edbf2cd0 = 0;
    function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_ebf862078b683a7a.waypoint);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf9f
// Size: 0x124
function function_6fbf6c2055aeee37() {
    var_37eae69752fa4856 = function_f3be9fa4b21eafc2(1500);
    var_93bacbf8fe541c21 = undefined;
    var_4525bec79b5d223b = 2250000;
    foreach (var_3a6c85b32780a9b2 in var_37eae69752fa4856) {
        if (isdefined(var_3a6c85b32780a9b2.itemsdropped)) {
            continue;
        }
        var_eea82522bacdd291 = distancesquared((self.origin[0], self.origin[1], 0), (var_3a6c85b32780a9b2.origin[0], var_3a6c85b32780a9b2.origin[1], 0));
        var_74da97ebca1ba2e7 = distancesquared((0, 0, self.origin[2]), (0, 0, var_3a6c85b32780a9b2.origin[2]));
        var_74da97ebca1ba2e7 = var_74da97ebca1ba2e7 * 2;
        totaldist = var_eea82522bacdd291 + var_74da97ebca1ba2e7;
        if (totaldist < var_4525bec79b5d223b) {
            var_4525bec79b5d223b = totaldist;
            var_93bacbf8fe541c21 = var_3a6c85b32780a9b2;
        }
    }
    return var_93bacbf8fe541c21;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10cb
// Size: 0x4
function function_76064823fdd76685() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d7
// Size: 0x4
function function_76064123fdd75720() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e3
// Size: 0x40
function function_76064223fdd75953() {
    self.var_657f5a0d17435bc.var_6d2384744119499a.var_2264aaaff8964f0a = 1;
    function_9e0151baa208fe9e(#"hash_d290767b5f9aa9a4");
    childthread function_43a9b7793648c22a(&function_f5ebdd40dec5a364);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112a
// Size: 0x30
function function_f5ebdd40dec5a364() {
    function_f339c5c73d11ea20(#"hash_d290767b5f9aa9a4", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1161
// Size: 0x4e
function function_76064323fdd75b86() {
    self.var_657f5a0d17435bc.var_6d2384744119499a.var_2264aaaff8964f0a = 0;
    function_9e0151baa208fe9e(#"hash_edb81681b796ed6f");
    function_1c1e99fe9773964f();
    childthread function_4ae36036bf751abe(&function_78e6b7ae51b19e28);
    childthread function_ebd8e89c3c22fb4f();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b6
// Size: 0x2f
function function_78e6b7ae51b19e28() {
    function_f339c5c73d11ea20(#"hash_72617674e0990935", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    function_76064223fdd75953();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ec
// Size: 0x157
function function_ebd8e89c3c22fb4f() {
    while (!self.var_657f5a0d17435bc.var_6d2384744119499a.var_2264aaaff8964f0a) {
        var_f23eda19755c9c80 = distance(self.var_657f5a0d17435bc.var_495bb1c9678267c7.origin, self.origin);
        if (var_f23eda19755c9c80 < 100 && self.var_657f5a0d17435bc.var_6d2384744119499a.var_aba64102edbf2cd0) {
            self.var_657f5a0d17435bc.var_6d2384744119499a.var_aba64102edbf2cd0 = 0;
            function_7fd621b8ba80e652();
            function_9e0151baa208fe9e(#"hash_72617674e0990935");
            function_5259ee04dc61ca35();
        }
        if (!self.var_657f5a0d17435bc.var_6d2384744119499a.var_aba64102edbf2cd0 && var_f23eda19755c9c80 >= 100 && var_f23eda19755c9c80 <= 1500) {
            function_7fd621b8ba80e652();
            function_9e0151baa208fe9e(#"hash_edb81681b796ed6f");
            function_1c1e99fe9773964f();
        }
        if (var_f23eda19755c9c80 > 2000) {
            function_7fd621b8ba80e652();
            function_5259ee04dc61ca35();
            self.var_657f5a0d17435bc.var_6d2384744119499a.var_2264aaaff8964f0a = 1;
            self notify("currentContextualTipAborted");
        }
        waitframe();
    }
    function_5259ee04dc61ca35();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x134a
// Size: 0xaa
function function_1c1e99fe9773964f() {
    self.var_657f5a0d17435bc.var_6d2384744119499a.var_aba64102edbf2cd0 = 1;
    var_ce7f7e62df1e0b51 = self.var_657f5a0d17435bc.var_495bb1c9678267c7.origin + (0, 0, 67);
    self.var_657f5a0d17435bc.var_6d2384744119499a.waypoint = function_e5524fb8509827bf(var_ce7f7e62df1e0b51, "FTUE_MOBILE/OPEN", "icon_waypoint_objective_general", 10, self);
    self.var_657f5a0d17435bc.var_495bb1c9678267c7 hudoutlineenableforclient(self, "outline_ftue_touch_yellow");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13fb
// Size: 0x41
function function_5259ee04dc61ca35() {
    self.var_657f5a0d17435bc.var_495bb1c9678267c7 hudoutlinedisableforclient(self);
    function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_6d2384744119499a.waypoint);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1443
// Size: 0x52
function function_683a9cf72e77d5bf() {
    function_9e0151baa208fe9e(#"hash_612572faef529442");
    self.var_657f5a0d17435bc.var_108d73ddf65aa72c.var_78f9776e5d16bcfb = #"hash_612572faef529442";
    childthread function_59ded31f4834f8de(&function_683a9df72e77d7f2);
    childthread function_7fdf3cf66304f3c5(self, 45);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149c
// Size: 0x7a
function function_683a9df72e77d7f2() {
    function_f339c5c73d11ea20(#"hash_612572faef529442", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    childthread function_9e0151baa208fe9e(#"inventorysystem2tip");
    self.var_657f5a0d17435bc.var_108d73ddf65aa72c.var_78f9776e5d16bcfb = #"inventorysystem2tip";
    childthread function_7d664ce89c1009ca(&function_6db7fc623e2239c2);
    childthread function_bd09b7d6832880c4(&function_1954c3f1618972d5);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x151d
// Size: 0x51
function function_1954c3f1618972d5(var_eb124d17b9cf50b7, var_4c119a29c3f6914, var_49136c32ceb59180, var_eb21330b94446f95) {
    function_f339c5c73d11ea20(#"inventorysystem2tip", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1575
// Size: 0x4b
function function_6db7fc623e2239c2() {
    if (!self.var_657f5a0d17435bc.completed["inventorySystem2Tip"]) {
        function_f339c5c73d11ea20(#"inventorysystem2tip", 0, level.ftuedata.var_f09f2ffd8a67fe03);
        self notify("currentContextualTipAborted");
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c7
// Size: 0x3b
function function_7fa70c0fd64f5a06() {
    childthread function_4557767cdfd3dc52();
    var_744254a0a817ff39 = spawnstruct();
    var_744254a0a817ff39.duration = 5;
    childthread function_9e0151baa208fe9e(#"hash_a5c87b6f59b63618", var_744254a0a817ff39);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1609
// Size: 0x63
function function_4557767cdfd3dc52() {
    foreach (ally in self.var_ffddba74f404a30) {
        outlineenableforplayer(ally, self, "outline_ftue_touch_bots_green", "top");
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1673
// Size: 0x12
function function_ede2f98d54ae4ffe() {
    function_7fd621b8ba80e652();
    self notify("currentContextualTipAborted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168c
// Size: 0xb
function function_af141ad10d4457ef() {
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x169e
// Size: 0x37
function function_af1417d10d445156(var_783f2268fa543e99) {
    function_f339c5c73d11ea20(#"hash_9fcffddd63d54838", var_783f2268fa543e99, level.ftuedata.var_f09f2ffd8a67fe03);
    function_af141ad10d4457ef();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16dc
// Size: 0xa1
function function_af1418d10d445389() {
    if (!istrue(self.var_657f5a0d17435bc.var_dba7867b4e133164)) {
        function_f339c5c73d11ea20(#"hash_db8d0de856c06433", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    }
    var_744254a0a817ff39 = spawnstruct();
    var_744254a0a817ff39.duration = 3;
    function_9e0151baa208fe9e(#"hash_9fcffddd63d54838", var_744254a0a817ff39);
    self.var_657f5a0d17435bc.var_f028b7eee8d5ac0d.var_78f9776e5d16bcfb = #"hash_9fcffddd63d54838";
    function_8efd0509e8d63ca9(&function_af1417d10d445156);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1784
// Size: 0x75
function function_af1415d10d444cf0() {
    if (istrue(self.var_657f5a0d17435bc.var_dba7867b4e133164)) {
        function_af1418d10d445389();
    } else {
        function_9e0151baa208fe9e(#"hash_db8d0de856c06433");
        self.var_657f5a0d17435bc.var_f028b7eee8d5ac0d.var_78f9776e5d16bcfb = #"hash_db8d0de856c06433";
        childthread function_88b1ad5e2a6d9e6d(&function_ede2f98d54ae4ffe);
        function_b3e2a55102596658(&function_af1418d10d445389);
    }
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1801
// Size: 0x12
function function_6e076951711f3f0d() {
    function_7fd621b8ba80e652();
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181a
// Size: 0x40
function function_6e076851711f3cda() {
    function_64aeda8c8a4179c5(0);
    function_f339c5c73d11ea20(#"hash_efd3ad9a60c678a0", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    function_9e0151baa208fe9e(#"hash_94b8fda10689035b");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1861
// Size: 0x36
function function_6e076751711f3aa7() {
    function_9e0151baa208fe9e(#"hash_efd3ad9a60c678a0");
    function_64aeda8c8a4179c5(1);
    childthread function_331e465c203522e0(&function_6e076851711f3cda);
    childthread function_506621f96f8313a5(&function_6e076951711f3f0d);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x189e
// Size: 0x3b
function function_a678411ce9a6f9ea() {
    var_744254a0a817ff39 = spawnstruct();
    var_744254a0a817ff39.duration = 3;
    function_9e0151baa208fe9e(#"hash_a5b5f1a8929ba9d3", var_744254a0a817ff39);
    waitframe();
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e0
// Size: 0x31
function function_605b756ff40f6aa8() {
    waitframe();
    function_f339c5c73d11ea20(#"hash_4a4caa71da6050d7", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1918
// Size: 0x2c
function function_605b786ff40f7141() {
    childthread function_9e0151baa208fe9e(#"hash_4a4caa71da6050d7");
    childthread function_9b8f4317c9bee442(&function_605b756ff40f6aa8);
    childthread function_7fdf3cf66304f3c5(self, 30);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194b
// Size: 0x30
function function_d98f4306380ee473() {
    function_f339c5c73d11ea20(#"hash_2ac4de9747a9637a", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1982
// Size: 0x1f
function function_d98f4406380ee6a6() {
    function_9e0151baa208fe9e(#"hash_2ac4de9747a9637a");
    function_c3ff6825172b7e02(&function_d98f4306380ee473);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a8
// Size: 0x115
function function_229a87f877a6e5ef() {
    if (!self.var_657f5a0d17435bc.var_9fd058151789294e.var_977a0264ee6a021b) {
        self.var_657f5a0d17435bc.var_9fd058151789294e.var_ce7f7e62df1e0b51 = drop_to_ground(self.var_657f5a0d17435bc.var_9fd058151789294e.var_d02731f86e1479e.origin, 100) + (0, 0, 1);
        self.var_657f5a0d17435bc.var_9fd058151789294e.waypoint = function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_9fd058151789294e.var_ce7f7e62df1e0b51, "FTUE_MOBILE/PICK_UP", "icon_waypoint_objective_general", 15, self, 1);
        function_9e0151baa208fe9e(#"hash_cf8dcd626a3ec483");
        self.var_657f5a0d17435bc.var_9fd058151789294e.var_afc287eec64aeb6e = 0;
        childthread function_72c1ec67d589d251(&function_734a3ce54e168099);
    } else {
        self notify("currentContextualTipAborted");
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac4
// Size: 0x23
function function_734a3ce54e168099() {
    self.var_657f5a0d17435bc.var_9fd058151789294e.var_afc287eec64aeb6e = 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aee
// Size: 0xfa
function function_5e5de51cbcc60dc() {
    self endon("currentContextualTipAborted");
    var_f3da6461821c0212 = 1;
    var_14c4829f9474851d = 0;
    var_e86632d645c137d0 = level.br_circle.dangercircleent.origin[2];
    var_2e12ff7e544d85f7 = 2000;
    var_a0b221200d114e38 = var_e86632d645c137d0 * 0.25;
    if (var_2e12ff7e544d85f7 > var_a0b221200d114e38) {
        var_2e12ff7e544d85f7 = var_a0b221200d114e38;
    }
    while (!var_14c4829f9474851d) {
        if (function_725b52f601c21a7a(var_2e12ff7e544d85f7, 100) && var_f3da6461821c0212) {
            function_7fd621b8ba80e652();
            var_f3da6461821c0212 = 0;
            childthread function_9e0151baa208fe9e(#"hash_50bcbc77a76ce45c");
        }
        if (function_725b52f601c21a7a(-1, -200) && !var_f3da6461821c0212) {
            function_7fd621b8ba80e652();
            var_f3da6461821c0212 = 1;
            childthread function_9e0151baa208fe9e(#"hash_16387c82e81ffa47");
        }
        if (function_725b52f601c21a7a(3000, var_2e12ff7e544d85f7)) {
            childthread function_7fd621b8ba80e652();
            var_14c4829f9474851d = 1;
            self notify("currentContextualTipCompleted");
        }
        waitframe();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bef
// Size: 0xb
function function_5e5e151cbcc6775() {
    childthread function_5e5de51cbcc60dc();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c01
// Size: 0xe4
function function_c5ea332184e0a3e8() {
    childthread namespace_91fad7208d9cd856::function_64f6dbf96d0e6f81();
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    if (!namespace_ba266451167c225d::function_43c47cf181121e3()) {
        self.var_657f5a0d17435bc.var_40834c928484edfb.var_654c850c2646f8e0 = 1;
        childthread function_9e0151baa208fe9e(#"hash_e09e5ff38edd2e81");
        namespace_91fad7208d9cd856::function_7618f4372cdd1ce();
        var_8e53d4ca3de8531a = 0;
        while (var_8e53d4ca3de8531a <= 120) {
            if (namespace_ba266451167c225d::function_43c47cf181121e3()) {
                function_f339c5c73d11ea20(#"hash_e09e5ff38edd2e81", 1, level.ftuedata.var_f09f2ffd8a67fe03);
                childthread function_c5ea362184e0aa81();
                break;
            } else {
                var_8e53d4ca3de8531a++;
            }
            wait(1);
        }
        if (var_8e53d4ca3de8531a >= 120) {
            namespace_91fad7208d9cd856::function_3ff2b2e0317f4686();
            function_f339c5c73d11ea20(#"hash_e09e5ff38edd2e81", 0);
            self notify("currentContextualTipAborted");
        }
    } else {
        childthread function_c5ea362184e0aa81();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cec
// Size: 0x7a
function function_c5ea362184e0aa81() {
    self endon("redeployAlly_3");
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    childthread function_9e0151baa208fe9e(#"hash_ab21380bf4498612");
    childthread namespace_91fad7208d9cd856::function_59299228aa688748();
    childthread function_cd83759e21f3ff42(&function_c5ea352184e0a84e);
    var_8e53d4ca3de8531a = 0;
    while (var_8e53d4ca3de8531a <= 120) {
        var_8e53d4ca3de8531a++;
        wait(1);
    }
    namespace_91fad7208d9cd856::function_66ee5612ecdfbac6();
    function_f339c5c73d11ea20(#"hash_ab21380bf4498612", 0);
    self notify("currentContextualTipAborted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6d
// Size: 0x73
function function_c5ea352184e0a84e() {
    self notify("redeployAlly_3");
    namespace_91fad7208d9cd856::function_66ee5612ecdfbac6();
    function_f339c5c73d11ea20(#"hash_ab21380bf4498612", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    function_9e0151baa208fe9e(#"hash_e5b29000b3a1234b");
    childthread function_dadee81d5ce668bd(&function_9ba4efe4f079799, "airdrop");
    childthread function_dadee81d5ce668bd(&function_aa05b333b0355a6);
    childthread function_b40f17685dbcc4e6(&function_e13c98cc4be85c6c);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de7
// Size: 0x50
function function_9ba4efe4f079799() {
    self.var_657f5a0d17435bc.var_40834c928484edfb.var_55d2955394d9da6f = 1;
    self notify("currentContextualTipCompleted");
    function_f339c5c73d11ea20(#"hash_e5b29000b3a1234b", 1, level.ftuedata.var_f09f2ffd8a67fe03);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3e
// Size: 0x94
function function_aa05b333b0355a6() {
    self.var_657f5a0d17435bc.var_40834c928484edfb.var_2a182e08ecbc0bd6 = 1;
    wait(0.5);
    if (!self.var_657f5a0d17435bc.var_40834c928484edfb.var_55d2955394d9da6f) {
        if (!self.var_657f5a0d17435bc.var_40834c928484edfb.var_654c850c2646f8e0) {
            function_7fd621b8ba80e652();
            childthread function_c5ea332184e0a3e8();
        } else {
            function_f339c5c73d11ea20(#"hash_e5b29000b3a1234b", 0);
            self notify("currentContextualTipAborted");
        }
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed9
// Size: 0x67
function function_e13c98cc4be85c6c() {
    self endon("currentContextualTipAborted");
    self endon("currentContextualTipCompleted");
    wait(0.5);
    if (!self.var_657f5a0d17435bc.var_40834c928484edfb.var_55d2955394d9da6f && !self.var_657f5a0d17435bc.var_40834c928484edfb.var_2a182e08ecbc0bd6) {
        function_7fd621b8ba80e652();
        function_c5ea362184e0aa81();
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f47
// Size: 0x113
function function_2cf99fd1dcda914() {
    childthread namespace_91fad7208d9cd856::function_962a086325a6ebcc();
    var_4412f1171badd735 = getfirstprimaryweapon();
    self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_7803c95645e637e1 = self getcurrentprimaryweapon();
    if (var_4412f1171badd735.basename == self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_7803c95645e637e1.basename) {
        self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_78f9776e5d16bcfb = #"hash_77d61ce6efc11661";
    } else {
        self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_78f9776e5d16bcfb = #"hash_ebd4f5043d2dcbf2";
    }
    function_9e0151baa208fe9e(self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_78f9776e5d16bcfb);
    childthread function_7fdf3cf66304f3c5(self, 20, self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_78f9776e5d16bcfb);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2061
// Size: 0x34
function function_ae5757fdad4729b8() {
    function_9e0151baa208fe9e(#"hash_f2222fe44741673c");
    childthread function_fc9d282d9afeec03();
    childthread function_7fdf3cf66304f3c5(self, getdvarint(@"hash_954866cda5724c", 45));
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x209c
// Size: 0x39
function function_fc9d282d9afeec03() {
    while (1) {
        channel = self waittill("luinotifyserver");
        if (isdefined(channel) && channel == "ftue_tips_disabled") {
            self notify("currentContextualTipCompleted");
            break;
        }
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20dc
// Size: 0x4
function function_51221897a20c4cd0() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20e8
// Size: 0x43
function function_3197c7ae9b533b7a() {
    function_f339c5c73d11ea20(self.var_657f5a0d17435bc.var_f028b7eee8d5ac0d.var_78f9776e5d16bcfb, 0, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipAborted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2132
// Size: 0x12
function function_390588110ddad141() {
    self notify("FTUEAbortedTipParachute");
    namespace_91fad7208d9cd856::function_5ebbaba0d200b31();
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x214b
// Size: 0x4
function function_eeb8aa7d0df4f4ac() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2157
// Size: 0x4
function function_eeb8ad7d0df4fb45() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2163
// Size: 0x4
function function_84e2f790050bd9cb() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216f
// Size: 0x4
function function_918c5ab6e5d63b1e() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x217b
// Size: 0x4
function function_918c59b6e5d638eb() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2187
// Size: 0x4
function function_2386fbec5e1ca175() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2193
// Size: 0x4
function function_2386f8ec5e1c9adc() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x219f
// Size: 0x4
function function_91f8e694098031e8() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21ab
// Size: 0x4
function function_2dd522f4e3055cc7() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21b7
// Size: 0x4
function function_aa84fb15f18ef8d() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21c3
// Size: 0x4
function function_144b9f4ec7316632() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21cf
// Size: 0x4
function function_389f36df89442c4f() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21db
// Size: 0x4
function function_3ab35f644c83fe44() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21e7
// Size: 0x4
function function_6e9877da3497be33() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21f3
// Size: 0x4
function function_32a1b6e53b39b557() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21ff
// Size: 0x4
function function_fc79c8376f59bf78() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x220b
// Size: 0x4
function function_6440647b22203967() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2217
// Size: 0x12
function function_6440657b22203b9a() {
    function_7fd621b8ba80e652();
    self notify("currentContextualTipAborted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2230
// Size: 0x4
function function_abb1b1e76e6d3c20() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223c
// Size: 0x4
function function_8e4ce4303149d181() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2248
// Size: 0x70
function endlootenemybycond1() {
    childthread namespace_91fad7208d9cd856::function_6d7761e5ee79ee04(level.var_305547d6de59eba4.var_2f72209eba1e0b19, 0);
    function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypoint);
    function_f339c5c73d11ea20(#"hash_a0cc0ba4a902563a", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22bf
// Size: 0x52
function function_b340dd5a8c093af1() {
    childthread namespace_91fad7208d9cd856::function_6d7761e5ee79ee04(level.var_305547d6de59eba4.var_2f72209eba1e0b19, 0);
    function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypoint);
    function_7fd621b8ba80e652();
    self notify("currentContextualTipAborted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2318
// Size: 0x4
function function_b872aff17393df33() {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2324
// Size: 0x37
function function_4a531c5ba156e6b() {
    function_fd8c7c643982ffe3();
    function_f339c5c73d11ea20(#"hash_cf8dcd626a3ec483", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2362
// Size: 0x19
function function_4a532c5ba15709e() {
    function_fd8c7c643982ffe3();
    function_7fd621b8ba80e652();
    self notify("currentContextualTipAborted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2382
// Size: 0x43
function function_fd8c7c643982ffe3() {
    function_4d03b9ef456d0972(self.var_657f5a0d17435bc.var_9fd058151789294e.waypoint);
    childthread namespace_91fad7208d9cd856::function_6d7761e5ee79ee04(level.var_305547d6de59eba4.var_2f72209eba1e0b19, 0);
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23cc
// Size: 0x56
function function_1873c2c76f8cf9ba() {
    function_f339c5c73d11ea20(#"hash_1ec2183747b3d52e", 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self.var_657f5a0d17435bc.var_82caa11345c69977.var_3af3cd0524977042 = 0;
    function_a1a89aeb095402f2();
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_88945a6f395620be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2429
// Size: 0x44
function function_34eca3f4488832d6() {
    function_f339c5c73d11ea20(self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_78f9776e5d16bcfb, 1, level.ftuedata.var_f09f2ffd8a67fe03);
    self notify("currentContextualTipCompleted");
}

