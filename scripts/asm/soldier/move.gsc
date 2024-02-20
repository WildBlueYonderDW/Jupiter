// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\anim\weaponlist.gsc;
#using scripts\asm\soldier\script_funcs.gsc;

#namespace move;

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x14e
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a5
// Size: 0x9d
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64a
// Size: 0x36
function determinedesiredexitspeed() {
    var_a7d951a8f516dc41 = 70;
    desiredspeed = self getdesiredscaledspeedforposalongpath(var_a7d951a8f516dc41);
    if (self.cautiousnavigation) {
        desiredspeed = 90;
    }
    return desiredspeed;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x688
// Size: 0xd5
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x765
// Size: 0xf2
function getstartanim(statename, var_b63e3aa50397f874, idx, var_72c986bd4a45a6c1) {
    if (!isdefined(var_b63e3aa50397f874)) {
        var_b63e3aa50397f874 = "";
    }
    /#
        assert(!asm_hasalias(statename, "0" + var_b63e3aa50397f874));
    #/
    /#
        assert(!asm_hasalias(statename, "5" + var_b63e3aa50397f874));
    #/
    var_f9129a56a004cdb7 = [0:2, 1:3, 2:6, 3:9, 4:8, 5:7, 6:4, 7:1, 8:2];
    var_993274082d629f60 = var_f9129a56a004cdb7[idx];
    if (var_993274082d629f60 == 8) {
        if (var_72c986bd4a45a6c1 < 0) {
            aliasname = var_993274082d629f60 + "r" + var_b63e3aa50397f874;
        } else {
            aliasname = var_993274082d629f60 + "l" + var_b63e3aa50397f874;
        }
    } else {
        aliasname = var_993274082d629f60 + var_b63e3aa50397f874;
    }
    return asm_lookupanimfromaliasifexists(statename, aliasname);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f
// Size: 0x41
function getstartmindist() {
    demeanor = asm_getdemeanor();
    if (demeanor == "casual" || demeanor == "casual_gun" || self aigetdesiredspeed() <= 60) {
        return 75;
    }
    return 100;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a8
// Size: 0x107
function getexitnode() {
    var_de315b064bb20d9 = undefined;
    limit = 400;
    if (actor_is3d()) {
        limit = 1024;
    } else if (isdefined(self.heat)) {
        limit = 4096;
    }
    if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < limit) {
        var_de315b064bb20d9 = self.node;
    } else if (isdefined(self.prevnode) && distancesquared(self.origin, self.prevnode.origin) < limit) {
        var_de315b064bb20d9 = self.prevnode;
    }
    if (isdefined(self.heat) && !actor_is3d()) {
        if (isdefined(var_de315b064bb20d9) && absangleclamp180(self.angles[1] - var_de315b064bb20d9.angles[1]) > 30) {
            return undefined;
        }
    }
    return var_de315b064bb20d9;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x58c
function determinestartanim(statename, var_8a1b6d26fbf96ea9, var_b63e3aa50397f874) {
    var_33aec6b87b156757 = self getnegotiationstartnode();
    if (isdefined(var_33aec6b87b156757)) {
        goalpos = var_33aec6b87b156757.origin;
    } else {
        goalpos = self.pathgoalpos;
    }
    /#
        assert(isdefined(goalpos));
    #/
    var_de315b064bb20d9 = getexitnode();
    if (var_8a1b6d26fbf96ea9) {
        lookaheadpos = self.origin + self.lookaheaddir * self.lookaheaddist;
        var_5dce5380d64570b5 = lookaheadpos;
    } else {
        lookaheadpos = self getposonpath(128);
        var_5dce5380d64570b5 = self getposonpath(32);
    }
    lookaheadangles = vectortoangles(lookaheadpos - self.origin);
    var_78744f455b1d78cd = vectortoangles(var_5dce5380d64570b5 - self.origin);
    if (nodeshouldfaceangles(var_de315b064bb20d9) && !var_8a1b6d26fbf96ea9) {
        currentangles = var_de315b064bb20d9.angles;
    } else {
        currentangles = self.angles;
    }
    anglediff = angleclamp180(lookaheadangles[1] - currentangles[1]);
    var_72c986bd4a45a6c1 = angleclamp180(var_78744f455b1d78cd[1] - currentangles[1]);
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
    var_26565b4b4f2f0779 = getangleindices(anglediff);
    var_dcf8f9e44bfa1d96 = self getnavposition();
    idx = var_26565b4b4f2f0779[0];
    startanim = undefined;
    if (isdefined(self.var_57e1b0c4ad45db70)) {
        startanim = getstartanim(self.var_57e1b0c4ad45db70, var_b63e3aa50397f874, idx, var_72c986bd4a45a6c1);
    } else {
        startanim = getstartanim(statename, var_b63e3aa50397f874, idx, var_72c986bd4a45a6c1);
    }
    if (!isdefined(self.var_57e1b0c4ad45db70)) {
        var_63218147d1beacac = issubstr(statename, "cover");
        var_8c94765ca587f86c = currentangles;
        if (var_63218147d1beacac && isdefined(var_de315b064bb20d9)) {
            var_950fdaf84ee5363 = [0:-180, 1:-135, 2:-90, 3:-90, 4:-90, 5:90, 6:90, 7:135, 8:-180];
            yawoffset = var_950fdaf84ee5363[idx];
            if (issubstr(statename, "left") && idx == 4) {
                yawoffset = yawoffset * -1;
            }
            var_8c94765ca587f86c = (0, angleclamp(var_de315b064bb20d9.angles[1] + yawoffset), 0);
        } else {
            var_fd659656ff546e = [0:180, 1:-135, 2:-90, 3:-45, 4:0, 5:45, 6:90, 7:135, 8:180];
            yawoffset = var_fd659656ff546e[idx];
            var_8c94765ca587f86c = (0, angleclamp(self.angles[1] + yawoffset), 0);
        }
        var_28c922fde27e0717 = 20;
        var_76c97d8fa34a0aed = anglestoforward(var_8c94765ca587f86c);
        velocity = var_76c97d8fa34a0aed * self aigettargetspeed();
        movedelta = vectornormalize(var_76c97d8fa34a0aed) * 5;
        var_29187ec6e45d7481 = self getadjustedexitdirection(var_28c922fde27e0717, velocity, movedelta);
        switch (var_29187ec6e45d7481[0]) {
        case 1:
            var_29187ec6e45d7481[1] = vectornormalize(var_29187ec6e45d7481[1]);
            var_3ffc07559e34cbf3 = vectortoangles(var_29187ec6e45d7481[1]);
            var_cbfa26d1fe952710 = math::wrap(-179, 179, angleclamp180(var_3ffc07559e34cbf3[1] - currentangles[1]));
            var_926edf5ccd852690 = getangleindices(var_cbfa26d1fe952710, 45);
            var_4b4b8fb40b0a2db2 = angleclamp180(var_8c94765ca587f86c[1] - currentangles[1]);
            var_b56298300777ee7a = getangleindices(var_4b4b8fb40b0a2db2);
            newindex = var_926edf5ccd852690[0];
            for (i = var_926edf5ccd852690.size - 1; i >= 0; i--) {
                angleindex = var_926edf5ccd852690[i];
                if (angleindex == var_b56298300777ee7a[0]) {
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
            startanim = getstartanim(statename, var_b63e3aa50397f874, idx, var_72c986bd4a45a6c1);
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4b
// Size: 0x1c
function movebattlechatter_helper(var_2e5e380655d9414) {
    self endon("death");
    waitframe();
    movestartbattlechatter(var_2e5e380655d9414);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf6e
// Size: 0x85
function function_c0771b0b4a16ebde(statename) {
    /#
        if (getdvarint(@"hash_79e471363d9c6b91", 0) == 0) {
            return;
        }
        self notify("enabled");
        self endon("face enemy or motion");
        self endon(statename + "_knob");
        while (1) {
            print3d(self.origin + (0, 0, 72), "<unknown string>", (1, 0.25, 0.25), 1, 2, 1);
            wait(0.05);
        }
    #/
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xffa
// Size: 0x5b
function function_ac721a17dab10e87(suffix, statename, node) {
    /#
        if (isdefined(suffix) && suffix != "<unknown string>") {
            thread function_c0771b0b4a16ebde(statename);
        }
        if (isdefined(node) && node.type != "<unknown string>") {
            thread function_c0771b0b4a16ebde(statename);
        }
    #/
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105c
// Size: 0x4e0
function playstartanim(asmname, statename, startanim, var_bef3b4b769e8abe4) {
    self endon(statename + "_finished");
    lookaheadpos = self getposonpath(128);
    lookaheadangles = vectortoangles(lookaheadpos - self.origin);
    anglediff = angleclamp180(lookaheadangles[1] - self.angles[1]);
    var_df150dde45538e3c = asm_getxanim(statename, startanim);
    var_370a8c08be55a7a5 = getnotetracktimes(var_df150dde45538e3c, "code_move");
    var_6955b58947031cd2 = getnotetracktimes(var_df150dde45538e3c, "corner");
    var_bf4fa70506ca66c1 = getnotetracktimes(var_df150dde45538e3c, "warp_exit_start");
    var_d9a20f501851b31e = getnotetracktimes(var_df150dde45538e3c, "warp_exit_end");
    var_fb9376b06aba09d7 = 1;
    if (var_370a8c08be55a7a5.size > 0) {
        self.requestarrivalnotify = 1;
        var_fb9376b06aba09d7 = var_370a8c08be55a7a5[0];
    }
    var_f49f40eb39da8b4e = getangledelta3d(var_df150dde45538e3c, 0, var_fb9376b06aba09d7);
    self animmode("zonly_physics", 0);
    self setuseanimgoalweight(0.2);
    var_ef7ea12479918983 = self.moveplaybackrate;
    if (demeanorhasblendspace() && isentasoldier()) {
        var_ef7ea12479918983 = 1;
    }
    var_da09f2e04da7570e = getmovedelta(var_df150dde45538e3c, 0, var_fb9376b06aba09d7);
    var_c4ec2d674bc02eb4 = length(var_da09f2e04da7570e);
    var_9c52e37b49e97a0b = self getposonpath(var_c4ec2d674bc02eb4);
    if (var_c4ec2d674bc02eb4 > 1) {
        var_b46ed9e10e2b2da0 = var_9c52e37b49e97a0b - self getnavposition();
    } else {
        var_b46ed9e10e2b2da0 = self getposonpath(12) - self getnavposition();
    }
    var_2c820822533ffafc = vectortoyaw(var_b46ed9e10e2b2da0);
    asm_playfacialanim(asmname, statename, var_df150dde45538e3c);
    self aisetanim(statename, startanim, var_ef7ea12479918983);
    var_5c0d1cbfc351f2e1 = 1;
    var_5ec185bb9e766d14 = spawnstruct();
    var_5ec185bb9e766d14.xanim = var_df150dde45538e3c;
    if (isdefined(self.asm.customdata.ignoreexitwarp)) {
        goto LOC_0000040c;
    }
    if (var_6955b58947031cd2.size > 0) {
        var_e6621fa4cf24a23f = getmovedelta(var_df150dde45538e3c, 0, var_6955b58947031cd2[0]);
        var_8e8cb6f743122604 = length(var_e6621fa4cf24a23f);
        var_583b1c0039d7eba0 = self getposonpath(var_8e8cb6f743122604);
        var_5076fb03fb7166e3 = var_9c52e37b49e97a0b;
        if (var_c4ec2d674bc02eb4 - var_8e8cb6f743122604 < 2) {
            var_5076fb03fb7166e3 = self getposonpath(var_c4ec2d674bc02eb4 + 6);
        }
        var_f41896ed9d57f898 = var_5076fb03fb7166e3 - var_583b1c0039d7eba0;
        var_364f8dea82c92744 = vectortoyaw(var_f41896ed9d57f898);
        if (var_bf4fa70506ca66c1.size > 0 && var_bf4fa70506ca66c1[0] > 0 && var_bf4fa70506ca66c1[0] < var_6955b58947031cd2[0]) {
            var_5ec185bb9e766d14.posalongpath = var_583b1c0039d7eba0;
            var_5ec185bb9e766d14.anglealongpath = var_364f8dea82c92744;
            var_5ec185bb9e766d14.endnote = "corner";
            if (var_d9a20f501851b31e.size > 0 && var_d9a20f501851b31e[0] < var_6955b58947031cd2[0]) {
                var_5ec185bb9e766d14.duration = int((var_d9a20f501851b31e[0] - var_bf4fa70506ca66c1[0]) * getanimlength(var_df150dde45538e3c) * 1000 / var_ef7ea12479918983);
            }
        } else {
            motionwarpwithnotetracks(var_df150dde45538e3c, var_583b1c0039d7eba0, (0, var_364f8dea82c92744, 0), undefined, "corner", undefined, 0);
        }
    } else if (var_bf4fa70506ca66c1.size == 0 || var_bf4fa70506ca66c1[0] == 0) {
        /#
            assertex(var_370a8c08be55a7a5.size > 0, "Animation requires code_move for motion warp: " + function_3c8848a3a11b2553(getanimname(var_df150dde45538e3c)));
        #/
        duration = undefined;
        if (var_bf4fa70506ca66c1.size > 0 && var_d9a20f501851b31e.size > 0 && var_d9a20f501851b31e[0] < var_370a8c08be55a7a5[0]) {
            duration = int((var_d9a20f501851b31e[0] - var_bf4fa70506ca66c1[0]) * getanimlength(var_df150dde45538e3c) * 1000);
        }
        motionwarpwithnotetracks(var_df150dde45538e3c, var_9c52e37b49e97a0b, (0, var_2c820822533ffafc, 0), undefined, "code_move", duration, 0);
    LOC_0000040c:
    }
LOC_0000040c:
    if (!isdefined(var_5ec185bb9e766d14.posalongpath)) {
        var_5ec185bb9e766d14.posalongpath = var_9c52e37b49e97a0b;
        var_5ec185bb9e766d14.anglealongpath = var_2c820822533ffafc;
        var_5ec185bb9e766d14.endnote = "code_move";
        if (var_bf4fa70506ca66c1.size > 0 && var_d9a20f501851b31e.size > 0) {
            var_5ec185bb9e766d14.duration = int((var_d9a20f501851b31e[0] - var_bf4fa70506ca66c1[0]) * getanimlength(var_df150dde45538e3c) * 1000 / var_ef7ea12479918983);
        }
    }
    groundent = self getgroundentity();
    if (isdefined(groundent)) {
        var_5ec185bb9e766d14 = motionwarp_localizedata(var_5ec185bb9e766d14, groundent);
    }
    asm_donotetracks(asmname, statename, &handlewarpexitstart, var_5ec185bb9e766d14, undefined, !var_bef3b4b769e8abe4);
    self motionwarpcancel();
    if (var_bef3b4b769e8abe4) {
        self animmode("normal", 0);
        self orientmode("face motion");
        asm_donotetracks(asmname, statename);
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1543
// Size: 0x9e
function motionwarp_localizedata(var_5ec185bb9e766d14, groundent) {
    var_d352089b1ad84c9f = invertangles(groundent.angles);
    var_ae6b4de373bb5886 = var_5ec185bb9e766d14.posalongpath - groundent.origin;
    var_175bb7a3f0ea3191 = rotatevector(var_ae6b4de373bb5886, var_d352089b1ad84c9f);
    var_5ec185bb9e766d14.posalongpath = var_175bb7a3f0ea3191;
    var_5ec185bb9e766d14.anglealongpath = combineangles((0, var_5ec185bb9e766d14.anglealongpath, 0), var_d352089b1ad84c9f);
    var_5ec185bb9e766d14.groundent = groundent;
    return var_5ec185bb9e766d14;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e9
// Size: 0xdb
function motionwarp_getworldifydata(var_5ec185bb9e766d14) {
    posalongpath = undefined;
    anglealongpath = undefined;
    groundent = var_5ec185bb9e766d14.groundent;
    if (isdefined(groundent)) {
        var_175bb7a3f0ea3191 = var_5ec185bb9e766d14.posalongpath;
        var_ae6b4de373bb5886 = rotatevector(var_175bb7a3f0ea3191, groundent.angles);
        posalongpath = var_ae6b4de373bb5886 + groundent.origin;
        angles = combineangles(var_5ec185bb9e766d14.anglealongpath, groundent.angles);
        anglealongpath = angles[1];
        return [0:posalongpath, 1:anglealongpath];
    } else {
        return [0:var_5ec185bb9e766d14.posalongpath, 1:var_5ec185bb9e766d14.anglealongpath];
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16cb
// Size: 0x11e
function handlewarpexitstart(note, params) {
    posalongpath = undefined;
    anglealongpath = undefined;
    if (note == "warp_exit_start" && !isdefined(self.asm.customdata.ignoreexitwarp)) {
        /#
            assert(isdefined(params) && isstruct(params));
        #/
        endnote = params.endnote;
        if (!isdefined(endnote)) {
            endnote = "warp_exit_end";
        }
        duration = undefined;
        if (isdefined(params.duration)) {
            duration = params.duration - params.duration % 50;
        }
        /#
            assert(animhasnotetrack(params.xanim, endnote));
        #/
        var_57accdc40b2f50e = motionwarp_getworldifydata(params);
        anglealongpath = var_57accdc40b2f50e[1];
        posalongpath = var_57accdc40b2f50e[0];
        motionwarpwithnotetracks(params.xanim, posalongpath, (0, anglealongpath, 0), "warp_exit_start", endnote, duration, 0);
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f0
// Size: 0x15e
function checktransitionpreconditions() {
    if (!isdefined(self.pathgoalpos)) {
        /#
            function_57bc598a3c0d7a1e("<unknown string>" + self getentitynumber() + "<unknown string>");
        #/
        return 0;
    }
    if (!self.facemotion) {
        /#
            function_57bc598a3c0d7a1e("<unknown string>" + self getentitynumber() + "<unknown string>");
        #/
        return 0;
    }
    if (isdefined(self.disableexits) && self.disableexits) {
        /#
            function_57bc598a3c0d7a1e("<unknown string>" + self getentitynumber() + "<unknown string>");
        #/
        return 0;
    }
    if (self.stairsstate != "none") {
        /#
            function_57bc598a3c0d7a1e("<unknown string>" + self getentitynumber() + "<unknown string>");
        #/
        return 0;
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
            function_57bc598a3c0d7a1e("<unknown string>" + self getentitynumber() + "<unknown string>");
        #/
        return 0;
    }
    return 1;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1956
// Size: 0x168
function function_b2fce9f29bd45cc3(asmname, statename, params) {
    self.runngun = 1;
    /#
        assertex(isdefined(self.enemy), "No enemy?! This should be guaranteed via check in ai_asm_builtin.cpp::ShouldRunNGun");
    #/
    var_63a5b32b096323be = self getshootfrompos();
    var_cff075b05a95577b = self getshootpos(var_63a5b32b096323be);
    if (isdefined(var_cff075b05a95577b)) {
        targetpos = var_cff075b05a95577b.shootpos;
    } else {
        targetpos = self lastknownpos(self.enemy);
    }
    var_84dba057067c3c3e = targetpos - self getposonpath(14);
    var_51da48562495c03a = vectortoyaw(var_84dba057067c3c3e);
    var_c25f85e3d458191d = vectortoyaw(self.lookaheaddir);
    var_43810d21f771f553 = angleclamp180(var_51da48562495c03a - var_c25f85e3d458191d);
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac6
// Size: 0x3a
function stoprunngun(asmname, statename, params) {
    self.runngun = 0;
    self.runngundisableaim = 0;
    self.baimedataimtarget = 0;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b07
// Size: 0x49a
function shouldstrafeaimchange(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_c7662529da3a7f64 = 1;
    if (var_c7662529da3a7f64) {
        return 0;
    }
    if (!isdefined(self.asm.strafe_foot)) {
        return 0;
    }
    if (!isdefined(self.pathgoalpos)) {
        return 0;
    }
    if (self getreacquirestate() == "enabled") {
        return 0;
    }
    if (isonanystairs()) {
        return 0;
    }
    var_f290d7530d6aba37 = self getstairsenterdist();
    var_50cfd72556c53ee8 = self getstairsstateatdist(var_f290d7530d6aba37);
    if (var_50cfd72556c53ee8 != "none") {
        return 0;
    }
    targetspeed = self aigettargetspeed();
    if (self.lookaheaddist < 90) {
        return 0;
    }
    var_c25f85e3d458191d = vectortoyaw(self.lookaheaddir);
    if (vectordot(vectornormalize(self.velocity), vectornormalize(self.lookaheaddir)) < 0.9) {
        return 0;
    }
    var_8c3ab01d2f494a38 = self asmeventfiredwithin(asmname, "sharp_turn", 50);
    if (var_8c3ab01d2f494a38) {
        var_185171d0a16d0416 = angleclamp180(var_c25f85e3d458191d - self.angles[1]);
        var_c1350e6cda2f627a = angleclamp180(vectortoyaw(self.velocity) - self.angles[1]);
        if (abs(angleclamp180(var_c1350e6cda2f627a - var_185171d0a16d0416)) > 45) {
            return 0;
        }
    } else {
        var_c1350e6cda2f627a = angleclamp180(var_c25f85e3d458191d - self.angles[1]);
    }
    var_63a5b32b096323be = self getshootfrompos();
    var_cff075b05a95577b = self getshootpos(var_63a5b32b096323be);
    if (self.facemotion || self.predictedfacemotion || self shouldcautiousstrafe()) {
        var_43810d21f771f553 = 0;
    } else if (isdefined(var_cff075b05a95577b) || self iscurrentenemyvalid()) {
        if (isdefined(var_cff075b05a95577b)) {
            targetpos = var_cff075b05a95577b.shootpos;
        } else {
            if (issentient(self.enemy) && gettime() - self lastknowntime(self.enemy) > 2000) {
                return 0;
            }
            targetpos = self lastknownpos(self.enemy);
        }
        if (distance2dsquared(targetpos, self.origin) < 22500) {
            return 0;
        }
        var_84dba057067c3c3e = targetpos - self getposonpath(32);
        var_51da48562495c03a = vectortoyaw(var_84dba057067c3c3e);
        if (abs(angleclamp180(var_51da48562495c03a - self.angles[1])) < 45) {
            return 0;
        }
        var_43810d21f771f553 = angleclamp180(var_c25f85e3d458191d - var_51da48562495c03a);
    } else if (istrue(self._blackboard.forcestrafe)) {
        return 0;
    } else {
        if (var_8c3ab01d2f494a38 || self pathdisttogoal() < 64) {
            return 0;
        }
        var_43810d21f771f553 = angleclamp180(var_c25f85e3d458191d - self.desiredangle);
    }
    if (abs(angleclamp180(var_c1350e6cda2f627a - var_43810d21f771f553)) < 45) {
        return 0;
    }
    var_a6ec3a05cd51b860 = namespace_bf5a1761a8d1bb07::yawdiffto2468(var_c1350e6cda2f627a);
    var_d4c7b1e5457a2668 = namespace_bf5a1761a8d1bb07::yawdiffto2468(var_43810d21f771f553);
    if (var_a6ec3a05cd51b860 == var_d4c7b1e5457a2668) {
        return 0;
    }
    var_c7eeabfb94518b4d = "fast";
    if (isentasoldier() && demeanorhasblendspace()) {
        archetype = self getbasearchetype();
        var_c7eeabfb94518b4d = getnearestspeedthresholdname(archetype, targetspeed);
        if (var_c7eeabfb94518b4d == "shuffle" || var_c7eeabfb94518b4d == "walk") {
            var_c7eeabfb94518b4d = "walk";
        } else if (var_c7eeabfb94518b4d != "fast") {
            var_c7eeabfb94518b4d = "fast";
        }
        self.strafepoispeedtarget = getanimspeedthreshold(archetype, var_c7eeabfb94518b4d);
    } else {
        self.strafepoispeedtarget = undefined;
    }
    alias = var_c7eeabfb94518b4d + "_" + self.asm.strafe_foot + "_" + var_a6ec3a05cd51b860 + "_to_" + var_d4c7b1e5457a2668;
    if (!asm_hasalias(var_f2b19b25d457c2a6, alias)) {
        if (var_a6ec3a05cd51b860 == "4" || var_a6ec3a05cd51b860 == "6") {
            alias = var_c7eeabfb94518b4d + "_feet_together_" + var_a6ec3a05cd51b860 + "_to_" + var_d4c7b1e5457a2668;
        } else {
            alias = var_c7eeabfb94518b4d + "_foot_l_forward_" + var_a6ec3a05cd51b860 + "_to_" + var_d4c7b1e5457a2668;
        }
        if (!asm_hasalias(var_f2b19b25d457c2a6, alias)) {
            return 0;
        }
    }
    self.asm.strafeaimchangealias = alias;
    return 1;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa9
// Size: 0x45
function shouldrestartaimchange(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (asm_eventfired(asmname, "code_move") && shouldstrafeaimchange(asmname, statename, var_f2b19b25d457c2a6, params)) {
        return 1;
    }
    return 0;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff6
// Size: 0x1fa
function aimchangeorientation(var_19b744b1cdee4bcb, rate, endtime, var_da53c72859d22ed6, var_f5704b6af9b1e950) {
    self endon("end_aim_change_orient");
    self.aimchange_oldturnrate = self.turnrate;
    var_c6741e13d5c04d5a = getangledelta(var_19b744b1cdee4bcb, 0, endtime);
    var_935ce979bb3ef270 = var_da53c72859d22ed6 - self.angles[1];
    var_935ce979bb3ef270 = angleclamp180(var_935ce979bb3ef270);
    var_573cd9df7b140b5a = angleclamp180(var_935ce979bb3ef270 - var_c6741e13d5c04d5a);
    var_74fb9d076076aa21 = var_c6741e13d5c04d5a;
    while (isdefined(self) && isalive(self)) {
        currentanimtime = self aigetanimtime(var_19b744b1cdee4bcb);
        var_28f83227b5dbdea8 = min(currentanimtime + level.frameduration / 1000 / var_f5704b6af9b1e950 * rate, 1);
        var_8ccbb038d1a5d254 = getangledelta(var_19b744b1cdee4bcb, currentanimtime, var_28f83227b5dbdea8);
        if ((var_74fb9d076076aa21 - var_8ccbb038d1a5d254) * var_74fb9d076076aa21 > 0) {
            var_74fb9d076076aa21 = var_74fb9d076076aa21 - var_8ccbb038d1a5d254;
        } else {
            var_8ccbb038d1a5d254 = var_74fb9d076076aa21;
            var_74fb9d076076aa21 = 0;
        }
        var_6bdb8335862f56ee = var_8ccbb038d1a5d254 / var_c6741e13d5c04d5a;
        var_bac2c21af365572b = var_573cd9df7b140b5a * var_6bdb8335862f56ee;
        var_d5655124cc692c6f = var_8ccbb038d1a5d254 + var_bac2c21af365572b;
        var_7f55545f660ef1bb = angleclamp(self.angles[1] + var_d5655124cc692c6f);
        var_6b38b069b1d09ad = angleclamp(self.angles[1] + clamp(var_d5655124cc692c6f * 3, -179, 179.9));
        self orientmode("face angle", var_6b38b069b1d09ad);
        if (var_d5655124cc692c6f != 0) {
            turnrate = abs(angleclamp180(self.angles[1] - var_7f55545f660ef1bb)) / level.frameduration;
            if (turnrate > 0) {
                self.turnrate = turnrate;
            }
        }
        waitframe();
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21f7
// Size: 0x33e
function playanim_strafeaimchange(asmname, statename, params) {
    self endon(statename + "_finished");
    animindex = asm_getanim(asmname, statename);
    var_19b744b1cdee4bcb = asm_getxanim(statename, animindex);
    self.asm.strafeaimchangealias = undefined;
    self.sharpturnforceusevelocity = 1;
    rate = 1;
    var_8ba91cc72b54af6c = undefined;
    if (isdefined(self.strafepoispeedtarget) && isentasoldier() && demeanorhasblendspace()) {
        targetspeed = self aigettargetspeed();
        rate = targetspeed / self.strafepoispeedtarget;
        var_8ba91cc72b54af6c = targetspeed;
        rate = clamp(rate, 0.6, 1.4);
    }
    self aisetanim(statename, animindex, rate);
    asm_playfacialanim(asmname, statename, var_19b744b1cdee4bcb);
    var_1cf3cc2bfbd90835 = getnotetracktimes(var_19b744b1cdee4bcb, "code_move");
    var_268f83e1ba7fb62b = getnotetracktimes(var_19b744b1cdee4bcb, "finish");
    endtime = 1;
    if (var_1cf3cc2bfbd90835.size > 0) {
        endtime = var_1cf3cc2bfbd90835[0];
    } else if (var_268f83e1ba7fb62b.size > 0) {
        endtime = var_268f83e1ba7fb62b[0];
    }
    var_f5704b6af9b1e950 = getanimlength(var_19b744b1cdee4bcb);
    animlength = var_f5704b6af9b1e950 * endtime;
    var_da53c72859d22ed6 = vectortoyaw(self.lookaheaddir);
    var_7b953df46ffa1995 = undefined;
    if (!istrue(self.facemotion) && !istrue(self.predictedfacemotion) && !self shouldcautiousstrafe()) {
        var_76c97d8fa34a0aed = getmovedelta(var_19b744b1cdee4bcb, 0, endtime);
        var_4c9c5e3a46583337 = self getposonpath(length(var_76c97d8fa34a0aed));
        var_63a5b32b096323be = self getshootfrompos();
        var_cff075b05a95577b = self getshootpos(var_63a5b32b096323be);
        enemypos = undefined;
        if (isdefined(var_cff075b05a95577b)) {
            enemypos = var_cff075b05a95577b.shootpos;
        } else if (isdefined(self.enemy)) {
            enemypos = self lastknownpos(self.enemy);
        }
        if (isdefined(enemypos)) {
            var_84dba057067c3c3e = vectornormalize(enemypos - var_4c9c5e3a46583337);
            var_da53c72859d22ed6 = vectortoyaw(var_84dba057067c3c3e);
            var_7b953df46ffa1995 = enemypos;
        }
    }
    thread aimchangeorientation(var_19b744b1cdee4bcb, rate, endtime, var_da53c72859d22ed6, var_f5704b6af9b1e950);
    note = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    self notify("end_aim_change_orient");
    if (isdefined(self.aimchange_oldturnrate)) {
        if (self.aimchange_oldturnrate > 0) {
            self.turnrate = self.aimchange_oldturnrate;
        }
        self.aimchange_oldturnrate = undefined;
    }
    if (note == "code_move") {
        if (isdefined(var_7b953df46ffa1995)) {
            self orientmode("face point", var_7b953df46ffa1995);
        } else {
            self orientmode("face angle", var_da53c72859d22ed6);
        }
        self animmode("normal");
        asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    }
    if (isdefined(var_8ba91cc72b54af6c)) {
        self aisettargetspeed(var_8ba91cc72b54af6c);
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x253c
// Size: 0x53
function chooseanim_strafeaimchange(asmname, statename, params) {
    /#
        assert(isdefined(self.asm.strafeaimchangealias));
    #/
    return asm_lookupanimfromalias(statename, self.asm.strafeaimchangealias);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2597
// Size: 0x57
function strafeaimchange_cleanup(asmname, statename, params) {
    self notify("end_aim_change_orient");
    if (isdefined(self.aimchange_oldturnrate)) {
        self.turnrate = self.aimchange_oldturnrate;
        self.aimchange_oldturnrate = undefined;
    }
    self.sharpturnforceusevelocity = 0;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25f5
// Size: 0x119
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2715
// Size: 0xae
function playanim_strafereverse(asmname, statename, params) {
    self endon(statename + "_finished");
    var_49705e6ad03a9802 = 0.4;
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27ca
// Size: 0x24
function strafereverse_cleanup(asmname, statename, params) {
    self setstrafereverse(0);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27f5
// Size: 0x4c
function chooseanim_strafearrive(asmname, statename, params) {
    /#
        assert(isdefined(self.asm.strafearrival_animindex));
    #/
    return self.asm.strafearrival_animindex;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2849
// Size: 0x90
function choosewalkandtalkanims(asmname, statename, params) {
    animstruct = spawnstruct();
    var_d3ebb1fd79cbe1d2 = [];
    var_d3ebb1fd79cbe1d2[0] = asm_lookupanimfromalias(statename, "0");
    var_d3ebb1fd79cbe1d2[1] = asm_lookupanimfromalias(statename, "1");
    var_d3ebb1fd79cbe1d2[2] = asm_lookupanimfromalias(statename, "2");
    animstruct.anims = var_d3ebb1fd79cbe1d2;
    animstruct.forwardanim = asm_lookupanimfromalias(statename, "forward");
    return animstruct;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e1
// Size: 0x38
function shouldwalkandtalk() {
    return bb_moverequested() && isdefined(self._blackboard.walk_and_talk_requested) && self._blackboard.walk_and_talk_requested;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2921
// Size: 0x2e
function walkandtalkdonotetracks(asmname, statename) {
    self endon(statename + "_finished");
    while (1) {
        asm_donotetracks(asmname, statename);
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2956
// Size: 0x3df
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
    var_4cb53f922f32382e = 20;
    while (1) {
        arrival = asm_eventfired(asmname, "cover_approach");
        disttogoal = self pathdisttogoal();
        if (arrival && disttogoal < 150) {
            anglediff = anglediffwalkandtalk();
            index = 1;
            while (index <= var_4cb53f922f32382e) {
                i = index / var_4cb53f922f32382e;
                result = i * i * (3 - 2 * i);
                var_f378f750b9379926 = anglediff;
                actualangle = var_f378f750b9379926 * result;
                var_1b374815fb658b4b = var_f378f750b9379926 - actualangle;
                animweights = getwalkandtalkanimweights(var_1b374815fb658b4b);
                for (animindex = 0; animindex < animweights.size; animindex++) {
                    self setanim(anims[animindex], animweights[animindex], 0.2, 1, 1);
                }
                index++;
                wait(0.05);
                waittillframeend();
            }
            while (arrival) {
                animweights = getwalkandtalkanimweights(0);
                for (index = 0; index < animweights.size; index++) {
                    if (isdefined(anims[index])) {
                        self setanim(anims[index], animweights[index], 0.2, 1, 1);
                    }
                }
                wait(0.05);
                waittillframeend();
            }
        } else {
            anglediff = anglediffwalkandtalk();
            var_3cc8fba2e49545a3 = lastangle - anglediff;
            if (var_3cc8fba2e49545a3 < 0) {
                var_3cc8fba2e49545a3 = var_3cc8fba2e49545a3 * -1;
            }
            if (var_3cc8fba2e49545a3 >= 60) {
                var_7b7e39cb9a3fc1d3 = lastangle;
                var_71ea1ef57b26f1b9 = lastangle;
                index = 1;
                while (index <= var_4cb53f922f32382e) {
                    anglediff = anglediffwalkandtalk();
                    var_14d30308b9f18e3f = var_7b7e39cb9a3fc1d3 - anglediff;
                    if (var_14d30308b9f18e3f < 0) {
                        var_14d30308b9f18e3f = var_14d30308b9f18e3f * -1;
                    }
                    if (var_14d30308b9f18e3f >= 60) {
                        if (index == 1) {
                            index = 1;
                        } else {
                            index = index - 1;
                        }
                        newangle = var_7b7e39cb9a3fc1d3 - lastangle;
                        i = index / var_4cb53f922f32382e;
                        result = i * i * (3 - 2 * i);
                        var_5aa9c8971ae96b16 = newangle * result;
                        var_71ea1ef57b26f1b9 = var_5aa9c8971ae96b16 + lastangle;
                        index = 1;
                        lastangle = var_71ea1ef57b26f1b9;
                    }
                    i = index / var_4cb53f922f32382e;
                    result = i * i * (3 - 2 * i);
                    var_f378f750b9379926 = anglediff - var_71ea1ef57b26f1b9;
                    actualangle = var_f378f750b9379926 * result;
                    var_1b374815fb658b4b = actualangle + lastangle;
                    animweights = getwalkandtalkanimweights(var_1b374815fb658b4b);
                    for (animindex = 0; animindex < animweights.size; animindex++) {
                        self setanim(anims[animindex], animweights[animindex], 0.2, 1, 1);
                    }
                    index++;
                    var_7b7e39cb9a3fc1d3 = anglediff;
                    wait(0.05);
                    waittillframeend();
                }
            } else {
                animweights = getwalkandtalkanimweights(anglediff);
                for (index = 0; index < animweights.size; index++) {
                    if (isdefined(anims[index])) {
                        self setanim(anims[index], animweights[index], 0.2, 1, 1);
                    }
                }
                wait(0.05);
                waittillframeend();
            }
            lastangle = anglediff;
        }
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d3c
// Size: 0x143
function anglediffwalkandtalk() {
    targetpos = self.walk_and_talk_target.origin;
    var_3b4d8ab7e1947f44 = self.origin;
    offsetdir = targetpos - var_3b4d8ab7e1947f44;
    facingdir = anglestoforward(self.angles);
    cross = vectorcross(facingdir, offsetdir);
    var_8c4df4c0c2ed1c92 = vectornormalize(cross);
    var_f99c61aa3bb21bf0 = vectornormalize(offsetdir);
    var_14f0ba9b842953a9 = vectornormalize(facingdir);
    dot = vectordot(var_f99c61aa3bb21bf0, var_14f0ba9b842953a9);
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
    } else {
        if (dot >= 1) {
            return 180;
        }
        if (dot <= -1) {
            return -180;
        } else {
            anglediff = math::anglebetweenvectors(offsetdir, facingdir);
            if (var_8c4df4c0c2ed1c92[2] == -1) {
                anglediff = anglediff * -1;
            }
            return anglediff;
        }
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e86
// Size: 0xe8
function getwalkandtalkanimweights(yaw) {
    animweights = [];
    for (index = 0; index < 3; index++) {
        animweights[index] = 0;
    }
    var_2d702ddb2a9c3231 = [0:-180, 1:0, 2:180];
    for (index = 0; yaw >= var_2d702ddb2a9c3231[index]; index++) {
        /#
            assert(index < var_2d702ddb2a9c3231.size);
        #/
    }
    var_d1eea60321b43092 = index - 1;
    next_index = index;
    /#
        assert(index > 0 && index <= 3);
    #/
    var_e0c8607002f43670 = (yaw - var_2d702ddb2a9c3231[var_d1eea60321b43092]) / (var_2d702ddb2a9c3231[next_index] - var_2d702ddb2a9c3231[var_d1eea60321b43092]);
    var_538bf88f24008653 = 1 - var_e0c8607002f43670;
    animweights[var_d1eea60321b43092] = var_538bf88f24008653;
    animweights[next_index] = var_e0c8607002f43670;
    animweights[1] = max(0.01, animweights[1]);
    return animweights;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f76
// Size: 0x4b
function movestartbattlechatter(var_2e5e380655d9414) {
    movetype = namespace_bf5a1761a8d1bb07::asm_getdemeanor();
    if (movetype == "frantic" || movetype == "combat" || movetype == "sprint") {
        function_216c67ab6749137a(self, undefined, "move", var_2e5e380655d9414);
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc8
// Size: 0x79
function shouldreloadwhilemoving(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!namespace_28edc79fcf2fe234::bb_reloadrequested()) {
        return 0;
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

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3049
// Size: 0x5b
function choosereloadwhilemoving(asmname, statename, params) {
    alias = "reload";
    archetype = self getbasearchetype();
    if (isspeedwithincqbrange(archetype, self aigetdesiredspeed())) {
        alias = "cqbreload";
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30ac
// Size: 0x66
function playreloadwhilemoving(asmname, statename, params) {
    self endon(statename + "_finished");
    self.requestarrivalnotify = 1;
    reloadanim = asm_getanim(asmname, statename);
    self aisetanim(statename, reloadanim);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, reloadanim));
    asm_donotetracks(asmname, statename);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3119
// Size: 0x3c
function terminatereloadwhilemoving(asmname, statename, params) {
    if (!namespace_bf5a1761a8d1bb07::asm_eventfired(asmname, "reload done")) {
        namespace_192c166ad8ed6432::refillclip();
    }
    namespace_1a7cea57c200f504::reload_cleanup(asmname, statename, params);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315c
// Size: 0x20
function isonanystairs() {
    return isdefined(self.pathgoalpos) && self.stairsstate != "none";
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3184
// Size: 0x37
function getgroundangle() {
    slope = self actorgetgroundslope();
    if (abs(slope) > 0.99) {
        return 0;
    }
    var_55e93cd84d333d71 = acos(slope);
    return var_55e93cd84d333d71;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31c3
// Size: 0xd7
function chooseanim_stairs(asmname, statename, params) {
    /#
        assert(isdefined(self.asm.footsteps.foot));
    #/
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
    var_b2d44e59bdd5197a = asm_lookupanimfromalias(statename, alias);
    return var_b2d44e59bdd5197a;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x32a2
// Size: 0xed
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
    var_b2d44e59bdd5197a = asm_lookupanimfromalias(statename, alias);
    return var_b2d44e59bdd5197a;
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3397
// Size: 0x2f3
function slopeupdate(asmname, statename, params) {
    if (isagent(self)) {
        return;
    }
    if (isdefined(self.useslopes) && self.useslopes == 1) {
        var_873556140ea95085 = 0;
        var_d3ee4b860b00683f = 0;
        var_8c6d33f889f4ea11 = (0, 0, 1);
        self endon(statename + "_finished");
        var_4ada6b5c09cf4a64 = asm_lookupanimfromalias(statename, statename + "_knob");
        var_15e042e2e6f020dd = asm_getxanim(statename, var_4ada6b5c09cf4a64);
        var_3e9fff4931014eb8 = asm_lookupanimfromalias(statename, statename + "_scrub_anim");
        var_b19bfc7a5ca49c01 = asm_getxanim(statename, var_3e9fff4931014eb8);
        self setanim(var_15e042e2e6f020dd, 1, 0.1, 0);
        self setanim(var_b19bfc7a5ca49c01, 1, 0.1, 0);
        while (1) {
            var_42df814509c079b7 = ray_trace(self.origin + (0, 0, 12), self.origin - (0, 0, 999));
            var_f8b6736d170ea6c = var_42df814509c079b7["normal"];
            var_f8b6736d170ea6c = vectorlerp(var_8c6d33f889f4ea11, var_f8b6736d170ea6c, 0.25);
            var_8c6d33f889f4ea11 = var_f8b6736d170ea6c;
            var_753cc7857ed5a9ed = anglestoup(self.angles);
            var_7553feaf32873060 = math::vector_project_onto_plane(var_f8b6736d170ea6c, var_753cc7857ed5a9ed);
            yawangles = self.angles;
            var_379097055795a272 = anglestoforward(yawangles);
            var_4e75d9cb5398f7ed = anglebetweenvectorssigned(var_379097055795a272, var_7553feaf32873060, var_753cc7857ed5a9ed);
            var_873556140ea95085 = var_4e75d9cb5398f7ed + 180;
            var_e08b4ab11320959 = var_f8b6736d170ea6c[2];
            var_d3ee4b860b00683f = math::normalize_value(1, 0.707, var_e08b4ab11320959);
            var_d3ee4b860b00683f = 1 - var_d3ee4b860b00683f;
            self setanim(var_15e042e2e6f020dd, var_d3ee4b860b00683f, 0.2, 0);
            self setcustomnodegameparameter("slopes_scrub_direction", var_873556140ea95085);
            /#
                line(self.origin, self.origin + 300 * var_379097055795a272, (1, 0, 0), 4);
                line(self.origin, self.origin + 300 * var_f8b6736d170ea6c, (0, 1, 0), 4);
                line(self.origin, self.origin + 300 * var_7553feaf32873060, (0, 0, 1), 4);
                print3d(self.origin + (24, 0, 66), "<unknown string>" + var_873556140ea95085 + "<unknown string>" + var_d3ee4b860b00683f, (0.5, 0.5, 0.75), 1, 0.45, 1);
            #/
            waitframe();
        }
    }
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3691
// Size: 0x58
function slopecleanup(asmname, statename, params) {
    if (isagent(self)) {
        return;
    }
    var_b9ed8fe7204c646d = asm_lookupanimfromalias(statename, statename + "_knob");
    self clearanim(asm_getxanim(statename, var_b9ed8fe7204c646d), 0.1, "ease_inout_quad");
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x36f0
// Size: 0xb3
function stumblechooseanim(asmname, statename, params) {
    archetype = self getbasearchetype();
    var_856ec761433007a9 = getanimspeedthreshold(archetype, "run");
    var_81a5ddc08a0b28d4 = getanimspeedthreshold(archetype, "sprint");
    speed = length(self.velocity);
    alias = "stumble_jog";
    if (isdefined(var_81a5ddc08a0b28d4) && speed > var_81a5ddc08a0b28d4) {
        alias = "stumble_sprint";
    }
    if (isdefined(var_856ec761433007a9) && speed > var_856ec761433007a9) {
        alias = "stumble_run";
    }
    return asm_chooseanim(asmname, statename, alias);
}

// Namespace move/namespace_d09b117bc1b1d73e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x37ab
// Size: 0x46
function playanim_stumble(asmname, statename, params) {
    self.requestarrivalnotify = 1;
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 0;
    asm_playanimstate(asmname, statename, params);
}

