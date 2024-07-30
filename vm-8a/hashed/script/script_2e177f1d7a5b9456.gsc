#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_3b78d23dad7ec5be;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_7956d56c4922bd1;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_3ab210ea917601e7;
#using script_3e31016b9c11a616;
#using script_64351208cb856df9;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using scripts\common\callbacks.gsc;
#using script_46c7c73b1a7e4773;
#using scripts\engine\scriptable.gsc;
#using script_5d8202968463a21d;
#using script_7534b1d3ac3ea47a;
#using script_22f1701e151b9d12;
#using script_7cfaa6fd841fb4dd;
#using script_638d701d263ee1ed;
#using script_4e6e58ab5d96c2b0;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4fa7e9e11630166c;
#using scripts\mp\utility\player.gsc;
#using script_347e655acacdace;

#namespace namespace_b03ac398e745b619;

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99c
// Size: 0xfc
function function_923e85d3bf0ec24b() {
    function_89384091f7a2dbd("REV_OB_SABOTAGE", 0, &function_ab08c03a615a0cb4);
    function_89384091f7a2dbd("REV_OB_SABOTAGE", 1, &function_142dd8b75b609524);
    function_89384091f7a2dbd("REV_OB_SABOTAGE", 2, &function_ff106919e26008fe);
    function_89384091f7a2dbd("REV_OB_SABOTAGE", 3, &function_2a71141af11128b7);
    function_89384091f7a2dbd("REV_OB_SABOTAGE", 5, &function_12ab2881b64adb9b);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_SABOTAGE");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_SABOTAGE");
    function_8b5b2a3392fc7e2a("PlayerEnteredAwarenessZone", &function_9738f4c3207eeecd, "REV_OB_SABOTAGE");
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_SABOTAGE");
    scripts\engine\scriptable::scriptable_addnotifycallback("ae_landing_complete", &function_482dc13081f2f82);
    scripts\engine\scriptable::scriptable_addnotifycallback("ae_takeoff_complete", &function_d9f232af40634687);
    scripts\engine\scriptable::scriptable_addnotifycallback("aether_extractor_active", &function_69f745961864f7a3);
    scripts\engine\scriptable::scriptable_addnotifycallback("aether_extractor_disabled", &function_5b9c0d50066b9799);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa0
