#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_608c50392df8c7d1;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_58be75c518bf0d40;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\game.gsc;
#using script_1311c5c284dd1537;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_1ed1214969b5eba7;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\common\elevators.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_6a8ec730b2bfa844;
#using script_2aabac61f2ae422;
#using script_2d9d24f7c63ac143;
#using script_3db04fd1b466bdba;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace tactical_camera;

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d8
// Size: 0x8b
function function_5027f03acd35a5ca() {
    if (!isdefined(level.superglobals.staticsuperdata["super_tac_camera"])) {
        return;
    }
    level._effect["vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx"] = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    function_5d36462331845d5f("tacticalCameraList");
    level.var_bb0266f422d9afa3["tacCam"] = spawnstruct();
    function_c13d155ad0421754();
    level.superglobals.staticsuperdata["super_tac_camera"].var_f6604eebabcac6c2 = &function_391f2c842bce6b0a;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6b
// Size: 0x242
function function_c13d155ad0421754() {
    leveldata = function_f0698aee89c18210("tacCam");
    leveldata.supername = "super_tac_camera";
    leveldata.lifetime = getdvarint(@"hash_13717e6e87cb530f", 120);
    leveldata.startfunc = &function_a10d1d70759f9e83;
    leveldata.exitfunc = &function_96ecbf2f7e001e7;
    leveldata.destroyfunc = &function_fb4a392282a75942;
    leveldata.var_d6fdc3b56b33f4e3 = &function_7acc5aa2b73fe93b;
    leveldata.var_273f2a99f4833f00 = &function_daf83774b715c487;
    leveldata.var_547e8b267c03d017 = &function_1ee10c87668846d9;
    leveldata.var_1eb35a5a7992e498 = &function_7acc5aa2b73fe93b;
    leveldata.var_6e5f6320607eb69 = &function_a60052d904a2d492;
    leveldata.var_4fbadc7102d30912 = 2480625;
    leveldata.var_16187e4d354c3c97 = 619369;
    leveldata.var_37782917998d4ff2 = 2480625;
    leveldata.var_9953dc2e8c205b77 = 619369;
    leveldata.var_eff1ab975c47fe2 = 9000000;
    leveldata.sensorduration = 3;
    leveldata.groupnameteams = "tacticalCameraList";
    leveldata.groupnameplayer = "tacticalCameras";
    leveldata.var_1790d4c69d5f45a4 = 2;
    leveldata.var_5b125df6b587a5c2 = 10;
    leveldata.additionnotification = "tacticalCamera_camera_added";
    leveldata.removalnotification = "tacticalCamera_camera_removed";
    leveldata.var_315c43d476bb095 = "tacticalCamera_location_changed";
    leveldata.var_36411d05d3f1e503 = "tacticalCamera_pilot_removed";
    leveldata.headiconname = "hud_icon_fieldupgrade_tac_cam";
    leveldata.markingsfx = "equip_tactical_cam_marking";
    leveldata.maxhealth = 150;
    leveldata.var_604c545b594e97ec = &function_3888b35ba7e2f0a9;
    leveldata.damagehandler = &function_79a97ee01dc267d3;
    leveldata.orientationcontents = scripts\engine\trace::create_contents(1, 0, 0, 1, 0, 1, 0, 1, 1);
    leveldata.var_106bf36856a998f = getentarray("tacCameraInvalid", "targetname");
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb5
// Size: 0x95
function tacticalCamera_set() {
    self notify("tacticalCamera_set");
    thread function_362c9a13d18031b1("personal_camera_status_updated", "ui_tactical_camera_cam_", "tacticalCamera_unset");
    function_b1d73dd45d89a318("tacCam");
    function_81fb12166c3c0c2(self, undefined, &function_a6302bc4d39a6fa, "super_tac_camera");
    thread function_3c4da29d1ed157c7("tacCamCluster", "tacticalCamera_unset", "tacticalCamera_camera_removed", 9000000, &function_a6302bc4d39a6fa);
    self setclientomnvar("ui_block_fu_not_ready_error", 1);
    self.isusingcamera = 0;
    if (!isbot(self) && !isagent(self)) {
        thread function_c0d6ea536d1aa6e3();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd52
// Size: 0x58
function tacticalCamera_unset() {
    self notify("tacticalCamera_unset");
    function_f7a32619bba6e450("tacCam");
    function_987961464bef3a3();
    self.isusingcamera = undefined;
    function_8b5781dd2d18a300(self);
    function_81fb12166c3c0c2(self, 1, &function_a6302bc4d39a6fa, "super_tac_camera");
    self setclientomnvar("ui_block_fu_not_ready_error", 0);
    function_fb30706d5e4a4b27(undefined);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb2
// Size: 0x2
function function_60367230245c7390() {
    
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdbc
// Size: 0x1d
function function_5ad1423b15c27c76() {
    _takeweapon(function_2e7f831f8c6f4b38());
    waitframe();
    _giveweapon(function_2e7f831f8c6f4b38());
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde1
// Size: 0x1c
function function_987961464bef3a3() {
    self setclientomnvar("ui_tactical_camera_cam_0_status", 0);
    self setclientomnvar("ui_tactical_camera_cam_1_status", 0);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe05
// Size: 0x9b
function function_dbeca4d95f44293d(grenade) {
    self endon("disconnect");
    level endon("game_ended");
    thread function_797384a578f0a453(grenade);
    camera = function_c778dfbe6301129a(grenade, "super_tac_camera");
    if (isdefined(camera)) {
        function_f3bb4f4911a1beb2("pmc_missions", "onPlaceTacCamera", camera);
        camera.usedcount = 0;
        camera endon("death");
        camera thread function_a1c6dc676cf5aa86();
        waitframe();
        camera thread function_c99b3a2b715c288b();
        scripts\cp_mp\challenges::function_d997435895422ecc("super_tac_camera", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea8
// Size: 0x76
function function_a1c6dc676cf5aa86() {
    level endon("game_ended");
    self.owner endon("disconnect");
    assertex(self.owner function_3265a4a8a3bdb477("tacCam"), "Tried to make a camera available that is not in the camera list.");
    /#
        self.owner thread function_ba3f7afe898c7a7f();
    #/
    self.owner function_57b6e09eda0090d6(1);
    self.owner setclientomnvar("ui_mgl_tac_camera_state", 1);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf26
// Size: 0x195
function function_f730b242ebab274b(grenade) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("death");
    relaunchvelocity = getdvarint(@"hash_143ebf37dc99e63", 150);
    stuckdata = undefined;
    while (true) {
        stuckdata = function_7c5e1578b6fc9166(grenade);
        var_972c39a514f196d1 = stuckdata.var_972c39a514f196d1;
        var_82d5e3b42d0191c9 = stuckdata.var_82d5e3b42d0191c9;
        var_cb4d3248c7f2eadf = 0;
        if (isdefined(var_82d5e3b42d0191c9)) {
            if (var_82d5e3b42d0191c9 scripts\cp_mp\vehicles\vehicle::isvehicle() && var_82d5e3b42d0191c9 scripts\cp_mp\vehicles\vehicle::isvehiclekillstreak()) {
                if (var_82d5e3b42d0191c9.vehiclename == "pac_sentry" || var_82d5e3b42d0191c9.vehiclename == "radar_drone_recon" || var_82d5e3b42d0191c9.vehiclename == "assault_drone") {
                    var_cb4d3248c7f2eadf = 1;
                }
            }
        }
        if (isdefined(var_972c39a514f196d1)) {
            var_cb4d3248c7f2eadf = 1;
        }
        if (var_cb4d3248c7f2eadf) {
            var_a14ee21ea6c8793d = vectordot(anglestoup(grenade.angles), (0, 0, 1)) >= 0.99;
            velocityvector = anglestoup(grenade.angles) * relaunchvelocity;
            if (var_a14ee21ea6c8793d) {
                velocityvector += anglestoforward(grenade.angles) * relaunchvelocity;
            }
            grenade unlink();
            grenade = scripts\mp\utility\weapon::_launchgrenade(function_2e7f831f8c6f4b38(), grenade.origin, velocityvector, undefined, 1, grenade);
            continue;
        }
        break;
    }
    return stuckdata;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c4
// Size: 0x2f
function function_797384a578f0a453(grenade) {
    self endon("death");
    grenade endon("death");
    grenade endon("deployableCamera_returnStuck");
    self waittill("tacticalCamera_unset");
    grenade delete();
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10fb
// Size: 0x4c3
function private function_c778dfbe6301129a(grenade, superid) {
    self endon("tacticalCamera_unset");
    stuckdata = function_f730b242ebab274b(grenade);
    if (!isdefined(stuckdata)) {
        /#
            iprintlnbold("<dev string:x1c>");
        #/
        return;
    }
    var_7a2d144a06a00b97 = stuckdata.var_82d5e3b42d0191c9;
    position = grenade gettagorigin("tag_player");
    camera = function_ee24b83d39692536(grenade, var_7a2d144a06a00b97, position, "tactical_camera_turret_mp", "turret_tactical_camera_v0", "tacCam");
    grenade delete();
    if (!issuperready()) {
        self notify("tacticalCamera_camera_spawned");
    }
    if (level.teambased) {
        if (function_e60e9ce3b6484e52("tacCam")) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/TACTICAL_CAMERA_MAX_TEAM_NUM");
            }
            camera thread function_98d9692f988bfe4d();
            refundsuper();
            return;
        }
    }
    camera endon("death");
    camera.hasexploded = 0;
    if (isdefined(stuckdata.isunderwater)) {
        camera.isunderwater = 1;
    }
    camera thread function_b3b59c099f93a503();
    camera.isingraceperiod = 1;
    camera thread function_ea7d2b522e1e6e1a();
    camera.issuper = 1;
    camera.superid = level.superglobals.staticsuperdata[superid].id;
    camera.equipmentref = "equip_tac_camera";
    camera.creationtime = gettime();
    camera.ownerteam = grenade.owner.team;
    camera.bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_tac_camera");
    if (issharedfuncdefined("deployable_camera", "attachXRays")) {
        camera = [[ getsharedfunc("deployable_camera", "attachXRays") ]](camera);
    }
    camera.damagecallback = &function_27fc17900940ca2a;
    camera function_23cf186c8b512748();
    thread function_da29e274cc4a86f4(camera);
    function_9cd4393cac778989(camera, undefined, 1);
    function_99f14479415346e9(camera);
    waitframe();
    thread function_cef7db6abfe1ceeb(camera);
    function_9c46884fe9337fa7(camera);
    camera thread function_45a7e0edc973d037();
    if (issharedfuncdefined("game", "clearOOB")) {
        [[ getsharedfunc("game", "clearOOB") ]](camera, 1);
    }
    thread function_8409d7ce07f426a1(camera);
    if (isdefined(camera.var_df8eab23e5a5a0b7[0])) {
        camera setleftarc(camera.var_df8eab23e5a5a0b7[0]);
    }
    if (isdefined(camera.var_df8eab23e5a5a0b7[1])) {
        camera setrightarc(camera.var_df8eab23e5a5a0b7[1]);
    }
    if (isdefined(camera.var_3ebf8c1ae3acce22[1])) {
        camera setbottomarc(camera.var_3ebf8c1ae3acce22[1]);
    }
    if (isdefined(camera.var_3ebf8c1ae3acce22[0])) {
        camera settoparc(camera.var_3ebf8c1ae3acce22[0]);
    }
    if (true) {
        thread scripts\mp\weapons::outlineequipmentforowner(camera);
    }
    if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        camera function_fe1cd71ed406a649();
    }
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&function_afaefcf7b894e66);
    camera setscriptablepartstate("plant", "on", 0);
    camera setscriptablepartstate("ddos", "neutral", 0);
    camera scripts\cp_mp\emp_debuff::set_start_emp_callback(&function_8b1c76d70cb37943);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        camera [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_8b1c76d70cb37943);
    }
    camera enableplayermarks("equipment");
    if (level.teambased) {
        camera filteroutplayermarks(self.team);
    } else {
        camera filteroutplayermarks(self);
    }
    var_4a2fe2f78500abd6 = camera function_6436809a4ed7e363();
    if (var_4a2fe2f78500abd6) {
        thread function_45556aa41f4f9ae8(camera, camera.ownerindex, 1);
    } else if (issharedfuncdefined("hud", "showErrorMessage")) {
        [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/TACTICAL_CAMERA_INVALID_DEPLOYMENT");
    }
    camera function_49197cd063a740ea(&function_fb4a392282a75942);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread scripts\common\elevators::function_5c07037726ae5001(camera);
        }
    }
    camera function_eb2ca6da697da5d();
    camera thread function_5e8b74f5e3dc4c60();
    return camera;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c7
// Size: 0x3f
function function_98d9692f988bfe4d(attacker, wasdestroyed) {
    self notify("explode");
    self.hasexploded = 1;
    self setscriptablepartstate("damaged", "off", 0);
    function_fb4a392282a75942();
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160e
// Size: 0xd3
function function_fb4a392282a75942(immediate, var_1548b5d7f8624206, var_86b37b7a946b6a67) {
    if (!isdefined(immediate)) {
        immediate = !istrue(self.planted);
    }
    var_cbf7be4f62a0ddb2 = 0;
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        if (!isdefined(var_86b37b7a946b6a67)) {
            var_86b37b7a946b6a67 = function_66758c7fff976896();
        }
        if (!istrue(var_1548b5d7f8624206) && !var_86b37b7a946b6a67) {
            self.owner thread function_45556aa41f4f9ae8(self, self.ownerindex, 3, undefined, 3.25);
            self.owner notify("camera_destroyed");
        }
        self setscriptablepartstate("destroyed", "on", 0);
        function_6976f2b3945c32f("tacCam");
        function_7abfae4e338cc940(self.owner, &function_c969b8d603818cfc);
        thread function_84ab622261b746e3(var_86b37b7a946b6a67);
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16e9
// Size: 0x1e
function private function_66b731696d3bc6b8() {
    function_57b6e09eda0090d6(0);
    function_86b60845e9a3d301("tacCam");
    self notify("tacticalCamera_allCamerasRemoved");
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170f
// Size: 0x158
function function_84ab622261b746e3(var_86b37b7a946b6a67) {
    self notify("death");
    self.isdestroyed = 1;
    self setcandamage(0);
    if (isdefined(self.owner)) {
        self.owner scripts\mp\weapons::removeequip(self);
    }
    function_67240db2bf930ccd();
    function_fc9294ffbd3490f3();
    if (isdefined(self.owner) && !istrue(var_86b37b7a946b6a67)) {
        self.owner setclientomnvar("ui_mgl_tac_camera_state", 0);
        function_4be323b74b86dbc9(self);
        if (!self.owner function_3265a4a8a3bdb477("tacCam")) {
            self.owner function_66b731696d3bc6b8();
        }
        self.owner function_f5cda4da64c5c579(self);
    }
    if (isdefined(self.watcher_tag)) {
        self.watcher_tag delete();
    }
    self.var_df8eab23e5a5a0b7 = undefined;
    self.tag = undefined;
    self.watcher_tag = undefined;
    self.isdamaged = undefined;
    self setturretowner(undefined);
    if (!istrue(var_86b37b7a946b6a67)) {
        self.owner scripts\cp_mp\challenges::function_d997435895422ecc("super_tac_camera", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.usedcount);
    }
    self.usedcount = undefined;
    wait 0.1;
    self delete();
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186f
// Size: 0x11
function function_7acc5aa2b73fe93b() {
    return self.var_7d73cbb5ca5d6e32["tacCamCluster"];
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1889
// Size: 0x1c
function private function_fb30706d5e4a4b27(val) {
    self.var_7d73cbb5ca5d6e32["tacCamCluster"] = val;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18ad
// Size: 0x10
function private function_c3d0ccb8f9a3d594() {
    self setclientomnvar("ui_block_fu_not_ready_error", 1);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18c5
// Size: 0x2b
function private function_ea7d2b522e1e6e1a() {
    level endon("game_ended");
    self endon("death");
    waittill_notify_or_timeout("tactical_camera_has_been_piloted", 3);
    self.isingraceperiod = 0;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f8
// Size: 0x2d
function function_c969b8d603818cfc(markdata, player) {
    if (markdata.markingent == self) {
        function_47c44d1bf801b8f0(markdata, player, 0);
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192d
// Size: 0xd
function function_a6302bc4d39a6fa() {
    return function_c827c58258222d48("tacCam");
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1943
// Size: 0x52
function function_a6c751ed1df3bf48(owner) {
    if (!isdefined(level.gametypebundle) || !istrue(level.gametypebundle.var_5b66ed80c98f795b)) {
        return;
    }
    level endon("game_ended");
    owner endon("camera_destroyed");
    owner waittill("death_or_disconnect");
    function_fb4a392282a75942(1, 0);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x199d
// Size: 0xc6
function private function_8ed527b613b0077e(var_c380eb54a8adb38c) {
    cameragroup = [[ var_c380eb54a8adb38c ]]();
    var_922b0ed93b663936 = "ui_tactical_camera_" + "pilot";
    self setclientomnvar(var_922b0ed93b663936, undefined);
    self setclientomnvar("ui_tactical_camera_" + "can_detonate_c4", 0);
    self setclientomnvar("ui_tactical_camera_" + "index", 0);
    for (i = 0; i < 10; i++) {
        var_1004988ab02e2b5a = "ui_tactical_camera_" + string(i) + "_location";
        var_dd13ad74bc01d314 = "ui_tactical_camera_" + string(i) + "_status";
        self setclientomnvar(var_1004988ab02e2b5a, -1);
        self setclientomnvar(var_dd13ad74bc01d314, 0);
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a6b
// Size: 0x54
function private function_d423bb11a1cf19a5(camera) {
    self endon("disconnect");
    level endon("game_ended");
    self endon("usingCamera");
    camera endon("death");
    while (true) {
        if (istrue(self.isusingcamera)) {
            self setclientomnvar("ui_killstreak_countdown", camera.batterytime);
        }
        waitframe();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ac7
// Size: 0x33
function private function_55c50ee365c1cd12(camera, currenttime) {
    waitframe();
    health = camera function_c0c307fac6611f33();
    self setclientomnvar("ui_killstreak_health", health);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b02
// Size: 0x3e
function private function_e105aca0d2b82e2e(camera, cameragroup) {
    idx = camera.cameraindex;
    if (isdefined(idx)) {
        self setclientomnvar("ui_tactical_camera_index", idx + 1);
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b48
// Size: 0xba
function private function_a3d6f92e2c44200f() {
    level endon("game_ended");
    self endon("stopMonitoringCamera");
    self endon("death_or_disconnect");
    while (true) {
        camera = level waittill("tacticalCamera_location_changed");
        cameragroup = function_a6302bc4d39a6fa();
        idx = array_find(cameragroup, camera);
        if (isdefined(idx)) {
            var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(idx) + "_location";
            if (isdefined(camera.areaid) && camera.areaid >= 0) {
                self setclientomnvar(var_e9d476a3809cb3f1, camera.areaid);
            } else {
                self setclientomnvar(var_e9d476a3809cb3f1, -1);
            }
        }
        waitframe();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c0a
// Size: 0xae
function private function_b327b26a701cfa7a(player, index) {
    level endon("game_ended");
    player endon("disconnect");
    self endon("death");
    player endon("stopMonitoringCamera");
    while (true) {
        newstatus = function_3ecfbd63a3e3bed3(player);
        if (!isdefined(self.status) || isdefined(self.status) && newstatus != self.status) {
            self.status = newstatus;
            var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(index) + "_status";
            player setclientomnvar(var_e9d476a3809cb3f1, self.status);
        }
        waitframe();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cc0
// Size: 0x160
function private function_9f19db59e1560978(_camera, cameragroup) {
    var_f2a82f1e1affde6e = "_is_piloted";
    var_52b021daecb30118 = "_location";
    function_e105aca0d2b82e2e(_camera, cameragroup);
    foreach (camera in cameragroup) {
        cameraindex = camera.cameraindex;
        assertex(isdefined(camera.cameraindex), "Camera does not have a valid camera index. Please check addToTeamCameras() to make sure cameras are being setup correctly.");
        if (!isdefined(camera.cameraindex)) {
            continue;
        }
        function_8cfb97ae498ab61e(camera, cameraindex);
        if (isdefined(camera.pilot)) {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + var_f2a82f1e1affde6e, 1);
        } else {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + var_f2a82f1e1affde6e, 0);
        }
        if (isdefined(camera.areaid) && camera.areaid >= 0) {
            self setclientomnvar("ui_tactical_camera_" + string(cameraindex) + var_52b021daecb30118, camera.areaid);
            continue;
        }
        self setclientomnvar("ui_tactical_camera_" + string(cameraindex) + var_52b021daecb30118, -1);
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e28
// Size: 0x65
function private function_8cfb97ae498ab61e(camera, index) {
    status = camera function_3ecfbd63a3e3bed3(self);
    camera.status = status;
    var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(index) + "_status";
    self setclientomnvar(var_e9d476a3809cb3f1, status);
    camera thread function_b327b26a701cfa7a(self, index);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e95
// Size: 0x41
function private function_eb71a2588d9d796a(camera) {
    if (isdefined(camera.pilot)) {
        self setclientomnvar("ui_tactical_camera_pilot", camera.pilot);
        return;
    }
    self setclientomnvar("ui_tactical_camera_pilot", undefined);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ede
// Size: 0x90
function private function_8dd9912ef55fbe3b(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    camera endon("death");
    while (true) {
        pilotedcam = level waittill("camera_piloted");
        if (pilotedcam == camera) {
            function_eb71a2588d9d796a(camera);
        }
        cameragroup = function_a6302bc4d39a6fa();
        idx = array_find(cameragroup, pilotedcam);
        if (isdefined(idx)) {
            self setclientomnvar("ui_tactical_camera_" + idx + "_is_piloted", 1);
        }
        waitframe();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f76
// Size: 0x8f
function private function_8f6ac6112bc43b15(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    camera endon("death");
    while (true) {
        var_b53d41c47a512505 = level waittill("tacticalCamera_pilot_removed");
        if (var_b53d41c47a512505 == camera) {
            function_eb71a2588d9d796a(camera);
        }
        cameragroup = function_a6302bc4d39a6fa();
        idx = array_find(cameragroup, var_b53d41c47a512505);
        if (isdefined(idx)) {
            self setclientomnvar("ui_tactical_camera_" + idx + "_is_piloted", 0);
        }
        waitframe();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200d
// Size: 0x1a7
function function_daf83774b715c487(markdata, camuser, target, targettype, useheadicon, useoutline) {
    level endon("game_ended");
    camuser endon("disconnect");
    self.owner endon("disconnect");
    self endon("explode");
    markdata.reconmarked = 1;
    self.markingtarget = undefined;
    camuser stoplocalsound("equip_tactical_cam_marking");
    camuser playlocalsound("equip_tactical_cam_marked");
    self setscriptablepartstate("marking_target", "off", 0);
    success = function_6f8fb8f7f63e5164(markdata, camuser, 1, 0);
    if (!success) {
        return 0;
    }
    if (isplayer(camuser)) {
        camuser scripts\mp\utility\stats::incpersstat("tacCamMarks", 1);
    }
    self.usedcount++;
    function_88b3522bbdf2f7c1(0);
    function_88b3522bbdf2f7c1(1);
    markergroup = camuser function_89b59bedb3802e41();
    function_ec57e0acbc6c6879(markergroup, target, 2);
    self.owner scripts\cp_mp\challenges::function_d997435895422ecc("super_tac_camera", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
    namespace_8361bad7391de074::function_815a3dcb943176b3(self.owner, target);
    timeout = 5;
    if (issharedfuncdefined("perk", "hasPerk")) {
        if (self.owner [[ getsharedfunc("perk", "hasPerk") ]]("specialty_improved_target_mark")) {
            timeout += 2;
        }
    }
    thread function_6643dd06cf63b76a(markdata, camuser, timeout, 0);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21bc
// Size: 0x2a
function function_a60052d904a2d492(target) {
    markdelay = getdvarfloat(@"hash_4ed00d07f5187137", 0.3);
    return markdelay;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ef
// Size: 0xd8
function function_1ee10c87668846d9(target, targettype) {
    if (!isdefined(self.markedentitieslifeindicices)) {
        self.markedentitieslifeindicices = [];
    }
    entitynum = target getentitynumber();
    lifeindex = ter_op(isdefined(self.matchdatalifeindex), self.matchdatalifeindex, 0);
    thread function_3a942d83b1617a65(target);
    if (!isdefined(self.markedentitieslifeindicices[entitynum]) || self.markedentitieslifeindicices[entitynum] > lifeindex) {
        self.markedentitieslifeindicices[entitynum] = lifeindex;
        if (issharedfuncdefined("player", "doScoreEvent")) {
            function_c84cfcb1299f9b39() thread [[ getsharedfunc("player", "doScoreEvent") ]](hashcat(#"hash_c692976b76d1b3c6", targettype, "_marked"));
        }
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22cf
// Size: 0xc3
function function_3a942d83b1617a65(target) {
    level endon("game_ended");
    self endon("death");
    target endon("disconnect");
    result = target scripts\engine\utility::waittill_notify_or_timeout_return("death", 5);
    targetdead = result == "death" || !isalive(target);
    if (targetdead && isdefined(target.lastkilledby) && target.lastkilledby != self.owner) {
        if (issharedfuncdefined("player", "doScoreEvent")) {
            camcontroller = function_c84cfcb1299f9b39();
            camcontroller thread [[ getsharedfunc("player", "doScoreEvent") ]]("tactical_camera_enemy_killed_assist");
        }
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x239a
// Size: 0x114
function private function_c0d6ea536d1aa6e3() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("monitoringCamActivation");
    self endon("monitoringCamActivation");
    self endon("tacticalCamera_unset");
    while (true) {
        success = function_30dd206c5d9b45a7();
        if (!success) {
            continue;
        }
        if (!function_84582dd92c385507(function_2e7f831f8c6f4b38())) {
            continue;
        }
        if (issuperready() && !istrue(self.var_75b981560f8453f4)) {
            continue;
        }
        grenade = undefined;
        cameracluster = function_7acc5aa2b73fe93b();
        if (!isdefined(cameracluster)) {
            continue;
        } else if (isdefined(cameracluster) && cameracluster.size == 0) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/TACTICAL_CAMERA_OUT_OF_RANGE");
            }
            continue;
        } else {
            var_a11e3eb9a5212fcb = sortbydistance(function_7acc5aa2b73fe93b(), self.origin);
            cam = var_a11e3eb9a5212fcb[0];
        }
        if (isdefined(cam)) {
            thread function_5d3cbe464806a795(cam);
        }
        waitframe();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24b6
// Size: 0x1e
function function_1af63adb97f131a1(objweapon) {
    function_eb1f8c19d4194ac3(objweapon, &function_7acc5aa2b73fe93b, function_2e7f831f8c6f4b38());
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24dc
// Size: 0x159
function private function_5d3cbe464806a795(camera) {
    level endon("game_ended");
    self endon("disconnect");
    function_9cd4393cac778989(camera);
    self.deployingcamera = 1;
    var_783b392bd5803792 = getdvarfloat(@"hash_83f60684c63746be", 0);
    deployresult = namespace_49492dacb8708592::function_cfec51cac79ca4e6(getcurrentsuper(), undefined, undefined, undefined, undefined, undefined, 0, var_783b392bd5803792, undefined, 1);
    self.var_75b981560f8453f4 = undefined;
    if (!istrue(deployresult)) {
        self.deployingcamera = 0;
        return 0;
    }
    if (!isdefined(camera) || istrue(camera.isdestroyed)) {
        self.deployingcamera = 0;
        self notify("super_finished_with_deploy_weapon");
        return 0;
    }
    scripts\cp_mp\utility\killstreak_utility::movingplatform_playerlink(self);
    if (isdefined(camera.var_df8eab23e5a5a0b7[0])) {
        camera setleftarc(camera.var_df8eab23e5a5a0b7[0]);
    }
    if (isdefined(camera.var_df8eab23e5a5a0b7[1])) {
        camera setrightarc(camera.var_df8eab23e5a5a0b7[1]);
    }
    if (isdefined(camera.var_3ebf8c1ae3acce22[1])) {
        camera setbottomarc(camera.var_3ebf8c1ae3acce22[1]);
    }
    if (isdefined(camera.var_3ebf8c1ae3acce22[0])) {
        camera settoparc(camera.var_3ebf8c1ae3acce22[0]);
    }
    thread function_a10d1d70759f9e83(camera);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x263d
// Size: 0x258
function private function_a10d1d70759f9e83(camera, forcewatcher) {
    self.deployingcamera = 0;
    if (!function_e5a484f7c5faf5b(camera)) {
        self notify("cancel_all_super_deployments");
        return 0;
    }
    function_4789702c319cd7a7(camera);
    self painvisionoff();
    camera notify("entering");
    self notify("usingCamera");
    if (!istrue(camera.hasbeenused)) {
        camera.hasbeenused = 1;
        camera notify("tactical_camera_has_been_piloted");
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (getsubgametype() == "dmz" || getsubgametype() == "exgm")) {
        self setclientomnvar("ui_dmz_hide_inventory", 1);
    }
    self setclientomnvar("ui_mgl_tac_camera_state", 2);
    self.isusingcamera = 1;
    self.currentcamera = camera;
    function_81704d1224bd6fe0(self.isusingcamera);
    cameragroup = function_a6302bc4d39a6fa();
    thread function_9f19db59e1560978(camera, cameragroup);
    thread function_89cdd7bec6a758ee();
    thread function_a3d6f92e2c44200f();
    thread function_44722ffcc8fe65de();
    function_57b6e09eda0090d6(0, 1);
    thread function_e170d8c3cacdbaf5(camera, "tacticalCamera_unset", "tacCam");
    self setclientomnvar("ui_rcd_outer_ring", 0);
    thread function_55c50ee365c1cd12(camera);
    thread function_d423bb11a1cf19a5(camera);
    thread function_c7dbea1f56df2b64(camera, "tacCam");
    thread function_ff216d4d2c47565c(5);
    thread function_b0210563a392f1a1(camera);
    thread function_b1fc1520e09105aa(camera);
    thread function_9ac601e206d92def(camera, undefined, "tacCam");
    thread function_2699a7c2c0b71d3e(camera, "tacCam");
    thread function_73af051ec0973e1(camera, "tacCamCluster", "tacCam");
    camera thread function_a6c751ed1df3bf48(self);
    if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
        self setclientomnvar("ui_br_inventory_disabled", 1);
    }
    thread function_97a30ae5803a8886(camera, forcewatcher);
    thread function_ef76557bfc468ad7("tacticalCamera_allCamerasRemoved", camera);
    namespace_5890eaf13eeb48fa::killstreak_savenvgstate();
    if (!isdefined(camera.sfx) && istrue(self.isusingcamera)) {
        self function_e29e60c655e1220b(1);
        camera.sfx = spawn("script_origin", camera.origin);
        camera.sfx showonlytoplayer(self);
        camera.sfx playloopsound("equip_tactical_cam_amb_lp");
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x289d
// Size: 0x5f
function private function_89cdd7bec6a758ee() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (true) {
        camera, addedindex = level waittill("tacticalCamera_camera_added");
        if (camera.ownerteam == self.team) {
            function_8cfb97ae498ab61e(camera, addedindex);
        }
        waitframe();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2904
// Size: 0x5c
function private function_44722ffcc8fe65de() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (true) {
        camera, cameraindex = level waittill("tacticalCamera_camera_removed");
        if (function_b501ce7305720779(camera)) {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + "_status", 0);
        }
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2968
// Size: 0x25f
function private function_96ecbf2f7e001e7(camera, isswitching, nosensor) {
    if (istrue(self.isusingcamera)) {
        stopwatchingthermalinputchange();
        if (isreallyalive(self)) {
            scripts\cp_mp\utility\killstreak_utility::starttabletscreen("super_tac_camera", 0, 1);
            self setclientomnvar("ui_total_fade", 0);
        }
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (getsubgametype() == "dmz" || getsubgametype() == "exgm")) {
            self setclientomnvar("ui_dmz_hide_inventory", 0);
        }
        if (!istrue(isswitching)) {
            function_eca023ad97260f51(camera);
            self painvisionon();
            self notify("super_finished_with_deploy_weapon");
            self.isusingcamera = 0;
            self.currentcamera = undefined;
            if (function_3265a4a8a3bdb477("tacCam")) {
                function_57b6e09eda0090d6(1);
            }
            self notify("playerExitingCameraMode");
            thread function_7858aa4f2bc91d80();
        }
        if (function_58a0cad2aba60238(camera)) {
            thread function_1e34b5a5489be90(camera, isswitching, "tacCam");
        } else {
            thread function_b4e750dbd5734b12(camera, isswitching);
        }
        if (isdefined(camera) && !isdefined(camera.pilot) && (!isdefined(camera.watchers) || camera.watchers.size == 0)) {
            if (!istrue(nosensor)) {
                camera setscriptablepartstate("autopiloted", "on", 0);
                camera thread function_c99b3a2b715c288b();
                camera setmode("sentry_offline");
                camera restoredefaultdroppitch();
            }
        }
        self.var_1a7488645f360cb1 = 0;
        function_8ed527b613b0077e(&function_a6302bc4d39a6fa);
        if (isreallyalive(self)) {
            function_81704d1224bd6fe0(0);
        }
        function_13e2543cd1847ca6();
        function_57e0efe2f886bd46();
        if (isdefined(camera)) {
            camera function_ea3e848c25e3c926(self, undefined, "super_tac_camera");
            camera showtoplayer(self);
        }
    }
    thread function_7df57541f06a5f0();
    namespace_5890eaf13eeb48fa::killstreak_restorenvgstate();
    self notify("stopMonitoringCamera");
    self setclientomnvar("ui_mgl_tac_camera_state", 1);
    if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
        self setclientomnvar("ui_br_inventory_disabled", 0);
    }
    scripts\cp_mp\utility\killstreak_utility::movingplatform_playerunlink(self);
    if (isdefined(camera)) {
        self notify("stopMonitoringReticleState");
    }
    self notify("playerLeavingCurrentCamera");
    self function_e29e60c655e1220b(0);
    if (isdefined(camera.sfx)) {
        camera.sfx stoploopsound("equip_tactical_cam_amb_lp");
        camera.sfx delete();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bcf
// Size: 0x220
function private function_97a30ae5803a8886(camera, forcewatcher) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    camera endon("death");
    if (!istrue(self.isusingcamera)) {
        return;
    }
    if (isdefined(camera.pilot) && camera.pilot != self && camera.owner == self) {
        oldpilot = camera.pilot;
        oldpilot function_96ecbf2f7e001e7(camera, 1, 1);
        oldpilot thread function_a10d1d70759f9e83(camera, 1);
    }
    if (isdefined(camera.pilot) || istrue(forcewatcher)) {
        if (!isdefined(camera.watchers)) {
            camera.watchers = [];
        }
        camera.watchers[self getentitynumber()] = self;
        camera.var_1b381f3aa944d595[self getentitynumber()] = gettime();
        function_c9ad5aaf3183b83c();
        self lerpfov(80, 0);
        self cameralinkto(camera.watcher_tag, "tag_origin", 1, 1);
    } else {
        level notify("camera_piloted", camera);
        camera.pilot = self;
        thread function_804a24f3e1a7b680();
        thread function_2f4e45ab83f0b424(camera);
        camera setscriptablepartstate("piloted", "on", 0);
        camera setscriptablepartstate("autopiloted", "off", 0);
        camera setmode("manual");
        self remotecontrolturret(camera);
        self.var_1a7488645f360cb1 = 1;
        function_c9ad5aaf3183b83c();
        function_7abfae4e338cc940(self, &function_f1493744aa061205);
        thread function_fc89b224136fe202(camera);
        camera thread function_54dea0f6292103cb();
        thread function_a96f380b39543647(camera);
        camera thread function_ca19a92a4f9d5c3d("tacCam");
    }
    function_eb71a2588d9d796a(camera);
    thread function_8dd9912ef55fbe3b(camera);
    thread function_8f6ac6112bc43b15(camera);
    thread function_e910b2eba1af834c();
    camera function_ea3e848c25e3c926(self, undefined, "super_tac_camera");
    if (camera scripts\cp_mp\emp_debuff::is_empd() || istrue(camera.ksempd)) {
        function_9f25ae386db6338a(camera);
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2df7
// Size: 0x1f
function private function_afaefcf7b894e66(player) {
    function_8b5781dd2d18a300(player);
    function_f7a32619bba6e450("tacCam");
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1e
// Size: 0x32
function function_8b1c76d70cb37943(data) {
    var_c0754ca9aa8976da = getdvarfloat(@"hash_1818fb198fa739fb", 1);
    function_5a7867448f866939(data, var_c0754ca9aa8976da);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e58
// Size: 0x32
function function_3888b35ba7e2f0a9(data) {
    function_1be0d458243b1ee1(data.attacker);
    thread function_98d9692f988bfe4d(data.attacker, 1);
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e92
// Size: 0x79
function function_27fc17900940ca2a(var_8c27391c5d49580c) {
    self.owner setclientomnvar("ui_killstreak_health", (function_c0c307fac6611f33() - var_8c27391c5d49580c) / self.maxhealth);
    if (self.damagetaken + var_8c27391c5d49580c / self.maxhealth > 0.5) {
        if (!istrue(self.isdamaged)) {
            self.isdamaged = 1;
            self setscriptablepartstate("damaged", "on", 0);
        }
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f13
// Size: 0x20
function function_c0c307fac6611f33() {
    return int(max(0, self.maxhealth - self.damagetaken));
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3c
// Size: 0x59
function function_1be0d458243b1ee1(attacker) {
    if (!isdefined(self.owner) || scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, attacker)) {
        attacker notify("destroyed_equipment");
        attacker thread scripts\mp\utility\points::doScoreEvent(#"destroyed_equipment");
        attacker thread scripts\mp\battlechatter_mp::onfieldupgradedestroy(#"hash_511ac9e9a1a18d8");
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f9d
// Size: 0xd
function function_391f2c842bce6b0a() {
    return function_3265a4a8a3bdb477("tacCam");
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb3
// Size: 0x52
function function_816f56a680e52d71() {
    pullbackweapon = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
    if (isdefined(pullbackweapon) && isdefined(pullbackweapon.basename) && pullbackweapon.basename == "tac_camera_mp") {
        _takeweapon(pullbackweapon);
        wait 0.05;
        refundsuper();
    }
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300d
// Size: 0xd4
function function_eb2ca6da697da5d() {
    if (!isdefined(level.mapname) || level.mapname != "mp_bio_lab") {
        return;
    }
    if (!isdefined(self.owner)) {
        return 0;
    }
    securityareas = level.var_f2a8e4a4af870513;
    securityvolumes = level.var_29ced2d4d9a0bde;
    for (i = 0; i < securityareas.size; i++) {
        area = securityareas[i];
        var_56945679b4f26db9 = securityareas[i] == "lv3_security_storage_lab";
        triggerent = level.var_29ced2d4d9a0bde[area];
        if (!var_56945679b4f26db9) {
            continue;
        }
        if (self istouching(triggerent)) {
            namespace_8361bad7391de074::function_a3e1795e126d3738(self.owner);
            return 1;
        }
        break;
    }
    return 0;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ea
// Size: 0x20
function function_2e7f831f8c6f4b38() {
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        return ("tac_camera_mp" + "_mgl");
    }
    return "tac_camera_mp";
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3112
// Size: 0x15
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace tactical_camera / namespace_ec12f2e19aa34cc8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x312f
// Size: 0x2b
function tacticalCamera_Hack(hacker) {
    if (istrue(self.exploding)) {
        return;
    }
    hacker scripts\mp\killstreaks\killstreaks::givescoreforhack();
    function_fb4a392282a75942(1, 0);
}

/#

    // Namespace tactical_camera / namespace_ec12f2e19aa34cc8
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3162
    // Size: 0x22
    function function_ba3f7afe898c7a7f() {
        level endon("<dev string:x5a>");
        self endon("<dev string:x65>");
        self notify("<dev string:x70>");
        self endon("<dev string:x70>");
    }

#/
