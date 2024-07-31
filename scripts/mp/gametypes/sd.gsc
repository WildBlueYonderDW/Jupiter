#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\entity.gsc;
#using script_548072087c9fd504;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\obj_bombzone.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\mgl_mp.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\music_and_dialog.gsc;

#namespace sd;

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf21
// Size: 0x4ce
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "bombzone";
    allowed[2] = "blocker";
    if (scripts\cp_mp\utility\game_utility::function_21322da268e71c19()) {
        allowed[0] = scripts\mp\utility\game::getbasegametype();
    }
    if (scripts\cp_mp\utility\game_utility::function_eb455c18ac9d8ac5() || level.var_ec2fb549b15ad827) {
        allowed[0] = scripts\mp\utility\game::getbasegametype();
    }
    scripts\mp\gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 3, 0, 12);
        registertimelimitdvar(getgametype(), 150);
        registerscorelimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 6);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerwinbytwoenableddvar(getgametype(), 1);
        registerwinbytwomaxroundsdvar(getgametype(), 4);
    }
    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    level.nobuddyspawns = 1;
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.ondeadevent = &ondeadevent;
    level.ononeleftevent = &ononeleftevent;
    level.ontimelimit = &ontimelimit;
    level.onnormaldeath = &onnormaldeath;
    level.gamemodemaydropweapon = &isplayeroutsideofanybombsite;
    level.onobjectivecomplete = &onbombexploded;
    level.resetuiomnvargamemode = &scripts\mp\gametypes\obj_bombzone::resetuiomnvargamemode;
    level.onmaprestart = &onmaprestart;
    level.var_ca4e08767cbdae12 = &function_aaa2901a47b8bea9;
    level.allowlatecomers = 0;
    level.bombsplanted = 0;
    level.aplanted = 0;
    level.bplanted = 0;
    if (scripts\cp_mp\utility\game_utility::function_21322da268e71c19()) {
        game["dialog"]["gametype"] = "dx_mp_sadh_mode_t141_name";
    } else {
        game["dialog"]["gametype"] = "dx_mp_sede_game_uktl_name";
    }
    game["dialog"]["offense_obj"] = "dx_mp_sede_game_uktl_sdbo";
    game["dialog"]["defense_obj"] = "dx_mp_sede_game_uktl_sdbd";
    game["dialog"]["bomb_achieve"] = "dx_mp_sede_game_uktl_sdba";
    game["dialog"]["bomb_pickup"] = "dx_mp_sede_game_uktl_sdbu";
    game["dialog"]["bomb_pickup_first"] = "dx_mp_sede_game_uktl_sdb1";
    game["dialog"]["bomb_taken"] = "dx_mp_sede_game_uktl_sdbt";
    game["dialog"]["bomb_lost"] = "dx_mp_sede_game_uktl_sdbl";
    game["dialog"]["bomb_defused"] = "dx_mp_sede_game_uktl_bmdf";
    game["dialog"]["bomb_planting"] = "dx_mp_sede_game_uktl_bmpl";
    game["dialog"]["bomb_planting_a"] = "dx_mp_sede_game_uktl_bmpa";
    game["dialog"]["bomb_planting_b"] = "dx_mp_sede_game_uktl_bmpb";
    game["dialog"]["bomb_planted"] = "dx_mp_sede_game_uktl_bmbp";
    game["dialog"]["enemy_bomb_a"] = "dx_mp_sede_game_uktl_bmea";
    game["dialog"]["enemy_bomb_b"] = "dx_mp_sede_game_uktl_bmeb";
    game["dialog"]["enemy_bomb_defused"] = "dx_mp_sede_game_uktl_bmde";
    game["dialog"]["enemy_bomb_planted"] = "dx_mp_sede_game_uktl_bmpe";
    game["dialog"]["lead_lost"] = "null";
    game["dialog"]["lead_tied"] = "null";
    game["dialog"]["lead_taken"] = "null";
    game["dialog"]["attacking_bombgoesoff"] = "dx_mp_sede_game_mili_abgo";
    game["dialog"]["attacking_bombgoesoff_alldead"] = "dx_mp_sede_game_mili_abod";
    game["dialog"]["defending_bombgoesoff"] = "dx_mp_sede_game_uktl_dbgo";
    game["dialog"]["defend_enemydead_bomb"] = "dx_mp_sede_game_uktl_dedb";
    game["dialog"]["defend_enemydead_nobomb"] = "dx_mp_sede_game_uktl_dedn";
    game["dialog"]["planting_enemy_dead"] = "dx_mp_sede_game_uktl_pled";
    setomnvar("ui_bomb_timer_endtime_a", 0);
    setomnvar("ui_bomb_timer_endtime_b", 0);
    setomnvar("ui_bomb_planted_a", 0);
    setomnvar("ui_bomb_planted_b", 0);
    setomnvar("ui_bomb_interacting", 0);
    level.nosuspensemusic = 1;
    /#
        setdevdvarifuninitialized(@"hash_3f3a15fb7e7c9b0", 0);
        level thread scripts\mp\gametypes\obj_bombzone::function_bf6c5903e37dec2a();
        level thread scripts\mp\gametypes\obj_bombzone::function_b217c136e8889619();
    #/
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f7
// Size: 0x176
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(function_3514ae5d09f47ed2("bombTimer"), getmatchrulesdata("bombData", "bombTimer"));
    setdynamicdvar(function_3514ae5d09f47ed2("plantTime"), getmatchrulesdata("bombData", "plantTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("defuseTime"), getmatchrulesdata("bombData", "defuseTime"));
    setdynamicdvar(function_3514ae5d09f47ed2("multiBomb"), getmatchrulesdata("bombData", "multiBomb"));
    setdynamicdvar(function_3514ae5d09f47ed2("silentPlant"), getmatchrulesdata("bombData", "silentPlant"));
    setdynamicdvar(function_3514ae5d09f47ed2("resetProgress"), getmatchrulesdata("bombData", "resetProgress"));
    setdynamicdvar(function_3514ae5d09f47ed2("defendersCanSeeDroppedBomb"), getmatchrulesdata("bombData", "defendersCanSeeDroppedBomb"));
    setdynamicdvar(function_3514ae5d09f47ed2("defendersCanSeePlantedBomb"), getmatchrulesdata("bombData", "defendersCanSeePlantedBomb"));
    setdynamicdvar(function_3514ae5d09f47ed2("assignBombZoneChevrons"), getmatchrulesdata("bombData", "assignBombZoneChevrons"));
    setdynamicdvar(function_3514ae5d09f47ed2("manualDropEnabled"), getmatchrulesdata("carryData", "manualDropEnabled"));
    setdynamicdvar(@"hash_9fa05b5e31137511", 0);
    registerhalftimedvar("sd", 0);
    setdynamicdvar(@"scr_sd_promode", 0);
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1575
// Size: 0x3f
function waittooverridegraceperiod() {
    if (isteamreviveenabled() || islaststandenabled()) {
        game["dialog"]["gametype"] = "gametype_sandrescue";
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    level.overrideingraceperiod = 1;
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15bc
// Size: 0x1c
function onprecachegametype() {
    game["bomb_dropped_sound"] = "iw9_mp_ui_objective_lost";
    game["bomb_recovered_sound"] = "iw9_mp_ui_objective_taken";
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e0
// Size: 0x35d
function onstartgametype() {
    setomnvar("ui_victory_condition_completed", 0);
    var_54eef2b456bb1995 = getdvarint(@"hash_7dfc9d99d9c1ff2f", 0);
    if (var_54eef2b456bb1995 && isdefined(game["gameStateRestore"]) && istrue(game["gameStateRestore"].enabled)) {
        level.roundlimit = getwatcheddvar("roundlimit");
        if (game["roundsPlayed"] >= level.roundlimit - 1) {
            defending_team = game["defenders"];
            attacking_team = game["attackers"];
            if (!isdefined(game["match_kills"])) {
                game["match_kills"][defending_team] = 0;
                game["match_kills"][attacking_team] = 0;
            }
            if (!isdefined(game["match_deaths"])) {
                game["match_deaths"][defending_team] = 0;
                game["match_deaths"][attacking_team] = 0;
            }
            aheadteam = "allies";
            if (game["match_kills"][defending_team] == game["match_kills"][attacking_team]) {
                if (game["match_deaths"][defending_team] == game["match_deaths"][attacking_team]) {
                    randomidx = randomint(level.teamnamelist.size);
                    aheadteam = level.teamnamelist[randomidx];
                } else if (game["match_deaths"][defending_team] > game["match_deaths"][attacking_team]) {
                    aheadteam = defending_team;
                } else {
                    aheadteam = attacking_team;
                }
            } else if (game["match_kills"][defending_team] > game["match_kills"][attacking_team]) {
                aheadteam = defending_team;
            } else {
                aheadteam = attacking_team;
            }
            if (aheadteam != game["defenders"]) {
                game["switchedsides"] = 1;
                level.switchedsides = 1;
            } else {
                level.switchedsides = undefined;
            }
        }
    }
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    setclientnamemode("manual_change");
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        level._effect["bomb_explosion"] = loadfx("vfx/mgl/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
    } else {
        level._effect["bomb_explosion"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
    }
    level._effect["vehicle_explosion"] = loadfx("vfx/core/expl/small_vehicle_explosion_new.vfx");
    level._effect["building_explosion"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    setobjectivetext(game["attackers"], %OBJECTIVES/SD_ATTACKER);
    setobjectivetext(game["defenders"], %OBJECTIVES/SD_DEFENDER);
    if (level.splitscreen) {
        setobjectivescoretext(game["attackers"], %OBJECTIVES/SD_ATTACKER);
        setobjectivescoretext(game["defenders"], %OBJECTIVES/SD_DEFENDER);
    } else {
        setobjectivescoretext(game["attackers"], %OBJECTIVES/SD_ATTACKER_SCORE);
        setobjectivescoretext(game["defenders"], %OBJECTIVES/SD_DEFENDER_SCORE);
    }
    setobjectivehinttext(game["attackers"], %OBJECTIVES/SD_ATTACKER_HINT);
    setobjectivehinttext(game["defenders"], %OBJECTIVES/SD_DEFENDER_HINT);
    initspawns();
    thread waittooverridegraceperiod();
    setspecialloadout();
    if (scripts\cp_mp\utility\game_utility::function_2d79a7a3b91c4c3e()) {
        setomnvarforallclients("ui_reset_joystick", 0);
    }
    thread bombs();
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1945
// Size: 0x181
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    spawnkey = "sd";
    if (spawnlogic::function_b17bf43316b9fb08(spawnkey, "start_attackers")) {
        spawnlogic::initspawnlist(spawnkey, 0, "start_attacker", "start_defender");
    } else if (istrue(level.var_f1c340dae77ca15d)) {
        attackers = scripts\mp\spawnlogic::getspawnpointarray("mp_sd_spawn_attacker", 1);
        defenders = scripts\mp\spawnlogic::getspawnpointarray("mp_sd_spawn_defender", 1);
    } else {
        spawnlogic::addstartspawnpoints("mp_sd_spawn_attacker");
        spawnlogic::addstartspawnpoints("mp_sd_spawn_defender");
        spawnlogic::addspawnpoints(game["attackers"], "mp_sd_spawn_attacker");
        spawnlogic::addspawnpoints(game["defenders"], "mp_sd_spawn_defender");
        attackers = spawnlogic::getspawnpointarray("mp_sd_spawn_attacker");
        defenders = spawnlogic::getspawnpointarray("mp_sd_spawn_defender");
        spawnlogic::registerspawnset("start_attackers", attackers);
        spawnlogic::registerspawnset("start_defenders", defenders);
    }
    function_768bb924a0a3b2e9("start", game["attackers"], "start_attackers", "start_attackers");
    function_768bb924a0a3b2e9("start", game["defenders"], "start_defenders", "start_defenders");
    level.mapcenter = spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ace
// Size: 0x4a
function getspawnpoint() {
    if (spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic(#"start");
    } else {
        spawnlogic::setactivespawnlogic("StartSpawn", "Crit_Default");
    }
    return spawnlogic::function_8be1c339876506b9(self, "start", self.pers["team"]);
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b21
// Size: 0x16f
function onspawnplayer(revivespawn) {
    scripts\mp\hud_message::function_f004ef4606b9efdc("hide_match_hint");
    if (scripts\cp_mp\utility\game_utility::isgameparticipant(self)) {
        self.isplanting = 0;
        self.isdefusing = 0;
        self.isbombcarrier = 0;
        self.laststanding = 0;
    }
    if (level.multibomb && self.pers["team"] == game["attackers"]) {
        self setclientomnvar("ui_carrying_bomb", 1);
    } else {
        self setclientomnvar("ui_carrying_bomb", 0);
        foreach (bombzone in level.objectives) {
            bombzone.trigger disableplayeruse(self);
        }
    }
    setextrascore0(0);
    if (isdefined(self.pers["plants"])) {
        setextrascore0(self.pers["plants"]);
    }
    setextrascore1(0);
    if (isdefined(self.pers["defuses"])) {
        setextrascore1(self.pers["defuses"]);
    }
    level notify("spawned_player");
    thread updatematchstatushintonspawn();
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        scripts\mp\gametypes\mgl_mp::function_afadc6882a95f376(revivespawn);
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1c98
// Size: 0xf6
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    self setclientomnvar("ui_carrying_bomb", 0);
    if (!isdefined(level.generalkillcount)) {
        scripts\mp\codcasterclientmatchdata::function_48544e365f4f5648(7, 1);
        level.generalkillcount = 0;
    }
    if (isdefined(attacker.team) && attacker.team != self.team) {
        if (level.generalkillcount == 0) {
            attacker scripts\mp\codcasterclientmatchdata::function_48544e365f4f5648(4, 1);
        }
        level.generalkillcount += 1;
        function_2a7eac0b867af187(attacker.team, 1);
    }
    thread checkallowspectating();
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d96
// Size: 0x89
function checkallowspectating() {
    waitframe();
    update = 0;
    if (!getteamdata(game["attackers"], "aliveCount")) {
        level.spectateoverride[game["attackers"]].allowenemyspectate = 1;
        update = 1;
    }
    if (!getteamdata(game["defenders"], "aliveCount")) {
        level.spectateoverride[game["defenders"]].allowenemyspectate = 1;
        update = 1;
    }
    if (update) {
        scripts\mp\spectating::updatespectatesettings();
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e27
// Size: 0x4b
function sd_endgame(winningteam, endreasontext) {
    setomnvarforallclients("ui_objective_pinned_text_param", 0);
    setomnvar("ui_bomb_interacting", 0);
    if (scripts\cp_mp\utility\game_utility::function_2d79a7a3b91c4c3e()) {
        setomnvarforallclients("ui_reset_joystick", 1);
    }
    thread scripts\mp\gamelogic::endgame(winningteam, endreasontext);
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e7a
// Size: 0x83
function interruptbombplanting() {
    foreach (player in level.players) {
        if (istrue(player.isplanting) && isdefined(player.lastnonuseweapon)) {
            player _switchtoweaponimmediate(player.lastnonuseweapon);
            break;
        }
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f05
// Size: 0x169
function ondeadevent(team) {
    interruptbombplanting();
    if (level.bombexploded > 0 || level.bombdefused) {
        return;
    }
    if (team == "all") {
        if (level.bombplanted) {
            sd_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
        } else {
            sd_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
        }
        return;
    }
    if (team == game["attackers"]) {
        if (level.bombplanted) {
            scripts\mp\utility\dialog::statusdialog("defend_enemydead_bomb", game["defenders"], "status");
            return;
        } else {
            scripts\mp\utility\dialog::statusdialog("defend_enemydead_nobomb", game["defenders"], "status");
        }
        level thread sd_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
        return;
    }
    if (team == game["defenders"]) {
        scripts\mp\utility\dialog::statusdialog("planting_enemy_dead", game["attackers"], "status");
        level thread sd_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2076
// Size: 0x51
function ononeleftevent(team) {
    if (level.bombexploded > 0 || level.bombdefused) {
        return;
    }
    lastplayer = getlastlivingplayer(team);
    lastplayer.laststanding = 1;
    lastplayer thread givelastonteamwarning();
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x20cf
// Size: 0x398
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    score = scripts\mp\rank::getscoreinfovalue(#"kill");
    assert(isdefined(score));
    team = victim.team;
    var_aec2e5e01f424119 = 0;
    if (isdefined(attacker.laststanding) && attacker.laststanding) {
        attacker thread function_e3e3e81453fd788b(#"hash_4bc4aed7d23221b3");
    }
    if (victim.isplanting) {
        setomnvar("ui_bomb_interacting", 0);
        logannouncement(victim, attacker, "Bomb Carrier Killed", victim.origin, "was_planting_bomb");
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "planting");
        attacker incpersstat("defends", 1);
        attacker scripts\mp\persistence::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker thread scripts\mp\utility\points::doScoreEvent(#"hash_abe3cc5116e269c2");
        var_aec2e5e01f424119 = 1;
    } else if (victim.isbombcarrier) {
        logannouncement(victim, attacker, "Bomb Carrier Killed", victim.origin);
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "carrying");
    } else if (victim.isdefusing) {
        setomnvar("ui_bomb_interacting", 0);
        logannouncement(victim, attacker, "Defuser Killed", victim.origin);
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "defusing");
        attacker incpersstat("defends", 1);
        attacker scripts\mp\persistence::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker thread scripts\mp\utility\points::doScoreEvent(#"hash_dfcd9b1f5926cb85");
        var_aec2e5e01f424119 = 1;
    }
    if (isdefined(level.sdbomb.carrier)) {
        if (isdefined(attacker) && isplayer(attacker) && attacker.pers["team"] != victim.pers["team"]) {
            if (attacker.pers["team"] == level.sdbomb.carrier.team && attacker != level.sdbomb.carrier) {
                var_db36f135f40e7940 = distancesquared(level.sdbomb.carrier.origin, attacker.origin);
                if (var_db36f135f40e7940 < 105625) {
                    attacker thread scripts\mp\rank::scoreeventpopup(#"defend");
                    attacker thread scripts\mp\utility\points::doScoreEvent(#"hash_2d96ced878338cd2");
                    attacker incpersstat("defends", 1);
                    attacker scripts\mp\persistence::statsetchild("round", "defends", attacker.pers["defends"]);
                    thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "defending");
                    var_aec2e5e01f424119 = 1;
                }
            }
        }
    }
    if (!var_aec2e5e01f424119) {
        scripts\mp\gametypes\obj_bombzone::bombzone_awardgenericbombzonemedals(attacker, victim);
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x246f
// Size: 0x9e
function givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread scripts\mp\battlechatter_mp::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    otherteam = getotherteam(self.pers["team"])[0];
    level thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    level thread teamplayercardsplash("callout_lastenemyalive", self, otherteam);
    level notify("last_alive", self);
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(3, self.team, self getentitynumber());
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2515
// Size: 0xad
function ontimelimit() {
    sd_endgame(game["defenders"], game["end_reason"]["time_limit_reached"]);
    if (!isdefined(level.var_3d06de480d9ef9c4)) {
        scripts\mp\codcasterclientmatchdata::function_94c8f3722d550646();
        level.var_3d06de480d9ef9c4 = 1;
    }
    foreach (player in level.players) {
        if (isdefined(player.bombplantweapon)) {
            player _takeweapon(player.bombplantweapon);
            break;
        }
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25ca
// Size: 0xe5
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
    level.bombtimer = dvarfloatvalue("bombtimer", 45, 1, 240);
    level.planttime = dvarfloatvalue("planttime", 5, 0, 20);
    level.defusetime = dvarfloatvalue("defusetime", 5, 0, 20);
    level.multibomb = dvarintvalue("multibomb", 0, 0, 1);
    level.silentplant = dvarintvalue("silentPlant", 0, 0, 1);
    level.resetprogress = dvarintvalue("resetProgress", 0, 0, 1);
    level.defendersCanSeeDroppedBomb = dvarintvalue("defendersCanSeeDroppedBomb", 0, 0, 1);
    level.defendersCanSeePlantedBomb = dvarintvalue("defendersCanSeePlantedBomb", 0, 0, 1);
    level.assignBombZoneChevrons = dvarintvalue("assignBombZoneChevrons", 0, 0, 1);
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26b7
// Size: 0x1ff
function removebombzonec(bombzones) {
    czones = [];
    brushmodels = getentarray("script_brushmodel", "classname");
    foreach (brushmodel in brushmodels) {
        if (isdefined(brushmodel.script_gameobjectname) && brushmodel.script_gameobjectname == "bombzone") {
            foreach (bombzone in bombzones) {
                if (distance(brushmodel.origin, bombzone.origin) < 100 && issubstr(tolower(bombzone.script_label), "c")) {
                    bombzone.relatedbrushmodel = brushmodel;
                    czones[czones.size] = bombzone;
                    break;
                }
            }
        }
    }
    foreach (czone in czones) {
        czone.relatedbrushmodel delete();
        visuals = getentarray(czone.target, "targetname");
        foreach (visual in visuals) {
            visual delete();
        }
        czone delete();
    }
    return array_removeundefined(bombzones);
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28bf
// Size: 0xef
function function_1ba24a5f29969bae() {
    if (isdefined(level.var_d27f667e6320d465)) {
        var_2544a7d11b569e17 = getstruct(level.var_d27f667e6320d465.var_b6c7ddacaf25d01, "script_noteworthy");
        var_2544a8d11b56a04a = getstruct(level.var_d27f667e6320d465.var_b6c7adacaf25668, "script_noteworthy");
    } else {
        var_2544a7d11b569e17 = getstruct("sd_bombzone_a", "script_noteworthy");
        var_2544a8d11b56a04a = getstruct("sd_bombzone_b", "script_noteworthy");
    }
    if (isdefined(var_2544a7d11b569e17) && isdefined(var_2544a8d11b56a04a)) {
        return [[drop_to_ground(var_2544a7d11b569e17.origin, 10, -100), var_2544a7d11b569e17.angles], [drop_to_ground(var_2544a8d11b56a04a.origin, 10, -100), var_2544a8d11b56a04a.angles]];
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b6
// Size: 0x55b
function bombs() {
    scripts\mp\gametypes\obj_bombzone::bombzone_setupbombcase("sd_bomb");
    triggers = getentarray("bombzone", "targetname");
    triggers = removebombzonec(triggers);
    level.scriptedtriggers = 0;
    if (triggers.size == 0) {
        level.scriptedtriggers = 1;
        var_c741548e94b54227 = getstruct("sd_bombzone_a", "script_noteworthy");
        if (isdefined(var_c741548e94b54227)) {
            trigger = spawn("script_model", drop_to_ground(var_c741548e94b54227.origin, 10, -100));
            trigger setmodel("sd_equipment_bombsite_crate");
            trigger.angles = var_c741548e94b54227.angles;
            trigger.objectivekey = "_a";
            trigger.iconname = "_a";
            trigger.usetype = 1;
            trigger.isuseobject = 1;
            triggers[triggers.size] = trigger;
        }
        var_c741558e94b5445a = getstruct("sd_bombzone_b", "script_noteworthy");
        if (isdefined(var_c741558e94b5445a)) {
            trigger = spawn("script_model", drop_to_ground(var_c741558e94b5445a.origin, 10, -100));
            trigger setmodel("sd_equipment_bombsite_crate");
            trigger.angles = var_c741558e94b5445a.angles;
            trigger.objectivekey = "_b";
            trigger.iconname = "_b";
            trigger.usetype = 1;
            trigger.isuseobject = 1;
            triggers[triggers.size] = trigger;
        }
    }
    level.objectives = [];
    overrideorigins = undefined;
    if (!istrue(level.scriptedtriggers)) {
        overrideorigins = function_1ba24a5f29969bae();
    }
    foreach (count, trigger in triggers) {
        if (isdefined(overrideorigins)) {
            trigger.origin = overrideorigins[count][0];
            trigger.angles = overrideorigins[count][1];
        }
        bombzone = scripts\mp\gametypes\obj_bombzone::setupobjective(trigger, 1, 1);
        bombzone.onbeginuse = &onbeginuse;
        bombzone.onenduse = &onenduse;
        bombzone.onuse = &onuseplantobject;
        if (isdefined(overrideorigins)) {
            foreach (visual in bombzone.visuals) {
                visual.origin = overrideorigins[count][0];
                visual.angles = overrideorigins[count][1];
            }
        }
        level.objectives[bombzone.objectivekey] = bombzone;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
    } else {
        level.sdbomb scripts\mp\gameobjects::requestid(1, 1, 2);
        level.sdbomb scripts\mp\gameobjects::setobjectivestatusicons("waypoint_bomb");
        if (level.defendersCanSeeDroppedBomb) {
            level.sdbomb scripts\mp\gameobjects::setvisibleteam("any");
        } else {
            level.sdbomb scripts\mp\gameobjects::setvisibleteam("friendly");
        }
    }
    level.sdbombmodel = level.sdbomb.visuals[0];
    level.sdbombmodel scripts\mp\gametypes\obj_bombzone::setteaminhuddatafromteamname(game["attackers"]);
    level.sdbombmodel setasgametypeobjective();
    if (getdvarint(@"hash_9cf963b64e1223e7") == 1) {
    } else {
        objective_setspecialobjectivedisplay(level.sdbomb.objidnum, 1);
        scripts\mp\objidpoolmanager::objective_set_play_intro(level.sdbomb.objidnum, 0);
        scripts\mp\objidpoolmanager::objective_set_play_outro(level.sdbomb.objidnum, 0);
    }
    if (getdvarint(@"hash_94706b5dc31f719b") != 0) {
        level.sdbomb scripts\mp\gameobjects::function_316d9da870e12a03([level.sdbomb.visuals[0]], level.sdbomb.trigger, 1, 80, 0, &function_745c1786b3409d7a);
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        wait 0.5;
    }
    foreach (bombzone in level.objectives) {
        var_3c2389ba69e5822b = scripts\mp\gametypes\obj_bombzone::getreservedobjid(bombzone.objectivekey);
        bombzone scripts\mp\gameobjects::requestid(1, 1, var_3c2389ba69e5822b);
        bombzone scripts\mp\gameobjects::setobjectivestatusicons("waypoint_defend", "waypoint_target");
        bombzone scripts\mp\gameobjects::setvisibleteam("any");
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f19
// Size: 0xba
function onbeginuse(player) {
    scripts\mp\gametypes\obj_bombzone::bombzone_onbeginuse(player);
    if (!scripts\mp\gameobjects::isfriendlyteam(player.pers["team"])) {
        if (level.multibomb) {
            if (self.objectivekey == "_a") {
                level.objectives["_b"] scripts\mp\gameobjects::allowuse("none");
                level.objectives["_b"] scripts\mp\gameobjects::setvisibleteam("friendly");
                return;
            }
            level.objectives["_a"] scripts\mp\gameobjects::allowuse("none");
            level.objectives["_a"] scripts\mp\gameobjects::setvisibleteam("friendly");
        }
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2fdb
// Size: 0xd7
function onenduse(team, player, result) {
    scripts\mp\gametypes\obj_bombzone::bombzone_onenduse(team, player, result);
    if (isdefined(player) && !scripts\mp\gameobjects::isfriendlyteam(player.pers["team"])) {
        if (level.multibomb && !result) {
            if (self.objectivekey == "_a") {
                level.objectives["_b"] scripts\mp\gameobjects::allowuse("enemy");
                level.objectives["_b"] scripts\mp\gameobjects::setvisibleteam("any");
                return;
            }
            level.objectives["_a"] scripts\mp\gameobjects::allowuse("enemy");
            level.objectives["_a"] scripts\mp\gameobjects::setvisibleteam("any");
        }
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30ba
// Size: 0xab
function onuseplantobject(player) {
    if (!scripts\mp\gameobjects::isfriendlyteam(player.pers["team"])) {
        foreach (zone in level.objectives) {
            if (zone == self) {
                continue;
            }
            zone scripts\mp\gameobjects::disableobject();
        }
    }
    scripts\mp\gametypes\obj_bombzone::bombzone_onuseplantobject(player);
    logannouncement(player, undefined, "Bomb Planted", player.origin);
    thread scripts\mp\music_and_dialog::bombplanted_music();
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x316d
// Size: 0x4d
function setspecialloadout() {
    if (isusingmatchrulesdata() && getmatchrulesdatawithteamandindex("defaultClasses", game["attackers"], 5, "class", "inUse")) {
        level.sd_loadout[game["attackers"]] = getmatchrulesspecialclass(game["attackers"], 5);
    }
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x31c2
// Size: 0xc7
function onbombexploded(objectivetype, bomblabel, player, team, extradata) {
    if (istrue(level.nukeinfo.incoming)) {
        return;
    }
    if (team == game["attackers"]) {
        setgameendtime(0);
        wait 3;
        logannouncement(undefined, undefined, "Target Destroyed", self.trigger.origin);
        sd_endgame(game["attackers"], game["end_reason"]["target_destroyed"]);
    } else {
        setgameendtime(0);
        wait 1.5;
        sd_endgame(game["defenders"], game["end_reason"]["bomb_defused"]);
    }
    scripts\mp\codcasterclientmatchdata::function_94c8f3722d550646();
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3291
// Size: 0x111
function updatematchstatushintonspawn() {
    if (level.bombplanted) {
        if (game["attackers"] == self.team) {
            scripts\mp\hud_message::function_f004ef4606b9efdc("bomb_defend");
        } else {
            scripts\mp\hud_message::function_f004ef4606b9efdc("bomb_defuse");
        }
        return;
    }
    if (isdefined(level.sdbomb)) {
        if (isdefined(level.sdbomb.carrier)) {
            if (level.sdbomb.carrier.team == self.team) {
                if (level.sdbomb.carrier == self) {
                    scripts\mp\hud_message::function_f004ef4606b9efdc("bomb_plant");
                } else {
                    scripts\mp\hud_message::function_f004ef4606b9efdc("bomb_escort");
                }
            } else {
                scripts\mp\hud_message::function_f004ef4606b9efdc("bombsite_defend");
            }
        } else if (game["attackers"] == self.team) {
            scripts\mp\hud_message::function_f004ef4606b9efdc("bomb_pickup");
        } else {
            scripts\mp\hud_message::function_f004ef4606b9efdc("bombsite_defend");
        }
        return;
    }
    scripts\mp\hud_message::function_f004ef4606b9efdc("hide_match_hint");
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33aa
// Size: 0x61
function function_aaa2901a47b8bea9(point) {
    if (isdefined(level.sdbomb)) {
        if (isdefined(point)) {
            if (ispointinsidecircle(point, level.sdbomb.curorigin, 40)) {
                return false;
            }
        } else if (self istouching(level.sdbomb.trigger)) {
            return false;
        }
    }
    return true;
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3414
// Size: 0x13
function onmaprestart() {
    level.generalkillcount = undefined;
    scripts\mp\codcasterclientmatchdata::function_edba1ee7c2375a5();
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x342f
// Size: 0x6b
function function_2a7eac0b867af187(team, increment) {
    if (!isdefined(team)) {
        return;
    }
    if (!isdefined(game["gameKillCounts"])) {
        game["gameKillCounts"] = [];
    }
    if (!isdefined(game["gameKillCounts"][team])) {
        game["gameKillCounts"][team] = 0;
    }
    game["gameKillCounts"][team] = game["gameKillCounts"][team] + increment;
    function_216b35ca5806ec6(game["gameKillCounts"][team], team);
}

// Namespace sd / scripts\mp\gametypes\sd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34a2
// Size: 0x18
function function_745c1786b3409d7a(player) {
    player setclientomnvar("ui_carrying_bomb", 0);
}

