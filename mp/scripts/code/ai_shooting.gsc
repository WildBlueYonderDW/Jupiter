#namespace ai_shooting;

// Namespace ai_shooting / scripts\code\ai_shooting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e
// Size: 0xbb
function decidenumshotsformg() {
    turret = undefined;
    if (isdefined(self.fngetusedturret)) {
        turret = [[ self.fngetusedturret ]]();
    }
    usingturret = isdefined(turret);
    if (usingturret && isdefined(turret.script_burst_min)) {
        bursttime = turret.script_burst_min;
    } else {
        bursttime = 0.5;
    }
    if (usingturret && isdefined(turret.script_burst_max)) {
        burstrange = turret.script_burst_max - bursttime;
    } else {
        burstrange = 1.5;
    }
    burst_length = bursttime + randomfloat(burstrange);
    return int(burst_length * 10);
}

// Namespace ai_shooting / scripts\code\ai_shooting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x152
// Size: 0x8d
function decidenumshotsforfull() {
    numshots = self.bulletsinclip;
    weapclass = weaponclass(self.weapon);
    if (weaponclass(self.weapon) == "mg") {
        choice = randomfloat(10);
        if (choice < 3) {
            numshots = randomintrange(2, 6);
        } else if (choice < 8) {
            numshots = randomintrange(6, 12);
        } else {
            numshots = randomintrange(12, 20);
        }
    }
    return numshots;
}

// Namespace ai_shooting / scripts\code\ai_shooting
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8
// Size: 0xb0
function decidenumshotsforburst(var_b22c497b24d57aca) {
    maxburst = 5;
    var_8ba699667e1a6d48 = weaponburstcount(self.weapon);
    if (var_8ba699667e1a6d48) {
        numshots = var_8ba699667e1a6d48;
    } else {
        numshots = reduceshotcountbydistance(maxburst, var_b22c497b24d57aca);
        numshots += randomintrange(-2, 3);
        numshots = int(max(numshots, 1));
    }
    if (numshots <= self.bulletsinclip) {
        return numshots;
    }
    assertex(self.bulletsinclip >= 0, self.bulletsinclip);
    if (self.bulletsinclip <= 0) {
        return 1;
    }
    return self.bulletsinclip;
}

// Namespace ai_shooting / scripts\code\ai_shooting
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0xd0
function reduceshotcountbydistance(var_ed80adb830bc0010, var_b22c497b24d57aca) {
    var_5e2b1cc3aba6d0ec = 62500;
    var_613a15adbe0efe37 = 810000;
    var_e9710b1cecb896f = 1562500;
    var_5646233813d9b9e6 = 2560000;
    alldistances = [var_5e2b1cc3aba6d0ec, var_613a15adbe0efe37, var_e9710b1cecb896f, var_5646233813d9b9e6];
    assert(var_ed80adb830bc0010 > alldistances.size);
    foreach (currentdistance in alldistances) {
        if (var_b22c497b24d57aca > currentdistance) {
            var_ed80adb830bc0010 -= 1;
        }
    }
    return var_ed80adb830bc0010;
}

