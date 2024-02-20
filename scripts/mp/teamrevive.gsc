// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\usability.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\dvars.gsc;
#using script_396a814d39e7044f;
#using script_58be75c518bf0d40;
#using scripts\mp\tweakables.gsc;
#using script_3ff084f114b7f6c9;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\class.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_76cc264b397db9cb;
#using scripts\mp\rank.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_556b8aeaa691317f;
#using scripts\mp\hud_message.gsc;
#using script_a34750d17473c49;
#using script_2b264b25c7da0b12;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\mp\analyticslog.gsc;
#using script_189b67b2735b981d;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\loot.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace teamRevive;

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae7
// Size: 0x2b4
function init() {
    level.laststand = namespace_775507ba36294dfb::gettweakablevalue("player", "laststand");
    setomnvar("ui_last_stand_type", level.laststand);
    if (!isteamreviveenabled()) {
        return;
    }
    level.liveRagdollRevive = getmatchrulesdata("commonOption", "liveRagdollRevive");
    level.var_76f92a587185677c = getdvarint(@"hash_aa7dbb144027705f", 0) == 1;
    level.onteamchangedeath = &onteamchangedeath;
    level.revivetriggers = [];
    level.numlifelimited = getgametypenumlives();
    level.numrevives = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numRevives"), 0);
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
        namespace_76a219af07c28c13::registerTeamAssimilateCallback(&function_df4a3cff3137d441);
    }
    level.teamReviveHealth = getoverridedvarintexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_teamReviveHealth"), @"hash_a8543004b97470b5");
    if (level.teamReviveHealth > namespace_775507ba36294dfb::gettweakablevalue("player", "maxhealth")) {
        level.teamReviveHealth = namespace_775507ba36294dfb::gettweakablevalue("player", "maxhealth");
    }
    level.teamReviveTime = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_teamReviveTime"), @"hash_af65c14c83826cfa");
    level.teamReviveTimeout = getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_teamReviveTimeout"), @"hash_e47f7f1502e4292e");
    if (function_68ac13d2d66b844a()) {
        level.var_c7d5cde0cea88517 = 0;
        level.var_36a249f46f4464a8 = 0;
        setomnvar("ui_num_reviving_allies", 0);
        setomnvar("ui_num_reviving_axis", 0);
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("cyber_revive_icon", &function_301c4ec489f9bd39);
    level thread onplayerconnect();
    /#
        level thread function_c4c78f8ceb5aa5f9();
    #/
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda2
// Size: 0x25
function function_df4a3cff3137d441(player, oldteam, newteam) {
    player thread function_3dbfc03b90783f06();
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdce
// Size: 0x1f
function private function_3dbfc03b90783f06() {
    self.var_a23f35f8460d8857 = 1;
    waitframe();
    waittillframeend();
    if (isdefined(self)) {
        self.var_a23f35f8460d8857 = undefined;
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdf4
// Size: 0xc0
function function_66e35a0b8bd5c2a7(var_f9be23871287353a, revivetime, var_b7db26dee502ccb7) {
    setdynamicdvar(@"hash_a8543004b97470b5", function_53c4c53197386572(var_f9be23871287353a, getmatchrulesdata("commonOption", "teamReviveHealth")));
    setdynamicdvar(@"hash_af65c14c83826cfa", function_53c4c53197386572(revivetime, getmatchrulesdata("commonOption", "teamReviveTime")));
    setdynamicdvar(@"hash_e47f7f1502e4292e", function_53c4c53197386572(var_b7db26dee502ccb7, getmatchrulesdata("commonOption", "teamReviveTimeout")));
    level.teamReviveHealth = function_53c4c53197386572(var_f9be23871287353a, 40);
    level.teamReviveTime = function_53c4c53197386572(revivetime, 3);
    level.teamReviveTimeout = function_53c4c53197386572(var_b7db26dee502ccb7, 0);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebb
// Size: 0x8
function function_692cdf5f87a8667b() {
    return "cyber_revive_icon";
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecb
// Size: 0x3a
function onplayerconnect() {
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        player.numrevives = level.numrevives;
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0c
// Size: 0xc
function onteamchangedeath(player) {
    
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1f
// Size: 0x58
function function_5343ecb486b66bf1(ref, var_ce174178f5680dfc) {
    /#
        assert(isdefined(ref) && isdefined(var_ce174178f5680dfc));
    #/
    if (!isdefined(level.var_423c8d4f74c71873)) {
        level.var_423c8d4f74c71873 = [];
    }
    if (!isdefined(level.var_423c8d4f74c71873[ref])) {
        level.var_423c8d4f74c71873[ref] = var_ce174178f5680dfc;
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7e
// Size: 0x3f
function function_34727d1cdc47572e(ref) {
    /#
        assert(isdefined(ref));
    #/
    if (isdefined(level.var_423c8d4f74c71873) && isdefined(level.var_423c8d4f74c71873[ref])) {
        level.var_423c8d4f74c71873[ref] = undefined;
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc4
// Size: 0xe7
function updaterevivetriggerspawnposition() {
    if (istrue(level.var_b961dd6c88e9a008)) {
        return;
    }
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (istrue(level.var_faec6e12b831873d)) {
        self waittill("spawned_player");
    } else if (!istrue(namespace_4b0406965e556711::gameflag("prematch_done"))) {
        if (gameflag("infil_will_run")) {
            level waittill_any_3("prematch_done", "start_mode_setup", "infil_started");
            time = int(max(level.prematchperiodend - 5, 5));
            wait(time);
        } else {
            level waittill_any_3("prematch_done", "start_mode_setup", "match_start_real_countdown");
        }
    }
    while (isreallyalive(self) || istrue(self.liveRagdoll)) {
        if (!istrue(self.var_908f8ac4bbcdb65e) && isvalidrevivetriggerspawnposition()) {
            setvalidreviveposition();
        }
        wait(1);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b2
// Size: 0x12d
function setvalidreviveposition() {
    if (istrue(level.var_b961dd6c88e9a008)) {
        return;
    }
    revivepos = self.origin;
    var_e6874e9b453d7005 = undefined;
    if (istrue(level.var_faec6e12b831873d)) {
        revivepos = self.origin;
    } else if (isbot(self)) {
        var_e6874e9b453d7005 = self getnearestnode();
        if (!isdefined(var_e6874e9b453d7005)) {
            revivepos = self.origin;
        } else {
            revivepos = var_e6874e9b453d7005.origin;
        }
    } else {
        var_e6874e9b453d7005 = self getnearestnode();
        if (!isdefined(var_e6874e9b453d7005)) {
            var_e6874e9b453d7005 = self.origin;
        } else {
            var_e6874e9b453d7005 = var_e6874e9b453d7005.origin;
        }
    }
    if (!isdefined(self.revivetriggerspawnposition)) {
        self.prevrevivepos = revivepos;
    } else {
        self.prevrevivepos = self.revivetriggerspawnposition;
    }
    self.revivetriggerspawnposition = revivepos;
    self.nearestrevivenodepos = var_e6874e9b453d7005;
    self.var_eb67c9fa9e738ffc = self isswimming();
    stance = self getstance();
    if (stance == "prone") {
        self.faux_spawn_stance = stance;
    } else {
        self.faux_spawn_stance = "crouch";
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e6
// Size: 0x105
function isvalidrevivetriggerspawnposition() {
    spawnpos = self.origin + (0, 0, 3);
    if (istrue(self.liveRagdoll) || istrue(level.var_b961dd6c88e9a008)) {
        return 1;
    }
    if (istrue(level.var_faec6e12b831873d)) {
        var_c9ca2508e55c330a = 1;
    } else {
        var_c9ca2508e55c330a = canspawn(spawnpos);
    }
    if (var_c9ca2508e55c330a && (self isonground() || self isswimming()) && !namespace_d9c77dc2a6fe29c6::isoob(self)) {
        /#
            if (getdvarint(@"hash_cd46b66038189bc6", 0) == 1) {
                sphere(self.origin, 200, (0, 1, 0), 0, 20);
            }
        #/
        return 1;
    } else {
        /#
            if (getdvarint(@"hash_cd46b66038189bc6", 0) == 1) {
                sphere(self.origin, 200, (1, 0, 0), 0, 30);
            }
        #/
        return 0;
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f2
// Size: 0x857
function spawnrevivetrigger(victim, attacker, var_1202c39784b176e2, meansofdeath) {
    level endon("game_ended");
    victim endon("spawned");
    victim endon("disconnect");
    var_58ebb947acc56bf2 = victim.origin;
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
    var_94ec982aecf9a63c = !isdefined(attacker) || !isdefined(attacker.classname) || attacker.classname != "trigger_hurt";
    if (istrue(var_94ec982aecf9a63c) && istrue(level.numlifelimited)) {
        waitframe();
        var_94ec982aecf9a63c = !isreallyalive(victim) && !istrue(victim.inlaststand) && !istrue(victim.switching_teams);
        if (istrue(level.var_faec6e12b831873d)) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_teammate_down", victim.team, 1);
        } else {
            var_94ec982aecf9a63c = var_94ec982aecf9a63c && !victim namespace_99ac021a7547cae3::mayspawn();
        }
    }
    timeleft = level.teamReviveTimeout;
    /#
        if (!isusingmatchrulesdata()) {
            timeleft = namespace_296c793a004e81b3::getwatcheddvar("disconnect");
            if (!isdefined(timeleft)) {
                timeleft = getdvarfloat(@"hash_e47f7f1502e4292e", namespace_10260b963310d30e::getdefaultlaststandtimervalue());
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
        wait(3);
    }
    if (istrue(victim.teamReviveTimeout)) {
        victim thread revivetimeoutthink(timeleft);
    }
    var_f2d86b895bbe2c87 = isdefined(level.pleaForHelp) && !istrue(level.pleaForHelp.var_ab651cb230f0d65);
    var_94ec982aecf9a63c = var_94ec982aecf9a63c && !(var_f2d86b895bbe2c87 && function_957a13a14cdab289(victim));
    if (!var_94ec982aecf9a63c) {
        return;
    }
    if (isagent(victim) || !isdefined(victim)) {
        return;
    } else {
        if (!isdefined(victim.revive_chosenclass)) {
            victim.revive_chosenclass = victim.class;
        }
        struct = victim namespace_d19129e4fa5d176::loadout_getorbuildclassstruct(victim.revive_chosenclass);
        var_1583b947947ad005 = victim namespace_99ac021a7547cae3::getplayerassets(struct);
        victim namespace_99ac021a7547cae3::loadplayerassets([0:var_1583b947947ad005], 1);
    }
    if (isdefined(attacker) && isagent(attacker)) {
        attacker = attacker.owner;
    }
    usetime = level.teamReviveTime;
    /#
        if (!isusingmatchrulesdata()) {
            usetime = namespace_296c793a004e81b3::getwatcheddvar("ui_securing_progress");
            if (!isdefined(usetime)) {
                usetime = getdvarfloat(@"hash_af65c14c83826cfa", namespace_10260b963310d30e::getdefaultlaststandrevivetimervalue());
            }
        }
    #/
    if (!isdefined(level.var_5ecf502dc8c87bbb)) {
        level.var_5ecf502dc8c87bbb = 30;
    }
    if (istrue(level.var_b961dd6c88e9a008)) {
        var_58ebb947acc56bf2 = victim.origin + (0, 0, level.var_5ecf502dc8c87bbb);
    } else {
        if (isdefined(victim.attacker) && isdefined(victim.attacker.classname) && victim.attacker.classname == "trigger_hurt" && isdefined(victim.nearestrevivenodepos)) {
            var_58ebb947acc56bf2 = victim.nearestrevivenodepos;
        } else if (isdefined(victim.revivetriggerspawnposition)) {
            if (!istrue(victim.var_eb67c9fa9e738ffc)) {
                var_58ebb947acc56bf2 = drop_to_ground(victim.revivetriggerspawnposition, 50, undefined, undefined, namespace_2a184fc4902783dc::create_world_contents()) + (0, 0, 8);
            }
        } else {
            node = victim getnearestnode();
            if (isdefined(node)) {
                var_58ebb947acc56bf2 = node.origin;
            } else {
                var_58ebb947acc56bf2 = victim.origin;
            }
        }
        content = namespace_2a184fc4902783dc::create_playerclip_contents();
        trace = namespace_2a184fc4902783dc::sphere_trace(var_58ebb947acc56bf2 + (0, 0, 10), var_58ebb947acc56bf2 + (0, 0, 30), 2, undefined, content, 1);
        var_58ebb947acc56bf2 = trace["position"];
    }
    icon = spawnscriptable("cyber_revive_icon", var_58ebb947acc56bf2);
    victim thread addtriggerdeathicon(icon, victim, victim.team);
    icon.victim = victim;
    icon.curorigin = var_58ebb947acc56bf2;
    icon.var_f99d56bcb582a8ba = victim;
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
    icon namespace_19b4203b51d56488::setusetime(usetime);
    icon function_9cdce27af3d1224c(victim.team, istrue(level.numrevives));
    icon.onbeginuse = &revivetriggerholdonusebegin;
    icon.onuse = &revivetriggerholdonuse;
    icon.onenduse = &revivetriggerholdonuseend;
    icon.var_a03a7b21f00eae66 = &revivetriggeroncantuse;
    if (isdefined(attacker)) {
        icon.attacker = attacker;
        icon.attackerteam = attacker.team;
    }
    level.revivetriggers[victim.guid] = icon;
    victim.forcespawnorigin = var_58ebb947acc56bf2;
    victim.forcespawnangles = victim.angles;
    victim thread revivetriggerteamupdater(level.revivetriggers[victim.guid]);
    victim thread revivetriggerspectateteamupdater(level.revivetriggers[victim.guid]);
    victim thread function_4a3b25b6b877fe73(victim, level.revivetriggers[victim.guid]);
    level notify(var_1202c39784b176e2, icon);
    level notify("player_last_stand");
    victim setbeingrevivedinternal(0);
    if (istrue(level.numlifelimited)) {
        victim.statusicon = "hud_status_revive_wh";
    }
    if (isdefined(level.var_423c8d4f74c71873)) {
        foreach (var_ce174178f5680dfc in level.var_423c8d4f74c71873) {
            if (isdefined(var_ce174178f5680dfc)) {
                icon [[ var_ce174178f5680dfc ]]();
            }
        }
    }
    /#
        victim thread function_631c1846bd7412e2();
    #/
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b50
// Size: 0x1e
function makereviveteamusable(team, var_e4e6fa072697205d) {
    thread function_9cdce27af3d1224c(team, var_e4e6fa072697205d);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b75
// Size: 0x186
function private function_9cdce27af3d1224c(team, var_e4e6fa072697205d, var_6b8279c8c2796cd4) {
    if (!isdefined(self)) {
        return;
    }
    self.ownerteam = team;
    if (istrue(level.var_a52a7cf832d13dad) && namespace_ca7b90256548aa40::issquadmode() && isdefined(self.objidnum)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.objidnum);
    }
    foreach (player in level.players) {
        if (!var_e4e6fa072697205d) {
            player.numrevives = 1;
        }
        if (player.team == team && player.numrevives) {
            if (istrue(level.var_a52a7cf832d13dad) && namespace_ca7b90256548aa40::issquadmode()) {
                if (squad_utility::function_9b1d18c04d310cfc(self.victim, player)) {
                    if (isdefined(self.objidnum)) {
                        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objidnum, player);
                    }
                    self enablescriptableplayeruse(player);
                } else {
                    if (isdefined(self.objidnum)) {
                        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objidnum, player);
                    }
                    self disablescriptableplayeruse(player);
                }
            } else if (isdefined(var_6b8279c8c2796cd4) && player == var_6b8279c8c2796cd4) {
                thread function_3679ae96cc4f6706(var_6b8279c8c2796cd4);
            } else {
                self enablescriptableplayeruse(player);
            }
        } else {
            self disablescriptableplayeruse(player);
        }
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d02
// Size: 0x83
function function_3679ae96cc4f6706(player) {
    if (!isdefined(player) || !isdefined(self) || !isdefined(self.var_f99d56bcb582a8ba)) {
        return;
    }
    self.var_f99d56bcb582a8ba endon("trigger_removed");
    self endon("death");
    level endon("game_ended");
    self disablescriptableplayeruse(player);
    wait(getdvarfloat(@"hash_5562e729a78adfc4", 0.5));
    if (!isdefined(player) || !isdefined(self) || !isdefined(self.var_f99d56bcb582a8ba)) {
        return;
    }
    self enablescriptableplayeruse(player);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8c
// Size: 0x2a6
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
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("squad_revive", namespace_54d20dd0dd79277f::getSquadmates(self.team, self.var_ff97225579de16a, 1));
    waitcondition = "";
    if (isdefined(level.revivetriggers)) {
        waitcondition = level.revivetriggers[self.guid];
    }
    waitcondition = level waittill("new_trigger_spawned");
    var_ed7a934b078bd477 = timeleft;
    while (1) {
        waitframe();
        var_3495c59984396c4d = timeleft;
        if (!istrue(getbeingrevivedinternal())) {
            timeleft = timeleft - level.framedurationseconds;
            self.timelefttospawnaction = timeleft;
            self setclientomnvar("ui_securing_progress", min(timeleft / var_3495c59984396c4d, 0.01));
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
            if (getgametype() == "arm" || getgametype() == "conflict" || getgametype() == "risk" || namespace_36f464722d326bbe::isBRStyleGameType() && istrue(level.var_faec6e12b831873d)) {
                setlowermessageomnvar("player_eliminated");
                thread namespace_99ac021a7547cae3::removespawnmessageshortly(3);
            } else {
                setlowermessageomnvar("spawn_next_round");
                thread namespace_99ac021a7547cae3::removespawnmessageshortly(3);
            }
            self.timelefttospawnaction = 0;
            self notify("task_endon_trigger_removed");
            break;
        } else if (istrue(self.beingrallyrespawned)) {
            thread removetrigger(self.guid, 1);
            setlowermessageomnvar("clear_lower_msg");
            break;
        }
    }
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("squad_mate_eliminated", namespace_54d20dd0dd79277f::getSquadmates(self.team, self.var_ff97225579de16a, 1));
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2039
// Size: 0xbd
function function_fd4841a123583725(player, team, time, squadmemberindex) {
    if (isdefined(player.var_3f78c6a0862f9e25) && player.var_3f78c6a0862f9e25 < namespace_9bb409deb69fb31d::function_9be60342a8babba5() && isdefined(team)) {
        foreach (teammember in level.teamdata[team]["players"]) {
            teammember setclientomnvar("ui_cyber_revive_timeout_squad_index_" + player.var_3f78c6a0862f9e25, time);
        }
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20fd
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
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(level.revivetriggers[guid].objidnum);
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

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2239
// Size: 0x75
function relocatetrigger(pos) {
    org = pos + (0, 0, 5);
    icon = level.revivetriggers[self.guid];
    icon.destination = org;
    icon.curorigin = org;
    icon.origin = org;
    self.forcespawnorigin = org;
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b5
// Size: 0x5c
function function_4a3b25b6b877fe73(player, revivetrigger) {
    level endon("game_ended");
    player endon("trigger_removed");
    revivetrigger endon("death");
    while (1) {
        player waittill_any_2("joined_team", "refresh_revives");
        if (!isdefined(revivetrigger)) {
            return;
        }
        revivetrigger function_ffc734bc64e389b(player.team);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2318
// Size: 0x8a
function function_ffc734bc64e389b(team) {
    self disableplayeruseforallplayers();
    teamplayers = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    foreach (var_f4bd04319d625e44 in teamplayers) {
        if (isdefined(var_f4bd04319d625e44)) {
            if (var_f4bd04319d625e44 != self.owner) {
                self enableplayeruse(var_f4bd04319d625e44);
            }
        }
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a9
// Size: 0x85
function revivetriggerteamupdater(revivetrigger) {
    level endon("game_ended");
    self endon("trigger_removed");
    revivetrigger endon("death");
    team = self.team;
    squadmemberindex = self.var_3f78c6a0862f9e25;
    guid = self.guid;
    while (1) {
        waittill_any_2("disconnect", "spawned");
        thread removetrigger(guid, 1, 1, team, squadmemberindex);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2435
// Size: 0x58
function revivetriggerspectateteamupdater(revivetrigger) {
    level endon("game_ended");
    self endon("trigger_removed");
    revivetrigger endon("death");
    while (1) {
        self waittill("joined_spectators");
        if (self.team == "spectator") {
            thread removetrigger(self.guid, 1, 1);
        }
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2494
// Size: 0x86
function onrevivepickupevent(event, victim) {
    level endon("game_ended");
    self endon("disconnect");
    while (!isdefined(self.pers)) {
        waitframe();
    }
    points = namespace_62c556437da28f50::getscoreinfovalue(event);
    if (isdefined(victim) && istrue(victim.suicidespawndelay)) {
        points = 0;
    }
    if (isdefined(victim) && self.team == victim.team) {
        thread doScoreEvent(event, undefined, points);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2521
// Size: 0x24f
function lifelimitedallyonuse(player) {
    if (istrue(level.numrevives)) {
        player.numrevives--;
    }
    if (isdefined(player.pers["rescues"])) {
        player.pers["rescues"]++;
        player namespace_2685ec368e022695::statsetchild("round", "rescues", player.pers["rescues"]);
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
    var_4725e52b7c3aa25c = [];
    var_4725e52b7c3aa25c[var_4725e52b7c3aa25c.size] = self.victim;
    if (isdefined(self.victim)) {
        level notify("tr_player_respawned", self.victim);
        self.victim notify("tr_respawned", player);
        self.victim thread namespace_62c556437da28f50::scoreeventpopup(#"revived");
        self.victim namespace_944ddf7b8df1b0e3::leaderdialogonplayer("revived");
        if (!level.gameended) {
            self.victim _freezecontrols(0, undefined, "teamRevive");
            if (istrue(self.laststanding)) {
                incpersstat("clutchRevives", 1);
            }
            namespace_7db13bdf599e41a6::function_e95e29f24bf04c1b(self.victim);
        }
        self.victim.revivetriggeravailable = undefined;
        self.victim.statusicon = "";
        namespace_aad14af462a74d08::onplayerteamrevive(player, self.victim);
    }
    player thread onrevivepickupevent(#"reviver", self.victim);
    if (!isdefined(player.rescuedplayers)) {
        player.rescuedplayers = [];
    }
    player.rescuedplayers[self.victim.guid] = 1;
    namespace_391de535501b0143::revivedplayer(player, self.victim);
    self.victim namespace_58a74e7d54b56e8d::function_b7492842aad6fe82();
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2777
// Size: 0x60
function function_e95e29f24bf04c1b(player) {
    /#
        level.var_76f92a587185677c = getdvarint(@"hash_aa7dbb144027705f", 0) == 1;
    #/
    if (istrue(level.var_76f92a587185677c) && player namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
        player thread namespace_10260b963310d30e::laststandthink();
    } else {
        player setbeingrevivedinternal(0);
        player thread respawn();
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27de
// Size: 0x144
function lifelimitedenemyonuse(player) {
    if (isdefined(self.victim)) {
        self.victim thread namespace_44abc05161e2e2cb::showsplash("sr_eliminated");
        level notify("sr_player_eliminated", self.victim);
    }
    var_4725e52b7c3aa25c = [];
    var_4725e52b7c3aa25c[var_4725e52b7c3aa25c.size] = self.victim;
    namespace_44abc05161e2e2cb::notifyteam("sr_ally_eliminated", "sr_enemy_eliminated", self.victim.team, var_4725e52b7c3aa25c);
    if (isdefined(self.victim)) {
        if (!level.gameended) {
            self.victim setlowermessageomnvar("spawn_next_round");
            self.victim thread namespace_99ac021a7547cae3::removespawnmessageshortly(3);
        }
        self.victim.revivetriggeravailable = undefined;
        self.victim.statusicon = "hud_status_dead";
    }
    if (isdefined(self.attacker) && self.attacker != player) {
        self.attacker thread onrevivepickupevent(#"kill_confirmed");
    }
    player thread onrevivepickupevent(#"kill_confirmed");
    player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("kill_confirmed");
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2929
// Size: 0x5d
function respawn() {
    if (isdefined(level.var_c0c96e1450994eaf)) {
        self [[ level.var_c0c96e1450994eaf ]]();
    } else {
        self.alreadyaddedtoalivecount = 1;
        namespace_99ac021a7547cae3::incrementalivecount(self.team, 1, "teamrevive");
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(self);
        }
        thread namespace_99ac021a7547cae3::waittillcanspawnclient(1);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x298d
// Size: 0x1a5
function revivetriggerholdonuse(player) {
    if (isdefined(player.owner)) {
        player = player.owner;
    }
    if (player.pers["team"] == self.ownerteam || istrue(self.var_c0ee3288dbec12c6)) {
        if (isdefined(self.victim) && isdefined(self.victim.body) && !istrue(self.victim.liveRagdoll)) {
            self.victim.body delete();
        }
        if (function_1823ff50bb28148d(getgametype()) == #"hash_8be3907b5626c1f") {
            self.victim playsoundtoteam("jup_shared_team_revived", player.team);
        }
        player incpersstat("denied", 1);
        player namespace_2685ec368e022695::statsetchild("round", "denied", player.pers["denied"]);
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

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b39
// Size: 0xf1
function function_301c4ec489f9bd39(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(instance) || !isdefined(instance.var_f99d56bcb582a8ba) || !isdefined(player) || part != "cyber_revive_icon") {
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
    if (!namespace_2a184fc4902783dc::ray_trace_detail_passed(player geteye(), instance.origin, [0:player, 1:instance.var_f99d56bcb582a8ba], namespace_2a184fc4902783dc::create_contents(1, 0, 0, 0, 0, 1))) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/REVIVE_BLOCKED");
        return;
    }
    player namespace_1d863a7bbc05fc52::function_d9bd056c79a6077b(instance.var_f99d56bcb582a8ba);
    instance thread namespace_19b4203b51d56488::useholdloop(player);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c31
// Size: 0x21e
function revivetriggerholdonusebegin(player, var_f5a0530ce8d587b1) {
    /#
        player notify("disabled");
    #/
    thread function_877aee1f2cdae81c(player);
    var_f99d56bcb582a8ba = self.var_f99d56bcb582a8ba;
    if (!var_f99d56bcb582a8ba namespace_833bd5cc623ca701::function_f0d1c9c39359efff()) {
        player thread function_c86cf00d5859ce10(var_f99d56bcb582a8ba.origin);
    }
    if (function_68ac13d2d66b844a()) {
        if (var_f99d56bcb582a8ba.team == "allies") {
            level.var_c7d5cde0cea88517++;
            setomnvar("ui_num_reviving_allies", level.var_c7d5cde0cea88517);
        } else if (var_f99d56bcb582a8ba.team == "axis") {
            level.var_36a249f46f4464a8++;
            setomnvar("ui_num_reviving_axis", level.var_36a249f46f4464a8);
        }
    }
    if (player _hasperk("specialty_medic")) {
        level.revivetriggers[var_f99d56bcb582a8ba.guid].usetime = level.revivetriggers[var_f99d56bcb582a8ba.guid].usetime * getdvarfloat(@"hash_6f08a22fd52e004c");
    }
    self setscriptablepartstate("cyber_revive_icon", "unusable");
    var_f99d56bcb582a8ba.reviver = player;
    self.reviver = player;
    var_f99d56bcb582a8ba setbeingrevivedinternal(1);
    var_8d4c493e675e384e = var_f99d56bcb582a8ba namespace_833bd5cc623ca701::function_f0d1c9c39359efff();
    self.reviver setlaststandreviving(1, var_8d4c493e675e384e);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(player, #"hash_572347275dfb41ab");
    if (!istrue(var_f5a0530ce8d587b1) && !var_8d4c493e675e384e) {
        player thread allowedwhilereviving(0);
    }
    var_f99d56bcb582a8ba printspawnmessage("teamrevive::reviveTriggerHoldOnUseBegin() Killcam SKIPPED");
    var_f99d56bcb582a8ba notify("abort_killcam");
    var_f99d56bcb582a8ba.cancelkillcam = 1;
    var_f99d56bcb582a8ba _freezecontrols(1, undefined, "teamRevive");
    objidnum = level.revivetriggers[var_f99d56bcb582a8ba.guid].objidnum;
    if (isdefined(objidnum)) {
        namespace_5a22b6f3a56f7e9b::update_objective_icon(objidnum, "hud_icon_cyber_reviving");
    }
    thread function_c164fed51c204630(var_f99d56bcb582a8ba, player);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e56
// Size: 0xef
function private function_c164fed51c204630(var_f99d56bcb582a8ba, reviver) {
    var_f99d56bcb582a8ba endon("disconnect");
    var_379de5a38f0e582a = getrevivecameradata(var_f99d56bcb582a8ba, reviver);
    camerapos = var_379de5a38f0e582a.origin;
    cameraang = var_379de5a38f0e582a.angles;
    var_f99d56bcb582a8ba.forcespawnangles = (0, cameraang[1], 0);
    waitframe();
    var_f99d56bcb582a8ba.forcespectatorclient = var_f99d56bcb582a8ba getentitynumber();
    waitframe();
    cameraent = utility::spawn_model("tag_origin", camerapos, cameraang);
    var_f99d56bcb582a8ba.revivecameraent = cameraent;
    var_f99d56bcb582a8ba cameralinkto(cameraent, "tag_origin", 1);
    if (!namespace_7e17181d03156026::isreallyalive(var_f99d56bcb582a8ba)) {
        var_f99d56bcb582a8ba thread revivecamerapullin();
    }
    if (istrue(var_f99d56bcb582a8ba.pers["useNVG"])) {
        var_f99d56bcb582a8ba thread applynvgforrevive();
    }
    var_f99d56bcb582a8ba thread runslamzoomonspawn();
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4c
// Size: 0x1fe
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
    newangles = newangles * (0, 1, 0);
    var_88f59c89f67e4385 = spawn("script_model", self.origin);
    var_88f59c89f67e4385.angles = startangles * (0, 1, 1);
    var_88f59c89f67e4385 setmodel("tag_origin");
    var_88f59c89f67e4385 rotateto(newangles, 0.4, 0.05);
    var_88f59c89f67e4385 thread function_7f0aebb7ad935939(self);
    self.var_88f59c89f67e4385 = var_88f59c89f67e4385;
    var_11153410e53783b6 = target - self geteye();
    var_ae9d358478054782 = (target - self geteye()) * (1, 1, 0);
    if (length(var_ae9d358478054782) == 0) {
        var_ae9d358478054782 = (1, 1, 0);
    }
    var_ef1f66cebc32a99 = math::anglebetweenvectors(var_ae9d358478054782, var_11153410e53783b6);
    mover = self getmovingplatformparent();
    if (isdefined(mover)) {
        namespace_1fbd40990ee60ede::function_3dfe65e73a7d0c86(self, mover);
        var_88f59c89f67e4385 linkto(mover);
    }
    if (self isragdoll()) {
        self function_d87e1768229d0e3e();
    }
    self playerlinktodelta(var_88f59c89f67e4385, "", 1, 30, 30, -1 * var_ef1f66cebc32a99 + 30, var_ef1f66cebc32a99 + 30, 0, 0, 0, 1, 0, 0.3, 0.3);
    if (isdefined(mover)) {
        thread function_34fd10b9791b7bb2(mover);
    } else {
        thread function_1012e32b79f1e975(target);
        thread function_d75bbd43c2e29f0c();
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3151
// Size: 0xfa
function function_34fd10b9791b7bb2(mover) {
    self endon("death_or_disconnect");
    self endon("stop_revive_pos_lerp");
    contents = physics_createcontents([0:"physicscontents_item", 1:"physicscontents_glass", 2:"physicscontents_vehicle", 3:"physicscontents_vehicleclip", 4:"physicscontents_playerclip"]);
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
        if (!namespace_2a184fc4902783dc::player_trace_passed(self.origin, self.origin, undefined, ignore, contents)) {
            self.var_a23f35f8460d8857 = 1;
            return;
        }
        waitframe();
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3252
// Size: 0x62
function function_d75bbd43c2e29f0c() {
    self endon("death_or_disconnect");
    self endon("stop_revive_pos_lerp");
    while (1) {
        vehicle = self waittill("touch");
        if (isdefined(vehicle) && vehicle namespace_1f188a13f7e79610::isvehicle() && namespace_f3f7309ba50e9927::function_6eb1fba746b72f46(vehicle) > 1 && namespace_1f188a13f7e79610::vehicle_isenemytoplayer(vehicle, self)) {
            self.var_a23f35f8460d8857 = 1;
            return;
        }
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32bb
// Size: 0x124
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
        dir = function_767cea82b001f645(target - self.origin);
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

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e6
// Size: 0x27
function function_7f0aebb7ad935939(player) {
    self endon("death");
    player waittill("disconnect");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3414
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
    namespace_1fbd40990ee60ede::function_69f266af27c2689(self, mover);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x349a
// Size: 0x20
function function_849e441cb5be1bda() {
    self endon("death_or_disconnect");
    while (!namespace_7e17181d03156026::isreallyalive(self)) {
        waitframe();
    }
    self notify("revivedAlive");
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c1
// Size: 0xba
function function_877aee1f2cdae81c(player) {
    if (!isdefined(player.var_d969d13f6bcd0830)) {
        player.var_d969d13f6bcd0830 = spawn("script_origin", player.origin);
        player.var_d969d13f6bcd0830 linkto(player);
        player.var_d969d13f6bcd0830 playloopsound("br_reviver_use_lp");
        player waittill_any_3("stop_revive_sfx", "enter_live_ragdoll", "death_or_disconnect");
        player.var_d969d13f6bcd0830 stoploopsound("br_reviver_use_lp", 1);
        player.var_d969d13f6bcd0830 playsound("br_reviver_use_end");
        player.var_d969d13f6bcd0830 delete();
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3582
// Size: 0x542
function revivetriggerholdonuseend(team, player, success, var_f5a0530ce8d587b1) {
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
    player namespace_1d863a7bbc05fc52::function_42d99e200aa9762a(self.var_f99d56bcb582a8ba);
    if (isdefined(self.var_f99d56bcb582a8ba) && isdefined(level.revivetriggers) && isdefined(level.revivetriggers[self.var_f99d56bcb582a8ba.guid])) {
        var_f99d56bcb582a8ba = self.var_f99d56bcb582a8ba;
        if (function_68ac13d2d66b844a()) {
            if (var_f99d56bcb582a8ba.team == "allies") {
                level.var_c7d5cde0cea88517--;
                if (level.var_c7d5cde0cea88517 < 0) {
                    level.var_c7d5cde0cea88517 = 0;
                }
                setomnvar("ui_num_reviving_allies", level.var_c7d5cde0cea88517);
            } else if (var_f99d56bcb582a8ba.team == "axis") {
                level.var_36a249f46f4464a8--;
                if (level.var_36a249f46f4464a8 < 0) {
                    level.var_36a249f46f4464a8 = 0;
                }
                setomnvar("ui_num_reviving_axis", level.var_36a249f46f4464a8);
            }
        }
        defaultusetime = level.revivetriggers[var_f99d56bcb582a8ba.guid].defaultusetime;
        level.revivetriggers[var_f99d56bcb582a8ba.guid] namespace_19b4203b51d56488::setusetime(defaultusetime);
        var_f99d56bcb582a8ba.forcespectatorclient = -1;
        if (success) {
            if (!isdefined(var_f99d56bcb582a8ba.revivecount)) {
                var_f99d56bcb582a8ba.revivecount = 1;
            } else {
                var_f99d56bcb582a8ba.revivecount++;
            }
            if (isdefined(level.var_37baab13a0cf00e3)) {
                var_f99d56bcb582a8ba namespace_44abc05161e2e2cb::showerrormessage("MP/NUM_REVIVES_LEFT", level.var_37baab13a0cf00e3 - var_f99d56bcb582a8ba.revivecount);
            }
            var_a776f097eb36e500 = namespace_296c793a004e81b3::getwatcheddvar("teamReviveHealth");
            namespace_bd0162aedd8c8594::logevent_playerhealed(var_f99d56bcb582a8ba, var_a776f097eb36e500, player);
            if (isdefined(level.var_36827f5d10328424) && namespace_36f464722d326bbe::isBRStyleGameType()) {
                var_f99d56bcb582a8ba thread function_849e441cb5be1bda();
                var_f99d56bcb582a8ba thread [[ level.var_36827f5d10328424 ]]();
            }
            var_f99d56bcb582a8ba playsoundtoteam("npc_breath_revive", var_f99d56bcb582a8ba.team, var_f99d56bcb582a8ba, var_f99d56bcb582a8ba);
            var_f99d56bcb582a8ba thread function_7dce7a3af5b0ce26();
            var_f99d56bcb582a8ba setclientomnvar("ui_reviver_id", -1);
            var_f99d56bcb582a8ba setclientomnvar("ui_securing", 0);
            if (function_7ba31cb6b21c346f() && player != var_f99d56bcb582a8ba) {
                var_f99d56bcb582a8ba thread function_36edf91561322753(2);
            }
        } else {
            var_f99d56bcb582a8ba setbeingrevivedinternal(0);
            level.revivetriggers[var_f99d56bcb582a8ba.guid] setscriptablepartstate("cyber_revive_icon", "usable");
            function_9cdce27af3d1224c(var_f99d56bcb582a8ba.team, istrue(level.numrevives), player);
            objidnum = level.revivetriggers[var_f99d56bcb582a8ba.guid].objidnum;
            if (isdefined(objidnum)) {
                namespace_5a22b6f3a56f7e9b::objective_show_progress(objidnum, 0);
                namespace_5a22b6f3a56f7e9b::update_objective_icon(objidnum, "hud_icon_revive_cyber");
            }
            var_f99d56bcb582a8ba _freezecontrols(0, undefined, "teamRevive");
            var_f99d56bcb582a8ba updatesessionstate("spectator");
            if (isdefined(var_f99d56bcb582a8ba.revivecameraent)) {
                var_f99d56bcb582a8ba cameraunlink();
                var_f99d56bcb582a8ba.revivecameraent delete();
            }
            if (isdefined(var_f99d56bcb582a8ba.team) && var_f99d56bcb582a8ba.team != "spectator") {
                var_f99d56bcb582a8ba allowspectateteam(var_f99d56bcb582a8ba.team, 1);
                foreach (entry in level.teamnamelist) {
                    if (entry != var_f99d56bcb582a8ba.team) {
                        var_f99d56bcb582a8ba allowspectateteam(entry, 0);
                    }
                }
                var_f99d56bcb582a8ba spectateclientnum(player getentitynumber());
            }
        }
    }
    if (!istrue(var_f5a0530ce8d587b1)) {
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
        if (isdefined(self.var_f99d56bcb582a8ba)) {
            self.var_f99d56bcb582a8ba thread namespace_27c74152ccb91331::function_bd70a21dd1326d59(self.var_f99d56bcb582a8ba);
            params = {reviver:player};
            self.var_f99d56bcb582a8ba callback::callback("player_team_revived", params);
        }
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3acb
// Size: 0x19
function revivetriggeroncantuse(player) {
    player namespace_44abc05161e2e2cb::showerrormessage("MP/PLAYER_ALREADY_BEING_REVIVED");
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aeb
// Size: 0x2d5
function getrevivecameradata(var_f99d56bcb582a8ba, reviver) {
    var_7e773ea54ffa645f = level.revivetriggers[var_f99d56bcb582a8ba.guid].curorigin;
    if (istrue(level.var_b961dd6c88e9a008) && isdefined(var_f99d56bcb582a8ba) && isdefined(var_f99d56bcb582a8ba.origin)) {
        var_7e773ea54ffa645f = var_f99d56bcb582a8ba.origin;
    }
    var_530640bc408681dd = var_7e773ea54ffa645f;
    fwd = vectornormalize(reviver.origin - var_530640bc408681dd);
    radius = 2;
    var_f03302c066639995 = 30;
    var_519305604d8e28e4 = 360 / var_f03302c066639995;
    var_40088284fa4b02c0 = 1;
    var_ad3fd9a25605f892 = 1;
    var_c030a8a33647feee = 200;
    var_d4ebddc5067723c4 = generateaxisanglesfromforwardvector(fwd, (0, 0, 1));
    var_634e1a5fda766caa = 0;
    var_e95d8b067be88b21 = undefined;
    passed = 0;
    var_12b614f64a9ba025 = var_530640bc408681dd;
    cameraangles = var_d4ebddc5067723c4;
    content = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1);
    while (var_40088284fa4b02c0 < var_519305604d8e28e4) {
        if (var_634e1a5fda766caa) {
            var_634e1a5fda766caa = 0;
            var_e95d8b067be88b21 = anglestoforward(var_d4ebddc5067723c4);
        } else {
            var_e95d8b067be88b21 = anglestoforward(var_d4ebddc5067723c4 + (0, ter_op(var_ad3fd9a25605f892, var_f03302c066639995, var_f03302c066639995 * -1) * var_40088284fa4b02c0, 0));
            var_ad3fd9a25605f892 = !var_ad3fd9a25605f892;
            if (var_ad3fd9a25605f892 == 1) {
                var_40088284fa4b02c0++;
            }
        }
        startpos = var_530640bc408681dd + (0, 0, 12);
        endpos = var_530640bc408681dd + var_e95d8b067be88b21 * var_c030a8a33647feee + (0, 0, 100);
        var_2fc7b90001702e5c = [];
        var_2fc7b90001702e5c[0] = var_f99d56bcb582a8ba;
        var_2fc7b90001702e5c[1] = reviver;
        trace = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, radius, var_2fc7b90001702e5c, content);
        drawtime = 30;
        var_41302affd456fcb3 = trace["position"];
        var_9406fd672e3b3b43 = 0;
        if (trace["fraction"] < 1) {
            var_41302affd456fcb3 = var_41302affd456fcb3 + var_e95d8b067be88b21 * radius;
            var_9406fd672e3b3b43 = 1;
        }
        if (trace["fraction"] > 0.99) {
            var_12b614f64a9ba025 = var_41302affd456fcb3;
            cameraangles = vectortoangles(var_e95d8b067be88b21);
            break;
        }
    }
    var_379de5a38f0e582a = spawnstruct();
    var_379de5a38f0e582a.origin = var_12b614f64a9ba025;
    var_3fe9488a68f80e54 = vectornormalize(var_530640bc408681dd - var_12b614f64a9ba025);
    var_379de5a38f0e582a.angles = vectortoangles(var_3fe9488a68f80e54);
    return var_379de5a38f0e582a;
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc8
// Size: 0xf0
function revivecamerapullin(cameraent) {
    var_522749e2b770767f = self.revivecameraent.origin + anglestoforward(self.revivecameraent.angles) * 3;
    var_8569cbed694ec300 = self.revivecameraent.origin + anglestoforward(self.revivecameraent.angles) * 50;
    var_beaf249485a20bb7 = namespace_2a184fc4902783dc::sphere_trace(var_522749e2b770767f, var_8569cbed694ec300, 2, undefined)["position"];
    duration = level.revivetriggers[self.guid].usetime / 1000;
    self.revivecameraent moveto(var_beaf249485a20bb7, duration, duration * 0.3, duration * 0.3);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ebf
// Size: 0x1e
function applynvgforrevive() {
    self notify("stopNVGOnRevive");
    self endon("stopNVGOnRevive");
    wait(1);
    self nightvisionviewon(1);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee4
// Size: 0x29
function deleteonspawn(cameraent) {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("spawned_player");
    cameraent delete();
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f14
// Size: 0x79
function allowedwhilereviving(isallowed) {
    if (!isallowed) {
        val::set("reviving", "melee", 0);
        val::set("reviving", "allow_jump", 0);
        val::set("reviving", "gesture", 0);
        val::set("reviving", "offhand_weapons", 0);
        val::set("reviving", "stance_change", 0);
    } else {
        val::function_c9d0b43701bdba00("reviving");
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3f94
// Size: 0x81
function movecameratorevivepos(var_9813182985677b23, finalangles, player) {
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 1, 0.5, 0.5);
    finalangles = (-9.5111, player.angles[1], 0);
    self rotateto(finalangles, 1, 0.5, 0.5);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401c
// Size: 0x64
function function_7dce7a3af5b0ce26() {
    self endon("death_or_disconnect");
    wait(0.15);
    self.deathsdoorsfx = 0;
    self playlocalsound(ter_op(isfemale(), "Fem_breathing_better", "breathing_better"));
    self stoplocalsound("deaths_door_in");
    namespace_4887422e77f3514e::function_a2b4e6088394bade();
    self setentitysoundcontext("atmosphere", "");
    self enableplayerbreathsystem(1);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4087
// Size: 0x1b7
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
    if (getdvar(@"hash_fcc82bc32588efce") == "0") {
        return;
    }
    self notify("revived_death_icon");
    if (!isdefined(team) || team == "spectator") {
        return;
    }
    /#
        assert(isgameplayteam(team));
    #/
    objid = icon namespace_5a22b6f3a56f7e9b::createobjective("hud_icon_revive_cyber");
    namespace_5a22b6f3a56f7e9b::update_objective_position(objid, icon.origin);
    namespace_5a22b6f3a56f7e9b::update_objective_state(objid, "current");
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objid);
    if (namespace_ca7b90256548aa40::issquadmode()) {
        squadmembers = dyingplayer namespace_ca7b90256548aa40::getSquadMembers();
        foreach (player in squadmembers) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, player);
        }
    } else {
        namespace_5a22b6f3a56f7e9b::objective_teammask_single(objid, team);
    }
    namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(objid, 0);
    namespace_5a22b6f3a56f7e9b::function_79a1a16de6b22b2d(objid, 14);
    objective_sethideelevation(objid, 1);
    icon.objidnum = objid;
    if (istrue(level.var_b961dd6c88e9a008)) {
        objective_onentity(objid, self);
        objective_setzoffset(objid, level.var_5ecf502dc8c87bbb);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4245
// Size: 0x13b
function runslamzoomonspawn() {
    self notify("end_spawn_zoom");
    self endon("end_spawn_zoom");
    self endon("disconnect");
    level endon("game_ended");
    if (!namespace_7e17181d03156026::isreallyalive(self)) {
        self waittill("spawned_player");
    }
    targetpos = self geteye();
    targetangles = self.angles;
    if (isdefined(self.revivecameraent)) {
        self cameralinkto(self.revivecameraent, "tag_origin", 1);
        self.revivecameraent moveto(targetpos, 0.25, 0.1, 0.1);
        self.revivecameraent rotateto(targetangles, 0.25, 0.1, 0.1);
    }
    wait(0.25);
    self visionsetnakedforplayer("", 0.1);
    if (istrue(self.var_436ac476c6cc0d0d)) {
        self setcamerathirdperson(1);
        self.var_436ac476c6cc0d0d = undefined;
    }
    self cameraunlink();
    if (isdefined(self.revivecameraent)) {
        self.revivecameraent delete();
    }
    wait(0.5);
    if (!function_7ba31cb6b21c346f()) {
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_1f1f4fe800e03b33", undefined, 1.25);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4387
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

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4466
// Size: 0x4d
function function_7127253a02af37c6(player) {
    if (isdefined(level) && isdefined(level.revivetriggers) && isdefined(player.guid) && isdefined(level.revivetriggers[player.guid])) {
        return 1;
    }
    return 0;
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44bb
// Size: 0x7b
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

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x453d
// Size: 0x3
function updatetimerwaitforjoined() {
    
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4547
// Size: 0x6b
function assigntimervisibleteam(teams) {
    self.interactteams = teams;
    foreach (player in level.players) {
        applytimervisibleteam(player);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b9
// Size: 0x4b
function applytimervisibleteam(player) {
    if (player.team == self.ownerteam) {
        self.visuals[0] showtoplayer(player);
    } else {
        self.visuals[0] hidefromplayer(player);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x460b
// Size: 0x79
function waitrespawnbutton() {
    self endon("disconnect");
    self endon("started_spawnPlayer");
    self endon("team_eliminated");
    var_ddf8e09b2a81dd37 = 0;
    while (1) {
        if (self usebuttonpressed()) {
            while (self usebuttonpressed()) {
                var_ddf8e09b2a81dd37 = var_ddf8e09b2a81dd37 + 0.05;
                if (var_ddf8e09b2a81dd37 >= 1) {
                    break;
                }
                wait(0.05);
            }
            if (var_ddf8e09b2a81dd37 >= 0.5) {
                var_ddf8e09b2a81dd37 = var_ddf8e09b2a81dd37 + 0.05;
            }
        }
        var_ddf8e09b2a81dd37 = 0;
        wait(0.05);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x468b
// Size: 0x6b
function function_68ac13d2d66b844a() {
    switch (getgametype()) {
    case #"hash_75b6db03edb1e84e":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_ec086b911c1011ec":
    case #"hash_fa37b7f6bd6f6cbf":
    case #"hash_fa50b0f6bd82e972":
        return 1;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46fe
// Size: 0x115
function function_855b084a3f053964(pos, var_7136191b4291791a) {
    closest = undefined;
    closestdist = undefined;
    if (!isdefined(level.revivetriggers)) {
        return undefined;
    }
    foreach (revivetrigger in level.revivetriggers) {
        if (!isdefined(revivetrigger.var_f99d56bcb582a8ba)) {
            continue;
        }
        if (revivetrigger.var_f99d56bcb582a8ba.team != self.team) {
            continue;
        }
        if (!revivetrigger function_bb57ed6218a82d1c()) {
            continue;
        }
        dist = distance2d(pos, revivetrigger.origin);
        if (isdefined(var_7136191b4291791a) && dist > var_7136191b4291791a) {
            continue;
        }
        if (!isdefined(closest)) {
            closest = revivetrigger;
            closestdist = dist;
        } else if (dist < closestdist) {
            closest = revivetrigger;
            closestdist = dist;
        }
    }
    return closest;
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481b
// Size: 0x97
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

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48ba
// Size: 0x14
function function_bb57ed6218a82d1c() {
    return self getscriptablepartstate("cyber_revive_icon") == "usable";
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 17, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48d6
// Size: 0x2fc
function function_9341574d596e9d36(player, contents, var_46a3a8565ac0c17c, var_846a20d8e6f30b8e, var_4f6cde716e0c3d7, var_6fb67c8525b1d79e, var_3ef503345dc57957, var_86b32aff94b5714e, var_275f4441ab7920c8, var_94333580dc2b96b, var_bf23a60678978c19, var_c299c08e4b8a8e56, var_a0e9fef038504bd0, var_fd8a9b46f4a1e27c, var_9d09471027604346, var_c31356a794d8cb46, var_ad7897ecdbcb63) {
    corpse = spawnscriptable("cyber_revive_pillage", player.origin + (0, 0, level.var_5ecf502dc8c87bbb));
    corpse utility::function_6e506f39f121ea8a(player, (0, 0, level.var_5ecf502dc8c87bbb));
    namespace_cb965d2f71fefddc::registerscriptableinstance(corpse);
    corpse.contents = contents;
    corpse.var_46a3a8565ac0c17c = var_46a3a8565ac0c17c;
    corpse.var_846a20d8e6f30b8e = var_846a20d8e6f30b8e;
    corpse.owner = player;
    corpse.var_4f6cde716e0c3d7 = var_4f6cde716e0c3d7;
    corpse.var_6fb67c8525b1d79e = var_6fb67c8525b1d79e;
    corpse.var_3ef503345dc57957 = var_3ef503345dc57957;
    corpse.var_275f4441ab7920c8 = var_275f4441ab7920c8;
    corpse.metadata = var_fd8a9b46f4a1e27c;
    corpse.var_86b32aff94b5714e = var_86b32aff94b5714e;
    corpse.var_ad7897ecdbcb63 = var_ad7897ecdbcb63;
    corpse.backpackSize = namespace_aead94004cf4c147::function_b13e35608b336d65(player);
    corpse.var_bf23a60678978c19 = var_bf23a60678978c19;
    if (isdefined(var_c299c08e4b8a8e56) && isdefined(var_a0e9fef038504bd0)) {
        corpse.var_a06e7128c001851d = var_c299c08e4b8a8e56;
        corpse.var_a0e9fef038504bd0 = var_a0e9fef038504bd0;
        corpse.var_bb6791b7369ef71a = var_9d09471027604346;
        corpse.var_c31356a794d8cb46 = var_c31356a794d8cb46;
    }
    if (istrue(level.var_faec6e12b831873d)) {
        corpse.var_bbc200bc77c5db2b = 1;
    }
    foreach (item in corpse.contents) {
        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(item["lootID"], "addedToContainer", corpse, player);
    }
    foreach (teammember in getteamdata(player.team, "players")) {
        corpse disablescriptableplayeruse(teammember);
    }
    player.var_6a4360dcf2a8f3d4 = corpse;
    player.var_6a4360dcf2a8f3d4.hidefromteam = 1;
    level thread function_d5c44af2144b00b3(player, player.attached_bag, corpse);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bd9
// Size: 0x20a
function function_d5c44af2144b00b3(var_f99d56bcb582a8ba, model, corpse) {
    var_f99d56bcb582a8ba endon("revivedAlive");
    corpse endon("death");
    if (isdefined(level.teamReviveTimeout) && level.teamReviveTimeout > 0) {
        var_f99d56bcb582a8ba waittill_any_2("disconnect", "trigger_removed");
        if (isdefined(var_f99d56bcb582a8ba) && !istrue(var_f99d56bcb582a8ba.isdisconnecting) && isdefined(var_f99d56bcb582a8ba.timelefttospawnaction) && var_f99d56bcb582a8ba.timelefttospawnaction > 0) {
            return;
        }
    } else {
        var_f99d56bcb582a8ba waittill("disconnect");
    }
    if (!isdefined(corpse)) {
        return;
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    neworigin = drop_to_ground(corpse.origin) + (0, 0, 2);
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(neworigin, corpse.angles);
    scriptablename = namespace_aead94004cf4c147::function_432475069c798ddc(function_53c4c53197386572(model, "parts_backpack_inventory_small"));
    var_87583859f07b58e3 = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, 1);
    function_85b5becfebdc7b62(corpse, var_87583859f07b58e3);
    if (isdefined(corpse.opener)) {
        var_87583859f07b58e3 setscriptablepartstate("body", "partially_opening_unusable");
        if (isdefined(corpse.opener.var_f2aa9ae949179907) && isdefined(corpse.opener.origin)) {
            corpse.opener.var_f2aa9ae949179907 = corpse.opener.origin;
        }
        namespace_3f0ea7483345a2c0::function_30f5ea60517f9e06(corpse.opener, var_87583859f07b58e3);
    } else {
        var_87583859f07b58e3 setscriptablepartstate("body", "closed_usable");
    }
    namespace_cb965d2f71fefddc::loothide(corpse, "body");
    if (function_957a13a14cdab289(var_f99d56bcb582a8ba)) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("pleaForHelp", "UpdatePlayerPleaForAll") ]](var_f99d56bcb582a8ba);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dea
// Size: 0x238
function function_85b5becfebdc7b62(corpse, backpack) {
    backpack.contents = corpse.contents;
    backpack.var_46a3a8565ac0c17c = corpse.var_46a3a8565ac0c17c;
    backpack.var_846a20d8e6f30b8e = corpse.var_846a20d8e6f30b8e;
    backpack.owner = corpse.player;
    backpack.var_4f6cde716e0c3d7 = corpse.var_4f6cde716e0c3d7;
    backpack.var_6fb67c8525b1d79e = corpse.var_6fb67c8525b1d79e;
    backpack.var_3ef503345dc57957 = corpse.var_3ef503345dc57957;
    backpack.var_d636075065504b2b = corpse.var_d636075065504b2b;
    backpack.var_275f4441ab7920c8 = corpse.var_275f4441ab7920c8;
    backpack.metadata = corpse.var_fd8a9b46f4a1e27c;
    backpack.var_86b32aff94b5714e = corpse.var_86b32aff94b5714e;
    backpack.backpackSize = corpse.backpackSize;
    backpack.var_bf23a60678978c19 = corpse.var_bf23a60678978c19;
    if (isdefined(corpse.var_a06e7128c001851d) && isdefined(corpse.var_a0e9fef038504bd0)) {
        backpack.var_a06e7128c001851d = corpse.var_a06e7128c001851d;
        backpack.var_a0e9fef038504bd0 = corpse.var_a0e9fef038504bd0;
        backpack.var_bb6791b7369ef71a = corpse.var_bb6791b7369ef71a;
        backpack.var_c31356a794d8cb46 = corpse.var_c31356a794d8cb46;
    }
    if (istrue(level.var_faec6e12b831873d)) {
        backpack.var_bbc200bc77c5db2b = 1;
    }
    foreach (item in backpack.contents) {
        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(item["lootID"], "addedToContainer", backpack);
    }
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5029
// Size: 0x33
function function_5b55070c02328ea7(corpse) {
    return isdefined(corpse) && isdefined(corpse.type) && corpse.type == "cyber_revive_pillage";
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5064
// Size: 0x2e
function function_957a13a14cdab289(player) {
    return namespace_71073fa38f11492::isfeatureenabled("pleaForHelp") && [[ namespace_3c37cb17ade254d::getsharedfunc("pleaForHelp", "isPleading") ]](player);
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x509a
// Size: 0x357
function function_631c1846bd7412e2() {
    /#
        level endon("abort_killcam");
        self notify("revivedAlive");
        self endon("revivedAlive");
        self endon("allow_jump");
        while (1) {
            if (function_7127253a02af37c6(self)) {
                break;
            }
            wait(1);
        }
        while (function_7127253a02af37c6(self)) {
            if (getdvarint(@"hash_d475fd19488b5a6d", 0) == 1) {
                wait(1);
                var_13c5603d4beea2fc = self getspectatingplayer();
                foreach (player in level.players) {
                    if (isdefined(var_13c5603d4beea2fc)) {
                        if (player.team == self.team && isbot(player) && var_13c5603d4beea2fc == player) {
                            player setorigin(level.revivetriggers[self.guid].origin + (ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), 18));
                            self.reviver = player;
                            wait(0.5);
                            break;
                        }
                    } else if (player.team == self.team && isbot(player)) {
                        player setorigin(level.revivetriggers[self.guid].origin + (ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), ter_op(cointoss(), randomfloatrange(12, 24), randomfloatrange(12, 24) * -1), 18));
                        self.reviver = player;
                        wait(0.5);
                        break;
                    }
                }
                if (isdefined(self.reviver)) {
                    var_e5486d00ebba6e9 = level.revivetriggers[self.guid].usetime / 1000 + 1;
                    self.reviver botpressbutton("end_spawn_zoom", var_e5486d00ebba6e9);
                    wait(var_e5486d00ebba6e9 + 0.5);
                    if (isdefined(level.revivetriggers[self.guid])) {
                        self.reviver botpressbutton("end_spawn_zoom", var_e5486d00ebba6e9);
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
            wait(1);
        }
    #/
}

// Namespace teamRevive/namespace_7db13bdf599e41a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53f8
// Size: 0x226
function function_c4c78f8ceb5aa5f9() {
    /#
        level endon("abort_killcam");
        self endon("allow_jump");
        while (1) {
            if (getdvarint(@"hash_5265ad42b410556f", 0) == 1) {
                foreach (revivetrigger in level.revivetriggers) {
                    foreach (player in level.players) {
                        if (isbot(player) && isalive(player) && player.team == revivetrigger.ownerteam) {
                            forward = anglestoforward(player.angles);
                            var_c9e915e56c1b6170 = drop_to_ground(revivetrigger.var_f99d56bcb582a8ba.origin) - forward * 60;
                            player setorigin(var_c9e915e56c1b6170);
                            player botlookatpoint(drop_to_ground(revivetrigger.var_f99d56bcb582a8ba.origin), 10, "white");
                            player botsetflag("<unknown string>", 1);
                            player botsetflag("<unknown string>", 1);
                            self.reviver = player;
                            break;
                        }
                    }
                    wait(1);
                    if (isdefined(self.reviver)) {
                        var_e5486d00ebba6e9 = revivetrigger.usetime / 1000 + 1;
                        self.reviver botpressbutton("end_spawn_zoom", var_e5486d00ebba6e9);
                        wait(var_e5486d00ebba6e9 + 0.5);
                        if (isdefined(revivetrigger)) {
                            self.reviver botpressbutton("end_spawn_zoom", var_e5486d00ebba6e9);
                        }
                        self.reviver botsetflag("<unknown string>", 0);
                    }
                }
                setdevdvar(@"hash_5265ad42b410556f", 0);
            }
            wait(1);
        }
    #/
}

