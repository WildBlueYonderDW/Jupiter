// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_53aac5ae7d2ac1b4;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_dlog.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_7f1caea61250f0a1;

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3d7
// Size: 0x14
function autoexec main() {
    function_c0b3ddc9a6bdcc46("veh9_palfa", &function_3ef5f926204cbd9e);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f2
// Size: 0x22d
function private function_3ef5f926204cbd9e() {
    if (!function_9697379150687859("veh9_palfa")) {
        return;
    }
    level.var_48e4bd8587968f9 = getdvarfloat(@"hash_63997342447b8b87", 1);
    level.var_6d2d9d6d9a73cc7 = getdvarfloat(@"hash_90e419f6d32eba39", 1);
    level.var_3e1c52fb7c3f1bc9 = getdvarfloat(@"hash_e2da3b6e24619503", 1.2);
    level.var_6f19dd2299ccde22 = getdvarfloat(@"hash_b0aeaf5f49bc9880", 1);
    level.var_c7432004084941b0 = getdvarfloat(@"hash_14a693e48ce554c2", 0.5);
    level.var_45a061f49e1c9a50 = getdvarfloat(@"hash_6ca40904bced7f47", 0.9);
    level.var_c5a60af4413f9fa9 = getdvarfloat(@"hash_48d77161e444423f", 0.5);
    level.var_d2ec30f44a87286d = getdvarfloat(@"hash_5514bb61ec6780cb", 0.2);
    level.var_7b0c541baa0443ef = getdvarfloat(@"hash_cfa87dc67c8884dd", 0.05);
    level.var_5b4e83373390b0be = getdvarfloat(@"hash_be17ad18edc41a8", 0.2);
    level.var_bab8ebdbb45d860 = getdvarfloat(@"hash_6ee8bc7a35a3cdaa", 0.4);
    callbacks = [];
    callbacks["spawn"] = &function_31f42ad9450cb938;
    callbacks["enterStart"] = &function_c92daf0d2d3b4c32;
    callbacks["enterEnd"] = &function_1238715fb4ade17;
    callbacks["exitEnd"] = &function_b8efede8329d0df1;
    callbacks["reenter"] = &function_90edb9e4cbf08215;
    callbacks["outOfFuel"] = &function_c2ae8b4f4def3709;
    callbacks["beginBurnDown"] = &function_d35260397fd3eba0;
    callbacks["interactsWithOOBTrigger"] = &function_f7f993d241e44b19;
    callbacks["onStartRiding"] = &function_153a6accf001dff6;
    callbacks["onEndRiding"] = &function_71adb8f84c3df6bb;
    callbacks["isInInterior"] = &function_3d25af3a88ad31c3;
    callbacks["onEnterInterior"] = &function_3ffe455e5ea6d0f5;
    callbacks["onExitInterior"] = &function_b2cc563ed7324a8d;
    callbacks["forceOOBEnable"] = &function_dec1987f9ee988c6;
    function_8497e7e46b5e397("veh9_palfa", callbacks);
    function_92b52877803f326a();
    vehicle_damage_setpremoddamagecallback("veh9_palfa", &function_1062a7fd4b6d46a5);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x626
// Size: 0x2f
function private function_92b52877803f326a() {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle("veh9_palfa", 1);
    var_e2818ad39a3341b4.ammoids["flares"] = 1;
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x65c
// Size: 0x89
function private function_1062a7fd4b6d46a5(data) {
    return !isdefined(data) || !isdefined(data.inflictor) || !isdefined(data.inflictor.classname) || data.inflictor.classname != "trigger_hurt" || !isdefined(self) || !isdefined(self.origin) || ispointinvolume(self.origin, data.inflictor);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6ed
// Size: 0x25
function private function_f7f993d241e44b19(trigger, vehicle) {
    return ispointinvolume(vehicle.origin, trigger);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x71a
// Size: 0xd0
function private function_31f42ad9450cb938(spawndata, var_ee8da5624236dc89) {
    vehicle = function_bba34cf920370ff4("veh9_palfa", spawndata, var_ee8da5624236dc89);
    if (!isdefined(vehicle)) {
        return undefined;
    }
    vehicle.borntime = gettime();
    vehicle.flareslive = [];
    vehicle.flareready = 1;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        vehicle.flarecooldown = 35;
    } else {
        vehicle.flarecooldown = 10;
    }
    vehicle.entstouching = [];
    vehicle thread vehicle_handleflarerecharge();
    vehicle thread collision_damage_watcher();
    if (istrue(spawndata.var_cae20238ee346e02)) {
        vehicle.ishovering = 1;
        vehicle function_d2e41c7603ba7697("p2p");
    }
    return vehicle;
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f2
// Size: 0x26
function private function_c2ae8b4f4def3709() {
    if (istrue(self.ishovering)) {
        self.ishovering = 0;
        self function_6a325f91941ed47c("p2p");
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x81f
// Size: 0x31
function private function_d35260397fd3eba0() {
    if (istrue(self.ishovering)) {
        self.ishovering = 0;
        self function_6a325f91941ed47c("p2p");
    }
    self.var_e114008648967bfb = 1;
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x857
// Size: 0x25b
function private collision_damage_watcher() {
    self endon("death");
    self vehphys_enablecollisioncallback(1);
    while (1) {
        partenum = ent = normalspeed = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        if (gettime() - self.borntime < 5000) {
            continue;
        }
        if (isdefined(ent) && istrue(ent.iscrossbowbolt)) {
            continue;
        }
        if (isdefined(ent) && isdefined(ent.helperdronetype) && ent.helperdronetype == "radar_drone_recon") {
            continue;
        }
        damagefactor = normalspeed;
        if (isdefined(self.var_70ec04f736523dd0)) {
            damagefactor = damagefactor * self vehicle_gettopspeedforward() / self.var_70ec04f736523dd0;
        }
        var_2d65c754072c9542 = 0;
        if (damagefactor > level.var_c5a60af4413f9fa9) {
            range = level.var_45a061f49e1c9a50 - level.var_c5a60af4413f9fa9;
            var_6d3017665ec227e0 = (damagefactor - level.var_c5a60af4413f9fa9) / range;
            var_ed91f3ec33af8c15 = self.maxhealth * level.var_5b4e83373390b0be;
            var_8516b2bf8f4da6d7 = self.maxhealth * level.var_bab8ebdbb45d860;
            var_2d65c754072c9542 = math::lerp(var_ed91f3ec33af8c15, var_8516b2bf8f4da6d7, var_6d3017665ec227e0);
        } else if (damagefactor > level.var_d2ec30f44a87286d) {
            var_2d65c754072c9542 = self.maxhealth * level.var_7b0c541baa0443ef;
        } else {
            continue;
        }
        if (istrue(self.var_e114008648967bfb) && (length(self vehicle_getvelocity()) > 264 || isdefined(ent) && ent isvehicle() && length(ent vehicle_getvelocity()) > 264)) {
            var_2d65c754072c9542 = self.maxhealth;
        }
        if (var_2d65c754072c9542 > 0) {
            vehicle_damage_disablestatedamagefloor(1);
            self dodamage(var_2d65c754072c9542, position, undefined, undefined, "MOD_CRUSH");
            vehicle_damage_disablestatedamagefloor(0);
        }
        wait(0.5);
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xab9
// Size: 0x2f
function private function_e654f2c9ee8ea94a(var_1ae0aeb37c917298, data) {
    self setscriptablepartstate("alarm", "engineFailure", 0);
    namespace_5a0f3ca265d3a4c8::vehicle_damage_onenterstateheavy(var_1ae0aeb37c917298, data);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xaef
// Size: 0x2f
function private function_fb5146a15cb434d2(var_1ae0aeb37c917298, data) {
    self setscriptablepartstate("alarm", "off", 0);
    namespace_5a0f3ca265d3a4c8::vehicle_damage_onexitstateheavy(var_1ae0aeb37c917298, data);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb25
// Size: 0x15e
function private function_c92daf0d2d3b4c32(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(vehicle.israllypointvehicle)) {
        foreach (plr in level.players) {
            if (istrue(vehicle.revealed) || is_equal(plr.team, vehicle.team)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, plr);
            }
        }
        foreach (occupant in vehicle.occupants) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(vehicle.marker.objidnum, occupant);
        }
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(vehicle.marker.objidnum, player);
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc8a
// Size: 0x4f
function private function_1238715fb4ade17(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        player namespace_5078ee98abb32db9::parachutecleanup();
        function_cb229daefb97c2ee(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xce0
// Size: 0x8a
function private function_cb229daefb97c2ee(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (seatid == "driver") {
        vehicle thread vehicle_handleflarefire(player);
        vehicle notify("palfa_driver_enter");
        vehicle.ishovering = 0;
        vehicle function_6a325f91941ed47c("p2p");
    }
    vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
    if (isdefined(level.var_9215e3a9dfe8a262)) {
        [[ level.var_9215e3a9dfe8a262 ]](vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd71
// Size: 0x47
function private function_b8efede8329d0df1(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        function_d2053cec6126f014(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdbf
// Size: 0xdc
function private function_d2053cec6126f014(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (seatid == "driver") {
        vehicle notify("palfa_driver_exit");
        vehicle thread function_619d5050126cbfae(player);
    }
    if (!istrue(data.playerdisconnect)) {
        success = vehicle_occupancy_moveplayertoexit(vehicle, seatid, var_7558f98f3236963d, player, data);
        if (!success) {
            if (issharedfuncdefined("vehicle_occupancy", "handleSuicideFromVehicles")) {
                [[ getsharedfunc("vehicle_occupancy", "handleSuicideFromVehicles") ]](player);
            } else {
                player suicide();
            }
        } else if (istrue(vehicle.israllypointvehicle)) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, player);
        }
    }
    vehomn_updateomnvarsonseatexit(vehicle, seatid, var_7558f98f3236963d, player);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xea2
// Size: 0x82
function private function_619d5050126cbfae(player) {
    if (!isalive(player)) {
        self endon("death");
        self endon("palfa_driver_enter");
        wait(0.5);
    }
    if (!self vehicle_isonground() && distance(self.origin, function_653b91b3edf76c93()) > 350 && !istrue(self.ishovering) && !istrue(self.var_e114008648967bfb)) {
        self.ishovering = 1;
        self function_d2e41c7603ba7697("p2p");
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf2b
// Size: 0x143
function private function_653b91b3edf76c93() {
    contents = namespace_2a184fc4902783dc::create_solid_ai_contents(1);
    var_41302affd456fcb3 = self.origin - anglestoup(self.angles) * 400;
    /#
        if (getdvarint(@"hash_bedb65b7141dd04e", 0)) {
            sphere(self.origin, 100, (0, 0, 1), 0, 10000);
            sphere(var_41302affd456fcb3, 100, (0, 0, 1), 0, 10000);
        }
    #/
    pos = namespace_2a184fc4902783dc::sphere_trace(self.origin, var_41302affd456fcb3, 100, [0:self], contents)["position"];
    /#
        if (getdvarint(@"hash_bedb65b7141dd04e", 0)) {
            sphere(pos, 100, (1, 0, 0), 0, 10000);
            line(self.origin, pos, (1, 0, 0), 1, 0, 10000);
            print3d(pos, "handleSuicideFromVehicles" + distance(self.origin, pos), (1, 0, 0), 1, 1, 10000, 1);
        }
    #/
    return pos;
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1076
// Size: 0x2c
function private function_90edb9e4cbf08215(vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data) {
    
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a9
// Size: 0xda
function private vehicle_handleflarerecharge() {
    self endon("death");
    while (1) {
        driver = vehicle_occupancy_getdriver(self);
        if (self.flareready) {
            if (isdefined(driver)) {
                if (driver getclientomnvar("ui_veh_flares_charge_perc") < 1.05) {
                    driver setclientomnvar("ui_veh_flares_charge_perc", 1.05);
                    vehomn_setammo("veh9_palfa", "flares", 1, driver);
                }
            }
        } else {
            var_c770d2ae1cc0b405 = 0;
            while (var_c770d2ae1cc0b405 < self.flarecooldown) {
                wait(0.05);
                var_c770d2ae1cc0b405 = var_c770d2ae1cc0b405 + 0.05;
                var_e9227a816ed1d671 = var_c770d2ae1cc0b405 / self.flarecooldown;
                driver = vehicle_occupancy_getdriver(self);
                if (isdefined(driver)) {
                    driver setclientomnvar("ui_veh_flares_charge_perc", var_e9227a816ed1d671);
                }
            }
            self.flareready = 1;
        }
        waitframe();
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x118a
// Size: 0x20f
function private vehicle_handleflarefire(player) {
    self endon("death");
    self endon("palfa_driver_exit");
    player endon("death_or_disconnect");
    player endon("vehicle_exit");
    player notifyonplayercommand("shoot_flare", "+attack");
    vehomn_setammo("veh9_palfa", "flares", ter_op(self.flareready, 1, 0), player);
    while (1) {
        player waittill("shoot_flare");
        if (!self.flareready) {
            self playsoundtoplayer("lbravo_noflares_warning", player);
            continue;
        }
        if (issharedfuncdefined("flares", "playFx")) {
            self thread [[ getsharedfunc("flares", "playFx") ]](undefined, "tag_deathfx");
        }
        newtarget = undefined;
        if (issharedfuncdefined("flares", "deploy")) {
            newtarget = self [[ getsharedfunc("flares", "deploy") ]]();
        }
        if (isdefined(level.missiles)) {
            foreach (missile in level.missiles) {
                if (!isdefined(missile.origin) || !isdefined(missile.lockontarget) || missile.lockontarget != self) {
                    continue;
                }
                curdist = distance(self.origin, missile.origin);
                if (curdist < 4000) {
                    if (issharedfuncdefined("player", "doScoreEvent")) {
                        player thread [[ getsharedfunc("player", "doScoreEvent") ]]("manual_flare_missile_redirect");
                    }
                    clearprojectilelockedon(missile);
                    missile missile_settargetent(newtarget);
                    missile notify("missile_pairedWithFlare");
                }
            }
        }
        self.flareready = 0;
        vehomn_setammo("veh9_palfa", "flares", 0, player);
        vehicle_occupancy_fadeoutcontrols(player);
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13a0
// Size: 0x63
function private function_dec1987f9ee988c6() {
    self.forceoobenable = 1;
    foreach (player in self.var_8784c427b1af24a6) {
        function_6ff4f91590d55df6(player);
    }
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x140a
// Size: 0x12d
function private function_153a6accf001dff6(player) {
    if (isdefined(self.onstartriding)) {
        self [[ self.onstartriding ]](player);
    }
    if (!istrue(self.var_c547488f80d3eb28)) {
        namespace_84cff6185e39aa66::function_d2d9c09551d91164(self, player);
    }
    if (!isdefined(level.var_b531611b8d662db7)) {
        level.var_b531611b8d662db7 = getdvarint(@"hash_dee18061c0d4dfe", ter_op(namespace_36f464722d326bbe::isbrstylegametype(), 0, 1)) == 1;
    }
    if (level.var_b531611b8d662db7 || istrue(self.forceoobenable)) {
        vehicleteam = vehicle_occupancy_getteamfriendlyto(self);
        if (istrue(self.forceoobenable) && issharedfuncdefined("game", "onEnterOOBTrigger")) {
            function_6ff4f91590d55df6(player);
        } else if (isdefined(vehicleteam) && isdefined(player.team) && vehicleteam != "neutral" && vehicleteam != player.team && issharedfuncdefined("game", "onEnterOOBTrigger")) {
            function_6ff4f91590d55df6(player);
        } else {
            player.var_1f34845fdd0a6631 = undefined;
        }
    }
    vehicle_spawn_stopwatchingabandoned();
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x153e
// Size: 0xf3
function private function_71adb8f84c3df6bb(player) {
    if (isdefined(player)) {
        var_6d4d929e7c9d3e5c = isdefined(player.vehicle);
        var_76e18e906d26a7ec = var_6d4d929e7c9d3e5c && player.vehicle.vehiclename == self.vehiclename;
        if (!var_76e18e906d26a7ec && !istrue(self.var_c547488f80d3eb28)) {
            namespace_84cff6185e39aa66::function_5211953231a09ed5(self, player);
        }
        if (var_6d4d929e7c9d3e5c && !var_76e18e906d26a7ec) {
            player function_3bce3ba16965048a();
        }
        if (isdefined(self.onendriding)) {
            self [[ self.onendriding ]](player);
        }
        if (istrue(player.var_1f34845fdd0a6631) && isdefined(player.oob) && player.oob > 0 && issharedfuncdefined("game", "onExitOOBTrigger")) {
            function_6307ffe7f40fc2d0(player);
        }
    }
    thread vehicle_spawn_watchabandoned();
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1638
// Size: 0x8a
function private function_3bce3ba16965048a() {
    var_4bb8f9ddf7d0e8b0 = "driver";
    foreach (seatid, occupant in self.vehicle.occupants) {
        if (occupant == self) {
            var_4bb8f9ddf7d0e8b0 = seatid;
            break;
        }
    }
    waitframe();
    namespace_84cff6185e39aa66::vehomn_updateomnvarsonseatenter(self.vehicle, undefined, var_4bb8f9ddf7d0e8b0, self);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c9
// Size: 0x46
function private function_6ff4f91590d55df6(player) {
    /#
        assertex(issharedfuncdefined("game", "onEnterOOBTrigger"));
    #/
    player.var_1f34845fdd0a6631 = 1;
    function_f3bb4f4911a1beb2("game", "onEnterOOBTrigger", self, player);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1716
// Size: 0x38
function private function_6307ffe7f40fc2d0(player) {
    /#
        assertex(issharedfuncdefined("game", "onExitOOBTrigger"));
    #/
    function_f3bb4f4911a1beb2("game", "onExitOOBTrigger", self, player);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1755
// Size: 0x53
function private function_3d25af3a88ad31c3(player) {
    if (!isdefined(self) || !isalive(self) || !isdefined(self.origin) || !isdefined(player) || !isdefined(player.origin)) {
        return 0;
    }
    return function_773691f1a617f7d9(player.origin);
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17b0
// Size: 0x2a
function private function_3ffe455e5ea6d0f5(player) {
    player setclienttriggeraudiozonepartial("iw9_palfa_interior", "reverb", "weapon_reflection");
    player notify("entered_vehicle_interior");
}

// Namespace namespace_7f1caea61250f0a1/namespace_e0be878fcf65a96c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17e1
// Size: 0x25
function private function_b2cc563ed7324a8d(player) {
    if (isdefined(player)) {
        player clearclienttriggeraudiozone(0.5);
        player notify("exited_vehicle_interior");
    }
}

