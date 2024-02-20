// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\gametypes\arena.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_3bdadfff7554ceba;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\damage.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace xfire;

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec2
// Size: 0x3c9
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    updategametypedvars();
    level.ontimelimit = &ontimelimit;
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerkilled = &onplayerkilled;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerconnect = &onplayerconnect;
    level.ontimelimitot = &ontimelimitot;
    level.checkforlaststandwipe = &function_cf32b8de85ca585a;
    level.objectivebased = 1;
    level.overridetimelimitclock = 15;
    if (!getdvarint(@"hash_d398d397afae6d0", 0)) {
        level.allowlatecomers = 0;
    }
    game["dialog"]["gametype"] = "dx_mp_mcut_mode_t141_name";
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    } else if (getdvarint(@"hash_c00e244ea59d530e")) {
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    }
    game["dialog"]["boost"] = "iw9_mtdm_mode_uktl_bost";
    game["dialog"]["offense_obj"] = "iw9_mtdm_mode_uktl_bost";
    game["dialog"]["defense_obj"] = "iw9_mtdm_mode_uktl_bost";
    game["dialog"]["team_eliminated"] = "dx_mp_mcut_mode_t141_telm";
    level.allieshealth = 0;
    level.alliesmaxhealth = 0;
    level.axishealth = 0;
    level.axismaxhealth = 0;
    level.var_20cde17a79b3e90e = 0;
    level.var_9d074c5a0f4e7d84 = 0;
    setomnvar("ui_arena_allies_health", 0);
    setomnvar("ui_arena_axis_health", 0);
    setomnvar("ui_arena_team_three_health", 0);
    setomnvar("ui_arena_allies_health_max", 100);
    setomnvar("ui_arena_axis_health_max", 100);
    setomnvar("ui_arena_team_three_health_max", 100);
    level.testtdmanywhere = getdvarint(@"hash_157f06aff3c1f357", 0);
    level.tdmanywhere_dropheight = getdvarfloat(@"hash_c692d2a11dd6615", 1000);
    level.tdmanywhere_perpenoffset = getdvarfloat(@"hash_631c58033f43c2dc", 2048);
    level.tdmanywhere_distoffset = getdvarfloat(@"hash_f314048c87ae28aa", 4092);
    if (istrue(level.testtdmanywhere)) {
        namespace_5078ee98abb32db9::initparachutedvars();
    }
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    level thread function_c09a302b53efdfef();
    /#
        level.var_a1c387e9b8e35312 = &function_a1c387e9b8e35312;
    #/
    namespace_2c19af30dc7a566c::function_4a18dd73a966821e(3);
    namespace_2c19af30dc7a566c::function_6cce72ce8bb6af87([0:"allies", 1:"axis", 2:"team_three"]);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1292
