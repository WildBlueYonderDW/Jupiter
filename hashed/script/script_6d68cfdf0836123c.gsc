// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_247745a526421ba7;
#using scripts\engine\trace.gsc;
#using script_4c770a9a4ad7659c;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using script_6de53543fee67f02;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\outofrange.gsc;
#using scripts\cp_mp\killstreaks\gunship.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\challenges.gsc;

#namespace recon_drone;

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce3
// Size: 0x82
function init() {
    function_bc37093624170142();
    function_23f0d567614a93f0();
    function_202017c74349f68c();
    function_9283d83a13859206();
    function_1bc16ffbb7c1131e();
    /#
        setdevdvarifuninitialized(@"hash_b23e7bb60bbe76a6", 0);
        setdevdvarifuninitialized(@"hash_7d1382405485d79f", 0);
        setdevdvarifuninitialized(@"hash_60a091e2e6da3352", 0);
        setdevdvarifuninitialized(@"hash_b432ce13c8a2cac9", 0);
        setdevdvarifuninitialized(@"hash_2013691227d032f7", 0);
        level thread function_e08e7ed0591c3438();
    #/
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6c
// Size: 0x46c
function function_bc37093624170142() {
    level.helperdronesettings["radar_drone_recon"] = spawnstruct();
    level.helperdronesettings["radar_drone_recon"].var_8316e01be4051639 = getdvarint(@"hash_b82bd719c6e7913", 0);
    level.helperdronesettings["radar_drone_recon"].timeout = 45;
    level.helperdronesettings["radar_drone_recon"].maxhealth = 45;
    level.helperdronesettings["radar_drone_recon"].hitstokill = 1;
    level.helperdronesettings["radar_drone_recon"].speed = 140;
    level.helperdronesettings["radar_drone_recon"].accel = 20;
    level.helperdronesettings["radar_drone_recon"].halfsize = 27;
    level.helperdronesettings["radar_drone_recon"].spawndist = 30;
    level.helperdronesettings["radar_drone_recon"].streakname = "radar_drone_recon";
    level.helperdronesettings["radar_drone_recon"].vehicleinfo = "veh_radar_drone_recon_mp";
    level.helperdronesettings["radar_drone_recon"].modelbase = "veh9_mil_air_drone_recon_large_mp";
    level.helperdronesettings["radar_drone_recon"].teamsplash = "used_" + "radar_drone_recon";
    level.helperdronesettings["radar_drone_recon"].destroyedsplash = "callout_destroyed_" + "radar_drone_recon";
    level.helperdronesettings["radar_drone_recon"].scorepopup = "destroyed_" + "radar_drone_recon";
    level.helperdronesettings["radar_drone_recon"].primarymode = "MANUAL";
    level.helperdronesettings["radar_drone_recon"].primarymodestring = "KILLSTREAKS_HINTS/RCD_MANUAL";
    level.helperdronesettings["radar_drone_recon"].primarymodefunc = &function_9dfca5c7ac12fc2;
    level.helperdronesettings["radar_drone_recon"].premoddamagefunc = undefined;
    level.helperdronesettings["radar_drone_recon"].postmoddamagefunc = &namespace_bba8bc8532aa4913::function_caf721cb23374e2b;
    level.helperdronesettings["radar_drone_recon"].var_1c606430b81b28ff = &function_ab931b44a2efddf7;
    level.helperdronesettings["radar_drone_recon"].var_be3314f77fef5d6b = &function_1e3c638e5b7031e7;
    level.helperdronesettings["radar_drone_recon"].var_63a39d0cea63cbb2 = &function_76293a71a35b8692;
    level.helperdronesettings["radar_drone_recon"].var_5d9d3e47b1b88b84 = &function_dcc861687cc9e38;
    level.helperdronesettings["radar_drone_recon"].var_9c6efc85b74204cc = &function_8321764da9dead70;
    level.helperdronesettings["radar_drone_recon"].deathfunc = &namespace_bba8bc8532aa4913::function_ba1c5496f8fc5f67;
    level.helperdronesettings["radar_drone_recon"].playfxcallback = &namespace_bba8bc8532aa4913::function_56966b077270a18e;
    level.helperdronesettings["radar_drone_recon"].var_c25a8137257a96d = &function_b576092fd50996bf;
    level.helperdronesettings["radar_drone_recon"].var_191284e2e2837328 = &function_cbd53bead95f8409;
    level.helperdronesettings["radar_drone_recon"].var_6a390682c21bc49e = 1;
    level.helperdronesettings["radar_drone_recon"].var_1947a47c2174d02c = 1;
    level.helperdronesettings["radar_drone_recon"].var_cb2c3fe0819193eb = 3062500;
    level.helperdronesettings["radar_drone_recon"].var_d5ea718abfc8ff5b = 6250000;
    level.helperdronesettings["radar_drone_recon"].var_a117852275e49e64 = "recon_drone_color_mp";
    level.helperdronesettings["radar_drone_recon"].var_2215fa459d8250c0 = "recon_drone_color_dark_mp";
    level.helperdronesettings["radar_drone_recon"].var_52c3b4bc88132aee = 1;
    level.helperdronesettings["radar_drone_recon"].var_5c6a7212bf9fcbea = 1;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11df
// Size: 0x151
function function_23f0d567614a93f0() {
    val::function_2d6e7e0b80767910("reconDrone_switch", [0:"allow_movement", 1:"allow_jump", 2:"supers", 3:"killstreaks", 4:"vehicle_use", 5:"offhand_weapons"]);
    val::function_2d6e7e0b80767910("reconDrone_deploy", [0:"usability", 1:"melee", 2:"offhand_weapons", 3:"weapon_switch", 4:"vehicle_use"]);
    val::function_2d6e7e0b80767910("reconDrone_use", [0:"fire", 1:"shellshock", 2:"melee", 3:"vehicle_use", 4:"nvg"]);
    if (issharedfuncdefined("equipment", "areNVGTogglableForPlayer") && ![[ getsharedfunc("equipment", "areNVGTogglableForPlayer") ]]()) {
        val::function_2d6e7e0b80767910("reconDrone_use", [0:"fire", 1:"shellshock", 2:"melee", 3:"vehicle_use"]);
    } else {
        val::function_2d6e7e0b80767910("reconDrone_use", [0:"fire", 1:"shellshock", 2:"melee", 3:"vehicle_use", 4:"nvg"]);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1337
// Size: 0x7f
function function_202017c74349f68c() {
    game["dialog"]["radar_drone_recon" + "_teamleader_friendly_inbound"] = "fieldupgrade_team_leader" + "_ally_callout";
    game["dialog"]["radar_drone_recon" + "_teamleader_enemy_inbound"] = "fieldupgrade_team_leader" + "_enemy_callout";
    game["dialog"]["radar_drone_recon" + "_timeout"] = "fieldupgrade_team_leader" + "_timeout";
    game["dialog"]["radar_drone_recon" + "_destroyed"] = "fieldupgrade_team_leader" + "_crash";
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd
// Size: 0x3
function function_9283d83a13859206() {
    
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c7
// Size: 0x1b
function function_1bc16ffbb7c1131e() {
    function_c0b0a582ff9e4d57("recon_drone_color_mp");
    function_c0b0a582ff9e4d57("recon_drone_color_dark_mp");
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e9
// Size: 0x21
function function_57fd8a7006975cd6() {
    streakinfo = createstreakinfo("radar_drone_recon", self);
    return function_ab931b44a2efddf7(streakinfo);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1412
// Size: 0x24a
function function_ab931b44a2efddf7(streakinfo) {
    if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
        return 0;
    }
    helperdronetype = streakinfo.streakname;
    startpos = namespace_bba8bc8532aa4913::function_34280b807c23a453(helperdronetype);
    if (!isdefined(startpos)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
        }
        return 0;
    }
    deployweaponobj = makeweapon("ks_remote_drone_mp");
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &namespace_bba8bc8532aa4913::weapongivenhelperdrone);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            return 0;
        }
    }
    var_fc4aa9db408d9420 = 0.6;
    var_e5c7ffb094dc9eec = 2;
    result = waittill_any_timeout_2(var_fc4aa9db408d9420, "death", "weapon_switch_started");
    if (!isdefined(result) || result != "timeout") {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    result = waittill_any_timeout_1(var_e5c7ffb094dc9eec - var_fc4aa9db408d9420, "death");
    if (!isdefined(result) || result != "timeout") {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    startpos = namespace_bba8bc8532aa4913::function_34280b807c23a453(helperdronetype);
    startangles = self.angles;
    recondrone = function_d8b72ba55b4292cf(startpos, startangles, helperdronetype, streakinfo);
    if (!isdefined(recondrone)) {
        return 0;
    }
    thread namespace_bba8bc8532aa4913::helperdrone_giveplayerfauxremote(streakinfo);
    if (issharedfuncdefined("killstreak", "killstreakUse")) {
        self [[ getsharedfunc("killstreak", "killstreakUse") ]]("recon_drone");
    }
    if (issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
            recondrone vehicleshowonminimap(0);
            namespace_9abe40d2af041eb2::playkillstreakusedialog(helperdronetype);
            recondrone namespace_bba8bc8532aa4913::helperdrone_notifyenemyplayersinrange(helperdronetype);
        }
    }
    namespace_bba8bc8532aa4913::function_c3786c4fba09c2f2(streakinfo);
    if (iscp()) {
        thread namespace_bba8bc8532aa4913::starthelperdrone(recondrone, 1);
    } else {
        thread namespace_bba8bc8532aa4913::starthelperdrone(recondrone);
    }
    return 1;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1664
// Size: 0xaf
function function_d8b72ba55b4292cf(startpos, startang, helperdronetype, streakinfo) {
    recondrone = namespace_bba8bc8532aa4913::createhelperdrone(startpos, startang, helperdronetype, streakinfo, 0, 1);
    if (!isdefined(recondrone)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
        }
        namespace_bba8bc8532aa4913::helperdronecreationfailedfx(helperdronetype, startpos);
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        namespace_bba8bc8532aa4913::function_c3786c4fba09c2f2(streakinfo);
        return undefined;
    }
    return recondrone;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171b
// Size: 0x54
function function_b576092fd50996bf(streakname) {
    hitstokill = level.helperdronesettings[streakname].hitstokill;
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](streakname, hitstokill);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1776
// Size: 0x7e
function function_cbd53bead95f8409(streakname) {
    hitstokill = level.helperdronesettings[streakname].hitstokill;
    weaponname = "emp_grenade_mp";
    weaponhitsperattack = hitstokill;
    var_8b4500d6a881b7b2 = hitstokill;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fb
// Size: 0x57
function function_9dfca5c7ac12fc2(config) {
    self.var_8316e01be4051639 = config.var_8316e01be4051639;
    if (!isdefined(self.enemiesmarked)) {
        self.enemiesmarked = [];
    }
    if (!isdefined(self.usedcount)) {
        self.usedcount = 0;
    }
    thread function_622c97b11177264a(config);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1859
// Size: 0x400
function function_622c97b11177264a(config) {
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](self.streakinfo);
    }
    self.owner notify("droneStart");
    self.owner thread watchthermalinputchange(1);
    self.targetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self.owner, undefined, self.owner, 0, 0, 0);
    self.playersfx = spawn("script_origin", self.origin);
    self.playersfx showonlytoplayer(self.owner);
    self.playersfx linkto(self);
    self.playersfx playloopsound("recon_drone_overlay");
    self.owner setsoundsubmix("mp_recon_drone", 1);
    self.ispiloted = 1;
    if (issharedfuncdefined("supers", "setSuperIsActive")) {
        self.owner thread [[ getsharedfunc("supers", "setSuperIsActive") ]](1);
    }
    self.owner val::function_3633b947164be4f3("reconDrone_use", 0);
    self.owner _freezecontrols(0, 1, "reconDrone");
    self.owner _freezelookcontrols(0, 1);
    var_306044dc14a537a2 = 0;
    /#
        var_aded1f99ce13821a = getdvarint(@"hash_b23e7bb60bbe76a6", 0);
        if (var_aded1f99ce13821a) {
            var_306044dc14a537a2 = 1;
        }
    #/
    self.owner.restoreangles = self.owner.angles;
    self.owner setplayerangles(self.angles);
    self.owner cameralinkto(self, "tag_origin");
    self.owner remotecontrolvehicle(self);
    self.owner namespace_ff14d1780afedf10::function_4f2c4138dacca16a(1, 0, 0.015, 0.15);
    self.owner setclientomnvar("ui_killstreak_health", self.currenthealth / self.maxhealth);
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        namespace_bba8bc8532aa4913::function_ffbc19e1aef5943c(1);
    }
    self.owner painvisionoff();
    self.owner killstreak_savenvgstate();
    self setscriptablepartstate("ddos", "neutral", 0);
    if (issharedfuncdefined("emp", "setEMP_Started_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Started_Callback") ]](&function_31b413d9b6abe7f8);
    }
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_41f3461c40e5a87c);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_6a90d81d42854ecd);
    }
    namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_31b413d9b6abe7f8);
    namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_41f3461c40e5a87c);
    namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_6a90d81d42854ecd);
    namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_85f0fd88983d1893);
    namespace_9abe40d2af041eb2::movingplatform_playerlink(self.owner);
    if (!istrue(var_306044dc14a537a2)) {
        if (0) {
            namespace_e5ea569c6d84bb74::setupoutofrangewatcher(self, undefined, self.owner, undefined, 2250000, 9000000);
        }
        self.owner namespace_bba8bc8532aa4913::function_89af506d89aad6ed(1, self);
        self.owner setclientomnvar("ui_rcd_outer_ring", 0);
        thread function_dfc402ef72eff688(config);
        thread function_7730b66241ef6e46(config);
        thread function_86e1c4f92c53ccfb(config);
        if (issharedfuncdefined("helper_drone", "mark_players")) {
            self thread [[ getsharedfunc("helper_drone", "mark_players") ]](config);
        } else {
            thread function_85b4e9e74b613d68(config);
        }
        thread function_435b4dc89b40e60a(config);
        thread function_148a87125a1ece3e();
    }
    return 1;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c61