// Size: 0x119
function function_ab08c03a615a0cb4() {
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.variant_definition = var_45c17c8bd7095cc4;
    var_4c561dfa68aa0b08 = getstructarray(self.varianttag, "targetname");
    foreach (setup in var_4c561dfa68aa0b08) {
        self.var_4c561dfa68aa0b08 = function_6d6af8144a5131f1(self.var_4c561dfa68aa0b08, setup);
    }
    self.var_236d14e22e619c4 = 0;
    self.var_b9224694cb1be9 = [];
    self.str_group = self.varianttag + " " + self.id;
    startinteract = getstructarray(self.varianttag, "script_noteworthy");
    self.interact_struct = startinteract[0];
    self.var_575022c4aab8bff4 = [];
    self.shouldreinforce = 1;
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc1
// Size: 0x440
function function_142dd8b75b609524() {
    level endon("game_ended");
    self notify("phone_used");
    self.on_mission = zombie_challenges::function_f578373042c34e16(16445, "quest_s0a2t4_heist_extstart_conv", self.var_6c29f2fdb0054bbe);
    function_5c55a963e30c4568();
    function_3febd77882069bec();
    thread function_f469740a20ef8777();
    function_1ce44390c1941808();
    function_900a372a40986d3f();
    request_id = function_3ee36bc763779ba1(self.varianttag, 1, 0, 1, 2);
    radii = namespace_8480efeffcd6e233::function_5bbdc39a533d9d57(self, "Ambient_AI_Exclusion_Zone");
    function_5b9ffa6991e4d730(request_id, &function_8e5eba83ac0e12e5, [self, self.var_9046be937751609b, radii[0].radius]);
    function_3c85fe57dbc02e4e(request_id, &function_ea2e54093d2e1c1b, self);
    self.var_dcb639dfa56e091b = request_id;
    self.var_71f394c5ee325c8b = spawn("script_model", (0, 0, 0));
    self.var_71f394c5ee325c8b setmodel("tag_origin");
    self.var_71f394c5ee325c8b.team = "civilian";
    msg = waittill_any_return_2("all_disabled", "countdown_finished");
    if (istrue(self.on_mission)) {
        cannister_collected = 0;
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (istrue(player.var_8fb5cf84d3fec2ed)) {
                cannister_collected = 1;
            }
        }
    }
    if (msg == "all_disabled") {
        if (!self.on_mission) {
            thread function_1281c7fff9456e18("activity_sabotage_success");
        } else if (!cannister_collected) {
            foreach (player in self.var_6c29f2fdb0054bbe) {
                player callback::callback("on_sabotage_success_nocannister");
            }
        } else {
            foreach (player in self.var_6c29f2fdb0054bbe) {
                player callback::callback("on_sabotage_success_withcannister");
            }
        }
        endactivity(self, 1);
        return;
    }
    foreach (var_95f25c491d535550 in self.var_b9224694cb1be9) {
        var_95f25c491d535550.extractor setscriptablepartstate("trigger", "unusable");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player namespace_29b5250e9959ea::function_70946e24f54d3f1a("jup_hacking_device_ob");
        if (istrue(player.var_8fb5cf84d3fec2ed)) {
            cannister_collected = 1;
        }
    }
    if (!self.on_mission) {
        thread function_1281c7fff9456e18("activity_sabotage_failure");
    } else if (!cannister_collected) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            player callback::callback("on_sabotage_failure_nocannister");
        }
    } else {
        thread function_1281c7fff9456e18("SABOTAGE_ACTIVITY_VO_FAILURE_FIRSTLINE");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        function_4a508fcbbea05afd(player);
    }
    endactivity(self, 0);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1009
