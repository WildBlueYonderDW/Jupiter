// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_5bc60484d17fa95c;
#using script_3583ff375ab3a91e;
#using script_3aa8e63a56e3416;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_73327fec94c64d2d;

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3ad
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("jailbreak", &init);
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c8
// Size: 0xd9
function init(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.validatefunc = &validatefunc;
    var_7ec7671a1e0c788f.activatefunc = &activatefunc;
    var_7ec7671a1e0c788f.waitfunc = &waitfunc;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("jailbreak");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "jailbreak");
    namespace_d76af9f804655767::registerpublicevent(3, var_7ec7671a1e0c788f);
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0x75
function function_c9e871d29702e8cf() {
    game["dialog"]["public_events_jailbreak_incoming_active"] = "pblc_grav_jbwr";
    game["dialog"]["public_events_jailbreak_incoming_active_alt"] = "pblc_grav_jbwr";
    game["dialog"]["public_events_jailbreak_now_active"] = "pblc_grav_jbct";
    game["dialog"]["public_events_jailbreak_now_active_alt"] = "pblc_grav_jbct";
    game["dialog"]["public_events_jailbreak_now_gulag"] = "pblc_grav_jbgn";
    game["dialog"]["public_events_jailbreak_now_spectate"] = "pblc_grav_jbsn";
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x524
// Size: 0x35
function validatefunc() {
    var_21eb9ce44fff7e79 = !namespace_71073fa38f11492::isfeaturedisabled("oneLife");
    var_b5c6b5ad4d7c67dd = istrue(level.usegulag);
    return var_21eb9ce44fff7e79 || var_b5c6b5ad4d7c67dd;
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x561
// Size: 0x24
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    eventstarttime = calculateeventstarttime();
    wait(eventstarttime);
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0x148
function activatefunc() {
    level endon("game_ended");
    pauseallgulagfights(1);
    waitforgulagfightstocomplete();
    namespace_d76af9f804655767::showsplashtoall("br_pe_jailbreak_incoming");
    playjailbreakvo("incoming");
    eventduration = getdvarfloat(@"hash_9e78730ec3baa38c", 30);
    eventendtime = gettime() + eventduration * 1000;
    setomnvar("ui_publicevent_timer_type", 2);
    setomnvar("ui_publicevent_timer", eventendtime);
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    if (eventduration > 5) {
        wait(eventduration - 5);
        for (i = 0; i < 5; i++) {
            clockobject playsound("ui_mp_fire_sale_timer");
            wait(1);
        }
    }
    namespace_d76af9f804655767::showsplashtoall("br_pe_jailbreak_active");
    playjailbreakvo("now");
    setomnvar("ui_publicevent_timer_type", 0);
    clockobject delete();
    wait(1);
    playerlist = respawnplayers();
    level thread forcestopwaitforgulagtoempty();
    function_33eef80bb2ce6d41(playerlist);
    level notify("waitForGulagToEmptySuccess");
    pauseallgulagfights(0);
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6db
// Size: 0x70
function forcestopwaitforgulagtoempty() {
    if (!istrue(level.var_acd63ea948a70083)) {
        return;
    }
    level endon("game_ended");
    level endon("waitForGulagToEmptySuccess");
    waittime = 10;
    if (isdefined(level.gulag) && isdefined(level.gulag.var_1dc4b5e63b8d0243)) {
        waittime = level.gulag.var_1dc4b5e63b8d0243;
    }
    wait(waittime);
    level notify("forceStopWaitForGulagToEmpty");
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x752
// Size: 0x52
function calculateeventstarttime() {
    var_87940078241e4580 = getdvarfloat(@"hash_5ad075411172856e", 795);
    var_7af9598177dc2de = getdvarfloat(@"hash_5aad6741114c1eec", 1110);
    if (var_7af9598177dc2de > var_87940078241e4580) {
        return randomfloatrange(var_87940078241e4580, var_7af9598177dc2de);
    } else {
        return var_87940078241e4580;
    }
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ab
// Size: 0x14
function pauseallgulagfights(var_1fd0410e54d2ffd8) {
    namespace_47fd1e79a44628cd::pausegulag(var_1fd0410e54d2ffd8);
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c6
// Size: 0x25
function waitforgulagfightstocomplete() {
    level endon("game_ended");
    wait(1);
    while (1) {
        if (!namespace_47fd1e79a44628cd::areanygulagfightsactive()) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f2
// Size: 0x96
function function_33eef80bb2ce6d41(playerlist) {
    level endon("game_ended");
    level endon("forceStopWaitForGulagToEmpty");
    if (namespace_71073fa38f11492::isfeaturedisabled("gulag")) {
        return;
    }
    var_b2203c3c0f607d88 = 0;
    while (!var_b2203c3c0f607d88) {
        var_b2203c3c0f607d88 = 1;
        foreach (p in playerlist) {
            if (p namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                var_b2203c3c0f607d88 = 0;
                break;
            }
        }
        waitframe();
    }
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f
// Size: 0x192
function buildrespawnlist(var_827c53020f6f228f) {
    respawnplayers = [];
    var_ae6415479f782a1b = isdefined(level.gulag);
    foreach (entry in level.teamnamelist) {
        if (entry == "spectator" || entry == "codcaster") {
            continue;
        }
        var_6ba9b6124f692dfa = level.teamdata[entry]["aliveCount"] > 0;
        if (var_827c53020f6f228f) {
            var_6ba9b6124f692dfa = level.teamdata[entry]["teamCount"] > 0;
        }
        if (var_6ba9b6124f692dfa) {
            foreach (player in level.teamdata[entry]["players"]) {
                var_87fe48f5f9047e82 = var_ae6415479f782a1b && player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
                if (!isalive(player) && !var_87fe48f5f9047e82) {
                    respawnplayers[respawnplayers.size] = player;
                } else if (isalive(player) && var_87fe48f5f9047e82) {
                    respawnplayers[respawnplayers.size] = player;
                } else if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b() && !isalive(player) && var_87fe48f5f9047e82) {
                    respawnplayers[respawnplayers.size] = player;
                }
            }
        }
    }
    return respawnplayers;
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa29
// Size: 0x207
function respawnplayer() {
    var_1b7f5108008d55b6 = isalive(self) && isdefined(level.gulag) && !istrue(level.gulag.shutdown) && namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
    if (var_1b7f5108008d55b6) {
        thread namespace_47fd1e79a44628cd::jailbreakeventplayer();
    } else {
        thread namespace_47fd1e79a44628cd::playergulagautowin("jailbreak", undefined, undefined, 1, 1);
    }
    self notify("jailbreak_respawn");
    if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b()) {
        arena = namespace_ad49798629176e96::function_2f4344abdc200e43(self);
        if (!isdefined(arena)) {
            arena = namespace_ad49798629176e96::function_de20b194b1a37513(self);
        }
        if (isdefined(arena)) {
            if (array_contains(arena.arenaplayers, self)) {
                arena.arenaplayers = array_remove(arena.arenaplayers, self);
            } else if (array_contains(arena.jailedplayers, self)) {
                arena.jailedplayers = array_remove(arena.jailedplayers, self);
            }
            if (isdefined(arena.var_654c981854394718)) {
                if (array_contains(arena.var_654c981854394718, self)) {
                    arena.var_654c981854394718 = array_remove(arena.var_654c981854394718, self);
                }
            }
            namespace_47fd1e79a44628cd::playerdestroyhud(arena);
            namespace_47fd1e79a44628cd::updatematchqueuepositions(arena);
            if (namespace_6ea7652ec407cc80::function_6e3541fd8fab45bc()) {
                namespace_6ea7652ec407cc80::function_cc5468bb6e866411(arena);
            }
        }
    }
    if (!isbot(self) && namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        var_7c6183ce9e04512e = #"hash_774f005e1bf7d1d3";
        var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
        params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_14cdeb43c9c858c1"), 3:var_1b7f5108008d55b6];
        if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
            function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
        }
    }
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc37
// Size: 0x8e
function respawnplayers() {
    level endon("game_ended");
    var_827c53020f6f228f = getdvarint(@"hash_c622900a5fa1e2c6", 1);
    playerlist = buildrespawnlist(var_827c53020f6f228f);
    foreach (player in playerlist) {
        if (!isdefined(player)) {
            continue;
        }
        player thread respawnplayer();
    }
    return playerlist;
}

// Namespace namespace_73327fec94c64d2d/namespace_8692d0e5f65b0f6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccd
// Size: 0x264
function playjailbreakvo(aliasname) {
    activeplayers = [];
    gulagplayers = [];
    var_5624bf9a85ce0294 = [];
    var_a11643fdeedee81b = isdefined(level.gulag) && !istrue(level.gulag.shutdown);
    var_827c53020f6f228f = getdvarint(@"hash_c622900a5fa1e2c6", 1);
    foreach (entry in level.teamnamelist) {
        var_6ba9b6124f692dfa = level.teamdata[entry]["aliveCount"] > 0;
        if (var_827c53020f6f228f) {
            var_6ba9b6124f692dfa = level.teamdata[entry]["teamCount"] > 0;
        }
        if (var_6ba9b6124f692dfa) {
            foreach (player in level.teamdata[entry]["players"]) {
                var_87fe48f5f9047e82 = var_a11643fdeedee81b && player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
                if (!isalive(player) && !var_87fe48f5f9047e82) {
                    var_5624bf9a85ce0294[var_5624bf9a85ce0294.size] = player;
                } else if (isalive(player) && var_87fe48f5f9047e82) {
                    gulagplayers[gulagplayers.size] = player;
                } else if (isalive(player)) {
                    activeplayers[activeplayers.size] = player;
                }
            }
        }
    }
    if (activeplayers.size > 0) {
        var_45e1df88d472eff6 = ter_op(cointoss(), "_active", "_active_alt");
        namespace_d3d40f75bb4e4c32::brleaderdialog("public_events_jailbreak_" + aliasname + var_45e1df88d472eff6, 0, activeplayers, 1, 1);
    }
    if (gulagplayers.size > 0) {
        var_35c7a746aa1c8e9e = "_gulag";
        namespace_d3d40f75bb4e4c32::brleaderdialog("public_events_jailbreak_" + aliasname + var_35c7a746aa1c8e9e, 0, gulagplayers, 1, 1);
    }
    if (var_5624bf9a85ce0294.size > 0) {
        var_d3dc73c3aafd6303 = "_spectate";
        namespace_d3d40f75bb4e4c32::brleaderdialog("public_events_jailbreak_" + aliasname + var_d3dc73c3aafd6303, 0, var_5624bf9a85ce0294, 1, 1);
    }
}

