// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\weapons.gsc;

#namespace namespace_56362014e0153c0e;

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0x94
function targetleadusageloop() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    targetlead_init();
    while (true) {
        weapon = self getcurrentweapon();
        if (weapon.basename == "iw8_la_kgolf_mp" && targetlead_shouldtargetleadthink()) {
            self.targetlead.stopthinking = 0;
            thread targetlead_think();
        } else {
            self.targetlead.stopthinking = 1;
        }
        self waittill("weapon_change");
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x19f
function targetlead_init() {
    self.targetlead = spawnstruct();
    self.targetlead.states = [];
    self.targetlead.states["off"] = [];
    self.targetlead.states["off"]["enter"] = &targetlead_offstateenter;
    self.targetlead.states["off"]["update"] = &targetlead_offstateupdate;
    self.targetlead.states["off"]["exit"] = &targetlead_offstateexit;
    self.targetlead.states["scanning"] = [];
    self.targetlead.states["scanning"]["enter"] = &targetlead_scanningstateenter;
    self.targetlead.states["scanning"]["update"] = &targetlead_scanningstateupdate;
    self.targetlead.states["hold"] = [];
    self.targetlead.states["hold"]["enter"] = &targetlead_holdstateenter;
    self.targetlead.states["hold"]["update"] = &targetlead_holdstateupdate;
    self.targetlead.states["hold"]["exit"] = &targetlead_holdstateexit;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x481
// Size: 0xe7
function targetlead_reset() {
    self.targetlead.adsraisedelaytimer = undefined;
    self.targetlead.target = undefined;
    self.targetlead.lockstarttime = undefined;
    self.targetlead.vehiclelostsightlinetime = undefined;
    self.targetlead.isaimingatreticle = 0;
    if (isdefined(self.targetlead.leadpositionent)) {
        self.targetlead.leadpositionent scripts/cp_mp/ent_manager::deregisterspawn();
        self.targetlead.leadpositionent delete();
    }
    self.targetlead.leadpositionent = undefined;
    self.targetlead.state = undefined;
    self.targetlead.queuedstate = undefined;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56f
// Size: 0x3e
function targetlead_offstateenter(fromstate) {
    if (isdefined(fromstate)) {
        scripts/cp_mp/targetmarkergroups::targetmarkergroup_off(self.targetlead.targetmarkergroup);
        self.targetlead.targetmarkergroup = undefined;
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b4
// Size: 0x1e
function targetlead_offstateupdate() {
    if (self playerads() >= 0.6) {
        targetlead_queuestate("scanning");
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9
// Size: 0x3
function targetlead_offstateexit() {
    
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e3
// Size: 0x5a
function targetlead_scanningstateenter(fromstate) {
    self.targetlead.adsraisedelaytimer = gettime() + 100;
    if (isdefined(fromstate) && fromstate == "off") {
        self.targetlead.targetmarkergroup = scripts/cp_mp/targetmarkergroups::targetmarkergroup_on("kgolftarget", self, undefined, self);
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x644
// Size: 0x66
function targetlead_scanningstateupdate() {
    if (gettime() < self.targetlead.adsraisedelaytimer) {
        return;
    }
    vehicletarget = targetlead_scanforvehicletarget();
    if (isdefined(vehicletarget)) {
        /#
            function_7ea27fe25f2f18e5("<unknown string>");
        #/
        self.targetlead.target = vehicletarget;
        targetlead_queuestate("hold");
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1
// Size: 0x90
function targetlead_holdstateenter(fromstate) {
    self.targetlead.lockstarttime = gettime();
    self.targetlead.lostsightlinetime = 0;
    self.targetlead.leadpositionent = spawn_tag_origin();
    self.targetlead.leadpositionent scripts/cp_mp/ent_manager::registerspawncount(1);
    self.targetlead.leadpositionent show();
    targetlead_uimarkentities();
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x748
// Size: 0x152
function targetlead_holdstateupdate() {
    /#
        function_6eee6cec92ff2a91(self.targetlead.target.origin, (0.5, 1, 0.6));
    #/
    if (!targetlead_checktargetstillheld(self.targetlead.target)) {
        targetlead_queuestate("scanning");
        return;
    } else {
        newposition = targetlead_getleadposition(self.targetlead.target);
        if (isdefined(newposition)) {
            self.targetlead.leadpositionent moveto(newposition, 0.05);
        }
    }
    insidereticle = self worldpointinreticle_circle(self.targetlead.leadpositionent.origin, 55, 40);
    if (insidereticle && !self.targetlead.isaimingatreticle) {
        self.targetlead.isaimingatreticle = 1;
        thread targetlead_airburstholdthink();
        return;
    }
    if (!insidereticle && self.targetlead.isaimingatreticle) {
        self.targetlead.isaimingatreticle = 0;
        self notify("stop_airburst_think");
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a1
// Size: 0x84
function targetlead_holdstateexit() {
    targetlead_uiunmarkentities();
    if (isdefined(self.targetlead.leadpositionent)) {
        self.targetlead.leadpositionent scripts/cp_mp/ent_manager::deregisterspawn();
        self.targetlead.leadpositionent delete();
    }
    self.targetlead.leadpositionent = undefined;
    self.targetlead.isaimingatreticle = 0;
    self notify("stop_airburst_think");
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92c
// Size: 0x3a
function targetlead_preupdate() {
    if (self.targetlead.state != "off") {
        if (self playerads() < 0.6) {
            targetlead_queuestate("off");
        }
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96d
// Size: 0x3
function targetlead_onstartthink() {
    
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x977
// Size: 0x43
function targetlead_onstopthink() {
    if (isdefined(self.targetlead.state) && self.targetlead.state != "off") {
        targetlead_enterstate("off");
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c1
// Size: 0xe5
function targetlead_getleadposition(trackedentity) {
    entvelocity = (0, 0, 0);
    if (trackedentity.classname == "script_vehicle") {
        entvelocity = trackedentity vehicle_getvelocity();
    } else if (isgunship(trackedentity) || isuav(trackedentity)) {
        entvelocity = trackedentity.velocity;
    }
    entposition = trackedentity.origin + targetlead_getvehicleoffset(trackedentity);
    playerposition = self geteye();
    missilespeed = 4000;
    intercept = projectileintercept(playerposition, (0, 0, 0), missilespeed, entposition, entvelocity);
    if (isdefined(intercept)) {
        /#
            function_6eee6cec92ff2a91(intercept, (0.5, 1, 0.6), 30);
        #/
        return intercept;
    }
    return undefined;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaae
// Size: 0x102
function targetlead_getvehicleoffset(vehicletarget) {
    offset = (0, 0, 0);
    if (ischoppergunner(vehicletarget)) {
        offset = (0, 0, -50);
    } else if (issupporthelo(vehicletarget)) {
        offset = (0, 0, -100);
    } else if (isgunship(vehicletarget)) {
        offset = (0, 0, 40);
    } else if (isclusterstrike(vehicletarget)) {
        offset = (0, 0, 40);
    } else if (isradardrone(vehicletarget)) {
        offset = (0, 0, 10);
    } else if (isassaultdrone(vehicletarget)) {
        offset = (0, 0, 10);
    } else if (isscramblerdrone(vehicletarget)) {
        offset = (0, 0, 10);
    } else if (isradarhelicopter(vehicletarget)) {
        offset = (0, 0, 30);
    }
    return offset;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb8
// Size: 0x47
function targetlead_checktargetstillheld(targetent) {
    if (!isdefined(targetent)) {
        return false;
    }
    insidereticle = self worldpointinreticle_circle(targetent.origin, 55, 240);
    if (!insidereticle) {
        return false;
    }
    if (!targetlead_softsighttest(targetent)) {
        return false;
    }
    return true;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc07
// Size: 0x2f
function targetlead_looplocalseeksound(alias, interval) {
    self endon("death_or_disconnect");
    self endon("stop_lockon_sound");
    for (;;) {
        self playlocalsound(alias);
        wait(interval);
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3d
// Size: 0x21
function targetlead_queuestate(statename) {
    self.targetlead.queuedstate = statename;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc65
// Size: 0x16
function targetlead_getqueuedstate() {
    return self.targetlead.queuedstate;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc83
// Size: 0x15a
function targetlead_enterstate(statename) {
    /#
        assertex(isdefined(self.targetlead.states[statename]), "targetLead_enterState called with uninitialized state '" + statename + "' !");
    #/
    if (isdefined(self.targetlead.state)) {
        /#
            assertex(self.targetlead.state != statename, "targetLead_enterState called with state '" + statename + "' when that was already the current state!");
        #/
    }
    /#
        function_7ea27fe25f2f18e5("<unknown string>" + statename + "<unknown string>");
    #/
    fromstate = self.targetlead.state;
    if (isdefined(fromstate) && isdefined(self.targetlead.states[fromstate]["exit"])) {
        self [[ self.targetlead.states[fromstate]["exit"] ]]();
    }
    self.targetlead.state = statename;
    if (isdefined(self.targetlead.states[statename]["enter"])) {
        self [[ self.targetlead.states[statename]["enter"] ]](fromstate);
    }
    self.targetlead.queuedstate = undefined;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde4
// Size: 0xa
function targetlead_shouldtargetleadthink() {
    return !scripts/cp_mp/emp_debuff::is_empd();
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf6
// Size: 0xee
function targetlead_think() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self notify("targetLead_think");
    self endon("targetLead_think");
    targetlead_reset();
    targetlead_enterstate("off");
    targetlead_onstartthink();
    thread targetlead_earlyoutthink();
    while (true) {
        if (isdefined(self.targetlead.stopthinking) && self.targetlead.stopthinking || !targetlead_shouldtargetleadthink()) {
            self notify("targetLead_stop");
            targetlead_onstopthink();
            return;
        }
        targetlead_preupdate();
        queuedstate = targetlead_getqueuedstate();
        if (isdefined(queuedstate)) {
            targetlead_enterstate(queuedstate);
        }
        self [[ self.targetlead.states[self.targetlead.state]["update"] ]]();
        wait(0.05);
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeeb
// Size: 0x22
function targetlead_earlyoutthink() {
    self endon("targetLead_stop");
    waittill_any_2("death_or_disconnect", "faux_spawn");
    targetlead_onstopthink();
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf14
// Size: 0xca
function targetlead_scanforvehicletarget() {
    targets = scripts/mp/weapons::lockonlaunchers_gettargetarray();
    if (targets.size != 0) {
        var_8110370edb23215a = [];
        foreach (target in targets) {
            insidereticle = self worldpointinreticle_circle(target.origin, 55, 240);
            if (insidereticle) {
                var_8110370edb23215a[var_8110370edb23215a.size] = target;
            }
        }
        if (var_8110370edb23215a.size != 0) {
            sortedtargets = sortbydistance(var_8110370edb23215a, self.origin);
            if (targetlead_vehiclelocksighttest(sortedtargets[0])) {
                return sortedtargets[0];
            }
        }
    }
    return undefined;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfe6
// Size: 0xc2
function targetlead_vehiclelocksighttest(target) {
    eyepos = self geteye();
    center = target getpointinbounds(0, 0, 0);
    passed = sighttracepassed(eyepos, center, 0, target);
    /#
        function_7db309b40a632139(eyepos, center, passed);
    #/
    if (passed) {
        return true;
    }
    front = target getpointinbounds(1, 0, 0);
    passed = sighttracepassed(eyepos, front, 0, target);
    /#
        function_7db309b40a632139(eyepos, front, passed);
    #/
    if (passed) {
        return true;
    }
    back = target getpointinbounds(-1, 0, 0);
    passed = sighttracepassed(eyepos, back, 0, target);
    /#
        function_7db309b40a632139(eyepos, back, passed);
    #/
    if (passed) {
        return true;
    }
    return false;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b0
// Size: 0x8f
function targetlead_softsighttest(targetent) {
    if (targetlead_vehiclelocksighttest(targetent)) {
        self.targetlead.lostsightlinetime = 0;
        return true;
    }
    if (self.targetlead.lostsightlinetime == 0) {
        self.targetlead.lostsightlinetime = gettime();
    }
    timepassed = gettime() - self.targetlead.lostsightlinetime;
    if (timepassed >= 500) {
        return false;
    }
    return true;
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1147
// Size: 0x5f
function targetlead_airburstholdthink() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("stop_airburst_think");
    projectile = self waittill("missile_fire");
    if (isdefined(self.targetlead.target)) {
        projectile thread targetlead_airburstmissilethink(self.targetlead.target, self);
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11ad
// Size: 0x9c
function targetlead_airburstmissilethink(targetent, missileowner) {
    self endon("death");
    while (true) {
        if (!isdefined(targetent)) {
            iprintlnbold("targetEnt undefined");
            return;
        }
        disttotarget = distance(missileowner.origin, targetent.origin);
        var_9d67e835f1049ffc = distance(missileowner.origin, self.origin);
        if (var_9d67e835f1049ffc > disttotarget) {
            self detonate();
            iprintlnbold("explode");
        }
        wait(0.05);
    }
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1250
// Size: 0xb6
function targetlead_uimarkentities() {
    targetmarkergroupaddentity(self.targetlead.targetmarkergroup, self.targetlead.target);
    targetmarkergroupsetentitystate(self.targetlead.targetmarkergroup, self.targetlead.target, 1);
    targetmarkergroupaddentity(self.targetlead.targetmarkergroup, self.targetlead.leadpositionent);
    targetmarkergroupsetentitystate(self.targetlead.targetmarkergroup, self.targetlead.leadpositionent, 0);
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130d
// Size: 0x5b
function targetlead_uiunmarkentities() {
    targetmarkergroupremoveentity(self.targetlead.targetmarkergroup, self.targetlead.target);
    targetmarkergroupremoveentity(self.targetlead.targetmarkergroup, self.targetlead.leadpositionent);
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x136f
// Size: 0x2d
function function_7ea27fe25f2f18e5(text) {
    /#
        if (getdvar(@"hash_22ff48dd25613942") == "<unknown string>") {
            iprintln(text);
        }
    #/
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13a3
// Size: 0xe7
function function_6eee6cec92ff2a91(point, color, radius) {
    /#
        if (getdvar(@"hash_b56d344ee60e317f") != "<unknown string>") {
            return;
        }
        if (isdefined(radius)) {
            line(point + (radius, 0, 0), point - (radius, 0, 0), color);
            line(point + (0, radius, 0), point - (0, radius, 0), color);
            line(point + (0, 0, radius), point - (0, 0, radius), color);
            return;
        }
        line(point + (10, 0, 0), point - (10, 0, 0), color);
        line(point + (0, 10, 0), point - (0, 10, 0), color);
        line(point + (0, 0, 10), point - (0, 0, 10), color);
    #/
}

// Namespace namespace_56362014e0153c0e / scripts/mp/launcher_target_lead
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1491
// Size: 0x88
function function_7db309b40a632139(start, end, passed) {
    /#
        if (getdvar(@"hash_b56d344ee60e317f") != "<unknown string>") {
            return;
        }
        if (passed) {
            color = (0.3, 1, 0.3);
        } else {
            color = (1, 0.2, 0.2);
        }
        my_offset = (0, 0, 5);
        line(start + my_offset, end, color);
    #/
}

