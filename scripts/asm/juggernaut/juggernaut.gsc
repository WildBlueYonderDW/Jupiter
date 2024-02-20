// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_3433ee6b63c7e243;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using script_13d1c402f1421c35;
#using scripts\common\utility.gsc;
#using scripts\asm\juggernaut\juggernaut.gsc;

#namespace juggernaut;

// Namespace juggernaut/namespace_d663621620fc0601
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0xa3
function juggernaut(asmname) {
    self endon("asm_terminated");
    self endon("death");
    if (isdefined(self.subclass) && self.subclass == "juggernaut" || isdefined(self.agent_type) && self.agent_type == "juggernaut") {
        if (self.var_ae3ea15396b65c1f == "juggernaut" || self.var_ae3ea15396b65c1f == "juggernaut_cp" || self.var_ae3ea15396b65c1f == "juggernaut_lw") {
            namespace_d663621620fc0601::initanimspeedthresholds_juggernaut(self.var_ae3ea15396b65c1f);
        }
    }
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a
// Size: 0x4b
function initanimspeedthresholds_juggernaut(var_ae3ea15396b65c1f) {
    if (animspeedthresholdsexist(var_ae3ea15396b65c1f)) {
        return;
    }
    anim.juggernautspeedthreholdsinitialized = 1;
    setspeedthreshold(var_ae3ea15396b65c1f, "walk", 40);
    setspeedthreshold(var_ae3ea15396b65c1f, "jog", 113);
    setspeedthreshold(var_ae3ea15396b65c1f, "run", 170);
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0x1e5
function enable_casual_killer() {
    if (isdefined(self.combatmode)) {
        self.ck_combatmode = self.combatmode;
    }
    self function_9f82c74eb1b7caf9(0);
    self allowedstances("stand");
    self.cautiousnavigation = 1;
    self.dontmeleeme = 1;
    self.dontmelee = 1;
    self.ck_grenadeammo = self.grenadeammo;
    self.grenadeammo = 0;
    self.ck_aggressivemode = istrue(self.aggressivemode);
    self.aggressivemode = 1;
    self.ignoresuppression = 1;
    set_movement_speed(50);
    self.turnrate = 0.1;
    self.allowstrafe = 0;
    self.disablepistol = 1;
    self.dontsyncmelee = 1;
    self.disablebulletwhizbyreaction = 1;
    self.neversprintforvariation = 1;
    self.disablerunngun = 1;
    self.casualkiller = 1;
    self.dontgiveuponsuppression = 1;
    self.forcesuppressai = 1;
    self.pathenemyfightdist = 0;
    self.var_98add129a7ecb962 = 0;
    weapclass = weaponclass(self.weapon);
    namespace_d663621620fc0601::initanimspeedthresholds_juggernaut("juggernaut");
    self setbasearchetype("juggernaut");
    var_c1ca5a5d2ddad8e8 = "casual_killer";
    if (weapclass == "mg") {
        var_c1ca5a5d2ddad8e8 = "casual_killer_lmg";
    }
    self setoverridearchetype("demeanor", var_c1ca5a5d2ddad8e8, 1);
    thread casual_killer_targeting();
    if (weapclass == "mg" || weapclass == "rifle" || weapclass == "smg") {
        thread casual_killer_sweep();
    }
    if (weapclass == "rifle" || weapclass == "smg") {
        self.shootstyleoverride = "full";
    }
    thread casual_killer_enemy_reaction();
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0x18
function disable_casual_killer() {
    if (!istrue(self.leavecasualkiller)) {
        thread disable_casual_killer_internal();
    }
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d7
// Size: 0x26a
function disable_casual_killer_internal() {
    if (!isdefined(level.casualkillernewenemyreaction) || gettime() > level.casualkillernewenemyreaction) {
        self.newenemyreactiontime = gettime() + 3000;
        self.newenemyreaction = 1;
        self.forcenewenemyreaction = 1;
    }
    self.leavecasualkiller = 1;
    self clearentitytarget();
    self.favoriteenemy = undefined;
    self.gunposeoverride = undefined;
    if (isdefined(self.pathgoalpos)) {
        self setbtgoalpos(4, self getposonpath(64));
    }
    /#
        if (getdvarint(@"hash_d7f290f0d986c37", 0) == 1) {
            thread function_f8bf65b96ea0085e();
        }
    #/
    waittill_any_2("leaveCasualKiller", "death");
    if (!isalive(self) || !isdefined(self)) {
        return;
    }
    self.cautiousnavigation = 0;
    self.dontmeleeme = 0;
    self.grenadeammo = self.ck_grenadeammo;
    if (istrue(self.ck_aggressivemode)) {
        self.aggressivemode = 1;
    }
    utility::lookatentity(undefined);
    utility::lookatpos(undefined);
    self.ignoresuppression = 0;
    self.dontmelee = 0;
    self.turnrate = 0.3;
    utility::clear_movement_speed();
    self.disablepistol = 0;
    self.allowstrafe = 1;
    self.dontsyncmelee = undefined;
    self.disablebulletwhizbyreaction = 0;
    self.neversprintforvariation = undefined;
    self.disablerunngun = 0;
    self.casualkiller = 0;
    self.casualkillershootpos = undefined;
    self.pathenemyfightdist = 192;
    self.dontevershoot = 0;
    self.shootstyleoverride = undefined;
    self.dontgiveuponsuppression = undefined;
    self.forcesuppressai = 0;
    self.gunposeoverride = undefined;
    self.aimyawspeed = 0;
    self clearbtgoal(4);
    if (isdefined(self.ck_target)) {
        self.ck_target delete();
    }
    self.var_98add129a7ecb962 = 1;
    self allowedstances("stand", "crouch", "prone");
    self function_9f82c74eb1b7caf9(1);
    if (isdefined(self.ck_combatmode)) {
        self.combatmode = self.ck_combatmode;
        self.ck_combatmode = undefined;
    } else {
        self.combatmode = "cover";
    }
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x748
// Size: 0x4c
function function_f8bf65b96ea0085e() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            sphere(self.origin + (0, 0, 60), 4, (0, 1, 0), 0, 1);
            waitframe();
        }
    #/
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79b
// Size: 0x70
function casual_killer_damage_func(damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon) {
    if (is_equal(attacker, level.player)) {
        self notify("ck_player_attacked_me");
    }
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x812
// Size: 0x67
function casual_killer_enemy_reaction() {
    self endon("leaveCasualKiller");
    self endon("death");
    if (!isdefined(self.damage_functions)) {
        self.damage_functions = [];
    }
    self.damage_functions[self.damage_functions.size] = &casual_killer_damage_func;
    self waittill("ck_player_attacked_me");
    self.favoriteenemy = undefined;
    self clearentitytarget();
    self setthreatbiasgroup("axis");
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x880
// Size: 0x472
function casual_killer_targeting() {
    self endon("leaveCasualKiller");
    self endon("death");
    wait(1);
    self.ck_target = spawn("script_origin", self.origin);
    thread delete_on_death(self.ck_target);
    currentenemy = undefined;
    var_47bccb924d51b014 = 0;
    var_bf49e927a147e7ea = undefined;
    var_d9f67b70125e4d15 = undefined;
    while (1) {
        waitframe();
        if (!isdefined(self) || !isalive(self) || istrue(self.leavecasualkiller)) {
            return;
        }
        self.gunposeoverride = "disable";
        forward = anglestoforward(self.angles);
        var_63a5b32b096323be = self getshootfrompos();
        if (var_47bccb924d51b014) {
            if (!isalive(currentenemy)) {
                var_bf49e927a147e7ea = gettime();
                self setentitytarget(self.ck_target);
                self forcethreatupdate();
                var_47bccb924d51b014 = 0;
                var_d9f67b70125e4d15 = undefined;
            } else {
                self.ck_target.origin = currentenemy.origin;
            }
        }
        framecount = int(gettime() / 50);
        if (self getentitynumber() % 4 != framecount % 4) {
            if (isdefined(var_bf49e927a147e7ea) && var_bf49e927a147e7ea + 3000 > gettime()) {
                totarget = self.ck_target.origin - self.origin;
                if (length(totarget) > 100) {
                    totarget = vectornormalize(totarget);
                    var_b38f9f63c4ae4218 = abs(angleclamp180(acos(clamp(vectordot(forward, totarget), -1, 1))));
                    if (var_b38f9f63c4ae4218 > 30 && gettime() < var_bf49e927a147e7ea + 1500) {
                        continue;
                    }
                    if (var_b38f9f63c4ae4218 < 90) {
                        continue;
                    }
                }
            }
            var_bf49e927a147e7ea = undefined;
            if (!isdefined(var_d9f67b70125e4d15) || gettime() > var_d9f67b70125e4d15 + 3000) {
                self clearentitytarget();
                self forcethreatupdate();
                if (isalive(self.enemy)) {
                    if (var_47bccb924d51b014 && self.enemy == currentenemy) {
                        potentialtarget = self.enemy;
                        toenemy = self.enemy.origin - self.origin;
                        toenemy = vectornormalize(toenemy);
                        dot = clamp(vectordot(forward, toenemy), -1, 1);
                        var_7ef311e27099889b = abs(angleclamp180(acos(dot)));
                        if (var_7ef311e27099889b > 70) {
                            var_70f421a55d12e111 = self getsecondarytargets();
                            if (isdefined(var_70f421a55d12e111)) {
                                foreach (secondarytarget in var_70f421a55d12e111) {
                                    totarget = secondarytarget.origin - self.origin;
                                    totarget = vectornormalize(totarget);
                                    var_b38f9f63c4ae4218 = abs(angleclamp180(acos(clamp(vectordot(forward, totarget), -1, 1))));
                                    if (var_b38f9f63c4ae4218 < var_7ef311e27099889b) {
                                        var_7ef311e27099889b = var_b38f9f63c4ae4218;
                                        potentialtarget = secondarytarget;
                                    }
                                }
                                if (potentialtarget != self.enemy) {
                                    if (issentient(potentialtarget)) {
                                        self.favoriteenemy = potentialtarget;
                                        self forcethreatupdate();
                                        self.favoriteenemy = undefined;
                                        var_d9f67b70125e4d15 = gettime();
                                    }
                                }
                            }
                        }
                    }
                    var_47bccb924d51b014 = isalive(self.enemy);
                    if (var_47bccb924d51b014) {
                        currentenemy = self.enemy;
                    } else {
                        currentenemy = undefined;
                    }
                    continue;
                } else {
                    self setentitytarget(self.ck_target);
                    self forcethreatupdate();
                    if (isdefined(var_bf49e927a147e7ea) && var_bf49e927a147e7ea + 7000 > gettime()) {
                        if (vectordot(forward, self.ck_target.origin - var_63a5b32b096323be) > 0) {
                            continue;
                        }
                    }
                    self.ck_target.origin = self.origin + (0, 0, 40) + forward * 400;
                }
            }
        }
    }
}

// Namespace juggernaut/namespace_d663621620fc0601
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf9
// Size: 0x6bd
function casual_killer_sweep() {
    self endon("leaveCasualKiller");
    self endon("death");
    var_cc9867c158efea96 = 100;
    var_f1f1bcb5c9023d10 = 1000;
    var_455248ba6a05b7f6 = 20;
    var_fe188ffdfbd991d8 = -1;
    var_7bb1d92aef3fbb8b = [0:40, 1:50, 2:60];
    var_6d41eacb164da117 = [0:20, 1:25, 2:30];
    var_4ac58fb63979cc4 = 0;
    var_728f77917e6cf88f = 0;
    var_9b4a37baf5f7793a = random(var_7bb1d92aef3fbb8b);
    var_6fd0de104684e9fe = random(var_6d41eacb164da117);
    var_2e51cbd330774656 = 0;
    var_5caf41274f960e0d = undefined;
    var_3085bde8d3b9f336 = undefined;
    foreach (maxangle in var_6d41eacb164da117) {
        if (maxangle > var_4ac58fb63979cc4) {
            var_4ac58fb63979cc4 = maxangle;
        }
    }
    while (isalive(self) && isdefined(self)) {
        waitframe();
        self.leftaimlimit = 90;
        self.rightaimlimit = -90;
        self.aimyawspeed = 180;
        forward = anglestoforward(self.angles);
        var_63a5b32b096323be = self getshootfrompos();
        if (isdefined(self.enemy)) {
            if (!isdefined(self.pathgoalpos) || self.lookaheaddist > self aigetdesiredspeed()) {
                var_5caf41274f960e0d = self.enemy getshootatpos();
            }
        }
        var_7dff387edf36893b = asm_currentstatehasflag(self.var_a709fbd9fea148f6, "aim") || asm_currentstatehasflag(self.var_a709fbd9fea148f6, "notetrackAim");
        if (var_7dff387edf36893b) {
            var_7dff387edf36893b = isdefined(var_5caf41274f960e0d);
        }
        currentstate = asm_getcurrentstate(self.asmname);
        if (currentstate == "exposed_arrival" || currentstate == "exposed_reload") {
            var_7dff387edf36893b = 0;
        }
        if (var_7dff387edf36893b) {
            var_f58d35ffffdf0e30 = self getposonpath(self aigetdesiredspeed());
            var_778d002d5be90b60 = var_5caf41274f960e0d - var_f58d35ffffdf0e30;
            var_778d002d5be90b60 = (var_778d002d5be90b60[0], var_778d002d5be90b60[1], 0);
            var_3c8323340d37bffd = vectornormalize(var_778d002d5be90b60);
            var_4c3baabe5686a741 = self.leftaimlimit;
            if (!istrue(var_3085bde8d3b9f336)) {
                var_4c3baabe5686a741 = max(0, self.leftaimlimit - 20);
            }
            var_9625b7f28569e37a = abs(angleclamp180(acos(clamp(vectordot(var_3c8323340d37bffd, forward), -1, 1))));
            if (var_9625b7f28569e37a >= var_4c3baabe5686a741) {
                var_5caf41274f960e0d = undefined;
                var_2e51cbd330774656 = 0;
                var_7dff387edf36893b = 0;
            }
        }
        if (!istrue(var_7dff387edf36893b)) {
            utility::lookatentity(undefined);
            utility::lookatpos(var_63a5b32b096323be + forward * 200);
            self.casualkillershootpos = var_63a5b32b096323be + forward * 200;
            var_455248ba6a05b7f6 = 20 * var_fe188ffdfbd991d8;
            var_fe188ffdfbd991d8 = var_fe188ffdfbd991d8 * -1;
            var_2e51cbd330774656 = 0;
            self.dontevershoot = 1;
            var_3085bde8d3b9f336 = 0;
            continue;
        }
        var_3085bde8d3b9f336 = 1;
        self.dontevershoot = 0;
        if (isdefined(var_5caf41274f960e0d)) {
            utility::lookatpos(var_5caf41274f960e0d);
            /#
                if (getdvarint(@"hash_d7f290f0d986c37", 0) == 1) {
                    line(var_63a5b32b096323be, var_5caf41274f960e0d, (1, 0, 0), 1, 0, 1);
                    sphere(var_5caf41274f960e0d, 4, (1, 0, 0), 0, 1);
                }
            #/
        } else {
            utility::lookatentity(undefined);
            utility::lookatpos(undefined);
        }
        var_778d002d5be90b60 = var_5caf41274f960e0d - var_63a5b32b096323be;
        var_10f0ce3cffed6abb = length(var_778d002d5be90b60);
        var_3c8323340d37bffd = vectornormalize(var_778d002d5be90b60);
        var_9625b7f28569e37a = abs(angleclamp180(acos(clamp(vectordot(forward, var_3c8323340d37bffd), -1, 1))));
        var_40577e9afa2538df = axistoangles(var_3c8323340d37bffd, anglestoright(self.angles), anglestoup(self.angles));
        var_1d68d29c186725d1 = var_40577e9afa2538df[1];
        if (istrue(self.leavecasualkiller)) {
            if (var_455248ba6a05b7f6 > 0) {
                var_455248ba6a05b7f6 = var_455248ba6a05b7f6 - min(var_455248ba6a05b7f6, var_9b4a37baf5f7793a * level.framedurationseconds);
                var_fe188ffdfbd991d8 = -1;
            } else if (var_455248ba6a05b7f6 < 0) {
                var_455248ba6a05b7f6 = var_455248ba6a05b7f6 + min(var_455248ba6a05b7f6 * -1, var_9b4a37baf5f7793a * level.framedurationseconds);
                var_fe188ffdfbd991d8 = 1;
            }
        } else if (var_9625b7f28569e37a + var_4ac58fb63979cc4 < abs(self.leftaimlimit) && var_9625b7f28569e37a + var_4ac58fb63979cc4 < abs(self.rightaimlimit) && var_10f0ce3cffed6abb > var_cc9867c158efea96 && (var_10f0ce3cffed6abb < var_f1f1bcb5c9023d10 || isdefined(self.enemy) && self.enemy == level.player)) {
            if (gettime() > var_728f77917e6cf88f) {
                var_f661d02c9f3036b = level.framedurationseconds * var_9b4a37baf5f7793a * var_fe188ffdfbd991d8;
                var_455248ba6a05b7f6 = var_455248ba6a05b7f6 + var_f661d02c9f3036b;
                if (sign(var_455248ba6a05b7f6) == sign(var_fe188ffdfbd991d8) && abs(var_455248ba6a05b7f6) > var_6fd0de104684e9fe) {
                    var_fe188ffdfbd991d8 = var_fe188ffdfbd991d8 * -1;
                    var_9b4a37baf5f7793a = random(var_7bb1d92aef3fbb8b);
                    var_6fd0de104684e9fe = random(var_6d41eacb164da117);
                    var_728f77917e6cf88f = gettime() + 350;
                }
            }
            var_1d68d29c186725d1 = var_1d68d29c186725d1 + var_455248ba6a05b7f6;
        }
        var_a1142e485a655fec = axistoangles(var_3c8323340d37bffd, anglestoright(self.angles), anglestoup(self.angles));
        var_a1142e485a655fec = (var_a1142e485a655fec[0], var_1d68d29c186725d1, var_a1142e485a655fec[2]);
        var_3c8323340d37bffd = anglestoforward(var_a1142e485a655fec);
        self.casualkillershootpos = var_3c8323340d37bffd * var_10f0ce3cffed6abb + var_63a5b32b096323be;
        /#
            if (getdvarint(@"hash_d7f290f0d986c37", 0) == 1) {
                if (isdefined(self.casualkillershootpos)) {
                    var_63a5b32b096323be = self getshootfrompos();
                    line(var_63a5b32b096323be, self.casualkillershootpos, (0, 1, 0), 1, 0, 1);
                    sphere(self.casualkillershootpos, 5, (0, 1, 0), 0, 1);
                }
            }
            if (getdvarint(@"hash_960706093ece3d0c", 0) == 1) {
                sphere(self.origin, var_cc9867c158efea96, (1, 1, 1), 0, 1);
                sphere(self.origin, var_f1f1bcb5c9023d10, (0, 0, 0), 0, 1);
            }
        #/
        if (istrue(self.leavecasualkiller) && var_455248ba6a05b7f6 == 0) {
            return;
        }
    }
}

