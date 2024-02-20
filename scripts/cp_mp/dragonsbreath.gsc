// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\dragonsbreath.gsc;

#namespace namespace_23227899dfba5895;

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8
// Size: 0x3f
function function_df4e9a1e313ea352() {
    dragonsbreathdamage = spawnstruct();
    dragonsbreathdamage.newhitlocs = [];
    dragonsbreathdamage.hitslocs = [];
    dragonsbreathdamage.burningstate = "neutral";
    return dragonsbreathdamage;
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f
// Size: 0x88
function function_6dc8c5de229e86ff(newhitlocs, attacker, objweapon) {
    foreach (part in newhitlocs) {
        if (isshield(part)) {
            newhitlocs = array_remove(newhitlocs, part);
        }
    }
    if (newhitlocs.size == 0) {
        return;
    }
    thread function_a0888e06aa555932(newhitlocs, attacker, objweapon);
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ae
// Size: 0x2c
function function_56a694363da738ac() {
    var_3741ea5b9fb53ec3 = self getcorpseentity();
    if (!isdefined(var_3741ea5b9fb53ec3)) {
        return;
    }
    var_3741ea5b9fb53ec3 setscriptablepartstate("burning", "flareUp", 0);
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e1
// Size: 0x1a
function function_9fd9dc9d9d3a0bc4() {
    self notify("stop_dragonsbreathDamage");
    self.dragonsbreathdamage = function_df4e9a1e313ea352();
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x402
// Size: 0x2a8
function function_a0888e06aa555932(newBurningParts, attacker, objweapon) {
    self notify("newBurningParts");
    self endon("disconnect");
    self endon("newBurningParts");
    self endon("stop_dragonsbreathDamage");
    newBurningParts = array_remove_duplicates(newBurningParts);
    foreach (part in newBurningParts) {
        if (isdefined(self.dragonsbreathdamage.hitslocs[part])) {
            self.dragonsbreathdamage.hitslocs[part] = self.dragonsbreathdamage.hitslocs[part] + 0.5;
            if (function_f30a6d3194f97c09(objweapon, "specialty_ub_flamethrower")) {
                self.dragonsbreathdamage.hitslocs[part] = min(self.dragonsbreathdamage.hitslocs[part], 1);
            } else {
                self.dragonsbreathdamage.hitslocs[part] = min(self.dragonsbreathdamage.hitslocs[part], 4);
            }
        } else {
            self.dragonsbreathdamage.hitslocs[part] = 0.5;
        }
    }
    function_f21bfcf42e2f3e8b();
    while (1) {
        wait(0.25);
        if (!isreallyalive(self) || self.dragonsbreathdamage.hitslocs.size == 0) {
            break;
        }
        statechange = 0;
        function_8b5ae6ab700339f8(attacker, objweapon);
        foreach (key, var_fabe55b122c8df13 in self.dragonsbreathdamage.hitslocs) {
            self.dragonsbreathdamage.hitslocs[key] = self.dragonsbreathdamage.hitslocs[key] - 0.25;
            if (self.dragonsbreathdamage.hitslocs[key] <= 0) {
                self.dragonsbreathdamage.hitslocs = array_remove_key(self.dragonsbreathdamage.hitslocs, key);
                statechange = 1;
            }
        }
        if (statechange) {
            function_f21bfcf42e2f3e8b();
        }
    }
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b1
// Size: 0xef
function function_8b5ae6ab700339f8(attacker, objweapon) {
    if (isdefined(attacker) && isalive(attacker)) {
        attacker endon("death");
        var_9becaeedb8c6bf2c = makeweapon("dragonsbreath_mp");
        attacker function_49967318fbd12317(var_9becaeedb8c6bf2c, objweapon);
        var_3315791b141386c1 = 10 * 0.5;
        var_8848a3ce32577e8a = min(self.dragonsbreathdamage.hitslocs.size, 3);
        var_76e563db5d11a0ea = int(var_3315791b141386c1 * var_8848a3ce32577e8a);
        if (function_f30a6d3194f97c09(objweapon, "specialty_ub_flamethrower")) {
            var_3315791b141386c1 = 4 * 0.5;
            var_76e563db5d11a0ea = int(var_3315791b141386c1 * var_8848a3ce32577e8a);
        }
        if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_blastshield")) {
            var_76e563db5d11a0ea = 2;
        }
        if (var_76e563db5d11a0ea > 0) {
            self dodamage(var_76e563db5d11a0ea, attacker.origin, attacker, attacker, "MOD_FIRE", var_9becaeedb8c6bf2c, "torso_upper");
        }
    }
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a7
// Size: 0x3a5
function function_f21bfcf42e2f3e8b() {
    burningstate = "";
    points = [];
    points["al_"] = 0;
    points["to_"] = 0;
    points["ar_"] = 0;
    points["ll_"] = 0;
    points["lr"] = 0;
    if (!isdefined(self.dragonsbreathdamage)) {
        return;
    }
    var_a68e09aa749d3c69 = self.dragonsbreathdamage.hitslocs;
    if (isdefined(self.var_7e2abe421347dd30)) {
        foreach (var_419e24dbc44963ed in self.var_7e2abe421347dd30) {
            if (!isdefined(var_a68e09aa749d3c69[var_419e24dbc44963ed.hitloc])) {
                var_a68e09aa749d3c69[var_419e24dbc44963ed.hitloc] = 1;
            } else {
                var_a68e09aa749d3c69[var_419e24dbc44963ed.hitloc] = var_a68e09aa749d3c69[var_419e24dbc44963ed.hitloc] + 1;
            }
        }
    }
    if (isdefined(self.dragonsbreathdamage.var_7b9feffaafce932)) {
        foreach (var_6193680db4166136 in self.dragonsbreathdamage.var_7b9feffaafce932) {
            if (!isdefined(var_a68e09aa749d3c69[var_6193680db4166136])) {
                var_a68e09aa749d3c69[var_6193680db4166136] = 2;
            } else {
                var_a68e09aa749d3c69[var_6193680db4166136] = var_a68e09aa749d3c69[var_6193680db4166136] + 1;
            }
        }
    }
    foreach (var_6bc1cacfca73bcc3, var_1fd61b140d0a59f1 in var_a68e09aa749d3c69) {
        var_b8c1bd5e260f7f81 = function_3d9255af28a82f08(var_6bc1cacfca73bcc3);
        if (isdefined(var_b8c1bd5e260f7f81)) {
            points[var_b8c1bd5e260f7f81] = points[var_b8c1bd5e260f7f81] + var_1fd61b140d0a59f1;
        }
        /#
            if (!isdefined(var_b8c1bd5e260f7f81)) {
                /#
                    assertmsg("db_damage");
                #/
            }
        #/
    }
    if (points["al_"] > 0 || points["to_"] >= 2) {
        burningstate = burningstate + "al_";
    }
    if (points["to_"] > 0 || points["al_"] >= 2 || points["ar_"] >= 2) {
        burningstate = burningstate + "to_";
    }
    if (points["ar_"] > 0 || points["to_"] >= 2) {
        burningstate = burningstate + "ar_";
    }
    if (points["ll_"] > 0 || points["lr"] >= 2) {
        burningstate = burningstate + "ll_";
    }
    if (points["lr"] > 0 || points["ll_"] >= 2) {
        burningstate = burningstate + "lr";
    }
    if (burningstate == "al_to_ar_ll_" || burningstate == "al_to_ar_lr" || burningstate == "al_to_ll_lr" || burningstate == "al_ar_ll_lr" || burningstate == "to_ar_ll_lr" || burningstate == "al_to_ar_ll_lr") {
        burningstate = "all_parts";
    } else if (burningstate == "") {
        burningstate = "neutral";
    }
    if (burningstate != self.dragonsbreathdamage.burningstate) {
        if (burningstate == "neutral") {
            namespace_3bbb5a98b932c46f::disableburnfx(1, self.dragonsbreathdamage.burningstate);
        } else {
            namespace_3bbb5a98b932c46f::enableburnfx(1, burningstate);
        }
        self.dragonsbreathdamage.burningstate = burningstate;
    }
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb53
// Size: 0x147
function function_3d9255af28a82f08(hitloc) {
    switch (hitloc) {
    case #"hash_8a1772f5f912c880":
        return "to_";
    case #"hash_b107b5547c755d23":
        return "to_";
    case #"hash_92bbfe494d03d772":
        return "to_";
    case #"hash_b275b50677dcf6cb":
        return "to_";
    case #"hash_fbb61fc356f3c75e":
        return "to_";
    case #"hash_d42e71cd9f1e822f":
        return "ar_";
    case #"hash_51d5d0b9add9cc5a":
        return "al_";
    case #"hash_5d5aac570f6fd382":
        return "ar_";
    case #"hash_a7980c387477e7bb":
        return "al_";
    case #"hash_da2f35145aa58933":
        return "ar_";
    case #"hash_da51cc36a471058":
        return "al_";
    case #"hash_1cbc508a2fe01b79":
        return "lr";
    case #"hash_810a7426c8bac3ac":
        return "ll_";
    case #"hash_a638fec9040cfcf4":
        return "lr";
    case #"hash_7b36142458a6c2d5":
        return "ll_";
    case #"hash_9536712388e65bce":
        return "lr";
    case #"hash_168c74e879f0ba11":
        return "ll_";
        break;
    }
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca1
// Size: 0x52
function isdragonsbreathweapon(objweapon) {
    if (istrue(objweapon.isalternate)) {
        if (function_f30a6d3194f97c09(objweapon, "specialty_incendiary_alt")) {
            return 1;
        }
        if (function_f30a6d3194f97c09(objweapon, "specialty_ub_flamethrower")) {
            return 1;
        }
    } else if (function_f30a6d3194f97c09(objweapon, "specialty_incendiary")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfb
// Size: 0x33
function function_cfd2e1e48edaf93(objweapon) {
    if (!istrue(objweapon.isalternate)) {
        if (objweapon.basename == "dragonsbreath_mp") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd36
// Size: 0x1e
function isshield(hitloc) {
    if (hitloc == "shield") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5b
// Size: 0x144
function function_c206c109a26f598(idamage, attacker, objweapon, hitloc) {
    if (!isdefined(self.var_7e2abe421347dd30)) {
        self.var_7e2abe421347dd30 = [];
    }
    if (!isdefined(self.dragonsbreathdamage)) {
        self.dragonsbreathdamage = namespace_8472f410cbc5f0c::function_df4e9a1e313ea352();
    }
    var_f5c8fef008fff1dd = idamage * getdvarfloat(@"hash_ba97c3be3b58a828", 0.2);
    var_f25b10d0d2d8664c = getdvarint(@"hash_632c2d7b6b4c3771", 2);
    damagetime = getdvarfloat(@"hash_a55cc107911a0ce0", 0.75);
    var_60d435c6357875ea = damagetime / var_f25b10d0d2d8664c;
    var_419e24dbc44963ed = spawnstruct();
    var_419e24dbc44963ed.var_f25b10d0d2d8664c = var_f25b10d0d2d8664c;
    var_419e24dbc44963ed.var_76e563db5d11a0ea = round(var_f5c8fef008fff1dd / var_419e24dbc44963ed.var_f25b10d0d2d8664c);
    var_419e24dbc44963ed.attacker = attacker;
    var_419e24dbc44963ed.objweapon = objweapon;
    var_419e24dbc44963ed.hitloc = hitloc;
    self.var_7e2abe421347dd30[self.var_7e2abe421347dd30.size] = var_419e24dbc44963ed;
    thread function_1a50056b16521c9e(attacker, var_60d435c6357875ea);
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea6
// Size: 0x1e2
function function_1a50056b16521c9e(attacker, var_60d435c6357875ea) {
    self notify("db_damage");
    self endon("db_damage");
    self endon("death_or_disconnect");
    self.var_35116e057346139e = 1;
    function_f21bfcf42e2f3e8b();
    var_9becaeedb8c6bf2c = makeweapon("dragonsbreath_mp");
    var_56ebc7f3844cb706 = getdvarfloat(@"hash_de9e421a9bb5c99a", 0.3);
    wait(var_56ebc7f3844cb706);
    while (isdefined(self.var_7e2abe421347dd30) && self.var_7e2abe421347dd30.size > 0) {
        var_5ae1ceeb2401dbd5 = self.var_7e2abe421347dd30[0];
        while (var_5ae1ceeb2401dbd5.var_f25b10d0d2d8664c > 0 && isdefined(var_5ae1ceeb2401dbd5.attacker)) {
            wait(var_60d435c6357875ea);
            damage = 0;
            for (i = 0; i < self.var_7e2abe421347dd30.size; i++) {
                attacker = self.var_7e2abe421347dd30[i].attacker;
                objweapon = self.var_7e2abe421347dd30[i].objweapon;
                hitloc = self.var_7e2abe421347dd30[i].hitloc;
                if (isdefined(attacker)) {
                    attacker function_49967318fbd12317(var_9becaeedb8c6bf2c, objweapon);
                    damage = self.var_7e2abe421347dd30[i].var_76e563db5d11a0ea;
                    self dodamage(damage, attacker.origin, attacker, attacker, "MOD_FIRE", var_9becaeedb8c6bf2c, "torso_lower");
                    self.var_7e2abe421347dd30[i].var_f25b10d0d2d8664c--;
                }
            }
        }
        self.var_7e2abe421347dd30 = array_remove(self.var_7e2abe421347dd30, var_5ae1ceeb2401dbd5);
        function_f21bfcf42e2f3e8b();
        waitframe();
    }
    function_d36940aa00b20558();
    function_f21bfcf42e2f3e8b();
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108f
// Size: 0x12
function function_22d1fced237d6878() {
    self notify("db_damage");
    function_d36940aa00b20558();
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a8
// Size: 0x17
function function_d36940aa00b20558() {
    self.var_7e2abe421347dd30 = undefined;
    self.var_35116e057346139e = undefined;
}

// Namespace namespace_23227899dfba5895/namespace_8472f410cbc5f0c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0x124
function function_5a05899bb304a6d4(hitloc, var_3f160c063bbc3525) {
    if (!isplayer(self)) {
        return;
    }
    note = "crossbowBurning" + hitloc;
    self notify(note);
    self endon(note);
    self endon("death_or_disconnect");
    self endon("stop_dragonsbreathDamage");
    if (!isdefined(self.dragonsbreathdamage)) {
        self.dragonsbreathdamage = namespace_8472f410cbc5f0c::function_df4e9a1e313ea352();
    }
    if (!isdefined(self.dragonsbreathdamage.var_7b9feffaafce932)) {
        self.dragonsbreathdamage.var_7b9feffaafce932 = [];
    }
    self.dragonsbreathdamage.var_7b9feffaafce932 = array_add(self.dragonsbreathdamage.var_7b9feffaafce932, hitloc);
    function_f21bfcf42e2f3e8b();
    wait(var_3f160c063bbc3525);
    if (isdefined(self) && isdefined(self.dragonsbreathdamage) && isdefined(self.dragonsbreathdamage.var_7b9feffaafce932)) {
        self.dragonsbreathdamage.var_7b9feffaafce932 = array_remove(self.dragonsbreathdamage.var_7b9feffaafce932, hitloc);
    }
    function_f21bfcf42e2f3e8b();
}

