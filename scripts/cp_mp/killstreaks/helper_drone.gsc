// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\engine\trace.gsc;
#using script_6d68cfdf0836123c;
#using script_249f45d992af1114;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using script_5f903436642211af;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;

#namespace helper_drone;

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130e
// Size: 0xb45
function init() {
    level.helperdronesettings = [];
    namespace_893ac0cf28c5af44::init();
    namespace_8a82a4967e25efd4::init();
    level.helperdronesettings["radar_drone_overwatch"] = spawnstruct();
    level.helperdronesettings["radar_drone_overwatch"].timeout = 45;
    level.helperdronesettings["radar_drone_overwatch"].maxhealth = 700;
    level.helperdronesettings["radar_drone_overwatch"].hitstokill = 3;
    level.helperdronesettings["radar_drone_overwatch"].speed = 100;
    level.helperdronesettings["radar_drone_overwatch"].accel = 10;
    level.helperdronesettings["radar_drone_overwatch"].halfsize = 50;
    level.helperdronesettings["radar_drone_overwatch"].spawndist = 100;
    level.helperdronesettings["radar_drone_overwatch"].streakname = "radar_drone_overwatch";
    level.helperdronesettings["radar_drone_overwatch"].vehicleinfo = "veh_radar_drone_overwatch_mp";
    level.helperdronesettings["radar_drone_overwatch"].modelbase = "veh8_mil_air_mquebec8_small";
    level.helperdronesettings["radar_drone_overwatch"].modelbasealt = "veh8_mil_air_mquebec8_small_east";
    level.helperdronesettings["radar_drone_overwatch"].teamsplash = "used_radar_drone_overwatch";
    level.helperdronesettings["radar_drone_overwatch"].destroyedsplash = "callout_destroyed_radar_drone_overwatch";
    level.helperdronesettings["radar_drone_overwatch"].sound_explode = "radar_drone_explode";
    level.helperdronesettings["radar_drone_overwatch"].vodestroyed = "destroyed_radar_drone_overwatch";
    level.helperdronesettings["radar_drone_overwatch"].votimedout = "timeout_radar_drone_overwatch";
    level.helperdronesettings["radar_drone_overwatch"].scorepopup = "destroyed_radar_drone_overwatch";
    level.helperdronesettings["radar_drone_overwatch"].playfxcallback = &function_56966b077270a18e;
    level.helperdronesettings["radar_drone_overwatch"].standupoffset = 120;
    level.helperdronesettings["radar_drone_overwatch"].crouchupoffset = 80;
    level.helperdronesettings["radar_drone_overwatch"].proneupoffset = 46;
    level.helperdronesettings["radar_drone_overwatch"].backoffset = 124;
    level.helperdronesettings["radar_drone_overwatch"].sideoffset = 55;
    level.helperdronesettings["radar_drone_overwatch"].primarymode = "RADAR";
    level.helperdronesettings["radar_drone_overwatch"].primarymodestring = "KILLSTREAKS_HINTS/RCD_RADAR";
    level.helperdronesettings["radar_drone_overwatch"].primarymodefunc = &setoverwatchmodesettings;
    level.helperdronesettings["radar_drone_overwatch"].premoddamagefunc = undefined;
    level.helperdronesettings["radar_drone_overwatch"].postmoddamagefunc = &function_caf721cb23374e2b;
    level.helperdronesettings["radar_drone_overwatch"].deathfunc = &function_ba1c5496f8fc5f67;
    level.helperdronesettings["radar_drone_overwatch"].deployweaponname = "ks_gesture_generic_mp";
    level.helperdronesettings["scrambler_drone_guard"] = spawnstruct();
    level.helperdronesettings["scrambler_drone_guard"].timeout = 45;
    level.helperdronesettings["scrambler_drone_guard"].maxhealth = 225;
    level.helperdronesettings["scrambler_drone_guard"].speed = 140;
    level.helperdronesettings["scrambler_drone_guard"].accel = 20;
    level.helperdronesettings["scrambler_drone_guard"].halfsize = 50;
    level.helperdronesettings["scrambler_drone_guard"].spawndist = 100;
    level.helperdronesettings["scrambler_drone_guard"].streakname = "scrambler_drone_guard";
    level.helperdronesettings["scrambler_drone_guard"].modelbase = "veh9_mil_air_cuniform_mp";
    level.helperdronesettings["scrambler_drone_guard"].teamsplash = "used_scrambler_drone_guard";
    level.helperdronesettings["scrambler_drone_guard"].destroyedsplash = "callout_destroyed_scrambler_drone_guard";
    level.helperdronesettings["scrambler_drone_guard"].sound_explode = "scrambler_drone_explode";
    level.helperdronesettings["scrambler_drone_guard"].vodestroyed = undefined;
    level.helperdronesettings["scrambler_drone_guard"].votimedout = undefined;
    level.helperdronesettings["scrambler_drone_guard"].scorepopup = "destroyed_scrambler_drone_guard";
    level.helperdronesettings["scrambler_drone_guard"].playfxcallback = &function_56966b077270a18e;
    level.helperdronesettings["scrambler_drone_guard"].primarymodefunc = &setguardmode;
    level.helperdronesettings["scrambler_drone_guard"].premoddamagefunc = undefined;
    level.helperdronesettings["scrambler_drone_guard"].postmoddamagefunc = undefined;
    level.helperdronesettings["scrambler_drone_guard"].deathfunc = undefined;
    level.helperdronesettings["scrambler_drone_guard"].var_5d9d3e47b1b88b84 = &function_e89890de385d2d9e;
    level.helperdronesettings["scrambler_drone_guard"].damagemonitorfunc = &helperdrone_watchdamage;
    level.helperdronesettings["scrambler_drone_guard"].deployweaponname = "ks_gesture_phone_mp";
    level.helperdronesettings["scrambler_drone_guard"].var_5c6a7212bf9fcbea = 1;
    level.helperdronesettings["scrambler_drone_guard"].dropfunc = &function_dd2172321d232563;
    gametype = "";
    if (issharedfuncdefined("game", "getGameType")) {
        gametype = [[ getsharedfunc("game", "getGameType") ]]();
    }
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (var_e005d4b70d6f2611 || gametype == "cp_survival") {
        level.helperdronesettings["radar_drone_recon"].diewithowner = 1;
        level.helperdronesettings["scrambler_drone_guard"].diewithowner = 1;
        level.helperdronesettings["radar_drone_overwatch"].diewithowner = 1;
    }
    level.helperdronesettings["ammo_drop"] = spawnstruct();
    level.helperdronesettings["ammo_drop"].timeout = undefined;
    level.helperdronesettings["ammo_drop"].maxhealth = 100;
    level.helperdronesettings["ammo_drop"].hitstokill = 3;
    level.helperdronesettings["ammo_drop"].speed = 60;
    level.helperdronesettings["ammo_drop"].accel = 20;
    level.helperdronesettings["ammo_drop"].halfsize = 30;
    level.helperdronesettings["ammo_drop"].spawndist = 100;
    level.helperdronesettings["ammo_drop"].streakname = "ammo_drop";
    level.helperdronesettings["ammo_drop"].vehicleinfo = "veh_delivery_drone_recon_mp";
    level.helperdronesettings["ammo_drop"].modelbase = "veh8_mil_air_malfa_big";
    level.helperdronesettings["ammo_drop"].teamsplash = "used_radar_drone_recon";
    level.helperdronesettings["ammo_drop"].destroyedsplash = "callout_destroyed_radar_drone_overwatch";
    level.helperdronesettings["ammo_drop"].sound_explode = "radar_drone_explode";
    level.helperdronesettings["ammo_drop"].vodestroyed = "ball_drone_backup_destroy";
    level.helperdronesettings["ammo_drop"].votimedout = "ball_drone_backup_timeout";
    level.helperdronesettings["ammo_drop"].scorepopup = "destroyed_radar_drone_recon";
    level.helperdronesettings["ammo_drop"].playfxcallback = &function_56966b077270a18e;
    level.helperdronesettings["ammo_drop"].standupoffset = 120;
    level.helperdronesettings["ammo_drop"].crouchupoffset = 80;
    level.helperdronesettings["ammo_drop"].proneupoffset = 46;
    level.helperdronesettings["ammo_drop"].backoffset = 124;
    level.helperdronesettings["ammo_drop"].sideoffset = 55;
    level.helperdronesettings["ammo_drop"].primarymodefunc = &setdeliverymodesettings;
    level.helperdronesettings["ammo_drop"].premoddamagefunc = undefined;
    level.helperdronesettings["ammo_drop"].postmoddamagefunc = &function_caf721cb23374e2b;
    level.helperdronesettings["ammo_drop"].deathfunc = &function_ba1c5496f8fc5f67;
    level.helperdronesettings["ammo_drop"].deployweaponname = "ks_gesture_generic_mp";
    if (issharedfuncdefined("helper_drone", "init")) {
        [[ getsharedfunc("helper_drone", "init") ]]();
    }
    level.incominghelperdrones = [];
    init_helper_drone_vo();
    init_helper_drone_anim();
    function_82d9de71444f6e33();
    /#
        setdevdvarifuninitialized(@"hash_7a8caf0393bed507", 60);
        setdevdvarifuninitialized(@"hash_2bdd5a15714e6e8f", 0);
        setdevdvarifuninitialized(@"hash_5dba01914d06f31d", 50);
        setdevdvarifuninitialized(@"hash_728ad0e3aaae3e2b", 35);
        setdevdvarifuninitialized(@"hash_d9ffadbede7ac16b", 0);
        setdevdvarifuninitialized(@"hash_4ec1877ac00842c0", 0);
        setdevdvarifuninitialized(@"hash_166b0ad3d56b43f", 0);
        setdevdvarifuninitialized(@"hash_7786353439eb384c", 0);
    #/
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5a
// Size: 0x4e
function init_helper_drone_vo() {
    game["dialog"]["scrambler_drone_guard_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["scrambler_drone_guard_timeout"] = "killstreak_remote_operator" + "_timeout";
    game["dialog"]["scrambler_drone_guard_destroyed"] = "killstreak_remote_operator" + "_crash";
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eaf
// Size: 0x34
function init_helper_drone_anim() {
    level.scr_animtree["scrambler_drone_guard"] = %script_model;
    level.scr_anim["scrambler_drone_guard"]["rotor_spin"] = script_model%mp_cuniform_rotor_spin;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eea
// Size: 0x1b
function function_82d9de71444f6e33() {
    function_c0b0a582ff9e4d57("recon_drone_color_mp");
    function_c0b0a582ff9e4d57("recon_drone_color_dark_mp");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0c
// Size: 0xe
function weapongivenhelperdrone(streakinfo) {
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f22
// Size: 0xa1
function function_29eacadfa638edc1(streakinfo) {
    level.incominghelperdrones[level.incominghelperdrones.size] = spawnstruct();
    level.incominghelperdrones[level.incominghelperdrones.size - 1].type = streakinfo.streakname;
    level.incominghelperdrones[level.incominghelperdrones.size - 1].owner = self;
    level.incominghelperdrones[level.incominghelperdrones.size - 1].team = self.team;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fca
// Size: 0xb3
function function_c3786c4fba09c2f2(streakinfo) {
    if (level.incominghelperdrones.size == 0) {
        return;
    }
    var_811e1aa75ba89a34 = [];
    foreach (drone in level.incominghelperdrones) {
        if (drone.type == streakinfo.streakname && drone.owner == self) {
            continue;
        }
        var_811e1aa75ba89a34[var_811e1aa75ba89a34.size] = drone;
    }
    level.incominghelperdrones = var_811e1aa75ba89a34;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2084
// Size: 0x33
function function_e4ea3048d91b5eb1(streakinfo, var_d7f72825d583f8fe) {
    function_29eacadfa638edc1(streakinfo);
    if (function_289ddd64ec5b3010(streakinfo, self)) {
        function_c3786c4fba09c2f2(streakinfo);
        return 0;
    }
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bf
// Size: 0xe3
function function_4acd3de63e55eb6c(streakinfo, var_d7f72825d583f8fe) {
    if (issharedfuncdefined("killstreak", "currentActiveVehicleCount") && issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
        if ([[ getsharedfunc("killstreak", "currentActiveVehicleCount") ]]() >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]() || level.fauxvehiclecount + 1 >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
            if (istrue(var_d7f72825d583f8fe)) {
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
                }
            }
            return 0;
        }
    }
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]](1);
    }
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21aa
// Size: 0x46
function tryusehelperdrone(streakname, var_c40a367d39f7f1e2) {
    if (!isdefined(var_c40a367d39f7f1e2)) {
        var_c40a367d39f7f1e2 = 1000;
    }
    streakinfo = createstreakinfo(streakname, self);
    streakinfo.var_c40a367d39f7f1e2 = var_c40a367d39f7f1e2;
    return tryusehelperdronefromstruct(streakinfo);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f8
// Size: 0x842
function tryusehelperdronefromstruct(streakinfo) {
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    helperdronetype = streakinfo.streakname;
    startpos = function_34280b807c23a453(helperdronetype);
    if (!isdefined(startpos) && helperdronetype != "scrambler_drone_guard") {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
        }
        return 0;
    }
    config = level.helperdronesettings[helperdronetype];
    var_9b1deb5e9d32bbe3 = undefined;
    var_52a5be2e2f91d710 = undefined;
    var_8e9bce85fbf3f459 = 0;
    if (isdefined(config.var_1c606430b81b28ff)) {
        var_8e9bce85fbf3f459 = 1;
        var_9b1deb5e9d32bbe3 = self [[ config.var_1c606430b81b28ff ]](streakinfo);
    } else {
        nonvehicle = !isdefined(config.vehicleinfo);
        if (!nonvehicle) {
            if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
                return 0;
            }
        }
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            deployweaponname = "ks_gesture_generic_mp";
        } else {
            deployweaponname = level.helperdronesettings[streakinfo.streakname].deployweaponname;
        }
        if (isplayer(self)) {
            deployweaponobj = makeweapon(deployweaponname);
            if (function_9deb86c4684340e1(deployweaponobj)) {
                var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &weapongivenhelperdrone);
            } else if (function_3ffc7fd85f5754e9(deployweaponobj)) {
                var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &weapongivenhelperdrone);
            } else if (function_92ab1470f48812c2(deployweaponobj)) {
                var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, deployweaponobj);
            } else if (function_6c58c6fdcc87e387(deployweaponobj)) {
                var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo);
            } else {
                var_9b1deb5e9d32bbe3 = 0;
                /#
                    assertmsg("Error: Helper Drone using an unsupported deploy weapon");
                #/
            }
        } else {
            var_9b1deb5e9d32bbe3 = 1;
        }
        if (!istrue(var_9b1deb5e9d32bbe3)) {
            if (!nonvehicle) {
                namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            }
            return 0;
        }
        if (isdefined(level.killstreakbeginusefunc)) {
            if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
                if (!nonvehicle) {
                    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
                }
                if (deployweaponname != "ks_gesture_generic_mp") {
                    streakinfo notify("killstreak_finished_with_deploy_weapon");
                }
                return 0;
            }
        }
        if (helperdronetype != "scrambler_drone_guard" || deployweaponname == "ks_gesture_generic_mp") {
            var_ce7e572ba798f2f7 = tryusehelperdroneearlyout(streakinfo, 1);
            if (var_ce7e572ba798f2f7) {
                if (!nonvehicle) {
                    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
                }
                if (deployweaponname != "ks_gesture_generic_mp") {
                    streakinfo notify("killstreak_finished_with_deploy_weapon");
                }
                return 0;
            }
        }
        startpos = function_34280b807c23a453(helperdronetype);
        if (deployweaponname == "ks_remote_device_mp") {
            if (!isdefined(startpos)) {
                if (!nonvehicle) {
                    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
                }
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
                }
                streakinfo notify("killstreak_finished_with_deploy_weapon");
                return 0;
            }
        }
        if (deployweaponname == "ks_remote_drone_mp") {
            var_fc4aa9db408d9420 = 0.6;
            var_e5c7ffb094dc9eec = 2;
            result = waittill_any_timeout_2(var_fc4aa9db408d9420, "death", "weapon_switch_started");
            if (!isdefined(result) || result != "timeout") {
                if (!nonvehicle) {
                    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
                }
                streakinfo notify("killstreak_finished_with_deploy_weapon");
                return 0;
            }
            if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
                var_8e9bce85fbf3f459 = 1;
                [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
                var_52a5be2e2f91d710 = 0.5;
            }
            val::set("helperDrone", "weapon_switch", 0);
            result = waittill_any_timeout_1(var_e5c7ffb094dc9eec - var_fc4aa9db408d9420, "death");
            if (!isdefined(result) || result != "timeout") {
                if (!nonvehicle) {
                    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
                }
                val::function_c9d0b43701bdba00("helperDrone");
                streakinfo notify("killstreak_finished_with_deploy_weapon");
                return 0;
            }
            val::function_c9d0b43701bdba00("helperDrone");
        }
        mappointinfo = undefined;
        if (deployweaponname == "ks_remote_map_mp") {
            mappointinfo = undefined;
            if (issharedfuncdefined("killstreak", "getSelectMapPoint")) {
                mappointinfo = self [[ getsharedfunc("killstreak", "getSelectMapPoint") ]](streakinfo, 1);
            }
            if (!isdefined(mappointinfo)) {
                if (!nonvehicle) {
                    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
                }
                if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
                    [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
                }
                return 0;
            }
        } else if (helperdronetype == "scrambler_drone_guard") {
            location = self.origin;
            if (isdefined(level.traceselectedmaplocation)) {
                var_bdf908d5d1aae9f2 = [[ level.traceselectedmaplocation ]](self.origin);
                location = var_bdf908d5d1aae9f2["position"];
            }
            var_b21e2e887c161b9 = spawnstruct();
            var_b21e2e887c161b9.location = location;
            mappointinfo = [];
            mappointinfo[0] = var_b21e2e887c161b9;
        }
        startang = self.angles;
        if (isdefined(mappointinfo)) {
            if (helperdronetype == "scrambler_drone_guard") {
                killstreak_dangernotifyplayersinrange(self, self.team, 15000, helperdronetype, mappointinfo[0].location);
                var_f4ba81ddfb51eebf = mappointinfo[0].location + (0, 0, 3000);
                helperdrone = createhelperdrone(var_f4ba81ddfb51eebf, startang, helperdronetype, streakinfo, nonvehicle, !nonvehicle);
                if (!isdefined(helperdrone)) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/UNAVAILABLE");
                    }
                    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
                        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
                    }
                    function_c3786c4fba09c2f2(streakinfo);
                    return 0;
                }
                helperdrone.mappointinfo = mappointinfo;
                helperdrone thread perkengineer_manageminimap();
                function_c3786c4fba09c2f2(streakinfo);
                thread starthelperdrone(helperdrone);
            }
        } else {
            if (helperdronetype == "radar_drone_escort" || helperdronetype == "radar_drone_recon") {
                startpos = function_34280b807c23a453(helperdronetype);
            }
            if (helperdronetype == "radar_drone_overwatch") {
                startpos = self.origin + (0, 0, 1500) - anglestoforward(self.angles) * 5000;
            }
            helperdrone = createhelperdrone(startpos, startang, helperdronetype, streakinfo, nonvehicle, !nonvehicle);
            if (!isdefined(helperdrone)) {
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
                }
                helperdronecreationfailedfx(helperdronetype, startpos);
                streakinfo notify("killstreak_finished_with_deploy_weapon");
                if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
                    [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
                }
                function_c3786c4fba09c2f2(streakinfo);
                return 0;
            }
            if (helperdronetype == "assault_drone") {
                thread helperdrone_giveplayerfauxremote(streakinfo);
            }
            function_c3786c4fba09c2f2(streakinfo);
            thread starthelperdrone(helperdrone);
        }
    }
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isplayer(self) && !istrue(var_8e9bce85fbf3f459)) {
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
            var_52a5be2e2f91d710 = 2.5;
        }
        thread playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_use", 1, var_52a5be2e2f91d710);
    }
    teamsplash = config.teamsplash;
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](teamsplash, self);
    }
    if (streakinfo.streakname == "assault_drone") {
        if (issharedfuncdefined("player", "doOnActionScoreEvent")) {
            self [[ getsharedfunc("player", "doOnActionScoreEvent") ]](2, "bombDroneUsed");
        }
    }
    level notify("helper_drone_started", self);
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a42
// Size: 0x74
function helperdronecreationfailedfx(helperdronetype, var_39c9ec41466da42e) {
    if (!isdefined(var_39c9ec41466da42e)) {
        var_39c9ec41466da42e = self geteye() + (0, 0, 80);
    }
    fxent = spawn("script_model", var_39c9ec41466da42e);
    fxent setmodel("ks_" + helperdronetype + "_mp");
    fxent setscriptablepartstate("exit", "on", 0);
    fxent thread delay_deletescriptable();
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2abd
// Size: 0x121
function tryusehelperdroneearlyout(streakinfo, var_d7f72825d583f8fe) {
    if (isusingremote()) {
        return 1;
    }
    if (istrue(self.drones_disabled)) {
        if (istrue(var_d7f72825d583f8fe)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/UNAVAILABLE");
            }
        }
        return 1;
    }
    if (streakinfo.streakname == "radar_drone_recon") {
        var_234bea9eaddc1edc = !isdefined(namespace_b3d24e921998a8b::candeploykillstreakweapon(streakinfo));
        if (!istrue(var_234bea9eaddc1edc) && istrue(var_d7f72825d583f8fe)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/CANNOT_USE_GENERIC");
            }
            return 1;
        }
    }
    var_9c16986ec4a8ff68 = function_4acd3de63e55eb6c(streakinfo, var_d7f72825d583f8fe);
    if (!var_9c16986ec4a8ff68) {
        return 1;
    }
    var_f2e9119c4fba561a = function_e4ea3048d91b5eb1(streakinfo, var_d7f72825d583f8fe);
    if (!var_f2e9119c4fba561a) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]](1);
        }
        return 1;
    }
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be6
// Size: 0x1a
function delay_deletescriptable() {
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
    self delete();
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c07
// Size: 0x69d
function createhelperdrone(startpos, startang, helperdronetype, streakinfo, nonvehicle, vehiclereserved) {
    clearvehiclereservation = !istrue(nonvehicle) && istrue(vehiclereserved);
    if (!isdefined(startpos)) {
        if (!istrue(clearvehiclereservation)) {
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        }
        return;
    }
    config = level.helperdronesettings[helperdronetype];
    var_b923287498a8519a = config.modelbase;
    drone = undefined;
    if (istrue(nonvehicle)) {
        drone = spawn("script_model", startpos);
        drone setmodel(var_b923287498a8519a);
        drone.nonvehicle = 1;
    } else {
        if (clearvehiclereservation) {
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        }
        drone = namespace_f64231d5b7a2c3c4::_spawnhelicopter(self, startpos, startang, config.vehicleinfo, var_b923287498a8519a);
        /#
            var_aded1f99ce13821a = getdvarint(@"hash_b23e7bb60bbe76a6", 0);
            if (var_aded1f99ce13821a) {
                drone setscriptablepartstate("veh8_mil_air_malfa_big", "dialog", 0);
            }
        #/
    }
    if (!isdefined(drone)) {
        return;
    }
    drone enableaimassist();
    drone setnodeploy(1);
    drone.health = config.maxhealth;
    drone.maxhealth = config.maxhealth;
    drone.currenthealth = config.maxhealth;
    drone.damagetaken = 0;
    drone.speed = config.speed;
    drone.accel = config.accel;
    drone.angles = startang;
    drone.manualspeed = 50;
    drone.owner = self;
    drone.team = self.team;
    drone.helperdronetype = helperdronetype;
    drone.combatmode = config.primarymode;
    drone.currentstring = config.secondarymodestring;
    drone.streakinfo = streakinfo;
    drone.var_d0d1af898acdc9af = "default";
    drone.var_52c3b4bc88132aee = config.var_52c3b4bc88132aee;
    drone.timeout = config.timeout;
    drone function_49197cd063a740ea(&function_ba1c5496f8fc5f67);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        drone [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&helperdrone_empapplied);
    }
    if (issharedfuncdefined("helper_drone", "attachXRays")) {
        drone = [[ getsharedfunc("helper_drone", "attachXRays") ]](drone);
    }
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            drone.timeout = 9999;
        }
    #/
    var_7164f727caf950ce = 0;
    if (istrue(drone.nonvehicle)) {
        drone namespace_6d9917c3dc05dbe9::registersentient("Tactical_Moving", self, undefined, undefined, 0, 1);
    } else {
        var_7164f727caf950ce = 1;
        drone thread function_7c5c7844eb8db8bb();
        drone setvehicleteam(drone.team);
    }
    if (istrue(drone.var_52c3b4bc88132aee)) {
        setlockedoncallback(drone, &helperdrone_lockedoncallback);
        setlockedonremovedcallback(drone, &helperdrone_lockedonremovedcallback);
    }
    drone function_cc4dd1078cf1b365(streakinfo.streakname);
    if (isdefined(config.flarescount)) {
        drone.flaresreservecount = config.flarescount;
    }
    drone setotherent(self);
    drone setcandamage(1);
    if (istrue(nonvehicle)) {
        drone scriptmoveroutline();
        drone scriptmoverthermal();
    } else {
        drone vehicle_invoketriggers(1);
        drone vehicle_breakglass(1);
    }
    var_5ae5e6cd7f0cc727 = 12;
    switch (helperdronetype) {
    case #"hash_f64c697bfb4c6b54":
        var_5ae5e6cd7f0cc727 = 60;
        break;
    case #"hash_e10937962ef20946":
        scrambler = drone helperdrone_spawnnewscrambler("medium");
        drone.scrambler = scrambler;
        break;
    case #"hash_27002778019fb447":
        if (istrue(level.makedroneguardscrambler)) {
            scrambler = drone helperdrone_spawnnewscrambler("large");
            drone.scrambler = scrambler;
        }
        var_5ae5e6cd7f0cc727 = 100;
        break;
    default:
        break;
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        drone [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", drone.owner, 0, 1, var_5ae5e6cd7f0cc727);
    }
    drone.attract_strength = 10000;
    drone.attract_range = 150;
    drone.attractor = missile_createattractorent(drone, drone.attract_strength, drone.attract_range);
    drone.stunned = 0;
    drone.inactive = 0;
    drone thread helperdrone_play_lightfx();
    data = spawnstruct();
    data.validateaccuratetouching = 1;
    data.deathoverridecallback = &helperdrone_moving_platform_death;
    if (issharedfuncdefined("game", "handlemovingplatforms")) {
        drone [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
    if (isdefined(level.helperdronesettings[drone.helperdronetype].streakname)) {
        if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
            drone.owner [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](config.streakname, drone.targetpos);
        }
    }
    thread function_4dcb82341876e985(var_7164f727caf950ce, drone);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(drone);
        }
    }
    return drone;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ac
