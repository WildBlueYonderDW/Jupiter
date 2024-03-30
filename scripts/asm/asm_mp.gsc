// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\notetracks_mp.gsc;
#using script_3433ee6b63c7e243;

#namespace asm_mp;

// Namespace asm_mp / scripts/asm/asm_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200
// Size: 0x137
function asm_init(var_b5da6777bfe1ace8, archetypename) {
    self.asmname = var_b5da6777bfe1ace8;
    first_init = 0;
    if (!isdefined(self.asm)) {
        first_init = 1;
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    if (isdefined(archetypename)) {
        if (first_init) {
            self function_e855b69f84cb6ce3(archetypename);
        } else {
            self setanimset(archetypename);
        }
    }
    self.fnasm_init = &asm_init;
    self.fnasm_setorientmode = &asm_settransitionorientmode_transition;
    self.fnasm_handlenotetrack = &scripts/anim/notetracks_mp::handlenotetrack;
    self.fnasm_playadditiveanimloopstate = &asm_playadditiveanimloopstate_mp;
    self.fnasm_playfacialanim = &asm_playfacialanim_mp;
    self.fnplaceweaponon = &namespace_223959d3e5206cfb::placeweaponon;
    self.fndooropen = &dooropen;
    self.fndoorclose = &doorclose;
    self.fndoorneedstoclose = &doorneedstoclose;
    self.fngetdoorcenter = &getdoorcenter;
    self.fndooralreadyopen = &dooralreadyopen;
    self function_131f6fb305015d0(&scripts/asm/shared/utility::function_b6a072e9e59fb82e);
    hack_setup_a_struct();
    function_c051a94f99bd65f1(self.asmname);
}

// Namespace asm_mp / scripts/asm/asm_mp
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
    self.laserenabled = 0;
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d
// Size: 0x2d
function function_a2b8f8b0891ee7fe() {
    level.fnanimatedprop_setup = &animatedprop_setup;
    level.fnanimatedprop_startanim = &animatedprop_setanim;
    level.fnanimatedprop_setanim = &animatedprop_setanim;
}

// Namespace asm_mp / scripts/asm/asm_mp
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

// Namespace asm_mp / scripts/asm/asm_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503
// Size: 0x72
function animatedprop_setanim(propname, param) {
    /#
        assert(isdefined(self.animated_prop));
    #/
    /#
        assert(isdefined(level.scr_anim) && isdefined(level.scr_anim[propname]));
    #/
    propanim = level.scr_anim[propname][param];
    self.animated_prop scriptmodelplayanimdeltamotion(propanim);
}

// Namespace asm_mp / scripts/asm/asm_mp
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

// Namespace asm_mp / scripts/asm/asm_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644
// Size: 0x129
function shouldplaypainanim() {
    var_392782e59863c89f = 64;
    if (istrue(self.a.disablepain)) {
        return false;
    }
    if (isdefined(self.allowpain) && self.allowpain == 0) {
        return false;
    }
    if (istrue(self.var_a1db58c75f381a55)) {
        return false;
    }
    if (isdefined(self.pathgoalpos) && self pathdisttogoal(1) < var_392782e59863c89f) {
        return false;
    }
    if (isdefined(self.damageweapon)) {
        basename = getweaponbasename(self.damageweapon);
        isthermite = issubstr(basename, "thermite") || isdefined(self.damageweapon.magazine) && issubstr(self.damageweapon.magazine, "boltfire");
        if (isthermite && isdefined(self.a.lastpaintime) && gettime() - self.a.lastpaintime < 2000) {
            return false;
        }
    }
    return true;
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x775
// Size: 0x35
function asm_handlenotetracks(note, animstate, animindex, animtime) {
    asm_fireevent(self.asmname, note);
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7b1
// Size: 0x2a
function asm_shoulddeathtransition(asmname, currentstate) {
    /#
        assertmsg("someone using ASM " + asmname + " is running the completely obsolete script ASM!");
    #/
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2
// Size: 0x126
function asm_settransitionorientmode_transition(orient_mode) {
    switch (orient_mode) {
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
        self orientmode(orient_mode);
        break;
    }
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90f
// Size: 0x16b
function asm_settransitionorientmode_legacy(orient_mode) {
    switch (orient_mode) {
    case #"hash_a6238b3102248f7f":
        pathgoal = self.pathgoalpos;
        if (isdefined(pathgoal)) {
            delta = pathgoal - self.origin;
            dir = vectornormalize(delta);
            face_angles = vectortoangles(dir);
            self orientmode("face angle", face_angles[1]);
            break;
        }
    case #"hash_579a1f64b8b40d31":
        self orientmode("face current");
        break;
    case #"hash_87fdfc09c0f3853e":
    case #"hash_f51882822bb936c8":
        self orientmode(orient_mode);
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

// Namespace asm_mp / scripts/asm/asm_mp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa81
// Size: 0x25
function asm_getanimindex(asmname, statename, params) {
    return self asmgetanim(asmname, statename, params);
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaae
// Size: 0x1c
function asm_playadditiveanimloopstate_mp(asmname, statename, params) {
    
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad1
// Size: 0x1f6
function dooropen(door, t) {
    if (distance2dsquared(self.origin, door.origin) < 16) {
    }
    door scriptabledooropen("away", self.origin);
    if (door scriptabledoorisdouble()) {
        doorlist = getentitylessscriptablearray(undefined, undefined, door.origin, 64);
        foreach (otherdoor in doorlist) {
            if (otherdoor scriptabledoorisdouble()) {
                otherdoor scriptabledooropen("away", self.origin);
            }
        }
        return;
    }
    var_82b30cecb236888f = getdvarint(@"hash_fddf57e578106aab", 0);
    if (var_82b30cecb236888f) {
        var_18de4d7536809ac9 = door function_bacd2d0acdf8559e();
        doorforward = anglestoforward(var_18de4d7536809ac9);
        originshift = doorforward * 108;
        /#
            thread draw_circle(door.origin + originshift, 12, (1, 0, 0), 1, 0, 120000);
        #/
        doorlist = getentitylessscriptablearray(undefined, undefined, door.origin + originshift, 12);
        foreach (otherdoor in doorlist) {
            var_77e1c749cc698109 = otherdoor function_bacd2d0acdf8559e();
            var_c91c580eaa68cf32 = anglestoforward(var_77e1c749cc698109);
            if (vectordot(doorforward, var_c91c580eaa68cf32) < 0) {
                otherdoor scriptabledooropen("away", self.origin);
            }
        }
    }
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcce
// Size: 0x13
function doorclose(door) {
    door scriptabledoorclose();
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce8
// Size: 0xe0
function doorneedstoclose(door) {
    if (istrue(door scriptableisdoor()) && door scriptabledoorisclosed()) {
        return false;
    }
    curstate = door getscriptablepartstate("door", 1);
    /#
        assert(isdefined(curstate));
    #/
    if (curstate == "closed" || curstate == "setup") {
        return false;
    }
    var_9dfa31b22e1f2822 = self.origin - door.origin;
    var_aba22f9f83213675 = vectortoyaw(var_9dfa31b22e1f2822);
    var_18de4d7536809ac9 = door function_bacd2d0acdf8559e();
    anglediff = angleclamp180(var_aba22f9f83213675 - var_18de4d7536809ac9[1]);
    openangle = angleclamp180(door.angles[1] - var_18de4d7536809ac9[1]);
    return anglediff * openangle > 0;
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd0
// Size: 0x3c
function getdoorcenter(door) {
    /#
        assert(isdefined(self._blackboard.doorpos));
    #/
    return self._blackboard.doorpos;
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe14
// Size: 0x1a
function dooralreadyopen(door) {
    return abs(door scriptabledoorangle()) > 60;
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe36
// Size: 0x22
function asm_animhasfacialoverridemp(var_63db3c9e26531938) {
    if (!animisleaf(var_63db3c9e26531938)) {
        return 0;
    }
    return animhasnotetrack(var_63db3c9e26531938, "facial_override");
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe60
// Size: 0x26
function asm_playfacialanim_mp(asmname, statename, animname) {
    self setfacialindexfromasm(asmname, statename, animname);
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d
// Size: 0xa2
function asm_playfacialaniminternalmp(var_63db3c9e26531938, a_state) {
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
        self setfacialindex(a_state);
    }
}

// Namespace asm_mp / scripts/asm/asm_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf36
// Size: 0x51
function asm_setanimscripted() {
    self animmode("noclip");
    self orientmode("face angle", self.angles[1]);
    asm_clearfacialanim();
    scripts/asm/asm_bb::bb_setanimscripted();
    self asmsetstate(self.asmname, "animscripted");
    self scriptedanimstarted();
}

