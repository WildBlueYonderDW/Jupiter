// mwiii decomp prototype
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
#using script_26508f2de04c7a52;
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

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf1
// Size: 0x4ce
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "bombzone";
    allowed[2] = "blocker";
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
        allowed[0] = namespace_cd0b2d039510b38d::function_60bf8d82001fc22c();
    }
    if (namespace_36f464722d326bbe::function_eb455c18ac9d8ac5() || level.var_ec2fb549b15ad827) {
        allowed[0] = namespace_cd0b2d039510b38d::function_60bf8d82001fc22c();
    }
    namespace_19b4203b51d56488::main(allowed);
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
    level.resetuiomnvargamemode = &namespace_fa795886dfc5f58a::resetuiomnvargamemode;
    level.onmaprestart = &onmaprestart;
    level.var_ca4e08767cbdae12 = &function_aaa2901a47b8bea9;
    level.allowlatecomers = 0;
    level.bombsplanted = 0;
    level.aplanted = 0;
    level.bplanted = 0;
    if (namespace_36f464722d326bbe::function_21322da268e71c19()) {
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
        level thread namespace_fa795886dfc5f58a::function_bf6c5903e37dec2a();
        level thread namespace_fa795886dfc5f58a::function_b217c136e8889619();
    #/
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c6
// Size: 0x177
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
    setdynamicdvar(@"hash_53af16043399cecf", 0);
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1344
// Size: 0x40
function waittooverridegraceperiod() {
    if (isteamreviveenabled() || islaststandenabled()) {
        game["dialog"]["gametype"] = "gametype_sandrescue";
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.overrideingraceperiod = 1;
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x138b
// Size: 0x1d
function onprecachegametype() {
    game["bomb_dropped_sound"] = "iw9_mp_ui_objective_lost";
    game["bomb_recovered_sound"] = "iw9_mp_ui_objective_taken";
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13af
// Size: 0x363
function onstartgametype() {
    setomnvar("ui_victory_condition_completed", 0);
    var_54eef2b456bb1995 = getdvarint(@"hash_7dfc9d99d9c1ff2f", 0);
    if (var_54eef2b456bb1995 && isdefined(game["gameStateRestore"]) && istrue(game["gameStateRestore"].enabled)) {
        level.roundlimit = getwatcheddvar("roundlimit");
        if (game["roundsPlayed"] >= level.roundlimit - 1) {
            var_8613c2b22b0116a5 = game["defenders"];
            var_d6fd8be398b20f61 = game["attackers"];
            if (!isdefined(game["match_kills"])) {
                game["match_kills"][var_8613c2b22b0116a5] = 0;
                game["match_kills"][var_d6fd8be398b20f61] = 0;
            }
            if (!isdefined(game["match_deaths"])) {
                game["match_deaths"][var_8613c2b22b0116a5] = 0;
                game["match_deaths"][var_d6fd8be398b20f61] = 0;
            }
            aheadteam = "allies";
            if (game["match_kills"][var_8613c2b22b0116a5] == game["match_kills"][var_d6fd8be398b20f61]) {
                if (game["match_deaths"][var_8613c2b22b0116a5] == game["match_deaths"][var_d6fd8be398b20f61]) {
                    var_7be710153f5d3671 = randomint(level.teamnamelist.size);
                    aheadteam = level.teamnamelist[var_7be710153f5d3671];
                } else if (game["match_deaths"][var_8613c2b22b0116a5] > game["match_deaths"][var_d6fd8be398b20f61]) {
                    aheadteam = var_8613c2b22b0116a5;
                } else {
                    aheadteam = var_d6fd8be398b20f61;
                }
            } else if (game["match_kills"][var_8613c2b22b0116a5] > game["match_kills"][var_d6fd8be398b20f61]) {
                aheadteam = var_8613c2b22b0116a5;
            } else {
                aheadteam = var_d6fd8be398b20f61;
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
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        level._effect["bomb_explosion"] = loadfx("vfx/mgl/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
    } else {
        level._effect["bomb_explosion"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
    }
    level._effect["vehicle_explosion"] = loadfx("vfx/core/expl/small_vehicle_explosion_new.vfx");
    level._effect["building_explosion"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    setobjectivetext(game["attackers"], "OBJECTIVES/SD_ATTACKER");
    setobjectivetext(game["defenders"], "OBJECTIVES/SD_DEFENDER");
    if (level.splitscreen) {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/SD_ATTACKER");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/SD_DEFENDER");
    } else {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/SD_ATTACKER_SCORE");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/SD_DEFENDER_SCORE");
    }
    setobjectivehinttext(game["attackers"], "OBJECTIVES/SD_ATTACKER_HINT");
    setobjectivehinttext(game["defenders"], "OBJECTIVES/SD_DEFENDER_HINT");
    initspawns();
    thread waittooverridegraceperiod();
    setspecialloadout();
    if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        setomnvarforallclients("ui_reset_joystick", 0);
    }
    thread bombs();
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1719
// Size: 0x183
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_6170ec00c4bc9b5b = "sd";
    if (spawnlogic::function_b17bf43316b9fb08(var_6170ec00c4bc9b5b, "start_attackers")) {
        spawnlogic::function_85f6a1797c330b26(var_6170ec00c4bc9b5b, 0, "start_attacker", "start_defender");
    } else if (istrue(level.var_f1c340dae77ca15d)) {
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_sd_spawn_attacker", 1);
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_sd_spawn_defender", 1);
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

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18a3
// Size: 0x4b
function getspawnpoint() {
    if (spawnlogic::function_bff229a11ecd1e34()) {
        spawnlogic::setactivespawnlogic(#"start");
    } else {
        spawnlogic::setactivespawnlogic("StartSpawn", "Crit_Default");
    }
    return spawnlogic::function_8be1c339876506b9(self, "start", self.pers["team"]);
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f6
// Size: 0x171
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hide_match_hint");
    if (namespace_36f464722d326bbe::isgameparticipant(self)) {
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
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        namespace_afbc0aa1b551667a::function_afadc6882a95f376(var_9156b53bcf7ce573);
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6e
// Size: 0xf7
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    self setclientomnvar("ui_carrying_bomb", 0);
    if (!isdefined(level.var_b68731a6dc31a0ce)) {
        namespace_b919c4be206d3c80::function_48544e365f4f5648(7, 1);
        level.var_b68731a6dc31a0ce = 0;
    }
    if (isdefined(attacker.team) && attacker.team != self.team) {
        if (level.var_b68731a6dc31a0ce == 0) {
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(4, 1);
        }
        level.var_b68731a6dc31a0ce = level.var_b68731a6dc31a0ce + 1;
        function_2a7eac0b867af187(attacker.team, 1);
    }
    thread checkallowspectating();
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6c
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
        namespace_5aeecefc462876::updatespectatesettings();
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfc
// Size: 0x4c
function sd_endgame(winningteam, endreasontext) {
    setomnvarforallclients("ui_objective_pinned_text_param", 0);
    setomnvar("ui_bomb_interacting", 0);
    if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
        setomnvarforallclients("ui_reset_joystick", 1);
    }
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, endreasontext);
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4f
// Size: 0x85
function interruptbombplanting() {
    foreach (player in level.players) {
        if (istrue(player.isplanting) && isdefined(player.lastnonuseweapon)) {
            player _switchtoweaponimmediate(player.lastnonuseweapon);
            break;
        }
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdb
// Size: 0x16a
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
    } else if (team == game["attackers"]) {
        if (level.bombplanted) {
            namespace_944ddf7b8df1b0e3::statusdialog("defend_enemydead_bomb", game["defenders"], "status");
            return;
        } else {
            namespace_944ddf7b8df1b0e3::statusdialog("defend_enemydead_nobomb", game["defenders"], "status");
        }
        level thread sd_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else if (team == game["defenders"]) {
        namespace_944ddf7b8df1b0e3::statusdialog("planting_enemy_dead", game["attackers"], "status");
        level thread sd_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4c
// Size: 0x51
function ononeleftevent(team) {
    if (level.bombexploded > 0 || level.bombdefused) {
        return;
    }
    lastplayer = getlastlivingplayer(team);
    lastplayer.laststanding = 1;
    lastplayer thread givelastonteamwarning();
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea4
// Size: 0x39b
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    score = namespace_62c556437da28f50::getscoreinfovalue(#"kill");
    /#
        assert(isdefined(score));
    #/
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
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_abe3cc5116e269c2");
        var_aec2e5e01f424119 = 1;
    } else if (victim.isbombcarrier) {
        logannouncement(victim, attacker, "Bomb Carrier Killed", victim.origin);
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "carrying");
    } else if (victim.isdefusing) {
        setomnvar("ui_bomb_interacting", 0);
        logannouncement(victim, attacker, "Defuser Killed", victim.origin);
        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "defusing");
        attacker incpersstat("defends", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_dfcd9b1f5926cb85");
        var_aec2e5e01f424119 = 1;
    }
    if (isdefined(level.sdbomb.carrier)) {
        if (isdefined(attacker) && isplayer(attacker) && attacker.pers["team"] != victim.pers["team"]) {
            if (attacker.pers["team"] == level.sdbomb.carrier.team && attacker != level.sdbomb.carrier) {
                var_db36f135f40e7940 = distancesquared(level.sdbomb.carrier.origin, attacker.origin);
                if (var_db36f135f40e7940 < 105625) {
                    attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                    attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
                    attacker incpersstat("defends", 1);
                    attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                    thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "defending");
                    var_aec2e5e01f424119 = 1;
                }
            }
        }
    }
    if (!var_aec2e5e01f424119) {
        namespace_fa795886dfc5f58a::bombzone_awardgenericbombzonemedals(attacker, victim);
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2246
// Size: 0x9e
function givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    otherteam = getotherteam(self.pers["team"])[0];
    level thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    level thread teamplayercardsplash("callout_lastenemyalive", self, otherteam);
    level notify("last_alive", self);
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(3, self.team, self getentitynumber());
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22eb
// Size: 0xaf
function ontimelimit() {
    sd_endgame(game["defenders"], game["end_reason"]["time_limit_reached"]);
    if (!isdefined(level.var_3d06de480d9ef9c4)) {
        namespace_b919c4be206d3c80::function_94c8f3722d550646();
        level.var_3d06de480d9ef9c4 = 1;
    }
    foreach (player in level.players) {
        if (isdefined(player.bombplantweapon)) {
            player _takeweapon(player.bombplantweapon);
            break;
        }
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23a1
// Size: 0xe6
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.bombtimer = dvarfloatvalue("bombtimer", 45, 1, 240);
    level.planttime = dvarfloatvalue("planttime", 5, 0, 20);
    level.defusetime = dvarfloatvalue("defusetime", 5, 0, 20);
    level.multibomb = dvarintvalue("multibomb", 0, 0, 1);
    level.silentplant = dvarintvalue("silentPlant", 0, 0, 1);
    level.resetprogress = dvarintvalue("resetProgress", 0, 0, 1);
    level.defenderscanseedroppedbomb = dvarintvalue("defendersCanSeeDroppedBomb", 0, 0, 1);
    level.defenderscanseeplantedbomb = dvarintvalue("defendersCanSeePlantedBomb", 0, 0, 1);
    level.assignbombzonechevrons = dvarintvalue("assignBombZoneChevrons", 0, 0, 1);
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x248e
// Size: 0x20d
function removebombzonec(bombzones) {
    var_256bbd69c5d59051 = [];
    var_1cff8a8af69c74d = getentarray("script_brushmodel", "classname");
    foreach (brushmodel in var_1cff8a8af69c74d) {
        if (isdefined(brushmodel.script_gameobjectname) && brushmodel.script_gameobjectname == "bombzone") {
            foreach (bombzone in bombzones) {
                if (distance(brushmodel.origin, bombzone.origin) < 100 && issubstr(tolower(bombzone.script_label), "c")) {
                    bombzone.relatedbrushmodel = brushmodel;
                    var_256bbd69c5d59051[var_256bbd69c5d59051.size] = bombzone;
                    break;
                }
            }
        }
    }
    foreach (var_21144c898265c718 in var_256bbd69c5d59051) {
        var_21144c898265c718.relatedbrushmodel delete();
        visuals = getentarray(var_21144c898265c718.target, "targetname");
        foreach (visual in visuals) {
            visual delete();
        }
        var_21144c898265c718 delete();
    }
    return array_removeundefined(bombzones);
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a3
// Size: 0xf0
function function_1ba24a5f29969bae() {
    if (isdefined(level.var_d27f667e6320d465)) {
        var_2544a7d11b569e17 = getstruct(level.var_d27f667e6320d465.var_b6c7ddacaf25d01, "script_noteworthy");
        var_2544a8d11b56a04a = getstruct(level.var_d27f667e6320d465.var_b6c7adacaf25668, "script_noteworthy");
    } else {
        var_2544a7d11b569e17 = getstruct("sd_bombzone_a", "script_noteworthy");
        var_2544a8d11b56a04a = getstruct("sd_bombzone_b", "script_noteworthy");
    }
    if (isdefined(var_2544a7d11b569e17) && isdefined(var_2544a8d11b56a04a)) {
        return [0:[0:drop_to_ground(var_2544a7d11b569e17.origin, 10, -100), 1:var_2544a7d11b569e17.angles], 1:[0:drop_to_ground(var_2544a8d11b56a04a.origin, 10, -100), 1:var_2544a8d11b56a04a.angles]];
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279a
// Size: 0x568
function bombs() {
    namespace_fa795886dfc5f58a::bombzone_setupbombcase("sd_bomb");
    triggers = getentarray("bombzone", "targetname");
    triggers = removebombzonec(triggers);
    level.var_826175089e4669d6 = 0;
    if (triggers.size == 0) {
        level.var_826175089e4669d6 = 1;
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
    var_a65297a455514e0 = undefined;
    if (!istrue(level.var_826175089e4669d6)) {
        var_a65297a455514e0 = function_1ba24a5f29969bae();
    }
    foreach (count, trigger in triggers) {
        if (isdefined(var_a65297a455514e0)) {
            trigger.origin = var_a65297a455514e0[count][0];
            trigger.angles = var_a65297a455514e0[count][1];
        }
        bombzone = namespace_fa795886dfc5f58a::setupobjective(trigger, 1, 1);
        bombzone.onbeginuse = &onbeginuse;
        bombzone.onenduse = &onenduse;
        bombzone.onuse = &onuseplantobject;
        if (isdefined(var_a65297a455514e0)) {
            foreach (visual in bombzone.visuals) {
                visual.origin = var_a65297a455514e0[count][0];
                visual.angles = var_a65297a455514e0[count][1];
            }
        }
        level.objectives[bombzone.objectivekey] = bombzone;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    if (getdvarint(@"hash_9cf963b64e1223e7", 0) == 1) {
        goto LOC_000003d5;
    }
    level.sdbomb namespace_19b4203b51d56488::requestid(1, 1, 2);
    level.sdbomb namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_bomb");
    if (level.defenderscanseedroppedbomb) {
        level.sdbomb namespace_19b4203b51d56488::setvisibleteam("any");
    } else {
        level.sdbomb namespace_19b4203b51d56488::setvisibleteam("friendly");
    LOC_000003d5:
    }
LOC_000003d5:
    level.sdbombmodel = level.sdbomb.visuals[0];
    level.sdbombmodel namespace_fa795886dfc5f58a::setteaminhuddatafromteamname(game["attackers"]);
    level.sdbombmodel setasgametypeobjective();
    if (getdvarint(@"hash_9cf963b64e1223e7") == 1) {
        goto LOC_00000481;
    }
    objective_setspecialobjectivedisplay(level.sdbomb.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(level.sdbomb.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(level.sdbomb.objidnum, 0);
LOC_00000481:
    if (getdvarint(@"hash_94706b5dc31f719b") != 0) {
        level.sdbomb namespace_19b4203b51d56488::function_316d9da870e12a03([0:level.sdbomb.visuals[0]], level.sdbomb.trigger, 1, 80, 0, &function_745c1786b3409d7a);
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        wait(0.5);
    }
    foreach (bombzone in level.objectives) {
        var_3c2389ba69e5822b = namespace_fa795886dfc5f58a::getreservedobjid(bombzone.objectivekey);
        bombzone namespace_19b4203b51d56488::requestid(1, 1, var_3c2389ba69e5822b);
        bombzone namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_target");
        bombzone namespace_19b4203b51d56488::setvisibleteam("any");
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d09
// Size: 0xbb
function onbeginuse(player) {
    namespace_fa795886dfc5f58a::bombzone_onbeginuse(player);
    if (!namespace_19b4203b51d56488::isfriendlyteam(player.pers["team"])) {
        if (level.multibomb) {
            if (self.objectivekey == "_a") {
                level.objectives["_b"] namespace_19b4203b51d56488::allowuse("none");
                level.objectives["_b"] namespace_19b4203b51d56488::setvisibleteam("friendly");
            } else {
                level.objectives["_a"] namespace_19b4203b51d56488::allowuse("none");
                level.objectives["_a"] namespace_19b4203b51d56488::setvisibleteam("friendly");
            }
        }
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2dcb
// Size: 0xd8
function onenduse(team, player, result) {
    namespace_fa795886dfc5f58a::bombzone_onenduse(team, player, result);
    if (isdefined(player) && !namespace_19b4203b51d56488::isfriendlyteam(player.pers["team"])) {
        if (level.multibomb && !result) {
            if (self.objectivekey == "_a") {
                level.objectives["_b"] namespace_19b4203b51d56488::allowuse("enemy");
                level.objectives["_b"] namespace_19b4203b51d56488::setvisibleteam("any");
            } else {
                level.objectives["_a"] namespace_19b4203b51d56488::allowuse("enemy");
                level.objectives["_a"] namespace_19b4203b51d56488::setvisibleteam("any");
            }
        }
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eaa
// Size: 0xad
function onuseplantobject(player) {
    if (!namespace_19b4203b51d56488::isfriendlyteam(player.pers["team"])) {
        foreach (zone in level.objectives) {
            if (zone == self) {
                continue;
            }
            zone namespace_19b4203b51d56488::disableobject();
        }
    }
    namespace_fa795886dfc5f58a::bombzone_onuseplantobject(player);
    logannouncement(player, undefined, "Bomb Planted", player.origin);
    thread namespace_3bde6869e44a2770::bombplanted_music();
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5e
// Size: 0x4e
function setspecialloadout() {
    if (isusingmatchrulesdata() && getmatchrulesdatawithteamandindex("defaultClasses", game["attackers"], 5, "class", "inUse")) {
        level.sd_loadout[game["attackers"]] = getmatchrulesspecialclass(game["attackers"], 5);
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb3
// Size: 0xc8
function onbombexploded(objectivetype, var_f6383793ba324ee5, player, team, extradata) {
    if (istrue(level.nukeinfo.incoming)) {
        return;
    }
    if (team == game["attackers"]) {
        setgameendtime(0);
        wait(3);
        logannouncement(undefined, undefined, "Target Destroyed", self.trigger.origin);
        sd_endgame(game["attackers"], game["end_reason"]["target_destroyed"]);
    } else {
        setgameendtime(0);
        wait(1.5);
        sd_endgame(game["defenders"], game["end_reason"]["bomb_defused"]);
    }
    namespace_b919c4be206d3c80::function_94c8f3722d550646();
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3082
// Size: 0x112
function updatematchstatushintonspawn() {
    if (level.bombplanted) {
        if (game["attackers"] == self.team) {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bomb_defend");
        } else {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bomb_defuse");
        }
    } else if (isdefined(level.sdbomb)) {
        if (isdefined(level.sdbomb.carrier)) {
            if (level.sdbomb.carrier.team == self.team) {
                if (level.sdbomb.carrier == self) {
                    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bomb_plant");
                } else {
                    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bomb_escort");
                }
            } else {
                namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bombsite_defend");
            }
        } else if (game["attackers"] == self.team) {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bomb_pickup");
        } else {
            namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("bombsite_defend");
        }
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("hide_match_hint");
    }
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x319b
// Size: 0x62
function function_aaa2901a47b8bea9(point) {
    if (isdefined(level.sdbomb)) {
        if (isdefined(point)) {
            if (ispointinsidecircle(point, level.sdbomb.curorigin, 40)) {
                return 0;
            }
        } else if (self istouching(level.sdbomb.trigger)) {
            return 0;
        }
    }
    return 1;
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3205
// Size: 0x14
function onmaprestart() {
    level.var_b68731a6dc31a0ce = undefined;
    namespace_b919c4be206d3c80::function_edba1ee7c2375a5();
}

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3220
// Size: 0x6c
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

// Namespace sd/namespace_d1cd9ef22348b7a9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3293
// Size: 0x19
function function_745c1786b3409d7a(player) {
    player setclientomnvar("ui_carrying_bomb", 0);
}

