// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_22f1701e151b9d12;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using scripts\stealth\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using script_42adcce5878f583;

#namespace namespace_87d75ea764a6d2fd;

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b
// Size: 0xb3
function function_56e8f78ce1511d35(var_a2293a1278075bfe, callbackfunction, userdata) {
    /#
        assertex(isdefined(level.ob.var_3589be2c6265fd16["WarlordInitialization"]), "Need to setup warlord data before adding a callback!");
    #/
    level.ob.var_3589be2c6265fd16["WarlordInitialization"][var_a2293a1278075bfe] = spawnstruct();
    level.ob.var_3589be2c6265fd16["WarlordInitialization"][var_a2293a1278075bfe].callbackfunction = callbackfunction;
    level.ob.var_3589be2c6265fd16["WarlordInitialization"][var_a2293a1278075bfe].userdata = userdata;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5e5
// Size: 0xb3
function function_32d58ef031f811e5(var_a2293a1278075bfe, callbackfunction, userdata) {
    /#
        assertex(isdefined(level.ob.var_3589be2c6265fd16["WarlordEnterCombat"]), "Need to setup warlord data before adding a callback!");
    #/
    level.ob.var_3589be2c6265fd16["WarlordEnterCombat"][var_a2293a1278075bfe] = spawnstruct();
    level.ob.var_3589be2c6265fd16["WarlordEnterCombat"][var_a2293a1278075bfe].callbackfunction = callbackfunction;
    level.ob.var_3589be2c6265fd16["WarlordEnterCombat"][var_a2293a1278075bfe].userdata = userdata;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0xb3
function function_dbfada6bda9049b3(var_a2293a1278075bfe, callbackfunction, userdata) {
    /#
        assertex(isdefined(level.ob.var_3589be2c6265fd16["BodyguardInitialization"]), "Need to setup warlord data before adding a callback!");
    #/
    level.ob.var_3589be2c6265fd16["BodyguardInitialization"][var_a2293a1278075bfe] = spawnstruct();
    level.ob.var_3589be2c6265fd16["BodyguardInitialization"][var_a2293a1278075bfe].callbackfunction = callbackfunction;
    level.ob.var_3589be2c6265fd16["BodyguardInitialization"][var_a2293a1278075bfe].userdata = userdata;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x759
// Size: 0x36e
function function_ca19e36a62160d1b() {
    var_462bad107655e7af = getdvarint(@"hash_bd0a763d48b336f5", 0);
    if (var_462bad107655e7af > 0 && isdefined(level.ob) && isdefined(level.ob.var_d7935410e738bfb5) && level.ob.var_d7935410e738bfb5.size > 1 && var_462bad107655e7af < level.ob.var_d7935410e738bfb5.size) {
        var_fc77030b4cb76fef = [];
        var_fc77030b4cb76fef["WARLORD_CHEMIST"] = getdvarint(@"hash_352fcc571f69c906", 25);
        var_fc77030b4cb76fef["WARLORD_ALLFORONE"] = getdvarint(@"hash_713abd88cba7893b", 25);
        var_fc77030b4cb76fef["WARLORD_MAESTRO"] = getdvarint(@"hash_10e4b47f5b5e87e4", 25);
        var_fc77030b4cb76fef["WARLORD_RAINMAKER"] = getdvarint(@"hash_1f18592b11c92795", 25);
        level.ob.var_2d47f6a46e7f1d8c = [];
        var_dde4e2ad15f13f79 = [];
        foreach (warlord in level.ob.var_d7935410e738bfb5) {
            if (var_fc77030b4cb76fef[warlord] >= 100) {
                var_dde4e2ad15f13f79[var_dde4e2ad15f13f79.size] = warlord;
            }
        }
        foreach (var_b509a6a9e16880b4 in var_dde4e2ad15f13f79) {
            function_cfa04404b9d2785f(var_b509a6a9e16880b4);
        }
        if (level.ob.var_d7935410e738bfb5.size <= var_462bad107655e7af) {
            /#
                assertmsg("Num of Guaranteed Warlords doesn't leave enough to randomize scr_randomize_warlords: " + var_462bad107655e7af + ". Check your scr_randomize_warlords_<id>_weight dvars for consistency.");
            #/
            return;
        }
        for (i = 0; i < var_462bad107655e7af; i++) {
            var_ea7b8497480fbe00 = [];
            foreach (warlord in level.ob.var_d7935410e738bfb5) {
                var_ea7b8497480fbe00[var_ea7b8497480fbe00.size] = var_fc77030b4cb76fef[warlord];
            }
            var_743226b7979f16a3 = namespace_3c37cb17ade254d::function_6e4039e57d0a3e7e(level.ob.var_d7935410e738bfb5, var_ea7b8497480fbe00);
            if (isdefined(var_743226b7979f16a3)) {
                function_cfa04404b9d2785f(var_743226b7979f16a3);
            } else {
                /#
                    assertmsg("Warlord Randomization couldn't find a valid Warlord to enable: " + var_462bad107655e7af + ". Check your scr_randomize_warlords_<id>_weight dvars as too many with value zero might have been entered.");
                #/
                return;
            }
        }
        namespace_3c37cb17ade254d::registersharedfunc("warlords", "warlordIsDisabled", &function_38b20d4656daf802);
        logstring("ob_warlord_utility::init_warlord_randomization Warlords enabled: " + level.ob.var_2d47f6a46e7f1d8c.size);
        foreach (var_397515a6dd2f503b in level.ob.var_2d47f6a46e7f1d8c) {
            logstring("ob_warlord_utility::init_warlord_randomization : " + var_397515a6dd2f503b);
        }
    } else {
        /#
            println("stealth_investigate");
        #/
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xace
// Size: 0x64
function private function_cfa04404b9d2785f(var_1cbab0f95b6dd9cc) {
    level.ob.var_2d47f6a46e7f1d8c[level.ob.var_2d47f6a46e7f1d8c.size] = var_1cbab0f95b6dd9cc;
    level.ob.var_d7935410e738bfb5 = namespace_3c37cb17ade254d::array_remove(level.ob.var_d7935410e738bfb5, var_1cbab0f95b6dd9cc);
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb39
// Size: 0x4e
function private function_38b20d4656daf802(var_6a9c4405c9014215) {
    if (isdefined(level.ob) && isdefined(level.ob.var_2d47f6a46e7f1d8c)) {
        return !array_contains(level.ob.var_2d47f6a46e7f1d8c, var_6a9c4405c9014215);
    }
    return 0;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8f
// Size: 0x263
function function_37ae676661b1fbef(var_a2293a1278075bfe, var_6a9c4405c9014215) {
    if (!isdefined(level.ob)) {
        level.ob = spawnstruct();
    }
    if (!isdefined(level.ob.var_d7935410e738bfb5)) {
        level.ob.var_d7935410e738bfb5 = [];
    }
    if (isdefined(var_6a9c4405c9014215)) {
        level.ob.var_d7935410e738bfb5[level.ob.var_d7935410e738bfb5.size] = var_6a9c4405c9014215;
    }
    thread function_c4ee5a14998ec4f0();
    function_b2957529a40f9419();
    level.ob.var_ebde11a65d618ef6 = utility::function_53c4c53197386572(level.ob.var_ebde11a65d618ef6, []);
    level.ob.var_bfc5850d296d2ebe = utility::function_53c4c53197386572(level.ob.var_bfc5850d296d2ebe, []);
    var_9414c7e6e6b170eb = getscriptbundlenames("obwarlord");
    foreach (var_eda9f5416ee74e1a in var_9414c7e6e6b170eb) {
        var_2837ba0ad9d0ca86 = getscriptbundle(var_eda9f5416ee74e1a);
        level.ob.var_df2a406396977cd[var_a2293a1278075bfe] = var_2837ba0ad9d0ca86.var_7834be33dfa6504e;
        if (var_2837ba0ad9d0ca86.var_bfc5850d296d2ebe.size > 0) {
            var_bfc5850d296d2ebe = var_2837ba0ad9d0ca86.var_bfc5850d296d2ebe[0].var_cf0d4d8cc5ac99a4;
            var_416e692d602bff30 = function_f159c10d5cf8f0b4(var_bfc5850d296d2ebe.var_695a063d36b3a1e6, "targetname");
            if (isdefined(var_416e692d602bff30) && var_416e692d602bff30.size > 0) {
                var_bfc5850d296d2ebe.goalvolume = var_416e692d602bff30[0];
            }
            if (isdefined(var_bfc5850d296d2ebe) && var_bfc5850d296d2ebe.var_a2293a1278075bfe == var_a2293a1278075bfe) {
                level.ob.var_bfc5850d296d2ebe[var_a2293a1278075bfe] = var_bfc5850d296d2ebe;
                level.ob.var_ebde11a65d618ef6["actor_" + var_2837ba0ad9d0ca86.var_fff6b84dc56a9504] = var_a2293a1278075bfe;
                return;
            }
        }
    }
    /#
        assertmsg("Unable to find a script bundle matching the warlord type: " + var_a2293a1278075bfe + ". Warlord data is not correctly setup!");
    #/
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf9
// Size: 0x21
function function_9acf953fd6bf2e46(var_a2293a1278075bfe) {
    return level.ob.var_bfc5850d296d2ebe[var_a2293a1278075bfe];
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe22
// Size: 0x72
function function_b14ea143c425c696(agent) {
    if (!isdefined(agent) || !agent.isactive) {
        return undefined;
    }
    if (!isdefined(agent.ob) || !isdefined(agent.ob.var_7960ef8469c176de)) {
        /#
            assertmsg("Unable to find warlord agent data. A warlord was not initialized!");
        #/
        return undefined;
    }
    return agent.ob.var_7960ef8469c176de;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9c
// Size: 0x20a
function function_621b23491ba1db4d() {
    var_54d38f1df370976a = undefined;
    if (isdefined(level.ob) && isdefined(level.ob.var_7dd4780d4e4bff4d)) {
        level.var_870b859eb5d3ef5d = [];
        foreach (var_c8785c7598a6585c in level.ob.var_7dd4780d4e4bff4d) {
            var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(var_c8785c7598a6585c);
            if (isdefined(var_d1c7613187e69022) && var_c8785c7598a6585c.state == "ActiveState") {
                struct = spawnstruct();
                struct.key = var_d1c7613187e69022.var_9a002d7b10d97a7d;
                struct.var_b8109b3150a7d2b6 = var_d1c7613187e69022.var_826c99bbea28d245;
                level.var_870b859eb5d3ef5d = array_add(level.var_870b859eb5d3ef5d, struct);
            }
        }
        if (level.var_870b859eb5d3ef5d.size == 0) {
            var_54d38f1df370976a = spawnstruct();
            warlord = function_7a2aaa4a09a4d250(level.ob.var_7dd4780d4e4bff4d);
            var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(warlord);
            var_54d38f1df370976a.var_6fa7637317187a6a = "ob_jup_item_key_" + var_d1c7613187e69022.var_9a002d7b10d97a7d;
            var_54d38f1df370976a.var_cb5b9e43220882fe = var_d1c7613187e69022.var_826c99bbea28d245;
        }
        if (level.var_870b859eb5d3ef5d.size > 0) {
            randomindex = randomint(level.var_870b859eb5d3ef5d.size);
            var_54d38f1df370976a = spawnstruct();
            var_54d38f1df370976a.var_6fa7637317187a6a = "ob_jup_item_key_" + level.var_870b859eb5d3ef5d[randomindex].key;
            var_54d38f1df370976a.var_cb5b9e43220882fe = level.var_870b859eb5d3ef5d[randomindex].var_b8109b3150a7d2b6;
        }
    }
    return var_54d38f1df370976a;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ae
// Size: 0x62
function function_ce3f50617905370d(var_65ba113a139d5326) {
    var_2189bfeed28cbb65 = undefined;
    if (isint(var_65ba113a139d5326)) {
        var_2189bfeed28cbb65 = var_65ba113a139d5326;
    } else if (isent(var_65ba113a139d5326)) {
        var_2189bfeed28cbb65 = var_65ba113a139d5326.ob.var_2189bfeed28cbb65;
    }
    if (isdefined(var_2189bfeed28cbb65)) {
        return level.ob.var_3ecf047d758de560[var_2189bfeed28cbb65];
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1117
// Size: 0x2f
function function_7f4ff5bee712266d(var_65ba113a139d5326) {
    var_3ecf047d758de560 = function_ce3f50617905370d(var_65ba113a139d5326);
    if (isdefined(var_3ecf047d758de560)) {
        return var_3ecf047d758de560.warlord;
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x114d
// Size: 0x2f
function function_69383e2ee4241972(var_65ba113a139d5326) {
    var_3ecf047d758de560 = function_ce3f50617905370d(var_65ba113a139d5326);
    if (isdefined(var_3ecf047d758de560)) {
        return var_3ecf047d758de560.var_aa912d25b3f2006b;
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1183
// Size: 0x53
function function_6d423bc682d6dc86(agent) {
    if (!isdefined(agent) || !isdefined(agent.ob) || !isdefined(agent.ob.var_a2293a1278075bfe)) {
        return undefined;
    }
    return agent.ob.var_a2293a1278075bfe;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11de
// Size: 0x3a
function function_7161f6d8c69ce57(var_dcf5e15c58c4152a) {
    if (!isdefined(level.ob.var_ebde11a65d618ef6)) {
        return undefined;
    }
    return level.ob.var_ebde11a65d618ef6[var_dcf5e15c58c4152a];
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1220
// Size: 0x8e
function private function_df91d839bf1c0d15(requestid, var_2189bfeed28cbb65) {
    var_dd271c02249f77a6 = function_9a39e23c3c52c2af(requestid);
    foreach (ai in var_dd271c02249f77a6.ai) {
        if (isdefined(function_6d423bc682d6dc86(ai))) {
            continue;
        } else {
            ai function_b0f5bec38374c8cc(var_2189bfeed28cbb65);
        }
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12b5
// Size: 0x68
function private function_81d8f6b92521b89e(requestid, var_2189bfeed28cbb65) {
    var_3ecf047d758de560 = function_ce3f50617905370d(var_2189bfeed28cbb65);
    /#
        assertex(!isdefined(var_3ecf047d758de560.warlord) && var_3ecf047d758de560.var_aa912d25b3f2006b.size == 0, "Trying to clean a warlordFightData which is still active.");
    #/
    level.ob.var_3ecf047d758de560[var_2189bfeed28cbb65] = undefined;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1324
// Size: 0x52
function function_f0c948dd48051d6d(event) {
    if (!isdefined(function_6d423bc682d6dc86(self))) {
        return;
    }
    waittill_any_4("stealth_investigate", "stealth_hunt", "stealth_combat", "startCombatRush");
    function_bc95e76bb035cbb0("WarlordEnterCombat", self.ob.var_a2293a1278075bfe);
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137d
// Size: 0xa3
function function_b0f5bec38374c8cc(var_2189bfeed28cbb65) {
    if (!isdefined(var_2189bfeed28cbb65)) {
        return;
    }
    if (!isdefined(self.ob)) {
        self.ob = spawnstruct();
    }
    self.ob.var_2189bfeed28cbb65 = var_2189bfeed28cbb65;
    var_3ecf047d758de560 = function_ce3f50617905370d(var_2189bfeed28cbb65);
    var_3ecf047d758de560.var_aa912d25b3f2006b = utility::array_add(var_3ecf047d758de560.var_aa912d25b3f2006b, self);
    function_8d7a31347e728957(var_3ecf047d758de560.var_a2293a1278075bfe);
    function_bc95e76bb035cbb0("BodyguardInitialization", var_3ecf047d758de560.var_a2293a1278075bfe);
    thread function_20bb31768283f2e1();
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1427
// Size: 0x129
function function_395c3a00db83ba6(var_431bd3e5830d66f8, smeansofdeath, objweapon) {
    var_1c3120f83fe70574 = getdvarint(@"hash_41316bd57deea9ac", 990);
    damagemodifier = 1;
    iskillstreakweapon = 0;
    if (isdefined(objweapon)) {
        if (namespace_e0ee43ef2dddadaa::function_6faaa2882e3d2e4e(objweapon)) {
            damagemodifier = 1 - getdvarfloat(@"hash_31b253892ec07512", 0.9);
        } else if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon)) {
            iskillstreakweapon = 1;
            damagemodifier = 1 - getdvarfloat(@"hash_867db2aabbc3871e", 0.3);
        } else {
            weaponref = namespace_1a507865f681850e::getequipmentreffromweapon(objweapon);
            if (isdefined(weaponref) && namespace_1a507865f681850e::isequipmentlethal(weaponref)) {
                damagemodifier = 1 - getdvarfloat(@"hash_9583ada22eae941a", 0.4);
            }
        }
    }
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_IMPACT") {
        damagemodifier = damagemodifier * (1 - getdvarfloat(@"hash_92c73e8a555ee04e", 0.9));
    }
    var_431bd3e5830d66f8 = var_431bd3e5830d66f8 * damagemodifier;
    if (!iskillstreakweapon && isdefined(var_431bd3e5830d66f8)) {
        var_431bd3e5830d66f8 = min(var_431bd3e5830d66f8, var_1c3120f83fe70574);
    }
    return var_431bd3e5830d66f8;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1558
// Size: 0xa0
function private function_20bb31768283f2e1() {
    level endon("game_ended");
    var_2189bfeed28cbb65 = self.ob.var_2189bfeed28cbb65;
    var_3ecf047d758de560 = level.ob.var_3ecf047d758de560[var_2189bfeed28cbb65];
    /#
        assertex(isdefined(var_3ecf047d758de560), "Invalid warlord fight data!");
    #/
    self waittill("death");
    if (isdefined(var_3ecf047d758de560.warlord)) {
        var_3ecf047d758de560.warlord notify("bodyguard_death", self);
    }
    var_3ecf047d758de560.var_aa912d25b3f2006b = utility::array_remove(var_3ecf047d758de560.var_aa912d25b3f2006b, self);
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15ff
// Size: 0xb5
function private function_6e131d8eb584fab1() {
    level endon("game_ended");
    var_2189bfeed28cbb65 = self.ob.var_2189bfeed28cbb65;
    var_3ecf047d758de560 = level.ob.var_3ecf047d758de560[var_2189bfeed28cbb65];
    var_1ad690300e350aa9 = level.ob.var_3ecf047d758de560[var_2189bfeed28cbb65].warlord.ob.headicon;
    /#
        assertex(isdefined(var_3ecf047d758de560), "Invalid warlord fight data!");
    #/
    self waittill("death");
    if (isdefined(var_1ad690300e350aa9)) {
        deleteheadicon(var_1ad690300e350aa9);
    }
    var_3ecf047d758de560.warlord = undefined;
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16bb
// Size: 0x48
function private function_bc95e76bb035cbb0(callbacktype, var_a2293a1278075bfe) {
    var_3dfbdc6f9aeb8197 = function_79194a4c41782a44(callbacktype, var_a2293a1278075bfe);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        self thread [[ var_3dfbdc6f9aeb8197.callbackfunction ]](self, var_3dfbdc6f9aeb8197.userdata);
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x170a
// Size: 0x1b
function private function_c4ee5a14998ec4f0() {
    utility::flag_wait("ai_spawn_director_initialized");
    namespace_1c689dd3986a841c::function_e4a440552e4cf1f4(&function_ed169893cf4e3c8b);
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x172c
// Size: 0xdf
function private function_b2957529a40f9419() {
    level.ob.var_3589be2c6265fd16 = utility::function_53c4c53197386572(level.ob.var_3589be2c6265fd16, []);
    level.ob.var_3589be2c6265fd16["WarlordInitialization"] = utility::function_53c4c53197386572(level.ob.var_3589be2c6265fd16["WarlordInitialization"], []);
    level.ob.var_3589be2c6265fd16["WarlordEnterCombat"] = utility::function_53c4c53197386572(level.ob.var_3589be2c6265fd16["WarlordEnterCombat"], []);
    level.ob.var_3589be2c6265fd16["BodyguardInitialization"] = utility::function_53c4c53197386572(level.ob.var_3589be2c6265fd16["BodyguardInitialization"], []);
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1812
// Size: 0x61
function private function_79194a4c41782a44(var_fcf4ab9f684cfb9a, var_a2293a1278075bfe) {
    if (isdefined(level.ob.var_3589be2c6265fd16[var_fcf4ab9f684cfb9a]) && isdefined(level.ob.var_3589be2c6265fd16[var_fcf4ab9f684cfb9a][var_a2293a1278075bfe])) {
        return level.ob.var_3589be2c6265fd16[var_fcf4ab9f684cfb9a][var_a2293a1278075bfe];
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x187a
// Size: 0x3d
function private function_ed169893cf4e3c8b(agent, requestid, data) {
    if (issubstr(agent.agent_type, "warlord")) {
        function_8834b75a040f482c(agent, requestid);
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18be
// Size: 0x3be
function private function_8834b75a040f482c(agent, requestid) {
    var_a2293a1278075bfe = function_7161f6d8c69ce57(agent.agent_type);
    if (isdefined(var_a2293a1278075bfe)) {
        if (!isdefined(level.ob.var_3ecf047d758de560)) {
            level.ob.var_3ecf047d758de560 = [];
            level.ob.var_a00fdfa764345acc = 0;
        }
        if (!isdefined(agent.ob)) {
            agent.ob = spawnstruct();
        }
        level.ob.var_a00fdfa764345acc++;
        var_2189bfeed28cbb65 = level.ob.var_a00fdfa764345acc;
        var_3ecf047d758de560 = spawnstruct();
        var_3ecf047d758de560.var_a2293a1278075bfe = var_a2293a1278075bfe;
        var_3ecf047d758de560.var_aa912d25b3f2006b = [];
        var_3ecf047d758de560.var_e6013eac45290cab = function_8ba4c11453487949(agent.origin, level.ob.var_7dd4780d4e4bff4d);
        var_3ecf047d758de560.warlord = agent;
        agent function_23ff99f593753aa2();
        level.ob.var_3ecf047d758de560[var_2189bfeed28cbb65] = var_3ecf047d758de560;
        agent.ob.var_a2293a1278075bfe = var_a2293a1278075bfe;
        agent.ob.var_7960ef8469c176de = spawnstruct();
        agent.ob.var_2189bfeed28cbb65 = var_2189bfeed28cbb65;
        agent function_8d7a31347e728957(var_a2293a1278075bfe);
        agent.ob.headicon = createheadicon(agent);
        if (agent.ob.headicon >= 0) {
            setheadiconimage(agent.ob.headicon, level.ob.var_df2a406396977cd[var_a2293a1278075bfe].image);
            setheadicondrawthroughgeo(agent.ob.headicon, level.ob.var_df2a406396977cd[var_a2293a1278075bfe].var_40323b3869b1dbf4);
            setheadiconzoffset(agent.ob.headicon, level.ob.var_df2a406396977cd[var_a2293a1278075bfe].zoffset);
            setheadiconmaxdistance(agent.ob.headicon, level.ob.var_df2a406396977cd[var_a2293a1278075bfe].maxdistance);
            function_a0889a73efaeafd3(agent.ob.headicon, level.ob.var_df2a406396977cd[var_a2293a1278075bfe].var_ade54a80646b269e);
            function_272322fc1191dc50(agent.ob.headicon, level.ob.var_df2a406396977cd[var_a2293a1278075bfe].var_cfff23ec98adcff5);
            function_51044b10b2b673df(agent.ob.headicon, level.ob.var_df2a406396977cd[var_a2293a1278075bfe].var_955138b02d7ab947);
        }
        namespace_1c689dd3986a841c::function_f81b7c3f18ef98be(requestid, &function_df91d839bf1c0d15, var_2189bfeed28cbb65);
        namespace_1c689dd3986a841c::function_3248cab79849207(requestid, &function_81d8f6b92521b89e, var_2189bfeed28cbb65);
        agent function_bc95e76bb035cbb0("WarlordInitialization", var_a2293a1278075bfe);
        agent thread function_a25ef95b556a9ab1(var_a2293a1278075bfe);
        agent utility::ent_flag_wait("stealth_enabled");
        agent thread function_f0c948dd48051d6d();
        agent function_6e131d8eb584fab1();
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c83
// Size: 0xcb
function private function_23ff99f593753aa2() {
    self.allowpain = 0;
    self.var_274d3a7704e351ef = 1;
    self.var_9aa77ab756fdca82 = 10000;
    self.var_43e2ad424676b8d4 = 500;
    self.var_cbd87a0bc497b778 = 1;
    self.var_98add129a7ecb962 = 0;
    self.baseaccuracy = 1.3;
    self.disablereload = 1;
    self.var_4ebe755e0a0a430e = 0;
    self.suppressionthreshold = 0.4;
    self.suppressiondecrement = 0.25;
    self.disable_blindfire = 1;
    self.dontmelee = 1;
    self.var_4268b42fc89d0be9 = 0.03;
    self.var_8a783f4c73c2ae91 = 4e-05;
    self.var_d491cd53e778c48e = gettime();
    self disableexecutionvictim();
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d55
// Size: 0x43
function private function_8d7a31347e728957(var_a2293a1278075bfe) {
    goalvolume = level.ob.var_bfc5850d296d2ebe[var_a2293a1278075bfe].goalvolume;
    if (isdefined(goalvolume)) {
        self setgoalvolumeauto(goalvolume);
    }
}

// Namespace namespace_87d75ea764a6d2fd/namespace_ad1f398af6f48cb1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d9f
// Size: 0xbd
function private function_a25ef95b556a9ab1(var_a2293a1278075bfe) {
    if (!namespace_dc53a27a8db8e6bf::function_9488f02028f9f413(var_a2293a1278075bfe)) {
        return;
    }
    var_c2d424d63e286244 = level.ob.var_bfc5850d296d2ebe[var_a2293a1278075bfe];
    if (!isdefined(var_c2d424d63e286244)) {
        return;
    }
    level endon("game_ended");
    self endon("death");
    ent_flag_wait("warlord_start_combat_chatter");
    var_5379fa309aea3b97 = function_53c4c53197386572(var_c2d424d63e286244.var_3dd45e9c06d5584, 120);
    var_6e5135c4d449c855 = function_53c4c53197386572(var_c2d424d63e286244.var_41ecd282cbd8319a, 160);
    var_8550aa5109d8fb4a = function_53c4c53197386572(var_c2d424d63e286244.var_651c4bb853d4df1f, 180);
    thread namespace_dc53a27a8db8e6bf::function_70d2561024bc73f4(var_a2293a1278075bfe, var_5379fa309aea3b97, var_6e5135c4d449c855, var_8550aa5109d8fb4a);
}

