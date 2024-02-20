// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\soldier\script_funcs.gsc;
#using scripts\asm\soldier\cover.gsc;

#namespace arrival;

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x438
// Size: 0x2e
function notshouldstartarrival(asmname, statename, var_f2b19b25d457c2a6, params) {
    return !shouldstartarrival(asmname, statename, params);
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e
// Size: 0x11
function getmaxarrivaldistfornodetype(nodetype) {
    return 256;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487
// Size: 0x219
function shouldstartarrival(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self shoulddoarrival()) {
        return 0;
    }
    if (!isdefined(self.pathgoalpos)) {
        return 0;
    }
    node = getarrivalnode();
    if (!asm_eventfired(asmname, "cover_approach")) {
        return 0;
    }
    if (isdefined(params)) {
        if (!isarray(params)) {
            nodetype = params;
        } else if (params.size < 1) {
            nodetype = "Exposed";
        } else {
            nodetype = params[0];
        }
    } else {
        nodetype = "Exposed";
    }
    if (!isarrivaltype(asmname, statename, var_f2b19b25d457c2a6, nodetype)) {
        return 0;
    }
    var_6b923ad9da57b2cf = distance(self.origin, self.pathgoalpos);
    var_1047326b5402e964 = getmaxarrivaldistfornodetype(nodetype);
    if (var_6b923ad9da57b2cf > var_1047326b5402e964) {
        return 0;
    }
    var_5217df91f13c7c48 = 0;
    if (isdefined(params) && params.size > 1) {
        var_5217df91f13c7c48 = int(params[1]);
    }
    var_457feb6671add6f0 = undefined;
    var_e5aefc352a22aca2 = undefined;
    var_d2fd6e73fe47fd81 = undefined;
    if (nodetype == "Exposed Moving") {
        var_d2fd6e73fe47fd81 = "code_move";
    }
    demeanor = asm_getdemeanor();
    if (demeanor == "casual" || demeanor == "casual_gun" || demeanor == "patrol") {
        var_ae21c8641e5e4f38 = 0.053;
        if (self pathdisttogoal() < 25) {
            var_ae21c8641e5e4f38 = 2;
        }
        self.asm.stopdata = calculatestopdata(asmname, statename, var_f2b19b25d457c2a6, nodetype, var_5217df91f13c7c48, undefined, var_457feb6671add6f0, var_ae21c8641e5e4f38, undefined, var_e5aefc352a22aca2, var_d2fd6e73fe47fd81);
    } else {
        self.asm.stopdata = calculatestopdata(asmname, statename, var_f2b19b25d457c2a6, nodetype, var_5217df91f13c7c48, undefined, var_457feb6671add6f0, undefined, undefined, var_e5aefc352a22aca2, var_d2fd6e73fe47fd81);
    }
    if (!isdefined(self.asm.stopdata)) {
        return 0;
    }
    return 1;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6a8
// Size: 0x3f
function shouldstartcasualarrivalaftercodemove(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!asm_eventfired(asmname, "code_move")) {
        return 0;
    }
    return shouldstartcasualarrival(asmname, statename, var_f2b19b25d457c2a6, params);
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ef
// Size: 0x51
function shouldstartcasualarrival(asmname, statename, var_f2b19b25d457c2a6, params) {
    demeanor = asm_getdemeanor();
    if (!isdefined(params) || demeanor != params[2]) {
        return 0;
    }
    return shouldstartarrival(asmname, statename, var_f2b19b25d457c2a6, params);
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x748
// Size: 0x3f
function shouldstartcasualarrivalwithgunaftercodemove(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!asm_eventfired(asmname, "code_move")) {
        return 0;
    }
    return shouldstartcasualarrivalwithgun(asmname, statename, var_f2b19b25d457c2a6, params);
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78f
// Size: 0x51
function shouldstartcasualarrivalwithgun(asmname, statename, var_f2b19b25d457c2a6, params) {
    demeanor = asm_getdemeanor();
    if (!isdefined(params) || demeanor != params[2]) {
        return 0;
    }
    return shouldstartarrival(asmname, statename, var_f2b19b25d457c2a6, params);
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7e8
// Size: 0x4c
function chooseanim_arrival(asmname, statename, params) {
    /#
        assert(isdefined(self.asm.stopdata));
    #/
    return self.asm.stopdata;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83c
// Size: 0x24a
function function_cf21d79464e005d2(node) {
    var_a004a3812e5b3cad = node.origin;
    if (shouldinitiallyattackfromexposed() && self._blackboard.var_4f2c03980416a4a9 != "none" && isdefined(node.type)) {
        switch (node.type) {
        case #"hash_667bc7e605903a6c":
        case #"hash_cd3ffe799551db82":
            if (self._blackboard.var_4f2c03980416a4a9 == "full_exposed") {
                offset = (-15, -44, 0);
                var_a004a3812e5b3cad = var_a004a3812e5b3cad + rotatevector(offset, node.angles);
            } else if (self._blackboard.var_4f2c03980416a4a9 == "lean") {
                offset = (-6, -10, 0);
                var_a004a3812e5b3cad = var_a004a3812e5b3cad + rotatevector(offset, node.angles);
            }
            break;
        case #"hash_55ed607005f12d49":
        case #"hash_e1d8e1adebed5a61":
            if (self._blackboard.var_4f2c03980416a4a9 == "full_exposed") {
                offset = (-15, 44, 0);
                var_a004a3812e5b3cad = var_a004a3812e5b3cad + rotatevector(offset, node.angles);
            } else if (self._blackboard.var_4f2c03980416a4a9 == "lean") {
                offset = (-6, 10, 0);
                var_a004a3812e5b3cad = var_a004a3812e5b3cad + rotatevector(offset, node.angles);
            }
            break;
        case #"hash_78b110033ccb68b0":
        case #"hash_c3b74422dec48736":
            /#
                assert(self._blackboard.var_4f2c03980416a4a9 == "full_exposed");
            #/
            offset = (-8, 0, 0);
            var_a004a3812e5b3cad = var_a004a3812e5b3cad + rotatevector(offset, node.angles);
            break;
        case #"hash_961a09cded5ffc80":
            break;
        default:
            /#
                assertmsg("arrive to cover exposed stepout requested to an unimplemented/unexpected node type " + node.type);
            #/
            break;
        }
    }
    return var_a004a3812e5b3cad;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8e
// Size: 0x417
function calculatestopdata(asmname, statename, var_f2b19b25d457c2a6, nodetype, var_5217df91f13c7c48, var_6164202739d4a0fb, var_7b0f2a3348ab051, var_a9d2a260c9698ff4, var_4795faf7dae203d5, var_e5aefc352a22aca2, var_d2fd6e73fe47fd81, var_c7eeabfb94518b4d) {
    node = getarrivalnode();
    var_cd19c4c27c506f73 = undefined;
    if (isdefined(node) && !self btgoalvalid() && isdefined(self.scriptedarrivalent) && self.scriptedarrivalent == node) {
        if (distance2dsquared(self.scriptedarrivalent.origin, self.pathgoalpos) > 4096) {
            if (!isdefined(self.scriptedarrivalent.calculatestopdatawarningtime) || self.scriptedarrivalent.calculatestopdatawarningtime < gettime() - level.frameduration) {
                self.scriptedarrivalent.calculatestopdatawarningtime = gettime();
            } else {
                /#
                    assertmsg("actor has self.scriptedarrivalent that is nowhere near his goalpos. is it leftover from an interrupted anim_reach? you may need to call anim_reach_cleanup_solo().");
                #/
                self.scriptedarrivalent delete();
                self.scriptedarrivalent = undefined;
                node = getarrivalnode();
            }
        }
    }
    goalpos = undefined;
    if (isdefined(node)) {
        goalpos = function_cf21d79464e005d2(node);
    } else {
        goalpos = self.pathgoalpos;
    }
    var_ec1d2c386a790585 = goalpos - self.origin;
    var_ec1d2c386a790585 = vectornormalize((var_ec1d2c386a790585[0], var_ec1d2c386a790585[1], 0));
    if (vectordot(var_ec1d2c386a790585, anglestoforward(self.angles)) < 0.707) {
        return undefined;
    }
    if (nodetype == "Custom") {
        var_f2b19b25d457c2a6 = self.var_a57082fdf62bc898;
        if (isdefined(self.var_33b4c07d1f388776)) {
            var_cd19c4c27c506f73 = self.var_33b4c07d1f388776;
        }
        var_5217df91f13c7c48 = self.var_171120e99df3e286;
    }
    if (!isdefined(var_7b0f2a3348ab051)) {
        var_7b0f2a3348ab051 = "";
    }
    var_33cde98bee4c1299 = "";
    if (var_5217df91f13c7c48) {
        foot = "left";
        if (asm_eventfiredrecently(asmname, "pass_left")) {
            foot = "left";
        } else if (asm_eventfiredrecently(asmname, "pass_right")) {
            foot = "right";
        } else if (self.asm.footsteps.foot == "right") {
            foot = "right";
        }
        if (isdefined(var_7b0f2a3348ab051)) {
            var_33cde98bee4c1299 = var_7b0f2a3348ab051 + foot;
        } else {
            var_33cde98bee4c1299 = foot;
        }
    } else {
        var_33cde98bee4c1299 = var_7b0f2a3348ab051;
    }
    var_eacf2fcf316960a0 = nodeshouldfaceangles(node);
    yaw = undefined;
    angles = undefined;
    if ((nodetype == "Exposed" || nodetype == "Exposed Crouch") && (recentlysawenemy() || shouldinitiallyattackfromexposed())) {
        if (!self bb_shootparamsvalid() && !isdefined(self.smartfacingpos)) {
            if (isdefined(node) && isdefined(node.angles)) {
                yaw = node.angles[1];
                angles = node.angles;
                var_eacf2fcf316960a0 = 1;
            } else {
                var_eacf2fcf316960a0 = 0;
            }
        } else {
            var_ad3204b3caf1ccea = getturndesiredyaw();
            angles = (0, self.angles[1] + var_ad3204b3caf1ccea, 0);
            yaw = angles[1];
            var_eacf2fcf316960a0 = 1;
        }
    } else if (var_eacf2fcf316960a0) {
        yaw = getnodeforwardyaw(node, undefined, 0);
        angles = node.angles;
    }
    result = self actorcalcstopdata(goalpos, angles, getcustomarrivalangles(), var_6164202739d4a0fb, var_eacf2fcf316960a0, var_f2b19b25d457c2a6, yaw, var_33cde98bee4c1299, var_7b0f2a3348ab051, var_a9d2a260c9698ff4, var_4795faf7dae203d5, nodetype, var_e5aefc352a22aca2, var_d2fd6e73fe47fd81, var_c7eeabfb94518b4d, var_cd19c4c27c506f73);
    if (isdefined(result) && isdefined(node)) {
        result.var_e411f4722cf5136a = self._blackboard.var_4f2c03980416a4a9 != "none";
    }
    return result;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xead
// Size: 0x39
function playanim_waitforpathset(asmname, statename) {
    self endon("runto_arrived");
    self endon(statename + "_finished");
    self waittill("path_set");
    asm_fireevent(asmname, "abort");
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeed
// Size: 0x4f
function playanim_waitforpathclear(asmname, statename) {
    self endon("runto_arrived");
    self endon(statename + "_finished");
    while (1) {
        if (!isdefined(self.pathgoalpos)) {
            break;
        }
        wait(0.05);
    }
    asm_fireevent(asmname, "abort");
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf43
// Size: 0x45
function arrivalterminatewait(statename) {
    self endon("death");
    self.asm.arriving = statename;
    self waittill(statename + "_finished");
    self.asm.arriving = undefined;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8f
// Size: 0xff
function playanim_arrival_handlestandevent(asmname, statename, xanim, var_1a08cc6ea0b47949) {
    self endon(statename + "_finished");
    self.asm.arrivalstopfired = 0;
    movedelta = getmovedelta(xanim, 0, 1);
    animtime = getanimlength(xanim);
    decrement = 0.05 / animtime;
    currenttime = 1 - decrement;
    while (currenttime > 0) {
        var_1665f9f1779462bb = getmovedelta(xanim, 0, currenttime);
        if (lengthsquared(movedelta - var_1665f9f1779462bb) >= 64) {
            break;
        }
        currenttime = currenttime - decrement;
    }
    waittime = currenttime * animtime / var_1a08cc6ea0b47949;
    if (waittime > 0) {
        wait(waittime);
    }
    self.asm.arrivalstopfired = 1;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1095
// Size: 0x19
function returnoncorner(note) {
    if (note == "corner") {
        return 1;
    }
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b5
// Size: 0x19
function returnonwarpstart(note) {
    if (note == "warp_arrival_start") {
        return 1;
    }
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10d5
// Size: 0x6a
function calculateadjustedspeedforshortpath(desiredspeed, pathdist) {
    var_87e7a006522a7fa3 = 64;
    var_a0bbb0351fa8ec9d = 110;
    if (pathdist >= var_87e7a006522a7fa3 && pathdist <= var_a0bbb0351fa8ec9d) {
        t = (pathdist - var_87e7a006522a7fa3) / (var_a0bbb0351fa8ec9d - var_87e7a006522a7fa3);
        targetspeed = self aigettargetspeed();
        return ((1 - t) * targetspeed + t * desiredspeed);
    }
    return desiredspeed;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1147
// Size: 0x7f5
function playanim_arrival(asmname, statename, params) {
    self endon(statename + "_finished");
    var_c95ea2ec0593ac01 = 1;
    if (isdefined(params)) {
        var_c95ea2ec0593ac01 = params;
    }
    self.asm.arrivalasmstatename = statename;
    self.a.arrivalasmstatename = statename;
    thread arrivalterminatewait(statename);
    stopdata = asm_getanim(asmname, statename);
    /#
        assertex(isdefined(stopdata), "Arrival forced to abort");
    #/
    if (!isdefined(stopdata)) {
        self orientmode("face motion");
        asm_fireevent(asmname, "abort", undefined);
        return;
    }
    self orientmode("face angle", self.angles[1]);
    var_b84971510aaf7cd3 = stopdata.finalangles;
    angleindex = stopdata.angleindex;
    var_29a16a52b186224e = (0, var_b84971510aaf7cd3[1] - stopdata.angledelta, 0);
    var_55644d08241b1a7b = stopdata.startpos;
    var_f78bc5cde11694fc = var_29a16a52b186224e[1];
    if (isdefined(stopdata.parentpos) && isdefined(stopdata.parentangles)) {
        localdelta = stopdata.startpos - stopdata.parentpos;
        localdelta = rotatevectorinverted(localdelta, stopdata.parentangles);
        var_57c35d8b31b4fec = invertangles(stopdata.parentangles);
        localangles = combineangles(var_29a16a52b186224e, var_57c35d8b31b4fec);
        parentent = self getnavspaceent();
        /#
            assertex(isdefined(parentent), "Started arrival on a moving platform, is no longer on a moving platform. Path clear should have aborted this process.");
        #/
        localdelta = rotatevector(localdelta, parentent.angles);
        var_55644d08241b1a7b = localdelta + parentent.origin;
        newangles = combineangles(localangles, parentent.angles);
        var_f78bc5cde11694fc = newangles[1];
    }
    var_55d057b8b7b5cd20 = statename;
    if (isdefined(self.var_a57082fdf62bc898)) {
        var_55d057b8b7b5cd20 = self.var_a57082fdf62bc898;
    }
    stopanim = stopdata.stopanim;
    if (isdefined(self.asm.customdata) && isdefined(self.var_33b4c07d1f388776)) {
        self setoverridearchetype("animscript", self.var_33b4c07d1f388776, 1);
    }
    var_757fe3a9e3297942 = asm_getxanim(var_55d057b8b7b5cd20, stopanim);
    var_ac1089fc2c260dcb = getarrivalnode();
    if (isdefined(stopdata.customtargetpos)) {
        goalpos = stopdata.customtargetpos;
    } else {
        if (isdefined(var_ac1089fc2c260dcb)) {
            goalpos = function_cf21d79464e005d2(var_ac1089fc2c260dcb);
        } else {
            goalpos = self.pathgoalpos;
        }
        self._blackboard.var_9f2e830204cce981 = istrue(stopdata.var_e411f4722cf5136a);
    }
    if (!istrue(stopdata.bskipstartcoverarrival)) {
        self startcoverarrival();
    }
    if (animhasnotetrack(var_757fe3a9e3297942, "code_move")) {
        self animmode("zonly_physics", 0);
        animrate = motionwarpwithnotetracks(var_757fe3a9e3297942, goalpos, stopdata.finalangles, undefined, "corner", undefined);
        self aisetanim(var_55d057b8b7b5cd20, stopanim, animrate);
        asm_donotetracks(asmname, statename, &returnoncorner, undefined, var_55d057b8b7b5cd20);
        self aisetanim(var_55d057b8b7b5cd20, stopanim, 1);
        asm_donotetracks(asmname, statename, undefined, undefined, var_55d057b8b7b5cd20);
        return;
    }
    if (isdefined(self.var_18eb79d0deeb3b75)) {
        anim_mode = self.var_18eb79d0deeb3b75;
        self animmode(anim_mode);
    } else {
        self animmode("zonly_physics", 0);
    }
    asm_playfacialanim(asmname, statename, var_757fe3a9e3297942);
    var_246fbee6ab76bbc3 = 1;
    if (isdefined(goalpos)) {
        var_eb1c18bb49d8770c = length(stopdata.movedelta);
        disttogoal = length(self.origin - goalpos);
        if (disttogoal > 1) {
            var_246fbee6ab76bbc3 = var_eb1c18bb49d8770c / length(self.origin - goalpos);
        }
        var_246fbee6ab76bbc3 = clamp(var_246fbee6ab76bbc3, 0.8, 1.3);
    }
    var_1a08cc6ea0b47949 = var_c95ea2ec0593ac01 * var_246fbee6ab76bbc3;
    if (isdefined(self.asm.arrivalspeed)) {
        var_1a08cc6ea0b47949 = var_1a08cc6ea0b47949 * self.asm.arrivalspeed;
    }
    if (isdefined(self.arrivalspeedtarget) && isdefined(self.arrivaldesiredspeed) && isentasoldier() && demeanorhasblendspace()) {
        var_1a08cc6ea0b47949 = self.arrivaldesiredspeed / self.arrivalspeedtarget;
        self.arrivaldesiredspeed = undefined;
        var_42d8ce9773183805 = 0.8;
        var_1a08cc6ea0b47949 = max(var_42d8ce9773183805, var_1a08cc6ea0b47949);
    }
    thread playanim_arrival_handlestandevent(asmname, statename, var_757fe3a9e3297942, var_1a08cc6ea0b47949);
    self aisetanim(var_55d057b8b7b5cd20, stopanim, var_1a08cc6ea0b47949);
    end_time = 1;
    if (animhasnotetrack(var_757fe3a9e3297942, "warp_arrival_start")) {
        /#
            assert(animhasnotetrack(var_757fe3a9e3297942, "warp_arrival_end"));
        #/
        var_b9460e0cb9b449a3 = getnotetracktimes(var_757fe3a9e3297942, "warp_arrival_start");
        endnote = getnotetracktimes(var_757fe3a9e3297942, "warp_arrival_end");
        if (var_b9460e0cb9b449a3[0] > 0) {
            asm_donotetracks(asmname, statename, &returnonwarpstart, undefined, var_55d057b8b7b5cd20, 0);
        }
        animlength = getanimlength(var_757fe3a9e3297942);
        var_219923344cdb8748 = var_b9460e0cb9b449a3[0];
        if (var_219923344cdb8748 > 0) {
            var_219923344cdb8748 = var_b9460e0cb9b449a3[0] * animlength * 1000;
            var_219923344cdb8748 = var_219923344cdb8748 - mod(int(var_219923344cdb8748), level.frameduration);
            var_219923344cdb8748 = var_219923344cdb8748 / animlength / 1000;
        }
        end_time = endnote[0];
        duration = int((end_time - var_219923344cdb8748) * animlength / var_1a08cc6ea0b47949 * 1000);
        duration = duration + level.frameduration - mod(duration, level.frameduration);
        motionwarpwithtimes(var_757fe3a9e3297942, goalpos, stopdata.finalangles, var_219923344cdb8748, 1, duration, 0);
    } else {
        var_6040e7eba5e09557 = 500;
        if (animhasnotetrack(var_757fe3a9e3297942, "start_aim")) {
            end_time = getnotetracktimes(var_757fe3a9e3297942, "start_aim")[0];
            var_228c1f2f3a2d92f1 = getanimlength(var_757fe3a9e3297942);
            var_6040e7eba5e09557 = int(end_time * var_228c1f2f3a2d92f1 / var_1a08cc6ea0b47949 * 1000);
            if (var_6040e7eba5e09557 < 300 && var_228c1f2f3a2d92f1 / var_1a08cc6ea0b47949 >= 0.15) {
                var_6040e7eba5e09557 = 300;
            }
        }
        self motionwarpwithanim(var_55644d08241b1a7b, var_29a16a52b186224e, goalpos, stopdata.finalangles, var_6040e7eba5e09557);
    }
    if (!isagent(self)) {
        anime = asm_lookupanimfromaliasifexists(statename, "conceal_add");
        if (isdefined(anime) && isdefined(var_ac1089fc2c260dcb) && isdefined(var_ac1089fc2c260dcb.type) && (var_ac1089fc2c260dcb.type == "Conceal Crouch" || var_ac1089fc2c260dcb.type == "Conceal Stand")) {
            var_7774fa3b6c5d179c = asm_getxanim(statename, anime);
            animlength = getanimlength(var_757fe3a9e3297942);
            var_5ea036af2c7394cb = animlength * end_time * 0.3;
            thread namespace_d925b2b52656868e::start_conceal_add(statename, var_7774fa3b6c5d179c, var_5ea036af2c7394cb);
        }
    }
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename), undefined, var_55d057b8b7b5cd20);
    self.a.movement = "stop";
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1943
// Size: 0x1b
function getcustomarrivalangles() {
    if (isdefined(self.var_a41edf45bb0ff97)) {
        return self.var_a41edf45bb0ff97;
    }
    return undefined;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1966
// Size: 0xf4
function getstopanims(asmname, statename, approachtype, var_5217df91f13c7c48, var_7b0f2a3348ab051) {
    /#
        assert(!asm_hasalias(statename, "0"));
    #/
    /#
        assert(!asm_hasalias(statename, "5"));
    #/
    var_9b9c0392fa49456d = [];
    var_9b9c0392fa49456d[5] = asm_lookupdirectionalfootanim(1, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[4] = asm_lookupdirectionalfootanim(2, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[3] = asm_lookupdirectionalfootanim(3, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[6] = asm_lookupdirectionalfootanim(4, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[2] = asm_lookupdirectionalfootanim(6, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[7] = asm_lookupdirectionalfootanim(7, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[0] = asm_lookupdirectionalfootanim(8, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[1] = asm_lookupdirectionalfootanim(9, asmname, statename, var_5217df91f13c7c48, var_7b0f2a3348ab051);
    var_9b9c0392fa49456d[8] = var_9b9c0392fa49456d[0];
    return var_9b9c0392fa49456d;
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1a62
// Size: 0xa6
function function_a6a36944d51a88a0(var_8e5cf88282523d3f, tracestartpos, var_41302affd456fcb3, fraction, color, frames) {
    /#
        if (!namespace_bf5a1761a8d1bb07::function_3271c00e44d9636b()) {
            return;
        }
        line(var_8e5cf88282523d3f, var_8e5cf88282523d3f + (0, 0, 64), color, 1, 1, frames);
        midpoint = vectorlerp(tracestartpos, var_41302affd456fcb3, fraction);
        line(tracestartpos, midpoint, (0, 1, 0), 1, 1, frames);
        line(midpoint, var_41302affd456fcb3, (1, 0, 0), 1, 1, frames);
    #/
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0f
// Size: 0x7b
function function_51eac561da90b300(var_672f20a520d6c841, var_2f464ef8d2b3735b) {
    /#
        if (namespace_bf5a1761a8d1bb07::function_3271c00e44d9636b()) {
            forward = anglestoforward(var_2f464ef8d2b3735b);
            line(var_672f20a520d6c841, var_672f20a520d6c841 + forward * 16, (1, 0.4, 0), 1, 0, 1);
            line(var_672f20a520d6c841, var_672f20a520d6c841 + (0, 0, 64), (1, 0.4, 0), 1, 0, 1);
        }
    #/
}

// Namespace arrival/namespace_13be20d2eccdfd44
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b91
// Size: 0x33
function shouldstartarrivalpassthrough(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assertmsg("Function is only used by C6s at this point. Should not use again.");
    #/
    return 0;
}

