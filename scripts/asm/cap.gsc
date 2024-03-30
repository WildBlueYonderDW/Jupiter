// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_147448f3f080c636;
#using scripts\anim\notetracks.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\cap.gsc;
#using scripts\common\anim.gsc;

#namespace cap;

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb3d
// Size: 0x13c
function function_11bc1c4cee238a68(asmname, statename, params) {
    var_7e44a7a72aab416a = 0;
    aliasprefix = "";
    if (isdefined(params)) {
        if (!isarray(params)) {
            aliasprefix = params;
        } else {
            aliasprefix = params[0];
            var_7e44a7a72aab416a = params[1];
        }
    }
    warptarget = self function_e430df0f7376ec66();
    targetangles = self.angles;
    if (isdefined(warptarget)) {
        targetpos = warptarget.origin;
        movedirnormalized = vectornormalize(targetpos - self.origin);
        targetangles = vectortoangles(movedirnormalized);
    }
    targetyaw = angleclamp180(targetangles[1] - self.angles[1]);
    angleindex = scripts/asm/asm::yawdiffto2468(targetyaw);
    if (var_7e44a7a72aab416a && angleindex == "2") {
        if (targetyaw < 0) {
            angleindex = "2l";
        } else {
            angleindex = "2r";
        }
    }
    aliasname = aliasprefix + angleindex;
    turnanim = function_18e6c36c02a94dbd(statename, aliasname);
    return turnanim;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc81
// Size: 0x65
function function_64d568ec73ec23f9(asmname, statename, params) {
    self.lasttimepushed = gettime();
    self.attitude = "curious";
    namespace_2b520709cc9e7442::function_fff7117076af2d16(self, level.var_9958731831312749.var_30f007ac9a8e642e, "curious", 0, 1);
    function_59308d53cabcdfdb(asmname, statename, params);
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xced
// Size: 0x1bf
function function_286c69ed2c750e6c(asmname, sourceciv) {
    self endon("death");
    player = namespace_2b520709cc9e7442::getclosestplayer(sourceciv.origin);
    if (!isdefined(player)) {
        return;
    }
    movedirnormalized = vectornormalize(sourceciv.origin - player.origin);
    var_6342bb081f0d1fa8 = sourceciv.origin;
    wait(0.5);
    foreach (otherciv in level.var_f62b6e59c0e00d48.civs) {
        if (!isalive(otherciv) || otherciv == sourceciv) {
            continue;
        }
        if (isdefined(otherciv.capgroup) && isdefined(sourceciv.var_a2c8b8008309aae2)) {
            if (level.capgroups[otherciv.var_a2c8b8008309aae2] == level.capgroups[sourceciv.capgroup]) {
                continue;
            }
        }
        var_81d4d535a858f508 = otherciv.origin - var_6342bb081f0d1fa8;
        var_691f481a8bba4062 = lengthsquared(var_81d4d535a858f508);
        maxdistance = 80;
        if (var_691f481a8bba4062 > maxdistance * maxdistance) {
            continue;
        }
        var_332ea4b12d924c65 = vectornormalize(var_81d4d535a858f508);
        dot = vectordot(var_332ea4b12d924c65, movedirnormalized);
        if (dot > 0.96) {
            otherciv asm_fireevent(asmname, "player_pushed");
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeb3
// Size: 0x4c
function function_c72398c24fe24b5b(asmname, statename, params) {
    thread function_286c69ed2c750e6c(asmname, self);
    self.lasttimepushed = gettime();
    self.attitude = "angered";
    function_59308d53cabcdfdb(asmname, statename, params);
}

// Namespace cap / scripts/asm/cap
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf06
// Size: 0x132
function function_f16999f33ef5381d(statename) {
    self notify("lerp_arrive_finished");
    self endon("death");
    self endon("lerp_arrive_finished");
    alpha = 0;
    startorigin = self.origin;
    startangles = self.angles;
    targetpos = getclosestpointonnavmesh(self.origin, self);
    xanim = animsetgetanimfromindex(self.animsetname, statename, self.var_44c80d2697dce15b);
    animend = getoriginforanimtime(self.origin, self.angles, xanim, 1);
    animlength = getanimlength(xanim);
    starttime = gettime();
    if (ispointonnavmesh(animend)) {
        self notify("lerp_arrive_finished");
        return;
    }
    while (alpha < animlength) {
        waitframe();
        alpha = (gettime() - starttime) / 1000;
        newpos = vectorlerp(self.origin, targetpos, alpha);
        self forceteleport(newpos, startangles);
    }
    self notify("lerp_arrive_finished");
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103f
// Size: 0x40
function function_59308d53cabcdfdb(asmname, statename, params) {
    self.var_44c80d2697dce15b = asm_getanim(asmname, statename);
    function_fb8afeabd23a5ef5(asmname, statename, params, self.var_44c80d2697dce15b);
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1086
// Size: 0x14d
function function_fb8afeabd23a5ef5(asmname, statename, params, animid) {
    self endon(statename + "_finished");
    xanim = asm_getxanim(statename, animid);
    function_38adb9f7ae99df6a(statename, xanim);
    if (isai(self)) {
        self aisetanim(statename, animid);
    } else {
        var_34ee65b16925d791 = asm_lookupanimfromalias("knobs", "body");
        bodyxanim = asm_getxanim("knobs", var_34ee65b16925d791);
        self setflaggedanimknoballrestart(statename, xanim, bodyxanim, 1, 0.2, 1);
        self setanim(bodyxanim, 1, 0.2);
        if (statename == "relaxed" || statename == "single_loop" || statename == "group_loop") {
            function_46602711ed8e40d6();
        } else if (isdefined(params) && isarray(params) && params.size == 2) {
            proceduralturn = params[1];
            if (proceduralturn) {
                childthread function_f498a27eb642642c();
            }
        }
    }
    function_7d6e619c3450bef3(statename, xanim);
    function_c779dc23caccb19c(asmname, statename, params);
    asm_playfacialanim(asmname, statename, xanim);
    cap_donotetracks(asmname, statename);
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11da
// Size: 0x3e
function function_e7652690c4fbe131(asmname, statename, params) {
    function_59308d53cabcdfdb(asmname, statename, params);
    if (isdefined(self.node)) {
        self.keepclaimednodeifvalid = 1;
    }
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x121f
// Size: 0x26
function function_ae21268aec38d315(asmname, statename, params) {
    self.keepclaimednodeifvalid = 0;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124c
// Size: 0xf3
function function_38adb9f7ae99df6a(statename, xanim, animtime) {
    if (isdefined(self.relativestates) && array_contains(self.relativestates, statename)) {
        return;
    }
    scriptednode = function_76b0413f0e5d4dd2();
    if (!isdefined(scriptednode)) {
        return;
    }
    if (!isdefined(animtime)) {
        animtime = 0;
    }
    origin = scriptednode.origin;
    angles = default_to(scriptednode.angles, (0, 0, 0));
    startorg = getoriginforanimtime(origin, angles, xanim, animtime);
    startangles = getanglesforanimtime(origin, angles, xanim, animtime);
    if (isai(self)) {
        self forceteleport(startorg, startangles, 9999);
        return;
    }
    self.origin = startorg;
    self.angles = startangles;
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1346
// Size: 0x6f
function function_76b0413f0e5d4dd2() {
    if (isdefined(self.var_e0676499119d450b)) {
        return undefined;
    }
    if (isdefined(self.scriptednode)) {
        return self.scriptednode;
    }
    if (isdefined(self.animnode)) {
        return self.animnode;
    }
    if (isdefined(self.scripted_animnode)) {
        return self.scripted_animnode;
    }
    if (isdefined(self.var_98b372c0f9b463ba)) {
        return self.var_98b372c0f9b463ba;
    }
    return undefined;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd
// Size: 0xa8
function function_7d6e619c3450bef3(statename, xanim) {
    if (!isdefined(self.resumestatetime) || !array_contains_key(self.resumestatetime, statename)) {
        return;
    }
    var_dcf5e86549620338 = self;
    if (isdefined(self.var_dcf5e86549620338)) {
        var_dcf5e86549620338 = self.var_dcf5e86549620338;
    }
    resumetime = var_dcf5e86549620338.resumestatetime[statename];
    /#
        assert(isdefined(resumetime), "cap_tryResumeState: Cannot resume state " + statename + " on an ent with no .resumeStateTime");
    #/
    function_38adb9f7ae99df6a(statename, xanim, resumetime);
    self setanimtime(xanim, resumetime);
    thread function_c886dae06eba7d4a(statename, xanim);
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146c
// Size: 0x39
function function_c886dae06eba7d4a(statename, xanim) {
    self endon(statename + "_finished");
    while (true) {
        self.resumestatetime[statename] = self getanimtime(xanim);
        waitframe();
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ac
// Size: 0x252
function function_f498a27eb642642c() {
    while (true) {
        player = namespace_2b520709cc9e7442::getclosestplayer(self.origin);
        if (!isdefined(player)) {
            waitframe();
            continue;
        }
        target = player;
        if (isalive(self._blackboard.var_610cb18ecc1af719)) {
            enemy = self._blackboard.var_610cb18ecc1af719;
        }
        totarget = target.origin - self.origin;
        var_b047d1b68e9701c9 = lengthsquared(totarget);
        anglediff = angleclamp180(vectortoyaw(totarget) - self.angles[1]);
        var_706fe99ce1efa2b7 = [[300, 180], [0, 10]];
        var_3ada4c6e49483364 = 0;
        foreach (pair in var_706fe99ce1efa2b7) {
            distancesqr = pair[0] * pair[0];
            if (var_b047d1b68e9701c9 > distancesqr) {
                var_3ada4c6e49483364 = pair[1];
                break;
            }
        }
        shouldrotate = abs(anglediff) > var_3ada4c6e49483364;
        if (shouldrotate) {
            rotationspeed = 25;
            duration = abs(anglediff) / rotationspeed * 1000;
            remainingframes = int(ceil(duration / level.frameduration));
            while (remainingframes > 0) {
                anglediff = angleclamp180(vectortoyaw(target.origin - self.origin) - self.angles[1]);
                lerpfraction = 1 / remainingframes;
                remainingyaw = anglediff;
                yaw = angleclamp(self.angles[1] + remainingyaw * lerpfraction);
                self.angles = (0, yaw, 0);
                remainingframes--;
                waitframe();
            }
        }
        waitframe();
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1705
// Size: 0x235
function function_46602711ed8e40d6() {
    rotationspeed = 70;
    while (true) {
        origin = self.caporigin + anglestoforward(self.capangles) * 50;
        if (isalive(self._blackboard.var_610cb18ecc1af719)) {
            enemy = self._blackboard.var_610cb18ecc1af719;
        }
        totarget = origin - self.origin;
        var_b047d1b68e9701c9 = lengthsquared(totarget);
        anglediff = angleclamp180(vectortoyaw(totarget) - self.angles[1]);
        var_706fe99ce1efa2b7 = [[300, 180], [0, 10]];
        var_3ada4c6e49483364 = 0;
        foreach (pair in var_706fe99ce1efa2b7) {
            distancesqr = pair[0] * pair[0];
            if (var_b047d1b68e9701c9 > distancesqr) {
                var_3ada4c6e49483364 = pair[1];
                break;
            }
        }
        shouldrotate = abs(anglediff) > var_3ada4c6e49483364;
        if (shouldrotate) {
            duration = abs(anglediff) / rotationspeed * 1000;
            remainingframes = int(ceil(duration / level.frameduration));
            while (remainingframes > 0) {
                anglediff = angleclamp180(vectortoyaw(origin - self.origin) - self.angles[1]);
                lerpfraction = 1 / remainingframes;
                remainingyaw = anglediff;
                yaw = angleclamp(self.angles[1] + remainingyaw * lerpfraction);
                self.angles = (0, yaw, 0);
                remainingframes--;
                waitframe();
            }
        }
        waitframe();
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1941
// Size: 0x14
function function_2944e6470a84b96d(xanim, tracktime) {
    
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195c
// Size: 0x14
function function_f9d6133768491200(xanim, tracktime) {
    
}

// Namespace cap / scripts/asm/cap
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1977
// Size: 0xc
function function_7495a975f79b957(player) {
    
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198a
// Size: 0xdd
function function_c6f62de5c6e04207(asmname, statename, params) {
    self endon(statename + "_finished");
    while (true) {
        animid = asm_getanim(asmname, statename);
        xanim = asm_getxanim(statename, animid);
        function_38adb9f7ae99df6a(statename, xanim);
        if (isai(self)) {
            self aisetanim(statename, animid);
            asm_playfacialanim(asmname, statename, xanim);
        } else {
            var_34ee65b16925d791 = asm_lookupanimfromalias("knobs", "body");
            bodyxanim = asm_getxanim("knobs", var_34ee65b16925d791);
            self setflaggedanimknoballrestart(statename, xanim, bodyxanim, 1, 0.2, 1);
        }
        function_c779dc23caccb19c(asmname, statename, params);
        cap_donotetracks(asmname, statename);
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6e
// Size: 0x5d
function cap_donotetracks(asmname, statename) {
    notehandler = asm_getnotehandler(asmname, statename);
    for (endnote = undefined; !isdefined(endnote) || !isstring(endnote) || endnote != "end"; endnote = asm_donotetracks(asmname, statename, notehandler)) {
    }
    return endnote;
}

// Namespace cap / scripts/asm/cap
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad3
// Size: 0x15
function cap_notetrackhandler(notetrack) {
    scripts/anim/notetracks::notetrack_prefix_handler(notetrack);
    return undefined;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1af0
// Size: 0x85
function function_a0dfeea159aa7f64(asmname, statename, params) {
    if (!isdefined(params)) {
        var_b6648a33085e43a = function_976d6ccb0a2807f3(statename);
        return function_18e6c36c02a94dbd(statename, var_b6648a33085e43a);
    }
    result = undefined;
    prefixstr = bb_getprefixstring(params);
    if (isdefined(prefixstr)) {
        var_b6648a33085e43a = function_976d6ccb0a2807f3(statename, prefixstr);
        result = function_18e6c36c02a94dbd(statename, var_b6648a33085e43a);
    } else {
        result = function_18e6c36c02a94dbd(statename, params);
    }
    return result;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7c
// Size: 0x32
function function_f179ede0989e6734(statename, alias) {
    animresult = archetypegetrandomalias(self.animsetname, statename, alias, 0);
    return isdefined(animresult);
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb6
// Size: 0x1d9
function function_b6050fd3b28e7aef(asmname, statename, params) {
    neardistthreshold = 450;
    var_cba2d21a29a6d238 = neardistthreshold * neardistthreshold;
    player = namespace_2b520709cc9e7442::getclosestplayer(self.origin);
    if (!isdefined(player)) {
        var_2b2b7a463c0a7f7a = "far";
        if (function_f179ede0989e6734(statename, var_2b2b7a463c0a7f7a)) {
            result = function_18e6c36c02a94dbd(statename, var_2b2b7a463c0a7f7a);
            return result;
        }
        var_b6648a33085e43a = function_976d6ccb0a2807f3(statename);
        return function_18e6c36c02a94dbd(statename, var_b6648a33085e43a);
    }
    distsqr = distancesquared(self.origin, player.origin);
    var_2b2b7a463c0a7f7a = undefined;
    if (distsqr < var_cba2d21a29a6d238) {
        contents = scripts/engine/trace::create_contents(1, 0, 0, 0, 0, 0, 0);
        excludelist = [player, self];
        origin = self.origin + (0, 0, 30);
        end = player.origin + (0, 0, 30);
        if (isai(self)) {
            hitresult = physics_charactercast(origin, end, self, 30, self.angles, contents, excludelist, "physicsquery_closest");
            if (hitresult.size) {
                var_2b2b7a463c0a7f7a = "far";
            } else {
                var_2b2b7a463c0a7f7a = "near";
            }
        } else {
            var_2b2b7a463c0a7f7a = "near";
        }
    } else {
        var_2b2b7a463c0a7f7a = "far";
    }
    if (function_f179ede0989e6734(statename, var_2b2b7a463c0a7f7a)) {
        result = function_18e6c36c02a94dbd(statename, var_2b2b7a463c0a7f7a);
        return result;
    }
    var_b6648a33085e43a = function_976d6ccb0a2807f3(statename);
    return function_18e6c36c02a94dbd(statename, var_b6648a33085e43a);
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d97
// Size: 0x85
function function_7c6b7c2cd3357729(asmname, statename, params) {
    if (!isdefined(params)) {
        var_b6648a33085e43a = function_976d6ccb0a2807f3(statename);
        return function_658df657ca37f542(statename, var_b6648a33085e43a);
    }
    result = undefined;
    prefixstr = bb_getprefixstring(params);
    if (isdefined(prefixstr)) {
        var_b6648a33085e43a = function_976d6ccb0a2807f3(statename, prefixstr);
        result = function_658df657ca37f542(statename, var_b6648a33085e43a);
    } else {
        result = function_658df657ca37f542(statename, params);
    }
    return result;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e23
// Size: 0x84
function function_18e6c36c02a94dbd(statename, alias) {
    arcname = self.animsetname;
    /#
        assertex(isdefined(arcname), "AI does not have archetype defined.");
    #/
    animresult = archetypegetrandomalias(arcname, statename, alias, asm_isfrantic());
    /#
        assertex(isdefined(animresult), "Unable to find alias " + alias + " in archetype " + arcname + " state " + statename + " for " + self.classname);
    #/
    return animresult;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eaf
// Size: 0xd9
function function_658df657ca37f542(statename, alias) {
    arcname = self.animsetname;
    if (!isdefined(self.var_30452ad282afcd76)) {
        self.var_30452ad282afcd76 = [];
    }
    if (!isdefined(self.var_30452ad282afcd76[statename])) {
        self.var_30452ad282afcd76[statename] = [];
    }
    if (!isdefined(self.var_30452ad282afcd76[statename][alias])) {
        self.var_30452ad282afcd76[statename][alias] = 0;
    }
    animindices = animsetgetallanimindicesforalias(arcname, statename, alias);
    animresult = animindices[self.var_30452ad282afcd76[statename][alias]];
    self.var_30452ad282afcd76[statename][alias]++;
    if (self.var_30452ad282afcd76[statename][alias] >= animindices.size) {
        self.var_30452ad282afcd76[statename][alias] = 0;
    }
    return animresult;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f90
// Size: 0x18d
function function_976d6ccb0a2807f3(statename, optionalprefix, allownone) {
    archetype = self.animsetname;
    aliases = archetypegetaliases(archetype, statename);
    possible = 0;
    chosen = undefined;
    prefixlen = -1;
    if (isdefined(optionalprefix)) {
        prefixlen = optionalprefix.size;
    }
    if (!isdefined(aliases)) {
        /#
            if (!istrue(allownone)) {
                msg = "panic" + statename + "idle_tablet" + archetype;
                if (isdefined(optionalprefix)) {
                    msg = msg + "cigarette_smoke" + optionalprefix;
                }
                /#
                    assertmsg(msg);
                #/
            }
        #/
        return undefined;
    }
    foreach (aliasname in aliases) {
        if (prefixlen < 0 || getsubstr(aliasname, 0, prefixlen) == optionalprefix) {
            possible = possible + 1;
            chance = 1 / possible;
            if (randomfloat(1) <= chance) {
                chosen = aliasname;
            }
        }
    }
    /#
        if (!istrue(allownone) && !isdefined(chosen)) {
            msg = "panic" + statename + "idle_tablet" + archetype;
            if (isdefined(optionalprefix)) {
                msg = msg + "cigarette_smoke" + optionalprefix;
            }
            /#
                assertmsg(msg);
            #/
        }
    #/
    return chosen;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2125
// Size: 0x25
function cap_event(asmname, statename, tostatename, params) {
    return false;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2152
// Size: 0x25
function function_2d6b1385ffc3f5ca(asmname, statename, tostatename, params) {
    return false;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217f
// Size: 0x35
function function_85eca0a1310a70c(asmname, statename, tostatename, params) {
    if (isai(self)) {
        return self codemoverequested();
    }
    return 0;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21bc
// Size: 0xb4
function function_304541cf33d2193c(asmname, statename, params) {
    if (isdefined(params)) {
        /#
            assert(!isarray(params));
        #/
        if (self.unittype == "civilian") {
            bb_setcivilianstate(params);
        } else {
            if (self.unittype == "soldier" && params == "panic") {
                params = "combat";
            }
            if (self.unittype == "soldier" && params == "casual") {
                params = "patrol";
            }
            utility::demeanor_override(params);
        }
    }
    self._blackboard.var_9fbdce5fa10f8964 = 1;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2277
// Size: 0x181
function function_c779dc23caccb19c(asmname, statename, params) {
    if (!isdefined(self.animprops)) {
        return;
    }
    foreach (prop in self.animprops) {
        if (isdefined(params)) {
            aliasname = params;
        } else {
            aliasname = undefined;
            aliasnames = archetypegetaliases(prop.animsetname, statename);
            if (isdefined(aliasnames)) {
                aliasname = random(aliasnames);
            }
        }
        if (!isdefined(aliasname)) {
            continue;
        }
        alias = archetypegetalias(prop.animsetname, statename, aliasname, 0);
        if (!isdefined(alias)) {
            continue;
        }
        propxanim = alias.anims;
        if (isarray(propxanim)) {
            propxanim = random(propxanim);
        }
        scriptednode = function_76b0413f0e5d4dd2();
        /#
            assert(isdefined(scriptednode), "cap_propAnim: must have a scripted node to animate a prop.");
        #/
        origin = scriptednode.origin;
        angles = default_to(scriptednode.angles, (0, 0, 0));
        prop animscripted(aliasname, origin, angles, propxanim);
    }
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ff
// Size: 0x2d
function cap_exit(asmname, statename, params) {
    if (!isalive(self)) {
        return;
    }
    scripts/common/cap::cap_exit();
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2433
// Size: 0x2f
function function_a646f2b30e1f417(asmname, statename, params) {
    scripts/common/cap::cap_exit();
    asm_setstate("long_death_death");
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2469
// Size: 0x2f
function function_c348991ddd3c9ce5(asmname, statename, params) {
    scripts/common/cap::cap_exit();
    asm_setstate("death_generic");
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249f
// Size: 0x50
function function_db8201ba3a4a894d(asmname, statename, params) {
    scripts/common/cap::cap_exit();
    if (self.currentpose == "crouch") {
        asm_setstate("pain_crouch");
        return;
    }
    asm_setstate("pain_stand");
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24f6
// Size: 0x58
function function_71fe3f0b4ea06ff1(asmname, statename, params) {
    scripts/common/cap::cap_exit();
    cache = self.forcelongdeathskipintroanim;
    self.forcelongdeathskipintroanim = 1;
    asm_setstate("choose_long_death");
    self.forcelongdeathskipintroanim = cache;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2555
// Size: 0x1c
function cap_donothing(asmname, statename, params) {
    
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2578
// Size: 0x32
function cap_init(asmname, fromstate, tostate, params) {
    self.attitude = "relaxed";
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x25b1
// Size: 0x52
function function_ebd0a826ac49da1e(asmname, fromstate, tostate, params) {
    /#
        assert(isdefined(params) && !isarray(params));
    #/
    return isdefined(self.attitude) && self.attitude == params;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x260b
// Size: 0x33
function cap_shouldreact(asmname, statename, tostatename, params) {
    return self.attitude != "relaxed";
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2646
// Size: 0x52
function function_e44a6892e1d2ec(asmname, statename, tostatename, params) {
    switch (self.attitude) {
    case #"hash_2be091d2ce1d5a7d":
        return 1;
    default:
        return 0;
    }
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x269f
// Size: 0x5e
function function_11df7068a03bb818(asmname, statename, tostatename, params) {
    switch (self.attitude) {
    case #"hash_dd76edf4ebd198bd":
    case #"hash_f140fd4db5ed4df1":
        return 1;
    default:
        return 0;
    }
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2704
// Size: 0x5e
function function_9cfcf25e2674ea46(asmname, statename, tostatename, params) {
    switch (self.attitude) {
    case #"hash_6da61cb2c6d68687":
    case #"hash_ea9150ecc8538d74":
        return 1;
    default:
        return 0;
    }
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2769
// Size: 0x47
function function_fbaf3f50df29a0ca(asmname, statename, tostatename, params) {
    /#
        assert(isdefined(params), "cap_isFlagSet: must specify a flag to check via the params field");
    #/
    if (!flag_exist(params)) {
        return 0;
    }
    return flag(params);
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x27b8
// Size: 0xaf
function function_84e2d261814f426(asmname, statename, tostatename, params) {
    /#
        assert(isdefined(params) && isnumber(params), "cap_isPlayerWithinDist: must specify a numeric distance via the params field");
    #/
    foreach (player in level.players) {
        if (distancesquared(self.origin, player.origin) <= params * params) {
            return true;
        }
    }
    return false;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x286f
// Size: 0x2d
function function_d87741ac656cc282(asmname, statename, tostatename, params) {
    return function_9f458b5f165cfd34(params, 1);
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x28a4
// Size: 0x2c
function function_cd7b18478f9925a2(asmname, statename, tostatename, params) {
    return function_9f458b5f165cfd34(params, 0);
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28d8
// Size: 0x107
function private function_9f458b5f165cfd34(params, dosighttrace) {
    if (isai(self)) {
        lookatorigin = self geteye();
    } else {
        lookatorigin = self.origin;
    }
    if (isdefined(params)) {
        if (abs(params) > 1) {
            fov = cos(params);
        } else {
            fov = params;
        }
    } else {
        fov = 0.77;
    }
    foreach (player in level.players) {
        playerorigin = player geteye();
        playerangles = player getgunangles();
        if (within_fov(playerorigin, playerangles, lookatorigin, fov)) {
            if (!dosighttrace || sighttracepassed(playerorigin, lookatorigin, 0, self)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x29e7
// Size: 0x3f
function function_eef8d65ad14bc7d(asmname, statename, tostatename, params) {
    if (!isdefined(self.stealth)) {
        return 0;
    }
    return self [[ self.fnisinstealthidle ]]();
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2e
// Size: 0x3f
function function_2c8145ed8b6c8504(asmname, statename, tostatename, params) {
    if (!isdefined(self.stealth)) {
        return 0;
    }
    return self [[ self.fnisinstealthinvestigate ]]();
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a75
// Size: 0x3f
function function_9bfddb0e0134923b(asmname, statename, tostatename, params) {
    if (!isdefined(self.stealth)) {
        return 0;
    }
    return self [[ self.fnisinstealthhunt ]]();
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2abc
// Size: 0x40
function function_df51607ee78d1190(asmname, statename, tostatename, params) {
    if (!isdefined(self.stealth)) {
        return 1;
    }
    return self [[ self.fnisinstealthcombat ]]();
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2b04
// Size: 0x41
function function_276b2832ae7c7cf7(asmname, statename, tostatename, params) {
    /#
        assert(isdefined(params), "Must specify a single param for isOverrideArchetype");
    #/
    return self findoverridearchetype("default") == params;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4d
// Size: 0xa5
function function_8439b78c94685919(asmname, statename, tostatename, params) {
    if (istrue(self.var_36023fdce648d2ea)) {
        return false;
    }
    if (istrue(self.var_be96bc0cf51de950)) {
        return false;
    }
    if (isdefined(self._blackboard.idlenode) && isdefined(self._blackboard.idlenode.repeat_interaction)) {
        if (istrue(int(self._blackboard.idlenode.repeat_interaction))) {
            return false;
        }
    }
    return true;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2bfa
// Size: 0x20e
function function_2bd39480ae487049(note, params) {
    statename = self asmgetcurrentstate(self.asmname);
    if (isstartstr(note, "cigarette")) {
        note = getsubstr(note, 10);
        function_8248dd35588eba2a(note, statename);
    } else if (isstartstr(note, "pack")) {
        note = getsubstr(note, 5);
        function_78fc852578a2d6a9(note, statename);
    } else if (isstartstr(note, "phone")) {
        note = getsubstr(note, 6);
        function_c1cbf486f2593c18(note, statename);
    } else if (isstartstr(note, "bottle")) {
        note = getsubstr(note, 7);
        function_103f712f2029bde6(note, statename);
    } else if (isstartstr(note, "flashlight")) {
        note = getsubstr(note, 7);
        function_65bcde73638156e(note, statename);
    } else if (isstartstr(note, "bread")) {
        note = getsubstr(note, 6);
        function_fb2c788fbeb2ed0e(note, statename);
    } else if (isstartstr(note, "chips")) {
        note = getsubstr(note, 6);
        function_2059f541bb4ec92b(note, statename);
    } else if (isstartstr(note, "pistol")) {
        note = getsubstr(note, 7);
        function_9e1b3a33e6a8c117(note, statename);
    } else if (isstartstr(note, "laptop")) {
        note = getsubstr(note, 7);
        function_8b7e11da82242584(note, statename);
    } else if (isstartstr(note, "tablet")) {
        note = getsubstr(note, 7);
        function_f0a5a6335f173f80(note, statename);
    } else if (isstartstr(note, "radio")) {
        note = getsubstr(note, 6);
        function_2e7191a29c3331b3(note, statename);
    } else if (isstartstr(note, "chair")) {
        note = getsubstr(note, 6);
        function_ad40b641674a572d(note, statename);
    } else if (isstartstr(note, "crowbar")) {
        note = getsubstr(note, 8);
        function_75ab18574236de38(note, statename);
    } else {
        function_245f3c9cf9fb2ed4(note, statename);
    }
    /#
    #/
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0f
// Size: 0x1a5
function function_245f3c9cf9fb2ed4(note, statename) {
    switch (self.animsetname) {
    case #"hash_149d7c5dce32a188":
    case #"hash_2bd6311d82467727":
    case #"hash_4f7b216c29f9fab5":
    case #"hash_62169a0a62911cd5":
    case #"hash_913d19a6e389869f":
    case #"hash_987dc0e7afc41c5e":
    case #"hash_a2eb0bfd79516586":
    case #"hash_c6cc13c8b340fbfe":
    case #"hash_d3a9a445b7f7c070":
    case #"hash_dc358932f675ac5a":
    case #"hash_dcd5de9c5dea1236":
    case #"hash_fae46b750738b9fd":
        function_c1cbf486f2593c18(note, statename);
        break;
    case #"hash_7f68acbb81f632ca":
    case #"hash_c46030dad508a702":
    case #"hash_c7dfb72d7a9773bc":
        function_8248dd35588eba2a(note, statename);
        break;
    case #"hash_6c70e540a4c2e2f3":
    case #"hash_949259d5442d2da1":
        function_103f712f2029bde6(note, statename);
        break;
    case #"hash_39f24bc45741f688":
        function_65bcde73638156e(note, statename);
        break;
    case #"hash_7fb4c7dc8b3bba9a":
        function_9e1b3a33e6a8c117(note, statename);
        break;
    case #"hash_60794fd45ef8d7ee":
        function_8b7e11da82242584(note, statename);
        break;
    case #"hash_595ae802da4a9716":
        function_425680112c205848(note, statename);
        break;
    case #"hash_83798f841323be0f":
        function_2e7f07f6090ddeb5(note, statename);
        break;
    case #"hash_d179924720fd42a4":
        function_18f4224c27507c56(note, statename);
        break;
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fbb
// Size: 0xcb
function function_c2c313a844d139b9() {
    self endon("death");
    ai = self getlinkedparent();
    while (isdefined(self) && self islinked() && !istrue(ai.in_melee) && !istrue(ai.in_melee_death) && isalive(ai)) {
        waitframe();
    }
    if (isdefined(ai)) {
        if (isdefined(ai.idle_fx)) {
            stopfxontag(ai.idle_fx, ai, "tag_accessory_right");
            stopfxontag(ai.idle_fx, ai, "tag_accessory_left");
            ai.idle_fx = undefined;
        }
        if (!istrue(level.var_e908c9dbefd1f3e6)) {
            ai launchprop(self);
            thread prop_delete();
            return;
        }
    }
    self delete();
}

// Namespace cap / scripts/asm/cap
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308d
// Size: 0x52
function function_591bd29f12b13862(note) {
    handtag = "tag_accessory_right";
    hand = getsubstr(note, 7);
    if (isdefined(hand) && (hand == "left" || hand == "l")) {
        handtag = "tag_accessory_left";
    }
    return handtag;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e7
// Size: 0xa9
function function_c1cbf486f2593c18(note, statename) {
    self endon(statename + "_finished");
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        self.idle_prop = scripts/common/anim::anim_link_tag_model(function_640494db1d9ed4a4(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3197
// Size: 0x46
function function_640494db1d9ed4a4() {
    modelname = "offhand_wm_smartphone_on";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_cellphone"])) {
        modelname = level.scr_model["idle_cellphone"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e5
// Size: 0xa9
function function_f0a5a6335f173f80(note, statename) {
    self endon(statename + "_finished");
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        self.idle_prop = scripts/common/anim::anim_link_tag_model(function_4c8b20626e0c2f54(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3295
// Size: 0x46
function function_4c8b20626e0c2f54() {
    modelname = "offhand2h_wm_tablet_v0";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_tablet"])) {
        modelname = level.scr_model["idle_tablet"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e3
// Size: 0xa9
function function_2e7191a29c3331b3(note, statename) {
    self endon(statename + "_finished");
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        self.idle_prop = scripts/common/anim::anim_link_tag_model(function_cc9b64be81cb46ef(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3393
// Size: 0x46
function function_cc9b64be81cb46ef() {
    modelname = "electronics_walkie_talkie_01";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_radio"])) {
        modelname = level.scr_model["idle_radio"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e1
// Size: 0x9a
function function_fb2c788fbeb2ed0e(note, statename) {
    self endon(statename + "_finished");
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        self.idle_prop = scripts/common/anim::anim_link_tag_model("food_bread_slice", handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3482
// Size: 0x9a
function function_2059f541bb4ec92b(note, statename) {
    self endon(statename + "_finished");
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        self.idle_prop = scripts/common/anim::anim_link_tag_model("food_trash_bag_chips_01", handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3523
// Size: 0x1e6
function function_8248dd35588eba2a(note, statename) {
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        self.idle_prop = scripts/common/anim::anim_link_tag_model(function_f7b213561a5c3b4c(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        self.idle_fx = level.g_effect["cigarette_unlit"];
        playfxontag(self.idle_fx, self, handtag);
        self.idle_prop.handtag = handtag;
        return;
    }
    if (isstartstr(note, "light")) {
        if (isdefined(self.idle_prop.handtag)) {
            handtag = self.idle_prop.handtag;
        }
        self.idle_fx = level.g_effect["cigarette_lit"];
        playfxontag(self.idle_fx, self, handtag);
        stopfxontag(level.g_effect["cigarette_unlit"], self, handtag);
        playfx(level.g_effect["lighter_glow"], self gettagorigin(handtag));
        thread smoking_blowsmoke(statename);
        return;
    }
    if (isstartstr(note, "detach") || isstartstr(note, "toss")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
        stopfxontag(level.g_effect["cigarette_lit"], self, handtag);
        self.idle_fx = undefined;
        if (isstartstr(note, "toss")) {
            playfx(level.g_effect["cigarette_lit_toss"], self gettagorigin(handtag), anglestoforward(self gettagangles(handtag)));
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3710
// Size: 0x46
function function_f7b213561a5c3b4c() {
    modelname = "misc_cigarette_01_centered";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_cigarette"])) {
        modelname = level.scr_model["idle_cigarette"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x375e
// Size: 0x81
function smoking_blowsmoke(statename) {
    self endon("smoking_end");
    self endon("death");
    while (true) {
        self.smoke_fx_ent = playfxontag(level.g_effect["cigarette_smoke"], self, "tag_eye");
        waittime = randomintrange(5, 8);
        wait(waittime);
        if (isdefined(self.smoke_fx_ent)) {
            self.smoke_fx_ent delete();
            self.smoke_fx_ent = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e6
// Size: 0x95
function smoking_cleanup(asmname, statename, params) {
    self notify("smoking_end");
    if (isdefined(self.idle_fx)) {
        stopfxontag(self.idle_fx, self, "tag_accessory_right");
        stopfxontag(self.idle_fx, self, "tag_accessory_left");
        self.idle_fx = undefined;
    }
    if (isdefined(self.smoke_fx_ent)) {
        self.smoke_fx_ent delete();
        self.smoke_fx_ent = undefined;
    }
    idle_cleanup(asmname, statename, params);
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3882
// Size: 0xbc
function function_78fc852578a2d6a9(note, statename) {
    action = getsubstr(note, 0, 6);
    handtag = function_591bd29f12b13862(note);
    switch (action) {
    case #"hash_2d1403e602f082a4":
        if (isdefined(self.var_cdb39b13b6524b5b)) {
            return;
        }
        self.var_cdb39b13b6524b5b = scripts/common/anim::anim_link_tag_model(function_34554aaf056d23d(), handtag);
        self.var_cdb39b13b6524b5b thread function_c2c313a844d139b9();
        break;
    case #"hash_682ec8b49fe7aa12":
        if (isdefined(self.var_cdb39b13b6524b5b)) {
            self.var_cdb39b13b6524b5b delete();
            self.var_cdb39b13b6524b5b = undefined;
        }
        break;
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3945
// Size: 0x46
function function_34554aaf056d23d() {
    modelname = "misc_cigarette_pack_01";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_cigarettepack"])) {
        modelname = level.scr_model["idle_cigarettepack"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3993
// Size: 0xa8
function function_65bcde73638156e(note, statename) {
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        self.idle_prop = scripts/common/anim::anim_link_tag_model(idle_focusflashlight(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        self notify("enable_flashlight_fx");
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a42
// Size: 0x46
function idle_focusflashlight() {
    modelname = "jup_tool_flashlight_01";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_focus_flashlight"])) {
        modelname = level.scr_model["idle_focus_flashlight"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a90
// Size: 0xa0
function function_103f712f2029bde6(note, statename) {
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        self.idle_prop = scripts/common/anim::anim_link_tag_model(function_6d9a6be03f41b2c(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b37
// Size: 0x46
function function_6d9a6be03f41b2c() {
    modelname = "p7_bottle_plastic_16oz_water";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_bottle"])) {
        modelname = level.scr_model["idle_bottle"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b85
// Size: 0xa0
function function_75ab18574236de38(note, statename) {
    handtag = function_591bd29f12b13862(note);
    if (isstartstr(note, "attach")) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        self.idle_prop = scripts/common/anim::anim_link_tag_model(function_ccfa6fb9cdc07744(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isstartstr(note, "detach")) {
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2c
// Size: 0x46
function function_ccfa6fb9cdc07744() {
    modelname = "parts_jup_misc_crowbar";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_crowbar"])) {
        modelname = level.scr_model["idle_crowbar"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7a
// Size: 0x25
function function_2e7f07f6090ddeb5(note, statename) {
    if (isdefined(self function_92435c7a6ae85c3c())) {
        spawnchair();
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca6
// Size: 0x14a
function function_9e1b3a33e6a8c117(note, statename) {
    handtag = "tag_accessory_right";
    gun = "weapon_wm_pi_mike1911_phys";
    if (isdefined(self function_92435c7a6ae85c3c())) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        spawnchair();
        if (!isdefined(self.idle_table)) {
            tableoffset = anglestoforward(self.angles) * 18 + (0, 0, -2);
            self.idle_table = utility::spawn_model(function_fe4813e6b6140728(), self.origin + tableoffset, self.angles);
        }
        origin = self.origin + (0, 0, 34) + anglestoforward(self.angles) * 10 + anglestoright(self.angles) * -8;
        self.idle_prop = utility::spawn_model(gun, origin, self.angles + (0, 90, 90));
        return;
    }
    if (isdefined(self.idle_prop)) {
        self.idle_prop delete();
        self.idle_prop = undefined;
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3df7
// Size: 0x7e
function function_ad085c5f946742f4(note, statename) {
    if (isdefined(self function_92435c7a6ae85c3c())) {
        if (!isdefined(self.idle_table)) {
            tableoffset = anglestoforward(self.angles) * 18 + (0, 0, -2);
            self.idle_table = utility::spawn_model(function_fe4813e6b6140728(), self.origin + tableoffset, self.angles);
        }
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7c
// Size: 0xf6
function function_8b7e11da82242584(note, statename) {
    handtag = "tag_accessory_right";
    if (isdefined(self function_92435c7a6ae85c3c())) {
        spawnchair();
        if (!isdefined(self.idle_table)) {
            tableoffset = anglestoforward(self.angles) * 22 + (0, 0, -2);
            self.idle_table = utility::spawn_model(function_fe4813e6b6140728(), self.origin + tableoffset, self.angles);
        }
        if (isdefined(self.idle_laptop)) {
            return;
        }
        var_a1862b426c15f10e = anglestoforward(self.angles) * 30 + (0, 0, 31);
        self.idle_laptop = utility::spawn_model(function_1ee6622550f2a5d0(), self.origin + var_a1862b426c15f10e, self.angles);
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f79
// Size: 0x46
function function_1ee6622550f2a5d0() {
    modelname = "misc_wm_blackbox_laptop";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_laptop"])) {
        modelname = level.scr_model["idle_laptop"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc7
// Size: 0x93
function function_425680112c205848(note, statename) {
    handtag = "tag_accessory_right";
    if (isdefined(self function_92435c7a6ae85c3c())) {
        if (isdefined(self.idle_prop)) {
            return;
        }
        spawnchair();
        self.idle_prop = scripts/common/anim::anim_link_tag_model(function_640494db1d9ed4a4(), handtag);
        self.idle_prop thread function_c2c313a844d139b9();
        return;
    }
    if (isdefined(self.idle_prop)) {
        self.idle_prop delete();
        self.idle_prop = undefined;
    }
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4061
// Size: 0x1e9
function function_18f4224c27507c56(note, statename) {
    modelname = "container_fertilizer_bag_01_open";
    offset = (0, 0, -13);
    if (isdefined(self function_92435c7a6ae85c3c())) {
        if (!isdefined(self.idle_bag)) {
            propanim = level.scr_anim["idle_bag"]["wait"];
            self.idle_bag = utility::spawn_model(modelname, self._blackboard.var_ad5eda311c73f5d7, self._blackboard.var_66c82b7660f29059);
            self.idle_bag useanimtree(level.scr_animtree["idle_bag"]);
            self.idle_bag animrelative("wait", self._blackboard.var_ad5eda311c73f5d7 + offset, self._blackboard.var_66c82b7660f29059, propanim);
            self.idle_bag.key = "wait";
            thread function_399c8ad9434488e8();
        }
    }
    if (!isdefined(self.idle_bag)) {
        return;
    }
    if (statename == "group_loop" && !istrue(self.idle_bag.isidle)) {
        self.idle_bag.key = "idle";
        self.idle_bag.isidle = 1;
        propanim = level.scr_anim["idle_bag"]["idle"];
        self.idle_bag animrelative("idle", self._blackboard.var_ad5eda311c73f5d7 + offset, self._blackboard.var_66c82b7660f29059, propanim);
        self.idle_bag thread function_cbde85a808114924();
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4251
// Size: 0x2b
function function_cbde85a808114924() {
    self endon("death");
    self notify("prop_singleton");
    self endon("prop_singleton");
    self waittill("idle");
    self.isidle = 0;
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4283
// Size: 0x40
function function_399c8ad9434488e8() {
    self endon("death");
    self.idle_bag endon("death");
    while (isdefined(self function_92435c7a6ae85c3c())) {
        waitframe();
    }
    self.idle_bag delete();
    self.idle_bag = undefined;
}

// Namespace cap / scripts/asm/cap
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42ca
// Size: 0x214
function function_ad40b641674a572d(note, statename) {
    if (isstartstr(note, "spawn")) {
        spawnchair();
    }
    if (!isdefined(self.idle_chair)) {
        origin = function_bbfc94714c82788b(self function_92435c7a6ae85c3c());
        chairs = getscriptablearray("interactable_chair", "script_noteworthy");
        maxdist = 16;
        self.idle_chair = getclosest(origin, chairs, maxdist);
        return;
    }
    self.idle_chair.key = undefined;
    if (isstartstr(note, "enter")) {
        self.idle_chair.key = "enter";
    }
    if (isstartstr(note, "idle")) {
        self.idle_chair.key = "idle";
    }
    if (isstartstr(note, "exit")) {
        self.idle_chair.key = "exit";
    }
    if (isstartstr(note, "death")) {
        self.idle_chair.key = "death";
    }
    if (isstartstr(note, "pain")) {
        self.idle_chair.key = "pain";
    }
    if (isstartstr(note, "react")) {
        self.idle_chair.key = "react";
    }
    if (isdefined(self.idle_chair.key)) {
        propanim = level.scr_anim["idle_bag"][self.idle_chair.key];
        self.idle_chair animrelative("idle", self._blackboard.var_ad5eda311c73f5d7, self._blackboard.var_66c82b7660f29059, propanim);
        self.idle_chair thread function_cbde85a808114924();
    }
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e5
// Size: 0x87
function spawnchair() {
    modelname = "cp_disco_folding_chair_lod0";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_chair"])) {
        modelname = level.scr_model["idle_chair"];
    }
    if (!isdefined(self.idle_chair)) {
        self.idle_chair = utility::spawn_model(modelname, self.origin + anglestoforward(self.angles) * -8, self.angles);
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4574
// Size: 0x46
function function_fe4813e6b6140728() {
    modelname = "furniture_kitchen_end_table_01";
    if (isdefined(level.scr_model) && isdefined(level.scr_model["idle_table"])) {
        modelname = level.scr_model["idle_table"];
    }
    return modelname;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x45c2
// Size: 0x30
function cappropcleanup(asmname, statename, params) {
    smoking_cleanup(asmname, statename, params);
    prop_drop(asmname, statename, params);
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f9
// Size: 0xdd
function prop_drop(asmname, statename, params) {
    props = [];
    if (isdefined(self.idle_prop)) {
        props[props.size] = self.idle_prop;
    }
    if (isdefined(self.var_cdb39b13b6524b5b)) {
        props[props.size] = self.var_cdb39b13b6524b5b;
    }
    if (isdefined(self.idle_fx)) {
        smoking_cleanup();
    }
    if (props.size == 0) {
        return;
    }
    foreach (prop in props) {
        if (!istrue(level.var_e908c9dbefd1f3e6)) {
            launchprop(prop);
        }
        prop thread prop_delete();
    }
}

// Namespace cap / scripts/asm/cap
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46dd
// Size: 0xb6
function launchprop(prop) {
    if (!isdefined(prop) || !isent(prop) || !isdefined(prop.model) || prop.model == "") {
        return;
    }
    launchforce = anglestoforward(self.angles);
    launchforce = launchforce * randomfloatrange(10, 20);
    forcex = launchforce[0];
    forcey = launchforce[1];
    forcez = randomfloatrange(1, 10);
    prop unlink();
    prop physicslaunchserver(prop.origin, (forcex, forcey, forcez));
}

// Namespace cap / scripts/asm/cap
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x479a
// Size: 0xa2
function prop_delete() {
    interval = 10000;
    starttime = gettime();
    endtime = starttime + interval;
    if (utility::issp() || utility::function_ccf98e6391dd38b9()) {
        wait(1);
        while (isdefined(self) && isalive(level.player) && gettime() < endtime && distance2dsquared(level.player.origin, self.origin) < 16384) {
            wait(1);
        }
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4843
// Size: 0x5f
function idle_cleanup(asmname, statename, params) {
    self.newenemyreactiondistsq = 262144;
    self function_f7cff9f6dafb297();
    if (isdefined(self.idle_prop)) {
        self.idle_prop delete();
        self.idle_prop = undefined;
    }
    self notify("patrol_idle_complete");
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x48a9
// Size: 0x58
function function_eaf18f0250abb7e7(asmname, statename, params) {
    statename = "death_custom";
    alias = "death_custom_anim";
    animresult = archetypegetrandomalias(self.animsetname, statename, alias, 0);
    if (isdefined(animresult)) {
        return true;
    }
    return false;
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4909
// Size: 0x23
function ininteraction(asmname, statename, params) {
    return isdefined(self function_92435c7a6ae85c3c());
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4934
// Size: 0x39
function incap(asmname, statename, params) {
    return self.asmname != "civilian_react" || isdefined(self.var_33b4c07d1f388776);
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4975
// Size: 0x9d
function function_8c68332a9a43f4ea(asmname, statename, params) {
    if (!isdefined(self._blackboard.var_60b33cf695f1d6ed)) {
        var_60b33cf695f1d6ed = asm_getrandomalias(statename);
        self._blackboard.var_60b33cf695f1d6ed = function_18e6c36c02a94dbd(statename, var_60b33cf695f1d6ed);
    }
    alias = self._blackboard.var_60b33cf695f1d6ed;
    if (statename == "cower_to_panicked") {
        self._blackboard.var_60b33cf695f1d6ed = undefined;
    }
    return alias;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4a1a
// Size: 0x38
function function_741a8c95a0ba229a(asmname, statename, tostatename, params) {
    return istrue(self._blackboard.skiptransition);
}

// Namespace cap / scripts/asm/cap
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4a5a
// Size: 0x1c1
function function_85c5a3c3c6f345c4(asmname, statename, params) {
    var_935ce979bb3ef270 = vectortoyaw(self.turntarget.origin - self.origin);
    anglediff = angleclamp180(var_935ce979bb3ef270 - self.angles[1]);
    turnanim = undefined;
    if (isdefined(params) && params == "cardinal") {
        var_5263a610669efa35 = abs(anglediff);
        animindex = "2";
        if (var_5263a610669efa35 > 135) {
            animindex = "8";
        } else if (anglediff > 45 && anglediff <= 135) {
            animindex = "6";
        } else if (anglediff >= -135 && anglediff < -45) {
            animindex = "4";
        }
        turnanim = asm_lookupanimfromalias(statename, animindex);
        /#
            assertex(isdefined(turnanim), "Cardinal turn anim index " + animindex + "is missing in animset " + self.animsetname);
        #/
    } else {
        animmap = ["2", "3", "6", "9", "8", "7", "4", "1", "2"];
        animindex = getangleindex(anglediff, 22.5);
        animalias = animmap[animindex];
        turnanim = asm_lookupanimfromalias(statename, animmap[animindex]);
        /#
            assertex(isdefined(turnanim), "Turn anim index " + animmap[animindex] + "is missing in animset " + self.animsetname);
        #/
    }
    return turnanim;
}

// Namespace cap / scripts/asm/cap
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4c23
// Size: 0x2e
function function_b98734875ecb0d81(asmname, statename, tostatename, params) {
    return isdefined(self.turntarget);
}

