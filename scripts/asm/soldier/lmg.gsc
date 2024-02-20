// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3433ee6b63c7e243;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;

#namespace lmg;

// Namespace lmg/namespace_e8ad99e3a0450129
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

// Namespace lmg/namespace_e8ad99e3a0450129
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

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29c
// Size: 0x23
function coverlmgterminate(asmname, statename, params) {
    self setdefaultaimlimits();
}

// Namespace lmg/namespace_e8ad99e3a0450129
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

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x380
// Size: 0x2b
function turretrequested(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(namespace_28edc79fcf2fe234::bb_getrequestedturret());
}

// Namespace lmg/namespace_e8ad99e3a0450129
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

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x42d
// Size: 0xf7
function playanim_deployturret(asmname, statename, params) {
    self._blackboard.usingaturret = 1;
    /#
        assert(isdefined(namespace_28edc79fcf2fe234::bb_getrequestedturret()));
    #/
    turret = namespace_28edc79fcf2fe234::bb_getrequestedturret();
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
    self useturret(namespace_28edc79fcf2fe234::bb_getrequestedturret());
}

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x52b
// Size: 0xed
function noanim_deployturret(asmname, statename, params) {
    self._blackboard.usingaturret = 1;
    /#
        assert(isdefined(namespace_28edc79fcf2fe234::bb_getrequestedturret()));
    #/
    turret = namespace_28edc79fcf2fe234::bb_getrequestedturret();
    /#
        assert(distancesquared(turret.origin, self.origin) < 4096);
    #/
    /#
        assert(!isdefined(self.customnotetrackhandler));
    #/
    self.asm.turretorigin = turret.origin;
    self.asm.turretangles = turret.angles;
    self.asm.turret = turret;
    self useturret(namespace_28edc79fcf2fe234::bb_getrequestedturret());
}

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x61f
// Size: 0x3b
function playanim_dismountturret(asmname, statename, params) {
    self._blackboard.usingaturret = 0;
    asm_playanimstate(asmname, statename, params);
}

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x661
// Size: 0xbd
function shoulddismountlmg(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (self._blackboard.usingaturret) {
        turret = self getturret();
        requestedturret = namespace_28edc79fcf2fe234::bb_getrequestedturret();
        usingturret = isdefined(turret) && turret getturretowner() == self;
        var_2c3448ad0ddb878f = usingturret && isdefined(requestedturret) && requestedturret == turret;
        return !var_2c3448ad0ddb878f;
    } else {
        var_40e1a590188133e8 = namespace_28edc79fcf2fe234::bb_moverequested();
        var_c2df580857cf5d57 = namespace_34bf5965727c0922::isatcovernode();
        return (var_40e1a590188133e8 || !var_c2df580857cf5d57);
    }
}

// Namespace lmg/namespace_e8ad99e3a0450129
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
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
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
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, xanim);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8d4
// Size: 0x26
function terminate_deploylmg(asmname, statename, params) {
    self.customnotetrackhandler = undefined;
}

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x901
// Size: 0x4d
function playanim_dismountlmg(asmname, statename, params) {
    self._blackboard.deployedlmgnode = undefined;
    self._blackboard.inlmgstate = 0;
    asm_playanimstate(asmname, statename);
}

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x955
// Size: 0xdb
function notehandler_deploylmg(note, flagname, customfunction, var_35ce7799b701c978) {
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

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa37
// Size: 0x64
function lowestcoverstanddeployposeis(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(params));
    #/
    if (isdefined(self.node)) {
        if (!self.node isvalidpeekoutdir("over")) {
            return (params == "high");
        }
        return (params == "stand");
    }
    return 0;
}

// Namespace lmg/namespace_e8ad99e3a0450129
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaa3
// Size: 0x5d
function desiredturretposeis(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(params));
    #/
    if (isdefined(self._blackboard.requestedturretpose)) {
        return (self._blackboard.requestedturretpose == params);
    }
    return 0;
}

