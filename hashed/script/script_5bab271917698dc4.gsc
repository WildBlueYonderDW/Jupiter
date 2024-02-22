// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_396a814d39e7044f;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_5bc60484d17fa95c;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_5bab271917698dc4;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_7c40fa80892a721;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_rewards.gsc;
#using script_46cf752d93dc17b;
#using scripts\mp\gametypes\br_skydive_protection.gsc;
#using script_a34750d17473c49;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_930a1e7bd882c1d;
#using scripts\mp\weapons.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_6e6b980bec22af5b;

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xc51
// Size: 0x7d
function br_kioskrevive(var_8f7040e569ec9e98, var_4ac881e2a39322a5, var_57d71760971f748f, var_5806c4765695a2f4, var_74af5908127b6729, var_36f3c4e4a602e257, var_df631fdd92a76bb1, var_b6acf0c07c4311e6) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("kioskRevivePlayer")) {
        var_8f7040e569ec9e98 thread namespace_71073fa38f11492::runbrgametypefunc("kioskRevivePlayer", var_4ac881e2a39322a5);
    } else {
        var_8f7040e569ec9e98 thread namespace_47fd1e79a44628cd::playergulagautowin("br_kioskRevive", var_4ac881e2a39322a5, var_57d71760971f748f, var_5806c4765695a2f4, var_74af5908127b6729, var_36f3c4e4a602e257, var_df631fdd92a76bb1, var_b6acf0c07c4311e6);
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd5
// Size: 0x244
function function_d5ee3d3fad992d43(var_a7e165a26e5ba7e9, var_30a91e1938cfd1b2, var_6ff65a93bb36c6a) {
    player = self;
    if (istrue(level.brgametype.var_6f3c4d74a8c614ab)) {
        player notify("started_spawnPlayer");
    }
    if (isdefined(var_30a91e1938cfd1b2.var_b90bd4c9bef3fb64)) {
        var_c7094f9a17968ab2 = self [[ var_30a91e1938cfd1b2.var_b90bd4c9bef3fb64 ]](var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4);
        if (!istrue(var_c7094f9a17968ab2)) {
            return;
        }
    }
    var_1476e0f78320a501 = 0;
    if (istrue(level.brgametype.var_a916b204f027af6b)) {
        var_1476e0f78320a501 = player playerwaitforprestreaming();
    }
    streamtimeout = namespace_d3d40f75bb4e4c32::getdefaultstreamhinttimeoutms() / 1000;
    if (isdefined(var_6ff65a93bb36c6a)) {
        spawnpoint = var_6ff65a93bb36c6a;
    } else {
        spawnpoint = playergetrespawnpoint(0, streamtimeout);
        if (isdefined(level.br_circle)) {
            circleindex = level.br_circle.circleindex;
            logstring("[br_spawnrespawn] Point chosen: matchTime=" + gettime() / 1000 + " circle=" + circleindex + " spawnType='" + spawnpoint.type + "' timeToSpawn=" + streamtimeout);
        }
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("modifyRespawnPoint")) {
        namespace_71073fa38f11492::runbrgametypefunc("modifyRespawnPoint", spawnpoint, streamtimeout);
    }
    if (isdefined(var_6ff65a93bb36c6a)) {
        var_11f3b4465c8b637b = spawnpoint.origin;
    } else {
        var_11f3b4465c8b637b = playerprestreamrespawnorigin(spawnpoint);
    }
    self.forcespawnorigin = var_11f3b4465c8b637b;
    if (isdefined(var_a7e165a26e5ba7e9)) {
        wait(var_a7e165a26e5ba7e9);
    }
    if (var_1476e0f78320a501) {
        player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    }
    player thread function_334a8fe67e88bbe7();
    player thread function_9ceb26b230856d29();
    player namespace_a9c534dc7832aba4::playerclearspectatekillchainsystem();
    var_b59f471c2c064e56 = 1;
    wait(var_b59f471c2c064e56);
    player namespace_44abc05161e2e2cb::clearsplashqueue();
    player namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    player namespace_f446f6030ca8cff8::_clearexecution();
    player namespace_cb965d2f71fefddc::initplayer();
    player.respawningfromtoken = undefined;
    if (isdefined(var_30a91e1938cfd1b2.var_46ff3a000308206a)) {
        player thread triggerrespawnoverlay(var_30a91e1938cfd1b2.var_46ff3a000308206a);
    }
    if (isdefined(player)) {
        br_respawn(spawnpoint, var_11f3b4465c8b637b, var_30a91e1938cfd1b2);
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf20
// Size: 0x73e
function br_respawn(spawnpoint, var_11f3b4465c8b637b, var_30a91e1938cfd1b2) {
    namespace_ede58c1e66c2c280::calloutmarkerping_removeallcalloutsforplayer();
    if (issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]() && issharedfuncdefined("teamAssim", "enablePlayer")) {
        [[ getsharedfunc("teamAssim", "enablePlayer") ]](self, "player_dead");
    }
    if (issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]() && issharedfuncdefined("teamAssim", "enablePlayer")) {
        [[ getsharedfunc("teamAssim", "enablePlayer") ]](self, "br_gulag");
    }
    var_d4066589fef0017 = 0;
    if (isdefined(var_30a91e1938cfd1b2.var_5b6fe32d0163f96a)) {
        var_d4066589fef0017 = self [[ var_30a91e1938cfd1b2.var_5b6fe32d0163f96a ]](var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4);
    }
    foreach (crate in level.br_pickups.crates) {
        if (!isdefined(crate.var_b3447241cb747d0b)) {
            continue;
        }
        if (array_contains(crate.var_b3447241cb747d0b, self)) {
            crate.var_b3447241cb747d0b = array_remove(crate.var_b3447241cb747d0b, self);
            crate namespace_6c578d6ef48f10ef::function_86f1096305a8c8f9(self);
        }
    }
    level notify("update_circle_hide");
    if (isdefined(self.oobimmunity)) {
        namespace_d9c77dc2a6fe29c6::disableoobimmunity(self);
    }
    namespace_d20f8ef223912e12::givelaststandifneeded(self);
    if (isdefined(level.var_e82dd38d666141db)) {
        self [[ level.var_e82dd38d666141db ]](0);
    }
    if (istrue(var_d4066589fef0017)) {
        return;
    }
    if (!isdefined(spawnpoint)) {
        spawnpoint = playergetrespawnpoint();
    }
    spawnorigin = spawnpoint.origin;
    spawnangles = spawnpoint.angles;
    startorigin = spawnorigin;
    if (isdefined(var_11f3b4465c8b637b)) {
        startorigin = var_11f3b4465c8b637b;
    }
    function_961b4afc4c695b94();
    function_ab31cf673d70f72d(startorigin, spawnangles);
    linker = spawn("script_model", startorigin);
    linker setmodel("tag_origin");
    linker.angles = spawnangles;
    linker hide();
    linker showtoplayer(self);
    self playerlinktoabsolute(linker, "tag_origin");
    function_a593971d75d82113();
    function_379bb555405c16bb("br_spawnrespawn::br_respawn()");
    thread playercleanupentondisconnect(linker);
    waitframe();
    if (getdvar(@"hash_87485eca39b418a6") == "1" && !isbot(self) && namespace_36f464722d326bbe::function_ba5574c7f287c587() && !istrue(self.gulag)) {
        namespace_99ac021a7547cae3::function_8f1890d7f6b565c4();
    }
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(var_30a91e1938cfd1b2.respawncleanup)) {
        self [[ var_30a91e1938cfd1b2.respawncleanup ]](var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4);
    }
    if (getdvarint(@"hash_df02345c60008647", 1) == 0) {
        namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    }
    /#
        while (getdvarint(@"hash_e43719f8cb449c07", 0) != 0) {
            waitframe();
        }
    #/
    namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
    if (isdefined(var_11f3b4465c8b637b)) {
        linker.origin = spawnorigin;
    }
    namespace_4887422e77f3514e::function_a2b4e6088394bade();
    self clearsoundsubmix("iw9_mp_killcam");
    wait(0.5);
    if (isdefined(var_30a91e1938cfd1b2.var_95c583a6d556569a)) {
        linker playsoundtoplayer(var_30a91e1938cfd1b2.var_95c583a6d556569a, self);
    }
    wait(1);
    if (!isdefined(self)) {
        return;
    }
    if (!self islinked()) {
        namespace_8bfdb6eb5a3df67a::function_ab31cf673d70f72d(spawnorigin, spawnangles);
        /#
            namespace_9c840bb9f2ecbf00::demoforcesre("respawn_fade_from_black" + self.name + "respawn");
        #/
    }
    self unlink();
    self clearclienttriggeraudiozone(1);
    if (namespace_d3d40f75bb4e4c32::isbrpracticemode()) {
        self clearsoundsubmix("iw8_br_gulag_tutorial", 2);
    } else {
        self clearsoundsubmix("solo_cin_igc_music", 2);
    }
    function_6fb380927695ee76(1);
    function_d669022f6cd65402(1);
    falltime = 0;
    if (isdefined(level.parachutedeploydelay)) {
        falltime = level.parachutedeploydelay;
    }
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf() && !istrue(self.isjuggernaut)) {
        thread namespace_5078ee98abb32db9::startfreefall(falltime, 0, undefined, undefined, 1);
    } else if (istrue(self.isjuggernaut)) {
        self skydive_setbasejumpingstatus(0);
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        self setclientomnvar("ui_show_spectateHud", -1);
        self setclientomnvar("ui_cash_dropped", 0);
    }
    resetplayermovespeedscale();
    if (isdefined(var_30a91e1938cfd1b2.var_104e34b87a973660)) {
        thread namespace_8bfdb6eb5a3df67a::triggerrespawnoverlay(var_30a91e1938cfd1b2.var_104e34b87a973660);
    }
    if (istrue(var_30a91e1938cfd1b2.var_3bd8653773757c7)) {
        self setclientomnvar("ui_br_transition_type", 0);
    }
    if (!namespace_71073fa38f11492::isfeaturedisabled("armor") && !istrue(var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4.var_ab53d8433a949828)) {
        var_968bd61837a9c038 = getmatchrulesdata("commonOption", "respawnArmor");
        if (isdefined(self.overriderespawnarmor)) {
            var_968bd61837a9c038 = self.overriderespawnarmor;
            self.overriderespawnarmor = undefined;
        }
        var_381776cae951da48 = getdvarint(@"hash_8b8e8245086efdd1", 0);
        namespace_f8d3520d3483c1::givestartingarmor(var_968bd61837a9c038, undefined, var_381776cae951da48);
    }
    namespace_1eb3c4e0e28fac71::onplayerrespawn();
    namespace_4bc0ead8d2af3d84::onplayerrespawn();
    namespace_c3059e55bc606259::onplayerrespawn();
    namespace_fd99f400a596934b::function_f5d7f1682f6fc578();
    level callback::callback(#"hash_2bdabaeb3b833ac", {player:self});
    if (isdefined(var_30a91e1938cfd1b2.onrespawn)) {
        self [[ var_30a91e1938cfd1b2.onrespawn ]](var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4);
    }
    wait(0.5);
    if (!isdefined(self)) {
        return;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        thread function_e68e4bb4f65f5fe4();
    }
    self notify("respawn_fade_from_black");
    thread namespace_d20f8ef223912e12::function_467380e90c7db5a7();
    waitframe();
    linker delete();
    if (istrue(level.var_3ff7c73209fcf59d)) {
        namespace_250014dec221561c::function_fa674fb6e8372620();
    }
    if (namespace_d3d40f75bb4e4c32::isbrpracticemode()) {
        self notify("respawn_from_gulag");
    }
    self notify("can_show_splashes");
    if (!istrue(level.ignoregulagredeploysplash) && isdefined(var_30a91e1938cfd1b2.var_4a8a68afccfa6692)) {
        thread namespace_44abc05161e2e2cb::showsplash(var_30a91e1938cfd1b2.var_4a8a68afccfa6692, var_30a91e1938cfd1b2.var_24fbc5c0da36ef41, undefined, undefined, undefined, var_30a91e1938cfd1b2.var_748a99415228de0e);
    }
    if (isdefined(var_30a91e1938cfd1b2.var_dd58a7afdb07f8cd)) {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer(var_30a91e1938cfd1b2.var_dd58a7afdb07f8cd, self, undefined, undefined, 0, undefined, var_30a91e1938cfd1b2.var_a256bbf96994aad1);
    }
    if (isdefined(var_30a91e1938cfd1b2.var_3be6a6420b9e919)) {
        self [[ var_30a91e1938cfd1b2.var_3be6a6420b9e919 ]](var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4);
    }
    if (function_7ba31cb6b21c346f()) {
        if (isdefined(var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4.var_4ac881e2a39322a5) && var_30a91e1938cfd1b2.var_9fdc1f9e4fc628e4.var_4ac881e2a39322a5 != self) {
            thread function_36edf91561322753(1);
        }
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1665
// Size: 0x65
function function_ade48af7c782e202(var_441bcd0ba1507f10, soundalias, var_3bd8653773757c7) {
    rs = spawnstruct();
    rs.respawncleanup = var_441bcd0ba1507f10;
    rs.var_95c583a6d556569a = soundalias;
    rs.var_3bd8653773757c7 = var_3bd8653773757c7;
    rs.var_9fdc1f9e4fc628e4 = spawnstruct();
    return rs;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d2
// Size: 0x16
function function_9fd565bcd654ed48(var_70611a166496b64f) {
    self.var_b90bd4c9bef3fb64 = var_70611a166496b64f;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ef
// Size: 0x28
function function_b4c313df5d7fb216(var_423dd9037c2efe0d, var_46ff3a000308206a) {
    self.var_5b6fe32d0163f96a = var_423dd9037c2efe0d;
    self.var_46ff3a000308206a = var_46ff3a000308206a;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171e
// Size: 0x28
function function_8cb232cdf47da79c(var_f3255509dc99ae6b, var_104e34b87a973660) {
    self.onrespawn = var_f3255509dc99ae6b;
    self.var_104e34b87a973660 = var_104e34b87a973660;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174d
// Size: 0x17e
function function_2556973693d6315(var_63eedd53df6143ea, var_4a8a68afccfa6692, var_24fbc5c0da36ef41, var_748a99415228de0e, var_dd58a7afdb07f8cd, var_a256bbf96994aad1) {
    self.var_3be6a6420b9e919 = ter_op(isdefined(level.brgametype.var_63eedd53df6143ea), level.brgametype.var_63eedd53df6143ea, var_63eedd53df6143ea);
    self.var_4a8a68afccfa6692 = ter_op(isdefined(level.brgametype.var_4a8a68afccfa6692), level.brgametype.var_4a8a68afccfa6692, var_4a8a68afccfa6692);
    self.var_24fbc5c0da36ef41 = ter_op(isdefined(level.brgametype.var_24fbc5c0da36ef41), level.brgametype.var_24fbc5c0da36ef41, var_24fbc5c0da36ef41);
    self.var_748a99415228de0e = ter_op(isdefined(level.brgametype.var_748a99415228de0e), level.brgametype.var_748a99415228de0e, var_748a99415228de0e);
    self.var_dd58a7afdb07f8cd = ter_op(isdefined(level.brgametype.var_dd58a7afdb07f8cd), level.brgametype.var_dd58a7afdb07f8cd, var_dd58a7afdb07f8cd);
    self.var_a256bbf96994aad1 = ter_op(isdefined(level.brgametype.var_a256bbf96994aad1), level.brgametype.var_a256bbf96994aad1, var_a256bbf96994aad1);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d2
// Size: 0x194
function playerhandlesponsor(var_4ac881e2a39322a5, var_57d71760971f748f, var_74af5908127b6729, var_899beb1fc66d0ec6, var_36f3c4e4a602e257, context) {
    player = self;
    var_84e2123aaca9a965 = player;
    var_df2fbb13c226be75 = "token";
    if (isdefined(var_4ac881e2a39322a5)) {
        var_473d8d8843d86e8d = istrue(player.br_iseliminated) && !isalive(player) && istrue(player.wasingulag);
        /#
            assert(isplayer(var_4ac881e2a39322a5));
        #/
        if (istrue(var_36f3c4e4a602e257)) {
            /#
                assert(istrue(player.gulag) && !isalive(player));
            #/
        } else {
            /#
                assert(player namespace_d3d40f75bb4e4c32::iseligibleforteamrevive() || var_473d8d8843d86e8d);
            #/
        }
        var_84e2123aaca9a965 = var_4ac881e2a39322a5;
        var_df2fbb13c226be75 = "token_sponsored";
        if (!istrue(var_899beb1fc66d0ec6)) {
            if (istrue(var_57d71760971f748f)) {
                var_106d02e26e82a4cf = 6;
            } else {
                var_106d02e26e82a4cf = 10;
            }
            player thread triggerrespawnoverlay(var_106d02e26e82a4cf);
        }
    }
    if (isdefined(var_4ac881e2a39322a5) || istrue(var_74af5908127b6729)) {
        if (!array_contains(level.teamdata[player.team]["alivePlayers"], player)) {
            player namespace_99ac021a7547cae3::addtoalivecount(context);
        }
        namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player, context);
    }
    namespace_a011fbf6d93f25e5::branalytics_gulagstart(player, var_df2fbb13c226be75);
    namespace_a011fbf6d93f25e5::branalytics_respawn(self, int(isdefined(var_4ac881e2a39322a5)));
    if (istrue(var_84e2123aaca9a965.hasrespawntoken)) {
        var_84e2123aaca9a965 namespace_cb965d2f71fefddc::removerespawntoken();
    }
    return [0:var_84e2123aaca9a965, 1:var_df2fbb13c226be75];
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6e
// Size: 0x4b
function playerwaitforprestreaming() {
    player = self;
    var_1476e0f78320a501 = istrue(player.prestreamingspectatetarget);
    if (var_1476e0f78320a501) {
        player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_standby_for_respawn");
        while (istrue(player.prestreamingspectatetarget)) {
            waitframe();
        }
    }
    return var_1476e0f78320a501;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac1
// Size: 0x51
function playerprestreamrespawnorigin(spawnpoint, timeoutms) {
    droporigin = namespace_d3d40f75bb4e4c32::playerstreamhintdroptoground(spawnpoint.origin, spawnpoint.height);
    self setpredictedstreamloaddist(0);
    namespace_d3d40f75bb4e4c32::playerstreamhintlocation(droporigin, timeoutms);
    return droporigin;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1a
// Size: 0xf
function function_961b4afc4c695b94() {
    self setallstreamloaddist(0);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b30
// Size: 0x6a
function function_ab31cf673d70f72d(origin, angles) {
    self cancelmantle();
    if (!isdefined(self.sessionstate) || self.sessionstate != "spectator") {
        namespace_71073fa38f11492::function_d72afaccedfc946e("onPlayerTeleport", self, self.origin, origin, "respawn");
        self setorigin(origin, 1);
        self setplayerangles(angles);
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba1
// Size: 0x8b
function function_b70d7f3bdddd33fd(testpos) {
    var_a80e089f93dcd3a4 = isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent);
    if (!var_a80e089f93dcd3a4) {
        return 1;
    }
    if (namespace_bbc79db4c3949a5c::function_d987886bb9de9137() > 1) {
        return namespace_bbc79db4c3949a5c::function_27779e30fe4c0d62(testpos);
    }
    safeorigin = namespace_c5622898120e827f::getsafecircleorigin();
    var_f434d604c09196aa = namespace_c5622898120e827f::getsafecircleradius();
    dist = distance2d(testpos, safeorigin);
    return dist < var_f434d604c09196aa;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c34
// Size: 0x8b
function function_82ab584ac2a991b7(testpos) {
    var_a80e089f93dcd3a4 = isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent);
    if (!var_a80e089f93dcd3a4) {
        return 1;
    }
    if (namespace_bbc79db4c3949a5c::function_d987886bb9de9137() > 1) {
        return namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(testpos);
    }
    var_ef8f7e66dc0feb2c = namespace_c5622898120e827f::getdangercircleorigin();
    dangerradius = namespace_c5622898120e827f::getdangercircleradius();
    dist = distance2d(testpos, var_ef8f7e66dc0feb2c);
    return dist < dangerradius;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc7
// Size: 0x1c0
function function_61b5424aa3fe974e(testpos, timeuntilspawn, var_40cb6248dee31807) {
    if (!namespace_ad389306d44fc6b4::ispointinbounds(testpos, 1)) {
        return 0;
    }
    if (istrue(var_40cb6248dee31807)) {
        if (namespace_c5622898120e827f::_ispointinbadarea(testpos)) {
            return 0;
        }
    }
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.safecircleent) || !isdefined(level.br_circle.dangercircleent)) {
        return 1;
    }
    if (namespace_bbc79db4c3949a5c::function_d8fbacc18e5d8498() && namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(testpos)) {
        return 1;
    }
    var_d6f728b66bd3966 = namespace_c5622898120e827f::function_d6f728b66bd3966(level.br_circle.circleindex);
    if (!var_d6f728b66bd3966 && function_b70d7f3bdddd33fd(testpos)) {
        return 1;
    }
    if (!function_82ab584ac2a991b7(testpos)) {
        return 0;
    }
    if (isdefined(timeuntilspawn)) {
        var_653bf8aef0b21244 = namespace_c5622898120e827f::getmintimetillpointindangercircle(testpos);
        if (timeuntilspawn > var_653bf8aef0b21244) {
            return 0;
        }
    }
    safeorigin = namespace_c5622898120e827f::getsafecircleorigin();
    var_f434d604c09196aa = namespace_c5622898120e827f::getsafecircleradius();
    var_ef8f7e66dc0feb2c = namespace_c5622898120e827f::getdangercircleorigin();
    dangerradius = namespace_c5622898120e827f::getdangercircleradius();
    var_a1f3366ddb6d1b0a = length(var_ef8f7e66dc0feb2c - safeorigin);
    var_eb45834677a22f12 = vectornormalize(var_ef8f7e66dc0feb2c - safeorigin);
    var_1de6caaeaf5f81ba = level.respawncircleinterppct;
    var_3a7066356862f921 = safeorigin + var_eb45834677a22f12 * var_a1f3366ddb6d1b0a * var_1de6caaeaf5f81ba;
    var_d29771ba9e188f0d = var_f434d604c09196aa + (dangerradius - var_f434d604c09196aa) * var_1de6caaeaf5f81ba;
    dist = distance2d(testpos, var_3a7066356862f921);
    return dist < var_d29771ba9e188f0d;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8f
// Size: 0x5c
function isplayervalidrespawntarget(player, timeuntilspawn) {
    if (player == self) {
        return 0;
    }
    if (!isalive(player) || player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() || istrue(player.br_iseliminated)) {
        return 0;
    }
    if (!function_61b5424aa3fe974e(player.origin, timeuntilspawn)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef3
// Size: 0x4a4
function playergetbestrespawnteammate(var_447913206d1f7916, timeuntilspawn, var_e4e4ac01db0be398, var_611c5ca846e66cf) {
    var_df1b054c1838d0de = undefined;
    if (istrue(level.onlinegame) && isdefined(self) && self getprivatepartysize()) {
        var_efd570582b503c0f = undefined;
        foreach (var_7eef32a705de8bee in self getfireteammembers()) {
            if (istrue(var_611c5ca846e66cf) && isbot(var_7eef32a705de8bee)) {
                continue;
            }
            if (!isplayervalidrespawntarget(var_7eef32a705de8bee, timeuntilspawn)) {
                continue;
            }
            var_efd570582b503c0f = var_7eef32a705de8bee;
            if (var_7eef32a705de8bee isfireteamleader()) {
                break;
            }
        }
        if (isdefined(var_efd570582b503c0f) && istrue(var_447913206d1f7916)) {
            var_df1b054c1838d0de = var_efd570582b503c0f;
            var_efd570582b503c0f = undefined;
            foreach (var_7eef32a705de8bee in self getfireteammembers()) {
                if (istrue(var_611c5ca846e66cf) && isbot(var_7eef32a705de8bee)) {
                    continue;
                }
                if (isdefined(var_df1b054c1838d0de) && var_df1b054c1838d0de == var_7eef32a705de8bee) {
                    continue;
                }
                if (!isplayervalidrespawntarget(var_7eef32a705de8bee, timeuntilspawn)) {
                    continue;
                }
                var_efd570582b503c0f = var_7eef32a705de8bee;
                if (var_7eef32a705de8bee isfireteamleader()) {
                    break;
                }
            }
        }
        if (isdefined(var_efd570582b503c0f)) {
            return var_efd570582b503c0f;
        }
    }
    if (isdefined(self.lastdeathpos)) {
        var_cd8409952c0be5c8 = undefined;
        closestdist = undefined;
        players = namespace_54d20dd0dd79277f::getfriendlyplayers(self.team, 1);
        foreach (player in players) {
            if (istrue(var_611c5ca846e66cf) && isbot(player)) {
                continue;
            }
            if (isdefined(var_df1b054c1838d0de) && var_df1b054c1838d0de == player) {
                continue;
            }
            if (!isplayervalidrespawntarget(player, timeuntilspawn)) {
                continue;
            }
            if (player isparachuting() || player isskydiving()) {
                continue;
            }
            var_12810e24e83acb1d = distance2dsquared(self.lastdeathpos, player.origin);
            if (!isdefined(closestdist) || var_12810e24e83acb1d < closestdist) {
                var_cd8409952c0be5c8 = player;
                closestdist = var_12810e24e83acb1d;
            }
        }
        if (isdefined(var_cd8409952c0be5c8) && istrue(var_447913206d1f7916) && !isdefined(var_df1b054c1838d0de)) {
            var_df1b054c1838d0de = var_cd8409952c0be5c8;
            var_cd8409952c0be5c8 = undefined;
            closestdist = undefined;
            foreach (player in players) {
                if (istrue(var_611c5ca846e66cf) && isbot(player)) {
                    continue;
                }
                if (isdefined(var_df1b054c1838d0de) && var_df1b054c1838d0de == player) {
                    continue;
                }
                if (!isplayervalidrespawntarget(player, timeuntilspawn)) {
                    continue;
                }
                if (player isparachuting() || player isskydiving()) {
                    continue;
                }
                var_12810e24e83acb1d = distance2dsquared(self.lastdeathpos, player.origin);
                if (!isdefined(closestdist) || var_12810e24e83acb1d < closestdist) {
                    var_cd8409952c0be5c8 = player;
                    closestdist = var_12810e24e83acb1d;
                }
            }
        }
        if (isdefined(var_cd8409952c0be5c8)) {
            return var_cd8409952c0be5c8;
        }
    }
    var_cd8409952c0be5c8 = undefined;
    var_517e15e5e8524c5a = array_randomize(level.teamdata[self.team]["alivePlayers"]);
    foreach (squadmember in var_517e15e5e8524c5a) {
        if (istrue(var_611c5ca846e66cf) && isbot(squadmember)) {
            continue;
        }
        if (isdefined(var_df1b054c1838d0de) && var_df1b054c1838d0de == squadmember) {
            continue;
        }
        if (!isplayervalidrespawntarget(squadmember, timeuntilspawn)) {
            continue;
        }
        var_cd8409952c0be5c8 = squadmember;
        if (istrue(squadmember namespace_d3d40f75bb4e4c32::isplayerbrsquadleader())) {
            break;
        }
    }
    if (isdefined(var_cd8409952c0be5c8)) {
        return var_cd8409952c0be5c8;
    } else if (!istrue(var_e4e4ac01db0be398)) {
        if (getsubgametype() == "plunder" || getsubgametype() == "risk") {
            teamcount = getteamdata(self.team, "teamCount");
            if (teamcount == 1 && !istrue(self.disconnecting) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(self.origin)) {
                return self;
            }
        }
    }
    return undefined;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239f
// Size: 0xa8
function function_c3ad6aae08369e12() {
    teammates = level.teamdata[self.team]["players"];
    foreach (squadmember in teammates) {
        if (squadmember == self) {
            continue;
        }
        var_b3070bb45ec5b461 = squadmember.forcespawnorigin;
        if (!isdefined(var_b3070bb45ec5b461)) {
            var_b3070bb45ec5b461 = squadmember.var_f9792c4242dc4625;
        }
        if (!isdefined(var_b3070bb45ec5b461)) {
            continue;
        }
        return var_b3070bb45ec5b461;
    }
    return undefined;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244f
// Size: 0x222
function getsafeoriginaroundpoint(point, var_c4000fd1c78d0587, timeuntilspawn, var_40cb6248dee31807) {
    var_974dda820500e74a = 3.14159;
    var_a9aecd1f10a3ac37 = namespace_bbc79db4c3949a5c::function_de2f1b656ee04ba9();
    foreach (safeorigin in var_a9aecd1f10a3ac37) {
        var_cee024d90697bb29 = vectornormalize(point - safeorigin);
        ang = vectortoangles(var_cee024d90697bb29);
        randomyaw = randomfloatrange(getdvarfloat(@"hash_83a1498acddbc2fa", 0), getdvarfloat(@"hash_83c5338ace040d50", 359));
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            dir = var_cee024d90697bb29;
        } else {
            dir = vectornormalize(anglestoforward(ang + (0, ter_op(cointoss(), randomyaw, randomyaw * -1), 0)));
        }
        origin = point + dir * var_c4000fd1c78d0587;
        if (function_61b5424aa3fe974e(origin, timeuntilspawn, var_40cb6248dee31807)) {
            return origin;
        }
        dir = dir * -1;
        origin = point + dir * var_c4000fd1c78d0587;
        if (function_61b5424aa3fe974e(origin, timeuntilspawn, var_40cb6248dee31807)) {
            return origin;
        }
        dir = vectornormalize(safeorigin - point);
        origin = point + dir * var_c4000fd1c78d0587;
        if (function_61b5424aa3fe974e(origin, timeuntilspawn, var_40cb6248dee31807)) {
            return origin;
        }
        var_b2867fe57bb578af = var_c4000fd1c78d0587;
        radius = distance2d(point, safeorigin);
        angle = var_b2867fe57bb578af / radius;
        if (angle > var_974dda820500e74a) {
            angle = var_974dda820500e74a;
        }
        var_44dffbe9663df3f0 = angle * 180 / var_974dda820500e74a;
        origin = rotatepointaroundvector((0, 0, 1), point - safeorigin, var_44dffbe9663df3f0) + safeorigin;
        if (function_61b5424aa3fe974e(origin, timeuntilspawn, var_40cb6248dee31807)) {
            return origin;
        }
        origin = namespace_c5622898120e827f::getrandompointincircle(point, var_c4000fd1c78d0587);
        if (function_61b5424aa3fe974e(origin, timeuntilspawn, var_40cb6248dee31807)) {
            return origin;
        }
    }
    return undefined;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2679
// Size: 0x1f1
function playergetbestrespawnmissionorigin() {
    if (namespace_71073fa38f11492::isfeaturedisabled("missions")) {
        return undefined;
    }
    contract = namespace_1eb3c4e0e28fac71::function_22239d4cff05d0a1(self.team);
    if (isdefined(contract)) {
        switch (contract.type.ref) {
        case #"hash_96e641d7fe5b1cf1":
            if (isdefined(contract.targetplayer)) {
                return contract.targetplayer.origin;
            }
            break;
        case #"hash_1cc92bad632fbc15":
            if (isdefined(contract.domflag) && isdefined(contract.domflag.curorigin)) {
                return contract.domflag.curorigin;
            }
            break;
        case #"hash_5c57b61aa79410db":
            if (isdefined(contract.caches) && isdefined(contract.caches[contract.var_3bb6053db23449])) {
                return contract.caches[contract.var_3bb6053db23449].origin;
            }
            break;
        case #"hash_218ddcea32fa5fbc":
            if (isdefined(contract.var_9aa953016facacc)) {
                return contract.var_9aa953016facacc.origin;
            }
            break;
        case #"hash_3684a21686064f80":
        case #"hash_69146251ab5ca13a":
            break;
        case #"hash_4f0e37558d043245":
        case #"hash_7b0c576c4a7e4890":
        case #"hash_96815ed47cc355cf":
        case #"hash_cc7c1c701864c7bf":
        case #"hash_d0eb8b9de6742b83":
        case #"hash_de61e484b9734ea1":
            break;
        default:
            /#
                assertmsg("Unhandled mission type: " + contract.type);
            #/
            break;
        }
    }
    return undefined;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2872
// Size: 0xdf
function playergetbestdropbagorigin(timeuntilspawn) {
    foreach (crate in level.br_pickups.crates) {
        if (!isdefined(crate) || !isdefined(crate.team) || crate.team != self.team) {
            continue;
        }
        if (isdefined(crate.playerscaptured) && isdefined(crate.playerscaptured[self getentitynumber()])) {
            continue;
        }
        if (function_61b5424aa3fe974e(crate.origin, timeuntilspawn)) {
            return crate.origin;
        }
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2958
// Size: 0xf74
function playergetrespawnpoint(var_447913206d1f7916, timeuntilspawn, var_f9a785628f97eec6) {
    spawnorigin = undefined;
    spawnangles = undefined;
    height = var_f9a785628f97eec6;
    var_53480b10269770a5 = 1;
    spawntype = "";
    if (isdefined(self.setspawnpoint)) {
        spawnorigin = self.setspawnpoint.playerspawnpos;
        spawnangles = self.setspawnpoint.playerspawnangles;
        spawntype = "setSpawnPoint";
    }
    if (level.var_6bed852a909e4f70 == 1 || level.var_6bed852a909e4f70 == 2) {
        spawnpoint = spawnstruct();
        spawnpoint.origin = level.prematchspawnorigins[0].origin;
        spawnpoint.angles = (0, 0, 0);
        spawnpoint.height = 0;
        return spawnpoint;
    }
    var_f6ac3c609e85cb74 = getdvarfloat(@"hash_b3366fb6bbcd6dab", -1);
    if (!isdefined(spawnorigin) && var_f6ac3c609e85cb74 >= 0 && isdefined(self.lastdeathpos)) {
        startorigin = getsafeoriginaroundpoint(self.lastdeathpos, var_f6ac3c609e85cb74, timeuntilspawn);
        if (isdefined(startorigin)) {
            spawnorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(startorigin);
            spawnangles = getanglesfacingorigin(spawnorigin, startorigin);
            spawntype = "lastDeath";
        }
    }
    var_f6ac3c609e85cb74 = getdvarfloat(@"hash_8d9ad523f40be455", 1000);
    if (!isdefined(spawnorigin) && var_f6ac3c609e85cb74 >= 0) {
        var_b4e45dbe012f4a40 = playergetbestrespawnteammate(var_447913206d1f7916, timeuntilspawn);
        if (isdefined(var_b4e45dbe012f4a40)) {
            var_b1959d90f987e135 = getdvarfloat(@"hash_879a2fde5543837", 5) * 1000;
            var_6e6b11a5415dc87 = getdvarfloat(@"hash_5845ae9020002373", 30) * 1000;
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            if ((brgametype == "plunder" || brgametype == "risk" || brgametype == "kingslayer") && isdefined(level.teamdata[self.team]["lastParachuteTime"]) && level.teamdata[self.team]["lastParachuteTime"] + var_6e6b11a5415dc87 > gettime() + var_b1959d90f987e135 && distance2d(level.teamdata[self.team]["lastParachuteOrigin"], var_b4e45dbe012f4a40.origin) < getdvarfloat(@"hash_8d9ad523f40be455", 1000) * 1.25) {
                spawnorigin = level.teamdata[self.team]["lastParachuteOrigin"];
                spawnangles = level.teamdata[self.team]["lastParachuteAngles"];
                spawntype = "abovePlayerCached";
            } else {
                var_40cb6248dee31807 = getdvarint(@"hash_899e9302a5910263", 1) == 1;
                spawnorigin = getsafeoriginaroundpoint(var_b4e45dbe012f4a40.origin, var_f6ac3c609e85cb74, timeuntilspawn, var_40cb6248dee31807);
                if (isdefined(spawnorigin)) {
                    spawnorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnorigin);
                    spawnangles = getanglesfacingorigin(spawnorigin, var_b4e45dbe012f4a40.origin);
                    spawntype = "abovePlayer";
                    level.teamdata[self.team]["lastParachuteOrigin"] = spawnorigin;
                    level.teamdata[self.team]["lastParachuteAngles"] = spawnangles;
                    level.teamdata[self.team]["lastParachuteTime"] = gettime();
                }
            }
        }
        if (!isdefined(spawnorigin) && !namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            var_4a1a29ca5d2a5a9f = function_c3ad6aae08369e12();
            if (isdefined(var_4a1a29ca5d2a5a9f)) {
                spawnorigin = getsafeoriginaroundpoint(var_4a1a29ca5d2a5a9f, var_f6ac3c609e85cb74, timeuntilspawn);
                if (isdefined(spawnorigin)) {
                    spawnorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnorigin);
                    spawnangles = getanglesfacingorigin(spawnorigin, var_4a1a29ca5d2a5a9f);
                    spawntype = "respawningTeammate";
                }
            }
        }
    }
    var_f6ac3c609e85cb74 = getdvarfloat(@"hash_721aa1f6148749eb", 3000);
    if (!isdefined(spawnorigin) && var_f6ac3c609e85cb74 >= 0) {
        missionorigin = playergetbestrespawnmissionorigin();
        if (isdefined(missionorigin)) {
            spawnorigin = getsafeoriginaroundpoint(missionorigin, var_f6ac3c609e85cb74, timeuntilspawn);
            spawnangles = getanglesfacingorigin(spawnorigin, missionorigin);
            spawntype = "missionOrigin";
        }
    }
    var_f6ac3c609e85cb74 = getdvarfloat(@"hash_5243c598e26f304a", 3000);
    if (!isdefined(spawnorigin) && var_f6ac3c609e85cb74 >= 0) {
        var_8c4038f0270de13e = playergetbestdropbagorigin(timeuntilspawn);
        if (isdefined(var_8c4038f0270de13e)) {
            spawnorigin = getsafeoriginaroundpoint(var_8c4038f0270de13e, var_f6ac3c609e85cb74, timeuntilspawn);
            spawnangles = getanglesfacingorigin(spawnorigin, var_8c4038f0270de13e);
            spawntype = "dropBagOrigin";
        }
    }
    if (!isdefined(spawnorigin) && namespace_71073fa38f11492::isbrgametypefuncdefined("playerGetRespawnPoint")) {
        spawnorigin = namespace_71073fa38f11492::function_d72afdccedfc9b07("playerGetRespawnPoint", var_447913206d1f7916, timeuntilspawn, var_f9a785628f97eec6);
        spawntype = "brGameTypeFunc";
    }
    if (!isdefined(spawnorigin)) {
        if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
            var_a26567d70b7326ae = namespace_bbc79db4c3949a5c::function_d8fbacc18e5d8498();
            if (getdvarint(@"hash_89fd9a93b31a5cf2", 0) && !istrue(var_a26567d70b7326ae)) {
                timeoffset = getdvarfloat(@"hash_45c8ae384e9d6b92", 2);
                spawnorigin = namespace_c5622898120e827f::function_bf5f4d7a498988a8(self, timeuntilspawn, timeoffset);
                spawntype = "pointFromSquadmate";
            }
            if (!isdefined(spawnorigin)) {
                var_1848ffdbd8a2e93e = getdvarfloat(@"hash_2fc319e6652da3d9", 0.9);
                if (getdvarint(@"hash_f1d47ddb5b62548b", 1)) {
                    spawnorigin = namespace_c5622898120e827f::function_fc52ae1478a8fc25(var_1848ffdbd8a2e93e, timeuntilspawn);
                    spawntype = "perimeterPointFromSquadmate";
                }
                if (!isdefined(spawnorigin) && getdvarint(@"hash_ef1ac888d0efeb04", 1)) {
                    spawnorigin = namespace_c5622898120e827f::function_bf16029a7b6ff1fa(var_1848ffdbd8a2e93e, timeuntilspawn);
                    spawntype = "perimeterPointFromLoadout";
                }
                if (isdefined(spawnorigin)) {
                    spawnangles = getanglesfacingorigin(namespace_c5622898120e827f::getsafecircleorigin(), spawnorigin);
                    var_ddc96f0e004ac435 = 0;
                    if (getdvarint(@"hash_43845157c16d2358", 1)) {
                        baseorigin = namespace_c5622898120e827f::getdangercircleorigin();
                        var_40cb6248dee31807 = getdvarint(@"hash_6094db79787dea90", 1) == 1;
                        var_ddc96f0e004ac435 = -90;
                        var_87cef474127de542 = 10;
                        if (cointoss()) {
                            var_ddc96f0e004ac435 = -1 * var_ddc96f0e004ac435;
                            var_87cef474127de542 = -1 * var_87cef474127de542;
                        }
                        var_1cfccac3e5778bbb = rotatevector(spawnorigin - baseorigin, (0, var_87cef474127de542, 0)) + baseorigin;
                        if (namespace_c5622898120e827f::isvalidpointinbounds(var_1cfccac3e5778bbb, var_40cb6248dee31807, timeuntilspawn)) {
                            spawnorigin = var_1cfccac3e5778bbb;
                        } else {
                            var_ddc96f0e004ac435 = -1 * var_ddc96f0e004ac435;
                            var_87cef474127de542 = -1 * var_87cef474127de542;
                            var_1cfccac3e5778bbb = rotatevector(spawnorigin - baseorigin, (0, var_87cef474127de542, 0)) + baseorigin;
                            if (namespace_c5622898120e827f::isvalidpointinbounds(var_1cfccac3e5778bbb, var_40cb6248dee31807, timeuntilspawn)) {
                                spawnorigin = var_1cfccac3e5778bbb;
                            } else {
                                var_ddc96f0e004ac435 = 0;
                            }
                        }
                    }
                    yaw = angleclamp(spawnangles[1] + var_ddc96f0e004ac435);
                    spawnangles = (0, yaw, 0);
                }
            }
            if (!isdefined(spawnorigin)) {
                origin = namespace_c5622898120e827f::getsafecircleorigin();
                radius = namespace_c5622898120e827f::getsafecircleradius();
                if (istrue(var_a26567d70b7326ae)) {
                    origin = namespace_c5622898120e827f::getdangercircleorigin();
                    radius = namespace_c5622898120e827f::getdangercircleradius();
                } else if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(origin)) {
                    origin = namespace_c5622898120e827f::getdangercircleorigin();
                }
                var_8970ef161276a714 = getdvarfloat(@"hash_8eb0ced475a9baf1", 0.5);
                var_1848ffdbd8a2e93e = getdvarfloat(@"hash_4e9825c71ceb94ff", 0.9);
                droptoground = getdvarint(@"hash_951c7b13ffdd6905", 1);
                var_38a4c729748ad94c = getdvarint(@"hash_7017ad29dbedc8b1", 1);
                var_40cb6248dee31807 = getdvarint(@"hash_7371a5983f296bd6", 1);
                spawnorigin = namespace_c5622898120e827f::getrandompointinboundscircle(origin, radius, var_8970ef161276a714, var_1848ffdbd8a2e93e, droptoground, var_38a4c729748ad94c, var_40cb6248dee31807, timeuntilspawn);
                spawntype = "randomPointInBounds";
            }
        } else if (isdefined(level.prematchspawnorigins)) {
            if (isdefined(level.teamdata[self.team]["chosenSpawnWipeOrigin"]) && isdefined(level.teamdata[self.team]["spawnWipeOriginUseStartTime"]) && isdefined(level.autorespawnwaittime) && level.teamdata[self.team]["spawnWipeOriginUseStartTime"] + level.autorespawnwaittime * 1000 > gettime()) {
                spawnorigin = level.teamdata[self.team]["chosenSpawnWipeOrigin"];
                spawntype = "chosenOrigin";
            } else {
                var_24a1d3cb9d6d7992 = [];
                foreach (struct in level.prematchspawnorigins) {
                    if (distance2dsquared(struct.origin, self.origin) > var_f6ac3c609e85cb74) {
                        var_24a1d3cb9d6d7992[var_24a1d3cb9d6d7992.size] = struct;
                    }
                }
                if (var_24a1d3cb9d6d7992.size == 0) {
                    var_24a1d3cb9d6d7992 = level.prematchspawnorigins;
                }
                var_24a1d3cb9d6d7992 = array_randomize(var_24a1d3cb9d6d7992);
                spawnorigin = var_24a1d3cb9d6d7992[0].origin;
                spawnorigin = spawnorigin + namespace_d3f3cb0a543667c1::random_vector_2d() * randomfloatrange(100, 500);
                spawntype = "randomPotential";
                level.teamdata[self.team]["chosenSpawnWipeOrigin"] = spawnorigin;
                level.teamdata[self.team]["spawnWipeOriginUseStartTime"] = gettime();
            }
            spawnangles = (0, 0, 0);
            if (spawnorigin[2] > 10000) {
                var_53480b10269770a5 = 0;
                height = namespace_81156089ff1fe819::getinfilspawnoffset();
            }
        } else {
            spawnorigin = (0, 0, 0);
            spawnangles = (0, 0, 0);
            spawntype = "zero";
        }
    }
    if (!isdefined(spawnangles)) {
        circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
        var_d097b5e68baa10d1 = vectortoyaw(circleorigin - spawnorigin);
        spawnangles = (0, var_d097b5e68baa10d1, 0);
    }
    if (var_53480b10269770a5) {
        if (!isdefined(height)) {
            height = namespace_5078ee98abb32db9::getc130height();
        }
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("onRespawnScaleHeightOffset")) {
            height = height * namespace_71073fa38f11492::runbrgametypefunc("onRespawnScaleHeightOffset");
        }
        if (isdefined(level.var_dc52a11d1ee2690e) && namespace_cd0b2d039510b38d::getsubgametype() != "dmz" && !namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            height = level.var_dc52a11d1ee2690e;
        }
        if (isdefined(level.respawnheightoverride)) {
            height = level.respawnheightoverride;
        }
        if (istrue(level.var_5b5a1fcd1024eda5) && namespace_cd0b2d039510b38d::getsubgametype() != "dmz" && !namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            height = function_d6bfa8a9e6d014db(height);
        }
        if (istrue(level.var_5b5a1fcd1024eda5) && namespace_cd0b2d039510b38d::getsubgametype() != "dmz" && !namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            height = function_d6bfa8a9e6d014db(height);
        }
        var_a6427a6a24f058dc = (0, 0, height);
        spawnorigin = namespace_d20f8ef223912e12::getoffsetspawnorigin(spawnorigin, var_a6427a6a24f058dc);
    }
    spawnpoint = spawnstruct();
    spawnpoint.origin = spawnorigin;
    spawnpoint.angles = spawnangles;
    spawnpoint.height = height;
    spawnpoint.type = spawntype;
    if (getdvarint(@"hash_3055e0f04ccac0e4", 1)) {
        if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(spawnpoint.origin)) {
            switch (spawntype) {
            case #"hash_881585932f5309f8":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using setSpawnPoint");
                break;
            case #"hash_92d9b519cc4ed831":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using lastDeath");
                break;
            case #"hash_5ebf5fe3ac8c1009":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using abovePlayerCached");
                break;
            case #"hash_32dde0b86dfcf603":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using abovePlayer");
                break;
            case #"hash_ce247261a67b199d":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using respawningTeammate");
                break;
            case #"hash_523f16a1bd5c632b":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using missionOrigin");
                break;
            case #"hash_2407d21162ec8264":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using dropBagOrigin");
                break;
            case #"hash_4866a4440a9d2f4d":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using brGameTypeFunc");
                break;
            case #"hash_9bb2da60407fd710":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using pointFromSquadmate");
                break;
            case #"hash_ee97f72782afbedd":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using perimeterPointFromSquadmate");
                break;
            case #"hash_fd00b142d0523bb2":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using perimeterPointFromLoadout");
                break;
            case #"hash_7b5c236dc48a8946":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using randomPointInBounds");
                break;
            case #"hash_36f5ff8a130e852d":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using chosenOrigin");
                break;
            case #"hash_237a346d94c046e4":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using randomPotential");
                break;
            case #"hash_6e4a8ac4007a65c3":
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using zero");
                break;
            default:
                namespace_9c840bb9f2ecbf00::demoforcesre("Spawning in OOB - trying to spawn at " + spawnpoint.origin + " for player " + self.name + " using " + spawntype);
                break;
            }
        }
    }
    return spawnpoint;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d4
// Size: 0x43
function getanglesfacingorigin(startorigin, var_851f0ce8df2eb27d) {
    if (isdefined(startorigin) && isdefined(var_851f0ce8df2eb27d)) {
        var_e568a3cd90718f39 = vectortoyaw(var_851f0ce8df2eb27d - startorigin);
        angles = (0, var_e568a3cd90718f39, 0);
        return angles;
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x391e
// Size: 0x27
function playercleanupentondisconnect(ent) {
    ent endon("death");
    self waittill("disconnect");
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x394c
// Size: 0x2f
function function_d669022f6cd65402(enable) {
    if (enable) {
        self enableoffhandweapons();
        self enableusability();
    } else {
        self disableoffhandweapons();
        self disableusability();
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3982
// Size: 0x6c
function triggerrespawnoverlay(var_8d90bd1972a435bf) {
    self endon("disconnect");
    var_dbc5e63a72f2678a = namespace_71073fa38f11492::runbrgametypefunc("triggerRespawnOverlay");
    if (istrue(var_dbc5e63a72f2678a)) {
        return;
    }
    wait(0.5);
    if (function_cfe304859f30e747("gulagGetWinSplashName")) {
        splashname = function_3cceb052d780fef1("gulagGetWinSplashName");
    } else {
        splashname = "br_gulag_winner";
    }
    thread namespace_44abc05161e2e2cb::showsplash(splashname);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f5
// Size: 0x24
function resetplayermovespeedscale() {
    player = self;
    player.fastcrouchspeedmod = 0;
    player namespace_3bbb5a98b932c46f::updatemovespeedscale();
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a20
// Size: 0x36
function fadeoutin(fadetime) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(fadetime)) {
        fadetime = 1;
    }
    playercinematicfadein();
    wait(fadetime);
    function_e68e4bb4f65f5fe4();
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a5d
// Size: 0x32
function function_334a8fe67e88bbe7(var_89834994170e7989) {
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        function_19e0946144544a19();
    } else {
        playercinematicfadein();
    }
    if (istrue(var_89834994170e7989)) {
        function_9e7bd567746e94a1();
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a96
// Size: 0x26
function function_9ceb26b230856d29() {
    self endon("disconnect");
    self endon("respawn_fade_from_black");
    level waittill("game_ended");
    self setclientomnvar("ui_br_bink_overlay_state", 0);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac3
// Size: 0x12
function function_e68e4bb4f65f5fe4() {
    thread playercinematicfadeout();
    function_8375db589e70a6ee();
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3adc
// Size: 0x76
function function_9e7bd567746e94a1() {
    var_721982228624d657 = namespace_a9c534dc7832aba4::getspectatorsofplayer(self);
    foreach (spectator in var_721982228624d657) {
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            spectator function_19e0946144544a19();
        } else {
            spectator playercinematicfadein();
        }
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b59
// Size: 0x63
function function_8375db589e70a6ee() {
    var_721982228624d657 = namespace_a9c534dc7832aba4::getspectatorsofplayer(self);
    foreach (spectator in var_721982228624d657) {
        spectator thread playercinematicfadeout();
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bc3
// Size: 0x36
function fadeoutinspectatorsofplayer(fadetime) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(fadetime)) {
        fadetime = 1;
    }
    function_9e7bd567746e94a1();
    wait(fadetime);
    function_8375db589e70a6ee();
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c00
// Size: 0x36
function playeriscinematiclayeron() {
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        return 0;
    }
    var_a143cdb0e0e442c2 = self getclientomnvar("ui_br_bink_overlay_state");
    if (var_a143cdb0e0e442c2 != 0 && var_a143cdb0e0e442c2 != 6) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3e
// Size: 0x23
function playeriscinematicblacklayeron() {
    var_a143cdb0e0e442c2 = self getclientomnvar("ui_br_bink_overlay_state");
    return isdefined(var_a143cdb0e0e442c2) && var_a143cdb0e0e442c2 == 7;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c69
// Size: 0x11
function playercinematicfadein() {
    self setclientomnvar("ui_br_bink_overlay_state", 7);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c81
// Size: 0x11
function function_19e0946144544a19() {
    self setclientomnvar("ui_br_bink_overlay_state", 11);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c99
// Size: 0x31
function playercinematicfadeout() {
    self endon("disconnect");
    if (playeriscinematiclayeron()) {
        self setclientomnvar("ui_br_bink_overlay_state", 6);
        wait(1);
        self setclientomnvar("ui_br_bink_overlay_state", 0);
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd1
// Size: 0x450
function plunderplayerrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    if (istrue(level.gameended)) {
        return;
    }
    if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 1) {
        self endon("brWaitAndSpawnClientComplete");
    }
    teamcount = getteamdata(self.team, "teamCount");
    if (!istrue(self.squadwiped) || teamcount == 1) {
        var_80365e25f6e3befd = 1;
        wait(var_80365e25f6e3befd);
    }
    if (istrue(self.hasrespawntoken) && isdefined(level.tokenrespawnwaittime)) {
        var_30839284add41ced = level.tokenrespawnwaittime;
    } else if (level.incrementalrespawnpunish > 0) {
        var_30839284add41ced = clamp(self.pers["deaths"] * level.incrementalrespawnpunish, 0, level.incrementalrespawnpunishmax);
    } else if (isdefined(level.autorespawnwaittime)) {
        var_30839284add41ced = level.autorespawnwaittime;
    } else {
        var_30839284add41ced = getdvarint(@"hash_5639a8f49b94dacb", 20);
    }
    var_ac5cf023ca77db21 = getdvarfloat(@"hash_de0dfc4549393ba2", 10);
    if (var_30839284add41ced < var_ac5cf023ca77db21) {
        var_30839284add41ced = var_ac5cf023ca77db21;
    }
    if (level.respawntimedisable != 0) {
        var_30839284add41ced = 0;
    }
    var_e343378b89e661fb = getdvarfloat(@"hash_cc53a64fa6e4897b", 5);
    ent_flag_init("playerRespawn_intermission_spawned");
    self.intermissionspawnorigin = undefined;
    self.intermissionspawntime = undefined;
    if (istrue(self.squadwiped) || teamcount == 1) {
        spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint();
        var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
        thread fadetogearingup(0, teamcount > 1);
        wait(var_e343378b89e661fb);
    } else if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("waiting_to_spawn", int(gettime() + var_30839284add41ced * 1000));
        var_a294c35cbb452cbf = var_30839284add41ced - var_ac5cf023ca77db21;
        var_d2f5422694822652 = var_30839284add41ced - var_a294c35cbb452cbf;
        blackscreenwait = var_30839284add41ced - getdvarfloat(@"hash_879a2fde5543837", 6);
        thread fadetogearingup(blackscreenwait);
        result = waittill_notify_or_timeout_return("squad_wipe_death", var_a294c35cbb452cbf);
        if (result == "squad_wipe_death") {
            spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint();
            var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
            thread fadetogearingup(0, 1);
            wait(var_e343378b89e661fb);
        } else {
            thread updateprestreamrespawn();
            result = waittill_notify_or_timeout_return("squad_wipe_death", var_d2f5422694822652);
            if (result == "squad_wipe_death") {
                spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint();
                var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
                thread fadetogearingup(0, 1);
                wait(var_e343378b89e661fb);
            }
        }
    }
    self notify("stop_updatePrestreamRespawn");
    spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint();
    var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
    if (istrue(self.squadwiped)) {
        self.squadwiped = 0;
        if (teamcount > 1 && !namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            namespace_44abc05161e2e2cb::showsplash("bm_your_squad_wiped");
        }
    }
    if (isteamextracted(self.team)) {
        return;
    }
    if (istrue(self.hasrespawntoken)) {
        thread namespace_8bfdb6eb5a3df67a::triggerrespawnoverlay(4);
        self.tokenrespawned = 1;
        namespace_cb965d2f71fefddc::removerespawntoken();
    }
    if (isteamextracted(self.team)) {
        return;
    }
    if (getdvarint(@"hash_df02345c60008647", 1) == 0) {
        namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    }
    ent_flag_clear("playerRespawn_intermission_spawned");
    self.intermissionspawnorigin = undefined;
    self.intermissionspawntime = undefined;
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    namespace_f446f6030ca8cff8::_clearexecution();
    namespace_cb965d2f71fefddc::initplayer();
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf() && isdefined(level.player_respawn_struct)) {
        spawnpoint = getstruct(level.player_respawn_struct, "targetname");
    }
    namespace_47fd1e79a44628cd::gulagwinnerrespawn(1, undefined, spawnpoint, 1, var_11f3b4465c8b637b, 1);
    namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(self, "plunderPlayerRespawn");
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_b092e3259ec308d8");
    namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_transition_type", 0);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4128
// Size: 0x117
function fadetogearingup(waittime, squadwiped) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("spawned_player");
    self notify("fadeToGearingUp");
    self endon("fadeToGearingUp");
    if (isdefined(waittime) && waittime > 0) {
        wait(waittime);
    }
    var_b59f471c2c064e56 = 1;
    thread function_35b4f2460e697a2e();
    wait(var_b59f471c2c064e56 - 0.25);
    if (istrue(squadwiped)) {
        namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_transition_type", 6);
    } else {
        namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_transition_type", 2);
    }
    wait(0.25);
    if (getdvarint(@"hash_f006294ef8b720a4", 1) == 1) {
        namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
        spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint();
        namespace_a9c534dc7832aba4::playerclearspectatekillchainsystem();
        namespace_d20f8ef223912e12::spawnintermission(spawnpoint.origin, spawnpoint.angles);
        namespace_5aeecefc462876::setdisabled();
        self.intermissionspawnorigin = spawnpoint.origin;
        self.intermissionspawntime = gettime();
        ent_flag_set("playerRespawn_intermission_spawned");
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4246
// Size: 0x27
function function_35b4f2460e697a2e() {
    level endon("game_ended");
    self endon("disconnect");
    namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
    self waittill("spawned_player");
    namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4274
// Size: 0xd2
function updateprestreamrespawn() {
    self endon("disconnect");
    self endon("spawned_player");
    self endon("stop_updatePrestreamRespawn");
    while (1) {
        if (ent_flag("playerRespawn_intermission_spawned")) {
            spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint();
            currenttime = gettime();
            /#
                assert(isdefined(self.intermissionspawntime));
            #/
            /#
                assert(self.intermissionspawntime <= currenttime);
            #/
            if (currenttime - self.intermissionspawntime >= getdvarfloat(@"hash_57fbcc1bae0f210a", 2) * 1000) {
                spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint(1);
                var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
            }
        } else {
            spawnpoint = namespace_8bfdb6eb5a3df67a::playergetrespawnpoint();
            var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
        }
        wait(1);
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x434d
// Size: 0x20
function setteamasextracted(team) {
    level.teamdata[team]["extracted"] = 1;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4374
// Size: 0x1e
function isteamextracted(team) {
    return istrue(level.teamdata[team]["extracted"]);
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x439a
// Size: 0x9d
function function_d6bfa8a9e6d014db(height) {
    if (isdefined(level.var_b257658f289a3108)) {
        if (level.var_27506e83d743e391 < 0 || level.br_circle.circleindex < level.var_27506e83d743e391) {
            var_ac61029d6f979867 = level.var_b257658f289a3108 * level.br_circle.circleindex;
            height = function_d986479e0b55e637(height, var_ac61029d6f979867);
        } else {
            var_ac61029d6f979867 = level.var_b257658f289a3108 * level.var_27506e83d743e391;
            height = function_d986479e0b55e637(height, var_ac61029d6f979867);
        }
    }
    return height;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x443f
// Size: 0x47
function function_d986479e0b55e637(height, var_ac61029d6f979867) {
    if (var_ac61029d6f979867 > 0) {
        var_b68f01b7ca095faf = height * var_ac61029d6f979867;
        height = height - var_b68f01b7ca095faf;
        if (height <= level.var_5321a1377f9cc5aa) {
            height = level.var_5321a1377f9cc5aa;
        }
    }
    return height;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x448e
// Size: 0xd6
function function_600cc18a5b7b64b0() {
    tablename = getmatchrulesdata("brData", "respawnLoadoutTable");
    if (tablename == "") {
        return;
    }
    respawnloadouttable = getscriptbundle("respawnloadouttable:" + tablename);
    if (!isdefined(respawnloadouttable)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("Respawn loadout table " + tablename + " does not exist");
        return;
    }
    foreach (var_33d4cdf6cb6338fd in respawnloadouttable.var_c8444f6695edafaf) {
        function_69a7411c700538e3("classtable:" + var_33d4cdf6cb6338fd.table, var_33d4cdf6cb6338fd.circleindex, var_33d4cdf6cb6338fd.var_c6616a0492de643c);
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x456b
// Size: 0x15f
function function_69a7411c700538e3(table, circleindex, var_c6616a0492de643c) {
    if (!isdefined(level.var_33d4cdf6cb6338fd)) {
        level.var_33d4cdf6cb6338fd = [];
    }
    var_a78225c464121e51 = circleindex;
    var_7d958726e11b327 = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
    level.var_33d4cdf6cb6338fd[var_a78225c464121e51] = [];
    for (classindex = 0; classindex < var_7d958726e11b327; classindex++) {
        level.var_33d4cdf6cb6338fd[var_a78225c464121e51][level.var_33d4cdf6cb6338fd[var_a78225c464121e51].size] = function_aa8a954d66bf39b4(classindex, table);
    }
    level.var_e1f92a4c781a3039 = [];
    foreach (circleindex, var_1a9e152363126a93 in level.var_33d4cdf6cb6338fd) {
        if (isdefined(level.var_33d4cdf6cb6338fd[circleindex]) && level.var_33d4cdf6cb6338fd[circleindex].size > 0) {
            level.var_e1f92a4c781a3039[circleindex] = spawnstruct();
            level.var_e1f92a4c781a3039[circleindex].index = randomintrange(0, level.var_33d4cdf6cb6338fd[circleindex].size);
            level.var_e1f92a4c781a3039[circleindex].var_c6616a0492de643c = var_c6616a0492de643c;
        }
    }
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d1
// Size: 0x34b
function function_aa8a954d66bf39b4(classindex, table) {
    var_cfa6985254954fb3 = namespace_d19129e4fa5d176::function_c7a0b640c398497(table, classindex);
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = var_cfa6985254954fb3.primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = var_cfa6985254954fb3.primaryweapon.attachment1;
    loadout["loadoutPrimaryAttachment2"] = var_cfa6985254954fb3.primaryweapon.attachment2;
    loadout["loadoutPrimaryAttachment3"] = var_cfa6985254954fb3.primaryweapon.attachment3;
    loadout["loadoutPrimaryAttachment4"] = var_cfa6985254954fb3.primaryweapon.attachment4;
    loadout["loadoutPrimaryAttachment5"] = var_cfa6985254954fb3.primaryweapon.attachment5;
    loadout["loadoutPrimaryCamo"] = var_cfa6985254954fb3.primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = var_cfa6985254954fb3.primaryweapon.reticle;
    loadout["loadoutSecondary"] = var_cfa6985254954fb3.secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = var_cfa6985254954fb3.secondaryweapon.attachment1;
    loadout["loadoutSecondaryAttachment2"] = var_cfa6985254954fb3.secondaryweapon.attachment2;
    loadout["loadoutSecondaryAttachment3"] = var_cfa6985254954fb3.secondaryweapon.attachment3;
    loadout["loadoutSecondaryAttachment4"] = var_cfa6985254954fb3.secondaryweapon.attachment4;
    loadout["loadoutSecondaryAttachment5"] = var_cfa6985254954fb3.secondaryweapon.attachment5;
    loadout["loadoutSecondaryCamo"] = var_cfa6985254954fb3.secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = var_cfa6985254954fb3.secondaryweapon.reticle;
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = var_cfa6985254954fb3.equipment.primary;
    loadout["loadoutEquipmentSecondary"] = var_cfa6985254954fb3.equipment.secondary;
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:var_cfa6985254954fb3.perks.perk1, 1:var_cfa6985254954fb3.perks.perk2, 2:var_cfa6985254954fb3.perks.perk3, 3:var_cfa6985254954fb3.extraperks.perk1, 4:var_cfa6985254954fb3.extraperks.perk2, 5:var_cfa6985254954fb3.extraperks.perk3];
    loadout["loadoutGesture"] = "playerData";
    loadout["tableColumn"] = classindex;
    return loadout;
}

// Namespace namespace_6e6b980bec22af5b/namespace_8bfdb6eb5a3df67a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a24
// Size: 0xeb
function function_eee8abc18302f5ef() {
    loadout = level.br_standard_loadout;
    var_c179e44bd14d2d12 = 0;
    if (isdefined(level.var_33d4cdf6cb6338fd)) {
        circleindex = 0;
        if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
            circleindex = level.br_circle.circleindex;
        }
        for (index = 0; index <= circleindex; index++) {
            if (isdefined(level.var_e1f92a4c781a3039[index])) {
                loadout = level.var_33d4cdf6cb6338fd[index][level.var_e1f92a4c781a3039[index].index];
                var_a07526bb98bbc752 = level.var_e1f92a4c781a3039[index].var_c6616a0492de643c;
            }
        }
    }
    return [0:loadout, 1:var_c179e44bd14d2d12];
}

