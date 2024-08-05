#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\player\cursor_hint.gsc;

#namespace decoy_canals;

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &function_237449011ca6e78e);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x252
// Size: 0xf2
function function_237449011ca6e78e(grenade, weapon) {
    if (!isdefined(grenade)) {
        return;
    }
    grenade endon("death");
    grenade.owner = self;
    grenade.throwtime = gettime();
    function_c4dbdc841f7c123b(self, grenade);
    thread function_53e290100107a75f();
    thread function_31df139e0ea631cc();
    grenade thread function_a569821d2750e2e4();
    grenade thread function_e8998826905426fd();
    grenade waittill("missile_stuck");
    trigger = getent("decoy_grenade_return", "script_noteworthy");
    if (isdefined(trigger) && grenade istouching(trigger)) {
        level.player give_offhand("decoy_canals", 1);
        grenade thread decoy_delete();
        return;
    }
    childthread function_5578d38ac19d8bc6(grenade);
    grenade setotherent(self);
    grenade setnodeploy(0);
    grenade setscriptablepartstate("beacon", "active", 0);
    level notify("decoy_grenade_set", grenade);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c
// Size: 0x45
function function_53e290100107a75f() {
    self endon("death");
    self endon("disconnect");
    self endon("decoy_unset");
    level endon("game_ended");
    self notify("watchForDetonation");
    self endon("watchForDetonation");
    while (true) {
        self waittill("detonate");
        thread function_b0c960a09a66707f();
    }
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x399
// Size: 0xba
function function_31df139e0ea631cc() {
    self endon("death");
    self endon("decoy_unset");
    level endon("game_ended");
    self notify("watchForAltDetonation");
    self endon("watchForAltDetonation");
    while (self usebuttonpressed()) {
        waitframe();
    }
    buttontime = 0;
    while (true) {
        if (self usebuttonpressed()) {
            buttontime = 0;
            while (self usebuttonpressed()) {
                buttontime += 0.05;
                waitframe();
            }
            if (buttontime >= 0.5) {
                continue;
            }
            buttontime = 0;
            while (!self usebuttonpressed() && buttontime < 0.25) {
                buttontime += 0.05;
                waitframe();
            }
            if (buttontime >= 0.25) {
                continue;
            }
            if (function_2d568ec9506fbc84()) {
                thread function_b0c960a09a66707f();
            }
        }
        waitframe();
    }
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45b
// Size: 0x6f
function function_5578d38ac19d8bc6(grenade) {
    if (!isdefined(grenade)) {
        return;
    }
    grenade scripts\sp\player\cursor_hint::create_cursor_hint("tag_origin", (0, 0, 0), "Pickup", 360, 300, 80, 1, 0, undefined, undefined, "duration_none");
    grenade waittill("trigger");
    level.player give_offhand("decoy_canals", 1);
    grenade thread decoy_delete(0.2);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2
// Size: 0x2f
function function_2d568ec9506fbc84() {
    if (!isalive(self)) {
        return false;
    }
    if (!isdefined(self.var_27412df95be7991b) || self.var_27412df95be7991b.size <= 0) {
        return false;
    }
    return true;
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50a
// Size: 0x1b
function function_dc8efc008c7e5f66() {
    return (gettime() - self.throwtime) / 1000 > 0.3;
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52e
// Size: 0x6b
function function_b0c960a09a66707f() {
    if (isdefined(self.var_27412df95be7991b)) {
        foreach (decoy in self.var_27412df95be7991b) {
            if (decoy function_dc8efc008c7e5f66()) {
                decoy thread function_855837fe7f239e04();
            }
        }
    }
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a1
// Size: 0x20
function function_855837fe7f239e04() {
    self endon("death");
    wait 0.1;
    thread function_4fe9d8db53148399(self.owner);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c9
// Size: 0x55
function function_4fe9d8db53148399(attacker) {
    self setentityowner(attacker);
    self setscriptablepartstate("weaponFire", "arFire", 0);
    self setscriptablepartstate("weaponSounds", "arFire", 0);
    position = self.origin;
    level notify("decoy_activated", attacker, position);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x626
// Size: 0x88
function decoy_delete(var_cbf7be4f62a0ddb2) {
    self notify("death");
    self setcandamage(0);
    self makeunusable();
    self.exploding = 1;
    owner = self.owner;
    if (isdefined(owner)) {
        decoy_removeFromArray(owner, self, self getentitynumber());
        owner notify("decoy_update", 0);
    }
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait var_cbf7be4f62a0ddb2;
    }
    self delete();
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b6
// Size: 0x51
function function_e8998826905426fd() {
    self endon("death");
    level endon("game_ended");
    owner = self.owner;
    attacker = self waittill("detonateExplosive");
    if (isdefined(attacker)) {
        thread function_4fe9d8db53148399(attacker);
        return;
    }
    thread function_4fe9d8db53148399(owner);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x70f
// Size: 0x5a
function function_c4dbdc841f7c123b(owner, grenade) {
    if (!isdefined(owner.var_27412df95be7991b)) {
        owner.var_27412df95be7991b = [];
    }
    entnum = grenade getentitynumber();
    owner.var_27412df95be7991b[entnum] = grenade;
    thread function_c533b827dee2589e(owner, grenade, entnum);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x771
// Size: 0x4a
function decoy_removeFromArray(owner, grenade, entnum) {
    if (isdefined(grenade)) {
        grenade notify("decoy_removeFromArray");
    }
    if (isdefined(owner) && isdefined(owner.var_27412df95be7991b)) {
        owner.var_27412df95be7991b[entnum] = undefined;
    }
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7c3
// Size: 0x3c
function function_c533b827dee2589e(owner, grenade, entnum) {
    grenade endon("decoy_removeFromArray");
    owner endon("disconnect");
    grenade waittill("death");
    thread decoy_removeFromArray(owner, grenade, entnum);
}

// Namespace decoy_canals / namespace_3049e458639813e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x807
// Size: 0x1bd
function function_a569821d2750e2e4() {
    self endon("mine_selfdestruct");
    self endon("death");
    self setcandamage(1);
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    attacker = undefined;
    hits = 1;
    while (true) {
        damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self waittill("damage");
        if (!isplayer(attacker) && !isagent(attacker)) {
            continue;
        }
        incominghits = 1;
        hits -= incominghits;
        if (hits <= 0) {
            break;
        }
    }
    self notify("mine_destroyed");
    if (isdefined(type) && (issubstr(type, "MOD_GRENADE") || issubstr(type, "MOD_EXPLOSIVE"))) {
        self.waschained = 1;
    }
    if (isdefined(idflags) && idflags & 8) {
        self.wasdamagedfrombulletpenetration = 1;
    }
    if (isdefined(idflags) && idflags & 256) {
        self.wasdamagedfrombulletricochet = 1;
    }
    self.wasdamaged = 1;
    if (isdefined(attacker)) {
        self.damagedby = attacker;
    }
    self notify("detonateExplosive", attacker);
}

