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

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa
// Size: 0x18e
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
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("playerDropPlunderOnDeath", &playerdropplunderondeath);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("circleTimer", &circletimer);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("postPlunder", &postplunder);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("markPlayerAsEliminatedOnKilled", &markplayeraseliminatedonkilled);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("playerGulagAutoWinWait", &playergulagautowinwait);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("triggerRespawnOverlay", &triggerrespawnoverlay);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("assignSpectatorToSpectatePlayer", &assignspectatortospectateplayer);
    if (!getdvarint(@"hash_83fc1574c6a65efd", 0)) {
        scripts\mp\gametypes\br_gametypes::disablefeature("gulag");
    }
    scripts\mp\gametypes\br_gametypes::disablefeature("useTokenToReviveTeammate");
    scripts\mp\gametypes\br_gametypes::disablefeature("gulagWinnerRestoreLoadoutUseGulag");
    thread initcallbacks();
    /#
        thread function_fbfcdb4534b7b0d8();
    #/
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440
// Size: 0x1f
function initcallbacks() {
    while (!isdefined(level.onplayerspawncallbacks)) {
        waitframe();
    }
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x467
// Size: 0x9
function onplayerspawned() {
    updaterespawnstatus();
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x478
// Size: 0x52
function playercanbuyrespawn() {
    return istrue(level.br_prematchstarted) && !istrue(self.br_iseliminated) && !level.br_alt_mode_inflation.disabled && self.plundercount >= level.br_alt_mode_inflation.cost;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3
// Size: 0xe5
function playerdropplunderondeath(dropstruct, attacker) {
    if (!isdefined(self)) {
        return;
    }
    var_43e1b640eec49671 = self.plundercount;
    if (istrue(self.respawningfromtoken)) {
        var_43e1b640eec49671 -= level.br_alt_mode_inflation.cost;
        if (var_43e1b640eec49671 < 0) {
            var_43e1b640eec49671 = 0;
        }
    }
    if (!isdefined(var_43e1b640eec49671) || var_43e1b640eec49671 < 0) {
        var_43e1b640eec49671 = 0;
    }
    var_b64f283113c99581 = int(var_43e1b640eec49671 * level.br_alt_mode_inflation.drop_percent);
    var_43e1b640eec49671 -= var_b64f283113c99581;
    scripts\mp\gametypes\br_plunder::playersetplundercount(var_43e1b640eec49671, getsetplundercountdatanosplash());
    if (level.br_alt_mode_inflation.drop_max >= 0) {
        var_b64f283113c99581 = int(min(level.br_alt_mode_inflation.drop_max, var_b64f283113c99581));
    }
    scripts\mp\gametypes\br_plunder::dropcondensedplunder(var_b64f283113c99581, dropstruct);
    return 1;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c1
// Size: 0xd3
function circletimer(circleindex) {
    if (!circleindex) {
        scripts\mp\gametypes\br_gulag::setupgulagtimer();
    }
    endcircle = scripts\mp\gametypes\br_gulag::getgulagclosedcircleindex();
    if (!level.br_alt_mode_inflation.disabled && circleindex >= endcircle) {
        level.br_alt_mode_inflation.disabled = 1;
        foreach (player in level.players) {
            if (!isdefined(player) || !isalive(player)) {
                continue;
            }
            player updaterespawnstatus();
            scripts\mp\gametypes\br_killstreaks::dangernotifyplayer(player, "cash_deploy_closed", 3);
        }
    }
    return false;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69d
// Size: 0x31
function postplunder(data) {
    skipsplash = 0;
    if (isdefined(data)) {
        skipsplash = data.skipsplash;
    }
    updaterespawnstatus(skipsplash);
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d6
// Size: 0x5d
function updaterespawnstatus(skipsplash) {
    if (playercanbuyrespawn()) {
        if (!scripts\mp\gametypes\br_public::hasrespawntoken()) {
            scripts\mp\gametypes\br_pickups::addrespawntoken(1);
            if (!istrue(skipsplash)) {
                thread scripts\mp\hud_message::showsplash("br_inflation_respawn_token_pickup");
            }
        }
        return;
    }
    if (scripts\mp\gametypes\br_public::hasrespawntoken()) {
        scripts\mp\gametypes\br_pickups::removerespawntoken();
        if (!istrue(skipsplash)) {
            thread scripts\mp\hud_message::showsplash("br_inflation_respawn_token_lost");
        }
    }
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b
// Size: 0x3a
function showrespawntimer(timer) {
    waittillframeend();
    scripts\mp\utility\lower_message::setlowermessageomnvar("waiting_to_spawn", int(gettime() + timer * 1000));
    scripts\mp\gametypes\br_gulag::setplayeringulagjailextrainfo(1);
    thread hiderespawntimer(timer);
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d
// Size: 0x2d
function hiderespawntimer(waittime) {
    self endon("disconnect");
    if (isdefined(waittime)) {
        wait waittime;
    }
    scripts\mp\gametypes\br_gulag::setplayeringulagjailextrainfo(0);
    scripts\mp\utility\lower_message::setlowermessageomnvar("clear_lower_msg");
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b2
// Size: 0x21
function getsetplundercountdatanosplash() {
    data = spawnstruct();
    data.skipsplash = 1;
    return data;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc
// Size: 0x3
function markplayeraseliminatedonkilled() {
    return false;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e8
// Size: 0x5b
function playergulagautowinwait(sponsor, tokenused) {
    if (!isdefined(sponsor)) {
        if (level.br_alt_mode_inflation.respawn_delay) {
            respawndelay = level.br_alt_mode_inflation.respawn_delay;
            thread showrespawntimer(respawndelay);
            wait respawndelay;
            return true;
        }
    }
    return false;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c
// Size: 0xd
function triggerrespawnoverlay(overlaytype) {
    return true;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x862
// Size: 0x99
function assignspectatortospectateplayer(spectator, playertospectate) {
    spectator notify("assignSpectatorToSpectatePlayerWaitForTeam");
    if (istrue(level.brspawnplayersending)) {
        return false;
    }
    if (!isdefined(playertospectate) || !isplayer(playertospectate) || !isalive(playertospectate) && !isdefined(playertospectate.streampoint)) {
        return false;
    }
    if (spectator.team == playertospectate.team) {
        return false;
    }
    if (!scripts\mp\utility\teams::getteamdata(spectator.team, "aliveCount")) {
        return false;
    }
    thread assignspectatortospectatetryagain(spectator);
    return true;
}

// Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x904
// Size: 0x5c
function assignspectatortospectatetryagain(spectator) {
    level endon("brSpawnPlayersEnding");
    spectator endon("assignSpectatorToSpectatePlayerWaitForTeam");
    spectator endon("death_or_disconnect");
    spectator scripts\mp\gametypes\br_spectate::playerspawnintermissionifneeded();
    spectator setclientomnvar("ui_show_spectateHud", spectator getentitynumber());
    wait 1;
    playertospectate = scripts\mp\gametypes\br_spectate::getbestspectatecandidate(spectator);
    thread scripts\mp\gametypes\br_spectate::assignspectatortospectateplayer(spectator, playertospectate);
}

/#

    // Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x968
    // Size: 0x96
    function function_fbfcdb4534b7b0d8() {
        scripts\mp\gametypes\br_dev::registerhandlecommand(&function_94d8f65b7519f9fe);
        debughud = "<dev string:x1c>";
        thread scripts\mp\gametypes\br_quest_util::adddebugcommanddelayed(debughud + "<dev string:x43>");
        thread scripts\mp\gametypes\br_quest_util::adddebugcommanddelayed(debughud + "<dev string:x7d>");
        for (i = 0; i < 5; i++) {
            thread scripts\mp\gametypes\br_quest_util::adddebugcommanddelayed(debughud + "<dev string:xbd>" + i + "<dev string:xca>" + i + "<dev string:xeb>");
            thread scripts\mp\gametypes\br_quest_util::adddebugcommanddelayed(debughud + "<dev string:xee>" + i + "<dev string:xfe>" + i + "<dev string:xeb>");
        }
    }

    // Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xa06
    // Size: 0x171
    function function_cd5dfc5762199c46(args) {
        target = undefined;
        if (args[0] == "<dev string:x122>") {
            looker = undefined;
            foreach (player in level.players) {
                if (player isplayerheadless()) {
                    continue;
                }
                if (isbot(player)) {
                    continue;
                }
                looker = player;
                break;
            }
            if (!isdefined(looker)) {
                return;
            }
            tracestart = looker geteye();
            traceend = tracestart + anglestoforward(looker getplayerangles()) * 100000;
            tracecontents = scripts\engine\trace::create_character_contents();
            trace = scripts\engine\trace::ray_trace(tracestart, traceend, looker, tracecontents);
            target = trace["<dev string:x12a>"];
            color = (1, 0, 0);
            if (isdefined(target)) {
                color = (0, 1, 0);
            }
            sphere(trace["<dev string:x131>"], 10, color, 0, 20);
        } else {
            entnum = int(args[0]);
            target = level.players[entnum];
        }
        return target;
    }

    // Namespace br_alt_mode_inflation / scripts\mp\gametypes\br_alt_mode_inflation
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xb7f
    // Size: 0x82
    function function_94d8f65b7519f9fe(command, args) {
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
                target scripts\mp\gametypes\br_plunder::playerplunderpickup(100);
            }
            break;
        default: 
            break;
        }
    }

#/
