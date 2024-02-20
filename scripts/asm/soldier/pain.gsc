// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_7e4d332e911e1b90;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\face.gsc;
#using scripts\asm\soldier\death.gsc;
#using scripts\asm\soldier\script_funcs.gsc;
#using script_50eeb9595c6d6e1b;
#using script_3433ee6b63c7e243;

#namespace pain;

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x57d
// Size: 0x47
function isdamagelocation_rarm(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.damageshield) {
        return damagelocationisany("right_arm_upper", "right_arm_lower", "right_hand");
    }
    return 0;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc
// Size: 0x47
function isdamagelocation_rleg(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.damageshield) {
        return damagelocationisany("right_leg_upper", "right_foot", "right_leg_lower");
    }
    return 0;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x61b
// Size: 0x47
function isdamagelocation_lleg(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.damageshield) {
        return damagelocationisany("left_leg_upper", "left_foot", "left_leg_lower");
    }
    return 0;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x66a
// Size: 0x47
function isdamagelocation_larm(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.damageshield) {
        return damagelocationisany("left_arm_upper", "left_arm_lower", "left_hand");
    }
    return 0;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6b9
// Size: 0x42
function isdamagelocation_torso(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.damageshield) {
        return damagelocationisany("torso_upper", "torso_lower");
    }
    return 0;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x703
// Size: 0x47
function isdamagelocation_head(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.damageshield) {
        return damagelocationisany("head", "neck", "helmet");
    }
    return 0;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x752
