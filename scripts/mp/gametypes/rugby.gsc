// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\spectating.gsc;

#namespace rugby;

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe58
// Size: 0x2f3
function main() {
    var_584994fab4a8712b = spawnstruct();
    level.rugby = var_584994fab4a8712b;
    var_584994fab4a8712b.endzones = [];
    var_584994fab4a8712b.endzones["allies"] = [];
    var_584994fab4a8712b.endzones["axis"] = [];
    var_584994fab4a8712b.juggcratesetups = [];
    var_584994fab4a8712b.goals = [];
    var_584994fab4a8712b.activejuggcrates = [];
    var_584994fab4a8712b.activejuggernauts = [];
    var_584994fab4a8712b.lastjuggpositions = [];
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    initrules();
    level.teambased = 1;
    level.objectivebased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerkilled = &onplayerkilled;
    level.ontimelimit = &ontimelimit;
    level.onplayerdamaged = &onplayerdamaged;
    level.modeonteamchangedeath = &modeonteamchangedeath;
    level.onplayerconnect = &onplayerconnect;
    level.ontimelimitot = &ontimelimitot;
    level.var_5fec67fa7f314c8a = &function_75d33aa666ba0a2e;
    game["canScoreOnTie"] = 1;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_rgby_mode_uktl_rgt1";
    } else {
        game["dialog"]["gametype"] = "gametype_onslaught";
    }
    game["dialog"]["boost"] = "boost_rugby";
    if (!isdefined(game["roundsPlayed"])) {
        var_126fe93c04fe16df = "boost_rugby";
    } else {
        var_126fe93c04fe16df = "boost_rugby_short";
    }
    game["dialog"]["offense_obj"] = var_126fe93c04fe16df;
    game["dialog"]["defense_obj"] = var_126fe93c04fe16df;
    game["dialog"]["rugby_enemy_close_goal"] = "rugby_enemy_close_goal";
    game["dialog"]["rugby_friendly_close_goal"] = "rugby_friendly_close_goal";
    game["dialog"]["rugby_lost_jugg"] = "rugby_lost_jugg";
    game["dialog"]["rugby_secured_jugg"] = "rugby_secured_jugg";
    game["dialog"]["rugby_securing_jugg"] = "rugby_securing_jugg";
    game["dialog"]["rugby_capture_jugg"] = "objective_new";
    game["dialog"]["rugby_new_jugg"] = "tjugg_new_player";
    game["dialog"]["rugby_team_jugg_nag"] = "tjugg_vip";
    game["dialog"]["rugby_order_attack"] = "order_attack";
    game["dialog"]["rugby_order_fallback"] = "order_fallback";
    game["dialog"]["rugby_round_lose"] = "overrun_enemy";
    game["dialog"]["rugby_round_win"] = "overrun_friendly";
    level._effect["rugby_score_explosion"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1152
// Size: 0xbe
function initrules() {
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 1, 0, 1);
        registertimelimitdvar(getgametype(), 240);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 3);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.ontimelimitgraceperiod = function_d973247bb17fe16();
    level.currenttimelimitdelay = 0;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1217
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1228
// Size: 0x106
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    jugghealth = getmatchrulesdata("rugbyData", "juggHealth");
    setdynamicdvar(@"hash_916482a23f7db002", jugghealth);
    juggspeed = getmatchrulesdata("rugbyData", "juggSpeed");
    setdynamicdvar(@"hash_fca821906f4a663f", juggspeed);
    juggteamspeed = getmatchrulesdata("rugbyData", "juggTeamSpeed");
    setdynamicdvar(@"hash_64d4d28dc063bff0", juggteamspeed);
    juggtimeout = getmatchrulesdata("rugbyData", "juggTimeout");
    setdynamicdvar(@"hash_364db51c6de274cf", juggtimeout);
    helpermax = getmatchrulesdata("rugbyData", "helperMax");
    setdynamicdvar(@"hash_f3f419ef3e285de3", helpermax);
    juggcapturetime = getmatchrulesdata("rugbyData", "juggCaptureTime");
    setdynamicdvar(@"hash_f96f8ff371da9f0f", juggcapturetime);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1335
