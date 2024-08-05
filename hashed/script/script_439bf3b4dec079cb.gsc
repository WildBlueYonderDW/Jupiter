#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\utility.gsc;

#namespace thermite;

// Namespace thermite / namespace_6683aa43ef635803
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd1
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &function_e4f132e4caa48e7e);
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf1
// Size: 0x2c
function function_e4f132e4caa48e7e(grenade, weapon) {
    grenade endon("thermite_deleted");
    thread thermite_used(grenade);
    grenade thread notifyondelete();
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125
// Size: 0x1f
function notifyondelete() {
    self endon("explode");
    while (isdefined(self)) {
        wait 0.05;
    }
    self notify("thermite_deleted");
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14c
// Size: 0x22
function thermite_used(grenade, isgl) {
    if (isdefined(isgl)) {
    }
    grenade thread thermite_watchstuck(isgl);
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x176
// Size: 0xbe
function thermite_watchstuck(isgl) {
    self endon("death");
    stuckto = undefined;
    stuckto = self waittill("missile_stuck");
    weaponobj = scripts\sp\utility::make_weapon("thermite_sp");
    thread thermite_watchstucktoterrain();
    self setscriptablepartstate("effects", "impact", 0);
    thermite_doradiusdamage(weaponobj);
    wait 0.5;
    ticks = 1;
    while (ticks <= 10) {
        curtick = ticks + 1;
        if (mod(curtick, 2) > 0) {
            thermite_doradiusdamage(weaponobj);
        } else {
            thermite_doradiusdamage(weaponobj);
        }
        ticks = curtick;
        wait 0.5;
    }
    thread thermite_destroy();
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x5d
function thermite_watchstucktoterrain() {
    self endon("death");
    stuckto = self getlinkedparent();
    while (isdefined(stuckto)) {
        stuckto = self waittill("missile_stuck");
    }
    self.badplace = createnavbadplacebybounds(self.origin, (125, 125, 125), (0, 0, 0));
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x80
function thermite_doradiusdamage(weaponobj) {
    radius = 125;
    innerdamage = 25;
    outerdamage = 10;
    meansofdeath = "MOD_FIRE";
    if (weaponobj.basename == "thermite_sp") {
        radius = 125;
        innerdamage = 30;
        outerdamage = 30;
    }
    self radiusdamage(self.origin, radius, innerdamage, outerdamage, self.owner, meansofdeath, weaponobj);
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x329
// Size: 0x1e
function thermite_destroy() {
    self setscriptablepartstate("effects", "burnEnd", 0);
    thread thermite_delete(5);
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34f
// Size: 0x5b
function thermite_delete(var_cbf7be4f62a0ddb2) {
    self notify("death");
    self.exploding = 1;
    if (isdefined(self.badplace)) {
        destroynavobstacle(self.badplace);
        self.badplace = undefined;
    }
    self forcehidegrenadehudwarning(1);
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait var_cbf7be4f62a0ddb2;
    }
    self delete();
}

// Namespace thermite / namespace_6683aa43ef635803
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b2
// Size: 0x39
function mod(dividend, var_f1563935aeeb5199) {
    q = int(dividend / var_f1563935aeeb5199);
    if (dividend * var_f1563935aeeb5199 < 0) {
        q -= 1;
    }
    return dividend - q * var_f1563935aeeb5199;
}

