// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\mp\utility\game_utility_mp.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace outofbounds;

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0x4a
function registerentforoob(ent, ref) {
    ent.oobref = ref;
    /#
        var_b3e5aec7aae7317d = getdvarint(@"hash_d197b236ea8564e", 0);
        if (var_b3e5aec7aae7317d) {
            namespace_d9c77dc2a6fe29c6::enableoobimmunity(ent);
        }
    #/
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46d
// Size: 0x17
function deregisterentforoob(ent) {
    ent.oobref = undefined;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b
// Size: 0x34
function registeroobentercallback(ref, callback) {
    struct = getoobdata();
    struct.entercallbacks[ref] = callback;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c6
// Size: 0x34
function registeroobexitcallback(ref, callback) {
    struct = getoobdata();
    struct.exitcallbacks[ref] = callback;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501
// Size: 0x34
function registerooboutoftimecallback(ref, callback) {
    struct = getoobdata();
    struct.outoftimecallbacks[ref] = callback;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53c
// Size: 0x34
function registeroobclearcallback(ref, callback) {
    struct = getoobdata();
    struct.clearcallbacks[ref] = callback;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x577
// Size: 0x4f
function isoob(ent, var_3e36f415f762070e) {
    if (isoobimmune(ent)) {
        return 0;
    }
    if (istrue(var_3e36f415f762070e) && isoobimmune(ent)) {
        return 0;
    }
    return isdefined(ent.oob) && ent.oob > 0;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce
// Size: 0x7b
function enableoob(ent) {
    if (!isdefined(ent.oob)) {
        ent.oob = 0;
    }
    ent.oob++;
    if (!isdefined(ent.oobimmunity) || ent.oobimmunity <= 0) {
        onenteroob(ent);
    }
    if (isdefined(ent.var_76b2c48898593e9)) {
        [[ ent.var_76b2c48898593e9 ]](ent);
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x650
// Size: 0xa2
function disableoob(ent) {
    if (!isdefined(ent.oob)) {
        return;
    }
    /#
        assertex(isdefined(ent.oob), "disableOOB called on an entity that was not out of bounds.");
    #/
    /#
        assertex(ent.oob > 0, "disableOOB more times than enableOOB.");
    #/
    ent.oob--;
    if (ent.oob == 0) {
        ent.oob = undefined;
    }
    if (!isdefined(ent.oobimmunity) || ent.oobimmunity <= 0) {
        onexitoob(ent, 0);
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f9
// Size: 0x29
function isoobimmune(ent) {
    return isdefined(ent.oobimmunity) && ent.oobimmunity > 0;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72a
// Size: 0x6e
function enableoobimmunity(ent) {
    if (!isdefined(ent.oobimmunity)) {
        ent.oobimmunity = 0;
    }
    ent.oobimmunity++;
    if (ent.oobimmunity == 1) {
        if (isdefined(ent.oob) && ent.oob > 0) {
            onexitoob(ent, 0);
        }
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79f
// Size: 0x90
function disableoobimmunity(ent) {
    /#
        assertex(isdefined(ent.oobimmunity), "disableOOBImmunity called on an entity without out of bounds immunity.");
    #/
    /#
        assertex(ent.oobimmunity > 0, "disableOOBImmunity more times than enableOOBImmunity.");
    #/
    ent.oobimmunity--;
    if (ent.oobimmunity == 0) {
        ent.oobimmunity = undefined;
        if (isdefined(ent.oob) && ent.oob > 0) {
            onenteroob(ent);
        }
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x836
// Size: 0x1d9
function clearoob(ent, var_fcef8d217a441961) {
    ent notify("clear_oob");
    if (isoob(ent, 1)) {
        onexitoob(ent, var_fcef8d217a441961, 1);
    }
    var_a92c68f274cd0239 = undefined;
    if (isplayer(ent)) {
        var_a92c68f274cd0239 = &playerclearcallback;
    } else if (isdefined(ent.oobref)) {
        struct = getoobdata();
        var_a92c68f274cd0239 = struct.clearcallbacks[ent.oobref];
    }
    if (isdefined(var_a92c68f274cd0239)) {
        ent [[ var_a92c68f274cd0239 ]]();
    }
    ent.oobref = undefined;
    ent.oob = undefined;
    ent.oobimmunity = undefined;
    ent.oobtimeleft = undefined;
    ent.oobendtime = undefined;
    ent.oobtriggertype = undefined;
    ent.var_4a3cc04781d25c6f = undefined;
    if (isdefined(ent.oobtriggers)) {
        foreach (trigger in ent.oobtriggers) {
            trigger.entstouching[ent getentitynumber()] = undefined;
        }
        ent.oobtriggers = undefined;
    }
    if (isdefined(ent.oobsupressiontriggers)) {
        foreach (trigger in ent.oobsupressiontriggers) {
            trigger.entstouching[ent getentitynumber()] = undefined;
        }
        ent.oobsupressiontriggers = undefined;
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa16
// Size: 0xab
function istouchingoobtrigger() {
    if (isdefined(level.var_5d435d19e6cdf0b5) && istrue(self [[ level.var_5d435d19e6cdf0b5 ]]())) {
        return 1;
    }
    if (istrue(self.allowedintrigger)) {
        return 0;
    }
    if (!isdefined(level.outofboundstriggers)) {
        return 0;
    }
    foreach (trigger in level.outofboundstriggers) {
        if (!namespace_d9c77dc2a6fe29c6::interactswithgivenoobtrigger(trigger, self)) {
            continue;
        }
        if (self istouching(trigger)) {
            return 1;
        }
    }
    return 0;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac9
// Size: 0xdf
function ispointinoutofbounds(var_863c619037f3ac74, var_da8cec9bce12f9cb) {
    if (isdefined(level.var_29977dc303738053) && istrue([[ level.var_29977dc303738053 ]](var_863c619037f3ac74, var_da8cec9bce12f9cb))) {
        return 1;
    }
    var_e448b9771980dfd6 = 0;
    if (!isdefined(level.outofboundstriggers)) {
        return var_e448b9771980dfd6;
    } else {
        foreach (trigger in level.outofboundstriggers) {
            if (ispointinvolume(var_863c619037f3ac74, trigger)) {
                if (isdefined(trigger.script_team) && isdefined(var_da8cec9bce12f9cb) && trigger.script_team != var_da8cec9bce12f9cb) {
                    continue;
                } else {
                    var_e448b9771980dfd6 = 1;
                    break;
                }
            }
        }
    }
    return var_e448b9771980dfd6;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb0
// Size: 0x2a
function initoob() {
    thread watchoobtriggers();
    val::function_2d6e7e0b80767910("enterOOB", [0:"killstreaks", 1:"supers"]);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe1
// Size: 0x2f7
function onenteroob(ent) {
    var_aadbc2b08cd0c218 = [];
    trigger = self;
    if (!isdefined(trigger)) {
        trigger = self;
    }
    triggertype = gettriggertype(ent, trigger);
    if (isplayer(ent)) {
        var_aadbc2b08cd0c218[var_aadbc2b08cd0c218.size] = &playerentercallback;
    }
    if (isdefined(ent.oobref)) {
        struct = getoobdata();
        var_aadbc2b08cd0c218[var_aadbc2b08cd0c218.size] = struct.entercallbacks[ent.oobref];
    }
    ent notify("oob_cooldown_end");
    if (isdefined(ent.oobtimeleft) && previouslytouchedtriggertype(ent, triggertype) && !isdefined(ent.vehicle)) {
        outofboundstime = ent.oobtimeleft / 1000;
        ent.oobendtime = int(gettime() + ent.oobtimeleft);
        ent.oobtimeleft = undefined;
        thread watchooboutoftime(ent, outofboundstime);
    } else {
        outofboundstime = getoutofboundstime(triggertype);
        if (isplayer(ent) && isdefined(ent.vehicle) && isdefined(ent.vehicle.oobendtime)) {
            outofboundstime = (ent.vehicle.oobendtime - gettime()) / 1000;
        } else if (isdefined(ent.oobtimeleft)) {
            outofboundstime = min(ent.oobtimeleft / 1000, outofboundstime);
        } else if (isdefined(ent.oobendtime)) {
            outofboundstime = min((ent.oobendtime - gettime()) / 1000, outofboundstime);
        }
        ent.oobtimeleft = undefined;
        ent.oobtriggertype = triggertype;
        ent.oobendtime = int(gettime() + outofboundstime * 1000);
        thread watchooboutoftime(ent, outofboundstime);
    }
    foreach (var_ce174178f5680dfc in var_aadbc2b08cd0c218) {
        if (isdefined(var_ce174178f5680dfc)) {
            ent thread [[ var_ce174178f5680dfc ]]("exit_oob", "clear_oob", triggertype);
        }
    }
    if (ent namespace_1f188a13f7e79610::isvehicle() && !isdefined(ent.streakinfo)) {
        occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ent);
        foreach (occupant in occupants) {
            onenteroobtrigger(self, occupant);
        }
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedf
// Size: 0x1b5
function onexitoob(ent, var_fcef8d217a441961, var_704294f906fad67e) {
    trigger = self;
    ent notify("exit_oob");
    var_6166ec335950c5f2 = undefined;
    if (!isdefined(ent.oob)) {
        ent notify("oob_timeout_end");
        if (isplayer(ent)) {
            var_6166ec335950c5f2 = &playerexitcallback;
        } else if (isdefined(ent.oobref)) {
            struct = getoobdata();
            var_6166ec335950c5f2 = struct.exitcallbacks[ent.oobref];
        }
        if (!istrue(var_704294f906fad67e)) {
            if (isdefined(ent.oobendtime)) {
                ent.oobtimeleft = int(max(0, ent.oobendtime - gettime()));
                ent.oobendtime = undefined;
                triggertype = gettriggertype(ent, trigger);
                cooldowntime = getcooldowntime(triggertype);
                thread watchoobcooldown(ent, cooldowntime);
            }
        }
    }
    if (isdefined(var_6166ec335950c5f2)) {
        ent thread [[ var_6166ec335950c5f2 ]](var_fcef8d217a441961, var_704294f906fad67e, "clear_oob");
    }
    if (ent namespace_1f188a13f7e79610::isvehicle() && !isdefined(ent.streakinfo)) {
        occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ent);
        foreach (occupant in occupants) {
            if (isdefined(occupant)) {
                onexitoobtrigger(trigger, occupant);
            }
        }
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109b
// Size: 0xc6
function onooboutoftime(ent) {
    var_106b10573bdeadf0 = undefined;
    if (isplayer(ent)) {
        var_775c9a68f9c00019 = 1;
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            if (istrue(level.infilcinematicactive)) {
                var_775c9a68f9c00019 = 0;
            } else if (isdefined(level.matchcountdowntime) && level.matchcountdowntime < 2) {
                var_775c9a68f9c00019 = 0;
            }
        }
        if (var_775c9a68f9c00019) {
            var_106b10573bdeadf0 = &playeroutoftimecallback;
        }
    } else if (isdefined(ent.oobref)) {
        struct = getoobdata();
        var_106b10573bdeadf0 = struct.outoftimecallbacks[ent.oobref];
    }
    if (isdefined(var_106b10573bdeadf0)) {
        ent thread [[ var_106b10573bdeadf0 ]]("oob_timeout_end", "clear_oob");
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1168
// Size: 0x4f
function watchooboutoftime(ent, timeleft) {
    if (isplayer(ent)) {
        ent endon("death_or_disconnect");
    } else {
        ent endon("death");
    }
    ent notify("oob_timeout_end");
    ent endon("oob_timeout_end");
    ent endon("clear_oob");
    wait(timeleft);
    thread onooboutoftime(ent);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11be
// Size: 0x5c
function watchoobcooldown(ent, timeleft) {
    if (isplayer(ent)) {
        ent endon("death_or_disconnect");
    } else {
        ent endon("death");
    }
    ent notify("oob_cooldown_end");
    ent endon("oob_cooldown_end");
    ent endon("clear_oob");
    wait(timeleft);
    ent.oobtimeleft = undefined;
    ent.oobtriggertype = undefined;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1221
// Size: 0xad
function playerentercallback(var_44e306d53285e1f8, var_93f5db7e81311353, triggertype) {
    var_49e84ec5d8aa4f0a = function_c6aa39a55c49dc1(triggertype);
    self.var_4a3cc04781d25c6f = var_49e84ec5d8aa4f0a;
    self setclientomnvar("ui_out_of_bounds_type", var_49e84ec5d8aa4f0a);
    self setclientomnvar("ui_out_of_bounds_countdown", self.oobendtime);
    val::function_3633b947164be4f3("enterOOB", 0);
    if (isdefined(self.offhandweapon) && self isthrowinggrenade() && namespace_68e641469fde3fa7::issuperweapon(self.offhandweapon)) {
        self function_187fb04ebd01baea();
    }
    if (!isdefined(self.vehicle)) {
        thread function_39c5bd55494a224b();
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d5
// Size: 0x59
function playerexitcallback(var_fcef8d217a441961, var_704294f906fad67e, var_93f5db7e81311353) {
    self setclientomnvar("ui_out_of_bounds_type", 0);
    self setclientomnvar("ui_out_of_bounds_countdown", 0);
    val::function_588f2307a3040610("enterOOB");
    if (istrue(self.var_f9b51be13b8defc)) {
        self.var_f9b51be13b8defc = undefined;
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1335
// Size: 0x6f
function playeroutoftimecallback(var_2f57cfae824ca728, var_93f5db7e81311353) {
    trigger = getlastoobtrigger(self);
    triggertype = gettriggertype(self, trigger);
    if (triggertype == "minefield") {
        thread playeroutoftimeminefield(var_2f57cfae824ca728, var_93f5db7e81311353);
    } else {
        self.var_93532ea94accabdb = 1;
        _suicide(undefined, 1);
        self.var_93532ea94accabdb = undefined;
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ab
// Size: 0x26
function playerclearcallback(var_93f5db7e81311353) {
    self setclientomnvar("ui_out_of_bounds_type", 0);
    self setclientomnvar("ui_out_of_bounds_countdown", 0);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d8
// Size: 0xe7
function playeroutoftimeminefield(var_2f57cfae824ca728, var_93f5db7e81311353) {
    var_64ac6c50ce3a7c25 = self.origin;
    var_cab9f210984bed37 = namespace_2a184fc4902783dc::ray_trace(self.origin, self.origin - (0, 0, 1000), self);
    if (isdefined(var_cab9f210984bed37["hittype"] != "hittype_none") && isdefined(var_cab9f210984bed37["position"])) {
        var_64ac6c50ce3a7c25 = var_cab9f210984bed37["position"];
    }
    mine = spawn("script_model", var_64ac6c50ce3a7c25);
    mine setmodel("ks_minefield_mp");
    mine setentityowner(self);
    mine setotherent(self);
    mine setscriptablepartstate("warning_click", "on", 0);
    var_3f67bb4d035fb5a1 = playeroutoftimeminefieldinternal(mine, var_2f57cfae824ca728, var_93f5db7e81311353);
    if (istrue(var_3f67bb4d035fb5a1)) {
        wait(2);
    }
    mine delete();
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c6
// Size: 0x78
function playeroutoftimeminefieldinternal(mine, var_2f57cfae824ca728, var_93f5db7e81311353) {
    self endon("death_or_disconnect");
    if (isdefined(var_2f57cfae824ca728)) {
        self endon(var_2f57cfae824ca728);
    }
    if (isdefined(var_93f5db7e81311353)) {
        self endon(var_93f5db7e81311353);
    }
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.3);
    mine setscriptablepartstate("explosion", "on", 0);
    wait(0.05);
    self dodamage(2000, self.origin, self, mine, "MOD_EXPLOSIVE", "minefield_mp");
    return 1;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1546
// Size: 0x46
function function_39c5bd55494a224b() {
    self endon("death_or_disconnect");
    self endon("exit_oob");
    self waittill("vehicle_enter");
    if (isdefined(self.vehicle) && !namespace_dbbb37eb352edf96::function_a0f7306fc3c08ecf(self.vehicle, 1)) {
        self.var_f9b51be13b8defc = 1;
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1593
// Size: 0x64
function checkinvalidoobtriggers() {
    foreach (trigger in self.oobtriggers) {
        if (!function_4badb9b6ac027b93(self, trigger)) {
            onexitoobtrigger(trigger, self);
        }
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fe
// Size: 0x85
function killstreakentercallback(var_44e306d53285e1f8, var_93f5db7e81311353, triggertype) {
    var_49e84ec5d8aa4f0a = function_c6aa39a55c49dc1(triggertype);
    self.var_4a3cc04781d25c6f = var_49e84ec5d8aa4f0a;
    if (isdefined(self.owner) && istrue(self.ispiloted)) {
        self.owner setclientomnvar("ui_out_of_bounds_type", var_49e84ec5d8aa4f0a);
        self.owner setclientomnvar("ui_out_of_bounds_countdown", self.oobendtime);
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168a
// Size: 0x61
function killstreakexitcallback(var_fcef8d217a441961, var_704294f906fad67e, var_93f5db7e81311353) {
    if (isdefined(self.owner) && istrue(self.ispiloted)) {
        self.owner setclientomnvar("ui_out_of_bounds_type", 0);
        self.owner setclientomnvar("ui_out_of_bounds_countdown", 0);
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f2
// Size: 0x44
function killstreakoutoftimecallback(var_2f57cfae824ca728, var_93f5db7e81311353) {
    dodamagetokillstreak(10000, self.owner, self, self.team, self.origin, "MOD_EXPLOSIVE", "nuke_multi_mp");
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173d
// Size: 0x48
function killstreakclearcallback() {
    if (isdefined(self.owner) && istrue(self.ispiloted)) {
        self.owner setclientomnvar("ui_out_of_bounds_type", 0);
        self.owner setclientomnvar("ui_out_of_bounds_countdown", 0);
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178c
// Size: 0x47
function killstreakregisteroobcallbacks() {
    registeroobentercallback("killstreak", &killstreakentercallback);
    registeroobexitcallback("killstreak", &killstreakexitcallback);
    registerooboutoftimecallback("killstreak", &killstreakoutoftimecallback);
    registeroobclearcallback("killstreak", &killstreakclearcallback);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17da
// Size: 0xde
function watchoobtriggers() {
    if (namespace_cd0b2d039510b38d::lpcfeaturegated() && !namespace_de5151d68164781a::function_9a2fd0d19774edde() && !namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    }
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            thread watchoobtrigger(trigger);
        }
        if (isdefined(level.outofboundstriggerpatches)) {
            foreach (trigger in level.outofboundstriggerpatches) {
                thread watchoobsuppressiontrigger(trigger);
            }
        }
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bf
// Size: 0x40
function watchoobtrigger(trigger) {
    trigger.entstouching = [];
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    thread watchoobtriggerexit(trigger);
    thread watchoobtriggerenter(trigger);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1906
// Size: 0x4c
function watchoobtriggerenter(trigger) {
    level endon("game_ended");
    level endon("switch_oob");
    while (1) {
        ent = trigger waittill("trigger");
        if (!function_4badb9b6ac027b93(ent, trigger)) {
            continue;
        }
        onenteroobtrigger(trigger, ent);
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1959
// Size: 0x5b
function function_4badb9b6ac027b93(ent, trigger) {
    if (istrue(trigger.isdisabled)) {
        return 0;
    }
    if (isplayer(ent) && isdefined(ent.c130)) {
        return 0;
    }
    if (!interactswithgivenoobtrigger(trigger, ent)) {
        return 0;
    }
    if (!interactswithoobtriggers(ent)) {
        return 0;
    }
    return 1;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19bc
// Size: 0xdd
function watchoobtriggerexit(trigger) {
    level endon("game_ended");
    level endon("switch_oob");
    var_c30cd90a1a82d688 = isent(trigger);
    while (1) {
        var_5c397c9cf7a06802 = trigger.entstouching;
        foreach (id, ent in var_5c397c9cf7a06802) {
            if (!isdefined(ent)) {
                trigger.entstouching[id] = undefined;
            }
            if (isdefined(ent) && !trigger function_e3c3bc95af1159b8(ent, var_c30cd90a1a82d688) && (!isdefined(ent.vehicle) || istrue(ent.var_f9b51be13b8defc))) {
                onexitoobtrigger(trigger, ent);
            }
        }
        waitframe();
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1aa0
// Size: 0x3b
function private function_e3c3bc95af1159b8(ent, var_994e7746ed176aec) {
    return var_994e7746ed176aec && self istouching(ent) || !var_994e7746ed176aec && ispointinvolume(ent.origin, self);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae3
// Size: 0xf1
function onenteroobtrigger(trigger, ent, var_e260297371d759c4) {
    entnum = ent getentitynumber();
    if (isdefined(trigger.entstouching[entnum]) && !istrue(var_e260297371d759c4)) {
        return;
    }
    trigger.entstouching[entnum] = ent;
    if (!isdefined(ent.oobtriggers)) {
        ent.oobtriggers = [];
    }
    var_5c397c9cf7a06802 = [0:trigger];
    foreach (var_70e9548d1e3ea919 in ent.oobtriggers) {
        var_5c397c9cf7a06802[var_5c397c9cf7a06802.size] = var_70e9548d1e3ea919;
    }
    ent.oobtriggers = var_5c397c9cf7a06802;
    trigger enableoob(ent);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bdb
// Size: 0x7b
function onexitoobtrigger(trigger, ent) {
    if (!isdefined(ent)) {
        return;
    }
    entnum = ent getentitynumber();
    trigger.entstouching[entnum] = undefined;
    trigger disableoob(ent);
    ent.oobtriggers = array_remove(ent.oobtriggers, trigger);
    if (ent.oobtriggers.size == 0) {
        ent.oobtriggers = undefined;
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5d
// Size: 0x37
function watchoobsuppressiontrigger(trigger) {
    trigger.entstouching = [];
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    thread watchoobsuppressiontriggerexit(trigger);
    thread watchoobsupressiontriggerenter(trigger);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9b
// Size: 0x44
function watchoobsupressiontriggerenter(trigger) {
    level endon("game_ended");
    while (1) {
        ent = trigger waittill("trigger");
        if (!interactswithoobtriggers(ent)) {
            continue;
        }
        onenteroobsuppressiontrigger(trigger, ent);
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce6
// Size: 0xa7
function watchoobsuppressiontriggerexit(trigger) {
    level endon("game_ended");
    while (1) {
        var_5c397c9cf7a06802 = trigger.entstouching;
        if (isdefined(var_5c397c9cf7a06802)) {
            foreach (id, ent in var_5c397c9cf7a06802) {
                if (!isdefined(ent)) {
                    trigger.entstouching[id] = undefined;
                }
                if (isdefined(ent) && !trigger istouching(ent)) {
                    onexitoobsupressiontrigger(trigger, ent);
                }
            }
        }
        waitframe();
    }
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d94
// Size: 0xde
function onenteroobsuppressiontrigger(trigger, ent) {
    entnum = ent getentitynumber();
    if (isdefined(trigger.entstouching[entnum])) {
        return;
    }
    trigger.entstouching[entnum] = ent;
    if (!isdefined(ent.oobsupressiontriggers)) {
        ent.oobsupressiontriggers = [];
    }
    var_5c397c9cf7a06802 = [0:trigger];
    foreach (var_90410c262793087e in ent.oobsupressiontriggers) {
        var_5c397c9cf7a06802[var_5c397c9cf7a06802.size] = var_90410c262793087e;
    }
    ent.oobsupressiontriggers = var_5c397c9cf7a06802;
    enableoobimmunity(ent);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e79
// Size: 0x68
function onexitoobsupressiontrigger(trigger, ent) {
    entnum = ent getentitynumber();
    trigger.entstouching[entnum] = undefined;
    ent.oobsupressiontriggers[trigger getentitynumber()] = undefined;
    if (ent.oobsupressiontriggers.size == 0) {
        ent.oobsupressiontriggers = undefined;
    }
    disableoobimmunity(ent);
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee8
// Size: 0x1e9
function interactswithgivenoobtrigger(trigger, ent) {
    isvehicle = ent namespace_1f188a13f7e79610::isvehicle();
    if (isdefined(trigger.script_team)) {
        if (isgroundwarcoremode() || istrue(level.var_cbb6ec6b15529252)) {
            return 0;
        }
        if (isvehicle) {
            if (isdefined(ent.team) && ent.team != "neutral" && ent.team != trigger.script_team) {
                return 0;
            }
            if (isdefined(ent.owner) && ent.owner.team != trigger.script_team) {
                return 0;
            }
            if (isdefined(ent.occupants)) {
                foreach (occupant in ent.occupants) {
                    if (isdefined(occupant.team) && occupant.team != trigger.script_team) {
                        return 0;
                    }
                }
            }
        } else if (!isdefined(ent.team) || ent.team != trigger.script_team) {
            return 0;
        }
    }
    if (isvehicle) {
        ref = ent namespace_1f188a13f7e79610::function_d93ec4635290febd();
        if (issharedfuncdefined(ref, "interactsWithOOBTrigger")) {
            if (!function_f3bb4f4911a1beb2(ref, "interactsWithOOBTrigger", trigger, ent)) {
                return 0;
            }
        }
    }
    if (isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == "onlyVehOOB") {
        if (!istrue(isvehicle)) {
            return 0;
        }
    }
    return 1;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d9
// Size: 0x84
function interactswithoobtriggers(ent) {
    if (isdefined(ent)) {
        if (isplayer(ent)) {
            if (ent namespace_f8065cafc523dba5::_isalive()) {
                return 1;
            }
        }
        if (isdefined(ent.oobref)) {
            if (ent namespace_1f188a13f7e79610::isvehicle()) {
                if (!istrue(ent.isdestroyed)) {
                    return 1;
                }
            }
            if (isdefined(ent.streakinfo) && iskillstreakaffectedbyobb(ent.streakinfo.streakname)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2165
// Size: 0x62
function getoobdata() {
    struct = level.oobdata;
    if (!isdefined(struct)) {
        struct = spawnstruct();
        struct.entercallbacks = [];
        struct.exitcallbacks = [];
        struct.outoftimecallbacks = [];
        struct.clearcallbacks = [];
        level.oobdata = struct;
    }
    return struct;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21cf
// Size: 0x4d
function iskillstreakaffectedbyobb(streakname) {
    var_60f0eedde53bb451 = 0;
    switch (streakname) {
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_cf0ef5bef19a311b":
    case #"hash_e40585107590f016":
        var_60f0eedde53bb451 = 1;
        break;
    }
    return var_60f0eedde53bb451;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2224
// Size: 0xc1
function gettriggertype(ent, trigger) {
    triggertype = "default";
    if (trigger namespace_1f188a13f7e79610::isvehicle()) {
        return "vehicle";
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        return "br";
    }
    if (isdefined(trigger) && isdefined(trigger.script_team)) {
        return "restricted";
    }
    if (isdefined(ent) && ent namespace_1f188a13f7e79610::isvehicle()) {
        return "default";
    }
    if (isdefined(ent) && isdefined(ent.streakinfo)) {
        return "default";
    }
    if (isdefined(trigger) && isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == "MineField") {
        triggertype = "minefield";
    }
    return triggertype;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22ed
// Size: 0xb2
function private function_c6aa39a55c49dc1(triggertype) {
    var_4a3cc04781d25c6f = 1;
    var_7c4a4f886922a011 = 0;
    if (islargemap()) {
        gametype = getgametype();
        switch (gametype) {
        case #"hash_ca6516c10db2c95":
        case #"hash_5e78ea9021845d4a":
        case #"hash_7f9c384a34cc392f":
        case #"hash_9a6f07d0214a87db":
        case #"hash_c065cef60f38490a":
            var_7c4a4f886922a011 = 1;
            break;
        }
        if (isgroundwarcoremode()) {
            var_7c4a4f886922a011 = 1;
        }
    }
    if (istrue(var_7c4a4f886922a011)) {
        if (isdefined(triggertype) && triggertype == "restricted") {
            var_4a3cc04781d25c6f = 2;
        }
    }
    return var_4a3cc04781d25c6f;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a7
// Size: 0x59
function getcooldowntime(triggertype) {
    switch (triggertype) {
    case #"hash_18ad1d5da2e56d4c":
    case #"hash_6b15362474c2e2b2":
    case #"hash_7038dec66d8275be":
    case #"hash_b9c0ff6cd406fe0f":
    case #"hash_fa21c4f6bd5e3815":
        return getmaxoutofboundscooldown();
        break;
    }
    return undefined;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2408
// Size: 0x75
function getoutofboundstime(triggertype) {
    switch (triggertype) {
    case #"hash_6b15362474c2e2b2":
        return getmaxoutofboundsminefieldtime();
    case #"hash_18ad1d5da2e56d4c":
        return getmaxoutofboundsrestrictedtime();
    case #"hash_fa21c4f6bd5e3815":
        return getmaxoutofboundsbrtime();
    case #"hash_7038dec66d8275be":
        return getmaxoutofboundstime();
    case #"hash_b9c0ff6cd406fe0f":
        return function_a01d18a56c6cc1aa();
        break;
    }
    return undefined;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2485
// Size: 0x2a
function getlastoobtrigger(ent) {
    if (isdefined(ent.oobtriggers)) {
        return ent.oobtriggers[0];
    }
    return undefined;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24b7
// Size: 0x82
function previouslytouchedtriggertype(var_7edface381884ca9, var_d9d739b40fedd346) {
    var_1b99bb6cc4aec0fe = 0;
    if (isdefined(var_7edface381884ca9.oobtriggertype)) {
        var_f4a7b9fd1e2f84f0 = var_7edface381884ca9.oobtriggertype;
        if (var_d9d739b40fedd346 == var_f4a7b9fd1e2f84f0) {
            var_1b99bb6cc4aec0fe = 1;
        } else if ((var_d9d739b40fedd346 == "default" || var_d9d739b40fedd346 == "minefield") && (var_f4a7b9fd1e2f84f0 == "default" || var_f4a7b9fd1e2f84f0 == "minefield")) {
            var_1b99bb6cc4aec0fe = 1;
        }
    }
    return var_1b99bb6cc4aec0fe;
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2541
// Size: 0x9b
function function_420d6eda841fd001(triggertype, origin, angles, radius, height, var_2c40e29836434cbe) {
    trigger = spawn(triggertype, origin, 0, radius, height);
    trigger.angles = angles;
    level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
    /#
        if (var_2c40e29836434cbe == 1) {
            thread namespace_d028276791d9cff6::drawsphere(trigger.origin, radius, 1000, (1, 1, 0));
        }
    #/
}

// Namespace outofbounds/namespace_d9c77dc2a6fe29c6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25e3
// Size: 0xad
function function_49f55ab317da5250() {
    var_2c40e29836434cbe = 0;
    var_aff10137fa371a53 = getstructarray("OutOfBounds", "targetname");
    if (isdefined(var_aff10137fa371a53)) {
        foreach (var_102cb12a631da712 in var_aff10137fa371a53) {
            function_420d6eda841fd001("trigger_rotatable_radius", var_102cb12a631da712.origin, var_102cb12a631da712.angles, var_102cb12a631da712.radius, var_102cb12a631da712.height, var_2c40e29836434cbe);
        }
    }
}

