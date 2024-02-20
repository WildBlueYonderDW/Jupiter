// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using script_10b6724c15a95e8;
#using scripts\anim\utility_common.gsc;

#namespace namespace_16e2a34e24c32e5e;

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x37e
// Size: 0x1cd
function civilian_init(asmname, statename, params) {
    if (asmname == "civilian") {
        var_41f38bcfbf1fa589 = "Using an aitype with the old 'civilian.asm'. ";
        var_41f388cfbf1f9ef0 = "All civilians should be using 'civilian_react' now. ";
        var_41f389cfbf1fa123 = "AIType: '" + self.classname + "' Location: " + self.origin;
        /#
            assertmsg(var_41f38bcfbf1fa589 + var_41f388cfbf1f9ef0 + var_41f389cfbf1fa123);
        #/
    }
    if (!isdefined(self.asm.customdata)) {
        self.asm.customdata = spawnstruct();
    }
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.anglelerprate = 100;
    self.dontsyncmelee = 1;
    self.allowstrafe = 0;
    self.var_ed5ff3bcb60f394 = 1;
    self.shouldstumble = 0;
    self.stumbledelay = 1000;
    self.var_b33b6284d2eee8e1 = 0.2;
    self.var_5dc982e3f3b58ba0 = 10000;
    self.var_8dc39eff3b814ee1 = 30000;
    thread function_f2343b622bbbac5c();
    if (self.var_ae3ea15396b65c1f == "hadir_yth") {
        self.pathsmoothmultiplier = 2;
    }
    initanimspeedthresholds_civilian(self.var_ae3ea15396b65c1f);
    initmaxspeedforpathlengthtable();
    if (self isscriptable()) {
        thread initscriptable();
    }
    namespace_aebb27832287cd3a::function_136fb87ad4393ef8();
    civilianfocusstartthread();
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x552
// Size: 0x28
function initscriptable() {
    self endon("death");
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    self setscriptablepartstate("notetrack_handler", "active", 0);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x581
// Size: 0xff
function initanimspeedthresholds_civilian(var_ae3ea15396b65c1f) {
    var_68eeb9eef5b25842 = self getbasearchetype();
    if (!isdefined(var_68eeb9eef5b25842)) {
        var_68eeb9eef5b25842 = var_ae3ea15396b65c1f;
    }
    if (animspeedthresholdsexist(var_68eeb9eef5b25842)) {
        return;
    }
    if (var_68eeb9eef5b25842 == "farah_civilian") {
        setspeedthreshold(var_68eeb9eef5b25842, "walk", 56);
        setspeedthreshold(var_68eeb9eef5b25842, "fast", 105);
        setspeedthreshold(var_68eeb9eef5b25842, "jog", 170);
        setspeedthreshold(var_68eeb9eef5b25842, "run", 220);
        setspeedthreshold(var_68eeb9eef5b25842, "sprint", 250);
    } else if (var_68eeb9eef5b25842 == "hadir_yth") {
        setspeedthreshold(var_68eeb9eef5b25842, "walk", 40);
        setspeedthreshold(var_68eeb9eef5b25842, "fast", 102);
        setspeedthreshold(var_68eeb9eef5b25842, "jog", 103);
        setspeedthreshold(var_68eeb9eef5b25842, "run", 163);
    } else {
        setspeedthreshold(var_68eeb9eef5b25842, "walk", 52);
        setspeedthreshold(var_68eeb9eef5b25842, "fast", 127);
        setspeedthreshold(var_68eeb9eef5b25842, "jog", 153);
        setspeedthreshold(var_68eeb9eef5b25842, "run", 220);
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x687
// Size: 0xa1
function chooseciviliantransitiontoidleanim(asmname, statename, params) {
    if (isdefined(self.asm.transtoidlealias)) {
        var_b6648a33085e43a = self.asm.transtoidlealias;
        if (statename == "trans_out_stand_idle") {
            self.asm.transtoidlealias = undefined;
        }
        return asm_lookupanimfromalias(statename, var_b6648a33085e43a);
    } else {
        var_b6648a33085e43a = asm_getrandomalias(statename);
        self.asm.transtoidlealias = var_b6648a33085e43a;
        return asm_lookupanimfromalias(statename, var_b6648a33085e43a);
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x72f
// Size: 0x115
function choosecivilianreactidleanim(asmname, statename, params) {
    if (isdefined(self.asm.civilianreactionalias)) {
        var_d4f0250c8d7f6f7c = self.asm.civilianreactionalias;
        if (statename == "trans_out_combat_react") {
            self.asm.civilianreactionalias = undefined;
        }
        return asm_lookupanimfromalias(statename, var_d4f0250c8d7f6f7c);
    } else {
        /#
            assertex(isdefined(self.asm.transtoidlealias), "Anim alias does not exist.");
        #/
        var_bd670c1e0f4290da = self.asm.transtoidlealias;
        if (namespace_3c37cb17ade254d::cointoss()) {
            alias = var_bd670c1e0f4290da + "_a";
        } else {
            alias = var_bd670c1e0f4290da + "_b";
        }
        /#
            assertex(asm_hasalias(statename, alias), "Anim alias does not exist.");
        #/
        self.asm.civilianreactionalias = alias;
        return asm_lookupanimfromalias(statename, alias);
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x84b
// Size: 0x6d
function civilian_playexposedloop(asmname, statename, params) {
    self function_62004d7561fd321e();
    var_4fbb46e48f524506 = self asmgetstatetransitioningfrom(asmname);
    if (isdefined(self.node)) {
        self._blackboard.lastusednode = self.node;
    }
    function_fb56c9527636713f(asmname, statename, 1);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8bf
// Size: 0x3b
function civilian_exit_cleanup(asmname, statename, params) {
    self._blackboard.var_9fbdce5fa10f8964 = 0;
    civilian_move_cleanup(asmname, statename, params);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x901
// Size: 0x2f
function civilian_playmoveloop(asmname, statename, params) {
    thread civilian_watchspeed(statename);
    namespace_34bf5965727c0922::playmoveloop(asmname, statename, params);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x937
// Size: 0xb5
function function_f2343b622bbbac5c() {
    self endon("death");
    stumbletimer = gettime() + randomint(1000);
    while (1) {
        waitframe();
        if (!istrue(self.var_ed5ff3bcb60f394) && !istrue(self.shouldstumble)) {
            continue;
        }
        if (!isdefined(self.pathgoalpos)) {
            continue;
        }
        if (gettime() < stumbletimer) {
            continue;
        }
        if (randomfloat(1) > self.var_b33b6284d2eee8e1) {
            stumbletimer = gettime() + self.var_5dc982e3f3b58ba0;
            continue;
        }
        stumbletimer = gettime() + randomint(1000) + self.var_8dc39eff3b814ee1;
        self.shouldstumble = 1;
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9f3
// Size: 0x7b
function function_d87b251f84ebc50d(asmname, statename, params) {
    archetype = self getbasearchetype();
    speed = length(self.velocity);
    alias = "stumble_jog";
    if (speed > 153) {
        alias = "stumble_sprint";
    }
    if (speed > 220) {
        alias = "stumble_run";
    }
    return asm_chooseanim(asmname, statename, alias);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa76
// Size: 0xe4
function civilian_playmoveloopblendspace(asmname, statename, param) {
    self endon(statename + "_finished");
    thread civilian_watchspeed(statename);
    self.requestarrivalnotify = 1;
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 0;
    var_c8aaf5bc74c22bb = asm_lookupanimfromalias(statename, "blank");
    self aisetanim(statename, var_c8aaf5bc74c22bb);
    if (istrue(param)) {
        if (isdefined(self._blackboard.var_610cb18ecc1af719)) {
            self._blackboard.civilianfocustargetentity = self._blackboard.var_610cb18ecc1af719;
            var_6c542b356d086308 = civilianfocuscomputeyawtotarget();
            var_6c542b356d086308 = var_6c542b356d086308 / 180;
            civilianfocusupdateanimparameter(var_6c542b356d086308);
        }
    }
    while (1) {
        asm_donotetracks(asmname, statename);
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb61
// Size: 0xc6
function civilian_watchspeed(statename) {
    self endon(statename + "_finished");
    if (isdefined(self.stayahead) && istrue(self.stayahead.active)) {
        return;
    }
    if (isdefined(self._blackboard.requestedspeed)) {
        self aisetdesiredspeed(self._blackboard.requestedspeed);
    }
    while (!isdefined(self.stayahead) || !istrue(self.stayahead.active)) {
        if (self aigetdesiredspeed() > 153 && self pathdisttogoal() < 200 && !istrue(self.disablearrivals)) {
            self aisetdesiredspeed(153);
        }
        waitframe();
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc2e
// Size: 0x12e
function civilian_playsharpturnanim(asmname, statename, params) {
    self endon(statename + "_finished");
    turnanim = asm_getanim(asmname, statename);
    /#
        assert(isdefined(turnanim));
    #/
    var_19b744b1cdee4bcb = asm_getxanim(statename, turnanim);
    self animmode("zonly_physics", 0);
    self orientmode("face angle", self.angles[1]);
    turnrate = self.moveplaybackrate;
    asm_playfacialanim(asmname, statename, var_19b744b1cdee4bcb);
    self aisetanim(statename, turnanim, turnrate);
    childthread function_f350cd100563acaf(var_19b744b1cdee4bcb, turnrate);
    note = asm_donotetracks(asmname, statename, &function_acfe95f0c8655298, var_19b744b1cdee4bcb, undefined, 0);
    self motionwarpcancel();
    self orientmode("face enemy or motion");
    self animmode("normal", 0);
    if (note == "code_move") {
        self.requestarrivalnotify = 1;
        var_d32ff27e82ab0acc = getnotetracktimes(var_19b744b1cdee4bcb, "finish");
        if (var_d32ff27e82ab0acc.size > 0) {
            asm_donotetracks(asmname, statename);
        }
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd63
// Size: 0xc9
function function_f350cd100563acaf(var_19b744b1cdee4bcb, turnrate) {
    waitframe();
    var_2d640a3e5dd38229 = getnotetracktimes(var_19b744b1cdee4bcb, "corner");
    if (var_2d640a3e5dd38229.size > 0) {
        var_72909a83a7755195 = var_2d640a3e5dd38229[0];
        animlength = getanimlength(var_19b744b1cdee4bcb);
        curtime = level.frameduration / 1000 / animlength;
        var_7a0c9fc25755b0e = getmovedelta(var_19b744b1cdee4bcb, curtime, var_72909a83a7755195);
        var_e24356acad189f01 = (0, getangledelta(var_19b744b1cdee4bcb, curtime, var_72909a83a7755195), 0);
        animduration = animlength * var_72909a83a7755195 / turnrate;
        if (animduration > 0.05) {
            self.useanimgoalweight = 1;
            self function_2664ab4a4ab7100c(var_7a0c9fc25755b0e, var_e24356acad189f01, animduration);
        }
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe33
// Size: 0x1b8
function function_acfe95f0c8655298(note, params) {
    if (note == "corner") {
        self motionwarpcancel();
        if (!isdefined(self.pathgoalpos)) {
            return;
        }
        if (self.lookaheaddist > 4) {
            var_fdf39d9dbeeb2986 = vectortoyaw(self.lookaheaddir);
        } else {
            return;
        }
        var_19b744b1cdee4bcb = params;
        var_6955b58947031cd2 = getnotetracktimes(var_19b744b1cdee4bcb, "corner");
        var_1cf3cc2bfbd90835 = getnotetracktimes(var_19b744b1cdee4bcb, "code_move");
        /#
            assert(var_6955b58947031cd2.size > 0);
        #/
        endtime = 1;
        if (var_1cf3cc2bfbd90835.size > 0) {
            endtime = var_1cf3cc2bfbd90835[0];
        }
        duration = (endtime - var_6955b58947031cd2[0]) * getanimlength(var_19b744b1cdee4bcb) * 1000;
        if (duration < level.frameduration) {
            return;
        }
        var_95abccfe668f369a = getmovedelta(var_19b744b1cdee4bcb, var_6955b58947031cd2[0], endtime);
        var_e24356acad189f01 = getangledelta(var_19b744b1cdee4bcb, var_6955b58947031cd2[0], endtime);
        anglediff = angleclamp180(var_fdf39d9dbeeb2986 - self.angles[1] - var_e24356acad189f01);
        if (abs(anglediff) > 60) {
            return;
        }
        var_6d41c6838b4b4e02 = (0, var_fdf39d9dbeeb2986 - var_e24356acad189f01, 0);
        targetpos = self.origin + rotatevector(var_95abccfe668f369a, self.angles);
        targetpos = getclosestpointonnavmesh(targetpos, self, 0, 1);
        var_94e50bb8653f6c84 = targetpos - rotatevector(var_95abccfe668f369a, var_6d41c6838b4b4e02);
        self motionwarpwithanim(var_94e50bb8653f6c84, var_6d41c6838b4b4e02, targetpos, (0, var_fdf39d9dbeeb2986, 0), int(duration));
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff2
// Size: 0x23
function civilian_move_cleanup(asmname, statename, params) {
    self motionwarpcancel();
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101c
// Size: 0x2a
function iswhizbydetected(asmname, statename, var_f2b19b25d457c2a6, params) {
    return bb_iswhizbyrequested();
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x104e
// Size: 0x2e
function function_49eab317ab73356(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self.disableexits);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1084
// Size: 0x8a
function shoulddirectlytransition(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (iswhizbydetected() || bb_getcivilianstate() == "combat") {
        alias = self.asm.transtoidlealias;
        if (alias == "civ02" || alias == "civ04" || alias == "civ06" || alias == "civ07") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1116
// Size: 0x80
function shouldcustomtransition(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (bb_getcivilianstate() == "noncombat") {
        alias = self.asm.transtoidlealias;
        if (alias == "civ02" || alias == "civ04" || alias == "civ06" || alias == "civ07") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x119e
// Size: 0x2f
function cleanupcivilianreactionalias(asmname, statename, params) {
    self.asm.civilianreactionalias = undefined;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x11d4
// Size: 0x8c
function shouldsnaptocover(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (bb_moverequested()) {
        return 0;
    }
    if (!isatcovernode()) {
        return 0;
    }
    if (!isdefined(self.node)) {
        return 0;
    }
    if (isdefined(self.primaryweapon) && namespace_7843e1029b5c80e::isusingsidearm() && weaponclass(self.primaryweapon) != "mg") {
        return 0;
    }
    if (!isdefined(params)) {
        return 1;
    }
    return isarrivaltype(asmname, statename, var_f2b19b25d457c2a6, params);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1268
// Size: 0x8a
function enableciviliantargetfocus(ent, direction) {
    if (!isdefined(ent)) {
        return;
    }
    self._blackboard.civilianfocustargetentity = ent;
    self._blackboard.civilianfocusstate = 1;
    if (!isdefined(direction)) {
        self._blackboard.civilianfocusdirection = "";
    } else {
        self._blackboard.civilianfocusdirection = direction;
    }
    self notify("civilian_focus_thread_enabled");
    civilianfocusstartthread();
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f9
// Size: 0x2c
function disableciviliantargetfocus() {
    self._blackboard.civilianfocustargetentity = undefined;
    self._blackboard.civilianfocusstate = 2;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132c
// Size: 0x67
function civilianfocusstartthread() {
    if (isdefined(self._blackboard.civilianfocusthreadrunning)) {
        return;
    }
    self._blackboard.civilianfocusthreadrunning = 1;
    self._blackboard.civilianfocusstate = 0;
    self._blackboard.civilianfocuscurvalue = 0;
    thread civilianfocusupdatethread();
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139a
// Size: 0x6b
function civilianfocuscomputeyawtotarget() {
    var_a5106610ad76d39b = self._blackboard.civilianfocustargetentity.origin - self.origin;
    var_a5106610ad76d39b = (var_a5106610ad76d39b[0], var_a5106610ad76d39b[1], 0);
    var_5290b84b388b75d7 = vectortoangles(var_a5106610ad76d39b);
    return angleclamp180(var_5290b84b388b75d7[1] - self.angles[1]);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140d
// Size: 0x131
function civilianfocusupdatecurrentfocus(targetvalue) {
    var_b1dbabba77c6a3f1 = 0.5;
    var_128b23694d81a9b7 = 1 / var_b1dbabba77c6a3f1;
    curtime = gettime();
    var_4cec6fa3fd0b423b = curtime - self._blackboard.civilianfocuslasttime;
    self._blackboard.civilianfocuslasttime = curtime;
    currentvalue = self._blackboard.civilianfocuscurvalue;
    diff = targetvalue - currentvalue;
    if (abs(diff) > 0.01) {
        var_fe828272ec411efc = sign(targetvalue - currentvalue);
        newvalue = self._blackboard.civilianfocuscurvalue + var_4cec6fa3fd0b423b / 1000 * var_128b23694d81a9b7 * var_fe828272ec411efc;
        newvalue = clamp(newvalue, -1, 1);
        self._blackboard.civilianfocuscurvalue = newvalue;
        return 0;
    }
    self._blackboard.civilianfocuscurvalue = targetvalue;
    return 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1546
// Size: 0x51
function civilianfocusapproachingarrival() {
    target_speed = self aigettargetspeed();
    if (!self codemoverequested() || self pathdisttogoal() < target_speed * 1.3) {
        return 1;
    } else if (istrue(self._blackboard.var_9fbdce5fa10f8964)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159f
// Size: 0x14
function civilianfocusupdateanimparameter(var_31061608be28412f) {
    self setcivilianfocus(var_31061608be28412f);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ba
// Size: 0x4ba
function civilianfocusupdatethread() {
    self endon("death");
    /#
        assert(isdefined(self._blackboard.civilianfocusstate));
    #/
    var_185be4b1e6feb6 = -1;
    var_9ae98138a32c9405 = 1;
    var_146b23f5a71e5333 = 170;
    var_df301aacf68898c7 = -170;
    self._blackboard.civilianfocuslasttime = 0;
    while (1) {
        state = self._blackboard.civilianfocusstate;
        direction = self._blackboard.civilianfocusdirection;
        if (state == 0) {
            self waittill("civilian_focus_thread_enabled");
            self._blackboard.civilianfocuslasttime = gettime();
        } else if (state == 1) {
            var_6c542b356d086308 = civilianfocuscomputeyawtotarget();
            var_91f3f4366e4d2f1c = abs(var_6c542b356d086308);
            if (civilianfocusapproachingarrival() || var_91f3f4366e4d2f1c > 90) {
                self._blackboard.civilianfocusstate = 5;
            } else if (direction == "left") {
                self._blackboard.civilianfocusstate = 3;
            } else if (direction == "right") {
                self._blackboard.civilianfocusstate = 4;
            } else if (var_6c542b356d086308 != 0) {
                self._blackboard.civilianfocusstate = 6;
            }
        } else if (state == 2) {
            self._blackboard.civilianfocusstate = 7;
        } else if (state == 5) {
            civilianfocusupdatecurrentfocus(0);
            if (!civilianfocusapproachingarrival() && isalive(self._blackboard.civilianfocustargetentity)) {
                var_6c542b356d086308 = civilianfocuscomputeyawtotarget();
                if (abs(var_6c542b356d086308) < 90) {
                    if (direction == "left") {
                        self._blackboard.civilianfocusstate = 3;
                    } else if (direction == "right") {
                        self._blackboard.civilianfocusstate = 4;
                    } else if (var_6c542b356d086308 != 0) {
                        self._blackboard.civilianfocusstate = 6;
                    }
                }
            }
            civilianfocusupdateanimparameter(self._blackboard.civilianfocuscurvalue);
        } else if (state == 6) {
            var_6c542b356d086308 = civilianfocuscomputeyawtotarget();
            var_df693a224f2e44c4 = clamp(var_6c542b356d086308, -45, 45) / 45;
            /#
                assert(var_df693a224f2e44c4 >= -1 && var_df693a224f2e44c4 <= 1);
            #/
            civilianfocusupdatecurrentfocus(var_df693a224f2e44c4);
            civilianfocusupdateanimparameter(self._blackboard.civilianfocuscurvalue);
            if (civilianfocusapproachingarrival()) {
                self._blackboard.civilianfocusstate = 5;
            }
        } else if (state == 3) {
            civilianfocusupdatecurrentfocus(var_185be4b1e6feb6);
            civilianfocusupdateanimparameter(self._blackboard.civilianfocuscurvalue);
            if (civilianfocusapproachingarrival()) {
                self._blackboard.civilianfocusstate = 5;
            } else {
                var_6c542b356d086308 = civilianfocuscomputeyawtotarget();
                if (abs(var_6c542b356d086308) < 90) {
                    self._blackboard.civilianfocusstate = 5;
                } else if (direction == "right" || var_6c542b356d086308 > var_df301aacf68898c7 && var_6c542b356d086308 < -90) {
                    self._blackboard.civilianfocusstate = 4;
                }
            }
        } else if (state == 4) {
            civilianfocusupdatecurrentfocus(var_9ae98138a32c9405);
            civilianfocusupdateanimparameter(self._blackboard.civilianfocuscurvalue);
            if (civilianfocusapproachingarrival()) {
                self._blackboard.civilianfocusstate = 5;
            } else {
                var_6c542b356d086308 = civilianfocuscomputeyawtotarget();
                if (abs(var_6c542b356d086308) < 90) {
                    self._blackboard.civilianfocusstate = 5;
                } else if (direction == "left" || var_6c542b356d086308 > 90 && var_6c542b356d086308 < var_146b23f5a71e5333) {
                    self._blackboard.civilianfocusstate = 3;
                }
            }
        } else if (state == 7) {
            done = civilianfocusupdatecurrentfocus(0);
            civilianfocusupdateanimparameter(self._blackboard.civilianfocuscurvalue);
            if (done) {
                self._blackboard.civilianfocusstate = 0;
            }
        }
        waitframe();
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7b
// Size: 0x42
function civmoverequested(asmname, statename, var_f2b19b25d457c2a6, params) {
    return bb_moverequested() && !istrue(self._blackboard.partialgestureplaying);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac5
// Size: 0x42
function civilian_chooseanim_demeanor(asmname, statename, params) {
    if (isdefined(params)) {
        return asm_lookupanimfromalias(statename, bb_getcivilianstate() + params);
    } else {
        return asm_lookupanimfromalias(statename, bb_getcivilianstate());
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0e
// Size: 0xb4
function civilian_chooseanim_playerpushed(asmname, statename, params) {
    movedir = asm_getephemeraleventdata("player_pushed", "player_pushed");
    var_d5be0521e83df112 = vectornormalize(movedir);
    targetangles = vectortoangles(var_d5be0521e83df112);
    targetyaw = angleclamp180(targetangles[1] - self.angles[1]);
    angleindex = namespace_bf5a1761a8d1bb07::yawdiffto2468(targetyaw);
    aliasname = "pushed_" + angleindex;
    turnanim = asm_lookupanimfromalias(statename, aliasname);
    return turnanim;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1bca
// Size: 0x3f
function function_b1bbe0dc316f2efa(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.var_c4242158adaeadd2)) {
        return 0;
    }
    return bb_getcivilianstate() == "casual";
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1c11
// Size: 0xf2
function function_c41de664204e9824(asmname, statename, var_f2b19b25d457c2a6, params) {
    toplayer = level.player.origin - self.origin;
    setdvarifuninitialized(@"hash_e423c827ca27e5c4", 120);
    dist = getdvarfloat(@"hash_e423c827ca27e5c4", 120);
    dist = dist * dist;
    if (lengthsquared(toplayer) > dist) {
        return 0;
    }
    var_ddd5fb570e804bf0 = anglestoforward(self.angles);
    if (vectordot(toplayer, var_ddd5fb570e804bf0) < 0) {
        return 0;
    }
    playerforward = anglestoforward(level.player.angles);
    if (vectordot(playerforward, var_ddd5fb570e804bf0) > 0) {
        return 0;
    }
    return 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0b
// Size: 0x192
function function_7bd81efb0abdbc44(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_db51c3e732a073b4 = 100;
    var_1199d18507db6169 = getaiarrayinradius(self.origin, var_db51c3e732a073b4);
    if (!isdefined(var_1199d18507db6169)) {
        return 0;
    }
    var_e7e2a008bfdcdb17 = self getposonpath(100);
    var_ddd5fb570e804bf0 = vectornormalize(var_e7e2a008bfdcdb17 - self.origin);
    var_94a0ce62771e3a6d = undefined;
    distsq = var_db51c3e732a073b4 * var_db51c3e732a073b4;
    for (i = 0; i < var_1199d18507db6169.size; i++) {
        if (self == var_1199d18507db6169[i]) {
            continue;
        }
        var_f04ba7f687e1b89e = var_1199d18507db6169[i].origin - self.origin;
        dot = vectordot(var_f04ba7f687e1b89e, var_ddd5fb570e804bf0);
        if (dot < 0) {
            continue;
        }
        var_d1cea5ff06c3d300 = anglestoforward(var_1199d18507db6169[i].angles);
        if (vectordot(var_ddd5fb570e804bf0, var_d1cea5ff06c3d300) > 0) {
            continue;
        }
        var_9ebe5d170917ca3d = var_f04ba7f687e1b89e - var_ddd5fb570e804bf0 * dot;
        if (length2dsquared(var_9ebe5d170917ca3d) > 625) {
            continue;
        }
        var_70bbcc66e8971969 = lengthsquared(var_f04ba7f687e1b89e);
        if (var_70bbcc66e8971969 < distsq) {
            distsq = var_70bbcc66e8971969;
            var_94a0ce62771e3a6d = var_1199d18507db6169[i];
        }
    }
    if (!isdefined(var_94a0ce62771e3a6d)) {
        return 0;
    }
    self.var_ae59f0b817468ed7 = var_94a0ce62771e3a6d;
    return 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea5
// Size: 0xda
function function_e481d310d5cb87c(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assert(isdefined(self.var_ae59f0b817468ed7));
    #/
    /#
        assert(isai(self.var_ae59f0b817468ed7));
    #/
    /#
        assert(isalive(self.var_ae59f0b817468ed7));
    #/
    var_1199d18507db6169 = self.var_ae59f0b817468ed7;
    var_f04ba7f687e1b89e = var_1199d18507db6169.origin - self.origin;
    forward = anglestoforward(self.angles);
    if (length(var_f04ba7f687e1b89e) > 200) {
        return 1;
    }
    var_9bb5325f15e20e1d = vectordot(var_f04ba7f687e1b89e, forward) < -20;
    return var_9bb5325f15e20e1d;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f87
// Size: 0x64
function function_ae83a6295a6675c8(asmname, statename, params) {
    if (isdefined(self.var_b5780490703ab4d1)) {
        idx = self.var_b5780490703ab4d1;
    } else {
        idx = randomint(7) + 1;
    }
    self.var_b18d004bee7ca764 = idx;
    return asm_lookupanimfromalias(statename, "walk_" + idx);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff3
// Size: 0xd7
function function_d13115c5f7b949e6(asmname, statename, params) {
    toplayer = level.player.origin - self.origin;
    forward = anglestoforward(self.angles);
    cross = vectorcross(forward, toplayer);
    idx = 1;
    if (isdefined(self.var_b18d004bee7ca764)) {
        idx = self.var_b18d004bee7ca764;
    }
    alias = undefined;
    if (cross[2] < 0) {
        alias = "avoid_" + idx + "_l";
    } else {
        alias = "avoid_" + idx + "_r";
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x20d2
// Size: 0x124
function function_d98f49aeb63edce4(asmname, statename, params) {
    /#
        assert(isdefined(self.var_ae59f0b817468ed7));
    #/
    /#
        assert(isai(self.var_ae59f0b817468ed7));
    #/
    /#
        assert(isalive(self.var_ae59f0b817468ed7));
    #/
    var_1199d18507db6169 = self.var_ae59f0b817468ed7;
    var_f04ba7f687e1b89e = var_1199d18507db6169.origin - self.origin;
    forward = anglestoforward(self.angles);
    cross = vectorcross(forward, var_f04ba7f687e1b89e);
    idx = 1;
    if (isdefined(self.var_b18d004bee7ca764)) {
        idx = self.var_b18d004bee7ca764;
    }
    alias = undefined;
    if (cross[2] < 0) {
        alias = "avoid_" + idx + "_l";
    } else {
        alias = "avoid_" + idx + "_r";
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21fe
// Size: 0x26
function function_c4d5a733f656507f(asmname, statename, params) {
    self.var_ae59f0b817468ed7 = undefined;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x222b
// Size: 0x2e
function function_7490810d9786cc51(asmname, statename, var_f2b19b25d457c2a6, params) {
    return isdefined(self.var_a57082fdf62bc898);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2261
// Size: 0x15c
function function_28d7e9d4c9615969(asmname, statename, var_f2b19b25d457c2a6, params) {
    self endon(statename + "_finished");
    turnanim = asm_getanim(asmname, statename);
    var_19b744b1cdee4bcb = asm_getxanim(statename, turnanim);
    self.useanimgoalweight = 1;
    /#
        assert(!isdefined(params) || isarray(params) && params.size == 3);
    #/
    rate = 1;
    if (!isdefined(params) || params[2]) {
        var_4a19093291d2c8cb = randomfloatrange(-0.2, 0.2);
        rate = rate + var_4a19093291d2c8cb;
    }
    if (isai(self)) {
        self aisetanim(statename, turnanim, rate);
    } else {
        var_34ee65b16925d791 = asm_lookupanimfromalias("knobs", "body");
        var_a0917315f76ab3f2 = asm_getxanim("knobs", var_34ee65b16925d791);
        self setflaggedanimknoballrestart(statename, var_19b744b1cdee4bcb, var_a0917315f76ab3f2, 1, 0.2, 1);
    }
    if (!isdefined(params) || params[1]) {
        thread function_44224a1150c6d2c9(var_19b744b1cdee4bcb, statename);
    }
    var_3931ff7e891d898f = asm_getnotehandler(asmname, statename);
    asm_donotetracks(asmname, statename, var_3931ff7e891d898f);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c4
// Size: 0x21a
function function_44224a1150c6d2c9(var_19b744b1cdee4bcb, statename) {
    self endon("death");
    self endon(statename + "_finished");
    player = undefined;
    animlength = getanimlength(var_19b744b1cdee4bcb);
    if (animhasnotetrack(var_19b744b1cdee4bcb, "start_aim")) {
        var_6aa303aab36ea0ea = getnotetracktimes(var_19b744b1cdee4bcb, "start_aim");
        animlength = animlength * var_6aa303aab36ea0ea[0];
    } else if (animhasnotetrack(var_19b744b1cdee4bcb, "finish")) {
        var_6aa303aab36ea0ea = getnotetracktimes(var_19b744b1cdee4bcb, "finish");
        animlength = animlength * var_6aa303aab36ea0ea[0];
    }
    numframes = int(animlength * 20);
    var_c3ddcd0c37a60c5 = numframes;
    lookpoint = function_75996a8dac6970f2(1024);
    if (isai(self)) {
        while (var_c3ddcd0c37a60c5 > 0) {
            var_6bdb8335862f56ee = 1 / var_c3ddcd0c37a60c5;
            yawtoenemy = angleclamp180(vectortoyaw(lookpoint - self.origin) - self.angles[1]);
            currentanimtime = self aigetanimtime(var_19b744b1cdee4bcb);
            var_993a8f9635e274cf = getangledelta(var_19b744b1cdee4bcb, currentanimtime, 1);
            var_b1cbdf386b2c0dea = angleclamp180(yawtoenemy - var_993a8f9635e274cf);
            self orientmode("face angle", angleclamp(self.angles[1] + var_b1cbdf386b2c0dea * var_6bdb8335862f56ee));
            var_c3ddcd0c37a60c5--;
            wait(0.05);
        }
    } else {
        while (var_c3ddcd0c37a60c5 > 0) {
            var_6bdb8335862f56ee = 1 / var_c3ddcd0c37a60c5;
            yawtoenemy = angleclamp180(vectortoyaw(lookpoint - self.origin) - self.angles[1]);
            currentanimtime = self getanimtime(var_19b744b1cdee4bcb);
            var_993a8f9635e274cf = getangledelta(var_19b744b1cdee4bcb, currentanimtime, 1);
            var_b1cbdf386b2c0dea = angleclamp180(yawtoenemy - var_993a8f9635e274cf);
            yaw = angleclamp(self.angles[1] + var_b1cbdf386b2c0dea * var_6bdb8335862f56ee);
            self.angles = (0, yaw, 0);
            var_c3ddcd0c37a60c5--;
            wait(0.05);
        }
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25e5
// Size: 0x208
function function_8582e56563261e62(asmname, statename, params) {
    target = function_75996a8dac6970f2(1024);
    if (isdefined(params) & isstring(params) && params == "return" && isdefined(self.var_718d80100704cc82)) {
        target = self.var_718d80100704cc82 + (0, 0, 55) + anglestoforward(self.var_a70672e669ca7f00) * 10;
    }
    var_935ce979bb3ef270 = vectortoyaw(target - self.origin);
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
            assertex(isdefined(turnanim), "Cardinal turn anim index " + animindex + "is missing in animset " + self.var_ae3ea15396b65c1f);
        #/
    } else {
        var_3fbfa3ab7b1fb0f2 = [0:"2", 1:"3", 2:"6", 3:"9", 4:"8", 5:"7", 6:"4", 7:"1", 8:"2"];
        animindex = getangleindex(anglediff, 22.5);
        turnanim = asm_lookupanimfromalias(statename, var_3fbfa3ab7b1fb0f2[animindex]);
        /#
            assertex(isdefined(turnanim), "Turn anim index " + var_3fbfa3ab7b1fb0f2[animindex] + "is missing in animset " + self.var_ae3ea15396b65c1f);
        #/
    }
    return turnanim;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x27f5
// Size: 0x4f
function function_4be295e4306dc70c(asmname, statename, var_f2b19b25d457c2a6, params) {
    /#
        assertex(isdefined(params), "CivNearGoalCheck must have a radius param");
    #/
    return distancesquared(self.goalpos, self.origin) < params * params;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x284c
// Size: 0x25
function function_89007ae298fb4b15(asmname, statename, params) {
    set_movement_speed(52);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2878
// Size: 0x25
function function_e7fc2fe7dda8fc2c(asmname, statename, params) {
    set_movement_speed(127);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28a4
// Size: 0x25
function function_94ec448629b086c8(asmname, statename, params) {
    set_movement_speed(153);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28d0
// Size: 0x25
function function_d45457463f7a8eab(asmname, statename, params) {
    set_movement_speed(220);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_ca42962b605a97a1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28fc
// Size: 0x56
function function_92c056ec351f2f6e(asmname, statename, param) {
    if (isdefined(self._blackboard.requestedspeed) && self._blackboard.requestedspeed < 70) {
        set_movement_speed(70);
    }
}

