// mwiii decomp prototype
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

#namespace namespace_873068c8552b41ec;

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1df
// Size: 0xc2
function controlproxyagent(agent, streakinfo, var_5f321a57443e1a54, var_cc5090d95e0c16d9, var_f661e51eafc4f486, visionset) {
    self.proxydisableweapon = undefined;
    if (var_cc5090d95e0c16d9 < 3) {
        return 0;
    }
    result = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo);
    if (!result) {
        return 0;
    }
    thread watchplayerkillstreakend(var_5f321a57443e1a54);
    thread watchgameend();
    if (!isdefined(var_f661e51eafc4f486) || !var_f661e51eafc4f486) {
        thread watchplayerkillstreakearlyexit(var_5f321a57443e1a54);
    }
    if (isalive(agent) && !istrue(agent.dying)) {
        startcontrol(agent, streakinfo.streakname, var_5f321a57443e1a54, visionset);
    } else {
        self notify(var_5f321a57443e1a54);
        return 0;
    }
    return 1;
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9
// Size: 0xf6
function watchplayerkillstreakdeath(var_5f321a57443e1a54, streakname) {
    self endon("disconnect");
    self endon(var_5f321a57443e1a54);
    while (1) {
        sweapon = smeansofdeath = idflags = idamage = eattacker = einflictor = self waittill("player_killstreak_death");
        if (eattacker != self && isplayer(eattacker)) {
            eattacker thread doScoreEvent(function_2ef675c13ca1c4af(#"destroyed_", streakname));
            thread teamplayercardsplash("callout_destroyed_" + streakname, eattacker);
            objweapon = makeweaponfromstring(sweapon);
            thread namespace_aad14af462a74d08::killstreakkilled(streakname, self, self, eattacker, idamage, smeansofdeath, objweapon, "destroyed_" + streakname);
            thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer(streakname + "_destroyed", undefined, undefined, self.origin);
        }
        self notify(var_5f321a57443e1a54, 1);
    }
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x1d
function watchplayerkillstreakdisconnect(var_5f321a57443e1a54) {
    self endon(var_5f321a57443e1a54);
    self waittill("disconnect");
    self notify(var_5f321a57443e1a54, 1);
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ca
// Size: 0x1d
function watchplayerkillstreakswitchteam(var_5f321a57443e1a54) {
    self endon(var_5f321a57443e1a54);
    self waittill("joined_team");
    self notify(var_5f321a57443e1a54, 1);
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee
// Size: 0x73
function watchplayerkillstreakearlyexit(var_5f321a57443e1a54) {
    self endon("disconnect");
    self endon(var_5f321a57443e1a54);
    updaterate = level.framedurationseconds;
    while (1) {
        timeused = 0;
        while (self usebuttonpressed()) {
            timeused = timeused + updaterate;
            if (timeused > 0.75) {
                self.playerkillstreakearlyexitlocation = self.origin;
                self notify(var_5f321a57443e1a54);
                return;
            }
            wait(updaterate);
        }
        waitframe();
    }
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x468
// Size: 0x26
function watchplayerkillstreaktimeout(var_5f321a57443e1a54, var_e6bcba36402ee560) {
    self endon("disconnect");
    self endon(var_5f321a57443e1a54);
    wait(var_e6bcba36402ee560);
    self notify(var_5f321a57443e1a54, 1);
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x495
// Size: 0x3f
function watchplayerkillstreakemp(var_5f321a57443e1a54) {
    self endon("disconnect");
    self endon(var_5f321a57443e1a54);
    while (1) {
        duration = attacker = self waittill("emp_damage");
        /#
        #/
    }
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4db
// Size: 0x20
function watchplayerkillstreakend(var_5f321a57443e1a54) {
    waittill_any_2(var_5f321a57443e1a54, "level_game_ended");
    stopcontrol();
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x502
// Size: 0x13
function watchgameend() {
    level waittill("game_ended");
    self notify("level_game_ended");
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x51c
// Size: 0x53
function startcontrol(agent, streakname, var_5f321a57443e1a54, visionset) {
    if (isdefined(self) && isalive(agent)) {
        self controlagent(agent);
        if (isdefined(visionset)) {
            self visionsetnakedforplayer(visionset, 0);
        }
        self.playerproxyagent = agent;
    }
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x576
// Size: 0x4d
function stopcontrol() {
    if (isdefined(self)) {
        if (iscontrollingproxyagent()) {
            self restorecontrolagent();
            self visionsetnakedforplayer("", 0);
        }
        /#
            assertmsg("stopRemoteSequence was updated to take a streakInfo. If you use this script, you need to update this.");
        #/
        self.streakinfo notify("killstreak_finished_with_deploy_weapon");
        self.playerproxyagent = undefined;
    }
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ca
// Size: 0x25
function cleararchetype(classstruct) {
    namespace_93ae9c099aee8626::removearchetype(classstruct.loadoutarchetype);
    namespace_d19129e4fa5d176::loadout_clearperks();
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f6
// Size: 0x53
function reapplyarchetype(classstruct) {
    var_98a729282e6315ad = undefined;
    switch (classstruct.loadoutarchetype) {
    case #"hash_98ff6f21872f18e0":
        var_98a729282e6315ad = &namespace_c3864852d989b3e2::applyarchetype;
        break;
    }
    namespace_d19129e4fa5d176::loadout_updateplayerperks(classstruct);
    if (isdefined(var_98a729282e6315ad)) {
        self [[ var_98a729282e6315ad ]]();
    }
}

// Namespace namespace_873068c8552b41ec/namespace_cd4e45e66f3135ab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x650
// Size: 0xc
function killproxy(var_a140225d999da9a8) {
    
}

