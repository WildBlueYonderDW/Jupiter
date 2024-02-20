// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
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

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0x36
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("death_switch", &tryusedeathswitchfromstruct);
    /#
        setdevdvarifuninitialized(@"hash_7ea8f7418e6bf019", 1);
    #/
    level.killstreak_laststand_func = &deathswitch_startpayloadreleasesequence;
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0x21
function tryusedeathswitch() {
    streakinfo = createstreakinfo("death_switch", self);
    return tryusedeathswitchfromstruct(streakinfo);
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x332
// Size: 0xd1
function tryusedeathswitchfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_vest_mp"));
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    playkillstreakoperatordialog("death_switch", "use_" + "death_switch", 1);
    utility::trycall(level.matchdata_logkillstreakevent, "death_switch", self.origin);
    thread teamplayercardsplash("used_" + "death_switch", self);
    thread startdeathswitch(streakinfo);
    return 1;
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40b
// Size: 0xe
function weapongivendeathswitch(streakinfo) {
    return 1;
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x421
// Size: 0xc3
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

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x53
function deathswitch_loopblinkinglight() {
    self endon("disconnect");
    self endon("deathSwitch_release");
    while (1) {
        self.deathswitchent setscriptablepartstate("blinking_light", "on", 0);
        wait(0.5);
        self.deathswitchent setscriptablepartstate("blinking_light", "off", 0);
    }
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x545
// Size: 0x37
function debugloc() {
    /#
        self endon("<unknown string>");
        while (1) {
            sphere(self.origin, 5, (1, 0, 0), 0, 1);
            waitframe();
        }
    #/
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x583
// Size: 0x5b
function deathswitch_startpayloadreleasesequence() {
    laststandweapon = "iw9_me_fists_mp_ls";
    _giveweapon(laststandweapon, undefined, undefined, 1);
    thread namespace_10260b963310d30e::switchtofists(laststandweapon);
    self.laststandactionset = "laststand_killstreak";
    val::function_3633b947164be4f3(self.laststandactionset, 0);
    thread deathswitch_payloadrelease(3);
    thread deathswitch_watchbleedout(3);
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e5
// Size: 0xe8
function deathswitch_payloadrelease(var_3b40edf8da5d7be3) {
    self endon("payload_release");
    self endon("disconnect");
    level endon("game_ended");
    var_91bbec893ba76069 = 1;
    /#
        var_91bbec893ba76069 = getdvarint(@"hash_7ea8f7418e6bf019", 1);
    #/
    projectile = _launchgrenade("death_switch_blast_mp", self gettagorigin("j_mainroot"), (0, 0, 0), var_3b40edf8da5d7be3, 1);
    projectile linkto(self);
    thread deathswitch_payloadreleaseondeath(var_91bbec893ba76069, projectile);
    var_614eaf960cf259b0 = 1;
    while (var_3b40edf8da5d7be3 > 0) {
        self iprintlnbold("Death Switch Countdown: " + var_3b40edf8da5d7be3);
        var_3b40edf8da5d7be3 = var_3b40edf8da5d7be3 - var_614eaf960cf259b0;
        playsoundatpos(self.origin, "death_switch_beep");
        wait(var_614eaf960cf259b0);
        var_614eaf960cf259b0 = var_614eaf960cf259b0 - 0.2;
        if (var_614eaf960cf259b0 < 0.05) {
            var_614eaf960cf259b0 = 0.05;
        }
    }
    deathswitch_payloadreleasetype(var_91bbec893ba76069, projectile);
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d4
// Size: 0x49
function deathswitch_payloadreleaseondeath(var_91bbec893ba76069, projectile) {
    self endon("payload_release");
    self endon("disconnect");
    level endon("game_ended");
    self notify("watch_switch_on_death");
    self endon("watch_switch_on_death");
    self waittill("death");
    deathswitch_payloadreleasetype(var_91bbec893ba76069, projectile);
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x724
// Size: 0x92
function deathswitch_payloadreleasetype(var_91bbec893ba76069, projectile) {
    if (isdefined(projectile)) {
        projectile delete();
    }
    switch (var_91bbec893ba76069) {
    case 0:
        thread deathswitch_releaselocalexplosion();
        break;
    case 1:
        thread deathswitch_releaseartilleryexplosion();
        break;
    default:
        /#
            assertmsg("Payload type is not valid");
        #/
        break;
    }
    self.killstreaklaststand = undefined;
    removeperk("specialty_pistoldeath");
    self notify("payload_release");
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bd
// Size: 0x70
function deathswitch_releaselocalexplosion() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("deathSwitch_release");
    self.deathswitchent setscriptablepartstate("blinking_light", "off", 0);
    self.deathswitchent setscriptablepartstate("explode", "on", 0);
    self.deathswitchent setentityowner(self);
    self.deathswitchent thread delayentdelete(5);
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x834
// Size: 0x9a
function deathswitch_releaseartilleryexplosion() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("deathSwitch_release");
    var_b0d1c69e44f250ec = self.origin + (0, 0, 20000);
    goalpoint = self.origin;
    missile = _magicbullet(makeweapon("death_switch_proj_mp"), var_b0d1c69e44f250ec, goalpoint, self);
    self.deathswitchent setscriptablepartstate("blinking_light", "off", 0);
    self.deathswitchent thread delayentdelete(5);
}

// Namespace death_switch/namespace_232c69b3c0125f49
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d5
// Size: 0x29
function deathswitch_watchbleedout(bleedouttime) {
    level endon("game_ended");
    level endon("death_or_disconnect");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(bleedouttime);
    _suicide();
}

