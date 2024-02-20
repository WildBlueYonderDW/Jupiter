// mwiii decomp prototype
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_killstreaks.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\engine\trace.gsc;

#namespace br_alt_mode_inflation;

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa
// Size: 0x18f
function init() {
    if (!getdvarint(@"hash_9d10ec32552bd102", 0)) {
        return;
    }
    level.br_alt_mode_inflation = spawnstruct();
    level.br_alt_mode_inflation.disabled = 0;
    level.br_alt_mode_inflation.cost = getdvarint(@"hash_ec3657bee62b649e", 45);
    level.br_alt_mode_inflation.drop_percent = getdvarfloat(@"hash_4d6e3b73a7976700", 1);
    level.br_alt_mode_inflation.drop_max = getdvarint(@"hash_7fd93ee5262c8a9b", -1);
    level.br_alt_mode_inflation.respawn_delay = getdvarfloat(@"hash_82a04f5b65ed7d09", 10);
    namespace_71073fa38f11492::registerbrgametypefunc("playerDropPlunderOnDeath", &playerdropplunderondeath);
    namespace_71073fa38f11492::registerbrgametypefunc("circleTimer", &circletimer);
    namespace_71073fa38f11492::registerbrgametypefunc("postPlunder", &postplunder);
    namespace_71073fa38f11492::registerbrgametypefunc("markPlayerAsEliminatedOnKilled", &markplayeraseliminatedonkilled);
    namespace_71073fa38f11492::registerbrgametypefunc("playerGulagAutoWinWait", &playergulagautowinwait);
    namespace_71073fa38f11492::registerbrgametypefunc("triggerRespawnOverlay", &triggerrespawnoverlay);
    namespace_71073fa38f11492::registerbrgametypefunc("assignSpectatorToSpectatePlayer", &assignspectatortospectateplayer);
    if (!getdvarint(@"hash_83fc1574c6a65efd", 0)) {
        namespace_71073fa38f11492::disablefeature("gulag");
    }
    namespace_71073fa38f11492::disablefeature("useTokenToReviveTeammate");
    namespace_71073fa38f11492::disablefeature("gulagWinnerRestoreLoadoutUseGulag");
    thread initcallbacks();
    /#
        thread function_fbfcdb4534b7b0d8();
    #/
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440
// Size: 0x20
function initcallbacks() {
    while (!isdefined(level.onplayerspawncallbacks)) {
        waitframe();
    }
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x467
// Size: 0xa
function onplayerspawned() {
    updaterespawnstatus();
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x478
// Size: 0x53
function playercanbuyrespawn() {
    return istrue(level.br_prematchstarted) && !istrue(self.br_iseliminated) && !level.br_alt_mode_inflation.disabled && self.plundercount >= level.br_alt_mode_inflation.cost;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3
// Size: 0xe6
function playerdropplunderondeath(dropstruct, attacker) {
    if (!isdefined(self)) {
        return;
    }
    var_43e1b640eec49671 = self.plundercount;
    if (istrue(self.respawningfromtoken)) {
        var_43e1b640eec49671 = var_43e1b640eec49671 - level.br_alt_mode_inflation.cost;
        if (var_43e1b640eec49671 < 0) {
            var_43e1b640eec49671 = 0;
        }
    }
    if (!isdefined(var_43e1b640eec49671) || var_43e1b640eec49671 < 0) {
        var_43e1b640eec49671 = 0;
    }
    var_b64f283113c99581 = int(var_43e1b640eec49671 * level.br_alt_mode_inflation.drop_percent);
    var_43e1b640eec49671 = var_43e1b640eec49671 - var_b64f283113c99581;
    namespace_c6ccccd95254983f::playersetplundercount(var_43e1b640eec49671, getsetplundercountdatanosplash());
    if (level.br_alt_mode_inflation.drop_max >= 0) {
        var_b64f283113c99581 = int(min(level.br_alt_mode_inflation.drop_max, var_b64f283113c99581));
    }
    namespace_c6ccccd95254983f::dropcondensedplunder(var_b64f283113c99581, dropstruct);
    return 1;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c1
// Size: 0xd4
function circletimer(circleindex) {
    if (!circleindex) {
        namespace_47fd1e79a44628cd::setupgulagtimer();
    }
    var_6b3fe6b83b1c6b9e = namespace_47fd1e79a44628cd::getgulagclosedcircleindex();
    if (!level.br_alt_mode_inflation.disabled && circleindex >= var_6b3fe6b83b1c6b9e) {
        level.br_alt_mode_inflation.disabled = 1;
        foreach (player in level.players) {
            if (!isdefined(player) || !isalive(player)) {
                continue;
            }
            player updaterespawnstatus();
            namespace_7015c4c971547a66::dangernotifyplayer(player, "cash_deploy_closed", 3);
        }
    }
    return 0;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69d
// Size: 0x32
function postplunder(data) {
    skipsplash = 0;
    if (isdefined(data)) {
        skipsplash = data.skipsplash;
    }
    updaterespawnstatus(skipsplash);
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d6
// Size: 0x5e
function updaterespawnstatus(skipsplash) {
    if (playercanbuyrespawn()) {
        if (!namespace_d3d40f75bb4e4c32::hasrespawntoken()) {
            namespace_cb965d2f71fefddc::addrespawntoken(1);
            if (!istrue(skipsplash)) {
                thread namespace_44abc05161e2e2cb::showsplash("br_inflation_respawn_token_pickup");
            }
        }
    } else if (namespace_d3d40f75bb4e4c32::hasrespawntoken()) {
        namespace_cb965d2f71fefddc::removerespawntoken();
        if (!istrue(skipsplash)) {
            thread namespace_44abc05161e2e2cb::showsplash("br_inflation_respawn_token_lost");
        }
    }
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b
// Size: 0x3b
function showrespawntimer(timer) {
    waittillframeend();
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("waiting_to_spawn", int(gettime() + timer * 1000));
    namespace_47fd1e79a44628cd::setplayeringulagjailextrainfo(1);
    thread hiderespawntimer(timer);
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d
// Size: 0x2e
function hiderespawntimer(waittime) {
    self endon("disconnect");
    if (isdefined(waittime)) {
        wait(waittime);
    }
    namespace_47fd1e79a44628cd::setplayeringulagjailextrainfo(0);
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b2
// Size: 0x22
function getsetplundercountdatanosplash() {
    data = spawnstruct();
    data.skipsplash = 1;
    return data;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc
// Size: 0x4
function markplayeraseliminatedonkilled() {
    return 0;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e8
// Size: 0x5c
function playergulagautowinwait(var_4ac881e2a39322a5, var_57d71760971f748f) {
    if (!isdefined(var_4ac881e2a39322a5)) {
        if (level.br_alt_mode_inflation.respawn_delay) {
            respawndelay = level.br_alt_mode_inflation.respawn_delay;
            thread showrespawntimer(respawndelay);
            wait(respawndelay);
            return 1;
        }
    }
    return 0;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c
// Size: 0xe
function triggerrespawnoverlay(var_8d90bd1972a435bf) {
    return 1;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x862
// Size: 0x9a
function assignspectatortospectateplayer(spectator, playertospectate) {
    spectator notify("assignSpectatorToSpectatePlayerWaitForTeam");
    if (istrue(level.brspawnplayersending)) {
        return 0;
    }
    if (!isdefined(playertospectate) || !isplayer(playertospectate) || !isalive(playertospectate) && !isdefined(playertospectate.streampoint)) {
        return 0;
    }
    if (spectator.team == playertospectate.team) {
        return 0;
    }
    if (!namespace_54d20dd0dd79277f::getteamdata(spectator.team, "aliveCount")) {
        return 0;
    }
    thread assignspectatortospectatetryagain(spectator);
    return 1;
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x904
// Size: 0x5d
function assignspectatortospectatetryagain(spectator) {
    level endon("brSpawnPlayersEnding");
    spectator endon("assignSpectatorToSpectatePlayerWaitForTeam");
    spectator endon("death_or_disconnect");
    spectator namespace_a9c534dc7832aba4::playerspawnintermissionifneeded();
    spectator setclientomnvar("ui_show_spectateHud", spectator getentitynumber());
    wait(1);
    playertospectate = namespace_a9c534dc7832aba4::getbestspectatecandidate(spectator);
    thread namespace_a9c534dc7832aba4::assignspectatortospectateplayer(spectator, playertospectate);
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x968
// Size: 0x97
function function_fbfcdb4534b7b0d8() {
    /#
        namespace_e4c20df2c9115a56::registerhandlecommand(&function_94d8f65b7519f9fe);
        debughud = "<unknown string>";
        thread namespace_4bc0ead8d2af3d84::function_2bb11cfc1551b19a(debughud + "<unknown string>");
        thread namespace_4bc0ead8d2af3d84::function_2bb11cfc1551b19a(debughud + "<unknown string>");
        for (i = 0; i < 5; i++) {
            thread namespace_4bc0ead8d2af3d84::function_2bb11cfc1551b19a(debughud + "<unknown string>" + i + "<unknown string>" + i + "<unknown string>");
            thread namespace_4bc0ead8d2af3d84::function_2bb11cfc1551b19a(debughud + "<unknown string>" + i + "<unknown string>" + i + "<unknown string>");
        }
    #/
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa06
// Size: 0x172
function function_cd5dfc5762199c46(args) {
    /#
        target = undefined;
        if (args[0] == "<unknown string>") {
            var_9535f87b0f64516d = undefined;
            foreach (player in level.players) {
                if (player isplayerheadless()) {
                    continue;
                }
                if (isbot(player)) {
                    continue;
                }
                var_9535f87b0f64516d = player;
                break;
            }
            if (!isdefined(var_9535f87b0f64516d)) {
                return;
            }
            tracestart = var_9535f87b0f64516d geteye();
            traceend = tracestart + anglestoforward(var_9535f87b0f64516d getplayerangles()) * 100000;
            var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_character_contents();
            trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, var_9535f87b0f64516d, var_fbcabd62b8f66eb8);
            target = trace["<unknown string>"];
            color = (1, 0, 0);
            if (isdefined(target)) {
                color = (0, 1, 0);
            }
            sphere(trace["<unknown string>"], 10, color, 0, 20);
        } else {
            entnum = int(args[0]);
            target = level.players[entnum];
        }
        return target;
    #/
}

// Namespace br_alt_mode_inflation/namespace_85358e51a5be9d59
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb7f
// Size: 0x83
function function_94d8f65b7519f9fe(command, args) {
    /#
        switch (command) {
        case #"hash_158e32183cf66266":
            target = function_cd5dfc5762199c46(args);
            if (isdefined(target)) {
                target kill();
            }
            break;
        case #"hash_4bb95b0621e981e8":
            target = function_cd5dfc5762199c46(args);
            if (isdefined(target)) {
                target namespace_c6ccccd95254983f::playerplunderpickup(100);
            }
            break;
        default:
            break;
        }
    #/
}

