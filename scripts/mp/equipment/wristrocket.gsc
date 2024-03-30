// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\shellshock.gsc;

#namespace wristrocket;

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6
// Size: 0x37
function wristrocketinit() {
    level._effect["wristrocket_explode"] = loadfx("vfx/iw7/_requests/mp/power/vfx_wrist_rocket_exp.vfx");
    level._effect["wristrocket_thruster"] = loadfx("vfx/iw7/_requests/mp/power/vfx_wrist_rocket_thruster");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x314
// Size: 0xb
function wristrocket_set() {
    thread wristrocket_watcheffects();
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x326
// Size: 0xb
function wristrocket_unset() {
    self notify("wristRocket_unset");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338
// Size: 0xb0
function wristrocketused(grenade) {
    if (grenade.tickpercent == 1) {
        return;
    }
    rocket = wristrocket_createrocket(grenade);
    rocket.grenade = grenade;
    grenade = _launchgrenade("pop_rocket_mp", self.origin, (0, 0, 0), 100, 1, grenade);
    grenade forcehidegrenadehudwarning(1);
    grenade linkto(rocket);
    grenade thread wristrocket_cleanuponparentdeath(rocket);
    grenade thread wristrocket_cleanuponownerdisconnect(self);
    rocket setscriptablepartstate("launch", "active", 0);
    rocket thread wristrocket_watchfuse(2);
    rocket thread wristrocket_watchstuck();
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef
// Size: 0x3b
function wristrocket_watchfuse(fusetime) {
    self endon("death");
    self.owner endon("disconnect");
    self notify("wristRocket_watchFuse");
    self endon("wristRocket_watchFuse");
    wait(fusetime);
    thread wristrocket_explode();
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431
// Size: 0x8f
function wristrocket_watchstuck() {
    self endon("death");
    self.owner endon("disconnect");
    stuckto = self waittill("missile_stuck");
    if (isplayer(stuckto)) {
        self.owner scripts/mp/weapons::grenadestuckto(self, stuckto);
    }
    self stoploopsound();
    self setscriptablepartstate("stuck", "active", 0);
    self setscriptablepartstate("beacon", "active", 0);
    self.grenade forcehidegrenadehudwarning(0);
    thread wristrocket_watchfuse(1.35);
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c7
// Size: 0x41
function wristrocket_explode() {
    self setscriptablepartstate("stuck", "neutral", 0);
    self setscriptablepartstate("beacon", "neutral", 0);
    self setscriptablepartstate("explode", "active", 0);
    thread wristrocket_delete();
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50f
// Size: 0x23
function wristrocket_delete() {
    self notify("death");
    self.exploding = 1;
    wait(0.1);
    self delete();
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539
// Size: 0xa9
function wristrocket_createrocket(grenade) {
    rocket = _magicbullet(makeweapon("pop_rocket_proj_mp"), grenade.origin, grenade.origin + anglestoforward(self getgunangles()), self);
    rocket.owner = self;
    rocket.team = self.team;
    rocket.weapon_name = "pop_rocket_proj_mp";
    rocket.power = "power_wristrocket";
    rocket setotherent(self);
    rocket setentityowner(self);
    rocket thread wristrocket_cleanuponownerdisconnect(self);
    return rocket;
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea
// Size: 0x18c
function wristrocket_watcheffects() {
    self endon("disconnect");
    self notify("wristRocket_watchEffects");
    self endon("wristRocket_watchEffects");
    var_fb0b2f8f6aa55804 = 0;
    while (true) {
        raceresult = spawnstruct();
        if (var_fb0b2f8f6aa55804) {
            childthread wristrocket_watcheffectsraceheldoffhandbreak(raceresult);
        } else {
            childthread wristrocket_watcheffectsracegrenadepullback(raceresult);
        }
        childthread wristrocket_watcheffectsracegrenadefired(raceresult);
        childthread wristrocket_watcheffectsracesuperstarted(raceresult);
        childthread wristrocket_watcheffectsracedeath(raceresult);
        childthread wristrocket_watcheffectsraceunset(raceresult);
        var_fb0b2f8f6aa55804 = 0;
        self waittill("wristRocket_watchEffectsRaceStart");
        waittillframeend();
        grenadepullback = istrue(raceresult.grenadepullback);
        grenadefire = istrue(raceresult.grenadefire);
        superstarted = istrue(raceresult.superstarted);
        death = istrue(raceresult.death);
        unset = istrue(raceresult.unset);
        heldoffhandbreak = istrue(raceresult.heldoffhandbreak);
        if (death) {
            self notify("wristRocket_watchEffectsRaceEnd");
            thread wristrocket_endeffects();
            return;
        } else if (unset) {
            self notify("wristRocket_watchEffectsRaceEnd");
            thread wristrocket_endeffects();
            return;
        } else if (superstarted) {
            thread wristrocket_endeffects();
        } else if (heldoffhandbreak) {
            thread wristrocket_endeffects();
        } else if (grenadefire) {
            thread wristrocket_endeffects();
        } else if (grenadepullback) {
            thread wristrocket_begineffects();
            var_fb0b2f8f6aa55804 = 1;
        }
        self notify("wristRocket_watchEffectsRaceEnd");
    }
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d
// Size: 0x5b
function wristrocket_watcheffectsracegrenadepullback(raceresult) {
    self endon("wristRocket_watchEffectsRaceEnd");
    while (true) {
        objweapon = self waittill("grenade_pullback");
        if (objweapon.basename == "pop_rocket_mp") {
            break;
        }
    }
    raceresult.grenadepullback = 1;
    self notify("wristRocket_watchEffectsRaceStart");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7df
// Size: 0x66
function wristrocket_watcheffectsracegrenadefired(raceresult) {
    self endon("wristRocket_watchEffectsRaceEnd");
    while (true) {
        grenade, objweapon = self waittill("grenade_fire");
        if (objweapon.basename == "pop_rocket_mp") {
            break;
        }
    }
    raceresult.grenadefire = 1;
    self notify("wristRocket_watchEffectsRaceStart");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c
// Size: 0x31
function wristrocket_watcheffectsracesuperstarted(raceresult) {
    self endon("wristRocket_watchEffectsRaceEnd");
    self waittill("super_started");
    raceresult.superstarted = 1;
    self notify("wristRocket_watchEffectsRaceStart");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x884
// Size: 0x31
function wristrocket_watcheffectsracedeath(raceresult) {
    self endon("wristRocket_watchEffectsRaceEnd");
    self waittill("death");
    raceresult.death = 1;
    self notify("wristRocket_watchEffectsRaceStart");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bc
// Size: 0x31
function wristrocket_watcheffectsraceunset(raceresult) {
    self endon("wristRocket_watchEffectsRaceEnd");
    self waittill("wristRocket_unset");
    raceresult.unset = 1;
    self notify("wristRocket_watchEffectsRaceStart");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f4
// Size: 0x4e
function wristrocket_watcheffectsraceheldoffhandbreak(raceresult) {
    self endon("wristRocket_watchEffectsRaceEnd");
    waitframe();
    weapon = makeweapon("pop_rocket_mp");
    while (self getheldoffhand() == weapon) {
        waitframe();
    }
    raceresult.heldoffhandbreak = 1;
    self notify("wristRocket_watchEffectsRaceStart");
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x949
// Size: 0x43
function wristrocket_begineffects() {
    self notify("wristRocket_beginEffects");
    self endon("wristRocket_beginEffects");
    self endon("wristRocket_endEffects");
    self setscriptablepartstate("wristRocketWorld", "neutral", 0);
    wait(0.15);
    self setscriptablepartstate("wristRocketWorld", "active", 0);
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x993
// Size: 0x1d
function wristrocket_endeffects() {
    self notify("wristRocket_endEffects");
    self setscriptablepartstate("wristRocketWorld", "neutral", 0);
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0xb5
function wristrocketcooksuicideexplodecheck(inflictor, attacker, victim, meansofdeath, objweapon) {
    if (attacker != victim) {
        return;
    }
    if (meansofdeath != "MOD_SUICIDE") {
        return;
    }
    if (!isdefined(inflictor) || inflictor != attacker) {
        return;
    }
    if (!isdefined(objweapon) || objweapon.basename != "pop_rocket_mp") {
        return;
    }
    explodepos = victim gettagorigin("tag_weapon_left");
    radiusdamage(explodepos, 175, 200, 70, attacker, "MOD_EXPLOSIVE", "pop_rocket_mp");
    scripts/mp/shellshock::grenade_earthquakeatposition(explodepos, 0.6);
    playfx(getfx("wristrocket_explode"), explodepos);
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa73
// Size: 0x45
function wristrocket_cleanuponparentdeath(parent, delay) {
    self endon("death");
    self notify("cleanupOnParentDeath");
    self endon("cleanupOnParentDeath");
    if (isdefined(parent)) {
        parent waittill("death");
    }
    if (isdefined(delay)) {
        wait(delay);
    }
    self delete();
}

// Namespace wristrocket / scripts/mp/equipment/wristrocket
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf
// Size: 0x27
function wristrocket_cleanuponownerdisconnect(owner) {
    self endon("death");
    owner waittill("disconnect");
    if (isdefined(self)) {
        self delete();
    }
}

