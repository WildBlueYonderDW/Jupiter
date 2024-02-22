// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_77c18cdedec620b3;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_2583ee5680cf4736;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_6981400abfcd765c;
#using script_32d93a194074fa6a;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_752486b4ea44c4b0;

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x8de
// Size: 0x14
function autoexec main() {
    namespace_882ad5502d1eedd6::function_dbc8f6cb3760cd82("roguesignal", &init);
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x458
function init(config) {
    if (!getdvarint(@"hash_89b60b73bfd9d3d0", 1)) {
        return;
    }
    var_bd00ebb44a0208e0 = spawnstruct();
    var_bd00ebb44a0208e0.validatefunc = &function_ff2f2144ced4051a;
    var_bd00ebb44a0208e0.waitfunc = &function_259becae806189d;
    var_bd00ebb44a0208e0.activatefunc = &function_dce158cd5558c35d;
    var_bd00ebb44a0208e0.var_c9e871d29702e8cf = &function_de40a46baab733f5;
    var_bd00ebb44a0208e0.var_f4fd1f55ec89ded = &function_862bce27f6c70842;
    var_bd00ebb44a0208e0.weight = config.weight;
    var_bd00ebb44a0208e0.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_bd00ebb44a0208e0.var_f0f6529c88a18128 = namespace_882ad5502d1eedd6::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_bd00ebb44a0208e0.var_b9b56551e1acfee2 = namespace_b354cc7ab3b869b0::function_8be9bae8228a91f7("roguesignal");
    namespace_882ad5502d1eedd6::function_5b7d8ca93f8705f1(var_bd00ebb44a0208e0, "roguesignal");
    namespace_882ad5502d1eedd6::registerpublicevent(20, var_bd00ebb44a0208e0);
    if (!isdefined(level.var_7576c890644a91ad)) {
        level.var_7576c890644a91ad = spawnstruct();
    }
    level.var_7576c890644a91ad.var_bd2a65d466a95e9a = 0;
    level.var_7576c890644a91ad.scoreboard = [];
    level.var_7576c890644a91ad.var_ac3cb3756c750e63 = int(getdvarint(@"hash_e21294ff91f57b89", 90) * getmatchrulesdata("brData", "circleTimeScale"));
    level.var_7576c890644a91ad.var_82819a1606fddcc0 = [0:1, 1:2, 2:3, 3:4, 4:5];
    level.var_7576c890644a91ad.var_94e8107617e1a3e3 = getdvarint(@"hash_c6da18effb6c4994", 0);
    level.var_7576c890644a91ad.var_7d124e61bf50e2c = getdvar(@"hash_861d51c9341fe8f9", "");
    if (level.var_7576c890644a91ad.var_7d124e61bf50e2c.size > 0) {
        types = strtok(level.var_7576c890644a91ad.var_7d124e61bf50e2c, " ");
        foreach (type in types) {
            level.var_7576c890644a91ad.var_82819a1606fddcc0 = function_da1cac199ebc3dbe(level.var_7576c890644a91ad.var_82819a1606fddcc0, int(type));
        }
    }
    if (namespace_36f464722d326bbe::function_eb4bce9b222e36ac()) {
        level.var_7576c890644a91ad.caches = getunusedlootcachepoints((0, 0, 0), 150000, 0, 1);
    } else {
        level.var_7576c890644a91ad.caches = utility::getstructarray("br_pe_roguesignal_caches", "script_noteworthy");
    }
    level.var_7576c890644a91ad.var_c4d0d7d42beedd07 = getdvar(@"hash_876e11a369398181", "br_loot_cache_roguesignal");
    level.var_7576c890644a91ad.var_2009d74909f46277 = getdvarint(@"hash_f88e4c4cbda6bc29", 30);
    level.var_7576c890644a91ad.var_dd1f19ff96690a99 = getdvarint(@"hash_f32e42c626fbdc2b", 1);
    level.var_7576c890644a91ad.var_920fe5b859fcf7ac = getdvarint(@"hash_50a6b11ae660d67a", 125);
    level.var_7576c890644a91ad.var_61cded027799ebae = getdvarint(@"hash_ff3f8dd3d8aa4cec", 0);
    level.var_7576c890644a91ad.var_8f9bc56ff0d7be6e = getdvarfloat(@"hash_7aaccb68b2e12714", 4.5);
    level.var_7576c890644a91ad.var_6b034b3f45f2eaa5 = getdvarint(@"hash_6c52f2d632e0f977", 1) == 1;
    if (!isdefined(level.var_91104c01620d26b0)) {
        level.var_91104c01620d26b0 = [];
    }
    level.var_91104c01620d26b0 = utility::array_add(level.var_91104c01620d26b0, &function_1e66b4ffb3e558c);
    function_c8d923b42a22fbcd();
    /#
        function_8b1a7bcc86e73c2e();
    #/
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd58
// Size: 0x77
function function_de40a46baab733f5() {
    foreach (cache in level.var_7576c890644a91ad.caches) {
        cache.var_527a7b84d978e792 = namespace_553788426d0f4133::function_60951b84c58915ab(cache.origin);
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd6
// Size: 0x5
function function_ff2f2144ced4051a() {
    return 1;
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde3
// Size: 0x3
function function_259becae806189d() {
    
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xded
// Size: 0x16b
function function_dce158cd5558c35d() {
    event = utility::function_7a2aaa4a09a4d250(level.var_7576c890644a91ad.var_82819a1606fddcc0);
    if (isdefined(level.var_7576c890644a91ad.var_94e8107617e1a3e3) && level.var_7576c890644a91ad.var_94e8107617e1a3e3 > 0) {
        event = level.var_7576c890644a91ad.var_94e8107617e1a3e3;
    }
    dialog = undefined;
    switch (event) {
    case 1:
        dialog = "rogue_signal_" + "event_type_cash";
        break;
    case 3:
        dialog = "rogue_signal_" + "event_type_damage";
        break;
    case 2:
        dialog = "rogue_signal_" + "event_type_kills";
        break;
    case 4:
        dialog = "rogue_signal_" + "event_type_caches";
        break;
    case 5:
        dialog = "rogue_signal_" + "event_type_powerups";
        break;
    }
    if (isdefined(dialog)) {
        namespace_a548bd428a566cf3::brleaderdialog(dialog, 1, undefined, undefined, level.var_7576c890644a91ad.var_8f9bc56ff0d7be6e, undefined, "dx_br_smis_");
    }
    namespace_a548bd428a566cf3::brleaderdialog("rogue_signal_" + "event_starting", 1, undefined, undefined, 0.5, undefined, "dx_br_smis_");
    function_a8beffa3938460d1(event);
    level thread namespace_882ad5502d1eedd6::function_2907d01a7d692108(20);
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5f
// Size: 0x42d
function function_a8beffa3938460d1(eventtype) {
    level endon("event_deactivated");
    level endon("game_ended");
    var_2f442216bf3e05d7 = (isdefined(level.br_circle.circleindex) ? 0 : level.br_circle.circleindex) + 1;
    var_adad42d080519e95 = [];
    foreach (cache in level.var_7576c890644a91ad.caches) {
        if (cache.var_527a7b84d978e792[1].circleindex >= var_2f442216bf3e05d7) {
            var_adad42d080519e95 = utility::array_add(var_adad42d080519e95, cache);
        }
    }
    level.var_7576c890644a91ad.var_adad42d080519e95 = var_adad42d080519e95;
    event_ref = "";
    switch (eventtype) {
    case 1:
        event_ref = "plunder";
        level callback::add("plunder_pickup", &function_1db6f2da4e798b82);
        break;
    case 3:
        event_ref = "damage";
        level callback::add("player_damaged", &on_player_damaged);
        break;
    case 2:
        event_ref = "kills";
        level callback::add("player_death", &on_player_killed);
        break;
    case 4:
        event_ref = "loot";
        level callback::add("cache_opened", &function_82dd024933a0589b);
        break;
    case 5:
        event_ref = "powerups";
        level callback::add(#"hash_1ec8b300d7a86b43", &function_2d1d43c029c51bbf);
        break;
    }
    level callback::add("on_squad_eliminated", &on_squad_eliminated);
    if (istrue(level.usegulag)) {
        level callback::add(#"hash_c15c682d6a5dcae0", &function_6f8fb9835eea1e2e);
        level callback::add(#"hash_2bdabaeb3b833ac", &function_fb0c55ff9c9c67db);
    }
    level.var_7576c890644a91ad.scoreboard = [];
    level.var_7576c890644a91ad.var_bd2a65d466a95e9a = eventtype;
    foreach (team in level.teamnamelist) {
        if (teams::getteamcount(team) == 0) {
            continue;
        }
        function_6a2c3bf56d02b683(team, 0);
    }
    function_f6f98d0b64ac42b4();
    setomnvarforallclients("ui_br_roguesignal_active", eventtype);
    namespace_882ad5502d1eedd6::showsplashtoall("br_pe_roguesignal_start_" + event_ref, "splash_list_br_pe_roguesignal");
    timer = gettime() + level.var_7576c890644a91ad.var_ac3cb3756c750e63 * 1000;
    setomnvar("ui_minimap_pulse", 1);
    setomnvar("ui_publicevent_timer_type", 14);
    setomnvar("ui_publicevent_timer", timer);
    if (eventtype == 3 || eventtype == 1) {
        level thread function_2535e8d31a4bf0c();
    }
    if (namespace_493bf119b3b0c251::function_94b952789d039abb()) {
        foreach (player in level.players) {
            if (isalive(player)) {
                player thread function_c99398c8710ba4f0(eventtype);
            }
        }
    }
    level thread function_651abe7893b1347f();
    var_cc3bfedbc8003590 = 5;
    wait(level.var_7576c890644a91ad.var_ac3cb3756c750e63 - var_cc3bfedbc8003590);
    clockobject = utility::spawn_script_origin();
    level.var_7576c890644a91ad.clock = clockobject;
    while (var_cc3bfedbc8003590 > 0) {
        clockobject playsound("ui_mp_fire_sale_timer");
        wait(1);
        var_cc3bfedbc8003590--;
    }
    clockobject delete();
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1393
// Size: 0xa
function function_862bce27f6c70842() {
    function_c32ed6d14f08bd09();
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a4
// Size: 0x473
function function_c32ed6d14f08bd09() {
    level notify("disable_scoreboard_update");
    switch (level.var_7576c890644a91ad.var_bd2a65d466a95e9a) {
    case 1:
        level callback::remove("plunder_pickup", &function_1db6f2da4e798b82);
        break;
    case 3:
        level callback::remove("player_damaged", &on_player_damaged);
        break;
    case 2:
        level callback::remove("player_death", &on_player_killed);
        break;
    case 4:
        level callback::remove("cache_opened", &function_82dd024933a0589b);
        break;
    case 5:
        level callback::remove(#"hash_1ec8b300d7a86b43", &function_2d1d43c029c51bbf);
        break;
    }
    level callback::remove("on_squad_eliminated", &on_squad_eliminated);
    level.var_7576c890644a91ad.var_bd2a65d466a95e9a = 0;
    level.var_7576c890644a91ad.scoreboard = array_sort_with_func(level.var_7576c890644a91ad.scoreboard, &function_b5d9e47ad1993406);
    winners = [];
    for (i = 0; i < level.var_7576c890644a91ad.scoreboard.size; i++) {
        if (!isdefined(level.var_7576c890644a91ad.scoreboard[i]) || !isdefined(level.var_7576c890644a91ad.scoreboard[i].teamid) || level.var_7576c890644a91ad.scoreboard[i].score <= 0) {
            continue;
        }
        winners = utility::array_add(winners, level.var_7576c890644a91ad.scoreboard[i].teamid);
        if (winners.size == 3) {
            break;
        }
    }
    foreach (index, team in winners) {
        dialog = index == 0 ? "event_completion_top_squad" : "event_completion_top_three";
        namespace_a548bd428a566cf3::brleaderdialogteam("rogue_signal_" + dialog, team, 1, 0.5, undefined, "dx_br_smis_");
    }
    if (winners.size > 0) {
        level function_b78eb63b1da9329f(winners, 1, 1);
    }
    foreach (player in level.players) {
        iswinner = utility::array_contains(winners, player.team);
        if (!iswinner && !level.var_7576c890644a91ad.var_6b034b3f45f2eaa5) {
            continue;
        }
        splashname = iswinner ? "br_pe_roguesignal_success" : "br_pe_roguesignal_fail";
        player hud_message::showsplash(splashname, undefined, undefined, undefined, undefined, "splash_list_br_pe_roguesignal");
    }
    foreach (idx, team in winners) {
        foreach (player in teams::getteamdata(team, "players")) {
            player points::doscoreevent(#"br_pe_roguesignal_success");
            player br_plunder::playerplunderpickup(level.var_7576c890644a91ad.var_920fe5b859fcf7ac * (3 - idx), undefined, undefined, 1);
        }
    }
    setomnvarforallclients("ui_br_roguesignal_active", 0);
    setomnvar("ui_minimap_pulse", 0);
    setomnvar("ui_publicevent_timer_type", 0);
    function_ba9ba8eb661af8f1();
    /#
        if (isdefined(level.var_7576c890644a91ad.clock)) {
            level.var_7576c890644a91ad.clock delete();
        }
    #/
    level notify("event_deactivated");
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181e
// Size: 0x2bf
function function_b78eb63b1da9329f(var_5f15b2da08f90a39, is_locked, var_adad42d080519e95) {
    if (!isdefined(is_locked)) {
        is_locked = 0;
    }
    if (!isdefined(var_adad42d080519e95)) {
        var_adad42d080519e95 = 1;
    }
    caches = var_adad42d080519e95 ? level.var_7576c890644a91ad.var_adad42d080519e95 : level.var_7576c890644a91ad.caches;
    location = utility::function_7a2aaa4a09a4d250(caches);
    if (var_adad42d080519e95) {
        location.inuse = 1;
        level.var_7576c890644a91ad.var_adad42d080519e95 = utility::array_remove(caches, location);
    } else {
        level.var_7576c890644a91ad.caches = utility::array_remove(caches, location);
    }
    cache = spawnscriptable(level.var_7576c890644a91ad.var_c4d0d7d42beedd07, location.origin, location.angles);
    if (is_locked && level.var_7576c890644a91ad.var_2009d74909f46277 > 0) {
        cache.is_unlocked = 0;
        cache thread function_23812764e79c036e(var_5f15b2da08f90a39, level.var_7576c890644a91ad.var_2009d74909f46277, 5);
    } else {
        cache setscriptablepartstate("body", "closed_usable");
        cache.is_unlocked = 1;
    }
    cache.var_534e0cf170a981b7 = &function_724769eeddf32c63;
    cache.var_5f15b2da08f90a39 = var_5f15b2da08f90a39;
    cache.var_e757352d31655db9 = level.var_7576c890644a91ad.var_dd1f19ff96690a99;
    cache.var_ee75ebf2a3dc9eb0 = 1;
    cache.spawn_time = gettime();
    if (level.var_7576c890644a91ad.var_61cded027799ebae) {
        cache game_utility::function_6b6b6273f8180522("RogueSignal_Br", cache.origin, 512);
        foreach (team in var_5f15b2da08f90a39) {
            foreach (player in teams::getteamdata(team, "players")) {
                cache game_utility::function_cfd53c8f6878014f(player);
            }
        }
    }
    level.var_7576c890644a91ad.cache = cache;
    return cache;
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae5
// Size: 0x12f
function function_3aa223d058a74fdc(var_5f15b2da08f90a39, progress) {
    objid = namespace_6c8a837ec98fe0b8::requestobjectiveid(99);
    self.objidnum = objid;
    namespace_6c8a837ec98fe0b8::objective_add_objective(objid, "current", self.origin + (0, 0, 64), "hud_icon_objective_roguesignal", "icon_regular");
    namespace_6c8a837ec98fe0b8::function_d7e3c4a08682c1b9(objid, 0);
    namespace_6c8a837ec98fe0b8::objective_set_play_intro(objid, 1);
    namespace_6c8a837ec98fe0b8::update_objective_setbackground(objid, 1);
    namespace_6c8a837ec98fe0b8::function_2946e9eb07acb3f1(objid, "MP_BR_INGAME/LOOT_CACHE_ROGUESIGNAL");
    foreach (team in var_5f15b2da08f90a39) {
        foreach (player in teams::getteamdata(team, "players")) {
            namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(objid, player);
        }
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1b
// Size: 0x262
function function_23812764e79c036e(var_5f15b2da08f90a39, time, buffer) {
    if (!isdefined(buffer)) {
        buffer = level.framedurationseconds;
    }
    level endon("game_ended");
    interact = interaction::function_90472496b91b94b3(self.origin + (0, 0, 24), 64, &function_a077537746482e54);
    interact.cache = self;
    interact function_dfb78b3e724ad620(1);
    interact interaction::function_e6c63f16f2258b80(&function_43cb953ab1404232);
    function_3aa223d058a74fdc(var_5f15b2da08f90a39, 1);
    wait(buffer);
    foreach (team in var_5f15b2da08f90a39) {
        foreach (player in teams::getteamdata(team, "alivePlayers")) {
            if (player namespace_a548bd428a566cf3::isplayerinorgoingtogulag()) {
                continue;
            }
            player namespace_a655003e419fc731::calloutmarkerping_createcallout(11, self.origin, self.objidnum);
            break;
        }
    }
    namespace_6c8a837ec98fe0b8::objective_set_progress(self.objidnum, 0);
    namespace_6c8a837ec98fe0b8::objective_show_progress(self.objidnum, 1);
    current_time = gettime();
    start_time = current_time;
    end_time = start_time + utility::function_a5b14435e3229bed(time);
    var_2c7edecb5d6f59be = 0;
    playsoundatpos(self.origin, "dx_br_smis_rspe_rfcv_rsln");
    while (var_2c7edecb5d6f59be < 1) {
        elapsed_time = (gettime() - start_time) / 1000;
        var_2c7edecb5d6f59be = clamp(elapsed_time / time, 0, 1);
        self.var_2c7edecb5d6f59be = var_2c7edecb5d6f59be;
        if (isdefined(self.objidnum)) {
            namespace_6c8a837ec98fe0b8::objective_set_progress(self.objidnum, var_2c7edecb5d6f59be);
        }
        wait(0.1);
    }
    if (isdefined(self.objidnum)) {
        namespace_6c8a837ec98fe0b8::objective_show_progress(self.objidnum, 0);
    }
    interact delete();
    function_9c876f98fad72467();
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e84
// Size: 0xdf
function function_43cb953ab1404232(interact, player) {
    cache = interact.cache;
    if (!istrue(cache.is_unlocked)) {
        var_83b819b30f1965f0 = int(ceil(level.var_7576c890644a91ad.var_2009d74909f46277 * (1 - (isdefined(cache.var_2c7edecb5d6f59be) ? 0 : cache.var_2c7edecb5d6f59be))));
        if (var_83b819b30f1965f0 > 0) {
            return {params:[0:"MP_BR_INGAME/LOOT_CACHE_ROGUESIGNAL", 1:var_83b819b30f1965f0], string:"MP_BR_INGAME/CACHE_UNLOCKED_IN_X", type:"HINT_BUTTON"};
        }
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6b
// Size: 0x47
function function_9c876f98fad72467() {
    playsoundatpos(self.origin, "br_loot_cache_chest_recharge_beep_full");
    playsoundatpos(self.origin, "dx_br_smis_rspe_rfcv_rscu");
    self.is_unlocked = 1;
    self setscriptablepartstate("body", "closed_usable");
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb9
// Size: 0xa1
function function_1e66b4ffb3e558c(items, instance) {
    if (istrue(instance.var_ee75ebf2a3dc9eb0)) {
        if (utility::issharedfuncdefined("roguesignal", "cache_reward")) {
            items = instance utility::function_f3bb4f4911a1beb2("roguesignal", "cache_reward", items);
            /#
                assertex(isarray(items) && items.size > 0, "br_publicevent_roguesignal::reward_cache_adjust_items" + " didn't return an array of items from the reward func!");
            #/
        } else {
            var_9a924e440ad63299 = "jup_pi_raygun_mp";
            var_c99699f3230335f = [0:namespace_45ecbe78f599af72::function_eeaa22f0cd1ff845(var_9a924e440ad63299)];
            items = utility::array_combine(items, var_c99699f3230335f);
        }
    }
    return items;
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2062
// Size: 0x167
function function_724769eeddf32c63(instance, player) {
    if (!instance.var_e757352d31655db9 && !utility::array_contains(instance.var_5f15b2da08f90a39, player.team)) {
        playsoundatpos(instance.origin, "dx_br_smis_rspe_rfcv_rsct");
        player hud_message::showerrormessage("MP_BR_INGAME/UNAUTHORIZED_ACCESS");
        return 0;
    }
    if (!istrue(instance.is_unlocked)) {
        playsoundatpos(instance.origin, "dx_br_smis_rspe_rfcv_rsct");
        player hud_message::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    if (level.var_7576c890644a91ad.var_61cded027799ebae) {
        instance game_utility::function_af5604ce591768e1();
    }
    namespace_6c8a837ec98fe0b8::returnobjectiveid(instance.objidnum);
    if (istrue(level.usegulag)) {
        level callback::remove(#"hash_c15c682d6a5dcae0", &function_6f8fb9835eea1e2e);
        level callback::remove(#"hash_2bdabaeb3b833ac", &function_fb0c55ff9c9c67db);
    }
    instance function_75033550b2c672be("opened", player);
    var_9a6c1b85896a116e = {opened_by_winner:function_fc64178f71375137(instance.var_5f15b2da08f90a39, player.team), time_since_spawn_ms:gettime() - instance.spawn_time};
    level thread function_6e0d478e2fb36607(var_9a6c1b85896a116e);
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d0
// Size: 0x81
function function_a077537746482e54(player) {
    if (isdefined(self.var_7435ab99d1de8eee) && self.var_7435ab99d1de8eee > gettime()) {
        return;
    }
    self.var_7435ab99d1de8eee = gettime() + 3000;
    player hud_message::showerrormessage("MP_BR_INGAME/UNAUTHORIZED_ACCESS");
    if (isdefined(self.var_2c7edecb5d6f59be) && self.var_2c7edecb5d6f59be >= 0.85) {
        return;
    }
    playsoundatpos(self.origin, "dx_br_smis_rspe_rfcv_rsct");
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2258
// Size: 0x2a
function function_2535e8d31a4bf0c() {
    level endon("event_deactivated");
    level endon("disable_scoreboard_update");
    level endon("game_ended");
    while (1) {
        wait(2);
        function_f6f98d0b64ac42b4();
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2289
// Size: 0x2b1
function function_f6f98d0b64ac42b4() {
    level.var_7576c890644a91ad.scoreboard = array_sort_with_func(level.var_7576c890644a91ad.scoreboard, &function_b5d9e47ad1993406);
    for (i = 0; i < level.var_7576c890644a91ad.scoreboard.size; i++) {
        foreach (player in teams::getteamdata(level.var_7576c890644a91ad.scoreboard[i].teamid, "players")) {
            player setclientomnvar("ui_br_roguesignal_progress", level.var_7576c890644a91ad.scoreboard[i].score);
            player setclientomnvar("ui_br_roguesignal_position", i);
            if (level.var_7576c890644a91ad.scoreboard.size == 1) {
                continue;
            } else if (level.var_7576c890644a91ad.scoreboard.size == 2) {
                player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[ter_op(i == 0, 1, 0)].score);
                continue;
            }
            if (i == 0) {
                player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[1].score);
                player setclientomnvar("ui_br_roguesignal_progress_enemy2", level.var_7576c890644a91ad.scoreboard[2].score);
            } else if (i == level.var_7576c890644a91ad.scoreboard.size - 1) {
                player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[i - 2].score);
                player setclientomnvar("ui_br_roguesignal_progress_enemy2", level.var_7576c890644a91ad.scoreboard[i - 1].score);
            } else {
                player setclientomnvar("ui_br_roguesignal_progress_enemy1", level.var_7576c890644a91ad.scoreboard[i - 1].score);
                player setclientomnvar("ui_br_roguesignal_progress_enemy2", level.var_7576c890644a91ad.scoreboard[i + 1].score);
            }
        }
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2541
// Size: 0x2b
function function_b5d9e47ad1993406(var_472d4f042b732e8a, var_cb730d03142c3f30) {
    return var_472d4f042b732e8a.score >= var_cb730d03142c3f30.score;
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2574
// Size: 0x49
function function_1db6f2da4e798b82(params) {
    amount = (isdefined(params.amount) ? 0 : params.amount) * 10;
    function_6a2c3bf56d02b683(self.team, amount);
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c4
// Size: 0x3b
function on_player_killed(var_642470e1abc1bbf9) {
    if (function_2536f6802979033b(var_642470e1abc1bbf9)) {
        function_6a2c3bf56d02b683(var_642470e1abc1bbf9.attacker.team, 1);
        function_f6f98d0b64ac42b4();
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2606
// Size: 0xa8
function on_player_damaged(damagedata) {
    if (function_2536f6802979033b(damagedata)) {
        total_damage = damagedata.idamage + damagedata.var_1da1a66b5c6a06a7;
        if (isdefined(damagedata.smeansofdeath) && damagedata.smeansofdeath == "MOD_EXECUTION") {
            victim = damagedata.victim;
            total_damage = victim.var_8790c077c95db752 + victim.maxhealth;
        }
        function_6a2c3bf56d02b683(damagedata.eattacker.team, total_damage);
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b5
// Size: 0xc6
function function_82dd024933a0589b(var_3b1ed2ab5fee3e31) {
    score = 1;
    switch (var_3b1ed2ab5fee3e31.instance.type) {
    case #"hash_417c605750c7baa5":
        score = 1;
        break;
    case #"hash_4ca1dc2e1b0de0d3":
        score = 2;
        break;
    case #"hash_19ba8d41970911ad":
        score = 3;
        break;
    default:
        /#
            iprintln("ui_br_roguesignal_active" + var_3b1ed2ab5fee3e31.instance.type);
        #/
        break;
    }
    function_6a2c3bf56d02b683(var_3b1ed2ab5fee3e31.player.team, score);
    function_f6f98d0b64ac42b4();
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2782
// Size: 0x31
function function_2d1d43c029c51bbf(params) {
    function_6a2c3bf56d02b683(params.player.team, 1);
    function_f6f98d0b64ac42b4();
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27ba
// Size: 0x39
function on_squad_eliminated(params) {
    function_6a2c3bf56d02b683(params.team, function_d4475734232b2734(params.team) * -1);
    function_f6f98d0b64ac42b4();
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27fa
// Size: 0x89
function function_6f8fb9835eea1e2e(params) {
    if (!isdefined(level.var_7576c890644a91ad.cache)) {
        return;
    }
    player = params.player;
    cache = level.var_7576c890644a91ad.cache;
    if (function_fc64178f71375137(cache.var_5f15b2da08f90a39, player.team)) {
        namespace_6c8a837ec98fe0b8::objective_playermask_hidefrom(cache.objidnum, player);
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288a
// Size: 0x89
function function_fb0c55ff9c9c67db(params) {
    if (!isdefined(level.var_7576c890644a91ad.cache)) {
        return;
    }
    player = params.player;
    cache = level.var_7576c890644a91ad.cache;
    if (function_fc64178f71375137(cache.var_5f15b2da08f90a39, player.team)) {
        namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(cache.objidnum, player);
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291a
// Size: 0xe9
function function_6a2c3bf56d02b683(teamid, delta) {
    foreach (entry in level.var_7576c890644a91ad.scoreboard) {
        if (entry.teamid == teamid) {
            entry.score = entry.score + delta;
            return;
        }
    }
    var_cf1f1b7139851b78 = spawnstruct();
    var_cf1f1b7139851b78.teamid = teamid;
    var_cf1f1b7139851b78.score = delta;
    level.var_7576c890644a91ad.scoreboard[level.var_7576c890644a91ad.scoreboard.size] = var_cf1f1b7139851b78;
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0a
// Size: 0x80
function function_d4475734232b2734(teamid) {
    foreach (entry in level.var_7576c890644a91ad.scoreboard) {
        if (entry.teamid == teamid) {
            return entry.score;
        }
    }
    return 0;
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a92
// Size: 0x25f
function function_2536f6802979033b(data) {
    attacker = undefined;
    if (isdefined(data.attacker)) {
        attacker = data.attacker;
    } else if (isdefined(data.eattacker)) {
        attacker = data.eattacker;
    }
    if (!isdefined(attacker) || !isdefined(data.victim)) {
        return 0;
    }
    victim = data.victim;
    if (attacker vehicle::isvehicle()) {
        driver = vehicle_occupancy::vehicle_occupancy_getdriver(attacker);
        if (isdefined(driver) && isplayer(driver)) {
            attacker = driver;
        } else if (isdefined(attacker.owners) && attacker.owners > 0) {
            owners = utility::array_removeundefined(attacker.owners);
            if (owners.size > 0) {
                attacker = owners[0];
            }
        }
        if (attacker vehicle::isvehicle()) {
            occupants = vehicle_occupancy::vehicle_occupancy_getalloccupants(attacker, 0);
            if (isdefined(occupants) && isarray(occupants) && occupants.size > 0) {
                attacker = occupants[getarraykeys(occupants)[0]];
            }
        }
        if (isdefined(data.attacker)) {
            data.attacker = attacker;
        } else if (isdefined(data.eattacker)) {
            data.eattacker = attacker;
        }
        if (level.var_7576c890644a91ad.var_bd2a65d466a95e9a == 3) {
            data.idamage = int(min(data.idamage, victim.maxhealth));
        }
    }
    if (level.var_7576c890644a91ad.var_bd2a65d466a95e9a == 3 && data.idamage + data.var_1da1a66b5c6a06a7 == 0) {
        return 0;
    }
    if (!isplayer(attacker) || !isplayer(victim)) {
        return 0;
    }
    if (attacker == victim) {
        return 0;
    }
    if (attacker.team == victim.team) {
        return 0;
    }
    if (level.var_7576c890644a91ad.var_bd2a65d466a95e9a == 3 && player::isinlaststand(victim) && !player::function_d7afe062ef51bd77(victim)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cf9
// Size: 0x100
function private function_c99398c8710ba4f0(index) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    switch (index) {
    case 1:
        var_e98d60032aa37ef6 = #"hash_7897bc53f469c480";
        break;
    case 3:
        var_e98d60032aa37ef6 = #"hash_41a7153e86ce40d7";
        break;
    case 2:
        var_e98d60032aa37ef6 = #"hash_8a2bd5204f22de87";
        break;
    case 4:
        var_e98d60032aa37ef6 = #"hash_64d8773f0e129724";
        break;
    case 5:
        var_e98d60032aa37ef6 = #"hash_22d6d30fd6e9cfd7";
        break;
    default:
        /#
            assertmsg("Unknown FTUE for event type: " + index);
        #/
        return;
    }
    namespace_d48f5ddc4356145f::function_9e0151baa208fe9e(var_e98d60032aa37ef6);
    wait(10);
    params = {duration:10};
    namespace_d48f5ddc4356145f::function_f339c5c73d11ea20(var_e98d60032aa37ef6, 1, params);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e00
// Size: 0x58
function function_6e0d478e2fb36607(params) {
    eventparams = [];
    eventparams[eventparams.size] = "time_since_spawn_ms";
    eventparams[eventparams.size] = params.time_since_spawn_ms;
    eventparams[eventparams.size] = "opened_by_winner";
    eventparams[eventparams.size] = params.opened_by_winner;
    dlog_recordevent("dlog_event_br_pe_rogue_signal_crate_opened", eventparams);
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5f
// Size: 0xb4
function function_ba9ba8eb661af8f1() {
    top_scores = [];
    for (i = 0; i < 5; i++) {
        if (isdefined(level.var_7576c890644a91ad.scoreboard[i])) {
            top_scores[top_scores.size] = level.var_7576c890644a91ad.scoreboard[i].score;
        } else {
            top_scores[top_scores.size] = 0;
        }
    }
    eventparams = [0:"event_type", 1:level.var_7576c890644a91ad.var_bd2a65d466a95e9a, 2:"top_scores", 3:top_scores];
    dlog_recordevent("dlog_event_br_pe_rogue_signal_complete", eventparams);
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1a
// Size: 0x18b
function function_c8d923b42a22fbcd() {
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["rogue_signal_" + "event_starting"] = "rspe_grav_rses";
    game["dialog"]["rogue_signal_" + "event_type_kills"] = "rspe_grav_rsek";
    game["dialog"]["rogue_signal_" + "event_type_damage"] = "rspe_grav_rsed";
    game["dialog"]["rogue_signal_" + "event_type_caches"] = "rspe_grav_rset";
    game["dialog"]["rogue_signal_" + "event_type_powerups"] = "rspe_grav_rsep";
    game["dialog"]["rogue_signal_" + "event_type_cash"] = "rspe_grav_rsec";
    game["dialog"]["rogue_signal_" + "event_completion_top_squad"] = "rspe_grav_sect";
    game["dialog"]["rogue_signal_" + "event_completion_top_three"] = "rspe_grav_resq";
    game["dialog"]["rogue_signal_" + "event_failure"] = "rspe_grav_rsef";
    game["dialog"]["rogue_signal_" + "timer_nag_lead"] = "rspe_grav_rstn";
    game["dialog"]["rogue_signal_" + "timer_nag_top"] = "rspe_grav_rstg";
    game["dialog"]["rogue_signal_" + "performance_nag"] = "rspe_grav_rspn";
    game["dialog"]["rogue_signal_" + "crate_claim_friendly"] = "rspe_grav_rscs";
    game["dialog"]["rogue_signal_" + "crate_claim_enemy"] = "rspe_grav_rsce";
    game["dialog"]["rogue_signal_" + "crate_claim_gas"] = "rspe_grav_rscg";
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ac
// Size: 0x113
function function_651abe7893b1347f() {
    level endon("event_deactivated");
    level endon("game_ended");
    if (level.var_7576c890644a91ad.var_ac3cb3756c750e63 > 45) {
        var_a6dcacd55a72c91 = level.var_7576c890644a91ad.var_ac3cb3756c750e63 - 45;
        wait(var_a6dcacd55a72c91);
        for (i = 0; i < level.var_7576c890644a91ad.scoreboard.size; i++) {
            entry = level.var_7576c890644a91ad.scoreboard[i];
            team = entry.teamid;
            score = entry.score;
            dialog = "performance_nag";
            if (i < 3 && score > 0) {
                dialog = i == 0 ? "timer_nag_lead" : "timer_nag_top";
            }
            namespace_a548bd428a566cf3::brleaderdialogteam("rogue_signal_" + dialog, team, 1, 0.5, undefined, "dx_br_smis_");
        }
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c6
// Size: 0x171
function function_75033550b2c672be(type, player) {
    if (isdefined(player) && type == "opened") {
        if (function_fc64178f71375137(self.var_5f15b2da08f90a39, player.team)) {
            namespace_a548bd428a566cf3::brleaderdialogteam("rogue_signal_" + "crate_claim_friendly", player.team, 1, 0.5, undefined, "dx_br_smis_");
        }
        var_bcf03641f8eb1299 = function_da1cac199ebc3dbe(self.var_5f15b2da08f90a39, player.team);
        foreach (team in var_bcf03641f8eb1299) {
            namespace_a548bd428a566cf3::brleaderdialogteam("rogue_signal_" + "crate_claim_enemy", team, 1, 0.5, undefined, "dx_br_smis_");
        }
    } else if (type == "gas") {
        foreach (team in self.var_5f15b2da08f90a39) {
            namespace_a548bd428a566cf3::brleaderdialogteam("rogue_signal_" + "crate_claim_gas", player.team, 1, 0.5, undefined, "dx_br_smis_");
        }
    }
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x333e
// Size: 0xf
function function_8b1a7bcc86e73c2e() {
    /#
        level thread setup_devgui();
    #/
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3354
// Size: 0x179
function setup_devgui() {
    /#
        devgui::function_6e7290c8ee4f558b("br_publicevent_roguesignal::reward_cache_adjust_items");
        devgui::function_b23a59dfb4ca49a1("rspe_grav_rstg", "<unknown string>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_cf63c7be326bd2b9);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ba6d67317370830a);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34d4
// Size: 0x36
function function_cf63c7be326bd2b9(params) {
    /#
        level.var_7576c890644a91ad.var_94e8107617e1a3e3 = int(params[0]);
        level thread namespace_882ad5502d1eedd6::function_e37ee072d95a7c98(20);
    #/
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3511
// Size: 0x290
function function_ba6d67317370830a(params) {
    /#
        player = level.player;
        switch (int(params[0])) {
        case 0:
            level thread namespace_882ad5502d1eedd6::function_2907d01a7d692108(20);
            break;
        case 1:
            function_52c67898af722766(player);
            break;
        case 2:
            tracestart = player geteye();
            forward = anglestoforward(player getplayerangles());
            traceend = tracestart + forward * 5000;
            traceresults = trace::ray_trace(tracestart, traceend, player);
            if (isdefined(traceresults["<unknown string>"]) && isplayer(traceresults["<unknown string>"]) && isbot(traceresults["<unknown string>"])) {
                player = traceresults["<unknown string>"];
                function_52c67898af722766(player);
            }
            break;
        case 3:
            function_6a2c3bf56d02b683(player.team, 100000);
            level thread namespace_882ad5502d1eedd6::function_2907d01a7d692108(20);
            break;
        case 4:
            function_6a2c3bf56d02b683("<unknown string>", 100000);
            level thread namespace_882ad5502d1eedd6::function_2907d01a7d692108(20);
            break;
        case 5:
            cache = function_b78eb63b1da9329f([0:player.team], 0, 0);
            player setorigin(cache.origin + (0, 0, 24));
            break;
        case 6:
            cache = function_b78eb63b1da9329f([0:"<unknown string>"], 1, 0);
            player setorigin(cache.origin + (0, 0, 24));
            break;
        case 7:
            level thread function_dfd27b3e2ea43440(level.var_7576c890644a91ad.var_adad42d080519e95);
            break;
        case 8:
            level thread function_dfd27b3e2ea43440(level.var_7576c890644a91ad.caches);
            break;
        case 9:
            player hud_message::showsplash("<unknown string>", undefined, undefined, undefined, undefined, "<unknown string>");
            break;
        case 10:
            player hud_message::showsplash("<unknown string>", undefined, undefined, undefined, undefined, "<unknown string>");
            break;
        }
    #/
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37a8
// Size: 0xc1
function function_52c67898af722766(player) {
    /#
        switch (level.var_7576c890644a91ad.var_bd2a65d466a95e9a) {
        case 1:
            function_6a2c3bf56d02b683(player.team, 750);
            function_f6f98d0b64ac42b4();
            break;
        case 3:
            function_6a2c3bf56d02b683(player.team, 150);
            function_f6f98d0b64ac42b4();
            break;
        case 2:
        case 4:
        case 5:
            function_6a2c3bf56d02b683(player.team, 1);
            function_f6f98d0b64ac42b4();
            break;
        }
    #/
}

// Namespace namespace_752486b4ea44c4b0/namespace_3022bf42f4c9f813
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3870
// Size: 0x10a
function function_dfd27b3e2ea43440(caches) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        if (!isdefined(caches)) {
            return;
        }
        foreach (cache in caches) {
            debug::debug_line(cache.origin, cache.origin + (0, 0, 4096), (0, 1, 1), 30, "<unknown string>", undefined, undefined);
            debug::debug_print3d(cache.origin + (0, 0, 4096), "<unknown string>" + cache.var_527a7b84d978e792[1].circleindex + 1, (1, 1, 1), 30, "<unknown string>", undefined, 1, 15);
        }
    #/
}

