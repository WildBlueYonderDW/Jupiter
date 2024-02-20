// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_7ff3a914e6c698c5;
#using script_4c770a9a4ad7659c;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_2b7d0556a98cd96;

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c
// Size: 0x11
function function_714b93f3cd89e618() {
    self.var_306ac6ff52911f55 = &function_703e9acc55d0902b;
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4
// Size: 0x109
function function_306feec3952fc2ef(targets) {
    if (isdefined(self.var_7fb7ab379bea66a5) && self.var_7fb7ab379bea66a5 > gettime()) {
        self._blackboard.var_6b0939cf3fd5d7a1 = 0;
        return;
    }
    if (!isdefined(targets)) {
        targets = [0:self.var_c24f43a7d0d8d195];
    }
    var_5090aa0e7287800a = [];
    foreach (var_41f4445da3ba6566 in targets) {
        if (isplayer(var_41f4445da3ba6566)) {
            jumpiffalse(var_41f4445da3ba6566 function_4c108309dc0d7fd2() > self._blackboard.var_4a850e88a81da5f9) LOC_000000bd;
        } else {
        LOC_000000bd:
            var_5090aa0e7287800a[var_5090aa0e7287800a.size] = var_41f4445da3ba6566;
        }
    }
    if (var_5090aa0e7287800a.size == 0) {
        self._blackboard.var_6b0939cf3fd5d7a1 = 0;
        return;
    }
    function_ac90fa5cc0a80298("ranged_attack_in");
    thread function_ed0aa045ccc205dd(var_5090aa0e7287800a);
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0xdc
function private function_ed0aa045ccc205dd(targets) {
    self endon("death");
    self endon("terminate_ranged_attack");
    self.var_35bcbbe0ba774121 = function_53c4c53197386572(self.var_35bcbbe0ba774121, "tag_weakpoint_mouth");
    self waittill("fire_projectile");
    foreach (var_41f4445da3ba6566 in targets) {
        if (!isalive(var_41f4445da3ba6566)) {
            continue;
        }
        target_point = var_41f4445da3ba6566.origin;
        if (var_41f4445da3ba6566 tagexists("j_spine4")) {
            target_point = var_41f4445da3ba6566 gettagorigin("j_spine4");
        }
        function_7ed594e1ada9063e(target_point, var_41f4445da3ba6566);
    }
    self.var_7fb7ab379bea66a5 = gettime() + 2000;
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x397
// Size: 0x108
function private function_7ed594e1ada9063e(target_pos, var_41f4445da3ba6566) {
    if (!isdefined(target_pos)) {
        return;
    }
    thread function_c2de30ecd5f08178(var_41f4445da3ba6566);
    start_pos = self gettagorigin(self.var_35bcbbe0ba774121);
    to_target = target_pos - start_pos;
    if (lengthsquared(to_target) == 0) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    gravity = getdvarfloat(@"hash_c4ce13813f6f8616", 400);
    time = length((to_target[0], to_target[1], 0)) / 700;
    var_43957ae1526916df = (0.5 * gravity * squared(time) + to_target[2]) / time;
    to_target = vectornormalize((to_target[0], to_target[1], 0));
    e_grenade = magicgrenademanual(self.grenadeweapon, start_pos, (to_target[0] * 700, to_target[1] * 700, var_43957ae1526916df), 8, self);
    e_grenade thread function_6dd93827edeb79f0();
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0x4b
function private function_6dd93827edeb79f0() {
    self endon("delay_death");
    childthread delay_endon("death");
    hitent = self waittill("projectile_impact_player");
    if (isplayer(hitent)) {
        playfxontagforclients(getfx("player_hit_by_mimic_ranged_attack_fx"), hitent, "j_head", hitent);
    }
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f8
// Size: 0x5a
function function_703e9acc55d0902b(idamage, eattacker, objweapon) {
    if (isdefined(eattacker.var_b285453af8b7df75) && isdefined(eattacker.grenadeweapon) && objweapon == eattacker.grenadeweapon) {
        idamage = eattacker.var_b285453af8b7df75;
    }
    return idamage;
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55a
// Size: 0x1b
function private delay_endon(string) {
    self waittill(string);
    waitframe();
    self notify("delay_" + string);
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57c
// Size: 0x3d
function private function_c2de30ecd5f08178(var_41f4445da3ba6566) {
    if (isplayer(var_41f4445da3ba6566)) {
        var_41f4445da3ba6566 function_e89f2bdb307f137e();
    }
    waittill_any_2("terminate_ranged_attack", "death");
    if (isplayer(var_41f4445da3ba6566)) {
        var_41f4445da3ba6566 function_a33073d6fd58e58e();
    }
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0
// Size: 0x7f
function function_5b2ce71d8c7c9444(asmname, statename, var_f2b19b25d457c2a6, params) {
    target = self.var_c24f43a7d0d8d195;
    if (isdefined(target)) {
        targetyaw = vectortoyaw(target.origin - self.origin);
        return (abs(angleclamp180(self.angles[1] - targetyaw)) > 25);
    }
    return 0;
}

// Namespace namespace_2b7d0556a98cd96/namespace_327b19764ab26912
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x647
// Size: 0xe7
function function_881bc6131b199e97(asmname, statename, params) {
    target = self.var_c24f43a7d0d8d195;
    alias = "ranged_attack";
    if (isdefined(target)) {
        if (target.origin[2] - self.origin[2] > 200) {
            alias = "ranged_attack_high";
        } else {
            targetyaw = vectortoyaw(target.origin - self.origin);
            var_55cbbf12a533cb7c = angleclamp180(self.angles[1] - targetyaw);
            if (var_55cbbf12a533cb7c < -25) {
                alias = "ranged_attack_left";
            } else if (var_55cbbf12a533cb7c > 25) {
                alias = "ranged_attack_right";
            }
        }
    }
    result = asm_lookupanimfromalias(statename, alias);
    return result;
}

