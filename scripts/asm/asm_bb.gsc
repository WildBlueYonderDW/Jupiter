// mwiii decomp prototype
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\asm\asm.gsc;

#namespace namespace_db8c45290e56e5d9;

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a
// Size: 0xd
function bb_getprefixstring(category) {
    return undefined;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f
// Size: 0x60
function bb_wantstostrafe() {
    if (isdefined(self._blackboard.meleerequested) && self._blackboard.meleerequested) {
        return 1;
    }
    if (isdefined(self._blackboard.bwantstostrafe)) {
        return self._blackboard.bwantstostrafe;
    }
    return 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x21
function bb_requeststance(stance) {
    self._blackboard.desiredstance = stance;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff
// Size: 0x16
function bb_getrequestedstance() {
    return self._blackboard.desiredstance;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x21d
// Size: 0x38
function bb_isrequestedstance_refresh(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_55372344a55a6d53 = determinerequestedstance();
    return var_55372344a55a6d53 == params;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x5e
function bb_isrequestedstanceanddemeanor(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(params) && params.size == 2);
    #/
    return self._blackboard.desiredstance == params[0] && namespace_bf5a1761a8d1bb07::asm_getdemeanor() == params[1];
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3
// Size: 0x1d
function bb_setisincombat(var_8d72886daee52b56) {
    self.bisincombat = !isdefined(var_8d72886daee52b56) || var_8d72886daee52b56;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7
// Size: 0xc
function bb_isincombat() {
    return self.bisincombat;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb
// Size: 0x34
function bb_isweaponclass(asmname, statename, var_f2b19b25d457c2a6, params) {
    return weaponclass(self.weapon) == params;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x337
// Size: 0x5c
function bb_shoulddroprocketlauncher(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (weaponclass(self.weapon) != "rocketlauncher") {
        return 0;
    }
    var_86edb844b65f73e7 = bb_getrequestedweapon();
    if (!isdefined(var_86edb844b65f73e7)) {
        return 0;
    }
    return var_86edb844b65f73e7 != "rocketlauncher";
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39b
// Size: 0x3
function bb_requestmove() {
    
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a5
// Size: 0x3
function bb_clearmoverequest() {
    
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3af
// Size: 0x9
function bb_moverequested() {
    return self codemoverequested();
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x21
function bb_movetyperequested(movetype) {
    return self._blackboard.movetype == movetype;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e9
// Size: 0x21
function bb_requestmovetype(movetype) {
    self._blackboard.movetype = movetype;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0x21
function bb_requestweapon(weapon) {
    self._blackboard.weaponrequest = weapon;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x439
// Size: 0x1c
function bb_clearweaponrequest() {
    self._blackboard.weaponrequest = "none";
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0x4c
function bb_getrequestedweapon() {
    if (isdefined(self._blackboard.weaponrequest) && self._blackboard.weaponrequest == "none") {
        return undefined;
    }
    return self._blackboard.weaponrequest;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b0
// Size: 0x3f
function bb_requestreload(breload) {
    if (!isdefined(breload)) {
        self._blackboard.breload = 1;
    } else {
        self._blackboard.breload = breload;
    }
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f6
// Size: 0x16
function bb_reloadrequested() {
    return self._blackboard.breload;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x514
// Size: 0x47
function bb_throwgrenaderequested() {
    if (isdefined(self._blackboard.bthrowgrenade)) {
        return (self._blackboard.bthrowgrenade && isdefined(self._blackboard.throwgrenadetarget));
    }
    return 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x563
// Size: 0x16
function bb_getthrowgrenadetarget() {
    return self._blackboard.throwgrenadetarget;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x581
// Size: 0x3f
function bb_requestfire(bfire) {
    if (!isdefined(bfire)) {
        self._blackboard.bfire = 1;
    } else {
        self._blackboard.bfire = bfire;
    }
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c7
// Size: 0x17
function bb_firerequested() {
    return istrue(self._blackboard.bfire);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e6
// Size: 0x21
function bb_claimshootparams(taskid) {
    self._blackboard.shootparams_taskid = taskid;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60e
// Size: 0x5c
function bb_shootparams_idsmatch() {
    if (!istrue(self._blackboard.shootparams_valid)) {
        return 0;
    }
    if (!isdefined(self._blackboard.shootparams_readid)) {
        return 0;
    }
    return self._blackboard.shootparams_writeid == self._blackboard.shootparams_readid;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x672
// Size: 0x3e
function bb_updateshootparams_pos(pos) {
    /#
        assert(istrue(self._blackboard.shootparams_valid));
    #/
    self._blackboard.shootparams_pos = pos;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b7
// Size: 0x2b
function bb_clearshootparams() {
    self._blackboard.shootparams_ent = undefined;
    self._blackboard.shootparams_valid = 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6e9
// Size: 0x22
function bb_setshootparams(shootparams, target) {
    /#
        assertmsg("should only be used by obsolete things now.");
    #/
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x712
// Size: 0x1d
function bb_requestcoverstate(state, var_55b1b4a8c2ba7aa2) {
    self setcoverstate(state, var_55b1b4a8c2ba7aa2);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x736
// Size: 0x33
function bb_getrequestedcoverstate() {
    if (!isdefined(self._blackboard.coverstate)) {
        return "none";
    }
    return self._blackboard.coverstate;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x771
// Size: 0x21
function bb_requestcoverexposetype(var_270393d6fb596021) {
    self._blackboard.coverexposetype = var_270393d6fb596021;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x799
// Size: 0x16
function bb_getrequestedcoverexposetype() {
    return self._blackboard.coverexposetype;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b7
// Size: 0x21
function bb_requestcoverblindfire(var_690e06db214b7bec) {
    self._blackboard.blindfire = var_690e06db214b7bec;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7df
// Size: 0x16
function bb_setcovernode(node) {
    self.covernode = node;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7fc
// Size: 0x2e
function bb_hadcovernode(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self.covernode);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x832
// Size: 0xc
function bb_getcovernode() {
    return self.covernode;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x846
// Size: 0x2f
function bb_getrequestedturret() {
    if (isdefined(self._blackboard.requestedturret)) {
        return self._blackboard.requestedturret;
    }
    return undefined;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87d
// Size: 0x67
function bb_requestturret(turret) {
    self._blackboard.requestedturret = turret;
    if (isdefined(turret.script_delay_min)) {
        self.var_29ca84991e64ec65 = turret.script_delay_min;
    }
    if (isdefined(turret.script_delay_max)) {
        self.var_29ee8e991e8d7d1b = turret.script_delay_max;
    }
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eb
// Size: 0x59
function bb_requestturretpose(pose) {
    /#
        assert(!isdefined(pose) || pose == "prone" || pose == "crouch" || pose == "stand" || pose == "exposed");
    #/
    self._blackboard.requestedturretpose = pose;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x94b
// Size: 0x8f
function bb_hasshufflenode(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self._blackboard.shufflenode) && isdefined(self.node) && self._blackboard.shufflenode == self.node && distancesquared(self.node.origin, self.origin) > 16;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e2
// Size: 0x19
function bb_setanimscripted() {
    self._blackboard.animscriptedactive = 1;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa02
// Size: 0x18
function bb_clearanimscripted() {
    self._blackboard.animscriptedactive = 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x4c
function bb_isanimscripted() {
    if (isdefined(self.script)) {
        if (self.script == "scripted" || self.script == "<custom>") {
            return 1;
        }
    }
    return istrue(self._blackboard.animscriptedactive);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa75
// Size: 0x4c
function bb_requestmelee(target) {
    self._blackboard.meleerequested = 1;
    self._blackboard.meleerequestedtarget = target;
    self._blackboard.meleerequestedcomplete = 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8
// Size: 0x2e
function bb_getmeleetarget() {
    if (!self._blackboard.meleerequested) {
        return undefined;
    }
    return self._blackboard.meleerequestedtarget;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xafe
// Size: 0x2b
function bb_clearmeleerequest() {
    self._blackboard.meleerequested = 0;
    self._blackboard.meleerequestedtarget = undefined;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb30
// Size: 0x16
function bb_clearmeleerequestcomplete() {
    self._blackboard.meleerequestedcomplete = undefined;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb4d
// Size: 0x38
function bb_meleeinprogress(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self._blackboard.meleerequestedcomplete);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb8d
// Size: 0x4f
function bb_meleecomplete(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self._blackboard.meleerequestedcomplete) && self._blackboard.meleerequestedcomplete;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe4
// Size: 0x16
function bb_meleerequested() {
    return self._blackboard.meleerequested;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc02
// Size: 0x44
function bb_meleerequestinvalid(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.var_a97ac004f00c5df9) {
        return 1;
    }
    if (!isdefined(self.var_9bfc452192b23c7a)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc4e
// Size: 0x5f
function bb_requestmeleecharge(target, targetpos) {
    /#
        assert(isdefined(targetpos));
    #/
    self._blackboard.meleerequestedcharge = 1;
    self._blackboard.meleerequestedcharge_target = target;
    self._blackboard.meleerequestedcharge_targetposition = targetpos;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb4
// Size: 0x3e
function bb_clearmeleechargerequest() {
    self._blackboard.meleerequestedcharge = 0;
    self._blackboard.meleerequestedcharge_target = undefined;
    self._blackboard.meleerequestedcharge_targetposition = undefined;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf9
// Size: 0x3c
function bb_meleechargerequested() {
    return isdefined(self._blackboard.meleerequestedcharge) && self._blackboard.meleerequestedcharge && isdefined(self.pathgoalpos);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd3d
// Size: 0x31
function bb_meleechargeaborted(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (bb_meleechargerequested()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd76
// Size: 0x47
function bb_getmeleechargetarget() {
    if (!isdefined(self._blackboard.meleerequestedcharge) || !self._blackboard.meleerequestedcharge) {
        return undefined;
    }
    return self._blackboard.meleerequestedcharge_target;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc5
// Size: 0x4a
function bb_getmeleechargetargetpos() {
    /#
        assert(isdefined(self._blackboard.meleerequestedcharge) && self._blackboard.meleerequestedcharge);
    #/
    return self._blackboard.meleerequestedcharge_targetposition;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe17
// Size: 0x21
function bb_requestgrenadereturnthrow(var_864246cff0439473) {
    self._blackboard.bgrenadereturnthrow = var_864246cff0439473;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3f
// Size: 0x17
function bb_iswhizbyrequested() {
    return isdefined(self._blackboard.var_9f7c458052d2c805);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5e
// Size: 0x79
function bb_isfrantic() {
    covernode = bb_getcovernode();
    if (!isdefined(covernode)) {
        covernode = self.node;
    }
    var_a31fcf6fa75167d6 = isdefined(covernode) && (covernode.type == "Conceal Crouch" || covernode.type == "Conceal Stand");
    return self._blackboard.movetype == "frantic" && !var_a31fcf6fa75167d6;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xedf
// Size: 0x1d
function bb_ismissingaleg() {
    missing = bb_getmissingleg();
    if (isdefined(missing)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf04
// Size: 0x91
function bb_getmissingleg() {
    count = 0;
    str = undefined;
    if (!isdefined(self._blackboard.dismemberedparts)) {
        return str;
    }
    if (isdefined(self._blackboard.dismemberedparts["left_leg"])) {
        count++;
        str = "left";
    }
    if (isdefined(self._blackboard.dismemberedparts["right_leg"])) {
        count++;
        str = "right";
    }
    if (count == 2) {
        str = "both";
    }
    return str;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9d
// Size: 0xa2
function ispartdismembered(part) {
    if (!isdefined(self._blackboard)) {
        return 0;
    }
    if (isdefined(self._blackboard.scriptableparts)) {
        if (!isdefined(self._blackboard.scriptableparts[part])) {
            return 0;
        }
        return (self._blackboard.scriptableparts[part].state == "dismember");
    }
    if (!isdefined(self._blackboard.dismemberedparts)) {
        return 0;
    }
    return isdefined(self._blackboard.dismemberedparts[part]);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1047
// Size: 0x2b
function bb_ispartdismembered(asmname, statename, var_f2b19b25d457c2a6, params) {
    return ispartdismembered(params);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107a
// Size: 0xdd
function waspartjustdismembered(part) {
    if (isdefined(self._blackboard.scriptableparts)) {
        if (!isdefined(self._blackboard.scriptableparts[part])) {
            return 0;
        }
        if (self._blackboard.scriptableparts[part].state != "dismember") {
            return 0;
        }
        return (self._blackboard.scriptableparts[part].time == gettime());
    }
    if (!isdefined(self._blackboard.dismemberedparts)) {
        return 0;
    }
    if (!isdefined(self._blackboard.dismemberedparts[part])) {
        return 0;
    }
    return self._blackboard.dismemberedparts[part] == gettime();
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x115f
// Size: 0x2b
function bb_waspartjustdismembered(asmname, statename, var_f2b19b25d457c2a6, params) {
    return waspartjustdismembered(params);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1192
// Size: 0x3b
function bb_werepartsdismemberedinorder(asm, statename, var_f2b19b25d457c2a6, params) {
    return ispartdismembered(params[0]) && waspartjustdismembered(params[1]);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d5
// Size: 0x27
function bb_dismemberedpart(part) {
    self._blackboard.dismemberedparts[part] = gettime();
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1203
// Size: 0x21
function bb_setselfdestruct(val) {
    self._blackboard.selfdestruct = val;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x122b
// Size: 0x78
function bb_isselfdestruct() {
    if (!isdefined(self._blackboard.selfdestruct)) {
        if (isdefined(self.bt.forceselfdestructtimer) && gettime() > self.bt.forceselfdestructtimer) {
            self._blackboard.selfdestruct = 1;
        }
    }
    return isdefined(self._blackboard.selfdestruct);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ab
// Size: 0x19
function bb_selfdestructnow() {
    self._blackboard.selfdestructnow = 1;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12cb
// Size: 0x17
function bb_shouldselfdestructnow() {
    return isdefined(self._blackboard.selfdestructnow);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ea
// Size: 0x21
function bb_setheadless(val) {
    self._blackboard.isheadless = val;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1312
// Size: 0x30
function bb_isheadless() {
    if (isdefined(self.bt.crawlmeleegrab)) {
        return 0;
    }
    return isdefined(self._blackboard.isheadless);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x134a
// Size: 0xb1
function bb_setcanrodeo(side, var_e7096ce45cda4606) {
    if (!isdefined(var_e7096ce45cda4606)) {
        var_e7096ce45cda4606 = 1;
    }
    opposite = "left";
    if (side == opposite) {
        opposite = "right";
    }
    if (isdefined(self._blackboard.rodeo) && isdefined(self._blackboard.rodeo[opposite])) {
        self._blackboard.rodeo[opposite] = 0;
        self._blackboard.rodeo[side] = 0;
        return;
    }
    self._blackboard.rodeo[side] = var_e7096ce45cda4606;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1402
// Size: 0x5c
function bb_canrodeo(side) {
    if (!isdefined(self._blackboard.rodeo)) {
        return 0;
    }
    if (!isdefined(self._blackboard.rodeo[side])) {
        return 0;
    }
    if (!self._blackboard.rodeo[side]) {
        return 0;
    }
    return 1;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1466
// Size: 0x21
function bb_setrodeorequest(val) {
    self._blackboard.rodeorequest = val;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x148e
// Size: 0x1f
function bb_clearrodeorequest(val) {
    self._blackboard.rodeorequested = undefined;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x14b4
// Size: 0x3f
function bb_isrodeorequested(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self._blackboard.rodeorequest)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fb
// Size: 0xa
function bb_clearmeleetarget() {
    self function_bdcb37a9431e654();
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x150c
// Size: 0x21
function bb_setcrawlmelee(val) {
    self._blackboard.crawlmelee = val;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1534
// Size: 0x17
function bb_iscrawlmelee() {
    return isdefined(self._blackboard.crawlmelee);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1553
// Size: 0x21
function bb_sethaywire(val) {
    self._blackboard.haywire = val;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x157b
// Size: 0x17
function bb_ishaywire() {
    return isdefined(self._blackboard.haywire);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159a
// Size: 0x16
function bb_gethaywire() {
    return self._blackboard.haywire;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b8
// Size: 0x21
function bb_setisinbadcrouchspot(bbadcrouchspot) {
    self._blackboard.bbadcrouchspot = bbadcrouchspot;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e0
// Size: 0x17
function bb_isinbadcrouchspot() {
    return istrue(self._blackboard.bbadcrouchspot);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ff
// Size: 0xc
function bb_setcivilianstate(state) {
    
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1612
// Size: 0x8
function bb_getcivilianstate() {
    return "deprecated";
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1622
// Size: 0x16
function bb_getcivilianstatetime() {
    return self._blackboard.civstatetime;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1640
// Size: 0x14
function bb_civilianrequestspeed(speed) {
    self aisetdesiredspeed(speed);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165b
// Size: 0x17
function bb_isshort() {
    return istrue(self._blackboard.var_4ac74770bb9bb41);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167a
// Size: 0x21
function bb_setshort(value) {
    self._blackboard.var_4ac74770bb9bb41 = value;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a2
// Size: 0x17
function bb_smartobjectrequested() {
    return isdefined(self._blackboard.smartobject);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c1
// Size: 0xa1
function bb_requestsmartobject(value) {
    self._blackboard.smartobject = value;
    if (isdefined(self._blackboard.smartobject) && isdefined(self._blackboard.smartobject.angles)) {
        self._blackboard.var_69005b71b6433121 = 1;
        self._blackboard.var_b9eb5585d7a64ec1 = self._blackboard.smartobject.angles;
    }
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1769
// Size: 0x16
function bb_getrequestedsmartobject() {
    return self._blackboard.smartobject;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1787
// Size: 0x32
function bb_clearsmartobject() {
    self._blackboard.smartobject = undefined;
    self._blackboard.var_69005b71b6433121 = 0;
    bb_clearplaysmartobject();
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c0
// Size: 0x36
function bb_requestplaysmartobject() {
    /#
        assert(isdefined(self._blackboard.smartobject));
    #/
    self._blackboard.bplaysmartobject = 1;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fd
// Size: 0x18
function bb_clearplaysmartobject() {
    self._blackboard.bplaysmartobject = 0;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181c
// Size: 0x17
function bb_playsmartobjectrequested() {
    return istrue(self._blackboard.bplaysmartobject);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183b
// Size: 0x33
function bb_getrequestedcovermultiswitchnodetype() {
    /#
        assert(isdefined(self._blackboard.docovermultiswitchnodetype));
    #/
    return self._blackboard.docovermultiswitchnodetype;
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1876
// Size: 0x17
function bb_iscovermultiswitchrequested() {
    return isdefined(self._blackboard.docovermultiswitchnodetype);
}

// Namespace namespace_db8c45290e56e5d9/namespace_28edc79fcf2fe234
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1895
// Size: 0xe9
function bb_canplaygesture(asmname, statename, var_f2b19b25d457c2a6, gesture) {
    if (!isdefined(self._blackboard.gesturerequest)) {
        return 0;
    }
    if (isdefined(gesture) && self._blackboard.gesturerequest.gesture != gesture) {
        return 0;
    }
    if (!isdefined(self._blackboard.gesturerequest.latestalias)) {
        return 0;
    }
    if (gettime() > self._blackboard.gesturerequest.timeoutms) {
        return 0;
    }
    var_1cf23414dfa8574f = self._blackboard.gesturerequest.latestalias;
    if (!namespace_bf5a1761a8d1bb07::asm_hasalias(var_f2b19b25d457c2a6, var_1cf23414dfa8574f)) {
        return 0;
    }
    return 1;
}

