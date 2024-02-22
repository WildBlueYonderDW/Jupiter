// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\hud_util.gsc;
#using script_5cda031797dce489;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_5bc60484d17fa95c;
#using script_3583ff375ab3a91e;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\objidpoolmanager.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br.gsc;
#using script_46fdf7b12c5f5620;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_publicevents.gsc;

#namespace namespace_55257b88b81678cd;

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101f
// Size: 0x461
function function_b7a198c3929006d7() {
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("prepGulagArena", &function_f4ac4c4f63924776);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("startGulagSequence", &function_8739234ffe5b08f5);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagKeyAcquired", &function_b5ec51ac542c7638);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("canPlayerSpectateGulag", &function_bb22cae6dd0b7899);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("shouldPlayerSpectateGulag", &function_1a16ae715c7d1d44);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagWinSequence", &function_669067932a658a0b);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagLoseSequence", &function_8fe77205a38f1c50);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("getArenaLoadout", &function_3cbf68ef6c5ca981);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagOnPlayerKilled", &function_ed93a4074bbf2e51);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagCanPlayerDropKey", &function_452ab051852e4df1);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagOvertimeStart", &function_7873119d67c51a6d);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagTrackPlayerBulletHitAI", &function_9b688cc3fce07e4f);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagTrackPlayerBulletHitPlayer", &function_9b688cc3fce07e4f);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetMatchDuration", &function_f0e6f4161c97d369);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetMaxPlayers", &function_ccad0db0adae4784);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagIsMatchPending", &function_4e8443eb7352ffd4);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetClosedCircleIndex", &function_50019571d7c08658);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetOvertimeLength", &function_f592babbd034685b);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetCountdownLength", &function_f12807f1bed9e2cb);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagIsOneTeamLeft", &function_86be51018a07870c);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagJailTimeout", &function_11b53584ec3dbc7b);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagLeftoverJailTimeout", &function_b628764ab30b26ce);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetVictoryWait", &function_dbee0792574758d3);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetPostVictoryWait", &function_4925efb18ecce08d);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulag_startWaitingStartTime", &function_9b2d3873cc90a014);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulag_initPlayerArena", &function_e552fdbccca8f866);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("onGulagJailTimeout", &function_1fc65ff42afbb7fc);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("setGulagJailTimeoutVariation", &function_7f7b72ed922a1c24);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("unsetGulagJailTimeoutVariation", &function_df994a817536ae7b);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("isGulagJailTimeoutVariation", &function_cf70188e00c433c4);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("setGulagVariationTeams", &function_90b1506ebceed929);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagOnPlayerDisconnect", &function_cfcc53a5d95fd20a);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagOrderArenaPlayers", &function_f8cbcfc051af262b);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagLostOverlay", &function_796bad56de4895fa);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetWinSplashName", &function_cea3949e01c439c6);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagJailRockAmount", &function_f1b80997f5c5a401);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagWatchPlayerDeath", &function_4fa43f06faeee96c);
    if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
        namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagHandleLossInfiniteLate", &function_ccf74b81f01f0bf1);
        namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagHandleLossInfiniteWatchDeath", &function_ccf74b81f01f0bf1);
    }
    namespace_eb17b46cdcb98eea::function_f6796774d7a9535b("gulag2v2Teams");
    level function_93add0b65db9f722(&function_c525d1df15d88a84);
    function_ed63c88560ad9ba9();
    level thread function_ecf124f447ced0aa();
    if (!isdefined(level.var_289df80e1ded586f)) {
        thread namespace_bfef6903bca5845d::init();
    }
    if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
        level thread function_d8668dbedd47d5de();
    }
    function_3b5e4d861cd09132(script_model%wz_gulag_player_acknowledge_r, "wz_gulag_player_acknowledge_r");
    function_3b5e4d861cd09132(script_model%wz_gulag_player_acknowledge_l, "wz_gulag_player_acknowledge_l");
    function_3b5e4d861cd09132(script_model%wz_gulag_player_acknowledge_r_pistol, "wz_gulag_player_acknowledge_r_pistol");
    function_3b5e4d861cd09132(script_model%wz_gulag_player_acknowledge_l_pistol, "wz_gulag_player_acknowledge_l_pistol");
    level thread function_25a296c2ed85e35f();
    level.var_f684d37d5503eeba = spawnstruct();
    level.var_f684d37d5503eeba.var_b61a334ec66db6a9 = getdvarint(@"hash_c973ffc21381cf54", 7);
    level.var_f684d37d5503eeba.var_1d8a378e37a1b6e5 = getdvarint(@"hash_c6069a2a8998f630", 16);
    level.var_f684d37d5503eeba.var_4bd43e30441ecbe3 = getdvarint(@"hash_40e04bb0cf289d6a", 0);
    level.var_f684d37d5503eeba.var_c47a1bff68eb4112 = getdvarint(@"hash_fcb9b4a4f5c268fa", 2);
    level.var_f684d37d5503eeba.var_d5a4802dae58c710 = getdvarint(@"hash_6a86d65c91d3cb93", 1);
    level.var_f684d37d5503eeba.var_b50451c7ab918479 = getdvarint(@"hash_fc598be0504b0679", 2);
    level.var_f684d37d5503eeba.var_399b78e251f76cb8 = getscriptbundle(getdvar(@"hash_49c6b2cc940a4bc5", "gulagcircleloadouts:jup_br_bigmap_gulag_circle_loadouts"));
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1487
// Size: 0x3c
function function_ed63c88560ad9ba9() {
    game["dialog"]["twotwo_gulag_jailer_dead"] = "fght_jalr_gujd";
    game["dialog"]["twotwo_gulag_allies_all_dead"] = "fght_jalr_gbad";
    game["dialog"]["twotwo_gulag_enemies_all_dead"] = "fght_jalr_gbed";
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ca
// Size: 0x52
function function_3b5e4d861cd09132(var_b1e6fbabce1a26ba, var_41503cd028efb569) {
    if (!isdefined(var_41503cd028efb569)) {
        return;
    }
    level.scr_animtree["player"] = %script_model;
    level.scr_anim["player"][var_41503cd028efb569] = var_b1e6fbabce1a26ba;
    level.scr_eventanim["player"][var_41503cd028efb569] = var_41503cd028efb569;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1523
// Size: 0x7c4
function function_ecf124f447ced0aa() {
    level waittill("prematch_done");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_door_dom_gulag", &function_15ae52c5e218380a);
    var_9f4b9fd336784c3b = 0;
    foreach (arena in level.gulag.arenas) {
        arena.var_cefc1bf41237bbac = [];
        arena.keys = [];
        arena.var_45e35b44ec23ab43 = [];
        arena.var_62d1855d36cff5d2 = [];
        arena.var_1ed14283f14082ae = [];
        arena.var_6d4e3b180776136f = [];
        arena.var_2c4104d74359893b = [];
        arena.var_aeac6a7f3fb3167f = [];
        arena.var_601cd7609bcc2ec2 = [];
        arena.var_2a7e62879a75ffe = [];
        arena.var_49e6d5114201a22b = [];
        arena.var_c8ada8b232d73a0a = [];
        arena.var_79f102b3abcc6f8a = [];
        arena.var_5b4f59070035f64e = [];
        arena.var_6f46a87c5570deab = undefined;
        arena.var_198c1cb09f6dbfb1 = undefined;
        arena.id = var_9f4b9fd336784c3b;
        var_9f4b9fd336784c3b++;
        if (level.var_43307855f189eb31.var_732a414f682801cc) {
            arena.var_62d1855d36cff5d2 = [];
        }
        var_bb81957d1ae1cf3a = getstructarray(arena.target, "targetname");
        foreach (var_bdf25d8a73ff7dad in var_bb81957d1ae1cf3a) {
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_dom_escape") {
                if (level.var_43307855f189eb31.var_7ca96b105dd358df == -1) {
                    if (!isdefined(var_bdf25d8a73ff7dad.script_parameters) || var_bdf25d8a73ff7dad.script_parameters != "center" || var_bdf25d8a73ff7dad.script_parameters == "center") {
                        function_889d1ac5ae186841(var_bdf25d8a73ff7dad);
                    }
                } else if (level.var_43307855f189eb31.var_7ca96b105dd358df == 1) {
                    if (!isdefined(var_bdf25d8a73ff7dad.script_parameters) || var_bdf25d8a73ff7dad.script_parameters != "center") {
                        function_889d1ac5ae186841(var_bdf25d8a73ff7dad);
                    } else {
                        function_9fb89c3e5e88656c(var_bdf25d8a73ff7dad, arena);
                    }
                } else if (level.var_43307855f189eb31.var_7ca96b105dd358df == 0) {
                    if (isdefined(var_bdf25d8a73ff7dad.script_parameters) && var_bdf25d8a73ff7dad.script_parameters == "center") {
                        function_889d1ac5ae186841(var_bdf25d8a73ff7dad);
                    } else {
                        function_9fb89c3e5e88656c(var_bdf25d8a73ff7dad, arena);
                    }
                }
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_legendary_loot_structs") {
                if (level.var_43307855f189eb31.var_cddd2b80c91e5cab != 0 && level.var_43307855f189eb31.var_cddd2b80c91e5cab < 0 || arena.keys.size < level.var_43307855f189eb31.var_cddd2b80c91e5cab) {
                    arena.keys[arena.keys.size] = spawnscriptable("second_chance_drive", var_bdf25d8a73ff7dad.origin);
                }
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_topdown_camera1" || var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_topdown_camera2") {
                arena.var_1ed14283f14082ae[arena.var_1ed14283f14082ae.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_jugg_spawn") {
                arena.var_79f102b3abcc6f8a[var_bdf25d8a73ff7dad.script_index] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_jugg_spawn_alt1") {
                arena.var_5b4f59070035f64e[arena.var_5b4f59070035f64e.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_jugg_intro" && getdvarint(@"hash_fbf0c13ab4a94311", 0)) {
                arena.var_198c1cb09f6dbfb1 = var_bdf25d8a73ff7dad;
                arena.var_945ac0df95f159b3 = spawn("script_model", arena.var_198c1cb09f6dbfb1.origin);
                arena.var_945ac0df95f159b3 setmodel("generic_prop_x3");
                if (isdefined(arena.var_198c1cb09f6dbfb1.angles)) {
                    arena.var_945ac0df95f159b3.angles = arena.var_198c1cb09f6dbfb1.angles;
                }
                arena.var_48404668e5582241 = spawn("script_model", arena.var_198c1cb09f6dbfb1.origin);
                arena.var_48404668e5582241 setmodel("door_industrial_metal_mp_01");
                arena.var_48404668e5582241 linkto(arena.var_945ac0df95f159b3, "j_prop_1", (0, 0, 0), (0, 0, 0));
                arena.var_48404368e5581ba8 = spawn("script_model", arena.var_198c1cb09f6dbfb1.origin);
                arena.var_48404368e5581ba8 setmodel("door_industrial_metal_mp_01");
                arena.var_48404368e5581ba8 linkto(arena.var_945ac0df95f159b3, "j_prop_2", (0, 0, 0), (0, 0, 0));
                arena.var_945ac0df95f159b3 scriptmodelplayanimdeltamotionfrompos("wz_gulag_jailer_enter_doors_a", arena.var_198c1cb09f6dbfb1.origin, arena.var_198c1cb09f6dbfb1.angles);
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_twotwo_spectator") {
                arena.var_9068d43c1f20d9f1 = var_bdf25d8a73ff7dad;
            }
            if (issubstr(var_bdf25d8a73ff7dad.script_noteworthy, "cashSpawn")) {
                arena.var_2c4104d74359893b[arena.var_2c4104d74359893b.size] = var_bdf25d8a73ff7dad;
            }
            if (issubstr(var_bdf25d8a73ff7dad.script_noteworthy, "itemSpawn")) {
                arena.var_aeac6a7f3fb3167f[arena.var_aeac6a7f3fb3167f.size] = var_bdf25d8a73ff7dad;
            }
            if (issubstr(var_bdf25d8a73ff7dad.script_noteworthy, "voucherSpawn")) {
                arena.var_601cd7609bcc2ec2[arena.var_601cd7609bcc2ec2.size] = var_bdf25d8a73ff7dad;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "aud_gulag_pa") {
                arena.var_6f46a87c5570deab = var_bdf25d8a73ff7dad;
                if (isvector(arena.var_6f46a87c5570deab.origin)) {
                    arena.var_5c21e504cdf8c47 = spawn("script_model", arena.var_6f46a87c5570deab.origin);
                }
            }
        }
        if (istrue(level.var_43307855f189eb31.var_e6b8a86f7f3d8b48)) {
            namespace_ad49798629176e96::function_da0a5d9a9fc8abc2(arena);
        }
        namespace_ad49798629176e96::function_6f05f895a3054ff0(arena);
        function_ab674fc3132afe8(arena);
        if (istrue(level.var_43307855f189eb31.var_b155c6403ae16b83)) {
            function_1b2e2fd7f80fdd0b(arena);
        }
        function_33c93a39c558a492(arena);
    }
    function_413a363a7b6e1bf4();
    function_9b254813c229a51c();
    /#
        level thread function_14d03f62839087b0();
        level thread function_1d5e2e0d6af328f7(90);
    #/
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cee
// Size: 0xb1
function function_889d1ac5ae186841(var_bdf25d8a73ff7dad) {
    var_a366308bf18a9167 = getstructarray(var_bdf25d8a73ff7dad.target, "targetname");
    foreach (var_5836bb6e49a3078e in var_a366308bf18a9167) {
        if (var_5836bb6e49a3078e.script_noteworthy == "gulag_dom_escape_doors") {
            var_3c865c6f7b13e400 = spawnscriptable("second_chance_door_dom_gulag", var_5836bb6e49a3078e.origin, var_5836bb6e49a3078e.angles);
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da6
// Size: 0x22f
function function_9fb89c3e5e88656c(var_bdf25d8a73ff7dad, arena) {
    arena.var_cefc1bf41237bbac[arena.var_cefc1bf41237bbac.size] = var_bdf25d8a73ff7dad;
    var_a366308bf18a9167 = getstructarray(var_bdf25d8a73ff7dad.target, "targetname");
    foreach (var_5836bb6e49a3078e in var_a366308bf18a9167) {
        if (var_5836bb6e49a3078e.script_noteworthy == "gulag_dom_escape_goal") {
            var_66be6e0502fcd39f = spawn("trigger_radius", var_5836bb6e49a3078e.origin, 0, var_5836bb6e49a3078e.radius, 9);
            arena.var_cefc1bf41237bbac[arena.var_cefc1bf41237bbac.size - 1].goalvolume = var_66be6e0502fcd39f;
            var_bdf25d8a73ff7dad thread function_740fbc412dff7c67(arena);
        }
        if (var_5836bb6e49a3078e.script_noteworthy == "gulag_dom_escape_doors") {
            if (!isdefined(arena.var_cefc1bf41237bbac[arena.var_cefc1bf41237bbac.size - 1].var_15fee21b382bfd2e)) {
                var_745bc2250ee77657 = spawnscriptable("second_chance_door_dom_gulag", var_5836bb6e49a3078e.origin, var_5836bb6e49a3078e.angles);
                var_745bc2250ee77657 setscriptablepartstate("second_chance_door_dom_gulag", "door_standing_still", 0);
                var_745bc2250ee77657.var_f590d44509c2e578 = var_745bc2250ee77657.origin;
                arena.var_cefc1bf41237bbac[arena.var_cefc1bf41237bbac.size - 1].var_15fee21b382bfd2e = var_745bc2250ee77657;
            } else {
                var_f43a6b24b1e03e21 = spawnscriptable("second_chance_door_dom_gulag", var_5836bb6e49a3078e.origin, var_5836bb6e49a3078e.angles);
                arena.var_cefc1bf41237bbac[arena.var_cefc1bf41237bbac.size - 1].var_9a86491b9a098194 = var_f43a6b24b1e03e21;
                var_f43a6b24b1e03e21.var_f590d44509c2e578 = var_f43a6b24b1e03e21.origin;
            }
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fdc
// Size: 0x317
function function_f4ac4c4f63924776(arena) {
    arena notify("arena_about_to_prep_for_next_match");
    level thread function_8cd391e5244b5670(arena);
    if (isdefined(arena.var_45e35b44ec23ab43) && arena.var_45e35b44ec23ab43.size > 0) {
        foreach (var_90c4543b2658d4ef in arena.var_45e35b44ec23ab43) {
            spawnscriptable("second_chance_drive", var_90c4543b2658d4ef);
        }
        arena.var_45e35b44ec23ab43 = [];
    }
    namespace_ad49798629176e96::function_15997d969114692d(arena);
    namespace_ad49798629176e96::function_394c37628afd48ef(arena);
    var_c00a2c6249962d83 = function_c3d75fb801e462f9(arena);
    arena.tablename = var_c00a2c6249962d83[2];
    arena.var_28ddcfcec434cbf5 = var_c00a2c6249962d83[1];
    arena.var_1003fa05cffaadcb = var_c00a2c6249962d83[0];
    function_5eaf324209d1c3f0();
    function_c724f178c2df7240("preLootSpawn", arena);
    function_144fc7f54908932f(arena);
    function_12801693c8c241bb(arena);
    function_687cfa994c08bada(arena);
    function_fcc8620f60ca604c(arena);
    function_b2d8f9adee070020(arena);
    if (level.var_f684d37d5503eeba.var_b50451c7ab918479 == 1) {
        function_d674739c4e4039b(arena);
    } else if (level.var_f684d37d5503eeba.var_b50451c7ab918479 == 2 && namespace_47fd1e79a44628cd::function_175e22055ae274a3("getEventSettings")) {
        event = namespace_47fd1e79a44628cd::function_d4b0eef0a0924094("getEventSettings", arena);
        if (isdefined(event)) {
            eventref = event.ref;
        }
        if (isdefined(eventref) && eventref == "cash_overflow") {
            function_d674739c4e4039b(arena, event.ref, "brloot_plunder_cash_epic_1");
        }
    }
    function_cc5468bb6e866411(arena);
    if (arena.arenaplayers.size > 2) {
        arena notify("gulag_about_to_start_camera_sequence");
        arena waittill("gulag_players_in_place_for_match_sequence");
    } else {
        thread function_731898ba8fc76e0f(arena);
    }
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player.var_4af73ce40a5d8572 = undefined;
        player.var_1578f3166bc6b5ae = [];
        player function_b9418a161c3b9ebd(arena);
    }
    if (arena.arenaplayers.size > 2) {
        foreach (p in arena.jailedplayers) {
            if (!isdefined(p)) {
                continue;
            }
            p thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_gulag_start_alert");
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22fa
// Size: 0x17
function function_731898ba8fc76e0f(arena) {
    wait(1);
    arena notify("gulag_about_to_start_camera_sequence");
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2318
// Size: 0x3fe
function function_8739234ffe5b08f5(arena) {
    level endon("game_ended");
    arena.var_2d0904da1ac3fb61 = undefined;
    if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena) && level.var_43307855f189eb31.var_cb1a9a6651a906df < 4) {
        var_6e5fdafe4800cd7d = "gulagai" + arena.gulagindex;
        var_1ce1b071385a88f0 = "gulagplayers" + arena.gulagindex;
        var_5c7f3cea21f3b966 = "gulagspectators" + arena.gulagindex;
        if (!threatbiasgroupexists(var_1ce1b071385a88f0)) {
            createthreatbiasgroup(var_1ce1b071385a88f0);
        }
        if (!threatbiasgroupexists(var_6e5fdafe4800cd7d)) {
            createthreatbiasgroup(var_6e5fdafe4800cd7d);
            setignoremegroup(var_5c7f3cea21f3b966, var_6e5fdafe4800cd7d);
            setthreatbias(var_6e5fdafe4800cd7d, var_1ce1b071385a88f0, 2000);
        }
        thread function_9a77e3aaa6da41c2(arena, var_6e5fdafe4800cd7d);
    }
    if (isdefined(arena.var_cefc1bf41237bbac)) {
        foreach (var_3ccb8742d21b61d7 in arena.var_cefc1bf41237bbac) {
            var_3ccb8742d21b61d7 thread function_740fbc412dff7c67(arena);
        }
    }
    if (level.var_43307855f189eb31.var_26f27e5acf1b3864) {
        namespace_ad49798629176e96::function_b57f39d9e91ebf95(arena);
    }
    if (level.var_43307855f189eb31.var_732a414f682801cc && isdefined(arena.var_62d1855d36cff5d2) && arena.var_62d1855d36cff5d2.size > 0) {
        namespace_ad49798629176e96::function_1794ec0dece12d2f(arena);
    }
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (istrue(level.var_43307855f189eb31.var_a30dc2ea18faa0aa)) {
            player.nocorpse = 1;
        }
        if (arena.arenaplayers.size < 4) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_one_v_one_gulag_start");
        } else {
            player thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_gulag_start");
        }
        player.var_32484cd3b17f16c8 = undefined;
        player.var_3a7c9a3e9aa20358 = undefined;
        player.var_d25277121d9d0a6c = undefined;
        player.var_322535086c0890fa = undefined;
        player.var_938604a8b5dd849 = undefined;
        player.var_e1ed3a7677ef1776 = undefined;
        if (isdefined(player.var_97ac1ea78faea6e3)) {
            player.var_97ac1ea78faea6e3 = undefined;
            arena.var_c83619011083e3c2 = 1;
        }
        player namespace_ad49798629176e96::function_63776b389e7c92c1();
        player function_720ef3a3e6616ab7(0);
        if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena) && level.var_43307855f189eb31.var_cb1a9a6651a906df < 4) {
            var_1ce1b071385a88f0 = "gulagplayers" + arena.gulagindex;
            player setthreatbiasgroup();
            player setthreatbiasgroup(var_1ce1b071385a88f0);
        }
        player thread gulagtwotwo_trackplayerbullets();
        player skydive_interrupt();
    }
    if (isdefined(arena.var_707537a8904aa962)) {
        arena.var_28a470799d66ecd7 = arena.var_707537a8904aa962.size;
    }
    if (isdefined(arena.arenaplayers)) {
        arena.var_b6b01621833467d1 = arena.arenaplayers.size;
    }
    foreach (p in arena.arenaplayers) {
        if (!isdefined(p)) {
            continue;
        }
        p setclientomnvar("ui_match_in_progress", 1);
        p setclientomnvar("ui_match_start_countdown", 0);
    }
    arena notify("ai_gulag_matchStarted");
    /#
        arena thread function_526dfbe9997544a0();
    #/
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x271d
// Size: 0x99
function function_9a77e3aaa6da41c2(arena, var_6e5fdafe4800cd7d) {
    arena endon("fight_over");
    arena endon("matchEnded");
    arena waittill("Jailer_Spawned");
    if (isdefined(arena.var_707537a8904aa962)) {
        foreach (ai in arena.var_707537a8904aa962) {
            if (isagent(ai)) {
                ai setthreatbiasgroup(var_6e5fdafe4800cd7d);
            }
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27bd
// Size: 0x16
function function_ccad0db0adae4784() {
    return level.var_f684d37d5503eeba.var_c47a1bff68eb4112;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27db
// Size: 0xa4
function function_4e8443eb7352ffd4(var_607899d4420fe1a5, arena) {
    if (level.var_43307855f189eb31.var_10c30e8082648b35 && isdefined(arena.var_654c981854394718)) {
        if (arena.var_654c981854394718.size < level.var_43307855f189eb31.var_bd9294679812b88) {
            return 0;
        } else {
            var_1ce522f5b914158b = function_53b2531fd0bb8f26(arena.var_654c981854394718);
            return var_1ce522f5b914158b;
        }
    } else if (var_607899d4420fe1a5.size < level.gulag.var_28f8483ea37164f3) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2886
// Size: 0xe3
function function_53b2531fd0bb8f26(match) {
    var_1ce522f5b914158b = 0;
    foreach (player in match) {
        if (!isdefined(player)) {
            continue;
        }
        foreach (p in match) {
            if (!isdefined(p)) {
                continue;
            }
            if (player == p) {
                continue;
            }
            if (player.team == p.team) {
                continue;
            }
            var_1ce522f5b914158b = 1;
            break;
        }
    }
    return var_1ce522f5b914158b;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2971
// Size: 0x205
function function_413a363a7b6e1bf4() {
    if (!isdefined(level.var_f684d37d5503eeba.var_6256525d35154bec)) {
        level.var_f684d37d5503eeba.var_6256525d35154bec = [];
    }
    var_db3353ae94adec9d = namespace_47fd1e79a44628cd::getgulagclosedcircleindex() + 1;
    if (var_db3353ae94adec9d <= 0) {
        if (namespace_36f464722d326bbe::islargemap()) {
            namespace_9c840bb9f2ecbf00::demoforcesre("[GULAG] gulagTwoTwo_createLoadoutsPerCircle found 0 circles in the big map with gulag enabled");
        }
        var_43d6dc988d95be39 = function_aca4803ab9e602fb();
        level.var_f684d37d5503eeba.var_6256525d35154bec = [0:[0:var_43d6dc988d95be39]];
        return;
    }
    var_e234adf4af953b2f = level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b.size;
    for (var_d280129509a08f5a = 0; var_d280129509a08f5a < var_db3353ae94adec9d; var_d280129509a08f5a++) {
        var_c606fb1446310a0d = [];
        for (i = 0; i < var_e234adf4af953b2f; i++) {
            if (level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b[i].var_43d6dc988d95be39 == "") {
                continue;
            }
            var_836a83c2bca261 = int(level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b[i].var_4a22f0da61f0c1cf);
            var_40899434bda1d462 = int(level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b[i].var_84697b290afa1bfa);
            if (var_d280129509a08f5a >= var_836a83c2bca261 && var_d280129509a08f5a <= var_40899434bda1d462) {
                var_c606fb1446310a0d[var_c606fb1446310a0d.size] = function_564cf344e6433ffc(i);
            }
        }
        if (var_c606fb1446310a0d.size == 0) {
            namespace_9c840bb9f2ecbf00::demoforcesre("[GULAG] gulagTwoTwo_createLoadoutsPerCircle found no valid loadouts for circle index : " + var_d280129509a08f5a);
            var_43d6dc988d95be39 = function_aca4803ab9e602fb();
            var_c606fb1446310a0d[var_c606fb1446310a0d.size] = var_43d6dc988d95be39;
        }
        level.var_f684d37d5503eeba.var_6256525d35154bec[level.var_f684d37d5503eeba.var_6256525d35154bec.size] = var_c606fb1446310a0d;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7d
// Size: 0x60
function function_564cf344e6433ffc(index) {
    tablename = "classtable:" + level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b[index].var_43d6dc988d95be39;
    var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(tablename);
    if (var_a300fa75277719ee > 0) {
        return tablename;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be4
// Size: 0x8a
function function_aca4803ab9e602fb() {
    var_76ec1eee373871ee = randomint(int(level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b.size));
    tablename = "classtable:" + level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b[var_76ec1eee373871ee].var_43d6dc988d95be39;
    var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(tablename);
    if (var_a300fa75277719ee > 0) {
        return tablename;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c75
// Size: 0x1f
function function_f0e6f4161c97d369(arena) {
    return getdvarfloat(@"hash_8be34599dfa102b8", 15);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9c
// Size: 0x47
function function_50019571d7c08658(offset) {
    return level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_1141fea0c6ef428f", level.gulag.var_3b466222a6fc9233) - offset;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ceb
// Size: 0x16
function function_f592babbd034685b() {
    return getdvarint(@"hash_1ff83f4f24656c5b", 15);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d09
// Size: 0x13
function function_f12807f1bed9e2cb() {
    return getdvarint(@"hash_fb05c5f6825931d", 8);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d24
// Size: 0x4
function function_86be51018a07870c() {
    return 0;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d30
// Size: 0x16
function function_11b53584ec3dbc7b() {
    return getdvarfloat(@"hash_e5f703a38f6e8043", 1);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4e
// Size: 0x16
function function_b628764ab30b26ce() {
    return getdvarfloat(@"hash_78b34f0755fae527", 94);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6c
// Size: 0x16
function function_dbee0792574758d3() {
    return getdvarfloat(@"hash_6b4dac9326512a03", 4);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8a
// Size: 0x16
function function_4925efb18ecce08d() {
    return getdvarfloat(@"hash_9e833e314c2b6fea", 7);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da8
// Size: 0x20
function function_9b2d3873cc90a014() {
    player = self;
    player.var_7af171f0ae71a689 = gettime();
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dcf
// Size: 0x37
function function_e552fdbccca8f866() {
    player = self;
    player.var_ad6498e5d4b1ae34 = gettime() - player.var_7af171f0ae71a689;
    player.var_7af171f0ae71a689 = undefined;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0d
// Size: 0x1a
function function_7f7b72ed922a1c24(arena) {
    arena.var_5f525e1e05714bb5 = 1;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2e
// Size: 0x26
function function_df994a817536ae7b(arena) {
    if (isdefined(arena.var_5f525e1e05714bb5)) {
        arena.var_5f525e1e05714bb5 = undefined;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5b
// Size: 0x23
function function_cf70188e00c433c4(arena) {
    if (istrue(arena.var_5f525e1e05714bb5)) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e85
// Size: 0x41c
function function_90b1506ebceed929() {
    arena = self;
    arena.var_801cdcfadc4d465c = [];
    arena.var_af5243fbba0720c2 = [];
    if (arena.arenaplayers.size > 2) {
        arena.var_801cdcfadc4d465c[arena.var_801cdcfadc4d465c.size] = arena.arenaplayers[0];
        arena.var_af5243fbba0720c2[arena.var_af5243fbba0720c2.size] = arena.arenaplayers[1];
        arena.var_af5243fbba0720c2[arena.var_af5243fbba0720c2.size] = arena.arenaplayers[2];
        arena.var_801cdcfadc4d465c[arena.var_801cdcfadc4d465c.size] = arena.arenaplayers[3];
        arena.arenaplayers[0].var_6d34bf5491ad7588 = 1;
        arena.arenaplayers[1].var_6d34bf5491ad7588 = 2;
        arena.arenaplayers[2].var_6d34bf5491ad7588 = 2;
        arena.arenaplayers[3].var_6d34bf5491ad7588 = 1;
        arena.arenaplayers[0].gulagloadoutindex = 1;
        arena.arenaplayers[1].gulagloadoutindex = 1;
        arena.arenaplayers[2].gulagloadoutindex = 2;
        arena.arenaplayers[3].gulagloadoutindex = 2;
        arena.arenaplayers[0].var_98482020d94dbd8 = 1;
        arena.arenaplayers[1].var_98482020d94dbd8 = 2;
        arena.arenaplayers[2].var_98482020d94dbd8 = 1;
        arena.arenaplayers[3].var_98482020d94dbd8 = 2;
        teamindex = arena.id * 2 + 1;
        arena.arenaplayers[0].var_b5091efefe8e436b = level.allteamnamelist[teamindex];
        arena.arenaplayers[1].var_b5091efefe8e436b = level.allteamnamelist[teamindex + 1];
        arena.arenaplayers[2].var_b5091efefe8e436b = level.allteamnamelist[teamindex + 1];
        arena.arenaplayers[3].var_b5091efefe8e436b = level.allteamnamelist[teamindex];
    } else {
        arena.var_801cdcfadc4d465c[arena.var_801cdcfadc4d465c.size] = arena.arenaplayers[0];
        arena.var_af5243fbba0720c2[arena.var_af5243fbba0720c2.size] = arena.arenaplayers[1];
        arena.arenaplayers[0].var_6d34bf5491ad7588 = 1;
        arena.arenaplayers[1].var_6d34bf5491ad7588 = 2;
        arena.arenaplayers[0].gulagloadoutindex = 1;
        arena.arenaplayers[1].gulagloadoutindex = 1;
        arena.arenaplayers[0].var_98482020d94dbd8 = 1;
        arena.arenaplayers[1].var_98482020d94dbd8 = 1;
        teamindex = arena.id * 2 + 1;
        arena.arenaplayers[0].var_b5091efefe8e436b = level.allteamnamelist[teamindex];
        arena.arenaplayers[1].var_b5091efefe8e436b = level.allteamnamelist[teamindex + 1];
    }
    namespace_ad49798629176e96::function_36c9dc5a1d1bb023(arena);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a8
// Size: 0xbf
function function_4fa43f06faeee96c(arena) {
    player = self;
    arena endon("matchEnded");
    player endon("disconnect");
    player endon("gulag_end");
    player endon("gulag_auto_win");
    player endon("gulagLost");
    level endon("game_ended");
    player waittill_any_2("death", "gulag_volume_win");
    player setclientomnvar("ui_br_twotwo_gulag_player_state", -1);
    var_e4c8a8dcd301ee41 = function_861c9ec1a22d6aa4(player);
    if (!isdefined(var_e4c8a8dcd301ee41)) {
        return;
    }
    player thread playersetwasingulag(1);
    player.var_797179ec3ae453f7 = gettime();
    fightover = player function_ef6ce7fd02518720(var_e4c8a8dcd301ee41, arena);
    player function_35f647c6340ceb22(var_e4c8a8dcd301ee41, arena);
    player thread function_556e62498ec825c5(fightover, arena);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336e
// Size: 0x107
function function_35f647c6340ceb22(var_e4c8a8dcd301ee41, arena) {
    player = self;
    foreach (p in var_e4c8a8dcd301ee41) {
        if (!isdefined(p) || p == player || !istrue(p.gulag)) {
            continue;
        }
        p playlocalsound("mp_bodycount_tick_negative_final");
    }
    var_8e28d3d3df9a6321 = function_488428f4237c7e87(player);
    foreach (p in var_8e28d3d3df9a6321) {
        if (!isdefined(p) || !istrue(p.gulag)) {
            continue;
        }
        p playlocalsound("mp_bodycount_tick_positive_final");
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347c
// Size: 0xce
function function_ef6ce7fd02518720(var_e4c8a8dcd301ee41, arena) {
    player = self;
    if (function_cf70188e00c433c4(arena) || var_e4c8a8dcd301ee41.size < 2) {
        return 1;
    }
    fightover = 0;
    foreach (p in var_e4c8a8dcd301ee41) {
        if (p == player) {
            continue;
        }
        if (!isdefined(p)) {
            fightover = 1;
        } else if (!isalive(p) || !istrue(p.gulag)) {
            fightover = 1;
        } else {
            p setclientomnvar("ui_br_twotwo_gulag_player_state", -1);
        }
    }
    return fightover;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3552
// Size: 0x316
function function_556e62498ec825c5(fightover, arena) {
    player = self;
    level endon("game_ended");
    var_4560e1f068a68f0 = undefined;
    if (isdefined(arena.var_af5243fbba0720c2)) {
        if (player.var_6d34bf5491ad7588 == 1) {
            var_4560e1f068a68f0 = arena.var_af5243fbba0720c2;
        } else {
            var_4560e1f068a68f0 = arena.var_801cdcfadc4d465c;
        }
    }
    if (fightover) {
        foreach (p in arena.arenaplayers) {
            if (!isdefined(p) || !isdefined(p.forcespectatorclient) || p.forcespectatorclient == -1) {
                continue;
            }
            p.forcespectatorclient = -1;
        }
        arena thread function_50fc80e21e19d442();
    }
    if (!isdefined(var_4560e1f068a68f0)) {
        return;
    }
    foreach (var_2b6c9e57c112f30 in var_4560e1f068a68f0) {
        if (!isdefined(var_2b6c9e57c112f30)) {
            continue;
        }
        if (!istrue(var_2b6c9e57c112f30.gulag)) {
            continue;
        }
        if (istrue(var_2b6c9e57c112f30.var_4af73ce40a5d8572)) {
            continue;
        }
        if (fightover) {
            var_2b6c9e57c112f30 function_dc0a56e258889cb(arena, "br_twotwo_gulag_win");
        } else if (istrue(level.var_f684d37d5503eeba.var_4bd43e30441ecbe3)) {
            var_2b6c9e57c112f30 thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_gulag_one_enemy_left");
        }
    }
    if (fightover) {
        arena notify("matchEnded");
        foreach (p in var_4560e1f068a68f0) {
            if (!isdefined(p)) {
                continue;
            }
            if (arena.arenaplayers.size > 2) {
                p thread namespace_391de535501b0143::killeventtextpopup(#"team_wiped", 0);
            }
            p thread namespace_ad49798629176e96::function_696f54da8fcb6bbe("twotwo_gulag_enemies_all_dead", arena);
        }
        var_d63ec8946a18fd86 = function_861c9ec1a22d6aa4(player);
        if (isdefined(var_d63ec8946a18fd86)) {
            if (var_d63ec8946a18fd86.size > 1) {
                var_d63ec8946a18fd86 = namespace_9c840bb9f2ecbf00::quicksort(var_d63ec8946a18fd86, &function_e4549da9da5cb20);
            }
            foreach (p in var_d63ec8946a18fd86) {
                if (!isdefined(p) || istrue(p.disconnecting)) {
                    continue;
                }
                p.var_797179ec3ae453f7 = undefined;
                if (istrue(p.var_4af73ce40a5d8572)) {
                    continue;
                }
                p thread namespace_ad49798629176e96::function_696f54da8fcb6bbe("twotwo_gulag_allies_all_dead", arena);
                p function_7aaf75a824252d97(arena, "br_twotwo_gulag_lost_death");
            }
        }
    }
    function_cc5468bb6e866411(arena);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386f
// Size: 0x2b
function function_e4549da9da5cb20(left, right) {
    return left.var_797179ec3ae453f7 <= right.var_797179ec3ae453f7;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a2
// Size: 0x154
function function_cfcc53a5d95fd20a() {
    player = self;
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena)) {
        return;
    }
    if (!isdefined(player.var_6d34bf5491ad7588)) {
        return;
    }
    foreach (p in arena.arenaplayers) {
        if (!isdefined(p)) {
            continue;
        }
        p function_6d217ba4de4b166b(arena);
        p function_fb51bdaa21d694e5(arena);
    }
    foreach (p in arena.jailedplayers) {
        if (!isdefined(p)) {
            continue;
        }
        p function_6d217ba4de4b166b(arena);
        p function_fb51bdaa21d694e5(arena);
    }
    var_e4c8a8dcd301ee41 = function_861c9ec1a22d6aa4(player);
    if (!isdefined(var_e4c8a8dcd301ee41)) {
        return;
    }
    fightover = player function_ef6ce7fd02518720(var_e4c8a8dcd301ee41, arena);
    player function_35f647c6340ceb22(var_e4c8a8dcd301ee41, arena);
    player thread function_556e62498ec825c5(fightover, arena);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39fd
// Size: 0xb0
function function_f8cbcfc051af262b(match) {
    if (match.size == 4) {
        var_6daf5c22abba2234 = undefined;
        var_ccfd4a1c9626f37c = 0;
        var_da4146d44a272f3a = 1;
        var_9e96035329b953b0 = 2;
        var_6daf5c22abba2234 = match[var_ccfd4a1c9626f37c] function_e7940d6d0cd7148a(match);
        if (isdefined(var_6daf5c22abba2234)) {
            match = match function_3682f0cc9e284d5b(var_ccfd4a1c9626f37c, var_6daf5c22abba2234);
            return match;
        } else {
            var_6daf5c22abba2234 = match[var_da4146d44a272f3a] function_e7940d6d0cd7148a(match);
        }
        if (isdefined(var_6daf5c22abba2234)) {
            match = match function_3682f0cc9e284d5b(var_da4146d44a272f3a, var_6daf5c22abba2234);
            return match;
        } else {
            var_6daf5c22abba2234 = match[var_9e96035329b953b0] function_e7940d6d0cd7148a(match);
        }
        if (!isdefined(var_6daf5c22abba2234)) {
            return match;
        } else {
            match = match function_3682f0cc9e284d5b(var_9e96035329b953b0, var_6daf5c22abba2234);
            return match;
        }
    } else {
        return match;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab4
// Size: 0x57
function function_796bad56de4895fa(player, var_40d8983fc5e5c7a5) {
    player endon("disconnect");
    player.var_4af73ce40a5d8572 = 1;
    splashname = "br_twotwo_gulag_lost_timeout";
    if (isdefined(var_40d8983fc5e5c7a5)) {
        splashname = var_40d8983fc5e5c7a5;
    }
    player thread namespace_44abc05161e2e2cb::showsplash(splashname);
    wait(3);
    player thread namespace_a9c534dc7832aba4::triggereliminatedoverlay();
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b12
// Size: 0x8
function function_cea3949e01c439c6() {
    return "br_twotwo_gulag_win";
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b22
// Size: 0x63
function function_f1b80997f5c5a401() {
    player = self;
    var_a1093166de09e6b8 = "brloot_rock";
    if (isdefined(level.var_275ee8bdb4df1f94)) {
        var_a1093166de09e6b8 = "brloot_snowball";
    }
    player namespace_1a507865f681850e::setequipmentammo(level.br_pickups.br_equipname[var_a1093166de09e6b8], level.var_43307855f189eb31.var_5bc7dbd34df10b08);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8c
// Size: 0x5a
function function_e7940d6d0cd7148a(match) {
    player = self;
    for (i = 0; i < match.size; i++) {
        if (player == match[i]) {
            continue;
        }
        if (player.team == match[i].team) {
            return i;
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bed
// Size: 0xa3
function function_3682f0cc9e284d5b(playerindex, teammateindex) {
    match = self;
    switch (playerindex) {
    case 0:
        var_6ce69d9dbe6a1f3a = match[teammateindex];
        match[teammateindex] = match[3];
        match[3] = var_6ce69d9dbe6a1f3a;
        return match;
    case 1:
        var_6ce69d9dbe6a1f3a = match[teammateindex];
        match[teammateindex] = match[2];
        match[2] = var_6ce69d9dbe6a1f3a;
        return match;
    case 2:
        var_6ce69d9dbe6a1f3a = match[teammateindex];
        match[teammateindex] = match[1];
        match[1] = var_6ce69d9dbe6a1f3a;
        return match;
    default:
        return match;
        break;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c97
// Size: 0x2b9
function function_b5ec51ac542c7638() {
    player = self;
    var_f9cd7fda74e92e2a = 8;
    var_e0e11f3b4551be11 = 1;
    var_30516b4afd1763de = 500;
    maxdistance = 25000;
    var_ee1c1550f39782c4 = "ui_map_icon_key_skeleton_green";
    var_1bf1eebcab47c063 = "ui_map_icon_key_skeleton_red";
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (isdefined(arena)) {
        var_efa74c6ecaaa78d0 = function_861c9ec1a22d6aa4(player);
        var_efa74c6ecaaa78d0 = array_remove(var_efa74c6ecaaa78d0, player);
        var_7b938c58658569df = function_488428f4237c7e87(player);
        headicon = player namespace_7bdde15c3500a23f::setheadicon_singleimage(var_efa74c6ecaaa78d0, var_ee1c1550f39782c4, var_f9cd7fda74e92e2a, var_e0e11f3b4551be11, maxdistance, var_30516b4afd1763de, undefined, 1, 1, undefined);
        foreach (p in var_efa74c6ecaaa78d0) {
            p thread function_5a150f2908a378cb(headicon, player);
            player thread function_e6c0858f7a0aac96(headicon, p);
        }
        headicon = player namespace_7bdde15c3500a23f::setheadicon_singleimage(var_7b938c58658569df, var_1bf1eebcab47c063, var_f9cd7fda74e92e2a, var_e0e11f3b4551be11, maxdistance, var_30516b4afd1763de, undefined, 1, 1, undefined);
        foreach (p in var_7b938c58658569df) {
            p thread function_5a150f2908a378cb(headicon, player);
            player thread function_e6c0858f7a0aac96(headicon, p);
        }
    }
    player.var_43b2a82936a5e974 = 1;
    player function_a7ec5e159ce62c68();
    var_1f058c408f19eddb = function_861c9ec1a22d6aa4(player);
    if (isdefined(var_1f058c408f19eddb)) {
        foreach (p in var_1f058c408f19eddb) {
            if (!isdefined(p)) {
                continue;
            }
            p thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_gulag_got_key_ally");
        }
    }
    var_a1ffa0e77f4ae724 = function_488428f4237c7e87(player);
    if (isdefined(var_a1ffa0e77f4ae724)) {
        foreach (p in var_a1ffa0e77f4ae724) {
            if (!isdefined(p)) {
                continue;
            }
            p thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_gulag_got_key_enemy");
        }
    }
    player setclientomnvar("ui_br_special_item_acquired", 1);
    if (isdefined(arena)) {
        namespace_ad49798629176e96::function_ba5dbc7633c84a(arena);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f57
// Size: 0x93
function function_a7ec5e159ce62c68() {
    player = self;
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    foreach (var_3ccb8742d21b61d7 in arena.var_cefc1bf41237bbac) {
        objective_addclienttomask(var_3ccb8742d21b61d7.objid, player);
        objective_showtoplayersinmask(var_3ccb8742d21b61d7.objid);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff1
// Size: 0x5b
function function_e6c0858f7a0aac96(headicon, var_ca5a607c4f7a315) {
    var_b37aef355ba7b694 = self;
    level endon("game_ended");
    var_ca5a607c4f7a315 endon("watchHeadIconDelete");
    waittill_any_ents(var_b37aef355ba7b694, "death", var_b37aef355ba7b694, "disconnect", var_b37aef355ba7b694, "gulag_end", var_b37aef355ba7b694, "gulagLost");
    if (!isdefined(var_b37aef355ba7b694)) {
        return;
    }
    removeclientfromheadiconmask(headicon, var_b37aef355ba7b694);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4053
// Size: 0x56
function function_5a150f2908a378cb(headicon, var_b37aef355ba7b694) {
    var_ca5a607c4f7a315 = self;
    level endon("game_ended");
    waittill_any_ents(var_ca5a607c4f7a315, "death", var_ca5a607c4f7a315, "disconnect", var_ca5a607c4f7a315, "gulag_end", var_ca5a607c4f7a315, "gulagLost");
    var_ca5a607c4f7a315 notify("watchHeadIconDelete");
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(headicon);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b0
// Size: 0xb8
function function_1a16ae715c7d1d44() {
    player = self;
    var_e4c8a8dcd301ee41 = function_861c9ec1a22d6aa4(player);
    if (!isdefined(var_e4c8a8dcd301ee41)) {
        return 0;
    }
    fightover = 0;
    foreach (p in var_e4c8a8dcd301ee41) {
        if (!isdefined(p)) {
            fightover = 1;
        } else {
            if (p == player) {
                continue;
            }
            if (!isalive(p) || !istrue(p.gulag)) {
                fightover = 1;
            }
        }
    }
    if (fightover) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x416f
// Size: 0x21c
function function_618bf5253a72136f() {
    player = self;
    player endon("disconnect");
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena) || !isdefined(arena.time)) {
        return;
    }
    if (arena.time < 5) {
        return;
    }
    player.var_36386f3f03c2ab4b = 1;
    player setclientdvar(@"hash_b21f1157c582ff15", 0);
    var_1f058c408f19eddb = function_861c9ec1a22d6aa4(player);
    playertospectate = undefined;
    foreach (p in var_1f058c408f19eddb) {
        if (!isdefined(p) || p == player) {
            continue;
        }
        playertospectate = p;
    }
    if (isdefined(playertospectate)) {
        player setclientomnvar("ui_show_spectateHud", playertospectate getentitynumber());
        player namespace_7e17181d03156026::updatesessionstate("dead");
        player.sessionstate = "dead";
        player setclientomnvar("ui_session_state", "spectator");
        if (!isdefined(arena.var_2bf44e032b5fcda1)) {
            arena = namespace_ad49798629176e96::function_2f4344abdc200e43(self);
            spawnpoint = arena.var_9068d43c1f20d9f1;
            camera = spawn("script_model", spawnpoint.origin);
            camera.angles = spawnpoint.angles;
            camera setmodel("tag_origin");
            arena.var_2bf44e032b5fcda1 = camera;
        }
        player cameralinkto(arena.var_2bf44e032b5fcda1, "tag_origin", 1, 1);
    }
    waittill_any_ents_or_timeout_return(arena.time, player, "stop_gulag_spectator", level, "game_ended");
    if (!isdefined(player)) {
        return;
    }
    player cameraunlink();
    player setclientdvar(@"hash_b21f1157c582ff15", 1);
    player.var_36386f3f03c2ab4b = undefined;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4392
// Size: 0x80
function function_b9418a161c3b9ebd(arena) {
    player = self;
    if (arena.arenaplayers.size > 2) {
        if (level.var_43307855f189eb31.var_4749a3b876804ae5 == 1) {
            player thread namespace_ad49798629176e96::function_63cef9bb6769f404(arena);
        } else if (level.var_43307855f189eb31.var_4749a3b876804ae5 == 2) {
            player thread namespace_ad49798629176e96::function_85b349978cd4de4f(arena);
        }
    } else {
        player thread namespace_ad49798629176e96::function_608e28250c9d63a9(arena);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4419
// Size: 0x84
function gulagtwotwo_trackplayerbullets() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("gulagTwoTwo_trackPlayerBullets");
    player endon("gulagTwoTwo_trackPlayerBullets");
    player endon("can_show_splashes");
    while (1) {
        objweapon = player waittill("weapon_fired");
        if (!isdefined(player.var_322535086c0890fa)) {
            player.var_322535086c0890fa = 0;
        }
        player.var_322535086c0890fa = player.var_322535086c0890fa + 1;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a4
// Size: 0xe7
function function_9b688cc3fce07e4f(eattacker, var_19ef223648735f8f) {
    if (isdefined(eattacker) && istrue(eattacker.gulag) && isplayer(eattacker)) {
        arena = namespace_ad49798629176e96::function_2f4344abdc200e43(eattacker);
        if (isdefined(arena)) {
            if (!isdefined(eattacker.var_d25277121d9d0a6c)) {
                eattacker.var_d25277121d9d0a6c = 0;
            }
            if (!isdefined(eattacker.var_322535086c0890fa)) {
                eattacker.var_322535086c0890fa = 1;
            }
            eattacker.var_d25277121d9d0a6c = min(eattacker.var_d25277121d9d0a6c + 1, eattacker.var_322535086c0890fa);
            if (isdefined(var_19ef223648735f8f)) {
                if (!isdefined(eattacker.var_a6e0850023a9d8f9)) {
                    eattacker.var_a6e0850023a9d8f9 = 0;
                }
                eattacker.var_a6e0850023a9d8f9 = eattacker.var_a6e0850023a9d8f9 + var_19ef223648735f8f;
            }
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4592
// Size: 0x82
function function_d8668dbedd47d5de() {
    level endon("game_ended");
    level waittill("prematch_done");
    wait(15);
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            continue;
        }
        player kill();
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x461b
// Size: 0x86
function function_740fbc412dff7c67(arena) {
    var_3ccb8742d21b61d7 = self;
    level endon("game_ended");
    while (1) {
        player = var_3ccb8742d21b61d7.goalvolume waittill("trigger");
        if (isdefined(player) && isplayer(player) && player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() && !istrue(player.var_4af73ce40a5d8572)) {
            if (istrue(var_3ccb8742d21b61d7.dooropen)) {
                player function_7c296b84f3f04cb5(arena);
            }
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a8
// Size: 0xe1
function function_15ae52c5e218380a(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(player) || !isplayer(player) || !player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() || istrue(player.var_4af73ce40a5d8572)) {
        return;
    }
    if (!istrue(player.var_43b2a82936a5e974)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/MISSING_GULAG_KEY");
        return;
    }
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena)) {
        return;
    }
    level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(player.origin + (0, 0, 150), "revive", 1);
    instance thread function_bca70e305fb00f25(arena);
    player setclientomnvar("ui_br_special_item_acquired", 0);
    player.var_43b2a82936a5e974 = undefined;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4790
// Size: 0x1a9
function function_bca70e305fb00f25(arena) {
    var_c1057221e17f180b = self;
    var_12db0fe9902cd14b = undefined;
    var_c1057221e17f180b notify("gulagDom_DoorOpened");
    var_c1057221e17f180b endon("gulagDom_DoorOpened");
    var_3ccb8742d21b61d7 = undefined;
    foreach (var_5836bb6e49a3078e in arena.var_cefc1bf41237bbac) {
        if (var_5836bb6e49a3078e.var_15fee21b382bfd2e == var_c1057221e17f180b) {
            var_3ccb8742d21b61d7 = var_5836bb6e49a3078e;
            var_12db0fe9902cd14b = var_5836bb6e49a3078e.var_9a86491b9a098194;
            break;
        } else if (var_5836bb6e49a3078e.var_9a86491b9a098194 == var_c1057221e17f180b) {
            var_3ccb8742d21b61d7 = var_5836bb6e49a3078e;
            var_12db0fe9902cd14b = var_5836bb6e49a3078e.var_15fee21b382bfd2e;
            break;
        }
    }
    if (!isdefined(var_3ccb8742d21b61d7)) {
        return;
    }
    var_3ccb8742d21b61d7.dooropen = 1;
    foreach (p in arena.arenaplayers) {
        if (!isdefined(p)) {
            continue;
        }
        if (isdefined(p.var_c1057221e17f180b) && p.var_c1057221e17f180b == var_c1057221e17f180b) {
            continue;
        }
        p namespace_ad49798629176e96::function_6ce94cf4eee9eab7(var_3ccb8742d21b61d7);
    }
    var_c1057221e17f180b namespace_ad49798629176e96::function_80658d002f64199(var_12db0fe9902cd14b);
    wait(level.var_43307855f189eb31.var_4304a1e29279a798);
    thread namespace_ad49798629176e96::function_51b0f4b8cbce83ad(var_3ccb8742d21b61d7);
    var_3ccb8742d21b61d7 function_77dc965bed28a081(arena);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4940
// Size: 0x41
function function_67d92d9a720e2307(var_3ccb8742d21b61d7) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    objective_addclienttomask(var_3ccb8742d21b61d7.objid, player);
    objective_showtoplayersinmask(var_3ccb8742d21b61d7.objid);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4988
// Size: 0xa4
function function_77dc965bed28a081(arena) {
    var_3ccb8742d21b61d7 = self;
    foreach (p in arena.arenaplayers) {
        if (!isdefined(p) || isdefined(p.var_c1057221e17f180b) && p.var_c1057221e17f180b == var_3ccb8742d21b61d7) {
            continue;
        }
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_3ccb8742d21b61d7.objid, p);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a33
// Size: 0x1b4
function function_7c296b84f3f04cb5(arena) {
    player = self;
    arena thread function_50fc80e21e19d442();
    var_1f058c408f19eddb = function_861c9ec1a22d6aa4(player);
    var_a1ffa0e77f4ae724 = function_488428f4237c7e87(player);
    foreach (p in var_1f058c408f19eddb) {
        if (!isdefined(p)) {
            continue;
        }
        if (!istrue(p.gulag)) {
            continue;
        }
        if (istrue(p.var_4af73ce40a5d8572)) {
            continue;
        }
        p.var_4af73ce40a5d8572 = 1;
        if (isalive(p)) {
            p function_dc0a56e258889cb(arena, "br_twotwo_gulag_win_door");
        } else {
            var_913e4d836cbd71fd = function_1bd32287885bb933(p);
            if (!isdefined(var_913e4d836cbd71fd)) {
                var_913e4d836cbd71fd = p;
            }
            p thread playergulagautowin("gulagTwoTwoVolume", var_913e4d836cbd71fd, undefined, undefined, undefined, 1);
        }
    }
    foreach (p in var_a1ffa0e77f4ae724) {
        if (!isdefined(p)) {
            continue;
        }
        if (!istrue(p.gulag)) {
            continue;
        }
        if (istrue(p.var_4af73ce40a5d8572)) {
            continue;
        }
        p.var_4af73ce40a5d8572 = 1;
        p function_7aaf75a824252d97(arena, "br_twotwo_gulag_lost_door");
    }
    waitframe();
    arena notify("matchEnded");
    arena notify("fight_over_early");
    level handleendarena(arena);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bee
// Size: 0xbe
function function_dc0a56e258889cb(arena, var_b6acf0c07c4311e6) {
    player = self;
    if (istrue(player.var_4af73ce40a5d8572)) {
        return;
    } else {
        player.var_4af73ce40a5d8572 = 1;
    }
    player setclientomnvar("ui_br_gulag_match_end_time", 0);
    player setclientomnvar("ui_br_twotwo_gulag_players", -1);
    if (player.sessionstate == "playing") {
        player thread gulagvictory(arena, player, 0, 0, var_b6acf0c07c4311e6, undefined, undefined, undefined, 1);
    } else {
        var_913e4d836cbd71fd = function_1bd32287885bb933(player);
        if (!isdefined(var_913e4d836cbd71fd)) {
            var_913e4d836cbd71fd = player;
        }
        player thread namespace_47fd1e79a44628cd::playergulagautowin("gulagTwoTwo_victory", var_913e4d836cbd71fd, undefined, undefined, undefined, 1, undefined, var_b6acf0c07c4311e6);
    }
    function_cc5468bb6e866411(arena);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb3
// Size: 0x15d
function function_669067932a658a0b(arena, var_b6acf0c07c4311e6) {
    player = self;
    if (isdefined(arena) && isdefined(arena.var_654c981854394718)) {
        if (array_contains(arena.var_654c981854394718, player)) {
            arena.var_654c981854394718 = array_remove(arena.var_654c981854394718, player);
        }
    }
    player.var_4af73ce40a5d8572 = 1;
    player namespace_ad49798629176e96::function_dcead2b56fdbf3e(var_b6acf0c07c4311e6);
    player namespace_ad49798629176e96::function_3f18739ae34d9958();
    player function_720ef3a3e6616ab7(-1);
    player setthreatbiasgroup();
    player setclientomnvar("ui_br_twotwo_gulag_player_state", -1);
    if (isdefined(arena) && isdefined(arena.var_a9350ed31bec6aef)) {
        foreach (var_3ccb8742d21b61d7 in arena.var_cefc1bf41237bbac) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_3ccb8742d21b61d7.objid, player);
        }
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(arena.var_a9350ed31bec6aef, player);
    }
    player setclientomnvar("ui_br_special_item_acquired", 0);
    if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
        player thread function_defee99c5c401b40();
    }
    if (isdefined(arena)) {
        setovertimeomnvarenabled(arena, 0);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e17
// Size: 0x67
function function_fe66ad4ed04f807f() {
    player = self;
    foreach (var_cc950bdc5e75f92c in player.var_61c274a3bd736bed) {
        player br_pickups::function_ebf82cde71707ec8(var_cc950bdc5e75f92c);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e85
// Size: 0x67
function function_7aaf75a824252d97(arena, var_40d8983fc5e5c7a5) {
    player = self;
    if (istrue(player.var_4af73ce40a5d8572)) {
        return;
    } else {
        player.var_4af73ce40a5d8572 = 1;
    }
    player setclientomnvar("ui_br_gulag_match_end_time", 0);
    player setclientomnvar("ui_br_twotwo_gulag_players", -1);
    player thread gulagplayerlost(arena, var_40d8983fc5e5c7a5);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef3
// Size: 0x159
function function_8fe77205a38f1c50(arena, var_40d8983fc5e5c7a5) {
    player = self;
    if (isdefined(arena.var_654c981854394718)) {
        if (array_contains(arena.var_654c981854394718, player)) {
            arena.var_654c981854394718 = array_remove(arena.var_654c981854394718, player);
        }
    }
    if (!isdefined(var_40d8983fc5e5c7a5)) {
        if (!isalive(player)) {
            var_40d8983fc5e5c7a5 = "death";
        } else {
            var_40d8983fc5e5c7a5 = "time_ran_out";
        }
    }
    player setclientomnvar("ui_br_twotwo_gulag_player_state", -1);
    foreach (var_3ccb8742d21b61d7 in arena.var_cefc1bf41237bbac) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_3ccb8742d21b61d7.objid, player);
    }
    if (isdefined(arena.var_a9350ed31bec6aef)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(arena.var_a9350ed31bec6aef, player);
    }
    player setthreatbiasgroup();
    player namespace_ad49798629176e96::function_dcead2b56fdbf3e(var_40d8983fc5e5c7a5);
    player namespace_ad49798629176e96::function_3f18739ae34d9958();
    setovertimeomnvarenabled(arena, 0);
    function_cc5468bb6e866411(arena);
    if (!istrue(level.var_d034183abf2e274d)) {
        player namespace_aead94004cf4c147::function_5c5e6619f0b24f90();
        namespace_aead94004cf4c147::function_954372d604277278(player);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5053
// Size: 0xe9
function function_50fc80e21e19d442() {
    arena = self;
    level endon("game_ended");
    var_acffaf2e14327be0 = [];
    foreach (p in arena.arenaplayers) {
        if (!isdefined(p)) {
            continue;
        }
        body = p getcorpseentity();
        if (isdefined(body)) {
            var_acffaf2e14327be0[var_acffaf2e14327be0.size] = body;
        }
    }
    wait(5.5);
    foreach (body in var_acffaf2e14327be0) {
        if (!isdefined(body)) {
            continue;
        }
        body notify("corpse_manually_deleted");
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5143
// Size: 0x31
function function_defee99c5c401b40() {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    wait(18);
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        player kill();
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x517b
// Size: 0xd9
function function_4f4c7829487b8220(arena) {
    foreach (var_3ccb8742d21b61d7 in arena.var_cefc1bf41237bbac) {
        objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        if (objid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", var_3ccb8742d21b61d7.origin + (0, 0, 60), "ui_mp_br_icon_gulag_exit_objective");
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objid);
            namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
        } else {
            /#
                println("setGulagJailTimeoutVariation");
            #/
        }
        var_3ccb8742d21b61d7.objid = objid;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x525b
// Size: 0x11f
function function_3dc19fbe8b98e015() {
    player = self;
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    var_421e96e09a60042 = arena.var_cefc1bf41237bbac[0];
    var_27c330da5d381169 = distance(var_421e96e09a60042.origin, player.origin);
    foreach (var_3ccb8742d21b61d7 in arena.var_cefc1bf41237bbac) {
        var_af169ca88313d704 = distance(var_3ccb8742d21b61d7.origin, player.origin);
        if (var_27c330da5d381169 > distance(var_3ccb8742d21b61d7.origin, player.origin)) {
            var_421e96e09a60042 = var_3ccb8742d21b61d7;
            var_27c330da5d381169 = var_af169ca88313d704;
        }
    }
    objective_addclienttomask(var_421e96e09a60042.objid, player);
    objective_showtoplayersinmask(var_421e96e09a60042.objid);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5381
// Size: 0xbd
function function_c3d75fb801e462f9(arena) {
    var_bb400f5c504d242a = [];
    var_d280129509a08f5a = level.br_circle.circleindex;
    if (!isdefined(var_d280129509a08f5a) || var_d280129509a08f5a < 0) {
        tablename = function_aca4803ab9e602fb();
        var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(tablename);
        gamemodeloadout = namespace_d20f8ef223912e12::initstandardloadout(tablename, randomint(var_a300fa75277719ee));
        var_b749d549d1199784 = gamemodeloadout;
    } else {
        var_bb400f5c504d242a = function_9b9255a993b0fa1c(var_d280129509a08f5a);
        var_b749d549d1199784 = var_bb400f5c504d242a[0];
        var_ffb6bc4a062518fa = var_bb400f5c504d242a[1];
    }
    if (!isdefined(var_ffb6bc4a062518fa)) {
        var_ffb6bc4a062518fa = var_b749d549d1199784;
    }
    return [0:var_b749d549d1199784, 1:var_ffb6bc4a062518fa];
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5446
// Size: 0x157
function function_9b9255a993b0fa1c(var_d280129509a08f5a) {
    var_da28dd96064dd73 = [];
    var_7b24e61b58cfe89 = int(min(var_d280129509a08f5a, level.var_f684d37d5503eeba.var_6256525d35154bec.size));
    var_1b1f01577447e98d = randomint(int(level.var_f684d37d5503eeba.var_6256525d35154bec[var_7b24e61b58cfe89].size));
    var_da28dd96064dd73[var_da28dd96064dd73.size] = var_1b1f01577447e98d;
    var_d2252a573ea13967 = var_1b1f01577447e98d + 1;
    if (var_d2252a573ea13967 >= level.var_f684d37d5503eeba.var_6256525d35154bec[var_7b24e61b58cfe89].size) {
        var_d2252a573ea13967 = 0;
    }
    var_da28dd96064dd73[var_da28dd96064dd73.size] = var_d2252a573ea13967;
    var_bb400f5c504d242a = [];
    foreach (index in var_da28dd96064dd73) {
        tablename = level.var_f684d37d5503eeba.var_6256525d35154bec[var_7b24e61b58cfe89][index];
        var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(tablename);
        gamemodeloadout = namespace_d20f8ef223912e12::initstandardloadout(tablename, randomint(var_a300fa75277719ee));
        var_bb400f5c504d242a[var_bb400f5c504d242a.size] = gamemodeloadout;
    }
    return var_bb400f5c504d242a;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55a5
// Size: 0xc4
function function_91b7c321b7e78443(index) {
    var_35e87b647e77e13b = [];
    var_e234adf4af953b2f = level.var_f684d37d5503eeba.var_399b78e251f76cb8.var_9678564e7abf373b.size;
    for (i = 0; i < var_e234adf4af953b2f; i++) {
        tablename = function_564cf344e6433ffc(i);
        var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(tablename);
        for (k = 0; k < var_a300fa75277719ee; k++) {
            var_b964acb79366051d = namespace_d20f8ef223912e12::initstandardloadout(tablename, k);
            var_35e87b647e77e13b[var_35e87b647e77e13b.size] = var_b964acb79366051d;
        }
    }
    if (index >= var_35e87b647e77e13b.size) {
        index = var_35e87b647e77e13b.size - 1;
    }
    return var_35e87b647e77e13b[index];
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5671
// Size: 0xa6
function function_3cbf68ef6c5ca981(arena) {
    player = self;
    if (player.gulagloadoutindex == 1) {
        loadout = arena.var_1003fa05cffaadcb;
    } else {
        loadout = arena.var_28ddcfcec434cbf5;
    }
    if (level.var_43307855f189eb31.var_3b156be10b96edb9) {
        loadout = arena.var_1003fa05cffaadcb;
    }
    if (level.var_43307855f189eb31.var_f336dfcef737a30c >= 0) {
        loadout = function_91b7c321b7e78443(level.var_43307855f189eb31.var_f336dfcef737a30c);
    }
    return loadout;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x571f
// Size: 0x4e
function function_1fc65ff42afbb7fc(arena, player) {
    if (!isdefined(arena.var_654c981854394718)) {
        arena.var_654c981854394718 = [];
    }
    arena.var_654c981854394718 = array_add(arena.var_654c981854394718, player);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5774
// Size: 0x67
function function_1b2e2fd7f80fdd0b(arena) {
    arena.var_6984048b2d336a7 = arena.var_aeac6a7f3fb3167f;
    arena.var_6984048b2d336a7 = sortbydistance(arena.var_6984048b2d336a7, arena.center);
    arena.var_6984048b2d336a7 = array_reverse(arena.var_6984048b2d336a7);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57e2
// Size: 0xc9
function function_33c93a39c558a492(arena) {
    var_df6698a1ad9d50bf = [];
    foreach (var_d1fcec4dea575b18 in arena.fightspawns) {
        if (var_d1fcec4dea575b18.script_index == 0 || var_d1fcec4dea575b18.script_index == 1 || var_d1fcec4dea575b18.script_index == 6 || var_d1fcec4dea575b18.script_index == 7) {
            var_df6698a1ad9d50bf[var_df6698a1ad9d50bf.size] = var_d1fcec4dea575b18;
        }
    }
    var_df6698a1ad9d50bf = array_sort_by_script_index(var_df6698a1ad9d50bf);
    arena.fightspawns = var_df6698a1ad9d50bf;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b2
// Size: 0x269
function function_c525d1df15d88a84(agent, killer) {
    if (!isplayer(killer)) {
        return;
    }
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(killer);
    if (!isdefined(arena)) {
        return;
    }
    if (!isdefined(killer.var_f73178c689f257ae)) {
        killer.var_f73178c689f257ae = 0;
    }
    killer.var_f73178c689f257ae = killer.var_f73178c689f257ae + 1;
    if (function_cf70188e00c433c4(arena)) {
        arena thread function_50fc80e21e19d442();
        foreach (player in arena.arenaplayers) {
            if (!isdefined(player)) {
                continue;
            }
            if (!istrue(player.gulag)) {
                continue;
            }
            if (istrue(player.var_4af73ce40a5d8572)) {
                continue;
            }
            player function_dc0a56e258889cb(arena, "br_twotwo_jailer_gulag_win");
        }
        return;
    }
    if (isdefined(level.var_43307855f189eb31.var_b18455b0e6b6e213)) {
        if (level.var_43307855f189eb31.var_b18455b0e6b6e213 == 1) {
            arena thread function_50fc80e21e19d442();
            var_e4c8a8dcd301ee41 = function_861c9ec1a22d6aa4(killer);
            foreach (player in var_e4c8a8dcd301ee41) {
                if (!isdefined(player)) {
                    continue;
                }
                if (!istrue(player.gulag)) {
                    continue;
                }
                if (istrue(player.var_4af73ce40a5d8572)) {
                    continue;
                }
                player function_dc0a56e258889cb(arena, "br_twotwo_jailer_gulag_win");
                player thread namespace_ad49798629176e96::function_696f54da8fcb6bbe("twotwo_gulag_jailer_dead", arena);
            }
            return;
        } else if (level.var_43307855f189eb31.var_b18455b0e6b6e213 == 2) {
            function_9135ada02e07bf10(arena, "br_twotwo_jailer_gulag_win", 1);
            return;
        }
    }
    if (istrue(level.var_43307855f189eb31.var_6efb9d0afa7efcb2) && !istrue(arena.var_2d0904da1ac3fb61)) {
        arena.var_2d0904da1ac3fb61 = 1;
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        agent thread namespace_cb965d2f71fefddc::function_55463a3679678e2f(dropstruct, arena);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b22
// Size: 0xbe
function function_9135ada02e07bf10(arena, var_5d77a96dcfe7fa54, var_bd8ebd50121f174e) {
    arena thread function_50fc80e21e19d442();
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!istrue(player.gulag)) {
            continue;
        }
        if (istrue(player.var_4af73ce40a5d8572)) {
            continue;
        }
        player function_dc0a56e258889cb(arena, var_5d77a96dcfe7fa54);
        if (istrue(var_bd8ebd50121f174e)) {
            player thread namespace_ad49798629176e96::function_696f54da8fcb6bbe("twotwo_gulag_jailer_dead", arena);
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be7
// Size: 0x4c
function function_ed93a4074bbf2e51(attacker) {
    if (!isplayer(attacker)) {
        return;
    }
    if (!isdefined(attacker.var_32484cd3b17f16c8)) {
        attacker.var_32484cd3b17f16c8 = 0;
    }
    attacker.var_32484cd3b17f16c8 = attacker.var_32484cd3b17f16c8 + 1;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3a
// Size: 0xad
function function_a4c35fe489cc7da5() {
    player = self;
    player waittill("gulag_outline_removed");
    if (isdefined(player) && player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        var_e4c8a8dcd301ee41 = function_861c9ec1a22d6aa4(player);
        foreach (p in var_e4c8a8dcd301ee41) {
            if (!isdefined(p) || !istrue(p.gulag) || p == player) {
                continue;
            }
            p thread namespace_ad49798629176e96::function_da46de174875958a(player, "outline_nodepth_green");
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cee
// Size: 0x25
function function_720ef3a3e6616ab7(value) {
    player = self;
    player setclientomnvar("ui_br_ai_gulag_score", value);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d1a
// Size: 0xd5
function function_cc5468bb6e866411(arena) {
    foreach (p in arena.arenaplayers) {
        if (!isdefined(p)) {
            continue;
        }
        p function_6d217ba4de4b166b(arena);
        p function_fb51bdaa21d694e5(arena);
    }
    foreach (p in arena.jailedplayers) {
        if (!isdefined(p)) {
            continue;
        }
        p function_6d217ba4de4b166b(arena);
        p function_fb51bdaa21d694e5(arena);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df6
// Size: 0xef
function function_6d217ba4de4b166b(arena) {
    player = self;
    var_c8a5261a0fca66d4 = 0;
    var_4c096c17e2c382e1 = 0;
    var_77fa43fc5f58845d = 4;
    if (function_cf70188e00c433c4(arena)) {
        var_77fa43fc5f58845d = 2;
    }
    for (i = 0; i < var_77fa43fc5f58845d; i++) {
        p = arena.arenaplayers[i];
        if (!isdefined(p) || !p namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            playerentnum = 0;
        } else {
            playerentnum = p getentitynumber() + 1;
        }
        var_c99096116afd1827 = 256 - 1;
        /#
            assert(playerentnum >= 0 && playerentnum <= var_c99096116afd1827);
        #/
        var_c8a5261a0fca66d4 = var_c8a5261a0fca66d4 + ((int(playerentnum) & var_c99096116afd1827) << var_4c096c17e2c382e1);
        var_4c096c17e2c382e1 = var_4c096c17e2c382e1 + 8;
    }
    player setclientomnvar("ui_br_twotwo_gulag_players", var_c8a5261a0fca66d4);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eec
// Size: 0xd9
function function_fb51bdaa21d694e5(arena) {
    player = self;
    var_c8a5261a0fca66d4 = 0;
    var_4c096c17e2c382e1 = 0;
    var_77fa43fc5f58845d = 4;
    if (function_cf70188e00c433c4(arena)) {
        var_77fa43fc5f58845d = 2;
    }
    for (i = 0; i < var_77fa43fc5f58845d; i++) {
        p = arena.arenaplayers[i];
        var_c8d776e41ecc6881 = function_a3404116e7794c47(player, p, arena);
        var_62b5521602cbb385 = 8 - 1;
        /#
            assert(var_c8d776e41ecc6881 >= 0 && var_c8d776e41ecc6881 <= var_62b5521602cbb385);
        #/
        var_c8a5261a0fca66d4 = var_c8a5261a0fca66d4 + ((int(var_c8d776e41ecc6881) & var_62b5521602cbb385) << var_4c096c17e2c382e1);
        var_4c096c17e2c382e1 = var_4c096c17e2c382e1 + 3;
    }
    player setclientomnvar("ui_br_twotwo_gulag_players_state", var_c8a5261a0fca66d4);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fcc
// Size: 0xfb
function function_a3404116e7794c47(player, var_435b226327d6361a, arena) {
    if (!isdefined(var_435b226327d6361a) || !var_435b226327d6361a namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return 0;
    }
    if (!isalive(var_435b226327d6361a)) {
        return 1;
    }
    if (player == var_435b226327d6361a) {
        return 3;
    }
    var_407bf5db5db81053 = array_contains(arena.jailedplayers, player);
    if (var_407bf5db5db81053) {
        return 2;
    }
    if (var_435b226327d6361a.team == player.team) {
        return 5;
    } else {
        var_f3cef7e5ebad72e0 = array_contains(arena.var_801cdcfadc4d465c, var_435b226327d6361a);
        if (var_f3cef7e5ebad72e0) {
            var_eb3d6fa548fa6972 = array_contains(arena.var_801cdcfadc4d465c, player);
            if (var_eb3d6fa548fa6972) {
                return 4;
            }
        } else {
            var_55ff96a652e94ea8 = array_contains(arena.var_af5243fbba0720c2, player);
            if (var_55ff96a652e94ea8) {
                return 4;
            }
        }
        return 6;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60ce
// Size: 0x13a
function function_861c9ec1a22d6aa4(player) {
    if (!isdefined(player)) {
        return;
    }
    for (i = 0; i < level.gulag.arenas.size; i++) {
        var_f40e6deec30ee209 = level.gulag.arenas[i];
        if (isdefined(var_f40e6deec30ee209.var_801cdcfadc4d465c)) {
            foreach (var_31210ce93279d451 in var_f40e6deec30ee209.var_801cdcfadc4d465c) {
                if (var_31210ce93279d451 == player) {
                    return var_f40e6deec30ee209.var_801cdcfadc4d465c;
                }
            }
        }
        if (isdefined(var_f40e6deec30ee209.var_af5243fbba0720c2)) {
            foreach (var_31210ce93279d451 in var_f40e6deec30ee209.var_af5243fbba0720c2) {
                if (var_31210ce93279d451 == player) {
                    return var_f40e6deec30ee209.var_af5243fbba0720c2;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6210
// Size: 0x80
function function_1bd32287885bb933(player) {
    if (!isdefined(player)) {
        return undefined;
    }
    var_15d6e806d3e1ed4a = function_861c9ec1a22d6aa4(player);
    if (isdefined(var_15d6e806d3e1ed4a)) {
        foreach (p in var_15d6e806d3e1ed4a) {
            if (!isdefined(p)) {
                continue;
            }
            if (p != player) {
                return p;
            }
        }
    }
    return undefined;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6298
// Size: 0x14a
function function_488428f4237c7e87(player) {
    if (!isdefined(player)) {
        return;
    }
    for (i = 0; i < level.gulag.arenas.size; i++) {
        var_f40e6deec30ee209 = level.gulag.arenas[i];
        if (isdefined(var_f40e6deec30ee209.var_801cdcfadc4d465c)) {
            foreach (var_31210ce93279d451 in var_f40e6deec30ee209.var_801cdcfadc4d465c) {
                if (!isdefined(var_31210ce93279d451)) {
                    continue;
                }
                if (var_31210ce93279d451 == player) {
                    return var_f40e6deec30ee209.var_af5243fbba0720c2;
                }
            }
        }
        if (isdefined(var_f40e6deec30ee209.var_af5243fbba0720c2)) {
            foreach (var_31210ce93279d451 in var_f40e6deec30ee209.var_af5243fbba0720c2) {
                if (!isdefined(var_31210ce93279d451)) {
                    continue;
                }
                if (var_31210ce93279d451 == player) {
                    return var_f40e6deec30ee209.var_801cdcfadc4d465c;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63ea
// Size: 0xd0
function function_66ba5f24fbb13a23(player) {
    for (i = 0; i < level.gulag.arenas.size; i++) {
        var_f40e6deec30ee209 = level.gulag.arenas[i];
        foreach (jailedplayers in var_f40e6deec30ee209.jailedplayers) {
            if (jailedplayers == player) {
                arena = level.gulag.arenas[i];
                return arena;
            }
        }
    }
    return undefined;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64c2
// Size: 0x31
function function_6e3541fd8fab45bc() {
    if (isdefined(level.var_43307855f189eb31) && level.var_43307855f189eb31.name == "gulag_twotwo") {
        return 1;
    }
    return 0;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64fb
// Size: 0xe6
function function_ccf74b81f01f0bf1(arena) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    foreach (var_3ccb8742d21b61d7 in arena.var_cefc1bf41237bbac) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_3ccb8742d21b61d7.objid, player);
    }
    namespace_ad49798629176e96::function_ba5dbc7633c84a(arena);
    wait(12);
    if (!isdefined(player)) {
        return;
    }
    player.gulag = 0;
    player namespace_ad49798629176e96::function_3f18739ae34d9958();
    player playergulagautowin("gulagInfinite", player, undefined, undefined, undefined, 1);
    wait(12);
    if (!isdefined(player)) {
        return;
    }
    player.gulagloser = undefined;
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        player kill();
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e8
// Size: 0x2c
function function_bb22cae6dd0b7899() {
    if (isdefined(level.var_43307855f189eb31) && istrue(level.var_43307855f189eb31.var_d06b935d7d60de61)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x661c
// Size: 0x45
function function_452ab051852e4df1() {
    player = self;
    if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() && istrue(player.var_43b2a82936a5e974) && istrue(level.var_43307855f189eb31.var_ec2eaa1a4b68c0cf)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6669
// Size: 0x3aa
function function_7873119d67c51a6d() {
    arena = self;
    arena endon("matchEnded");
    arena endon("fight_over");
    setovertimeomnvarenabled(arena, 1);
    if (level.var_43307855f189eb31.var_789d529318e2df1b == 1) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        if (isdefined(arena.var_707537a8904aa962)) {
            foreach (agent in arena.var_707537a8904aa962) {
                if (!istrue(arena.var_2d0904da1ac3fb61)) {
                    agent thread namespace_cb965d2f71fefddc::function_55463a3679678e2f(dropstruct, arena);
                    arena.var_2d0904da1ac3fb61 = 1;
                }
            }
        }
    } else if (level.var_43307855f189eb31.var_789d529318e2df1b == 2) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        arena.var_2d0904da1ac3fb61 = 1;
        if (isdefined(arena.var_707537a8904aa962)) {
            foreach (agent in arena.var_707537a8904aa962) {
                agent thread namespace_cb965d2f71fefddc::function_55463a3679678e2f(dropstruct, arena);
                foreach (player in arena.arenaplayers) {
                    player thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_gulag_key_dropped");
                }
                namespace_ad49798629176e96::function_9f7b9a86a5328f0b(arena, agent.origin);
                wait(0.3);
                agent kill();
            }
        }
    } else if (level.var_43307855f189eb31.var_789d529318e2df1b == 3) {
        var_73d9d766f03d3e99 = getgroundposition(arena.center, 1);
        scriptable = level.br_pickups.var_838863c4848d4c26["loot_key_gulag"];
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, var_73d9d766f03d3e99, (0, 0, 0), undefined, level.br_pickups.var_ad49a38dd7c4c10f, level.br_pickups.var_3b53bc0eee6ae84e);
        item = namespace_cb965d2f71fefddc::spawnpickup(scriptable, var_cb4fad49263e20c4, 1, 1, undefined, 0);
        arena.var_6d4e3b180776136f[arena.var_6d4e3b180776136f.size] = item;
        foreach (player in arena.arenaplayers) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_twotwo_gulag_key_spawned_center");
        }
        namespace_ad49798629176e96::function_9f7b9a86a5328f0b(arena, item.origin);
        playsoundatpos(var_73d9d766f03d3e99, "flag_spawned");
    } else if (level.var_43307855f189eb31.var_789d529318e2df1b == 4) {
        wait(level.var_43307855f189eb31.var_b1985d454f9b2200);
        if (istrue(level.var_43307855f189eb31.var_b155c6403ae16b83)) {
            arena thread namespace_ed76df41b0f397fe::function_5427c6229b93668e(arena.var_6984048b2d336a7, 11, 1.2);
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1a
// Size: 0x52
function function_8cd391e5244b5670(arena) {
    if (!isdefined(arena.var_707537a8904aa962)) {
        arena.aiset = 1;
        if (isdefined(arena.var_79f102b3abcc6f8a)) {
            thread function_3aee652da47a2a39(arena);
        }
        arena waittill("matchEnded");
        thread function_d6b701f1cb759bd5(arena);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a73
// Size: 0x1b
function function_9b254813c229a51c() {
    category = "gulag";
    function_ba4022744dce59f6(category);
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a95
// Size: 0x1f
function function_3aee652da47a2a39(arena) {
    if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena)) {
        thread function_89235e4fe5354b16(arena);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6abb
// Size: 0x112
function function_d1f5aaddab74bd10(arena, var_55e69fb0ce97f15e) {
    aitype = "enemy_mp_smg_tier1_aq";
    spawnlocation = var_55e69fb0ce97f15e.origin;
    if (!getdvarint(@"hash_b3d7a9483362813e", 0)) {
        spawnlocation = getclosestpointonnavmesh(var_55e69fb0ce97f15e.origin);
    }
    agent = ai_mp_requestspawnagent(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag", undefined, undefined, undefined, undefined, undefined, 1);
    if (isagent(agent)) {
        agent thread function_82eee32bb4c490d8(arena);
        if (getdvarint(@"hash_b3d7a9483362813e", 0)) {
            agent forceteleport(spawnlocation, var_55e69fb0ce97f15e.angles);
            agent setgoalpos(agent.origin, 32);
            agent clearpath();
            agent.fixednode = 1;
            agent thread function_b11c1964f528574b(agent, 1, agent.origin);
        } else {
            agent thread function_b11c1964f528574b(agent);
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6bd4
// Size: 0x23
function function_9119de486a6fa5cd(arena) {
    if (!istrue(arena.aiset)) {
        function_8cd391e5244b5670(arena);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bfe
// Size: 0xdc
function function_82eee32bb4c490d8(arena) {
    if (!isdefined(arena.var_707537a8904aa962)) {
        arena.var_707537a8904aa962 = [];
    }
    arena.var_707537a8904aa962 = array_add(arena.var_707537a8904aa962, self);
    if (getdvarint(@"hash_cef54d9e018c7722", 0)) {
        gulagplayers = array_combine(arena.arenaplayers, arena.jailedplayers);
        foreach (player in gulagplayers) {
            if (!isdefined(player)) {
                continue;
            }
            player namespace_ad49798629176e96::function_da46de174875958a(self, "outline_nodepth_red", -1);
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ce1
// Size: 0xfe
function function_3aad61cbc63b74c8(arena) {
    if (isdefined(arena.var_707537a8904aa962)) {
        arena.var_707537a8904aa962 = array_remove(arena.var_707537a8904aa962, self);
        if (isagent(self)) {
            self notify("jailer_stop_firing");
            self stoploopsound("mus_jugg_01_hp");
            if (isalive(self)) {
                function_dbd4cba5d524eba9(arena);
                function_28b90eb2b591003f();
            } else if (getdvarint(@"hash_82733198d2d5b09e", 1)) {
                if (isdefined(arena.var_a88cd2794ae356a7) && arena.var_a88cd2794ae356a7.var_e0624b9863250a2 == "jailer_guard") {
                    wait(10);
                }
                body = self getcorpseentity();
                if (isdefined(body)) {
                    body delete();
                }
            }
        }
        if (isdefined(arena.var_707537a8904aa962) && arena.var_707537a8904aa962.size <= 0) {
            arena.var_707537a8904aa962 = undefined;
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de6
// Size: 0x10e
function function_dbd4cba5d524eba9(arena) {
    agent = self;
    arena endon("arena_about_to_prep_for_next_match");
    level endon("game_ended");
    var_e875263615163617 = 4;
    var_c9ec98acf0094360 = 200;
    exitposition = arena.var_198c1cb09f6dbfb1.origin + (-18, 205, -128);
    agent clearbtgoal(2);
    waitframe();
    if (!isdefined(agent)) {
        return;
    }
    agent.ignoreall = 1;
    agent function_304da84d9a815c01(exitposition, var_e875263615163617);
    agent aisetdesiredspeed(var_c9ec98acf0094360);
    starttime = gettime();
    var_77836ff44d4ca9dd = getdvarint(@"hash_5b82b0cf2b0ff269", 10000);
    while (distance2d(agent.origin, exitposition) > 4) {
        timepassed = gettime() - starttime;
        if (timepassed >= var_77836ff44d4ca9dd) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6efb
// Size: 0x131
function function_d6b701f1cb759bd5(arena) {
    if (isdefined(arena.var_707537a8904aa962)) {
        foreach (agent in arena.var_707537a8904aa962) {
            if (isagent(agent)) {
                agent thread function_3aad61cbc63b74c8(arena);
                agent setthreatbiasgroup();
            }
        }
        arena.var_707537a8904aa962 = undefined;
        arena.aiset = undefined;
    }
    wait(function_86ee3121d91c59c3());
    var_2e903a90a966d9c2 = 2650;
    var_f9d6732a60363240 = getlootscriptablearrayinradius(undefined, undefined, arena.center, var_2e903a90a966d9c2);
    foreach (var_d8cd9c1941a88194 in var_f9d6732a60363240) {
        if (var_d8cd9c1941a88194 getscriptableisreserved() && var_d8cd9c1941a88194 getscriptableisloot()) {
            var_d8cd9c1941a88194 namespace_cb965d2f71fefddc::deletescriptableinstance();
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7033
// Size: 0x4d
function function_12801693c8c241bb(arena) {
    for (i = 0; i < 10; i++) {
        arena.var_2a7e62879a75ffe[arena.var_2a7e62879a75ffe.size] = getscriptcachecontents(level.var_42706f92b61ab857, i);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7087
// Size: 0x4d
function function_144fc7f54908932f(arena) {
    for (i = 0; i < 5; i++) {
        arena.var_49e6d5114201a22b[arena.var_49e6d5114201a22b.size] = getscriptcachecontents(level.var_1d446b9562cad6cb, i);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70db
// Size: 0x4d
function function_687cfa994c08bada(arena) {
    for (i = 0; i < 3; i++) {
        arena.var_c8ada8b232d73a0a[arena.var_c8ada8b232d73a0a.size] = getscriptcachecontents(level.var_8aa2fc86861fc20c, i);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x712f
// Size: 0x1e4
function function_b2d8f9adee070020(arena) {
    var_7205fab5ac6f58e = 0;
    var_a29ac4899acd2c08 = arena.var_2c4104d74359893b;
    var_39ce9039c3660d76 = "";
    maxcount = 0;
    while (var_7205fab5ac6f58e < level.var_f684d37d5503eeba.var_b61a334ec66db6a9) {
        var_7205fab5ac6f58e++;
        var_9ae625e33b2fc5f6 = var_a29ac4899acd2c08.size;
        var_8b591b0bc361ab3d = randomint(var_9ae625e33b2fc5f6);
        var_efcce422369f16a3 = arena.var_2a7e62879a75ffe.size;
        var_d6a189deafcb31fd = randomint(var_efcce422369f16a3);
        scriptablename = arena.var_2a7e62879a75ffe[var_d6a189deafcb31fd][var_7205fab5ac6f58e - 1];
        if (!isdefined(scriptablename) || scriptablename == "") {
            var_a29ac4899acd2c08 = array_remove(var_a29ac4899acd2c08, var_a29ac4899acd2c08[var_8b591b0bc361ab3d]);
            continue;
        }
        if (issubstr(scriptablename, "weapon")) {
            weaponname = namespace_cb965d2f71fefddc::getfullweaponobjfromscriptablename(scriptablename);
            pickupcount = weaponclipsize(weaponname) * 2;
        } else {
            pickupcount = level.br_pickups.counts[scriptablename];
        }
        if (!isdefined(pickupcount)) {
            pickupcount = 1;
        }
        var_cb4fad49263e20c4 = spawnstruct();
        var_cb4fad49263e20c4.origin = var_a29ac4899acd2c08[var_8b591b0bc361ab3d].origin;
        var_cb4fad49263e20c4.angles = (0, 0, 0);
        var_cb4fad49263e20c4.payload = 0;
        var_d8cd9c1941a88194 = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, pickupcount);
        var_39ce9039c3660d76 = var_a29ac4899acd2c08[var_8b591b0bc361ab3d].script_noteworthy;
        var_a29ac4899acd2c08 = array_remove(var_a29ac4899acd2c08, var_a29ac4899acd2c08[var_8b591b0bc361ab3d]);
        var_a29ac4899acd2c08 = function_7f32923c29bcf243(arena.var_2a7e62879a75ffe, var_a29ac4899acd2c08, scriptablename, var_39ce9039c3660d76, pickupcount);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x731a
// Size: 0x19f
function function_fcc8620f60ca604c(arena) {
    var_c68ee1a747f552e2 = 0;
    var_a29ac4899acd2c08 = arena.var_aeac6a7f3fb3167f;
    var_39ce9039c3660d76 = "";
    while (var_c68ee1a747f552e2 < level.var_f684d37d5503eeba.var_1d8a378e37a1b6e5 && var_c68ee1a747f552e2 < arena.var_49e6d5114201a22b[0].size) {
        var_c68ee1a747f552e2++;
        var_9ae625e33b2fc5f6 = var_a29ac4899acd2c08.size;
        var_8b591b0bc361ab3d = randomint(var_9ae625e33b2fc5f6);
        scriptablename = arena.var_49e6d5114201a22b[0][var_c68ee1a747f552e2 - 1];
        if (!isdefined(scriptablename) || scriptablename == "") {
            var_a29ac4899acd2c08 = array_remove(var_a29ac4899acd2c08, var_a29ac4899acd2c08[var_8b591b0bc361ab3d]);
            continue;
        }
        pickupcount = level.br_pickups.counts[scriptablename];
        if (!isdefined(pickupcount)) {
            pickupcount = 1;
        }
        var_cb4fad49263e20c4 = spawnstruct();
        var_cb4fad49263e20c4.origin = var_a29ac4899acd2c08[var_8b591b0bc361ab3d].origin;
        var_cb4fad49263e20c4.angles = (0, 0, 0);
        var_cb4fad49263e20c4.payload = 0;
        var_d8cd9c1941a88194 = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, pickupcount);
        var_d8cd9c1941a88194.var_1b46a808091ea19c = 1;
        var_39ce9039c3660d76 = var_a29ac4899acd2c08[var_8b591b0bc361ab3d].script_noteworthy;
        var_a29ac4899acd2c08 = array_remove(var_a29ac4899acd2c08, var_a29ac4899acd2c08[var_8b591b0bc361ab3d]);
        var_a29ac4899acd2c08 = function_7f32923c29bcf243(arena.var_49e6d5114201a22b, var_a29ac4899acd2c08, scriptablename, var_39ce9039c3660d76, pickupcount);
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c0
// Size: 0x216
function function_d674739c4e4039b(arena, eventref, scriptablename) {
    var_410a59c41f3537f7 = 0;
    var_a29ac4899acd2c08 = arena.var_601cd7609bcc2ec2;
    if (isdefined(eventref) && isdefined(scriptablename)) {
        if (scriptablename == "") {
            return;
        }
        pickupcount = level.br_pickups.counts[scriptablename];
        if (!isdefined(pickupcount)) {
            pickupcount = 1;
        }
        var_cb4fad49263e20c4 = spawnstruct();
        var_cb4fad49263e20c4.origin = var_a29ac4899acd2c08[0].origin;
        var_cb4fad49263e20c4.angles = (0, 0, 0);
        var_cb4fad49263e20c4.payload = 0;
        var_d8cd9c1941a88194 = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, pickupcount);
        var_d8cd9c1941a88194.var_1b46a808091ea19c = 1;
    } else if (level.var_f684d37d5503eeba.var_b50451c7ab918479 == 1) {
        while (var_410a59c41f3537f7 < level.var_f684d37d5503eeba.var_d5a4802dae58c710 && var_410a59c41f3537f7 < arena.var_c8ada8b232d73a0a[0].size) {
            var_410a59c41f3537f7++;
            var_8b591b0bc361ab3d = randomint(var_a29ac4899acd2c08.size);
            scriptablename = arena.var_c8ada8b232d73a0a[0][var_410a59c41f3537f7 - 1];
            if (!isdefined(scriptablename) || scriptablename == "") {
                var_a29ac4899acd2c08 = array_remove(var_a29ac4899acd2c08, var_a29ac4899acd2c08[var_8b591b0bc361ab3d]);
                continue;
            }
            pickupcount = level.br_pickups.counts[scriptablename];
            if (!isdefined(pickupcount)) {
                pickupcount = 1;
            }
            var_cb4fad49263e20c4 = spawnstruct();
            var_cb4fad49263e20c4.origin = var_a29ac4899acd2c08[var_8b591b0bc361ab3d].origin;
            var_cb4fad49263e20c4.angles = (0, 0, 0);
            var_cb4fad49263e20c4.payload = 0;
            var_d8cd9c1941a88194 = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, pickupcount);
            var_d8cd9c1941a88194.var_1b46a808091ea19c = 1;
            var_a29ac4899acd2c08 = array_remove(var_a29ac4899acd2c08, var_a29ac4899acd2c08[var_8b591b0bc361ab3d]);
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76dd
// Size: 0xdb
function function_7f32923c29bcf243(itemlist, var_a29ac4899acd2c08, scriptablename, var_39ce9039c3660d76, pickupcount) {
    for (var_9bd4297f76b63747 = 0; var_9bd4297f76b63747 < var_a29ac4899acd2c08.size; var_9bd4297f76b63747++) {
        if (var_a29ac4899acd2c08[var_9bd4297f76b63747].script_noteworthy == var_39ce9039c3660d76) {
            var_cb4fad49263e20c4 = spawnstruct();
            var_cb4fad49263e20c4.origin = var_a29ac4899acd2c08[var_9bd4297f76b63747].origin;
            var_cb4fad49263e20c4.angles = (0, 0, 0);
            var_cb4fad49263e20c4.payload = 0;
            var_d8cd9c1941a88194 = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, pickupcount);
            var_d8cd9c1941a88194.var_1b46a808091ea19c = 1;
            var_a29ac4899acd2c08 = array_remove(var_a29ac4899acd2c08, var_a29ac4899acd2c08[var_9bd4297f76b63747]);
            break;
        }
    }
    return var_a29ac4899acd2c08;
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c0
// Size: 0x9e
function function_ab674fc3132afe8(arena) {
    if (level.var_f684d37d5503eeba.var_1d8a378e37a1b6e5 > arena.var_aeac6a7f3fb3167f.size / 2) {
        level.var_f684d37d5503eeba.var_1d8a378e37a1b6e5 = arena.var_aeac6a7f3fb3167f.size / 2;
    }
    if (level.var_f684d37d5503eeba.var_b61a334ec66db6a9 > arena.var_2c4104d74359893b.size / 2) {
        level.var_f684d37d5503eeba.var_b61a334ec66db6a9 = arena.var_2c4104d74359893b.size / 2;
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7865
// Size: 0x141
function function_5eaf324209d1c3f0() {
    level.var_1d446b9562cad6cb = "sc_gulag_items_1";
    level.var_42706f92b61ab857 = "sc_gulag_cash_1";
    level.var_8aa2fc86861fc20c = "sc_gulag_vouchers_1";
    if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
        switch (level.br_circle.circleindex) {
        case 0:
            level.var_1d446b9562cad6cb = "sc_gulag_items_1";
            level.var_42706f92b61ab857 = "sc_gulag_cash_1";
            break;
        case 1:
            level.var_1d446b9562cad6cb = "sc_gulag_items_2";
            level.var_42706f92b61ab857 = "sc_gulag_cash_2";
            break;
        case 2:
            level.var_1d446b9562cad6cb = "sc_gulag_items_3";
            level.var_42706f92b61ab857 = "sc_gulag_cash_3";
            break;
        case 3:
            level.var_1d446b9562cad6cb = "sc_gulag_items_4";
            level.var_42706f92b61ab857 = "sc_gulag_cash_4";
            break;
        default:
            level.var_1d446b9562cad6cb = "sc_gulag_items_1";
            level.var_42706f92b61ab857 = "sc_gulag_cash_1";
            break;
        }
    }
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79ad
// Size: 0x43c
function function_14d03f62839087b0() {
    /#
        var_ec22aea58117669e = 0;
        var_e3761a51d388c838 = 80;
        var_f8d9ad8f9ddee0a3 = 0;
        var_c59d027c6b2964aa = 14;
        var_b9880d08819747b1 = 1;
        var_220fe5e2359aa7bb = 1;
        if (!var_ec22aea58117669e) {
            return;
        }
        wait(var_e3761a51d388c838);
        var_5cfdb39f45c61031 = undefined;
        foreach (player in level.teamdata[level.players[0].team]["j_prop_2"]) {
            if (player == level.players[0]) {
                continue;
            }
            var_5cfdb39f45c61031 = player;
        }
        level.players[0] kill();
        var_5cfdb39f45c61031 kill();
        wait(6);
        var_b33905c8f48b514e = level.players[7];
        var_f8890a693a90926c = undefined;
        foreach (player in level.teamdata[var_b33905c8f48b514e.team]["j_prop_2"]) {
            if (player == var_b33905c8f48b514e) {
                continue;
            }
            var_f8890a693a90926c = player;
        }
        var_b33905c8f48b514e kill();
        var_f8890a693a90926c kill();
        var_2d826c9e67bfecbb = undefined;
        foreach (player in level.teamdata[level.players[0].team]["j_prop_2"]) {
            if (player == level.players[0]) {
                continue;
            }
            if (player == var_5cfdb39f45c61031) {
                continue;
            }
            var_2d826c9e67bfecbb = player;
        }
        wait(10);
        var_2d826c9e67bfecbb kill();
        wait(25);
        foreach (player in level.teamdata[var_b33905c8f48b514e.team]["j_prop_2"]) {
            if (player == var_b33905c8f48b514e) {
                continue;
            }
            if (player == var_f8890a693a90926c) {
                continue;
            }
            player kill();
        }
        wait(10);
        foreach (player in level.teamdata[level.players[0].team]["j_prop_2"]) {
            if (player == level.players[0]) {
                continue;
            }
            if (player == var_5cfdb39f45c61031) {
                continue;
            }
            if (player == var_2d826c9e67bfecbb) {
                continue;
            }
            player kill();
        }
        wait(15);
        level.players[0] kill();
        wait(10);
        namespace_8bfdb6eb5a3df67a::br_kioskrevive(level.players[0], var_5cfdb39f45c61031, 0);
        wait(5);
        var_5cf03fab06dd626f = function_1bd32287885bb933(var_2d826c9e67bfecbb);
        wait(1);
        var_2d826c9e67bfecbb kill();
        if (isdefined(var_5cf03fab06dd626f)) {
            var_5cf03fab06dd626f kill();
        }
        wait(25);
        namespace_8bfdb6eb5a3df67a::br_kioskrevive(var_2d826c9e67bfecbb, var_5cfdb39f45c61031, 0);
        wait(20);
        if (isalive(var_2d826c9e67bfecbb)) {
            var_2d826c9e67bfecbb kill();
            wait(3);
        }
        var_139de170898d8659 = var_2d826c9e67bfecbb getentitynumber();
        kick(var_139de170898d8659);
        wait(1);
        var_b85445b00bb4434 = 0;
        while (var_b85445b00bb4434 < 100) {
            var_b85445b00bb4434++;
            if (isdefined(var_139de170898d8659)) {
                kick(var_139de170898d8659);
            }
            if (!isdefined(var_139de170898d8659)) {
                level.players[0] kill();
            }
            wait(0.1);
        }
        if (isdefined(var_139de170898d8659)) {
            kick(var_139de170898d8659);
            level.players[0] kill();
        }
    #/
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7df0
// Size: 0x6d
function function_526dfbe9997544a0() {
    /#
        var_e4a60bd9c8018200 = 0;
        if (!var_e4a60bd9c8018200) {
            return;
        }
        arena = self;
        wait(30);
        wait(5);
        if (isdefined(arena.var_707537a8904aa962[0]) && isdefined(arena.arenaplayers[0])) {
            function_c525d1df15d88a84(arena.var_707537a8904aa962[0], arena.arenaplayers[0]);
        }
    #/
}

// Namespace namespace_55257b88b81678cd/namespace_6ea7652ec407cc80
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e64
// Size: 0x63
function function_1d5e2e0d6af328f7(waittime) {
    /#
        var_cdd688f817853f8b = 0;
        if (!var_cdd688f817853f8b) {
            return;
        }
        wait(waittime);
        setdvar(@"hash_9e78730ec3baa38c", 4);
        eventdata = level.br_pe_data[3];
        eventdata.active = 1;
        namespace_d76af9f804655767::function_145e3d3099bb97c4(eventdata);
    #/
}

