// mwiii decomp prototype
#using scripts\mp\mp_agent.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace namespace_b7af840454fbd6d5;

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7
// Size: 0x5
function function_b6fe5ecc5aa631e() {
    return 8;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4
// Size: 0xf
function function_2e76ca63b9a152aa() {
    return 360 / function_b6fe5ecc5aa631e();
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b
// Size: 0x4e
function function_6a71485bed30022f(point, var_f50549fbc64f76f3, var_c8818686f12f33b6) {
    angle = var_f50549fbc64f76f3 * function_2e76ca63b9a152aa() - 180;
    targetpoint = point + anglestoforward((0, angle, 0)) * var_c8818686f12f33b6;
    return targetpoint;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161
// Size: 0x17
function function_f483cb14cb6af004(type) {
    return self.var_c5b2a90477ee623e[type];
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180
// Size: 0xcf
function function_9b72e8ac7409e020(type) {
    if (!isdefined(self.var_c5b2a90477ee623e)) {
        self.var_c5b2a90477ee623e = [];
    }
    if (!isdefined(self.var_c5b2a90477ee623e[type])) {
        self.var_c5b2a90477ee623e[type] = [];
        for (var_f50549fbc64f76f3 = 0; var_f50549fbc64f76f3 < function_b6fe5ecc5aa631e(); var_f50549fbc64f76f3++) {
            self.var_c5b2a90477ee623e[type][var_f50549fbc64f76f3] = spawnstruct();
            self.var_c5b2a90477ee623e[type][var_f50549fbc64f76f3].timestamp = 0;
            self.var_c5b2a90477ee623e[type][var_f50549fbc64f76f3].claimer = undefined;
            self.var_c5b2a90477ee623e[type][var_f50549fbc64f76f3].origin = undefined;
            self.var_c5b2a90477ee623e[type][var_f50549fbc64f76f3].num = var_f50549fbc64f76f3;
        }
    }
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256
// Size: 0xda
function function_f814071e24378b97(ent) {
    origin = ent.origin;
    if (isdefined(ent.groundpos)) {
        origin = ent.groundpos;
    } else if (isplayer(ent) && (ent isjumping() || ent ishighjumping())) {
        if (!isdefined(ent.var_43a5f500c0aeb33e)) {
            ent.var_43a5f500c0aeb33e = 0;
        }
        if (gettime() > ent.var_43a5f500c0aeb33e) {
            ent.var_5a52688310883acf = getgroundposition(ent.origin, 15);
            ent.var_43a5f500c0aeb33e = gettime();
        }
        if (isdefined(ent.var_5a52688310883acf)) {
            origin = ent.var_5a52688310883acf;
        }
    }
    return origin;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x338
// Size: 0x65
function function_47ed76e02c439723(ent, type) {
    for (var_8dcddc8059ac0d5a = 0; var_8dcddc8059ac0d5a < function_b6fe5ecc5aa631e(); var_8dcddc8059ac0d5a++) {
        var_2a1834b520c19b80 = ent function_f483cb14cb6af004(type);
        var_f50549fbc64f76f3 = var_2a1834b520c19b80[var_8dcddc8059ac0d5a];
        if (isdefined(var_f50549fbc64f76f3.origin)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a5
// Size: 0x52d
function function_bc40e686419d910e(enemy, var_807fe94e8ec14536) {
    var_f896ee073845fc13 = 0;
    if (var_f896ee073845fc13) {
        return enemy.origin;
    }
    if (getdvarint(@"hash_9d4b3d44366c276d", 0)) {
        return enemy.origin;
    }
    enemy function_9b72e8ac7409e020(self.var_5754d6c3df1a2b31);
    var_2a1834b520c19b80 = enemy function_f483cb14cb6af004(self.var_5754d6c3df1a2b31);
    /#
    #/
    enemy_origin = var_807fe94e8ec14536;
    delta = self.origin - enemy_origin;
    var_4fb8a4d984999612 = lengthsquared(delta);
    if (var_4fb8a4d984999612 < 256) {
        var_b54f9acf902ff598 = -1;
        for (var_8dcddc8059ac0d5a = 0; var_8dcddc8059ac0d5a < function_b6fe5ecc5aa631e(); var_8dcddc8059ac0d5a++) {
            var_f50549fbc64f76f3 = var_2a1834b520c19b80[var_8dcddc8059ac0d5a];
            if (isdefined(var_f50549fbc64f76f3.claimer) && var_f50549fbc64f76f3.claimer == self) {
                var_b54f9acf902ff598 = var_f50549fbc64f76f3.num;
            }
        }
        if (var_b54f9acf902ff598 < 0) {
            var_b54f9acf902ff598 = self getentitynumber() % function_b6fe5ecc5aa631e();
        }
        var_b44e7861a744eba2 = var_b54f9acf902ff598;
    } else {
        angle = angleclamp180(vectortoyaw(delta)) + 180;
        var_b44e7861a744eba2 = angle / function_2e76ca63b9a152aa();
        var_b54f9acf902ff598 = int(var_b44e7861a744eba2 + 0.5);
    }
    result = undefined;
    var_8f806c87f3cb591c = -1;
    var_f9255d1b11c07b78 = 3;
    var_f90b591b11a449a2 = 2;
    if (var_b44e7861a744eba2 > var_b54f9acf902ff598) {
        var_8f806c87f3cb591c = var_8f806c87f3cb591c * -1;
        var_f9255d1b11c07b78 = var_f9255d1b11c07b78 * -1;
        var_f90b591b11a449a2 = var_f90b591b11a449a2 * -1;
    }
    var_c16422f50a5880a0 = function_b6fe5ecc5aa631e();
    for (step = 0; step < var_c16422f50a5880a0 / 2 + 1; step++) {
        dir = var_8f806c87f3cb591c;
        while (dir != var_f9255d1b11c07b78) {
            var_e7fc2d69b971ec3d = var_b54f9acf902ff598 + step * dir;
            if (var_e7fc2d69b971ec3d >= var_c16422f50a5880a0) {
                var_e7fc2d69b971ec3d = var_e7fc2d69b971ec3d - var_c16422f50a5880a0;
            } else if (var_e7fc2d69b971ec3d < 0) {
                var_e7fc2d69b971ec3d = var_e7fc2d69b971ec3d + var_c16422f50a5880a0;
            }
            var_f50549fbc64f76f3 = var_2a1834b520c19b80[var_e7fc2d69b971ec3d];
            if (!isdefined(result) && gettime() - var_f50549fbc64f76f3.timestamp >= self.var_5cb3cc0c49ee04f1) {
                /#
                    assert(var_f50549fbc64f76f3.num == var_e7fc2d69b971ec3d);
                #/
                if (isdefined(level.var_3421a346c571fbae) && isdefined(level.var_3421a346c571fbae[self.agent_type])) {
                    [[ level.var_3421a346c571fbae[self.agent_type] ]](var_f50549fbc64f76f3, enemy_origin, self.var_c8818686f12f33b6, self.radius);
                } else {
                    function_3421a346c571fbae(var_f50549fbc64f76f3, enemy_origin, self.var_c8818686f12f33b6, self.radius);
                }
            }
            if (!isdefined(result) && isdefined(var_f50549fbc64f76f3.origin)) {
                closest_point = getclosestpointonnavmesh(enemy.origin, self);
                traceresults = navtrace(var_f50549fbc64f76f3.origin, closest_point, self, 1);
                if (traceresults["fraction"] < 0.95) {
                    if (!ispointonnavmesh(enemy.origin)) {
                        result = closest_point;
                    }
                    goto LOC_0000051a;
                }
                var_c1bc7003e9e96206 = 0;
                if (isdefined(var_f50549fbc64f76f3.claimer) && var_f50549fbc64f76f3.claimer != self) {
                    var_851359ac441ebb8 = vectornormalize(enemy_origin - var_f50549fbc64f76f3.claimer.origin) * self.radius * 2;
                    var_c1bc7003e9e96206 = distancesquared(var_f50549fbc64f76f3.claimer.origin + var_851359ac441ebb8, enemy_origin);
                }
                if (!isalive(var_f50549fbc64f76f3.claimer) || !isdefined(var_f50549fbc64f76f3.claimer.enemy) || var_f50549fbc64f76f3.claimer.enemy != enemy || var_f50549fbc64f76f3.claimer == self || var_4fb8a4d984999612 < var_c1bc7003e9e96206) {
                    if (isalive(var_f50549fbc64f76f3.claimer) && var_f50549fbc64f76f3.claimer != self) {
                        var_f50549fbc64f76f3.claimer.var_3d886dde9b70d929 = undefined;
                        var_f50549fbc64f76f3.claimer = undefined;
                    }
                    if (isdefined(self.var_3d886dde9b70d929) && self.var_3d886dde9b70d929 != var_f50549fbc64f76f3) {
                        self.var_3d886dde9b70d929.claimer = undefined;
                        self.var_3d886dde9b70d929 = undefined;
                    }
                    if (!isdefined(self.var_3d886dde9b70d929) || self.var_3d886dde9b70d929 != var_f50549fbc64f76f3) {
                        self.var_3d886dde9b70d929 = var_f50549fbc64f76f3;
                        var_f50549fbc64f76f3.claimer = self;
                    }
                    result = var_f50549fbc64f76f3.origin;
                }
            }
            if (step == 0) {
                continue;
            }
        LOC_0000051a:
            dir = dir + var_f90b591b11a449a2;
        }
    }
    return result;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8da
// Size: 0x8b
function function_3421a346c571fbae(var_f50549fbc64f76f3, var_65fcad9446d3a2f9, var_c8818686f12f33b6, radius) {
    if (gettime() - var_f50549fbc64f76f3.timestamp >= 50) {
        var_f50549fbc64f76f3.origin = function_6a71485bed30022f(var_65fcad9446d3a2f9, var_f50549fbc64f76f3.num, var_c8818686f12f33b6);
        var_f50549fbc64f76f3.origin = function_be302e4229f2239a(var_f50549fbc64f76f3.origin, radius, 55);
        var_f50549fbc64f76f3.timestamp = gettime();
    }
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96c
// Size: 0xaf
function function_be302e4229f2239a(position, radius, height, var_463494a5f1200722) {
    /#
        assert(isdefined(radius) && isdefined(height));
    #/
    if (!isdefined(var_463494a5f1200722)) {
        var_463494a5f1200722 = 18;
    }
    startpos = position + (0, 0, var_463494a5f1200722);
    endpos = position + (0, 0, var_463494a5f1200722 * -1);
    var_3627f3c8c6351d4d = self aiphysicstrace(startpos, endpos, radius, height, 1);
    if (abs(var_3627f3c8c6351d4d[2] - startpos[2]) < 0.1) {
        return undefined;
    }
    if (abs(var_3627f3c8c6351d4d[2] - endpos[2]) < 0.1) {
        return undefined;
    }
    return var_3627f3c8c6351d4d;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa23
// Size: 0xc
function function_fcb16f2eaf12da83() {
    return self.var_4bba3a58f389e465;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0xc
function function_7712021f38c94913() {
    return self.var_3835f6fbd6173dc9;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa4b
// Size: 0x6b
function function_e99764063b47df86(yawdiff, numentries) {
    animindex = 0;
    if (numentries > 1) {
        var_c89dce05842206a0 = int(numentries * 0.5);
        var_97ad91666291cf6f = var_c89dce05842206a0 + numentries % 2;
        if (yawdiff < 0) {
            animindex = randomint(var_97ad91666291cf6f);
        } else {
            animindex = var_c89dce05842206a0 + randomint(var_97ad91666291cf6f);
        }
    }
    return animindex;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabe
// Size: 0x119
function function_254992a907ee42e9(ent) {
    var_f17759894781f5eb = self.origin[2] + self.height;
    if (ent.origin[2] < var_f17759894781f5eb) {
        return 0;
    }
    zmax = self.origin[2] + self.height + 2 * self.radius;
    if (ent.origin[2] > zmax) {
        return 0;
    }
    if (isplayer(ent)) {
        zvel = ent getvelocity()[2];
        if (abs(zvel) > 12) {
            return 0;
        }
    }
    entradius = 15;
    if (isdefined(ent.radius)) {
        entradius = ent.radius;
    }
    radiussq = self.radius + entradius;
    radiussq = radiussq * radiussq;
    if (distance2dsquared(self.origin, ent.origin) > radiussq) {
        return 0;
    }
    return 1;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbdf
// Size: 0x16
function function_33555ffb3402a9b5(enemy) {
    self.favoriteenemy = enemy;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbfc
// Size: 0x7e
function function_15b80ae6984f4ccc(vpoint, vdir) {
    var_65faca4ae4af2c9d = 0;
    if (isdefined(vpoint)) {
        var_c563ad9a49196c2e = vpoint - self gettagorigin("J_SpineLower");
        var_c563ad9a49196c2e = (var_c563ad9a49196c2e[0], var_c563ad9a49196c2e[1], 0);
        var_349b3565e3b204cc = vectortoangles(vectornormalize(var_c563ad9a49196c2e));
        var_65faca4ae4af2c9d = var_349b3565e3b204cc[1];
    } else if (isdefined(vdir)) {
        var_349b3565e3b204cc = vectortoangles(vdir);
        var_65faca4ae4af2c9d = var_349b3565e3b204cc[1] - 180;
    }
    return var_65faca4ae4af2c9d;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc82
// Size: 0x17
function player_in_laststand(player) {
    return player.inlaststand;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca1
// Size: 0x3b
function function_1ea5d1ad97d72da5(point, targetpoint) {
    var_63e2b577b3021861 = self.var_a9bbce143412f034 * self.var_a9bbce143412f034;
    return distancesquared(point, targetpoint) <= var_63e2b577b3021861;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce4
// Size: 0x25
function function_107e3c278ccf7264() {
    return function_1ea5d1ad97d72da5(self.origin, self.enemy.origin);
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd11
// Size: 0x51
function function_859ce1caaf98db64() {
    if (function_fcb16f2eaf12da83() == self.var_fa4cf34a0c3681b8) {
        return function_e2c77ec2e423711();
    }
    var_c844e6da361c186c = distancesquared(self.origin, self.enemy.origin) <= function_7712021f38c94913();
    return var_c844e6da361c186c;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6a
// Size: 0x149
function function_e2c77ec2e423711() {
    var_c844e6da361c186c = distancesquared(self.origin, self.enemy.origin) <= self.var_f5bd7eeb8c658300;
    if (!var_c844e6da361c186c && (isplayer(self.enemy) || isagent(self.enemy))) {
        var_aab6e1d66266bed5 = undefined;
        var_aab6e1d66266bed5 = self.enemy getgroundentity();
        if (isdefined(var_aab6e1d66266bed5) && isdefined(var_aab6e1d66266bed5.targetname) && var_aab6e1d66266bed5.targetname == "care_package") {
            var_c844e6da361c186c = distancesquared(self.origin, self.enemy.origin) <= self.var_f5bd7eeb8c658300 * 4;
        }
    }
    if (!var_c844e6da361c186c && isplayer(self.enemy) && istrue(self.enemy.var_a51f5edf259acc29)) {
        if (length(self getvelocity()) < 5) {
            var_c844e6da361c186c = distancesquared(self.origin, self.enemy.origin) <= self.var_f5bd7eeb8c658300 * 4;
        }
    }
    return var_c844e6da361c186c;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xebb
// Size: 0x22
function function_a490d346d97d0167(radius) {
    self.var_4bba3a58f389e465 = radius;
    self.var_3835f6fbd6173dc9 = radius * radius;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee4
// Size: 0x5
function function_6f1f2cf8495fb8f2() {
    return 1;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef1
// Size: 0x7c
function function_2d78d2cf5681691a() {
    /#
        assert(isdefined(self.enemy));
    #/
    if (isdefined(self.var_3071905d9ea1749c) && isdefined(self.var_c72136d828c5dba2) && distance2dsquared(self.enemy.origin, self.var_3071905d9ea1749c) < 4 && distancesquared(self.origin, self.var_c72136d828c5dba2) < 2500) {
        return 1;
    }
    return 0;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf75
// Size: 0xc6
function function_8c1ebabcc8737d7e(startpos, targetpos) {
    /#
        assert(isdefined(startpos));
    #/
    /#
        assert(isdefined(targetpos));
    #/
    var_7359c54d8c57e115 = 0;
    zdiff = targetpos[2] - startpos[2];
    var_7359c54d8c57e115 = zdiff <= self.var_7a480deb4960d81e && zdiff >= self.var_a853a9004b90b766;
    if (!var_7359c54d8c57e115 && isplayer(self.enemy) && istrue(self.enemy.var_a51f5edf259acc29)) {
        if (length(self getvelocity()) < 5) {
            var_7359c54d8c57e115 = zdiff <= self.var_7a480deb4960d81e * 2 && zdiff >= self.var_a853a9004b90b766;
        }
    }
    return var_7359c54d8c57e115;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1043
// Size: 0x1c
function function_79bba7d55bf175a9(targetpos) {
    return function_8c1ebabcc8737d7e(self.origin, targetpos);
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1067
// Size: 0x2e
function function_b5c47115061c80c9(startpos, targetpos) {
    return distance2dsquared(startpos, targetpos) < function_7712021f38c94913() * 0.9 * 0.9;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109d
// Size: 0x1c
function function_533184b35acabfe8(targetpos) {
    return function_b5c47115061c80c9(self.origin, targetpos);
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c1
// Size: 0x61
function function_3044ff47cea632ac() {
    /#
        assert(isdefined(self.enemy));
    #/
    if (function_254992a907ee42e9(self.enemy)) {
        return 0;
    }
    return !function_79bba7d55bf175a9(self.enemy.origin) && function_533184b35acabfe8(self.enemy.origin);
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112a
// Size: 0xa1
function function_48692817ab76279() {
    startpos = self.origin + (0, 0, self.var_7c0157ec8b265f6e);
    endpos = self.enemy.origin + (0, 0, self.var_7c0157ec8b265f6e);
    if (!isplayer(self.enemy) && !isai(self.enemy)) {
        return 0;
    }
    contents = create_default_contents(1);
    if (ray_trace_passed(startpos, endpos, self.enemy, contents)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d3
// Size: 0x29
function isreallyalive(player) {
    if (isalive(player) && !isdefined(player.fauxdead)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1204
// Size: 0xf0
function function_6f13d6be163ad9a(var_a7a462c25f695db5, var_afe6d98f578d1615) {
    if (!isdefined(var_afe6d98f578d1615)) {
        var_afe6d98f578d1615 = 1;
    }
    if (!isdefined(self.enemy)) {
        return 0;
    }
    if (!isreallyalive(self.enemy)) {
        return 0;
    }
    if (self.aistate == "traverse") {
        return 0;
    }
    if (!function_254992a907ee42e9(self.enemy)) {
        if (!function_79bba7d55bf175a9(self.enemy.origin)) {
            return 0;
        }
        if (var_a7a462c25f695db5 == "offmesh" && !function_107e3c278ccf7264()) {
            return 0;
        }
        if (var_a7a462c25f695db5 == "normal" && !function_859ce1caaf98db64()) {
            return 0;
        } else if (var_a7a462c25f695db5 == "base" && !function_e2c77ec2e423711()) {
            return 0;
        }
    }
    self.var_16cf75ff2bb42685 = undefined;
    if (var_afe6d98f578d1615 && function_48692817ab76279()) {
        self.var_16cf75ff2bb42685 = 1;
        return 0;
    }
    return 1;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12fc
// Size: 0xc7
function function_fd42be10a26fff59(enemy) {
    if (!isdefined(self.var_eb7921eab3ea5477)) {
        self.var_eb7921eab3ea5477 = spawnstruct();
    }
    var_1a9d3cfac74bf193 = function_f814071e24378b97(enemy);
    self.var_eb7921eab3ea5477.var_1a9d3cfac74bf193 = var_1a9d3cfac74bf193;
    targetpoint = function_bc40e686419d910e(enemy, var_1a9d3cfac74bf193);
    if (isdefined(targetpoint)) {
        self.var_eb7921eab3ea5477.valid = 1;
        self.var_eb7921eab3ea5477.origin = targetpoint;
    } else {
        self.var_eb7921eab3ea5477.valid = 0;
        self.var_eb7921eab3ea5477.origin = var_1a9d3cfac74bf193;
    }
    return self.var_eb7921eab3ea5477;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13cb
// Size: 0xec
function function_a0cc8513f431ed0d(var_af4cbac5d9f8d2dd, var_ba056d5b8ef945be) {
    /#
        if (getdvarint(@"hash_d264fee13c04085c", 0) != 0) {
            return 1;
        }
    #/
    if (isplayer(var_af4cbac5d9f8d2dd) && var_af4cbac5d9f8d2dd function_f1dcadc8f7c3477c()) {
        return 1;
    }
    if (isdefined(var_af4cbac5d9f8d2dd.team) && isdefined(self.team) && self.team == var_af4cbac5d9f8d2dd.team) {
        return 1;
    }
    if (function_4e09dce0bdb9e431(var_af4cbac5d9f8d2dd)) {
        return 1;
    }
    if (isdefined(var_af4cbac5d9f8d2dd.killing_time)) {
        return 1;
    }
    if (istrue(var_af4cbac5d9f8d2dd.notarget)) {
        return 1;
    }
    if (istrue(var_af4cbac5d9f8d2dd.ignoreme)) {
        return 1;
    }
    if (!isalive(var_af4cbac5d9f8d2dd)) {
        return 1;
    }
    if (isdefined(level.var_cd41441b70af845e)) {
        if ([[ level.var_cd41441b70af845e ]](var_af4cbac5d9f8d2dd)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14bf
// Size: 0x27
function function_4e09dce0bdb9e431(player) {
    return isdefined(player.var_dda142a66b03ff5) && player.var_dda142a66b03ff5;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ee
// Size: 0x27
function function_d2272a70b9d7e404(hitloc) {
    return level.var_f2ce94caf2fb708d.deathanims["hitLoc"][hitloc];
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x151d
// Size: 0xd
function function_5c077abb4750bca3(direction) {
    return 0;
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1532
// Size: 0x4e
function function_546a879305abdc4a(state, var_3be1b771648e3c2d, hitloc, animarray) {
    if (isdefined(hitloc)) {
        var_a54ab16bb0ef3c60 = animarray[state][var_3be1b771648e3c2d][hitloc];
    } else {
        var_a54ab16bb0ef3c60 = animarray[state][var_3be1b771648e3c2d];
    }
    return var_a54ab16bb0ef3c60[randomint(var_a54ab16bb0ef3c60.size)];
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1588
// Size: 0xb2
function function_cf169a8de2a0d355(var_59b3bc67d984b46f) {
    self.var_6e8bc2a1f79b2398 = var_59b3bc67d984b46f;
    /#
        assert(self.var_6e8bc2a1f79b2398 == "walk" || self.var_6e8bc2a1f79b2398 == "run" || self.var_6e8bc2a1f79b2398 == "sprint");
    #/
    namespace_28edc79fcf2fe234::bb_requestmovetype(self.var_6e8bc2a1f79b2398);
    if (var_59b3bc67d984b46f == "walk") {
        self.var_da951e8204605e7 = 0.8;
    } else if (var_59b3bc67d984b46f == "run") {
        self.var_da951e8204605e7 = 1;
    } else if (var_59b3bc67d984b46f == "sprint") {
        self.var_da951e8204605e7 = 1.2;
    }
}

// Namespace namespace_b7af840454fbd6d5/namespace_3b5bb9f159afb861
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1641
// Size: 0x143
function function_e8f9a124778cc606(var_430d5c97ac6d7f48) {
    var_2de2d8565d288f81["walk"] = [0:0.65, 1:1.2];
    var_2de2d8565d288f81["run"] = [0:0.8, 1:1.1];
    var_2de2d8565d288f81["sprint"] = [0:0.9, 1:1.3];
    /#
        assert(var_430d5c97ac6d7f48 >= 0 && var_430d5c97ac6d7f48 <= 2);
    #/
    if (!isdefined(self.var_6daf599c19e44691)) {
        self.var_6daf599c19e44691 = randomfloatrange(-0.1, 0.1);
    }
    var_6adfc5befba25f92 = clamp(var_430d5c97ac6d7f48 + self.var_6daf599c19e44691, 0, 2);
    if (var_430d5c97ac6d7f48 <= 1) {
        var_4d4d4509d8bd3c47 = var_2de2d8565d288f81[self.var_6e8bc2a1f79b2398][0];
        var_dc615cde078d7b0d = 1;
        var_4f439c539cf632a1 = var_4d4d4509d8bd3c47 + var_430d5c97ac6d7f48 * (var_dc615cde078d7b0d - var_4d4d4509d8bd3c47);
    } else {
        var_4d4d4509d8bd3c47 = 1;
        var_dc615cde078d7b0d = var_2de2d8565d288f81[self.var_6e8bc2a1f79b2398][1];
        var_4f439c539cf632a1 = var_4d4d4509d8bd3c47 + (var_430d5c97ac6d7f48 - 1) * (var_dc615cde078d7b0d - var_4d4d4509d8bd3c47);
    }
    self.var_8d31c7eacb516468 = var_4f439c539cf632a1;
    self.var_d2d25942e3b908e9 = var_4f439c539cf632a1;
}

