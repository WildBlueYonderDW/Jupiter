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

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0xb1
function initfinalkillcam() {
    level.finalkillcamenabled = level.finalkillcamtype == 0;
    level.finalkillcams = [];
    foreach (teamname in level.teamnamelist) {
        level.finalkillcams[teamname] = undefined;
    }
    level.finalkillcams["none"] = undefined;
    level.finalkillcam_winner = undefined;
    level.recordfinalkillcam = 1;
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        level.finalkillcamenabled = 1;
        return;
    }
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2
// Size: 0x51
function erasefinalkillcam() {
    for (i = 0; i < level.teamnamelist.size; i++) {
        level.finalkillcams[level.teamnamelist[i]] = undefined;
    }
    level.finalkillcams["none"] = undefined;
    level.finalkillcam_winner = undefined;
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b
// Size: 0x294
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
    assertex(level.finalkillcamenabled || level.potgenabled, "Neither POTG nor final killlcam or enabled -- one needs to be enabled for proper match flow");
    if (level.potgenabled) {
        if (scripts\mp\potg::shouldskippotg()) {
            level.potgenabled = 0;
            level.finalkillcamtype = 0;
            level.finalkillcamenabled = 1;
        }
    }
    killcamstruct = undefined;
    if (level.finalkillcamenabled) {
        killcamstruct = level.finalkillcams[level.finalkillcam_winner];
        if (!isdefined(killcamstruct)) {
            scripts\mp\flags::levelflagset("final_killcam_preloaded");
            return;
        }
        spectateentity = killcamstruct.attacker;
    } else {
        assert(level.potgenabled);
        waitstarttime = gettime();
        while (!scripts\mp\potg::issystemfinalized()) {
            waitframe();
        }
        if (scripts\mp\potg::shouldskippotg() == 0) {
            var_a1f409e21eb26925 = scripts\mp\potg::getfinalpotginfo();
            if (!isdefined(var_a1f409e21eb26925)) {
                scripts\mp\flags::levelflagset("final_killcam_preloaded");
                return;
            }
            spectateentity = var_a1f409e21eb26925.spectateentity;
        } else {
            level.potgenabled = 0;
            level.finalkillcamtype = 0;
            level.finalkillcamenabled = 1;
            killcamstruct = level.finalkillcams[level.finalkillcam_winner];
            if (!isdefined(killcamstruct)) {
                scripts\mp\flags::levelflagset("final_killcam_preloaded");
                return;
            }
            spectateentity = killcamstruct.attacker;
        }
    }
    if (!isdefined(spectateentity) || !isplayer(spectateentity)) {
        scripts\mp\flags::levelflagset("final_killcam_preloaded");
        return;
    }
    if (isdefined(killcamstruct) && isdefined(killcamstruct.streampos)) {
        var_b2d56fe9c46fb7b4 = killcamstruct.streampos;
    } else {
        var_b2d56fe9c46fb7b4 = spectateentity geteye();
    }
    foreach (player in level.players) {
        player loadcustomizationplayerview(spectateentity);
        player function_bc667001f9dd3808(var_b2d56fe9c46fb7b4);
    }
    if (level.potgenabled) {
        wait 1;
    }
    scripts\mp\flags::levelflagset("final_killcam_preloaded");
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b7
// Size: 0x117
function dopotgkillcam() {
    if (istrue(level.skipfinalkillcam) || istrue(level.nukeinfo.detonated)) {
        return;
    }
    level.showingfinalkillcam = 1;
    level.maxkillcamdelay = 0;
    foreach (player in level.players) {
        player thread dopotgkillcamforplayer();
    }
    while (true) {
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

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6
// Size: 0xe2
function dopotgkillcamforplayer() {
    self endon("disconnect");
    self.inpotgkillcam = 1;
    restorebasevisionset(0);
    self setclientomnvar("post_game_state", 4);
    var_a1f409e21eb26925 = scripts\mp\potg::getfinalpotginfo();
    if (!isdefined(var_a1f409e21eb26925) || !isdefined(var_a1f409e21eb26925.spectateentity)) {
        potgkillcamover();
        return;
    }
    thread scripts\mp\killcam::potg_killcam(var_a1f409e21eb26925.spectateentity, var_a1f409e21eb26925.psoffsettime, var_a1f409e21eb26925.starttime, var_a1f409e21eb26925.endtime);
    result = waittill_any_return_no_endon_death_2("begin_killcam", "killcam_ended");
    if (result == "killcam_ended") {
        potgkillcamover();
        return;
    }
    thread setuipostgamefade(1, self.killcamlength - 0.5);
    self waittill("killcam_ended");
    potgkillcamover();
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c0
// Size: 0x1a
function potgkillcamover() {
    self setclientomnvar("post_game_state", 1);
    self.inpotgkillcam = 0;
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x2f1
function dofinalkillcam() {
    assertex(level.finalkillcamenabled, "doFinalKillcam called when it's not enabled!");
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
    killcamstruct = level.finalkillcams[winner];
    if (!isdefined(killcamstruct)) {
        level.showingfinalkillcam = 0;
        return 0;
    }
    attacker = killcamstruct.attacker;
    victim = killcamstruct.victim;
    if (!isdefined(victim) || !isdefined(attacker)) {
        level.showingfinalkillcam = 0;
        return 0;
    }
    var_16abe9498a90c7bf = 20;
    killcamoffsettime = getsecondspassed() - killcamstruct.timerecorded;
    if (killcamoffsettime > var_16abe9498a90c7bf) {
        level.showingfinalkillcam = 0;
        return 0;
    }
    level thread scripts\cp_mp\challenges::processfinalkillchallenges(attacker, victim);
    postdeathdelay = (gettime() - victim.deathtime) / 1000;
    setglobalsoundcontext("atmosphere", "killcam", 0.1);
    level.maxkillcamdelay = 0;
    foreach (player in level.players) {
        player restorebasevisionset(0);
        player.killcamentitylookat = victim getentitynumber();
        player scripts\mp\damage::updatedeathdetails(killcamstruct.attackers, killcamstruct.attackerdata, attacker);
        if (!iskillstreakweapon(killcamstruct.objweapon.basename)) {
            player scripts\mp\killcam::setkillcamnormalweaponomnvars(killcamstruct.objweapon, killcamstruct.smeansofdeath, killcamstruct.einflictor, killcamstruct.executionref, killcamstruct.attacker);
        }
        player setclientomnvar("post_game_state", 3);
        player setclientomnvar("ui_killcam_victim_or_attacker", 1);
        if (player iscodcaster()) {
            player setclientomnvar("ui_killcam_killedby_health_ratio", killcamstruct.attackerhealthratio);
        }
        player playlocalsound("final_killcam_in");
        player setclienttriggeraudiozonepartial("killcam", "mix");
        player thread scripts\mp\killcam::dokillcamfromstruct(killcamstruct, postdeathdelay, 0, 1);
    }
    wait 0.15 + level.maxkillcamdelay;
    while (anyplayersinkillcam()) {
        waitframe();
    }
    level.showingfinalkillcam = 0;
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdb
// Size: 0x39
function finalkillcamplaybackbegin() {
    self notify("showing_final_killcam");
    thread setuipostgamefade(1, self.killcamlength - 0.5);
    self setclientomnvar("post_game_state", 3);
    thread watchplaybackend();
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1c
// Size: 0x52
function watchplaybackend() {
    self endon("killcam_canceled");
    self waittill("killcam_ended");
    setglobalsoundcontext("atmosphere", "", 0.5);
    if (getgametype() != "arena") {
        self playlocalsound("final_killcam_out");
    }
    self clearclienttriggeraudiozone(4);
    thread scripts\mp\playerlogic::spawnendofgame();
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc76
// Size: 0x2bb
function recordfinalkillcam(delay, victim, attacker, attackernum, einflictor, killcamentityindex, killcamentitystarttime, var_f2d4e6802c5d8473, objweapon, psoffsettime, smeansofdeath) {
    if (!scripts\mp\potg::shouldskippotg()) {
        return;
    }
    inflictoragentinfo = spawnstruct();
    if (isdefined(einflictor) && isagent(einflictor)) {
        inflictoragentinfo.agent_type = einflictor.agent_type;
        inflictoragentinfo.lastspawntime = einflictor.lastspawntime;
        if (!isdefined(inflictoragentinfo.lastspawntime)) {
            inflictoragentinfo.lastspawntime = einflictor.spawntime;
        }
        assert(isdefined(inflictoragentinfo.lastspawntime), "Didn't find the time this agent spawned");
    }
    perkarray = [];
    foreach (perk in attacker.pers["loadoutPerks"]) {
        perkarray[perkarray.size] = perk;
    }
    if (isdefined(attacker.var_15f3e6df722fb1cf)) {
        perkarray[perkarray.size] = attacker.var_15f3e6df722fb1cf;
    }
    if (isdefined(attacker.var_15f3e5df722faf9c)) {
        perkarray[perkarray.size] = attacker.var_15f3e5df722faf9c;
    }
    killcamstruct = scripts\mp\killcam::makekillcamdata(einflictor, inflictoragentinfo, attackernum, killcamentityindex, killcamentitystarttime, victim getentitynumber(), var_f2d4e6802c5d8473, objweapon, psoffsettime, 12, attacker, victim, smeansofdeath, perkarray, 0, 1);
    killcamstruct.timerecorded = getsecondspassed();
    if (smeansofdeath == "MOD_EXECUTION") {
        killcamstruct.timerecorded -= 3;
        killcamstruct.timerecorded = max(0, killcamstruct.timerecorded);
    }
    killcamstruct.attackers = victim.attackers;
    killcamstruct.attackerdata = victim.attackerdata;
    if (level.teambased && isdefined(attacker.team)) {
        level.finalkillcams[attacker.team] = killcamstruct;
    } else if (!level.teambased) {
        level.finalkillcams[attacker.guid] = killcamstruct;
    }
    level.finalkillcams["none"] = killcamstruct;
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf39
// Size: 0x42
function waitskipkillcambuttonduringdeathtimer() {
    self endon("disconnect");
    self endon("killcam_death_done_waiting");
    self notifyonplayercommand("death_respawn", "+usereload");
    self notifyonplayercommand("death_respawn", "+activate");
    self waittill("death_respawn");
    self notify("killcam_death_button_cancel");
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf83
// Size: 0x23
function waitskipkillcamduringdeathtimer(waittime) {
    self endon("disconnect");
    self endon("killcam_death_button_cancel");
    wait waittime;
    self notify("killcam_death_done_waiting");
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfae
// Size: 0x9f
function skipkillcamduringdeathtimer(waittime) {
    if (!isdefined(self)) {
        return false;
    }
    self endon("disconnect");
    if (level.showingfinalkillcam) {
        return false;
    }
    if (!isai(self)) {
        thread waitskipkillcambuttonduringdeathtimer();
        thread waitskipkillcamduringdeathtimer(waittime);
        result = waittill_any_return_2("killcam_death_done_waiting", "killcam_death_button_cancel");
        if (!isdefined(self)) {
            return false;
        }
        if (isdefined(result) && result == "killcam_death_done_waiting") {
            self.skippedkillcam = 0;
            return false;
        } else {
            self.skippedkillcam = 1;
            scripts\mp\utility\stats::incpersstat("skippedKillcams", 1);
            return true;
        }
    }
    return false;
}

// Namespace final_killcam / scripts\mp\final_killcam
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1056
// Size: 0x62
function anyplayersinkillcam() {
    foreach (player in level.players) {
        if (isdefined(player.killcam)) {
            return true;
        }
    }
    return false;
}

