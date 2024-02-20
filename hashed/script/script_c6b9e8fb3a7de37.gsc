// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
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

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5c
// Size: 0xd0
function function_42696fef39309a29() {
    function_89384091f7a2dbd("REV_OB_OUTLAST", 0, &function_5bb1c4fb788dec5e);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 1, &function_6d52f0a2ee2d14b1);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 2, &function_8e83fa331734d121);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 3, &function_f8104253f64a9bc0);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 4, &function_144f707f2483c23d);
    function_89384091f7a2dbd("REV_OB_OUTLAST", 5, &function_f4ff769d513fd99e);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_OUTLAST");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_OUTLAST");
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_OUTLAST");
    level._effect["outlast_player_screen_aether_motes_vfx"] = loadfx("vfx/t10/levels/zm_t10_garnet/vfx_dark_aether_motes.vfx");
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd33
// Size: 0xa5
function function_5bb1c4fb788dec5e() {
    self.var_7fef38b419e7c59a = function_b9c4aa88ad97ee68(self);
    self.var_73754ee89412ad36 = "s_" + tolower(self.var_626b45032e1892da);
    var_a89e77c759b91ae0 = getstructarray(self.var_73754ee89412ad36, "targetname");
    self.var_31f6fb81727fcce3 = var_a89e77c759b91ae0[0];
    self.str_visionset = "mp_jup_outlast_contract";
    function_be707517d604c41d();
    if (getdvarint(@"hash_7661484c77058395", 0) == 1) {
        function_5db678d359c61a6f();
        self.var_4ca871fc02d7f9af = 1;
        self.str_visionset = "mp_jup_outlast_contract(mp_jup_fort)";
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddf
// Size: 0x133
function function_be707517d604c41d() {
    var_f0a73224e2b13518 = getstructarray(self.var_73754ee89412ad36, "target");
    self.var_79b4bb874f4580f3 = [];
    foreach (content_struct in var_f0a73224e2b13518) {
        if (!isdefined(content_struct.script_noteworthy)) {
            continue;
        }
        self.var_79b4bb874f4580f3[content_struct.script_noteworthy] = function_53c4c53197386572(self.var_79b4bb874f4580f3[content_struct.script_noteworthy], []);
        self.var_79b4bb874f4580f3[content_struct.script_noteworthy] = array_add(self.var_79b4bb874f4580f3[content_struct.script_noteworthy], content_struct);
    }
    self.phase = "spawned";
    if (issharedfuncdefined("ob_quest_missions", "onOutlastActive")) {
        [[ getsharedfunc("ob_quest_missions", "onOutlastActive") ]](self);
    }
    self.difficulty_region = function_415547ee4122c2ca();
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf19
// Size: 0x6a
function function_f5bbb940bcd1f482() {
    var_cd12c9eb57ef1de = self.var_79b4bb874f4580f3["outlast_activity_starter"][0];
    self.var_b189a678c1c3489a = spawnscriptable("brloot_activity_starter_outlast", var_cd12c9eb57ef1de.origin, var_cd12c9eb57ef1de.angles);
    self.activity_starter = namespace_f0d9097b252e530b::function_b4c8d27633108d43("outlast", var_cd12c9eb57ef1de.origin, 0, 50);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8a
// Size: 0x665
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
    foreach (var_c6deeb5ec4d372eb in var_21a2a0834950afa5) {
        if (is_equal(var_c6deeb5ec4d372eb.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_1"][self.var_f10d2bae0aa4fce7["wave_1"].size] = var_c6deeb5ec4d372eb;
        }
    }
    foreach (var_c6deeb5ec4d372eb in var_67250033736f2532) {
        if (is_equal(var_c6deeb5ec4d372eb.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_2"][self.var_f10d2bae0aa4fce7["wave_2"].size] = var_c6deeb5ec4d372eb;
        }
    }
    foreach (var_c6deeb5ec4d372eb in var_12aea82e6c16ad63) {
        if (is_equal(var_c6deeb5ec4d372eb.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_3"][self.var_f10d2bae0aa4fce7["wave_3"].size] = var_c6deeb5ec4d372eb;
        }
    }
    foreach (var_c6deeb5ec4d372eb in var_17b70bcdedf04eab) {
        if (is_equal(var_c6deeb5ec4d372eb.target, self.var_73754ee89412ad36)) {
            self.var_f10d2bae0aa4fce7["wave_all"][self.var_f10d2bae0aa4fce7["wave_all"].size] = var_c6deeb5ec4d372eb;
        }
    }
    self.var_f10d2bae0aa4fce7["wave_available"] = [];
    self.var_f10d2bae0aa4fce7["wave_available"][0] = self.var_f10d2bae0aa4fce7["wave_1"];
    self.var_f10d2bae0aa4fce7["wave_available"][1] = self.var_f10d2bae0aa4fce7["wave_2"];
    self.var_f10d2bae0aa4fce7["wave_available"][2] = self.var_f10d2bae0aa4fce7["wave_3"];
    self.var_e9c1fd52868a6722 = [];
    self.var_fa487176b1a74c00 = [];
    foreach (struct in self.var_7fef38b419e7c59a.var_854ba14a7deb1b09) {
        self.var_fa487176b1a74c00["difficulty_easy"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_easy"], struct.var_f78fed4f8bd6e3bf);
    }
    foreach (struct in self.var_7fef38b419e7c59a.var_212cd94b1002c0e) {
        self.var_fa487176b1a74c00["difficulty_normal"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_normal"], struct.var_f78fed4f8bd6e3bf);
    }
    foreach (struct in self.var_7fef38b419e7c59a.var_b3e042de449a7934) {
        self.var_fa487176b1a74c00["difficulty_hard"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_hard"], struct.var_f78fed4f8bd6e3bf);
    }
    foreach (struct in self.var_7fef38b419e7c59a.var_61ec1be8129cb369) {
        self.var_fa487176b1a74c00["difficulty_darkaether"] = function_6d6af8144a5131f1(self.var_fa487176b1a74c00["difficulty_darkaether"], struct.var_f78fed4f8bd6e3bf);
    }
    self.var_451f96515b100237 = [];
    foreach (struct in self.var_7fef38b419e7c59a.var_bf3f48b7d2da1848) {
        if (isdefined(struct.var_f5ed9f20966ab692)) {
            self.var_451f96515b100237[struct.var_f5ed9f20966ab692] = function_6d6af8144a5131f1(self.var_451f96515b100237[struct.var_f5ed9f20966ab692], struct.var_b8c633dba137a006);
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

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f6
// Size: 0xed
function function_cbc1bd5e3a6f99bf() {
    var_a1edc937cb84ab35 = self.var_79b4bb874f4580f3["pnd"][0];
    self.var_a897d5b8c6afdc34 = spawnscriptable("jup_ob_outlast_pnd", var_a1edc937cb84ab35.origin, var_a1edc937cb84ab35.angles);
    self.var_a897d5b8c6afdc34 setscriptablepartstate("body", "off");
    self.var_a897d5b8c6afdc34.instance = self;
    foreach (player in level.players) {
        self.var_a897d5b8c6afdc34 disablescriptableplayeruse(player);
    }
    namespace_29b5250e9959ea::function_3cec1b2981075936("jup_hacking_device_ob", self.var_a897d5b8c6afdc34, &pnd_activated);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ea
// Size: 0x129
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
    self.instance namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_OUTLAST_ANALYSIS_PHASE");
    if (isplayer(self.instance.var_7039add3ed488111)) {
        self.instance.var_7039add3ed488111 namespace_ede58c1e66c2c280::calloutmarkerping_removecallout(self.instance.var_40112e1aa5936dd2);
    }
    self.instance notify("outlast_start");
    self.instance thread outlast_begin_analysis_phase();
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x181a
// Size: 0x19
function function_d57c6c500fa1f237(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "jup_ob_outlast_pnd";
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183b
// Size: 0xd8
function function_f2ada6ddeb80fc6f() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("outlast_complete");
    self.var_a897d5b8c6afdc34.nearby_players = [];
    while (1) {
        self.var_a897d5b8c6afdc34.nearby_players = namespace_7e17181d03156026::getplayersinradius(self.var_a897d5b8c6afdc34.origin, 120);
        foreach (player in self.var_a897d5b8c6afdc34.nearby_players) {
            if (!istrue(self.var_2df4ef0e0e8da6aa)) {
                player thread function_d39bd9d53b8fc950(self);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191a
// Size: 0x96
function function_d39bd9d53b8fc950(instance) {
    self endon("death");
    self endon("disconnect");
    self playrumblelooponentity("damage_light");
    while (1) {
        if (isarray(instance.var_a897d5b8c6afdc34.nearby_players) && array_contains(instance.var_a897d5b8c6afdc34.nearby_players, self)) {
            self.var_2df4ef0e0e8da6aa = 1;
            wait(0.1);
            continue;
        }
        self stoprumble("damage_light");
        self.var_2df4ef0e0e8da6aa = undefined;
        return;
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19b7
// Size: 0x56
function private function_aa4d30d0e7f5473d(player) {
    player function_bf9ec93bee75f88c(1);
    bomb = makeweapon("jup_hacking_device_ob");
    player namespace_df5cfdbe6e2d3812::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread namespace_19b4203b51d56488::switchtouseweapon(bomb, 1);
    return bomb;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a15
// Size: 0x105
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
        val::function_c9d0b43701bdba00("outlast_holding_bomb");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b21
// Size: 0x52
function private function_c01611fbd560866e(player) {
    self endon("pnd_activated");
    player notifyonplayercommand("cancel", "+weapnext");
    self.cancel = 0;
    player waittill("cancel");
    self.cancel = 1;
    player notifyonplayercommandremove("cancel", "+weapnext");
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b7a
// Size: 0x108
function private function_8c4cabae6169b20b(player) {
    if (isdefined(self.defusing) && istrue(self.defusing)) {
        return 0;
    }
    self.defusing = 1;
    bomb = function_aa4d30d0e7f5473d(player);
    thread function_c01611fbd560866e(player);
    buttontime = 0;
    while (buttontime < 2) {
        if (self.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
            self.defusing = 0;
            return 0;
        }
        buttontime = buttontime + level.framedurationseconds;
        waitframe();
    }
    self.var_285292a6695a1fca = player;
    self notify("pnd_activated");
    player namespace_df5cfdbe6e2d3812::getridofweapon("jup_hacking_device_ob");
    if (isdefined(player)) {
        player notifyonplayercommandremove("cancel", "+weapnext");
    }
    player val::function_c9d0b43701bdba00("hostage_holding_bomb");
    player function_bb04491d50d9e43e();
    thread pnd_activated(self);
    return 1;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8a
// Size: 0x6f
function function_888ea771ff731707() {
    self.var_2d5b80c94b21ea0e = [];
    self.var_c8255a246e6632c4 = self.var_79b4bb874f4580f3["outlast_space"][0];
    self.var_848acb00281d34ff = self.var_79b4bb874f4580f3["outlast_entrance"];
    self.var_56809f597707acb1 = self.var_79b4bb874f4580f3["outlast_exit"];
    thread function_f0ea0856c67d86b9();
    thread function_79897c367846ca0c();
    thread function_34689bde3b4de227();
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d00
// Size: 0xe2
function function_79897c367846ca0c() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_32ae8247ab203094 = 1000;
    while (1) {
        wait(1);
        players = namespace_7e17181d03156026::getplayersinradius(self.var_c8255a246e6632c4.origin, self.var_c8255a246e6632c4.radius + var_32ae8247ab203094);
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

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de9
// Size: 0x16e
function function_f0ea0856c67d86b9() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("outlast_complete");
    self.nearby_players = [];
    while (1) {
        wait(1);
        players = namespace_7e17181d03156026::getplayersinradius(self.var_c8255a246e6632c4.origin, self.var_c8255a246e6632c4.radius);
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
        } else {
            self.var_2f5869df4f5501b4 = 0;
        }
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5e
// Size: 0x1a5
function function_1f3ee3210c0f24dc(player, var_b49cf3a7a9a03c1d) {
    if (!isdefined(player)) {
        return;
    }
    player endon("disconnect");
    if (!istrue(self.var_611a679894bb7a99) && array_contains(self.var_6c29f2fdb0054bbe, player)) {
        if (!self.var_d781ff762095c86d) {
            thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_approachpnd");
        }
        self notify("outlast_space_entered_first_time");
        foreach (var_d7836ab41dca3e4a in self.var_6c29f2fdb0054bbe) {
            var_d7836ab41dca3e4a callback::callback("on_approach_outlast_pnd");
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
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.var_195b0383b653a3f9, player);
        }
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210a
// Size: 0x9e
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
    self.var_2d5b80c94b21ea0e = namespace_3c37cb17ade254d::array_remove_key(self.var_2d5b80c94b21ea0e, player getentitynumber());
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21af
// Size: 0x19
function function_34689bde3b4de227() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    thread function_40f0f0d1f815e339();
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21cf
// Size: 0xbf
function function_509738f625c8db3b(instance) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    self endon("outlast_left_detection_area");
    var_5c2a54b6e701a80b = function_f159c10d5cf8f0b4("outlast_noent_entrance_trigger", "targetname");
    var_2b7c44b7b76d84b6 = [];
    foreach (var_9c301ce50ade5aba in var_5c2a54b6e701a80b) {
        if (is_equal(var_9c301ce50ade5aba.target, instance.var_73754ee89412ad36)) {
            var_2b7c44b7b76d84b6 = array_add(var_2b7c44b7b76d84b6, var_9c301ce50ade5aba);
        }
    }
    thread function_4d4a938412a1bbb(instance, var_2b7c44b7b76d84b6);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2295
// Size: 0x218
function function_4d4a938412a1bbb(instance, var_64767942f2ac5e7) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    self endon("outlast_left_detection_area");
    self endon("death_or_disconnect");
    while (1) {
        var_63767d21eea5fc10 = self getistouchingentities(var_64767942f2ac5e7);
        var_a366d55ba23e3775 = [];
        if (isdefined(self.vehicle) && self.vehicle namespace_dbbb37eb352edf96::isvehicle()) {
            var_a366d55ba23e3775 = self.vehicle getistouchingentities(var_64767942f2ac5e7);
        }
        a_triggers = array_combine(var_63767d21eea5fc10, var_a366d55ba23e3775);
        if (a_triggers.size > 0) {
            ent = self;
            is_vehicle = ent namespace_dbbb37eb352edf96::isvehicle();
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
                        iprintlnbold("difficulty_darkaether");
                    #/
                    instance function_1f3ee3210c0f24dc(player, 1);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24b4
// Size: 0xc8
function function_40f0f0d1f815e339() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        foreach (player in self.var_2d5b80c94b21ea0e) {
            if (isplayer(player) && isdefined(self.var_2d5b80c94b21ea0e[player getentitynumber()]) && isdefined(player.var_648c3850e9969e0a) && gettime() - player.var_648c3850e9969e0a > 200) {
                /#
                    iprintlnbold("activity_ended");
                #/
                function_d80c0f98bd0188fc(player);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2583
// Size: 0x22d
function function_5db678d359c61a6f() {
    if (istrue(self.var_4ca871fc02d7f9af)) {
        return;
    }
    self.var_aa44570d0ce3af7c = [];
    self.var_cd05af3824c52cde = getentitylessscriptablearray(self.var_73754ee89412ad36, "target");
    foreach (var_8af0d2100f7fe20a in self.var_cd05af3824c52cde) {
        if (is_equal(var_8af0d2100f7fe20a.script_noteworthy, "outlast_phase_crystal")) {
            if (!isdefined(var_8af0d2100f7fe20a.targetname)) {
                continue;
            }
            switch (var_8af0d2100f7fe20a.targetname) {
            case #"hash_3fc1dec043e7c2ed":
                var_8af0d2100f7fe20a setscriptablepartstate("body", "enabled_outlast_phase_crystal_01");
                break;
            case #"hash_4f4b067cdd2a227d":
                var_8af0d2100f7fe20a setscriptablepartstate("body", "enabled_outlast_phase_crystal_02");
                break;
            case #"hash_fafe02a60e439165":
                var_8af0d2100f7fe20a setscriptablepartstate("body", "enabled_outlast_phase_crystal_03");
                break;
            case #"hash_9ceae540f6c4f91f":
                var_8af0d2100f7fe20a setscriptablepartstate("body", "enabled_outlast_phase_crystal_04");
                break;
            case #"hash_3e70bc44fce010a4":
                var_8af0d2100f7fe20a setscriptablepartstate("body", "enabled_outlast_phase_crystal_05");
                break;
            case #"hash_59ca4af302edd1d9":
                var_8af0d2100f7fe20a setscriptablepartstate("body", "enabled_outlast_phase_crystal_06");
                break;
            }
        } else if (is_equal(var_8af0d2100f7fe20a.targetname, "outlast_aether_vfx_prop") && isdefined(var_8af0d2100f7fe20a.script_noteworthy) && var_8af0d2100f7fe20a getscriptableparthasstate("body", var_8af0d2100f7fe20a.script_noteworthy)) {
            var_8af0d2100f7fe20a setscriptablepartstate("body", var_8af0d2100f7fe20a.script_noteworthy);
        } else if (var_8af0d2100f7fe20a getscriptableparthasstate("body", "enabled")) {
            var_8af0d2100f7fe20a setscriptablepartstate("body", "enabled");
        } else if (var_8af0d2100f7fe20a getscriptableparthasstate("base", "enabled")) {
            var_8af0d2100f7fe20a setscriptablepartstate("base", "enabled");
        }
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b7
// Size: 0x118
function function_6d52f0a2ee2d14b1() {
    self.difficulty_region = function_415547ee4122c2ca();
    self.var_d781ff762095c86d = namespace_9dcaa84266dc73e2::function_f578373042c34e16(17090, "quest_s0_a3t4_hold_start", self.var_6c29f2fdb0054bbe);
    self.var_c3d4e3f8e48b7d3e = 0;
    if (!self.var_d781ff762095c86d) {
        self.var_d781ff762095c86d = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16822, "quest_s0a1t6_alab_outstart", self.var_6c29f2fdb0054bbe);
        if (istrue(self.var_d781ff762095c86d)) {
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

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d6
// Size: 0x76
function function_bb8d279a3f7273c() {
    thread function_dc6eb704d6aaab91();
    self.phase = "pnd";
    foreach (player in self.var_6c29f2fdb0054bbe) {
        self.var_a897d5b8c6afdc34 enablescriptableplayeruse(player);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2953
// Size: 0xe8
function outlast_begin_analysis_phase() {
    self notify("outlast_begin_analysis_phase");
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    namespace_262d6474998a2356::function_f0361294db9d74a7(0, 1);
    namespace_262d6474998a2356::function_c661dba3e304266b(0);
    self.var_53f74ebdfbe19d43 = 0;
    self.phase = "analysis";
    self.var_2a2f4483763847a0 = "current";
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_195b0383b653a3f9, "current");
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.var_195b0383b653a3f9, 1);
    foreach (player in self.var_6c29f2fdb0054bbe) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.var_195b0383b653a3f9, player);
    }
    thread function_ebfe4ffaa1829677();
    thread function_ec6aed16df18bc32();
    thread function_223b1ac278b3d7ab();
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a42
// Size: 0x125
function function_dc6eb704d6aaab91() {
    if (isdefined(level.var_7f1d1c7c6153a9bf) && [[ level.var_7f1d1c7c6153a9bf ]]()) {
        self.var_195b0383b653a3f9 = function_36a95c9de2ace25a("ob_outlast_marker_rift_run", 0, 1);
    } else {
        self.var_195b0383b653a3f9 = function_36a95c9de2ace25a("ob_outlast_marker", 0, 1);
    }
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_195b0383b653a3f9, self.var_a897d5b8c6afdc34.origin + (0, 0, 48));
    namespace_5a22b6f3a56f7e9b::function_98ba077848896a3(self.var_195b0383b653a3f9, 1);
    waitframe();
    self.var_2a2f4483763847a0 = "current";
    function_6f02ac608d44fdbf(self.var_195b0383b653a3f9, 0, 1);
    self.var_7039add3ed488111 = self.var_6c29f2fdb0054bbe[0];
    self.var_40112e1aa5936dd2 = self.var_7039add3ed488111 namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, self.var_a897d5b8c6afdc34.origin + (0, 0, 24), self.var_195b0383b653a3f9);
    self waittill("activity_ended");
    function_765b706dc170e214(self.var_195b0383b653a3f9);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6e
// Size: 0x41d
function function_ebfe4ffaa1829677() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        if (self.var_53f74ebdfbe19d43 >= function_2a735aa87f0f3b58()) {
            thread outlast_complete();
            namespace_262d6474998a2356::function_c661dba3e304266b(100);
            return;
        } else if (self.var_53f74ebdfbe19d43 + 0.1 < function_2a735aa87f0f3b58()) {
            var_1af75cda250b7d28 = int(self.var_53f74ebdfbe19d43 / function_2a735aa87f0f3b58() * 100);
            namespace_262d6474998a2356::function_f0361294db9d74a7(var_1af75cda250b7d28);
            namespace_262d6474998a2356::function_c661dba3e304266b(var_1af75cda250b7d28);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.var_195b0383b653a3f9, self.var_53f74ebdfbe19d43 / function_2a735aa87f0f3b58());
            foreach (player in self.var_6c29f2fdb0054bbe) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.var_195b0383b653a3f9, player);
                objective_pinforclient(self.var_195b0383b653a3f9, player);
            }
        }
        if (!isdefined(self.var_18aaec4c8e0a3ddf)) {
            self.var_18aaec4c8e0a3ddf = 0;
        }
        var_f2a9f5fa067d1006 = self.var_a897d5b8c6afdc34 getscriptablepartstate("sound");
        if (function_d4be90854c90c61()) {
            var_31ad6818c5b85ac4 = 1;
            if (!istrue(getdvarint(@"hash_9f59a5679bf31951", 0))) {
                if (isdefined(self.var_bb23133727e6c56c) && self.var_bb23133727e6c56c > self.var_53f74ebdfbe19d43) {
                    var_b16bd19b850dacf3 = self.var_53f74ebdfbe19d43 / 90 * 100;
                    var_635f487405664a8a = self.var_bb23133727e6c56c / 90 * 100;
                    if (var_635f487405664a8a - self.var_53f74ebdfbe19d43 > 10) {
                        var_31ad6818c5b85ac4 = 3;
                    } else {
                        var_31ad6818c5b85ac4 = 2;
                    }
                }
            }
            self.var_53f74ebdfbe19d43 = self.var_53f74ebdfbe19d43 + 0.1 * var_31ad6818c5b85ac4;
            if (!is_equal(var_f2a9f5fa067d1006, "increment")) {
                self.var_a897d5b8c6afdc34 setscriptablepartstate("sound", "increment");
            }
        } else if (self.var_53f74ebdfbe19d43 - 0.1 > 0) {
            self.var_53f74ebdfbe19d43 = self.var_53f74ebdfbe19d43 - 0.05;
            if (!is_equal(var_f2a9f5fa067d1006, "decrement")) {
                self.var_a897d5b8c6afdc34 setscriptablepartstate("sound", "decrement");
            }
            self.var_18aaec4c8e0a3ddf = 1;
        } else {
            self.var_53f74ebdfbe19d43 = 0;
        }
        if (self.var_53f74ebdfbe19d43 <= 0 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "off")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "off");
        } else if (self.var_53f74ebdfbe19d43 > 0 && self.var_53f74ebdfbe19d43 < 33 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "stage_1")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "stage_1");
        } else if (self.var_53f74ebdfbe19d43 > 33 && self.var_53f74ebdfbe19d43 < 66 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "stage_2")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "stage_2");
        } else if (self.var_53f74ebdfbe19d43 > 66 && !is_equal(self.var_a897d5b8c6afdc34 getscriptablepartstate("stages"), "stage_3")) {
            self.var_a897d5b8c6afdc34 setscriptablepartstate("stages", "stage_3");
        }
        earthquake(0.1, 0.1, self.var_a897d5b8c6afdc34.origin, 320);
        wait(0.1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f92
// Size: 0x1b
function function_2a735aa87f0f3b58() {
    return function_53c4c53197386572(getdvarint(@"hash_f20148b185771406", 90), 90);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb5
// Size: 0x88
function function_d4be90854c90c61() {
    if (isarray(self.var_2d5b80c94b21ea0e)) {
        foreach (player in self.var_2d5b80c94b21ea0e) {
            if (array_contains(self.var_6c29f2fdb0054bbe, player) && !istrue(player.inlaststand)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3045
// Size: 0xec
function function_ec6aed16df18bc32() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_6f2cf9f07129356 = self.var_53f74ebdfbe19d43;
    var_9b8d7d8e48ee7204 = function_2a735aa87f0f3b58() / 5;
    while (1) {
        if (self.var_53f74ebdfbe19d43 > var_6f2cf9f07129356) {
            var_6f2cf9f07129356 = self.var_53f74ebdfbe19d43;
        } else if (self.var_53f74ebdfbe19d43 < var_6f2cf9f07129356 - var_9b8d7d8e48ee7204) {
            if (!self.var_c3d4e3f8e48b7d3e) {
                thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_progressdegrade");
            }
            foreach (player in self.var_6c29f2fdb0054bbe) {
                player callback::callback("on_outlast_progress_degrade");
            }
            break;
        }
        wait(1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3138
// Size: 0x1d8
function function_223b1ac278b3d7ab() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_b2b20c7915262894 = 8;
    var_b2b20f7915262f2d = 11;
    var_b2b20e7915262cfa = 15;
    var_b2b20979152621fb = 21;
    self.var_973693d2bb740820 = 1;
    if (!istrue(getdvarint(@"hash_9f59a5679bf31951", 0))) {
        thread function_dcf10a9b7fed5ffa();
    }
    thread function_558d11c826a89107(self.var_a897d5b8c6afdc34.origin);
    if (!self.var_c3d4e3f8e48b7d3e) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_wave1_conv");
    }
    while (1) {
        if (self.var_53f74ebdfbe19d43 < 25) {
            self.var_973693d2bb740820 = 1;
        } else if (self.var_53f74ebdfbe19d43 >= 25 && self.var_53f74ebdfbe19d43 < 50) {
            self.var_973693d2bb740820 = 2;
        } else if (self.var_53f74ebdfbe19d43 >= 50 && self.var_53f74ebdfbe19d43 < 75) {
            if (self.var_973693d2bb740820 == 2) {
                if (randomfloat(1) < 0.2 && !self.var_c3d4e3f8e48b7d3e) {
                    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_wave3_conv");
                }
            }
            self.var_973693d2bb740820 = 3;
        } else if (self.var_53f74ebdfbe19d43 >= 75) {
            self.var_973693d2bb740820 = 4;
        }
        if (!is_equal(self.var_52d752ae1154c7a4, self.var_973693d2bb740820)) {
            self.var_52d752ae1154c7a4 = self.var_973693d2bb740820;
            thread function_3beec27fd573a4d3(self.var_a897d5b8c6afdc34.origin);
            self notify("new_wave");
            thread function_826ac3e8eda7dcbd(self.var_973693d2bb740820);
        }
        wait(1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3317
// Size: 0x108
function function_558d11c826a89107(spawn_origin) {
    self endon("activity_ended");
    var_973693d2bb740820 = function_53c4c53197386572(self.var_973693d2bb740820, 1);
    if (!isdefined(self.var_fa487176b1a74c00[self.difficulty_region][0])) {
        return;
    }
    var_934083a148144947 = "ai_flood_fill_encounter:" + self.var_fa487176b1a74c00[self.difficulty_region][0];
    var_be8ebaf932e93656 = function_f8ccadcd850da124(var_934083a148144947, spawn_origin, 600, 1, 0, 1, 2);
    function_ce9c21523336cdbc(var_be8ebaf932e93656, &function_9b57288fe7ff4054, self);
    function_d37068aac7785c04(var_be8ebaf932e93656, "base_zombie", 1);
    namespace_614554f86e52695c::function_bc5315dc37ae4cf(var_be8ebaf932e93656, &function_e7f09f9798a64df0, self);
    namespace_614554f86e52695c::function_73147cdf5c28d10c(var_be8ebaf932e93656, &function_cbb2a02f8b23b67c, self);
    var_9b1faacf64b45dc1 = spawnstruct();
    var_9b1faacf64b45dc1.var_be8ebaf932e93656 = var_be8ebaf932e93656;
    var_9b1faacf64b45dc1.var_973693d2bb740820 = var_973693d2bb740820;
    self.var_e9c1fd52868a6722["flood_fill"] = var_9b1faacf64b45dc1;
    function_826ac3e8eda7dcbd(1);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3426
// Size: 0x220
function function_826ac3e8eda7dcbd(var_973693d2bb740820) {
    if (istrue(self.var_dcede8d7379e7d46)) {
        return;
    }
    if (isdefined(self.var_e9c1fd52868a6722["flood_fill"])) {
        var_5390af79cb787f4f = 9;
        var_ae600836b9c6bee1 = "wave_4";
        switch (var_973693d2bb740820) {
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
        function_4b7d420e1bad897f(self.var_e9c1fd52868a6722["flood_fill"].var_be8ebaf932e93656, var_5390af79cb787f4f);
        if (is_equal(var_ae600836b9c6bee1, "wave_4")) {
            function_410022707c218cf6(self.var_e9c1fd52868a6722["flood_fill"].var_be8ebaf932e93656);
        } else if (isarray(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1]) && self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1].size > 0) {
            var_2f83bbfb9ec4b522 = 0;
            var_77e0b71126fdf64b = 0;
            if (self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1].size > 1) {
                var_2f83bbfb9ec4b522 = randomint(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1].size);
                var_77e0b71126fdf64b = randomint(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522].size);
            }
            var_4af6417153ca0760 = self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522][var_77e0b71126fdf64b];
            /#
                iprintlnbold("+weapnext" + var_4af6417153ca0760.script_noteworthy);
            #/
            function_df930eed75d4f74f(self.var_e9c1fd52868a6722["flood_fill"].var_be8ebaf932e93656, var_4af6417153ca0760.origin, 450);
            thread function_6d4324bc965c3e61(self.var_f10d2bae0aa4fce7, var_ae600836b9c6bee1, var_2f83bbfb9ec4b522, var_77e0b71126fdf64b);
            self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1] = array_remove_index(self.var_f10d2bae0aa4fce7[var_ae600836b9c6bee1], var_2f83bbfb9ec4b522);
        }
        self.var_52d752ae1154c7a4 = var_973693d2bb740820;
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364d
// Size: 0x1f5
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
    while (1) {
        if (self.var_53f74ebdfbe19d43 > self.var_bb23133727e6c56c) {
            self.var_bb23133727e6c56c = self.var_53f74ebdfbe19d43;
        }
        if (istrue(self.var_dcede8d7379e7d46)) {
            function_4b7d420e1bad897f(self.var_e9c1fd52868a6722["flood_fill"].var_be8ebaf932e93656, 0);
            if (istrue(var_d98e7782adf04c11)) {
                var_2c8d2887a1007271 = self.var_bb23133727e6c56c;
                var_d98e7782adf04c11 = 0;
            }
            var_973389638edb1cb8 = var_d288fc1498a18193;
            var_d8ef071103d43ca7 = self.var_53f74ebdfbe19d43 / 90 * 100;
            if (var_d8ef071103d43ca7 > 80) {
                var_973389638edb1cb8 = var_19ac119cbf89bd54;
            }
            if (self.var_53f74ebdfbe19d43 > var_2c8d2887a1007271 + var_973389638edb1cb8) {
                self.var_dcede8d7379e7d46 = 0;
                var_69ff2c79067930eb = -1;
                function_826ac3e8eda7dcbd(self.var_52d752ae1154c7a4);
            }
        } else if (!istrue(self.var_dcede8d7379e7d46)) {
            if (var_69ff2c79067930eb < 0) {
                var_69ff2c79067930eb = gettime();
                var_5ad45d58d388d987 = self.var_53f74ebdfbe19d43;
            }
            if (self.var_53f74ebdfbe19d43 < self.var_bb23133727e6c56c - var_990f5d73cc6bd9bd) {
                self.var_dcede8d7379e7d46 = 1;
                var_d98e7782adf04c11 = 1;
            } else if (self.var_53f74ebdfbe19d43 > var_5ad45d58d388d987 - var_990f5d73cc6bd9bd && self.var_53f74ebdfbe19d43 < var_5ad45d58d388d987 + var_990f5d73cc6bd9bd) {
                if (gettime() > var_69ff2c79067930eb + var_700daf409a522bad) {
                    self.var_dcede8d7379e7d46 = 1;
                    var_d98e7782adf04c11 = 1;
                }
            } else {
                var_69ff2c79067930eb = -1;
            }
        }
        wait(1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3849
// Size: 0xd8
function function_6d4324bc965c3e61(var_f10d2bae0aa4fce7, var_ae600836b9c6bee1, var_2f83bbfb9ec4b522, var_77e0b71126fdf64b) {
    self endon("activity_ended");
    self endon("new_wave");
    var_977ef6c136ada8dd = array_remove(var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522], var_f10d2bae0aa4fce7[var_ae600836b9c6bee1][var_2f83bbfb9ec4b522][var_77e0b71126fdf64b]);
    if (is_equal(var_977ef6c136ada8dd.size, 0)) {
        return;
    }
    var_38590bf732a31e79 = gettime();
    while (1) {
        if (gettime() - var_38590bf732a31e79 > 17500) {
            var_77e0b71126fdf64b = 0;
            if (var_977ef6c136ada8dd.size > 1) {
                var_77e0b71126fdf64b = randomint(var_977ef6c136ada8dd.size);
            }
            var_4af6417153ca0760 = var_977ef6c136ada8dd[var_77e0b71126fdf64b];
            function_df930eed75d4f74f(self.var_e9c1fd52868a6722["flood_fill"].var_be8ebaf932e93656, var_4af6417153ca0760.origin, 450);
            return;
        }
        wait(0.1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3928
// Size: 0xcb
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
    var_7310dc6deb99688e = "ai_encounter:" + self.var_451f96515b100237["specials"][0];
    var_be8ebaf932e93656 = function_f8ccadcd850da124(var_7310dc6deb99688e, spawn_origin, 600, 1, 0, 1, 2);
    function_ce9c21523336cdbc(var_be8ebaf932e93656, &function_9b57288fe7ff4054, self);
    function_d37068aac7785c04(var_be8ebaf932e93656, var_b227e87491386337, 1);
    function_a0ebac5daa1b4f4b(var_be8ebaf932e93656, self.difficulty_region);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39fa
// Size: 0x85
function function_a3fe0a637600bde4(var_b227e87491386337) {
    if (is_equal(var_b227e87491386337, "mangler") && isdefined(self.var_e245ba1b36b148a3["zombie_mangler"]) && self.var_e245ba1b36b148a3["zombie_mangler"] < 2) {
        return 1;
    }
    if (is_equal(var_b227e87491386337, "disciple") && isdefined(self.var_e245ba1b36b148a3["zombie_disciple"]) && self.var_e245ba1b36b148a3["zombie_disciple"] < 1) {
        return 1;
    }
    return 0;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a87
// Size: 0x2f
function function_cbb2a02f8b23b67c(requestid, userdata) {
    if (!isdefined(userdata)) {
        return 1;
    }
    if (istrue(userdata.outlast_complete)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3abe
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
    return 1;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b31
// Size: 0x14a
function function_9b57288fe7ff4054(requestid, userdata, agent, data) {
    if (!isdefined(userdata.var_e245ba1b36b148a3)) {
        return;
    }
    userdata.var_e245ba1b36b148a3[agent.subclass]++;
    if (isalive(agent)) {
        params = spawnstruct();
        params.var_1e7adb1107ff0cf6 = requestid;
        params.var_c3c8e6401e8264be = userdata;
        agent.var_8839dee6b2fa8c85 = params;
        if (!isdefined(userdata.var_e245ba1b36b148a3[agent.subclass])) {
            userdata.var_e245ba1b36b148a3[agent.subclass] = 0;
        }
        agent.team = "team_two_hundred";
        agent thread zombie_death_watcher();
        if (namespace_3c37cb17ade254d::function_51d76700600cebe3(20) && !is_equal(params.var_c3c8e6401e8264be.difficulty_region, "difficulty_easy")) {
            var_9038e48904360a14 = "super_sprint";
        } else {
            var_9038e48904360a14 = "sprint";
        }
        agent ent_flag_init("activity_outlast_spawned");
        agent function_f1e5805da192a1ef(var_9038e48904360a14, "default", 26);
        agent thread function_53f2c1d1d31a257f(userdata);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c82
// Size: 0x39
function function_53f2c1d1d31a257f(var_2f5d509d7b71ce9a) {
    var_2f5d509d7b71ce9a endon("activity_ended");
    self endon("death");
    self function_65cdab0fc78aba8f(var_2f5d509d7b71ce9a.var_31f6fb81727fcce3.origin, 3000);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cc2
// Size: 0x80
function zombie_death_watcher() {
    if (!isdefined(self.var_8839dee6b2fa8c85)) {
        return;
    }
    if (isdefined(self.var_8839dee6b2fa8c85.var_c3c8e6401e8264be) && self.var_8839dee6b2fa8c85.var_c3c8e6401e8264be.var_e245ba1b36b148a3[self.subclass] - 1 >= 0) {
        self.var_8839dee6b2fa8c85.var_c3c8e6401e8264be.var_e245ba1b36b148a3[self.subclass]--;
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d49
// Size: 0xfe
function function_a1080ca0704d2c39() {
    var_31109020393ed11b = "base_zombie";
    if (namespace_3c37cb17ade254d::function_51d76700600cebe3(12) && isdefined(self.var_e245ba1b36b148a3["zombie_hellhound"]) && self.var_e245ba1b36b148a3["zombie_hellhound"] < 2) {
        var_31109020393ed11b = "hellhound";
    } else if (namespace_3c37cb17ade254d::function_51d76700600cebe3(30) && isdefined(self.var_e245ba1b36b148a3["zombie_base_armored_light"]) && self.var_e245ba1b36b148a3["zombie_base_armored_light"] < 7 && is_equal(self.difficulty_region, "difficulty_normal")) {
        var_31109020393ed11b = "light_armored_zombie";
    } else if (namespace_3c37cb17ade254d::function_51d76700600cebe3(30) && isdefined(self.var_e245ba1b36b148a3["zombie_base_armored_heavy"]) && self.var_e245ba1b36b148a3["zombie_base_armored_heavy"] < 7 && function_8fbf2d2648c5c8c5(self.difficulty_region, "difficulty_hard")) {
        var_31109020393ed11b = "heavy_armored_zombie";
    }
    return var_31109020393ed11b;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e4f
// Size: 0x26
function function_ec9e3c8ad5226305() {
    var_31109020393ed11b = "mangler";
    if (namespace_3c37cb17ade254d::function_51d76700600cebe3(50)) {
        var_31109020393ed11b = "disciple";
    }
    return var_31109020393ed11b;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7d
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

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ed2
// Size: 0x97
function function_8fbf2d2648c5c8c5(difficulty_region, var_38571731af34358a) {
    if (is_equal(difficulty_region, var_38571731af34358a)) {
        return 1;
    }
    if (is_equal(difficulty_region, "difficulty_easy") || is_equal(difficulty_region, "difficulty_undefined")) {
        return 0;
    }
    if (is_equal(difficulty_region, "difficulty_normal") && (is_equal(var_38571731af34358a, "difficulty_hard") || is_equal(var_38571731af34358a, "difficulty_darkaether"))) {
        return 0;
    }
    if (is_equal(difficulty_region, "difficulty_hard") && is_equal(var_38571731af34358a, "difficulty_darkaether")) {
        return 0;
    }
    return 1;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f71
// Size: 0x143
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
    wait(2);
    if (!self.var_c3d4e3f8e48b7d3e) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_success_conv");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("on_outlast_success");
    }
    namespace_262d6474998a2356::function_f0361294db9d74a7(-1);
    wait(1);
    function_612d18fdbc979c0b(self, 1);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40bb
// Size: 0xe7
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

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a9
// Size: 0x11
function function_8e83fa331734d121() {
    function_f3a73e1c537a55ae();
    function_eaeca696a20f2c44();
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c1
// Size: 0x8b
function function_8bad1eb9a772a91d(var_19497c4dc72ee955) {
    if (istrue(var_19497c4dc72ee955)) {
        wait(0.6);
    }
    if (isarray(self.var_cd05af3824c52cde)) {
        foreach (var_8af0d2100f7fe20a in self.var_cd05af3824c52cde) {
            thread function_457af9b672b803bb(var_8af0d2100f7fe20a, var_19497c4dc72ee955);
        }
    }
    callback::callback("outlast_phase_crystals_destroyed");
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4253
// Size: 0x1b1
function function_457af9b672b803bb(var_8af0d2100f7fe20a, var_19497c4dc72ee955) {
    if (istrue(var_19497c4dc72ee955)) {
        dist = distance2d(self.var_a897d5b8c6afdc34.origin, var_8af0d2100f7fe20a.origin);
        wait_time = min(dist / 1000, 3);
        wait(wait_time);
    }
    if (is_equal(var_8af0d2100f7fe20a.script_noteworthy, "outlast_phase_crystal")) {
        if (!isdefined(var_8af0d2100f7fe20a.targetname)) {
            if (var_8af0d2100f7fe20a getscriptableparthasstate("body", "destroyed")) {
                var_8af0d2100f7fe20a setscriptablepartstate("body", "destroyed");
            } else {
                var_8af0d2100f7fe20a setscriptablepartstate("body", "disabled");
            }
        }
        switch (var_8af0d2100f7fe20a.targetname) {
        case #"hash_3fc1dec043e7c2ed":
        case #"hash_4f4b067cdd2a227d":
        case #"hash_9ceae540f6c4f91f":
        case #"hash_fafe02a60e439165":
            var_8af0d2100f7fe20a setscriptablepartstate("body", "destroyed");
            break;
        case #"hash_3e70bc44fce010a4":
            var_8af0d2100f7fe20a setscriptablepartstate("body", "destroyed_outlast_phase_crystal_05");
            break;
        case #"hash_59ca4af302edd1d9":
            var_8af0d2100f7fe20a setscriptablepartstate("body", "destroyed_outlast_phase_crystal_06");
            break;
        default:
            if (var_8af0d2100f7fe20a getscriptableparthasstate("body", "destroyed")) {
                var_8af0d2100f7fe20a setscriptablepartstate("body", "destroyed");
            } else if (var_8af0d2100f7fe20a getscriptableparthasstate("body", "disabled")) {
                var_8af0d2100f7fe20a setscriptablepartstate("body", "disabled");
            }
            break;
        }
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440b
// Size: 0x1a0
function function_20ff2e675354d65e(var_19497c4dc72ee955) {
    function_8bad1eb9a772a91d(var_19497c4dc72ee955);
    if (isarray(self.var_aa44570d0ce3af7c)) {
        foreach (ent in self.var_aa44570d0ce3af7c) {
            ent delete();
        }
        self.var_aa44570d0ce3af7c = [];
    }
    if (isarray(self.var_cd05af3824c52cde)) {
        foreach (var_8af0d2100f7fe20a in self.var_cd05af3824c52cde) {
            if (istrue(var_19497c4dc72ee955) && (is_equal(var_8af0d2100f7fe20a.script_noteworthy, "outlast_phase_crystal") || is_equal(var_8af0d2100f7fe20a.targetname, "charred_corpse"))) {
                continue;
            }
            if (istrue(var_19497c4dc72ee955) && var_8af0d2100f7fe20a getscriptableparthasstate("body", "destroyed")) {
                var_8af0d2100f7fe20a setscriptablepartstate("body", "destroyed");
            } else if (!istrue(var_19497c4dc72ee955) && var_8af0d2100f7fe20a getscriptableparthasstate("base", "disabled")) {
                var_8af0d2100f7fe20a setscriptablepartstate("base", "disabled");
            } else if (var_8af0d2100f7fe20a getscriptableparthasstate("body", "disabled")) {
                var_8af0d2100f7fe20a setscriptablepartstate("body", "disabled");
            }
        }
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b2
// Size: 0x38
function function_f8104253f64a9bc0() {
    self.var_a897d5b8c6afdc34 freescriptable();
    self.var_a897d5b8c6afdc34 notify("death");
    function_20ff2e675354d65e(0);
    function_cdce21da555625d1();
    function_eaeca696a20f2c44();
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f1
// Size: 0x7a
function function_eaeca696a20f2c44() {
    namespace_262d6474998a2356::function_f0361294db9d74a7(-1);
    if (isarray(self.var_6c29f2fdb0054bbe)) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
        }
    }
    namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(self.var_195b0383b653a3f9);
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4672
// Size: 0xd1
function function_3880b2c36ce9d34f(instance) {
    if (!isdefined(self)) {
        return;
    }
    self endon("disconnect");
    var_24e45f0a148d3f22 = self getentitynumber();
    while (1) {
        if (is_equal(instance.var_2d5b80c94b21ea0e.size, 0) || isdefined(instance.var_2d5b80c94b21ea0e[var_24e45f0a148d3f22]) && istrue(instance.outlast_complete)) {
            stopfxontagforclients(level._effect["outlast_player_screen_aether_motes_vfx"], self, "tag_origin", self);
            killfxontag(level._effect["outlast_player_screen_aether_motes_vfx"], self, "tag_origin");
            namespace_6c72573a48881070::function_9a92ae402e209ecc(instance.str_visionset, 0.5);
            self setscriptablepartstate("ob_outlast", "exit", 0);
            return;
        }
        wait(0.1);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x474a
// Size: 0xad
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

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47fe
// Size: 0x3
function function_a790ffca184f041f() {
    
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4808
// Size: 0x5b
function function_144f707f2483c23d() {
    if (!isdefined(self.var_31f6fb81727fcce3)) {
        var_4fc079a0d192b315 = getstructarray("s_" + tolower(self.var_626b45032e1892da), "targetname");
        return var_4fc079a0d192b315[0].origin;
    }
    return self.var_31f6fb81727fcce3.origin;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486b
// Size: 0x36
function function_f4ff769d513fd99e() {
    var_38c6a2e10b4e4e2b = getstructarray("s_" + tolower(self.var_626b45032e1892da) + "_reward", "targetname");
    return var_38c6a2e10b4e4e2b[0];
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48a9
// Size: 0x45
function function_f1f744ee95023cd() {
    if (isdefined(level.var_c19d6eef1c23c28f) && isdefined(level.var_c19d6eef1c23c28f.visionset_name)) {
        return level.var_c19d6eef1c23c28f.visionset_name;
    } else {
        return "";
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f5
// Size: 0x38
function function_1531bbf5cff97dc0(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4934
// Size: 0x22
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x495d
// Size: 0xfe
function function_540f9b357f3b5419(var_b381b0883bcd4847) {
    if (!self.var_c3d4e3f8e48b7d3e) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_outlast_cancelled");
    }
    foreach (player in var_b381b0883bcd4847.playerlist) {
        player callback::callback("on_abandon_outlast_contract");
    }
    self.var_7039add3ed488111 namespace_ede58c1e66c2c280::calloutmarkerping_removecallout(self.var_40112e1aa5936dd2);
    namespace_c669075cf56436f4::function_765b706dc170e214(self.var_195b0383b653a3f9);
    wait(0.2);
    foreach (player in var_b381b0883bcd4847.playerlist) {
        function_4a508fcbbea05afd(player);
    }
}

// Namespace namespace_72155ae72c1c70a8/namespace_edd624734aa27359
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a62
// Size: 0x74
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

