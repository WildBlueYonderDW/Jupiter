// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\notetracks_mp.gsc;
#using script_3433ee6b63c7e243;

#namespace namespace_db6d69290e34e324;

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200
// Size: 0x137
function asm_init(var_b5da6777bfe1ace8, var_5e1ab61c2c7fe69b) {
    self.asmname = var_b5da6777bfe1ace8;
    first_init = 0;
    if (!isdefined(self.asm)) {
        first_init = 1;
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    if (isdefined(var_5e1ab61c2c7fe69b)) {
        if (first_init) {
            self function_e855b69f84cb6ce3(var_5e1ab61c2c7fe69b);
        } else {
            self setanimset(var_5e1ab61c2c7fe69b);
        }
    }
    self.fnasm_init = &asm_init;
    self.fnasm_setorientmode = &asm_settransitionorientmode_transition;
    self.fnasm_handlenotetrack = &namespace_aca06a2f73bc4246::handlenotetrack;
    self.fnasm_playadditiveanimloopstate = &asm_playadditiveanimloopstate_mp;
    self.fnasm_playfacialanim = &asm_playfacialanim_mp;
    self.fnplaceweaponon = &namespace_223959d3e5206cfb::placeweaponon;
    self.fndooropen = &dooropen;
    self.fndoorclose = &doorclose;
    self.fndoorneedstoclose = &doorneedstoclose;
    self.fngetdoorcenter = &getdoorcenter;
    self.fndooralreadyopen = &dooralreadyopen;
    self function_131f6fb305015d0(&namespace_34bf5965727c0922::function_b6a072e9e59fb82e);
    hack_setup_a_struct();
    function_c051a94f99bd65f1(self.asmname);
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e
// Size: 0xf8
function hack_setup_a_struct() {
    if (isdefined(self.a)) {
        return;
    }
    self.a = spawnstruct();
    self.currentpose = "stand";
    self.a.movement = "stop";
    self.a.lastenemytime = gettime();
    self.var_98add129a7ecb962 = self isbadguy();
    self.a.paintime = 0;
    self.a.lastshoottime = 0;
    self.reacttobulletchance = 0.8;
    self.misstime = 0;
    self.a.nodeath = 0;
    self.misstime = 0;
    self.misstimedebounce = 0;
    self.a.disablepain = 0;
    self.var_14070a5a0597bf51 = 0;
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d
// Size: 0x2d
function function_a2b8f8b0891ee7fe() {
    level.fnanimatedprop_setup = &animatedprop_setup;
    level.fnanimatedprop_startanim = &animatedprop_setanim;
    level.fnanimatedprop_setanim = &animatedprop_setanim;
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x471
// Size: 0x8b
function animatedprop_setup(modelname, var, origin, angles) {
    /#
        assert(isdefined(level.scr_model));
    #/
    /#
        assert(isdefined(level.scr_model[modelname]));
    #/
    prop = spawn("script_model", origin);
    prop.angles = angles;
    prop setmodel(level.scr_model[modelname]);
    self.animated_prop = prop;
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503
// Size: 0x72
function animatedprop_setanim(var_5cf354b67b7ce647, param) {
    /#
        assert(isdefined(self.animated_prop));
    #/
    /#
        assert(isdefined(level.scr_anim) && isdefined(level.scr_anim[var_5cf354b67b7ce647]));
    #/
    var_cce0ecb52cc93601 = level.scr_anim[var_5cf354b67b7ce647][param];
    self.animated_prop scriptmodelplayanimdeltamotion(var_cce0ecb52cc93601);
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57c
// Size: 0xc1
function runpain() {
    if (isdefined(self.fnshouldplaypainanim)) {
        if (![[ self.fnshouldplaypainanim ]]()) {
            return;
        }
    } else if (!shouldplaypainanim()) {
        return;
    }
    if (isdefined(self.damageweapon)) {
        basename = getweaponbasename(self.damageweapon);
        if (basename == "molotov_mp") {
            self._blackboard.isburning = 1;
            if (self.damageyaw > 0) {
                self.burningdirection = "right";
            } else {
                self.burningdirection = "left";
            }
        }
    }
    if (self asmhaspainstate(self.asmname)) {
        self asmevalpaintransition(self.asmname);
    }
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644
// Size: 0x129
function shouldplaypainanim() {
    var_392782e59863c89f = 64;
    if (istrue(self.a.disablepain)) {
        return 0;
    }
    if (isdefined(self.allowpain) && self.allowpain == 0) {
        return 0;
    }
    if (istrue(self.var_a1db58c75f381a55)) {
        return 0;
    }
    if (isdefined(self.pathgoalpos) && self pathdisttogoal(1) < var_392782e59863c89f) {
        return 0;
    }
    if (isdefined(self.damageweapon)) {
        basename = getweaponbasename(self.damageweapon);
        var_35f8a12bc12e9793 = issubstr(basename, "thermite") || isdefined(self.damageweapon.magazine) && issubstr(self.damageweapon.magazine, "boltfire");
        if (var_35f8a12bc12e9793 && isdefined(self.a.lastpaintime) && gettime() - self.a.lastpaintime < 2000) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x775
// Size: 0x35
function asm_handlenotetracks(note, animstate, animindex, animtime) {
    asm_fireevent(self.asmname, note);
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7b1
// Size: 0x2a
function asm_shoulddeathtransition(asmname, currentstate) {
    /#
        assertmsg("someone using ASM " + asmname + " is running the completely obsolete script ASM!");
    #/
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2
// Size: 0x126
function asm_settransitionorientmode_transition(var_6c1c5f905d32f13a) {
    switch (var_6c1c5f905d32f13a) {
    case #"hash_96a6a25bd7beed30":
        var_8e1451b5845405b1 = 1024;
        if (actor_is3d()) {
            var_5e1cf0a9046f6f99 = self.angles;
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < var_8e1451b5845405b1) {
                var_5e1cf0a9046f6f99 = self function_f134f30c17faeaf(self.node);
            }
            self orientmode("face angle 3d", var_5e1cf0a9046f6f99);
        } else {
            yaw = self.angles[1];
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < var_8e1451b5845405b1) {
                yaw = getnodeforwardyaw(self.node);
            }
            self orientmode("face angle", yaw);
        }
        break;
    default:
        self orientmode(var_6c1c5f905d32f13a);
        break;
    }
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90f
// Size: 0x16b
function asm_settransitionorientmode_legacy(var_6c1c5f905d32f13a) {
    switch (var_6c1c5f905d32f13a) {
    case #"hash_a6238b3102248f7f":
        pathgoal = self.pathgoalpos;
        jumpiffalse(isdefined(pathgoal)) LOC_00000087;
        delta = pathgoal - self.origin;
        dir = vectornormalize(delta);
        var_547f2dfac34847b1 = vectortoangles(dir);
        self orientmode("face angle", var_547f2dfac34847b1[1]);
        break;
    case #"hash_579a1f64b8b40d31":
    LOC_00000087:
        self orientmode("face current");
        break;
    case #"hash_87fdfc09c0f3853e":
    case #"hash_f51882822bb936c8":
        self orientmode(var_6c1c5f905d32f13a);
        break;
    case #"hash_96a6a25bd7beed30":
        yaw = self.angles[1];
        var_8e1451b5845405b1 = 1024;
        if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < var_8e1451b5845405b1) {
            yaw = getnodeforwardyaw(self.node);
        }
        self orientmode("face angle", yaw);
        break;
    default:
        /#
            assertex(0, "Invalid orient_mode passed to ASM_SetTransitionOrientMode_Legacy");
        #/
        break;
    }
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa81
// Size: 0x25
function asm_getanimindex(asmname, statename, params) {
    return self asmgetanim(asmname, statename, params);
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaae
// Size: 0x1c
function asm_playadditiveanimloopstate_mp(asmname, statename, params) {
    
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad1
// Size: 0x1f6
function dooropen(door, t) {
    if (distance2dsquared(self.origin, door.origin) < 16) {
    }
    door scriptabledooropen("away", self.origin);
    if (door scriptabledoorisdouble()) {
        var_2a1bd16b401bcc79 = getentitylessscriptablearray(undefined, undefined, door.origin, 64);
        foreach (otherdoor in var_2a1bd16b401bcc79) {
            if (otherdoor scriptabledoorisdouble()) {
                otherdoor scriptabledooropen("away", self.origin);
            }
        }
    } else {
        var_82b30cecb236888f = getdvarint(@"hash_fddf57e578106aab", 0);
        if (var_82b30cecb236888f) {
            var_18de4d7536809ac9 = door function_bacd2d0acdf8559e();
            var_807cd8789b963df2 = anglestoforward(var_18de4d7536809ac9);
            var_5a0abfa217fef1e1 = var_807cd8789b963df2 * 108;
            /#
                thread draw_circle(door.origin + var_5a0abfa217fef1e1, 12, (1, 0, 0), 1, 0, 120000);
            #/
            var_2a1bd16b401bcc79 = getentitylessscriptablearray(undefined, undefined, door.origin + var_5a0abfa217fef1e1, 12);
            foreach (otherdoor in var_2a1bd16b401bcc79) {
                var_77e1c749cc698109 = otherdoor function_bacd2d0acdf8559e();
                var_c91c580eaa68cf32 = anglestoforward(var_77e1c749cc698109);
                if (vectordot(var_807cd8789b963df2, var_c91c580eaa68cf32) < 0) {
                    otherdoor scriptabledooropen("away", self.origin);
                }
            }
        }
    }
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcce
// Size: 0x13
function doorclose(door) {
    door scriptabledoorclose();
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce8
// Size: 0xe0
function doorneedstoclose(door) {
    if (istrue(door scriptableisdoor()) && door scriptabledoorisclosed()) {
        return 0;
    }
    curstate = door getscriptablepartstate("door", 1);
    /#
        assert(isdefined(curstate));
    #/
    if (curstate == "closed" || curstate == "setup") {
        return 0;
    }
    var_9dfa31b22e1f2822 = self.origin - door.origin;
    var_aba22f9f83213675 = vectortoyaw(var_9dfa31b22e1f2822);
    var_18de4d7536809ac9 = door function_bacd2d0acdf8559e();
    anglediff = angleclamp180(var_aba22f9f83213675 - var_18de4d7536809ac9[1]);
    var_1293df07b9a5d4a0 = angleclamp180(door.angles[1] - var_18de4d7536809ac9[1]);
    return anglediff * var_1293df07b9a5d4a0 > 0;
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd0
// Size: 0x3c
function getdoorcenter(door) {
    /#
        assert(isdefined(self._blackboard.doorpos));
    #/
    return self._blackboard.doorpos;
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe14
// Size: 0x1a
function dooralreadyopen(door) {
    return abs(door scriptabledoorangle()) > 60;
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe36
// Size: 0x22
function asm_animhasfacialoverridemp(var_63db3c9e26531938) {
    if (!animisleaf(var_63db3c9e26531938)) {
        return 0;
    }
    return animhasnotetrack(var_63db3c9e26531938, "facial_override");
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe60
// Size: 0x26
function asm_playfacialanim_mp(asmname, statename, animname) {
    self setfacialindexfromasm(asmname, statename, animname);
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d
// Size: 0xa2
function asm_playfacialaniminternalmp(var_63db3c9e26531938, var_3a06ff8de29ae6de) {
    if (!isfacialstateallowed("asm")) {
        return;
    }
    if (isdefined(var_63db3c9e26531938) && asm_animhasfacialoverridemp(var_63db3c9e26531938)) {
        return;
    }
    headknob = asm_lookupanimfromaliasifexists("knobs", "head");
    if (!isdefined(headknob)) {
        return;
    }
    if (!isdefined(self.asm.facial_state)) {
        self.asm.facial_state = "";
    }
    setfacialstate("asm");
    if (isai(self)) {
        self setfacialindex(var_3a06ff8de29ae6de);
    }
}

// Namespace namespace_db6d69290e34e324/namespace_28d7bb9fcf17949d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf36
// Size: 0x51
function asm_setanimscripted() {
    self animmode("noclip");
    self orientmode("face angle", self.angles[1]);
    asm_clearfacialanim();
    namespace_28edc79fcf2fe234::bb_setanimscripted();
    self asmsetstate(self.asmname, "animscripted");
    self function_a8edac4d9eeb15a7();
}

