// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace namespace_25f632c5311f7107;

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5
// Size: 0xa
function initmissilelauncherusage() {
    resetmissilelaunchertargets();
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x306
// Size: 0x2b
function resetmissilelaunchertargets() {
    self.missilelauncherstage = undefined;
    self.missilelaunchertarget = undefined;
    self.missilelauncherlockstarttime = undefined;
    self.missilelauncherlostsightlinetime = undefined;
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338
// Size: 0x77
function resetmissilelauncherlocking() {
    if (!isdefined(self.missilelauncheruseentered)) {
        return;
    }
    self.missilelauncheruseentered = undefined;
    self notify("stop_javelin_locking_feedback");
    self notify("stop_javelin_locked_feedback");
    self notify("missileLauncher_lock_lost");
    self weaponlockfree();
    self stoplocalsound("maaws_reticle_tracking");
    self stoplocalsound("maaws_reticle_locked");
    if (isdefined(self.missilelaunchertarget)) {
        removelockedon(self.missilelaunchertarget, self);
    }
    resetmissilelaunchertargets();
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6
// Size: 0x32
function resetmissilelauncherlockingondeath() {
    self endon("disconnect");
    self notify("ResetMissileLauncherLockingOnDeath");
    self endon("ResetMissileLauncherLockingOnDeath");
    self endon("end_launcher");
    for (;;) {
        self waittill("death");
        resetmissilelauncherlocking();
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef
// Size: 0xea
function loopmissilelauncherlockingfeedback() {
    self endon("death_or_disconnect");
    self endon("stop_javelin_locking_feedback");
    for (;;) {
        for (;;) {
            if (isdefined(level.chopper) && isdefined(level.chopper.gunner) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.chopper.gunner) {
                level.gunshipplayer playlocalsound("maaws_incoming_lp");
            }
            if (isdefined(level.gunshipplayer) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.gunship.planemodel) {
                level.gunshipplayer playlocalsound("maaws_incoming_lp");
            }
            self playlocalsound("maaws_reticle_tracking");
            self playrumbleonentity("ac130_25mm_fire");
        }
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e0
// Size: 0xea
function loopmissilelauncherlockedfeedback() {
    self endon("death_or_disconnect");
    self endon("stop_javelin_locked_feedback");
    self playlocalsound("maaws_reticle_locked");
    for (;;) {
        for (;;) {
            if (isdefined(level.chopper) && isdefined(level.chopper.gunner) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.chopper.gunner) {
                level.gunshipplayer playlocalsound("maaws_incoming_lp");
            }
            if (isdefined(level.gunshipplayer) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.gunship.planemodel) {
                level.gunshipplayer playlocalsound("maaws_incoming_lp");
            }
            self playrumbleonentity("ac130_25mm_fire");
        }
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d1
// Size: 0x78
function softsighttest(var_1fe8eeb95943f79f) {
    lost_sight_limit = 500;
    if (var_1fe8eeb95943f79f stingtargstruct_isinlos()) {
        self.missilelauncherlostsightlinetime = 0;
        return 1;
    }
    if (self.missilelauncherlostsightlinetime == 0) {
        self.missilelauncherlostsightlinetime = gettime();
    }
    timepassed = gettime() - self.missilelauncherlostsightlinetime;
    if (timepassed >= lost_sight_limit) {
        resetmissilelauncherlocking();
        return 0;
    }
    return 1;
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0x3df
function missilelauncherusage() {
    var_db87e220986304f4 = getdvarint(@"hash_eb7d16d9fa10a208", 625000000);
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    if (!namespace_d325722f2754c2c4::function_acc627f597d5b2cf()) {
        return;
    }
    if (self playerads() < 0.95) {
        resetmissilelauncherlocking();
        return;
    }
    self.missilelauncheruseentered = 1;
    if (!isdefined(self.missilelauncherstage)) {
        self.missilelauncherstage = 0;
    }
    /#
        function_5875284c0e0f1e40(self.missilelaunchertarget);
    #/
    if (self.missilelauncherstage == 0) {
        targets = namespace_3bbb5a98b932c46f::lockonlaunchers_gettargetarray(0);
        if (targets.size == 0) {
            return;
        }
        targets = sortbydistance(targets, self.origin);
        var_1fe8eeb95943f79f = undefined;
        var_c7f50dd357b9cdcf = 0;
        foreach (target in targets) {
            if (!isdefined(target)) {
                continue;
            }
            var_1fe8eeb95943f79f = stingtargstruct_create(self, target);
            var_1fe8eeb95943f79f stingtargstruct_getoffsets();
            var_1fe8eeb95943f79f stingtargstruct_getorigins();
            var_1fe8eeb95943f79f stingtargstruct_getinreticle();
            if (var_1fe8eeb95943f79f stingtargstruct_isinreticle()) {
                if (distancesquared(target.origin, self.origin) > var_db87e220986304f4) {
                    break;
                }
                var_c7f50dd357b9cdcf = 1;
                break;
            }
        }
        if (!var_c7f50dd357b9cdcf) {
            return;
        }
        var_1fe8eeb95943f79f stingtargstruct_getinlos();
        if (!var_1fe8eeb95943f79f stingtargstruct_isinlos()) {
            return;
        }
        self.missilelaunchertarget = var_1fe8eeb95943f79f.target;
        self.missilelauncherlockstarttime = gettime();
        self.missilelauncherstage = 1;
        self.missilelauncherlostsightlinetime = 0;
        if (isdefined(self.missilelaunchertarget)) {
            addlockedon(self.missilelaunchertarget, self);
        }
        thread loopmissilelauncherlockingfeedback();
    }
    if (self.missilelauncherstage == 1) {
        if (!isdefined(self.missilelaunchertarget)) {
            resetmissilelauncherlocking();
            return;
        }
        if (!var_e688b198aa9a4b3f && self.missilelaunchertarget namespace_1f188a13f7e79610::isvehicle() && namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(self.missilelaunchertarget, self)) {
            resetmissilelauncherlocking();
            return;
        }
        var_1fe8eeb95943f79f = stingtargstruct_create(self, self.missilelaunchertarget);
        var_1fe8eeb95943f79f stingtargstruct_getoffsets();
        var_1fe8eeb95943f79f stingtargstruct_getorigins();
        var_1fe8eeb95943f79f stingtargstruct_getinreticle();
        if (!var_1fe8eeb95943f79f stingtargstruct_isinreticle()) {
            resetmissilelauncherlocking();
            return;
        }
        var_1fe8eeb95943f79f stingtargstruct_getinlos();
        if (!softsighttest(var_1fe8eeb95943f79f)) {
            return;
        }
        timepassed = gettime() - self.missilelauncherlockstarttime;
        if (_hasperk("specialty_fasterlockon")) {
            if (timepassed < 250) {
                return;
            }
        } else if (timepassed < 500) {
            return;
        }
        self notify("stop_javelin_locking_feedback");
        thread loopmissilelauncherlockedfeedback();
        offset = undefined;
        missilelauncher_finalizelock(var_1fe8eeb95943f79f);
        self.missilelauncherstage = 2;
    }
    if (self.missilelauncherstage == 2) {
        if (!isdefined(self.missilelaunchertarget)) {
            resetmissilelauncherlocking();
            return;
        }
        if (!var_e688b198aa9a4b3f && self.missilelaunchertarget namespace_1f188a13f7e79610::isvehicle() && namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(self.missilelaunchertarget, self)) {
            resetmissilelauncherlocking();
            return;
        }
        var_1fe8eeb95943f79f = stingtargstruct_create(self, self.missilelaunchertarget);
        var_1fe8eeb95943f79f stingtargstruct_getoffsets();
        var_1fe8eeb95943f79f stingtargstruct_getorigins();
        var_1fe8eeb95943f79f stingtargstruct_getinreticle();
        var_1fe8eeb95943f79f stingtargstruct_getinlos();
        if (!softsighttest(var_1fe8eeb95943f79f)) {
            return;
        } else {
            missilelauncher_finalizelock(var_1fe8eeb95943f79f);
        }
        if (!var_1fe8eeb95943f79f stingtargstruct_isinreticle()) {
            resetmissilelauncherlocking();
            return;
        }
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x3a
function missilelauncherusageloop() {
    if (!isplayer(self)) {
        return;
    }
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    thread resetmissilelauncherlockingondeath();
    for (;;) {
        wait(0.05);
        missilelauncherusage();
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa78
// Size: 0xfb
function missilelauncher_finalizelock(var_1fe8eeb95943f79f) {
    offset = undefined;
    if (isdefined(var_1fe8eeb95943f79f.target) && isdefined(var_1fe8eeb95943f79f.target.vehiclename) && var_1fe8eeb95943f79f.target.vehiclename == "light_tank") {
        offset = (0, 0, 75);
    } else if (isdefined(var_1fe8eeb95943f79f.inlosid)) {
        offset = var_1fe8eeb95943f79f.offsets[var_1fe8eeb95943f79f.inlosid];
        offset = (offset[1], -1 * offset[0], offset[2]);
    } else {
        offset = (0, 0, 0);
    }
    if (!isent(self.missilelaunchertarget)) {
        self weaponlockfinalize(self.missilelaunchertarget.origin, offset);
        return;
    }
    self weaponlockfinalize(self.missilelaunchertarget, offset);
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7a
// Size: 0x8c
function stingtargstruct_create(player, target) {
    struct = spawnstruct();
    struct.player = player;
    struct.target = target;
    struct.offsets = [];
    struct.origins = [];
    struct.inreticledistssqr = [];
    struct.inreticlesortedids = [];
    struct.inlosid = undefined;
    struct.useoldlosverification = 1;
    return struct;
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0e
// Size: 0x689
function stingtargstruct_getoffsets() {
    self.offsets = [];
    if (ischoppergunner(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -50);
        self.useoldlosverification = 0;
    } else if (issupporthelo(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -100);
        self.useoldlosverification = 0;
    } else if (isgunship(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 50);
        self.useoldlosverification = 0;
    } else if (isclusterstrike(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 40);
        self.useoldlosverification = 0;
    } else if (isturret(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 42);
        self.offsets[self.offsets.size] = (0, 0, 5);
        self.useoldlosverification = 0;
    } else if (isradardrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 10);
        self.useoldlosverification = 0;
    } else if (isassaultdrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 10);
        self.useoldlosverification = 0;
    } else if (isscramblerdrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 15);
        self.useoldlosverification = 0;
    } else if (isradarhelicopter(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -30);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && self.target.vehiclename == "light_tank") {
        self.offsets[self.offsets.size] = (0, 0, 72);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && self.target.vehiclename == "apc_russian") {
        self.offsets[self.offsets.size] = (0, 0, 60);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "cargo_truck" || self.target.vehiclename == "cargo_truck_mg")) {
        self.offsets[self.offsets.size] = (0, 0, 60);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && self.target.vehiclename == "large_transport") {
        self.offsets[self.offsets.size] = (0, 0, 65);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && self.target.vehiclename == "medium_transport") {
        self.offsets[self.offsets.size] = (0, 0, 60);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "pickup_truck" || self.target.vehiclename == "technical")) {
        self.offsets[self.offsets.size] = (0, 0, 55);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "jeep" || self.target.vehiclename == "tac_rover")) {
        self.offsets[self.offsets.size] = (0, 0, 50);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "veh9_rhib" || self.target.vehiclename == "veh9_rhib_hsk")) {
        self.offsets[self.offsets.size] = (0, 0, 20);
        self.useoldlosverification = 0;
    } else if (isdefined(self.target.vehiclename) && self.target.vehiclename == "loot_chopper") {
        self.offsets[self.offsets.size] = (0, 0, -100);
        self.useoldlosverification = 0;
    } else {
        self.offsets[self.offsets.size] = (0, 0, 0);
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129e
// Size: 0xcb
function stingtargstruct_getorigins() {
    origin = self.target.origin;
    angles = self.target.angles;
    forward = anglestoforward(angles);
    right = anglestoright(angles);
    up = anglestoup(angles);
    for (i = 0; i < self.offsets.size; i++) {
        offset = self.offsets[i];
        self.origins[i] = origin + right * offset[0] + forward * offset[1] + up * offset[2];
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1370
// Size: 0x1b4
function stingtargstruct_getinreticle() {
    foreach (origin in self.origins) {
        for (i = 0; i < self.origins.size; i++) {
            screenpos = self.player worldpointtoscreenpos(self.origins[i], 65);
            if (isdefined(screenpos)) {
                distsqr = length2dsquared(screenpos);
                if (distsqr <= 576) {
                    self.inreticlesortedids[self.inreticlesortedids.size] = i;
                    self.inreticledistssqr[i] = distsqr;
                }
            }
        }
    }
    if (self.inreticlesortedids.size > 1) {
        for (i = 0; i < self.inreticlesortedids.size; i++) {
            for (j = i + 1; j < self.inreticlesortedids.size; j++) {
                var_766150b8375aff90 = self.inreticlesortedids[i];
                var_a1a802f9a569b2f7 = self.inreticlesortedids[j];
                var_8eba9ec305d4a611 = self.inreticledistssqr[var_766150b8375aff90];
                var_cf5f902786383f74 = self.inreticledistssqr[var_a1a802f9a569b2f7];
                if (var_cf5f902786383f74 < var_8eba9ec305d4a611) {
                    tempid = var_766150b8375aff90;
                    self.inreticlesortedids[i] = var_a1a802f9a569b2f7;
                    self.inreticlesortedids[j] = tempid;
                }
            }
        }
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152b
// Size: 0x457
function stingtargstruct_getinlos() {
    caststart = self.player geteye();
    contents = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_water", 2:"physicscontents_item", 3:"physicscontents_playernosight"]);
    if (!isent(self.target)) {
        var_7c44f2c83cc7cf1e = [0:self.player];
        for (i = 0; i < self.inreticlesortedids.size; i++) {
            id = self.inreticlesortedids[i];
            castend = self.origins[id];
            var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, var_7c44f2c83cc7cf1e, 0, "physicsquery_closest", 1);
            if (!isdefined(var_e021c2744cc7ed68) || var_e021c2744cc7ed68.size == 0) {
                self.inlosid = id;
                return;
            }
        }
        return;
    }
    var_7c44f2c83cc7cf1e = [0:self.player, 1:self.target];
    var_d4a24e02d124ac38 = self.target getlinkedchildren();
    if (isdefined(var_d4a24e02d124ac38) && var_d4a24e02d124ac38.size > 0) {
        var_7c44f2c83cc7cf1e = array_combine(var_7c44f2c83cc7cf1e, var_d4a24e02d124ac38);
    }
    if (!self.useoldlosverification) {
        for (i = 0; i < self.inreticlesortedids.size; i++) {
            id = self.inreticlesortedids[i];
            castend = self.origins[id];
            var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, var_7c44f2c83cc7cf1e, 0, "physicsquery_closest", 1);
            if (!isdefined(var_e021c2744cc7ed68) || var_e021c2744cc7ed68.size == 0) {
                self.inlosid = id;
                return;
            }
        }
    } else {
        top = self.target getpointinbounds(0, 0, 1);
        trace = ray_trace(caststart, top, var_7c44f2c83cc7cf1e, contents, 0);
        /#
            if (getdvar(@"hash_b56d344ee60e317f") == "physicscontents_water") {
                playerangles = self.player getplayerangles();
                forward = anglestoforward(playerangles);
                left = anglestoleft(playerangles);
                hitpos = trace["physicscontents_playernosight"];
                sphere(hitpos, 10, (1, 0, 0), 0, 1);
                sphere(hitpos, 10, (0, 1, 0), 1, 1);
                var_29f55613421c5159 = distance(caststart, hitpos);
                print3d(hitpos + left * -20, "<unknown string>" + var_29f55613421c5159, (1, 1, 1), 1, 1, 1);
                var_ad791987651b3ba3 = self.player.origin;
                var_633eaa5f21008b6f = var_ad791987651b3ba3 + left * 50;
                line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, 1, 1);
                var_3eacd3938ccd4b6c = var_ad791987651b3ba3 + left * -50;
                line(var_3eacd3938ccd4b6c, hitpos, (0, 1, 0), 1, 1, 1);
                var_633eaa5f21008b6f = var_633eaa5f21008b6f + (0, 0, 100);
                line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, 1, 1);
                var_3eacd3938ccd4b6c = var_3eacd3938ccd4b6c + (0, 0, 100);
                line(var_3eacd3938ccd4b6c, hitpos, (0, 1, 0), 1, 1, 1);
            }
        #/
        if (trace["fraction"] == 1) {
            self.inlosid = 0;
            return;
        }
        front = self.target getpointinbounds(1, 0, 0);
        trace = ray_trace(caststart, front, var_7c44f2c83cc7cf1e, contents, 0);
        if (trace["fraction"] == 1) {
            self.inlosid = 0;
            return;
        }
        back = self.target getpointinbounds(-1, 0, 0);
        trace = ray_trace(caststart, back, var_7c44f2c83cc7cf1e, contents, 0);
        if (trace["fraction"] == 1) {
            self.inlosid = 0;
            return;
        }
    }
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1989
// Size: 0xf
function stingtargstruct_isinreticle() {
    return self.inreticlesortedids.size > 0;
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a0
// Size: 0xd
function stingtargstruct_isinlos() {
    return isdefined(self.inlosid);
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b5
// Size: 0xe4
function debug_init() {
    /#
        setdevdvarifuninitialized(@"hash_ad918199a0825d3a", 125);
        setdevdvarifuninitialized(@"hash_84a8019a3bb27871", 250);
        setdevdvarifuninitialized(@"hash_ffbdbf4d8f631e47", 125);
        setdevdvarifuninitialized(@"hash_84a8059a3bb2813d", 425);
        setdevdvarifuninitialized(@"hash_1578b7af746ab2fb", 125);
        setdevdvarifuninitialized(@"hash_6fc78931494d8833", 250);
        setdevdvarifuninitialized(@"hash_60e1bbd430b85fe9", 140);
        setdevdvarifuninitialized(@"hash_fead31902c16c7ef", 215);
        setdevdvarifuninitialized(@"hash_9b2345c5373f7e68", 30);
        setdevdvarifuninitialized(@"hash_a6d283ccfd72e0d2", 5);
        setdevdvarifuninitialized(@"hash_c3840a33843aa1f2", 15);
        setdevdvarifuninitialized(@"hash_5a2bc3bd648b860c", 42);
        setdevdvarifuninitialized(@"hash_9bb2d0feba0e1fde", 5);
    #/
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa0
// Size: 0x269
function function_b787474070c5281b(jackal) {
    /#
        jackal endon("<unknown string>");
        var_558f2ec8e231df5d = 50;
        while (1) {
            forward = anglestoforward(jackal.angles);
            right = anglestoright(jackal.angles);
            up = anglestoup(jackal.angles);
            origin = jackal.origin;
            centerpos = jackal.origin;
            centerpos = centerpos + up * getdvarfloat(@"hash_ad918199a0825d3a", 0);
            var_4d866ea464e2c2d6 = origin;
            var_4d866ea464e2c2d6 = var_4d866ea464e2c2d6 + forward * getdvarfloat(@"hash_84a8019a3bb27871", 0);
            var_4d866ea464e2c2d6 = var_4d866ea464e2c2d6 + up * getdvarfloat(@"hash_ffbdbf4d8f631e47", 0);
            var_1c3718b75def5ea4 = origin;
            var_1c3718b75def5ea4 = var_1c3718b75def5ea4 + -1 * forward * getdvarfloat(@"hash_84a8059a3bb2813d", 0);
            var_1c3718b75def5ea4 = var_1c3718b75def5ea4 + up * getdvarfloat(@"hash_1578b7af746ab2fb", 0);
            var_1a8097f1a065c786 = origin;
            var_1a8097f1a065c786 = var_1a8097f1a065c786 + -1 * right * getdvarfloat(@"hash_6fc78931494d8833", 0);
            var_1a8097f1a065c786 = var_1a8097f1a065c786 + -1 * forward * getdvarfloat(@"hash_fead31902c16c7ef", 0);
            var_1a8097f1a065c786 = var_1a8097f1a065c786 + up * getdvarfloat(@"hash_60e1bbd430b85fe9", 0);
            var_1a2a7c570678a79d = origin;
            var_1a2a7c570678a79d = var_1a2a7c570678a79d + right * getdvarfloat(@"hash_6fc78931494d8833", 0);
            var_1a2a7c570678a79d = var_1a2a7c570678a79d + -1 * forward * getdvarfloat(@"hash_fead31902c16c7ef", 0);
            var_1a2a7c570678a79d = var_1a2a7c570678a79d + up * getdvarfloat(@"hash_60e1bbd430b85fe9", 0);
            thread drawsphere(centerpos, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            thread drawsphere(var_4d866ea464e2c2d6, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            thread drawsphere(var_1c3718b75def5ea4, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            thread drawsphere(var_1a8097f1a065c786, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            thread drawsphere(var_1a2a7c570678a79d, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            waitframe();
        }
    #/
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d10
// Size: 0xd7
function function_86fc943ed3331734(supertrophy) {
    /#
        supertrophy endon("<unknown string>");
        var_558f2ec8e231df5d = 4;
        while (1) {
            up = anglestoup(supertrophy.angles);
            origin = supertrophy.origin;
            toppos = origin;
            toppos = toppos + up * getdvarfloat(@"hash_9b2345c5373f7e68", 0);
            botpos = origin;
            botpos = botpos + up * getdvarfloat(@"hash_a6d283ccfd72e0d2", 0);
            thread drawsphere(toppos, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            thread drawsphere(botpos, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            waitframe();
        }
    #/
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dee
// Size: 0x9a
function function_5942767696e14755(var_c05d10a6ec10de79) {
    /#
        var_c05d10a6ec10de79 endon("<unknown string>");
        var_558f2ec8e231df5d = 4;
        while (1) {
            up = anglestoup(var_c05d10a6ec10de79.angles);
            origin = var_c05d10a6ec10de79.origin;
            centerpos = origin;
            centerpos = centerpos + up * getdvarfloat(@"hash_c3840a33843aa1f2", 0);
            thread drawsphere(centerpos, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            waitframe();
        }
    #/
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8f
// Size: 0xd7
function function_7ea2aeeed11a82c8(var_9ca80e18adcba052) {
    /#
        var_9ca80e18adcba052 endon("<unknown string>");
        var_558f2ec8e231df5d = 4;
        while (1) {
            up = anglestoup(var_9ca80e18adcba052.angles);
            origin = var_9ca80e18adcba052.origin;
            toppos = origin;
            toppos = toppos + up * getdvarfloat(@"hash_5a2bc3bd648b860c", 0);
            botpos = origin;
            botpos = botpos + up * getdvarfloat(@"hash_9bb2d0feba0e1fde", 0);
            thread drawsphere(toppos, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            thread drawsphere(botpos, var_558f2ec8e231df5d, 0.05, (1, 0, 0));
            waitframe();
        }
    #/
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f6d
// Size: 0x73
function function_5875284c0e0f1e40(target) {
    /#
        if (getdvar(@"hash_b56d344ee60e317f") != "<unknown string>") {
            return;
        }
        if (!isdefined(target)) {
            return;
        }
        org = target.origin;
        function_5c89b31e55a970e3(org);
        org = target getpointinbounds(1, 0, 0);
        function_5c89b31e55a970e3(org);
        org = target getpointinbounds(-1, 0, 0);
        function_5c89b31e55a970e3(org);
    #/
}

// Namespace namespace_25f632c5311f7107/namespace_64f4de5bc294e756
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe7
// Size: 0x7b
function function_5c89b31e55a970e3(point) {
    /#
        line(point + (10, 0, 0), point - (10, 0, 0));
        line(point + (0, 10, 0), point - (0, 10, 0));
        line(point + (0, 0, 10), point - (0, 0, 10));
    #/
}