// Size: 0x4d
function isdamagelocation_larmcrouch(asmname, statename, var_f2b19b25d457c2a6, params) {
    return damagelocationisany("left_hand", "left_arm_upper", "left_arm_lower", "left_leg_upper", "left_leg_lower", "left_foot", "torso_lower");
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7a7
// Size: 0x68
function isdamagelocation_back(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.damageshield) {
        if (gethumandamagedirstring() == 1 && !damagelocationisany("left_leg_upper", "left_leg_lower", "left_foot", "right_leg_upper", "right_leg_lower", "right_foot")) {
            return 1;
        }
    }
    return 0;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x817
// Size: 0x66
function isdamagelocation_torsocovercrouch(asmname, statename, var_f2b19b25d457c2a6, params) {
    return damagelocationisany("right_arm_upper", "right_arm_lower", "right_hand", "left_hand", "left_arm_upper", "left_arm_lower", "left_leg_upper", "left_leg_lower", "left_foot", "right_leg_upper", "right_leg_lower", "right_foot");
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x885
// Size: 0x32
function choosepainanimshock(asmname, statename, params) {
    return asm_lookupanimfromalias(statename, "shock_loop_" + self.currentpose);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bf
// Size: 0x5f
function playsonicshockfx() {
    if (utility::isdamageweapon(makeweapon("iw7_sonic")) && utility::isweaponepic(self.damageweapon)) {
        playfxontag(level.g_effect["soldier_shock"], self, "j_knee_ri");
        playfxontag(level.g_effect["soldier_shock"], self, "j_shoulder_ri");
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x925
// Size: 0x112
function playshockpainloop(asmname, statename, params) {
    self endon("death");
    self endon(statename + "_finished");
    var_c9edb1b72607d824 = asm_getanim(asmname, statename);
    loop_time = ter_op(isdefined(self.empstuntime), self.empstuntime, 3.5);
    playsonicshockfx();
    self animmode("zonly_physics", 0);
    wait(randomfloat(0.3));
    if (self.asmname == "c6" || self.asmname == "c6_worker") {
        thread shockpainloop_internal(self.asmname, statename, 1, 0, 1);
        self playsound("generic_flashbang_c6_1");
    } else {
        thread shockpainloop_internal(self.asmname, statename, 1, 0);
    }
    wait(loop_time);
    self notify("painloop_end");
    asm_fireevent(asmname, "stop_loop_pain");
    self.emplooptime = undefined;
    finishpain(asmname, statename, params);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa3e
// Size: 0x23
function shockpainloop_c6_cleanup(asmname, statename, params) {
    self stopsounds();
}

// Namespace pain/namespace_7eac13b458714f13
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa68
// Size: 0xf3
function shockpainloop_internal(asmname, statename, var_c08b84490b532fb2, var_9177df4fa6f67675, var_d865b83b6d412e31) {
    self endon(statename + "_finished");
    self endon("painloop_end");
    if (isdefined(var_9177df4fa6f67675) && var_9177df4fa6f67675) {
        var_bf3de88b0e06a07c = asm_lookupanimfromaliasifexists("knobs", "move");
        if (isdefined(var_bf3de88b0e06a07c)) {
            self setmoveanimknob(var_bf3de88b0e06a07c);
        }
    }
    prevanim = asm_getbodyknob();
    curanim = asm_getanim(asmname, statename);
    while (1) {
        if (isdefined(var_d865b83b6d412e31)) {
            curanim = asm_getanim(asmname, statename);
        }
        var_678b2c6541e01262 = asm_getxanim(statename, curanim);
        self aisetanim(statename, curanim, var_c08b84490b532fb2);
        asm_playfacialanim(asmname, statename, var_678b2c6541e01262);
        prevanim = curanim;
        asm_donotetrackssingleloop(asmname, statename, var_678b2c6541e01262, asm_getnotehandler(asmname, statename));
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb62
// Size: 0x32
function chooseshockpainrecovery(asmname, statename, params) {
    return asm_lookupanimfromalias(statename, "shock_finish_" + self.currentpose);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9c
// Size: 0x27
function playpainanim(asmname, statename, params) {
    playpainaniminternal(asmname, statename, params, 0);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbca
// Size: 0x28
function playpainanimwithadditives(asmname, statename, params) {
    playpainaniminternal(asmname, statename, params, 1);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbf9
// Size: 0x3d
function playpainanimlmg(asmname, statename, params) {
    self._blackboard.inlmgstate = 1;
    playpainaniminternal(asmname, statename, params, 0);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc3d
// Size: 0x21
function pain_can_use_handler(note, params) {
    if (note == "pain_can_end") {
        return 1;
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc65
// Size: 0x13c
function getpainweaponsize() {
    size = "_md";
    var_3e7b2f709e2f6164 = "rifle";
    objweapon = self.damageweapon;
    if (isdefined(objweapon) && objweapon.basename != "iw8_sn_mike14") {
        var_3e7b2f709e2f6164 = objweapon.classname;
    }
    if (var_3e7b2f709e2f6164 == "pistol" || var_3e7b2f709e2f6164 == "smg") {
        size = "_md";
    } else if (var_3e7b2f709e2f6164 == "spread") {
        size = "_md";
        if (isdefined(self.lastattacker) && distancesquared(self.lastattacker.origin, self.origin) <= 62500) {
            size = "_lg";
        }
    } else if (var_3e7b2f709e2f6164 == "sniper" || var_3e7b2f709e2f6164 == "mg") {
        size = "_lg";
    } else if (var_3e7b2f709e2f6164 == "grenade" && isdefined(self.damagemod) && self.damagemod == "MOD_IMPACT") {
        size = "_lg";
    }
    if (isdefined(level.fnasmsoldiergetpainweaponsize)) {
        size = self [[ level.fnasmsoldiergetpainweaponsize ]](size);
    }
    return size;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda9
// Size: 0xc0
function getpaindirectiontoactor() {
    if (isdefined(self.damageyaw) && self.damageyaw >= -45 && self.damageyaw <= 45) {
        dir = "_b";
        return dir;
    } else if (isdefined(self.damageyaw) && self.damageyaw < -45 && self.damageyaw > -135) {
        dir = "_l";
        return dir;
    } else if (isdefined(self.damageyaw) && self.damageyaw > 45 && self.damageyaw < 135) {
        dir = "_r";
        return dir;
    } else {
        dir = "_f";
        return dir;
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe70
// Size: 0x4d
function choosedirectionalpainanim_transition(asmname, statename, params) {
    if (isdefined(self.var_872a8e737f3e5358)) {
        var_6ad9995dd505716a = self.var_872a8e737f3e5358;
        return asm_lookupanimfromalias(statename, var_6ad9995dd505716a);
    }
    return asm_getrandomanim(statename);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec5
// Size: 0x276
function playpainaniminternal(asmname, statename, params, var_837bcc3e005feb5d, var_96d69c0cc6fb90c1, var_1a502982e90b16d9, var_b6a66cc6c81067a0, var_94987ccb5819c6e9) {
    self endon(statename + "_finished");
    if (isdefined(self.a.paintime)) {
        self.a.lastpaintime = self.a.paintime;
    } else {
        self.a.lastpaintime = 0;
    }
    self.a.paintime = gettime();
    if (self.stairsstate != "none") {
        self.a.painonstairs = 1;
    } else {
        self.a.painonstairs = undefined;
    }
    self.a.var_682a42d4ea27fe49 = 1;
    if (isdefined(self.var_40bc0e4adb7920bd)) {
        var_35ab2dabe0210d0f = [[ self.var_40bc0e4adb7920bd ]]();
        if (!istrue(var_35ab2dabe0210d0f)) {
            self.a.var_682a42d4ea27fe49 = undefined;
            return;
        }
    }
    self animmode("gravity");
    if (!istrue(var_b6a66cc6c81067a0)) {
        self orientmode("face angle", self.angles[1]);
    }
    if (!isdefined(self.no_pain_sound)) {
        namespace_166dc34a2c7481df::saygenericdialogue("pain");
    }
    if (namespace_f0a0c13f724da4b::shouldhelmetpoponpain(utility::wasdamagedbyexplosive())) {
        namespace_f0a0c13f724da4b::helmetpop();
    }
    animstatename = statename;
    if (isdefined(var_1a502982e90b16d9)) {
        animstatename = var_1a502982e90b16d9;
    }
    var_c9edb1b72607d824 = asm_getanim(asmname, statename, params);
    /#
        assert(isdefined(var_c9edb1b72607d824));
    #/
    self aisetanim(animstatename, var_c9edb1b72607d824);
    var_6b9ecb781431451a = asm_getxanim(animstatename, var_c9edb1b72607d824);
    asm_playfacialanim(asmname, statename, var_6b9ecb781431451a);
    if (isdefined(var_94987ccb5819c6e9)) {
        self thread [[ var_94987ccb5819c6e9 ]](asmname, statename, var_c9edb1b72607d824, var_6b9ecb781431451a);
    }
    self.requestdifferentcover = 1;
    if (animhasnotetrack(var_6b9ecb781431451a, "code_move")) {
        asm_donotetracks(asmname, statename, undefined, undefined, animstatename);
    }
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename), undefined, animstatename);
    if (istrue(var_96d69c0cc6fb90c1)) {
        finishpain(asmname, statename, params);
    } else {
        finishpain(asmname, statename);
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1142
// Size: 0x2c
function paincanend(statename, var_6ef4fd3894a9f0a2) {
    switch (var_6ef4fd3894a9f0a2) {
    case #"hash_b28f889d3f68dd76":
        return 1;
        break;
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1175
// Size: 0x58
function coverexppainselectreturna(asmname, statename, params) {
    if (isdefined(self._blackboard.coverexposetype) && self._blackboard.coverexposetype == "A") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d4
// Size: 0x6c
function finishpain(asmname, statename, params) {
    self.a.var_682a42d4ea27fe49 = undefined;
    self notify("killanimscript");
    returnstate = undefined;
    if (isdefined(params)) {
        if (isarray(params)) {
            returnstate = params[0];
        } else {
            returnstate = params;
        }
    }
    if (!isdefined(returnstate)) {
        return;
    }
    thread asm_setstate(returnstate, undefined);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1247
// Size: 0x33
function playcoverpainanimwithadditives(asmname, statename, params) {
    self.keepclaimednodeifvalid = 1;
    playpainaniminternal(asmname, statename, params, 1);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1281
// Size: 0x31
function playcoverpainanim(asmname, statename, params) {
    self.keepclaimednodeifvalid = 1;
    playpainanim(asmname, statename, params);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12b9
// Size: 0x97
function choosepainanim_standtorsotoexposed(asmname, statename, params) {
    /#
        assert(isdefined(self.lasttorsoanim));
    #/
    if (self.lasttorsoanim == "torso_upper") {
        var_24be4e2b091e63bf = asm_lookupanimfromalias(statename, "torso_upper");
    } else if (self.lasttorsoanim == "torso_lower") {
        var_24be4e2b091e63bf = asm_lookupanimfromalias(statename, "torso_lower");
    } else {
        var_24be4e2b091e63bf = asm_lookupanimfromalias(statename, "default");
    }
    self.lasttorsoanim = undefined;
    return var_24be4e2b091e63bf;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1358
// Size: 0x8f
function choosepainanim_standtorso(asmname, statename, params) {
    if (damagelocationisany("torso_upper")) {
        self.lasttorsoanim = "torso_upper";
        return asm_lookupanimfromalias(statename, "torso_upper");
    } else if (damagelocationisany("torso_lower")) {
        self.lasttorsoanim = "torso_lower";
        return asm_lookupanimfromalias(statename, "torso_lower");
    } else {
        self.lasttorsoanim = "default";
        return asm_lookupanimfromalias(statename, "default");
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13ee
// Size: 0x17f
function choosepainanim_stand(asmname, statename, params) {
    if (isusingsidearm()) {
        return choosepainanim_pistol(asmname, statename, params);
    }
    var_53aabd9cafd5b202 = [];
    if (damagelocationisany("torso_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "torso_upper");
    } else if (damagelocationisany("torso_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "torso_lower");
    } else if (damagelocationisany("head", "helmet", "neck")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "head");
    } else if (damagelocationisany("right_arm_upper", "right_arm_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "right_arm");
    } else if (damagelocationisany("left_arm_upper", "left_arm_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "left_arm");
    } else if (damagelocationisany("left_leg_upper", "left_leg_lower", "left_foot")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "left_leg");
    } else if (damagelocationisany("right_leg_upper", "right_leg_lower", "right_foot")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "right_leg");
    }
    if (var_53aabd9cafd5b202.size < 2) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "default");
    }
    /#
        assertex(var_53aabd9cafd5b202.size > 0, var_53aabd9cafd5b202.size);
    #/
    return var_53aabd9cafd5b202[randomint(var_53aabd9cafd5b202.size)];
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1575
// Size: 0x59
function choosepainanim_damageshield(asmname, statename, params) {
    var_53aabd9cafd5b202 = [];
    if (var_53aabd9cafd5b202.size < 2) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "default");
    }
    /#
        assertex(var_53aabd9cafd5b202.size > 0, var_53aabd9cafd5b202.size);
    #/
    return var_53aabd9cafd5b202[randomint(var_53aabd9cafd5b202.size)];
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15d6
// Size: 0x51
function choosedynamicpainanim_expcrouchlegs(asmname, statename, params) {
    var_53aabd9cafd5b202 = [];
    var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "default");
    /#
        assertex(var_53aabd9cafd5b202.size > 0, var_53aabd9cafd5b202.size);
    #/
    return var_53aabd9cafd5b202[randomint(var_53aabd9cafd5b202.size)];
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x162f
// Size: 0xa3
function choosepainanim_crouch(asmname, statename, params) {
    var_53aabd9cafd5b202 = [];
    var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "default");
    if (damagelocationisany("left_hand", "left_arm_lower", "left_arm_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "left_arm");
    }
    if (damagelocationisany("right_hand", "right_arm_lower", "right_arm_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "right_arm");
    }
    /#
        assertex(var_53aabd9cafd5b202.size > 0, var_53aabd9cafd5b202.size);
    #/
    return var_53aabd9cafd5b202[randomint(var_53aabd9cafd5b202.size)];
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16da
// Size: 0x18d
function choosepainanim_pistol(asmname, statename, params) {
    var_53aabd9cafd5b202 = [];
    if (damagelocationisany("torso_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_torso_upper");
    } else if (damagelocationisany("torso_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_torso_lower");
    } else if (damagelocationisany("neck")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_neck");
    } else if (damagelocationisany("head")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_head");
    } else if (damagelocationisany("left_leg_upper", "right_leg_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_leg");
    } else if (damagelocationisany("left_arm_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_left_arm_upper");
    } else if (damagelocationisany("left_arm_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_left_arm_lower");
    } else if (damagelocationisany("right_arm_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_right_arm_upper");
    } else if (damagelocationisany("right_arm_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_right_arm_lower");
    }
    if (var_53aabd9cafd5b202.size < 2) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "pistol_default");
    }
    /#
        assertex(var_53aabd9cafd5b202.size > 0, var_53aabd9cafd5b202.size);
    #/
    return var_53aabd9cafd5b202[randomint(var_53aabd9cafd5b202.size)];
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186f
// Size: 0x6d
function choosepainanim_covercorner_helper(asmname, statename, params, angles) {
    if (isdefined(params) && isdefined(params[1])) {
        return asm_lookupanimfromalias(statename, params[1]);
    }
    if (self.currentpose == "crouch") {
        return asm_lookupanimfromalias(statename, "crouch");
    } else {
        return asm_lookupanimfromalias(statename, "stand");
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18e3
// Size: 0x26
function choosepainanim_covercorner(asmname, statename, params) {
    return choosepainanim_covercorner_helper(asmname, statename, params, undefined);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1911
// Size: 0x34
function choosedynamicpainanim_back(asmname, statename, params) {
    alias = "back";
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x194d
// Size: 0xa9
function choosedynamicpainanim_covercrouch(asmname, statename, params) {
    var_53aabd9cafd5b202 = [];
    if (damagelocationisany("torso_upper", "torso_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "torso");
    } else if (damagelocationisany("head", "helmet", "neck")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "head");
    }
    if (var_53aabd9cafd5b202.size < 2) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "default");
    }
    /#
        assertex(var_53aabd9cafd5b202.size > 0, var_53aabd9cafd5b202.size);
    #/
    return var_53aabd9cafd5b202[randomint(var_53aabd9cafd5b202.size)];
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19fe
// Size: 0x16c
function choosedynamicpainanim_coverstand(asmname, statename, params) {
    var_53aabd9cafd5b202 = [];
    if (damagelocationisany("torso_upper")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "torso_upper");
    } else if (damagelocationisany("torso_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "torso_lower");
    } else if (damagelocationisany("head", "helmet", "neck")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "head");
    } else if (damagelocationisany("right_arm_upper", "right_arm_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "right_arm");
    } else if (damagelocationisany("left_arm_upper", "left_arm_lower")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "left_arm");
    } else if (damagelocationisany("left_leg_upper", "left_leg_lower", "left_foot")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "left_leg");
    } else if (damagelocationisany("right_leg_upper", "right_leg_lower", "right_foot")) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "right_leg");
    }
    if (var_53aabd9cafd5b202.size < 2) {
        var_53aabd9cafd5b202[var_53aabd9cafd5b202.size] = asm_lookupanimfromalias(statename, "default");
    }
    /#
        assertex(var_53aabd9cafd5b202.size > 0, var_53aabd9cafd5b202.size);
    #/
    return var_53aabd9cafd5b202[randomint(var_53aabd9cafd5b202.size)];
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b72
// Size: 0x3b
function function_9a4a7270010ada09(asmname, statename, params) {
    self aisettargetspeed(length(self.velocity));
    cleanuppainanim(asmname, statename, params);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb4
// Size: 0x176
function cleanuppainanim(asmname, statename, params) {
    if (isdefined(self.script) && self.script == "pain") {
        self notify("killanimscript");
    }
    self.a.var_682a42d4ea27fe49 = undefined;
    if (isdefined(self.damageshieldpain)) {
        self.damageshieldcounter = undefined;
        self.damageshieldpain = undefined;
        self.allowpain = 1;
        if (!isdefined(self.predamageshieldignoreme)) {
            self.ignoreme = 0;
        }
        self.predamageshieldignoreme = undefined;
    }
    if (isdefined(self.blockingpain)) {
        self.blockingpain = undefined;
        self.allowpain = 1;
    }
    self._blackboard.var_74f8f2b8eff7c7f = 0;
    clearpainturnrate(asmname, statename, params);
    if (istrue(self.leavecasualkiller)) {
        namespace_1a7cea57c200f504::terminate_casualkiller(asmname, statename, params);
    }
    if (!istrue(self.ignoreall)) {
        if (isdefined(self.enemy) && lengthsquared(self.velocity) < 1 && isdefined(self.weapon) && !istrue(self.enemy.ignoreme) && self cansee(self.enemy)) {
            self.remainexposedendtime = gettime() + 2000;
        }
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d31
// Size: 0x61
function transition_flashfinished(asmname, var_8f4ef4fdb5e7800a, var_93279c66a2e49a45, params) {
    if (!isflashed()) {
        return 1;
    }
    if (gettime() > self.flashendtime) {
        return 1;
    }
    return asm_eventfired(asmname, "end") || asm_eventfired(asmname, "finish");
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9a
// Size: 0x5c
function function_f0cf338a66c2a842(asmname, statename, params) {
    if (isdefined(self.stunnedcallback)) {
        self [[ self.stunnedcallback ]]();
    }
    var_7e74fea879be186d = asm_getanim(asmname, statename, params);
    self aisetanim(statename, var_7e74fea879be186d);
    asm_donotetracks(asmname, statename);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1dfd
// Size: 0x42
function function_5f1b71fde3cd5900(asmname, statename, params) {
    var_7e74fea879be186d = asm_getanim(asmname, statename, params);
    self aisetanim(statename, var_7e74fea879be186d);
    asm_donotetracks(asmname, statename);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e46
// Size: 0x33
function function_e00aa948164f088c(asmname, statename, params) {
    if (isstunned()) {
        return 0;
    }
    cleanuppainanim(asmname, statename, params);
    return 1;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e81
// Size: 0x41
function playanim_flashed(asmname, statename, params) {
    self endon(statename + "_finished");
    playanim_flashed_internal(asmname, statename);
    thread playanim_monitorflashrestart(asmname, statename);
    asm_donotetracks(asmname, statename);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec9
// Size: 0xd5
function playanim_flashed_internal(asmname, statename) {
    var_c22c902bf03bd098 = asm_getanim(asmname, statename);
    rate = 1;
    if (isdefined(self.flashendtime)) {
        var_1ea801324c12e83d = self.flashendtime - gettime();
        xanim = asm_getxanim(statename, var_c22c902bf03bd098);
        animlength = getanimlength(xanim) * 1000;
        if (var_1ea801324c12e83d > 0) {
            rate = animlength / var_1ea801324c12e83d;
        }
        rate = rate + randomfloatrange(-0.1, 0.05);
        rate = clamp(rate, 0.65, 1.2);
        self.flashendtime = gettime() + int(animlength / rate);
    }
    self aisetanim(statename, var_c22c902bf03bd098, rate);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa5
// Size: 0x64
function playanim_monitorflashrestart(asmname, statename) {
    self endon(statename + "_finished");
    var_b2a1f003a8f9e6d2 = self.flashendtime;
    while (isdefined(self.flashendtime)) {
        if (var_b2a1f003a8f9e6d2 != self.flashendtime) {
            playanim_flashed_internal(asmname, statename);
            var_b2a1f003a8f9e6d2 = self.flashendtime;
        }
        waitframe();
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2010
// Size: 0x2d
function cleanupflashanim(asmname, statename, params) {
    cleanuppainanim(asmname, statename, params);
    flashbangstop();
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2044
// Size: 0xb0
function playanim_burning(asmname, statename, params) {
    self endon(statename + "_finished");
    var_fc3f189c0832aec2 = namespace_24b7b4457f51f1a3::function_c666e714b2411844(self.damageweapon);
    if (isdefined(var_fc3f189c0832aec2)) {
        function_216c67ab6749137a(self, undefined, "burn", var_fc3f189c0832aec2);
    }
    var_aac951fea290e449 = asm_getanim(asmname, statename, params);
    var_9ee867a6bba39a0d = randomfloatrange(0.8, 1.2);
    self orientmode("face angle", self.angles[1]);
    self aisetanim(statename, var_aac951fea290e449, var_9ee867a6bba39a0d);
    asm_donotetracks(asmname, statename, &burn_notetrack_handler);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20fb
// Size: 0xf5
function burn_notetrack_handler(note) {
    if (isdefined(self.semtexstuckto)) {
        return;
    }
    switch (note) {
    case #"hash_b3c1b4729e0c6d1a":
        playfxontag(level.g_effect["vfx_burn_sml_head_low"], self, "j_helmet");
        break;
    case #"hash_91b66b1e7d9268f1":
        playfxontag(level.g_effect["vfx_burn_sml_low"], self, "j_elbow_le");
        break;
    case #"hash_91b6751e7d9278af":
        playfxontag(level.g_effect["vfx_burn_sml_low"], self, "j_shoulder_ri");
        break;
    case #"hash_72c435d66be93437":
        playfxontag(level.g_effect["vfx_burn_med_low"], self, "j_knee_le");
        break;
    case #"hash_72c43bd66be93da9":
        playfxontag(level.g_effect["vfx_burn_med_low"], self, "j_knee_ri");
        break;
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f7
// Size: 0x229
function painanimfaceenemy(asmname, statename, var_2c8936d08f85c5c1, xanim) {
    self endon(statename + "_finished");
    enemy = self.enemy;
    animlength = getanimlength(xanim);
    endtime = animlength * 0.8;
    var_f462f2c7298cb429 = animlength;
    var_6767247f28fabd3c = getnotetracktimes(xanim, "face_enemy")[0];
    if (isdefined(var_6767247f28fabd3c)) {
        endtime = var_6767247f28fabd3c * animlength;
    } else {
        if (asm_currentstatehasflag(asmname, "notetrackAim")) {
            var_5cbbf76a71910120 = getnotetracktimes(xanim, "start_aim")[0];
            if (isdefined(var_5cbbf76a71910120)) {
                endtime = min(endtime, max(0, var_5cbbf76a71910120 - 0.3) * animlength);
                var_f462f2c7298cb429 = var_5cbbf76a71910120 * animlength;
            }
        }
        endtime = min(endtime, max(0, animlength - 0.5));
    }
    wait(endtime);
    if (isalive(enemy)) {
        var_ab47b2ec8e13ed55 = getnotetracktimes(xanim, "face_enemy_end")[0];
        var_253b2641c5fcf77a = 1;
        if (isdefined(var_ab47b2ec8e13ed55)) {
            var_253b2641c5fcf77a = var_ab47b2ec8e13ed55;
        }
        var_b819721cefd782d2 = getanimlength(xanim) * var_253b2641c5fcf77a - endtime;
        var_e473d197cb34ae13 = gettime() + var_b819721cefd782d2 * 1000;
        while (gettime() < var_e473d197cb34ae13 && isalive(enemy)) {
            var_a79562cded0c03a2 = enemy.origin - self.origin;
            var_7ef311e27099889b = vectortoyaw(var_a79562cded0c03a2);
            anglediff = angleclamp180(var_7ef311e27099889b - self.angles[1]);
            var_30992c23ce045edf = self getanimtime(xanim);
            var_1875fb38b6d4d4e4 = getangledelta(xanim, var_30992c23ce045edf, var_253b2641c5fcf77a);
            delta = anglediff - var_1875fb38b6d4d4e4;
            self orientmode("face angle", self.angles[1] + delta);
            waitframe();
        }
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2427
// Size: 0x7f
function playpainanim_faceplayer(asmname, statename, params) {
    self endon(statename + "_finished");
    var_eb1ac6373dfde285 = undefined;
    if (isalive(self.enemy) && isdefined(self.lastattacker) && self.enemy == self.lastattacker) {
        var_eb1ac6373dfde285 = &painanimfaceenemy;
    }
    playpainaniminternal(asmname, statename, params, 0, 1, undefined, 1, var_eb1ac6373dfde285);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24ad
// Size: 0x7e
function playpainanim_exposedstand(asmname, statename, params) {
    self endon(statename + "_finished");
    var_eb1ac6373dfde285 = undefined;
    if (isalive(self.enemy) && isdefined(self.lastattacker) && self.enemy == self.lastattacker) {
        var_eb1ac6373dfde285 = &painanimfaceenemy;
    }
    playpainaniminternal(asmname, statename, params, 0, 1, undefined, 0, var_eb1ac6373dfde285);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2532
// Size: 0x44
function playpainanim_exposedcrouch(asmname, statename, params) {
    self endon(statename + "_finished");
    self.painattacker = self.lastattacker;
    playpainaniminternal(asmname, statename, params, 0, 1);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x257d
// Size: 0xb6
function playpainanim_exposedcrouchtransition(asmname, statename, params) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, var_2c8936d08f85c5c1));
    if (isalive(self.enemy) && isdefined(self.painattacker) && self.enemy == self.painattacker) {
        thread painanimfaceenemy(asmname, statename, var_2c8936d08f85c5c1, asm_getxanim(statename, var_2c8936d08f85c5c1));
    }
    self.painattacker = undefined;
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263a
// Size: 0x45
function clearpainturnrate(asmname, statename, params) {
    if (isdefined(self.painoldturnrate)) {
        self.turnrate = self.painoldturnrate;
        self.painoldturnrate = undefined;
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2686
// Size: 0xc9
function function_111158d9cee51970(asmname, statename, params) {
    var_5443645c78427889 = undefined;
    if (isdefined(params) && isstring(params)) {
        var_5443645c78427889 = params;
    }
    self endon(statename + "_finished");
    self orientmode("face current");
    self animmode("live_ragdoll");
    if (isdefined(var_5443645c78427889)) {
        var_2c8936d08f85c5c1 = asm_getanim(asmname, statename, var_5443645c78427889);
    } else {
        var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    }
    thread function_6d4426b00706324e();
    self aisetanim(statename, var_2c8936d08f85c5c1);
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    if (endnote == "code_move") {
        endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2756
// Size: 0xb3
function function_56a47f26f49fc5eb(asmname, statename, blendtime, params) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    animname = asm_getxanim(statename, var_2c8936d08f85c5c1);
    thread function_b3b20911062201ad();
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, animname);
    self function_9c471a7e95a2747e(animname);
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    if (endnote == "code_move") {
        endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    }
}

// Namespace pain/namespace_7eac13b458714f13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2810
// Size: 0x3c
function function_6d4426b00706324e() {
    if (!isdefined(self.weapon)) {
        return;
    }
    self endon("death");
    self waittillmatch("live_ragdoll_test", "ragdoll_gun_stow");
    namespace_223959d3e5206cfb::placeweaponon(self.weapon, "chest");
}

// Namespace pain/namespace_7eac13b458714f13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2853
// Size: 0x3c
function function_b3b20911062201ad() {
    if (!isdefined(self.weapon)) {
        return;
    }
    self endon("death");
    self waittillmatch("live_ragdoll_recover", "ragdoll_gun_unstow");
    namespace_223959d3e5206cfb::placeweaponon(self.weapon, "right");
}

// Namespace pain/namespace_7eac13b458714f13
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2896
// Size: 0x2e
function function_e585c560d79f00f8(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self.var_e585c560d79f00f8);
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28cc
// Size: 0x47
function function_5e9e03bdd9237c0f(asmname, statename, params) {
    var_7b9fb896860064ab = "pain_popup" + getpaindirectiontoactor();
    var_c9edb1b72607d824 = asm_lookupanimfromalias(statename, var_7b9fb896860064ab);
    return var_c9edb1b72607d824;
}

// Namespace pain/namespace_7eac13b458714f13
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x291b
// Size: 0x47
function function_a131b253107d514b(asmname, statename, params) {
    var_7b9fb896860064ab = "pain_popup_recover" + getpaindirectiontoactor();
    var_c9edb1b72607d824 = asm_lookupanimfromalias(statename, var_7b9fb896860064ab);
    return var_c9edb1b72607d824;
}

