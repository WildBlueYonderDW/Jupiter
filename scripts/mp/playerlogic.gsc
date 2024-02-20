// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\engine\math.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_3f8889c16399185c;
#using script_3b64eb40368c1450;
#using scripts\mp\flags.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\arbitrary_up.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\teams.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\gametypes\common.gsc;
#using script_60dd02bec5783ecd;
#using script_1b1a05843f74cfa9;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\outline.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\gametypes\br_armor.gsc;
#using script_7c40fa80892a721;
#using script_600b944a95c3a7bf;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\gamescore.gsc;
#using script_76cc264b397db9cb;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_4cdabcd91a92977;
#using scripts\mp\accolades.gsc;
#using script_293ba44c408fef1;
#using scripts\mp\flashpoint.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\customization\battle_tracks.gsc;
#using script_55e6a436b6b3048c;
#using scripts\mp\perks\perkfunctions.gsc;
#using script_6ad351ebd5a33280;
#using scripts\mp\playerstats.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_728ffcee8cbf30ee;

#namespace namespace_66c176d3c67cc0c2;

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4a
// Size: 0x10
function init() {
    level namespace_3846cfb60b2ef12f::registeronluieventcallback(&onversusdone);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d61
// Size: 0x114
function timeuntilwavespawn(minimumwait) {
    if (!self.hasspawned) {
        return 0;
    }
    earliestspawntime = gettime() + minimumwait * 1000;
    lastwavetime = level.lastwave[self.pers["team"]];
    wavedelay = level.wavedelay[self.pers["team"]] * 1000;
    numwavespassedearliestspawntime = (earliestspawntime - lastwavetime) / wavedelay;
    numwaves = ceil(numwavespassedearliestspawntime);
    timeofspawn = lastwavetime + numwaves * wavedelay;
    if (isdefined(self.respawntimerstarttime)) {
        timealreadypassed = (gettime() - self.respawntimerstarttime) / 1000;
        if (self.respawntimerstarttime < lastwavetime) {
            return 0;
        }
    }
    if (isdefined(self.wavespawnindex)) {
        timeofspawn = timeofspawn + 50 * self.wavespawnindex;
    }
    return (timeofspawn - gettime()) / 1000;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7d
// Size: 0x67
function teamkilldelay() {
    teamkills = namespace_3c5a4254f2b957ea::getpersstat("teamkills");
    if (!isdefined(teamkills) || level.maxallowedteamkills < 0 || teamkills <= level.maxallowedteamkills) {
        return 0;
    }
    exceeded = teamkills - level.maxallowedteamkills;
    return namespace_775507ba36294dfb::gettweakablevalue("team", "teamkillspawndelay") * exceeded;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eec
// Size: 0x1e6
function timeuntilspawn(includeteamkilldelay) {
    if (level.ingraceperiod && !self.hasspawned || level.gameended) {
        return 0;
    }
    respawndelay = 0;
    if (istrue(self.hasspawned)) {
        result = self [[ level.onrespawndelay ]]();
        if (isdefined(result)) {
            respawndelay = result;
        } else {
            respawndelay = getdvarfloat(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_playerrespawndelay"));
        }
        if (includeteamkilldelay && isdefined(namespace_3c5a4254f2b957ea::getpersstat("teamKillPunish")) && namespace_3c5a4254f2b957ea::getpersstat("teamKillPunish")) {
            respawndelay = respawndelay + teamkilldelay();
        }
        if (isdefined(self.suicidespawndelay)) {
            respawndelay = respawndelay + getdvarfloat(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_suicidespawndelay"));
        }
        if (isdefined(self.respawntimerstarttime) && !isdefined(level.spawndelay)) {
            timealreadypassed = (gettime() - self.respawntimerstarttime) / 1000;
            respawndelay = respawndelay - timealreadypassed;
            if (respawndelay < 0) {
                respawndelay = 0;
            }
        }
    }
    if (namespace_36f464722d326bbe::function_d04af493b6e718ac()) {
        wavebased = level.var_567ac33c91cda90a == 1;
    } else {
        wavebased = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay")) > 0;
    }
    if (wavebased) {
        respawndelay = timeuntilwavespawn(respawndelay);
    }
    if (level.ingraceperiod && !self.hasspawned || level.gameended) {
        respawndelay = 0;
    } else if (getdvarint(@"hash_4ac8d16ce8dd74fd", 0) == 1) {
        respawndelay = 999;
    }
    if (!isdefined(self.var_db03ae1b2b480308)) {
        self.var_db03ae1b2b480308 = respawndelay;
    }
    return respawndelay;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20da
// Size: 0x14a
function mayspawn() {
    if (istrue(level.nukeinfo.gameover)) {
        return 0;
    }
    if (getgametypenumlives() || isdefined(level.disablespawning)) {
        if (isdefined(level.teamswithplayers) && level.teamswithplayers.size == 1) {
            return 1;
        }
        if (istrue(level.disablespawning)) {
            if (!istestclient(self)) {
                return 0;
            }
        }
        if (istrue(self.pers["teamKillPunish"])) {
            return 0;
        }
        if (self.pers["lives"] <= 0 && gamehasstarted()) {
            return 0;
        } else if (gamehasstarted()) {
            if (level.ingraceperiod && !self.hasspawned) {
                return 1;
            }
            if (!level.ingraceperiod && !self.hasspawned && isdefined(level.allowlatecomers) && !level.allowlatecomers) {
                if (isdefined(self.siegelatecomer) && !self.siegelatecomer) {
                    return 1;
                }
                if (istestclient(self)) {
                    return 1;
                }
                return 0;
            }
        }
    }
    if (isdefined(level.disablespawningforplayerfunc) && [[ level.disablespawningforplayerfunc ]](self)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x222c
// Size: 0x4cb
function spawnclient(var_9156b53bcf7ce573) {
    self endon("becameSpectator");
    if (isdefined(level.modespawnclient)) {
        self [[ level.modespawnclient ]](var_9156b53bcf7ce573);
        return;
    }
    if (isdefined(self) && isdefined(self.pers) && isdefined(self.pers["next_round_class"]) && !self.hasspawned) {
        self.class = self.pers["next_round_class"];
    }
    /#
        assert(isdefined(self.team));
    #/
    /#
        assert(namespace_d19129e4fa5d176::isvalidclass(self.class));
    #/
    if (isdefined(self.waitingtoselectclass) && self.waitingtoselectclass) {
        self waittill("okToSpawn");
    }
    if (isdefined(self.addtoteam)) {
        namespace_e5ed2f5a5ee8410e::addtoteam(self.addtoteam);
        self.addtoteam = undefined;
    }
    /#
        println("stopped_using_remote" + self.name + "spawningClientThisFrameReset" + self.class);
    #/
    if (!mayspawn()) {
        waitframe();
        currentorigin = self.origin;
        currentangles = self.angles;
        self notify("attempted_spawn");
        if (istrue(self.pers["teamKillPunish"])) {
            self.pers["teamkills"] = max(self.pers["teamkills"] - 1, 0);
            setlowermessageomnvar("no_friendly_fire");
            if (!self.hasspawned && self.pers["teamkills"] <= level.maxallowedteamkills) {
                self.pers["teamKillPunish"] = 0;
            }
        } else if (isroundbased() && game["finalRound"] == 0 || getgametypenumlives() != 0 && game["finalRound"] == 0 || istrue(level.disablespawning)) {
            var_eed812fd1b7f551c = undefined;
            if (getgametype() != "arena" && isdefined(self.tagavailable) && self.tagavailable) {
                setlowermessageomnvar("spawn_tag_wait");
            } else if (istrue(self.revivetriggerblockedinremote) && level.teamdata[self.team]["aliveCount"] > 0) {
                setlowermessageomnvar("spawn_revive_wait_notimer");
            } else if (istrue(self.revivetriggeravailable)) {
                if (isdefined(self.timeuntilbleedout)) {
                    if (isdefined(self.rallypoint)) {
                        setlowermessageomnvar("rally_point", int(gettime() + self.timeuntilbleedout * 1000));
                    } else if (!istrue(self.eliminated)) {
                        setlowermessageomnvar("spawn_revive_wait_bleedout", int(gettime() + self.timeuntilbleedout * 1000));
                    }
                } else if (level.teamdata[self.team]["aliveCount"] > 0) {
                    setlowermessageomnvar("spawn_revive_wait_notimer");
                } else {
                    setlowermessageomnvar("spawn_next_round");
                }
            } else if (getgametype() == "siege") {
                setlowermessageomnvar("spawn_point_capture_wait");
                var_eed812fd1b7f551c = 10;
            } else if (istrue(level.exfilstarted)) {
                setlowermessageomnvar("exfil_eliminated");
            } else if (isroundbased()) {
                setlowermessageomnvar("spawn_next_round");
            } else if (getgametype() == "oic" && matchmakinggame()) {
                setlowermessageomnvar("player_eliminated_oic");
                var_eed812fd1b7f551c = 30;
            } else {
                setlowermessageomnvar("player_eliminated");
                var_eed812fd1b7f551c = 10;
            }
            if (!isdefined(self.revivetriggeravailable)) {
                thread removespawnmessageshortly(ter_op(isdefined(var_eed812fd1b7f551c), var_eed812fd1b7f551c, 6));
            }
        }
        if (self.sessionstate != "spectator") {
            currentorigin = currentorigin + (0, 0, 60);
        }
        if (isusingremote()) {
            self.spawningafterremotedeath = 1;
            self.deathposition = self.origin;
            self waittill("stopped_using_remote");
        }
        if (!istrue(level.nukeinfo.gameover)) {
            if (!gameflag("prematch_done")) {
                logstring("IWH-315293: DOLPHIN: can't spawn but prematch isn't over: " + self.name);
            }
            thread spawnspectator(currentorigin, currentangles);
        }
        return;
    }
    if (self.waitingtospawn) {
        return;
    }
    self.waitingtospawn = 1;
    waitandspawnclient(var_9156b53bcf7ce573);
    if (isdefined(self)) {
        self.waitingtospawn = 0;
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26fe
// Size: 0x95
function waittillcanspawnclient(var_9156b53bcf7ce573) {
    self endon("started_spawnPlayer");
    for (;;) {
        waitframe();
        if (self.team == "spectator" || self.team == "codcaster") {
            return;
        }
        if (isdefined(self) && (self.sessionstate == "spectator" || !isreallyalive(self))) {
            if (istrue(var_9156b53bcf7ce573)) {
                self.pers["teamKillPunish"] = 0;
            }
            self.pers["lives"] = 1;
            thread spawnclient(var_9156b53bcf7ce573);
        } else {
            return;
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279a
// Size: 0x8c5
function waitandspawnclient(var_9156b53bcf7ce573) {
    self endon("disconnect");
    self endon("end_respawn");
    level endon("game_ended");
    self notify("attempted_spawn");
    /#
        println("tactical_spawn" + self.name);
    #/
    if (isdefined(level.prewaitandspawnclient)) {
        [[ level.prewaitandspawnclient ]](var_9156b53bcf7ce573);
    }
    waitforremoteend();
    spawnedasspectator = 0;
    if (istrue(namespace_3c5a4254f2b957ea::getpersstat("teamKillPunish"))) {
        teamkilldelay = teamkilldelay();
        if (teamkilldelay > 0) {
            setlowermessageomnvar("no_friendly_fire_timer", int(gettime() + teamkilldelay * 1000));
            thread respawn_asspectator(self.origin + (0, 0, 60), self.angles);
            spawnedasspectator = 1;
            wait(teamkilldelay);
            setlowermessageomnvar("clear_lower_msg");
            self.respawntimerstarttime = gettime();
        }
        self.pers["teamKillPunish"] = 0;
    } else if (teamkilldelay()) {
        self.pers["teamkills"] = max(self.pers["teamkills"] - 1, 0);
    }
    if (!isdefined(self.wavespawnindex) && isdefined(level.waveplayerspawnindex[self.team])) {
        self.wavespawnindex = level.waveplayerspawnindex[self.team];
        level.waveplayerspawnindex[self.team]++;
    }
    if (isdefined(self.setspawnpoint) && !tivalidationcheck()) {
        namespace_add8ab90fc53d7f7::spawnpoint_clearspawnpoint(1);
    }
    timeuntilspawn = timeuntilspawn(0);
    var_d322c5816f6135b5 = 0;
    if (!istrue(level.disablespawncamera)) {
        var_d322c5816f6135b5 = ter_op(istrue(level.snaptospawncamera), 1.25, 2);
    }
    if (istrue(level.usespawnselection)) {
        var_d322c5816f6135b5 = 0.5;
    }
    if (level.ingraceperiod && !self.hasspawned || level.gameended) {
        var_d322c5816f6135b5 = 0;
        timeuntilspawn = 0;
    }
    var_d86b42b0fa413aa2 = 0;
    if (function_60bf8d82001fc22c() == "hq" && isdefined(level.zone) && level.zone.ownerteam == self.team) {
        var_d86b42b0fa413aa2 = 1;
    }
    if (!istrue(self.skippedkillcam) && isdefined(self.killcamwatchtime) && !var_d86b42b0fa413aa2) {
        if (isdefined(self.var_db03ae1b2b480308)) {
            timeuntilspawn = max(self.var_db03ae1b2b480308 - self.killcamwatchtime, 0);
        } else {
            timeuntilspawn = max(timeuntilspawn - self.killcamwatchtime, 0);
        }
        self.killcamwatchtime = undefined;
    }
    if (isdefined(self.var_be203805bd352c2d)) {
        timeuntilspawn = self.var_be203805bd352c2d;
        self.var_be203805bd352c2d = undefined;
    } else {
        timeuntilspawn = max(timeuntilspawn, var_d322c5816f6135b5);
    }
    if (namespace_ab403fa2c6c142a4::isinarbitraryup()) {
        angles = self getworldupreferenceangles();
        up = anglestoup(angles);
        var_86e75b5335f09f6 = up * 60;
    } else {
        var_86e75b5335f09f6 = (0, 0, 60);
    }
    var_fa3cdbd484fa39c3 = istrue(gameflag("prematch_done"));
    var_6109158034da3fe9 = gameflag("infil_will_run") && !istrue(gameflag("infil_started"));
    if (istrue(level.var_a6954a050d77d75c)) {
        if (!var_6109158034da3fe9 && !var_fa3cdbd484fa39c3 && (!isdefined(level.var_58a42cd072629ca) || [[ level.var_58a42cd072629ca ]]())) {
            self clearpredictedstreampos();
            thread function_ae6fb03b95fca93e(getdvarint(@"hash_41c2228192c27e59", 1));
        }
    } else if ((getgametype() == "arm" || getgametype() == "conflict") && !var_6109158034da3fe9 && !var_fa3cdbd484fa39c3) {
        var_c2106fa614419d22 = [[ level.var_e637d49948a038d3 ]](self.team);
        var_11f3b4465c8b637b = namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_c2106fa614419d22.startorigin);
        thread setuipregamefadeup();
        namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
        var_5940f376a254619d = spawn("script_model", var_c2106fa614419d22.startorigin);
        var_5940f376a254619d setmodel("tag_origin");
        var_5940f376a254619d.angles = var_c2106fa614419d22.startangles;
        self cameralinkto(var_5940f376a254619d, "tag_origin");
        var_5940f376a254619d moveto(var_c2106fa614419d22.endorigin, 18);
        var_5940f376a254619d rotateto(var_c2106fa614419d22.endangles, 18);
        gameflagwait("prematch_done");
        var_fa3cdbd484fa39c3 = 1;
        self cameraunlink();
    }
    if (namespace_d7fe36703a9572fe::function_581a8fc6f76d525d() && timeuntilspawn > 0) {
        if (getdvarint(@"hash_f011125b6f888598", 1) == 1) {
            thread namespace_d7fe36703a9572fe::startspawncamera(0, 0, 0.5);
        } else {
            thread namespace_d7fe36703a9572fe::startspawncamera();
        }
    }
    if (istrue(level.usespawnselection)) {
        namespace_8e28f8b325a83325::waitforspawnselection(timeuntilspawn, !istrue(var_fa3cdbd484fa39c3));
    } else {
        if (isdefined(self.setspawnpoint)) {
            var_d82413d0d82e4e34 = namespace_add8ab90fc53d7f7::function_617d41ffb1f25aa5();
            spawnedasspectator = 1;
            if (isdefined(self.var_15db4b9b5e7debec)) {
                timeuntilspawn = max(var_d322c5816f6135b5, timeuntilspawn - var_d82413d0d82e4e34);
                self setspectatedefaults(self.origin + var_86e75b5335f09f6, self.angles);
                namespace_5aeecefc462876::setspectatepermissions();
            }
        }
        if (timeuntilspawn > 0) {
            var_bcf42b30ba361835 = "waiting_to_spawn";
            if (function_60bf8d82001fc22c() == "hq") {
                if (isdefined(level.zone)) {
                    if (level.zone.ownerteam == self.team) {
                        namespace_944ddf7b8df1b0e3::leaderdialogonplayer("hp_dead");
                        var_bcf42b30ba361835 = "waiting_for_hq";
                        if (isdefined(self.suicidespawndelay)) {
                            timeuntilspawn = timeuntilspawn - getdvarfloat(@"hash_7f95444a17ecdec5");
                            timeuntilspawn = max(0, timeuntilspawn);
                        }
                    } else if (isdefined(self.suicidespawndelay) && getdvarfloat(@"hash_7f95444a17ecdec5") > 0 && level.zone.ownerteam == "neutral") {
                        var_bcf42b30ba361835 = "waiting_suicide_delay";
                        self.suicidespawndelay = undefined;
                    }
                }
            } else if (isdefined(self.suicidespawndelay) && getdvarfloat(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_suicidespawndelay")) > 0) {
                var_bcf42b30ba361835 = "waiting_suicide_delay";
                self.suicidespawndelay = undefined;
            }
            setlowermessageomnvar(var_bcf42b30ba361835, int(gettime() + timeuntilspawn * 1000));
            if (getdvarint(@"hash_f011125b6f888598", 1) == 1 && istrue(self.inspawncamera) && getgametype() == "gwtdm") {
                goto LOC_00000769;
            }
            if (!spawnedasspectator) {
                thread respawn_asspectator(self.origin + var_86e75b5335f09f6, self.angles);
            }
            spawnedasspectator = 1;
        LOC_00000769:
            waittill_any_timeout_no_endon_death_1(timeuntilspawn, "force_spawn");
            if (!istrue(self.waitingtoselectclass)) {
                self notify("stop_wait_safe_spawn_button");
            }
        }
    }
    if (!isbot(self) && needsbuttontorespawn()) {
        if (function_98811c91e3781166()) {
            if (self.hasspawned) {
                function_5ecf910ea9dfdb41();
            }
        } else {
            if (!istrue(self.waitingtoselectclass)) {
                setlowermessageomnvar("press_to_spawn");
            }
            if (!spawnedasspectator) {
                thread respawn_asspectator(self.origin + var_86e75b5335f09f6, self.angles);
            }
            spawnedasspectator = 1;
            waitrespawnbutton();
        }
    }
    if (!istrue(level.disablespawncamera) || getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk") {
        thread namespace_d7fe36703a9572fe::endspawncamera();
    }
    waitclassselected();
    if (isbot(self)) {
        if (!namespace_e4a5fcd525f0b19b::bot_is_ready_to_spawn()) {
            self waittill("bot_ready_to_spawn");
        }
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("instanceInventory", "inventoryIsValid")) {
        while (!istrue(namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("instanceInventory", "inventoryIsValid", self))) {
            waitframe();
        }
    }
    self.waitingtospawn = 0;
    setlowermessageomnvar("clear_lower_msg");
    self.wavespawnindex = undefined;
    thread spawnplayer(undefined, var_9156b53bcf7ce573);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3066
// Size: 0x123
function function_ae6fb03b95fca93e(mintime) {
    self endon("death_or_disconnect");
    self waittill("spawned_player");
    self setclientomnvar("ui_world_fade", 1);
    starttime = gettime();
    namespace_d3d40f75bb4e4c32::playerstreamhintlocation(self geteye());
    self waittill("playerPrestreamComplete");
    self clearpredictedstreampos();
    if (isdefined(mintime)) {
        timepassed = (gettime() - starttime) / 1000;
        if (timepassed < mintime) {
            wait(mintime - timepassed);
        }
    }
    var_dfab0807d83a77fe = 0.5;
    if (isdefined(var_dfab0807d83a77fe) && var_dfab0807d83a77fe > 0) {
        var_c8d49bba66d8db34 = 1;
        framecount = var_dfab0807d83a77fe / level.framedurationseconds;
        var_11b42fd8a12916ad = 1 / framecount;
        var_4a1830f604c82b9f = 0;
        while (var_4a1830f604c82b9f < framecount) {
            var_4a1830f604c82b9f++;
            var_c8d49bba66d8db34 = var_c8d49bba66d8db34 - var_11b42fd8a12916ad;
            var_c8d49bba66d8db34 = clamp(var_c8d49bba66d8db34, 0, 1);
            self setclientomnvar("ui_world_fade", var_c8d49bba66d8db34);
            waitframe();
        }
    }
    self setclientomnvar("ui_world_fade", 0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3190
// Size: 0x57
function waitforremoteend() {
    level endon("game_ended");
    self endon("disconnect");
    if (isusingremote()) {
        self.spawningafterremotedeath = 1;
        self.deathposition = self.origin;
        self waittill("stopped_using_remote");
        if (istrue(level.nukeinfo.gameover)) {
            return;
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31ee
// Size: 0x4
function shouldwaitforsquadspawn() {
    return 0;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31fa
// Size: 0x5d
function queueclientforsquadspawn() {
    while (!level.squaddata[self.team][self.var_ff97225579de16a].isfull && !level.squaddata[self.team][self.var_ff97225579de16a].isstale) {
        waitframe();
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x325e
// Size: 0x14
function waitclassselected() {
    while (istrue(self.waitingtoselectclass)) {
        waitframe();
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3279
// Size: 0xa3
function needsbuttontorespawn() {
    if (istrue(self.var_6c0f9f7e906a5ee6)) {
        return 0;
    }
    if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
        return 0;
    }
    if (function_98811c91e3781166()) {
        return 1;
    }
    if (namespace_775507ba36294dfb::gettweakablevalue("player", "forcerespawn") != 0) {
        return 0;
    }
    if (!self.hasspawned) {
        return 0;
    }
    wavebased = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay")) > 0;
    if (wavebased) {
        return 0;
    }
    if (self.wantsafespawn) {
        return 0;
    }
    return 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3324
// Size: 0x2b
function waitrespawnbutton() {
    self endon("disconnect");
    self endon("end_respawn");
    while (1) {
        if (self usebuttonpressed()) {
            break;
        }
        wait(0.05);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3356
// Size: 0x24
function function_98811c91e3781166() {
    if (function_9cdaadfddeda4d7a() && !isbot(self) && !self isplayerheadless()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3382
// Size: 0x21
function function_5ecf910ea9dfdb41() {
    self openmenu("Shop");
    namespace_a4b43c1cf86c6fe5::armorykioskused(0, undefined, undefined, self);
    function_e02011baf71d84ac();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33aa
// Size: 0x48
function function_e02011baf71d84ac() {
    self endon("disconnect");
    self endon("end_respawn");
    self endon("buy_menu_close");
    self endon("game_ended");
    timeout = 10;
    while (1) {
        wait(ter_op(matchmakinggame(), 10, 20));
        break;
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f9
// Size: 0x30
function removespawnmessageshortly(delay) {
    self endon("disconnect");
    level endon("game_ended");
    waittillframeend();
    self endon("end_respawn");
    wait(delay);
    setlowermessageomnvar("clear_lower_msg");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3430
// Size: 0x34b
function tivalidationcheck() {
    if (!isdefined(self.setspawnpoint)) {
        return 0;
    }
    if (isdefined(level.canspawnontacinsert) && ![[ level.canspawnontacinsert ]](self)) {
        return 0;
    }
    carepackages = getentarray("care_package", "targetname");
    foreach (package in carepackages) {
        if (distancesquared(package.origin, self.setspawnpoint.playerspawnpos) > 4096) {
            continue;
        }
        if (isdefined(package.owner)) {
            namespace_44abc05161e2e2cb::showsplash("destroyed_insertion", undefined, package.owner);
        }
        namespace_add8ab90fc53d7f7::spawnpoint_clearspawnpoint();
        return 0;
    }
    var_b65b7aeab526e1ac = (30, 30, 80);
    var_80745cf3e2877df5 = self.setspawnpoint.playerspawnpos - var_b65b7aeab526e1ac;
    var_809746f3e2ad954b = self.setspawnpoint.playerspawnpos + var_b65b7aeab526e1ac;
    contents = physics_createcontents([0:"physicscontents_vehicle"]);
    ignorelist = [];
    vehicles = physics_aabbbroadphasequery(var_80745cf3e2877df5, var_809746f3e2ad954b, contents, ignorelist);
    if (isdefined(vehicles) && vehicles.size > 0) {
        var_d41b7d5f40f6a360 = 1;
        foreach (vehicle in vehicles) {
            fake = vehicle.code_classname == "scriptable" || vehicle.code_classname == "worldspawn";
            if (!fake) {
                var_d41b7d5f40f6a360 = 0;
                break;
            }
        }
        if (!var_d41b7d5f40f6a360) {
            return 0;
        }
    }
    startpos = self.setspawnpoint.playerspawnpos + (0, 0, 60);
    endpos = self.setspawnpoint.playerspawnpos + (0, 0, 1);
    ignoreents = [];
    ignoreents[0] = self;
    ignoreents[1] = self.setspawnpoint;
    contentoverride = physics_createcontents([0:"physicscontents_playerclip", 1:"physicscontents_characterproxy", 2:"physicscontents_glass"]);
    if (!namespace_2a184fc4902783dc::ray_trace_passed(startpos, endpos, ignoreents, contentoverride)) {
        return 0;
    }
    tracestartpos = self.setspawnpoint.playerspawnpos + (0, 0, 1);
    traceendpos = playerphysicstrace(tracestartpos, self.setspawnpoint.playerspawnpos + (0, 0, -16));
    if (tracestartpos[2] == traceendpos[2]) {
        return 0;
    }
    return 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3783
// Size: 0x20a
function revivespawnvalidationcheck() {
    if (!isdefined(self.forcespawnorigin)) {
        return 0;
    }
    var_e5f115aee2bf7de7 = spawnstruct();
    var_e5f115aee2bf7de7.spawnposition = self.forcespawnorigin;
    var_e5f115aee2bf7de7.isvalidpos = 1;
    ignoreents = [];
    ignoreents[0] = self;
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 0, 0, 1, 1);
    if (!namespace_2a184fc4902783dc::ray_trace_passed(self.forcespawnorigin + (0, 0, 60), self.forcespawnorigin, ignoreents, contentoverride)) {
        var_e5f115aee2bf7de7.isvalidpos = 0;
        return var_e5f115aee2bf7de7;
    }
    if (istrue(self.var_908f8ac4bbcdb65e)) {
        var_e5f115aee2bf7de7.isvalidpos = 1;
        return var_e5f115aee2bf7de7;
    }
    forward = anglestoforward(self.angles);
    delta = vectornormalize(forward) * 5;
    if (!namespace_2a184fc4902783dc::ray_trace_passed(self.forcespawnorigin + delta, self.forcespawnorigin + delta - (0, 0, 16), ignoreents, contentoverride)) {
        var_e5f115aee2bf7de7.isvalidpos = 0;
        return var_e5f115aee2bf7de7;
    }
    tracestartpos = self.forcespawnorigin + (0, 0, 1);
    traceendpos = playerphysicstrace(tracestartpos, self.forcespawnorigin + (0, 0, -16));
    if (tracestartpos[2] == traceendpos[2]) {
        var_e5f115aee2bf7de7.isvalidpos = 0;
        return var_e5f115aee2bf7de7;
    } else {
        var_e5f115aee2bf7de7.spawnposition = traceendpos;
        var_e5f115aee2bf7de7.isvalidpos = 0;
    }
    if (isdefined(self.faux_spawn_stance) && self.faux_spawn_stance == "prone") {
        self.faux_spawn_stance = "prone";
    } else {
        self.faux_spawn_stance = "crouch";
    }
    var_e5f115aee2bf7de7.isvalidpos = 1;
    return var_e5f115aee2bf7de7;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3995
// Size: 0x1d
function spawningclientthisframereset() {
    self notify("spawningClientThisFrameReset");
    self endon("spawningClientThisFrameReset");
    waitframe();
    level.numplayerswaitingtospawn--;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b9
// Size: 0xe0
function getplayerassets(classstruct) {
    assets = spawnstruct();
    if (isdefined(classstruct.loadoutprimaryfullname) && classstruct.loadoutprimaryfullname != "none") {
        assets.primaryweapon = classstruct.loadoutprimaryfullname;
    }
    if (isdefined(classstruct.loadoutsecondaryfullname) && classstruct.loadoutsecondaryfullname != "none") {
        assets.secondaryweapon = classstruct.loadoutsecondaryfullname;
    }
    customization = namespace_6d8da2b47f878104::getcustomization();
    if (isdefined(customization["body"])) {
        assets.body = customization["body"];
    }
    if (isdefined(customization["head"])) {
        assets.head = customization["head"];
    }
    return assets;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa1
// Size: 0xdf
function loadplayerassets(var_424ddd9840da9529, var_ae2c4ed794036495, var_8c3977c9c8dc729b) {
    var_e2705839f9350b00 = [];
    foreach (assets in var_424ddd9840da9529) {
        if (isdefined(assets.primaryweapon)) {
            var_e2705839f9350b00[var_e2705839f9350b00.size] = assets.primaryweapon;
        }
        if (isdefined(assets.secondaryweapon)) {
            var_e2705839f9350b00[var_e2705839f9350b00.size] = assets.secondaryweapon;
        }
        if (!istrue(var_8c3977c9c8dc729b)) {
            self loadcustomization(assets.body, assets.head, var_ae2c4ed794036495);
        }
    }
    if (var_e2705839f9350b00.size > 0) {
        self loadweaponsforplayer(var_e2705839f9350b00, var_ae2c4ed794036495);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b87
// Size: 0x7a
function allplayershaveassetsloaded(assets) {
    var_e2705839f9350b00 = [];
    if (isdefined(assets.primaryweapon)) {
        var_e2705839f9350b00[var_e2705839f9350b00.size] = assets.primaryweapon;
    }
    if (isdefined(assets.secondaryweapon)) {
        var_e2705839f9350b00[var_e2705839f9350b00.size] = assets.secondaryweapon;
    }
    if (!self hasloadedviewweapons(var_e2705839f9350b00)) {
        return 0;
    }
    if (!self hasloadedcustomizationviewmodels(assets.body)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c09
// Size: 0x7c9
function getspawnpoint() {
    spawnpoint = undefined;
    spawnorigin = undefined;
    spawnangles = undefined;
    self.ti_spawn = 0;
    if (getdvarint(@"hash_3f36284b49b3d7a", 0) != 0) {
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            spawnarray = getspawnarray("mp_dm_spawn_start");
            if (spawnarray.size == 0) {
                spawnarray = getspawnarray("mp_tdm_spawn_allies_start");
            }
        } else {
            spawnarray = getspawnarray("mp_tdm_spawn_allies_start");
        }
        spawnpoint = spawnarray[0];
        spawnorigin = getgroundposition(spawnpoint.origin, 15);
        spawnangles = spawnpoint.angles;
    } else if (isdefined(self.forcespawnorigin)) {
        var_e5f115aee2bf7de7 = revivespawnvalidationcheck();
        if (!var_e5f115aee2bf7de7.isvalidpos && isdefined(self.prevrevivepos) && !isdefined(self.rallypoint)) {
            spawnorigin = self.prevrevivepos;
        } else {
            spawnorigin = self.forcespawnorigin;
            self.forcespawnorigin = undefined;
        }
        if (isdefined(self.forcespawnangles)) {
            spawnangles = self.forcespawnangles;
            self.forcespawnangles = undefined;
        } else {
            spawnangles = (0, randomfloatrange(0, 360), 0);
        }
        if (isdefined(self.reviver)) {
            if (istrue(self.liveRagdoll)) {
                vehicles = vehicle_getarrayinradius(spawnorigin, 500);
                foreach (vehicle in vehicles) {
                    if (vehicle namespace_1fbd40990ee60ede::function_4e4cf75e0f7e4184(spawnorigin)) {
                        var_57ac4dc40b2e376 = namespace_1fbd40990ee60ede::function_9d86fd9a89cd2702(self, vehicle, spawnorigin);
                        var_2b16a165170d3506 = var_57ac4dc40b2e376[1];
                        exitorigin = var_57ac4dc40b2e376[0];
                        spawnorigin = exitorigin;
                        break;
                    }
                }
            } else if (positionwouldtelefrag(spawnorigin) || !var_e5f115aee2bf7de7.isvalidpos) {
                spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(self.reviver);
                self.reviver = undefined;
                if (isdefined(spawnpoint)) {
                    spawnorigin = spawnpoint.origin;
                    spawnangles = spawnpoint.angles;
                }
            } else {
                spawnorigin = var_e5f115aee2bf7de7.spawnposition;
            }
        }
    } else if (istrue(level.usespawnselection) && self [[ level.var_d280c5fdb0036183 ]]() && istrue(gameflag("prematch_done"))) {
        spawnpoint = namespace_8e28f8b325a83325::getspawnpoint();
        /#
            assertex(isdefined(spawnpoint), "Script failed to return a spawn point for SpawnSelection");
        #/
        /#
            assert(isdefined(spawnpoint.origin));
        #/
        /#
            assert(isdefined(spawnpoint.angles));
        #/
        spawnorigin = spawnpoint.origin;
        spawnangles = spawnpoint.angles;
    } else {
        spawnpoint = self [[ level.getspawnpoint ]]();
        /#
            assertex(isdefined(spawnpoint), "Script failed to return a spawn point for a normal spawn");
        #/
        /#
            assert(isdefined(spawnpoint.origin));
        #/
        /#
            assert(isdefined(spawnpoint.angles));
        #/
        spawnorigin = spawnpoint.origin;
        spawnangles = spawnpoint.angles;
    }
    if (isdefined(self.setspawnpoint)) {
        if (!istrue(level.usespawnselection)) {
            self.ti_spawn = 1;
        }
        if (istrue(self.ti_spawn)) {
            spawnpoint = self.setspawnpoint;
            if (!istrue(self.setspawnpoint.notti)) {
                if (istrue(level.isgroundwarinfected) && istrue(level.var_624c83b532efce04) && level.mapname != "mp_aniyah") {
                    self.movedtoinfected = undefined;
                    var_677ffa8b71c88aa7 = ter_op(istrue(level.alwaysdoskyspawnontacinsert), 1, istrue(self.setspawnpoint.issuper));
                    if (var_677ffa8b71c88aa7) {
                        self.setspawnpoint.playerspawnpos = self.setspawnpoint.playerspawnpos + (0, 0, level.infectparachuteheightoffset);
                        var_297d86376147f0fd = getdvarint(@"hash_492618a75e1c0035", 0);
                        if (var_297d86376147f0fd > 0) {
                            if (self.setspawnpoint.playerspawnpos[2] > var_297d86376147f0fd) {
                                self.setspawnpoint.playerspawnpos = (self.setspawnpoint.playerspawnpos[0], self.setspawnpoint.playerspawnpos[1], var_297d86376147f0fd);
                            }
                        }
                        self.isparachutespawning = 1;
                    }
                }
                self.ti_spawn = 1;
                self playlocalsound("tactical_spawn");
                if (level.teambased) {
                    foreach (entry in level.teamnamelist) {
                        if (entry != self.team) {
                            self playsoundtoteam("tactical_spawn", entry);
                        }
                    }
                } else {
                    self playsound("tactical_spawn");
                }
            }
            foreach (tank in level.ugvs) {
                if (distancesquared(tank.origin, spawnpoint.playerspawnpos) < 1024) {
                    tank notify("damage", 5000);
                }
            }
            /#
                assert(isdefined(spawnpoint.playerspawnpos));
            #/
            /#
                assert(isdefined(spawnpoint.angles));
            #/
            if (namespace_add8ab90fc53d7f7::function_801a0264d93b7be6(self.setspawnpoint.playerspawnpos)) {
                spawnorigin = self.setspawnpoint.playerspawnpos;
                spawnangles = self.setspawnpoint.playerspawnangles;
            } else {
                var_57f38e8d47549af9 = getnodesinradiussorted(self.setspawnpoint.playerspawnpos, 512, 0, 64, "path");
                foreach (node in var_57f38e8d47549af9) {
                    position = node.origin + (0, 0, 3);
                    if (canspawn(position, self)) {
                        spawnorigin = position;
                        spawnangles = node.angles;
                        break;
                    }
                }
            }
            namespace_add8ab90fc53d7f7::spawnpoint_clearspawnpoint(0, 1);
            spawnpoint = undefined;
        }
    }
    spawndata = spawnstruct();
    spawndata.spawnpoint = spawnpoint;
    spawndata.spawnorigin = spawnorigin;
    if (!isdefined(spawnangles)) {
        spawnangles = (0, 0, 0);
    }
    spawndata.spawnangles = (0, spawnangles[1], 0);
    return spawndata;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43da
// Size: 0x150c
function spawnplayer(var_13fe2b86c5e85a64, var_9156b53bcf7ce573) {
    self endon("disconnect");
    self endon("joined_spectators");
    self notify("spawned");
    self notify("end_respawn");
    self notify("started_spawnPlayer");
    if (self.team == "codcaster") {
        return;
    }
    if (!isdefined(var_13fe2b86c5e85a64)) {
        var_13fe2b86c5e85a64 = 0;
    }
    if (!isdefined(var_9156b53bcf7ce573)) {
        var_9156b53bcf7ce573 = 0;
    }
    if (teamhasinfil(self.team) && !gameflag("infil_started") && !isdefined(level.bypassclasschoicefunc)) {
        if (getdvarint(@"hash_206a763969420ce0", 0) == 1 && namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm" && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "sandbox" && getsubgametype() != "rumble_mgl") {
            var_f6f520c104bf3bdb = teamhasinfil(self.team);
            started = gameflag("infil_started");
            bypass = isdefined(level.bypassclasschoicefunc);
            namespace_9c840bb9f2ecbf00::demoforcesre("spawnPlayer()" + self.name + " ui_options_menu = 2, hasInfil = " + var_f6f520c104bf3bdb + " infil_started = " + started + "bypassClassChoiceFunc = " + bypass);
        }
        if (!istrue(self.var_10844ddcb34694ee)) {
            self setclientomnvar("ui_options_menu", 2);
        }
    } else if (!isdefined(game["state"]) || game["state"] != "playing") {
        self setclientomnvar("ui_options_menu", 0);
    }
    self setclientomnvar("ui_hud_shake", 0);
    self setclientomnvar("ui_combat_report_num_attackers", 0);
    self.lastkillsplash = undefined;
    self.spawnedasspectator = undefined;
    self.scorestreakvariantattackerinfo = undefined;
    self.cratemantle = undefined;
    self.var_4a2f2f50a9020e2e = undefined;
    if (getdvarint(@"hash_f16ba8db72f34fc3", 0) != 0) {
        level thread namespace_f1fe279354a7da2::function_c11936b9c6c3a076(self);
    }
    /#
        if (getdvarint(@"hash_c4849d6a757e0b64", 0) != 0) {
            self.waitingtospawnamortize = 1;
            numplayerswaitingtospawn = getdvarint(@"hash_c4849d6a757e0b64", 0);
            wait(level.framedurationseconds * numplayerswaitingtospawn);
            self.waitingtospawnamortize = 0;
        }
    #/
    level.numplayerswaitingtospawn++;
    if (level.numplayerswaitingtospawn > 1) {
        /#
            println("liveRagdoll");
        #/
        self.waitingtospawnamortize = 1;
        wait(level.framedurationseconds * (level.numplayerswaitingtospawn - 1));
    }
    if (getteamdata(self.team, "noRespawns") == 1 && !var_9156b53bcf7ce573) {
        if (!isdefined(self.var_dcc0fd71c4f4b76c)) {
            return;
        } else if (level.var_defc2acd2b0203ad[self.team] < self.var_dcc0fd71c4f4b76c) {
            return;
        }
    }
    thread spawningclientthisframereset();
    self.waitingtospawnamortize = 0;
    self.var_917b4bb916a1c110 = 0;
    thread function_36fb658dd865a01a();
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("copiedClass"))) {
        var_b45e94b269ae0a46 = namespace_d19129e4fa5d176::preloadandqueueclass(self.class, 1);
    } else {
        classstruct = namespace_d19129e4fa5d176::loadout_getorbuildclassstruct(self.class);
        namespace_d19129e4fa5d176::loadout_fixcopiedclassstruct(self.pers["copiedClass"], classstruct);
        if (isdefined(self.pers["lastKiller"])) {
            logloadoutcopy(self.pers["lastKiller"]);
            self.pers["lastKiller"] = undefined;
        }
        namespace_d19129e4fa5d176::preloadandqueueclassstruct(self.pers["copiedClass"], 1);
        var_b45e94b269ae0a46 = self.pers["copiedClass"];
        self.pers["copiedClass"] = undefined;
    }
    var_90cdc2fa578a7859 = gettime();
    self.spawndata = getspawnpoint();
    setspawnvariables();
    /#
        if (!getdvarint(@"hash_9c2d59c1962cac50")) {
            /#
                assert(level.teambased && (denysystemicteamchoice() || self.sessionteam == self.team) || !level.teambased && self.sessionteam == "ui_player_spawned_notify");
            #/
        }
    #/
    hadspawned = self.hasspawned;
    self.suicidespawndelay = undefined;
    self.fauxdead = undefined;
    self sethidenameplate(0);
    self function_5226227bce83ebe9(2, self.team);
    if (!var_13fe2b86c5e85a64) {
        self.killsthislife = [];
        if (!istrue(self.inspawncamera)) {
            updatesessionstate("playing");
        }
        clearkillcamstate();
        self.cancelkillcam = undefined;
        if (istrue(self.liveRagdoll)) {
            /#
                println("offhand_primary_weapons" + gettime() + "allow_jump" + self.name + "killstreaks" + self.health);
            #/
        }
        self.maxhealth = namespace_775507ba36294dfb::gettweakablevalue("player", "maxhealth");
        if (istrue(var_9156b53bcf7ce573)) {
            health = getwatcheddvar("teamReviveHealth");
            if (!isdefined(health)) {
                self.health = getdvarint(@"hash_a8543004b97470b5", 50);
            } else {
                self.health = health;
            }
            thread notifyreviveregen();
        } else {
            self.health = self.maxhealth;
        }
        if (istrue(self.friendlyfiredeath)) {
            self.friendlyfiredeath = undefined;
            thread namespace_310ba947928891df::ffmessageonspawn();
        }
        self.friendlydamage = undefined;
        self.spawntime = gettime();
        self.wasti = self.ti_spawn;
        self.damagedplayers = [];
        self.objectivescaler = 1;
        self.shieldbullethits = 0;
        self.recentshieldxp = 0;
        self.respawntimerstarttime = undefined;
        self.var_db03ae1b2b480308 = undefined;
        self.lastgastouchtime = undefined;
        self.lastsnapshotgrenadetime = undefined;
        self.lastinsmoketime = undefined;
        self.lastburntime = undefined;
        self.lasttimedamaged = undefined;
        self.var_198b774c93c48891 = undefined;
        self.var_9691e7d8cde294f2 = undefined;
        self.var_c365befd3d253aef = undefined;
        self.var_b43706cbb600fe5a = undefined;
        self.var_7744df488b629b5 = undefined;
        self.clearSpawnProtection = undefined;
        namespace_3c5a4254f2b957ea::initpersstat("agentsKillstreakCount");
        if (isdefined(self.stuckbygrenade) && self.stuckbygrenade.stuckenemyentity == self) {
            self.stuckbygrenade.stuckenemyentity = undefined;
        }
        self.stuckbygrenade = undefined;
        self.stuckbygrenadeowner = undefined;
        self.lifeid = 0;
        if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 1) {
            if (isdefined(game["gameStateRestore"]) && istrue(game["gameStateRestore"].enabled)) {
                self.pers["deaths"] = namespace_78664ff0ec715b75::function_9505807477b46fa4(self.name);
            }
        }
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("deaths"))) {
            self.lifeid = namespace_3c5a4254f2b957ea::getpersstat("deaths");
        }
        cleardamagemodifiers();
        namespace_54fe482119c59b2f::clearkillcamomnvars();
    }
    self.movespeedscaler = 1;
    if (!var_13fe2b86c5e85a64) {
        self.avoidkillstreakonspawntimer = 5;
        var_f6ef404dcb6eb18c = namespace_3c5a4254f2b957ea::getpersstat("lives");
        if (var_f6ef404dcb6eb18c == getgametypenumlives() && function_60bf8d82001fc22c() != "control") {
            namespace_99ac021a7547cae3::addtolivescount();
        }
        if (var_f6ef404dcb6eb18c) {
            if (function_60bf8d82001fc22c() != "control") {
                namespace_3c5a4254f2b957ea::incpersstat("lives", -1);
            }
        }
        if (!istrue(self.gulag) && !istrue(self.respawningfromtoken) && !istrue(self.respawningbr)) {
            namespace_99ac021a7547cae3::addtoalivecount("spawnPlayer");
        }
        if (!hadspawned || gamehasstarted() || gamehasstarted() && level.ingraceperiod && self.hasdonecombat) {
            var_5e94c58dde8a0c0a = 1;
            if (!istrue(level.suicideTeamKillLowersLives) && istrue(self.var_5f07316a0cb9f1de)) {
                if (function_60bf8d82001fc22c() == "control") {
                    var_5e94c58dde8a0c0a = 0;
                }
            } else if (istrue(level.var_6f175c9cc4d2f1b7)) {
                var_5e94c58dde8a0c0a = 0;
            }
            if (var_5e94c58dde8a0c0a) {
                namespace_99ac021a7547cae3::removefromlivescount();
            }
        }
        if (!istrue(self.wasaliveatmatchstart)) {
            var_2208746f8409b6d0 = 20;
            if (gettimelimit() > 0 && var_2208746f8409b6d0 < gettimelimit() / 4) {
                var_2208746f8409b6d0 = gettimelimit() / 4;
            }
            if (level.ingraceperiod || gettimepassed() < var_2208746f8409b6d0 * 1000) {
                self.wasaliveatmatchstart = 1;
            }
        }
    }
    thread namespace_aad14af462a74d08::onspawn();
    var_cc0031b0b6ec18b1 = getdvar(@"hash_f2bdd0a9974968aa", "65");
    if (self isconsoleplayer()) {
        self setclientdvar(@"hash_df1dc712c4a91588", var_cc0031b0b6ec18b1);
    }
    if (isdefined(self.spawndata.spawnpoint)) {
        if (!istrue(self.shouldgetnewspawnpoint)) {
            namespace_b2d5aa2baf2b5701::finalizespawnpointchoice(self.spawndata.spawnpoint);
        }
        self.lastspawntime = gettime();
    } else if (!isdefined(self.faux_spawn_infected)) {
        self.lastspawntime = gettime();
    }
    self.spawnpos = self.spawndata.spawnorigin;
    if (var_13fe2b86c5e85a64 && namespace_19b4203b51d56488::touchingarbitraryuptrigger()) {
        if (self isonground()) {
            self normalizeworldupreferenceangles();
            self.spawndata.spawnorigin = self.spawndata.spawnorigin - (0, 0, 80);
        }
        spawnangles = self getworldupreferenceangles();
    }
    self.var_91ff03702332cc07 = 0;
    self.var_489f22c08f63bc0f = 0;
    namespace_5aeecefc462876::setspectatepermissions();
    if (istrue(self.liveRagdoll)) {
        self sethidenameplate(0);
        self.healthregendisabled = 0;
        self.liveRagdoll = 0;
        stopspectateplayer(self getentitynumber(), 1, 0);
        updatesessionstate("playing");
        namespace_f8065cafc523dba5::function_6fb380927695ee76();
        namespace_f8065cafc523dba5::function_985b0973f29da4f8("playerlogic::spawnPlayer()");
        self function_6b4c8718bc36d1ef(0);
        self function_e4ccd01fb7ec7a6f(0);
        self function_d87e1768229d0e3e();
        _freezecontrols(0, undefined, "liveRagdoll");
        namespace_d19129e4fa5d176::function_c5ce8711741e44b8();
    } else {
        if (isdefined(self.var_f109e15fae27ddc2)) {
            self function_fe283bad58880808(self.spawndata.spawnorigin, self.spawndata.spawnangles[1], self.var_f109e15fae27ddc2);
        } else {
            self spawn(self.spawndata.spawnorigin, self.spawndata.spawnangles);
        }
        playerangles = undefined;
        if (isdefined(level.var_bdd92c05d3032f65)) {
            playerangles = self [[ level.var_bdd92c05d3032f65 ]]();
        }
        if (!isdefined(playerangles)) {
            playerangles = (0, self.spawndata.spawnangles[1], 0);
        }
        self setplayerangles(playerangles, 1);
        printspawnmessage("playerlogic::spawnPlayer() !!!CODE SPAWN!!! @" + self.spawndata.spawnorigin);
        if (getdvar(@"hash_87485eca39b418a6") == "1" && namespace_36f464722d326bbe::function_ba5574c7f287c587() && !istrue(self.gulag)) {
            namespace_b903a23a81915f18::hudoutline_add_channel_internal("target acquisition", 1, getdvar(@"hash_b2a3957007bd8417", "outline_depth_trans_red"));
            if (!isbot(self)) {
                function_8f1890d7f6b565c4();
            }
        }
        if (getdvarint(@"hash_432df71393030be5", 0) == 1) {
            namespace_b903a23a81915f18::hudoutline_add_channel_internal("damage", 2, "outline_nodepth_white");
        }
    }
    self.var_8a3630d09e62ccb3 = [];
    if (!istrue(self.inspawncamera)) {
        self.var_f109e15fae27ddc2 = undefined;
        self.var_9066885bd8b59751 = undefined;
    }
    if (!isdefined(level.lastspawnpos)) {
        level.lastspawnpos = [];
    }
    level.lastspawnpos[self.team] = self.spawndata.spawnorigin;
    self.death_timer_length = 1023;
    if ((var_13fe2b86c5e85a64 || var_9156b53bcf7ce573) && isdefined(self.faux_spawn_stance)) {
        self setstance(self.faux_spawn_stance);
        self.faux_spawn_stance = undefined;
    }
    if (isai(self)) {
        _freezecontrols(1, undefined, "spawn");
    }
    self motionblurhqenable();
    if (!var_13fe2b86c5e85a64) {
        self painvisionon();
    }
    canparachutebecut(self);
    [[ level.onspawnplayer ]](var_9156b53bcf7ce573);
    if (!isdefined(level.var_58a42cd072629ca) || [[ level.var_58a42cd072629ca ]]()) {
        self clearpredictedstreampos();
    }
    var_89c45825fbc9944b = !var_13fe2b86c5e85a64 || istrue(self.faux_spawn_infected);
    if (var_89c45825fbc9944b) {
        if (isai(self) && isdefined(level.bot_funcs) && isdefined(level.bot_funcs["player_spawned"])) {
            self [[ level.bot_funcs["player_spawned"] ]]();
        }
        if (isdefined(level.matchrecording_logevent)) {
            [[ level.matchrecording_logevent ]](self.clientid, self.team, "SPAWN", self.spawnpos[0], self.spawnpos[1], self.spawntime);
        }
        if (!isai(self) && !namespace_36f464722d326bbe::isBRStyleGameType()) {
            thread totaldisttracking(self.spawndata.spawnorigin);
        }
    }
    if (!var_13fe2b86c5e85a64) {
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_player_spawned", self);
        callback::callback("onPlayerSpawn_destroyEquipment");
        self.matchdatalifeindex = -1;
        if (namespace_de6e6777b0937bd7::function_892570944f6b6a2(self)) {
            self.matchdatalifeindex = game["life_count"];
            game["life_count"]++;
        }
        self.lastmatchdatakillstreakindex = -1;
        if (getdvarint(@"hash_4ba1427c86b79dc5") != 0) {
            setmatchdata("lifeCount", game["life_count"]);
        }
    }
    if (isdefined(self.selectedspawnarea)) {
        namespace_bd0162aedd8c8594::logevent_spawnselectionchoice(self, self.selectedspawnarea);
    }
    namespace_1a507865f681850e::clearallequipment();
    /#
        assert(namespace_d19129e4fa5d176::isvalidclass(self.class));
    #/
    if (istrue(level.var_606eb45e074ff204)) {
        namespace_b6a8027f477010e1::function_7ef2f6d740da9325();
    }
    namespace_d19129e4fa5d176::setclass(self.class);
    if (isdefined(level.custom_giveloadout)) {
        self [[ level.custom_giveloadout ]](var_13fe2b86c5e85a64, var_9156b53bcf7ce573);
    } else {
        if (istrue(self.var_309a9b707ba4b596)) {
            thread namespace_add8ab90fc53d7f7::function_3807e5acb77b5011(var_9156b53bcf7ce573);
        } else {
            namespace_d19129e4fa5d176::giveloadout(self.team, self.class, undefined, undefined, var_9156b53bcf7ce573);
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            namespace_b6a8027f477010e1::function_f2dbab6f947771f2();
            self.var_a7befb30cd4958cb = 1;
            if (!namespace_82dcd1d5ae30ff7::_hasperk("specialty_overcharge_field_upgrade")) {
                namespace_85d036cb78063c4a::function_b3d636936ec98aa0(0);
                self.var_a68b289a82138067 = undefined;
            }
        }
        if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_survivor")) {
            self.var_4945d0d82dd3964b = 0;
        }
    }
    if (getomnvar("ui_prematch_period")) {
        thread showgamemodeobjectivetext();
        thread function_155c4aaa1dae57e6();
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            thread function_ebd3a9ccfbeb79c3();
        }
    }
    if (!istrue(game["isLaunchChunk"])) {
        thread logstartingloadout();
        if (istrue(level.codcasterenabled) && !self iscodcaster()) {
            thread function_1354d352db863672(self);
        }
    }
    if (isdefined(game["roundsPlayed"]) && game["roundsPlayed"] > 0) {
        if (!isdefined(self.classrefreshed) || !self.classrefreshed) {
            if (isdefined(self.class_num)) {
                self.classrefreshed = 1;
            }
        }
    }
    if (getdvarint(@"hash_c00e244ea59d530e")) {
        setthirdpersondof(1);
    }
    if (isai(self)) {
        _freezecontrols(0, undefined, "spawn");
    }
    if (istrue(game["inLiveLobby"]) || namespace_36f464722d326bbe::isBRStyleGameType() && !gameflag("prematch_done")) {
        if (getsubgametype() == "dmz" || getsubgametype() == "exgm") {
            allowprematchlook(self);
        }
    } else if (!gameflag("prematch_done")) {
        allowprematchlook(self);
    } else {
        force = !self.hasspawned;
        _freezecontrols(0, force, "spawn");
        _freezelookcontrols(0, force);
    }
    if (!istrue(self.hasspawned)) {
        namespace_d576b6dc7cef9c62::updatematchhasmorethan1playeromnvaronplayersfirstspawn();
    }
    if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("hasEarnedHardlineStreak")) && namespace_3c5a4254f2b957ea::getpersstat("hasEarnedHardlineStreak") == 0) {
        namespace_58a74e7d54b56e8d::givestreakpoints(#"hash_faa043c8926419e6", 3, 0);
    }
    self.hasspawned = 1;
    self.pers["hasSpawned"] = 1;
    if (isdefined(level.var_fa280df6cfd09d0b)) {
        self [[ level.var_fa280df6cfd09d0b ]]();
    }
    /#
        assert(var_90cdc2fa578a7859 == gettime());
    #/
    waittillframeend();
    self.spawningafterremotedeath = undefined;
    self.delayedspawnedplayernotify = undefined;
    if (!istrue(level.disablespawncamera) && isdefined(self.spawncameraent) || istrue(level.disablespawncamera) && isdefined(self.spawncameraent) && (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk")) {
        self.wasrevivespawn = var_9156b53bcf7ce573;
        self.delayedspawnedplayernotify = 1;
        self notify("spawncamera_start");
    }
    if (istrue(self.var_309a9b707ba4b596)) {
        self.wasrevivespawn = var_9156b53bcf7ce573;
        self.delayedspawnedplayernotify = 1;
        self notify("ti_spawncamera_start");
    }
    if (!istrue(self.delayedspawnedplayernotify)) {
        self notify("spawned_player");
        level notify("player_spawned", self);
        thread setspawnnotifyomnvar();
    }
    if (game["state"] == "postgame") {
        /#
            assert(!level.intermission);
        #/
        namespace_d576b6dc7cef9c62::freezeplayerforroundend();
    }
    if (namespace_bd0162aedd8c8594::analyticsspawnlogenabled() && !var_13fe2b86c5e85a64) {
        if (namespace_bd0162aedd8c8594::analyticsdoesspawndataexist()) {
            level.spawncount = level.spawncount + 1;
        } else {
            namespace_bd0162aedd8c8594::analyticsinitspawndata();
        }
        if (namespace_bd0162aedd8c8594::analyticssend_shouldsenddata(level.spawncount)) {
            if (isdefined(level.spawnglobals.spawnpointslist)) {
                namespace_bd0162aedd8c8594::analyticssend_spawnfactors(self, self.spawnpointslist, level.spawncount, self.spawndata.spawnpoint);
                namespace_bd0162aedd8c8594::analyticssend_spawntype(self.spawndata.spawnpoint.origin, self.team, self.lifeid, level.spawncount);
                namespace_bd0162aedd8c8594::analyticssend_spawnplayerdetails(self, self.spawndata.spawnpoint.origin, level.spawncount);
            }
        }
        self.lastspawnpoint = self.spawndata.spawnpoint;
    }
    if (!istrue(self.delayedspawnedplayernotify)) {
        self.spawndata = undefined;
    }
    if (!isdefined(self.revive_chosenclass)) {
        thread namespace_d19129e4fa5d176::updateinstantclassswapallowed();
    }
    var_c2ae70bad4794c38 = 0;
    /#
        var_c2ae70bad4794c38 = getdvarint(@"hash_174506584f9d388e", 0) == 1;
    #/
    if (var_c2ae70bad4794c38 || isusingmatchrulesdata() && getmatchrulesdata("commonOption", "allowParachute") || gametypesupportsbasejumping() && mapsupportsbasejumping()) {
        self skydive_setbasejumpingstatus(1);
        self skydive_setdeploymentstatus(1);
    }
    self.var_917b4bb916a1c110 = 1;
    self notify("validate_spawn");
    if (istrue(self.var_b1e84fe29da97885)) {
        level thread namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0);
    }
    callback("player_spawned");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ed
// Size: 0x39
function function_36fb658dd865a01a() {
    self endon("disconnect");
    waittill_any_timeout_1(1, "validate_spawn");
    if (!istrue(self.var_917b4bb916a1c110)) {
        kick(self getentitynumber(), "EXE/PLAYERKICKED");
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x592d
// Size: 0xb
function function_8f1890d7f6b565c4() {
    thread function_9055412313c726ad();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x593f
// Size: 0x416
function function_9055412313c726ad() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(self)) {
        return;
    }
    self.var_c7365acbd7c37449 = [];
    var_68a6cd6d3cb58e79 = spawnstruct();
    self.var_c6500dfc575dc550 = 0;
    self.var_17915db3de174953 = 0;
    thread function_c1c09484380f4831();
    while (1) {
        enemies = self getsightedplayers();
        if (!isdefined(enemies)) {
            continue;
        }
        if (self.var_17915db3de174953) {
            if (!self.var_c6500dfc575dc550) {
                foreach (var_83a92033fbdb65f8 in enemies) {
                    var_83a92033fbdb65f8 namespace_b903a23a81915f18::function_32dfa50c47325abe(self, "target acquisition", 1);
                }
                self.var_c6500dfc575dc550 = 1;
            }
            waitframe();
            continue;
        }
        function_a9d32c0b976412da(var_68a6cd6d3cb58e79);
        var_2fd22303c5fca912 = namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz";
        foreach (var_83a92033fbdb65f8 in enemies) {
            if (var_2fd22303c5fca912) {
                jumpiffalse(isdefined(var_83a92033fbdb65f8.var_6a984a8887a1a08b) && !var_83a92033fbdb65f8.var_6a984a8887a1a08b) LOC_000001b4;
            } else {
            LOC_000001b4:
                if (array_contains_key(self.var_c7365acbd7c37449, var_83a92033fbdb65f8.clientid)) {
                    self.var_c7365acbd7c37449[var_83a92033fbdb65f8.clientid].visible = 1;
                } else {
                    self.var_c7365acbd7c37449[var_83a92033fbdb65f8.clientid] = spawnstruct();
                    self.var_c7365acbd7c37449[var_83a92033fbdb65f8.clientid].var_bbe3bc9d5de09af8 = var_83a92033fbdb65f8;
                    self.var_c7365acbd7c37449[var_83a92033fbdb65f8.clientid].var_d32ff37e82ab0cff = 0;
                    thread function_1610dbc40254209c(var_83a92033fbdb65f8);
                }
                enable_outline = 0;
                viewpos = var_83a92033fbdb65f8 gettagorigin("j_spinelower") - self gettagorigin("tag_eye");
                var_d2e4bddeddc9b4f9 = length(viewpos);
                if (self.var_c7365acbd7c37449[var_83a92033fbdb65f8.clientid].var_d32ff37e82ab0cff) {
                    if (var_d2e4bddeddc9b4f9 < var_68a6cd6d3cb58e79.maxdist && var_d2e4bddeddc9b4f9 > getdvarfloat(@"hash_1adfe2e839bc58a6")) {
                        angle = namespace_d3f3cb0a543667c1::anglebetweenvectors(viewpos, anglestoforward(self getplayerangles()));
                        if (angle < var_68a6cd6d3cb58e79.maxangle) {
                            enable_outline = 1;
                        }
                    }
                }
                var_eeb63a7eca4dce95 = ter_op(!isbot(self), self function_e9d534b5f70dc904(), 1);
                if (var_eeb63a7eca4dce95 && enable_outline) {
                    var_83a92033fbdb65f8 namespace_b903a23a81915f18::hudoutline_enable_internal(self, "target acquisition");
                } else {
                    var_83a92033fbdb65f8 namespace_b903a23a81915f18::function_32dfa50c47325abe(self, "target acquisition", 1);
                }
            }
        }
        var_f421c15cb65f2710 = getarraykeys(self.var_c7365acbd7c37449);
        foreach (var_fd31c374b38d3c00 in var_f421c15cb65f2710) {
            if (isdefined(self.var_c7365acbd7c37449[var_fd31c374b38d3c00].visible) && !self.var_c7365acbd7c37449[var_fd31c374b38d3c00].visible) {
                self.var_c7365acbd7c37449[var_fd31c374b38d3c00].var_bbe3bc9d5de09af8 notify("out_of_sight_" + self.clientid);
                self.var_c7365acbd7c37449 = array_remove_key(self.var_c7365acbd7c37449, var_fd31c374b38d3c00);
            } else {
                self.var_c7365acbd7c37449[var_fd31c374b38d3c00].visible = 0;
            }
        }
        waitframe();
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d5c
// Size: 0xab
function function_c1c09484380f4831() {
    self endon("death_or_disconnect");
    while (1) {
        message = waittill_any_timeout_3(1, "vehicle_enter", "vehicle_change_seat", "vehicle_exit");
        if (self.var_c6500dfc575dc550 && message == "vehicle_exit") {
            self.var_c6500dfc575dc550 = 0;
            self.var_17915db3de174953 = 0;
        } else if (message == "vehicle_enter") {
            self.var_17915db3de174953 = namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(self);
        } else if (message == "vehicle_change_seat") {
            self.var_c6500dfc575dc550 = self.var_17915db3de174953;
            self.var_17915db3de174953 = namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(self);
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e0e
// Size: 0x68
function function_1610dbc40254209c(var_83a92033fbdb65f8) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_83a92033fbdb65f8 endon("death_or_disconnect");
    var_83a92033fbdb65f8 endon("out_of_sight_" + self.clientid);
    wait(getdvarfloat(@"hash_babf297f40ef9792", 1.5));
    self.var_c7365acbd7c37449[var_83a92033fbdb65f8.clientid].var_d32ff37e82ab0cff = 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e7d
// Size: 0xf4
function function_a9d32c0b976412da(var_68a6cd6d3cb58e79) {
    isads = self playerads() > 0.5;
    var_68a6cd6d3cb58e79.minangle = getdvarfloat(@"hash_82bf79a286a47409", 1);
    var_68a6cd6d3cb58e79.maxdist = ter_op(isads, getdvarfloat(@"hash_9166b379c429ca44"), getdvarfloat(@"hash_d9a3414a981b1b5a"));
    var_68a6cd6d3cb58e79.maxangle = ter_op(isads, getdvarfloat(@"hash_b04f78259746bfaa", 7), getdvarfloat(@"hash_7544939a6ec22268", 12));
    if (isads && self playergetzoomfov() <= 30) {
        var_68a6cd6d3cb58e79.maxdist = getdvarfloat(@"hash_7ea5074a21ca4ba1");
        var_68a6cd6d3cb58e79.maxangle = getdvarfloat(@"hash_ef8fa48b3241b8f3", 3);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f78
// Size: 0x7a
function logloadoutcopy(killer) {
    if (isdefined(killer)) {
        self dlog_recordplayerevent("dlog_event_loadout_copy", [0:"receiver_player_client_id", 1:self.clientid, 2:"receiver_gamertag", 3:self.name, 4:"giver_player_client_id", 5:killer.clientid, 6:"giver_gamertag", 7:killer.name]);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff9
// Size: 0x9d
function logstartingloadout() {
    if (gameflag("prematch_done")) {
        return;
    }
    if (!isdefined(self.curclass)) {
        return;
    }
    if (self.curclass == "juggernaut") {
        return;
    }
    self endon("death_or_disconnect");
    level endon("game_ended");
    namespace_d19129e4fa5d176::function_200c71e93799b32f(self.classstruct);
    gameflagwait("prematch_done");
    if (isdefined(level.var_493c039ada7d082e)) {
        throttle::function_f632348cbb773537(level.var_493c039ada7d082e, self);
    }
    namespace_d19129e4fa5d176::loadout_lognewlygivenloadout(self.globalstruct, self.classstruct, self.curclass);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x609d
// Size: 0x1b
function notifyreviveregen() {
    self endon("disconnect");
    self waittill("spawned_player");
    waitframe();
    self notify("force_regeneration");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60bf
// Size: 0x1c
function setspawnnotifyomnvar() {
    self endon("disconnect");
    waitframe();
    self setclientomnvar("ui_player_spawned_notify", gettime());
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60e2
// Size: 0x12f
function playerprematchallow(allow) {
    if (!allow) {
        val::set("prematch", "allow_movement", 0);
        val::set("prematch", "fire", 0);
        val::set("prematch", "offhand_weapons", 0);
        val::set("prematch", "offhand_primary_weapons", 0);
        val::set("prematch", "offhand_secondary_weapons", 0);
        val::set("prematch", "supers", 0);
        val::set("prematch", "allow_jump", 0);
        val::set("prematch", "melee", 0);
        val::set("prematch", "sprint", 0);
        val::set("prematch", "killstreaks", 0);
        val::set("prematch", "usability", 0);
        if (!istrue(level.disablemount)) {
            val::set("prematch_mount", "mount_top", 0);
            val::set("prematch_mount", "mount_side", 0);
        }
    } else {
        val::function_c9d0b43701bdba00("prematch");
        if (!istrue(level.disablemount)) {
            val::function_c9d0b43701bdba00("prematch_mount");
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6218
// Size: 0x28
function allowprematchlook(player) {
    player [[ level.prematchallowfunc ]](0);
    player.prematchlook = 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6247
// Size: 0x42
function clearprematchlook(player) {
    if (istrue(player.prematchlook) && !level.gameended) {
        player [[ level.prematchallowfunc ]](1);
        player.prematchlook = undefined;
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6290
// Size: 0x44
function waitforversusmenudone() {
    level endon("prematch_over");
    self endon("versus_menu_done");
    for (;;) {
        value = result = self waittill("luinotifyserver");
        if (result == "versus_done") {
            self notify("versus_menu_done");
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62db
// Size: 0xe1
function function_b18bcc805b8800e() {
    namespace_961ccdbc9a5d4c1e::function_bcb1d5fb674fa3a0();
    var_ac1d8e40765a422e = namespace_f8d3520d3483c1::function_600f6cf462e983f();
    var_dccf522fb0268d46 = 0;
    if (issharedfuncdefined("backpack", "getTotalItemCountInBag")) {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_armor_plate");
        var_dccf522fb0268d46 = [[ getsharedfunc("backpack", "getTotalItemCountInBag") ]](lootid);
    }
    var_fbe8d53a303038c4 = var_ac1d8e40765a422e + var_dccf522fb0268d46;
    namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(20, var_fbe8d53a303038c4);
    var_b8b6fa3d6f2f0b8c = 0;
    if (isdefined(self.gasmaskhealth) && isdefined(self.gasmaskmaxhealth)) {
        var_b8b6fa3d6f2f0b8c = (self.gasmaskhealth + 1) / self.gasmaskmaxhealth;
    }
    namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(21, var_b8b6fa3d6f2f0b8c);
    hasselfrevivetoken = namespace_d3d40f75bb4e4c32::hasselfrevivetoken();
    namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(22, hasselfrevivetoken);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63c3
// Size: 0x81
function function_1354d352db863672(player) {
    player endon("death_or_disconnect");
    for (;;) {
        for (;;) {
            if (isdefined(player.primaryweaponobj)) {
                player setclientweaponinfo(0, getcompleteweaponname(player.primaryweaponobj));
            }
            if (isdefined(player.secondaryweaponobj)) {
                player setclientweaponinfo(1, getcompleteweaponname(player.secondaryweaponobj));
            }
            player updatemlgammoinfo();
            player updatecurrentweapon();
            player function_b18bcc805b8800e();
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644b
// Size: 0x465
function function_38d8271a5b966538() {
    var_c2db1b6c79ea1c6c = getstructarray("camera_intro", "targetname");
    if (!isdefined(var_c2db1b6c79ea1c6c) || var_c2db1b6c79ea1c6c.size == 0) {
        var_c2db1b6c79ea1c6c = [];
        var_c2db1b6c79ea1c6c[0] = spawnstruct();
        var_c2db1b6c79ea1c6c[0].origin = (0, 0, 0);
        var_c2db1b6c79ea1c6c[0].angles = (0, 0, 0);
    }
    mapname = getmapname();
    switch (mapname) {
    case #"hash_a62df42a13dad323":
        var_c2db1b6c79ea1c6c[0].origin = (1606.95, 2238.61, 958.77);
        var_c2db1b6c79ea1c6c[0].angles = (17, 215, -4.14);
        break;
    case #"hash_81c63d549bea3339":
        var_c2db1b6c79ea1c6c[0].origin = (310, -627, 279);
        var_c2db1b6c79ea1c6c[0].angles = (4, 196, 0);
        break;
    case #"hash_8eb456b9e1d842c7":
        var_c2db1b6c79ea1c6c[0].origin = (1867, -2487, 664);
        var_c2db1b6c79ea1c6c[0].angles = (15, 118, 0);
        break;
    case #"hash_9c2fdccb75b37f7e":
        var_c2db1b6c79ea1c6c[0].origin = (-856, 2771, 1030);
        var_c2db1b6c79ea1c6c[0].angles = (18, 313, 0);
        break;
    case #"hash_a8186a9f8bd241d6":
        var_c2db1b6c79ea1c6c[0].origin = (691, -536, 223);
        var_c2db1b6c79ea1c6c[0].angles = (9, 159, 0);
        var_c2db1b6c79ea1c6c[1] = spawnstruct();
        var_c2db1b6c79ea1c6c[1].origin = (428, 508, 14);
        var_c2db1b6c79ea1c6c[1].angles = (0, 182, 0);
        var_d0f582ece8584466 = 1;
        break;
    case #"hash_d369b0ca801c4b63":
        var_c2db1b6c79ea1c6c[0].origin = (1260, 203, 239);
        var_c2db1b6c79ea1c6c[0].angles = (15, 189, 0);
        var_c2db1b6c79ea1c6c[1] = spawnstruct();
        var_c2db1b6c79ea1c6c[1].origin = (-582, -154, 64);
        var_c2db1b6c79ea1c6c[1].angles = (0, 137, 0);
        var_d0f582ece8584466 = 1;
        break;
    case #"hash_89cd8aae588a4328":
        var_c2db1b6c79ea1c6c[0].origin = (2446, 19, 377);
        var_c2db1b6c79ea1c6c[0].angles = (24, 178, 0);
        var_c2db1b6c79ea1c6c[1] = spawnstruct();
        var_c2db1b6c79ea1c6c[1].origin = (435, 11, 15);
        var_c2db1b6c79ea1c6c[1].angles = (0, 0, 0);
        var_d0f582ece8584466 = 1;
        break;
    case #"hash_51f2bb9a988ac56a":
        var_c2db1b6c79ea1c6c[0].origin = (254, 1651, 353);
        var_c2db1b6c79ea1c6c[0].angles = (10, 253, 0);
        var_c2db1b6c79ea1c6c[1] = spawnstruct();
        var_c2db1b6c79ea1c6c[1].origin = (231, -1024, 37);
        var_c2db1b6c79ea1c6c[1].angles = (353, 89, 0);
        var_d0f582ece8584466 = 1;
        break;
    case #"hash_a11e6e81ea219453":
    case #"hash_ce2681671c034722":
        var_c2db1b6c79ea1c6c[0].origin = (-36200, -25850, 2000);
        var_c2db1b6c79ea1c6c[0].angles = (25, 70, 0);
        break;
    case #"hash_5586b38644ed9b26":
        var_c2db1b6c79ea1c6c[0].origin = (-8982.57, -51049.3, 2653.06);
        var_c2db1b6c79ea1c6c[0].angles = (14, 59, 0);
        break;
    }
    return var_c2db1b6c79ea1c6c;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b8
// Size: 0xdd5
function spawnspectatormapcam(var_92baf229cb5ffad2) {
    var_2365afb9696e69a4 = 6;
    var_63efee80a44e06e1 = 4;
    var_c3899f8e31b31e75 = 4;
    var_d0f582ece8584466 = 0;
    self endon("disconnect");
    if (isai(self)) {
        return;
    }
    if (level.splitscreen || self issplitscreenplayer()) {
        self setclientdvars(@"hash_682a9bc40f96ca4a", "0.65");
    } else {
        self setclientdvars(@"hash_682a9bc40f96ca4a", "1");
    }
    self setclientomnvar("ui_mapshot_camera", 1);
    self lerpfovbypreset("mapflyover");
    var_c2db1b6c79ea1c6c = function_38d8271a5b966538();
    if (var_c2db1b6c79ea1c6c.size == 0 || gameflag("infil_will_run")) {
        self visionsetfadetoblackforplayer("", 0.75);
        return;
    }
    var_4006e26a6a576e8 = undefined;
    endpoint = undefined;
    var_940902e006c2d2a2 = undefined;
    setspawnvariables();
    setlowermessageomnvar("clear_lower_msg");
    updatesessionstate("spectator");
    self.pers["team"] = "spectator";
    self.team = "spectator";
    clearkillcamstate();
    self.friendlydamage = undefined;
    resetuidvarsonspectate();
    foreach (entry in level.teamnamelist) {
        self allowspectateteam(entry, 0);
    }
    self allowspectateteam("freelook", 0);
    self allowspectateteam("none", 0);
    if (isdefined(var_c2db1b6c79ea1c6c) && var_c2db1b6c79ea1c6c.size > 1 && !istrue(var_d0f582ece8584466)) {
        var_7342959c0a950bd8 = randomintrange(0, var_c2db1b6c79ea1c6c.size - 1);
        var_4006e26a6a576e8 = var_c2db1b6c79ea1c6c[var_7342959c0a950bd8];
    } else if (isdefined(var_c2db1b6c79ea1c6c)) {
        var_4006e26a6a576e8 = var_c2db1b6c79ea1c6c[0];
        if (istrue(var_d0f582ece8584466)) {
            var_940902e006c2d2a2 = var_c2db1b6c79ea1c6c[1];
        }
    } else {
        /#
            assertmsg("SETUP CAMRA_INTRO CAMERAS");
        #/
    }
    var_4006e26a6a576e8.fil = 1;
    _freezecontrols(1, undefined, "spectatorMapCam");
    self setspectatedefaults(var_4006e26a6a576e8.origin, var_4006e26a6a576e8.angles);
    self spawn(var_4006e26a6a576e8.origin, var_4006e26a6a576e8.angles);
    printspawnmessage("playerlogic::spawnSpectatorMapCam() !!!CODE SPAWN!!! @" + var_4006e26a6a576e8.origin);
    var_2584e8f1c45ffb37 = spawn("script_model", var_4006e26a6a576e8.origin);
    var_2584e8f1c45ffb37 setmodel("tag_origin");
    var_2584e8f1c45ffb37.angles = var_4006e26a6a576e8.angles;
    var_a0fd91f162829a01 = undefined;
    if (istrue(var_d0f582ece8584466)) {
        var_a0fd91f162829a01 = spawn("script_model", var_940902e006c2d2a2.origin);
        var_a0fd91f162829a01 setmodel("tag_origin");
        var_a0fd91f162829a01.angles = var_940902e006c2d2a2.angles;
    }
    thread waitforversusmenudone();
    if (isdefined(var_92baf229cb5ffad2) && var_92baf229cb5ffad2 == 99) {
        result = "debug";
        /#
            println("player_active");
        #/
    } else if (gameflag("prematch_done")) {
        result = "prematch_over";
    } else if (self.versusdone) {
        result = "versus_menu_done";
    } else {
        result = waittill_any_timeout_2(2, "versus_menu_done", "prematch_over");
    }
    if (result == "timeout") {
        if (gameflag("prematch_done")) {
            result = "prematch_over";
        } else {
            result = "versus_menu_done";
        }
    }
    if (result == "prematch_over") {
        self visionsetfadetoblackforplayer("", 0.75);
        return;
    }
    if (self issplitscreenplayer() && self issplitscreenplayerprimary()) {
        otherplayer = self getothersplitscreenplayer();
        otherplayer notify("versus_menu_done");
        waitframe();
    }
    self cameralinkto(var_2584e8f1c45ffb37, "tag_origin", 1);
    self notify("mapCamera_start");
    switch (level.mapname) {
    case #"hash_7ac8036cc19377e5":
        var_2584e8f1c45ffb37 scriptmodelplayanimdeltamotion("iw7_mp_intro_camera_parkour");
        self visionsetfadetoblackforplayer("", 0.75);
        self playlocalsound("mp_camera_intro_whoosh");
        wait(var_2365afb9696e69a4 - 0.25);
    default:
        break;
    }
    wait(0.25);
    self visionsetfadetoblackforplayer("", 0.75);
    self playlocalsound("mp_camera_intro_whoosh");
    var_951b839a25fb6bad = var_4006e26a6a576e8;
    endpoint[0] = spawnstruct();
    if (isdefined(var_4006e26a6a576e8.target)) {
        endpoint[0] = getstruct(var_4006e26a6a576e8.target, "targetname");
    } else {
        endpoint[0].origin = (0, 0, 0);
        endpoint[0].angles = (0, 0, 0);
    }
    switch (level.mapname) {
    case #"hash_a62df42a13dad323":
        endpoint[0].origin = (1925, -857, 1033);
        endpoint[0].angles = (362, 127, 0);
        break;
    case #"hash_81c63d549bea3339":
        endpoint[0].origin = (-399, -1457, 667);
        endpoint[0].angles = (15, 57, 0);
        break;
    case #"hash_8eb456b9e1d842c7":
        endpoint[0].origin = (1422, 2073, 464);
        endpoint[0].angles = (6, 236, 0);
        break;
    case #"hash_9c2fdccb75b37f7e":
        endpoint[0].origin = (1559, 1586, 1030);
        endpoint[0].angles = (30, 234, 0);
        break;
    case #"hash_a8186a9f8bd241d6":
        endpoint[0].origin = (921, 300, 223);
        endpoint[0].angles = (8, 202, 0);
        endpoint[1] = spawnstruct();
        endpoint[1].origin = (415, 372, 14);
        endpoint[1].angles = (3, 179, 0);
        break;
    case #"hash_d369b0ca801c4b63":
        endpoint[0].origin = (714, 440, 167);
        endpoint[0].angles = (13, 205, 0);
        endpoint[1] = spawnstruct();
        endpoint[1].origin = (-859, -349, 75);
        endpoint[1].angles = (7, 104, 0);
        break;
    case #"hash_89cd8aae588a4328":
        endpoint[0].origin = (1952, 354, 77);
        endpoint[0].angles = (6, 208, 0);
        endpoint[1] = spawnstruct();
        endpoint[1].origin = (906, 9, 15);
        endpoint[1].angles = (0, 0, 0);
        var_d0f582ece8584466 = 1;
        break;
    case #"hash_51f2bb9a988ac56a":
        endpoint[0].origin = (-1332, 483, 252);
        endpoint[0].angles = (11, 313, 0);
        endpoint[1] = spawnstruct();
        endpoint[1].origin = (65, -547, 351);
        endpoint[1].angles = (16, 83, 0);
        break;
    case #"hash_a11e6e81ea219453":
    case #"hash_ce2681671c034722":
        endpoint[0].origin = (-30200, -23550, 2000);
        endpoint[0].angles = (25, 150, 0);
        break;
    case #"hash_5586b38644ed9b26":
        endpoint[0].origin = (6444.48, -46895.7, 2653.06);
        endpoint[0].angles = (16, 117, 0);
        break;
    }
    totaldistance = 0;
    while (1) {
        if (isdefined(var_951b839a25fb6bad.speedadjust)) {
            var_600c46d6ed25dfd7 = 1 / var_951b839a25fb6bad.speedadjust;
            var_a2fbfa1ac218a716 = var_600c46d6ed25dfd7 * distance(var_951b839a25fb6bad.origin, endpoint[0].origin);
        } else {
            var_a2fbfa1ac218a716 = distance(var_951b839a25fb6bad.origin, endpoint[0].origin);
        }
        totaldistance = totaldistance + var_a2fbfa1ac218a716;
        var_951b839a25fb6bad.distancetotarg = var_a2fbfa1ac218a716;
        var_951b839a25fb6bad = endpoint[0];
        if (isdefined(var_951b839a25fb6bad.target)) {
            endpoint[0] = getstruct(var_951b839a25fb6bad.target, "targetname");
        } else {
            break;
        }
    }
    var_951b839a25fb6bad.eol = 1;
    var_951b839a25fb6bad = var_4006e26a6a576e8;
    if (isdefined(var_4006e26a6a576e8.target)) {
        endpoint[0] = getstruct(var_4006e26a6a576e8.target, "targetname");
    } else {
        endpoint[0].origin = (0, 0, 0);
        endpoint[0].angles = (0, 0, 0);
    }
    if (totaldistance > 0) {
        while (1) {
            var_12da28838c27dba0 = var_951b839a25fb6bad.distancetotarg / totaldistance;
            timetomove = ter_op(istrue(var_d0f582ece8584466), var_12da28838c27dba0 * var_63efee80a44e06e1, var_12da28838c27dba0 * var_2365afb9696e69a4);
            if (isdefined(endpoint[0].eol)) {
                decel = timetomove / 2;
            } else {
                decel = 0;
            }
            if (isdefined(var_951b839a25fb6bad.fil)) {
                accel = timetomove / 2;
            } else {
                accel = 0;
            }
            var_2584e8f1c45ffb37 moveto(endpoint[0].origin, timetomove, accel, decel);
            var_2584e8f1c45ffb37 rotateto(endpoint[0].angles, timetomove, accel, decel);
            if (isdefined(endpoint[0].eol)) {
                halftime = int(timetomove / 2);
                wait(halftime);
                wait(halftime);
            } else {
                wait(timetomove);
            }
            var_951b839a25fb6bad = endpoint[0];
            if (isdefined(var_951b839a25fb6bad.target)) {
                endpoint[0] = getstruct(var_951b839a25fb6bad.target, "targetname");
            } else {
                break;
            }
        }
    }
    if (istrue(var_d0f582ece8584466)) {
        totaldistance = 0;
        var_dd80e398990947f1 = var_940902e006c2d2a2;
        self spawn(var_940902e006c2d2a2.origin, var_940902e006c2d2a2.angles);
        self cameralinkto(var_a0fd91f162829a01, "tag_origin", 1);
        wait(0.25);
        self visionsetfadetoblackforplayer("", 0.75);
        self playlocalsound("mp_camera_intro_whoosh");
        while (1) {
            if (isdefined(var_dd80e398990947f1.speedadjust)) {
                var_600c46d6ed25dfd7 = 1 / var_dd80e398990947f1.speedadjust;
                var_a2fbfa1ac218a716 = var_600c46d6ed25dfd7 * distance(var_dd80e398990947f1.origin, endpoint[1].origin);
            } else {
                var_a2fbfa1ac218a716 = distance(var_dd80e398990947f1.origin, endpoint[1].origin);
            }
            totaldistance = totaldistance + var_a2fbfa1ac218a716;
            var_dd80e398990947f1.distancetotarg = var_a2fbfa1ac218a716;
            if (isdefined(var_dd80e398990947f1.target)) {
                endpoint[1] = getstruct(var_951b839a25fb6bad.target, "targetname");
            } else {
                break;
            }
        }
        var_dd80e398990947f1.eol = 1;
        var_dd80e398990947f1.fil = 1;
        endpoint[1].eol = 1;
        while (1) {
            var_12da28838c27dba0 = var_dd80e398990947f1.distancetotarg / totaldistance;
            timetomove = ter_op(istrue(var_d0f582ece8584466), var_12da28838c27dba0 * var_c3899f8e31b31e75, var_12da28838c27dba0 * var_2365afb9696e69a4);
            if (isdefined(endpoint[1].eol)) {
                decel = timetomove / 2;
            } else {
                decel = 0;
            }
            if (isdefined(var_dd80e398990947f1.fil)) {
                accel = timetomove / 2;
            } else {
                accel = 0;
            }
            var_a0fd91f162829a01 moveto(endpoint[1].origin, timetomove, accel, decel);
            var_a0fd91f162829a01 rotateto(endpoint[1].angles, timetomove, accel, decel);
            if (isdefined(endpoint[1].eol)) {
                halftime = int(timetomove / 2);
                wait(halftime);
                wait(halftime);
            } else {
                wait(timetomove);
            }
            var_dd80e398990947f1 = endpoint[1];
            if (isdefined(var_dd80e398990947f1.target)) {
                endpoint[1] = getstruct(var_dd80e398990947f1.target, "targetname");
            } else {
                break;
            }
        }
    }
    _freezecontrols(0, undefined, "spectatorMapCam");
    self.startcament = var_2584e8f1c45ffb37;
    self setclientomnvar("ui_mapshot_camera", 0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7694
// Size: 0xd0
function spawnspectator(origin, angles, gameended) {
    self notify("spawned");
    self notify("end_respawn");
    self notify("joined_spectators");
    level notify("joined_spectators", self);
    self.spawnedasspectator = 1;
    if (isdefined(self.deathspectatepos)) {
        origin = self.deathspectatepos;
        angles = vectortoangles(self.origin - self.deathspectatepos);
    }
    if (isdefined(self.startcament) && !isdefined(origin)) {
        origin = self.startcament.origin;
        angles = self.startcament.angles;
        self.startcament delete();
    }
    in_spawnspectator(origin, angles, gameended);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x776b
// Size: 0x6a
function respawn_asspectator(origin, angles) {
    if (isdefined(self.deathspectatepos)) {
        origin = self.deathspectatepos;
        if (isdefined(self.deathspectateangles)) {
            angles = self.deathspectateangles;
        } else {
            angles = vectortoangles(self.origin - self.deathspectatepos);
        }
    }
    in_spawnspectator(origin, angles);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77dc
// Size: 0xd7
function in_spawnspectator(origin, angles, gameended) {
    setspawnvariables();
    var_b47248e0c4294fa4 = self.pers["team"];
    if (isdefined(var_b47248e0c4294fa4) && (var_b47248e0c4294fa4 == "spectator" || var_b47248e0c4294fa4 == "codcaster") && !level.gameended) {
        setlowermessageomnvar("clear_lower_msg");
    }
    namespace_d19129e4fa5d176::loadout_clearperks();
    updatesessionstate("spectator");
    clearkillcamstate();
    self.friendlydamage = undefined;
    resetuidvarsonspectate();
    namespace_5aeecefc462876::setspectatepermissions();
    onspawnspectator(origin, angles, gameended);
    if (level.teambased && !level.splitscreen && !self issplitscreenplayer()) {
        setdof_spectator();
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78ba
// Size: 0x57
function getplayerfromclientnum(clientnum) {
    if (clientnum < 0) {
        return undefined;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] getentitynumber() == clientnum) {
            return level.players[i];
        }
    }
    return undefined;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7919
// Size: 0x2e7
function onspawnspectator(origin, angles, gameended) {
    if (isdefined(origin) && isdefined(angles)) {
        self setspectatedefaults(origin, angles);
        self spawn(origin, angles);
        printspawnmessage("playerlogic::onSpawnSpectator() !!!CODE SPAWN!!! @" + origin);
        return;
    }
    spawnpoint = getspectatepoint();
    if (istrue(level.usespawnselection)) {
        if (getgametype() == "risk") {
            spawnpoint = level.spawncameras["default"]["allies"];
        } else if (istrue(level.usestaticspawnselectioncamera)) {
            spawnpoint = namespace_8e28f8b325a83325::getstaticcameraposition(self.sessionteam);
        } else if (self.sessionteam == "allies") {
            spawnpoint = level.spawncameras["gw_fob_alliesHQ"]["allies"];
        } else if (self.sessionteam == "axis") {
            spawnpoint = level.spawncameras["gw_fob_axisHQ"]["axis"];
        }
    }
    var_4816b1172f8e226b = 8;
    if (isdefined(level.camerapos) && level.camerapos.size) {
        for (i = 0; i < level.camerahighestindex + 1 && i < var_4816b1172f8e226b; i++) {
            if (!isdefined(level.camerapos[i]) || !isdefined(level.cameraang[i])) {
                continue;
            }
            self setmlgcameradefaults(i, level.camerapos[i], level.cameraang[i]);
            level.cameramapobjs[i].origin = level.camerapos[i];
            level.numbermapobjs[i].origin = level.camerapos[i];
            level.cameramapobjs[i].angles = level.cameraang[i];
            level.numbermapobjs[i].angles = level.cameraang[i];
        }
    } else {
        for (i = 0; i < var_4816b1172f8e226b; i++) {
            self setmlgcameradefaults(i, spawnpoint.origin, spawnpoint.angles);
        }
    }
    self setspectatedefaults(spawnpoint.origin, spawnpoint.angles);
    if (isdefined(gameended)) {
        self allowspectateteam("freelook", 1);
        self allowspectateteam("none", 1);
    }
    if (isgroundwarcoremode() && !self.hasspawned) {
        self function_b88c89bb7cd1ab8e(spawnpoint.origin);
    }
    self spawn(spawnpoint.origin, spawnpoint.angles);
    printspawnmessage("playerlogic::onSpawnSpectator() !!!CODE SPAWN!!! @" + spawnpoint.origin);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c07
// Size: 0x2ee
function getspectatepoint() {
    if (getgametype() == "gwtdm" && isdefined(level.spawncameras) && isdefined(level.spawncameras["default"])) {
        return level.spawncameras["default"][self.sessionteam];
    }
    if (getgametype() == "brtdm" || getgametype() == "brtdm_mgl") {
        return level.brtdm_config.spectatepoint;
    }
    spawnpoints = getentarray("mp_global_intermission", "classname");
    /#
        assertex(spawnpoints.size, "NO mp_global_intermission SPAWNPOINTS IN MAP");
    #/
    var_59ba6be73235750f = [];
    if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        if (level.localeid == "locale_6") {
            var_3cc83b4e56d476a9 = spawn("script_origin", (25642, -26550, 1818));
            var_3cc83b4e56d476a9.angles = (14, 101, 0);
            return var_3cc83b4e56d476a9;
        } else if (level.localeid == "locale_3") {
            var_3cc83b4e56d476a9 = spawn("script_origin", (34440, -18522, 995));
            var_3cc83b4e56d476a9.angles = (10, 281, 0);
            return var_3cc83b4e56d476a9;
        }
        var_3cc83b4e56d476a9 = undefined;
        foreach (spawnpoint in spawnpoints) {
            if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy == level.localeid) {
                var_3cc83b4e56d476a9 = spawnpoint;
            }
        }
        if (isdefined(var_3cc83b4e56d476a9)) {
            return var_3cc83b4e56d476a9;
        } else {
            foreach (spawnpoint in spawnpoints) {
                if (!isdefined(spawnpoint.script_noteworthy) || !issubstr(spawnpoint.script_noteworthy, "locale")) {
                    var_59ba6be73235750f[var_59ba6be73235750f.size] = spawnpoint;
                } else {
                    spawnpoint delete();
                }
            }
        }
    } else if (spawnpoints.size != 1) {
        foreach (spawnpoint in spawnpoints) {
            if (!isdefined(spawnpoint.script_noteworthy) || !issubstr(spawnpoint.script_noteworthy, "locale")) {
                var_59ba6be73235750f[var_59ba6be73235750f.size] = spawnpoint;
            } else {
                spawnpoint delete();
            }
        }
    } else {
        var_59ba6be73235750f = spawnpoints;
    }
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_random(var_59ba6be73235750f);
    return spawnpoint;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7efd
// Size: 0x1fe
function spawnintermission(spawnpoint, sessionstate, everyonehearseveryone) {
    self endon("disconnect");
    self notify("spawned");
    self notify("end_respawn");
    if (!isdefined(sessionstate)) {
        sessionstate = "intermission";
    }
    if (!isdefined(everyonehearseveryone)) {
        everyonehearseveryone = 1;
    }
    setspawnvariables();
    setlowermessageomnvar("clear_lower_msg");
    clearlowermessages();
    if (!getdvarint(@"hash_8117734e3e0f8be5", 0)) {
        _freezecontrols(1, undefined, "spawnIntermission");
    }
    if (everyonehearseveryone) {
        self setclientdvar(@"hash_cc2997fd2acb23e0", 1);
    }
    if (isdefined(level.finalkillcam_winner) && level.finalkillcam_winner != "none" && isdefined(level.match_end_delay) && waslastround() && !istrue(level.var_286c2c7b34d03b04)) {
        wait(level.match_end_delay);
    }
    if (isdefined(level.var_cbc6bb7edf0c9b04)) {
        wait(level.var_cbc6bb7edf0c9b04);
    }
    if (!istrue(level.var_286c2c7b34d03b04)) {
        updatesessionstate(sessionstate);
    }
    clearkillcamstate();
    self.friendlydamage = undefined;
    if (!isdefined(spawnpoint)) {
        if (!isdefined(level.localeid)) {
            spawnpoints = getentarray("mp_global_intermission", "classname");
            spawnpoints = namespace_90f75d3fdf89a43e::checkdynamicspawns(spawnpoints);
            /#
                assertex(spawnpoints.size, "NO mp_global_intermission SPAWNPOINTS IN MAP");
            #/
            if (istrue(level.var_8cf13ef4fd814ccd)) {
                spawnpoint = function_7a2aaa4a09a4d250(spawnpoints);
            } else {
                spawnpoint = spawnpoints[0];
            }
        } else {
            spawnpoint = getspectatepoint();
        }
    }
    if (!isdefined(level.custom_ending)) {
        self spawn(spawnpoint.origin, spawnpoint.angles);
        printspawnmessage("playerlogic::spawnIntermission() !!!CODE SPAWN!!! @" + spawnpoint.origin);
        setdof_spectator();
    }
    if (!getdvarint(@"hash_8117734e3e0f8be5", 0)) {
        _freezecontrols(1, undefined, "spawnIntermission");
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8102
// Size: 0x82
function spawnendofgame() {
    if (isdefined(level.modespawnendofgame) && self [[ level.modespawnendofgame ]]()) {
        return;
    }
    if (isdefined(level.custom_ending) && waslastround()) {
        level notify("start_custom_ending");
    }
    if (!istrue(self.controlsfrozen)) {
        _freezecontrols(1, undefined, "spawnEndOfGame");
    }
    if (istrue(level.var_286c2c7b34d03b04)) {
        self notify("spawned");
        clearkillcamstate();
    } else {
        spawnspectator();
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x818b
// Size: 0x20
function setspawnvariables() {
    _stopshellshock();
    self stoprumble("damage_heavy");
    self.deathposition = undefined;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81b2
// Size: 0x1d0
function function_358a3ae71b7d1935(player) {
    if (!isplayer(player) || isbot(player)) {
        return undefined;
    }
    var_4d1db612c5b9184b = 0;
    var_c1480a81b0387196 = player.pers["shotsFired"];
    totalhits = player.pers["shotsHit"];
    if (isdefined(var_c1480a81b0387196) && isdefined(totalhits) && var_c1480a81b0387196 > 0) {
        var_4d1db612c5b9184b = float(totalhits / var_c1480a81b0387196 * 100);
    }
    var_e34d7c876b7ba0c = 0;
    if (isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].var_e34d7c876b7ba0c)) {
        var_e34d7c876b7ba0c = player.pers["telemetry"].var_e34d7c876b7ba0c;
    }
    var_3a6757ba728ae8d5 = 0;
    if (player rankingenabled() && player hasplayerdata()) {
        var_3a6757ba728ae8d5 = player getplayerdata("common", "mpProgression", "playerLevel", "xp");
    }
    playerstats = spawnstruct();
    playerstats.var_3860527dd55b1b94 = gettime() - player.connecttime;
    playerstats.kills = player getpersstat("kills");
    playerstats.deaths = player getpersstat("deaths");
    playerstats.headshots = player getpersstat("headshots");
    playerstats.xp_earned = var_3a6757ba728ae8d5 - var_e34d7c876b7ba0c;
    playerstats.accuracy = var_4d1db612c5b9184b;
    playerstats.xuid = player getxuid();
    return playerstats;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x838a
// Size: 0x5ae
function callback_playerdisconnect(reason) {
    if (!isdefined(self.connected)) {
        return;
    }
    self.disconnecting = 1;
    playerstats = function_358a3ae71b7d1935(self);
    self function_fe84f716b4611373(playerstats);
    if (getdvarint(@"hash_4ba1427c86b79dc5") != 0) {
        playercountleft = getmatchdata("commonMatchData", "player_count_left");
        playercountleft++;
        setmatchdata("commonMatchData", "player_count_left", playercountleft);
    }
    result = undefined;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (istrue(self.pers["hasDoneAnyCombat"]) || istrue(self.pers["participation"])) {
            result = "eliminated";
        }
        if (istrue(level.var_455a4e4b5e61f55f) && !isbot(self) && self isinexecutionvictim() && isalive(self)) {
            attacker = self getexecutionpartner();
            var_ba9dc00e6d5896dc = self.health;
            if (namespace_3e725f3cc58bddd3::shouldrecorddamagestats(self)) {
                attacker incpersstat("damage", var_ba9dc00e6d5896dc);
                if (!isdefined(attacker.damagethisround)) {
                    attacker.damagethisround = var_ba9dc00e6d5896dc;
                } else {
                    attacker.damagethisround = attacker.damagethisround + var_ba9dc00e6d5896dc;
                }
            } else if (isdefined(level.onattackerdamagenottracked)) {
                attacker [[ level.onattackerdamagenottracked ]](var_ba9dc00e6d5896dc);
            }
            attacker namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("damageDealt", attacker.pers["damage"]);
            self kill(self.origin, attacker, attacker, "MOD_EXECUTION");
            self notify("disconnect");
        }
    }
    if (isdefined(level.var_3940d363b8fb58c3)) {
        result = level.var_3940d363b8fb58c3;
    }
    namespace_f1d40c362677777e::function_7104b549684a0447(self);
    if (isdefined(result)) {
        namespace_36f464722d326bbe::stopkeyearning(result);
    }
    if (iscontrollingproxyagent()) {
        self restorecontrolagent();
    }
    var_5814d27874b48e54 = spawnstruct();
    var_5814d27874b48e54.player = self;
    var_5814d27874b48e54.var_934dc135aaf6f953 = reason;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_player_disconnect", var_5814d27874b48e54);
    removeplayerondisconnect();
    namespace_36f464722d326bbe::removefromparticipantsarray();
    namespace_36f464722d326bbe::removefromcharactersarray();
    namespace_f8065cafc523dba5::removefromdismembermentlist();
    function_dcd8f0ad9ced02ba(self);
    entnum = self getentitynumber();
    if (!level.teambased) {
        game["roundsWon"][self.guid] = undefined;
    }
    if (level.splitscreen) {
        players = level.players;
        if (players.size <= 1) {
            level thread namespace_d576b6dc7cef9c62::forceend();
        }
    }
    if (isdefined(self.kills) && isdefined(self.deaths)) {
        if (getgametype() == "arena" && 3 > self.timeplayed["total"]) {
            if (!isdefined(self.arenadamage)) {
                return;
            }
            damage = self.arenadamage;
            /#
                println("scoreAtLastDeath" + damage);
            #/
            setplayerteamrank(self, self.clientid, damage);
        } else if (120 < self.timeplayed["total"]) {
            kd = (self.kills - self.deaths) / self.timeplayed["total"] / 60;
            /#
                println("scoreAtLastDeath" + self.kills + "player_count" + self.deaths + "callback_on_player_connect" + kd);
            #/
            setplayerteamrank(self, self.clientid, kd);
        }
    } else {
        /#
            println("bestStats");
        #/
    }
    lpselfnum = self getentitynumber();
    lpguid = self.guid;
    logprint("Q;" + lpguid + ";" + lpselfnum + ";" + self.name + "
");
    if (analyticsstreamerislogfilestreamingenabled()) {
        analyticsstreamerlogfilewritetobuffer("Q;" + lpguid + ";" + lpselfnum + ";" + self.name + "
");
    }
    thread namespace_391de535501b0143::disconnected();
    if (level.gameended) {
        namespace_e8a49b70d0769b66::removedisconnectedplayerfromplacement();
    }
    if (isdefined(self.team)) {
        namespace_99ac021a7547cae3::removefromteamcount();
        if (array_contains(level.teamdata[self.team]["alivePlayers"], self)) {
            namespace_99ac021a7547cae3::removefromalivecount(1, "disconnect");
            namespace_54d20dd0dd79277f::validatealivecount("disconnect", self.team, self, "Callback_PlayerDisconnect");
        }
        if (isdefined(self.var_ff97225579de16a) && isdefined(self.team) && isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
            namespace_9bb409deb69fb31d::leavesquad(self.team, self.var_ff97225579de16a);
        }
    }
    namespace_d325722f2754c2c4::clearlockedonondisconnect(self);
    level thread [[ level.updategameevents ]]();
    namespace_bf9ffd2b22c7d819::function_8cf8ff669ac52156(reason);
    namespace_f1d40c362677777e::rundisconnectcallbacks(self);
    namespace_d576b6dc7cef9c62::updatematchhasmorethan1playeromnvaronplayerdisconnect();
    utility::trycall(level.matchdata_logplayerdata, reason);
    if (!namespace_d576b6dc7cef9c62::function_8464fd951b451534(self)) {
        level thread endEmptyGameWatcher();
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x893f
// Size: 0xb7
function endEmptyGameWatcher() {
    level notify("endEmptyGameWatcher");
    level endon("endEmptyGameWatcher");
    level endon("connected");
    var_c08c3b91ed82c26d = getdvarfloat(@"hash_36c64acc6ca5e510", 30);
    wait(var_c08c3b91ed82c26d);
    if (namespace_36f464722d326bbe::isBRStyleGameType() && getdvarint(@"hash_e709033afed344c5", 1) == 1 && istrue(level.br_prematchstarted)) {
        namespace_d576b6dc7cef9c62::sendendofmatchdata();
    }
    if (isdefined(level.var_9aa019939f20359)) {
        thread [[ level.var_9aa019939f20359 ]]("none", game["end_reason"]["host_ended_game"]);
    } else {
        thread namespace_d576b6dc7cef9c62::endgame("none", game["end_reason"]["host_ended_game"]);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89fd
// Size: 0xb4
function removeplayerondisconnect() {
    found = 0;
    for (entry = 0; entry < level.players.size; entry++) {
        if (level.players[entry] == self) {
            found = 1;
            while (entry < level.players.size - 1) {
                level.players[entry] = level.players[entry + 1];
                /#
                    assert(level.players[entry] != self);
                #/
                entry++;
            }
            level.players[entry] = undefined;
            break;
        }
    }
    level.playersbyentitynumber[self getentitynumber()] = undefined;
    /#
        assert(found);
    #/
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ab8
// Size: 0x56
function initclientdvarssplitscreenspecific() {
    if (level.splitscreen || self issplitscreenplayer()) {
        self setclientdvars(@"hash_682a9bc40f96ca4a", "0.75");
        setdvar(@"hash_d18838f3e4b65d16", 0);
    } else {
        self setclientdvars(@"hash_682a9bc40f96ca4a", "1");
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b15
// Size: 0x1fe
function initclientdvars() {
    setdvar(@"hash_5d474d39e096f8f1", 1);
    setdvar(@"hash_f17e1982c2ef27b", 1);
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        setdvar(@"hash_5d474d39e096f8f1", 0);
        setdvar(@"hash_f17e1982c2ef27b", 1);
    }
    if (isdefined(level.alwaysdrawfriendlynames) && level.alwaysdrawfriendlynames) {
        setdvar(@"hash_721a6fa1822b17d9", 1);
    } else {
        setdvar(@"hash_721a6fa1822b17d9", 0);
    }
    self setclientdvars(@"hash_9cb529b37532dcc4", 1);
    initclientdvarssplitscreenspecific();
    if (getgametypenumlives()) {
        if (level.teambased) {
            self setclientdvars(@"hash_dec9da49c06646d3", 0, @"hash_db351fce243e78e8", 1, @"hash_7cbab070003d0ed7", 1, @"hash_e1cd4a058f3ed363", 0);
        } else {
            self setclientdvars(@"hash_dec9da49c06646d3", 1, @"hash_db351fce243e78e8", 0, @"hash_7cbab070003d0ed7", 0, @"hash_e1cd4a058f3ed363", 0);
        }
    } else {
        self setclientdvars(@"hash_dec9da49c06646d3", 0, @"hash_db351fce243e78e8", 1, @"hash_7cbab070003d0ed7", 1, @"hash_e1cd4a058f3ed363", 0);
    }
    if (level.teambased) {
        self setclientdvars(@"hash_cc2997fd2acb23e0", 0);
    }
    self setclientdvar(@"hash_b21f1157c582ff15", 1);
    self setclientdvar(@"hash_df1dc712c4a91588", 65);
    self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    if (getdvarint(@"hash_8662c4d785d46fd6")) {
        for (i = 0; i < 6; i++) {
            self setclientdvar(function_2ef675c13ca1c4af(@"hash_3dd1dde9508849d5", string(i)), "");
        }
        self.hitlocinited = 1;
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d1a
// Size: 0xda
function connect_validateplayerteam() {
    if (!isdefined(self)) {
        return;
    }
    var_155c56b2e3db23c9 = getdvar(@"hash_aea3ac32a07685ba", "");
    if (self.sessionteam == "none" && matchmakinggame() && level.teambased && !isbot(self) && !istestclient(self) && !self iscodcaster() && !namespace_36f464722d326bbe::function_2536e99eb6586f8f() && !isgameplayteam(var_155c56b2e3db23c9)) {
        /#
            println("totalDistTraveledAFK");
        #/
        dlog_recordevent("mp_invalid_team_error", [0:"player_xuid", 1:self getxuid(), 2:"isHost", 3:self ishost()]);
        wait(1.5);
        kick(self getentitynumber(), "EXE/PLAYERKICKED_INVALIDTEAM");
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dfb
// Size: 0x9d
function queueconnectednotify() {
    for (;;) {
        for (;;) {
            if (!isdefined(level.players_waiting_for_callback)) {
                waitframe();
                continue;
            }
        }
    }
LOC_00000033:
    for (;;) {
    LOC_00000033:
        for (i = 0; i < level.players_waiting_for_callback.size; i++) {
            player = level.players_waiting_for_callback[i];
            if (isdefined(player)) {
                level notify("connected", player);
                player notify("connected_continue");
                level.players_waiting_for_callback[i] = undefined;
                break;
            }
        }
        var_50f783a5617f8940 = array_removeundefined(level.players_waiting_for_callback);
        level.players_waiting_for_callback = var_50f783a5617f8940;
        waitframe();
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e9f
// Size: 0x2a
function onversusdone(channel, var_ea8523762e51dd5e) {
    if (channel != "versus_done") {
        return;
    }
    self.versusdone = 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed0
// Size: 0x38
function initsegmentstats() {
    level endon("game_ended");
    level thread recordplayersegmentdata();
    while (1) {
        player = level waittill("connected");
        level thread createplayersegmentstats(player);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f0f
// Size: 0xda
function recordplayersegmentdata() {
    level endon("game_ended");
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        level thread function_6507acd84aa694f8();
    } else {
        gameflagwait("prematch_done");
        wait(4);
    }
    var_f9bd25a96ac21421 = 5;
    while (1) {
        var_bab3da0528933ef7 = 0;
        wait(1);
        players = level.players;
        foreach (player in players) {
            if (!isdefined(player)) {
                continue;
            }
            if (istrue(player.canrecordsegmentstats)) {
                player thread updateplayersegmentdata();
            }
            var_bab3da0528933ef7++;
            var_bab3da0528933ef7 = var_bab3da0528933ef7 % var_f9bd25a96ac21421;
            if (var_bab3da0528933ef7 == 0) {
                waitframe();
            }
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ff0
// Size: 0xcf
function createplayersegmentstats(player) {
    player endon("disconnect");
    player waittill("spawned_player");
    if (!isdefined(player.pers["distanceTotal"])) {
        player.pers["distanceTotal"] = 0;
    }
    if (!isdefined(player.pers["movingTotal"])) {
        player.pers["movingTotal"] = 0;
    }
    if (!isdefined(player.pers["movementUpdateCount"])) {
        player.pers["movementUpdateCount"] = 0;
    }
    player.savedsegmentposition = player.origin;
    player.positionptm = player.origin;
    player.canrecordsegmentstats = 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c6
// Size: 0x4a
function function_81556b07c7a4bf27() {
    self.pers["movementUpdateCount"] = 0;
    self.pers["distanceTotal"] = 0;
    self.pers["movingTotal"] = 0;
    self.savedsegmentposition = undefined;
    self.positionptm = undefined;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9117
// Size: 0x76
function function_6507acd84aa694f8() {
    gameflagwait("prematch_done");
    wait(4);
    foreach (player in level.players) {
        if (istrue(player.canrecordsegmentstats)) {
            player function_81556b07c7a4bf27();
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9194
// Size: 0x110
function updateplayersegmentdata() {
    self endon("disconnect");
    if (!isdefined(self.savedsegmentposition)) {
        self.savedsegmentposition = self.origin;
        self.positionptm = self.origin;
    }
    if (isusingremote()) {
        self waittill("stopped_using_remote");
        self.savedsegmentposition = self.origin;
        self.positionptm = self.origin;
        return;
    }
    namespace_3c5a4254f2b957ea::incpersstat("movementUpdateCount", 1);
    namespace_3c5a4254f2b957ea::incpersstat("distanceTotal", distance2d(self.savedsegmentposition, self.origin));
    self.savedsegmentposition = self.origin;
    if (namespace_3c5a4254f2b957ea::getpersstat("movementUpdateCount") % 5 == 0) {
        distancetraveled = distance2d(self.positionptm, self.origin);
        self.positionptm = self.origin;
        if (distancetraveled > 16) {
            namespace_3c5a4254f2b957ea::incpersstat("movingTotal", 1);
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92ab
// Size: 0x62
function shouldshowwidemapshot(var_c924752368853f99) {
    if (istrue(level.var_a6954a050d77d75c) || getdvarint(@"hash_fabb903693771c08", 1)) {
        return 0;
    }
    return !namespace_36f464722d326bbe::isBRStyleGameType() && var_c924752368853f99 < level.prematchperiod && !istrue(self.btestclient) && !gameflag("infil_will_run");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9315
// Size: 0x32
function function_9fac5c57173a9bb9() {
    self endon("disconnect");
    fadetime = getdvarfloat(@"hash_e13bff48d7059619", 1);
    wait(fadetime);
    self notify("round_based_fade_up");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x934e
// Size: 0xf1
function setuipregamefadeup(waitmsg, var_c647ae2bf7b3de70, var_9c9865252730745e) {
    self endon("disconnect");
    if (istrue(var_9c9865252730745e)) {
        namespace_36f464722d326bbe::function_852712268d005332(self, 1, 0);
    } else {
        namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0);
    }
    if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
        thread function_af273a2e9abf2489(var_9c9865252730745e);
    }
    starttime = gettime();
    if (isdefined(var_c647ae2bf7b3de70) && isdefined(waitmsg)) {
        var_c647ae2bf7b3de70 waittill(waitmsg);
    }
    namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    mintime = getdvarint(@"hash_d91436487f90e63c", 0);
    if (mintime > 0) {
        waited = (gettime() - starttime) / 1000;
        if (waited < mintime) {
            wait(mintime - waited);
        }
    }
    if (istrue(var_9c9865252730745e)) {
        namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0.5);
    } else {
        namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.5);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9446
// Size: 0x126
function function_af273a2e9abf2489(var_9c9865252730745e) {
    self endon("disconnect");
    level endon("start_scene");
    level waittill("post_game_ui_start");
    spawnpoints = getentarray("mp_global_intermission", "classname");
    if (spawnpoints.size > 0) {
        var_5f317a83d6cb6774 = getclosest(self.origin, spawnpoints);
        if (isdefined(var_5f317a83d6cb6774)) {
            var_a92e3d2ff7af10c9 = spawn("script_model", var_5f317a83d6cb6774.origin);
            if (isdefined(var_a92e3d2ff7af10c9)) {
                var_a92e3d2ff7af10c9 setmodel("tag_origin");
                var_a92e3d2ff7af10c9.angles = var_5f317a83d6cb6774.angles;
                var_a92e3d2ff7af10c9.data = var_5f317a83d6cb6774;
                self cameralinkto(var_a92e3d2ff7af10c9, "tag_origin", 1, 1);
            } else {
                /#
                    assertex(isdefined(var_a92e3d2ff7af10c9), "Could not spawn script_model for cameraEntity");
                #/
            }
        } else {
            /#
                assertex(isdefined(var_5f317a83d6cb6774), "Closest intermission spawn was not found");
            #/
        }
    } else {
        /#
            assertex(spawnpoints.size, "NO mp_global_intermission SPAWNPOINTS IN MAP");
        #/
    }
    if (istrue(var_9c9865252730745e)) {
        namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0.5);
    } else {
        namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.5);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9573
// Size: 0x74
function callback_playeractive() {
    self.pers["streamSyncComplete"] = 1;
    self notify("player_active");
    if (isdefined(self.team) && isgameplayteam(self.team)) {
        customization = namespace_6d8da2b47f878104::getoperatorcustomization();
        body = customization[0];
        head = customization[1];
        self setcustomization(body, head);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95ee
// Size: 0x15
function getmaxnumplayerslogging() {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return 30;
    } else {
        return 200;
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x960a
// Size: 0x74
function function_2724805d492e905d(origin, angles) {
    var_5940f376a254619d = spawn("script_model", origin);
    var_5940f376a254619d setmodel("tag_origin");
    var_5940f376a254619d.angles = angles;
    updatesessionstate("spectator");
    self cameralinkto(var_5940f376a254619d, "tag_origin");
    waittill_any_2("death_or_disconnect", "spawned_player");
    var_5940f376a254619d delete();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9685
// Size: 0x159d
function callback_playerconnect() {
    self.versusdone = 0;
    self.statusicon = "hud_status_connecting";
    self waittill("begin");
    self.statusicon = "";
    if (isai(self) || getdvarint(@"hash_e244e1b9c23a167c", 0) == 1) {
        callback_playeractive();
    }
    self.connecttime = gettime();
    self clearpredictedstreampos();
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        self clearadditionalstreampos();
    }
    var_ce91130a97f4c478 = 1;
    if (isdefined(level.onplayerconnectstream)) {
        var_ce91130a97f4c478 = self thread [[ level.onplayerconnectstream ]]();
    }
    thread function_2c0b975a7130601e();
    if (namespace_d7fe36703a9572fe::function_581a8fc6f76d525d() && isdefined(self.sessionteam) && isgameplayteam(self.sessionteam)) {
        namespace_d7fe36703a9572fe::function_cdff2f0b5dcf3aa1();
    }
    if (gameflag("prematch_done") && istrue(level.usespawnselection) && isdefined(self.sessionteam)) {
        if (getgametype() == "risk") {
            var_d596480119e7a95b = level.spawncameras["default"]["allies"];
        } else if (self.sessionteam == "allies") {
            var_d596480119e7a95b = level.spawncameras["gw_fob_alliesHQ"]["allies"];
            self function_47933f5eb9f65afe(var_d596480119e7a95b.origin);
        } else if (self.sessionteam == "axis") {
            var_d596480119e7a95b = level.spawncameras["gw_fob_axisHQ"]["axis"];
            self function_47933f5eb9f65afe(var_d596480119e7a95b.origin);
        }
    }
    self visionsetfadetoblackforplayer("bw", 0);
    waitmsg = "connected_continue";
    var_9c9865252730745e = 0;
    var_c647ae2bf7b3de70 = self;
    var_c924752368853f99 = gettimepassed() / 1000 + 6;
    if (gameflag("infil_will_run") && !gameflag("infil_started")) {
        waitmsg = "infil_started";
        var_9c9865252730745e = 1;
        var_c647ae2bf7b3de70 = level;
    }
    if (!isdefined(self.pers["streamSyncComplete"]) && shouldshowwidemapshot(var_c924752368853f99)) {
        var_c2db1b6c79ea1c6c = function_38d8271a5b966538();
        var_11f3b4465c8b637b = namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_c2db1b6c79ea1c6c[0].origin);
        waitmsg = "player_active";
    } else if (getsubgametype() == "dmz" && getdvarint(@"hash_1ed3f112d3406b97", 1)) {
        if (!istrue(level.var_72e1667d06ab98db) && isdefined(self.origin) && getdvarint(@"hash_8502b5f6f282d7c1", 1)) {
            if (!istrue(level.var_466a09c79541fc26)) {
                waitmsg = "dmz_playInfil";
            } else {
                waitmsg = undefined;
            }
            var_9c9865252730745e = 1;
        } else if (!isdefined(self.pers["streamSyncComplete"])) {
            waitmsg = "player_active";
            var_9c9865252730745e = 1;
        }
    } else if (isroundbased() && game["roundsPlayed"] > 0 && !namespace_36f464722d326bbe::function_8b6131109e66d962()) {
        waitmsg = "round_based_fade_up";
        var_9c9865252730745e = 1;
        thread function_9fac5c57173a9bb9();
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType() || getsubgametype() == "dmz" && istrue(level.var_59ff09549058dda2)) {
        thread setuipregamefadeup(waitmsg, var_c647ae2bf7b3de70, var_9c9865252730745e);
    }
    level.players_waiting_for_callback[level.players_waiting_for_callback.size] = self;
    self waittill("connected_continue");
    self.connected = 1;
    if (!isdefined(level.uniqueplayersconnected)) {
        level.uniqueplayersconnected = 1;
    } else {
        level.uniqueplayersconnected++;
    }
    initinputtypewatcher();
    self setclientomnvar("ui_scoreboard_freeze", 0);
    if (self ishost()) {
        level.player = self;
    }
    if (!level.splitscreen && !isdefined(self.pers["score"])) {
        var_973c2033e57c470b = 0;
        if (isusingmatchrulesdata()) {
            var_f56f146953ca91b5 = getmatchrulesdata("commonOption", "startConnectedMsgTime");
        } else {
            var_f56f146953ca91b5 = getdvarint(@"hash_6a935f93a9854b13", 0);
        }
        if (var_f56f146953ca91b5 > 0) {
            if (isdefined(level.starttime)) {
                timepassed = (gettime() - level.starttime) / 1000;
                if (timepassed <= var_f56f146953ca91b5) {
                    var_973c2033e57c470b = 1;
                }
            } else {
                var_973c2033e57c470b = 1;
            }
        }
        if (var_973c2033e57c470b == 0) {
            /#
                iprintln("eliteBlocked", self);
            #/
        }
    }
    self.usingonlinedataoffline = self isusingonlinedataoffline();
    initclientdvars();
    initplayerstats();
    namespace_801bcc0d4eadf9a1::applyaccoladestructtoplayerpers();
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        level waittill("eternity");
    }
    self.guid = getuniqueid();
    var_7ec298e587eb6719 = 0;
    if (!isdefined(self.pers["clientid"])) {
        self.pers["clientid"] = game["clientid"];
        game["clientid"]++;
        maxplayers = getmaxnumplayerslogging();
        if (game["clientid"] >= maxplayers) {
            game["clientid"] = maxplayers - 1;
            self.pers["clientid"] = maxplayers - 1;
        }
        var_7ec298e587eb6719 = 1;
        self.pers["matchdataWeaponStats"] = [];
        self.pers["matchdataScoreEventCounts"] = [];
        self.pers["xpAtLastDeath"] = 0;
        self.pers["scoreAtLastDeath"] = 0;
        self.pers["weaponStats"] = [];
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            var_b9c95d2f33c0d8b = function_ce68631570796a41();
            if (isdefined(var_b9c95d2f33c0d8b)) {
                thread function_408b1b8364d0e722(var_b9c95d2f33c0d8b);
                namespace_c8d5de7d515ce477::function_cf013b45184bb054(self, var_b9c95d2f33c0d8b);
            }
            var_8ca33da989ab6666 = getdvarint(@"hash_b5e42dbec5bf8cc3", 26871);
            if (var_8ca33da989ab6666 > 0) {
                thread function_fd6c077d98fa4be9(var_8ca33da989ab6666);
                namespace_c8d5de7d515ce477::function_cf013b45184bb054(self, var_8ca33da989ab6666);
            }
        }
    }
    namespace_b919c4be206d3c80::function_9b229b18b0750bad();
    if (self iscodcaster() && getdvarint(@"hash_2745598e35a47913") == 1) {
        var_c9c655687bd338b8 = int(floor(namespace_cd0b2d039510b38d::getgamelength() / 1000));
        self setclientomnvar("ui_total_game_time", var_c9c655687bd338b8);
    }
    /#
        println("zombieDeaths" + self.name + "ui_life_kill_count" + self.pers["<unknown string>"]);
    #/
    if (istrue(level.flashpointactive)) {
        thread namespace_8af839578a30040a::flashpoint_trackplayerevents(self);
    }
    if (var_7ec298e587eb6719) {
        namespace_2685ec368e022695::statsetchildbuffered("round", "timePlayed", 0, 1);
        self setplayerdata("common", "round", "totalXp", 0);
        namespace_36f464722d326bbe::startkeyearning();
        if (!isdefined(game["uniquePlayerCount"])) {
            game["uniquePlayerCount"] = 1;
        } else {
            game["uniquePlayerCount"]++;
        }
    }
    self.clientid = self.pers["clientid"];
    self.pers["teamKillPunish"] = 0;
    logprint("J;" + self.guid + ";" + self getentitynumber() + ";" + self.name + "
");
    if (analyticsstreamerislogfilestreamingenabled()) {
        analyticsstreamerlogfilewritetobuffer("J;" + self.guid + ";" + self getentitynumber() + ";" + self.name + "
");
    }
    self logstatmatchguid();
    if (getdvarint(@"hash_4ba1427c86b79dc5") != 0) {
        playercount = getmatchdata("commonMatchData", "player_count");
        if (var_7ec298e587eb6719) {
            playercount++;
            setmatchdata("commonMatchData", "player_count", playercount);
        }
        if (isbot(self) || istestclient(self) || isai(self)) {
            var_292e9342321c9151 = 1;
        } else {
            var_292e9342321c9151 = 0;
        }
        if (matchmakinggame() && !denysystemicteamchoice() && !var_292e9342321c9151) {
            /#
            #/
            /#
                println("<unknown string>" + gettime());
                println("<unknown string>" + getdvarint(@"hash_ff213c5a6a5e05e4", 0));
                println("<unknown string>" + istrue(level.multiteambased));
                println("<unknown string>" + istrue(level.teambased));
                println("<unknown string>" + self.sessionteam);
            #/
            /#
                assert(getdvarint(@"hash_ff213c5a6a5e05e4", 0) == 1 || istrue(level.multiteambased) || istrue(level.teambased) && isgameplayteam(self.sessionteam) || !istrue(level.teambased) && self.sessionteam == "none" || (namespace_36f464722d326bbe::function_2536e99eb6586f8f() || getgametype() == "zm_rb") && self.sessionteam == "none");
            #/
        }
    }
    if (var_7ec298e587eb6719) {
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_player_first_connect", self);
        if (function_9f3fd36055d11136(self)) {
            self.pers["streaming"] = 1;
        }
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_player_connect", self);
    if (level.uniqueplayersconnected <= getmaxnumplayerslogging()) {
        if (var_7ec298e587eb6719 && isdefined(level.matchrecording_logeventplayername)) {
            [[ level.matchrecording_logeventplayername ]](self.clientid, self.team, self.name);
        }
    }
    if (var_7ec298e587eb6719) {
        namespace_bf9ffd2b22c7d819::function_342af7ea8a120b16();
    }
    if (!level.teambased) {
        game["roundsWon"][self.guid] = 0;
    }
    if (!isdefined(self.pers["cur_kill_streak"])) {
        self.pers["cur_kill_streak"] = 0;
    }
    if (!isdefined(self.pers["cur_death_streak"])) {
        self.pers["cur_death_streak"] = 0;
    }
    if (level.onlinestatsenabled) {
        self.bestlifetimekillstreak = getplayerstat("bestStats", "killStreak");
    }
    self.lastgrenadesuicidetime = -1;
    self.hasspawned = 0;
    self.waitingtospawn = 0;
    self.wantsafespawn = 0;
    self.wasaliveatmatchstart = 0;
    self.movespeedscaler = 1;
    self.objectivescaler = 1;
    self.killcountthislife = 0;
    resetuidvarsonconnect();
    self.lifeid = 0;
    if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("deaths"))) {
        self.lifeid = namespace_3c5a4254f2b957ea::getpersstat("deaths");
    }
    waittillframeend();
    /#
        foreach (player in level.players) {
            /#
                assert(player != self);
            #/
        }
    #/
    level.players[level.players.size] = self;
    level.playersbyentitynumber[self getentitynumber()] = self;
    namespace_36f464722d326bbe::addtoparticipantsarray();
    namespace_36f464722d326bbe::addtocharactersarray();
    namespace_f8065cafc523dba5::addtodismembermentlist();
    if (game["state"] == "postgame") {
        self.connectedpostgame = 1;
        self setclientdvars(@"hash_9cb529b37532dcc4", 0);
        self visionsetfadetoblackforplayer("", 0.25);
        spawnintermission();
        return;
    }
    if (var_7ec298e587eb6719 && (gettimepassed() >= 60000 || game["roundsPlayed"] > 0)) {
        self.joinedinprogress = 1;
    }
    /#
        if (getdvarint(@"hash_a91f736779a57bef")) {
            self.pers["<unknown string>"] = "<unknown string>";
            self.class = "<unknown string>";
            if (self.sessionteam != "<unknown string>" && self.sessionteam != "<unknown string>") {
                self.pers["<unknown string>"] = self.sessionteam;
            }
            self.team = "<unknown string>";
        }
    #/
    if (isai(self) && isdefined(level.bot_funcs) && isdefined(level.bot_funcs["think"])) {
        self thread [[ level.bot_funcs["think"] ]]();
    }
    level endon("game_ended");
    if (isdefined(level.hostmigrationtimer)) {
        thread namespace_e323c8674b44c8f4::hostmigrationtimerthink();
    }
    if (isdefined(level.onplayerconnectaudioinit)) {
        [[ level.onplayerconnectaudioinit ]]();
    }
    thread namespace_141c4634b6ea7b27::vehicle_interact_monitorplayerusability(self);
    thread namespace_6c0d09f1e6fc2bc5::battle_tracks_monitorstandingonvehicles(self);
    thread namespace_141c4634b6ea7b27::function_356ea06606d08642(self);
    namespace_9ba985cbac6de93c::function_8f2f9f02b630ed27();
    thread namespace_282db5a41b643e19::markedentities_think();
    if (!isdefined(self.pers["team"])) {
        var_c924752368853f99 = gettimepassed() / 1000 + 6;
        if (shouldshowwidemapshot(var_c924752368853f99)) {
            namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
            spawnspectatormapcam();
            self lerpfovbypreset("default");
            self setclientomnvar("ui_mapshot_camera", 0);
            initclientdvarssplitscreenspecific();
            self.pers["team"] = "";
            self.team = "free";
        } else {
            self visionsetfadetoblackforplayer("", 0.5);
        }
        connect_validateplayerteam();
        if (isplayer(self) && namespace_36f464722d326bbe::isBRStyleGameType()) {
            dlog_recordevent("dlog_event_br_player_connect", [0:"player_id", 1:self.clientid, 2:"player_name", 3:self.name, 4:"connect_time", 5:int(gettime() / 1000)]);
        }
        if (self iscodcaster()) {
            thread namespace_e5ed2f5a5ee8410e::function_9ff5c7531349cdfc();
        } else if ((isintournament() || privatematch()) && (self.sessionteam == "spectator" || self.sessionteam == "codcaster")) {
            self.pers["team"] = self.sessionteam;
            self.team = self.sessionteam;
            thread spawnspectator();
        } else if ((matchmakinggame() || lobbyteamselectenabled()) && self.sessionteam != "none") {
            if (var_ce91130a97f4c478) {
                thread spawnspectator();
            }
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            if ((brgametype == "dmz" || brgametype == "exgm" || brgametype == "plunder" || brgametype == "risk") && getdvarint(@"hash_825151346ad147f2", 0) == 1) {
                thread namespace_6d8da2b47f878104::persistantgametypeteamassign();
            } else {
                thread namespace_e5ed2f5a5ee8410e::setteam(self.sessionteam, var_7ec298e587eb6719);
            }
            if (!gameflag("infil_will_run") && getdvarint(@"hash_7958073a99a0d67e", 1) == 1 && getgametype() == "gwtdm") {
                thread namespace_d7fe36703a9572fe::startspawncamera();
            } else if ((getgametype() == "arm" || getgametype() == "conflict") && istrue(level.var_a6954a050d77d75c)) {
                if (isdefined(level.spawnselectionlocations) && isdefined(level.var_6121d66ffc5b8ec9[self.team])) {
                    var_14a780f439cfff1d = level.spawnselectionlocations[level.var_6121d66ffc5b8ec9[self.team]][self.team].origin;
                    thread namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_14a780f439cfff1d, 0, undefined, undefined, -1);
                }
            }
            if (allowclasschoice() || showfakeloadout() && !isai(self)) {
                if (getdvarint(@"hash_206a763969420ce0", 0) == 1 && namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm" && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "sandbox" && getsubgametype() != "rumble_mgl") {
                    var_891d91911e4c1ade = isdefined(level.allowclasschoicefunc) && istrue(self [[ level.allowclasschoicefunc ]]());
                    namespace_9c840bb9f2ecbf00::demoforcesre("Callback_PlayerConnect() elseif MMG " + self.name + " ui_options_menu = 2, allowClassChoiceFunc = " + var_891d91911e4c1ade);
                }
                if (!istrue(self.var_10844ddcb34694ee) && getdvarint(@"hash_89556297eaab6b6a", 0) == 0) {
                    self setclientomnvar("ui_options_menu", 2);
                }
            }
            if (!runleanthreadmode() && matchmakinggame() && !getdvarint(@"hash_9b383028dfd6542d", 0)) {
                thread kickifdontspawn();
            }
            clearpinnedobjectives();
            return;
        } else {
            /#
                if (getdvarint(@"hash_c90bde85e15978ef", 0) == 1 && !istrue(game["<unknown string>"]) && !matchmakinggame() && !denysystemicteamchoice() && doesmodesupportplayerteamchoice()) {
                    namespace_e5ed2f5a5ee8410e::menuspectator();
                    namespace_e5ed2f5a5ee8410e::beginteamchoice();
                    return;
                }
            #/
            if (var_ce91130a97f4c478) {
                thread spawnspectator();
            }
            namespace_e5ed2f5a5ee8410e::autoassign(var_7ec298e587eb6719);
            if (!gameflag("infil_will_run") && getdvarint(@"hash_7958073a99a0d67e", 1) == 1 && getgametype() == "gwtdm") {
                thread namespace_d7fe36703a9572fe::startspawncamera();
            } else if ((getgametype() == "arm" || getgametype() == "conflict") && istrue(level.var_a6954a050d77d75c)) {
                if (isdefined(level.spawnselectionlocations) && isdefined(level.var_6121d66ffc5b8ec9[self.team])) {
                    var_14a780f439cfff1d = level.spawnselectionlocations[level.var_6121d66ffc5b8ec9[self.team]][self.team].origin;
                    thread namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_14a780f439cfff1d, 0, undefined, undefined, -1);
                }
            }
            if (allowclasschoice() || showfakeloadout() && !isai(self)) {
                if (getdvarint(@"hash_206a763969420ce0", 0) == 1 && namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm" && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "sandbox" && getsubgametype() != "rumble_mgl") {
                    var_891d91911e4c1ade = isdefined(level.allowclasschoicefunc) && istrue(self [[ level.allowclasschoicefunc ]]());
                    namespace_9c840bb9f2ecbf00::demoforcesre("Callback_PlayerConnect() else " + self.name + " ui_options_menu = 2, allowClassChoiceFunc = " + var_891d91911e4c1ade);
                }
                if (!istrue(self.var_10844ddcb34694ee) && getdvarint(@"hash_89556297eaab6b6a", 0) == 0) {
                    self setclientomnvar("ui_options_menu", 2);
                }
            }
            if (!runleanthreadmode() && matchmakinggame()) {
                thread kickifdontspawn();
            }
            clearpinnedobjectives();
            return;
        }
    } else {
        self visionsetfadetoblackforplayer("", 0.5);
        connect_validateplayerteam();
        playerteam = self.pers["team"];
        if (matchmakinggame() && !isbot(self) && !istestclient(self) && !self iscodcaster() && getdvarint(@"hash_fc92f4512d812fec")) {
            playerteam = self.sessionteam;
        }
        var_aa4c1ed9107c16e0 = 0;
        if (namespace_36f464722d326bbe::function_8b6131109e66d962() && istrue(self.pers["secondHalfInitialConnect"])) {
            self.pers["secondHalfInitialConnect"] = 0;
            playerteam = getotherteam(playerteam)[0];
            setdvar(@"hash_819016fcba31a2c2", 1);
            var_aa4c1ed9107c16e0 = 1;
        }
        namespace_e5ed2f5a5ee8410e::addtoteam(playerteam, 1);
        thread namespace_9bb409deb69fb31d::setsquad(playerteam);
        if (var_aa4c1ed9107c16e0) {
            setdvar(@"hash_819016fcba31a2c2", 0);
        }
        if (self iscodcaster()) {
            thread spawnspectator();
            clearpinnedobjectives();
            return;
        }
        if (namespace_d19129e4fa5d176::isvalidclass(self.pers["class"]) && playerteam != "spectator") {
            thread spawnclient();
            clearpinnedobjectives();
            return;
        }
        thread spawnspectator();
        if (self.pers["team"] == "spectator") {
            if (doesmodesupportplayerteamchoice() && !istrue(self.pers["playerChoseSpectatorTeam"])) {
                namespace_e5ed2f5a5ee8410e::beginteamchoice();
            }
        } else {
            namespace_e5ed2f5a5ee8410e::beginclasschoice();
        }
    }
    clearpinnedobjectives();
    /#
    #/
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac29
// Size: 0xe7
function function_2c0b975a7130601e() {
    var_ac35fe7145852ee1 = function_3cb5da19764baa3();
    if (var_ac35fe7145852ee1 == "JUP") {
        if (isdefined(self)) {
            self setsoundsubmix("jup_global_ingame", 0.05);
            if (getsubgametype() != "ob") {
                self setsoundsubmix("jup_global_mp", 0.05);
                thread function_8eed5edfb3ce6f1a();
            }
            if (!isdefined(getmapname()) || getmapname() == "mp_jup_bigmap" || islargemap()) {
                return;
            }
        }
    }
    if (var_ac35fe7145852ee1 == "WZ2") {
        if (isdefined(self)) {
            self setsoundsubmix("jup_global_ingame", 0.05);
            if (getsubgametype() != "ob") {
                self setsoundsubmix("jup_global_wz", 0.05);
            }
            if (!isdefined(getmapname()) || getmapname() == "mp_jup_bigmap" || islargemap()) {
                return;
            }
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad17
// Size: 0xf6
function function_8eed5edfb3ce6f1a() {
    if (istrue(level.snowballfight)) {
        self setsoundsubmix("jup_mp_snowball", 0.05);
        if (level.mapname == "mp_jup_highrise_xmas" || level.mapname == "mp_jup_shipment_xmas") {
            self setsoundsubmix("jup_mp_xmas_music", 0.05);
            level waittill("prematch_over");
            self clearsoundsubmix("jup_mp_xmas_music", 5);
        }
        return;
    }
    if (getdvarint(@"hash_57efffe601711595", 0)) {
        self setsoundsubmix("jup_global_mp_zombie", 0.05);
        self setsoundsubmix("jup_global_mp_mimic", 0.05);
    }
    if (getgametype() == "conf_jugg") {
        self setsoundsubmix("jup_global_mp_jugg", 0.05);
    }
    if (level.mapname == "mp_jup_skydiving") {
        self setsoundsubmix("jup_global_mp_zombie", 0.05);
        self setsoundsubmix("mp_jup_skydiving_global", 0.05);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae14
// Size: 0x110
function callback_playermigrated() {
    /#
        println("<unknown string>" + self.name + "<unknown string>" + gettime());
    #/
    if (isdefined(self.connected) && self.connected) {
        updateobjectivetext();
    }
    if (self ishost()) {
        initclientdvarssplitscreenspecific();
    }
    var_b287376c626b75b6 = 0;
    foreach (player in level.players) {
        if (!isbot(player) && !istestclient(player)) {
            var_b287376c626b75b6++;
        }
    }
    if (!isbot(self) && !istestclient(self)) {
        level.hostmigrationreturnedplayercount++;
        if (level.hostmigrationreturnedplayercount >= var_b287376c626b75b6 * 2 / 3) {
            /#
                println("<unknown string>");
            #/
            level notify("hostmigration_enoughplayers");
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf2b
// Size: 0x46
function function_556228e50ff920d9() {
    /#
        println("<unknown string>" + self.guid + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>");
    #/
    thread namespace_bf9ffd2b22c7d819::function_59121677f31f75a5();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf78
// Size: 0x59
function function_5c9544ef10cb9e0c(reason) {
    /#
        println("<unknown string>" + self.guid + "<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + reason + "<unknown string>");
    #/
    namespace_bf9ffd2b22c7d819::function_8cf8ff669ac52156(reason, 1);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafd8
// Size: 0x2f
function function_2a643088582c8be3(var_4b86a4e17c656399, var_534bd24a37e5d78a) {
    namespace_bf9ffd2b22c7d819::function_a1b2dc3090437789(var_4b86a4e17c656399, var_534bd24a37e5d78a);
    namespace_310ba947928891df::function_59a736fffddc7c05(var_4b86a4e17c656399, var_534bd24a37e5d78a);
    namespace_8885c19c053dcb46::function_4b12e9b5e37d05c2(var_4b86a4e17c656399, var_534bd24a37e5d78a);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb00e
// Size: 0xd4
function addlevelstoexperience(var_10e595a04a4b748d, levels) {
    rank = getrankforxp(var_10e595a04a4b748d);
    minxp = getrankinfominxp(rank);
    maxxp = getrankinfomaxxp(rank);
    rank = rank + (var_10e595a04a4b748d - minxp) / (maxxp - minxp);
    rank = rank + levels;
    if (rank < 0) {
        rank = 0;
        var_a176dcda08e09243 = 0;
    } else if (rank >= level.maxrank + 1) {
        rank = level.maxrank;
        var_a176dcda08e09243 = 1;
    } else {
        var_a176dcda08e09243 = rank - floor(rank);
        rank = int(floor(rank));
    }
    minxp = getrankinfominxp(rank);
    maxxp = getrankinfomaxxp(rank);
    return int(var_a176dcda08e09243 * (maxxp - minxp)) + minxp;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0ea
// Size: 0xa3
function forcespawn() {
    self endon("death_or_disconnect");
    self endon("spawned");
    wait(60);
    if (self.hasspawned) {
        return;
    }
    if (self.pers["team"] == "spectator" || self.pers["team"] == "codcaster") {
        return;
    }
    if (!namespace_d19129e4fa5d176::isvalidclass(self.pers["class"])) {
        self.pers["class"] = "CLASS/CUSTOM1";
        self.class = self.pers["class"];
    }
    thread spawnclient();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb194
// Size: 0x14d
function kickifdontspawn() {
    if (getdvarint(@"hash_b66208719c6bae6a", 0) == 1) {
        return;
    }
    if (istrue(self.spawnedasspectator) && !mayspawn()) {
        return;
    }
    self endon("death_or_disconnect");
    self endon("spawned");
    self endon("attempted_spawn");
    wait_time = getdvarfloat(@"hash_f1133a8f9790ea7b", 90);
    min_time = getdvarfloat(@"hash_1bfb8d86c9dc2fa7", 45);
    var_6392bb56f874343f = getdvarfloat(@"hash_ebb6b541d00c0665", 120);
    starttime = gettime();
    if (self ishost()) {
        kickwait(var_6392bb56f874343f);
    } else {
        kickwait(wait_time);
    }
    timepassed = (gettime() - starttime) / 1000;
    if (timepassed < wait_time - 0.1 && timepassed < min_time) {
        return;
    }
    if (self.hasspawned) {
        return;
    }
    if (self.pers["team"] == "spectator" || self.pers["team"] == "codcaster") {
        return;
    }
    kick(self getentitynumber(), "EXE/PLAYERKICKED_INACTIVE", 1);
    level thread [[ level.updategameevents ]]();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2e8
// Size: 0x1b
function kickwait(waittime) {
    level endon("game_ended");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(waittime);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb30a
// Size: 0x50
function monitorvotekick() {
    level endon("game_ended");
    self endon("disconnect");
    self.votestokick = 0;
    while (self.votestokick < 2) {
        self waittill("voteToKick");
        self.votestokick++;
    }
    kick(self getentitynumber(), "EXE/PLAYERKICKED_TEAMKILLS");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb361
// Size: 0x2d
function fakevote() {
    wait(1);
    self notify("voteToKick");
    wait(3);
    self notify("voteToKick");
    wait(2);
    self notify("voteToKick");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb395
// Size: 0x83
function function_147b2c2604c54839() {
    if (getdvarint(@"hash_62aef0bf73b3a0f", 0) == 0) {
        return 2;
    }
    var_446b694ab939f13a = gettime() + 2000;
    if (level.var_7a2f24cb7a276bc4 < var_446b694ab939f13a) {
        level.var_7a2f24cb7a276bc4 = var_446b694ab939f13a;
    }
    timeout = (level.var_7a2f24cb7a276bc4 - gettime()) * 0.001;
    level.var_7a2f24cb7a276bc4 = level.var_7a2f24cb7a276bc4 + level.frameduration;
    return timeout;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb420
// Size: 0x4ae
function totaldisttracking(spawnorigin) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("spawned");
    self notify("distFromSpawnTracking");
    self endon("distFromSpawnTracking");
    lastposition = spawnorigin;
    if (!isdefined(level.var_808e471a357552a4)) {
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            level.var_808e471a357552a4 = getdvarint(@"hash_a1f0eac17092b910", 240);
        } else {
            level.var_808e471a357552a4 = getdvarint(@"hash_35effe41515eb6d1", 120);
        }
    }
    if (!isdefined(level.var_4c3ab9ef59de46c9)) {
        level.var_4c3ab9ef59de46c9 = getdvarfloat(@"hash_dbca7dad12fdb6df", 100);
    }
    if (!isdefined(level.var_bc1acb66e7fa31be)) {
        level.var_bc1acb66e7fa31be = getdvarint(@"hash_25b5baf9db6af062", 3000);
    }
    if (!gameflag("prematch_done")) {
        gameflagwait("prematch_done");
        lastposition = self.origin;
    }
    var_c6500dfc575dc550 = 0;
    var_17915db3de174953 = 0;
    var_f76842485babee15 = 300;
    if (getgametype() == "arena" || namespace_36f464722d326bbe::function_2536e99eb6586f8f()) {
        var_f76842485babee15 = 50;
    } else if (level.var_ec2fb549b15ad827) {
        var_f76842485babee15 = 50;
    }
    if (!isdefined(level.var_7a2f24cb7a276bc4)) {
        level.var_7a2f24cb7a276bc4 = gettime() + 2000;
    }
    while (1) {
        timeout = function_147b2c2604c54839();
        message = waittill_any_timeout_5(timeout, "death", "vehicle_enter", "vehicle_change_seat", "vehicle_exit", "afk_tracking_resume");
        if (isdefined(level.var_6fbd98e2b09d3c26)) {
            throttle::function_f632348cbb773537(level.var_6fbd98e2b09d3c26, self);
        }
        if (message == "vehicle_exit" && !isdefined(self.lastvehicleseatchangetime)) {
            continue;
        }
        if (istrue(self.ignoreafkcheck) || istrue(self.var_cbece90c5beea82)) {
            continue;
        }
        if (message == "afk_tracking_resume") {
            lastposition = self.origin;
            continue;
        }
        initpersstat("totalDistTraveled");
        initpersstat("totalDistTraveledAFK");
        if (!isdefined(lastposition)) {
            lastposition = self.origin;
        }
        dist = distance(lastposition, self.origin);
        if (isdefined(level.var_4c3ab9ef59de46c9) && level.var_4c3ab9ef59de46c9 > 0) {
            if (dist < level.var_4c3ab9ef59de46c9) {
                dist = 0;
            }
        }
        incpersstat("totalDistTraveled", dist);
        incpersstat("totalDistTraveledAFK", dist);
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("distanceTraveledInVehicle")) && (message == "vehicle_exit" || isdefined(self.vehicle))) {
            incpersstat("distanceTraveledInVehicle", dist);
        }
        if (message == "vehicle_enter") {
            var_17915db3de174953 = namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(self);
            self.lastvehicleseatchangetime = gettime();
        }
        if (message == "vehicle_change_seat") {
            var_17915db3de174953 = namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(self);
        }
        if (var_c6500dfc575dc550 != var_17915db3de174953 || message == "vehicle_exit") {
            if (isdefined(self.lastvehicleseatchangetime)) {
                starttime = self.lastvehicleseatchangetime;
                time = (gettime() - starttime) / 1000;
                if (var_c6500dfc575dc550) {
                    if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("timeSpentAsDriver"))) {
                        incpersstat("timeSpentAsDriver", time);
                    }
                } else if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("timeSpentAsPassenger"))) {
                    incpersstat("timeSpentAsPassenger", time);
                }
            }
        }
        if (message == "vehicle_enter" || message == "vehicle_change_seat") {
            var_c6500dfc575dc550 = var_17915db3de174953;
        }
        if (message == "vehicle_change_seat") {
            self.lastvehicleseatchangetime = gettime();
        }
        lastposition = self.origin;
        if (namespace_3c5a4254f2b957ea::getpersstat("totalDistTraveledAFK") > var_f76842485babee15) {
            function_e636e108dffe6ab7();
        } else if (dist > 0) {
            self.var_3681793bfd7b68e = gettime() + level.var_bc1acb66e7fa31be;
        }
        if (istrue(namespace_3c5a4254f2b957ea::getpersstat("distTrackingPassedOrResetTime")) && function_48c5a587383a90e7()) {
            var_a0b3c6b277c1a146 = namespace_6d8da2b47f878104::function_19300abfbb10928b();
            if (var_a0b3c6b277c1a146 - namespace_3c5a4254f2b957ea::getpersstat("distTrackingPassedOrResetTime") > level.var_808e471a357552a4) {
                self.pers["distTrackingPassed"] = 0;
                self.pers["totalDistTraveledAFK"] = 0;
                self.var_cb9581fc7ff5f394 = undefined;
            }
        }
        incpersstat("averageAltitude", self.origin[2]);
        incpersstat("averageAltitudeCount", 1);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8d5
// Size: 0x46
function function_e636e108dffe6ab7() {
    self.pers["distTrackingPassed"] = 1;
    self.pers["totalDistTraveledAFK"] = 0;
    self.pers["distTrackingPassedOrResetTime"] = namespace_6d8da2b47f878104::function_19300abfbb10928b();
    self.var_3681793bfd7b68e = undefined;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb922
// Size: 0xf6
function initleanplayerstats() {
    if (!isdefined(self.pers["deaths"])) {
        initpersstat("deaths");
        namespace_2685ec368e022695::statsetchild("round", "deaths", 0);
    }
    self.deaths = getpersstat("deaths");
    initleaderboardstat("deaths");
    if (!isdefined(self.pers["score"])) {
        initpersstat("score");
        namespace_2685ec368e022695::statsetchild("round", "score", 0);
    }
    self.score = getpersstat("score");
    initleaderboardstat("score");
    if (!isdefined(self.pers["kills"])) {
        initpersstat("kills");
        namespace_2685ec368e022695::statsetchild("round", "kills", 0);
    }
    self.kills = getpersstat("kills");
    initleaderboardstat("kills");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba1f
// Size: 0x887
function initplayerstats() {
    namespace_3300a08ae9755a72::initplayer();
    namespace_2685ec368e022695::initbufferedstats();
    if (!isdefined(self.leaderboarddata)) {
        self.leaderboarddata = [];
    }
    initleanplayerstats();
    initpersstat("suicides");
    initleaderboardstat("suicides");
    initpersstat("headshots");
    initleaderboardstat("headshots");
    initpersstat("executions");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("assists"))) {
        initpersstat("assists");
        namespace_2685ec368e022695::statsetchild("round", "assists", 0);
    }
    self.assists = getpersstat("assists");
    initleaderboardstat("assists");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("captures"))) {
        initpersstat("captures");
        namespace_2685ec368e022695::statsetchild("round", "captures", 0);
    }
    initleaderboardstat("captures", &namespace_aad14af462a74d08::function_4fb61d33f02e8203);
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("returns"))) {
        initpersstat("returns");
        namespace_2685ec368e022695::statsetchild("round", "returns", 0);
    }
    initleaderboardstat("returns");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("defends"))) {
        initpersstat("defends");
        namespace_2685ec368e022695::statsetchild("round", "defends", 0);
    }
    initleaderboardstat("defends");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("plants"))) {
        initpersstat("plants");
        namespace_2685ec368e022695::statsetchild("round", "plants", 0);
    }
    initleaderboardstat("plants");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("defuses"))) {
        initpersstat("defuses");
        namespace_2685ec368e022695::statsetchild("round", "defuses", 0);
    }
    initleaderboardstat("defuses");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("destructions"))) {
        initpersstat("destructions");
        namespace_2685ec368e022695::statsetchild("round", "destructions", 0);
    }
    initleaderboardstat("destructions");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("confirmed"))) {
        initpersstat("confirmed");
        namespace_2685ec368e022695::statsetchild("round", "confirmed", 0);
    }
    initleaderboardstat("confirmed", &namespace_aad14af462a74d08::function_58e830149fcb9a1e);
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("denied"))) {
        initpersstat("denied");
        namespace_2685ec368e022695::statsetchild("round", "denied", 0);
    }
    initleaderboardstat("denied");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("rescues"))) {
        initpersstat("rescues");
        namespace_2685ec368e022695::statsetchild("round", "rescues", 0);
    }
    initleaderboardstat("rescues");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("touchdowns"))) {
        initpersstat("touchdowns");
        namespace_2685ec368e022695::statsetchild("round", "touchdowns", 0);
    }
    initleaderboardstat("touchdowns");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("fieldgoals"))) {
        initpersstat("fieldgoals");
        namespace_2685ec368e022695::statsetchild("round", "fieldgoals", 0);
    }
    initleaderboardstat("fieldgoals");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("killChains"))) {
        initpersstat("killChains");
        namespace_2685ec368e022695::statsetchild("round", "killChains", 0);
    }
    initleaderboardstat("killChains");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("killsAsSurvivor"))) {
        initpersstat("killsAsSurvivor");
        namespace_2685ec368e022695::statsetchild("round", "killsAsSurvivor", 0);
    }
    initleaderboardstat("killsAsSurvivor");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("killsAsInfected"))) {
        initpersstat("killsAsInfected");
        namespace_2685ec368e022695::statsetchild("round", "killsAsInfected", 0);
    }
    initleaderboardstat("killsAsInfected");
    initpersstat("teamkills");
    initleaderboardstat("teamkills");
    initpersstat("teamdamage");
    initpersstat("extrascore0");
    initleaderboardstat("extrascore0");
    initpersstat("extrascore1");
    initleaderboardstat("extrascore1");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("stabs"))) {
        initpersstat("stabs");
        namespace_2685ec368e022695::statsetchild("round", "stabs", 0);
    }
    initleaderboardstat("stabs");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("setbacks"))) {
        initpersstat("setbacks");
        namespace_2685ec368e022695::statsetchild("round", "setbacks", 0);
    }
    initleaderboardstat("setbacks");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("objTime"))) {
        initpersstat("objTime");
        namespace_2685ec368e022695::statsetchild("round", "objTime", 0);
    }
    initleaderboardstat("objTime");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("gamemodeScore"))) {
        initpersstat("gamemodeScore");
        namespace_2685ec368e022695::statsetchild("round", "gamemodeScore", 0);
    }
    initleaderboardstat("gamemodeScore");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("damage"))) {
        initpersstat("damage");
        namespace_2685ec368e022695::statsetchild("round", "damage", 0);
    }
    initleaderboardstat("damage", &namespace_aad14af462a74d08::function_73317c391c8e6d10);
    initpersstat("supersEarned");
    initleaderboardstat("supersEarned");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("downs"))) {
        initpersstat("downs");
        namespace_2685ec368e022695::statsetchild("round", "downs", 0);
    }
    initleaderboardstat("downs");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("contracts"))) {
        initpersstat("contracts");
        namespace_2685ec368e022695::statsetchild("round", "contracts", 0);
    }
    initleaderboardstat("contracts");
    initpersstat("wins");
    initleaderboardstat("wins");
    initpersstat("topFive");
    initleaderboardstat("topFive");
    initpersstat("topTen");
    initleaderboardstat("topTen");
    initpersstat("topTwentyFive");
    initleaderboardstat("topTwentyFive");
    initpersstat("gamesPlayed");
    initleaderboardstat("gamesPlayed");
    initpersstat("cash");
    initleaderboardstat("cash");
    initpersstat("eliteStarted");
    initleaderboardstat("eliteStarted");
    initpersstat("eliteCompleted");
    initleaderboardstat("eliteCompleted");
    initpersstat("eliteBlocked");
    initleaderboardstat("eliteBlocked");
    initpersstat("secondaryVictories");
    initleaderboardstat("secondaryVictories");
    initpersstat("weaponCaseExfils");
    initleaderboardstat("weaponCaseExfils");
    initpersstat("weaponCaseWins");
    initleaderboardstat("weaponCaseWins");
    initpersstat("contribution");
    initleaderboardstat("contribution");
    initpersstat("goals");
    initleaderboardstat("goals");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("segmentCaptures"))) {
        initpersstat("segmentCaptures");
        namespace_2685ec368e022695::statsetchild("round", "segmentCaptures", 0);
    }
    initleaderboardstat("segmentCaptures");
    initpersstat("highestMultikill");
    initpersstat("untradedDeaths");
    initpersstat("tradedKills");
    initpersstat("tradedDeaths");
    initpersstat("wallbangs");
    initpersstat("hvtKills");
    initleaderboardstat("hvtKills");
    initpersstat("zombieDeaths");
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("teamKillPunish"))) {
        self.pers["teamKillPunish"] = 0;
    }
    initpersstat("longestStreak");
    initleaderboardstat("longestStreak");
    self.pers["lives"] = getgametypenumlives();
    namespace_2685ec368e022695::statsetchild("round", "killStreak", 0);
    namespace_2685ec368e022695::statsetchild("round", "loss", 0);
    namespace_2685ec368e022695::statsetchild("round", "win", 0);
    namespace_2685ec368e022695::statsetchild("round", "scoreboardType", "none");
    initleaderboardstat("killStreak");
    initleaderboardstat("loss");
    initleaderboardstat("win");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2ad
// Size: 0x88
function addtoteamcount(var_c65fd3b0828b5d9b) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(isdefined(self.team));
    #/
    /#
        assert(isdefined(self.pers["team"]));
    #/
    /#
        assert(self.team == self.pers["team"]);
    #/
    thread addplayertoteam(self, self.team, var_c65fd3b0828b5d9b);
    [[ level.updategameevents ]]();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc33c
// Size: 0x71
function removefromteamcount() {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(isdefined(self.team));
    #/
    /#
        assert(isdefined(self.pers["team"]));
    #/
    /#
        assert(self.team == self.pers["team"]);
    #/
    removeplayerfromteam(self, self.team);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3b4
// Size: 0xed
function addtoalivecount(context) {
    /#
        assert(isplayer(self));
    #/
    var_da533fd7eba790e5 = self.team;
    if (!(isdefined(self.alreadyaddedtoalivecount) && self.alreadyaddedtoalivecount)) {
        modifyteamdata(var_da533fd7eba790e5, "hasSpawned", 1);
        incrementalivecount(var_da533fd7eba790e5, undefined, context);
    }
    self.alreadyaddedtoalivecount = undefined;
    var_1f7bcaa53ca6d399 = 0;
    foreach (entry in level.teamnamelist) {
        var_1f7bcaa53ca6d399 = var_1f7bcaa53ca6d399 + getteamdata(entry, "aliveCount");
    }
    if (var_1f7bcaa53ca6d399 > level.maxplayercount) {
        level.maxplayercount = var_1f7bcaa53ca6d399;
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4a8
// Size: 0x33
function incrementalivecount(var_da533fd7eba790e5, var_28335de6505d7e0c, context) {
    addtoteamlives(self, var_da533fd7eba790e5, var_28335de6505d7e0c, context);
    [[ level.updategameevents ]]();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4e2
// Size: 0x158
function removefromalivecount(disconnected, context) {
    /#
        assert(isplayer(self));
    #/
    lives = namespace_3c5a4254f2b957ea::getpersstat("lives");
    var_28335de6505d7e0c = getgametypenumlives() != 0 && lives == 0 && !istrue(level.skipplaybodycountsound) && !istrue(self.skipplaybodycountsound);
    self notify("remove_from_alive_count");
    var_f559615fec1d7733 = self.team;
    if (isdefined(self.switching_teams) && self.switching_teams && isdefined(self.joining_team) && self.joining_team == self.team) {
        var_f559615fec1d7733 = self.leaving_team;
    }
    if (isdefined(disconnected) && function_60bf8d82001fc22c() != "control") {
        namespace_99ac021a7547cae3::removeallfromlivescount();
    } else if (isdefined(self.switching_teams)) {
        if (!level.ingraceperiod || self.hasdonecombat) {
            modifyteamdata(var_f559615fec1d7733, "hasSpawned", -1);
            if (lives && function_60bf8d82001fc22c() != "control") {
                self.pers["lives"]--;
            }
        }
    }
    decrementalivecount(var_f559615fec1d7733, var_28335de6505d7e0c, context);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc641
// Size: 0x33
function decrementalivecount(var_f559615fec1d7733, var_28335de6505d7e0c, context) {
    removefromteamlives(self, var_f559615fec1d7733, var_28335de6505d7e0c, context);
    [[ level.updategameevents ]]();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc67b
// Size: 0x32
function addtolivescount() {
    /#
        assert(isplayer(self));
    #/
    modifyteamdata(self.team, "livesCount", namespace_3c5a4254f2b957ea::getpersstat("lives"));
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6b4
// Size: 0x49
function removefromlivescount() {
    /#
        assert(isplayer(self));
    #/
    setteamdata(self.team, "livesCount", int(max(0, getteamdata(self.team, "livesCount") - 1)));
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc704
// Size: 0x52
function removeallfromlivescount() {
    /#
        assert(isplayer(self));
    #/
    setteamdata(self.team, "livesCount", int(max(0, getteamdata(self.team, "livesCount") - namespace_3c5a4254f2b957ea::getpersstat("lives"))));
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc75d
// Size: 0x6b
function resetuiomnvarscommon() {
    if (isdefined(level.resetuiomnvargamemode)) {
        [[ level.resetuiomnvargamemode ]]();
    }
    self setclientomnvar("ui_objective_pinned_text_param", 0);
    self setclientomnvar("ui_securing", 0);
    self setclientomnvar("ui_reviver_id", -1);
    self setclientomnvar("ui_killcam_end_milliseconds", 0);
    self setclientomnvar("ui_edge_glow", 0);
    self setclientomnvar("ui_life_kill_count", 0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7cf
// Size: 0x60
function resetuidvarsonconnect() {
    resetuiomnvarscommon();
    self setclientdvar(@"hash_37165bc532972906", 0);
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hide_match_hint");
    self setclientomnvar("post_game_state", 0);
    if (gameflag("prematch_done")) {
        self setclientomnvar("ui_match_in_progress", 1);
    } else {
        self setclientomnvar("ui_match_in_progress", 0);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc836
// Size: 0x1b
function resetuidvarsonspectate() {
    resetuiomnvarscommon();
    self setclientdvar(@"hash_37165bc532972906", 0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc858
// Size: 0x112
function clearpinnedobjectives() {
    if (isbot(self)) {
        return;
    }
    if (isdefined(level.objectives)) {
        foreach (objective in level.objectives) {
            if (isdefined(objective.objidnum)) {
                namespace_5a22b6f3a56f7e9b::objective_unpin_player(objective.objidnum, self, objective.showoncompass);
            }
        }
    }
    if (isdefined(level.uncapturableobjectives)) {
        foreach (objective in level.uncapturableobjectives) {
            if (isdefined(objective.objidnum)) {
                namespace_5a22b6f3a56f7e9b::objective_unpin_player(objective.objidnum, self, objective.showoncompass);
            }
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc971
// Size: 0x13d
function watchtargethealth() {
    self endon("death_or_disconnect");
    self.targethealthinfo = [];
    while (1) {
        tracestart = (self.origin[0], self.origin[1], self.origin[2] + 64);
        playerangles = self getplayerangles();
        var_898f508242fa99f6 = anglestoforward(playerangles);
        traceend = tracestart + var_898f508242fa99f6 * 10000;
        results = namespace_2a184fc4902783dc::_bullet_trace(tracestart, traceend, 1, self, 0, 0, 0, 0, 0);
        var_9595f9643c69a295 = results["entity"];
        if (isdefined(var_9595f9643c69a295) && isplayer(var_9595f9643c69a295) && var_9595f9643c69a295.team != self.team) {
            if (isdefined(var_9595f9643c69a295)) {
                updatetargethealthvariable("ui_target_health", var_9595f9643c69a295.health);
            }
            if (isdefined(var_9595f9643c69a295)) {
                updatetargethealthvariable("ui_target_max_health", var_9595f9643c69a295.maxhealth);
            }
            if (isdefined(var_9595f9643c69a295)) {
                updatetargethealthvariable("ui_target_entity_num", var_9595f9643c69a295 getentitynumber());
            }
        } else {
            updatetargethealthvariable("ui_target_entity_num", -1);
        }
        wait(0.1);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcab5
// Size: 0x58
function updatetargethealthvariable(var_e9d476a3809cb3f1, value) {
    waitframe();
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(value)) {
        return;
    }
    if (!isdefined(self.targethealthinfo[var_e9d476a3809cb3f1]) || value != self.targethealthinfo[var_e9d476a3809cb3f1]) {
        self setclientomnvar(var_e9d476a3809cb3f1, value);
        self.targethealthinfo[var_e9d476a3809cb3f1] = value;
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb14
// Size: 0xc7
function showgamemodeobjectivetext() {
    if (self.hasspawned) {
        return;
    }
    if (!showmatchhint()) {
        return;
    }
    if (gameflag("prematch_done")) {
        return;
    }
    gameflagwait("prematch_done");
    self endon("disconnect");
    wait(1);
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.pers["team"])) {
        return;
    }
    player_team = self.pers["team"];
    hintmessage = getobjectivehinttext(player_team);
    if (isdefined(hintmessage)) {
        idx = 0;
        if (game["defenders"] == player_team) {
            idx = 1;
        }
        self setclientomnvar("ui_objective_text", idx);
        wait(6);
        self setclientomnvar("ui_objective_text", -1);
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe2
// Size: 0x17
function function_155c4aaa1dae57e6() {
    gameflagwait("prematch_done");
    namespace_4887422e77f3514e::onexitdeathsdoor(0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc00
// Size: 0x28
function function_ebd3a9ccfbeb79c3() {
    self endon("disconnect");
    level endon("game_ended");
    gameflagwait("prematch_fade_done");
    self.var_f9b51be13b8defc = 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2f
// Size: 0x57
function showmatchhint() {
    gametype = getgametype();
    switch (gametype) {
    case #"hash_5ff8e011d5b9d1c8":
        if (isdefined(game["roundsPlayed"]) && game["roundsPlayed"] > 0) {
            return 0;
        }
        break;
    default:
        break;
    }
    return 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc8e
// Size: 0x60
function trydisableminimap() {
    if (namespace_36f464722d326bbe::isBRStyleGameType() && istrue(game["inLiveLobby"])) {
        return;
    }
    if (alwaysshowminimap()) {
        return;
    }
    if (!istrue(self.showuavminimaponspawn) && !namespace_82dcd1d5ae30ff7::_hasperk("specialty_always_minimap")) {
        hideminimap(1);
    }
    self.showuavminimaponspawn = 0;
    /#
        level.var_3246cb2506b3080b = 0;
    #/
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccf5
// Size: 0x12
function initinputtypewatcher() {
    self.gamepadwasenabled = is_player_gamepad_enabled();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd0e
// Size: 0x1c5
function managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe) {
    self endon("disconnect");
    if (istrue(self.respawnfade)) {
        return;
    }
    self.respawnfade = 1;
    self notify("fadeDown_start");
    if (!isdefined(var_ad4dd16f29e24b77)) {
        var_ad4dd16f29e24b77 = 0;
    }
    fadeduration = var_ad4dd16f29e24b77;
    if (fadeduration > 0) {
        var_c8d49bba66d8db34 = 0;
        framecount = fadeduration / level.framedurationseconds;
        var_11b42fd8a12916ad = 1 / framecount;
        var_4a1830f604c82b9f = 0;
        while (var_4a1830f604c82b9f < framecount) {
            var_4a1830f604c82b9f++;
            var_c8d49bba66d8db34 = var_c8d49bba66d8db34 + var_11b42fd8a12916ad;
            var_c8d49bba66d8db34 = clamp(var_c8d49bba66d8db34, 0, 1);
            self setclientomnvar("ui_world_fade", var_c8d49bba66d8db34);
            waitframe();
        }
    } else {
        self setclientomnvar("ui_world_fade", 1);
    }
    self notify("fadeDown_complete");
    var_d2a2f36d8e05e3a6 = 0;
    if (!isreallyalive(self)) {
        self waittill("spawned_player");
        var_d2a2f36d8e05e3a6 = 1;
    }
    gameflagwait("prematch_done");
    if (var_d2a2f36d8e05e3a6) {
        utility::hidehudenable();
    }
    wait(2);
    self notify("fadeUp_start");
    if (!isdefined(var_dfab0807d83a77fe)) {
        var_dfab0807d83a77fe = 0;
    }
    fadeduration = var_dfab0807d83a77fe;
    if (fadeduration > 0) {
        var_c8d49bba66d8db34 = 1;
        framecount = fadeduration / level.framedurationseconds;
        var_11b42fd8a12916ad = 1 / framecount;
        var_4a1830f604c82b9f = 0;
        while (var_4a1830f604c82b9f < framecount) {
            var_4a1830f604c82b9f++;
            var_c8d49bba66d8db34 = var_c8d49bba66d8db34 - var_11b42fd8a12916ad;
            var_c8d49bba66d8db34 = clamp(var_c8d49bba66d8db34, 0, 1);
            self setclientomnvar("ui_world_fade", var_c8d49bba66d8db34);
            waitframe();
        }
    } else {
        self setclientomnvar("ui_world_fade", 0);
    }
    if (var_d2a2f36d8e05e3a6) {
        utility::hidehuddisable();
    }
    self.respawnfade = undefined;
    self notify("fadeUp_complete");
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xceda
// Size: 0x1e
function function_48c5a587383a90e7() {
    if (isdefined(level.var_29f84151a47f0a35)) {
        return [[ level.var_29f84151a47f0a35 ]]();
    }
    return 1;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcf00
// Size: 0x4d
function private function_ce68631570796a41() {
    gametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    var_7caad4faa1f544cf = gametype == "resurgence" ? 28423 : 29387;
    var_b9c95d2f33c0d8b = getdvarint(@"hash_4c90ef27a8730b6", var_7caad4faa1f544cf);
    return var_b9c95d2f33c0d8b;
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcf55
// Size: 0xa5
function private function_408b1b8364d0e722(var_b9c95d2f33c0d8b) {
    self endon("disconnect");
    self waittillmatch("challengeProgress", var_b9c95d2f33c0d8b);
    self.var_d405f79d63134727 = namespace_c8d5de7d515ce477::function_ec4c795c2898be52(self, var_b9c95d2f33c0d8b, "progress", 0);
    if (isdefined(level.arrow) && isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
        if (namespace_6c622b52017c6808::function_aee3a8be63db5997(self)) {
            namespace_6c622b52017c6808::function_1b94d19475863421();
        }
    }
    /#
        println("<unknown string>" + self.name + "<unknown string>" + var_b9c95d2f33c0d8b + "<unknown string>" + self.var_d405f79d63134727);
    #/
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd001
// Size: 0xb5
function private function_fd6c077d98fa4be9(var_8ca33da989ab6666) {
    self endon("disconnect");
    self waittillmatch("challengeProgress", var_8ca33da989ab6666);
    var_31fe93819b433368 = namespace_c8d5de7d515ce477::function_ec4c795c2898be52(self, var_8ca33da989ab6666, "progress", 0);
    /#
        println("<unknown string>" + self.name + "<unknown string>" + var_8ca33da989ab6666 + "<unknown string>" + var_31fe93819b433368);
    #/
    namespace_aad14af462a74d08::initgameflags(var_31fe93819b433368);
    if (namespace_aad14af462a74d08::function_cfe6dcedf7278543(namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_4a7f024e87253788", #"hash_cbddf4cbba197f26"))) {
        /#
            println("<unknown string>");
        #/
        namespace_aad14af462a74d08::function_5b58181f4c00ba56(namespace_649c2fab0fd72b8b::function_e2ff8f4b4e94f723(#"hash_4a7f024e87253788", #"hash_cbddf4cbba197f26"));
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0bd
// Size: 0xc4
function function_5c5f27d13e5eb129() {
    if (istrue(level.gameended)) {
        return;
    }
    self endon("disconnect");
    self endon("spawned_player");
    level endon("game_ended");
    self.var_3a8ab6f79eb16dd8 = undefined;
    self.var_caeae385d522ac4e = undefined;
    self.var_b1e84fe29da97885 = undefined;
    /#
        thread function_a4811f5d17345572();
    #/
    while (1) {
        playertospectate = self waittill("spectating_cycle_start");
        if (istrue(self.spectatekillcam)) {
            continue;
        }
        if (isdefined(playertospectate)) {
            if (!isdefined(self.var_b1e84fe29da97885)) {
                function_cb60f35d0e8977eb(1);
                thread removeSpectateBlackOnSpawn();
                thread function_a385f81e49ecdf52();
            }
            if (!isreallyalive(playertospectate)) {
                function_cb60f35d0e8977eb(1);
                continue;
            }
            thread removeSpectateBlackOnSpectateCycle(playertospectate);
        }
    }
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd188
// Size: 0x82
function removeSpectateBlackOnSpectateCycle(playertospectate) {
    self endon("disconnect");
    self endon("spawned_player");
    level endon("game_ended");
    playertospectate endon("death_or_disconnect");
    self notify("removeSpectateBlackOnSpectateCycle");
    self endon("removeSpectateBlackOnSpectateCycle");
    self.var_3a8ab6f79eb16dd8 = playertospectate;
    self waittill("spectating_cycle");
    if (!isdefined(self.var_caeae385d522ac4e)) {
        level thread namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0.25);
    }
    self.var_3a8ab6f79eb16dd8 = undefined;
    self.var_caeae385d522ac4e = playertospectate;
    thread watchForCurrentSpectateClientDeathOrDisconnect();
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd211
// Size: 0x3f
function watchForCurrentSpectateClientDeathOrDisconnect() {
    self endon("disconnect");
    self endon("spawned_player");
    level endon("game_ended");
    self notify("watchForCurrentSpectateClientDeathOrDisconnect");
    self endon("watchForCurrentSpectateClientDeathOrDisconnect");
    self.var_caeae385d522ac4e waittill("death_or_disconnect");
    function_cb60f35d0e8977eb(0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd257
// Size: 0x55
function function_cb60f35d0e8977eb(instant) {
    self.var_3a8ab6f79eb16dd8 = undefined;
    self.var_caeae385d522ac4e = undefined;
    self.var_b1e84fe29da97885 = 1;
    fadeduration = ter_op(istrue(instant), 0, 1);
    level thread namespace_36f464722d326bbe::function_852712268d005332(self, 1, fadeduration);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2b3
// Size: 0x38
function removeSpectateBlackOnSpawn() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("removeSpectateBlackOnSpawn");
    self endon("removeSpectateBlackOnSpawn");
    self waittill("spawned_player");
    level thread namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2f2
// Size: 0x22
function function_a385f81e49ecdf52() {
    self endon("disconnect");
    level waittill("game_ended");
    level thread namespace_36f464722d326bbe::function_852712268d005332(self, 0, 0);
}

// Namespace namespace_66c176d3c67cc0c2/namespace_99ac021a7547cae3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd31b
// Size: 0x91
function function_a4811f5d17345572() {
    /#
        while (1) {
            if (getdvarint(@"hash_ebeff7f31e599ecb", 0) != 0) {
                setdvar(@"hash_ebeff7f31e599ecb", 0);
                if (isdefined(self.var_3a8ab6f79eb16dd8)) {
                    self.var_3a8ab6f79eb16dd8 _suicide();
                }
            }
            if (getdvarint(@"hash_1bc12e3cf57a5f09", 0) != 0) {
                setdvar(@"hash_1bc12e3cf57a5f09", 0);
                if (isdefined(self.var_caeae385d522ac4e)) {
                    self.var_caeae385d522ac4e _suicide();
                }
            }
            waitframe();
        }
    #/
}

