// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_3433ee6b63c7e243;

#namespace grenade_response;

// Namespace grenade_response/namespace_d5c39581ce8b0ec7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14a
// Size: 0x1f7
function playgrenadereturnthrowanim(asmname, statename, params) {
    self endon(statename + "_finished");
    var_d21fbd6dd45d4d02 = asm_getanim(asmname, statename);
    var_7775df8e768c0eb4 = asm_getxanim(statename, var_d21fbd6dd45d4d02);
    self animmode("zonly_physics");
    if (isdefined(self.grenade) && distancesquared(self.grenade.origin, self.origin) > 36) {
        self orientmode("face angle", vectortoyaw(self.grenade.origin - self.origin));
    }
    self aisetanim(statename, var_d21fbd6dd45d4d02);
    var_3bb16be1e3f07ac = animhasnotetrack(var_7775df8e768c0eb4, "grenade_left");
    var_e8f68117b9bb4f99 = animhasnotetrack(var_7775df8e768c0eb4, "grenade_right");
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
        var_2280f90002d7a99c = self getgrenadetossvel();
        if (isdefined(var_2280f90002d7a99c)) {
            var_85d69e32359b24 = vectortoyaw(var_2280f90002d7a99c);
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
    wait(1);
    self notify("killanimscript");
}

// Namespace grenade_response/namespace_d5c39581ce8b0ec7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x348
// Size: 0x6b
function terminategrenadereturnthrowanim(asmname, statename, params) {
    asm_fireephemeralevent("grenade_response", "return throw complete");
    namespace_223959d3e5206cfb::placeweaponon(self.weapon, "right");
    if (isdefined(self.oldgrenadeweapon)) {
        self.grenadeweapon = self.oldgrenadeweapon;
        self.oldgrenadeweapon = undefined;
    }
}

// Namespace grenade_response/namespace_d5c39581ce8b0ec7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba
// Size: 0x5c
function islowthrowsafe() {
    start = (self.origin[0], self.origin[1], self.origin[2] + 20);
    end = start + anglestoforward(self.angles) * 50;
    return sighttracepassed(start, end, 0, undefined);
}

// Namespace grenade_response/namespace_d5c39581ce8b0ec7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x41e
// Size: 0xb5
function choosegrenadereturnthrowanim(asmname, statename, params) {
    var_d21fbd6dd45d4d02 = undefined;
    var_d3cb2de2fce8602b = 1000;
    if (isdefined(self.enemy)) {
        var_d3cb2de2fce8602b = distance(self.origin, self.enemy.origin);
    }
    animarray = [];
    if (var_d3cb2de2fce8602b < 600 && islowthrowsafe()) {
        if (var_d3cb2de2fce8602b < 300) {
            return asm_lookupanimfromalias(statename, "throw_short");
        } else {
            return asm_lookupanimfromalias(statename, "throw_long");
        }
    }
    return asm_lookupanimfromalias(statename, "throw_default");
}

// Namespace grenade_response/namespace_d5c39581ce8b0ec7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4db
// Size: 0x3a
function playgrenadeavoidanim(asmname, statename, params) {
    self.asm.bshouldattemptdive = randomint(100) > 50;
}

// Namespace grenade_response/namespace_d5c39581ce8b0ec7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x51c
// Size: 0x11d
function shouldgrenadedive(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.asm.bshouldattemptdive) {
        return 0;
    }
    if (self.currentpose != "stand") {
        return 0;
    }
    if (!isdefined(self.grenade)) {
        return 0;
    }
    var_e44254f1152cc64f = 0;
    var_e44254f1152cc64f = angleclamp180(vectortoangles(self.grenade.origin - self.origin)[1] - self.angles[1]);
    if (abs(var_e44254f1152cc64f) < 90 && params == "backward") {
        return 0;
    }
    var_bbe5d95734e18b42 = asm_getanim(asmname, var_f2b19b25d457c2a6);
    var_b097ea73f09f9ef4 = asm_getxanim(var_f2b19b25d457c2a6, var_bbe5d95734e18b42);
    var_97ab28057148c1fd = getmovedelta(var_b097ea73f09f9ef4, 0, 0.5);
    var_597d30b536cff2cc = self localtoworldcoords(var_97ab28057148c1fd);
    if (!self maymovetopoint(var_597d30b536cff2cc)) {
        return 0;
    }
    return 1;
}

// Namespace grenade_response/namespace_d5c39581ce8b0ec7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x641
// Size: 0x2f
function grenadeavoid_terminate(asmname, statename, params) {
    self.asm.bshouldattemptdive = undefined;
}

