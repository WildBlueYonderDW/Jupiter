// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_3f51a039c4a1a113;
#using script_7c40fa80892a721;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_19c169a442d5975a;

#namespace radiation;

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x3ae
// Size: 0x1e
function private autoexec __init__system__() {
    system::register(#"radiation", undefined, &function_af7dbb927513bb60, &function_13dad5c9339829d7);
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d3
// Size: 0xf3
function private function_af7dbb927513bb60() {
    level.radiation = spawnstruct();
    level.radiation.instances = [];
    level.radiation.damageweapon = getdvar(@"hash_f08ac6061fce744a", "danger_circle_br");
    level.radiation.var_3c96ed7246169c1 = getdvarint(@"hash_229c4da4191ab249", 1) != 0;
    level.radiation.var_7e8f3d6aa260f249 = getdvarint(@"hash_1e0f719f2b363047", 20);
    level.radiation.var_d353ab97fc4b82c0 = getdvarint(@"hash_7f28cb77cb8b8417", 5);
    utility::registersharedfunc("radiation", "radiation_isInit", &function_1b42b4ffc7748d8d);
    utility::registersharedfunc("radiation", "radiation_signedDistanceFromRadiationCircle", &function_a611746a5dbb32ac);
    flag_set("radiation_initialized");
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x21
function private function_13dad5c9339829d7() {
    /#
        level.radiation.var_909512e52515e78 = undefined;
        thread function_8748260c33092d78();
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f5
// Size: 0x148
function create(origin, radius, var_29e95cf0babf9c87, var_9ebad3637bcb64d, var_29de4b245273b366) {
    radius = float(radius);
    instance = spawnstruct();
    instance.origin = origin;
    instance.angles = (0, 0, 0);
    instance.active = 1;
    instance.radius = radius;
    instance.radiussq = squared(radius);
    instance.tickRate = var_29e95cf0babf9c87;
    instance.var_e0c4123baae7b409 = 0;
    if (istrue(var_29de4b245273b366)) {
        instance.var_c075862f37971025 = spawnbrcircle(origin[0], origin[1], radius);
    }
    if (isdefined(var_9ebad3637bcb64d)) {
        instance game_utility::function_6b6b6273f8180522(var_9ebad3637bcb64d, origin, radius);
        instance game_utility::function_6988310081de7b45();
    }
    instance thread function_3b5ce53109b60075();
    instance thread function_242555e5ab28a44c();
    instance callback::add("player_entered_radiation", &function_dfd00c666da7f557);
    instance callback::add("player_exited_radiation", &function_e6d761d1927e2ed1);
    level.radiation.instances[level.radiation.instances.size] = instance;
    return instance;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x645
// Size: 0xd2
function transform(new_origin, var_22704f0918abfe44, duration) {
    if (new_origin == self.origin && var_22704f0918abfe44 == self.radius) {
        return;
    }
    var_22704f0918abfe44 = float(var_22704f0918abfe44);
    callback::callback("radiation_transform_started");
    self notify("radiation_transform_started");
    self.var_55cf46878c46af61 = 1;
    self.var_b6b423f4ed3f7a2d = 0;
    self.var_b70884a49ee01c84 = self.origin;
    self.var_c939535a8d2d4870 = self.radius;
    self.var_7bf9ce32347ac445 = duration;
    self.var_828323b769725dbf = new_origin;
    self.var_89748805c0fc52e3 = var_22704f0918abfe44;
    if (isdefined(self.var_c075862f37971025)) {
        self.var_c075862f37971025 brcirclemoveto(new_origin[0], new_origin[1], var_22704f0918abfe44, duration);
    }
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71e
// Size: 0xd8
function destroy() {
    /#
        assertex(self.active, "radiation::destroy() called on a radiation that has already been destroyed.");
    #/
    self.active = 0;
    callback::callback("radiation_destroyed");
    self notify("radiation_destroyed");
    if (game_utility::function_acaa75ca8754452e()) {
        game_utility::function_af5604ce591768e1();
    }
    if (isdefined(self.var_c075862f37971025)) {
        self.var_c075862f37971025 delete();
    }
    level.radiation.instances = array_remove(level.radiation.instances, self);
    /#
        if (isdefined(level.radiation.var_909512e52515e78) && self == level.radiation.var_909512e52515e78) {
            level.radiation.var_909512e52515e78 = undefined;
        }
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7fd
// Size: 0x44
function function_5011f65bd985dfb(vision_set, transition_time, inside) {
    self.visionset = vision_set;
    if (!isdefined(inside)) {
        goto LOC_0000002f;
    }
    self.var_85cb554cfa2fd3d3 = inside;
    self.var_50ba7325c62c2025 = transition_time;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x848
// Size: 0x5f
function function_58016c61f549ad52(var_4341066c8e46637c, var_5e09e1c88a4d2697, var_bbbf343ca6fd3c76, inside) {
    self.var_75186cfe05cecd50 = var_4341066c8e46637c;
    self.var_a292f5812d40eb56 = var_5e09e1c88a4d2697;
    if (!isdefined(var_bbbf343ca6fd3c76)) {
        goto LOC_00000040;
    }
    self.var_208cf23d5ed8f1f4 = var_bbbf343ca6fd3c76;
    if (!isdefined(inside)) {
        goto LOC_00000054;
    }
    self.var_a2aa25ea43b31d54 = inside;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ae
// Size: 0x22
function function_c7d1bf4975ea9e7c(var_a37a6bddb2dc6057) {
    /#
        assert(var_a37a6bddb2dc6057 > 0);
    #/
    self.tickRate = var_a37a6bddb2dc6057;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d7
// Size: 0xb2
function function_70c6bcd3c644aad9(var_87599197ac030074, var_493b21b5a38a3cb9, var_e97e39807ca43a40, var_60fa6d142c5b7434, var_b72b14124763db6c) {
    /#
        assert(var_87599197ac030074 > 0);
    #/
    self.var_e0c4123baae7b409 = float(var_87599197ac030074);
    if (isdefined(self.var_48902651925ff62c)) {
        /#
            assertex(var_493b21b5a38a3cb9 != 0 && isdefined(var_e97e39807ca43a40) && var_e97e39807ca43a40 > 0, "RadiationERROR: damage_increase and damage_increase_rate must both be defined and nonzero or must both be undefined.");
        #/
        self.var_48902651925ff62c = float(var_493b21b5a38a3cb9);
        self.var_725a385a83f94afe = float(var_e97e39807ca43a40);
        if (isdefined(var_60fa6d142c5b7434)) {
            goto LOC_0000009d;
        }
        self.var_39ee092269d3f4ea = undefined;
        self.var_359d6c40a8b0c1ca = var_b72b14124763db6c;
    }
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x990
// Size: 0x33
function function_8d2c769c2869e6b1() {
    if (!istrue(self.var_55cf46878c46af61)) {
        return undefined;
    }
    return distance2d(self.var_828323b769725dbf, self.var_b70884a49ee01c84) / self.var_7bf9ce32347ac445;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cb
// Size: 0x2f
function function_843f66591b4abb4d() {
    if (!istrue(self.var_55cf46878c46af61)) {
        return undefined;
    }
    return (self.var_89748805c0fc52e3 - self.var_c939535a8d2d4870) / self.var_7bf9ce32347ac445;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa02
// Size: 0x25
function function_1b4f63fa623de69a(pos) {
    return distance2dsquared(pos, self.origin) < self.radiussq;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa2f
// Size: 0x25
function function_b9aa944decd263a3(pos) {
    return distance2d(pos, self.origin) - self.radius;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5c
// Size: 0x53
function function_fde05749af14d99c(pos) {
    if (!istrue(self.var_55cf46878c46af61)) {
        return undefined;
    }
    target_radius = distance2d(pos, self.var_b70884a49ee01c84);
    var_cb1266fc7c6603bb = function_843f66591b4abb4d();
    return (target_radius - self.radius) / var_cb1266fc7c6603bb;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab7
// Size: 0x17a
function function_f66420bd66f3075f() {
    level endon("game_ended");
    self endon("death");
    if (!namespace_e47104b48662385b::_isalive()) {
        return;
    }
    if (istrue(self.isjuggernaut)) {
        return;
    }
    if (isdefined(self.var_e1ae76f612117580) && gettime() < self.var_e1ae76f612117580) {
        return;
    }
    self.var_e1ae76f612117580 = gettime() + level.radiation.var_d353ab97fc4b82c0;
    if (!isai(self)) {
        self playsoundtoplayer("gas_player_cough", self, self);
    }
    var_4de0f8859b1a8d67 = "allies_male_cough";
    if (isdefined(self.defaultoperatorteam) && self.defaultoperatorteam == "axis") {
        if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
            var_4de0f8859b1a8d67 = "axis_female_cough";
        } else {
            var_4de0f8859b1a8d67 = "axis_male_cough";
        }
    } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        var_4de0f8859b1a8d67 = "allies_female_cough";
    } else {
        var_4de0f8859b1a8d67 = "allies_male_cough";
    }
    var_d4eb9b956e707234 = randomint(game["dialogue"][var_4de0f8859b1a8d67].size);
    var_818f7c4cf3588018 = game["dialogue"][var_4de0f8859b1a8d67][var_d4eb9b956e707234];
    self playsound(var_818f7c4cf3588018, self, self);
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc38
// Size: 0xd
function function_1b42b4ffc7748d8d() {
    return isdefined(level.radiation);
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4d
// Size: 0x6a
function function_a611746a5dbb32ac(pos) {
    closest_distance = 999999;
    var_bbbf37c7cb837977 = sortbydistance(level.radiation.instances, pos);
    if (var_bbbf37c7cb837977.size > 0) {
        return (distance2d(pos, var_bbbf37c7cb837977[0].origin) - var_bbbf37c7cb837977[0].radius);
    }
    return closest_distance;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcbf
// Size: 0x12d
function private function_3b5ce53109b60075() {
    level endon("game_ended");
    self endon("radiation_destroyed");
    while (self.active) {
        waitframe();
        if (istrue(self.var_55cf46878c46af61)) {
            progress = self.var_b6b423f4ed3f7a2d / self.var_7bf9ce32347ac445;
            if (progress >= 1) {
                progress = 1;
            }
            self.origin = vectorlerp(self.var_b70884a49ee01c84, self.var_828323b769725dbf, progress);
            self.radius = math::lerp(self.var_c939535a8d2d4870, self.var_89748805c0fc52e3, progress);
            self.radiussq = self.radius * self.radius;
            if (game_utility::function_acaa75ca8754452e()) {
                game_utility::function_6e148c8da2e4db13(self.origin);
                game_utility::function_4584ad1c0e2c58ec(self.radius);
            }
            callback::callback("radiation_transform_update");
            self.var_b6b423f4ed3f7a2d = self.var_b6b423f4ed3f7a2d + level.framedurationseconds;
            if (progress >= 1) {
                self.var_55cf46878c46af61 = undefined;
                callback::callback("radiation_transform_completed");
            }
        }
    }
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdf3
// Size: 0x3ca
function private function_242555e5ab28a44c() {
    level endon("game_ended");
    self endon("radiation_destroyed");
    self.var_16b2e5a6752ec4e0 = [];
    self.var_8b468934c883d916 = [];
    while (self.active) {
        wait(self.tickRate);
        foreach (player in level.players) {
            var_223ed137a7efba62 = player getentitynumber();
            var_c5fff5b131a6ec21 = function_1b4f63fa623de69a(player.origin);
            if (var_c5fff5b131a6ec21) {
                if (!isdefined(self.var_16b2e5a6752ec4e0[var_223ed137a7efba62])) {
                    self.var_16b2e5a6752ec4e0[var_223ed137a7efba62] = gettime();
                    self.var_8b468934c883d916[var_223ed137a7efba62] = 0;
                    callback::callback("player_entered_radiation", {player:player});
                }
            } else if (isdefined(self.var_16b2e5a6752ec4e0[var_223ed137a7efba62])) {
                self.var_16b2e5a6752ec4e0[var_223ed137a7efba62] = undefined;
                self.var_8b468934c883d916[var_223ed137a7efba62] = undefined;
                callback::callback("player_exited_radiation", {player:player});
            }
            if (!isalive(player)) {
                continue;
            }
            damage = 0;
            if (!var_c5fff5b131a6ec21 || istrue(player.plotarmor)) {
                damage = 0;
            } else if (!istrue(self.var_359d6c40a8b0c1ca) && isdefined(self.var_48902651925ff62c) && isdefined(self.var_725a385a83f94afe)) {
                damage = self.var_e0c4123baae7b409 + function_52336389b0bbc8(var_223ed137a7efba62);
            } else {
                damage = self.var_e0c4123baae7b409;
            }
            if (gasmask::hasgasmask(player) && !istrue(player.gasmaskswapinprogress)) {
                if (var_c5fff5b131a6ec21) {
                    if (isdefined(level.var_f26b4e7eb9af8155)) {
                        player [[ level.var_f26b4e7eb9af8155 ]]("radiation");
                    }
                    if (damage > 0) {
                        player gasmask::processdamage(damage);
                        damage = 0;
                    }
                } else if (isdefined(level.var_c57ee1e174e42601)) {
                    player [[ level.var_c57ee1e174e42601 ]]("radiation");
                }
            }
            if (var_c5fff5b131a6ec21 && !istrue(player.plotarmor) && istrue(self.var_359d6c40a8b0c1ca) && isdefined(self.var_48902651925ff62c) && isdefined(self.var_725a385a83f94afe)) {
                damage = self.var_e0c4123baae7b409 + function_52336389b0bbc8(var_223ed137a7efba62);
            }
            if (damage > 0) {
                if (self.var_8b468934c883d916[var_223ed137a7efba62] > 0) {
                    damage = damage + self.var_8b468934c883d916[var_223ed137a7efba62];
                    self.var_8b468934c883d916[var_223ed137a7efba62] = 0;
                }
                var_cde91fd1c90bf3ea = int(damage);
                var_f8eb768a4c117206 = damage - float(var_cde91fd1c90bf3ea);
                if (var_f8eb768a4c117206 > 0.01) {
                    self.var_8b468934c883d916[var_223ed137a7efba62] = var_f8eb768a4c117206;
                }
                if (var_cde91fd1c90bf3ea <= 0) {
                    /#
                        assertmsg("RadiationERROR: Damage [" + damage + "] was less than or equal to zero after converting to int; bumping it up to base damage [" + self.var_e0c4123baae7b409 + "].");
                    #/
                    var_cde91fd1c90bf3ea = self.var_e0c4123baae7b409;
                }
                player dodamage(var_cde91fd1c90bf3ea, player.origin, player, undefined, "MOD_TRIGGER_HURT", level.radiation.damageweapon);
                player armor::damagearmor(var_cde91fd1c90bf3ea, undefined, player, "MOD_TRIGGER_HURT");
                if (randomint(100) < level.radiation.var_7e8f3d6aa260f249) {
                    player function_f66420bd66f3075f();
                }
                player callback::callback("radiation_damage_player", {damage:var_cde91fd1c90bf3ea, radiation:self});
            }
        }
    }
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11c4
// Size: 0xb1
function private function_52336389b0bbc8(var_223ed137a7efba62) {
    /#
        assert(isdefined(self.var_16b2e5a6752ec4e0[var_223ed137a7efba62]));
    #/
    /#
        assert(isdefined(self.var_48902651925ff62c) && isdefined(self.var_725a385a83f94afe));
    #/
    var_1686f8951144092a = (gettime() - self.var_16b2e5a6752ec4e0[var_223ed137a7efba62]) / 1000;
    var_150d6bbae4f030fd = self.var_48902651925ff62c * int(var_1686f8951144092a / self.var_725a385a83f94afe);
    if (isdefined(self.var_39ee092269d3f4ea) && var_150d6bbae4f030fd > self.var_39ee092269d3f4ea) {
        var_150d6bbae4f030fd = self.var_39ee092269d3f4ea;
    }
    return var_150d6bbae4f030fd;
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127d
// Size: 0xc4
function function_dfd00c666da7f557(params) {
    player = params.player;
    if (isdefined(self.visionset)) {
        if (istrue(self.var_85cb554cfa2fd3d3)) {
            player namespace_f15b4b82e231cf42::function_27a921508cb04613(self.visionset, self.var_50ba7325c62c2025);
        } else {
            player namespace_f15b4b82e231cf42::function_9a92ae402e209ecc(self.visionset, self.var_50ba7325c62c2025);
        }
    }
    if (istrue(self.var_75186cfe05cecd50)) {
        if (istrue(self.var_a2aa25ea43b31d54)) {
            player emp_debuff::play_scramble(self.var_a292f5812d40eb56, self.var_208cf23d5ed8f1f4);
        } else {
            player emp_debuff::stop_scramble(self.var_a292f5812d40eb56, self.var_208cf23d5ed8f1f4);
        }
    }
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1348
// Size: 0xc4
function function_e6d761d1927e2ed1(params) {
    player = params.player;
    if (isdefined(self.visionset)) {
        if (istrue(self.var_85cb554cfa2fd3d3)) {
            player namespace_f15b4b82e231cf42::function_9a92ae402e209ecc(self.visionset, self.var_50ba7325c62c2025);
        } else {
            player namespace_f15b4b82e231cf42::function_27a921508cb04613(self.visionset, self.var_50ba7325c62c2025);
        }
    }
    if (istrue(self.var_75186cfe05cecd50)) {
        if (istrue(self.var_a2aa25ea43b31d54)) {
            player emp_debuff::stop_scramble(self.var_a292f5812d40eb56, self.var_208cf23d5ed8f1f4);
        } else {
            player emp_debuff::play_scramble(self.var_a292f5812d40eb56, self.var_208cf23d5ed8f1f4);
        }
    }
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1413
// Size: 0x1f0
function private function_8748260c33092d78() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4be3bac3c965bcba);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_ac6bb9d851bcc44e);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_ce70103321b44d61);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_8203c9bd3f33309e);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_ff46c564f2ccba22);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_78a309e6d9473c1a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_78a309e6d9473c1a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_78a309e6d9473c1a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_dcd293b3ab646634);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_dcd293b3ab646634);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_dcd293b3ab646634);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_dcd293b3ab646634);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_329a7f5688224786);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3b86c53c8320156b);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_37df17632b76cff3);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_f1ce2bcb6075f617);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_f1ce2bcb6075f617);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_f1ce2bcb6075f617);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_f1ce2bcb6075f617);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_f1ce2bcb6075f617);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_f1ce2bcb6075f617);
        devgui::function_fe953f000498048f();
        level thread function_8c073da924b036f8();
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x160a
// Size: 0x1ef
function private function_8c073da924b036f8() {
    /#
        level endon("<unknown string>");
        var_c046f169b0a7720d = 0;
        while (1) {
            if (var_c046f169b0a7720d != 5) {
                var_c046f169b0a7720d = var_c046f169b0a7720d + 1;
                waitframe();
                continue;
            }
            var_c046f169b0a7720d = 0;
            if (isdefined(level.radiation.var_909512e52515e78)) {
                cylinder(level.radiation.var_909512e52515e78.origin, level.radiation.var_909512e52515e78.origin + (0, 0, 10000), level.radiation.var_909512e52515e78.radius, (1, 0, 0), 0, 5);
                line(level.radiation.var_909512e52515e78.origin - (level.radiation.var_909512e52515e78.radius, 0, 0), level.radiation.var_909512e52515e78.origin + (level.radiation.var_909512e52515e78.radius, 0, 0), (1, 0, 0), 1, 0, 5);
                line(level.radiation.var_909512e52515e78.origin - (0, level.radiation.var_909512e52515e78.radius, 0), level.radiation.var_909512e52515e78.origin + (0, level.radiation.var_909512e52515e78.radius, 0), (1, 0, 0), 1, 0, 5);
            }
        }
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1800
// Size: 0x29
function function_4be3bac3c965bcba() {
    /#
        return create((0, 0, 0), 2048, 1.5, "<unknown string>", 1);
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1830
// Size: 0x9b
function function_ac6bb9d851bcc44e() {
    /#
        player = level.players[0];
        forward = anglestoforward(player getplayerangles());
        trace = trace::ray_trace(player geteye(), player geteye() + forward * 150000);
        if (isdefined(trace["<unknown string>"]) && isdefined(trace["<unknown string>"]) && trace["<unknown string>"] < 1) {
            return create(trace["<unknown string>"], 2048, 1.5, "<unknown string>", 1);
        }
        return undefined;
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18d2
// Size: 0x108
function function_ce70103321b44d61() {
    /#
        if (level.radiation.instances.size == 0) {
            return;
        }
        player = level.players[0];
        forward = anglestoforward(player getplayerangles());
        trace = trace::ray_trace(player geteye(), player geteye() + forward * 150000);
        if (isdefined(trace["<unknown string>"]) && isdefined(trace["<unknown string>"]) && trace["<unknown string>"] < 1) {
            level.radiation.instances = sortbydistance(level.radiation.instances, trace["<unknown string>"]);
            level.radiation.var_909512e52515e78 = level.radiation.instances[0];
        } else {
            level.radiation.var_909512e52515e78 = undefined;
        }
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e1
// Size: 0x19
function function_8203c9bd3f33309e() {
    /#
        level.radiation.var_909512e52515e78 = undefined;
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a01
// Size: 0x43
function function_ff46c564f2ccba22() {
    /#
        if (!isdefined(level.radiation.var_909512e52515e78)) {
            iprintlnbold("<unknown string>");
            return;
        }
        level.radiation.var_909512e52515e78 destroy();
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4b
// Size: 0x13a
function function_dcd293b3ab646634(params) {
    /#
        if (!isdefined(level.radiation.var_909512e52515e78)) {
            iprintlnbold("<unknown string>");
            return;
        }
        direction = params[0];
        dist = int(params[1]);
        time = int(params[2]);
        offset = (0, 0, 0);
        switch (direction) {
        case #"hash_f96ec5f6bcd1b209":
            offset = (0, dist, 0);
            break;
        case #"hash_f96ec4f6bcd1b076":
            offset = (dist, 0, 0);
            break;
        case #"hash_f95bc1f6bcc2a133":
            offset = (0, dist * -1, 0);
            break;
        case #"hash_f95bc0f6bcc29fa0":
            offset = (dist * -1, 0, 0);
            break;
        }
        level.radiation.var_909512e52515e78 transform(level.radiation.var_909512e52515e78.origin + offset, level.radiation.var_909512e52515e78.radius, time);
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8c
// Size: 0xb0
function function_78a309e6d9473c1a(params) {
    /#
        if (!isdefined(level.radiation.var_909512e52515e78)) {
            iprintlnbold("<unknown string>");
            return;
        }
        increase = int(params[0]);
        time = int(params[1]);
        level.radiation.var_909512e52515e78 transform(level.radiation.var_909512e52515e78.origin, level.radiation.var_909512e52515e78.radius + increase, time);
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c43
// Size: 0x66
function function_329a7f5688224786() {
    /#
        if (!isdefined(level.radiation.var_909512e52515e78)) {
            iprintlnbold("<unknown string>");
            return;
        }
        level.radiation.var_909512e52515e78.var_75186cfe05cecd50 = !istrue(level.radiation.var_909512e52515e78.var_75186cfe05cecd50);
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb0
// Size: 0x66
function function_3b86c53c8320156b() {
    /#
        if (!isdefined(level.radiation.var_909512e52515e78)) {
            iprintlnbold("<unknown string>");
            return;
        }
        level.radiation.var_909512e52515e78.var_a2aa25ea43b31d54 = !istrue(level.radiation.var_909512e52515e78.var_a2aa25ea43b31d54);
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1d
// Size: 0x66
function function_37df17632b76cff3() {
    /#
        if (!isdefined(level.radiation.var_909512e52515e78)) {
            iprintlnbold("<unknown string>");
            return;
        }
        level.radiation.var_909512e52515e78.var_208cf23d5ed8f1f4 = !istrue(level.radiation.var_909512e52515e78.var_208cf23d5ed8f1f4);
    #/
}

// Namespace radiation/namespace_6d781a0248843409
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8a
// Size: 0x58
function function_f1ce2bcb6075f617(params) {
    /#
        if (!isdefined(level.radiation.var_909512e52515e78)) {
            iprintlnbold("<unknown string>");
            return;
        }
        level.radiation.var_909512e52515e78.var_a292f5812d40eb56 = int(params[0]);
    #/
}

