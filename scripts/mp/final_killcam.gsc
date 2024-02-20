// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\potg.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\killcam.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\stats.gsc;

#namespace final_killcam;

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0xb2
function initfinalkillcam() {
    level.finalkillcamenabled = level.finalkillcamtype == 0;
    level.finalkillcams = [];
    foreach (teamname in level.teamnamelist) {
        level.finalkillcams[teamname] = undefined;
    }
    level.finalkillcams["none"] = undefined;
    level.finalkillcam_winner = undefined;
    level.recordfinalkillcam = 1;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        level.finalkillcamenabled = 1;
        return;
    }
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2
// Size: 0x52
function erasefinalkillcam() {
    for (i = 0; i < level.teamnamelist.size; i++) {
        level.finalkillcams[level.teamnamelist[i]] = undefined;
    }
    level.finalkillcams["none"] = undefined;
    level.finalkillcam_winner = undefined;
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b
// Size: 0x295
function preloadfinalkillcam() {
    spectateentity = undefined;
    if (istrue(level.nukeinfo.detonated)) {
        return;
    }
    if (istrue(level.brdisablefinalkillcam)) {
        return;
    }
    if (getdvarint(@"hash_166b51bf7450fc22", 0) == 1) {
        return;
    }
    if (istrue(level.skipfinalkillcam)) {
        return;
    }
    /#
        assertex(level.finalkillcamenabled || level.potgenabled, "Neither POTG nor final killlcam or enabled -- one needs to be enabled for proper match flow");
    #/
    if (level.potgenabled) {
        if (namespace_ab70c875589b8f6a::shouldskippotg()) {
            level.potgenabled = 0;
            level.finalkillcamtype = 0;
            level.finalkillcamenabled = 1;
        }
    }
    var_b5a1f56c62bdb31d = undefined;
    if (level.finalkillcamenabled) {
        var_b5a1f56c62bdb31d = level.finalkillcams[level.finalkillcam_winner];
        if (!isdefined(var_b5a1f56c62bdb31d)) {
            namespace_4b0406965e556711::levelflagset("final_killcam_preloaded");
            return;
        }
        spectateentity = var_b5a1f56c62bdb31d.attacker;
    } else {
        /#
            assert(level.potgenabled);
        #/
        var_599be23b9afb9909 = gettime();
        while (!namespace_ab70c875589b8f6a::issystemfinalized()) {
            waitframe();
        }
        if (namespace_ab70c875589b8f6a::shouldskippotg() == 0) {
            var_a1f409e21eb26925 = namespace_ab70c875589b8f6a::getfinalpotginfo();
            if (!isdefined(var_a1f409e21eb26925)) {
                namespace_4b0406965e556711::levelflagset("final_killcam_preloaded");
                return;
            }
            spectateentity = var_a1f409e21eb26925.spectateentity;
        } else {
            level.potgenabled = 0;
            level.finalkillcamtype = 0;
            level.finalkillcamenabled = 1;
            var_b5a1f56c62bdb31d = level.finalkillcams[level.finalkillcam_winner];
            if (!isdefined(var_b5a1f56c62bdb31d)) {
                namespace_4b0406965e556711::levelflagset("final_killcam_preloaded");
                return;
            }
            spectateentity = var_b5a1f56c62bdb31d.attacker;
        }
    }
    if (!isdefined(spectateentity) || !isplayer(spectateentity)) {
        namespace_4b0406965e556711::levelflagset("final_killcam_preloaded");
        return;
    }
    if (isdefined(var_b5a1f56c62bdb31d) && isdefined(var_b5a1f56c62bdb31d.var_14a780f439cfff1d)) {
        var_b2d56fe9c46fb7b4 = var_b5a1f56c62bdb31d.var_14a780f439cfff1d;
    } else {
        var_b2d56fe9c46fb7b4 = spectateentity geteye();
    }
    foreach (player in level.players) {
        player loadcustomizationplayerview(spectateentity);
        player function_bc667001f9dd3808(var_b2d56fe9c46fb7b4);
    }
    if (level.potgenabled) {
        wait(1);
    }
    namespace_4b0406965e556711::levelflagset("final_killcam_preloaded");
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b7
// Size: 0x118
function dopotgkillcam() {
    if (istrue(level.skipfinalkillcam) || istrue(level.nukeinfo.detonated)) {
        return;
    }
    level.showingfinalkillcam = 1;
    level.maxkillcamdelay = 0;
    foreach (player in level.players) {
        player thread dopotgkillcamforplayer();
    }
    while (1) {
        anyplayersinkillcam = 0;
        foreach (player in level.players) {
            if (istrue(player.inpotgkillcam)) {
                anyplayersinkillcam = 1;
                break;
            }
        }
        if (!anyplayersinkillcam) {
            break;
        }
        waitframe();
    }
    level.showingfinalkillcam = 0;
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6
// Size: 0xe3
function dopotgkillcamforplayer() {
    self endon("disconnect");
    self.inpotgkillcam = 1;
    restorebasevisionset(0);
    self setclientomnvar("post_game_state", 4);
    var_a1f409e21eb26925 = namespace_ab70c875589b8f6a::getfinalpotginfo();
    if (!isdefined(var_a1f409e21eb26925) || !isdefined(var_a1f409e21eb26925.spectateentity)) {
        potgkillcamover();
        return;
    }
    thread namespace_34eb47d51c422b79::potg_killcam(var_a1f409e21eb26925.spectateentity, var_a1f409e21eb26925.psoffsettime, var_a1f409e21eb26925.starttime, var_a1f409e21eb26925.endtime);
    result = waittill_any_return_no_endon_death_2("begin_killcam", "killcam_ended");
    if (result == "killcam_ended") {
        potgkillcamover();
        return;
    }
    thread setuipostgamefade(1, self.killcamlength - 0.5);
    self waittill("killcam_ended");
    potgkillcamover();
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c0
// Size: 0x1b
function potgkillcamover() {
    self setclientomnvar("post_game_state", 1);
    self.inpotgkillcam = 0;
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x2f2
function dofinalkillcam() {
    /#
        assertex(level.finalkillcamenabled, "doFinalKillcam called when it's not enabled!");
    #/
    if (!level.finalkillcamenabled) {
        return 0;
    }
    if (istrue(level.skipfinalkillcam) || istrue(level.nukeinfo.detonated)) {
        return 0;
    }
    level.showingfinalkillcam = 1;
    winner = "none";
    if (isdefined(level.finalkillcam_winner)) {
        winner = level.finalkillcam_winner;
    }
    var_b5a1f56c62bdb31d = level.finalkillcams[winner];
    if (!isdefined(var_b5a1f56c62bdb31d)) {
        level.showingfinalkillcam = 0;
        return 0;
    }
    attacker = var_b5a1f56c62bdb31d.attacker;
    victim = var_b5a1f56c62bdb31d.victim;
    if (!isdefined(victim) || !isdefined(attacker)) {
        level.showingfinalkillcam = 0;
        return 0;
    }
    var_16abe9498a90c7bf = 20;
    var_b9c918312aa1bb86 = getsecondspassed() - var_b5a1f56c62bdb31d.timerecorded;
    if (var_b9c918312aa1bb86 > var_16abe9498a90c7bf) {
        level.showingfinalkillcam = 0;
        return 0;
    }
    level thread namespace_aad14af462a74d08::processfinalkillchallenges(attacker, victim);
    postdeathdelay = (gettime() - victim.deathtime) / 1000;
    setglobalsoundcontext("atmosphere", "killcam", 0.1);
    level.maxkillcamdelay = 0;
    foreach (player in level.players) {
        player restorebasevisionset(0);
        player.killcamentitylookat = victim getentitynumber();
        player namespace_3e725f3cc58bddd3::updatedeathdetails(var_b5a1f56c62bdb31d.attackers, var_b5a1f56c62bdb31d.attackerdata, attacker);
        if (!iskillstreakweapon(var_b5a1f56c62bdb31d.objweapon.basename)) {
            player namespace_34eb47d51c422b79::setkillcamnormalweaponomnvars(var_b5a1f56c62bdb31d.objweapon, var_b5a1f56c62bdb31d.smeansofdeath, var_b5a1f56c62bdb31d.einflictor, var_b5a1f56c62bdb31d.executionref, var_b5a1f56c62bdb31d.attacker);
        }
        player setclientomnvar("post_game_state", 3);
        player setclientomnvar("ui_killcam_victim_or_attacker", 1);
        if (player iscodcaster()) {
            player setclientomnvar("ui_killcam_killedby_health_ratio", var_b5a1f56c62bdb31d.var_6035b072327656eb);
        }
        player playlocalsound("final_killcam_in");
        player setclienttriggeraudiozonepartial("killcam", "mix");
        player thread namespace_34eb47d51c422b79::dokillcamfromstruct(var_b5a1f56c62bdb31d, postdeathdelay, 0, 1);
    }
    wait(0.15 + level.maxkillcamdelay);
    while (anyplayersinkillcam()) {
        waitframe();
    }
    level.showingfinalkillcam = 0;
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdb
// Size: 0x3a
function finalkillcamplaybackbegin() {
    self notify("showing_final_killcam");
    thread setuipostgamefade(1, self.killcamlength - 0.5);
    self setclientomnvar("post_game_state", 3);
    thread watchplaybackend();
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1c
// Size: 0x53
function watchplaybackend() {
    self endon("killcam_canceled");
    self waittill("killcam_ended");
    setglobalsoundcontext("atmosphere", "", 0.5);
    if (getgametype() != "arena") {
        self playlocalsound("final_killcam_out");
    }
    self clearclienttriggeraudiozone(4);
    thread namespace_99ac021a7547cae3::spawnendofgame();
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc76
// Size: 0x2bc
function recordfinalkillcam(delay, victim, attacker, attackernum, einflictor, killcamentityindex, killcamentitystarttime, var_f2d4e6802c5d8473, objweapon, psoffsettime, smeansofdeath) {
    if (!namespace_ab70c875589b8f6a::shouldskippotg()) {
        return;
    }
    inflictoragentinfo = spawnstruct();
    if (isdefined(einflictor) && isagent(einflictor)) {
        inflictoragentinfo.agent_type = einflictor.agent_type;
        inflictoragentinfo.lastspawntime = einflictor.lastspawntime;
        if (!isdefined(inflictoragentinfo.lastspawntime)) {
            inflictoragentinfo.lastspawntime = einflictor.spawntime;
        }
        /#
            assert(isdefined(inflictoragentinfo.lastspawntime), "Didn't find the time this agent spawned");
        #/
    }
    var_23cc182d2553796a = [];
    foreach (perk in attacker.pers["loadoutPerks"]) {
        var_23cc182d2553796a[var_23cc182d2553796a.size] = perk;
    }
    if (isdefined(attacker.var_15f3e6df722fb1cf)) {
        var_23cc182d2553796a[var_23cc182d2553796a.size] = attacker.var_15f3e6df722fb1cf;
    }
    if (isdefined(attacker.var_15f3e5df722faf9c)) {
        var_23cc182d2553796a[var_23cc182d2553796a.size] = attacker.var_15f3e5df722faf9c;
    }
    var_b5a1f56c62bdb31d = namespace_34eb47d51c422b79::makekillcamdata(einflictor, inflictoragentinfo, attackernum, killcamentityindex, killcamentitystarttime, victim getentitynumber(), var_f2d4e6802c5d8473, objweapon, psoffsettime, 12, attacker, victim, smeansofdeath, var_23cc182d2553796a, 0, 1);
    var_b5a1f56c62bdb31d.timerecorded = getsecondspassed();
    if (smeansofdeath == "MOD_EXECUTION") {
        var_b5a1f56c62bdb31d.timerecorded = var_b5a1f56c62bdb31d.timerecorded - 3;
        var_b5a1f56c62bdb31d.timerecorded = max(0, var_b5a1f56c62bdb31d.timerecorded);
    }
    var_b5a1f56c62bdb31d.attackers = victim.attackers;
    var_b5a1f56c62bdb31d.attackerdata = victim.attackerdata;
    if (level.teambased && isdefined(attacker.team)) {
        level.finalkillcams[attacker.team] = var_b5a1f56c62bdb31d;
    } else if (!level.teambased) {
        level.finalkillcams[attacker.guid] = var_b5a1f56c62bdb31d;
    }
    level.finalkillcams["none"] = var_b5a1f56c62bdb31d;
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf39
// Size: 0x43
function waitskipkillcambuttonduringdeathtimer() {
    self endon("disconnect");
    self endon("killcam_death_done_waiting");
    self notifyonplayercommand("death_respawn", "+usereload");
    self notifyonplayercommand("death_respawn", "+activate");
    self waittill("death_respawn");
    self notify("killcam_death_button_cancel");
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf83
// Size: 0x24
function waitskipkillcamduringdeathtimer(waittime) {
    self endon("disconnect");
    self endon("killcam_death_button_cancel");
    wait(waittime);
    self notify("killcam_death_done_waiting");
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfae
// Size: 0xa0
function skipkillcamduringdeathtimer(waittime) {
    if (!isdefined(self)) {
        return 0;
    }
    self endon("disconnect");
    if (level.showingfinalkillcam) {
        return 0;
    }
    if (!isai(self)) {
        thread waitskipkillcambuttonduringdeathtimer();
        thread waitskipkillcamduringdeathtimer(waittime);
        result = waittill_any_return_2("killcam_death_done_waiting", "killcam_death_button_cancel");
        if (!isdefined(self)) {
            return 0;
        }
        if (isdefined(result) && result == "killcam_death_done_waiting") {
            self.skippedkillcam = 0;
            return 0;
        } else {
            self.skippedkillcam = 1;
            namespace_3c5a4254f2b957ea::incpersstat("skippedKillcams", 1);
            return 1;
        }
    }
    return 0;
}

// Namespace final_killcam/namespace_70d685b02aaee20e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1056
// Size: 0x63
function anyplayersinkillcam() {
    foreach (player in level.players) {
        if (isdefined(player.killcam)) {
            return 1;
        }
    }
    return 0;
}

