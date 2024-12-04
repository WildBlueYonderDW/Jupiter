#using script_189b67b2735b981d;
#using script_1f97a44d1761c919;
#using script_2b264b25c7da0b12;
#using script_2d9d24f7c63ac143;
#using script_396a814d39e7044f;
#using script_3ff084f114b7f6c9;
#using script_556b8aeaa691317f;
#using script_58be75c518bf0d40;
#using script_6a5d3bf7a5b7064a;
#using script_76cc264b397db9cb;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_collision;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\math;
#using scripts\engine\scriptable;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\analyticslog;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\class;
#using scripts\mp\events;
#using scripts\mp\flags;
#using scripts\mp\gameobjects;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\br_utility;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\laststand;
#using scripts\mp\loot;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\outofbounds;
#using scripts\mp\persistence;
#using scripts\mp\playerlogic;
#using scripts\mp\rank;
#using scripts\mp\teamrevive;
#using scripts\mp\tweakables;
#using scripts\mp\utility\debug;
#using scripts\mp\utility\dialog;
#using scripts\mp\utility\dvars;
#using scripts\mp\utility\game;
#using scripts\mp\utility\lower_message;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\script;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\usability;

#namespace teamrevive;

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd2
// Size: 0x2b3
function init() {
    level.laststand = scripts\mp\tweakables::gettweakablevalue("player", "laststand");
    setomnvar("ui_last_stand_type", level.laststand);
    if (!isteamreviveenabled()) {
        return;
    }
    level.liveRagdollRevive = getmatchrulesdata("commonOption", "liveRagdollRevive");
    level.var_76f92a587185677c = getdvarint(@"hash_aa7dbb144027705f", 0) == 1;
    level.onteamchangedeath = &onteamchangedeath;
    level.revivetriggers = [];
    level.numlifelimited = getgametypenumlives();
    level.numrevives = getdvarint(hashcat(@"scr_", getgametype(), "_numRevives"), 0);
    level.disablespawncamera = 1;
    level.var_b961dd6c88e9a008 = getdvarint(@"hash_e6c178413af5a02e", 1) == 1;
    level.var_5ecf502dc8c87bbb = getdvarfloat(@"hash_d3c774c21f7f21f7", 30);
    if (isusingmatchrulesdata()) {
        setdynamicdvar(@"hash_a8543004b97470b5", getmatchrulesdata("commonOption", "teamReviveHealth"));
        setdynamicdvar(@"hash_af65c14c83826cfa", getmatchrulesdata("commonOption", "teamReviveTime"));
        setdynamicdvar(@"hash_e47f7f1502e4292e", getmatchrulesdata("commonOption", "teamReviveTimeout"));
    } else {
        function_65c4cae95d0c833b(40);
        function_c2bd90ff953a0ce4(3);
        function_2597b9cd72447cb6(0);
    }
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::registerteamassimilatecallback(&function_df4a3cff3137d441);
    }
    level.teamReviveHealth = getoverridedvarintexceptmatchrulesvalues(hashcat(@"scr_", getgametype(), "_teamReviveHealth"), @"hash_a8543004b97470b5");
    if (level.teamReviveHealth > scripts\mp\tweakables::gettweakablevalue("player", "maxhealth")) {
        level.teamReviveHealth = scripts\mp\tweakables::gettweakablevalue("player", "maxhealth");
    }
    level.teamReviveTime = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"scr_", getgametype(), "_teamReviveTime"), @"hash_af65c14c83826cfa");
    level.teamReviveTimeout = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"scr_", getgametype(), "_teamReviveTimeout"), @"hash_e47f7f1502e4292e");
    if (function_68ac13d2d66b844a()) {
        level.numalliesbeingrevived = 0;
        level.var_36a249f46f4464a8 = 0;
        setomnvar("ui_num_reviving_allies", 0);
        setomnvar("ui_num_reviving_axis", 0);
    }
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("cyber_revive_icon", &function_301c4ec489f9bd39);
    level thread onplayerconnect();
    /#
        level thread function_c4c78f8ceb5aa5f9();
    #/
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf8d
// Size: 0x24
function function_df4a3cff3137d441(player, oldteam, newteam) {
    player thread function_3dbfc03b90783f06();
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfb9
// Size: 0x1e
function private function_3dbfc03b90783f06() {
    self.var_a23f35f8460d8857 = 1;
    waitframe();
    waittillframeend();
    if (isdefined(self)) {
        self.var_a23f35f8460d8857 = undefined;
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfdf
// Size: 0xbf
function function_66e35a0b8bd5c2a7(revivehealth, revivetime, revivetimeout) {
    setdynamicdvar(@"hash_a8543004b97470b5", default_to(revivehealth, getmatchrulesdata("commonOption", "teamReviveHealth")));
    setdynamicdvar(@"hash_af65c14c83826cfa", default_to(revivetime, getmatchrulesdata("commonOption", "teamReviveTime")));
    setdynamicdvar(@"hash_e47f7f1502e4292e", default_to(revivetimeout, getmatchrulesdata("commonOption", "teamReviveTimeout")));
    level.teamReviveHealth = default_to(revivehealth, 40);
    level.teamReviveTime = default_to(revivetime, 3);
    level.teamReviveTimeout = default_to(revivetimeout, 0);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10a6
// Size: 0x7
function function_692cdf5f87a8667b() {
    return "cyber_revive_icon";
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b6
// Size: 0x3a
function onplayerconnect() {
    level endon("game_ended");
    while (true) {
        level waittill("connected", player);
        player.numrevives = level.numrevives;
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10f8
// Size: 0xb
function onteamchangedeath(player) {
    
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x110b
// Size: 0x57
function function_5343ecb486b66bf1(ref, cb) {
    assert(isdefined(ref) && isdefined(cb));
    if (!isdefined(level.var_423c8d4f74c71873)) {
        level.var_423c8d4f74c71873 = [];
    }
    if (!isdefined(level.var_423c8d4f74c71873[ref])) {
        level.var_423c8d4f74c71873[ref] = cb;
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116a
// Size: 0x3e
function function_34727d1cdc47572e(ref) {
    assert(isdefined(ref));
    if (isdefined(level.var_423c8d4f74c71873) && isdefined(level.var_423c8d4f74c71873[ref])) {
        level.var_423c8d4f74c71873[ref] = undefined;
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b0
// Size: 0xe7
function updaterevivetriggerspawnposition() {
    if (istrue(level.var_b961dd6c88e9a008)) {
        return;
    }
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (istrue(level.var_faec6e12b831873d)) {
        self waittill("spawned_player");
    } else if (!istrue(scripts\mp\flags::gameflag("prematch_done"))) {
        if (gameflag("infil_will_run")) {
            level waittill_any_3("prematch_done", "start_mode_setup", "infil_started");
            time = int(max(level.prematchperiodend - 5, 5));
            wait time;
        } else {
            level waittill_any_3("prematch_done", "start_mode_setup", "match_start_real_countdown");
        }
    }
    while (isreallyalive(self) || istrue(self.liveragdoll)) {
        if (!istrue(self.var_908f8ac4bbcdb65e) && isvalidrevivetriggerspawnposition()) {
            setvalidreviveposition();
        }
        wait 1;
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x129f
// Size: 0x12b
function setvalidreviveposition() {
    if (istrue(level.var_b961dd6c88e9a008)) {
        return;
    }
    revivepos = self.origin;
    nearestnode = undefined;
    if (istrue(level.var_faec6e12b831873d)) {
        revivepos = self.origin;
    } else if (isbot(self)) {
        nearestnode = self getnearestnode();
        if (!isdefined(nearestnode)) {
            revivepos = self.origin;
        } else {
            revivepos = nearestnode.origin;
        }
    } else {
        nearestnode = self getnearestnode();
        if (!isdefined(nearestnode)) {
            nearestnode = self.origin;
        } else {
            nearestnode = nearestnode.origin;
        }
    }
    if (!isdefined(self.revivetriggerspawnposition)) {
        self.prevrevivepos = revivepos;
    } else {
        self.prevrevivepos = self.revivetriggerspawnposition;
    }
    self.revivetriggerspawnposition = revivepos;
    self.nearestrevivenodepos = nearestnode;
    self.wasinwater = self isswimming();
    stance = self getstance();
    if (stance == "prone") {
        self.faux_spawn_stance = stance;
        return;
    }
    self.faux_spawn_stance = "crouch";
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13d2
// Size: 0x104
function isvalidrevivetriggerspawnposition() {
    spawnpos = self.origin + (0, 0, 3);
    if (istrue(self.liveragdoll) || istrue(level.var_b961dd6c88e9a008)) {
        return 1;
    }
    if (istrue(level.var_faec6e12b831873d)) {
        var_c9ca2508e55c330a = 1;
    } else {
        var_c9ca2508e55c330a = canspawn(spawnpos);
    }
    if (var_c9ca2508e55c330a && (self isonground() || self isswimming()) && !scripts\mp\outofbounds::isoob(self)) {
        /#
            if (getdvarint(@"hash_cd46b66038189bc6", 0) == 1) {
                sphere(self.origin, 200, (0, 1, 0), 0, 20);
            }
        #/
        return 1;
    }
    /#
        if (getdvarint(@"hash_cd46b66038189bc6", 0) == 1) {
            sphere(self.origin, 200, (1, 0, 0), 0, 30);
        }
    #/
    return 0;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14de
// Size: 0x84a
function spawnrevivetrigger(victim, attacker, victimnotification, meansofdeath) {
    level endon("game_ended");
    victim endon("spawned");
    victim endon("disconnect");
    reviveorg = victim.origin;
    if (isdefined(victim.revivecount) && isdefined(level.var_37baab13a0cf00e3) && victim.revivecount >= level.var_37baab13a0cf00e3) {
        return;
    }
    if (istrue(victim.var_908f8ac4bbcdb65e)) {
        return;
    }
    if (victim GetCameraThirdPerson()) {
        victim.var_436ac476c6cc0d0d = 1;
    } else {
        victim.var_436ac476c6cc0d0d = undefined;
    }
    victim.pers["useNVG"] = 0;
    if (victim isnightvisionon()) {
        victim.pers["useNVG"] = 1;
    }
    shouldspawnrevivetrigger = !isdefined(attacker) || !isdefined(attacker.classname) || attacker.classname != "trigger_hurt";
    if (istrue(shouldspawnrevivetrigger) && istrue(level.numlifelimited)) {
        waitframe();
        shouldspawnrevivetrigger = !isreallyalive(victim) && !istrue(victim.inlaststand) && !istrue(victim.switching_teams);
        if (istrue(level.var_faec6e12b831873d)) {
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_teammate_down", victim.team, 1);
        } else {
            shouldspawnrevivetrigger = shouldspawnrevivetrigger && !victim scripts\mp\playerlogic::mayspawn();
        }
    }
    timeleft = level.teamReviveTimeout;
    /#
        if (!isusingmatchrulesdata()) {
            timeleft = scripts\mp\utility\dvars::getwatcheddvar("<dev string:x1c>");
            if (!isdefined(timeleft)) {
                timeleft = getdvarfloat(@"hash_e47f7f1502e4292e", scripts\mp\laststand::getdefaultlaststandtimervalue());
            }
        }
    #/
    if (isdefined(timeleft) && timeleft != 0) {
        victim.teamReviveTimeout = timeleft;
    }
    if (victim isusingremote()) {
        victim.revivetriggerblockedinremote = 1;
        victim waittill("stopped_using_remote");
        victim.revivetriggeravailable = 1;
    } else {
        victim.revivetriggeravailable = 1;
        wait 3;
    }
    if (istrue(victim.teamReviveTimeout)) {
        victim thread revivetimeoutthink(timeleft);
    }
    var_f2d86b895bbe2c87 = isdefined(level.pleaForHelp) && !istrue(level.pleaForHelp.var_ab651cb230f0d65);
    shouldspawnrevivetrigger = shouldspawnrevivetrigger && !(var_f2d86b895bbe2c87 && function_957a13a14cdab289(victim));
    if (!shouldspawnrevivetrigger) {
        return;
    }
    if (isagent(victim) || !isdefined(victim)) {
        return;
    } else {
        if (!isdefined(victim.revive_chosenclass)) {
            victim.revive_chosenclass = victim.class;
        }
        struct = victim scripts\mp\class::loadout_getorbuildclassstruct(victim.revive_chosenclass);
        var_1583b947947ad005 = victim scripts\mp\playerlogic::getplayerassets(struct);
        victim scripts\mp\playerlogic::loadplayerassets([var_1583b947947ad005], 1);
    }
    if (isdefined(attacker) && isagent(attacker)) {
        attacker = attacker.owner;
    }
    usetime = level.teamReviveTime;
    /#
        if (!isusingmatchrulesdata()) {
            usetime = scripts\mp\utility\dvars::getwatcheddvar("<dev string:x31>");
            if (!isdefined(usetime)) {
                usetime = getdvarfloat(@"hash_af65c14c83826cfa", scripts\mp\laststand::getdefaultlaststandrevivetimervalue());
            }
        }
    #/
    if (!isdefined(level.var_5ecf502dc8c87bbb)) {
        level.var_5ecf502dc8c87bbb = 30;
    }
    if (istrue(level.var_b961dd6c88e9a008)) {
        reviveorg = victim.origin + (0, 0, level.var_5ecf502dc8c87bbb);
    } else {
        if (isdefined(victim.attacker) && isdefined(victim.attacker.classname) && victim.attacker.classname == "trigger_hurt" && isdefined(victim.nearestrevivenodepos)) {
            reviveorg = victim.nearestrevivenodepos;
        } else if (isdefined(victim.revivetriggerspawnposition)) {
            if (!istrue(victim.wasinwater)) {
                reviveorg = drop_to_ground(victim.revivetriggerspawnposition, 50, undefined, undefined, scripts\engine\trace::create_world_contents()) + (0, 0, 8);
            }
        } else {
            node = victim getnearestnode();
            if (isdefined(node)) {
                reviveorg = node.origin;
            } else {
                reviveorg = victim.origin;
            }
        }
        content = scripts\engine\trace::create_playerclip_contents();
        trace = scripts\engine\trace::sphere_trace(reviveorg + (0, 0, 10), reviveorg + (0, 0, 30), 2, undefined, content, 1);
        reviveorg = trace["position"];
    }
    icon = spawnscriptable("cyber_revive_icon", reviveorg);
    victim thread addtriggerdeathicon(icon, victim, victim.team);
    icon.victim = victim;
    icon.curorigin = reviveorg;
    icon.deadplayer = victim;
    icon.owner = victim;
    icon.ownerteam = victim.team;
    icon.curprogress = 0;
    icon.id = "laststand_reviver";
    icon.var_dbc472744080c5d7 = 1;
    icon.waitforweapononuse = 0;
    icon.interactteam = "friendly";
    icon.resetprogress = 0;
    icon.defaultusetime = usetime;
    icon.userate = 1;
    icon.exclusiveuse = 0;
    icon.exclusiveclaim = 1;
    icon.skiptouching = 1;
    icon.skipminimapids = 1;
    icon.useweapon = makeweapon("teammate_revive_stim_mp");
    icon.var_b9abe6bdf97e9a79 = 14400;
    if (istrue(level.var_b961dd6c88e9a008)) {
        icon utility::function_6e506f39f121ea8a(victim, (0, 0, level.var_5ecf502dc8c87bbb));
    }
    icon scripts\mp\gameobjects::setusetime(usetime);
    icon function_9cdce27af3d1224c(victim.team, istrue(level.numrevives));
    icon.onbeginuse = &revivetriggerholdonusebegin;
    icon.onuse = &revivetriggerholdonuse;
    icon.onenduse = &revivetriggerholdonuseend;
    icon.cantuse = &revivetriggeroncantuse;
    if (isdefined(attacker)) {
        icon.attacker = attacker;
        icon.attackerteam = attacker.team;
    }
    level.revivetriggers[victim.guid] = icon;
    victim.forcespawnorigin = reviveorg;
    victim.forcespawnangles = victim.angles;
    victim thread revivetriggerteamupdater(level.revivetriggers[victim.guid]);
    victim thread revivetriggerspectateteamupdater(level.revivetriggers[victim.guid]);
    victim thread function_4a3b25b6b877fe73(victim, level.revivetriggers[victim.guid]);
    level notify(victimnotification, icon);
    level notify("player_last_stand");
    victim setbeingrevivedinternal(0);
    if (istrue(level.numlifelimited)) {
        victim.statusicon = "hud_status_revive_wh";
    }
    if (isdefined(level.var_423c8d4f74c71873)) {
        foreach (cb in level.var_423c8d4f74c71873) {
            if (isdefined(cb)) {
                icon [[ cb ]]();
            }
        }
    }
    /#
        victim thread selfrevive();
    #/
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d30
// Size: 0x1d
function makereviveteamusable(team, limitedrevives) {
    thread function_9cdce27af3d1224c(team, limitedrevives);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1d55
// Size: 0x184
function private function_9cdce27af3d1224c(team, limitedrevives, var_6b8279c8c2796cd4) {
    if (!isdefined(self)) {
        return;
    }
    self.ownerteam = team;
    if (istrue(level.var_a52a7cf832d13dad) && namespace_ca7b90256548aa40::issquadmode() && isdefined(self.objidnum)) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefromall(self.objidnum);
    }
    foreach (player in level.players) {
        if (!limitedrevives) {
            player.numrevives = 1;
        }
        if (player.team == team && player.numrevives) {
            if (istrue(level.var_a52a7cf832d13dad) && namespace_ca7b90256548aa40::issquadmode()) {
                if (squad_utility::function_9b1d18c04d310cfc(self.victim, player)) {
                    if (isdefined(self.objidnum)) {
                        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.objidnum, player);
                    }
                    self enablescriptableplayeruse(player);
                } else {
                    if (isdefined(self.objidnum)) {
                        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(self.objidnum, player);
                    }
                    self disablescriptableplayeruse(player);
                }
            } else if (isdefined(var_6b8279c8c2796cd4) && player == var_6b8279c8c2796cd4) {
                thread function_3679ae96cc4f6706(var_6b8279c8c2796cd4);
            } else {
                self enablescriptableplayeruse(player);
            }
            continue;
        }
        self disablescriptableplayeruse(player);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee1
// Size: 0x82
function function_3679ae96cc4f6706(player) {
    if (!isdefined(player) || !isdefined(self) || !isdefined(self.deadplayer)) {
        return;
    }
    self.deadplayer endon("trigger_removed");
    self endon("death");
    level endon("game_ended");
    self disablescriptableplayeruse(player);
    wait getdvarfloat(@"hash_5562e729a78adfc4", 0.5);
    if (!isdefined(player) || !isdefined(self) || !isdefined(self.deadplayer)) {
        return;
    }
    self enablescriptableplayeruse(player);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f6b
// Size: 0x2a3
function revivetimeoutthink(timeleft) {
    self endon("death_or_disconnect");
    self endon("last_stand_finished");
    self endon("trigger_removed");
    self endon("spawned");
    level endon("game_ended");
    self endon("team_eliminated");
    if (timeleft == 0) {
        return;
    }
    namespace_446fc987a980892f::playevent("squad_revive", scripts\mp\utility\teams::getsquadmates(self.team, self.sessionsquadid, 1));
    waitcondition = "";
    if (isdefined(level.revivetriggers)) {
        waitcondition = level.revivetriggers[self.guid];
    }
    level waittill("new_trigger_spawned", waitcondition);
    startduration = timeleft;
    while (true) {
        waitframe();
        timeleftmax = timeleft;
        if (!istrue(getbeingrevivedinternal())) {
            timeleft -= level.framedurationseconds;
            self.timelefttospawnaction = timeleft;
            self setclientomnvar("ui_securing_progress", min(timeleft / timeleftmax, 0.01));
            self setclientomnvar("ui_securing", 0);
        }
        if (level.teamdata[self.team]["aliveCount"] > 0) {
            time = int(gettime() + timeleft * 1000);
            setlowermessageomnvar("spawn_revive_wait", time);
            function_fd4841a123583725(self, self.team, time);
        }
        if (istrue(self.eliminated)) {
            thread removetrigger(self.guid, 1);
            self.timelefttospawnaction = 0;
            self notify("task_endon_trigger_removed");
            return;
        }
        if (timeleft <= level.framedurationseconds) {
            self notify("last_stand_bleedout");
            thread removetrigger(self.guid, 1, 1);
            if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || scripts\cp_mp\utility\game_utility::isbrstylegametype() && istrue(level.var_faec6e12b831873d)) {
                setlowermessageomnvar("player_eliminated");
                thread scripts\mp\playerlogic::removespawnmessageshortly(3);
            } else {
                setlowermessageomnvar("spawn_next_round");
                thread scripts\mp\playerlogic::removespawnmessageshortly(3);
            }
            self.timelefttospawnaction = 0;
            self notify("task_endon_trigger_removed");
            break;
        }
        if (istrue(self.beingrallyrespawned)) {
            thread removetrigger(self.guid, 1);
            setlowermessageomnvar("clear_lower_msg");
            break;
        }
    }
    namespace_446fc987a980892f::playevent("squad_mate_eliminated", scripts\mp\utility\teams::getsquadmates(self.team, self.sessionsquadid, 1));
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2216
// Size: 0xbb
function function_fd4841a123583725(player, team, time, squadmemberindex) {
    if (isdefined(player.var_3f78c6a0862f9e25) && player.var_3f78c6a0862f9e25 < namespace_9bb409deb69fb31d::function_9be60342a8babba5() && isdefined(team)) {
        foreach (teammember in level.teamdata[team]["players"]) {
            teammember setclientomnvar("ui_cyber_revive_timeout_squad_index_" + player.var_3f78c6a0862f9e25, time);
        }
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x22d9
// Size: 0x135
function removetrigger(guid, var_3737240cefe2c793, var_efc3f7a85cdedb9b, team, squadmemberindex) {
    if (!isdefined(team)) {
        team = self.team;
    }
    if (isdefined(self.statusicon)) {
        self.statusicon = "";
    }
    function_fd4841a123583725(self, team, 0, squadmemberindex);
    self.revivetriggeravailable = undefined;
    self notify("trigger_removed");
    if (isdefined(guid) && isdefined(level.revivetriggers) && isdefined(level.revivetriggers[guid])) {
        scriptable = level.revivetriggers[guid];
        if (isdefined(scriptable.objidnum)) {
            scripts\mp\objidpoolmanager::returnobjectiveid(level.revivetriggers[guid].objidnum);
        }
        if (isdefined(scriptable.reviver)) {
            scriptable notify("disabled");
            waitframe();
        }
        level.revivetriggers[guid] notify("death");
        level.revivetriggers[guid] freescriptable();
        level.revivetriggers[guid] = undefined;
        if (isdefined(var_efc3f7a85cdedb9b)) {
            self.forcespawnorigin = undefined;
            self.forcespawnangles = undefined;
        }
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2416
// Size: 0x74
function relocatetrigger(pos) {
    org = pos + (0, 0, 5);
    icon = level.revivetriggers[self.guid];
    icon.destination = org;
    icon.curorigin = org;
    icon.origin = org;
    self.forcespawnorigin = org;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2492
// Size: 0x5b
function function_4a3b25b6b877fe73(player, revivetrigger) {
    level endon("game_ended");
    player endon("trigger_removed");
    revivetrigger endon("death");
    while (true) {
        player waittill_any_2("joined_team", "refresh_revives");
        if (!isdefined(revivetrigger)) {
            return;
        }
        revivetrigger function_ffc734bc64e389b(player.team);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24f5
// Size: 0x87
function function_ffc734bc64e389b(team) {
    self disableplayeruseforallplayers();
    teamplayers = scripts\mp\utility\teams::getteamdata(team, "players");
    foreach (levelplayer in teamplayers) {
        if (isdefined(levelplayer)) {
            if (levelplayer != self.owner) {
                self enableplayeruse(levelplayer);
            }
        }
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2584
// Size: 0x83
function revivetriggerteamupdater(revivetrigger) {
    level endon("game_ended");
    self endon("trigger_removed");
    revivetrigger endon("death");
    team = self.team;
    squadmemberindex = self.var_3f78c6a0862f9e25;
    guid = self.guid;
    while (true) {
        waittill_any_2("disconnect", "spawned");
        thread removetrigger(guid, 1, 1, team, squadmemberindex);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x260f
// Size: 0x57
function revivetriggerspectateteamupdater(revivetrigger) {
    level endon("game_ended");
    self endon("trigger_removed");
    revivetrigger endon("death");
    while (true) {
        self waittill("joined_spectators");
        if (self.team == "spectator") {
            thread removetrigger(self.guid, 1, 1);
        }
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x266e
// Size: 0x86
function onrevivepickupevent(event, victim) {
    level endon("game_ended");
    self endon("disconnect");
    while (!isdefined(self.pers)) {
        waitframe();
    }
    points = scripts\mp\rank::getscoreinfovalue(event);
    if (isdefined(victim) && istrue(victim.suicidespawndelay)) {
        points = 0;
    }
    if (isdefined(victim) && self.team == victim.team) {
        thread doScoreEvent(event, undefined, points);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26fc
// Size: 0x24f
function lifelimitedallyonuse(player) {
    if (istrue(level.numrevives)) {
        player.numrevives--;
    }
    if (isdefined(player.pers["rescues"])) {
        player.pers["rescues"]++;
        player scripts\mp\persistence::statsetchild("round", "rescues", player.pers["rescues"]);
        switch (getgametype()) {
        case #"hash_53825b446469ac4c":
        case #"hash_75b6db03edb1e84e":
        case #"hash_eb5e5f470e0c1dc2":
        case #"hash_fa37b7f6bd6f6cbf":
        case #"hash_fa50baf6bd82f930":
            player setextrascore1(player.pers["rescues"]);
            break;
        }
    }
    skipplayers = [];
    skipplayers[skipplayers.size] = self.victim;
    if (isdefined(self.victim)) {
        level notify("tr_player_respawned", self.victim);
        self.victim notify("tr_respawned", player);
        self.victim thread scripts\mp\rank::scoreeventpopup(#"revived");
        self.victim scripts\mp\utility\dialog::leaderdialogonplayer("revived");
        if (!level.gameended) {
            self.victim _freezecontrols(0, undefined, "teamRevive");
            if (istrue(self.laststanding)) {
                incpersstat("clutchRevives", 1);
            }
            scripts\mp\teamrevive::finishrevive(self.victim);
        }
        self.victim.revivetriggeravailable = undefined;
        self.victim.statusicon = "";
        scripts\cp_mp\challenges::onplayerteamrevive(player, self.victim);
    }
    player thread onrevivepickupevent(#"reviver", self.victim);
    if (!isdefined(player.rescuedplayers)) {
        player.rescuedplayers = [];
    }
    player.rescuedplayers[self.victim.guid] = 1;
    scripts\mp\events::revivedplayer(player, self.victim);
    self.victim scripts\mp\killstreaks\killstreaks::function_b7492842aad6fe82();
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2953
// Size: 0x5f
function finishrevive(player) {
    /#
        level.var_76f92a587185677c = getdvarint(@"hash_aa7dbb144027705f", 0) == 1;
    #/
    if (istrue(level.var_76f92a587185677c) && player namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
        player thread scripts\mp\laststand::laststandthink();
        return;
    }
    player setbeingrevivedinternal(0);
    player thread respawn();
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29ba
// Size: 0x144
function lifelimitedenemyonuse(player) {
    if (isdefined(self.victim)) {
        self.victim thread scripts\mp\hud_message::showsplash("sr_eliminated");
        level notify("sr_player_eliminated", self.victim);
    }
    skipplayers = [];
    skipplayers[skipplayers.size] = self.victim;
    scripts\mp\hud_message::notifyteam("sr_ally_eliminated", "sr_enemy_eliminated", self.victim.team, skipplayers);
    if (isdefined(self.victim)) {
        if (!level.gameended) {
            self.victim setlowermessageomnvar("spawn_next_round");
            self.victim thread scripts\mp\playerlogic::removespawnmessageshortly(3);
        }
        self.victim.revivetriggeravailable = undefined;
        self.victim.statusicon = "hud_status_dead";
    }
    if (isdefined(self.attacker) && self.attacker != player) {
        self.attacker thread onrevivepickupevent(#"kill_confirmed");
    }
    player thread onrevivepickupevent(#"kill_confirmed");
    player scripts\mp\utility\dialog::leaderdialogonplayer("kill_confirmed");
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b06
// Size: 0x5c
function respawn() {
    if (isdefined(level.var_c0c96e1450994eaf)) {
        self [[ level.var_c0c96e1450994eaf ]]();
        return;
    }
    self.alreadyaddedtoalivecount = 1;
    scripts\mp\playerlogic::incrementalivecount(self.team, 1, "teamrevive");
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        scripts\mp\gametypes\br_utility::unmarkplayeraseliminated(self);
    }
    thread scripts\mp\playerlogic::waittillcanspawnclient(1);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6a
// Size: 0x1a4
function revivetriggerholdonuse(player) {
    if (isdefined(player.owner)) {
        player = player.owner;
    }
    if (player.pers["team"] == self.ownerteam || istrue(self.var_c0ee3288dbec12c6)) {
        if (isdefined(self.victim) && isdefined(self.victim.body) && !istrue(self.victim.liveragdoll)) {
            self.victim.body delete();
        }
        if (function_1823ff50bb28148d(getgametype()) == #"ko") {
            self.victim playsoundtoteam("jup_shared_team_revived", player.team);
        }
        player incpersstat("denied", 1);
        player scripts\mp\persistence::statsetchild("round", "denied", player.pers["denied"]);
        if (istrue(level.numlifelimited)) {
            lifelimitedallyonuse(player);
        } else {
            lifelimitedallyonuse(player);
        }
    } else if (istrue(level.numlifelimited)) {
        lifelimitedenemyonuse(player);
        player setlowermessageomnvar("spawn_next_round");
    }
    player setclientomnvar("ui_securing", 0);
    player setclientomnvar("ui_securing_progress", 0.01);
    player.ui_securing = undefined;
    self.victim thread removetrigger(self.victim.guid);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2d16
// Size: 0xf0
function function_301c4ec489f9bd39(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(instance) || !isdefined(instance.deadplayer) || !isdefined(player) || part != "cyber_revive_icon") {
        return;
    }
    if (!player isonground()) {
        if (!(istrue(instance.var_dbc472744080c5d7) && player isswimming())) {
            return;
        }
    }
    if (player function_e5bf22923d0004bc()) {
        return;
    }
    if (!scripts\engine\trace::ray_trace_detail_passed(player geteye(), instance.origin, [player, instance.deadplayer], scripts\engine\trace::create_contents(1, 0, 0, 0, 0, 1))) {
        player scripts\mp\hud_message::showerrormessage("MP/REVIVE_BLOCKED");
        return;
    }
    player namespace_1d863a7bbc05fc52::function_d9bd056c79a6077b(instance.deadplayer);
    instance thread scripts\mp\gameobjects::useholdloop(player);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e0e
// Size: 0x21c
function revivetriggerholdonusebegin(player, ignoreallows) {
    /#
        player notify("<dev string:x43>");
    #/
    thread function_877aee1f2cdae81c(player);
    deadplayer = self.deadplayer;
    if (!deadplayer namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
        player thread function_c86cf00d5859ce10(deadplayer.origin);
    }
    if (function_68ac13d2d66b844a()) {
        if (deadplayer.team == "allies") {
            level.numalliesbeingrevived++;
            setomnvar("ui_num_reviving_allies", level.numalliesbeingrevived);
        } else if (deadplayer.team == "axis") {
            level.var_36a249f46f4464a8++;
            setomnvar("ui_num_reviving_axis", level.var_36a249f46f4464a8);
        }
    }
    if (player _hasperk("specialty_medic")) {
        level.revivetriggers[deadplayer.guid].usetime = level.revivetriggers[deadplayer.guid].usetime * getdvarfloat(@"hash_6f08a22fd52e004c");
    }
    self setscriptablepartstate("cyber_revive_icon", "unusable");
    deadplayer.reviver = player;
    self.reviver = player;
    deadplayer setbeingrevivedinternal(1);
    var_8d4c493e675e384e = deadplayer namespace_833bd5cc623ca701::function_f0d1c9c39359efff();
    self.reviver setlaststandreviving(1, var_8d4c493e675e384e);
    level thread scripts\mp\battlechatter_mp::trysaylocalsound(player, #"bc_status_action_reviving");
    if (!istrue(ignoreallows) && !var_8d4c493e675e384e) {
        player thread allowedwhilereviving(0);
    }
    deadplayer printspawnmessage("teamrevive::reviveTriggerHoldOnUseBegin() Killcam SKIPPED");
    deadplayer notify("abort_killcam");
    deadplayer.cancelkillcam = 1;
    deadplayer _freezecontrols(1, undefined, "teamRevive");
    objidnum = level.revivetriggers[deadplayer.guid].objidnum;
    if (isdefined(objidnum)) {
        scripts\mp\objidpoolmanager::update_objective_icon(objidnum, "hud_icon_cyber_reviving");
    }
    thread function_c164fed51c204630(deadplayer, player);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3032
// Size: 0xec
function private function_c164fed51c204630(deadplayer, reviver) {
    deadplayer endon("disconnect");
    cameradata = getrevivecameradata(deadplayer, reviver);
    camerapos = cameradata.origin;
    cameraang = cameradata.angles;
    deadplayer.forcespawnangles = (0, cameraang[1], 0);
    waitframe();
    deadplayer.forcespectatorclient = deadplayer getentitynumber();
    waitframe();
    cameraent = utility::spawn_model("tag_origin", camerapos, cameraang);
    deadplayer.revivecameraent = cameraent;
    deadplayer cameralinkto(cameraent, "tag_origin", 1);
    if (!scripts\mp\utility\player::isreallyalive(deadplayer)) {
        deadplayer thread revivecamerapullin();
    }
    if (istrue(deadplayer.pers["useNVG"])) {
        deadplayer thread applynvgforrevive();
    }
    deadplayer thread runslamzoomonspawn();
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3126
// Size: 0x1f8
function function_c86cf00d5859ce10(target) {
    if (!isdefined(self) || !isplayer(self) || !isdefined(target)) {
        return;
    }
    if (getdvarint(@"hash_72771711644c3f78", 1) == 0) {
        return;
    }
    if (self isswimming()) {
        return;
    }
    if (isdefined(self.var_88f59c89f67e4385)) {
        self.var_88f59c89f67e4385 delete();
    }
    startangles = self getplayerangles();
    newangles = vectortoangles(vectornormalize(target - self geteye()));
    newangles *= (0, 1, 0);
    var_88f59c89f67e4385 = spawn("script_model", self.origin);
    var_88f59c89f67e4385.angles = startangles * (0, 1, 1);
    var_88f59c89f67e4385 setmodel("tag_origin");
    var_88f59c89f67e4385 rotateto(newangles, 0.4, 0.05);
    var_88f59c89f67e4385 thread function_7f0aebb7ad935939(self);
    self.var_88f59c89f67e4385 = var_88f59c89f67e4385;
    vectortotarget = target - self geteye();
    var_ae9d358478054782 = (target - self geteye()) * (1, 1, 0);
    if (length(var_ae9d358478054782) == 0) {
        var_ae9d358478054782 = (1, 1, 0);
    }
    var_ef1f66cebc32a99 = math::anglebetweenvectors(var_ae9d358478054782, vectortotarget);
    mover = self getmovingplatformparent();
    if (isdefined(mover)) {
        scripts\cp_mp\vehicles\vehicle_occupancy::function_3dfe65e73a7d0c86(self, mover);
        var_88f59c89f67e4385 linkto(mover);
    }
    if (self isragdoll()) {
        self function_d87e1768229d0e3e();
    }
    self playerlinktodelta(var_88f59c89f67e4385, "", 1, 30, 30, -1 * var_ef1f66cebc32a99 + 30, var_ef1f66cebc32a99 + 30, 0, 0, 0, 1, 0, 0.3, 0.3);
    if (isdefined(mover)) {
        thread function_34fd10b9791b7bb2(mover);
        return;
    }
    thread function_1012e32b79f1e975(target);
    thread function_d75bbd43c2e29f0c();
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3326
// Size: 0xf8
function function_34fd10b9791b7bb2(mover) {
    self endon("death_or_disconnect");
    self endon("stop_revive_pos_lerp");
    contents = physics_createcontents(["physicscontents_item", "physicscontents_glass", "physicscontents_vehicle", "physicscontents_vehicleclip", "physicscontents_playerclip"]);
    while (isdefined(self) && isdefined(self.origin)) {
        ignore = [];
        if (isdefined(mover)) {
            ignore[ignore.size] = mover;
            parent = mover getlinkedparent();
            if (isdefined(parent)) {
                ignore[ignore.size] = parent;
            }
            if (isdefined(mover.linked_model)) {
                ignore[ignore.size] = mover.linked_model;
            }
            ignore = array_combine_unique(ignore, mover getlinkedchildren());
        }
        if (!scripts\engine\trace::player_trace_passed(self.origin, self.origin, undefined, ignore, contents)) {
            self.var_a23f35f8460d8857 = 1;
            return;
        }
        waitframe();
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3426
// Size: 0x62
function function_d75bbd43c2e29f0c() {
    self endon("death_or_disconnect");
    self endon("stop_revive_pos_lerp");
    while (true) {
        self waittill("touch", vehicle);
        if (isdefined(vehicle) && vehicle scripts\cp_mp\vehicles\vehicle::isvehicle() && scripts\cp_mp\vehicles\vehicle_collision::function_6eb1fba746b72f46(vehicle) > 1 && scripts\cp_mp\vehicles\vehicle::vehicle_isenemytoplayer(vehicle, self)) {
            self.var_a23f35f8460d8857 = 1;
            return;
        }
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3490
// Size: 0x11e
function function_1012e32b79f1e975(target) {
    self endon("death");
    self endon("disconnect");
    self endon("stop_revive_pos_lerp");
    if (!getdvarint(@"hash_4e3b17ea9fda1521", 1)) {
        return;
    }
    radius = 30;
    radiussq = radius * radius;
    while (isdefined(self.var_88f59c89f67e4385) && distance2dsquared(target, self.origin) > radiussq) {
        dir = vectornormalize2(target - self.origin);
        step = 3;
        nextpos = self.var_88f59c89f67e4385.origin + dir * step;
        halfsize = self getboundshalfsize();
        radius = halfsize[0];
        height = 2 * halfsize[2];
        if (capsuletracepassed(nextpos + (0, 0, 1), radius, height, self, 0, 0)) {
            self.var_88f59c89f67e4385.origin = nextpos;
        }
        waitframe();
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35b6
// Size: 0x26
function function_7f0aebb7ad935939(player) {
    self endon("death");
    player waittill("disconnect");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35e4
// Size: 0x7f
function function_a3ffe1d08888c2() {
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    if (!isdefined(self.var_88f59c89f67e4385)) {
        return;
    }
    if (getdvarint(@"hash_72771711644c3f78", 1) == 0) {
        return;
    }
    self notify("stop_revive_pos_lerp");
    self unlink();
    function_5471a04faad16a00();
    mover = self.var_88f59c89f67e4385 getlinkedparent();
    self.var_88f59c89f67e4385 delete();
    scripts\cp_mp\vehicles\vehicle_occupancy::function_69f266af27c2689(self, mover);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x366b
// Size: 0x1f
function function_849e441cb5be1bda() {
    self endon("death_or_disconnect");
    while (!scripts\mp\utility\player::isreallyalive(self)) {
        waitframe();
    }
    self notify("revivedAlive");
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3692
// Size: 0xb9
function function_877aee1f2cdae81c(player) {
    if (!isdefined(player.revive_sfx)) {
        player.revive_sfx = spawn("script_origin", player.origin);
        player.revive_sfx linkto(player);
        player.revive_sfx playloopsound("br_reviver_use_lp");
        player waittill_any_3("stop_revive_sfx", "enter_live_ragdoll", "death_or_disconnect");
        player.revive_sfx stoploopsound("br_reviver_use_lp", 1);
        player.revive_sfx playsound("br_reviver_use_end");
        player.revive_sfx delete();
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3753
// Size: 0x53b
function revivetriggerholdonuseend(team, player, success, ignoreallows) {
    player notify("stop_revive_sfx");
    self.reviver setlaststandreviving(0);
    self.reviver = undefined;
    player function_a3ffe1d08888c2();
    if (isdefined(self)) {
        self.var_a23f35f8460d8857 = undefined;
    }
    if (isdefined(player)) {
        player.var_a23f35f8460d8857 = undefined;
    }
    player namespace_1d863a7bbc05fc52::function_42d99e200aa9762a(self.deadplayer);
    if (isdefined(self.deadplayer) && isdefined(level.revivetriggers) && isdefined(level.revivetriggers[self.deadplayer.guid])) {
        deadplayer = self.deadplayer;
        if (function_68ac13d2d66b844a()) {
            if (deadplayer.team == "allies") {
                level.numalliesbeingrevived--;
                if (level.numalliesbeingrevived < 0) {
                    level.numalliesbeingrevived = 0;
                }
                setomnvar("ui_num_reviving_allies", level.numalliesbeingrevived);
            } else if (deadplayer.team == "axis") {
                level.var_36a249f46f4464a8--;
                if (level.var_36a249f46f4464a8 < 0) {
                    level.var_36a249f46f4464a8 = 0;
                }
                setomnvar("ui_num_reviving_axis", level.var_36a249f46f4464a8);
            }
        }
        defaultusetime = level.revivetriggers[deadplayer.guid].defaultusetime;
        level.revivetriggers[deadplayer.guid] scripts\mp\gameobjects::setusetime(defaultusetime);
        deadplayer.forcespectatorclient = -1;
        if (success) {
            if (!isdefined(deadplayer.revivecount)) {
                deadplayer.revivecount = 1;
            } else {
                deadplayer.revivecount++;
            }
            if (isdefined(level.var_37baab13a0cf00e3)) {
                deadplayer scripts\mp\hud_message::showerrormessage("MP/NUM_REVIVES_LEFT", level.var_37baab13a0cf00e3 - deadplayer.revivecount);
            }
            healthvalue = scripts\mp\utility\dvars::getwatcheddvar("teamReviveHealth");
            scripts\mp\analyticslog::logevent_playerhealed(deadplayer, healthvalue, player);
            if (isdefined(level.var_36827f5d10328424) && scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                deadplayer thread function_849e441cb5be1bda();
                deadplayer thread [[ level.var_36827f5d10328424 ]]();
            }
            deadplayer playsoundtoteam("npc_breath_revive", deadplayer.team, deadplayer, deadplayer);
            deadplayer thread function_7dce7a3af5b0ce26();
            deadplayer setclientomnvar("ui_reviver_id", -1);
            deadplayer setclientomnvar("ui_securing", 0);
            if (function_7ba31cb6b21c346f() && player != deadplayer) {
                deadplayer thread function_36edf91561322753(2);
            }
        } else {
            deadplayer setbeingrevivedinternal(0);
            level.revivetriggers[deadplayer.guid] setscriptablepartstate("cyber_revive_icon", "usable");
            function_9cdce27af3d1224c(deadplayer.team, istrue(level.numrevives), player);
            objidnum = level.revivetriggers[deadplayer.guid].objidnum;
            if (isdefined(objidnum)) {
                scripts\mp\objidpoolmanager::objective_show_progress(objidnum, 0);
                scripts\mp\objidpoolmanager::update_objective_icon(objidnum, "hud_icon_revive_cyber");
            }
            deadplayer _freezecontrols(0, undefined, "teamRevive");
            deadplayer updatesessionstate("spectator");
            if (isdefined(deadplayer.revivecameraent)) {
                deadplayer cameraunlink();
                deadplayer.revivecameraent delete();
            }
            if (isdefined(deadplayer.team) && deadplayer.team != "spectator") {
                deadplayer allowspectateteam(deadplayer.team, 1);
                foreach (entry in level.teamnamelist) {
                    if (entry != deadplayer.team) {
                        deadplayer allowspectateteam(entry, 0);
                    }
                }
                deadplayer spectateclientnum(player getentitynumber());
            }
        }
    }
    if (!istrue(ignoreallows)) {
        player thread allowedwhilereviving(1);
    }
    if (isplayer(player)) {
        player setclientomnvar("ui_securing", 0);
        player setclientomnvar("ui_securing_progress", 0.01);
        player.ui_securing = undefined;
    }
    if (success) {
        player incpersstat("revives", 1);
        if (istrue(player.laststanding)) {
            player incpersstat("clutchRevives", 1);
        }
        player thread namespace_27c74152ccb91331::function_bd70b31dd13292bc(player);
        if (isdefined(self.deadplayer)) {
            self.deadplayer thread namespace_27c74152ccb91331::function_bd70a21dd1326d59(self.deadplayer);
            params = {#reviver:player};
            self.deadplayer callback::callback("player_team_revived", params);
        }
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c96
// Size: 0x18
function revivetriggeroncantuse(player) {
    player scripts\mp\hud_message::showerrormessage("MP/PLAYER_ALREADY_BEING_REVIVED");
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3cb6
// Size: 0x2bd
function getrevivecameradata(deadplayer, reviver) {
    promptpos = level.revivetriggers[deadplayer.guid].curorigin;
    if (istrue(level.var_b961dd6c88e9a008) && isdefined(deadplayer) && isdefined(deadplayer.origin)) {
        promptpos = deadplayer.origin;
    }
    corpsepos = promptpos;
    fwd = vectornormalize(reviver.origin - corpsepos);
    radius = 2;
    angstep = 30;
    maxsteps = 360 / angstep;
    failcount = 1;
    usepos = 1;
    cameradist = 200;
    baseang = generateaxisanglesfromforwardvector(fwd, (0, 0, 1));
    firstrun = 0;
    testvec = undefined;
    passed = 0;
    cameraposition = corpsepos;
    cameraangles = baseang;
    content = scripts\engine\trace::create_contents(0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1);
    while (failcount < maxsteps) {
        if (firstrun) {
            firstrun = 0;
            testvec = anglestoforward(baseang);
        } else {
            testvec = anglestoforward(baseang + (0, ter_op(usepos, angstep, angstep * -1) * failcount, 0));
            usepos = !usepos;
            if (usepos == 1) {
                failcount++;
            }
        }
        startpos = corpsepos + (0, 0, 12);
        endpos = corpsepos + testvec * cameradist + (0, 0, 100);
        var_2fc7b90001702e5c = [];
        var_2fc7b90001702e5c[0] = deadplayer;
        var_2fc7b90001702e5c[1] = reviver;
        trace = scripts\engine\trace::sphere_trace(startpos, endpos, radius, var_2fc7b90001702e5c, content);
        drawtime = 30;
        finalpos = trace["position"];
        adjusted = 0;
        if (trace["fraction"] < 1) {
            finalpos += testvec * radius;
            adjusted = 1;
        }
        if (trace["fraction"] > 0.99) {
            cameraposition = finalpos;
            cameraangles = vectortoangles(testvec);
            break;
        }
    }
    cameradata = spawnstruct();
    cameradata.origin = cameraposition;
    tocorpse = vectornormalize(corpsepos - cameraposition);
    cameradata.angles = vectortoangles(tocorpse);
    return cameradata;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f7c
// Size: 0xed
function revivecamerapullin(cameraent) {
    initialpos = self.revivecameraent.origin + anglestoforward(self.revivecameraent.angles) * 3;
    var_8569cbed694ec300 = self.revivecameraent.origin + anglestoforward(self.revivecameraent.angles) * 50;
    var_beaf249485a20bb7 = scripts\engine\trace::sphere_trace(initialpos, var_8569cbed694ec300, 2, undefined)["position"];
    duration = level.revivetriggers[self.guid].usetime / 1000;
    self.revivecameraent moveto(var_beaf249485a20bb7, duration, duration * 0.3, duration * 0.3);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4071
// Size: 0x1d
function applynvgforrevive() {
    self notify("stopNVGOnRevive");
    self endon("stopNVGOnRevive");
    wait 1;
    self nightvisionviewon(1);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4096
// Size: 0x28
function deleteonspawn(cameraent) {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("spawned_player");
    cameraent delete();
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40c6
// Size: 0x78
function allowedwhilereviving(isallowed) {
    if (!isallowed) {
        val::set("reviving", "melee", 0);
        val::set("reviving", "allow_jump", 0);
        val::set("reviving", "gesture", 0);
        val::set("reviving", "offhand_weapons", 0);
        val::set("reviving", "stance_change", 0);
        return;
    }
    val::reset_all("reviving");
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4146
// Size: 0x80
function movecameratorevivepos(var_9813182985677b23, finalangles, player) {
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 1, 0.5, 0.5);
    finalangles = (-9.5111, player.angles[1], 0);
    self rotateto(finalangles, 1, 0.5, 0.5);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41ce
// Size: 0x63
function function_7dce7a3af5b0ce26() {
    self endon("death_or_disconnect");
    wait 0.15;
    self.deathsdoorsfx = 0;
    self playlocalsound(ter_op(isfemale(), "Fem_breathing_better", "breathing_better"));
    self stoplocalsound("deaths_door_in");
    namespace_4887422e77f3514e::function_a2b4e6088394bade();
    self setentitysoundcontext("atmosphere", "");
    self enableplayerbreathsystem(1);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4239
// Size: 0x1b3
function addtriggerdeathicon(icon, dyingplayer, team) {
    dyingplayer endon("spawned_player");
    dyingplayer endon("disconnect");
    if (!level.teambased) {
        return;
    }
    waittillslowprocessallowed();
    if (!isdefined(icon)) {
        return;
    }
    if (!isdefined(self) || !isdefined(dyingplayer)) {
        return;
    }
    if (getdvar(@"ui_hud_showdeathicons") == "0") {
        return;
    }
    self notify("revived_death_icon");
    if (!isdefined(team) || team == "spectator") {
        return;
    }
    assert(isgameplayteam(team));
    objid = icon scripts\mp\objidpoolmanager::createobjective("hud_icon_revive_cyber");
    scripts\mp\objidpoolmanager::update_objective_position(objid, icon.origin);
    scripts\mp\objidpoolmanager::update_objective_state(objid, "current");
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(objid);
    if (namespace_ca7b90256548aa40::issquadmode()) {
        squadmembers = dyingplayer namespace_ca7b90256548aa40::getsquadmembers();
        foreach (player in squadmembers) {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(objid, player);
        }
    } else {
        scripts\mp\objidpoolmanager::objective_teammask_single(objid, team);
    }
    scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9(objid, 1);
    scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
    scripts\mp\objidpoolmanager::objective_set_play_outro(objid, 0);
    scripts\mp\objidpoolmanager::objective_show_progress(objid, 0);
    scripts\mp\objidpoolmanager::function_79a1a16de6b22b2d(objid, 14);
    objective_sethideelevation(objid, 1);
    icon.objidnum = objid;
    if (istrue(level.var_b961dd6c88e9a008)) {
        objective_onentity(objid, self);
        objective_setzoffset(objid, level.var_5ecf502dc8c87bbb);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43f4
// Size: 0x13a
function runslamzoomonspawn() {
    self notify("end_spawn_zoom");
    self endon("end_spawn_zoom");
    self endon("disconnect");
    level endon("game_ended");
    if (!scripts\mp\utility\player::isreallyalive(self)) {
        self waittill("spawned_player");
    }
    targetpos = self geteye();
    targetangles = self.angles;
    if (isdefined(self.revivecameraent)) {
        self cameralinkto(self.revivecameraent, "tag_origin", 1);
        self.revivecameraent moveto(targetpos, 0.25, 0.1, 0.1);
        self.revivecameraent rotateto(targetangles, 0.25, 0.1, 0.1);
    }
    wait 0.25;
    self visionsetnakedforplayer("", 0.1);
    if (istrue(self.var_436ac476c6cc0d0d)) {
        self setcamerathirdperson(1);
        self.var_436ac476c6cc0d0d = undefined;
    }
    self cameraunlink();
    if (isdefined(self.revivecameraent)) {
        self.revivecameraent delete();
    }
    wait 0.5;
    if (!function_7ba31cb6b21c346f()) {
        level thread scripts\mp\battlechatter_mp::trysaylocalsound(self, #"bc_status_player_revived", undefined, 1.25);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4536
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
    wait 0.4;
    overlay destroy();
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4616
// Size: 0x4c
function hasrevivetrigger(player) {
    if (isdefined(level) && isdefined(level.revivetriggers) && isdefined(player.guid) && isdefined(level.revivetriggers[player.guid])) {
        return true;
    }
    return false;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x466b
// Size: 0x79
function cleanuprevivetriggericons() {
    if (!isdefined(level) || !isdefined(level.revivetriggers)) {
        return;
    }
    foreach (trigger in level.revivetriggers) {
        if (isdefined(trigger)) {
            trigger freescriptable();
        }
    }
    level.revivetriggers = undefined;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46ec
// Size: 0x2
function updatetimerwaitforjoined() {
    
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46f6
// Size: 0x69
function assigntimervisibleteam(teams) {
    self.interactteams = teams;
    foreach (player in level.players) {
        applytimervisibleteam(player);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4767
// Size: 0x4a
function applytimervisibleteam(player) {
    if (player.team == self.ownerteam) {
        self.visuals[0] showtoplayer(player);
        return;
    }
    self.visuals[0] hidefromplayer(player);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47b9
// Size: 0x79
function waitrespawnbutton() {
    self endon("disconnect");
    self endon("started_spawnPlayer");
    self endon("team_eliminated");
    holdprogress = 0;
    while (true) {
        if (self usebuttonpressed()) {
            while (self usebuttonpressed()) {
                holdprogress += 0.05;
                if (holdprogress >= 1) {
                    break;
                }
                wait 0.05;
            }
            if (holdprogress >= 0.5) {
                holdprogress += 0.05;
            }
        }
        holdprogress = 0;
        wait 0.05;
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x483a
// Size: 0x6a
function function_68ac13d2d66b844a() {
    switch (getgametype()) {
    case #"hash_75b6db03edb1e84e":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_ec086b911c1011ec":
    case #"hash_fa37b7f6bd6f6cbf":
    case #"hash_fa50b0f6bd82e972":
        return true;
    default:
        return false;
    }
    return false;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48ad
// Size: 0x110
function function_855b084a3f053964(pos, optionalrange) {
    closest = undefined;
    closestdist = undefined;
    if (!isdefined(level.revivetriggers)) {
        return undefined;
    }
    foreach (revivetrigger in level.revivetriggers) {
        if (!isdefined(revivetrigger.deadplayer)) {
            continue;
        }
        if (revivetrigger.deadplayer.team != self.team) {
            continue;
        }
        if (!revivetrigger function_bb57ed6218a82d1c()) {
            continue;
        }
        dist = distance2d(pos, revivetrigger.origin);
        if (isdefined(optionalrange) && dist > optionalrange) {
            continue;
        }
        if (!isdefined(closest)) {
            closest = revivetrigger;
            closestdist = dist;
            continue;
        }
        if (dist < closestdist) {
            closest = revivetrigger;
            closestdist = dist;
        }
    }
    return closest;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49c6
// Size: 0x95
function function_15933e1583288208() {
    if (!isdefined(level.revivetriggers)) {
        return undefined;
    }
    foreach (revivetrigger in level.revivetriggers) {
        if (revivetrigger.owner.team != self.team) {
            continue;
        }
        if (revivetrigger.owner == self) {
            return revivetrigger;
        }
    }
    return undefined;
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a64
// Size: 0x13
function function_bb57ed6218a82d1c() {
    return self getscriptablepartstate("cyber_revive_icon") == "usable";
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 17, eflags: 0x0
// Checksum 0x0, Offset: 0x4a80
// Size: 0x2f6
function function_9341574d596e9d36(player, contents, containertype, deadplayerindex, weaponslotcontents, weaponslotobj, weaponslotclip, var_86b32aff94b5714e, var_275f4441ab7920c8, hasweaponcase, loadoutcontents, var_c299c08e4b8a8e56, var_a0e9fef038504bd0, var_fd8a9b46f4a1e27c, var_9d09471027604346, var_c31356a794d8cb46, var_ad7897ecdbcb63) {
    corpse = spawnscriptable("cyber_revive_pillage", player.origin + (0, 0, level.var_5ecf502dc8c87bbb));
    corpse utility::function_6e506f39f121ea8a(player, (0, 0, level.var_5ecf502dc8c87bbb));
    scripts\mp\gametypes\br_pickups::registerscriptableinstance(corpse);
    corpse.contents = contents;
    corpse.containertype = containertype;
    corpse.deadplayerindex = deadplayerindex;
    corpse.owner = player;
    corpse.weaponslotcontents = weaponslotcontents;
    corpse.weaponslotobj = weaponslotobj;
    corpse.weaponslotclip = weaponslotclip;
    corpse.var_275f4441ab7920c8 = var_275f4441ab7920c8;
    corpse.metadata = var_fd8a9b46f4a1e27c;
    corpse.var_86b32aff94b5714e = var_86b32aff94b5714e;
    corpse.var_ad7897ecdbcb63 = var_ad7897ecdbcb63;
    corpse.backpacksize = namespace_aead94004cf4c147::getPlayerBackpackSize(player);
    corpse.loadoutcontents = loadoutcontents;
    if (isdefined(var_c299c08e4b8a8e56) && isdefined(var_a0e9fef038504bd0)) {
        corpse.var_a06e7128c001851d = var_c299c08e4b8a8e56;
        corpse.var_a0e9fef038504bd0 = var_a0e9fef038504bd0;
        corpse.var_bb6791b7369ef71a = var_9d09471027604346;
        corpse.var_c31356a794d8cb46 = var_c31356a794d8cb46;
    }
    if (istrue(level.var_faec6e12b831873d)) {
        corpse.criticalitem = 1;
    }
    foreach (item in corpse.contents) {
        scripts\engine\utility::function_f3bb4f4911a1beb2(item["lootID"], "addedToContainer", corpse, player);
    }
    foreach (teammember in getteamdata(player.team, "players")) {
        corpse disablescriptableplayeruse(teammember);
    }
    player.var_6a4360dcf2a8f3d4 = corpse;
    player.var_6a4360dcf2a8f3d4.hidefromteam = 1;
    level thread function_d5c44af2144b00b3(player, player.attached_bag, corpse);
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d7e
// Size: 0x206
function function_d5c44af2144b00b3(deadplayer, model, corpse) {
    deadplayer endon("revivedAlive");
    corpse endon("death");
    if (isdefined(level.teamReviveTimeout) && level.teamReviveTimeout > 0) {
        deadplayer waittill_any_2("disconnect", "trigger_removed");
        if (isdefined(deadplayer) && !istrue(deadplayer.isdisconnecting) && isdefined(deadplayer.timelefttospawnaction) && deadplayer.timelefttospawnaction > 0) {
            return;
        }
    } else {
        deadplayer waittill("disconnect");
    }
    if (!isdefined(corpse)) {
        return;
    }
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    neworigin = drop_to_ground(corpse.origin) + (0, 0, 2);
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(neworigin, corpse.angles);
    scriptablename = namespace_aead94004cf4c147::function_432475069c798ddc(default_to(model, "parts_backpack_inventory_small"));
    spawnedbackpack = scripts\mp\gametypes\br_pickups::spawnpickup(scriptablename, dropinfo, 1);
    function_85b5becfebdc7b62(corpse, spawnedbackpack);
    if (isdefined(corpse.opener)) {
        spawnedbackpack setscriptablepartstate("body", "partially_opening_unusable");
        if (isdefined(corpse.opener.var_f2aa9ae949179907) && isdefined(corpse.opener.origin)) {
            corpse.opener.var_f2aa9ae949179907 = corpse.opener.origin;
        }
        scripts\mp\loot::function_30f5ea60517f9e06(corpse.opener, spawnedbackpack);
    } else {
        spawnedbackpack setscriptablepartstate("body", "closed_usable");
    }
    scripts\mp\gametypes\br_pickups::loothide(corpse, "body");
    if (function_957a13a14cdab289(deadplayer)) {
        [[ scripts\engine\utility::getsharedfunc("pleaForHelp", "UpdatePlayerPleaForAll") ]](deadplayer);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f8c
// Size: 0x236
function function_85b5becfebdc7b62(corpse, backpack) {
    backpack.contents = corpse.contents;
    backpack.containertype = corpse.containertype;
    backpack.deadplayerindex = corpse.deadplayerindex;
    backpack.owner = corpse.player;
    backpack.weaponslotcontents = corpse.weaponslotcontents;
    backpack.weaponslotobj = corpse.weaponslotobj;
    backpack.weaponslotclip = corpse.weaponslotclip;
    backpack.var_d636075065504b2b = corpse.var_d636075065504b2b;
    backpack.var_275f4441ab7920c8 = corpse.var_275f4441ab7920c8;
    backpack.metadata = corpse.var_fd8a9b46f4a1e27c;
    backpack.var_86b32aff94b5714e = corpse.var_86b32aff94b5714e;
    backpack.backpacksize = corpse.backpacksize;
    backpack.loadoutcontents = corpse.loadoutcontents;
    if (isdefined(corpse.var_a06e7128c001851d) && isdefined(corpse.var_a0e9fef038504bd0)) {
        backpack.var_a06e7128c001851d = corpse.var_a06e7128c001851d;
        backpack.var_a0e9fef038504bd0 = corpse.var_a0e9fef038504bd0;
        backpack.var_bb6791b7369ef71a = corpse.var_bb6791b7369ef71a;
        backpack.var_c31356a794d8cb46 = corpse.var_c31356a794d8cb46;
    }
    if (istrue(level.var_faec6e12b831873d)) {
        backpack.criticalitem = 1;
    }
    foreach (item in backpack.contents) {
        scripts\engine\utility::function_f3bb4f4911a1beb2(item["lootID"], "addedToContainer", backpack);
    }
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51ca
// Size: 0x32
function function_5b55070c02328ea7(corpse) {
    return isdefined(corpse) && isdefined(corpse.type) && corpse.type == "cyber_revive_pillage";
}

// Namespace teamrevive / scripts\mp\teamrevive
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5205
// Size: 0x2d
function function_957a13a14cdab289(player) {
    return scripts\mp\gametypes\br_gametypes::isfeatureenabled("pleaForHelp") && [[ scripts\engine\utility::getsharedfunc("pleaForHelp", "isPleading") ]](player);
}

/#

    // Namespace teamrevive / scripts\mp\teamrevive
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x523b
    // Size: 0x351
    function selfrevive() {
        level endon("<dev string:x62>");
        self notify("<dev string:x70>");
        self endon("<dev string:x70>");
        self endon("<dev string:x85>");
        while (true) {
            if (hasrevivetrigger(self)) {
                break;
            }
            wait 1;
        }
        while (hasrevivetrigger(self)) {
            if (getdvarint(@"hash_d475fd19488b5a6d", 0) == 1) {
                wait 1;
                spectatingplayer = self getspectatingplayer();
                foreach (player in level.players) {
                    if (isdefined(spectatingplayer)) {
                        if (player.team == self.team && isbot(player) && spectatingplayer == player) {
                            player setorigin(level.revivetriggers[self.guid].origin + (ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), 18));
                            self.reviver = player;
                            wait 0.5;
                            break;
                        }
                        continue;
                    }
                    if (player.team == self.team && isbot(player)) {
                        player setorigin(level.revivetriggers[self.guid].origin + (ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), 18));
                        self.reviver = player;
                        wait 0.5;
                        break;
                    }
                }
                if (isdefined(self.reviver)) {
                    presstime = level.revivetriggers[self.guid].usetime / 1000 + 1;
                    self.reviver botpressbutton("<dev string:x93>", presstime);
                    wait presstime + 0.5;
                    if (isdefined(level.revivetriggers[self.guid])) {
                        self.reviver botpressbutton("<dev string:x93>", presstime);
                    }
                    setdevdvar(@"hash_d475fd19488b5a6d", 0);
                    break;
                }
            } else if (getdvarint(@"hash_d475fd19488b5a6d", 0) == 2) {
                foreach (player in level.players) {
                    if (player ishost() && isdefined(level.revivetriggers[player.guid])) {
                        level.revivetriggers[player.guid] revivetriggerholdonuse(player);
                        setdevdvar(@"hash_d475fd19488b5a6d", 0);
                        break;
                    }
                }
            }
            wait 1;
        }
    }

    // Namespace teamrevive / scripts\mp\teamrevive
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5594
    // Size: 0x21e
    function function_c4c78f8ceb5aa5f9() {
        level endon("<dev string:x62>");
        self endon("<dev string:x85>");
        while (true) {
            if (getdvarint(@"hash_5265ad42b410556f", 0) == 1) {
                foreach (revivetrigger in level.revivetriggers) {
                    foreach (player in level.players) {
                        if (isbot(player) && isalive(player) && player.team == revivetrigger.ownerteam) {
                            forward = anglestoforward(player.angles);
                            finalposition = drop_to_ground(revivetrigger.deadplayer.origin) - forward * 60;
                            player setorigin(finalposition);
                            player botlookatpoint(drop_to_ground(revivetrigger.deadplayer.origin), 10, "<dev string:x9a>");
                            player botsetflag("<dev string:xab>", 1);
                            player botsetflag("<dev string:xbf>", 1);
                            self.reviver = player;
                            break;
                        }
                    }
                    wait 1;
                    if (isdefined(self.reviver)) {
                        presstime = revivetrigger.usetime / 1000 + 1;
                        self.reviver botpressbutton("<dev string:x93>", presstime);
                        wait presstime + 0.5;
                        if (isdefined(revivetrigger)) {
                            self.reviver botpressbutton("<dev string:x93>", presstime);
                        }
                        self.reviver botsetflag("<dev string:xbf>", 0);
                    }
                }
                setdevdvar(@"hash_5265ad42b410556f", 0);
            }
            wait 1;
        }
    }

#/
