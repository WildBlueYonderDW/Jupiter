// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\mp\javelin.gsc;

#namespace javelin;

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6
// Size: 0xa0
function javelinusageloop() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    javelin_init();
    thread function_2f8e1a565d6bf787();
    while (1) {
        weapon = self getcurrentweapon();
        if (issubstr(weapon.basename, "la_juliet_mp") && javelin_shouldjavelinthink()) {
            self.javelin.stopthinking = 0;
            thread javelin_think();
        } else {
            self.javelin.stopthinking = 1;
        }
        self waittill("weapon_change");
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d
// Size: 0x20
function function_2f8e1a565d6bf787() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self waittill("end_launcher");
    javelin_forceclear();
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c4
// Size: 0x2a9
function javelin_init() {
    self.javelin = spawnstruct();
    if (!isdefined(level.javelin)) {
        level.javelin = spawnstruct();
        level.javelin.states = [];
        level.javelin.states["off"] = [];
        level.javelin.states["off"]["enter"] = &javelin_offstateenter;
        level.javelin.states["off"]["update"] = &javelin_offstateupdate;
        level.javelin.states["off"]["exit"] = &javelin_offstateexit;
        level.javelin.states["scanning"] = [];
        level.javelin.states["scanning"]["enter"] = &javelin_scanningstateenter;
        level.javelin.states["scanning"]["update"] = &javelin_scanningstateupdate;
        level.javelin.states["hold"] = [];
        level.javelin.states["hold"]["enter"] = &javelin_holdstateenter;
        level.javelin.states["hold"]["update"] = &javelin_holdstateupdate;
        level.javelin.states["hold"]["exit"] = &javelin_holdstateexit;
        level.javelin.states["fire"] = [];
        level.javelin.states["fire"]["enter"] = &javelin_firestateenter;
        level.javelin.states["fire"]["update"] = &javelin_firestateupdate;
        level.javelin.states["fire"]["exit"] = &javelin_firestateexit;
        level.javelin.states["too_close"] = [];
        level.javelin.states["too_close"]["enter"] = &javelin_tooclosestateenter;
        level.javelin.states["too_close"]["update"] = &javelin_tooclosestateupdate;
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x674
// Size: 0x11b
function javelin_reset() {
    if (!isdefined(self.javelin)) {
        return;
    }
    self.javelin.adsraisedelaytimer = undefined;
    self.javelin.target = undefined;
    self.javelin.lockstarttime = undefined;
    self.javelin.vehiclelostsightlinetime = undefined;
    self.javelin.groundlockmisses = 0;
    self.javelin.targetnormal = undefined;
    if (isdefined(self.javelin.groundlockonent)) {
        self.javelin.groundlockonent namespace_2a9588dfac284b77::deregisterspawn();
        self.javelin.groundlockonent delete();
    }
    self.javelin.groundlockonent = undefined;
    self.javelin.groundpoints = undefined;
    self.javelin.state = undefined;
    self.javelin.queuedstate = undefined;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x796
// Size: 0xbe
function javelin_offstateenter(var_8f4ef4fdb5e7800a) {
    if (isdefined(self.javelin.target)) {
        removelockedon(self.javelin.target, self);
        self.javelin.target = undefined;
    }
    if (isdefined(self.javelin.groundlockonent)) {
        self.javelin.groundlockonent namespace_2a9588dfac284b77::deregisterspawn();
        self.javelin.groundlockonent delete();
    }
    self.javelin.groundlockonent = undefined;
    javelin_hidenormalhud(0);
    javelin_setuistate(0);
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b
// Size: 0x1e
function javelin_offstateupdate() {
    if (self playerads() >= 0.9) {
        javelin_queuestate("scanning");
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x880
// Size: 0xc
function javelin_offstateexit() {
    javelin_hidenormalhud(1);
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x893
// Size: 0x30
function function_22c8f0d0e0492f51() {
    self endon("disconnect");
    waittill_any_3("death", "end_launcher", "faux_spawn");
    javelin_hidenormalhud(0);
    javelin_setuistate(0);
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ca
// Size: 0xc8
function function_f8db769be3a46d46() {
    self endon("weapon_change");
    self waittill("death_or_disconnect");
    if (isdefined(self.javelin)) {
        if (isdefined(self.javelin.target)) {
            removelockedon(self.javelin.target, self);
            self weaponlockfree();
            self.javelin.target = undefined;
        }
        if (isdefined(self.javelin.groundlockonent)) {
            self.javelin.groundlockonent namespace_2a9588dfac284b77::deregisterspawn();
            self.javelin.groundlockonent delete();
            self.javelin.groundlockonent = undefined;
        }
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x31
function javelin_scanningstateenter(var_8f4ef4fdb5e7800a) {
    javelin_setuistate(1);
    self.javelin.adsraisedelaytimer = gettime() + 100;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d1
// Size: 0x524
function javelin_scanningstateupdate() {
    if (gettime() < self.javelin.adsraisedelaytimer) {
        return;
    }
    var_9cb7c709f17e1c56 = javelin_scanforvehicletarget();
    if (isdefined(var_9cb7c709f17e1c56)) {
        if (javelin_targetpointtooclose(var_9cb7c709f17e1c56.origin)) {
            javelin_queuestate("too_close");
            return;
        }
        /#
            function_26c6f6de312b721f("physicscontents_glass");
        #/
        if (isdefined(self.javelin.target) && self.javelin.target == var_9cb7c709f17e1c56) {
            q = 1;
        }
        self.javelin.target = var_9cb7c709f17e1c56;
        if (isdefined(self.javelin.target)) {
            addlockedon(self.javelin.target, self);
        }
        if (!isdefined(self.javelinlocationtargeted)) {
            marklocation(self.javelin.target);
        }
        javelin_queuestate("hold");
    } else if (self attackbuttonpressed()) {
        if (self.javelin.groundlockmisses >= 1) {
            self.javelin.groundlockmisses = 0;
            self.javelin.groundpoints = undefined;
            return;
        }
        /#
            if (getdvar(@"hash_b56d344ee60e317f") == "<unknown string>" && isdefined(self.javelin.groundpoints)) {
                foreach (var_8ed3cf11185e5d34 in self.javelin.groundpoints) {
                    function_2230e7ba8b6c416f(var_8ed3cf11185e5d34, (0.8, 1, 0.8));
                }
                function_2230e7ba8b6c416f(self.javelin.groundpoints[self.javelin.groundpoints.size - 1], (1, 1, 0.2));
                function_2230e7ba8b6c416f(averagepoint(self.javelin.groundpoints), (0.2, 0.2, 1));
            }
        #/
        traceresults = javelin_eyetraceforward();
        if (!isdefined(traceresults)) {
            self.javelin.groundlockmisses++;
            return;
        }
        if (javelin_targetpointtooclose(traceresults[0])) {
            javelin_queuestate("too_close");
            return;
        }
        if (isdefined(self.javelin.groundpoints)) {
            var_82d5206f31aafac2 = averagepoint(self.javelin.groundpoints);
            dist = distance(var_82d5206f31aafac2, traceresults[0]);
            if (dist > 400) {
                self.javelin.groundlockmisses++;
                return;
            }
        } else {
            self.javelin.groundpoints = [];
            self.javelin.groundnormals = [];
        }
        self.javelin.groundpoints[self.javelin.groundpoints.size] = traceresults[0];
        self.javelin.groundnormals[self.javelin.groundnormals.size] = traceresults[1];
        self.javelin.groundlockmisses = 0;
        if (self.javelin.groundpoints.size < 2) {
            return;
        }
        targetpoint = averagepoint(self.javelin.groundpoints);
        self.javelin.groundlockonent = spawn_tag_origin(targetpoint);
        self.javelin.groundlockonent namespace_2a9588dfac284b77::registerspawncount(1);
        self.javelin.target = self.javelin.groundlockonent;
        self.javelin.target.var_2059b69ce0ec9247 = spawn_tag_origin(traceresults[2]);
        self.javelin.target.var_2059b69ce0ec9247 namespace_2a9588dfac284b77::registerspawncount(1);
        self.javelin.groundlockmisses = 0;
        self.javelin.groundpoints = undefined;
        self.javelin.groundnormals = undefined;
        if (!isdefined(self.javelinlocationtargeted)) {
            marklocation(self.javelin.target.var_2059b69ce0ec9247);
        }
        javelin_queuestate("hold");
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefc
// Size: 0xc9
function javelin_holdstateenter(var_8f4ef4fdb5e7800a) {
    if (!isdefined(self.javelin.target)) {
        return;
    }
    javelin_setuistate(2);
    self.javelin.lockstarttime = gettime();
    self.javelin.lostsightlinetime = 0;
    if (isent(self.javelin.target)) {
        self weaponlockstart(self.javelin.target);
    } else {
        self weaponlockstart(self.javelin.target.origin);
    }
    thread javelin_looplocalseeksound("javelin_clu_acquiring_lock", 0.5);
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcc
// Size: 0x22a
function javelin_holdstateupdate() {
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    /#
        if (getdvar(@"hash_b56d344ee60e317f") == "<unknown string>") {
            function_2230e7ba8b6c416f(self.javelin.target.origin, (0.5, 1, 0.6));
        }
    #/
    if (!isdefined(self.javelin.target)) {
        javelin_queuestate("scanning");
        return;
    }
    var_ab121f888311d66 = 0;
    if (!var_e688b198aa9a4b3f && self.javelin.target namespace_1f188a13f7e79610::isvehicle() && namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(self.javelin.target, self)) {
        if (!isdefined(self.javelin.target.sentientpool)) {
            javelin_queuestate("scanning");
            var_ab121f888311d66 = 1;
        }
    }
    if (!javelin_checktargetstillheld(self.javelin.target)) {
        javelin_queuestate("scanning");
        var_ab121f888311d66 = 1;
    }
    if (javelin_targetpointtooclose(self.javelin.target.origin)) {
        javelin_queuestate("too_close");
        var_ab121f888311d66 = 1;
    }
    if (var_ab121f888311d66) {
        if (isdefined(self.javelin.target)) {
            removelockedon(self.javelin.target, self);
        }
        self weaponlockfree();
        self.javelin.target = undefined;
        if (isdefined(self.javelin.groundlockonent)) {
            self.javelin.groundlockonent delete();
        }
    }
    timepassed = gettime() - self.javelin.lockstarttime;
    if (timepassed < 1150) {
        return;
    }
    javelin_queuestate("fire");
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fd
// Size: 0x17
function javelin_holdstateexit() {
    self notify("stop_lockon_sound");
    self stoplocalsound("javelin_clu_acquiring_lock");
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121b
// Size: 0x16a
function javelin_firestateenter(var_8f4ef4fdb5e7800a) {
    javelin_setuistate(3);
    if (!isdefined(self.javelin.target)) {
        return;
    }
    isentity = isent(self.javelin.target);
    if (isentity && isplayer(self.javelin.target)) {
        self weaponlockfinalize(self.javelin.target, (0, 0, 64), 0);
    } else if (isdefined(self.javelin.groundlockonent)) {
        self weaponlockfinalize(self.javelin.target, (0, 0, 0), 1);
    } else if (!isentity) {
        self weaponlockfinalize(self.javelin.target.origin, (0, 0, 0), 1);
    } else {
        var_f4c1ba742ecddfc0 = javelin_getvehicleoffset(self.javelin.target);
        self weaponlockfinalize(self.javelin.target, var_f4c1ba742ecddfc0, 0);
    }
    thread javelin_looplocalseeksound("javelin_clu_lock", 1.6);
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138c
// Size: 0x10e
function javelin_firestateupdate() {
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    if (!isdefined(self.javelin.target)) {
        javelin_queuestate("scanning");
        return;
    }
    if (!var_e688b198aa9a4b3f && self.javelin.target namespace_1f188a13f7e79610::isvehicle() && namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(self.javelin.target, self)) {
        if (!isdefined(self.javelin.target.sentientpool)) {
            javelin_queuestate("scanning");
        }
    }
    if (!javelin_checktargetstillheld(self.javelin.target)) {
        javelin_queuestate("scanning");
    }
    if (javelin_targetpointtooclose(self.javelin.target.origin)) {
        javelin_queuestate("too_close");
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a1
// Size: 0x93
function javelin_firestateexit() {
    if (isdefined(self.javelin.target)) {
        removelockedon(self.javelin.target, self);
    }
    self weaponlockfree();
    self.javelin.target = undefined;
    if (isdefined(self.javelin.groundlockonent)) {
        self.javelin.groundlockonent delete();
    }
    self notify("stop_lockon_sound");
    self stoplocalsound("javelin_clu_lock");
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153b
// Size: 0x15
function javelin_tooclosestateenter(var_8f4ef4fdb5e7800a) {
    javelin_setuistate(4);
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1557
// Size: 0x76
function javelin_tooclosestateupdate() {
    var_9cb7c709f17e1c56 = javelin_scanforvehicletarget();
    if (isdefined(var_9cb7c709f17e1c56)) {
        if (!javelin_targetpointtooclose(var_9cb7c709f17e1c56.origin)) {
            javelin_queuestate("scanning");
            return;
        }
    } else {
        traceresults = javelin_eyetraceforward();
        if (!isdefined(traceresults) || isdefined(traceresults) && javelin_targetpointtooclose(traceresults[0]) == 0) {
            javelin_queuestate("scanning");
            return;
        }
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d4
// Size: 0x52
function javelin_preupdate() {
    if (isdefined(self.javelin.state) && self.javelin.state != "off") {
        if (self playerads() < 0.9) {
            javelin_queuestate("off");
        }
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162d
// Size: 0xac
function javelin_checktargetstillheld(targetent) {
    if (!isdefined(targetent)) {
        return 0;
    }
    var_a9fc24033722aa10 = targetent;
    if (isdefined(targetent.var_2059b69ce0ec9247)) {
        var_a9fc24033722aa10 = targetent.var_2059b69ce0ec9247;
    }
    var_a298ef0bbefc9aab = self worldpointinreticle_rect(var_a9fc24033722aa10.origin, 35, 120, 80);
    if (!var_a298ef0bbefc9aab) {
        return 0;
    }
    if (!isdefined(self.javelin.groundlockonent) && !javelin_softsighttest(targetent)) {
        return 0;
    }
    if (isdefined(self.javelin.groundlockonent)) {
        if (!self attackbuttonpressed()) {
            return 0;
        }
    }
    return 1;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e1
// Size: 0x15c
function javelin_eyetraceforward() {
    origin = self geteye();
    var_f432e8f2c3b65bad = self getgunangles();
    var_33b453837f886dae = anglestoforward(var_f432e8f2c3b65bad);
    endpoint = origin + var_33b453837f886dae * 15000;
    var_d2b09a5f70a0530a = namespace_2a184fc4902783dc::ray_trace(origin, endpoint, undefined, undefined, 1);
    if (!isdefined(var_d2b09a5f70a0530a) || var_d2b09a5f70a0530a["surfacetype"] == "surftype_none" && var_d2b09a5f70a0530a["hittype"] == "hittype_none" || var_d2b09a5f70a0530a["surfacetype"] == "default") {
        return undefined;
    }
    var_7f74be76ba001a7a = var_d2b09a5f70a0530a;
    var_6b27ab83a5049b73 = function_ceeb605cf6974148(var_d2b09a5f70a0530a, var_33b453837f886dae);
    if (isdefined(var_6b27ab83a5049b73)) {
        var_7f74be76ba001a7a = var_6b27ab83a5049b73;
    }
    /#
        if (getdvar(@"hash_b56d344ee60e317f") == "<unknown string>") {
            thread namespace_2a184fc4902783dc::draw_trace(var_d2b09a5f70a0530a, (1, 1, 0), 0, 1000);
            thread namespace_d028276791d9cff6::drawsphere(var_7f74be76ba001a7a["<unknown string>"], 5, 20, (1, 0, 1));
            iprintlnbold(distance(origin, var_7f74be76ba001a7a["<unknown string>"]));
        }
    #/
    results = [];
    results[0] = var_7f74be76ba001a7a["position"];
    results[1] = var_7f74be76ba001a7a["normal"];
    results[2] = var_d2b09a5f70a0530a["position"];
    return results;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1845
// Size: 0x163
function function_ceeb605cf6974148(var_d2b09a5f70a0530a, var_33b453837f886dae) {
    var_94168349c721c815 = 5000;
    var_31ae59f63933229 = getdvarint(@"hash_a0cf49119410b52", 100);
    var_10c80cb240f98c74 = getdvarint(@"hash_f14add14ff4c308b", 100);
    if (abs(var_d2b09a5f70a0530a["normal"][2]) > 0.1) {
        return undefined;
    }
    var_bdb5669d537521a0 = var_d2b09a5f70a0530a["position"];
    testpoint = var_bdb5669d537521a0 + var_33b453837f886dae * var_10c80cb240f98c74;
    var_a09791f8b1dafd16 = namespace_2a184fc4902783dc::ray_trace_get_all_results(testpoint + (0, 0, 100000), testpoint - (0, 0, var_94168349c721c815), undefined, undefined, 1);
    var_c8bf52a3fd4aec68 = undefined;
    for (i = 0; i < var_a09791f8b1dafd16.size - 1; i++) {
        hit = var_a09791f8b1dafd16[i];
        if (hit["surfacetype"] == "surftype_none") {
            continue;
        } else {
            var_c8bf52a3fd4aec68 = hit;
            break;
        }
    }
    if (!isdefined(var_c8bf52a3fd4aec68)) {
        return undefined;
    }
    var_f435d883a28d8bc2 = var_c8bf52a3fd4aec68["position"];
    var_8242d42fa4c4d38e = var_f435d883a28d8bc2[2] - var_bdb5669d537521a0[2];
    if (isdefined(var_c8bf52a3fd4aec68) && var_8242d42fa4c4d38e < var_31ae59f63933229 && function_c6b77e459cbd9727(var_c8bf52a3fd4aec68["position"])) {
        return var_c8bf52a3fd4aec68;
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19af
// Size: 0x85
function function_c6b77e459cbd9727(point) {
    if (!isdefined(level.outofboundstriggers)) {
        return 1;
    }
    foreach (trigger in level.outofboundstriggers) {
        if (ispointinvolume(point + (0, 0, 20), trigger)) {
            return 0;
        }
    }
    return 1;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3c
// Size: 0x32
function javelin_targetpointtooclose(targetpoint) {
    dist = distance(self.origin, targetpoint);
    if (dist < 850) {
        return 1;
    }
    return 0;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a76
// Size: 0x2f
function javelin_looplocalseeksound(alias, interval) {
    self endon("death_or_disconnect");
    self endon("stop_lockon_sound");
    for (;;) {
        self playlocalsound(alias);
        wait(interval);
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aac
// Size: 0x21
function javelin_queuestate(statename) {
    self.javelin.queuedstate = statename;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad4
// Size: 0x16
function javelin_getqueuedstate() {
    return self.javelin.queuedstate;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1af2
// Size: 0x118
function javelin_enterstate(statename) {
    /#
        assertex(isdefined(level.javelin.states[statename]), "javelin_setState called with uninitialized state '" + statename + "' !");
    #/
    /#
        function_26c6f6de312b721f("<unknown string>" + statename + "<unknown string>");
    #/
    var_8f4ef4fdb5e7800a = self.javelin.state;
    if (isdefined(var_8f4ef4fdb5e7800a) && isdefined(level.javelin.states[var_8f4ef4fdb5e7800a]["exit"])) {
        self [[ level.javelin.states[var_8f4ef4fdb5e7800a]["exit"] ]]();
    }
    self.javelin.state = statename;
    if (isdefined(level.javelin.states[statename]["enter"])) {
        self [[ level.javelin.states[statename]["enter"] ]](var_8f4ef4fdb5e7800a);
    }
    self.javelin.queuedstate = undefined;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c11
// Size: 0xa
function javelin_shouldjavelinthink() {
    return !namespace_5a51aa78ea0b1b9f::is_empd();
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c23
// Size: 0x125
function javelin_think() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("weapon_change");
    self notify("javelin_think");
    self endon("javelin_think");
    javelin_reset();
    javelin_enterstate("off");
    thread function_22c8f0d0e0492f51();
    thread function_f8db769be3a46d46();
    var_263bba08eb70be2d = 0;
    while (1) {
        if (isdefined(self.javelin.stopthinking) && self.javelin.stopthinking) {
            javelin_enterstate("off");
            return;
        }
        var_1eaeb562566a61aa = !javelin_shouldjavelinthink();
        if (var_1eaeb562566a61aa) {
            if (!var_263bba08eb70be2d) {
                var_263bba08eb70be2d = 1;
                javelin_enterstate("off");
            }
        } else {
            var_263bba08eb70be2d = 0;
            javelin_preupdate();
            queuedstate = javelin_getqueuedstate();
            if (isdefined(queuedstate)) {
                javelin_enterstate(queuedstate);
            }
            self [[ level.javelin.states[self.javelin.state]["update"] ]]();
        }
        wait(0.05);
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4f
// Size: 0x151
function javelin_scanforvehicletarget() {
    targets = namespace_3bbb5a98b932c46f::lockonlaunchers_gettargetarray();
    var_db87e220986304f4 = getdvarint(@"hash_eb7d16d9fa10a208", 625000000);
    if (targets.size != 0) {
        var_8110370edb23215a = [];
        foreach (target in targets) {
            if (!isdefined(target)) {
                continue;
            }
            var_a298ef0bbefc9aab = self worldpointinreticle_rect(target.origin, 35, 120, 80);
            if (var_a298ef0bbefc9aab && distancesquared(target.origin, self.origin) <= var_db87e220986304f4) {
                var_8110370edb23215a[var_8110370edb23215a.size] = target;
            }
        }
        if (var_8110370edb23215a.size != 0) {
            sortedtargets = sortbydistance(var_8110370edb23215a, self.origin);
            foreach (target in sortedtargets) {
                if (javelin_vehiclelocksighttest(target)) {
                    return target;
                }
            }
        }
    }
    return undefined;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea8
// Size: 0x15a
function javelin_vehiclelocksighttest(target) {
    eyepos = self geteye();
    if (!isent(target)) {
        contents = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_water", 2:"physicscontents_item", 3:"physicscontents_playernosight"]);
        var_7c44f2c83cc7cf1e = [0:self];
        var_e021c2744cc7ed68 = physics_raycast(eyepos, target.origin, contents, var_7c44f2c83cc7cf1e, 0, "physicsquery_closest", 1);
        if (!isdefined(var_e021c2744cc7ed68) || var_e021c2744cc7ed68.size == 0) {
            return 1;
        }
        return 0;
    }
    center = target getpointinbounds(0, 0, 1);
    passed = sighttracepassed(eyepos, center, 0, target);
    /#
        function_9c1d49cefcf64a9b(eyepos, center, passed);
    #/
    if (passed) {
        return 1;
    }
    front = target getpointinbounds(1, 0, 0);
    passed = sighttracepassed(eyepos, front, 0, target);
    /#
        function_9c1d49cefcf64a9b(eyepos, front, passed);
    #/
    if (passed) {
        return 1;
    }
    back = target getpointinbounds(-1, 0, 0);
    passed = sighttracepassed(eyepos, back, 0, target);
    /#
        function_9c1d49cefcf64a9b(eyepos, back, passed);
    #/
    if (passed) {
        return 1;
    }
    return 0;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200a
// Size: 0x13f
function javelin_getvehicleoffset(var_9cb7c709f17e1c56) {
    offset = (0, 0, 0);
    if (!isdefined(var_9cb7c709f17e1c56)) {
        return offset;
    }
    if (ischoppergunner(var_9cb7c709f17e1c56)) {
        offset = (0, 0, -50);
    } else if (issupporthelo(var_9cb7c709f17e1c56)) {
        offset = (0, 0, -100);
    } else if (isgunship(var_9cb7c709f17e1c56)) {
        offset = (0, 0, 50);
    } else if (isclusterstrike(var_9cb7c709f17e1c56)) {
        offset = (0, 0, 40);
    } else if (isradardrone(var_9cb7c709f17e1c56)) {
        offset = (0, 0, 10);
    } else if (isassaultdrone(var_9cb7c709f17e1c56)) {
        offset = (0, 0, 10);
    } else if (isscramblerdrone(var_9cb7c709f17e1c56)) {
        offset = (0, 0, 10);
    } else if (isradarhelicopter(var_9cb7c709f17e1c56)) {
        offset = (0, 0, -30);
    } else if (isdefined(var_9cb7c709f17e1c56.vehiclename) && var_9cb7c709f17e1c56.vehiclename == "loot_chopper") {
        offset = (0, 0, -100);
    }
    return offset;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2151
// Size: 0x8f
function javelin_softsighttest(targetent) {
    if (javelin_vehiclelocksighttest(targetent)) {
        self.javelin.lostsightlinetime = 0;
        return 1;
    }
    if (self.javelin.lostsightlinetime == 0) {
        self.javelin.lostsightlinetime = gettime();
    }
    timepassed = gettime() - self.javelin.lostsightlinetime;
    if (timepassed >= 500) {
        return 0;
    }
    return 1;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e8
// Size: 0x5b
function javelin_hidenormalhud(enable) {
    if (!isdefined(self)) {
        return;
    }
    if (enable) {
        self setclientomnvar("ui_javelin_view", 1);
        /#
            if (getdvar(@"hash_22ff48dd25613942") == "<unknown string>") {
                self setclientomnvar("<unknown string>", 0);
            }
        #/
    } else {
        self setclientomnvar("ui_javelin_view", 0);
    }
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224a
// Size: 0x98
function javelin_setuistate(state) {
    self setclientomnvar("ui_javelin_state", state);
    /#
        if (getdvar(@"hash_22ff48dd25613942") == "<unknown string>") {
            if (state == 0) {
                iprintlnbold("<unknown string>");
            } else if (state == 1) {
                iprintlnbold("<unknown string>");
            } else if (state == 2) {
                iprintlnbold("<unknown string>");
            } else if (state == 3) {
                iprintlnbold("<unknown string>");
            } else if (state == 4) {
                iprintlnbold("<unknown string>");
            }
        }
    #/
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e9
// Size: 0x73
function marklocation(var_9e3a8d7dc51a2cae) {
    if (!isdefined(var_9e3a8d7dc51a2cae.owner)) {
        var_9e3a8d7dc51a2cae.owner = self;
    }
    if (var_9e3a8d7dc51a2cae.model == "tag_origin") {
        var_9e3a8d7dc51a2cae show();
    }
    var_f27c7690b259ec3a = namespace_f48c22429667eba9::targetmarkergroup_on("javelincrosshair", self, var_9e3a8d7dc51a2cae, self);
    self.javelinlocationtargeted = 1;
    thread watchtargetmarkerentstatus(var_9e3a8d7dc51a2cae, var_f27c7690b259ec3a, 1);
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2363
// Size: 0x72
function watchtargetmarkerentstatus(var_d99ed5531d1fdc1f, targetmarkergroup, var_2045169349ef8877) {
    level endon("game_ended");
    while (isdefined(self.javelin.target) && self.javelin.state != "off") {
        waitframe();
    }
    if (isdefined(targetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(targetmarkergroup);
    }
    self.javelinlocationtargeted = undefined;
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23dc
// Size: 0x2d
function function_26c6f6de312b721f(text) {
    /#
        if (getdvar(@"hash_22ff48dd25613942") == "<unknown string>") {
            iprintln(text);
        }
    #/
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2410
// Size: 0x86
function function_2230e7ba8b6c416f(point, color) {
    /#
        line(point + (10, 0, 0), point - (10, 0, 0), color);
        line(point + (0, 10, 0), point - (0, 10, 0), color);
        line(point + (0, 0, 10), point - (0, 0, 10), color);
    #/
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x249d
// Size: 0x88
function function_9c1d49cefcf64a9b(start, end, passed) {
    /#
        if (getdvar(@"hash_b56d344ee60e317f") != "<unknown string>") {
            return;
        }
        if (passed) {
            color = (0.3, 1, 0.3);
        } else {
            color = (1, 0.2, 0.2);
        }
        var_39e019d2a1e5818b = (0, 0, 5);
        line(start + var_39e019d2a1e5818b, end, color);
    #/
}

// Namespace javelin/namespace_484d135e1e3717ed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252c
// Size: 0xca
function javelin_forceclear() {
    namespace_484d135e1e3717ed::javelin_hidenormalhud(0);
    namespace_484d135e1e3717ed::javelin_setuistate(0);
    if (isdefined(self.javelin)) {
        if (isdefined(self.javelin.target)) {
            removelockedon(self.javelin.target, self);
            self weaponlockfree();
            self.javelin.target = undefined;
        }
        if (isdefined(self.javelin.groundlockonent)) {
            self.javelin.groundlockonent namespace_2a9588dfac284b77::deregisterspawn();
            self.javelin.groundlockonent delete();
        }
    }
    self notify("stop_lockon_sound");
    self stoplocalsound("javelin_clu_lock");
}