// Size: 0x21
function onplayerconnect(player) {
    player thread onjoinedteam();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ba
// Size: 0x15
function onplayerdisconnect(player) {
    setteamhealthhud(1);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d6
// Size: 0x25
function onjoinedteam() {
    level endon("game_ended");
    for (;;) {
        waittill_any_2("joined_team", "joined_spectators");
        setteamhealthhud();
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1302
// Size: 0x92
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
    setdynamicdvar(@"hash_54b0839b770554b3", getmatchrulesdata("arenaData", "blastShieldMod"));
    setdynamicdvar(@"hash_928b4e51b473632c", getmatchrulesdata("arenaData", "blastShieldClamp"));
    setdynamicdvar(@"hash_9ad50234c5ffaf1d", getmatchrulesdata("arenaData", "winCondition"));
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x139b
// Size: 0x184
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    if (isdefined(level.initspawnsoverridefunc)) {
        [[ level.initspawnsoverridefunc ]]();
    } else {
        initspawns();
    }
    if (game["roundsPlayed"] == 0) {
        level thread namespace_47e715c4f9510479::setroundwinstreakarray();
    }
    setupwaypointicons();
    seticonnames();
    thread namespace_47e715c4f9510479::waittooverridegraceperiod();
    namespace_662734e7fa8a8b94::inittankspawns();
    if (getdvarint(@"hash_cd7a289c3a33ceda", 0) != 0) {
        thread monitorhotfoot();
    }
    level thread spawngameendflagzone(1);
    /#
        thread function_8469a5927d069db7();
        if (0) {
            function_bf2918399f1800b1();
        }
    #/
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1526
// Size: 0xba
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.overtimeFlag = dvarfloatvalue("overtimeFlag", 10, 0, 30);
    if (level.overtimeFlag > 0) {
        level.ontimelimitgraceperiod = level.overtimeFlag;
        level.currenttimelimitdelay = 0;
        level.canprocessot = 1;
    }
    level.wincondition = dvarintvalue("winCondition", 1, 0, 2);
    setomnvar("ui_wincondition", level.wincondition);
    level.objmodifier = dvarintvalue("objModifier", 0, 0, 4);
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 3, 0, 30);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e7
// Size: 0x27a
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    } else if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    if (istrue(level.testtdmanywhere)) {
        x = getdvarfloat(@"hash_b6294c84c04e377b", randomfloatrange(-4096, 4096));
        y = getdvarfloat(@"hash_b6294b84c04e3548", randomfloatrange(-4096, 4096));
        z = getdvarfloat(@"hash_b6294e84c04e3be1", randomfloatrange(0, 512));
        level.mapcenter = (x, y, z);
        tdmanywhere_debugshowlocs();
    } else {
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1868
// Size: 0x64
function function_a1c387e9b8e35312() {
    /#
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("auto_change");
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("roundsPlayed");
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("targetname");
        namespace_b2d5aa2baf2b5701::registerspawnset("auto_change", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("roundsPlayed", var_3a5288f40c8be099);
    #/
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18d3
// Size: 0x23f
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (!isdefined(level.var_63daaf90ccfeb639)) {
        level.var_63daaf90ccfeb639 = [];
    }
    if (!isdefined(level.var_63daaf90ccfeb639[spawnteam])) {
        level.var_63daaf90ccfeb639[spawnteam] = [];
    }
    var_cafc02fbf308d35b = level.teamnamelist;
    for (i = 0; i < game["roundsPlayed"]; i++) {
        var_cafc02fbf308d35b = array_add(var_cafc02fbf308d35b, var_cafc02fbf308d35b[0]);
        var_cafc02fbf308d35b = array_slice(var_cafc02fbf308d35b, 1, level.teamnamelist.size + 1);
    }
    var_e85bdf109da46fb9 = [];
    foreach (index, team in level.teamnamelist) {
        var_e85bdf109da46fb9[team] = var_cafc02fbf308d35b[index];
    }
    spawns = getspawnarray("mp_xfire_spawn_" + var_e85bdf109da46fb9[spawnteam] + "_start");
    foreach (spawner in spawns) {
        if (isdefined(level.mapname) && level.mapname == "mp_jup_karachi") {
            jumpiffalse(isdefined(spawner.classname) && spawner.classname == "mp_xfire_spawn_allies_start") LOC_000001e9;
            jumpiffalse(isdefined(spawner.origin)) LOC_000001e9;
            jumpiffalse(spawner.origin[0] == 288 && spawner.origin[1] == 2416) LOC_000001e9;
        } else {
        LOC_000001e9:
            if (isdefined(level.var_63daaf90ccfeb639[spawnteam][spawner.index])) {
                continue;
            }
            level.var_63daaf90ccfeb639[spawnteam][spawner.index] = spawner;
            return spawner;
        }
    }
    return random(spawns);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1a
// Size: 0x2f1
function spawngameendflagzone(var_90b3677e000c6c1b) {
    arenaflag = getentarray("flag_xfire", "targetname");
    if (arenaflag.size == 0 || !isdefined(arenaflag[arenaflag.size])) {
        /#
            assertmsg("^1No Arena Flag found in level!");
        #/
        return;
    }
    var_43ff7da364738b0a = randomint(arenaflag.size);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_locked", 0, "neutral", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_locked", 0, undefined);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_ot", 0, "neutral", "MP_INGAME_ONLY/OBJ_OTFLAGLOC_CAPS", "icon_waypoint_overtime", 0);
    level.arenaflag = arenaflag[var_43ff7da364738b0a];
    trigger = arenaflag[var_43ff7da364738b0a];
    if (isdefined(trigger.target)) {
        visuals[0] = getent(trigger.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = trigger.angles;
    }
    trigger.objectivekey = "_a";
    trigger.iconname = "_a";
    arenaflag = namespace_98b55913d2326ac8::setupobjective(trigger, "neutral", undefined, 1);
    arenaflag.iconname = "";
    arenaflag.onuse = &function_865ee3863054db0a;
    arenaflag.onbeginuse = &namespace_47e715c4f9510479::arenaflag_onusebegin;
    arenaflag.onenduse = &namespace_47e715c4f9510479::arenaflag_onuseend;
    arenaflag.onuseupdate = &namespace_47e715c4f9510479::arenaflag_onuseupdate;
    arenaflag.oncontested = &namespace_47e715c4f9510479::arenaflag_oncontested;
    arenaflag.onuncontested = &namespace_47e715c4f9510479::arenaflag_onuncontested;
    arenaflag.isarena = 1;
    arenaflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
    arenaflag.id = "domFlag";
    arenaflag.scriptable delete();
    arenaflag namespace_19b4203b51d56488::setcapturebehavior("persistent");
    arenaflag.ignorestomp = 1;
    level.objectives[arenaflag.objectivekey] = arenaflag;
    level.arenaflag = arenaflag;
    level thread function_439c040e29fb9b3d();
    if (istrue(var_90b3677e000c6c1b)) {
        wait(0.1);
        level.arenaflag namespace_19b4203b51d56488::requestid(1, 1, undefined, 0, 0);
        level.arenaflag.visibleteam = "any";
        level.arenaflag namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_locked");
        level.arenaflag namespace_19b4203b51d56488::enableobject();
        level.arenaflag namespace_19b4203b51d56488::allowuse("none");
        level.arenaflag.flagmodel show();
    } else {
        level.arenaflag namespace_19b4203b51d56488::requestid(1, 1, undefined, 0, 0);
        level.arenaflag namespace_47e715c4f9510479::disableotflag();
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e12
// Size: 0x2b
function function_439c040e29fb9b3d() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.arenaflag thread namespace_19b4203b51d56488::function_d36dcacac1708708(getwatcheddvar("timeLimit"));
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e44
// Size: 0xa0
function function_59176f33753f0b5b() {
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    level.arenaflag.iconname = "_a";
    level thread namespace_47e715c4f9510479::shouldplayerovertimedialog();
    level thread namespace_47e715c4f9510479::showflagoutline();
    level.arenaflag namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    level.arenaflag namespace_19b4203b51d56488::allowuse("enemy");
    level notify("ot_enabled");
    level.arenaflag.flagmodel playsound("jup_shared_zone_spawned");
    namespace_3bde6869e44a2770::function_6c71c8bc6495a0df("generic");
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1eeb
// Size: 0x1ae
function function_865ee3863054db0a(var_22282e7d48ca3400) {
    level.canprocessot = 1;
    team = var_22282e7d48ca3400.pers["team"];
    oldteam = namespace_19b4203b51d56488::getownerteam();
    var_d44b391a5d0dfe13 = getotherteam(team)[0];
    var_d44b3a1a5d0e0046 = getotherteam(team)[1];
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    self.capturetime = gettime();
    self.neutralized = 0;
    namespace_944ddf7b8df1b0e3::statusdialog("lost" + self.objectivekey, var_d44b391a5d0dfe13);
    namespace_944ddf7b8df1b0e3::statusdialog("lost" + self.objectivekey, var_d44b3a1a5d0e0046);
    namespace_944ddf7b8df1b0e3::statusdialog("secured" + self.objectivekey, team);
    thread printandsoundoneveryone(team, var_d44b391a5d0dfe13, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    thread printandsoundoneveryone(team, var_d44b3a1a5d0e0046, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    namespace_98b55913d2326ac8::dompoint_setcaptured(team, var_22282e7d48ca3400);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, var_22282e7d48ca3400, team, oldteam, self);
        }
        self.firstcapture = 0;
    }
    game["dialog"]["round_success"] = "dx_mp_gunf_game_t141_gfsd";
    game["dialog"]["round_failure"] = "dx_mp_gunf_game_t141_gflt";
    level thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"]["arena_otflag_completed"], game["end_reason"]["arena_otflag_failed"]);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20a0
// Size: 0x84
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    thread onspawnfinished();
    if (getdvarint(@"hash_d398d397afae6d0", 0) && game["roundsPlayed"] == 0) {
        level thread function_d2e1978421f560a8(self.pers["team"]);
    }
    if (!istrue(level.testtdmanywhere)) {
        return;
    }
    self setplayerangles(vectortoangles(level.mapcenter - self.origin));
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x212b
// Size: 0xc1
function onspawnfinished() {
    self endon("death_or_disconnect");
    thread damagewatcher();
    thread namespace_47e715c4f9510479::modifyblastshieldperk();
    wait(0.1);
    self.hasarenaspawned = 1;
    wait(0.15);
    if (!namespace_4b0406965e556711::gameflag("prematch_done") && game["roundsPlayed"] == 0) {
        if (level.overtimeFlag > 0 && isdefined(level.matchcountdowntime) && level.matchcountdowntime > 5) {
            if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                namespace_944ddf7b8df1b0e3::leaderdialogonplayer("obj_indepth", "introboost");
            }
        }
        level waittill_any_2("prematch_done", "removeArenaOutlines");
    }
    self setclientomnvar("ui_player_notify_loadout", gettime());
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21f3
// Size: 0x390
function setteamhealthhud(var_51c0c03bb238c17) {
    var_586dc9dc0cf668ad = getdvarint(@"hash_b1d561f9a9241e09", 100);
    alliesplayers = getteamdata("allies", "teamCount");
    if (alliesplayers) {
        level.alliesmaxhealth = getteamdata("allies", "teamCount") * var_586dc9dc0cf668ad;
        setomnvar("ui_arena_allies_health_max", level.alliesmaxhealth);
        if (!istrue(var_51c0c03bb238c17) && !isreallyalive(self) && namespace_99ac021a7547cae3::mayspawn()) {
            self waittill("spawned_player");
        }
        allieshealth = 0;
        foreach (player in getteamdata("allies", "players")) {
            allieshealth = allieshealth + player.health;
        }
        level.allieshealth = allieshealth;
        if (level.allieshealth < 0) {
            level.allieshealth = 0;
        }
        setomnvar("ui_arena_allies_health", level.allieshealth);
    } else {
        setomnvar("ui_arena_allies_health", 0);
    }
    axisplayers = getteamdata("axis", "teamCount");
    if (axisplayers) {
        level.axismaxhealth = getteamdata("axis", "teamCount") * var_586dc9dc0cf668ad;
        setomnvar("ui_arena_axis_health_max", level.axismaxhealth);
        if (!istrue(var_51c0c03bb238c17) && !isreallyalive(self) && namespace_99ac021a7547cae3::mayspawn()) {
            self waittill("spawned_player");
        }
        axishealth = 0;
        foreach (player in getteamdata("axis", "players")) {
            axishealth = axishealth + player.health;
        }
        level.axishealth = axishealth;
        if (level.axishealth < 0) {
            level.axishealth = 0;
        }
        setomnvar("ui_arena_axis_health", level.axishealth);
    } else {
        setomnvar("ui_arena_axis_health", 0);
    }
    var_8d5953d1ee8e59fa = getteamdata("team_three", "teamCount");
    if (var_8d5953d1ee8e59fa) {
        level.var_9d074c5a0f4e7d84 = getteamdata("team_three", "teamCount") * var_586dc9dc0cf668ad;
        setomnvar("ui_arena_team_three_health_max", level.var_9d074c5a0f4e7d84);
        if (!istrue(var_51c0c03bb238c17) && !isreallyalive(self) && namespace_99ac021a7547cae3::mayspawn()) {
            self waittill("spawned_player");
        }
        var_20cde17a79b3e90e = 0;
        foreach (player in getteamdata("team_three", "players")) {
            var_20cde17a79b3e90e = var_20cde17a79b3e90e + player.health;
        }
        level.var_20cde17a79b3e90e = var_20cde17a79b3e90e;
        if (level.var_20cde17a79b3e90e < 0) {
            level.var_20cde17a79b3e90e = 0;
        }
        setomnvar("ui_arena_team_three_health", level.var_20cde17a79b3e90e);
    } else {
        setomnvar("ui_arena_team_three_health", 0);
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258a
// Size: 0x292
function damagewatcher() {
    self notify("startDamageWatcher");
    self endon("startDamageWatcher");
    level endon("game_ended");
    self endon("disconnect");
    self.totaldamagetaken = 0;
    while (1) {
        waittill_any_7("damage", "force_regeneration", "removeAdrenaline", "healed", "naturalHealthRegen", "vampirism", "spawned_player");
        if (self.team == "allies") {
            allieshealth = 0;
            foreach (player in getteamdata("allies", "players")) {
                allieshealth = allieshealth + player.health;
            }
            level.allieshealth = allieshealth;
            if (level.allieshealth < 0) {
                level.allieshealth = 0;
            }
            setomnvar("ui_arena_allies_health", level.allieshealth);
        } else if (self.team == "axis") {
            axishealth = 0;
            foreach (player in getteamdata("axis", "players")) {
                axishealth = axishealth + player.health;
            }
            level.axishealth = axishealth;
            if (level.axishealth < 0) {
                level.axishealth = 0;
            }
            setomnvar("ui_arena_axis_health", level.axishealth);
        } else if (self.team == "team_three") {
            var_20cde17a79b3e90e = 0;
            foreach (player in getteamdata("team_three", "players")) {
                var_20cde17a79b3e90e = var_20cde17a79b3e90e + player.health;
            }
            level.var_20cde17a79b3e90e = var_20cde17a79b3e90e;
            if (level.var_20cde17a79b3e90e < 0) {
                level.var_20cde17a79b3e90e = 0;
            }
            setomnvar("ui_arena_team_three_health", level.var_20cde17a79b3e90e);
        }
        if (istrue(self.iscapturing)) {
            var_d3ae4cb68808aaa8 = undefined;
        }
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2823
// Size: 0xac
function function_d2e1978421f560a8(playerteam) {
    if (istrue(level.var_bdeb0ef07db14d92)) {
        return;
    }
    level.var_bdeb0ef07db14d92 = 1;
    foreach (team in [0:"allies", 1:"axis", 2:"team_three"]) {
        count = 3;
        if (is_equal(team, playerteam)) {
            count = 2;
        }
        level thread namespace_e4a5fcd525f0b19b::spawn_bots(count, team);
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d6
// Size: 0x14d
function function_c09a302b53efdfef() {
    while (!isdefined(level.players)) {
        waitframe();
    }
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        foreach (player in level.players) {
            foreach (other in level.players) {
                if (is_equal(player.pers["team"], other.pers["team"])) {
                    continue;
                }
                player hudoutlineenableforclient(other, "outline_nodepth_orange");
            }
        }
        wait(0.5);
    }
    foreach (player in level.players) {
        player hudoutlinedisable();
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2a
// Size: 0x17c
function function_d73615f1fc12f3db(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("secured" + var_965ef52941de8769.index + "healed" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("tie" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "waypoint_ctf_kill" + "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS" + level.var_2dc7108159dc1da3 + "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("icon_waypoint_dom_a" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "waypoint_ctf_kill" + "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS" + level.var_2dc7108159dc1da3 + "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2bad
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf5
// Size: 0x188
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid) {
    var_809680a1cc688678 = namespace_54d20dd0dd79277f::getteamdata(attacker.pers["team"], "players");
    var_8fb69067affa2e25 = namespace_54d20dd0dd79277f::getteamdata(self.pers["team"], "players");
    foreach (player in var_8fb69067affa2e25) {
        if (is_equal(self, player)) {
            continue;
        }
        if (isreallyalive(player) && !istrue(player.inlaststand)) {
            return;
        }
    }
    thread checkallowspectating(self.pers["team"]);
    if (istrue(level.var_2f9531754ad48a56)) {
        return;
    }
    level.var_2f9531754ad48a56 = 1;
    foreach (player in var_809680a1cc688678) {
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("team_eliminated");
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d84
// Size: 0x2b
function checkallowspectating(var_4c25fef43734cdd0) {
    level.spectateoverride[var_4c25fef43734cdd0].allowenemyspectate = 1;
    namespace_5aeecefc462876::updatespectatesettings();
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2db6
// Size: 0x459
function function_cf32b8de85ca585a(victim, var_9c14ae6e04bbd667) {
    if (isdefined(level.var_f44d8c2d0a8691a8)) {
        return 0;
    }
    level.var_f44d8c2d0a8691a8 = 1;
    var_f22fb09a173dcc1c = [];
    var_c9fa03a7d2163c24 = 0;
    var_6a9853a7ef309b8f = [];
    var_fa2dfb970d051f16 = [];
    foreach (entry in level.teamnamelist) {
        var_b1fd2c57a16c6e04 = 1;
        var_f22fb09a173dcc1c = [];
        var_7b618684adbe33f6 = 0;
        foreach (player in level.teamdata[entry]["alivePlayers"]) {
            if (istrue(var_9c14ae6e04bbd667) && isdefined(victim) && victim == player) {
                var_7b618684adbe33f6 = 1;
            } else {
                isinlaststand = istrue(player.inlaststand) || isdefined(victim) && victim == player;
                if (isinlaststand) {
                    var_f22fb09a173dcc1c[var_f22fb09a173dcc1c.size] = player;
                } else {
                    var_b1fd2c57a16c6e04 = 0;
                    break;
                }
            }
        }
        if (var_b1fd2c57a16c6e04 && (var_f22fb09a173dcc1c.size > 0 || istrue(var_9c14ae6e04bbd667) && var_7b618684adbe33f6)) {
            attackers = [];
            foreach (var_e3d55abd84ad4ca9 in var_f22fb09a173dcc1c) {
                if (isdefined(var_e3d55abd84ad4ca9.laststandattacker) && !array_contains(attackers, var_e3d55abd84ad4ca9.laststandattacker)) {
                    var_e3d55abd84ad4ca9.laststandattacker.wipeweapon = var_e3d55abd84ad4ca9.laststandweaponobj;
                    attackers[attackers.size] = var_e3d55abd84ad4ca9.laststandattacker;
                }
                if (isdefined(victim) && victim == var_e3d55abd84ad4ca9) {
                    var_c9fa03a7d2163c24 = 1;
                }
                var_e3d55abd84ad4ca9 notify("squad_wipe_death");
                var_e3d55abd84ad4ca9.squadwiped = 1;
                var_e3d55abd84ad4ca9 namespace_a12dc1d0c8a64946::_suicide(0);
            }
            if (istrue(var_9c14ae6e04bbd667) && isdefined(victim) && isdefined(victim.laststandattacker) && !array_contains(attackers, victim.laststandattacker)) {
                attackers[attackers.size] = victim.laststandattacker;
            }
            foreach (attacker in attackers) {
                if (isdefined(attacker.team) && !isdefined(var_fa2dfb970d051f16[attacker.team])) {
                    var_fa2dfb970d051f16[attacker.team] = 1;
                    var_ffcddbab91473037 = level.teamdata[attacker.team]["alivePlayers"];
                    foreach (var_78d4262a23453d9e in var_ffcddbab91473037) {
                        var_78d4262a23453d9e thread namespace_391de535501b0143::killeventtextpopup(#"team_wiped", 0);
                        var_78d4262a23453d9e thread namespace_48a08c5037514e04::doScoreEvent(#"team_wiped", var_78d4262a23453d9e.wipeweapon);
                    }
                    wipeweapon = self.laststandweaponobj;
                    if (!isdefined(wipeweapon)) {
                        if (isdefined(victim) && isdefined(victim.laststandattacker)) {
                            wipeweapon = victim.laststandattacker.currentweapon;
                        } else {
                            wipeweapon = attacker.currentweapon;
                        }
                    }
                }
                attacker.wipeweapon = undefined;
                if (!isdefined(var_6a9853a7ef309b8f[attacker.team]) && !namespace_3e725f3cc58bddd3::function_80ade967129c9845()) {
                }
            }
            namespace_8361bad7391de074::function_63fedb7f004da23b(attackers);
        }
    }
    level.var_f44d8c2d0a8691a8 = undefined;
    return var_c9fa03a7d2163c24;
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3217
// Size: 0xdd
function ontimelimit() {
    if (level.gameended) {
        return;
    }
    updatetournamentroundtime(namespace_d576b6dc7cef9c62::gettimeremaining(), 3);
    if (function_2eda32f1d16ded2c()) {
        if (level.var_59a1f917fb3131a6 != "neutral") {
            level thread namespace_d576b6dc7cef9c62::endgame(level.var_59a1f917fb3131a6, game["end_reason"]["ko_flag_win"], game["end_reason"]["ko_flag_loss"]);
        } else if (level.wincondition == 1) {
            checkliveswinner();
        } else if (level.wincondition == 2) {
            checkhealthwinner();
        } else {
            checkhealthwinner();
        }
    } else if (level.wincondition == 1) {
        checkliveswinner();
    } else if (level.wincondition == 2) {
        checkhealthwinner();
    } else {
        checkhealthwinner();
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32fb
// Size: 0x1c4
function checkhealthwinner() {
    winningteam = getwinningteam();
    if (isdefined(winningteam)) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame(winningteam, game["end_reason"]["arena_time_health_win"], game["end_reason"]["arena_time_health_loss"]);
    } else if (matchmakinggame()) {
        if (isintournament()) {
            game["canScoreOnTie"] = 1;
            if (game["finalRound"] == 1) {
                game["canScoreOnTie"] = 0;
                if (!isdefined(game["roundsTied"])) {
                    game["roundsTied"] = 1;
                } else {
                    game["roundsTied"]++;
                }
                if (game["roundsTied"] >= 2) {
                    var_d1c52bd1768483b2 = namespace_d576b6dc7cef9c62::getbetterteam();
                    thread namespace_d576b6dc7cef9c62::endgame(var_d1c52bd1768483b2, game["end_reason"]["arena_tournament_tie_win"], game["end_reason"]["arena_tournament_tie_loss"]);
                } else {
                    thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
                }
            } else {
                thread arena_endgame("tie", game["end_reason"]["cyber_tie"]);
            }
        } else {
            if (!isdefined(game["roundsTied"])) {
                game["roundsTied"] = 1;
            } else {
                game["roundsTied"]++;
            }
            game["canScoreOnTie"] = game["roundsTied"] >= 2;
            if (game["canScoreOnTie"]) {
                thread arena_endgame("tie", game["end_reason"]["cyber_tie"]);
            } else {
                thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
            }
        }
    } else {
        thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c6
// Size: 0x4f
function getwinningteam() {
    teams = level.teamnamelist;
    teams = array_sort_with_func(teams, &function_857670a0af36d589);
    var_2ee2c5f98c074b1f = function_6fcd898faf41205d();
    if (is_equal(var_2ee2c5f98c074b1f[teams[0]], var_2ee2c5f98c074b1f[teams[1]])) {
        return undefined;
    }
    return teams[0];
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x351d
// Size: 0x2c
function function_857670a0af36d589(left, right) {
    var_2ee2c5f98c074b1f = function_6fcd898faf41205d();
    return var_2ee2c5f98c074b1f[left] >= var_2ee2c5f98c074b1f[right];
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3551
// Size: 0x43
function function_6fcd898faf41205d() {
    var_2ee2c5f98c074b1f = [];
    var_2ee2c5f98c074b1f["axis"] = level.axishealth;
    var_2ee2c5f98c074b1f["allies"] = level.allieshealth;
    var_2ee2c5f98c074b1f["team_three"] = level.var_20cde17a79b3e90e;
    return var_2ee2c5f98c074b1f;
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x359c
// Size: 0x1f4
function arena_endgame(winningteam, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b) {
    if (winningteam != "tie") {
        game["roundsTied"] = 0;
        game["previousWinningTeam"] = winningteam;
        foreach (entry in level.teamnamelist) {
            if (entry == winningteam) {
                game["roundWinStreak"][winningteam]++;
            } else {
                game["roundWinStreak"][entry] = 0;
            }
        }
        if (!iswinbytworulegametype()) {
            switch (game["roundWinStreak"][winningteam]) {
            case 2:
                game["dialog"]["round_success"] = "round_win_streak_2";
                break;
            case 3:
                game["dialog"]["round_success"] = "round_win_streak_3";
                break;
            case 4:
                game["dialog"]["round_success"] = "round_win_streak_4";
                break;
            case 5:
                roundswon = getroundswon(winningteam);
                winlimit = getwatcheddvar("winlimit");
                if (winlimit == 6 && roundswon != winlimit - 1) {
                    game["dialog"]["round_success"] = "round_win_streak_5";
                }
                break;
            default:
                break;
            }
        }
        if (game["finalRound"] == 1) {
            if (game["roundWinStreak"][winningteam] > 3) {
                game["dialog"]["mission_success"] = "gamestate_win_comeback";
            }
        }
    } else {
        game["previousWinningTeam"] = "";
    }
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b);
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3797
// Size: 0xc
function ontimelimitot() {
    level thread function_59176f33753f0b5b();
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37aa
// Size: 0xe8
function function_8469a5927d069db7() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_8469a5927d069db7();
    #/
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3899
// Size: 0x1f9
function function_bf2918399f1800b1() {
    /#
        wait(5);
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
    #/
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a99
// Size: 0x19b
function tdmanywhere_debugshowlocs() {
    thread namespace_d028276791d9cff6::drawsphere(level.mapcenter, 128, 100, (0, 1, 0));
    if (!isdefined(level.tdmanywherefrontline)) {
        waitframe();
    }
    var_cc015915d647fbdf = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
    var_c1d9d45c8845eb82 = level.tdmanywherefrontline.anchorrt * level.tdmanywhere_perpenoffset;
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter + var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter - var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c3b
// Size: 0x419
function monitorhotfoot() {
    level endon("game_ended");
    level.outlinedplayers = [];
    level.hotfootabsloops = 0;
    timepassed = 0;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        foreach (player in level.players) {
            if (!isdefined(player.hotfootlastposition)) {
                player.hotfootdisttraveledsq = 0;
                player.hotfootlastposition = player.origin;
                player.abshotfootlastposition = player.origin;
            }
            player.hotfootdisttraveledsq = player.hotfootdisttraveledsq + distancesquared(player.hotfootlastposition, player.origin);
            player.hotfootlastposition = player.origin;
        }
        timepassed = timepassed + level.framedurationseconds;
        if (timepassed > 3) {
            if (level.hotfootabsloops >= 2) {
                level.hotfootabsloops = 0;
                foreach (player in level.players) {
                    if (!isdefined(player.abshotfootlastposition)) {
                        player.abshotfootlastposition = player.origin;
                    }
                    player.forceabshotfoot = distancesquared(player.abshotfootlastposition, player.origin) < 4225;
                    player.abshotfootlastposition = player.origin;
                }
            }
            foreach (player in level.players) {
                entnum = player getentitynumber();
                var_ac6ca28a64718193 = player.pers["team"];
                if (var_ac6ca28a64718193 == "allies") {
                    enemyteam = "axis";
                } else {
                    enemyteam = "allies";
                }
                if (isalive(player) && (istrue(player.forceabshotfoot) || player.hotfootdisttraveledsq < 4225 && !istrue(player.hotfootreset))) {
                    /#
                        if (istrue(player.forceabshotfoot)) {
                            player iprintlnbold("<unknown string>");
                        } else {
                            player iprintlnbold("<unknown string>");
                        }
                    #/
                    player.forceabshotfoot = 0;
                    if (!isdefined(level.outlinedplayers[entnum])) {
                        level.outlinedplayers[entnum] = player;
                        player.outlineidfriend = outlineenableforteam(player, var_ac6ca28a64718193, "outline_nodepth_orange", "level_script");
                        player.outlineidenemy = outlineenableforteam(player, enemyteam, "outline_nodepth_red", "level_script");
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_nodepth_orange", 0);
                    }
                } else {
                    if (isalive(player)) {
                        player.hotfootreset = 0;
                    }
                    player.forceabshotfoot = 0;
                    if (isdefined(level.outlinedplayers[entnum])) {
                        outlinedisable(player.outlineidfriend, player);
                        outlinedisable(player.outlineidenemy, player);
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
                        player.outlineidfriend = undefined;
                        player.outlineidenemy = undefined;
                        level.outlinedplayers[entnum] = undefined;
                    }
                }
                player.hotfootdisttraveledsq = 0;
            }
            timepassed = 0;
        }
        level.hotfootabsloops++;
        waitframe();
    }
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x405b
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    var_f9c7aae8c6acd600 = axisscore - alliesscore;
    return var_f9c7aae8c6acd600 < 10;
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40b2
// Size: 0x11b
function seticonnames() {
    level.iconcaptureendzone = "waypoint_capture_endzone";
    level.icondefendendzone = "waypoint_defend_endzone";
    level.iconcontestendzone = "waypoint_contesting_endzone";
    level.icontakingendzone = "waypoint_taking_endzone";
    level.iconlosingendzone = "waypoint_losing_endzone";
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.iconcontested = "waypoint_contested";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
    level.icondefending = "waypoint_defending";
    level.iconescort = "waypoint_escort_flag";
    level.iconkill = "waypoint_ctf_kill";
    level.iconcaptureflag = "waypoint_take_flag";
    level.icondefendflag = "waypoint_defend_flag";
    level.iconreturnflag = "waypoint_recover_flag";
    level.mlgiconemptyflag = "waypoint_mlg_empty_flag";
    level.mlgiconfullflag = "waypoint_mlg_full_flag";
    level.icontarget = "waypoint_target";
}

// Namespace xfire/namespace_3464652a13bd7c86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41d4
// Size: 0x337
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking_endzone", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing_endzone", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contesting_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_endzone", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_endzone", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_dom_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defending_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_blocking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_blocked_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_captureneutral_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested_a", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dom_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_ot_a", 1, "neutral", "MP_INGAME_ONLY/OBJ_OTFLAGLOC_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_misc_dog_tag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_misc_dog_tag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_ctf_kill", 2, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_recover_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_RECOVER_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_escort_flag", 2, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_take_flag", 0, "neutral", "MP_INGAME_ONLY/OBJ_TAKE_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_empty_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_empty", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_full_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_full", 0);
}

