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

#namespace missilelauncher;

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5
// Size: 0x9
function initmissilelauncherusage() {
    resetmissilelaunchertargets();
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x306
// Size: 0x2a
function resetmissilelaunchertargets() {
    self.missilelauncherstage = undefined;
    self.missilelaunchertarget = undefined;
    self.missilelauncherlockstarttime = undefined;
    self.missilelauncherlostsightlinetime = undefined;
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338
// Size: 0x76
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

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6
// Size: 0x31
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

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef
// Size: 0xe9
function loopmissilelauncherlockingfeedback() {
    self endon("death_or_disconnect");
    self endon("stop_javelin_locking_feedback");
    for (;;) {
        if (isdefined(level.chopper) && isdefined(level.chopper.gunner) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.chopper.gunner) {
            level.gunshipplayer playlocalsound("maaws_incoming_lp");
        }
        if (isdefined(level.gunshipplayer) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.gunship.planemodel) {
            level.gunshipplayer playlocalsound("maaws_incoming_lp");
        }
        self playlocalsound("maaws_reticle_tracking");
        self playrumbleonentity("ac130_25mm_fire");
        wait 0.6;
    }
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e0
// Size: 0xe9
function loopmissilelauncherlockedfeedback() {
    self endon("death_or_disconnect");
    self endon("stop_javelin_locked_feedback");
    self playlocalsound("maaws_reticle_locked");
    for (;;) {
        if (isdefined(level.chopper) && isdefined(level.chopper.gunner) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.chopper.gunner) {
            level.gunshipplayer playlocalsound("maaws_incoming_lp");
        }
        if (isdefined(level.gunshipplayer) && isdefined(self.missilelaunchertarget) && self.missilelaunchertarget == level.gunship.planemodel) {
            level.gunshipplayer playlocalsound("maaws_incoming_lp");
        }
        self playrumbleonentity("ac130_25mm_fire");
        wait 0.25;
    }
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d1
// Size: 0x77
function softsighttest(var_1fe8eeb95943f79f) {
    lost_sight_limit = 500;
    if (var_1fe8eeb95943f79f stingtargstruct_isinlos()) {
        self.missilelauncherlostsightlinetime = 0;
        return true;
    }
    if (self.missilelauncherlostsightlinetime == 0) {
        self.missilelauncherlostsightlinetime = gettime();
    }
    timepassed = gettime() - self.missilelauncherlostsightlinetime;
    if (timepassed >= lost_sight_limit) {
        resetmissilelauncherlocking();
        return false;
    }
    return true;
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0x3de
function missilelauncherusage() {
    var_db87e220986304f4 = getdvarint(@"hash_eb7d16d9fa10a208", 625000000);
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    if (!scripts\cp_mp\utility\weapon_utility::function_acc627f597d5b2cf()) {
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
        targets = scripts\mp\weapons::lockonlaunchers_gettargetarray(0);
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
        if (!var_e688b198aa9a4b3f && self.missilelaunchertarget scripts\cp_mp\vehicles\vehicle::isvehicle() && scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoplayer(self.missilelaunchertarget, self)) {
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
        if (!var_e688b198aa9a4b3f && self.missilelaunchertarget scripts\cp_mp\vehicles\vehicle::isvehicle() && scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoplayer(self.missilelaunchertarget, self)) {
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

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x39
function missilelauncherusageloop() {
    if (!isplayer(self)) {
        return;
    }
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    thread resetmissilelauncherlockingondeath();
    for (;;) {
        wait 0.05;
        missilelauncherusage();
    }
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa78
// Size: 0xfa
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

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7a
// Size: 0x8b
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

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0e
// Size: 0x688
function stingtargstruct_getoffsets() {
    self.offsets = [];
    if (ischoppergunner(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -50);
        self.useoldlosverification = 0;
        return;
    }
    if (issupporthelo(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -100);
        self.useoldlosverification = 0;
        return;
    }
    if (isgunship(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 50);
        self.useoldlosverification = 0;
        return;
    }
    if (isclusterstrike(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 40);
        self.useoldlosverification = 0;
        return;
    }
    if (isturret(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 42);
        self.offsets[self.offsets.size] = (0, 0, 5);
        self.useoldlosverification = 0;
        return;
    }
    if (isradardrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 10);
        self.useoldlosverification = 0;
        return;
    }
    if (isassaultdrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 10);
        self.useoldlosverification = 0;
        return;
    }
    if (isscramblerdrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 15);
        self.useoldlosverification = 0;
        return;
    }
    if (isradarhelicopter(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -30);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && self.target.vehiclename == "light_tank") {
        self.offsets[self.offsets.size] = (0, 0, 72);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && self.target.vehiclename == "apc_russian") {
        self.offsets[self.offsets.size] = (0, 0, 60);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "cargo_truck" || self.target.vehiclename == "cargo_truck_mg")) {
        self.offsets[self.offsets.size] = (0, 0, 60);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && self.target.vehiclename == "large_transport") {
        self.offsets[self.offsets.size] = (0, 0, 65);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && self.target.vehiclename == "medium_transport") {
        self.offsets[self.offsets.size] = (0, 0, 60);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "pickup_truck" || self.target.vehiclename == "technical")) {
        self.offsets[self.offsets.size] = (0, 0, 55);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "jeep" || self.target.vehiclename == "tac_rover")) {
        self.offsets[self.offsets.size] = (0, 0, 50);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && (self.target.vehiclename == "veh9_rhib" || self.target.vehiclename == "veh9_rhib_hsk")) {
        self.offsets[self.offsets.size] = (0, 0, 20);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && self.target.vehiclename == "loot_chopper") {
        self.offsets[self.offsets.size] = (0, 0, -100);
        self.useoldlosverification = 0;
        return;
    }
    self.offsets[self.offsets.size] = (0, 0, 0);
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129e
// Size: 0xca
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

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1370
// Size: 0x1b3
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
                i_id = self.inreticlesortedids[i];
                j_id = self.inreticlesortedids[j];
                var_8eba9ec305d4a611 = self.inreticledistssqr[i_id];
                var_cf5f902786383f74 = self.inreticledistssqr[j_id];
                if (var_cf5f902786383f74 < var_8eba9ec305d4a611) {
                    tempid = i_id;
                    self.inreticlesortedids[i] = j_id;
                    self.inreticlesortedids[j] = tempid;
                }
            }
        }
    }
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152b
// Size: 0x456
function stingtargstruct_getinlos() {
    caststart = self.player geteye();
    contents = physics_createcontents(["physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_playernosight"]);
    if (!isent(self.target)) {
        var_7c44f2c83cc7cf1e = [self.player];
        for (i = 0; i < self.inreticlesortedids.size; i++) {
            id = self.inreticlesortedids[i];
            castend = self.origins[id];
            castresults = physics_raycast(caststart, castend, contents, var_7c44f2c83cc7cf1e, 0, "physicsquery_closest", 1);
            if (!isdefined(castresults) || castresults.size == 0) {
                self.inlosid = id;
                return;
            }
        }
        return;
    }
    var_7c44f2c83cc7cf1e = [self.player, self.target];
    var_d4a24e02d124ac38 = self.target getlinkedchildren();
    if (isdefined(var_d4a24e02d124ac38) && var_d4a24e02d124ac38.size > 0) {
        var_7c44f2c83cc7cf1e = array_combine(var_7c44f2c83cc7cf1e, var_d4a24e02d124ac38);
    }
    if (!self.useoldlosverification) {
        for (i = 0; i < self.inreticlesortedids.size; i++) {
            id = self.inreticlesortedids[i];
            castend = self.origins[id];
            castresults = physics_raycast(caststart, castend, contents, var_7c44f2c83cc7cf1e, 0, "physicsquery_closest", 1);
            if (!isdefined(castresults) || castresults.size == 0) {
                self.inlosid = id;
                return;
            }
        }
        return;
    }
    top = self.target getpointinbounds(0, 0, 1);
    trace = ray_trace(caststart, top, var_7c44f2c83cc7cf1e, contents, 0);
    /#
        if (getdvar(@"hash_b56d344ee60e317f") == "<dev string:x1c>") {
            playerangles = self.player getplayerangles();
            forward = anglestoforward(playerangles);
            left = anglestoleft(playerangles);
            hitpos = trace["<dev string:x1e>"];
            sphere(hitpos, 10, (1, 0, 0), 0, 1);
            sphere(hitpos, 10, (0, 1, 0), 1, 1);
            var_29f55613421c5159 = distance(caststart, hitpos);
            print3d(hitpos + left * -20, "<dev string:x27>" + var_29f55613421c5159, (1, 1, 1), 1, 1, 1);
            var_ad791987651b3ba3 = self.player.origin;
            var_633eaa5f21008b6f = var_ad791987651b3ba3 + left * 50;
            line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, 1, 1);
            var_3eacd3938ccd4b6c = var_ad791987651b3ba3 + left * -50;
            line(var_3eacd3938ccd4b6c, hitpos, (0, 1, 0), 1, 1, 1);
            var_633eaa5f21008b6f += (0, 0, 100);
            line(var_633eaa5f21008b6f, hitpos, (0, 1, 0), 1, 1, 1);
            var_3eacd3938ccd4b6c += (0, 0, 100);
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

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1989
// Size: 0xe
function stingtargstruct_isinreticle() {
    return self.inreticlesortedids.size > 0;
}

// Namespace missilelauncher / scripts\mp\missilelauncher
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a0
// Size: 0xc
function stingtargstruct_isinlos() {
    return isdefined(self.inlosid);
}

/#

    // Namespace missilelauncher / scripts\mp\missilelauncher
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x19b5
    // Size: 0xe3
    function debug_init() {
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
    }

    // Namespace missilelauncher / scripts\mp\missilelauncher
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1aa0
    // Size: 0x268
    function function_b787474070c5281b(jackal) {
        jackal endon("<dev string:x28>");
        spheresize = 50;
        while (true) {
            forward = anglestoforward(jackal.angles);
            right = anglestoright(jackal.angles);
            up = anglestoup(jackal.angles);
            origin = jackal.origin;
            centerpos = jackal.origin;
            centerpos += up * getdvarfloat(@"hash_ad918199a0825d3a", 0);
            frontpos = origin;
            frontpos += forward * getdvarfloat(@"hash_84a8019a3bb27871", 0);
            frontpos += up * getdvarfloat(@"hash_ffbdbf4d8f631e47", 0);
            backpos = origin;
            backpos += -1 * forward * getdvarfloat(@"hash_84a8059a3bb2813d", 0);
            backpos += up * getdvarfloat(@"hash_1578b7af746ab2fb", 0);
            leftpos = origin;
            leftpos += -1 * right * getdvarfloat(@"hash_6fc78931494d8833", 0);
            leftpos += -1 * forward * getdvarfloat(@"hash_fead31902c16c7ef", 0);
            leftpos += up * getdvarfloat(@"hash_60e1bbd430b85fe9", 0);
            rightpos = origin;
            rightpos += right * getdvarfloat(@"hash_6fc78931494d8833", 0);
            rightpos += -1 * forward * getdvarfloat(@"hash_fead31902c16c7ef", 0);
            rightpos += up * getdvarfloat(@"hash_60e1bbd430b85fe9", 0);
            thread drawsphere(centerpos, spheresize, 0.05, (1, 0, 0));
            thread drawsphere(frontpos, spheresize, 0.05, (1, 0, 0));
            thread drawsphere(backpos, spheresize, 0.05, (1, 0, 0));
            thread drawsphere(leftpos, spheresize, 0.05, (1, 0, 0));
            thread drawsphere(rightpos, spheresize, 0.05, (1, 0, 0));
            waitframe();
        }
    }

    // Namespace missilelauncher / scripts\mp\missilelauncher
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d10
    // Size: 0xd6
    function function_86fc943ed3331734(supertrophy) {
        supertrophy endon("<dev string:x28>");
        spheresize = 4;
        while (true) {
            up = anglestoup(supertrophy.angles);
            origin = supertrophy.origin;
            toppos = origin;
            toppos += up * getdvarfloat(@"hash_9b2345c5373f7e68", 0);
            botpos = origin;
            botpos += up * getdvarfloat(@"hash_a6d283ccfd72e0d2", 0);
            thread drawsphere(toppos, spheresize, 0.05, (1, 0, 0));
            thread drawsphere(botpos, spheresize, 0.05, (1, 0, 0));
            waitframe();
        }
    }

    // Namespace missilelauncher / scripts\mp\missilelauncher
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dee
    // Size: 0x99
    function function_5942767696e14755(microturret) {
        microturret endon("<dev string:x28>");
        spheresize = 4;
        while (true) {
            up = anglestoup(microturret.angles);
            origin = microturret.origin;
            centerpos = origin;
            centerpos += up * getdvarfloat(@"hash_c3840a33843aa1f2", 0);
            thread drawsphere(centerpos, spheresize, 0.05, (1, 0, 0));
            waitframe();
        }
    }

    // Namespace missilelauncher / scripts\mp\missilelauncher
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e8f
    // Size: 0xd6
    function function_7ea2aeeed11a82c8(shocksentry) {
        shocksentry endon("<dev string:x28>");
        spheresize = 4;
        while (true) {
            up = anglestoup(shocksentry.angles);
            origin = shocksentry.origin;
            toppos = origin;
            toppos += up * getdvarfloat(@"hash_5a2bc3bd648b860c", 0);
            botpos = origin;
            botpos += up * getdvarfloat(@"hash_9bb2d0feba0e1fde", 0);
            thread drawsphere(toppos, spheresize, 0.05, (1, 0, 0));
            thread drawsphere(botpos, spheresize, 0.05, (1, 0, 0));
            waitframe();
        }
    }

    // Namespace missilelauncher / scripts\mp\missilelauncher
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f6d
    // Size: 0x72
    function function_5875284c0e0f1e40(target) {
        if (getdvar(@"hash_b56d344ee60e317f") != "<dev string:x2e>") {
            return;
        }
        if (!isdefined(target)) {
            return;
        }
        org = target.origin;
        drawstar(org);
        org = target getpointinbounds(1, 0, 0);
        drawstar(org);
        org = target getpointinbounds(-1, 0, 0);
        drawstar(org);
    }

    // Namespace missilelauncher / scripts\mp\missilelauncher
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1fe7
    // Size: 0x7a
    function drawstar(point) {
        line(point + (10, 0, 0), point - (10, 0, 0));
        line(point + (0, 10, 0), point - (0, 10, 0));
        line(point + (0, 0, 10), point - (0, 0, 10));
    }

#/
