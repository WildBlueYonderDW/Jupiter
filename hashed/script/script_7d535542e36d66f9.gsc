// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_ff9be09b0cc4dbb2;

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3
// Size: 0x2c
function function_a5aa158578694a69(var_48accc37953cfc3b, percent) {
    function_6fbea72303085c6f(level.player, utility::function_b88f4e5baff057a9(var_48accc37953cfc3b), percent);
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6
// Size: 0x13
function function_c0faca532411608c() {
    function_1e1767fdc6980106(level.player);
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100
// Size: 0xc2
function function_6fbea72303085c6f(ent, speed, percent, offset) {
    if (!isdefined(self.lookatentities)) {
        self.lookatentities = [];
    }
    if (!self.lookatentities.size) {
        self function_1c339daaba3f71db(1);
    }
    self.lookatentities[self.lookatentities.size] = ent;
    if (isdefined(speed)) {
        self function_106bce0aeee91d2c(speed);
    }
    if (isdefined(percent)) {
        self function_6dc7c9be085f4137(percent);
    }
    if (isplayer(ent)) {
        self function_5621e511b99964a7(ent);
    } else {
        if (isdefined(offset)) {
            ent.var_64b4740234f03713 = offset;
        } else {
            offset = (0, 0, 0);
        }
        self function_6ef849bee4b12dd(ent, offset);
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9
// Size: 0x135
function function_1e1767fdc6980106(ent) {
    if (!isdefined(self.lookatentities) || !array_contains(self.lookatentities, ent)) {
        return;
    }
    lookingatent = function_350e192b13bea45c(self.lookatentities) == ent;
    self.lookatentities = function_57091b2d67654a14(self.lookatentities, ent);
    self.lookatentities = array_removeundefined(self.lookatentities);
    if (isdefined(ent.var_64b4740234f03713)) {
        ent.var_64b4740234f03713 = undefined;
    }
    if (lookingatent) {
        if (isplayer(ent)) {
            self function_504a5e2df31069a4();
        }
        if (self.lookatentities.size > 0) {
            var_180bbbd4951d78ad = function_350e192b13bea45c(self.lookatentities);
            if (isplayer(var_180bbbd4951d78ad)) {
                self function_5621e511b99964a7(var_180bbbd4951d78ad);
            } else {
                offset = function_53c4c53197386572(var_180bbbd4951d78ad.var_64b4740234f03713, (0, 0, 0));
                self function_6ef849bee4b12dd(var_180bbbd4951d78ad, offset);
            }
        }
    }
    if (!self.lookatentities.size) {
        self function_1c339daaba3f71db(0);
        self stoplookat();
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x305
// Size: 0x12
function function_15dc13dcb9303962() {
    return function_e98030c52e2f3eec(level.player);
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f
// Size: 0x19
function function_e98030c52e2f3eec(ent) {
    return is_equal(ent, function_163fd34fc07d2b8a());
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x340
// Size: 0x30
function function_163fd34fc07d2b8a() {
    if (!isdefined(self.lookatentities) || !self.lookatentities.size) {
        return undefined;
    }
    return function_350e192b13bea45c(self.lookatentities);
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x378
// Size: 0x964
function function_11e84eac72368d4e(var_47a2d19079a1a2b, var_f53e74a2c8fc7b96, var_9324afcbaa32c0b5, var_4a3993c83b6c63e4, innerradius, outerradius, var_d67ae0707347001, var_412a2db1704efae0, var_352116002e9d5e8a, var_c9c095852ef9437b, var_e71b36661c60a1ab, var_1ff7cb08338acf70) {
    self endon("death");
    self endon("stop_idle_lookat");
    var_1496542aefb33638 = 1;
    var_c0d0b7117d58efe5 = 2;
    var_b60538a3788d98b4 = 2000;
    var_2530e9d4553c0b96 = 0;
    var_d2cd83a1b45fe28b = 1;
    var_c6a46e2201b2e656 = 2;
    var_35a335748f48d56f = 3;
    var_8c9657636d4eed14 = 4;
    var_a729f7c9da5037 = 5;
    var_54ee9baadb24a574 = 6;
    var_afbd8c41b09c1c1d = 7;
    var_e2c608d6182b190b = 8;
    var_41fdd42a3580814e = 9;
    state = var_2530e9d4553c0b96;
    nextstate = var_2530e9d4553c0b96;
    cooldown = 0;
    var_47a2d19079a1a2b = int(var_47a2d19079a1a2b) * 1000;
    var_f53e74a2c8fc7b96 = int(var_f53e74a2c8fc7b96) * 1000;
    var_9324afcbaa32c0b5 = int(var_9324afcbaa32c0b5) * 1000;
    var_4a3993c83b6c63e4 = int(var_4a3993c83b6c63e4) * 1000;
    /#
        setdvarifuninitialized(@"hash_f3db11612f967c4a", 0);
    #/
    while (1) {
        var_d2e4bddeddc9b4f9 = distance(level.player.origin, self.origin);
        var_c496794db8bdd976 = var_c0d0b7117d58efe5;
        if (var_d2e4bddeddc9b4f9 > innerradius) {
            var_c496794db8bdd976 = var_1496542aefb33638;
        }
        var_ddd5fb570e804bf0 = anglestoforward(self.angles);
        playerforward = anglestoforward(level.player.angles);
        toplayer = vectornormalize(level.player.origin - self.origin);
        var_b9352a31fdb74279 = vectordot(var_ddd5fb570e804bf0, toplayer) > var_e71b36661c60a1ab && var_d2e4bddeddc9b4f9 < outerradius;
        var_e5c3dcba138f1f89 = vectordot(playerforward, -1 * toplayer) > var_1ff7cb08338acf70;
        /#
            if (getdvarint(@"hash_f3db11612f967c4a", 0)) {
                var_d7c354500d9a5ee5 = "<unknown string>";
                switch (state) {
                case 0:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 1:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 2:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 3:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 4:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 5:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 6:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 7:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 8:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 9:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                default:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                }
                debugpos = (self.origin[0], self.origin[1], self.origin[2] + 80);
                print3d(debugpos, var_d7c354500d9a5ee5, (0, 0, 1), 1, 0.25, 1, 1);
            }
        #/
        if (state == var_2530e9d4553c0b96) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_b9352a31fdb74279) {
                nextstate = var_c6a46e2201b2e656;
            }
        } else if (state == var_d2cd83a1b45fe28b) {
            if (var_b9352a31fdb74279) {
                nextstate = var_c6a46e2201b2e656;
            }
        } else if (state == var_c6a46e2201b2e656 && cooldown < gettime()) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && var_e5c3dcba138f1f89) {
                nextstate = var_35a335748f48d56f;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && !var_e5c3dcba138f1f89) {
                nextstate = var_54ee9baadb24a574;
            } else if (var_c496794db8bdd976 == var_1496542aefb33638) {
                nextstate = var_e2c608d6182b190b;
            }
        } else if (state == var_35a335748f48d56f) {
            if (var_c496794db8bdd976 != var_c0d0b7117d58efe5 || !var_b9352a31fdb74279 || !var_e5c3dcba138f1f89) {
                nextstate = var_8c9657636d4eed14;
            }
        } else if (state == var_8c9657636d4eed14 && cooldown < gettime()) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && var_e5c3dcba138f1f89) {
                nextstate = var_35a335748f48d56f;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && !var_e5c3dcba138f1f89) {
                nextstate = var_afbd8c41b09c1c1d;
            } else if (var_c496794db8bdd976 == var_1496542aefb33638) {
                nextstate = var_41fdd42a3580814e;
            }
        } else if (state == var_a729f7c9da5037 && cooldown < gettime()) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && var_e5c3dcba138f1f89) {
                nextstate = var_35a335748f48d56f;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && !var_e5c3dcba138f1f89) {
                nextstate = var_afbd8c41b09c1c1d;
            } else if (var_c496794db8bdd976 == var_1496542aefb33638) {
                nextstate = var_41fdd42a3580814e;
            }
        } else if (state == var_54ee9baadb24a574 && cooldown < gettime()) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && !var_e5c3dcba138f1f89) {
                nextstate = var_afbd8c41b09c1c1d;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && var_e5c3dcba138f1f89) {
                nextstate = var_35a335748f48d56f;
            } else if (var_c496794db8bdd976 == var_1496542aefb33638) {
                nextstate = var_41fdd42a3580814e;
            }
        } else if (state == var_afbd8c41b09c1c1d && cooldown < gettime()) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && var_e5c3dcba138f1f89) {
                nextstate = var_a729f7c9da5037;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && !var_e5c3dcba138f1f89) {
                nextstate = var_54ee9baadb24a574;
            } else if (var_c496794db8bdd976 == var_1496542aefb33638) {
                nextstate = var_41fdd42a3580814e;
            }
        } else if (state == var_e2c608d6182b190b && cooldown < gettime()) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_c496794db8bdd976 == var_1496542aefb33638) {
                nextstate = var_41fdd42a3580814e;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && var_e5c3dcba138f1f89) {
                nextstate = var_35a335748f48d56f;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && !var_e5c3dcba138f1f89) {
                nextstate = var_afbd8c41b09c1c1d;
            }
        } else if (state == var_41fdd42a3580814e && cooldown < gettime()) {
            if (!var_b9352a31fdb74279) {
                nextstate = var_d2cd83a1b45fe28b;
            } else if (var_c496794db8bdd976 == var_1496542aefb33638) {
                nextstate = var_e2c608d6182b190b;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && !var_e5c3dcba138f1f89) {
                nextstate = var_afbd8c41b09c1c1d;
            } else if (var_c496794db8bdd976 == var_c0d0b7117d58efe5 && var_e5c3dcba138f1f89) {
                nextstate = var_a729f7c9da5037;
            }
        }
        if (state != nextstate) {
            if (state == var_2530e9d4553c0b96) {
                if (nextstate == var_d2cd83a1b45fe28b) {
                    function_c0faca532411608c();
                } else if (nextstate == var_c6a46e2201b2e656) {
                    cooldown = gettime() + var_b60538a3788d98b4;
                }
            } else if (state == var_d2cd83a1b45fe28b) {
                if (nextstate == var_c6a46e2201b2e656) {
                    cooldown = gettime() + var_b60538a3788d98b4;
                }
            } else if (state == var_c6a46e2201b2e656) {
                if (nextstate == var_d2cd83a1b45fe28b) {
                    function_c0faca532411608c();
                } else if (nextstate == var_35a335748f48d56f) {
                    function_a5aa158578694a69(var_d67ae0707347001, var_352116002e9d5e8a);
                } else if (nextstate == var_54ee9baadb24a574) {
                    function_a5aa158578694a69(var_d67ae0707347001, var_352116002e9d5e8a);
                    cooldown = gettime() + var_47a2d19079a1a2b;
                } else if (nextstate == var_e2c608d6182b190b) {
                    function_a5aa158578694a69(var_412a2db1704efae0, var_c9c095852ef9437b);
                    cooldown = gettime() + var_f53e74a2c8fc7b96;
                }
            } else if (state == var_35a335748f48d56f) {
                if (nextstate == var_8c9657636d4eed14) {
                    cooldown = gettime() + var_b60538a3788d98b4;
                }
            } else if (state == var_8c9657636d4eed14) {
                if (nextstate == var_d2cd83a1b45fe28b) {
                    function_c0faca532411608c();
                } else if (nextstate == var_afbd8c41b09c1c1d) {
                    function_c0faca532411608c();
                    cooldown = gettime() + var_47a2d19079a1a2b;
                } else if (nextstate == var_41fdd42a3580814e) {
                    function_c0faca532411608c();
                    cooldown = gettime() + var_47a2d19079a1a2b;
                }
            } else if (state == var_a729f7c9da5037) {
                if (nextstate == var_35a335748f48d56f) {
                    function_a5aa158578694a69(var_d67ae0707347001, var_352116002e9d5e8a);
                } else if (nextstate == var_afbd8c41b09c1c1d) {
                    cooldown = gettime() + var_9324afcbaa32c0b5;
                } else if (nextstate == var_41fdd42a3580814e) {
                    cooldown = gettime() + var_4a3993c83b6c63e4;
                }
            } else if (state == var_54ee9baadb24a574) {
                if (nextstate == var_d2cd83a1b45fe28b) {
                    function_c0faca532411608c();
                } else if (nextstate == var_afbd8c41b09c1c1d) {
                    function_c0faca532411608c();
                    cooldown = gettime() + var_9324afcbaa32c0b5;
                } else if (nextstate == var_41fdd42a3580814e) {
                    function_c0faca532411608c();
                    cooldown = gettime() + var_4a3993c83b6c63e4;
                }
            } else if (state == var_afbd8c41b09c1c1d) {
                if (nextstate == var_a729f7c9da5037) {
                    cooldown = gettime() + var_b60538a3788d98b4;
                } else if (nextstate == var_54ee9baadb24a574) {
                    function_a5aa158578694a69(var_d67ae0707347001, var_352116002e9d5e8a);
                    cooldown = gettime() + var_47a2d19079a1a2b;
                } else if (nextstate == var_41fdd42a3580814e) {
                    cooldown = gettime() + var_4a3993c83b6c63e4;
                }
            } else if (state == var_e2c608d6182b190b) {
                if (nextstate == var_d2cd83a1b45fe28b) {
                    function_c0faca532411608c();
                } else if (nextstate == var_41fdd42a3580814e) {
                    function_c0faca532411608c();
                    cooldown = gettime() + var_4a3993c83b6c63e4;
                } else {
                    if (nextstate == var_35a335748f48d56f) {
                        goto LOC_00000908;
                    }
                    if (nextstate == var_afbd8c41b09c1c1d) {
                        function_c0faca532411608c();
                        cooldown = gettime() + var_9324afcbaa32c0b5;
                    LOC_00000908:
                    }
                LOC_00000908:
                }
            LOC_00000908:
            } else if (state == var_41fdd42a3580814e) {
                if (nextstate == var_e2c608d6182b190b) {
                    function_a5aa158578694a69(var_412a2db1704efae0, var_c9c095852ef9437b);
                    cooldown = gettime() + var_f53e74a2c8fc7b96;
                } else if (nextstate == var_afbd8c41b09c1c1d) {
                    cooldown = gettime() + var_9324afcbaa32c0b5;
                } else if (nextstate == var_a729f7c9da5037) {
                    cooldown = gettime() + var_b60538a3788d98b4;
                }
            }
            state = nextstate;
        }
        waitframe();
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xce3
// Size: 0x3db
function function_51c52cb24acd5706(var_9d6cb79f4e312ddd, var_57052f010a23838f, radius, var_48accc37953cfc3b, percent, var_e71b36661c60a1ab, var_1ff7cb08338acf70) {
    self endon("death");
    self endon("stop_idle_lookat");
    var_d2cd83a1b45fe28b = 0;
    var_c6a46e2201b2e656 = 1;
    var_9c0421243ec5a516 = 2;
    var_a56a8824d14b26df = 3;
    var_738c989de9b7ab4 = 2000;
    state = var_d2cd83a1b45fe28b;
    nextstate = var_d2cd83a1b45fe28b;
    cooldown = 0;
    var_9d6cb79f4e312ddd = int(var_9d6cb79f4e312ddd) * 1000;
    var_57052f010a23838f = int(var_57052f010a23838f) * 1000;
    /#
        setdvarifuninitialized(@"hash_f3db11612f967c4a", 0);
    #/
    while (1) {
        var_d2e4bddeddc9b4f9 = distance(level.player.origin, self.origin);
        var_ddd5fb570e804bf0 = anglestoforward(self.angles);
        playerforward = anglestoforward(level.player.angles);
        toplayer = vectornormalize(level.player.origin - self.origin);
        var_b9352a31fdb74279 = vectordot(var_ddd5fb570e804bf0, toplayer) > var_e71b36661c60a1ab && var_d2e4bddeddc9b4f9 < radius;
        var_e5c3dcba138f1f89 = vectordot(playerforward, -1 * toplayer) > var_1ff7cb08338acf70;
        var_b9352a31fdb74279 = var_b9352a31fdb74279 && var_e5c3dcba138f1f89;
        /#
            if (getdvarint(@"hash_f3db11612f967c4a", 0)) {
                var_d7c354500d9a5ee5 = "<unknown string>";
                switch (state) {
                case 0:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 1:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 2:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                case 3:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                default:
                    var_d7c354500d9a5ee5 = "<unknown string>";
                    break;
                }
                debugpos = (self.origin[0], self.origin[1], self.origin[2] + 80);
                print3d(debugpos, var_d7c354500d9a5ee5, (0, 0, 1), 1, 0.25, 1, 1);
            }
        #/
        if (state == var_d2cd83a1b45fe28b) {
            if (var_b9352a31fdb74279) {
                nextstate = var_c6a46e2201b2e656;
            }
        } else if (state == var_c6a46e2201b2e656 && cooldown < gettime()) {
            if (var_b9352a31fdb74279) {
                nextstate = var_9c0421243ec5a516;
            } else {
                nextstate = var_d2cd83a1b45fe28b;
            }
        } else if (state == var_9c0421243ec5a516 && cooldown < gettime()) {
            if (var_b9352a31fdb74279) {
                nextstate = var_a56a8824d14b26df;
            } else {
                nextstate = var_d2cd83a1b45fe28b;
            }
        } else if (state == var_a56a8824d14b26df && cooldown < gettime()) {
            if (var_b9352a31fdb74279) {
                nextstate = var_9c0421243ec5a516;
            } else {
                nextstate = var_d2cd83a1b45fe28b;
            }
        }
        if (state != nextstate) {
            if (state == var_d2cd83a1b45fe28b) {
                if (nextstate == var_c6a46e2201b2e656) {
                    cooldown = gettime() + var_738c989de9b7ab4;
                }
            } else if (state == var_c6a46e2201b2e656) {
                if (nextstate == var_9c0421243ec5a516) {
                    function_a5aa158578694a69(var_48accc37953cfc3b, percent);
                    cooldown = gettime() + var_9d6cb79f4e312ddd;
                }
            } else if (state == var_9c0421243ec5a516) {
                if (nextstate == var_a56a8824d14b26df) {
                    function_c0faca532411608c();
                    cooldown = gettime() + var_57052f010a23838f;
                } else if (nextstate == var_d2cd83a1b45fe28b) {
                    function_c0faca532411608c();
                }
            } else if (state == var_a56a8824d14b26df) {
                if (nextstate == var_9c0421243ec5a516) {
                    function_a5aa158578694a69(var_48accc37953cfc3b, percent);
                    cooldown = gettime() + var_9d6cb79f4e312ddd;
                }
            }
            state = nextstate;
        }
        waitframe();
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10c5
// Size: 0x40
function function_a72247099f0414e7(enable, playerradius, var_db0391bd4c2d3d19) {
    level.var_ee5dcc2cb0e28ecc = enable;
    if (enable) {
        level thread function_347c218f281719e4(playerradius, var_db0391bd4c2d3d19);
    } else {
        level notify("end_levellookatteam");
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110c
// Size: 0xda
function function_347c218f281719e4(playerradius, var_db0391bd4c2d3d19) {
    level endon("end_levellookatteam");
    if (!isdefined(playerradius)) {
        playerradius = 1024;
    }
    if (!isdefined(var_db0391bd4c2d3d19)) {
        var_db0391bd4c2d3d19 = 512;
    }
    while (level.var_ee5dcc2cb0e28ecc) {
        wait(5);
        ai = getaiarrayinradius(level.player.origin, playerradius);
        foreach (guy in ai) {
            if (isdefined(guy isinscriptedstate()) && guy isinscriptedstate()) {
                continue;
            }
            /#
                guy thread function_ca76b97da22f081b();
            #/
            guy thread function_51a6f1734f850aec(ai, var_db0391bd4c2d3d19, 5);
        }
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ed
// Size: 0x4f
function function_51a6f1734f850aec(ai, maxdist, var_db0d5bf7eafe4a31) {
    self endon("death");
    self endon("kill_lookatteam");
    function_80a9352cf824e995(1);
    function_2c49add797a42aab(ai, maxdist);
    function_ff0bb38cfb102c11(ai, maxdist, 5);
    function_80a9352cf824e995(0);
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1243
// Size: 0x94
function function_1961ba599803679a(guys, maxdist, var_db0d5bf7eafe4a31) {
    if (!isdefined(self) || !isent(self)) {
        return;
    }
    self endon("death");
    self endon("kill_lookatteam");
    if (!isdefined(self) || self == level.player) {
        return;
    }
    function_80a9352cf824e995(1);
    guys[guys.size] = level.player;
    /#
        thread function_ca76b97da22f081b();
    #/
    while (1) {
        function_c38d71f632b89906();
        function_2c49add797a42aab(guys);
        function_ff0bb38cfb102c11(guys, maxdist, var_db0d5bf7eafe4a31);
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12de
// Size: 0x2a
function function_80a9352cf824e995(enable) {
    self function_1c339daaba3f71db(enable);
    self.var_c15ac68fc63fc9a8 = enable;
    if (!enable) {
        self notify("kill_lookatteam");
    }
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130f
// Size: 0x118
function function_2c49add797a42aab(guys, maxdist) {
    if (!isdefined(self.var_c15ac68fc63fc9a8) || !self.var_c15ac68fc63fc9a8) {
        return;
    }
    guys = array_removedead(guys);
    guy = random(guys);
    if (guys.size < 2) {
        return;
    }
    if (!isdefined(guy) || vectordot(self.origin, guy.origin) < 0) {
        return;
    }
    if (guy == self) {
        function_c38d71f632b89906();
        return;
    }
    if (isdefined(self.var_85f04bf47bf39ff6) && self.var_85f04bf47bf39ff6 == guy) {
        self.var_85f04bf47bf39ff6 = undefined;
        return;
    }
    if (isdefined(maxdist) && distancesquared(self.origin, guy.origin) > maxdist * maxdist) {
        return;
    }
    if (vectordot(self.origin, guy.origin) <= 0) {
        return;
    }
    self.var_85f04bf47bf39ff6 = guy;
    /#
        self.var_6d3cb418791ad940 = "<unknown string>";
    #/
    function_9fadcb46c7ef90a0(guy);
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142e
// Size: 0x15f
function function_ff0bb38cfb102c11(guys, maxdist, var_db0d5bf7eafe4a31) {
    /#
        assert(self != level.player);
    #/
    guys = array_removedead(guys);
    guys = sortbydistance(guys, self.origin);
    if (guys.size < 2) {
        return;
    }
    /#
        self.var_6d3cb418791ad940 = "<unknown string>";
    #/
    for (var_f005387b5006ade6 = 0; var_f005387b5006ade6 < guys.size; var_f005387b5006ade6++) {
        guy = guys[var_f005387b5006ade6];
        if (!isdefined(self.var_c15ac68fc63fc9a8) || !self.var_c15ac68fc63fc9a8) {
            continue;
        }
        if (!isdefined(guy)) {
            continue;
        }
        if (self == guy) {
            continue;
        }
        if (!isalive(guy)) {
            continue;
        }
        if (isdefined(self.var_85f04bf47bf39ff6) && self.var_85f04bf47bf39ff6 == guy) {
            self.var_85f04bf47bf39ff6 = undefined;
        } else {
            if (isdefined(var_db0d5bf7eafe4a31) && var_f005387b5006ade6 >= var_db0d5bf7eafe4a31) {
                return;
            }
            if (isdefined(maxdist) && distancesquared(self.origin, guy.origin) > maxdist * maxdist) {
                continue;
            }
            if (vectordot(self.origin, guy.origin) <= 0) {
                continue;
            }
            self.var_85f04bf47bf39ff6 = guy;
            function_9fadcb46c7ef90a0(guy);
        }
    }
    function_c38d71f632b89906();
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1594
// Size: 0x58
function function_c38d71f632b89906() {
    if (!isdefined(self) || !isent(self)) {
        return;
    }
    minidletime = 2;
    var_e7fc8c00dab4ca1a = 4;
    /#
        self.var_6d3cb418791ad940 = "<unknown string>";
    #/
    self function_1c339daaba3f71db(0);
    wait(randomfloatrange(minidletime, var_e7fc8c00dab4ca1a));
    self function_1c339daaba3f71db(1);
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f3
// Size: 0x97
function function_9fadcb46c7ef90a0(other) {
    percent = 0.8;
    speed = 1;
    function_6fbea72303085c6f(other, utility::function_b88f4e5baff057a9(speed), percent);
    var_8660e4be5019b5f = 0.5;
    var_cf84bb92b95910ed = 1;
    if (isdefined(other)) {
        if (self.team == other.team) {
            var_8660e4be5019b5f = 1.5;
            var_cf84bb92b95910ed = 2.5;
        } else {
            var_8660e4be5019b5f = 1;
            var_cf84bb92b95910ed = 1.5;
        }
    }
    wait(randomfloatrange(var_8660e4be5019b5f, var_cf84bb92b95910ed));
}

// Namespace namespace_ff9be09b0cc4dbb2/namespace_17a0e830dd8fa113
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1691
// Size: 0x92
function function_ca76b97da22f081b() {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        setdvarifuninitialized(@"hash_4e640bf30799c32f", 0);
        while (1) {
            waitframe();
            if (getdvarint(@"hash_4e640bf30799c32f", 0)) {
                debugpos = self.origin + (0, 0, 88);
                if (isdefined(self.var_6d3cb418791ad940)) {
                    print3d(debugpos, self.var_6d3cb418791ad940, (1, 1, 1), 1, 0.25);
                }
            }
        }
    #/
}

