// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
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
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\equipment\flash_grenade.gsc;
#using scripts\mp\utility\points.gsc;
#using script_202d9f0ea7db3a23;
#using script_2aabac61f2ae422;

#namespace namespace_67edc9bc3f0c6230;

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889
// Size: 0x5b
function function_c35f8fe1f419bb40() {
    level._effect["vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx"] = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    function_5d36462331845d5f("reconDartList");
    level.var_bb0266f422d9afa3["reconDart"] = spawnstruct();
    function_b1ed6e7b94cf2a7e();
    function_ec06e376c416317();
    function_ea90ebad8b7a7a9();
    thread function_c1a14856aebb53f0();
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eb
// Size: 0x1db
function function_b1ed6e7b94cf2a7e() {
    levelData = function_f0698aee89c18210("reconDart");
    levelData.var_5237a188ccda4d7b = "super_tac_camera";
    levelData.lifetime = getdvarint(@"hash_13717e6e87cb530f", 120);
    levelData.startfunc = &function_a10d1d70759f9e83;
    levelData.var_be3314f77fef5d6b = &function_1d751f90a61b1801;
    levelData.destroyfunc = &function_986aa37bc2622d44;
    levelData.var_e04bd0ddc6ec05b = &function_4ccb840525638e85;
    levelData.var_d6fdc3b56b33f4e3 = &function_7acc5aa2b73fe93b;
    levelData.var_273f2a99f4833f00 = &function_daf83774b715c487;
    levelData.var_547e8b267c03d017 = &function_1ee10c87668846d9;
    levelData.var_1eb35a5a7992e498 = &function_7acc5aa2b73fe93b;
    levelData.var_6e5f6320607eb69 = &function_a60052d904a2d492;
    levelData.var_4fbadc7102d30912 = 2480625;
    levelData.var_16187e4d354c3c97 = 619369;
    levelData.var_37782917998d4ff2 = 2480625;
    levelData.var_9953dc2e8c205b77 = 619369;
    levelData.var_eff1ab975c47fe2 = 9000000;
    levelData.var_57b8f3bcfca33a4b = 3;
    levelData.var_53ec43fa38fc3243 = "reconDartList";
    levelData.var_9c35ca95bd1d22fa = "reconDarts";
    levelData.var_1790d4c69d5f45a4 = 3;
    levelData.var_4f401574fc47899e = "tacticalCamera_camera_added";
    levelData.var_67d467748271444c = "tacticalCamera_camera_removed";
    levelData.var_315c43d476bb095 = "tacticalCamera_location_changed";
    levelData.var_36411d05d3f1e503 = "tacticalCamera_pilot_removed";
    levelData.var_6c8c1a666ed5f48d = "hud_icon_fieldupgrade_tac_cam";
    levelData.var_91389dd68a70be33 = "equip_tactical_cam_marking";
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0x198
function function_ec06e376c416317() {
    levelData = function_f0698aee89c18210("reconDart");
    levelData.firetypes = [];
    levelData.firetypeweights = [];
    levelData.var_871967428b3acd58 = [];
    levelData.var_e5f140d112ac9f48 = [];
    levelData.fireintervalmin = [];
    levelData.fireintervalmax = [];
    levelData.var_f6f38f14951d15fa = getdvarfloat(@"hash_d3926f8c39ca520b", 4);
    levelData.var_32ba1548cc879801 = getdvarfloat(@"hash_939f680c8b7bd4a7", 2);
    levelData.var_c6c0c9d205c3a9d7 = getdvarint(@"hash_9f5973a323881a4d", 3);
    levelData.var_5f90e570a199b76f = getdvarfloat(@"hash_8241b785c55eeeb3", 800);
    levelData.firetypes[levelData.firetypes.size] = "ar";
    levelData.var_871967428b3acd58["ar"] = 0.4;
    levelData.firetypeweights["ar"] = getdvarint(@"hash_6d05892e26e1bc20", 35);
    levelData.var_e5f140d112ac9f48["ar"] = getdvarint(@"hash_637f35bce33c662c", 3);
    levelData.fireintervalmin["ar"] = getdvarfloat(@"hash_be611222e6bccfa6", 0.5);
    levelData.fireintervalmax["ar"] = getdvarfloat(@"hash_be842422e6e33ef4", 2);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6c
// Size: 0x146
function function_ea90ebad8b7a7a9() {
    levelData = function_f0698aee89c18210("reconDart");
    levelData.var_6ecec22397e50b64 = getdvarint(@"hash_21ae64f1d46824d0", 256);
    levelData.var_96e1d0b5257833f5 = getdvarint(@"hash_e48be2cef86f21dc", 540);
    levelData.var_969232101115a16f = getdvarint(@"hash_e48be2cef86f21dc", 0);
    levelData.var_250b70d11f662fe = levelData.var_96e1d0b5257833f5 - levelData.var_969232101115a16f;
    levelData.var_a3dcd4386e0e216b = getdvarint(@"hash_3704ca981a6134ee", -30);
    levelData.var_c72edf49fca36b64 = getdvarint(@"hash_a8a0b941c08f9a33", 35);
    levelData.var_40834efd8b5e0c85 = getdvarint(@"hash_c50e8210d6ccf9f4", 65);
    levelData.var_71671da3e0847b95 = levelData.var_c72edf49fca36b64 + levelData.var_40834efd8b5e0c85;
    levelData.var_3526acfa98cbe798 = getdvarfloat(@"hash_7fde54a03cdd9b38", 3.6);
    levelData.var_9a4d9ce87d4acfc7 = getdvarint(@"hash_ba62e8ebd3618c6", 1) == 1;
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb9
// Size: 0x39
function function_c1a14856aebb53f0() {
    if (getdvarint(@"hash_6341b85ecd5b3f07", 0) != 1) {
        return;
    }
    while (1) {
        wait(1);
        function_b1ed6e7b94cf2a7e();
        function_ec06e376c416317();
        function_ea90ebad8b7a7a9();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf9
// Size: 0x72
function function_2cf7e1e0b6513c6f() {
    self notify("tacticalCamera_set");
    thread function_362c9a13d18031b1("personal_camera_status_updated", "ui_tactical_camera_cam_", "tacticalCamera_unset");
    function_81fb12166c3c0c2(self, undefined, &function_c46995e65d020fcc, "super_recon_dart");
    thread function_3c4da29d1ed157c7("tacCamCluster", "tacticalCamera_unset", "tacticalCamera_camera_removed", 9000000, &function_c46995e65d020fcc);
    if (!isbot(self) && !isagent(self)) {
        thread function_2e07a35180de2a29();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe72
// Size: 0x3b
function function_79893d5ed21ae366() {
    self notify("tacticalCamera_unset");
    function_f7a32619bba6e450("reconDart");
    function_8b5781dd2d18a300(self);
    function_81fb12166c3c0c2(self, 1, &function_c46995e65d020fcc, "super_recon_dart");
    function_fb30706d5e4a4b27(undefined);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb4
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

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf11
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
    self notify("personal_camera_status_updated", camera);
    camera thread function_45a7e0edc973d037();
    if (issharedfuncdefined("game", "clearOOB")) {
        [[ getsharedfunc("game", "clearOOB") ]](camera, 1);
    }
    camera thread function_5e8b74f5e3dc4c60();
    function_9cd4393cac778989(camera);
    if (1) {
        thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(camera);
    }
    if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        camera function_fe1cd71ed406a649();
    }
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_afaefcf7b894e66);
    camera setscriptablepartstate("ddos", "neutral", 0);
    camera namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_652247ce1acb67c2);
    camera namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_8b1c76d70cb37943);
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

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1154
// Size: 0x4d
function function_1092ee52c1c5a6c() {
    level endon("game_ended");
    self.owner endon("disconnect");
    /#
        assertex(self.owner function_3265a4a8a3bdb477("reconDart"), "Tried to make a camera available that is not in the camera list.");
    #/
    self.owner function_57b6e09eda0090d6(1);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0x82
function function_986aa37bc2622d44(immediate, var_1548b5d7f8624206) {
    if (!isdefined(immediate)) {
        immediate = !istrue(self.planted);
    }
    if (isdefined(self)) {
        if (!istrue(var_1548b5d7f8624206)) {
            self.owner notify("personal_camera_status_updated", self);
        }
        self setscriptablepartstate("destroyed", "on", 0);
        function_6976f2b3945c32f();
        function_7abfae4e338cc940(self.owner, &function_c969b8d603818cfc);
        thread function_17dd1c4132e3e355();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1231
// Size: 0x2c
function private function_66b731696d3bc6b8() {
    function_57b6e09eda0090d6(0);
    self setclientomnvar("ui_tactical_camera_use", 0);
    function_86b60845e9a3d301("reconDart");
    self notify("reconDart_allCamerasRemoved");
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1264
// Size: 0xd6
function function_17dd1c4132e3e355() {
    self notify("death");
    self.isdestroyed = 1;
    if (isdefined(self.owner)) {
        self.owner namespace_3bbb5a98b932c46f::removeequip(self);
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
    self.var_a820130a6d38f1e4 = undefined;
    self.isdamaged = undefined;
    self.useturret = undefined;
    self setturretowner(undefined);
    wait(0.1);
    self delete();
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1341
// Size: 0xcb
function function_65c2611eff3a7dc4(camera) {
    self endon("disconnect");
    self endon("death");
    self endon("playerExitingCameraMode");
    self notify("cameraSelfDestructMonitored");
    self endon("cameraSelfDestructMonitored");
    while (1) {
        self notifyonplayercommand("selfDestruct", "+weapnext");
        self waittill("selfDestruct");
        if (!isdefined(camera) || istrue(camera.isdestroyed)) {
            return;
        }
        if (camera namespace_5a51aa78ea0b1b9f::is_empd()) {
            continue;
        }
        if (camera.pilot == self) {
            /#
                printtoscreen2d(180, 30, "ddos", (0, 0, 0), 2, 150);
            #/
            function_1d929b8e8487c576(camera);
            camera thread function_986aa37bc2622d44();
            return;
        } else {
            /#
                iprintlnbold("specialty_tac_resist");
            #/
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1413
// Size: 0x14
function function_a9ff1672fcc0b3f8() {
    self notifyonplayercommandremove("selfDestruct", "+weapnext");
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142e
// Size: 0x284
function function_1d929b8e8487c576(camera) {
    levelData = function_f0698aee89c18210("reconDart");
    var_4f35a480b277acb6 = function_869ccb4e3451b8c6([0:"etype_player", 1:"etype_ai"]);
    targetarray = function_b1eef70090b5b7b5(camera.origin, 1575, var_4f35a480b277acb6);
    foreach (victim in targetarray) {
        if (!isdefined(victim)) {
            continue;
        }
        if (victim == self && !levelData.var_9a4d9ce87d4acfc7) {
            continue;
        }
        dist = distance(victim.origin, camera.origin);
        weight = 0;
        if (victim _hasperk("specialty_stun_resistance") && victim != self) {
            updatedamagefeedback("hittacresist", undefined, undefined, undefined, 1);
            if (namespace_f8065cafc523dba5::playersareenemies(victim, self)) {
                victim namespace_aad14af462a74d08::resistedstun(victim);
            }
            victim namespace_b6a8027f477010e1::activatePerk("specialty_tac_resist");
            victim thread namespace_5e840d01a2244aea::applyflash(self, levelData.var_3526acfa98cbe798);
            return;
        }
        dist = clamp(dist, levelData.var_969232101115a16f, ter_op(victim == self, levelData.var_6ecec22397e50b64, levelData.var_96e1d0b5257833f5));
        var_ae3412f7b9b48d44 = 1 - (dist - levelData.var_969232101115a16f) / levelData.var_250b70d11f662fe;
        weight = weight + floor(var_ae3412f7b9b48d44 * levelData.var_40834efd8b5e0c85);
        if (namespace_3c37cb17ade254d::within_fov(victim.origin, victim getplayerangles(), camera.origin, 0.5)) {
            weight = weight + levelData.var_c72edf49fca36b64;
        }
        if (!namespace_f8065cafc523dba5::playersareenemies(victim, self)) {
            weight = weight + levelData.var_a3dcd4386e0e216b;
        }
        weight = max(0, weight);
        var_453227e7b36f0b24 = weight / levelData.var_71671da3e0847b95;
        var_5f651e1139ef776f = 4;
        maxduration = 6;
        duration = var_5f651e1139ef776f + (maxduration - var_5f651e1139ef776f) * var_453227e7b36f0b24;
        victim thread namespace_5e840d01a2244aea::applyflash(self, duration);
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b9
// Size: 0xd0
function function_3f78cc9ff3012d4d() {
    var_a78dc38b12eafeba = 0;
    var_2873368d0cd5753f = [];
    levelData = function_f0698aee89c18210("reconDart");
    for (i = 0; i < levelData.firetypes.size; i++) {
        firetype = levelData.firetypes[i];
        var_a78dc38b12eafeba = var_a78dc38b12eafeba + levelData.firetypeweights[firetype];
        var_2873368d0cd5753f[i] = var_a78dc38b12eafeba;
    }
    weightvalue = randomint(var_a78dc38b12eafeba);
    for (i = 0; i < var_2873368d0cd5753f.size; i++) {
        if (weightvalue < var_2873368d0cd5753f[i]) {
            self.firetype = levelData.firetypes[i];
            return;
        }
    }
    /#
        assertmsg("Was not able to choose a fire type for recon darts");
    #/
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1790
// Size: 0x14
function function_a839f4b0078f8f69() {
    self.decoyassists = 0;
    function_3f78cc9ff3012d4d();
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ab
// Size: 0xe
function function_f7b712ced2dab1fc() {
    self.var_9f0213aebf49e280 = 1;
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c0
// Size: 0xd
function function_8cffe9d2b3560375() {
    self.var_9f0213aebf49e280 = 0;
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d4
// Size: 0xd5
function function_f8c09eabc74d0ca3(camera) {
    self endon("disconnect");
    self endon("death");
    self endon("playerExitingCameraMode");
    self notify("cameraDecoyNoiseMonitored");
    self endon("cameraDecoyNoiseMonitored");
    while (1) {
        self notifyonplayercommand("decoyNoiseCommand", "+attack");
        self waittill("decoyNoiseCommand");
        if (!isdefined(camera) || istrue(camera.isdestroyed)) {
            return;
        }
        if (camera.pilot == self) {
            if (!istrue(camera.var_9f0213aebf49e280)) {
                continue;
            }
            if (camera namespace_5a51aa78ea0b1b9f::is_empd()) {
                continue;
            }
            /#
                printtoscreen2d(180, 30, "", (0, 0, 0), 2, 150);
            #/
            camera thread function_825911430c0634a9(self);
        } else {
            /#
                iprintlnbold("specialty_tac_resist");
            #/
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b0
// Size: 0x14
function function_66b4afa128decd2e() {
    self notifyonplayercommandremove("decoyNoiseCommand", "+attack");
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cb
// Size: 0xe4
function function_825911430c0634a9(var_414f12081917f613) {
    self endon("death");
    self setscriptablepartstate("beacon", "active", 0);
    function_8cffe9d2b3560375();
    levelData = function_f0698aee89c18210("reconDart");
    var_1b4a45e3e20bbb65 = 1 + randomint(levelData.var_e5f140d112ac9f48[self.firetype]);
    while (1) {
        var_1b4a45e3e20bbb65--;
        if (!namespace_5a51aa78ea0b1b9f::is_empd()) {
            function_f0d575a0a800d2b8(var_414f12081917f613);
        }
        if (var_1b4a45e3e20bbb65 == 0) {
            break;
        }
        wait(randomfloatrange(levelData.fireintervalmin[self.firetype], levelData.fireintervalmax[self.firetype]));
    }
    self setscriptablepartstate("beacon", "neutral", 0);
    wait(levelData.var_f6f38f14951d15fa);
    function_f7b712ced2dab1fc();
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b6
// Size: 0xa2
function function_f0d575a0a800d2b8(var_414f12081917f613) {
    levelData = function_f0698aee89c18210("reconDart");
    firetype = self.firetype;
    self setscriptablepartstate("weaponFire", firetype + "Fire", 0);
    self setscriptablepartstate("weaponSounds", firetype + "Fire", 0);
    if (isdefined(self.ownerteam)) {
        pinglocationenemyteams(self.origin, self.ownerteam, self.owner);
    }
    function_b36c71c670b33b4(var_414f12081917f613);
    wait(levelData.var_871967428b3acd58[firetype]);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5f
// Size: 0x151
function function_b36c71c670b33b4(var_414f12081917f613) {
    levelData = function_f0698aee89c18210("reconDart");
    var_4f35a480b277acb6 = function_869ccb4e3451b8c6([0:"etype_player", 1:"etype_ai"]);
    targetarray = function_b1eef70090b5b7b5(self.origin, 1575, var_4f35a480b277acb6);
    foreach (character in targetarray) {
        if (isplayer(character) && !character namespace_f8065cafc523dba5::_isalive()) {
            continue;
        }
        if (!istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, character))) {
            continue;
        }
        if (isplayer(character)) {
            dist = distance(character.origin, self.origin);
            if (distance(character.origin, self.origin) > levelData.var_5f90e570a199b76f) {
                continue;
            }
            thread function_9e2311feec72ec0(character, var_414f12081917f613);
        } else {
            character aieventlistenerevent("gunshot", self, self.origin);
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb7
// Size: 0xeb
function function_9e2311feec72ec0(player, var_414f12081917f613) {
    player endon("disconnect");
    self endon("death");
    var_414f12081917f613 endon("disconnect");
    levelData = function_f0698aee89c18210("reconDart");
    playerid = player getentitynumber();
    var_414f12081917f613 notify("reconDart_assitWaiting_" + playerid);
    var_414f12081917f613 endon("reconDart_assitWaiting_" + playerid);
    result = player namespace_3c37cb17ade254d::waittill_notify_or_timeout_return("death", levelData.var_32ba1548cc879801);
    if (isdefined(player.lastkilledby) && player.lastkilledby != var_414f12081917f613) {
        if (result == "death" && namespace_f8065cafc523dba5::playersareenemies(player, var_414f12081917f613)) {
            if (self.decoyassists < levelData.var_c6c0c9d205c3a9d7) {
                var_414f12081917f613 thread namespace_48a08c5037514e04::doScoreEvent("assist_decoy");
                self.decoyassists++;
            }
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ca9
// Size: 0x12
function private function_7acc5aa2b73fe93b() {
    return self.var_7d73cbb5ca5d6e32["tacCamCluster"];
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cc3
// Size: 0x1d
function private function_fb30706d5e4a4b27(val) {
    self.var_7d73cbb5ca5d6e32["tacCamCluster"] = val;
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ce7
// Size: 0x11
function private function_c3d0ccb8f9a3d594() {
    self setclientomnvar("ui_tactical_camera_use", 1);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cff
// Size: 0x37
function private function_ea7d2b522e1e6e1a() {
    level endon("game_ended");
    self endon("death");
    self.var_11f51147ccff0163 = 1;
    waittill_notify_or_timeout("tactical_camera_has_been_piloted", 3);
    self.var_11f51147ccff0163 = 0;
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3d
// Size: 0x2e
function function_c969b8d603818cfc(var_161e86c260d6864c, player) {
    if (var_161e86c260d6864c.markingent == self) {
        function_47c44d1bf801b8f0(var_161e86c260d6864c, player, 0);
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d72
// Size: 0xe
function function_c46995e65d020fcc() {
    return function_c827c58258222d48("reconDart");
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d88
// Size: 0xc7
function private function_8ed527b613b0077e(var_c380eb54a8adb38c) {
    var_b65e76e261a6ed4d = [[ var_c380eb54a8adb38c ]]();
    var_922b0ed93b663936 = "ui_tactical_camera_" + "pilot";
    self setclientomnvar(var_922b0ed93b663936, undefined);
    self setclientomnvar("ui_tactical_camera_" + "can_detonate_c4", 0);
    self setclientomnvar("ui_tactical_camera_" + "index", 0);
    for (i = 0; i <= var_b65e76e261a6ed4d.size; i++) {
        var_1004988ab02e2b5a = "ui_tactical_camera_" + string(i) + "_location";
        var_dd13ad74bc01d314 = "ui_tactical_camera_" + string(i) + "_status";
        self setclientomnvar(var_1004988ab02e2b5a, -1);
        self setclientomnvar(var_dd13ad74bc01d314, 0);
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0x54
function private function_d423bb11a1cf19a5(camera) {
    self endon("disconnect");
    level endon("game_ended");
    self endon("usingCamera");
    camera endon("death");
    while (1) {
        if (self.isusingcamera) {
            self setclientomnvar("ui_killstreak_countdown", camera.var_5c93b81b2052d23b);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1eb1
// Size: 0x3f
function private function_e105aca0d2b82e2e(camera, var_b65e76e261a6ed4d) {
    idx = camera.cameraindex;
    if (isdefined(idx)) {
        self setclientomnvar("ui_tactical_camera_index", idx + 1);
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ef7
// Size: 0x8e
function private function_a3d6f92e2c44200f() {
    level endon("game_ended");
    self endon("stopMonitoringCamera");
    self endon("death_or_disconnect");
    while (1) {
        camera = level waittill("tacticalCamera_location_changed");
        var_b65e76e261a6ed4d = function_c46995e65d020fcc();
        idx = array_find(var_b65e76e261a6ed4d, camera);
        if (isdefined(idx)) {
            var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(idx) + "_location";
            self setclientomnvar(var_e9d476a3809cb3f1, camera.var_49996ebebbbbf375);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f8c
// Size: 0xaf
function private function_b327b26a701cfa7a(player, index) {
    level endon("game_ended");
    player endon("disconnect");
    self endon("death");
    player endon("stopMonitoringCamera");
    while (1) {
        var_6d38df6ea2eb7767 = function_3ecfbd63a3e3bed3(player);
        if (!isdefined(self.status) || isdefined(self.status) && var_6d38df6ea2eb7767 != self.status) {
            self.status = var_6d38df6ea2eb7767;
            var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(index) + "_status";
            player setclientomnvar(var_e9d476a3809cb3f1, self.status);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2042
// Size: 0x150
function private function_9f19db59e1560978(var_b8b54662c5c2e4b9, var_b65e76e261a6ed4d) {
    var_f2a82f1e1affde6e = "_is_piloted";
    var_52b021daecb30118 = "_location";
    function_e105aca0d2b82e2e(var_b8b54662c5c2e4b9, var_b65e76e261a6ed4d);
    foreach (camera in var_b65e76e261a6ed4d) {
        cameraindex = camera.cameraindex;
        /#
            assertex(isdefined(camera.cameraindex), "Camera does not have a valid camera index. Please check addToTeamCameras() to make sure cameras are being setup correctly.");
        #/
        if (!isdefined(camera.cameraindex)) {
            continue;
        }
        function_8cfb97ae498ab61e(camera, cameraindex);
        if (isdefined(camera.pilot)) {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + var_f2a82f1e1affde6e, 1);
        } else {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + var_f2a82f1e1affde6e, 0);
        }
        if (isdefined(camera.var_49996ebebbbbf375)) {
            self setclientomnvar("ui_tactical_camera_" + string(cameraindex) + var_52b021daecb30118, camera.var_49996ebebbbbf375);
        } else {
            self setclientomnvar("ui_tactical_camera_" + string(cameraindex) + var_52b021daecb30118, -1);
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2199
// Size: 0x66
function private function_8cfb97ae498ab61e(camera, index) {
    status = camera function_3ecfbd63a3e3bed3(self);
    camera.status = status;
    var_e9d476a3809cb3f1 = "ui_tactical_camera_" + string(index) + "_status";
    self setclientomnvar(var_e9d476a3809cb3f1, status);
    camera thread function_b327b26a701cfa7a(self, index);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2206
// Size: 0x42
function private function_eb71a2588d9d796a(camera) {
    if (isdefined(camera.pilot)) {
        self setclientomnvar("ui_tactical_camera_pilot", camera.pilot);
    } else {
        self setclientomnvar("ui_tactical_camera_pilot", undefined);
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x224f
// Size: 0x91
function private function_8dd9912ef55fbe3b(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    camera endon("death");
    while (1) {
        var_207bac97b3703dc3 = level waittill("camera_piloted");
        if (var_207bac97b3703dc3 == camera) {
            function_eb71a2588d9d796a(camera);
        }
        var_b65e76e261a6ed4d = function_c46995e65d020fcc();
        idx = array_find(var_b65e76e261a6ed4d, var_207bac97b3703dc3);
        if (isdefined(idx)) {
            self setclientomnvar("ui_tactical_camera_" + idx + "_is_piloted", 1);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22e7
// Size: 0x90
function private function_8f6ac6112bc43b15(camera) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    camera endon("death");
    while (1) {
        var_b53d41c47a512505 = level waittill("tacticalCamera_pilot_removed");
        if (var_b53d41c47a512505 == camera) {
            function_eb71a2588d9d796a(camera);
        }
        var_b65e76e261a6ed4d = function_c46995e65d020fcc();
        idx = array_find(var_b65e76e261a6ed4d, var_b53d41c47a512505);
        if (isdefined(idx)) {
            self setclientomnvar("ui_tactical_camera_" + idx + "_is_piloted", 0);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x237e
// Size: 0x145
function private function_daf83774b715c487(var_161e86c260d6864c, var_b995f95867de9aab, target, var_39e02a8a79b6ba4c, var_cad4997ebda279c7, useoutline) {
    level endon("game_ended");
    var_b995f95867de9aab endon("disconnect");
    self.owner endon("disconnect");
    self endon("explode");
    var_161e86c260d6864c.reconmarked = 1;
    self.markingtarget = undefined;
    var_b995f95867de9aab stoplocalsound("equip_tactical_cam_marking");
    var_b995f95867de9aab playlocalsound("equip_tactical_cam_marked");
    self setscriptablepartstate("marking_target", "off", 0);
    success = function_6f8fb8f7f63e5164(var_161e86c260d6864c, var_b995f95867de9aab, 1, 0);
    if (!success) {
        return 0;
    }
    function_88b3522bbdf2f7c1(0);
    function_88b3522bbdf2f7c1(1);
    var_c8462289edfc0aca = var_b995f95867de9aab function_89b59bedb3802e41();
    function_ec57e0acbc6c6879(var_c8462289edfc0aca, target, 2);
    timeout = 5;
    if (issharedfuncdefined("perk", "hasPerk")) {
        if (self.owner [[ getsharedfunc("perk", "hasPerk") ]]("specialty_improved_target_mark")) {
            timeout = timeout + 2;
        }
    }
    thread function_6643dd06cf63b76a(var_161e86c260d6864c, var_b995f95867de9aab, timeout, 0);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ca
// Size: 0x2b
function function_a60052d904a2d492(target) {
    var_eff562dddeaa6b73 = getdvarfloat(@"hash_4ed00d07f5187137", 0.3);
    return var_eff562dddeaa6b73;
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24fd
// Size: 0xd9
function function_1ee10c87668846d9(target, var_39e02a8a79b6ba4c) {
    if (!isdefined(self.markedentitieslifeindicices)) {
        self.markedentitieslifeindicices = [];
    }
    entitynum = target getentitynumber();
    lifeindex = ter_op(isdefined(self.matchdatalifeindex), self.matchdatalifeindex, 0);
    thread function_3a942d83b1617a65(target);
    if (!isdefined(self.markedentitieslifeindicices[entitynum]) || self.markedentitieslifeindicices[entitynum] > lifeindex) {
        self.markedentitieslifeindicices[entitynum] = lifeindex;
        if (issharedfuncdefined("player", "doScoreEvent")) {
            function_c84cfcb1299f9b39() thread [[ getsharedfunc("player", "doScoreEvent") ]](function_2ef675c13ca1c4af(#"hash_c692976b76d1b3c6", var_39e02a8a79b6ba4c, "_marked"));
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25dd
// Size: 0xc4
function function_3a942d83b1617a65(target) {
    level endon("game_ended");
    self endon("death");
    target endon("disconnect");
    result = target namespace_3c37cb17ade254d::waittill_notify_or_timeout_return("death", 5);
    var_46cc280cb7c20c7a = result == "death" || !isalive(target);
    if (var_46cc280cb7c20c7a && isdefined(target.lastkilledby) && target.lastkilledby != self.owner) {
        if (issharedfuncdefined("player", "doScoreEvent")) {
            var_da7b4f7c35cfe0a0 = function_c84cfcb1299f9b39();
            var_da7b4f7c35cfe0a0 thread [[ getsharedfunc("player", "doScoreEvent") ]]("tactical_camera_enemy_killed_assist");
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26a8
// Size: 0x158
function private function_2e07a35180de2a29() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("monitoringCamActivation");
    self endon("monitoringCamActivation");
    self endon("tacticalCamera_unset");
    while (1) {
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
        var_ea5e69cb5e96e49c = function_7acc5aa2b73fe93b();
        if (!isdefined(var_ea5e69cb5e96e49c)) {
            continue;
        } else if (isdefined(var_ea5e69cb5e96e49c) && var_ea5e69cb5e96e49c.size == 0) {
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

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2807
// Size: 0xa1
function private function_5d3cbe464806a795(camera) {
    level endon("game_ended");
    self endon("disconnect");
    self.var_77fefc8456adb545 = 1;
    var_783b392bd5803792 = getdvarfloat(@"hash_83f60684c63746be", 0);
    var_9b1deb5e9d32bbe3 = namespace_49492dacb8708592::function_cfec51cac79ca4e6(getcurrentsuper(), undefined, undefined, undefined, undefined, undefined, 0, var_783b392bd5803792, undefined, 1);
    self.var_75b981560f8453f4 = undefined;
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        self.var_77fefc8456adb545 = 0;
        return 0;
    }
    if (!isdefined(camera)) {
        self.var_77fefc8456adb545 = 0;
        self notify("super_finished_with_deploy_weapon");
        return 0;
    }
    thread function_a10d1d70759f9e83(camera);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28af
// Size: 0x190
function private function_a10d1d70759f9e83(camera, var_bb7199406cfb48d8) {
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
    if (namespace_36f464722d326bbe::isBRStyleGameType() && (getsubgametype() == "dmz" || getsubgametype() == "exgm")) {
        self setclientomnvar("ui_dmz_hide_inventory", 1);
    }
    self.isusingcamera = 1;
    self.var_77fefc8456adb545 = 0;
    self.currentcamera = camera;
    function_81704d1224bd6fe0(self.isusingcamera);
    var_b65e76e261a6ed4d = function_c46995e65d020fcc();
    thread function_9f19db59e1560978(camera, var_b65e76e261a6ed4d);
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
    thread function_1ff427dc4b377abc(camera, var_bb7199406cfb48d8);
    thread function_ef76557bfc468ad7("reconDart_allCamerasRemoved", camera);
    self function_e29e60c655e1220b(1);
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a46
// Size: 0x60
function private function_89cdd7bec6a758ee() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (1) {
        var_25519ab43f5666df = camera = level waittill("tacticalCamera_camera_added");
        if (camera.ownerteam == self.team) {
            function_8cfb97ae498ab61e(camera, var_25519ab43f5666df);
        }
        waitframe();
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2aad
// Size: 0x5d
function private function_44722ffcc8fe65de() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stopMonitoringCamera");
    while (1) {
        cameraindex = camera = level waittill("tacticalCamera_camera_removed");
        if (function_b501ce7305720779(camera)) {
            self setclientomnvar("ui_tactical_camera_" + cameraindex + "_status", 0);
        }
    }
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b11
// Size: 0x1dc
function private function_1d751f90a61b1801(camera, var_7873097f48bd513, var_4faec397e81604ac) {
    if (self.isusingcamera) {
        if (namespace_36f464722d326bbe::isBRStyleGameType() && (getsubgametype() == "dmz" || getsubgametype() == "exgm")) {
            self setclientomnvar("ui_dmz_hide_inventory", 0);
        }
        if (isdefined(camera) && !camera.hasexploded) {
            function_6ecb6c565c248e04(camera);
        }
        if (!istrue(var_7873097f48bd513)) {
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
            thread function_1e34b5a5489be90(camera, var_7873097f48bd513);
        } else {
            thread function_b4e750dbd5734b12(camera, var_7873097f48bd513);
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

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cf4
// Size: 0x308
function private function_1ff427dc4b377abc(camera, var_bb7199406cfb48d8) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    camera endon("death");
    if (!isdefined(camera) || istrue(camera.isdestroyed)) {
        return 0;
    }
    if (isdefined(camera.pilot) && camera.pilot != self && camera.owner == self) {
        var_80b45529e6edc950 = camera.pilot;
        var_80b45529e6edc950 function_1d751f90a61b1801(camera, 1, 1);
        var_80b45529e6edc950 thread function_a10d1d70759f9e83(camera, 1);
    }
    if (isdefined(camera.pilot) || istrue(var_bb7199406cfb48d8)) {
        if (!isdefined(camera.watchers)) {
            camera.watchers = [];
        }
        camera.watchers[self getentitynumber()] = self;
        camera.var_1b381f3aa944d595[self getentitynumber()] = gettime();
        function_c9ad5aaf3183b83c();
        self lerpfov(80, 0);
        self cameralinkto(camera.var_a820130a6d38f1e4, "tag_origin", 1, 1);
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
    if (camera namespace_5a51aa78ea0b1b9f::is_empd()) {
        function_9f25ae386db6338a(camera);
    }
    /#
        printtoscreen2d(180, 30, "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>", (0, 0, 0), 2, 300);
    #/
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3003
// Size: 0x2c
function private function_afaefcf7b894e66(player) {
    player visionsetkillstreakforplayer("");
    function_8b5781dd2d18a300(player);
    function_f7a32619bba6e450("reconDart");
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3036
// Size: 0x11
function function_4ccb840525638e85(camera) {
    return "tacCam";
}

// Namespace namespace_67edc9bc3f0c6230/namespace_87a763dd2088afea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x304f
// Size: 0x33
function function_8b1c76d70cb37943(data) {
    var_c0754ca9aa8976da = getdvarfloat(@"hash_1818fb198fa739fb", 1);
    function_5a7867448f866939(data, var_c0754ca9aa8976da);
}

