#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\archetypes\archcommon.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\archetypes\archassault.gsc;

#namespace proxyagent;

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0xc2
function controlproxyagent(agent, streakinfo, endnotifymsg, var_cc5090d95e0c16d9, var_f661e51eafc4f486, visionset) {
    self.proxydisableweapon = undefined;
    if (var_cc5090d95e0c16d9 < 3) {
        return false;
    }
    result = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweapontabletdeploy(streakinfo);
    if (!result) {
        return false;
    }
    thread watchplayerkillstreakend(endnotifymsg);
    thread watchgameend();
    if (!isdefined(var_f661e51eafc4f486) || !var_f661e51eafc4f486) {
        thread watchplayerkillstreakearlyexit(endnotifymsg);
    }
    if (isalive(agent) && !istrue(agent.dying)) {
        startcontrol(agent, streakinfo.streakname, endnotifymsg, visionset);
    } else {
        self notify(endnotifymsg);
        return false;
    }
    return true;
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x288
// Size: 0xf0
function watchplayerkillstreakdeath(endnotifymsg, streakname) {
    self endon("disconnect");
    self endon(endnotifymsg);
    while (true) {
        einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon = self waittill("player_killstreak_death");
        if (eattacker != self && isplayer(eattacker)) {
            eattacker thread doScoreEvent(hashcat(#"destroyed_", streakname));
            thread teamplayercardsplash("callout_destroyed_" + streakname, eattacker);
            objweapon = makeweaponfromstring(sweapon);
            thread scripts\cp_mp\challenges::killstreakkilled(streakname, self, self, eattacker, idamage, smeansofdeath, objweapon, "destroyed_" + streakname);
            thread scripts\mp\utility\dialog::leaderdialogonplayer(streakname + "_destroyed", undefined, undefined, self.origin);
        }
        self notify(endnotifymsg, 1);
    }
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x380
// Size: 0x1c
function watchplayerkillstreakdisconnect(endnotifymsg) {
    self endon(endnotifymsg);
    self waittill("disconnect");
    self notify(endnotifymsg, 1);
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4
// Size: 0x1c
function watchplayerkillstreakswitchteam(endnotifymsg) {
    self endon(endnotifymsg);
    self waittill("joined_team");
    self notify(endnotifymsg, 1);
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c8
// Size: 0x72
function watchplayerkillstreakearlyexit(endnotifymsg) {
    self endon("disconnect");
    self endon(endnotifymsg);
    updaterate = level.framedurationseconds;
    while (true) {
        timeused = 0;
        while (self usebuttonpressed()) {
            timeused += updaterate;
            if (timeused > 0.75) {
                self.playerkillstreakearlyexitlocation = self.origin;
                self notify(endnotifymsg);
                return;
            }
            wait updaterate;
        }
        waitframe();
    }
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x442
// Size: 0x25
function watchplayerkillstreaktimeout(endnotifymsg, var_e6bcba36402ee560) {
    self endon("disconnect");
    self endon(endnotifymsg);
    wait var_e6bcba36402ee560;
    self notify(endnotifymsg, 1);
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46f
// Size: 0x3e
function watchplayerkillstreakemp(endnotifymsg) {
    self endon("disconnect");
    self endon(endnotifymsg);
    while (true) {
        attacker, duration = self waittill("emp_damage");
        /#
        #/
    }
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b5
// Size: 0x1f
function watchplayerkillstreakend(endnotifymsg) {
    waittill_any_2(endnotifymsg, "level_game_ended");
    stopcontrol();
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dc
// Size: 0x12
function watchgameend() {
    level waittill("game_ended");
    self notify("level_game_ended");
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x52
function startcontrol(agent, streakname, endnotifymsg, visionset) {
    if (isdefined(self) && isalive(agent)) {
        self controlagent(agent);
        if (isdefined(visionset)) {
            self visionsetnakedforplayer(visionset, 0);
        }
        self.playerproxyagent = agent;
    }
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x550
// Size: 0x4c
function stopcontrol() {
    if (isdefined(self)) {
        if (iscontrollingproxyagent()) {
            self restorecontrolagent();
            self visionsetnakedforplayer("", 0);
        }
        assertmsg("<dev string:x1c>");
        self.streakinfo notify("killstreak_finished_with_deploy_weapon");
        self.playerproxyagent = undefined;
    }
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a4
// Size: 0x24
function cleararchetype(classstruct) {
    scripts\mp\archetypes\archcommon::removearchetype(classstruct.loadoutarchetype);
    scripts\mp\class::loadout_clearperks();
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d0
// Size: 0x53
function reapplyarchetype(classstruct) {
    funcapply = undefined;
    switch (classstruct.loadoutarchetype) {
    case #"hash_98ff6f21872f18e0": 
        funcapply = &scripts\mp\archetypes\archassault::applyarchetype;
        break;
    }
    scripts\mp\class::loadout_updateplayerperks(classstruct);
    if (isdefined(funcapply)) {
        self [[ funcapply ]]();
    }
}

// Namespace proxyagent / scripts\mp\killstreaks\proxyagent
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62b
// Size: 0xb
function killproxy(keepcorpse) {
    
}

