// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_94944d677b7174c;

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x25
function init() {
    setdvarifuninitialized(@"hash_89dce574801028ad", 0);
    level delaythread(0.05, &rockable_cars_init);
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x2ec
function rockable_cars_init() {
    level.rockablecars = spawnstruct();
    level.rockablecars.cars = [];
    scriptables = getscriptablearray("scriptable", "code_classname");
    if (!isdefined(scriptables) || scriptables.size <= 0) {
        return;
    }
    count = 0;
    foreach (car in scriptables) {
        if (count > 19) {
            count = 0;
            waitframe();
        }
        count = count + 1;
        if (utility::issp()) {
            jumpiffalse(!isdefined(car.model) || !car valid_rockable_vehicle()) LOC_000000c4;
        } else {
        LOC_000000c4:
            if (!car getscriptablehaspart("Anim_Explosion") && !car getscriptablehaspart("Anim_PlayerStandRock")) {
                continue;
            }
            level.rockablecars.cars[level.rockablecars.cars.size] = car;
            car.forward = anglestoforward(car.angles);
            car.right = anglestoright(car.angles);
            if (!utility::issp()) {
                car.up = anglestoup(car.angles);
                car.frontpoint = car getpointinbounds(1, 0, 0);
                car.backpoint = car getpointinbounds(-1, 0, 0);
                car.leftpoint = car getpointinbounds(0, 1, 0);
                car.rightpoint = car getpointinbounds(0, -1, 0);
                car.toppoint = car getpointinbounds(0, 0, -0.15);
                car.halflength = vectordot(car.forward, car.frontpoint - car.backpoint) / 2;
                car.halfwidth = vectordot(car.right, car.rightpoint - car.leftpoint) / 2;
                car.players = [];
                car.touchtimes = [];
                car.rocktimes = [];
                car.var_743ebab8013b6cde = 1;
            }
            car thread rockable_car_debug();
            if (getdvarint(@"hash_2448528570ef56f7", 1) == 1) {
                car thread rockable_car_watch_damage();
                car thread rockable_car_watch_death();
            } else {
                car setscriptablepartstate("body", "no_process");
            }
        }
    }
    flag_set("rockable_cars_init");
    level thread alarm_cars_init();
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x567
// Size: 0x5a
function valid_rockable_vehicle() {
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "not_rockable") {
        return 0;
    }
    if (issubstr(self.model, "veh8_") || issubstr(self.model, "veh9_")) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0x145
function rockable_car_watch_damage() {
    self endon("death");
    self endon("rocked");
    self setcandamage(1);
    self.rockable_last_point = 0;
    self.rockable_last_meansofdeath = "";
    while (1) {
        self.health = 99999;
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        self.rockable_last_point = point;
        self.rockable_last_meansofdeath = meansofdeath;
        print3d_debug(self.origin + (0, 0, 0), "Damage by: " + meansofdeath + " " + damage, (1, 1, 1), 1, 0.25, 100);
    }
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x714
// Size: 0x2a8
function rockable_car_watch_death() {
    self endon("death");
    self waittillmatch("scriptableNotification", "anim_explosion");
    self notify("rocked");
    if (isexplosivedamagemod(self.rockable_last_meansofdeath)) {
        var_340d59422336e85a = self.rockable_last_point - self.origin;
        var_ad3d23dac7c40d91 = ter_op(vectordot(self.forward, var_340d59422336e85a) > 0, "front", "back");
        var_26cda4570f0cafb4 = ter_op(vectordot(self.right, var_340d59422336e85a) > 0, "right", "left");
        self setscriptablepartstate("Anim_Explosion", var_ad3d23dac7c40d91 + "_" + var_26cda4570f0cafb4, 0);
        print3d_debug(self.origin + (0, 0, -5), "Death by: " + self.rockable_last_meansofdeath, (1, 0, 0), 1, 0.25, 1000);
        print3d_debug(self.origin + (0, 0, 12), "Animation: " + var_ad3d23dac7c40d91 + "_" + var_26cda4570f0cafb4, (1, 1, 1), 1, 0.25, 1000);
    } else {
        var_336c218e59594398 = [0:"front_left", 1:"front_right", 2:"back_left", 3:"back_right"];
        death_anim = var_336c218e59594398[randomint(var_336c218e59594398.size - 1)];
        self setscriptablepartstate("Anim_Explosion", death_anim, 0);
        print3d_debug(self.origin + (0, 0, -5), "Death by: " + self.rockable_last_meansofdeath, (1, 0, 0), 1, 0.25, 1000);
        print3d_debug(self.origin + (0, 0, 5), "scripted explosion", (1, 0, 0), 1, 0.5, 500);
        print3d_debug(self.origin + (0, 0, 10), "Animation: " + death_anim, (1, 1, 1), 1, 0.25, 1000);
    }
    if (getdvarint(@"hash_e9421533f01288a", 0) == 1) {
        wait(randomfloatrange(15, 30));
        self setscriptablepartstate("body", "onfire");
        thread rockable_car_watch_death();
        return;
    }
    self waittillmatch("scriptableNotification", "anim_explosion_complete");
    thread rockable_car_watch_dead();
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c3
// Size: 0x16d
function rockable_car_watch_dead() {
    self endon("death");
    while (1) {
        self.health = 99999;
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        if (isexplosivedamagemod(meansofdeath) && damage > 10) {
            self setscriptablepartstate("Anim_Explosion", "rock", 1);
        }
        print3d_debug(self.origin + (0, 0, 7), "Death animation: " + "rock", (1, 1, 1), 1, 0.25, 1000);
        print3d_debug(self.origin + (0, 0, 0), "Death damage by: " + meansofdeath + " " + damage, (1, 1, 1), 1, 0.25, 150);
    }
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37
// Size: 0x59
function rockable_car_debug() {
    self endon("death");
    if (getdvarint(@"hash_89dce574801028ad")) {
        for (;;) {
            print3d_debug(self.origin + (0, 0, 60), "rockable", (1, 1, 1), 1, 0.5, 2);
            waitframe();
            waitframe();
        }
    }
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb97
// Size: 0x11b
function alarm_cars_init() {
    level.alarmcars = spawnstruct();
    level.alarmcars.cars = level.rockablecars.cars;
    count = 0;
    foreach (car in level.alarmcars.cars) {
        if (count > 19) {
            count = 0;
            waitframe();
        }
        count = count + 1;
        if (!isdefined(car.script_noteworthy) || car.script_noteworthy != "veh9_generic_alarm_on" || !isdefined(car getscriptablehaspart("Car_Alarm"))) {
            level.alarmcars.cars = array_remove(level.alarmcars.cars, car);
        } else {
            car thread alarm_car_watch_damage();
        }
    }
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb9
// Size: 0x173
function alarm_car_watch_damage() {
    self endon("death");
    self endon("rocked");
    self endon("stop_alarm");
    self setcandamage(1);
    self.alarmdamage = 0;
    thread alarm_car_debug();
    while (1) {
        self.health = 99999;
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        print3d_debug(self.origin + (0, 0, -7), "Alarm damage by: " + meansofdeath + " " + damage, (1, 1, 1), 1, 0.25, 150);
        self.alarmdamage = self.alarmdamage + damage;
        waitframe();
        if (self.alarmdamage > 200) {
            self setscriptablepartstate("Car_Alarm", "on", 0);
            level notify("veh9_generic_alarm_on", self);
            break;
        }
    }
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe33
// Size: 0x63
function alarm_car_debug() {
    self endon("death");
    if (getdvarint(@"hash_89dce574801028ad")) {
        for (;;) {
            print3d_debug(self.origin + (0, 0, 70), "alarm.  dmg: " + self.alarmdamage, (1, 1, 1), 1, 0.5, 2);
            waitframe();
            waitframe();
        }
    }
}

// Namespace namespace_94944d677b7174c/namespace_eae38e0288c268e1
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9d
// Size: 0x54
function print3d_debug(origin, text, color, alpha, scale, duration) {
    if (getdvarint(@"hash_89dce574801028ad")) {
        /#
            print3d(origin, text, color, alpha, scale, duration);
        #/
    }
}

