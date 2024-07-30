#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\cp_mp\hostmigration.gsc;

#namespace death_switch;

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x322
// Size: 0x35
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("death_switch", &tryusedeathswitchfromstruct);
    /#
        setdevdvarifuninitialized(@"hash_7ea8f7418e6bf019", 1);
    #/
    level.killstreak_laststand_func = &deathswitch_startpayloadreleasesequence;
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35f
// Size: 0x21
function tryusedeathswitch() {
    streakinfo = createstreakinfo("death_switch", self);
    return tryusedeathswitchfromstruct(streakinfo);
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x389
// Size: 0xd1
function tryusedeathswitchfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return false;
        }
    }
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_vest_mp"));
    if (!istrue(deployresult)) {
        return false;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return false;
        }
    }
    playkillstreakoperatordialog("death_switch", "use_" + "death_switch", 1);
    utility::trycall(level.matchdata_logkillstreakevent, "death_switch", self.origin);
    thread teamplayercardsplash("used_" + "death_switch", self);
    thread startdeathswitch(streakinfo);
    return true;
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x463
// Size: 0xd
function weapongivendeathswitch(streakinfo) {
    return true;
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x479
// Size: 0xc2
function startdeathswitch(streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    self iprintlnbold("If I go down, I'm taking them with me!");
    giveperk("specialty_pistoldeath");
    self.killstreaklaststand = 1;
    self.deathswitchent = spawn("script_model", self gettagorigin("j_helmet"));
    self.deathswitchent setmodel("ks_death_switch_mp");
    self.deathswitchent.angles = self.angles;
    self.deathswitchent linkto(self, "j_helmet", (0, 0, 0), (0, 0, 0));
    thread deathswitch_loopblinkinglight();
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x543
// Size: 0x52
function deathswitch_loopblinkinglight() {
    self endon("disconnect");
    self endon("deathSwitch_release");
    while (true) {
        self.deathswitchent setscriptablepartstate("blinking_light", "on", 0);
        wait 0.5;
        self.deathswitchent setscriptablepartstate("blinking_light", "off", 0);
    }
}

/#

    // Namespace death_switch / scripts\mp\killstreaks\death_switch
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x59d
    // Size: 0x36
    function debugloc() {
        self endon("<dev string:x1c>");
        while (true) {
            sphere(self.origin, 5, (1, 0, 0), 0, 1);
            waitframe();
        }
    }

#/

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5db
// Size: 0x5b
function deathswitch_startpayloadreleasesequence() {
    laststandweapon = "iw9_me_fists_mp_ls";
    _giveweapon(laststandweapon, undefined, undefined, 1);
    thread scripts\mp\laststand::switchtofists(laststandweapon);
    self.laststandactionset = "laststand_killstreak";
    val::group_set(self.laststandactionset, 0);
    thread deathswitch_payloadrelease(3);
    thread deathswitch_watchbleedout(3);
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63e
// Size: 0xe6
function deathswitch_payloadrelease(var_3b40edf8da5d7be3) {
    self endon("payload_release");
    self endon("disconnect");
    level endon("game_ended");
    payloadtype = 1;
    /#
        payloadtype = getdvarint(@"hash_7ea8f7418e6bf019", 1);
    #/
    projectile = _launchgrenade("death_switch_blast_mp", self gettagorigin("j_mainroot"), (0, 0, 0), var_3b40edf8da5d7be3, 1);
    projectile linkto(self);
    thread deathswitch_payloadreleaseondeath(payloadtype, projectile);
    for (startingwait = 1; var_3b40edf8da5d7be3 > 0; startingwait = 0.05) {
        self iprintlnbold("Death Switch Countdown: " + var_3b40edf8da5d7be3);
        var_3b40edf8da5d7be3 -= startingwait;
        playsoundatpos(self.origin, "death_switch_beep");
        wait startingwait;
        startingwait -= 0.2;
        if (startingwait < 0.05) {
        }
    }
    deathswitch_payloadreleasetype(payloadtype, projectile);
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x72c
// Size: 0x48
function deathswitch_payloadreleaseondeath(payloadtype, projectile) {
    self endon("payload_release");
    self endon("disconnect");
    level endon("game_ended");
    self notify("watch_switch_on_death");
    self endon("watch_switch_on_death");
    self waittill("death");
    deathswitch_payloadreleasetype(payloadtype, projectile);
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x77c
// Size: 0x91
function deathswitch_payloadreleasetype(payloadtype, projectile) {
    if (isdefined(projectile)) {
        projectile delete();
    }
    switch (payloadtype) {
    case 0: 
        thread deathswitch_releaselocalexplosion();
        break;
    case 1: 
        thread deathswitch_releaseartilleryexplosion();
        break;
    default: 
        assertmsg("<dev string:x25>");
        break;
    }
    self.killstreaklaststand = undefined;
    removeperk("specialty_pistoldeath");
    self notify("payload_release");
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x815
// Size: 0x6f
function deathswitch_releaselocalexplosion() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("deathSwitch_release");
    self.deathswitchent setscriptablepartstate("blinking_light", "off", 0);
    self.deathswitchent setscriptablepartstate("explode", "on", 0);
    self.deathswitchent setentityowner(self);
    self.deathswitchent thread delayentdelete(5);
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88c
// Size: 0x98
function deathswitch_releaseartilleryexplosion() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("deathSwitch_release");
    launchpoint = self.origin + (0, 0, 20000);
    goalpoint = self.origin;
    missile = _magicbullet(makeweapon("death_switch_proj_mp"), launchpoint, goalpoint, self);
    self.deathswitchent setscriptablepartstate("blinking_light", "off", 0);
    self.deathswitchent thread delayentdelete(5);
}

// Namespace death_switch / scripts\mp\killstreaks\death_switch
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x92c
// Size: 0x28
function deathswitch_watchbleedout(bleedouttime) {
    level endon("game_ended");
    level endon("death_or_disconnect");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(bleedouttime);
    _suicide();
}