// Size: 0x4e
function function_7c5c7844eb8db8bb() {
    self endon("death");
    self.owner endon("disconnect");
    if (!iscp() && function_c76228a77a70c9ea()) {
        return;
    }
    wait(5);
    namespace_6d9917c3dc05dbe9::registersentient("Drone", self.owner);
    self notify("registered_sentient");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3301
// Size: 0x31
function function_c76228a77a70c9ea() {
    switch (self.helperdronetype) {
    case #"hash_e40585107590f016":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3339
// Size: 0x37
function function_4dcb82341876e985(var_7164f727caf950ce, drone) {
    drone endon("death");
    self endon("disconnect");
    if (istrue(var_7164f727caf950ce)) {
        drone waittill("registered_sentient");
    }
    self function_fd165588822885f4(drone);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3377
// Size: 0x39a
function function_99e1189114e8419a(startpos, startang, helperdronetype, streakinfo, var_f88fb7783beaa918, var_53385b6be5f6c52f) {
    config = level.helperdronesettings[helperdronetype];
    if (getdvarint(@"hash_1253e99612575321", 0) && isdefined(config.var_f69f6bdde236401a)) {
        var_b923287498a8519a = config.var_f69f6bdde236401a;
    } else {
        var_b923287498a8519a = config.modelbase;
    }
    drone = undefined;
    drone = spawn("script_model", startpos);
    drone setmodel(var_b923287498a8519a);
    drone.nonvehicle = 0;
    if (!isdefined(drone)) {
        return;
    }
    drone setnodeploy(1);
    drone.health = config.maxhealth;
    drone.maxhealth = config.maxhealth;
    drone.currenthealth = var_53385b6be5f6c52f;
    drone.ispiloted = 0;
    drone.damagetaken = config.maxhealth - var_53385b6be5f6c52f;
    drone.angles = startang;
    drone.owner = self;
    drone.team = self.team;
    drone.helperdronetype = helperdronetype;
    drone.combatmode = config.primarymode;
    drone.currentstring = config.secondarymodestring;
    drone.streakinfo = streakinfo;
    drone.var_d0d1af898acdc9af = "default";
    drone.var_52c3b4bc88132aee = 0;
    drone.timeout = config.timeout;
    drone.dropped = 1;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            drone.timeout = 9999;
        }
    #/
    drone namespace_6d9917c3dc05dbe9::registersentient("Tactical_Moving", self, undefined, undefined, 0, 1);
    drone function_1a4f935ba283ab0f();
    if (isdefined(config.damagemonitorfunc)) {
        drone thread [[ config.damagemonitorfunc ]](1);
    }
    if (isdefined(config.flarescount)) {
        drone.flaresreservecount = config.flarescount;
    }
    drone setotherent(self);
    drone setcandamage(1);
    drone scriptmoveroutline();
    drone scriptmoverthermal();
    var_5ae5e6cd7f0cc727 = 12;
    drone.stunned = 0;
    drone.inactive = 1;
    data = spawnstruct();
    data.validateaccuratetouching = 1;
    data.deathoverridecallback = &helperdrone_moving_platform_death;
    if (issharedfuncdefined("game", "handlemovingplatforms")) {
        drone [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
    if (isdefined(var_f88fb7783beaa918)) {
        drone physics_takecontrol(1, drone.origin, var_f88fb7783beaa918 * 25);
    } else {
        drone physics_takecontrol(1);
    }
    drone makeusable();
    drone sethintstring("MP/BR_RECONDRONE");
    drone sethintdisplayfov(90);
    drone setuseholdduration("duration_none");
    drone sethintrequiresholding(0);
    drone setusefov(90);
    drone thread function_c36d4585d380430f(streakinfo.var_ebec497ff8b18a45);
    return drone;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3719
// Size: 0xa7
function function_c36d4585d380430f(var_ebec497ff8b18a45) {
    self endon("death");
    self endon("explode");
    self endon("pickup");
    while (1) {
        player = self waittill("trigger");
        if (isdefined(player) && isalive(player)) {
            if (issharedfuncdefined("player", "forceGiveSuper")) {
                player [[ getsharedfunc("player", "forceGiveSuper") ]](var_ebec497ff8b18a45, 1, 0);
            }
            if (issharedfuncdefined("player", "playPickupFeedback")) {
                player [[ getsharedfunc("player", "playPickupFeedback") ]](self, 0);
            }
            self delete();
            return;
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c7
// Size: 0xc6
function helperdrone_notifyenemyplayersinrange(helperdronetype) {
    var_b43d19b33263e16f = level.teamdata[self.team]["players"];
    var_e7c0ffd00e9cfe51 = utility::playersincylinder(self.origin, 3000, var_b43d19b33263e16f);
    foreach (enemyplayer in var_e7c0ffd00e9cfe51) {
        if (issharedfuncdefined("killstreak", "dangerNotifyPlayer")) {
            self.owner [[ getsharedfunc("killstreak", "dangerNotifyPlayer") ]](enemyplayer, helperdronetype, 1);
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3894
// Size: 0xad
function helperdrone_handleteamvisibility() {
    foreach (player in level.players) {
        if (level.teambased && player.team == self.team || !level.teambased && player == self.owner) {
            self hidefromplayer(player);
        }
    }
    thread helperdrone_managevisibilityonteamjoin();
    /#
        thread function_9d01452d8baca7a0();
    #/
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3948
// Size: 0x72
function helperdrone_managevisibilityonteamjoin() {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    while (1) {
        player = level waittill("joined_team");
        if (level.teambased && player.team == self.team) {
            self hidefromplayer(player);
        } else {
            self showtoplayer(player);
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c1
// Size: 0x191
function function_cc4dd1078cf1b365(streakname) {
    config = level.helperdronesettings[self.helperdronetype];
    if (!istrue(self.nonvehicle)) {
        var_e25f9b0de2cc7b81 = self;
        scorepopup = config.scorepopup;
        vodestroyed = config.vodestroyed;
        destroyedsplash = config.destroyedsplash;
        var_8dfc256103cce53e = config.var_c25a8137257a96d;
        var_191284e2e2837328 = config.var_f992ca11ef2b22bf;
        var_bacc6dd14316758c = config.premoddamagefunc;
        var_7da88d9c69433487 = config.postmoddamagefunc;
        deathcallback = config.deathfunc;
        killstreak_setupvehicledamagefunctionality(streakname, var_e25f9b0de2cc7b81, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
        namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(self, self.owner, self.owner.team);
    }
    function_cfc5e3633ef950fd(1, self.maxhealth * 0.75, &function_f6914d06b20aee20);
    function_cfc5e3633ef950fd(2, self.maxhealth * 0.5, &function_3ad98c4f7524b525);
    function_cfc5e3633ef950fd(3, self.maxhealth * 0.25, &function_e68a206899cafbe5);
    self.var_96419179a661cf96 = &function_1a4b3b6063ec7390;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b59
// Size: 0x3b
function function_1a4b3b6063ec7390(var_1a914c651971e2f5, impulse) {
    if (!isdefined(var_1a914c651971e2f5)) {
        return;
    }
    if (impulse > 0) {
        if (istrue(var_1a914c651971e2f5.isdestroyed)) {
            return;
        }
        var_1a914c651971e2f5 thread function_6edfda4764129e3(1);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9b
// Size: 0x1d6
function function_9d01452d8baca7a0() {
    /#
        self endon("_crash");
        self endon("killstreak");
        self endon("Error: Helper Drone using an unsupported deploy weapon");
        self endon("sound");
        self.var_c0b807f1243ad7b9 = 0;
        while (1) {
            var_c0b807f1243ad7b9 = getdvarint(@"hash_4ec1877ac00842c0", 0);
            if (self.helperdronetype == "decrementFauxVehicleCount") {
                var_c0b807f1243ad7b9 = getdvarint(@"hash_ac7f6a636682c52f", 0);
            }
            if (var_c0b807f1243ad7b9) {
                if (!istrue(self.var_c0b807f1243ad7b9)) {
                    self.var_c0b807f1243ad7b9 = 1;
                    foreach (player in level.players) {
                        if (player.team == self.team) {
                            self showtoplayer(player);
                            if (self.helperdronetype == "decrementFauxVehicleCount") {
                                self.owner.var_f39d717b31ec5af9 = 1;
                                level notify("Tactical_Moving");
                            }
                        }
                    }
                }
            } else if (istrue(self.var_c0b807f1243ad7b9)) {
                self.var_c0b807f1243ad7b9 = 0;
                foreach (player in level.players) {
                    if (player.team == self.team) {
                        self hidefromplayer(player);
                        if (self.helperdronetype == "decrementFauxVehicleCount") {
                            self.owner.var_f39d717b31ec5af9 = undefined;
                            level notify("Tactical_Moving");
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d78
// Size: 0x3c
function function_988c532b8c5a4ec0(var_a2aa6ce7e3a5ac0c) {
    if (isdefined(var_a2aa6ce7e3a5ac0c)) {
        if (isdefined(var_a2aa6ce7e3a5ac0c.owner)) {
            var_a2aa6ce7e3a5ac0c = var_a2aa6ce7e3a5ac0c.owner;
        }
        var_a2aa6ce7e3a5ac0c notify("scramble_off" + self getentitynumber());
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dbb
// Size: 0xfb
function helperdrone_endscramblereffect() {
    self notify("scramble_super_finished");
    if (isdefined(self.var_88f72d2c0421f8b1) && self.var_88f72d2c0421f8b1.size > 0) {
        foreach (enemy in self.var_88f72d2c0421f8b1) {
            function_988c532b8c5a4ec0(enemy);
        }
    }
    if (isdefined(self.friendliesaffectedbyscrambler) && self.friendliesaffectedbyscrambler.size > 0) {
        foreach (friendly in self.friendliesaffectedbyscrambler) {
            if (isdefined(friendly)) {
                friendly notify("scramble_off" + self getentitynumber());
            }
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ebd
// Size: 0x297
function helperdrone_watchscramblereffectdist(owner) {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    self endon("scramble_super_finished");
    if (!isdefined(owner)) {
        owner = self.owner;
    }
    self.var_88f72d2c0421f8b1 = [];
    var_4efaf0d84225539 = 0;
    /#
        var_4efaf0d84225539 = getdvarint(@"hash_7786353439eb384c", 0);
    #/
    var_105fca5e47d7ee56 = getdvarfloat(@"hash_97a2272a19ad3843", 1000);
    var_f3b7cc3138382dfb = var_105fca5e47d7ee56 * var_105fca5e47d7ee56;
    var_556db0b72a96514e = physics_createcontents([0:"physicscontents_characterproxy"]);
    var_863c619037f3ac74 = self.origin - (0, 0, 3000);
    var_b65b7aeab526e1ac = (var_105fca5e47d7ee56, var_105fca5e47d7ee56, 3000);
    var_80745cf3e2877df5 = var_863c619037f3ac74 - var_b65b7aeab526e1ac;
    var_809746f3e2ad954b = var_863c619037f3ac74 + var_b65b7aeab526e1ac;
    while (1) {
        var_e5b984fc3e961023 = physics_aabbbroadphasequery(var_80745cf3e2877df5, var_809746f3e2ad954b, var_556db0b72a96514e, []);
        foreach (var_d5db6d3276688d8f in var_e5b984fc3e961023) {
            var_780166328e815d00 = 0;
            if (issharedfuncdefined("perk", "hasPerk")) {
                var_780166328e815d00 = var_d5db6d3276688d8f [[ getsharedfunc("perk", "hasPerk") ]]("specialty_scrambler_resist");
            }
            if (isdefined(var_d5db6d3276688d8f) && var_d5db6d3276688d8f namespace_f8065cafc523dba5::_isalive() && !var_780166328e815d00) {
                if (distance2dsquared(self.origin, var_d5db6d3276688d8f.origin) > var_f3b7cc3138382dfb) {
                    continue;
                }
                if (var_4efaf0d84225539 || level.teambased && var_d5db6d3276688d8f.team != self.team && var_d5db6d3276688d8f.team != "spectator" || !level.teambased && var_d5db6d3276688d8f != self.owner) {
                    if (var_d5db6d3276688d8f isusingremote()) {
                        continue;
                    }
                    if (var_d5db6d3276688d8f helperdrone_entaffectedbyscramble(self, var_4efaf0d84225539)) {
                        continue;
                    }
                    var_d5db6d3276688d8f helperdrone_setscramblerjammed(1, self, var_4efaf0d84225539);
                }
            } else if (isdefined(var_d5db6d3276688d8f.scrambledby) && array_contains(var_d5db6d3276688d8f.scrambledby, self)) {
                var_d5db6d3276688d8f notify("scramble_off" + self getentitynumber());
            }
        }
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415b
// Size: 0x105
function helperdrone_setscramblerplayerbuffs(var_2327284215f2eb30, var_5e3a489f0b2b59a5) {
    if (helperdrone_entaffectedbyscramble(var_5e3a489f0b2b59a5) && istrue(var_2327284215f2eb30)) {
        return;
    }
    if (istrue(var_2327284215f2eb30)) {
        var_5e3a489f0b2b59a5.friendliesaffectedbyscrambler[var_5e3a489f0b2b59a5.friendliesaffectedbyscrambler.size] = self;
        thread helperdrone_managescramblerplayerbuff(var_5e3a489f0b2b59a5);
        if (issharedfuncdefined("perk", "givePerk")) {
            self [[ getsharedfunc("perk", "givePerk") ]]("specialty_blindeye");
        }
        if (issharedfuncdefined("perk", "givePerk")) {
            self [[ getsharedfunc("perk", "givePerk") ]]("specialty_noscopeoutline");
        }
    } else if (isdefined(self)) {
        if (issharedfuncdefined("perk", "removePerk")) {
            self [[ getsharedfunc("perk", "removePerk") ]]("specialty_blindeye");
        }
        if (issharedfuncdefined("perk", "removePerk")) {
            self [[ getsharedfunc("perk", "removePerk") ]]("specialty_noscopeoutline");
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4267
// Size: 0x2d
function helperdrone_managescramblerplayerbuff(var_5e3a489f0b2b59a5) {
    waittill_any_2("death_or_disconnect", "scramble_off" + var_5e3a489f0b2b59a5 getentitynumber());
    helperdrone_setscramblerplayerbuffs(0, var_5e3a489f0b2b59a5);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429b
// Size: 0x167
function helperdrone_setscramblerjammed(var_28e6df0414cb4897, var_479e3f358a1f244e, var_4efaf0d84225539, var_699323575339379a) {
    var_682bf17fa458886c = self;
    if (istrue(var_28e6df0414cb4897)) {
        var_682bf17fa458886c.scrambledby = function_53c4c53197386572(var_682bf17fa458886c.scrambledby, []);
        var_682bf17fa458886c.scrambledby = function_6d6af8144a5131f1(var_682bf17fa458886c.scrambledby, var_479e3f358a1f244e);
        if (!array_contains(var_479e3f358a1f244e.var_88f72d2c0421f8b1, var_682bf17fa458886c)) {
            var_479e3f358a1f244e.var_88f72d2c0421f8b1[var_479e3f358a1f244e.var_88f72d2c0421f8b1.size] = var_682bf17fa458886c;
        }
        var_682bf17fa458886c thread helperdrone_managescramblereffect(var_479e3f358a1f244e, var_4efaf0d84225539, var_699323575339379a);
        var_682bf17fa458886c thread helperdrone_watchscramblestrength(var_479e3f358a1f244e, var_699323575339379a);
    } else if (isdefined(var_479e3f358a1f244e) && isdefined(var_682bf17fa458886c) && isdefined(var_682bf17fa458886c.scrambledby)) {
        if (array_contains(var_682bf17fa458886c.scrambledby, var_479e3f358a1f244e)) {
            var_682bf17fa458886c.scrambledby = array_remove(var_682bf17fa458886c.scrambledby, var_479e3f358a1f244e);
            if (isdefined(var_479e3f358a1f244e.var_ef42676d437ab065)) {
                var_8ce1abd1a0602291 = var_479e3f358a1f244e.var_ef42676d437ab065[self getentitynumber()];
                if (isdefined(var_8ce1abd1a0602291)) {
                    var_479e3f358a1f244e.var_ef42676d437ab065[self getentitynumber()] = undefined;
                    var_682bf17fa458886c namespace_5a51aa78ea0b1b9f::stop_scramble(var_8ce1abd1a0602291, var_699323575339379a);
                    var_479e3f358a1f244e.var_ef42676d437ab065[var_682bf17fa458886c getentitynumber()] = undefined;
                }
            }
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4409
// Size: 0xb3
function helperdrone_managescramblereffect(var_479e3f358a1f244e, var_4efaf0d84225539, var_699323575339379a) {
    level endon("game_ended");
    waittill_any_2("death", "scramble_off" + var_479e3f358a1f244e getentitynumber());
    if (isdefined(self)) {
        helperdrone_setscramblerjammed(0, var_479e3f358a1f244e, var_4efaf0d84225539, var_699323575339379a);
        if (isdefined(var_479e3f358a1f244e) && isdefined(var_479e3f358a1f244e.var_88f72d2c0421f8b1)) {
            var_479e3f358a1f244e.var_88f72d2c0421f8b1 = array_remove(var_479e3f358a1f244e.var_88f72d2c0421f8b1, self);
        }
    } else if (isdefined(var_479e3f358a1f244e) && isdefined(var_479e3f358a1f244e.var_88f72d2c0421f8b1)) {
        var_479e3f358a1f244e.var_88f72d2c0421f8b1 = array_removeundefined(var_479e3f358a1f244e.var_88f72d2c0421f8b1);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44c3
// Size: 0x5e
function helperdrone_watchremotescrambledent(var_479e3f358a1f244e, var_4efaf0d84225539) {
    var_479e3f358a1f244e endon("death");
    level endon("game_ended");
    self waittill("death");
    if (isdefined(self.owner)) {
        if (self.owner helperdrone_entaffectedbyscramble(var_479e3f358a1f244e, var_4efaf0d84225539)) {
            self.owner helperdrone_setscramblerjammed(0, var_479e3f358a1f244e, var_4efaf0d84225539);
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4528
// Size: 0x1b1
function helperdrone_watchscramblestrength(var_479e3f358a1f244e, var_699323575339379a) {
    self endon("death");
    self endon("scramble_off" + self getentitynumber());
    self endon("disconnect");
    var_479e3f358a1f244e endon("death");
    var_479e3f358a1f244e.var_ef42676d437ab065 = function_53c4c53197386572(var_479e3f358a1f244e.var_ef42676d437ab065, []);
    var_d0f37ccce4e88c3d = 0;
    var_8ce1abd1a0602291 = 0;
    var_105fca5e47d7ee56 = getdvarfloat(@"hash_97a2272a19ad3843", 1000);
    if (isdefined(var_479e3f358a1f244e.var_32efb854df6d5296)) {
        var_105fca5e47d7ee56 = var_479e3f358a1f244e.var_32efb854df6d5296;
    }
    var_f3b7cc3138382dfb = var_105fca5e47d7ee56 * var_105fca5e47d7ee56;
    while (1) {
        var_3bf809e113ae4c12 = 0;
        if (istrue(var_479e3f358a1f244e.var_ce8ef6e68df034c7)) {
            var_3bf809e113ae4c12 = distancesquared(var_479e3f358a1f244e.origin, self.origin);
        } else {
            var_3bf809e113ae4c12 = distance2dsquared(var_479e3f358a1f244e.origin, self.origin);
        }
        if (var_3bf809e113ae4c12 > var_f3b7cc3138382dfb) {
            var_8ce1abd1a0602291 = 0;
        } else if (var_3bf809e113ae4c12 >= var_f3b7cc3138382dfb * 0.8) {
            var_8ce1abd1a0602291 = 1;
        } else if (var_3bf809e113ae4c12 >= var_f3b7cc3138382dfb * 0.6) {
            var_8ce1abd1a0602291 = 2;
        } else if (var_3bf809e113ae4c12 >= var_f3b7cc3138382dfb * 0.4) {
            var_8ce1abd1a0602291 = 3;
        } else if (var_3bf809e113ae4c12 >= var_f3b7cc3138382dfb * 0.2) {
            var_8ce1abd1a0602291 = 4;
        } else {
            var_8ce1abd1a0602291 = 5;
        }
        var_4893b9a18cf47d6c = var_8ce1abd1a0602291 != var_d0f37ccce4e88c3d;
        if (var_d0f37ccce4e88c3d == 0 || var_4893b9a18cf47d6c) {
            var_479e3f358a1f244e.var_ef42676d437ab065[self getentitynumber()] = var_8ce1abd1a0602291;
            namespace_5a51aa78ea0b1b9f::stop_scramble(var_d0f37ccce4e88c3d, var_699323575339379a);
            namespace_5a51aa78ea0b1b9f::play_scramble(var_8ce1abd1a0602291, var_699323575339379a);
            var_d0f37ccce4e88c3d = var_8ce1abd1a0602291;
        }
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e0
// Size: 0x1be
function helperdrone_entaffectedbyscramble(var_4bd0ce1c61384825, var_4efaf0d84225539) {
    scrambled = 0;
    var_be77424d6ef051c = undefined;
    if (isdefined(level.supportdrones) && level.supportdrones.size > 0) {
        foreach (drone in level.supportdrones) {
            if (drone.helperdronetype != "scrambler_drone_guard") {
                continue;
            }
            if (level.teambased) {
                if (!isdefined(var_4efaf0d84225539) && drone.team == self.team) {
                    var_be77424d6ef051c = drone.friendliesaffectedbyscrambler;
                } else {
                    var_be77424d6ef051c = drone.var_88f72d2c0421f8b1;
                }
            } else if (!isdefined(var_4efaf0d84225539) && drone.owner == self) {
                var_be77424d6ef051c = drone.friendliesaffectedbyscrambler;
            } else {
                var_be77424d6ef051c = drone.var_88f72d2c0421f8b1;
            }
            if (!isdefined(var_be77424d6ef051c)) {
                continue;
            }
            if (var_be77424d6ef051c.size > 0) {
                foreach (ent in var_be77424d6ef051c) {
                    if (self == ent || isdefined(ent.owner) && self == ent.owner) {
                        scrambled = 1;
                        break;
                    }
                }
                if (istrue(scrambled)) {
                    break;
                }
            }
        }
    }
    return scrambled;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a6
// Size: 0xc3
function helperdrone_enableradar(radartype) {
    radar = spawn("script_model", self.origin);
    radar.owner = self.owner;
    radar.team = self.owner.team;
    self.radar = radar;
    if (radartype == "auto_radar") {
        radar makeportableradar(self.owner);
    } else if (radartype == "escort_radar") {
        radar setentityowner(self.owner);
        radar setotherent(self.owner);
        radar setmodel("ks_radar_drone_escort_mp");
    }
    radar linkto(self);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4970
// Size: 0x1f
function helperdrone_disableradar() {
    if (isdefined(self.radar)) {
        self.radar delete();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4996
// Size: 0xc2
function helperdrone_spawnnewscrambler(var_7f0bbc79e1dae81, var_e9ffa55994e4c9be, link) {
    scrambler = spawn("script_model", self.origin);
    scrambler.team = self.owner.team;
    if (isdefined(self.streakinfo) && isdefined(self.streakinfo.var_c40a367d39f7f1e2)) {
        var_8ec43e4243c37e70 = int(self.streakinfo.var_c40a367d39f7f1e2);
    } else {
        var_8ec43e4243c37e70 = 0;
    }
    scrambler makescrambler(self.owner, var_7f0bbc79e1dae81, var_8ec43e4243c37e70);
    scrambler linkto(self);
    return scrambler;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a60
// Size: 0x47
function helperdrone_moving_platform_death(data) {
    if (!isdefined(data.lasttouchedplatform.destroydroneoncollision) || data.lasttouchedplatform.destroydroneoncollision) {
        self notify("death");
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aae
// Size: 0x48
function helperdrone_play_lightfx() {
    settings = level.helperdronesettings[self.helperdronetype];
    if (isent(self)) {
        if (isdefined(settings.playfxcallback)) {
            self [[ settings.playfxcallback ]]();
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4afd
// Size: 0x93
function function_56966b077270a18e() {
    self setscriptablepartstate("lights", "on", 0);
    if (self.helperdronetype == "radar_drone_overwatch") {
        self setscriptablepartstate("glint", "on", 0);
        self setscriptablepartstate("engine", "on", 0);
    }
    if (self.helperdronetype == "radar_drone_recon") {
        self setscriptablepartstate("glint", "on", 0);
    }
    if (self.helperdronetype == "ammo_drop") {
        self setscriptablepartstate("glint", "on", 0);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b97
// Size: 0x21a
function starthelperdrone(helperdrone, var_72c27359aaac97f4) {
    level endon("game_ended");
    helperdrone endon("death");
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
    }
    config = level.helperdronesettings[helperdrone.helperdronetype];
    if (isplayer(self)) {
        helperdrone thread function_207c13cdc424e93b();
        helperdrone.owner setclientomnvar("ui_killstreak_health", helperdrone.currenthealth / helperdrone.maxhealth);
        helperdrone.owner setclientomnvar("ui_killstreak_damage_state", 0);
    }
    helperdrone thread helperdrone_watchtimeout();
    helperdrone thread helperdrone_watchownerloss();
    helperdrone thread helperdrone_watchownerdeath();
    helperdrone thread helperdrone_watchroundend();
    helperdrone thread helperdrone_destroyongameend();
    helperdrone setcandamage(1);
    if (isdefined(config.damagemonitorfunc)) {
        helperdrone thread [[ config.damagemonitorfunc ]]();
    }
    if (istrue(function_de3c015e3c7130e7(helperdrone.helperdronetype))) {
        helperdrone thread helperdrone_monitorcollision(config);
        helperdrone thread function_109f8639aebf2da9(config);
        helperdrone thread helperdrone_watchearlyexit(config, var_72c27359aaac97f4);
        helperdrone thread function_1d24e8f818e18244();
        if (issharedfuncdefined("game", "getGameType")) {
            gametype = [[ getsharedfunc("game", "getGameType") ]]();
            if (namespace_36f464722d326bbe::isbrstylegametype() || iscp()) {
                helperdrone thread helperdrone_watchaltitude(self);
            }
        }
        if (issharedfuncdefined("game", "registerEntForOOB")) {
            [[ getsharedfunc("game", "registerEntForOOB") ]](helperdrone, "killstreak");
        }
        helperdrone thread namespace_bba8bc8532aa4913::function_b25ced7f149be057();
    }
    helperdrone thread [[ config.primarymodefunc ]](config);
    if (iscp() && isdefined(self.oob) && istrue(self.oob)) {
        helperdrone notify("owner_gone");
        waitframe();
        helperdrone thread helperdrone_leave();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db8
// Size: 0xdf
function helperdrone_followplayer(var_42a0537f1ae3e42e) {
    level endon("game_ended");
    self endon("death");
    self endon("leaving");
    self endon("target_assist");
    self endon("player_defend");
    if (!isdefined(self.owner)) {
        thread helperdrone_leave();
        return;
    }
    self.owner endon("disconnect");
    self endon("owner_gone");
    while (1) {
        currentstance = self.owner getstance();
        if (!isdefined(self.last_owner_stance) || currentstance != self.last_owner_stance || istrue(self.stoppedatlocation)) {
            if (istrue(self.stoppedatlocation)) {
                self.stoppedatlocation = undefined;
            }
            self.last_owner_stance = currentstance;
            helperdrone_movetoplayer(self.owner, var_42a0537f1ae3e42e);
        }
        wait(0.5);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9e
// Size: 0x207
function helperdrone_overwatchplayer() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    if (issharedfuncdefined("player", "showMiniMap")) {
        self.owner [[ getsharedfunc("player", "showMiniMap") ]]();
    }
    self.owner.showuavminimaponspawn = 1;
    self.owner thread helperdrone_showminimaponspawn(self);
    var_bb89186dc852508 = 1;
    self vehicle_setspeed(200, 50, 10);
    while (1) {
        var_691aa1d5da533612 = undefined;
        if (istrue(var_bb89186dc852508)) {
            currentpos = self.origin;
            var_2eca7b12d2ee27ba = self.owner.origin * (1, 1, 0) + (0, 0, self.origin[2]);
            var_691aa1d5da533612 = ray_trace(currentpos, var_2eca7b12d2ee27ba, self);
        }
        xpos = self.owner.origin[0];
        ypos = self.owner.origin[1];
        if (isdefined(var_691aa1d5da533612)) {
            if (var_691aa1d5da533612["hittype"] != "hittype_none") {
                xpos = var_691aa1d5da533612["position"][0];
                ypos = var_691aa1d5da533612["position"][1];
            }
        }
        var_7504c8791e34dc73 = getcorrectheight(xpos, ypos, 20);
        var_6e281dbd69fc980e = (xpos, ypos, var_7504c8791e34dc73);
        self setlookatent(self.owner);
        self setvehgoalpos(var_6e281dbd69fc980e, 1);
        waittill_any_2("goal", "begin_evasive_maneuvers");
        if (istrue(var_bb89186dc852508)) {
            var_bb89186dc852508 = undefined;
            self vehicle_setspeed(level.helperdronesettings[self.helperdronetype].speed, 10, 10);
        }
        self clearlookatent();
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.1);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50ac
// Size: 0x79
function getcorrectheight(x, y, rand) {
    var_dc8bb6300463cf1e = 1500;
    /#
        var_13c46a6715142436 = getdvarint(@"hash_166b0ad3d56b43f", 0);
        var_dc8bb6300463cf1e = var_dc8bb6300463cf1e + var_13c46a6715142436;
    #/
    var_e7a7d619f927d791 = tracegroundpoint(x, y);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    var_1dc672cfe0f0128e = var_1dc672cfe0f0128e + randomint(rand);
    return var_1dc672cfe0f0128e;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x512d
// Size: 0xc1
function tracegroundpoint(x, y) {
    self endon("death");
    self endon("leaving");
    z = -99999;
    var_e531afbe1391f499 = self.origin[2] + 2000;
    minz = level.averagealliesz;
    ignorelist = [0:self];
    var_e96577032a7740fc = sphere_trace((x, y, var_e531afbe1391f499), (x, y, z), 256, ignorelist, undefined, 1);
    if (var_e96577032a7740fc["position"][2] < minz) {
        var_fa83e3a4c4e6902 = minz;
    } else {
        var_fa83e3a4c4e6902 = var_e96577032a7740fc["position"][2];
    }
    return var_fa83e3a4c4e6902;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f6
// Size: 0x1aa
function helperdrone_pingnearbyenemies() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    var_91b19adf7d92417c = 300;
    radarrange = 1200;
    if (islargemap()) {
        var_91b19adf7d92417c = 1000;
        radarrange = 2500;
    }
    self.pingedenemies = [];
    while (1) {
        var_ef269077a28646eb = utility::playersinsphere(self.owner.origin, radarrange);
        foreach (player in var_ef269077a28646eb) {
            if (player == self.owner) {
                continue;
            }
            if (level.teambased && player.team == self.owner.team) {
                continue;
            }
            if (issharedfuncdefined("player", "isReallyAlive")) {
                jumpiftrue([[ getsharedfunc("player", "isReallyAlive") ]](player)) LOC_00000123;
            } else {
            LOC_00000123:
                if (player helperdrone_isbeingpingedbydrone(self)) {
                    continue;
                }
                if (issharedfuncdefined("perk", "hasPerk")) {
                    jumpiffalse(player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_ghost")) LOC_00000162;
                } else {
                LOC_00000162:
                    triggerportableradarping(player.origin, self.owner, var_91b19adf7d92417c, 3000);
                    thread helperdrone_watchpingedstatus(player, self.owner);
                }
            }
        }
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53a7
// Size: 0x79
function helperdrone_watchpingedstatus(var_77380882ccbfe2f5, var_2d1828e3f6df9c24) {
    self endon("death");
    var_77380882ccbfe2f5 endon("disconnect");
    level endon("game_ended");
    if (isdefined(var_2d1828e3f6df9c24)) {
        var_77380882ccbfe2f5 playsoundtoplayer("recondrone_marker", var_2d1828e3f6df9c24);
    }
    self.pingedenemies[self.pingedenemies.size] = var_77380882ccbfe2f5;
    var_77380882ccbfe2f5 waittill_any_timeout_1(3, "death");
    self.pingedenemies = array_remove(self.pingedenemies, var_77380882ccbfe2f5);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5427
// Size: 0x7b
function helperdrone_isbeingpingedbydrone(drone) {
    var_5000bb58f1128c5c = 0;
    foreach (enemy in drone.pingedenemies) {
        if (isdefined(enemy) && self == enemy) {
            var_5000bb58f1128c5c = 1;
            break;
        }
    }
    return var_5000bb58f1128c5c;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54aa
// Size: 0x99
function helperdrone_getheightoffset(config) {
    heightoffset = config.standupoffset;
    var_e8be66aec958de65 = self.owner getstance();
    switch (var_e8be66aec958de65) {
    case #"hash_c6775c88e38f7803":
        heightoffset = config.standupoffset;
        break;
    case #"hash_3fed0cbd303639eb":
        heightoffset = config.crouchupoffset;
        break;
    case #"hash_d91940431ed7c605":
        heightoffset = config.proneupoffset;
        break;
    }
    return heightoffset;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x554b
// Size: 0x12e
function helperdrone_guardlocation() {
    self.stoppedatlocation = 1;
    var_1fa6573b990bcd4a = int(self.origin[2] * 0.65);
    var_1becbc015340bf8d = self.mappointinfo[0].location + (0, 0, var_1fa6573b990bcd4a);
    var_2113d7b30b4928ce = sphere_trace(self.origin, var_1becbc015340bf8d, 200, self);
    if (isdefined(var_2113d7b30b4928ce)) {
        if (isdefined(var_2113d7b30b4928ce["entity"])) {
            var_1becbc015340bf8d = var_2113d7b30b4928ce["entity"].origin + (0, 0, randomintrange(100, 200));
            if (isdefined(var_2113d7b30b4928ce["entity"].guardlocation)) {
                var_1becbc015340bf8d = var_2113d7b30b4928ce["entity"].guardlocation + (0, 0, randomintrange(100, 200));
            }
        } else if (isdefined(var_2113d7b30b4928ce["hittype"]) && isdefined(var_2113d7b30b4928ce["position"]) && var_2113d7b30b4928ce["hittype"] != "hittype_none") {
            var_1becbc015340bf8d = var_2113d7b30b4928ce["position"] + (0, 0, randomintrange(300, 500));
        }
    }
    thread helperdrone_moveintoplace(var_1becbc015340bf8d);
    self.guardlocation = var_1becbc015340bf8d;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5680
// Size: 0x10d
function helperdrone_moveintoplace(var_1becbc015340bf8d) {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("rotors", "on", 0);
    self playloopsound("veh_scrambler_drone_idle_high");
    self moveto(var_1becbc015340bf8d - (0, 0, 20), 3, 2, 1);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3.2);
    self moveto(var_1becbc015340bf8d, 1, 0.5, 0.5);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1.2);
    while (1) {
        var_803270b249d3fe99 = randomintrange(-35, 35);
        var_5fe85daeec942414 = randomintrange(-15, 15);
        var_12b839d2a79160e2 = var_1becbc015340bf8d[0] + var_803270b249d3fe99;
        var_12b83ad2a7916315 = var_1becbc015340bf8d[1] + var_803270b249d3fe99;
        var_12b837d2a7915c7c = var_1becbc015340bf8d[2] + var_5fe85daeec942414;
        var_7cd652e507bf980 = (var_12b839d2a79160e2, var_12b83ad2a7916315, var_12b837d2a7915c7c);
        self moveto(var_7cd652e507bf980, 3, 2, 1);
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3.2);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5794
// Size: 0x57
function helperdrone_watchradarpulse() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    while (1) {
        triggerportableradarping(self.origin, self.owner);
        self.owner playsound("oracle_radar_pulse_npc");
        wait(3);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57f2
// Size: 0x57
function helperdrone_movetoplayer(player, var_42a0537f1ae3e42e) {
    self setlookatent(player);
    targetoffset = helperdrone_gettargetoffset(self, player);
    if (isdefined(var_42a0537f1ae3e42e)) {
        targetoffset = var_42a0537f1ae3e42e;
    }
    self setdronegoalent(player, targetoffset, 16, 10);
    self.intransit = 1;
    thread helperdrone_watchforgoal();
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5850
// Size: 0x2bd
function helperdrone_watchmodeswitch() {
    level endon("game_ended");
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    self endon("owner_gone");
    config = level.helperdronesettings[self.helperdronetype];
    if (issharedfuncdefined("killstreak", "setKillstreakControlPriority")) {
        self.useobj [[ getsharedfunc("killstreak", "setKillstreakControlPriority") ]](self.owner, self.currentstring, 360, 360, 30000, 30000, 3);
    }
    while (1) {
        player = self.useobj waittill("trigger");
        if (player != self.owner) {
            continue;
        }
        if (self.owner isusingremote()) {
            continue;
        }
        if (!self.owner val::get("usability")) {
            continue;
        }
        if (issharedfuncdefined("entity", "isTouchingBoundsTrigger")) {
            if ([[ getsharedfunc("entity", "isTouchingBoundsTrigger") ]](self.owner)) {
                continue;
            }
        }
        timeused = 0;
        result = undefined;
        updaterate = level.framedurationseconds;
        while (self.owner usebuttonpressed()) {
            timeused = timeused + updaterate;
            if (timeused > 0.1) {
                self notify("switch_modes");
                newmode = getothermode(self.combatmode, self.streakinfo);
                var_e30ee4ae67d05d90 = "Empty String";
                /#
                    assertex(isdefined(config.primarymode) && isdefined(config.secondarymode), "Switching modes requires that the drone has a primary and secondary settings in its config");
                #/
                if (newmode == config.primarymode) {
                    result = [[ config.primarymodefunc ]](config);
                    var_e30ee4ae67d05d90 = config.secondarymodestring;
                } else {
                    result = [[ config.secondarymodefunc ]](config);
                    var_e30ee4ae67d05d90 = config.primarymodestring;
                }
                if (!istrue(result)) {
                    return;
                }
                self.combatmode = newmode;
                self.currentstring = var_e30ee4ae67d05d90;
                self.useobj makeunusable();
                namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
                if (issharedfuncdefined("killstreak", "setKillstreakControlPriority")) {
                    self.useobj [[ getsharedfunc("killstreak", "setKillstreakControlPriority") ]](self.owner, self.currentstring, 360, 360, 30000, 30000, 3);
                }
                break;
            }
            wait(updaterate);
        }
        wait(updaterate);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b14
// Size: 0x60
function getothermode(mode, streakinfo) {
    config = level.helperdronesettings[self.helperdronetype];
    if (mode == config.primarymode) {
        mode = config.secondarymode;
    } else {
        mode = config.primarymode;
    }
    return mode;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b7c
// Size: 0xb8
function setescortmodesettings(config) {
    self vehicle_setspeed(self.speed, self.accel);
    self setyawspeed(120, 90);
    self setneargoalnotifydist(16);
    self sethoverparams(30, 10, 5);
    self setturningability(1);
    self setdroneturnparams(50, 1.3, 30, 20);
    if (issharedfuncdefined("player", "showMiniMap")) {
        self.owner [[ getsharedfunc("player", "showMiniMap") ]]();
    }
    self.owner thread helperdrone_showminimaponspawn(self);
    helperdrone_enableradar("escort_radar");
    thread helperdrone_followplayer();
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3c
// Size: 0xcc
function function_207c13cdc424e93b() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    level endon("game_ended");
    timeoutduration = self.timeout;
    timeelapsed = 0;
    if (!isdefined(self.timeout)) {
        return;
    }
    self.owner setclientomnvar("ui_killstreak_countdown", 100);
    while (timeelapsed < timeoutduration) {
        var_77b3f0514a25c019 = (timeoutduration - timeelapsed) / timeoutduration;
        var_77b3f0514a25c019 = int(ceil(clamp(var_77b3f0514a25c019, 0, 1) * 100));
        if (istrue(self.ispiloted)) {
            self.owner setclientomnvar("ui_killstreak_countdown", var_77b3f0514a25c019);
        }
        timeelapsed = timeelapsed + level.framedurationseconds;
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0f
// Size: 0x1d
function helperdrone_lockedoncallback() {
    namespace_84cff6185e39aa66::vehomn_showwarning("missileLocking", self.owner, "killstreak");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d33
// Size: 0x1d
function helperdrone_lockedonremovedcallback() {
    namespace_84cff6185e39aa66::vehomn_hidewarning("missileLocking", self.owner, "killstreak");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d57
// Size: 0x25
function setoverwatchmodesettings(config) {
    thread helperdrone_overwatchplayer();
    thread helperdrone_pingnearbyenemies();
    helperdrone_handleteamvisibility();
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d84
// Size: 0x16
function setfollowmode(config) {
    thread helperdrone_followplayer();
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da2
// Size: 0x4f
function setguardmode(config) {
    if (isent(self)) {
        helperdrone_guardlocation();
        helperdrone_handleteamvisibility();
        function_1532eae4fc92c4d3();
        self scriptmodelplayanim(level.scr_anim["scrambler_drone_guard"]["rotor_spin"]);
    }
    scramblerdrone_counteruavmodeon();
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df9
// Size: 0x27
function function_1532eae4fc92c4d3() {
    self setscriptablepartstate("looping_wave", "on", 0);
    self setscriptablepartstate("scramble_sfx", "on", 0);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e27
// Size: 0x17
function setdeliverymodesettings(config) {
    thread helperdrone_deliver(config);
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e46
// Size: 0x1f4
function helperdrone_deliver(config) {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    self setneargoalnotifydist(10);
    speed = level.helperdronesettings[self.helperdronetype].speed;
    accel = level.helperdronesettings[self.helperdronetype].accel;
    self vehicle_setspeed(speed, accel, accel);
    var_14e71b3b3dbf761c = self.deliverytarget + (0, 0, 4000);
    startpos = self.deliverytarget + (0, 0, 2500);
    endpos = self.deliverytarget + (0, 0, 100);
    halfsize = level.helperdronesettings[self.helperdronetype].halfsize;
    ignoreents = [];
    ignoreents[0] = self;
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1);
    traceresult = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, halfsize, ignoreents, contentoverride, 0);
    droppos = traceresult["shape_position"] + (0, 0, 100);
    self setvehgoalpos(droppos, 1);
    self waittill("goal");
    wait(0.5);
    [[ self.ondelivercallback ]]();
    self vehicle_setspeedimmediate(2);
    self vehicle_setspeed(0.1, 1, 1);
    wait(0.5);
    self vehicle_setspeed(speed, accel, accel);
    self setvehgoalpos(var_14e71b3b3dbf761c, 0);
    self waittill("goal");
    function_608250000fbfc89a(self.helperdronetype, config, 0);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6041
// Size: 0xd7
function helperdrone_watchearlyexit(config, var_72c27359aaac97f4) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("explode");
    while (1) {
        if (issharedfuncdefined("killstreak", "allowRideKillstreakPlayerExit")) {
            if (iscp()) {
                self thread [[ getsharedfunc("killstreak", "allowRideKillstreakPlayerExit") ]]("leaving", undefined, var_72c27359aaac97f4);
            } else {
                self thread [[ getsharedfunc("killstreak", "allowRideKillstreakPlayerExit") ]]("leaving", var_72c27359aaac97f4);
            }
        }
        self waittill("killstreakExit");
        if (!istrue(self.ispiloted)) {
            continue;
        }
        if (isdefined(config.var_be3314f77fef5d6b)) {
            self notify("drone_exit");
            self [[ config.var_be3314f77fef5d6b ]]();
        } else {
            helperdrone_leave();
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x611f
// Size: 0x6c
function function_1d24e8f818e18244() {
    level endon("game_ended");
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    var_b2d2806c761e0c98 = 1;
    /#
        var_655a3c232c1650bb = getdvarint(@"hash_b23e7bb60bbe76a6", 0);
        if (var_655a3c232c1650bb) {
            var_b2d2806c761e0c98 = 0;
        }
    #/
    if (istrue(var_b2d2806c761e0c98)) {
        var_6d5a295ae3c46554 function_6a275656141ac8d6(self);
    }
    thread helperdrone_handlethermalswitchinternal();
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6192
// Size: 0x107
function helperdrone_handlethermalswitchinternal() {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    self.isthermalenabled = 0;
    var_93b54405fda960c = function_44e0bd95b98288ab();
    if (isnightmap()) {
        self.isthermalenabled = 1;
        var_6d5a295ae3c46554 killstreak_setmainvision(var_93b54405fda960c);
        var_6d5a295ae3c46554 setthermalvision(1, 12, 1000);
    }
    while (1) {
        var_6d5a295ae3c46554 waittill("switch_thermal_mode");
        if (!istrue(self.ispiloted)) {
            continue;
        }
        if (self.isthermalenabled) {
            self.isthermalenabled = 0;
            var_6d5a295ae3c46554 setthermalvision(0);
            var_6d5a295ae3c46554 function_6a275656141ac8d6(self);
            var_6d5a295ae3c46554 playlocalsound("weap_thermal_toggle_click");
        } else {
            self.isthermalenabled = 1;
            var_6d5a295ae3c46554 killstreak_setmainvision(var_93b54405fda960c);
            var_6d5a295ae3c46554 setthermalvision(1, 12, 1000);
            var_6d5a295ae3c46554 playlocalsound("weap_thermal_toggle_click");
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62a0
// Size: 0x82
function function_6a275656141ac8d6(drone) {
    var_143ba8c547269a07 = level.helperdronesettings[drone.helperdronetype];
    if (level.mapname == "mp_hideout") {
        killstreak_setmainvision(var_143ba8c547269a07.var_2215fa459d8250c0);
    }
    if (isdefined(level.var_6d129920246627ba)) {
        killstreak_setmainvision(level.var_6d129920246627ba);
    } else {
        killstreak_setmainvision(var_143ba8c547269a07.var_a117852275e49e64);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6329
// Size: 0x128
function helperdrone_monitorcollision(config) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    while (1) {
        ent = self waittill("touch");
        if (!isdefined(ent)) {
            continue;
        }
        vehicle = undefined;
        if (ent namespace_1f188a13f7e79610::isvehicle()) {
            vehicle = ent;
        } else if (ent namespace_f8065cafc523dba5::isinvehicle()) {
            vehicle = ent.vehicle;
        }
        if (!isdefined(vehicle)) {
            continue;
        }
        attacker = undefined;
        inflictor = undefined;
        if (istrue(playersareenemies(self.owner, vehicle.owner))) {
            currentvehicle = vehicle.owner namespace_f8065cafc523dba5::getvehicle();
            if (isdefined(currentvehicle) && currentvehicle == vehicle) {
                attacker = vehicle.owner;
                inflictor = vehicle;
            }
        }
        self dodamage(self.maxhealth, vehicle.origin, attacker, inflictor, "MOD_CRUSH");
        break;
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6458
// Size: 0x14b
function function_109f8639aebf2da9(config) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    var_741196a281686ee = [0:"physicscontents_water"];
    contentoverride = physics_createcontents(var_741196a281686ee);
    self.inwater = 0;
    while (1) {
        var_b4331a150334bf61 = physics_querypoint(self.origin, 0, contentoverride, self, "physicsquery_any");
        if (istrue(var_b4331a150334bf61) && !istrue(self.inwater)) {
            self.inwater = 1;
            attacker = self.owner;
            inflictor = self;
            self dodamage(10000, self.origin, attacker, inflictor, "MOD_CRUSH");
            break;
        } else if (!istrue(var_b4331a150334bf61) && istrue(self.inwater)) {
            self.inwater = 0;
            self vehicle_setspeed(100, 10);
            self setyawspeed(120, 90);
            self sethoverparams(30, 10, 5);
            self setturningability(1);
            self setdroneturnparams(50, 1.3, 30, 20);
        }
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65aa
// Size: 0x87
function helperdrone_watchforgoal() {
    level endon("game_ended");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    self.owner endon("death_or_disconnect");
    self endon("owner_gone");
    self notify("helperDrone_watchForGoal");
    self endon("helperDrone_watchForGoal");
    result = waittill_any_return_3("goal", "near_goal", "hit_goal");
    self.intransit = 0;
    self.inactive = 0;
    self notify("hit_goal");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6638
// Size: 0x371
function helperdrone_watchdamage(var_292694740d43f466) {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self.owner endon("disconnect");
    self endon("owner_gone");
    self.health = 2147483647;
    config = level.helperdronesettings[self.helperdronetype];
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = amount = self waittill("damage");
        var_1faa3d3dec8d49bd = undefined;
        /#
            var_1faa3d3dec8d49bd = istrue(self.var_1faa3d3dec8d49bd);
        #/
        if (isdefined(attacker)) {
            if (isdefined(attacker.owner)) {
                attacker = attacker.owner;
            }
            if (isdefined(attacker.team) && attacker.team == self.team && attacker != self.owner && !istrue(var_292694740d43f466)) {
                continue;
            }
        }
        if (isdefined(objweapon)) {
            if (istrue(var_1faa3d3dec8d49bd)) {
                goto LOC_00000203;
            }
            if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
                amount = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, meansofdeath, amount, config.maxhealth, 1, 1, 1);
            LOC_00000203:
            }
        LOC_00000203:
        }
    LOC_00000203:
        self.currenthealth = self.currenthealth - amount;
        killstreak_updatedamagestate(self.currenthealth);
        if (isplayer(attacker)) {
            if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                attacker [[ getsharedfunc("damage", "updateDamageFeedback") ]]("");
            }
            if (issharedfuncdefined("killstreak", "killstreakHit")) {
                [[ getsharedfunc("killstreak", "killstreakHit") ]](attacker, objweapon, self, meansofdeath, amount);
            }
            if (issharedfuncdefined("damage", "logAttackerKillstreak")) {
                self [[ getsharedfunc("damage", "logAttackerKillstreak") ]](self, amount, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon);
            }
            if (self.currenthealth <= 0) {
                attacker notify("destroyed_killstreak", objweapon);
                damage = amount;
                streakname = self.streakinfo.streakname;
                damagetype = undefined;
                var_dc695757f69ed065 = 1;
                if (isdefined(objweapon)) {
                    if (namespace_3c37cb17ade254d::issharedfuncdefined("damage", "onKillstreakKilled")) {
                        var_3737240cefe2c793 = self [[ namespace_3c37cb17ade254d::getsharedfunc("damage", "onKillstreakKilled") ]](self.helperdronetype, attacker, objweapon, damagetype, damage, config.scorepop, config.vodestroyed, config.destroyedsplash, var_dc695757f69ed065);
                    }
                }
                thread function_6edfda4764129e3(1);
            }
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69b0
// Size: 0x10f
function helperdrone_watchtimeout() {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("drop");
    self.owner endon("disconnect");
    self endon("owner_gone");
    config = level.helperdronesettings[self.helperdronetype];
    if (!isdefined(self.timeout)) {
        return;
    }
    if (self.timeout > 0) {
        wait(self.timeout);
    }
    if (istrue(config.var_5c6a7212bf9fcbea)) {
        if (self.helperdronetype == "radar_drone_recon") {
            function_8959c1606f65e65(self.streakinfo.streakname, self.streakinfo.streakname + "_timeout");
        } else {
            playkillstreakoperatordialog(self.streakinfo.streakname, self.streakinfo.streakname + "_timeout", 1);
        }
    }
    thread helperdrone_leave(1);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ac6
// Size: 0x70
function helperdrone_watchownerloss() {
    level endon("game_ended");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    childthread helperdrone_watchownerstatus("disconnect");
    childthread helperdrone_watchownerstatus("joined_team");
    childthread helperdrone_watchownerstatus("joined_spectators");
    childthread helperdrone_watchownerstatus("last_stand_start");
    if (iscp()) {
        childthread helperdrone_watchownerstatus("oob_last_stand");
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b3d
// Size: 0x4f
function helperdrone_watchownerstatus(var_70687e0cc558a009) {
    self.owner waittill(var_70687e0cc558a009);
    if (!iscp() || iscp() && self.owner isusingremote()) {
        self notify("owner_gone");
        thread helperdrone_leave();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b93
// Size: 0x52
function helperdrone_watchownerdeath() {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("owner_gone");
    while (1) {
        self.owner waittill_any_2("death", "last_stand_start");
        if (function_7ac8fccbfd39d8b9()) {
            thread helperdrone_leave();
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bec
// Size: 0xae
function function_7ac8fccbfd39d8b9() {
    config = level.helperdronesettings[self.helperdronetype];
    if (istrue(config.diewithowner)) {
        return 1;
    }
    if (function_6ae03efb52c52c29(self.owner) || getdvarint(@"hash_896b182fbfa8d9de", 0)) {
        if (istrue(self.ispiloted)) {
            switch (self.helperdronetype) {
            case #"hash_e40585107590f016":
                if (!istrue(config.var_8316e01be4051639)) {
                    return 1;
                }
                self notify("killstreakExit");
                return 0;
            default:
                return 1;
                break;
            }
        }
    }
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca2
// Size: 0x54
function helperdrone_watchroundend() {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    self.owner endon("disconnect");
    self endon("owner_gone");
    level waittill_any_3("start_game_ended", "game_ended", "prematch_cleanup");
    thread helperdrone_leave();
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cfd
// Size: 0x155
function helperdrone_leave(timeout) {
    self endon("death");
    self endon("explode");
    self endon("drop");
    config = level.helperdronesettings[self.helperdronetype];
    if (isdefined(config.var_63a39d0cea63cbb2)) {
        self thread [[ config.var_63a39d0cea63cbb2 ]](timeout);
    } else if (self.helperdronetype == "radar_drone_overwatch") {
        self clearlookatent();
        self setmaxpitchroll(0, 0);
        self notify("leaving");
        self vehicle_setspeed(50, 25);
        pathgoal = self.origin + anglestoforward((0, randomint(360), 0)) * 500;
        pathgoal = pathgoal + (0, 0, 1000);
        self setvehgoalpos(pathgoal, 1);
        self setneargoalnotifydist(100);
        self waittill("near_goal");
        pathend = helperdrone_getpathend();
        self vehicle_setspeed(150, 50);
        self setvehgoalpos(pathend, 1);
        self waittill("goal");
        self notify("gone");
        function_608250000fbfc89a(self.helperdronetype, level.helperdronesettings[self.helperdronetype], 0);
    } else {
        thread function_6edfda4764129e3(0, 1, timeout);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e59
// Size: 0x62
function helperdrone_getpathend() {
    pathrandomness = 150;
    halfdistance = 15000;
    yaw = self.angles[1];
    direction = (0, yaw, 0);
    endpoint = self.origin + anglestoforward(direction) * halfdistance;
    return endpoint;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ec3
// Size: 0x129
function perkengineer_manageminimap() {
    var_30f120a1efc1dcbe = "hud_icon_minimap_killstreak_cuav";
    createfunc = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjectiveEngineer")) {
        createfunc = namespace_3c37cb17ade254d::getsharedfunc("game", "createObjectiveEngineer");
    }
    if (isdefined(createfunc)) {
        self.enemyobjid = self [[ createfunc ]](var_30f120a1efc1dcbe, 1, 1);
    }
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        if (issharedfuncdefined("perk", "hasPerk")) {
            if (player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_engineer") && player.team != self.team) {
                if (isdefined(self.enemyobjid) && self.enemyobjid != -1) {
                    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.enemyobjid, player);
                }
            }
        }
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ff3
// Size: 0x101
function function_caf721cb23374e2b(data) {
    type = data.meansofdeath;
    damage = data.damage;
    if (isdefined(self.owner) && self.owner isusingremote()) {
        if (isexplosivedamagemod(type)) {
            if (ceil(damage / self.maxhealth) >= 0.4) {
                earthquake(0.25, 0.2, self.origin, 150);
                self.owner playrumbleonentity("damage_heavy");
            } else {
                earthquake(0.15, 0.15, self.origin, 150);
                self.owner playrumbleonentity("damage_light");
            }
        }
    }
    self.currenthealth = self.currenthealth - damage;
    killstreak_updatedamagestate(self.currenthealth);
    return 1;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70fc
// Size: 0xf7
function helperdrone_stunned(duration) {
    self notify("helperDrone_stunned");
    self endon("helperDrone_stunned");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    self.owner endon("disconnect");
    level endon("game_ended");
    if (istrue(self.attackingtarget)) {
        self notify("disengage_target");
    }
    self.stunned = 1;
    if (isdefined(level.helperdronesettings[self.helperdronetype].fxid_sparks)) {
        playfxontag(level.helperdronesettings[self.helperdronetype].fxid_sparks, self, "tag_origin");
    }
    playfxontag(getfx("emp_stun"), self, "tag_origin");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(duration);
    stopfxontag(getfx("emp_stun"), self, "tag_origin");
    self.stunned = 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71fa
// Size: 0x313
function function_7017058e21ac030f(data) {
    self.isdestroyed = 1;
    self.var_d31453e33d3e34ca = 1;
    config = level.helperdronesettings[self.helperdronetype];
    if (istrue(self.var_8316e01be4051639)) {
        self.var_8316e01be4051639 = 0;
    }
    if (self.ispiloted) {
        self.var_75bb433488d96804 = spawn("script_model", self.origin);
        self.var_75bb433488d96804.angles = self.owner getplayerangles();
        self.var_75bb433488d96804 setmodel("tag_origin");
        self.var_75bb433488d96804 linkto(self, "tag_origin");
        if (self.helperdronetype == "radar_drone_recon") {
            self.owner remotecontrolvehicleoff();
        } else if (self.helperdronetype == "assault_drone") {
            self.owner remotecontrolvehicleoff();
        }
        self.owner cameraunlink();
        self.owner cameralinkto(self.var_75bb433488d96804, "tag_origin", 1, 1);
        self clearlookatent();
    }
    var_ecb39c9eecbd70ad = 3000;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 0, 1, 0, 0, 0);
    castend = self.origin + anglestoup(self.angles) * var_ecb39c9eecbd70ad * -1 + (randomintrange(-500, 500), 0, randomintrange(-500, 500));
    trace = ray_trace(self.origin, castend, [0:self]);
    target_origin = trace["position"] + trace["normal"] * 5;
    maxvelocity = getdvarfloat(@"hash_44e62153228221f", 30.2);
    acceleration = getdvarfloat(@"hash_cdb03278c6d17e78", 13.8);
    var_acdfcbf564707132 = getdvarfloat(@"hash_ed85baf3072c3fff", 17.2);
    var_f9ca3f557a387549 = getdvarfloat(@"hash_3f6d20d42a18063b", 2500);
    distance = distance(target_origin, self.origin);
    falltime = sqrt(2 * distance / acceleration);
    falltime = min(falltime, 2) - 0.2;
    self vehicle_setspeed(maxvelocity, acceleration, var_acdfcbf564707132);
    self setvehgoalpos(target_origin, 0);
    thread function_9bfdff1ee5a47652();
    time = 0;
    while (1) {
        if (distancesquared(self.origin, target_origin) <= var_f9ca3f557a387549 || time >= falltime) {
            function_566780fd588dd54a(data);
            break;
        }
        time = time + level.framedurationseconds;
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7514
// Size: 0x86
function function_566780fd588dd54a(data) {
    if (isdefined(data.inflictor) && isdefined(data.inflictor.stuckto)) {
        data.inflictor notify("forceDeath");
    }
    if (isdefined(self.var_75bb433488d96804)) {
        self.owner cameraunlink();
        self.var_75bb433488d96804 delete();
        self.var_75bb433488d96804 = undefined;
    }
    thread function_6edfda4764129e3(1);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a1
// Size: 0x6a
function function_9bfdff1ee5a47652() {
    level endon("game_ended");
    self endon("explode");
    self endon("drop");
    self setmaxpitchroll(60, 90);
    self setyawspeed(1000, 500, 500);
    while (1) {
        var_dee36ad33d9e9755 = randomintrange(140, 170);
        self settargetyaw(self.angles[1] + var_dee36ad33d9e9755);
        wait(0.25);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7612
// Size: 0xa5
function function_ba1c5496f8fc5f67(data) {
    if (!isdefined(self) || istrue(self.isdestroyed)) {
        return;
    }
    if (isdefined(data) && isdefined(data.inflictor) && isdefined(data.inflictor.weapon_name) && (data.inflictor.weapon_name == "shock_stick_mp" || data.inflictor.weapon_name == "jup_shock_stick_cp")) {
        thread function_7017058e21ac030f(data);
    } else {
        thread function_6edfda4764129e3(1);
    }
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76bf
// Size: 0x14
function function_f6914d06b20aee20() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76da
// Size: 0x14
function function_3ad98c4f7524b525() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76f5
// Size: 0x14
function function_e68a206899cafbe5() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7710
// Size: 0xe4
function function_cc7fd8dc48c88e9e(var_3df9d9a1027fb9bc) {
    tag_origin = spawn("script_model", var_3df9d9a1027fb9bc);
    tag_origin setmodel("tag_origin");
    direction = vectornormalize(self.origin - tag_origin.origin);
    right = vectorcross(direction, (0, 0, 1));
    up = vectorcross(right, direction);
    var_4a89ff2e8d138d08 = axistoangles(direction, right, up);
    tag_origin rotateto(var_4a89ff2e8d138d08, 0.01);
    self.owner cameraunlink();
    self.owner setplayerangles(tag_origin.angles);
    self.owner cameralinkto(tag_origin, "tag_origin", 0, 1);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77fb
// Size: 0x25
function function_886c327598c568db(traceresult) {
    return isdefined(traceresult["hittype"]) && traceresult["hittype"] != "hittype_none";
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7828
// Size: 0xde
function function_e3f077b1c512f372(testangles, var_b244ec4933d2a52e, upangles) {
    traceorigin = self gettagorigin("tag_undercam") - (0, 0, 15);
    if (istrue(var_b244ec4933d2a52e)) {
        testangles = testangles * -1;
    }
    var_f9fc2925c4f8dbe8 = anglestoforward(testangles + (15, 0, 0));
    if (!isdefined(upangles)) {
        traceresult = namespace_2a184fc4902783dc::ray_trace(traceorigin + var_f9fc2925c4f8dbe8, traceorigin + testangles, self);
        thread namespace_f2ffc0540883e1ad::drawline(traceorigin + var_f9fc2925c4f8dbe8, traceorigin + testangles, 2.5, (1, 0, 0));
    } else {
        traceresult = namespace_2a184fc4902783dc::ray_trace(traceorigin + testangles, traceorigin + testangles + upangles, self);
        thread namespace_f2ffc0540883e1ad::drawline(traceorigin + testangles, traceorigin + testangles + upangles, 2.5, (1, 0, 0));
    }
    return traceresult;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790e
// Size: 0xaa
function function_8c9a4bc6b72b3356(var_abc186fba0278306, var_b244ec4933d2a52e) {
    traceorigin = self gettagorigin("tag_undercam") - (0, 0, 15);
    var_fbb712f106198b9f = anglestoup(self.angles) * 125;
    var_175f053a7d781c8a = function_e3f077b1c512f372(var_abc186fba0278306, var_b244ec4933d2a52e);
    if (!function_886c327598c568db(var_175f053a7d781c8a)) {
        var_4de4971a7752cad = function_e3f077b1c512f372(var_abc186fba0278306, var_b244ec4933d2a52e, var_fbb712f106198b9f);
        if (!function_886c327598c568db(var_4de4971a7752cad)) {
            if (istrue(var_b244ec4933d2a52e)) {
                var_abc186fba0278306 = var_abc186fba0278306 * -1;
            }
            function_cc7fd8dc48c88e9e(traceorigin + var_abc186fba0278306 + var_fbb712f106198b9f);
            return 1;
        }
    }
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79c0
// Size: 0x92
function function_229259da45e71937() {
    traceorigin = self gettagorigin("tag_undercam") - (0, 0, 15);
    var_fbb712f106198b9f = anglestoup(self.angles) * 125 * 3;
    traceresult = namespace_2a184fc4902783dc::ray_trace(traceorigin, traceorigin + var_fbb712f106198b9f, self);
    thread namespace_f2ffc0540883e1ad::drawline(traceorigin, traceorigin + var_fbb712f106198b9f, 2.5, (1, 0, 0));
    if (!function_886c327598c568db(traceresult)) {
        function_cc7fd8dc48c88e9e(traceorigin + var_fbb712f106198b9f);
        return 1;
    }
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a5a
// Size: 0xab
function function_901f4a4041610043() {
    var_881a65df3a7787df = anglestoforward(self.angles) * 350;
    var_4fa29d6999cafd60 = anglestoright(self.angles) * 350;
    var_665c16bc6a6ac86f = anglestoleft(self.angles) * 350;
    if (function_8c9a4bc6b72b3356(var_881a65df3a7787df, 1)) {
        return 1;
    }
    if (function_8c9a4bc6b72b3356(var_881a65df3a7787df)) {
        return 1;
    }
    if (function_8c9a4bc6b72b3356(var_4fa29d6999cafd60)) {
        return 1;
    }
    if (function_8c9a4bc6b72b3356(var_665c16bc6a6ac86f)) {
        return 1;
    }
    if (function_229259da45e71937()) {
        return 1;
    }
    /#
        announcement("duration_none");
    #/
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b0d
// Size: 0x3ef
function function_6edfda4764129e3(var_4fac8b8ce36e09f1, var_d9b2677826930bf7, var_28d4a6f776c18b73, var_bd21744eb1b623fe) {
    self.owner stopwatchingthermalinputchange();
    self.isdestroyed = 1;
    config = level.helperdronesettings[self.helperdronetype];
    if (!istrue(var_d9b2677826930bf7) && !istrue(var_bd21744eb1b623fe)) {
        if (self.helperdronetype == "radar_drone_recon") {
            function_8959c1606f65e65(self.helperdronetype, self.helperdronetype + "_destroyed");
        } else {
            playkillstreakoperatordialog(self.helperdronetype, self.helperdronetype + "_destroyed", 1);
        }
    }
    if (isdefined(self.targetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(self.targetmarkergroup);
        self.targetmarkergroup = undefined;
    }
    if (isdefined(self.minimapid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.minimapid);
        self.minimapid = undefined;
    }
    helperdrone_endscramblereffect();
    if (function_ccf98e6391dd38b9() && self.helperdronetype == "assault_drone") {
        thirdperson = function_901f4a4041610043();
    } else {
        thirdperson = 0;
    }
    if (isdefined(config.var_5d9d3e47b1b88b84) && !istrue(self.var_a9ce54bf6032822a)) {
        self [[ config.var_5d9d3e47b1b88b84 ]](config, var_4fac8b8ce36e09f1, var_d9b2677826930bf7, var_28d4a6f776c18b73, var_bd21744eb1b623fe, thirdperson);
    } else {
        function_24085a0230958938();
    }
    namespace_5a51aa78ea0b1b9f::allow_emp(0);
    self notify("explode");
    if (isdefined(self.streakinfo.var_ebec497ff8b18a45)) {
        if (issharedfuncdefined("challenges", "onFieldUpgradeEnd")) {
            self.owner [[ getsharedfunc("challenges", "onFieldUpgradeEnd") ]](self.streakinfo.var_ebec497ff8b18a45, self.usedcount);
        }
    }
    if (isdefined(self.streakinfo.superid)) {
        if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
            [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.streakinfo.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
        }
    }
    owner = self.owner;
    if (isdefined(owner)) {
        if (isdefined(owner.super) && owner.super.isinuse) {
            if (isdefined(self.streakinfo.var_ebec497ff8b18a45) && self.streakinfo.var_ebec497ff8b18a45 == owner.super.staticdata.ref) {
                if (issharedfuncdefined("supers", "superUseFinished")) {
                    self.owner thread [[ getsharedfunc("supers", "superUseFinished") ]](0);
                }
            }
        }
    }
    if (istrue(self.inwater)) {
        self.owner clearsoundsubmix("player_swimming_underwater", 0);
        self.owner clearsoundsubmix("iw9_player_drowning", 0);
        self.owner setentitysoundcontext("atmosphere", "water_surface", 0);
        self.owner clearclienttriggeraudiozone(0);
    }
    if (istrue(self.nonvehicle)) {
        waitframe();
    } else {
        wait(0.2);
    }
    function_608250000fbfc89a(self.helperdronetype, level.helperdronesettings[self.helperdronetype], var_4fac8b8ce36e09f1);
    if (!namespace_36f464722d326bbe::isbrstylegametype() && isdefined(owner) && issharedfuncdefined("br", "superSlotCleanUp")) {
        [[ getsharedfunc("br", "superSlotCleanUp") ]](owner);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f03
// Size: 0xb9
function function_ffbc19e1aef5943c(ison) {
    if (ison) {
        namespace_84cff6185e39aa66::vehomn_showwarning("DDoSed", self.owner, self.vehiclename);
        self.owner namespace_5a51aa78ea0b1b9f::play_emp_scramble(4);
        self.owner _freezecontrols(1);
        self.owner _freezelookcontrols(1);
    } else {
        namespace_84cff6185e39aa66::vehomn_hidewarning("DDoSed", self.owner, self.vehiclename);
        self.owner namespace_5a51aa78ea0b1b9f::stop_emp_scramble(4);
        self.owner _freezecontrols(0);
        self.owner _freezelookcontrols(0);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc3
// Size: 0x36f
function function_dd2172321d232563(var_4fac8b8ce36e09f1, var_d9b2677826930bf7, timedout) {
    var_53385b6be5f6c52f = self.currenthealth;
    var_f88fb7783beaa918 = undefined;
    if (self.ispiloted) {
        var_f88fb7783beaa918 = self getentityvelocity();
    }
    config = level.helperdronesettings[self.helperdronetype];
    if (isdefined(self.targetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(self.targetmarkergroup);
        self.targetmarkergroup = undefined;
    }
    if (isdefined(self.minimapid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.minimapid);
        self.minimapid = undefined;
    }
    helperdrone_endscramblereffect();
    if (isdefined(config.dropfunc) && istrue(self.var_a9ce54bf6032822a)) {
        self [[ config.dropfunc ]](config, var_4fac8b8ce36e09f1, var_d9b2677826930bf7, timedout);
    } else {
        function_24085a0230958938();
    }
    namespace_5a51aa78ea0b1b9f::allow_emp(0);
    self notify("drop");
    if (isdefined(self.streakinfo.var_ebec497ff8b18a45)) {
        if (issharedfuncdefined("challenges", "onFieldUpgradeEnd")) {
            self.owner [[ getsharedfunc("challenges", "onFieldUpgradeEnd") ]](self.streakinfo.var_ebec497ff8b18a45, self.usedcount);
        }
    }
    if (isdefined(self.streakinfo.superid)) {
        if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
            [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.streakinfo.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
        }
    }
    if (istrue(self.inwater)) {
        self.owner clearsoundsubmix("player_swimming_underwater", 0);
        self.owner clearsoundsubmix("iw9_player_drowning", 0);
        self.owner setentitysoundcontext("atmosphere", "water_surface", 0);
        self.owner clearclienttriggeraudiozone(0);
    }
    if (istrue(self.nonvehicle)) {
        waitframe();
    } else {
        wait(0.2);
    }
    owner = self.owner;
    if (isdefined(owner.super) && owner.super.isinuse) {
        if (isdefined(self.streakinfo.var_ebec497ff8b18a45) && self.streakinfo.var_ebec497ff8b18a45 == owner.super.staticdata.ref) {
            if (issharedfuncdefined("supers", "superUseFinished")) {
                self.owner thread [[ getsharedfunc("supers", "superUseFinished") ]](0);
            }
        }
    }
    function_608250000fbfc89a(self.helperdronetype, level.helperdronesettings[self.helperdronetype], var_4fac8b8ce36e09f1, var_f88fb7783beaa918, var_53385b6be5f6c52f);
    if (level.gametype != "br" && isdefined(owner) && issharedfuncdefined("br", "superSlotCleanUp")) {
        [[ getsharedfunc("br", "superSlotCleanUp") ]](owner);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8339
// Size: 0x51
function function_9fe87b841a44448f() {
    if (isent(self)) {
        var_8f7dde4490939b87 = "on";
        if (istrue(self.inwater)) {
            if (self getscriptableparthasstate("explode", "water")) {
                var_8f7dde4490939b87 = "water";
            }
        }
        self setscriptablepartstate("explode", var_8f7dde4490939b87, 0);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8391
// Size: 0x51
function function_24085a0230958938() {
    if (isent(self)) {
        exitstate = "on";
        if (istrue(self.inwater)) {
            if (self getscriptableparthasstate("exit", "water")) {
                exitstate = "water";
            }
        }
        self setscriptablepartstate("exit", exitstate, 0);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e9
// Size: 0x1e
function function_1a4f935ba283ab0f() {
    if (isent(self)) {
        self setscriptablepartstate("drop", "on", 0);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x840e
// Size: 0x360
function function_608250000fbfc89a(var_7c344645cc98e70d, config, var_4fac8b8ce36e09f1, var_f88fb7783beaa918, var_53385b6be5f6c52f) {
    helperdrone_disableradar();
    self.ispiloted = undefined;
    self.var_8316e01be4051639 = undefined;
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    if (isdefined(self.playersfx)) {
        self.playersfx delete();
    }
    if (isdefined(self.scrambler)) {
        self.scrambler delete();
    }
    if (isdefined(self.enemyobjid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.enemyobjid);
    }
    if (isdefined(self.pulsedarts) && self.pulsedarts.size > 0) {
        foreach (var_334e9887a767ef7 in self.pulsedarts) {
            var_334e9887a767ef7 notify("death");
        }
    }
    if (!istrue(self.streakinfo.issuper)) {
        level callback::callback("killstreak_finish_use", {streakinfo:self.streakinfo});
    }
    if (isdefined(self.owner)) {
        if (isdefined(self.owner.helperdrone)) {
            self.owner.helperdrone = undefined;
        }
        if (isplayer(self.owner)) {
            self.owner clearsoundsubmix("mp_recon_drone", 1);
            self.owner notify("eng_drone_update", -1);
        } else {
            self.owner notify("drone_destroyed", var_4fac8b8ce36e09f1);
        }
        self.owner stopwatchingthermalinputchange();
        if (var_7c344645cc98e70d == "radar_drone_escort" || var_7c344645cc98e70d == "radar_drone_overwatch") {
            if (issharedfuncdefined("player", "hideMiniMap")) {
                self.owner [[ getsharedfunc("player", "hideMiniMap") ]]();
            }
        }
        self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
        self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    }
    if (var_7c344645cc98e70d == "scrambler_drone_guard") {
        scramblerdrone_counteruavmodeoff();
    }
    if (istrue(self.nonvehicle)) {
        self delete();
    } else if (!var_4fac8b8ce36e09f1 && istrue(self.var_a9ce54bf6032822a) && !istrue(self.dropped)) {
        if (isdefined(self.owner)) {
            var_26e951743d0f567d = self.owner function_99e1189114e8419a(self.origin, self.angles, var_7c344645cc98e70d, self.streakinfo, var_f88fb7783beaa918, var_53385b6be5f6c52f);
        }
        namespace_f64231d5b7a2c3c4::_deletevehicle(self);
    } else {
        namespace_f64231d5b7a2c3c4::_deletevehicle(self);
    }
    if (isplayer(self.owner) && issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
        self.owner setclientomnvar("ui_killstreak_countdown", 0);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8775
// Size: 0x4e
function function_f23d90f7483d67e4() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("droneStart");
    starttime = gettime();
    var_fc36664f5893d75d = 1000;
    while (gettime() - starttime < var_fc36664f5893d75d) {
        function_89af506d89aad6ed(0);
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87ca
// Size: 0x6f
function function_89af506d89aad6ed(state, drone) {
    /#
        assertex(0 <= state && state <= 4, "RCD Controls state must be in the range [0-4].");
    #/
    var_27903296234d1638 = 0;
    if (isdefined(drone)) {
        var_27903296234d1638 = drone.helperdronetype == "assault_drone";
    }
    if (state > 0 && var_27903296234d1638) {
        state = state + 2;
    }
    self setclientomnvar("ui_rcd_controls", state);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8840
// Size: 0x57
function function_28368a23c20ff3e6(var_c8462289edfc0aca, target, state) {
    var_7cbb905f3204b5d0 = (state >> 0) % 2 == 1;
    var_1f6ff6a3877bf04 = (state >> 1) % 2 == 1;
    targetmarkergroupsetentitystate(var_c8462289edfc0aca, target, var_7cbb905f3204b5d0);
    targetmarkergroupsetextrastate(var_c8462289edfc0aca, target, var_1f6ff6a3877bf04);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889e
// Size: 0x6f6
function function_289ddd64ec5b3010(streakinfo, owner) {
    if (!isdefined(level.supportdrones)) {
        return 0;
    }
    if (level.incominghelperdrones.size > 0) {
        if (issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
            if (level.incominghelperdrones.size >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
                return 1;
            }
        }
        foreach (drone in level.incominghelperdrones) {
            if (isdefined(drone.owner) && drone.owner == owner) {
                continue;
            }
            if (streakinfo.streakname == "radar_drone_recon" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (isdefined(drone.owner) && isdefined(drone.owner.team) && drone.owner.team == owner.team) {
                        return 1;
                    }
                }
            } else if (streakinfo.streakname == "assault_drone" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (isdefined(drone.owner) && isdefined(drone.owner.team) && drone.owner.team == owner.team) {
                        return 1;
                    }
                }
            } else if (streakinfo.streakname == "radar_drone_overwatch" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (helperdrone_getnumdrones("radar_drone_overwatch", level.incominghelperdrones, owner.team) >= 10) {
                        return 1;
                    }
                }
                if (helperdrone_getnumdrones("radar_drone_overwatch", level.incominghelperdrones) >= 20) {
                    return 1;
                }
            } else if (streakinfo.streakname == "scrambler_drone_guard" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (helperdrone_getnumdrones("scrambler_drone_guard", level.incominghelperdrones, owner.team) >= 10) {
                        return 1;
                    }
                }
            }
        }
    }
    if (level.supportdrones.size > 0) {
        if (issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
            if (level.supportdrones.size >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
                return 1;
            }
        }
        foreach (drone in level.supportdrones) {
            if (streakinfo.streakname == "radar_drone_escort" && drone.helperdronetype == streakinfo.streakname) {
                if (isdefined(drone.owner) && drone.owner == owner) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/COMPANION_ALREADY_EXISTS");
                    }
                    return 1;
                }
            } else if (streakinfo.streakname == "radar_drone_recon" && drone.helperdronetype == streakinfo.streakname) {
                if (level.teambased) {
                    if (drone.team == owner.team) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
                        }
                        return 1;
                    }
                }
            } else if (streakinfo.streakname == "assault_drone" && drone.helperdronetype == streakinfo.streakname) {
                if (level.teambased) {
                    if (drone.team == owner.team) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
                        }
                        return 1;
                    }
                }
            } else if (streakinfo.streakname == "radar_drone_overwatch" && drone.helperdronetype == streakinfo.streakname) {
                if (helperdrone_getnumdrones("radar_drone_overwatch", level.supportdrones) >= 20) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
                    }
                    return 1;
                }
                if (level.teambased) {
                    if (helperdrone_getnumdrones("radar_drone_overwatch", level.supportdrones, owner.team) >= 10) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_PERSONAL_RADAR");
                        }
                        return 1;
                    }
                }
                if (helperdrone_getnumdrones("radar_drone_overwatch", level.supportdrones, owner) >= 1) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/PERSONAL_RADAR_ALREADY_ACTIVE");
                    }
                    return 1;
                }
            } else if (streakinfo.streakname == "scrambler_drone_guard" && drone.helperdronetype == streakinfo.streakname) {
                if (level.teambased) {
                    if (helperdrone_getnumdrones("scrambler_drone_guard", level.supportdrones, owner.team) >= 10) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_COUNTER_UAV");
                        }
                        return 1;
                    }
                } else if (helperdrone_getnumdrones("scrambler_drone_guard", level.supportdrones, owner) >= 2) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_COUNTER_UAV");
                    }
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9c
// Size: 0x115
function helperdrone_getnumdrones(var_7c344645cc98e70d, var_ee9e55b40b28d806, var_bace6387b1d799ad) {
    var_dc1a0178a2c53770 = 0;
    foreach (drone in var_ee9e55b40b28d806) {
        if (isdefined(drone.type) && drone.type == var_7c344645cc98e70d || isdefined(drone.helperdronetype) && drone.helperdronetype == var_7c344645cc98e70d) {
            if (isdefined(var_bace6387b1d799ad)) {
                if (isplayer(var_bace6387b1d799ad)) {
                    if (drone.owner != var_bace6387b1d799ad) {
                        continue;
                    }
                    goto LOC_000000fd;
                }
                jumpiffalse(issharedfuncdefined("game", "isGameplayTeam") && [[ getsharedfunc("game", "isGameplayTeam") ]](var_bace6387b1d799ad)) LOC_000000fd;
                jumpiffalse(drone.team != var_bace6387b1d799ad) LOC_000000fd;
            } else {
            LOC_000000fd:
                var_dc1a0178a2c53770++;
            }
        }
    }
    return var_dc1a0178a2c53770;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90b9
// Size: 0x31
function helperdrone_destroyongameend() {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    level waittill_any_2("bro_shot_start", "game_ended");
    function_ba1c5496f8fc5f67();
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90f1
// Size: 0x10a
function helperdrone_watchaltitude(player) {
    self endon("game_ended");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    var_a4e731e18a4e789b = getdvarfloat(@"hash_f983d652b2640512", 1500);
    var_4f8e491037dcdff7 = getdvarfloat(@"hash_35bab6c292a12242", 6000);
    var_f203791de5ca7907 = var_a4e731e18a4e789b + var_4f8e491037dcdff7;
    var_176e0a0ae11d3a7b = 0;
    var_d7c5f779c1a8fc57 = 0;
    while (1) {
        if (self.origin[2] > var_4f8e491037dcdff7) {
            if (self.origin[2] > var_f203791de5ca7907) {
                player setclientomnvar("ui_out_of_range", 0);
                function_ba1c5496f8fc5f67();
            }
            var_176e0a0ae11d3a7b = (self.origin[2] - var_4f8e491037dcdff7) / var_a4e731e18a4e789b;
        } else {
            var_176e0a0ae11d3a7b = 0;
        }
        if (var_176e0a0ae11d3a7b != var_d7c5f779c1a8fc57) {
            var_d7c5f779c1a8fc57 = var_176e0a0ae11d3a7b;
            player setclientomnvar("ui_out_of_range", var_176e0a0ae11d3a7b);
        }
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9202
// Size: 0xa2
function helperdrone_gettargetoffset(helperdrone, player) {
    config = level.helperdronesettings[helperdrone.helperdronetype];
    backoffset = config.backoffset;
    sideoffset = config.sideoffset;
    heightoffset = helperdrone helperdrone_getheightoffset(config);
    if (isdefined(helperdrone.low_entry)) {
        heightoffset = heightoffset * helperdrone.low_entry;
    }
    targetoffset = (sideoffset, backoffset, heightoffset);
    return targetoffset;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92ac
// Size: 0x5bc
function function_34280b807c23a453(helperdronetype) {
    startang = self.angles;
    zoffset = (0, 0, 80);
    spawndist = level.helperdronesettings[helperdronetype].spawndist;
    heightoffset = (0, 0, zoffset[2]);
    halfsize = level.helperdronesettings[helperdronetype].halfsize;
    forward = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    playerpos = namespace_f8065cafc523dba5::getstancetop();
    var_50203232dac6b01f = 50;
    var_4eba8b5ab3b85e92 = 20;
    if (namespace_9db09f982acd35b4::player_standing_on_train()) {
        heightoffset = heightoffset + (0, 0, 150);
        var_50203232dac6b01f = 120;
        spawndist = 150;
        halfsize = halfsize * 3;
        var_4eba8b5ab3b85e92 = 120;
    } else if (function_f8789f15330de751(self)) {
        heightoffset = heightoffset + (0, 0, 100);
        var_50203232dac6b01f = 100;
        spawndist = 120;
        halfsize = halfsize * 2;
        var_4eba8b5ab3b85e92 = 100;
    } else if (self isswimming()) {
        playerpos = self.origin + (0, 0, getdvarint(@"hash_d78c8ed504373ea5", 30));
    }
    var_8604e40dae72edd = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_vehicleclip", 2:"physicscontents_missileclip", 3:"physicscontents_clipshot"]);
    var_214d77bb9d513c28 = ray_trace(self.origin + (0, 0, 20), playerpos, self, var_8604e40dae72edd);
    if (var_214d77bb9d513c28["hittype"] != "hittype_none") {
        return undefined;
    }
    var_778f9ab8c1872412 = spawndist + var_4eba8b5ab3b85e92;
    if (self getstance() == "prone") {
        var_778f9ab8c1872412 = var_778f9ab8c1872412 + 25;
    }
    if (isplayer(self)) {
        if (namespace_9db09f982acd35b4::player_standing_on_train()) {
            heightoffset = heightoffset + (0, 0, 150);
        }
    }
    var_676798dc94029f6c = [0:heightoffset + spawndist * forward, 1:heightoffset - spawndist * forward, 2:heightoffset + spawndist * right, 3:heightoffset - spawndist * right, 4:heightoffset, 5:heightoffset + 0.707 * spawndist * (forward + right), 6:heightoffset + 0.707 * spawndist * (forward - right), 7:heightoffset + 0.707 * spawndist * (right - forward), 8:heightoffset + 0.707 * spawndist * (-1 * forward - right), 9:var_778f9ab8c1872412 * forward, 10:-1 * var_778f9ab8c1872412 * forward, 11:var_778f9ab8c1872412 * right, 12:-1 * var_778f9ab8c1872412 * right, 13:0.707 * var_778f9ab8c1872412 * (forward + right), 14:0.707 * var_778f9ab8c1872412 * (forward - right), 15:0.707 * var_778f9ab8c1872412 * (right - forward), 16:0.707 * var_778f9ab8c1872412 * (-1 * forward - right)];
    var_cca213f58a72d7b7 = 0;
    for (i = 0; i < var_676798dc94029f6c.size; i++) {
        if (4 <= var_cca213f58a72d7b7) {
            var_cca213f58a72d7b7 = 0;
            wait(0.05);
        }
        spawnoffset = var_676798dc94029f6c[i];
        spawnpos = playerpos + spawnoffset;
        if (issharedfuncdefined("game", "isBRStyleGameType")) {
            if ([[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
                var_a4e731e18a4e789b = getdvarfloat(@"hash_f983d652b2640512", 1500);
                var_4f8e491037dcdff7 = getdvarfloat(@"hash_35bab6c292a12242", 6000);
                var_f203791de5ca7907 = var_a4e731e18a4e789b + var_4f8e491037dcdff7;
                if (spawnpos[2] >= var_f203791de5ca7907) {
                    break;
                }
            }
        }
        var_719da4aa69a9fc90 = vectornormalize(spawnoffset) * var_50203232dac6b01f;
        var_965c36fe7c010b3 = playerpos + var_719da4aa69a9fc90;
        var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_vehicleclip", 2:"physicscontents_missileclip", 3:"physicscontents_clipshot", 4:"physicscontents_water"]);
        var_214d77bb9d513c28 = ray_trace(playerpos, var_965c36fe7c010b3, self, var_1bfa180c6fdd09dd);
        /#
            if (getdvarint(@"hash_7d1382405485d79f", 0)) {
                line(playerpos, var_965c36fe7c010b3, (0, 0, 1), 1, 0, 1000);
            }
        #/
        if (var_214d77bb9d513c28["hittype"] != "hittype_none") {
            continue;
        }
        var_e5354be82a7990d5 = sphere_trace(var_965c36fe7c010b3, spawnpos, halfsize, self, var_1bfa180c6fdd09dd);
        fraction = var_e5354be82a7990d5["fraction"];
        var_84d0c5c148da4a7a = fraction * (spawnpos - var_965c36fe7c010b3);
        var_6e3f1a360851a19a = var_965c36fe7c010b3 + var_84d0c5c148da4a7a;
        /#
            if (getdvarint(@"hash_7d1382405485d79f", 0)) {
                line(var_965c36fe7c010b3, spawnpos, (1, 0, 0), 1, 0, 1000);
                sphere(var_965c36fe7c010b3, 5, (1, 1, 0), 0, 1000);
                sphere(spawnpos, 5, (0, 1, 1), 0, 1000);
            }
        #/
        if (fraction > 0) {
            /#
                if (getdvarint(@"hash_7d1382405485d79f", 0)) {
                    sphere(var_6e3f1a360851a19a, halfsize, (0, 1, 0), 0, 1000);
                }
            #/
            self.recondronesafespawn = var_6e3f1a360851a19a;
            return var_6e3f1a360851a19a;
        }
        var_cca213f58a72d7b7++;
    }
    return undefined;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9870
// Size: 0xad
function helperdrone_showminimaponspawn(drone) {
    self endon("disconnect");
    drone endon("death");
    drone endon("explode");
    drone endon("leaving");
    drone endon("drop");
    level endon("game_ended");
    ownerid = self.guid;
    level notify("helperDrone_show_minimap_" + ownerid);
    level endon("helperDrone_show_minimap_" + ownerid);
    if (istrue(level.istacops)) {
        return;
    }
    while (1) {
        self waittill("spawned_player");
        if (issharedfuncdefined("player", "showMiniMap")) {
            self [[ getsharedfunc("player", "showMiniMap") ]]();
        }
        self.showuavminimaponspawn = 1;
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9924
// Size: 0x177
function deliverydrone_delivertopoint(targetpos, ondelivercallback) {
    self endon("death_or_disconnect");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    streakinfo = spawnstruct();
    streakinfo.streakname = "ammo_drop";
    streakinfo.issuper = 1;
    streakinfo.superid = level.superglobals.staticsuperdata["super_weapon_drop"].id;
    streakinfo.var_ebec497ff8b18a45 = level.superglobals.staticsuperdata["super_weapon_drop"].ref;
    if (tryusehelperdroneearlyout(streakinfo, 1)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        function_c3786c4fba09c2f2(streakinfo);
        return undefined;
    }
    startpos = targetpos + (0, 0, 4000) - anglestoforward(self.angles) * 0;
    var_446db1dc2fd8e89d = createhelperdrone(startpos, self.angles, streakinfo.streakname, streakinfo);
    if (!isdefined(var_446db1dc2fd8e89d)) {
        return undefined;
    }
    function_c3786c4fba09c2f2(streakinfo);
    var_446db1dc2fd8e89d.deliverytarget = targetpos;
    var_446db1dc2fd8e89d.ondelivercallback = ondelivercallback;
    thread starthelperdrone(var_446db1dc2fd8e89d);
    return var_446db1dc2fd8e89d;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9aa3
// Size: 0x12
function scramblerdrone_counteruavmodeon() {
    namespace_f1fe279354a7da2::function_24d8b56676d4d3d1();
    level notify("uav_update");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9abc
// Size: 0x28
function scramblerdrone_counteruavmodeoff() {
    namespace_f1fe279354a7da2::function_e02b5390559e651a();
    /#
        self.owner.var_f39d717b31ec5af9 = undefined;
    #/
    level notify("uav_update");
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9aeb
// Size: 0x201
function function_b25ced7f149be057() {
    self.owner endon("disconnect");
    self endon("death");
    var_2f344609bbdba105 = 0;
    self.var_97da68f6abb8ec80 = 0;
    var_39b61d1f526b47d7 = 0;
    var_5bef4d0c7c1d06a8 = undefined;
    while (1) {
        if (isdefined(level.outofboundstriggers)) {
            self.var_97da68f6abb8ec80 = 0;
            foreach (trigger in level.outofboundstriggers) {
                if (self istouching(trigger)) {
                    if (isdefined(trigger.script_team) && self.team != trigger.script_team) {
                        continue;
                    }
                    self.var_97da68f6abb8ec80 = 1;
                    var_5bef4d0c7c1d06a8 = trigger;
                    if (istrue(var_39b61d1f526b47d7) && (!isdefined(self.oobtriggers) || self.oobtriggers.size == 0)) {
                        var_39b61d1f526b47d7 = 0;
                    }
                    if (iscp() && isdefined(trigger.failtrigger) && self istouching(trigger.failtrigger)) {
                        thread helperdrone_leave();
                        return;
                    }
                    break;
                }
            }
            if (self.var_97da68f6abb8ec80) {
                var_2f344609bbdba105 = var_2f344609bbdba105 + 1 * level.framedurationseconds;
                if (!istrue(var_39b61d1f526b47d7) && isdefined(var_5bef4d0c7c1d06a8)) {
                    if (issharedfuncdefined("game", "onEnterOOBTrigger")) {
                        [[ getsharedfunc("game", "onEnterOOBTrigger") ]](var_5bef4d0c7c1d06a8, self);
                    }
                    var_39b61d1f526b47d7 = 1;
                }
            } else {
                var_2f344609bbdba105 = var_2f344609bbdba105 - 2 * level.framedurationseconds;
                if (istrue(var_39b61d1f526b47d7) && isdefined(var_5bef4d0c7c1d06a8)) {
                    var_39b61d1f526b47d7 = 0;
                    var_5bef4d0c7c1d06a8 = undefined;
                }
            }
            var_2f344609bbdba105 = clamp(var_2f344609bbdba105, 0, 0.5);
            self.owner setclientomnvar("ui_out_of_range", var_2f344609bbdba105);
        }
        waitframe();
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cf3
// Size: 0x41
function function_de3c015e3c7130e7(helperdronetype) {
    var_17bcb5a652ec6088 = 0;
    switch (helperdronetype) {
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_e40585107590f016":
        var_17bcb5a652ec6088 = 1;
        break;
    }
    return var_17bcb5a652ec6088;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d3c
// Size: 0x25
function helperdrone_giveplayerfauxremote(streakinfo) {
    self endon("disconnect");
    setusingremote(streakinfo.streakname);
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d68
// Size: 0x45
function helperdrone_takeplayerfauxremote(streakinfo) {
    clearusingremote(1);
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    objweapon = makeweapon("ks_remote_drone_mp");
    if (self hasweapon(objweapon)) {
        thread getridofweapon(objweapon);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9db4
// Size: 0x289
function function_f9c33df98457a9a2(target, var_b2cc25676b34bf9) {
    var_27b697504d9397d = 0;
    var_bfd06d83fea8d89a = self.owner getvieworigin();
    if (istrue(var_b2cc25676b34bf9)) {
        var_bfd06d83fea8d89a = self.origin;
    }
    if (isdefined(target.recondronetracecontents)) {
        contents = target.recondronetracecontents;
    } else {
        contents = physics_createcontents([0:"physicscontents_itemclip", 1:"physicscontents_item", 2:"physicscontents_clipshot", 3:"physicscontents_missileclip", 4:"physicscontents_vehicle", 5:"physicscontents_ainosight"]);
    }
    var_8a4ea3a3baa22e4 = target.origin;
    if (isdefined(target.recondronetraceoffset)) {
        var_8a4ea3a3baa22e4 = var_8a4ea3a3baa22e4 + target.recondronetraceoffset;
    }
    tracepoints = [0:var_8a4ea3a3baa22e4];
    if (isplayer(target)) {
        headpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            headpos = target [[ getsharedfunc("player", "getStanceTop") ]]();
        }
        centerpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            centerpos = target [[ getsharedfunc("player", "getStanceCenter") ]]();
        }
        tracepoints = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    } else if (isagent(target)) {
        tracepoints = [0:var_8a4ea3a3baa22e4 + (0, 0, 1)];
    }
    ignorelist = [0:self, 1:target];
    vehicle = target getvehicle();
    if (isdefined(vehicle)) {
        ignorelist[ignorelist.size] = vehicle;
        var_bb7ac665413117fc = vehicle getlinkedchildren(1);
        foreach (child in var_bb7ac665413117fc) {
            ignorelist[ignorelist.size] = vehicle;
        }
    }
    for (i = 0; i < tracepoints.size; i++) {
        if (!namespace_2a184fc4902783dc::ray_trace_passed(var_bfd06d83fea8d89a, tracepoints[i], ignorelist, contents)) {
            continue;
        }
        var_27b697504d9397d = 1;
        break;
    }
    return var_27b697504d9397d;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa045
// Size: 0x3b
function function_e89890de385d2d9e(config, var_4fac8b8ce36e09f1, var_d9b2677826930bf7, var_28d4a6f776c18b73, var_bd21744eb1b623fe, thirdperson) {
    function_9fe87b841a44448f();
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa087
// Size: 0x41
function ishelperdrone() {
    if (isdefined(level.helperdronesettings)) {
        if (isdefined(self.streakinfo)) {
            return array_contains_key(level.helperdronesettings, self.streakinfo.streakname);
        }
    }
    return 0;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0d0
// Size: 0x47
function function_8c4ab0a7799e7ab8(weapon) {
    return weapon.basename == "ks_remote_drone_mp" || weapon.basename == "ks_assault_drone_mp" || weapon.basename == "ks_assault_drone_cp";
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa11f
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa13c
// Size: 0x28
function helperdrone_empapplied(data) {
    if (self.helperdronetype == "scrambler_drone_guard") {
        thread function_6edfda4764129e3(1);
    }
}

// Namespace helper_drone/namespace_bba8bc8532aa4913
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa16b
// Size: 0xcc
function function_5fbdbc50f271cfdf() {
    /#
        self endon("_crash");
        self endon("begin_evasive_maneuvers");
        self notify("setKillstreakControlPriority");
        self endon("setKillstreakControlPriority");
        while (1) {
            var_9f207219355d1982 = getnodesonpath(self.owner.origin, self.origin);
            if (isdefined(var_9f207219355d1982)) {
                for (i = 0; i < var_9f207219355d1982.size; i++) {
                    if (isdefined(var_9f207219355d1982[i + 1])) {
                        line(var_9f207219355d1982[i].origin + (0, 0, 80), var_9f207219355d1982[i + 1].origin + (0, 0, 80), (1, 0, 0));
                    }
                }
            }
            waitframe();
        }
    #/
}

