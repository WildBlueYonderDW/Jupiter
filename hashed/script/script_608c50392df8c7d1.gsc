// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;

#namespace namespace_8894a0caa4c34dc6;

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254
// Size: 0x4c
function function_9469d528dd1ee44d(streakname, scorepopup, vodestroyed, destroyedsplash) {
    self.streakname = streakname;
    self.scorepopup = scorepopup;
    self.vodestroyed = vodestroyed;
    self.destroyedsplash = destroyedsplash;
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7
// Size: 0x11c
function function_66a7440055d386c3(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    var_3737240cefe2c793 = 0;
    if (issharedfuncdefined("damage", "onKillstreakKilled") && isdefined(self.streakname)) {
        var_3737240cefe2c793 = self [[ getsharedfunc("damage", "onKillstreakKilled") ]](self.streakname, attacker, objweapon, meansofdeath, damage, self.scorepopup, self.vodestroyed, self.destroyedsplash);
    }
    if (var_3737240cefe2c793) {
        attacker notify("destroyed_equipment");
    }
    params = spawnstruct();
    params.meansofdeath = meansofdeath;
    callback::callback("on_functional_death", params);
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca
// Size: 0xd3
function function_7bdb3610d602438d(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    if (!isdefined(self.weapon_object) || !function_f3bb4f4911a1beb2("killstreak", "isKillstreakWeapon", self.weapon_object)) {
        modifieddamage = utility::handlemeleedamage(objweapon, type, modifieddamage);
    }
    if (issharedfuncdefined("damage", "handleAPDamage")) {
        modifieddamage = self [[ getsharedfunc("damage", "handleAPDamage") ]](objweapon, type, modifieddamage, attacker);
    }
    return modifieddamage;
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a5
// Size: 0x1df
function function_90663ca0d2564cb(data, var_b2c38c8cc8672f83, var_8097775071dc6820, var_487fc628c0a5bae7) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    if (type == "MOD_IMPACT") {
        return 0;
    }
    if (!istrue(self.bundle.var_b66f1c97537f8793)) {
        return damage;
    }
    var_10d243b75ec6d6ae = 1;
    if (isdefined(self.owner) && issharedfuncdefined("player", "isEnemy")) {
        var_10d243b75ec6d6ae = self.owner [[ getsharedfunc("player", "isEnemy") ]](attacker);
    }
    if (var_10d243b75ec6d6ae) {
        hitstokill = var_b2c38c8cc8672f83;
    } else {
        hitstokill = var_8097775071dc6820;
    }
    hits = undefined;
    if (isexplosivedamagemod(type) && istrue(self.bundle.var_2b7d67f150ee24a2)) {
        hits = function_f9dbf2d9862d62ab(data, var_10d243b75ec6d6ae);
    } else if (isbulletdamage(type) && istrue(self.bundle.var_15f28f93cf57d00f)) {
        hits = function_d2c1bb18b26d0a9c(data, var_10d243b75ec6d6ae);
    } else if (type == "MOD_MELEE") {
        if (isdefined(var_487fc628c0a5bae7) && var_487fc628c0a5bae7 < 0) {
            return damage;
        } else if (var_487fc628c0a5bae7 > 0) {
            hits = var_487fc628c0a5bae7;
        } else {
            hits = hitstokill;
        }
    }
    if (isdefined(hits)) {
        damage = int(ceil(min(1, hits / hitstokill) * self.maxhealth));
    }
    if (isdefined(self.damagecallback)) {
        [[ self.damagecallback ]](damage);
    }
    return damage;
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c
// Size: 0x64
function function_79a97ee01dc267d3(data) {
    /#
        assertex(isdefined(self.bundle), "The super entity must have the .bundle variable defined.");
    #/
    return function_90663ca0d2564cb(data, self.bundle.var_a59b12cf4b995b32, self.bundle.var_67246a26271ee81, self.bundle.var_487fc628c0a5bae7);
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6f8
// Size: 0xc4
function private function_d2c1bb18b26d0a9c(data, var_10d243b75ec6d6ae) {
    isfmjdamage = 0;
    if (issharedfuncdefined("damage", "isFMJDamage")) {
        isfmjdamage = [[ getsharedfunc("damage", "isFMJDamage") ]](data.objweapon, data.meansofdeath);
    }
    var_2ddcaf824ac5d676 = ter_op(isfmjdamage && var_10d243b75ec6d6ae, 2, 0);
    if (data.damage > 150) {
        return (var_2ddcaf824ac5d676 + 10);
    }
    if (data.damage >= 80) {
        return (var_2ddcaf824ac5d676 + 5);
    } else if (data.damage >= 30) {
        return (var_2ddcaf824ac5d676 + 2);
    } else {
        return (var_2ddcaf824ac5d676 + 1);
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c3
// Size: 0x59
function private function_f9dbf2d9862d62ab(data, var_10d243b75ec6d6ae) {
    if (data.damage > 200) {
        return 20;
    }
    if (data.damage > 70) {
        return 10;
    } else if (data.damage > 30) {
        return 7;
    } else {
        return 2;
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x823
// Size: 0x1c9
function function_62c1c6833c19817c(var_bbfb3676c2220d27, var_9f6eb6c8665a61ef) {
    self notify("stop_adjust_tilt_thread");
    self endon("death");
    level endon("game_ended");
    self endon("stop_adjust_tilt_thread");
    var_cf4febe91831ea56 = (1, 0, 0);
    var_773133c39e93a51d = (0, 1, 0);
    var_d2f1914cf518b7e0 = (0, 0, -1);
    waitframe();
    self.previousorigin = self.origin;
    self.targetangles = self.angles;
    while (1) {
        var_58f17fbb36dc3c08 = self.origin - self.previousorigin;
        var_8937550fde0269d1 = vectornormalize(var_58f17fbb36dc3c08);
        pitch = asin(vectordot(var_8937550fde0269d1, var_d2f1914cf518b7e0));
        var_8937550fde0269d1 = (var_8937550fde0269d1[0], var_8937550fde0269d1[1], 0);
        var_8937550fde0269d1 = vectornormalize(var_8937550fde0269d1);
        yaw = acos(vectordot(var_8937550fde0269d1, var_cf4febe91831ea56));
        if (vectordot(var_8937550fde0269d1, var_773133c39e93a51d) < 0) {
            yaw = 360 - yaw;
        }
        yawdiff = yaw - self.targetangles[1];
        if (abs(yawdiff) > 300) {
            yawdiff = yawdiff - 360;
        }
        var_a0ce54bdf5ecefa3 = clamp(yawdiff, var_9f6eb6c8665a61ef * -1, var_9f6eb6c8665a61ef);
        var_a747f74b413e1808 = var_a0ce54bdf5ecefa3 / var_9f6eb6c8665a61ef;
        roll = var_bbfb3676c2220d27 * var_a747f74b413e1808 * -1;
        self.previousorigin = self.origin;
        newangles = (pitch, yaw, roll);
        self.targetangles = newangles;
        wait(0.05);
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f3
// Size: 0x2de
function function_74f5ba869b257143(var_38a541b4d6af30a9, var_9d60d851a7af2d4e, var_2a86c82583ac927b) {
    self notify("stop_functionals_step_thread");
    self endon("death");
    level endon("game_ended");
    self endon("stop_functionals_step_thread");
    self.var_2563490ad9003bb4 = self.angles;
    var_8b8b3cacb00298e4 = 1;
    while (1) {
        if (isdefined(self.targetangles)) {
            var_fd4ec85a2030035e = angleclamp(self.targetangles[0]);
            var_22c00c8446cce458 = angleclamp(self.angles[0]);
            var_90b70945e4da41b3 = angleclamp(self.targetangles[1]);
            var_ac925502c32142dd = angleclamp(self.angles[1]);
            var_9f3eda8daa0eda03 = angleclamp(self.targetangles[2]);
            var_641a388819ce1d85 = angleclamp(self.angles[2]);
            var_80fbbf574580aa79 = var_fd4ec85a2030035e - var_22c00c8446cce458;
            var_c8d5fb1e79b42592 = var_90b70945e4da41b3 - var_ac925502c32142dd;
            var_9cff712ec7abd9b4 = var_9f3eda8daa0eda03 - var_641a388819ce1d85;
            var_a5a7ce89b43ee10c = var_fd4ec85a2030035e - var_22c00c8446cce458 + 360;
            var_3ef2bd1018948fcc = var_fd4ec85a2030035e - var_22c00c8446cce458 - 360;
            if (abs(var_a5a7ce89b43ee10c) < abs(var_80fbbf574580aa79)) {
                var_80fbbf574580aa79 = var_a5a7ce89b43ee10c;
            } else if (abs(var_3ef2bd1018948fcc) < abs(var_80fbbf574580aa79)) {
                var_80fbbf574580aa79 = var_3ef2bd1018948fcc;
            }
            var_cd314f4801f94ceb = var_90b70945e4da41b3 - var_ac925502c32142dd + 360;
            var_8a83d2c73960daab = var_90b70945e4da41b3 - var_ac925502c32142dd - 360;
            if (abs(var_cd314f4801f94ceb) < abs(var_c8d5fb1e79b42592)) {
                var_c8d5fb1e79b42592 = var_cd314f4801f94ceb;
            } else if (abs(var_8a83d2c73960daab) < abs(var_c8d5fb1e79b42592)) {
                var_c8d5fb1e79b42592 = var_8a83d2c73960daab;
            }
            var_fe6c7708be15720b = var_9f3eda8daa0eda03 - var_641a388819ce1d85 + 360;
            var_26e224b6a576bacb = var_9f3eda8daa0eda03 - var_641a388819ce1d85 - 360;
            if (abs(var_fe6c7708be15720b) < abs(var_9cff712ec7abd9b4)) {
                var_9cff712ec7abd9b4 = var_fe6c7708be15720b;
            } else if (abs(var_26e224b6a576bacb) < abs(var_9cff712ec7abd9b4)) {
                var_9cff712ec7abd9b4 = var_26e224b6a576bacb;
            }
            var_6a240ad8539ffa77 = self.angles[0] + clamp(var_80fbbf574580aa79, var_9d60d851a7af2d4e * -1, var_9d60d851a7af2d4e);
            var_82d64b21ea1f2f76 = self.angles[1] + clamp(var_c8d5fb1e79b42592, var_38a541b4d6af30a9 * -1, var_38a541b4d6af30a9);
            var_29abb572cb02bb0 = self.angles[2] + clamp(var_9cff712ec7abd9b4, var_2a86c82583ac927b * -1, var_2a86c82583ac927b);
            newangles = (var_6a240ad8539ffa77, var_82d64b21ea1f2f76, var_29abb572cb02bb0);
            self.angles = newangles;
            var_8b8b3cacb00298e4 = sign(var_c8d5fb1e79b42592);
        }
        wait(0.05);
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd8
// Size: 0x65
function function_63d1a11f8b22244(streakinfo, var_c09f3239d7caa490, destroyfunc) {
    params = spawnstruct();
    params.streakinfo = streakinfo;
    params.var_c09f3239d7caa490 = var_c09f3239d7caa490;
    params.destroyfunc = destroyfunc;
    callback::add("on_functional_death", &function_231d98d2a3c36c01, params);
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd44
// Size: 0xb7
function function_231d98d2a3c36c01(var_ba669c07247b5ab0, var_181408d182d25a1d) {
    streakinfo = var_181408d182d25a1d.streakinfo;
    var_c09f3239d7caa490 = var_181408d182d25a1d.var_c09f3239d7caa490;
    destroyfunc = var_181408d182d25a1d.destroyfunc;
    self endon("isCarried");
    self playsound("mp_equip_destroyed");
    if (isdefined(streakinfo)) {
        level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    }
    if (isdefined(var_c09f3239d7caa490)) {
        self [[ var_c09f3239d7caa490 ]](var_ba669c07247b5ab0);
    }
    function_2eff4cd94c3243e8();
    wait(0.2);
    if (isdefined(destroyfunc)) {
        self [[ destroyfunc ]]();
    } else if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe02
// Size: 0x49
function function_2eff4cd94c3243e8() {
    if (isdefined(self.minimapid)) {
        if (issharedfuncdefined("game", "returnObjectiveID")) {
            [[ getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe52
// Size: 0x154
function function_47b5394a301d8c5(var_a6cdc017c04a56de, var_bb3f35f040f4f38b, var_70a1d6b89907db6b, var_b0dfff7cb4b7be34) {
    level endon("game_ended");
    self endon("death");
    self.owner endon("disconnected");
    self endon("isCarried");
    if (!isdefined(self.lifetime)) {
        self.lifetime = var_a6cdc017c04a56de * 1000;
    }
    previoustime = gettime();
    while (self.lifetime > 0) {
        currenttime = gettime();
        timeelapsed = currenttime - previoustime;
        self.lifetime = self.lifetime - timeelapsed;
        previoustime = currenttime;
        /#
            var_34ce60611499d50e = getdvarint(var_bb3f35f040f4f38b);
            if (var_34ce60611499d50e > 0) {
                var_f09362cfe2d75614 = ter_op(isdefined(self.weapon_name), self.weapon_name, "outlineEnableForPlayer");
                print3d(self.origin, var_f09362cfe2d75614 + "outline" + self.lifetime + "<unknown string>", (0, 0, 1), 1, 0.5, 1);
            }
        #/
        waitframe();
    }
    if (isdefined(var_70a1d6b89907db6b)) {
        self [[ var_70a1d6b89907db6b ]](var_b0dfff7cb4b7be34);
    }
    callback::callback("on_functional_death");
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfad
// Size: 0x91
function function_708fc89de0e3cd1(direction, velocity) {
    self endon("death");
    self endon("timeout");
    level endon("game_ended");
    self.owner endon("disconnect");
    newposition = self.origin;
    previoustime = gettime();
    while (1) {
        deltatime = gettime() - previoustime;
        previoustime = gettime();
        newposition = newposition + direction * velocity * deltatime;
        self.origin = newposition;
        waitframe();
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1045
// Size: 0x14c
function function_888f3a0124b03ddc(newowner, var_39fdb770234e04a3, var_4430b08d5a2d47bf, var_aaa527f17d8f8387) {
    self.ishacked = 1;
    var_c0f9139ffd72e62d = self.owner;
    self.owner = newowner;
    self.team = newowner.team;
    self setentityowner(newowner);
    self setotherent(newowner);
    if (level.teambased) {
        self filteroutplayermarks(newowner.team);
    } else {
        self filteroutplayermarks(newowner);
    }
    if (issharedfuncdefined("challenges", "onHack")) {
        newowner [[ getsharedfunc("challenges", "onHack") ]](var_39fdb770234e04a3);
    }
    if (issharedfuncdefined("killstreak", "giveScoreForHack")) {
        newowner [[ getsharedfunc("killstreak", "giveScoreForHack") ]]();
    }
    if (isdefined(var_4430b08d5a2d47bf) && issharedfuncdefined("outline", "outlineEnableForPlayer")) {
        if (isdefined(self.streakname)) {
            priority = "killstreak";
        } else {
            priority = "equipment";
        }
        [[ getsharedfunc("outline", "outlineEnableForPlayer") ]](self, newowner, var_4430b08d5a2d47bf, priority);
    }
    if (isdefined(var_aaa527f17d8f8387)) {
        self [[ var_aaa527f17d8f8387 ]](newowner, var_c0f9139ffd72e62d);
    }
}

// Namespace namespace_8894a0caa4c34dc6/namespace_37987c2865e1a627
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1198
// Size: 0x14b
function function_36c55ae71072bd03(var_80745cf3e2877df5, var_809746f3e2ad954b, duration) {
    /#
        self notify("<unknown string>");
        level endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        drawcolor = (0, 255, 0);
        var_eb404bf9ac5040f0 = (var_809746f3e2ad954b[0] - var_80745cf3e2877df5[0], 0, 0);
        var_a6c378e90c169b15 = (0, var_809746f3e2ad954b[1] - var_80745cf3e2877df5[1], 0);
        var_5b9a5467ae4bf353 = (0, 0, var_809746f3e2ad954b[2] - var_80745cf3e2877df5[2]);
        line(var_80745cf3e2877df5, var_80745cf3e2877df5 + (var_809746f3e2ad954b - var_80745cf3e2877df5) / 2, drawcolor, 1, 0, duration);
        line(var_80745cf3e2877df5, var_80745cf3e2877df5 + var_eb404bf9ac5040f0, drawcolor, 1, 0, duration);
        line(var_80745cf3e2877df5, var_80745cf3e2877df5 + var_a6c378e90c169b15, drawcolor, 1, 0, duration);
        line(var_80745cf3e2877df5, var_80745cf3e2877df5 + var_5b9a5467ae4bf353, drawcolor, 1, 0, duration);
        sphere(var_80745cf3e2877df5, 5, drawcolor, 0, duration);
        drawcolor = (255, 0, 0);
        line(var_809746f3e2ad954b, var_809746f3e2ad954b + (var_80745cf3e2877df5 - var_809746f3e2ad954b) / 2, drawcolor, 1, 0, duration);
        line(var_809746f3e2ad954b, var_809746f3e2ad954b - var_eb404bf9ac5040f0, drawcolor, 1, 0, duration);
        line(var_809746f3e2ad954b, var_809746f3e2ad954b - var_a6c378e90c169b15, drawcolor, 1, 0, duration);
        line(var_809746f3e2ad954b, var_809746f3e2ad954b - var_5b9a5467ae4bf353, drawcolor, 1, 0, duration);
        sphere(var_809746f3e2ad954b, 5, drawcolor, 0, duration);
    #/
}

