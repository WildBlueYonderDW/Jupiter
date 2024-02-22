// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_20a226c24f1585bf;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\mp_agent_damage.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;

#namespace namespace_c908de38bcdbd93d;

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x608
// Size: 0x2e3
function heli_spawn(var_20511bb18fa92fde, var_f1b55da19f091702, var_22aa4aa0cf0aa6bb, settings_bundle, var_d553022aa7804f03) {
    heli = undefined;
    var_f1b55da19f091702 = function_53c4c53197386572(var_f1b55da19f091702, 0);
    var_22aa4aa0cf0aa6bb = function_53c4c53197386572(var_22aa4aa0cf0aa6bb, 1);
    if (!isdefined(settings_bundle)) {
        settings_bundle = getscriptbundle("helicoptersettings:default_helicopter_settings");
    }
    if (!isdefined(settings_bundle)) {
        /#
            assertmsg("Could not load any Helicopter settings. Ensure helicoptersettings:default_helicopter_settings is in feature");
        #/
        return undefined;
    }
    spawndata = spawnstruct();
    spawndata.origin = var_20511bb18fa92fde.origin + (0, 0, 128);
    spawndata.angles = (0, 0, 0);
    if (isdefined(var_20511bb18fa92fde.angles)) {
        spawndata.angles = (0, var_20511bb18fa92fde.angles[1], 0);
    }
    spawndata.team = "team_hundred_ninety";
    var_5cd509db6b15e83 = settings_bundle.var_d56ec692ce5e7209;
    switch (var_5cd509db6b15e83) {
    case #"hash_174ce9a6344b18a4":
        spawndata.model = "veh9_mil_air_heli_hind_vehphys_mp";
        break;
    case #"hash_66c8846b85d8c948":
        spawndata.model = "veh9_mil_air_heli_palfa_vehphys_mp";
        break;
    case #"hash_bc31095b59d83674":
        spawndata.model = "veh9_mil_air_heli_blima_mp";
        spawndata.var_f16652e1462a3739 = 1;
        break;
    default:
        spawndata.model = "veh9_mil_air_heli_hind_vehphys_mp";
        break;
    }
    heli = vehicle_spawn(var_5cd509db6b15e83, spawndata);
    heli.var_22aa4aa0cf0aa6bb = var_22aa4aa0cf0aa6bb;
    if (isdefined(var_d553022aa7804f03)) {
        heli.var_81d4390e43c90346 = var_d553022aa7804f03;
    } else {
        heli.var_81d4390e43c90346 = &function_4c9ef1ed5aef03c7;
    }
    /#
        assertex(isdefined(heli), "heli_spawn: Did not spawn a valid heli!");
    #/
    if (getdvar(@"hash_1a8fc884f08fce8", "0") == "1") {
        heli function_9e96cdf67b925aa0();
        heli function_7dac0131a74b9e48();
        heli function_46f757d9ff2fdfcc();
        heli function_268f89699b68533e();
        heli function_324badbe006153();
        heli function_618793408ff0894a();
    } else {
        heli function_c96e4b15db766b84(settings_bundle);
    }
    heli.var_f1b55da19f091702 = var_f1b55da19f091702;
    heli function_d2da8cf28fb2d100(var_5cd509db6b15e83);
    heli function_fc4e8c5a8f831cab();
    if (istrue(heli.var_a7a02c81f965a3fe)) {
        heli.missileweapon = makeweapon(heli.var_ffd128d3b3bac67a);
    }
    if (istrue(heli.hasturret)) {
        heli namespace_d80401e4aca8c66f::function_403ee60da9709c3d(settings_bundle.turretsettings, "team_hundred_ninety", [0:"allies", 1:"team_two_hundred"], heli.var_81d4390e43c90346, 1);
    }
    return heli;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f3
// Size: 0x23
function function_fc4e8c5a8f831cab() {
    self endon("death");
    self endon("crashing");
    self endon("entitydeleted");
    /#
        childthread function_de3fc172a25ca50b();
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91d
// Size: 0x1bc
function private function_d2da8cf28fb2d100(var_5cd509db6b15e83) {
    self.usedpositions = [];
    self.var_494fe868127e6381 = self.speed;
    self.accel = 50;
    self.lifetime = 9999;
    self.team = "team_hundred_ninety";
    self.heightoffset = (0, 0, self.var_a32eb5da7024e7c4);
    self.var_1e0eb63ecb3f1e2 = 1;
    self.attackers = [];
    self setmaxpitchroll(30, 30);
    self vehicle_setspeed(self.speed, self.accel);
    if (self.var_f1b55da19f091702) {
        self sethoverparams(0, 0, 0);
    } else {
        self sethoverparams(self.hover_radius, self.hover_speed, self.hover_accel);
    }
    self setturningability(self.var_27b3267d1a2697dd);
    self setyawspeed(100, 25, 25, 0.1);
    self setcandamage(1);
    self setneargoalnotifydist(self.var_b7653ed508479202);
    self setvehicleteam(self.team);
    self.ignorelist = [0:self];
    self.crashoffset = self.var_a32eb5da7024e7c4 - 250;
    self.var_fd91112a53ea4fea = 1;
    self.damagestate = 3;
    namespace_6d9917c3dc05dbe9::registersentient("Level_Vehicle", self.team);
    thread function_e3ab01a91dc64df0();
    namespace_ad22b9cf6a2b30d::set_death_callback(self.vehiclename, &function_d9630ff97ef012cf);
    if (self.var_7472d0ddfd2019ca) {
        self.var_52dcdba485e7ceeb = "tag_origin";
        namespace_ad22b9cf6a2b30d::set_post_mod_damage_callback(self.vehiclename, &function_45cc03649256e6f3);
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae0
// Size: 0x62
function function_89891a51d22c497e(settings_bundle) {
    foreach (turret in self.turrets) {
        turret namespace_adca7bd47b8c5e04::function_9e96cdf67b925aa0(settings_bundle);
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb49
// Size: 0x39
function function_4782ceab7eadd844(death_callback) {
    if (!isdefined(self.deathcallbacks)) {
        self.deathcallbacks = [];
    }
    self.deathcallbacks[self.deathcallbacks.size] = death_callback;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb89
// Size: 0x6
function function_a4db8fd7d61d6687() {
    /#
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb96
// Size: 0x13d
function function_4c9ef1ed5aef03c7(vehicle) {
    function_3d8d8ad244283e65(#"hash_9aadbc16f4d5a77b");
    self endon("death");
    self endon("crashing");
    self endon("entitydeleted");
    self endon("target_acquired");
    canseetarget = 0;
    var_c3fbb6661b91750f = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 1, 0, 1, 1);
    var_b9d5783a4f34efbc = [0:self];
    childthread function_6967cf4bacd2142f();
    targets = vehicle function_cd5b61d2bbbf08ad([0:"team_two_hundred", 1:"allies"]);
    foreach (target_ent in targets) {
        if (!isdefined(target_ent)) {
            waitframe();
        } else if (isplayer(target_ent) && isalive(target_ent)) {
            if (istrue(function_618e0f50b9b8b310(target_ent))) {
                function_7f3923ed3d66f8ad();
                return target_ent;
            }
        } else {
            if (isalive(target_ent) && istrue(function_b5a44a788ec704f(target_ent))) {
                function_7f3923ed3d66f8ad();
                return target_ent;
            }
            waitframe();
        }
    }
    function_7f3923ed3d66f8ad();
    return undefined;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdb
// Size: 0x7a
function function_f307cefb91e4e283() {
    var_32ef60ceea7a7168 = 0;
    var_c1781275b3976ecf = undefined;
    foreach (var_8efef5b1e4d79b79, damage in self.attackers) {
        if (damage > var_32ef60ceea7a7168) {
            var_32ef60ceea7a7168 = damage;
            var_c1781275b3976ecf = getentbynum(var_8efef5b1e4d79b79);
        }
    }
    return var_c1781275b3976ecf;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5d
// Size: 0x10c
function function_618e0f50b9b8b310(player, var_3aabd49a2a48dd5a) {
    if (namespace_7e17181d03156026::isinlaststand(player) || istrue(player.ignoreme) || istrue(player.notarget)) {
        return 0;
    }
    if (!istrue(var_3aabd49a2a48dd5a) && function_93ff5e5ba263fc6d(self, player) < self.var_cc99a14e60508d29) {
        return 0;
    }
    var_c3fbb6661b91750f = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1);
    var_b9d5783a4f34efbc = [0:self];
    if (isdefined(player.vehicle)) {
        var_b9d5783a4f34efbc[var_b9d5783a4f34efbc.size] = player.vehicle;
        var_53023fda76fa64fe = player.vehicle getlinkedchildren();
        if (isdefined(var_53023fda76fa64fe) && var_53023fda76fa64fe.size > 0) {
            var_b9d5783a4f34efbc = array_combine(var_b9d5783a4f34efbc, var_53023fda76fa64fe);
        }
    }
    if (player tagexists("j_head")) {
        return namespace_2a184fc4902783dc::ray_trace_passed(self gettagorigin("tag_origin"), player gettagorigin("j_head"), var_b9d5783a4f34efbc, var_c3fbb6661b91750f);
    }
    return 0;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe71
// Size: 0xcd
function function_b5a44a788ec704f(ai) {
    if (function_93ff5e5ba263fc6d(self, ai) < self.var_cc99a14e60508d29) {
        return 0;
    }
    var_c3fbb6661b91750f = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 1, 0, 1, 1);
    var_b9d5783a4f34efbc = [0:self];
    if (isdefined(ai.vehicle) && isdefined(ai.vehicle_position)) {
        var_b9d5783a4f34efbc[var_b9d5783a4f34efbc.size] = ai.vehicle;
        var_53023fda76fa64fe = ai.vehicle getlinkedchildren();
        if (isdefined(var_53023fda76fa64fe) && var_53023fda76fa64fe.size > 0) {
            var_b9d5783a4f34efbc = array_combine(var_b9d5783a4f34efbc, var_53023fda76fa64fe);
        }
    }
    return namespace_2a184fc4902783dc::ray_trace_passed(self gettagorigin("tag_origin"), ai geteye(), var_b9d5783a4f34efbc, var_c3fbb6661b91750f);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf46
// Size: 0x58
function function_6967cf4bacd2142f() {
    self notify("heli_get_attacker_singleton");
    self endon("heli_get_attacker_singleton");
    while (1) {
        eattacker = idamage = self waittill("damage");
        /#
            iprintlnbold("hittype");
        #/
        self.current_target = eattacker;
        self notify("target_acquired");
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa5
// Size: 0x46
function function_fbb9f19c8d061491(time) {
    self endon("death");
    self endon("crashing");
    self endon("entitydeleted");
    time = function_53c4c53197386572(time, 20);
    self.var_b6e6b30178ec0f54 = 1;
    wait(time);
    self.var_b6e6b30178ec0f54 = 0;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff2
// Size: 0xa1
function function_cd5b61d2bbbf08ad(teams) {
    function_3d8d8ad244283e65(#"hash_9868c1c7bf64e461");
    if (!isdefined(teams)) {
        function_7f3923ed3d66f8ad();
        return [];
    }
    ai_array = [];
    foreach (s_team in teams) {
        ai_array = array_combine(ai_array, getaiarrayinradius(self.origin, self.var_e309f77b84ade0d9, s_team));
    }
    function_7f3923ed3d66f8ad();
    return ai_array;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109b
// Size: 0x1b
function function_966229df2aba3d79() {
    return namespace_7e17181d03156026::getplayersinradius(self.origin, self.var_e309f77b84ade0d9);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10be
// Size: 0x6
function function_5177db9fd4c16935() {
    /#
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x10cb
// Size: 0xfc
function function_7988d9c7d6393d8(start_node, var_7403e5e436347d6b, var_f1ff4c8c32027852, var_c070b40128ceccf4, var_a0953585793a7d3c, var_24c51e78424bbcba, var_50f65d9cdf36989e) {
    if (!isdefined(var_50f65d9cdf36989e)) {
        var_50f65d9cdf36989e = 0;
    }
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("stop_patrol_behavior");
    self endon("stop_all_action");
    while (1) {
        namespace_d80401e4aca8c66f::function_ed737153dc8baac7(self.var_81d4390e43c90346);
        childthread function_a99e82b41834f9a4();
        childthread function_bc77383cc0c4d3b9(start_node, var_7403e5e436347d6b, var_f1ff4c8c32027852);
        self waittill("target_acquired");
        if (!isdefined(var_a0953585793a7d3c) || isdefined(var_a0953585793a7d3c) && [[ var_a0953585793a7d3c ]](self, self.current_target)) {
            if (isdefined(var_24c51e78424bbcba)) {
                childthread function_efb6239d789d19f3(var_24c51e78424bbcba);
            }
            function_e9cef78943e169f4(undefined, var_c070b40128ceccf4, var_50f65d9cdf36989e);
        }
        start_node = self.var_b3ad7bc0c890232c;
        self setturningability(self.var_27b3267d1a2697dd);
        self setneargoalnotifydist(self.var_b7653ed508479202);
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11ce
// Size: 0x68
function private function_a99e82b41834f9a4(var_855c177366117677) {
    self notify("target_watcher_start");
    self endon("target_watcher_start");
    while (1) {
        if (isdefined(var_855c177366117677)) {
            targ = [[ var_855c177366117677 ]](self);
        } else {
            targ = [[ self.var_81d4390e43c90346 ]](self);
        }
        if (isdefined(targ)) {
            self notify("target_acquired");
            self.current_target = targ;
        }
        targ = undefined;
        wait(10);
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x123d
// Size: 0x34
function private function_efb6239d789d19f3(callback) {
    self waittill("start_combat");
    while (1) {
        if ([[ callback ]](self)) {
            self clearlookatent();
            self notify("stop_combat_behavior");
            return;
        }
        waitframe();
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1278
// Size: 0x6
function function_343f1b24108dc4c3() {
    /#
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1285
// Size: 0x9c
function function_5406a9661231bbda(target_ent) {
    self endon("stop_all_action");
    self.var_9ed6827753db2370 = 80;
    self.var_a7a02c81f965a3fe = 0;
    self setmaxpitchroll(20, 30);
    thread target_update(target_ent);
    if (isdefined(target_ent)) {
        self.current_target = target_ent;
    }
    if (istrue(self.var_a7a02c81f965a3fe)) {
        childthread function_a86f57c94f688e4c();
    }
    thread function_e0505640056c340c(target_ent);
    while (1) {
        if (isdefined(self.current_target)) {
            function_c726703023325c0a(self.current_target, 1, 0, 0, undefined, 2000, 1000, undefined, undefined);
        }
        waitframe();
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1328
// Size: 0x4a
function private function_e0505640056c340c(target_ent) {
    last_time = gettime();
    while (1) {
        if (gettime() - last_time > 15000) {
            self notify("missile_attack");
            function_90786c097a7d7433(target_ent);
            last_time = gettime();
        }
        waitframe();
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1379
// Size: 0x36
function private target_update(target_ent) {
    while (1) {
        self notify("new_orders");
        self.var_1ae978cf5dc05edb = target_ent.origin;
        wait(1);
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b6
// Size: 0x6
function function_774c6c9e717da747() {
    /#
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13c3
// Size: 0x87
function function_2fb28a9e4728e86a(var_949d9008fc020806, var_eb17d5c958e3fcda, var_855c177366117677, var_50f65d9cdf36989e) {
    if (!isdefined(var_50f65d9cdf36989e)) {
        var_50f65d9cdf36989e = 0;
    }
    self endon("stop_combat_behavior");
    self endon("stop_all_action");
    self endon("crashing");
    self endon("death");
    self notify("start_combat");
    if (!isdefined(var_949d9008fc020806)) {
        return;
    }
    self.in_combat = 1;
    function_ec247bbe9627170d(var_855c177366117677, var_50f65d9cdf36989e);
    function_9bf8b74a65eaa76(var_949d9008fc020806, 1, 1, 0, undefined, var_eb17d5c958e3fcda, undefined, undefined, undefined);
    self.in_combat = 0;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1451
// Size: 0xa6
function function_e9cef78943e169f4(target_ent, var_855c177366117677, var_50f65d9cdf36989e) {
    if (!isdefined(var_50f65d9cdf36989e)) {
        var_50f65d9cdf36989e = 0;
    }
    self endon("stop_combat_behavior");
    self endon("stop_all_action");
    self endon("crashing");
    self endon("death");
    self notify("start_combat");
    self.in_combat = 1;
    function_ec247bbe9627170d(var_855c177366117677, var_50f65d9cdf36989e);
    if (isdefined(target_ent)) {
        self.current_target = target_ent;
    }
    while (1) {
        if (isdefined(self.current_target)) {
            function_c726703023325c0a(self.current_target, 1, 1, 0, undefined, undefined, undefined, undefined, undefined);
        }
        waitframe();
    }
    self.in_combat = 0;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fe
// Size: 0x4d
function function_ec247bbe9627170d(var_855c177366117677, var_50f65d9cdf36989e) {
    if (!isdefined(var_50f65d9cdf36989e)) {
        var_50f65d9cdf36989e = 0;
    }
    if (isdefined(var_855c177366117677)) {
        namespace_d80401e4aca8c66f::function_ed737153dc8baac7(&function_2db62831ba7a2266);
    }
    childthread function_a99e82b41834f9a4(var_855c177366117677);
    if (istrue(self.var_a7a02c81f965a3fe)) {
        childthread function_a86f57c94f688e4c(var_50f65d9cdf36989e);
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1552
// Size: 0x17
function private function_2db62831ba7a2266(vehicle) {
    return vehicle.current_target;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1571
// Size: 0x1d0
function private function_a86f57c94f688e4c(var_f7589b807692205) {
    if (!isdefined(var_f7589b807692205)) {
        var_f7589b807692205 = 0;
    }
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self.var_1dc887e33d97a12e = gettime();
    while (1) {
        time_elapsed = gettime() - self.var_1dc887e33d97a12e;
        if (time_elapsed > self.var_a339df2b58c46b8e) {
            var_d7c0916e3b52fc63 = self.current_target;
            if (var_f7589b807692205) {
                if (isplayer(var_d7c0916e3b52fc63) && !function_618e0f50b9b8b310(var_d7c0916e3b52fc63)) {
                    wait(1);
                    continue;
                } else if (isai(var_d7c0916e3b52fc63) && !function_b5a44a788ec704f(var_d7c0916e3b52fc63)) {
                    wait(1);
                    continue;
                }
            }
            if (isdefined(var_d7c0916e3b52fc63)) {
                pitch = getpitchtospot3d(var_d7c0916e3b52fc63.origin);
                if (pitch > self.var_da6ccdbfcffb23b1) {
                    waitframe();
                    continue;
                }
                vector_to_target = function_767cea82b001f645(var_d7c0916e3b52fc63.origin - self.origin);
                var_61feebd99774d8 = self.origin + vector_to_target * 4000;
                var_691aa1d5da533612 = function_56ebd2471f52c901(self.origin, var_61feebd99774d8, 325, self.ignorelist);
                var_738caee3d4576e5c = var_691aa1d5da533612["hittype"] == "hittype_none";
                if (!var_738caee3d4576e5c) {
                    wait(1);
                    continue;
                }
                self notify("resume_circling");
                thread function_b91a289ed9de4db7(undefined, 1);
                self waittill("circling_paused");
                wait(1);
                function_2029e383e2ec901(var_d7c0916e3b52fc63);
                waittill_any_ents(self, "strafe_complete", var_d7c0916e3b52fc63, "death");
                self.var_1dc887e33d97a12e = gettime();
                self notify("resume_circling");
            }
        }
        waitframe();
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1748
// Size: 0x6
function function_efc08e4ed244673b() {
    /#
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1755
// Size: 0x1c9
function function_bc77383cc0c4d3b9(start_node, var_7403e5e436347d6b, var_cddc894ccdf6de54, isdrone) {
    self notify("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("new_orders");
    self endon("stop_all_action");
    if (!isdefined(start_node)) {
        /#
            assertmsg("Start node in heli path is undefined");
        #/
        return;
    }
    self.var_b3ad7bc0c890232c = start_node;
    path_end = 0;
    self setturningability(self.var_27b3267d1a2697dd);
    self setneargoalnotifydist(self.var_b7653ed508479202);
    while (!path_end) {
        var_6c814cee8d2bd65e = 0;
        if (!isdefined(self.var_b3ad7bc0c890232c.target)) {
            var_6c814cee8d2bd65e = 1;
            path_end = 1;
        }
        function_d6eba8149fb949e9(self.var_b3ad7bc0c890232c, path_end, var_7403e5e436347d6b, 1, undefined, undefined, var_cddc894ccdf6de54, undefined, undefined, isdrone, 0);
        if (!path_end) {
            if (issharedfuncdefined("activity_chopper_util", "CustomPathNextTarget")) {
                self.var_b3ad7bc0c890232c = function_f3bb4f4911a1beb2("activity_chopper_util", "CustomPathNextTarget", self, self.var_b3ad7bc0c890232c.target);
            } else if (isstruct(self.var_b3ad7bc0c890232c)) {
                self.var_b3ad7bc0c890232c = getstruct(self.var_b3ad7bc0c890232c.target, "targetname");
            } else if (isent(self.var_b3ad7bc0c890232c)) {
                self.var_b3ad7bc0c890232c = getent(self.var_b3ad7bc0c890232c.target, "targetname");
            } else {
                self.var_b3ad7bc0c890232c = getvehiclenode(self.var_b3ad7bc0c890232c.target, "targetname");
            }
        }
        waitframe();
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1925
// Size: 0xc6
function function_a2262da7c12166e1(position, n_height, var_ee8f5e47723db930, isdrone) {
    self endon("stop_all_action");
    wait(0.5);
    speed_override = 80;
    var_a26584f02cd77948 = 18;
    self.var_b3225133eb7f5842 = self.var_b3225133eb7f5842 + 180;
    self.var_b3225133eb7f5842 = angleclamp(self.var_b3225133eb7f5842);
    vector_to_target = function_767cea82b001f645(position - self.origin);
    var_61feebd99774d8 = self.origin + vector_to_target * var_ee8f5e47723db930;
    function_d6eba8149fb949e9(var_61feebd99774d8, undefined, n_height, 0, undefined, undefined, speed_override, var_a26584f02cd77948, 1, isdrone);
    self notify("strafe_complete");
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f2
// Size: 0x1da
function function_21c899c9bbaf0adc(var_5eaa2d980f1cc4b4, var_4885ccb2d176409, var_7d1523a65b5c8edd, var_451cc3c179e7ce9d, var_b378f2f34da95ed5) {
    if (!isdefined(var_4885ccb2d176409)) {
        var_4885ccb2d176409 = 100;
    }
    if (!isdefined(var_7d1523a65b5c8edd)) {
        var_7d1523a65b5c8edd = 15000;
    }
    if (!isdefined(var_451cc3c179e7ce9d)) {
        var_451cc3c179e7ce9d = 15000;
    }
    if (!isdefined(var_b378f2f34da95ed5)) {
        var_b378f2f34da95ed5 = 1;
    }
    if (var_5eaa2d980f1cc4b4) {
        self notify("stop_all_action");
    }
    self endon("stop_all_action");
    if (istrue(var_b378f2f34da95ed5)) {
        foreach (turret in self.turrets) {
            turret namespace_adca7bd47b8c5e04::function_917a46654478df92();
        }
    }
    self clearlookatent();
    function_d6eba8149fb949e9(self.origin + (0, 0, 1500), 0, 0, 0, undefined, undefined, var_4885ccb2d176409, undefined, 1);
    result = 0;
    var_e57aabbdb1b44208 = [0:anglestoforward(self.angles), 1:anglestoleft(self.angles), 2:anglestoright(self.angles), 3:anglestoforward(self.angles) * -1, 4:anglestoup(self.angles)];
    idx = 0;
    while (!result && idx < var_e57aabbdb1b44208.size) {
        direction = var_e57aabbdb1b44208[idx];
        var_57d125e36a7ac9c1 = self.origin + direction * (var_7d1523a65b5c8edd, var_7d1523a65b5c8edd, 0) + (0, 0, var_451cc3c179e7ce9d);
        result = function_d6eba8149fb949e9(var_57d125e36a7ac9c1, 0, 0, 0, undefined, undefined, 70, undefined, 1);
        idx++;
        wait(0.3);
    }
    self delete();
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd3
// Size: 0x84
function function_c726703023325c0a(var_d6dfead8a1d3957e, var_31759f0a1036d495, var_4aed5403298a4d7f, var_25b8738ccc2f5e33, var_aaa98411bc77fb1f, var_29c1049cdd91eb32, var_64459132907ac449, var_41976210805f0afe, var_a22b586ea0f535ef, isdrone) {
    self.var_53322caaa0b66e6b = var_d6dfead8a1d3957e;
    function_17f3a8e08dd28e75(var_d6dfead8a1d3957e.origin, var_31759f0a1036d495, var_4aed5403298a4d7f, var_25b8738ccc2f5e33, var_aaa98411bc77fb1f, &function_68fca835889ce704, var_29c1049cdd91eb32, var_64459132907ac449, var_41976210805f0afe, var_a22b586ea0f535ef, 1, isdrone);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5e
// Size: 0x4a
function function_68fca835889ce704(heli) {
    if (is_dead_or_dying(heli.var_53322caaa0b66e6b)) {
        heli.var_53322caaa0b66e6b = undefined;
        heli notify("stop_circling");
        return undefined;
    }
    return heli.var_53322caaa0b66e6b.origin;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb0
// Size: 0x73
function function_9bf8b74a65eaa76(var_ce5c8b45f5bf97e8, var_31759f0a1036d495, var_4aed5403298a4d7f, var_25b8738ccc2f5e33, var_aaa98411bc77fb1f, var_eb17d5c958e3fcda, var_29c1049cdd91eb32, var_64459132907ac449, var_41976210805f0afe, var_a22b586ea0f535ef, isdrone) {
    function_17f3a8e08dd28e75(var_ce5c8b45f5bf97e8, var_31759f0a1036d495, var_4aed5403298a4d7f, var_25b8738ccc2f5e33, var_aaa98411bc77fb1f, var_eb17d5c958e3fcda, var_29c1049cdd91eb32, var_64459132907ac449, var_41976210805f0afe, var_a22b586ea0f535ef, isdrone);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params c, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d2a
// Size: 0x76a
function private function_17f3a8e08dd28e75(var_ce5c8b45f5bf97e8, var_31759f0a1036d495, var_4aed5403298a4d7f, var_25b8738ccc2f5e33, var_aaa98411bc77fb1f, var_eb17d5c958e3fcda, var_29c1049cdd91eb32, var_64459132907ac449, var_41976210805f0afe, var_3a036abee5c890ba, var_a8a0386803dbfec9, isdrone) {
    self notify("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("stop_circling");
    self endon("stop_all_action");
    self setneargoalnotifydist(self.var_1daf2fa3c00569fa);
    self setturningability(self.var_5bee9b82a537f1c0);
    var_e3ef073dd9338298 = getdvarint(@"hash_2c1d3a8768e5e585", 0);
    self.var_1ae978cf5dc05edb = var_ce5c8b45f5bf97e8 + (0, 0, self.var_99a6191cb152b5d2);
    var_d1d5a4e841132f8c = undefined;
    var_d5e8237d157774ec = undefined;
    var_31759f0a1036d495 = function_53c4c53197386572(var_31759f0a1036d495, 0);
    var_4aed5403298a4d7f = function_53c4c53197386572(var_4aed5403298a4d7f, 0);
    if (isdefined(var_64459132907ac449)) {
        self.var_99a6191cb152b5d2 = var_64459132907ac449;
    }
    /#
        assertex(isdefined(self.var_1ae978cf5dc05edb), "Undefined heli circle position!");
    #/
    n_current_distance = distance2d(self.origin, self.var_1ae978cf5dc05edb);
    var_f0a3055b7b71a641 = randomintrange(self.var_253f4378e43c9755, self.var_25622d78e462aeab);
    if (isdefined(var_29c1049cdd91eb32)) {
        var_f0a3055b7b71a641 = var_29c1049cdd91eb32;
    }
    if (n_current_distance < var_f0a3055b7b71a641) {
        var_f0a3055b7b71a641 = max(n_current_distance, self.var_253f4378e43c9755);
    }
    var_aea88efa8310a0d7 = self.var_34226496d5530b2a;
    if (isdefined(var_3a036abee5c890ba)) {
        var_aea88efa8310a0d7 = var_3a036abee5c890ba * var_3a036abee5c890ba;
    } else if (isdefined(self.var_aea88efa8310a0d7)) {
        var_aea88efa8310a0d7 = self.var_aea88efa8310a0d7 * self.var_aea88efa8310a0d7;
    }
    var_738caee3d4576e5c = 0;
    var_51dcb1b433d8841e = 0;
    while (!var_738caee3d4576e5c) {
        self.var_b3225133eb7f5842 = function_e3a3b10fbf64512d(self.var_1ae978cf5dc05edb, var_f0a3055b7b71a641, var_51dcb1b433d8841e);
        var_528d52dd307b6f07 = 32;
        var_d79710942c3153ae = 360 / var_528d52dd307b6f07;
        starttime = gettime();
        self.lastattackedtime = gettime();
        var_6e281dbd69fc980e = self.var_1ae978cf5dc05edb + anglestoforward((0, self.var_b3225133eb7f5842, 0)) * var_f0a3055b7b71a641;
        var_691aa1d5da533612 = function_56ebd2471f52c901(self.origin, var_6e281dbd69fc980e, 325, self.ignorelist);
        var_738caee3d4576e5c = var_691aa1d5da533612["hittype"] == "hittype_none";
        var_2e7ebfa03d229b76 = 0;
        /#
            if (var_e3ef073dd9338298 == 1) {
                duration = 200;
                if (!var_738caee3d4576e5c) {
                    sphere(var_691aa1d5da533612["killstreak"], 325, (1, 0, 0), 0, duration);
                    line(self.origin, var_691aa1d5da533612["killstreak"], (1, 0, 0), 1, 0, duration);
                    line(self.origin, var_6e281dbd69fc980e, (0, 1, 0), 1, 0, duration);
                    sphere(var_6e281dbd69fc980e, 325, (0, 1, 0), 0, duration);
                } else {
                    line(self.origin, var_6e281dbd69fc980e, (0, 1, 0), 1, 0, duration);
                    sphere(var_6e281dbd69fc980e, 325, (0, 1, 0), 0, duration);
                }
            }
        #/
        var_51dcb1b433d8841e++;
        wait(0.25);
    }
    while (var_738caee3d4576e5c) {
        if (isdefined(var_41976210805f0afe)) {
            var_45f91d5398b5a4a9 = gettime() - starttime;
            if (function_c89ed1840c8d0f0f(var_45f91d5398b5a4a9) > var_41976210805f0afe) {
                break;
            }
        }
        /#
            if (var_e3ef073dd9338298 == 1) {
                thread function_1126bfe77ada7e75(var_f0a3055b7b71a641, self.var_1ae978cf5dc05edb);
            }
        #/
        var_6e281dbd69fc980e = self.var_1ae978cf5dc05edb + anglestoforward((0, self.var_b3225133eb7f5842, 0)) * var_f0a3055b7b71a641;
        if (!var_2e7ebfa03d229b76) {
            /#
                if (var_e3ef073dd9338298 == 1) {
                    duration = 200;
                    line(self.origin, var_6e281dbd69fc980e, (0, 1, 0), 1, 0, duration);
                    sphere(var_6e281dbd69fc980e, 325, (0, 1, 0), 0, duration);
                }
            #/
            var_691aa1d5da533612 = function_56ebd2471f52c901(self.origin, var_6e281dbd69fc980e, 325, self.ignorelist);
            if (var_691aa1d5da533612["hittype"] != "hittype_none") {
                /#
                    if (var_e3ef073dd9338298 == 1) {
                        duration = 200;
                        sphere(var_691aa1d5da533612["killstreak"], 325, (1, 0, 0), 0, duration);
                        line(self.origin, var_691aa1d5da533612["killstreak"], (1, 0, 0), 1, 0, duration);
                    }
                #/
                self.var_cee00573b191bdb9 = !self.var_cee00573b191bdb9;
                self.var_b3225133eb7f5842 = self.var_b3225133eb7f5842 + ter_op(self.var_cee00573b191bdb9, var_d79710942c3153ae * -1, var_d79710942c3153ae) * 2;
                self.var_b3225133eb7f5842 = angleclamp(self.var_b3225133eb7f5842);
                self.var_1ae978cf5dc05edb = (self.var_1ae978cf5dc05edb[0], self.var_1ae978cf5dc05edb[1], self.var_1ae978cf5dc05edb[2] + 100);
                var_2e7ebfa03d229b76 = 1;
                continue;
            }
        }
        self.var_b3225133eb7f5842 = self.var_b3225133eb7f5842 + ter_op(self.var_cee00573b191bdb9, var_d79710942c3153ae * -1, var_d79710942c3153ae);
        self.var_b3225133eb7f5842 = angleclamp(self.var_b3225133eb7f5842);
        var_2e7ebfa03d229b76 = 0;
        /#
            if (var_e3ef073dd9338298 == 1) {
                duration = 200;
                print3d(self.origin, "chopper_gunner_proj_dmz" + self.var_b3225133eb7f5842, (1, 1, 1), 1, 1, duration, 1);
            }
        #/
        if (istrue(var_31759f0a1036d495)) {
            if (isdefined(self.current_target)) {
                self clearlookatent();
                waitframe();
                self setlookatent(self.current_target);
            }
        }
        var_36f900747ad147e6 = self.var_9ed6827753db2370;
        if (isdefined(self.var_36f900747ad147e6)) {
            var_36f900747ad147e6 = self.var_36f900747ad147e6;
        }
        function_d6eba8149fb949e9(var_6e281dbd69fc980e, var_25b8738ccc2f5e33, self.var_99a6191cb152b5d2, 1, undefined, undefined, var_36f900747ad147e6, undefined, undefined, isdrone);
        while (istrue(self.circle_paused)) {
            self notify("circling_paused");
            var_b45ac00208241af6 = 1;
            waitframe();
        }
        if (istrue(var_4aed5403298a4d7f) && isdefined(self.current_target) && !istrue(var_b45ac00208241af6)) {
            if (namespace_2a184fc4902783dc::ray_trace_passed(self.current_target geteye(), self.origin, [0:self.current_target, 1:self])) {
                function_b91a289ed9de4db7(randomfloatrange(0, 5));
            }
        } else if (istrue(var_b45ac00208241af6)) {
            var_b45ac00208241af6 = 0;
        }
        if (isdefined(var_eb17d5c958e3fcda)) {
            var_b0cfda61777f02ed = [[ var_eb17d5c958e3fcda ]](self);
            if (isdefined(var_b0cfda61777f02ed)) {
                self.var_1ae978cf5dc05edb = (var_b0cfda61777f02ed[0], var_b0cfda61777f02ed[1], var_b0cfda61777f02ed[2] + self.var_99a6191cb152b5d2);
            }
        }
        waitframe();
    }
    self clearlookatent();
    self.var_38ed6a306a44585a = undefined;
    self.var_7690d8c6ccfe1f73 = undefined;
    self notify("stop_circling");
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249b
// Size: 0xc9
function function_b91a289ed9de4db7(pause_time, var_3756c44715a73d25) {
    self notify("pause_circling");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("stop_circling");
    self endon("pause_circling");
    self.circle_paused = 1;
    if (istrue(var_3756c44715a73d25)) {
        self sethoverparams(100, 10, 5);
        self waittill("resume_circling");
        self sethoverparams(self.hover_radius, self.hover_speed, self.hover_accel);
    } else if (isdefined(pause_time)) {
        self sethoverparams(100, 10, 5);
        wait(pause_time);
        self sethoverparams(self.hover_radius, self.hover_speed, self.hover_accel);
    }
    self.circle_paused = 0;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256b
// Size: 0x485
function function_d6eba8149fb949e9(target, var_6c814cee8d2bd65e, var_7403e5e436347d6b, var_d37d6f45a6bae8f9, goalyaw, var_96a8cbce5c730b5b, var_cddc894ccdf6de54, var_af4a339e05408e87, var_94b77a8a675ccd6e, isdrone, var_e89d45f45880e5ca) {
    if (!isdefined(var_e89d45f45880e5ca)) {
        var_e89d45f45880e5ca = 1;
    }
    self notify("state_change");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("new_orders");
    self endon("state_change");
    self endon("stop_all_action");
    newpos = undefined;
    var_5313c6d43b37a764 = undefined;
    unload = 0;
    var_7dda4efe402725f2 = 0;
    var_ccf44cff39a902f0 = 0;
    goalyaw = function_53c4c53197386572(goalyaw, undefined);
    var_e3ef073dd9338298 = getdvarint(@"hash_2c1d3a8768e5e585", 0);
    var_4e6df96d95bf50bc = target;
    /#
        assertex(isdefined(target), "Tasking heli to move to undefined target");
    #/
    if (!isvector(target)) {
        var_4e6df96d95bf50bc = target.origin;
        if (isdefined(target.script_goalyaw)) {
            goalyaw = target.script_goalyaw;
        }
        if (isdefined(target.script_anglevehicle)) {
            var_5313c6d43b37a764 = target.script_anglevehicle;
        }
        if (isdefined(target.script_unload)) {
            unload = target.script_unload;
        }
        var_7dda4efe402725f2 = isdefined(target.script_flag_wait);
        var_ccf44cff39a902f0 = !isdefined(target.target);
    }
    min_height = ter_op(isdefined(var_7403e5e436347d6b), var_7403e5e436347d6b, self.var_a32eb5da7024e7c4);
    var_451e9c8586b874b0 = istrue(isdrone) ? 32 : 325;
    ignorelist = self.ignorelist;
    while (1) {
        xpos = var_4e6df96d95bf50bc[0];
        ypos = var_4e6df96d95bf50bc[1];
        var_689a1188271a0be5 = var_4e6df96d95bf50bc[2];
        if (var_e89d45f45880e5ca || isdefined(var_7403e5e436347d6b)) {
            var_382ca5f6deca0f5f = getgroundposition(var_4e6df96d95bf50bc, var_451e9c8586b874b0, min_height);
            if (isdefined(var_382ca5f6deca0f5f)) {
                var_689a1188271a0be5 = var_382ca5f6deca0f5f[2] + min_height;
                /#
                    if (var_e3ef073dd9338298) {
                        sphere((xpos, ypos, var_382ca5f6deca0f5f[2]), var_451e9c8586b874b0, (1, 0, 1), undefined, 100);
                    }
                #/
            }
        }
        currentpos = self.origin;
        var_2eca7b12d2ee27ba = (xpos, ypos, var_689a1188271a0be5);
        var_158f8e4d0e511638 = 0;
        if (!istrue(var_d37d6f45a6bae8f9)) {
            var_691aa1d5da533612 = function_56ebd2471f52c901(currentpos, var_2eca7b12d2ee27ba, var_451e9c8586b874b0, ignorelist);
            if (isdefined(var_691aa1d5da533612)) {
                if (var_691aa1d5da533612["hittype"] != "hittype_none") {
                    if (istrue(var_94b77a8a675ccd6e)) {
                        return 0;
                    }
                    xpos = var_691aa1d5da533612["position"][0];
                    ypos = var_691aa1d5da533612["position"][1];
                    var_158f8e4d0e511638 = 1;
                    var_382ca5f6deca0f5f = getgroundposition(var_691aa1d5da533612["position"], var_451e9c8586b874b0, 2500, 2000);
                    var_a7b8e7eed2e7734e = ter_op(isdefined(var_382ca5f6deca0f5f), var_382ca5f6deca0f5f[2], 2000);
                    /#
                        if (var_e3ef073dd9338298) {
                            sphere(var_691aa1d5da533612["killstreak"], var_451e9c8586b874b0, (1, 0, 0), undefined, 100);
                            sphere((xpos, ypos, var_a7b8e7eed2e7734e), var_451e9c8586b874b0, (1, 0, 1), undefined, 100);
                        }
                    #/
                }
            }
        }
        if (var_158f8e4d0e511638) {
            var_689a1188271a0be5 = var_a7b8e7eed2e7734e + min_height;
        }
        newpos = (xpos, ypos, var_689a1188271a0be5);
        /#
            if (var_e3ef073dd9338298) {
                sphere(newpos, var_451e9c8586b874b0, (1, 1, 0), undefined, 100);
            }
        #/
        stopatgoal = 0;
        if (istrue(var_6c814cee8d2bd65e) && !istrue(var_158f8e4d0e511638)) {
            stopatgoal = var_6c814cee8d2bd65e;
        }
        /#
            if (var_e3ef073dd9338298 == 1) {
                thread function_4dc385ff6dceb535(newpos);
                thread function_4dc385ff6dceb535(var_2eca7b12d2ee27ba, (0, 1, 0));
            }
        #/
        speed = undefined;
        if (isdefined(var_cddc894ccdf6de54)) {
            speed = var_cddc894ccdf6de54;
        } else if (!isvector(target) && isdefined(target.script_speed)) {
            speed = target.script_speed;
        } else {
            speed = self.speed;
        }
        self vehicle_helisetai(newpos, speed, var_af4a339e05408e87, 50, goalyaw, var_5313c6d43b37a764, 0, undefined, 0, stopatgoal, unload, var_7dda4efe402725f2, var_ccf44cff39a902f0);
        msg = waittill_any_return_2("near_goal", "begin_evasive_maneuvers");
        if (!istrue(var_158f8e4d0e511638)) {
            break;
        }
    }
    return 1;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29f8
// Size: 0x126
function function_baf77c5046ac25e6(target_location) {
    self notify("new_orders");
    self endon("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    if (!isdefined(target_location)) {
        target_location = self.origin;
    }
    self sethoverparams(self.hover_radius, self.hover_speed, self.hover_accel);
    self vehicle_setspeed(self.var_f7162628b14fc18a, self.var_ab0a05a03b262cf1);
    wait(2);
    function_d6eba8149fb949e9(target_location, 1);
    self.var_f1b55da19f091702 = 0;
    if (isdefined(self.turrets) && self.turrets.size > 0) {
        foreach (turret in self.turrets) {
            turret.turreton = 1;
        }
    }
    self vehicle_setspeed(self.var_494fe868127e6381, self.accel);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b25
// Size: 0x134
function function_287bc363539b1f3(target_location) {
    self notify("new_orders");
    self endon("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    if (!isdefined(target_location)) {
        target_location = self.origin;
    }
    if (!isvector(target_location)) {
        target_location = target_location.origin;
    }
    function_d6eba8149fb949e9(target_location, 1);
    while (distance2dsquared(self.origin, target_location) > self.var_413cd32ed3724791) {
        waitframe();
    }
    self vehicle_setspeed(self.var_f7162628b14fc18a, self.var_ab0a05a03b262cf1);
    function_d6eba8149fb949e9(target_location, 1, undefined, undefined, undefined, 1);
    self.var_f1b55da19f091702 = 1;
    if (isdefined(self.turrets) && self.turrets.size > 0) {
        foreach (turret in self.turrets) {
            turret.turreton = 0;
        }
    }
    self sethoverparams(0, 0, 0);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c60
// Size: 0x6
function function_f638b39453994581() {
    /#
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6d
// Size: 0x82
function function_90786c097a7d7433(target_ent) {
    self endon("missile_attack");
    self setlookatent(target_ent);
    dot = 0;
    while (dot < 0.98) {
        vector_to_target = target_ent.origin - self.origin;
        var_b4786c69e318a508 = anglestoforward(self.angles);
        dot = function_c1aa7c066ec92ca5(vector_to_target, var_b4786c69e318a508, 1);
        waitframe();
    }
    thread function_d19d987a94ac039a(target_ent);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cf6
// Size: 0x99
function private function_2029e383e2ec901(target_ent) {
    self setlookatent(target_ent);
    target_ent endon("death");
    dot = 0;
    while (dot < 0.98) {
        vector_to_target = target_ent.origin - self.origin;
        var_b4786c69e318a508 = anglestoforward(self.angles);
        dot = function_c1aa7c066ec92ca5(vector_to_target, var_b4786c69e318a508, 1);
        waitframe();
    }
    childthread function_a2262da7c12166e1(target_ent.origin, 0, 4000);
    childthread function_d19d987a94ac039a(target_ent);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d96
// Size: 0x91
function private function_d19d987a94ac039a(target_ent) {
    self endon("strafe_complete");
    childthread function_61e90c153370f34c(target_ent);
    childthread function_8c6288b37bca3acc();
    dot = 0;
    while (dot < 0.98) {
        vector_to_target = vectornormalize(target_ent.origin - self.origin);
        var_b4786c69e318a508 = vectornormalize(anglestoforward(self.angles));
        dot = vectordot(vector_to_target, var_b4786c69e318a508);
        waitframe();
    }
    function_59a7799ba32508b5();
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e2e
// Size: 0x1e
function private function_8c6288b37bca3acc() {
    self waittill("missiles_fired");
    function_8e54039e0bb56066(self.angles[0], 0);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e53
// Size: 0x22
function private function_61e90c153370f34c(target_ent) {
    self endon("missiles_fired");
    self endon("strafe_complete");
    function_35ebc7f46056f245(target_ent);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e7c
// Size: 0x110
function private function_59a7799ba32508b5() {
    self.var_580ba3be57af233e = 0;
    self.team = "team_hundred_ninety";
    var_46da84e8ced274e2 = [0:"tag_gun_right1", 1:"tag_gun_left1", 2:"tag_gun_right2", 3:"tag_gun_left2"];
    var_eca5243ed04c621 = 4;
    wait(1);
    for (i = 0; i < var_eca5243ed04c621; i++) {
        var_429aae2e6e20f85 = self gettagorigin(var_46da84e8ced274e2[i % 4]) + anglestoforward(self.angles + (0, 0, 0)) * 200;
        var_85fa3cdcb19d2a9c = self gettagorigin(var_46da84e8ced274e2[i % 4]) + anglestoforward(self.angles + (6, 0, 0)) * 1000;
        missile = namespace_d325722f2754c2c4::_magicbullet(self.missileweapon, var_429aae2e6e20f85, var_85fa3cdcb19d2a9c, self);
        wait(0.3);
    }
    self notify("missiles_fired");
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f93
// Size: 0x6
function function_3c82ba8af1c7ea09() {
    /#
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fa0
// Size: 0x140
function private function_56ebd2471f52c901(start, end, radius, ignore, contentoverride, var_ef65bf3909d178e, var_b00c60a54d663ca2) {
    /#
        dist = distance(start, end);
        println("<unknown string>" + start + "<unknown string>" + end + "<unknown string>" + radius + "<unknown string>" + dist);
        if (getdvarint(@"hash_2c1d3a8768e5e585", 0) || getdvarint(@"hash_9aa835d8fcd3b58d", 0)) {
            sphere(start, radius, (1, 0, 0), undefined, 100);
            line(start, end, (1, 0, 0), 1, undefined, 100);
            sphere(end, radius, (1, 0, 0), undefined, 100);
            if (!isdefined(level.var_f40761825dce0d99)) {
                level.var_f40761825dce0d99 = 0;
            } else {
                level.var_f40761825dce0d99++;
            }
            iprintln("<unknown string>" + level.var_f40761825dce0d99 + "<unknown string>" + dist);
        }
    #/
    return trace::sphere_trace(start, end, radius, ignore, contentoverride, var_ef65bf3909d178e, var_b00c60a54d663ca2);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30e8
// Size: 0x356
function private function_e3a3b10fbf64512d(circleorigin, circleradius, interval) {
    var_7d51b7712a119d5e = anglestoforward(self.angles);
    var_b99d0690ec1b48a0 = vectornormalize(var_7d51b7712a119d5e * (1, 1, 0));
    var_c1413fe062d1751c = anglestoleft(self.angles);
    var_c7c2d0d0c038878a = vectornormalize(var_c1413fe062d1751c * (1, 1, 0));
    var_db4b7f35a2b65598 = circleorigin - self.origin;
    var_350e5874d177850e = vectornormalize(var_db4b7f35a2b65598 * (1, 1, 0));
    var_b419b1df445ce254 = vectordot(var_b99d0690ec1b48a0, var_350e5874d177850e);
    var_6eabde346129539a = vectordot(var_c7c2d0d0c038878a, var_350e5874d177850e);
    if (var_b419b1df445ce254 > 0) {
        self.var_cee00573b191bdb9 = ter_op(var_6eabde346129539a > 0, 0, 1);
    } else {
        self.var_cee00573b191bdb9 = ter_op(var_6eabde346129539a > 0, 1, 0);
    }
    var_88b83b0d7a43ea72 = ter_op(var_6eabde346129539a > 0, (0, -90, 0), (0, 90, 0));
    var_a0c995eedf3d1b68 = rotatevector(var_b99d0690ec1b48a0, var_88b83b0d7a43ea72);
    /#
        var_e3ef073dd9338298 = getdvarint(@"hash_2c1d3a8768e5e585", 0);
        if (var_e3ef073dd9338298) {
            duration = 8000;
            var_a770634c325d7742 = circleorigin + var_a0c995eedf3d1b68 * circleradius;
            var_a403d572254a13b2 = 200;
            var_fc62075a9f6e7cab = ter_op(var_b419b1df445ce254 > 0, (0, 1, 0), (1, 0, 0));
            line(self.origin, self.origin + var_b99d0690ec1b48a0 * var_a403d572254a13b2, (1, 0, 0), 1, 0, duration);
            line(self.origin, self.origin + var_c7c2d0d0c038878a * var_a403d572254a13b2, (0, 0, 1), 1, 0, duration);
            line(self.origin, self.origin + var_a0c995eedf3d1b68 * var_a403d572254a13b2, (0.01, 0.85, 1), 1, 0, duration);
            line(self.origin, self.origin + var_db4b7f35a2b65598, (1, 0.92, 0.16), 1, 0, duration);
            line(circleorigin, var_a770634c325d7742, (0.98, 0.75, 0.79), 1, 0, duration);
            sphere(circleorigin, 10, var_fc62075a9f6e7cab, 0, duration);
            var_2a70afa93ebb723b = "chopper_gunner_proj_dmz";
            var_2a70afa93ebb723b = ter_op(var_b419b1df445ce254 > 0, "<unknown string>", "<unknown string>");
            var_2a70afa93ebb723b = var_2a70afa93ebb723b + ter_op(var_6eabde346129539a > 0, "<unknown string>", "<unknown string>");
            var_2a70afa93ebb723b = var_2a70afa93ebb723b + ter_op(self.var_cee00573b191bdb9, "<unknown string>", "<unknown string>");
            print3d(circleorigin, var_2a70afa93ebb723b, (1, 1, 1), 1, 1, duration, 1);
        }
    #/
    var_3568b4d1648d2c20 = vectortoangles(var_a0c995eedf3d1b68);
    return var_3568b4d1648d2c20[1] - 15 * interval;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3446
// Size: 0x4e
function private function_93ff5e5ba263fc6d(attacker, targ) {
    var_540088a9ca3d97d6 = targ.origin - attacker.origin;
    return function_c1aa7c066ec92ca5(var_540088a9ca3d97d6, anglestoforward(attacker.angles), 1);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x349c
// Size: 0x8d
function private function_4dc385ff6dceb535(newpos, color) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        if (!isdefined(color)) {
            color = (1, 0, 0);
        }
        while (1) {
            sphere(newpos, 32, color, 0, 1);
            line(self.origin, newpos, color, 1, 0, 0, 1);
            waitframe();
        }
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3530
// Size: 0x77
function private function_1126bfe77ada7e75(var_f0a3055b7b71a641, var_9110a770bb630563) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            level thread draw_circle(var_9110a770bb630563, var_f0a3055b7b71a641, (1, 0, 0), 1, 0, 10);
            wait(0.5);
        }
    #/
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35ae
// Size: 0x41
function private function_35ebc7f46056f245(target_ent) {
    self setmaxpitchroll(self.var_d9ba194b1c40ff94, 30);
    function_8e54039e0bb56066(self.angles[0], getpitchtospot3d(target_ent.origin));
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35f6
// Size: 0xe3
function private function_8e54039e0bb56066(var_3ce8c9a46abb687c, var_76b359f5dd04037, var_83aa501929cb0c34) {
    var_83aa501929cb0c34 = function_53c4c53197386572(var_83aa501929cb0c34, 13);
    if (var_3ce8c9a46abb687c > 180) {
        var_76b359f5dd04037 = var_76b359f5dd04037 + 360;
    }
    var_cf49faac8401db11 = abs(var_76b359f5dd04037 - self.angles[0]);
    total_time = var_cf49faac8401db11 / var_83aa501929cb0c34;
    start_time = gettime();
    time_elapsed = 0;
    if (total_time <= 0) {
        return;
    }
    while (1) {
        time_elapsed = (gettime() - start_time) / 1000;
        pitch = math::lerp(var_3ce8c9a46abb687c, var_76b359f5dd04037, clamp(time_elapsed / total_time, 0, 1)) % 360;
        self.angles = (pitch, self.angles[1], self.angles[2]);
        waitframe();
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e0
// Size: 0xf9
function function_e3ab01a91dc64df0() {
    level endon("game_ended");
    self endon("chopperSupport_gone");
    owner = self.owner;
    while (isdefined(self) && self.health > 0) {
        waitframe();
    }
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.turrets) && self.turrets.size > 0) {
        foreach (turret in self.turrets) {
            turret.turreton = 0;
        }
    }
    if (issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
        if (!function_f3bb4f4911a1beb2("killstreak", "isKillStreakWeapon", self.killedbyweapon)) {
            heli_crash(100);
        }
    }
    heli_explode();
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37e0
// Size: 0x56
function private heli_explode() {
    self notify("explode");
    self notify("state_change");
    self radiusdamage(self.origin, 1000, 200, 200, undefined, "MOD_EXPLOSIVE", "chopper_support_turret_mp");
    self setscriptablepartstate("explode", "on", 0);
    wait(0.35);
    function_59b01d10bb7ae112(1);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383d
// Size: 0x9d
function function_59b01d10bb7ae112(var_4fac8b8ce36e09f1) {
    if (self.turrets.size > 0) {
        foreach (turret in self.turrets) {
            if (isdefined(turret)) {
                turret setentityowner(undefined);
                turret.groundtargetent delete();
                turret delete();
            }
        }
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38e1
// Size: 0xdc
function private heli_crash(speed) {
    self endon("explode");
    self setscriptablepartstate("crash", "on", 0);
    if (isdefined(self.killcament)) {
        self.killcament unlink();
        self.killcament.origin = self.origin + (0, 0, 100);
    }
    self clearlookatent();
    self notify("crashing");
    self.iscrashing = 1;
    self vehicle_setspeed(speed, 20, 20);
    self setneargoalnotifydist(100);
    var_6847739e80fb4e81 = function_7e27abfd534d1e45(2000, 500, 1000);
    if (!isdefined(var_6847739e80fb4e81)) {
        return;
    }
    self setvehgoalpos(var_6847739e80fb4e81, 0);
    thread function_bf7f0ff24bf463e6(speed);
    self vehicle_turnengineoff();
    self waittill("near_goal");
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39c4
// Size: 0x1c4
function private function_7e27abfd534d1e45(var_6f8d59f68bd2b46c, var_6c56ff5ecc704c48, var_6c7af55ecc98b102) {
    var_b2b5f5510c5d94e0 = self.origin;
    crashoffset = self.crashoffset;
    var_543f2191dde2b7f6 = undefined;
    var_6c5ceed9b00eb7d5 = anglestoforward(self.angles);
    var_5cc1d6dd55c49e3a = anglestoright(self.angles);
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 + var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_5cc1d6dd55c49e3a - var_6c5ceed9b00eb7d5) - (0, 0, crashoffset);
    var_4720f54e3eff6e8d = ray_trace(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (-1 * var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    return var_543f2191dde2b7f6;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b90
// Size: 0x4d
function private function_bf7f0ff24bf463e6(speed) {
    self endon("death");
    self setyawspeed(speed, 50, 50, 0.5);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.4);
        wait(0.5);
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3be4
// Size: 0x77
function function_99a774485b72ded3(starttrace) {
    droplocation = undefined;
    endtrace = starttrace - (0, 0, 20000);
    ignorelist = [0:self];
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignorelist);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        droplocation = trace["position"];
    }
    return droplocation;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c63
// Size: 0xce
function private function_45cc03649256e6f3(data) {
    if (isdefined(data.attacker)) {
        var_8efef5b1e4d79b79 = data.attacker getentitynumber();
        if (!array_contains_key(self.attackers, var_8efef5b1e4d79b79)) {
            self.attackers[var_8efef5b1e4d79b79] = 0;
        }
        self.attackers[var_8efef5b1e4d79b79] = self.attackers[var_8efef5b1e4d79b79] + data.damage;
        namespace_329d1a4521cd0e73::function_c54b2cc2e762c201(data.attacker, self, data.hitloc, data.meansofdeath, data.objweapon, int(data.damage), data.point, 0, undefined, 0, 0);
    }
    return 1;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d39
// Size: 0x73
function private function_d9630ff97ef012cf(data) {
    namespace_343543689c1d8859::choppersupport_handledeathdamage(data);
    foreach (deathcallback in self.deathcallbacks) {
        self thread [[ deathcallback ]](self, data);
    }
    self notify("death");
    return 1;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db4
// Size: 0x1c7
function function_c96e4b15db766b84(settings_bundle) {
    if (!isdefined(settings_bundle)) {
        settings_bundle = getscriptbundle("helicoptersettings:default_helicopter_settings");
    }
    if (isdefined(settings_bundle)) {
        /#
            assertex(settings_bundle.var_7b2e2585328769e1 == "helicopter_settings", "Script Bundle provided to heli_spawn is not correct type. Please ensure you are passing through a helicopter_settings bundle");
        #/
    }
    function_f8d9191e53984195(settings_bundle.var_1677a5799ea2d883);
    function_9e96cdf67b925aa0(settings_bundle.hasturret, settings_bundle.turretsettings);
    function_7dac0131a74b9e48(settings_bundle.var_52c02cddbd6c79d7, settings_bundle.var_390142e4d624d3f4, settings_bundle.var_ebeccb8e554eacaf, settings_bundle.var_642fdcbb808b744c);
    function_46f757d9ff2fdfcc(settings_bundle.var_1e9ed21b5d947d43, settings_bundle.var_7472d0ddfd2019ca);
    function_268f89699b68533e(settings_bundle.var_1daf2fa3c00569fa, settings_bundle.var_9ed6827753db2370, settings_bundle.var_253f4378e43c9755, settings_bundle.var_25622d78e462aeab, settings_bundle.var_99a6191cb152b5d2, settings_bundle.var_5bee9b82a537f1c0, settings_bundle.var_34226496d5530b2a, settings_bundle.var_46d92644542e2ae6, settings_bundle.var_8ee581a878abca60);
    function_324badbe006153(settings_bundle.var_27b3267d1a2697dd, settings_bundle.var_b7653ed508479202, settings_bundle.var_6201fb806ad1b5d7, settings_bundle.var_f7162628b14fc18a, settings_bundle.var_ab0a05a03b262cf1, settings_bundle.groundoffset, settings_bundle.var_413cd32ed3724791);
    function_618793408ff0894a(settings_bundle.var_a7a02c81f965a3fe, settings_bundle.var_a339df2b58c46b8e, settings_bundle.missileweapon, settings_bundle.var_d9ba194b1c40ff94, settings_bundle.var_da6ccdbfcffb23b1, settings_bundle.var_90487055ec2291ba);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f82
// Size: 0x92
function function_de3fc172a25ca50b() {
    while (1) {
        var_1e9ed21b5d947d43 = getdvarint(@"hash_39512dcad0dfbf5a", -1);
        if (var_1e9ed21b5d947d43 != -1 && self.var_1e9ed21b5d947d43 != var_1e9ed21b5d947d43) {
            self.var_1e9ed21b5d947d43 = var_1e9ed21b5d947d43;
            function_3dcc8d2fa9bc93f7(self.var_1e9ed21b5d947d43);
        }
        var_a339df2b58c46b8e = getdvarfloat(@"hash_61b0eb8825f9e210", -1);
        if (var_a339df2b58c46b8e != -1 && self.var_a339df2b58c46b8e != var_a339df2b58c46b8e) {
            self.var_a339df2b58c46b8e = var_a339df2b58c46b8e;
        }
        waitframe();
    }
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x401b
// Size: 0x26
function private function_f8d9191e53984195(var_c8e4f9c808bc6727) {
    var_c8e4f9c808bc6727 = function_53c4c53197386572(var_c8e4f9c808bc6727, 45);
    self.var_cc99a14e60508d29 = cos(var_c8e4f9c808bc6727);
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4048
// Size: 0x33
function private function_9e96cdf67b925aa0(hasturret, turretsettings) {
    hasturret = function_53c4c53197386572(hasturret, 1);
    self.hasturret = hasturret;
    self.turretsettings = turretsettings;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4082
// Size: 0x3e
function private function_46f757d9ff2fdfcc(var_1e9ed21b5d947d43, var_7472d0ddfd2019ca) {
    var_1e9ed21b5d947d43 = function_53c4c53197386572(var_1e9ed21b5d947d43, 2000);
    var_7472d0ddfd2019ca = function_53c4c53197386572(var_7472d0ddfd2019ca, 0);
    self.var_1e9ed21b5d947d43 = var_1e9ed21b5d947d43;
    self.var_7472d0ddfd2019ca = var_7472d0ddfd2019ca;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40c7
// Size: 0x7c
function private function_7dac0131a74b9e48(hover_radius, hover_speed, hover_accel, var_a32eb5da7024e7c4) {
    hover_radius = function_53c4c53197386572(hover_radius, 50);
    hover_speed = function_53c4c53197386572(hover_speed, 5);
    hover_accel = function_53c4c53197386572(hover_accel, 2.5);
    var_a32eb5da7024e7c4 = function_53c4c53197386572(var_a32eb5da7024e7c4, 256);
    self.hover_radius = hover_radius;
    self.hover_speed = hover_speed;
    self.hover_accel = hover_accel;
    self.var_a32eb5da7024e7c4 = var_a32eb5da7024e7c4;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x414a
// Size: 0xd8
function private function_324badbe006153(var_27b3267d1a2697dd, var_b7653ed508479202, var_6201fb806ad1b5d7, var_f7162628b14fc18a, var_ab0a05a03b262cf1, groundoffset, var_413cd32ed3724791) {
    var_27b3267d1a2697dd = function_53c4c53197386572(var_27b3267d1a2697dd, 3);
    var_b7653ed508479202 = function_53c4c53197386572(var_b7653ed508479202, 256);
    var_6201fb806ad1b5d7 = function_53c4c53197386572(var_6201fb806ad1b5d7, 40);
    var_f7162628b14fc18a = function_53c4c53197386572(var_f7162628b14fc18a, 10);
    var_ab0a05a03b262cf1 = function_53c4c53197386572(var_ab0a05a03b262cf1, 5);
    groundoffset = function_53c4c53197386572(groundoffset, 128);
    var_413cd32ed3724791 = function_53c4c53197386572(var_413cd32ed3724791, 65536);
    self.var_27b3267d1a2697dd = var_27b3267d1a2697dd;
    self.var_b7653ed508479202 = var_b7653ed508479202;
    self.speed = var_6201fb806ad1b5d7;
    self.var_f7162628b14fc18a = var_f7162628b14fc18a;
    self.var_ab0a05a03b262cf1 = var_ab0a05a03b262cf1;
    self.groundoffset = groundoffset;
    self.var_413cd32ed3724791 = var_413cd32ed3724791;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4229
// Size: 0x11e
function private function_268f89699b68533e(var_1daf2fa3c00569fa, var_9ed6827753db2370, var_253f4378e43c9755, var_25622d78e462aeab, var_99a6191cb152b5d2, var_5bee9b82a537f1c0, var_34226496d5530b2a, var_46d92644542e2ae6, var_8ee581a878abca60) {
    var_1daf2fa3c00569fa = function_53c4c53197386572(var_1daf2fa3c00569fa, 128);
    var_9ed6827753db2370 = function_53c4c53197386572(var_9ed6827753db2370, 30);
    var_253f4378e43c9755 = function_53c4c53197386572(var_253f4378e43c9755, 1500);
    var_25622d78e462aeab = function_53c4c53197386572(var_25622d78e462aeab, 2560);
    var_99a6191cb152b5d2 = function_53c4c53197386572(var_99a6191cb152b5d2, 768);
    var_5bee9b82a537f1c0 = function_53c4c53197386572(var_5bee9b82a537f1c0, 1);
    var_34226496d5530b2a = function_53c4c53197386572(var_34226496d5530b2a, 4194304);
    var_46d92644542e2ae6 = function_53c4c53197386572(var_46d92644542e2ae6, 3);
    var_8ee581a878abca60 = function_53c4c53197386572(var_8ee581a878abca60, 8);
    self.var_1daf2fa3c00569fa = var_1daf2fa3c00569fa;
    self.var_9ed6827753db2370 = var_9ed6827753db2370;
    self.var_253f4378e43c9755 = var_253f4378e43c9755;
    self.var_25622d78e462aeab = var_25622d78e462aeab;
    self.var_99a6191cb152b5d2 = var_99a6191cb152b5d2;
    self.var_5bee9b82a537f1c0 = var_5bee9b82a537f1c0;
    self.var_34226496d5530b2a = var_34226496d5530b2a;
    self.var_46d92644542e2ae6 = var_46d92644542e2ae6;
    self.var_8ee581a878abca60 = var_8ee581a878abca60;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x434e
// Size: 0xb7
function private function_618793408ff0894a(var_a7a02c81f965a3fe, var_a339df2b58c46b8e, var_ffd128d3b3bac67a, var_d9ba194b1c40ff94, var_da6ccdbfcffb23b1, var_e309f77b84ade0d9) {
    var_a7a02c81f965a3fe = function_53c4c53197386572(var_a7a02c81f965a3fe, 1);
    var_a339df2b58c46b8e = function_53c4c53197386572(var_a339df2b58c46b8e, 15000);
    var_ffd128d3b3bac67a = function_53c4c53197386572(var_ffd128d3b3bac67a, "chopper_gunner_proj_dmz");
    var_d9ba194b1c40ff94 = function_53c4c53197386572(var_d9ba194b1c40ff94, 60);
    var_da6ccdbfcffb23b1 = function_53c4c53197386572(var_da6ccdbfcffb23b1, 30);
    var_e309f77b84ade0d9 = function_53c4c53197386572(var_e309f77b84ade0d9, 5500);
    self.var_a7a02c81f965a3fe = var_a7a02c81f965a3fe;
    self.var_a339df2b58c46b8e = var_a339df2b58c46b8e;
    self.var_ffd128d3b3bac67a = var_ffd128d3b3bac67a;
    self.var_d9ba194b1c40ff94 = var_d9ba194b1c40ff94;
    self.var_da6ccdbfcffb23b1 = var_da6ccdbfcffb23b1;
    self.var_e309f77b84ade0d9 = var_e309f77b84ade0d9;
}

// Namespace namespace_c908de38bcdbd93d/namespace_49e272e116f37d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440c
// Size: 0x20
function function_3dcc8d2fa9bc93f7(var_1e9ed21b5d947d43) {
    self.health = var_1e9ed21b5d947d43;
    self.maxhealth = var_1e9ed21b5d947d43;
}

