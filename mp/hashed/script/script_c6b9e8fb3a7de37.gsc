#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5753ba9c28794a65;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_3ab210ea917601e7;
#using script_64351208cb856df9;
#using scripts\asm\shared\mp\utility.gsc;
#using script_3e31016b9c11a616;
#using script_46c7c73b1a7e4773;
#using script_645acc6422636f9f;
#using script_7534b1d3ac3ea47a;
#using script_4fa7e9e11630166c;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_19c169a442d5975a;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\common\vehicle.gsc;
#using script_4e6e58ab5d96c2b0;
#using script_22f1701e151b9d12;

#namespace namespace_72155ae72c1c70a8;

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed2
// Size: 0xcf
function function_42696fef39309a29() {
    function_89384091f7a2dbd("REV_OB_OUTLAST", 0, &function_5bb1c4fb788dec5e);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 1, &function_6d52f0a2ee2d14b1);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 2, &function_8e83fa331734d121);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 3, &outlast_cleanup);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 4, &function_144f707f2483c23d);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 5, &function_f4ff769d513fd99e);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_OUTLAST");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_OUTLAST");
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_OUTLAST");
    level._effect["outlast_player_screen_aether_motes_vfx"] = loadfx("vfx/t10/levels/zm_t10_garnet/vfx_dark_aether_motes.vfx");
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa9
// Size: 0x10c
function function_5bb1c4fb788dec5e() {
    self.variant_definition = function_b9c4aa88ad97ee68(self);
    self.var_73754ee89412ad36 = "s_" + tolower(self.varianttag);
    var_a89e77c759b91ae0 = getstructarray(self.var_73754ee89412ad36, "targetname");
    self.var_31f6fb81727fcce3 = var_a89e77c759b91ae0[0];
    self.str_visionset = "mp_jup_outlast_contract";
    setup_outlast();
    if (level.mapname == "mp_jup_fort") {
        function_5db678d359c61a6f();
        self.var_4ca871fc02d7f9af = 1;
        self.str_visionset = "mp_jup_outlast_contract(mp_jup_fort)";
        return;
    }
    if (level.mapname == "mp_jup_hydro") {
        function_5db678d359c61a6f();
        self.var_4ca871fc02d7f9af = 1;
        self.str_visionset = "mp_jup_outlast_contract(mp_jup_hydro)";
        return;
    }
    if (level.mapname == "mp_jup_sira") {
        function_5db678d359c61a6f();
        self.var_4ca871fc02d7f9af = 1;
        self.str_visionset = "mp_jup_outlast_contract(mp_jup_sira)";
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10bd
// Size: 0x148
function setup_outlast() {
    if (istrue(level.var_dbca431b3ea02d2e)) {
        self.var_e726c726c6fb7dec = 1;
    }
    var_f0a73224e2b13518 = getstructarray(self.var_73754ee89412ad36, "target");
    self.content_structs = [];
    foreach (content_struct in var_f0a73224e2b13518) {
        if (!isdefined(content_struct.script_noteworthy)) {
            continue;
        }
        self.content_structs[content_struct.script_noteworthy] = default_to(self.content_structs[content_struct.script_noteworthy], []);
        self.content_structs[content_struct.script_noteworthy] = array_add(self.content_structs[content_struct.script_noteworthy], content_struct);
    }
    self.phase = "spawned";
    if (issharedfuncdefined("ob_quest_missions", "onOutlastActive")) {
        [[ getsharedfunc("ob_quest_missions", "onOutlastActive") ]](self);
    }
    self.difficulty_region = function_415547ee4122c2ca();
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120d
// Size: 0x6a
function function_f5bbb940bcd1f482() {
    var_cd12c9eb57ef1de = self.content_structs["outlast_activity_starter"][0];
    self.var_b189a678c1c3489a = spawnscriptable("brloot_activity_starter_outlast", var_cd12c9eb57ef1de.origin, var_cd12c9eb57ef1de.angles);
    self.activity_starter = namespace_f0d9097b252e530b::function_b4c8d27633108d43("outlast", var_cd12c9eb57ef1de.origin, 0, 50);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x127f
// Size: 0x64e
function function_f866d7d73436185e() {
    var_21a2a0834950afa5 = getstructarray("zombie_spawn_wave_1", "targetname");
    var_67250033736f2532 = getstructarray("zombie_spawn_wave_2", "targetname");
    var_12aea82e6c16ad63 = getstructarray("zombie_spawn_wave_3", "targetname");
    var_17b70bcdedf04eab = array_combine(var_21a2a0834950afa5, var_67250033736f2532, var_12aea82e6c16ad63);
    self.var_f10d2bae0aa4fce7 = [];
    self.var_f10d2bae0aa4fce7["wave_1"] = [];
    self.var_f10d2bae0aa4fce7["wave_2"] = [];
    self.var_f10d2bae0aa4fce7["wave_3"] = [];
    self.var_f10d2bae0aa4fce7["wave_all"] = [];
    foreach (s_spawnpts in var_21a2a0834950afa5) {
        if (is_equal(s_spawnpts.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_1"][self.var_f10d2bae0aa4fce7["wave_1"].size] = s_spawnpts;
        }
    }
    foreach (s_spawnpts in var_67250033736f2532) {
        if (is_equal(s_spawnpts.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_2"][self.var_f10d2bae0aa4fce7["wave_2"].size] = s_spawnpts;
        }
    }
    foreach (s_spawnpts in var_12aea82e6c16ad63) {
        if (is_equal(s_spawnpts.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_3"][self.var_f10d2bae0aa4fce7["wave_3"].size] = s_spawnpts;
        }
    }
    foreach (s_spawnpts in var_17b70bcdedf04eab) {
        if (is_equal(s_spawnpts.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_all"][self.var_f10d2bae0aa4fce7["wave_all"].size] = s_spawnpts;
        }
    }
    self.var_f10d2bae0aa4fce7["wave_available"] = [];
    self.var_f10d2bae0aa4fce7["wave_available"][0] = self.var_f10d2bae0aa4fce7["wave_1"];
    self.var_f10d2bae0aa4fce7["wave_available"][1] = self.var_f10d2bae0aa4fce7["wave_2"];
    self.var_f10d2bae0aa4fce7["wave_available"][2] = self.var_f10d2bae0aa4fce7["wave_3"];
    self.var_e9c1fd52868a6722 = [];
    self.var_fa487176b1a74c00 = [];
    foreach (struct in self.variant_definition.var_854ba14a7deb1b09) {
        self.var_fa487176b1a74c00["difficulty_easy"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_easy"], struct.var_f78fed4f8bd6e3bf);
    }
    foreach (struct in self.variant_definition.var_212cd94b1002c0e) {
        self.var_fa487176b1a74c00["difficulty_normal"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_normal"], struct.var_f78fed4f8bd6e3bf);
    }
    foreach (struct in self.variant_definition.var_b3e042de449a7934) {
        self.var_fa487176b1a74c00["difficulty_hard"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_hard"], struct.var_f78fed4f8bd6e3bf);
    }
    foreach (struct in self.variant_definition.var_61ec1be8129cb369) {
        self.var_fa487176b1a74c00["difficulty_darkaether"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_darkaether"], struct.var_f78fed4f8bd6e3bf);
    }
    self.var_451f96515b100237 = [];
    foreach (struct in self.variant_definition.var_bf3f48b7d2da1848) {
        if (isdefined(struct.var_f5ed9f20966ab692)) {
            self.var_451f96515b100237[struct.var_f5ed9f20966ab692] = function_6d6af8144a5131f1(self.var_451f96515b100237[struct.var_f5ed9f20966ab692], struct.special_encounter);
        }
    }
    self.var_e245ba1b36b148a3 = [];
    self.var_e245ba1b36b148a3["zombie_hellhound"] = 0;
    self.var_e245ba1b36b148a3["zombie_base_armored_light"] = 0;
    self.var_e245ba1b36b148a3["zombie_base_armored_heavy"] = 0;
    self.var_e245ba1b36b148a3["zombie_base"] = 0;
    self.var_e245ba1b36b148a3["zombie_mangler"] = 0;
    self.var_e245ba1b36b148a3["zombie_disciple"] = 0;
    self.var_e245ba1b36b148a3["zombie_mimic"] = 0;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18d5
// Size: 0xea
function function_cbc1bd5e3a6f99bf() {
    var_a1edc937cb84ab35 = self.content_structs["pnd"][0];
    self.var_a897d5b8c6afdc34 = spawnscriptable("jup_ob_outlast_pnd", var_a1edc937cb84ab35.origin, var_a1edc937cb84ab35.angles);
    self.var_a897d5b8c6afdc34 setscriptablepartstate("body", "off");
    self.var_a897d5b8c6afdc34.instance = self;
    foreach (player in level.players) {
        self.var_a897d5b8c6afdc34 disablescriptableplayeruse(player);
    }
    namespace_29b5250e9959ea::function_3cec1b2981075936("jup_hacking_device_ob", self.var_a897d5b8c6afdc34, &pnd_activated);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19c7
// Size: 0x165
function pnd_activated(player) {
    self.instance notify("pnd_activated");
    self setscriptablepartstate("body", "on");
    self.on = 1;
    earthquake(0.175, 0.4, self.origin, 250);
    playrumbleonposition("grenade_rumble", self.origin);
    if (!isdefined(self.rumbleent)) {
        self.rumbleent = utility::spawn_model("tag_orign", self.origin, self.angles);
    }
    self.instance thread function_f2ada6ddeb80fc6f();
    if (isdefined(self.instance.var_6859ba01d375e401)) {
        self.instance namespace_262d6474998a2356::function_61cd287166c3f695(self.instance.var_6859ba01d375e401);
    } else {
        self.instance namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_OUTLAST_ANALYSIS_PHASE");
    }
    if (isplayer(self.instance.ping_owner)) {
        self.instance.ping_owner scripts\cp_mp\calloutmarkerping::calloutmarkerping_removecallout(self.instance.ping_index);
    }
    self.instance notify("outlast_start");
    self.instance thread outlast_begin_analysis_phase();
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b34
// Size: 0x18
function function_d57c6c500fa1f237(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "jup_ob_outlast_pnd";
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b55
// Size: 0xd6
function function_f2ada6ddeb80fc6f() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("outlast_complete");
    self.var_a897d5b8c6afdc34.nearby_players = [];
    while (true) {
        self.var_a897d5b8c6afdc34.nearby_players = scripts\mp\utility\player::getplayersinradius(self.var_a897d5b8c6afdc34.origin, 120);
        foreach (player in self.var_a897d5b8c6afdc34.nearby_players) {
            if (!istrue(self.var_2df4ef0e0e8da6aa)) {
                player thread function_d39bd9d53b8fc950(self);
            }
        }
        wait 0.5;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c33
// Size: 0x95
function function_d39bd9d53b8fc950(instance) {
    self endon("death");
    self endon("disconnect");
    self playrumblelooponentity("damage_light");
    while (true) {
        if (isarray(instance.var_a897d5b8c6afdc34.nearby_players) && array_contains(instance.var_a897d5b8c6afdc34.nearby_players, self)) {
            self.var_2df4ef0e0e8da6aa = 1;
            wait 0.1;
            continue;
        }
        self stoprumble("damage_light");
        self.var_2df4ef0e0e8da6aa = undefined;
        return;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1cd0
// Size: 0x56
function private function_aa4d30d0e7f5473d(player) {
    player function_bf9ec93bee75f88c(1);
    bomb = makeweapon("jup_hacking_device_ob");
    player scripts\cp_mp\utility\inventory_utility::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread scripts\mp\gameobjects::switchtouseweapon(bomb, 1);
    return bomb;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1d2f
// Size: 0x104
function private function_bf9ec93bee75f88c(isallowed) {
    val::set("outlast_holding_bomb", "allow_movement", isallowed);
    val::set("outlast_holding_bomb", "sprint", isallowed);
    val::set("outlast_holding_bomb", "fire", isallowed);
    val::set("outlast_holding_bomb", "reload", isallowed);
    val::set("outlast_holding_bomb", "weapon_pickup", isallowed);
    val::set("outlast_holding_bomb", "weapon_switch", isallowed);
    val::set("outlast_holding_bomb", "allow_jump", isallowed);
    val::set("outlast_holding_bomb", "gesture", isallowed);
    self function_35501b42058d4de9();
    if (isallowed) {
        waittill_any_timeout_1(0.8, "bomb_allow_offhands");
    }
    val::set("outlast_holding_bomb", "melee", isallowed);
    val::set("outlast_holding_bomb", "mantle", isallowed);
    val::set("outlast_holding_bomb", "offhand_weapons", isallowed);
    if (isallowed) {
        val::reset_all("outlast_holding_bomb");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e3b
// Size: 0x51
function private watchcancel(player) {
    self endon("pnd_activated");
    player notifyonplayercommand("cancel", "+weapnext");
    self.cancel = 0;
    player waittill("cancel");
    self.cancel = 1;
    player notifyonplayercommandremove("cancel", "+weapnext");
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e94
// Size: 0x107
function private function_8c4cabae6169b20b(player) {
    if (isdefined(self.defusing) && istrue(self.defusing)) {
        return false;
    }
    self.defusing = 1;
    bomb = function_aa4d30d0e7f5473d(player);
    thread watchcancel(player);
    buttontime = 0;
    while (buttontime < 2) {
        if (self.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
            self.defusing = 0;
            return false;
        }
        buttontime += level.framedurationseconds;
        waitframe();
    }
    self.defuseplayer = player;
    self notify("pnd_activated");
    player scripts\cp_mp\utility\inventory_utility::getridofweapon("jup_hacking_device_ob");
    if (isdefined(player)) {
        player notifyonplayercommandremove("cancel", "+weapnext");
    }
    player val::reset_all("hostage_holding_bomb");
    player function_bb04491d50d9e43e();
    thread pnd_activated(self);
    return true;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa4
// Size: 0x6e
function function_888ea771ff731707() {
    self.var_2d5b80c94b21ea0e = [];
    self.var_c8255a246e6632c4 = self.content_structs["outlast_space"][0];
    self.var_848acb00281d34ff = self.content_structs["outlast_entrance"];
    self.var_56809f597707acb1 = self.content_structs["outlast_exit"];
    thread function_f0ea0856c67d86b9();
    thread function_79897c367846ca0c();
    thread function_34689bde3b4de227();
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x201a
// Size: 0xde
function function_79897c367846ca0c() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_32ae8247ab203094 = 1000;
    while (true) {
        wait 1;
        players = scripts\mp\utility\player::getplayersinradius(self.var_c8255a246e6632c4.origin, self.var_c8255a246e6632c4.radius + var_32ae8247ab203094);
        foreach (player in players) {
            if (array_contains(self.var_6c29f2fdb0054bbe, player)) {
                player callback::callback("on_outlast_arrive");
                if (!self.var_c3d4e3f8e48b7d3e) {
                    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_arrive");
                }
                return;
            }
        }
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2100
// Size: 0x169
function function_f0ea0856c67d86b9() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("outlast_complete");
    self.nearby_players = [];
    while (true) {
        wait 1;
        players = scripts\mp\utility\player::getplayersinradius(self.var_c8255a246e6632c4.origin, self.var_c8255a246e6632c4.radius);
        foreach (player in self.nearby_players) {
            if (!array_contains(players, player)) {
                self.nearby_players = array_remove(self.nearby_players, player);
                player notify("outlast_left_detection_area");
            }
        }
        foreach (player in players) {
            if (!array_contains(self.nearby_players, player)) {
                player thread function_509738f625c8db3b(self);
            }
            self.nearby_players = function_6d6af8144a5131f1(self.nearby_players, player);
        }
        if (players.size > 0) {
            self.var_2f5869df4f5501b4 = 1;
            continue;
        }
        self.var_2f5869df4f5501b4 = 0;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2271
// Size: 0x1a3
function function_1f3ee3210c0f24dc(player, var_b49cf3a7a9a03c1d) {
    if (!isdefined(player)) {
        return;
    }
    player endon("disconnect");
    if (!istrue(self.var_611a679894bb7a99) && array_contains(self.var_6c29f2fdb0054bbe, player)) {
        if (!self.on_mission) {
            thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_approachpnd");
        }
        self notify("outlast_space_entered_first_time");
        foreach (participant in self.var_6c29f2fdb0054bbe) {
            participant callback::callback("on_approach_outlast_pnd");
        }
        self.var_611a679894bb7a99 = 1;
    }
    if (!isdefined(self.var_2d5b80c94b21ea0e[player getentitynumber()])) {
        player notify("outlast_space_enter");
        stopfxontagforclients(level._effect["outlast_player_screen_aether_motes_vfx"], player, "tag_origin", player);
        killfxontag(level._effect["outlast_player_screen_aether_motes_vfx"], player, "tag_origin");
        waitframe();
        player namespace_6c72573a48881070::function_27a921508cb04613(self.str_visionset, 0.5);
        playfxontagforclients(level._effect["outlast_player_screen_aether_motes_vfx"], player, "tag_origin", player);
        self.var_2d5b80c94b21ea0e[player getentitynumber()] = player;
        player thread function_3880b2c36ce9d34f(self);
        player setscriptablepartstate("ob_outlast", "enter", 0);
        if (is_equal(self.phase, "pnd")) {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.var_195b0383b653a3f9, player);
        }
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x241c
// Size: 0x9d
function function_d80c0f98bd0188fc(player) {
    if (!isdefined(player)) {
        return;
    }
    player endon("disconnect");
    player notify("outlast_space_exit");
    stopfxontagforclients(level._effect["outlast_player_screen_aether_motes_vfx"], player, "tag_origin", player);
    killfxontag(level._effect["outlast_player_screen_aether_motes_vfx"], player, "tag_origin");
    player namespace_6c72573a48881070::function_9a92ae402e209ecc(self.str_visionset, 0.5);
    player setscriptablepartstate("ob_outlast", "exit", 0);
    self.var_2d5b80c94b21ea0e = scripts\engine\utility::array_remove_key(self.var_2d5b80c94b21ea0e, player getentitynumber());
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c1
// Size: 0x18
function function_34689bde3b4de227() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    thread function_40f0f0d1f815e339();
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24e1
// Size: 0xbb
function function_509738f625c8db3b(instance) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    self endon("outlast_left_detection_area");
    trigger_volumes = function_f159c10d5cf8f0b4("outlast_noent_entrance_trigger", "targetname");
    var_2b7c44b7b76d84b6 = [];
    foreach (trigger_volume in trigger_volumes) {
        if (is_equal(trigger_volume.target, instance.var_73754ee89412ad36)) {
            var_2b7c44b7b76d84b6 = array_add(var_2b7c44b7b76d84b6, trigger_volume);
        }
    }
    thread function_4d4a938412a1bbb(instance, var_2b7c44b7b76d84b6);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25a4
// Size: 0x20d
function function_4d4a938412a1bbb(instance, var_64767942f2ac5e7) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    self endon("outlast_left_detection_area");
    self endon("death_or_disconnect");
    while (true) {
        var_63767d21eea5fc10 = self getistouchingentities(var_64767942f2ac5e7);
        var_a366d55ba23e3775 = [];
        if (isdefined(self.vehicle) && self.vehicle scripts\common\vehicle::isvehicle()) {
            var_a366d55ba23e3775 = self.vehicle getistouchingentities(var_64767942f2ac5e7);
        }
        a_triggers = array_combine(var_63767d21eea5fc10, var_a366d55ba23e3775);
        if (a_triggers.size > 0) {
            ent = self;
            is_vehicle = ent scripts\common\vehicle::isvehicle();
            if (!isplayer(ent) && !is_vehicle || !is_vehicle && !is_equal(ent, self)) {
                continue;
            }
            a_players = [];
            if (is_vehicle) {
                if (isarray(ent.occupants)) {
                    foreach (occupant in ent.occupants) {
                        if (isplayer(occupant)) {
                            a_players = array_add(a_players, occupant);
                        }
                    }
                }
            }
            a_players = array_add(a_players, self);
            foreach (player in a_players) {
                player.var_648c3850e9969e0a = gettime();
                if (isplayer(player) && !isdefined(instance.var_2d5b80c94b21ea0e[player getentitynumber()])) {
                    /#
                        iprintlnbold("<dev string:x1c>");
                    #/
                    instance function_1f3ee3210c0f24dc(player, 1);
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27b9
// Size: 0xc6
function function_40f0f0d1f815e339() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (true) {
        foreach (player in self.var_2d5b80c94b21ea0e) {
            if (isplayer(player) && isdefined(self.var_2d5b80c94b21ea0e[player getentitynumber()]) && isdefined(player.var_648c3850e9969e0a) && gettime() - player.var_648c3850e9969e0a > 200) {
                /#
                    iprintlnbold("<dev string:x32>");
                #/
                function_d80c0f98bd0188fc(player);
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2887
// Size: 0x22b
function function_5db678d359c61a6f() {
    if (istrue(self.var_4ca871fc02d7f9af)) {
        return;
    }
    self.var_aa44570d0ce3af7c = [];
    self.var_cd05af3824c52cde = getentitylessscriptablearray(self.var_73754ee89412ad36, "target");
    foreach (prop_scriptable in self.var_cd05af3824c52cde) {
        if (is_equal(prop_scriptable.script_noteworthy, "outlast_phase_crystal")) {
            if (!isdefined(prop_scriptable.targetname)) {
                continue;
            }
            switch (prop_scriptable.targetname) {
            case #"hash_3fc1dec043e7c2ed":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_01");
                break;
            case #"hash_4f4b067cdd2a227d":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_02");
                break;
            case #"hash_fafe02a60e439165":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_03");
                break;
            case #"hash_9ceae540f6c4f91f":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_04");
                break;
            case #"hash_3e70bc44fce010a4":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_05");
                break;
            case #"hash_59ca4af302edd1d9":
                prop_scriptable setscriptablepartstate("body", "enabled_outlast_phase_crystal_06");
                break;
            }
            continue;
        }
        if (is_equal(prop_scriptable.targetname, "outlast_aether_vfx_prop") && isdefined(prop_scriptable.script_noteworthy) && prop_scriptable getscriptableparthasstate("body", prop_scriptable.script_noteworthy)) {
            prop_scriptable setscriptablepartstate("body", prop_scriptable.script_noteworthy);
            continue;
        }
        if (prop_scriptable getscriptableparthasstate("body", "enabled")) {
            prop_scriptable setscriptablepartstate("body", "enabled");
            continue;
        }
        if (prop_scriptable getscriptableparthasstate("base", "enabled")) {
            prop_scriptable setscriptablepartstate("base", "enabled");
        }
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aba
// Size: 0x116
function function_6d52f0a2ee2d14b1() {
    self.difficulty_region = function_415547ee4122c2ca();
    self.on_mission = zombie_challenges::function_f578373042c34e16(17090, "quest_s0_a3t4_hold_start", self.var_6c29f2fdb0054bbe);
    self.var_c3d4e3f8e48b7d3e = 0;
    if (!self.on_mission) {
        self.on_mission = zombie_challenges::function_f578373042c34e16(16822, "quest_s0a1t6_alab_outstart", self.var_6c29f2fdb0054bbe);
        if (istrue(self.on_mission)) {
            self.var_c3d4e3f8e48b7d3e = 1;
        }
    }
    if (!self.var_c3d4e3f8e48b7d3e) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_start");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("on_outlast_start");
    }
    function_f866d7d73436185e();
    thread function_5db678d359c61a6f();
    function_cbc1bd5e3a6f99bf();
    thread function_888ea771ff731707();
    function_bb8d279a3f7273c();
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bd8
// Size: 0x74
function function_bb8d279a3f7273c() {
    thread function_dc6eb704d6aaab91();
    self.phase = "pnd";
    foreach (player in self.var_6c29f2fdb0054bbe) {
        self.var_a897d5b8c6afdc34 enablescriptableplayeruse(player);
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c54
// Size: 0xe6
function outlast_begin_analysis_phase() {
    self notify("outlast_begin_analysis_phase");
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    namespace_262d6474998a2356::function_f0361294db9d74a7(0, 1);
    namespace_262d6474998a2356::function_c661dba3e304266b(0);
    self.analysis_progress = 0;
    self.phase = "analysis";
    self.var_2a2f4483763847a0 = "current";
    scripts\mp\objidpoolmanager::update_objective_state(self.var_195b0383b653a3f9, "current");
    scripts\mp\objidpoolmanager::objective_show_progress(self.var_195b0383b653a3f9, 1);
    foreach (player in self.var_6c29f2fdb0054bbe) {
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.var_195b0383b653a3f9, player);
    }
    thread function_ebfe4ffaa1829677();
    thread function_ec6aed16df18bc32();
    thread function_223b1ac278b3d7ab();
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d42
// Size: 0x124
function function_dc6eb704d6aaab91() {
    if (isdefined(level.var_7f1d1c7c6153a9bf) && [[ level.var_7f1d1c7c6153a9bf ]]()) {
        self.var_195b0383b653a3f9 = function_36a95c9de2ace25a("ob_outlast_marker_rift_run", 0, 1);
    } else {
        self.var_195b0383b653a3f9 = function_36a95c9de2ace25a("ob_outlast_marker", 0, 1);
    }
    scripts\mp\objidpoolmanager::update_objective_position(self.var_195b0383b653a3f9, self.var_a897d5b8c6afdc34.origin + (0, 0, 48));
    scripts\mp\objidpoolmanager::function_98ba077848896a3(self.var_195b0383b653a3f9, 1);
    waitframe();
    self.var_2a2f4483763847a0 = "current";
    function_6f02ac608d44fdbf(self.var_195b0383b653a3f9, 0, 1);
    self.ping_owner = self.var_6c29f2fdb0054bbe[0];
    self.ping_index = self.ping_owner scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(11, self.var_a897d5b8c6afdc34.origin + (0, 0, 24), self.var_195b0383b653a3f9);
    self waittill("activity_ended");
    function_765b706dc170e214(self.var_195b0383b653a3f9);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6e
// Size: 0x416
function function_ebfe4ffaa1829677() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (true) {
        if (self.analysis_progress >= function_2a735aa87f0f3b58()) {
            thread outlast_complete();
            namespace_262d6474998a2356::function_c661dba3e304266b(100);
            return;
        } else if (self.analysis_progress + 0.1 < function_2a735aa87f0f3b58()) {
            int_progress = int(self.analysis_progress / function_2a735aa87f0f3b58() * 100);
            namespace_262d6474998a2356::function_f0361294db9d74a7(int_progress);
            namespace_262d6474998a2356::function_c661dba3e304266b(int_progress);
            scripts\mp\objidpoolmanager::objective_set_progress(self.var_195b0383b653a3f9, self.analysis_progress / function_2a735aa87f0f3b58());
            foreach (player in self.var_6c29f2fdb0054bbe) {
                scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.var_195b0383b653a3f9, player);
                objective_pinforclient(self.var_195b0383b653a3f9, player);
            }
        }
        if (!isdefined(self.var_18aaec4c8e0a3ddf)) {
            self.var_18aaec4c8e0a3ddf = 0;
        }
        sound_state = self.var_a897d5b8c6afdc34 getscriptablepartstate("sound");
        if (function_d4be90854c90c61()) {
            progress_multiplier = 1;
            if (!istrue(getdvarint(@"hash_9f59a5679bf31951", 0))) {
                if (isdefined(self.var_bb23133727e6c56c) && self.var_bb23133727e6c56c > self.analysis_progress) {
                    var_b16bd19b850dacf3 = self.analysis_progress / 90 * 100;
                    var_635f487405664a8a = self.var_bb23133727e6c56c / 90 * 100;
                    if (var_635f487405664a8a - self.analysis_progress > 10) {
                        progress_multiplier = 3;
                    } else {
                        progress_multiplier = 2;
                    }
                }
            }
            self.analysis_progress += 0.1 * progress_multiplier;
            if (!is_equal(sound_state, "increment")) {
                self.var_a897d5b8c6afdc34 setscriptablepartstate("sound", "increment");
            }
        } else if (self.analysis_progress - 0.1 > 0) {
            self.analysis_progress -= 0.05;
            if (!is_equal(sound_state, "decrement")) {
                self.var_a897d5b8c6afdc34 setscriptablepartstate("sound", "decrement");
            }
            self.var_18aaec4c8e0a3ddf = 1;
        } else {
            self.analysis_progress = 0;
        }
        if (self.analysis_progress <= 0 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "off")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "off");
        } else if (self.analysis_progress > 0 && self.analysis_progress < 33 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "stage_1")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "stage_1");
        } else if (self.analysis_progress > 33 && self.analysis_progress < 66 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "stage_2")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "stage_2");
        } else if (self.analysis_progress > 66 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "stage_3")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "stage_3");
        }
        earthquake(0.1, 0.1, self.var_a897d5b8c6afdc34.origin, 320);
        wait 0.1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x328c
// Size: 0x1a
function function_2a735aa87f0f3b58() {
    return default_to(getdvarint(@"hash_f20148b185771406", 90), 90);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32af
// Size: 0x86
function function_d4be90854c90c61() {
    if (isarray(self.var_2d5b80c94b21ea0e)) {
        foreach (player in self.var_2d5b80c94b21ea0e) {
            if (array_contains(self.var_6c29f2fdb0054bbe, player) && !istrue(player.inlaststand)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x333e
// Size: 0xe8
function function_ec6aed16df18bc32() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    peak = self.analysis_progress;
    threshold_modifier = function_2a735aa87f0f3b58() / 5;
    while (true) {
        if (self.analysis_progress > peak) {
            peak = self.analysis_progress;
        } else if (self.analysis_progress < peak - threshold_modifier) {
            if (!self.var_c3d4e3f8e48b7d3e) {
                thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_progressdegrade");
            }
            foreach (player in self.var_6c29f2fdb0054bbe) {
                player callback::callback("on_outlast_progress_degrade");
            }
            break;
        }
        wait 1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x342e
// Size: 0x1d5
function function_223b1ac278b3d7ab() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_b2b20c7915262894 = 8;
    var_b2b20f7915262f2d = 11;
    var_b2b20e7915262cfa = 15;
    var_b2b20979152621fb = 21;
    self.wave_number = 1;
    if (!istrue(getdvarint(@"hash_9f59a5679bf31951", 0))) {
        thread function_dcf10a9b7fed5ffa();
    }
    thread function_558d11c826a89107(self.var_a897d5b8c6afdc34.origin);
    if (!self.var_c3d4e3f8e48b7d3e) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_wave1_conv");
    }
    while (true) {
        if (self.analysis_progress < 25) {
            self.wave_number = 1;
        } else if (self.analysis_progress >= 25 && self.analysis_progress < 50) {
            self.wave_number = 2;
        } else if (self.analysis_progress >= 50 && self.analysis_progress < 75) {
            if (self.wave_number == 2) {
                if (randomfloat(1) < 0.2 && !self.var_c3d4e3f8e48b7d3e) {
                    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_wave3_conv");
                }
            }
            self.wave_number = 3;
        } else if (self.analysis_progress >= 75) {
            self.wave_number = 4;
        }
        if (!is_equal(self.var_52d752ae1154c7a4, self.wave_number)) {
            self.var_52d752ae1154c7a4 = self.wave_number;
            thread function_3beec27fd573a4d3(self.var_a897d5b8c6afdc34.origin);
            self notify("new_wave");
            thread function_826ac3e8eda7dcbd(self.wave_number);
        }
        wait 1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x360b
// Size: 0x105
function function_558d11c826a89107(spawn_origin) {
    self endon("activity_ended");
    wave_number = default_to(self.wave_number, 1);
    if (!isdefined(self.var_fa487176b1a74c00[self.difficulty_region][0])) {
        return;
    }
    var_934083a148144947 = "ai_flood_fill_encounter:" + self.var_fa487176b1a74c00[self.difficulty_region][0];
    request_id = function_f8ccadcd850da124(var_934083a148144947, spawn_origin, 600, 1, 0, 1, 2);
    function_ce9c21523336cdbc(request_id, &function_9b57288fe7ff4054, self);
    function_d37068aac7785c04(request_id, "base_zombie", 1);
    namespace_614554f86e52695c::function_bc5315dc37ae4cf(request_id, &function_e7f09f9798a64df0, self);
    namespace_614554f86e52695c::function_73147cdf5c28d10c(request_id, &function_cbb2a02f8b23b67c, self);
    encounter_params = spawnstruct();
    encounter_params.request_id = request_id;
    encounter_params.wave_number = wave_number;
    self.var_e9c1fd52868a6722["flood_fill"] = encounter_params;
    function_826ac3e8eda7dcbd(1);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3718
// Size: 0x21c
function function_826ac3e8eda7dcbd(wave_number) {
    if (istrue(self.var_dcede8d7379e7d46)) {
        return;
    }
    if (isdefined(self.var_e9c1fd52868a6722["flood_fill"])) {
        var_5390af79cb787f4f = 9;
        var_ae600836b9c6bee1 = "wave_4";
        switch (wave_number) {
        case 1:
            var_5390af79cb787f4f = 9;
            var_ae600836b9c6bee1 = "wave_available";
            break;
        case 2:
            var_5390af79cb787f4f = 11;
            var_ae600836b9c6bee1 = "wave_available";
            break;
        case 3:
            var_5390af79cb787f4f = 13;
            var_ae600836b9c6bee1 = "wave_available";
            break;
        case 4:
            var_5390af79cb787f4f = 16;
            var_ae600836b9c6bee1 = "wave_4";
            break;
        }
        function_4b7d420e1bad897f(self.var_e9c1fd52868a6722["flood_fill"].request_id, var_5390af79cb787f4f);
        if (is_equal(var_ae600836b9c6bee1, "wave_4")) {
            function_410022707c218cf6(self.var_e9c1fd52868a6722["flood_fill"].request_id);
        } else if (isarray(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1]) && self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1].size > 0) {
            var_2f83bbfb9ec4b522 = 0;
            var_77e0b71126fdf64b = 0;
            if (self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1].size > 1) {
                var_2f83bbfb9ec4b522 = randomint(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1].size);
                var_77e0b71126fdf64b = randomint(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522].size);
            }
            wave_struct = self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522][var_77e0b71126fdf64b];
            /#
                iprintlnbold("<dev string:x48>" + wave_struct.script_noteworthy);
            #/
            function_df930eed75d4f74f(self.var_e9c1fd52868a6722["flood_fill"].request_id, wave_struct.origin, 450);
            thread function_6d4324bc965c3e61(self.var_f10d2bae0aa4fce7, var_ae600836b9c6bee1, var_2f83bbfb9ec4b522, var_77e0b71126fdf64b);
            self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1] = array_remove_index(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1], var_2f83bbfb9ec4b522);
        }
        self.var_52d752ae1154c7a4 = wave_number;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x393c
// Size: 0x1ec
function function_dcf10a9b7fed5ffa() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_dcede8d7379e7d46 = 0;
    var_990f5d73cc6bd9bd = 9;
    var_700daf409a522bad = 30000;
    var_d288fc1498a18193 = 7;
    var_19ac119cbf89bd54 = 4;
    var_69ff2c79067930eb = -1;
    var_d98e7782adf04c11 = 1;
    var_2c8d2887a1007271 = 0;
    self.var_bb23133727e6c56c = 0;
    while (true) {
        if (self.analysis_progress > self.var_bb23133727e6c56c) {
            self.var_bb23133727e6c56c = self.analysis_progress;
        }
        if (istrue(self.var_dcede8d7379e7d46)) {
            function_4b7d420e1bad897f(self.var_e9c1fd52868a6722["flood_fill"].request_id, 0);
            if (istrue(var_d98e7782adf04c11)) {
                var_2c8d2887a1007271 = self.var_bb23133727e6c56c;
                var_d98e7782adf04c11 = 0;
            }
            progress_penalty = var_d288fc1498a18193;
            var_d8ef071103d43ca7 = self.analysis_progress / 90 * 100;
            if (var_d8ef071103d43ca7 > 80) {
                progress_penalty = var_19ac119cbf89bd54;
            }
            if (self.analysis_progress > var_2c8d2887a1007271 + progress_penalty) {
                self.var_dcede8d7379e7d46 = 0;
                var_69ff2c79067930eb = -1;
                function_826ac3e8eda7dcbd(self.var_52d752ae1154c7a4);
            }
        } else if (!istrue(self.var_dcede8d7379e7d46)) {
            if (var_69ff2c79067930eb < 0) {
                var_69ff2c79067930eb = gettime();
                var_5ad45d58d388d987 = self.analysis_progress;
            }
            if (self.analysis_progress < self.var_bb23133727e6c56c - var_990f5d73cc6bd9bd) {
                self.var_dcede8d7379e7d46 = 1;
                var_d98e7782adf04c11 = 1;
            } else if (self.analysis_progress > var_5ad45d58d388d987 - var_990f5d73cc6bd9bd && self.analysis_progress < var_5ad45d58d388d987 + var_990f5d73cc6bd9bd) {
                if (gettime() > var_69ff2c79067930eb + var_700daf409a522bad) {
                    self.var_dcede8d7379e7d46 = 1;
                    var_d98e7782adf04c11 = 1;
                }
            } else {
                var_69ff2c79067930eb = -1;
            }
        }
        wait 1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3b30
// Size: 0xd6
function function_6d4324bc965c3e61(var_f10d2bae0aa4fce7, var_ae600836b9c6bee1, var_2f83bbfb9ec4b522, var_77e0b71126fdf64b) {
    self endon("activity_ended");
    self endon("new_wave");
    var_977ef6c136ada8dd = array_remove(var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522], var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522][var_77e0b71126fdf64b]);
    if (is_equal(var_977ef6c136ada8dd.size, 0)) {
        return;
    }
    var_38590bf732a31e79 = gettime();
    while (true) {
        if (gettime() - var_38590bf732a31e79 > 17500) {
            var_77e0b71126fdf64b = 0;
            if (var_977ef6c136ada8dd.size > 1) {
                var_77e0b71126fdf64b = randomint(var_977ef6c136ada8dd.size);
            }
            wave_struct = var_977ef6c136ada8dd[var_77e0b71126fdf64b];
            function_df930eed75d4f74f(self.var_e9c1fd52868a6722["flood_fill"].request_id, wave_struct.origin, 450);
            return;
        }
        wait 0.1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0e
// Size: 0xc9
function function_3beec27fd573a4d3(spawn_origin) {
    self endon("activity_ended");
    if (!isdefined(self.var_451f96515b100237["specials"][0])) {
        return;
    }
    var_b227e87491386337 = "";
    if (!is_equal(self.difficulty_region, "difficulty_easy")) {
        var_b227e87491386337 = function_ec9e3c8ad5226305();
    }
    if (!istrue(function_a3fe0a637600bde4(var_b227e87491386337))) {
        return;
    }
    str_encounter = "ai_encounter:" + self.var_451f96515b100237["specials"][0];
    request_id = function_f8ccadcd850da124(str_encounter, spawn_origin, 600, 1, 0, 1, 2);
    function_ce9c21523336cdbc(request_id, &function_9b57288fe7ff4054, self);
    function_d37068aac7785c04(request_id, var_b227e87491386337, 1);
    function_a0ebac5daa1b4f4b(request_id, self.difficulty_region);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cdf
// Size: 0x84
function function_a3fe0a637600bde4(var_b227e87491386337) {
    if (is_equal(var_b227e87491386337, "mangler") && isdefined(self.var_e245ba1b36b148a3["zombie_mangler"]) && self.var_e245ba1b36b148a3["zombie_mangler"] < 2) {
        return true;
    }
    if (is_equal(var_b227e87491386337, "disciple") && isdefined(self.var_e245ba1b36b148a3["zombie_disciple"]) && self.var_e245ba1b36b148a3["zombie_disciple"] < 1) {
        return true;
    }
    return false;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6c
// Size: 0x2e
function function_cbb2a02f8b23b67c(requestid, userdata) {
    if (!isdefined(userdata)) {
        return true;
    }
    if (istrue(userdata.outlast_complete)) {
        return true;
    }
    return false;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3da3
// Size: 0x6b
function function_e7f09f9798a64df0(requestid, userdata) {
    function_d37068aac7785c04(requestid, "hellhound", 0);
    function_d37068aac7785c04(requestid, "light_armored_zombie", 0);
    function_d37068aac7785c04(requestid, "heavy_armored_zombie", 0);
    function_d37068aac7785c04(requestid, "base_zombie", 0);
    var_b227e87491386337 = userdata function_a1080ca0704d2c39();
    if (isdefined(var_b227e87491386337)) {
        function_d37068aac7785c04(requestid, var_b227e87491386337, 1);
    }
    return true;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3e17
// Size: 0x149
function function_9b57288fe7ff4054(requestid, userdata, agent, data) {
    if (!isdefined(userdata.var_e245ba1b36b148a3)) {
        return;
    }
    userdata.var_e245ba1b36b148a3[agent.subclass]++;
    if (isalive(agent)) {
        params = spawnstruct();
        params.encounterrequestid = requestid;
        params.objective_instance = userdata;
        agent.var_8839dee6b2fa8c85 = params;
        if (!isdefined(userdata.var_e245ba1b36b148a3[agent.subclass])) {
            userdata.var_e245ba1b36b148a3[agent.subclass] = 0;
        }
        agent.team = "team_two_hundred";
        agent thread zombie_death_watcher();
        if (scripts\engine\utility::percent_chance(20) && !is_equal(params.objective_instance.difficulty_region, "difficulty_easy")) {
            str_speed = "super_sprint";
        } else {
            str_speed = "sprint";
        }
        agent ent_flag_init("activity_outlast_spawned");
        agent function_f1e5805da192a1ef(str_speed, "default", 26);
        agent thread function_53f2c1d1d31a257f(userdata);
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f68
// Size: 0x38
function function_53f2c1d1d31a257f(activity_instance) {
    activity_instance endon("activity_ended");
    self endon("death");
    self function_65cdab0fc78aba8f(activity_instance.var_31f6fb81727fcce3.origin, 3000);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fa8
// Size: 0x7f
function zombie_death_watcher() {
    if (!isdefined(self.var_8839dee6b2fa8c85)) {
        return;
    }
    if (isdefined(self.var_8839dee6b2fa8c85.objective_instance) && self.var_8839dee6b2fa8c85.objective_instance.var_e245ba1b36b148a3[self.subclass] - 1 >= 0) {
        self.var_8839dee6b2fa8c85.objective_instance.var_e245ba1b36b148a3[self.subclass]--;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x402f
// Size: 0xfe
function function_a1080ca0704d2c39() {
    var_31109020393ed11b = "base_zombie";
    if (scripts\engine\utility::percent_chance(12) && isdefined(self.var_e245ba1b36b148a3["zombie_hellhound"]) && self.var_e245ba1b36b148a3["zombie_hellhound"] < 2) {
        var_31109020393ed11b = "hellhound";
    } else if (scripts\engine\utility::percent_chance(30) && isdefined(self.var_e245ba1b36b148a3["zombie_base_armored_light"]) && self.var_e245ba1b36b148a3["zombie_base_armored_light"] < 7 && is_equal(self.difficulty_region, "difficulty_normal")) {
        var_31109020393ed11b = "light_armored_zombie";
    } else if (scripts\engine\utility::percent_chance(30) && isdefined(self.var_e245ba1b36b148a3["zombie_base_armored_heavy"]) && self.var_e245ba1b36b148a3["zombie_base_armored_heavy"] < 7 && function_8fbf2d2648c5c8c5(self.difficulty_region, "difficulty_hard")) {
        var_31109020393ed11b = "heavy_armored_zombie";
    }
    return var_31109020393ed11b;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4136
// Size: 0x26
function function_ec9e3c8ad5226305() {
    var_31109020393ed11b = "mangler";
    if (scripts\engine\utility::percent_chance(50)) {
        var_31109020393ed11b = "disciple";
    }
    return var_31109020393ed11b;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4165
// Size: 0x4d
function function_415547ee4122c2ca() {
    difficulty_region = undefined;
    if (isdefined(level.var_fac39a693f085779)) {
        difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_68dc261109a9503f::function_8988a4c89289d7f4(self));
    }
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        return "difficulty_easy";
    }
    return difficulty_region;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41bb
// Size: 0x96
function function_8fbf2d2648c5c8c5(difficulty_region, var_38571731af34358a) {
    if (is_equal(difficulty_region, var_38571731af34358a)) {
        return true;
    }
    if (is_equal(difficulty_region, "difficulty_easy") || is_equal(difficulty_region, "difficulty_undefined")) {
        return false;
    }
    if (is_equal(difficulty_region, "difficulty_normal") && (is_equal(var_38571731af34358a, "difficulty_hard") || is_equal(var_38571731af34358a, "difficulty_darkaether"))) {
        return false;
    }
    if (is_equal(difficulty_region, "difficulty_hard") && is_equal(var_38571731af34358a, "difficulty_darkaether")) {
        return false;
    }
    return true;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x425a
// Size: 0x13f
function outlast_complete() {
    self notify("outlast_complete");
    self.outlast_complete = 1;
    if (isarray(self.var_a897d5b8c6afdc34.nearby_players)) {
        foreach (player in self.var_a897d5b8c6afdc34.nearby_players) {
            player stoprumble("damage_light");
        }
    }
    self.var_a897d5b8c6afdc34.nearby_players = [];
    function_465ff95e69b7340();
    function_cdce21da555625d1();
    function_20ff2e675354d65e(1);
    wait 2;
    if (!self.var_c3d4e3f8e48b7d3e) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_success_conv");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("on_outlast_success");
    }
    namespace_262d6474998a2356::function_f0361294db9d74a7(-1);
    wait 1;
    endactivity(self, 1);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43a1
// Size: 0xe6
function function_465ff95e69b7340() {
    if (isdefined(self.var_a897d5b8c6afdc34.rumbleent)) {
        self.var_a897d5b8c6afdc34.rumbleent stoprumble("steady_rumble");
        self.var_a897d5b8c6afdc34.rumbleent delete();
    }
    self.var_a897d5b8c6afdc34 setscriptablepartstate("body", "complete");
    earthquake(0.4, 0.7, self.var_a897d5b8c6afdc34.origin, 1250);
    playrumbleonposition("grenade_rumble", self.var_a897d5b8c6afdc34.origin);
    function_cdce21da555625d1();
    self.var_a897d5b8c6afdc34 setscriptablepartstate("sound", "off");
    self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "off");
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x448f
// Size: 0x10
function function_8e83fa331734d121() {
    function_f3a73e1c537a55ae();
    function_eaeca696a20f2c44();
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44a7
// Size: 0x89
function function_8bad1eb9a772a91d(var_19497c4dc72ee955) {
    if (istrue(var_19497c4dc72ee955)) {
        wait 0.6;
    }
    if (isarray(self.var_cd05af3824c52cde)) {
        foreach (prop_scriptable in self.var_cd05af3824c52cde) {
            thread destroy_prop(prop_scriptable, var_19497c4dc72ee955);
        }
    }
    callback::callback("outlast_phase_crystals_destroyed");
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4538
// Size: 0x1b0
function destroy_prop(prop_scriptable, var_19497c4dc72ee955) {
    if (istrue(var_19497c4dc72ee955)) {
        dist = distance2d(self.var_a897d5b8c6afdc34.origin, prop_scriptable.origin);
        wait_time = min(dist / 1000, 3);
        wait wait_time;
    }
    if (is_equal(prop_scriptable.script_noteworthy, "outlast_phase_crystal")) {
        if (!isdefined(prop_scriptable.targetname)) {
            if (prop_scriptable getscriptableparthasstate("body", "destroyed")) {
                prop_scriptable setscriptablepartstate("body", "destroyed");
            } else {
                prop_scriptable setscriptablepartstate("body", "disabled");
            }
        }
        switch (prop_scriptable.targetname) {
        case #"hash_3fc1dec043e7c2ed":
        case #"hash_4f4b067cdd2a227d":
        case #"hash_9ceae540f6c4f91f":
        case #"hash_fafe02a60e439165":
            prop_scriptable setscriptablepartstate("body", "destroyed");
            break;
        case #"hash_3e70bc44fce010a4":
            prop_scriptable setscriptablepartstate("body", "destroyed_outlast_phase_crystal_05");
            break;
        case #"hash_59ca4af302edd1d9":
            prop_scriptable setscriptablepartstate("body", "destroyed_outlast_phase_crystal_06");
            break;
        default:
            if (prop_scriptable getscriptableparthasstate("body", "destroyed")) {
                prop_scriptable setscriptablepartstate("body", "destroyed");
            } else if (prop_scriptable getscriptableparthasstate("body", "disabled")) {
                prop_scriptable setscriptablepartstate("body", "disabled");
            }
            break;
        }
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46f0
// Size: 0x19b
function function_20ff2e675354d65e(var_19497c4dc72ee955) {
    function_8bad1eb9a772a91d(var_19497c4dc72ee955);
    if (isarray(self.var_aa44570d0ce3af7c)) {
        foreach (ent in self.var_aa44570d0ce3af7c) {
            ent delete();
        }
        self.var_aa44570d0ce3af7c = [];
    }
    if (isarray(self.var_cd05af3824c52cde)) {
        foreach (prop_scriptable in self.var_cd05af3824c52cde) {
            if (istrue(var_19497c4dc72ee955) && (is_equal(prop_scriptable.script_noteworthy, "outlast_phase_crystal") || is_equal(prop_scriptable.targetname, "charred_corpse"))) {
                continue;
            }
            if (istrue(var_19497c4dc72ee955) && prop_scriptable getscriptableparthasstate("body", "destroyed")) {
                prop_scriptable setscriptablepartstate("body", "destroyed");
                continue;
            }
            if (!istrue(var_19497c4dc72ee955) && prop_scriptable getscriptableparthasstate("base", "disabled")) {
                prop_scriptable setscriptablepartstate("base", "disabled");
                continue;
            }
            if (prop_scriptable getscriptableparthasstate("body", "disabled")) {
                prop_scriptable setscriptablepartstate("body", "disabled");
            }
        }
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4893
// Size: 0x37
function outlast_cleanup() {
    self.var_a897d5b8c6afdc34 freescriptable();
    self.var_a897d5b8c6afdc34 notify("death");
    function_20ff2e675354d65e(0);
    function_cdce21da555625d1();
    function_eaeca696a20f2c44();
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48d2
// Size: 0x78
function function_eaeca696a20f2c44() {
    namespace_262d6474998a2356::function_f0361294db9d74a7(-1);
    if (isarray(self.var_6c29f2fdb0054bbe)) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
        }
    }
    scripts\mp\objidpoolmanager::function_9cad42ac02eff950(self.var_195b0383b653a3f9);
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4952
// Size: 0xd1
function function_3880b2c36ce9d34f(instance) {
    if (!isdefined(self)) {
        return;
    }
    self endon("disconnect");
    var_24e45f0a148d3f22 = self getentitynumber();
    while (true) {
        if (is_equal(instance.var_2d5b80c94b21ea0e.size, 0) || isdefined(instance.var_2d5b80c94b21ea0e[var_24e45f0a148d3f22]) && istrue(instance.outlast_complete)) {
            stopfxontagforclients(level._effect["outlast_player_screen_aether_motes_vfx"], self, "tag_origin", self);
            killfxontag(level._effect["outlast_player_screen_aether_motes_vfx"], self, "tag_origin");
            namespace_6c72573a48881070::function_9a92ae402e209ecc(instance.str_visionset, 0.5);
            self setscriptablepartstate("ob_outlast", "exit", 0);
            return;
        }
        wait 0.1;
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a2b
// Size: 0xab
function function_cdce21da555625d1() {
    if (isarray(self.var_2d5b80c94b21ea0e)) {
        foreach (player in self.var_2d5b80c94b21ea0e) {
            if (!isdefined(player)) {
                continue;
            }
            player namespace_6c72573a48881070::function_9a92ae402e209ecc(self.str_visionset, 0.5);
            stopfxontagforclients(level._effect["outlast_player_screen_aether_motes_vfx"], player, "tag_origin", player);
            player setscriptablepartstate("ob_outlast", "off", 0);
        }
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ade
// Size: 0x2
function function_a790ffca184f041f() {
    
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ae8
// Size: 0x5b
function function_144f707f2483c23d() {
    if (!isdefined(self.var_31f6fb81727fcce3)) {
        var_4fc079a0d192b315 = getstructarray("s_" + tolower(self.varianttag), "targetname");
        return var_4fc079a0d192b315[0].origin;
    }
    return self.var_31f6fb81727fcce3.origin;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b4c
// Size: 0x36
function function_f4ff769d513fd99e() {
    reward_structs = getstructarray("s_" + tolower(self.varianttag) + "_reward", "targetname");
    return reward_structs[0];
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8b
// Size: 0x44
function function_f1f744ee95023cd() {
    if (isdefined(level.ob_visionset) && isdefined(level.ob_visionset.visionset_name)) {
        return level.ob_visionset.visionset_name;
    }
    return "";
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bd7
// Size: 0x37
function function_1531bbf5cff97dc0(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c16
// Size: 0x22
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c40
// Size: 0x15c
function function_540f9b357f3b5419(var_b381b0883bcd4847) {
    if (!self.var_c3d4e3f8e48b7d3e) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_cancelled");
    }
    var_c606519b03a24916 = self.var_6c29f2fdb0054bbe.size == 0;
    if (var_c606519b03a24916) {
        namespace_c669075cf56436f4::function_765b706dc170e214(self.var_195b0383b653a3f9);
    }
    foreach (player in var_b381b0883bcd4847.playerlist) {
        self.ping_owner calloutmarkerping_hide(self.ping_index, player);
    }
    foreach (player in var_b381b0883bcd4847.playerlist) {
        player callback::callback("on_abandon_outlast_contract");
    }
    wait 0.2;
    foreach (player in var_b381b0883bcd4847.playerlist) {
        function_4a508fcbbea05afd(player);
    }
}

// Namespace namespace_72155ae72c1c70a8 / namespace_edd624734aa27359
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4da4
// Size: 0x73
function private function_4a508fcbbea05afd(player) {
    if (function_5acc35fc66331385(player, 16822)) {
        player ent_flag_clear("quest_s0a1t6_alab_outstart");
        player ent_flag_clear("quest_s0a1t6_alab_outarrive");
        player ent_flag_clear("quest_s0a1t6_alab_outprogressdegrade");
        player ent_flag_clear("quest_s0a1t6_alab_outapproachpnd");
        player ent_flag_clear("quest_s0a1t6_alab_outcontractcancel");
    }
    if (function_5acc35fc66331385(player, 17090)) {
        player ent_flag_clear("quest_s0_a3t4_hold_start");
    }
}

