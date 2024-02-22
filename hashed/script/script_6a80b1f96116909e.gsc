// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_4e1d4dd23699a8a4;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_6a80b1f96116909e;
#using script_147448f3f080c636;
#using scripts\engine\trace.gsc;

#namespace namespace_76cd017b98490d8a;

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x239
// Size: 0x61
function function_12889d5fe2ea906e(asmname, statename, params) {
    self.fnasm_playfacialanim = utility::getsharedfunc("anim", "ASM_PlayFacialAnim");
    namespace_603b0d6e06be2dbe::function_3a53b7d4f8a6ab4f(asmname, statename, params);
    if (!isai(self)) {
        self.fnasm_handlenotetrack = utility::getsharedfunc("anim", "HandleNotetrack");
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x6e
function function_86880dd17dc8bc39(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.var_9b3e65eeb1124e61)) {
        return 0;
    }
    timediff = gettime() - self.var_9b3e65eeb1124e61;
    var_bd2c8d841d116e33 = 10000;
    return asm_eventfired(asmname, "player_pushed") && timediff < var_bd2c8d841d116e33;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x317
// Size: 0x116
function function_d8ca3630d10c6e62(asmname, statename, params) {
    player = namespace_2b520709cc9e7442::function_47c84e03dcbc5aa7(self.origin);
    if (!isdefined(player)) {
        var_b6648a33085e43a = function_976d6ccb0a2807f3(statename);
        return function_18e6c36c02a94dbd(statename, var_b6648a33085e43a);
    }
    if (isdefined(self.var_b2c134a19497e578.var_39cbcdce57275c53)) {
        self.var_b2c134a19497e578.var_39cbcdce57275c53 = 0;
    }
    var_d5be0521e83df112 = vectornormalize(self.origin - player.origin);
    targetangles = vectortoangles(var_d5be0521e83df112);
    targetyaw = angleclamp180(targetangles[1] - self.angles[1]);
    angleindex = namespace_bf5a1761a8d1bb07::yawdiffto2468(targetyaw);
    aliasname = "pushed_" + angleindex;
    turnanim = function_18e6c36c02a94dbd(statename, aliasname);
    return turnanim;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x435
// Size: 0x231
function function_3a53b7d4f8a6ab4f(asmname, statename, params) {
    self.var_1af0972ad4121c5d = spawnstruct();
    self._blackboard.var_610cb18ecc1af719 = undefined;
    self.var_b2c134a19497e578 = spawnstruct();
    self.var_b2c134a19497e578.var_9d92febdac913986 = 0;
    self.var_b2c134a19497e578.var_a2f98561afe346c6 = 0;
    self.var_b2c134a19497e578.var_1532b27e26d5db21 = "relaxed";
    self.var_b2c134a19497e578.var_6a8b5cade9b556cf = 0;
    self.var_b2c134a19497e578.var_af1d1102ede20fc2 = "relaxed";
    self.var_b2c134a19497e578.var_ac13962f5c74201c = 0;
    self.var_b2c134a19497e578.var_e4f4900d6d00346 = 0;
    self.var_b2c134a19497e578.var_a576b24ef9af6865 = 0;
    self.var_b2c134a19497e578.var_44a0cae44b47f5ee = 1;
    self.var_b2c134a19497e578.var_2141f7cb7ff397a6 = 0;
    self.var_e909843b1034ccc2 = spawnstruct();
    self.var_e909843b1034ccc2.var_21965e18b854f978 = 0;
    self.var_e909843b1034ccc2.var_56d6f93840cb5f45 = 0;
    if (isai(self)) {
        self setanim(generic_human%lookat_procedural_node);
        self setanim(generic_human%lookat_eye_node);
        var_7a140ee03cfc699e = self findoverridearchetype("animscript");
        if (isdefined(var_7a140ee03cfc699e)) {
            var_6abad61ca454f906 = archetypegetalias(var_7a140ee03cfc699e, "knobs", "head", 0);
            if (isdefined(var_6abad61ca454f906)) {
                self setanim(var_6abad61ca454f906.anims, 1, 0.2);
            }
            self.var_8effd09d2c6077d7 = var_7a140ee03cfc699e;
            self.var_be5b4c59c12df3a8 = asmname;
        }
    } else {
        self.fakeactor_face_anim = 1;
        self.facialstate = "asm";
        self.var_5247d15da29e8539 = 1;
    }
    self.var_d28e54645050df58 = 0;
    if (!istrue(self.var_6b1e93f4670936dc)) {
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66d
// Size: 0x195
function function_e2843ef7ecd19447() {
    self endon("death");
    self.script_pushable = 0;
    while (1) {
        var_66525f681b2d3175 = 0;
        player = namespace_2b520709cc9e7442::function_47c84e03dcbc5aa7(self.origin);
        if (!isdefined(player)) {
            waitframe();
            continue;
        }
        var_f07fa3f6881a01e6 = self.origin - player.origin;
        var_214d72ecaf4fe659 = length2dsquared(var_f07fa3f6881a01e6);
        var_988ce1f3de29ab7b = 70;
        if (isdefined(self.var_b2c134a19497e578.var_988ce1f3de29ab7b)) {
            var_988ce1f3de29ab7b = self.var_b2c134a19497e578.var_988ce1f3de29ab7b;
        } else if (isdefined(level.var_f62b6e59c0e00d48.var_988ce1f3de29ab7b)) {
            var_988ce1f3de29ab7b = level.var_f62b6e59c0e00d48.var_988ce1f3de29ab7b;
        }
        if (var_214d72ecaf4fe659 < var_988ce1f3de29ab7b * var_988ce1f3de29ab7b) {
            var_1d0dfdfee6cacb97 = player getvelocity();
            var_a7417a94cd44dd6f = length2dsquared(var_1d0dfdfee6cacb97);
            if (var_a7417a94cd44dd6f > 0) {
                var_e591d8f811352f5f = vectornormalize(var_1d0dfdfee6cacb97);
                var_f07fa3f6881a01e6 = vectornormalize(var_f07fa3f6881a01e6);
                dot = vectordot(var_e591d8f811352f5f, var_f07fa3f6881a01e6);
                var_66525f681b2d3175 = dot > 0.866;
            }
        }
        if (var_66525f681b2d3175 && self.var_b2c134a19497e578.var_44a0cae44b47f5ee) {
            namespace_bf5a1761a8d1bb07::asm_fireevent(self.asmname, "player_pushed");
            var_1a28ad563a3f4806 = 0.25;
            wait(var_1a28ad563a3f4806);
        } else {
            waitframe();
        }
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x809
// Size: 0x72
function function_8410016cf6ab1371() {
    while (1) {
        if (getdvar(@"hash_39375e00c2cad343") != "" && isdefined(self.var_7afd86c1af40885b)) {
            level notify("civreact_terminate");
            if (getdvar(@"hash_39375e00c2cad343", "relaxed") != self.var_7afd86c1af40885b) {
                self.var_7afd86c1af40885b = getdvar(@"hash_39375e00c2cad343");
            }
        }
        wait(1);
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x882
// Size: 0x1c
function function_5e218e270551f5be(asmname) {
    thread function_8410016cf6ab1371();
    thread function_d338069f6a281787();
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a5
// Size: 0xe4
function capcivreact_handlebulletfired(originator) {
    var_c70400922bccce61 = distance(originator.origin, self.origin);
    var_8911f71726832879 = var_c70400922bccce61 / level.var_f62b6e59c0e00d48.var_ffc29105fd388648 + randomfloat(0, 0.5) * 1000;
    var_9d58e322fdc1e5e9 = var_8911f71726832879 + gettime();
    if (isdefined(self.var_22c53a5480553773) < var_9d58e322fdc1e5e9) {
        return;
    }
    self.var_1af0972ad4121c5d.var_47854d572e97b41f = "bulletfired";
    self.var_1af0972ad4121c5d.var_650d1900b21e2bd1 = originator.origin;
    self.var_1af0972ad4121c5d.var_27f5cd190b4a24c3 = gettime();
    self notify("CapCivReact_HandleBulletFired");
    self endon("CapCivReact_HandleBulletFired");
    wait(var_8911f71726832879);
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x990
// Size: 0x46
function function_d338069f6a281787() {
    while (1) {
        originator = eventname = self waittill("cap_event");
        switch (eventname) {
        case #"hash_cb9359e30cbc556b":
            capcivreact_handlebulletfired(originator);
            break;
        }
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dd
// Size: 0x22
function function_b92973cdb6dc3f38() {
    target = self._blackboard.var_610cb18ecc1af719;
    return target;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa07
// Size: 0x253
function function_20efa2e633463448(asmname, statename, params) {
    var_1ce107df41384e28 = self;
    if (isdefined(self.var_34df90223221b7a6)) {
        var_34df90223221b7a6 = level.var_6961d0344027496f[self.var_34df90223221b7a6];
        index = 0;
        for (var_89d86711a7226025 = 0; var_89d86711a7226025 < var_34df90223221b7a6.size; var_89d86711a7226025++) {
            if (isalive(var_34df90223221b7a6[var_89d86711a7226025])) {
                var_1ce107df41384e28 = var_34df90223221b7a6[var_89d86711a7226025];
                break;
            }
        }
    }
    player_target = function_b92973cdb6dc3f38();
    if (!isdefined(player_target)) {
        target = function_75996a8dac6970f2(1024);
    } else {
        target = player_target.origin;
    }
    var_935ce979bb3ef270 = vectortoyaw(target - var_1ce107df41384e28.origin);
    anglediff = angleclamp180(var_935ce979bb3ef270 - var_1ce107df41384e28.angles[1]);
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
        turnanim = namespace_dd3a5c61bf082e18::function_18e6c36c02a94dbd(statename, animindex);
        /#
            assertex(isdefined(turnanim), "Cardinal turn anim index " + animindex + "is missing in cap animset " + self.var_ae3ea15396b65c1f);
        #/
    } else {
        var_3fbfa3ab7b1fb0f2 = [0:"2", 1:"3", 2:"6", 3:"9", 4:"8", 5:"7", 6:"4", 7:"1", 8:"2"];
        animindex = getangleindex(anglediff, 22.5);
        turnanim = namespace_dd3a5c61bf082e18::function_18e6c36c02a94dbd(statename, var_3fbfa3ab7b1fb0f2[animindex]);
        /#
            assertex(isdefined(turnanim), "Turn anim index " + var_3fbfa3ab7b1fb0f2[animindex] + "is missing in cap animset " + self.var_ae3ea15396b65c1f);
        #/
    }
    return turnanim;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc62
// Size: 0x1a9
function function_14d651e2254bb00d(asmname, var_8f4ef4fdb5e7800a, var_93279c66a2e49a45, params) {
    if (isdefined(params) && params == "return") {
        angles = self.var_a70672e669ca7f00;
        anglediff = angleclamp180(angles[1] - self.angles[1]);
        var_3ada4c6e49483364 = 22.5;
        return (abs(anglediff) > var_3ada4c6e49483364);
    }
    target = function_b92973cdb6dc3f38();
    if (isdefined(target)) {
        totarget = target.origin - self.origin;
        var_935ce979bb3ef270 = vectortoyaw(totarget);
        var_3ada4c6e49483364 = 45;
        if (!isai(self)) {
            var_b047d1b68e9701c9 = lengthsquared(totarget);
            var_706fe99ce1efa2b7 = [0:[0:300, 1:23], 1:[0:0, 1:45]];
            foreach (var_cbf22c9edb76e72d in var_706fe99ce1efa2b7) {
                distancesqr = var_cbf22c9edb76e72d[0] * var_cbf22c9edb76e72d[0];
                if (var_b047d1b68e9701c9 > distancesqr) {
                    var_3ada4c6e49483364 = var_cbf22c9edb76e72d[1];
                    break;
                }
            }
        }
        anglediff = angleclamp180(var_935ce979bb3ef270 - self.angles[1]);
        if (abs(anglediff) > var_3ada4c6e49483364) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe13
// Size: 0x66
function function_6e1cbd20dcaecf31(asmname, statename, params) {
    if (isdefined(params) && isstring(params) && params == "return") {
        self._blackboard.var_7460b96395361857 = self._blackboard.var_c71a487341c700f3;
    }
    function_59308d53cabcdfdb(asmname, statename);
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe80
// Size: 0x169
function function_99f3112f53606865(asmname, statename, params) {
    self endon(statename + "_finished");
    turnanim = asm_getanim(asmname, statename);
    var_19b744b1cdee4bcb = asm_getxanim(statename, turnanim);
    self.useanimgoalweight = 1;
    /#
        assert(!isdefined(params) || isarray(params) && params.size == 2);
    #/
    rate = 1;
    if (isai(self)) {
        if (isdefined(params)) {
            if (isdefined(params[0])) {
                var_9622b10ea4acbc01 = params[0];
                namespace_dd3a5c61bf082e18::function_f9d6133768491200(var_19b744b1cdee4bcb, var_9622b10ea4acbc01);
            }
        } else {
            self function_1c339daaba3f71db(0);
        }
        self aisetanim(statename, turnanim, rate);
    } else {
        var_34ee65b16925d791 = asm_lookupanimfromalias("knobs", "body");
        var_a0917315f76ab3f2 = asm_getxanim("knobs", var_34ee65b16925d791);
        self setflaggedanimknoballrestart(statename, var_19b744b1cdee4bcb, var_a0917315f76ab3f2, 1, 0.2, 1);
    }
    if (!isdefined(params) || params[1]) {
        thread function_737c17a2f5f59183(var_19b744b1cdee4bcb, statename);
    }
    if (!isai(self)) {
        thread function_5c8ff3350d31ccf2(var_19b744b1cdee4bcb, statename);
    }
    var_3931ff7e891d898f = asm_getnotehandler(asmname, statename);
    asm_donotetracks(asmname, statename, var_3931ff7e891d898f);
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff0
// Size: 0x98
function function_5c8ff3350d31ccf2(var_19b744b1cdee4bcb, statename) {
    self endon("death");
    animlength = getanimlength(var_19b744b1cdee4bcb);
    var_81fd142c74a485f3 = animlength / 0.4;
    interval = animlength / var_81fd142c74a485f3;
    contents = namespace_2a184fc4902783dc::create_solid_ai_contents(1);
    for (trace = 0; trace < var_81fd142c74a485f3; trace++) {
        wait(interval);
        self.origin = namespace_3c37cb17ade254d::drop_to_ground(self.origin, 30, -30, undefined, contents);
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108f
// Size: 0x232
function function_737c17a2f5f59183(var_19b744b1cdee4bcb, statename) {
    self endon("death");
    self endon(statename + "_finished");
    enemy = function_b92973cdb6dc3f38();
    if (!isdefined(enemy)) {
        return;
    }
    enemy endon("death");
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
    if (isai(self)) {
        while (var_c3ddcd0c37a60c5 > 0) {
            var_6bdb8335862f56ee = 1 / var_c3ddcd0c37a60c5;
            yawtoenemy = angleclamp180(vectortoyaw(enemy.origin - self.origin) - self.angles[1]);
            currentanimtime = undefined;
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
            yawtoenemy = angleclamp180(vectortoyaw(enemy.origin - self.origin) - self.angles[1]);
            currentanimtime = undefined;
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

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12c8
// Size: 0x26
function playturnanim_cleanup(asmname, statename, params) {
    self.useanimgoalweight = 0;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x12f5
// Size: 0x8a
function function_25d4ebb35db59893(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (istrue(self._blackboard.var_b9fe3860c557e5d6)) {
        return 0;
    }
    if (self.var_7afd86c1af40885b == "cower") {
        return 1;
    }
    if (isdefined(self._blackboard.var_41830459efdaf2aa) && gettime() >= self._blackboard.var_41830459efdaf2aa) {
        return 1;
    }
    return 0;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1387
// Size: 0x58
function function_94ea0ca02f4d957(asmname, statename, params) {
    if (randomint(100) < 30) {
        self._blackboard.var_41830459efdaf2aa = gettime() + randomintrange(3000, 5000);
    }
    namespace_dd3a5c61bf082e18::function_59308d53cabcdfdb(asmname, statename, params);
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13e6
// Size: 0x2f
function function_8c45fec62914f2e3(asmname, statename, params) {
    self._blackboard.var_41830459efdaf2aa = undefined;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x141c
// Size: 0x4b
function function_c8421bb477a45b8a(note) {
    if (!isai(self)) {
        return;
    }
    if (note == "hp_on") {
        self function_1c339daaba3f71db(1);
        self function_5621e511b99964a7(level.player);
    }
    if (note == "hp_off") {
        self function_1c339daaba3f71db(0);
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146e
// Size: 0x57
function function_15330ee53a46289d(asmname, var_a896dbd95a7bb191, var_f2b19b25d457c2a6, params) {
    var_e1054bd0481cbf85 = istrue(self._blackboard.var_af9e2d62dd7da3c3);
    self._blackboard.var_af9e2d62dd7da3c3 = undefined;
    return var_e1054bd0481cbf85;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14cd
// Size: 0x74
function function_fbbcd3a4d551644c(asmname, statename, params) {
    /#
        assert(isdefined(self._blackboard.var_40a41c70824fa4c4));
    #/
    if (self._blackboard.var_40a41c70824fa4c4 == "b") {
        return function_a0dfeea159aa7f64(asmname, statename, "a_to_b");
    } else {
        return function_a0dfeea159aa7f64(asmname, statename, "b_to_a");
    }
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1548
// Size: 0x80
function function_10e9a7601aef9c43(asmname, statename, params) {
    if (function_f179ede0989e6734(statename, "a")) {
        if (!isdefined(self._blackboard.var_40a41c70824fa4c4)) {
            self._blackboard.var_40a41c70824fa4c4 = "a";
        }
        return function_a0dfeea159aa7f64(asmname, statename, self._blackboard.var_40a41c70824fa4c4);
    }
    return function_a0dfeea159aa7f64(asmname, statename, params);
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15d0
// Size: 0xbd
function function_f914d9aba63ded76(asmname, var_a896dbd95a7bb191, var_f2b19b25d457c2a6, params) {
    if (!function_15330ee53a46289d(asmname, var_a896dbd95a7bb191, var_f2b19b25d457c2a6, params)) {
        return 0;
    }
    var_59848583905b2e3e = function_f179ede0989e6734(var_a896dbd95a7bb191, "a");
    if (var_59848583905b2e3e) {
        /#
            assert(isdefined(self._blackboard.var_40a41c70824fa4c4));
        #/
        if (self._blackboard.var_40a41c70824fa4c4 == "a") {
            self._blackboard.var_40a41c70824fa4c4 = "b";
        } else {
            self._blackboard.var_40a41c70824fa4c4 = "a";
        }
    }
    return var_59848583905b2e3e;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1695
// Size: 0x2e
function function_d609e4ea4f9848a4(asmname, var_a896dbd95a7bb191, var_f2b19b25d457c2a6, params) {
    return istrue(self.var_c492eecad94293be);
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16cb
// Size: 0x42
function function_826677291f544da5(asmname, statename, var_f2b19b25d457c2a6, param) {
    disttogoal = 320;
    if (isdefined(param)) {
        disttogoal = param;
    }
    return self pathdisttogoal() < disttogoal;
}

// Namespace namespace_76cd017b98490d8a/namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1715
// Size: 0x45
function function_1bb354204eb3d271(asmname, statename, var_f2b19b25d457c2a6, param) {
    if (!isdefined(self.var_6fca5c68cc5f9550)) {
        return 0;
    }
    if (!isdefined(param)) {
        return 0;
    }
    return self.var_6fca5c68cc5f9550 == param;
}

