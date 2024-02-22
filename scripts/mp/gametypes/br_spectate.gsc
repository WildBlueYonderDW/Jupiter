// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_5bc60484d17fa95c;
#using script_3aa8e63a56e3416;
#using script_5bab271917698dc4;
#using scripts\mp\utility\script.gsc;
#using script_26ccbfe3954cacf4;
#using script_59ff79d681bb860c;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\player.gsc;
#using script_14d3930854cb398c;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_21c19cfc7139d773;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_a88bbb52a237c8a1;

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74f
// Size: 0x18
function spectate_init() {
    level thread updateactivespectatorcounts();
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_aa1a345e6ec0499b);
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e
// Size: 0xa
function initplayer() {
    playerclearspectatekillchainsystem();
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77f
// Size: 0xd8
function getbestspectatecandidate(victim, attacker, var_e65af3dbf45178e6) {
    playertospectate = function_ee535fc3c5af554(victim, attacker, var_e65af3dbf45178e6);
    if (getdvarint(@"hash_b09c8a3c1763be50", 0) && !isbot(victim)) {
        if (isdefined(playertospectate)) {
            logstring("Get best spectator with id: " + playertospectate getentitynumber() + " name: " + playertospectate.name + " origin: " + playertospectate.origin);
        } else {
            uibotcount = 0;
            if (isdefined(level.var_7b37b2193f163b9b)) {
                uibotcount = level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
            }
            logstring("Fail to find suitable player to spectate, total players: " + level.players.size + " UIBots: " + uibotcount);
        }
    }
    return playertospectate;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f
// Size: 0x338
function function_ee535fc3c5af554(victim, attacker, var_e65af3dbf45178e6) {
    playertospectate = undefined;
    if (istrue(namespace_71073fa38f11492::isbrgametypefuncdefined("getBestSpectateCandidate"))) {
        playertospectate = namespace_71073fa38f11492::runbrgametypefunc("getBestSpectateCandidate", victim, attacker);
        if (isvalidspectatetarget(playertospectate)) {
            return playertospectate;
        }
    }
    if (istrue(victim.gulag) && namespace_eb17b46cdcb98eea::function_1980065ce4dc067b() && !istrue(var_e65af3dbf45178e6)) {
        var_c9b50559b928dd40 = namespace_6ea7652ec407cc80::function_1bd32287885bb933(victim);
        if (isbot(var_c9b50559b928dd40)) {
            var_c9b50559b928dd40 = undefined;
        }
        if (isvalidspectatetarget(var_c9b50559b928dd40)) {
            return var_c9b50559b928dd40;
        }
    }
    if (isdefined(victim.nextplayertospectate)) {
        playertospectate = getnextspectatecandidatefromchain(victim.nextplayertospectate);
        victim.nextplayertospectate = undefined;
    }
    if (!isvalidspectatetarget(playertospectate)) {
        playertospectate = victim namespace_8bfdb6eb5a3df67a::playergetbestrespawnteammate(undefined, undefined, 1, 1);
    }
    if (!isvalidspectatetarget(playertospectate) && isdefined(victim.team)) {
        friendlies = getfriendlyplayers(victim.team);
        playertospectate = function_964fb56006392a0f(victim, friendlies);
    }
    if (!isvalidspectatetarget(playertospectate) && isdefined(attacker) && isplayer(attacker)) {
        attackerteam = attacker.team;
        victimteam = victim.team;
        if (!isdefined(attackerteam) || !isdefined(victimteam) || attackerteam != victimteam) {
            if (isalive(attacker) && !istrue(attacker.gulag) && !istrue(attacker.inlaststand) && !isbot(attacker)) {
                playertospectate = attacker;
            } else if (isdefined(attackerteam)) {
                teammates = getfriendlyplayers(attackerteam);
                playertospectate = function_964fb56006392a0f(victim, teammates);
            }
        }
    }
    if (!isvalidspectatetarget(playertospectate) && isdefined(attacker) && isplayer(attacker) && attacker != victim) {
        playertospectate = getnextspectatecandidatefromchain(attacker);
    }
    if (!isvalidspectatetarget(playertospectate)) {
        playertospectate = function_964fb56006392a0f(victim, level.players);
    }
    if (!isvalidspectatetarget(playertospectate)) {
        playertospectate = function_34c94455d9614f66(victim);
    }
    if (!isvalidspectatetarget(playertospectate) && level.players.size > 1 && !istrue(level.gameended) && !istrue(level.var_9f2c0d537922a861)) {
        var_5f387f573c75fc2b = 0;
        foreach (player in level.players) {
            if (istrue(player.br_iseliminated)) {
                var_5f387f573c75fc2b++;
            }
        }
        if (!istrue(level.var_82a0e660e66306dc)) {
            namespace_9c840bb9f2ecbf00::demoforcesre("getBestSpectateCandidate - no valid players found (" + var_5f387f573c75fc2b + " of " + level.players.size + ") eliminated");
        }
    }
    if (isvalidspectatetarget(playertospectate)) {
        return playertospectate;
    }
    return undefined;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9f
// Size: 0x8e
function function_34c94455d9614f66(victim) {
    var_1d17d55b8c1ec9cf = undefined;
    foreach (bot in level.players) {
        if (bot != victim && function_5c0a370334d590e(bot)) {
            if (!bot namespace_95d8d8ec67e3e074::function_d012729eac1e7053()) {
                return bot;
            } else if (!isdefined(var_1d17d55b8c1ec9cf)) {
                var_1d17d55b8c1ec9cf = bot;
            }
        }
    }
    return var_1d17d55b8c1ec9cf;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc35
// Size: 0x49
function function_5c0a370334d590e(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (player namespace_95d8d8ec67e3e074::isuibot()) {
        return 0;
    }
    if (!namespace_41f4dfb71dd08362::function_ded80385ea7471db(player)) {
        return 0;
    }
    if (istrue(player.var_7ca8ac9793bc9c22)) {
        return 0;
    }
    return !istrue(player.br_iseliminated);
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc86
// Size: 0x10b
function debugforcesre1(player, var_8f7c03ec5f22fe86, var_5f5e891346a87fae) {
    var_396a43e6475305fe = "player: " + player.name + ", candidate: " + var_8f7c03ec5f22fe86.name + ", playersChecked.size: " + var_5f5e891346a87fae.size;
    namespace_9c840bb9f2ecbf00::demoforcesre(var_396a43e6475305fe);
    var_396a43e6475305fe = "";
    maxplayers = int(min(var_5f5e891346a87fae.size, 3));
    count = 0;
    foreach (p in var_5f5e891346a87fae) {
        var_396a43e6475305fe = var_396a43e6475305fe + " - player: " + p.name + ", eliminated: " + istrue(p.br_iseliminated);
        count++;
        if (count > maxplayers) {
            break;
        }
    }
    namespace_9c840bb9f2ecbf00::demoforcesre(var_396a43e6475305fe);
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd98
// Size: 0x81
function getnextspectatecandidatefromchain(player) {
    var_5f5e891346a87fae = [];
    count = 0;
    var_8f7c03ec5f22fe86 = player;
    while (isdefined(var_8f7c03ec5f22fe86) && (isbot(var_8f7c03ec5f22fe86) || !isvalidspectatetarget(var_8f7c03ec5f22fe86))) {
        count++;
        entnum = var_8f7c03ec5f22fe86 getentitynumber();
        if (count >= 150 || isdefined(var_5f5e891346a87fae[entnum])) {
            return undefined;
        }
        var_5f5e891346a87fae[entnum] = var_8f7c03ec5f22fe86;
        var_8f7c03ec5f22fe86 = var_8f7c03ec5f22fe86 playergetspectatingplayer();
    }
    return var_8f7c03ec5f22fe86;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe21
// Size: 0x143
function function_964fb56006392a0f(victim, players) {
    playertospectate = undefined;
    candidates = [];
    var_994343182144e8bc = [];
    var_994346182144ef55 = [];
    foreach (player in players) {
        if (!isdefined(player) || isbot(player) || !isvalidspectatetarget(player) || player == victim) {
            continue;
        }
        if (istrue(player.gulag)) {
            var_994343182144e8bc[var_994343182144e8bc.size] = player;
        } else if (istrue(player.inlaststand)) {
            var_994346182144ef55[var_994346182144ef55.size] = player;
        } else {
            candidates[candidates.size] = player;
        }
    }
    if (candidates.size > 0) {
        randomindex = randomint(candidates.size);
        playertospectate = candidates[randomindex];
    }
    if (!isdefined(playertospectate) && var_994343182144e8bc.size > 0) {
        randomindex = randomint(var_994343182144e8bc.size);
        playertospectate = var_994343182144e8bc[randomindex];
    }
    if (!isdefined(playertospectate) && var_994346182144ef55.size > 0) {
        randomindex = randomint(var_994346182144ef55.size);
        playertospectate = var_994346182144ef55[randomindex];
    }
    return playertospectate;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6c
// Size: 0xa5
function isvalidspectatetarget(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (istrue(namespace_71073fa38f11492::isbrgametypefuncdefined("isValidSpectateTarget"))) {
        return namespace_71073fa38f11492::runbrgametypefunc("isValidSpectateTarget", player);
    }
    if (!isalive(player) && !function_393455dde05f567c(player) && (istrue(player.gulagarena) || !istrue(player.gulag))) {
        return 0;
    }
    if (istrue(player.var_e7af56a2df18030d) || istrue(player.extracted)) {
        return 0;
    }
    if (istrue(player.disconnecting)) {
        return 0;
    }
    return !istrue(player.br_iseliminated);
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1019
// Size: 0xdd
function spawnintermissionatplayer(player) {
    spawnpoint = spawnstruct();
    if (isdefined(player) && isdefined(player.spectatepoint)) {
        spawnpoint = player.spectatepoint;
        player.spectatepoint = undefined;
    } else if (isdefined(player)) {
        spawnpoint.origin = player.origin + (0, 0, 100);
        spawnpoint.angles = player.angles;
    } else {
        spawnpoint.origin = self.origin + (0, 0, 100);
        spawnpoint.angles = self.angles;
    }
    namespace_99ac021a7547cae3::spawnintermission(spawnpoint, undefined, 0);
    self.var_d7a39ed80c939737 = 1;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10fd
// Size: 0x80
function private deletecamonleave(camera) {
    self notify("deleteCamOnLeave");
    self endon("deleteCamOnLeave");
    team = self.team;
    if (!isdefined(team)) {
        return;
    }
    self waittill("disconnect");
    if (level.teamdata[team]["players"].size > 0) {
        return;
    }
    if (isdefined(level.var_11d0c321045f514f[team])) {
        level.var_11d0c321045f514f[team] delete();
        level.var_11d0c321045f514f[team] = undefined;
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1184
// Size: 0x1ad
function function_3c5421c26d253eb0(var_13669d61d3d44913) {
    if (!isdefined(level.var_11d0c321045f514f)) {
        level.var_11d0c321045f514f = [];
    }
    var_5940f376a254619d = undefined;
    if (isdefined(level.var_11d0c321045f514f) && isdefined(level.var_11d0c321045f514f[self.team])) {
        var_5940f376a254619d = level.var_11d0c321045f514f[self.team];
    } else {
        var_5940f376a254619d = spawn("script_model", self.origin + (0, 0, 50));
        var_5940f376a254619d setmodel("tag_origin");
        var_5940f376a254619d.angles = self.angles;
        level.var_11d0c321045f514f[self.team] = var_5940f376a254619d;
    }
    if (namespace_7e17181d03156026::isreallyalive(self)) {
        self cameralinkto(var_5940f376a254619d, "tag_origin");
    }
    players = level.teamdata[self.team]["players"];
    if (isdefined(players) && players.size > 0) {
        foreach (player in players) {
            if (isdefined(player)) {
                if (istrue(var_13669d61d3d44913) && (!namespace_7e17181d03156026::isreallyalive(player) || isdefined(player) && istrue(player.extracted)) && !istrue(namespace_51790b5acb47a506::ispleading(player))) {
                    player cameralinkto(var_5940f376a254619d, "tag_origin");
                }
                player thread deletecamonleave(var_5940f376a254619d);
            }
        }
    } else {
        thread deletecamonleave(var_5940f376a254619d);
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1338
// Size: 0x136
function spawnspectator(var_642470e1abc1bbf9, var_8b3f6477dbed24d7, var_899beb1fc66d0ec6) {
    self endon("gulag_auto_win");
    if (namespace_d3d40f75bb4e4c32::istutorial()) {
        return;
    }
    if (istrue(self.squadwiped) && istrue(level.var_b7ad06255200033c)) {
        self.br_spectatorinitialized = 1;
        self notify("br_spectatorInitialized");
        return;
    }
    victim = self;
    victim spawnintermissionatplayer(victim);
    thread namespace_47fd1e79a44628cd::playerspawningasspectator();
    if (!istrue(var_899beb1fc66d0ec6)) {
        victim thread triggereliminatedoverlay();
    }
    attacker = undefined;
    if (isdefined(var_642470e1abc1bbf9)) {
        attacker = var_642470e1abc1bbf9.attacker;
    }
    if (namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
        return;
    }
    playertospectate = getbestspectatecandidate(victim, attacker);
    if (isdefined(playertospectate)) {
        assignspectatortospectateplayer(victim, playertospectate);
    } else {
        logstring("[ spawnSpectator ] spectator not found for player:" + victim.name + " ... this player will not be set to out-of-gulag in forcePlayerSpectateTarget()");
    }
    if (!istrue(victim.br_spectatorinitialized)) {
        victim notify("br_spectatorInitialized");
        victim.br_spectatorinitialized = 1;
    }
    if (isdefined(level.var_e82dd38d666141db)) {
        victim [[ level.var_e82dd38d666141db ]](1);
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1475
// Size: 0x81
function function_a7f4ed43a56864ad() {
    player = self;
    canplayerspectategulag = undefined;
    if (namespace_eb17b46cdcb98eea::function_cfe304859f30e747("canPlayerSpectateGulag")) {
        canplayerspectategulag = namespace_eb17b46cdcb98eea::function_3cceb052d780fef1("canPlayerSpectateGulag");
    }
    if (istrue(canplayerspectategulag)) {
        var_229e3676e299b693 = undefined;
        if (namespace_eb17b46cdcb98eea::function_cfe304859f30e747("shouldPlayerSpectateGulag")) {
            var_229e3676e299b693 = namespace_eb17b46cdcb98eea::function_3cceb052d780fef1("shouldPlayerSpectateGulag");
            if (istrue(var_229e3676e299b693)) {
                if (namespace_eb17b46cdcb98eea::function_cfe304859f30e747("gulagSpectatorWatchMatchOver")) {
                    namespace_eb17b46cdcb98eea::function_3cceb052d780fef1("gulagSpectatorWatchMatchOver");
                }
            }
        }
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fd
// Size: 0x158
function triggereliminatedoverlay() {
    self endon("disconnect");
    self endon("br_team_fully_eliminated");
    var_df38ed143464f3c1 = [];
    if (isdefined(self.team) && isgameplayteam(self.team)) {
        var_df38ed143464f3c1 = getfriendlyplayers(self.team, 1);
    }
    if (var_df38ed143464f3c1.size > 0) {
        var_700e5bde49fce648 = 1;
        switch (getsubgametype()) {
        case #"hash_59b8e9d05b31ff9":
        case #"hash_14a88ff33578e3fd":
        case #"hash_5e78ea9021845d4a":
        case #"hash_60cb0701381bbb1f":
            var_700e5bde49fce648 = 0;
            break;
        case #"hash_c79893a20318a9c2":
            var_700e5bde49fce648 = !isdefined(level.teamvehicles[self.team]);
            break;
        case #"hash_dddecc2751311914":
            var_700e5bde49fce648 = !istrue(level.brgametype.var_bbde847aed85512a) || istrue(level.brgametype.var_523779ad4c01fd7c);
            break;
        }
        if (var_700e5bde49fce648) {
            thread setbuybackpingmessage();
            thread function_72173d4a7c4845bb();
            wait(0.25);
            self setclientomnvar("ui_br_end_game_splash_type", 5);
            wait(1);
            self setclientomnvar("ui_br_end_game_splash_type", 0);
        }
    } else {
        self setclientomnvar("ui_requestRedeployButton_state", -1);
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165c
// Size: 0x31
function function_72173d4a7c4845bb() {
    waittill_any_return_4("disconnect", "br_team_fully_eliminated", "started_spawnPlayer", "gulag_auto_win");
    if (isdefined(self)) {
        self setclientomnvar("ui_requestRedeployButton_state", -1);
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1694
// Size: 0x217
function setbuybackpingmessage() {
    self endon("disconnect");
    self endon("br_team_fully_eliminated");
    self endon("started_spawnPlayer");
    self endon("gulag_auto_win");
    if (!istrue(level.br_plunder_enabled) || istrue(level.var_b7ad06255200033c)) {
        return;
    }
    if (getgametype() != "plunder") {
        waittillspectating(self);
        if (namespace_d3d40f75bb4e4c32::isrespawningfromtoken(self)) {
            return;
        }
        var_9b07a6c625fc48d3 = getdvarint(@"hash_fd0a280901f0aa8c", 10);
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_ping_nearest_supply");
        self setclientomnvar("ui_requestRedeployButton_state", 0);
        var_b4320bce0fbc5ff9 = 0;
        while (1) {
            waittillframeend();
            if (isdefined(self.playertospectate) && istrue(self.playertospectate.gulag)) {
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
                self setclientomnvar("ui_requestRedeployButton_state", -1);
                waittill_any_return_4("br_spectator_end_forced_spectator", "playertospectate_set", "spectating_cycle", "spectated_player_wins_gulag");
            } else {
                namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_ping_nearest_supply");
                self setclientomnvar("ui_requestRedeployButton_state", 0);
                msg = waittill_any_return_5("buybackRequested", "br_spectator_end_forced_spectator", "playertospectate_set", "spectating_cycle", "death");
                if (msg == "buybackRequested") {
                    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
                    endtime = gettime() + var_9b07a6c625fc48d3 * 1000;
                    self setclientomnvar("ui_requestRedeployButton_state", int(max(endtime, 0)));
                    foreach (teammate in level.teamdata[self.team]["alivePlayers"]) {
                        if (!isdefined(teammate)) {
                            continue;
                        }
                        if (teammate != self && !istrue(teammate.gulag)) {
                            teammate namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_buyback");
                        }
                    }
                    wait(var_9b07a6c625fc48d3);
                }
            }
        }
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b2
// Size: 0xf9
function debugforcesre2(player, playertospectate) {
    var_396a43e6475305fe = "player: " + player.name;
    if (isdefined(playertospectate) && isdefined(playertospectate.name)) {
        var_396a43e6475305fe = var_396a43e6475305fe + ", playerToSpectate: " + playertospectate.name + ", alive: " + isalive(playertospectate) + ", eliminated: " + istrue(playertospectate.br_iseliminated) + ", gulag: " + istrue(playertospectate.gulag);
    }
    namespace_9c840bb9f2ecbf00::demoforcesre(var_396a43e6475305fe);
    waitframe();
    if (isdefined(playertospectate) && isdefined(playertospectate.name)) {
        var_396a43e6475305fe = "waitframe - playerToSpectate: " + playertospectate.name + ", alive: " + isalive(playertospectate) + ", eliminated: " + istrue(playertospectate.br_iseliminated) + ", gulag: " + istrue(playertospectate.gulag);
    }
    namespace_9c840bb9f2ecbf00::demoforcesre(var_396a43e6475305fe);
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b2
// Size: 0x76
function playerclearspectatekillchainsystem() {
    self.prestreamingspectatetarget = undefined;
    self.nextplayertospectate = undefined;
    self.playertospectate = undefined;
    if (istrue(self.var_d7a39ed80c939737)) {
        if (!getdvarint(@"hash_8117734e3e0f8be5", 0)) {
            namespace_7e17181d03156026::_freezecontrols(0, undefined, "spawnIntermission");
        }
        self.var_d7a39ed80c939737 = undefined;
    }
    self setclientomnvar("ui_show_spectateHud", -1);
    self notify("forcePlayerSpectateTarget");
    self notify("playerMonitorSpectatorCycle");
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2f
// Size: 0x65
function playerspawnintermissionifneeded() {
    player = self;
    if (player.sessionstate != "intermission") {
        var_f3201060eac7d7d7 = player playergetspectatingplayer();
        if (isdefined(var_f3201060eac7d7d7) && istrue(var_f3201060eac7d7d7.wasingulag)) {
            player namespace_47fd1e79a44628cd::playersetwasingulag(1);
            level notify("update_circle_hide");
        }
        player spawnintermissionatplayer(var_f3201060eac7d7d7);
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9b
// Size: 0x44b
function forceplayerspectatetarget(playertospectate) {
    if (istrue(level.brspawnplayersending)) {
        return;
    }
    player = self;
    level endon("brSpawnPlayersEnding");
    player endon("disconnect");
    player notify("forcePlayerSpectateTarget");
    player endon("forcePlayerSpectateTarget");
    player.prestreamingspectatetarget = 1;
    player playerspawnintermissionifneeded();
    if (!isdefined(playertospectate) || !isplayer(playertospectate) || !isalive(playertospectate) && !isdefined(playertospectate.streampoint)) {
        if (level.gameended || level.players.size == 1) {
            player setclientomnvar("ui_show_spectateHud", player getentitynumber());
            player.prestreamingspectatetarget = undefined;
            return;
        }
        thread debugforcesre2(player, playertospectate);
        playertospectate = getbestspectatecandidate(player);
        if (!isdefined(playertospectate)) {
            player setclientomnvar("ui_show_spectateHud", player getentitynumber());
            player.prestreamingspectatetarget = undefined;
            return;
        }
    }
    playertospectate endon("disconnect");
    var_ce41748027b9cf64 = playertospectate getentitynumber();
    player.playertospectate = playertospectate;
    player setclientomnvar("ui_show_spectateHud", var_ce41748027b9cf64);
    player setadditionalstreamloaddist(0);
    var_11f3b4465c8b637b = playertospectate.origin;
    if (isdefined(playertospectate.streampoint)) {
        var_11f3b4465c8b637b = playertospectate.streampoint.origin;
        player function_670863fc4008c3d8(var_11f3b4465c8b637b);
    } else {
        player function_670863fc4008c3d8(var_11f3b4465c8b637b, 0, playertospectate);
    }
    player loadcustomizationplayerview(playertospectate);
    weapons = playertospectate getweaponslistprimaries();
    player loadweaponsforplayer(weapons, 1);
    waitframe();
    var_e044db8497eee961 = getdvarint(@"hash_8f060c92b126a91b", 2500);
    var_2d124f5cac8360e2 = getdvarint(@"hash_ceb0792519b8eea2", 500);
    var_6df0ef0dba50fd51 = getdvarint(@"hash_ff561f8c33f431ba", 9000);
    var_e1bd90cd85d2938e = gettime() + var_2d124f5cac8360e2;
    timeout = gettime() + var_6df0ef0dba50fd51;
    while (isdefined(player) && (!player isadditionalstreamposready() || isdefined(playertospectate) && !player hasloadedcustomizationplayerview(playertospectate) || !player hasloadedviewweapons(weapons)) && gettime() < timeout) {
        if (isdefined(playertospectate) && !isdefined(playertospectate.streampoint) && gettime() > var_e1bd90cd85d2938e) {
            distsq = distance2dsquared(playertospectate.origin, var_11f3b4465c8b637b);
            if (!isdefined(distsq)) {
                if (!isdefined(var_11f3b4465c8b637b)) {
                    logstring("Log this in IW9-428811: streamOrigin was undefined");
                } else if (!isdefined(playertospectate.origin)) {
                    logstring("Log this in IW9-428811: playerToSpectate.origin was undefined");
                } else {
                    logstring("Log this in IW9-428811: Inputs were defined. Error exists in BGScr_Distance2DSquared. Inputs: " + playertospectate.origin + " and " + var_11f3b4465c8b637b);
                }
            }
            if (distsq > var_e044db8497eee961) {
                var_11f3b4465c8b637b = playertospectate.origin;
                player function_670863fc4008c3d8(var_11f3b4465c8b637b, 0, playertospectate);
                var_e1bd90cd85d2938e = gettime() + var_2d124f5cac8360e2;
            }
        }
        waitframe();
    }
    /#
        var_532c912daac4929c = getdvarfloat(@"hash_2c879521333c4987", 0);
        if (var_532c912daac4929c > 0) {
            wait(var_532c912daac4929c);
        }
    #/
    var_1e41981f0fa40795 = getdvarint(@"hash_ceb0792519b8eea2", 2000);
    timeout = gettime() + var_6df0ef0dba50fd51;
    var_8cabe71736d798a7 = 0;
    while ((isdefined(playertospectate.streampoint) || !isalive(playertospectate) || istrue(playertospectate.gulag) && !istrue(playertospectate.jailed)) && gettime() < timeout) {
        if (gettime() > var_8cabe71736d798a7) {
            player function_670863fc4008c3d8(var_11f3b4465c8b637b);
            var_8cabe71736d798a7 = gettime() + var_1e41981f0fa40795;
        }
        waitframe();
    }
    if (isdefined(playertospectate)) {
        player playerforcespectatorclientwait(playertospectate);
    }
    player thread playermonitorspectatorcycle();
    player clearadditionalstreampos();
    if (istrue(player.wasingulag)) {
        player namespace_47fd1e79a44628cd::playersetwasingulag(0);
        level notify("update_circle_hide");
    }
    self notify("force_spectate_done");
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eed
// Size: 0x17b
function playerforcespectatorclientwait(playertospectate) {
    player = self;
    if (isdefined(playertospectate) && !playertospectate namespace_8bfdb6eb5a3df67a::playeriscinematicblacklayeron()) {
        player thread namespace_8bfdb6eb5a3df67a::playercinematicfadeout();
    } else if (!player namespace_8bfdb6eb5a3df67a::playeriscinematicblacklayeron()) {
        player namespace_8bfdb6eb5a3df67a::playercinematicfadein();
        wait(0.5);
    }
    if (istrue(player.var_d7a39ed80c939737)) {
        if (!getdvarint(@"hash_8117734e3e0f8be5", 0)) {
            player namespace_7e17181d03156026::_freezecontrols(0, undefined, "spawnIntermission");
        }
        player.var_d7a39ed80c939737 = undefined;
    }
    var_ce41748027b9cf64 = undefined;
    if (isdefined(playertospectate)) {
        var_ce41748027b9cf64 = playertospectate getentitynumber();
        player namespace_7e17181d03156026::updatesessionstate("spectator");
        player.forcespectatorclient = var_ce41748027b9cf64;
        if (istrue(player.var_d7a39ed80c939737)) {
            player namespace_7e17181d03156026::_freezecontrols(0, undefined, "spawnIntermission");
            player.var_d7a39ed80c939737 = undefined;
        }
        player setallstreamloaddist(0);
        player setclientomnvar("ui_show_spectateHud", -1);
        var_e972c5a415d85b37 = player getspectatingplayer();
        while (!isdefined(var_e972c5a415d85b37) || var_ce41748027b9cf64 != var_e972c5a415d85b37 getentitynumber()) {
            waitframe();
            var_e972c5a415d85b37 = player getspectatingplayer();
            if (!isdefined(playertospectate) || !isvalidspectatetarget(playertospectate)) {
                break;
            }
        }
    }
    player notify("br_spectator_end_forced_spectator");
    player.forcespectatorclient = -1;
    if (isdefined(playertospectate) && isvalidspectatetarget(playertospectate)) {
        player spectateclientnum(var_ce41748027b9cf64, 1);
    }
    player.prestreamingspectatetarget = undefined;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206f
// Size: 0x56
function function_aa1a345e6ec0499b(channel, otherclientnum) {
    player = self;
    if (!isdefined(otherclientnum)) {
        return;
    }
    if (channel == "br_spectate_player") {
        otherplayer = namespace_99ac021a7547cae3::getplayerfromclientnum(otherclientnum);
        if (isvalidspectatetarget(otherplayer)) {
            player spectateclientnum(otherclientnum, 1);
        }
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20cc
// Size: 0xe5
function assignspectatortospectateplayer(spectator, playertospectate) {
    if (getdvarint(@"hash_5df0fed95481409d", 1)) {
        spectator namespace_7e17181d03156026::_freezecontrols(0, undefined, "spawnIntermission");
    }
    result = namespace_71073fa38f11492::runbrgametypefunc("assignSpectatorToSpectatePlayer", spectator, playertospectate);
    if (istrue(result)) {
        return;
    }
    /#
        assert(isdefined(playertospectate) || level.players.size == 1 || level.gameended);
    #/
    spectator allowspectateteam("freelook", 0);
    spectator allowspectateteam("none", 0);
    spectator allowspectateallteams(getdvarint(@"hash_87720d5ec286812b", 0));
    if (level.teambased && isdefined(playertospectate)) {
        spectator allowspectateteam(playertospectate.team, 1);
    }
    spectator thread forceplayerspectatetarget(playertospectate);
    self notify("playertospectate_set");
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b8
// Size: 0x17d
function playermonitorspectatorcycle() {
    self notify("playerMonitorSpectatorCycle");
    self endon("playerMonitorSpectatorCycle");
    self endon("forcePlayerSpectateTarget");
    self endon("disconnect");
    self endon("started_spawnPlayer");
    while (1) {
        playertospectate = self waittill("spectating_cycle_start");
        if (!isdefined(playertospectate)) {
            continue;
        }
        if (istrue(self.gulagarena) && !istrue(self.var_4af73ce40a5d8572) && namespace_eb17b46cdcb98eea::function_1980065ce4dc067b()) {
            var_13c5603d4beea2fc = self getspectatingplayer();
            if (isdefined(var_13c5603d4beea2fc)) {
                self.forcespectatorclient = var_13c5603d4beea2fc getentitynumber();
                continue;
            }
        }
        if (playertospectate namespace_8bfdb6eb5a3df67a::playeriscinematicblacklayeron()) {
            namespace_8bfdb6eb5a3df67a::playercinematicfadein();
        }
        success = playerwaittillspectatecycle(playertospectate);
        var_f7632b4589b2bed4 = self getspectatingplayer();
        if (!istrue(success) || !isdefined(var_f7632b4589b2bed4)) {
            stopspectateplayer(self getentitynumber(), 1);
            if (isvalidspectatetarget(self.playertospectate)) {
                playerforcespectatorclientwait(self.playertospectate);
            } else {
                playertospectate = getbestspectatecandidate(self);
                if (isdefined(playertospectate)) {
                    if (!playertospectate namespace_8bfdb6eb5a3df67a::playeriscinematicblacklayeron()) {
                        thread namespace_8bfdb6eb5a3df67a::playercinematicfadeout();
                    }
                    assignspectatortospectateplayer(self, playertospectate);
                }
            }
            continue;
        }
        self.playertospectate = playertospectate;
        if (var_f7632b4589b2bed4 != playertospectate) {
            self.playertospectate = var_f7632b4589b2bed4;
        }
        if (self.playertospectate namespace_8bfdb6eb5a3df67a::playeriscinematicblacklayeron()) {
            if (!namespace_8bfdb6eb5a3df67a::playeriscinematicblacklayeron()) {
                namespace_8bfdb6eb5a3df67a::playercinematicfadein();
            }
        } else {
            thread namespace_8bfdb6eb5a3df67a::playercinematicfadeout();
        }
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233c
// Size: 0x1d
function playerwaittillspectatecycle(playertospectate) {
    playertospectate endon("death_or_disconnect");
    self waittill("spectating_cycle");
    return 1;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2361
// Size: 0x63
function playergetspectatingplayer() {
    var_13c5603d4beea2fc = undefined;
    if (!istrue(self.spectatekillcam)) {
        var_13c5603d4beea2fc = self getspectatingplayer();
    }
    if (!isdefined(var_13c5603d4beea2fc) && isdefined(self.nextplayertospectate)) {
        var_13c5603d4beea2fc = self.nextplayertospectate;
    }
    if (!isdefined(var_13c5603d4beea2fc) && isdefined(self.playertospectate)) {
        var_13c5603d4beea2fc = self.playertospectate;
    }
    return var_13c5603d4beea2fc;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23cc
// Size: 0x39
function function_4a8746c1aa6bb002(timeout, var_2307459d7ae05ee8) {
    level endon("game_ended");
    self endon("disconnect");
    namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
    waittill_any_timeout_1(timeout, var_2307459d7ae05ee8);
    namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x240c
// Size: 0xba
function function_6d5206bdba79e8c3() {
    player = self;
    playerlist = [];
    var_721982228624d657 = player function_a7e757033c9d7ab7();
    if (var_721982228624d657.size > 0) {
        foreach (var_ff3fe241243b175b in var_721982228624d657) {
            if (!isdefined(var_ff3fe241243b175b.team)) {
                continue;
            }
            if (var_ff3fe241243b175b.team == "spectator" || var_ff3fe241243b175b.team == "codcaster") {
                playerlist[playerlist.size] = var_ff3fe241243b175b;
            }
        }
    }
    return playerlist;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ce
// Size: 0xb3
function getspectatorsofplayer(targetplayer) {
    playerlist = [];
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isvalidspectatetarget(player)) {
            continue;
        }
        if (!istrue(player.br_spectatorinitialized)) {
            continue;
        }
        var_13c5603d4beea2fc = player playergetspectatingplayer();
        if (!isdefined(var_13c5603d4beea2fc)) {
            continue;
        }
        if (var_13c5603d4beea2fc == targetplayer) {
            playerlist[playerlist.size] = player;
        }
    }
    return playerlist;
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2589
// Size: 0x160
function migratespectators(victim, attacker, var_f424f125a0bba2dc) {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    if (function_393455dde05f567c(victim) || victim namespace_d3d40f75bb4e4c32::function_c0461110bcceb029()) {
        return;
    }
    playertospectate = getbestspectatecandidate(victim, attacker);
    if (var_f424f125a0bba2dc && !istrue(victim.gulag)) {
        victim.nextplayertospectate = playertospectate;
    }
    if (!isvalidspectatetarget(playertospectate)) {
        if (istrue(level.var_b7ad06255200033c) && getdvarint(@"hash_9204e47e241583a1", 1) == 1) {
            if (isdefined(victim) && isdefined(victim.team)) {
                players = level.teamdata[victim.team]["players"];
                if (isdefined(players) && players.size > 0) {
                    foreach (player in players) {
                        if (isvalidspectatetarget(player)) {
                            updateexistingspectatorsofvictim(victim, player);
                            return;
                        }
                    }
                }
                victim function_3c5421c26d253eb0(1);
            }
        }
        return;
    }
    updateexistingspectatorsofvictim(victim, playertospectate);
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f0
// Size: 0x146
function updateexistingspectatorsofvictim(victim, playertospectate) {
    var_664365936020571f = getspectatorsofplayer(victim);
    foreach (spectator in var_664365936020571f) {
        if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b() && istrue(spectator.gulagarena)) {
            var_6b34091dbd072e53 = getbestspectatecandidate(spectator, undefined, 1);
            jumpiffalse(isdefined(var_6b34091dbd072e53) && spectator.team == var_6b34091dbd072e53.team) LOC_000000b2;
            assignspectatortospectateplayer(spectator, var_6b34091dbd072e53);
        } else if (isdefined(playertospectate) && victim.team == spectator.team && playertospectate.team != victim.team && isdefined(victim.streampoint)) {
            assignspectatortospectateplayer(spectator, victim);
        } else if (isdefined(spectator.nextplayertospectate)) {
            spectator.nextplayertospectate = playertospectate;
        } else {
            assignspectatortospectateplayer(spectator, playertospectate);
        }
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x283d
// Size: 0x173
function updateactivespectatorcounts() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        var_b75ebfa25066fb2a = [];
        foreach (player in level.players) {
            if (isdefined(player)) {
                var_7418903e36376e0b = player getspectatingplayer();
                if (isdefined(var_7418903e36376e0b)) {
                    var_9c38af357b506fe9 = var_7418903e36376e0b getentitynumber();
                    var_b75ebfa25066fb2a[var_9c38af357b506fe9] = get_int_or_0(var_b75ebfa25066fb2a[var_9c38af357b506fe9]) + 1;
                }
            }
        }
        var_a602d20a8058431c = 0;
        foreach (player in level.players) {
            if (isdefined(player)) {
                playerentnum = player getentitynumber();
                var_f83ee2b3e5c5125d = get_int_or_0(var_b75ebfa25066fb2a[playerentnum]);
                currentcount = player getclientomnvar("ui_br_active_spectators");
                if (var_f83ee2b3e5c5125d != currentcount) {
                    player setclientomnvar("ui_br_active_spectators", var_f83ee2b3e5c5125d);
                }
                var_a602d20a8058431c++;
                if (var_a602d20a8058431c % 10 == 0) {
                    waitframe();
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b7
// Size: 0x54
function waittillspectating(player) {
    while (player.sessionstate != "intermission") {
        waitframe();
    }
    while (player.sessionstate == "intermission") {
        waitframe();
    }
    while (player.sessionstate != "spectator") {
        waitframe();
    }
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a12
// Size: 0x33
function function_393455dde05f567c(player) {
    return isdefined(player) && (player namespace_d3d40f75bb4e4c32::hasrespawntoken() && !namespace_cb965d2f71fefddc::respawntokendisabled() || istrue(player.respawningfromtoken));
}

// Namespace namespace_a88bbb52a237c8a1/namespace_a9c534dc7832aba4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4d
// Size: 0x75
function function_f83bf537661ec58c(winner) {
    var_721982228624d657 = getspectatorsofplayer(winner);
    foreach (spectator in var_721982228624d657) {
        if (isalliedsentient(spectator, winner)) {
            spectator notify("spectated_player_wins_gulag");
        }
    }
}

