// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;

#namespace namespace_71a41ba7aee93481;

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc
// Size: 0x53
function function_df7ab5b0f898e8bc(var_da8e323244828792, var_ec2ec5f083df61cd) {
    if (!isdefined(level.var_7233e8ba4d09f124)) {
        level.var_7233e8ba4d09f124 = [];
    }
    /#
        assertex(!isdefined(level.var_7233e8ba4d09f124[var_da8e323244828792]), "Killstreak Init function redefinition.");
    #/
    level.var_7233e8ba4d09f124[var_da8e323244828792] = var_ec2ec5f083df61cd;
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336
// Size: 0x3b
function function_e6b85ed486916bf1(var_1002ceb046a0d0f8) {
    if (!isdefined(level.var_7233e8ba4d09f124)) {
        return;
    }
    var_ec2ec5f083df61cd = level.var_7233e8ba4d09f124[var_1002ceb046a0d0f8];
    if (!isdefined(var_ec2ec5f083df61cd)) {
        return;
    }
    level [[ var_ec2ec5f083df61cd ]]();
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x2bb
function function_1f9e754f6b690e33(var_7b462cbed77404a0) {
    if (!isdefined(var_7b462cbed77404a0)) {
        return 0;
    }
    var_584994fab4a8712b = level.var_b23156d776b1d85;
    if (isdefined(var_584994fab4a8712b.var_38f2a11237246ac)) {
        return 0;
    }
    var_584994fab4a8712b.var_38f2a11237246ac = [];
    var_584994fab4a8712b.var_2150da9328528bb9 = [];
    var_20ee381602c954db = getscriptbundle(var_7b462cbed77404a0);
    if (!isdefined(var_20ee381602c954db)) {
        return 0;
    }
    foreach (index, var_cc673384f6943c85 in var_20ee381602c954db.var_386a08793af08e6c) {
        if (!isnumber(index)) {
            continue;
        }
        if (!isdefined(var_cc673384f6943c85)) {
            continue;
        }
        var_5ad12d18e74c1f78 = var_cc673384f6943c85.bundle;
        if (!isdefined(var_5ad12d18e74c1f78)) {
            continue;
        }
        /#
            assert(function_73e183e02834309d(var_5ad12d18e74c1f78));
        #/
        if (var_5ad12d18e74c1f78 == %"hash_6c0bd35c2f752777") {
            continue;
        }
        if (var_5ad12d18e74c1f78 == %"hash_40daaf59ab8992e5") {
            continue;
        }
        bundle = getscriptbundle(var_5ad12d18e74c1f78);
        if (!isdefined(bundle)) {
            continue;
        }
        var_2b7cf61af0cb9960 = bundle.killstreakref;
        if (!isdefined(var_2b7cf61af0cb9960) || var_2b7cf61af0cb9960 == "none") {
            /#
                assert(isdefined(var_2b7cf61af0cb9960));
            #/
        } else {
            bundle.var_19fb085453713468 = var_5ad12d18e74c1f78;
            function_2ff74098fad17213(var_cc673384f6943c85, var_2b7cf61af0cb9960);
            var_584994fab4a8712b.var_38f2a11237246ac[var_2b7cf61af0cb9960] = bundle;
            var_584994fab4a8712b.var_2150da9328528bb9[var_2b7cf61af0cb9960] = index;
            /#
                assert(isstring(var_2b7cf61af0cb9960));
            #/
            var_1002ceb046a0d0f8 = function_1823ff50bb28148d(var_2b7cf61af0cb9960);
            game["dialog"][var_1002ceb046a0d0f8] = "killstreak_team_leader" + "_earned";
            game["dialog"][var_2b7cf61af0cb9960 + "_teamleader_friendly_inbound"] = "killstreak_team_leader" + "_ally_callout";
            game["dialog"][var_2b7cf61af0cb9960 + "_teamleader_enemy_inbound"] = "killstreak_team_leader" + "_enemy_callout";
            game["dialog"][var_2b7cf61af0cb9960 + "_teamleader_destroyed"] = "killstreak_team_leader" + "_crash";
            game["dialog"][var_2b7cf61af0cb9960 + "_teamleader_timeout"] = "killstreak_team_leader" + "_timeout";
            streakpoints = bundle.score;
            if (isdefined(streakpoints) && streakpoints > 0) {
                function_83823ec7b243d291(function_2ef675c13ca1c4af(#"killstreak_", var_2b7cf61af0cb9960), #"value", streakpoints);
            }
            function_e6b85ed486916bf1(function_1823ff50bb28148d(var_2b7cf61af0cb9960));
            if (istrue(level.var_63121fffa39a5238)) {
                [[ level.var_b8057c65baf0784a.var_d9f305202f6f3913 ]](bundle);
            }
        }
    }
    return 1;
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b
// Size: 0x5a
function function_2ff74098fad17213(var_cc673384f6943c85, var_acde90128b823518) {
    if (!isdefined(var_cc673384f6943c85.ref)) {
        /#
            assert(isdefined(var_cc673384f6943c85.ref));
        #/
        return;
    }
    if (var_acde90128b823518 == "replace_me") {
        return;
    }
    /#
        assert(var_acde90128b823518 == var_cc673384f6943c85.ref);
    #/
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69c
// Size: 0x72
function killstreak_savenvgstate() {
    if (!isdefined(self.pers["useNVG"])) {
        return;
    }
    if (self isnightvisionon()) {
        self.pers["useNVG"] = 1;
        self.pers["killstreak_forcedNVGOff"] = 1;
        self nightvisionviewoff(1);
    } else {
        self.pers["useNVG"] = 0;
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x715
// Size: 0x44
function killstreak_restorenvgstate() {
    if (!isdefined(self.pers["useNVG"])) {
        return;
    }
    if (istrue(self.pers["useNVG"])) {
        self nightvisionviewon(1);
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x760
// Size: 0x10d
function function_aa5200593ca327d2() {
    if (isdefined(level.var_49071332a2a99c1e)) {
        function_c0b0a582ff9e4d57(level.var_49071332a2a99c1e);
    }
    function_c0b0a582ff9e4d57("killstreak_thermal");
    function_c0b0a582ff9e4d57("killstreak_thermal_fog");
    function_c0b0a582ff9e4d57("killstreak_flash", 0.1);
    function_c0b0a582ff9e4d57("killstreak_static", 0.1);
    function_c0b0a582ff9e4d57("killstreak_slamzoom", 0.1);
    function_c0b0a582ff9e4d57("killstreak_color_light_damage", 0.1, 0.1, 0.3);
    function_c0b0a582ff9e4d57("killstreak_color_heavy_damage", 0.1, 0.2, 0.5);
    function_c0b0a582ff9e4d57("killstreak_thermal_light_damage", 0.1, 0.1, 0.3);
    function_c0b0a582ff9e4d57("killstreak_thermal_heavy_damage", 0.1, 0.2, 0.5);
    function_c0b0a582ff9e4d57("killstreak_ads_shutter", 0.25, 0.1, 0.25);
    function_c0b0a582ff9e4d57("killstreak_weapon_change_shutter", 0.025, 0.08, 0.15);
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x874
// Size: 0xca
function function_c0b0a582ff9e4d57(visionsetname, fadeintime, var_e3c85f91f65e524e, fadeouttime) {
    if (!isdefined(level.var_e64bad01ded4573a)) {
        level.var_e64bad01ded4573a = [];
    } else if (isdefined(level.var_e64bad01ded4573a[visionsetname])) {
        return;
    }
    var_91aaff4f33c3af2f = spawnstruct();
    var_91aaff4f33c3af2f.name = visionsetname;
    var_91aaff4f33c3af2f.type = function_a8f5c03158446d60(visionsetname);
    if (!isdefined(fadeintime)) {
        fadeintime = 0;
    }
    var_91aaff4f33c3af2f.fadeintime = fadeintime;
    if (!isdefined(var_e3c85f91f65e524e)) {
        var_e3c85f91f65e524e = 0;
    }
    var_91aaff4f33c3af2f.var_e3c85f91f65e524e = var_e3c85f91f65e524e;
    if (!isdefined(fadeouttime)) {
        fadeouttime = 0;
    }
    var_91aaff4f33c3af2f.fadeouttime = fadeouttime;
    level.var_e64bad01ded4573a[visionsetname] = var_91aaff4f33c3af2f;
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x945
// Size: 0x46
function function_a8f5c03158446d60(visionsetname) {
    var_e2fdcc34a6c1fab4 = undefined;
    if (issubstr(visionsetname, "thermal")) {
        var_e2fdcc34a6c1fab4 = "thermal";
    } else if (issubstr(visionsetname, "color")) {
        var_e2fdcc34a6c1fab4 = "color";
    }
    return var_e2fdcc34a6c1fab4;
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x993
// Size: 0x2d
function function_58707ddfdd9744fa(visionsetname) {
    var_91aaff4f33c3af2f = function_3de44eb7cdde2614(visionsetname);
    if (!isdefined(var_91aaff4f33c3af2f)) {
        return;
    }
    thread function_a271c8ce1dd6c1b1(var_91aaff4f33c3af2f);
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c7
// Size: 0x5a
function function_c144de677d9b9175(visionsetname, var_7fb54361d482eaee) {
    var_f8a4e2fb1e692dd3 = function_a8f5c03158446d60(visionsetname);
    if (!isdefined(var_7fb54361d482eaee)) {
        var_7fb54361d482eaee = "light";
    }
    var_626861338e8cfb84 = "killstreak_" + var_f8a4e2fb1e692dd3 + "_" + var_7fb54361d482eaee + "_damage";
    function_58707ddfdd9744fa(var_626861338e8cfb84);
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa28
// Size: 0x4e
function function_3de44eb7cdde2614(visionsetname) {
    if (!isdefined(level.var_e64bad01ded4573a) || !isdefined(visionsetname) || !isdefined(level.var_e64bad01ded4573a[visionsetname])) {
        /#
            /#
                assertmsg("color");
            #/
        #/
        return undefined;
    }
    return level.var_e64bad01ded4573a[visionsetname];
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7e
// Size: 0x1af
function function_51afe751c1e36723(var_e127af0eab592c1a, var_e127ae0eab5929e7, var_e127ad0eab5927b4, var_e127ac0eab592581, var_e127ab0eab59234e, var_e127aa0eab59211b) {
    ent = spawnstruct();
    if (isdefined(var_e127af0eab592c1a)) {
        thread function_e91e598bf5bb2ee5(var_e127af0eab592c1a, ent);
    }
    if (isdefined(var_e127ae0eab5929e7)) {
        thread function_e91e598bf5bb2ee5(var_e127ae0eab5929e7, ent);
    }
    if (isdefined(var_e127ad0eab5927b4)) {
        thread function_e91e598bf5bb2ee5(var_e127ad0eab5927b4, ent);
    }
    if (isdefined(var_e127ac0eab592581)) {
        thread function_e91e598bf5bb2ee5(var_e127ac0eab592581, ent);
    }
    if (isdefined(var_e127ab0eab59234e)) {
        thread function_e91e598bf5bb2ee5(var_e127ab0eab59234e, ent);
    }
    if (isdefined(var_e127aa0eab59211b)) {
        thread function_e91e598bf5bb2ee5(var_e127aa0eab59211b, ent);
    }
    param8 = param7 = param6 = param5 = param4 = param3 = param2 = param1 = msg = ent waittill("returned");
    ent notify("die");
    var_df4b15ee230bf93a = spawnstruct();
    var_df4b15ee230bf93a.msg = msg;
    var_df4b15ee230bf93a.param1 = param1;
    var_df4b15ee230bf93a.param2 = param2;
    var_df4b15ee230bf93a.param3 = param3;
    var_df4b15ee230bf93a.param4 = param4;
    var_df4b15ee230bf93a.param5 = param5;
    var_df4b15ee230bf93a.param6 = param6;
    var_df4b15ee230bf93a.param7 = param7;
    var_df4b15ee230bf93a.param8 = param8;
    return var_df4b15ee230bf93a;
}

// Namespace namespace_71a41ba7aee93481/namespace_5890eaf13eeb48fa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc35
// Size: 0x7b
function function_e91e598bf5bb2ee5(msg, ent) {
    self endon("death");
    ent endon("die");
    param6 = param5 = param4 = param3 = param2 = param1 = self waittill(msg);
    ent notify("returned", msg);
}

