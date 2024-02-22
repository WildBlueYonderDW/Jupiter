// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_16ea1b94f0f381b3;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_600b944a95c3a7bf;
#using script_22f1701e151b9d12;
#using script_5753ba9c28794a65;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_3ab210ea917601e7;
#using script_5d8202968463a21d;
#using script_120270bd0a747a35;
#using script_70c2478fc6d8ef;
#using scripts\mp\utility\debug.gsc;
#using script_7cfaa6fd841fb4dd;
#using script_2d400da2610fe542;
#using script_43971bbeefd98f05;
#using script_46c7c73b1a7e4773;
#using script_4c770a9a4ad7659c;
#using script_6c6a46b757ce4c71;
#using script_1845b8a2edf19262;
#using script_638d701d263ee1ed;
#using script_24946c036cb2f7b2;
#using script_4e6e58ab5d96c2b0;
#using script_208955cb4d2c8fb3;
#using scripts\cp_mp\tripwire.gsc;
#using script_edb8e725d068ac9;
#using script_3ce4651e69c721db;
#using script_58be75c518bf0d40;
#using scripts\mp\utility\entity.gsc;

#namespace namespace_5a6420d2880ffe83;

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa07
// Size: 0xc6
function function_557cb9d43dd5e520() {
    function_89384091f7a2dbd("REV_OB_MERC_STRONGHOLD", 0, &function_1c518ee0267d39a7);
    function_89384091f7a2dbd("REV_OB_MERC_STRONGHOLD", 1, &function_1d7f1aa5e90c423f);
    function_89384091f7a2dbd("REV_OB_MERC_STRONGHOLD", 2, &function_c92a1d18faacf0b7);
    function_89384091f7a2dbd("REV_OB_MERC_STRONGHOLD", 3, &function_d247acefc6b0fea4);
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_MERC_STRONGHOLD");
    function_8b5b2a3392fc7e2a("PlayerEnteredAwarenessZone", &function_cf049bb9bdcb65b1, "REV_OB_MERC_STRONGHOLD");
    if (getdvarint(@"hash_bf4ebf5964c596f5", 1)) {
        namespace_4a32b5725832011a::function_77a37b3f4896fc9b();
        level.var_55ae2ac5cd96a23f = 1;
    }
    /#
        level thread function_f927f5dd26f5e076();
    #/
    namespace_4c2b495b8d79cc2e::function_fca481c0e8fafd2c("SpatialZoneContainerGroup_No_Key_Zone", &function_97724206a31d0a1a, &function_f390f4ebbe42c73c, "handler_comms_nokey");
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0x810
function function_1c518ee0267d39a7() {
    if (!isdefined(self)) {
        /#
            println("visible");
        #/
        return;
    }
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_7fef38b419e7c59a = function_4188e118731a30f4();
    self.var_a01113882f3e72ba = function_b9c4aa88ad97ee68(self);
    self.var_8eefbcaeafb2ba74 = getstruct(self.var_626b45032e1892da + "_main", "targetname");
    if (!isdefined(self.var_8eefbcaeafb2ba74)) {
        /#
            println("<unknown string>" + self.var_626b45032e1892da + "<unknown string>");
        #/
        return;
    }
    if (!isdefined(self.var_8eefbcaeafb2ba74.target)) {
        /#
            println("<unknown string>" + self.var_626b45032e1892da + "<unknown string>");
        #/
        return;
    }
    var_7b89b04a690a3aec = getstructarray(self.var_8eefbcaeafb2ba74.target, "targetname");
    if (!isdefined(var_7b89b04a690a3aec) || var_7b89b04a690a3aec.size == 0) {
        /#
            println("<unknown string>" + self.var_626b45032e1892da + "<unknown string>");
        #/
        return;
    }
    self.var_566dc3346c682517 = getclosest(self.var_8eefbcaeafb2ba74.origin, var_7b89b04a690a3aec, 3000);
    tok = strtok(self.var_566dc3346c682517.target, "_");
    self.var_e82f27370c0c78a7 = tok[0];
    if (!isdefined(self.var_566dc3346c682517)) {
        /#
            println("<unknown string>" + self.var_626b45032e1892da + "<unknown string>");
        #/
        return;
    }
    self.var_566dc3346c682517.var_e6013eac45290cab = self;
    self.var_8d98fb8210ccc891 = 1;
    if (isdefined(self.var_566dc3346c682517.script_noteworthy)) {
        self.var_8d98fb8210ccc891 = int(self.var_566dc3346c682517.script_noteworthy);
    }
    self.capture_radius = function_53c4c53197386572(self.var_a01113882f3e72ba.var_aa2f6abe766e0b14, 150);
    self.attract_radius = function_53c4c53197386572(self.var_a01113882f3e72ba.var_4957ff6533310443, 2048);
    self.var_e964223850a88d72 = function_53c4c53197386572(self.var_a01113882f3e72ba.var_99e94a285263be97, 1);
    self.var_abc346fd5c06110b = function_53c4c53197386572(self.var_a01113882f3e72ba.var_82069e842d421599, "jup_ob_merc_stronghold_encounter_safe");
    scriptables = getentitylessscriptablearray(self.var_566dc3346c682517.target, "targetname");
    var_a4080b1a80515f14 = array_combine(getstructarray(self.var_566dc3346c682517.target, "targetname"), scriptables, function_f159c10d5cf8f0b4(self.var_566dc3346c682517.target, "targetname"));
    self.var_10f090a9e9488068 = [];
    self.lootcache_spawns = [];
    self.tripwires = [];
    self.var_cdde8e8fc33af4 = undefined;
    foreach (struct in var_a4080b1a80515f14) {
        if (!isdefined(struct.script_noteworthy)) {
            continue;
        }
        switch (struct.script_noteworthy) {
        case #"hash_2a78ee15440a7a06":
            struct.var_6cc5839e538cb3e1 = 1;
            self.var_10f090a9e9488068[self.var_10f090a9e9488068.size] = struct;
            break;
        case #"hash_106df5d1729e996":
            self.var_10f090a9e9488068[self.var_10f090a9e9488068.size] = struct;
            break;
        case #"hash_c7833a7b1cbbcbb8":
            self.lootcache_spawns[self.lootcache_spawns.size] = struct;
            break;
        case #"hash_1e2a3b90ad592d02":
            self.var_cdde8e8fc33af4 = struct;
            break;
        }
    }
    var_a4080b1a80515f14 = getstructarray(self.var_8eefbcaeafb2ba74.target, "target");
    foreach (struct in var_a4080b1a80515f14) {
        if (!isdefined(struct.script_noteworthy)) {
            continue;
        }
        switch (struct.script_noteworthy) {
        case #"hash_1e2a3b90ad592d02":
            self.var_cdde8e8fc33af4 = struct;
            break;
        case #"hash_67d246bbbd8678a0":
            self.var_377e66f5ed687ff6 = struct;
            break;
        }
    }
    self.var_fc4ffac4746eb217 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.var_566dc3346c682517.origin);
    switch (self.var_fc4ffac4746eb217) {
    case #"hash_7bb2cd766703d463":
        self.var_d2d422f50501ae28 = function_53c4c53197386572(self.var_a01113882f3e72ba.var_45c274695def950f, 3);
        self.var_d133a794fe336c9d = function_53c4c53197386572(self.var_a01113882f3e72ba.var_45c274695def950f, 2);
        self.capture_time = function_53c4c53197386572(self.var_a01113882f3e72ba.var_ffbb339bc7800aab.capturetime, 75);
        self.var_48c4ba670a4f33fc = function_53c4c53197386572(self.var_a01113882f3e72ba.var_ffbb339bc7800aab.var_6314e68d57b3349b, "ob_jup_items_activity_merc_stronghold_safe_green");
        self.var_3ed142e5e1a337f3 = function_53c4c53197386572(self.var_a01113882f3e72ba.var_cac3f854e5a01b31, 2);
        self.var_b90c26f642e9b96e = "ob_minor_activity_complete_green";
        break;
    case #"hash_af83e47edfa8900a":
        self.var_d2d422f50501ae28 = function_53c4c53197386572(self.var_a01113882f3e72ba.var_45c274695def950f, 2);
        self.var_d133a794fe336c9d = function_53c4c53197386572(self.var_a01113882f3e72ba.var_45c274695def950f, 3);
        self.capture_time = function_53c4c53197386572(self.var_a01113882f3e72ba.var_62856878a9debbdc.capturetime, 75);
        self.var_48c4ba670a4f33fc = function_53c4c53197386572(self.var_a01113882f3e72ba.var_62856878a9debbdc.var_6314e68d57b3349b, "ob_jup_items_activity_merc_stronghold_safe_green");
        self.var_3ed142e5e1a337f3 = function_53c4c53197386572(self.var_a01113882f3e72ba.var_f3cd38cc4ea1ead6, 3);
        self.var_b90c26f642e9b96e = "ob_minor_activity_complete_yellow";
        break;
    default:
        /#
            println("<unknown string>" + self.var_626b45032e1892da + "<unknown string>");
        #/
        function_4bc22996edea81f1(self);
        return;
    }
    self.var_48c4ba670a4f33fc = getdvar(@"hash_c80f3e1e7f1c4ea8", self.var_48c4ba670a4f33fc);
    self.capture_time = float(self.capture_time);
    self.var_82fe1c44f0e59dd5 = squared(self.capture_radius);
    self.var_287c8f447c48c9aa = squared(self.attract_radius);
    self.var_614385c59920cb82 = 3;
    self.var_999c4a8370c90a74 = &function_99b95e1bcf411ecd;
    condition = 1;
    function_10646a42a1856556(scriptables);
    function_d96f75b6f0fc7daf();
    function_44f59d05c32d272e();
    function_f40b2a445b8885bc();
    function_587c183c4febe0f4();
    thread function_f916023bc6d70f23();
    if (istrue(level.var_55ae2ac5cd96a23f)) {
        function_922249df70b163b4();
    }
    namespace_9718b9a169c3ead0::function_cb146e445d78e9ee();
    function_3e33031646de23b0(self);
    function_7719e82ffdcda669(self);
    self waittill("merc_stronghold_unlocked");
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12eb
// Size: 0x38
function function_1d7f1aa5e90c423f() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    if (!istrue(level.var_55ae2ac5cd96a23f)) {
        self waittill("merc_stronghold_cleared");
        function_612d18fdbc979c0b(self, 1);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132a
// Size: 0x1f
function function_c92a1d18faacf0b7() {
    namespace_4fda5d7358015a06::function_dca86aca511288f4(self, "CleanupState");
    self endon("instance_destroyed");
    thread function_a26e39e03a0d6739();
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1350
// Size: 0x38
function function_d247acefc6b0fea4() {
    if (isdefined(self.var_bdbc894efe4c6a96) && self.var_bdbc894efe4c6a96.size > 0) {
        namespace_17b45e55cf344cda::function_486b0f579d5b6dae(self.var_bdbc894efe4c6a96);
    }
    function_2ced1a9613bd11ab(self);
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138f
// Size: 0x1de
function function_922249df70b163b4() {
    if (!isdefined(self.var_cdde8e8fc33af4)) {
        /#
            println("<unknown string>" + self.var_626b45032e1892da + "<unknown string>");
        #/
        function_4bc22996edea81f1(self);
        return;
    }
    if (!isdefined(self.var_377e66f5ed687ff6)) {
        /#
            println("<unknown string>" + self.var_626b45032e1892da + "<unknown string>");
        #/
        function_4bc22996edea81f1(self);
        return;
    }
    if (isdefined(self.var_cdde8e8fc33af4)) {
        self.safe = namespace_4a32b5725832011a::function_12920ead9cafd0e1(self.var_cdde8e8fc33af4.origin, self.var_cdde8e8fc33af4.angles);
        self.safe.var_ec8af9ed3e95d273 = self.var_cdde8e8fc33af4.script_parameters;
        self.safe.var_2091b0afd53afd0 = 1;
    }
    if (isdefined(self.var_377e66f5ed687ff6)) {
        var_6d80e693415c94b2 = spawnstruct();
        var_6d80e693415c94b2.origin = self.var_377e66f5ed687ff6.origin + (0, 0, 12);
        var_6d80e693415c94b2.angles = (0, 0, 0);
        var_6d80e693415c94b2.var_b13455d8cb3bcd74 = "";
        var_6d80e693415c94b2.var_994503f84e8b10ee = self.var_377e66f5ed687ff6.script_parameters;
        var_6d80e693415c94b2.var_9846517a0453cefb = "mediumAirship";
        if (isdefined(self.safe.var_ec8af9ed3e95d273)) {
            var_6d80e693415c94b2.script_stealthgroup = self.var_e82f27370c0c78a7 + "_" + self.safe.var_ec8af9ed3e95d273;
        }
        self.var_52116bd9513e6108 = var_6d80e693415c94b2;
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1574
// Size: 0x2f
function function_3b904252bd807c48() {
    namespace_1c689dd3986a841c::function_9aa732b22b08a6dc(self.var_ec8e19d33579ee5d, &function_29604012bba4e2c9, self);
    namespace_1c689dd3986a841c::function_11f03fd3165d148f(self.var_ec8e19d33579ee5d, &function_3ad08f64466364b3, self);
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15aa
// Size: 0x2a
function function_29604012bba4e2c9(encounterid, userdata, var_e6013eac45290cab) {
    var_e6013eac45290cab.var_ca5ad8c8e6c2aedd = 1;
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15db
// Size: 0x29
function function_3ad08f64466364b3(encounterid, userdata, var_e6013eac45290cab) {
    var_e6013eac45290cab.var_ca5ad8c8e6c2aedd = 0;
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160b
// Size: 0x93
function function_b92f379a5ad772f8() {
    self.var_ec8e19d33579ee5d = namespace_1c689dd3986a841c::function_54da428ad4a96f2e("ai_encounter:" + "jup_ob_merc_stronghold_encounter_presafe", self.safe.origin, 2048, 1, 1, 0);
    waitframe();
    if (isdefined(self.var_ec8e19d33579ee5d)) {
        namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(self.var_ec8e19d33579ee5d, &function_bfb2d106fb179ca2, self);
        namespace_1c689dd3986a841c::function_11f03fd3165d148f(self.var_ec8e19d33579ee5d, &function_dceb459c3597d366, self);
        function_adcc96a7d541aa36(self.var_ec8e19d33579ee5d, 0);
        function_fc38783a3da0bc71(self.var_ec8e19d33579ee5d, 1);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a5
// Size: 0x5d
function function_a5311fb4a565a810() {
    if (isdefined(self.var_8d95ebec3c279578)) {
        namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(self.var_8d95ebec3c279578, &function_bfb2d106fb179ca2, self);
        namespace_1c689dd3986a841c::function_11f03fd3165d148f(self.var_8d95ebec3c279578, &function_dceb459c3597d366, self);
        function_adcc96a7d541aa36(self.var_8d95ebec3c279578, 0);
        function_fc38783a3da0bc71(self.var_8d95ebec3c279578, 1);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1709
// Size: 0x94
function function_c5770043463ad63() {
    level endon("game_ended");
    if (isdefined(self.safe)) {
        safe = self.safe;
        safe waittill("safe_unlocking");
        var_e6013eac45290cab = self;
        thread function_cefa7b514c4aff6d();
        while (!istrue(var_e6013eac45290cab.var_ca5ad8c8e6c2aedd)) {
            if (!istrue(safe.var_d062a6468e65034e)) {
                safe.var_d062a6468e65034e = 1;
                function_a5311fb4a565a810();
                thread function_dd78c34c770c2497(self.var_6c29f2fdb0054bbe);
            }
            wait(0.1);
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17a4
// Size: 0x54
function private function_edfa3b20cf5df03() {
    var_54d38f1df370976a = namespace_ad1f398af6f48cb1::function_621b23491ba1db4d();
    if (isdefined(var_54d38f1df370976a)) {
        self.safe.key = var_54d38f1df370976a.var_6fa7637317187a6a;
        self.var_cb5b9e43220882fe = var_54d38f1df370976a.var_cb5b9e43220882fe;
        self notify("warlord_key_picked");
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ff
// Size: 0x179
function function_10646a42a1856556(scriptables) {
    if (!isdefined(level.var_e9a6fc11b0aa7eb2)) {
        namespace_5a43e3b1b17bfdcc::init();
        level.var_46f13cac76d49010 = "jup_frag_grenade_ob";
        if (isdefined(level.var_f1bff73a86c35c52)) {
            [[ level.var_f1bff73a86c35c52 ]]();
        }
    }
    self.scriptables = scriptables;
    foreach (scriptable in self.scriptables) {
        if (isdefined(scriptable.classname) && issubstr(scriptable.classname, "nest")) {
            continue;
        }
        if (isdefined(scriptable.classname) && issubstr(scriptable.classname, "scriptable_blocker")) {
            scriptable setscriptablepartstate("state", "visible");
        }
        if (isdefined(scriptable.classname) && issubstr(scriptable.classname, "scriptable_ob_toggleable")) {
            scriptable setscriptablepartstate("state", "visible");
        }
        if (isdefined(scriptable.classname) && issubstr(scriptable.classname, "tripwire")) {
            self.tripwires[self.tripwires.size] = scriptable;
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x197f
// Size: 0x3c
function function_aa43dfcdd8f03fe0(var_2d9552508615d396, tripwire) {
    if (isdefined(tripwire.var_e6013eac45290cab) && isdefined(tripwire.var_70587812595fd991)) {
        namespace_75b9b66caa533c31::function_aed7a5e07b895fa(var_2d9552508615d396, tripwire);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c2
// Size: 0xe8
function function_d96f75b6f0fc7daf() {
    self.tripwires = array_randomize(self.tripwires);
    if (!isdefined(self.var_3ed142e5e1a337f3)) {
        self.var_3ed142e5e1a337f3 = self.tripwires.size;
    }
    if (self.var_3ed142e5e1a337f3 > self.tripwires.size) {
        self.var_3ed142e5e1a337f3 = self.tripwires.size;
    }
    for (i = 0; i < self.var_3ed142e5e1a337f3; i++) {
        [[ level.var_e9a6fc11b0aa7eb2 ]](self.tripwires[i], "team_hundred_ninety");
        self.tripwires[i].var_e6013eac45290cab = self;
        self.tripwires[i].var_70587812595fd991 = function_53c4c53197386572(self.var_a01113882f3e72ba.var_8e78ad3db9ae547b, undefined);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab1
// Size: 0x2e0
function function_44f59d05c32d272e() {
    self.var_bd59a95fc824e0f9 = [];
    zone = namespace_4c2b495b8d79cc2e::function_5bbdc39a533d9d57(self, "Proximity_Join_Zone");
    searchradius = namespace_4c2b495b8d79cc2e::function_2403f7fe5d40cecc(zone[0]);
    self.var_d740584cd9c7ca06 = getentitylessscriptablearray(undefined, undefined, self.var_8eefbcaeafb2ba74.origin, searchradius, "door");
    /#
        if (getdvarint(@"hash_9c3d7b7ac76a359c", 0) == 1) {
            thread namespace_d028276791d9cff6::drawsphere(self.var_8eefbcaeafb2ba74.origin, searchradius, 900, (0, 1, 1));
            foreach (var_56bf944ddc92801a in self.var_d740584cd9c7ca06) {
                thread namespace_d028276791d9cff6::drawsphere(var_56bf944ddc92801a.origin, 1, 900, (1, 1, 1));
            }
        }
    #/
    foreach (var_7d1484060301dfa7 in self.var_10f090a9e9488068) {
        /#
            if (getdvarint(@"hash_9c3d7b7ac76a359c", 0) == 1) {
                thread namespace_d028276791d9cff6::drawsphere(var_7d1484060301dfa7.origin, 5, 900, (0.25, 0, 0.5));
            }
        #/
        var_98fa2809e21ff34f = [];
        var_98fa2809e21ff34f = namespace_f6368c72597c6d90::function_ad1b6accbaab404e(var_7d1484060301dfa7, self.var_bd59a95fc824e0f9, "human_stronghold", istrue(var_7d1484060301dfa7.var_6cc5839e538cb3e1), 1, self.var_d740584cd9c7ca06);
        foreach (door in var_98fa2809e21ff34f) {
            if (istrue(door.var_3d9512b73bdc1514)) {
                if (issubstr(door.classname, "saloon")) {
                    var_f34a60219065c89 = 1;
                }
                if (istrue(var_f34a60219065c89)) {
                    door function_9af4c9b2cc1bf989();
                } else {
                    door scriptabledoorfreeze(1);
                }
            } else {
                namespace_f6368c72597c6d90::function_fbbfe6f05eda5eb1(door);
            }
            if (istrue(var_7d1484060301dfa7.var_6cc5839e538cb3e1)) {
                door.var_661993877a526435 = self;
                door.var_def557e8fd5c6763 = &function_f10295a436fc1aa2;
                door.fortress = self;
                self.var_bd59a95fc824e0f9[self.var_bd59a95fc824e0f9.size] = door;
            } else {
                door scriptabledoorfreeze(1);
            }
        }
    }
    self.var_d740584cd9c7ca06 = undefined;
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d98
// Size: 0x122
function private function_f10295a436fc1aa2(scriptable, player) {
    level endon("game_ended");
    scriptable.var_661993877a526435 function_5d929bdf9c67783f();
    scriptable.var_661993877a526435 function_e2797519315ed24a();
    var_ece2647396f544df = loot::getlootidfromref("loot_key_human_stronghold");
    soundorigin = scriptable.origin;
    wait(1);
    playsoundatpos(soundorigin, "mp_door_key_break");
    var_65b695f0c0d909ed = player namespace_fe9526a81c458d8f::function_4776284a348ebb6a(var_ece2647396f544df);
    if (isdefined(var_65b695f0c0d909ed) && var_65b695f0c0d909ed != -1) {
        player namespace_fe9526a81c458d8f::function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 0);
    }
    scriptable.var_661993877a526435 notify("merc_stronghold_unlocked");
    if (issharedfuncdefined("ob_quest_missions", "onMercStrongholdActive")) {
        [[ getsharedfunc("ob_quest_missions", "onMercStrongholdActive") ]](scriptable.var_661993877a526435, player);
    }
    scriptable.var_661993877a526435 thread function_a7fafdf4ccb30418(namespace_4c2b495b8d79cc2e::function_7ec62d1550b9897e(scriptable.var_661993877a526435, "Awareness_Zone"));
    self.var_661993877a526435 function_b92f379a5ad772f8();
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ec1
// Size: 0x69
function private function_e2797519315ed24a() {
    foreach (var_6876372a894fe601 in self.var_bd59a95fc824e0f9) {
        namespace_9e69d66f68c38a10::function_b092780f9ec4496e(var_6876372a894fe601);
    }
    function_edfa3b20cf5df03();
    self.var_bd59a95fc824e0f9 = [];
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f31
// Size: 0x316
function function_f40b2a445b8885bc() {
    var_4cd134afbae005e7 = self.var_566dc3346c682517.origin;
    var_d1b5c53f98b507d0 = 1000;
    var_98054eaa8f429690 = namespace_8480efeffcd6e233::function_5bbdc39a533d9d57(self, "Awareness_Zone");
    if (var_98054eaa8f429690.size) {
        var_4cd134afbae005e7 = var_98054eaa8f429690[0].origin;
        var_d1b5c53f98b507d0 = var_98054eaa8f429690[0].radius;
    }
    var_510c132b62d77d0a = [0:"ob_loot_cache", 1:"ob_loot_cache_large"];
    var_e9797ff12b9b7021 = getlootscriptablearrayinradius(var_510c132b62d77d0a, undefined, var_4cd134afbae005e7, var_d1b5c53f98b507d0);
    var_bd0496839afeb73 = [];
    var_3460c39ea31fc730 = [];
    foreach (cache in var_e9797ff12b9b7021) {
        if (cache.type == "ob_loot_cache") {
            var_bd0496839afeb73[var_bd0496839afeb73.size] = cache;
        } else if (cache.type == "ob_loot_cache_large") {
            var_3460c39ea31fc730[var_3460c39ea31fc730.size] = cache;
        } else {
            /#
                assertex(0, "How did we get a loot scriptable of type '" + cache.type + "'? That wasn't one of the types we requested!");
            #/
        }
    }
    var_d42784e04cbb4c73 = var_bd0496839afeb73.size;
    var_78bba535c596d8d2 = var_3460c39ea31fc730.size;
    self.lootcache_spawns = array_randomize(self.lootcache_spawns);
    foreach (spawnpoint in self.lootcache_spawns) {
        var_55a1bbe3cf72ddb7 = 0;
        foreach (cache in var_e9797ff12b9b7021) {
            if (distancesquared(cache.origin, spawnpoint.origin) < 5625) {
                var_55a1bbe3cf72ddb7 = 1;
                break;
            }
        }
        if (!var_55a1bbe3cf72ddb7) {
            if (var_d42784e04cbb4c73 < self.var_d2d422f50501ae28) {
                cache = namespace_9b83895815d12835::function_71d64108850e7b91(#"hash_31848ee41c7d520d", spawnpoint.origin, spawnpoint.angles - (0, 90, 0));
                cache setscriptablepartstate("body", "closed_usable");
                var_d42784e04cbb4c73 = var_d42784e04cbb4c73 + 1;
            } else if (var_78bba535c596d8d2 < self.var_d133a794fe336c9d) {
                cache = namespace_9b83895815d12835::function_71d64108850e7b91(#"hash_c1d0ea6db3f38ac5", spawnpoint.origin, spawnpoint.angles - (0, 90, 0));
                cache setscriptablepartstate("body", "closed_usable");
                var_78bba535c596d8d2 = var_78bba535c596d8d2 + 1;
            } else {
                break;
            }
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224e
// Size: 0xee
function function_f916023bc6d70f23() {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("instance_destroyed");
    self waittill("warlord_key_picked");
    struct = sortbydistance(level.ob.var_3c0bad034d227d02, self.var_cdde8e8fc33af4.origin)[0];
    radio = spawnscriptable("ob_intel_terminus_audio", struct.origin, struct.angles);
    radio.var_84e2ca49013808d2 = self.var_cb5b9e43220882fe;
    /#
        radio thread namespace_287c594b1c56aa67::function_6e50624e2c06832b();
    #/
    if (!isdefined(level.var_d97f7ce3bb56f2a3["terminus_audio_intel_warlord"])) {
        level.var_d97f7ce3bb56f2a3["terminus_audio_intel_warlord"] = [];
    }
    level.var_d97f7ce3bb56f2a3["terminus_audio_intel_warlord"] = array_add(level.var_d97f7ce3bb56f2a3["terminus_audio_intel_warlord"], radio);
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2343
// Size: 0x37
function function_587c183c4febe0f4() {
    var_859971acf7540876 = "e_cover_" + self.var_8eefbcaeafb2ba74.target;
    self.var_bdbc894efe4c6a96 = function_e9158c9e8c391f25(var_859971acf7540876);
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2381
// Size: 0x110
function function_5d929bdf9c67783f() {
    self.encounter = function_3ee36bc763779ba1(self.var_566dc3346c682517.target, 1, 0, 1, 2);
    if (isdefined(self.encounter)) {
        function_d37068aac7785c04(self.encounter, self.var_fc4ffac4746eb217, 1);
        function_ce9c21523336cdbc(self.encounter, &function_92b5f29556b6c5b3, self);
        function_3c85fe57dbc02e4e(self.encounter, &function_7545164b5529be52, self);
        function_ff46e79c8c7a21c8(self.var_52116bd9513e6108);
        self.var_8d95ebec3c279578 = namespace_1c689dd3986a841c::function_54da428ad4a96f2e("ai_encounter:" + "jup_ob_merc_stronghold_encounter_safe", self.safe.origin, 2048, 0, 1, 0);
        thread function_c5770043463ad63();
    }
    var_280ab764114c5fb6 = function_9a39e23c3c52c2af(self.encounter);
    if (isdefined(var_280ab764114c5fb6)) {
        self.var_b60d01789277400 = var_280ab764114c5fb6.origin;
        self.var_14746953cdb49874 = var_280ab764114c5fb6.radius;
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2498
// Size: 0x6e
function function_92b5f29556b6c5b3(encounterid, var_e6013eac45290cab, agent, data) {
    level endon("game_ended");
    agent endon("death");
    agent.var_5323a94889eff1de = 1;
    agent ent_flag_wait("stealth_enabled");
    agent setstealthstate("combat");
    agent function_8b6c9d30305fd087(agent, var_e6013eac45290cab);
    var_e6013eac45290cab thread function_230e249807e20ca7(encounterid, agent);
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x250d
// Size: 0x1d
function function_7545164b5529be52(encounterid, var_e6013eac45290cab, wave) {
    return 0;
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2532
// Size: 0x18d
function function_bfb2d106fb179ca2(encounterid, var_e6013eac45290cab, agent, data) {
    level endon("game_ended");
    agent endon("death");
    agent.qsetgoalpos = 1;
    agent ob::function_e83e24c88a9a762c(1);
    agent.var_5323a94889eff1de = 1;
    agent ent_flag_wait("stealth_enabled");
    agent setstealthstate("combat");
    if (!isdefined(agent.script_stealthgroup) || !isdefined(level.stealth.combat_volumes[agent.script_stealthgroup])) {
        safe = var_e6013eac45290cab.safe;
        if (isdefined(safe)) {
            var_a6911d286b1b19a0 = 36;
            var_49cbbdcc9e6795d4 = 500;
            var_3c3e93a17afec361 = safe.origin + anglestoforward(safe.angles) * var_a6911d286b1b19a0;
            var_3c3e93a17afec361 = var_3c3e93a17afec361 + (0, 0, 12);
            var_3c3e93a17afec361 = getclosestpointonnavmesh(var_3c3e93a17afec361);
            agent.goalheight = 80;
            agent setgoalpos(var_3c3e93a17afec361, var_49cbbdcc9e6795d4);
            /#
                if (getdvarint(@"hash_230f5449e5459051", 0) == 1) {
                    level thread debug::drawline(safe.origin, var_3c3e93a17afec361, 9999, game["<unknown string>"]["<unknown string>"]);
                    level thread debug::drawsphere(var_3c3e93a17afec361, 24, 9999, game["<unknown string>"]["<unknown string>"]);
                }
            #/
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c6
// Size: 0xd1
function function_8b6c9d30305fd087(agent, var_e6013eac45290cab) {
    if (!isdefined(agent) || !agent.isactive) {
        return;
    }
    var_d7fed986a016b24b = 120;
    var_9a2ade83732f36f2 = var_e6013eac45290cab.var_b60d01789277400;
    var_c6b2d4e3dc77cf9d = var_e6013eac45290cab.var_14746953cdb49874 + var_d7fed986a016b24b;
    if (isdefined(var_9a2ade83732f36f2) && isdefined(var_c6b2d4e3dc77cf9d)) {
        /#
            if (getdvarint(@"hash_230f5449e5459051", 0) == 1) {
                level thread debug::drawline(var_9a2ade83732f36f2, agent.origin, 9999, game["<unknown string>"]["<unknown string>"]);
                level thread debug::drawsphere(var_9a2ade83732f36f2, var_c6b2d4e3dc77cf9d, 9999, game["<unknown string>"]["<unknown string>"]);
            }
        #/
        agent function_65cdab0fc78aba8f(var_9a2ade83732f36f2, var_c6b2d4e3dc77cf9d);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279e
// Size: 0xcf
function function_dceb459c3597d366(encounterid, var_e6013eac45290cab, agent) {
    level endon("game_ended");
    agent endon("death");
    agent.var_4ebe755e0a0a430e = 1;
    agent.var_1929d925cdb4438f = 600;
    agent.var_9e15c6628beed283 = 1000;
    agent.var_ecf9593266634668 = 1000;
    agent.var_6f4b3de679c353ba = 1200;
    agent.var_cddc39d4b9f0b17d = 120;
    while (1) {
        var_cdc6f7e2bc75d1f6 = 45;
        waittill_notify_or_timeout("goal", var_cdc6f7e2bc75d1f6);
        agent ob::function_e83e24c88a9a762c(0);
        if (self iswithinscriptgoalradius()) {
            break;
        }
    }
    agent.var_4ebe755e0a0a430e = 0;
    function_8b6c9d30305fd087(agent, var_e6013eac45290cab);
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2874
// Size: 0xa0
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    var_2f5d509d7b71ce9a = self;
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    if (isdefined(var_2f5d509d7b71ce9a) && var_2f5d509d7b71ce9a.state != "EndedState") {
        foreach (player in var_b381b0883bcd4847.playerlist) {
            player thread function_4a508fcbbea05afd();
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291b
// Size: 0x6f
function function_cf049bb9bdcb65b1(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    foreach (player in var_2a29b237dcc66fe5) {
        function_99f612c991e568a0(player);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2991
// Size: 0xa8
function function_4a508fcbbea05afd() {
    self endon("death_or_disconnect");
    wait(120);
    player = self;
    if (function_5acc35fc66331385(player, 16946)) {
        player ent_flag_clear("quest_s0a1t4_mstr_approach");
        player ent_flag_clear("quest_s0a1t4_mstr_unlockdoor");
        player ent_flag_clear("quest_s0a1t4_mstr_lastenemydown");
        player ent_flag_clear("quest_s0a1t4_mstr_reenforce");
    }
    if (function_5acc35fc66331385(player, 17078)) {
        player ent_flag_clear("quest_s0a3t3_mercstronghold_approach");
        player ent_flag_clear("quest_s0a3t3_mercstronghold_nokey");
        player ent_flag_clear("quest_s0a3t3_mercstronghold_unlock");
        player ent_flag_clear("quest_s0a3t3_mercstronghold_lastenemy");
        player ent_flag_clear("quest_s0a3t3_mercstronghold_reinforce_resp");
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a40
// Size: 0x73
function private function_230e249807e20ca7(encounterid, agent) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    agent waittill("death");
    if (function_d45cf335caa19838(encounterid) == 0) {
        self notify("merc_stronghold_cleared");
        if (isdefined(self.safe) && !istrue(self.safe.var_d062a6468e65034e)) {
            thread function_9dbc2d439e39df13(self.var_6c29f2fdb0054bbe);
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2aba
// Size: 0x230
function private function_a7fafdf4ccb30418(players) {
    /#
        namespace_46b675bc0fc6663b::function_f7e877aa7e97d952(self, "<unknown string>");
    #/
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    var_694cf27a7080216 = [];
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            continue;
        }
        squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
        var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16946, "quest_s0a1t4_mstr_unlockdoor", squadmembers);
        var_d781ff762095c86d = var_8c4ed29f8594fb86;
        if (!var_8c4ed29f8594fb86) {
            var_d781ff762095c86d = namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0);
        }
        params = spawnstruct();
        params.player = player;
        callback::callback("on_unlock_merc_stronghold", params);
        if (var_8c4ed29f8594fb86 || var_d781ff762095c86d) {
            foreach (squadmember in squadmembers) {
                var_694cf27a7080216[var_694cf27a7080216.size] = squadmember;
            }
        }
    }
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            /#
                namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
            #/
        } else {
            /#
                namespace_46b675bc0fc6663b::function_d170903981c617de(player);
                namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
            #/
            var_568cebb5b294f8c0 = namespace_9718b9a169c3ead0::function_d52f11eff492795d(player);
            thread namespace_9718b9a169c3ead0::function_90db3e7d7b085484(var_568cebb5b294f8c0, "activity_merc_stronghold_unlock_door", [0:player]);
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cf1
// Size: 0x21a
function private function_9dbc2d439e39df13(players) {
    /#
        namespace_46b675bc0fc6663b::function_f7e877aa7e97d952(self, "<unknown string>");
    #/
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    var_694cf27a7080216 = [];
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            continue;
        }
        squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
        var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16946, "quest_s0a1t4_mstr_lastenemydown", squadmembers);
        var_d781ff762095c86d = var_8c4ed29f8594fb86;
        if (!var_8c4ed29f8594fb86) {
            var_d781ff762095c86d = namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0);
        }
        params = spawnstruct();
        params.player = player;
        callback::callback("on_merc_stronghold_cleared_vo", params);
        if (var_8c4ed29f8594fb86 || var_d781ff762095c86d) {
            foreach (squadmember in squadmembers) {
                var_694cf27a7080216[var_694cf27a7080216.size] = squadmember;
            }
        }
    }
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            /#
                namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
            #/
        } else {
            /#
                namespace_46b675bc0fc6663b::function_d170903981c617de(player);
                namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
            #/
            function_1281c7fff9456e18("merc_stronghold_vo_stronghold_cleared", [0:player]);
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f12
// Size: 0x2a0
function private function_dd78c34c770c2497(players) {
    /#
        namespace_46b675bc0fc6663b::function_f7e877aa7e97d952(self, "<unknown string>");
    #/
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    if (function_51d76700600cebe3(30)) {
        /#
            namespace_46b675bc0fc6663b::function_f7e877aa7e97d952(self, "<unknown string>");
        #/
        var_694cf27a7080216 = [];
        foreach (player in players) {
            if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
                continue;
            }
            squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
            var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16946, "quest_s0a1t4_mstr_reenforce", squadmembers);
            var_d781ff762095c86d = var_8c4ed29f8594fb86;
            if (!var_8c4ed29f8594fb86) {
                var_d781ff762095c86d = namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0);
            }
            params = spawnstruct();
            params.player = player;
            callback::callback("on_merc_stronghold_reinforcement", params);
            if (var_8c4ed29f8594fb86 || var_d781ff762095c86d) {
                foreach (squadmember in squadmembers) {
                    var_694cf27a7080216[var_694cf27a7080216.size] = squadmember;
                }
            }
        }
        foreach (player in players) {
            if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
                /#
                    namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
                #/
            } else {
                /#
                    namespace_46b675bc0fc6663b::function_d170903981c617de(player);
                    namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
                #/
                function_1281c7fff9456e18("merc_stronghold_vo_reinforcement_convo", [0:player]);
            }
        }
    } else {
        foreach (player in players) {
            /#
                namespace_46b675bc0fc6663b::function_d170903981c617de(player);
                namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
            #/
        }
        function_1281c7fff9456e18("merc_stronghold_vo_reinforcement", players);
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x31b9
// Size: 0x8f
function private function_7719e82ffdcda669(var_e6013eac45290cab) {
    var_2c05eb8510000fc0 = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    var_af0662d6485d5d58 = namespace_4fda5d7358015a06::function_de53ed8e35d0ed7a(var_e6013eac45290cab);
    if (isdefined(var_af0662d6485d5d58) && var_af0662d6485d5d58 == "REV_OB_MERC_STRONGHOLD") {
        /#
            assert(!isdefined(level.var_83abcb9b3a5dbe24.var_7eb8af4d11d85105) || !isdefined(level.var_83abcb9b3a5dbe24.var_7eb8af4d11d85105[var_2c05eb8510000fc0]));
        #/
        level.var_83abcb9b3a5dbe24.var_7eb8af4d11d85105[var_2c05eb8510000fc0] = var_e6013eac45290cab;
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x324f
// Size: 0x55
function private function_2ced1a9613bd11ab(var_e6013eac45290cab) {
    uniqueid = function_f0f498aed6f8fa5d(var_e6013eac45290cab);
    var_af0662d6485d5d58 = namespace_4fda5d7358015a06::function_de53ed8e35d0ed7a(var_e6013eac45290cab);
    if (isdefined(var_af0662d6485d5d58) && var_af0662d6485d5d58 == "REV_OB_MERC_STRONGHOLD") {
        level.var_83abcb9b3a5dbe24.var_7eb8af4d11d85105[uniqueid] = undefined;
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32ab
// Size: 0xd3
function private function_97724206a31d0a1a() {
    var_ed2a434bd0491fba = [];
    if (isdefined(level.var_83abcb9b3a5dbe24.var_7eb8af4d11d85105)) {
        foreach (instance in level.var_83abcb9b3a5dbe24.var_7eb8af4d11d85105) {
            if (!isdefined(instance)) {
                continue;
            }
            var_8f31733913565905 = namespace_4fda5d7358015a06::function_73bd348a2ec322cf(instance);
            if (!isdefined(var_8f31733913565905) || !(var_8f31733913565905 == "IdleState" || var_8f31733913565905 == "ActiveState")) {
                continue;
            }
            /#
                assert(namespace_4fda5d7358015a06::function_de53ed8e35d0ed7a(instance) == "REV_OB_MERC_STRONGHOLD");
            #/
            var_ed2a434bd0491fba[var_ed2a434bd0491fba.size] = instance;
        }
    }
    return var_ed2a434bd0491fba;
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3386
// Size: 0x1f1
function private function_99f612c991e568a0(player) {
    /#
        assert(isdefined(player));
    #/
    /#
        namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
    #/
    function_bbdcd857d0c2a65e(self, player, "PlayerJoinedOther");
    squadmembers = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
    var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16946, "quest_s0a1t4_mstr_approach", squadmembers);
    var_d781ff762095c86d = var_8c4ed29f8594fb86;
    if (!var_8c4ed29f8594fb86) {
        foreach (player in squadmembers) {
            if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
                var_d781ff762095c86d = 1;
                break;
            }
        }
    }
    foreach (player in squadmembers) {
        params = spawnstruct();
        params.player = player;
        callback::callback("on_approach_merc_stronghold", params);
    }
    if (!var_8c4ed29f8594fb86 && !var_d781ff762095c86d) {
        var_1fb2b7ffa4d3d9f1 = namespace_9718b9a169c3ead0::function_d52f11eff492795d(player, 1);
        /#
            foreach (player in squadmembers) {
                namespace_46b675bc0fc6663b::function_d170903981c617de(player);
            }
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
        #/
        thread namespace_9718b9a169c3ead0::function_90db3e7d7b085484(var_1fb2b7ffa4d3d9f1, "activity_merc_stronghold_approach", squadmembers);
    } else {
        /#
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
        #/
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x357e
// Size: 0x16e
function private function_f390f4ebbe42c73c(var_d6bfa53c531546d6) {
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    if (!isdefined(player)) {
        return;
    }
    if (istrue(var_a917328b0b1b2a19) && isdefined(self.var_bd59a95fc824e0f9) && self.var_bd59a95fc824e0f9.size > 0) {
        /#
            namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
        #/
        function_bbdcd857d0c2a65e(self, player, "PlayerJoinedOther");
        squadmembers = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
        if (isdefined(squadmembers) && isarray(squadmembers) && squadmembers.size > 0 && !namespace_9718b9a169c3ead0::function_1abf09c903e6c16b(squadmembers, "loot_key_human_stronghold")) {
            var_d781ff762095c86d = namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0);
            if (var_d781ff762095c86d) {
                params = spawnstruct();
                params.player = player;
                callback::callback("merc_stronghold_nokey", params);
                /#
                    namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
                #/
            } else {
                /#
                    namespace_46b675bc0fc6663b::function_d170903981c617de(player);
                    namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
                #/
                thread namespace_9718b9a169c3ead0::function_43007b614b2eb884("merc_stronghold_vo_no_key", squadmembers, 300);
            }
        } else {
            /#
                namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
            #/
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36f3
// Size: 0xda
function private function_cefa7b514c4aff6d() {
    level endon("game_ended");
    safe = self.safe;
    while (isdefined(self.safe)) {
        lootid = self.safe waittill("cache_item_looted");
        var_25978461c6e4f61b = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        if (isdefined(var_25978461c6e4f61b) && isstring(var_25978461c6e4f61b) && issubstr(var_25978461c6e4f61b, "loot_key_human_fortress")) {
            thread function_3d04c4bc0abbcfa1(namespace_4c2b495b8d79cc2e::function_7ec62d1550b9897e(self, "Awareness_Zone"), var_25978461c6e4f61b);
            params = spawnstruct();
            params.var_beeb487603b69a3e = safe;
            params.stronghold_name = self.var_626b45032e1892da;
            callback::callback("stronghold_key_looted", params);
            function_612d18fdbc979c0b(self, 1);
            break;
        }
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37d4
// Size: 0x2cf
function private function_3d04c4bc0abbcfa1(players, var_25978461c6e4f61b) {
    /#
        namespace_46b675bc0fc6663b::function_f7e877aa7e97d952(self, "<unknown string>");
    #/
    if (!isdefined(players) || !isarray(players) || players.size == 0 || !isdefined(var_25978461c6e4f61b)) {
        return;
    }
    var_fbc7b9b8af0387d9 = "activity_merc_stronghold_success_generic";
    if (issubstr(var_25978461c6e4f61b, "allforone")) {
        var_fbc7b9b8af0387d9 = "activity_merc_stronghold_success_all_for_one";
    } else if (issubstr(var_25978461c6e4f61b, "chemist")) {
        var_fbc7b9b8af0387d9 = "activity_merc_stronghold_success_chemist";
    } else if (issubstr(var_25978461c6e4f61b, "maestro")) {
        var_fbc7b9b8af0387d9 = "activity_merc_stronghold_success_maestro";
    } else if (issubstr(var_25978461c6e4f61b, "rainmaker")) {
        var_fbc7b9b8af0387d9 = "activity_merc_stronghold_success_rainmaker";
    }
    if (isdefined(var_fbc7b9b8af0387d9)) {
        var_694cf27a7080216 = [];
        foreach (player in players) {
            if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
                continue;
            }
            var_d781ff762095c86d = (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) && var_fbc7b9b8af0387d9 == "activity_merc_stronghold_success_all_for_one";
            if (var_d781ff762095c86d) {
                params = spawnstruct();
                params.player = player;
                params.warlord = "allforone";
                callback::callback("merc_warlord_success", params);
                squadmembers = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
                foreach (squadmember in squadmembers) {
                    var_694cf27a7080216[var_694cf27a7080216.size] = squadmember;
                }
            }
        }
        foreach (player in players) {
            if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
                /#
                    namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>");
                #/
            } else {
                /#
                    namespace_46b675bc0fc6663b::function_d170903981c617de(player);
                    namespace_46b675bc0fc6663b::function_dd0ceeddc603cb3e(player, self, "<unknown string>" + var_fbc7b9b8af0387d9 + "<unknown string>");
                #/
                var_1d1eecf1ed7cbdb0 = namespace_9718b9a169c3ead0::function_d52f11eff492795d(player);
                thread namespace_9718b9a169c3ead0::function_90db3e7d7b085484(var_1d1eecf1ed7cbdb0, var_fbc7b9b8af0387d9, [0:player]);
            }
        }
    } else {
        /#
            namespace_46b675bc0fc6663b::function_f7e877aa7e97d952(self, "<unknown string>");
        #/
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aaa
// Size: 0xe3
function function_99b95e1bcf411ecd() {
    agents = namespace_235de5057ddc58e0::function_d9ce8fb00f0e5fa1(self.origin, self.activity.attract_radius, "team_hundred_ninety");
    var_fad30082b194307b = [];
    foreach (agent in agents) {
        if (!isplayer(agent)) {
            var_fad30082b194307b[var_fad30082b194307b.size] = agent;
        }
    }
    agents = var_fad30082b194307b;
    foreach (agent in agents) {
        agent ent_flag_init("activity_safe_attracted");
    }
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3b94
// Size: 0x35
function private function_f927f5dd26f5e076() {
    /#
        wait(5);
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4cc130b05adeaae0);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_5a6420d2880ffe83/namespace_5b16b088535e3da4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd0
// Size: 0x78
function function_4cc130b05adeaae0() {
    /#
        foreach (player in level.players) {
            function_38e113a4c30f6c0d("<unknown string>", player.origin, player.angles, 0, 1);
        }
    #/
}

