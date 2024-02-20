// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_24fbedba9a7a1ef4;

#namespace namespace_cf0b1612db6434d3;

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x202
// Size: 0x35
function function_a414fbf48ae645f4() {
    level.var_a4123e1a53dea557 = getdvarint(@"hash_86c85cfc843c0b68", 1);
    level.var_d49c99ad85354bd6 = getdvarint(@"hash_a433661e4f79e427", 100);
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x176
function function_93288f91f5aabd02() {
    juggcontext = spawnstruct();
    juggcontext.var_46ad94f231cd4ef3 = [];
    juggcontext.var_46ad94f231cd4ef3["head_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["torso_upper_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["torso_lower_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["right_upper_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["right_lower_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["left_upper_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["left_lower_arm_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["right_leg_health"] = 100;
    juggcontext.var_46ad94f231cd4ef3["left_leg_health"] = 100;
    juggcontext.var_5f03cad2b199e1bc = &function_f75bc5c067f4015;
    juggcontext.lastpaintime = 0;
    juggcontext.paindamage = 0;
    juggcontext.var_1bea7c00eb868a40 = 1000;
    juggcontext.var_3d1bbef280ea37b4 = 5000;
    juggcontext.var_a35692b629483499 = 10;
    juggcontext.var_f8236448eb258010 = 0.1;
    juggcontext.lastdamagedtime = 0;
    juggcontext.var_a4dceeab66ec6a3c = 1000;
    self.juggcontext = juggcontext;
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb
// Size: 0xd8
function function_f75bc5c067f4015(part, damage) {
    if (isdefined(part) && part == "head_health" && !isdefined(self.juggcontext.var_46ad94f231cd4ef3[part])) {
        if (isdefined(self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"])) {
            self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] = self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] - damage;
            if (self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] <= 0) {
                self.juggcontext.var_46ad94f231cd4ef3["damaged_helmet_health"] = undefined;
                function_fd38d13ec4cf6449("head_health", "destroyed");
            }
        }
    }
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49a
// Size: 0xce
function function_fd38d13ec4cf6449(parts, state) {
    if (istrue(self.var_8081d864dc563057)) {
        return;
    }
    if (!isdefined(state)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    var_3d1c10f919cd5af0 = [];
    if (isarray(parts)) {
        var_3d1c10f919cd5af0 = array_combine(var_3d1c10f919cd5af0, parts);
    } else {
        var_3d1c10f919cd5af0[var_3d1c10f919cd5af0.size] = parts;
    }
    foreach (part in var_3d1c10f919cd5af0) {
        self setscriptablepartstate(part, state, 0);
        /#
            iprintln("<unknown string>" + part + "<unknown string>" + state + "<unknown string>");
        #/
    }
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f
// Size: 0x157
function function_1cbb19fc0caeab00(subtype) {
    weapon = undefined;
    function_93288f91f5aabd02();
    thread function_ca2d7204b750d78b();
    if (!isdefined(level.var_ed61c38f5c8bb414)) {
        level.var_ed61c38f5c8bb414 = [0:"pristine", 1:"damaged"];
    }
    if (!isdefined(level.var_13819795c6ee9ff8)) {
        level.var_13819795c6ee9ff8 = [0:"helmet", 1:"neckguard", 2:"backpack", 3:"shoulderpad_l", 4:"shoulderpad_r", 5:"forearmpad_l", 6:"forearmpad_r", 7:"qamis", 8:"thighpad_l", 9:"thighpad_r"];
    }
    if (isdefined(subtype) && subtype == "merc") {
        var_1d63afdad83bcdad = [0:"neckguard", 1:"backpack", 2:"shoulderpad_l", 3:"shoulderpad_r", 4:"forearmpad_l", 5:"forearmpad_r", 6:"qamis", 7:"thighpad_l", 8:"thighpad_r"];
    } else {
        var_1d63afdad83bcdad = level.var_13819795c6ee9ff8;
    }
    function_fd38d13ec4cf6449(var_1d63afdad83bcdad, "pristine");
    self setperk("specialty_melee_invulnerable", 1);
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cd
// Size: 0x29f
function function_1ab798a528080db2(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (isdefined(level.var_d49c99ad85354bd6)) {
        if (isdefined(level.var_a4123e1a53dea557) && level.var_a4123e1a53dea557 == 1) {
            overflow = idamage - level.var_d49c99ad85354bd6;
            if (overflow > 0) {
                idamage = int(level.var_d49c99ad85354bd6 + sqrt(overflow));
            }
        } else {
            idamage = int(min(idamage, level.var_d49c99ad85354bd6));
        }
    }
    if (isdefined(self.var_970170ffd4b081ac)) {
        idamage = self [[ self.var_970170ffd4b081ac ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
    remaininghealth = self.health - idamage;
    if (remaininghealth <= 0) {
        if (isdefined(self.var_68c43b3ffee58999)) {
            self notify(self.var_68c43b3ffee58999);
        }
    }
    if (isdefined(self.juggcontext) && !istrue(self.juggcontext.var_d765edff7e15164b)) {
        self.juggcontext.lastdamagedtime = gettime();
        if (self.juggcontext.lastpaintime < gettime()) {
            if (self.allowpain == 0) {
                self.allowpain = 1;
            }
            self.juggcontext.paindamage = self.juggcontext.paindamage + idamage;
        }
        if (self.juggcontext.paindamage > self.juggcontext.var_1bea7c00eb868a40) {
            self.juggcontext.lastpaintime = gettime() + self.juggcontext.var_3d1bbef280ea37b4;
            self.juggcontext.paindamage = 0;
            self asmevalpaintransition(self.asmname);
            self.allowpain = 0;
        }
        function_fa4f1a412ab12028(idamage, shitloc, smeansofdeath, eattacker);
    }
    namespace_daa149ca485fd50a::function_dffac413ed66bcd0(einflictor, eattacker, int(idamage), idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x973
// Size: 0x97
function function_ca2d7204b750d78b() {
    self endon("death");
    while (1) {
        if (gettime() - self.juggcontext.lastdamagedtime > self.juggcontext.var_a4dceeab66ec6a3c) {
            self.juggcontext.paindamage = max(self.juggcontext.paindamage - self.juggcontext.var_a35692b629483499, 0);
        }
        wait(self.juggcontext.var_f8236448eb258010);
    }
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa11
// Size: 0x6d
function function_fa4f1a412ab12028(damage, shitloc, smeansofdeath, attacker) {
    var_1f48003b8e69560c = function_c0aa811f7b45687c(shitloc, smeansofdeath, attacker);
    if (!isdefined(var_1f48003b8e69560c)) {
        /#
            if (isdefined(attacker) && isdefined(shitloc) && isplayer(attacker)) {
                attacker iprintln("<unknown string>" + shitloc);
            }
        #/
        return;
    }
    function_94b7ecf1273ba3c0(var_1f48003b8e69560c, damage);
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa85
// Size: 0x112
function function_c0aa811f7b45687c(shitloc, smeansofdeath, attacker) {
    var_1f48003b8e69560c = undefined;
    if (isheadshot(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "head_health";
    } else if (istorsouppershot(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "torso_upper_health";
    } else if (function_77ed09d75c0c7165(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "torso_lower_health";
    } else if (function_24278eb0ec1e2953(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "right_upper_arm_health";
    } else if (function_bf1efc7185168448(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "right_lower_arm_health";
    } else if (function_82850161196df912(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "left_upper_arm_health";
    } else if (function_d7395809e0049a49(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "left_lower_arm_health";
    } else if (function_c0bd16deeb47765b(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "right_leg_health";
    } else if (function_f15a47528fffce28(shitloc, smeansofdeath, attacker)) {
        var_1f48003b8e69560c = "left_leg_health";
    }
    /#
        if (isdefined(shitloc) && isdefined(attacker) && isplayer(attacker)) {
            attacker iprintlnbold("<unknown string>" + shitloc);
        }
    #/
    return var_1f48003b8e69560c;
}

// Namespace namespace_cf0b1612db6434d3/namespace_1f8384d33bfd1e13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9f
// Size: 0x213
function function_94b7ecf1273ba3c0(part, damage) {
    if (isdefined(self.juggcontext.var_5f03cad2b199e1bc)) {
        self [[ self.juggcontext.var_5f03cad2b199e1bc ]](part, damage);
    }
    if (isdefined(self.juggcontext.var_46ad94f231cd4ef3[part])) {
        if (part == "head_health") {
            if (isdefined(self.helmethealth) && isdefined(self.var_cfc69e5588a5bed6) && self.var_cfc69e5588a5bed6 > 0) {
                self.juggcontext.var_46ad94f231cd4ef3[part] = self.helmethealth / self.var_cfc69e5588a5bed6 * 10;
            } else {
                self.juggcontext.var_46ad94f231cd4ef3[part] = self.juggcontext.var_46ad94f231cd4ef3[part] - damage;
            }
            if (self.juggcontext.var_46ad94f231cd4ef3[part] <= 0) {
                self.juggcontext.var_46ad94f231cd4ef3[part] = undefined;
                if (issubstr(self.agent_type, "merc")) {
                    namespace_daa149ca485fd50a::function_59ea6b2f800cb082(self);
                } else {
                    function_fd38d13ec4cf6449(part, "destroyed");
                }
            } else if (self.juggcontext.var_46ad94f231cd4ef3[part] <= 50) {
                if (issubstr(self.agent_type, "merc")) {
                    goto LOC_0000018c;
                }
                function_fd38d13ec4cf6449(part, "damaged");
            LOC_0000018c:
            }
        LOC_0000018c:
        } else {
            self.juggcontext.var_46ad94f231cd4ef3[part] = self.juggcontext.var_46ad94f231cd4ef3[part] - damage;
            if (self.juggcontext.var_46ad94f231cd4ef3[part] <= 0) {
                self.juggcontext.var_46ad94f231cd4ef3[part] = undefined;
                if (issubstr(self.agent_type, "merc")) {
                    goto LOC_00000211;
                }
                function_fd38d13ec4cf6449(part, "damaged");
            LOC_00000211:
            }
        LOC_00000211:
        }
    LOC_00000211:
    }
LOC_00000211:
}

