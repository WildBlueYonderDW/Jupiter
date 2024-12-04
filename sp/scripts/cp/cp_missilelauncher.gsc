#using script_74502a9e0ef1f19c;
#using scripts\common\utility;
#using scripts\cp\utility;
#using scripts\cp\utility\entity;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_27499dd1aeecef75;

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26d
// Size: 0x32
function initmissilelauncherusage() {
    self.missilelauncherstage = undefined;
    self.missilelaunchertarget = undefined;
    self.missilelauncherlockstarttime = undefined;
    self.missilelauncherlostsightlinetime = undefined;
    thread resetmissilelauncherlockingondeath();
}

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7
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
    initmissilelauncherusage();
}

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x325
// Size: 0x2a
function resetmissilelauncherlockingondeath() {
    self endon("disconnect");
    self notify("ResetMissileLauncherLockingOnDeath");
    self endon("ResetMissileLauncherLockingOnDeath");
    for (;;) {
        self waittill("death");
        resetmissilelauncherlocking();
    }
}

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x357
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x448
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x539
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b9
// Size: 0x397
function missilelauncherusage() {
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
    if (self.missilelauncherstage == 0) {
        targets = namespace_a0628d6954815ef8::lockonlaunchers_gettargetarray(0);
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
        self.missilelaunchertarget notify("lockon_evade");
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x958
// Size: 0x38
function missilelauncherusageloop() {
    if (!isplayer(self)) {
        return;
    }
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    initmissilelauncherusage();
    for (;;) {
        wait 0.05;
        missilelauncherusage();
    }
}

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x998
// Size: 0x73
function missilelauncher_finalizelock(var_1fe8eeb95943f79f) {
    offset = undefined;
    if (isdefined(var_1fe8eeb95943f79f.inlosid)) {
        offset = var_1fe8eeb95943f79f.offsets[var_1fe8eeb95943f79f.inlosid];
        offset = (offset[1], -1 * offset[0], offset[2]);
    } else {
        offset = (0, 0, 0);
    }
    self weaponlockfinalize(self.missilelaunchertarget, offset);
}

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa13
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa7
// Size: 0x2fc
function stingtargstruct_getoffsets() {
    self.offsets = [];
    if (scripts\cp\utility\entity::ischoppergunner(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -50);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::isbossheli(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -50);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::issupporthelo(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -100);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::isgunship(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 50);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::isclusterstrike(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 40);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::isturret(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 42);
        self.offsets[self.offsets.size] = (0, 0, 5);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::isradardrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 10);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::isscramblerdrone(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, 10);
        self.useoldlosverification = 0;
        return;
    }
    if (scripts\cp\utility\entity::isradarhelicopter(self.target)) {
        self.offsets[self.offsets.size] = (0, 0, -30);
        self.useoldlosverification = 0;
        return;
    }
    if (isdefined(self.target.vehiclename) && self.target.vehiclename == "light_tank") {
        self.offsets[self.offsets.size] = (0, 0, 72);
        self.useoldlosverification = 0;
        return;
    }
    self.offsets[self.offsets.size] = (0, 0, 0);
}

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdab
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7d
// Size: 0x1af
function stingtargstruct_getinreticle() {
    foreach (origin in self.origins) {
        for (i = 0; i < self.origins.size; i++) {
            screenpos = self.player worldpointtoscreenpos(self.origins[i], 65);
            if (isdefined(screenpos)) {
                distsqr = length2dsquared(screenpos);
                if (distsqr <= 7225) {
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1034
// Size: 0x223
function stingtargstruct_getinlos() {
    caststart = self.player geteye();
    contents = physics_createcontents(["physicscontents_missileclip", "physicscontents_glass", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item"]);
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

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125f
// Size: 0xe
function stingtargstruct_isinreticle() {
    return self.inreticlesortedids.size > 0;
}

// Namespace namespace_27499dd1aeecef75 / scripts\cp\cp_missilelauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1276
// Size: 0xc
function stingtargstruct_isinlos() {
    return isdefined(self.inlosid);
}

