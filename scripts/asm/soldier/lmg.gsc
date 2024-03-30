// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3433ee6b63c7e243;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;

#namespace lmg;

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfa
// Size: 0x70
function playcovercrouchlmg(asmname, statename, params) {
    self._blackboard.droppedlmg = 0;
    thread asm_playanimstate(asmname, statename);
    self.asm.track.prev_time = 0;
    self.rightaimlimit = -80;
    self.leftaimlimit = 80;
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x171
// Size: 0x124
function coverturretterminate(asmname, statename, params) {
    self setdefaultaimlimits();
    currentturret = self getturret();
    if (!isdefined(currentturret) || isdefined(self.asm.turret) && currentturret == self.asm.turret) {
        self stopuseturret();
    }
    if (isdefined(self.asm.turret)) {
        self.asm.turret.origin = self.asm.turretorigin;
        self.asm.turret.angles = self.asm.turretangles;
    }
    self.asm.turret = undefined;
    self.asm.turretorigin = undefined;
    self.asm.turretangles = undefined;
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29c
// Size: 0x23
function coverlmgterminate(asmname, statename, params) {
    self setdefaultaimlimits();
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6
// Size: 0xb3
function playanim_droplmg(asmname, statename, params) {
    namespace_223959d3e5206cfb::dropaiweapon();
    if (!isnullweapon(self.sidearm)) {
        self.weapon = self.sidearm;
        self.bulletsinclip = weaponclipsize(self.weapon);
        namespace_223959d3e5206cfb::updateweaponarchetype(weaponclass(self.weapon));
    } else {
        namespace_223959d3e5206cfb::updateweaponarchetype("null");
    }
    self._blackboard.inlmgstate = 0;
    self._blackboard.deployedlmgnode = undefined;
    asm_playanimstate(asmname, statename, params);
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x380
// Size: 0x2b
function turretrequested(asmname, statename, tostatename, params) {
    return isdefined(scripts/asm/asm_bb::bb_getrequestedturret());
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3b3
// Size: 0x72
function chooseanim_deploylmg(asmname, statename, params) {
    if (istrue(self._blackboard.droppedlmg)) {
        /#
            assert(self.node == self._blackboard.deployedlmgnode);
        #/
        return asm_lookupanimfromalias(statename, "remount");
    }
    return asm_lookupanimfromalias(statename, "default");
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x42d
// Size: 0xf7
function playanim_deployturret(asmname, statename, params) {
    self._blackboard.usingaturret = 1;
    /#
        assert(isdefined(scripts/asm/asm_bb::bb_getrequestedturret()));
    #/
    turret = scripts/asm/asm_bb::bb_getrequestedturret();
    /#
        assert(distancesquared(turret.origin, self.origin) < 4096);
    #/
    /#
        assert(!isdefined(self.customnotetrackhandler));
    #/
    asm_playanimstatenotransition(asmname, statename, params);
    self.asm.turretorigin = turret.origin;
    self.asm.turretangles = turret.angles;
    self.asm.turret = turret;
    self useturret(scripts/asm/asm_bb::bb_getrequestedturret());
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x52b
// Size: 0xed
function noanim_deployturret(asmname, statename, params) {
    self._blackboard.usingaturret = 1;
    /#
        assert(isdefined(scripts/asm/asm_bb::bb_getrequestedturret()));
    #/
    turret = scripts/asm/asm_bb::bb_getrequestedturret();
    /#
        assert(distancesquared(turret.origin, self.origin) < 4096);
    #/
    /#
        assert(!isdefined(self.customnotetrackhandler));
    #/
    self.asm.turretorigin = turret.origin;
    self.asm.turretangles = turret.angles;
    self.asm.turret = turret;
    self useturret(scripts/asm/asm_bb::bb_getrequestedturret());
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x61f
// Size: 0x3b
function playanim_dismountturret(asmname, statename, params) {
    self._blackboard.usingaturret = 0;
    asm_playanimstate(asmname, statename, params);
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x661
// Size: 0xbd
function shoulddismountlmg(asmname, statename, tostatename, params) {
    if (self._blackboard.usingaturret) {
        turret = self getturret();
        requestedturret = scripts/asm/asm_bb::bb_getrequestedturret();
        usingturret = isdefined(turret) && turret getturretowner() == self;
        var_2c3448ad0ddb878f = usingturret && isdefined(requestedturret) && requestedturret == turret;
        return !var_2c3448ad0ddb878f;
    }
    moverequested = scripts/asm/asm_bb::bb_moverequested();
    atcovernode = scripts/asm/shared/utility::isatcovernode();
    return moverequested || !atcovernode;
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x725
// Size: 0x1a8
function playanim_deploylmg(asmname, statename, params) {
    if (isdefined(self.node)) {
        self._blackboard.deployedlmgnode = self.node;
        self.keepclaimednodeifvalid = 1;
    }
    /#
        assert(!isdefined(self.customnotetrackhandler));
    #/
    self.customnotetrackhandler = &notehandler_deploylmg;
    self._blackboard.inlmgstate = 1;
    animid = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, animid);
    if (isdefined(self.node)) {
        if (istrue(self._blackboard.droppedlmg)) {
            self forceteleport(self.node.origin, self.angles);
            self orientmode("face angle", self.node.angles[1]);
        } else {
            var_244a67eee2bcf197 = getangledelta(xanim);
            desiredyaw = self.node.angles[1] - var_244a67eee2bcf197;
            self orientmode("face angle", desiredyaw);
        }
    } else {
        self orientmode("face angle", self.angles[1]);
    }
    self endon(statename + "_finished");
    self aisetanim(statename, animid);
    asm_playfacialanim(asmname, statename, xanim);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8d4
// Size: 0x26
function terminate_deploylmg(asmname, statename, params) {
    self.customnotetrackhandler = undefined;
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x901
// Size: 0x4d
function playanim_dismountlmg(asmname, statename, params) {
    self._blackboard.deployedlmgnode = undefined;
    self._blackboard.inlmgstate = 0;
    asm_playanimstate(asmname, statename);
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x955
// Size: 0xdb
function notehandler_deploylmg(note, flagname, customfunction, customparams) {
    switch (note) {
    case #"hash_187a1588294dd34e":
        namespace_223959d3e5206cfb::placeweaponon(self.weapon, "none");
        break;
    case #"hash_c24ff1dd3ebd3f6c":
        /#
            assert(isdefined(self._blackboard.leftweaponent));
        #/
        self._blackboard.leftweaponent delete();
        self._blackboard.leftweaponent = undefined;
        /#
            assert(weaponclass(self.primaryweapon) == "mg");
        #/
        namespace_223959d3e5206cfb::placeweaponon(self.primaryweapon, "right");
        break;
    }
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa37
// Size: 0x64
function lowestcoverstanddeployposeis(asmname, statename, tostatename, params) {
    /#
        assert(isdefined(params));
    #/
    if (isdefined(self.node)) {
        if (!self.node isvalidpeekoutdir("over")) {
            return (params == "high");
        }
        return (params == "stand");
    }
    return false;
}

// Namespace lmg / scripts/asm/soldier/lmg
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaa3
// Size: 0x5d
function desiredturretposeis(asmname, statename, tostatename, params) {
    /#
        assert(isdefined(params));
    #/
    if (isdefined(self._blackboard.requestedturretpose)) {
        return (self._blackboard.requestedturretpose == params);
    }
    return false;
}

