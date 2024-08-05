#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\common\callbacks.gsc;
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
#using scripts\common\elevators.gsc;
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x131a
// Size: 0xb7e
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
    level.helperdronesettings["radar_drone_overwatch"].primarymodestring = %KILLSTREAKS_HINTS/RCD_RADAR;
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
    level.helperdronesettings["scrambler_drone_guard"].explodefunc = &function_e89890de385d2d9e;
    level.helperdronesettings["scrambler_drone_guard"].damagemonitorfunc = &helperdrone_watchdamage;
    level.helperdronesettings["scrambler_drone_guard"].deployweaponname = "ks_gesture_phone_mp";
    level.helperdronesettings["scrambler_drone_guard"].voontimeout = 1;
    level.helperdronesettings["scrambler_drone_guard"].dropfunc = &function_dd2172321d232563;
    gametype = "";
    if (issharedfuncdefined("game", "getGameType")) {
        gametype = [[ getsharedfunc("game", "getGameType") ]]();
    }
    isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (isbr || gametype == "cp_survival") {
        if (level.helperdronesettings["radar_drone_recon"].repeatuse == 0) {
            level.helperdronesettings["radar_drone_recon"].diewithowner = 1;
        }
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea0
// Size: 0x4d
function init_helper_drone_vo() {
    game["dialog"]["scrambler_drone_guard_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["scrambler_drone_guard_timeout"] = "killstreak_remote_operator" + "_timeout";
    game["dialog"]["scrambler_drone_guard_destroyed"] = "killstreak_remote_operator" + "_crash";
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef5
// Size: 0x38
function init_helper_drone_anim() {
    level.scr_animtree["scrambler_drone_guard"] = %script_model;
    level.scr_anim["scrambler_drone_guard"]["rotor_spin"] = [script_model%mp_cuniform_rotor_spin];
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f35
// Size: 0x1a
function function_82d9de71444f6e33() {
    function_c0b0a582ff9e4d57("recon_drone_color_mp");
    function_c0b0a582ff9e4d57("recon_drone_color_dark_mp");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f57
// Size: 0xd
function weapongivenhelperdrone(streakinfo) {
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f6d
// Size: 0xa0
function function_29eacadfa638edc1(streakinfo) {
    level.incominghelperdrones[level.incominghelperdrones.size] = spawnstruct();
    level.incominghelperdrones[level.incominghelperdrones.size - 1].type = streakinfo.streakname;
    level.incominghelperdrones[level.incominghelperdrones.size - 1].owner = self;
    level.incominghelperdrones[level.incominghelperdrones.size - 1].team = self.team;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2015
// Size: 0xae
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20cb
// Size: 0x32
function function_e4ea3048d91b5eb1(streakinfo, showerror) {
    function_29eacadfa638edc1(streakinfo);
    if (function_289ddd64ec5b3010(streakinfo, self)) {
        function_c3786c4fba09c2f2(streakinfo);
        return false;
    }
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2106
// Size: 0xe2
function function_4acd3de63e55eb6c(streakinfo, showerror) {
    if (issharedfuncdefined("killstreak", "currentActiveVehicleCount") && issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
        if ([[ getsharedfunc("killstreak", "currentActiveVehicleCount") ]]() >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]() || level.fauxvehiclecount + 1 >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
            if (istrue(showerror)) {
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
                }
            }
            return false;
        }
    }
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]](1);
    }
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21f1
// Size: 0x45
function tryusehelperdrone(streakname, abilityrange) {
    if (!isdefined(abilityrange)) {
        abilityrange = 1000;
    }
    streakinfo = createstreakinfo(streakname, self);
    streakinfo.abilityrange = abilityrange;
    return tryusehelperdronefromstruct(streakinfo);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x223f
// Size: 0x834
function tryusehelperdronefromstruct(streakinfo) {
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return false;
        }
    }
    helperdronetype = streakinfo.streakname;
    startpos = function_34280b807c23a453(helperdronetype);
    if (!isdefined(startpos)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
        }
        return false;
    }
    config = level.helperdronesettings[helperdronetype];
    deployresult = undefined;
    var_52a5be2e2f91d710 = undefined;
    var_8e9bce85fbf3f459 = 0;
    if (isdefined(config.var_1c606430b81b28ff)) {
        var_8e9bce85fbf3f459 = 1;
        deployresult = self [[ config.var_1c606430b81b28ff ]](streakinfo);
    } else {
        nonvehicle = !isdefined(config.vehicleinfo);
        if (!nonvehicle) {
            if (!scripts\cp_mp\vehicles\vehicle_tracking::reservevehicle()) {
                return false;
            }
        }
        if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
            deployweaponname = "ks_gesture_generic_mp";
        } else {
            deployweaponname = level.helperdronesettings[streakinfo.streakname].deployweaponname;
        }
        if (isplayer(self)) {
            deployweaponobj = makeweapon(deployweaponname);
            if (function_9deb86c4684340e1(deployweaponobj)) {
                deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &weapongivenhelperdrone);
            } else if (function_3ffc7fd85f5754e9(deployweaponobj)) {
                deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &weapongivenhelperdrone);
            } else if (iskillstreakgestureweapon(deployweaponobj)) {
                deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy(streakinfo, deployweaponobj);
            } else if (function_6c58c6fdcc87e387(deployweaponobj)) {
                deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweapontabletdeploy(streakinfo);
            } else {
                deployresult = 0;
                assertmsg("Error: Helper Drone using an unsupported deploy weapon");
            }
        } else {
            deployresult = 1;
        }
        if (!istrue(deployresult)) {
            if (!nonvehicle) {
                scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
            }
            return false;
        }
        if (isdefined(level.killstreakbeginusefunc)) {
            if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
                if (!nonvehicle) {
                    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
                }
                if (deployweaponname != "ks_gesture_generic_mp") {
                    streakinfo notify("killstreak_finished_with_deploy_weapon");
                }
                return false;
            }
        }
        if (helperdronetype != "scrambler_drone_guard" || deployweaponname == "ks_gesture_generic_mp") {
            var_ce7e572ba798f2f7 = tryusehelperdroneearlyout(streakinfo, 1);
            if (var_ce7e572ba798f2f7) {
                if (!nonvehicle) {
                    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
                }
                if (deployweaponname != "ks_gesture_generic_mp") {
                    streakinfo notify("killstreak_finished_with_deploy_weapon");
                }
                return false;
            }
        }
        startpos = function_34280b807c23a453(helperdronetype);
        if (deployweaponname == "ks_remote_device_mp") {
            if (!isdefined(startpos)) {
                if (!nonvehicle) {
                    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
                }
                if (issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
                }
                streakinfo notify("killstreak_finished_with_deploy_weapon");
                return false;
            }
        }
        if (deployweaponname == "ks_remote_drone_mp") {
            var_fc4aa9db408d9420 = 0.6;
            var_e5c7ffb094dc9eec = 2;
            result = waittill_any_timeout_2(var_fc4aa9db408d9420, "death", "weapon_switch_started");
            if (!isdefined(result) || result != "timeout") {
                if (!nonvehicle) {
                    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
                }
                streakinfo notify("killstreak_finished_with_deploy_weapon");
                return false;
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
                    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
                }
                val::reset_all("helperDrone");
                streakinfo notify("killstreak_finished_with_deploy_weapon");
                return false;
            }
            val::reset_all("helperDrone");
        }
        mappointinfo = undefined;
        if (deployweaponname == "ks_remote_map_mp") {
            mappointinfo = undefined;
            if (issharedfuncdefined("killstreak", "getSelectMapPoint")) {
                mappointinfo = self [[ getsharedfunc("killstreak", "getSelectMapPoint") ]](streakinfo, 1);
            }
            if (!isdefined(mappointinfo)) {
                if (!nonvehicle) {
                    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
                }
                if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
                    [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
                }
                return false;
            }
        } else if (helperdronetype == "scrambler_drone_guard") {
            location = self.origin;
            if (isdefined(level.traceselectedmaplocation)) {
                tracedata = [[ level.traceselectedmaplocation ]](self.origin);
                location = tracedata["position"];
            }
            mappoint = spawnstruct();
            mappoint.location = location;
            mappointinfo = [];
            mappointinfo[0] = mappoint;
        }
        startang = self.angles;
        if (isdefined(mappointinfo)) {
            if (helperdronetype == "scrambler_drone_guard") {
                killstreak_dangernotifyplayersinrange(self, self.team, 15000, helperdronetype, mappointinfo[0].location);
                scramblerspawnpos = mappointinfo[0].location + (0, 0, 3000);
                helperdrone = createhelperdrone(scramblerspawnpos, startang, helperdronetype, streakinfo, nonvehicle, !nonvehicle);
                if (!isdefined(helperdrone)) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/UNAVAILABLE");
                    }
                    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
                        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
                    }
                    function_c3786c4fba09c2f2(streakinfo);
                    return false;
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
                return false;
            }
            if (helperdronetype == "assault_drone") {
                thread helperdrone_giveplayerfauxremote(streakinfo);
            }
            function_c3786c4fba09c2f2(streakinfo);
            thread starthelperdrone(helperdrone);
        }
    }
    if (!istrue(deployresult)) {
        return false;
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
    level notify("helper_drone_started", self, helperdronetype);
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7c
// Size: 0x73
function helperdronecreationfailedfx(helperdronetype, failposition) {
    if (!isdefined(failposition)) {
        failposition = self geteye() + (0, 0, 80);
    }
    fxent = spawn("script_model", failposition);
    fxent setmodel("ks_" + helperdronetype + "_mp");
    fxent setscriptablepartstate("exit", "on", 0);
    fxent thread delay_deletescriptable();
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2af7
// Size: 0x120
function tryusehelperdroneearlyout(streakinfo, showerror) {
    if (isusingremote()) {
        return true;
    }
    if (istrue(self.drones_disabled)) {
        if (istrue(showerror)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/UNAVAILABLE");
            }
        }
        return true;
    }
    if (streakinfo.streakname == "radar_drone_recon") {
        var_234bea9eaddc1edc = !isdefined(scripts\cp_mp\killstreaks\killstreakdeploy::candeploykillstreakweapon(streakinfo));
        if (!istrue(var_234bea9eaddc1edc) && istrue(showerror)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("MP/CANNOT_USE_GENERIC");
            }
            return true;
        }
    }
    var_9c16986ec4a8ff68 = function_4acd3de63e55eb6c(streakinfo, showerror);
    if (!var_9c16986ec4a8ff68) {
        return true;
    }
    var_f2e9119c4fba561a = function_e4ea3048d91b5eb1(streakinfo, showerror);
    if (!var_f2e9119c4fba561a) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]](1);
        }
        return true;
    }
    return false;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c20
