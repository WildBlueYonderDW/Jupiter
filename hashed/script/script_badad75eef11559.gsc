// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_427ce33ec0c820cf;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using script_7b2517368c79e5bc;
#using script_7d3e27aa82b5d70b;
#using scripts\mp\flags.gsc;
#using script_398835140857d740;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_485622d93fa7e4cf;
#using script_64351208cb856df9;
#using script_36fcbbe3d561c895;
#using script_638d701d263ee1ed;
#using script_6f65366f542f6627;
#using script_4e6e58ab5d96c2b0;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_5080d40cd904ba73;
#using scripts\cp_mp\tripwire.gsc;
#using script_16ddd685a448c6d2;
#using script_42982ffd0134f28e;
#using script_70c2478fc6d8ef;
#using script_7cfaa6fd841fb4dd;
#using script_1f97a44d1761c919;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_4fa7e9e11630166c;
#using scripts\common\vehicle.gsc;
#using scripts\mp\utility\player.gsc;
#using script_3214e6fcdce468a7;
#using script_60e3273df6b5f7d1;
#using script_721ee99d7a8f9168;
#using script_2583ee5680cf4736;
#using scripts\engine\trace.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_860bfdfe82326e3;
#using script_7534b1d3ac3ea47a;
#using script_686729055b66c6e4;
#using script_120270bd0a747a35;
#using script_16ea1b94f0f381b3;
#using script_55221d469e7b320e;
#using script_663ff1906e9fe70;
#using script_2f11ea014b8bb8eb;
#using script_2f5972e002650f;
#using script_60dd6e3992c1f29;
#using script_249b0a9054ceb230;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using script_2d05e472a90adb1d;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_89d580f5dfa3808f;

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0x259
function function_429e921f8ad411ff() {
    if (flag("jup_quest_init")) {
        return;
    }
    mapname = getmapname();
    if (is_equal(mapname, "mp_jup_resort_gw")) {
        level thread namespace_3bde6869e44a2770::disablemusic();
        namespace_1f188a13f7e79610::function_66ab4fb2175555e1("veh_jup_ob_tank_escort");
        setdvar(@"hash_6beec004cdf37c0", 187);
        namespace_134d54e39331ee45::function_af4cc6b8e4e57940();
        flag_set("jup_quest_init");
        callback::add("player_spawned", &on_player_spawned);
        namespace_5a43e3b1b17bfdcc::init();
        level.var_46f13cac76d49010 = "jup_frag_grenade_ob";
        [[ level.var_f1bff73a86c35c52 ]]();
        level.var_cced1297c1210e46 = function_e4c99b0f178ffb98("explosive_barrel", 1, function_53c4c53197386572(level.framedurationseconds, 0.1));
        namespace_e2a930dc2e127364::function_547c48dc070b2109(&function_8751cff989bde6a0);
        level._effect["lightning_strike_origin_weak"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_electricity_attack_thin");
        level._effect["lightning_strike_weak"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_attack_bolt_thin");
        level._effect["lightning_strike_origin"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_electricity_attack");
        level._effect["lightning_strike"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_attack_bolt");
        level._effect["lightning_strike_origin_loop"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_electricity_attack_loop");
        level._effect["lightning_strike_impact"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_electricity_impact");
        level._effect["neutralizer_explosion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_electricity_explo");
        level._effect["lightning_strike_origin"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_act_2_neutralizer_electricity_attack");
        function_b0154b5bd3ac71d5();
        namespace_8ef157d888576350::function_610dfcbf191b189b();
        if (!getdvarint(@"hash_6b556410d8d6245e", 0)) {
            setdvar(@"hash_f1d095735ac37f33", 0);
            setdvar(@"hash_f1f518497502aea8", 1);
            setdvar(@"hash_37edd5a66bd29f3d", 2);
            setdvar(@"hash_2fe0283b419ff08a", 1);
            setdvar(@"hash_464559793bf93309", 0);
            level.var_a9e2544b9283299b = 1;
            level thread function_3564accd04e57c8a();
        }
    } else {
        if (getdvarint(@"hash_8ac9461d39008a26", 0)) {
            level thread function_2e0dc001c9a5c661();
        }
        callback::add("exfil_to_s0_act2", &function_2a6c134406898721);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b6
// Size: 0x38
function on_player_spawned(params) {
    level flag_set("player_ready");
    /#
        if (getdvarint(@"hash_5afec64dac12fb31", 0)) {
            wait(15);
            function_36451a8bfae75b4b();
        }
    #/
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f5
// Size: 0x29
function function_3564accd04e57c8a() {
    level waittill("player_ready");
    namespace_22b8ba12655bf3f2::function_d589c49c4b9b50a0(&namespace_d1df78f2235ca173::function_91d032246bb24684);
    level thread intro_music();
    level thread map_transition();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2125
// Size: 0x1d
function function_b267d2bd2147013() {
    level flag_wait("exfil_to_s0_act_2");
    level flag_set("powerup_disable_nuke");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2149
// Size: 0x29
function intro_music() {
    flag_wait("quest_infil_active");
    flags::gameflagwait("prematch_done");
    wait(1);
    setmusicstate("mx_jup_ob_q_infil");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2179
// Size: 0x272
function function_81e85bcedda2052() {
    level.var_df433561007fc313 = spawnstruct();
    level.var_df433561007fc313.var_705d159427b52c2b = "s0_act2";
    level.var_df433561007fc313.var_d5b8ef36ed91386a = 0;
    level.var_df433561007fc313.var_87da3b5200f9f001 = 0;
    level.var_df433561007fc313.var_718d9cc814712443 = 0;
    level.var_df433561007fc313.var_484d7c807c390122 = 0;
    level.var_df433561007fc313.var_7c11b077004fcf2c = 0;
    level.var_df433561007fc313.var_5001eff44332b8d8 = 0;
    level.var_df433561007fc313.n_zombies = 0;
    level.var_df433561007fc313.var_f6d7c4e398ce13e2 = 0;
    level.var_df433561007fc313.n_players = 0;
    level.var_df433561007fc313.n_heavy = 0;
    level.var_df433561007fc313.var_38ca8557f798f9b = 0;
    level.var_df433561007fc313.var_d9b897b8ff1a2016 = 0;
    level.var_df433561007fc313.var_b07d72fb1249a627 = 0;
    level.var_df433561007fc313.difficulty = "difficulty_normal";
    level.var_df433561007fc313 thread function_d88d2af5d12ad7ac();
    level.var_df433561007fc313 thread function_5734daa7a8ef6bd();
    level.var_df433561007fc313 thread function_d363528f975069cd();
    level.var_df433561007fc313 thread function_ca13228a501ce246();
    level.var_df433561007fc313 thread function_7c5122b771e3b136();
    level.var_df433561007fc313 thread function_9cf8db85d41361b9();
    level.var_df433561007fc313 function_8e97ef62875df62();
    level.var_df433561007fc313 function_8cfae918b996bdd();
    level.var_df433561007fc313 thread oob_triggers();
    level thread namespace_134d54e39331ee45::function_7a5ab9d5c8dbfe6a();
    level.var_df433561007fc313 thread function_20936bc2cdd94c37();
    level.var_df433561007fc313 thread function_20936cc2cdd94e6a();
    level.var_df433561007fc313 thread function_20936dc2cdd9509d();
    level.var_df433561007fc313 thread function_209366c2cdd94138();
    level.var_df433561007fc313 escort_init();
    level.var_df433561007fc313 thread function_6bb7f830e7bd0851();
    level.var_df433561007fc313 thread function_5456c2f668331413();
    level function_24f7bf25b01b1d1f();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f2
// Size: 0x7e
function function_8e97ef62875df62() {
    self.var_cd927c3a6d220500 = [0:"jup_ob_enemy_basic_grunt_long", 1:"jup_ob_enemy_basic_grunt_short", 2:"jup_ob_enemy_basic_soldier_short", 3:"jup_ob_enemy_basic_soldier_long"];
    self.var_bf4b0f953edcff84 = [0:"jup_ob_enemy_specialist_heavytactician", 1:"jup_ob_enemy_basic_soldier_long", 2:"jup_ob_enemy_basic_soldier_short", 3:"jup_ob_enemy_basic_specialforce_long"];
    self.var_5f9a84079974ac46 = [];
    self.var_5f9a84079974ac46["sniper"] = "jup_ob_enemy_specialist_sniper";
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2477
// Size: 0x1e1
function function_8cfae918b996bdd() {
    self.var_2afbe67f5431e683 = [];
    var_6005bdbd0f0bf49b = spawnstruct();
    var_6005bdbd0f0bf49b.subclass = "zombie_base";
    var_6005bdbd0f0bf49b.chance = 100;
    var_6005bdbd0f0bf49b.var_3d028e278e3c71d8 = 1000;
    var_999ee79b7b959d5c = spawnstruct();
    var_999ee79b7b959d5c.subclass = "zombie_base_armored_heavy";
    var_999ee79b7b959d5c.chance = 40;
    var_999ee79b7b959d5c.var_3d028e278e3c71d8 = 8;
    var_7cfd7ef1c45f43e4 = spawnstruct();
    var_7cfd7ef1c45f43e4.subclass = "zombie_hellhound";
    var_7cfd7ef1c45f43e4.chance = 30;
    var_7cfd7ef1c45f43e4.var_3d028e278e3c71d8 = 4;
    var_cb8500fece5d36f = spawnstruct();
    var_cb8500fece5d36f.subclass = "zombie_mangler";
    var_cb8500fece5d36f.chance = 15;
    var_cb8500fece5d36f.var_3d028e278e3c71d8 = 1;
    var_d831ba4ba9425466 = spawnstruct();
    var_d831ba4ba9425466.subclass = "zombie_disciple";
    var_d831ba4ba9425466.chance = 15;
    var_d831ba4ba9425466.var_3d028e278e3c71d8 = 1;
    var_bde179c449fa91f6 = spawnstruct();
    var_bde179c449fa91f6.subclass = "zombie_abom_mega_hvt";
    var_bde179c449fa91f6.chance = 0;
    var_bde179c449fa91f6.var_3d028e278e3c71d8 = 1;
    self.var_2afbe67f5431e683["base_zombie"] = var_6005bdbd0f0bf49b;
    self.var_2afbe67f5431e683["armored_zombie"] = var_999ee79b7b959d5c;
    self.var_2afbe67f5431e683["hellhound"] = var_7cfd7ef1c45f43e4;
    self.var_2afbe67f5431e683["mangler"] = var_cb8500fece5d36f;
    self.var_2afbe67f5431e683["disciple"] = var_d831ba4ba9425466;
    self.var_2afbe67f5431e683["abomination"] = var_bde179c449fa91f6;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265f
// Size: 0xb1
function function_20936bc2cdd94c37() {
    level endon("game_ended");
    self.var_cf3feeaa65a4e3f0 = [];
    var_888edc824a65c0e4 = getstructarray("samsite_spawn", "targetname");
    foreach (samsite_spawn in var_888edc824a65c0e4) {
        samsite = namespace_c5d39841678f2fb1::function_94a776d7d4f1eb0b(samsite_spawn);
        thread function_d19da8a793b7ed6(samsite);
        thread function_19c133a652a8cc3d(samsite);
        self.var_cf3feeaa65a4e3f0 = array_add(self.var_cf3feeaa65a4e3f0, samsite);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2717
// Size: 0xa
function function_20936cc2cdd94e6a() {
    level endon("game_ended");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2728
// Size: 0x23
function function_20936dc2cdd9509d() {
    level endon("game_ended");
    self.escort_path_events = getstructarray("escort_path_events", "target");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2752
// Size: 0xa
function function_209366c2cdd94138() {
    level endon("game_ended");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2763
// Size: 0x71
function function_970f611dc2e032db(var_3d5033905ec1ebff) {
    foreach (event in self.escort_path_events) {
        if (is_equal(var_3d5033905ec1ebff, event.targetname)) {
            return event;
        }
    }
    return undefined;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27dc
// Size: 0xa8
function function_a9241d4812148865(s_event) {
    if (!isdefined(s_event)) {
        return;
    }
    if (!isdefined(s_event.script_noteworthy)) {
        return;
    }
    switch (s_event.script_noteworthy) {
    case #"hash_ffc06812dd13691d":
        var_c4195a12cd88f216 = getstructarray(s_event.targetname, "target");
        thread function_e4fed48871c2e7df(var_c4195a12cd88f216, s_event, 1, 0.2, self.var_1ff927c3faaf9638);
        thread namespace_64135de19550f047::function_4a9c0f41ba33e74d(s_event.origin, "multi_airstrike", 2, 0, s_event.angles[1]);
        break;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288b
// Size: 0x14e
function function_6bb7f830e7bd0851() {
    level endon("game_ended");
    level flag_set("powerup_disable_nuke");
    var_2185d088534858ce = getdvarint(@"hash_64e503da6384ad7b", 0);
    switch (var_2185d088534858ce) {
    case 2:
        level.var_df433561007fc313 function_eb7e2348a1f2409f();
        level.var_df433561007fc313 function_eb7e2248a1f23e6c();
        level.var_df433561007fc313 function_eb7e2148a1f23c39();
    case 3:
        level.var_df433561007fc313 function_eb7e2248a1f23e6c();
        level.var_df433561007fc313 function_eb7e2148a1f23c39();
    case 4:
        level.var_df433561007fc313 function_eb7e2148a1f23c39();
    case 5:
        wait(4);
        level.var_df433561007fc313 thread function_b61e551ad0e7bad9();
    case 6:
        level.var_df433561007fc313 function_eb7e2148a1f23c39();
    default:
        break;
    }
    level.var_df433561007fc313 function_eb7e2448a1f242d2();
    level.var_df433561007fc313 function_eb7e2348a1f2409f();
    level.var_df433561007fc313 function_eb7e2248a1f23e6c();
    level.var_df433561007fc313 function_eb7e2148a1f23c39();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e0
// Size: 0xbf
function function_eb7e2448a1f242d2() {
    level endon("game_ended");
    self.var_358ab8df65cbb5b4 = 0;
    self.var_118630ce901b2217 = 2;
    self.var_c0d9c77ae12d6f6a = 1;
    thread function_fdbef9ca19c6fb7a();
    if (!getdvarint(@"hash_70249f5c9fc86370", 0)) {
        self waittill("infil_done");
    }
    flag_set("infil_done");
    function_c6352d8194937a50();
    flag_wait("infil_chopper_destroyed");
    thread function_db518d8f0ec31ae0();
    thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_samsite_start", level.players, 4, 1);
    level waittill("story_quest_complete_step_1");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("destroyed_sam_shepherd");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa6
// Size: 0x69
function function_eb7e2348a1f2409f() {
    level endon("game_ended");
    setmusicstate("mx_jup_ob_q_tension");
    self.var_c0d9c77ae12d6f6a = 2;
    function_ba3e33915c059679();
    thread function_d15b54af563202f();
    thread function_17373c6ea57393fd();
    level waittill("story_quest_complete_step_2");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("secured_airdrop_shepherd");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b16
// Size: 0x96
function function_eb7e2248a1f23e6c() {
    level endon("game_ended");
    self.var_c0d9c77ae12d6f6a = 3;
    if (is_equal(getdvarint(@"hash_64e503da6384ad7b"), 3)) {
        self.var_1ff927c3faaf9638 = function_eb84ce326bfd8c06(self);
        function_da11a8810b7c3bc8();
        function_97e82918ce08c384();
        wait(15);
    }
    thread function_83b117c976f47007();
    thread function_7124f960c512f09a("activate");
    level waittill("story_quest_complete_step_3");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("escorted_vehicle_shepherd");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb3
// Size: 0x1a1
function function_eb7e2148a1f23c39() {
    level endon("game_ended");
    self.var_c0d9c77ae12d6f6a = 4;
    if (is_equal(getdvarint(@"hash_64e503da6384ad7b"), 4) || is_equal(getdvarint(@"hash_64e503da6384ad7b"), 6)) {
        var_1d9efeb8c1d779bf = getstruct("final_destination", "script_noteworthy");
        self.var_1ff927c3faaf9638 = function_eb84ce326bfd8c06(self, var_1d9efeb8c1d779bf);
        function_2674a21020618651(0);
        function_da11a8810b7c3bc8();
        wait(15);
        self.var_1ff927c3faaf9638 function_eebf049c985aa4af(self);
        function_97e82918ce08c384();
        self.var_1ff927c3faaf9638 notify("reached_end_node");
    }
    self.var_1ff927c3faaf9638.var_58bc745bb9d47fb = 1;
    self.var_1ff927c3faaf9638 function_a52670a99736f59d();
    if (isdefined(self.var_1ff927c3faaf9638.navobstacleid)) {
        destroynavobstacle(self.var_1ff927c3faaf9638.navobstacleid);
        self.var_1ff927c3faaf9638.navobstacleid = undefined;
    }
    self.var_1ff927c3faaf9638.navobstacleid = createnavobstaclebyent(self.var_1ff927c3faaf9638);
    if (is_equal(getdvarint(@"hash_64e503da6384ad7b"), 6)) {
        thread function_2e69383c6abc963b("abomination_encounter_location");
    }
    thread function_459b11a053734e1();
    thread function_d22ac1e7c80dc46b();
    level waittill("story_quest_complete_step_4");
    if (isalive(level.players[0])) {
        level.players[0] callback::callback("defended_escort_shepherd");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d5b
// Size: 0xec
function function_db518d8f0ec31ae0(var_50e779230014a475) {
    namespace_d696adde758cbe79::showdmzsplash("quest_s0_act2_start", level.players);
    foreach (samsite in self.var_cf3feeaa65a4e3f0) {
        samsite thread namespace_c5d39841678f2fb1::function_f72a6146b33f7d1("jup_ui_map_icon_generic_marker", self);
    }
    namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_DESTROY_SAMSITES", level.players);
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_param", 0);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e4e
// Size: 0x6b
function function_d15b54af563202f(var_50e779230014a475) {
    var_50e779230014a475 = function_53c4c53197386572(var_50e779230014a475, "");
    switch (var_50e779230014a475) {
    case #"hash_e9d9fcb8daba8602":
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_SECURE_AIRDROP_CLEAR", level.players);
        break;
    default:
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_SECURE_AIRDROP", level.players);
        break;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec0
// Size: 0x103
function function_7124f960c512f09a(var_50e779230014a475) {
    var_50e779230014a475 = function_53c4c53197386572(var_50e779230014a475, "");
    switch (var_50e779230014a475) {
    case #"hash_b389e7ddef378fd0":
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_ESCORT_ACTIVATE", level.players);
        break;
    case #"hash_e9d9fcb8daba8602":
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_ESCORT_COMPLETE_CLEAR", level.players);
        if (isdefined(self.var_1ff927c3faaf9638)) {
            function_32df7454369064fb(self.var_1ff927c3faaf9638.health, self.var_1ff927c3faaf9638.var_c552b5bccbe7cb58);
        }
        break;
    default:
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_ESCORT", level.players);
        if (isdefined(self.var_1ff927c3faaf9638)) {
            function_32df7454369064fb(self.var_1ff927c3faaf9638.health, self.var_1ff927c3faaf9638.var_c552b5bccbe7cb58);
        }
        break;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fca
// Size: 0x13d
function function_459b11a053734e1(var_50e779230014a475) {
    var_50e779230014a475 = function_53c4c53197386572(var_50e779230014a475, "");
    switch (var_50e779230014a475) {
    case #"hash_c6514c88e37149bf":
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_DEFEND_START", level.players);
        if (isdefined(self.var_1ff927c3faaf9638)) {
            function_32df7454369064fb(self.var_1ff927c3faaf9638.health, self.var_1ff927c3faaf9638.var_c552b5bccbe7cb58);
        }
        break;
    case #"hash_2b03afb9f1da2591":
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_DEFEND_DETONATE", level.players);
        if (isdefined(self.var_1ff927c3faaf9638)) {
            function_32df7454369064fb(self.var_1ff927c3faaf9638.health, self.var_1ff927c3faaf9638.var_c552b5bccbe7cb58);
        }
        break;
    default:
        namespace_262d6474998a2356::function_641bc1548cff8210("QUEST_0_ACT2_DEFEND", level.players);
        if (isdefined(self.var_1ff927c3faaf9638)) {
            function_32df7454369064fb(self.var_1ff927c3faaf9638.health, self.var_1ff927c3faaf9638.var_c552b5bccbe7cb58);
        }
        break;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310e
// Size: 0xc0
function function_fdbef9ca19c6fb7a() {
    self.var_5aea8a52620494e9 = getstruct("fortified_building_entrance", "targetname");
    self.var_ab1459cb9bbc5539 = getstruct("fortified_building_atrium", "targetname");
    self.var_d2e6cd0ac5baeb45 = getstruct("fortified_building_roof", "targetname");
    self.var_5aea8a52620494e9.var_df433561007fc313 = self;
    self.var_ab1459cb9bbc5539.var_df433561007fc313 = self;
    self.var_d2e6cd0ac5baeb45.var_df433561007fc313 = self;
    self.var_5aea8a52620494e9 thread function_186d567068121c23();
    self.var_ab1459cb9bbc5539 thread function_c41fab32a7097793();
    thread function_34c6dea0b5aadb9e(self.var_ab1459cb9bbc5539);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d5
// Size: 0x15
function function_186d567068121c23() {
    self.var_df433561007fc313 thread function_d1ce7548ed380171(self);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f1
// Size: 0x15
function function_c41fab32a7097793() {
    self.var_df433561007fc313 thread function_d1ce7548ed380171(self);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x320d
// Size: 0x85
function function_7c5b27a81030641f() {
    self.var_df433561007fc313 function_d1ce7548ed380171(self);
    var_5c2a54b6e701a80b = function_f159c10d5cf8f0b4("roof_noent_trigger", "targetname");
    foreach (var_9c301ce50ade5aba in var_5c2a54b6e701a80b) {
        self.var_df433561007fc313 thread function_d34b0d81252aad22(var_9c301ce50ade5aba);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3299
// Size: 0x201
function function_d34b0d81252aad22(var_9c301ce50ade5aba) {
    self endon("quest_s0_act2_ended");
    self endon("player_entered_roof");
    level endon("story_quest_complete_step_1");
    var_44394807b271a5ae = 0;
    while (1) {
        ent = var_9c301ce50ade5aba waittill("trigger");
        is_vehicle = ent namespace_dbbb37eb352edf96::isvehicle();
        if (!isplayer(ent) && !is_vehicle) {
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
        if (isplayer(ent)) {
            if (!istrue(self.var_8dd943c14cdc87b3) && isarray(self.var_d2e6cd0ac5baeb45.var_93c2168553d13b2d)) {
                foreach (merc in self.var_d2e6cd0ac5baeb45.var_93c2168553d13b2d) {
                    merc val::set("roof_mercs", "ignoreall", 0);
                }
                self.var_8dd943c14cdc87b3 = 1;
            }
            a_players = array_add(a_players, ent);
            level.var_df433561007fc313 thread function_235944ad0915efdb(ent, 1, 1);
        }
        if (a_players.size > 0 && !var_44394807b271a5ae) {
            var_2b4364d8d93a45b9 = getstructarray("samsite_location_merc_chopper", "targetname");
            thread function_804aa1cbd49ba400(var_2b4364d8d93a45b9);
            var_44394807b271a5ae = 1;
        }
        wait(0.1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a1
// Size: 0x80
function function_34c6dea0b5aadb9e(var_d1b16c8e8b471b9e) {
    self endon("quest_s0_act2_ended");
    var_e61682f8340368c4 = 2750;
    while (1) {
        wait(1);
        players = namespace_7e17181d03156026::getplayersinradius(var_d1b16c8e8b471b9e.origin, var_e61682f8340368c4);
        if (players.size > 0) {
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t6_fortified_building_approach", level.players);
            self.var_d2e6cd0ac5baeb45 thread function_7c5b27a81030641f();
            thread function_49b9346c557df701();
            return;
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3528
// Size: 0x8f
function function_9c405ffa3bb2dcf0(spawn_struct, var_5f2112921f67c9ce) {
    self endon("quest_s0_act2_ended");
    self.var_70507c40273c3d2c = namespace_f6b8dbdf5c7eed7::function_e4c99b0f178ffb98("sentry_health_bar_update", 2);
    if (!isdefined(level.sentrysettings["ai_sentry_turret"])) {
        namespace_4338aec4322f6fdd::init();
    }
    sentry = namespace_64135de19550f047::function_586d4d82f07e0d09(spawn_struct);
    self.var_f32357b4f622db32 = function_53c4c53197386572(self.var_f32357b4f622db32, []);
    self.var_f32357b4f622db32 = array_add(self.var_f32357b4f622db32, sentry);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35be
// Size: 0x23
function function_19c133a652a8cc3d(samsite) {
    self endon("quest_s0_act2_ended");
    samsite waittill("samsite_bomb_detonated");
    thread function_47c574f1b82564e1();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e8
// Size: 0x2c
function function_d19da8a793b7ed6(samsite) {
    self endon("quest_s0_act2_ended");
    samsite waittill("samsite_bomb_planted");
    thread function_d63316812c3bc04b(self.var_d2e6cd0ac5baeb45);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361b
// Size: 0xae
function function_47c574f1b82564e1() {
    self.var_358ab8df65cbb5b4++;
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_param", self.var_358ab8df65cbb5b4);
    }
    if (self.var_358ab8df65cbb5b4 >= self.var_118630ce901b2217) {
        namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_samsite_destroyed", level.players, 5, 1);
        thread function_9aa696b9bad4fdc9();
        level notify("story_quest_complete_step_1");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d0
// Size: 0x169
function function_49b9346c557df701() {
    if (isarray(self.var_79c8996a40bba4ae)) {
        foreach (var_319e377c726cd817 in self.var_79c8996a40bba4ae) {
            function_a28e8535e00d34f3(var_319e377c726cd817);
            function_17db39bd195cc5b1(var_319e377c726cd817);
        }
    }
    self.var_942160dfc85d052 = [];
    var_9c870dc9569e2805 = getstructarray("ascender_marker", "targetname");
    foreach (var_1f5b07c79d3bed3a in var_9c870dc9569e2805) {
        var_be93d3e51d75015 = namespace_6c8a837ec98fe0b8::requestobjectiveid(0);
        waitframe();
        namespace_6c8a837ec98fe0b8::objective_set_play_intro(var_be93d3e51d75015, 1);
        namespace_6c8a837ec98fe0b8::objective_set_play_outro(var_be93d3e51d75015, 0);
        namespace_6c8a837ec98fe0b8::objective_add_objective(var_be93d3e51d75015, "current");
        namespace_6c8a837ec98fe0b8::update_objective_position(var_be93d3e51d75015, var_1f5b07c79d3bed3a.origin + (0, 0, 64));
        namespace_6c8a837ec98fe0b8::update_objective_icon(var_be93d3e51d75015, "jup_ui_map_icon_generic_marker");
        namespace_6c8a837ec98fe0b8::objective_playermask_showtoall(var_be93d3e51d75015);
        namespace_6c8a837ec98fe0b8::update_objective_setbackground(var_be93d3e51d75015, 1);
        self.var_942160dfc85d052 = array_add(self.var_942160dfc85d052, var_be93d3e51d75015);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3840
// Size: 0x196
function function_ba3e33915c059679() {
    var_9e02ce5e092fcab6 = getstruct("quest_escort_start_struct", "targetname");
    wait(5.5);
    function_be15cfdf04549227(var_9e02ce5e092fcab6.origin + (0, 0, 2500));
    thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_airdrop_flare", level.players, 1.5, 1);
    self.var_f4aca19752f2420e = spawnscriptable("ob_quest_act2_airdrop_location", var_9e02ce5e092fcab6.origin, var_9e02ce5e092fcab6.angles);
    self.var_f4aca19752f2420e setscriptablepartstate("smoke", "smoking");
    function_bbe1277f672a7aff();
    s_location = getstruct("airdrop_location", "targetname");
    var_36bfaa6d1617a83b = getstructarray("ai_goal", "targetname");
    var_f83db8d7f8c4654c = [];
    foreach (s_goal in var_36bfaa6d1617a83b) {
        if (is_equal(s_goal.target, s_location.targetname)) {
            var_f83db8d7f8c4654c = array_add(var_f83db8d7f8c4654c, s_goal);
        }
    }
    var_2b4364d8d93a45b9 = getstructarray("airdrop_location_merc_chopper", "targetname");
    thread function_804aa1cbd49ba400(var_2b4364d8d93a45b9);
    thread function_d1ce7548ed380171(s_location, var_f83db8d7f8c4654c);
    thread function_1b4d007c48f6440d(s_location, var_f83db8d7f8c4654c, 1);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39dd
// Size: 0xa1
function function_be15cfdf04549227(spawn_origin) {
    flare = spawn("script_model", spawn_origin);
    start_pos = flare.origin;
    flare.angles = vectortoangles((0, 0, 1));
    flare setmodel("equip_flare_br");
    flare setscriptablepartstate("launch", "start", 0);
    var_3fc3daade1c87824 = "start_" + "revive";
    flare setscriptablepartstate("travel", var_3fc3daade1c87824, 0);
    flare thread _utilflare_lerpflare();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a85
// Size: 0x46
function _utilflare_lerpflare() {
    self endon("death");
    level endon("game_ended");
    movetime = 1;
    self moveto(self.origin + (0, 0, 250), movetime);
    wait(movetime);
    _utilflare_flareexplode();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad2
// Size: 0x41
function _utilflare_flareexplode() {
    self setscriptablepartstate("travel", "off", 0);
    var_44a98e57feb74898 = "start_" + "revive";
    self setscriptablepartstate("explode", var_44a98e57feb74898, 0);
    thread function_e193d48772619047();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1a
// Size: 0x72
function function_e193d48772619047() {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("phosphorus", "start", 0);
    wait(0.3);
    self setscriptablepartstate("phosphorus_loop", "start", 0);
    wait(25);
    self setscriptablepartstate("phosphorus", "end", 0);
    wait(0.3);
    self setscriptablepartstate("phosphorus_loop", "off", 0);
    wait(5);
    self delete();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b93
// Size: 0xb9
function function_bbe1277f672a7aff() {
    self.var_355ab3e4e47094d5 = namespace_6c8a837ec98fe0b8::requestobjectiveid(0);
    var_63f6cfa75b069ffb = getstruct("airdrop_location", "targetname");
    waitframe();
    namespace_6c8a837ec98fe0b8::objective_set_play_intro(self.var_355ab3e4e47094d5, 1);
    namespace_6c8a837ec98fe0b8::objective_set_play_outro(self.var_355ab3e4e47094d5, 0);
    namespace_6c8a837ec98fe0b8::objective_add_objective(self.var_355ab3e4e47094d5, "current");
    namespace_6c8a837ec98fe0b8::update_objective_position(self.var_355ab3e4e47094d5, var_63f6cfa75b069ffb.origin);
    namespace_6c8a837ec98fe0b8::update_objective_icon(self.var_355ab3e4e47094d5, "jup_ui_map_icon_generic_marker");
    namespace_6c8a837ec98fe0b8::objective_playermask_showtoall(self.var_355ab3e4e47094d5);
    namespace_6c8a837ec98fe0b8::update_objective_setbackground(self.var_355ab3e4e47094d5, 1);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c53
// Size: 0x13
function function_1a3d5a6bc4965338() {
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_355ab3e4e47094d5);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6d
// Size: 0x69
function function_17373c6ea57393fd() {
    wait(25);
    self.var_f4aca19752f2420e setscriptablepartstate("smoke", "dissipate");
    self.var_1ff927c3faaf9638 = function_eb84ce326bfd8c06(self);
    self.var_1ff927c3faaf9638 setcandamage(0);
    wait(5);
    self.var_f4aca19752f2420e freescriptable();
    self.var_f4aca19752f2420e notify("death");
    thread function_d62e17e7af01d68b();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cdd
// Size: 0xa1
function function_d62e17e7af01d68b() {
    self endon("quest_s0_act2_ended");
    thread function_d15b54af563202f("clear");
    start_time = gettime();
    while (1) {
        a_ai = getaiarrayinradius(self.var_1ff927c3faaf9638.origin, 2250);
        if (a_ai.size < 6 || gettime() - start_time > 120000) {
            function_1a3d5a6bc4965338();
            function_97e82918ce08c384();
            level notify("story_quest_complete_step_2");
            thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_activate_vehicle", level.players, 0, 1);
            return;
        }
        wait(3);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d85
// Size: 0x283
function function_83b117c976f47007() {
    self endon("quest_s0_act2_ended");
    self.var_7a90b0904259aa6b = self.var_d46c4a839418dd7d.var_7a90b0904259aa6b;
    self.var_ace3d2f99e264fe5 = self.var_d46c4a839418dd7d.var_ace3d2f99e264fe5;
    self.var_70166afdd6c1c84 = self.var_d46c4a839418dd7d.var_70166afdd6c1c84;
    function_2674a21020618651();
    self.var_1ff927c3faaf9638.var_364b797a8b03169b waittill("escort_started");
    var_5f9cca3a9ffe0b69 = distance(self.var_1ff927c3faaf9638.origin, self.var_1ff927c3faaf9638.spawndata.origin);
    if (var_5f9cca3a9ffe0b69 > 2.5) {
        self.var_1ff927c3faaf9638 vehicle_teleport(self.var_1ff927c3faaf9638.spawndata.origin, self.var_1ff927c3faaf9638.spawndata.angles);
        wait(0.1);
    }
    setmusicstate("mx_jup_ob_q2_escort");
    function_84610473025b148();
    thread function_7124f960c512f09a("escort");
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e unlink();
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e linkto(self.var_1ff927c3faaf9638, "tag_attach_rocket", (0, 0, 65), (0, 0, 0));
    self.var_1ff927c3faaf9638.var_364b797a8b03169b delete();
    wait_time = function_c619613f382927df("dx_ob_oesc_esca_acve_escbootup") + 1;
    self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escbootup");
    self.var_1ff927c3faaf9638 setscriptablepartstate("engine", "start");
    self.var_1ff927c3faaf9638 setscriptablepartstate("panel", "activate");
    wait(wait_time);
    self.var_1ff927c3faaf9638 setscriptablepartstate("beacon_light", "active");
    self.var_1ff927c3faaf9638 setscriptablepartstate("headlight_left", "active");
    self.var_1ff927c3faaf9638 setscriptablepartstate("headlight_right", "active");
    self.var_1ff927c3faaf9638 setscriptablepartstate("side_lights", "on");
    function_da11a8810b7c3bc8();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400f
// Size: 0x20f
function function_eb84ce326bfd8c06(var_30c47c676d823fea, var_1d9efeb8c1d779bf) {
    wait(1);
    spawndata = spawnstruct();
    spawn_struct = getstruct("quest_escort_start_struct", "targetname");
    spawn_origin = (0, 0, 0);
    spawn_angles = (0, 0, 0);
    if (is_equal(self.var_c8f10bf3a46b6429, "spline")) {
        spawn_angles = self.var_d9a91303aea799de.angles;
        spawn_origin = self.var_d9a91303aea799de.origin;
    } else {
        spawn_angles = spawn_struct.angles;
        spawn_origin = spawn_struct.origin;
    }
    if (isdefined(var_1d9efeb8c1d779bf)) {
        spawn_origin = var_1d9efeb8c1d779bf.origin;
    }
    spawndata.angles = spawn_angles;
    spawndata.team = level.players[0].team;
    spawndata.var_f16652e1462a3739 = 0;
    spawndata.origin = spawn_origin;
    spawndata.nohitmarkers = 1;
    spawndata.var_22aa4aa0cf0aa6bb = 1;
    spawndata.var_5bc025767c07fb9 = "neutralizer";
    spawndata.var_e234a9f24c79fead = self;
    /#
        println("difficulty_normal" + spawndata.origin + "story_quest_complete_step_1" + spawndata.angles);
    #/
    var_1ff927c3faaf9638 = namespace_801fa17f47560d76::function_66c684fea143fbfd("veh_jup_ob_tank_escort", spawndata);
    var_1ff927c3faaf9638.spawndata = spawndata;
    var_1ff927c3faaf9638.script_noteworthy = self.script_noteworthy;
    var_1ff927c3faaf9638 function_65aa053c077c003a(1);
    var_1ff927c3faaf9638 vehicleshowonminimap(0);
    var_1ff927c3faaf9638 function_1cd1ee312fd03bb4(1);
    var_1ff927c3faaf9638.var_df433561007fc313 = var_30c47c676d823fea;
    var_1ff927c3faaf9638 function_6faa66a04c0dda2d(var_30c47c676d823fea);
    self notify("vehicle_spawned");
    var_30c47c676d823fea thread function_894089537e64ba63(var_1ff927c3faaf9638);
    return var_1ff927c3faaf9638;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4226
// Size: 0x61
function function_894089537e64ba63(var_1ff927c3faaf9638) {
    var_1ff927c3faaf9638 waittill("freefall");
    wait(0.75);
    var_1ff927c3faaf9638 vehicle_teleport(var_1ff927c3faaf9638.spawndata.origin, var_1ff927c3faaf9638.spawndata.angles);
    thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t6_secure_vehicle_soap", level.players);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x428e
// Size: 0x1fd
function escort_init() {
    self.var_1be7d142b0b72909 = getstruct("quest_s0_act2_escort", "targetname");
    self.script_noteworthy = self.var_1be7d142b0b72909.script_noteworthy;
    self.var_d9a91303aea799de = function_a833053c48e37c08();
    self.var_c8f10bf3a46b6429 = "p2p";
    self.var_5e87f48a491952ca = getstruct("quest_escort_p2p_start", "targetname");
    if (isdefined(self.var_d9a91303aea799de) && !istrue(getdvarint(@"hash_b41b7481ff7c12f", 0))) {
        self.var_c8f10bf3a46b6429 = "spline";
    } else {
        self.var_c8f10bf3a46b6429 = "p2p";
        self.var_5e87f48a491952ca = getstruct("quest_escort_p2p_start", "targetname");
    }
    self.var_71ad773e63984917 = "difficulty_normal";
    var_82d086ceee92acc3 = getstructarray("escort_vehicle_spawn", "targetname");
    self.var_bd16f0d97883fd8d = var_82d086ceee92acc3[0];
    self.var_e44867ea28eabb63 = 0;
    self.var_4ffe32f42d51a763 = 0;
    self.var_d46c4a839418dd7d = spawnstruct();
    self.var_d46c4a839418dd7d.var_7a90b0904259aa6b = 0;
    self.var_d46c4a839418dd7d.var_ace3d2f99e264fe5 = 0;
    self.var_d46c4a839418dd7d.var_70166afdd6c1c84 = "hud_icon_jup_ob_obj_escort_vehicle";
    self.var_d46c4a839418dd7d.var_c200b42fc349b0cb = 3500;
    self.var_d46c4a839418dd7d.var_de0c6b19da7810df = 6;
    self.var_d46c4a839418dd7d.var_9efb3de7b9d1acdc = 0;
    self.var_d46c4a839418dd7d.var_bfc1f64b3dc5794f = 5;
    self.var_d46c4a839418dd7d.var_247535d1723e67f6 = 3;
    self.var_d46c4a839418dd7d.var_aab5a7e2da4b4756 = 500;
    self.var_d46c4a839418dd7d.var_31c07988f05debcf = 2500;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4492
// Size: 0x25
function function_a833053c48e37c08() {
    self endon("quest_s0_act2_ended");
    var_a4e760bd72a35a21 = getvehiclenode("quest_escort_spline_start", "targetname");
    return var_a4e760bd72a35a21;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44bf
// Size: 0x3a3
function function_2674a21020618651(var_5b51d963a5979f24) {
    if (!isdefined(var_5b51d963a5979f24)) {
        var_5b51d963a5979f24 = 1;
    }
    self endon("quest_s0_act2_ended");
    self.var_1ff927c3faaf9638 vehicle_turnengineoff();
    self.var_1ff927c3faaf9638 setcandamage(0);
    self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 = spawn("script_model", self.var_1ff927c3faaf9638.origin);
    self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 linkto(self.var_1ff927c3faaf9638, "tag_origin", (0, 0, 78), (0, 0, 0));
    if (!is_equal(getdvarint(@"hash_64e503da6384ad7b"), 4) && !is_equal(getdvarint(@"hash_64e503da6384ad7b"), 6)) {
        self.var_1ff927c3faaf9638.var_364b797a8b03169b = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_1ff927c3faaf9638.origin, 48, &function_8ea9cc3a882e6814, "JUP_OB_OBJECTIVES/QUEST_0_ACT2_ESCORT_START_INTERACT");
        self.var_1ff927c3faaf9638 setscriptablepartstate("panel", "open");
        self.var_1ff927c3faaf9638.var_364b797a8b03169b linkto(self.var_1ff927c3faaf9638, "tag_control_panel_door_lower_animate", (0, -7.5, 0), (0, 90, 0));
        if (is_equal(self.var_c8f10bf3a46b6429, "spline")) {
            self.var_1ff927c3faaf9638.nd_start = getvehiclenode("quest_escort_spline_start", "targetname");
        }
    }
    wait(1);
    if (istrue(getdvarint(@"hash_21824b71fa4a97bd", 0))) {
        var_c3fbb6661b91750f = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 0, 0, 0, 0, 1);
        var_a224f9bb6bb733ed = namespace_2a184fc4902783dc::ray_trace(self.var_1ff927c3faaf9638.origin + (0, 0, 100), self.var_1ff927c3faaf9638.spawndata.origin - (0, 0, 100), self.var_1ff927c3faaf9638, var_c3fbb6661b91750f);
        ground_pos = var_a224f9bb6bb733ed["position"];
        var_c0f31c146707e3dd = distancesquared(self.var_1ff927c3faaf9638.origin, ground_pos);
        logprint("Act 2 Quest Escort: Escort Vehicle Desired Spawn Origin: " + self.var_1ff927c3faaf9638.spawndata.origin);
        logprint("Act 2 Quest Escort: Escort Vehicle Current Origin: " + self.var_1ff927c3faaf9638.origin);
        logprint("Act 2 Quest Escort: Escort Vehicle Ground Raycast: " + ground_pos);
        logprint("Act 2 Quest Escort: Escort Vehicle Ground Origin Difference Squared: " + var_c0f31c146707e3dd);
        if (self.var_1ff927c3faaf9638.origin[2] < self.var_1ff927c3faaf9638.spawndata.origin[2]) {
            self.var_1ff927c3faaf9638 vehicle_teleport(self.var_1ff927c3faaf9638.spawndata.origin, self.var_1ff927c3faaf9638.spawndata.angles);
        }
    }
    if (is_equal(self.var_c8f10bf3a46b6429, "spline") && istrue(var_5b51d963a5979f24)) {
        self.var_1ff927c3faaf9638 namespace_dbbb37eb352edf96::attach_vehicle(self.var_1ff927c3faaf9638.nd_start);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4869
// Size: 0x11e
function function_da11a8810b7c3bc8() {
    self endon("quest_s0_act2_ended");
    self.var_1ff927c3faaf9638.var_aa4804cc1bc59e93 = 1;
    self.var_1ff927c3faaf9638.var_1cb92917037d8996 = 0;
    self.var_1ff927c3faaf9638.var_5cd270934176a923 = 0;
    self.var_1ff927c3faaf9638 function_eebf049c985aa4af(self);
    if (is_equal(self.var_c8f10bf3a46b6429, "p2p")) {
        self.var_1ff927c3faaf9638 thread function_df4c9a21b5873371();
    } else if (isdefined(self.var_1ff927c3faaf9638.nd_start)) {
        self.var_1ff927c3faaf9638 thread namespace_dbbb37eb352edf96::vehicle_paths(self.var_1ff927c3faaf9638.nd_start);
        namespace_3bb9da687f15383d::gopath(self.var_1ff927c3faaf9638);
        thread function_bb0d7d2ab7bb1c6b();
    }
    self.var_1ff927c3faaf9638 thread function_b3aa7145e80e6f9e(self);
    self.var_1ff927c3faaf9638 thread function_9c9e518280bea222(self);
    self.var_1ff927c3faaf9638 thread function_1db9d507d5dd43da();
    thread function_8543cb813eebd318();
    thread function_a46548c342e333f7();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x498e
// Size: 0x182
function function_6faa66a04c0dda2d(var_2f5d509d7b71ce9a) {
    self.team = level.players[0].team;
    self.health = var_2f5d509d7b71ce9a.var_d46c4a839418dd7d.var_c200b42fc349b0cb * 2;
    self.var_6201fb806ad1b5d7 = var_2f5d509d7b71ce9a.var_d46c4a839418dd7d.var_de0c6b19da7810df;
    self.var_9efb3de7b9d1acdc = var_2f5d509d7b71ce9a.var_d46c4a839418dd7d.var_9efb3de7b9d1acdc;
    self.accel = var_2f5d509d7b71ce9a.var_d46c4a839418dd7d.var_bfc1f64b3dc5794f;
    self.decel = var_2f5d509d7b71ce9a.var_d46c4a839418dd7d.var_247535d1723e67f6;
    self.proximity = var_2f5d509d7b71ce9a.var_d46c4a839418dd7d.var_aab5a7e2da4b4756;
    self.var_32bfc08679c004bc = var_2f5d509d7b71ce9a.var_d46c4a839418dd7d.var_31c07988f05debcf;
    self.var_c70842e4e81f2852 = 1;
    if (getdvar(@"hash_a3cd7baf4609ce24", "-1") != "-1") {
        self.health = getdvarint(@"hash_a3cd7baf4609ce24");
    }
    if (getdvar(@"hash_1138e73c40e1324a", "-1") != "-1") {
        self.var_6201fb806ad1b5d7 = getdvarfloat(@"hash_1138e73c40e1324a");
    }
    self.var_c552b5bccbe7cb58 = self.health;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b17
// Size: 0x40
function function_eebf049c985aa4af(var_2f5d509d7b71ce9a) {
    self setcandamage(1);
    self function_65aa053c077c003a(0);
    self.attractor = function_c7a50ec2829c70b3(self, 1, self.var_32bfc08679c004bc, 1, undefined, &function_1282eec91da30219);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b5e
// Size: 0x363
function function_b3aa7145e80e6f9e(var_2f5d509d7b71ce9a) {
    self endon("death");
    self endon("reached_end_node");
    var_733dcf6c70fe2413 = squared(self.proximity);
    self.var_58bc745bb9d47fb = 0;
    while (1) {
        self.var_4d5a87edd3847f2f = 0;
        self.n_players = 0;
        a_players = level.players;
        foreach (player in a_players) {
            if (isdefined(player) && isdefined(self) && distancesquared(self.origin, player.origin) <= var_733dcf6c70fe2413) {
                self.var_4d5a87edd3847f2f = 1;
                self.n_players++;
            }
        }
        n_players = self.n_players - 1;
        n_players = clamp(n_players, 0, 3);
        var_578e9d1584d07d25 = n_players * self.var_9efb3de7b9d1acdc + 1;
        self.n_speed = self.var_6201fb806ad1b5d7 * var_578e9d1584d07d25;
        self.n_speed = clamp(self.n_speed, 1, 12);
        wait(0.5);
        if (!istrue(self.var_4d5a87edd3847f2f) || istrue(self.final_stop)) {
            if (is_equal(self.spawndata.var_e234a9f24c79fead.var_c8f10bf3a46b6429, "p2p")) {
                self function_a7fac0397762d7a6("p2p", "manualSpeed", mph_to_ips(0));
                self function_a7fac0397762d7a6("p2p", "resume", 0);
                self function_a7fac0397762d7a6("p2p", "pause", 1);
            } else {
                self vehicle_setspeed(0, self.accel, self.decel);
            }
            if (!istrue(self.var_4d5a87edd3847f2f) && !istrue(self.final_stop)) {
                self setscriptablepartstate("chassis", "alert");
                self setscriptablepartstate("beacon_light", "alert");
                self setscriptablepartstate("headlight_left", "alert");
                self setscriptablepartstate("headlight_right", "alert");
                self notify("no_escorts");
            }
        } else {
            if (is_equal(self.spawndata.var_e234a9f24c79fead.var_c8f10bf3a46b6429, "p2p")) {
                self function_a7fac0397762d7a6("p2p", "manualSpeed", mph_to_ips(self.n_speed));
                self function_a7fac0397762d7a6("p2p", "pause", 0);
                self function_a7fac0397762d7a6("p2p", "resume", 1);
            } else {
                self vehicle_setspeed(self.n_speed, self.accel, self.decel);
            }
            self setscriptablepartstate("beacon_light", "active");
            self setscriptablepartstate("headlight_left", "active");
            self setscriptablepartstate("headlight_right", "active");
        }
        vehspeed = self vehicle_getspeed();
        if (vehspeed <= 0.5) {
            function_a52670a99736f59d();
        } else {
            function_6e427a8504ec078c();
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ec8
// Size: 0xd4
function private function_1db9d507d5dd43da() {
    self endon("death");
    var_42fa32d918d93e7d = [0:"sentry_turret", 1:"remote_turret"];
    self vehphys_enablecollisioncallback(1);
    while (1) {
        partenum = ent = normalspeed = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        if (isdefined(ent.turrettype) && array_contains(var_42fa32d918d93e7d, ent.turrettype)) {
            ent notify("kill_turret", 1);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fa3
// Size: 0x1a7
function function_a52670a99736f59d() {
    self endon("death");
    if (!istrue(self.var_58bc745bb9d47fb)) {
        return;
    }
    var_c38db2e51d5f66a2 = anglestoforward(self.angles);
    var_e560aa662258c25d = anglestoright(self.angles);
    var_40fc788beae80d60 = [];
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(36, -98, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(36, 98, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-24, -98, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-24, 98, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-72, -98, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-72, 98, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    /#
        if (getdvarint(@"hash_3f737f506519563d", 0)) {
            foreach (var_d91a20443d65e73d in var_40fc788beae80d60) {
                line(var_d91a20443d65e73d.origin, var_d91a20443d65e73d.origin + (0, 0, 1024), (1, 0, 0), 1, 0, 600);
            }
        }
    #/
    function_357609ca7ca5486e(self.attractor, var_40fc788beae80d60);
    self.var_58bc745bb9d47fb = 0;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5151
// Size: 0x42
function function_6e427a8504ec078c() {
    self endon("death");
    if (self.var_58bc745bb9d47fb == 1) {
        return;
    }
    var_acaf8ee60aa06516 = [];
    function_357609ca7ca5486e(self.attractor, var_acaf8ee60aa06516);
    self.var_58bc745bb9d47fb = 1;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x519a
// Size: 0x52
function function_fc784a7d07e0449a(xoffset, yoffset, var_379097055795a272, var_a46e92474e3e644d) {
    var_1e0625e95bbc715c = spawnstruct();
    var_1e0625e95bbc715c.origin = self.origin + var_379097055795a272 * xoffset + var_a46e92474e3e644d * yoffset;
    return var_1e0625e95bbc715c;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51f4
// Size: 0x7a
function private function_84610473025b148() {
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_progress_bar", 100);
        player setclientomnvar("ui_br_objective_progress_bar_threshold", 20);
        player setclientomnvar("ui_br_objective_param", 100);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5275
// Size: 0x364
function function_8543cb813eebd318() {
    self endon("quest_s0_act2_ended");
    self.var_1ff927c3faaf9638 endon("death");
    n_start_health = self.var_1ff927c3faaf9638.health;
    var_d3f9d2fc8ac619b1 = 0;
    var_a905d9404522f094 = 0;
    var_239302032f4239a9 = 0;
    var_1570787437209b1a = 0;
    while (1) {
        eventid = einflictor = normal = angles = origin = objweapon = idflags = var_920ff4456ce9a2fc = var_1d3f20a69ced2dd5 = var_9e834fe6754a9c98 = smeansofdeath = vpoint = vdir = eattacker = idamage = self.var_1ff927c3faaf9638 waittill("damage");
        if (isdefined(eattacker) && isplayer(eattacker) && isdefined(idamage)) {
            self.var_1ff927c3faaf9638.health = self.var_1ff927c3faaf9638.health + idamage;
        } else {
            /#
                iprintlnbold(self.var_1ff927c3faaf9638.health);
            #/
            if (idamage > self.var_1ff927c3faaf9638.health && isdefined(self.var_1ff927c3faaf9638.attractor)) {
                var_acaf8ee60aa06516 = [];
                function_357609ca7ca5486e(self.var_1ff927c3faaf9638.attractor, var_acaf8ee60aa06516);
                function_349b67890a05c376(self.var_1ff927c3faaf9638.attractor);
            }
            function_32df7454369064fb(self.var_1ff927c3faaf9638.health, n_start_health);
            if (self.var_1ff927c3faaf9638.health <= 0) {
                var_acaf8ee60aa06516 = [];
                function_357609ca7ca5486e(self.var_1ff927c3faaf9638.attractor, var_acaf8ee60aa06516);
                function_349b67890a05c376(self.var_1ff927c3faaf9638.attractor);
                self.var_1ff927c3faaf9638 namespace_5a0f3ca265d3a4c8::function_d0df49de517ded03();
                self.var_1ff927c3faaf9638 namespace_1f188a13f7e79610::vehicle_explode();
                break;
            }
            if (isdefined(vpoint)) {
                playsoundatpos(vpoint, "evt_ob_obj_acv_damage");
            }
            if (!var_a905d9404522f094 && self.var_1ff927c3faaf9638.health <= n_start_health * 0.759) {
                var_a905d9404522f094 = 1;
                self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escacvhealth75");
            }
            if (!var_239302032f4239a9 && self.var_1ff927c3faaf9638.health <= n_start_health * 0.509) {
                var_239302032f4239a9 = 1;
                thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t6_escort_health_50", level.players);
            } else if (!var_1570787437209b1a && self.var_1ff927c3faaf9638.health <= n_start_health * 0.159) {
                var_1570787437209b1a = 1;
                thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t6_escort_health_15", level.players);
            }
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e0
// Size: 0x12b
function function_a46548c342e333f7() {
    self endon("quest_s0_act2_ended");
    self endon("device_detonated");
    self.var_1ff927c3faaf9638 waittill("death");
    thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_escort_death", level.players, 0, 1);
    self.var_4ffe32f42d51a763 = 1;
    thread function_cb078cbf493f2b94();
    if (isdefined(self.var_1ff927c3faaf9638.payload)) {
        self.payload = self.var_1ff927c3faaf9638.payload;
        self.var_1ff927c3faaf9638.payload delete();
    }
    if (isdefined(self.var_82b17a28607ecace)) {
        self.var_82b17a28607ecace freescriptable();
        self.var_82b17a28607ecace notify("death");
    }
    if (isdefined(self.var_b0d934858b1288b6)) {
        self.var_b0d934858b1288b6 freescriptable();
        self.var_b0d934858b1288b6 notify("death");
    }
    if (isdefined(self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e)) {
        self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e delete();
    }
    wait(9);
    namespace_134d54e39331ee45::function_3b564213c8be506d();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5712
// Size: 0xa1
function private function_cb078cbf493f2b94() {
    if (isdefined(self.var_1ff927c3faaf9638)) {
        if (isdefined(self.var_1ff927c3faaf9638.var_364b797a8b03169b)) {
            self.var_1ff927c3faaf9638.var_364b797a8b03169b delete();
        }
        if (isdefined(self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0)) {
            self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 delete();
        }
        if (isdefined(self.var_1ff927c3faaf9638.attractor)) {
            function_349b67890a05c376(self.var_1ff927c3faaf9638.attractor);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57ba
// Size: 0x49
function private function_32df7454369064fb(currentvalue, var_6e2c8ae84f3a9fae) {
    var_e6bcd0fd977eddde = currentvalue / var_6e2c8ae84f3a9fae * 100;
    n_percent = clamp(var_e6bcd0fd977eddde, 0, 100);
    n_percent = int(n_percent);
    function_cd08026f9908f3d6(n_percent);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580a
// Size: 0x73
function function_cd08026f9908f3d6(n_percent) {
    foreach (player in level.players) {
        player setclientomnvar("ui_br_objective_progress_bar", n_percent);
        player setclientomnvar("ui_br_objective_param", n_percent);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5884
// Size: 0x2d
function private function_c619613f382927df(str_alias) {
    var_c5fd8d562611e0e4 = lookupsoundlength(str_alias);
    var_c5fd8d562611e0e4 = float(var_c5fd8d562611e0e4);
    var_c5fd8d562611e0e4 = var_c5fd8d562611e0e4 / 1000;
    return var_c5fd8d562611e0e4;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b9
// Size: 0xda
function function_1282eec91da30219(attractor, zombie) {
    if (istrue(zombie.var_ed256e1ab4ed752)) {
        return 1;
    }
    if (isdefined(zombie.var_941802a0997e0c42) || istrue(zombie.var_d243a619c1894518)) {
        return 0;
    }
    if (isdefined(level.players)) {
        player = getclosest(zombie.origin, level.players, 3500);
        if (isdefined(player) && distance2dsquared(zombie.origin, player.origin) < distance2dsquared(zombie.origin, attractor.source.origin)) {
            return 0;
        }
    }
    if (isalive(zombie) && isdefined(attractor)) {
        return 1;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x599a
// Size: 0xf2
function function_33a37dad0f5c6416(abom) {
    abom endon("death");
    self.var_1ff927c3faaf9638 endon("death");
    abom.var_ac634d34ba9d701f = 0;
    while (1) {
        if (!isdefined(self.var_1ff927c3faaf9638)) {
            return;
        }
        if (isplayer(abom.enemy)) {
            dist = distance2dsquared(abom.enemy.origin, self.var_1ff927c3faaf9638.origin);
            if (dist > 3062500) {
                abom.var_ed256e1ab4ed752 = 1;
                abom.var_ac634d34ba9d701f = gettime();
            } else if (dist < 3062500 && gettime() - abom.var_ac634d34ba9d701f > 6000) {
                abom.var_ed256e1ab4ed752 = 0;
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a93
// Size: 0x4e
function function_8ea9cc3a882e6814(player) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.inlaststand) || !isalive(player)) {
        return;
    }
    if (player isreloading() || player isgestureplaying()) {
        return;
    }
    player thread function_86953a5b59ac4e80(self);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ae8
// Size: 0xb6
function function_86953a5b59ac4e80(interact) {
    self setstance("stand");
    self freezecontrols(1);
    time = self getgestureanimlength("jup_ges_button_press_01");
    self forceplaygestureviewmodel("jup_ges_button_press_01");
    vehicle = interact getlinkedparent();
    wait(time * 0.275);
    if (istrue(self.inlaststand) || !isalive(self)) {
        self freezecontrols(0);
        return;
    }
    vehicle setscriptablepartstate("screen", "on");
    vehicle setscriptablepartstate("button", "pressed");
    wait(time * 0.25);
    self freezecontrols(0);
    interact notify("escort_started");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba5
// Size: 0x309
function function_df4c9a21b5873371() {
    self endon("death");
    s_goal = getstruct("quest_escort_p2p_start", "targetname");
    self function_d2e41c7603ba7697("p2p");
    self function_a7fac0397762d7a6("p2p", "manualSpeed", mph_to_ips(s_goal.script_speed));
    self function_a7fac0397762d7a6("p2p", "brakeAtGoal", 0);
    self function_a7fac0397762d7a6("p2p", "goalPoint", s_goal.origin);
    while (1) {
        if (isdefined(self.var_94d203388c9f2657)) {
            s_goal = self.var_94d203388c9f2657;
            self.var_94d203388c9f2657 = undefined;
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
            self.var_b6e5d0ffc0c902d = s_goal;
            self function_a7fac0397762d7a6("p2p", "manualSpeed", mph_to_ips(s_goal.script_speed));
            self function_a7fac0397762d7a6("p2p", "brakeAtGoal", 0);
        }
        self function_a7fac0397762d7a6("p2p", "goalPoint", s_goal.origin);
        thread function_df5c996333f30a6b();
        self waittill("near_goal");
        if (!isdefined(s_goal.target) || is_equal(s_goal.script_noteworthy, "final_destination")) {
            self notify("reached_end_node");
            self.final_stop = 1;
            self function_a7fac0397762d7a6("p2p", "brakeAtGoal", 1);
            level notify("story_quest_complete_step_3");
            break;
        } else if (is_equal(s_goal.script_noteworthy, "ambush_encounter_location")) {
            thread function_f1ad2aee4e5a3b2f(20);
            self.var_df433561007fc313 thread function_2e69383c6abc963b(s_goal.script_noteworthy);
        } else if (is_equal(s_goal.script_noteworthy, "merc_camp_encounter_location")) {
            self.var_df433561007fc313 thread function_e2c32c2fc7cbaa46(s_goal.script_noteworthy, 1);
        } else if (is_equal(s_goal.script_noteworthy, "zombified_camp_encounter_location")) {
            self.var_df433561007fc313 thread function_e2c32c2fc7cbaa46(s_goal.script_noteworthy);
            self.var_df433561007fc313 thread function_2e69383c6abc963b(s_goal.script_noteworthy);
        } else if (is_equal(s_goal.script_noteworthy, "abomination_encounter_location")) {
            self.var_df433561007fc313 thread function_2e69383c6abc963b(s_goal.script_noteworthy);
        } else if (isdefined(s_goal.script_noteworthy)) {
            s_event = self.var_df433561007fc313 function_970f611dc2e032db(s_goal.script_noteworthy);
            if (isdefined(s_event)) {
                self.var_df433561007fc313 thread function_a9241d4812148865(s_event);
            }
            self.var_df433561007fc313 thread function_fca9f3b49a578a92(s_goal.script_noteworthy);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eb5
// Size: 0x30
function function_f1ad2aee4e5a3b2f(n_delay) {
    if (!isdefined(n_delay)) {
        n_delay = 0;
    }
    wait(n_delay);
    thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_mid_escort", level.players, 0, 1);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eec
// Size: 0xcc
function function_df5c996333f30a6b() {
    self endon("near_goal");
    start_time = gettime();
    var_5712319afa086cc8 = self.origin;
    while (1) {
        if (istrue(self.final_stop)) {
            return;
        }
        if (isdefined(self.var_b6e5d0ffc0c902d) && istrue(self.var_4d5a87edd3847f2f)) {
            elapsed_time = gettime() - start_time;
            if (elapsed_time > 5000) {
                dist = distance2d(var_5712319afa086cc8, self.origin);
                if (dist < 10) {
                    self.var_94d203388c9f2657 = self.var_b6e5d0ffc0c902d;
                    self notify("near_goal");
                }
            }
        } else {
            start_time = gettime();
            var_5712319afa086cc8 = self.origin;
        }
        wait(1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fbf
// Size: 0x84
function function_bb0d7d2ab7bb1c6b() {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    thread function_5150105a878624c6();
    thread function_245c0fb75415e353();
    thread function_559b54ebd2c6d3f3();
    thread function_247102c154ae35dd();
    thread function_373589e7b9dfead7();
    thread function_a9425bec08296e0d("zombie_spawn_group_1");
    thread function_a9425bec08296e0d("zombie_spawn_group_2");
    thread function_a9425bec08296e0d("zombie_spawn_group_3");
    thread function_a9425bec08296e0d("zombie_spawn_group_4");
    thread function_764e9f6e76e35aab();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x604a
// Size: 0x47
function function_5150105a878624c6() {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill("ambush_encounter_location");
    thread function_f1ad2aee4e5a3b2f(20);
    thread function_2e69383c6abc963b("ambush_encounter_location");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6098
// Size: 0x3f
function function_245c0fb75415e353() {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill("merc_camp_encounter_location");
    thread function_e2c32c2fc7cbaa46("merc_camp_encounter_location", 1);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60de
// Size: 0x4a
function function_559b54ebd2c6d3f3() {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill("zombified_camp_encounter_location");
    thread function_e2c32c2fc7cbaa46("zombified_camp_encounter_location");
    thread function_2e69383c6abc963b("zombified_camp_encounter_location");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612f
// Size: 0x3d
function function_247102c154ae35dd() {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill("abomination_encounter_location");
    thread function_2e69383c6abc963b("abomination_encounter_location");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6173
// Size: 0x75
function function_373589e7b9dfead7() {
    if (!isarray(self.escort_path_events)) {
        return;
    }
    foreach (s_event in self.escort_path_events) {
        thread function_97d372c44010a524(s_event.targetname);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61ef
// Size: 0x5e
function function_97d372c44010a524(var_3d5033905ec1ebff) {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill(var_3d5033905ec1ebff);
    s_event = function_970f611dc2e032db(var_3d5033905ec1ebff);
    if (isdefined(s_event)) {
        thread function_a9241d4812148865(s_event);
    }
    thread function_fca9f3b49a578a92(var_3d5033905ec1ebff);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6254
// Size: 0x3e
function function_a9425bec08296e0d(group_name) {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill(group_name);
    thread function_fca9f3b49a578a92(group_name);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6299
// Size: 0x5e
function function_764e9f6e76e35aab() {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill("final_destination");
    self.var_1ff927c3faaf9638 notify("reached_end_node");
    self.var_1ff927c3faaf9638.final_stop = 1;
    level notify("story_quest_complete_step_3");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62fe
// Size: 0x205
function function_97e82918ce08c384() {
    self endon("quest_s0_act2_complete");
    self endon("quest_s0_act2_end");
    waitframe();
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e = spawn("script_model", self.var_1ff927c3faaf9638.origin);
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e.team = "neutral";
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e linkto(self.var_1ff927c3faaf9638, "tag_control_panel_door_lower_animate", (0, -7.5, 0), (0, 90, 0));
    self.var_d524faad28ac9c20 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(0);
    namespace_5a22b6f3a56f7e9b::objective_add_objective(self.var_d524faad28ac9c20, "active");
    var_154a0c69b64b56f6 = self.var_1ff927c3faaf9638.origin;
    self.var_d9a91303aea799de = function_a833053c48e37c08();
    if (isdefined(self.var_d9a91303aea799de)) {
        var_154a0c69b64b56f6 = self.var_d9a91303aea799de.origin;
    } else if (isdefined(self.var_5e87f48a491952ca)) {
        var_154a0c69b64b56f6 = self.var_5e87f48a491952ca.origin;
    }
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_d524faad28ac9c20, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.var_d524faad28ac9c20, 0);
    namespace_5a22b6f3a56f7e9b::objective_add_objective(self.var_d524faad28ac9c20, "current");
    namespace_5a22b6f3a56f7e9b::update_objective_icon(self.var_d524faad28ac9c20, "jup_ui_map_icon_generic_marker");
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_d524faad28ac9c20);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_d524faad28ac9c20, var_154a0c69b64b56f6 + (0, 0, 24));
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.var_d524faad28ac9c20, self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.var_d524faad28ac9c20, 1);
    function_11cbcb8303075da(self.var_d524faad28ac9c20, 195, 239, 158);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x650a
// Size: 0x38
function function_2e69383c6abc963b(var_7ee602bfe45cec78) {
    s_location = getstruct(var_7ee602bfe45cec78, "targetname");
    if (isdefined(s_location)) {
        function_1b4d007c48f6440d(s_location, undefined, 1, 0.1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6549
// Size: 0x186
function function_e2c32c2fc7cbaa46(var_7ee602bfe45cec78, var_a44c9d2580138d8d) {
    if (!isdefined(var_a44c9d2580138d8d)) {
        var_a44c9d2580138d8d = 0;
    }
    s_location = getstruct(var_7ee602bfe45cec78, "targetname");
    var_36bfaa6d1617a83b = getstructarray("ai_goal", "targetname");
    var_f83db8d7f8c4654c = [];
    foreach (s_goal in var_36bfaa6d1617a83b) {
        if (is_equal(s_goal.target, s_location.targetname)) {
            var_f83db8d7f8c4654c = array_add(var_f83db8d7f8c4654c, s_goal);
        }
    }
    if (istrue(var_a44c9d2580138d8d)) {
        var_2b4364d8d93a45b9 = getstructarray("merc_camp_encounter_location_merc_chopper", "targetname");
        thread function_804aa1cbd49ba400(var_2b4364d8d93a45b9);
    }
    thread function_d1ce7548ed380171(s_location);
    self.var_865c65851de2f738 = getstructarray("sentry_spawn", "targetname");
    foreach (var_779c916529c44b1a in self.var_865c65851de2f738) {
        if (is_equal(var_779c916529c44b1a.target, s_location.targetname)) {
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d6
// Size: 0x5c
function function_fca9f3b49a578a92(var_7ee602bfe45cec78) {
    var_19f37b5b125ffe11 = getstruct("escort_path_spawning", "targetname");
    var_c4195a12cd88f216 = getstructarray(var_7ee602bfe45cec78, "targetname");
    if (var_c4195a12cd88f216.size > 0 && isdefined(var_19f37b5b125ffe11)) {
        thread function_e4fed48871c2e7df(var_c4195a12cd88f216, var_19f37b5b125ffe11, 1, 0.2);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6739
// Size: 0x51
function private function_9c9e518280bea222(var_2f5d509d7b71ce9a) {
    self endon("death");
    self endon("reached_end_node");
    while (1) {
        wait(30);
        self waittill("no_escorts");
        if (isdefined(self.var_4bf9260eb4f665f0)) {
            self.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escnoescortsinrange");
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6791
// Size: 0x1db
function function_2e0dc001c9a5c661() {
    var_d08f3ac86be7ae9e = getstructarray("map_transition_to_act2", "targetname");
    self.var_a5016e4b6acfea47 = [];
    level waittill("prematch_done");
    thread function_a49ca0a80cb63664();
    foreach (var_751df20fceaee5 in var_d08f3ac86be7ae9e) {
        var_751df20fceaee5.var_d182b8d3f3aaa93b = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5, "ob_quest_exfil_site_xmodel", 1, 1);
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_site", "standby");
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_icon", "default_icon");
        var_751df20fceaee5.var_d182b8d3f3aaa93b setscriptablepartstate("ob_quest_exfil_smoke", "smoking");
        self.var_a5016e4b6acfea47[self.var_a5016e4b6acfea47.size] = var_751df20fceaee5.var_d182b8d3f3aaa93b;
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(var_751df20fceaee5.var_d182b8d3f3aaa93b, 120, &function_a1778cdfcc8373ae, "JUP_OB_OBJECTIVES/QUEST_0_ACT2_EXFIL_INTERACT");
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact sethintonobstruction("show");
        var_751df20fceaee5 thread function_e3ba83b1bb428b8e();
    }
    level flag_wait("exfil_to_s0_act_2");
    foreach (var_751df20fceaee5 in var_d08f3ac86be7ae9e) {
        if (isdefined(var_751df20fceaee5.n_obj_id)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_751df20fceaee5.n_obj_id);
            var_751df20fceaee5.n_obj_id = undefined;
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6973
// Size: 0x92
function function_a49ca0a80cb63664() {
    level flag_wait("exfil_to_s0_act_2");
    wait(1);
    foreach (var_d182b8d3f3aaa93b in self.var_a5016e4b6acfea47) {
        if (isdefined(var_d182b8d3f3aaa93b) && isdefined(var_d182b8d3f3aaa93b.interact)) {
            var_d182b8d3f3aaa93b.interact delete();
        }
        if (isdefined(var_d182b8d3f3aaa93b)) {
            var_d182b8d3f3aaa93b delete();
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a0c
// Size: 0x98
function function_e3ba83b1bb428b8e() {
    self.n_obj_id = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    namespace_5a22b6f3a56f7e9b::objective_add_objective(self.n_obj_id, "invisible", self.var_d182b8d3f3aaa93b.origin, "ui_map_icon_ob_quest_exfil", "icon_small");
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.n_obj_id, self.var_d182b8d3f3aaa93b);
    namespace_5a22b6f3a56f7e9b::function_c3c6bff089dfdd34(self.n_obj_id, "icon_regular");
    objective_setlabel(self.n_obj_id, "SHARED_HINTSTRINGS/EXFIL");
    objective_setplayintro(self.n_obj_id, 0);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6aab
// Size: 0x69
function function_a1778cdfcc8373ae(player) {
    self function_dfb78b3e724ad620(0);
    if (isdefined(level.var_d8b6115a502e7e76)) {
        if (!self [[ level.var_d8b6115a502e7e76 ]](player)) {
            self playsoundtoplayer("ui_zm_core_door_purchase_deny", player);
            return;
        }
    }
    level flag_set("exfil_nuclear");
    level thread map_transition();
    level flag_set("exfil_to_s0_act_2");
    self delete();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b1b
// Size: 0x85
function function_d22ac1e7c80dc46b() {
    function_459b11a053734e1("start");
    setmusicstate("");
    thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_defend_arrival", level.players, 0, 1);
    self.var_1ff927c3faaf9638 setscriptablepartstate("beacon_light", "off");
    self.var_1ff927c3faaf9638 setscriptablepartstate("headlight_left", "off");
    self.var_1ff927c3faaf9638 setscriptablepartstate("headlight_right", "off");
    function_6ec87531a2f50abb();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ba7
// Size: 0x13c
function function_6ec87531a2f50abb() {
    if (isdefined(self.var_b0d934858b1288b6)) {
        return;
    }
    objective_setlabel(self.var_d524faad28ac9c20, "JUP_OB_OBJECTIVES/QUEST_0_ACT2_DEFEND_ACTIVATE_MARKER_LABEL");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_d524faad28ac9c20, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.var_d524faad28ac9c20, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_d524faad28ac9c20, "invisible");
    waitframe();
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_d524faad28ac9c20, "current");
    var_68bcfd727cd64046 = self.var_1ff927c3faaf9638 gettagorigin("tag_attach_rocket");
    self.var_b0d934858b1288b6 = spawnscriptable("ob_hacking_device_s0_act2_defend", var_68bcfd727cd64046);
    self.var_b0d934858b1288b6.var_df433561007fc313 = self;
    namespace_29b5250e9959ea::function_3cec1b2981075936("jup_hacking_device_ob", self.var_b0d934858b1288b6, &function_c5a6850e8e01e061);
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e unlink();
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e linkto(self.var_1ff927c3faaf9638, "tag_attach_rocket", (-40, 0, 48), (0, 0, 0));
    thread function_f5c999e269f92619("defend_start");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cea
// Size: 0x64
function function_c5a6850e8e01e061(player) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.inlaststand) || !isalive(player)) {
        return;
    }
    if (player isreloading() || player isgestureplaying()) {
        return;
    }
    self.var_df433561007fc313 thread defend_start();
    self freescriptable();
    self notify("death");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d55
// Size: 0xd0
function defend_start() {
    self endon("quest_s0_act2_ended");
    level endon("game_ended");
    if (istrue(self.var_47a545564c7d580)) {
        return;
    }
    self.var_47a545564c7d580 = 1;
    setmusicstate("mx_jup_ob_worldboss_2");
    self notify("defend_start");
    earthquake(0.175, 0.4, self.var_1ff927c3faaf9638.origin, 1000);
    playrumbleonposition("grenade_rumble", self.var_1ff927c3faaf9638.origin);
    if (isdefined(self.var_1ff927c3faaf9638)) {
        self.var_1ff927c3faaf9638 setscriptablepartstate("rear_light", "off");
    }
    thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_defend_start", level.players, 0, 1);
    thread function_7e2f20c8a0e38e9c();
    thread function_8c8b62e1711f12c6();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e2c
// Size: 0x15a
function function_8c8b62e1711f12c6() {
    self endon("quest_s0_act2_ended");
    self.var_1ff927c3faaf9638 endon("death");
    level endon("game_ended");
    self.var_e504d983a6aa7dc2 = gettime();
    thread function_3af116a208317db7();
    thread function_dcda77c686a22dbc();
    thread function_6d38ce46ef394070();
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.var_d524faad28ac9c20);
    function_459b11a053734e1("defend");
    thread function_b255f185e2c06ed4();
    var_e26495cfcc1e648f = function_53c4c53197386572(getdvarint(@"hash_f156147cb46669c3", 60), 60);
    wait(var_e26495cfcc1e648f);
    objective_setlabel(self.var_d524faad28ac9c20, "JUP_OB_OBJECTIVES/QUEST_0_ACT2_DEFEND_DETONATE_MARKER_LABEL");
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_d524faad28ac9c20);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_d524faad28ac9c20, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.var_d524faad28ac9c20, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_d524faad28ac9c20, "invisible");
    waitframe();
    namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_d524faad28ac9c20, "current");
    self.var_f1271465f4a6a4f9 = gettime();
    function_459b11a053734e1("detonate");
    self.var_8bfc6c5f7610e1ec = gettime();
    thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t6_complete", level.players);
    self.var_722b949c50154560 = 1;
    function_f3261744da978d4f();
    thread function_a871bbfb76af397d();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8d
// Size: 0xb6
function function_6d38ce46ef394070() {
    self endon("quest_s0_act2_ended");
    level endon("story_quest_complete_step_4");
    while (1) {
        if (!isdefined(self.var_1ff927c3faaf9638)) {
            return;
        }
        elapsed_time = (gettime() - self.var_e504d983a6aa7dc2) / 1000;
        var_d8ef071103d43ca7 = elapsed_time / 60 * 100;
        var_b1ddab7718607d5 = 0.07;
        if (var_d8ef071103d43ca7 > 33 && var_d8ef071103d43ca7 < 66) {
            var_b1ddab7718607d5 = 0.0875;
        } else if (var_d8ef071103d43ca7 > 66) {
            var_b1ddab7718607d5 = 0.12;
        }
        earthquake(var_b1ddab7718607d5, 0.1, self.var_1ff927c3faaf9638.origin, 750);
        wait(0.1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x704a
// Size: 0xd9
function function_f3261744da978d4f() {
    var_68bcfd727cd64046 = self.var_1ff927c3faaf9638 gettagorigin("tag_attach_rocket");
    self.var_82b17a28607ecace = spawnscriptable("ob_hacking_device_s0_act2_detonate", var_68bcfd727cd64046);
    self.var_82b17a28607ecace.var_df433561007fc313 = self;
    namespace_29b5250e9959ea::function_3cec1b2981075936("jup_hacking_device_ob", self.var_82b17a28607ecace, &function_25b874eb128890a1);
    self.var_785101daa1fc6003 = gettime();
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e unlink();
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e linkto(self.var_1ff927c3faaf9638, "tag_attach_rocket", (-40, 0, 48), (0, 0, 0));
    thread function_f5c999e269f92619("device_detonated");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x712a
// Size: 0xae
function function_25b874eb128890a1(player) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.inlaststand) || !isalive(player)) {
        return;
    }
    if (player isreloading() || player isgestureplaying()) {
        return;
    }
    self.var_df433561007fc313 notify("device_detonated");
    if (isdefined(self.var_df433561007fc313.var_1ff927c3faaf9638)) {
        self.var_df433561007fc313.var_1ff927c3faaf9638 setscriptablepartstate("rear_light", "launch");
    }
    self.var_df433561007fc313 thread function_169f90fd59c5fe78();
    self freescriptable();
    self notify("death");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71df
// Size: 0x147
function function_a871bbfb76af397d() {
    self endon("device_detonated");
    self.var_1ff927c3faaf9638 endon("death");
    while (1) {
        if (isdefined(self.var_785101daa1fc6003)) {
            elapsed_time = (gettime() - self.var_785101daa1fc6003) / 1000;
            if (elapsed_time > 180) {
                thread function_169f90fd59c5fe78();
                self.var_82b17a28607ecace freescriptable();
                self.var_82b17a28607ecace notify("death");
                return;
            }
        }
        if (isdefined(self.var_8bfc6c5f7610e1ec)) {
            elapsed_time = (gettime() - self.var_8bfc6c5f7610e1ec) / 1000;
            if (elapsed_time > 30) {
                self.var_8bfc6c5f7610e1ec = gettime();
                thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t6_complete", level.players);
            }
        }
        if (isdefined(self.var_f1271465f4a6a4f9)) {
            elapsed_time = (gettime() - self.var_f1271465f4a6a4f9) / 1000;
            if (elapsed_time > 30) {
                self.var_f1271465f4a6a4f9 = gettime();
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.var_d524faad28ac9c20);
                waitframe();
                namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(self.var_d524faad28ac9c20);
                namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_d524faad28ac9c20, 1);
                namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.var_d524faad28ac9c20, 1);
            }
        }
        wait(1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x732d
// Size: 0x164
function function_b255f185e2c06ed4() {
    self.var_5a7e0e43ccdc431f = getstruct("defend_location", "targetname");
    self.var_5a7e0e43ccdc431f.var_216bc1fde948c1a3 = getstruct("defend_zombie_wave", "targetname");
    var_67fc9f2155bccd5e = getstructarray("zombie_wave_spawn", "targetname");
    var_d98d45929ffbb835 = [];
    foreach (var_f8b41575d1c929c9 in var_67fc9f2155bccd5e) {
        if (is_equal(var_f8b41575d1c929c9.target, self.var_5a7e0e43ccdc431f.var_216bc1fde948c1a3.targetname)) {
            var_d98d45929ffbb835 = array_add(var_d98d45929ffbb835, var_f8b41575d1c929c9);
        }
    }
    self.var_5a7e0e43ccdc431f.var_216bc1fde948c1a3.var_3d028e278e3c71d8 = 8;
    self.var_5a7e0e43ccdc431f.var_216bc1fde948c1a3.time_between_spawns = 0.2;
    self.var_5a7e0e43ccdc431f.var_216bc1fde948c1a3.a_spawn_structs = var_d98d45929ffbb835;
    thread function_c4ca28aac25522a2(self.var_5a7e0e43ccdc431f.var_216bc1fde948c1a3);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7498
// Size: 0x2af
function function_3af116a208317db7() {
    self endon("quest_s0_act2_ended");
    if (!isdefined(self.var_1ff927c3faaf9638)) {
        return;
    }
    self.var_1ff927c3faaf9638 endon("death");
    if (!isdefined(self.var_1ff927c3faaf9638.payload)) {
        return;
    }
    self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb = 0;
    self.var_1ff927c3faaf9638.payload setscriptablepartstate("body", "initiate");
    wait(1.5);
    while (1) {
        if (!isdefined(self.var_e504d983a6aa7dc2)) {
            continue;
        }
        elapsed_time = (gettime() - self.var_e504d983a6aa7dc2) / 1000;
        var_a1482e1b4ae27dd5 = elapsed_time / 60 * 100;
        if (is_equal(self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb, 0)) {
            self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb = 1;
            self.var_1ff927c3faaf9638.payload setscriptablepartstate("charge", "charge_state_1");
        } else if (var_a1482e1b4ae27dd5 > 33 && var_a1482e1b4ae27dd5 < 66 && is_equal(self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb, 1)) {
            self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb = 2;
            self.var_1ff927c3faaf9638.payload setscriptablepartstate("charge", "charge_state_2");
        } else if (var_a1482e1b4ae27dd5 > 66 && var_a1482e1b4ae27dd5 < 99 && is_equal(self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb, 2)) {
            self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb = 3;
            self.var_1ff927c3faaf9638.payload setscriptablepartstate("charge", "charge_state_3");
        } else if (var_a1482e1b4ae27dd5 > 99 && is_equal(self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb, 3)) {
            self.var_1ff927c3faaf9638.payload.var_444bec3b036a61fb = 4;
            self.var_1ff927c3faaf9638.payload setscriptablepartstate("charge", "charge_state_4");
            return;
        }
        wait(1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x774e
// Size: 0xe1
function function_7e2f20c8a0e38e9c() {
    self endon("quest_s0_act2_ended");
    level endon("story_quest_complete_step_4");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638.nearby_players = [];
    while (1) {
        self.var_1ff927c3faaf9638.nearby_players = namespace_7e17181d03156026::getplayersinradius(self.var_1ff927c3faaf9638.origin, 450);
        foreach (player in self.var_1ff927c3faaf9638.nearby_players) {
            if (!istrue(self.var_e6fec6c76ff0c39f)) {
                player thread function_6b84ce5557affd27(self);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7836
// Size: 0xa6
function function_6b84ce5557affd27(var_54492f7bf0674200) {
    self endon("death");
    self endon("disconnect");
    self playrumblelooponentity("damage_light");
    while (1) {
        if (isarray(var_54492f7bf0674200.var_1ff927c3faaf9638.nearby_players) && array_contains(var_54492f7bf0674200.var_1ff927c3faaf9638.nearby_players, self) && !istrue(var_54492f7bf0674200.var_99626a64c1275340)) {
            self.var_e6fec6c76ff0c39f = 1;
            wait(0.1);
            continue;
        }
        self stoprumble("damage_light");
        self.var_e6fec6c76ff0c39f = undefined;
        return;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78e3
// Size: 0x1f0
function function_169f90fd59c5fe78() {
    thread function_3ec05a7bf5c377ef();
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_d524faad28ac9c20);
    var_3bd6f565bc3ff6f7 = self.var_1ff927c3faaf9638 gettagorigin("tag_attach_rocket");
    var_903f82ea21cc311f = var_3bd6f565bc3ff6f7 + (0, 0, 128);
    playfxontag(level._effect["lightning_strike_origin_loop"], self.var_1ff927c3faaf9638.payload, "tag_origin");
    self.var_1ff927c3faaf9638.payload function_c664a2459d6f3eaa("sndevent_act2_transition_to_igc");
    thread function_a0f338ea39fbf73a(var_903f82ea21cc311f, 400, 1);
    thread function_758118f56eee7617();
    earthquake(0.275, 0.5, self.var_1ff927c3faaf9638.origin, 1750);
    playrumbleonposition("grenade_rumble", self.var_1ff927c3faaf9638.origin);
    wait(1.5);
    thread function_a0f338ea39fbf73a(var_903f82ea21cc311f, 300, 1);
    earthquake(0.275, 0.5, self.var_1ff927c3faaf9638.origin, 1750);
    playrumbleonposition("grenade_rumble", self.var_1ff927c3faaf9638.origin);
    wait(1.35);
    playfxontag(level._effect["neutralizer_explosion"], self.var_1ff927c3faaf9638.payload, "tag_origin");
    earthquake(0.275, 0.5, self.var_1ff927c3faaf9638.origin, 1750);
    playrumbleonposition("grenade_rumble", self.var_1ff927c3faaf9638.origin);
    wait(0.15);
    thread function_b61e551ad0e7bad9();
    thread function_a0f338ea39fbf73a(var_903f82ea21cc311f, 150, 1);
    thread function_1de7b72c15891a94();
    wait(0.5);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ada
// Size: 0x229
function function_dcda77c686a22dbc() {
    self endon("quest_s0_act2_ended");
    self endon("device_detonated");
    self.var_1ff927c3faaf9638 endon("death");
    var_3bd6f565bc3ff6f7 = self.var_1ff927c3faaf9638 gettagorigin("tag_attach_rocket");
    up_angles = vectornormalize(anglestoup(self.var_1ff927c3faaf9638 gettagangles("tag_attach_rocket")));
    var_903f82ea21cc311f = var_3bd6f565bc3ff6f7 + up_angles * 152;
    self.var_a65ff8abf8d244a2 = spawn_model("tag_origin", var_903f82ea21cc311f);
    self.var_a65ff8abf8d244a2 function_cea710f9d017694a(1);
    self.var_2c323a01b507a66b = spawn_model("tag_origin", var_903f82ea21cc311f);
    self.var_2c323a01b507a66b function_cea710f9d017694a(1);
    waitframe();
    search_radius = 1000;
    wait(3);
    wait_time = 5;
    var_3716283a3d9214f = 0;
    var_ea30cf93367c9020 = 0;
    var_42a8f237c5ff3bda = [];
    var_32c19635440efa1d = undefined;
    while (1) {
        elapsed_time = (gettime() - self.var_e504d983a6aa7dc2) / 1000;
        var_d8ef071103d43ca7 = elapsed_time / 60 * 100;
        if (var_d8ef071103d43ca7 > 0 && var_d8ef071103d43ca7 < 20) {
            wait_time = 5;
        } else if (var_d8ef071103d43ca7 >= 20 && var_d8ef071103d43ca7 < 40) {
            wait_time = 2.5;
        } else if (var_d8ef071103d43ca7 >= 40 && var_d8ef071103d43ca7 < 60) {
            wait_time = 1.5;
        } else if (var_d8ef071103d43ca7 >= 60 && var_d8ef071103d43ca7 < 90) {
            wait_time = 1;
        } else if (var_d8ef071103d43ca7 > 95) {
            wait_time = 0.375;
            var_ea30cf93367c9020 = function_51d76700600cebe3(45);
        }
        if (var_d8ef071103d43ca7 >= 75) {
            var_3716283a3d9214f = 1;
        }
        if (istrue(var_ea30cf93367c9020)) {
            var_42a8f237c5ff3bda = getaiarrayinradius(self.var_1ff927c3faaf9638.origin, search_radius, "team_two_hundred");
            if (var_42a8f237c5ff3bda.size > 0) {
                var_32c19635440efa1d = function_7a2aaa4a09a4d250(var_42a8f237c5ff3bda);
                if (istrue(var_32c19635440efa1d.var_20bed26d985c0b63)) {
                    var_32c19635440efa1d = undefined;
                }
            }
        }
        thread lightning_strike(var_903f82ea21cc311f, search_radius, var_3716283a3d9214f, var_32c19635440efa1d);
        wait(wait_time);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d0a
// Size: 0x9b
function function_a0f338ea39fbf73a(var_903f82ea21cc311f, search_radius, var_3716283a3d9214f) {
    if (!isdefined(var_3716283a3d9214f)) {
        var_3716283a3d9214f = 0;
    }
    a_structs = function_9c6ba52445fdb1c(var_903f82ea21cc311f, search_radius, 1);
    foreach (var_53026782b399177d in a_structs) {
        thread lightning_strike(var_53026782b399177d.origin, search_radius, var_3716283a3d9214f);
        wait(0.05);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dac
// Size: 0x308
function lightning_strike(var_903f82ea21cc311f, search_radius, var_3716283a3d9214f, var_32c19635440efa1d) {
    if (!isdefined(var_3716283a3d9214f)) {
        var_3716283a3d9214f = 0;
    }
    self endon("quest_s0_act2_ended");
    if (!isdefined(var_903f82ea21cc311f) || !isalive(self.var_1ff927c3faaf9638) || !isdefined(self.var_1ff927c3faaf9638.payload)) {
        return;
    }
    if (istrue(var_3716283a3d9214f)) {
        var_5f46f69e474af537 = level._effect["lightning_strike_origin"];
        var_da2c1bb46bac2a2f = level._effect["lightning_strike"];
    } else {
        var_5f46f69e474af537 = level._effect["lightning_strike_origin_weak"];
        var_da2c1bb46bac2a2f = level._effect["lightning_strike_weak"];
    }
    var_1258d2c8f30d5b92 = getgroundposition(var_903f82ea21cc311f, 1);
    var_7ac7072a56b6862a = getrandomnavpoint(var_1258d2c8f30d5b92, search_radius);
    if (isalive(var_32c19635440efa1d) && isdefined(var_32c19635440efa1d.model) && hastag(var_32c19635440efa1d.model, "j_spinelower")) {
        var_7ac7072a56b6862a = var_32c19635440efa1d gettagorigin("j_spinelower");
    }
    if (!isdefined(var_7ac7072a56b6862a)) {
        return;
    }
    self.var_a65ff8abf8d244a2.origin = var_7ac7072a56b6862a;
    waitframe();
    self.var_1ff927c3faaf9638.payload setscriptablepartstate("audio_impact", "impact_hit");
    playfxontag(var_5f46f69e474af537, self.var_1ff927c3faaf9638.payload, "tag_origin");
    waitframe();
    self.var_220c88e614c503dd = playfxontagsbetweenclients(var_da2c1bb46bac2a2f, self.var_2c323a01b507a66b, "tag_origin", self.var_a65ff8abf8d244a2, "tag_origin");
    self.var_220c88e614c503dd function_cea710f9d017694a(1);
    self.var_220c88e614c503dd thread function_c6f6d1db0ba45c61();
    var_9a7c22c57fb6059f = vectortoangles(var_7ac7072a56b6862a - var_903f82ea21cc311f);
    playfx(level._effect["lightning_strike_impact"], var_7ac7072a56b6862a, var_9a7c22c57fb6059f);
    if (isalive(var_32c19635440efa1d)) {
        var_32c19635440efa1d.var_f33496b914378bbd = 1;
        var_32c19635440efa1d kill();
    }
    a_ai_zombies = getaiarrayinradius(var_7ac7072a56b6862a, 32, "team_two_hundred");
    foreach (zombie in a_ai_zombies) {
        if (isalive(zombie)) {
            thread function_e199f62146443082(zombie);
        }
    }
    var_c41ff3df2633113b = getaiarrayinradius(var_7ac7072a56b6862a, 32, "team_hundred_ninety");
    foreach (soldier in var_c41ff3df2633113b) {
        thread function_31f4489d7f9865e2(soldier);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80bb
// Size: 0x10
function function_c6f6d1db0ba45c61() {
    wait(0.25);
    self delete();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80d2
// Size: 0x22b
function function_3ec05a7bf5c377ef() {
    var_c020246f882e51c0 = getentitylessscriptablearray("mp_jup_st_a_ob_quest_set_dressing", "targetname", self.var_1ff927c3faaf9638.origin, 2500);
    self.var_fb417bc0dea611fe = [];
    self.var_e11397c8e293578 = [];
    var_ebaf39cc98e192f0 = [];
    var_e7b3921421aa9e7d = 5;
    foreach (crystal in var_c020246f882e51c0) {
        var_3164ab88b1205ec7 = spawn_model("tag_origin", crystal.origin + (0, 0, 48));
        var_ebaf39cc98e192f0 = array_add(var_ebaf39cc98e192f0, var_3164ab88b1205ec7);
        crystal.var_3164ab88b1205ec7 = var_3164ab88b1205ec7;
        self.var_fb417bc0dea611fe = array_add(self.var_fb417bc0dea611fe, crystal);
        if (var_ebaf39cc98e192f0.size >= var_e7b3921421aa9e7d) {
            break;
        }
    }
    foreach (var_3164ab88b1205ec7 in var_ebaf39cc98e192f0) {
        var_f7eb9f5cce8caf9f = playfxontagsbetweenclients(level._effect["lightning_strike"], self.var_2c323a01b507a66b, "tag_origin", var_3164ab88b1205ec7, "tag_origin");
        var_f7eb9f5cce8caf9f function_cea710f9d017694a(1);
        var_3164ab88b1205ec7.var_f7eb9f5cce8caf9f = var_f7eb9f5cce8caf9f;
        var_9a7c22c57fb6059f = vectortoangles(var_3164ab88b1205ec7.origin - self.var_2c323a01b507a66b.origin);
        var_74efcb222e8ed3f0 = vectornormalize(var_3164ab88b1205ec7.origin - self.var_2c323a01b507a66b.origin);
        var_f7eb9f5cce8caf9f thread function_dd594ef572ab279(var_3164ab88b1205ec7.origin - 38 * var_74efcb222e8ed3f0, var_9a7c22c57fb6059f);
        self.var_e11397c8e293578 = array_add(self.var_e11397c8e293578, var_f7eb9f5cce8caf9f);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8304
// Size: 0x40
function function_dd594ef572ab279(var_31b3f90c52110c13, var_75066457dd4f0604) {
    self endon("death");
    while (1) {
        playfx(level._effect["lightning_strike_impact"], var_31b3f90c52110c13, var_75066457dd4f0604);
        wait(0.5);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x834b
// Size: 0xcf
function function_1de7b72c15891a94() {
    foreach (crystal in self.var_fb417bc0dea611fe) {
        if (crystal getscriptableparthasstate("body", "jup_zm_phase_crystal_floor_destroy")) {
            crystal setscriptablepartstate("body", "jup_zm_phase_crystal_floor_destroy");
        }
        if (isdefined(crystal.var_3164ab88b1205ec7) && isdefined(crystal.var_3164ab88b1205ec7.var_f7eb9f5cce8caf9f)) {
            crystal.var_3164ab88b1205ec7.var_f7eb9f5cce8caf9f delete();
            crystal.var_3164ab88b1205ec7 delete();
        }
        wait(0.1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8421
// Size: 0x188
function function_9c6ba52445fdb1c(center_origin, n_radius, var_cd00b21daa6ae0b4) {
    var_f10d2bae0aa4fce7 = [];
    var_46edfbf5c8ec3711 = [];
    var_5ac1024b00cecc71 = (0, 0, 48);
    i = 0;
    while (i < 360) {
        x1 = n_radius * cos(i * 57.2958);
        y1 = n_radius * sin(i * 57.2958);
        var_28bcdecf0f208418 = center_origin + (x1, y1, 0);
        pos_on_navmesh = getclosestpointonnavmesh(var_28bcdecf0f208418);
        if (isdefined(pos_on_navmesh)) {
            var_80d60a888604dbda = namespace_2a184fc4902783dc::ray_trace_passed(center_origin + var_5ac1024b00cecc71, pos_on_navmesh + var_5ac1024b00cecc71, level.players);
            if (istrue(var_80d60a888604dbda)) {
                var_46edfbf5c8ec3711[var_46edfbf5c8ec3711.size] = pos_on_navmesh;
            }
        }
        i = i + 45;
    }
    if (is_equal(var_46edfbf5c8ec3711.size, 0)) {
        pos_on_navmesh = getclosestpointonnavmesh(center_origin);
        var_46edfbf5c8ec3711[var_46edfbf5c8ec3711.size] = pos_on_navmesh;
    }
    for (i = 0; i < var_46edfbf5c8ec3711.size; i++) {
        s_spot = spawnstruct();
        s_spot.origin = var_46edfbf5c8ec3711[i];
        s_spot.angles = (0, 0, 0);
        var_f10d2bae0aa4fce7[var_f10d2bae0aa4fce7.size] = s_spot;
    }
    if (istrue(var_cd00b21daa6ae0b4)) {
        return var_f10d2bae0aa4fce7;
    }
    var_a0c3489d2ad5aa8d = randomintrange(0, var_f10d2bae0aa4fce7.size);
    return var_f10d2bae0aa4fce7[var_a0c3489d2ad5aa8d];
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b1
// Size: 0xc5
function function_31f4489d7f9865e2(victim, inflictor) {
    var_dba6bbe47bd81571 = gettime() > victim._blackboard.var_dc51d4ea36da3ae1 + 1;
    victim._blackboard.var_dc51d4ea36da3ae1 = gettime();
    if (victim asmhaspainstate(victim.asmname) && var_dba6bbe47bd81571) {
        victim asmevalpaintransition(victim.asmname);
    }
    victim setscriptablepartstate("shockStickVfx", "vfx_start", 0);
    victim dodamage(1, victim.origin, inflictor, inflictor);
    wait(1);
    if (isdefined(victim)) {
        victim setscriptablepartstate("shockStickVfx", "off", 0);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x867d
// Size: 0x90
function function_e199f62146443082(victim) {
    victim namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(1);
    if (!victim getscriptablehaspart("shockStickVfx")) {
        return;
    }
    if (!victim getscriptableparthasstate("shockStickVfx", "vfx_start") || !victim getscriptableparthasstate("shockStickVfx", "off")) {
        return;
    }
    victim setscriptablepartstate("shockStickVfx", "vfx_start");
    wait(1);
    if (isalive(victim) && victim getscriptableparthasstate("shockStickVfx", "off")) {
        victim setscriptablepartstate("shockStickVfx", "off");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8714
// Size: 0x1c3
function function_d1ce7548ed380171(s_location, goal) {
    var_73f5a8fe44a61415 = getstructarray("merc_spawn", "targetname");
    s_location.var_93c2168553d13b2d = function_53c4c53197386572(s_location.var_93c2168553d13b2d, []);
    foreach (var_5883a55f39da8c48 in var_73f5a8fe44a61415) {
        if (isdefined(s_location) && !is_equal(var_5883a55f39da8c48.target, s_location.targetname)) {
            continue;
        }
        var_5502d8fb5a3b1365 = function_70a6287c1cf8575a(var_5883a55f39da8c48);
        if (isdefined(var_5502d8fb5a3b1365)) {
            var_28228966e06dbf17 = var_5883a55f39da8c48 merc_spawn(var_5502d8fb5a3b1365);
            s_location.var_93c2168553d13b2d = array_add(s_location.var_93c2168553d13b2d, var_28228966e06dbf17);
            if (isdefined(s_location) && is_equal(s_location.targetname, "fortified_building_roof")) {
                var_28228966e06dbf17 val::set("roof_mercs", "ignoreall", 1);
            }
            if (is_equal(var_5502d8fb5a3b1365, self.var_5f9a84079974ac46["sniper"])) {
                var_28228966e06dbf17 thread function_9081e87a119b8461(var_5883a55f39da8c48.origin);
            }
        }
    }
    var_2017958930cd9f59 = getstructarray("merc_spawn_group", "targetname");
    thread function_86c28451cc142efc(var_2017958930cd9f59, s_location, 0, 0.2, goal);
    var_ec790ba1c195fbdd = getstructarray("specialist_merc_spawn_group", "targetname");
    thread function_86c28451cc142efc(var_ec790ba1c195fbdd, s_location, 0, 0.2, goal);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88de
// Size: 0x67
function function_d63316812c3bc04b(s_location, goal) {
    var_2017958930cd9f59 = getstructarray("merc_reinforcement_group", "targetname");
    thread function_86c28451cc142efc(var_2017958930cd9f59, s_location, 1, 1);
    var_ec790ba1c195fbdd = getstructarray("specialist_merc_reinforcement_group", "targetname");
    thread function_86c28451cc142efc(var_ec790ba1c195fbdd, s_location, 1, 1, goal);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x894c
// Size: 0x28c
function function_86c28451cc142efc(var_73f5a8fe44a61415, s_location, var_e71ddf3aa77ad97c, time_between_spawns, goal) {
    var_d0f63fb382aff7a6 = [];
    if (!isdefined(time_between_spawns)) {
        time_between_spawns = 0.2;
    }
    foreach (var_5883a55f39da8c48 in var_73f5a8fe44a61415) {
        if (isdefined(s_location) && !is_equal(var_5883a55f39da8c48.target, s_location.targetname)) {
            continue;
        }
        n_spawns = 2;
        var_9e3cc96b3a2c2e2c = 200;
        if (is_equal(var_5883a55f39da8c48.script_noteworthy, "medium_group")) {
            n_spawns = 3;
            var_9e3cc96b3a2c2e2c = 300;
        } else if (is_equal(var_5883a55f39da8c48.script_noteworthy, "large_group")) {
            n_spawns = 4;
            var_9e3cc96b3a2c2e2c = 400;
        }
        a_spawn_structs = function_b584f143ed0ec5d0(var_5883a55f39da8c48.origin, n_spawns, var_9e3cc96b3a2c2e2c);
        foreach (spawn_struct in a_spawn_structs) {
            var_5502d8fb5a3b1365 = function_70a6287c1cf8575a(var_5883a55f39da8c48);
            var_28228966e06dbf17 = spawn_struct merc_spawn(var_5502d8fb5a3b1365);
            if (!isdefined(var_28228966e06dbf17)) {
                continue;
            }
            if (istrue(var_e71ddf3aa77ad97c)) {
                var_28228966e06dbf17 thread function_da159dba71d973c2(4000);
            }
            s_goal = goal;
            if (isarray(goal)) {
                s_goal = function_7a2aaa4a09a4d250(goal);
            }
            if (isdefined(s_goal)) {
                var_256ac12c1df1f01a = getclosestpointonnavmesh(s_goal.origin);
                var_28228966e06dbf17 setgoalpos(var_256ac12c1df1f01a, 64);
            }
            var_d0f63fb382aff7a6 = array_add(var_d0f63fb382aff7a6, var_28228966e06dbf17);
            if (isdefined(s_location) && is_equal(s_location.targetname, "fortified_building_roof")) {
                var_28228966e06dbf17 val::set("roof_mercs", "ignoreall", 1);
            }
            wait(time_between_spawns);
        }
    }
    if (isdefined(s_location)) {
        s_location.var_93c2168553d13b2d = function_53c4c53197386572(s_location.var_93c2168553d13b2d, []);
        s_location.var_93c2168553d13b2d = array_combine(s_location.var_93c2168553d13b2d, var_d0f63fb382aff7a6);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bdf
// Size: 0xd7
function function_70a6287c1cf8575a(var_5883a55f39da8c48) {
    if (isdefined(var_5883a55f39da8c48.script_noteworthy) && isdefined(self.var_5f9a84079974ac46[var_5883a55f39da8c48.script_noteworthy])) {
        return self.var_5f9a84079974ac46[var_5883a55f39da8c48.script_noteworthy];
    } else if (is_equal(var_5883a55f39da8c48.targetname, "merc_spawn_group") || is_equal(var_5883a55f39da8c48.targetname, "merc_reinforcement_group")) {
        return function_7a2aaa4a09a4d250(self.var_cd927c3a6d220500);
    } else if (is_equal(var_5883a55f39da8c48.targetname, "specialist_merc_spawn_group") || is_equal(var_5883a55f39da8c48.targetname, "specialist_merc_reinforcement_group")) {
        return function_7a2aaa4a09a4d250(self.var_bf4b0f953edcff84);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cbd
// Size: 0x84
function function_9081e87a119b8461(origin, n_radius) {
    self endon("death");
    self endon("combat");
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    if (isdefined(n_radius)) {
        n_goal_radius = n_radius;
    } else {
        n_goal_radius = 32;
    }
    while (1) {
        if (isdefined(origin) && distance2dsquared(origin, self.origin) > 4096) {
            namespace_2000a83505151e5b::function_304da84d9a815c01(origin, n_goal_radius, 1);
            self waittill("goal");
        }
        wait(2);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d48
// Size: 0x133
function function_1b4d007c48f6440d(s_location, goal, var_e71ddf3aa77ad97c, time_between_spawns) {
    var_3f99910e8c5521f6 = getstructarray("zombie_spawn", "targetname");
    foreach (var_95e63e107775e24d in var_3f99910e8c5521f6) {
        if (isdefined(s_location) && !is_equal(var_95e63e107775e24d.target, s_location.targetname)) {
            continue;
        }
        var_73a0f3ed96803f36 = function_ef4a8de5bdaaa4d9(var_95e63e107775e24d, s_location);
        if (isdefined(var_73a0f3ed96803f36)) {
            if (is_equal(var_73a0f3ed96803f36, self.var_2afbe67f5431e683["abomination"].subclass)) {
                continue;
            }
            var_ba8fbfcf0eef7a72 = var_95e63e107775e24d zombie_spawn(var_73a0f3ed96803f36, self, 1, s_location, 1);
        }
    }
    var_540ec2131784d958 = getstructarray("zombie_spawn_group", "targetname");
    thread function_e4fed48871c2e7df(var_540ec2131784d958, s_location, var_e71ddf3aa77ad97c, time_between_spawns, goal);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e82
// Size: 0x376
function function_e4fed48871c2e7df(var_3f99910e8c5521f6, s_location, var_e71ddf3aa77ad97c, time_between_spawns, goal, var_bb938d563589526c) {
    if (isdefined(s_location)) {
        s_location.var_af21537a6fa1e748 = [];
        s_location.var_af21537a6fa1e748[self.var_2afbe67f5431e683["hellhound"].subclass] = 0;
        s_location.var_af21537a6fa1e748[self.var_2afbe67f5431e683["armored_zombie"].subclass] = 0;
        s_location.var_af21537a6fa1e748[self.var_2afbe67f5431e683["base_zombie"].subclass] = 0;
        s_location.var_af21537a6fa1e748[self.var_2afbe67f5431e683["mangler"].subclass] = 0;
        s_location.var_af21537a6fa1e748[self.var_2afbe67f5431e683["disciple"].subclass] = 0;
        s_location.var_af21537a6fa1e748[self.var_2afbe67f5431e683["abomination"].subclass] = 0;
        s_location.var_af21537a6fa1e748["n_active_zombies"] = 0;
    }
    foreach (var_95e63e107775e24d in var_3f99910e8c5521f6) {
        if (isdefined(s_location) && !is_equal(var_95e63e107775e24d.target, s_location.targetname)) {
            continue;
        }
        n_spawns = 8;
        var_9e3cc96b3a2c2e2c = 200;
        if (is_equal(var_95e63e107775e24d.script_noteworthy, "medium_group") || is_equal(var_bb938d563589526c, "medium_group")) {
            n_spawns = 8;
            var_9e3cc96b3a2c2e2c = 200;
        } else if (is_equal(var_95e63e107775e24d.script_noteworthy, "large_group") || is_equal(var_bb938d563589526c, "large_group")) {
            n_spawns = 16;
            var_9e3cc96b3a2c2e2c = 400;
        } else if (is_equal(var_95e63e107775e24d.script_noteworthy, "horde") || is_equal(var_bb938d563589526c, "horde")) {
            n_spawns = 20;
            var_9e3cc96b3a2c2e2c = 700;
        }
        a_spawn_structs = function_b584f143ed0ec5d0(var_95e63e107775e24d.origin, n_spawns, var_9e3cc96b3a2c2e2c);
        foreach (spawn_struct in a_spawn_structs) {
            var_73a0f3ed96803f36 = function_ef4a8de5bdaaa4d9(var_95e63e107775e24d, s_location);
            var_ba8fbfcf0eef7a72 = spawn_struct zombie_spawn(var_73a0f3ed96803f36, self, 1, s_location);
            if (!isdefined(var_ba8fbfcf0eef7a72)) {
                continue;
            }
            if (istrue(var_e71ddf3aa77ad97c)) {
                var_ba8fbfcf0eef7a72 thread function_da159dba71d973c2(4000);
            }
            s_goal = goal;
            if (isarray(goal)) {
                s_goal = function_7a2aaa4a09a4d250(goal);
            }
            if (isdefined(s_goal)) {
                var_256ac12c1df1f01a = getclosestpointonnavmesh(s_goal.origin);
                var_ba8fbfcf0eef7a72 setgoalpos(var_256ac12c1df1f01a, 64);
            }
            time_between_spawns = function_53c4c53197386572(time_between_spawns, 0.2);
            wait(time_between_spawns);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91ff
// Size: 0x268
function function_ef4a8de5bdaaa4d9(var_95e63e107775e24d, s_location) {
    if (isdefined(var_95e63e107775e24d.script_noteworthy) && isdefined(self.var_2afbe67f5431e683[var_95e63e107775e24d.script_noteworthy])) {
        return self.var_2afbe67f5431e683[var_95e63e107775e24d.script_noteworthy].subclass;
    } else {
        result = function_3cdcca49a665bda6(self.var_2afbe67f5431e683["armored_zombie"].subclass, self.var_2afbe67f5431e683["armored_zombie"].chance, self.var_2afbe67f5431e683["armored_zombie"].var_3d028e278e3c71d8, s_location);
        if (istrue(result)) {
            return self.var_2afbe67f5431e683["armored_zombie"].subclass;
        }
        result = function_3cdcca49a665bda6(self.var_2afbe67f5431e683["hellhound"].subclass, self.var_2afbe67f5431e683["hellhound"].chance, self.var_2afbe67f5431e683["hellhound"].var_3d028e278e3c71d8, s_location);
        if (istrue(result)) {
            return self.var_2afbe67f5431e683["hellhound"].subclass;
        }
        result = function_3cdcca49a665bda6(self.var_2afbe67f5431e683["mangler"].subclass, self.var_2afbe67f5431e683["mangler"].chance, self.var_2afbe67f5431e683["mangler"].var_3d028e278e3c71d8, s_location);
        if (istrue(result)) {
            return self.var_2afbe67f5431e683["mangler"].subclass;
        }
        result = function_3cdcca49a665bda6(self.var_2afbe67f5431e683["disciple"].subclass, self.var_2afbe67f5431e683["disciple"].chance, self.var_2afbe67f5431e683["disciple"].var_3d028e278e3c71d8, s_location);
        if (istrue(result)) {
            return self.var_2afbe67f5431e683["disciple"].subclass;
        }
        return self.var_2afbe67f5431e683["base_zombie"].subclass;
    }
    return self.var_2afbe67f5431e683["base_zombie"].subclass;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x946f
// Size: 0x68
function function_3cdcca49a665bda6(subclass, chance, var_3d028e278e3c71d8, s_location) {
    var_706ac28aad002e10 = function_51d76700600cebe3(chance);
    if (istrue(var_706ac28aad002e10)) {
        if (isdefined(s_location) && isdefined(subclass) && s_location.var_af21537a6fa1e748[subclass] < var_3d028e278e3c71d8) {
            return 1;
        } else if (!isdefined(s_location)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94df
// Size: 0x3c
function merc_spawn(var_31109020393ed11b) {
    var_434d2faf62ed069 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, self.origin, self.angles, "team_hundred_ninety");
    if (isdefined(var_434d2faf62ed069)) {
        return var_434d2faf62ed069;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9522
// Size: 0x1c5
function zombie_spawn(var_d1e3b6ba5360f4e3, var_30c47c676d823fea, var_b5de2f493f49bdfb, s_location, var_f33a2acfcc2fd96e) {
    team = "team_two_hundred";
    aitypes = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc(var_d1e3b6ba5360f4e3);
    var_9f578d49d039394b = undefined;
    foreach (aitype in aitypes) {
        var_90906ae7ffd6dee3 = aitype.size;
        if (!isdefined(var_9f578d49d039394b) || var_9f578d49d039394b.size > var_90906ae7ffd6dee3) {
            var_9f578d49d039394b = aitype;
        }
    }
    ai_zombie = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_9f578d49d039394b, self.origin, self.angles, "team_two_hundred", "difficulty_yellow");
    if (isdefined(ai_zombie) && ai_zombie function_8fa69650e33c84ef("spawn") && !isdefined(var_b5de2f493f49bdfb)) {
        ai_zombie thread function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
    }
    waitframe();
    if (isalive(ai_zombie)) {
        ai_zombie namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
        if (is_equal(var_d1e3b6ba5360f4e3, "zombie_abom_mega_hvt")) {
            ai_zombie.var_20bed26d985c0b63 = 1;
        }
        ai_zombie.team = "team_two_hundred";
        var_9038e48904360a14 = "sprint";
        ai_zombie namespace_dd16d65e824b8e9::function_f1e5805da192a1ef(var_9038e48904360a14, "default", 26);
        ai_zombie thread zombie_death_watcher(var_d1e3b6ba5360f4e3, s_location);
        ai_zombie.var_c23519e9c077ebc = 1;
        if (isdefined(s_location) && !istrue(var_f33a2acfcc2fd96e)) {
            s_location.var_af21537a6fa1e748[var_d1e3b6ba5360f4e3]++;
        }
        return ai_zombie;
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96ee
// Size: 0x94
function function_9b03d4efc5c05c8e(var_b511c0101e1384b3) {
    a_spawn_structs = getstructarray("abom_wave_spawn", "script_noteworthy");
    spawn_struct = a_spawn_structs[0];
    var_e54860c37e7271a1 = spawn_struct zombie_spawn("zombie_abom_mega_hvt", self, 1, undefined, 1);
    var_e54860c37e7271a1.var_d243a619c1894518 = 1;
    var_e54860c37e7271a1._blackboard.var_1766d5cccf9b5670 = 0;
    var_e54860c37e7271a1 function_65cdab0fc78aba8f(self.var_1ff927c3faaf9638.origin, 3500);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9789
// Size: 0x95
function merc_attack() {
    self endon("death");
    self endon("clear_attack");
    self endon("goal");
    self.goalradius = randomintrange(800, 1500);
    while (1) {
        player = getclosest(self.origin, level.players);
        if (isalive(player)) {
            pos_on_navmesh = getclosestpointonnavmesh(player.origin);
            if (isdefined(pos_on_navmesh)) {
                self setgoalpos(pos_on_navmesh, 64);
                thread function_ea9c9fa94fbf39f1();
            }
        }
        wait(8);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9825
// Size: 0x23
function function_c4ca28aac25522a2(var_4af6417153ca0760) {
    self endon("quest_s0_act2_ended");
    level endon("game_ended");
    thread function_9bab1dc16b03d62d(var_4af6417153ca0760);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x984f
// Size: 0x321
function function_9bab1dc16b03d62d(var_4af6417153ca0760, var_3d028e278e3c71d8, time_between_spawns, a_spawn_structs) {
    self endon("quest_s0_act2_ended");
    self endon("device_detonated");
    level endon("game_ended");
    var_4af6417153ca0760.var_af21537a6fa1e748 = [];
    var_4af6417153ca0760.var_af21537a6fa1e748[self.var_2afbe67f5431e683["hellhound"].subclass] = 0;
    var_4af6417153ca0760.var_af21537a6fa1e748[self.var_2afbe67f5431e683["armored_zombie"].subclass] = 0;
    var_4af6417153ca0760.var_af21537a6fa1e748[self.var_2afbe67f5431e683["base_zombie"].subclass] = 0;
    var_4af6417153ca0760.var_af21537a6fa1e748[self.var_2afbe67f5431e683["mangler"].subclass] = 0;
    var_4af6417153ca0760.var_af21537a6fa1e748[self.var_2afbe67f5431e683["disciple"].subclass] = 0;
    var_4af6417153ca0760.var_af21537a6fa1e748[self.var_2afbe67f5431e683["abomination"].subclass] = 0;
    var_4af6417153ca0760.var_af21537a6fa1e748["n_active_zombies"] = 0;
    var_3d028e278e3c71d8 = var_4af6417153ca0760.var_3d028e278e3c71d8;
    time_between_spawns = var_4af6417153ca0760.time_between_spawns;
    a_spawn_structs = var_4af6417153ca0760.a_spawn_structs;
    var_4af6417153ca0760.var_634f3bec5d39faaf = 0;
    function_9b03d4efc5c05c8e(a_spawn_structs);
    self.var_2afbe67f5431e683["mangler"].var_3d028e278e3c71d8 = 0;
    self.var_2afbe67f5431e683["disciple"].var_3d028e278e3c71d8 = 0;
    self.var_2afbe67f5431e683["hellhound"].var_3d028e278e3c71d8 = 1;
    while (1) {
        elapsed_time = (gettime() - self.var_e504d983a6aa7dc2) / 1000;
        var_3d028e278e3c71d8 = 8;
        var_d8ef071103d43ca7 = elapsed_time / 60 * 100;
        if (var_d8ef071103d43ca7 > 33 && var_d8ef071103d43ca7 < 66) {
            var_3d028e278e3c71d8 = 15;
        } else if (var_d8ef071103d43ca7 > 66 && var_d8ef071103d43ca7 < 95) {
            var_3d028e278e3c71d8 = 20;
            self.var_2afbe67f5431e683["mangler"].var_3d028e278e3c71d8 = 1;
        } else if (var_d8ef071103d43ca7 > 95) {
            self.var_2afbe67f5431e683["mangler"].var_3d028e278e3c71d8 = 2;
            var_3d028e278e3c71d8 = 25;
        }
        if (var_4af6417153ca0760.var_af21537a6fa1e748["n_active_zombies"] < var_3d028e278e3c71d8) {
            var_73a0f3ed96803f36 = function_ef4a8de5bdaaa4d9(self, var_4af6417153ca0760);
            spawn_struct = function_7a2aaa4a09a4d250(a_spawn_structs);
            spawn_origin = getclosestpointonnavmesh(spawn_struct.origin);
            spawn_struct.origin = spawn_origin;
            var_ba8fbfcf0eef7a72 = spawn_struct zombie_spawn(var_73a0f3ed96803f36, self, 1, var_4af6417153ca0760);
            if (isdefined(var_ba8fbfcf0eef7a72)) {
                var_4af6417153ca0760.var_af21537a6fa1e748["n_active_zombies"]++;
                var_ba8fbfcf0eef7a72 thread function_da159dba71d973c2(4000);
            }
        }
        wait(time_between_spawns);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b77
// Size: 0x6f
function zombie_death_watcher(var_d1e3b6ba5360f4e3, s_location) {
    self waittill("death");
    if (isdefined(s_location)) {
        if (s_location.var_af21537a6fa1e748["n_active_zombies"] - 1 > 0) {
            s_location.var_af21537a6fa1e748["n_active_zombies"]--;
        }
        if (s_location.var_af21537a6fa1e748[var_d1e3b6ba5360f4e3] - 1 > 0) {
            s_location.var_af21537a6fa1e748[var_d1e3b6ba5360f4e3]--;
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bed
// Size: 0x29
function function_ea9c9fa94fbf39f1() {
    self notify("new_target");
    self endon("death");
    self endon("new_target");
    self waittill("goal");
    self notify("clear_attack");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c1d
// Size: 0xeb
function function_b584f143ed0ec5d0(origin, num_spots, n_radius) {
    var_f10d2bae0aa4fce7 = [];
    if (!isdefined(n_radius)) {
        n_radius = 100;
    }
    for (i = 0; i < num_spots; i++) {
        var_2a74fdb9fac967ff = randomintrange(n_radius * -1, n_radius + 1);
        var_2a74fcb9fac965cc = randomintrange(n_radius * -1, n_radius + 1);
        pos = origin + (var_2a74fdb9fac967ff, var_2a74fcb9fac965cc, 0);
        pos_on_navmesh = getclosestpointonnavmesh(pos);
        s_spot = spawnstruct();
        if (isdefined(s_spot)) {
            s_spot.origin = pos_on_navmesh;
            s_spot.angles = (0, 0, 0);
        }
        if (isdefined(pos_on_navmesh)) {
            var_f10d2bae0aa4fce7[var_f10d2bae0aa4fce7.size] = s_spot;
        }
    }
    return var_f10d2bae0aa4fce7;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d10
// Size: 0x2f
function function_da159dba71d973c2(n_radius) {
    self endon("death");
    while (1) {
        self function_65cdab0fc78aba8f(self.origin, n_radius);
        wait(3);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d46
// Size: 0x134
function map_transition(var_684092929dab076f, var_576f57af0204c38c, var_e115a5d733190f7d) {
    if (getmapname() == "mp_jup_st_a" || getmapname() == "mp_jup_resort_gw") {
        foreach (player in level.players) {
            player clearsoundsubmix("jup_ob_exfil_success");
        }
        level function_81e85bcedda2052();
        level.var_df433561007fc313 thread function_2b5a99c0dc3aaed8();
        function_55c4fd7594396e83(2);
        if (getdvarint(@"hash_70249f5c9fc86370", 0)) {
            level.var_df433561007fc313 notify("infil_done");
            level.var_df433561007fc313 flag_set("infil_done");
            level.var_df433561007fc313 flag_set("infil_chopper_destroyed");
            level.var_df433561007fc313 thread function_e22ffb38d3d9e977();
            return;
        }
        level.var_df433561007fc313 thread namespace_134d54e39331ee45::function_74139ae6c2c53345();
    } else {
        level thread namespace_bbc151ced3ff8d46::map_transition(var_684092929dab076f, var_576f57af0204c38c, var_e115a5d733190f7d);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e81
// Size: 0x5b
function function_e22ffb38d3d9e977() {
    self.a_s_player_spawns = getstructarray("quest_act2_player_spawn", "targetname");
    for (i = 0; i < level.players.size; i++) {
        thread function_2d3801c2a046fb52(level.players[i], self.a_s_player_spawns[i]);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ee3
// Size: 0x82
function function_2d3801c2a046fb52(player, var_c39e0eb8a05f57ae) {
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 1, 1);
    player.ignoreme = 1;
    player freezecontrols(1);
    wait(1);
    player setorigin(var_c39e0eb8a05f57ae.origin);
    player setplayerangles(var_c39e0eb8a05f57ae.angles);
    level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 0, 1);
    player.ignoreme = 0;
    player freezecontrols(0);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f6c
// Size: 0x162
function function_c6352d8194937a50() {
    target_location = (0, 0, 0);
    if (isdefined(self.var_3a7e8de43eccff16) && gettime() - self.var_3a7e8de43eccff16 < 3900) {
        wait(1.8);
    } else {
        wait(0.75);
    }
    level flag_clear("quest_infil_active");
    thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_infil_heli_takedown", level.players, 0.5, 1);
    if (isdefined(self.infil_chopper)) {
        target_struct = getstruct("kill_infil_chopper", "script_noteworthy");
        target_location = target_struct.origin;
        thread function_275c0bbd4aaf5929();
        foreach (samsite in self.var_cf3feeaa65a4e3f0) {
            samsite thread namespace_c5d39841678f2fb1::function_44e4433ebac52609(target_location, self.infil_chopper);
        }
    } else {
        self.a_s_player_spawns = getstructarray("quest_act2_player_spawn", "targetname");
        target_location = self.a_s_player_spawns[0].origin + (0, 0, 1000);
        flag_set("infil_chopper_destroyed");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0d5
// Size: 0x132
function function_275c0bbd4aaf5929() {
    self.infil_chopper endon("death");
    self.infil_chopper waittill("sam_missile_explode");
    flag_set("infil_chopper_destroyed");
    if (isarray(self.infil_chopper.var_b23e608ef55db7fa)) {
        foreach (pilot in self.infil_chopper.var_b23e608ef55db7fa) {
            pilot delete();
        }
    }
    foreach (player in level.players) {
        player stopsoundchannel("voice_radio_2d");
    }
    self.infil_chopper namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(1);
    self.infil_chopper namespace_5a0f3ca265d3a4c8::function_d0df49de517ded03();
    self.infil_chopper namespace_1f188a13f7e79610::vehicle_explode();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa20e
// Size: 0x1d9
function function_b61e551ad0e7bad9() {
    level notify("story_quest_complete_step_4");
    self.var_99626a64c1275340 = 1;
    namespace_262d6474998a2356::function_b8b15f7f0820954e(level.players);
    setmusicstate("");
    level.var_91a8c7abdf195c70 = 1;
    if (!getdvarint(@"hash_bc6484f2fc437a2d", 0)) {
        foreach (player in level.players) {
            if (isalive(player)) {
                thread function_e46fdb5c5c2231c7(player);
                player thread namespace_b8228ec48134f64::fade_out(1, "white");
            }
        }
        earthquake(0.25, 3, self.var_1ff927c3faaf9638.origin, 1750);
        playrumbleonposition("grenade_rumble", self.var_1ff927c3faaf9638.origin);
        wait(6.5);
        if (isdefined(self.var_1ff927c3faaf9638.payload)) {
            self.var_1ff927c3faaf9638.payload setscriptablepartstate("charge", "idle");
        }
        wait(0.3);
        foreach (player in level.players) {
            if (namespace_b3fcba693d3adc37::function_f3645fa4bfb45a97(player)) {
                player notify("last_stand_revived");
            }
            player setsoundsubmix("jup_ob_endgame");
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
        }
        play_movie("jup_ob_act2_cine_outro");
        level.var_91a8c7abdf195c70 = 0;
        level thread function_bf01aba31e9023d1(1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3ee
// Size: 0x40
function function_e46fdb5c5c2231c7(player) {
    player setscriptablepartstate("ob_quest_s0_act2_escort_neutralizer_fx", "neutralizer_explosion");
    wait(2);
    player freezecontrols(1);
    player.ignoreme = 1;
    player thread hidehudenable();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa435
// Size: 0x296
function play_movie(str_movie) {
    var_7848ff3f98ef4a73 = 0;
    var_8c6c2faac72ea626 = 10;
    var_4f105563ca74cf73 = str_movie;
    var_29d5d36a262c1250 = 144.5;
    var_1bab87417f147c8f = 0;
    foreach (player in level.players) {
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 1, 0.5);
        player.var_59e5ea44ba5aff1 = 1;
        player val::set("mission_cinematic", "ignoreme", 1);
        player val::set("mission_cinematic", "freezecontrols", 1);
        player val::set("mission_cinematic", "damage", 0);
        player val::set("mission_cinematic", "weapon", 0);
        player val::set("mission_cinematic", "breath_system", 0);
        player val::set("mission_cinematic", "cg_drawcrosshair", 0);
        player val::set("mission_cinematic", "show_weapon_hud", 0);
    }
    wait(0.75);
    foreach (player in level.players) {
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 0, 0);
        player thread namespace_b8228ec48134f64::fade_in(0, "white");
        player setclientomnvar("ui_br_bink_overlay_state", var_8c6c2faac72ea626);
        player utility::hidehudenable();
        player namespace_448ccf1ca136fbbe::function_a7634932f5d9565c(1, var_29d5d36a262c1250);
    }
    playcinematicforall(var_4f105563ca74cf73, 1, var_1bab87417f147c8f);
    wait(var_29d5d36a262c1250);
    foreach (player in level.players) {
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 1, 1);
    }
    wait(1);
    stopcinematicforall();
    foreach (player in level.players) {
        player setclientomnvar("ui_br_bink_overlay_state", var_7848ff3f98ef4a73);
    }
    wait(3);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6d2
// Size: 0x130
function function_758118f56eee7617() {
    a_ai = getaiarrayinradius(self.var_1ff927c3faaf9638.origin, 3500);
    var_6bfbb345d937798e = [];
    foreach (player in level.players) {
        foreach (ai in a_ai) {
            if (ai.team == player.team || ai.team == "neutral" || array_contains(var_6bfbb345d937798e, ai)) {
                continue;
            }
            var_6bfbb345d937798e = array_add(var_6bfbb345d937798e, ai);
        }
    }
    function_5a2c160d3a406b94(self.var_1ff927c3faaf9638.origin, var_6bfbb345d937798e, 1);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa809
// Size: 0x325
function function_5a2c160d3a406b94(var_f8307191d62cc285, var_e936931c04ab9b3c, var_8d1aa1efbf8b3c6e) {
    var_473ff5b31f1ed342 = array_removedead(var_e936931c04ab9b3c);
    var_473ff5b31f1ed342 = get_array_of_closest(var_f8307191d62cc285, var_473ff5b31f1ed342);
    var_f00cdf3d3bfc5a54 = [];
    foreach (ai in var_473ff5b31f1ed342) {
        if (!isalive(ai)) {
            continue;
        }
        b_skip = 0;
        if (istrue(ai.magic_bullet_shield)) {
            b_skip = 1;
        }
        if (istrue(ai.marked_for_death)) {
            b_skip = 1;
        }
        ai.marked_for_death = 1;
        if (!istrue(ai.var_9eb8bf12bddbe7f6)) {
            ai.var_9eb8bf12bddbe7f6 = 1;
            ai.no_powerups = 1;
            ai.var_7e4b076a06c6df27 = 1;
            ai.full_gib = 1;
            ai.var_745cd904c1ec804c = 1;
            var_f00cdf3d3bfc5a54 = array_add(var_f00cdf3d3bfc5a54, ai);
        }
    }
    var_60d4e0f1aeb32f84 = undefined;
    foreach (ai_killed in var_f00cdf3d3bfc5a54) {
        wait(randomfloatrange(0.05, 0.15));
        if (!isalive(ai_killed)) {
            continue;
        }
        if (istrue(ai_killed.magic_bullet_shield)) {
            continue;
        }
        var_bc8818c262ac2b04 = undefined;
        if (isdefined(ai_killed.aicategory) && !istrue(var_8d1aa1efbf8b3c6e)) {
            if (ai_killed.aicategory == "special") {
                var_bc8818c262ac2b04 = ai_killed.maxhealth * function_519d44e54a9b8ae5("nuke").var_74576b4dd247d7b1;
            } else if (ai_killed.aicategory == "elite" || ai_killed.aicategory == "boss") {
                var_bc8818c262ac2b04 = ai_killed.maxhealth * function_519d44e54a9b8ae5("nuke").var_e896465ad8ccd911;
            }
        }
        if (isdefined(var_bc8818c262ac2b04) && var_bc8818c262ac2b04 < ai_killed.health) {
            if (!isdefined(var_60d4e0f1aeb32f84)) {
                var_60d4e0f1aeb32f84 = spawn("script_model", var_f8307191d62cc285);
            }
            if (var_bc8818c262ac2b04 > 0) {
                ai_killed dodamage(int(var_bc8818c262ac2b04), ai_killed.origin, undefined, var_60d4e0f1aeb32f84, "MOD_UNKNOWN", "none", "none", undefined, 65536);
            }
            ai_killed.marked_for_death = 0;
            ai_killed.var_9eb8bf12bddbe7f6 = 0;
            ai_killed.var_745cd904c1ec804c = 0;
            ai_killed.no_powerups = 0;
            ai_killed.var_7e4b076a06c6df27 = 0;
            ai_killed.full_gib = 0;
        } else {
            ai_killed kill();
        }
    }
    if (isdefined(var_60d4e0f1aeb32f84)) {
        var_60d4e0f1aeb32f84 delete();
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab35
// Size: 0x58
function function_2a6c134406898721(params) {
    if (!isdefined(params.player)) {
        return;
    }
    level.var_9ec4962076db301b["s0_act2"].var_576f57af0204c38c = params.exfil_chopper;
    level flag_set("exfil_to_s0_act_2");
    level thread function_700e95e77f71e457(params);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab94
// Size: 0x6f
function function_700e95e77f71e457(params) {
    if (!isplayer(params.player)) {
        return;
    }
    var_684092929dab076f = [0:params.player];
    var_576f57af0204c38c = level.var_9ec4962076db301b["s0_act2"].var_576f57af0204c38c;
    level thread namespace_bbc151ced3ff8d46::map_transition(var_684092929dab076f, var_576f57af0204c38c, "s0_act2");
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac0a
// Size: 0x1d5
function function_55c4fd7594396e83(var_564a818d8229bb71) {
    setdvar(@"hash_37edd5a66bd29f3d", var_564a818d8229bb71);
    zombies = getaispeciesarray("all", "zombie");
    foreach (zombie in zombies) {
        var_4225006ce1ae149b = function_4d8bb2d866771a10(zombie.origin);
        zombie function_4a4fab5fd0b06d7b(var_4225006ce1ae149b);
    }
    if (isplayer(level.player)) {
        var_6e269a3fee5ff522 = function_688103a7b4041bf8(level.player.origin);
        if (isdefined(var_6e269a3fee5ff522) && isdefined(var_564a818d8229bb71)) {
            var_c82805c1c7fea0a5 = function_ae672f18c68bea59();
            if (isdefined(var_c82805c1c7fea0a5)) {
                var_1c734472f86fd46e = function_53c4c53197386572(var_c82805c1c7fea0a5[var_564a818d8229bb71], "difficulty_undefined");
                level.var_f756bf4293f67099[var_6e269a3fee5ff522] = var_1c734472f86fd46e;
                params = spawnstruct();
                params.player = level.player;
                params.var_6e269a3fee5ff522 = var_6e269a3fee5ff522;
                params.var_b3c05efa95c7895f = level.player.region;
                params.var_4225006ce1ae149b = var_1c734472f86fd46e;
                params.var_eb044317218e44d6 = level.player.difficulty;
                level.player.region = var_6e269a3fee5ff522;
                level.player.difficulty = var_1c734472f86fd46e;
                callback::callback("player_region_difficulty_change", params);
            }
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xade6
// Size: 0x1cf
function function_2b5a99c0dc3aaed8() {
    self.var_cd05af3824c52cde = getentitylessscriptablearray("mp_jup_st_a_ob_quest_set_dressing", "targetname");
    foreach (scriptable in self.var_cd05af3824c52cde) {
        if (isdefined(scriptable.script_noteworthy) && scriptable getscriptableparthasstate("body", scriptable.script_noteworthy)) {
            scriptable setscriptablepartstate("body", scriptable.script_noteworthy);
        }
    }
    var_b139ae25c4db8bbe = [];
    var_cfa15b0adac0f8bd = getstructarray("content_instance", "variantname");
    foreach (struct in var_cfa15b0adac0f8bd) {
        if (isdefined(struct.content_script_name) && struct.content_script_name == "loot_crystal") {
            if (isdefined(struct.var_305e36cbb51f88ce)) {
                spawn_points = struct.var_305e36cbb51f88ce["loot_crystal_spawn"];
            } else {
                spawn_points = getstructarray(struct.targetname, "target");
            }
            foreach (point in spawn_points) {
                point namespace_3bf3843b524af7bd::function_e87afa054556fca(point);
            }
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafbc
// Size: 0xf2
function function_d363528f975069cd() {
    while (1) {
        var_da3a55eabb666c32 = getaiarray("team_hundred_ninety");
        if (isdefined(var_da3a55eabb666c32) && var_da3a55eabb666c32.size) {
            break;
        }
        wait(0.1);
    }
    self.var_5ef3badcbe1b5057 = [];
    var_f75ab33b14599ef5 = getstructarray("sentry_mine", "targetname");
    foreach (var_46a34af7197a5a98 in var_f75ab33b14599ef5) {
        wait(randomfloat(1));
        mine = namespace_64135de19550f047::function_908ec13fb4d6cede(var_46a34af7197a5a98.origin, undefined, var_da3a55eabb666c32[0]);
        if (isdefined(mine)) {
            mine.allowfriendlyfire = 1;
            self.var_5ef3badcbe1b5057[self.var_5ef3badcbe1b5057.size] = mine;
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0b5
// Size: 0xf3
function function_d88d2af5d12ad7ac() {
    explosive_barrels = [];
    a_s_barrels = getstructarray("barrel_explosive", "targetname");
    foreach (s_barrel in a_s_barrels) {
        var_ca6d90a11ccbbf85 = spawnscriptable("barrel_toggleable_red", s_barrel.origin, s_barrel.angles);
        if (isdefined(var_ca6d90a11ccbbf85)) {
            if (isdefined(s_barrel.script_noteworthy)) {
                self.barrel_tunnel = var_ca6d90a11ccbbf85;
            }
            var_ca6d90a11ccbbf85 setscriptablepartstate("state", "healthy");
            if (isdefined(s_barrel.script_noteworthy) && s_barrel.script_noteworthy == "rooftop_barrel") {
                explosive_barrels[explosive_barrels.size] = var_ca6d90a11ccbbf85;
            }
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1af
// Size: 0xa5
function function_7c5122b771e3b136() {
    a_s_keys = getstructarray("turret_trap_key", "targetname");
    foreach (s_key in a_s_keys) {
        var_cdb87a0f2b9aece5 = function_962b0a5c4028e615();
        var_bbc56c643fd5a7a9 = function_38e113a4c30f6c0d(var_cdb87a0f2b9aece5, s_key.origin, (0, 0, 0), 0, 1, 1, 1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb25b
// Size: 0x4c
function function_962b0a5c4028e615() {
    var_bfb567bc6dd16556 = [0:"obloot_valuable_turret_trap_circuit", 1:"obloot_valuable_turret_trap_circuit_brainrot", 2:"obloot_valuable_turret_trap_circuit_cryofreeze", 3:"obloot_valuable_turret_trap_circuit_deadwire", 4:"obloot_valuable_turret_trap_circuit_napalmburst", 5:"obloot_valuable_turret_trap_circuit_shatterblast"];
    return function_7a2aaa4a09a4d250(var_bfb567bc6dd16556);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2af
// Size: 0x140
function function_9cf8db85d41361b9() {
    var_3182fc198eec14cc = getstructarray("mimic_spawn_airdrop", "script_noteworthy");
    var_169015c2e960b106 = getstructarray("mimic_spawn_merc_camp", "script_noteworthy");
    var_6133cb764bf7c492 = getstructarray("mimic_spawn_zombified_camp", "script_noteworthy");
    var_b98c296dcdc1e367 = getstructarray("mimic_spawn_defend", "script_noteworthy");
    var_b3a793c70e4f3186 = array_combine(var_3182fc198eec14cc, var_169015c2e960b106, var_6133cb764bf7c492, var_b98c296dcdc1e367);
    foreach (spawn_pt in var_b3a793c70e4f3186) {
        var_9ea479f7a07714a9 = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("zombie_mimic")[0];
        ai_mimic = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_9ea479f7a07714a9, spawn_pt.origin, spawn_pt.angles, "team_two_hundred");
        if (isdefined(ai_mimic)) {
            ai_mimic namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_normal");
            namespace_6119efd5d1925c17::function_232cabbc43f9536(spawn_pt.origin, ai_mimic, spawn_pt, 0, 200, &function_e8ab086d51573a1d);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3f6
// Size: 0x303
function function_e8ab086d51573a1d() {
    prop_height = (0, 0, 64);
    players = namespace_e47104b48662385b::getplayersinradius(self.origin, 150);
    if (players.size) {
        foreach (player in players) {
            if (!isalive(player)) {
                continue;
            }
            if (istrue(player.ignoreme) || istrue(player.inlaststand)) {
                continue;
            }
            /#
                if (getdvarint(@"hash_821690ed248715f7", 0)) {
                    sphere(player.origin, 20, (0, 1, 0), 0, 1, 1);
                }
            #/
            if (isdefined(player.last_valid_position) && isdefined(self.var_599dd4f330308ca3)) {
                if (!trace::ray_trace_passed(player.last_valid_position, self.var_599dd4f330308ca3, [0:self], trace::create_default_contents(1))) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(player.last_valid_position, self.var_599dd4f330308ca3, (0, 1, 1), 1, 0, 1);
                            sphere(self.var_599dd4f330308ca3, 20, (1, 0, 0), 0, 1, 1);
                        }
                    #/
                    continue;
                }
            } else {
                var_dace4b70df8d5f18 = player gettagorigin("j_spine4");
                var_dace4b70df8d5f18 = utility::function_53c4c53197386572(var_dace4b70df8d5f18, player getcentroid());
                if (isdefined(var_dace4b70df8d5f18) && !sighttracepassed(self.origin + prop_height, var_dace4b70df8d5f18, 0, self)) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(self.origin + prop_height, player gettagorigin("final_destination"), (1, 1, 0), 1, 0, 1);
                        }
                    #/
                    continue;
                }
            }
            traceresult = playerphysicstrace(self.origin + (0, 0, 20), player.origin + (0, 0, 36), player, undefined, self, 1);
            if (traceresult["fraction"] >= 1) {
                self notify("stop_shake_tell");
                return player;
            } else {
                /#
                    if (getdvarint(@"hash_821690ed248715f7", 0)) {
                        line(self.origin + (0, 0, 8), player.origin + (0, 0, 8), (1, 0, 0), 1, 0, 1);
                        sphere(traceresult[""], 4, (1, 0, 0), 1, 0, 10, 1);
                    }
                #/
            }
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb700
// Size: 0x8b
function function_ca13228a501ce246() {
    var_90d87894eec8dade = getstructarray("quest_turret_trap_spawn", "targetname");
    foreach (var_b0ca64baf1252b0d in var_90d87894eec8dade) {
        namespace_47d96238dd467828::function_936a5eebf22b23e1(var_b0ca64baf1252b0d.script_noteworthy, var_b0ca64baf1252b0d.origin, var_b0ca64baf1252b0d.angles);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb792
// Size: 0x9f
function function_5734daa7a8ef6bd() {
    var_77ae610b84ee2e95 = getstructarray("ammo_restock", "targetname");
    foreach (var_94050959266e1ba9 in var_77ae610b84ee2e95) {
        var_28b750103c3b51fb = spawnscriptable("military_ammo_restock_noent", var_94050959266e1ba9.origin, var_94050959266e1ba9.angles);
        var_28b750103c3b51fb setscriptablepartstate("military_ammo_restock", "useable_on");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb838
// Size: 0x266
function function_804aa1cbd49ba400(a_s_pos, var_3db5d03d7aac2a57) {
    self.var_da3a55eabb666c32 = [];
    foreach (s_pos in a_s_pos) {
        s_pos.spawndata = spawnstruct();
        s_pos.spawndata.origin = s_pos.origin;
        s_pos.spawndata.angles = s_pos.angles;
        s_pos.spawndata.spawntype = "GAME_MODE";
        s_pos.spawndata.var_22aa4aa0cf0aa6bb = 1;
        s_pos.var_c0bd36d87d262001 = namespace_1f188a13f7e79610::vehicle_spawn("veh_jup_blima_anim_infil", s_pos.spawndata);
        if (isdefined(s_pos.var_c0bd36d87d262001)) {
            namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(s_pos.var_c0bd36d87d262001);
            s_pos.var_c0bd36d87d262001.var_1e897ae1c018b2c2 = "team_hundred_ninety";
            s_pos.var_c0bd36d87d262001.unload_land_offset = 255;
            s_pos.var_c0bd36d87d262001.script_disconnectpaths = 1;
            s_pos.var_c0bd36d87d262001.vehiclesetuprope = 1;
            s_pos.var_c0bd36d87d262001.ignorelist = [0:s_pos.var_c0bd36d87d262001];
            s_pos.var_c0bd36d87d262001 vehicle_setspeed(60, 10, 8);
            s_pos.var_c0bd36d87d262001 setvehgoalpos(s_pos.var_c0bd36d87d262001.origin, 1);
            s_pos.var_c0bd36d87d262001.s_quest = self;
            if (isdefined(var_3db5d03d7aac2a57)) {
                s_pos.var_c0bd36d87d262001 function_c776ee14bbf6320e(self, getstruct(s_pos.target, "targetname"));
            } else {
                s_pos.var_c0bd36d87d262001 thread function_514f522c0fd10ad7(self, getstruct(s_pos.target, "targetname"));
            }
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbaa5
// Size: 0x129
function function_514f522c0fd10ad7(s_quest, s_goal) {
    self endon("death");
    self.var_f585b76d7f472cd9 = [];
    var_484b5018c84aac25 = 0;
    var_4661c9a486253047 = [0:"jup_ob_enemy_basic_soldier_long", 1:"jup_ob_enemy_basic_soldier_short", 2:"jup_ob_enemy_basic_specialforce_long"];
    var_2ac677774b7330eb = 6;
    for (i = 0; i < var_2ac677774b7330eb; i++) {
        var_31109020393ed11b = function_7a2aaa4a09a4d250(var_4661c9a486253047);
        if (var_31109020393ed11b == "jup_ob_enemy_basic_specialforce_long") {
            var_484b5018c84aac25++;
            if (var_484b5018c84aac25 > 2) {
                var_31109020393ed11b = "jup_ob_enemy_basic_soldier_long";
            }
        }
        var_434d2faf62ed069 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, self.origin, self.angles, "team_hundred_ninety");
        if (isdefined(var_434d2faf62ed069)) {
            var_434d2faf62ed069.ignore_nuke = 1;
            s_quest.var_da3a55eabb666c32[s_quest.var_da3a55eabb666c32.size] = var_434d2faf62ed069;
            self.var_f585b76d7f472cd9[i] = var_434d2faf62ed069;
        }
        waitframe();
    }
    namespace_5d57e6b81b105f5d::function_35c699c709e24b69(self.var_f585b76d7f472cd9);
    function_c776ee14bbf6320e(s_quest, s_goal);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbd5
// Size: 0x17b
function function_c776ee14bbf6320e(s_quest, s_goal) {
    self vehicle_setspeed(60, 10, 8);
    while (1) {
        if (isdefined(s_goal.script_noteworthy) && s_goal.script_noteworthy == "drop_off") {
            self setgoalyaw(flat_angle(s_goal.angles)[1]);
            self sethoverparams(0);
            heli_unload(s_quest, s_goal);
            self cleargoalyaw();
        } else {
            if (isdefined(s_goal.script_noteworthy)) {
                if (s_goal.script_noteworthy == "approach") {
                    self setvehgoalpos(s_goal.origin, 1);
                }
            } else {
                self setvehgoalpos(s_goal.origin, 0);
            }
            self waittill("goal");
        }
        if (isdefined(s_goal.target)) {
            s_goal = getstruct(s_goal.target, "targetname");
        } else {
            break;
        }
    }
    var_f585b76d7f472cd9 = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(self, 0);
    foreach (ai_rider in var_f585b76d7f472cd9) {
        if (isalive(ai_rider)) {
            ai_rider kill();
        }
    }
    namespace_5a0f3ca265d3a4c8::function_d0df49de517ded03();
    namespace_1f188a13f7e79610::vehicle_explode();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd57
// Size: 0x57
function smoke_screen(v_pos, wait_time) {
    if (!isdefined(wait_time)) {
        wait_time = 6.25;
    }
    wait(wait_time);
    magicgrenademanual("smoke_grenade_mp", v_pos, (0, 0, -10), 0.5);
    thread play_sound_in_space("smoke_grenade_expl_trans", self.origin);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdb5
// Size: 0xff
function heli_unload(s_quest, s_loc) {
    self setvehgoalpos(s_loc.origin, 1);
    self waittill("goal");
    thread smoke_screen(s_loc.origin - (0, 0, 165));
    if (isdefined(s_quest) && is_equal(s_quest.var_c0d9c77ae12d6f6a, 2)) {
        thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s0_a2t6_secure_vehicle_fletcher", level.players, 3.75);
    }
    var_b3941e6a151cf4d2 = namespace_b479ac682b93cd92::_vehicle_unload();
    self waittill("unloaded");
    foreach (guy in var_b3941e6a151cf4d2) {
        guy.var_f327ed481efe4857 = undefined;
        guy.ignore_nuke = 0;
    }
    return var_b3941e6a151cf4d2;
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbebc
// Size: 0x4e
function oob_triggers() {
    flag_wait("infil_done");
    level.outofboundstriggers = getentarray("OutOfBounds_ob_story", "targetname");
    if (is_equal(level.outofboundstriggers.size, 0)) {
        return;
    }
    level notify("switch_oob");
    waitframe();
    level thread namespace_d9c77dc2a6fe29c6::watchoobtriggers();
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf11
// Size: 0xa9
function function_5456c2f668331413() {
    level endon("game_ended");
    self endon("quest_s0_act2_ended");
    while (1) {
        var_49cb083164816cef = 0;
        foreach (player in level.players) {
            if (isalive(player)) {
                var_49cb083164816cef++;
            }
        }
        if (is_equal(var_49cb083164816cef, 0)) {
            thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_squad_death", level.players, 0, 1);
            return;
        }
        wait(0.1);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfc1
// Size: 0xa2
function function_8751cff989bde6a0(instance, player, edgeindex, isinverted, var_7a117370745e5467, var_7bd9fd9d3e7c7aa) {
    if (!isdefined(player)) {
        return;
    } else if (isdefined(level.var_df433561007fc313)) {
        level.var_df433561007fc313 function_1fe2872f343ce025(player, 0);
        if (!istrue(level.var_df433561007fc313.var_d81c040f57ae057c)) {
            level.var_df433561007fc313.var_d81c040f57ae057c = 1;
            thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_fortified_building_ascender", level.players, 0, 1);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc06a
// Size: 0x11e
function function_1fe2872f343ce025(player, b_show) {
    if (isplayer(player) && !istrue(player.var_37d73912ee023d9b) && isarray(self.var_942160dfc85d052)) {
        foreach (var_be93d3e51d75015 in self.var_942160dfc85d052) {
            objective_removeclientfrommask(var_be93d3e51d75015, player);
            waitframe();
            player.var_37d73912ee023d9b = 1;
            foreach (player_check in level.players) {
                if (!is_equal(player, player_check) && !istrue(player_check.var_37d73912ee023d9b)) {
                    objective_addclienttomask(var_be93d3e51d75015, player_check);
                }
            }
            objective_showtoplayersinmask(var_be93d3e51d75015);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc18f
// Size: 0xd5
function function_235944ad0915efdb(player, b_show, var_c2ad03705a55df) {
    if (!isdefined(var_c2ad03705a55df)) {
        var_c2ad03705a55df = 0;
    }
    if (istrue(player.var_8cb20a51c7ff105e)) {
        return;
    }
    player.var_8cb20a51c7ff105e = 1;
    if (isarray(self.var_79c8996a40bba4ae)) {
        foreach (var_1d396dde0a025645 in self.var_79c8996a40bba4ae) {
            objective_addclienttomask(var_1d396dde0a025645, player);
            objective_showtoplayersinmask(var_1d396dde0a025645);
        }
    }
    if (istrue(var_c2ad03705a55df) && !istrue(player.var_37d73912ee023d9b)) {
        wait(0.1);
        thread function_1fe2872f343ce025(player, 0);
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc26b
// Size: 0x6e
function function_9aa696b9bad4fdc9() {
    if (isarray(self.var_942160dfc85d052)) {
        foreach (var_be93d3e51d75015 in self.var_942160dfc85d052) {
            if (isdefined(var_be93d3e51d75015)) {
                namespace_6c8a837ec98fe0b8::returnobjectiveid(var_be93d3e51d75015);
            }
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2e0
// Size: 0x65
function function_f5c999e269f92619(s_notify) {
    self.var_1ff927c3faaf9638 endon("death");
    self endon(s_notify);
    while (1) {
        wait(1);
        if (isdefined(self.var_1ff927c3faaf9638)) {
            self.var_1ff927c3faaf9638 setscriptablepartstate("rear_light", "countdown");
            self.var_1ff927c3faaf9638 thread function_cd87cff6a50ddde(0.5);
        }
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc34c
// Size: 0x30
function private function_cd87cff6a50ddde(n_delay) {
    self endon("death");
    if (isdefined(n_delay)) {
        wait(n_delay);
    }
    if (isdefined(self)) {
        self setscriptablepartstate("rear_light", "off");
    }
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc383
// Size: 0x95
function function_bf01aba31e9023d1(var_3aa0162eb497c8a7) {
    if (!istrue(var_3aa0162eb497c8a7)) {
        foreach (player in level.players) {
            player thread namespace_b3f32c8cb80b8124::function_5751d00ce46557da(0);
        }
        level thread namespace_d576b6dc7cef9c62::endgame("none", game["end_reason"]["objective_failed"]);
        return;
    }
    level notify("game_ended_story_mission");
    namespace_134d54e39331ee45::function_bf01aba31e9023d1(1);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc41f
// Size: 0x52
function end_game() {
    wait(25);
    winning_team = "none";
    if (isdefined(level.players[0])) {
        winning_team = level.players[0].team;
    }
    thread namespace_d576b6dc7cef9c62::endgame(winning_team, game["end_reason"]["objective_completed"]);
}

// Namespace namespace_89d580f5dfa3808f/namespace_609a41b1d504a8a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc478
// Size: 0x37
function function_36451a8bfae75b4b() {
    /#
        params = [];
        params[0] = "fortified_building_entrance";
        params[1] = "samsite_bomb_planted";
        params[2] = "airdrop_location_merc_chopper";
        namespace_d1df78f2235ca173::function_ce34466b3cece887(params);
    #/
}

