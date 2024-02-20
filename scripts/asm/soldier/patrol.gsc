// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\aitypes\stealth.gsc;
#using scripts\asm\soldier\patrol.gsc;

#namespace patrol;

// Namespace patrol/namespace_58609e68adef6b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x26
function function_3aba5f22b60d37f5() {
    namespace_f5226b7f82a415af::initstealthfunctions();
    self.var_5221cb0637cd44e7 = &namespace_58609e68adef6b3d::attachflashlight;
    self.fnstealthflashlightdetach = &namespace_58609e68adef6b3d::detachflashlight;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2
// Size: 0x195
function playanim_patrolreact_internal(asmname, statename, var_4ef793291a6a73) {
    /#
        assert(isdefined(self.stealth));
    #/
    self.var_de7ab32958c52392 = self.var_fd01ad49b4e38ae8;
    if (shouldpatrolreactaim()) {
        if (isdefined(self.var_1c9ed4a46d13edc9) && distance2dsquared(self.origin, self.var_1c9ed4a46d13edc9) > 1024) {
            self setlookat(self.var_1c9ed4a46d13edc9);
        }
    }
    var_93a2c35bc9547955 = self asmgetanim(asmname, statename);
    /#
        assert(isdefined(var_93a2c35bc9547955));
    #/
    var_9319232e93b989ed = asm_getxanim(var_4ef793291a6a73, var_93a2c35bc9547955);
    animrate = 1;
    if (isdefined(self.var_aebf462ec3f3362d)) {
        endtime = 1;
        var_1cf3cc2bfbd90835 = getnotetracktimes(var_9319232e93b989ed, "code_move");
        if (var_1cf3cc2bfbd90835.size > 0) {
            endtime = var_1cf3cc2bfbd90835[0];
        }
        animlength = getanimlength(var_9319232e93b989ed) * endtime;
        var_e01c6c89a1eb3d21 = 0.05 + (self.var_aebf462ec3f3362d - gettime()) / 1000;
        if (var_e01c6c89a1eb3d21 < 0.2) {
            var_e01c6c89a1eb3d21 = 0.2;
        }
        animrate = clamp(animlength / var_e01c6c89a1eb3d21, 0.8, 1.3);
        self.var_aebf462ec3f3362d = undefined;
    }
    self aisetanim(var_4ef793291a6a73, var_93a2c35bc9547955, animrate);
    self function_df303d9c05757e6b(var_93a2c35bc9547955, var_4ef793291a6a73);
    asm_donotetrackswithinterceptor(asmname, statename, &flashlightreactionnotehandler, undefined, var_4ef793291a6a73);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x46
function shouldpatrolreactaim(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(self.var_fd01ad49b4e38ae8));
    #/
    return self.var_fd01ad49b4e38ae8 == "med";
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc
// Size: 0x5f
function chooseanim_patrolreactlookaround(asmname, statename, params) {
    alias = "curious";
    if (self function_129cbb4366307f50("med") || self [[ self.fnisinstealthcombat ]]()) {
        alias = "threat";
    }
    return asm_lookupanimfromalias(statename, string(alias));
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x433
// Size: 0x63
function chooseanim_patrolreactlookaround_checkflashlight(asmname, statename, params) {
    alias = string(getpatrolreactdirindex());
    if (self function_129cbb4366307f50("med") || self [[ self.fnisinstealthcombat ]]()) {
        alias = "threat_" + alias;
    }
    return chooseanim_patrol_checkflashlight(asmname, statename, alias);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49e
// Size: 0x74
function getpatrolreactdirindex() {
    var_c5e576cf2978534b = 0;
    if (isdefined(self.var_1c9ed4a46d13edc9)) {
        delta = self.var_1c9ed4a46d13edc9 - self.origin;
        if (length2dsquared(delta) < 36) {
            var_c5e576cf2978534b = 0;
        } else {
            deltayaw = vectortoyaw(delta);
            var_c5e576cf2978534b = self.angles[1] - deltayaw;
        }
    }
    return getreactangleindex(var_c5e576cf2978534b);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51a
// Size: 0xbb
function function_a23a26adcf97fdd0() {
    var_c5e576cf2978534b = 0;
    if (isdefined(self.var_1c9ed4a46d13edc9)) {
        delta = self.var_1c9ed4a46d13edc9 - self.origin;
        deltayaw = vectortoyaw(delta);
        var_c5e576cf2978534b = self.angles[1] - deltayaw;
    }
    var_c5e576cf2978534b = angleclamp180(var_c5e576cf2978534b);
    var_394efcef72c7ebea = function_de2aa7eb339a432c(var_c5e576cf2978534b);
    suffix = string(var_394efcef72c7ebea);
    if (var_c5e576cf2978534b < -120 && var_c5e576cf2978534b > -180) {
        suffix = suffix + "l";
    } else if (var_c5e576cf2978534b > 120 && var_c5e576cf2978534b < 180) {
        suffix = suffix + "r";
    }
    return suffix;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd
// Size: 0x66
function getpatrolreactalias() {
    /#
        assert(isdefined(self.var_fd01ad49b4e38ae8));
    #/
    suffix = function_a23a26adcf97fdd0();
    if (self.var_ee027a8f98390896) {
        alias = self.var_fd01ad49b4e38ae8 + "_close_" + suffix;
    } else {
        alias = self.var_fd01ad49b4e38ae8 + "_" + suffix;
    }
    return alias;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x64b
// Size: 0x72
function chooseanim_patrolreact(asmname, statename, params) {
    alias = getpatrolreactalias();
    animindex = asm_lookupanimfromalias(statename, alias);
    if (!isdefined(animindex)) {
        if (asm_hasalias(statename, "med_8")) {
            return asm_lookupanimfromalias(statename, "med_8");
        } else {
            return asm_lookupanimfromalias(statename, "small_8");
        }
    }
    return animindex;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6c5
// Size: 0x36
function chooseanim_patrolreact_checkflashlight(asmname, statename, params) {
    alias = getpatrolreactalias();
    return chooseanim_patrol_checkflashlight(asmname, statename, alias);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x703
// Size: 0x54
function getreactangleindex(angle) {
    angle = angleclamp180(angle);
    if (angle > 135 || angle < -135) {
        index = 2;
    } else if (angle < -45) {
        index = 4;
    } else if (angle > 45) {
        index = 6;
    } else {
        index = 8;
    }
    return index;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f
// Size: 0x54
function function_de2aa7eb339a432c(angle) {
    angle = angleclamp180(angle);
    if (angle > 120 || angle < -120) {
        index = 2;
    } else if (angle < -30) {
        index = 4;
    } else if (angle > 30) {
        index = 6;
    } else {
        index = 8;
    }
    return index;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x8c
function function_7889a8a760c6e02(turnanim, desiredyaw, var_b8b42fee0a565ee5, endtime) {
    currentanimtime = self aigetanimtime(turnanim);
    /#
        assert(currentanimtime < endtime);
    #/
    var_61f0e2ac4fda97c7 = getangledelta(turnanim, currentanimtime, endtime) + var_b8b42fee0a565ee5;
    var_397e17331b6dfe74 = self.angles[1] + var_61f0e2ac4fda97c7;
    turnyaw = angleclamp180(desiredyaw - angleclamp(var_397e17331b6dfe74));
    return turnyaw;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f
// Size: 0x20f
function handlefacegoalnotetrack(statename, note, params) {
    if (note == "face_goal" && isdefined(self.var_1c9ed4a46d13edc9)) {
        xanim = asm_getxanim(self.var_39798b565de83c7b, self.var_d1a6890d054957e7);
        if (!isdefined(xanim)) {
            return 0;
        }
        finishtime = getnotetracktimes(xanim, "finish");
        if (finishtime.size == 0) {
            finishtime[0] = 1;
        }
        var_3611c8e9f9a8d539 = getnotetracktimes(xanim, "combat_early_out");
        var_53c95344c2ab768f = 1;
        if (var_3611c8e9f9a8d539.size == 0 || !self [[ self.fnisinstealthcombat ]]()) {
            var_53c95344c2ab768f = 0;
            var_3611c8e9f9a8d539[0] = 1;
        }
        endtime = getnotetracktimes(xanim, "face_goal_end");
        if (endtime.size == 0) {
            endtime[0] = finishtime[0];
        }
        if (var_3611c8e9f9a8d539[0] < endtime[0]) {
            endtime[0] = var_3611c8e9f9a8d539[0];
        }
        var_55d50edb133acb1b = getnotetracktimes(xanim, "face_goal");
        animtime = var_55d50edb133acb1b[0];
        animrate = self getanimrate(xanim);
        /#
            assert(animrate != 0);
        #/
        if (animrate == 0) {
            animrate = 1;
        }
        var_228c1f2f3a2d92f1 = getanimlength(xanim) / animrate;
        var_43530de5f95f2f7 = endtime[0] - animtime;
        var_43530de5f95f2f7 = var_43530de5f95f2f7 * var_228c1f2f3a2d92f1;
        var_b8b42fee0a565ee5 = 0;
        if (!var_53c95344c2ab768f && endtime[0] < finishtime[0]) {
            var_b8b42fee0a565ee5 = getangledelta(xanim, endtime[0], finishtime[0]);
        }
        var_63cc85541246c7b4 = self.var_1c9ed4a46d13edc9 - self.origin;
        var_1402d870c92df1af = vectortoyaw(var_63cc85541246c7b4);
        turnyaw = function_7889a8a760c6e02(xanim, var_1402d870c92df1af, var_b8b42fee0a565ee5, endtime[0]);
        thread facegoalthread(statename, turnyaw, var_b8b42fee0a565ee5, self.var_1c9ed4a46d13edc9, var_1402d870c92df1af, var_43530de5f95f2f7, xanim, endtime[0]);
        return 1;
    }
    return 0;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa66
// Size: 0x29d
function facegoalthread(statename, turnyaw, var_b8b42fee0a565ee5, var_45c909cecc77138a, var_1402d870c92df1af, var_43530de5f95f2f7, turnanim, endtime) {
    self notify("FaceGoalThread");
    self endon("FaceGoalThread");
    self endon("death");
    self endon(statename + "_finished");
    frames = ceil(var_43530de5f95f2f7 * 1000 / level.frameduration);
    var_d00ab4a1a5f59a50 = turnyaw / frames;
    var_72c012a18c9e68f9 = undefined;
    var_3c240b5d60b82fc4 = 0;
    while (frames > 0) {
        var_5436f99da0ab0d6 = self.enemy;
        if (!isdefined(var_5436f99da0ab0d6)) {
            if (isdefined(self.var_33107dcb50df3cde) && isplayer(self.var_33107dcb50df3cde)) {
                var_5436f99da0ab0d6 = self.var_33107dcb50df3cde;
            }
        }
        bcansee = 0;
        if (isdefined(var_5436f99da0ab0d6) && issentient(var_5436f99da0ab0d6)) {
            var_47203c042b64f03c = self lastknownpos(var_5436f99da0ab0d6);
            var_77e1544bd35826e5 = self lastknowntime(var_5436f99da0ab0d6);
            if (!bcansee) {
                bcansee = self cansee(var_5436f99da0ab0d6);
            }
            var_522f11c665d62df = 0;
            if (bcansee) {
                if (distancesquared(self.var_1c9ed4a46d13edc9, var_5436f99da0ab0d6.origin) >= 225) {
                    self.var_1c9ed4a46d13edc9 = var_5436f99da0ab0d6.origin;
                    var_522f11c665d62df = 1;
                }
            } else if (!bcansee) {
                if (isdefined(var_47203c042b64f03c) && var_77e1544bd35826e5 > 0) {
                    self.var_1c9ed4a46d13edc9 = var_47203c042b64f03c;
                    var_522f11c665d62df = 1;
                }
            }
            if (var_522f11c665d62df) {
                var_63cc85541246c7b4 = self.var_1c9ed4a46d13edc9 - self.origin;
                var_b5c1dd0e7b0b043b = vectortoyaw(var_63cc85541246c7b4);
                turnyaw = angleclamp180(var_b5c1dd0e7b0b043b - var_1402d870c92df1af - var_b8b42fee0a565ee5);
                var_1402d870c92df1af = var_b5c1dd0e7b0b043b;
                var_d00ab4a1a5f59a50 = var_d00ab4a1a5f59a50 + turnyaw / frames;
            }
        }
        self orientmode("face angle", angleclamp(self.angles[1] + var_d00ab4a1a5f59a50));
        frames = frames - 1;
        if (frames < 1) {
            if (isdefined(var_5436f99da0ab0d6)) {
                if (absangleclamp180(self.angles[1] - var_1402d870c92df1af) <= 10) {
                    if (!self [[ self.fnisinstealthcombat ]]() && isplayer(var_5436f99da0ab0d6) && bcansee) {
                        self aieventlistenerevent("sight", var_5436f99da0ab0d6, var_5436f99da0ab0d6.origin);
                    }
                } else {
                    self glanceatpos(self.var_1c9ed4a46d13edc9);
                }
            }
        }
        waitframe();
    }
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd0a
// Size: 0x44
function patrol_playanim_idlecurious(asmname, statename, params) {
    thread patrol_playanim_idlecurious_facelastknownhelper(statename, self.var_e0164bf8693e15e1);
    function_216c67ab6749137a(self, undefined, "curious");
    asm_playanimstate(asmname, statename);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd55
// Size: 0x6a
function patrol_playanim_idlecurious_facelastknownhelper(statename, target) {
    self endon(statename + "_finished");
    while (isdefined(target) && isalive(target)) {
        var_4fc502b1a10006cc = self lastknownpos(target);
        var_b1dae7cae8885fb1 = var_4fc502b1a10006cc - self.origin;
        self orientmode("face angle", vectortoyaw(var_b1dae7cae8885fb1));
        waitframe();
    }
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdc6
// Size: 0x6f
function patrol_magicflashlightdetach(asmname, statename, params) {
    if (isdefined(self.var_1bab8712529eb3c2) && self.var_1bab8712529eb3c2) {
        detachflashlight();
    }
    if (istrue(self._blackboard.bflashlight) && !istrue(self.var_1bab8712529eb3c2)) {
        self [[ self.fnstealthflashlighton ]]();
    }
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe3c
// Size: 0x40
function patrol_magicflashlighton(asmname, statename, params) {
    if (istrue(self._blackboard.bflashlight)) {
        self [[ self.fnstealthflashlighton ]]();
    }
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe83
// Size: 0x5e
function chooseanim_patrol_checkflashlight(asmname, statename, params) {
    /#
        assert(isdefined(params));
    #/
    alias = params;
    if (isdefined(self.var_1bab8712529eb3c2) && self.var_1bab8712529eb3c2) {
        alias = "fl_" + alias;
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee9
// Size: 0xd6
function flashlightnotehandler(note) {
    if (note == "attach") {
        var_343b33980a5007b1 = self function_76d6356c94f30473();
        attachflashlight(var_343b33980a5007b1);
    } else if (note == "detach") {
        /#
            assert(isdefined(self.fnstealthflashlighton));
        #/
        detachflashlight();
        if (asm_getdemeanor() != "patrol" && isdefined(self._blackboard.bflashlight) && self._blackboard.bflashlight) {
            self [[ self.fnstealthflashlighton ]]();
        }
    } else if (note == "flashlight_on") {
        self [[ self.fnstealthflashlighton ]]();
    } else if (note == "flashlight_off") {
        self [[ self.fnstealthflashlightoff ]](0);
    }
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc6
// Size: 0x46
function setflashlightmodel(flashlightmodel) {
    if (isai(self)) {
        detachflashlight();
    }
    self.flashlightmodeloverride = flashlightmodel;
    if (isai(self) && istrue(self.var_1bab8712529eb3c2)) {
        attachflashlight(1);
    }
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1013
// Size: 0x47
function getflashlightmodel() {
    modelname = "attachment_wm_tac_light_held";
    if (isdefined(self.flashlightmodeloverride)) {
        modelname = self.flashlightmodeloverride;
    } else if (isdefined(level.flashlightmodeloverride)) {
        modelname = level.flashlightmodeloverride;
    }
    return modelname;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1062
// Size: 0xb2
function attachflashlight(var_4d65db1b45602939) {
    /#
        assert(isdefined(self.fnstealthflashlightoff) && isdefined(self.fnstealthflashlighton));
    #/
    /#
        assert(!isdefined(self.var_1bab8712529eb3c2) || self.var_1bab8712529eb3c2 == 0);
    #/
    self [[ self.fnstealthflashlightoff ]](0);
    modelname = getflashlightmodel();
    self attach(modelname, "tag_accessory_left", 1);
    self.flashlightmodel = modelname;
    self.var_1bab8712529eb3c2 = 1;
    self.flashlightfxoverridetag = "tag_light";
    if (var_4d65db1b45602939) {
        self [[ self.fnstealthflashlighton ]]();
    }
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111b
// Size: 0x72
function detachflashlight() {
    /#
        assert(isdefined(self.fnstealthflashlightoff));
    #/
    if (!istrue(self.var_1bab8712529eb3c2)) {
        return;
    }
    self [[ self.fnstealthflashlightoff ]](0);
    if (isdefined(self.flashlightmodel)) {
        self detach(self.flashlightmodel, "tag_accessory_left");
        self.flashlightmodel = undefined;
    }
    self.var_1bab8712529eb3c2 = 0;
    self.flashlightfxoverridetag = undefined;
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1194
// Size: 0x2d
function flashlightreactionnotehandler(statename, note, params) {
    flashlightnotehandler(note);
    return handlefacegoalnotetrack(statename, note, params);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11c9
// Size: 0x26
function function_2be03b6fc63e8c8b(asmname, statename, params) {
    return istrue(level.var_da217073b223521a);
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11f7
// Size: 0x5f
function function_70d280c57c0cfee9(asmname, statename, params) {
    alias = "curious";
    if (self function_129cbb4366307f50("med") || self [[ self.fnisinstealthcombat ]]()) {
        alias = "threat";
    }
    return asm_lookupanimfromalias(statename, string(alias));
}

// Namespace patrol/namespace_58609e68adef6b3d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x125e
// Size: 0x41
function function_8c0e27519be09045(note, params) {
    if (isstartstr(note, "bc_")) {
        event = getsubstr(note, 3);
        /#
        #/
        function_216c67ab6749137a(self, undefined, event);
    }
}

