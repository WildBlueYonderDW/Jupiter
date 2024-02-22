// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\arbitrary_up.gsc;

#namespace front;

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x496
// Size: 0x1d8
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
        registerscorelimitdvar(getgametype(), 100);
        registerroundlimitdvar(getgametype(), 2);
        registerwinlimitdvar(getgametype(), 0);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    game["dialog"]["gametype"] = "frontline";
    if (getdvarint(@"hash_4a2b3d01a81655a6")) {
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    } else if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_promode"))) {
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";
    }
    game["strings"]["overtime_hint"] = "MP/FIRST_BLOOD";
    thread spawnzonefx();
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x675
// Size: 0x92
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_3e97c6567fefc5bd", getmatchrulesdata("frontData", "enemyBaseKillReveal"));
    setdynamicdvar(@"hash_49f985623f33a0c9", getmatchrulesdata("frontData", "friendlyBaseScore"));
    setdynamicdvar(@"hash_d6b034d5a365754d", getmatchrulesdata("frontData", "midfieldScore"));
    setdynamicdvar(@"hash_95adf40e176fdeca", getmatchrulesdata("frontData", "enemyBaseScore"));
    setdynamicdvar(@"hash_1686370aa066325", 0);
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70e
// Size: 0x142
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
        setobjectivetext(entry, "OBJECTIVES/FRONT");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/FRONT");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/FRONT_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/FRONT_HINT");
    }
    level.iconkill3d = "waypoint_capture_kill";
    level.iconkill2d = "waypoint_capture_kill";
    initspawns();
    base_setupvfx();
    thread setupbases();
    thread setupbaseareabrushes();
    level.disablebuddyspawn = 1;
    /#
        thread function_8469a5927d069db7();
    #/
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x857
// Size: 0x6e
function updategametypedvars() {
    updatecommongametypedvars();
    level.enemybasekillreveal = dvarfloatvalue("enemyBaseKillReveal", 5, 0, 60);
    level.friendlybasescore = dvarfloatvalue("friendlyBaseScore", 1, 0, 25);
    level.midfieldscore = dvarfloatvalue("midfieldScore", 2, 0, 25);
    level.enemybasescore = dvarfloatvalue("enemyBaseScore", 1, 0, 25);
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8cc
// Size: 0x107
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    }
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_front_spawn_allies");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_front_spawn_axis");
    level.frontlinespawnsets = [];
    level.frontlinespawnsets["allies"] = "allies";
    level.frontlinespawnsets["axis"] = "axis";
    namespace_b2d5aa2baf2b5701::registerspawnset("allies", "mp_front_spawn_allies");
    namespace_b2d5aa2baf2b5701::registerspawnset("axis", "mp_front_spawn_axis");
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9da
// Size: 0xcb
function onspawnplayer(var_9156b53bcf7ce573) {
    if (isplayer(self)) {
        self.inenemybase = 0;
        self.infriendlybase = 0;
        self.outlinetime = 0;
        if (isdefined(self.outlineid)) {
            outlinedisable(self.outlineid, self);
        }
        self.useoutline = 0;
        self.outlineid = undefined;
        thread friendlybasewatcher();
        thread enemybasewatcher();
        foreach (zone in level.zones) {
            zone showbaseeffecttoplayer(self);
        }
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaac
// Size: 0x51
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (game["switchedsides"]) {
        spawnteam = getotherteam(spawnteam)[0];
    }
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.frontlinespawnsets[spawnteam]);
    return spawnpoint;
}

