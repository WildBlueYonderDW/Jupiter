#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\sp\utility.gsc;
#using script_53f4e6352b0b2425;
#using script_19163c4e4e504a5e;
#using script_6bf6c8e2e1fdccaa;

#namespace namespace_36ba977bda7331e2;

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x498
// Size: 0x8c
function private autoexec function_42d3854e7dc0f031() {
    namespace_53c50dd747d66443::snd_init();
    function_8b2208523132fa90();
    level.snd.callbacks["pitch_get"] = &function_13b5f294b0646f6b;
    level.snd.callbacks["pitch_set"] = &function_759fbcd2f53a978c;
    level.snd.callbacks["volume_get"] = &function_5f67e5f881178d39;
    level.snd.callbacks["volume_set"] = &function_dcdcd5efb87fc9b0;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x52c
// Size: 0x302
function private function_3a545679ff26019e(userdata) {
    player = level.player;
    now = gettime();
    if (isdefined(self.snd.submix3D.time) && self.snd.submix3D.time == now) {
        assert(isdefined(self.snd.submix3D.distanceattenuation));
        return self.snd.submix3D.distanceattenuation;
    }
    var_d5149e29e826569a = self.snd.submix3D.var_d5149e29e826569a;
    var_d5378829e84c6df0 = self.snd.submix3D.var_d5378829e84c6df0;
    var_11b23f3656c3caef = squared(var_d5149e29e826569a);
    var_44b7a85b7ea9caa1 = squared(var_d5378829e84c6df0);
    var_a1560db470f0d641 = self.snd.submix3D.var_a1560db470f0d641;
    playerorigin = player function_97f58d285dd23025();
    var_f2f367a2494f2c77 = distancesquared(self.origin, playerorigin);
    if (var_f2f367a2494f2c77 > var_44b7a85b7ea9caa1) {
        self.snd.submix3D.distanceattenuation = 0;
    } else if (var_f2f367a2494f2c77 <= var_11b23f3656c3caef) {
        self.snd.submix3D.distanceattenuation = 1;
    } else {
        var_a9190cf033e725f9 = var_44b7a85b7ea9caa1 - var_11b23f3656c3caef;
        distancefrac = 1 - (var_f2f367a2494f2c77 - var_11b23f3656c3caef) / var_a9190cf033e725f9;
        distanceattenuation = function_e6ef280f5472a1d2(distancefrac, var_a1560db470f0d641);
        self.snd.submix3D.distanceattenuation = distanceattenuation;
    }
    self.snd.submix3D.time = now;
    /#
        if (function_ec24f13736bfc421() > 0) {
            var_218e34a1d650f0c0 = self.origin;
            var_120536851fd5eb6 = level.snd.debug.var_2374fbb1ac1a1179;
            function_8c3fad58cbda089b(var_218e34a1d650f0c0 - (0, 0, 0 * var_120536851fd5eb6), "<dev string:x1c>" + self.snd.submix3D.distanceattenuation, (1, 1, 1), 1, var_120536851fd5eb6, 1);
        }
    #/
    return self.snd.submix3D.distanceattenuation;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x837
// Size: 0x210
function private function_c8fdb79316f72ed9(inputvalue, userdata) {
    player = userdata;
    foreach (var_5b097bde4417d7ad, var_15f09a6948319b43 in level.snd.var_a0d1075e5ea548cc) {
        assert(isdefined(var_5b097bde4417d7ad));
        var_99434a3c2f6fe2fa = 0;
        foreach (var_a97e1ee1445592c2 in var_15f09a6948319b43) {
            if (function_5b8457b9d8edb521(var_a97e1ee1445592c2)) {
                continue;
            }
            inputvalue = var_a97e1ee1445592c2 function_feb1a4f9eda07b44("submix3D");
            if (var_a97e1ee1445592c2.snd.submix3D.distanceattenuation > var_99434a3c2f6fe2fa) {
                var_99434a3c2f6fe2fa = var_a97e1ee1445592c2.snd.submix3D.distanceattenuation;
                if (isdefined(var_a97e1ee1445592c2.snd.submix3D.var_c73348459be85799)) {
                    var_99434a3c2f6fe2fa *= var_a97e1ee1445592c2.snd.submix3D.var_c73348459be85799;
                }
            }
        }
        if (var_99434a3c2f6fe2fa > 0) {
            if (isdefined(level.player.snd.submix3D[var_5b097bde4417d7ad]) == 0) {
                waitframe();
            }
            level.player.snd.submix3D[var_5b097bde4417d7ad] = var_99434a3c2f6fe2fa;
            continue;
        }
        if (isdefined(level.player.snd.submix3D[var_5b097bde4417d7ad])) {
            level.player.snd.submix3D[var_5b097bde4417d7ad] = undefined;
        }
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa4f
// Size: 0x2a8
function private function_f41485b4614e621a(userdata) {
    var_5b097bde4417d7ad = undefined;
    if (self != level.player) {
        var_5b097bde4417d7ad = self.snd.submix3D.var_5b097bde4417d7ad;
        if (isdefined(level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad])) {
            if (array_contains(level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad], self)) {
                level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad] = array_remove(level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad], self);
            }
        }
        self.snd.submix3D = undefined;
    }
    if (isdefined(var_5b097bde4417d7ad)) {
        if (isdefined(level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad])) {
            if (level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad].size == 0) {
                level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad] = undefined;
            }
        }
        if (isdefined(level.player.snd.submix3D)) {
            foreach (var_539356344751e13d in level.player.snd.submix3D) {
                if (var_5b097bde4417d7ad == var_7843efd22b675798 && isdefined(level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad]) == 0) {
                    level.player.snd.submix3D[var_5b097bde4417d7ad] = undefined;
                }
            }
        }
    }
    if (isdefined(level.player.snd.submix3D) && level.player.snd.submix3D.size == 0) {
        level.player.snd.submix3D = undefined;
        level.player function_96d11f9981c0fe4b("submix3D");
        if (isdefined(level.snd.var_a0d1075e5ea548cc) && level.snd.var_a0d1075e5ea548cc.size == 0) {
            assert(level.player function_db43aa8b88926353("submix3D") == 0);
            level.snd.var_a0d1075e5ea548cc = undefined;
        }
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xcff
// Size: 0x37d
function private function_ab906084b9213a8b(var_5b097bde4417d7ad, var_c73348459be85799, var_d5149e29e826569a, var_d5378829e84c6df0, var_a1560db470f0d641) {
    var_8566b0fa1d69298a = self;
    assertex(isdefined(var_8566b0fa1d69298a), "audio entity must be defined");
    assertex(isdefined(var_5b097bde4417d7ad), "submix must be defined");
    if (isdefined(var_c73348459be85799) == 0) {
        var_c73348459be85799 = 1;
    }
    if (isdefined(var_d5149e29e826569a) == 0 || isdefined(var_d5378829e84c6df0) == 0 || isdefined(var_a1560db470f0d641) == 0) {
        while (isdefined(var_8566b0fa1d69298a.soundalias) == 0) {
            waitframe();
        }
        if (function_5b8457b9d8edb521(var_8566b0fa1d69298a)) {
            return;
        }
        var_d5149e29e826569a = function_8a2af68cee25cdf7(var_8566b0fa1d69298a.soundalias, "dist_min");
        var_d5378829e84c6df0 = function_8a2af68cee25cdf7(var_8566b0fa1d69298a.soundalias, "dist_max");
        var_a1560db470f0d641 = function_8a2af68cee25cdf7(var_8566b0fa1d69298a.soundalias, "volumefalloffcurve");
        if (isdefined(var_a1560db470f0d641) == 0 || var_a1560db470f0d641 == "" || var_a1560db470f0d641 == "$default" || var_a1560db470f0d641 == "default") {
            var_a1560db470f0d641 = "default_vfcurve";
        }
    }
    if (function_110d3ab280057f5b(function_115055e88972de05(var_a1560db470f0d641) == 0, "submix3D curve '" + var_a1560db470f0d641 + "' not found! using linear.")) {
        var_a1560db470f0d641 = "linear";
    }
    var_ebc662a0caef9b36 = spawnstruct();
    var_ebc662a0caef9b36.var_d5149e29e826569a = var_d5149e29e826569a;
    var_ebc662a0caef9b36.var_d5378829e84c6df0 = var_d5378829e84c6df0;
    var_ebc662a0caef9b36.var_a1560db470f0d641 = var_a1560db470f0d641;
    var_ebc662a0caef9b36.var_5b097bde4417d7ad = var_5b097bde4417d7ad;
    var_ebc662a0caef9b36.var_c73348459be85799 = var_c73348459be85799;
    var_ebc662a0caef9b36.time = 0;
    function_b3e5599c9f6a8895(var_8566b0fa1d69298a);
    assertex(isstruct(var_8566b0fa1d69298a.snd));
    var_8566b0fa1d69298a.snd.submix3D = var_ebc662a0caef9b36;
    assertex(isstruct(level.snd), "snd was not initialized.");
    if (isdefined(level.snd.var_a0d1075e5ea548cc) == 0) {
        level.snd.var_a0d1075e5ea548cc = [];
    }
    if (isdefined(level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad]) == 0) {
        level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad] = [];
    }
    var_3706dc09aebe1148 = level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad].size;
    level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad][var_3706dc09aebe1148] = var_8566b0fa1d69298a;
    function_40ac4860117f2c0e("submix3D", undefined, &function_3a545679ff26019e, undefined, &function_f41485b4614e621a);
    if (level.player function_db43aa8b88926353("submix3D") == 0) {
        function_b3e5599c9f6a8895(level.player);
        assert(isstruct(level.player.snd));
        if (isdefined(level.player.snd.submix3D) == 0) {
            level.player.snd.submix3D = [];
        }
        assert(isarray(level.player.snd.submix3D));
        level.player function_40ac4860117f2c0e("submix3D", undefined, undefined, &function_c8fdb79316f72ed9, &function_f41485b4614e621a);
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1084
// Size: 0x38
function function_14757b69209c039a(var_5b097bde4417d7ad, var_c73348459be85799, var_d5149e29e826569a, var_d5378829e84c6df0, var_a1560db470f0d641) {
    thread function_ab906084b9213a8b(var_5b097bde4417d7ad, var_c73348459be85799, var_d5149e29e826569a, var_d5378829e84c6df0, var_a1560db470f0d641);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c4
// Size: 0xb9
function function_e2d87a63dd216b07() {
    var_8566b0fa1d69298a = undefined;
    var_5b097bde4417d7ad = undefined;
    if (isent(self) && isdefined(self.snd.submix3D) && isdefined(self.snd.submix3D.var_5b097bde4417d7ad)) {
        var_8566b0fa1d69298a = self;
        var_5b097bde4417d7ad = self.snd.submix3D.var_5b097bde4417d7ad;
    } else if (function_a3da201852146397()) {
        /#
            DevOp(0x94);
        #/
    }
    if (isdefined(var_5b097bde4417d7ad)) {
        if (isdefined(level.snd.var_a0d1075e5ea548cc[var_5b097bde4417d7ad])) {
            function_96d11f9981c0fe4b("submix3D");
        }
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1185
// Size: 0x1e
function function_c3751c463dc674a1(var_27094cc5a8d903a7, var_1d0c5d03b4da43d9) {
    level thread function_ea684ece7f0a1b98(var_27094cc5a8d903a7, var_1d0c5d03b4da43d9);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x11ab
// Size: 0x36e
function private function_ea684ece7f0a1b98(var_27094cc5a8d903a7, var_1d0c5d03b4da43d9, var_de85a4b265614a50) {
    /#
        var_7fde2c5dc6427879 = @"hash_455f5221de27673d";
        var_d350711d075718f1 = 0;
        isbuttonpressed = 0;
        var_29e7d623ff2eb804 = 0.8;
        setdevdvar(var_7fde2c5dc6427879, "<dev string:x24>" + var_29e7d623ff2eb804);
        if (isdefined(var_27094cc5a8d903a7) == 0) {
            var_27094cc5a8d903a7 = 0.1 * var_29e7d623ff2eb804;
        }
        if (isdefined(var_1d0c5d03b4da43d9) == 0) {
            var_1d0c5d03b4da43d9 = "<dev string:x25>";
        }
        if (isdefined(var_de85a4b265614a50) == 0) {
            var_de85a4b265614a50 = 500;
        }
        var_65b1dc0f2cd07f4f = var_29e7d623ff2eb804;
        var_993eee8301e14db1 = isbuttonpressed;
        var_7197e11400725fce = undefined;
        var_821ca1bed138b634 = 0;
        assert(isdefined(var_d350711d075718f1));
        assert(isdefined(var_29e7d623ff2eb804));
        assert(isdefined(var_27094cc5a8d903a7));
        assert(isdefined(var_65b1dc0f2cd07f4f));
        assert(isdefined(var_1d0c5d03b4da43d9));
        while (true) {
            volume = getdvarfloat(var_7fde2c5dc6427879);
            var_54faa24a906d6b9d = 0;
            isbuttonpressed = level.player buttonpressed(var_1d0c5d03b4da43d9);
            if (isbuttonpressed == 1 && var_993eee8301e14db1 == 0) {
                var_821ca1bed138b634 = gettime();
            } else if (isbuttonpressed == 0) {
                var_821ca1bed138b634 = 0;
            }
            if (isbuttonpressed == 1 && var_821ca1bed138b634 > 0) {
                var_f7ef816ae86f91f1 = gettime() - var_821ca1bed138b634;
                if (var_f7ef816ae86f91f1 >= var_de85a4b265614a50) {
                    var_54faa24a906d6b9d = 1;
                    var_821ca1bed138b634 = 0;
                }
            }
            if (var_54faa24a906d6b9d == 1) {
                var_d350711d075718f1 = !var_d350711d075718f1;
                switch (var_d350711d075718f1) {
                case 0:
                default:
                    setdevdvar(var_7fde2c5dc6427879, "<dev string:x24>" + var_29e7d623ff2eb804);
                    break;
                case 1:
                    setdevdvar(var_7fde2c5dc6427879, "<dev string:x24>" + var_27094cc5a8d903a7);
                    break;
                }
            }
            if (var_d350711d075718f1 == 1 && isdefined(var_7197e11400725fce) == 0) {
                color = (1, 0.623529, 0.498039);
                alpha = 0.333;
                fontscale = 2;
                x = 0;
                y = -64 * fontscale;
                var_ec4e1daf730eb980 = "<dev string:x2f>" + var_1d0c5d03b4da43d9 + "<dev string:x46>";
                var_7197e11400725fce = newhudelem();
                var_7197e11400725fce.x = x;
                var_7197e11400725fce.y = y;
                var_7197e11400725fce.alignx = "<dev string:x52>";
                var_7197e11400725fce.aligny = "<dev string:x59>";
                var_7197e11400725fce.horzalign = "<dev string:x52>";
                var_7197e11400725fce.vertalign = "<dev string:x60>";
                var_7197e11400725fce.alpha = alpha;
                var_7197e11400725fce.color = color;
                var_7197e11400725fce.sort = 2;
                var_7197e11400725fce.font = "<dev string:x67>";
                var_7197e11400725fce.fontscale = fontscale;
                var_7197e11400725fce.shadowed = 1;
                var_7197e11400725fce.foreground = 1;
                var_7197e11400725fce.label = var_ec4e1daf730eb980;
            } else if (var_d350711d075718f1 == 0 && isdefined(var_7197e11400725fce)) {
                var_7197e11400725fce destroy();
                var_7197e11400725fce = undefined;
            }
            var_65b1dc0f2cd07f4f = var_29e7d623ff2eb804;
            var_993eee8301e14db1 = isbuttonpressed;
            waitframe();
        }
    #/
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1521
// Size: 0x45
function function_1c545fdb7a03d965(var_5b097bde4417d7ad, attack, hold, release, var_cd5374c65761a5f6, scale) {
    if (isdefined(var_cd5374c65761a5f6) && var_cd5374c65761a5f6 > 0) {
        wait var_cd5374c65761a5f6;
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x156e
// Size: 0x130
function function_1c5079db7a001cbc(var_5b097bde4417d7ad, attack, hold, release, var_cd5374c65761a5f6, dist_min, dist_max, var_d38fe48e30b1ff09, var_359a428890610795) {
    if (!isdefined(var_d38fe48e30b1ff09) && isdefined(self) && isdefined(self.origin)) {
        var_d38fe48e30b1ff09 = self.origin;
    }
    if (!isdefined(var_359a428890610795)) {
        var_359a428890610795 = level.player.origin;
    }
    assertex(isdefined(var_d38fe48e30b1ff09), "no origin specified and no calling ent to derive origin from, you fool!");
    var_cd5374c65761a5f6 = default_to(var_cd5374c65761a5f6, 0);
    dist_min = default_to(dist_min, 500);
    dist_max = default_to(dist_max, 1000);
    var_892b4b802cb0b6af = squared(dist_min);
    var_4311b4affc690a61 = squared(dist_max);
    dist_sq = distancesquared(var_359a428890610795, var_d38fe48e30b1ff09);
    if (dist_sq > var_4311b4affc690a61) {
        return;
    }
    scale = function_4297a4ed38531b7f(dist_sq, var_892b4b802cb0b6af, var_4311b4affc690a61, 0, 0.3);
    wait var_cd5374c65761a5f6;
    if (hold == 0) {
        hold += 0.05;
    }
    wait attack + hold;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16a6
// Size: 0x26
function function_a74657bc602790a2(range, view, scale) {
    thread function_f2e7631ed6ec286d(range, view, scale);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x16d4
// Size: 0x11c
function private function_f2e7631ed6ec286d(range, view, scale) {
    self endon("stop_looking_sounds");
    level endon("stop_all_looking_sounds");
    self endon("death");
    if (!isdefined(range)) {
        range = 1000;
    }
    if (!isdefined(view)) {
        view = cos(90);
    } else {
        view = cos(view);
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    time = 0.05;
    while (true) {
        wait time;
        start_origin = level.player geteye();
        start_angles = level.player getplayerangles();
        end_origin = self.origin;
        normal = vectornormalize(end_origin - start_origin);
        forward = anglestoforward(start_angles);
        vol = vectordot(forward, normal);
        vol = function_4297a4ed38531b7f(vol, 0, 1, 1 - scale, 1);
        if (vol >= view) {
            function_dcdcd5efb87fc9b0(self, vol, time);
        }
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17f8
// Size: 0x2f
function function_a3a7cbb72317099b(alias, position, range, view) {
    thread function_2e897c93d360feb0(alias, position, range, view);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x182f
// Size: 0xd8
function private function_2e897c93d360feb0(alias, position, range, view) {
    self endon("stop_looking_sounds");
    level endon("stop_all_looking_sounds");
    var_92c8e5a6d23d9243 = squared(default_to(range, 1000));
    view = cos(default_to(view, 45));
    time = 0.1;
    while (true) {
        dist_sq = distancesquared(position, level.player.origin);
        if (dist_sq <= var_92c8e5a6d23d9243) {
            if (within_fov(level.player function_97f58d285dd23025(), level.player function_d8b4c23126bf4d7b(), position, view)) {
                break;
            }
        }
        wait time;
    }
    snd_play(alias, position);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190f
// Size: 0x3f2
function function_8b2208523132fa90() {
    assertex(isstruct(level.snd), "snd was not initialized.");
    if (!isdefined(level.snd.var_81b664ea82102a8e)) {
        level.snd.var_81b664ea82102a8e = [];
        level.snd.var_81b664ea82102a8e["linear_up"] = [0, 0.02, 0.045, 0.065, 0.09, 0.11, 0.135, 0.155, 0.18, 0.2];
        level.snd.var_81b664ea82102a8e["linear_down"] = [0.2, 0.18, 0.155, 0.135, 0.11, 0.09, 0.065, 0.045, 0.02, 0];
        level.snd.var_81b664ea82102a8e["exponential_slow_up"] = [0, 0.01, 0.019, 0.03, 0.049, 0.068, 0.102, 0.15, 0.229, 0.343];
        level.snd.var_81b664ea82102a8e["exponential_fast_down"] = [0.343, 0.229, 0.15, 0.102, 0.068, 0.049, 0.03, 0.019, 0.01, 0];
        level.snd.var_81b664ea82102a8e["exponential_fast_up"] = [0, 0.051, 0.077, 0.094, 0.108, 0.118, 0.127, 0.135, 0.142, 0.148];
        level.snd.var_81b664ea82102a8e["exponential_slow_down"] = [0.148, 0.142, 0.135, 0.127, 0.118, 0.108, 0.094, 0.077, 0.051, 0];
        level.snd.var_81b664ea82102a8e["bell"] = [0.003, 0.017, 0.057, 0.14, 0.283, 0.283, 0.14, 0.057, 0.017, 0.003];
        level.snd.var_81b664ea82102a8e["inverted_bell"] = [0.283, 0.14, 0.057, 0.017, 0.003, 0.003, 0.017, 0.057, 0.14, 0.283];
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d09
// Size: 0x91
function function_ff2551404bb53223(time_min, time_max, var_698b3c8945e7d652) {
    values = [];
    values[0] = time_min;
    var_f1d815fca5ec80b = level.snd.var_81b664ea82102a8e[var_698b3c8945e7d652].size;
    step = (time_max - time_min) / (var_f1d815fca5ec80b - 1);
    for (i = 1; i < var_f1d815fca5ec80b - 1; i++) {
        values[i] = values[i - 1] + step;
    }
    values[values.size] = time_max;
    return values;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1da3
// Size: 0x89
function function_58b4be4667013c74(w, amount) {
    a = [];
    var_e8f0e2d93cf9aa13 = 1 / w.size;
    for (i = 0; i < w.size; i++) {
        diff = var_e8f0e2d93cf9aa13 - w[i];
        offset = (1 - amount) * abs(diff);
        if (diff < 0) {
            offset *= -1;
        }
        a[i] = w[i] + offset;
    }
    return a;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e35
// Size: 0x7f
function function_3a936ade9c53e549(w, v) {
    var_f1d815fca5ec80b = w.size;
    r = randomfloat(1);
    total = 0;
    var_f88a0101fa350332 = v[v.size - 1];
    for (i = 0; i < var_f1d815fca5ec80b; i++) {
        total += w[i];
        if (r < total) {
            var_f88a0101fa350332 = v[i];
            break;
        }
    }
    return var_f88a0101fa350332;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebd
// Size: 0x72
function function_d3101e7a53711d56(w) {
    var_f1d815fca5ec80b = w.size;
    r = randomfloat(1);
    total = 0;
    var_f88a0101fa350332 = w.size - 1;
    for (i = 0; i < var_f1d815fca5ec80b; i++) {
        total += w[i];
        if (r < total) {
            var_f88a0101fa350332 = i;
            break;
        }
    }
    return var_f88a0101fa350332;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f38
// Size: 0xc1
function function_5b6b7f0f5b844a7b(min, max, var_698b3c8945e7d652) {
    if (isdefined(var_698b3c8945e7d652)) {
        weights = level.snd.var_81b664ea82102a8e[var_698b3c8945e7d652];
        if (isdefined(weights)) {
            values = function_ff2551404bb53223(min, max, var_698b3c8945e7d652);
            var_897cfe4e3b31708 = function_d3101e7a53711d56(weights);
            var_59e77cda18e84ceb = 0;
            var_81782b4737f8801 = values.size - 1;
            if (var_897cfe4e3b31708 == 0) {
                var_81782b4737f8801 = 1;
            } else if (var_897cfe4e3b31708 == values.size - 1) {
                var_59e77cda18e84ceb = var_81782b4737f8801 - 1;
            } else {
                var_59e77cda18e84ceb = var_897cfe4e3b31708 - 1;
                var_81782b4737f8801 = var_897cfe4e3b31708 + 1;
            }
            return randomfloatrange(values[var_59e77cda18e84ceb], values[var_81782b4737f8801]);
        }
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2001
// Size: 0x1e5
function function_b169f8a1fceab946(min, max, label, width) {
    width = default_to(width, 0);
    label = default_to(label, "shared_default");
    assertex(isstruct(level.snd), "snd was not initialized.");
    if (!isdefined(level.snd.var_9b325e939c3b24db)) {
        level.snd.var_9b325e939c3b24db = spawnstruct();
        level.snd.var_9b325e939c3b24db.label = 0;
    }
    width = clamp(width, 0, 1);
    width *= 5;
    width = math::round_float(width, 1);
    iteration = 0;
    for (i = 0; i < width; i++) {
        iteration += randomfloatrange(min, max);
    }
    x = iteration / width;
    if (x > max * 0.5) {
        x -= max;
    }
    x += max * 0.5;
    previous = level.snd.var_9b325e939c3b24db.label;
    range = max - min;
    mid = range * 0.5;
    if (abs(previous - x) < range * 0.2) {
        x = function_4297a4ed38531b7f(x, min, max, max - randomfloatrange(0, range * 0.35), min + randomfloatrange(0, range * 0.35));
        x = clamp(x, min, max);
    }
    level.snd.var_9b325e939c3b24db.label = x;
    return x;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x21ef
// Size: 0x6f
function private function_b1dd3bbeb1ad7384(alias, var_5b097bde4417d7ad, attack, hold, release, scale) {
    self endon("death");
    self endon("abort_" + alias);
    while (true) {
        self waittill("anim dialogue", var_a5145a04d172d704);
        if (isdefined(var_a5145a04d172d704) && var_a5145a04d172d704 == alias) {
            break;
        }
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2266
// Size: 0x2d5
function function_4c14bc367fc3a09(alias, var_5b097bde4417d7ad, scale, attack, release, radio) {
    ent = self;
    var_5de261c412fd939b = 1;
    var_5b097bde4417d7ad = default_to(var_5b097bde4417d7ad, "critical_dialogue");
    scale = default_to(scale, 0.5);
    assertex(scale >= 0 && scale <= 1, "scale must be between 0.0 and 1.0");
    attack = default_to(attack, 0.5 * scale);
    release = default_to(release, 1 * scale);
    radio = default_to(radio, 0);
    if (radio == 1) {
        ent = level.player;
    }
    if (soundexists(alias) == 0) {
        /#
            var_2053d52d919274fd = "<dev string:x71>" + alias + "<dev string:x79>";
            function_265429989bce8de3(var_2053d52d919274fd);
        #/
        var_5de261c412fd939b = 0;
        return;
    }
    var_eeab7683afed262a = function_8a2af68cee25cdf7(alias, "vol_mod");
    if (function_110d3ab280057f5b(var_eeab7683afed262a != "dialog_critical", "alias '" + alias + "' volmod not 'dialog_critical' ('" + var_eeab7683afed262a + "')")) {
        var_5de261c412fd939b = 0;
    }
    var_cac5f1ddb7d691f8 = lookupsoundlength(alias);
    hold = var_cac5f1ddb7d691f8 - attack - release;
    if (hold < 0) {
        hold = 0;
    }
    if (function_110d3ab280057f5b(var_cac5f1ddb7d691f8 <= 0, "alias '" + alias + "' length " + var_cac5f1ddb7d691f8 + " too short to envelope")) {
        var_5de261c412fd939b = 0;
    }
    if (var_5de261c412fd939b == 1) {
        var_e05aeab5341d4573 = function_8a2af68cee25cdf7(alias, "dist_min");
        var_e07e00b53443bd8d = function_8a2af68cee25cdf7(alias, "dist_max");
        thresh = var_e07e00b53443bd8d * 0.5;
        var_a10a4080b15de80c = squared(thresh);
        dist_sq = 0;
        if (isdefined(ent) && isdefined(ent.origin) && radio == 0) {
            dist_sq = distancesquared(ent.origin, level.player.origin);
        }
        if (dist_sq > var_a10a4080b15de80c) {
            var_5de261c412fd939b = 0;
            /#
                if (function_ec24f13736bfc421() > 0) {
                    function_265429989bce8de3("<dev string:x8b>" + alias + "<dev string:x9f>" + sqrt(dist_sq) / 12 + "<dev string:xa2>");
                }
            #/
        } else {
            ent thread function_b1dd3bbeb1ad7384(alias, var_5b097bde4417d7ad, attack, hold, release, scale);
        }
    }
    if (ent == level.player || radio == 1) {
        ent smart_radio_dialogue(alias);
        return;
    }
    ent smart_dialogue(alias);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2543
// Size: 0xee
function private function_6f015404fd952b0b(var_972270fb4a04f3bf) {
    function_b3e5599c9f6a8895(var_972270fb4a04f3bf);
    assert(isstruct(var_972270fb4a04f3bf.snd));
    if (isdefined(var_972270fb4a04f3bf) && function_5b8457b9d8edb521(var_972270fb4a04f3bf) == 0 && isdefined(var_972270fb4a04f3bf.snd.scale) == 0) {
        var_972270fb4a04f3bf.snd.scale = spawnstruct();
        var_972270fb4a04f3bf.snd.scale.volume = 1;
        var_972270fb4a04f3bf.snd.scale.pitch = 1;
        var_972270fb4a04f3bf.snd.scale.threads = [];
        function_8ee338ebe8c076cc(var_972270fb4a04f3bf, function_e448203aedcadcf8());
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2639
// Size: 0x24
function private function_39e69965841fa467(sound, volume, time) {
    sound scalevolume(volume, time);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2665
// Size: 0x24
function private function_394f85a9b323c069(sound, volume, time) {
    sound scalepitch(volume, time);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2691
// Size: 0xb3
function private function_bb64367b01278da4(var_972270fb4a04f3bf, value, var_c7faf48c31b0f2c7) {
    if (function_5b8457b9d8edb521(var_972270fb4a04f3bf) || isdefined(var_972270fb4a04f3bf) == 0) {
        return;
    }
    function_6f015404fd952b0b(var_972270fb4a04f3bf);
    assert(isdefined(var_972270fb4a04f3bf.snd.scale));
    if (isdefined(var_c7faf48c31b0f2c7)) {
        if (var_c7faf48c31b0f2c7 == &function_39e69965841fa467) {
            var_972270fb4a04f3bf.snd.scale.volume = value;
            return;
        }
        if (var_c7faf48c31b0f2c7 == &function_394f85a9b323c069) {
            var_972270fb4a04f3bf.snd.scale.pitch = value;
        }
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x274c
// Size: 0xa3
function private function_284e6d4e6de04c70(var_972270fb4a04f3bf, var_c7faf48c31b0f2c7) {
    assert(isdefined(var_972270fb4a04f3bf));
    if (isstruct(var_972270fb4a04f3bf.snd) && isdefined(var_972270fb4a04f3bf.snd.scale)) {
        if (var_c7faf48c31b0f2c7 == &function_39e69965841fa467) {
            return var_972270fb4a04f3bf.snd.scale.volume;
        } else if (var_c7faf48c31b0f2c7 == &function_394f85a9b323c069) {
            return var_972270fb4a04f3bf.snd.scale.pitch;
        }
    }
    return undefined;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x27f8
// Size: 0x137
function private function_8ed5f37dfe5595a(var_c7faf48c31b0f2c7) {
    var_836b23c9f9e0f7aa = 0;
    var_35ca8163a94b8e78 = undefined;
    self endon("death");
    self waittill("snd_scale_completed");
    assertex(isdefined(var_c7faf48c31b0f2c7), "scale completed with unknown scaleFunc");
    if (var_c7faf48c31b0f2c7 == &function_39e69965841fa467) {
        self.snd.scale.var_8ef6ac3969a6c990 = undefined;
        var_35ca8163a94b8e78 = "volume";
    }
    if (var_c7faf48c31b0f2c7 == &function_394f85a9b323c069) {
        self.snd.scale.var_2f60e0a3d98be6ec = undefined;
        var_35ca8163a94b8e78 = "pitch";
    }
    assert(isdefined(var_35ca8163a94b8e78));
    self.snd.scale.threads[var_35ca8163a94b8e78] = undefined;
    if (isdefined(self.snd.scale.var_8ef6ac3969a6c990) == 0 && isdefined(self.snd.scale.var_2f60e0a3d98be6ec) == 0) {
        self.snd.scale.var_17a09e00c9c8e3ee = undefined;
    }
    self notify("snd_stop_scale_" + var_35ca8163a94b8e78);
    waittillframeend();
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2937
// Size: 0x4f3
function private function_9d9326a28f4ae880(curve, scale, time, var_c7faf48c31b0f2c7, callbackfunc) {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515") == 1) {
            return;
        }
    #/
    self endon("disconnect");
    self endon("deleted");
    self endon("death");
    assert(isdefined(self.snd.scale));
    assert(isdefined(self.snd.scale.threads));
    assert(isdefined(var_c7faf48c31b0f2c7));
    assert(time > 0);
    var_49c7c946bc774fcd = function_f17e814008bf23a4(curve);
    assertex(var_49c7c946bc774fcd > 0, "");
    frametime = float(function_e448203aedcadcf8());
    timeremainder = float(time) % frametime;
    time = float(time) + frametime - timeremainder;
    timeinterval = float(time) / float(var_49c7c946bc774fcd);
    var_1bab9a5dcb8b8cc4 = timeinterval % frametime;
    timeinterval = timeinterval + frametime - var_1bab9a5dcb8b8cc4;
    timeinterval = max(timeinterval, frametime);
    var_a99a7c1f162492e5 = int(timeinterval * 1000 + 0.5);
    timems = int(time * 1000 + 0.5);
    var_533d6b6dea3ed270 = int(0);
    if (isdefined(self.snd.scale.var_17a09e00c9c8e3ee)) {
        var_3f04bb8f81987348 = 0;
        if (isdefined(self.snd.scale.var_8ef6ac3969a6c990) && var_c7faf48c31b0f2c7 == &function_39e69965841fa467 || isdefined(self.snd.scale.var_2f60e0a3d98be6ec) && var_c7faf48c31b0f2c7 == &function_394f85a9b323c069) {
            var_3f04bb8f81987348 = 1;
        }
        if (var_3f04bb8f81987348 == 1) {
            self notify("snd_scale_completed", var_c7faf48c31b0f2c7);
            waittillframeend();
            self notify("snd_scale_interrupted", var_c7faf48c31b0f2c7);
        }
    }
    var_a24caba4adfb2b3f = function_284e6d4e6de04c70(self, var_c7faf48c31b0f2c7);
    var_1e6f4eaad2a0bd46 = 0;
    if (var_a24caba4adfb2b3f > scale) {
        var_1e6f4eaad2a0bd46 = 1;
    }
    while (isdefined(self.soundalias) == 0) {
        waitframe();
    }
    waittillframeend();
    thread function_8ed5f37dfe5595a(var_c7faf48c31b0f2c7);
    self.snd.scale.var_17a09e00c9c8e3ee = 1;
    var_35ca8163a94b8e78 = undefined;
    if (var_c7faf48c31b0f2c7 == &function_39e69965841fa467) {
        self.snd.scale.var_8ef6ac3969a6c990 = 1;
        var_35ca8163a94b8e78 = "volume";
    }
    if (var_c7faf48c31b0f2c7 == &function_394f85a9b323c069) {
        self.snd.scale.var_2f60e0a3d98be6ec = 1;
        var_35ca8163a94b8e78 = "pitch";
    }
    assert(isdefined(var_35ca8163a94b8e78));
    self.snd.scale.threads[var_35ca8163a94b8e78] = getthread();
    self endon("snd_stop_scale_" + var_35ca8163a94b8e78);
    while (var_533d6b6dea3ed270 < timems && isdefined(self) && isdefined(self.snd.scale.threads[var_35ca8163a94b8e78])) {
        remainingtime = (timems - var_533d6b6dea3ed270) * 0.001;
        if (isdefined(self.snd.scale.waitinterval)) {
            timeinterval = max(self.snd.scale.waitinterval, frametime);
        }
        waittime = min(timeinterval, remainingtime);
        var_533d6b6dea3ed270 += int(waittime * 1000 + 0.5);
        timefrac = float(var_533d6b6dea3ed270) / float(timems);
        scalevalue = 1;
        if (var_1e6f4eaad2a0bd46 > 0) {
            timefrac = clamp(1 - timefrac, 0, 1);
            var_c756d3e56cd7df51 = function_e6ef280f5472a1d2(timefrac, curve);
            scalevalue = math::lerp(scale, var_a24caba4adfb2b3f, var_c756d3e56cd7df51);
        } else {
            var_c756d3e56cd7df51 = function_e6ef280f5472a1d2(timefrac, curve);
            scalevalue = math::lerp(var_a24caba4adfb2b3f, scale, var_c756d3e56cd7df51);
        }
        /#
        #/
        [[ var_c7faf48c31b0f2c7 ]](self, scalevalue, waittime);
        wait waittime;
        if (isdefined(self) && function_5b8457b9d8edb521(self) == 0) {
            function_bb64367b01278da4(self, scalevalue, var_c7faf48c31b0f2c7);
        }
    }
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self)) {
        self notify("snd_scale_completed", var_c7faf48c31b0f2c7);
    }
    if (isdefined(callbackfunc)) {
        self [[ callbackfunc ]]();
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e32
// Size: 0x71
function function_8ee338ebe8c076cc(var_972270fb4a04f3bf, waitinterval) {
    assert(isdefined(var_972270fb4a04f3bf));
    function_6f015404fd952b0b(var_972270fb4a04f3bf);
    assert(isdefined(var_972270fb4a04f3bf.snd.scale));
    var_972270fb4a04f3bf.snd.scale.waitinterval = max(waitinterval, function_e448203aedcadcf8());
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2eab
// Size: 0x1f3
function function_cef5741dc65820e5(var_972270fb4a04f3bf, var_2bb337ebf390382f, value, time, curve, callbackfunc) {
    if (function_110d3ab280057f5b(isdefined(var_972270fb4a04f3bf) == 0, "snd_scale: called on undefined entity")) {
        return;
    }
    if (function_110d3ab280057f5b(function_5b8457b9d8edb521(var_972270fb4a04f3bf), "snd_scale: called on removed entity")) {
        return;
    }
    assertex(isdefined(var_972270fb4a04f3bf), "snd_scale: called on undefined entity");
    assertex(function_5b8457b9d8edb521(var_972270fb4a04f3bf) == 0, "snd_scale: called on removed entity");
    assert(isdefined(value));
    function_6f015404fd952b0b(var_972270fb4a04f3bf);
    var_a36b81f450d2c3ae = value;
    var_c7faf48c31b0f2c7 = undefined;
    var_35ca8163a94b8e78 = undefined;
    switch (var_2bb337ebf390382f) {
    case #"hash_5c14048f84c6fdef":
        curve = default_to(curve, "easeout");
        var_c7faf48c31b0f2c7 = &function_39e69965841fa467;
        var_35ca8163a94b8e78 = "volume";
        var_a36b81f450d2c3ae = clamp(value, 0, 4);
        function_110d3ab280057f5b(value != var_a36b81f450d2c3ae, "snd_scale: clamped volume " + value + " -> " + var_a36b81f450d2c3ae);
        break;
    case #"hash_d7a0f5b3b8320991":
        curve = default_to(curve, "linear");
        var_c7faf48c31b0f2c7 = &function_394f85a9b323c069;
        var_35ca8163a94b8e78 = "pitch";
        var_a36b81f450d2c3ae = clamp(value, 0.00390625, 2);
        function_110d3ab280057f5b(value != var_a36b81f450d2c3ae, "snd_scale: clamped pitch " + value + " -> " + var_a36b81f450d2c3ae);
        break;
    }
    assert(isdefined(var_972270fb4a04f3bf));
    if (isdefined(time) == 0 || time == 0) {
        [[ var_c7faf48c31b0f2c7 ]](var_972270fb4a04f3bf, var_a36b81f450d2c3ae, 0);
        function_bb64367b01278da4(var_972270fb4a04f3bf, var_a36b81f450d2c3ae, var_c7faf48c31b0f2c7);
        var_972270fb4a04f3bf notify("snd_scale_completed", var_c7faf48c31b0f2c7);
        var_972270fb4a04f3bf notify("snd_scale_interrupted");
        var_972270fb4a04f3bf notify("snd_stop_scale_" + var_35ca8163a94b8e78);
        return;
    }
    var_972270fb4a04f3bf thread function_9d9326a28f4ae880(curve, var_a36b81f450d2c3ae, time, var_c7faf48c31b0f2c7, callbackfunc);
    if (var_c7faf48c31b0f2c7 == &function_39e69965841fa467) {
        var_972270fb4a04f3bf notify("stopfade");
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x30a6
// Size: 0x3c
function function_dcdcd5efb87fc9b0(var_972270fb4a04f3bf, volume, time, curve, callbackfunc) {
    function_cef5741dc65820e5(var_972270fb4a04f3bf, "volume", volume, time, curve, callbackfunc);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x30ea
// Size: 0x3c
function function_759fbcd2f53a978c(var_972270fb4a04f3bf, pitch, time, curve, callbackfunc) {
    function_cef5741dc65820e5(var_972270fb4a04f3bf, "pitch", pitch, time, curve, callbackfunc);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x312e
// Size: 0x55
function function_5f67e5f881178d39(var_972270fb4a04f3bf) {
    if (function_110d3ab280057f5b(isdefined(var_972270fb4a04f3bf) == 0, "snd_scale: called on undefined entity")) {
        return 0;
    }
    if (function_110d3ab280057f5b(function_5b8457b9d8edb521(var_972270fb4a04f3bf), "snd_scale: called on removed entity")) {
        return 0;
    }
    assert(isdefined(var_972270fb4a04f3bf));
    return function_284e6d4e6de04c70(var_972270fb4a04f3bf, &function_39e69965841fa467);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x318c
// Size: 0x55
function function_13b5f294b0646f6b(var_972270fb4a04f3bf) {
    if (function_110d3ab280057f5b(isdefined(var_972270fb4a04f3bf) == 0, "snd_scale: called on undefined entity")) {
        return 0;
    }
    if (function_110d3ab280057f5b(function_5b8457b9d8edb521(var_972270fb4a04f3bf), "snd_scale: called on removed entity")) {
        return 0;
    }
    assert(isdefined(var_972270fb4a04f3bf));
    return function_284e6d4e6de04c70(var_972270fb4a04f3bf, &function_394f85a9b323c069);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x31ea
// Size: 0x83
function private function_fe3baea2918dede2() {
    assert(isdefined(self));
    if (isdefined(self.snd.timer)) {
        self waittill("snd_stop_audioTimer");
        if (isdefined(self.snd.timer.soundent)) {
            self.snd.timer.soundent delete();
        }
        self.snd.timer = undefined;
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x3275
// Size: 0x2a8
function private function_1d2a474fd292fcf4(totaltime, var_7d6842cd4bc7444, var_907968120f59a1c2, var_3b955167192ad3d4, var_3ba65767193ceb62, var_e40094849aabcb2c, endcallback) {
    assert(isdefined(self));
    assert(isdefined(self.snd.timer));
    assert(isdefined(var_7d6842cd4bc7444));
    if (isdefined(var_907968120f59a1c2) == 0) {
        var_907968120f59a1c2 = var_7d6842cd4bc7444;
    }
    if (isdefined(var_3b955167192ad3d4) == 0) {
        var_3b955167192ad3d4 = 1;
    }
    if (isdefined(var_3ba65767193ceb62) == 0) {
        var_3ba65767193ceb62 = 1;
    }
    if (isdefined(var_e40094849aabcb2c) == 0) {
        var_e40094849aabcb2c = "linear";
    }
    thread function_fe3baea2918dede2();
    self endon("snd_stop_audioTimer");
    while (gettime() <= self.snd.timer.endtime) {
        now = gettime();
        remainingtime = self.snd.timer.endtime - now;
        var_aa021adf31583726 = 1000;
        if (remainingtime <= 5000) {
            var_aa021adf31583726 = 500;
        }
        if (remainingtime <= 3000) {
            var_aa021adf31583726 = 250;
        }
        if (remainingtime <= 1000) {
            var_aa021adf31583726 = 50;
        }
        var_671d21bb106c757a = remainingtime - var_aa021adf31583726;
        var_d2038b1c6bb074be = var_671d21bb106c757a % var_aa021adf31583726;
        var_671d21bb106c757a = var_671d21bb106c757a + var_aa021adf31583726 - var_d2038b1c6bb074be;
        if (remainingtime <= var_671d21bb106c757a) {
            if (self.snd.timer.var_9aeb4e615c122aca != 0) {
                self.snd.timer.soundent playsound(var_7d6842cd4bc7444);
                self.snd.timer.var_9aeb4e615c122aca = 0;
            } else {
                self.snd.timer.soundent playsound(var_907968120f59a1c2);
                self.snd.timer.var_9aeb4e615c122aca = 1;
            }
            assert(isdefined(self.snd.timer.soundent));
            var_e16794403bd57ec = function_4297a4ed38531b7f(remainingtime, 0, totaltime, var_3ba65767193ceb62, var_3b955167192ad3d4);
            self.snd.timer.soundent function_759fbcd2f53a978c(var_e16794403bd57ec, 0.05, var_e40094849aabcb2c);
            /#
            #/
        }
        waitframe();
    }
    if (isdefined(endcallback)) {
        self [[ endcallback ]]();
    }
    self notify("snd_stop_audioTimer");
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3525
// Size: 0x21
function function_e303cfbf5b4ae3cb() {
    if (isdefined(self.snd.timer)) {
        self notify("snd_stop_audioTimer");
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x354e
// Size: 0x17f
function function_d325cdb8e270288e(totaltime, var_7d6842cd4bc7444, var_907968120f59a1c2, var_20c9919db9a9aa32, var_3b955167192ad3d4, var_3ba65767193ceb62, var_e40094849aabcb2c, endcallback) {
    assert(isdefined(self));
    assert(isdefined(var_7d6842cd4bc7444));
    if (isdefined(self.snd.timer)) {
        function_e303cfbf5b4ae3cb();
    }
    starttime = gettime();
    totaltime = int(totaltime * 1000 + 0.5);
    function_b3e5599c9f6a8895(self);
    if (isdefined(self.snd.timer) == 0) {
        self.snd.timer = spawnstruct();
        self.snd.timer.endtime = starttime + totaltime;
        self.snd.timer.var_9aeb4e615c122aca = 0;
        self.snd.timer.soundent = spawn("script_origin", self.origin);
        self.snd.timer.soundent linkto(self);
    }
    thread function_1d2a474fd292fcf4(totaltime, var_7d6842cd4bc7444, var_907968120f59a1c2, var_3b955167192ad3d4, var_3ba65767193ceb62, var_e40094849aabcb2c, endcallback);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x36d5
// Size: 0x1e6
function private function_25cd589593729f1(var_c1cc78e068001d23) {
    level endon("radioConvoStop");
    var_b609fc03c4b98503 = [];
    var_4ef7f927f8917d38 = [];
    assertex(isstruct(level.snd), "snd was not initialized.");
    assert(isarray(level.snd.var_117aac49a4007550));
    waitforplayers();
    while (true) {
        waittime = function_884f74c72eb297ea(var_c1cc78e068001d23);
        wait waittime;
        if (isdefined(level.snd.var_35a5d01e6e6e88f7) == 0 || level.snd.var_35a5d01e6e6e88f7.size == 0) {
            function_f98c715cf7000bec();
            level.snd.var_35a5d01e6e6e88f7 = array_remove(level.snd.var_35a5d01e6e6e88f7, var_4ef7f927f8917d38);
        }
        var_b609fc03c4b98503 = level.snd.var_35a5d01e6e6e88f7[0];
        var_4ef7f927f8917d38 = var_b609fc03c4b98503;
        while (isarray(var_b609fc03c4b98503) && var_b609fc03c4b98503.size > 0) {
            var_cf9622eab9ca6772 = var_b609fc03c4b98503[0];
            if (soundexists(var_cf9622eab9ca6772)) {
                playtime = lookupsoundlength(var_cf9622eab9ca6772) / 1000;
                foreach (player in level.players) {
                    player playlocalsound(var_cf9622eab9ca6772);
                }
                wait playtime;
                wait 0.666;
            }
            var_b609fc03c4b98503 = array_remove(var_b609fc03c4b98503, var_cf9622eab9ca6772);
        }
        level.snd.var_35a5d01e6e6e88f7 = array_remove(level.snd.var_35a5d01e6e6e88f7, var_4ef7f927f8917d38);
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38c3
// Size: 0x31
function function_4779f470d4e11c91(var_c1cc78e068001d23) {
    if (isdefined(var_c1cc78e068001d23) == 0) {
        var_c1cc78e068001d23 = [6, 12];
    }
    level thread function_25cd589593729f1(var_c1cc78e068001d23);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38fc
// Size: 0xa
function radioConvoStop() {
    level notify("radioConvoStop");
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x390e
// Size: 0x46
function function_f98c715cf7000bec() {
    if (isdefined(level.snd.var_117aac49a4007550)) {
        level.snd.var_35a5d01e6e6e88f7 = array_randomize(level.snd.var_117aac49a4007550);
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x395c
// Size: 0x30
function function_83ad3db1a9ccd7f8(flag_name, var_220cfd744ed0ba55, fade_in_time, fade_out_time) {
    level thread function_704e6701c74424db(flag_name, var_220cfd744ed0ba55, fade_in_time, fade_out_time);
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3994
// Size: 0x96
function private function_704e6701c74424db(flag_name, var_220cfd744ed0ba55, fade_in_time, fade_out_time) {
    level.player endon("death");
    if (!flag_exist(flag_name)) {
        flag_init(flag_name);
    }
    if (!isdefined(fade_in_time)) {
        fade_in_time = 0.5;
    }
    if (!isdefined(fade_out_time)) {
        fade_out_time = 0.5;
    }
    while (true) {
        flag_wait(flag_name);
        level.player setsoundsubmix(var_220cfd744ed0ba55, fade_in_time);
        flag_waitopen(flag_name);
        level.player clearsoundsubmix(var_220cfd744ed0ba55, fade_out_time);
    }
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3a32
// Size: 0x3a
function private function_ae2644bb5c0d2ef4(key, value) {
    valuearray = strtok(value, " ");
    time = 0.05;
    return value;
}

// Namespace namespace_36ba977bda7331e2 / namespace_988209748ed8c64f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3a75
// Size: 0x18
function private function_f01b2b3f17289b74(key, value) {
    return "";
}

