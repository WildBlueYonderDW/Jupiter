// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;

#namespace analyticslog;

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd44
// Size: 0x93
function init() {
    setdvarifuninitialized(@"hash_c8944dc52325691f", 0);
    level.analyticslog = spawnstruct();
    level.analyticslog.nextplayerid = 0;
    level.analyticslog.nextobjectid = 0;
    level.analyticslog.nextdeathid = 0;
    if (!analyticsactive()) {
        return;
    }
    thread watchforconnectedplayers();
    if (analyticslogenabled()) {
        thread logmatchtags();
        thread logallplayerposthink();
        thread logevent_minimapcorners();
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdde
// Size: 0x1c
function analyticsactive() {
    if (analyticsspawnlogenabled()) {
        return 1;
    }
    if (analyticslogenabled()) {
        return 1;
    }
    return 0;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe02
// Size: 0x14
function analyticslogenabled() {
    return getdvarint(@"hash_c8944dc52325691f") == 1;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1e
// Size: 0x36
function getuniqueobjectid() {
    id = level.analyticslog.nextobjectid;
    level.analyticslog.nextobjectid++;
    return id;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5c
// Size: 0x61
function cacheplayeraction(var_aa9e39088ce26eee) {
    if (!isdefined(self.analyticslog.cachedactions)) {
        self.analyticslog.cachedactions = 0;
    }
    self.analyticslog.cachedactions = self.analyticslog.cachedactions | var_aa9e39088ce26eee;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec4
// Size: 0x4b
function watchforconnectedplayers() {
    if (!analyticsactive()) {
        return;
    }
    while (1) {
        player = level waittill("connected");
        player logevent_playerconnected();
        player thread watchforbasicplayerevents();
        player thread watchforplayermovementevents();
        player thread watchforusermessageevents();
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf16
// Size: 0xb6
function watchforbasicplayerevents() {
    self endon("disconnect");
    if (!analyticslogenabled()) {
        return;
    }
    while (1) {
        var_adbd34525f139fc9 = waittill_any_return_no_endon_death_5("adjustedStance", "jumped", "weapon_fired", "reload_start", "spawned_player");
        if (var_adbd34525f139fc9 == "adjustedStance") {
            checkstancestatus();
        } else if (var_adbd34525f139fc9 == "jumped") {
            cacheplayeraction(4);
        } else if (var_adbd34525f139fc9 == "weapon_fired") {
            cacheplayeraction(8);
        } else if (var_adbd34525f139fc9 == "reload_start") {
            cacheplayeraction(16);
        } else if (var_adbd34525f139fc9 == "spawned_player") {
            thread logevent_playerspawn();
            thread logevent_spawnpointupdate();
        }
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd3
// Size: 0x7c
function watchforplayermovementevents() {
    self endon("disconnect");
    if (!analyticslogenabled()) {
        return;
    }
    while (1) {
        var_adbd34525f139fc9 = waittill_any_return_no_endon_death_3("doubleJumpBegin", "doubleJumpEnd", "sprint_slide_begin");
        if (var_adbd34525f139fc9 == "doubleJumpBegin") {
            cacheplayeraction(64);
        } else if (var_adbd34525f139fc9 == "doubleJumpEnd") {
            cacheplayeraction(128);
        } else if (var_adbd34525f139fc9 == "sprint_slide_begin") {
            cacheplayeraction(256);
        }
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1056
// Size: 0xc1
function watchforusermessageevents() {
    self endon("disconnect");
    if (isai(self)) {
        return;
    }
    if (getdvarint(@"hash_ff689af941dd10a1", 0) == 0) {
        return;
    }
    self notifyonplayercommand("log_user_event_start", "+actionslot 3");
    self notifyonplayercommand("log_user_event_end", "-actionslot 3");
    self notifyonplayercommand("log_user_event_generic_event", "+gostand");
    while (1) {
        self waittill("log_user_event_start");
        notification = waittill_any_return_2("log_user_event_end", "log_user_event_generic_event");
        if (isdefined(notification) && notification == "log_user_event_generic_event") {
            self iprintlnbold("Event Logged");
            logevent_message(self.name, self.origin, "Generic User Event");
        }
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111e
// Size: 0x3d
function checkstancestatus() {
    stance = self getstance();
    if (stance == "prone") {
        cacheplayeraction(1);
    } else if (stance == "crouch") {
        cacheplayeraction(2);
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1162
// Size: 0xc8
function logallplayerposthink() {
    if (!analyticslogenabled()) {
        return;
    }
    while (1) {
        timestart = gettime();
        players = level.players;
        foreach (player in players) {
            if (!shouldplayerlogevents(player)) {
                continue;
            }
            if (isdefined(player) && isreallyalive(player)) {
                player logevent_path();
                player logevent_scoreupdate();
                waitframe();
            }
        }
        wait(max(0.05, 1.5 - (gettime() - timestart) / 1000));
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1231
// Size: 0x25f
function recordbreadcrumbdata() {
    level endon("game_ended");
    if (getdvar(@"hash_35bfb8187f185ae7") == "0") {
        return;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        var_2fe6a798e49f4de6 = getdvarfloat(@"hash_7c8bee10dba43fe7", 4);
    } else {
        var_2fe6a798e49f4de6 = getdvarfloat(@"hash_246c8305339e703e", 2);
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_db5e61a22ce91ab9 = getdvarint(@"hash_9361b1490151da6f", 20);
    while (1) {
        playercount = level.players.size;
        starttime = gettime();
        startplayer = 0;
        while (startplayer < playercount) {
            for (var_82555c709fbe7ccc = 0; var_82555c709fbe7ccc < var_db5e61a22ce91ab9; var_82555c709fbe7ccc++) {
                playerindex = startplayer + var_82555c709fbe7ccc;
                player = level.players[playerindex];
                if (!isdefined(player)) {
                    continue;
                }
                if (!isdefined(player.team)) {
                    continue;
                }
                if (!isreallyalive(player)) {
                    continue;
                }
                if (player.team == "spectator") {
                    continue;
                }
                if (player.sessionstate != "playing") {
                    continue;
                }
                if (isai(player)) {
                    continue;
                }
                if (!isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) || !isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) || !isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
                    continue;
                }
                if (!namespace_de6e6777b0937bd7::function_892570944f6b6a2(player)) {
                    continue;
                }
                isads = player isplayerads();
                var_a086aaa8477d2c6 = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
                player recordbreadcrumbdataforplayer(var_a086aaa8477d2c6, player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index, isads);
            }
            waitframe();
            startplayer = startplayer + var_db5e61a22ce91ab9;
        }
        updatetime = (gettime() - starttime) * 0.001;
        waittime = max(var_2fe6a798e49f4de6 - updatetime, level.framedurationseconds);
        wait(waittime);
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1497
// Size: 0x4c
function getpathactionvalue() {
    actions = ter_op(isdefined(self.analyticslog.cachedactions), self.analyticslog.cachedactions, 0);
    if (self iswallrunning()) {
        actions = actions | 32;
    }
    return actions;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14eb
// Size: 0x1f
function clearpathactionvalue() {
    self.analyticslog.cachedactions = 0;
    checkstancestatus();
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1511
// Size: 0x8c
function buildkilldeathactionvalue() {
    var_818060d4e74ddba0 = 0;
    stance = self getstance();
    if (stance == "prone") {
        var_818060d4e74ddba0 = var_818060d4e74ddba0 | 1;
    } else if (stance == "crouch") {
        var_818060d4e74ddba0 = var_818060d4e74ddba0 | 2;
    }
    if (self isjumping()) {
        var_818060d4e74ddba0 = var_818060d4e74ddba0 | 4;
    }
    if (isdefined(self.lastshotfiredtime) && gettime() - self.lastshotfiredtime < 500) {
        var_818060d4e74ddba0 = var_818060d4e74ddba0 | 8;
    }
    if (self isreloading()) {
        var_818060d4e74ddba0 = var_818060d4e74ddba0 | 16;
    }
    return var_818060d4e74ddba0;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a5
// Size: 0x7c
function buildloadoutstring() {
    var_63ac6fb2eaa0e5d2 = "archetype=" + self.loadoutarchetype + ";" + "powerPrimary=" + self.loadoutequipmentprimary + ";" + "powerSecondary=" + self.loadoutequipmentsecondary + ";" + "weaponPrimary	 =" + self.primaryweapon + ";" + "weaponSecondary =" + self.secondaryweapon + ";";
    return var_63ac6fb2eaa0e5d2;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1629
// Size: 0x98
function buildspawnpointstatestring(spawnpoint) {
    output = "";
    if (isdefined(spawnpoint.lastbucket)) {
        if (isdefined(spawnpoint.lastbucket["allies"])) {
            output = output + "alliesBucket=" + spawnpoint.lastbucket["allies"] + ";";
        }
        if (isdefined(spawnpoint.lastbucket["axis"])) {
            output = output + "axisBucket=" + spawnpoint.lastbucket["axis"] + ";";
        }
    }
    return output;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c9
// Size: 0xff
function logevent_path() {
    if (!shouldplayerlogevents(self)) {
        return;
    }
    var_53f4b69ae494195a = anglestoforward(self getplayerangles());
    dlog_recordevent("gamemp_" + "path", [0:"playerid", 1:self.analyticslog.playerid, 2:"x", 3:self.origin[0], 4:"y", 5:self.origin[1], 6:"z", 7:self.origin[2], 8:"gun_orientx", 9:var_53f4b69ae494195a[0], 10:"gun_orienty", 11:var_53f4b69ae494195a[1], 12:"gun_orientz", 13:var_53f4b69ae494195a[2], 14:"action", 15:getpathactionvalue(), 16:"health", 17:getsantizedhealth()]);
    clearpathactionvalue();
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cf
// Size: 0x160
function logevent_playerspawn() {
    if (!shouldplayerlogevents(self)) {
        return;
    }
    var_c6c41b96b7c2ef2a = isdefined(self.lastspawnpoint) && isdefined(self.lastspawnpoint.buddyspawn) && self.lastspawnpoint.buddyspawn;
    playerforward = anglestoforward(self.angles);
    dlog_recordevent("gamemp_" + "spawn_in", [0:"playerid", 1:self.analyticslog.playerid, 2:"x", 3:self.origin[0], 4:"y", 5:self.origin[1], 6:"z", 7:self.origin[2], 8:"orientx", 9:playerforward[0], 10:"orienty", 11:playerforward[1], 12:"orientz", 13:playerforward[2], 14:"loadout", 15:buildloadoutstring(), 16:"type", 17:ter_op(var_c6c41b96b7c2ef2a, "Buddy", "Normal"), 18:"team", 19:self.team]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1936
// Size: 0x12e
function logevent_playerconnected() {
    if (!analyticsactive()) {
        return;
    }
    if (!isdefined(self.analyticslog)) {
        self.analyticslog = spawnstruct();
    }
    self.analyticslog.playerid = level.analyticslog.nextplayerid;
    level.analyticslog.nextplayerid++;
    if (!analyticslogenabled()) {
        return;
    }
    super = undefined;
    if (isdefined(self.changedarchetypeinfo)) {
        super = self.changedarchetypeinfo.super;
    } else {
        super = self getplayerdata(level.loadoutsgroup, "squadMembers", "archetypeSuper");
    }
    xuid = self getxuid();
    dlog_recordevent("gamemp_" + "player_connect", [0:"playerid", 1:self.analyticslog.playerid, 2:"player_name", 3:self.name, 4:"player_xuid", 5:xuid, 6:"player_super_name", 7:super]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6b
// Size: 0x6b6
function logevent_playerdeath(attacker, meansofdeath, weaponname) {
    if (!shouldplayerlogevents(self) || !isplayer(self)) {
        return;
    }
    var_53f4b69ae494195a = anglestoforward(self getplayerangles());
    var_77295bbd7b1b8155 = -1;
    var_798130b7f1830880 = 0;
    var_798131b7f1830ab3 = 0;
    var_798132b7f1830ce6 = 0;
    var_40cfb0f1536d4858 = 0;
    var_40cfb1f1536d4a8b = 0;
    var_40cfb2f1536d4cbe = 0;
    attackerteam = "s";
    var_2b835290a32bc05 = 0;
    if (isdefined(attacker) && isplayer(attacker)) {
        var_77295bbd7b1b8155 = attacker.analyticslog.playerid;
        if (isdefined(attacker.team)) {
            if (attacker.team == "axis") {
                attackerteam = "a";
            } else {
                attackerteam = "l";
            }
        }
        if (isdefined(attacker.origin)) {
            var_798130b7f1830880 = attacker.origin[0];
            var_798131b7f1830ab3 = attacker.origin[1];
            var_798132b7f1830ce6 = attacker.origin[2];
        }
        if (isdefined(attacker.lifeid)) {
            var_2b835290a32bc05 = attacker.lifeid;
        }
        var_fde6939445aae30 = anglestoforward(attacker getplayerangles());
        if (isdefined(var_fde6939445aae30)) {
            var_40cfb0f1536d4858 = var_fde6939445aae30[0];
            var_40cfb1f1536d4a8b = var_fde6939445aae30[1];
            var_40cfb2f1536d4cbe = var_fde6939445aae30[2];
        }
    }
    var_79f00192dd16d2ac = level.analyticslog.nextdeathid;
    level.analyticslog.nextdeathid++;
    weaponname = ter_op(isdefined(weaponname), weaponname, "None");
    victimteam = "s";
    if (self.team == "axis") {
        victimteam = "a";
    } else {
        victimteam = "l";
    }
    dlog_recordevent(134 + "death", [0:"playerid", 1:self.analyticslog.playerid, 2:"x", 3:self.origin[0], 4:"y", 5:self.origin[1], 6:"z", 7:self.origin[2], 8:"gun_orientx", 9:var_53f4b69ae494195a[0], 10:"gun_orienty", 11:var_53f4b69ae494195a[1], 12:"gun_orientz", 13:var_53f4b69ae494195a[2], 14:"weapon", 15:weaponname, 16:"mean_of_death", 17:ter_op(isdefined(meansofdeath), meansofdeath, "None"), 18:"attackerid", 19:var_77295bbd7b1b8155, 20:"action", 21:buildkilldeathactionvalue(), 22:"server_death_id", 23:var_79f00192dd16d2ac, 24:"victim_life_index", 25:self.lifeid, 26:"attacker_life_index", 27:var_2b835290a32bc05, 28:"victim_team", 29:victimteam, 30:"attacker_team", 31:attackerteam, 32:"attacker_pos_x", 33:var_798130b7f1830880, 34:"attacker_pos_y", 35:var_798131b7f1830ab3, 36:"attacker_pos_z", 37:var_798132b7f1830ce6, 38:"attacker_gun_orientx", 39:var_40cfb0f1536d4858, 40:"attacker_gun_orienty", 41:var_40cfb1f1536d4a8b, 42:"attacker_gun_orientz", 43:var_40cfb2f1536d4cbe, 44:"victim_weapon", 45:self.primaryweapon]);
    if (getdvarint(@"hash_eea95a7206a9ebeb")) {
        var_562d65ab35bbb12b = "NO_ATTACKER";
        if (isdefined(attacker) && isplayer(attacker)) {
            var_562d65ab35bbb12b = attacker playermounttype();
        }
        var_91f9ebed6e3c837e = self playermounttype();
        dlog_recordevent("dlog_event_gamemp_death_mount", [0:"playerid", 1:self.analyticslog.playerid, 2:"x", 3:self.origin[0], 4:"y", 5:self.origin[1], 6:"z", 7:self.origin[2], 8:"gun_orientx", 9:var_53f4b69ae494195a[0], 10:"gun_orienty", 11:var_53f4b69ae494195a[1], 12:"gun_orientz", 13:var_53f4b69ae494195a[2], 14:"weapon", 15:weaponname, 16:"mean_of_death", 17:ter_op(isdefined(meansofdeath), meansofdeath, "None"), 18:"attackerid", 19:var_77295bbd7b1b8155, 20:"action", 21:buildkilldeathactionvalue(), 22:"server_death_id", 23:var_79f00192dd16d2ac, 24:"victim_life_index", 25:self.lifeid, 26:"attacker_life_index", 27:var_2b835290a32bc05, 28:"victim_team", 29:victimteam, 30:"attacker_team", 31:attackerteam, 32:"attacker_pos_x", 33:var_798130b7f1830880, 34:"attacker_pos_y", 35:var_798131b7f1830ab3, 36:"attacker_pos_z", 37:var_798132b7f1830ce6, 38:"attacker_gun_orientx", 39:var_40cfb0f1536d4858, 40:"attacker_gun_orienty", 41:var_40cfb1f1536d4a8b, 42:"attacker_gun_orientz", 43:var_40cfb2f1536d4cbe, 44:"victim_weapon", 45:self.primaryweapon, 46:"attacker_mount_type", 47:var_562d65ab35bbb12b, 48:"victim_mount_type", 49:var_91f9ebed6e3c837e]);
    }
    if (isdefined(meansofdeath) && isexplosivedamagemod(meansofdeath)) {
        logevent_explosion(ter_op(isdefined(weaponname), weaponname, "generic"), self.origin, attacker, 1);
    }
    if (isdefined(self.attackers)) {
        foreach (assister in self.attackers) {
            if (isdefined(assister) && isplayer(assister) && assister != attacker) {
                logevent_assist(assister.analyticslog.playerid, var_79f00192dd16d2ac, weaponname);
            }
        }
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2128
// Size: 0x18e
function logevent_playerkill(victim, meansofdeath, weaponname) {
    if (!shouldplayerlogevents(self)) {
        return;
    }
    var_53f4b69ae494195a = anglestoforward(self getplayerangles());
    dlog_recordevent("gamemp_" + "kill", [0:"playerid", 1:self.analyticslog.playerid, 2:"x", 3:self.origin[0], 4:"y", 5:self.origin[1], 6:"z", 7:self.origin[2], 8:"gun_orientx", 9:var_53f4b69ae494195a[0], 10:"gun_orienty", 11:var_53f4b69ae494195a[1], 12:"gun_orientz", 13:var_53f4b69ae494195a[2], 14:"weapon", 15:ter_op(isdefined(weaponname), weaponname, "None"), 16:"mean_of_kill", 17:ter_op(isdefined(meansofdeath), meansofdeath, "None"), 18:"victimid", 19:ter_op(isdefined(victim) && isplayer(victim), victim.analyticslog.playerid, "-1"), 20:"action", 21:buildkilldeathactionvalue(), 22:"attacker_health", 23:getsantizedhealth(), 24:"victim_pixel_count", 25:0]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22bd
// Size: 0xfe
function logevent_explosion(type, center, var_e83217ed09c27313, duration, direction) {
    if (!analyticslogenabled()) {
        return;
    }
    if (!isdefined(direction)) {
        direction = (1, 0, 0);
    }
    dlog_recordevent("gamemp_" + "explosion", [0:"playerid", 1:var_e83217ed09c27313.analyticslog.playerid, 2:"x", 3:center[0], 4:"y", 5:center[1], 6:"z", 7:center[2], 8:"orientx", 9:direction[0], 10:"orienty", 11:direction[1], 12:"orientz", 13:direction[2], 14:"duration", 15:duration, 16:"type", 17:type]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c2
// Size: 0x1a2
function logevent_spawnpointupdate() {
    if (!analyticslogenabled()) {
        return;
    }
    if (!isdefined(level.spawnpoints)) {
        return;
    }
    foreach (spawnpoint in level.spawnpoints) {
        dlog_recordevent("gamemp_" + "spawn_point", [0:"x", 1:spawnpoint.origin[0], 2:"y", 3:spawnpoint.origin[1], 4:"z", 5:spawnpoint.origin[2], 6:"allies_score", 7:ter_op(isdefined(spawnpoint.lastscore["allies"]), spawnpoint.lastscore["allies"], 0), 8:"axis_score", 9:ter_op(isdefined(spawnpoint.lastscore["axis"]), spawnpoint.lastscore["axis"], 0), 10:"allies_max_score", 11:ter_op(isdefined(spawnpoint.totalpossiblescore), spawnpoint.totalpossiblescore, 0), 12:"axis_max_score", 13:ter_op(isdefined(spawnpoint.totalpossiblescore), spawnpoint.totalpossiblescore, 0), 14:"state", 15:buildspawnpointstatestring(spawnpoint)]);
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x256b
// Size: 0xda
function logevent_frontlineupdate(startpos, endpos, alliescenter, axiscenter, ison) {
    if (!analyticslogenabled()) {
        return;
    }
    dlog_recordevent("gamemp_" + "front_line", [0:"startx", 1:startpos[0], 2:"starty", 3:startpos[1], 4:"endx", 5:endpos[0], 6:"endy", 7:endpos[1], 8:"axis_centerx", 9:axiscenter[0], 10:"axis_centery", 11:axiscenter[1], 12:"allies_centerx", 13:alliescenter[0], 14:"allies_centery", 15:alliescenter[1], 16:"state", 17:ison]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264c
// Size: 0xb2
function logevent_gameobject(type, uniqueid, pos, ownerid, state) {
    if (!analyticslogenabled()) {
        return;
    }
    dlog_recordevent("gamemp_" + "object", [0:"uniqueid", 1:uniqueid, 2:"x", 3:pos[0], 4:"y", 5:pos[1], 6:"z", 7:pos[2], 8:"ownerid", 9:ownerid, 10:"type", 11:type, 12:"state", 13:state]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2705
// Size: 0x86
function logevent_message(ownerid, pos, message) {
    if (!analyticslogenabled()) {
        return;
    }
    dlog_recordevent("gamemp_" + "message", [0:"ownerid", 1:ownerid, 2:"x", 3:pos[0], 4:"y", 5:pos[1], 6:"z", 7:pos[2], 8:"message", 9:message]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2792
// Size: 0x2d
function logevent_tag(message) {
    if (!analyticslogenabled()) {
        return;
    }
    bbprint("gamemp_" + "matchtags", "message %s", message);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27c6
// Size: 0x102
function logevent_powerused(var_dc34121b4bb07fb9, state) {
    if (!shouldplayerlogevents(self)) {
        return;
    }
    playerforward = anglestoforward(self.angles);
    dlog_recordevent("gamemp_" + "power", [0:"ownerid", 1:self.analyticslog.playerid, 2:"x", 3:self.origin[0], 4:"y", 5:self.origin[1], 6:"z", 7:self.origin[2], 8:"orientx", 9:playerforward[0], 10:"orienty", 11:playerforward[1], 12:"orientz", 13:playerforward[2], 14:"type", 15:var_dc34121b4bb07fb9, 16:"state", 17:state]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28cf
// Size: 0x6f
function logevent_scoreupdate() {
    if (!shouldplayerlogevents(self)) {
        return;
    }
    playerforward = anglestoforward(self.angles);
    dlog_recordevent("gamemp_" + "scoreboard", [0:"ownerid", 1:self.analyticslog.playerid, 2:"score", 3:self.score]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2945
// Size: 0xcf
function logevent_minimapcorners() {
    if (!analyticslogenabled()) {
        return;
    }
    corners = getentarray("minimap_corner", "targetname");
    if (!isdefined(corners) || corners.size != 2) {
        return;
    }
    dlog_recordevent("gamemp_" + "map", [0:"cornera_x", 1:corners[0].origin[0], 2:"cornera_y", 3:corners[0].origin[1], 4:"cornerb_x", 5:corners[1].origin[0], 6:"cornerb_y", 7:corners[1].origin[1], 8:"north", 9:getnorthyaw()]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1b
// Size: 0x62
function logevent_assist(playerid, var_79f00192dd16d2ac, weapon) {
    if (!analyticslogenabled()) {
        return;
    }
    dlog_recordevent("gamemp_" + "assists", [0:"playerid", 1:playerid, 2:"server_death_id", 3:var_79f00192dd16d2ac, 4:"weapon", 5:weapon]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a84
// Size: 0x1c
function getsantizedhealth() {
    return int(clamp(self.health, 0, 100000));
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa8
// Size: 0x6a
function shouldplayerlogevents(player) {
    if (!analyticslogenabled()) {
        return 0;
    }
    if (!isdefined(player.team) || player.team == "spectator" || player.sessionstate != "playing" && player.sessionstate != "dead") {
        return 0;
    }
    return 1;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b1a
// Size: 0x88
function logmatchtags() {
    var_57191fdaea1096dc = getdvar(@"hash_820bbcc6f6cd1212", "");
    if (var_57191fdaea1096dc != "") {
        logevent_tag(var_57191fdaea1096dc);
    }
    if (matchmakinggame()) {
        logevent_tag("OnlineMatch");
    } else if (getdvarint(@"hash_485ef1ed1d39d3a3")) {
        logevent_tag("PrivateMatch");
    } else if (!getdvarint(@"hash_962400405f9f3c0b")) {
        logevent_tag("OfflineMatch");
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba9
// Size: 0xc7
function logevent_superended(super_name, time_to_use, num_hits, num_kills) {
    if (!analyticslogenabled()) {
        return;
    }
    player_id = -1;
    if (isdefined(self.analyticslog) && isdefined(self.analyticslog.playerid)) {
        player_id = self.analyticslog.playerid;
    }
    dlog_recordevent("analytics_mp_supers", [0:"super_name", 1:super_name, 2:"time_to_use", 3:time_to_use, 4:"num_hits", 5:num_hits, 6:"num_kills", 7:num_kills, 8:"player_id", 9:player_id]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c77
// Size: 0x85
function logevent_superearned(match_time) {
    if (!analyticslogenabled()) {
        return;
    }
    player_id = -1;
    if (isdefined(self.analyticslog) && isdefined(self.analyticslog.playerid)) {
        player_id = self.analyticslog.playerid;
    }
    dlog_recordevent("analytics_mp_super_earned", [0:"match_time", 1:match_time, 2:"player_id", 3:player_id]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d03
// Size: 0x41
function logevent_awardgained(award_message) {
    if (!analyticslogenabled()) {
        return;
    }
    if (function_d03495fe6418377b(award_message)) {
        award_message = function_f28fd66285fa2c9(award_message);
    }
    dlog_recordevent("analytics_mp_awards", [0:"award_message", 1:award_message]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4b
// Size: 0xc7
function logevent_giveplayerxp(current_prestige, current_level, xp_gained, source) {
    if (!analyticslogenabled()) {
        return;
    }
    player_id = -1;
    if (isdefined(self.analyticslog) && isdefined(self.analyticslog.playerid)) {
        player_id = self.analyticslog.playerid;
    }
    dlog_recordevent("analytics_mp_player_xp", [0:"current_prestige", 1:current_prestige, 2:"current_level", 3:current_level, 4:"xp_gained", 5:xp_gained, 6:"xp_source", 7:source, 8:"player_id", 9:player_id]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e19
// Size: 0xef
function logevent_givempweaponxp(objweapon, current_prestige, current_level, xp_gained, source) {
    if (!analyticslogenabled()) {
        return;
    }
    player_id = -1;
    if (isdefined(self.analyticslog) && isdefined(self.analyticslog.playerid)) {
        player_id = self.analyticslog.playerid;
    }
    weapon_name = getcompleteweaponname(objweapon);
    dlog_recordevent("analytics_mp_weapon_xp", [0:"weapon", 1:weapon_name, 2:"current_prestige", 3:current_prestige, 4:"current_level", 5:current_level, 6:"xp_gained", 7:xp_gained, 8:"xp_source", 9:source, 10:"player_id", 11:player_id]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f0f
// Size: 0x273
function logevent_sendplayerindexdata() {
    if (!analyticslogenabled()) {
        return;
    }
    var_d6228dada168a8a6 = [];
    var_7866d1bb4718ac7 = [];
    playercount = 0;
    for (playercount = 0; playercount < 12; playercount++) {
        var_d6228dada168a8a6[playercount] = 0;
        var_7866d1bb4718ac7[playercount] = "";
    }
    playercount = 0;
    foreach (player in level.players) {
        if (!isai(player)) {
            var_d6228dada168a8a6[playercount] = player.analyticslog.playerid;
            var_7866d1bb4718ac7[playercount] = player getxuid();
        }
        playercount = playercount + 1;
    }
    dlog_recordevent("analytics_match_player_index_init", [0:"player1_index", 1:var_d6228dada168a8a6[0], 2:"player1_xuid", 3:var_7866d1bb4718ac7[0], 4:"player2_index", 5:var_d6228dada168a8a6[1], 6:"player2_xuid", 7:var_7866d1bb4718ac7[1], 8:"player3_index", 9:var_d6228dada168a8a6[2], 10:"player3_xuid", 11:var_7866d1bb4718ac7[2], 12:"player4_index", 13:var_d6228dada168a8a6[3], 14:"player4_xuid", 15:var_7866d1bb4718ac7[3], 16:"player5_index", 17:var_d6228dada168a8a6[4], 18:"player5_xuid", 19:var_7866d1bb4718ac7[4], 20:"player6_index", 21:var_d6228dada168a8a6[5], 22:"player6_xuid", 23:var_7866d1bb4718ac7[5], 24:"player7_index", 25:var_d6228dada168a8a6[6], 26:"player7_xuid", 27:var_7866d1bb4718ac7[6], 28:"player8_index", 29:var_d6228dada168a8a6[7], 30:"player8_xuid", 31:var_7866d1bb4718ac7[7], 32:"player9_index", 33:var_d6228dada168a8a6[8], 34:"player9_xuid", 35:var_7866d1bb4718ac7[8], 36:"player10_index", 37:var_d6228dada168a8a6[9], 38:"player10_xuid", 39:var_7866d1bb4718ac7[9], 40:"player11_index", 41:var_d6228dada168a8a6[10], 42:"player11_xuid", 43:var_7866d1bb4718ac7[10], 44:"player12_index", 45:var_d6228dada168a8a6[11], 46:"player12_xuid", 47:var_7866d1bb4718ac7[11]]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3189
// Size: 0x13
function analyticsspawnlogenabled() {
    return getdvarint(@"hash_906c263c7e34d59f") != 0;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a4
// Size: 0x17
function is_spawnid_a_less_than_b(a, b) {
    return a < b;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c3
// Size: 0x5f
function analyticsstorespawndata() {
    if (isdefined(level.spawncount) && isdefined(level.spawnidstobeinstrumented) && isdefined(level.nextspawntobeinstrumented)) {
        game["spawnCount"] = level.spawncount;
        game["spawnIdsToBeInstrumented"] = level.spawnidstobeinstrumented;
        game["nextSpawnToBeInstrumented"] = level.nextspawntobeinstrumented;
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3229
// Size: 0x30
function analyticsdoesspawndataexist() {
    if (isdefined(level.spawncount) && isdefined(level.spawnidstobeinstrumented) && isdefined(level.nextspawntobeinstrumented)) {
        return 1;
    }
    return 0;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3261
// Size: 0x136
function analyticsinitspawndata() {
    spawncount = game["spawnCount"];
    var_684b19be1a3362f9 = game["spawnIdsToBeInstrumented"];
    nextspawntobeinstrumented = game["nextSpawnToBeInstrumented"];
    if (isdefined(spawncount) && isdefined(var_684b19be1a3362f9) && isdefined(nextspawntobeinstrumented)) {
        level.spawncount = spawncount;
        level.spawnidstobeinstrumented = var_684b19be1a3362f9;
        level.nextspawntobeinstrumented = nextspawntobeinstrumented;
    } else {
        level.spawncount = 0;
        level.spawnidstobeinstrumented = [];
        level.nextspawntobeinstrumented = 0;
        var_9b5e7bbe7bbe2095 = getdvarint(@"hash_883352c04ceb60d0");
        var_f173d241cde30ed5 = namespace_bd0162aedd8c8594::analytics_getmaxspawneventsforcurrentmode();
        var_ed9bcf1d68316223 = [];
        for (var_f7b3db25022143df = 0; var_f7b3db25022143df < var_9b5e7bbe7bbe2095; var_f7b3db25022143df++) {
            var_47839683093fa30e = randomintrange(20, var_f173d241cde30ed5);
            if (isdefined(var_ed9bcf1d68316223[var_47839683093fa30e])) {
                level.spawnidstobeinstrumented[var_f7b3db25022143df] = -1;
            } else {
                var_ed9bcf1d68316223[var_47839683093fa30e] = 1;
                level.spawnidstobeinstrumented[var_f7b3db25022143df] = var_47839683093fa30e;
            }
        }
        level.spawnidstobeinstrumented = array_sort_with_func(level.spawnidstobeinstrumented, &is_spawnid_a_less_than_b);
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339e
// Size: 0x87
function analyticssend_shouldsenddata(spawnid) {
    if (isdefined(level.nextspawntobeinstrumented) && isdefined(level.spawnidstobeinstrumented)) {
        if (level.nextspawntobeinstrumented < level.spawnidstobeinstrumented.size) {
            if (level.spawnidstobeinstrumented[level.nextspawntobeinstrumented] == -1) {
                level.nextspawntobeinstrumented++;
            }
            if (level.spawnidstobeinstrumented[level.nextspawntobeinstrumented] == spawnid) {
                level.nextspawntobeinstrumented++;
                return 1;
            }
        }
    }
    return 0;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342d
// Size: 0x184
function analyticssend_spawntype(spawn_pos, team_name, life_index, spawnid) {
    frontlineinfo = getglobalfrontlineinfo();
    var_e01c3eaff8656fff = frontlineinfo.midpoint;
    var_a4a67d69520e0248 = 0;
    var_a4a67e69520e047b = 0;
    var_a4a67f69520e06ae = 0;
    if (isdefined(var_e01c3eaff8656fff)) {
        var_a4a67d69520e0248 = var_e01c3eaff8656fff[0];
        var_a4a67e69520e047b = var_e01c3eaff8656fff[1];
        var_a4a67f69520e06ae = var_e01c3eaff8656fff[2];
    }
    var_edfd8ebb152d7d02 = 0;
    if (isdefined(frontlineinfo.teamdiffyaw)) {
        var_edfd8ebb152d7d02 = frontlineinfo.teamdiffyaw;
    }
    var_2cf02e998291f5ea = frontlineinfo.isactive[team_name];
    var_b3372bbd4ec17e38 = 0;
    if (isdefined(frontlineinfo.disabledreason) && isdefined(frontlineinfo.disabledreason[team_name])) {
        var_b3372bbd4ec17e38 = frontlineinfo.disabledreason[team_name];
    }
    var_86f685e81768ea92 = level.spawnglobals.logicvariantid;
    buddyspawnid = 0;
    if (isdefined(level.spawnglobals.buddyplayerid)) {
        buddyspawnid = level.spawnglobals.buddyplayerid;
        level.spawnglobals.buddyplayerid = 0;
    }
    bbreportspawntypes(var_a4a67d69520e0248, var_a4a67e69520e047b, var_a4a67f69520e06ae, var_edfd8ebb152d7d02, spawnid, var_2cf02e998291f5ea, var_b3372bbd4ec17e38, life_index, var_86f685e81768ea92, buddyspawnid);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b8
// Size: 0x1b8
function analyticssend_spawnplayerdetails(spawnplayer, spawnorigin, spawnid) {
    foreach (player in level.players) {
        if (isreallyalive(player)) {
            var_b8ecda907d8351e5 = player getplayerangles();
            player_yaw = vectortoyaw(var_b8ecda907d8351e5);
            player_position_x = player.origin[0];
            player_position_y = player.origin[1];
            player_position_z = player.origin[2];
            var_a4b47809b71bf9ce = 0;
            if (player == spawnplayer) {
                var_a4b47809b71bf9ce = 1;
            }
            var_1bf050cad818d5c0 = 0;
            if (isdefined(spawnplayer.lastattacker) && spawnplayer.lastattacker == player) {
                var_1bf050cad818d5c0 = 1;
            }
            player_team = 0;
            if (player.team == "axis") {
                player_team = 1;
            } else if (player.team == "allies") {
                player_team = 2;
            }
            player_id = 0;
            if (isdefined(player.analyticslog.playerid)) {
                player_id = player.analyticslog.playerid;
            }
            bbreportspawnplayerdetails(spawnid, player_yaw, player_position_x, player_position_y, player_position_z, player_id, player_team, var_a4b47809b71bf9ce, var_1bf050cad818d5c0);
        }
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3777
// Size: 0x30d
function analyticssend_spawnfactors(spawnplayer, var_b46d2a4b62c02cfe, spawn_id, var_bac9c46b10034944) {
    /#
        println("powerPrimary=");
    #/
    foreach (spawnpoint in level.spawnglobals.spawnpointslist) {
        totalscore = spawnpoint.totalscore;
        allyaveragedist = spawnpoint.analytics.allyaveragedist;
        enemyaveragedist = spawnpoint.analytics.enemyaveragedist;
        timesincelastspawn = spawnpoint.analytics.timesincelastspawn;
        var_7c710f0108211e9e = 0;
        if (isdefined(spawnplayer.lastspawnpoint) && spawnplayer.lastspawnpoint == spawnpoint) {
            var_7c710f0108211e9e = 1;
        }
        var_7f1500b202ddad69 = 0;
        if (var_bac9c46b10034944 == spawnpoint) {
            var_7f1500b202ddad69 = 1;
        }
        maxenemysightfraction = spawnpoint.analytics.maxenemysightfraction;
        randomscore = spawnpoint.analytics.randomscore;
        spawnusedbyenemies = spawnpoint.analytics.spawnusedbyenemies;
        lastspawnteam = 0;
        if (isdefined(spawnpoint.lastspawnteam) && spawnpoint.lastspawnteam == "axis") {
            lastspawnteam = 1;
        } else if (isdefined(spawnpoint.lastspawnteam) && spawnpoint.lastspawnteam == "allies") {
            lastspawnteam = 2;
        }
        lastspawntime = spawnpoint.lastspawntime;
        maxjumpingenemysightfraction = spawnpoint.analytics.maxjumpingenemysightfraction;
        var_f1cc4bc5ff3d4d6f = 0;
        if (isdefined(spawnpoint.index) && spawnpoint.index <= 1023) {
            var_f1cc4bc5ff3d4d6f = spawnpoint.index;
        }
        spawn_type = 0;
        if (isdefined(spawnpoint.analytics) && isdefined(spawnpoint.analytics.spawntype)) {
            spawn_type = spawnpoint.analytics.spawntype;
        }
        var_a60b2840cb045255 = 0;
        if (isdefined(spawnpoint.badspawnreason)) {
            var_a60b2840cb045255 = spawnpoint.badspawnreason;
        }
        bbreportspawnfactors(2, totalscore, maxenemysightfraction, maxjumpingenemysightfraction, randomscore, spawn_id, allyaveragedist, enemyaveragedist, var_7f1500b202ddad69, var_7c710f0108211e9e, lastspawnteam, var_f1cc4bc5ff3d4d6f, spawnusedbyenemies, timesincelastspawn, spawn_type, var_a60b2840cb045255);
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8b
// Size: 0x172
function analytics_getmaxspawneventsforcurrentmode() {
    var_7ad0f060d966ec01 = 120;
    if (isdefined(getgametype())) {
        if (getgametype() == "war") {
            var_7ad0f060d966ec01 = 120;
        } else if (getgametype() == "dom") {
            var_7ad0f060d966ec01 = 120;
        } else if (getgametype() == "conf") {
            var_7ad0f060d966ec01 = 120;
        } else if (getgametype() == "front") {
            var_7ad0f060d966ec01 = 40;
        } else if (getgametype() == "sd") {
            var_7ad0f060d966ec01 = 50;
        } else if (getgametype() == "dm") {
            var_7ad0f060d966ec01 = 50;
        } else if (getgametype() == "koth" || getgametype() == "koth_horde") {
            var_7ad0f060d966ec01 = 125;
        } else if (getgametype() == "ctf") {
            var_7ad0f060d966ec01 = 50;
        } else if (getgametype() == "tdef") {
            var_7ad0f060d966ec01 = 120;
        } else if (getgametype() == "siege") {
            var_7ad0f060d966ec01 = 25;
        } else if (getgametype() == "gun") {
            var_7ad0f060d966ec01 = 50;
        } else if (getgametype() == "sr") {
            var_7ad0f060d966ec01 = 25;
        } else if (getgametype() == "grind") {
            var_7ad0f060d966ec01 = 75;
        } else if (getgametype() == "pill") {
            var_7ad0f060d966ec01 = 75;
        } else if (getgametype() == "ball") {
            var_7ad0f060d966ec01 = 50;
        }
    }
    return var_7ad0f060d966ec01;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c05
// Size: 0x118
function logevent_nvgtoggled(game_time, player_life_index, pos, enabled, duration, disable_reason) {
    if (!analyticslogenabled()) {
        return;
    }
    player_id = -1;
    if (isdefined(self.analyticslog) && isdefined(self.analyticslog.playerid)) {
        player_id = self.analyticslog.playerid;
    }
    dlog_recordevent("dlog_event_gamemp_nvg_toggle", [0:"playerid", 1:player_id, 2:"game_time", 3:game_time, 4:"player_life_index", 5:player_life_index, 6:"x", 7:pos[0], 8:"y", 9:pos[1], 10:"z", 11:pos[2], 12:"enabled", 13:enabled, 14:"duration", 15:duration, 16:"disable_reason", 17:disable_reason]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d24
// Size: 0xa4
function getglobalfrontlineinfo() {
    if (!isdefined(level.frontlineinfo)) {
        level.frontlineinfo = spawnstruct();
        level.frontlineinfo.isactive = [];
        level.frontlineinfo.isactive["allies"] = 0;
        level.frontlineinfo.isactive["axis"] = 0;
        level.frontlineinfo.uptime = 0;
        level.frontlineinfo.downtime = 0;
    }
    return level.frontlineinfo;
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dd0
// Size: 0x14e
function logevent_playerhealed(player, amount, reviver) {
    amount = function_53c4c53197386572(amount, 0);
    var_7e660b31c7f8811d = isdefined(reviver);
    if (!var_7e660b31c7f8811d) {
        reviver = player;
    }
    life_index = -1;
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    player dlog_recordplayerevent("dlog_event_player_heal", [0:"reviver", 1:reviver, 2:"player_life_index", 3:life_index, 4:"pos_x", 5:player.origin[0], 6:"pos_y", 7:player.origin[1], 8:"pos_z", 9:player.origin[2], 10:"heal_ammount", 11:amount, 12:"was_revived", 13:var_7e660b31c7f8811d]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f25
// Size: 0xc2
function logevent_playerregen(player, amount) {
    if (!isdefined(player)) {
        return;
    }
    life_index = -1;
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    player dlog_recordplayerevent("dlog_event_player_regen", [0:"player_life_index", 1:life_index, 2:"heal_amount", 3:amount]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fee
// Size: 0x116
function logevent_fieldupgradeearned(player, var_a0897b14e0f4554b) {
    life_index = -1;
    var_a0897b14e0f4554b = function_53c4c53197386572(var_a0897b14e0f4554b, 0);
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    player dlog_recordplayerevent("dlog_event_player_field_upgrade_earned", [0:"player_life_index", 1:life_index, 2:"pos_x", 3:player.origin[0], 4:"pos_y", 5:player.origin[1], 6:"pos_z", 7:player.origin[2], 8:"field_upgrade_index", 9:var_a0897b14e0f4554b]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x410b
// Size: 0x116
function logevent_fieldupgradeactivated(player, var_a0897b14e0f4554b) {
    life_index = -1;
    var_a0897b14e0f4554b = function_53c4c53197386572(var_a0897b14e0f4554b, 0);
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    player dlog_recordplayerevent("dlog_event_player_field_upgrade_activated", [0:"player_life_index", 1:life_index, 2:"pos_x", 3:player.origin[0], 4:"pos_y", 5:player.origin[1], 6:"pos_z", 7:player.origin[2], 8:"field_upgrade_index", 9:var_a0897b14e0f4554b]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4228
// Size: 0x150
function logevent_fieldupgradeexpired(player, var_a0897b14e0f4554b, efficacy, var_4fac8b8ce36e09f1) {
    if (!isdefined(player)) {
        return;
    }
    var_a0897b14e0f4554b = function_53c4c53197386572(var_a0897b14e0f4554b, 0);
    if (!isdefined(efficacy)) {
        efficacy = 0;
    }
    life_index = -1;
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    player dlog_recordplayerevent("dlog_event_player_field_upgrade_expired", [0:"player_life_index", 1:life_index, 2:"pos_x", 3:player.origin[0], 4:"pos_y", 5:player.origin[1], 6:"pos_z", 7:player.origin[2], 8:"field_upgrade_index", 9:var_a0897b14e0f4554b, 10:"efficacy", 11:efficacy, 12:"was_destroyed", 13:var_4fac8b8ce36e09f1]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x437f
// Size: 0xe5
function logevent_killstreakavailable(player, lifeid, killstreakname, pickedup, matchtime, playerpos) {
    streaktype = "Killstreaks";
    if (istrue(player.var_8bc1ddad56ab00bf)) {
        streaktype = "Points";
    }
    player dlog_recordplayerevent("dlog_event_kill_streak_available", [0:"lifeindex", 1:lifeid, 2:"killstreak_name", 3:killstreakname, 4:"killstreak_pickedup", 5:pickedup, 6:"time_msfrommatchstart", 7:matchtime, 8:"playerposx", 9:playerpos[0], 10:"playerposy", 11:playerpos[1], 12:"playerposz", 13:playerpos[2], 14:"streak_type", 15:function_1823ff50bb28148d(streaktype)]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446b
// Size: 0xe5
function logevent_killstreakactivated(player, lifeid, killstreakname, pickedup, matchtime, playerpos) {
    streaktype = "Killstreaks";
    if (istrue(player.var_8bc1ddad56ab00bf)) {
        streaktype = "Points";
    }
    player dlog_recordplayerevent("dlog_event_kill_streak_activated", [0:"lifeindex", 1:lifeid, 2:"killstreak_name", 3:killstreakname, 4:"killstreak_pickedup", 5:pickedup, 6:"time_msfrommatchstart", 7:matchtime, 8:"playerposx", 9:playerpos[0], 10:"playerposy", 11:playerpos[1], 12:"playerposz", 13:playerpos[2], 14:"streak_type", 15:function_1823ff50bb28148d(streaktype)]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4557
// Size: 0x1ca
function logevent_killstreakexpired(player, lifeid, killstreakname, pickedup, var_6befa2534acb8df6, playerpos, expiredbydeath, shotsfired, var_8f52823e77aca0d3, var_f5ff9a2f5217b3ec, var_7e6dbb913989cf29) {
    if (!isdefined(player)) {
        return;
    }
    var_e44b504bf7cf1a67 = namespace_eb72aa155b5e14e7::gettimefrommatchstart(var_6befa2534acb8df6);
    streaktype = "Killstreaks";
    if (istrue(player.var_8bc1ddad56ab00bf)) {
        streaktype = "Points";
    }
    var_d3cf11436c80a43e = player dlog_recordplayerevent("dlog_event_kill_streak_expired", [0:"lifeindex", 1:lifeid, 2:"killstreak_name", 3:killstreakname, 4:"killstreak_pickedup", 5:pickedup, 6:"expiration_thru_death", 7:expiredbydeath, 8:"shots", 9:shotsfired, 10:"hits", 11:var_8f52823e77aca0d3, 12:"kills", 13:var_f5ff9a2f5217b3ec, 14:"score", 15:var_7e6dbb913989cf29, 16:"time_msfrommatchstart", 17:var_e44b504bf7cf1a67, 18:"playerposx", 19:playerpos[0], 20:"playerposy", 21:playerpos[1], 22:"playerposz", 23:playerpos[2], 24:"streak_type", 25:function_1823ff50bb28148d(streaktype)]);
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").kill_streak_expired_count) && var_d3cf11436c80a43e) {
        player.pers["telemetry"].kill_streak_expired_count++;
    }
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4728
// Size: 0x10b
function logevent_xpearned(player, var_5746d9f038b58234, weaponname, weaponxp, type) {
    life_index = -1;
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    player dlog_recordplayerevent("dlog_event_player_xp_earned", [0:"player_life_index", 1:life_index, 2:"player_xp_earned", 3:var_5746d9f038b58234, 4:"weapon_s", 5:weaponname, 6:"weapon_xp_earned", 7:weaponxp, 8:"xp_event", 9:type]);
    namespace_a011fbf6d93f25e5::function_cb3b3cbf2d1ac3f3(var_5746d9f038b58234, weaponxp, life_index, weaponname, player, type);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483a
// Size: 0xbc
function logevent_spawnselectionchoice(player, selection) {
    life_index = -1;
    if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry")) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life) && isdefined(player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index)) {
        life_index = player namespace_3c5a4254f2b957ea::getpersstat("telemetry").life.life_index;
    }
    player dlog_recordplayerevent("dlog_event_player_spawnselection_choice", [0:"player_life_index", 1:life_index, 2:"selection", 3:selection]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x48fd
// Size: 0x5b
function logevent_challengeitemunlocked(player, var_443f88e60a6c1697, itemtype, itemid) {
    player dlog_recordplayerevent("dlog_event_player_challenge_item_unlocked", [0:"item_unlock_ref", 1:var_443f88e60a6c1697, 2:"item_type", 3:itemtype, 4:"item_id", 5:itemid]);
}

// Namespace analyticslog/namespace_bd0162aedd8c8594
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x495f
// Size: 0x94
function function_b4e1d087442647ef(var_4ec493e39340a7ce, victimid, var_9fb1ea0d886f8c27, var_244d4aac201aa9d, var_fc4a790cbd8e6140, endreason) {
    dlog_recordevent("dlog_event_player_interrogation_complete", [0:"player_interrogator", 1:var_4ec493e39340a7ce, 2:"player_victim", 3:victimid, 4:"player_squad_size", 5:var_9fb1ea0d886f8c27, 6:"player_squad_equipment", 7:var_244d4aac201aa9d, 8:"player_interrogation_duration", 9:var_fc4a790cbd8e6140, 10:"end_reason", 11:endreason]);
}