// Namespace front/namespace_c611e730198c5cc9
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xb05
// Size: 0x19a
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    givescore = 0;
    if (victim.infriendlybase || attacker.inenemybase) {
        attacker thread function_e3e3e81453fd788b(#"hash_32c83db6a9b8dd6", objweapon);
        givescore = level.enemybasescore;
    } else if (attacker.infriendlybase || victim.inenemybase) {
        attacker thread function_e3e3e81453fd788b(#"hash_537f763990ad6bf3", objweapon);
        givescore = level.friendlybasescore;
    } else {
        attacker thread function_e3e3e81453fd788b(#"hash_4c4afed94af7fd08", objweapon);
        givescore = level.midfieldscore;
    }
    var_882b7ad682ff97ce = game["teamScores"][attacker.pers["team"]] + givescore;
    hitscorelimit = var_882b7ad682ff97ce >= level.roundscorelimit;
    if (hitscorelimit && level.roundscorelimit != 0) {
        givescore = level.roundscorelimit - game["teamScores"][attacker.pers["team"]];
    }
    if (givescore > 0) {
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.pers["team"], givescore, 0);
        attacker thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", givescore));
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca6
// Size: 0xb7
function enemybasekillreveal() {
    level endon("game_ended");
    self endon("death");
    self notify("EnemyBaseKillReveal");
    self endon("EnemyBaseKillReveal");
    if (isdefined(self.basekilloutlineid)) {
        outlinedisable(self.basekilloutlineid, self);
    }
    self.basekilloutlineid = outlineenableforteam(self, getotherteam(self.team)[0], "outline_nodepth_orange", "perk");
    if (!isbot(self)) {
        _hudoutlineviewmodelenable("outline_nodepth_orange", 0);
    }
    self sethudtutorialmessage("MP/FRONT_REVEALED", 1);
    wait(level.enemybasekillreveal);
    outlinedisable(self.basekilloutlineid, self);
    _hudoutlineviewmodeldisable();
    self clearhudtutorialmessage(0);
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd64
// Size: 0x3b6
function setupbases() {
    level.zones = [];
    if (game["switchedsides"]) {
        level.allieszone = getentarray("frontline_zone_allies", "targetname");
        foreach (zone in level.allieszone) {
            zone.team = "axis";
            zone thread friendlybasewatcher();
            zone thread enemybasewatcher();
            zone thread enemybasekillstreakwatcher();
        }
        thread setupvisuals(level.allieszone[0]);
        level.zones[level.zones.size] = level.allieszone[0];
        level.axiszone = getentarray("frontline_zone_axis", "targetname");
        if (level.mapname == "mp_junk") {
            var_42f7956e85359a06 = spawn("trigger_radius", (-1410, -2080, 240), 0, 1000, 600);
            level.axiszone[level.axiszone.size] = var_42f7956e85359a06;
        }
        foreach (zone in level.axiszone) {
            zone.team = "allies";
            zone thread friendlybasewatcher();
            zone thread enemybasewatcher();
            zone thread enemybasekillstreakwatcher();
        }
        thread setupvisuals(level.axiszone[0]);
        level.zones[level.zones.size] = level.axiszone[0];
    } else {
        level.allieszone = getentarray("frontline_zone_allies", "targetname");
        foreach (zone in level.allieszone) {
            zone.team = "allies";
            zone thread friendlybasewatcher();
            zone thread enemybasewatcher();
            zone thread enemybasekillstreakwatcher();
        }
        thread setupvisuals(level.allieszone[0]);
        level.zones[level.zones.size] = level.allieszone[0];
        level.axiszone = getentarray("frontline_zone_axis", "targetname");
        if (level.mapname == "mp_junk") {
            var_42f7956e85359a06 = spawn("trigger_radius", (-1410, -2080, 240), 0, 1000, 600);
            level.axiszone[level.axiszone.size] = var_42f7956e85359a06;
        }
        foreach (zone in level.axiszone) {
            zone.team = "axis";
            zone thread friendlybasewatcher();
            zone thread enemybasewatcher();
            zone thread enemybasekillstreakwatcher();
        }
        thread setupvisuals(level.axiszone[0]);
        level.zones[level.zones.size] = level.axiszone[0];
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1121
// Size: 0x8e
function setupvisuals(zone) {
    visuals = [];
    visuals[0] = zone;
    if (isdefined(zone.target)) {
        othervisuals = getentarray(zone.target, "targetname");
        for (j = 0; j < othervisuals.size; j++) {
            visuals[visuals.size] = othervisuals[j];
        }
    }
    visuals = mappatchborders(visuals, zone.target);
    zone.visuals = visuals;
}

// Namespace front/namespace_c611e730198c5cc9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11b6
// Size: 0xce
function mappatchborders(visuals, targetname) {
    if (level.mapname == "mp_parkour" && targetname == "front_vis_axis") {
        ent1 = spawn("script_origin", (-1088, -1504, 136));
        ent1.angles = (0, 180, 0);
        ent1.targetname = targetname;
        visuals[visuals.size] = ent1;
        ent2 = spawn("script_origin", (-1088, -1440, 136));
        ent2.angles = (0, 180, 0);
        ent1.targetname = targetname;
        visuals[visuals.size] = ent2;
    }
    return visuals;
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128c
// Size: 0x6e
function friendlybasewatcher() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        player = self waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (player.team != self.team) {
            continue;
        }
        if (player.infriendlybase) {
            continue;
        }
        player thread friendlybasetriggerwatcher(self);
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1301
// Size: 0x12a
function friendlybasetriggerwatcher(trigger) {
    self notify("friendlyTriggerWatcher");
    self endon("friendlyTriggerWatcher");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (game["switchedsides"]) {
        if (self.team == "allies") {
            triggers = level.axiszone;
        } else {
            triggers = level.allieszone;
        }
    } else if (self.team == "allies") {
        triggers = level.allieszone;
    } else {
        triggers = level.axiszone;
    }
    while (1) {
        self.infriendlybase = 0;
        foreach (trigger in triggers) {
            if (self istouching(trigger)) {
                self.infriendlybase = 1;
                break;
            }
        }
        if (!self.infriendlybase || namespace_ab403fa2c6c142a4::isinarbitraryup()) {
            if (istrue(self.spawnprotection)) {
                namespace_310ba947928891df::removespawnprotection();
            }
            break;
        }
        waitframe();
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1432
// Size: 0xa1
function enemybasewatcher() {
    level endon("game_ended");
    while (1) {
        player = self waittill("trigger");
        if (isdefined(player.team) && player.team == self.team) {
            continue;
        }
        if (isalive(player) && isdefined(player.sessionstate) && player.sessionstate != "spectator" || playercontrolledstreak(player)) {
            player.inenemybase = 1;
            player thread enemybasetriggerwatcher(self);
        }
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14da
// Size: 0x78
function enemybasetriggerwatcher(trigger) {
    self endon("death");
    level endon("game_ended");
    if (istrue(self.useoutline)) {
        return;
    }
    while (1) {
        if (isdefined(self) && self istouching(trigger)) {
            if (!istrue(self.useoutline)) {
                thread enableenemybaseoutline();
            }
        } else {
            self.useoutline = 0;
            self.inenemybase = 0;
            thread disableenemybaseoutline();
            break;
        }
        waitframe();
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1559
// Size: 0x66
function enableenemybaseoutline() {
    self.useoutline = 1;
    self.outlinetime = gettime();
    self.outlineid = outlineenableforteam(self, getotherteam(self.team)[0], "outline_nodepth_orange", "perk");
    if (!isbot(self)) {
        if (isplayer(self)) {
            _hudoutlineviewmodelenable("outline_nodepth_orange", 0);
        }
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c6
// Size: 0x43
function disableenemybaseoutline() {
    self.useoutline = 0;
    outlinedisable(self.outlineid, self);
    self.outlineid = undefined;
    if (!isbot(self) && isplayer(self)) {
        _hudoutlineviewmodeldisable();
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1610
// Size: 0x7c
function enemybasekillstreakwatcher() {
    level endon("game_ended");
    while (1) {
        if (level.turrets.size > 0) {
            foreach (turret in level.turrets) {
                handleoutlinesforstreaks(turret);
            }
        }
        wait(0.1);
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1693
// Size: 0xa0
function handleoutlinesforstreaks(streak) {
    if (streak.owner.team == self.team) {
        goto LOC_0000009e;
    }
    if (streak istouching(self)) {
        if (!isdefined(streak.outlineid)) {
            streak.outlineid = outlineenableforteam(streak, self.team, "outline_nodepth_orange", "lowest");
        }
    } else if (isdefined(streak.outlineid)) {
        outlinedisable(streak.outlineid, streak);
        streak.outlineid = undefined;
    LOC_0000009e:
    }
LOC_0000009e:
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x173a
// Size: 0x1e
function playercontrolledstreak(player) {
    if (isdefined(player.streakname)) {
        return 0;
    }
    return 0;
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1760
// Size: 0x106
function showbaseeffecttoplayer(player) {
    var_16a1ab6dfeb8d692 = self.team;
    effect = undefined;
    var_8e879faf3052e0d2 = player.team;
    if (!isdefined(var_8e879faf3052e0d2)) {
        var_8e879faf3052e0d2 = "allies";
    }
    iscodcaster = player iscodcaster();
    if (iscodcaster) {
        var_8e879faf3052e0d2 = player function_638eebeff841e16a();
    } else if (var_8e879faf3052e0d2 == "spectator") {
        var_8e879faf3052e0d2 = "allies";
    }
    friendlyfx = level.basefxid["friendly"];
    enemyfx = level.basefxid["enemy"];
    if (var_8e879faf3052e0d2 == var_16a1ab6dfeb8d692) {
        showfxarray(self._baseeffectfriendly, player);
        hidefxarray(self._baseeffectenemy, player);
    } else {
        showfxarray(self._baseeffectenemy, player);
        hidefxarray(self._baseeffectfriendly, player);
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x186d
// Size: 0x37
function showfxarray(array, player) {
    for (i = 0; i < array.size; i++) {
        array[i] showtoplayer(player);
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18ab
// Size: 0x37
function hidefxarray(array, player) {
    for (i = 0; i < array.size; i++) {
        array[i] hidefromplayer(player);
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e9
// Size: 0x185
function spawnfxarray() {
    self._baseeffectfriendly = [];
    self._baseeffectenemy = [];
    for (i = 1; i < self.visuals.size; i++) {
        var_5daa42f92e5e9be8 = anglestoforward(self.visuals[i].angles);
        self._baseeffectfriendly[self._baseeffectfriendly.size] = spawnfx(level.basefxid["friendly"], self.visuals[i].origin, var_5daa42f92e5e9be8);
        self._baseeffectfriendly[self._baseeffectfriendly.size - 1] setfxkilldefondelete();
        triggerfx(self._baseeffectfriendly[self._baseeffectfriendly.size - 1]);
    }
    for (i = 1; i < self.visuals.size; i++) {
        var_5daa42f92e5e9be8 = anglestoforward(self.visuals[i].angles);
        self._baseeffectenemy[self._baseeffectenemy.size] = spawnfx(level.basefxid["enemy"], self.visuals[i].origin, var_5daa42f92e5e9be8);
        self._baseeffectenemy[self._baseeffectenemy.size - 1] setfxkilldefondelete();
        triggerfx(self._baseeffectenemy[self._baseeffectenemy.size - 1]);
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a75
// Size: 0x37
function base_setupvfx() {
    level.basefxid["friendly"] = loadfx("vfx/core/mp/core/vfx_front_border_cyan.vfx");
    level.basefxid["enemy"] = loadfx("vfx/core/mp/core/vfx_front_border_orng.vfx");
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab3
// Size: 0x59
function spawnzonefx() {
    waitframe();
    foreach (zone in level.zones) {
        zone spawnfxarray();
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b13
// Size: 0x62
function onplayerconnect(player) {
    foreach (zone in level.zones) {
        zone showbaseeffecttoplayer(player);
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7c
// Size: 0xb7
function setupbaseareabrushes() {
    var_cc3b1b8ac44951a8 = getbasearray("front_zone_visual_allies_contest");
    var_e82eaa629a967a01 = getbasearray("front_zone_visual_axis_contest");
    var_c460c49b683a0ca0 = getbasearray("front_zone_visual_allies_friend");
    var_8c66a4000f9adc9 = getbasearray("front_zone_visual_axis_friend");
    var_5cce0c45429a8293 = getbasearray("front_zone_visual_allies_enemy");
    var_51e29d3dbdb3a3a = getbasearray("front_zone_visual_axis_enemy");
    hidebasebrushes(var_cc3b1b8ac44951a8);
    hidebasebrushes(var_e82eaa629a967a01);
    hidebasebrushes(var_c460c49b683a0ca0);
    hidebasebrushes(var_8c66a4000f9adc9);
    hidebasebrushes(var_5cce0c45429a8293);
    hidebasebrushes(var_51e29d3dbdb3a3a);
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3a
// Size: 0x33
function hidebasebrushes(brush) {
    if (isdefined(brush)) {
        for (index = 0; index < brush.size; index++) {
            brush[index] hide();
        }
    }
}

// Namespace front/namespace_c611e730198c5cc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c74
// Size: 0x33
function getbasearray(targetname) {
    zones = getentarray(targetname, "targetname");
    if (!isdefined(zones) || zones.size == 0) {
        return undefined;
    }
    return zones;
}

// Namespace front/namespace_c611e730198c5cc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1caf
// Size: 0xa5
function function_8469a5927d069db7() {
    /#
        level endon("axis");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("frontline_zone_axis", getdvarint(@"hash_46a6b424af6acbc2"), 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("trigger", getdvarint(@"hash_86e14326e43c0115"), 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_8469a5927d069db7();
    #/
}

