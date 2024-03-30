// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
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

#namespace namespace_e5887d7e575ef250;

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2
// Size: 0x14
function main() {
    function_c0b3ddc9a6bdcc46("little_bird", &little_bird_init);
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bd
// Size: 0x1bd
function private little_bird_init() {
    if (!function_9697379150687859("little_bird")) {
        return;
    }
    level.lb_dmg_factor_driverless_collision = getdvarfloat(@"hash_e85cda72d3c3c14b", 4);
    level.var_78575fd6a5acb7d3 = getdvarfloat(@"hash_270ecb2b6990667f", 0.25);
    level.var_18cd46c9f47ec9fe = getdvarfloat(@"hash_b452f0068f4e43da", 0.75);
    level.lb_impulse_dmg_threshold_top = getdvarfloat(@"hash_3d4b0c0e7008d889", 0.9);
    level.lb_impulse_dmg_threshold_mid = getdvarfloat(@"hash_eeaced8fd62d7d31", 0.5);
    level.lb_impulse_dmg_threshold_low = getdvarfloat(@"hash_fada138fde409535", 0.2);
    level.lb_impulse_dmg_factor_low = getdvarfloat(@"hash_12c7a9c89bf6ed57", 0.1);
    level.lb_impulse_dmg_factor_mid_low = getdvarfloat(@"hash_dc50e2e689514b56", 0.2);
    level.lb_impulse_dmg_factor_mid_high = getdvarfloat(@"hash_555a8558a6d3b598", 0.75);
    level.lb_pitch_roll_dmg_threshold = getdvarfloat(@"hash_f1d6ba97f092c311", 55);
    level.lb_pitch_roll_dmg_factor = getdvarfloat(@"hash_c606efb22605e501", 10);
    level.lb_wood_surf_dmg_scalar = getdvarfloat(@"hash_4d381994cf7e3faa", 0.6);
    callbacks = [];
    callbacks["spawn"] = &little_bird_create;
    callbacks["enterStart"] = &little_bird_enterstart;
    callbacks["enterEnd"] = &little_bird_enterend;
    callbacks["exitEnd"] = &little_bird_exitend;
    function_8497e7e46b5e397("little_bird", callbacks);
    little_bird_initdamage();
    little_bird_initomnvars();
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x481
// Size: 0x2d
function private little_bird_initomnvars() {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle("little_bird");
    var_e2818ad39a3341b4.ammoids["flares"] = 1;
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b5
// Size: 0x42
function private little_bird_initdamage() {
    var_d2e455d494f8d46e = vehicle_damage_getleveldatafordamagestate("little_bird", "heavy", 1);
    var_d2e455d494f8d46e.onentercallback = &little_bird_onenterheavydamagestate;
    var_d2e455d494f8d46e.onexitcallback = &little_bird_onexitheavydamagestate;
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fe
// Size: 0x152
function private little_bird_create(spawndata, faildata) {
    spawndata.cannotbesuspended = 1;
    vehicle = function_bba34cf920370ff4("little_bird", spawndata, faildata);
    if (!isdefined(vehicle)) {
        return undefined;
    }
    vehicle.borntime = gettime();
    vehicle.flareslive = [];
    vehicle.flareready = 1;
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        vehicle.flarecooldown = 35;
    } else {
        vehicle.flarecooldown = 10;
    }
    vehicle thread vehicle_handleflarerecharge();
    vehicle thread collision_damage_watcher();
    vehicledata = function_29b4292c92443328("little_bird");
    if (istrue(vehicledata.ai.var_289df80e1ded586f) && istrue(spawndata.initai)) {
        vehicle.unload_land_offset = 112;
        vehicle.unload_hover_offset = 120;
        vehicle.script_badplace = 0;
        vehicle vehicle_setspeed(60, 20, 10);
        vehicle.preventrespawn = 1;
        vehicle.var_a8f4bb03b366aa80 = 1;
        vehicle.deathfunc = &vehicle_death;
        vehicle scripts/cp_mp/vehicles/vehicle_occupancy::function_a91927df280e94e4();
    }
    return vehicle;
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x658
// Size: 0x9c
function private function_403e79a58ca142a3(damageinfo, damagefactor) {
    if (!isdefined(damageinfo.damagefactor)) {
        damageinfo.damagefactor = damagefactor;
        /#
            damageinfo.debugstring = "missile_pairedWithFlare";
        #/
    } else {
        damageinfo.damagefactor = damageinfo.damagefactor * damagefactor;
        /#
            damageinfo.debugstring = damageinfo.debugstring + "<unknown string>";
        #/
    }
    /#
        damageinfo.debugstring = damageinfo.debugstring + damagefactor;
    #/
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6fb
// Size: 0x41e
function private collision_damage_watcher() {
    self endon("death");
    self vehphys_enablecollisioncallback(1);
    while (true) {
        body0, body1, flag0, flag1, position, normal, normalspeed, ent, partenum = self waittill("collision");
        if (gettime() - self.borntime < 5000) {
            /#
                collision_debug(position, normal, normalspeed, 0, "<unknown string>");
            #/
            continue;
        }
        if (isdefined(ent) && istrue(ent.iscrossbowbolt)) {
            /#
                collision_debug(position, normal, normalspeed, 0, "<unknown string>");
            #/
            continue;
        }
        if (isdefined(ent) && isdefined(ent.helperdronetype) && ent.helperdronetype == "radar_drone_recon") {
            /#
                collision_debug(position, normal, normalspeed, 0, "<unknown string>");
            #/
            continue;
        }
        if (istrue(self.var_a1a5d39c25c6d70b)) {
            /#
                collision_debug(position, normal, normalspeed, 0, "<unknown string>");
            #/
            continue;
        }
        damageinfo = spawnstruct();
        function_403e79a58ca142a3(damageinfo, normalspeed);
        if (isdefined(self.var_70ec04f736523dd0)) {
            function_403e79a58ca142a3(damageinfo, self vehicle_gettopspeedforward() / self.var_70ec04f736523dd0);
        }
        driver = vehicle_occupancy_getdriver(self);
        if (!isdefined(driver)) {
            function_403e79a58ca142a3(damageinfo, level.lb_dmg_factor_driverless_collision);
        }
        pitch = self.angles[0];
        if (pitch > 180) {
            pitch = pitch - 360;
        }
        if (abs(pitch) > level.lb_pitch_roll_dmg_threshold) {
            function_403e79a58ca142a3(damageinfo, level.lb_pitch_roll_dmg_factor);
        }
        roll = self.angles[2];
        if (roll > 180) {
            roll = roll - 360;
        }
        if (abs(roll) > level.lb_pitch_roll_dmg_threshold) {
            function_403e79a58ca142a3(damageinfo, level.lb_pitch_roll_dmg_factor);
        }
        down = anglestoup(self.angles) * -1;
        toposition = vectornormalize(position - self.origin);
        if (vectordot(toposition, down) > level.var_18cd46c9f47ec9fe) {
            function_403e79a58ca142a3(damageinfo, level.var_78575fd6a5acb7d3);
        }
        dmgval = 0;
        damagefactor = damageinfo.damagefactor;
        if (damagefactor > level.lb_impulse_dmg_threshold_top) {
            dmgval = self.maxhealth;
        } else if (damagefactor > level.lb_impulse_dmg_threshold_mid) {
            range = level.lb_impulse_dmg_threshold_top - level.lb_impulse_dmg_threshold_mid;
            factorscale = (damagefactor - level.lb_impulse_dmg_threshold_mid) / range;
            mindmg = self.maxhealth * level.lb_impulse_dmg_factor_mid_low;
            maxdmg = self.maxhealth * level.lb_impulse_dmg_factor_mid_high;
            dmgval = math::lerp(mindmg, maxdmg, factorscale);
        } else if (damagefactor > level.lb_impulse_dmg_threshold_low) {
            dmgval = self.maxhealth * level.lb_impulse_dmg_factor_low;
        }
        if (dmgval > 0) {
            if (isdefined(driver) && flag1 == 11534336) {
                dmgval = dmgval * level.lb_wood_surf_dmg_scalar;
            }
            vehicle_damage_disablestatedamagefloor(1);
            self dodamage(dmgval, position, undefined, undefined, "MOD_CRUSH");
            vehicle_damage_disablestatedamagefloor(0);
        }
        /#
            collision_debug(position, normal, normalspeed, dmgval, "<unknown string>" + damagefactor + "<unknown string>" + damageinfo.debugstring + "<unknown string>");
        #/
        wait(0.5);
    }
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb20
// Size: 0x1d
function private little_bird_onenterheavydamagestate(oldstateref, data) {
    scripts/cp_mp/vehicles/vehicle_damage::vehicle_damage_onenterstateheavy(oldstateref, data);
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb44
// Size: 0x1d
function private little_bird_onexitheavydamagestate(oldstateref, data) {
    scripts/cp_mp/vehicles/vehicle_damage::vehicle_damage_onexitstateheavy(oldstateref, data);
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb68
// Size: 0x15e
function private little_bird_enterstart(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(vehicle.israllypointvehicle)) {
        foreach (plr in level.players) {
            if (istrue(vehicle.revealed) || is_equal(plr.team, vehicle.team)) {
                scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(vehicle.marker.objidnum, plr);
            }
        }
        foreach (occupant in vehicle.occupants) {
            scripts/mp/objidpoolmanager::objective_playermask_hidefrom(vehicle.marker.objidnum, occupant);
        }
        scripts/mp/objidpoolmanager::objective_playermask_hidefrom(vehicle.marker.objidnum, player);
    }
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xccd
// Size: 0x4f
function private little_bird_enterend(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        player scripts/cp_mp/parachute::parachutecleanup();
        little_bird_enterendinternal(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd23
// Size: 0x94
function private little_bird_enterendinternal(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (seatid == "driver") {
        vehicle thread vehicle_handleflarefire(player);
        if (issharedfuncdefined("pmc_missions", "onEnterMediumBird")) {
            [[ getsharedfunc("pmc_missions", "onEnterMediumBird") ]](vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        }
    }
    vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
    if (isdefined(level.var_9215e3a9dfe8a262)) {
        [[ level.var_9215e3a9dfe8a262 ]](vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdbe
// Size: 0x47
function private little_bird_exitend(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        little_bird_exitendinternal(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe0c
// Size: 0xd2
function private little_bird_exitendinternal(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (seatid == "driver") {
        vehicle notify("little_bird_driver_exit");
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
            scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(vehicle.marker.objidnum, player);
        }
    }
    vehomn_updateomnvarsonseatexit(vehicle, seatid, var_7558f98f3236963d, player);
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xee5
// Size: 0xe1
function private vehicle_handleflarerecharge() {
    var_e9227a816ed1d671 = 1.05;
    self endon("death");
    while (true) {
        driver = vehicle_occupancy_getdriver(self);
        if (self.flareready) {
            if (isdefined(driver)) {
                if (driver getclientomnvar("ui_veh_flares_charge_perc") < 1.05) {
                    driver setclientomnvar("ui_veh_flares_charge_perc", 1.05);
                    vehomn_setammo("little_bird", "flares", 1, driver);
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

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfcd
// Size: 0x209
function private vehicle_handleflarefire(player) {
    self endon("death");
    self endon("little_bird_driver_exit");
    player endon("death_or_disconnect");
    player endon("vehicle_exit");
    player notifyonplayercommand("shoot_flare", "+attack");
    vehomn_setammo("little_bird", "flares", ter_op(self.flareready, 1, 0), player);
    while (true) {
        player waittill("shoot_flare");
        if (!self.flareready) {
            self playsoundtoplayer("lbravo_noflares_warning", player);
            continue;
        }
        if (issharedfuncdefined("flares", "playFx")) {
            self thread [[ getsharedfunc("flares", "playFx") ]]();
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
        vehomn_setammo("little_bird", "flares", 0, player);
        vehicle_occupancy_fadeoutcontrols(player);
    }
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x11dd
// Size: 0x66
function collision_debug(position, normal, normalspeed, damage, debugstring) {
    /#
        if (!getdvarint(@"hash_e1b0993f344fdd75", 0)) {
            return;
        }
        if (!isdefined(level.var_569260d6901267c4)) {
            level.var_569260d6901267c4 = 0;
        }
        thread function_6ae603e37e7a394f(position, normal, normalspeed, damage, debugstring);
    #/
}

// Namespace namespace_e5887d7e575ef250 / namespace_d8c2d739478db8bb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x124a
// Size: 0x1b0
function function_6ae603e37e7a394f(position, normal, normalspeed, damage, debugstring) {
    /#
        self endon("<unknown string>");
        self notify("<unknown string>" + level.var_569260d6901267c4);
        self endon("<unknown string>" + level.var_569260d6901267c4 + 10);
        level.var_569260d6901267c4++;
        minradius = 3;
        maxradius = 30;
        size = minradius + normalspeed * maxradius;
        org = self.origin;
        up = anglestoup(self.angles);
        org = self.origin;
        ang = self.angles;
        while (true) {
            if (damage > 0) {
                color = (1, 0, 0);
            } else {
                color = (1, 1, 1);
            }
            result = transformmove(self.origin, self.angles, org, ang, position, (0, 0, 0));
            newpos = result["<unknown string>"];
            sphere(newpos, size, color, 1, 1);
            print3d(newpos, "missile_pairedWithFlare" + damage, color, 1, 0.5, 1, 1);
            if (isdefined(debugstring)) {
                print3d(newpos - (0, 0, 10), debugstring, color, 1, 0.25, 1, 1);
            }
            waitframe();
        }
    #/
}

