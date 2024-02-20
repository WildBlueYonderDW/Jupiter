// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_608c50392df8c7d1;
#using script_58be75c518bf0d40;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\emp_debuff.gsc;

#namespace breacher_drone;

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x233
// Size: 0xa
function autoexec main() {
    function_dd3ae1df4fce2e85();
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x46
function function_dd3ae1df4fce2e85() {
    if (issharedfuncdefined("breacher_drone", "init")) {
        [[ getsharedfunc("breacher_drone", "init") ]]();
    }
    registersharedfunc("breacher_drone", "breacher_drone_used", &breacher_drone_used);
    function_633c7f773e57ca31();
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0xf8
function function_633c7f773e57ca31() {
    setdvarifuninitialized(@"hash_948191727e1e0a48", 1);
    setdvarifuninitialized(@"hash_15f4bdd9a935599e", 8);
    setdvarifuninitialized(@"hash_880bc9cb96e0d47a", 20);
    setdvarifuninitialized(@"hash_e84ef551e525beef", 25);
    setdvarifuninitialized(@"hash_4eb410aa813c8a92", 40);
    setdvarifuninitialized(@"hash_7580f29bc586eaa1", 2);
    setdvarifuninitialized(@"hash_78873628c410e47c", 4);
    setdvarifuninitialized(@"hash_d0988687e6689cf8", 0.5);
    setdvarifuninitialized(@"hash_178470c11f7062cd", 2.5);
    setdvarifuninitialized(@"hash_984112ed98131c1f", 0);
    setdvarifuninitialized(@"hash_b3179bfb043e6579", 15);
    setdvarifuninitialized(@"hash_30eb2c84bb64de0f", -20);
    setdvarifuninitialized(@"hash_c829ecd8ebe56106", 20);
    setdvarifuninitialized(@"hash_d4ac918df9a03e8", 0);
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x390
// Size: 0x1d5
function breacher_drone_used(breacher_drone) {
    self endon("death");
    self endon("exploding");
    self endon("timeout");
    level endon("game_ended");
    isunderwater = namespace_f8065cafc523dba5::function_988138367c74b1f5();
    if (isunderwater == 1) {
        breacher_drone setscriptablepartstate("exit", "on", 0);
        return;
    }
    var_4b0db67804e50aec = self getgunangles();
    var_4bb748152aa75ddf = anglestoforward(var_4b0db67804e50aec);
    breacher_drone setotherent(self);
    breacher_drone setscriptablepartstate("breacher_setup", "on", 0);
    breacher_drone function_63d1a11f8b22244(undefined, &function_7bee8dd6e886169c, undefined);
    breacher_drone namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_42393d355d1090ff);
    var_3802e287ec78305d = breacher_drone.bundle.var_beb9fe48183bc52b;
    var_8d6e41c46ae5ae4 = getdvarfloat(@"hash_b3179bfb043e6579");
    breacher_drone.origin = breacher_drone.origin + var_4bb748152aa75ddf * var_8d6e41c46ae5ae4;
    breacher_drone.var_5712319afa086cc8 = breacher_drone.origin;
    breacher_drone thread function_a608fdd8e2a06891();
    breacher_drone thread function_f6f652e978862b5a();
    breacher_drone thread function_d6d18aaab42129ad(var_4bb748152aa75ddf, var_3802e287ec78305d, var_4b0db67804e50aec);
    breacher_drone function_cab343d49c8e389a(0);
    var_a6cdc017c04a56de = getdvarfloat(@"hash_15f4bdd9a935599e");
    breacher_drone thread function_47b5394a301d8c5(var_a6cdc017c04a56de, @"hash_d4ac918df9a03e8");
    maxhealth = getdvarfloat(@"hash_948191727e1e0a48");
    damagefeedback = "hitequip";
    if (issharedfuncdefined("damage", "monitorDamage")) {
        breacher_drone thread [[ getsharedfunc("damage", "monitorDamage") ]](maxhealth, damagefeedback, &function_66a7440055d386c3, &function_7bdb3610d602438d, 0);
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0x119
function function_cab343d49c8e389a(var_862b6d5e858fb4f8) {
    if (var_862b6d5e858fb4f8) {
        goto LOC_0000003f;
    }
    trigger_height = getdvarint(@"hash_78873628c410e47c");
    trigger_radius = var_862b6d5e858fb4f8 ? getdvarint(@"hash_4eb410aa813c8a92") : getdvarint(@"hash_7580f29bc586eaa1");
    if (isdefined(self.playertrigger)) {
        self.playertrigger notify("deleting_trigger");
        self.playertrigger delete();
    }
    self.playertrigger = spawn("trigger_radius", self.origin, 0, trigger_radius, trigger_height);
    self.playertrigger.angles = self.angles;
    self.playertrigger.origin = self.origin - (0, 0, trigger_height);
    self.playertrigger enablelinkto();
    self.playertrigger linkto(self);
    thread function_f3b97e69ad4c367d();
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c
// Size: 0xb7
function function_f3b97e69ad4c367d() {
    self endon("death");
    self endon("exploding");
    self endon("disconnected");
    self.playertrigger endon("deleting_trigger");
    while (1) {
        var_f4fc390187305987 = self.playertrigger waittill("trigger");
        /#
            assert(isdefined(var_f4fc390187305987));
        #/
        if (isarray(var_f4fc390187305987)) {
            foreach (ent in var_f4fc390187305987) {
                function_afec6a5d0c967d39(ent);
            }
        } else {
            function_afec6a5d0c967d39(var_f4fc390187305987);
        }
    }
    waitframe();
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74a
// Size: 0x71
function function_afec6a5d0c967d39(ent) {
    if (isagent(ent) || isplayer(ent) || isai(ent)) {
        if (!isalive(ent)) {
            return;
        }
        if (isdefined(ent.team)) {
            if (ent.team == self.owner.team) {
                return;
            }
        }
        callback::callback("on_functional_death");
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c2
// Size: 0x11f
function function_a608fdd8e2a06891() {
    self endon("death");
    self endon("exploding");
    self endon("disconnected");
    endangles = self.angles;
    var_cc25c3f7d3d86a7c = getdvarint(@"hash_30eb2c84bb64de0f");
    startangle = (var_cc25c3f7d3d86a7c, self.angles[1], self.angles[2]);
    self.angles = anglelerpquat(self.angles, startangle, 1);
    var_6bdb8335862f56ee = 0;
    elapsedtime = 0;
    starttime = gettime();
    lerpduration = getdvarfloat(@"hash_178470c11f7062cd") * 1000;
    while (1) {
        timepassed = gettime() - starttime;
        var_6bdb8335862f56ee = timepassed / lerpduration;
        if (var_6bdb8335862f56ee < 1) {
            self.angles = math::lerp(startangle, endangles, var_6bdb8335862f56ee);
        } else {
            wait(0.2);
            function_3fb4e2d77e555bc6();
        }
        waitframe();
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x10f
function function_3fb4e2d77e555bc6() {
    self endon("death");
    self endon("exploding");
    self endon("disconnected");
    startangle = self.angles;
    var_ec6f6aae65f97e57 = getdvarint(@"hash_c829ecd8ebe56106");
    endangles = (var_ec6f6aae65f97e57, self.angles[1], self.angles[2]);
    self.angles = anglelerpquat(self.angles, endangles, 1);
    var_6bdb8335862f56ee = 0;
    elapsedtime = 0;
    starttime = gettime();
    lerpduration = getdvarfloat(@"hash_178470c11f7062cd") * 1000;
    while (1) {
        timepassed = gettime() - starttime;
        var_6bdb8335862f56ee = timepassed / lerpduration;
        if (var_6bdb8335862f56ee < 1) {
            self.angles = math::lerp(startangle, endangles, var_6bdb8335862f56ee);
        }
        waitframe();
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fe
// Size: 0x210
function function_d6d18aaab42129ad(direction, velocity, var_4b0db67804e50aec) {
    self endon("death");
    self endon("exploding");
    self endon("timeout");
    level endon("game_ended");
    self.owner endon("disconnect");
    var_7c89350c1bcac4f0 = self.origin;
    var_6bcf02b3fa907d47 = getdvarint(@"hash_880bc9cb96e0d47a");
    var_66d7b2c988606651 = var_7c89350c1bcac4f0 + direction * var_6bcf02b3fa907d47;
    var_5c01f825981dcd98 = var_4b0db67804e50aec;
    var_dfe2c8258a45aeb5 = 1500;
    startpos = self.origin;
    var_4642dee356a1311e = self.origin;
    targetpos = var_7c89350c1bcac4f0 + direction * var_dfe2c8258a45aeb5;
    starttime = gettime();
    var_134d0390a5b98256 = getdvarint(@"hash_3e0b76e7c8bbae22");
    lerpduration = getdvarfloat(@"hash_178470c11f7062cd") * 1000;
    var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_glass", 3:"physicscontents_vehicle"]);
    while (1) {
        timepassed = gettime() - starttime;
        var_6bdb8335862f56ee = timepassed / lerpduration;
        hitents = physics_raycast(var_4642dee356a1311e, var_66d7b2c988606651, var_1bfa180c6fdd09dd, self, 0, "physicsquery_all");
        if (hitents.size >= 1) {
            params = spawnstruct();
            params.hitents = hitents;
            callback::callback("on_functional_death", params);
            break;
        }
        newpos = math::lerp(startpos, targetpos, var_6bdb8335862f56ee);
        var_4642dee356a1311e = self.origin;
        self.origin = newpos;
        var_66d7b2c988606651 = self.origin + direction * var_6bcf02b3fa907d47;
        waitframe();
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc15
// Size: 0x62
function function_f6f652e978862b5a() {
    self endon("death");
    self endon("exploding");
    self.owner endon("disconnect");
    while (1) {
        if (isdefined(self)) {
            if (distance2d(self.origin, self.var_5712319afa086cc8) > 200) {
                if (isdefined(self)) {
                    function_cab343d49c8e389a(1);
                    break;
                }
            }
        } else {
            break;
        }
        waitframe();
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7e
// Size: 0xb1
function function_7bee8dd6e886169c(params) {
    self notify("exploding");
    forward = anglestoup(self.angles);
    right = -1 * anglestoright(self.angles);
    up = anglestoforward(self.angles);
    if (istrue(self.owner.var_65219c911f198c95) || self.owner namespace_5a51aa78ea0b1b9f::is_empd()) {
        self setscriptablepartstate("explode", "on_noDamage", 0);
    } else {
        function_859275f92a03628c(self.owner);
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd36
// Size: 0x1e
function function_859275f92a03628c(attacker) {
    self setscriptablepartstate("explode", "on", 0);
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5b
// Size: 0x2b
function function_42393d355d1090ff(data) {
    self setscriptablepartstate("explode", "on_noDamage", 0);
    wait(0.05);
    self delete();
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8d
// Size: 0x8f
function function_c367714fa20f379() {
    self endon("death");
    self endon("exploding");
    self endon("disconnected");
    var_5c01f825981dcd98 = self.owner getgunangles();
    direction = anglestoforward(var_5c01f825981dcd98);
    while (1) {
        hitents = function_8729672225464641(direction);
        if (hitents.size >= 1) {
            params = spawnstruct();
            params.hitents = hitents;
            callback::callback("on_functional_death", params);
        }
        waitframe();
    }
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe23
// Size: 0x164
function function_8729672225464641(var_b04116c07c9a618f) {
    var_68e6f05a4ee24dee = physics_createcontents([0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_glass", 3:"physicscontents_vehicle", 4:"physicscontents_characterproxy"]);
    var_dfe2c8258a45aeb5 = getdvarint(@"hash_880bc9cb96e0d47a");
    var_7c89350c1bcac4f0 = self.origin;
    var_66d7b2c988606651 = var_7c89350c1bcac4f0 + var_b04116c07c9a618f * var_dfe2c8258a45aeb5;
    var_97db5d48f2509e02 = physics_raycast(var_7c89350c1bcac4f0, var_66d7b2c988606651, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_all");
    /#
        var_34ce60611499d50e = getdvarint(@"hash_d4ac918df9a03e8");
        if (var_34ce60611499d50e > 0) {
            duration = 500;
            line(var_7c89350c1bcac4f0, var_66d7b2c988606651, (0, 0, 100), 1, 0, duration);
            drawcolor = (0, 255, 0);
            foreach (result in var_97db5d48f2509e02) {
                sphere(result["<unknown string>"], 5, drawcolor, 0, duration);
            }
        }
    #/
    return var_97db5d48f2509e02;
}

// Namespace breacher_drone/namespace_24eab479b5a8280c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8f
// Size: 0x219
function function_ca0071a0a7dc0d4f() {
    self endon("death");
    self endon("exploding");
    self endon("timeout");
    level endon("game_ended");
    self.owner endon("disconnect");
    var_3802e287ec78305d = getdvarfloat(@"hash_3e0b76e7c8bbae22");
    var_59c57549da6d9513 = getdvarfloat(@"hash_d0988687e6689cf8") * 1000;
    lerpduration = getdvarfloat(@"hash_178470c11f7062cd") * 1000;
    var_d5aa91d70ba9a397 = getdvarint(@"hash_984112ed98131c1f");
    var_8d6e41c46ae5ae4 = getdvarfloat(@"hash_b3179bfb043e6579");
    var_cc456361ae82fcad = getdvarint(@"hash_15f4bdd9a935599e");
    var_4b0db67804e50aec = self.owner getgunangles();
    var_4bb748152aa75ddf = anglestoforward(var_4b0db67804e50aec);
    var_58f17fbb36dc3c08 = var_4bb748152aa75ddf * var_3802e287ec78305d;
    var_6bdb8335862f56ee = 0;
    elapsedtime = 0;
    starttime = gettime();
    var_c766d8d5b92df4e6 = self.origin[2];
    var_253c3d73cbbb17f3 = undefined;
    self.origin = self.origin + var_4bb748152aa75ddf * var_8d6e41c46ae5ae4;
    while (1) {
        if (var_d5aa91d70ba9a397 == 1) {
            timepassed = gettime() - starttime;
            var_6bdb8335862f56ee = timepassed / lerpduration;
            if (timepassed > var_59c57549da6d9513) {
                if (!isdefined(var_253c3d73cbbb17f3)) {
                    var_253c3d73cbbb17f3 = self.origin[2];
                    var_62472d3051d43772 = (var_4bb748152aa75ddf[0], var_4bb748152aa75ddf[1], 0);
                    var_62472d3051d43772 = vectornormalize(var_62472d3051d43772);
                    var_58f17fbb36dc3c08 = var_3802e287ec78305d * var_62472d3051d43772;
                }
                if (var_6bdb8335862f56ee < 1) {
                    var_bca46808fc341c86 = math::lerp(var_253c3d73cbbb17f3, var_c766d8d5b92df4e6, var_6bdb8335862f56ee);
                    self.origin = (self.origin[0], self.origin[1], var_bca46808fc341c86);
                }
            }
        }
        waitframe();
    }
}