// Size: 0x198
function function_439e22ca27f68ce3() {
    if (!isdefined(self.recondronesuper)) {
        return 0;
    } else {
        drone = self.recondronesuper;
        if (!istrue(drone.var_8316e01be4051639)) {
            return 0;
        }
        if (!isnullweapon(self getheldoffhand())) {
            return 0;
        }
        if (!self isonground()) {
            if (namespace_f8065cafc523dba5::function_988138367c74b1f5()) {
                return 0;
            }
            if (!namespace_f8065cafc523dba5::function_d474b372046544b0()) {
                return 0;
            }
        }
        if (namespace_f8065cafc523dba5::isinvehicle(1)) {
            return 0;
        }
        var_19163e14365d9264 = self.super;
        if (!isdefined(var_19163e14365d9264)) {
            return 0;
        }
        if (isdefined(var_19163e14365d9264) && istrue(var_19163e14365d9264.usepercent < 0.05)) {
            return 0;
        }
        drone.var_eee5ddaafc619fa3 = 1;
        drone notify("regain_control");
        _freezelookcontrols(1);
        config = level.helperdronesettings[drone.helperdronetype];
        result = recondrone_givedeployweapon("ks_remote_device_mp", drone);
        thread namespace_bba8bc8532aa4913::helperdrone_giveplayerfauxremote(drone.streakinfo);
        if (!istrue(result)) {
            _freezelookcontrols(0, 1);
            val::function_588f2307a3040610("reconDrone_switch");
            thread recondrone_takedeployweapon(1, "ks_remote_device_mp");
            if (istrue(namespace_448ccf1ca136fbbe::isusingremote())) {
                thread namespace_bba8bc8532aa4913::helperdrone_takeplayerfauxremote(drone.streakinfo);
            }
            return 0;
        }
        drone function_a91ebb0263d086f3();
        drone function_622c97b11177264a(config);
        namespace_bba8bc8532aa4913::function_6a275656141ac8d6(drone);
        if (istrue(drone.isthermalenabled)) {
            setthermalvision(1, 12, 1000);
        }
    }
    return 1;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e01
// Size: 0x11f
function function_148a87125a1ece3e() {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    self endon("death");
    self endon("explode");
    self endon("switch_modes");
    var_c401f442d80d23b6 = getdvarint(@"hash_b432ce13c8a2cac9", 0);
    if (var_c401f442d80d23b6) {
        var_6d5a295ae3c46554 notifyonplayercommand("recon_smoke_launch", "+attack");
        var_6d5a295ae3c46554 setclientomnvar("ui_killstreak_weapon_1_ammo", 3);
        var_693832da25c1999 = 3;
        while (var_693832da25c1999 > 0) {
            var_6d5a295ae3c46554 waittill("recon_smoke_launch");
            if (!self.ispiloted) {
                continue;
            }
            var_51c1b45046e1647c = self.origin + anglestoforward(self.angles) * 50;
            var_cc7d1fabf80c7df5 = namespace_e21c52e4e1a72be6::function_cdf6e1bdfe5b42b5(var_6d5a295ae3c46554);
            launchvelocity = var_cc7d1fabf80c7df5 - var_51c1b45046e1647c;
            /#
                thread namespace_f2ffc0540883e1ad::drawsphere(var_cc7d1fabf80c7df5, 20, 10, (1, 1, 1));
            #/
            magicgrenademanual("smoke_grenade_stick_mp", var_51c1b45046e1647c, launchvelocity, 2);
            var_693832da25c1999--;
            var_6d5a295ae3c46554 setclientomnvar("ui_killstreak_weapon_1_ammo", var_693832da25c1999);
        }
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f27
// Size: 0x31e
function function_85b4e9e74b613d68(config) {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    self endon("death");
    self endon("explode");
    self endon("switch_modes");
    var_820e590cb5620371 = 0;
    self.markingtarget = undefined;
    while (1) {
        if (isdefined(self.targetmarkergroup)) {
            self.targethascoldblooded = 0;
            self.targetisnotinmarkingrange = 0;
            self.anyoneisinmarkingrange = 0;
            targets = self.targetsinouterradius;
            foreach (player in targets) {
                if (var_820e590cb5620371 >= 3) {
                    var_820e590cb5620371 = 0;
                    waitframe();
                }
                if (namespace_5a51aa78ea0b1b9f::is_empd()) {
                    continue;
                }
                if (isplayer(player) && issharedfuncdefined("player", "isReallyAlive")) {
                    jumpiftrue([[ getsharedfunc("player", "isReallyAlive") ]](player)) LOC_0000013d;
                } else if (isagent(player)) {
                    if (!isalive(player)) {
                        continue;
                    }
                    jumpiffalse(isdefined(player.agent_type) && issubstr(player.agent_type, "civilian")) LOC_00000193;
                    namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, player, 3);
                } else {
                LOC_00000193:
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (function_119a97bfb70a99d6(player)) {
                        continue;
                    }
                    if (function_5e38c3c0ae63e8af(player)) {
                        continue;
                    }
                    var_820e590cb5620371++;
                    namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, player, 1);
                    isvisible = namespace_bba8bc8532aa4913::function_f9c33df98457a9a2(player);
                    var_20aa5b4097887cb6 = var_6d5a295ae3c46554 function_cccbd62549b4440b(player, 70, 50);
                    isinrange = function_26d9d0c6ca7a5a8c(player);
                    var_177716bec3407a6a = 0;
                    if (issharedfuncdefined("perk", "hasPerk")) {
                        if (isplayer(player) && player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                            var_177716bec3407a6a = 1;
                        }
                    }
                    if (istrue(player.var_68608ef2e0b39c)) {
                        var_177716bec3407a6a = 1;
                    }
                    if (var_20aa5b4097887cb6 && var_177716bec3407a6a) {
                        self.targethascoldblooded = 1;
                    }
                    if (var_20aa5b4097887cb6 && !isinrange) {
                        self.targetisnotinmarkingrange = 1;
                    }
                    if (isinrange) {
                        self.anyoneisinmarkingrange = 1;
                    }
                    if (var_177716bec3407a6a) {
                        namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, player, 3);
                    } else if ((!isinrange || !isvisible) && self.ispiloted) {
                        namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, player, 0);
                        if (self.var_8316e01be4051639) {
                            player thread function_772ede0cce4020ec(self);
                        }
                    } else {
                        if (!var_20aa5b4097887cb6) {
                            continue;
                        }
                        if (istrue(self.markingtarget)) {
                            continue;
                        }
                        thread function_2fd033ded40b93a9(player, "enemy");
                    }
                }
            }
        }
        var_820e590cb5620371 = 0;
        waitframe();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224c
// Size: 0xa4
function function_dfc402ef72eff688(config) {
    self endon("death");
    self endon("leaving");
    self endon("switch_modes");
    self.owner endon("disconnect");
    reticlestate = 0;
    while (1) {
        if (istrue(self.markingtarget) && reticlestate == 0) {
            self.owner setclientomnvar("ui_rcd_outer_ring", 1);
            reticlestate = 1;
        } else if (!istrue(self.markingtarget) && reticlestate == 1) {
            self.owner setclientomnvar("ui_rcd_outer_ring", 0);
            reticlestate = 0;
        }
        waitframe();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f7
// Size: 0xc0
function function_7730b66241ef6e46(config) {
    self endon("death");
    self endon("leaving");
    self endon("switch_modes");
    self.owner endon("disconnect");
    while (1) {
        if (istrue(self.targethascoldblooded)) {
            self.owner setclientomnvar("ui_rcd_notification", 3);
        } else if (istrue(self.targetisnotinmarkingrange)) {
            self.owner setclientomnvar("ui_rcd_notification", 1);
        } else if (!istrue(self.anyoneisinmarkingrange)) {
            self.owner setclientomnvar("ui_rcd_notification", 2);
        } else {
            self.owner setclientomnvar("ui_rcd_notification", 0);
        }
        waitframe();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23be
// Size: 0x202
function function_86e1c4f92c53ccfb(config) {
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("switch_modes");
    self.owner endon("disconnect");
    self.targetsinouterradius = [];
    while (1) {
        if (!isdefined(self) || !isdefined(self.owner)) {
            return;
        }
        targetarray = function_7d0db4b7f46e7dc0();
        if (isdefined(level.additionalrecondronetargets)) {
            var_ed5deadf98f2b1bd = [];
            foreach (target in level.additionalrecondronetargets) {
                if (isdefined(target.datakey)) {
                    if (issharedfuncdefined("game", "gameFlag")) {
                        if ([[ getsharedfunc("game", "gameFlag") ]]("prematch_done")) {
                            if (issharedfuncdefined("player", "isPlayerOnIntelChallenge")) {
                                if ([[ getsharedfunc("player", "isPlayerOnIntelChallenge") ]](self.owner, target.datakey)) {
                                    var_ed5deadf98f2b1bd[var_ed5deadf98f2b1bd.size] = target;
                                }
                            }
                        }
                    }
                } else {
                    var_ed5deadf98f2b1bd[var_ed5deadf98f2b1bd.size] = target;
                }
            }
            var_d3a3374bbd2c0ec7 = array_combine(targetarray, var_ed5deadf98f2b1bd);
        } else {
            var_d3a3374bbd2c0ec7 = targetarray;
        }
        if (issharedfuncdefined("helper_drone", "get_outer_reticle_targets")) {
            var_d3a3374bbd2c0ec7 = self [[ getsharedfunc("helper_drone", "get_outer_reticle_targets") ]](config);
        }
        foreach (ent in var_d3a3374bbd2c0ec7) {
            if (!function_2f23cbe83e1e57df(ent)) {
                continue;
            }
            thread function_7b0782113e604198(ent);
        }
        waitframe();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c7
// Size: 0x1c8
function function_7b0782113e604198(target) {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("switch_modes");
    if (!isdefined(self.targetmarkergroup)) {
        return;
    }
    self.targetsinouterradius[self.targetsinouterradius.size] = target;
    namespace_f48c22429667eba9::targetmarkergroup_markentity(target, self.targetmarkergroup, 0);
    while (isdefined(target)) {
        if (isplayer(target) && issharedfuncdefined("player", "isReallyAlive")) {
            if (![[ getsharedfunc("player", "isReallyAlive") ]](target)) {
                break;
            }
        }
        if (isagent(target) && !isalive(target)) {
            break;
        }
        config = level.helperdronesettings[self.helperdronetype];
        if (istrue(config.var_1947a47c2174d02c) && !self.owner function_cccbd62549b4440b(target, 70, 300)) {
            break;
        }
        if (!function_c26586725702ec8c(target)) {
            break;
        }
        if (!namespace_f48c22429667eba9::function_7c253e3d43e44097(target, self.targetmarkergroup)) {
            break;
        }
        waitframe();
    }
    if (isdefined(target)) {
        if (namespace_f48c22429667eba9::targetmarkergroupexists(self.targetmarkergroup) && namespace_f48c22429667eba9::function_7c253e3d43e44097(target, self.targetmarkergroup) && !function_5e38c3c0ae63e8af(target)) {
            namespace_f48c22429667eba9::targetmarkergroup_unmarkentity(target, self.targetmarkergroup);
        }
        if (array_contains(self.targetsinouterradius, target)) {
            self.targetsinouterradius = array_remove(self.targetsinouterradius, target);
        }
    } else {
        self.targetsinouterradius = array_removeundefined(self.targetsinouterradius);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2796
// Size: 0x210
function function_435b4dc89b40e60a(config) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("regain_control");
    self.owner endon("disconnect");
    self waittill("switch_modes");
    var_911a7f17fbae1435 = self.origin;
    var_55454af7f74c5d8c = self.origin - (0, 0, 10000);
    contentoverride = create_world_contents();
    groundtrace = ray_trace(var_911a7f17fbae1435, var_55454af7f74c5d8c, self, contentoverride);
    var_48801b6206aa945e = var_55454af7f74c5d8c;
    if (isdefined(groundtrace["hittype"]) && groundtrace["hittype"] != "hittype_none") {
        var_48801b6206aa945e = groundtrace["position"];
    }
    var_ad4b9279d500326a = 1750;
    var_4a2788c9d6c42027 = self.origin[2] - var_48801b6206aa945e[2];
    while (1) {
        var_213fdd3689d4b33e = [0:self.owner];
        if (level.teambased) {
            var_213fdd3689d4b33e = array_combine(var_213fdd3689d4b33e, level.teamdata[self.team]["players"]);
        }
        potentialtargets = utility::playersincylinder(var_48801b6206aa945e, var_ad4b9279d500326a, var_213fdd3689d4b33e, var_4a2788c9d6c42027);
        if (issharedfuncdefined("helper_drone", "get_outer_reticle_targets")) {
            potentialtargets = self [[ getsharedfunc("helper_drone", "get_outer_reticle_targets") ]](config);
        }
        var_7705a9232cd649a6 = 0;
        foreach (target in potentialtargets) {
            if (function_80226370b4c80b06(target)) {
                function_2fd033ded40b93a9(target, "enemy", 1);
                var_7705a9232cd649a6 = 1;
                break;
            }
        }
        if (istrue(var_7705a9232cd649a6)) {
            wait(3);
        } else {
            wait(0.5);
        }
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ad
// Size: 0xd9
function function_772ede0cce4020ec(drone) {
    drone.owner endon("disconnect");
    level endon("game_ended");
    drone endon("death");
    drone endon("explode");
    drone endon("switch_modes");
    self notify("monitorUnmarking");
    self endon("monitorUnmarking");
    if (!isdefined(drone.targetmarkergroup)) {
        return;
    }
    while (drone.ispiloted) {
        waitframe();
    }
    while (1) {
        if (isplayer(self) && issharedfuncdefined("player", "isReallyAlive")) {
            if (![[ getsharedfunc("player", "isReallyAlive") ]](self)) {
                break;
            }
        }
        if (!drone namespace_bba8bc8532aa4913::function_f9c33df98457a9a2(self, 1) || !drone function_26d9d0c6ca7a5a8c(self)) {
            break;
        }
        waitframe();
    }
    namespace_f48c22429667eba9::targetmarkergroup_unmarkentity(self, drone.targetmarkergroup);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8d
// Size: 0x3f7
function function_2fd033ded40b93a9(target, var_39e02a8a79b6ba4c, var_cd4e10c225a826d0) {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("switch_modes");
    var_161e86c260d6864c = spawnstruct();
    var_161e86c260d6864c.target = target;
    var_161e86c260d6864c.targetnum = target getentitynumber();
    var_161e86c260d6864c.markingent = self;
    var_161e86c260d6864c.owner = var_6d5a295ae3c46554;
    var_161e86c260d6864c.ownerteam = var_6d5a295ae3c46554.team;
    var_161e86c260d6864c.outlineid = undefined;
    var_161e86c260d6864c.headicon = undefined;
    var_161e86c260d6864c.beingmarked = undefined;
    var_161e86c260d6864c.reconmarked = undefined;
    var_161e86c260d6864c.notifytoendmark = "unmarked_" + var_161e86c260d6864c.targetnum;
    if (!isdefined(var_161e86c260d6864c.targetnum)) {
        return;
    }
    if (!isdefined(self.targetmarkergroup) && !istrue(var_cd4e10c225a826d0)) {
        return;
    }
    var_161e86c260d6864c.beingmarked = 1;
    self.markingtarget = 1;
    self.owner notify("marking_target");
    var_2095b8a1afaaf65e = function_dc5a1ea5eef68f83();
    self.owner playlocalsound("recon_drone_marking_owner");
    self setscriptablepartstate("target_glint", "on");
    if (istrue(var_cd4e10c225a826d0)) {
        self setlookatent(target);
    }
    while (var_2095b8a1afaaf65e > 0) {
        if (!isdefined(target)) {
            return;
        }
        isstillvalidtarget = namespace_f8065cafc523dba5::isreallyalive(target) && (istrue(var_cd4e10c225a826d0) && namespace_bba8bc8532aa4913::function_f9c33df98457a9a2(target, 1) && function_26d9d0c6ca7a5a8c(target) || var_6d5a295ae3c46554 function_cccbd62549b4440b(target, 70, 50));
        if (!isstillvalidtarget) {
            var_161e86c260d6864c.beingmarked = undefined;
            self.markingtarget = undefined;
            self.owner stoplocalsound("recon_drone_marking_owner");
            self setscriptablepartstate("target_glint", "off");
            self clearlookatent();
            return;
        }
        var_2095b8a1afaaf65e = var_2095b8a1afaaf65e - 0.05;
        wait(0.05);
    }
    if (isdefined(target.recondronemarkedcb)) {
        [[ target.recondronemarkedcb ]](var_6d5a295ae3c46554, target);
    }
    self clearlookatent();
    self setscriptablepartstate("target_glint", "off");
    thread function_46e2d014d3dbf29b();
    var_161e86c260d6864c.reconmarked = 1;
    self.markingtarget = undefined;
    function_1be8cc141c0b49cf(var_161e86c260d6864c, undefined);
    self.owner playlocalsound("recon_drone_marked_owner");
    self.owner stoplocalsound("recon_drone_marking_owner");
    function_c3fafa01f5d05d23(1, var_161e86c260d6864c.targetnum, var_161e86c260d6864c.ownerteam, 1);
    if (!istrue(var_cd4e10c225a826d0)) {
        namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, target, 2);
    }
    function_4f43ed745364f234(target, var_39e02a8a79b6ba4c);
    if (issharedfuncdefined("pers", "incPersStat")) {
        self.owner [[ getsharedfunc("pers", "incPersStat") ]]("reconDroneMarks", 1);
    }
    if (issharedfuncdefined("supers", "combatRecordSuperMisc")) {
        self.owner [[ getsharedfunc("supers", "combatRecordSuperMisc") ]]("super_recon_drone");
    }
    self.usedcount++;
    timeout = 5;
    if (issharedfuncdefined("helper_drone", "customMarkDuration")) {
        timeout = [[ getsharedfunc("helper_drone", "customMarkDuration") ]]();
    }
    if (issharedfuncdefined("perk", "hasPerk")) {
        if (self.owner [[ getsharedfunc("perk", "hasPerk") ]]("specialty_improved_target_mark")) {
            timeout = timeout + 2;
        }
    }
    thread function_4ae03252b19b76b9(var_161e86c260d6864c, timeout);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8b
// Size: 0x92
function function_4f43ed745364f234(target, var_39e02a8a79b6ba4c) {
    if (issharedfuncdefined("player", "doScoreEvent")) {
        self.owner thread [[ getsharedfunc("player", "doScoreEvent") ]](function_2ef675c13ca1c4af(function_1823ff50bb28148d(self.helperdronetype), "_", var_39e02a8a79b6ba4c, "_marked"));
    }
    if (issharedfuncdefined("player", "playerHasMoved")) {
        self.owner thread [[ getsharedfunc("player", "playerHasMoved") ]]();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f24
// Size: 0x4f
function function_4ae03252b19b76b9(var_161e86c260d6864c, timeout) {
    level endon("game_ended");
    target = var_161e86c260d6864c.target;
    target endon(var_161e86c260d6864c.notifytoendmark);
    function_c437a23c3ca84a5c(var_161e86c260d6864c, timeout);
    function_8bf0338c7a157c29(var_161e86c260d6864c);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7a
// Size: 0xcb
function function_c437a23c3ca84a5c(var_161e86c260d6864c, timeout) {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    target = var_161e86c260d6864c.target;
    target endon("death");
    starttime = gettime();
    while (gettime() <= starttime + timeout * 1000) {
        if (isdefined(self) && isdefined(self.owner) && istrue(self.ispiloted) && self.owner function_cccbd62549b4440b(target, 70, 50) && function_26d9d0c6ca7a5a8c(target) && namespace_bba8bc8532aa4913::function_f9c33df98457a9a2(target)) {
            starttime = gettime();
        }
        wait(0.05);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x304c
// Size: 0x26
function function_1083bf4d55c69e99(var_8ca2917cfe80042e, target) {
    return array_contains(var_8ca2917cfe80042e.targetsinouterradius, target);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x307a
// Size: 0xfb
function function_26d9d0c6ca7a5a8c(target) {
    config = level.helperdronesettings[self.helperdronetype];
    var_df1a93029c5dd1e1 = islargemap();
    var_e3b6fa876adec2ab = ter_op(var_df1a93029c5dd1e1, config.var_d5ea718abfc8ff5b, config.var_cb2c3fe0819193eb);
    var_e3b6fa876adec2ab = ter_op(target function_988138367c74b1f5(), 250000, var_e3b6fa876adec2ab);
    if (isdefined(target.markdistanceoverride)) {
        var_e3b6fa876adec2ab = target.markdistanceoverride;
    }
    targetpos = target.origin;
    if (isplayer(target)) {
        targetpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            targetpos = target [[ getsharedfunc("player", "getStanceCenter") ]]();
        }
    }
    return distancesquared(self.origin, targetpos) < var_e3b6fa876adec2ab;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317d
// Size: 0x49
function function_c26586725702ec8c(target) {
    var_7122b969b1fc3cc3 = 25000000;
    if (istrue(target function_988138367c74b1f5())) {
        var_7122b969b1fc3cc3 = 562500;
    }
    return distancesquared(self.origin, target.origin) < var_7122b969b1fc3cc3;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31ce
// Size: 0x48
function function_a4c00a4b64fcb2fa(target) {
    var_7122b969b1fc3cc3 = 3062500;
    if (target function_988138367c74b1f5()) {
        var_7122b969b1fc3cc3 = 250000;
    }
    return distancesquared(self.origin, target.origin) < var_7122b969b1fc3cc3;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x321e
// Size: 0x49
function function_119a97bfb70a99d6(target) {
    if (!isdefined(self.enemiesmarked)) {
        return 0;
    }
    var_161e86c260d6864c = self.enemiesmarked[target getentitynumber()];
    if (!isdefined(var_161e86c260d6864c)) {
        return 0;
    }
    return isdefined(var_161e86c260d6864c.beingmarked);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326f
// Size: 0x49
function function_5e38c3c0ae63e8af(target) {
    if (!isdefined(self.enemiesmarked)) {
        return 0;
    }
    var_161e86c260d6864c = self.enemiesmarked[target getentitynumber()];
    if (!isdefined(var_161e86c260d6864c)) {
        return 0;
    }
    return istrue(var_161e86c260d6864c.reconmarked);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c0
// Size: 0x1d
function function_dc5a1ea5eef68f83() {
    return ter_op(istrue(self.ispiloted), 0.75, 1);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x32e5
// Size: 0x1b8
function function_50dfdf2d06587791(target, var_9e3a8d7dc51a2cae, drone, timeout) {
    var_161e86c260d6864c = spawnstruct();
    var_161e86c260d6864c.target = target;
    var_161e86c260d6864c.targetnum = target getentitynumber();
    var_161e86c260d6864c.outlineid = undefined;
    var_161e86c260d6864c.headicon = undefined;
    var_6e2944c35c23a948 = spawn("script_model", var_9e3a8d7dc51a2cae);
    var_6e2944c35c23a948 setmodel("tag_origin");
    showto = undefined;
    if (level.teambased) {
        showto = [];
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (player.team != self.team) {
                continue;
            }
            showto[showto.size] = player;
        }
    } else {
        showto = self.owner;
    }
    if (!isdefined(showto)) {
        /#
            assertmsg("showTo for markLocation is undefined! Headicon not created.");
        #/
        return;
    }
    if (isarray(showto) && showto.size == 0) {
        /#
            assertmsg("showTo array for markLocation has no valid entries! Headicon not created.");
        #/
        return;
    }
    if (1) {
        var_f98e48f2527d4205 = "hud_icon_new_marked";
        if (namespace_7bdde15c3500a23f::function_6ede573723f08c0f()) {
            var_f98e48f2527d4205 = "hud_icon_head_marked";
        }
        var_161e86c260d6864c.headicon = var_6e2944c35c23a948 thread namespace_7bdde15c3500a23f::setheadicon_singleimage(showto, var_f98e48f2527d4205, 15, 1, 5000, 500, undefined, 1, 1);
    }
    thread function_720d2d338e9a63ca(var_161e86c260d6864c, var_6e2944c35c23a948, timeout);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a4
// Size: 0x9b
function function_720d2d338e9a63ca(var_161e86c260d6864c, var_d99ed5531d1fdc1f, timeout) {
    level endon("game_ended");
    waittill_any_timeout_2(timeout, "death", "explode");
    if (isdefined(var_161e86c260d6864c.icon)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(var_161e86c260d6864c.icon);
        if (isdefined(var_d99ed5531d1fdc1f)) {
            var_d99ed5531d1fdc1f delete();
        }
    }
    if (isdefined(var_161e86c260d6864c.target)) {
        var_161e86c260d6864c.target.locationmarked = undefined;
    }
    self.enemiesmarked[var_161e86c260d6864c.targetnum] = undefined;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3546
// Size: 0x26b
function function_1be8cc141c0b49cf(var_161e86c260d6864c, timeout) {
    target = var_161e86c260d6864c.target;
    self.enemiesmarked[var_161e86c260d6864c.targetnum] = var_161e86c260d6864c;
    var_f98e48f2527d4205 = "hud_icon_new_marked";
    if (namespace_7bdde15c3500a23f::function_6ede573723f08c0f()) {
        var_f98e48f2527d4205 = "hud_icon_head_marked";
    }
    var_f9cd7fda74e92e2a = 8;
    if (isplayer(target)) {
        if (0) {
            if (level.teambased) {
                if (issharedfuncdefined("outline", "outlineEnableForTeam")) {
                    var_161e86c260d6864c.outlineid = [[ getsharedfunc("outline", "outlineEnableForTeam") ]](target, "orange", self.owner.team, 0, 1, 0, "killstreak");
                }
            } else if (issharedfuncdefined("outline", "outlineEnableForPlayer")) {
                var_161e86c260d6864c.outlineid = [[ getsharedfunc("outline", "outlineEnableForPlayer") ]](target, "orange", self.owner, 0, 1, 0, "killstreak");
            }
            if (issharedfuncdefined("outline", "hudOutlineViewmodelEnable")) {
                target [[ getsharedfunc("outline", "hudOutlineViewmodelEnable") ]](5, 0, 1);
            }
        }
        target thread function_d16011cedf620dc6();
        target function_fa08d1d78cf5cb01();
        target playlocalsound("recon_drone_spotted_plr");
    } else if (0) {
        var_c6e17b4bc2eed915 = function_c938e22803fb2efc(var_f98e48f2527d4205, var_f9cd7fda74e92e2a, target);
        var_f98e48f2527d4205 = var_c6e17b4bc2eed915.weaponicon;
        var_f9cd7fda74e92e2a = var_c6e17b4bc2eed915.weaponoffset;
    }
    if (issharedfuncdefined("pmc_missions", "onReconDroneMarkEnt")) {
        target [[ getsharedfunc("pmc_missions", "onReconDroneMarkEnt") ]](self.owner, target);
    }
    self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_recon_drone", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
    self.owner notify("marked_target");
    if (1) {
        var_161e86c260d6864c.headicon = target namespace_7bdde15c3500a23f::setheadicon_singleimage([], var_f98e48f2527d4205, var_f9cd7fda74e92e2a, 1, 4000, 500, undefined, 1, 1);
        function_200b632d8b4ab566(var_161e86c260d6864c);
    }
    if (issharedfuncdefined("helper_drone", "watchMarkingEntStatus")) {
        self thread [[ getsharedfunc("helper_drone", "watchMarkingEntStatus") ]](var_161e86c260d6864c);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b8
// Size: 0x63
function function_d16011cedf620dc6() {
    self endon("disconnect");
    if (istrue(isusingremote())) {
        return;
    }
    visionset = "recon_drone_flash";
    if (istrue(self.pers["useNVG"])) {
        visionset = "recon_drone_flash_nvg";
    }
    self visionsetfadetoblackforplayer(visionset, 0.05);
    wait(0.08);
    self visionsetfadetoblackforplayer("", 1.2);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3822
// Size: 0x78
function function_fa08d1d78cf5cb01() {
    if (!isdefined(self.markedomnvar)) {
        self.markedomnvar = 1;
        self setclientomnvar("ui_rcd_target_notify", self.markedomnvar);
        thread function_dfa102c1a8648b75();
    } else {
        if (self.markedomnvar == 1) {
            self.markedomnvar = 2;
        } else {
            self.markedomnvar = 1;
        }
        self setclientomnvar("ui_rcd_target_notify", self.markedomnvar);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a1
// Size: 0x4e
function function_dfa102c1a8648b75() {
    self endon("disconnect");
    self notify("markedUIUpdate");
    self endon("markedUIUpdate");
    if (issharedfuncdefined("helper_drone", "get_mark_ui_duration")) {
        wait(self [[ getsharedfunc("helper_drone", "get_mark_ui_duration") ]]());
    } else {
        wait(3);
    }
    thread function_a867654273504370();
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f6
// Size: 0x22
function function_a867654273504370() {
    self notify("markedUIUpdate");
    self.markedomnvar = undefined;
    self setclientomnvar("ui_rcd_target_notify", 0);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x391f
// Size: 0x1c8
function function_c938e22803fb2efc(defaulticon, var_2f3cf0914d78ac25, target) {
    weaponicon = defaulticon;
    weaponoffset = var_2f3cf0914d78ac25;
    weaponstruct = spawnstruct();
    if (isdefined(target.weapon_name)) {
        weaponref = undefined;
        if (issubstr(target.weapon_name, "claymore")) {
            weaponref = "equip_claymore";
        } else if (issubstr(target.weapon_name, "c4")) {
            weaponref = "equip_c4";
        } else if (issubstr(target.weapon_name, "atMine")) {
            weaponref = "equip_at_mine";
        } else if (issubstr(target.weapon_name, "trophy")) {
            weaponref = "equip_trophy";
        }
        if (isdefined(weaponref)) {
            var_58907637f9a8d293 = undefined;
            if (issharedfuncdefined("equipment", "getEquipmentTableInfo")) {
                var_58907637f9a8d293 = [[ getsharedfunc("equipment", "getEquipmentTableInfo") ]](weaponref);
            }
            weaponicon = var_58907637f9a8d293.image;
        }
    } else if (isdefined(target.streakinfo)) {
        var_2b7cf61af0cb9960 = target.streakinfo.streakname;
        var_cbab602e6919aad7 = level.var_b23156d776b1d85.var_38f2a11237246ac[var_2b7cf61af0cb9960];
        weaponicon = ter_op(isdefined(var_cbab602e6919aad7) && isdefined(var_cbab602e6919aad7.var_890bc2de5deadf64), var_cbab602e6919aad7.var_890bc2de5deadf64, "");
        weaponoffset = 75;
    }
    weaponstruct.weaponicon = weaponicon;
    weaponstruct.weaponoffset = weaponoffset;
    return weaponstruct;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aef
// Size: 0x68
function function_200b632d8b4ab566(var_161e86c260d6864c) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_f1d272b5fc3a575c(var_161e86c260d6864c, player);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b5e
// Size: 0x142
function function_f1d272b5fc3a575c(var_161e86c260d6864c, player) {
    isfriendly = 0;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "isFriendly")) {
        isfriendly = [[ namespace_3c37cb17ade254d::getsharedfunc("player", "isFriendly") ]](var_161e86c260d6864c.ownerteam, player);
    }
    if (!level.teambased) {
        if (var_161e86c260d6864c.owner == player) {
            isfriendly = 1;
        }
    }
    isowner = isdefined(var_161e86c260d6864c.markingent) && isdefined(var_161e86c260d6864c.markingent.owner) && player == var_161e86c260d6864c.markingent.owner;
    ispiloted = isdefined(var_161e86c260d6864c.markingent) && istrue(var_161e86c260d6864c.markingent.ispiloted);
    var_2b596acb0b767f5d = isowner && ispiloted;
    if (isdefined(var_161e86c260d6864c.headicon)) {
        if (isfriendly && !var_2b596acb0b767f5d) {
            namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_161e86c260d6864c.headicon, player);
        } else {
            namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_161e86c260d6864c.headicon, player);
        }
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca7
// Size: 0x164
function function_8bf0338c7a157c29(var_161e86c260d6864c) {
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(var_161e86c260d6864c.headicon);
    if (isdefined(var_161e86c260d6864c.target)) {
        var_161e86c260d6864c.reconmarked = undefined;
        var_161e86c260d6864c.beingmarked = undefined;
        function_c3fafa01f5d05d23(1, var_161e86c260d6864c.targetnum, var_161e86c260d6864c.ownerteam, 0);
        if (isdefined(self)) {
            self.enemiesmarked[var_161e86c260d6864c.targetnum] = undefined;
        }
        if (isplayer(var_161e86c260d6864c.target) && 0) {
            if (issharedfuncdefined("outline", "outlineDisable")) {
                [[ getsharedfunc("outline", "outlineDisable") ]](var_161e86c260d6864c.outlineid, var_161e86c260d6864c.target);
            }
            if (issharedfuncdefined("outline", "hudOutlineViewmodelDisable")) {
                var_161e86c260d6864c.target [[ getsharedfunc("outline", "hudOutlineViewmodelDisable") ]]();
            }
        }
        if (isdefined(self) && isdefined(self.targetmarkergroup)) {
            namespace_f48c22429667eba9::targetmarkergroup_unmarkentity(var_161e86c260d6864c.target, self.targetmarkergroup);
        }
        var_161e86c260d6864c.target notify(var_161e86c260d6864c.notifytoendmark);
    } else if (isdefined(self)) {
        self.enemiesmarked[var_161e86c260d6864c.targetnum] = undefined;
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e12
// Size: 0x178
function function_1e3c638e5b7031e7() {
    if (istrue(self.var_8316e01be4051639)) {
        self.owner stopwatchingthermalinputchange();
        self.owner setclientomnvar("ui_block_fu_not_ready_error", 1);
        self notify("switch_modes");
        if (isdefined(self.targetmarkergroup)) {
            namespace_f48c22429667eba9::targetmarkergroup_off(self.targetmarkergroup);
            self.targetmarkergroup = undefined;
        }
        if (namespace_5a51aa78ea0b1b9f::is_empd()) {
            namespace_bba8bc8532aa4913::function_ffbc19e1aef5943c(0);
        }
        function_86ff095469a70cd2();
        function_8321764da9dead70(self.owner);
        if (isdefined(self.owner.super) && isdefined(self.owner.super.staticdata) && isdefined(self.owner.super.staticdata.id)) {
            self.owner setclientomnvar("ui_field_upgrade_use", self.owner.super.staticdata.id);
        }
        thread function_fcd08c370fe30d2c(self.origin);
        if (iscp() && isdefined(self.oob) && self.oob == 1) {
            thread function_76293a71a35b8692();
        }
    } else {
        thread function_76293a71a35b8692();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f91
// Size: 0x13d
function function_fcd08c370fe30d2c(var_b01459d2cac1c01f) {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self.owner endon("droneStart");
    wait(0.05);
    var_821114e017d34f47 = level.helperdronesettings[self.helperdronetype];
    var_924ab4970806f758 = var_821114e017d34f47.speed;
    var_9de2a251a918a33b = var_821114e017d34f47.accel;
    var_83694cbcb46a36fd = var_821114e017d34f47.speed * 0.5;
    var_acb0183e038bb06 = var_821114e017d34f47.accel * 2;
    var_3078fd3c826f3ee3 = var_acb0183e038bb06 * 0.5;
    self vehicle_setspeed(var_83694cbcb46a36fd, var_acb0183e038bb06, var_3078fd3c826f3ee3);
    self sethoverparams(1, 5, 5);
    self setvehgoalpos(var_b01459d2cac1c01f, 1);
    self waittill("goal");
    var_46104ff95396dbce = 200;
    var_a5de0629edcd96a2 = var_46104ff95396dbce * var_46104ff95396dbce;
    while (1) {
        if (distancesquared(self.origin, var_b01459d2cac1c01f) >= var_a5de0629edcd96a2) {
            self setvehgoalpos(var_b01459d2cac1c01f, 1);
            self waittill("goal");
        }
        waitframe();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d5
// Size: 0x18
function function_76293a71a35b8692(timeout) {
    thread namespace_bba8bc8532aa4913::function_6edfda4764129e3(0, 1, timeout);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f4
// Size: 0xe7
function function_dcc861687cc9e38(config, var_4fac8b8ce36e09f1, var_d9b2677826930bf7, var_28d4a6f776c18b73, var_bd21744eb1b623fe, thirdperson) {
    if (issharedfuncdefined("game", "clearOOB")) {
        [[ getsharedfunc("game", "clearOOB") ]](self, 1);
    }
    namespace_5a51aa78ea0b1b9f::clear_emp(1);
    if (isdefined(self.ispiloted) && istrue(self.ispiloted)) {
        function_8321764da9dead70(self.owner);
    }
    if (isdefined(self.owner) && isdefined(self.owner.super)) {
        self.owner setclientomnvar("ui_block_fu_not_ready_error", 0);
        self.owner setclientomnvar("ui_field_upgrade_use", 0);
    }
    namespace_bba8bc8532aa4913::function_24085a0230958938();
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e2
// Size: 0x288
function function_8321764da9dead70(player) {
    if (!isdefined(player)) {
        return;
    }
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](self.streakinfo);
    }
    var_7c344645cc98e70d = self.helperdronetype;
    config = level.helperdronesettings[var_7c344645cc98e70d];
    self.ispiloted = 0;
    if (issharedfuncdefined("supers", "setSuperIsActive")) {
        self.owner thread [[ getsharedfunc("supers", "setSuperIsActive") ]](0);
    }
    if (isdefined(self.playersfx)) {
        self.playersfx delete();
    }
    if (isdefined(self.enemiesmarked)) {
        foreach (var_161e86c260d6864c in self.enemiesmarked) {
            function_f1d272b5fc3a575c(var_161e86c260d6864c, player);
        }
    }
    var_a57879325a8e0669 = "ks_remote_drone_mp";
    if (istrue(self.var_eee5ddaafc619fa3)) {
        var_a57879325a8e0669 = "ks_remote_device_mp";
    }
    player thread recondrone_takedeployweapon(1, var_a57879325a8e0669);
    player namespace_bba8bc8532aa4913::helperdrone_takeplayerfauxremote(self.streakinfo);
    player painvisionon();
    player killstreak_setmainvision("");
    if (istrue(self.isthermalenabled)) {
        player setthermalvision(0);
    }
    player thread namespace_bba8bc8532aa4913::function_f23d90f7483d67e4();
    player cameraunlink();
    if (!istrue(self.var_d31453e33d3e34ca)) {
        player remotecontrolvehicleoff();
    }
    if (iscp()) {
        level callback::callback("killstreak_finish_use", {streakinfo:self.streakinfo});
    }
    player _freezecontrols(0, 1, "reconDrone");
    player _freezelookcontrols(0, 1);
    player val::function_588f2307a3040610("reconDrone_switch");
    player val::function_588f2307a3040610("reconDrone_deploy");
    player val::function_588f2307a3040610("reconDrone_use");
    player namespace_ff14d1780afedf10::function_e2eae50826e12247();
    namespace_9abe40d2af041eb2::movingplatform_playerunlink(player);
    if (isreallyalive(player) && isdefined(player.restoreangles)) {
        player setplayerangles((player.restoreangles[0], player.restoreangles[1], 0));
    }
    player.restoreangles = undefined;
    player killstreak_restorenvgstate();
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4471
// Size: 0x1b9
function recondrone_beginsuper() {
    self endon("death_or_disconnect");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    streakinfo = spawnstruct();
    streakinfo.streakname = "radar_drone_recon";
    streakinfo.weaponname = "ks_remote_drone_mp";
    streakinfo.issuper = 1;
    streakinfo.superid = level.superglobals.staticsuperdata["super_recon_drone"].id;
    streakinfo.var_ebec497ff8b18a45 = level.superglobals.staticsuperdata["super_recon_drone"].ref;
    childthread namespace_bba8bc8532aa4913::function_34280b807c23a453(streakinfo.streakname);
    if (!isdefined(self.recondronesafespawn)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
        }
        return 0;
    }
    if (!namespace_bba8bc8532aa4913::tryusehelperdroneearlyout(streakinfo, 1)) {
        self.recondronereserved = 1;
        thread recondrone_watchcleanupreserved(streakinfo, 0);
        if (namespace_f64231d5b7a2c3c4::reservevehicle()) {
            self.reconvehiclereserved = 1;
            thread recondrone_watchcleanupreserved(streakinfo, 1);
            if (recondrone_givedeployweapon("ks_remote_drone_mp")) {
                thread recondrone_watchsuper(streakinfo);
                namespace_aad14af462a74d08::function_d997435895422ecc("super_recon_drone", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
                return 1;
            } else {
                val::function_588f2307a3040610("reconDrone_switch");
                thread recondrone_takedeployweapon(1, "ks_remote_drone_mp");
                thread recondrone_cleanupreserved(streakinfo, 1);
            }
        } else {
            thread recondrone_cleanupreserved(streakinfo, 0);
        }
    }
    return 0;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4632
// Size: 0xe0
function recondrone_endsuper(var_fcef8d217a441961) {
    self notify("reconDroneEnded");
    self.recondronesafespawn = undefined;
    if (isdefined(self.recondronerefund)) {
        self.recondronerefund = undefined;
        if (issharedfuncdefined("supers", "giveSuperPoints") && issharedfuncdefined("supers", "getSuperPointsNeeded")) {
            self [[ getsharedfunc("supers", "giveSuperPoints") ]]([[ getsharedfunc("supers", "getSuperPointsNeeded") ]]());
        }
    }
    if (isdefined(self.recondronereserved)) {
        self.recondronereserved = undefined;
        streakinfo = spawnstruct();
        streakinfo.streakname = "radar_drone_recon";
        recondrone_cleanupreserved(streakinfo);
    }
    if (isdefined(self.reconvehiclereserved)) {
        self.reconvehiclereserved = undefined;
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4719
// Size: 0xc6
function recondrone_watchsuper(streakinfo) {
    self endon("disconnect");
    result = recondrone_watchsuperinternal(streakinfo);
    if (!istrue(result)) {
        val::function_588f2307a3040610("reconDrone_switch");
        val::function_588f2307a3040610("reconDrone_deploy");
        thread recondrone_takedeployweapon(1, "ks_remote_drone_mp");
        if (issharedfuncdefined("supers", "superUseFinished")) {
            self thread [[ getsharedfunc("supers", "superUseFinished") ]](1);
        }
    } else if (!istrue(level.helperdronesettings["radar_drone_recon"].var_8316e01be4051639) && issharedfuncdefined("supers", "superUseFinished")) {
        self thread [[ getsharedfunc("supers", "superUseFinished") ]](0);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e6
// Size: 0x279
function recondrone_watchsuperinternal(streakinfo) {
    self endon("death");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    thread recondrone_watchsuperendfromswitch();
    if (issharedfuncdefined("reconDrone", "onSuperStarted")) {
        self [[ getsharedfunc("reconDrone", "onSuperStarted") ]]();
    }
    val::function_3633b947164be4f3("reconDrone_deploy", 0);
    _freezecontrols(1, undefined, "reconDrone");
    wait(1.85);
    childthread namespace_bba8bc8532aa4913::function_34280b807c23a453(streakinfo.streakname);
    wait(0.15);
    if (level.gameended) {
        self.recondronesafespawn = undefined;
    }
    isinlaststand = 0;
    if (issharedfuncdefined("player", "isInLastStand")) {
        isinlaststand = [[ getsharedfunc("player", "isInLastStand") ]](self);
    }
    if (isdefined(self.recondronesafespawn) && !isinlaststand) {
        self.reconvehiclereserved = undefined;
        thread recondrone_watchcleanupreserved(streakinfo, 0);
        recondrone = function_d8b72ba55b4292cf(self.recondronesafespawn, self.angles, streakinfo.streakname, streakinfo);
        self.recondronesafespawn = undefined;
        if (isdefined(recondrone)) {
            thread namespace_bba8bc8532aa4913::helperdrone_giveplayerfauxremote(streakinfo);
            recondrone recondrone_addtolists(recondrone, self);
            namespace_bba8bc8532aa4913::function_c3786c4fba09c2f2(streakinfo);
            thread namespace_bba8bc8532aa4913::starthelperdrone(recondrone);
            if (issharedfuncdefined("sound", "trySayLocalSound")) {
                level thread [[ getsharedfunc("sound", "trySayLocalSound") ]](self, #"hash_c836f1cdb2da4224");
            }
            var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
            if (var_e005d4b70d6f2611) {
                recondrone vehicleshowonminimap(0);
            }
            namespace_9abe40d2af041eb2::playkillstreakusedialog(streakinfo.streakname);
            recondrone namespace_bba8bc8532aa4913::helperdrone_notifyenemyplayersinrange(streakinfo.streakname);
            self notify("successful_recon_deployment");
            return 1;
        } else {
            namespace_bba8bc8532aa4913::helperdronecreationfailedfx(streakinfo.streakname);
            _freezecontrols(0, 1, "reconDrone");
        }
    } else {
        namespace_bba8bc8532aa4913::helperdronecreationfailedfx(streakinfo.streakname);
        _freezecontrols(0, 1, "reconDrone");
    }
    if (issharedfuncdefined("hud", "showErrorMessage")) {
        self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/NOT_ENOUGH_SPACE");
    }
    self notify("failed_recon_deployment");
    return 0;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a67
// Size: 0x4b
function recondrone_watchsuperendfromswitch() {
    self endon("death_or_disconnect");
    self endon("reconDroneEnded");
    self endon("reconDroneUnset");
    self endon("reconDrone_watchSuperEndFromSwitch");
    objweapon = makeweapon("ks_remote_drone_mp");
    while (1) {
        if (self getcurrentweapon() != objweapon) {
            break;
        }
        waitframe();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab9
// Size: 0x52
function recondrone_unsetsuper(var_fcef8d217a441961) {
    self notify("reconDroneUnset");
    if (1) {
        recondrone = self.recondronesuper;
        if (isdefined(recondrone)) {
            if (!istrue(recondrone.isdestroyed)) {
                recondrone namespace_bba8bc8532aa4913::function_ba1c5496f8fc5f67();
            }
        }
    }
    thread recondrone_endsuper(var_fcef8d217a441961);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b12
// Size: 0xca
function recondrone_givedeployweapon(deployweaponname, var_d037fce5b7051c4a) {
    self endon("death_or_disconnect");
    self endon("reconDroneWeaponTaken");
    self endon("redeploy_drone_use");
    self notify("reconDroneWeaponGiven");
    self endon("reconDroneWeaponGiven");
    objweapon = makeweapon(deployweaponname);
    if (!self hasweapon(objweapon) && objweapon.basename != "none") {
        _giveweapon(objweapon);
    }
    val::function_3633b947164be4f3("reconDrone_switch", 0);
    thread function_7c3dc10c6270b3c8("melee_swipe_start", objweapon);
    thread function_7c3dc10c6270b3c8("weapon_change", objweapon);
    thread function_7c3dc10c6270b3c8("player_isHaywire", objweapon);
    if (isdefined(var_d037fce5b7051c4a)) {
        thread function_31cc8545b41badca(var_d037fce5b7051c4a, objweapon);
    }
    result = domonitoredweaponswitch(objweapon);
    return result;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be4
// Size: 0x4e
function function_7c3dc10c6270b3c8(var_bf4a0adf8e2321fe, deployweapon) {
    self endon("death_or_disconnect");
    self endon("recon_drone_cancel");
    self endon("droneStart");
    level endon("game_ended");
    self waittill(var_bf4a0adf8e2321fe);
    if (isswitchingtoweaponwithmonitoring(deployweapon)) {
        abortmonitoredweaponswitch(deployweapon);
    }
    self notify("recon_drone_cancel");
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c39
// Size: 0x72
function function_31cc8545b41badca(drone, deployweapon) {
    self endon("death_or_disconnect");
    self endon("recon_drone_cancel");
    self endon("droneStart");
    level endon("game_ended");
    drone waittill_any_2("death", "explode");
    if (isswitchingtoweaponwithmonitoring(deployweapon)) {
        abortmonitoredweaponswitch(deployweapon);
    }
    _freezelookcontrols(0, 1);
    val::function_588f2307a3040610("reconDrone_switch");
    self notify("recon_drone_cancel");
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb2
// Size: 0x7a
function recondrone_takedeployweapon(var_cd4f35a2ac5bd598, deployweaponname) {
    self endon("death_or_disconnect");
    self endon("reconDroneWeaponGiven");
    self notify("reconDroneWeaponTaken");
    self endon("reconDroneWeaponTaken");
    if (!isdefined(deployweaponname)) {
        return 0;
    }
    objweapon = makeweapon(deployweaponname);
    if (istrue(var_cd4f35a2ac5bd598)) {
        if (isswitchingtoweaponwithmonitoring(objweapon)) {
            abortmonitoredweaponswitch(objweapon);
            return;
        }
    }
    if (istrue(var_cd4f35a2ac5bd598)) {
        getridofweapon(objweapon);
    }
    namespace_1cd9f6896754adb0::function_588f2307a3040610("reconDrone_switch");
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d33
// Size: 0x35
function recondrone_watchcleanupreserved(streakinfo, vehiclereserved) {
    self notify("reconDrone_cleanupReserved");
    self endon("reconDrone_cleanupReserved");
    self waittill("disconnect");
    thread recondrone_cleanupreserved(streakinfo, vehiclereserved);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d6f
// Size: 0x6f
function recondrone_cleanupreserved(streakinfo, vehiclereserved) {
    self notify("reconDrone_cleanupReserved");
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]](1);
    }
    namespace_bba8bc8532aa4913::function_c3786c4fba09c2f2(streakinfo);
    if (istrue(vehiclereserved)) {
        if (istrue(self.reconvehiclereserved)) {
            self.reconvehiclereserved = undefined;
        }
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4de5
// Size: 0x6f
function recondrone_addtolists(drone, owner) {
    owner.recondronesuper = drone;
    owner.pausesuperpointsovertime = 1;
    id = drone getentitynumber();
    if (!isdefined(level.recondronesupers)) {
        level.recondronesupers = [];
    }
    level.recondronesupers[id] = drone;
    thread recondrone_removefromlistsondeath(drone, owner, id);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e5b
// Size: 0x66
function recondrone_removefromlists(drone, owner, id) {
    if (isdefined(drone)) {
        drone notify("reconDrone_removeFromLists");
        id = drone getentitynumber();
    }
    if (isdefined(owner)) {
        owner.recondronesuper = undefined;
        owner.pausesuperpointsovertime = 0;
    }
    if (isdefined(level.recondronesupers)) {
        level.recondronesupers[id] = undefined;
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec8
// Size: 0x36
function recondrone_removefromlistsondeath(drone, owner, id) {
    drone endon("reconDrone_removeFromLists");
    drone waittill("death");
    thread recondrone_removefromlists(drone, owner, id);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f05
// Size: 0xad
function function_39cba2c62062f32e() {
    if (isdefined(level.supportdrones) && level.supportdrones.size > 0) {
        foreach (drone in level.supportdrones) {
            if (istrue(namespace_f8065cafc523dba5::playersareenemies(self, drone.owner))) {
                if (isdefined(drone.enemiesmarked) && isdefined(drone.enemiesmarked[self getentitynumber()])) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fba
// Size: 0x132
function function_cccbd62549b4440b(var_d89f028a5c8db805, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a) {
    var_9b96536b85a38bc6 = 0;
    var_8a4ea3a3baa22e4 = var_d89f028a5c8db805.origin;
    if (isdefined(var_d89f028a5c8db805.recondronetraceoffset)) {
        var_8a4ea3a3baa22e4 = var_8a4ea3a3baa22e4 + var_d89f028a5c8db805.recondronetraceoffset;
    }
    var_20c094516733ffb1 = [0:var_8a4ea3a3baa22e4];
    if (isplayer(var_d89f028a5c8db805)) {
        headpos = var_d89f028a5c8db805 namespace_f8065cafc523dba5::getstancetop();
        centerpos = var_d89f028a5c8db805 namespace_f8065cafc523dba5::getstancecenter();
        var_20c094516733ffb1 = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    } else if (isagent(var_d89f028a5c8db805)) {
        var_20c094516733ffb1 = [0:var_8a4ea3a3baa22e4 + (0, 0, 1)];
    }
    foreach (point in var_20c094516733ffb1) {
        if (self worldpointinreticle_circle(point, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a)) {
            var_9b96536b85a38bc6 = 1;
            break;
        }
    }
    return var_9b96536b85a38bc6;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50f4
// Size: 0x19f
function function_2f23cbe83e1e57df(potentialtarget) {
    config = level.helperdronesettings[self.helperdronetype];
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        return 0;
    }
    if (isplayer(potentialtarget)) {
        if (issharedfuncdefined("player", "isReallyAlive")) {
            if (![[ getsharedfunc("player", "isReallyAlive") ]](potentialtarget)) {
                return 0;
            }
        }
        if (!istrue(config.var_6a390682c21bc49e)) {
            if (issharedfuncdefined("perk", "hasPerk")) {
                if (potentialtarget [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                    return 0;
                }
            }
        }
    }
    if (isagent(potentialtarget)) {
        if (!isalive(potentialtarget)) {
            return 0;
        }
    }
    if (level.teambased) {
        if (isdefined(potentialtarget.team) && potentialtarget.team == self.team) {
            return 0;
        }
    } else {
        if (isplayer(potentialtarget) && potentialtarget == self.owner) {
            return 0;
        }
        if (isdefined(potentialtarget.owner) && potentialtarget.owner == self.owner) {
            return 0;
        }
    }
    if (!function_c26586725702ec8c(potentialtarget)) {
        return 0;
    }
    if (function_5e38c3c0ae63e8af(potentialtarget)) {
        return 0;
    }
    if (function_1083bf4d55c69e99(self, potentialtarget)) {
        return 0;
    }
    config = level.helperdronesettings[self.helperdronetype];
    if (istrue(config.var_1947a47c2174d02c) && !self.owner function_cccbd62549b4440b(potentialtarget, 70, 300)) {
        return 0;
    }
    return 1;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x529b
// Size: 0xf3
function function_80226370b4c80b06(potentialtarget) {
    config = level.helperdronesettings[self.helperdronetype];
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        return 0;
    }
    if (isplayer(potentialtarget)) {
        if (issharedfuncdefined("player", "isReallyAlive")) {
            if (![[ getsharedfunc("player", "isReallyAlive") ]](potentialtarget)) {
                return 0;
            }
        }
        if (issharedfuncdefined("perk", "hasPerk")) {
            if (potentialtarget [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                return 0;
            }
        }
    }
    if (isagent(potentialtarget)) {
        if (!isalive(potentialtarget)) {
            return 0;
        }
        if (isdefined(potentialtarget.agent_type) && issubstr(potentialtarget.agent_type, "civilian")) {
            return 0;
        }
    }
    if (!namespace_bba8bc8532aa4913::function_f9c33df98457a9a2(potentialtarget, 1)) {
        return 0;
    }
    if (function_5e38c3c0ae63e8af(potentialtarget)) {
        return 0;
    }
    return 1;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5396
// Size: 0x39
function function_46e2d014d3dbf29b() {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("flash_glint", "on");
    wait(0.3);
    self setscriptablepartstate("flash_glint", "off");
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53d6
// Size: 0x94
function function_85f0fd88983d1893(data) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    if (!isdefined(self.owner)) {
        return;
    }
    if (isdefined(data.attacker) && isdefined(data.inflictor) && self.currenthealth > 0) {
        self dodamage(self.maxhealth, self.origin, data.attacker, data.inflictor);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5471
// Size: 0x67
function function_31b413d9b6abe7f8(data) {
    self setscriptablepartstate("ddos", "disabled", 0);
    if (!isdefined(self.owner)) {
        return;
    }
    if (istrue(self.ispiloted)) {
        self.owner _freezecontrols(1);
        thread namespace_5a51aa78ea0b1b9f::play_scramble_for_player_until_cleared(self.owner, 5);
        namespace_bba8bc8532aa4913::function_ffbc19e1aef5943c(1);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54df
// Size: 0x6a
function function_41f3461c40e5a87c(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    if (isdefined(data.attacker)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("disabled_recon_drone", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        }
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5550
// Size: 0x52
function function_6a90d81d42854ecd(isdeath) {
    self setscriptablepartstate("ddos", "neutral", 0);
    if (!isdefined(self.owner)) {
        return;
    }
    if (istrue(self.ispiloted)) {
        self.owner _freezecontrols(0);
        namespace_bba8bc8532aa4913::function_ffbc19e1aef5943c(0);
    }
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55a9
// Size: 0xfb
function function_7d0db4b7f46e7dc0() {
    targetarray = [];
    contentoverride = create_world_contents();
    var_3df9d9a1027fb9bc = self.owner getvieworigin();
    var_d90f07506fc6739a = var_3df9d9a1027fb9bc + anglestoforward(self.owner getplayerangles()) * 5000;
    ignoreents = [0:self];
    var_6156eaf7876d53cd = namespace_2a184fc4902783dc::ray_trace(var_3df9d9a1027fb9bc, var_d90f07506fc6739a, ignoreents, contentoverride);
    if (var_6156eaf7876d53cd["hittype"] != "hittype_none") {
        var_d90f07506fc6739a = var_6156eaf7876d53cd["position"];
    }
    /#
        if (getdvarint(@"hash_39582696895063e7", 0)) {
            level thread namespace_f2ffc0540883e1ad::drawline(var_3df9d9a1027fb9bc, var_d90f07506fc6739a, 0.05, (1, 1, 1));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_d90f07506fc6739a, 50, 0.05, (1, 1, 1));
        }
    #/
    targetarray = utility::function_2d7fd59d039fa69b(var_d90f07506fc6739a, 2500);
    return targetarray;
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56ac
// Size: 0x29
function function_157c2bcd50ca6207() {
    recondrone = self.recondronesuper;
    return isdefined(recondrone) && !istrue(recondrone.isdestroyed);
}

// Namespace recon_drone/namespace_893ac0cf28c5af44
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56dd
// Size: 0x93
function function_e08e7ed0591c3438() {
    /#
        setdevdvar(@"hash_60a091e2e6da3352", 0);
        while (1) {
            if (getdvarint(@"hash_60a091e2e6da3352") != 0) {
                setdevdvar(@"hash_60a091e2e6da3352", 0);
                if (level.players.size < 1) {
                    iprintlnbold("_ally_callout");
                    continue;
                }
                firstplayer = level.players[0];
                firstplayer thread function_d16011cedf620dc6();
                firstplayer function_fa08d1d78cf5cb01();
                firstplayer playlocalsound("specialty_noscopeoutline");
            }
            waitframe();
        }
    #/
}

