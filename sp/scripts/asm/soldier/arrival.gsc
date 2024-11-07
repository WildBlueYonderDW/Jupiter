#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\soldier\script_funcs.gsc;
#using scripts\asm\soldier\cover.gsc;

#namespace arrival;

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x438
// Size: 0x2d
function notshouldstartarrival(asmname, statename, tostatename, params) {
    return !shouldstartarrival(asmname, statename, params);
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46e
// Size: 0x10
function getmaxarrivaldistfornodetype(nodetype) {
    return 256;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x487
// Size: 0x218
function shouldstartarrival(asmname, statename, tostatename, params) {
    if (!self shoulddoarrival()) {
        return false;
    }
    if (!isdefined(self.pathgoalpos)) {
        return false;
    }
    node = getarrivalnode();
    if (!asm_eventfired(asmname, "cover_approach")) {
        return false;
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
    if (!isarrivaltype(asmname, statename, tostatename, nodetype)) {
        return false;
    }
    var_6b923ad9da57b2cf = distance(self.origin, self.pathgoalpos);
    var_1047326b5402e964 = getmaxarrivaldistfornodetype(nodetype);
    if (var_6b923ad9da57b2cf > var_1047326b5402e964) {
        return false;
    }
    var_5217df91f13c7c48 = 0;
    if (isdefined(params) && params.size > 1) {
        var_5217df91f13c7c48 = int(params[1]);
    }
    prefixstr = undefined;
    startnotetrack = undefined;
    endnotetrack = undefined;
    if (nodetype == "Exposed Moving") {
        endnotetrack = "code_move";
    }
    demeanor = asm_getdemeanor();
    if (demeanor == "casual" || demeanor == "casual_gun" || demeanor == "patrol") {
        var_ae21c8641e5e4f38 = 0.053;
        if (self pathdisttogoal() < 25) {
            var_ae21c8641e5e4f38 = 2;
        }
        self.asm.stopdata = calculatestopdata(asmname, statename, tostatename, nodetype, var_5217df91f13c7c48, undefined, prefixstr, var_ae21c8641e5e4f38, undefined, startnotetrack, endnotetrack);
    } else {
        self.asm.stopdata = calculatestopdata(asmname, statename, tostatename, nodetype, var_5217df91f13c7c48, undefined, prefixstr, undefined, undefined, startnotetrack, endnotetrack);
    }
    if (!isdefined(self.asm.stopdata)) {
        return false;
    }
    return true;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6a8
// Size: 0x3e
function shouldstartcasualarrivalaftercodemove(asmname, statename, tostatename, params) {
    if (!asm_eventfired(asmname, "code_move")) {
        return 0;
    }
    return shouldstartcasualarrival(asmname, statename, tostatename, params);
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6ef
// Size: 0x50
function shouldstartcasualarrival(asmname, statename, tostatename, params) {
    demeanor = asm_getdemeanor();
    if (!isdefined(params) || demeanor != params[2]) {
        return 0;
    }
    return shouldstartarrival(asmname, statename, tostatename, params);
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x748
// Size: 0x3e
function shouldstartcasualarrivalwithgunaftercodemove(asmname, statename, tostatename, params) {
    if (!asm_eventfired(asmname, "code_move")) {
        return 0;
    }
    return shouldstartcasualarrivalwithgun(asmname, statename, tostatename, params);
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x78f
// Size: 0x50
function shouldstartcasualarrivalwithgun(asmname, statename, tostatename, params) {
    demeanor = asm_getdemeanor();
    if (!isdefined(params) || demeanor != params[2]) {
        return 0;
    }
    return shouldstartarrival(asmname, statename, tostatename, params);
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7e8
// Size: 0x4b
function chooseanim_arrival(asmname, statename, params) {
    assert(isdefined(self.asm.stopdata));
    return self.asm.stopdata;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83c
// Size: 0x249
function function_cf21d79464e005d2(node) {
    nodepos = node.origin;
    if (shouldinitiallyattackfromexposed() && self._blackboard.var_4f2c03980416a4a9 != "none" && isdefined(node.type)) {
        switch (node.type) {
        case #"hash_667bc7e605903a6c":
        case #"hash_cd3ffe799551db82":
            if (self._blackboard.var_4f2c03980416a4a9 == "full_exposed") {
                offset = (-15, -44, 0);
                nodepos += rotatevector(offset, node.angles);
            } else if (self._blackboard.var_4f2c03980416a4a9 == "lean") {
                offset = (-6, -10, 0);
                nodepos += rotatevector(offset, node.angles);
            }
            break;
        case #"hash_55ed607005f12d49":
        case #"hash_e1d8e1adebed5a61":
            if (self._blackboard.var_4f2c03980416a4a9 == "full_exposed") {
                offset = (-15, 44, 0);
                nodepos += rotatevector(offset, node.angles);
            } else if (self._blackboard.var_4f2c03980416a4a9 == "lean") {
                offset = (-6, 10, 0);
                nodepos += rotatevector(offset, node.angles);
            }
            break;
        case #"hash_78b110033ccb68b0":
        case #"hash_c3b74422dec48736":
            assert(self._blackboard.var_4f2c03980416a4a9 == "full_exposed");
            offset = (-8, 0, 0);
            nodepos += rotatevector(offset, node.angles);
            break;
        case #"hash_961a09cded5ffc80":
            break;
        default:
            assertmsg("arrive to cover exposed stepout requested to an unimplemented/unexpected node type " + node.type);
            break;
        }
    }
    return nodepos;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0xa8e
// Size: 0x416
function calculatestopdata(asmname, statename, tostatename, nodetype, var_5217df91f13c7c48, var_6164202739d4a0fb, optionalprefix, var_a9d2a260c9698ff4, var_4795faf7dae203d5, startnotetrack, endnotetrack, speedstring) {
    node = getarrivalnode();
    var_cd19c4c27c506f73 = undefined;
    if (isdefined(node) && !self btgoalvalid() && isdefined(self.scriptedarrivalent) && self.scriptedarrivalent == node) {
        if (distance2dsquared(self.scriptedarrivalent.origin, self.pathgoalpos) > 4096) {
            if (!isdefined(self.scriptedarrivalent.calculatestopdatawarningtime) || self.scriptedarrivalent.calculatestopdatawarningtime < gettime() - level.frameduration) {
                self.scriptedarrivalent.calculatestopdatawarningtime = gettime();
            } else {
                assertmsg("actor has self.scriptedarrivalent that is nowhere near his goalpos. is it leftover from an interrupted anim_reach? you may need to call anim_reach_cleanup_solo().");
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
    flatdir = goalpos - self.origin;
    flatdir = vectornormalize((flatdir[0], flatdir[1], 0));
    if (vectordot(flatdir, anglestoforward(self.angles)) < 0.707) {
        return undefined;
    }
    if (nodetype == "Custom") {
        tostatename = self.var_a57082fdf62bc898;
        if (isdefined(self.var_33b4c07d1f388776)) {
            var_cd19c4c27c506f73 = self.var_33b4c07d1f388776;
        }
        var_5217df91f13c7c48 = self.var_171120e99df3e286;
    }
    if (!isdefined(optionalprefix)) {
        optionalprefix = "";
    }
    prefixfoot = "";
    if (var_5217df91f13c7c48) {
        foot = "left";
        if (asm_eventfiredrecently(asmname, "pass_left")) {
            foot = "left";
        } else if (asm_eventfiredrecently(asmname, "pass_right")) {
            foot = "right";
        } else if (self.asm.footsteps.foot == "right") {
            foot = "right";
        }
        if (isdefined(optionalprefix)) {
            prefixfoot = optionalprefix + foot;
        } else {
            prefixfoot = foot;
        }
    } else {
        prefixfoot = optionalprefix;
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
    result = self actorcalcstopdata(goalpos, angles, getcustomarrivalangles(), var_6164202739d4a0fb, var_eacf2fcf316960a0, tostatename, yaw, prefixfoot, optionalprefix, var_a9d2a260c9698ff4, var_4795faf7dae203d5, nodetype, startnotetrack, endnotetrack, speedstring, var_cd19c4c27c506f73);
    if (isdefined(result) && isdefined(node)) {
        result.var_e411f4722cf5136a = self._blackboard.var_4f2c03980416a4a9 != "none";
    }
    return result;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xead
// Size: 0x38
function playanim_waitforpathset(asmname, statename) {
    self endon("runto_arrived");
    self endon(statename + "_finished");
    self waittill("path_set");
    asm_fireevent(asmname, "abort");
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeed
// Size: 0x4e
function playanim_waitforpathclear(asmname, statename) {
    self endon("runto_arrived");
    self endon(statename + "_finished");
    while (true) {
        if (!isdefined(self.pathgoalpos)) {
            break;
        }
        wait 0.05;
    }
    asm_fireevent(asmname, "abort");
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf43
// Size: 0x44
function arrivalterminatewait(statename) {
    self endon("death");
    self.asm.arriving = statename;
    self waittill(statename + "_finished");
    self.asm.arriving = undefined;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf8f
// Size: 0xfe
function playanim_arrival_handlestandevent(asmname, statename, xanim, finalrate) {
    self endon(statename + "_finished");
    self.asm.arrivalstopfired = 0;
    movedelta = getmovedelta(xanim, 0, 1);
    animtime = getanimlength(xanim);
    decrement = 0.05 / animtime;
    for (currenttime = 1 - decrement; currenttime > 0; currenttime -= decrement) {
        partialmovedelta = getmovedelta(xanim, 0, currenttime);
        if (lengthsquared(movedelta - partialmovedelta) >= 64) {
            break;
        }
    }
    waittime = currenttime * animtime / finalrate;
    if (waittime > 0) {
        wait waittime;
    }
    self.asm.arrivalstopfired = 1;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1095
// Size: 0x18
function returnoncorner(note) {
    if (note == "corner") {
        return 1;
    }
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b5
// Size: 0x18
function returnonwarpstart(note) {
    if (note == "warp_arrival_start") {
        return 1;
    }
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10d5
// Size: 0x69
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

// Namespace arrival / scripts\asm\soldier\arrival
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1147
// Size: 0x7f4
function playanim_arrival(asmname, statename, params) {
    self endon(statename + "_finished");
    arrival_rate = 1;
    if (isdefined(params)) {
        arrival_rate = params;
    }
    self.asm.arrivalasmstatename = statename;
    self.a.arrivalasmstatename = statename;
    thread arrivalterminatewait(statename);
    stopdata = asm_getanim(asmname, statename);
    assertex(isdefined(stopdata), "Arrival forced to abort");
    if (!isdefined(stopdata)) {
        self orientmode("face motion");
        asm_fireevent(asmname, "abort", undefined);
        return;
    }
    self orientmode("face angle", self.angles[1]);
    facingangles = stopdata.finalangles;
    angleindex = stopdata.angleindex;
    facingyaw = (0, facingangles[1] - stopdata.angledelta, 0);
    var_55644d08241b1a7b = stopdata.startpos;
    var_f78bc5cde11694fc = facingyaw[1];
    if (isdefined(stopdata.parentpos) && isdefined(stopdata.parentangles)) {
        localdelta = stopdata.startpos - stopdata.parentpos;
        localdelta = rotatevectorinverted(localdelta, stopdata.parentangles);
        invangles = invertangles(stopdata.parentangles);
        localangles = combineangles(facingyaw, invangles);
        parentent = self getnavspaceent();
        assertex(isdefined(parentent), "Started arrival on a moving platform, is no longer on a moving platform. Path clear should have aborted this process.");
        localdelta = rotatevector(localdelta, parentent.angles);
        var_55644d08241b1a7b = localdelta + parentent.origin;
        newangles = combineangles(localangles, parentent.angles);
        var_f78bc5cde11694fc = newangles[1];
    }
    arrivalstatename = statename;
    if (isdefined(self.var_a57082fdf62bc898)) {
        arrivalstatename = self.var_a57082fdf62bc898;
    }
    stopanim = stopdata.stopanim;
    if (isdefined(self.asm.customdata) && isdefined(self.var_33b4c07d1f388776)) {
        self setoverridearchetype("animscript", self.var_33b4c07d1f388776, 1);
    }
    stopxanim = asm_getxanim(arrivalstatename, stopanim);
    arrival_node = getarrivalnode();
    if (isdefined(stopdata.customtargetpos)) {
        goalpos = stopdata.customtargetpos;
    } else {
        if (isdefined(arrival_node)) {
            goalpos = function_cf21d79464e005d2(arrival_node);
        } else {
            goalpos = self.pathgoalpos;
        }
        self._blackboard.var_9f2e830204cce981 = istrue(stopdata.var_e411f4722cf5136a);
    }
    if (!istrue(stopdata.bskipstartcoverarrival)) {
        self startcoverarrival();
    }
    if (animhasnotetrack(stopxanim, "code_move")) {
        self animmode("zonly_physics", 0);
        animrate = motionwarpwithnotetracks(stopxanim, goalpos, stopdata.finalangles, undefined, "corner", undefined);
        self aisetanim(arrivalstatename, stopanim, animrate);
        asm_donotetracks(asmname, statename, &returnoncorner, undefined, arrivalstatename);
        self aisetanim(arrivalstatename, stopanim, 1);
        asm_donotetracks(asmname, statename, undefined, undefined, arrivalstatename);
        return;
    }
    if (isdefined(self.var_18eb79d0deeb3b75)) {
        anim_mode = self.var_18eb79d0deeb3b75;
        self animmode(anim_mode);
    } else {
        self animmode("zonly_physics", 0);
    }
    asm_playfacialanim(asmname, statename, stopxanim);
    stoprate = 1;
    if (isdefined(goalpos)) {
        animdist = length(stopdata.movedelta);
        disttogoal = length(self.origin - goalpos);
        if (disttogoal > 1) {
            stoprate = animdist / length(self.origin - goalpos);
        }
        stoprate = clamp(stoprate, 0.8, 1.3);
    }
    finalrate = arrival_rate * stoprate;
    if (isdefined(self.asm.arrivalspeed)) {
        finalrate *= self.asm.arrivalspeed;
    }
    if (isdefined(self.arrivalspeedtarget) && isdefined(self.arrivaldesiredspeed) && isentasoldier() && demeanorhasblendspace()) {
        finalrate = self.arrivaldesiredspeed / self.arrivalspeedtarget;
        self.arrivaldesiredspeed = undefined;
        var_42d8ce9773183805 = 0.8;
        finalrate = max(var_42d8ce9773183805, finalrate);
    }
    thread playanim_arrival_handlestandevent(asmname, statename, stopxanim, finalrate);
    self aisetanim(arrivalstatename, stopanim, finalrate);
    end_time = 1;
    if (animhasnotetrack(stopxanim, "warp_arrival_start")) {
        assert(animhasnotetrack(stopxanim, "warp_arrival_end"));
        startnote = getnotetracktimes(stopxanim, "warp_arrival_start");
        endnote = getnotetracktimes(stopxanim, "warp_arrival_end");
        if (startnote[0] > 0) {
            asm_donotetracks(asmname, statename, &returnonwarpstart, undefined, arrivalstatename, 0);
        }
        animlength = getanimlength(stopxanim);
        warpstarttime = startnote[0];
        if (warpstarttime > 0) {
            warpstarttime = startnote[0] * animlength * 1000;
            warpstarttime -= mod(int(warpstarttime), level.frameduration);
            warpstarttime = warpstarttime / animlength / 1000;
        }
        end_time = endnote[0];
        duration = int((end_time - warpstarttime) * animlength / finalrate * 1000);
        duration += level.frameduration - mod(duration, level.frameduration);
        motionwarpwithtimes(stopxanim, goalpos, stopdata.finalangles, warpstarttime, 1, duration, 0);
    } else {
        warpduration = 500;
        if (animhasnotetrack(stopxanim, "start_aim")) {
            end_time = getnotetracktimes(stopxanim, "start_aim")[0];
            anim_length = getanimlength(stopxanim);
            warpduration = int(end_time * anim_length / finalrate * 1000);
            if (warpduration < 300 && anim_length / finalrate >= 0.15) {
                warpduration = 300;
            }
        }
        self motionwarpwithanim(var_55644d08241b1a7b, facingyaw, goalpos, stopdata.finalangles, warpduration);
    }
    if (!isagent(self)) {
        anime = asm_lookupanimfromaliasifexists(statename, "conceal_add");
        if (isdefined(anime) && isdefined(arrival_node) && isdefined(arrival_node.type) && (arrival_node.type == "Conceal Crouch" || arrival_node.type == "Conceal Stand")) {
            conceal_xanim = asm_getxanim(statename, anime);
            animlength = getanimlength(stopxanim);
            var_5ea036af2c7394cb = animlength * end_time * 0.3;
            thread scripts\asm\soldier\cover::start_conceal_add(statename, conceal_xanim, var_5ea036af2c7394cb);
        }
    }
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename), undefined, arrivalstatename);
    self.a.movement = "stop";
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1943
// Size: 0x1a
function getcustomarrivalangles() {
    if (isdefined(self.var_a41edf45bb0ff97)) {
        return self.var_a41edf45bb0ff97;
    }
    return undefined;
}

// Namespace arrival / scripts\asm\soldier\arrival
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1966
// Size: 0xf3
function getstopanims(asmname, statename, approachtype, var_5217df91f13c7c48, optionalprefix) {
    assert(!asm_hasalias(statename, "0"));
    assert(!asm_hasalias(statename, "5"));
    stopanims = [];
    stopanims[5] = asm_lookupdirectionalfootanim(1, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[4] = asm_lookupdirectionalfootanim(2, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[3] = asm_lookupdirectionalfootanim(3, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[6] = asm_lookupdirectionalfootanim(4, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[2] = asm_lookupdirectionalfootanim(6, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[7] = asm_lookupdirectionalfootanim(7, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[0] = asm_lookupdirectionalfootanim(8, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[1] = asm_lookupdirectionalfootanim(9, asmname, statename, var_5217df91f13c7c48, optionalprefix);
    stopanims[8] = stopanims[0];
    return stopanims;
}

/#

    // Namespace arrival / scripts\asm\soldier\arrival
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a62
    // Size: 0xa5
    function function_a6a36944d51a88a0(var_8e5cf88282523d3f, tracestartpos, finalpos, fraction, color, frames) {
        if (!scripts\asm\asm::function_3271c00e44d9636b()) {
            return;
        }
        line(var_8e5cf88282523d3f, var_8e5cf88282523d3f + (0, 0, 64), color, 1, 1, frames);
        midpoint = vectorlerp(tracestartpos, finalpos, fraction);
        line(tracestartpos, midpoint, (0, 1, 0), 1, 1, frames);
        line(midpoint, finalpos, (1, 0, 0), 1, 1, frames);
    }

    // Namespace arrival / scripts\asm\soldier\arrival
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b0f
    // Size: 0x7a
    function function_51eac561da90b300(goal_origin, var_2f464ef8d2b3735b) {
        if (scripts\asm\asm::function_3271c00e44d9636b()) {
            forward = anglestoforward(var_2f464ef8d2b3735b);
            line(goal_origin, goal_origin + forward * 16, (1, 0.4, 0), 1, 0, 1);
            line(goal_origin, goal_origin + (0, 0, 64), (1, 0.4, 0), 1, 0, 1);
        }
    }

#/

// Namespace arrival / scripts\asm\soldier\arrival
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b91
// Size: 0x32
function shouldstartarrivalpassthrough(asmname, statename, tostatename, params) {
    assertmsg("Function is only used by C6s at this point. Should not use again.");
    return false;
}

