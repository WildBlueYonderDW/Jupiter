// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_c7a00602fb8e464;
#using script_61565a6c1fdee6ac;
#using script_3f3c7170aedfefd7;
#using script_89c4e8e66e8a360;
#using script_5961052449eb875f;
#using script_b5c3028255f05a7;
#using script_2f981f68661d5e1a;
#using script_5dfa1fb6b030bdcb;
#using script_35ee5e2cef30eea2;
#using script_6981400abfcd765c;
#using script_32d93a194074fa6a;
#using script_4bcf78b337139620;
#using script_458ce44388c14a5f;
#using script_47a7dd805c87b33f;
#using script_27af1dac0930f28e;
#using scripts\mp\gamelogic.gsc;
#using script_7c40fa80892a721;
#using script_64acb6ce534155b7;

#namespace namespace_ffa603a76a04fdbe;

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f
// Size: 0x4b
function function_efb8f375317a862d(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.circleindex));
    #/
    return level.br_circle.circleindex >= params.circleindex;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2
// Size: 0x64
function function_21e310b9815e5699(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_d7bfce72f2368972));
    #/
    var_e86632d645c137d0 = level.br_circle.dangercircleent.origin[2];
    return var_e86632d645c137d0 > params.var_d7bfce72f2368972;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e
// Size: 0x6c
function function_8721b096ae4bee70() {
    if (function_8ffb283f4abc438()) {
        foreach (ally in self.var_ffddba74f404a30) {
            if (istrue(ally.inlaststand)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2
// Size: 0x6c
function function_9505d2ab79b97ea() {
    if (function_662d73af81c49696()) {
        foreach (enemy in self.var_5a532b3d41b19c7a) {
            if (istrue(enemy.inlaststand)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336
// Size: 0x57
function function_622045a32f8f175a(dist) {
    buystation = function_c1ac85f526f2b937(level.br_armory_kiosk.scriptables, self.origin, dist);
    if (isdefined(buystation)) {
        self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2 = buystation;
        return 1;
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395
// Size: 0x3d
function function_a568dfa416def0b(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_9130f52078745877));
    #/
    return function_622045a32f8f175a(params.var_9130f52078745877);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da
// Size: 0xa6
function function_f95baec9742916bf() {
    self.var_657f5a0d17435bc.var_835249b5749ef6cc = function_83964876b5d39a1e();
    foreach (var_835249b5749ef6cc in self.var_657f5a0d17435bc.var_835249b5749ef6cc) {
        if (isdefined(var_835249b5749ef6cc) && isdefined(var_835249b5749ef6cc.team) && var_835249b5749ef6cc.team == self.team) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x488
// Size: 0x10b
function function_44b193482fcaf1a4(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_38bb163d3f371e2b));
    #/
    if (self.var_657f5a0d17435bc.var_835249b5749ef6cc.size > 0) {
        foreach (loadoutdrop in self.var_657f5a0d17435bc.var_835249b5749ef6cc) {
            if (isdefined(loadoutdrop) && isdefined(loadoutdrop.team)) {
                if (loadoutdrop.team == self.team && distance(loadoutdrop.origin, self.origin) <= params.var_38bb163d3f371e2b) {
                    self.var_657f5a0d17435bc.var_495bb1c9678267c7 = loadoutdrop;
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59b
// Size: 0xd3
function function_ab9169e967fe63e1(radius) {
    var_835249b5749ef6cc = function_83964876b5d39a1e();
    var_80b84ab7ed418936 = sortbydistancecullbyradius(var_835249b5749ef6cc, self.origin, radius);
    foreach (var_3a16b8bc1dc35a77 in var_80b84ab7ed418936) {
        if (isdefined(var_3a16b8bc1dc35a77.team) && var_3a16b8bc1dc35a77.team == self.team) {
            self.var_657f5a0d17435bc.var_835249b5749ef6cc = var_835249b5749ef6cc;
            self.var_657f5a0d17435bc.var_495bb1c9678267c7 = var_3a16b8bc1dc35a77;
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x676
// Size: 0x17
function function_819ad84007c550d0() {
    return isdefined(self.var_657f5a0d17435bc.var_495bb1c9678267c7);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x695
// Size: 0x9
function function_880c8f3b2089065d() {
    return self isshooting();
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a6
// Size: 0xa
function function_15fc0739be906d50() {
    return !function_880c8f3b2089065d();
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0x60
function function_5226e5b60af668d6(params) {
    var_87c2a6b04de18b12 = 1;
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        var_87c2a6b04de18b12 = params.var_87c2a6b04de18b12;
    }
    return var_87c2a6b04de18b12 == self.var_657f5a0d17435bc.var_3cec2bc7bc141bed["GulagStarted"].isactive;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x720
// Size: 0x26
function function_86a11e66f57b7b07() {
    return self.var_657f5a0d17435bc.var_3cec2bc7bc141bed["PlayerShotByEnemy"].isactive;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74e
// Size: 0xa
function function_f66ebc45269b2970() {
    return !function_86a11e66f57b7b07();
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x760
// Size: 0x28
function function_36aef9bc7f44e7d4() {
    return !function_354a742e322499e9() && function_15fc0739be906d50() && function_671c7049215ebc9c() && isalive(self);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790
// Size: 0x43
function function_9c596dc74887fe3(params) {
    var_87c2a6b04de18b12 = 1;
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        var_87c2a6b04de18b12 = params.var_87c2a6b04de18b12;
    }
    return var_87c2a6b04de18b12 == function_36aef9bc7f44e7d4();
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db
// Size: 0x4d
function function_abfe9a8803709579(params) {
    var_87c2a6b04de18b12 = 1;
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        var_87c2a6b04de18b12 = params.var_87c2a6b04de18b12;
    }
    return var_87c2a6b04de18b12 == (function_36aef9bc7f44e7d4() && function_f656ad666eda6d08());
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x830
// Size: 0x46
function function_f64605f38a1c7a57(params) {
    var_87c2a6b04de18b12 = 1;
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        var_87c2a6b04de18b12 = params.var_87c2a6b04de18b12;
    }
    return self.var_f64605f38a1c7a57 == var_87c2a6b04de18b12;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87e
// Size: 0x4
function function_a0d0780ca5cb715d() {
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88a
// Size: 0x22
function function_668450a761b15bbf() {
    if (self function_e69d7896fa6e5d23() && self getclientomnvar("ui_requestRedeployButton_state") > 1) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b4
// Size: 0x4a
function function_4274d07f8bf2308b() {
    if (isdefined(self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_71aff0f17d48e44b)) {
        if (self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_71aff0f17d48e44b) {
            return 1;
        }
        return 0;
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x906
// Size: 0x1e
function function_662d73af81c49696() {
    if (isdefined(self.var_5a532b3d41b19c7a)) {
        return (self.var_5a532b3d41b19c7a.size > 0);
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92c
// Size: 0x1e
function function_354a742e322499e9() {
    if (isdefined(self.var_802de948f5f74d91)) {
        return (self.var_802de948f5f74d91.size > 0);
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x952
// Size: 0x1e
function function_8ffb283f4abc438() {
    if (isdefined(self.var_ffddba74f404a30)) {
        return (self.var_ffddba74f404a30.size > 0);
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x6e
function function_2c8de2b962f4fc26() {
    if (!function_662d73af81c49696()) {
        return 0;
    }
    foreach (currentenemy in self.var_5a532b3d41b19c7a) {
        if (isdefined(currentenemy) && currentenemy isshooting()) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ee
// Size: 0x4
function function_c390635b12ec704a() {
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fa
// Size: 0x87
function function_fad68735c883032b() {
    if (!function_662d73af81c49696()) {
        return 0;
    }
    foreach (currentenemy in self.var_5a532b3d41b19c7a) {
        if (!isalive(currentenemy)) {
            self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.killedenemy = currentenemy;
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa89
// Size: 0x27
function function_6d7cbc5dcde6ff99() {
    if (self.var_657f5a0d17435bc.var_9fd058151789294e.var_afc287eec64aeb6e) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab8
// Size: 0x12c
function function_123bc3d0aa752e3(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.mindistance));
    #/
    /#
        assert(isdefined(params.maxdistance));
    #/
    mindistance = params.mindistance;
    maxdistance = params.maxdistance;
    for (i = 0; i < level.var_305547d6de59eba4.var_da1e4ded7db0b78.size; i++) {
        var_a122dc255eee8cfa = getlootscriptablearrayinradius(level.var_305547d6de59eba4.var_da1e4ded7db0b78[i], undefined, self.origin, maxdistance);
        if (var_a122dc255eee8cfa.size >= 1) {
            cash = var_a122dc255eee8cfa[0];
            dist = distance2d(cash.origin, self.origin);
            if (dist >= mindistance) {
                self.var_657f5a0d17435bc.var_9fd058151789294e.var_d02731f86e1479e = cash;
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbec
// Size: 0x23
function function_7c5dfff988309ee4() {
    self.var_657f5a0d17435bc.var_9fd058151789294e.var_977a0264ee6a021b = 1;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc16
// Size: 0x5b
function function_56bce0dd2a67cf34(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_87c2a6b04de18b12));
    #/
    return params.var_87c2a6b04de18b12 == function_ad5378568b077260(self.var_657f5a0d17435bc.var_9fd058151789294e.var_d02731f86e1479e);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc79
// Size: 0x77
function function_bbd2783c3e7345fc(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_e003733bba588f4b));
    #/
    return function_e626332ad1bd82b(self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_ce7f7e62df1e0b51, params.var_e003733bba588f4b, self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_ce7f7e62df1e0b51);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf8
// Size: 0x77
function function_7289fada7729b540(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_e003733bba588f4b));
    #/
    return function_6db11cec60fc60c3(self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_ce7f7e62df1e0b51, params.var_e003733bba588f4b, self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_ce7f7e62df1e0b51);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd77
// Size: 0x77
function function_e0b7c71c5daeb031(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_f933abfe96db9b2a));
    #/
    return function_e626332ad1bd82b(self.var_657f5a0d17435bc.var_9fd058151789294e.var_ce7f7e62df1e0b51, params.var_f933abfe96db9b2a, self.var_657f5a0d17435bc.var_9fd058151789294e.waypoint);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf6
// Size: 0x26
function function_9e4d6fd1defdf215() {
    return !isalive(self.var_657f5a0d17435bc.var_9daf1075af0426fa.var_8b6f5f93a32bba7f);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe24
// Size: 0x64
function function_f0315489a7acb7ce(allies) {
    if (!isdefined(allies)) {
        return undefined;
    }
    foreach (ally in allies) {
        if (!isalive(ally)) {
            return ally;
        }
    }
    return undefined;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe90
// Size: 0x12
function function_259117d315c099f7() {
    return function_f0315489a7acb7ce(self.var_8f1c3552aeddaffe);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeaa
// Size: 0x12
function function_1789e06bc3ff8ab8() {
    return function_f0315489a7acb7ce(self.var_ffddba74f404a30);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec4
// Size: 0xe7
function function_fdb35dcaa8fd2721(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_69fc8669a623577));
    #/
    var_746ee2b5d4b4096 = self.var_8f1c3552aeddaffe;
    if (istrue(params.var_f0c18e87eb4091e9)) {
        var_746ee2b5d4b4096 = self.var_ffddba74f404a30;
    }
    if (!isdefined(var_746ee2b5d4b4096)) {
        return 0;
    }
    var_69fc8669a623577 = params.var_69fc8669a623577;
    foreach (ally in var_746ee2b5d4b4096) {
        if (!isalive(ally)) {
            self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5 = ally;
            return var_69fc8669a623577;
        } else if (!var_69fc8669a623577) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb3
// Size: 0x3c
function function_2337e40a59f43525() {
    if (isdefined(self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5) && function_bbd25202175d7f6f(self, self.var_657f5a0d17435bc.var_b80e4d5abb5c9ab5)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff7
// Size: 0xb0
function function_be08a1ca7db75f87() {
    wait(1);
    var_d115192f0643e610 = self getcurrentprimaryweapon();
    foreach (var_7dd111824a117dc6 in self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_c4473688e477750f) {
        if (var_d115192f0643e610.basename == var_7dd111824a117dc6) {
            return 0;
        }
    }
    if (self.var_657f5a0d17435bc.var_cd0ce7cfecde4c03.var_7803c95645e637e1 != var_d115192f0643e610) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10af
// Size: 0x52
function function_6985f6c8a8a0bd07(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_fcf2301d78f01b4a));
    #/
    if (self.var_657f5a0d17435bc.var_876a294e1e939f4d >= params.var_fcf2301d78f01b4a) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1109
// Size: 0x4d
function function_27f1fd373a18261d(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_38bac1117024a027));
    #/
    if (function_8ffb283f4abc438()) {
        return (self.var_ffddba74f404a30.size == params.var_38bac1117024a027);
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115e
// Size: 0x68
function function_6c1c1ead6b70e1c3() {
    if (function_8ffb283f4abc438()) {
        foreach (ally in self.var_ffddba74f404a30) {
            if (!ally isonground()) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ce
// Size: 0x41
function function_b4bad76d800e3c31(params) {
    returnvalue = self function_793f941d7dff15ed();
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1217
// Size: 0x56
function function_42f01a7fa51acc0d(params) {
    returnvalue = self function_793f941d7dff15ed() && self == function_ee15cb02c86edc6e(self.vehicle);
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1275
// Size: 0x86
function function_43c18a687082c9da(params) {
    if (isdefined(self.var_657f5a0d17435bc.var_ebf862078b683a7a.var_2f8a41afc9ebef12.itemsdropped)) {
        if (isdefined(self.lootcachesopened)) {
            if (self.lootcachesopened == self.var_657f5a0d17435bc.lootcachesopened) {
                return 1;
            }
        } else if (self.var_657f5a0d17435bc.lootcachesopened == 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1303
// Size: 0x41
function function_7683071fc5964c33(params) {
    returnvalue = namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c();
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134c
// Size: 0x38
function function_d022875f2be5b645(params) {
    if (istrue(level.allowarmor)) {
        var_364d691b501cd27f = namespace_f8d3520d3483c1::function_600f6cf462e983f();
        if (var_364d691b501cd27f > 0) {
            return namespace_f8d3520d3483c1::function_cf37789d18fbcc1b();
        }
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138c
// Size: 0x4f
function function_e30301bae6ed65ff(params) {
    returnvalue = istrue(self.var_657f5a0d17435bc.var_f53e4d63ed87d5ae);
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e3
// Size: 0x4f
function function_a111169120d293f1(params) {
    returnvalue = istrue(self.var_657f5a0d17435bc.hasgasmask);
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143a
// Size: 0x58
function function_58ae2c8bf0d7f02a(params) {
    vel = self getvelocity();
    returnvalue = length2dsquared(vel) > 0;
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149a
// Size: 0x41
function function_2f7d7c2996abfea8(params) {
    returnvalue = self issprinting();
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e3
// Size: 0x41
function function_38e99fd653b542a9(params) {
    returnvalue = self isswimming();
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152c
// Size: 0x5f
function function_e6f52eecebd10805(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_d0bcf6f61133d7fd));
    #/
    tablet = namespace_1eb3c4e0e28fac71::function_531ddda805acc45a(params.var_d0bcf6f61133d7fd);
    self.var_657f5a0d17435bc.var_352cb060814cbdf8 = tablet;
    return isdefined(tablet);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1593
// Size: 0x4f
function function_46ca0b958a36b825(params) {
    returnvalue = istrue(self.var_657f5a0d17435bc.var_575ab8e8d68fbb42);
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ea
// Size: 0x4f
function function_ce4fe8f13ca3b928(params) {
    returnvalue = istrue(self.var_657f5a0d17435bc.var_578b4e77a6bbe4c3);
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (params.var_87c2a6b04de18b12 == returnvalue);
    }
    return returnvalue;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1641
// Size: 0xa3
function function_77f548b16a31cb03(bot) {
    self waittill("waypoint_active");
    self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_ce7f7e62df1e0b51 = namespace_3c37cb17ade254d::drop_to_ground(bot.origin, 100) + (0, 0, 1);
    self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.waypoint = function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_25d8f562f9f2daa3.var_ce7f7e62df1e0b51, "FTUE_MOBILE/PICK_UP_LOOT", "icon_waypoint_objective_general", 25, self, 1);
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16eb
// Size: 0x54
function function_e626332ad1bd82b(position, var_78b3a92fcadd7914, item) {
    if (isdefined(item)) {
        dist = distance(position, self.origin);
        maxdistance = var_78b3a92fcadd7914 + var_78b3a92fcadd7914 * 0.2;
        return (dist >= maxdistance);
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1747
// Size: 0x54
function function_6db11cec60fc60c3(position, var_78b3a92fcadd7914, item) {
    if (isdefined(item)) {
        dist = distance(position, self.origin);
        mindistance = var_78b3a92fcadd7914 + var_78b3a92fcadd7914 * 0.2;
        return (dist <= mindistance);
    }
    return 0;
}

// Namespace namespace_ffa603a76a04fdbe/namespace_ba266451167c225d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17a3
// Size: 0x29
function function_43c47cf181121e3() {
    params = spawnstruct();
    params.amount = 4000;
    return function_a380cf8dd38a32ee(params);
}