// Size: 0x11
function getjuggmaxhealth() {
    return getdvarint(@"hash_916482a23f7db002");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x134e
// Size: 0x70
function getjuggspeedscalar(var_16661ce060a7da4d) {
    var_76b81ed8d4161bbc = -0.3 + 0.1 * getdvarfloat(@"hash_fca821906f4a663f");
    var_16661ce060a7da4d = int(min(var_16661ce060a7da4d, getdvarint(@"hash_f3f419ef3e285de3")));
    var_cae04f4ff3aa680c = 0.08 * getdvarfloat(@"hash_64d4d28dc063bff0");
    return var_76b81ed8d4161bbc + var_16661ce060a7da4d * var_cae04f4ff3aa680c;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c6
// Size: 0x11
function getjuggtimeout() {
    return getdvarfloat(@"hash_364db51c6de274cf");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13df
// Size: 0x11
function function_cca61180d8fdf0ea() {
    return getdvarfloat(@"hash_f96f8ff371da9f0f");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f8
// Size: 0x13
function function_d973247bb17fe16() {
    return getdvarfloat(@"hash_d2716123812605f", 45);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1413
// Size: 0xa8
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "MP_MODE_RUGBY/INGAME_OBJECTIVE");
    }
    setupwaypointicons();
    function_d6e8f4ec9a310d75();
    thread initrugbyents();
    thread setupinitialstate();
    initspawns();
    initjugg();
    level thread function_e2e13253ff7a00b1();
    /#
        thread function_a9f58f4a75680c3a();
    #/
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14c2
// Size: 0x2a
function function_e2e13253ff7a00b1() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(5);
    level thread namespace_44abc05161e2e2cb::notifyteam("jugg_capture", "jugg_capture", "allies");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f3
// Size: 0x44
function initrugbyents() {
    level.var_a4619c3c1ce4c58 = array_combine(level.outofboundstriggers, level.minetriggers, level.hurttriggers, level.radtriggers);
    initendzoneents();
    initjuggcratesetupents();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153e
// Size: 0xb1
function initendzoneents() {
    var_584994fab4a8712b = level.rugby;
    endzones = getstructarray("rugby_endzone", "targetname");
    foreach (var_54b003ce5d016238 in endzones) {
        initendzoneent(var_54b003ce5d016238);
        var_584994fab4a8712b.endzones[var_54b003ce5d016238.team][var_584994fab4a8712b.endzones[var_54b003ce5d016238.team].size] = var_54b003ce5d016238;
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15f6
// Size: 0x246
function initendzoneent(var_54b003ce5d016238) {
    var_f19941e08f779517 = getentarray(var_54b003ce5d016238.target, "targetname");
    /#
        assertex(isdefined(var_f19941e08f779517) && var_f19941e08f779517.size > 0, "Rugby Endzone at " + var_54b003ce5d016238.origin + " does not point to any trigger_multiple_mp_rugby_endzone triggers");
    #/
    foreach (ent in var_f19941e08f779517) {
        if (ent.classname == "trigger_multiple_mp_rugby_endzone") {
            var_54b003ce5d016238.trigger = ent;
        }
        if (isdefined(ent.script_noteworthy) && getsubstr(ent.script_noteworthy, 0, 3) == "fx_") {
            ent delete();
        }
    }
    /#
        assertex(isdefined(var_54b003ce5d016238.trigger), "Rugby Endzone at " + var_54b003ce5d016238.origin + " is not targeting a trigger_multiple_mp_rugby_endzone");
    #/
    function_bede361fc24cbfe1(var_54b003ce5d016238);
    if (var_54b003ce5d016238.spawnflags & 1) {
        var_54b003ce5d016238.team = "allies";
        var_54b003ce5d016238.trigger.objectivekey = "allies";
    } else if (var_54b003ce5d016238.spawnflags & 2) {
        var_54b003ce5d016238.team = "axis";
        var_54b003ce5d016238.trigger.objectivekey = "axis";
    } else {
        var_54b003ce5d016238.team = "allies";
        var_54b003ce5d016238.trigger.objectivekey = "allies";
        /#
            assertmsg("Rugby Endzone at " + var_54b003ce5d016238.origin + " is marked as neither Allies nor Axis");
        #/
    }
    foreach (ent in var_f19941e08f779517) {
        if (!isdefined(var_54b003ce5d016238.chevrons)) {
            level thread function_7c63d60ba6168aea(var_54b003ce5d016238);
        }
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1843
// Size: 0xc9
function function_bede361fc24cbfe1(var_54b003ce5d016238) {
    if (level.mapname == "mp_crash2") {
        if (distance2d(var_54b003ce5d016238.origin, (312, -1552, 216)) < 10) {
            var_54b003ce5d016238.spawnflags = 1;
        }
    } else if (level.mapname == "mp_scrapyard") {
        if (distance2d(var_54b003ce5d016238.origin, (-25223.3, -12439.2, 36.5)) < 10) {
            var_54b003ce5d016238.spawnflags = 2;
        } else if (distance2d(var_54b003ce5d016238.origin, (-26150.7, -8967.81, 144)) < 10) {
            var_54b003ce5d016238.spawnflags = 1;
        }
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1913
// Size: 0xa4
function initjuggcratesetupents() {
    var_584994fab4a8712b = level.rugby;
    juggcratesetups = getstructarray("rugby_jugg_crate", "targetname");
    foreach (var_115f6563192f74ea in juggcratesetups) {
        var_115f6563192f74ea = function_10f430e91c6c8be3(var_115f6563192f74ea);
        var_584994fab4a8712b.juggcratesetups[var_584994fab4a8712b.juggcratesetups.size] = var_115f6563192f74ea;
    }
    level.rugby = var_584994fab4a8712b;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19be
// Size: 0x78
function function_10f430e91c6c8be3(var_115f6563192f74ea) {
    switch (level.mapname) {
    case #"hash_d39c51733bbe5712":
        if (distance(var_115f6563192f74ea.origin, (3113.65, -1118.5, 378.5)) < 10) {
            var_115f6563192f74ea.origin = (2751, -1028, 376.5);
        }
        break;
    default:
        break;
    }
    return var_115f6563192f74ea;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3e
// Size: 0xa9
function initoverheadcameras() {
    level.spectatorcameras = [];
    level.spectatorcameras[0]["allies"] = spawnstruct();
    level.spectatorcameras[0]["axis"] = spawnstruct();
    namespace_d7fe36703a9572fe::setgamemodecamera("allies", level.spectatorcameras[0]["allies"]);
    namespace_d7fe36703a9572fe::setgamemodecamera("axis", level.spectatorcameras[0]["axis"]);
    updateoverheadcamerapos("allies");
    updateoverheadcamerapos("axis");
    level.updategamemodecamera = &updateoverheadcamerapos;
    level.spectatorcameratime = 1.25;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aee
// Size: 0xd4
function initjugg() {
    juggconfig = namespace_68f1873625691c6::jugg_createconfig();
    level.rugby.juggconfig = juggconfig;
    maxhealth = getjuggmaxhealth();
    juggconfig.maxhealth = maxhealth;
    juggconfig.startinghealth = maxhealth;
    juggconfig.suit = "iw9_juggernaut_mp";
    juggconfig.clothtype = "vestheavy";
    juggconfig.var_400ef51562606e7a = "milhvygr";
    juggconfig.forcetostand = 0;
    juggconfig.allows["sprint"] = 1;
    juggconfig.allows["weapon_switch"] = undefined;
    juggconfig.classstruct.loadoutprimary = "iw8_lm_dblmg";
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc9
// Size: 0x3f1
function initspawns() {
    var_584994fab4a8712b = level.rugby;
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Rugby", "Crit_Default");
    }
    var_584994fab4a8712b.startspawnclassname = "mp_rugby_spawn";
    namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_584994fab4a8712b.startspawnclassname + "_allies_start", 1, "allies");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_584994fab4a8712b.startspawnclassname + "_axis_start", 1, "axis");
    if (!isdefined(level.teamstartspawnpoints)) {
        var_584994fab4a8712b.startspawnclassname = "mp_tdm_spawn";
        namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_584994fab4a8712b.startspawnclassname + "_allies_start", 1, "allies");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_584994fab4a8712b.startspawnclassname + "_axis_start", 1, "axis");
    }
    /#
        assertex(isdefined(level.teamstartspawnpoints), "No " + var_584994fab4a8712b.startspawnclassname + " start spawns found");
    #/
    /#
        assertex(isdefined(level.teamstartspawnpoints["allies"]) && level.teamstartspawnpoints["allies"].size != 0, "No allies start spawn points found");
    #/
    /#
        assertex(isdefined(level.teamstartspawnpoints["axis"]) && level.teamstartspawnpoints["axis"].size != 0, "No axis start spawn points found");
    #/
    var_7d38b2b1adc3e7d1 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rugby_spawn_allies");
    var_91ebf7fb8e7d58cc = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rugby_spawn_axis");
    if (var_7d38b2b1adc3e7d1.size <= 0 || var_91ebf7fb8e7d58cc.size <= 0) {
        var_bcda489aa10d2d1e = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        foreach (spawnpoint in var_bcda489aa10d2d1e) {
            if (distancesquared(spawnpoint.origin, var_584994fab4a8712b.goals["allies"].origin) < distancesquared(spawnpoint.origin, var_584994fab4a8712b.goals["axis"].origin)) {
                var_7d38b2b1adc3e7d1[var_7d38b2b1adc3e7d1.size] = spawnpoint;
            } else {
                var_91ebf7fb8e7d58cc[var_91ebf7fb8e7d58cc.size] = spawnpoint;
            }
        }
    }
    var_9b921d9972ea01fb = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rugby_spawn_allies_secondary");
    var_c88a41aa013294d6 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rugby_spawn_axis_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnpoints("allies", var_7d38b2b1adc3e7d1);
    namespace_b2d5aa2baf2b5701::registerspawnpoints("axis", var_91ebf7fb8e7d58cc);
    namespace_b2d5aa2baf2b5701::registerspawnpoints("allies", var_9b921d9972ea01fb);
    namespace_b2d5aa2baf2b5701::registerspawnpoints("axis", var_c88a41aa013294d6);
    namespace_b2d5aa2baf2b5701::registerspawnset("rugby_allies", var_7d38b2b1adc3e7d1);
    namespace_b2d5aa2baf2b5701::registerspawnset("rugby_axis", var_91ebf7fb8e7d58cc);
    namespace_b2d5aa2baf2b5701::registerspawnset("rugby_allies_base", var_9b921d9972ea01fb);
    namespace_b2d5aa2baf2b5701::registerspawnset("rugby_axis_base", var_c88a41aa013294d6);
    var_584994fab4a8712b.spawnsets = [];
    var_584994fab4a8712b.spawnsets["allies"] = "rugby_allies";
    var_584994fab4a8712b.spawnsets["axis"] = "rugby_axis";
    var_584994fab4a8712b.fallbackspawnsets = [];
    var_584994fab4a8712b.fallbackspawnsets["allies"] = "rugby_allies_base";
    var_584994fab4a8712b.fallbackspawnsets["axis"] = "rugby_axis_base";
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc1
// Size: 0x181
function getspawnpoint() {
    var_584994fab4a8712b = level.rugby;
    var_21af6c045d6ddf93 = self.pers["team"];
    if (istrue(game["switchedsides"])) {
        var_21af6c045d6ddf93 = ter_op(var_21af6c045d6ddf93 == "allies", "axis", "allies");
    }
    var_dcabafc0cc1b60ed = ter_op(var_21af6c045d6ddf93 == "allies", "axis", "allies");
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_584994fab4a8712b.startspawnclassname + "_" + var_21af6c045d6ddf93 + "_start");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
    } else {
        juggpos = getjuggorcratepos();
        var_629e5fe2f6b337fa = [];
        var_629e5fe2f6b337fa["singlePointPos"] = juggpos;
        var_629e5fe2f6b337fa["minDistToSinglePointSq"] = 562500;
        var_629e5fe2f6b337fa["maxDistToSinglePointSq"] = 36000000;
        var_629e5fe2f6b337fa["distRangeToSinglePointSq"] = 36000000 - 562500;
        var_629e5fe2f6b337fa["juggPos"] = juggpos;
        var_629e5fe2f6b337fa["rugbyFieldDir2D"] = var_584994fab4a8712b.goals[var_dcabafc0cc1b60ed].origin - var_584994fab4a8712b.goals[var_21af6c045d6ddf93].origin;
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.team, var_584994fab4a8712b.spawnsets[var_21af6c045d6ddf93], var_584994fab4a8712b.fallbackspawnsets[var_21af6c045d6ddf93], undefined, var_629e5fe2f6b337fa);
    }
    return spawnpoint;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x214a
// Size: 0x4d
function modeonteamchangedeath(player) {
    if (isdefined(level.var_9a453437a59c7a57)) {
        player setclientomnvar("ui_rugby_jugg_friendly", ter_op(player.team == level.var_9a453437a59c7a57.team, 0, 1));
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x219e
// Size: 0x83
function onplayerconnect(player) {
    player setextrascore0(0);
    if (isdefined(player.pers["damage"])) {
        player setextrascore0(player.pers["damage"]);
    }
    player setextrascore1(0);
    if (isdefined(player.pers["defends"])) {
        player setextrascore1(player.pers["defends"]);
    }
    thread onplayerspawned(player);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2228
// Size: 0x7d
function onplayerspawned(player) {
    player waittill("spawned");
    if (isdefined(level.var_9a453437a59c7a57) && isdefined(level.var_9a453437a59c7a57.team) && isdefined(player.team)) {
        player setclientomnvar("ui_rugby_jugg_friendly", ter_op(player.team == level.var_9a453437a59c7a57.team, 0, 1));
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x22ac
// Size: 0xd8
function onplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (isdefined(eattacker) && eattacker != victim && isplayer(eattacker)) {
        if (idamage >= var_fcdf19e3cdd29669) {
            idamage = var_fcdf19e3cdd29669;
        }
        eattacker namespace_2685ec368e022695::statsetchild("round", "damage", eattacker.pers["damage"]);
        eattacker setextrascore0(eattacker.pers["damage"]);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x238b
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x23d3
// Size: 0x98
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    self.overrideweaponspeed_speedscale = undefined;
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x2472
// Size: 0x2e3
function awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    var_8363beb01b537d3e = 0;
    var_88f4967a49a22ed7 = 0;
    victim = self;
    var_f7ded1fdb02a123d = victim.origin;
    var_86c1c8628b1d55f8 = attacker.origin;
    attackerisinflictor = 0;
    if (isdefined(einflictor)) {
        var_86c1c8628b1d55f8 = einflictor.origin;
        attackerisinflictor = einflictor == attacker;
    }
    if (isdefined(level.var_9a453437a59c7a57)) {
        if (isdefined(attacker) && isplayer(attacker) && attacker.team != victim.team) {
            if (attacker == level.var_9a453437a59c7a57) {
                attacker thread function_e3e3e81453fd788b(#"hash_670456684d1ac92f");
            } else if (victim == level.var_9a453437a59c7a57) {
                attacker thread function_e3e3e81453fd788b(#"hash_fd0c8fbac1063eaa");
            } else if (attacker.team == level.var_9a453437a59c7a57.team && attacker != level.var_9a453437a59c7a57) {
                var_9b65eac5ec48eb9b = distancesquared(level.var_9a453437a59c7a57.origin, var_86c1c8628b1d55f8);
                if (var_9b65eac5ec48eb9b < 105625) {
                    attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                    attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
                    attacker incpersstat("defends", 1);
                    attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                    attacker setextrascore1(attacker.pers["defends"]);
                    thread utility::trycall(level.matchdata_logvictimkillevent, var_61b5d0250b328f00, "defending");
                }
            } else if (attacker.team != level.var_9a453437a59c7a57.team && victim.team == level.var_9a453437a59c7a57.team) {
                var_9b65eac5ec48eb9b = distancesquared(level.var_9a453437a59c7a57.origin, var_f7ded1fdb02a123d);
                if (var_9b65eac5ec48eb9b < 105625) {
                    attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                    attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_5a3b180273be47b1");
                    thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "assaulting");
                }
            }
        }
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x275c
// Size: 0x2a
function ontimelimit() {
    if (level.gameended) {
        return;
    }
    thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["cyber_tie"]);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x278d
// Size: 0x9f
function ontimelimitot() {
    if (level.rugby.activejuggernauts.size > 0) {
        if (!istrue(level.rugby.inot)) {
            setomnvar("ui_overtime_time", gettime() + function_d973247bb17fe16() * 1000);
            level.rugby.inot = 1;
            level.canprocessot = 1;
            function_1d7e98e21e22f61a();
            level thread function_aecdd5e4b8140008();
        }
    } else {
        level.canprocessot = 1;
        level.currenttimelimitdelay = level.ontimelimitgraceperiod;
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2833
// Size: 0x49
function function_aecdd5e4b8140008() {
    level endon("game_ended");
    while (1) {
        if (level.rugby.activejuggernauts.size > 0) {
            wait(0.05);
        } else {
            level.currenttimelimitdelay = level.ontimelimitgraceperiod;
            break;
        }
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2883
// Size: 0x48
function function_da84ed466ccfc207() {
    time = getdvarfloat(@"hash_364db51c6de274cf");
    time = int(time * 1000 + gettime());
    setomnvar("ui_obj_timer", time);
    setomnvar("ui_obj_progress", 1);
    return time;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d3
// Size: 0x23
function function_1d7e98e21e22f61a() {
    level notify("stop_rugby_timeout");
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28fd
// Size: 0x11b
function getjuggorcratepos() {
    var_584994fab4a8712b = level.rugby;
    if (isdefined(level.var_9a453437a59c7a57)) {
        return level.var_9a453437a59c7a57.origin;
    } else if (var_584994fab4a8712b.activejuggernauts.size > 0) {
        foreach (jugg in var_584994fab4a8712b.activejuggernauts) {
            return jugg.origin;
        }
    } else {
        /#
            assert(var_584994fab4a8712b.activejuggcrates.size);
        #/
        foreach (crate in var_584994fab4a8712b.activejuggcrates) {
            return crate.origin;
        }
    }
    return undefined;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a20
// Size: 0x94
function doesteamhaveactivejugg(team) {
    var_584994fab4a8712b = level.rugby;
    if (var_584994fab4a8712b.activejuggernauts.size > 0) {
        foreach (jugg in var_584994fab4a8712b.activejuggernauts) {
            if (jugg.team == team) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2abc
// Size: 0x105
function onjuggproximityscore(var_72837284fe79dfab) {
    level endon("game_ended");
    playsoundatpos(var_72837284fe79dfab.origin, "exp_bombsite_lr");
    playfx(getfx("rugby_score_explosion"), var_72837284fe79dfab.origin);
    players = getplayersinradius(var_72837284fe79dfab.origin, 800);
    foreach (player in players) {
        if (player != var_72837284fe79dfab && player.team != var_72837284fe79dfab.team) {
            player dodamage(5000, var_72837284fe79dfab.origin, player, undefined, "MOD_EXPLOSIVE");
        }
    }
    thread namespace_d576b6dc7cef9c62::endgame(var_72837284fe79dfab.team, game["end_reason"]["target_destroyed"]);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc8
// Size: 0x65
function setupinitialstate() {
    var_584994fab4a8712b = level.rugby;
    if (!activateendzone(var_584994fab4a8712b.endzones["allies"][0], "allies")) {
        return;
    }
    if (!activateendzone(var_584994fab4a8712b.endzones["axis"][0], "axis")) {
        return;
    }
    if (!activatenewjuggcrate()) {
        return;
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c34
// Size: 0x99
function activatenewjuggcrate() {
    var_4fdabb9630366776 = randomint(level.rugby.juggcratesetups.size);
    var_a851cc05483290a7 = level.rugby.juggcratesetups[var_4fdabb9630366776];
    if (!isdefined(var_a851cc05483290a7)) {
        /#
            assertmsg("No Rugby Jugg Crates found");
        #/
        return 0;
    }
    return activatejuggcrate(var_a851cc05483290a7.origin, ter_op(isdefined(var_a851cc05483290a7.angles), var_a851cc05483290a7.angles, (0, 0, 0)), 1);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd5
// Size: 0xa9
function activateendzone(var_aab41eeedec2662d, team) {
    var_584994fab4a8712b = level.rugby;
    if (istrue(game["switchedsides"])) {
        team = ter_op(team == "allies", "axis", "allies");
    }
    if (!isdefined(var_aab41eeedec2662d)) {
        /#
            assertmsg("No " + team + " Endzones found");
        #/
        return 0;
    }
    if (isdefined(var_584994fab4a8712b.goals[team])) {
        deactivateendzone(var_584994fab4a8712b.goals[team]);
    }
    var_584994fab4a8712b.goals[team] = var_aab41eeedec2662d;
    var_aab41eeedec2662d thread watchforjuggproximityscore(team);
    return 1;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d86
// Size: 0x14
function deactivateendzone(var_54b003ce5d016238) {
    var_54b003ce5d016238 notify("endzone_deactivate");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2da1
// Size: 0x145
function function_7c63d60ba6168aea(var_54b003ce5d016238) {
    if (level.mapname == "mp_shipment" || level.mapname == "mp_euphrates" || level.mapname == "mp_rust" || level.mapname == "mp_crash2" || level.mapname == "mp_malyshev") {
        if (var_54b003ce5d016238.trigger.objectivekey == "allies") {
            target = "allies_endzone_vis";
        } else {
            target = "axis_endzone_vis";
        }
    } else if (level.mapname == "mp_backlot2") {
        if (var_54b003ce5d016238.trigger.targetname == "allies_endzone") {
            target = "axis_endzone_vis";
        } else {
            target = "allies_endzone_vis";
        }
    } else if (var_54b003ce5d016238.trigger.targetname == "allies_endzone") {
        target = "allies_endzone_vis";
    } else {
        target = "axis_endzone_vis";
    }
    var_54b003ce5d016238 thread function_8fa98f8a53842866(target, var_54b003ce5d016238.trigger.targetname);
    var_54b003ce5d016238 thread updatechevrons("idle");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2eed
// Size: 0x13a
function function_8fa98f8a53842866(target, label) {
    wait(1);
    othervisuals = getentitylessscriptablearray(target, "targetname");
    othervisuals = function_d94e76f45911efa5(othervisuals, label);
    chevrons = [];
    foreach (visual in othervisuals) {
        index = chevrons.size;
        chevrons[index] = visual;
        chevrons[index].numchevrons = 1;
        if (isdefined(visual.script_noteworthy)) {
            if (visual.script_noteworthy == "2") {
                chevrons[index].numchevrons = 2;
            } else if (visual.script_noteworthy == "3") {
                chevrons[index].numchevrons = 3;
            } else if (visual.script_noteworthy == "4") {
                chevrons[index].numchevrons = 4;
            }
        }
    }
    self.chevrons = chevrons;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x302e
// Size: 0xaa
function updatechevrons(state) {
    self notify("updateChevrons");
    self endon("updateChevrons");
    while (!isdefined(self.chevrons)) {
        waitframe();
    }
    foreach (var_eae85273686f4f4 in self.chevrons) {
        for (i = 0; i < var_eae85273686f4f4.numchevrons; i++) {
            var_eae85273686f4f4 setscriptablepartstate("chevron_" + i, state);
        }
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30df
// Size: 0x1ee
function function_182e902215d205b5(othervisuals, label) {
    var_c081a38873b1d5e3 = [];
    var_d23f6234846f86a6 = [];
    switch (level.mapname) {
    case #"hash_9de262a7132ec180":
        var_d23f6234846f86a6["1"] = [0:(-564, 1848, 24)];
        var_d23f6234846f86a6["2"] = [0:(-1314, 440, 24), 1:(-1362, 816, 24)];
        break;
    case #"hash_66ce5cdcd3b547f3":
    case #"hash_ff009e5fab42b778":
        var_d23f6234846f86a6["3"] = [0:(-692, 1828, 42), 1:(-300, 1548, 76)];
        break;
    case #"hash_f09747c9feb47eb1":
        var_d23f6234846f86a6["8"] = [0:(688, 256, 280)];
        var_d23f6234846f86a6["20"] = [0:(212, 1436, 338)];
        break;
    default:
        break;
    }
    if (isdefined(var_d23f6234846f86a6[label])) {
        foreach (visual in othervisuals) {
            foreach (entry in var_d23f6234846f86a6[label]) {
                if (distance(visual.origin, entry) < 10) {
                    var_c081a38873b1d5e3[var_c081a38873b1d5e3.size] = visual;
                    break;
                }
            }
        }
    }
    othervisuals = array_remove_array(othervisuals, var_c081a38873b1d5e3);
    return othervisuals;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32d5
// Size: 0x8cf
function function_d94e76f45911efa5(othervisuals, label) {
    var_34dce00df63cff91 = [];
    var_c081a38873b1d5e3 = [];
    switch (level.mapname) {
    case #"hash_d8bbcfc499e70e6f":
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [0:(-2376, -3322, 39), 1:(0, -90, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [0:(-2071, -3537, 0), 1:(0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][2] = [0:(-2071, -3653, 0), 1:(0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][3] = [0:(-2071, -3754, 3), 1:(0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [0:(2137, 493, 124), 1:(0, -85, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [0:(2302, 495, 128), 1:(0, -90, 0)];
        var_34dce00df63cff91["axis_endzone"][2] = [0:(2390, 495, 134), 1:(0, -90, 0)];
        var_34dce00df63cff91["axis_endzone"][3] = [0:(2457, 494, 134), 1:(0, -90, 0)];
        break;
    case #"hash_cce4bca393df84eb":
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [0:(-722, -1428, 201), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [0:(-722, -1567, 200), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][2] = [0:(-721, -1496, 200), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][3] = [0:(-721, -1639, 200), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][4] = [0:(-720, -1711, 200), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][5] = [0:(-720, -1806, 200), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][6] = [0:(-719, -1896, 200), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][7] = [0:(-719, -1999, 200), 1:(0, 0, 0)];
        var_34dce00df63cff91["axis_endzone"][8] = [0:(-483, -2074, 200), 1:(0, -270, 0)];
        break;
    case #"hash_143ad8976cca3ba":
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [0:(4948, 1284, 9), 1:(0, 45, 0)];
        break;
    case #"hash_9de262a7132ec180":
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [0:(-603, 3101, 33), 1:(0, 155, 0)];
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [0:(-1070, 600, 32), 1:(0, -20, 0)];
        break;
    case #"hash_7246ed8ceb925ba9":
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [0:(1773, -1148, 302), 1:(0, -90, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [0:(2098, -1153, 292), 1:(0, -90, 0)];
        break;
    case #"hash_688334408379d4fb":
    case #"hash_d32ec8c7ac2ec13b":
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [0:(1648, 367, 291), 1:(0, 0, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [0:(1947, 859, 255), 1:(0, 270, 0)];
        var_34dce00df63cff91["allies_endzone"][2] = [0:(1691, 854, 291), 1:(0, 270, 0)];
        break;
    case #"hash_f09747c9feb47eb1":
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [0:(-2404.94, -1457.67, 280), 1:(0, 0, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [0:(-849.814, -1158.33, 280), 1:(0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][2] = [0:(-1978.45, -341.57, 280), 1:(0, 270, 0)];
        var_34dce00df63cff91["allies_endzone"][3] = [0:(-1143, -975, 280), 1:(0, 270, 0)];
        var_34dce00df63cff91["axis_endzone"] = [];
        var_34dce00df63cff91["axis_endzone"][0] = [0:(-1300.9, 4861.72, 269), 1:(0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][1] = [0:(-1300.9, 4947, 269), 1:(0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][2] = [0:(-1300.9, 4759, 269), 1:(0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][3] = [0:(-1293.48, 4459.81, 273), 1:(0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][4] = [0:(-1293.48, 4392, 274), 1:(0, 180, 0)];
        var_34dce00df63cff91["axis_endzone"][5] = [0:(-2300.19, 3725.48, 288), 1:(0, 90, 0)];
        var_34dce00df63cff91["axis_endzone"][6] = [0:(-1700.19, 3725.48, 286), 1:(0, 90, 0)];
        var_34dce00df63cff91["axis_endzone"][7] = [0:(-1598.19, 4348.83, 279), 1:(0, 90, 0)];
        break;
    case #"hash_a3aa6afd955c54d":
    case #"hash_8cd7282b2d63b917":
        var_34dce00df63cff91["allies_endzone"] = [];
        var_34dce00df63cff91["allies_endzone"][0] = [0:(765, -1883, 23), 1:(0, 180, 0)];
        var_34dce00df63cff91["allies_endzone"][1] = [0:(762, -2006, 187), 1:(0, 180, 0)];
        break;
    default:
        break;
    }
    if (isdefined(var_34dce00df63cff91[label])) {
        foreach (entry in var_34dce00df63cff91[label]) {
            origin = entry[0];
            angles = entry[1];
            scriptable = spawnscriptable("hardpoint_chevron", origin, angles);
            var_c081a38873b1d5e3[var_c081a38873b1d5e3.size] = scriptable;
        }
    }
    othervisuals = array_combine(othervisuals, var_c081a38873b1d5e3);
    return othervisuals;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bac
// Size: 0x37
function createvisualsinfo(scriptable, origin, angles) {
    scriptable.origin = origin;
    scriptable.angles = angles;
    return scriptable;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3beb
// Size: 0xa8
function setupgoalvisualsforjugg(var_72837284fe79dfab) {
    var_aaf899a23248ac63 = var_72837284fe79dfab.team;
    var_b0c33d224b825287 = getenemyteams(var_aaf899a23248ac63);
    /#
        assert(var_b0c33d224b825287.size == 1);
    #/
    var_2e912abc2c41e4da = var_b0c33d224b825287[0];
    var_54b003ce5d016238 = level.rugby.goals[var_2e912abc2c41e4da];
    var_54b003ce5d016238 thread updatechevrons(var_2e912abc2c41e4da);
    var_52ecbed785600f78 = level.rugby.goals[var_aaf899a23248ac63];
    var_52ecbed785600f78 thread updatechevrons("off");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9a
// Size: 0x66
function watchforjuggproximityscore(team) {
    level endon("game_ended");
    self endon("endzone_deactivate");
    while (1) {
        var_67e70b397fb73acc = self.trigger waittill("trigger");
        if (isdefined(var_67e70b397fb73acc.rugbyjugginfo) && var_67e70b397fb73acc.team != team) {
            onjuggproximityscore(var_67e70b397fb73acc);
            return;
        }
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d07
// Size: 0x21f
function activatenewjuggernaut(var_72837284fe79dfab) {
    var_584994fab4a8712b = level.rugby;
    var_7ecfa0327f684d3b = setupplayerasjugg(var_72837284fe79dfab);
    if (!var_7ecfa0327f684d3b) {
        return 0;
    }
    var_ecd37c93245b48ea = spawnstruct();
    var_ecd37c93245b48ea.player = var_72837284fe79dfab;
    var_fe94a717b75f319f = var_72837284fe79dfab getentitynumber();
    var_ecd37c93245b48ea.id = var_fe94a717b75f319f;
    var_584994fab4a8712b.activejuggernauts[var_fe94a717b75f319f] = var_72837284fe79dfab;
    level.var_9a453437a59c7a57 = var_72837284fe79dfab;
    var_72837284fe79dfab.rugbyjugginfo = var_ecd37c93245b48ea;
    createobjectiveiconsforactivejugg(var_72837284fe79dfab, var_ecd37c93245b48ea);
    startjugghud(var_72837284fe79dfab);
    setupgoalvisualsforjugg(var_72837284fe79dfab);
    var_72837284fe79dfab thread watchjugghealth();
    var_72837284fe79dfab thread watchforjuggdeathdisconnect();
    var_72837284fe79dfab thread watchjuggprogress();
    var_72837284fe79dfab thread watchteammatesnearjugg();
    if (getjuggtimeout() > 0) {
        var_72837284fe79dfab thread watchjuggtimeout();
    }
    var_72837284fe79dfab namespace_944ddf7b8df1b0e3::leaderdialogonplayer("rugby_new_jugg", "obj");
    var_72837284fe79dfab thread namespace_44abc05161e2e2cb::showsplash("jugg_player");
    excludelist = [0:var_72837284fe79dfab];
    otherteam = getotherteam(var_72837284fe79dfab.team)[0];
    namespace_944ddf7b8df1b0e3::statusdialog("rugby_secured_jugg", var_72837284fe79dfab.team, "obj", excludelist);
    namespace_944ddf7b8df1b0e3::statusdialog("rugby_lost_jugg", otherteam, "obj");
    level thread function_64357cc14d714493(var_72837284fe79dfab.team, otherteam);
    foreach (player in level.players) {
        if (player.team == var_72837284fe79dfab.team) {
            if (player != var_72837284fe79dfab) {
                player thread namespace_44abc05161e2e2cb::showsplash("jugg_captured");
            }
        } else {
            player thread namespace_44abc05161e2e2cb::showsplash("jugg_lost");
        }
    }
    return 1;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f2e
// Size: 0x31
function function_64357cc14d714493(var_aaf899a23248ac63, otherteam) {
    wait(3);
    namespace_944ddf7b8df1b0e3::statusdialog("rugby_order_attack", var_aaf899a23248ac63);
    namespace_944ddf7b8df1b0e3::statusdialog("rugby_order_fallback", otherteam);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f66
// Size: 0x1a6
function deactivatejuggernaut(player) {
    var_584994fab4a8712b = level.rugby;
    var_ecd37c93245b48ea = player.rugbyjugginfo;
    /#
        assert(var_ecd37c93245b48ea.player == player);
    #/
    if (isdefined(player)) {
        player.rugbyjugginfo = undefined;
    }
    var_584994fab4a8712b.activejuggernauts[var_ecd37c93245b48ea.id] = undefined;
    level.var_9a453437a59c7a57 = undefined;
    cleanupobjectiveiconsforjugg(player, var_ecd37c93245b48ea);
    clearjugghud();
    foreach (var_54b003ce5d016238 in var_584994fab4a8712b.endzones) {
        var_54b003ce5d016238[0] thread updatechevrons("idle");
    }
    level.rugby.var_6222195e9884820 = undefined;
    level.rugby.var_687d3e3e7cdf8208 = undefined;
    level.rugby.var_a3e08b16ea9dc56d = undefined;
    level.rugby.var_c6dd6edc503e61a8 = undefined;
    if (isdefined(player) && isdefined(player.team)) {
        level thread namespace_44abc05161e2e2cb::notifyteam("jugg_down_fr", "jugg_down_en", player.team);
    } else {
        level thread namespace_44abc05161e2e2cb::notifyteam("jugg_capture", "jugg_capture", "allies");
    }
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
    player notify("rugby_jugg_end");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4113
// Size: 0xa1
function startjugghud(var_72837284fe79dfab) {
    setomnvar("ui_rugby_jugg_client", var_72837284fe79dfab);
    setomnvar("ui_rugby_jugg_health", 1);
    foreach (player in level.players) {
        player setclientomnvar("ui_rugby_jugg_friendly", ter_op(player.team == var_72837284fe79dfab.team, 0, 1));
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41bb
// Size: 0x6a
function clearjugghud() {
    setomnvar("ui_rugby_jugg_client", undefined);
    foreach (player in level.players) {
        player setclientomnvar("ui_rugby_jugg_friendly", -1);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x422c
// Size: 0x3f
function watchjugghealth() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    while (1) {
        self waittill("damage");
        setomnvar("ui_rugby_jugg_health", self.health / self.maxhealth);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4272
// Size: 0xbc
function watchforjuggdeathdisconnect() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    self waittill("death_or_disconnect");
    playerpos = undefined;
    if (!isdefined(self)) {
        playerpos = level.lastjuggpositions[self.rugbyjugginfo.id];
    } else {
        playerpos = self.origin;
    }
    nodes = getnodesinradius(playerpos, 32, 0, 32);
    droppos = getclosestpointonnavmesh(playerpos);
    if (distance(playerpos, droppos) > 50) {
        droppos = playerpos;
    }
    droppos = playerpos;
    activatejuggcrate(droppos + (0, 0, 0), (0, 0, 0));
    deactivatejuggernaut(self);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4335
// Size: 0x271
function watchjuggprogress() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    var_aaf899a23248ac63 = self.team;
    var_b0c33d224b825287 = getenemyteams(var_aaf899a23248ac63);
    /#
        assert(var_b0c33d224b825287.size == 1);
    #/
    var_2e912abc2c41e4da = var_b0c33d224b825287[0];
    var_e728aa816ece6c6d = level.rugby.goals[var_aaf899a23248ac63];
    var_7693d852900723cf = level.rugby.goals[var_2e912abc2c41e4da];
    var_b1fcbb0f6c5d7c8a = var_7693d852900723cf.origin - var_e728aa816ece6c6d.origin;
    var_e56ae451d16a08b2 = vectordot(var_b1fcbb0f6c5d7c8a, var_b1fcbb0f6c5d7c8a);
    var_d4bc622ee7721caa = undefined;
    while (1) {
        var_84e914491011509c = self.origin * (1, 1, 0) - var_e728aa816ece6c6d.origin * (1, 1, 0);
        progress = vectordot(var_b1fcbb0f6c5d7c8a, var_84e914491011509c) / var_e56ae451d16a08b2;
        progress = clamp(progress, 0, 1);
        var_4a7b5a73817ead7b = [];
        var_4a7b5a73817ead7b[var_aaf899a23248ac63] = progress;
        var_4a7b5a73817ead7b[var_2e912abc2c41e4da] = 1 - progress;
        foreach (player in level.players) {
            if (player.team == var_aaf899a23248ac63 || player.team == var_2e912abc2c41e4da) {
                player setclientomnvar("ui_rugby_jugg_progress", var_4a7b5a73817ead7b[player.team]);
            }
        }
        if (progress > 0.8) {
            level thread function_5fbdad9f043bc253(progress, var_aaf899a23248ac63, var_2e912abc2c41e4da);
        }
        if (isdefined(level.var_9a453437a59c7a57)) {
            if (!isdefined(var_d4bc622ee7721caa)) {
                var_d4bc622ee7721caa = progress;
            }
            if (progress > var_d4bc622ee7721caa + 0.1) {
                var_d4bc622ee7721caa = progress;
                level.var_9a453437a59c7a57 thread doscoreevent(#"hash_9fdad7cba5ab8ddf");
            }
        }
        level.lastjuggpositions[self.rugbyjugginfo.id] = self.origin;
        wait(0.05);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x45ad
// Size: 0x179
function function_5fbdad9f043bc253(progress, var_aaf899a23248ac63, var_2e912abc2c41e4da) {
    if (!isdefined(level.rugby.var_6222195e9884820)) {
        level.rugby.var_6222195e9884820 = 1;
        level.rugby.var_687d3e3e7cdf8208 = gettime();
        level.rugby.var_a3e08b16ea9dc56d = progress;
        level.rugby.var_c6dd6edc503e61a8 = progress;
    } else if (isdefined(level.rugby.var_687d3e3e7cdf8208) && level.rugby.var_687d3e3e7cdf8208 + 30000 < gettime()) {
        level.rugby.var_6222195e9884820 = 1;
        level.rugby.var_687d3e3e7cdf8208 = gettime();
        level.rugby.var_a3e08b16ea9dc56d = progress;
        level.rugby.var_c6dd6edc503e61a8 = progress;
    }
    if (istrue(level.rugby.var_6222195e9884820)) {
        namespace_944ddf7b8df1b0e3::statusdialog("rugby_friendly_close_goal", var_aaf899a23248ac63, "obj");
        namespace_944ddf7b8df1b0e3::statusdialog("rugby_enemy_close_goal", var_2e912abc2c41e4da, "obj");
        thread namespace_3bde6869e44a2770::timelimitmusic(var_aaf899a23248ac63);
    }
    level.rugby.var_6222195e9884820 = 0;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x472d
// Size: 0xcb
function setupplayerasjugg(player) {
    juggconfig = level.rugby.juggconfig;
    result = player namespace_68f1873625691c6::jugg_makejuggernaut(juggconfig);
    if (!result) {
        return 0;
    }
    player.droppeddeathweapon = 1;
    player givemaxammo(player.classstruct.loadoutprimaryobject);
    player.playerstreakspeedscale = getjuggspeedscalar(0);
    player namespace_3bbb5a98b932c46f::updatemovespeedscale();
    player thread handlejuggjumpspam();
    var_b0c33d224b825287 = getenemyteams(player.team);
    /#
        assert(var_b0c33d224b825287.size == 1);
    #/
    var_2e912abc2c41e4da = var_b0c33d224b825287[0];
    return 1;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4800
// Size: 0xd6
function watchteammatesnearjugg() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    while (1) {
        var_ade1a8ebc52f0903 = 0;
        foreach (player in level.players) {
            if (player.team != self.team || player == self) {
                continue;
            }
            if (distancesquared(player.origin, self.origin) < 122500) {
                var_ade1a8ebc52f0903++;
            }
        }
        self.playerstreakspeedscale = getjuggspeedscalar(var_ade1a8ebc52f0903);
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
        wait(0.1);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48dd
// Size: 0x4f
function watchjuggtimeout() {
    level endon("game_ended");
    level endon("stop_rugby_timeout");
    self endon("rugby_jugg_end");
    function_da84ed466ccfc207();
    level thread function_56bdeedc04731234(self);
    wait(getjuggtimeout());
    setomnvar("ui_obj_timer", 0);
    setomnvar("ui_obj_progress", 0);
    self suicide();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4933
// Size: 0x74
function function_56bdeedc04731234(jugg) {
    level endon("stop_rugby_timeout");
    jugg endon("rugby_jugg_end");
    timeoutduration = getdvarfloat(@"hash_364db51c6de274cf");
    currentprogress = timeoutduration;
    while (!istrue(level.canprocessot)) {
        setomnvar("ui_obj_progress", currentprogress / timeoutduration);
        currentprogress = currentprogress - level.framedurationseconds;
        wait(level.framedurationseconds);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49ae
// Size: 0x101
function handlejuggjumpspam() {
    level endon("game_ended");
    self endon("rugby_jugg_end");
    self notifyonplayercommand("jugg_jumped", "+goStand");
    while (1) {
        self waittill("jugg_jumped");
        while (!self isonground()) {
            waitframe();
        }
        var_9dc430bc2f680645 = self getvelocity();
        var_4e3d8f59bf0f7030 = (var_9dc430bc2f680645[0] * 0.25, var_9dc430bc2f680645[1] * 0.25, var_9dc430bc2f680645[2]);
        self setvelocity(var_4e3d8f59bf0f7030);
        self.overrideweaponspeed_speedscale = 0.2;
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
        while (1) {
            result = waittill_any_timeout_1(1, "jugg_jumped");
            if (result == "jugg_jumped") {
                while (!self isonground()) {
                    waitframe();
                }
                var_9dc430bc2f680645 = self getvelocity();
                var_4e3d8f59bf0f7030 = (var_9dc430bc2f680645[0] * 0.25, var_9dc430bc2f680645[1] * 0.25, var_9dc430bc2f680645[2]);
                self setvelocity(var_4e3d8f59bf0f7030);
            } else {
                break;
            }
        }
        self.overrideweaponspeed_speedscale = undefined;
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab6
// Size: 0x38
function function_d6e8f4ec9a310d75() {
    var_3c2389ba69e5822b = 0;
    level.var_e536c17539f4e08a = spawnstruct();
    level.var_e536c17539f4e08a.objidnum = namespace_5a22b6f3a56f7e9b::requestreservedid(var_3c2389ba69e5822b);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4af5
// Size: 0x7f
function createobjectiveiconsforactivejugg(var_72837284fe79dfab, var_ecd37c93245b48ea) {
    createjuggobjective(var_72837284fe79dfab, var_ecd37c93245b48ea);
    var_b0c33d224b825287 = getenemyteams(var_72837284fe79dfab.team);
    /#
        assert(var_b0c33d224b825287.size == 1);
    #/
    var_2e912abc2c41e4da = var_b0c33d224b825287[0];
    var_54b003ce5d016238 = level.rugby.goals[var_2e912abc2c41e4da];
    createendzoneobjective(var_54b003ce5d016238, var_2e912abc2c41e4da, var_ecd37c93245b48ea);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7b
// Size: 0x33
function cleanupobjectiveiconsforjugg(var_72837284fe79dfab, var_ecd37c93245b48ea) {
    namespace_5a22b6f3a56f7e9b::update_objective_state(0, "done");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_ecd37c93245b48ea.endzoneobjid);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb5
// Size: 0xa1
function createjuggobjective(var_72837284fe79dfab, var_ecd37c93245b48ea) {
    objid = 0;
    var_ecd37c93245b48ea.juggobjid = objid;
    namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", var_72837284fe79dfab.origin, "icon_waypoint_jugg");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, var_72837284fe79dfab);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 90);
    objective_setownerteam(objid, var_72837284fe79dfab.team);
    objective_setfriendlylabel(objid, "MP_MODE_RUGBY/JUGG_ESCORT");
    objective_setenemylabel(objid, "MP_MODE_RUGBY/JUGG_KILL");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4c5d
// Size: 0x93
function createendzoneobjective(var_54b003ce5d016238, var_2e912abc2c41e4da, var_ecd37c93245b48ea) {
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    var_ecd37c93245b48ea.endzoneobjid = objid;
    namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", var_54b003ce5d016238.origin, "icon_waypoint_hq");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
    objective_setownerteam(objid, var_2e912abc2c41e4da);
    objective_setfriendlylabel(objid, "MP_MODE_RUGBY/ENDZONE_DEFEND");
    objective_setenemylabel(objid, "MP_MODE_RUGBY/ENDZONE_ASSAULT");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf7
// Size: 0x8e
function activatejuggcrate(droppos, angles, firstspawn) {
    var_584994fab4a8712b = level.rugby;
    if (!function_8b3285549edc119a(droppos)) {
        droppos = level.var_91544a9e7182acc0;
        angles = level.var_3367385244b5b2b3;
    }
    var_c307f792531b5fa8 = createjuggcrate(droppos, angles, firstspawn);
    var_584994fab4a8712b.activejuggcrates[0] = var_c307f792531b5fa8;
    var_584994fab4a8712b.activejuggcrates[0].crateid = var_c307f792531b5fa8;
    return 1;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d8d
// Size: 0x77
function function_8b3285549edc119a(droppos) {
    var_30a9783b0595242a = 1;
    foreach (trigger in level.var_a4619c3c1ce4c58) {
        if (ispointinvolume(droppos, trigger)) {
            var_30a9783b0595242a = 0;
            break;
        }
    }
    return var_30a9783b0595242a;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4e0c
// Size: 0x1a8
function createjuggcrate(droppos, angles, firstspawn) {
    groundpos = getgroundposition(droppos, 8, 2000, 32);
    groundpos = groundpos + (0, 0, 5);
    crate = spawn("script_model", groundpos);
    crate.angles = angles;
    crate.visuals = [0:crate];
    crate.trigger = crate;
    crate.trigger.origin = crate.origin;
    crate.curorigin = crate.trigger.origin;
    crate.safeorigin = crate.trigger.origin;
    crate.visuals[0] setmodel("military_crate_large_stackable_01_jugg");
    crate thread juggcratemanageuse(crate);
    crate thread namespace_19b4203b51d56488::setdropped(undefined, undefined, 1);
    crate.crateid = crate getentitynumber();
    if (istrue(firstspawn)) {
        level.var_91544a9e7182acc0 = droppos;
        level.var_3367385244b5b2b3 = angles;
        foreach (team in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("rugby_capture_jugg", team, "obj");
        }
    }
    return crate;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fbc
// Size: 0x9b
function gunkillerhackthread() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        dropped_weapons = getweaponarray();
        foreach (droppeditem in dropped_weapons) {
            if (distance2dsquared(droppeditem.origin, self.origin) < 40000) {
                droppeditem delete();
            }
        }
        wait(0.25);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x505e
// Size: 0x54e
function juggcratemanageuse(crate) {
    level endon("game_ended");
    self endon("death");
    useent = spawn("script_model", self.origin + (0, 0, 30));
    useent.usetype = 1;
    useent.destination = self.origin + (0, 0, 30);
    useent.isuseobject = 1;
    self.useent = namespace_19b4203b51d56488::createholduseobject("neutral", useent, self.visuals, (0, 0, 64));
    foreach (team in level.teamnamelist) {
        self.useent.teamprogress = undefined;
    }
    self.useent.trigger.var_b9abe6bdf97e9a79 = 16900;
    self.useent.trigger makeusable();
    self.useent.trigger setuserange(130);
    self.useent.trigger sethintstring("MP_MODE_RUGBY/CRATE_USE");
    self.useent.trigger setcursorhint("HINT_BUTTON");
    self.useent.trigger setuseholdduration("duration_none");
    self.useent.trigger setusehideprogressbar(1);
    self.useent.trigger setusepriority(-1 - 1 - 1 - 1);
    self.useent.trigger sethintonobstruction("hide");
    self.useent namespace_19b4203b51d56488::setusetime(function_cca61180d8fdf0ea());
    self.useent.interactteam = "any";
    self.useent.curprogress = 0;
    self.useent.defaultusetime = self.useent.var_e88f93a281f8856e;
    self.useent.userate = 1;
    self.useent.id = "rugby_jugg";
    self.useent.exclusiveuse = 0;
    self.useent.exclusiveclaim = 0;
    self.useent.skiptouching = 1;
    self.useent.onbeginuse = &function_25a22a5801e9c215;
    self.useent.onuse = &function_60506c80cb5907f0;
    self.useent.onenduse = &function_d06091706a0b3695;
    self.useent.oncantuse = &function_d3025f84aa90109d;
    self.useent.inuse = 0;
    foreach (entry in level.teamnamelist) {
        self.useent.numtouching[entry] = 0;
        self.useent.touchlist[entry] = [];
    }
    self.useent.cancontestclaim = 0;
    self.useent.stalemate = 0;
    self.useent.wasstalemate = 0;
    self.useent.cancontestclaim = 0;
    self.useent.majoritycapprogress = 1;
    self.useent.wasmajoritycapprogress = 0;
    self.useent.resetprogress = 1;
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    self.useent.type = "useObject";
    self.useent.offset3d = (0, 0, 32);
    self.useent namespace_19b4203b51d56488::requestid(1, 1);
    self.useent namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_jugg_crate");
    self.useent namespace_19b4203b51d56488::setvisibleteam("any");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.useent.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.useent.objidnum, 0);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x55b3
// Size: 0x4f
function function_25a22a5801e9c215(player) {
    namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_taking", "icon_waypoint_losing");
    namespace_944ddf7b8df1b0e3::statusdialog("rugby_securing_jugg", player.team, "obj");
    self.visuals[0] playloopsound("mp_care_package_non_owner_cap");
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5609
// Size: 0xf7
function function_60506c80cb5907f0(player) {
    var_8443573a84df299a = activatenewjuggernaut(player);
    if (!var_8443573a84df299a) {
        return;
    }
    juggcratecleanup();
    level.rugby.activejuggcrates[0].crateid = undefined;
    level.rugby.activejuggcrates[0] = undefined;
    if (isdefined(self.useent)) {
        self.useent delete();
    }
    if (isdefined(self.visuals)) {
        foreach (visual in self.visuals) {
            visual delete();
        }
    }
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5707
// Size: 0xbd
function function_d06091706a0b3695(team, player, result) {
    self.visuals[0] stoploopsound("mp_care_package_non_owner_cap");
    if (!result) {
        namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_jugg_crate");
    }
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, player.team);
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, self.curprogress / self.usetime);
    if (self.curprogress > 0) {
        namespace_5a22b6f3a56f7e9b::objective_show_team_progress(self.objidnum, player.team);
    } else {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57cb
// Size: 0xc
function function_d3025f84aa90109d(player) {
    
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57de
// Size: 0x13
function juggcratecleanup() {
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objidnum);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57f8
// Size: 0xa9
function createjuggcrateobjective(crate) {
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    crate.objid = objid;
    pos = crate.origin + (0, 0, 32);
    namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", pos, "icon_waypoint_jugg");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
    objective_setneutrallabel(objid, "MP_MODE_RUGBY/CRATE_CAPTURE");
    objective_setfriendlylabel(objid, "MP_MODE_RUGBY/CRATE_CAPTURING");
    objective_setenemylabel(objid, "MP_MODE_RUGBY/CRATE_LOSING");
    updatejuggcrateobjectivestate(crate);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58a8
// Size: 0x75
function updatejuggcrateobjectivestate(crate) {
    objid = crate.objid;
    var_769b15f773adecb6 = istrue(crate.inuse);
    if (var_769b15f773adecb6) {
        objective_setownerteam(objid, crate.usingplayer.team);
        objective_sethot(objid, 1);
    } else {
        objective_setownerteam(objid, undefined);
        objective_sethot(objid, 0);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5924
// Size: 0x71
function function_75d33aa666ba0a2e(player) {
    juggconfig = level.rugby.juggconfig;
    if (istrue(player.isjuggernaut)) {
        player namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
        return 0;
    }
    result = player namespace_68f1873625691c6::function_a5af0a72ac912a3d(juggconfig);
    if (!isdefined(result)) {
        player namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BECOME");
        return 0;
    }
    return 1;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x599d
// Size: 0x235
function updateoverheadcamerapos(var_723c1c68caf21fd9) {
    if (isdefined(var_723c1c68caf21fd9)) {
        team = var_723c1c68caf21fd9;
        var_16c2b399cf8faee1 = level.spectatorcameras[0][team];
    } else {
        team = self.team;
        var_16c2b399cf8faee1 = level.spectatorcameras[0][self.team];
    }
    var_584994fab4a8712b = level.rugby;
    side = undefined;
    if (!istrue(game["switchedsides"])) {
        side = team;
    } else {
        side = ter_op(team == "allies", "axis", "allies");
    }
    var_a5d5a7083729299a = ter_op(side == "allies", "axis", "allies");
    var_974c1a9e4fc7b421 = var_584994fab4a8712b.endzones[side][0].origin;
    var_1d743581d71e8a20 = var_584994fab4a8712b.endzones[var_a5d5a7083729299a][0].origin;
    var_1f621b6115d4567 = (var_1d743581d71e8a20 - var_974c1a9e4fc7b421) * (1, 1, 0);
    var_5d88d0ca4a5ce25 = length2d(var_1f621b6115d4567);
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    if (isdefined(var_5fa1e1697a302583)) {
        var_9261f47cf5bdfef3 = var_5fa1e1697a302583.origin[2];
    } else {
        var_9261f47cf5bdfef3 = 5000;
    }
    campos = undefined;
    looktargetpos = undefined;
    if (doesteamhaveactivejugg(team)) {
        juggpos = getjuggorcratepos();
        campos = juggpos + var_1f621b6115d4567 * -3000 / var_5d88d0ca4a5ce25;
        campos = (campos[0], campos[1], var_9261f47cf5bdfef3);
        looktargetpos = juggpos + (var_1d743581d71e8a20 - juggpos) * 0.5;
    } else {
        campos = var_974c1a9e4fc7b421 + var_1f621b6115d4567 * -2000 / var_5d88d0ca4a5ce25;
        campos = (campos[0], campos[1], var_9261f47cf5bdfef3);
        looktargetpos = getjuggorcratepos();
    }
    lookdir = looktargetpos - campos;
    var_efb14e53541b5b48 = vectortoangles(lookdir);
    var_16c2b399cf8faee1.origin = campos;
    var_16c2b399cf8faee1.angles = var_efb14e53541b5b48;
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bd9
// Size: 0x11b
function startspectatorview() {
    setlowermessageomnvar(0);
    waitframe();
    updatesessionstate("spectator");
    namespace_5aeecefc462876::setdisabled();
    if (isdefined(self.lastdeathangles)) {
        self setplayerangles(self.lastdeathangles);
    }
    wait(0.1);
    setdof_default();
    updateoverheadcamerapos();
    var_25ac223966c5537 = level.spectatorcameras[0][self.team];
    var_dead2082432cecc = var_25ac223966c5537.origin;
    var_6788dc28320974a = var_25ac223966c5537.angles;
    self.deathspectatepos = var_dead2082432cecc;
    self.deathspectateangles = var_6788dc28320974a;
    cameraent = spawn("script_model", self getvieworigin());
    cameraent setmodel("tag_origin");
    cameraent.angles = var_6788dc28320974a;
    self.spectatorcament = cameraent;
    self.isusingtacopsmapcamera = 1;
    self cameralinkto(cameraent, "tag_origin", 1);
    thread dohalfwayflash();
    cameraent movecameratomappos(self, var_dead2082432cecc, var_6788dc28320974a);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cfb
// Size: 0x18
function dohalfwayflash() {
    wait(0.4);
    thread playslamzoomflash();
    applythermal();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d1a
// Size: 0x27
function endspectatorview() {
    if (!isdefined(self.spectatorcament)) {
        return;
    }
    removethermal();
    removeplayeroutlinesforoverheadcam();
    thread runslamzoomonspawn();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d48
// Size: 0x16
function applythermal() {
    self visionsetthermalforplayer("proto_apache_flir_mp");
    self thermalvisionon();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d65
// Size: 0xa
function removethermal() {
    self thermalvisionoff();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d76
// Size: 0x104
function movecameratomappos(player, var_9813182985677b23, finalangles) {
    player endon("spawned_player");
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 1, 0.5, 0.5);
    player playlocalsound("mp_cmd_camera_zoom_out");
    player setclienttriggeraudiozonepartialwithfade("spawn_cam", 0.5, "mix");
    self rotateto(finalangles, 1, 0.5, 0.5);
    wait(1.1);
    var_ae753108f3dff053 = anglestoforward(finalangles) * 300;
    var_ae753108f3dff053 = var_ae753108f3dff053 * (1, 1, 0);
    if (isdefined(player) && isdefined(player.spectatorcament)) {
        self moveto(var_9813182985677b23 + var_ae753108f3dff053, 15, 1, 1);
        player earthquakeforplayer(0.03, 15, var_9813182985677b23 + var_ae753108f3dff053, 1000);
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e81
// Size: 0xee
function runslamzoomonspawn() {
    self waittill("spawned_player");
    targetpos = self geteye();
    targetangles = self.angles;
    updatesessionstate("spectator");
    self cameralinkto(self.spectatorcament, "tag_origin", 1);
    self visionsetnakedforplayer("tac_ops_slamzoom", 0.2);
    self.spectatorcament moveto(targetpos, 0.5);
    self playlocalsound("mp_cmd_camera_zoom_in");
    self clearclienttriggeraudiozone(0.5);
    self.spectatorcament rotateto(targetangles, 0.5, 0.5);
    wait(0.5);
    self visionsetnakedforplayer("", 0);
    thread playslamzoomflash();
    updatesessionstate("playing");
    self cameraunlink();
    self.spectatorcament delete();
    wait(1);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f76
// Size: 0xd8
function playslamzoomflash() {
    overlay = newclienthudelem(self);
    overlay.x = 0;
    overlay.y = 0;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 1;
    overlay.foreground = 1;
    overlay setshader("white", 640, 480);
    overlay fadeovertime(0.4);
    overlay.alpha = 0;
    wait(0.4);
    overlay destroy();
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6055
// Size: 0xb9
function enableplayeroutlinesforoverheadcam() {
    self.rugbyoverheadoutlines = [];
    foreach (player in level.players) {
        if (player == self) {
            continue;
        }
        hudoutlineasset = ter_op(player.team == self.team, "outlinefill_nodepth_cyan", "outlinefill_nodepth_orange");
        outlineid = outlineenableforplayer(player, self, hudoutlineasset, "level_script");
        self.rugbyoverheadoutlines[outlineid] = player;
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6115
// Size: 0x70
function removeplayeroutlinesforoverheadcam() {
    if (isdefined(self.rugbyoverheadoutlines)) {
        foreach (id, player in self.rugbyoverheadoutlines) {
            outlinedisable(id, player);
        }
        self.rugbyoverheadoutlines = undefined;
    }
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x618c
// Size: 0xd0
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_jugg_crate", 0, "neutral", "MP_MODE_RUGBY/CRATE_CAPTURE", "icon_waypoint_jugg", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_jugg", 1, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_jugg", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_jugg", 1, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_jugg", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_hq_defend", 0, "friendly", "MP_MODE_RUGBY/ENDZONE_DEFEND", "icon_waypoint_hq", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_hq_attack", 0, "enemy", "MP_MODE_RUGBY/ENDZONE_ASSAULT", "icon_waypoint_hq", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_taking", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_jugg", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_losing", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_jugg", 0);
}

// Namespace rugby/namespace_1775668e99dafe49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6263
// Size: 0x116
function function_a9f58f4a75680c3a() {
    /#
        while (1) {
            var_584994fab4a8712b = level.rugby;
            if (getdvarint(@"hash_ccb2ab4c50c032d2", 0) == 1) {
                setdvar(@"hash_ccb2ab4c50c032d2", 0);
                foreach (crate in var_584994fab4a8712b.activejuggcrates) {
                    var_1f5bb8f398bf1e01 = 0;
                    foreach (player in level.players) {
                        if (isai(player)) {
                            crate function_60506c80cb5907f0(player);
                            var_1f5bb8f398bf1e01 = 1;
                            break;
                        }
                    }
                    if (var_1f5bb8f398bf1e01) {
                        break;
                    }
                }
            }
            wait(0.2);
        }
    #/
}

