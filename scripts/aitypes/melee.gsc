// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using scripts\aitypes\combat.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\shared\utility.gsc;

#namespace melee;

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0x61
function initmeleefunctions(taskid) {
    self.meleerangesq = 6724;
    self.meleechargedistvsplayer = 100;
    self.meleeactorboundsradius = 32;
    self.acceptablemeleefraction = 0.98;
    self.fnismeleevalid = &ismeleevalid;
    self.fncanmovefrompointtopoint = &canmovefrompointtopoint;
    return anim.success;
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd
// Size: 0x1f
function canmovefrompointtopoint(start, end) {
    return self maymovefrompointtopoint(start, end, 0, 1);
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f4
// Size: 0x22
function meleedeathhandler(enemy) {
    self endon("melee_finished");
    self waittill("terminate_ai_threads");
    bb_clearmeleetarget();
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d
// Size: 0x13
function melee_destroy() {
    self clearbtgoal(3);
    self function_bdcb37a9431e654();
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0x5a
function getmeleechargerange(target) {
    if (isplayer(target)) {
        var_a8dde70c8a3396f3 = self.meleechargedistvsplayer;
    } else {
        var_a8dde70c8a3396f3 = self.meleechargedist;
    }
    if (!hasammoinclip()) {
        var_126639ea8d4d57f = self.meleechargedistreloadmultiplier;
        var_a8dde70c8a3396f3 = var_a8dde70c8a3396f3 * var_126639ea8d4d57f;
    }
    return var_a8dde70c8a3396f3;
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x299
// Size: 0xd3
function gettargetchargepos(target) {
    /#
        assert(isdefined(target));
    #/
    targetpos = target.origin;
    var_6a4277ff9e64049f = target.origin - self.origin;
    var_6a4277ff9e64049f = vectornormalize(var_6a4277ff9e64049f);
    targetpos = targetpos - var_6a4277ff9e64049f * self.meleeactorboundsradius;
    var_625cdb6ddfebbef0 = getclosestpointonnavmesh(targetpos, self);
    if (abs(targetpos[2] - var_625cdb6ddfebbef0[2]) > self.maxzdiff) {
        return undefined;
    }
    traceresults = navtrace(self.origin, var_625cdb6ddfebbef0, self, 1);
    fraction = traceresults["fraction"];
    if (fraction < self.acceptablemeleefraction) {
        return undefined;
    }
    return var_625cdb6ddfebbef0;
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x374
// Size: 0x68
function canmeleeduringstealth() {
    if (isdefined(self.ent_flag) && isdefined(self.ent_flag["_stealth_enabled"]) && self.ent_flag["_stealth_enabled"]) {
        if (isdefined(self.ent_flag["_stealth_attack"]) && !self.ent_flag["_stealth_attack"]) {
            return 0;
        }
    }
    return anim.success;
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e4
// Size: 0xb2
function iseitherofusalreadyinmelee(var_e37bb2c17a470a0) {
    var_9bfc452192b23c7a = self.enemy;
    if (isdefined(var_e37bb2c17a470a0)) {
        var_9bfc452192b23c7a = var_e37bb2c17a470a0;
    }
    if (self.var_a97ac004f00c5df9) {
        return 1;
    }
    if (var_9bfc452192b23c7a.var_a97ac004f00c5df9) {
        if (!isdefined(var_9bfc452192b23c7a.var_68d2f73ee95055fb)) {
            if (isplayer(var_9bfc452192b23c7a)) {
                var_9bfc452192b23c7a function_bdcb37a9431e654();
            } else {
                /#
                    assert(isdefined(var_9bfc452192b23c7a.var_42c47bf5f8a7fdf6) || var_9bfc452192b23c7a.var_4ecd594ae357f55b || istrue(var_9bfc452192b23c7a.var_9aedaf1da799bd67), "MeleeTarget has an invalid melee partner defined!");
                #/
            }
        }
        if (var_9bfc452192b23c7a.var_a97ac004f00c5df9) {
            return 1;
        }
    }
    return 0;
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49e
// Size: 0x95
function ismeleerangevalid(target) {
    /#
        assert(isdefined(self.meleemaxzdiff));
    #/
    if (abs(target.origin[2] - self.origin[2]) > self.meleemaxzdiff) {
        return 0;
    }
    var_da0f4d34e5114a91 = getmeleechargerange(target);
    var_fb2fa63a4fe6e2b5 = var_da0f4d34e5114a91 * var_da0f4d34e5114a91;
    var_a78370195e768e30 = distancesquared(self.origin, target.origin);
    return var_a78370195e768e30 <= var_fb2fa63a4fe6e2b5;
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53b
// Size: 0x53
function ismeleevalid_common(target, var_92493ae5a92d3699) {
    if (istrue(self.dontmelee)) {
        return 0;
    }
    if (!isdefined(target)) {
        return 0;
    }
    if (istrue(target.dontmelee)) {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    if (!isalive(target)) {
        return 0;
    }
    return 1;
}

// Namespace melee/namespace_d6212dfe13eb1bac
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x596
// Size: 0x3c9
function ismeleevalid(target, var_92493ae5a92d3699) {
    if (!ismeleevalid_common(target, var_92493ae5a92d3699)) {
        return 0;
    }
    if (var_92493ae5a92d3699) {
        if (isdefined(self.a.onback) || self.currentpose == "prone") {
            return 0;
        }
        if (!namespace_34bf5965727c0922::melee_checktimer(self.unittype, 1)) {
            return 0;
        }
        if (isdefined(self.pathgoalpos) && self.facemotion && lengthsquared(self.velocity) > 1) {
            var_6a4277ff9e64049f = target.origin - self.origin;
            var_e69c9108f53988f3 = length(var_6a4277ff9e64049f);
            if (var_e69c9108f53988f3 > 60) {
                var_6a4277ff9e64049f = var_6a4277ff9e64049f / var_e69c9108f53988f3;
                lookaheadpos = self getposonpath(30);
                var_81c732b62ff30ed4 = vectornormalize(lookaheadpos - self.origin);
                if (vectordot(var_81c732b62ff30ed4, var_6a4277ff9e64049f) < -0.5) {
                    return 0;
                }
            }
        }
    }
    if (isdefined(self.grenade) && self.frontshieldanglecos == 1) {
        return 0;
    }
    if (isdefined(self.lastfailedmeleechargetarget) && self.enemy == self.lastfailedmeleechargetarget && gettime() <= self.nextmeleechecktime) {
        return 0;
    }
    if (istrue(target.dontattackme) || istrue(target.ignoreme) || istrue(target.dontmeleeme)) {
        return 0;
    }
    if (!isai(target) && !isplayer(target)) {
        return 0;
    }
    if (isdefined(self.meleealwayswin) && isdefined(target.meleealwayswin)) {
        return 0;
    }
    if (isdefined(self.meleealwayswin) && isdefined(target.magic_bullet_shield) || isdefined(target.meleealwayswin) && isdefined(self.magic_bullet_shield)) {
        return 0;
    }
    var_55f3401ee64f60b1 = 0;
    if (isagent(target)) {
        if (istrue(self.bsoldier)) {
            var_55f3401ee64f60b1 = 1;
        }
    } else if (!isbot(target)) {
        var_55f3401ee64f60b1 = isai(target);
    }
    if (var_55f3401ee64f60b1) {
        if (target isinscriptedstate()) {
            return 0;
        }
        if (target namespace_3c37cb17ade254d::doinglongdeath() || target.delayeddeath) {
            return 0;
        }
        /#
            assert(isdefined(self.stairsstate));
        #/
        /#
            assert(isdefined(target.stairsstate));
        #/
        if (self.stairsstate != "none" || target.stairsstate != "none") {
            return 0;
        }
        if (target.unittype != "soldier" && target.unittype != "civilian" && target.unittype != "juggernaut") {
            return 0;
        }
    }
    if (!isdefined(self.meleeignoreplayerstance) || !self.meleeignoreplayerstance || !isplayer(target)) {
        if (isplayer(target)) {
            var_4a72f9ea547e267e = target getstance();
        } else {
            var_4a72f9ea547e267e = target.currentpose;
        }
        if (var_4a72f9ea547e267e != "stand" && var_4a72f9ea547e267e != "crouch") {
            return 0;
        }
    }
    if (isdefined(self.magic_bullet_shield) && isdefined(target.magic_bullet_shield)) {
        return 0;
    }
    if (isdefined(target.grenade)) {
        return 0;
    }
    if (isdefined(target.lowcovervolume) && istrue(target.underlowcover)) {
        return 0;
    }
    return 1;
}

