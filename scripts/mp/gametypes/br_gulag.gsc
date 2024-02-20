// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_46fdf7b12c5f5620;
#using script_36f129f8cf15a219;
#using script_b0385bb45379222;
#using script_3aa8e63a56e3416;
#using script_5bc60484d17fa95c;
#using script_930a1e7bd882c1d;
#using script_2d9d24f7c63ac143;
#using script_4c770a9a4ad7659c;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_dom_quest.gsc;
#using script_7b5ad7b49edf8d6b;
#using script_158c8ce1811f30aa;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_548072087c9fd504;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_killstreaks.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\hud_util.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using script_a34750d17473c49;
#using scripts\mp\gametypes\br.gsc;
#using script_3583ff375ab3a91e;
#using scripts\mp\deathicons.gsc;
#using scripts\mp\outofbounds.gsc;
#using script_64acb6ce534155b7;
#using script_46cf752d93dc17b;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\execution.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\utility\weapon.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_respawn.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_7933519955f32c4e;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\gametypes\br_vip_quest.gsc;
#using scripts\engine\trace.gsc;

#namespace br_gulag;

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca7
// Size: 0x73a
function initgulag() {
    level.respawncircleinterppct = getdvarfloat(@"hash_ba0a30562f3b3d2", 0.75);
    if (!istrue(level.usegulag)) {
        return;
    }
    if (namespace_71073fa38f11492::isfeaturedisabled("gulag")) {
        level.usegulag = 0;
        return;
    }
    setomnvar("ui_gulag_state", 1);
    setomnvar("ui_gulag_show_closing_state", 0);
    level.gulag = spawnstruct();
    level.gulag.arenaflag = getdvarint(@"hash_5052fb481d0f9342", 0);
    level.gulag.maxplayers = getmaxplayers();
    level.gulag.maxuses = getdvarint(@"hash_75651466ddf2a023", 1);
    level.gulag.endonshutdown = getdvarint(@"hash_a208c2044d682252", 3);
    level.gulag.maxqueue = getdvarint(@"hash_288e3f85a1389bee", 90);
    level.gulag.onekillwin = getdvarint(@"hash_87f668a2b16e5a88", 0);
    level.gulag.multiarena = getdvarint(@"hash_29b4dd2fcb154cc9", 1);
    level.gulag.planerespawn = getdvarint(@"hash_86ce8bb55042030d", 0);
    level.gulag.introcinematic = getdvarint(@"hash_1acebad8080ce298", 1);
    level.gulag.var_3fdedda393e951f9 = getdvarint(@"hash_adea9f7a92ca117d", 0);
    level.gulag.var_d373eba3425dcc77 = getdvarint(@"hash_7ea3ac91f30ce5a5", 17000);
    level.gulag.usecellspawns = getdvarint(@"hash_9fa493a57b8993fb", 1);
    level.gulag.usefloorrocks = getdvarint(@"hash_b962f2b08f7dafc7", 0);
    level.gulag.spawnloot = getdvarint(@"hash_1db2120552a886e9", 0);
    level.gulag.lethaldelay = getdvarint(@"hash_133cbace5a3c90bd", 3);
    level.gulag.streamtimeout = getdvarint(@"hash_901c31aaa4eee907", 9);
    level.gulag.numarmorhealth = getdvarint(@"hash_abe2e86213098021", 100);
    level.gulag.var_28f8483ea37164f3 = getdvarint(@"hash_2ebff4c1f3d778e0", 2);
    level.gulag.var_5ebd7968d809fbac = getdvarint(@"hash_ed69eaadbd3c2a", 0);
    level.gulag.var_c489bd0446d6b041 = getdvarint(@"hash_e7819166ffa65760", 0);
    level.gulag.var_652312821a44b886 = getdvarfloat(@"hash_81b659c0585a8952", 7);
    level.gulag.var_7d2261a38e79508d = getdvarint(@"hash_283378c11c27c32c", 1);
    level.gulag.var_3fc59bce0c73b8cf = getdvarint(@"hash_25f058368af3bc5a", 400);
    level.gulag.var_a3f8d04220deba43 = getdvarint(@"hash_ea64fff27301195a", 200);
    level.gulag.var_218b40bcf0f79b1f = getdvarint(@"hash_590ae68d2c03b69b", 5);
    level.gulag.var_eaba0d28010b979b = getdvarint(@"hash_21d1ffccfa1e0436", 0);
    level.gulag.var_3b466222a6fc9233 = getmatchrulesdata("brData", "gulagCircleDisable");
    level.gulag.var_86f0de18e07f0b7f = getdvarint(@"hash_9086d17110b3195b", 1);
    level.gulag.var_1dc4b5e63b8d0243 = getdvarint(@"hash_39b3dfa0d177879d", 10);
    if (function_cfe304859f30e747("gulagGetMatchDuration")) {
        level.gulag.timelimit = function_3cceb052d780fef1("gulagGetMatchDuration");
    } else {
        level.gulag.timelimit = getdvarfloat(@"hash_8be34599dfa102b8", 15);
    }
    _setdomflagiconinfo("waypoint_captureneutral", "neutral", "MP_BR_INGAME/DOM_CAPTURE", 0);
    _setdomflagiconinfo("waypoint_capture", "enemy", "MP_BR_INGAME/DOM_CAPTURE", 0);
    _setdomflagiconinfo("waypoint_defend", "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", 0);
    _setdomflagiconinfo("waypoint_defending", "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", 0);
    _setdomflagiconinfo("waypoint_contested", "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", 1);
    _setdomflagiconinfo("waypoint_taking", "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", 1);
    _setdomflagiconinfo("waypoint_losing", "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", 1);
    level.gulag.laststandplayers = [];
    if (istrue(level.gulag.arenaflag)) {
        namespace_564346a19fee25e0::setupdom();
    }
    namespace_21b1a5889fd8d167::function_1125faa6bc85e080();
    namespace_f8d983d04dd7f098::init();
    level.gulag.arenas = gulaggetarenas();
    gulaggesturesinit();
    gulaginitloadouts();
    if (level.gulag.introcinematic) {
        namespace_3846cfb60b2ef12f::registeronluieventcallback(&playercinematiccompletecallback);
    }
    if (level.gulag.usefloorrocks) {
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("brloot_rock", &rockused);
    }
    level.gulag.betting = getdvarint(@"hash_3fb4b54c096217", 0);
    if (level.gulag.betting) {
        /#
            assertex(isdefined(level.br_plunder_enabled), "Plunder must be initialized before gulag if betting enabled");
        #/
        if (!istrue(level.br_plunder_enabled)) {
            level.gulag.betting = 0;
        }
    }
    foreach (arena in level.gulag.arenas) {
        level thread monitorgulag(arena);
    }
    thread spawnac130();
    initvo();
    level.gamemodemolotovfunc = &recordmolotov;
    level thread function_728a4949ace743bd();
    level notify("initialized_gulag");
    /#
        namespace_3c37cb17ade254d::registersharedfunc("ui_gulag", "ui_mp_br_mapmenu_icon_gulag_overtime_objective", &function_e6c82ddc6a58c02f);
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e8
// Size: 0xfe
function function_7959e2df2cc7c5b4() {
    if (!istrue(level.usegulag)) {
        return;
    }
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        if (isdefined(level.gulag.arenas) && level.gulag.arenas.size > 0) {
            bestdistance = 2000;
            arena = undefined;
            for (i = 0; i < level.gulag.arenas.size; i++) {
                dist = distance(self.origin, level.gulag.arenas[i].origin);
                if (dist < bestdistance) {
                    arena = level.gulag.arenas[i];
                    bestdistance = dist;
                }
            }
            function_662aaf2f16ed4e1e(arena);
        }
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ed
// Size: 0x286
function function_662aaf2f16ed4e1e(arena) {
    if (!isdefined(arena) || arena.jailedplayers.size == 0 && arena.arenaplayers.size == 0) {
        self setclientomnvar("ui_gulag", 0);
        return;
    } else {
        if (arena.arenaplayers.size == 0) {
            if (arena.jailedplayers.size == 1) {
                self setclientomnvar("ui_br_gulag_match_state", 0);
                self setclientomnvar("ui_br_gulag_match_end_time", arena.jailedplayers[0].jailtimeoutend);
            }
        } else {
            if (isdefined(arena.fightover) && !arena.fightover && isdefined(arena.time) && arena.time > 0) {
                time = arena.time;
                if (!istrue(arena.overtime)) {
                    var_55c0e7e44829e72e = getovertimelength();
                    time = time - var_55c0e7e44829e72e;
                }
                self setclientomnvar("ui_br_gulag_match_end_time", gettime() + int(time * 1000));
            } else {
                self setclientomnvar("ui_br_gulag_match_end_time", 0);
            }
            var_b62f45ede37a2e21 = arena.arenaplayers[0] getclientomnvar("ui_br_gulag_match_state");
            if (var_b62f45ede37a2e21) {
                self setclientomnvar("ui_br_gulag_match_state", var_b62f45ede37a2e21);
            }
            var_c8a5261a0fca66d4 = 0;
            var_4c096c17e2c382e1 = 0;
            var_77fa43fc5f58845d = 4;
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
            self setclientomnvar("ui_br_twotwo_gulag_players", var_c8a5261a0fca66d4);
        }
        self setclientomnvar("ui_gulag", 1);
        self setclientomnvar("ui_br_gulag_data", arena.omnvardata["ui_br_gulag_data"]);
        self setclientomnvar("ui_overtime_timer_show", istrue(arena.overtime));
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377a
// Size: 0x6a
function _setdomflagiconinfo(name, colors, string, var_b50e35d9c370899b) {
    level.waypointcolors[name] = colors;
    level.waypointbgtype[name] = 1;
    level.waypointstring[name] = string;
    level.waypointshader[name] = "ui_mp_br_mapmenu_icon_gulag_overtime_objective";
    level.waypointpulses[name] = var_b50e35d9c370899b;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37eb
// Size: 0x157
function initvo() {
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["gulag_spawn"] = "gula_grav_spaw";
    game["dialog"]["gulag_spawn_rules"] = "gula_grav_spru";
    game["dialog"]["gulag_objective"] = "bjcv_grav_gulg";
    game["dialog"]["gulag_jailer_match_start"] = "fght_jalr_gums";
    game["dialog"]["gulag_next"] = "gula_grav_next";
    game["dialog"]["gulag_win"] = "gula_grav_winn";
    game["dialog"]["gulag_lose"] = "lose_grav_gulg";
    game["dialog"]["gulag_teammate_gulag"] = "tmmg_grav_gulg";
    game["dialog"]["gulag_teammate_lose"] = "tmls_grav_gulg";
    game["dialog"]["gulag_teammate_win"] = "tmwn_grav_gulg";
    game["dialog"]["gulag_gulag_active"] = "glgc_grav_gulg";
    game["dialog"]["gulag_gulag_close"] = "glgl_grav_gulg";
    game["dialog"]["gulag_noenemy"] = "noen_grav_gulg";
    game["dialog"]["gulag_timeout"] = "noen_grav_gulg";
    game["dialog"]["gulag_buyback"] = "pblc_grav_jbgn";
    game["dialog"]["gulag_taunt"] = "gulag_taunt";
    game["dialog"]["gulag_obj_wait"] = "gulag_obj_wait";
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3949
// Size: 0x1e1
function gulaggetarenas() {
    if (level.var_43307855f189eb31.name == "") {
        arenas = getstructarray("gulag", "targetname");
    } else {
        arenas = getstructarray(level.var_43307855f189eb31.targetname, "targetname");
    }
    var_82089120e8a68d6c = function_43acb991ce957f46("addArenas");
    arenas = array_combine(arenas, var_82089120e8a68d6c);
    var_9e37dae514c87448 = strtok(level.var_43307855f189eb31.var_7679335be79f4871, " ");
    var_26509caba5cc603a = [];
    for (i = 0; i < var_9e37dae514c87448.size; i++) {
        gulagarena = arenas[int(var_9e37dae514c87448[i])];
        if (isdefined(gulagarena)) {
            var_26509caba5cc603a[var_26509caba5cc603a.size] = gulagarena;
        }
    }
    if (var_26509caba5cc603a.size > 0) {
        arenas = array_remove_array(arenas, var_26509caba5cc603a);
    }
    foreach (arena in arenas) {
        if (!isdefined(arena.sortvalue)) {
            arena.sortvalue = randomfloat(1);
        }
    }
    arenas = namespace_9c840bb9f2ecbf00::quicksort(arenas, &function_fd632cf80052c66b);
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        arenas = getstructarray("gulag_tutorial", "targetname");
    }
    /#
        assert(arenas.size > 0);
    #/
    /#
        assert(arenas.size <= 8 - 1);
    #/
    for (i = 0; i < arenas.size; i++) {
        arena = arenas[i];
        arena.gulagindex = i;
        setuparena(arena);
    }
    return arenas;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b32
// Size: 0x2b
function function_fd632cf80052c66b(left, right) {
    return left.sortvalue <= right.sortvalue;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b65
// Size: 0x564
function setuparena(arena) {
    arena.jailspawns = [];
    arena.fightspawns = [];
    arena.var_ef9a0b82ce1a505a = [];
    arena.cellspawns = [];
    arena.gates = [];
    arena.floor = [];
    arena.weapons = [];
    arena.molotovs = [];
    arena.var_7818db04cabeec42 = [];
    arena.jailedplayers = [];
    arena.arenaplayers = [];
    arena.matches = [];
    arena.loadingplayers = [];
    arena.fightover = 1;
    arena.omnvardata = [];
    arena.omnvardata["ui_br_gulag_players_1"] = 0;
    arena.omnvardata["ui_br_gulag_data"] = 0;
    var_3c7899636cba8ab = [];
    targets = getstructarray(arena.target, "targetname");
    foreach (target in targets) {
        if (target.script_noteworthy == "prison_spawn") {
            arena.jailspawns[arena.jailspawns.size] = target;
        } else if (target.script_noteworthy == "gulag_twotwo_spectator_spawn") {
            if (isdefined(level.var_48e6357833f85b3b) && array_contains(level.var_48e6357833f85b3b, target)) {
                continue;
            }
            arena.jailspawns[arena.jailspawns.size] = target;
        } else if (target.script_noteworthy == "fight_spawn") {
            arena.fightspawns[arena.fightspawns.size] = target;
        } else if (target.script_noteworthy == "gulag_twotwo_spawn_fight") {
            arena.fightspawns[arena.fightspawns.size] = target;
        } else if (target.script_noteworthy == "gulag_twotwo_spawn_fight_alt1") {
            arena.var_ef9a0b82ce1a505a[arena.var_ef9a0b82ce1a505a.size] = target;
        } else if (target.script_noteworthy == "gulag_dom_player_spawn") {
            arena.fightspawns[arena.fightspawns.size] = target;
        } else if (target.script_noteworthy == "cell_spawn") {
            arena.cellspawns[arena.cellspawns.size] = target;
        } else if (target.script_noteworthy == "gulag_center") {
            arena.center = target.origin;
        } else if (target.script_noteworthy == "spectator") {
            arena.spectatepoint = target;
        } else if (target.script_noteworthy == "gulag_twotwo_spectator") {
            arena.spectatepoint = target;
        } else if (target.script_noteworthy == "gulag_dom_prematch_spawn") {
            arena.var_c379148a901939ac = target;
        } else if (target.script_noteworthy == "gulag_twotwo_center") {
            arena.var_1df1acee38dcca72 = target.origin;
        } else if (target.script_noteworthy == "gulag_ladder") {
            arena.var_7818db04cabeec42[arena.var_7818db04cabeec42.size] = target;
        } else if (isdefined(target.script_parameters) && target.script_parameters == "gulag_loot") {
            var_3c7899636cba8ab[var_3c7899636cba8ab.size] = target;
        }
    }
    if (!isdefined(arena.center)) {
        arena.center = getgulagcenter(arena);
    }
    if (getdvarint(@"hash_f76a1354fc64e33a", 1) > 0) {
        arena.fightspawns = array_sort_with_func(arena.fightspawns, &comparescriptindexobscuredspawns);
    } else {
        arena.fightspawns = array_sort_with_func(arena.fightspawns, &comparescriptindexsmalltolarge);
    }
    foreach (var_4cd366ef5a786ae4 in arena.cellspawns) {
        setupcellspawn(arena, var_4cd366ef5a786ae4);
    }
    arena.cellspawns = array_sort_with_func(arena.cellspawns, &comparescriptindexsmalltolarge);
    if (istrue(level.gulag.spawnloot)) {
        arena.weapons = spawnlootweapons(var_3c7899636cba8ab);
    }
    spawnrocks(arena);
    if (istrue(level.gulag.arenaflag)) {
        setupdomendflag(arena);
    }
    function_c724f178c2df7240("setupArena", arena);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d0
// Size: 0x13d
function gulaggesturesinit() {
    level.gulag.gestures_enabled = getdvarint(@"hash_299ae8c08206178", 0);
    if (!istrue(level.gulag.gestures_enabled)) {
        return;
    }
    level.gulag.gestures = [];
    level.gulag.gestures["fc_gesture_neg"] = [0:"iw8_ges_plyr_gesture_crush", 1:"iw8_ges_plyr_gesture_rally", 2:"iw8_ges_plyr_gesture_revive"];
    level.gulag.gestures["fc_gesture_pos"] = [0:"iw8_ges_plyr_gesture_doubletime", 1:"iw8_ges_plyr_gesture_hold", 2:"iw8_ges_plyr_gesture_ok", 3:"iw8_ges_plyr_gesture_thumbs_up"];
    level.gulag.gesturesounds["fc_gesture_neg"] = [0:"tmp_gulag_gesture_neg_crush", 1:"tmp_gulag_gesture_neg_rally", 2:"tmp_gulag_gesture_neg_revive"];
    level.gulag.gesturesounds["fc_gesture_pos"] = [0:"tmp_gulag_gesture_pos_doubletime", 1:"tmp_gulag_gesture_pos_hold", 2:"tmp_gulag_gesture_pos_ok", 3:"tmp_gulag_gesture_pos_thumbs_up"];
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4214
// Size: 0x57
function getmaxplayers() {
    maxplayers = int(clamp(getdvarint(@"hash_29bf69a5061ebfc3", 2), 2, 2));
    if (maxplayers % 2 != 0) {
        maxplayers = maxplayers - 1;
    }
    if (function_cfe304859f30e747("gulagGetMaxPlayers")) {
        maxplayers = function_3cceb052d780fef1("gulagGetMaxPlayers");
    }
    return maxplayers;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4273
// Size: 0x2b
function comparescriptindexsmalltolarge(left, right) {
    return left.script_index < right.script_index;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a6
// Size: 0x73
function comparescriptindexobscuredspawns(left, right) {
    if (left.script_index == 4) {
        return 1;
    } else if (left.script_index == 5) {
        return 1;
    } else if (right.script_index == 4) {
        return 0;
    } else if (right.script_index == 5) {
        return 0;
    }
    return comparescriptindexsmalltolarge(left, right);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4321
// Size: 0x6a
function copystructwithoffset(struct, offset, script_index) {
    next = spawnstruct();
    next.origin = struct.origin + offset;
    next.angles = struct.angles;
    next.script_index = script_index;
    return next;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4393
// Size: 0xba
function getgulagcenter(arena) {
    var_2f432d8c975decc6 = (0, 0, 0);
    if (isdefined(arena) && isdefined(arena.fightspawns) && arena.fightspawns.size > 0) {
        foreach (struct in arena.fightspawns) {
            var_2f432d8c975decc6 = var_2f432d8c975decc6 + struct.origin;
        }
        var_2f432d8c975decc6 = var_2f432d8c975decc6 / arena.fightspawns.size;
    }
    return var_2f432d8c975decc6;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4455
// Size: 0x72
function spawnweapon(loc, gun, var_27c0612cfd76ee91) {
    weapon = namespace_3bcd40a3005712ec::createspawnweaponatpos(getgroundposition(loc.origin + (0, 0, 12), 12), loc.angles + (0, 0, 90), gun);
    weapon thread outlinewatchplayerprox(var_27c0612cfd76ee91);
    return weapon;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44cf
// Size: 0x392
function spawnlootweapons(var_3c7899636cba8ab) {
    var_68490a59162353a8 = [];
    var_2e7c6ea3e6ea14cf = [];
    var_2e7c6ea3e6ea14cf["none"] = [0:"none"];
    var_2e7c6ea3e6ea14cf["tactical"] = namespace_cb965d2f71fefddc::getgulagpickupsforclass("tactical");
    var_2e7c6ea3e6ea14cf["lethal"] = namespace_cb965d2f71fefddc::getgulagpickupsforclass("lethal");
    var_31351647880100c7 = [];
    foreach (var_659afabdb2de8ece in var_2e7c6ea3e6ea14cf) {
        foreach (scriptable in var_659afabdb2de8ece) {
            startammo = 1;
            if (isdefined(var_31351647880100c7[scriptable])) {
                continue;
            }
            info = level.br_lootiteminfo[scriptable];
            if (isdefined(info)) {
                baseweapon = level.br_lootiteminfo[scriptable].baseweapon + "_mp";
                startammo = weaponclipsize(baseweapon) * 1;
            }
            var_31351647880100c7[scriptable] = startammo;
        }
    }
    var_a87e40016e3d9f3a = [0:"tactical", 1:"tactical", 2:"lethal", 3:"lethal", 4:"lethal"];
    var_a87e40016e3d9f3a = array_randomize(var_a87e40016e3d9f3a);
    var_719e1cd141dbcf8c = [];
    var_719e1cd141dbcf8c["floor_center_01"] = random(var_2e7c6ea3e6ea14cf[var_a87e40016e3d9f3a[0]]);
    var_719e1cd141dbcf8c["floor_center_02"] = random(var_2e7c6ea3e6ea14cf[var_a87e40016e3d9f3a[1]]);
    var_719e1cd141dbcf8c["floor_right_01"] = random(var_2e7c6ea3e6ea14cf[var_a87e40016e3d9f3a[2]]);
    var_719e1cd141dbcf8c["floor_left_01"] = random(var_2e7c6ea3e6ea14cf[var_a87e40016e3d9f3a[3]]);
    var_719e1cd141dbcf8c["floor_mid_01"] = random(var_2e7c6ea3e6ea14cf[var_a87e40016e3d9f3a[4]]);
    if (getdvarint(@"hash_f76a1354fc64e33a", 1) > 0) {
        var_719e1cd141dbcf8c["floor_left_01"] = var_719e1cd141dbcf8c["floor_right_01"];
    }
    foreach (struct in var_3c7899636cba8ab) {
        if (!isdefined(struct.script_noteworthy)) {
            /#
                println("gulag_lose");
            #/
        } else {
            scriptablename = var_719e1cd141dbcf8c[struct.script_noteworthy];
            if (!isdefined(scriptablename)) {
                /#
                    println("_mp" + struct.script_noteworthy + "circle_index");
                #/
            } else {
                if (scriptablename == "none") {
                    continue;
                }
                origin = struct.origin;
                angles = struct.angles;
                if (!isdefined(angles)) {
                    angles = (0, 0, 0);
                } else {
                    angles = (0, angles[1], 0);
                }
                scriptable = spawnscriptable(scriptablename, origin, angles);
                if (isdefined(scriptable)) {
                    scriptable.part = scriptablename;
                    namespace_cb965d2f71fefddc::loot_setitemcount(scriptable, var_31351647880100c7[scriptablename]);
                    scriptable.keepinmap = 1;
                    var_68490a59162353a8[var_68490a59162353a8.size] = scriptable;
                } else {
                    /#
                        println("fight_over_early" + scriptablename + "MP/LETHALS_UNAVAILABLE_FOR_N");
                    #/
                }
            }
        }
    }
    return var_68490a59162353a8;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4869
// Size: 0x90
function playerismatchedplayerready(arena) {
    if (playerismatchpending(arena)) {
        var_607899d4420fe1a5 = arena.matches[0];
        foreach (player in var_607899d4420fe1a5) {
            if (player == self) {
                continue;
            } else if (isplayerloading(player, arena)) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4901
// Size: 0x7d
function playerismatchpending(arena) {
    if (ismatchpending(arena)) {
        var_607899d4420fe1a5 = arena.matches[0];
        foreach (player in var_607899d4420fe1a5) {
            if (player == self) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4986
// Size: 0x62
function ismatchpending(arena) {
    if (arena.matches.size == 0) {
        return 0;
    }
    var_607899d4420fe1a5 = arena.matches[0];
    if (function_cfe304859f30e747("gulagIsMatchPending")) {
        return function_3cceb052d780fef1("gulagIsMatchPending", var_607899d4420fe1a5, arena);
    } else if (var_607899d4420fe1a5.size < 2) {
        return 0;
    }
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f0
// Size: 0x134
function isfightready(arena) {
    if (!ismatchpending(arena)) {
        return 0;
    }
    var_607899d4420fe1a5 = arena.matches[0];
    foreach (player in var_607899d4420fe1a5) {
        if (level.gulag.var_c489bd0446d6b041) {
            logstring("[GULAG DEBUG] : Player " + player.clientid + " is being checked for isFightReady step 1. Time : " + gettime() + ". Player enterGulagWait : " + istrue(player.entergulagwait) + " Player jailed : " + istrue(player.jailed) + " . Player waiting area timer : " + istrue(player.var_d95581fdfc29ec7a) + " . Number of players in the queue for gulag are : " + arena.matches.size + " .");
        }
        if (istrue(player.entergulagwait) || !istrue(player.jailed)) {
            return 0;
        }
        if (isdefined(player.var_d95581fdfc29ec7a)) {
            return 0;
        }
    }
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2c
// Size: 0xe6
function function_8af4800d9dd40258(arena) {
    if (!function_1980065ce4dc067b() || getdvarint(@"hash_abbfd88d4515a08c", 1) == 0) {
        return;
    }
    if (arena.fightover && arena.arenaplayers.size > 0) {
        arena.arenaplayers = array_removeundefined(arena.arenaplayers);
        foreach (player in arena.arenaplayers) {
            if (!istrue(player.gulag)) {
                arena.arenaplayers = array_remove(arena.arenaplayers, player);
            }
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c19
// Size: 0x162
function gulagfixuparena(arena) {
    var_c5192a759de07642 = 5000;
    if (!isdefined(arena.nextfixupcheckms)) {
        arena.nextfixupcheckms = gettime() + var_c5192a759de07642;
        return;
    }
    if (gettime() > arena.nextfixupcheckms) {
        arena.jailedplayers = array_removeundefined(arena.jailedplayers);
        updatematchqueuepositions(arena);
        function_8af4800d9dd40258(arena);
        if (arena.gulagindex == 0) {
            level.gulag.laststandplayers = array_removeundefined(level.gulag.laststandplayers);
            foreach (player in level.gulag.laststandplayers) {
                if (!istrue(player.inlaststand)) {
                    level.gulag.laststandplayers = array_remove(level.gulag.laststandplayers, player);
                }
            }
        }
        arena.nextfixupcheckms = gettime() + var_c5192a759de07642;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d82
// Size: 0x46
function function_127c772f981aefc1(arena) {
    arena.jailedplayers = array_removeundefined(arena.jailedplayers);
    arena.arenaplayers = array_removeundefined(arena.arenaplayers);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dcf
// Size: 0x2c5
function monitorgulag(arena) {
    level endon("game_ended");
    while (1) {
        gulagfixuparena(arena);
        if (istrue(level.br_prematchstarted)) {
            if (istrue(level.gulag.shutdown)) {
                if (arena.loadingplayers.size != 0) {
                    arena waittill_notify_or_timeout("loadingPlayersEmpty", level.gulag.var_d373eba3425dcc77);
                }
                if (level.gulag.endonshutdown == 1) {
                    foreach (player in arena.jailedplayers) {
                        player.gulagloser = 1;
                        player kill();
                    }
                    arena.shutdown = 1;
                } else if (level.gulag.endonshutdown == 2) {
                    thread dojailbreak(arena);
                } else if (level.gulag.endonshutdown == 3 && (istrue(arena.shutdown) || !ismatchpending(arena) && !anyplayersinlaststandhold())) {
                    foreach (player in arena.jailedplayers) {
                        if (isalive(player)) {
                            player playergulagarenaready();
                            thread gulagvictory(arena, player, 1, 0, "shutdown");
                            function_94eb48dd1cd7f972(player, "Shutdown", 0);
                        }
                    }
                    thread function_bfff708b15cd22d0();
                    if (getdvarint(@"hash_7aad3ab9fa557f5a", 0)) {
                        logstring("[GULAG DEBUG] : gulag shutdown! Ending monitoring thread for arena index " + array_find(level.gulag.arenas, arena));
                    }
                    arena.shutdown = 1;
                }
                if (istrue(arena.shutdown)) {
                    return;
                }
            }
            /#
                if (getdvarint(@"hash_8c0da1f3585f4602", 0) > 0) {
                    print3d(level.gulag.arenas[0].center, "ui_objective_text");
                    waitframe();
                    continue;
                }
            #/
            if (isgulagpaused()) {
                waitframe();
                continue;
            }
            if (isfightready(arena)) {
                if (function_9005af34e01bf8fe()) {
                    level thread beginNewIndividualFight(arena);
                } else {
                    beginnewfight(arena);
                }
            } else {
                setjailtimeouthud(arena);
            }
        }
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509b
// Size: 0x2f
function pausegulag(bpaused) {
    if (!istrue(level.usegulag)) {
        return;
    }
    level.gulag.paused = bpaused;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50d1
// Size: 0x25
function isgulagpaused() {
    return istrue(level.usegulag) && istrue(level.gulag.paused);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50fe
// Size: 0x9b
function areanygulagfightsactive() {
    if (!istrue(level.usegulag)) {
        return 0;
    }
    foreach (arena in level.gulag.arenas) {
        if (function_1980065ce4dc067b()) {
            if (arena.arenaplayers.size > 0) {
                return 1;
            }
        } else if (!arena.fightover) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a1
// Size: 0x2c
function jailbreakeventplayer() {
    if (isdefined(self) && isalive(self)) {
        gulagvictory(self.arena, self, 1, 1, "jailbreakEvent");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d4
// Size: 0x55
function circletimer(circleindex) {
    if (istrue(level.usegulag) && !istrue(level.gulag.shutdown)) {
        var_db3353ae94adec9d = getgulagclosedcircleindex();
        if (circleindex >= var_db3353ae94adec9d) {
            shutdowngulag("circle_index", circleindex);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5230
// Size: 0x1b7
function shutdowngulag(reason, reason_count, var_dedcc523db8309b1) {
    if (!istrue(level.usegulag) || istrue(level.gulag.shutdown)) {
        return;
    }
    setomnvar("ui_gulag_state", 0);
    setomnvar("ui_gulag_show_closing_state", 2);
    level.gulag.shutdown = 1;
    namespace_a011fbf6d93f25e5::function_afd45555767f3079();
    if (isdefined(level.var_ed844db90cb6d370) && issharedfuncdefined("teamAssim", "permanentlyDisableAssim")) {
        [[ getsharedfunc("teamAssim", "permanentlyDisableAssim") ]]();
    }
    thread makeac130flyaway();
    if (!istrue(var_dedcc523db8309b1)) {
        foreach (player in level.players) {
            player function_5e9a06395ffa9c82();
            if (istrue(player.inlaststand)) {
                level.gulag.laststandplayers[level.gulag.laststandplayers.size] = player;
            } else {
                if (!isdefined(player) || !isalive(player) || isdefined(player.gulag)) {
                    continue;
                }
                player playergulagdonesplash();
                player function_dd93503cf95b6277();
            }
        }
    }
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(1);
    level notify("gulag_closed");
    dlog_recordevent("dlog_event_br_gulag_shutdown", [0:"reason", 1:reason, 2:"reason_count", 3:reason_count]);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53ee
// Size: 0x1e2
function function_5e9a06395ffa9c82() {
    var_fc3c57822786291a = 0;
    var_be4684f53e4f5566 = 0;
    if (istrue(level.br_pickups.respawntokenclosewithgulag) && namespace_d3d40f75bb4e4c32::hasrespawntoken() && level.gulag.var_3fc59bce0c73b8cf > 0) {
        var_fc3c57822786291a = 1;
        namespace_cb965d2f71fefddc::removerespawntoken();
        namespace_c6ccccd95254983f::playerplunderpickup(level.gulag.var_3fc59bce0c73b8cf);
    }
    if (istrue(level.br_pickups.var_5609de5240e42e84) && level.gulag.var_a3f8d04220deba43 > 0) {
        var_291cd3b5c7d9d564 = 0;
        if (namespace_d3d40f75bb4e4c32::function_15da77dc195bd80a()) {
            var_291cd3b5c7d9d564++;
            namespace_cb965d2f71fefddc::function_17e127f2e3771058();
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a("brloot_gulag_token")) {
            var_291cd3b5c7d9d564 = var_291cd3b5c7d9d564 + namespace_e50e624d9af51c8c::function_43f9da47b5084ce0("brloot_gulag_token");
        }
        if (var_291cd3b5c7d9d564 > 0) {
            var_be4684f53e4f5566 = 1;
            namespace_c6ccccd95254983f::playerplunderpickup(var_291cd3b5c7d9d564 * level.gulag.var_a3f8d04220deba43);
        }
    }
    if (istrue(level.br_pickups.var_5609de5240e42e84) && checkgulagusecount() && level.gulag.var_a3f8d04220deba43 > 0) {
        var_be4684f53e4f5566 = 1;
        namespace_c6ccccd95254983f::playerplunderpickup(level.gulag.var_a3f8d04220deba43);
    }
    if (var_fc3c57822786291a && var_be4684f53e4f5566) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_redeployGulag_conversion", undefined, level.gulag.var_218b40bcf0f79b1f);
    } else if (var_fc3c57822786291a) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_redeploy_conversion", undefined, level.gulag.var_218b40bcf0f79b1f);
    } else if (var_be4684f53e4f5566) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_gulag_conversion", undefined, level.gulag.var_218b40bcf0f79b1f);
    }
    function_6a39684e5bf90a2f();
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55d7
// Size: 0xd7
function function_6a39684e5bf90a2f() {
    var_2621d983f664e79a = getlootscriptablearray("brloot_redeploy_token", undefined);
    var_fdbb7e6149e0fcf6 = getlootscriptablearray("brloot_gulag_token", undefined);
    foreach (var_d8cd9c1941a88194 in var_2621d983f664e79a) {
        namespace_cb965d2f71fefddc::loothide(var_d8cd9c1941a88194);
    }
    foreach (var_d8cd9c1941a88194 in var_fdbb7e6149e0fcf6) {
        namespace_cb965d2f71fefddc::loothide(var_d8cd9c1941a88194);
    }
    level.br_pickups.var_ec8acc2cb92ceaf7 = 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56b5
// Size: 0x19
function anyplayersinlaststandhold() {
    return level.gulag.laststandplayers.size > 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d6
// Size: 0x45
function playerinlaststandhold() {
    if (!istrue(level.usegulag) || !istrue(level.gulag.shutdown)) {
        return 0;
    }
    return array_contains(level.gulag.laststandplayers, self);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5723
// Size: 0x9f
function gulaglaststandholdremove(player) {
    if (istrue(level.gulag.shutdown) && anyplayersinlaststandhold()) {
        if (isdefined(player) && player playerinlaststandhold()) {
            level.gulag.laststandplayers = array_remove(level.gulag.laststandplayers, player);
            return 1;
        } else {
            level.gulag.laststandplayers = array_removeundefined(level.gulag.laststandplayers);
        }
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57ca
// Size: 0x3d
function onplayerdisconnect(player) {
    if (!istrue(level.usegulag)) {
        return;
    }
    gulaglaststandholdremove(player);
    if (function_cfe304859f30e747("gulagOnPlayerDisconnect")) {
        player function_3cceb052d780fef1("gulagOnPlayerDisconnect");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580e
// Size: 0x30
function playerexitlaststand(revived) {
    if (!istrue(level.usegulag)) {
        return;
    }
    if (istrue(revived)) {
        if (gulaglaststandholdremove(self)) {
            playergulagdonesplash();
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5845
// Size: 0xba
function getgulagclosedcircleindex() {
    if (!istrue(level.usegulag)) {
        return 0;
    }
    if (!isdefined(level.br_level) || !isdefined(level.br_level.br_circledelaytimes)) {
        return 0;
    }
    offset = level.br_level.br_movingcirclegulagcloseoffset;
    if (!isdefined(offset)) {
        offset = 0;
    }
    if (function_cfe304859f30e747("gulagGetClosedCircleIndex")) {
        return function_3cceb052d780fef1("gulagGetClosedCircleIndex", offset);
    } else {
        return (level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_1141fea0c6ef428f", level.gulag.var_3b466222a6fc9233) - offset);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5906
// Size: 0x3f
function setupgulagtimer() {
    var_2948ca54731de34f = gettimetogulagclosed();
    var_754110404c0d574f = gettime() + var_2948ca54731de34f * 1000;
    setomnvar("ui_gulag_timer", var_754110404c0d574f);
    thread showclosingmessage(var_2948ca54731de34f);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x594c
// Size: 0x58
function showclosingmessage(var_2948ca54731de34f) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    var_fc133e1a9d8063a1 = getdvarint(@"hash_bf9aaa13e23f04ae", 90);
    var_6113fc02b7117903 = var_2948ca54731de34f - var_fc133e1a9d8063a1;
    if (0 < var_6113fc02b7117903) {
        wait(var_6113fc02b7117903);
        setomnvar("ui_gulag_show_closing_state", 1);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ab
// Size: 0xaa
function gettimetogulagclosed() {
    time = 0;
    if (isdefined(level.br_level) && isdefined(level.br_level.br_circlecenters)) {
        var_db3353ae94adec9d = getgulagclosedcircleindex();
        for (circleindex = 0; circleindex < var_db3353ae94adec9d; circleindex++) {
            timedelay = level.br_level.br_circledelaytimes[circleindex];
            var_3d8565e2775a243c = level.br_level.br_circleclosetimes[circleindex];
            time = time + timedelay + var_3d8565e2775a243c;
        }
    }
    return int(time);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a5d
// Size: 0x40
function playergulagdonesplash() {
    if (istrue(self.gulagdone)) {
        return;
    }
    self.gulagdone = 1;
    namespace_7015c4c971547a66::dangernotifyplayer(self, "gulag_closed", 3);
    thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_gulag_close", self, undefined, undefined, 2);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aa4
// Size: 0x265
function dojailbreak(arena) {
    if (arena.jailedplayers.size == 0) {
        arena.shutdown = 1;
        return;
    }
    arena.isjailbreak = 1;
    arena.arenaplayers = array_removeundefined(arena.jailedplayers);
    jailbreaktimerwait(arena);
    loadoutindex = getloadoutindex();
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player thread gulagplayerwatchfordeath(arena);
        player initplayerarena(arena, 1, loadoutindex, "doJailBreak");
        if (istrue(level.gulag.gestures_enabled) && !isbot(player)) {
            player playergulaggesturesdisable();
        }
        if (getdvarint(@"hash_3ceaf2c0c66c3dc2", 0) > 0 && arena.arenaplayers.size > 0) {
            player hudoutlinedisableforclients(arena.arenaplayers);
        }
    }
    playsoundatpos(arena.center, "evt_br_gulag_round_start_buzzer");
    arena.fightover = 0;
    if (!isoneteamleft(arena)) {
        arena.time = level.gulag.timelimit;
        updatematchtimerhud(arena, arena.time);
        waittillgulagmatchend(arena, 0);
    } else {
        arena.time = 8;
        updatematchtimerhud(arena, arena.time);
        wait(arena.time);
    }
    foreach (player in arena.arenaplayers) {
        if (isdefined(player) && isdefined(player.gulagjailbreakhud)) {
            player.gulagjailbreakhud destroy();
        }
    }
    handleendarena(arena);
    arena.shutdown = 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d10
// Size: 0x1a1
function jailbreaktimerwait(arena) {
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player thread namespace_44abc05161e2e2cb::showsplash("br_gulag_jail_break");
        if (getdvarint(@"hash_3ceaf2c0c66c3dc2", 0) > 0) {
            player hudoutlineenableforclients(arena.arenaplayers, "outline_nodepth_red");
        }
    }
    wait(3);
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player playeraddjailbreaktimer();
    }
    gulagcountdowntimer(arena, 0);
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_match_start_countdown", 0);
        player setclientomnvar("ui_match_in_progress", 1);
        if (isdefined(player) && isdefined(player.gulagjailbreakhud)) {
            player.gulagjailbreakhud.label = "MP/BR_GULAG_JAILBREAK";
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eb8
// Size: 0x4f
function playeraddjailbreaktimer() {
    self.gulagjailbreakhud = namespace_52f6938dd902c7d0::createfontstring("default", 2);
    self.gulagjailbreakhud namespace_52f6938dd902c7d0::setpoint("CENTER", "CENTER", 0, -150);
    self.gulagjailbreakhud.label = "MP/BR_GULAG_JAILBREAK_IN";
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0e
// Size: 0x76
function resetequipment(arena) {
    if (!istrue(level.gulag.spawnloot)) {
        return;
    }
    for (i = 0; i < arena.weapons.size; i++) {
        weapon = arena.weapons[i];
        weapon setscriptablepartstate(weapon.part, "visible");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8b
// Size: 0x38
function validateplayers(arena) {
    if (function_d58396c1483bfbdb()) {
        return (arena.arenaplayers.size >= 1);
    } else {
        return (arena.arenaplayers.size >= 2);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fca
// Size: 0x7f
function function_cecbd3aa752b9087(players) {
    level endon("game_ended");
    var_a3f956f52c85cbd = 0;
    while (!var_a3f956f52c85cbd) {
        waitframe();
        var_a3f956f52c85cbd = 1;
        foreach (player in players) {
            if (player isinexecutionvictim()) {
                var_a3f956f52c85cbd = 0;
                break;
            }
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6050
// Size: 0x343
function beginNewIndividualFight(arena) {
    level endon("game_ended");
    arena endon("fight_over_early");
    arena.fightover = 0;
    resetequipment(arena);
    resetarenaomnvardata(arena);
    /#
        println("gulagGetCountdownLength");
    #/
    var_3c02e542fa952687 = popnextmatch(arena);
    arena.arenaplayers = array_combine_unique(arena.arenaplayers, var_3c02e542fa952687);
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + var_3c02e542fa952687[0].clientid + " is starting new individual fight step 1. Time : " + gettime() + ". Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    loadoutindex = getloadoutindex();
    function_cecbd3aa752b9087(var_3c02e542fa952687);
    foreach (p in var_3c02e542fa952687) {
        arena.jailedplayers = array_remove(arena.jailedplayers, p);
        function_94eb48dd1cd7f972(p, "Match Starting", 0);
        p notify("beginNewFight");
        if (level.gulag.var_c489bd0446d6b041) {
            logstring("[GULAG DEBUG] : Player " + p.clientid + " is starting new individual fight step 2. Time : " + gettime() + ". Number of players in the queue for gulag are : " + arena.matches.size + " .");
        }
        p thread gulagplayerwatchfordeath(arena);
        p thread initplayerarena(arena, 0, loadoutindex, "beginNewIndividualFight");
        p playergulagarenaready();
        p thread playershowarenastartobjectivetext();
        p thread function_c68da8e2dde4dfa3(arena);
        p thread function_b0fda2bbb0c12ac2(function_59d019f0169c03be());
        p thread individualWaittillGulagMatchEnd(arena, level.gulag.timelimit);
        if (level.gulag.var_c489bd0446d6b041) {
            logstring("[GULAG DEBUG] : Player " + p.clientid + " is starting new individual fight step 3. Time : " + gettime() + ". Number of players in the queue for gulag are : " + arena.matches.size + " .");
        }
    }
    namespace_d3d40f75bb4e4c32::brleaderdialog("gulag_objective", 0, var_3c02e542fa952687);
    _updatematchtimerhudinternal(var_3c02e542fa952687, level.gulag.timelimit);
    foreach (p in arena.jailedplayers) {
        if (!isdefined(p)) {
            continue;
        }
        p.gulagposition--;
        if (level.gulag.var_c489bd0446d6b041) {
            logstring("[GULAG DEBUG] : Player " + p.clientid + " completed new individual fight step 4 and is being removed from jailedPlayers. Time : " + gettime() + ". Number of players in the queue for gulag are : " + arena.matches.size + " .");
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x639a
// Size: 0x83d
function beginnewfight(arena) {
    level endon("game_ended");
    arena endon("fight_over_early");
    arena.fightover = 0;
    resetequipment(arena);
    resetarenaomnvardata(arena);
    /#
        println("gulagGetCountdownLength");
    #/
    var_607899d4420fe1a5 = arena.matches[0];
    if (function_c9861a6c6b4085d8(var_607899d4420fe1a5, arena)) {
        arena.arenaplayers = function_e604f37bc584077d(arena);
        arena.var_654c981854394718 = array_remove_array(arena.var_654c981854394718, arena.arenaplayers);
        if (function_cfe304859f30e747("setGulagJailTimeoutVariation")) {
            function_3cceb052d780fef1("setGulagJailTimeoutVariation", arena);
        }
        foreach (p in arena.jailedplayers) {
            if (p getclientomnvar("ui_br_bink_overlay_state") == 5) {
                p namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
            }
        }
    } else {
        arena.arenaplayers = popnextmatch(arena);
        if (isdefined(arena.var_654c981854394718)) {
            foreach (p in arena.arenaplayers) {
                if (!isdefined(p)) {
                    continue;
                }
                index = array_find(arena.var_654c981854394718, p);
                if (isdefined(index)) {
                    arena.var_654c981854394718 = array_remove(arena.var_654c981854394718, p);
                }
            }
        }
        if (function_cfe304859f30e747("unsetGulagJailTimeoutVariation")) {
            function_3cceb052d780fef1("unsetGulagJailTimeoutVariation", arena);
        }
    }
    var_6ae446bba4624713 = 0;
    foreach (i, p in arena.arenaplayers) {
        if (isdefined(p)) {
            p.gulagposition = 0;
            arena.jailedplayers = array_remove(arena.jailedplayers, p);
            function_94eb48dd1cd7f972(p, "Begin Fight", 0);
        }
        if (!isdefined(p)) {
            var_6ae446bba4624713 = 1;
        } else if (p.gulag == 0 || p.jailed == 0 || p.gulagarena == 1) {
            namespace_9c840bb9f2ecbf00::demoforcesre("Player: " + p.name + " - invalid for gulag - p.gulag = " + p.gulag + ", p.jailed = " + p.jailed + ", p.gulagArena = " + p.gulagarena);
            var_6ae446bba4624713 = 1;
        } else {
            /#
                println("outline_depth_orange" + p.name);
            #/
            p.fighterindex = i;
            p notify("beginNewFight");
            if (istrue(p.var_4bb14f07087a5da)) {
                if (istrue(level.var_37e52c7fb7267efc.var_2713a9cf5318d984)) {
                    foreach (enemyai in function_b4b9401715cf98ea("gulag")) {
                        enemyai hudoutlinedisableforclient(p);
                    }
                }
                p.var_4bb14f07087a5da = undefined;
                p setclientomnvar("ui_rcd_controls", 0);
                p cameraunlink();
            }
        }
    }
    if (function_cfe304859f30e747("setGulagVariationTeams")) {
        arena function_3cceb052d780fef1("setGulagVariationTeams");
    }
    foreach (player in arena.jailedplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player.gulagposition--;
        if (level.gulag.var_eaba0d28010b979b) {
            if (!function_7effa8a355ddc886() || istrue(function_79fdf5cd036ff575())) {
                if (function_6e3541fd8fab45bc()) {
                    player namespace_1a507865f681850e::giveequipment("equip_rock", "primary");
                } else {
                    player setweaponammoclip("rock_mp", 5);
                }
            }
        }
    }
    if (var_6ae446bba4624713) {
        function_127c772f981aefc1(arena);
        if (!validateplayers(arena)) {
            if (function_1980065ce4dc067b()) {
                function_9135ada02e07bf10(arena, "br_twotwo_gulag_win", 0);
            }
            handleendarena(arena, undefined, 1);
            return;
        }
    }
    var_4b434533d3624bec = startbetting(arena, arena.arenaplayers);
    if (getdvarint(@"hash_30c3e9d4f1f094cf", 0)) {
        thread manageoutlines(arena, arena.arenaplayers, var_4b434533d3624bec);
    }
    /#
        assert(!usecellspawns(arena) || arena.arenaplayers.size <= 2);
    #/
    function_c724f178c2df7240("beginNewFight", arena);
    arena.arenaspawncounter = 0;
    loadoutindex = getloadoutindex();
    function_cecbd3aa752b9087(arena.arenaplayers);
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (function_cfe304859f30e747("gulagWatchPlayerDeath")) {
            player thread function_3cceb052d780fef1("gulagWatchPlayerDeath", arena);
        } else {
            player thread gulagplayerwatchfordeath(arena, var_4b434533d3624bec);
        }
        player thread initplayerarena(arena, 0, loadoutindex, "beginNewFight");
    }
    if (function_1980065ce4dc067b()) {
        arena thread function_737f63f33471e8b5();
    }
    thread watchlethaldelay(arena);
    if (function_cfe304859f30e747("prepGulagArena")) {
        level thread function_3cceb052d780fef1("prepGulagArena", arena);
    }
    wait(2);
    if (!validateplayers(arena)) {
        if (function_1980065ce4dc067b()) {
            function_9135ada02e07bf10(arena, "br_twotwo_gulag_win", 0);
        }
        handleendarena(arena, var_4b434533d3624bec, 1);
        return;
    }
    updatearenaomnvarplayers(arena);
    if (!function_1980065ce4dc067b()) {
        updatearenaomnvardata(arena);
    }
    function_d4b0eef0a0924094("showStartSplash", arena);
    function_d4b0eef0a0924094("toggleLadderEscape", [0:arena, 1:1]);
    result = gulagcountdowntimer(arena, 1, var_4b434533d3624bec);
    if (!result) {
        return;
    }
    endbetting(arena, var_4b434533d3624bec);
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player playergulagarenaready();
        player thread playershowarenastartobjectivetext();
    }
    if (function_cfe304859f30e747("startGulagSequence")) {
        level thread function_3cceb052d780fef1("startGulagSequence", arena);
    }
    thread startfightvo(arena);
    wait(getdvarfloat(@"hash_61f7016b7e176b11", 0.8));
    arena.time = level.gulag.timelimit;
    updatematchtimerhud(arena, arena.time);
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("accelerateBotsGulagMatch")) {
        namespace_71073fa38f11492::runbrgametypefunc("accelerateBotsGulagMatch", arena);
    }
    waittillgulagmatchend(arena, 1);
    handleendarena(arena, var_4b434533d3624bec);
    if (!isfightready(arena)) {
        updateplayeromnvarsallmatches(arena);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bde
// Size: 0xf6
function function_e604f37bc584077d(arena) {
    foreach (player in arena.var_654c981854394718) {
        teammate = player;
        foreach (p in arena.var_654c981854394718) {
            if (player == p) {
                continue;
            }
            if (player.team == p.team) {
                continue;
            }
            var_453624b0cae6ad9e = [0:teammate, 1:p];
            return var_453624b0cae6ad9e;
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cdb
// Size: 0x73
function function_c9861a6c6b4085d8(var_607899d4420fe1a5, arena) {
    if (level.var_43307855f189eb31.var_10c30e8082648b35 && var_607899d4420fe1a5.size < getmaxplayers() && isdefined(arena.var_654c981854394718) && arena.var_654c981854394718.size >= level.var_43307855f189eb31.var_bd9294679812b88) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d55
// Size: 0xa9
function watchlethaldelay(arena) {
    arena endon("fight_over");
    arena endon("matchEnded");
    level endon("game_ended");
    if (level.gulag.lethaldelay <= 0) {
        return;
    }
    arena.lethaldelaystarttime = gettime();
    arena.lethaldelayendtime = arena.lethaldelaystarttime + level.gulag.lethaldelay * 1000 + function_59d019f0169c03be() * 1000 + 2000;
    while (gettime() < arena.lethaldelayendtime) {
        waitframe();
    }
    arena notify("lethal_delay_end");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e05
// Size: 0xf7
function watchlethaldelayplayer(arena) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (level.gulag.lethaldelay == 0) {
        return;
    }
    if (!isai(self)) {
        self notifyonplayercommand("lethal_attempt_gulag", "+frag");
        self notifyonplayercommand("lethal_attempt_gulag", "+smoke");
    }
    val::set("watchLethalDelayPlayer", "equipment_primary", 0);
    val::set("watchLethalDelayPlayer", "equipment_secondary", 0);
    self setclientomnvar("ui_br_gulag_lethal_delay", 1);
    watchlethaldelayfeedbackplayer(arena, self);
    self setclientomnvar("ui_br_gulag_lethal_delay", 0);
    val::function_c9d0b43701bdba00("watchLethalDelayPlayer");
    self playlocalsound("ui_restock_lethals");
    self setclientomnvar("ui_recharge_notify", 2);
    if (!isai(self)) {
        self notifyonplayercommandremove("lethal_attempt_gulag", "+frag");
        self notifyonplayercommandremove("lethal_attempt_gulag", "+smoke");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f03
// Size: 0x89
function watchlethaldelayfeedbackplayer(arena, player) {
    level endon("game_ended");
    arena endon("matchEnded");
    arena endon("lethal_delay_end");
    while (1) {
        self waittill("lethal_attempt_gulag");
        if (isdefined(arena.lethaldelayendtime)) {
            n = (arena.lethaldelayendtime - gettime()) / 1000;
            n = int(max(0, ceil(n)));
            player namespace_44abc05161e2e2cb::showerrormessage("MP/LETHALS_UNAVAILABLE_FOR_N", n);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f93
// Size: 0xdf
function startfightvo(arena) {
    arena endon("matchEnded");
    playsoundatpos(arena.center, "evt_br_gulag_round_start_buzzer");
    wait(2);
    namespace_d3d40f75bb4e4c32::brleaderdialog("gulag_gulag_active", 0, arena.jailedplayers);
    foreach (player in arena.jailedplayers) {
        if (player.gulagposition <= 1) {
            namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_next", player, 0, undefined, undefined, undefined, "dx_br_jpbm_");
        } else if (player.gulagposition == 2) {
            namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_taunt", player, 0);
        }
    }
    wait(3);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7079
// Size: 0x28
function playershowarenastartobjectivetext() {
    self endon("disconnect");
    self setclientomnvar("ui_objective_text", 0);
    wait(3);
    self setclientomnvar("ui_objective_text", -1);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70a8
// Size: 0x80
function handleonekillwin(arena, victim, attacker, var_4b434533d3624bec) {
    if (isdefined(attacker) && isplayer(attacker) && victim != attacker && isalive(attacker) && array_contains(arena.arenaplayers, attacker)) {
        thread gulagvictory(arena, attacker, 0, 0, "winner");
        payoutbet(var_4b434533d3624bec, attacker, 1);
    }
    payoutbet(var_4b434533d3624bec, victim, 0);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x712f
// Size: 0x47
function manageoutlines(arena, fighters, var_4b434533d3624bec) {
    manageoutlineactive(arena, fighters, var_4b434533d3624bec);
    if (istrue(level.gulag.onekillwin)) {
        return;
    }
    manageoutlinecleanup(arena, fighters);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717d
// Size: 0x2b
function manageoutlineswatchplayersaddedtojail(arena) {
    arena endon("fight_over");
    while (1) {
        arena waittill("player_added_to_jail");
        updateoutlines(arena);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71af
// Size: 0x19c
function manageoutlineactive(arena, fighters, var_4b434533d3624bec) {
    arena endon("fight_over");
    thread manageoutlineswatchplayersaddedtojail(arena);
    while (1) {
        if (arena.jailedplayers.size) {
            var_be4e32b47ad61c7d = array_removeundefined(arena.jailedplayers);
            foreach (var_4570788876702376 in fighters) {
                if (!isdefined(var_4570788876702376)) {
                    continue;
                }
                var_4570788876702376 hudoutlineenableforclients(var_be4e32b47ad61c7d, "outline_nodepth_white");
            }
        }
        if (isdefined(var_4b434533d3624bec)) {
            foreach (var_b5fe9e03c0fd6170 in var_4b434533d3624bec.bets) {
                if (!isdefined(var_b5fe9e03c0fd6170.owner)) {
                    continue;
                }
                var_a9a8cb34a49caaaa = ter_op(var_4b434533d3624bec.bettingopen, var_b5fe9e03c0fd6170.playerfocus, var_b5fe9e03c0fd6170.playerbeton);
                if (var_a9a8cb34a49caaaa != -1) {
                    var_ba2cb2090f002d2c = var_4b434533d3624bec.fighters[var_a9a8cb34a49caaaa];
                    if (isdefined(var_ba2cb2090f002d2c)) {
                        var_ba2cb2090f002d2c hudoutlineenableforclient(var_b5fe9e03c0fd6170.owner, "outline_nodepth_green");
                    }
                }
            }
        }
        arena waittill("update_outlines");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7352
// Size: 0x8b
function manageoutlinecleanup(arena, fighters) {
    players = array_removeundefined(arena.jailedplayers);
    if (!players.size) {
        return;
    }
    foreach (var_4570788876702376 in fighters) {
        if (!isdefined(var_4570788876702376)) {
            continue;
        }
        var_4570788876702376 hudoutlinedisableforclients(players);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73e4
// Size: 0x14
function updateoutlines(arena) {
    arena notify("update_outlines");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73ff
// Size: 0x62
function playergulagarenaready() {
    playerstartarenasetcontrols(1, "playerGulagArenaReady");
    self setclientomnvar("ui_br_infil_started", 1);
    self setclientomnvar("ui_match_start_countdown", 0);
    self setclientomnvar("ui_match_in_progress", 1);
    if (istrue(level.gulag.gestures_enabled) && !isbot(self)) {
        playergulaggesturesdisable();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7468
// Size: 0x7b
function function_b0fda2bbb0c12ac2(var_6958d396e4ad3b95) {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    while (var_6958d396e4ad3b95 > 0) {
        player setclientomnvar("ui_match_in_progress", 0);
        player setclientomnvar("ui_match_start_countdown", var_6958d396e4ad3b95);
        var_6958d396e4ad3b95 = var_6958d396e4ad3b95 - 1;
        wait(1);
    }
    player setclientomnvar("ui_match_in_progress", 1);
    player setclientomnvar("ui_match_start_countdown", var_6958d396e4ad3b95);
    player setclientomnvar("ui_br_gulag_match_state", 2);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74ea
// Size: 0x1a3
function gulagcountdowntimer(arena, var_57a9df666229ceab, var_4b434533d3624bec) {
    timer = function_59d019f0169c03be();
    while (timer > 0) {
        /#
            if (getdvarint(@"hash_8c0da1f3585f4602", 0) > 0) {
                print3d(level.gulag.arenas[0].center, "ui_objective_text");
                waitframe();
                continue;
            }
        #/
        foreach (player in arena.arenaplayers) {
            player setclientomnvar("ui_match_in_progress", 0);
            player setclientomnvar("ui_match_start_countdown", timer);
            player setclientomnvar("ui_br_gulag_match_state", 1);
        }
        timer = timer - 1;
        wait(1);
        if (istrue(var_57a9df666229ceab) && !validateplayers(arena)) {
            if (function_1980065ce4dc067b()) {
                function_9135ada02e07bf10(arena, "br_twotwo_gulag_win", 0);
            }
            handleendarena(arena, var_4b434533d3624bec, 1);
            return 0;
        }
    }
    foreach (player in arena.arenaplayers) {
        player setclientomnvar("ui_br_gulag_match_state", 2);
    }
    /#
        while (getdvarint(@"hash_9d81822f2c8a6e56", 0)) {
            waitframe();
        }
    #/
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7695
// Size: 0x73
function function_fa7156b785ecf3eb(timeleft) {
    player = self;
    level endon("game_ended");
    player endon("individualWaittillGulagMatchEnd");
    player endon("gulagLost");
    player endon("gulag_end");
    player endon("death_or_disconnect");
    wait(timeleft);
    timeleft = 10;
    var_14ccd6e81fce3bd4 = namespace_d576b6dc7cef9c62::getclocksoundaliasfortimeleft(timeleft);
    while (timeleft > 0) {
        if (!isdefined(player)) {
            return;
        }
        player playlocalsound(var_14ccd6e81fce3bd4);
        timeleft = timeleft - 1;
        wait(1);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x770f
// Size: 0xa6
function gulagmatchclocksounds(arena, timeleft, var_55c0e7e44829e72e) {
    arena endon("matchEnded");
    while (timeleft > 0) {
        /#
            if (getdvarint(@"hash_8c0da1f3585f4602", 0) > 0) {
                waitframe();
                continue;
            }
        #/
        if (level.gameended) {
            return;
        }
        var_526074c408160449 = timeleft;
        if (!istrue(arena.overtime)) {
            var_526074c408160449 = var_526074c408160449 - var_55c0e7e44829e72e;
        }
        if (var_526074c408160449 <= 10) {
            var_14ccd6e81fce3bd4 = namespace_d576b6dc7cef9c62::getclocksoundaliasfortimeleft(var_526074c408160449);
            doclocksound(arena, var_14ccd6e81fce3bd4);
        }
        if (timeleft > 1) {
            timeleft = timeleft - 1;
        }
        wait(1);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77bc
// Size: 0xc3
function doclocksound(arena, var_14ccd6e81fce3bd4) {
    foreach (player in arena.jailedplayers) {
        if (isdefined(player)) {
            player playlocalsound(var_14ccd6e81fce3bd4);
        }
    }
    foreach (player in arena.arenaplayers) {
        if (isdefined(player)) {
            player playlocalsound(var_14ccd6e81fce3bd4);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7886
// Size: 0x44
function getovertimelength() {
    if (function_2c600e5e9a2cf916("gulagOvertime")) {
        return 0;
    }
    if (function_cfe304859f30e747("gulagGetOvertimeLength")) {
        return function_3cceb052d780fef1("gulagGetOvertimeLength");
    } else {
        return getdvarint(@"hash_1ff83f4f24656c5b", 15);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78d1
// Size: 0x31
function function_59d019f0169c03be() {
    if (function_cfe304859f30e747("gulagGetCountdownLength")) {
        return function_3cceb052d780fef1("gulagGetCountdownLength");
    } else {
        return getdvarint(@"hash_fb05c5f6825931d", 3);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7909
// Size: 0x7c
function individualWaittillGulagMatchEnd(arena, waittime) {
    player = self;
    player endon("game_ended");
    player notify("individualWaittillGulagMatchEnd");
    player endon("individualWaittillGulagMatchEnd");
    player endon("gulagLost");
    player endon("gulag_end");
    player endon("death");
    if (function_9005af34e01bf8fe()) {
        player waittill_notify_or_timeout("gulag_done_with_camera_sequence", 8);
    }
    player thread function_fa7156b785ecf3eb(waittime - 10);
    wait(waittime);
    player thread gulagplayerlost(arena);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x798c
// Size: 0x4ad
function waittillgulagmatchend(arena, var_1a93cf0ba17e0dc0) {
    var_55c0e7e44829e72e = getovertimelength();
    arena.time = arena.time + var_55c0e7e44829e72e;
    thread gulagmatchclocksounds(arena, arena.time, var_55c0e7e44829e72e);
    while (1) {
        /#
            if (getdvarint(@"hash_8c0da1f3585f4602", 0) > 0) {
                print3d(level.gulag.arenas[0].center, "ui_objective_text");
                waitframe();
                continue;
            }
        #/
        if (!isanyonealive(arena) || isoneteamleft(arena)) {
            break;
        }
        arena.time = arena.time - level.framedurationseconds;
        function_c724f178c2df7240("gulagWaittillOvertime", [0:arena, 1:var_55c0e7e44829e72e]);
        var_e74cdbc9111d53c7 = !function_2c600e5e9a2cf916("gulagOvertime");
        var_cfb635535ec1ff70 = function_1980065ce4dc067b();
        var_727c25d029b3b5af = var_cfb635535ec1ff70 && var_e74cdbc9111d53c7;
        if ((var_727c25d029b3b5af || !var_cfb635535ec1ff70) && !istrue(arena.overtime) && arena.time <= var_55c0e7e44829e72e) {
            arena.overtime = 1;
            if (function_cfe304859f30e747("gulagOvertimeStart")) {
                arena thread function_3cceb052d780fef1("gulagOvertimeStart");
            }
            if (!function_d4b0eef0a0924094("overtimeStart", arena)) {
                if (istrue(level.gulag.arenaflag) && arena.arenaplayers.size <= 2) {
                    arena.dom.arenaflag arenaflag_setenabled(1);
                    arena.dom.arenaflag arenaflag_setvisible(arena, 1);
                    arena.dom.arenaflag.flagmodel playsoundonmovingent("flag_spawned");
                }
            }
            foreach (player in arena.arenaplayers) {
                if (!isdefined(player)) {
                    continue;
                }
                player setclientomnvar("ui_br_gulag_match_state", 3);
                player setclientomnvar("ui_br_gulag_match_end_time", gettime() + int(arena.time * 1000));
            }
        }
        if (istrue(arena.overtime)) {
            progress = clamp(arena.time / var_55c0e7e44829e72e, 0, 1);
            setovertimeomnvarprogress(arena, progress);
        }
        if (arena.time <= 0) {
            if (!function_d4b0eef0a0924094("overtimeWait", arena)) {
                waittillarenaplayersnotcapturing(arena);
            }
            if (istrue(var_1a93cf0ba17e0dc0)) {
                foreach (player in arena.arenaplayers) {
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (function_1980065ce4dc067b() && istrue(player.var_4af73ce40a5d8572)) {
                        continue;
                    }
                    /#
                        println("solo_cin_igc_music" + player.name + "gulagGetPostVictoryWait" + player getentitynumber());
                    #/
                    player setclientomnvar("ui_br_gulag_match_state", 6);
                    player thread gulagplayerlost(arena, undefined, 1);
                    br_gulag_lose = function_17ee301cf0b5ba85("br_gulag_lose");
                    br_gulag_lose_classic = function_17ee301cf0b5ba85("br_gulag_lose_classic");
                    if (isdefined(player.var_acfbb9caed7125f9) && player.var_acfbb9caed7125f9 == 1) {
                        player setplayermusicstate(br_gulag_lose_classic);
                    } else {
                        player setplayermusicstate(br_gulag_lose);
                    }
                    player clearclienttriggeraudiozone(2);
                    if (isstring("") && "" != "" && soundexists("")) {
                        player playsoundtoplayer("", player);
                    }
                }
            }
            break;
        }
        if (function_7effa8a355ddc886() && arena.arenaplayers.size <= 0) {
            break;
        }
        waitframe();
    }
    arena notify("matchEnded");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e40
// Size: 0xa2
function waittillarenaplayersnotcapturing(arena) {
    if (function_1980065ce4dc067b()) {
        return;
    }
    while (istrue(level.gulag.arenaflag) && isdefined(arena.dom.arenaflag.claimteam) && arena.dom.arenaflag.claimteam != "none" && !istrue(arena.dom.arenaflag.stalemate)) {
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ee9
// Size: 0x68
function isanyonealive(arena) {
    foreach (player in arena.arenaplayers) {
        if (isalive(player)) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f59
// Size: 0xb3
function isoneteamleft(arena) {
    if (function_cfe304859f30e747("gulagIsOneTeamLeft")) {
        return function_3cceb052d780fef1("gulagIsOneTeamLeft");
    }
    var_6f4191369a7f931 = undefined;
    foreach (player in arena.arenaplayers) {
        if (isalive(player)) {
            if (!isdefined(var_6f4191369a7f931)) {
                var_6f4191369a7f931 = player.team;
            } else if (var_6f4191369a7f931 != player.team) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8014
// Size: 0x205
function handleendarena(arena, var_4b434533d3624bec, endedearly, var_bf7470006675932e, var_df2fbb13c226be75, var_4ac881e2a39322a5) {
    arena notify("fight_over");
    arena.fightover = 1;
    if (!isdefined(var_df2fbb13c226be75)) {
        var_df2fbb13c226be75 = "winner";
    }
    endbetting(arena, var_4b434533d3624bec);
    updatematchtimerhud(arena, 0);
    winner = undefined;
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (isalive(player)) {
            winner = player;
            if (istrue(endedearly)) {
                winner playergulagarenaready();
            }
            if (!function_1980065ce4dc067b()) {
                if (isdefined(var_4ac881e2a39322a5) && player.team == var_4ac881e2a39322a5.team) {
                    thread gulagvictory(arena, player, 0, 0, var_df2fbb13c226be75, 0, var_4ac881e2a39322a5, var_bf7470006675932e);
                } else {
                    thread gulagvictory(arena, player, 0, 0, "winner");
                }
            }
        }
    }
    if (istrue(level.gulag.arenaflag)) {
        arena.dom.arenaflag arenaflag_setenabled(0);
    }
    payoutremainingbets(winner, var_4b434533d3624bec);
    function_c724f178c2df7240("handleEndArena", arena);
    wait(function_86ee3121d91c59c3());
    if (!function_2c600e5e9a2cf916("gulagOvertime")) {
        arena.overtime = 0;
    }
    if (istrue(level.gulag.arenaflag)) {
        arena.dom.arenaflag arenaflag_setvisible(arena, 0);
    }
    cleanuparenamolotovs(arena);
    function_d4b0eef0a0924094("toggleLadderEscape", [0:arena, 1:0]);
    wait(function_4bb92764539fff5d());
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8220
// Size: 0x160
function playerpulloutofgulagwin(var_4ac881e2a39322a5, var_df2fbb13c226be75) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(self.arena)) {
        return;
    }
    arena = self.arena;
    if (istrue(self.wasingulag)) {
        self notify("pull_out_of_gulag");
        if (!isalive(self)) {
            thread namespace_47fd1e79a44628cd::playergulagautowin("playerPullOutOfGulagWin", var_4ac881e2a39322a5);
            return;
        } else if (istrue(self.br_iseliminated)) {
            namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(self, "playerPullOutOfGulagWin");
            level thread namespace_d20f8ef223912e12::updateplayerandteamcountui();
        }
    } else if (istrue(self.gulagarena)) {
        if (!arena.fightover) {
            if (function_1980065ce4dc067b()) {
                function_9135ada02e07bf10(arena, "br_twotwo_gulag_win", 0);
            }
            arena notify("matchEnded");
            arena notify("fight_over_early");
            thread handleendarena(arena, undefined, 1, 1, var_df2fbb13c226be75, var_4ac881e2a39322a5);
        }
        return;
    } else {
        self endon("gulag_end");
        arena.jailedplayers = array_remove(arena.jailedplayers, self);
        function_94eb48dd1cd7f972(self, "Pulled Out", 0);
        updatematchqueuepositions(arena);
        if (istrue(self.gulag) && !istrue(self.jailed)) {
            self waittill("gulag_start");
        }
    }
    thread gulagvictory(arena, self, 1, 0, var_df2fbb13c226be75, 0, var_4ac881e2a39322a5, 1);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8387
// Size: 0x93
function getnextjailspawn(arena) {
    if (function_9005af34e01bf8fe()) {
        return arena.var_c379148a901939ac;
    }
    if (isdefined(arena.jailspawncounter)) {
        arena.jailspawncounter++;
        arena.jailspawncounter = arena.jailspawncounter % arena.jailspawns.size;
    } else {
        arena.jailspawncounter = 0;
    }
    spawnpt = arena.jailspawns[arena.jailspawncounter];
    return spawnpt;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8422
// Size: 0x20d
function outlinewatchplayerprox(var_27c0612cfd76ee91) {
    self endon("death");
    self endon("trigger");
    self.outlinedplayers = [];
    switch (var_27c0612cfd76ee91) {
    case 0:
    default:
        var_4430b08d5a2d47bf = "outline_depth_white";
        break;
    case 1:
        var_4430b08d5a2d47bf = "outline_depth_green";
        break;
    case 2:
        var_4430b08d5a2d47bf = "outline_depth_cyan";
        break;
    case 3:
        var_4430b08d5a2d47bf = "outline_depth_red";
        break;
    case 4:
        var_4430b08d5a2d47bf = "outline_depth_orange";
        break;
    }
    while (1) {
        players = utility::playersinsphere(self.origin, 2000);
        var_7fd6d4b3d9f7cad3 = array_difference(level.players, players);
        foreach (player in players) {
            dist = distancesquared(self.origin, player.origin);
            entnum = player getentitynumber();
            if (!isdefined(self.outlinedplayers[entnum])) {
                self.outlinedplayers[entnum] = outlineenableforplayer(self, player, var_4430b08d5a2d47bf, "level_script");
            }
        }
        foreach (player in var_7fd6d4b3d9f7cad3) {
            entnum = player getentitynumber();
            if (isdefined(self.outlinedplayers[entnum])) {
                outlinedisable(self.outlinedplayers[entnum], self);
                self.outlinedplayers[entnum] = undefined;
            }
        }
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8636
// Size: 0x52
function function_aa3a537ec349120d() {
    if (!istrue(level.usegulag)) {
        return 1;
    }
    if (!namespace_ad49798629176e96::function_1082d39cdba869d9() && (namespace_d3d40f75bb4e4c32::isplayeringulag() || namespace_d3d40f75bb4e4c32::function_f1918f2fce663b2c())) {
        return 0;
    }
    if (istrue(self.gulag) && !istrue(self.gulagloading)) {
        return 0;
    }
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8690
// Size: 0x59
function gulagstreamlocationstart(var_11f3b4465c8b637b) {
    if ((isbot(self) || self isplayerheadless()) && !istrue(self.longgulagstream)) {
        return 0;
    }
    if (getdvarint(@"hash_723a4b3ac39bc3e2", 0)) {
        return 0;
    }
    self setallstreamloaddist(10000);
    self function_670863fc4008c3d8(var_11f3b4465c8b637b);
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86f1
// Size: 0x5e
function gulagstreamlocationwait() {
    if (!istrue(self.longgulagstream)) {
        self endon("gulagStreamLocationComplete");
        thread gulagstreamlocationwaittimeout(level.gulag.streamtimeout);
        while (!self isadditionalstreamposready()) {
            waitframe();
        }
        self notify("gulagStreamLocationComplete");
    } else {
        wait(level.gulag.streamtimeout);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8756
// Size: 0x24
function gulagstreamlocationwaittimeout(timelimit) {
    self endon("disconnect");
    self endon("gulagStreamLocationComplete");
    wait(timelimit);
    self notify("gulagStreamLocationComplete");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8781
// Size: 0x12
function gulagstreamlocationend() {
    self clearadditionalstreampos();
    self notify("gulagStreamLocationComplete");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x879a
// Size: 0x46
function addloadingplayer(arena, player) {
    player.entergulagwait = 1;
    arena.loadingplayers[arena.loadingplayers.size] = player;
    thread addloadingplayerdisconnectwatch(arena, player);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e7
// Size: 0x2d
function addloadingplayerdisconnectwatch(arena, player) {
    player endon("removeLoadingPlayer");
    player waittill("disconnect");
    thread removeloadingplayer(arena, player);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x881b
// Size: 0x78
function removeloadingplayer(arena, player) {
    player notify("removeLoadingPlayer");
    if (isdefined(player)) {
        arena.loadingplayers = array_remove(arena.loadingplayers, player);
    } else {
        arena.loadingplayers = array_removeundefined(arena.loadingplayers);
    }
    if (arena.loadingplayers.size == 0) {
        arena notify("loadingPlayersEmpty");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889a
// Size: 0x26
function isplayerloading(player, arena) {
    return array_contains(arena.loadingplayers, player);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88c8
// Size: 0x29
function entergulag(player) {
    player notify("enter_gulag");
    player.entergulagwait = 0;
    namespace_b984803e2ef247a2::hidedeathicon(player);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f8
// Size: 0x22
function entergulagwait(player) {
    if (player.entergulagwait) {
        player waittill("enter_gulag");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8921
// Size: 0x405
function playergetnextarena(overrideArenas) {
    arenas = ter_op(isdefined(overrideArenas), overrideArenas, level.gulag.arenas);
    var_94afb7d602135955 = getdvarint(@"hash_8bdee07fa09e810a", -1);
    if (var_94afb7d602135955 > -1) {
        return level.gulag.arenas[var_94afb7d602135955];
    }
    if (!istrue(level.gulag.multiarena)) {
        return function_bee59f29dedc0fd6(overrideArenas);
    }
    if (isdefined(self.var_94afb7d602135955)) {
        arena = level.gulag.arenas[self.var_94afb7d602135955];
        if (isdefined(arena)) {
            self.var_94afb7d602135955 = undefined;
            return arena;
        }
    }
    var_5dd209c141f918fa = undefined;
    besttime = undefined;
    foreach (arena in arenas) {
        if (!isArenaEnabled(arena, self)) {
            continue;
        }
        foreach (match in arena.matches) {
            if (match.size == 1 && isdefined(match[0]) && match[0].team != self.team && (!isdefined(var_5dd209c141f918fa) || match[0].jailtime < besttime)) {
                var_5dd209c141f918fa = arena;
                besttime = match[0].jailtime;
            }
        }
    }
    if (isdefined(var_5dd209c141f918fa)) {
        return var_5dd209c141f918fa;
    }
    var_f46e3d7b18fb28a4 = [];
    for (i = 0; i < arenas.size; i++) {
        arena = level.gulag.arenas[i];
        if (!isArenaEnabled(arena, self)) {
            continue;
        }
        if (arena.matches.size > 0 && arena.matches.size < level.gulag.maxqueue) {
            var_f46e3d7b18fb28a4[var_f46e3d7b18fb28a4.size] = arena;
        }
    }
    if (var_f46e3d7b18fb28a4.size > 0) {
        foreach (arena in var_f46e3d7b18fb28a4) {
            foreach (match in arena.matches) {
                foreach (player in match) {
                    if (isdefined(player) && player.team == self.team) {
                        return arena;
                    }
                }
            }
        }
        arena = var_f46e3d7b18fb28a4[randomint(var_f46e3d7b18fb28a4.size)];
        return arena;
    }
    var_5dd209c141f918fa = undefined;
    var_93d79749948ae532 = undefined;
    for (i = 0; i < arenas.size; i++) {
        arena = level.gulag.arenas[i];
        if (!isArenaEnabled(arena, self)) {
            continue;
        }
        if (arena.matches.size == 0) {
            return arena;
        } else if (!isdefined(var_93d79749948ae532) || arena.matches.size < var_93d79749948ae532) {
            var_5dd209c141f918fa = arena;
            var_93d79749948ae532 = arena.matches.size;
        }
    }
    return var_5dd209c141f918fa;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d2e
// Size: 0x2a
function isArenaEnabled(arena, player) {
    return function_4dce98c81d58a751("isArenaEnabled", [0:arena, 1:player]);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d60
// Size: 0x79
function function_bee59f29dedc0fd6(overrideArenas) {
    arenas = ter_op(isdefined(overrideArenas), overrideArenas, level.gulag.arenas);
    for (i = 0; i < arenas.size; i++) {
        arena = arenas[i];
        if (!isArenaEnabled(arena, self)) {
            continue;
        }
        return arena;
    }
    /#
        assertmsg("No arenas enabled");
    #/
    return undefined;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8de1
// Size: 0x83
function function_ba2be3e8cd3fb169(overrideArenas) {
    arenas = ter_op(isdefined(overrideArenas), overrideArenas, level.gulag.arenas);
    for (i = 0; i < arenas.size; i++) {
        arena = arenas[i];
        if (!isArenaEnabled(arena, self)) {
            continue;
        }
        if (!istrue(arena.fightover)) {
            continue;
        }
        return arena;
    }
    return function_bee59f29dedc0fd6(overrideArenas);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e6c
// Size: 0x87
function function_6a7526f387d26776(match) {
    player = self;
    var_b239b59420d81775 = 0;
    foreach (var_d7836ab41dca3e4a in match) {
        if (var_d7836ab41dca3e4a.team == player.team) {
            var_b239b59420d81775++;
        }
    }
    return var_b239b59420d81775;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8efb
// Size: 0xf8
function isplayermatched(arena, player) {
    if (isdefined(player.gulagposition) && player.gulagposition == 0) {
        return 1;
    }
    if (!ismatchpending(arena)) {
        if (level.gulag.var_c489bd0446d6b041) {
            logstring("[GULAG DEBUG] : Player " + player.clientid + " did not have a match pending. Time : " + gettime() + ". Number of players in the queue for gulag are : " + arena.matches.size + " .");
        }
        return 0;
    }
    var_b94827c01cb82f1e = player.gulagposition - 1;
    var_4462160dc5261e62 = 1;
    if (function_1980065ce4dc067b()) {
        var_4462160dc5261e62 = 3;
    }
    if (var_b94827c01cb82f1e >= 0 && isdefined(arena.matches[var_b94827c01cb82f1e]) && arena.matches[var_b94827c01cb82f1e].size > var_4462160dc5261e62) {
        return 1;
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ffb
// Size: 0xac
function setjailtimeouthud(arena) {
    foreach (player in arena.jailedplayers) {
        if (!isplayermatched(arena, player) && isdefined(player.jailtimeoutend) && !isdefined(player.jailtimeouthud)) {
            player setclientomnvar("ui_br_gulag_match_end_time", player.jailtimeoutend);
            player.jailtimeouthud = 1;
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90ae
// Size: 0x2d
function playerclearjailtimeouthud(arena) {
    self.jailtimeoutend = undefined;
    self.jailtimeouthud = undefined;
    self setclientomnvar("ui_br_gulag_match_end_time", 0);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90e2
// Size: 0x1bb
function playerjailtimeout(arena) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("initPlayerArena");
    self endon("gulag_end");
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        self endon("jailbreak_respawn");
    }
    if (function_cfe304859f30e747("gulagJailTimeout")) {
        delaytime = function_3cceb052d780fef1("gulagJailTimeout");
    } else {
        delaytime = getdvarint(@"hash_e5f703a38f6e8043", 95);
    }
    if (function_cfe304859f30e747("gulagLeftoverJailTimeout")) {
        var_28a6af230364b2b7 = function_3cceb052d780fef1("gulagLeftoverJailTimeout");
    } else {
        var_28a6af230364b2b7 = 0;
    }
    if (delaytime <= 0) {
        return;
    }
    var_677cee91234c35a7 = delaytime + var_28a6af230364b2b7;
    self.jailtimeoutend = int(gettime() + var_677cee91234c35a7 * 1000);
    wait(delaytime);
    if (function_cfe304859f30e747("onGulagJailTimeout")) {
        thread function_3cceb052d780fef1("onGulagJailTimeout", arena, self);
    }
    wait(var_28a6af230364b2b7);
    if (isplayermatched(arena, self)) {
        var_f0b41805aa72794b = self.gulagposition * (level.gulag.timelimit + getovertimelength() + function_59d019f0169c03be() + 2 + function_86ee3121d91c59c3() + function_4bb92764539fff5d() + 1);
        timeout = gettime() + var_f0b41805aa72794b * 1000;
        while (timeout > gettime() && isplayermatched(arena, self)) {
            waitframe();
        }
    }
    while (isgulagpaused()) {
        waitframe();
    }
    while (self isinexecutionvictim()) {
        waitframe();
    }
    var_df2fbb13c226be75 = "timeout";
    if (function_1980065ce4dc067b()) {
        var_df2fbb13c226be75 = "br_twotwo_gulag_win_jail_timeout";
    }
    thread gulagvictory(arena, self, 1, 0, var_df2fbb13c226be75);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92a4
// Size: 0x43
function function_dd93503cf95b6277() {
    player = self;
    if (!isdefined(player.gulaguses)) {
        self.gulaguses = 0;
    }
    var_5a1dc05dc32c2300 = player function_4a25d64251fab1b7();
    player namespace_d3d40f75bb4e4c32::function_e58801acf7adcdc8(var_5a1dc05dc32c2300);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92ee
// Size: 0xb16
function initplayerjail(var_5643932de03d949d, var_e5fe2365bab5b0ab) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("gulag_end");
    self endon("jailbreak_respawn");
    self.jailtime = gettime();
    self.gulagloser = undefined;
    if (function_7effa8a355ddc886()) {
        self.var_d95581fdfc29ec7a = gettime();
    }
    namespace_a011fbf6d93f25e5::branalytics_gulagstart(self, ter_op(istrue(var_5643932de03d949d), "default", "debug"));
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passes jail entrance step 01. Time : " + gettime() + " .");
    }
    if (!istrue(var_e5fe2365bab5b0ab)) {
        if (level.gulag.var_86f0de18e07f0b7f) {
            playerpreloadintrocinematic();
        }
    } else {
        namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
    }
    overrideArenas = undefined;
    var_f4453b4383378d4a = undefined;
    var_66287f24ebdf0100 = undefined;
    if (function_175e22055ae274a3("overrideArenas")) {
        overrideArenas = function_d4b0eef0a0924094("overrideArenas");
        if (isdefined(overrideArenas)) {
            var_f4453b4383378d4a = overrideArenas[0];
            var_66287f24ebdf0100 = overrideArenas[1];
        }
    }
    if (function_1980065ce4dc067b()) {
        arena = namespace_ad49798629176e96::function_d095c23873d8efed(var_f4453b4383378d4a, var_66287f24ebdf0100);
    } else {
        arena = playergetnextarena(overrideArenas);
    }
    self.arena = arena;
    if (isdefined(arena.gulagindex)) {
        var_fcc20b643699a386 = arena.gulagindex + 1;
        namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(23, var_fcc20b643699a386);
    }
    if (!array_contains(arena.jailedplayers, self)) {
        arena notify("player_added_to_jail", self);
        arena.jailedplayers[arena.jailedplayers.size] = self;
        function_94eb48dd1cd7f972(self, "Init Jail", 1);
    }
    if (function_83feeda09e1a148e() && arena.arenaplayers.size > 0) {
        foreach (p in arena.arenaplayers) {
            namespace_ad49798629176e96::function_da46de174875958a(p);
        }
    }
    playergulaghud(arena);
    thread playerwatchdisconnect(arena);
    updatematchqueuepositions(arena);
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " enters jail entrance step 02. Time : " + gettime() + ". Player in next gulag position : " + arena.matches[0][0].clientid + " . Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    addloadingplayer(arena, self);
    gulaglaststandholdremove(self);
    if (!isdefined(self.gulaguses)) {
        self.gulaguses = 0;
    }
    self.gulaguses++;
    function_dd93503cf95b6277();
    if (function_6e3541fd8fab45bc()) {
        if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena) && level.var_43307855f189eb31.var_cb1a9a6651a906df < 4) {
            var_5c7f3cea21f3b966 = "gulagspectators" + arena.gulagindex;
            if (!threatbiasgroupexists(var_5c7f3cea21f3b966)) {
                createthreatbiasgroup(var_5c7f3cea21f3b966);
            }
            self setthreatbiasgroup(var_5c7f3cea21f3b966);
        }
        function_6d217ba4de4b166b(arena);
        function_fb51bdaa21d694e5(arena);
    }
    setplayervargulag(1);
    setplayervargulagarena(0);
    setplayeringulagjailextrainfo(1);
    setplayergulagindex(arena);
    if (isdefined(level.checkforlaststandwipe)) {
        [[ level.checkforlaststandwipe ]]();
    }
    spawnpt = getnextjailspawn(arena);
    spawnorigin = getgroundposition(spawnpt.origin, 12);
    spawnangles = (0, 0, 0);
    if (isdefined(spawnpt.angles)) {
        spawnangles = spawnpt.angles;
    }
    var_3f39a8b789073e7b = gulagstreamlocationstart(spawnorigin);
    self.gulagloading = 1;
    self.streampoint = spawnstruct();
    self.streampoint.origin = spawnorigin;
    self.streampoint.angles = spawnangles;
    if (istrue(var_5643932de03d949d)) {
        entergulagwait(self);
    } else {
        entergulag(self);
    }
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " enters jail entrance step 03. Time : " + gettime() + ". Player passed enterGulagWait. Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    namespace_d9c77dc2a6fe29c6::enableoobimmunity(self);
    namespace_1eb3c4e0e28fac71::onplayerentergulag();
    namespace_fd99f400a596934b::function_d545b198b75385f6();
    level callback::callback(#"hash_c15c682d6a5dcae0", {player:self});
    self.ignoreafkcheck = 1;
    starttime = gettime();
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        self notify("play_gulag_vo");
    }
    if (!istrue(var_e5fe2365bab5b0ab)) {
        playerplayintrocinematic();
    }
    var_721982228624d657 = namespace_a9c534dc7832aba4::function_6d5206bdba79e8c3();
    if (var_721982228624d657.size > 0) {
        foreach (client in var_721982228624d657) {
            client thread namespace_a9c534dc7832aba4::function_4a8746c1aa6bb002(5, "gulagSceneFin");
        }
    }
    if (var_3f39a8b789073e7b) {
        namespace_d20f8ef223912e12::spawnintermission(spawnorigin + (0, 0, 100), self.angles);
        namespace_5aeecefc462876::setdisabled();
        gulagstreamlocationstart(spawnorigin);
        gulagstreamlocationwait();
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerPreSpawnGulagJail")) {
        namespace_71073fa38f11492::runbrgametypefunc("playerPreSpawnGulagJail");
    }
    /#
        while (getdvarint(@"hash_98b297a8680cbdc2", 0) == 2) {
            self.gulagholding = 1;
            waitframe();
        }
    #/
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " enters jail entrance step 04. Time : " + gettime() + ". Player passed gulag stream location. Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    namespace_d19129e4fa5d176::loadout_emptycacheofloadout("gamemode");
    self.pers["gamemodeLoadout"] = level.gulag.jailloadout;
    self.class = "gamemode";
    self.forcespawnangles = spawnangles;
    self.forcespawnorigin = spawnorigin;
    self.reviver = undefined;
    namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    namespace_f446f6030ca8cff8::_clearexecution();
    namespace_aead94004cf4c147::function_5c5e6619f0b24f90();
    self setclientomnvar("ui_gulag", 1);
    self.streampoint = undefined;
    self.gulagloading = 0;
    namespace_8bfdb6eb5a3df67a::resetplayermovespeedscale();
    if (function_7effa8a355ddc886()) {
        self.var_22f8f8d138d3c02f = 0;
        function_f071db381e990d80();
    }
    if (var_3f39a8b789073e7b) {
        gulagstreamlocationend();
    }
    if (var_721982228624d657.size > 0) {
        foreach (client in var_721982228624d657) {
            client notify("gulagSceneFin");
        }
    }
    if (!istrue(var_e5fe2365bab5b0ab)) {
        playershowskippromptcinematic();
        playerwaittillcinematiccomplete(starttime);
    }
    self setplayerangles((0, self.angles[1], 0));
    /#
        while (getdvarint(@"hash_98b297a8680cbdc2", 0) == 1) {
            waitframe();
        }
    #/
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        self clearsoundsubmix("iw8_br_gulag_tutorial", 2);
    } else {
        self clearsoundsubmix("solo_cin_igc_music", 2);
    }
    self setclientomnvar("ui_br_infil_started", 1);
    var_c497fb6aa47dda29 = arena.fightover && playerismatchedplayerready(arena) && !isgulagpaused();
    if (!var_c497fb6aa47dda29) {
        namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    }
    if (function_cfe304859f30e747("gulag_startWaitingStartTime")) {
        function_3cceb052d780fef1("gulag_startWaitingStartTime");
    }
    gulagloadingtextclear();
    function_c724f178c2df7240("jailEnter", arena);
    if (level.gulag.betting) {
        var_d5f9260e2c6a3b63 = 3;
        if (isdefined(self.plundercountondeath)) {
            var_d5f9260e2c6a3b63 = int(max(var_d5f9260e2c6a3b63, int(self.plundercountondeath / 2)));
        }
        namespace_c6ccccd95254983f::playersetplundercount(var_d5f9260e2c6a3b63);
    }
    if (!var_c497fb6aa47dda29 && !istrue(var_e5fe2365bab5b0ab)) {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_spawn", self, 0, undefined, undefined, undefined, "dx_br_jpbm_");
    }
    foreach (teammate in level.teamdata[self.team]["players"]) {
        if (!isdefined(teammate) || !isalive(teammate)) {
            continue;
        }
        if (teammate != self) {
            teammate thread namespace_44abc05161e2e2cb::showsplash("br_gulag_teammate_in", undefined, self);
            thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_teammate_gulag", teammate, undefined, undefined, 2);
        }
    }
    if (!istrue(self.jailed)) {
        /#
            println("gulagHandleLossInfiniteLate" + self.name + "gulagOrderArenaPlayers" + self.class);
        #/
        setplayervargulagjail(1);
        namespace_82dcd1d5ae30ff7::blockperkfunction("specialty_scavenger");
    }
    namespace_f8d3520d3483c1::givestartingarmor(0, 0, 0);
    removeloadingplayer(arena, self);
    namespace_cb965d2f71fefddc::initplayer(1);
    if (istrue(level.gulag.gestures_enabled) && !isbot(self)) {
        thread playergulaggestures();
    }
    playerstartjailsetcontrols(0);
    if (istrue(arena.overtime) && istrue(level.gulag.arenaflag)) {
        arena.dom.arenaflag thread arenaflag_setvisibleplayer(1, self);
    }
    thread playerjailtimeout(arena);
    thread playerjailwaitvo(arena);
    function_34cebfca4fdfb4f3();
    self notify("gulag_start", var_c497fb6aa47dda29);
    if (function_cfe304859f30e747("gulagJailRockAmount")) {
        function_3cceb052d780fef1("gulagJailRockAmount");
    }
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " enters jail entrance step 05. Time : " + gettime() + ". Player is fully in the gulag jail. Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e0b
// Size: 0x44
function playerjailwaitvo(arena) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("initPlayerArena");
    self endon("gulag_end");
    wait(5);
    if (ismatchpending(arena)) {
        return;
    }
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_obj_wait", self, 0);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e56
// Size: 0x21
function playerstartjailsetcontrols(enable) {
    if (enable) {
        self enableoffhandthrowback();
    } else {
        self disableoffhandthrowback();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e7e
// Size: 0x1da
function playergulaggestures() {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    self endon("gulag_gestures_stop");
    self enableoffhandweapons();
    self allowfire(0);
    self allowads(0);
    self notifyonplayercommand("fc_gesture_neg", "+attack");
    self notifyonplayercommand("fc_gesture_pos", "+speed_throw");
    gestureindex = 0;
    while (1) {
        var_a8ab9599524f3865 = waittill_any_return_2("fc_gesture_neg", "fc_gesture_pos");
        if (self isgestureplaying() || self isswitchingweapon() || self isreloading() || self ismantling() || self isthrowinggrenade() || self israisingweapon() || self ismeleeing()) {
            continue;
        }
        if (getdvarint(@"hash_f66218d4c610a345", 0) > 0) {
            if (gestureindex >= level.gulag.gestures[var_a8ab9599524f3865].size) {
                gestureindex = 0;
            }
            var_7c64add76ada24c9 = level.gulag.gesturesounds[var_a8ab9599524f3865][gestureindex];
            var_e8562c6f1c5aa36f = level.gulag.gestures[var_a8ab9599524f3865][gestureindex];
            gestureindex++;
        } else {
            gestureindex = randomint(level.gulag.gestures[var_a8ab9599524f3865].size);
            var_7c64add76ada24c9 = level.gulag.gesturesounds[var_a8ab9599524f3865][gestureindex];
            var_e8562c6f1c5aa36f = level.gulag.gestures[var_a8ab9599524f3865][gestureindex];
        }
        if (isdefined(var_7c64add76ada24c9) && var_7c64add76ada24c9 != "") {
            self playsound(var_7c64add76ada24c9);
        }
        gestureweapon = makeweapon(var_e8562c6f1c5aa36f);
        if (isdefined(gestureweapon) && !isnullweapon(gestureweapon)) {
            namespace_46e9069d8502773a::watchradialgesture(gestureweapon);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa05f
// Size: 0x3f
function playergulaggesturesdisable() {
    self notify("gulag_gestures_stop");
    self notifyonplayercommandremove("fc_gesture_neg", "+attack");
    self notifyonplayercommandremove("fc_gesture_pos", "+speed_throw");
    self allowfire(1);
    self allowads(1);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0a5
// Size: 0x4e
function gulagloadingtext() {
    text = namespace_52f6938dd902c7d0::createfontstring("default", 1.5);
    text namespace_52f6938dd902c7d0::setpoint("CENTER", "CENTER", 0, -100);
    text.label = "MP/BR_GULAG_TRAVEL";
    self.gulagloadingtext = text;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0fa
// Size: 0x1f
function gulagloadingtextclear() {
    if (isdefined(self.gulagloadingtext)) {
        self.gulagloadingtext destroy();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa120
// Size: 0x715
function initplayerarena(arena, var_c3e0e015de4435fd, loadoutindex, var_228a5de8e2cd330) {
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 00.5. Time : " + gettime() + ". Screen fade to black. Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    level endon("game_ended");
    self endon("disconnect");
    self notify("initPlayerArena");
    if (namespace_7e17181d03156026::isinlaststand(self)) {
        self notify("last_stand_revived");
    }
    /#
        assert(self.sessionstate != "spectator");
    #/
    /#
        println("end_betting" + self.name);
    #/
    namespace_cb965d2f71fefddc::initplayer();
    if (function_7effa8a355ddc886()) {
        self.var_22f8f8d138d3c02f = 1;
        function_f071db381e990d80();
    }
    self setvelocity((0, 0, 0));
    self allowprone(0);
    self allowcrouch(0);
    playerstartjailsetcontrols(1);
    playerstartarenasetcontrols(0, "initPlayerArena_" + function_53c4c53197386572(var_228a5de8e2cd330, ""));
    playertakeawayrock(arena);
    playerclearjailtimeouthud(arena);
    val::set("PlayerArena", "equipment_primary", 0);
    val::set("PlayerArena", "equipment_secondary", 0);
    if (!function_1980065ce4dc067b()) {
        thread playerhealthomnvarwatcher(arena);
    }
    if (istrue(var_c3e0e015de4435fd)) {
        setplayervargulagjail(0);
        setplayervargulagarena(1);
        playergivearenaloadout(arena, loadoutindex);
        if (level.gulag.lethaldelay > 0) {
            thread watchlethaldelayplayer(arena);
        }
        return;
    }
    if (!function_1980065ce4dc067b()) {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_spawn_rules", self, 0, undefined, undefined, undefined, "dx_br_jpbm_");
    }
    var_13e3fc231bb8d6b9 = namespace_8bfdb6eb5a3df67a::playeriscinematiclayeron();
    if (!var_13e3fc231bb8d6b9) {
        thread namespace_8bfdb6eb5a3df67a::fadeoutin();
    }
    thread namespace_8bfdb6eb5a3df67a::fadeoutinspectatorsofplayer();
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 01. Time : " + gettime() + ". Screen fade to black. Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    wait(1);
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 02. Time : " + gettime() + ". Passed wait 1 after screen fade to black. Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    playergivearenaloadout(arena, loadoutindex);
    playerstartarenasetcontrols(0, "initPlayerArena_postloadout_" + function_53c4c53197386572(var_228a5de8e2cd330, ""));
    if (function_1980065ce4dc067b()) {
        namespace_d20f8ef223912e12::playerexecutionsdisable();
    }
    thread playertimedinvunerable(3);
    if (getdvarint(@"hash_4e5ffa31f07112ca", 0) == 1) {
        level.gulag.lethaldelay = 0;
        thread function_aa0549e91dad2fb9(arena);
    }
    if (level.gulag.lethaldelay > 0) {
        thread watchlethaldelayplayer(arena);
    }
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 03. Time : " + gettime() + ". Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    if (!function_1980065ce4dc067b() || function_9005af34e01bf8fe()) {
        if (function_9005af34e01bf8fe()) {
            var_33f8e2f409d6f930 = function_81a985371d489374(arena);
        } else {
            var_33f8e2f409d6f930 = getnextarenaspawn(arena);
        }
        spawnorigin = getgroundposition(var_33f8e2f409d6f930.origin, 1);
        spawnangles = var_33f8e2f409d6f930.angles;
        if (!isdefined(var_33f8e2f409d6f930.angles)) {
            spawnangles = (0, 0, 0);
        }
        namespace_8bfdb6eb5a3df67a::function_ab31cf673d70f72d(spawnorigin, spawnangles);
    }
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 04. Time : " + gettime() + ". Passed teleport to gulag. Number of players in the queue for gulag are : " + arena.matches.size + " .");
    }
    setplayervargulagjail(0);
    setplayervargulagarena(1);
    self.health = self.maxhealth;
    if (!function_d4b0eef0a0924094("setArmorHealth", arena)) {
        /#
            assert(isdefined(level.gulag.numarmorhealth));
        #/
        namespace_f8d3520d3483c1::setArmorHealth(level.gulag.numarmorhealth);
    }
    if (getdvarint(@"hash_3ceaf2c0c66c3dc2", 0) > 0) {
        self hudoutlineenableforclients(arena.arenaplayers, "outline_nodepth_red");
    }
    var_13e3fc231bb8d6b9 = namespace_8bfdb6eb5a3df67a::playeriscinematiclayeron();
    if (var_13e3fc231bb8d6b9) {
        namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    }
    if (function_9005af34e01bf8fe()) {
        thread function_8b208c4ca074aaeb(arena);
    }
    wait(1);
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 05. Time : " + gettime() + ". Start Camera sequence started 1 second ago. Number of players in the queue for gulag are : " + arena.matches.size + " . Player in gulag? : " + self.gulag + " .");
    }
    if (function_cfe304859f30e747("gulag_initPlayerArena")) {
        function_3cceb052d780fef1("gulag_initPlayerArena");
    }
    self allowprone(1);
    self allowcrouch(1);
    wait(function_59d019f0169c03be() - 1);
    self.var_38841d8e75a06ab3 = undefined;
    self notify("skydive_remove_spawn_protection");
    if (function_1980065ce4dc067b()) {
        namespace_d20f8ef223912e12::playerexecutionsenable();
    }
    if (function_1980065ce4dc067b() && istrue(level.var_43307855f189eb31.var_41ba817a6aa8ea0a)) {
        thread namespace_ad49798629176e96::function_696f54da8fcb6bbe("gulag_jailer_match_start", arena);
    }
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 06. Time : " + gettime() + ". Right before countdown. Number of players in the queue for gulag are : " + arena.matches.size + " . Player in gulag? : " + self.gulag + " .");
    }
    wait(1);
    if (level.gulag.var_c489bd0446d6b041) {
        logstring("[GULAG DEBUG] : Player " + self.clientid + " passed arena entrance step 07. Time : " + gettime() + ". Player is fully in gulag. Number of players in the queue for gulag are : " + arena.matches.size + " . Player in gulag? : " + self.gulag + " .");
    }
    if (getdvarint(@"hash_3ceaf2c0c66c3dc2", 0) > 0 && arena.arenaplayers.size > 0) {
        self hudoutlinedisableforclients(arena.arenaplayers);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa83c
// Size: 0x1b4
function function_737f63f33471e8b5() {
    arena = self;
    arena waittill("gulag_about_to_start_camera_sequence");
    var_ff6a5af3136746ab = arena.fightspawns[0];
    var_665773f35f5ad3a5 = arena.fightspawns[1];
    var_f3fd198bf503976f = arena.fightspawns[2];
    var_cdfbf5f85e67aaf9 = arena.fightspawns[3];
    if (distance2d(var_ff6a5af3136746ab.origin, var_f3fd198bf503976f.origin) > 150) {
        logstring("[GULAG] Bad gulag spawns for spawns : 1 & 3");
        var_f3fd198bf503976f = arena function_837e317cc5ca039b(var_ff6a5af3136746ab);
    }
    if (distance2d(var_665773f35f5ad3a5.origin, var_cdfbf5f85e67aaf9.origin) > 150) {
        logstring("[GULAG] Bad gulag spawns for spawns : 2 & 4");
        var_cdfbf5f85e67aaf9 = arena function_837e317cc5ca039b(var_665773f35f5ad3a5);
    }
    var_fffa32233dbce940 = 0;
    var_c9a7f236cdb526a2 = 0;
    foreach (p in arena.arenaplayers) {
        if (p.var_6d34bf5491ad7588 == 1) {
            if (var_fffa32233dbce940 == 0) {
                p function_b6ded705410954f1(var_ff6a5af3136746ab);
                var_fffa32233dbce940++;
            } else {
                p function_b6ded705410954f1(var_f3fd198bf503976f);
                var_fffa32233dbce940++;
            }
        } else if (var_c9a7f236cdb526a2 == 0) {
            p function_b6ded705410954f1(var_665773f35f5ad3a5);
            var_c9a7f236cdb526a2++;
        } else {
            p function_b6ded705410954f1(var_cdfbf5f85e67aaf9);
            var_c9a7f236cdb526a2++;
        }
    }
    arena notify("gulag_players_in_place_for_match_sequence");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9f7
// Size: 0x80
function function_b6ded705410954f1(var_6ec590da2678d88d) {
    player = self;
    spawnorigin = getgroundposition(var_6ec590da2678d88d.origin, 1);
    spawnangles = var_6ec590da2678d88d.angles;
    if (!isdefined(var_6ec590da2678d88d.angles)) {
        spawnangles = (0, 0, 0);
    }
    player namespace_8bfdb6eb5a3df67a::function_ab31cf673d70f72d(spawnorigin, spawnangles);
    player.var_600419d0dbb63af7 = spawnorigin;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa7e
// Size: 0xa1
function function_837e317cc5ca039b(var_c8d5bf0174223a73) {
    arena = self;
    var_f551fca9926c54c6 = undefined;
    foreach (spawnpoint in arena.fightspawns) {
        if (spawnpoint == var_c8d5bf0174223a73) {
            continue;
        }
        if (distance2d(var_c8d5bf0174223a73.origin, spawnpoint.origin) < 150) {
            var_f551fca9926c54c6 = spawnpoint;
        }
    }
    return var_f551fca9926c54c6;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab27
// Size: 0xa6
function playerstartarenasetcontrols(enable, var_228a5de8e2cd330) {
    if (enable) {
        self notify("gulag_end_lock_movement");
        self allowmelee(1);
        self allowmovement(1);
        self enableusability();
        self enableoffhandweapons();
        self allowads(1);
        self allowfire(1);
    } else {
        thread function_c194c7f63e64d501();
        self allowmelee(0);
        self allowmovement(0);
        self disableusability();
        self disableoffhandweapons();
        self allowads(0);
        self allowfire(0);
    }
    function_2e096d17b6286e29(self, "playerStartArenaSetControls_" + function_53c4c53197386572(var_228a5de8e2cd330, ""), enable);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabd4
// Size: 0x51
function function_c194c7f63e64d501() {
    player = self;
    player notify("gulag_end_lock_movement");
    player endon("gulag_end_lock_movement");
    player endon("disconnect");
    level endon("game_ended");
    if (!getdvarint(@"hash_d52a96b093650da", 1)) {
        return;
    }
    while (isdefined(player)) {
        player allowmovement(0);
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac2c
// Size: 0xc1
function getnextarenaspawn(arena) {
    if (!isdefined(arena.arenaspawncounter)) {
        arena.arenaspawncounter = 0;
    }
    spawnpt = undefined;
    var_aaf901dc990498c5 = 0;
    if (usecellspawns(arena)) {
        spawnpt = arena.cellspawns[arena.arenaspawncounter];
        var_aaf901dc990498c5 = arena.cellspawns.size;
    } else {
        spawnpt = arena.fightspawns[arena.arenaspawncounter];
        var_aaf901dc990498c5 = arena.fightspawns.size;
    }
    arena.arenaspawncounter++;
    arena.arenaspawncounter = arena.arenaspawncounter % var_aaf901dc990498c5;
    return spawnpt;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacf5
// Size: 0x29
function function_81a985371d489374(arena) {
    spawnpt = function_7a41a8c3404be54c(arena);
    arena thread function_be68bba79d94e189(spawnpt);
    return spawnpt;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad26
// Size: 0x2e8
function function_7a41a8c3404be54c(arena) {
    player = self;
    if (!isdefined(arena.var_be68bba79d94e189)) {
        arena.var_be68bba79d94e189 = [];
    }
    player.var_b6e41a06d7038b6c = 9999;
    arena.var_7313402120b08aad = [];
    for (i = 0; i < arena.fightspawns.size; i++) {
        arena.var_7313402120b08aad[i] = 0;
        if (isdefined(arena.var_707537a8904aa962)) {
            foreach (agent in arena.var_707537a8904aa962) {
                var_4484621308628c7b = distance2d(arena.fightspawns[i].origin, agent.origin);
                if (var_4484621308628c7b < player.var_b6e41a06d7038b6c) {
                    player.var_b6e41a06d7038b6c = var_4484621308628c7b;
                }
                arena.var_7313402120b08aad[i] = arena.var_7313402120b08aad[i] + var_4484621308628c7b * 1.1;
            }
        }
        if (isdefined(arena.arenaplayers)) {
            foreach (p in arena.arenaplayers) {
                var_4484621308628c7b = distance2d(arena.fightspawns[i].origin, p.origin);
                if (var_4484621308628c7b < player.var_b6e41a06d7038b6c) {
                    player.var_b6e41a06d7038b6c = var_4484621308628c7b;
                }
                arena.var_7313402120b08aad[i] = arena.var_7313402120b08aad[i] + var_4484621308628c7b;
            }
        }
    }
    var_9eb670ecc14b88ca = 0;
    var_3c6f314368998c21 = 0;
    for (i = 0; i < arena.fightspawns.size; i++) {
        if (arena.var_7313402120b08aad[i] >= arena.var_7313402120b08aad[var_9eb670ecc14b88ca]) {
            if (!array_contains(arena.var_be68bba79d94e189, arena.fightspawns[i])) {
                var_9eb670ecc14b88ca = i;
                var_3c6f314368998c21 = 1;
            }
        }
    }
    if (var_3c6f314368998c21) {
        var_7e5caf04b39f50c6 = arena.fightspawns[var_9eb670ecc14b88ca];
    } else {
        randomindex = randomint(arena.fightspawns.size);
        var_7e5caf04b39f50c6 = arena.fightspawns[randomindex];
    }
    return var_7e5caf04b39f50c6;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb016
// Size: 0x75
function function_be68bba79d94e189(var_9b90d8ba4db5be81) {
    arena = self;
    level endon("game_ended");
    arena.var_be68bba79d94e189 = array_add(arena.var_be68bba79d94e189, var_9b90d8ba4db5be81);
    wait(level.gulag.var_652312821a44b886);
    if (!isdefined(var_9b90d8ba4db5be81)) {
        return;
    }
    arena.var_be68bba79d94e189 = array_remove(arena.var_be68bba79d94e189, var_9b90d8ba4db5be81);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb092
// Size: 0x41
function playertimedinvunerable(timeout) {
    level endon("game_ended");
    self endon("disconnect");
    self.plotarmor = 1;
    waittill_any_timeout_no_endon_death_2(timeout, "death", "gulagRespawn");
    self.plotarmor = undefined;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0da
// Size: 0x93
function function_34cebfca4fdfb4f3() {
    level endon("game_ended");
    self endon("disconnect");
    playerclientnum = self function_d85aa3c6cfd398cf();
    if (isdefined(playerclientnum) && isdefined(level.var_c5877dbe60fddbf6)) {
        foreach (codcaster in level.var_c5877dbe60fddbf6) {
            if (codcaster function_afdedf3c8beb5ebc(playerclientnum)) {
                codcaster clearpredictedstreampos();
            }
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb174
// Size: 0x6e2
function gulagvictory(arena, winner, var_5b9a9b8346074883, var_5a5a690371917543, var_df2fbb13c226be75, var_fb551788da0fc531, var_4ac881e2a39322a5, var_bf7470006675932e, var_7b73d3f227cbd0f1, var_565c98bdccd583fb) {
    level endon("game_ended");
    winner endon("death_or_disconnect");
    winner notify("gulag_end");
    if (!isdefined(var_fb551788da0fc531)) {
        var_fb551788da0fc531 = 0;
    }
    if (!isdefined(var_7b73d3f227cbd0f1)) {
        var_7b73d3f227cbd0f1 = 0;
    }
    if (istrue(var_7b73d3f227cbd0f1) && istrue(level.gulag.var_5ebd7968d809fbac)) {
        if (istrue(winner.insertingarmorplate)) {
            winner notify("try_armor_cancel");
            while (istrue(winner.insertingarmorplate)) {
                waitframe();
            }
        }
        winner _freezecontrols(1, undefined, "gulagVictory");
    }
    var_eb5ca989a43ff3f = var_df2fbb13c226be75 == "br_twotwo_gulag_win_flag";
    winner function_13ad2ef144d94c4f(var_eb5ca989a43ff3f);
    winner namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(23, 0);
    foreach (player in arena.arenaplayers) {
        player namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(23, 0);
        if (arena.arenaplayers[0] == winner) {
            player setclientomnvar("ui_br_gulag_match_state", 4);
        } else {
            player setclientomnvar("ui_br_gulag_match_state", 5);
        }
    }
    winner playerclearjailtimeouthud();
    winner thread playertimedinvunerable(5);
    if (arena.arenaplayers.size > 2) {
        winner disableexecutionattack();
        winner disableexecutionvictim();
    }
    if (function_6e3541fd8fab45bc() && function_cfe304859f30e747("gulagWinSequence")) {
        winner function_3cceb052d780fef1("gulagWinSequence", arena, var_df2fbb13c226be75);
    }
    winner function_d4b0eef0a0924094("overrideRespawnArmor", arena);
    winner.gulagloser = 0;
    winner setthreatbiasgroup();
    if (arena.jailedplayers.size > 0 && getdvarint(@"hash_30c3e9d4f1f094cf", 0)) {
        winner hudoutlinedisableforclients(arena.jailedplayers);
    }
    if (arena.arenaplayers.size > 0 && getdvarint(@"hash_3ceaf2c0c66c3dc2", 0) > 0) {
        winner hudoutlinedisableforclients(arena.arenaplayers);
    }
    arena.arenaplayers = array_remove(arena.arenaplayers, winner);
    foreach (teammate in level.teamdata[winner.team]["players"]) {
        if (!isdefined(teammate) || !isalive(teammate)) {
            continue;
        }
        if (teammate != winner) {
            teammate thread namespace_44abc05161e2e2cb::showsplash("br_gulag_teammate_out", undefined, winner);
            thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_teammate_win", teammate, undefined, undefined, 2);
        }
    }
    reason = "";
    if (isdefined(var_df2fbb13c226be75)) {
        reason = var_df2fbb13c226be75;
    }
    /#
        println("halo_jump_c130" + winner.name + "loadoutKillstreak1" + reason);
    #/
    if (!istrue(var_5a5a690371917543) && !istrue(var_fb551788da0fc531) && !istrue(var_bf7470006675932e) && !istrue(var_565c98bdccd583fb)) {
        winner thread namespace_8bfdb6eb5a3df67a::triggerrespawnoverlay(3);
    }
    if (var_5b9a9b8346074883) {
        if (!istrue(var_5a5a690371917543) && !istrue(var_565c98bdccd583fb)) {
            if (isdefined(var_df2fbb13c226be75) && var_df2fbb13c226be75 == "timeout") {
                namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_timeout", winner, 0);
            } else {
                namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_noenemy", winner, 0);
            }
        }
        arena.jailedplayers = array_remove(arena.jailedplayers, winner);
        function_94eb48dd1cd7f972(winner, "Kicked Out", 0);
        updatematchqueuepositions(arena);
    } else {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_win", winner, 0, undefined, undefined, undefined, "dx_br_jpbm_");
    }
    if (getdvarint(@"hash_61e9133b2e499a6c")) {
        br_gulag_win = function_17ee301cf0b5ba85("br_gulag_win_classic");
        winner setplayermusicstate(br_gulag_win);
    } else {
        br_gulag_win = function_17ee301cf0b5ba85("br_gulag_win");
        winner setplayermusicstate(br_gulag_win);
    }
    if (isstring("") && "" != "" && soundexists("")) {
        winner playsoundtoplayer("", winner);
    }
    if (istrue(level.gulag.onekillwin) && (istrue(arena.isjailbreak) || level.gulag.maxplayers > 2)) {
        winner function_a593971d75d82113();
        winner function_379bb555405c16bb("br_gulag::gulagVictory()");
    }
    winner namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("isRespawning", 1);
    winner namespace_3bbb5a98b932c46f::deleteplacedequipment();
    streamtimeout = namespace_d3d40f75bb4e4c32::getdefaultstreamhinttimeoutms() / 1000;
    spawnpoint = winner namespace_8bfdb6eb5a3df67a::playerGetRespawnPoint(0, streamtimeout);
    winner.var_f9792c4242dc4625 = spawnpoint.origin;
    var_11f3b4465c8b637b = winner namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
    if (function_7effa8a355ddc886()) {
        winner.var_b807b84e723c5cea = undefined;
        winner.var_d95581fdfc29ec7a = undefined;
    }
    wait(function_86ee3121d91c59c3());
    if (istrue(level.gulag.arenaflag)) {
        arena.dom.arenaflag thread arenaflag_setvisibleplayer(0, winner);
    }
    winner clearclienttriggeraudiozone(2);
    winner namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7(1);
    wait(1);
    winner function_d1977a031be07de6();
    winner playerstartjailsetcontrols(1);
    winner playerstartarenasetcontrols(1, "gulagVictory");
    winner namespace_8bfdb6eb5a3df67a::function_d669022f6cd65402(0);
    winner setstance("stand");
    if (var_5b9a9b8346074883 && namespace_7e17181d03156026::isinlaststand(winner)) {
        winner notify("last_stand_revived");
    }
    winner function_ca008cc22b07ba4e();
    if (function_cfe304859f30e747("gulagGiveAIKillRewards")) {
        winner thread function_3cceb052d780fef1("gulagGiveAIKillRewards");
    }
    if (istrue(level.gulag.var_5ebd7968d809fbac)) {
        winner _freezecontrols(0, 0, "gulagVictory");
    }
    winner thread function_8cd7d5a73921bd93(10);
    winner gulagwinnerrespawn(var_fb551788da0fc531, var_df2fbb13c226be75, spawnpoint, 1, var_11f3b4465c8b637b, undefined, var_4ac881e2a39322a5, var_5a5a690371917543, var_bf7470006675932e, undefined, var_565c98bdccd583fb, undefined, arena);
    winner.var_f9792c4242dc4625 = undefined;
    namespace_a9c534dc7832aba4::function_f83bf537661ec58c(winner);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb85d
// Size: 0x32
function function_86ee3121d91c59c3() {
    if (function_cfe304859f30e747("gulagGetVictoryWait")) {
        waittime = function_3cceb052d780fef1("gulagGetVictoryWait");
    } else {
        waittime = 2;
    }
    return waittime;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb897
// Size: 0x32
function function_4bb92764539fff5d() {
    if (function_cfe304859f30e747("gulagGetPostVictoryWait")) {
        var_684405e0da1732fb = function_3cceb052d780fef1("gulagGetPostVictoryWait");
    } else {
        var_684405e0da1732fb = 1;
    }
    return var_684405e0da1732fb;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8d1
// Size: 0x75
function gulagplayerwatchfordeath(arena, var_4b434533d3624bec) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("gulag_end");
    self endon("gulagLost");
    self endon("gulag_auto_win");
    attacker = self waittill("death");
    if (istrue(level.gulag.onekillwin)) {
        handleonekillwin(arena, self, attacker, var_4b434533d3624bec);
    }
    thread gulagplayerlost(arena);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb94d
// Size: 0x550
function gulagplayerlost(arena, var_40d8983fc5e5c7a5, var_93592d4a5fd91ed1) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("pull_out_of_gulag");
    if (function_1980065ce4dc067b()) {
        self disableexecutionattack();
        self disableexecutionvictim();
    }
    self function_61195b9ee307ad14();
    if (function_d4b0eef0a0924094("playerLost", arena)) {
        return;
    }
    if (isalive(self)) {
        self.plotarmor = 1;
        function_13ad2ef144d94c4f();
    }
    if (function_cfe304859f30e747("gulagLostOverlay")) {
        function_3cceb052d780fef1("gulagLostOverlay", self, var_40d8983fc5e5c7a5);
    } else {
        thread namespace_a9c534dc7832aba4::triggereliminatedoverlay();
    }
    if (!isdefined(self)) {
        return;
    }
    if (function_cfe304859f30e747("gulagHandleLossInfiniteEarly")) {
        thread function_3cceb052d780fef1("gulagHandleLossInfiniteEarly", arena);
        return;
    }
    self notify("gulagLost");
    if (istrue(self.gulagloser)) {
        return;
    }
    self.gulagloser = 1;
    self setthreatbiasgroup();
    if (!function_1980065ce4dc067b() || istrue(var_93592d4a5fd91ed1)) {
        self.spectatepoint = arena.spectatepoint;
        thread playersetwasingulag(1);
    }
    if (function_7effa8a355ddc886()) {
        self.var_22f8f8d138d3c02f = 3;
        function_f071db381e990d80();
    }
    arena.jailedplayers = array_removeundefined(arena.jailedplayers);
    if (arena.jailedplayers.size > 0 && getdvarint(@"hash_30c3e9d4f1f094cf", 0)) {
        self hudoutlinedisableforclients(arena.jailedplayers);
    }
    arena.arenaplayers = array_removeundefined(arena.arenaplayers);
    if (arena.arenaplayers.size > 0 && getdvarint(@"hash_3ceaf2c0c66c3dc2", 0) > 0) {
        self hudoutlinedisableforclients(arena.arenaplayers);
    }
    arena.arenaplayers = array_remove(arena.arenaplayers, self);
    if (isdefined(self)) {
        var_5da640380ad84d71 = self.name;
    } else {
        var_5da640380ad84d71 = "<undefined>";
    }
    /#
        println("classtable:classtable_br_gulag" + var_5da640380ad84d71);
    #/
    br_gulag_lose = function_17ee301cf0b5ba85("br_gulag_lose");
    br_gulag_lose_classic = function_17ee301cf0b5ba85("br_gulag_lose_classic");
    if (getdvarint(@"hash_61e9133b2e499a6c")) {
        self setplayermusicstate(br_gulag_lose_classic);
    } else {
        self setplayermusicstate(br_gulag_lose);
    }
    if (isstring("") && "" != "" && soundexists("")) {
        self playsoundtoplayer("", self);
    }
    namespace_3bbb5a98b932c46f::deleteplacedequipment();
    namespace_80cec6cfc70c4f95::markplayeraseliminated(self, "gulagPlayerLost");
    level thread namespace_d20f8ef223912e12::updateplayerandteamcountui();
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_lose", self, 0, 1);
    namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("gulag_teammate_lose", self.team, self, 0, 0);
    if (function_cfe304859f30e747("gulagLoseSequence")) {
        function_3cceb052d780fef1("gulagLoseSequence", arena, var_40d8983fc5e5c7a5);
    }
    wait(function_86ee3121d91c59c3());
    self clearclienttriggeraudiozone(2);
    if (istrue(level.gulag.arenaflag)) {
        arena.dom.arenaflag thread arenaflag_setvisibleplayer(0, self);
    }
    namespace_aad14af462a74d08::function_b2306d0693ba65c1(0);
    namespace_a011fbf6d93f25e5::branalytics_gulagend(self, "loser", arena);
    namespace_ede58c1e66c2c280::calloutmarkerping_removeallcalloutsforplayer();
    playerdestroyhud(arena);
    if (isalive(self)) {
        if (!namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
            namespace_a9c534dc7832aba4::migratespectators(self, undefined, 1);
        }
        namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
        wait(1);
        function_d1977a031be07de6();
        if (!namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
            namespace_a9c534dc7832aba4::migratespectators(self, undefined, 1);
        }
        if (isalive(self)) {
            var_642470e1abc1bbf9 = spawnstruct();
            var_642470e1abc1bbf9.origin = self.origin;
            var_642470e1abc1bbf9.angles = self.angles;
            var_642470e1abc1bbf9.attacker = self.lastattacker;
            self.health = 0;
            self notify("death");
            self notify("death_or_disconnect");
            namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(23, 0);
            if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
                var_16c2d930984f2fef = self isreloading();
                if (var_16c2d930984f2fef) {
                    var_5814d27874b48e54 = spawnstruct();
                    var_5814d27874b48e54.player = self;
                    var_5814d27874b48e54.var_c739ba1eb6635b73 = getsystemtimeinmicroseconds();
                    var_5814d27874b48e54.var_c198f7ca473378fb = "DISCONNECT";
                    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
                }
            }
            namespace_a9c534dc7832aba4::spawnspectator(var_642470e1abc1bbf9, 1, 1);
            namespace_99ac021a7547cae3::removefromalivecount(0, "gulagPlayerLost");
        }
        namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    }
    self.plotarmor = undefined;
    self.arena = undefined;
    setplayervargulag(0);
    setplayervargulagarena(0);
    setplayervargulagjail(0);
    level callback::callback(#"hash_438552ad6e5b08a0", {player:self});
    if (function_cfe304859f30e747("gulagHandleLossInfiniteLate")) {
        thread function_3cceb052d780fef1("gulagHandleLossInfiniteLate", arena);
    }
    if (function_1980065ce4dc067b()) {
        function_1c9f130087cdf290();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbea4
// Size: 0x49
function function_13ad2ef144d94c4f(var_eb5ca989a43ff3f) {
    if (!isdefined(var_eb5ca989a43ff3f)) {
        var_eb5ca989a43ff3f = 0;
    }
    if (getdvarint(@"hash_4c5741468fcb94c1", 0)) {
        var_eb5ca989a43ff3f = 1;
    }
    function_f2c3ee9fded6a3df(var_eb5ca989a43ff3f);
    self allowfire(0);
    self allowads(0);
    self disableoffhandweapons();
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef4
// Size: 0x24
function function_d1977a031be07de6() {
    function_f2c3ee9fded6a3df(0);
    self allowfire(1);
    self allowads(1);
    self enableoffhandweapons();
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf1f
// Size: 0x92
function function_1c9f130087cdf290() {
    player = self;
    teamplayers = level.teamdata[player.team]["players"];
    if (isdefined(teamplayers)) {
        for (i = 0; i < teamplayers.size; i++) {
            if (!isdefined(teamplayers[i])) {
                continue;
            }
            if (isalive(teamplayers[i]) || istrue(teamplayers[i].gulag)) {
                return;
            }
        }
        [[ level.ondeadevent ]](player.team);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfb8
// Size: 0x56
function playersetwasingulag(value) {
    if (istrue(level.usegulag)) {
        if (value) {
            self.wasingulag = value;
            self setclientomnvar("ui_gulag", value);
        } else {
            self.wasingulag = undefined;
            self setclientomnvar("ui_gulag", 0);
        }
        setplayeringulagarenaextrainfo(value);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc015
// Size: 0x57
function playerspawningasspectator() {
    if (istrue(level.usegulag) && istrue(self.wasingulag) && level.teamdata[self.team]["aliveCount"] > 0 && !function_1980065ce4dc067b()) {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_buyback", self, 0, 1);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc073
// Size: 0x53
function recordmolotov(grenade, player) {
    if (istrue(player.gulagarena)) {
        arena = player.arena;
        arena.molotovs[arena.molotovs.size] = grenade;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0cd
// Size: 0x76
function cleanuparenamolotovs(arena) {
    foreach (molotov in arena.molotovs) {
        if (isdefined(molotov)) {
            thread namespace_df478cc572a311d3::molotov_cleanup_pool(molotov);
        }
    }
    arena.molotovs = [];
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params d, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc14a
// Size: 0xb1
function gulagwinnerrespawn(var_fb551788da0fc531, var_df2fbb13c226be75, spawnpoint, skipsplash, var_11f3b4465c8b637b, var_3bd8653773757c7, var_4ac881e2a39322a5, var_74af5908127b6729, var_bf7470006675932e, var_491d9866301a91d1, var_df631fdd92a76bb1, var_ae82e43c0d208739, arena) {
    var_104e34b87a973660 = undefined;
    if (!istrue(skipsplash)) {
        var_104e34b87a973660 = 7;
    }
    var_30a91e1938cfd1b2 = function_6f4fa9b79a3c7dce(var_fb551788da0fc531, var_df2fbb13c226be75, var_3bd8653773757c7, var_4ac881e2a39322a5, var_74af5908127b6729, var_bf7470006675932e, var_491d9866301a91d1, undefined, var_104e34b87a973660, var_df631fdd92a76bb1, var_ae82e43c0d208739, arena);
    namespace_8bfdb6eb5a3df67a::function_7642a6bee4cdaaa2(spawnpoint, var_11f3b4465c8b637b, var_30a91e1938cfd1b2);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc202
// Size: 0x189
function function_6f4fa9b79a3c7dce(var_fb551788da0fc531, var_df2fbb13c226be75, var_3bd8653773757c7, var_4ac881e2a39322a5, var_74af5908127b6729, var_bf7470006675932e, var_491d9866301a91d1, var_46ff3a000308206a, var_104e34b87a973660, var_df631fdd92a76bb1, var_ae82e43c0d208739, arena) {
    RS = namespace_8bfdb6eb5a3df67a::function_ade48af7c782e202(&playerrespawngulagcleanup, "veh_br_gulag_redeploy_flyby", var_3bd8653773757c7);
    RS namespace_8bfdb6eb5a3df67a::function_9fd565bcd654ed48(&function_f85939bec8ddd156);
    RS namespace_8bfdb6eb5a3df67a::function_b4c313df5d7fb216(&function_6414fdc0080486d8, var_46ff3a000308206a);
    RS namespace_8bfdb6eb5a3df67a::function_8cb232cdf47da79c(undefined, var_104e34b87a973660);
    RS namespace_8bfdb6eb5a3df67a::function_2556973693d6315(&gulagPostRespawn);
    RS.var_9fdc1f9e4fc628e4.var_fb551788da0fc531 = var_fb551788da0fc531;
    RS.var_9fdc1f9e4fc628e4.var_df2fbb13c226be75 = var_df2fbb13c226be75;
    RS.var_9fdc1f9e4fc628e4.var_4ac881e2a39322a5 = var_4ac881e2a39322a5;
    RS.var_9fdc1f9e4fc628e4.var_74af5908127b6729 = var_74af5908127b6729;
    RS.var_9fdc1f9e4fc628e4.var_bf7470006675932e = var_bf7470006675932e;
    RS.var_9fdc1f9e4fc628e4.var_491d9866301a91d1 = var_491d9866301a91d1;
    RS.var_9fdc1f9e4fc628e4.var_df631fdd92a76bb1 = var_df631fdd92a76bb1;
    RS.var_9fdc1f9e4fc628e4.var_ae82e43c0d208739 = var_ae82e43c0d208739;
    RS.var_9fdc1f9e4fc628e4.arena = arena;
    return RS;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc393
// Size: 0x1dd
function function_6414fdc0080486d8(var_9fdc1f9e4fc628e4) {
    /#
        println("ui_objective_pinned_text_param" + self.name);
    #/
    var_9fdc1f9e4fc628e4.var_550f09808fb6a6b5 = self.var_bed158a6dfac230d;
    var_768dca2a6910f9c4 = !istrue(var_9fdc1f9e4fc628e4.var_fb551788da0fc531);
    if (!istrue(var_9fdc1f9e4fc628e4.var_fb551788da0fc531) && !istrue(var_9fdc1f9e4fc628e4.var_bf7470006675932e)) {
        if (!istrue(var_9fdc1f9e4fc628e4.var_74af5908127b6729)) {
            namespace_aad14af462a74d08::function_b2306d0693ba65c1(1);
            namespace_3c5a4254f2b957ea::incpersstat("gulagWins", 1);
        }
    }
    if (isdefined(var_9fdc1f9e4fc628e4.var_df2fbb13c226be75)) {
        namespace_a011fbf6d93f25e5::branalytics_gulagend(self, var_9fdc1f9e4fc628e4.var_df2fbb13c226be75, var_9fdc1f9e4fc628e4.arena);
    }
    namespace_ede58c1e66c2c280::calloutmarkerping_removeallcalloutsforplayer();
    playersetwasingulag(0);
    setplayervargulag(0);
    setplayervargulagarena(0);
    level callback::callback(#"hash_438552ad6e5b08a0", {player:self});
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        playerdestroyhud(self.arena);
    }
    setplayervargulagjail(0);
    self.jailtime = undefined;
    if (isdefined(self.arena)) {
        self.arena.arenaplayers = array_remove(self.arena.arenaplayers, self);
    }
    playertakeawayrock(self.arena);
    gulagwinnerloadout(var_9fdc1f9e4fc628e4.var_fb551788da0fc531);
    var_d4066589fef0017 = 0;
    if (isdefined(level.gulag) && istrue(level.gulag.planerespawn)) {
        playerrespawngulagcleanup(var_9fdc1f9e4fc628e4.var_fb551788da0fc531);
        namespace_8bfdb6eb5a3df67a::function_961b4afc4c695b94();
        playersetupac130();
        var_d4066589fef0017 = 1;
    }
    return var_d4066589fef0017;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc578
// Size: 0x4b
function function_f85939bec8ddd156(var_9fdc1f9e4fc628e4) {
    if (istrue(self.var_36386f3f03c2ab4b)) {
        self.var_36386f3f03c2ab4b = undefined;
        self setclientdvar(@"hash_b21f1157c582ff15", 1);
    }
    self.plotarmor = undefined;
    self.c130 = undefined;
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5cb
// Size: 0x1fc
function gulagPostRespawn(var_9fdc1f9e4fc628e4) {
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (istrue(brgametype == "truckwar") && !istrue(var_9fdc1f9e4fc628e4.var_bf7470006675932e)) {
        var_9d45f503ae900a7d = "br_gulag_winner_redeploy_mogulag";
        var_1f0a356715870574 = undefined;
    }
    if (brgametype == "dmz" || brgametype == "exgm" || brgametype == "plunder" || brgametype == "kingslayer" || brgametype == "risk" || brgametype == "rumble_mgl") {
        var_9d45f503ae900a7d = "br_gulag_winner_redeploy_mogulag";
        var_1f0a356715870574 = undefined;
    } else if (istrue(var_9fdc1f9e4fc628e4.var_74af5908127b6729)) {
        var_9d45f503ae900a7d = "br_gulag_jailbreak_redeploy";
        var_1f0a356715870574 = undefined;
    } else if (istrue(var_9fdc1f9e4fc628e4.var_df631fdd92a76bb1)) {
        var_9d45f503ae900a7d = "br_gulag_winner_redeploy";
        var_1f0a356715870574 = undefined;
    } else if ((istrue(var_9fdc1f9e4fc628e4.var_fb551788da0fc531) || istrue(var_9fdc1f9e4fc628e4.var_bf7470006675932e)) && !istrue(var_9fdc1f9e4fc628e4.var_ae82e43c0d208739)) {
        var_9d45f503ae900a7d = "br_gulag_kiosk_redeploy";
        var_1f0a356715870574 = var_9fdc1f9e4fc628e4.var_4ac881e2a39322a5;
    } else {
        if (istrue(isdefined(level.gulag) && !istrue(level.gulag.shutdown)) && checkgulagusecount()) {
            if (function_1980065ce4dc067b()) {
                var_9d45f503ae900a7d = "br_gulag_winner_redeploy";
            } else {
                var_9d45f503ae900a7d = "br_gulag_winner_redeploy_mogulag";
            }
        } else {
            var_9d45f503ae900a7d = "br_gulag_winner_redeploy";
        }
        var_1f0a356715870574 = undefined;
    }
    if (!istrue(var_9fdc1f9e4fc628e4.var_491d9866301a91d1)) {
        thread namespace_44abc05161e2e2cb::showsplash(var_9d45f503ae900a7d, undefined, var_1f0a356715870574);
    }
    if (isdefined(level.gulag) && istrue(level.gulag.shutdown) && !istrue(self.gulagdone)) {
        wait(2);
        if (!isdefined(self)) {
            return;
        }
        playergulagdonesplash();
    }
    if (istrue(var_9fdc1f9e4fc628e4.var_ae82e43c0d208739)) {
        namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(self, "gulagPostRespawn");
        level thread namespace_d20f8ef223912e12::updateplayerandteamcountui();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7ce
// Size: 0xc4
function playerrespawngulagcleanup(var_9fdc1f9e4fc628e4) {
    self notify("gulagRespawn");
    namespace_df478cc572a311d3::molotov_clear_burning();
    if (getdvarint(@"hash_3e7ee8bdf6ce5f54", 0) == 0) {
        self.hasspawnweapons = 0;
    }
    function_c724f178c2df7240("respawnCleanup", self);
    self.health = self.maxhealth;
    namespace_4887422e77f3514e::onexitdeathsdoor(1);
    if (!istrue(var_9fdc1f9e4fc628e4.var_fb551788da0fc531)) {
        val::set("isRespawning", "player_for_spawn_logic", 0);
        self setclientomnvar("ui_gulag", 0);
        namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("isRespawning", 0);
        if (isdefined(self.arena)) {
            removeloadingplayer(self.arena, self);
        }
        self.arena = undefined;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc899
// Size: 0x14d
function gulagwinnerloadout(var_fb551788da0fc531) {
    var_ad99a0c87d805aee = function_1980065ce4dc067b() || getdvarint(@"hash_7ad0617cfa893a28", 0);
    var_57dc028bee0972ca = istrue(level.br_allowloadout) && !istrue(level.var_66113aa6fc12be57);
    var_6062d8e657aca5f4 = !istrue(var_fb551788da0fc531);
    if (var_ad99a0c87d805aee && var_6062d8e657aca5f4 && !var_57dc028bee0972ca) {
        return gulagwinnerremembergunandammo();
    }
    var_89469f016b14a064 = getdvarint(@"hash_f97d261e2f377ad9", 1) != 0 && getdvarint(@"hash_943f7c30bd8b86e8", -1) > -1;
    if (isdefined(level.br_standard_loadout) || var_89469f016b14a064) {
        self.gulagtableloadout = 1;
        return;
    }
    self.gulagtableloadout = 0;
    if (function_1980065ce4dc067b() || getdvarint(@"hash_7ad0617cfa893a28", 0) != 0 || istrue(self.var_ad99a0c87d805aee)) {
        gulagwinnerremembergunandammo();
    } else if (isdefined(level.br_standard_loadout) || getdvarint(@"hash_f97d261e2f377ad9", 1) != 0 && getdvarint(@"hash_943f7c30bd8b86e8", -1) > -1) {
        self.gulagtableloadout = 1;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9ed
// Size: 0xd6
function gulagwinnerrestoreloadout() {
    if (!istrue(level.usegulag) && !namespace_71073fa38f11492::isfeaturedisabled("gulagWinnerRestoreLoadoutUseGulag")) {
        return 0;
    }
    if (isdefined(self.var_61c274a3bd736bed)) {
        namespace_6ea7652ec407cc80::function_fe66ad4ed04f807f();
    }
    self.var_61c274a3bd736bed = [];
    var_ad99a0c87d805aee = function_1980065ce4dc067b() || getdvarint(@"hash_7ad0617cfa893a28", 0);
    var_5848e883f52e9ad6 = !istrue(self.gulagloser);
    if (var_ad99a0c87d805aee && var_5848e883f52e9ad6) {
        return gulagwinnerrestoregunandammo();
    }
    var_89469f016b14a064 = getdvarint(@"hash_f97d261e2f377ad9", 1) && getdvarint(@"hash_943f7c30bd8b86e8", -1) > -1;
    if (isdefined(level.br_standard_loadout) || var_89469f016b14a064) {
        return gulagwinnertableloadout();
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcacb
// Size: 0x81
function function_89a541b00b17d8a5(var_34ca738e6f3870de, var_9e41235ac60933d8) {
    var_b60d88867d0b5460 = [];
    foreach (primary in var_34ca738e6f3870de) {
        if (!array_contains(var_9e41235ac60933d8, primary.basename)) {
            var_b60d88867d0b5460[var_b60d88867d0b5460.size] = primary;
        }
    }
    return var_b60d88867d0b5460;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb54
// Size: 0x22f
function gulagwinnerremembergunandammo() {
    self.br_gulagguncurrent = self getcurrentprimaryweapon();
    var_34ca738e6f3870de = self getweaponslistprimaries();
    var_34ca738e6f3870de = function_89a541b00b17d8a5(var_34ca738e6f3870de, [0:"iw9_knifestab_mp", 1:"iw8_throwingknife_fire_melee_mp", 2:"iw8_throwingknife_electric_melee_mp", 3:"iw9_me_fists_mp", 4:"iw9_me_climbfists", 5:"iw9_swimfists_mp", 6:"iw9_me_diveknife_mp", 7:"iw9_gunless_mp", 8:"iw8_gunless"]);
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        var_34ca738e6f3870de = array_remove(var_34ca738e6f3870de, makeweapon("iw9_swimfists_mp"));
    }
    self.br_gulagguns = [];
    self.br_gulagammo = [];
    foreach (weaponobj in var_34ca738e6f3870de) {
        weaponname = getcompleteweaponname(weaponobj);
        if (getsubstr(weaponname, 0, 4) == "alt_" || namespace_d19129e4fa5d176::function_da27e3343b019fde() && namespace_68e641469fde3fa7::function_72ce982d9fc26f1c(weaponobj)) {
            continue;
        }
        self.br_gulagguns[self.br_gulagguns.size] = weaponobj;
        self.br_gulagammo[weaponname] = weaponclipsize(weaponobj) * 3;
    }
    var_a8b87696ab744141 = self getweaponslistoffhands();
    self.br_gulagoffhands = [];
    foreach (var_32d16745c91dbe50 in var_a8b87696ab744141) {
        var_26d3ccffc7bebec9 = self getweaponammoclip(var_32d16745c91dbe50);
        if (var_26d3ccffc7bebec9 <= 0) {
            continue;
        }
        self.br_gulagoffhands[self.br_gulagoffhands.size] = var_32d16745c91dbe50;
        var_fe758e8b3e5f9ec0 = getcompleteweaponname(var_32d16745c91dbe50);
        if (function_1980065ce4dc067b()) {
            self.br_gulagammo[var_fe758e8b3e5f9ec0] = var_26d3ccffc7bebec9;
        } else {
            self.br_gulagammo[var_fe758e8b3e5f9ec0] = weaponstartammo(var_32d16745c91dbe50);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd8a
// Size: 0x3c7
function gulagwinnerrestoregunandammo() {
    if (isdefined(self.br_gulagguns) && isdefined(self.br_gulagoffhands) && isdefined(self.br_gulagammo)) {
        var_7e8b31664d502e4a = function_1980065ce4dc067b() || getdvarint(@"hash_8d1efd0a32e32222", 0);
        if (var_7e8b31664d502e4a && self.br_gulagguns.size < 1) {
            self.gulagtableloadout = 1;
            gulagwinnertableloadout();
            return 0;
        }
        self takeallweapons();
        namespace_3bcd40a3005712ec::br_ammo_player_clear();
        self.equipment["primary"] = undefined;
        self.equipment["secondary"] = undefined;
        self.equipment["health"] = undefined;
        self.equipment["super"] = undefined;
        var_cf6837e74d470965 = 0;
        foreach (weaponobj in self.br_gulagguns) {
            weaponname = getcompleteweaponname(weaponobj);
            namespace_df5cfdbe6e2d3812::_giveweapon(weaponobj);
            self setweaponammostock(weaponobj, 0);
            if (!var_cf6837e74d470965) {
                self assignweaponprimaryslot(weaponname);
                namespace_df5cfdbe6e2d3812::_switchtoweapon(weaponobj);
                var_cf6837e74d470965 = 1;
            }
            namespace_e0ee43ef2dddadaa::fixupplayerweapons(self, weaponname);
            thread namespace_4f9f94245708410d::giveweaponpickup(weaponname);
            clipsize = weaponclipsize(weaponobj);
            ammo = int(min(clipsize, 25));
            if (isdefined(self.br_gulagammo[weaponname])) {
                ammo = int(max(ammo, self.br_gulagammo[weaponname]));
            }
            var_31b36738ff4eacd = 0;
            if (ammo > clipsize) {
                var_31b36738ff4eacd = ammo - clipsize;
                ammo = clipsize;
            }
            self setweaponammoclip(weaponobj, ammo);
            if (var_31b36738ff4eacd > 0) {
                ammotype = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weaponobj);
                if (isdefined(ammotype)) {
                    namespace_3bcd40a3005712ec::br_ammo_give_type(self, ammotype, var_31b36738ff4eacd);
                }
            }
        }
        namespace_3bcd40a3005712ec::br_ammo_update_weapons(self);
        if (self.br_gulagguns.size < 2) {
            self giveweapon(makeweapon("iw9_me_fists_mp"));
        }
        self giveweapon(makeweapon("iw9_me_climbfists"));
        if (!namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            self giveweapon(makeweapon("iw9_swimfists_mp"));
        }
        namespace_d19129e4fa5d176::function_4ffce833ce15363c(self.classstruct);
        foreach (var_32d16745c91dbe50 in self.br_gulagoffhands) {
            var_1189bd7fbe2861f8 = namespace_1a507865f681850e::getequipmentreffromweapon(var_32d16745c91dbe50);
            if (isdefined(var_1189bd7fbe2861f8) && isdefined(level.br_pickups.br_equipnametoscriptable[var_1189bd7fbe2861f8])) {
                scriptablename = level.br_pickups.br_equipnametoscriptable[var_1189bd7fbe2861f8];
                namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(self, scriptablename, 1);
                weaponname = getcompleteweaponname(var_32d16745c91dbe50);
                if (isdefined(self.br_gulagammo[weaponname])) {
                    var_26d3ccffc7bebec9 = self.br_gulagammo[weaponname];
                    self setweaponammoclip(var_32d16745c91dbe50, var_26d3ccffc7bebec9);
                }
            }
        }
        if (isdefined(self.br_gulagguncurrent)) {
            self switchtoweaponimmediate(self.br_gulagguncurrent);
        }
        if (isdefined(self.executionref)) {
            namespace_f446f6030ca8cff8::_giveexecution(self.executionref);
        }
        self.br_gulaggun = undefined;
        self.br_gulagammo = undefined;
        self.br_gulagoffhands = undefined;
        self.br_gulagguncurrent = undefined;
        return 1;
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd159
// Size: 0x13a
function gulagwinnertableloadout() {
    if (istrue(self.gulagtableloadout)) {
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            loadoutindex = getloadoutindex();
        } else {
            loadoutindex = getdvarint(@"hash_943f7c30bd8b86e8", -1);
        }
        if (loadoutindex > -1) {
            self.pers["gamemodeLoadout"] = level.gulagloadouts[loadoutindex];
        } else {
            self.pers["gamemodeLoadout"] = level.br_standard_loadout;
        }
        self.class = "gamemode";
        self.prevweaponobj = undefined;
        struct = namespace_d19129e4fa5d176::loadout_getclassstruct();
        struct = namespace_d19129e4fa5d176::loadout_updateclass(struct, "gamemode");
        namespace_d19129e4fa5d176::preloadandqueueclassstruct(struct, 1, 1);
        namespace_d19129e4fa5d176::giveloadout(self.team, "gamemode", 0, 0, undefined, 1);
        self givestartammo(struct.loadoutprimaryobject);
        self givestartammo(struct.loadoutsecondaryobject);
        namespace_d20f8ef223912e12::givelaststandifneeded(self);
        namespace_3bcd40a3005712ec::br_ammo_player_clear();
        namespace_3bcd40a3005712ec::br_give_starting_ammo();
        namespace_3bcd40a3005712ec::br_ammo_update_weapons(self);
        self notify("ammo_update");
        thread namespace_d20f8ef223912e12::br_displayperkinfo();
        self.gulagtableloadout = undefined;
        return 1;
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd29b
// Size: 0x5f
function popnextmatch(arena) {
    var_607899d4420fe1a5 = arena.matches[0];
    arena.matches = array_remove_index(arena.matches, 0);
    if (function_cfe304859f30e747("gulagOrderArenaPlayers")) {
        var_607899d4420fe1a5 = function_3cceb052d780fef1("gulagOrderArenaPlayers", var_607899d4420fe1a5);
    }
    return var_607899d4420fe1a5;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd302
// Size: 0x53
function checkgulagusecount() {
    if (level.gulag.maxuses >= 0) {
        var_22fbe5d036ebb50e = self.gulaguses;
        if (!isdefined(var_22fbe5d036ebb50e)) {
            var_22fbe5d036ebb50e = 0;
        }
        if (var_22fbe5d036ebb50e >= level.gulag.maxuses) {
            return 0;
        }
    }
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd35d
// Size: 0x12e
function function_c3014b9015a55715() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("gulag_end");
    self endon("jailbreak_respawn");
    playerclientnum = self function_d85aa3c6cfd398cf();
    if (isdefined(playerclientnum) && isdefined(level.var_c5877dbe60fddbf6)) {
        foreach (codcaster in level.var_c5877dbe60fddbf6) {
            if (codcaster function_afdedf3c8beb5ebc(playerclientnum)) {
                if (function_1980065ce4dc067b()) {
                    arena = namespace_ad49798629176e96::function_d095c23873d8efed();
                } else {
                    arena = playergetnextarena();
                }
                spawnpt = getnextjailspawn(arena);
                spawnorigin = getgroundposition(spawnpt.origin, 12);
                spawnangles = (0, 0, 0);
                if (isdefined(spawnpt.angles)) {
                    spawnangles = spawnpt.angles;
                }
                codcaster function_bc667001f9dd3808(spawnorigin);
            }
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd492
// Size: 0x132
function trygulagspawn() {
    /#
        println("kioskRevivePlayer" + self.name + "gulagOrderArenaPlayers" + self.class);
    #/
    if (!istrue(self.br_infilstarted) || !namespace_4b0406965e556711::gameflag("prematch_done")) {
        return 0;
    }
    if (isdefined(self.arena) && istrue(self.arena.var_26df1613c111c9c5)) {
        return 1;
    }
    if (istrue(self.gulag)) {
        return 0;
    }
    if (namespace_d3d40f75bb4e4c32::hasrespawntoken() && !namespace_cb965d2f71fefddc::respawntokendisabled()) {
        thread playergulagautowin("tryGulagSpawn", undefined, 1, 1);
        return 1;
    }
    if (!function_4a25d64251fab1b7()) {
        return 0;
    }
    if (istrue(level.gulag.shutdown) && !playerinlaststandhold()) {
        return 0;
    }
    if (getdvarint(@"hash_4d250e4873e1753e", 0)) {
        return 0;
    }
    if (istrue(self.gulagloser) && !namespace_d3d40f75bb4e4c32::function_15da77dc195bd80a()) {
        return 0;
    }
    if (namespace_d3d40f75bb4e4c32::function_15da77dc195bd80a() && !namespace_d3d40f75bb4e4c32::function_8b2396647673be50()) {
        namespace_cb965d2f71fefddc::function_17e127f2e3771058();
    }
    thread function_c3014b9015a55715();
    thread initplayerjail(1);
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5cc
// Size: 0x9e
function function_4a25d64251fab1b7() {
    if (!istrue(self.br_infilstarted) || !namespace_4b0406965e556711::gameflag("prematch_done")) {
        return 0;
    }
    if (istrue(self.gulag)) {
        return 0;
    }
    if (!istrue(level.usegulag)) {
        return 0;
    }
    if (istrue(level.gulag.shutdown) && !playerinlaststandhold()) {
        return 0;
    }
    if (getdvarint(@"hash_4d250e4873e1753e", 0)) {
        return 0;
    }
    if (!checkgulagusecount() && !namespace_d3d40f75bb4e4c32::function_15da77dc195bd80a()) {
        return 0;
    }
    if (istrue(self.extracted)) {
        return 0;
    }
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd672
// Size: 0xf2
function playergulaghud(arena) {
    self setclientomnvar("ui_match_start_countdown", 0);
    self setclientomnvar("ui_is_exfil_countdown", 0);
    if (isdefined(arena.fightover) && !arena.fightover) {
        playersetgulagdataomnvar(arena);
    }
    if (isdefined(arena.fightover) && !arena.fightover && isdefined(arena.time) && arena.time > 0) {
        time = arena.time;
        if (!istrue(arena.overtime)) {
            var_55c0e7e44829e72e = getovertimelength();
            time = time - var_55c0e7e44829e72e;
        }
        self setclientomnvar("ui_br_gulag_match_end_time", gettime() + int(time * 1000));
    } else {
        self setclientomnvar("ui_br_gulag_match_end_time", 0);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd76b
// Size: 0x3a
function updatematchtimerhud(arena, time) {
    _updatematchtimerhudinternal(arena.arenaplayers, time);
    _updatematchtimerhudinternal(arena.jailedplayers, time);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7ac
// Size: 0xab
function _updatematchtimerhudinternal(players, time) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (function_9005af34e01bf8fe()) {
            player waittill_notify_or_timeout("gulag_done_with_camera_sequence", 8);
        }
        if (time > 0) {
            player setclientomnvar("ui_br_gulag_match_end_time", gettime() + int(time * 1000));
        } else {
            player setclientomnvar("ui_br_gulag_match_end_time", 0);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd85e
// Size: 0x310
function updatematchqueuepositions(arena) {
    var_28f8483ea37164f3 = level.gulag.var_28f8483ea37164f3;
    while (var_28f8483ea37164f3 <= level.gulag.maxplayers) {
        matches = [];
        foreach (player in arena.jailedplayers) {
            if (!isdefined(player)) {
                continue;
            }
            var_b9d2d2843310014e = 0;
            foreach (var_b94827c01cb82f1e, match in matches) {
                if (match.size >= var_28f8483ea37164f3) {
                    continue;
                }
                var_7fe3b3676d522c19 = 0;
                if (function_1980065ce4dc067b()) {
                    var_de841985a7f29953 = player function_6a7526f387d26776(match);
                    if (var_de841985a7f29953 >= level.var_43307855f189eb31.var_5a6e1bcee6e4a7f1) {
                        var_7fe3b3676d522c19 = 1;
                    }
                } else {
                    foreach (var_4494cac530e83f63 in match) {
                        if (var_4494cac530e83f63.team == player.team) {
                            var_7fe3b3676d522c19 = 1;
                            break;
                        }
                    }
                }
                if (!var_7fe3b3676d522c19) {
                    var_b9d2d2843310014e = 1;
                    player.gulagposition = var_b94827c01cb82f1e + 1;
                    matches[var_b94827c01cb82f1e][matches[var_b94827c01cb82f1e].size] = player;
                    break;
                }
            }
            if (!var_b9d2d2843310014e) {
                player.gulagposition = matches.size + 1;
                matches[matches.size] = [0:player];
            }
        }
        arena.matches = matches;
        if (matches.size <= level.gulag.maxqueue) {
            break;
        }
        var_28f8483ea37164f3 = var_28f8483ea37164f3 + level.gulag.var_28f8483ea37164f3;
    }
    if (arena.matches.size > 0 && issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]() && issharedfuncdefined("teamAssim", "disablePlayer")) {
        var_607899d4420fe1a5 = arena.matches[0];
        foreach (player in var_607899d4420fe1a5) {
            [[ getsharedfunc("teamAssim", "disablePlayer") ]](player, "br_gulag");
        }
    }
    updatearenaomnvarplayers(arena);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb75
// Size: 0x110
function playerwatchdisconnect(arena) {
    self endon("gulagLost");
    self endon("gulag_end");
    self waittill("death_or_disconnect");
    if (isdefined(self) && istrue(self.gulagarena)) {
        return;
    }
    if (isdefined(self)) {
        if (istrue(self.gulagarena)) {
            arena.arenaplayers = array_remove(arena.arenaplayers, self);
        } else if (istrue(self.jailed)) {
            arena.jailedplayers = array_remove(arena.jailedplayers, self);
            function_94eb48dd1cd7f972(self, "Disconnect", 0);
        }
        if (isdefined(arena.var_654c981854394718)) {
            if (array_contains(arena.var_654c981854394718, self)) {
                arena.var_654c981854394718 = array_remove(arena.var_654c981854394718, self);
            }
        }
        playerdestroyhud(arena);
    } else {
        function_127c772f981aefc1(arena);
    }
    updatematchqueuepositions(arena);
    if (function_6e3541fd8fab45bc()) {
        function_cc5468bb6e866411(arena);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc8c
// Size: 0x4c
function playerdestroyhud(arena) {
    self setclientomnvar("ui_br_gulag_match_end_time", 0);
    if (isdefined(arena)) {
        playercleargulagomnvars(arena);
    }
    if (isdefined(self.gulagjailbreakhud)) {
        self.gulagjailbreakhud destroy();
    }
    self.gulagloadoutindex = undefined;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcdf
// Size: 0x3b
function setplayervargulag(value) {
    if (isdefined(self.gulag) && self.gulag == value) {
        return;
    }
    self.gulag = value;
    level notify("update_circle_hide");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd21
// Size: 0x43
function setplayervargulagarena(value) {
    if (isdefined(self.gulagarena) && self.gulagarena == value) {
        return;
    }
    setplayeringulagarenaextrainfo(value);
    self.gulagarena = value;
    level notify("update_circle_hide");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd6b
// Size: 0x41
function setplayeringulagarenaextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 1024;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~1024;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddb3
// Size: 0x43
function setplayervargulagjail(value) {
    if (isdefined(self.jailed) && self.jailed == value) {
        return;
    }
    setplayeringulagjailextrainfo(value);
    self.jailed = value;
    level notify("update_circle_hide");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddfd
// Size: 0x40
function setplayeringulagjailextrainfo(value) {
    if (value) {
        self.game_extrainfo = self.game_extrainfo | 512;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~512;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde44
// Size: 0xbc
function setplayergulagindex(arena) {
    if (arena.gulagindex > 8 - 1) {
        return;
    }
    var_8534515023afc188 = 3;
    var_64571e3aeccd1a07 = 3;
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (arena.gulagindex & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ee27f3f198276535 = self.game_extrainfo;
    var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    self.game_extrainfo = var_82a90e56e416fa55;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf07
// Size: 0x6f
function startbetting(arena, fighters) {
    if (!level.gulag.betting) {
        return undefined;
    }
    var_4b434533d3624bec = spawnstruct();
    var_4b434533d3624bec.fighters = fighters;
    var_4b434533d3624bec.bets = [];
    var_4b434533d3624bec.bettingopen = 1;
    var_4b434533d3624bec thread show_betting_to_players(arena);
    return var_4b434533d3624bec;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7e
// Size: 0xad
function show_betting_to_players(arena) {
    self endon("end_betting");
    while (1) {
        var_2804a2011e172ab6 = getbettingplayers(arena, self);
        foreach (player in var_2804a2011e172ab6) {
            if (isbot(player)) {
                continue;
            }
            if (isdefined(self.bets[player.guid])) {
                continue;
            }
            thread showbettinghud(arena, player);
        }
        arena waittill("player_added_to_jail");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe032
// Size: 0x252
function showbettinghud(arena, player) {
    self endon("end_betting");
    var_b5fe9e03c0fd6170 = spawnstruct();
    var_b5fe9e03c0fd6170.owner = player;
    self.bets[player.guid] = var_b5fe9e03c0fd6170;
    var_2f415ecbf5ec8bda = 10;
    var_3ae4f76cd196d765 = 0;
    var_b5fe9e03c0fd6170.hudfocusname = player namespace_52f6938dd902c7d0::createfontstring("default", 1.2);
    var_b5fe9e03c0fd6170.hudfocusname namespace_52f6938dd902c7d0::setpoint("LEFT", "CENTER", var_2f415ecbf5ec8bda, var_3ae4f76cd196d765);
    var_b5fe9e03c0fd6170.hudfocusname.label = "";
    var_b5fe9e03c0fd6170.hudfocusname.alpha = 0;
    var_c218c54dfc19219c = 5;
    var_58d5fef2b1d991cf = -50;
    var_b5fe9e03c0fd6170.hudavailable = player namespace_52f6938dd902c7d0::createfontstring("default", 1.2);
    var_b5fe9e03c0fd6170.hudavailable namespace_52f6938dd902c7d0::setpoint("LEFT", "LEFT", var_c218c54dfc19219c, var_58d5fef2b1d991cf);
    var_b5fe9e03c0fd6170.hudavailable.label = "MP/BR_GULAG_BET_AVAILABLE";
    var_b5fe9e03c0fd6170.hudavailable namespace_95fef46456ed271b::fontpulseinit();
    var_b5fe9e03c0fd6170.hudbetonplayer = player namespace_52f6938dd902c7d0::createfontstring("default", 1.5);
    var_b5fe9e03c0fd6170.hudbetonplayer namespace_52f6938dd902c7d0::setpoint("LEFT", "LEFT", var_c218c54dfc19219c, var_58d5fef2b1d991cf + 25);
    var_b5fe9e03c0fd6170.hudbetonplayer.label = "";
    var_b5fe9e03c0fd6170.hudammount = player namespace_52f6938dd902c7d0::createfontstring("default", 1.5);
    var_b5fe9e03c0fd6170.hudammount namespace_52f6938dd902c7d0::setpoint("LEFT", "LEFT", var_c218c54dfc19219c, var_58d5fef2b1d991cf + 40);
    var_b5fe9e03c0fd6170.hudammount.label = "MP/BR_GULAG_BET_AMMOUNT";
    var_b5fe9e03c0fd6170.playerbeton = -1;
    var_b5fe9e03c0fd6170.playerfocus = -1;
    var_b5fe9e03c0fd6170.ammount = 0;
    updatebethud(var_b5fe9e03c0fd6170);
    thread updatebetplayerfocus(arena, var_b5fe9e03c0fd6170);
    thread watchbetplaced(var_b5fe9e03c0fd6170);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe28b
// Size: 0x18b
function updatebetplayerfocus(arena, var_b5fe9e03c0fd6170) {
    self endon("end_betting");
    var_b5fe9e03c0fd6170.owner endon("disconnect");
    mindot = 0.9;
    while (1) {
        playerfocus = -1;
        bestdot = -1;
        var_cb1a928757e7d0ad = var_b5fe9e03c0fd6170.owner geteye();
        var_be8e4c874f6deccf = anglestoforward(var_b5fe9e03c0fd6170.owner getplayerangles());
        foreach (i, var_4570788876702376 in self.fighters) {
            if (!isdefined(var_4570788876702376)) {
                continue;
            }
            var_499a4b568077f460 = var_4570788876702376.origin + (0, 0, 30);
            var_ecaf2c0500e55585 = vectornormalize(var_499a4b568077f460 - var_cb1a928757e7d0ad);
            var_a93753d72e9f269d = vectordot(var_be8e4c874f6deccf, var_ecaf2c0500e55585);
            if (var_a93753d72e9f269d < mindot || var_a93753d72e9f269d < bestdot) {
                continue;
            }
            playerfocus = i;
            bestdot = var_a93753d72e9f269d;
        }
        if (playerfocus != var_b5fe9e03c0fd6170.playerfocus) {
            var_b5fe9e03c0fd6170.playerfocus = playerfocus;
            updateoutlines(arena);
            updatebethud(var_b5fe9e03c0fd6170);
        }
        wait(0.05);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe41d
// Size: 0x9a
function watchbetclear(var_b5fe9e03c0fd6170) {
    self endon("end_betting");
    var_b5fe9e03c0fd6170.owner endon("disconnect");
    notifystring = "betClear";
    thread notifyonplayercommandbetting(var_b5fe9e03c0fd6170.owner, notifystring, "+weapnext");
    while (1) {
        var_b5fe9e03c0fd6170.owner waittill(notifystring);
        if (var_b5fe9e03c0fd6170.playerbeton == -1) {
            continue;
        }
        var_b5fe9e03c0fd6170.ammount = 0;
        var_b5fe9e03c0fd6170.playerbeton = -1;
        updatebethud(var_b5fe9e03c0fd6170);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4be
// Size: 0x131
function watchbetplaced(var_b5fe9e03c0fd6170) {
    self endon("end_betting");
    var_b5fe9e03c0fd6170.owner endon("disconnect");
    notifystring = "betPlaced";
    thread notifyonplayercommandbetting(var_b5fe9e03c0fd6170.owner, notifystring, "+usereload");
    while (1) {
        var_b5fe9e03c0fd6170.owner waittill(notifystring);
        if (var_b5fe9e03c0fd6170.playerfocus == -1) {
            if (var_b5fe9e03c0fd6170.playerbeton == -1) {
                continue;
            }
            var_b69761e52eeaba08 = 0;
        } else if (var_b5fe9e03c0fd6170.playerbeton == -1) {
            var_b69761e52eeaba08 = 1;
        } else if (var_b5fe9e03c0fd6170.playerbeton == var_b5fe9e03c0fd6170.playerfocus) {
            var_b69761e52eeaba08 = var_b5fe9e03c0fd6170.ammount + 1;
        } else {
            var_b69761e52eeaba08 = 1;
        }
        if (var_b69761e52eeaba08 > var_b5fe9e03c0fd6170.owner.plundercount) {
            betchangefail(var_b5fe9e03c0fd6170);
            continue;
        }
        var_b5fe9e03c0fd6170.ammount = var_b69761e52eeaba08;
        var_b5fe9e03c0fd6170.playerbeton = var_b5fe9e03c0fd6170.playerfocus;
        updatebethud(var_b5fe9e03c0fd6170);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5f6
// Size: 0x3b
function notifyonplayercommandbetting(player, notifystr, cmdstr) {
    player notifyonplayercommand(notifystr, cmdstr);
    self waittill("end_betting");
    if (isdefined(player)) {
        player notifyonplayercommandremove(notifystr, cmdstr);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe638
// Size: 0x40
function betchangefail(var_b5fe9e03c0fd6170) {
    var_b5fe9e03c0fd6170.owner playlocalsound("br_pickup_deny");
    var_b5fe9e03c0fd6170.hudavailable thread namespace_95fef46456ed271b::fontpulse(var_b5fe9e03c0fd6170.owner);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe67f
// Size: 0x371
function updatebethud(var_b5fe9e03c0fd6170) {
    var_e40839434e2834ad = 1000;
    var_b5fe9e03c0fd6170.hudavailable setvalue((var_b5fe9e03c0fd6170.owner.plundercount - var_b5fe9e03c0fd6170.ammount) * var_e40839434e2834ad);
    if (var_b5fe9e03c0fd6170.playerbeton != -1) {
        var_b57068d736bdfac3 = self.fighters[var_b5fe9e03c0fd6170.playerbeton];
        if (isdefined(var_b57068d736bdfac3)) {
            var_b5fe9e03c0fd6170.hudbetonplayer setplayernamestring(var_b57068d736bdfac3);
            var_b5fe9e03c0fd6170.hudbetonplayer.alpha = 1;
        } else {
            var_b5fe9e03c0fd6170.hudbetonplayer.alpha = 0;
        }
    } else {
        var_b5fe9e03c0fd6170.hudbetonplayer.alpha = 0;
    }
    if (var_b5fe9e03c0fd6170.ammount > 0) {
        var_b5fe9e03c0fd6170.hudammount setvalue(var_b5fe9e03c0fd6170.ammount * var_e40839434e2834ad);
        var_b5fe9e03c0fd6170.hudammount.alpha = 1;
    } else {
        var_b5fe9e03c0fd6170.hudammount.alpha = 0;
    }
    if (var_b5fe9e03c0fd6170.playerbeton != -1) {
        if (var_b5fe9e03c0fd6170.playerfocus == var_b5fe9e03c0fd6170.playerbeton) {
            var_b5fe9e03c0fd6170.hudfocusname.alpha = 1;
            var_b5fe9e03c0fd6170.hudfocusname.label = "MP/BR_GULAG_FOCUS_BET_INCREASE";
            var_b5fe9e03c0fd6170.hudfocusname settext("");
        } else if (var_b5fe9e03c0fd6170.playerfocus != -1) {
            var_b5fe9e03c0fd6170.hudfocusname.alpha = 1;
            var_b5fe9e03c0fd6170.hudfocusname.label = "MP/BR_GULAG_FOCUS_BET_CHANGE";
            var_b57068d736bdfac3 = self.fighters[var_b5fe9e03c0fd6170.playerfocus];
            if (isdefined(var_b57068d736bdfac3)) {
                var_b5fe9e03c0fd6170.hudfocusname setplayernamestring(var_b57068d736bdfac3);
            }
        } else {
            /#
                assert(var_b5fe9e03c0fd6170.playerfocus == -1);
            #/
            var_b5fe9e03c0fd6170.hudfocusname.alpha = 1;
            var_b5fe9e03c0fd6170.hudfocusname.label = "MP/BR_GULAG_FOCUS_BET_CLEAR";
            var_b5fe9e03c0fd6170.hudfocusname settext("");
        }
    } else if (var_b5fe9e03c0fd6170.playerfocus != -1) {
        var_b5fe9e03c0fd6170.hudfocusname.alpha = 1;
        var_b5fe9e03c0fd6170.hudfocusname.label = "MP/BR_GULAG_FOCUS_BET";
        var_b57068d736bdfac3 = self.fighters[var_b5fe9e03c0fd6170.playerfocus];
        if (isdefined(var_b57068d736bdfac3)) {
            var_b5fe9e03c0fd6170.hudfocusname setplayernamestring(var_b57068d736bdfac3);
        }
    } else {
        /#
            assert(var_b5fe9e03c0fd6170.playerfocus == -1);
        #/
        var_b5fe9e03c0fd6170.hudfocusname.alpha = 0;
        var_b5fe9e03c0fd6170.hudfocusname.label = "";
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9f7
// Size: 0xc3
function cleanupbethud(var_b5fe9e03c0fd6170, delaytime) {
    var_b5fe9e03c0fd6170 notify("cleanUpBetHud");
    if (isdefined(delaytime)) {
        var_b5fe9e03c0fd6170 endon("cleanUpBetHud");
        wait(delaytime);
    }
    huds = [0:var_b5fe9e03c0fd6170.hudbetonplayer, 1:var_b5fe9e03c0fd6170.hudammount, 2:var_b5fe9e03c0fd6170.hudavailable, 3:var_b5fe9e03c0fd6170.hudfocusname];
    foreach (hud in huds) {
        if (isdefined(hud)) {
            hud destroy();
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xeac1
// Size: 0x40
function watchbetbutton(var_b5fe9e03c0fd6170, player, notifystr, index) {
    self endon("end_betting");
    while (1) {
        player waittill(notifystr);
        var_b5fe9e03c0fd6170 notify("betPlaced", index);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb08
// Size: 0x146
function endbetting(arena, var_4b434533d3624bec) {
    if (!isdefined(var_4b434533d3624bec) || !istrue(var_4b434533d3624bec.bettingopen)) {
        return;
    }
    var_4b434533d3624bec notify("end_betting");
    var_4b434533d3624bec.bettingopen = 0;
    foreach (var_b5fe9e03c0fd6170 in var_4b434533d3624bec.bets) {
        huds = [0:var_b5fe9e03c0fd6170.hudavailable, 1:var_b5fe9e03c0fd6170.hudfocusname];
        if (var_b5fe9e03c0fd6170.playerbeton == -1) {
            huds[huds.size] = var_b5fe9e03c0fd6170.hudbetonplayer;
            huds[huds.size] = var_b5fe9e03c0fd6170.hudammount;
        }
        foreach (hud in huds) {
            if (isdefined(hud)) {
                hud destroy();
            }
        }
    }
    updateoutlines(arena);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec55
// Size: 0xea
function payoutremainingbets(winner, var_4b434533d3624bec) {
    if (!isdefined(var_4b434533d3624bec)) {
        return;
    }
    var_1a76078d68ffcf56 = -1;
    if (isdefined(winner)) {
        var_1a76078d68ffcf56 = winner.fighterindex;
    }
    foreach (var_b5fe9e03c0fd6170 in var_4b434533d3624bec.bets) {
        if (var_b5fe9e03c0fd6170.playerbeton != -1 && isdefined(var_b5fe9e03c0fd6170.owner) && !istrue(var_b5fe9e03c0fd6170.paidout)) {
            iswinner = var_b5fe9e03c0fd6170.playerbeton == var_1a76078d68ffcf56;
            _completebet(var_4b434533d3624bec, var_b5fe9e03c0fd6170, iswinner);
        }
        thread cleanupbethud(var_b5fe9e03c0fd6170, 2.5);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed46
// Size: 0x204
function _completebet(var_4b434533d3624bec, var_b5fe9e03c0fd6170, iswinner) {
    var_40b237cd9ea72e30 = (0, 1, 0);
    var_2b25db2c6e526cc3 = (1, 0, 0);
    var_b5fe9e03c0fd6170.paidout = 1;
    if (iswinner) {
        var_b5fe9e03c0fd6170.owner namespace_c6ccccd95254983f::playersetplundercount(var_b5fe9e03c0fd6170.owner.plundercount + var_b5fe9e03c0fd6170.ammount);
        var_b5fe9e03c0fd6170.hudbetonplayer.color = var_40b237cd9ea72e30;
        var_b5fe9e03c0fd6170.hudbetonplayer.label = "MP/BR_GULAG_BET_FIGHTER_NAME_WINNER";
        var_b5fe9e03c0fd6170.hudammount.color = var_40b237cd9ea72e30;
        var_b5fe9e03c0fd6170.hudammount.label = "MP/BR_GULAG_BET_AMMOUNT_WON";
    } else {
        var_b5fe9e03c0fd6170.hudbetonplayer.color = var_2b25db2c6e526cc3;
        var_b5fe9e03c0fd6170.hudbetonplayer.label = "MP/BR_GULAG_BET_FIGHTER_NAME_LOSER";
        var_b5fe9e03c0fd6170.hudammount.color = var_2b25db2c6e526cc3;
        var_b5fe9e03c0fd6170.hudammount.label = "MP/BR_GULAG_BET_AMMOUNT_LOST";
        if (isalive(var_b5fe9e03c0fd6170.owner)) {
            var_43e1b640eec49671 = var_b5fe9e03c0fd6170.owner.plundercount - var_b5fe9e03c0fd6170.ammount;
            /#
                /#
                    assert(var_43e1b640eec49671 >= 0);
                #/
            #/
            var_43e1b640eec49671 = int(max(0, var_43e1b640eec49671));
            var_b5fe9e03c0fd6170.owner namespace_c6ccccd95254983f::playersetplundercount(var_43e1b640eec49671);
        }
    }
    var_b57068d736bdfac3 = var_4b434533d3624bec.fighters[var_b5fe9e03c0fd6170.playerfocus];
    if (isdefined(var_b57068d736bdfac3)) {
        var_b57068d736bdfac3 hudoutlinedisableforclient(var_b5fe9e03c0fd6170.owner);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef51
// Size: 0x99
function getbettingplayers(arena, var_4b434533d3624bec) {
    var_2804a2011e172ab6 = arena.jailedplayers;
    if (level.gulag.betting > 1) {
        foreach (var_4570788876702376 in var_4b434533d3624bec.fighters) {
            var_2804a2011e172ab6[var_2804a2011e172ab6.size] = var_4570788876702376;
        }
    }
    return var_2804a2011e172ab6;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeff2
// Size: 0xc3
function payoutbet(var_4b434533d3624bec, player, iswinner) {
    if (!isdefined(var_4b434533d3624bec)) {
        return;
    }
    foreach (var_b5fe9e03c0fd6170 in var_4b434533d3624bec.bets) {
        if (var_b5fe9e03c0fd6170.playerbeton == player.fighterindex && isdefined(var_b5fe9e03c0fd6170.owner) && !istrue(var_b5fe9e03c0fd6170.paidout)) {
            _completebet(var_4b434533d3624bec, var_b5fe9e03c0fd6170, iswinner);
            thread cleanupbethud(var_b5fe9e03c0fd6170, 2.5);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0bc
// Size: 0x6a
function rock_used(grenade) {
    arena = self.arena;
    grenade waittill_notify_or_timeout("missile_stuck", 4);
    wait(2);
    if (isdefined(grenade)) {
        grenade delete();
    }
    if (istrue(level.usegulag) && level.gulag.usefloorrocks) {
        spawnrock(arena);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf12d
// Size: 0x20e
function spawnrocks(arena) {
    arena.rocks = [];
    var_f68fbf2419213e95 = getentitylessscriptablearray(arena.target, "targetname");
    foreach (scriptable in var_f68fbf2419213e95) {
        if (scriptable.type == "brloot_rock") {
            arena.rocks = array_add(arena.rocks, scriptable);
        }
    }
    if (arena.rocks.size == 0 || !level.gulag.usefloorrocks) {
        for (i = 0; i < arena.rocks.size; i++) {
            rock = arena.rocks[i];
            if (rock getscriptableparthasstate("brloot_rock", "hidden")) {
                rock setscriptablepartstate("brloot_rock", "hidden");
            }
        }
        return;
    }
    var_630781c4f7e18225 = getdvarint(@"hash_557a54e530663166", 20);
    if (arena.rocks.size < var_630781c4f7e18225) {
        var_630781c4f7e18225 = arena.rocks.size;
    }
    arena.rocks = array_randomize(arena.rocks);
    arena.rockcounter = var_630781c4f7e18225;
    var_9cf140dc95fe44d7 = getdvarint(@"hash_983b34df705745ce", 1) == 0;
    for (i = 0; i < arena.rocks.size; i++) {
        rock = arena.rocks[i];
        rock.arena = arena;
        if (i >= var_630781c4f7e18225 || var_9cf140dc95fe44d7) {
            rock setscriptablepartstate("brloot_rock", "hidden");
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf342
// Size: 0xb8
function rockused(rock, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(rock) || !isdefined(player)) {
        return;
    }
    /#
        assert(part == "brloot_rock");
    #/
    var_2a333167cfc47ab1 = makeweapon("rock_mp");
    if (player hasweapon(var_2a333167cfc47ab1) && player getammocount(var_2a333167cfc47ab1) > 0) {
        return;
    }
    rock setscriptablepartstate("brloot_rock", "hidden");
    player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
    player namespace_1a507865f681850e::giveequipment("equip_rock", "primary");
    player playlocalsound("br_rock_pickup");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf401
// Size: 0x9a
function spawnrock(arena) {
    if (istrue(arena.shutdown) || arena.rocks.size == 0) {
        return;
    }
    rock = arena.rocks[arena.rockcounter];
    if (isdefined(rock)) {
        rock setscriptablepartstate("brloot_rock", "visible");
        arena.rockcounter++;
        if (arena.rockcounter >= arena.rocks.size) {
            arena.rockcounter = 0;
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4a2
// Size: 0x58
function playertakeawayrock(arena) {
    var_2a333167cfc47ab1 = makeweapon("rock_mp");
    if (self hasweapon(var_2a333167cfc47ab1)) {
        self takeweapon(var_2a333167cfc47ab1);
        self clearaccessory();
        if (level.gulag.usefloorrocks) {
            spawnrock(arena);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf501
// Size: 0x160
function gettangentoncirclefrompoint(circlecenter, circleradius, point) {
    xp = point[0] - circlecenter[0];
    var_cdeb3778f5379198 = point[1] - circlecenter[1];
    r = circleradius;
    var_251ec40356dde849 = xp * xp;
    var_13dca903493558de = var_cdeb3778f5379198 * var_cdeb3778f5379198;
    var_cdd57b78f51ff3f1 = r * r;
    c = var_251ec40356dde849 + var_13dca903493558de - var_cdd57b78f51ff3f1;
    var_1939553953102a08 = undefined;
    var_5371d63ef1da1802 = 1;
    if (c > 0) {
        x = (var_cdd57b78f51ff3f1 * xp - r * var_cdeb3778f5379198 * sqrt(var_251ec40356dde849 + var_13dca903493558de - var_cdd57b78f51ff3f1)) / (var_251ec40356dde849 + var_13dca903493558de);
        y = (var_cdd57b78f51ff3f1 * var_cdeb3778f5379198 + r * xp * sqrt(var_251ec40356dde849 + var_13dca903493558de - var_cdd57b78f51ff3f1)) / (var_251ec40356dde849 + var_13dca903493558de);
        var_1939553953102a08 = (x, y, point[2]) + (circlecenter[0], circlecenter[1], 0);
    } else {
        var_bf3b7724dea266fe = vectornormalize((xp, var_cdeb3778f5379198, 0));
        p = circlecenter + var_bf3b7724dea266fe * circleradius;
        var_1939553953102a08 = (p[0], p[1], point[2]);
        var_5371d63ef1da1802 = 0;
    }
    return [0:var_1939553953102a08, 1:var_5371d63ef1da1802];
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf669
// Size: 0x332
function spawnac130() {
    if (!istrue(level.gulag.planerespawn)) {
        return;
    }
    level waittill("prematch_started");
    if (!istrue(level.br_infils_disabled)) {
        wait(10);
    }
    startpt = undefined;
    circleradius = undefined;
    if (isdefined(level.br_ac130)) {
        startpt = level.br_ac130.startpt;
    } else {
        c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path();
        startpt = c130pathstruct.startpt;
    }
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        circleradius = level.br_circle.safecircleent.origin[2];
    } else {
        circleradius = level.br_level.br_circleradii[0];
    }
    circleradius = circleradius - 100;
    var_eca35027d55eb60f = gettangentoncirclefrompoint(level.br_level.br_mapcenter, circleradius, startpt);
    var_5371d63ef1da1802 = var_eca35027d55eb60f[1];
    endpt = var_eca35027d55eb60f[0];
    dist = 0;
    time = 0;
    if (var_5371d63ef1da1802) {
        dist = distance(startpt, endpt);
        time = dist / namespace_ad389306d44fc6b4::getc130speed();
    }
    var_91ad7677313c6b84 = (level.br_level.br_mapcenter[0], level.br_level.br_mapcenter[1], startpt[2]);
    level.gulag.ac130linker = spawn("script_model", var_91ad7677313c6b84);
    level.gulag.ac130linker setmodel("tag_origin");
    level.gulag.ac130linker.radius = circleradius;
    level.gulag.ac130 = namespace_ad389306d44fc6b4::gunship_spawn(startpt, endpt, time, 0, &ac130handlemovement);
    level.gulag.ac130 thread ac130setupanim();
    level.gulag.ac130.riders = [];
    if (time <= 0) {
        var_e31d6fe7007e7eab = endpt - level.br_level.br_mapcenter;
        var_d146bea510112c2e = vectornormalize((var_e31d6fe7007e7eab[0], var_e31d6fe7007e7eab[1], 0));
        angles = vectortoangles(var_d146bea510112c2e);
        level.gulag.ac130 unlink();
        level.gulag.ac130.angles = (0, angles[1] + 90, 0);
        level.gulag.ac130.origin = endpt;
        level.gulag.ac130 thread ac130linkandspin();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9a2
// Size: 0x48
function ac130setupanim() {
    animstruct = spawnstruct();
    self.animstruct = animstruct;
    animstruct.movingc130 = self;
    namespace_973962356ce55fee::spawnplayerpositionparentent(animstruct, self);
    namespace_973962356ce55fee::spawnplayerpositionent(animstruct, "j_prop_1");
    namespace_973962356ce55fee::playac130infilloopanims(animstruct);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9f1
// Size: 0x49
function ac130handlemovement(var_c7f46ef27d351cd0, movetime) {
    level endon("game_ended");
    self endon("death");
    self playloopsound("br_ac130_lp");
    if (movetime > 0) {
        self moveto(var_c7f46ef27d351cd0, movetime, 0, 0);
        wait(movetime);
    }
    thread ac130linkandspin();
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa41
// Size: 0xcc
function ac130linkandspin() {
    self notify("ac130LinkAndSpin");
    self endon("ac130LinkAndSpin");
    level.gulag.ac130linker endon("death");
    var_40f8c8ee714ef7ca = 6.28318;
    var_29ba0fb266411d2f = namespace_ad389306d44fc6b4::getc130speed();
    circleradius = level.gulag.ac130linker.radius;
    time = var_40f8c8ee714ef7ca * circleradius / var_29ba0fb266411d2f;
    self linkto(level.gulag.ac130linker, "tag_origin");
    if (time <= 0) {
        return;
    }
    for (;;) {
        level.gulag.ac130linker rotateyaw(360, time);
        wait(time);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb14
// Size: 0xa0
function waittillallarenasshutdown() {
    var_2f1ba8552dc9a492 = level.gulag.arenas.size;
    if (!istrue(level.gulag.multiarena)) {
        var_2f1ba8552dc9a492 = 1;
    }
    for (;;) {
        running = 0;
        for (i = 0; i < var_2f1ba8552dc9a492; i++) {
            arena = level.gulag.arenas[i];
            if (!istrue(arena.shutdown)) {
                running = 1;
                break;
            }
        }
        if (!running) {
            return;
        }
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbbb
// Size: 0x28b
function makeac130flyaway() {
    if (!istrue(level.gulag.planerespawn)) {
        return;
    }
    starttime = gettime();
    waittillallarenasshutdown();
    shutdowntime = gettime();
    wait(getdvarint(@"hash_8780b8778180d47c", 15));
    waittillframeend();
    foreach (player in level.gulag.ac130.riders) {
        if (isdefined(player)) {
            player.jumptype = "solo";
            player notify("halo_kick_c130");
        }
    }
    while (level.gulag.ac130.riders.size > 0) {
        waitframe();
    }
    startpt = level.gulag.ac130.origin;
    pathdir = anglestoforward(level.gulag.ac130.angles);
    var_5619b7bbc3745888 = level.br_level.br_circleradii[0] * 2;
    endpt = startpt + pathdir * var_5619b7bbc3745888;
    endpt = endpt + pathdir * namespace_ad389306d44fc6b4::getc130speed();
    dist = distance(startpt, endpt);
    time = dist / namespace_ad389306d44fc6b4::getc130speed();
    level.gulag.ac130 notify("ac130LinkAndSpin");
    level.gulag.ac130 unlink();
    level.gulag.ac130 moveto(endpt, time, 0, 0);
    wait(time);
    namespace_d3d40f75bb4e4c32::cleanac130struct(level.gulag.ac130.animstruct);
    if (isdefined(level.gulag.ac130)) {
        level.gulag.ac130 delete();
    }
    if (isdefined(level.gulag.ac130linker)) {
        level.gulag.ac130linker delete();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe4d
// Size: 0x20f
function transitioncircle(newradius, waittime) {
    if (!istrue(level.gulag.planerespawn)) {
        return;
    }
    if (!isdefined(level.gulag.ac130) || !isdefined(level.gulag.ac130linker)) {
        return;
    }
    neworigin = (level.br_circle.safecircleent.origin[0], level.br_circle.safecircleent.origin[1], level.gulag.ac130linker.origin[2]);
    newradius = newradius - 100;
    if (level.gulag.ac130linker.radius != newradius) {
        dirtocenter = vectornormalize(level.gulag.ac130linker.origin - level.gulag.ac130.origin);
        var_7c472ec4204b05dc = level.gulag.ac130.origin + dirtocenter * newradius;
        level.gulag.ac130 unlink();
        level.gulag.ac130linker.origin = var_7c472ec4204b05dc;
        level.gulag.ac130linker.radius = newradius;
        level.gulag.ac130linker dontinterpolate();
        level.gulag.ac130 thread ac130linkandspin();
    }
    level.gulag.ac130linker moveto(neworigin, waittime);
    wait(waittime);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10063
// Size: 0xdb
function playersetupac130() {
    self.infilanimindex = 1;
    self.isjumpmaster = 0;
    namespace_973962356ce55fee::playerlinktopositionent(level.gulag.ac130.animstruct);
    thread namespace_973962356ce55fee::playerplayinfilloopanim(level.gulag.ac130.animstruct);
    thread playerputinc130(level.gulag.ac130);
    namespace_973962356ce55fee::playersetupcontrolsforinfil(1);
    thread playerac130cleanup();
    thread playerautodeployaftertime();
    thread playerspawnprotectionac130();
    level.gulag.ac130.riders[level.gulag.ac130.riders.size] = self;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10145
// Size: 0x66
function playerputinc130(c130) {
    self.angles = c130.angles;
    thread listenjump(c130);
    thread namespace_ad389306d44fc6b4::listenkick(c130, 0);
    self.c130 = level.gulag.ac130;
    self.br_infil_type = "c130";
    thread namespace_ad389306d44fc6b4::orbitcam(c130);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101b2
// Size: 0x62
function listenjump(c130) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("cancel_c130");
    self endon("br_jump");
    self.redeployenabled = 0;
    waittill_either("halo_jump_c130", "halo_jump_solo_c130");
    self.jumptype = "solo";
    thread namespace_ad389306d44fc6b4::leaveplane(c130, 0, self getplayerangles(), 0);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1021b
// Size: 0x38
function playerspawnprotectionac130() {
    self endon("death_or_disconnect");
    self.plotarmor = 1;
    namespace_ad389306d44fc6b4::setplayervarinrespawnc130(1);
    waittillplayerdoneskydivingac130(self);
    self.plotarmor = undefined;
    namespace_ad389306d44fc6b4::setplayervarinrespawnc130(0);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1025a
// Size: 0x3c
function waittillplayerdoneskydivingac130(player) {
    player endon("timeout_gulag_ac130");
    thread _waittillplayerdoneskydivingac130timeout(player);
    player waittill("infil_jump_done");
    while (!player isparachuting() && !player isonground()) {
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1029d
// Size: 0x40
function _waittillplayerdoneskydivingac130timeout(player) {
    player endon("death_or_disconnect");
    player waittill_any_timeout_2(getdvarint(@"hash_8780b8778180d47c", 15), "halo_kick_c130", "halo_jump_solo_c130");
    wait(15);
    player notify("timeout_gulag_ac130");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102e4
// Size: 0x4d
function playerautodeployaftertime() {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    self endon("cancel_c130");
    self endon("br_jump");
    wait(getdvarint(@"hash_8780b8778180d47c", 15));
    self.jumptype = "solo";
    self notify("halo_kick_c130");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10338
// Size: 0xd2
function playerac130cleanup() {
    level endon("game_ended");
    waittill_any_4("disconnect", "death", "cancel_c130", "infil_jump_done");
    if (!isdefined(level.gulag.ac130.riders)) {
        return;
    }
    if (isdefined(self)) {
        level.gulag.ac130.riders = array_remove(level.gulag.ac130.riders, self);
    } else {
        level.gulag.ac130.riders = array_removeundefined(level.gulag.ac130.riders);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10411
// Size: 0x211
function playergulagautowin(context, var_4ac881e2a39322a5, var_57d71760971f748f, var_5806c4765695a2f4, var_74af5908127b6729, var_36f3c4e4a602e257, var_df631fdd92a76bb1, var_b6acf0c07c4311e6) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("gulag_auto_win");
    if (istrue(player.respawningfromtoken)) {
        return;
    }
    if (function_6e3541fd8fab45bc() && function_cfe304859f30e747("gulagWinSequence")) {
        if (!isdefined(var_b6acf0c07c4311e6)) {
            var_b6acf0c07c4311e6 = "br_twotwo_gulag_win";
        }
        player function_3cceb052d780fef1("gulagWinSequence", self.arena, var_b6acf0c07c4311e6);
    }
    var_ecb05f27d56ceb91 = player namespace_8bfdb6eb5a3df67a::playerhandlesponsor(var_4ac881e2a39322a5, var_57d71760971f748f, var_74af5908127b6729, var_5806c4765695a2f4, var_36f3c4e4a602e257, context);
    var_df2fbb13c226be75 = var_ecb05f27d56ceb91[1];
    var_84e2123aaca9a965 = var_ecb05f27d56ceb91[0];
    player.respawningfromtoken = 1;
    var_dbc5e63a72f2678a = namespace_71073fa38f11492::runbrgametypefunc("playerGulagAutoWinWait", var_4ac881e2a39322a5, var_57d71760971f748f);
    var_80365e25f6e3befd = undefined;
    if (!istrue(var_dbc5e63a72f2678a)) {
        var_80365e25f6e3befd = 1;
    }
    var_46ff3a000308206a = undefined;
    if (!isdefined(var_4ac881e2a39322a5) && !istrue(var_5806c4765695a2f4)) {
        var_46ff3a000308206a = 4;
    }
    var_fb551788da0fc531 = 1;
    var_3bd8653773757c7 = 1;
    var_30a91e1938cfd1b2 = function_6f4fa9b79a3c7dce(var_fb551788da0fc531, var_df2fbb13c226be75, var_3bd8653773757c7, var_84e2123aaca9a965, var_74af5908127b6729, undefined, undefined, var_46ff3a000308206a, undefined, var_df631fdd92a76bb1, var_57d71760971f748f);
    namespace_8bfdb6eb5a3df67a::function_d5ee3d3fad992d43(var_80365e25f6e3befd, var_30a91e1938cfd1b2);
    if (context == "jailbreak" || context == "phoenix") {
        player.placementstatsset = undefined;
        player.processlobbydataforclient = undefined;
        player.brbonusxpallowed = undefined;
        player.br_spectatorinitialized = undefined;
        player setclientomnvar("ui_br_player_position", 155);
        player setclientomnvar("ui_br_squad_eliminated_active", 0);
        player setclientomnvar("ui_round_end_title", 0);
        player setclientomnvar("ui_round_end_reason", 0);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10629
// Size: 0x24
function gulaginitloadouts() {
    level.gulag.jailloadout = creategulagjailloadout();
    function_4bcedfe145ee674e();
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10654
// Size: 0x185
function creategulagjailloadout() {
    loadout = [];
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = "iw9_me_fists";
    loadout["loadoutPrimaryAttachment"] = "none";
    loadout["loadoutPrimaryAttachment2"] = "none";
    loadout["loadoutPrimaryCamo"] = "none";
    loadout["loadoutPrimaryReticle"] = "none";
    loadout["loadoutSecondary"] = "none";
    loadout["loadoutSecondaryAttachment"] = "none";
    loadout["loadoutSecondaryAttachment2"] = "none";
    loadout["loadoutSecondaryCamo"] = "none";
    loadout["loadoutSecondaryReticle"] = "none";
    loadout["loadoutMeleeSlot"] = "none";
    if (!function_7effa8a355ddc886() || function_79fdf5cd036ff575()) {
        var_bb7a7034f796af47 = "equip_rock";
        if (isdefined(level.var_2c1d68af7f11cf7d)) {
            var_bb7a7034f796af47 = level.var_2c1d68af7f11cf7d;
        }
        loadout["loadoutEquipmentPrimary"] = var_bb7a7034f796af47;
    } else {
        loadout["loadoutEquipmentPrimary"] = "none";
    }
    loadout["loadoutEquipmentSecondary"] = "none";
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:"specialty_null"];
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutExecution"] = "none";
    loadout["disableBackupPistol"] = 1;
    return loadout;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107e1
// Size: 0x155
function function_4bcedfe145ee674e() {
    level.gulagloadouts = [];
    level.gulagloadouttable = choosegulagloadouttable();
    if (getdvar(@"hash_6ef30f04f9851a88") != "") {
        var_d61ea355b2c5b7d5 = strtok(getdvar(@"hash_6ef30f04f9851a88"), " ");
        var_4d4aa257c98f2157 = [];
        for (var_2613246720524878 = 0; var_2613246720524878 < var_d61ea355b2c5b7d5.size; var_2613246720524878++) {
            var_4d4aa257c98f2157[var_4d4aa257c98f2157.size] = int(var_d61ea355b2c5b7d5[var_4d4aa257c98f2157.size]);
        }
        var_7d958726e11b327 = var_4d4aa257c98f2157.size;
        for (classindex = 0; classindex < var_7d958726e11b327; classindex++) {
            level.gulagloadouts[level.gulagloadouts.size] = creategulagarenaloadout(var_4d4aa257c98f2157[classindex]);
            /#
                assertex(level.gulagloadouts[level.gulagloadouts.size]["loadoutPrimary"] != "", "Gulag loadout missing primary! Check dvar: scr_br_gulag_loadout_override");
            #/
        }
    } else {
        var_7d958726e11b327 = namespace_d19129e4fa5d176::function_df2933f96d726d71(level.gulagloadouttable) - 1;
        for (classindex = 0; classindex < var_7d958726e11b327; classindex++) {
            level.gulagloadouts[level.gulagloadouts.size] = creategulagarenaloadout(classindex);
        }
    }
    if (getdvarint(@"hash_249a73868c9cd7d8", 0)) {
        namespace_cb965d2f71fefddc::function_23a8498a6613de14();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1093d
// Size: 0xb0
function choosegulagloadouttable() {
    tablenum = 1;
    var_499d31877dfbc29d = randomint(1337) + 1;
    if (var_499d31877dfbc29d == 1337) {
        tablenum = 99;
    } else {
        tablenum = getdvarint(@"hash_a828e8ac5187f4d4", 0);
        if (tablenum == 0) {
            var_7dad96e1e2e75b1d = randomint(100) + 1;
            if (var_7dad96e1e2e75b1d > 90) {
                tablenum = 4;
            } else if (var_7dad96e1e2e75b1d > 65) {
                tablenum = 2;
            } else if (var_7dad96e1e2e75b1d > 40) {
                tablenum = 3;
            } else {
                tablenum = 1;
            }
        }
    }
    var_3624cc967d35dc5f = getdvar(@"hash_49bbf2da466dcc1b", "classtable:classtable_br_gulag");
    return var_3624cc967d35dc5f + tablenum;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109f5
// Size: 0x498
function creategulagarenaloadout(classindex) {
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.attachment1;
    loadout["loadoutPrimaryAttachment2"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.attachment2;
    loadout["loadoutPrimaryAttachment3"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.attachment3;
    loadout["loadoutPrimaryAttachment4"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.attachment4;
    loadout["loadoutPrimaryAttachment5"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.attachment5;
    loadout["loadoutPrimaryCamo"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).primaryweapon.reticle;
    loadout["loadoutSecondary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.attachment1;
    loadout["loadoutSecondaryAttachment2"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.attachment2;
    loadout["loadoutSecondaryAttachment3"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.attachment3;
    loadout["loadoutSecondaryAttachment4"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.attachment4;
    loadout["loadoutSecondaryAttachment5"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.attachment5;
    loadout["loadoutSecondaryCamo"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).secondaryweapon.reticle;
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).equipment.primary;
    loadout["loadoutEquipmentSecondary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).equipment.secondary;
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).perks.perk1, 1:namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).perks.perk2, 2:namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).perks.perk3, 3:namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).extraperks.perk1, 4:namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).extraperks.perk2, 5:namespace_d19129e4fa5d176::function_c7a0b640c398497(level.gulagloadouttable, classindex).extraperks.perk3];
    loadout["loadoutGesture"] = "playerData";
    loadout["tableColumn"] = classindex;
    return loadout;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e95
// Size: 0x274
function playergivearenaloadout(arena, loadoutindex) {
    if (getdvarint(@"hash_f97d261e2f377ad9", 1) == 0) {
        return;
    }
    if (function_d4b0eef0a0924094("getArenaLoadout", arena)) {
        goto LOC_000000b9;
    }
    if (function_cfe304859f30e747("getArenaLoadout")) {
        self.pers["gamemodeLoadout"] = function_3cceb052d780fef1("getArenaLoadout", arena);
    } else {
        self.pers["gamemodeLoadout"] = level.gulagloadouts[loadoutindex];
        checkforarenaloadoutoverride(loadoutindex);
    LOC_000000b9:
    }
LOC_000000b9:
    self.class = "gamemode";
    self.prevweaponobj = undefined;
    /#
        if (getdvarint(@"hash_9144df4be848d0b7", 1)) {
            if (isdefined(self.values)) {
                var_f0cc30cf70bb0a1d = self.values["<unknown string>"];
                if (isdefined(var_f0cc30cf70bb0a1d)) {
                    foreach (value in var_f0cc30cf70bb0a1d) {
                        if (isdefined(value) && isdefined(value.value) && isdefined(value.str_id)) {
                            function_2e096d17b6286e29(self, "<unknown string>" + value.str_id, value.value);
                        }
                    }
                }
            }
        }
    #/
    struct = namespace_d19129e4fa5d176::loadout_getclassstruct();
    struct = namespace_d19129e4fa5d176::loadout_updateclass(struct, "gamemode");
    namespace_d19129e4fa5d176::preloadandqueueclassstruct(struct, 1, 1);
    namespace_d19129e4fa5d176::giveloadout(self.team, "gamemode", 0, 0);
    if (function_ea01c1e7a2cff70d("shouldGiveMaxAmmoPrimary", arena)) {
        self givemaxammo(struct.loadoutprimaryobject);
    } else {
        self givestartammo(struct.loadoutprimaryobject);
    }
    if (isdefined(struct.loadoutsecondaryobject)) {
        if (function_ea01c1e7a2cff70d("shouldGiveMaxAmmoSecondary", arena)) {
            self givemaxammo(struct.loadoutsecondaryobject);
        } else {
            self givestartammo(struct.loadoutsecondaryobject);
        }
    }
    if (!function_cfe304859f30e747("getArenaLoadout")) {
        self.gulagloadoutindex = level.gulagloadouts[loadoutindex]["tableColumn"];
        playersetomnvargulag(arena, "loadoutRow", self.gulagloadoutindex);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11110
// Size: 0x275
function checkforarenaloadoutoverride(loadoutindex) {
    if (getdvarint(@"hash_ad67cf67992fe5f2", 0)) {
        switch (loadoutindex) {
        case 0:
            primary = "iw8_pi_decho";
            break;
        case 1:
            primary = "iw8_pi_cpapa";
            break;
        case 2:
            primary = "iw8_pi_decho";
            break;
        case 3:
            primary = "iw8_pi_cpapa";
            break;
        case 4:
            primary = "iw8_pi_decho";
            break;
        case 5:
            primary = "iw8_pi_cpapa";
            break;
        case 6:
            primary = "iw8_pi_decho";
            break;
        case 7:
            primary = "iw8_pi_cpapa";
            break;
        case 8:
            primary = "iw8_pi_decho";
            break;
        case 9:
        default:
            primary = "iw8_pi_cpapa";
            break;
        }
        self.pers["gamemodeLoadout"]["loadoutPrimary"] = primary;
        self.pers["gamemodeLoadout"]["loadoutPrimaryAttachment"] = "none";
        self.pers["gamemodeLoadout"]["loadoutPrimaryAttachment2"] = "none";
        self.pers["gamemodeLoadout"]["loadoutPrimaryAttachment3"] = "none";
        self.pers["gamemodeLoadout"]["loadoutPrimaryAttachment4"] = "none";
        self.pers["gamemodeLoadout"]["loadoutPrimaryAttachment5"] = "none";
        self.pers["gamemodeLoadout"]["loadoutSecondary"] = "none";
        self.pers["gamemodeLoadout"]["loadoutSecondaryAttachment"] = "none";
        self.pers["gamemodeLoadout"]["loadoutSecondaryAttachment2"] = "none";
        self.pers["gamemodeLoadout"]["loadoutSecondaryAttachment3"] = "none";
        self.pers["gamemodeLoadout"]["loadoutSecondaryAttachment4"] = "none";
        self.pers["gamemodeLoadout"]["loadoutSecondaryAttachment5"] = "none";
        self.pers["gamemodeLoadout"]["loadoutPerks"] = [0:"specialty_null"];
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1138c
// Size: 0xd2
function getloadoutindex() {
    if (getdvarint(@"hash_f97d261e2f377ad9", 1) == 0) {
        return;
    }
    var_7940dcde72827af7 = getdvarint(@"hash_4f38b76441d4b900", -1);
    if (var_7940dcde72827af7 > -1 && var_7940dcde72827af7 < level.gulagloadouts.size) {
        return var_7940dcde72827af7;
    }
    if (getdvar(@"hash_6ef30f04f9851a88") != "") {
        if (!isdefined(level.gulagloadoutindex) || level.gulagloadoutindex >= level.gulagloadouts.size) {
            level.gulagloadoutindex = 0;
        }
        index = level.gulagloadoutindex;
        level.gulagloadoutindex = level.gulagloadoutindex + 1;
    } else {
        index = randomint(level.gulagloadouts.size);
    }
    return index;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11466
// Size: 0xf4
function function_aa0549e91dad2fb9(arena) {
    arena endon("fight_over");
    arena endon("matchEnded");
    level endon("game_ended");
    self endon("death_or_disconnect");
    var_9587b4bb609d006e = level.gulag.timelimit;
    level.gulag.timelimit = 180;
    iprintln("Loadout verification starting in 3 seconds.");
    wait(3);
    iprintln("Verification start!");
    for (var_465df4a45cdb81bf = 0; var_465df4a45cdb81bf < level.gulagloadouts.size; var_465df4a45cdb81bf++) {
        iprintln("Loadout: " + var_465df4a45cdb81bf);
        playergivearenaloadout(arena, var_465df4a45cdb81bf);
        wait(5);
        _switchtoweapon(self.secondaryweapon);
        wait(4);
    }
    playergivearenaloadout(arena, 0);
    level.gulag.timelimit = var_9587b4bb609d006e;
    iprintln("Verification done!");
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11561
// Size: 0x2ba
function setupdomendflag(arena) {
    if (function_7effa8a355ddc886()) {
        var_37e3a1eaa43ea82c = getgroundposition(arena.center + (0, 530, 0), 1);
        if (isdefined(arena.var_1df1acee38dcca72)) {
            var_37e3a1eaa43ea82c = getgroundposition(arena.var_1df1acee38dcca72, 1);
        }
        var_d0ead7e588a015c5 = getdvarint(@"hash_177d32d81bd6bc15", 450);
        var_1230ea36a300368 = var_37e3a1eaa43ea82c;
    } else if (function_6e3541fd8fab45bc()) {
        var_37e3a1eaa43ea82c = getgroundposition(arena.center, 1);
        if (isdefined(arena.var_1df1acee38dcca72)) {
            var_37e3a1eaa43ea82c = getgroundposition(arena.var_1df1acee38dcca72, 1);
        }
        var_d0ead7e588a015c5 = getdvarint(@"hash_177d32d81bd6bc15", 100);
        var_1230ea36a300368 = var_37e3a1eaa43ea82c;
    } else {
        var_d0ead7e588a015c5 = getdvarint(@"hash_177d32d81bd6bc15", 50);
        var_1230ea36a300368 = getgroundposition(arena.center, 1);
    }
    arena.dom = spawnstruct();
    arena.dom.trigger = spawn("trigger_radius", var_1230ea36a300368, 0, int(var_d0ead7e588a015c5), int(level.br_domheight));
    arena.dom.trigger.objectivekey = "_a";
    arenaflag = namespace_98b55913d2326ac8::setupobjective(arena.dom.trigger, "neutral", undefined, 1);
    arenaflag.onuse = &arenaflag_onuse;
    arenaflag.onbeginuse = &arenaflag_onusebegin;
    arenaflag.onenduse = &arenaflag_onuseend;
    arenaflag.onuseupdate = &arenaflag_onuseupdate;
    arenaflag.oncontested = &arenaflag_oncontested;
    arenaflag.isarena = 1;
    arenaflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
    arenaflag.id = "domFlag";
    if (function_7effa8a355ddc886()) {
        arenaflag namespace_19b4203b51d56488::setcapturebehavior("all_teams_dom_together");
    } else {
        arenaflag namespace_19b4203b51d56488::setcapturebehavior("persistent");
    }
    arenaflag.scriptable delete();
    arenaflag.ignorestomp = 1;
    arenaflag namespace_19b4203b51d56488::requestid(0, 1, undefined, 0, 0);
    arenaflag.visibilitymanuallycontrolled = 1;
    arenaflag arenaflag_setenabled(0);
    arenaflag arenaflag_setvisible(arena, 0);
    arenaflag.arena = arena;
    arena.dom.arenaflag = arenaflag;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11822
// Size: 0xb9
function domgulagsounds(arena) {
    wait(1);
    if (isdefined(arena) && isdefined(arena.dom) && isdefined(arena.dom.arenaflag) && isdefined(arena.dom.arenaflag.flagmodel)) {
        if (isstring("") && "" != "" && soundexists("")) {
            arena.dom.arenaflag.flagmodel playloopsound("");
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118e2
// Size: 0x52
function arenaflag_setenabled(enable) {
    if (enable) {
        namespace_19b4203b51d56488::allowuse("any");
        self.trigger namespace_3c37cb17ade254d::trigger_on();
    } else {
        namespace_19b4203b51d56488::allowuse("none");
        self.trigger namespace_3c37cb17ade254d::trigger_off();
        namespace_19b4203b51d56488::resetcaptureprogress();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1193b
// Size: 0xb9
function arenaflag_setvisible(arena, enable, preview, var_ddf49b0f7bd17a0c) {
    self notify("arenaFlag_setVisible");
    if (enable) {
        icon = "waypoint_captureneutral";
        if (istrue(preview)) {
            icon = level.iconovertime;
        }
        thread arenaflag_objectiveshow(arena);
        thread namespace_19b4203b51d56488::setobjectivestatusicons(icon);
        thread namespace_19b4203b51d56488::setownerteam("neutral");
        thread namespace_98b55913d2326ac8::updateflagstate("idle", 0, "none");
        self.flagmodel show();
        thread arenaflag_showflagoutline(arena, 1);
        if (!istrue(preview)) {
            setovertimeomnvarenabled(arena, 1);
        }
    } else {
        thread arenaflag_setvisibledisableinternal(arena, preview, var_ddf49b0f7bd17a0c);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119fb
// Size: 0x91
function arenaflag_setvisibledisableinternal(arena, preview, var_ddf49b0f7bd17a0c) {
    self endon("arenaFlag_setVisible");
    if (!istrue(var_ddf49b0f7bd17a0c)) {
        objective_setpinned(self.objidnum, 0);
        wait(1);
    }
    function_127c772f981aefc1(arena);
    thread arenaflag_showflagoutline(arena, 0);
    thread arenaflag_objectivehide(var_ddf49b0f7bd17a0c);
    thread namespace_98b55913d2326ac8::updateflagstate("off", 0, "none");
    self.flagmodel hide(1);
    if (!istrue(preview)) {
        setovertimeomnvarenabled(arena, 0);
        setovertimeomnvarprogress(arena, 0);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a93
// Size: 0x7a
function arenaflag_setvisibleplayer(enable, player) {
    player endon("death_or_disconnect");
    if (enable) {
        player setclientomnvar("ui_overtime_timer_show", 1);
        objective_addclienttomask(self.objidnum, player);
    } else {
        objective_unpinforclient(self.objidnum, player);
        wait(1);
        player setclientomnvar("ui_overtime_timer_show", 0);
        objective_removeclientfrommask(self.objidnum, player);
    }
    thread arenaflag_showflagoutlineplayer(enable, player);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11b14
// Size: 0x31
function arenaflag_previewflag(arena, time) {
    thread arenaflag_setvisible(arena, 1, 1);
    wait(time);
    thread arenaflag_setvisible(arena, 0, 1, 1);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b4c
// Size: 0xdf
function arenaflag_objectiveshow(arena) {
    objective_removeallfrommask(self.objidnum);
    foreach (player in arena.jailedplayers) {
        objective_addclienttomask(self.objidnum, player);
    }
    foreach (player in arena.arenaplayers) {
        objective_addclienttomask(self.objidnum, player);
    }
    objective_showtoplayersinmask(self.objidnum);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c32
// Size: 0x3a
function arenaflag_objectivehide(var_ddf49b0f7bd17a0c) {
    objective_setshowprogress(self.objidnum, 0);
    objective_removeallfrommask(self.objidnum);
    objective_showtoplayersinmask(self.objidnum);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c73
// Size: 0xe7
function arenaflag_showflagoutline(arena, enable) {
    if (enable) {
        if (arena.jailedplayers.size > 0) {
            self.flagmodel hudoutlineenableforclients(arena.jailedplayers, "outline_nodepth_orange");
        }
        if (arena.arenaplayers.size > 0) {
            self.flagmodel hudoutlineenableforclients(arena.arenaplayers, "outline_nodepth_orange");
            self.flagmodel function_5226227bce83ebe9(1, "team_hundred_fifty_one");
        }
    } else {
        if (arena.jailedplayers.size > 0) {
            self.flagmodel hudoutlinedisableforclients(arena.jailedplayers);
        }
        if (arena.arenaplayers.size > 0) {
            self.flagmodel hudoutlinedisableforclients(arena.arenaplayers);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d61
// Size: 0x40
function arenaflag_showflagoutlineplayer(enable, player) {
    if (enable) {
        self.flagmodel hudoutlineenableforclient(player, "outline_nodepth_orange");
    } else {
        self.flagmodel hudoutlinedisableforclient(player);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11da8
// Size: 0x1c6
function arenaflag_onusebegin(player) {
    if (function_7effa8a355ddc886()) {
        var_ec49c5fcbd1dfb1a = getdvarint(@"hash_d74aaf9013c8609", 12);
    } else if (function_6e3541fd8fab45bc()) {
        var_ec49c5fcbd1dfb1a = getdvarint(@"hash_d74aaf9013c8609", 4);
    } else {
        var_ec49c5fcbd1dfb1a = getdvarint(@"hash_d74aaf9013c8609", 3);
    }
    player.iscapturing = 1;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        player setclientomnvar("ui_objective_pinned_text_param", 1);
    }
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    usetime = var_ec49c5fcbd1dfb1a;
    namespace_19b4203b51d56488::setusetime(usetime);
    if (istrue(level.capturedecay)) {
        thread namespace_19b4203b51d56488::useobjectdecay(player.team);
    }
    if (usetime > 0) {
        foreach (var_31210ce93279d451 in self.arena.arenaplayers) {
            if (var_31210ce93279d451 != player && var_31210ce93279d451.team != player.team) {
                self.prevownerteam = var_31210ce93279d451.team;
                break;
            }
        }
        namespace_98b55913d2326ac8::updateflagcapturestate(player.team);
        namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_taking", "waypoint_losing");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f75
// Size: 0x5c
function arenaflag_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (progress > 0.05 && change && !self.didstatusnotify) {
        self.didstatusnotify = 1;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fd8
// Size: 0xec
function arenaflag_onuseend(team, player, success) {
    if (function_7effa8a355ddc886() && isdefined(player) && success) {
        player thread namespace_44abc05161e2e2cb::showsplash("br_ai_gulag_overtime_end");
    }
    self.didstatusnotify = 0;
    if (success) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
        player.ui_dom_securing = undefined;
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_captureneutral");
        thread namespace_98b55913d2326ac8::updateflagstate("idle", 0);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_capture");
        thread namespace_98b55913d2326ac8::updateflagstate(ownerteam, 0);
    }
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120cb
// Size: 0x127
function arenaflag_setcaptured(team, var_22282e7d48ca3400) {
    namespace_19b4203b51d56488::setownerteam(team);
    self notify("capture", var_22282e7d48ca3400);
    self notify("assault", var_22282e7d48ca3400);
    namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defending", "waypoint_capture");
    self.neutralized = 0;
    thread namespace_98b55913d2326ac8::updateflagstate(team, 0, team);
    if (self.touchlist[team].size == 0 && isdefined(self.oldtouchlist)) {
        self.touchlist = self.oldtouchlist;
    }
    foreach (var_31210ce93279d451 in self.arena.arenaplayers) {
        if (var_31210ce93279d451 != var_22282e7d48ca3400 && var_31210ce93279d451.team != team && isdefined(self.assisttouchlist[var_31210ce93279d451.team])) {
            self.assisttouchlist[var_31210ce93279d451.team] = [];
            break;
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121f9
// Size: 0x13c
function arenaflag_onuse(var_22282e7d48ca3400) {
    team = var_22282e7d48ca3400.team;
    self.capturetime = gettime();
    self.neutralized = 0;
    arenaflag_setcaptured(team, var_22282e7d48ca3400);
    if (!self.neutralized && !function_7effa8a355ddc886()) {
        foreach (player in self.arena.arenaplayers) {
            if (isalive(player) && player.team != team) {
                if (function_1980065ce4dc067b()) {
                    player thread gulagplayerlost(self.arena, "br_twotwo_gulag_lost_flag", 1);
                } else {
                    player thread gulagplayerlost(self.arena);
                }
            }
        }
        thread handleendarena(self.arena);
        if (function_1980065ce4dc067b()) {
            var_22282e7d48ca3400 namespace_6ea7652ec407cc80::function_dc0a56e258889cb(self.arena, "br_twotwo_gulag_win_flag");
        }
        self.firstcapture = 0;
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1233c
// Size: 0x2e
function arenaflag_oncontested() {
    namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_contested");
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    thread namespace_98b55913d2326ac8::updateflagstate("contested", 0);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12371
// Size: 0x27d
function getarenaomnvarbitpackinginfo(var_ac85b79dfc4e45c6, value) {
    var_64571e3aeccd1a07 = 0;
    var_8534515023afc188 = 0;
    var_8e90fa6d5789ad63 = "";
    switch (var_ac85b79dfc4e45c6) {
    case #"hash_f5d0ab7e55587e1d":
        var_ecabdc27d567d5a1 = [0:0, 1:8, 2:"ui_br_gulag_players_1"];
        var_8e90fa6d5789ad63 = var_ecabdc27d567d5a1[2];
        var_8534515023afc188 = var_ecabdc27d567d5a1[1];
        var_64571e3aeccd1a07 = var_ecabdc27d567d5a1[0];
        value = value + 1;
        break;
    case #"hash_f5d0aa7e55587c8a":
        var_ecabdd27d567d7d4 = [0:8, 1:8, 2:"ui_br_gulag_players_1"];
        var_8e90fa6d5789ad63 = var_ecabdd27d567d7d4[2];
        var_8534515023afc188 = var_ecabdd27d567d7d4[1];
        var_64571e3aeccd1a07 = var_ecabdd27d567d7d4[0];
        value = value + 1;
        break;
    case #"hash_622ca631d10c4370":
        var_ecabde27d567da07 = [0:16, 1:8, 2:"ui_br_gulag_players_1"];
        var_8e90fa6d5789ad63 = var_ecabde27d567da07[2];
        var_8534515023afc188 = var_ecabde27d567da07[1];
        var_64571e3aeccd1a07 = var_ecabde27d567da07[0];
        value = value + 1;
        break;
    case #"hash_622ca731d10c4503":
        var_ecabdf27d567dc3a = [0:24, 1:8, 2:"ui_br_gulag_players_1"];
        var_8e90fa6d5789ad63 = var_ecabdf27d567dc3a[2];
        var_8534515023afc188 = var_ecabdf27d567dc3a[1];
        var_64571e3aeccd1a07 = var_ecabdf27d567dc3a[0];
        value = value + 1;
        break;
    case #"hash_e89fe3aac33c10c9":
        var_ecabe027d567de6d = [0:0, 1:8, 2:"ui_br_gulag_data"];
        var_8e90fa6d5789ad63 = var_ecabe027d567de6d[2];
        var_8534515023afc188 = var_ecabe027d567de6d[1];
        var_64571e3aeccd1a07 = var_ecabe027d567de6d[0];
        value = value + 1;
        break;
    case #"hash_848cf681a543f242":
        var_ecabd127d567bd70 = [0:8, 1:8, 2:"ui_br_gulag_data"];
        var_8e90fa6d5789ad63 = var_ecabd127d567bd70[2];
        var_8534515023afc188 = var_ecabd127d567bd70[1];
        var_64571e3aeccd1a07 = var_ecabd127d567bd70[0];
        break;
    case #"hash_848cf781a543f3d5":
        var_ecabd227d567bfa3 = [0:16, 1:8, 2:"ui_br_gulag_data"];
        var_8e90fa6d5789ad63 = var_ecabd227d567bfa3[2];
        var_8534515023afc188 = var_ecabd227d567bfa3[1];
        var_64571e3aeccd1a07 = var_ecabd227d567bfa3[0];
        break;
    default:
        if (!function_1980065ce4dc067b()) {
            /#
                assertmsg("Unknown player info '" + var_ac85b79dfc4e45c6 + "' requested for packing into gulag omnvar!");
            #/
        }
        break;
    }
    return [0:var_64571e3aeccd1a07, 1:var_8534515023afc188, 2:var_8e90fa6d5789ad63, 3:value];
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125f6
// Size: 0xaf
function packarenaomnvardata(arena, var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188) {
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (value & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ee27f3f198276535 = arena.omnvardata[var_8e90fa6d5789ad63];
    var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    arena.omnvardata[var_8e90fa6d5789ad63] = var_82a90e56e416fa55;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126ac
// Size: 0x8f
function setarenaomnvar(arena, var_ac85b79dfc4e45c6, value) {
    /#
        assert(isdefined(var_ac85b79dfc4e45c6) && isstring(var_ac85b79dfc4e45c6));
    #/
    var_bfec5e27b42801e8 = getarenaomnvarbitpackinginfo(var_ac85b79dfc4e45c6, value);
    value = var_bfec5e27b42801e8[3];
    var_8e90fa6d5789ad63 = var_bfec5e27b42801e8[2];
    var_8534515023afc188 = var_bfec5e27b42801e8[1];
    var_64571e3aeccd1a07 = var_bfec5e27b42801e8[0];
    if (var_8e90fa6d5789ad63 == "") {
        return;
    }
    packarenaomnvardata(arena, var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12742
// Size: 0x40
function setarenaomnvarplayertype(arena, var_ac85b79dfc4e45c6, player) {
    entnum = -1;
    if (isdefined(player)) {
        entnum = player getentitynumber();
    }
    setarenaomnvar(arena, var_ac85b79dfc4e45c6, entnum);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12789
// Size: 0x44
function setarenaomnvarhealthtype(arena, var_ac85b79dfc4e45c6, player) {
    health = 0;
    if (isdefined(player)) {
        health = player.health;
    }
    setarenaomnvar(arena, var_ac85b79dfc4e45c6, health);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127d4
// Size: 0x1e3
function updatearenaomnvarplayers(arena) {
    arena.omnvardata["ui_br_gulag_players_1"] = 0;
    if (!function_1980065ce4dc067b()) {
        /#
            assert(level.gulag.maxplayers == 2);
        #/
    }
    for (i = 0; i < level.gulag.maxplayers; i++) {
        player = arena.arenaplayers[i];
        setarenaomnvarplayertype(arena, "playerArena" + i, player);
    }
    var_607899d4420fe1a5 = arena.matches[0];
    if (!isdefined(var_607899d4420fe1a5)) {
        var_607899d4420fe1a5 = [];
    }
    setarenaomnvarplayertype(arena, "playerJail0", var_607899d4420fe1a5[0]);
    setarenaomnvarplayertype(arena, "playerJail1", var_607899d4420fe1a5[1]);
    var_87b2be9fef844de = array_combine(arena.jailedplayers, arena.arenaplayers);
    foreach (player in var_87b2be9fef844de) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_br_gulag_players_1", arena.omnvardata["ui_br_gulag_players_1"]);
        var_a55ab0ddab9125ff = ter_op(isdefined(player.gulagposition), player.gulagposition, 0);
        var_793c4e46c0425bd2 = !isplayermatched(arena, player) && var_a55ab0ddab9125ff != 0;
        if (var_793c4e46c0425bd2) {
            player setclientomnvar("ui_br_gulag_match_state", 0);
        }
        var_82a90e56e416fa55 = var_793c4e46c0425bd2 | var_a55ab0ddab9125ff << 1;
        player setclientomnvar("ui_br_gulag_queue_position", var_82a90e56e416fa55);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129be
// Size: 0x29
function playersetgulagdataomnvar(arena) {
    self setclientomnvar("ui_br_gulag_data", arena.omnvardata["ui_br_gulag_data"]);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129ee
// Size: 0x145
function updatearenaomnvardata(arena) {
    resetarenaomnvardata(arena);
    if (!function_1980065ce4dc067b()) {
        /#
            assert(level.gulag.maxplayers == 2);
        #/
    }
    for (i = 0; i < level.gulag.maxplayers; i++) {
        player = arena.arenaplayers[i];
        if (isdefined(player)) {
            setarenaomnvarhealthtype(arena, "playerHealth" + i, player);
        }
    }
    foreach (player in arena.jailedplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player playersetgulagdataomnvar(arena);
    }
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player playersetarenaomnvarwithloadout(arena);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b3a
// Size: 0x1f
function resetarenaomnvardata(arena) {
    arena.omnvardata["ui_br_gulag_data"] = 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b60
// Size: 0x4f
function playersetarenaomnvarwithloadout(arena) {
    if (!isdefined(self.gulagloadoutindex)) {
        self setclientomnvar("ui_br_gulag_data", arena.omnvardata["ui_br_gulag_data"]);
    } else {
        playersetomnvargulag(arena, "loadoutRow", self.gulagloadoutindex);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bb6
// Size: 0x9e
function playersetomnvargulag(arena, var_ac85b79dfc4e45c6, value) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(isdefined(var_ac85b79dfc4e45c6) && isstring(var_ac85b79dfc4e45c6));
    #/
    var_bfec6527b428114d = getarenaomnvarbitpackinginfo(var_ac85b79dfc4e45c6, value);
    value = var_bfec6527b428114d[3];
    var_8e90fa6d5789ad63 = var_bfec6527b428114d[2];
    var_8534515023afc188 = var_bfec6527b428114d[1];
    var_64571e3aeccd1a07 = var_bfec6527b428114d[0];
    if (var_8e90fa6d5789ad63 == "") {
        return;
    }
    playerpackdataintogulagomnvar(arena, var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c5b
// Size: 0xa9
function playerpackdataintogulagomnvar(arena, var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188) {
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (value & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ee27f3f198276535 = arena.omnvardata[var_8e90fa6d5789ad63];
    var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    self setclientomnvar(var_8e90fa6d5789ad63, var_82a90e56e416fa55);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d0b
// Size: 0x1c
function updateplayeromnvarsallmatches(arena) {
    updatearenaomnvarplayers(arena);
    updatearenaomnvardata(arena);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d2e
// Size: 0xaa
function playercleargulagomnvars(arena) {
    var_1283ce7783c79a30 = getarraykeys(arena.omnvardata);
    foreach (var_8e90fa6d5789ad63 in var_1283ce7783c79a30) {
        self setclientomnvar(var_8e90fa6d5789ad63, 0);
    }
    self setclientomnvar("ui_overtime_timer", 0);
    self setclientomnvar("ui_overtime_timer_show", 0);
    self setclientomnvar("ui_match_start_countdown", 0);
    self setclientomnvar("ui_match_in_progress", 1);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ddf
// Size: 0xd3
function setovertimeomnvarprogress(arena, progress) {
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_overtime_timer", progress);
    }
    foreach (player in arena.jailedplayers) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_overtime_timer", progress);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12eb9
// Size: 0xf1
function setovertimeomnvarenabled(arena, enabled) {
    if (isdefined(arena.arenaplayers)) {
        foreach (player in arena.arenaplayers) {
            if (!isdefined(player)) {
                continue;
            }
            player setclientomnvar("ui_overtime_timer_show", enabled);
        }
    }
    if (isdefined(arena.jailedplayers)) {
        foreach (player in arena.jailedplayers) {
            if (!isdefined(player)) {
                continue;
            }
            player setclientomnvar("ui_overtime_timer_show", enabled);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fb1
// Size: 0xc3
function playerhealthomnvarwatcher(arena) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("gulag_end");
    if (!function_1980065ce4dc067b()) {
        /#
            assert(arena.arenaplayers[0] == self || arena.arenaplayers[1] == self);
        #/
    }
    var_ac85b79dfc4e45c6 = "playerHealth0";
    if (arena.arenaplayers[0] != self) {
        var_ac85b79dfc4e45c6 = "playerHealth1";
    }
    for (;;) {
        updatearenaomnvardata(arena);
        if (self.health <= 0) {
            return;
        }
        waittill_any_7("damage", "force_regeneration", "removeAdrenaline", "healed", "naturalHealthRegen", "vampirism", "spawned_player");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1307b
// Size: 0x7a
function function_b2307e71d93b96e7() {
    var_77398c562251db39 = "";
    if (level.var_43307855f189eb31.name == "gulag_twotwo") {
        if (function_5e0e3a24dbb1fae1()) {
            var_77398c562251db39 = "gulag_enter_delta";
        } else if (function_eb4bce9b222e36ac() || level.mapname == "mp_jup_br_mechanics") {
            var_77398c562251db39 = "jup_wz_gulag_enter";
        } else {
            var_77398c562251db39 = "gulag_enter";
        }
    } else {
        var_77398c562251db39 = "mp_donetsk_gulag_intro";
    }
    return var_77398c562251db39;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130fd
// Size: 0x71
function playerpreloadintrocinematic(var_df728022f7b5d8ac) {
    if (level.gulag.introcinematic && !isbot(self)) {
        if (isdefined(var_df728022f7b5d8ac)) {
            self preloadcinematicforplayer(var_df728022f7b5d8ac);
        } else {
            var_77398c562251db39 = function_b2307e71d93b96e7();
            self preloadcinematicforplayer(var_77398c562251db39);
        }
    }
    /#
        while (getdvarint(@"hash_678f7d0a98bd62ab", 0) == 1) {
            waitframe();
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13175
// Size: 0xd4
function playerplayintrocinematic() {
    if (level.gulag.introcinematic && !isbot(self)) {
        self setclientomnvar("ui_br_bink_overlay_state", 1);
        br_gulag_intro = function_17ee301cf0b5ba85("br_gulag_intro");
        self setplayermusicstate(br_gulag_intro);
        if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
            self setsoundsubmix("iw8_br_gulag_tutorial", 0.5);
        } else {
            self setsoundsubmix("solo_cin_igc_music", 0.5);
        }
        if (level.gulag.var_86f0de18e07f0b7f) {
            self function_786fee88b4749dff(0);
        } else {
            var_77398c562251db39 = function_b2307e71d93b96e7();
            self playcinematicforplayer(var_77398c562251db39);
        }
        self.playinggulagbink = 1;
        level notify("update_circle_hide");
    } else {
        gulagloadingtext();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13250
// Size: 0x94
function function_ca008cc22b07ba4e() {
    if (level.gulag.var_3fdedda393e951f9 && !isbot(self)) {
        if (level.var_43307855f189eb31.name == "gulag_twotwo") {
            self setclientomnvar("ui_br_bink_overlay_state", 10);
            br_gulag_outro = function_17ee301cf0b5ba85("br_gulag_outro");
            self setplayermusicstate(br_gulag_outro);
            self setsoundsubmix("solo_cin_igc_music", 0.5);
            self playcinematicforplayer("gulag_exit");
            playerwaittillcinematiccomplete(gettime());
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132eb
// Size: 0x11
function playershowskippromptcinematic() {
    self setclientomnvar("ui_br_bink_overlay_state", 2);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13303
// Size: 0x96
function playerwaittillcinematiccomplete(starttime) {
    if (istrue(level.gulag.introcinematic) && !isbot(self) && !self isplayerheadless()) {
        _freezecontrols(1, undefined, "gulagCinematic");
        var_fdef1592ffda3a4a = _playerwaittillcinematiccompleteinternal(starttime);
        if (!isdefined(var_fdef1592ffda3a4a)) {
            var_fdef1592ffda3a4a = 1;
        }
        _freezecontrols(0, 0, "gulagCinematic");
        self setclientomnvar("ui_br_bink_overlay_state", 5);
        self stopcinematicforplayer(var_fdef1592ffda3a4a);
        self.playinggulagbink = undefined;
        namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133a0
// Size: 0x56
function _playerwaittillcinematiccompleteinternal(starttime) {
    self endon("bink_complete");
    while (gettime() - starttime < level.gulag.var_d373eba3425dcc77) {
        if (self crouchbuttonpressed() || self usebuttonpressed() || self jumpbuttonpressed()) {
            return 1;
        }
        waitframe();
    }
    return 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133fe
// Size: 0x26
function playercinematiccompletecallback(channel, val) {
    if (channel == "bink_complete") {
        self notify("bink_complete");
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1342b
// Size: 0x188
function setupcellspawn(arena, var_8ff292386a0993f5) {
    if (!level.gulag.usecellspawns) {
        return;
    }
    if (!isdefined(var_8ff292386a0993f5.target)) {
        level.gulag.usecellspawns = 0;
        return;
    }
    doors = getentarray(var_8ff292386a0993f5.target, "targetname");
    if (doors.size > 1) {
        level.gulag.usecellspawns = 0;
        return;
    }
    var_8ff292386a0993f5.door = getent(var_8ff292386a0993f5.target, "targetname");
    if (isdefined(var_8ff292386a0993f5.door)) {
        var_8ff292386a0993f5.door.closed = 1;
        clip = getent(var_8ff292386a0993f5.door.target, "targetname");
        clip delete();
        var_5db7e7538d068035 = anglestoforward(var_8ff292386a0993f5.door.angles);
        var_8ff292386a0993f5.door.closepos = var_8ff292386a0993f5.door.origin;
        var_8ff292386a0993f5.door.openpos = var_8ff292386a0993f5.door.origin + var_5db7e7538d068035 * 60;
    }
    return var_8ff292386a0993f5;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135bb
// Size: 0xf4
function function_8cd7d5a73921bd93(waittime) {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    if (getdvarint(@"hash_9ae23fa804cbfdd7", 0) == 0) {
        return;
    }
    if (!isdefined(waittime)) {
        waittime = 0;
    }
    wait(waittime);
    if (isdefined(player)) {
        if (isdefined(player.name)) {
            playername = player.name;
        } else {
            playername = "";
        }
        if (isdefined(player.gulagarena)) {
            var_54b9737d53438793 = player.gulagarena;
        } else {
            var_54b9737d53438793 = "";
        }
        if (isdefined(player.gulag)) {
            var_39b32cc7f5d22bcc = player.gulag;
        } else {
            var_39b32cc7f5d22bcc = "";
        }
        logstring("[gulag_getPlayerStateWait] Player " + playername + " has .gulagArena : " + var_54b9737d53438793 + " and .gulag : " + var_39b32cc7f5d22bcc);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136b6
// Size: 0x31
function usecellspawns(arena) {
    return level.gulag.usecellspawns && arena.cellspawns.size > 0;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136ef
// Size: 0x4e
function function_c797c1f0977d41d1(name, func) {
    if (!isdefined(level.var_3b627d8f1e31c880)) {
        level.var_3b627d8f1e31c880 = [];
    }
    /#
        assert(!isdefined(level.var_3b627d8f1e31c880[name]));
    #/
    level.var_3b627d8f1e31c880[name] = func;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13744
// Size: 0x48
function function_d4b0eef0a0924094(name, args) {
    if (!isdefined(level.var_3b627d8f1e31c880)) {
        return 0;
    }
    func = level.var_3b627d8f1e31c880[name];
    if (!isdefined(func)) {
        return 0;
    }
    return function_f9bad90f93aa6cc5(func, args);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13794
// Size: 0x3a
function function_175e22055ae274a3(name) {
    if (!isdefined(level.var_3b627d8f1e31c880)) {
        return 0;
    }
    func = level.var_3b627d8f1e31c880[name];
    if (!isdefined(func)) {
        return 0;
    }
    return 1;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137d6
// Size: 0x6d
function function_ed608478232fdeb2(name, func) {
    if (!isdefined(level.var_c201dcd7429584bc)) {
        level.var_c201dcd7429584bc = [];
    }
    if (!isdefined(level.var_c201dcd7429584bc[name])) {
        level.var_c201dcd7429584bc[name] = [];
    }
    count = level.var_c201dcd7429584bc[name].size;
    level.var_c201dcd7429584bc[name][count] = func;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1384a
// Size: 0x75
function function_c724f178c2df7240(name, args) {
    funcs = function_b55d1a467d39cd3(name);
    foreach (func in funcs) {
        thread function_f9bad90f93aa6cc5(func, args);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138c6
// Size: 0xda
function function_f9bad90f93aa6cc5(func, args, var_5f77deffb7fb41ed) {
    if (!isdefined(args)) {
        args = [];
    }
    if (!isarray(args)) {
        args = [0:args];
    }
    /#
        assert(args.size <= 4);
    #/
    /#
        time = gettime();
    #/
    if (args.size == 4) {
        return [[ func ]](args[0], args[1], args[2], args[3]);
    } else if (args.size == 3) {
        return [[ func ]](args[0], args[1], args[2]);
    } else if (args.size == 2) {
        return [[ func ]](args[0], args[1]);
    } else if (args.size == 1) {
        return [[ func ]](args[0]);
    } else if (args.size == 0) {
        return [[ func ]]();
    }
    /#
        /#
            assert(!var_5f77deffb7fb41ed || time == gettime());
        #/
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139a7
// Size: 0xab
function function_43acb991ce957f46(name, args) {
    funcs = function_b55d1a467d39cd3(name);
    results = [];
    foreach (func in funcs) {
        result = function_f9bad90f93aa6cc5(func, args, 1);
        if (isarray(result)) {
            results = array_combine(results, result);
        } else {
            results[results.size] = result;
        }
    }
    return results;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a5a
// Size: 0x1e
function function_ea01c1e7a2cff70d(name, args) {
    return function_36f536ef06da0ce3(name, args, 1);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a80
// Size: 0x1d
function function_4dce98c81d58a751(name, args) {
    return function_36f536ef06da0ce3(name, args, 0);
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13aa5
// Size: 0x94
function function_36f536ef06da0ce3(name, args, var_3899386f6822b979) {
    funcs = function_b55d1a467d39cd3(name);
    foreach (func in funcs) {
        result = function_f9bad90f93aa6cc5(func, args, 1);
        if (result == var_3899386f6822b979) {
            return var_3899386f6822b979;
        }
    }
    return !var_3899386f6822b979;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b41
// Size: 0x39
function function_b55d1a467d39cd3(name) {
    if (!isdefined(level.var_c201dcd7429584bc)) {
        return [];
    }
    funcs = level.var_c201dcd7429584bc[name];
    if (!isdefined(funcs)) {
        return [];
    }
    return funcs;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b82
// Size: 0x160
function function_728a4949ace743bd() {
    if (!getdvarint(@"hash_4a4190cc7599dc5f", 0)) {
        return;
    }
    level.br_debugsolotest = 1;
    level.gulag.maxuses = -1;
    level.var_3ff7c73209fcf59d = 0;
    level.br_infils_disabled = 1;
    level.prematchperiodend = 0;
    level.br_circle_disabled = 1;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagset("br_ready_to_jump");
    wait(2);
    while (1) {
        foreach (player in level.players) {
            if (!istrue(player.br_infilstarted)) {
                continue;
            }
            if (!isdefined(player.spawntime) || gettime() - player.spawntime <= 100) {
                continue;
            }
            if (istrue(player.var_b66f9ef48a944881)) {
                continue;
            }
            if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                continue;
            }
            if (player namespace_d3d40f75bb4e4c32::iseligibleforteamrevive()) {
                level thread function_45170abc166b9d37(player);
            } else if (isalive(player)) {
                player namespace_a12dc1d0c8a64946::_suicide(0);
                wait(0.5);
                break;
            }
        }
        waitframe();
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ce9
// Size: 0x64
function function_45170abc166b9d37(player) {
    player.var_b66f9ef48a944881 = 1;
    player.gulagloser = 0;
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("kioskRevivePlayer")) {
        player namespace_71073fa38f11492::runbrgametypefunc("kioskRevivePlayer", player, 0);
    } else {
        player namespace_47fd1e79a44628cd::playergulagautowin("kioskRevivePlayer", player, 0);
    }
    wait(1);
    player.var_b66f9ef48a944881 = undefined;
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d54
// Size: 0x76
function function_2e096d17b6286e29(player, var_228a5de8e2cd330, var_90e74e77d08d5afc) {
    /#
        if (getdvarint(@"hash_9144df4be848d0b7", 1)) {
            logstring("<unknown string>" + function_53c4c53197386572(player.name, "<unknown string>") + "<unknown string>" + player.clientid + "<unknown string>" + var_228a5de8e2cd330 + "<unknown string>" + var_90e74e77d08d5afc);
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13dd1
// Size: 0x82
function function_94eb48dd1cd7f972(player, reason, entering) {
    if (getdvarint(@"hash_62b35c4bae3c1f16", 0)) {
        logstring("[GULAG DEBUG] : Jailed player " + ter_op(entering, "entering", "exitting") + " - player: " + function_53c4c53197386572(player.name, "") + ", id: " + player.clientid + ", reason: " + reason);
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e5a
// Size: 0x190
function function_bfff708b15cd22d0() {
    if (!getdvarint(@"hash_7aad3ab9fa557f5a", 0)) {
        return;
    }
    level notify("validate_gulag_shutdown");
    level endon("validate_gulag_shutdown");
    level endon("game_ended");
    while (1) {
        wait(1);
        var_ce22c32e1c0d1ae3 = 1;
        foreach (arena in level.gulag.arenas) {
            if (!istrue(arena.fightover) || !istrue(arena.shutdown)) {
                var_ce22c32e1c0d1ae3 = 0;
            }
        }
        if (var_ce22c32e1c0d1ae3) {
            break;
        }
    }
    wait(10);
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            var_cd5428d556223258 = -1;
            if (isdefined(player.arena)) {
                var_cd5428d556223258 = array_find(level.gulag.arenas, arena);
            }
            namespace_9c840bb9f2ecbf00::demoforcesre("Player " + function_53c4c53197386572(player.name, "???") + " in gulag after shutdown. Arena index " + var_cd5428d556223258);
        }
    }
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ff1
// Size: 0x339
function function_e6c82ddc6a58c02f(args) {
    /#
        if (args.size == 0) {
            return;
        }
        command = args[0];
        if (command == "<unknown string>") {
            function_e6bd56ae6d7e0e84();
            return;
        }
        if (!istrue(level.usegulag)) {
            return;
        }
        if (command == "<unknown string>") {
            debugwarptojail();
        } else if (command == "<unknown string>") {
            debugwarptojailsingle();
        } else if (command == "<unknown string>") {
            debugresetguns();
        } else if (command == "<unknown string>") {
            debugfakeduel();
        } else if (command == "<unknown string>") {
            debugfakewinner();
        } else if (command == "<unknown string>") {
            debugshutdown();
        } else if (command == "<unknown string>") {
            function_389315f9f33826c3();
            setdevdvar(@"hash_57dfa3352864c15b", 0);
        } else if (command == "<unknown string>") {
            foreach (arena in level.gulag.arenas) {
                updateplayeromnvarsallmatches(arena);
            }
            setdevdvar(@"hash_2f29e85b9ff6eddc", 0);
        } else if (command == "<unknown string>") {
            thread function_e15c373c57d02f90(args);
        } else if (command == "<unknown string>") {
            thread function_9d6440635bf1f49(args);
        } else if (command == "<unknown string>") {
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            host setclientomnvar("<unknown string>", 1);
            host playcinematicforplayer("<unknown string>");
            setdvar(@"hash_da200314926d462c", 0);
        } else if (command == "<unknown string>") {
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            host setclientomnvar("<unknown string>", 0);
            host stopcinematicforplayer();
            setdvar(@"hash_76bb2f96ffd637c8", 0);
        } else if (command == "<unknown string>") {
            level.gulag.maxuses = 1;
            foreach (player in level.players) {
                player.gulaguses = 1;
                if (player namespace_d3d40f75bb4e4c32::function_15da77dc195bd80a() && !player namespace_d3d40f75bb4e4c32::function_8b2396647673be50()) {
                    player namespace_cb965d2f71fefddc::function_17e127f2e3771058();
                }
                player function_dd93503cf95b6277();
            }
        } else if (command == "<unknown string>") {
            level.gulag.maxuses = 1;
            foreach (player in level.players) {
                player.gulaguses = 0;
                player function_dd93503cf95b6277();
            }
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14331
// Size: 0x270
function function_70deb58a1637a9d(var_c74a7dd2a424671c) {
    /#
        function_8641137c3dcf6c96();
        if (var_c74a7dd2a424671c >= level.gulag.arenas.size) {
            return;
        }
        arena = level.gulag.arenas[var_c74a7dd2a424671c];
        var_7bb30e94033bc91d = level.gulag.var_7bb30e94033bc91d;
        if (!istrue(arena.isjailbreak)) {
            var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d setdevtext("<unknown string>" + var_c74a7dd2a424671c + "<unknown string>");
        } else {
            var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d setdevtext("<unknown string>" + var_c74a7dd2a424671c + "<unknown string>");
        }
        if (!istrue(arena.isjailbreak)) {
            if (arena.arenaplayers.size > 0) {
                var_7bb30e94033bc91d.currentstring.alpha = 1;
                for (playerindex = 0; playerindex < var_7bb30e94033bc91d.var_df1a8324a4e896ea.size; playerindex++) {
                    if (isdefined(arena.arenaplayers[playerindex])) {
                        var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex] setplayernamestring(arena.arenaplayers[playerindex]);
                        var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex].alpha = 1;
                    }
                }
            }
        } else {
            var_7bb30e94033bc91d.currentstring.alpha = 1;
        }
        for (var_b94827c01cb82f1e = 0; var_b94827c01cb82f1e < var_7bb30e94033bc91d.matches.size; var_b94827c01cb82f1e++) {
            match = var_7bb30e94033bc91d.matches[var_b94827c01cb82f1e];
            if (var_b94827c01cb82f1e < arena.matches.size) {
                match.debugstring.alpha = 1;
                for (playerindex = 0; playerindex < match.var_df1a8324a4e896ea.size; playerindex++) {
                    if (playerindex < arena.matches[var_b94827c01cb82f1e].size) {
                        match.var_df1a8324a4e896ea[playerindex] setplayernamestring(arena.matches[var_b94827c01cb82f1e][playerindex]);
                        match.var_df1a8324a4e896ea[playerindex].alpha = 1;
                        if (istrue(arena.isjailbreak)) {
                            match.debugstring.alpha = 0;
                        }
                    }
                }
            }
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x145a8
// Size: 0x3af
function function_b9192ebe3ccbd06e() {
    /#
        var_896781a8a9b653bf = 8;
        var_a384829c3b11db56 = 170;
        var_ecdabfb8180b91b5 = 40;
        var_a7d9b923f6845a7a = 15;
        var_a6fe8f42e76395c = 0.75;
        var_a07826a263e0c062 = 0;
        level.gulag.var_7bb30e94033bc91d = spawnstruct();
        var_7bb30e94033bc91d = level.gulag.var_7bb30e94033bc91d;
        var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d = createserverfontstring("<unknown string>", var_a6fe8f42e76395c);
        var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d namespace_52f6938dd902c7d0::setpoint("<unknown string>", "<unknown string>", var_a384829c3b11db56, var_ecdabfb8180b91b5 + var_a07826a263e0c062 * var_a7d9b923f6845a7a);
        var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d setdevtext("<unknown string>");
        var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d.color = (1, 1, 0);
        var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d.alpha = 1;
        var_a07826a263e0c062++;
        var_7bb30e94033bc91d.currentstring = createserverfontstring("<unknown string>", var_a6fe8f42e76395c);
        var_7bb30e94033bc91d.currentstring namespace_52f6938dd902c7d0::setpoint("<unknown string>", "<unknown string>", var_a384829c3b11db56, var_ecdabfb8180b91b5 + var_a07826a263e0c062 * var_a7d9b923f6845a7a);
        var_7bb30e94033bc91d.currentstring setdevtext("<unknown string>");
        var_7bb30e94033bc91d.currentstring.color = (0, 1, 0);
        var_7bb30e94033bc91d.currentstring.alpha = 1;
        var_a07826a263e0c062++;
        var_7bb30e94033bc91d.var_df1a8324a4e896ea = [];
        for (playerindex = 0; playerindex < 2; playerindex++) {
            var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex] = createserverfontstring("<unknown string>", var_a6fe8f42e76395c);
            var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex] namespace_52f6938dd902c7d0::setpoint("<unknown string>", "<unknown string>", var_a384829c3b11db56, var_ecdabfb8180b91b5 + var_a07826a263e0c062 * var_a7d9b923f6845a7a);
            var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex] setdevtext("<unknown string>" + playerindex);
            var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex].alpha = 1;
            var_a07826a263e0c062++;
        }
        var_7bb30e94033bc91d.matches = [];
        for (var_b94827c01cb82f1e = 0; var_b94827c01cb82f1e < var_896781a8a9b653bf; var_b94827c01cb82f1e++) {
            var_7bb30e94033bc91d.matches[var_b94827c01cb82f1e] = spawnstruct();
            match = var_7bb30e94033bc91d.matches[var_b94827c01cb82f1e];
            match.debugstring = createserverfontstring("<unknown string>", var_a6fe8f42e76395c);
            match.debugstring namespace_52f6938dd902c7d0::setpoint("<unknown string>", "<unknown string>", var_a384829c3b11db56, var_ecdabfb8180b91b5 + var_a07826a263e0c062 * var_a7d9b923f6845a7a);
            match.debugstring setdevtext("<unknown string>" + var_b94827c01cb82f1e + 1);
            match.debugstring.color = (0, 1, 0);
            match.debugstring.alpha = 1;
            var_a07826a263e0c062++;
            match.var_df1a8324a4e896ea = [];
            for (playerindex = 0; playerindex < 2; playerindex++) {
                match.var_df1a8324a4e896ea[playerindex] = createserverfontstring("<unknown string>", var_a6fe8f42e76395c);
                match.var_df1a8324a4e896ea[playerindex] namespace_52f6938dd902c7d0::setpoint("<unknown string>", "<unknown string>", var_a384829c3b11db56, var_ecdabfb8180b91b5 + var_a07826a263e0c062 * var_a7d9b923f6845a7a);
                match.var_df1a8324a4e896ea[playerindex].alpha = 1;
                var_a07826a263e0c062++;
            }
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1495e
// Size: 0x108
function function_a2580c32e5169826() {
    /#
        var_7bb30e94033bc91d = level.gulag.var_7bb30e94033bc91d;
        var_7bb30e94033bc91d.var_f5d6ee8a9c2fd93d destroy();
        var_7bb30e94033bc91d.currentstring destroy();
        for (playerindex = 0; playerindex < var_7bb30e94033bc91d.var_df1a8324a4e896ea.size; playerindex++) {
            var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex] destroy();
        }
        for (var_b94827c01cb82f1e = 0; var_b94827c01cb82f1e < var_7bb30e94033bc91d.matches.size; var_b94827c01cb82f1e++) {
            match = var_7bb30e94033bc91d.matches[var_b94827c01cb82f1e];
            match.debugstring destroy();
            for (playerindex = 0; playerindex < match.var_df1a8324a4e896ea.size; playerindex++) {
                match.var_df1a8324a4e896ea[playerindex] destroy();
            }
        }
        level.gulag.var_7bb30e94033bc91d = undefined;
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a6d
// Size: 0xfc
function function_8641137c3dcf6c96() {
    /#
        var_7bb30e94033bc91d = level.gulag.var_7bb30e94033bc91d;
        var_7bb30e94033bc91d.currentstring.alpha = 0;
        for (playerindex = 0; playerindex < var_7bb30e94033bc91d.var_df1a8324a4e896ea.size; playerindex++) {
            var_7bb30e94033bc91d.var_df1a8324a4e896ea[playerindex].alpha = 0;
        }
        for (var_b94827c01cb82f1e = 0; var_b94827c01cb82f1e < var_7bb30e94033bc91d.matches.size; var_b94827c01cb82f1e++) {
            match = var_7bb30e94033bc91d.matches[var_b94827c01cb82f1e];
            match.debugstring.alpha = 0;
            for (playerindex = 0; playerindex < match.var_df1a8324a4e896ea.size; playerindex++) {
                match.var_df1a8324a4e896ea[playerindex].alpha = 0;
            }
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14b70
// Size: 0xf6
function createserverfontstring(font, fontscale) {
    /#
        fontelem = newhudelem();
        fontelem.elemtype = "<unknown string>";
        fontelem.font = font;
        fontelem.fontscale = fontscale;
        fontelem.basefontscale = fontscale;
        fontelem.x = 0;
        fontelem.y = 0;
        fontelem.width = 0;
        fontelem.height = int(level.fontheight * fontscale);
        fontelem.xoffset = 0;
        fontelem.yoffset = 0;
        fontelem.children = [];
        fontelem namespace_52f6938dd902c7d0::setparent(level.uiparent);
        fontelem.hidden = 0;
        fontelem.archived = 0;
        return fontelem;
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c6d
// Size: 0x65
function function_389315f9f33826c3() {
    /#
        foreach (player in level.players) {
            player namespace_1a507865f681850e::giveequipment("<unknown string>", "<unknown string>");
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14cd9
// Size: 0x95
function debugfakewinner() {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        if (isdefined(host)) {
            if (!isdefined(host.arena)) {
                if (function_1980065ce4dc067b()) {
                    arena = host namespace_ad49798629176e96::function_d095c23873d8efed();
                } else {
                    arena = host playergetnextarena();
                }
                host.arena = arena;
            }
            if (isalive(host) && !host namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                host thread namespace_47fd1e79a44628cd::playerpulloutofgulagwin(host, "<unknown string>");
            } else {
                host thread namespace_b5b2280a66414fff::vip_respawnplayer(host, host, "<unknown string>");
            }
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d75
// Size: 0x7d
function function_e6bd56ae6d7e0e84() {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        if (isdefined(host) && !isalive(host)) {
            teammates = level.teamdata[host.team]["<unknown string>"];
            if (teammates.size > 0) {
                teammate = teammates[0];
                teammate namespace_cb965d2f71fefddc::addrespawntoken(1);
                host playergulagautowin("<unknown string>", teammate, 1, 1);
            }
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14df9
// Size: 0x14d
function debugfakeduel() {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        if (isdefined(host)) {
            host setplayervargulagjail(0);
            enemy = getbot(host, 1);
            if (isdefined(enemy)) {
                enemy setplayervargulagjail(0);
                host thread initplayerjail();
                enemy thread initplayerjail();
                return;
            }
        }
        players = [];
        counter = 0;
        foreach (entry in level.teamnamelist) {
            foreach (var_736d8d9188ccbd45 in getteamdata(entry, "<unknown string>")) {
                players[counter] = var_736d8d9188ccbd45;
                var_736d8d9188ccbd45 setplayervargulagjail(0);
                counter++;
                break;
            }
            if (counter == 2) {
                break;
            }
        }
        players[0] thread initplayerjail();
        players[1] thread initplayerjail();
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14f4d
// Size: 0xc7
function getbot(host, var_d35f07e55bff5855) {
    /#
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (isbot(player) || istestclient(player)) {
                if (!istrue(var_d35f07e55bff5855) && player.team == host.team || istrue(var_d35f07e55bff5855) && player.team != host.team) {
                    return player;
                }
            }
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1501b
// Size: 0x65
function debugresetguns() {
    /#
        foreach (arena in level.gulag.arenas) {
            resetequipment(arena);
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15087
// Size: 0x1c
function debugshutdown(type) {
    /#
        shutdowngulag("<unknown string>", 0);
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x150aa
// Size: 0xee
function debugwarptojail(single) {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        foreach (player in level.players) {
            if (isdefined(host) && player == host) {
                continue;
            }
            if (istrue(player.jailed) || istrue(player.gulagarena)) {
                continue;
            }
            if (isreallyalive(player)) {
                player initplayerjail();
                if (istrue(single)) {
                    return;
                }
            }
        }
        if (isdefined(host) && isreallyalive(host) && !istrue(host.jailed) && !istrue(host.gulagarena)) {
            host initplayerjail();
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1519f
// Size: 0xbb
function debugwarptojailsingle() {
    /#
        host = namespace_d576b6dc7cef9c62::gethostplayer();
        if (!isdefined(host)) {
            debugwarptojail(1);
            return;
        }
        start = host geteye();
        dir = anglestoforward(host getplayerangles());
        end = start + 8000 * dir;
        trace = namespace_2a184fc4902783dc::_bullet_trace(start, end, 1, host);
        if (isdefined(trace["<unknown string>"]) && isplayer(trace["<unknown string>"]) && isreallyalive(trace["<unknown string>"])) {
            player = trace["<unknown string>"];
            player initplayerjail();
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15261
// Size: 0xaa
function function_e15c373c57d02f90(args) {
    /#
        if (args.size < 2) {
            return;
        }
        level.gulag.var_8e8b9f52b43a60b1 = int(args[1]);
        if (level.gulag.var_8e8b9f52b43a60b1 > -1 && !istrue(level.gulag.var_e15c373c57d02f90)) {
            function_9d6440635bf1f49(args);
        } else if (level.gulag.var_8e8b9f52b43a60b1 == -1 && istrue(level.gulag.var_e15c373c57d02f90)) {
            function_9d6440635bf1f49(args);
        }
    #/
}

// Namespace br_gulag/namespace_47fd1e79a44628cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15312
// Size: 0x48d
function function_9d6440635bf1f49(args) {
    /#
        if (!isdefined(level.gulag.arenas)) {
            return;
        }
        if (!istrue(level.gulag.var_e15c373c57d02f90)) {
            level.gulag.var_e15c373c57d02f90 = 1;
        } else {
            level notify("<unknown string>");
            level.gulag.var_e15c373c57d02f90 = undefined;
            return;
        }
        level endon("<unknown string>");
        while (1) {
            foreach (var_cd5428d556223258, arena in level.gulag.arenas) {
                foreach (index, player in arena.arenaplayers) {
                    print3d(player.origin + (0, 0, 50), "<unknown string>" + index, (0, 1, 0));
                }
                foreach (index, player in arena.jailedplayers) {
                    print3d(player.origin + (0, 0, 50), "<unknown string>" + index);
                }
                print3d(arena.center, "<unknown string>" + var_cd5428d556223258, (1, 1, 0), 1, 2);
            }
            if (isdefined(level.gulag.var_8e8b9f52b43a60b1) && level.gulag.var_8e8b9f52b43a60b1 > -1) {
                if (!isdefined(level.gulag.var_7bb30e94033bc91d)) {
                    function_b9192ebe3ccbd06e();
                } else {
                    function_70deb58a1637a9d(level.gulag.var_8e8b9f52b43a60b1);
                }
            } else if (isdefined(level.gulag.var_7bb30e94033bc91d)) {
                function_a2580c32e5169826();
            }
            finish = getdvarvector(@"hash_fc389672a33645f", (0, -1, -1));
            var_3dac8d0323f0eccf = int(finish[0]);
            if (var_3dac8d0323f0eccf < level.gulag.arenas.size) {
                arena = level.gulag.arenas[var_3dac8d0323f0eccf];
                if (finish[1] > -1 && finish[2] > -1 && finish[1] < arena.arenaplayers.size && finish[2] < arena.arenaplayers.size) {
                    winner = arena.arenaplayers[int(finish[1])];
                    loser = arena.arenaplayers[int(finish[2])];
                    loser dodamage(loser.health, winner.origin, winner, winner);
                    setdvar(@"hash_fc389672a33645f", (0, -1, -1));
                }
            }
            finish = getdvarvector(@"hash_6d211b3196fa7e4b", (0, -1, -1));
            var_3dac8d0323f0eccf = int(finish[0]);
            if (var_3dac8d0323f0eccf < level.gulag.arenas.size) {
                arena = level.gulag.arenas[var_3dac8d0323f0eccf];
                if (finish[1] > -1 && finish[2] > -1 && finish[1] < arena.arenaplayers.size && finish[2] < arena.arenaplayers.size) {
                    winner = arena.arenaplayers[int(finish[1])];
                    loser = arena.arenaplayers[int(finish[2])];
                    winner setorigin(arena.center);
                    setdvar(@"hash_6d211b3196fa7e4b", (0, -1, -1));
                }
            }
            waitframe();
        }
    #/
}

