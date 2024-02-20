// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_3b64eb40368c1450;

#namespace whizby;

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de
// Size: 0x44
function init(var_8611e1d824bbdb4a) {
    setdvarifuninitialized(@"hash_15c99dd2f2a0921a", 1);
    /#
        setdvarifuninitialized(@"hash_7774635c5712048e", 0);
        setdvarifuninitialized(@"hash_a6017ebde71968e5", "<unknown string>");
    #/
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x229
// Size: 0x31
function initplayer() {
    self.whizby = spawnstruct();
    self.whizby.lasttime = -999999;
    function_bcd1a794fb26ee5c();
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261
// Size: 0x226
function function_a6e6611efb4164d5(attacker, distance, position, forward) {
    /#
        if (getdvarint(@"hash_7774635c5712048e")) {
            if (distance > 120) {
                print3d(position, int(sqrt(distance)), (1, 1, 1), 0.7, 0.45, 20);
            } else {
                eye = self geteye();
                print3d(position, distance, (1, 0, 0), 0.7, 0.45, 20);
            }
        }
    #/
    if (isdefined(attacker) && isai(attacker) && isalive(attacker)) {
        function_216c67ab6749137a(attacker, undefined, "shot_at_target", "target_unhurt");
    }
    time = gettime();
    if (function_43d3999d682de782(attacker, distance, position, forward, time)) {
        weapon = undefined;
        if (isplayer(attacker) || isbot(attacker)) {
            weapon = attacker getcurrentweapon();
        } else if (isai(attacker)) {
            weapon = attacker.weapon;
        } else {
            /#
                assertmsg("attacker in whizby is neither a player or AI");
            #/
        }
        weapclass = weaponclass(weapon);
        /#
            if (getdvar(@"hash_a6017ebde71968e5") != "<unknown string>") {
                switch (getdvar(@"hash_a6017ebde71968e5")) {
                case #"hash_900cb06c552c5063":
                    weapclass = "<unknown string>";
                    break;
                case #"hash_28a7ce6c1f1955d9":
                    weapclass = "<unknown string>";
                    break;
                case #"hash_2f69646c2276faf4":
                    weapclass = "<unknown string>";
                    break;
                }
            }
        #/
        self notify("whizbyBlur_reset");
        var_85b3cf23250d4543 = function_21676cfe493c7014(weapclass, distance, time);
        function_2fad28813245304d(var_85b3cf23250d4543);
        function_b04dc57d51b057c(weapclass, weapon, var_85b3cf23250d4543);
        function_5e980dbce5b2122(attacker, position, time, var_85b3cf23250d4543, distance);
        self.whizby.lasttime = time;
        function_bcd1a794fb26ee5c();
    }
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48e
// Size: 0x107
function function_43d3999d682de782(attacker, distance, position, forward, time) {
    if (getdvarint(@"hash_15c99dd2f2a0921a", 1) != 1) {
        return 0;
    }
    if (!isdefined(attacker) || !isdefined(distance) || !isdefined(position) || !isdefined(forward)) {
        return 0;
    }
    if (!isai(attacker) && !isplayer(attacker)) {
        return 0;
    }
    if (!isalive(attacker)) {
        return 0;
    }
    if (time - self.whizby.lasttime < self.whizby.cooldown) {
        return 0;
    }
    if (!val::get("whizby")) {
        return 0;
    }
    if (istrue(self.nowhizby)) {
        return 0;
    }
    if (!isenemyteam(self.team, attacker.team)) {
        return 0;
    }
    if (istrue(self.deathsdoor)) {
        return 0;
    }
    if (function_cee14923e29e38ab(time)) {
        return 0;
    }
    return 1;
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59d
// Size: 0x4b
function function_cee14923e29e38ab(time) {
    if (!isdefined(self.lastdamagedtime)) {
        return 0;
    }
    var_a45d63a143541740 = getdvarint(@"hash_902f31627206f3", 750);
    if (self.lastdamagedtime + var_a45d63a143541740 > time) {
        return 1;
    }
    return 0;
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f0
// Size: 0xbd
function function_2fad28813245304d(var_85b3cf23250d4543) {
    var_5383eeee9c6e12d4 = self playergetzoomfov();
    var_c7bd47f5e4b60c31 = math::normalize_value(4, 65, var_5383eeee9c6e12d4);
    var_15801234316e9c14 = math::factor_value(0.3, 0.85, var_c7bd47f5e4b60c31);
    var_f8e72f77b5116a2f = math::factor_value(1, var_15801234316e9c14, self playerads());
    var_7ae8eaf92080ffc9 = math::factor_value(0.03, 0.28, var_85b3cf23250d4543);
    var_376b7286a8ff4b23 = math::factor_value(0.35, 0.35, var_85b3cf23250d4543);
    var_7ae8eaf92080ffc9 = var_7ae8eaf92080ffc9 * var_f8e72f77b5116a2f;
    self earthquakeforplayer(var_7ae8eaf92080ffc9, var_376b7286a8ff4b23, self.origin, 1000);
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b4
// Size: 0x13e
function function_b04dc57d51b057c(weapclass, weapon, var_85b3cf23250d4543) {
    eventtype = undefined;
    var_b7f9baef31d9a9d9 = 2;
    switch (weapclass) {
    case #"hash_fa24dff6bd60a12d":
        var_b7f9baef31d9a9d9 = 3;
        break;
    case #"hash_6191aaef9f922f96":
        if (string_starts_with("iw9_dm", weapon.basename)) {
            var_b7f9baef31d9a9d9 = 2;
        } else {
            var_b7f9baef31d9a9d9 = 3;
        }
        break;
    case #"hash_8cdaf2e4ecfe5b51":
        var_b7f9baef31d9a9d9 = 2;
        break;
    case #"hash_719417cb1de832b6":
    case #"hash_900cb96c552c5e8e":
        var_b7f9baef31d9a9d9 = 2;
        break;
    }
    eventindex = var_b7f9baef31d9a9d9;
    if (var_85b3cf23250d4543 < 0.3) {
        eventindex = eventindex - 2;
    } else if (var_85b3cf23250d4543 < 0.6) {
        eventindex = eventindex - 1;
    }
    switch (eventindex) {
    case 3:
        eventtype = "vsp_large";
        break;
    case 2:
        eventtype = "vsp_medium";
        break;
    case 1:
        eventtype = "vsp_small";
        break;
    }
    if (eventindex > 0) {
        self function_38e25fa379161404(eventtype);
    }
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f9
// Size: 0x28e
function function_5e980dbce5b2122(attacker, position, time, var_85b3cf23250d4543, distance) {
    var_10d38f4dc0d37164 = self getplayerangles();
    eyepos = self geteye();
    var_14d9d4fffc09a76d = anglestoaxis(var_10d38f4dc0d37164);
    var_86c1c8628b1d55f8 = attacker.origin + (0, 0, 50);
    toattackervec = vectornormalize(var_86c1c8628b1d55f8 - eyepos);
    var_7caf68458d047d37 = vectordot(toattackervec, var_14d9d4fffc09a76d["forward"]);
    var_31659d73698c898a = vectordot(toattackervec, var_14d9d4fffc09a76d["right"]);
    var_7f628b9bd51160d5 = vectordot(toattackervec, var_14d9d4fffc09a76d["up"]);
    var_3ca1b715ac9ad24e = attacker getentitynumber();
    var_dd9bb8522cc9e666 = clamp(var_7caf68458d047d37, 0, 1);
    var_b4b4994e3604ce34 = 1 - abs(var_7caf68458d047d37);
    var_f3dae9eeecbc6a28 = clamp(-1 * var_7caf68458d047d37, 0, 1);
    var_3783a488b009bc61 = function_dbabf852a35102e4(var_31659d73698c898a, var_7f628b9bd51160d5);
    var_4c321c57b0d42848 = position + -500 * toattackervec;
    var_dd9bb8522cc9e666 = math::normalized_float_smooth_out(var_dd9bb8522cc9e666);
    var_b4b4994e3604ce34 = math::normalized_float_smooth_out(var_b4b4994e3604ce34);
    self setclientomnvar("ui_whizby_alpha_front", var_dd9bb8522cc9e666 * var_85b3cf23250d4543 * 0.5);
    self setclientomnvar("ui_whizby_alpha_side", var_b4b4994e3604ce34 * var_85b3cf23250d4543 * 1);
    self setclientomnvar("ui_whizby_alpha_back", var_f3dae9eeecbc6a28 * var_85b3cf23250d4543 * 1);
    self setclientomnvar("ui_whizby_side_angle", int(var_3783a488b009bc61));
    self setclientomnvar("ui_whizby_ent", var_3ca1b715ac9ad24e);
    self setclientomnvar("ui_whizby_back_x", int(var_4c321c57b0d42848[0]));
    self setclientomnvar("ui_whizby_back_y", int(var_4c321c57b0d42848[1]));
    self setclientomnvar("ui_whizby_back_z", int(var_4c321c57b0d42848[2]));
    xpos = self getclientomnvar("ui_whizby_back_x");
    ypos = self getclientomnvar("ui_whizby_back_y");
    var_689a1188271a0be5 = self getclientomnvar("ui_whizby_back_z");
    self setclientomnvar("ui_whizby_notify", time);
    /#
        if (getdvarint(@"hash_7774635c5712048e")) {
            function_708f66676f77c951(attacker, position, var_4c321c57b0d42848, var_85b3cf23250d4543, distance);
        }
    #/
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8e
// Size: 0x87
function function_dbabf852a35102e4(var_31659d73698c898a, var_7f628b9bd51160d5) {
    var_45c4bee623ce2bf8 = abs(var_31659d73698c898a) + abs(var_7f628b9bd51160d5);
    if (var_45c4bee623ce2bf8 > 0) {
        var_2753e57904b85655 = var_31659d73698c898a / var_45c4bee623ce2bf8;
        var_b4b3ac63e415ecfc = var_7f628b9bd51160d5 / var_45c4bee623ce2bf8;
    } else {
        var_2753e57904b85655 = 1;
        var_b4b3ac63e415ecfc = 1;
    }
    if (var_b4b3ac63e415ecfc < 0) {
        angle = 90 * var_2753e57904b85655;
    } else {
        angle = 90 + 90 * var_b4b3ac63e415ecfc;
        if (var_2753e57904b85655 < 0) {
            angle = angle * -1;
        }
    }
    return angle;
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1d
// Size: 0x11f
function function_21676cfe493c7014(weapclass, distance, time) {
    var_2a0de1c48a667a53 = 0.8;
    switch (weapclass) {
    case #"hash_fa24dff6bd60a12d":
        var_2a0de1c48a667a53 = 1;
        break;
    case #"hash_6191aaef9f922f96":
        var_2a0de1c48a667a53 = 1;
        break;
    case #"hash_900cb96c552c5e8e":
        var_2a0de1c48a667a53 = 0.6;
        break;
    case #"hash_fa4dbdf6bd80bf52":
        var_2a0de1c48a667a53 = 0.6;
        break;
    }
    var_414a86ed853c7fa6 = math::normalize_value(50, 120, distance);
    var_414a86ed853c7fa6 = factor_value(1, 0.5, var_414a86ed853c7fa6);
    var_34d803dbf2021e83 = randomfloatrange(0.08, 0.27);
    timesincelast = time - self.whizby.lasttime;
    var_b2a42028cd0d9167 = math::normalize_value(2000, 6000, timesincelast);
    var_9416ac5e3a43d3bd = math::factor_value(var_34d803dbf2021e83, 1, var_b2a42028cd0d9167);
    return var_2a0de1c48a667a53 * var_414a86ed853c7fa6 * var_9416ac5e3a43d3bd;
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc44
// Size: 0x21
function function_bcd1a794fb26ee5c() {
    self.whizby.cooldown = randomfloatrange(100, 450);
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6c
// Size: 0x4e
function function_ecc51bc3ffb94164() {
    /#
        setdevdvar(@"hash_15c99dd2f2a0921a", 1);
        if (isbot(self)) {
            return;
        }
        self endon("<unknown string>");
        self endon("<unknown string>");
        thread function_4905c442ccddf750();
        while (1) {
            self waittill("<unknown string>");
            function_f3cad80dd510b802();
        }
    #/
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc1
// Size: 0x44
function function_4905c442ccddf750() {
    /#
        while (1) {
            while (!self buttonpressed("<unknown string>")) {
                wait(0.05);
            }
            self notify("<unknown string>");
            while (self buttonpressed("<unknown string>")) {
                wait(0.05);
            }
        }
    #/
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd0c
// Size: 0x22e
function function_f3cad80dd510b802() {
    /#
        self endon("<unknown string>");
        i = 0;
        dist = [0:10, 1:25, 2:50, 3:75];
        attacker = undefined;
        foreach (player in level.players) {
            if (player != self) {
                attacker = player;
            }
        }
        if (!isdefined(attacker)) {
            ai = getaiarray();
            if (ai.size > 0) {
                attacker = getclosest(self.origin, ai, 5000);
            }
        }
        effecttime = gettime();
        while (1) {
            if (isdefined(attacker)) {
                var_a2ce21e17c5a2626 = anglestoforward(self getplayerangles(1));
                dirtoattacker = vectornormalize((attacker.origin[0], attacker.origin[1], 0) - (self.origin[0], self.origin[1], 0));
                var_86e3015864ec3379 = 1;
                var_a2ce21e17c5a2626 = rotatevector(dirtoattacker, (0, 90 * var_86e3015864ec3379, 0));
                height = (0, 0, randomfloatrange(45, 65));
                position = self.origin + height + var_a2ce21e17c5a2626 * dist[i];
                self notify("<unknown string>", attacker);
                i++;
                if (i >= dist.size) {
                    i = 0;
                }
            }
            switch (getdvar(@"hash_a6017ebde71968e5")) {
            case #"hash_900cb06c552c5063":
                wait(0.22);
                break;
            case #"hash_28a7ce6c1f1955d9":
                wait(0.3);
                break;
            case #"hash_2f69646c2276faf4":
                wait(0.75);
                break;
            default:
                wait(0.22);
                break;
            }
        }
    #/
}

// Namespace whizby/namespace_d55725aa5dd0745b
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xf41
// Size: 0xdd
function function_708f66676f77c951(attacker, position, var_4c321c57b0d42848, var_85b3cf23250d4543, distance) {
    /#
        if (isdefined(attacker) && isdefined(position)) {
            if (isdefined(attacker.currentweapon) && attacker tagexists("<unknown string>")) {
                start = attacker gettagorigin("<unknown string>");
            } else {
                start = attacker.origin + (0, 0, 50);
            }
            line(start, position, (1, 0, 0), 1, 1, 20);
            line(var_4c321c57b0d42848, position, (0.5, 0.5, 0.5), 1, 1, 20);
            iprintln("<unknown string>" + distance + "<unknown string>" + var_85b3cf23250d4543 + "<unknown string>");
        }
    #/
}

