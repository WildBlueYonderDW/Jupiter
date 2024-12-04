#using script_3433ee6b63c7e243;
#using scripts\asm\asm;

#namespace grenade_response;

// Namespace grenade_response / scripts\asm\soldier\grenade_response
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0
// Size: 0x1f1
function playgrenadereturnthrowanim(asmname, statename, params) {
    self endon(statename + "_finished");
    var_d21fbd6dd45d4d02 = asm_getanim(asmname, statename);
    throwxanim = asm_getxanim(statename, var_d21fbd6dd45d4d02);
    self animmode("zonly_physics");
    if (isdefined(self.grenade) && distancesquared(self.grenade.origin, self.origin) > 36) {
        self orientmode("face angle", vectortoyaw(self.grenade.origin - self.origin));
    }
    self aisetanim(statename, var_d21fbd6dd45d4d02);
    var_3bb16be1e3f07ac = animhasnotetrack(throwxanim, "grenade_left");
    var_e8f68117b9bb4f99 = animhasnotetrack(throwxanim, "grenade_right");
    var_cf41362c42b790cf = var_3bb16be1e3f07ac || var_e8f68117b9bb4f99;
    if (var_cf41362c42b790cf) {
        namespace_223959d3e5206cfb::placeweaponon(self.weapon, "left");
        thread asm_donotetracks(asmname, statename);
        if (var_3bb16be1e3f07ac) {
            self waittillmatch(statename, "grenade_left");
        } else {
            self waittillmatch(statename, "grenade_right");
        }
        self pickupgrenade();
        function_216c67ab6749137a(self, undefined, "use", "frag_grenade");
        grenadevel = self getgrenadetossvel();
        if (isdefined(grenadevel)) {
            var_85d69e32359b24 = vectortoyaw(grenadevel);
            self orientmode("face angle", var_85d69e32359b24);
        }
        self waittillmatch(statename, "grenade_throw");
    } else {
        thread asm_donotetracks(asmname, statename);
        self waittillmatch(statename, "grenade_throw");
        self pickupgrenade();
        function_216c67ab6749137a(self, undefined, "use", "frag_grenade");
    }
    if (isdefined(self.grenade)) {
        self throwgrenade();
    }
    wait 1;
    self notify("killanimscript");
}

// Namespace grenade_response / scripts\asm\soldier\grenade_response
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x399
// Size: 0x6a
function terminategrenadereturnthrowanim(asmname, statename, params) {
    asm_fireephemeralevent("grenade_response", "return throw complete");
    namespace_223959d3e5206cfb::placeweaponon(self.weapon, "right");
    if (isdefined(self.oldgrenadeweapon)) {
        self.grenadeweapon = self.oldgrenadeweapon;
        self.oldgrenadeweapon = undefined;
    }
}

// Namespace grenade_response / scripts\asm\soldier\grenade_response
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40b
// Size: 0x5b
function islowthrowsafe() {
    start = (self.origin[0], self.origin[1], self.origin[2] + 20);
    end = start + anglestoforward(self.angles) * 50;
    return sighttracepassed(start, end, 0, undefined);
}

// Namespace grenade_response / scripts\asm\soldier\grenade_response
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x46f
// Size: 0xb3
function choosegrenadereturnthrowanim(asmname, statename, params) {
    var_d21fbd6dd45d4d02 = undefined;
    throwdist = 1000;
    if (isdefined(self.enemy)) {
        throwdist = distance(self.origin, self.enemy.origin);
    }
    animarray = [];
    if (throwdist < 600 && islowthrowsafe()) {
        if (throwdist < 300) {
            return asm_lookupanimfromalias(statename, "throw_short");
        } else {
            return asm_lookupanimfromalias(statename, "throw_long");
        }
    }
    return asm_lookupanimfromalias(statename, "throw_default");
}

// Namespace grenade_response / scripts\asm\soldier\grenade_response
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x52b
// Size: 0x39
function playgrenadeavoidanim(asmname, statename, params) {
    self.asm.bshouldattemptdive = randomint(100) > 50;
}

// Namespace grenade_response / scripts\asm\soldier\grenade_response
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x56c
// Size: 0x119
function shouldgrenadedive(asmname, statename, tostatename, params) {
    if (!self.asm.bshouldattemptdive) {
        return false;
    }
    if (self.currentpose != "stand") {
        return false;
    }
    if (!isdefined(self.grenade)) {
        return false;
    }
    var_e44254f1152cc64f = 0;
    var_e44254f1152cc64f = angleclamp180(vectortoangles(self.grenade.origin - self.origin)[1] - self.angles[1]);
    if (abs(var_e44254f1152cc64f) < 90 && params == "backward") {
        return false;
    }
    var_bbe5d95734e18b42 = asm_getanim(asmname, tostatename);
    divexanim = asm_getxanim(tostatename, var_bbe5d95734e18b42);
    moveby = getmovedelta(divexanim, 0, 0.5);
    var_597d30b536cff2cc = self localtoworldcoords(moveby);
    if (!self maymovetopoint(var_597d30b536cff2cc)) {
        return false;
    }
    return true;
}

// Namespace grenade_response / scripts\asm\soldier\grenade_response
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x68e
// Size: 0x2e
function grenadeavoid_terminate(asmname, statename, params) {
    self.asm.bshouldattemptdive = undefined;
}