// Size: 0x19
function delay_deletescriptable() {
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(2);
    self delete();
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2c41
// Size: 0x698
function createhelperdrone(startpos, startang, helperdronetype, streakinfo, nonvehicle, vehiclereserved) {
    clearvehiclereservation = !istrue(nonvehicle) && istrue(vehiclereserved);
    if (!isdefined(startpos)) {
        if (!istrue(clearvehiclereservation)) {
            scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        }
        return;
    }
    config = level.helperdronesettings[helperdronetype];
    dronemodel = config.modelbase;
    drone = undefined;
    if (istrue(nonvehicle)) {
        drone = spawn("script_model", startpos);
        drone setmodel(dronemodel);
        drone.nonvehicle = 1;
    } else {
        if (clearvehiclereservation) {
            scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        }
        drone = scripts\cp_mp\vehicles\vehicle_tracking::_spawnhelicopter(self, startpos, startang, config.vehicleinfo, dronemodel);
        /#
            var_aded1f99ce13821a = getdvarint(@"hash_b23e7bb60bbe76a6", 0);
            if (var_aded1f99ce13821a) {
                drone setscriptablepartstate("<dev string:x1c>", "<dev string:x26>", 0);
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
    drone.camerastate = "default";
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
    delaysentient = 0;
    if (istrue(drone.nonvehicle)) {
        drone scripts\mp\sentientpoolmanager::registersentient("Tactical_Moving", self, undefined, undefined, 0, 1);
    } else {
        delaysentient = 1;
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
    iconoffset = 12;
    switch (helperdronetype) {
    case #"hash_f64c697bfb4c6b54": 
        iconoffset = 60;
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
        iconoffset = 100;
        break;
    default: 
        break;
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        drone [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", drone.owner, 0, 1, iconoffset);
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
    thread function_4dcb82341876e985(delaysentient, drone);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread scripts\common\elevators::function_5c07037726ae5001(drone);
        }
    }
    return drone;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32e2
// Size: 0x4d
function function_7c5c7844eb8db8bb() {
    self endon("death");
    self.owner endon("disconnect");
    if (!iscp() && function_c76228a77a70c9ea()) {
        return;
    }
    wait 5;
    scripts\mp\sentientpoolmanager::registersentient("Drone", self.owner);
    self notify("registered_sentient");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3337
// Size: 0x30
function function_c76228a77a70c9ea() {
    switch (self.helperdronetype) {
    case #"hash_e40585107590f016": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x336f
// Size: 0x36
function function_4dcb82341876e985(delaysentient, drone) {
    drone endon("death");
    self endon("disconnect");
    if (istrue(delaysentient)) {
        drone waittill("registered_sentient");
    }
    self setplayerusingdrone(drone);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x33ad
// Size: 0x399
function function_99e1189114e8419a(startpos, startang, helperdronetype, streakinfo, dronevel, dronehealth) {
    config = level.helperdronesettings[helperdronetype];
    if (getdvarint(@"hash_1253e99612575321", 0) && isdefined(config.var_f69f6bdde236401a)) {
        dronemodel = config.var_f69f6bdde236401a;
    } else {
        dronemodel = config.modelbase;
    }
    drone = undefined;
    drone = spawn("script_model", startpos);
    drone setmodel(dronemodel);
    drone.nonvehicle = 0;
    if (!isdefined(drone)) {
        return;
    }
    drone setnodeploy(1);
    drone.health = config.maxhealth;
    drone.maxhealth = config.maxhealth;
    drone.currenthealth = dronehealth;
    drone.ispiloted = 0;
    drone.damagetaken = config.maxhealth - dronehealth;
    drone.angles = startang;
    drone.owner = self;
    drone.team = self.team;
    drone.helperdronetype = helperdronetype;
    drone.combatmode = config.primarymode;
    drone.currentstring = config.secondarymodestring;
    drone.streakinfo = streakinfo;
    drone.camerastate = "default";
    drone.var_52c3b4bc88132aee = 0;
    drone.timeout = config.timeout;
    drone.dropped = 1;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            drone.timeout = 9999;
        }
    #/
    drone scripts\mp\sentientpoolmanager::registersentient("Tactical_Moving", self, undefined, undefined, 0, 1);
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
    iconoffset = 12;
    drone.stunned = 0;
    drone.inactive = 1;
    data = spawnstruct();
    data.validateaccuratetouching = 1;
    data.deathoverridecallback = &helperdrone_moving_platform_death;
    if (issharedfuncdefined("game", "handlemovingplatforms")) {
        drone [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
    if (isdefined(dronevel)) {
        drone physics_takecontrol(1, drone.origin, dronevel * 25);
    } else {
        drone physics_takecontrol(1);
    }
    drone makeusable();
    drone sethintstring(%MP/BR_RECONDRONE);
    drone sethintdisplayfov(90);
    drone setuseholdduration("duration_none");
    drone sethintrequiresholding(0);
    drone setusefov(90);
    drone thread function_c36d4585d380430f(streakinfo.superref);
    return drone;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x374f
// Size: 0xa6
function function_c36d4585d380430f(superref) {
    self endon("death");
    self endon("explode");
    self endon("pickup");
    while (true) {
        player = self waittill("trigger");
        if (isdefined(player) && isalive(player)) {
            if (issharedfuncdefined("player", "forceGiveSuper")) {
                player [[ getsharedfunc("player", "forceGiveSuper") ]](superref, 1, 0);
            }
            if (issharedfuncdefined("player", "playPickupFeedback")) {
                player [[ getsharedfunc("player", "playPickupFeedback") ]](self, 0);
            }
            self delete();
            return;
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37fd
// Size: 0xc1
function helperdrone_notifyenemyplayersinrange(helperdronetype) {
    var_b43d19b33263e16f = level.teamdata[self.team]["players"];
    enemyplayersinrange = utility::playersincylinder(self.origin, 3000, var_b43d19b33263e16f);
    foreach (enemyplayer in enemyplayersinrange) {
        if (issharedfuncdefined("killstreak", "dangerNotifyPlayer")) {
            self.owner [[ getsharedfunc("killstreak", "dangerNotifyPlayer") ]](enemyplayer, helperdronetype, 1);
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38c6
// Size: 0xa8
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3976
// Size: 0x71
function helperdrone_managevisibilityonteamjoin() {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    while (true) {
        player = level waittill("joined_team");
        if (level.teambased && player.team == self.team) {
            self hidefromplayer(player);
            continue;
        }
        self showtoplayer(player);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39ef
// Size: 0x190
function function_cc4dd1078cf1b365(streakname) {
    config = level.helperdronesettings[self.helperdronetype];
    if (!istrue(self.nonvehicle)) {
        killstreakvehicle = self;
        scorepopup = config.scorepopup;
        vodestroyed = config.vodestroyed;
        destroyedsplash = config.destroyedsplash;
        var_8dfc256103cce53e = config.var_c25a8137257a96d;
        var_191284e2e2837328 = config.var_f992ca11ef2b22bf;
        var_bacc6dd14316758c = config.premoddamagefunc;
        var_7da88d9c69433487 = config.postmoddamagefunc;
        deathcallback = config.deathfunc;
        killstreak_setupVehicleDamageFunctionality(streakname, killstreakvehicle, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
        scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_registerinstance(self, self.owner, self.owner.team);
    }
    function_cfc5e3633ef950fd(1, self.maxhealth * 0.75, &function_f6914d06b20aee20);
    function_cfc5e3633ef950fd(2, self.maxhealth * 0.5, &function_3ad98c4f7524b525);
    function_cfc5e3633ef950fd(3, self.maxhealth * 0.25, &function_e68a206899cafbe5);
    self.var_96419179a661cf96 = &function_1a4b3b6063ec7390;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b87
// Size: 0x3a
function function_1a4b3b6063ec7390(dronevictim, impulse) {
    if (!isdefined(dronevictim)) {
        return;
    }
    if (impulse > 0) {
        if (istrue(dronevictim.isdestroyed)) {
            return;
        }
        dronevictim thread function_6edfda4764129e3(1);
    }
}

/#

    // Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3bc9
    // Size: 0x1cd
    function function_9d01452d8baca7a0() {
        self endon("<dev string:x29>");
        self endon("<dev string:x2f>");
        self endon("<dev string:x37>");
        self endon("<dev string:x3f>");
        self.togglevisibility = 0;
        while (true) {
            togglevisibility = getdvarint(@"hash_4ec1877ac00842c0", 0);
            if (self.helperdronetype == "<dev string:x44>") {
                togglevisibility = getdvarint(@"hash_ac7f6a636682c52f", 0);
            }
            if (togglevisibility) {
                if (!istrue(self.togglevisibility)) {
                    self.togglevisibility = 1;
                    foreach (player in level.players) {
                        if (player.team == self.team) {
                            self showtoplayer(player);
                            if (self.helperdronetype == "<dev string:x44>") {
                                self.owner.var_f39d717b31ec5af9 = 1;
                                level notify("<dev string:x5a>");
                            }
                        }
                    }
                }
            } else if (istrue(self.togglevisibility)) {
                self.togglevisibility = 0;
                foreach (player in level.players) {
                    if (player.team == self.team) {
                        self hidefromplayer(player);
                        if (self.helperdronetype == "<dev string:x44>") {
                            self.owner.var_f39d717b31ec5af9 = undefined;
                            level notify("<dev string:x5a>");
                        }
                    }
                }
            }
            waitframe();
        }
    }

#/

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d9e
// Size: 0x3b
function function_988c532b8c5a4ec0(enemyent) {
    if (isdefined(enemyent)) {
        if (isdefined(enemyent.owner)) {
            enemyent = enemyent.owner;
        }
        enemyent notify("scramble_off" + self getentitynumber());
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3de1
// Size: 0xf2
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3edb
// Size: 0x292
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
    skipteamcheck = 0;
    /#
        skipteamcheck = getdvarint(@"hash_7786353439eb384c", 0);
    #/
    scramblerradius = getdvarfloat(@"hash_97a2272a19ad3843", 1000);
    var_f3b7cc3138382dfb = scramblerradius * scramblerradius;
    playercontents = physics_createcontents(["physicscontents_characterproxy"]);
    var_863c619037f3ac74 = self.origin - (0, 0, 3000);
    radiusvector = (scramblerradius, scramblerradius, 3000);
    aabbmin = var_863c619037f3ac74 - radiusvector;
    aabbmax = var_863c619037f3ac74 + radiusvector;
    while (true) {
        var_e5b984fc3e961023 = physics_aabbbroadphasequery(aabbmin, aabbmax, playercontents, []);
        foreach (scrambledent in var_e5b984fc3e961023) {
            isimmune = 0;
            if (issharedfuncdefined("perk", "hasPerk")) {
                isimmune = scrambledent [[ getsharedfunc("perk", "hasPerk") ]]("specialty_scrambler_resist");
            }
            if (isdefined(scrambledent) && scrambledent scripts\cp_mp\utility\player_utility::_isalive() && !isimmune) {
                if (distance2dsquared(self.origin, scrambledent.origin) > var_f3b7cc3138382dfb) {
                    continue;
                }
                if (skipteamcheck || level.teambased && scrambledent.team != self.team && scrambledent.team != "spectator" || !level.teambased && scrambledent != self.owner) {
                    if (scrambledent isusingremote()) {
                        continue;
                    }
                    if (scrambledent helperdrone_entaffectedbyscramble(self, skipteamcheck)) {
                        continue;
                    }
                    scrambledent helperdrone_setscramblerjammed(1, self, skipteamcheck);
                }
                continue;
            }
            if (isdefined(scrambledent.scrambledby) && array_contains(scrambledent.scrambledby, self)) {
                scrambledent notify("scramble_off" + self getentitynumber());
            }
        }
        waitframe();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4175
// Size: 0x104
function helperdrone_setscramblerplayerbuffs(buff, buffent) {
    if (helperdrone_entaffectedbyscramble(buffent) && istrue(buff)) {
        return;
    }
    if (istrue(buff)) {
        buffent.friendliesaffectedbyscrambler[buffent.friendliesaffectedbyscrambler.size] = self;
        thread helperdrone_managescramblerplayerbuff(buffent);
        if (issharedfuncdefined("perk", "givePerk")) {
            self [[ getsharedfunc("perk", "givePerk") ]]("specialty_blindeye");
        }
        if (issharedfuncdefined("perk", "givePerk")) {
            self [[ getsharedfunc("perk", "givePerk") ]]("specialty_noscopeoutline");
        }
        return;
    }
    if (isdefined(self)) {
        if (issharedfuncdefined("perk", "removePerk")) {
            self [[ getsharedfunc("perk", "removePerk") ]]("specialty_blindeye");
        }
        if (issharedfuncdefined("perk", "removePerk")) {
            self [[ getsharedfunc("perk", "removePerk") ]]("specialty_noscopeoutline");
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4281
// Size: 0x2c
function helperdrone_managescramblerplayerbuff(buffent) {
    waittill_any_2("death_or_disconnect", "scramble_off" + buffent getentitynumber());
    helperdrone_setscramblerplayerbuffs(0, buffent);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x42b5
// Size: 0x166
function helperdrone_setscramblerjammed(jam, jammerent, skipteamcheck, var_699323575339379a) {
    var_682bf17fa458886c = self;
    if (istrue(jam)) {
        var_682bf17fa458886c.scrambledby = default_to(var_682bf17fa458886c.scrambledby, []);
        var_682bf17fa458886c.scrambledby = function_6d6af8144a5131f1(var_682bf17fa458886c.scrambledby, jammerent);
        if (!array_contains(jammerent.var_88f72d2c0421f8b1, var_682bf17fa458886c)) {
            jammerent.var_88f72d2c0421f8b1[jammerent.var_88f72d2c0421f8b1.size] = var_682bf17fa458886c;
        }
        var_682bf17fa458886c thread helperdrone_managescramblereffect(jammerent, skipteamcheck, var_699323575339379a);
        var_682bf17fa458886c thread helperdrone_watchscramblestrength(jammerent, var_699323575339379a);
        return;
    }
    if (isdefined(jammerent) && isdefined(var_682bf17fa458886c) && isdefined(var_682bf17fa458886c.scrambledby)) {
        if (array_contains(var_682bf17fa458886c.scrambledby, jammerent)) {
            var_682bf17fa458886c.scrambledby = array_remove(var_682bf17fa458886c.scrambledby, jammerent);
            if (isdefined(jammerent.var_ef42676d437ab065)) {
                scramblerstrength = jammerent.var_ef42676d437ab065[self getentitynumber()];
                if (isdefined(scramblerstrength)) {
                    jammerent.var_ef42676d437ab065[self getentitynumber()] = undefined;
                    var_682bf17fa458886c scripts\cp_mp\emp_debuff::stop_scramble(scramblerstrength, var_699323575339379a);
                    jammerent.var_ef42676d437ab065[var_682bf17fa458886c getentitynumber()] = undefined;
                }
            }
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4423
// Size: 0xb2
function helperdrone_managescramblereffect(jammerent, skipteamcheck, var_699323575339379a) {
    level endon("game_ended");
    waittill_any_2("death", "scramble_off" + jammerent getentitynumber());
    if (isdefined(self)) {
        helperdrone_setscramblerjammed(0, jammerent, skipteamcheck, var_699323575339379a);
        if (isdefined(jammerent) && isdefined(jammerent.var_88f72d2c0421f8b1)) {
            jammerent.var_88f72d2c0421f8b1 = array_remove(jammerent.var_88f72d2c0421f8b1, self);
        }
        return;
    }
    if (isdefined(jammerent) && isdefined(jammerent.var_88f72d2c0421f8b1)) {
        jammerent.var_88f72d2c0421f8b1 = array_removeundefined(jammerent.var_88f72d2c0421f8b1);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44dd
// Size: 0x5d
function helperdrone_watchremotescrambledent(jammerent, skipteamcheck) {
    jammerent endon("death");
    level endon("game_ended");
    self waittill("death");
    if (isdefined(self.owner)) {
        if (self.owner helperdrone_entaffectedbyscramble(jammerent, skipteamcheck)) {
            self.owner helperdrone_setscramblerjammed(0, jammerent, skipteamcheck);
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4542
// Size: 0x1b0
function helperdrone_watchscramblestrength(jammerent, var_699323575339379a) {
    self endon("death");
    self endon("scramble_off" + self getentitynumber());
    self endon("disconnect");
    jammerent endon("death");
    jammerent.var_ef42676d437ab065 = default_to(jammerent.var_ef42676d437ab065, []);
    previousstrength = 0;
    scramblerstrength = 0;
    scramblerradius = getdvarfloat(@"hash_97a2272a19ad3843", 1000);
    if (isdefined(jammerent.var_32efb854df6d5296)) {
        scramblerradius = jammerent.var_32efb854df6d5296;
    }
    var_f3b7cc3138382dfb = scramblerradius * scramblerradius;
    while (true) {
        distancechecksq = 0;
        if (istrue(jammerent.var_ce8ef6e68df034c7)) {
            distancechecksq = distancesquared(jammerent.origin, self.origin);
        } else {
            distancechecksq = distance2dsquared(jammerent.origin, self.origin);
        }
        if (distancechecksq > var_f3b7cc3138382dfb) {
            scramblerstrength = 0;
        } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.8) {
            scramblerstrength = 1;
        } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.6) {
            scramblerstrength = 2;
        } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.4) {
            scramblerstrength = 3;
        } else if (distancechecksq >= var_f3b7cc3138382dfb * 0.2) {
            scramblerstrength = 4;
        } else {
            scramblerstrength = 5;
        }
        var_4893b9a18cf47d6c = scramblerstrength != previousstrength;
        if (previousstrength == 0 || var_4893b9a18cf47d6c) {
            jammerent.var_ef42676d437ab065[self getentitynumber()] = scramblerstrength;
            scripts\cp_mp\emp_debuff::stop_scramble(previousstrength, var_699323575339379a);
            scripts\cp_mp\emp_debuff::play_scramble(scramblerstrength, var_699323575339379a);
            previousstrength = scramblerstrength;
        }
        waitframe();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46fa
// Size: 0x1b5
function helperdrone_entaffectedbyscramble(scramblerent, skipteamcheck) {
    scrambled = 0;
    var_be77424d6ef051c = undefined;
    if (isdefined(level.supportdrones) && level.supportdrones.size > 0) {
        foreach (drone in level.supportdrones) {
            if (drone.helperdronetype != "scrambler_drone_guard") {
                continue;
            }
            if (level.teambased) {
                if (!isdefined(skipteamcheck) && drone.team == self.team) {
                    var_be77424d6ef051c = drone.friendliesaffectedbyscrambler;
                } else {
                    var_be77424d6ef051c = drone.var_88f72d2c0421f8b1;
                }
            } else if (!isdefined(skipteamcheck) && drone.owner == self) {
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48b8
// Size: 0xc2
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4982
// Size: 0x1e
function helperdrone_disableradar() {
    if (isdefined(self.radar)) {
        self.radar delete();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x49a8
// Size: 0xc1
function helperdrone_spawnnewscrambler(scramblersize, spawnoverridepos, link) {
    scrambler = spawn("script_model", self.origin);
    scrambler.team = self.owner.team;
    if (isdefined(self.streakinfo) && isdefined(self.streakinfo.abilityrange)) {
        var_8ec43e4243c37e70 = int(self.streakinfo.abilityrange);
    } else {
        var_8ec43e4243c37e70 = 0;
    }
    scrambler makescrambler(self.owner, scramblersize, var_8ec43e4243c37e70);
    scrambler linkto(self);
    return scrambler;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a72
// Size: 0x46
function helperdrone_moving_platform_death(data) {
    if (!isdefined(data.lasttouchedplatform.destroydroneoncollision) || data.lasttouchedplatform.destroydroneoncollision) {
        self notify("death");
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac0
// Size: 0x47
function helperdrone_play_lightfx() {
    settings = level.helperdronesettings[self.helperdronetype];
    if (isent(self)) {
        if (isdefined(settings.playfxcallback)) {
            self [[ settings.playfxcallback ]]();
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b0f
// Size: 0x92
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba9
// Size: 0x1e2
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
            if (scripts\cp_mp\utility\game_utility::isbrstylegametype() || iscp()) {
                helperdrone thread helperdrone_watchaltitude(self);
            }
        }
        if (issharedfuncdefined("game", "registerEntForOOB")) {
            [[ getsharedfunc("game", "registerEntForOOB") ]](helperdrone, "killstreak");
        }
        helperdrone thread scripts\cp_mp\killstreaks\helper_drone::function_b25ced7f149be057();
    }
    helperdrone thread [[ config.primarymodefunc ]](config);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d93
// Size: 0xde
function helperdrone_followplayer(offsetoverride) {
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
    while (true) {
        currentstance = self.owner getstance();
        if (!isdefined(self.last_owner_stance) || currentstance != self.last_owner_stance || istrue(self.stoppedatlocation)) {
            if (istrue(self.stoppedatlocation)) {
                self.stoppedatlocation = undefined;
            }
            self.last_owner_stance = currentstance;
            helperdrone_movetoplayer(self.owner, offsetoverride);
        }
        wait 0.5;
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e79
// Size: 0x206
function helperdrone_overwatchplayer() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    if (issharedfuncdefined("player", "showMiniMap")) {
        self.owner [[ getsharedfunc("player", "showMiniMap") ]]();
    }
    self.owner.showuavminimaponspawn = 1;
    self.owner thread helperdrone_showminimaponspawn(self);
    introspeed = 1;
    self vehicle_setspeed(200, 50, 10);
    while (true) {
        obstructiontrace = undefined;
        if (istrue(introspeed)) {
            currentpos = self.origin;
            initialgoalpos = self.owner.origin * (1, 1, 0) + (0, 0, self.origin[2]);
            obstructiontrace = ray_trace(currentpos, initialgoalpos, self);
        }
        xpos = self.owner.origin[0];
        ypos = self.owner.origin[1];
        if (isdefined(obstructiontrace)) {
            if (obstructiontrace["hittype"] != "hittype_none") {
                xpos = obstructiontrace["position"][0];
                ypos = obstructiontrace["position"][1];
            }
        }
        properz = getcorrectheight(xpos, ypos, 20);
        newgoal = (xpos, ypos, properz);
        self setlookatent(self.owner);
        self setvehgoalpos(newgoal, 1);
        waittill_any_2("goal", "begin_evasive_maneuvers");
        if (istrue(introspeed)) {
            introspeed = undefined;
            self vehicle_setspeed(level.helperdronesettings[self.helperdronetype].speed, 10, 10);
        }
        self clearlookatent();
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.1);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5087
// Size: 0x78
function getcorrectheight(x, y, rand) {
    var_dc8bb6300463cf1e = 1500;
    /#
        var_13c46a6715142436 = getdvarint(@"hash_166b0ad3d56b43f", 0);
        var_dc8bb6300463cf1e += var_13c46a6715142436;
    #/
    groundheight = tracegroundpoint(x, y);
    trueheight = groundheight + var_dc8bb6300463cf1e;
    trueheight += randomint(rand);
    return trueheight;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5108
// Size: 0xc0
function tracegroundpoint(x, y) {
    self endon("death");
    self endon("leaving");
    z = -99999;
    currz = self.origin[2] + 2000;
    minz = level.averagealliesz;
    ignorelist = [self];
    trc = sphere_trace((x, y, currz), (x, y, z), 256, ignorelist, undefined, 1);
    if (trc["position"][2] < minz) {
        hightrace = minz;
    } else {
        hightrace = trc["position"][2];
    }
    return hightrace;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51d1
// Size: 0x1a5
function helperdrone_pingnearbyenemies() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    pingsize = 300;
    radarrange = 1200;
    if (islargemap()) {
        pingsize = 1000;
        radarrange = 2500;
    }
    self.pingedenemies = [];
    while (true) {
        nearplayers = utility::playersinsphere(self.owner.origin, radarrange);
        foreach (player in nearplayers) {
            if (player == self.owner) {
                continue;
            }
            if (level.teambased && player.team == self.owner.team) {
                continue;
            }
            if (issharedfuncdefined("player", "isReallyAlive")) {
                if (![[ getsharedfunc("player", "isReallyAlive") ]](player)) {
                    continue;
                }
            }
            if (player helperdrone_isbeingpingedbydrone(self)) {
                continue;
            }
            if (issharedfuncdefined("perk", "hasPerk")) {
                if (player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_ghost")) {
                    continue;
                }
            }
            triggerportableradarping(player.origin, self.owner, pingsize, 3000);
            thread helperdrone_watchpingedstatus(player, self.owner);
        }
        waitframe();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x537e
// Size: 0x78
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53fe
// Size: 0x76
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x547d
// Size: 0x98
function helperdrone_getheightoffset(config) {
    heightoffset = config.standupoffset;
    owner_stance = self.owner getstance();
    switch (owner_stance) {
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x551e
// Size: 0x12d
function helperdrone_guardlocation() {
    self.stoppedatlocation = 1;
    newzoffset = int(self.origin[2] * 0.65);
    var_1becbc015340bf8d = self.mappointinfo[0].location + (0, 0, newzoffset);
    dronetrace = sphere_trace(self.origin, var_1becbc015340bf8d, 200, self);
    if (isdefined(dronetrace)) {
        if (isdefined(dronetrace["entity"])) {
            var_1becbc015340bf8d = dronetrace["entity"].origin + (0, 0, randomintrange(100, 200));
            if (isdefined(dronetrace["entity"].guardlocation)) {
                var_1becbc015340bf8d = dronetrace["entity"].guardlocation + (0, 0, randomintrange(100, 200));
            }
        } else if (isdefined(dronetrace["hittype"]) && isdefined(dronetrace["position"]) && dronetrace["hittype"] != "hittype_none") {
            var_1becbc015340bf8d = dronetrace["position"] + (0, 0, randomintrange(300, 500));
        }
    }
    thread helperdrone_moveintoplace(var_1becbc015340bf8d);
    self.guardlocation = var_1becbc015340bf8d;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5653
// Size: 0x10c
function helperdrone_moveintoplace(var_1becbc015340bf8d) {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("rotors", "on", 0);
    self playloopsound("veh_scrambler_drone_idle_high");
    self moveto(var_1becbc015340bf8d - (0, 0, 20), 3, 2, 1);
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(3.2);
    self moveto(var_1becbc015340bf8d, 1, 0.5, 0.5);
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(1.2);
    while (true) {
        var_803270b249d3fe99 = randomintrange(-35, 35);
        var_5fe85daeec942414 = randomintrange(-15, 15);
        randomx = var_1becbc015340bf8d[0] + var_803270b249d3fe99;
        randomy = var_1becbc015340bf8d[1] + var_803270b249d3fe99;
        randomz = var_1becbc015340bf8d[2] + var_5fe85daeec942414;
        var_7cd652e507bf980 = (randomx, randomy, randomz);
        self moveto(var_7cd652e507bf980, 3, 2, 1);
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(3.2);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5767
// Size: 0x56
function helperdrone_watchradarpulse() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    while (true) {
        triggerportableradarping(self.origin, self.owner);
        self.owner playsound("oracle_radar_pulse_npc");
        wait 3;
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x57c5
// Size: 0x56
function helperdrone_movetoplayer(player, offsetoverride) {
    self setlookatent(player);
    targetoffset = helperdrone_gettargetoffset(self, player);
    if (isdefined(offsetoverride)) {
        targetoffset = offsetoverride;
    }
    self setdronegoalent(player, targetoffset, 16, 10);
    self.intransit = 1;
    thread helperdrone_watchforgoal();
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5823
// Size: 0x2bc
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
    while (true) {
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
            timeused += updaterate;
            if (timeused > 0.1) {
                self notify("switch_modes");
                newmode = getothermode(self.combatmode, self.streakinfo);
                newstring = "Empty String";
                assertex(isdefined(config.primarymode) && isdefined(config.secondarymode), "Switching modes requires that the drone has a primary and secondary settings in its config");
                if (newmode == config.primarymode) {
                    result = [[ config.primarymodefunc ]](config);
                    newstring = config.secondarymodestring;
                } else {
                    result = [[ config.secondarymodefunc ]](config);
                    newstring = config.primarymodestring;
                }
                if (!istrue(result)) {
                    return;
                }
                self.combatmode = newmode;
                self.currentstring = newstring;
                self.useobj makeunusable();
                scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(1);
                if (issharedfuncdefined("killstreak", "setKillstreakControlPriority")) {
                    self.useobj [[ getsharedfunc("killstreak", "setKillstreakControlPriority") ]](self.owner, self.currentstring, 360, 360, 30000, 30000, 3);
                }
                break;
            }
            wait updaterate;
        }
        wait updaterate;
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ae7
// Size: 0x5f
function getothermode(mode, streakinfo) {
    config = level.helperdronesettings[self.helperdronetype];
    if (mode == config.primarymode) {
        mode = config.secondarymode;
    } else {
        mode = config.primarymode;
    }
    return mode;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b4f
// Size: 0xb7
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
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0f
// Size: 0xcb
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
        timepercent = (timeoutduration - timeelapsed) / timeoutduration;
        timepercent = int(ceil(clamp(timepercent, 0, 1) * 100));
        if (istrue(self.ispiloted)) {
            self.owner setclientomnvar("ui_killstreak_countdown", timepercent);
        }
        timeelapsed += level.framedurationseconds;
        waitframe();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ce2
// Size: 0x1c
function helperdrone_lockedoncallback() {
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning("missileLocking", self.owner, "killstreak");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d06
// Size: 0x1c
function helperdrone_lockedonremovedcallback() {
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning("missileLocking", self.owner, "killstreak");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d2a
// Size: 0x24
function setoverwatchmodesettings(config) {
    thread helperdrone_overwatchplayer();
    thread helperdrone_pingnearbyenemies();
    helperdrone_handleteamvisibility();
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d57
// Size: 0x15
function setfollowmode(config) {
    thread helperdrone_followplayer();
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d75
// Size: 0x4e
function setguardmode(config) {
    if (isent(self)) {
        helperdrone_guardlocation();
        helperdrone_handleteamvisibility();
        function_1532eae4fc92c4d3();
        self scriptmodelplayanim(level.scr_anim["scrambler_drone_guard"]["rotor_spin"]);
    }
    scramblerdrone_counteruavmodeon();
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dcc
// Size: 0x26
function function_1532eae4fc92c4d3() {
    self setscriptablepartstate("looping_wave", "on", 0);
    self setscriptablepartstate("scramble_sfx", "on", 0);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5dfa
// Size: 0x16
function setdeliverymodesettings(config) {
    thread helperdrone_deliver(config);
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e19
// Size: 0x1f3
function helperdrone_deliver(config) {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    self setneargoalnotifydist(10);
    speed = level.helperdronesettings[self.helperdronetype].speed;
    accel = level.helperdronesettings[self.helperdronetype].accel;
    self vehicle_setspeed(speed, accel, accel);
    abovepos = self.deliverytarget + (0, 0, 4000);
    startpos = self.deliverytarget + (0, 0, 2500);
    endpos = self.deliverytarget + (0, 0, 100);
    halfsize = level.helperdronesettings[self.helperdronetype].halfsize;
    ignoreents = [];
    ignoreents[0] = self;
    contentoverride = scripts\engine\trace::create_contents(1, 1, 1, 1);
    traceresult = scripts\engine\trace::sphere_trace(startpos, endpos, halfsize, ignoreents, contentoverride, 0);
    droppos = traceresult["shape_position"] + (0, 0, 100);
    self setvehgoalpos(droppos, 1);
    self waittill("goal");
    wait 0.5;
    [[ self.ondelivercallback ]]();
    self vehicle_setspeedimmediate(2);
    self vehicle_setspeed(0.1, 1, 1);
    wait 0.5;
    self vehicle_setspeed(speed, accel, accel);
    self setvehgoalpos(abovepos, 0);
    self waittill("goal");
    function_608250000fbfc89a(self.helperdronetype, config, 0);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6014
// Size: 0xd6
function helperdrone_watchearlyexit(config, var_72c27359aaac97f4) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("explode");
    while (true) {
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
        if (isdefined(config.exitfunc)) {
            self notify("drone_exit");
            self [[ config.exitfunc ]]();
            continue;
        }
        helperdrone_leave();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60f2
// Size: 0x6b
function function_1d24e8f818e18244() {
    level endon("game_ended");
    droneowner = self.owner;
    droneowner endon("disconnect");
    var_b2d2806c761e0c98 = 1;
    /#
        cammode = getdvarint(@"hash_b23e7bb60bbe76a6", 0);
        if (cammode) {
            var_b2d2806c761e0c98 = 0;
        }
    #/
    if (istrue(var_b2d2806c761e0c98)) {
        droneowner function_6a275656141ac8d6(self);
    }
    thread helperdrone_handlethermalswitchinternal();
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6165
// Size: 0x106
function helperdrone_handlethermalswitchinternal() {
    droneowner = self.owner;
    droneowner endon("disconnect");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    self.isthermalenabled = 0;
    thermalvisionset = function_44e0bd95b98288ab();
    if (isnightmap()) {
        self.isthermalenabled = 1;
        droneowner killstreak_setMainVision(thermalvisionset);
        droneowner setthermalvision(1, 12, 1000);
    }
    while (true) {
        droneowner waittill("switch_thermal_mode");
        if (!istrue(self.ispiloted)) {
            continue;
        }
        if (self.isthermalenabled) {
            self.isthermalenabled = 0;
            droneowner setthermalvision(0);
            droneowner function_6a275656141ac8d6(self);
            droneowner playlocalsound("weap_thermal_toggle_click");
            continue;
        }
        self.isthermalenabled = 1;
        droneowner killstreak_setMainVision(thermalvisionset);
        droneowner setthermalvision(1, 12, 1000);
        droneowner playlocalsound("weap_thermal_toggle_click");
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6273
// Size: 0x81
function function_6a275656141ac8d6(drone) {
    var_143ba8c547269a07 = level.helperdronesettings[drone.helperdronetype];
    if (level.mapname == "mp_hideout") {
        killstreak_setMainVision(var_143ba8c547269a07.var_2215fa459d8250c0);
    }
    if (isdefined(level.var_6d129920246627ba)) {
        killstreak_setMainVision(level.var_6d129920246627ba);
        return;
    }
    killstreak_setMainVision(var_143ba8c547269a07.colorvision);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62fc
// Size: 0x127
function helperdrone_monitorcollision(config) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    while (true) {
        ent = self waittill("touch");
        if (!isdefined(ent)) {
            continue;
        }
        vehicle = undefined;
        if (ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            vehicle = ent;
        } else if (ent scripts\cp_mp\utility\player_utility::isinvehicle()) {
            vehicle = ent.vehicle;
        }
        if (!isdefined(vehicle)) {
            continue;
        }
        attacker = undefined;
        inflictor = undefined;
        if (istrue(playersareenemies(self.owner, vehicle.owner))) {
            currentvehicle = vehicle.owner scripts\cp_mp\utility\player_utility::getvehicle();
            if (isdefined(currentvehicle) && currentvehicle == vehicle) {
                attacker = vehicle.owner;
                inflictor = vehicle;
            }
        }
        self dodamage(self.maxhealth, vehicle.origin, attacker, inflictor, "MOD_CRUSH");
        break;
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x642b
// Size: 0x14a
function function_109f8639aebf2da9(config) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("drop");
    watercontents = ["physicscontents_water"];
    contentoverride = physics_createcontents(watercontents);
    self.inwater = 0;
    while (true) {
        hitwater = physics_querypoint(self.origin, 0, contentoverride, self, "physicsquery_any");
        if (istrue(hitwater) && !istrue(self.inwater)) {
            self.inwater = 1;
            attacker = self.owner;
            inflictor = self;
            self dodamage(10000, self.origin, attacker, inflictor, "MOD_CRUSH");
            break;
        } else if (!istrue(hitwater) && istrue(self.inwater)) {
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x657d
// Size: 0x86
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x660b
// Size: 0x370
function helperdrone_watchdamage(var_292694740d43f466) {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self.owner endon("disconnect");
    self endon("owner_gone");
    self.health = 2147483647;
    config = level.helperdronesettings[self.helperdronetype];
    while (true) {
        amount, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self waittill("damage");
        debugdamage = undefined;
        /#
            debugdamage = istrue(self.debugdamage);
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
            if (istrue(debugdamage)) {
            } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
                amount = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, meansofdeath, amount, config.maxhealth, 1, 1, 1);
            }
        }
        self.currenthealth -= amount;
        killstreak_updateDamageState(self.currenthealth);
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
                skipdeathnotify = 1;
                if (isdefined(objweapon)) {
                    if (scripts\engine\utility::issharedfuncdefined("damage", "onKillstreakKilled")) {
                        var_3737240cefe2c793 = self [[ scripts\engine\utility::getsharedfunc("damage", "onKillstreakKilled") ]](self.helperdronetype, attacker, objweapon, damagetype, damage, config.scorepop, config.vodestroyed, config.destroyedsplash, skipdeathnotify);
                    }
                }
                thread function_6edfda4764129e3(1);
            }
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6983
// Size: 0x10e
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
        wait self.timeout;
    }
    if (istrue(config.voontimeout)) {
        if (self.helperdronetype == "radar_drone_recon") {
            function_8959c1606f65e65(self.streakinfo.streakname, self.streakinfo.streakname + "_timeout");
        } else {
            playkillstreakoperatordialog(self.streakinfo.streakname, self.streakinfo.streakname + "_timeout", 1);
        }
    }
    thread helperdrone_leave(1);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a99
// Size: 0x59
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
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6afa
// Size: 0x27
function helperdrone_watchownerstatus(notifymsg) {
    self.owner waittill(notifymsg);
    self notify("owner_gone");
    thread helperdrone_leave();
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b29
// Size: 0x51
function helperdrone_watchownerdeath() {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("owner_gone");
    while (true) {
        self.owner waittill_any_2("death", "last_stand_start");
        if (function_7ac8fccbfd39d8b9()) {
            thread helperdrone_leave();
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b82
// Size: 0x9e
function function_7ac8fccbfd39d8b9() {
    config = level.helperdronesettings[self.helperdronetype];
    if (istrue(config.diewithowner)) {
        return true;
    }
    if (issharedfuncdefined("game", "getGametypeNumLives")) {
        gametypenumlives = [[ getsharedfunc("game", "getGametypeNumLives") ]]();
        if (isdefined(gametypenumlives) && gametypenumlives > 0 && self.owner.pers["deaths"] >= gametypenumlives) {
            if (!istrue(self.ispiloted)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c29
// Size: 0x53
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c84
// Size: 0x154
function helperdrone_leave(timeout) {
    self endon("death");
    self endon("explode");
    self endon("drop");
    config = level.helperdronesettings[self.helperdronetype];
    if (isdefined(config.leavefunc)) {
        self thread [[ config.leavefunc ]](timeout);
        return;
    }
    if (self.helperdronetype == "radar_drone_overwatch") {
        self clearlookatent();
        self setmaxpitchroll(0, 0);
        self notify("leaving");
        self vehicle_setspeed(50, 25);
        pathgoal = self.origin + anglestoforward((0, randomint(360), 0)) * 500;
        pathgoal += (0, 0, 1000);
        self setvehgoalpos(pathgoal, 1);
        self setneargoalnotifydist(100);
        self waittill("near_goal");
        pathend = helperdrone_getpathend();
        self vehicle_setspeed(150, 50);
        self setvehgoalpos(pathend, 1);
        self waittill("goal");
        self notify("gone");
        function_608250000fbfc89a(self.helperdronetype, level.helperdronesettings[self.helperdronetype], 0);
        return;
    }
    thread function_6edfda4764129e3(0, 1, timeout);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6de0
// Size: 0x61
function helperdrone_getpathend() {
    pathrandomness = 150;
    halfdistance = 15000;
    yaw = self.angles[1];
    direction = (0, yaw, 0);
    endpoint = self.origin + anglestoforward(direction) * halfdistance;
    return endpoint;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e4a
// Size: 0x116
function perkengineer_manageminimap() {
    enemyicon = "hud_icon_minimap_killstreak_cuav";
    createfunc = undefined;
    if (scripts\engine\utility::issharedfuncdefined("game", "createObjectiveEngineer")) {
        createfunc = scripts\engine\utility::getsharedfunc("game", "createObjectiveEngineer");
    }
    if (isdefined(createfunc)) {
        self.enemyobjid = self [[ createfunc ]](enemyicon, 1, 1);
    }
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        if (issharedfuncdefined("perk", "hasPerk")) {
            if (player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_engineer") && player.team != self.team) {
                if (self.enemyobjid != -1) {
                    scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.enemyobjid, player);
                }
            }
        }
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f68
// Size: 0x100
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
    self.currenthealth -= damage;
    killstreak_updateDamageState(self.currenthealth);
    return true;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7071
// Size: 0xf6
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
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(duration);
    stopfxontag(getfx("emp_stun"), self, "tag_origin");
    self.stunned = 0;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x716f
// Size: 0x312
function function_7017058e21ac030f(data) {
    self.isdestroyed = 1;
    self.var_d31453e33d3e34ca = 1;
    config = level.helperdronesettings[self.helperdronetype];
    if (istrue(self.repeatuse)) {
        self.repeatuse = 0;
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
    contents = scripts\engine\trace::create_contents(0, 1, 1, 0, 0, 1, 0, 0, 0);
    castend = self.origin + anglestoup(self.angles) * var_ecb39c9eecbd70ad * -1 + (randomintrange(-500, 500), 0, randomintrange(-500, 500));
    trace = ray_trace(self.origin, castend, [self]);
    target_origin = trace["position"] + trace["normal"] * 5;
    maxvelocity = getdvarfloat(@"hash_44e62153228221f", 30.2);
    acceleration = getdvarfloat(@"hash_cdb03278c6d17e78", 13.8);
    deceleration = getdvarfloat(@"hash_ed85baf3072c3fff", 17.2);
    var_f9ca3f557a387549 = getdvarfloat(@"hash_3f6d20d42a18063b", 2500);
    distance = distance(target_origin, self.origin);
    falltime = sqrt(2 * distance / acceleration);
    falltime = min(falltime, 2) - 0.2;
    self vehicle_setspeed(maxvelocity, acceleration, deceleration);
    self setvehgoalpos(target_origin, 0);
    thread function_9bfdff1ee5a47652();
    time = 0;
    while (true) {
        if (distancesquared(self.origin, target_origin) <= var_f9ca3f557a387549 || time >= falltime) {
            function_566780fd588dd54a(data);
            break;
        }
        time += level.framedurationseconds;
        waitframe();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7489
// Size: 0x85
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7516
// Size: 0x69
function function_9bfdff1ee5a47652() {
    level endon("game_ended");
    self endon("explode");
    self endon("drop");
    self setmaxpitchroll(60, 90);
    self setyawspeed(1000, 500, 500);
    while (true) {
        randyaw = randomintrange(140, 170);
        self settargetyaw(self.angles[1] + randyaw);
        wait 0.25;
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7587
// Size: 0xa4
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7634
// Size: 0x13
function function_f6914d06b20aee20() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x764f
// Size: 0x13
function function_3ad98c4f7524b525() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x766a
// Size: 0x13
function function_e68a206899cafbe5() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7685
// Size: 0xe3
function function_cc7fd8dc48c88e9e(cameraorigin) {
    tag_origin = spawn("script_model", cameraorigin);
    tag_origin setmodel("tag_origin");
    direction = vectornormalize(self.origin - tag_origin.origin);
    right = vectorcross(direction, (0, 0, 1));
    up = vectorcross(right, direction);
    lookrotation = axistoangles(direction, right, up);
    tag_origin rotateto(lookrotation, 0.01);
    self.owner cameraunlink();
    self.owner setplayerangles(tag_origin.angles);
    self.owner cameralinkto(tag_origin, "tag_origin", 0, 1);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7770
// Size: 0x24
function function_886c327598c568db(traceresult) {
    return isdefined(traceresult["hittype"]) && traceresult["hittype"] != "hittype_none";
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x779d
// Size: 0xdd
function function_e3f077b1c512f372(testangles, isback, upangles) {
    traceorigin = self gettagorigin("tag_undercam") - (0, 0, 15);
    if (istrue(isback)) {
        testangles *= -1;
    }
    originforward = anglestoforward(testangles + (15, 0, 0));
    if (!isdefined(upangles)) {
        traceresult = scripts\engine\trace::ray_trace(traceorigin + originforward, traceorigin + testangles, self);
        thread scripts\cp_mp\utility\debug_utility::drawline(traceorigin + originforward, traceorigin + testangles, 2.5, (1, 0, 0));
    } else {
        traceresult = scripts\engine\trace::ray_trace(traceorigin + testangles, traceorigin + testangles + upangles, self);
        thread scripts\cp_mp\utility\debug_utility::drawline(traceorigin + testangles, traceorigin + testangles + upangles, 2.5, (1, 0, 0));
    }
    return traceresult;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7883
// Size: 0xa9
function function_8c9a4bc6b72b3356(traceangles, isback) {
    traceorigin = self gettagorigin("tag_undercam") - (0, 0, 15);
    traceupangles = anglestoup(self.angles) * 125;
    testtrace = function_e3f077b1c512f372(traceangles, isback);
    if (!function_886c327598c568db(testtrace)) {
        var_4de4971a7752cad = function_e3f077b1c512f372(traceangles, isback, traceupangles);
        if (!function_886c327598c568db(var_4de4971a7752cad)) {
            if (istrue(isback)) {
                traceangles *= -1;
            }
            function_cc7fd8dc48c88e9e(traceorigin + traceangles + traceupangles);
            return true;
        }
    }
    return false;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7935
// Size: 0x91
function function_229259da45e71937() {
    traceorigin = self gettagorigin("tag_undercam") - (0, 0, 15);
    traceupangles = anglestoup(self.angles) * 125 * 3;
    traceresult = scripts\engine\trace::ray_trace(traceorigin, traceorigin + traceupangles, self);
    thread scripts\cp_mp\utility\debug_utility::drawline(traceorigin, traceorigin + traceupangles, 2.5, (1, 0, 0));
    if (!function_886c327598c568db(traceresult)) {
        function_cc7fd8dc48c88e9e(traceorigin + traceupangles);
        return true;
    }
    return false;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79cf
// Size: 0xaa
function function_901f4a4041610043() {
    var_881a65df3a7787df = anglestoforward(self.angles) * 350;
    var_4fa29d6999cafd60 = anglestoright(self.angles) * 350;
    var_665c16bc6a6ac86f = anglestoleft(self.angles) * 350;
    if (function_8c9a4bc6b72b3356(var_881a65df3a7787df, 1)) {
        return true;
    }
    if (function_8c9a4bc6b72b3356(var_881a65df3a7787df)) {
        return true;
    }
    if (function_8c9a4bc6b72b3356(var_4fa29d6999cafd60)) {
        return true;
    }
    if (function_8c9a4bc6b72b3356(var_665c16bc6a6ac86f)) {
        return true;
    }
    if (function_229259da45e71937()) {
        return true;
    }
    /#
        announcement("<dev string:x65>");
    #/
    return false;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7a82
// Size: 0x3ee
function function_6edfda4764129e3(wasdestroyed, wasexited, wastimedout, wasdetonated) {
    self.owner stopwatchingthermalinputchange();
    self.isdestroyed = 1;
    config = level.helperdronesettings[self.helperdronetype];
    if (!istrue(wasexited) && !istrue(wasdetonated)) {
        if (self.helperdronetype == "radar_drone_recon") {
            function_8959c1606f65e65(self.helperdronetype, self.helperdronetype + "_destroyed");
        } else {
            playkillstreakoperatordialog(self.helperdronetype, self.helperdronetype + "_destroyed", 1);
        }
    }
    if (isdefined(self.targetmarkergroup)) {
        scripts\cp_mp\targetmarkergroups::targetmarkergroup_off(self.targetmarkergroup);
        self.targetmarkergroup = undefined;
    }
    if (isdefined(self.minimapid)) {
        scripts\mp\objidpoolmanager::returnobjectiveid(self.minimapid);
        self.minimapid = undefined;
    }
    helperdrone_endscramblereffect();
    if (function_ccf98e6391dd38b9() && self.helperdronetype == "assault_drone") {
        thirdperson = function_901f4a4041610043();
    } else {
        thirdperson = 0;
    }
    if (isdefined(config.explodefunc) && !istrue(self.dropdrone)) {
        self [[ config.explodefunc ]](config, wasdestroyed, wasexited, wastimedout, wasdetonated, thirdperson);
    } else {
        function_24085a0230958938();
    }
    scripts\cp_mp\emp_debuff::allow_emp(0);
    self notify("explode");
    if (isdefined(self.streakinfo.superref)) {
        if (issharedfuncdefined("challenges", "onFieldUpgradeEnd")) {
            self.owner [[ getsharedfunc("challenges", "onFieldUpgradeEnd") ]](self.streakinfo.superref, self.usedcount);
        }
    }
    if (isdefined(self.streakinfo.superid)) {
        if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
            [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.streakinfo.superid, self.usedcount, istrue(wasdestroyed));
        }
    }
    owner = self.owner;
    if (isdefined(owner)) {
        if (isdefined(owner.super) && owner.super.isinuse) {
            if (isdefined(self.streakinfo.superref) && self.streakinfo.superref == owner.super.staticdata.ref) {
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
        wait 0.2;
    }
    function_608250000fbfc89a(self.helperdronetype, level.helperdronesettings[self.helperdronetype], wasdestroyed);
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() && isdefined(owner) && issharedfuncdefined("br", "superSlotCleanUp")) {
        [[ getsharedfunc("br", "superSlotCleanUp") ]](owner);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e78
// Size: 0xb8
function function_ffbc19e1aef5943c(ison) {
    if (ison) {
        scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_showwarning("DDoSed", self.owner, self.vehiclename);
        self.owner scripts\cp_mp\emp_debuff::play_emp_scramble(4);
        self.owner _freezecontrols(1);
        self.owner _freezelookcontrols(1);
        return;
    }
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_hidewarning("DDoSed", self.owner, self.vehiclename);
    self.owner scripts\cp_mp\emp_debuff::stop_emp_scramble(4);
    self.owner _freezecontrols(0);
    self.owner _freezelookcontrols(0);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7f38
// Size: 0x36e
function function_dd2172321d232563(wasdestroyed, wasexited, timedout) {
    dronehealth = self.currenthealth;
    dronevel = undefined;
    if (self.ispiloted) {
        dronevel = self getentityvelocity();
    }
    config = level.helperdronesettings[self.helperdronetype];
    if (isdefined(self.targetmarkergroup)) {
        scripts\cp_mp\targetmarkergroups::targetmarkergroup_off(self.targetmarkergroup);
        self.targetmarkergroup = undefined;
    }
    if (isdefined(self.minimapid)) {
        scripts\mp\objidpoolmanager::returnobjectiveid(self.minimapid);
        self.minimapid = undefined;
    }
    helperdrone_endscramblereffect();
    if (isdefined(config.dropfunc) && istrue(self.dropdrone)) {
        self [[ config.dropfunc ]](config, wasdestroyed, wasexited, timedout);
    } else {
        function_24085a0230958938();
    }
    scripts\cp_mp\emp_debuff::allow_emp(0);
    self notify("drop");
    if (isdefined(self.streakinfo.superref)) {
        if (issharedfuncdefined("challenges", "onFieldUpgradeEnd")) {
            self.owner [[ getsharedfunc("challenges", "onFieldUpgradeEnd") ]](self.streakinfo.superref, self.usedcount);
        }
    }
    if (isdefined(self.streakinfo.superid)) {
        if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
            [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.streakinfo.superid, self.usedcount, istrue(wasdestroyed));
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
        wait 0.2;
    }
    owner = self.owner;
    if (isdefined(owner.super) && owner.super.isinuse) {
        if (isdefined(self.streakinfo.superref) && self.streakinfo.superref == owner.super.staticdata.ref) {
            if (issharedfuncdefined("supers", "superUseFinished")) {
                self.owner thread [[ getsharedfunc("supers", "superUseFinished") ]](0);
            }
        }
    }
    function_608250000fbfc89a(self.helperdronetype, level.helperdronesettings[self.helperdronetype], wasdestroyed, dronevel, dronehealth);
    if (level.gametype != "br" && isdefined(owner) && issharedfuncdefined("br", "superSlotCleanUp")) {
        [[ getsharedfunc("br", "superSlotCleanUp") ]](owner);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82ae
// Size: 0x50
function function_9fe87b841a44448f() {
    if (isent(self)) {
        explodestate = "on";
        if (istrue(self.inwater)) {
            if (self getscriptableparthasstate("explode", "water")) {
                explodestate = "water";
            }
        }
        self setscriptablepartstate("explode", explodestate, 0);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8306
// Size: 0x50
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x835e
// Size: 0x1d
function function_1a4f935ba283ab0f() {
    if (isent(self)) {
        self setscriptablepartstate("drop", "on", 0);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8383
// Size: 0x35b
function function_608250000fbfc89a(dronetype, config, wasdestroyed, dronevel, dronehealth) {
    helperdrone_disableradar();
    self.ispiloted = undefined;
    self.repeatuse = undefined;
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
        scripts\mp\objidpoolmanager::returnobjectiveid(self.enemyobjid);
    }
    if (isdefined(self.pulsedarts) && self.pulsedarts.size > 0) {
        foreach (pulsedart in self.pulsedarts) {
            pulsedart notify("death");
        }
    }
    if (!istrue(self.streakinfo.issuper)) {
        level callback::callback("killstreak_finish_use", {#streakinfo:self.streakinfo});
    }
    if (isdefined(self.owner)) {
        if (isdefined(self.owner.helperdrone)) {
            self.owner.helperdrone = undefined;
        }
        if (isplayer(self.owner)) {
            self.owner clearsoundsubmix("mp_recon_drone", 1);
            self.owner notify("eng_drone_update", -1);
        } else {
            self.owner notify("drone_destroyed", wasdestroyed);
        }
        self.owner stopwatchingthermalinputchange();
        if (dronetype == "radar_drone_escort" || dronetype == "radar_drone_overwatch") {
            if (issharedfuncdefined("player", "hideMiniMap")) {
                self.owner [[ getsharedfunc("player", "hideMiniMap") ]]();
            }
        }
        self.streakinfo.expiredbydeath = istrue(wasdestroyed);
        self.owner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(self.streakinfo);
    }
    if (dronetype == "scrambler_drone_guard") {
        scramblerdrone_counteruavmodeoff();
    }
    if (istrue(self.nonvehicle)) {
        self delete();
    } else if (!wasdestroyed && istrue(self.dropdrone) && !istrue(self.dropped)) {
        if (isdefined(self.owner)) {
            droppeddrone = self.owner function_99e1189114e8419a(self.origin, self.angles, dronetype, self.streakinfo, dronevel, dronehealth);
        }
        scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(self);
    } else {
        scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(self);
    }
    if (isplayer(self.owner) && issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
        self.owner setclientomnvar("ui_killstreak_countdown", 0);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86e6
// Size: 0x4d
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x873b
// Size: 0x6e
function function_89af506d89aad6ed(state, drone) {
    assertex(0 <= state && state <= 4, "RCD Controls state must be in the range [0-4].");
    isassault = 0;
    if (isdefined(drone)) {
        isassault = drone.helperdronetype == "assault_drone";
    }
    if (state > 0 && isassault) {
        state += 2;
    }
    self setclientomnvar("ui_rcd_controls", state);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x87b1
// Size: 0x56
function function_28368a23c20ff3e6(markergroup, target, state) {
    firstbit = (state >> 0) % 2 == 1;
    secondbit = (state >> 1) % 2 == 1;
    targetmarkergroupsetentitystate(markergroup, target, firstbit);
    targetmarkergroupsetextrastate(markergroup, target, secondbit);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x880f
// Size: 0x6ed
function function_289ddd64ec5b3010(streakinfo, owner) {
    if (!isdefined(level.supportdrones)) {
        return false;
    }
    if (level.incominghelperdrones.size > 0) {
        if (issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
            if (level.incominghelperdrones.size >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
                return true;
            }
        }
        foreach (drone in level.incominghelperdrones) {
            if (isdefined(drone.owner) && drone.owner == owner) {
                continue;
            }
            if (streakinfo.streakname == "radar_drone_recon" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (isdefined(drone.owner) && isdefined(drone.owner.team) && drone.owner.team == owner.team) {
                        return true;
                    }
                }
                continue;
            }
            if (streakinfo.streakname == "assault_drone" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (isdefined(drone.owner) && isdefined(drone.owner.team) && drone.owner.team == owner.team) {
                        return true;
                    }
                }
                continue;
            }
            if (streakinfo.streakname == "radar_drone_overwatch" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (helperdrone_getnumdrones("radar_drone_overwatch", level.incominghelperdrones, owner.team) >= 10) {
                        return true;
                    }
                }
                if (helperdrone_getnumdrones("radar_drone_overwatch", level.incominghelperdrones) >= 20) {
                    return true;
                }
                continue;
            }
            if (streakinfo.streakname == "scrambler_drone_guard" && drone.type == streakinfo.streakname) {
                if (level.teambased) {
                    if (helperdrone_getnumdrones("scrambler_drone_guard", level.incominghelperdrones, owner.team) >= 10) {
                        return true;
                    }
                }
            }
        }
    }
    if (level.supportdrones.size > 0) {
        if (issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
            if (level.supportdrones.size >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
                return true;
            }
        }
        foreach (drone in level.supportdrones) {
            if (streakinfo.streakname == "radar_drone_escort" && drone.helperdronetype == streakinfo.streakname) {
                if (isdefined(drone.owner) && drone.owner == owner) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/COMPANION_ALREADY_EXISTS");
                    }
                    return true;
                }
                continue;
            }
            if (streakinfo.streakname == "radar_drone_recon" && drone.helperdronetype == streakinfo.streakname) {
                if (level.teambased) {
                    if (drone.team == owner.team) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
                        }
                        return true;
                    }
                }
                continue;
            }
            if (streakinfo.streakname == "assault_drone" && drone.helperdronetype == streakinfo.streakname) {
                if (level.teambased) {
                    if (drone.team == owner.team) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
                        }
                        return true;
                    }
                }
                continue;
            }
            if (streakinfo.streakname == "radar_drone_overwatch" && drone.helperdronetype == streakinfo.streakname) {
                if (helperdrone_getnumdrones("radar_drone_overwatch", level.supportdrones) >= 20) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
                    }
                    return true;
                }
                if (level.teambased) {
                    if (helperdrone_getnumdrones("radar_drone_overwatch", level.supportdrones, owner.team) >= 10) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_PERSONAL_RADAR");
                        }
                        return true;
                    }
                }
                if (helperdrone_getnumdrones("radar_drone_overwatch", level.supportdrones, owner) >= 1) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/PERSONAL_RADAR_ALREADY_ACTIVE");
                    }
                    return true;
                }
                continue;
            }
            if (streakinfo.streakname == "scrambler_drone_guard" && drone.helperdronetype == streakinfo.streakname) {
                if (level.teambased) {
                    if (helperdrone_getnumdrones("scrambler_drone_guard", level.supportdrones, owner.team) >= 10) {
                        if (issharedfuncdefined("hud", "showErrorMessage")) {
                            owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_COUNTER_UAV");
                        }
                        return true;
                    }
                    continue;
                }
                if (helperdrone_getnumdrones("scrambler_drone_guard", level.supportdrones, owner) >= 2) {
                    if (issharedfuncdefined("hud", "showErrorMessage")) {
                        owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_COUNTER_UAV");
                    }
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8f05
// Size: 0x110
function helperdrone_getnumdrones(dronetype, var_ee9e55b40b28d806, var_bace6387b1d799ad) {
    var_dc1a0178a2c53770 = 0;
    foreach (drone in var_ee9e55b40b28d806) {
        if (isdefined(drone.type) && drone.type == dronetype || isdefined(drone.helperdronetype) && drone.helperdronetype == dronetype) {
            if (isdefined(var_bace6387b1d799ad)) {
                if (isplayer(var_bace6387b1d799ad)) {
                    if (drone.owner != var_bace6387b1d799ad) {
                        continue;
                    }
                } else if (issharedfuncdefined("game", "isGameplayTeam") && [[ getsharedfunc("game", "isGameplayTeam") ]](var_bace6387b1d799ad)) {
                    if (drone.team != var_bace6387b1d799ad) {
                        continue;
                    }
                }
            }
            var_dc1a0178a2c53770++;
        }
    }
    return var_dc1a0178a2c53770;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x901e
// Size: 0x30
function helperdrone_destroyongameend() {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    level waittill_any_2("bro_shot_start", "game_ended");
    function_ba1c5496f8fc5f67();
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9056
// Size: 0x109
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
    while (true) {
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9167
// Size: 0xa1
function helperdrone_gettargetoffset(helperdrone, player) {
    config = level.helperdronesettings[helperdrone.helperdronetype];
    backoffset = config.backoffset;
    sideoffset = config.sideoffset;
    heightoffset = helperdrone helperdrone_getheightoffset(config);
    if (isdefined(helperdrone.low_entry)) {
        heightoffset *= helperdrone.low_entry;
    }
    targetoffset = (sideoffset, backoffset, heightoffset);
    return targetoffset;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9211
// Size: 0x5bb
function function_34280b807c23a453(helperdronetype) {
    startang = self.angles;
    zoffset = (0, 0, 80);
    spawndist = level.helperdronesettings[helperdronetype].spawndist;
    heightoffset = (0, 0, zoffset[2]);
    halfsize = level.helperdronesettings[helperdronetype].halfsize;
    forward = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    playerpos = scripts\cp_mp\utility\player_utility::getstancetop();
    var_50203232dac6b01f = 50;
    horizontaloffset = 20;
    if (scripts\cp_mp\utility\train_utility::player_standing_on_train()) {
        heightoffset += (0, 0, 150);
        var_50203232dac6b01f = 120;
        spawndist = 150;
        halfsize *= 3;
        horizontaloffset = 120;
    } else if (function_f8789f15330de751(self)) {
        heightoffset += (0, 0, 100);
        var_50203232dac6b01f = 100;
        spawndist = 120;
        halfsize *= 2;
        horizontaloffset = 100;
    } else if (self isswimming()) {
        playerpos = self.origin + (0, 0, getdvarint(@"hash_d78c8ed504373ea5", 30));
    }
    var_8604e40dae72edd = physics_createcontents(["physicscontents_glass", "physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot"]);
    raytrace = ray_trace(self.origin + (0, 0, 20), playerpos, self, var_8604e40dae72edd);
    if (raytrace["hittype"] != "hittype_none") {
        return undefined;
    }
    var_778f9ab8c1872412 = spawndist + horizontaloffset;
    if (self getstance() == "prone") {
        var_778f9ab8c1872412 += 25;
    }
    if (isplayer(self)) {
        if (scripts\cp_mp\utility\train_utility::player_standing_on_train()) {
            heightoffset += (0, 0, 150);
        }
    }
    spawnoffsets = [heightoffset + spawndist * forward, heightoffset - spawndist * forward, heightoffset + spawndist * right, heightoffset - spawndist * right, heightoffset, heightoffset + 0.707 * spawndist * (forward + right), heightoffset + 0.707 * spawndist * (forward - right), heightoffset + 0.707 * spawndist * (right - forward), heightoffset + 0.707 * spawndist * (-1 * forward - right), var_778f9ab8c1872412 * forward, -1 * var_778f9ab8c1872412 * forward, var_778f9ab8c1872412 * right, -1 * var_778f9ab8c1872412 * right, 0.707 * var_778f9ab8c1872412 * (forward + right), 0.707 * var_778f9ab8c1872412 * (forward - right), 0.707 * var_778f9ab8c1872412 * (right - forward), 0.707 * var_778f9ab8c1872412 * (-1 * forward - right)];
    currentchecks = 0;
    for (i = 0; i < spawnoffsets.size; i++) {
        if (4 <= currentchecks) {
            currentchecks = 0;
            wait 0.05;
        }
        spawnoffset = spawnoffsets[i];
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
        rayoffset = vectornormalize(spawnoffset) * var_50203232dac6b01f;
        raypos = playerpos + rayoffset;
        collisioncontents = physics_createcontents(["physicscontents_glass", "physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot", "physicscontents_water"]);
        raytrace = ray_trace(playerpos, raypos, self, collisioncontents);
        /#
            if (getdvarint(@"hash_7d1382405485d79f", 0)) {
                line(playerpos, raypos, (0, 0, 1), 1, 0, 1000);
            }
        #/
        if (raytrace["hittype"] != "hittype_none") {
            continue;
        }
        spheretrace = sphere_trace(raypos, spawnpos, halfsize, self, collisioncontents);
        fraction = spheretrace["fraction"];
        maxoffset = fraction * (spawnpos - raypos);
        maxposition = raypos + maxoffset;
        /#
            if (getdvarint(@"hash_7d1382405485d79f", 0)) {
                line(raypos, spawnpos, (1, 0, 0), 1, 0, 1000);
                sphere(raypos, 5, (1, 1, 0), 0, 1000);
                sphere(spawnpos, 5, (0, 1, 1), 0, 1000);
            }
        #/
        if (fraction > 0) {
            /#
                if (getdvarint(@"hash_7d1382405485d79f", 0)) {
                    sphere(maxposition, halfsize, (0, 1, 0), 0, 1000);
                }
            #/
            self.recondronesafespawn = maxposition;
            return maxposition;
        }
        currentchecks++;
    }
    return undefined;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97d5
// Size: 0xac
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
    while (true) {
        self waittill("spawned_player");
        if (issharedfuncdefined("player", "showMiniMap")) {
            self [[ getsharedfunc("player", "showMiniMap") ]]();
        }
        self.showuavminimaponspawn = 1;
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9889
// Size: 0x176
function deliverydrone_delivertopoint(targetpos, ondelivercallback) {
    self endon("death_or_disconnect");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    streakinfo = spawnstruct();
    streakinfo.streakname = "ammo_drop";
    streakinfo.issuper = 1;
    streakinfo.superid = level.superglobals.staticsuperdata["super_weapon_drop"].id;
    streakinfo.superref = level.superglobals.staticsuperdata["super_weapon_drop"].ref;
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

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a08
// Size: 0x11
function scramblerdrone_counteruavmodeon() {
    scripts\cp_mp\killstreaks\uav::function_24d8b56676d4d3d1();
    level notify("uav_update");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a21
// Size: 0x27
function scramblerdrone_counteruavmodeoff() {
    scripts\cp_mp\killstreaks\uav::uav_removeactivecounteruav();
    /#
        self.owner.var_f39d717b31ec5af9 = undefined;
    #/
    level notify("uav_update");
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a50
// Size: 0x1fc
function function_b25ced7f149be057() {
    self.owner endon("disconnect");
    self endon("death");
    interferencefrac = 0;
    self.oobdistortion = 0;
    var_39b61d1f526b47d7 = 0;
    touchingtrigger = undefined;
    while (true) {
        if (isdefined(level.outofboundstriggers)) {
            self.oobdistortion = 0;
            foreach (trigger in level.outofboundstriggers) {
                if (self istouching(trigger)) {
                    if (isdefined(trigger.script_team) && self.team != trigger.script_team) {
                        continue;
                    }
                    self.oobdistortion = 1;
                    touchingtrigger = trigger;
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
            if (self.oobdistortion) {
                interferencefrac += 1 * level.framedurationseconds;
                if (!istrue(var_39b61d1f526b47d7) && isdefined(touchingtrigger)) {
                    if (issharedfuncdefined("game", "onEnterOOBTrigger")) {
                        [[ getsharedfunc("game", "onEnterOOBTrigger") ]](touchingtrigger, self);
                    }
                    var_39b61d1f526b47d7 = 1;
                }
            } else {
                interferencefrac -= 2 * level.framedurationseconds;
                if (istrue(var_39b61d1f526b47d7) && isdefined(touchingtrigger)) {
                    var_39b61d1f526b47d7 = 0;
                    touchingtrigger = undefined;
                }
            }
            interferencefrac = clamp(interferencefrac, 0, 0.5);
            self.owner setclientomnvar("ui_out_of_range", interferencefrac);
        }
        waitframe();
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c54
// Size: 0x40
function function_de3c015e3c7130e7(helperdronetype) {
    isremotecontrolhelper = 0;
    switch (helperdronetype) {
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_e40585107590f016": 
        isremotecontrolhelper = 1;
        break;
    }
    return isremotecontrolhelper;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c9d
// Size: 0x24
function helperdrone_giveplayerfauxremote(streakinfo) {
    self endon("disconnect");
    setusingremote(streakinfo.streakname);
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cc9
// Size: 0x44
function helperdrone_takeplayerfauxremote(streakinfo) {
    clearusingremote(1);
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    objweapon = makeweapon("ks_remote_drone_mp");
    if (self hasweapon(objweapon)) {
        thread getridofweapon(objweapon);
    }
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d15
// Size: 0x284
function function_f9c33df98457a9a2(target, var_b2cc25676b34bf9) {
    icansee = 0;
    useorigin = self.owner getvieworigin();
    if (istrue(var_b2cc25676b34bf9)) {
        useorigin = self.origin;
    }
    if (isdefined(target.recondronetracecontents)) {
        contents = target.recondronetracecontents;
    } else {
        contents = physics_createcontents(["physicscontents_itemclip", "physicscontents_item", "physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_ainosight"]);
    }
    defaultorigin = target.origin;
    if (isdefined(target.recondronetraceoffset)) {
        defaultorigin += target.recondronetraceoffset;
    }
    tracepoints = [defaultorigin];
    if (isplayer(target)) {
        headpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            headpos = target [[ getsharedfunc("player", "getStanceTop") ]]();
        }
        centerpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            centerpos = target [[ getsharedfunc("player", "getStanceCenter") ]]();
        }
        tracepoints = [headpos, centerpos, defaultorigin];
    } else if (isagent(target)) {
        tracepoints = [defaultorigin + (0, 0, 1)];
    }
    ignorelist = [self, target];
    vehicle = target getvehicle();
    if (isdefined(vehicle)) {
        ignorelist[ignorelist.size] = vehicle;
        vehiclechildren = vehicle getlinkedchildren(1);
        foreach (child in vehiclechildren) {
            ignorelist[ignorelist.size] = vehicle;
        }
    }
    for (i = 0; i < tracepoints.size; i++) {
        if (!scripts\engine\trace::ray_trace_passed(useorigin, tracepoints[i], ignorelist, contents)) {
            continue;
        }
        icansee = 1;
        break;
    }
    return icansee;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x9fa2
// Size: 0x3a
function function_e89890de385d2d9e(config, wasdestroyed, wasexited, wastimedout, wasdetonated, thirdperson) {
    function_9fe87b841a44448f();
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9fe4
// Size: 0x40
function ishelperdrone() {
    if (isdefined(level.helperdronesettings)) {
        if (isdefined(self.streakinfo)) {
            return array_contains_key(level.helperdronesettings, self.streakinfo.streakname);
        }
    }
    return 0;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa02d
// Size: 0x46
function function_8c4ab0a7799e7ab8(weapon) {
    return weapon.basename == "ks_remote_drone_mp" || weapon.basename == "ks_assault_drone_mp" || weapon.basename == "ks_assault_drone_cp";
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa07c
// Size: 0x15
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa099
// Size: 0x2e
function helperdrone_empapplied(data) {
    if (self.helperdronetype == "scrambler_drone_guard") {
        scramblerdrone_counteruavmodeoff();
        thread function_6edfda4764129e3(1);
    }
}

/#

    // Namespace helper_drone / scripts\cp_mp\killstreaks\helper_drone
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa0cf
    // Size: 0xcb
    function function_5fbdbc50f271cfdf() {
        self endon("<dev string:x29>");
        self endon("<dev string:x8b>");
        self notify("<dev string:x94>");
        self endon("<dev string:x94>");
        while (true) {
            nodepath = getnodesonpath(self.owner.origin, self.origin);
            if (isdefined(nodepath)) {
                for (i = 0; i < nodepath.size; i++) {
                    if (isdefined(nodepath[i + 1])) {
                        line(nodepath[i].origin + (0, 0, 80), nodepath[i + 1].origin + (0, 0, 80), (1, 0, 0));
                    }
                }
            }
            waitframe();
        }
    }

#/
