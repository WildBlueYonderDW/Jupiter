// mwiii decomp prototype
#using script_3433ee6b63c7e243;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\gameskill.gsc;

#namespace track;

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f6
// Size: 0xfc
function track(asmname) {
    /#
        assertex(!isdefined(self.var_a709fbd9fea148f6), "Track service activated when a track service was already running");
    #/
    self.var_a709fbd9fea148f6 = asmname;
    var_a60d2ae5b60f0734 = asm_lookupanimfromaliasifexists("knobs", "aim_2");
    if (!isdefined(var_a60d2ae5b60f0734)) {
        return;
    }
    var_910177fe29603c10 = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "aim_2"));
    var_91017dfe29604942 = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "aim_4"));
    var_91017bfe296044dc = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "aim_6"));
    var_910181fe2960520e = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "aim_8"));
    trackinit(var_910177fe29603c10, var_91017dfe29604942, var_91017bfe296044dc, var_910181fe2960520e);
    thread trackloop(asmname);
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f9
// Size: 0x12e
function trackinit(aim_2, aim_4, aim_6, aim_8) {
    self.a.aimweight = 1;
    self.a.aimweight_start = 1;
    self.a.aimweight_end = 1;
    self.a.aimweight_transframes = 0;
    self.a.aimweight_t = 0;
    self.asm.track = spawnstruct();
    self.asm.track.aim_2_default = aim_2;
    self.asm.track.aim_4_default = aim_4;
    self.asm.track.aim_6_default = aim_6;
    self.asm.track.aim_8_default = aim_8;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42e
// Size: 0xb0
function function_6a59d21b0c6cf600() {
    /#
        self endon("<unknown string>");
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            if (isdefined(self.convergence) && isdefined(self.convergence.aim_pos)) {
                startpos = getlaserstartpoint();
                dir = vectornormalize(self.convergence.aim_pos - startpos);
                endpos = startpos + dir * 2048;
                line(startpos, endpos, (255, 0, 0), 1, 1);
            }
            wait(0.05);
        }
    #/
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e5
// Size: 0x2e
function sniperdeathcleanup() {
    self endon("stop_sniper");
    self waittill("death");
    if (isdefined(self.sniper_laser)) {
        self.sniper_laser delete();
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a
// Size: 0x7c
function sniperlaserhackstop() {
    if (isdefined(self.sniper_laser)) {
        self notify("stop_sniper");
        if (isdefined(self.fnlaseroff)) {
            self.sniper_laser [[ self.fnlaseroff ]]();
        }
        self.sniper_laser delete();
        self.sniper_laser = undefined;
        self.bhaslasertag = undefined;
        if (isdefined(self.fnsetlaserflag)) {
            self [[ self.fnsetlaserflag ]]("none");
        }
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59d
// Size: 0x44
function shoulduselasertag() {
    var_5c3f9357f11d2223 = getweaponbasename(self.weapon);
    switch (var_5c3f9357f11d2223) {
    case #"hash_8ecbf58c1c0044aa":
        return 1;
    default:
        break;
    }
    return 0;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e9
// Size: 0x8e
function getlaserstartpoint() {
    if (!isdefined(self.bhaslasertag)) {
        if (shoulduselasertag()) {
            var_f15b345c31b99e56 = self gettagorigin("tag_laser", 1);
            if (isdefined(var_f15b345c31b99e56)) {
                self.bhaslasertag = 1;
                return var_f15b345c31b99e56;
            }
        }
        self.bhaslasertag = 0;
    } else if (istrue(self.bhaslasertag)) {
        if (!shoulduselasertag()) {
            self.bhaslasertag = 0;
        }
    }
    if (self.bhaslasertag) {
        return self gettagorigin("tag_laser");
    }
    return self getmuzzlepos();
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f
// Size: 0x9
function getlaserdirection() {
    return self getmuzzledir();
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x690
// Size: 0x9
function getlaserangles() {
    return self getmuzzleangle();
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1
// Size: 0x23a
function sniperlaserhackstart() {
    if (isdefined(self.sniper_laser)) {
        return;
    }
    thread sniperdeathcleanup();
    var_3c0dbcd729e6d642 = getlaserstartpoint();
    self.sniper_laser = spawn("script_model", var_3c0dbcd729e6d642);
    self.sniper_laser setmodel("tag_laser");
    self.sniper_laser setmoverlaserweapon(self.weapon);
    self.sniper_laser setotherent(self);
    self.sniper_laser.origin = var_3c0dbcd729e6d642;
    if (!isdefined(self.var_d6c8cbe3184ccb69)) {
        self.var_d6c8cbe3184ccb69 = 0.996;
    }
    if (isdefined(self.fnsetlaserflag)) {
        self [[ self.fnsetlaserflag ]]("interpolate");
    }
    if (isdefined(self.fnlaseron)) {
        self.sniper_laser [[ self.fnlaseron ]]();
    }
    /#
        assert(isdefined(self.convergence));
    #/
    while (isalive(self) && isdefined(self.sniper_laser)) {
        if (isdefined(self.convergence) && isdefined(self.convergence.aim_pos)) {
            var_3c0dbcd729e6d642 = getlaserstartpoint();
            self.sniper_laser.origin = var_3c0dbcd729e6d642;
            desiredaimpos = self.convergence.aim_pos;
            var_d4c7b1e5457a2668 = vectornormalize(desiredaimpos - var_3c0dbcd729e6d642);
            var_8d02d1d6a93ea41f = getlaserdirection();
            var_d4c7b1e5457a2668 = vectornormalize((var_d4c7b1e5457a2668[0], var_d4c7b1e5457a2668[1], 0));
            var_8d02d1d6a93ea41f = vectornormalize((var_8d02d1d6a93ea41f[0], var_8d02d1d6a93ea41f[1], 0));
            dot = vectordot(var_d4c7b1e5457a2668, var_8d02d1d6a93ea41f);
            if (dot < self.var_d6c8cbe3184ccb69) {
                self.sniper_laser.angles = getlaserangles();
            } else {
                self.sniper_laser.angles = vectortoangles(self.convergence.aim_pos - self.sniper_laser.origin);
            }
        }
        waitframe();
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x20
function trackturnofflaser() {
    if (istrue(self.var_70beb323dd9e1ac5)) {
        return;
    }
    sniperlaserhackstop();
    self notify("sniper_laser_off");
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x2e
function trackturnonlaser() {
    if (istrue(self.var_70beb323dd9e1ac5)) {
        return;
    }
    if (!isdefined(self.sniper_laser)) {
        thread sniperlaserhackstart();
        self notify("sniper_laser_on");
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93e
// Size: 0x17
function clearconvergence() {
    self.convergence = undefined;
    self.var_3e580a3d5cd6664 = 0;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95c
// Size: 0x511
function resetconvergence(var_19935e0042fe0718, var_c5686a51213bf45e, var_6cba42b1ab91dc15) {
    if (!isdefined(self.convergence)) {
        self.convergence = spawnstruct();
        self.var_3e580a3d5cd6664 = 1;
    }
    self.var_56da037b6c1d635b = 0;
    self.convergence.target = self._blackboard.shootparams_ent;
    self.convergence.converge_missouterradius = 96;
    if (isdefined(self.var_6eb04341083ad82b)) {
        self.convergence.converge_time = self [[ self.var_6eb04341083ad82b ]](var_19935e0042fe0718, var_6cba42b1ab91dc15);
    } else if (var_19935e0042fe0718) {
        self.convergence.converge_time = 1500;
    } else if (istrue(var_6cba42b1ab91dc15)) {
        self.convergence.converge_time = 1500;
    } else {
        self.convergence.converge_time = 2000;
    }
    if (isdefined(self.fnsetlaserflag)) {
        self [[ self.fnsetlaserflag ]]("interpolate");
    }
    var_172e4152f3676d37 = namespace_2f36c2cc5a44d845::get_skill_from_index(level.gameskill);
    var_b6782fba64b69ab5 = level.difficultysettings["sniper_converge_scale"][var_172e4152f3676d37];
    if (isdefined(var_b6782fba64b69ab5)) {
        self.convergence.converge_time = int(self.convergence.converge_time * var_b6782fba64b69ab5);
    }
    if (isdefined(level.sniper_convergence_time_multiplier)) {
        self.convergence.converge_time = self.convergence.converge_time * level.sniper_convergence_time_multiplier;
    }
    self.convergence.converge_missinnerradius = 12;
    self.var_551a69e2205249c5 = 750;
    self.var_1c2393f94226309c = -1;
    /#
        if (getdvarint(@"hash_75e9120fb2fd5fc3", 0)) {
            self._blackboard.var_c2174cdb077d3c2 = 500;
        }
    #/
    if (!isdefined(self.sniper_laser)) {
        self.var_7d4d41db8d0295f9 = -1500;
    } else {
        self.var_7d4d41db8d0295f9 = 0;
    }
    self.var_33e6ff2f7d46b8d8 = int(self.convergence.converge_time + 1000);
    self.convergence.converge_laserofftime = self.var_33e6ff2f7d46b8d8 + 500;
    if (isdefined(self._blackboard.shootparams_pos)) {
        var_78f2b58603caf3ae = undefined;
        var_c068649575851bdf = undefined;
        if (isdefined(self.var_8629ddc52f25a54e)) {
            var_78f2b58603caf3ae = self [[ self.var_8629ddc52f25a54e ]](self._blackboard.shootparams_ent, var_6cba42b1ab91dc15);
        } else if (isdefined(var_c5686a51213bf45e)) {
            var_78f2b58603caf3ae = var_c5686a51213bf45e;
        } else {
            if (isdefined(self._blackboard.shootparams_ent)) {
                targetpos = self._blackboard.shootparams_ent.origin;
                if (isplayer(self._blackboard.shootparams_ent)) {
                    var_c068649575851bdf = self._blackboard.shootparams_ent getvelocity();
                    if (var_c068649575851bdf == (0, 0, 0)) {
                        var_c068649575851bdf = undefined;
                    }
                }
            } else {
                targetpos = self._blackboard.shootparams_pos - (0, 0, 70);
            }
            var_d6cd43f7ac43cb72 = targetpos - self.origin;
            var_d6cd43f7ac43cb72 = (var_d6cd43f7ac43cb72[0], var_d6cd43f7ac43cb72[1], 0);
            var_bb709894b649925b = vectornormalize(var_d6cd43f7ac43cb72);
            if (istrue(var_6cba42b1ab91dc15)) {
                var_78f2b58603caf3ae = targetpos;
                var_78f2b58603caf3ae = var_78f2b58603caf3ae + (0, 0, randomfloatrange(12, 36));
            } else {
                var_78f2b58603caf3ae = targetpos - var_bb709894b649925b * randomfloatrange(120, 180);
            }
            var_a755bac7dc657f85 = vectorcross(var_bb709894b649925b, (0, 0, 1));
            var_456d0752ef337beb = randomfloatrange(6, 36);
            if (istrue(var_6cba42b1ab91dc15)) {
                var_456d0752ef337beb = randomfloatrange(12, 24);
            }
            if (isdefined(var_c068649575851bdf)) {
                dot = vectordot(var_c068649575851bdf, var_a755bac7dc657f85);
                if (dot < 0) {
                    var_78f2b58603caf3ae = var_78f2b58603caf3ae + var_a755bac7dc657f85 * var_456d0752ef337beb;
                } else {
                    var_78f2b58603caf3ae = var_78f2b58603caf3ae - var_a755bac7dc657f85 * var_456d0752ef337beb;
                }
            } else if (randomintrange(0, 2)) {
                var_78f2b58603caf3ae = var_78f2b58603caf3ae + var_a755bac7dc657f85 * var_456d0752ef337beb;
            } else {
                var_78f2b58603caf3ae = var_78f2b58603caf3ae - var_a755bac7dc657f85 * var_456d0752ef337beb;
            }
        }
        self.convergence.converge_offsetdir = vectornormalize(var_78f2b58603caf3ae - self._blackboard.shootparams_pos);
        self.convergence.converge_missouterradius = distance(var_78f2b58603caf3ae, self._blackboard.shootparams_pos);
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe74
// Size: 0x333
function calcconvergencetarget() {
    /#
        assert(isdefined(self._blackboard.shootparams_pos));
    #/
    if (self.var_1c2393f94226309c >= 0 && gettime() - self.var_1c2393f94226309c >= 100) {
        if (isdefined(self._blackboard.shootparams_ent) && isplayer(self._blackboard.shootparams_ent)) {
            if (isdefined(self.fnsetlaserflag)) {
                self [[ self.fnsetlaserflag ]]("lock");
            }
        } else if (isdefined(self.fnsetlaserflag)) {
            self [[ self.fnsetlaserflag ]]("interpolate");
        }
        if (isdefined(self.var_57e4656fc3904b2a)) {
            return self [[ self.var_57e4656fc3904b2a ]](self._blackboard.shootparams_pos - (0, 0, 1.3), self.convergence.aim_pos);
        }
        return (self._blackboard.shootparams_pos - (0, 0, 1.3));
    }
    var_6a4277ff9e64049f = vectornormalize(self._blackboard.shootparams_pos - self.origin);
    var_9e61483c140a062b = vectortoangles(var_6a4277ff9e64049f);
    if (self.var_7d4d41db8d0295f9 < 0) {
        if (isdefined(self.fnsetlaserflag)) {
            self [[ self.fnsetlaserflag ]]("interpolate");
        }
        shootpos = self._blackboard.shootparams_pos + self.convergence.converge_offsetdir * self.convergence.converge_missouterradius;
        return shootpos;
    }
    f = (self.convergence.converge_time - self.var_7d4d41db8d0295f9) / self.convergence.converge_time;
    if (self.var_7d4d41db8d0295f9 >= self.convergence.converge_time) {
        f = 0;
    }
    var_6d4d4104e6e4639a = f * (self.convergence.converge_missouterradius - self.convergence.converge_missinnerradius) + self.convergence.converge_missinnerradius;
    shootpos = self._blackboard.shootparams_pos + self.convergence.converge_offsetdir * var_6d4d4104e6e4639a;
    if (isdefined(self.var_57e4656fc3904b2a)) {
        shootpos = self [[ self.var_57e4656fc3904b2a ]](shootpos, self.convergence.aim_pos);
    }
    if (isdefined(self._blackboard.shootparams_ent) && isplayer(self._blackboard.shootparams_ent)) {
        if (isdefined(self.fnsetlaserflag)) {
            self [[ self.fnsetlaserflag ]]("interpolate");
        }
    }
    return shootpos;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11af
// Size: 0x44
function turnlaserbackon(waittime) {
    self endon("death");
    wait(waittime);
    if (isdefined(self.sniper_laser)) {
        if (isdefined(self.fnlaseron)) {
            self.sniper_laser [[ self.fnlaseron ]]();
        }
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fa
// Size: 0x41e
function convergencetargettick() {
    bcansee = 1;
    var_19935e0042fe0718 = 0;
    if (isdefined(self._blackboard.shootparams_ent)) {
        bcansee = self cansee(self._blackboard.shootparams_ent);
        if (isdefined(self.convergence) && isdefined(self.convergence.target) && self.convergence.target != self._blackboard.shootparams_ent) {
            var_19935e0042fe0718 = 1;
        }
        if (bcansee) {
            bb_updateshootparams_pos(self._blackboard.shootparams_ent getshootatpos());
        }
    }
    if (!isdefined(self.convergence) || var_19935e0042fe0718) {
        resetconvergence(var_19935e0042fe0718);
    } else if (bcansee && !istrue(self.convergence.bhaslos)) {
        if (isdefined(self.convergence.aim_pos) && distancesquared(self.convergence.aim_pos, self._blackboard.shootparams_pos) < 3600) {
            resetconvergence(var_19935e0042fe0718, undefined, 1);
        } else {
            resetconvergence(var_19935e0042fe0718);
        }
    } else if (self.var_56da037b6c1d635b) {
        if (isdefined(self.fnsetlaserflag)) {
            self [[ self.fnsetlaserflag ]]("interpolate");
        }
        self.var_56da037b6c1d635b = 0;
        if (isdefined(self._blackboard.shootparams_ent) && isplayer(self._blackboard.shootparams_ent) && self cansee(self._blackboard.shootparams_ent)) {
            resetconvergence(var_19935e0042fe0718, undefined, 1);
        }
    }
    self.convergence.bhaslos = bcansee;
    var_baec6cd1d3a8c9b = 1;
    var_3c0dbcd729e6d642 = getlaserstartpoint();
    desiredaimpos = calcconvergencetarget();
    var_d4c7b1e5457a2668 = vectornormalize(desiredaimpos - var_3c0dbcd729e6d642);
    var_8d02d1d6a93ea41f = self getmuzzledir();
    var_12598611623a844d = 0.984;
    var_65cf0275da1bd77a = 0.996;
    if (isdefined(self.var_f0bc5c8a66c12f48)) {
        var_12598611623a844d = self.var_f0bc5c8a66c12f48;
    }
    if (isdefined(self.var_d78fa18248e7e3b1)) {
        var_65cf0275da1bd77a = self.var_d78fa18248e7e3b1;
    }
    if (self.var_7d4d41db8d0295f9 < 0) {
        if (!isaiming()) {
            return 0;
        }
        self.var_7d4d41db8d0295f9 = self.var_7d4d41db8d0295f9 + 50;
        var_31a129e448f45b0f = vectordot(var_d4c7b1e5457a2668, var_8d02d1d6a93ea41f);
        if (var_31a129e448f45b0f < var_12598611623a844d) {
            return 0;
        }
        var_d4c7b1e5457a2668 = vectornormalize((var_d4c7b1e5457a2668[0], var_d4c7b1e5457a2668[1], 0));
        var_8d02d1d6a93ea41f = vectornormalize((var_8d02d1d6a93ea41f[0], var_8d02d1d6a93ea41f[1], 0));
        dot = vectordot(var_d4c7b1e5457a2668, var_8d02d1d6a93ea41f);
        if (dot < var_65cf0275da1bd77a) {
            return 0;
        }
        self.var_7d4d41db8d0295f9 = 0;
    } else {
        self.var_7d4d41db8d0295f9 = self.var_7d4d41db8d0295f9 + 50;
        var_31a129e448f45b0f = vectordot(var_d4c7b1e5457a2668, var_8d02d1d6a93ea41f);
        if (var_31a129e448f45b0f < var_12598611623a844d) {
            var_baec6cd1d3a8c9b = 0;
        }
        var_d4c7b1e5457a2668 = vectornormalize((var_d4c7b1e5457a2668[0], var_d4c7b1e5457a2668[1], 0));
        var_8d02d1d6a93ea41f = vectornormalize((var_8d02d1d6a93ea41f[0], var_8d02d1d6a93ea41f[1], 0));
        dot = vectordot(var_d4c7b1e5457a2668, var_8d02d1d6a93ea41f);
        if (dot < var_65cf0275da1bd77a) {
            var_baec6cd1d3a8c9b = 0;
        }
    }
    if (self.var_7d4d41db8d0295f9 >= self.convergence.converge_time) {
        if (isdefined(self._blackboard.shootparams_ent)) {
            if (self.var_1c2393f94226309c < 0) {
                if (bcansee) {
                    self.var_1c2393f94226309c = gettime();
                }
            } else if (gettime() >= self.var_1c2393f94226309c + 200) {
                if (!bcansee) {
                    self.var_1c2393f94226309c = -1;
                }
            }
        }
    }
    return var_baec6cd1d3a8c9b;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1620
// Size: 0x14
function issniperconverging() {
    if (!isdefined(self.convergence)) {
        return 0;
    }
    return 1;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163c
// Size: 0x14
function issniperlaseron() {
    if (isdefined(self.sniper_laser)) {
        return 1;
    }
    return 0;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1658
// Size: 0x60
function isaiming() {
    if (!isdefined(self.asm.aimstarttime)) {
        return 0;
    }
    var_431678b1875f5b5c = 100;
    var_431678b1875f5b5c = var_431678b1875f5b5c * 2;
    time = gettime();
    if (self.asm.aimstarttime + var_431678b1875f5b5c < time) {
        return 1;
    }
    return 0;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c0
// Size: 0x60f
function trackloop(asmname) {
    self endon("asm_terminated");
    self endon("death");
    self.asm.prevyawdelta = 0;
    self.asm.prevpitchdelta = 0;
    firstframe = 1;
    var_43892db64ebc1e45 = 0;
    var_3661adf95124e37d = 0;
    var_8260e607ab328509 = 10;
    while (1) {
        self waittill("activate_track_loop");
        self.var_b2ac51a99fd788e = 1;
        for (;;) {
            for (;;) {
                if (!isdefined(self.var_a709fbd9fea148f6) || self asmcurrentstatehasaimset(self.var_a709fbd9fea148f6) && !self function_e8ca4080d02a0bb4()) {
                    self.var_b2ac51a99fd788e = 0;
                    break;
                }
                incranimaimweight();
                var_7dff387edf36893b = asm_currentstatehasflag(self.var_a709fbd9fea148f6, "aim");
                if (var_7dff387edf36893b && self function_53fb16fcb6043bbc()) {
                    var_7dff387edf36893b = 0;
                }
                if (!var_7dff387edf36893b && asm_currentstatehasflag(self.var_a709fbd9fea148f6, "notetrackAim")) {
                    var_7dff387edf36893b = asm_eventfired(self.var_a709fbd9fea148f6, "start_aim");
                }
                if (!var_7dff387edf36893b || !istrue(self._blackboard.shootparams_valid)) {
                    if (!var_7dff387edf36893b && isdefined(self.convergence)) {
                        clearconvergence();
                    }
                    trackturnofflaser();
                    self.asm.aimstarttime = undefined;
                } else if (!isdefined(self.asm.aimstarttime)) {
                    self.asm.aimstarttime = gettime();
                }
                /#
                    if (isdefined(level.var_3935f458ccbef566)) {
                        var_7dff387edf36893b = 1;
                    }
                #/
                var_35c8db9fd47c4521 = 0;
                var_4d8c29985e84735b = (0, 0, 0);
                var_182a55f70ad78f5f = undefined;
                var_63a5b32b096323be = undefined;
                if (var_7dff387edf36893b) {
                    if (self bb_shootparamsvalid() && isdefined(self._blackboard.shootparams_pos)) {
                        if (isdefined(self.var_6500eec20d2a7458) && istrue(self._blackboard.shootparams_bconvergeontarget)) {
                            self [[ self.var_6500eec20d2a7458 ]]();
                        } else if (istrue(self._blackboard.shootparams_bconvergeontarget)) {
                            var_baec6cd1d3a8c9b = convergencetargettick();
                            shootpos = calcconvergencetarget();
                            /#
                                assert(isdefined(self.convergence));
                            #/
                            self.convergence.aim_pos = shootpos;
                            if (var_baec6cd1d3a8c9b) {
                                trackturnonlaser();
                            } else {
                                trackturnofflaser();
                            }
                        } else {
                            trackturnofflaser();
                        }
                    } else {
                        trackturnofflaser();
                    }
                } else if (abs(self.asm.prevyawdelta) < 5 && abs(self.asm.prevpitchdelta) < 5) {
                    self setaimangles((0, 0, 0));
                    self setaimstate(3);
                    self.baimedataimtarget = 0;
                    waitframe();
                    continue;
                }
                /#
                    if (isdefined(level.var_3935f458ccbef566)) {
                        var_4d8c29985e84735b = level.var_3935f458ccbef566;
                        self.asm.prevyawdelta = var_4d8c29985e84735b[1];
                        self.asm.prevpitchdelta = var_4d8c29985e84735b[0];
                    }
                #/
                if (self asmcurrentstatehasaimset(self.var_a709fbd9fea148f6)) {
                    waitframe();
                    continue;
                }
                if (istrue(self.runngun)) {
                    waitframe();
                    continue;
                }
                var_4d8c29985e84735b = self getaimangle();
                pitchdelta = var_4d8c29985e84735b[0];
                var_5babffa7f03ce512 = var_4d8c29985e84735b[1];
                var_4d8c29985e84735b = undefined;
                if (var_3661adf95124e37d > 0) {
                    var_3661adf95124e37d = var_3661adf95124e37d - 1;
                    var_8260e607ab328509 = max(10, var_8260e607ab328509 - 5);
                } else if (self.relativedir && self.relativedir != var_43892db64ebc1e45) {
                    var_3661adf95124e37d = 2;
                    var_8260e607ab328509 = 30;
                } else if (self function_e8ca4080d02a0bb4()) {
                    var_8260e607ab328509 = 2;
                } else if (var_35c8db9fd47c4521) {
                    var_8260e607ab328509 = 5;
                } else {
                    var_8260e607ab328509 = 10;
                }
                var_cc6e3d91cfe6fd55 = 4;
                var_43892db64ebc1e45 = self.relativedir;
                var_e50573772aedea37 = self.movemode != "stop" || !firstframe;
                if (var_e50573772aedea37) {
                    var_4142633c790d3ae6 = var_5babffa7f03ce512 - self.asm.prevyawdelta;
                    if (squared(var_4142633c790d3ae6) > var_cc6e3d91cfe6fd55) {
                        var_d209185381bff3db = var_4142633c790d3ae6 * 0.4;
                        var_5babffa7f03ce512 = self.asm.prevyawdelta + clamp(var_d209185381bff3db, -1 * var_8260e607ab328509, var_8260e607ab328509);
                        var_5babffa7f03ce512 = clamp(var_5babffa7f03ce512, self.rightaimlimit, self.leftaimlimit);
                    }
                    var_9dee51f9cc272c49 = pitchdelta - self.asm.prevpitchdelta;
                    if (squared(var_9dee51f9cc272c49) > var_cc6e3d91cfe6fd55) {
                        var_dbab739e3612d18c = var_9dee51f9cc272c49 * 0.4;
                        pitchdelta = self.asm.prevpitchdelta + clamp(var_dbab739e3612d18c, -1 * var_8260e607ab328509, var_8260e607ab328509);
                        pitchdelta = clamp(pitchdelta, self.upaimlimit, self.downaimlimit);
                    }
                }
                firstframe = 0;
                self.asm.prevyawdelta = var_5babffa7f03ce512;
                self.asm.prevpitchdelta = pitchdelta;
                if (isdefined(self.asm.dolmgtracking) && self.asm.dolmgtracking) {
                    trackloop_setanimweightslmg(pitchdelta, var_5babffa7f03ce512);
                } else {
                    trackloop_setanimweights(pitchdelta, var_5babffa7f03ce512);
                }
            }
        }
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd6
// Size: 0xc8
function trackloop_restoreaim() {
    if (!isdefined(self.asm.prevyawdelta)) {
        return;
    }
    var_5babffa7f03ce512 = clamp(self.asm.prevyawdelta, self.rightaimlimit, self.leftaimlimit);
    pitchdelta = clamp(self.asm.prevpitchdelta, self.upaimlimit, self.downaimlimit);
    if (isdefined(self.asm.dolmgtracking) && self.asm.dolmgtracking) {
        trackloop_setanimweightslmg(pitchdelta, var_5babffa7f03ce512);
    } else {
        trackloop_setanimweights(pitchdelta, var_5babffa7f03ce512);
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da5
// Size: 0x5e
function function_cb9cc0bf8a48e338() {
    if (self.var_f42c6628b5c02603) {
        if (isdefined(self.cqb_point_of_interest)) {
            self.cqb_point_of_interest.lastusedtime = self.poi_starttime;
        }
        self.currentpoi = self.cqb_point_of_interest;
        self.var_f42c6628b5c02603 = 0;
    }
    return self.currentpoi;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0b
// Size: 0x3a4
function trackloop_setanimweights(pitchdelta, var_5babffa7f03ce512) {
    aim_5 = undefined;
    if (isdefined(self.asm.track.aim_2)) {
        aim_2 = self.asm.track.aim_2;
        aim_4 = self.asm.track.aim_4;
        aim_6 = self.asm.track.aim_6;
        aim_8 = self.asm.track.aim_8;
    } else {
        aim_2 = self.asm.track.aim_2_default;
        aim_4 = self.asm.track.aim_4_default;
        aim_6 = self.asm.track.aim_6_default;
        aim_8 = self.asm.track.aim_8_default;
    }
    if (isdefined(self.asm.track.aim_5)) {
        aim_5 = self.asm.track.aim_5;
    }
    var_9b352fd430804555 = 0;
    var_9b3529d430803823 = 0;
    var_9b3528d4308035f0 = 0;
    var_9b352bd430803c89 = 0;
    var_9b3535d430805287 = 0;
    var_5babffa7f03ce512 = clamp(var_5babffa7f03ce512, self.rightaimlimit, self.leftaimlimit);
    pitchdelta = clamp(pitchdelta, self.upaimlimit, self.downaimlimit);
    if (var_5babffa7f03ce512 < 0) {
        var_9b352bd430803c89 = var_5babffa7f03ce512 / self.rightaimlimit * self.a.aimweight;
        var_9b3528d4308035f0 = 1;
    } else if (var_5babffa7f03ce512 > 0) {
        var_9b3529d430803823 = var_5babffa7f03ce512 / self.leftaimlimit * self.a.aimweight;
        var_9b3528d4308035f0 = 1;
    }
    if (pitchdelta < 0) {
        var_9b3535d430805287 = pitchdelta / self.upaimlimit * self.a.aimweight;
        var_9b3528d4308035f0 = 1;
    } else if (pitchdelta > 0) {
        var_9b352fd430804555 = pitchdelta / self.downaimlimit * self.a.aimweight;
        var_9b3528d4308035f0 = 1;
    }
    self aisetanimlimited(aim_2, var_9b352fd430804555, 0.1, 1, 1);
    self aisetanimlimited(aim_4, var_9b3529d430803823, 0.1, 1, 1);
    self aisetanimlimited(aim_6, var_9b352bd430803c89, 0.1, 1, 1);
    self aisetanimlimited(aim_8, var_9b3535d430805287, 0.1, 1, 1);
    if (isdefined(aim_5)) {
        self aisetanimlimited(aim_5, var_9b3528d4308035f0, 0.1, 1, 1);
    }
    /#
        if (isdefined(level.var_3935f458ccbef566)) {
            self aisetanimlimited(aim_2, var_9b352fd430804555, 0, 1, 1);
            self aisetanimlimited(aim_4, var_9b3529d430803823, 0, 1, 1);
            self aisetanimlimited(aim_6, var_9b352bd430803c89, 0, 1, 1);
            self aisetanimlimited(aim_8, var_9b3535d430805287, 0, 1, 1);
            if (isdefined(aim_5)) {
                self aisetanimlimited(aim_5, var_9b3528d4308035f0, 0, 1, 1);
            }
        }
    #/
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b6
// Size: 0x503
function trackloop_setanimweightslmg(pitchdelta, var_5babffa7f03ce512) {
    /#
        assert(isdefined(self.asm.track.lmg_aim_1));
    #/
    var_473d10f4ff7e23c2 = self.asm.track.lmg_aim_1;
    aim_2 = self.asm.track.lmg_aim_2;
    var_473d0ef4ff7e1f5c = self.asm.track.lmg_aim_3;
    aim_4 = self.asm.track.lmg_aim_4;
    aim_6 = self.asm.track.lmg_aim_6;
    var_473d0af4ff7e1690 = self.asm.track.lmg_aim_7;
    aim_8 = self.asm.track.lmg_aim_8;
    var_473d18f4ff7e355a = self.asm.track.lmg_aim_9;
    var_70662f647f89d5f7 = [0:aim_6, 1:var_473d18f4ff7e355a, 2:aim_8, 3:var_473d0af4ff7e1690, 4:aim_4, 5:var_473d10f4ff7e23c2, 6:aim_2, 7:var_473d0ef4ff7e1f5c, 8:aim_6];
    degrees = [0:-180, 1:-135, 2:-90, 3:-45, 4:0, 5:45, 6:90, 7:135, 8:180];
    var_9d05d7478c808090 = [0:(-1, 0, 0), 1:(-0.707, -0.707, 0), 2:(0, -1, 0), 3:(0.707, -0.707, 0), 4:(1, 0, 0), 5:(0.707, 0.707, 0), 6:(0, 1, 0), 7:(-0.707, 0.707, 0), 8:(-1, 0, 0)];
    var_cd2b912c7b5ec142 = [0:80, 1:91.787, 2:45, 3:91.787, 4:80, 5:91.787, 6:45, 7:91.787, 8:80];
    var_2b9e6a3057c13798 = (var_5babffa7f03ce512, pitchdelta, 0);
    var_b943808b345c0c66 = length2d(var_2b9e6a3057c13798);
    var_effbd89ceed72f4f = vectornormalize(var_2b9e6a3057c13798);
    var_8dec8d309ea036a5 = vectortoyaw(var_effbd89ceed72f4f);
    var_8dec8d309ea036a5 = angleclamp180(var_8dec8d309ea036a5);
    for (var_e3ca7482a8faa932 = 0; var_8dec8d309ea036a5 > degrees[var_e3ca7482a8faa932]; var_e3ca7482a8faa932++) {
    }
    if (var_e3ca7482a8faa932 == 0) {
        var_e3ca7482a8faa932 = 1;
    }
    /#
        assertex(var_e3ca7482a8faa932 < var_70662f647f89d5f7.size && var_e3ca7482a8faa932 > 0, "Bad index : " + var_e3ca7482a8faa932 + ", Desired Yaw: " + var_8dec8d309ea036a5);
    #/
    statename = self.asm.track.lmg_aim_state;
    for (index = 0; index < var_70662f647f89d5f7.size; index++) {
        if (index == var_e3ca7482a8faa932 || index == var_e3ca7482a8faa932 - 1) {
            anim_time = clamp(var_b943808b345c0c66 / var_cd2b912c7b5ec142[index], 0, 1);
            angle_diff = acos(vectordot(var_9d05d7478c808090[index], var_effbd89ceed72f4f));
            anim_weight = clamp(1 - angle_diff / var_cd2b912c7b5ec142[index], 0, 1);
            var_7f5c44a3b91fa3f7 = asm_getxanim(statename, var_70662f647f89d5f7[index]);
            prev_time = self aigetanimtime(var_7f5c44a3b91fa3f7);
            if (prev_time > 0) {
                var_228c1f2f3a2d92f1 = getanimlength(var_7f5c44a3b91fa3f7);
                var_35a0f5afb933e47b = (anim_time - prev_time) * var_228c1f2f3a2d92f1 / 0.05;
                self aisetanimlimited(var_7f5c44a3b91fa3f7, anim_weight, 0.05, var_35a0f5afb933e47b);
            } else {
                self aisetanimlimited(var_7f5c44a3b91fa3f7, anim_weight, 0.05, 0);
                self aisetanimtime(var_7f5c44a3b91fa3f7, anim_time);
            }
        } else if (var_70662f647f89d5f7[index] != var_70662f647f89d5f7[var_e3ca7482a8faa932] && var_70662f647f89d5f7[index] != var_70662f647f89d5f7[var_e3ca7482a8faa932 - 1]) {
            self aiclearanim(asm_getxanim(statename, var_70662f647f89d5f7[index]), 0.05);
        }
    }
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26c0
// Size: 0x112
function setanimaimweight(goalweight, goaltime) {
    if (!isdefined(goaltime) || goaltime <= 0) {
        self.a.aimweight = goalweight;
        self.a.aimweight_start = goalweight;
        self.a.aimweight_end = goalweight;
        self.a.aimweight_transframes = 0;
    } else {
        if (!isdefined(self.a.aimweight)) {
            self.a.aimweight = 0;
        }
        self.a.aimweight_start = self.a.aimweight;
        self.a.aimweight_end = goalweight;
        self.a.aimweight_transframes = int(goaltime * 20);
    }
    self.a.aimweight_t = 0;
}

// Namespace track/namespace_a280cc8ca2fafcf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d9
// Size: 0xbb
function incranimaimweight() {
    if (self.a.aimweight_t < self.a.aimweight_transframes) {
        self.a.aimweight_t++;
        t = 1 * self.a.aimweight_t / self.a.aimweight_transframes;
        self.a.aimweight = self.a.aimweight_start * (1 - t) + self.a.aimweight_end * t;
    }
}

