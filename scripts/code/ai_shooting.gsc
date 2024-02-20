// mwiii decomp prototype
#namespace namespace_4878c451191fd45d;

// Namespace namespace_4878c451191fd45d/namespace_c51004e268722bdc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b
// Size: 0xbf
function decidenumshotsformg() {
    turret = undefined;
    if (isdefined(self.fngetusedturret)) {
        turret = [[ self.fngetusedturret ]]();
    }
    usingturret = isdefined(turret);
    if (usingturret && isdefined(turret.script_burst_min)) {
        var_1ca111ff86819c24 = turret.script_burst_min;
    } else {
        var_1ca111ff86819c24 = 0.5;
    }
    if (usingturret && isdefined(turret.script_burst_max)) {
        var_bc2ef30947c2cbd2 = turret.script_burst_max - var_1ca111ff86819c24;
    } else {
        var_bc2ef30947c2cbd2 = 1.5;
    }
    var_f9cf7a09079abea = var_1ca111ff86819c24 + randomfloat(var_bc2ef30947c2cbd2);
    return int(var_f9cf7a09079abea * 10);
}

// Namespace namespace_4878c451191fd45d/namespace_c51004e268722bdc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132
// Size: 0x8f
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

// Namespace namespace_4878c451191fd45d/namespace_c51004e268722bdc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9
// Size: 0xb2
function decidenumshotsforburst(var_b22c497b24d57aca) {
    var_d2564e986c0ef171 = 5;
    var_8ba699667e1a6d48 = weaponburstcount(self.weapon);
    if (var_8ba699667e1a6d48) {
        numshots = var_8ba699667e1a6d48;
    } else {
        numshots = reduceshotcountbydistance(var_d2564e986c0ef171, var_b22c497b24d57aca);
        numshots = numshots + randomintrange(-2, 3);
        numshots = int(max(numshots, 1));
    }
    if (numshots <= self.bulletsinclip) {
        return numshots;
    }
    /#
        assertex(self.bulletsinclip >= 0, self.bulletsinclip);
    #/
    if (self.bulletsinclip <= 0) {
        return 1;
    }
    return self.bulletsinclip;
}

// Namespace namespace_4878c451191fd45d/namespace_c51004e268722bdc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x283
// Size: 0xd7
function reduceshotcountbydistance(var_ed80adb830bc0010, var_b22c497b24d57aca) {
    var_5e2b1cc3aba6d0ec = 62500;
    var_613a15adbe0efe37 = 810000;
    var_e9710b1cecb896f = 1562500;
    var_5646233813d9b9e6 = 2560000;
    var_7c6ca70421a9ff30 = [0:var_5e2b1cc3aba6d0ec, 1:var_613a15adbe0efe37, 2:var_e9710b1cecb896f, 3:var_5646233813d9b9e6];
    /#
        assert(var_ed80adb830bc0010 > var_7c6ca70421a9ff30.size);
    #/
    foreach (currentdistance in var_7c6ca70421a9ff30) {
        if (var_b22c497b24d57aca > currentdistance) {
            var_ed80adb830bc0010 = var_ed80adb830bc0010 - 1;
        }
    }
    return var_ed80adb830bc0010;
}

