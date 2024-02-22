// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace outofrange;

// Namespace outofrange/namespace_e5ea569c6d84bb74
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180
// Size: 0xde
function setupoutofrangewatcher(var_616ea41542b3d45a, var_96408b0d60660b1, var_363c1035ed04723a, var_d9ffca69374e542, var_5a19dafa23e95368, maxrangesq, var_5231dd634cf6e07c) {
    /#
        assertex(isdefined(self.owner), "setupOutofRangeWatcher(): There is no valid owner for this ent");
    #/
    self.owner setclientomnvar("ui_out_of_range", 0);
    if (isdefined(var_5231dd634cf6e07c) && var_5231dd634cf6e07c == 1) {
        /#
            assertex(isdefined(var_96408b0d60660b1) || isdefined(var_363c1035ed04723a), "A tether point or tether ent must be defined");
        #/
    } else if (!isdefined(var_96408b0d60660b1)) {
        var_96408b0d60660b1 = var_616ea41542b3d45a.origin;
    }
    if (!isdefined(var_5a19dafa23e95368)) {
        var_5a19dafa23e95368 = 4000000;
    }
    if (!isdefined(maxrangesq)) {
        maxrangesq = 16000000;
    }
    if (isdefined(var_363c1035ed04723a)) {
        var_616ea41542b3d45a thread watchdistancefromentity(var_363c1035ed04723a, var_d9ffca69374e542, var_5a19dafa23e95368, maxrangesq, var_5231dd634cf6e07c);
    } else {
        var_616ea41542b3d45a thread watchdistancefromstaticpoint(var_96408b0d60660b1, var_5a19dafa23e95368, maxrangesq, var_5231dd634cf6e07c);
    }
}

// Namespace outofrange/namespace_e5ea569c6d84bb74
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265
// Size: 0x10d
function watchdistancefromentity(var_363c1035ed04723a, var_d9ffca69374e542, var_5a19dafa23e95368, maxrangesq, var_5231dd634cf6e07c) {
    self endon("death");
    inverted = isdefined(var_5231dd634cf6e07c) && var_5231dd634cf6e07c == 1;
    if (!isdefined(var_d9ffca69374e542)) {
        var_d9ffca69374e542 = "tag_origin";
    }
    while (1) {
        if (!isdefined(var_363c1035ed04723a)) {
            self.owner setclientomnvar("ui_out_of_range", 0);
            return;
        }
        var_96408b0d60660b1 = var_363c1035ed04723a gettagorigin(var_d9ffca69374e542);
        var_332b8e9e4a668baa = distancesquared(self.origin, var_96408b0d60660b1);
        if (utility::iscp() && !inverted) {
            var_3369989e4aab456a = var_332b8e9e4a668baa / maxrangesq;
            if (var_3369989e4aab456a <= 1) {
                self.owner setclientomnvar("ui_out_of_range_meter", sqrt(var_3369989e4aab456a));
            }
        }
        if (var_332b8e9e4a668baa >= var_5a19dafa23e95368 && !inverted || var_332b8e9e4a668baa <= maxrangesq && inverted) {
            watchoutofrangestrength(var_96408b0d60660b1, var_5a19dafa23e95368, maxrangesq, var_363c1035ed04723a, var_d9ffca69374e542, var_5231dd634cf6e07c);
        }
        waitframe();
    }
}

// Namespace outofrange/namespace_e5ea569c6d84bb74
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379
// Size: 0xc4
function watchdistancefromstaticpoint(var_96408b0d60660b1, var_5a19dafa23e95368, maxrangesq, var_5231dd634cf6e07c) {
    self endon("death");
    inverted = isdefined(var_5231dd634cf6e07c) && var_5231dd634cf6e07c == 1;
    while (1) {
        var_332b8e9e4a668baa = distancesquared(self.origin, var_96408b0d60660b1);
        if (utility::iscp() && !inverted) {
            var_3369989e4aab456a = var_332b8e9e4a668baa / maxrangesq;
            if (var_3369989e4aab456a <= 1) {
                self.owner setclientomnvar("ui_out_of_range_meter", sqrt(var_3369989e4aab456a));
            }
        }
        if (var_332b8e9e4a668baa >= var_5a19dafa23e95368 && !inverted || var_332b8e9e4a668baa <= maxrangesq && inverted) {
            watchoutofrangestrength(var_96408b0d60660b1, var_5a19dafa23e95368, maxrangesq, var_5231dd634cf6e07c);
        }
        waitframe();
    }
}

// Namespace outofrange/namespace_e5ea569c6d84bb74
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x444
// Size: 0x1f2
function watchoutofrangestrength(var_96408b0d60660b1, var_5a19dafa23e95368, maxrangesq, var_363c1035ed04723a, var_d9ffca69374e542, var_5231dd634cf6e07c) {
    inverted = isdefined(var_5231dd634cf6e07c) && var_5231dd634cf6e07c == 1;
    while (1) {
        if (isdefined(var_363c1035ed04723a)) {
            var_96408b0d60660b1 = var_363c1035ed04723a gettagorigin(var_d9ffca69374e542);
        }
        var_2ec38fd18649235a = distancesquared(self.origin, var_96408b0d60660b1);
        if (!inverted) {
            var_ee7d4ed54a12819 = var_2ec38fd18649235a / maxrangesq;
        } else if (var_2ec38fd18649235a == 0) {
            var_ee7d4ed54a12819 = var_5a19dafa23e95368;
        } else {
            var_ee7d4ed54a12819 = var_5a19dafa23e95368 / var_2ec38fd18649235a;
        }
        /#
            assertex(isdefined(self.owner), "watchOutOfRangeStrength(): Owner is not defined for the our of range ent");
        #/
        self.owner setclientomnvar("ui_out_of_range", var_ee7d4ed54a12819);
        if (utility::iscp() && !inverted) {
            self.owner setclientomnvar("ui_out_of_range_meter", sqrt(var_ee7d4ed54a12819));
        }
        if (isdefined(self.owner.outofrangefunc) && !inverted) {
            self.owner thread [[ self.owner.outofrangefunc ]](self.owner);
        }
        if (var_2ec38fd18649235a >= maxrangesq && !inverted || var_2ec38fd18649235a <= var_5a19dafa23e95368 && inverted) {
            weapon = makeweapon("nuke_multi_mp");
            meansofdeath = "MOD_EXPLOSIVE";
            self.owner setclientomnvar("ui_out_of_range", 0);
            self dodamage(10000, self.origin, self.owner, self.owner, meansofdeath, weapon);
            break;
        } else if (var_2ec38fd18649235a < var_5a19dafa23e95368 && !inverted || var_2ec38fd18649235a > var_5a19dafa23e95368 && inverted) {
            self.owner setclientomnvar("ui_out_of_range", 0);
            break;
        }
        waitframe();
    }
}