// Size: 0x126
function function_ff106919e26008fe() {
    self.shouldreinforce = 0;
    if (isdefined(self.var_dcb639dfa56e091b)) {
        namespace_614554f86e52695c::function_9950e6e485bf5261(self.var_dcb639dfa56e091b);
    }
    foreach (s_root in self.var_b9224694cb1be9) {
        if (isdefined(s_root.request_id)) {
            namespace_614554f86e52695c::function_9950e6e485bf5261(s_root.request_id);
        }
        if (s_root.extractor getscriptablepartstate("aether_extractor") == "warmup") {
            s_root.extractor thread function_607022f8dbd87fb7();
            if (isdefined(s_root.landing_pad)) {
                s_root.landing_pad thread function_cb956a4b213221cb();
            }
            if (isdefined(s_root.interact)) {
                s_root.interact delete();
            }
        }
    }
    if (isdefined(self.var_71f394c5ee325c8b)) {
        self.var_71f394c5ee325c8b delete();
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1137
// Size: 0x51
function function_89a7111bd154e223(structspawn) {
    self.trigger_ent = spawn("trigger_radius", structspawn.origin, 0, structspawn.radius, structspawn.height);
    thread watchplayertrigger(self.trigger_ent);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1190
// Size: 0x61
function watchplayertrigger(trigger) {
    self.extractor.activity_instance endon("activity_ended");
    while (true) {
        ent = trigger waittill("trigger");
        if (isplayer(ent)) {
            player = ent;
            player callback::callback("player_near_extractor");
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f9
// Size: 0x180
function function_607022f8dbd87fb7() {
    radius = 300;
    players = getplayersinradius(self.origin, radius);
    foreach (player in players) {
        player knockback(player.origin - self.origin, radius * 90 / length(player.origin - self.origin));
    }
    start_pos = self.origin;
    end_pos = start_pos + (0, 0, 5000);
    start_angles = self.angles;
    takeoff_ae = spawn("script_model", start_pos);
    takeoff_ae setmodel("jup_zm_aether_extractor_rocket_scriptable");
    takeoff_ae.angles = start_angles;
    while (!isdefined(takeoff_ae)) {
        waitframe();
    }
    takeoff_ae setscriptablepartstate("aether_extractor_ent", "takeoff");
    takeoff_ae moveto(takeoff_ae.origin + (0, 0, 5000), 9, 3, 0);
    self setscriptablepartstate("aether_extractor", "hide");
    self setscriptablepartstate("screen_material", "screen_hidden");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1381
// Size: 0x58
function function_cb956a4b213221cb() {
    self setscriptablepartstate("vfx", "close");
    wait 3;
    self setscriptablepartstate("vfx", "mid");
    wait 2;
    self setscriptablepartstate("vfx", "far");
    wait 2;
    self setscriptablepartstate("vfx", "blank");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0xf1
function function_2a71141af11128b7() {
    foreach (s_root in self.var_b9224694cb1be9) {
        if (isdefined(s_root.extractor)) {
            s_root.extractor setscriptablepartstate("aether_extractor", "hide");
        }
        if (isdefined(s_root.landing_pad)) {
            s_root.landing_pad setscriptablepartstate("model", "disabled");
        }
        if (isdefined(s_root.trigger_ent)) {
            s_root.trigger_ent delete();
        }
        namespace_64135de19550f047::function_486b0f579d5b6dae(s_root.active_cover);
    }
    if (isdefined(self.var_71f394c5ee325c8b)) {
        self.var_71f394c5ee325c8b delete();
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14da
// Size: 0xe1
function function_12ab2881b64adb9b() {
    foreach (player in self.var_6c29f2fdb0054bbe) {
        params = spawnstruct();
        params.player = player;
        callback::callback("aether_extractor_destroyed", params);
    }
    self.reward_struct.origin = self.reward_struct.origin + (0, 0, -20) + anglestoforward(self.reward_struct.angles + (0, 180, 0)) * 60;
    return self.reward_struct;
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c4
// Size: 0x108
function function_1531bbf5cff97dc0(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
    if (isdefined(self.var_b9224694cb1be9) && self.var_b9224694cb1be9.size > 0) {
        foreach (s_root in self.var_b9224694cb1be9) {
            if (isdefined(s_root.extractor)) {
                foreach (player in player_list) {
                    s_root.extractor enablescriptableplayeruse(player);
                }
            }
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d4
// Size: 0xf2
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
    if (isdefined(self.var_b9224694cb1be9) && self.var_b9224694cb1be9.size > 0) {
        foreach (s_root in self.var_b9224694cb1be9) {
            if (isdefined(s_root.extractor)) {
                foreach (player in player_list) {
                    s_root.extractor disablescriptableplayeruse(player);
                }
            }
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ce
// Size: 0x13
function function_9738f4c3207eeecd(var_b381b0883bcd4847) {
    self notify("initCountdown");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e9
// Size: 0xdf
function function_540f9b357f3b5419(var_b381b0883bcd4847) {
    if (!self.on_mission) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_sabotage_cancelled", var_b381b0883bcd4847.playerlist);
    }
    foreach (player in var_b381b0883bcd4847.playerlist) {
        player callback::callback("on_abandon_sabotage_contract");
    }
    wait 0.2;
    foreach (player in var_b381b0883bcd4847.playerlist) {
        function_4a508fcbbea05afd(player);
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18d0
// Size: 0x59
function private function_4a508fcbbea05afd(player) {
    if (function_5acc35fc66331385(player, 16445)) {
        player ent_flag_clear("quest_s0a2t4_heist_extstart_conv");
        player ent_flag_clear("quest_s0a2t4_heist_extcontractcancel");
        player ent_flag_clear("quest_s0a2t4_heist_extfailure_conv");
    }
    if (function_5acc35fc66331385(player, 16132)) {
        player ent_flag_clear("quest_s0a1t3_saboteur_start");
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1931
// Size: 0x13d
function private function_5c55a963e30c4568() {
    self.var_9046be937751609b = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
    var_78e63668e454888f = function_c9a98411e715c2f7(self.var_9046be937751609b);
    switch (var_78e63668e454888f) {
    case #"hash_af83e47edfa8900a": 
        self.difficulty_settings = self.variant_definition.yellowdifficulty;
        break;
    case #"hash_5343b465e56ec9a4":
    case #"hash_651f76c0ad6741ec": 
        self.difficulty_settings = self.variant_definition.var_27745d4ad204d462;
        break;
    case #"hash_7bb2cd766703d463":
    default: 
        self.difficulty_settings = self.variant_definition.greendifficulty;
        break;
    }
    if (self.var_4c561dfa68aa0b08.size >= self.difficulty_settings.var_44bd8e9da18a644e) {
        self.var_e41aed3a07053b4f = self.difficulty_settings.var_44bd8e9da18a644e;
    } else {
        self.var_e41aed3a07053b4f = self.var_4c561dfa68aa0b08.size;
    }
    self.var_839a43fcca67a8ed = self.difficulty_settings.var_839a43fcca67a8ed;
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a76
// Size: 0x3d
function private function_c9a98411e715c2f7(location) {
    var_78e63668e454888f = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(location);
    if (var_78e63668e454888f == "difficulty_undefined") {
        var_78e63668e454888f = getdvar(@"hash_de95b79f1cc2ed1", "difficulty_easy");
    }
    return var_78e63668e454888f;
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1abc
// Size: 0x7d
function private function_900a372a40986d3f() {
    level endon("game_ended");
    self.var_4c561dfa68aa0b08 = array_randomize(self.var_4c561dfa68aa0b08);
    for (i = 0; i < self.var_e41aed3a07053b4f; i++) {
        self.var_b9224694cb1be9 = function_6d6af8144a5131f1(self.var_b9224694cb1be9, self.var_4c561dfa68aa0b08[i]);
        thread function_fb460cc13d5fa06b(self.var_4c561dfa68aa0b08[i]);
        wait 0.2;
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b41
// Size: 0x41a
function private function_fb460cc13d5fa06b(s_root) {
    self endon("activity_ended");
    pos = getgroundposition(s_root.origin, 1);
    s_root.active_cover = namespace_64135de19550f047::function_e9158c9e8c391f25(s_root.script_noteworthy);
    a_pos = scripts\engine\utility::getstructarray(s_root.target, "targetname");
    foreach (pos in a_pos) {
        if (pos.script_label == "reward_struct") {
            s_root.reward_struct = pos;
            continue;
        }
        if (pos.script_label == "bomb_struct") {
            s_root.bomb_struct = pos;
        }
    }
    scriptables = getentitylessscriptablearray(s_root.target, "targetname");
    foreach (scriptable in scriptables) {
        if (scriptable.script_noteworthy == "scriptable_extractor") {
            s_root.extractor = scriptable;
        }
        if (scriptable.script_noteworthy == "scriptable_extractor_landing") {
            s_root.landing_pad = scriptable;
        }
    }
    if (isdefined(s_root.landing_pad)) {
        s_root.landing_pad setscriptablepartstate("model", "ae_landing");
        s_root.landing_pad thread function_9f48ea02d7ddacf4();
    }
    s_root.extractor.activity_instance = self;
    s_root.extractor.bomb_struct = s_root.bomb_struct;
    s_root.extractor.reward_struct = s_root.reward_struct;
    s_root.extractor.landing_pad = s_root.landing_pad;
    foreach (player in level.players) {
        s_root.extractor disablescriptableplayeruse(player);
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        s_root.extractor enablescriptableplayeruse(player);
    }
    namespace_64135de19550f047::function_daee52aa53ad6314(s_root.landing_pad.origin, 600);
    request_id = function_3ee36bc763779ba1(s_root.script_parameters, 1, 0, 1, 2);
    function_ce9c21523336cdbc(request_id, &function_8e5eba83ac0e12e5, [self, s_root.origin, 800]);
    s_root.request_id = request_id;
    s_root.extractor thread function_f4be15aae7f918c9();
    thread function_21f24af7d8f2e443(s_root.origin);
    trigger_struct = spawnstruct();
    trigger_struct.origin = s_root.origin;
    trigger_struct.radius = 500;
    trigger_struct.height = 500;
    s_root function_89a7111bd154e223(trigger_struct);
    namespace_29b5250e9959ea::function_3cec1b2981075936("jup_hacking_device_ob", s_root.extractor, &function_f290d3f882055a3c, undefined, &function_59ae620b2626f676, 4);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f63
// Size: 0xb1
function private function_f4be15aae7f918c9() {
    landing_pos = self.origin;
    starting_pos = landing_pos + (0, 0, 3500);
    var_22d82c0c49753d1 = self.angles;
    landing_ae = spawn("script_model", starting_pos);
    landing_ae.active_ae = self;
    landing_ae setmodel("jup_zm_aether_extractor_rocket_scriptable", landing_pos + (0, 0, 3500));
    landing_ae.angles = var_22d82c0c49753d1;
    while (!isdefined(landing_ae)) {
        waitframe();
    }
    landing_ae moveto(landing_pos, 6, 0, 5);
    thread function_bded3d00bf53c249(landing_pos, 300);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x201c
// Size: 0x12b
function private function_bded3d00bf53c249(pos, radius) {
    wait 4;
    vehicles = vehicle_getarrayinradius(pos, radius);
    foreach (vehicle in vehicles) {
        if (vehicle isvehiclehusk()) {
            vehicle function_e3ff0a92ad2bf58d();
            continue;
        }
        vehicle.var_a8f4bb03b366aa80 = 1;
        vehicle function_9672da471530b44a();
    }
    wait 0.5;
    players = getplayersinradius(pos, radius);
    foreach (player in players) {
        player knockback(player.origin - pos, radius * 90 / length(player.origin - pos));
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x214f
// Size: 0x49
function private function_482dc13081f2f82(scriptable, notif, params, var_535d9c3fdddab5a9) {
    self.active_ae setscriptablepartstate("aether_extractor", "active");
    wait 0.2;
    self delete();
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21a0
// Size: 0x30
function private function_d9f232af40634687(scriptable, notif, params, var_535d9c3fdddab5a9) {
    wait 0.2;
    self delete();
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21d8
// Size: 0x174
function private function_69f745961864f7a3(scriptable, notif, params, var_535d9c3fdddab5a9) {
    if (!isdefined(scriptable.activity_instance)) {
        return;
    }
    foreach (root in scriptable.activity_instance.var_b9224694cb1be9) {
        if (root.extractor == scriptable) {
            activity_instance = scriptable.activity_instance;
            activity_instance thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
            if (isdefined(level.var_7f1d1c7c6153a9bf) && [[ level.var_7f1d1c7c6153a9bf ]]()) {
                scriptable.activity_id = activity_instance function_36a95c9de2ace25a("extractor_marker_rift_run", 0, 1);
            } else {
                scriptable.activity_id = activity_instance function_36a95c9de2ace25a("extractor_marker", 0, 1);
            }
            scripts\mp\objidpoolmanager::update_objective_position(scriptable.activity_id, scriptable.bomb_struct.origin);
            if (isdefined(scriptable.landing_pad)) {
                scriptable.landing_pad setscriptablepartstate("model", "ae_landed");
            }
            scriptable setscriptablepartstate("trigger", "usable");
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2354
// Size: 0x9f
function private function_f290d3f882055a3c(player) {
    self setscriptablepartstate("aether_extractor", "overload");
    self setscriptablepartstate("trigger", "unusable");
    activity_instance = self.activity_instance;
    activity_instance.var_236d14e22e619c4++;
    activity_instance namespace_262d6474998a2356::function_c661dba3e304266b(activity_instance.var_236d14e22e619c4);
    activity_instance notify("one_sabotaged");
    activity_instance thread function_765b706dc170e214(self.activity_id);
    if (activity_instance.var_e41aed3a07053b4f - activity_instance.var_236d14e22e619c4 == 1) {
        activity_instance notify("one_extractor_left");
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23fb
// Size: 0x3c
function function_59ae620b2626f676(player) {
    player endon("interaction_complete");
    self setscriptablepartstate("screen_material", "screen_hacking");
    player waittill("cancel");
    self setscriptablepartstate("screen_material", "screen_active");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x243f
// Size: 0x3d
function function_7fc5185aadece0ad(player) {
    self waittill("one_disabled");
    params = spawnstruct();
    params.player = player;
    callback::callback("aether_extractor_destroyed", params);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2484
// Size: 0x1c0
function private function_5b9c0d50066b9799(scriptable, notif, params, var_535d9c3fdddab5a9) {
    if (!isdefined(scriptable.activity_instance)) {
        return;
    }
    scriptable setscriptablepartstate("screen_material", "screen_hidden");
    foreach (root in scriptable.activity_instance.var_b9224694cb1be9) {
        if (root.extractor == scriptable) {
            activity_instance = scriptable.activity_instance;
            activity_instance function_3f0019081ff6b7e1(scriptable.bomb_struct);
            earthquake(0.4, 0.7, scriptable.bomb_struct.origin, 800);
            activity_instance notify("one_disabled");
            if (activity_instance.var_236d14e22e619c4 >= activity_instance.var_e41aed3a07053b4f) {
                if (issharedfuncdefined("ob_quest_missions", "onSabotageExtractorDisabled")) {
                    [[ getsharedfunc("ob_quest_missions", "onSabotageExtractorDisabled") ]](activity_instance, scriptable);
                }
            }
            if (activity_instance.var_236d14e22e619c4 >= activity_instance.var_e41aed3a07053b4f) {
                activity_instance notify("all_disabled");
                activity_instance.reward_struct = scriptable.reward_struct;
                continue;
            }
            var_95b365e2882773f3 = ["SABOTAGE_ACTIVITY_DIALOG_DISABLED_1", "SABOTAGE_ACTIVITY_DIALOG_DISABLED_2", "SABOTAGE_ACTIVITY_DIALOG_DISABLED_3"];
            var_c574f8a20082fa67 = random(var_95b365e2882773f3);
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264c
// Size: 0x80
function function_21f24af7d8f2e443(center) {
    self endon("activity_ended");
    self endon("extractor_destroy_prompt_triggered");
    self endon("one_sabotaged");
    var_e50147bc7c6e7ba6 = 0;
    while (true) {
        players = scripts\mp\utility\player::getplayersinradius(center, 170);
        if (players.size > 0) {
            var_e50147bc7c6e7ba6++;
            if (var_e50147bc7c6e7ba6 >= 10) {
                thread namespace_277c27ef297ef569::function_1281c7fff9456e18("SABOTAGE_ACTIVITY_VO_DESTROY_PROMPT");
                wait 1;
                self notify("extractor_destroy_prompt_triggered");
            }
        } else {
            var_e50147bc7c6e7ba6 = 0;
        }
        wait 1;
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d4
// Size: 0x58
function function_9f48ea02d7ddacf4() {
    self setscriptablepartstate("vfx", "far");
    wait 2;
    self setscriptablepartstate("vfx", "mid");
    wait 2;
    self setscriptablepartstate("vfx", "close");
    wait 2;
    self setscriptablepartstate("vfx", "blank");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2734
// Size: 0x187
function function_3f0019081ff6b7e1(explosion_source) {
    radius = 350;
    if (isdefined(self.var_71f394c5ee325c8b)) {
        radiusdamage(explosion_source.origin, radius, 100, 50, self.var_71f394c5ee325c8b, undefined, undefined, 0, 0);
    }
    foreach (ent in function_143526130b12b2b6(explosion_source.origin, radius)) {
        if (isplayer(ent)) {
            ent knockback(ent.origin - explosion_source.origin, radius * 90 / length(ent.origin - explosion_source.origin));
            continue;
        }
        if (ent.team == "team_two_hundred") {
            ent function_e96aac065abbec4e(explosion_source.origin);
            if (istrue(ent.disallow_knockdown) || !ent asmhasstate(ent.asmname, "knockdown_in")) {
                ent dodamage(self.var_839a43fcca67a8ed * 10, explosion_source.origin, self.var_71f394c5ee325c8b);
                continue;
            }
            ent dodamage(self.var_839a43fcca67a8ed, explosion_source.origin, self.var_71f394c5ee325c8b);
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28c3
// Size: 0xb0
function function_fbd42d684f66806e(activityinstance) {
    activityinstance endon("activity_ended");
    player = self waittill("ae_sabotaged");
    activityinstance.var_575022c4aab8bff4 = array_removedead_or_dying(activityinstance.var_575022c4aab8bff4);
    foreach (soldier in activityinstance.var_575022c4aab8bff4) {
        if (isdefined(soldier) && isdefined(player)) {
            soldier setstealthstate("combat");
            soldier getenemyinfo(player);
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x297b
// Size: 0x89
function private function_f469740a20ef8777() {
    self endon("activity_ended");
    self waittill("initCountdown");
    self.var_141a4840cd4686d6 = 0;
    while (function_42a842295fe70a62(self) <= 0) {
        waitframe();
    }
    n_time_remaining = self.difficulty_settings.timelimit;
    missiontime = int(gettime() + function_a5b14435e3229bed(n_time_remaining));
    thread function_95f8d1b9f6685b61("SabotageTimer", n_time_remaining, &function_ed899763b14cd13c);
    function_7c6a95fad00519b0(n_time_remaining);
    self waittill("countdown_finished");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0c
// Size: 0xfa
function function_ed899763b14cd13c(progress_tracker) {
    if (progress_tracker.var_621cb2c0d9b1cdae / progress_tracker.var_cc3e7fbaface5a17 <= 0.15 && !self.var_141a4840cd4686d6) {
        self notify("timer_low");
        self.var_141a4840cd4686d6 = 1;
        foreach (var_95f25c491d535550 in self.var_b9224694cb1be9) {
            if (var_95f25c491d535550.extractor getscriptablepartstate("aether_extractor") == "active") {
                var_95f25c491d535550.extractor setscriptablepartstate("aether_extractor", "warmup");
            }
        }
    }
    if (progress_tracker namespace_96552c234e66ebee::iscomplete()) {
        if (self.var_236d14e22e619c4 >= self.var_e41aed3a07053b4f) {
            return;
        }
        self notify("countdown_finished");
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0e
// Size: 0x6d
function function_8e5eba83ac0e12e5(request_id, userdata, agent, data) {
    activityinstance = userdata[0];
    activityinstance.var_575022c4aab8bff4 = array_add(activityinstance.var_575022c4aab8bff4, agent);
    agent thread function_e312b0c0acaf6800(userdata[1], userdata[2]);
    agent ent_flag_init("activity_sabotage_spawned");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b83
// Size: 0x35
function function_ea2e54093d2e1c1b(request_id, userdata, agent, data) {
    if (userdata.shouldreinforce) {
        return true;
    }
    return false;
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bc1
// Size: 0x2a
function function_e312b0c0acaf6800(center, radius) {
    self endon("death");
    self function_65cdab0fc78aba8f(center, radius);
    function_134471b58eb3d915();
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bf3
// Size: 0x4a
function private function_134471b58eb3d915() {
    if (isdefined(self.var_ad46aadd4e3290d7)) {
        requestdata = function_9a39e23c3c52c2af(self.var_ad46aadd4e3290d7);
        if (isdefined(requestdata)) {
            self setgoalpos(requestdata.origin, requestdata.radius);
        }
    }
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c45
// Size: 0x8e
function function_1ce44390c1941808() {
    thread function_dca867221a499442();
    switch (self.var_e41aed3a07053b4f) {
    case 4: 
        var_ccfaad18a5501c24 = "SABOTAGE_ACTIVITY_VO_START_FOUR";
        var_6603b68a91b98209 = "SABOTAGE_ACTIVITY_VO_EXT_DOWN_FOUR";
        break;
    case 5: 
        var_ccfaad18a5501c24 = "SABOTAGE_ACTIVITY_VO_START_FIVE";
        var_6603b68a91b98209 = "SABOTAGE_ACTIVITY_VO_EXT_DOWN_FIVE";
        break;
    default: 
        var_ccfaad18a5501c24 = "SABOTAGE_ACTIVITY_VO_START_THREE";
        var_6603b68a91b98209 = "SABOTAGE_ACTIVITY_VO_EXT_DOWN_THREE";
        break;
    }
    thread function_31070f2e8c05719a(var_ccfaad18a5501c24, var_6603b68a91b98209);
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cdb
// Size: 0xd2
function private function_31070f2e8c05719a(var_ccfaad18a5501c24, var_6603b68a91b98209) {
    self endon("activity_ended");
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("on_sabotage_start");
    }
    if (self.var_47187a65a8fb783d.size <= 0) {
        if (!self.on_mission) {
            namespace_277c27ef297ef569::function_1281c7fff9456e18(var_ccfaad18a5501c24);
        }
    } else {
        self notify("initCountdown");
    }
    self waittill("one_disabled");
    if (cointoss()) {
        namespace_277c27ef297ef569::function_1281c7fff9456e18(var_6603b68a91b98209);
        return;
    }
    self waittill("one_extractor_left");
    namespace_277c27ef297ef569::function_1281c7fff9456e18("SABOTAGE_ACTIVITY_VO_EXT_ONE_LEFT");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2db5
// Size: 0x3a
function private function_dca867221a499442(var_e321d8116d27f841) {
    self endon("activity_ended");
    self waittill("initCountdown");
    namespace_277c27ef297ef569::function_1281c7fff9456e18("SABOTAGE_ACTIVITY_VO_TIMER_START");
    self waittill("timer_low");
    namespace_277c27ef297ef569::function_1281c7fff9456e18("SABOTAGE_ACTIVITY_VO_TIMER_LOW");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2df7
// Size: 0xe
function private function_3febd77882069bec() {
    namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_SABOTAGE");
}

// Namespace namespace_b03ac398e745b619 / namespace_ea045e2c848ddf3c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e0d
// Size: 0x95
function private function_7c6a95fad00519b0(n_time_remaining) {
    switch (self.var_e41aed3a07053b4f) {
    case 4: 
        namespace_262d6474998a2356::function_716949a1eeeb1f47();
        waitframe();
        namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_SABOTAGE_FOUR_EXTRACTORS");
        break;
    case 5: 
        namespace_262d6474998a2356::function_716949a1eeeb1f47();
        waitframe();
        namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_SABOTAGE_FIVE_EXTRACTORS");
        break;
    default: 
        namespace_262d6474998a2356::function_716949a1eeeb1f47();
        waitframe();
        namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_SABOTAGE_THREE_EXTRACTORS");
        break;
    }
    namespace_262d6474998a2356::function_c661dba3e304266b(0);
    namespace_262d6474998a2356::function_474722293c221d5c(n_time_remaining);
}

