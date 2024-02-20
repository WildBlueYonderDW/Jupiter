// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\trace.gsc;
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
#using script_6d68cfdf0836123c;
#using scripts\cp_mp\hostmigration.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace assault_drone;

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x785
// Size: 0x39
function init() {
    function_308ec7da3cb5926a();
    function_d91e42f2a9d746a8();
    function_3a2d3d065646c104();
    function_13c1d2376167d45e();
    function_2a27f30882f6a886();
    /#
        setdevdvarifuninitialized(@"hash_268779ee67d4a45a", 0);
    #/
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0x4e3
function function_308ec7da3cb5926a() {
    level.helperdronesettings["assault_drone"] = spawnstruct();
    level.helperdronesettings["assault_drone"].timeout = 30;
    level.helperdronesettings["assault_drone"].maxhealth = 150;
    level.helperdronesettings["assault_drone"].hitstokill = 1;
    level.helperdronesettings["assault_drone"].speed = 100;
    level.helperdronesettings["assault_drone"].accel = 20;
    level.helperdronesettings["assault_drone"].halfsize = 27;
    level.helperdronesettings["assault_drone"].spawndist = 30;
    level.helperdronesettings["assault_drone"].streakname = "assault_drone";
    level.helperdronesettings["assault_drone"].vehicleinfo = "veh_assault_drone_mp";
    if (utility::iscp()) {
        level.helperdronesettings["assault_drone"].modelbase = "veh9_mil_air_bomb_drone_c4_attached_cp";
    } else {
        level.helperdronesettings["assault_drone"].modelbase = "veh9_mil_air_bomb_drone_c4_attached_mp";
    }
    level.helperdronesettings["assault_drone"].teamsplash = "used_" + "assault_drone";
    level.helperdronesettings["assault_drone"].destroyedsplash = "callout_destroyed_" + "assault_drone";
    level.helperdronesettings["assault_drone"].scorepopup = "destroyed_" + "assault_drone";
    level.helperdronesettings["assault_drone"].primarymode = "MANUAL";
    level.helperdronesettings["assault_drone"].primarymodestring = "test string";
    level.helperdronesettings["assault_drone"].primarymodefunc = &function_fb7ed8dfabeaed9a;
    level.helperdronesettings["assault_drone"].premoddamagefunc = undefined;
    level.helperdronesettings["assault_drone"].postmoddamagefunc = &namespace_bba8bc8532aa4913::function_caf721cb23374e2b;
    level.helperdronesettings["assault_drone"].deathfunc = &namespace_bba8bc8532aa4913::function_ba1c5496f8fc5f67;
    level.helperdronesettings["assault_drone"].var_1c606430b81b28ff = &function_2445adf5d64eef6f;
    level.helperdronesettings["assault_drone"].var_be3314f77fef5d6b = &function_91ae4f6ece59691f;
    level.helperdronesettings["assault_drone"].var_63a39d0cea63cbb2 = &function_87ad014181a233aa;
    level.helperdronesettings["assault_drone"].var_5d9d3e47b1b88b84 = &function_f09621755c154350;
    level.helperdronesettings["assault_drone"].var_9c6efc85b74204cc = &function_a4cfbe3f567af798;
    level.helperdronesettings["assault_drone"].playfxcallback = &namespace_bba8bc8532aa4913::function_56966b077270a18e;
    level.helperdronesettings["assault_drone"].var_c25a8137257a96d = &function_29a52fe5c2a8eb57;
    level.helperdronesettings["assault_drone"].var_191284e2e2837328 = &function_8648618e4fac5041;
    level.helperdronesettings["assault_drone"].var_6a390682c21bc49e = 0;
    level.helperdronesettings["assault_drone"].var_1947a47c2174d02c = 0;
    level.helperdronesettings["assault_drone"].var_cb2c3fe0819193eb = 272 * 272;
    level.helperdronesettings["assault_drone"].var_d5ea718abfc8ff5b = 10000;
    level.helperdronesettings["assault_drone"].var_a117852275e49e64 = "assault_drone_color_mp";
    level.helperdronesettings["assault_drone"].var_2215fa459d8250c0 = "assault_drone_color_dark_mp";
    level.helperdronesettings["assault_drone"].var_52c3b4bc88132aee = 1;
    level.helperdronesettings["assault_drone"].var_5c59bdb4308ee080 = 0;
    level.helperdronesettings["assault_drone"].var_dd47aede4ad7e18a = 1;
    level.helperdronesettings["assault_drone"].var_52858f12c0ef4c03 = 1;
    level.helperdronesettings["assault_drone"].var_5c6a7212bf9fcbea = 0;
    if (isBRStyleGameType()) {
        level.helperdronesettings["assault_drone"].diewithowner = 1;
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaf
// Size: 0xf3
function function_d91e42f2a9d746a8() {
    val::function_2d6e7e0b80767910("assaultDrone_switch", [0:"allow_movement", 1:"allow_jump", 2:"supers", 3:"killstreaks", 4:"vehicle_use"]);
    val::function_2d6e7e0b80767910("assaultDrone_deploy", [0:"usability", 1:"melee", 2:"offhand_weapons", 3:"weapon_switch"]);
    if (issharedfuncdefined("equipment", "areNVGTogglableForPlayer") && ![[ getsharedfunc("equipment", "areNVGTogglableForPlayer") ]]()) {
        val::function_2d6e7e0b80767910("assaultDrone_use", [0:"fire", 1:"shellshock", 2:"melee"]);
    } else {
        val::function_2d6e7e0b80767910("assaultDrone_use", [0:"fire", 1:"shellshock", 2:"melee", 3:"nvg"]);
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda9
// Size: 0x9e
function function_3a2d3d065646c104() {
    game["dialog"]["assault_drone" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["assault_drone" + "_timeout"] = "killstreak_remote_operator" + "_timeout";
    game["dialog"]["assault_drone" + "_destroyed"] = "killstreak_remote_operator" + "_crash";
    game["dialog"]["assault_drone" + "_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["assault_drone" + "_miss_target"] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4e
// Size: 0x3
function function_13c1d2376167d45e() {
    
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe58
// Size: 0x55
function function_2a27f30882f6a886() {
    if (isdefined(level.var_6d129920246627ba)) {
        function_c0b0a582ff9e4d57(level.var_6d129920246627ba);
    }
    if (isdefined(level.var_61b254009a0951a6)) {
        function_c0b0a582ff9e4d57(level.var_61b254009a0951a6);
    }
    function_c0b0a582ff9e4d57("assault_drone_color_mp");
    function_c0b0a582ff9e4d57("assault_drone_color_dark_mp");
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb4
// Size: 0x21
function function_e24ef5600f59548e() {
    streakinfo = createstreakinfo("assault_drone", self);
    return function_2445adf5d64eef6f(streakinfo);
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedd
// Size: 0x42e
function function_2445adf5d64eef6f(streakinfo) {
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
    val::function_3633b947164be4f3("assaultDrone_switch", 0);
    if (utility::iscp()) {
        deployweaponobj = makeweapon("ks_assault_drone_cp");
    } else {
        deployweaponobj = makeweapon("ks_assault_drone_mp");
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &namespace_bba8bc8532aa4913::weapongivenhelperdrone);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        val::function_588f2307a3040610("assaultDrone_switch");
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            val::function_588f2307a3040610("assaultDrone_switch");
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            return 0;
        }
    }
    self notify("assaultDroneCalled");
    var_e5c7ffb094dc9eec = 2;
    var_52a5be2e2f91d710 = 0.5;
    val::function_3633b947164be4f3("assaultDrone_deploy", 0);
    _freezecontrols(1, undefined, "heliEndRide");
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
    }
    result = waittill_any_timeout_1(var_e5c7ffb094dc9eec, "death");
    if (!isdefined(result) || result != "timeout") {
        _freezecontrols(0, 1, "assaultDrone");
        val::function_588f2307a3040610("assaultDrone_switch");
        val::function_588f2307a3040610("assaultDrone_deploy");
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    startpos = namespace_bba8bc8532aa4913::function_34280b807c23a453(helperdronetype);
    startangles = self.angles;
    assaultDrone = function_37873a0b82dad887(startpos, startangles, helperdronetype, streakinfo);
    if (!isdefined(assaultDrone)) {
        _freezecontrols(0, 1, "assaultDrone");
        val::function_588f2307a3040610("assaultDrone_switch");
        val::function_588f2307a3040610("assaultDrone_deploy");
        return 0;
    }
    if (issharedfuncdefined("weapons", "_launchGrenade")) {
        if (isBRStyleGameType()) {
            dangericonent = self [[ getsharedfunc("weapons", "_launchGrenade") ]]("assault_drone_danger_br", assaultDrone.origin, (0, 0, 0), 100, 1);
        } else {
            dangericonent = self [[ getsharedfunc("weapons", "_launchGrenade") ]]("assault_drone_danger_mp", assaultDrone.origin, (0, 0, 0), 100, 1);
        }
        dangericonent linkto(assaultDrone);
        assaultDrone.dangericonent = dangericonent;
    }
    thread namespace_bba8bc8532aa4913::helperdrone_giveplayerfauxremote(streakinfo);
    if (issharedfuncdefined("killstreak", "killstreakUse")) {
        self [[ getsharedfunc("killstreak", "killstreakUse") ]]("assault_drone");
    }
    if (issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
            assaultDrone vehicleshowonminimap(0);
        }
    }
    namespace_9abe40d2af041eb2::playkillstreakusedialog(streakinfo.streakname);
    assaultDrone namespace_bba8bc8532aa4913::helperdrone_notifyenemyplayersinrange(streakinfo.streakname);
    _freezecontrols(0, 1, "assaultDrone");
    namespace_bba8bc8532aa4913::function_c3786c4fba09c2f2(streakinfo);
    var_4c4c52e5183669b3 = getdvarint(@"hash_fdc42aba096a2344", 3);
    thread namespace_bba8bc8532aa4913::starthelperdrone(assaultDrone, var_4c4c52e5183669b3);
    self notify("assault_drone_deployed");
    thread playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_use", 1, var_52a5be2e2f91d710);
    if (issharedfuncdefined("killstreak", "enableDroneTracking")) {
        self thread [[ getsharedfunc("killstreak", "enableDroneTracking") ]](assaultDrone);
    }
    return 1;
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1313
// Size: 0xe1
function function_37873a0b82dad887(startpos, startang, helperdronetype, streakinfo) {
    assaultDrone = namespace_bba8bc8532aa4913::createhelperdrone(startpos, startang, helperdronetype, streakinfo, 0, 1);
    if (!isdefined(assaultDrone)) {
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
    assaultDrone.owner.var_3efdaabc0f66846d = 0;
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](streakinfo);
    }
    return assaultDrone;
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13fc
// Size: 0x54
function function_29a52fe5c2a8eb57(streakname) {
    hitstokill = level.helperdronesettings[streakname].hitstokill;
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](streakname, hitstokill);
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1457
// Size: 0x7e
function function_8648618e4fac5041(streakname) {
    hitstokill = level.helperdronesettings[streakname].hitstokill;
    weaponname = "emp_grenade_mp";
    weaponhitsperattack = hitstokill;
    var_8b4500d6a881b7b2 = hitstokill;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14dc
// Size: 0x2c
function function_fb7ed8dfabeaed9a(config) {
    if (!isdefined(self.usedcount)) {
        self.usedcount = 0;
    }
    thread function_74247ac518a2df62(config);
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150f
// Size: 0x30f
function function_74247ac518a2df62(config) {
    self.owner thread watchthermalinputchange(1);
    self.playersfx = spawn("script_origin", self.origin);
    self.playersfx showonlytoplayer(self.owner);
    self.playersfx linkto(self);
    self.playersfx playloopsound("recon_drone_overlay");
    self.owner setsoundsubmix("mp_recon_drone", 1);
    self.targetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self.owner, undefined, self.owner, 0, 0, 0);
    self.ispiloted = 1;
    self.owner val::function_3633b947164be4f3("assaultDrone_use", 0);
    self.owner.restoreangles = self.owner.angles;
    self.owner setplayerangles(self.angles);
    self.owner cameralinkto(self, "tag_origin", 0, 1);
    if (!isdefined(self.empcount) || isdefined(self.empcount) && self.empcount == 0) {
        self.owner remotecontrolvehicle(self);
        self.owner namespace_ff14d1780afedf10::function_4f2c4138dacca16a(1, 0, 0.015, 0.15);
    }
    self.owner painvisionoff();
    self setscriptablepartstate("ddos", "neutral", 0);
    namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_7d0712e71e309e60);
    namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_35de57c9587f7f44);
    namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_c58f1c9f5ff4f9c5);
    namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_c3fac7e77ebbb27b);
    if (issharedfuncdefined("emp", "setEMP_Started_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Started_Callback") ]](&function_7d0712e71e309e60);
    }
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_35de57c9587f7f44);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_c58f1c9f5ff4f9c5);
    }
    namespace_9abe40d2af041eb2::movingplatform_playerlink(self.owner);
    self.owner namespace_bba8bc8532aa4913::function_89af506d89aad6ed(1, self);
    self.owner setclientomnvar("ui_rcd_outer_ring", 0);
    if (issharedfuncdefined("game", "registerEntForOOB")) {
        [[ getsharedfunc("game", "registerEntForOOB") ]](self, "killstreak");
    }
    thread namespace_893ac0cf28c5af44::function_86e1c4f92c53ccfb(config);
    thread function_ee8fd2b2321035c0(config);
    thread function_da8b343109516850(config);
    self setscriptablepartstate("warning_beep", "on", 0);
    self.owner killstreak_savenvgstate();
    thread function_518a6887376e8b13(config);
    return 1;
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1826
// Size: 0xa4
function function_ee8fd2b2321035c0(config) {
    self endon("death");
    self endon("leaving");
    self endon("switch_modes");
    self.owner endon("disconnect");
    reticlestate = 0;
    while (1) {
        if (istrue(self.var_12dce598075360d8) && reticlestate == 0) {
            self.owner setclientomnvar("ui_rcd_outer_ring", 1);
            reticlestate = 1;
        } else if (!istrue(self.var_12dce598075360d8) && reticlestate == 1) {
            self.owner setclientomnvar("ui_rcd_outer_ring", 0);
            reticlestate = 0;
        }
        waitframe();
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d1
// Size: 0x18c
function function_da8b343109516850(config) {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    self endon("death");
    self endon("leaving");
    self endon("explode");
    self endon("switch_modes");
    var_820e590cb5620371 = 0;
    while (1) {
        targets = self.targetsinouterradius;
        var_12dce598075360d8 = 0;
        foreach (player in targets) {
            if (var_820e590cb5620371 >= 3) {
                var_820e590cb5620371 = 0;
                waitframe();
            }
            if (!isdefined(player)) {
                continue;
            }
            if (isplayer(player) && issharedfuncdefined("player", "isReallyAlive")) {
                jumpiftrue([[ getsharedfunc("player", "isReallyAlive") ]](player)) LOC_00000103;
            } else {
            LOC_00000103:
                var_820e590cb5620371++;
                namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, player, 1);
                isvisible = namespace_bba8bc8532aa4913::function_f9c33df98457a9a2(player);
                isinrange = namespace_893ac0cf28c5af44::function_26d9d0c6ca7a5a8c(player);
                if (!istrue(isvisible)) {
                    namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, player, 0);
                    continue;
                } else if (!istrue(isinrange)) {
                    continue;
                }
                var_12dce598075360d8 = 1;
                namespace_bba8bc8532aa4913::function_28368a23c20ff3e6(self.targetmarkergroup, player, 2);
            }
        }
        self.var_12dce598075360d8 = var_12dce598075360d8;
        var_820e590cb5620371 = 0;
        waitframe();
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a64
// Size: 0xb
function function_91ae4f6ece59691f() {
    thread function_87ad014181a233aa();
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a76
// Size: 0x18
function function_87ad014181a233aa(timeout) {
    thread namespace_bba8bc8532aa4913::function_6edfda4764129e3(0, 1, timeout);
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a95
// Size: 0x1c1
function function_f09621755c154350(config, var_4fac8b8ce36e09f1, var_d9b2677826930bf7, var_28d4a6f776c18b73, var_bd21744eb1b623fe, thirdperson) {
    if (isdefined(self.empcount) && self.empcount > 0) {
        self.owner _freezelookcontrols(0, 1);
    }
    if (issharedfuncdefined("game", "clearOOB")) {
        [[ getsharedfunc("game", "clearOOB") ]](self, 1);
    }
    if (isdefined(self.dangericonent)) {
        self.dangericonent delete();
    }
    self setscriptablepartstate("warning_beep", "off", 0);
    if (istrue(var_bd21744eb1b623fe) || istrue(var_d9b2677826930bf7) && istrue(config.var_5c59bdb4308ee080) || istrue(var_28d4a6f776c18b73) && istrue(config.var_52858f12c0ef4c03) || istrue(var_4fac8b8ce36e09f1) && istrue(config.var_dd47aede4ad7e18a)) {
        if (issharedfuncdefined("killstreak", "makePlayerVulnerableOnAssaultDroneDetonate")) {
            self.owner thread [[ getsharedfunc("killstreak", "makePlayerVulnerableOnAssaultDroneDetonate") ]](self);
        }
        namespace_bba8bc8532aa4913::function_9fe87b841a44448f();
        thread function_1e7e724aa1c163ab();
    } else {
        namespace_bba8bc8532aa4913::function_24085a0230958938();
    }
    if (isdefined(level.var_ca1a76fbc0ba0bef)) {
        thread [[ level.var_ca1a76fbc0ba0bef ]](self.streakinfo, self.origin, 0);
    }
    var_ffb805976f3f5f9a = undefined;
    if (function_ccf98e6391dd38b9() && isdefined(thirdperson) && istrue(thirdperson)) {
        var_ffb805976f3f5f9a = 2.5;
    } else if (function_ccf98e6391dd38b9()) {
        var_ffb805976f3f5f9a = 0;
    }
    thread function_a4cfbe3f567af798(self.owner, var_ffb805976f3f5f9a);
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5d
// Size: 0x284
function function_a4cfbe3f567af798(player, var_ffb805976f3f5f9a) {
    if (!isdefined(player)) {
        return;
    }
    self setentityowner(player);
    self clearscriptabledamageowner();
    var_7c344645cc98e70d = self.helperdronetype;
    config = level.helperdronesettings[var_7c344645cc98e70d];
    self.ispiloted = 0;
    if (isdefined(player.super)) {
        player.super.isactive = 0;
    }
    if (isdefined(self.playersfx)) {
        self.playersfx delete();
    }
    if (isdefined(self.enemiesmarked)) {
        foreach (var_161e86c260d6864c in self.enemiesmarked) {
            namespace_893ac0cf28c5af44::function_f1d272b5fc3a575c(var_161e86c260d6864c, player);
        }
    }
    var_a57879325a8e0669 = "ks_remote_drone_mp";
    if (istrue(self.var_eee5ddaafc619fa3)) {
        var_a57879325a8e0669 = "ks_remote_device_mp";
    }
    player thread namespace_893ac0cf28c5af44::recondrone_takedeployweapon(1, var_a57879325a8e0669);
    player namespace_bba8bc8532aa4913::helperdrone_takeplayerfauxremote(self.streakinfo);
    player painvisionon();
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](self.streakinfo);
    }
    player killstreak_setMainVision("");
    if (istrue(self.isthermalenabled)) {
        player setthermalvision(0);
    }
    player _freezecontrols(0, 1, "assaultDrone");
    player _freezelookcontrols(0, 1);
    player val::function_588f2307a3040610("assaultDrone_switch");
    player val::function_588f2307a3040610("assaultDrone_deploy");
    player val::function_588f2307a3040610("assaultDrone_use");
    player thread namespace_bba8bc8532aa4913::function_f23d90f7483d67e4();
    if (istrue(self.isempd)) {
        self.isempd = undefined;
        self.owner thread namespace_5a51aa78ea0b1b9f::stop_emp_scramble(5);
    }
    if (!istrue(self.var_d31453e33d3e34ca)) {
        player remotecontrolvehicleoff();
    }
    player namespace_ff14d1780afedf10::function_e2eae50826e12247();
    namespace_9abe40d2af041eb2::movingplatform_playerunlink(player);
    player killstreak_restorenvgstate();
    if (isdefined(var_ffb805976f3f5f9a)) {
        wait(var_ffb805976f3f5f9a);
    }
    player cameraunlink();
    player setplayerangles((player.restoreangles[0], player.restoreangles[1], 0));
    player.restoreangles = undefined;
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee8
// Size: 0x10b
function function_413df2de080e3cc1(config) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self.owner endon("disconnect");
    self.owner notifyonplayercommand("drone_camera_switch", "+melee_zoom");
    while (1) {
        self.owner waittill("drone_camera_switch");
        var_1c3e9c203ea72971 = 0;
        /#
            var_1c3e9c203ea72971 = getdvarint(@"hash_268779ee67d4a45a", 0);
        #/
        if (!istrue(var_1c3e9c203ea72971)) {
            continue;
        }
        if (self.var_d0d1af898acdc9af == "default") {
            self.owner _freezelookcontrols(1);
            function_521e734765a10ca9(2, "under", "tag_undercam");
            thread function_80269a0d716399f(config);
            /#
                thread function_b596c64f2795cdc1("killstreak_remote_operator");
            #/
        } else {
            self.owner _freezelookcontrols(0, 1);
            function_521e734765a10ca9(1, "default", "tag_origin");
            thread function_518a6887376e8b13(config);
        }
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ffa
// Size: 0x70
function function_80269a0d716399f(config) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("detonate_bomb");
    self.owner endon("disconnect");
    self notify("release_bomb");
    self.owner notifyonplayercommand("drone_release_bomb", "+attack");
    self.owner waittill("drone_release_bomb");
    childthread function_6756b4a82c91ce02();
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2071
// Size: 0xb9
function function_1e7e724aa1c163ab() {
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 endon("disconnect");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    if (!isdefined(var_6d5a295ae3c46554.var_5431d89a36b0936)) {
        var_6d5a295ae3c46554.var_5431d89a36b0936 = 0;
    }
    if (var_6d5a295ae3c46554.recentkillcount >= 1 || var_6d5a295ae3c46554.var_5431d89a36b0936 >= 1 || var_6d5a295ae3c46554.var_3efdaabc0f66846d >= 1) {
        var_6d5a295ae3c46554 playkillstreakoperatordialog("assault_drone", "assault_drone" + "_hit_target", 1);
    } else {
        var_6d5a295ae3c46554 playkillstreakoperatordialog("assault_drone", "assault_drone" + "_miss_target", 1);
    }
    self.var_3efdaabc0f66846d = undefined;
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2131
// Size: 0xa8
function function_518a6887376e8b13(config) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("release_bomb");
    self.owner endon("disconnect");
    self notify("detonate_bomb");
    self.owner notifyonplayercommand("drone_detonate", "+attack");
    while (1) {
        self.owner waittill("drone_detonate");
        if (istrue(self.owner.var_65219c911f198c95) || namespace_5a51aa78ea0b1b9f::is_empd()) {
            continue;
        } else {
            thread namespace_bba8bc8532aa4913::function_6edfda4764129e3(0, 0, 0, 1);
            break;
        }
        waitframe();
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e0
// Size: 0x91
function function_521e734765a10ca9(var_2b9318495421e36f, var_d0d1af898acdc9af, cameratag) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self.owner endon("disconnect");
    self.owner cameraunlink();
    self.owner namespace_bba8bc8532aa4913::function_89af506d89aad6ed(0);
    waitframe();
    self.owner cameralinkto(self, cameratag, 0, 1);
    self.owner namespace_bba8bc8532aa4913::function_89af506d89aad6ed(var_2b9318495421e36f, self);
    self.var_d0d1af898acdc9af = var_d0d1af898acdc9af;
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2278
// Size: 0xae
function function_6756b4a82c91ce02() {
    launchdir = vectornormalize(self.origin - (0, 0, 5) - self.origin);
    var_9ea4faf9f08cb80d = self.origin + launchdir * 10;
    var_cc7d1fabf80c7df5 = var_9ea4faf9f08cb80d + launchdir * 100;
    launchvelocity = var_cc7d1fabf80c7df5 - var_9ea4faf9f08cb80d;
    projectile = magicgrenademanual("assault_drone_mp", var_9ea4faf9f08cb80d, launchvelocity, 99, self.owner);
    projectile.streakinfo = self.streakinfo;
    wait(2);
    thread function_87ad014181a233aa();
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232d
// Size: 0x77
function function_c3fac7e77ebbb27b(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    if (isdefined(data.attacker) && isdefined(data.inflictor) && self.currenthealth > 0) {
        self dodamage(self.maxhealth, self.origin, data.attacker, data.inflictor);
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ab
// Size: 0xe6
function function_7d0712e71e309e60(data) {
    self setscriptablepartstate("ddos", "disabled", 0);
    self setscriptablepartstate("warning_beep", "off", 0);
    if (!isdefined(self.owner)) {
        return;
    }
    if (isdefined(data.attacker)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("disabled_bomb_drone");
        }
    }
    if (istrue(self.ispiloted)) {
        self.owner _freezecontrols(1, undefined, "assaultDrone");
        self.owner _freezelookcontrols(1);
        if (!istrue(self.isempd)) {
            self.isempd = 1;
            self.owner thread namespace_5a51aa78ea0b1b9f::play_emp_scramble(5);
        }
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2498
// Size: 0x6a
function function_35de57c9587f7f44(data) {
    if (!isdefined(self.owner)) {
        return;
    }
    if (isdefined(data.attacker)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("disabled_bomb_drone", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        }
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2509
// Size: 0xa0
function function_c58f1c9f5ff4f9c5(isdeath) {
    self setscriptablepartstate("ddos", "neutral", 0);
    self setscriptablepartstate("warning_beep", "on", 0);
    if (istrue(self.isempd)) {
        self.isempd = undefined;
        self.owner thread namespace_5a51aa78ea0b1b9f::stop_emp_scramble(5);
    }
    if (!isdefined(self.owner)) {
        return;
    }
    if (istrue(self.ispiloted)) {
        self.owner _freezecontrols(0, 1, "assaultDrone");
        self.owner _freezelookcontrols(0, 1);
    }
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b0
// Size: 0x153
function function_571f1e65c43fb585(inflictor, victim, var_24df708f286b0562) {
    if (!isdefined(inflictor) || !isdefined(victim)) {
        return var_24df708f286b0562;
    }
    var_59f806a0ab5d37fc = victim namespace_f8d3520d3483c1::function_9bca5c1d23a3e0b3();
    if (istrue(var_59f806a0ab5d37fc)) {
        var_5a76b167b0298c0d = utility::playersnear(inflictor.origin, 100);
        var_72601fe316a42077 = 0;
        foreach (potentialtarget in var_5a76b167b0298c0d) {
            if (potentialtarget != victim) {
                continue;
            }
            var_72601fe316a42077 = 1;
            break;
        }
        if (!istrue(var_72601fe316a42077)) {
            var_24df708f286b0562 = victim namespace_f8d3520d3483c1::function_ac266fc218266d08() + victim.health - 1;
            if (isdefined(inflictor.owner)) {
                if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
                    if (isdefined(victim.var_4045f099f3da4bd) && victim.var_4045f099f3da4bd == "brloot_plate_carrier_tempered") {
                        inflictor.owner thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]](#"hash_4caa4f3c52eaa383");
                    }
                }
            }
        }
    }
    return var_24df708f286b0562;
}

// Namespace assault_drone/namespace_8a82a4967e25efd4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x270b
// Size: 0x74
function function_b596c64f2795cdc1(cameratag) {
    /#
        self endon("ks_assault_drone_mp");
        self endon("death");
        self endon("killstreak");
        self.owner endon("vehicle_damage");
        self.owner endon("emp");
        while (1) {
            level thread namespace_f2ffc0540883e1ad::drawsphere(self gettagorigin(cameratag), 10, 0.05, (1, 1, 1));
            wait(0.05);
        }
    #/
}

