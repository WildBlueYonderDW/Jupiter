#using scripts\engine\math.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;

#namespace namespace_b3bd3afb702ba22a;

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x377
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &teargasfiremain);
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x397
// Size: 0x3c
function teargasfiremain(grenade, weapon) {
    if (!isdefined(grenade)) {
        return;
    }
    grenade endon("end_explode");
    position = grenade waittill("explode");
    thread gas_createtrigger(position);
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3db
// Size: 0xce
function gas_createtrigger(position, owner, team, duration, scale) {
    if (!isdefined(duration)) {
        duration = 7;
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    trigger = spawn("trigger_radius", position + (0, 0, int(-57.75 * scale)), 7, int(256 * scale), int(175 * scale));
    trigger thread gas_badplace(duration, scale);
    trigger endon("death");
    trigger.owner = owner;
    trigger.team = team;
    trigger.var_370a39d48e99d538 = [];
    trigger thread gas_watchtriggerenter();
    trigger thread gas_watchtriggerexit();
    wait duration;
    trigger thread gas_destroytrigger();
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b1
// Size: 0xdf
function gas_badplace(duration, scale) {
    if (!isdefined(self)) {
        return;
    }
    var_e786fa50656bc2ff = 0.66;
    var_537d92090ed07c1e = duration * 0.15;
    var_b98c5b49ed782fe5 = duration * 0.25;
    assertex(var_537d92090ed07c1e + var_b98c5b49ed782fe5 <= duration, "Incorrect pre/post wait values");
    wait var_537d92090ed07c1e;
    var_f369d822d2af09e5 = 256 * scale * var_e786fa50656bc2ff;
    var_dbdbad4a509c08e8 = 175 * scale * var_e786fa50656bc2ff;
    var_48e1c3e32a05c3bf = (0, 0, 0);
    navobstacle = createnavbadplacebyshape(self.origin, var_48e1c3e32a05c3bf, 8, var_f369d822d2af09e5, var_dbdbad4a509c08e8);
    wait max(0.05, duration - var_537d92090ed07c1e - var_b98c5b49ed782fe5);
    if (isdefined(navobstacle)) {
        destroynavobstacle(navobstacle);
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x598
// Size: 0x79
function gas_destroytrigger() {
    foreach (player in self.var_370a39d48e99d538) {
        if (!isdefined(player)) {
            continue;
        }
        self.var_370a39d48e99d538[player getentitynumber()] = undefined;
        player thread gas_onexittrigger(self getentitynumber());
    }
    self delete();
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x619
// Size: 0x70
function gas_onexittrigger(triggerid) {
    assertex(isdefined(triggerid), "gas_onExitTrigger called with an invalid trigger ID.");
    if (!isdefined(self.gastriggerstouching)) {
        return;
    }
    self.gastriggerstouching[triggerid] = undefined;
    self.lastgastouchtime = gettime();
    if (self.gastriggerstouching.size == 0) {
        thread gas_removespeedredux();
        thread gas_removeblur();
        disableloopingcoughaudio();
        self notify("gas_exited");
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x691
// Size: 0x77
function gas_watchtriggerenter() {
    self endon("death");
    while (true) {
        who = self waittill("trigger");
        if (!isalive(who)) {
            continue;
        }
        if (function_da8a31143b88e833(who)) {
            continue;
        }
        entnum = who getentitynumber();
        if (isdefined(self.var_370a39d48e99d538[entnum])) {
            continue;
        }
        self.var_370a39d48e99d538[entnum] = who;
        who thread gas_onentertrigger(self);
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x710
// Size: 0x22
function function_da8a31143b88e833(player) {
    if (isplayer(player) && player function_7ee20cf3c0390e21()) {
        return true;
    }
    return false;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73b
// Size: 0xb9
function gas_onentertrigger(trigger) {
    if (!isdefined(self.gastriggerstouching)) {
        self.gastriggerstouching = [];
    }
    entnum = trigger getentitynumber();
    self.gastriggerstouching[entnum] = trigger;
    self.lastgastouchtime = gettime();
    if (self.gastriggerstouching.size >= 1) {
        if (isplayer(self)) {
            thread gas_applyspeedredux();
            thread gas_applyblur();
        }
    }
    if (self.gastriggerstouching.size == 1) {
        if (isplayer(self)) {
            thread gas_applycough(trigger.owner, 0);
        }
        if (!istrue(self.var_71bac99803ea4156)) {
            enableloopingcoughaudio();
        }
    }
    return entnum;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fd
// Size: 0xb1
function gas_watchtriggerexit() {
    self endon("death");
    while (true) {
        foreach (player in self.var_370a39d48e99d538) {
            if (!isdefined(player)) {
                self.var_370a39d48e99d538[id] = undefined;
                continue;
            }
            if (!isalive(player)) {
                continue;
            }
            if (player istouching(self) && !function_da8a31143b88e833(player)) {
                continue;
            }
            self.var_370a39d48e99d538[player getentitynumber()] = undefined;
            player thread gas_onexittrigger(self getentitynumber());
        }
        waitframe();
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b6
// Size: 0xe4
function gas_applyblur() {
    self endon("death_or_disconnect");
    self notify("gas_modify_blur");
    self endon("gas_modify_blur");
    shockfile = "gas_grenade_heavy_mp";
    if (isdefined(self.gastriggerstouching)) {
        foreach (trigger in self.gastriggerstouching) {
            if (isdefined(trigger) && isdefined(trigger.owner) && trigger.owner == self) {
                /#
                    if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                        break;
                    }
                #/
                shockfile = "gas_grenade_light_mp";
            }
        }
    }
    while (true) {
        self shellshock(shockfile, 0.5, 1, 0);
        wait 0.2;
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a2
// Size: 0xa
function gas_removeblur() {
    self notify("gas_modify_blur");
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b4
// Size: 0x1f
function gas_clearblur(fromdeath) {
    self notify("gas_modify_blur");
    if (!istrue(fromdeath)) {
        self stopshellshock();
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9db
// Size: 0x81
function gas_applycough(attacker, fromimpact) {
    var_8907f741f3a7b3f7 = isdefined(attacker) && self == attacker;
    if (!var_8907f741f3a7b3f7) {
        return;
    }
    isheavy = 0;
    if (istrue(fromimpact)) {
        isheavy = 1;
        if (var_8907f741f3a7b3f7) {
            isheavy = 0;
            /#
                if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                    isheavy = 1;
                }
            #/
        }
    }
    if (!istrue(self.gascoughinprogress) || istrue(fromimpact)) {
        thread gas_queuecough(isheavy);
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa64
// Size: 0xd7
function gas_queuecough(isheavy) {
    self endon("death_or_disconnect");
    self endon("gas_clear_cough");
    self endon("gas_exited");
    self notify("gas_queue_cough");
    self endon("gas_queue_cough");
    var_fff525b27a42fc40 = gettime() + 1000;
    while (gas_coughisblocked()) {
        waitframe();
    }
    if (isheavy && gettime() > var_fff525b27a42fc40) {
        isheavy = 0;
    }
    var_81b4070b5858078d = getdvarint(@"hash_827901421ad0679", 1) == 1;
    if (var_81b4070b5858078d) {
        thread gas_begincoughing(isheavy);
        return;
    }
    self endon("gas_begin_coughing");
    self.gascoughinprogress = 1;
    if (isheavy) {
        self playgestureviewmodel("iw9_ges_gas_cough_long");
        wait 3.33;
    } else {
        self playgestureviewmodel("iw9_ges_gas_cough");
        wait 1.833;
    }
    self.gascoughinprogress = undefined;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb43
// Size: 0x120
function gas_begincoughing(isheavy) {
    self endon("death_or_disconnect");
    self endon("gas_clear_cough");
    self notify("gas_begin_coughing");
    self endon("gas_begin_coughing");
    if (!isnullweapon(self getheldoffhand())) {
        childthread gas_takeheldoffhand();
    }
    self.gascoughinprogress = 1;
    if (self hasweapon(makeweapon("gas_cough_light_mp"))) {
        self takeweapon("gas_cough_light_mp");
    }
    if (self hasweapon(makeweapon("gas_cough_heavy_mp"))) {
        self takeweapon("gas_cough_heavy_mp");
    }
    weaponobj = ter_op(istrue(isheavy), makeweapon("gas_cough_heavy_mp"), makeweapon("gas_cough_light_mp"));
    duration = ter_op(istrue(isheavy), 3.33, 1.833);
    self giveandfireoffhand(weaponobj);
    childthread gas_monitorcoughweaponfired(weaponobj);
    childthread gas_monitorcoughweapontaken(weaponobj);
    childthread gas_monitorcoughduration(duration);
    waittill_any_3("gas_coughWeaponFired", "gas_coughWeaponTaken", "gas_coughDuration");
    if (self hasweapon(weaponobj)) {
        self takeweapon(weaponobj);
    }
    self.gascoughinprogress = undefined;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6b
// Size: 0x3e
function gas_removecough(fromdeath) {
    self notify("gas_queue_cough");
    self notify("gas_begin_coughing");
    self.gascoughinprogress = undefined;
    if (!istrue(fromdeath)) {
        if (isdefined(self.gastakenweaponobj)) {
            gas_restoreheldoffhand();
        }
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb1
// Size: 0xb9
function gas_clearcough(fromdeath) {
    self notify("gas_queue_cough");
    self notify("gas_begin_coughing");
    self.gascoughinprogress = undefined;
    if (!istrue(fromdeath)) {
        var_81b4070b5858078d = getdvarint(@"hash_827901421ad0679", 1) == 1;
        if (var_81b4070b5858078d) {
            if (self hasweapon(makeweapon("gas_cough_light_mp"))) {
                self takeweapon("gas_cough_light_mp");
            }
            if (self hasweapon(makeweapon("gas_cough_heavy_mp"))) {
                self takeweapon("gas_cough_heavy_mp");
            }
            if (isdefined(self.gastakenweaponobj)) {
                gas_restoreheldoffhand();
            }
            return;
        }
        self stopgestureviewmodel("iw9_ges_gas_cough");
        self stopgestureviewmodel("iw9_ges_gas_cough_long");
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd72
// Size: 0x49
function gas_monitorcoughweaponfired(var_33f644489e4f15ae) {
    self endon("gas_coughWeaponTaken");
    self endon("gas_coughDuration");
    while (true) {
        weaponobj = self waittill("offhand_fired");
        if (issameweapon(weaponobj, var_33f644489e4f15ae)) {
            break;
        }
    }
    self notify("gas_coughWeaponFired");
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdc3
// Size: 0x2f
function gas_monitorcoughweapontaken(var_33f644489e4f15ae) {
    self endon("gas_coughWeaponFired");
    self endon("gas_coughDuration");
    while (self hasweapon(var_33f644489e4f15ae)) {
        waitframe();
    }
    self notify("gas_coughWeaponTaken");
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdfa
// Size: 0x23
function gas_monitorcoughduration(coughduration) {
    self endon("gas_coughWeaponTaken");
    self endon("gas_coughWeaponFired");
    wait coughduration;
    self notify("gas_coughDuration");
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe25
// Size: 0x3a
function enableloopingcoughaudio() {
    if (!isdefined(self.loopingcoughaudio)) {
        self.loopingcoughaudio = 0;
    }
    self.loopingcoughaudio++;
    if (self.loopingcoughaudio == 1) {
        thread startloopingcoughaudio();
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe67
// Size: 0x53
function disableloopingcoughaudio() {
    if (!isdefined(self.loopingcoughaudio)) {
        return;
    }
    self.loopingcoughaudio--;
    assertex(self.loopingcoughaudio >= 0, "disableLoopingCoughAudio called more times than enableLoopingCoughAudio.");
    if (self.loopingcoughaudio == 0) {
        thread stoploopingcoughaudio();
        self.loopingcoughaudio = undefined;
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec2
// Size: 0x4f
function startloopingcoughaudio() {
    self endon("death_or_disconnect");
    self endon("clearLoopingCoughAudio");
    while (true) {
        if (!loopingcoughaudioissupressed()) {
            if (isplayer(self)) {
                self playsound("gas_player_cough");
            } else {
                self playsound("generic_cough_fit_enemy_8");
            }
        }
        wait randomfloatrange(5, 7);
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf19
// Size: 0xa
function stoploopingcoughaudio() {
    self notify("clearLoopingCoughAudio");
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2b
// Size: 0x23
function enableloopingcoughaudiosupression() {
    if (!isdefined(self.loopingcoughaudiosupression)) {
        self.loopingcoughaudiosupression = 0;
    }
    self.loopingcoughaudiosupression++;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf56
// Size: 0x33
function disableloopingcoughaudiosupression() {
    if (!isdefined(self.loopingcoughaudiosupression)) {
        return;
    }
    self.loopingcoughaudiosupression--;
    assertex(self.loopingcoughaudiosupression >= 0, "disableLoopingCoughAudioSupression called more times than enableLoopingCoughAudioSupression.");
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf91
// Size: 0x1b
function loopingcoughaudioissupressed() {
    return isdefined(self.loopingcoughaudiosupression) && self.loopingcoughaudiosupression > 0;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb5
// Size: 0x1e
function clearloopingcoughaudio() {
    self notify("clearLoopingCoughAudio");
    self.loopingcoughaudio = undefined;
    self.loopingcoughaudiosupression = undefined;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfdb
// Size: 0x5d
function gas_takeheldoffhand() {
    if (isdefined(self.gastakenweaponobj)) {
        gas_restoreheldoffhand();
    }
    self endon("gas_restoreHeldOffhand");
    self.gastakenweaponobj = self getheldoffhand();
    self.gastakenweaponammo = self getammocount(self.gastakenweaponobj);
    self takeweapon(self.gastakenweaponobj);
    waitframe();
    thread gas_restoreheldoffhand();
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1040
// Size: 0x47
function gas_restoreheldoffhand() {
    self notify("gas_restoreHeldOffhand");
    self giveweapon(self.gastakenweaponobj);
    self setweaponammoclip(self.gastakenweaponobj, self.gastakenweaponammo);
    self.gastakenweaponobj = undefined;
    self.gastakenweaponammo = undefined;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x108f
// Size: 0x1b9
function gas_applyspeedredux() {
    self endon("death_or_disconnect");
    self notify("gas_modify_speed");
    self endon("gas_modify_speed");
    if (isdefined(self.gasspeedmod)) {
        if (self.gasspeedmod < -0.15) {
            if (isdefined(self.gastriggerstouching)) {
                foreach (trigger in self.gastriggerstouching) {
                    if (isdefined(trigger) && isdefined(trigger.owner) && trigger.owner == self) {
                        /#
                            if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                                self.gasspeedmod = 0;
                                break;
                            }
                        #/
                        self.gasspeedmod = -0.15;
                        updatemovespeedscale();
                        return;
                    }
                }
            }
        }
    } else {
        self.gasspeedmod = 0;
    }
    var_d255a8b6d0ef299d = -0.35;
    if (isdefined(self.gastriggerstouching)) {
        foreach (trigger in self.gastriggerstouching) {
            if (isdefined(trigger) && isdefined(trigger.owner) && trigger.owner == self) {
                /#
                    if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
                        break;
                    }
                #/
                var_d255a8b6d0ef299d = -0.15;
            }
        }
    }
    gas_modifyspeed(var_d255a8b6d0ef299d);
    self.gasspeedmod = var_d255a8b6d0ef299d;
    updatemovespeedscale();
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1250
// Size: 0x2e
function gas_removespeedredux() {
    self endon("death_or_disconnect");
    self notify("gas_modify_speed");
    self endon("gas_modify_speed");
    if (!isdefined(self.gasspeedmod)) {
        return;
    }
    gas_modifyspeed(0);
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1286
// Size: 0x72
function gas_modifyspeed(var_d255a8b6d0ef299d) {
    timeelapsed = 0;
    while (timeelapsed <= 0.65) {
        timeelapsed += 0.05;
        self.gasspeedmod = math::lerp(self.gasspeedmod, var_d255a8b6d0ef299d, min(1, timeelapsed / 0.65));
        updatemovespeedscale();
        wait 0.05;
    }
    self.gasspeedmod = undefined;
    updatemovespeedscale();
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1300
// Size: 0x29
function gas_clearspeedredux(fromdeath) {
    self notify("gas_modify_speed");
    self.gasspeedmod = undefined;
    if (!istrue(fromdeath)) {
        updatemovespeedscale();
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1331
// Size: 0x38
function gas_shouldtakeheldoffhand() {
    switch (self getheldoffhand().basename) {
    case #"hash_3102ab88c5c102fc": 
        return false;
    default: 
        return true;
    }
    return false;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1372
// Size: 0x41
function gas_coughisblocked() {
    if (!val::get("cough_gesture")) {
        return true;
    }
    if (!val::get("offhand_weapons")) {
        return true;
    }
    if (!isnullweapon(self getheldoffhand()) && !gas_shouldtakeheldoffhand()) {
        return true;
    }
    return false;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13bc
// Size: 0x24
function gas_isintrigger() {
    if (!isdefined(self.gastriggerstouching)) {
        return false;
    }
    if (self.gastriggerstouching.size == 0) {
        return false;
    }
    return true;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e9
// Size: 0x1b
function gas_updateplayereffects() {
    if (gas_isintrigger()) {
        thread gas_applyspeedredux();
        thread gas_applyblur();
    }
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x140c
// Size: 0x10
function gas_getblurinterruptdelayms(duration) {
    return 200;
}

// Namespace namespace_b3bd3afb702ba22a / scripts\sp\equipment\teargas
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1425
// Size: 0x46
function updatemovespeedscale() {
    speedperc = 1;
    if (isdefined(self.gasspeedmod)) {
        speedperc += self.gasspeedmod;
    }
    speedperc = clamp(speedperc, 0.1, 1.08);
    self setmovespeedscale(speedperc);
}

