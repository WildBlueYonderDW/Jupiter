#using script_1311c5c284dd1537;
#using script_202d9f0ea7db3a23;
#using script_2aabac61f2ae422;
#using script_5762ac2f22202ba2;
#using script_58be75c518bf0d40;
#using script_736dec95a49487a6;
#using scripts\common\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\utility;
#using scripts\mp\equipment\flash_grenade;
#using scripts\mp\perks\perks;
#using scripts\mp\supers;
#using scripts\mp\utility\disconnect_event_aggregator;
#using scripts\mp\utility\game;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\points;
#using scripts\mp\utility\teams;
#using scripts\mp\weapons;

#namespace namespace_67edc9bc3f0c6230;

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e9
// Size: 0x5a
function function_c35f8fe1f419bb40() {
    level._effect["vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx"] = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    function_5d36462331845d5f("reconDartList");
    level.var_bb0266f422d9afa3["reconDart"] = spawnstruct();
    function_b1ed6e7b94cf2a7e();
    function_ec06e376c416317();
    function_ea90ebad8b7a7a9();
    thread function_c1a14856aebb53f0();
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94b
// Size: 0x1db
function function_b1ed6e7b94cf2a7e() {
    leveldata = function_f0698aee89c18210("reconDart");
    leveldata.supername = "super_tac_camera";
    leveldata.lifetime = getdvarint(@"hash_13717e6e87cb530f", 120);
    leveldata.startfunc = &function_a10d1d70759f9e83;
    leveldata.exitfunc = &function_1d751f90a61b1801;
    leveldata.destroyfunc = &function_986aa37bc2622d44;
    leveldata.var_e04bd0ddc6ec05b = &function_4ccb840525638e85;
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
    leveldata.groupnameteams = "reconDartList";
    leveldata.groupnameplayer = "reconDarts";
    leveldata.var_1790d4c69d5f45a4 = 3;
    leveldata.additionnotification = "tacticalCamera_camera_added";
    leveldata.removalnotification = "tacticalCamera_camera_removed";
    leveldata.var_315c43d476bb095 = "tacticalCamera_location_changed";
    leveldata.var_36411d05d3f1e503 = "tacticalCamera_pilot_removed";
    leveldata.headiconname = "hud_icon_fieldupgrade_tac_cam";
    leveldata.markingsfx = "equip_tactical_cam_marking";
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2e
// Size: 0x198
function function_ec06e376c416317() {
    leveldata = function_f0698aee89c18210("reconDart");
    leveldata.firetypes = [];
    leveldata.firetypeweights = [];
    leveldata.sfxduration = [];
    leveldata.var_e5f140d112ac9f48 = [];
    leveldata.fireintervalmin = [];
    leveldata.fireintervalmax = [];
    leveldata.var_f6f38f14951d15fa = getdvarfloat(@"hash_d3926f8c39ca520b", 4);
    leveldata.var_32ba1548cc879801 = getdvarfloat(@"hash_939f680c8b7bd4a7", 2);
    leveldata.var_c6c0c9d205c3a9d7 = getdvarint(@"hash_9f5973a323881a4d", 3);
    leveldata.var_5f90e570a199b76f = getdvarfloat(@"hash_8241b785c55eeeb3", 800);
    leveldata.firetypes[leveldata.firetypes.size] = "ar";
    leveldata.sfxduration["ar"] = 0.4;
    leveldata.firetypeweights["ar"] = getdvarint(@"hash_6d05892e26e1bc20", 35);
    leveldata.var_e5f140d112ac9f48["ar"] = getdvarint(@"hash_637f35bce33c662c", 3);
    leveldata.fireintervalmin["ar"] = getdvarfloat(@"hash_be611222e6bccfa6", 0.5);
    leveldata.fireintervalmax["ar"] = getdvarfloat(@"hash_be842422e6e33ef4", 2);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcce
// Size: 0x146
function function_ea90ebad8b7a7a9() {
    leveldata = function_f0698aee89c18210("reconDart");
    leveldata.var_6ecec22397e50b64 = getdvarint(@"hash_21ae64f1d46824d0", 256);
    leveldata.flashmaxdist = getdvarint(@"hash_e48be2cef86f21dc", 540);
    leveldata.flashmindist = getdvarint(@"hash_e48be2cef86f21dc", 0);
    leveldata.var_250b70d11f662fe = leveldata.flashmaxdist - leveldata.flashmindist;
    leveldata.var_a3dcd4386e0e216b = getdvarint(@"hash_3704ca981a6134ee", -30);
    leveldata.var_c72edf49fca36b64 = getdvarint(@"hash_a8a0b941c08f9a33", 35);
    leveldata.var_40834efd8b5e0c85 = getdvarint(@"hash_c50e8210d6ccf9f4", 65);
    leveldata.flashmaxweight = leveldata.var_c72edf49fca36b64 + leveldata.var_40834efd8b5e0c85;
    leveldata.var_3526acfa98cbe798 = getdvarfloat(@"hash_7fde54a03cdd9b38", 3.6);
    leveldata.var_9a4d9ce87d4acfc7 = getdvarint(@"hash_ba62e8ebd3618c6", 1) == 1;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1c
// Size: 0x38
function function_c1a14856aebb53f0() {
    if (getdvarint(@"hash_6341b85ecd5b3f07", 0) != 1) {
        return;
    }
    while (true) {
        wait 1;
        function_b1ed6e7b94cf2a7e();
        function_ec06e376c416317();
        function_ea90ebad8b7a7a9();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5c
// Size: 0x71
function function_2cf7e1e0b6513c6f() {
    self notify("tacticalCamera_set");
    thread function_362c9a13d18031b1("personal_camera_status_updated", "ui_tactical_camera_cam_", "tacticalCamera_unset");
    function_81fb12166c3c0c2(self, undefined, &function_c46995e65d020fcc, "super_recon_dart");
    thread function_3c4da29d1ed157c7("tacCamCluster", "tacticalCamera_unset", "tacticalCamera_camera_removed", 9000000, &function_c46995e65d020fcc);
    if (!isbot(self) && !isagent(self)) {
        thread function_2e07a35180de2a29();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed5
// Size: 0x3a
function function_79893d5ed21ae366() {
    self notify("tacticalCamera_unset");
    function_f7a32619bba6e450("reconDart");
    function_8b5781dd2d18a300(self);
    function_81fb12166c3c0c2(self, 1, &function_c46995e65d020fcc, "super_recon_dart");
    function_fb30706d5e4a4b27(undefined);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf17
// Size: 0x55
function function_ec71c6a3676c9ee6(bolt, stuckto, position) {
    camera = function_97aee59be6c51c15(bolt, stuckto, position, "super_recon_dart");
    if (isdefined(camera)) {
        camera endon("death");
        camera thread function_1092ee52c1c5a6c();
        waitframe();
        camera thread function_c99b3a2b715c288b();
    }
    return camera;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xf75
// Size: 0x23b
function private function_97aee59be6c51c15(bolt, stuckto, position, superid) {
    self endon("disconnect");
    level endon("game_ended");
    camera = function_ee24b83d39692536(bolt, stuckto, position, "tactical_camera_turret_mp", "turret_recon_dart_v0", "reconDart");
    camera endon("death");
    camera.hasexploded = 0;
    self.isusingcamera = 0;
    camera thread function_b3b59c099f93a503();
    camera thread function_ea7d2b522e1e6e1a();
    camera.issuper = 1;
    camera.superid = level.superglobals.staticsuperdata[superid].id;
    camera.creationtime = gettime();
    camera.ownerteam = bolt.owner.team;
    if (issharedfuncdefined("deployable_camera", "attachXRays")) {
        camera = [[ getsharedfunc("deployable_camera", "attachXRays") ]](camera);
    }
    thread function_da29e274cc4a86f4(camera);
    if (!function_3265a4a8a3bdb477("reconDart")) {
        function_c3d0ccb8f9a3d594();
    }
    function_99f14479415346e9(camera);
    function_9c46884fe9337fa7(camera);
    waitframe();
    self notify("personal_camera_status_updated", camera, camera.ownerindex, 1);
    camera thread function_45a7e0edc973d037();
    if (issharedfuncdefined("game", "clearOOB")) {
        [[ getsharedfunc("game", "clearOOB") ]](camera, 1);
    }
    camera thread function_5e8b74f5e3dc4c60();
    function_9cd4393cac778989(camera);
    if (true) {
        thread scripts\mp\weapons::outlineequipmentforowner(camera);
    }
    if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        camera function_fe1cd71ed406a649();
    }
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&function_afaefcf7b894e66);
    camera setscriptablepartstate("ddos", "neutral", 0);
    camera namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_652247ce1acb67c2);
    camera scripts\cp_mp\emp_debuff::set_start_emp_callback(&function_8b1c76d70cb37943);
    camera enableplayermarks("equipment");
    if (level.teambased) {
        camera filteroutplayermarks(self.team);
    } else {
        camera filteroutplayermarks(self);
    }
    camera function_a839f4b0078f8f69();
    camera function_f7b712ced2dab1fc();
    return camera;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b9
// Size: 0x4c
function function_1092ee52c1c5a6c() {
    level endon("game_ended");
    self.owner endon("disconnect");
    assertex(self.owner function_3265a4a8a3bdb477("<dev string:x1c>"), "<dev string:x29>");
    self.owner function_57b6e09eda0090d6(1);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x120d
// Size: 0x81
function function_986aa37bc2622d44(immediate, var_1548b5d7f8624206) {
    if (!isdefined(immediate)) {
        immediate = !istrue(self.planted);
    }
    if (isdefined(self)) {
        if (!istrue(var_1548b5d7f8624206)) {
            self.owner notify("personal_camera_status_updated", self, self.ownerindex, 3);
        }
        self setscriptablepartstate("destroyed", "on", 0);
        function_6976f2b3945c32f();
        function_7abfae4e338cc940(self.owner, &function_c969b8d603818cfc);
        thread function_17dd1c4132e3e355();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1296
// Size: 0x2b
function private function_66b731696d3bc6b8() {
    function_57b6e09eda0090d6(0);
    self setclientomnvar("ui_tactical_camera_use", 0);
    function_86b60845e9a3d301("reconDart");
    self notify("reconDart_allCamerasRemoved");
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12c9
// Size: 0xd5
function function_17dd1c4132e3e355() {
    self notify("death");
    self.isdestroyed = 1;
    if (isdefined(self.owner)) {
        self.owner scripts\mp\weapons::removeequip(self);
    }
    function_67240db2bf930ccd();
    function_fc9294ffbd3490f3();
    if (isdefined(self.owner)) {
        function_4be323b74b86dbc9(self);
        if (!self.owner function_3265a4a8a3bdb477("reconDart")) {
            self.owner function_66b731696d3bc6b8();
        }
        self.owner function_f5cda4da64c5c579(self);
    }
    self.var_df8eab23e5a5a0b7 = undefined;
    self.tag = undefined;
    self.watcher_tag = undefined;
    self.isdamaged = undefined;
    self.useturret = undefined;
    self setturretowner(undefined);
    wait 0.1;
    self delete();
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a6
// Size: 0xca
function function_65c2611eff3a7dc4(camera) {
    self endon("disconnect");
    self endon("death");
    self endon("playerExitingCameraMode");
    self notify("cameraSelfDestructMonitored");
    self endon("cameraSelfDestructMonitored");
    while (true) {
        self notifyonplayercommand("selfDestruct", "+weapnext");
        self waittill("selfDestruct");
        if (!isdefined(camera) || istrue(camera.isdestroyed)) {
            return;
        }
        if (camera scripts\cp_mp\emp_debuff::is_empd()) {
            continue;
        }
        if (camera.pilot == self) {
            /#
                printtoscreen2d(180, 30, "<dev string:x6d>", (0, 0, 0), 2, 150);
            #/
            function_1d929b8e8487c576(camera);
            camera thread function_986aa37bc2622d44();
            return;
        }
        /#
            iprintlnbold("<dev string:x7f>");
        #/
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1478
// Size: 0x13
function function_a9ff1672fcc0b3f8() {
    self notifyonplayercommandremove("selfDestruct", "+weapnext");
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1493
// Size: 0x278
function function_1d929b8e8487c576(camera) {
    leveldata = function_f0698aee89c18210("reconDart");
    entmask = function_869ccb4e3451b8c6(["etype_player", "etype_ai"]);
    targetarray = function_b1eef70090b5b7b5(camera.origin, 1575, entmask);
    foreach (victim in targetarray) {
        if (!isdefined(victim)) {
            continue;
        }
        if (victim == self && !leveldata.var_9a4d9ce87d4acfc7) {
            continue;
        }
        dist = distance(victim.origin, camera.origin);
        weight = 0;
        if (victim _hasperk("specialty_stun_resistance") && victim != self) {
            updatedamagefeedback("hittacresist", undefined, undefined, undefined, 1);
            if (scripts\cp_mp\utility\player_utility::playersareenemies(victim, self)) {
                victim scripts\cp_mp\challenges::resistedstun(victim);
            }
            victim scripts\mp\perks\perks::activatePerk("specialty_tac_resist");
            victim thread scripts\mp\equipment\flash_grenade::applyflash(self, leveldata.var_3526acfa98cbe798);
            return;
        }
        dist = clamp(dist, leveldata.flashmindist, ter_op(victim == self, leveldata.var_6ecec22397e50b64, leveldata.flashmaxdist));
        distratio = 1 - (dist - leveldata.flashmindist) / leveldata.var_250b70d11f662fe;
        weight += floor(distratio * leveldata.var_40834efd8b5e0c85);
        if (scripts\engine\utility::within_fov(victim.origin, victim getplayerangles(), camera.origin, 0.5)) {
            weight += leveldata.var_c72edf49fca36b64;
        }
        if (!scripts\cp_mp\utility\player_utility::playersareenemies(victim, self)) {
            weight += leveldata.var_a3dcd4386e0e216b;
        }
        weight = max(0, weight);
        weightratio = weight / leveldata.flashmaxweight;
        minduration = 4;
        maxduration = 6;
        duration = minduration + (maxduration - minduration) * weightratio;
        victim thread scripts\mp\equipment\flash_grenade::applyflash(self, duration);
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1713
// Size: 0xcb
function function_3f78cc9ff3012d4d() {
    totalweightvalue = 0;
    maxweightvalues = [];
    leveldata = function_f0698aee89c18210("reconDart");
    for (i = 0; i < leveldata.firetypes.size; i++) {
        firetype = leveldata.firetypes[i];
        totalweightvalue += leveldata.firetypeweights[firetype];
        maxweightvalues[i] = totalweightvalue;
    }
    weightvalue = randomint(totalweightvalue);
    for (i = 0; i < maxweightvalues.size; i++) {
        if (weightvalue < maxweightvalues[i]) {
            self.firetype = leveldata.firetypes[i];
            return;
        }
    }
    assertmsg("<dev string:xb6>");
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e6
// Size: 0x13
function function_a839f4b0078f8f69() {
    self.decoyassists = 0;
    function_3f78cc9ff3012d4d();
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1801
// Size: 0xd
function function_f7b712ced2dab1fc() {
    self.var_9f0213aebf49e280 = 1;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1816
// Size: 0xc
function function_8cffe9d2b3560375() {
    self.var_9f0213aebf49e280 = 0;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x182a
// Size: 0xd4
function function_f8c09eabc74d0ca3(camera) {
    self endon("disconnect");
    self endon("death");
    self endon("playerExitingCameraMode");
    self notify("cameraDecoyNoiseMonitored");
    self endon("cameraDecoyNoiseMonitored");
    while (true) {
        self notifyonplayercommand("decoyNoiseCommand", "+attack");
        self waittill("decoyNoiseCommand");
        if (!isdefined(camera) || istrue(camera.isdestroyed)) {
            return;
        }
        if (camera.pilot == self) {
            if (!istrue(camera.var_9f0213aebf49e280)) {
                continue;
            }
            if (camera scripts\cp_mp\emp_debuff::is_empd()) {
                continue;
            }
            /#
                printtoscreen2d(180, 30, "<dev string:xec>", (0, 0, 0), 2, 150);
            #/
            camera thread function_825911430c0634a9(self);
            continue;
        }
        /#
            iprintlnbold("<dev string:x7f>");
        #/
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1906
// Size: 0x13
function function_66b4afa128decd2e() {
    self notifyonplayercommandremove("decoyNoiseCommand", "+attack");
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1921
// Size: 0xe3
function function_825911430c0634a9(triggerpilot) {
    self endon("death");
    self setscriptablepartstate("beacon", "active", 0);
    function_8cffe9d2b3560375();
    leveldata = function_f0698aee89c18210("reconDart");
    firecountleft = 1 + randomint(leveldata.var_e5f140d112ac9f48[self.firetype]);
    while (true) {
        firecountleft--;
        if (!scripts\cp_mp\emp_debuff::is_empd()) {
            function_f0d575a0a800d2b8(triggerpilot);
        }
        if (firecountleft == 0) {
            break;
        }
        wait randomfloatrange(leveldata.fireintervalmin[self.firetype], leveldata.fireintervalmax[self.firetype]);
    }
    self setscriptablepartstate("beacon", "neutral", 0);
    wait leveldata.var_f6f38f14951d15fa;
    function_f7b712ced2dab1fc();
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0c
// Size: 0xa1
function function_f0d575a0a800d2b8(triggerpilot) {
    leveldata = function_f0698aee89c18210("reconDart");
    firetype = self.firetype;
    self setscriptablepartstate("weaponFire", firetype + "Fire", 0);
    self setscriptablepartstate("weaponSounds", firetype + "Fire", 0);
    if (isdefined(self.ownerteam)) {
        pinglocationenemyteams(self.origin, self.ownerteam, self.owner);
    }
    function_b36c71c670b33b4(triggerpilot);
    wait leveldata.sfxduration[firetype];
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab5
// Size: 0x14b
function function_b36c71c670b33b4(triggerpilot) {
    leveldata = function_f0698aee89c18210("reconDart");
    entmask = function_869ccb4e3451b8c6(["etype_player", "etype_ai"]);
    targetarray = function_b1eef70090b5b7b5(self.origin, 1575, entmask);
    foreach (character in targetarray) {
        if (isplayer(character) && !character scripts\cp_mp\utility\player_utility::_isalive()) {
            continue;
        }
        if (!istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, character))) {
            continue;
        }
        if (isplayer(character)) {
            dist = distance(character.origin, self.origin);
            if (distance(character.origin, self.origin) > leveldata.var_5f90e570a199b76f) {
                continue;
            }
            thread function_9e2311feec72ec0(character, triggerpilot);
            continue;
        }
        character aieventlistenerevent("gunshot", self, self.origin);
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c08
// Size: 0xe9
function function_9e2311feec72ec0(player, triggerpilot) {
    player endon("disconnect");
    self endon("death");
    triggerpilot endon("disconnect");
    leveldata = function_f0698aee89c18210("reconDart");
    playerid = player getentitynumber();
    triggerpilot notify("reconDart_assitWaiting_" + playerid);
    triggerpilot endon("reconDart_assitWaiting_" + playerid);
    result = player scripts\engine\utility::waittill_notify_or_timeout_return("death", leveldata.var_32ba1548cc879801);
    if (isdefined(player.lastkilledby) && player.lastkilledby != triggerpilot) {
        if (result == "death" && scripts\cp_mp\utility\player_utility::playersareenemies(player, triggerpilot)) {
            if (self.decoyassists < leveldata.var_c6c0c9d205c3a9d7) {
                triggerpilot thread scripts\mp\utility\points::doScoreEvent("assist_decoy");
                self.decoyassists++;
            }
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1cf9
// Size: 0x11
function private function_7acc5aa2b73fe93b() {
    return self.var_7d73cbb5ca5d6e32["tacCamCluster"];
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1d13
// Size: 0x1c
function private function_fb30706d5e4a4b27(val) {
    self.var_7d73cbb5ca5d6e32["tacCamCluster"] = val;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d37
// Size: 0x10
function private function_c3d0ccb8f9a3d594() {
    self setclientomnvar("ui_tactical_camera_use", 1);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d4f
// Size: 0x36
function private function_ea7d2b522e1e6e1a() {
    level endon("game_ended");
    self endon("death");
    self.isingraceperiod = 1;
    waittill_notify_or_timeout("tactical_camera_has_been_piloted", 3);
    self.isingraceperiod = 0;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8d
// Size: 0x2d
function function_c969b8d603818cfc(markdata, player) {
    if (markdata.markingent == self) {
        function_47c44d1bf801b8f0(markdata, player, 0);
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc2
// Size: 0xd
function function_c46995e65d020fcc() {
    return function_c827c58258222d48("reconDart");
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1dd8
// Size: 0xc3
function private function_8ed527b613b0077e(var_c380eb54a8adb38c) {
    cameragroup = [[ var_c380eb54a8adb38c ]]();
    var_922b0ed93b663936 = "ui_tactical_camera_" + "pilot";
    self setclientomnvar(var_922b0ed93b663936, undefined);
    self setclientomnvar("ui_tactical_camera_" + "can_detonate_c4", 0);
    self setclientomnvar("ui_tactical_camera_" + "index", 0);
    for (i = 0; i <= cameragroup.size; i++) {
        var_1004988ab02e2b5a = "ui_tactical_camera_" + string(i) + "_location";
        var_dd13ad74bc01d314 = "ui_tactical_camera_" + string(i) + "_status";
        self setclientomnvar(var_1004988ab02e2b5a, -1);
        self setclientomnvar(var_dd13ad74bc01d314, 0);
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ea3
// Size: 0x53
function private function_d423bb11a1cf19a5(camera) {
    self endon("disconnect");
    level endon("game_ended");
    self endon("usingCamera");
    camera endon("death");
    while (true) {
        if (self.isusingcamera) {
            self setclientomnvar("ui_killstreak_countdown", camera.batterytime);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1efe
// Size: 0x3f
function private function_e105aca0d2b82e2e(camera, cameragroup) {
    idx = camera.cameraindex;
    if (isdefined(idx)) {
        self setclientomnvar("ui_tactical_camera_index", idx + 1);
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f45
// Size: 0x8b
function private function_a3d6f92e2c44200f() {
    level endon("game_ended");
    self endon("stopMonitoringCamera");
    self endon("death_or_disconnect");
    while (true) {
        level waittill("tacticalCamera_location_changed", camera);
        cameragroup = function_c46995e65d020fcc();
        idx = array_find(cameragroup, camera);
        if (isdefined(idx)) {
            var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(idx) + "_location";
            self setclientomnvar(var_e9d476a3809cb3f1, camera.areaid);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1fd8
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

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x208e
// Size: 0x14b
function private function_9f19db59e1560978(_camera, cameragroup) {
    var_f2a82f1e1affde6e = "_is_piloted";
    var_52b021daecb30118 = "_location";
    function_e105aca0d2b82e2e(_camera, cameragroup);
    foreach (camera in cameragroup) {
        cameraindex = camera.cameraindex;
        assertex(isdefined(camera.cameraindex), "<dev string:x105>");
        if (!isdefined(camera.cameraindex)) {
            continue;
        }
        function_8cfb97ae498ab61e(camera, cameraindex);
        if (isdefined(camera.pilot)) {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + var_f2a82f1e1affde6e, 1);
        } else {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + var_f2a82f1e1affde6e, 0);
        }
        if (isdefined(camera.areaid)) {
            self setclientomnvar("ui_tactical_camera_" + string(cameraindex) + var_52b021daecb30118, camera.areaid);
            continue;
        }
        self setclientomnvar("ui_tactical_camera_" + string(cameraindex) + var_52b021daecb30118, -1);
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x21e1
// Size: 0x65
function private function_8cfb97ae498ab61e(camera, index) {
    status = camera function_3ecfbd63a3e3bed3(self);
    camera.status = status;
    var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(index) + "_status";
    self setclientomnvar(var_e9d476a3809cb3f1, status);
    camera thread function_b327b26a701cfa7a(self, index);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x224e
// Size: 0x41
function private function_eb71a2588d9d796a(camera) {
    if (isdefined(camera.pilot)) {
        self setclientomnvar("ui_tactical_camera_pilot", camera.pilot);
        return;
    }
    self setclientomnvar("ui_tactical_camera_pilot", undefined);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2297
// Size: 0x8f
function private function_8dd9912ef55fbe3b(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    camera endon("death");
    while (true) {
        level waittill("camera_piloted", pilotedcam);
        if (pilotedcam == camera) {
            function_eb71a2588d9d796a(camera);
        }
        cameragroup = function_c46995e65d020fcc();
        idx = array_find(cameragroup, pilotedcam);
        if (isdefined(idx)) {
            self setclientomnvar("ui_tactical_camera_" + idx + "_is_piloted", 1);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x232e
// Size: 0x8e
function private function_8f6ac6112bc43b15(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    camera endon("death");
    while (true) {
        level waittill("tacticalCamera_pilot_removed", var_b53d41c47a512505);
        if (var_b53d41c47a512505 == camera) {
            function_eb71a2588d9d796a(camera);
        }
        cameragroup = function_c46995e65d020fcc();
        idx = array_find(cameragroup, var_b53d41c47a512505);
        if (isdefined(idx)) {
            self setclientomnvar("ui_tactical_camera_" + idx + "_is_piloted", 0);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x23c4
// Size: 0x143
function private function_daf83774b715c487(markdata, camuser, target, targettype, useheadicon, useoutline) {
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
    function_88b3522bbdf2f7c1(0);
    function_88b3522bbdf2f7c1(1);
    markergroup = camuser function_89b59bedb3802e41();
    function_ec57e0acbc6c6879(markergroup, target, 2);
    timeout = 5;
    if (issharedfuncdefined("perk", "hasPerk")) {
        if (self.owner [[ getsharedfunc("perk", "hasPerk") ]]("specialty_improved_target_mark")) {
            timeout += 2;
        }
    }
    thread function_6643dd06cf63b76a(markdata, camuser, timeout, 0);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x250f
// Size: 0x2b
function function_a60052d904a2d492(target) {
    markdelay = getdvarfloat(@"hash_4ed00d07f5187137", 0.3);
    return markdelay;
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2543
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

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2623
// Size: 0xc2
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

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x26ed
// Size: 0x154
function private function_2e07a35180de2a29() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("monitoringCamActivation");
    self endon("monitoringCamActivation");
    self endon("tacticalCamera_unset");
    while (true) {
        success = function_30dd206c5d9b45a7();
        currentweapon = self getcurrentweapon();
        if (currentweapon.basename != namespace_d31450b702db9707::function_79a632d01cf0c669()) {
            continue;
        }
        if (!success) {
            continue;
        }
        if (!function_84582dd92c385507()) {
            continue;
        }
        if (issuperready() && !istrue(self.var_75b981560f8453f4)) {
            continue;
        }
        if (self.super.staticdata.ref == "super_select") {
            continue;
        }
        cam = undefined;
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

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2849
// Size: 0xa0
function private function_5d3cbe464806a795(camera) {
    level endon("game_ended");
    self endon("disconnect");
    self.deployingcamera = 1;
    var_783b392bd5803792 = getdvarfloat(@"hash_83f60684c63746be", 0);
    deployresult = namespace_49492dacb8708592::function_cfec51cac79ca4e6(getcurrentsuper(), undefined, undefined, undefined, undefined, undefined, 0, var_783b392bd5803792, undefined, 1);
    self.var_75b981560f8453f4 = undefined;
    if (!istrue(deployresult)) {
        self.deployingcamera = 0;
        return 0;
    }
    if (!isdefined(camera)) {
        self.deployingcamera = 0;
        self notify("super_finished_with_deploy_weapon");
        return 0;
    }
    thread function_a10d1d70759f9e83(camera);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x28f1
// Size: 0x190
function private function_a10d1d70759f9e83(camera, forcewatcher) {
    if (!isdefined(self) || !isalive(self) || !isdefined(camera)) {
        return;
    }
    self visionsetkillstreakforplayer("tacCam", 0);
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
    self.isusingcamera = 1;
    self.deployingcamera = 0;
    self.currentcamera = camera;
    function_81704d1224bd6fe0(self.isusingcamera);
    cameragroup = function_c46995e65d020fcc();
    thread function_9f19db59e1560978(camera, cameragroup);
    thread function_89cdd7bec6a758ee();
    thread function_a3d6f92e2c44200f();
    thread function_44722ffcc8fe65de();
    function_57b6e09eda0090d6(0);
    thread function_e170d8c3cacdbaf5(camera);
    self setclientomnvar("ui_rcd_outer_ring", 0);
    thread function_d423bb11a1cf19a5(camera);
    thread function_c7dbea1f56df2b64(camera);
    thread function_ff216d4d2c47565c(5);
    thread function_b0210563a392f1a1(camera);
    thread function_b1fc1520e09105aa(camera);
    thread function_9ac601e206d92def(camera);
    thread function_2699a7c2c0b71d3e(camera);
    thread function_1ff427dc4b377abc(camera, forcewatcher);
    thread function_ef76557bfc468ad7("reconDart_allCamerasRemoved", camera);
    self function_e29e60c655e1220b(1);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2a89
// Size: 0x5f
function private function_89cdd7bec6a758ee() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (true) {
        level waittill("tacticalCamera_camera_added", camera, addedindex);
        if (camera.ownerteam == self.team) {
            function_8cfb97ae498ab61e(camera, addedindex);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2af0
// Size: 0x5c
function private function_44722ffcc8fe65de() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (true) {
        level waittill("tacticalCamera_camera_removed", camera, cameraindex);
        if (function_b501ce7305720779(camera)) {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + "_status", 0);
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2b54
// Size: 0x1db
function private function_1d751f90a61b1801(camera, isswitching, var_4faec397e81604ac) {
    if (self.isusingcamera) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (getsubgametype() == "dmz" || getsubgametype() == "exgm")) {
            self setclientomnvar("ui_dmz_hide_inventory", 0);
        }
        if (isdefined(camera) && !camera.hasexploded) {
            function_6ecb6c565c248e04(camera);
        }
        if (!istrue(isswitching)) {
            self visionsetkillstreakforplayer("");
            self painvisionon();
            self notify("super_finished_with_deploy_weapon");
            self.isusingcamera = 0;
            self.currentcamera = undefined;
            if (function_3265a4a8a3bdb477("reconDart")) {
                function_57b6e09eda0090d6(1);
            }
            self notify("playerExitingCameraMode");
            thread function_7858aa4f2bc91d80();
        }
        if (function_58a0cad2aba60238(camera)) {
            thread function_1e34b5a5489be90(camera, isswitching);
        } else {
            thread function_b4e750dbd5734b12(camera, isswitching);
        }
        if (isdefined(camera) && !isdefined(camera.pilot) && (!isdefined(camera.watchers) || camera.watchers.size == 0)) {
            if (!istrue(var_4faec397e81604ac)) {
                camera setscriptablepartstate("autopiloted", "on", 0);
                camera thread function_c99b3a2b715c288b();
                if (istrue(camera.useturret)) {
                    camera setmode("sentry_offline");
                    camera restoredefaultdroppitch();
                }
            }
        }
        function_a9ff1672fcc0b3f8();
        function_66b4afa128decd2e();
        function_13e2543cd1847ca6();
        function_57e0efe2f886bd46();
        function_8ed527b613b0077e(&function_c46995e65d020fcc);
        camera function_ea3e848c25e3c926(self, undefined, "super_recon_dart");
        function_81704d1224bd6fe0(0);
        camera showtoplayer(self);
    }
    self notify("stopMonitoringCamera");
    if (isdefined(camera)) {
        self notify("stopMonitoringReticleState");
    }
    self notify("playerLeavingCurrentCamera");
    self function_e29e60c655e1220b(0);
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2d37
// Size: 0x308
function private function_1ff427dc4b377abc(camera, forcewatcher) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    camera endon("death");
    if (!isdefined(camera) || istrue(camera.isdestroyed)) {
        return 0;
    }
    if (isdefined(camera.pilot) && camera.pilot != self && camera.owner == self) {
        oldpilot = camera.pilot;
        oldpilot function_1d751f90a61b1801(camera, 1, 1);
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
        camera setscriptablepartstate("piloted", "on", 0);
        camera setscriptablepartstate("autopiloted", "off", 0);
        camera.useturret = getdvarint(@"hash_74a62120279457e0", 1);
        if (camera.useturret) {
            camera setmode("manual");
            self remotecontrolturret(camera);
            self setplayerangles(camera.tag.angles);
        } else {
            self playerlinkweaponviewtodelta(camera.tag, "tag_player", 1, camera.var_df8eab23e5a5a0b7[1], camera.var_df8eab23e5a5a0b7[0], camera.var_3ebf8c1ae3acce22[0], camera.var_3ebf8c1ae3acce22[1], 0);
            self setplayerangles(camera.tag.angles);
            self playerlinkedsetviewznear(0);
        }
        function_c9ad5aaf3183b83c();
        function_7abfae4e338cc940(self, &function_f1493744aa061205);
        thread function_fc89b224136fe202(camera);
        camera thread function_54dea0f6292103cb();
        thread function_a96f380b39543647(camera);
        camera thread function_ca19a92a4f9d5c3d();
    }
    function_eb71a2588d9d796a(camera);
    thread function_8dd9912ef55fbe3b(camera);
    thread function_8f6ac6112bc43b15(camera);
    thread function_e910b2eba1af834c();
    thread function_65c2611eff3a7dc4(camera);
    thread function_f8c09eabc74d0ca3(camera);
    camera function_ea3e848c25e3c926(self, undefined, "super_recon_dart");
    if (camera scripts\cp_mp\emp_debuff::is_empd()) {
        function_9f25ae386db6338a(camera);
    }
    /#
        printtoscreen2d(180, 30, "<dev string:x183>" + "<dev string:x18b>" + "<dev string:x196>" + "<dev string:x1b0>" + "<dev string:x1bd>", (0, 0, 0), 2, 300);
    #/
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3047
// Size: 0x2b
function private function_afaefcf7b894e66(player) {
    player visionsetkillstreakforplayer("");
    function_8b5781dd2d18a300(player);
    function_f7a32619bba6e450("reconDart");
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x307a
// Size: 0x10
function function_4ccb840525638e85(camera) {
    return "tacCam";
}

// Namespace namespace_67edc9bc3f0c6230 / namespace_87a763dd2088afea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3093
// Size: 0x33
function function_8b1c76d70cb37943(data) {
    var_c0754ca9aa8976da = getdvarfloat(@"hash_1818fb198fa739fb", 1);
    function_5a7867448f866939(data, var_c0754ca9aa8976da);
}

