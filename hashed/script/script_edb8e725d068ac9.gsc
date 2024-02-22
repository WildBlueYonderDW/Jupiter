// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_16ea1b94f0f381b3;
#using script_22f1701e151b9d12;
#using script_3e2f8cc477d57433;
#using scripts\cp_mp\tripwire.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_5753ba9c28794a65;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_2304453c69e996e2;
#using script_20a226c24f1585bf;
#using script_5d8202968463a21d;
#using scripts\mp\utility\player.gsc;
#using script_6df6604a74a7a9c7;
#using script_7cfaa6fd841fb4dd;
#using script_2d400da2610fe542;
#using script_5295a2c10229ffef;
#using script_208955cb4d2c8fb3;
#using script_43971bbeefd98f05;
#using script_46c7c73b1a7e4773;
#using script_ec2a55b85051e9b;
#using scripts\engine\scriptable.gsc;
#using script_638d701d263ee1ed;
#using script_24946c036cb2f7b2;
#using script_70c2478fc6d8ef;
#using script_58be75c518bf0d40;
#using script_3ab210ea917601e7;
#using script_42adcce5878f583;
#using script_4e6e58ab5d96c2b0;
#using script_681c3db54537afa6;
#using script_3a246920c9288c4;
#using script_1a70dab983449bb8;
#using script_7c40fa80892a721;
#using script_2b264b25c7da0b12;
#using script_7b2517368c79e5bc;
#using script_64316dc775e91122;
#using script_6bffae1b97f70547;
#using script_398835140857d740;

