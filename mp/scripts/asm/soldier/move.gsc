#using scripts\anim\utility_common;
#using scripts\anim\weaponlist;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\utility;
#using scripts\asm\soldier\script_funcs;
#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace move;

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc
// Size: 0x14a
function playanim_exit(asmname, statename, params) {
    self endon(statename + "_finished");
    startanim = asm_getanim(asmname, statename);
    self.var_57e1b0c4ad45db70 = undefined;
    if (isdefined(self.battlechatterallowed) && self.battlechatterallowed) {
        var_2e5e380655d9414 = issubstr(statename, "cover");
        thread movebattlechatter_helper(var_2e5e380655d9414);
    }
    if (!isdefined(startanim)) {
        desiredspeed = self aigetdesiredspeed();
        targetspeed = 50;
        if (targetspeed > desiredspeed) {
            targetspeed = 0.5 * desiredspeed;
        }
        self aisettargetspeed(targetspeed);
        asm_fireevent(asmname, "abort");
        asm_fireevent(asmname, "code_move");
        asm_fireevent(asmname, "end");
        asm_fireevent(asmname, "finish");
        return;
    }
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 1;
    var_bef3b4b769e8abe4 = 0;
    if (isdefined(params)) {
        var_bef3b4b769e8abe4 = params;
    }
    playstartanim(asmname, statename, startanim, var_bef3b4b769e8abe4);
    if (isdefined(self.exitspeedtarget)) {
        self aisettargetspeed(float(self.exitspeedtarget));
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x61e
// Size: 0x9b
function chooseanim_exit(asmname, statename, params) {
    var_ee2a14cc5b990a1b = 0;
    if (isdefined(params)) {
        if (isarray(params)) {
            var_ee2a14cc5b990a1b = istrue(params[0]);
        } else {
            var_ee2a14cc5b990a1b = istrue(params);
        }
    }
    if (var_ee2a14cc5b990a1b) {
        return chooseanim_exitsoldier(asmname, statename, params);
    }
    if (!checktransitionpreconditions()) {
        return undefined;
    }
    exitanim = undefined;
    var_8a1b6d26fbf96ea9 = 0;
    if (isdefined(params) && isarray(params) && isdefined(params[1])) {
        var_8a1b6d26fbf96ea9 = params[1];
    }
    exitanim = determinestartanim(statename, var_8a1b6d26fbf96ea9);
    return exitanim;
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c2
// Size: 0x35
function determinedesiredexitspeed() {
    var_a7d951a8f516dc41 = 70;
    desiredspeed = self getdesiredscaledspeedforposalongpath(var_a7d951a8f516dc41);
    if (self.cautiousnavigation) {
        desiredspeed = 90;
    }
    return desiredspeed;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x700
// Size: 0xd1
function chooseanim_exitsoldier(asmname, statename, params) {
    suffix = "";
    if (isentasoldier() && demeanorhasblendspace()) {
        desiredspeed = determinedesiredexitspeed();
        archetype = self getbasearchetype();
        suffix = getnextlowestspeedthresholdstring(archetype, desiredspeed);
        self.exitspeedtarget = getanimspeedthreshold(archetype, suffix);
    } else {
        self.exitspeedtarget = undefined;
    }
    if (!checktransitionpreconditions()) {
        return undefined;
    }
    exitanim = undefined;
    var_8a1b6d26fbf96ea9 = 0;
    if (isdefined(params) && isarray(params) && isdefined(params[1])) {
        var_8a1b6d26fbf96ea9 = params[1];
    }
    exitanim = determinestartanim(statename, var_8a1b6d26fbf96ea9, suffix);
    return exitanim;
}

// Namespace move / scripts\asm\soldier\move
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7da
// Size: 0xf0
function getstartanim(statename, optionalsuffix, idx, var_72c986bd4a45a6c1) {
    if (!isdefined(optionalsuffix)) {
        optionalsuffix = "";
    }
    assert(!asm_hasalias(statename, "<dev string:x1c>" + optionalsuffix));
    assert(!asm_hasalias(statename, "<dev string:x21>" + optionalsuffix));
    var_f9129a56a004cdb7 = [2, 3, 6, 9, 8, 7, 4, 1, 2];
    keypadidx = var_f9129a56a004cdb7[idx];
    if (keypadidx == 8) {
        if (var_72c986bd4a45a6c1 < 0) {
            aliasname = keypadidx + "r" + optionalsuffix;
        } else {
            aliasname = keypadidx + "l" + optionalsuffix;
        }
    } else {
        aliasname = keypadidx + optionalsuffix;
    }
    return asm_lookupanimfromaliasifexists(statename, aliasname);
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d3
// Size: 0x41
function getstartmindist() {
    demeanor = asm_getdemeanor();
    if (demeanor == "casual" || demeanor == "casual_gun" || self aigetdesiredspeed() <= 60) {
        return 75;
    }
    return 100;
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x91d
// Size: 0x106
function getexitnode() {
    exitnode = undefined;
    limit = 400;
    if (actor_is3d()) {
        limit = 1024;
    } else if (isdefined(self.heat)) {
        limit = 4096;
    }
    if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < limit) {
        exitnode = self.node;
    } else if (isdefined(self.prevnode) && distancesquared(self.origin, self.prevnode.origin) < limit) {
        exitnode = self.prevnode;
    }
    if (isdefined(self.heat) && !actor_is3d()) {
        if (isdefined(exitnode) && absangleclamp180(self.angles[1] - exitnode.angles[1]) > 30) {
            return undefined;
        }
    }
    return exitnode;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa2c
// Size: 0x569
function determinestartanim(statename, var_8a1b6d26fbf96ea9, optionalsuffix) {
    negstartnode = self getnegotiationstartnode();
    if (isdefined(negstartnode)) {
        goalpos = negstartnode.origin;
    } else {
        goalpos = self.pathgoalpos;
    }
    assert(isdefined(goalpos));
    exitnode = getexitnode();
    if (var_8a1b6d26fbf96ea9) {
        lookaheadpos = self.origin + self.lookaheaddir * self.lookaheaddist;
        var_5dce5380d64570b5 = lookaheadpos;
    } else {
        lookaheadpos = self getposonpath(128);
        var_5dce5380d64570b5 = self getposonpath(32);
    }
    lookaheadangles = vectortoangles(lookaheadpos - self.origin);
    nearlookaheadangles = vectortoangles(var_5dce5380d64570b5 - self.origin);
    if (nodeshouldfaceangles(exitnode) && !var_8a1b6d26fbf96ea9) {
        currentangles = exitnode.angles;
    } else {
        currentangles = self.angles;
    }
    anglediff = angleclamp180(lookaheadangles[1] - currentangles[1]);
    var_72c986bd4a45a6c1 = angleclamp180(nearlookaheadangles[1] - currentangles[1]);
    var_28f7bf20c229aedb = vectortoangles(self.lookaheaddir);
    var_8ebc075f7302487d = angleclamp180(var_28f7bf20c229aedb[1] - currentangles[1]);
    if (abs(var_8ebc075f7302487d) > 135 && abs(anglediff) < 90) {
        return undefined;
    }
    if (length2dsquared(self.velocity) > 64) {
        var_da6d2ebf4c7f03e4 = vectortoangles(self.velocity);
        if (abs(angleclamp180(var_da6d2ebf4c7f03e4[1] - lookaheadangles[1])) < 45) {
            return;
        }
    }
    mindist = getstartmindist();
    if (self pathdisttogoal(1) < mindist) {
        return;
    }
    angleindices = getangleindices(anglediff);
    curpossnapped = self getnavposition();
    idx = angleindices[0];
    startanim = undefined;
    if (isdefined(self.var_57e1b0c4ad45db70)) {
        startanim = getstartanim(self.var_57e1b0c4ad45db70, optionalsuffix, idx, var_72c986bd4a45a6c1);
    } else {
        startanim = getstartanim(statename, optionalsuffix, idx, var_72c986bd4a45a6c1);
    }
    if (!isdefined(self.var_57e1b0c4ad45db70)) {
        exitcover = issubstr(statename, "cover");
        var_8c94765ca587f86c = currentangles;
        if (exitcover && isdefined(exitnode)) {
            var_950fdaf84ee5363 = [-180, -135, -90, -90, -90, 90, 90, 135, -180];
            yawoffset = var_950fdaf84ee5363[idx];
            if (issubstr(statename, "left") && idx == 4) {
                yawoffset *= -1;
            }
            var_8c94765ca587f86c = (0, angleclamp(exitnode.angles[1] + yawoffset), 0);
        } else {
            var_fd659656ff546e = [180, -135, -90, -45, 0, 45, 90, 135, 180];
            yawoffset = var_fd659656ff546e[idx];
            var_8c94765ca587f86c = (0, angleclamp(self.angles[1] + yawoffset), 0);
        }
        fmindist = 20;
        animmovedelta = anglestoforward(var_8c94765ca587f86c);
        velocity = animmovedelta * self aigettargetspeed();
        movedelta = vectornormalize(animmovedelta) * 5;
        exitdata = self getadjustedexitdirection(fmindist, velocity, movedelta);
        switch (exitdata[0]) {
        case 1:
            exitdata[1] = vectornormalize(exitdata[1]);
            adjustedexitangles = vectortoangles(exitdata[1]);
            var_cbfa26d1fe952710 = math::wrap(-179, 179, angleclamp180(adjustedexitangles[1] - currentangles[1]));
            var_926edf5ccd852690 = getangleindices(var_cbfa26d1fe952710, 45);
            var_4b4b8fb40b0a2db2 = angleclamp180(var_8c94765ca587f86c[1] - currentangles[1]);
            currentexitangles = getangleindices(var_4b4b8fb40b0a2db2);
            newindex = var_926edf5ccd852690[0];
            for (i = var_926edf5ccd852690.size - 1; i >= 0; i--) {
                angleindex = var_926edf5ccd852690[i];
                if (angleindex == currentexitangles[0]) {
                    continue;
                } else if ((idx == 8 || idx == 0) && (angleindex == 8 || angleindex == 0)) {
                    continue;
                } else if (angleindex == idx) {
                    continue;
                }
                newindex = angleindex;
                break;
            }
            idx = newindex;
            self.asm.customdata.ignoreexitwarp = 1;
            startanim = getstartanim(statename, optionalsuffix, idx, var_72c986bd4a45a6c1);
            break;
        case 2:
            startanim = undefined;
            break;
        default:
            break;
        }
    }
    return startanim;
}

// Namespace move / scripts\asm\soldier\move
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf9e
// Size: 0x1b
function movebattlechatter_helper(var_2e5e380655d9414) {
    self endon("death");
    waitframe();
    movestartbattlechatter(var_2e5e380655d9414);
}

/#

    // Namespace move / scripts\asm\soldier\move
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xfc1
    // Size: 0x84
    function function_c0771b0b4a16ebde(statename) {
        if (getdvarint(@"hash_79e471363d9c6b91", 0) == 0) {
            return;
        }
        self notify("<dev string:x26>");
        self endon("<dev string:x3b>");
        self endon(statename + "<dev string:x50>");
        while (true) {
            print3d(self.origin + (0, 0, 72), "<dev string:x5d>", (1, 0.25, 0.25), 1, 2, 1);
            wait 0.05;
        }
    }

    // Namespace move / scripts\asm\soldier\move
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x104d
    // Size: 0x5a
    function function_ac721a17dab10e87(suffix, statename, node) {
        if (isdefined(suffix) && suffix != "<dev string:x62>") {
            thread function_c0771b0b4a16ebde(statename);
        }
        if (isdefined(node) && node.type != "<dev string:x6e>") {
            thread function_c0771b0b4a16ebde(statename);
        }
    }

#/

// Namespace move / scripts\asm\soldier\move
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10af
// Size: 0x4c7
function playstartanim(asmname, statename, startanim, var_bef3b4b769e8abe4) {
    self endon(statename + "_finished");
    lookaheadpos = self getposonpath(128);
    lookaheadangles = vectortoangles(lookaheadpos - self.origin);
    anglediff = angleclamp180(lookaheadangles[1] - self.angles[1]);
    startxanim = asm_getxanim(statename, startanim);
    var_370a8c08be55a7a5 = getnotetracktimes(startxanim, "code_move");
    cornertimes = getnotetracktimes(startxanim, "corner");
    warpstarttimes = getnotetracktimes(startxanim, "warp_exit_start");
    var_d9a20f501851b31e = getnotetracktimes(startxanim, "warp_exit_end");
    endtimefrac = 1;
    if (var_370a8c08be55a7a5.size > 0) {
        self.requestarrivalnotify = 1;
        endtimefrac = var_370a8c08be55a7a5[0];
    }
    var_f49f40eb39da8b4e = getangledelta3d(startxanim, 0, endtimefrac);
    self animmode("zonly_physics", 0);
    self setuseanimgoalweight(0.2);
    exitrate = self.moveplaybackrate;
    if (demeanorhasblendspace() && isentasoldier()) {
        exitrate = 1;
    }
    var_da09f2e04da7570e = getmovedelta(startxanim, 0, endtimefrac);
    var_c4ec2d674bc02eb4 = length(var_da09f2e04da7570e);
    var_9c52e37b49e97a0b = self getposonpath(var_c4ec2d674bc02eb4);
    if (var_c4ec2d674bc02eb4 > 1) {
        var_b46ed9e10e2b2da0 = var_9c52e37b49e97a0b - self getnavposition();
    } else {
        var_b46ed9e10e2b2da0 = self getposonpath(12) - self getnavposition();
    }
    var_2c820822533ffafc = vectortoyaw(var_b46ed9e10e2b2da0);
    asm_playfacialanim(asmname, statename, startxanim);
    self aisetanim(statename, startanim, exitrate);
    var_5c0d1cbfc351f2e1 = 1;
    animdata = spawnstruct();
    animdata.xanim = startxanim;
    if (isdefined(self.asm.customdata.ignoreexitwarp)) {
    } else if (cornertimes.size > 0) {
        cornertranslation = getmovedelta(startxanim, 0, cornertimes[0]);
        cornerdist = length(cornertranslation);
        var_583b1c0039d7eba0 = self getposonpath(cornerdist);
        var_5076fb03fb7166e3 = var_9c52e37b49e97a0b;
        if (var_c4ec2d674bc02eb4 - cornerdist < 2) {
            var_5076fb03fb7166e3 = self getposonpath(var_c4ec2d674bc02eb4 + 6);
        }
        var_f41896ed9d57f898 = var_5076fb03fb7166e3 - var_583b1c0039d7eba0;
        var_364f8dea82c92744 = vectortoyaw(var_f41896ed9d57f898);
        if (warpstarttimes.size > 0 && warpstarttimes[0] > 0 && warpstarttimes[0] < cornertimes[0]) {
            animdata.posalongpath = var_583b1c0039d7eba0;
            animdata.anglealongpath = var_364f8dea82c92744;
            animdata.endnote = "corner";
            if (var_d9a20f501851b31e.size > 0 && var_d9a20f501851b31e[0] < cornertimes[0]) {
                animdata.duration = int((var_d9a20f501851b31e[0] - warpstarttimes[0]) * getanimlength(startxanim) * 1000 / exitrate);
            }
        } else {
            motionwarpwithnotetracks(startxanim, var_583b1c0039d7eba0, (0, var_364f8dea82c92744, 0), undefined, "corner", undefined, 0);
        }
    } else if (warpstarttimes.size == 0 || warpstarttimes[0] == 0) {
        assertex(var_370a8c08be55a7a5.size > 0, "<dev string:x79>" + function_3c8848a3a11b2553(getanimname(startxanim)));
        duration = undefined;
        if (warpstarttimes.size > 0 && var_d9a20f501851b31e.size > 0 && var_d9a20f501851b31e[0] < var_370a8c08be55a7a5[0]) {
            duration = int((var_d9a20f501851b31e[0] - warpstarttimes[0]) * getanimlength(startxanim) * 1000);
        }
        motionwarpwithnotetracks(startxanim, var_9c52e37b49e97a0b, (0, var_2c820822533ffafc, 0), undefined, "code_move", duration, 0);
    }
    if (!isdefined(animdata.posalongpath)) {
        animdata.posalongpath = var_9c52e37b49e97a0b;
        animdata.anglealongpath = var_2c820822533ffafc;
        animdata.endnote = "code_move";
        if (warpstarttimes.size > 0 && var_d9a20f501851b31e.size > 0) {
            animdata.duration = int((var_d9a20f501851b31e[0] - warpstarttimes[0]) * getanimlength(startxanim) * 1000 / exitrate);
        }
    }
    groundent = self getgroundentity();
    if (isdefined(groundent)) {
        animdata = motionwarp_localizedata(animdata, groundent);
    }
    asm_donotetracks(asmname, statename, &handlewarpexitstart, animdata, undefined, !var_bef3b4b769e8abe4);
    self motionwarpcancel();
    if (var_bef3b4b769e8abe4) {
        self animmode("normal", 0);
        self orientmode("face motion");
        asm_donotetracks(asmname, statename);
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x157e
// Size: 0x9c
function motionwarp_localizedata(animdata, groundent) {
    var_d352089b1ad84c9f = invertangles(groundent.angles);
    var_ae6b4de373bb5886 = animdata.posalongpath - groundent.origin;
    var_175bb7a3f0ea3191 = rotatevector(var_ae6b4de373bb5886, var_d352089b1ad84c9f);
    animdata.posalongpath = var_175bb7a3f0ea3191;
    animdata.anglealongpath = combineangles((0, animdata.anglealongpath, 0), var_d352089b1ad84c9f);
    animdata.groundent = groundent;
    return animdata;
}

// Namespace move / scripts\asm\soldier\move
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1623
// Size: 0xd6
function motionwarp_getworldifydata(animdata) {
    posalongpath = undefined;
    anglealongpath = undefined;
    groundent = animdata.groundent;
    if (isdefined(groundent)) {
        var_175bb7a3f0ea3191 = animdata.posalongpath;
        var_ae6b4de373bb5886 = rotatevector(var_175bb7a3f0ea3191, groundent.angles);
        posalongpath = var_ae6b4de373bb5886 + groundent.origin;
        angles = combineangles(animdata.anglealongpath, groundent.angles);
        anglealongpath = angles[1];
        return [posalongpath, anglealongpath];
    }
    return [animdata.posalongpath, animdata.anglealongpath];
}

// Namespace move / scripts\asm\soldier\move
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1701
// Size: 0x11a
function handlewarpexitstart(note, params) {
    posalongpath = undefined;
    anglealongpath = undefined;
    if (note == "warp_exit_start" && !isdefined(self.asm.customdata.ignoreexitwarp)) {
        assert(isdefined(params) && isstruct(params));
        endnote = params.endnote;
        if (!isdefined(endnote)) {
            endnote = "warp_exit_end";
        }
        duration = undefined;
        if (isdefined(params.duration)) {
            duration = params.duration - params.duration % 50;
        }
        assert(animhasnotetrack(params.xanim, endnote));
        __a0 = motionwarp_getworldifydata(params);
        anglealongpath = __a0[1];
        posalongpath = __a0[0];
        motionwarpwithnotetracks(params.xanim, posalongpath, (0, anglealongpath, 0), "warp_exit_start", endnote, duration, 0);
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1823
// Size: 0x15d
function checktransitionpreconditions() {
    if (!isdefined(self.pathgoalpos)) {
        /#
            debug_arrival("<dev string:xab>" + self getentitynumber() + "<dev string:xc6>");
        #/
        return false;
    }
    if (!self.facemotion) {
        /#
            debug_arrival("<dev string:xab>" + self getentitynumber() + "<dev string:xea>");
        #/
        return false;
    }
    if (isdefined(self.disableexits) && self.disableexits) {
        /#
            debug_arrival("<dev string:xab>" + self getentitynumber() + "<dev string:x109>");
        #/
        return false;
    }
    if (self.stairsstate != "none") {
        /#
            debug_arrival("<dev string:xab>" + self getentitynumber() + "<dev string:x129>");
        #/
        return false;
    }
    mindist = 100;
    demeanor = asm_getdemeanor();
    if (asm_getdemeanor() == "casual" || asm_getdemeanor() == "casual_gun" || self aigetdesiredspeed() <= 60) {
        mindist = 50;
        if (istrue(self.disablearrivals)) {
            mindist = 25;
        }
    } else if (istrue(self.disablearrivals)) {
        mindist = 50;
    }
    if (self pathdisttogoal() < mindist) {
        /#
            debug_arrival("<dev string:xab>" + self getentitynumber() + "<dev string:x139>");
        #/
        return false;
    }
    return true;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1989
// Size: 0x161
function function_b2fce9f29bd45cc3(asmname, statename, params) {
    self.runngun = 1;
    assertex(isdefined(self.enemy), "<dev string:x151>");
    var_63a5b32b096323be = self getshootfrompos();
    targetposstruct = self getshootpos(var_63a5b32b096323be);
    if (isdefined(targetposstruct)) {
        targetpos = targetposstruct.shootpos;
    } else {
        targetpos = self lastknownpos(self.enemy);
    }
    var_84dba057067c3c3e = targetpos - self getposonpath(14);
    var_51da48562495c03a = vectortoyaw(var_84dba057067c3c3e);
    pathyaw = vectortoyaw(self.lookaheaddir);
    var_43810d21f771f553 = angleclamp180(var_51da48562495c03a - pathyaw);
    var_9bed543f317c7601 = -1;
    if (var_43810d21f771f553 > 100) {
        var_9bed543f317c7601 = asm_lookupanimfromalias(statename, "run_n_gun_hard_left");
    } else if (var_43810d21f771f553 < -100) {
        var_9bed543f317c7601 = asm_lookupanimfromalias(statename, "run_n_gun_hard_right");
    } else if (var_43810d21f771f553 > 0) {
        var_9bed543f317c7601 = asm_lookupanimfromalias(statename, "run_n_gun_soft_left");
    } else {
        var_9bed543f317c7601 = asm_lookupanimfromalias(statename, "run_n_gun_soft_right");
    }
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 0;
    self function_952292d70c3bd39c();
    return var_9bed543f317c7601;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1af3
// Size: 0x39
function stoprunngun(asmname, statename, params) {
    self.runngun = 0;
    self.runngundisableaim = 0;
    self.baimedataimtarget = 0;
}

// Namespace move / scripts\asm\soldier\move
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b34
// Size: 0x488
function shouldstrafeaimchange(asmname, statename, tostatename, params) {
    var_c7662529da3a7f64 = 1;
    if (var_c7662529da3a7f64) {
        return false;
    }
    if (!isdefined(self.asm.strafe_foot)) {
        return false;
    }
    if (!isdefined(self.pathgoalpos)) {
        return false;
    }
    if (self getreacquirestate() == "enabled") {
        return false;
    }
    if (isonanystairs()) {
        return false;
    }
    var_f290d7530d6aba37 = self getstairsenterdist();
    var_50cfd72556c53ee8 = self getstairsstateatdist(var_f290d7530d6aba37);
    if (var_50cfd72556c53ee8 != "none") {
        return false;
    }
    targetspeed = self aigettargetspeed();
    if (self.lookaheaddist < 90) {
        return false;
    }
    pathyaw = vectortoyaw(self.lookaheaddir);
    if (vectordot(vectornormalize(self.velocity), vectornormalize(self.lookaheaddir)) < 0.9) {
        return false;
    }
    var_8c3ab01d2f494a38 = self asmeventfiredwithin(asmname, "sharp_turn", 50);
    if (var_8c3ab01d2f494a38) {
        var_185171d0a16d0416 = angleclamp180(pathyaw - self.angles[1]);
        var_c1350e6cda2f627a = angleclamp180(vectortoyaw(self.velocity) - self.angles[1]);
        if (abs(angleclamp180(var_c1350e6cda2f627a - var_185171d0a16d0416)) > 45) {
            return false;
        }
    } else {
        var_c1350e6cda2f627a = angleclamp180(pathyaw - self.angles[1]);
    }
    var_63a5b32b096323be = self getshootfrompos();
    targetposstruct = self getshootpos(var_63a5b32b096323be);
    if (self.facemotion || self.predictedfacemotion || self shouldcautiousstrafe()) {
        var_43810d21f771f553 = 0;
    } else if (isdefined(targetposstruct) || self iscurrentenemyvalid()) {
        if (isdefined(targetposstruct)) {
            targetpos = targetposstruct.shootpos;
        } else {
            if (issentient(self.enemy) && gettime() - self lastknowntime(self.enemy) > 2000) {
                return false;
            }
            targetpos = self lastknownpos(self.enemy);
        }
        if (distance2dsquared(targetpos, self.origin) < 22500) {
            return false;
        }
        var_84dba057067c3c3e = targetpos - self getposonpath(32);
        var_51da48562495c03a = vectortoyaw(var_84dba057067c3c3e);
        if (abs(angleclamp180(var_51da48562495c03a - self.angles[1])) < 45) {
            return false;
        }
        var_43810d21f771f553 = angleclamp180(pathyaw - var_51da48562495c03a);
    } else if (istrue(self._blackboard.forcestrafe)) {
        return false;
    } else {
        if (var_8c3ab01d2f494a38 || self pathdisttogoal() < 64) {
            return false;
        }
        var_43810d21f771f553 = angleclamp180(pathyaw - self.desiredangle);
    }
    if (abs(angleclamp180(var_c1350e6cda2f627a - var_43810d21f771f553)) < 45) {
        return false;
    }
    curdir = scripts\asm\asm::yawdiffto2468(var_c1350e6cda2f627a);
    desireddir = scripts\asm\asm::yawdiffto2468(var_43810d21f771f553);
    if (curdir == desireddir) {
        return false;
    }
    speedstring = "fast";
    if (isentasoldier() && demeanorhasblendspace()) {
        archetype = self getbasearchetype();
        speedstring = getnearestspeedthresholdname(archetype, targetspeed);
        if (speedstring == "shuffle" || speedstring == "walk") {
            speedstring = "walk";
        } else if (speedstring != "fast") {
            speedstring = "fast";
        }
        self.strafepoispeedtarget = getanimspeedthreshold(archetype, speedstring);
    } else {
        self.strafepoispeedtarget = undefined;
    }
    alias = speedstring + "_" + self.asm.strafe_foot + "_" + curdir + "_to_" + desireddir;
    if (!asm_hasalias(tostatename, alias)) {
        if (curdir == "4" || curdir == "6") {
            alias = speedstring + "_feet_together_" + curdir + "_to_" + desireddir;
        } else {
            alias = speedstring + "_foot_l_forward_" + curdir + "_to_" + desireddir;
        }
        if (!asm_hasalias(tostatename, alias)) {
            return false;
        }
    }
    self.asm.strafeaimchangealias = alias;
    return true;
}

// Namespace move / scripts\asm\soldier\move
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc5
// Size: 0x44
function shouldrestartaimchange(asmname, statename, tostatename, params) {
    if (asm_eventfired(asmname, "code_move") && shouldstrafeaimchange(asmname, statename, tostatename, params)) {
        return true;
    }
    return false;
}

// Namespace move / scripts\asm\soldier\move
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2012
// Size: 0x1ee
function aimchangeorientation(turnxanim, rate, endtime, var_da53c72859d22ed6, var_f5704b6af9b1e950) {
    self endon("end_aim_change_orient");
    self.aimchange_oldturnrate = self.turnrate;
    var_c6741e13d5c04d5a = getangledelta(turnxanim, 0, endtime);
    var_935ce979bb3ef270 = var_da53c72859d22ed6 - self.angles[1];
    var_935ce979bb3ef270 = angleclamp180(var_935ce979bb3ef270);
    var_573cd9df7b140b5a = angleclamp180(var_935ce979bb3ef270 - var_c6741e13d5c04d5a);
    var_74fb9d076076aa21 = var_c6741e13d5c04d5a;
    while (isdefined(self) && isalive(self)) {
        currentanimtime = self aigetanimtime(turnxanim);
        var_28f83227b5dbdea8 = min(currentanimtime + level.frameduration / 1000 / var_f5704b6af9b1e950 * rate, 1);
        var_8ccbb038d1a5d254 = getangledelta(turnxanim, currentanimtime, var_28f83227b5dbdea8);
        if ((var_74fb9d076076aa21 - var_8ccbb038d1a5d254) * var_74fb9d076076aa21 > 0) {
            var_74fb9d076076aa21 -= var_8ccbb038d1a5d254;
        } else {
            var_8ccbb038d1a5d254 = var_74fb9d076076aa21;
            var_74fb9d076076aa21 = 0;
        }
        lerpfraction = var_8ccbb038d1a5d254 / var_c6741e13d5c04d5a;
        var_bac2c21af365572b = var_573cd9df7b140b5a * lerpfraction;
        var_d5655124cc692c6f = var_8ccbb038d1a5d254 + var_bac2c21af365572b;
        faceangle = angleclamp(self.angles[1] + var_d5655124cc692c6f);
        var_6b38b069b1d09ad = angleclamp(self.angles[1] + clamp(var_d5655124cc692c6f * 3, -179, 179.9));
        self orientmode("face angle", var_6b38b069b1d09ad);
        if (var_d5655124cc692c6f != 0) {
            turnrate = abs(angleclamp180(self.angles[1] - faceangle)) / level.frameduration;
            if (turnrate > 0) {
                self.turnrate = turnrate;
            }
        }
        waitframe();
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2208
// Size: 0x32c
function playanim_strafeaimchange(asmname, statename, params) {
    self endon(statename + "_finished");
    animindex = asm_getanim(asmname, statename);
    turnxanim = asm_getxanim(statename, animindex);
    self.asm.strafeaimchangealias = undefined;
    self.sharpturnforceusevelocity = 1;
    rate = 1;
    exitspeed = undefined;
    if (isdefined(self.strafepoispeedtarget) && isentasoldier() && demeanorhasblendspace()) {
        targetspeed = self aigettargetspeed();
        rate = targetspeed / self.strafepoispeedtarget;
        exitspeed = targetspeed;
        rate = clamp(rate, 0.6, 1.4);
    }
    self aisetanim(statename, animindex, rate);
    asm_playfacialanim(asmname, statename, turnxanim);
    var_1cf3cc2bfbd90835 = getnotetracktimes(turnxanim, "code_move");
    finishnotes = getnotetracktimes(turnxanim, "finish");
    endtime = 1;
    if (var_1cf3cc2bfbd90835.size > 0) {
        endtime = var_1cf3cc2bfbd90835[0];
    } else if (finishnotes.size > 0) {
        endtime = finishnotes[0];
    }
    var_f5704b6af9b1e950 = getanimlength(turnxanim);
    animlength = var_f5704b6af9b1e950 * endtime;
    var_da53c72859d22ed6 = vectortoyaw(self.lookaheaddir);
    facetargetpos = undefined;
    if (!istrue(self.facemotion) && !istrue(self.predictedfacemotion) && !self shouldcautiousstrafe()) {
        animmovedelta = getmovedelta(turnxanim, 0, endtime);
        pathendpos = self getposonpath(length(animmovedelta));
        var_63a5b32b096323be = self getshootfrompos();
        targetposstruct = self getshootpos(var_63a5b32b096323be);
        enemypos = undefined;
        if (isdefined(targetposstruct)) {
            enemypos = targetposstruct.shootpos;
        } else if (isdefined(self.enemy)) {
            enemypos = self lastknownpos(self.enemy);
        }
        if (isdefined(enemypos)) {
            var_84dba057067c3c3e = vectornormalize(enemypos - pathendpos);
            var_da53c72859d22ed6 = vectortoyaw(var_84dba057067c3c3e);
            facetargetpos = enemypos;
        }
    }
    thread aimchangeorientation(turnxanim, rate, endtime, var_da53c72859d22ed6, var_f5704b6af9b1e950);
    note = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    self notify("end_aim_change_orient");
    if (isdefined(self.aimchange_oldturnrate)) {
        if (self.aimchange_oldturnrate > 0) {
            self.turnrate = self.aimchange_oldturnrate;
        }
        self.aimchange_oldturnrate = undefined;
    }
    if (note == "code_move") {
        if (isdefined(facetargetpos)) {
            self orientmode("face point", facetargetpos);
        } else {
            self orientmode("face angle", var_da53c72859d22ed6);
        }
        self animmode("normal");
        asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    }
    if (isdefined(exitspeed)) {
        self aisettargetspeed(exitspeed);
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x253c
// Size: 0x52
function chooseanim_strafeaimchange(asmname, statename, params) {
    assert(isdefined(self.asm.strafeaimchangealias));
    return asm_lookupanimfromalias(statename, self.asm.strafeaimchangealias);
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2597
// Size: 0x56
function strafeaimchange_cleanup(asmname, statename, params) {
    self notify("end_aim_change_orient");
    if (isdefined(self.aimchange_oldturnrate)) {
        self.turnrate = self.aimchange_oldturnrate;
        self.aimchange_oldturnrate = undefined;
    }
    self.sharpturnforceusevelocity = 0;
}

// Namespace move / scripts\asm\soldier\move
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25f5
// Size: 0x118
function handlestrafenotetracks(note) {
    switch (note) {
    case #"hash_e13cf484a444d070":
        self.asm.strafe_foot = "feet_together";
        self.asm.strafe_foot_time = gettime();
        break;
    case #"hash_622de61830d10b28":
        self.asm.strafe_foot = "feet_apart";
        self.asm.strafe_foot_time = gettime();
        break;
    case #"hash_725f3a6c07952190":
        self.asm.strafe_foot = "foot_l_forward";
        self.asm.strafe_foot_time = gettime();
        break;
    case #"hash_e81afc35eec1256e":
        self.asm.strafe_foot = "foot_r_forward";
        self.asm.strafe_foot_time = gettime();
        break;
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2715
// Size: 0xac
function playanim_strafereverse(asmname, statename, params) {
    self endon(statename + "_finished");
    zonlytime = 0.4;
    var_878ed8f396ed59bd = asm_getanim(asmname, statename);
    self aisetanim(statename, var_878ed8f396ed59bd);
    self orientmode("face enemy or motion");
    self setstrafereverse(1);
    endnote = asm_donotetracks(asmname, statename, undefined, undefined, undefined, 0);
    if (endnote == "code_move") {
        self animmode("normal");
        endnote = asm_donotetracks(asmname, statename, undefined, undefined, undefined, 0);
    }
    asm_fireevent(asmname, "end");
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27c9
// Size: 0x23
function strafereverse_cleanup(asmname, statename, params) {
    self setstrafereverse(0);
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27f4
// Size: 0x4b
function chooseanim_strafearrive(asmname, statename, params) {
    assert(isdefined(self.asm.strafearrival_animindex));
    return self.asm.strafearrival_animindex;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2848
// Size: 0x8f
function choosewalkandtalkanims(asmname, statename, params) {
    animstruct = spawnstruct();
    moveanims = [];
    moveanims[0] = asm_lookupanimfromalias(statename, "0");
    moveanims[1] = asm_lookupanimfromalias(statename, "1");
    moveanims[2] = asm_lookupanimfromalias(statename, "2");
    animstruct.anims = moveanims;
    animstruct.forwardanim = asm_lookupanimfromalias(statename, "forward");
    return animstruct;
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e0
// Size: 0x37
function shouldwalkandtalk() {
    return bb_moverequested() && isdefined(self._blackboard.walk_and_talk_requested) && self._blackboard.walk_and_talk_requested;
}

// Namespace move / scripts\asm\soldier\move
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2920
// Size: 0x2d
function walkandtalkdonotetracks(asmname, statename) {
    self endon(statename + "_finished");
    while (true) {
        asm_donotetracks(asmname, statename);
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2955
// Size: 0x3c9
function movewalkandtalk(asmname, statename, params) {
    self endon(statename + "_finished");
    self.requestarrivalnotify = 1;
    rate = asm_getmoveplaybackrate();
    asm_updatefrantic();
    self codemoveanimrate(rate);
    asm_updatefrantic();
    animstruct = asm_getanim(asmname, statename);
    anims = animstruct.anims;
    forwardanim = animstruct.forwardanim;
    self aiclearanim(asm_getbodyknob(), 0.2);
    self setflaggedanim(statename, forwardanim, 1, 0.2, 1);
    thread walkandtalkdonotetracks(asmname, statename);
    lastangle = 0;
    blendframes = 20;
    while (true) {
        arrival = asm_eventfired(asmname, "cover_approach");
        disttogoal = self pathdisttogoal();
        if (arrival && disttogoal < 150) {
            anglediff = anglediffwalkandtalk();
            index = 1;
            while (index <= blendframes) {
                i = index / blendframes;
                result = i * i * (3 - 2 * i);
                transitiondegree = anglediff;
                actualangle = transitiondegree * result;
                var_1b374815fb658b4b = transitiondegree - actualangle;
                animweights = getwalkandtalkanimweights(var_1b374815fb658b4b);
                for (animindex = 0; animindex < animweights.size; animindex++) {
                    self setanim(anims[animindex], animweights[animindex], 0.2, 1, 1);
                }
                index++;
                wait 0.05;
                waittillframeend();
            }
            while (arrival) {
                animweights = getwalkandtalkanimweights(0);
                for (index = 0; index < animweights.size; index++) {
                    if (isdefined(anims[index])) {
                        self setanim(anims[index], animweights[index], 0.2, 1, 1);
                    }
                }
                wait 0.05;
                waittillframeend();
            }
            continue;
        }
        anglediff = anglediffwalkandtalk();
        largetransition = lastangle - anglediff;
        if (largetransition < 0) {
            largetransition *= -1;
        }
        if (largetransition >= 60) {
            var_7b7e39cb9a3fc1d3 = lastangle;
            var_71ea1ef57b26f1b9 = lastangle;
            index = 1;
            while (index <= blendframes) {
                anglediff = anglediffwalkandtalk();
                var_14d30308b9f18e3f = var_7b7e39cb9a3fc1d3 - anglediff;
                if (var_14d30308b9f18e3f < 0) {
                    var_14d30308b9f18e3f *= -1;
                }
                if (var_14d30308b9f18e3f >= 60) {
                    if (index == 1) {
                        index = 1;
                    } else {
                        index -= 1;
                    }
                    newangle = var_7b7e39cb9a3fc1d3 - lastangle;
                    i = index / blendframes;
                    result = i * i * (3 - 2 * i);
                    var_5aa9c8971ae96b16 = newangle * result;
                    var_71ea1ef57b26f1b9 = var_5aa9c8971ae96b16 + lastangle;
                    index = 1;
                    lastangle = var_71ea1ef57b26f1b9;
                }
                i = index / blendframes;
                result = i * i * (3 - 2 * i);
                transitiondegree = anglediff - var_71ea1ef57b26f1b9;
                actualangle = transitiondegree * result;
                var_1b374815fb658b4b = actualangle + lastangle;
                animweights = getwalkandtalkanimweights(var_1b374815fb658b4b);
                for (animindex = 0; animindex < animweights.size; animindex++) {
                    self setanim(anims[animindex], animweights[animindex], 0.2, 1, 1);
                }
                index++;
                var_7b7e39cb9a3fc1d3 = anglediff;
                wait 0.05;
                waittillframeend();
            }
        } else {
            animweights = getwalkandtalkanimweights(anglediff);
            for (index = 0; index < animweights.size; index++) {
                if (isdefined(anims[index])) {
                    self setanim(anims[index], animweights[index], 0.2, 1, 1);
                }
            }
            wait 0.05;
            waittillframeend();
        }
        lastangle = anglediff;
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d26
// Size: 0x13a
function anglediffwalkandtalk() {
    targetpos = self.walk_and_talk_target.origin;
    actorpos = self.origin;
    offsetdir = targetpos - actorpos;
    facingdir = anglestoforward(self.angles);
    cross = vectorcross(facingdir, offsetdir);
    crossnormalize = vectornormalize(cross);
    offsetnorm = vectornormalize(offsetdir);
    facingnorm = vectornormalize(facingdir);
    dot = vectordot(offsetnorm, facingnorm);
    if (isdefined(self.walk_and_talk_hemisphere)) {
        anglediff = math::anglebetweenvectors(offsetdir, facingdir);
        if (self.walk_and_talk_hemisphere == "right") {
            if (dot <= -1) {
                return -180;
            }
            return (anglediff * -1);
        } else {
            if (dot >= 1) {
                return 180;
            }
            return anglediff;
        }
        return;
    }
    if (dot >= 1) {
        return 180;
    }
    if (dot <= -1) {
        return -180;
    }
    anglediff = math::anglebetweenvectors(offsetdir, facingdir);
    if (crossnormalize[2] == -1) {
        anglediff *= -1;
    }
    return anglediff;
}

// Namespace move / scripts\asm\soldier\move
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e68
// Size: 0xe2
function getwalkandtalkanimweights(yaw) {
    animweights = [];
    for (index = 0; index < 3; index++) {
        animweights[index] = 0;
    }
    var_2d702ddb2a9c3231 = [-180, 0, 180];
    for (index = 0; yaw >= var_2d702ddb2a9c3231[index]; index++) {
        assert(index < var_2d702ddb2a9c3231.size);
    }
    last_index = index - 1;
    next_index = index;
    assert(index > 0 && index <= 3);
    var_e0c8607002f43670 = (yaw - var_2d702ddb2a9c3231[last_index]) / (var_2d702ddb2a9c3231[next_index] - var_2d702ddb2a9c3231[last_index]);
    var_538bf88f24008653 = 1 - var_e0c8607002f43670;
    animweights[last_index] = var_538bf88f24008653;
    animweights[next_index] = var_e0c8607002f43670;
    animweights[1] = max(0.01, animweights[1]);
    return animweights;
}

// Namespace move / scripts\asm\soldier\move
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f53
// Size: 0x4b
function movestartbattlechatter(var_2e5e380655d9414) {
    movetype = scripts\asm\asm::asm_getdemeanor();
    if (movetype == "frantic" || movetype == "combat" || movetype == "sprint") {
        function_216c67ab6749137a(self, undefined, "move", var_2e5e380655d9414);
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa6
// Size: 0x77
function shouldreloadwhilemoving(asmname, statename, tostatename, params) {
    if (!scripts\asm\asm_bb::bb_reloadrequested()) {
        return false;
    }
    archetype = self getbasearchetype();
    if (isspeedwithincqbrange(archetype, self aigetdesiredspeed())) {
        mindist = 500;
    } else {
        mindist = 600;
    }
    disttogoal = self pathdisttogoal();
    return mindist < disttogoal;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3026
// Size: 0x5a
function choosereloadwhilemoving(asmname, statename, params) {
    alias = "reload";
    archetype = self getbasearchetype();
    if (isspeedwithincqbrange(archetype, self aigetdesiredspeed())) {
        alias = "cqbreload";
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3089
// Size: 0x66
function playreloadwhilemoving(asmname, statename, params) {
    self endon(statename + "_finished");
    self.requestarrivalnotify = 1;
    reloadanim = asm_getanim(asmname, statename);
    self aisetanim(statename, reloadanim);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, reloadanim));
    asm_donotetracks(asmname, statename);
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30f7
// Size: 0x3b
function terminatereloadwhilemoving(asmname, statename, params) {
    if (!scripts\asm\asm::asm_eventfired(asmname, "reload done")) {
        scripts\anim\weaponlist::refillclip();
    }
    scripts\asm\soldier\script_funcs::reload_cleanup(asmname, statename, params);
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x313a
// Size: 0x1f
function isonanystairs() {
    return isdefined(self.pathgoalpos) && self.stairsstate != "none";
}

// Namespace move / scripts\asm\soldier\move
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3162
// Size: 0x36
function getgroundangle() {
    slope = self actorgetgroundslope();
    if (abs(slope) > 0.99) {
        return 0;
    }
    riserun = acos(slope);
    return riserun;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31a1
// Size: 0xd4
function chooseanim_stairs(asmname, statename, params) {
    assert(isdefined(self.asm.footsteps.foot));
    if (self.asm.footsteps.foot == "left") {
        alias = "right";
    } else {
        alias = "left";
    }
    archetype = self getbasearchetype();
    if (isspeedwithincqbrange(archetype, self aigetdesiredspeed())) {
        var_7e147d94763036ac = "cqb" + alias;
        if (asm_hasalias(statename, var_7e147d94763036ac)) {
            alias = var_7e147d94763036ac;
        }
    }
    stairsanim = asm_lookupanimfromalias(statename, alias);
    return stairsanim;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x327e
// Size: 0xe9
function chooseanim_stairs_rise_run(asmname, statename, params) {
    alias = "8x10";
    angle = getgroundangle();
    if (angle < 27.75) {
        alias = "8x20";
    }
    if (angle >= 27.75 && angle < 36.2) {
        alias = "8x12";
    }
    if (angle >= 36.2 && angle < 41.85) {
        alias = "8x10";
    }
    if (angle >= 41.85) {
        alias = "8x8";
    }
    archetype = self getbasearchetype();
    if (isspeedwithincqbrange(archetype, self aigetdesiredspeed())) {
        var_7e147d94763036ac = "cqb" + alias;
        if (asm_hasalias(statename, var_7e147d94763036ac)) {
            alias = var_7e147d94763036ac;
        }
    }
    stairsanim = asm_lookupanimfromalias(statename, alias);
    return stairsanim;
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3370
// Size: 0x2e5
function slopeupdate(asmname, statename, params) {
    if (isagent(self)) {
        return;
    }
    if (isdefined(self.useslopes) && self.useslopes == 1) {
        var_873556140ea95085 = 0;
        var_d3ee4b860b00683f = 0;
        var_8c6d33f889f4ea11 = (0, 0, 1);
        self endon(statename + "_finished");
        addknob = asm_lookupanimfromalias(statename, statename + "_knob");
        addanim = asm_getxanim(statename, addknob);
        var_3e9fff4931014eb8 = asm_lookupanimfromalias(statename, statename + "_scrub_anim");
        scrubanim = asm_getxanim(statename, var_3e9fff4931014eb8);
        self setanim(addanim, 1, 0.1, 0);
        self setanim(scrubanim, 1, 0.1, 0);
        while (true) {
            rayinfo = ray_trace(self.origin + (0, 0, 12), self.origin - (0, 0, 999));
            raynormal = rayinfo["normal"];
            raynormal = vectorlerp(var_8c6d33f889f4ea11, raynormal, 0.25);
            var_8c6d33f889f4ea11 = raynormal;
            var_753cc7857ed5a9ed = anglestoup(self.angles);
            normproj = math::vector_project_onto_plane(raynormal, var_753cc7857ed5a9ed);
            yawangles = self.angles;
            anglesforward = anglestoforward(yawangles);
            normang = anglebetweenvectorssigned(anglesforward, normproj, var_753cc7857ed5a9ed);
            var_873556140ea95085 = normang + 180;
            var_e08b4ab11320959 = raynormal[2];
            var_d3ee4b860b00683f = math::normalize_value(1, 0.707, var_e08b4ab11320959);
            var_d3ee4b860b00683f = 1 - var_d3ee4b860b00683f;
            self setanim(addanim, var_d3ee4b860b00683f, 0.2, 0);
            self setcustomnodegameparameter("slopes_scrub_direction", var_873556140ea95085);
            /#
                line(self.origin, self.origin + 300 * anglesforward, (1, 0, 0), 4);
                line(self.origin, self.origin + 300 * raynormal, (0, 1, 0), 4);
                line(self.origin, self.origin + 300 * normproj, (0, 0, 1), 4);
                print3d(self.origin + (24, 0, 66), "<dev string:x1a8>" + var_873556140ea95085 + "<dev string:x1b3>" + var_d3ee4b860b00683f, (0.5, 0.5, 0.75), 1, 0.45, 1);
            #/
            waitframe();
        }
    }
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x365d
// Size: 0x58
function slopecleanup(asmname, statename, params) {
    if (isagent(self)) {
        return;
    }
    knob = asm_lookupanimfromalias(statename, statename + "_knob");
    self clearanim(asm_getxanim(statename, knob), 0.1, "ease_inout_quad");
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x36bd
// Size: 0xaf
function stumblechooseanim(asmname, statename, params) {
    archetype = self getbasearchetype();
    runthreshold = getanimspeedthreshold(archetype, "run");
    sprintthreshold = getanimspeedthreshold(archetype, "sprint");
    speed = length(self.velocity);
    alias = "stumble_jog";
    if (isdefined(sprintthreshold) && speed > sprintthreshold) {
        alias = "stumble_sprint";
    }
    if (isdefined(runthreshold) && speed > runthreshold) {
        alias = "stumble_run";
    }
    return asm_chooseanim(asmname, statename, alias);
}

// Namespace move / scripts\asm\soldier\move
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3775
// Size: 0x45
function playanim_stumble(asmname, statename, params) {
    self.requestarrivalnotify = 1;
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 0;
    asm_playanimstate(asmname, statename, params);
}