#namespace namespace_35b2e84a255ee2f6;

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfff
// Size: 0x1a2
function function_8abadf3d8f19384a() {
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_WARLORD", 0, &function_2f2e68800d162bd0);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_WARLORD", 1, &function_117718a13c7de6b0);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_WARLORD", 2, &function_e011dac5a20d257c);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_WARLORD", 3, &function_db6605af979b72df);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_WARLORD", 4, &function_46e783dbae11a33e);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_WARLORD", 5, &function_5d3698def4754183);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_WARLORD", 7, &function_b4364b16b16b0c60);
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("ActivityBegin", &function_ff58fdabe59872b2, "REV_OB_WARLORD");
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("ActivityEnd", &function_57ddbeb9a1cc605e, "REV_OB_WARLORD");
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("PlayerJoin", &function_6d66d93448222103, "REV_OB_WARLORD");
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("PlayerLeave", &function_dc36a8f9522bd566, "REV_OB_WARLORD");
    namespace_17c25f0877bfb620::scriptable_adddamagedcallback(&function_61c4487eafc2bc4c);
    callback::add("on_ai_killed", &function_e5ea18b76842725f);
    namespace_4c2b495b8d79cc2e::function_fca481c0e8fafd2c("SpatialZoneContainerGroup_Warlord_No_Key_Zone", &function_f13be2fe056ab5a, &function_6ce86afa6684b8eb, "handler_comms_nokey");
    namespace_4c2b495b8d79cc2e::function_fca481c0e8fafd2c("SpatialZoneContainerGroup_Warlord_Comms_Zone", &function_f13be2fe056ab5a, &function_e17f7c1d44ee2fe5, "warlord_comms_range");
    namespace_4c2b495b8d79cc2e::function_fca481c0e8fafd2c("SpatialZoneContainerGroup_Warlord_Handler_Comms_Zone", &function_f13be2fe056ab5a, &function_b66d94a678e363e4, "handler_comms_range");
    namespace_4c2b495b8d79cc2e::function_11a6c27cf403881f("SpatialZoneContainerGroup_Warlord_Handler_Comms_Zone", &function_a81c6611776ea959);
    if (getdvarint(@"hash_8560a0fd509568a8", 0)) {
        callback::add("player_spawned", &on_player_spawned);
    }
    setdvarifuninitialized(@"hash_31b253892ec07512", 0.9, 0, 1);
    /#
        function_c638fba4eade0ac3();
    #/
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0x14
function on_player_spawned(params) {
    thread function_a7bac03ceca2c973();
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c3
// Size: 0x34f
function function_2f2e68800d162bd0() {
    self.var_71fe27b31a7295b9 = utility::getstruct(self.var_626b45032e1892da, "targetname");
    self.var_184f5484f9868308 = utility::getstruct(self.var_626b45032e1892da + "_RADIANT", "targetname");
    self.var_deb7b68f91016a2e = [];
    self.vehicles = [];
    self.var_806ca56e5a535ba = [];
    self.agents = [];
    self.mines = [];
    self.var_60b8820e4242e663 = [];
    self.var_1f448c85aab51481 = [];
    self.var_5c2a54b6e701a80b = [];
    self.var_b261b594e5c09a86 = [];
    self.tripwires = [];
    self.vfx = [];
    self.var_23b910077b8047db = [];
    self.var_ec082222d3b65a9a = [];
    self.var_b11fbfdeb09954c2 = [];
    self.var_d420b9a31cb5c4fc = 1;
    function_71443626b27491ba();
    function_d4a7e3d1bed1606c();
    function_862ec3b2476d1b25();
    function_8f94c63669b258b();
    thread function_6fbbd049f160f136();
    if (isdefined(self.var_71fe27b31a7295b9)) {
        self.var_fc4ffac4746eb217 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.var_71fe27b31a7295b9.origin);
        switch (self.var_fc4ffac4746eb217) {
        case #"hash_7bb2cd766703d463":
            self.var_b90c26f642e9b96e = "ob_major_activity_complete_green";
            break;
        case #"hash_af83e47edfa8900a":
            self.var_b90c26f642e9b96e = "ob_major_activity_complete_yellow";
            break;
        case #"hash_5343b465e56ec9a4":
            self.var_b90c26f642e9b96e = "ob_major_activity_complete_red";
            break;
        case #"hash_651f76c0ad6741ec":
            self.var_b90c26f642e9b96e = "ob_major_activity_complete_orange";
            break;
        default:
            /#
                println("off" + self.var_71fe27b31a7295b9.origin);
            #/
            return;
        }
    }
    thread function_6997cf73d6a2c9a4();
    if (getdvarint(@"hash_7bad6ebd2065ec37", 0)) {
        function_93b355d72bbf87ba();
    }
    if (getdvarint(@"hash_cd07a64b17183b31", 1) && !istrue(namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("warlords", "warlordIsDisabled", "WARLORD_RAINMAKER"))) {
        thread function_7550473fbe4c5f8d();
    }
    if (!self.var_24ff739b2eb09591 && !self.var_397515a6dd2f503b) {
        function_4c7fb6ad4120d921();
    }
    namespace_4fda5d7358015a06::function_b6fc2c96b463c007(self);
    if (!isdefined(level.ob.var_7dd4780d4e4bff4d)) {
        level.ob.var_7dd4780d4e4bff4d = [];
    }
    level.ob.var_7dd4780d4e4bff4d[level.ob.var_7dd4780d4e4bff4d.size] = self;
    if (self.var_626b45032e1892da == "WARLORD_ALLFORONE") {
        if (isdefined(self.var_1556d7f7e1dc9165)) {
            function_d37068aac7785c04(self.var_1556d7f7e1dc9165, self.var_fc4ffac4746eb217, 1);
            self.var_5818a66f80fcc972 = -1;
            namespace_614554f86e52695c::function_7a2920be35f4386(self.var_1556d7f7e1dc9165, &function_e201002625151c19, [0:self]);
        }
    } else if (self.var_626b45032e1892da == "WARLORD_MAESTRO") {
        namespace_8480efeffcd6e233::function_35da39cae76b832d(self, "warlord_comms_range", 1);
        namespace_8480efeffcd6e233::function_35da39cae76b832d(self, "handler_comms_range", 1);
    }
    namespace_9718b9a169c3ead0::function_cb146e445d78e9ee();
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1519
// Size: 0x285
function function_e201002625151c19(requestid, userdata, var_dcff5961635938a9) {
    var_5b80384993e7ebb8 = userdata[0];
    if (!isdefined(var_5b80384993e7ebb8.var_5818a66f80fcc972)) {
        return 0;
    }
    if (var_5b80384993e7ebb8.var_5818a66f80fcc972 >= 0) {
        if (gettime() > var_5b80384993e7ebb8.var_5818a66f80fcc972) {
            var_5b80384993e7ebb8.var_5818a66f80fcc972 = -1;
            return 1;
        }
        return 0;
    }
    var_59c3e231ca6f0f36 = function_9a39e23c3c52c2af(requestid);
    var_1d4422cffe43a39b = 8;
    var_c239d6d288716b70 = 0;
    switch (var_dcff5961635938a9) {
    case 0:
        var_1d4422cffe43a39b = 22;
        var_c239d6d288716b70 = 1;
        break;
    case 1:
        var_1d4422cffe43a39b = 25;
        var_c239d6d288716b70 = 20;
        break;
    case 2:
        var_1d4422cffe43a39b = 18;
        var_c239d6d288716b70 = 20;
        break;
    case 3:
        var_1d4422cffe43a39b = 8;
        var_c239d6d288716b70 = 90;
        break;
    case 4:
        var_1d4422cffe43a39b = 13;
        var_c239d6d288716b70 = 35;
        break;
    case 5:
        var_1d4422cffe43a39b = 12;
        var_c239d6d288716b70 = 20;
        break;
    case 6:
        var_1d4422cffe43a39b = 8;
        var_c239d6d288716b70 = 180;
        break;
    case 7:
        var_1d4422cffe43a39b = 13;
        var_c239d6d288716b70 = 20;
        break;
    case 8:
        var_1d4422cffe43a39b = 12;
        var_c239d6d288716b70 = 20;
        break;
    case 9:
        var_1d4422cffe43a39b = 8;
        var_c239d6d288716b70 = 90;
        break;
    case 10:
        var_1d4422cffe43a39b = 13;
        var_c239d6d288716b70 = 35;
        break;
    case 11:
        var_1d4422cffe43a39b = 12;
        var_c239d6d288716b70 = 20;
        break;
    case 12:
        var_1d4422cffe43a39b = 8;
        var_c239d6d288716b70 = 180;
        break;
    case 13:
        var_1d4422cffe43a39b = 13;
        var_c239d6d288716b70 = 20;
        break;
    case 14:
        var_1d4422cffe43a39b = 12;
        var_c239d6d288716b70 = 20;
        break;
    case 15:
        var_1d4422cffe43a39b = 8;
        var_c239d6d288716b70 = 90;
        break;
    case 16:
        var_1d4422cffe43a39b = 13;
        var_c239d6d288716b70 = 35;
        break;
    case 17:
        var_1d4422cffe43a39b = 12;
        var_c239d6d288716b70 = 20;
        break;
    default:
        break;
    }
    if (var_59c3e231ca6f0f36.ai.size <= var_1d4422cffe43a39b) {
        if (var_c239d6d288716b70 == 0) {
            return 1;
        }
        var_5b80384993e7ebb8.var_5818a66f80fcc972 = gettime() + var_c239d6d288716b70 * 1000;
    }
    return 0;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a6
// Size: 0xc0
function function_117718a13c7de6b0() {
    var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(self);
    self.var_d1c7613187e69022 = var_d1c7613187e69022;
    self.var_c6358338b001421e = [];
    self.var_5dee1547ae6ea9b9 = [];
    self.var_54f15fe5e3cf317e = [];
    self.var_60b311ec76290e79 = [];
    self.var_51abd1adba5747ef = [];
    namespace_41957062447a88fe::function_3e33031646de23b0(self);
    if (istrue(self.var_d420b9a31cb5c4fc)) {
        var_f14c27c2e4e9c500 = namespace_4c2b495b8d79cc2e::function_5bbdc39a533d9d57(self, "Ambient_AI_Exclusion_Zone");
        namespace_64135de19550f047::function_daee52aa53ad6314(var_f14c27c2e4e9c500[0].origin, var_f14c27c2e4e9c500[0].radius);
    }
    if (var_d1c7613187e69022.var_cdd8220f5e6623f5) {
        thread function_1e1e28d0a6731c06(self);
    }
    /#
        thread function_4e27bde5c4ab78e2();
    #/
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186d
// Size: 0x163
function function_e011dac5a20d257c() {
    foreach (vfx in self.vfx) {
        vfx setscriptablepartstate("state", "hidden");
    }
    if (self.var_626b45032e1892da == "WARLORD_CHEMIST") {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (player.var_d9928cc9ad437613) {
                if (!player namespace_d3f3cf99d75d3345::function_6ef47ee9171ed1b9() && (istrue(player.gasmaskequipped) || istrue(player.gasmaskswapinprogress) && !istrue(player.gasmaskequipped))) {
                    player namespace_d3f3cf99d75d3345::toggle_gasmask("off");
                }
            }
            player.var_d9928cc9ad437613 = 0;
            player namespace_d3f3cf99d75d3345::function_92bdd3200219d4b7();
        }
    }
    if (namespace_4c2b495b8d79cc2e::function_1888d1b2aeeda25(self, "warlord_comms_range")) {
        namespace_4c2b495b8d79cc2e::function_d829ceb32b15c66a(self, "warlord_comms_range");
    }
    if (namespace_4c2b495b8d79cc2e::function_1888d1b2aeeda25(self, "handler_comms_range")) {
        namespace_4c2b495b8d79cc2e::function_d829ceb32b15c66a(self, "handler_comms_range");
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d7
// Size: 0xa2
function function_db6605af979b72df() {
    self.var_d1c7613187e69022 = undefined;
    self.var_c6358338b001421e = undefined;
    self.var_5dee1547ae6ea9b9 = undefined;
    self.var_54f15fe5e3cf317e = undefined;
    self.var_60b311ec76290e79 = undefined;
    self.var_51abd1adba5747ef = undefined;
    if (self.var_23b910077b8047db.size > 0) {
        foreach (cache in self.var_23b910077b8047db) {
            cache freescriptable();
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a80
// Size: 0x3
function function_46e783dbae11a33e() {
    
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x5a
function function_5d3698def4754183(var_6f8af5eb76deac21) {
    var_38c6a2e10b4e4e2b = self.var_71fe27b31a7295b9 function_954eb52ab4cdeb46(tolower("s_" + self.var_626b45032e1892da + "_reward"), "targetname");
    /#
        assertex(isdefined(var_38c6a2e10b4e4e2b[0]), "Unable to spawn Reward Rift. No Reward struct location found.");
    #/
    return var_38c6a2e10b4e4e2b[0];
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aec
// Size: 0x109
function function_b4364b16b16b0c60(var_6f8af5eb76deac21) {
    instance = var_6f8af5eb76deac21.var_2f5d509d7b71ce9a;
    cache = spawnstruct();
    cache.contents = [];
    if (isdefined(instance.var_d1c7613187e69022.var_40a60ab97af0a72d) && instance.var_d1c7613187e69022.var_40a60ab97af0a72d != "") {
        namespace_9b83895815d12835::function_d71a41afca697376(cache, instance.var_d1c7613187e69022.var_40a60ab97af0a72d, 3);
    } else {
        /#
            assertmsg("Unable to spawn loot in Reward Rift. ActivityInstance.warlordrewardlist is undefined.");
        #/
    }
    if (isdefined(instance.var_d1c7613187e69022.var_57bd150ec48f66fd) && instance.var_d1c7613187e69022.var_57bd150ec48f66fd != "") {
        namespace_9b83895815d12835::function_ff5a53c1d3232e2f(cache, 1, instance.var_d1c7613187e69022.var_57bd150ec48f66fd);
    }
    return cache.contents;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bfd
// Size: 0xec
function function_6d66d93448222103(var_6f8af5eb76deac21) {
    playerlist = var_6f8af5eb76deac21.playerlist;
    var_b494ea8c4b70490 = var_6f8af5eb76deac21.var_b494ea8c4b70490;
    if (isdefined(self)) {
        foreach (player in playerlist) {
            if (isdefined(player)) {
                function_172019cfb04f5df4(player.team, player.var_ff97225579de16a);
                player.var_15e233396dbbe296 = getdvarint(@"hash_7abe4b1e03c0f79d", 3);
            }
        }
    }
    if (self.var_626b45032e1892da == "WARLORD_CHEMIST") {
        if (isdefined(level.var_367d292e115ae65c)) {
            [[ level.var_367d292e115ae65c ]](var_6f8af5eb76deac21);
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf0
// Size: 0xe6
function function_dc36a8f9522bd566(var_6f8af5eb76deac21) {
    playerlist = var_6f8af5eb76deac21.playerlist;
    if (self.var_626b45032e1892da == "WARLORD_CHEMIST") {
        if (isdefined(level.var_81ba5adae4e23b59)) {
            [[ level.var_81ba5adae4e23b59 ]](var_6f8af5eb76deac21);
        }
    }
    if (isdefined(self)) {
        foreach (player in playerlist) {
            player.var_15e233396dbbe296 = undefined;
            if (self.state != "EndedState") {
                player function_4a508fcbbea05afd(self.var_626b45032e1892da);
            }
            if (self.var_626b45032e1892da == "WARLORD_MAESTRO") {
                player namespace_d1df78f2235ca173::function_6109bfd0330e0b8f("warlord_maestro", 0);
            }
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ddd
// Size: 0x60
function function_4a508fcbbea05afd(var_3a68e389d096412d) {
    self endon("death_or_disconnect");
    wait(120);
    player = self;
    if (var_3a68e389d096412d == "WARLORD_ALLFORONE") {
        if (function_5acc35fc66331385(player, 17078)) {
            player ent_flag_clear("quest_s0a3t3_mercstronghold_allforone_intro");
            player ent_flag_clear("quest_s0a3t3_merccamp_allforone_success");
            player ent_flag_clear("quest_s0a3t3_mercstronghold_allforone_success");
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e44
// Size: 0x12f
function function_e17f7c1d44ee2fe5(var_d6bfa53c531546d6) {
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    if (isdefined(player) && istrue(var_a917328b0b1b2a19) && isdefined(self) && function_73bd348a2ec322cf(self) == "ActiveState") {
        squadmembers = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
        if (isdefined(squadmembers) && isarray(squadmembers) && squadmembers.size > 0) {
            var_5a6e3a10171c93b = function_9fef405219837367(player.team, player.var_ff97225579de16a);
            if (!var_5a6e3a10171c93b) {
                namespace_277c27ef297ef569::function_1281c7fff9456e18("music_proximity", squadmembers);
                function_f48c2eb99522654c(player.team, player.var_ff97225579de16a);
                wait(3);
            }
            if (!function_37b98a4622b4a7e7(player.team, player.var_ff97225579de16a)) {
                namespace_dc53a27a8db8e6bf::function_d0b51f1ea60e958b(squadmembers, var_5a6e3a10171c93b);
                function_bc48a786f5a1caec(player.team, player.var_ff97225579de16a, 1);
            }
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7a
// Size: 0x1a2
function function_b66d94a678e363e4(var_d6bfa53c531546d6) {
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    if (isdefined(player) && isdefined(self) && function_73bd348a2ec322cf(self) == "ActiveState") {
        function_b83bd9d74d584449(player, var_a917328b0b1b2a19);
        squadmembers = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
        if (isdefined(squadmembers) && isarray(squadmembers) && squadmembers.size > 0) {
            var_6b8fb7dde7d64380 = array_remove(squadmembers, player);
            if (istrue(var_a917328b0b1b2a19)) {
                var_46dd97aee60238fb = !function_32023c054bfb2134(var_6b8fb7dde7d64380);
                if (var_46dd97aee60238fb) {
                    namespace_277c27ef297ef569::function_1281c7fff9456e18("warlord_intro", squadmembers);
                }
                var_5a6e3a10171c93b = function_5514e10e746ae988(player.team, player.var_ff97225579de16a);
                if (!istrue(var_5a6e3a10171c93b)) {
                    function_6fbc52d037ffca97(player.team, player.var_ff97225579de16a);
                    namespace_277c27ef297ef569::function_1281c7fff9456e18("music_intro", squadmembers);
                    wait(3);
                    namespace_dc53a27a8db8e6bf::function_71171b28ba5738df(squadmembers);
                }
            } else {
                var_fa61ee2d73806d3b = !function_32023c054bfb2134(var_6b8fb7dde7d64380);
                var_f5309bc209c4bce1 = function_37b98a4622b4a7e7(player.team, player.var_ff97225579de16a);
                if (var_fa61ee2d73806d3b && var_f5309bc209c4bce1) {
                    namespace_dc53a27a8db8e6bf::function_9c1b6cb8cff3ac15(squadmembers);
                    function_bc48a786f5a1caec(player.team, player.var_ff97225579de16a, 0);
                }
            }
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2123
// Size: 0x54
function private function_bc48a786f5a1caec(team, squad, played) {
    if (!isdefined(team) || !isdefined(squad)) {
        return;
    }
    if (!isdefined(self.var_60b311ec76290e79[team])) {
        self.var_60b311ec76290e79[team] = [];
    }
    self.var_60b311ec76290e79[team][squad] = played;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x217e
// Size: 0x40
function private function_37b98a4622b4a7e7(team, squad) {
    if (!isdefined(team) || !isdefined(squad)) {
        return 0;
    }
    return isdefined(self.var_60b311ec76290e79[team]) && istrue(self.var_60b311ec76290e79[team][squad]);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21c6
// Size: 0x5e
function private function_172019cfb04f5df4(team, squad) {
    if (!isdefined(team) || !isdefined(squad)) {
        return;
    }
    if (!isdefined(self.var_c6358338b001421e[team])) {
        self.var_c6358338b001421e[team] = [];
    }
    if (!isdefined(self.var_c6358338b001421e[team][squad])) {
        self.var_c6358338b001421e[team][squad] = 1;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x222b
// Size: 0x179
function private function_261dedb8a2ab915d() {
    players = [];
    if (isdefined(self.var_c6358338b001421e) && self.var_c6358338b001421e.size > 0) {
        foreach (team, squads in self.var_c6358338b001421e) {
            if (!isdefined(level.squaddata[team])) {
                continue;
            }
            foreach (squad, dummy in squads) {
                if (!isdefined(level.squaddata[team][squad]) || !isdefined(level.squaddata[team][squad].players)) {
                    continue;
                }
                foreach (var_9a367717952b3470 in level.squaddata[team][squad].players) {
                    if (isdefined(var_9a367717952b3470) && isalive(var_9a367717952b3470)) {
                        players[players.size] = var_9a367717952b3470;
                    }
                }
            }
        }
    }
    return players;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23ac
// Size: 0x5e
function private function_f48c2eb99522654c(team, squad) {
    if (!isdefined(team) || !isdefined(squad)) {
        return;
    }
    if (!isdefined(self.var_5dee1547ae6ea9b9[team])) {
        self.var_5dee1547ae6ea9b9[team] = [];
    }
    if (!isdefined(self.var_5dee1547ae6ea9b9[team][squad])) {
        self.var_5dee1547ae6ea9b9[team][squad] = 1;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2411
// Size: 0x40
function private function_9fef405219837367(team, squad) {
    if (!isdefined(team) || !isdefined(squad)) {
        return 0;
    }
    return isdefined(self.var_5dee1547ae6ea9b9[team]) && istrue(self.var_5dee1547ae6ea9b9[team][squad]);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2459
// Size: 0x5e
function private function_6fbc52d037ffca97(team, squad) {
    if (!isdefined(team) || !isdefined(squad)) {
        return;
    }
    if (!isdefined(self.var_54f15fe5e3cf317e[team])) {
        self.var_54f15fe5e3cf317e[team] = [];
    }
    if (!isdefined(self.var_54f15fe5e3cf317e[team][squad])) {
        self.var_54f15fe5e3cf317e[team][squad] = 1;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24be
// Size: 0x40
function private function_5514e10e746ae988(team, squad) {
    if (!isdefined(team) || !isdefined(squad)) {
        return 0;
    }
    return isdefined(self.var_54f15fe5e3cf317e[team]) && istrue(self.var_54f15fe5e3cf317e[team][squad]);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2506
// Size: 0x42
function private function_b83bd9d74d584449(player, var_3fd04a2beccf2b8c) {
    if (!isdefined(player) || !isdefined(player.guid)) {
        return;
    }
    self.var_51abd1adba5747ef[player.guid] = var_3fd04a2beccf2b8c;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x254f
// Size: 0x3a
function private function_d5cb0adc7d9ca575(player) {
    if (!isdefined(player) || !isdefined(player.guid)) {
        return 0;
    }
    return istrue(self.var_51abd1adba5747ef[player.guid]);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2591
// Size: 0x71
function private function_32023c054bfb2134(players) {
    if (!isdefined(players) || !isarray(players)) {
        return 0;
    }
    foreach (player in players) {
        if (function_d5cb0adc7d9ca575(player)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x260a
// Size: 0x183
function private function_71443626b27491ba() {
    var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(self);
    if (var_d1c7613187e69022.var_288c8d9305c3830d != "") {
        self.var_5dcee23735042a7e = namespace_1c689dd3986a841c::function_930897c0d1a7eb24(var_d1c7613187e69022.var_288c8d9305c3830d);
    }
    if (var_d1c7613187e69022.var_6b56b49e3cd8be76 != "") {
        self.var_1556d7f7e1dc9165 = namespace_1c689dd3986a841c::function_930897c0d1a7eb24(var_d1c7613187e69022.var_6b56b49e3cd8be76);
    }
    var_2aaf1db8bada9077 = var_d1c7613187e69022.var_b3158fa4b328eced;
    if (var_2aaf1db8bada9077 == 0) {
        var_2aaf1db8bada9077 = self.var_71fe27b31a7295b9.radius;
    }
    if (var_d1c7613187e69022.var_ce6817a6a5472a74 != "") {
        self.var_7c3ce577a0a6220e = namespace_1c689dd3986a841c::function_54da428ad4a96f2e("ai_flood_fill_encounter:" + var_d1c7613187e69022.var_ce6817a6a5472a74, self.var_71fe27b31a7295b9.origin, var_2aaf1db8bada9077, 0, 1, 0);
    }
    self.var_397515a6dd2f503b = 0;
    self.var_24ff739b2eb09591 = 0;
    self.var_b02230a375a40b26 = 1;
    self.var_237757e83de93466 = 0;
    ent_flag_init("min_bodyguards_spawned");
    if (isdefined(self.var_1556d7f7e1dc9165)) {
        function_fc38783a3da0bc71(self.var_1556d7f7e1dc9165, 1);
        namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(self.var_1556d7f7e1dc9165, &function_4feeab7e11747cbf, self);
        namespace_1c689dd3986a841c::function_11f03fd3165d148f(self.var_1556d7f7e1dc9165, &function_90598913578a8611, self);
    }
    if (istrue(var_d1c7613187e69022.var_3f8e801d4fddc931)) {
        function_4c7fb6ad4120d921();
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2794
// Size: 0x72
function private function_4c7fb6ad4120d921() {
    /#
        assertex(!self.var_397515a6dd2f503b, "Trying to enable a warlord encounter that has already been marked as enabled!");
    #/
    if (isdefined(self.var_5dcee23735042a7e)) {
        function_adcc96a7d541aa36(self.var_5dcee23735042a7e, 0);
        function_fc38783a3da0bc71(self.var_5dcee23735042a7e, 1);
        namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(self.var_5dcee23735042a7e, &function_2cfc1a4b81b1a37e, self);
        self.var_397515a6dd2f503b = 1;
        thread function_46d11b0177fbbf78();
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x280d
// Size: 0x7d
function private function_8f0eda302ff3a00e() {
    if (isdefined(self.var_7c3ce577a0a6220e)) {
        function_adcc96a7d541aa36(self.var_7c3ce577a0a6220e, 0);
        function_fc38783a3da0bc71(self.var_7c3ce577a0a6220e, 1);
        namespace_1c689dd3986a841c::function_e4a67fe4ddca7ed5(self.var_7c3ce577a0a6220e, &function_b78baddc17cc2592, self);
        namespace_1c689dd3986a841c::function_11f03fd3165d148f(self.var_7c3ce577a0a6220e, &function_9414e16098691766, self);
        namespace_1c689dd3986a841c::function_73147cdf5c28d10c(self.var_7c3ce577a0a6220e, &function_36b22edbec3478ce, self);
        self.var_b02230a375a40b26 = 0;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2891
// Size: 0x36
function private function_5f8ee230917bcf2f() {
    if (isdefined(self.var_1556d7f7e1dc9165)) {
        if (!istrue(self.var_d1c7613187e69022.var_a85d020fb4e471f8)) {
            function_18790a3cb3f88db7(self.var_1556d7f7e1dc9165);
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28ce
// Size: 0x9c
function private function_46d11b0177fbbf78() {
    level endon("game_ended");
    self endon("activity_ended");
    self waittill("fortress_unlocked");
    while (self.var_b02230a375a40b26) {
        ent_flag_wait("min_bodyguards_spawned");
        if (self.var_d1c7613187e69022.var_ee83790983314c1c && self.var_237757e83de93466 <= self.var_d1c7613187e69022.var_dca5ed5becc5bc60) {
            function_8f0eda302ff3a00e();
            break;
        } else if (!self.var_d1c7613187e69022.var_ee83790983314c1c) {
            function_8f0eda302ff3a00e();
            break;
        } else {
            waitframe();
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2971
// Size: 0x9c
function function_e5ea18b76842725f(var_d27680ff86693f5c) {
    if (issubstr(self.agent_type, "actor_jup_ob_warlord_")) {
        params = spawnstruct();
        params.warlord_name = self.agent_type;
        params.var_48abf05cf6177c50 = var_d27680ff86693f5c.smeansofdeath;
        params.var_5b949a992945023b = gettime();
        params.var_542053df5d1c8da8 = self.var_d491cd53e778c48e;
        var_d27680ff86693f5c.einflictor callback::callback("warlord_killed", params);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a14
// Size: 0x20d
function private function_97a95cbf18a165f3(warlord) {
    level endon("game_ended");
    self endon("activity_ended");
    smeansofdeath = idflags = idamage = eattacker = killer = warlord waittill("death");
    if (isdefined(warlord)) {
        self.var_8744c7583ee96a5e = warlord.origin;
        if (isplayer(killer) && namespace_838b439602b3acc7::function_5acc35fc66331385(killer, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            params = spawnstruct();
            params.player = killer;
            if (isdefined(self.var_8744c7583ee96a5e)) {
                params.var_1b68ba89f80f2b5c = self.var_8744c7583ee96a5e;
            } else {
                params.var_1b68ba89f80f2b5c = killer.origin;
            }
            callback::callback("merc_warlord_death", params);
        }
    }
    self.var_b02230a375a40b26 = 1;
    thread function_d925580cdefd8594();
    if (isdefined(self.var_d953047f1b4c7c9) && isdefined(self.var_d953047f1b4c7c9.scriptable)) {
        level notify("forced_kill_callout_" + self.var_d953047f1b4c7c9.scriptable.origin);
    }
    if (isdefined(self.heli)) {
        self.heli.var_ef003f7b8aebc2f3 = 1;
    }
    if (isdefined(self.navobstacle)) {
        destroynavobstacle(self.navobstacle);
    }
    foreach (var_6876372a894fe601 in self.var_be1c48bfab7ccb6) {
        namespace_9e69d66f68c38a10::function_b092780f9ec4496e(var_6876372a894fe601);
    }
    self.var_be1c48bfab7ccb6 = [];
    self.var_24ff739b2eb09591 = 0;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c28
// Size: 0x37
function function_39003eb2578c3215(agent) {
    level endon("game_ended");
    self endon("activity_ended");
    killer = agent waittill("death");
    self.var_237757e83de93466--;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c66
// Size: 0x1cc
function private function_2cfc1a4b81b1a37e(requestid, var_e6013eac45290cab, agent, data) {
    var_e6013eac45290cab namespace_41957062447a88fe::function_f0675d4a690011d6(agent);
    var_e6013eac45290cab.agents = utility::array_add(var_e6013eac45290cab.agents, agent);
    var_41a48d1c7552804e = 0;
    if (issubstr(agent.agent_type, "warlord")) {
        var_e6013eac45290cab thread function_97a95cbf18a165f3(agent);
        var_e6013eac45290cab.var_4b7032d8632723e0 = agent;
        var_41a48d1c7552804e = 1;
        if (!isdefined(agent.ob)) {
            agent.ob = spawnstruct();
        }
        agent.ob.instancedata = var_e6013eac45290cab;
        var_e6013eac45290cab notify("warlord_spawned");
    }
    if (issubstr(agent.agent_type, "bodyguard")) {
        var_e6013eac45290cab.var_237757e83de93466++;
        var_e6013eac45290cab thread function_39003eb2578c3215(agent);
    }
    if (isdefined(var_e6013eac45290cab.var_d1c7613187e69022)) {
        if (var_e6013eac45290cab.var_237757e83de93466 > var_e6013eac45290cab.var_d1c7613187e69022.var_dca5ed5becc5bc60) {
            var_e6013eac45290cab ent_flag_set("min_bodyguards_spawned");
        }
    }
    var_72b14bd03dbabac3 = namespace_4c2b495b8d79cc2e::function_5bbdc39a533d9d57(var_e6013eac45290cab, "Awareness_Zone");
    var_d018f00fe7ac52a2 = namespace_4c2b495b8d79cc2e::function_2403f7fe5d40cecc(var_72b14bd03dbabac3[0]);
    agent function_65cdab0fc78aba8f(namespace_4fda5d7358015a06::function_8988a4c89289d7f4(var_e6013eac45290cab), var_d018f00fe7ac52a2);
    agent utility::ent_flag_wait("stealth_enabled");
    if (!istrue(var_41a48d1c7552804e) && var_e6013eac45290cab.var_626b45032e1892da == "WARLORD_CHEMIST") {
        var_bfc5850d296d2ebe = namespace_ad1f398af6f48cb1::function_9acf953fd6bf2e46("Chemist");
        function_9a62f2a3e0ef15fa(agent, var_bfc5850d296d2ebe);
    }
    agent setstealthstate("combat");
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e39
// Size: 0x208
function private function_4feeab7e11747cbf(requestid, var_e6013eac45290cab, agent, data) {
    level endon("game_ended");
    agent endon("death");
    if (!isdefined(agent.ob)) {
        agent.ob = spawnstruct();
    }
    if (isdefined(data.spawnfilter)) {
        agent.ob.spawnfilter = data.spawnfilter;
    }
    if (isdefined(agent.agent_type) && agent.agent_type == "actor_jup_ob_enemy_specialist_rocketeer") {
        agent.disablereload = 1;
        agent.var_dd87797881fb9b6e = 0;
    }
    var_72b14bd03dbabac3 = namespace_4c2b495b8d79cc2e::function_5bbdc39a533d9d57(var_e6013eac45290cab, "Awareness_Zone");
    var_d018f00fe7ac52a2 = namespace_4c2b495b8d79cc2e::function_2403f7fe5d40cecc(var_72b14bd03dbabac3[0]);
    if (var_e6013eac45290cab.var_626b45032e1892da == "WARLORD_RAINMAKER") {
        agent function_65cdab0fc78aba8f(namespace_4fda5d7358015a06::function_8988a4c89289d7f4(var_e6013eac45290cab), var_d018f00fe7ac52a2);
    } else if (isdefined(var_e6013eac45290cab.var_400ddeb71b9dff4a)) {
        agent function_398d3434e12ab1d1(var_e6013eac45290cab.var_400ddeb71b9dff4a);
    } else {
        agent function_65cdab0fc78aba8f(namespace_4fda5d7358015a06::function_8988a4c89289d7f4(var_e6013eac45290cab), var_d018f00fe7ac52a2);
    }
    agent.ob.var_392cd09a100e53d5 = 1;
    agent.ob.var_a2293a1278075bfe = var_e6013eac45290cab.var_626b45032e1892da;
    var_e6013eac45290cab namespace_41957062447a88fe::function_f0675d4a690011d6(agent);
    var_e6013eac45290cab.agents = utility::array_add(var_e6013eac45290cab.agents, agent);
    agent waittill_any_4("stealth_investigate", "stealth_hunt", "stealth_combat", "startCombatRush");
    if (var_e6013eac45290cab.var_626b45032e1892da == "WARLORD_CHEMIST") {
        var_bfc5850d296d2ebe = namespace_ad1f398af6f48cb1::function_9acf953fd6bf2e46("Chemist");
        function_9a62f2a3e0ef15fa(agent, var_bfc5850d296d2ebe);
    }
    function_9604283fa66d5066(var_e6013eac45290cab, agent, data.origin);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3048
// Size: 0x77
function private function_9a62f2a3e0ef15fa(agent, var_bfc5850d296d2ebe) {
    if (!isdefined(agent)) {
        return;
    }
    var_a9fbde0565fc4be7 = isdefined(agent.grenadeweapon) && isdefined(agent.grenadeweapon.basename);
    if (var_a9fbde0565fc4be7 && agent.grenadeweapon.basename == "gas_grenade_exgm_chemist") {
        namespace_d3f3cf99d75d3345::function_c17d42c1c9426b4f(agent, var_bfc5850d296d2ebe);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30c6
// Size: 0x30
function private function_90598913578a8611(requestid, var_e6013eac45290cab, agent) {
    function_9604283fa66d5066(var_e6013eac45290cab, agent, agent.origin);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30fd
// Size: 0x90
function private function_9414e16098691766(requestid, var_e6013eac45290cab, agent) {
    function_9604283fa66d5066(var_e6013eac45290cab, agent, agent.origin);
    warlord = var_e6013eac45290cab.var_4b7032d8632723e0;
    if (issubstr(agent.agent_type, "bodyguard") && isdefined(warlord) && warlord.isactive) {
        agent namespace_87d75ea764a6d2fd::function_b0f5bec38374c8cc(warlord.ob.var_2189bfeed28cbb65);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3194
// Size: 0x87
function private function_9604283fa66d5066(var_e6013eac45290cab, agent, var_80125264ad1e9d85) {
    if (issubstr(agent.agent_type, "sniper")) {
        agent setgoalpos(var_80125264ad1e9d85, 120);
    } else if (issubstr(agent.agent_type, "rocketeer")) {
        agent setgoalpos(var_80125264ad1e9d85, 120);
    } else if (isdefined(var_e6013eac45290cab.var_400ddeb71b9dff4a)) {
        agent setgoalvolumeauto(var_e6013eac45290cab.var_400ddeb71b9dff4a);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3222
// Size: 0x60
function private function_f702262ac6bab5ed(agent, warlord, var_50de4248d0f10ee6) {
    level endon("game_ended");
    agent endon("death");
    if (!isdefined(warlord)) {
        return;
    }
    closestplayer = function_3c32f942d9c8c310(warlord, var_50de4248d0f10ee6);
    if (!isdefined(closestplayer)) {
        return;
    }
    agent setgoalentity(closestplayer);
    agent.goalradius = 512;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3289
// Size: 0x5f
function private function_3c32f942d9c8c310(agent, var_50de4248d0f10ee6) {
    if (!isdefined(agent)) {
        return;
    }
    nearbyplayers = player::getplayersinradius(agent.origin, var_50de4248d0f10ee6);
    closestplayers = utility::get_array_of_closest(agent.origin, nearbyplayers);
    if (closestplayers.size > 0) {
        return closestplayers[0];
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32f0
// Size: 0x18b
function private function_b78baddc17cc2592(requestid, var_e6013eac45290cab, agent, data) {
    var_e6013eac45290cab.agents = utility::array_add(var_e6013eac45290cab.agents, agent);
    var_72b14bd03dbabac3 = namespace_4c2b495b8d79cc2e::function_5bbdc39a533d9d57(var_e6013eac45290cab, "Awareness_Zone");
    var_d018f00fe7ac52a2 = namespace_4c2b495b8d79cc2e::function_2403f7fe5d40cecc(var_72b14bd03dbabac3[0]);
    agent function_65cdab0fc78aba8f(namespace_4fda5d7358015a06::function_8988a4c89289d7f4(var_e6013eac45290cab), var_d018f00fe7ac52a2);
    if (var_e6013eac45290cab.var_626b45032e1892da == "WARLORD_RAINMAKER") {
        agent thread function_f6c1105658306786();
    }
    if (var_e6013eac45290cab.var_626b45032e1892da == "WARLORD_ALLFORONE") {
        if (!isdefined(var_e6013eac45290cab.var_4b7032d8632723e0.var_cfe1965e9b3580f6)) {
            var_e6013eac45290cab.var_4b7032d8632723e0.var_cfe1965e9b3580f6 = gettime();
        }
        if (var_e6013eac45290cab.var_4b7032d8632723e0.var_cfe1965e9b3580f6 + 1000 < gettime()) {
            var_e6013eac45290cab.var_4b7032d8632723e0 thread namespace_dc53a27a8db8e6bf::function_ad4a51e0b0472ebd();
            var_e6013eac45290cab.var_4b7032d8632723e0.var_cfe1965e9b3580f6 = gettime();
        }
        agent.aggressivemode = 1;
        agent.ignoresuppression = 1;
        agent.usestrictreacquiresightshoot = 1;
        agent.cautiousnavigation = 0;
        agent.balwayscoverexposed = 0;
        function_f702262ac6bab5ed(agent, var_e6013eac45290cab.var_4b7032d8632723e0, 1000);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3482
// Size: 0x3e
function private function_f6c1105658306786() {
    self endon("death");
    wait(20);
    self setgoalvolumeauto(level.var_d6b75448d8220ea3);
    self.aggressivemode = 1;
    level.var_ce26c3aea06b3627[level.var_ce26c3aea06b3627.size] = self;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34c7
// Size: 0x2f
function private function_36b22edbec3478ce(requestid, var_e6013eac45290cab, agent, data) {
    return var_e6013eac45290cab.var_b02230a375a40b26;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34fe
// Size: 0x33f
function private function_d4a7e3d1bed1606c() {
    function_d1f612ac9ad83918();
    self.var_891ab818b773199c = array_combine(getstructarray(self.var_184f5484f9868308.target, "targetname"), getentitylessscriptablearray(self.var_184f5484f9868308.target, "targetname"), function_f159c10d5cf8f0b4(self.var_184f5484f9868308.target, "targetname"));
    zone = namespace_4c2b495b8d79cc2e::function_5bbdc39a533d9d57(self, "Proximity_Join_Zone");
    searchradius = namespace_4c2b495b8d79cc2e::function_2403f7fe5d40cecc(zone[0]);
    self.var_d740584cd9c7ca06 = getentitylessscriptablearray(undefined, undefined, self.var_184f5484f9868308.origin, searchradius, "door");
    foreach (var_984eb80cc693fb87 in self.var_891ab818b773199c) {
        if (isdefined(var_984eb80cc693fb87.script_noteworthy)) {
            switch (var_984eb80cc693fb87.script_noteworthy) {
            case #"hash_d35ffa282189588":
                function_dbfc831a765bed05(var_984eb80cc693fb87, 1);
                break;
            case #"hash_106df5d1729e996":
                function_dbfc831a765bed05(var_984eb80cc693fb87, 0);
                break;
            case #"hash_291b6952be381b6":
                function_4838fdf98c26f014(var_984eb80cc693fb87);
                break;
            case #"hash_4428070f2d520b00":
                self.var_60b8820e4242e663[self.var_60b8820e4242e663.size] = var_984eb80cc693fb87;
                break;
            case #"hash_2242fe24e997a6d9":
                self.var_1f448c85aab51481[self.var_1f448c85aab51481.size] = var_984eb80cc693fb87;
                break;
            case #"hash_5c206a7eaf25a048":
                if (var_984eb80cc693fb87.script_parameters == "fortress") {
                    self.var_400ddeb71b9dff4a = var_984eb80cc693fb87;
                }
                self.var_deb7b68f91016a2e[self.var_deb7b68f91016a2e.size] = var_984eb80cc693fb87;
                break;
            case #"hash_b0ac7b80eaf29c7d":
                function_a2cadb9697f95c6c(var_984eb80cc693fb87);
                break;
            case #"hash_433afd693fd45d50":
                self.var_ec082222d3b65a9a[self.var_ec082222d3b65a9a.size] = var_984eb80cc693fb87;
                break;
            }
        }
        if (isdefined(var_984eb80cc693fb87.classname)) {
            if (issubstr(var_984eb80cc693fb87.classname, "scriptable_blocker")) {
                function_3e2148b8c3d77d9a(var_984eb80cc693fb87);
            }
            if (issubstr(var_984eb80cc693fb87.classname, "scriptable_ob_toggleable")) {
                function_3e2148b8c3d77d9a(var_984eb80cc693fb87);
            }
            if (issubstr(var_984eb80cc693fb87.classname, "tripwire")) {
                self.tripwires[self.tripwires.size] = var_984eb80cc693fb87;
            }
        }
    }
    function_3d4be0b871f56777();
    function_ecbf61c3f62144d9();
    function_eb6bcc12e631d5c3();
    function_539df65138ab1658();
    function_c0e7edb7e5689007();
    if (getdvarint(@"hash_c12188e0dd4944e0", 1)) {
        function_e2dbf4d781dcd9b();
    }
    if (getdvarint(@"hash_1a0fd324434e98b1", 1)) {
        thread function_264adfbf7055e8b4();
    }
    if (getdvarint(@"hash_c17259bab05fb81e", 1)) {
        thread function_989a82177d3587e3();
    }
    self.var_d740584cd9c7ca06 = undefined;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3844
// Size: 0x4e
function function_3d4be0b871f56777() {
    if (isdefined(self.var_184f5484f9868308.script_noteworthy)) {
        var_7f8c8f8cc7f509da = "e_cover_" + self.var_184f5484f9868308.script_noteworthy;
        self.var_806ca56e5a535ba = namespace_17b45e55cf344cda::function_e9158c9e8c391f25(var_7f8c8f8cc7f509da);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3899
// Size: 0x25
function function_ecbf61c3f62144d9() {
    self.var_5c2a54b6e701a80b = self.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_a230870ff680af93("warlord_trigger", "targetname");
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38c5
// Size: 0x1d
function private function_3e2148b8c3d77d9a(blocker) {
    blocker setscriptablepartstate("state", "visible");
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38e9
// Size: 0x339
function private function_dbfc831a765bed05(doornode, var_732ad47bbbde1f2d) {
    var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(self);
    if (!isdefined(self.var_be1c48bfab7ccb6)) {
        self.var_be1c48bfab7ccb6 = [];
    }
    var_98fa2809e21ff34f = [];
    var_98fa2809e21ff34f = namespace_9e69d66f68c38a10::function_ad1b6accbaab404e(doornode, var_98fa2809e21ff34f, var_d1c7613187e69022.var_9a002d7b10d97a7d, istrue(var_732ad47bbbde1f2d), 1, self.var_d740584cd9c7ca06);
    if (getdvarint(@"hash_7b3451672ea3da42", 1) == 0) {
        return;
    }
    foreach (var_aaa3e5affa4753c9 in var_98fa2809e21ff34f) {
        currentdoor = undefined;
        var_8a27b0bf423dfbbc = isdefined(doornode.script_parameters) && doornode.script_parameters == "InvertedLockedDoor";
        var_aaa3e5affa4753c9 setscriptablepartstate("door", "invisible");
        if (isdefined(var_aaa3e5affa4753c9.var_5c493302b016b154)) {
            currentdoor = spawnscriptable("scriptable_door_armory_metal_01", var_aaa3e5affa4753c9.origin, var_aaa3e5affa4753c9.angles);
            if (isdefined(currentdoor)) {
                var_aaa3e5affa4753c9.var_5c493302b016b154.var_d0b5210a732916e4 = currentdoor;
                function_8aa310a1da096b43(currentdoor, var_aaa3e5affa4753c9);
                namespace_9e69d66f68c38a10::function_fbbfe6f05eda5eb1(currentdoor);
            } else {
                /#
                    println("allforone_heli_combat_range" + var_aaa3e5affa4753c9.origin);
                #/
            }
        } else if (istrue(var_aaa3e5affa4753c9.var_3d9512b73bdc1514)) {
            currentdoor = spawnscriptable("scriptable_door_armory_metal_02", var_aaa3e5affa4753c9.origin, var_aaa3e5affa4753c9.angles);
            if (isdefined(currentdoor)) {
                if (isdefined(var_aaa3e5affa4753c9.var_d0b5210a732916e4)) {
                    var_aaa3e5affa4753c9.var_d0b5210a732916e4.var_5c493302b016b154 = currentdoor;
                } else {
                    /#
                        println("<unknown string>" + var_aaa3e5affa4753c9.origin);
                    #/
                }
                function_8aa310a1da096b43(currentdoor, var_aaa3e5affa4753c9);
                if (issubstr(currentdoor.classname, "saloon")) {
                    var_f34a60219065c89 = 1;
                }
                if (istrue(var_f34a60219065c89)) {
                    currentdoor function_9af4c9b2cc1bf989();
                } else {
                    currentdoor scriptabledoorfreeze(1);
                }
            }
        } else {
            var_5a6d681c50a11025 = var_8a27b0bf423dfbbc ? "scriptable_door_security_02" : "scriptable_door_security_01";
            if (!istrue(var_732ad47bbbde1f2d) && isdefined(doornode.script_parameters)) {
                var_5a6d681c50a11025 = doornode.script_parameters;
            }
            currentdoor = spawnscriptable(var_5a6d681c50a11025, var_aaa3e5affa4753c9.origin, var_aaa3e5affa4753c9.angles);
            if (isdefined(currentdoor)) {
                function_8aa310a1da096b43(currentdoor, var_aaa3e5affa4753c9);
                namespace_9e69d66f68c38a10::function_fbbfe6f05eda5eb1(currentdoor);
            }
        }
        if (istrue(var_732ad47bbbde1f2d)) {
            currentdoor.var_1166203281bb91a5 = "jup_ob_keycard_swipe_unlock_beep";
            currentdoor.var_def557e8fd5c6763 = &function_66d288b89ec18bd2;
            self.var_be1c48bfab7ccb6[self.var_be1c48bfab7ccb6.size] = currentdoor;
        } else {
            currentdoor scriptabledoorfreeze(1);
        }
        currentdoor.var_f702066d9d4dcc23 = self;
    }
    if (!self.var_24ff739b2eb09591) {
        self.var_24ff739b2eb09591 = 1;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c29
// Size: 0xca
function private function_8aa310a1da096b43(var_7a6131ab96b68b01, var_2895005a0a9f4db2) {
    if (istrue(var_2895005a0a9f4db2.var_67535222a761bdc5)) {
        var_7a6131ab96b68b01.var_67535222a761bdc5 = var_2895005a0a9f4db2.var_67535222a761bdc5;
        var_7a6131ab96b68b01.keyname = var_2895005a0a9f4db2.keyname;
        var_7a6131ab96b68b01.var_9ccea499f9e1b693 = var_2895005a0a9f4db2.var_9ccea499f9e1b693;
        var_7a6131ab96b68b01.node = var_2895005a0a9f4db2.node;
        var_7a6131ab96b68b01.var_9bcdd0a1013cc2cb = var_2895005a0a9f4db2.var_9bcdd0a1013cc2cb;
        var_7a6131ab96b68b01.var_f87ce576cbf4518a = var_2895005a0a9f4db2.var_f87ce576cbf4518a;
        if (istrue(var_2895005a0a9f4db2.var_3d9512b73bdc1514)) {
            var_7a6131ab96b68b01.var_3d9512b73bdc1514 = 1;
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cfa
// Size: 0x247
function private function_539df65138ab1658() {
    if (self.var_5c2a54b6e701a80b.size > 0) {
        foreach (vol in self.var_5c2a54b6e701a80b) {
            if (vol.script_noteworthy == "navblocker_warlord") {
                var_addbf9ea7bfa9c23 = spawnstruct();
                var_addbf9ea7bfa9c23 = vol.struct;
            }
        }
    }
    if (isdefined(var_addbf9ea7bfa9c23)) {
        var_1cfa81fdd4562d43 = [];
        var_773e2fd7fe3fcbc = var_addbf9ea7bfa9c23.origin[0] + abs(var_addbf9ea7bfa9c23.var_750c4cbbadf7cc32[0]);
        var_773e3fd7fe3feef = var_addbf9ea7bfa9c23.origin[1] + abs(var_addbf9ea7bfa9c23.var_750c4cbbadf7cc32[1]);
        var_773e4fd7fe40122 = var_addbf9ea7bfa9c23.origin[2] + abs(var_addbf9ea7bfa9c23.var_750c4cbbadf7cc32[2]);
        var_1cfa81fdd4562d43["max"] = (var_773e2fd7fe3fcbc, var_773e3fd7fe3feef, var_773e4fd7fe40122);
        var_1e9cb8c052e930c6 = var_addbf9ea7bfa9c23.origin[0] - abs(var_addbf9ea7bfa9c23.var_74e936bbadd15418[0]);
        var_1e9cb9c052e932f9 = var_addbf9ea7bfa9c23.origin[1] - abs(var_addbf9ea7bfa9c23.var_74e936bbadd15418[1]);
        var_1e9cb6c052e92c60 = var_addbf9ea7bfa9c23.origin[2] - abs(var_addbf9ea7bfa9c23.var_74e936bbadd15418[2]);
        var_1cfa81fdd4562d43["min"] = (var_1e9cb8c052e930c6, var_1e9cb9c052e932f9, var_1e9cb6c052e92c60);
        halfsize = (abs(var_773e2fd7fe3fcbc - var_1e9cb8c052e930c6) / 2, abs(var_773e3fd7fe3feef - var_1e9cb9c052e932f9) / 2, abs(var_773e4fd7fe40122 - var_1e9cb6c052e92c60) / 2);
        center = (var_1cfa81fdd4562d43["max"][0] - halfsize[0], var_1cfa81fdd4562d43["max"][1] - halfsize[1], var_1cfa81fdd4562d43["max"][2] - halfsize[2]);
        self.navobstacle = createnavobstaclebybounds(center, halfsize, var_addbf9ea7bfa9c23.angles);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f48
// Size: 0x80
function private function_c0e7edb7e5689007() {
    if (self.var_5c2a54b6e701a80b.size > 0) {
        foreach (vol in self.var_5c2a54b6e701a80b) {
            if (vol.script_noteworthy == "NoVOBanner_warlord_allforone") {
                self.var_676f150f4c7fc9fa = vol;
                break;
            }
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fcf
// Size: 0x51
function private function_4838fdf98c26f014(barrel) {
    barrel setscriptablepartstate("state", "healthy");
    barrel.navobstacleid = createnavobstaclebybounds(barrel.origin, (16, 16, 45), barrel.angles);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4027
// Size: 0x109
function function_61c4487eafc2bc4c(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (istrue(instance.destroyed)) {
        return;
    }
    if (is_equal(instance.type, "barrel_toggleable_red")) {
        thread red_barrel_explosion_monitor(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname);
    } else if (is_equal(instance.type, "jup_ob_inflatable_dummy")) {
        instance thread namespace_c569d26b8efc6f63::function_234f1442e280f1fd(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname);
    } else if (is_equal(instance.type, "equip_claymore_ob")) {
        instance thread namespace_64135de19550f047::function_cd2b3e5bab3edee3(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params b, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4137
// Size: 0x146
function private red_barrel_explosion_monitor(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    level endon("game_ended");
    instance notify("red_barrel_explosion_monitor");
    instance endon("red_barrel_explosion_monitor");
    /#
        assertex(instance getscriptablehaspart("state"), "Wrong scriptable Setup in WARLORD_EXPLOSIVE_BARREL_SCRIPTABLE instance positioned at: " + instance.origin);
    #/
    var_463cf58c82e9c761 = getdvarint(@"hash_d5bf7c2cfa2963af", 300);
    outerdamage = getdvarint(@"hash_7e4c624175a9b761", 50);
    innerdamage = getdvarint(@"hash_8d319c1d79922952", 200);
    var_4b9b79c266a7679b = gettime() + 5000;
    while (gettime() < var_4b9b79c266a7679b) {
        if (instance getscriptablepartstate("state") == "explode") {
            radiusdamage(instance.origin, var_463cf58c82e9c761, innerdamage, outerdamage, eattacker, "MOD_EXPLOSIVE", objweapon);
            break;
        } else {
            waitframe();
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4284
// Size: 0x3e
function private function_d1f612ac9ad83918() {
    if (!isdefined(level.var_e9a6fc11b0aa7eb2)) {
        tripwire::init();
        level.var_46f13cac76d49010 = "jup_frag_grenade_ob";
        if (isdefined(level.var_f1bff73a86c35c52)) {
            [[ level.var_f1bff73a86c35c52 ]]();
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42c9
// Size: 0x24e
function private function_eb6bcc12e631d5c3() {
    self.tripwires = array_randomize(self.tripwires);
    var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(self);
    self.var_3ed142e5e1a337f3 = function_53c4c53197386572(var_d1c7613187e69022.var_12dbcbe997fde0ca, 5);
    var_303f68b800b31d41 = getentitylessscriptablearray("scriptable_ob_tripwire_wall_pin", "classname");
    var_7a342a650beabd86 = getentitylessscriptablearray("scriptable_ob_tripwire_frag", "classname");
    if (self.tripwires.size < self.var_3ed142e5e1a337f3) {
        self.var_3ed142e5e1a337f3 = self.tripwires.size;
    }
    for (i = 0; i < self.var_3ed142e5e1a337f3; i++) {
        var_4512f5142b419e2b = [];
        foreach (var_b883439f9a76c8 in var_303f68b800b31d41) {
            if (self.tripwires[i].target == var_b883439f9a76c8.targetname) {
                var_4512f5142b419e2b[var_4512f5142b419e2b.size] = var_b883439f9a76c8;
            }
        }
        var_303f68b800b31d41 = array_remove_array(var_303f68b800b31d41, var_4512f5142b419e2b);
        var_dda1eb26def14860 = [];
        foreach (frag in var_7a342a650beabd86) {
            if (self.tripwires[i].target == frag.targetname) {
                var_dda1eb26def14860[var_dda1eb26def14860.size] = frag;
            }
        }
        var_7a342a650beabd86 = array_remove_array(var_7a342a650beabd86, var_dda1eb26def14860);
        targets = array_combine(var_4512f5142b419e2b, var_dda1eb26def14860);
        [[ level.var_e9a6fc11b0aa7eb2 ]](self.tripwires[i], "team_hundred_ninety", targets);
        self.tripwires[i].var_e6013eac45290cab = self;
        self.tripwires[i].var_70587812595fd991 = function_53c4c53197386572(var_d1c7613187e69022.var_8e78ad3db9ae547b, undefined);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x451e
// Size: 0x36
function private function_a2cadb9697f95c6c(scriptable) {
    self.vfx = array_add(self.vfx, scriptable);
    scriptable setscriptablepartstate("state", "visible");
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x455b
// Size: 0xa6
function private function_66d288b89ec18bd2(var_67c2ef0a05674606, player) {
    level endon("game_ended");
    var_f702066d9d4dcc23 = var_67c2ef0a05674606.var_f702066d9d4dcc23;
    var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(var_f702066d9d4dcc23);
    var_f702066d9d4dcc23 function_ecb9170931917bd();
    var_f702066d9d4dcc23 namespace_dc53a27a8db8e6bf::function_d13aa6af7fce67c9(var_f702066d9d4dcc23.var_6c29f2fdb0054bbe);
    var_ece2647396f544df = loot::getlootidfromref(var_f702066d9d4dcc23 function_1404cfa239b8c45a());
    if (isdefined(var_ece2647396f544df)) {
        var_65b695f0c0d909ed = player namespace_fe9526a81c458d8f::function_4776284a348ebb6a(var_ece2647396f544df);
    }
    if (isdefined(var_65b695f0c0d909ed) && var_65b695f0c0d909ed != -1) {
        player namespace_fe9526a81c458d8f::function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 0);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4608
// Size: 0x195
function private function_ecb9170931917bd() {
    /#
        assertex(self.var_24ff739b2eb09591, "Trying to unlock a fortress which is already unlocked!");
    #/
    if (isdefined(self.var_e6d1986ed1cf685b) && istrue(level.var_9171353caa234820)) {
        foreach (var_e39e4121d5ca035b in self.var_e6d1986ed1cf685b) {
            namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("team_mortars", "mortar_stop", var_e39e4121d5ca035b);
            operator = var_e39e4121d5ca035b.operator;
            if (isdefined(operator) && isagent(operator)) {
                operator namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("team_mortars", "clear_operator_data");
            }
        }
    }
    if (isdefined(self.navobstacle)) {
        destroynavobstacle(self.navobstacle);
    }
    foreach (var_6876372a894fe601 in self.var_be1c48bfab7ccb6) {
        namespace_9e69d66f68c38a10::function_b092780f9ec4496e(var_6876372a894fe601);
    }
    self.var_be1c48bfab7ccb6 = [];
    self.var_24ff739b2eb09591 = 0;
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    function_5f8ee230917bcf2f();
    if (!self.var_397515a6dd2f503b) {
        function_4c7fb6ad4120d921();
    }
    self notify("fortress_unlocked");
    if (self.var_626b45032e1892da != "WARLORD_MAESTRO") {
        thread namespace_dc53a27a8db8e6bf::function_53bd256d9112a4e3();
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x47a4
// Size: 0xc4
function private function_93b355d72bbf87ba() {
    var_84292bebf1c42ff4 = self.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_954eb52ab4cdeb46("warlord_key_spawner", "targetname");
    if (var_84292bebf1c42ff4.size > 0) {
        foreach (spawner in var_84292bebf1c42ff4) {
            itemid = "obloot_key_human_fortress_allforone";
            if (isdefined(spawner.script_noteworthy)) {
                itemid = spawner.script_noteworthy;
            }
            namespace_2b1145f62aa835b8::function_38e113a4c30f6c0d(itemid, spawner.origin, spawner.angles, undefined, 1, 0, 1);
            waitframe();
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486f
// Size: 0xff
function function_8f94c63669b258b() {
    self.var_6b7a2a3800561128 = self.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_954eb52ab4cdeb46("sentry", "targetname");
    self endon("activity_ended");
    self.var_70507c40273c3d2c = throttle::function_e4c99b0f178ffb98("sentry_health_bar_update", 2);
    if (!isdefined(level.sentrysettings["ai_sentry_turret"])) {
        ai_sentry_turret::init();
    }
    namespace_64135de19550f047::function_64d1082e50f1eed();
    foreach (struct in self.var_6b7a2a3800561128) {
        sentry = namespace_17b45e55cf344cda::function_586d4d82f07e0d09(struct);
        self.var_b261b594e5c09a86 = utility::array_add(self.var_b261b594e5c09a86, sentry);
        sentry laseroff();
        namespace_41957062447a88fe::function_f0675d4a690011d6(sentry);
        sentry thread function_62ee91c2023c75d2(self);
        sentry thread function_2c6d204530cc7f9d(self);
        waitframe();
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4975
// Size: 0x95
function function_2c6d204530cc7f9d(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    while (1) {
        if (isdefined(self.besttarget) && utility::array_contains(level.players, self.besttarget)) {
            if (!utility::array_contains(var_e6013eac45290cab.var_6c29f2fdb0054bbe, self.besttarget)) {
                namespace_41957062447a88fe::function_bbdcd857d0c2a65e(var_e6013eac45290cab, self.besttarget, "PlayerJoinedDamage");
            }
            var_e6013eac45290cab notify("player_attacking", self.besttarget);
        }
        wait(1);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a11
// Size: 0xac
function private function_1e1e28d0a6731c06(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("WARLORD_ACTIVITY_HELI_DEAD_NOTIFY");
    level endon("game_ended");
    heli = undefined;
    while (1) {
        if (!isdefined(heli)) {
            player_in_range = function_9f628b12214ded36();
            if (isdefined(player_in_range)) {
                heli = function_ad3c2d380193c0d6(player_in_range);
                heli.var_e6013eac45290cab = var_e6013eac45290cab;
                heli namespace_c908de38bcdbd93d::function_4782ceab7eadd844(&function_82ad46939b373287);
                heli.var_1d6756d9fe7a5156 = 1;
                wait(10);
            }
        } else if (function_142fcb9939ab6dff()) {
            heli namespace_c908de38bcdbd93d::function_21c899c9bbaf0adc(1);
            heli = undefined;
            wait(10);
        }
        wait(5);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ac4
// Size: 0x35
function private function_82ad46939b373287(heli, data) {
    if (isdefined(heli.var_e6013eac45290cab)) {
        heli.var_e6013eac45290cab notify("WARLORD_ACTIVITY_HELI_DEAD_NOTIFY");
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b00
// Size: 0xb5
function private function_9f628b12214ded36() {
    var_4f31a2b48331da52 = getstruct("allforone_heli_combat_range", "targetname");
    foreach (player in level.players) {
        if (isdefined(var_4f31a2b48331da52) && isdefined(player)) {
            if (distancesquared(player.origin, var_4f31a2b48331da52.origin) < var_4f31a2b48331da52.radius * var_4f31a2b48331da52.radius) {
                return player;
            }
            wait(0.1);
        }
    }
    return undefined;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bbd
// Size: 0xd0
function private function_142fcb9939ab6dff() {
    if (istrue(self.heli.var_ef003f7b8aebc2f3)) {
        return 1;
    }
    var_4f31a2b48331da52 = getstruct("allforone_heli_return_patrol_range", "targetname");
    foreach (player in level.players) {
        if (isdefined(var_4f31a2b48331da52) && isdefined(player)) {
            if (distancesquared(player.origin, var_4f31a2b48331da52.origin) < var_4f31a2b48331da52.radius * var_4f31a2b48331da52.radius) {
                return 0;
            }
            wait(0.1);
        }
    }
    return 1;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c95
// Size: 0x237
function private function_ad3c2d380193c0d6(player_in_range) {
    var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(self);
    var_9047bb7e8c0b7ef2 = utility::getstruct(var_d1c7613187e69022.var_37031919bed79345, "targetname");
    var_8fcade05dee813af = getscriptbundle("helicoptersettings:" + var_d1c7613187e69022.var_51f57fcec25b6719);
    /#
        assertex(isdefined(var_9047bb7e8c0b7ef2), "There is a helicopter enabled for the warlord activity but it has no valid path!");
    #/
    /#
        assertex(isdefined(var_8fcade05dee813af), "There is a helicopter enabled for the warlord activity but no helicopter settings script bundle!");
    #/
    heli = namespace_c908de38bcdbd93d::heli_spawn(var_9047bb7e8c0b7ef2, 0, 1, var_8fcade05dee813af, &function_900c6f46dec4a691);
    heli.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_6ac6c39627c74e91");
    heli.var_534e788bc498be9f = getscriptbundle(%"hash_27cb9204e77bbcea");
    heli.subclass = heli.var_534e788bc498be9f.name;
    var_39e3177c55f34e64 = getstructarray("allforone_heli_combat_range", "targetname");
    var_4f31a2b48331da52 = getstructarray("allforone_heli_return_patrol_range", "targetname");
    self.heli = heli;
    heli namespace_dc53a27a8db8e6bf::function_d9c2d13ae0f4fbcb();
    if (isdefined(var_39e3177c55f34e64) && var_39e3177c55f34e64.size > 0) {
        heli.var_41d706ef04944de3 = var_39e3177c55f34e64[0];
    }
    if (isdefined(var_4f31a2b48331da52) && var_4f31a2b48331da52.size > 0) {
        heli.var_26246b374d066079 = var_4f31a2b48331da52[0];
    }
    var_e21a95f46d11ff7c = utility::getstruct(var_9047bb7e8c0b7ef2.target, "targetname");
    var_7578bbf36df02c60 = getscriptbundle("magicturretsettings:hind_turret_settings_warmup_jup_ob");
    heli namespace_c908de38bcdbd93d::function_89891a51d22c497e(var_7578bbf36df02c60);
    heli function_d6eba8149fb949e9(player_in_range.origin + (0, 0, 1000) + vectornormalize(heli.origin - player_in_range.origin) * 5000, 1, 0, 0, undefined, undefined, 70);
    var_4db1bca04bf972a1 = getscriptbundle("magicturretsettings:hind_turret_settings_jup_ob");
    heli namespace_c908de38bcdbd93d::function_89891a51d22c497e(var_4db1bca04bf972a1);
    heli thread namespace_c908de38bcdbd93d::function_e9cef78943e169f4(player_in_range, &function_900c6f46dec4a691, 1);
    return heli;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ed4
// Size: 0x15a
function private function_900c6f46dec4a691(heli) {
    var_79be769e862eb002 = utility::ter_op(isdefined(heli.var_41d706ef04944de3) && isdefined(heli.var_41d706ef04944de3.origin), heli.var_41d706ef04944de3.origin, heli.origin);
    var_50de4248d0f10ee6 = utility::ter_op(isdefined(heli.var_41d706ef04944de3) && isdefined(heli.var_41d706ef04944de3.radius), heli.var_41d706ef04944de3.radius, heli.var_e309f77b84ade0d9);
    players = player::getplayersinradius(var_79be769e862eb002, var_50de4248d0f10ee6);
    players = array_randomize(players);
    foreach (player in players) {
        if (isdefined(player) && !isinlaststand(player) && heli namespace_c908de38bcdbd93d::function_618e0f50b9b8b310(player, 1)) {
            if (!istrue(heli.var_ef003f7b8aebc2f3)) {
                heli namespace_dc53a27a8db8e6bf::function_1bfced88fed9a20b();
            }
            return player;
        }
        wait(1);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5035
// Size: 0xd1
function private function_f6497e3d84e6a305(heli) {
    var_79be769e862eb002 = utility::ter_op(isdefined(heli.var_26246b374d066079) && isdefined(heli.var_26246b374d066079.origin), heli.var_26246b374d066079.origin, heli.origin);
    var_50de4248d0f10ee6 = utility::ter_op(isdefined(heli.var_26246b374d066079) && isdefined(heli.var_26246b374d066079.radius), heli.var_26246b374d066079.radius, heli.var_e309f77b84ade0d9);
    players = player::getplayersinradius(var_79be769e862eb002, var_50de4248d0f10ee6);
    return players.size == 0;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x510e
// Size: 0xd1
function private function_7550473fbe4c5f8d() {
    level endon("game_ended");
    self endon("activity_ended");
    if (isdefined(level.var_96a00a6fce3851c3)) {
        [[ level.var_96a00a6fce3851c3 ]]();
    }
    if (istrue(level.var_9171353caa234820)) {
        if (!isdefined(self.var_e6d1986ed1cf685b)) {
            self.var_e6d1986ed1cf685b = [];
        }
        self.var_fff8c681855d93c1 = self.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_954eb52ab4cdeb46("warlord_mortar_area", "targetname");
        foreach (var_8ad5c7ba7116e299 in self.var_fff8c681855d93c1) {
            var_8ad5c7ba7116e299 thread namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("team_mortars", "area_think", self);
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e6
// Size: 0x142
function function_6997cf73d6a2c9a4() {
    level endon("game_ended");
    self endon("activity_ended");
    self.var_fd1f1f22d3b0ab94 = self.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_954eb52ab4cdeb46("warlord_mine_spawner", "targetname");
    while (self.agents.size == 0) {
        waitframe();
    }
    foreach (mine in self.var_fd1f1f22d3b0ab94) {
        badplace_id = "bp_" + self.var_71fe27b31a7295b9.script_noteworthy + "_mine" + self.mines.size;
        var_1faa7c026db8f98a = namespace_17b45e55cf344cda::function_908ec13fb4d6cede(mine.origin, badplace_id, self.agents[0], undefined, mine.angles, 1);
        mine.allowfriendlyfire = 1;
        self.mines = utility::array_add(self.mines, mine);
        mine thread function_a8d2fedc12c85f16(self);
        namespace_41957062447a88fe::function_f0675d4a690011d6(mine);
        mine thread function_62ee91c2023c75d2(self);
        waitframe();
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532f
// Size: 0x106
function function_a8d2fedc12c85f16(var_e6013eac45290cab) {
    self endon("death");
    var_e6013eac45290cab endon("activity_ended");
    ents = self waittill("trigger_grenade");
    if (ents.size > 0) {
        if (ents[0] vehicle::isvehicle()) {
            occupants = vehicle_occupancy::vehicle_occupancy_getalloccupants(ents[0], 0);
            if (isdefined(occupants) && occupants.size > 0) {
                foreach (occupant in occupants) {
                    if (utility::array_contains(level.players, occupant)) {
                        ents[0] = occupant;
                    }
                }
            }
        }
        if (utility::array_contains(level.players, ents[0])) {
            if (!utility::array_contains(var_e6013eac45290cab.var_6c29f2fdb0054bbe, ents[0])) {
                namespace_41957062447a88fe::function_bbdcd857d0c2a65e(var_e6013eac45290cab, ents[0], "PlayerJoinedDamage");
            }
            var_e6013eac45290cab notify("player_attacking", ents[0]);
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543c
// Size: 0xb9
function function_62ee91c2023c75d2(var_e6013eac45290cab) {
    var_e6013eac45290cab endon("activity_ended");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    var_417b2b7d8ec44514 = 0;
    while (1) {
        attacker = amount = self waittill("damage");
        if (utility::array_contains(level.players, attacker)) {
            var_e6013eac45290cab notify("player_attacking", attacker);
            if (var_417b2b7d8ec44514 == 0) {
                params = spawnstruct();
                params.warlord_name = self.var_626b45032e1892da;
                attacker callback::callback("warlord_damaged", params);
                var_417b2b7d8ec44514 = 1;
            }
        }
        wait(1);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54fc
// Size: 0xfe
function function_264adfbf7055e8b4() {
    level endon("game_ended");
    self endon("activity_ended");
    while (self.agents.size == 0) {
        waitframe();
    }
    foreach (var_8f436b50ffebda6f in self.var_60b8820e4242e663) {
        throwvelocity = anglestoup(var_8f436b50ffebda6f.angles) * -100;
        var_f184167b403b3b62 = magicgrenademanual("sound_veil_mp", var_8f436b50ffebda6f.origin, throwvelocity);
        var_f184167b403b3b62.team = "team_hundred_ninety";
        var_f184167b403b3b62.owner = var_f184167b403b3b62;
        var_f184167b403b3b62.var_d01a8a39e172ea92 = 1;
        var_f184167b403b3b62.var_fff21a869f9fa687 = 1;
        self.agents[0] thread namespace_ade096b4b575e46c::function_7b988e1bb56ca747(var_f184167b403b3b62);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5601
// Size: 0x9e
function function_e2dbf4d781dcd9b() {
    level endon("game_ended");
    self endon("activity_ended");
    if (!isdefined(level.trophy) || !isdefined(level.trophy.tags)) {
        namespace_c4c5d5e9936b287c::trophy_init();
    }
    foreach (var_776083776f6f0302 in self.var_1f448c85aab51481) {
        namespace_c4c5d5e9936b287c::function_233602cc27d9fcf8(var_776083776f6f0302, 1, 100, undefined, "team_hundred_ninety");
        waitframe();
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56a6
// Size: 0x7f
function private function_989a82177d3587e3() {
    level endon("game_ended");
    self endon("activity_ended");
    self waittill("fortress_unlocked");
    namespace_17c25f0877bfb620::scriptable_addnotifycallback("afo_dummy_destroyed", &function_47670cf75afc9359);
    foreach (var_2af7b855ee88ffe3 in self.var_ec082222d3b65a9a) {
        function_70a82e2de870327d(var_2af7b855ee88ffe3);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x572c
// Size: 0x2c
function private function_47670cf75afc9359(instance, note, param, var_535d9c3fdddab5a9) {
    instance notify("afo_dummy_destroyed");
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x575f
// Size: 0x129
function function_862ec3b2476d1b25() {
    var_a1969c027669c454 = self.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_954eb52ab4cdeb46("warlord_vehicle_spawner", "targetname");
    if (var_a1969c027669c454.size > 0) {
        foreach (spawner in var_a1969c027669c454) {
            spawn_type = "veh_jup_suv_1996";
            if (isdefined(spawner.script_noteworthy)) {
                spawn_type = spawner.script_noteworthy;
            }
            var_beccd53f4573c239 = spawnstruct();
            var_beccd53f4573c239.origin = getgroundposition(spawner.origin, 64, 256) + (0, 0, 128);
            var_beccd53f4573c239.angles = spawner.angles;
            vehicle = vehicle::vehicle_spawn(spawn_type, var_beccd53f4573c239);
            if (isdefined(vehicle)) {
                self.vehicles = utility::array_add(self.vehicles, vehicle);
            }
            waitframe();
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x588f
// Size: 0x126
function private function_70a82e2de870327d(var_9479a9b75a38cd2b) {
    triggers = undefined;
    if (isdefined(var_9479a9b75a38cd2b.target)) {
        triggers = function_f159c10d5cf8f0b4(var_9479a9b75a38cd2b.target, "targetname");
    }
    var_672119679e5628dc = var_9479a9b75a38cd2b.origin;
    var_8d0f45d41889833f = var_9479a9b75a38cd2b.angles;
    var_9d3481ce8c723f5d = 150;
    var_1bf3d502bc0ffdc0 = 0;
    var_54a5151b32a865e8 = 0.5;
    var_65373cd353370c96 = 3;
    var_f03196013d5cd011 = spawnstruct();
    var_f03196013d5cd011.angles = var_9479a9b75a38cd2b.angles;
    var_f03196013d5cd011.position = var_9479a9b75a38cd2b.origin;
    var_f03196013d5cd011.health = var_9d3481ce8c723f5d;
    var_f03196013d5cd011.team = "team_hundred_ninety";
    var_f03196013d5cd011.activity = self;
    if (isdefined(triggers)) {
        thread namespace_3fa2391f9077d907::function_841c25eb1c7438b(var_f03196013d5cd011, triggers);
    } else {
        thread namespace_3fa2391f9077d907::function_6c904abfe5e38110(var_f03196013d5cd011);
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59bc
// Size: 0x289
function function_aed7a5e07b895fa(var_2d9552508615d396, tripwire) {
    if (isdefined(tripwire.var_e6013eac45290cab) && isdefined(tripwire.var_70587812595fd991)) {
        if (tripwire.var_70587812595fd991 == "gas_grenade_exgm_chemist_tripwire") {
            var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(tripwire.var_e6013eac45290cab);
            if (isdefined(var_d1c7613187e69022) && isdefined(level.var_381f13069ba0b5d4)) {
                [[ level.var_381f13069ba0b5d4 ]](var_2d9552508615d396.origin, tripwire.var_e6013eac45290cab.var_4b7032d8632723e0, "team_hundred_ninety", var_d1c7613187e69022.var_99bab916c06a776f, var_d1c7613187e69022.var_49b3f2d037b27309, 0, "scr_warlord_chemist_grenade_tripwire", var_d1c7613187e69022.var_d8f7e0d3f8827fca, 4);
            }
            return;
        } else if (tripwire.var_70587812595fd991 == "thermobaric_grenade_jup_mp") {
            var_d1c7613187e69022 = namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(tripwire.var_e6013eac45290cab);
            if (isdefined(var_d1c7613187e69022)) {
                var_e6c6c445ebccdb46 = spawnstruct();
                var_e6c6c445ebccdb46.weapon_name = "thermobaric_grenade_jup_mp";
                namespace_d61c6e0163d61af4::function_a4cf6140ad44312c(var_e6c6c445ebccdb46);
                var_447d9ac32d1a1f7e = makeweapon("thermobaric_grenade_jup_mp");
                explosionradius = getgrenadedamageradius(var_447d9ac32d1a1f7e);
                players = player::getplayersinradius(tripwire.origin, explosionradius);
                if (players.size > 0) {
                    foreach (player in players) {
                        data = spawnstruct();
                        data.meansofdeath = "MOD_FIRE";
                        data.victim = player;
                        data.attacker = tripwire.var_e6013eac45290cab.var_4b7032d8632723e0;
                        data.objweapon = var_447d9ac32d1a1f7e;
                        data.inflictor = tripwire;
                        data.point = tripwire.origin;
                        player namespace_d61c6e0163d61af4::onplayerdamaged(data);
                    }
                }
                tripwire.team = "team_hundred_ninety";
                namespace_d61c6e0163d61af4::function_90a9e9f5e4922a2a(tripwire.origin, tripwire.angles, "thermobaric_grenade_jup_mp", "team_hundred_ninety");
            }
            return;
        }
    }
    namespace_5a43e3b1b17bfdcc::function_5edfa6cc73a7922d(tripwire);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c4c
// Size: 0x1db
function private function_d925580cdefd8594() {
    level endon("game_ended");
    var_236c7d2f9df60974 = self.var_6c29f2fdb0054bbe;
    var_468b14d2ee56214d = function_261dedb8a2ab915d();
    var_58e219427c5fe7f0 = [];
    foreach (player in var_236c7d2f9df60974) {
        if (!isdefined(player) || array_contains(var_58e219427c5fe7f0, player)) {
            continue;
        }
        if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
            foreach (squadmember in squadmembers) {
                var_58e219427c5fe7f0[var_58e219427c5fe7f0.size] = squadmember;
            }
        }
    }
    var_5e1310bbe1f90b35 = [];
    foreach (player in var_236c7d2f9df60974) {
        if (!isdefined(player) || array_contains(var_58e219427c5fe7f0, player)) {
            continue;
        }
        var_5e1310bbe1f90b35[var_5e1310bbe1f90b35.size] = player;
    }
    var_745b4e28cd79834e = namespace_dc53a27a8db8e6bf::function_bf1a19db888d229f(var_5e1310bbe1f90b35);
    if (istrue(var_745b4e28cd79834e)) {
        var_5188156bcf936801 = getdvarint(@"hash_e5ad89ea7f242a75", 1);
        wait(var_5188156bcf936801);
    }
    namespace_277c27ef297ef569::function_1281c7fff9456e18("warlord_success", var_468b14d2ee56214d);
    wait(5);
    namespace_dc53a27a8db8e6bf::function_65175e987bbfc6f8(var_468b14d2ee56214d);
    namespace_4fda5d7358015a06::function_612d18fdbc979c0b(self, 1);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e2e
// Size: 0x57
function private function_ff58fdabe59872b2(var_6f8af5eb76deac21) {
    var_2c05eb8510000fc0 = function_f0f498aed6f8fa5d(self);
    var_af0662d6485d5d58 = namespace_4fda5d7358015a06::function_de53ed8e35d0ed7a(self);
    if (isdefined(var_af0662d6485d5d58) && var_af0662d6485d5d58 == "REV_OB_WARLORD") {
        level.var_83abcb9b3a5dbe24.var_7301f4402bd2aee[var_2c05eb8510000fc0] = self;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e8c
// Size: 0x55
function private function_57ddbeb9a1cc605e(var_6f8af5eb76deac21) {
    uniqueid = function_f0f498aed6f8fa5d(self);
    var_af0662d6485d5d58 = namespace_4fda5d7358015a06::function_de53ed8e35d0ed7a(self);
    if (isdefined(var_af0662d6485d5d58) && var_af0662d6485d5d58 == "REV_OB_WARLORD") {
        level.var_83abcb9b3a5dbe24.var_7301f4402bd2aee[uniqueid] = undefined;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5ee8
// Size: 0xd3
function private function_f13be2fe056ab5a() {
    var_f29480668da18e7a = [];
    if (isdefined(level.var_83abcb9b3a5dbe24.var_7301f4402bd2aee)) {
        foreach (instance in level.var_83abcb9b3a5dbe24.var_7301f4402bd2aee) {
            if (!isdefined(instance)) {
                continue;
            }
            var_8f31733913565905 = namespace_4fda5d7358015a06::function_73bd348a2ec322cf(instance);
            if (!isdefined(var_8f31733913565905) || !(var_8f31733913565905 == "IdleState" || var_8f31733913565905 == "ActiveState")) {
                continue;
            }
            /#
                assert(namespace_4fda5d7358015a06::function_de53ed8e35d0ed7a(instance) == "REV_OB_WARLORD");
            #/
            var_f29480668da18e7a[var_f29480668da18e7a.size] = instance;
        }
    }
    return var_f29480668da18e7a;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fc3
// Size: 0xd4
function private function_6ce86afa6684b8eb(var_d6bfa53c531546d6) {
    player = var_d6bfa53c531546d6.player;
    var_a917328b0b1b2a19 = var_d6bfa53c531546d6.var_7f9b2cc8a7bdb61e;
    if (isdefined(player) && istrue(var_a917328b0b1b2a19) && istrue(self.var_24ff739b2eb09591) && isdefined(self.var_d1c7613187e69022) && isdefined(self.var_d1c7613187e69022.var_9a002d7b10d97a7d)) {
        squad = player namespace_ca7b90256548aa40::getsquadmembers(player.team, 1);
        if (isdefined(squad) && isarray(squad) && squad.size > 0 && !namespace_9718b9a169c3ead0::function_1abf09c903e6c16b(squad, function_1404cfa239b8c45a()) && !namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078)) {
            namespace_dc53a27a8db8e6bf::function_49a282654ffb7685(squad);
        }
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x609e
// Size: 0x43
function private function_1404cfa239b8c45a() {
    if (isdefined(self.var_d1c7613187e69022) && isdefined(self.var_d1c7613187e69022.var_9a002d7b10d97a7d)) {
        return ("loot_key_" + self.var_d1c7613187e69022.var_9a002d7b10d97a7d);
    }
    return undefined;
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x60e9
// Size: 0x84
function private function_a81c6611776ea959(var_e33aa6ec4a9e8de9) {
    var_3d7c908c7166d6a9 = var_e33aa6ec4a9e8de9.var_c844e6da361c186c;
    player = var_e33aa6ec4a9e8de9.player;
    if (isdefined(self) && isdefined(self.var_626b45032e1892da) && self.var_626b45032e1892da == "WARLORD_ALLFORONE") {
        if (var_3d7c908c7166d6a9) {
            return (isdefined(player) && !function_f0fc36a4010a833(player.origin));
        } else {
            return 0;
        }
    } else {
        return var_3d7c908c7166d6a9;
    }
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6174
// Size: 0x2f
function private function_f0fc36a4010a833(point) {
    return isdefined(point) && isdefined(self.var_676f150f4c7fc9fa) && ispointinvolume(point, self.var_676f150f4c7fc9fa);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x61ab
// Size: 0x99
function private function_c638fba4eade0ac3() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_465e351e0dbf9dc");
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_7e9147a046f3c383);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_7e9147a046f3c383);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_7e9147a046f3c383);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_7e9147a046f3c383);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x624b
// Size: 0xf5
function private function_7e9147a046f3c383(params) {
    /#
        var_7669bfa60fd97d51 = undefined;
        switch (params[0]) {
        case #"hash_e48274df9a633c0b":
            var_7669bfa60fd97d51 = getscriptbundle(%"hash_18ab94080543a9b");
            break;
        case #"hash_4d25f397e1684a18":
            var_7669bfa60fd97d51 = getscriptbundle(%"hash_3cec25ea8162f108");
            break;
        case #"hash_4a435a29eef2af26":
            var_7669bfa60fd97d51 = getscriptbundle(%"hash_7abfa82092752176");
            break;
        case #"hash_41390110c3a2bde9":
            var_7669bfa60fd97d51 = getscriptbundle(%"hash_7d4d9cf51a069859");
            break;
        }
        if (!isdefined(var_7669bfa60fd97d51)) {
            /#
                assertmsg("<unknown string>" + params[0]);
            #/
            return;
        }
        var_d13c18af4084bdfd = {var_2f5d509d7b71ce9a:{var_d1c7613187e69022:namespace_3485b020a23acaae::function_b9c4aa88ad97ee68(var_7669bfa60fd97d51)}};
        namespace_9b83895815d12835::function_7029bab8ebd74e1d(function_b4364b16b16b0c60(var_d13c18af4084bdfd));
        namespace_9b83895815d12835::function_803e6cfa13174264();
    #/
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6347
// Size: 0x38
function private function_4e27bde5c4ab78e2() {
    /#
        while (1) {
            if (getdvarint(@"hash_465e351e0dbf9dc", 0) && istrue(self.var_24ff739b2eb09591)) {
                function_ecb9170931917bd();
            }
            wait(5);
        }
    #/
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6386
// Size: 0x24f
function private function_a7bac03ceca2c973() {
    var_1b3072262db80fc1 = [0:"brainrot", 1:"deadwire", 2:"napalmburst", 3:"cryofreeze", 4:"shatterblast"];
    self.var_bed158a6dfac230d = 3;
    self.var_8790c077c95db752 = self.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    waitframe();
    namespace_f8d3520d3483c1::setarmorhealth(self.var_8790c077c95db752);
    waitframe();
    namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(3);
    waitframe();
    namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(1);
    waitframe();
    a_weapons = self getweaponslist("primary");
    foreach (weapon in a_weapons) {
        self takeweapon(weapon);
    }
    waitframe();
    var_636981592f381ebf = spawnstruct();
    var_d7732d0238eae9ff = 50;
    var_84255b4b28279219 = "ob_jup_item_weapon_ar_acharlie_blue";
    var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_84255b4b28279219);
    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
    var_636981592f381ebf.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
    var_636981592f381ebf = spawnstruct();
    var_d7732d0238eae9ff = 50;
    var_84255b4b28279219 = "ob_jup_item_weapon_sm_coscar635_blue";
    var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_84255b4b28279219);
    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
    var_636981592f381ebf.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
    wait(0.5);
    a_weapons = self getweaponslist("primary");
    for (i = 0; i < 2; i++) {
        currentweapon = a_weapons[i];
        if (namespace_a4ff02beedc1bce8::function_251fcd097206e347(currentweapon)) {
            var_5476695cf42091ed = namespace_a4ff02beedc1bce8::get_pap_level(currentweapon);
            namespace_a4ff02beedc1bce8::pap_weapon(currentweapon, var_5476695cf42091ed);
        }
        waitframe();
        var_4bc27b790622bd85 = randomint(var_1b3072262db80fc1.size);
        namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(a_weapons[i], var_1b3072262db80fc1[var_4bc27b790622bd85]);
    }
    waitframe();
    namespace_876b4362ef613d7a::give_perk("specialty_juggernog", 0);
    namespace_876b4362ef613d7a::give_perk("specialty_speedcola", 0);
}

// Namespace namespace_35b2e84a255ee2f6/namespace_75b9b66caa533c31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65dc
// Size: 0x1f6
function function_6fbbd049f160f136() {
    self endon("activity_ended");
    self endon("game_ended");
    if (self.var_626b45032e1892da == "WARLORD_CHEMIST") {
        var_2030b1768e2c5c38 = "activity_warlord_chemist";
        var_fcae1d02e373bbd6 = 3;
        var_fcd10f02e399e4c4 = 4;
    } else if (self.var_626b45032e1892da == "WARLORD_MAESTRO") {
        var_2030b1768e2c5c38 = "activity_warlord_maestro";
        var_fcae1d02e373bbd6 = 8;
        var_fcd10f02e399e4c4 = 8;
    } else {
        var_2030b1768e2c5c38 = "activity_warlord";
        var_fcae1d02e373bbd6 = 3;
        var_fcd10f02e399e4c4 = 4;
    }
    var_6ea45e0941843624 = self.var_71fe27b31a7295b9 function_954eb52ab4cdeb46("s_warlord_cache", "targetname");
    var_c861c692ff9761d8 = int(min(var_6ea45e0941843624.size, var_fcae1d02e373bbd6));
    var_1333f42d9fc03d92 = int(min(var_6ea45e0941843624.size, var_fcd10f02e399e4c4));
    if (var_6ea45e0941843624.size > 0) {
        if (var_6ea45e0941843624.size > 1) {
            if (var_1333f42d9fc03d92 > var_c861c692ff9761d8) {
                var_d0400d1b80b17605 = randomintrange(var_c861c692ff9761d8, var_1333f42d9fc03d92);
            } else {
                var_d0400d1b80b17605 = var_c861c692ff9761d8;
            }
            var_19e8414fc42c6dd9 = array_randomize(var_6ea45e0941843624);
            var_a3ed1b4a55e2a2c8 = array_slice(var_19e8414fc42c6dd9, 0, var_d0400d1b80b17605);
        } else {
            var_a3ed1b4a55e2a2c8 = var_6ea45e0941843624;
        }
        foreach (struct in var_a3ed1b4a55e2a2c8) {
            var_15bcd5035937f3bd = getgroundposition(struct.origin, 32);
            var_ac9fe71405759827 = namespace_9b83895815d12835::function_71d64108850e7b91(var_2030b1768e2c5c38, var_15bcd5035937f3bd, struct.angles);
            while (!isdefined(var_ac9fe71405759827)) {
                waitframe();
            }
            var_ac9fe71405759827 setscriptablepartstate("body", "closed_usable");
            self.var_23b910077b8047db = array_add(self.var_23b910077b8047db, var_ac9fe71405759827);
        }
    }
}

