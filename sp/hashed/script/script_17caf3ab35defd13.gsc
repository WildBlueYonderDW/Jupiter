#using script_16ea1b94f0f381b3;
#using script_3db04fd1b466bdba;
#using script_608c50392df8c7d1;
#using script_736dec95a49487a6;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace switchblade_drone;

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x705
// Size: 0x18
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("switchblade_drone"), &init);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x725
// Size: 0x118
function private init() {
    if (issharedfuncdefined("switchblade_drone", "init")) {
        [[ getsharedfunc("switchblade_drone", "init") ]]();
    }
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("switchblade_drone", &function_fac3964b226792c1);
    }
    scripts\engine\utility::registersharedfunc("switchblade_drone", "tryUseKillstreak", &function_fac3964b226792c1);
    function_1e5a79cefb8818fb();
    function_167cc15cd8218528();
    val::group_register("switchbladeDrone_deploy", ["melee", "offhand_weapons", "sprint", "weapon_switch", "cp_munitions_pickup"]);
    bundle = level.streakglobals.streakbundles["switchblade_drone"];
    function_a41e3a211a9e37a4("switchblade_drone", bundle.var_cd5b1623cbc6478e, #"hash_b76b2215370d2700");
    level.var_e1aa3bddc7b228e9 = 0;
    level.var_e5731fb152792de1 = [];
    level.var_cde4ae1afb90a57a = [];
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x845
// Size: 0x1cc
function function_1e5a79cefb8818fb() {
    setdvarifuninitialized(@"hash_b171aaba052d2c50", 5);
    setdvarifuninitialized(@"hash_cda65d1126957523", 1);
    setdvarifuninitialized(@"hash_7ad66a5bc22f0e3c", 0.4);
    setdvarifuninitialized(@"hash_fec9a646e847f81b", 0.3);
    setdvarifuninitialized(@"hash_bb25bfbed73b667b", 0.15);
    setdvarifuninitialized(@"hash_aea510623d9c4c10", 1250);
    setdvarifuninitialized(@"hash_79f9928723395f7f", -90);
    setdvarifuninitialized(@"hash_9bb73c3ac9654260", 300);
    setdvarifuninitialized(@"hash_7bd25800dfc29105", 65);
    setdvarifuninitialized(@"hash_832a4160ba33c74b", 12);
    setdvarifuninitialized(@"hash_57306177bd6ed859", 20);
    setdvarifuninitialized(@"hash_fa505002fe5586de", 10);
    setdvarifuninitialized(@"hash_636a1d843f1957eb", 7);
    setdvarifuninitialized(@"hash_f10e873f6059cd5f", 20);
    setdvarifuninitialized(@"hash_a80f427a9d36e9fe", 75);
    setdvarifuninitialized(@"hash_d40e17bd9fa003a1", 35);
    setdvarifuninitialized(@"hash_836eeca87d3a3d6f", 500);
    setdvarifuninitialized(@"hash_fc2d155242a3fc25", 800);
    setdvarifuninitialized(@"hash_1da226fe14849c74", 800);
    setdvarifuninitialized(@"hash_22f1ccc4024de95e", 600);
    setdvarifuninitialized(@"hash_deabefeda3824f1d", 1000);
    setdvarifuninitialized(@"hash_c17694dce62bf907", 1000);
    setdvarifuninitialized(@"hash_b9597bb5bad14e63", 50);
    setdvarifuninitialized(@"hash_f956bbb2c255914f", 500);
    setdvarifuninitialized(@"hash_b0c1d0793ae379c7", 0);
    setdvarifuninitialized(@"hash_211a27e9e936be16", 0);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa19
// Size: 0x61
function function_167cc15cd8218528() {
    game["dialog"]["switchblade_ause"] = "ause";
    game["dialog"]["switchblade_euse"] = "euse";
    game["dialog"]["switchblade_lcra"] = "lcra";
    game["dialog"]["switchblade_ltim"] = "ltim";
    game["dialog"]["switchblade_earn"] = "earn";
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa82
// Size: 0x131
function function_fac3964b226792c1(streakinfo) {
    if (!isdefined(streakinfo)) {
        streakinfo = createstreakinfo("switchblade_drone", self);
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (!function_df1cf83495e38426()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/SWITCHBLADE_COUNT_OVER_LIMIT");
        }
        return 0;
    }
    bundle = level.streakglobals.streakbundles["switchblade_drone"];
    val::set("switchbladeDrone", "usability", 0);
    deployweaponobj = makeweapon(bundle.var_cd5b1623cbc6478e);
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponfireddeploy(streakinfo, deployweaponobj, "grenade_fire", undefined, &function_7bf1d7276d8de2c3, &function_7f27487dffce9217);
    if (!istrue(deployresult)) {
        val::reset("switchbladeDrone", "usability");
        return undefined;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    val::reset("switchbladeDrone", "usability");
    return 1;
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbc
// Size: 0x176
function function_df1cf83495e38426() {
    bundle = level.streakglobals.streakbundles["switchblade_drone"];
    dronelist = level.var_cde4ae1afb90a57a;
    var_8a274ec6b6a29b4f = 0;
    var_682d15c80e654eac = 0;
    if (!isdefined(level.var_e5731fb152792de1[self.team])) {
        level.var_e5731fb152792de1[self.team] = 0;
    }
    foreach (drone in dronelist) {
        if (!isdefined(drone)) {
            level.var_cde4ae1afb90a57a = array_remove_key(level.var_cde4ae1afb90a57a, key);
            continue;
        }
        if (drone.owner == self) {
            var_682d15c80e654eac++;
            var_8a274ec6b6a29b4f++;
            continue;
        }
        if (drone.team == self.team) {
            var_8a274ec6b6a29b4f++;
        }
    }
    if (level.var_cde4ae1afb90a57a.size + level.var_e1aa3bddc7b228e9 > bundle.var_c29ccc18c34034e6) {
        return false;
    }
    if (var_8a274ec6b6a29b4f + level.var_e5731fb152792de1[self.team] > bundle.var_9408e94673c89c1d) {
        return false;
    }
    if (var_682d15c80e654eac >= bundle.var_21f9ab90f835561) {
        return false;
    }
    return true;
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd3b
// Size: 0x54
function function_7bf1d7276d8de2c3(streakinfo, switchresult) {
    if (istrue(switchresult)) {
        level.var_e1aa3bddc7b228e9++;
        level.var_e5731fb152792de1[self.team]++;
        thread function_fd39610812b871ee();
        thread function_cde5ec93a0a3eaad(streakinfo);
        val::group_set("switchbladeDrone_deploy", 0);
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd97
// Size: 0x81
function function_fd39610812b871ee() {
    self endon("disconnect");
    self endon("cancel_deploy");
    self endon("weapon_switch_started");
    self endon("grenade_fire");
    self endon("death");
    self notifyonplayercommand("attempt_fire", "+attack");
    while (true) {
        self waittill("attempt_fire");
        if (!self function_6052a9e1b7c3956f()) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_PLACED");
            }
        }
        wait 0.1;
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe20
// Size: 0x15a
function function_cde5ec93a0a3eaad(streakinfo) {
    self endon("disconnect");
    self endon("grenade_fire");
    if (!isbot(self)) {
        self notifyonplayercommand("cancel_deploy", "+actionslot 3");
        self notifyonplayercommand("cancel_deploy", "+actionslot 4");
        self notifyonplayercommand("cancel_deploy", "+actionslot 5");
        self notifyonplayercommand("cancel_deploy", "+actionslot 6");
        self notifyonplayercommand("cancel_deploy", "killstreak1");
        self notifyonplayercommand("cancel_deploy", "killstreak2");
        self notifyonplayercommand("cancel_deploy", "killstreak3");
        self notifyonplayercommand("cancel_deploy", "killstreak4");
        self notifyonplayercommand("cancel_deploy", "+weapprev");
        self notifyonplayercommand("cancel_deploy", "+weapnext");
        self notifyonplayercommand("cancel_deploy", "selectweapon1");
        self notifyonplayercommand("cancel_deploy", "selectweapon2");
    }
    result = waittill_any_return_2("cancel_deploy", "weapon_switch_started");
    val::group_reset("switchbladeDrone_deploy");
    if (!isdefined(result)) {
        return;
    }
    self allowfire(1);
    self.var_be314f32a1d5336e = 0;
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    wait 0.5;
    level.var_e1aa3bddc7b228e9--;
    level.var_e5731fb152792de1[self.team]--;
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf82
// Size: 0x4a3
function function_7f27487dffce9217(streakinfo, weaponobj, projectile) {
    var_d06f735a85408be7 = 0;
    switchblade_drone = function_6fd64a7766f2f12a(projectile);
    bundle = level.streakglobals.streakbundles["switchblade_drone"];
    if (!isdefined(switchblade_drone)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/SWITCHBLADE_DRONE_CANNOT_BE_USED");
        }
        function_44b0c510768ad13e(weaponobj);
        level.var_e1aa3bddc7b228e9--;
        level.var_e5731fb152792de1[self.team]--;
        return "continue";
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "switchblade_drone", self);
    }
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        switchblade_drone [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_ea343190a5d1301e);
    }
    switchblade_drone scripts\cp_mp\emp_debuff::set_apply_emp_callback(&function_ea343190a5d1301e);
    switchblade_drone namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_3a93e509a610b4bd);
    var_d06f735a85408be7 = switchblade_drone function_f50add73e923b629();
    if (!istrue(var_d06f735a85408be7)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/SWITCHBLADE_DRONE_CANNOT_BE_USED");
        }
        function_44b0c510768ad13e(weaponobj);
        if (istrue(bundle.var_9b2586bfb4f3de46)) {
            switchblade_drone function_2eff4cd94c3243e8();
        }
        switchblade_drone thread function_a66b069993cf9abb(1);
        level.var_e1aa3bddc7b228e9--;
        level.var_e5731fb152792de1[self.team]--;
        return "continue";
    }
    level.var_cde4ae1afb90a57a = array_add(level.var_cde4ae1afb90a57a, switchblade_drone);
    level.var_e1aa3bddc7b228e9--;
    level.var_e5731fb152792de1[self.team]--;
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        switchblade_drone [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", self, 0, 1, 100);
    }
    var_8eee8435268b02da = getdvarfloat(@"hash_7ad66a5bc22f0e3c");
    wait var_8eee8435268b02da;
    var_1ba7ca7ba398e6ed = getdvarfloat(@"hash_fec9a646e847f81b");
    var_bc6e4f875380989 = getdvarfloat(@"hash_bb25bfbed73b667b");
    thread function_44b0c510768ad13e(weaponobj, var_1ba7ca7ba398e6ed, var_bc6e4f875380989);
    if (isdefined(switchblade_drone)) {
        switchblade_drone.targetorigin = switchblade_drone.origin;
        var_d06f735a85408be7 = switchblade_drone function_f50add73e923b629();
    } else {
        if (issharedfuncdefined("switchblade_drone", "munitionUsed")) {
            self [[ getsharedfunc("switchblade_drone", "munitionUsed") ]]();
        }
        return "success";
    }
    params = spawnstruct();
    params.fromtrigger = 0;
    switchblade_drone thread function_47b5394a301d8c5(bundle.dronelifetime, @"hash_211a27e9e936be16", &function_4706f9311a69b5bc, params);
    switchblade_drone function_63d1a11f8b22244(streakinfo, &function_ba6789000bf88889);
    switchblade_drone setscriptablepartstate("lockedOn", "activate", 0);
    switchblade_drone.vodestroyed = "switchblade_drone_teamleader_destroyed";
    switchblade_drone.streakname = "switchblade_drone";
    switchblade_drone.streakinfo = streakinfo;
    if (istrue(bundle.candamage) && issharedfuncdefined("damage", "monitorDamage")) {
        switchblade_drone thread [[ getsharedfunc("damage", "monitorDamage") ]](bundle.maxhealth, "hitequip", &function_66a7440055d386c3, &function_7bdb3610d602438d, 0);
    }
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](switchblade_drone.owner, "switchblade_drone");
    }
    self endon("death");
    self endon("disconnect");
    var_87f86cdfa5b85a16 = getdvarint(@"hash_9bb73c3ac9654260");
    switchblade_drone thread function_6ec67c6c636c25d0(switchblade_drone.centerpos, switchblade_drone.startpos, var_87f86cdfa5b85a16);
    switchblade_drone thread function_e2cf8a8b93a4a86f();
    switchblade_drone thread function_f57f532b8644012a();
    if (isdefined(switchblade_drone)) {
        switchblade_drone thread function_171c9b525186dfee();
    }
    if (issharedfuncdefined("switchblade_drone", "munitionUsed")) {
        self [[ getsharedfunc("switchblade_drone", "munitionUsed") ]]();
    }
    return "success";
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x142e
// Size: 0x8a
function function_44b0c510768ad13e(weaponobj, swapdelay, takedelay) {
    if (isdefined(takedelay)) {
        wait takedelay;
    }
    val::group_reset("switchbladeDrone_deploy");
    if (!isdefined(self.lastdroppableweaponobj) || !self hasweapon(self.lastdroppableweaponobj)) {
        lastweaponobj = "iw9_me_fists_mp";
    } else {
        lastweaponobj = scripts\cp_mp\utility\weapon_utility::restoreweaponstates(self.lastdroppableweaponobj);
    }
    if (isdefined(swapdelay)) {
        wait swapdelay;
    }
    _switchtoweaponimmediate(lastweaponobj);
    _takeweapon(weaponobj);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14c0
// Size: 0x3f
function function_a66b069993cf9abb(var_b7fd22ccc4fb4299) {
    self hide();
    if (istrue(var_b7fd22ccc4fb4299)) {
        level.var_cde4ae1afb90a57a = array_remove(level.var_cde4ae1afb90a57a, self);
    }
    wait 1;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1507
// Size: 0x20c
function function_6fd64a7766f2f12a(grenade) {
    grenade thread function_a66b069993cf9abb();
    var_8eee8435268b02da = getdvarfloat(@"hash_7ad66a5bc22f0e3c");
    facingangles = self getgunangles();
    launchpoint = grenade.origin;
    startpointdistance = 100;
    endpointdistance = 1250 * var_8eee8435268b02da;
    var_8db1219df8466cef = launchpoint + anglestoforward(facingangles) * startpointdistance;
    var_c56004b641a6e904 = launchpoint + anglestoforward(facingangles) * endpointdistance;
    startvelocity = anglestoforward(facingangles) * 1250;
    collisioncontents = physics_createcontents(["physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot"]);
    tracehit = physics_raycast(self gettagorigin("tag_eye"), var_8db1219df8466cef, collisioncontents, self, 0, "physicsquery_any");
    if (istrue(tracehit)) {
        return;
    }
    bundle = level.streakglobals.streakbundles["switchblade_drone"];
    switchblade_drone = self launchgrenade(bundle.droneweapon, var_8db1219df8466cef, startvelocity);
    switchblade_drone setscriptablepartstate("visibility", "show");
    switchblade_drone.angles = grenade.angles;
    switchblade_drone.team = self.team;
    switchblade_drone.owner = self;
    switchblade_drone.targetorigin = var_c56004b641a6e904;
    if (istrue(bundle.var_9b2586bfb4f3de46) && issharedfuncdefined("game", "createObjective")) {
        switchblade_drone.minimapid = switchblade_drone [[ getsharedfunc("game", "createObjective") ]](bundle.minimapicon, switchblade_drone.team, 1, 1, 1);
    }
    return switchblade_drone;
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x171c
// Size: 0x31a
function function_f50add73e923b629(streakname, location) {
    level notify("stop_switchblade_droneMoveCircle_thread");
    level endon("game_ended");
    if (!isdefined(location)) {
        self endon("death");
    }
    if (!isdefined(streakname)) {
        streakname = "switchblade_drone";
    }
    bundle = level.streakglobals.streakbundles[streakname];
    var_3174aa0f12ab01af = getdvarint(@"hash_22f1ccc4024de95e");
    var_e605bf7deeb6a128 = getdvarint(@"hash_a80f427a9d36e9fe");
    var_2b9d8028c0dcbb6d = getdvarint(@"hash_f10e873f6059cd5f");
    var_9e6c0acf6618c0a = getdvarint(@"hash_b171aaba052d2c50");
    debugactive = getdvarint(@"hash_211a27e9e936be16");
    var_603716bcd61d52f9 = getdvarint(@"hash_f956bbb2c255914f");
    radius = bundle.dronemaxradius;
    height = bundle.droneminheight;
    centerpos = undefined;
    launchheight = undefined;
    if (isdefined(location)) {
        centerpos = location;
        launchheight = location[2];
    } else {
        centerpos = self.targetorigin;
        launchheight = self.targetorigin[2];
    }
    contents = physics_createcontents(["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_ainoshoot"]);
    var_d06f735a85408be7 = 0;
    while (!var_d06f735a85408be7) {
        radiusvector = (radius + var_9e6c0acf6618c0a, radius + var_9e6c0acf6618c0a, var_9e6c0acf6618c0a);
        centerpos = (centerpos[0], centerpos[1], launchheight + height);
        aabbmin = centerpos - radiusvector;
        aabbmax = centerpos + radiusvector;
        hits = physics_aabbquery(aabbmin, aabbmax, contents, [], "physicsquery_all");
        /#
            if (debugactive > 0) {
                function_36c55ae71072bd03(aabbmin, aabbmax, var_603716bcd61d52f9);
            }
        #/
        if (hits.size == 0) {
            var_d06f735a85408be7 = 1;
        }
        while (!var_d06f735a85408be7 && height <= bundle.dronemaxheight) {
            height += var_e605bf7deeb6a128;
            centerpos = (centerpos[0], centerpos[1], launchheight + height);
            aabbmin = centerpos - radiusvector;
            aabbmax = centerpos + radiusvector;
            hits = physics_aabbquery(aabbmin, aabbmax, contents, [], "physicsquery_all");
            /#
                if (debugactive > 0) {
                    function_36c55ae71072bd03(aabbmin, aabbmax, var_603716bcd61d52f9);
                }
            #/
            if (hits.size == 0) {
                var_d06f735a85408be7 = 1;
                break;
            }
        }
        if (var_d06f735a85408be7 && !isdefined(location)) {
            startlocation = centerpos + anglestoforward(self.angles) * radius;
            self.startpos = startlocation;
            self.centerpos = centerpos;
            continue;
        }
        if (!var_d06f735a85408be7 && radius >= bundle.droneminradius + var_2b9d8028c0dcbb6d) {
            radius -= var_2b9d8028c0dcbb6d;
            height = bundle.droneminheight;
            continue;
        }
        break;
    }
    return var_d06f735a85408be7;
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3f
// Size: 0x1e9
function function_e2cf8a8b93a4a86f() {
    self notify("stop_switchblade_tilt_thread");
    self endon("death");
    level endon("game_ended");
    self endon("stop_switchblade_tilt_thread");
    maxrolldegrees = getdvarint(@"hash_7bd25800dfc29105");
    maxyawdiff = getdvarint(@"hash_832a4160ba33c74b");
    var_cf4febe91831ea56 = (1, 0, 0);
    var_773133c39e93a51d = (0, 1, 0);
    var_d2f1914cf518b7e0 = (0, 0, -1);
    waitframe();
    self.previousorigin = self.origin;
    self.targetangles = self.angles;
    while (true) {
        stepvector = self.origin - self.previousorigin;
        stepunit = vectornormalize(stepvector);
        pitch = asin(vectordot(stepunit, var_d2f1914cf518b7e0));
        stepunit = (stepunit[0], stepunit[1], 0);
        stepunit = vectornormalize(stepunit);
        yaw = acos(vectordot(stepunit, var_cf4febe91831ea56));
        if (vectordot(stepunit, var_773133c39e93a51d) < 0) {
            yaw = 360 - yaw;
        }
        yawdiff = yaw - self.targetangles[1];
        if (abs(yawdiff) > 300) {
            yawdiff -= 360;
        }
        var_a0ce54bdf5ecefa3 = clamp(yawdiff, maxyawdiff * -1, maxyawdiff);
        var_a747f74b413e1808 = var_a0ce54bdf5ecefa3 / maxyawdiff;
        roll = maxrolldegrees * var_a747f74b413e1808 * -1;
        self.previousorigin = self.origin;
        newangles = (pitch, yaw, roll);
        self.targetangles = newangles;
        wait 0.05;
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c30
// Size: 0x30f
function function_f57f532b8644012a() {
    self notify("stop_switchblade_step_thread");
    self endon("death");
    level endon("game_ended");
    self endon("stop_switchblade_step_thread");
    var_38a541b4d6af30a9 = getdvarint(@"hash_57306177bd6ed859");
    var_9d60d851a7af2d4e = getdvarint(@"hash_fa505002fe5586de");
    var_2a86c82583ac927b = getdvarint(@"hash_636a1d843f1957eb");
    self.var_2563490ad9003bb4 = self.angles;
    lastsign = 1;
    while (true) {
        if (isdefined(self.targetangles)) {
            var_fd4ec85a2030035e = angleclamp(self.targetangles[0]);
            fixedcurrentpitch = angleclamp(self.angles[0]);
            fixedtargetyaw = angleclamp(self.targetangles[1]);
            fixedcurrentyaw = angleclamp(self.angles[1]);
            var_9f3eda8daa0eda03 = angleclamp(self.targetangles[2]);
            var_641a388819ce1d85 = angleclamp(self.angles[2]);
            pitcherror = var_fd4ec85a2030035e - fixedcurrentpitch;
            yawerror = fixedtargetyaw - fixedcurrentyaw;
            rollerror = var_9f3eda8daa0eda03 - var_641a388819ce1d85;
            var_a5a7ce89b43ee10c = var_fd4ec85a2030035e - fixedcurrentpitch + 360;
            var_3ef2bd1018948fcc = var_fd4ec85a2030035e - fixedcurrentpitch - 360;
            if (abs(var_a5a7ce89b43ee10c) < abs(pitcherror)) {
                pitcherror = var_a5a7ce89b43ee10c;
            } else if (abs(var_3ef2bd1018948fcc) < abs(pitcherror)) {
                pitcherror = var_3ef2bd1018948fcc;
            }
            var_cd314f4801f94ceb = fixedtargetyaw - fixedcurrentyaw + 360;
            var_8a83d2c73960daab = fixedtargetyaw - fixedcurrentyaw - 360;
            if (abs(var_cd314f4801f94ceb) < abs(yawerror)) {
                yawerror = var_cd314f4801f94ceb;
            } else if (abs(var_8a83d2c73960daab) < abs(yawerror)) {
                yawerror = var_8a83d2c73960daab;
            }
            var_fe6c7708be15720b = var_9f3eda8daa0eda03 - var_641a388819ce1d85 + 360;
            var_26e224b6a576bacb = var_9f3eda8daa0eda03 - var_641a388819ce1d85 - 360;
            if (abs(var_fe6c7708be15720b) < abs(rollerror)) {
                rollerror = var_fe6c7708be15720b;
            } else if (abs(var_26e224b6a576bacb) < abs(rollerror)) {
                rollerror = var_26e224b6a576bacb;
            }
            pitchstep = self.angles[0] + clamp(pitcherror, var_9d60d851a7af2d4e * -1, var_9d60d851a7af2d4e);
            yawstep = self.angles[1] + clamp(yawerror, var_38a541b4d6af30a9 * -1, var_38a541b4d6af30a9);
            rollstep = self.angles[2] + clamp(rollerror, var_2a86c82583ac927b * -1, var_2a86c82583ac927b);
            newangles = (pitchstep, yawstep, rollstep);
            self.angles = newangles;
            lastsign = sign(yawerror);
        }
        wait 0.05;
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f47
// Size: 0x260
function function_6ec67c6c636c25d0(centerpos, startpos, flyvelocity) {
    self endon("death");
    level endon("game_ended");
    var_df9cc7f461e385d2 = getdvarint(@"hash_aea510623d9c4c10");
    var_279949c8caf22661 = getdvarint(@"hash_79f9928723395f7f");
    anglevector = centerpos - startpos;
    flytotaltime = var_df9cc7f461e385d2;
    flystarttime = gettime();
    flystartpoint = self.origin;
    var_265da53443f3b69a = (flystartpoint[0], flystartpoint[1], 0);
    var_94f5017ed47bc92c = flystartpoint[2];
    targetpos = centerpos - anglevector;
    targetposhorizontal = (targetpos[0], targetpos[1], 0);
    targetposvertical = targetpos[2];
    flytimepassed = 0;
    collisioncontents = physics_createcontents(["physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot"]);
    while (flytimepassed < flytotaltime) {
        flytimepassed = gettime() - flystarttime;
        proportion = flytimepassed / flytotaltime;
        var_913e217a8e75ee8b = math::lerp(var_94f5017ed47bc92c, targetposvertical, easesine(proportion, 1, 1));
        var_fb260238a1374a21 = (0, math::angle_lerp(0, var_279949c8caf22661, proportion), 0);
        linearcomponent = vectorlerp(var_265da53443f3b69a, targetposhorizontal, proportion);
        anglevector = var_265da53443f3b69a - targetposhorizontal;
        circlecomponent = var_265da53443f3b69a - rotatevector(anglevector, var_fb260238a1374a21);
        var_cdd4af79a13df11d = vectorlerp(linearcomponent, circlecomponent, proportion);
        newpos = (var_cdd4af79a13df11d[0], var_cdd4af79a13df11d[1], var_913e217a8e75ee8b);
        tracehit = physics_raycast(self.origin, newpos, collisioncontents, self, 0, "physicsquery_any");
        if (istrue(tracehit)) {
            function_344501824416bd86(0);
            return;
        }
        self.origin = newpos;
        waitframe();
    }
    var_757932149c26a130 = (0, var_279949c8caf22661, 0);
    anglevector = centerpos - startpos;
    rotatedstartpos = centerpos - rotatevector(anglevector, var_757932149c26a130);
    thread function_5c89eb12f323ab1e(centerpos, rotatedstartpos, flyvelocity);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21af
// Size: 0x13f
function function_5c89eb12f323ab1e(centerpos, startpos, flyvelocity) {
    self notify("flyingNewCircle");
    self endon("death");
    self endon("foundBestTarget");
    self endon("diveBombing");
    self endon("flyingNewCircle");
    level endon("game_ended");
    anglevector = centerpos - startpos;
    flyradius = distance(startpos, centerpos);
    totaltime = float(6.28 * flyradius / flyvelocity) * 1000;
    starttime = gettime();
    startangle = 0;
    endangle = 180;
    while (true) {
        if (!isdefined(self)) {
            return;
        }
        timepassed = gettime() - starttime;
        fraction = min(timepassed / totaltime, 1);
        var_fb338f3adaa14f2c = math::angle_lerp(startangle, endangle, fraction);
        newvector = rotatevector(anglevector, (0, var_fb338f3adaa14f2c, 0));
        newpos = centerpos - newvector;
        self.origin = newpos;
        if (fraction >= 1) {
            starttime = gettime();
            anglevector = newvector;
        }
        waitframe();
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22f6
// Size: 0x3f8
function function_171c9b525186dfee(streakname, centerposzoffset) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_end");
    var_6ffab0b1f38dae17 = getdvarint(@"hash_cda65d1126957523");
    wait var_6ffab0b1f38dae17;
    contents = physics_createcontents(["physicscontents_characterproxy", "physicscontents_vehicle"]);
    while (true) {
        centerpos = (self.origin[0], self.origin[1], self.origin[2] / 1.5);
        if (!isdefined(streakname)) {
            streakname = "switchblade_drone";
        }
        if (isdefined(centerposzoffset)) {
            centerpos += (0, 0, centerposzoffset);
        }
        bundle = level.streakglobals.streakbundles["switchblade_drone"];
        var_9e6c0acf6618c0a = getdvarint(@"hash_b171aaba052d2c50");
        lengthvector = (bundle.var_eed1966ca1124f9 / 2 + var_9e6c0acf6618c0a, bundle.var_9e4f84bfa849e82b / 2 + var_9e6c0acf6618c0a, bundle.var_95c9f93c7b737ac6 + var_9e6c0acf6618c0a);
        aabbmin = centerpos - lengthvector;
        aabbmax = centerpos + lengthvector;
        hits = physics_aabbquery(aabbmin, aabbmax, contents, [], "physicsquery_all");
        /#
            var_7d5a24fd00c5eed = getdvarint(@"hash_b0c1d0793ae379c7");
            debugactive = getdvarint(@"hash_211a27e9e936be16");
            if (debugactive > 0) {
                var_603716bcd61d52f9 = getdvarint(@"hash_f956bbb2c255914f");
                function_36c55ae71072bd03(aabbmin, aabbmax, var_603716bcd61d52f9);
            }
        #/
        validtargets = [];
        index = 0;
        foreach (hit in hits) {
            if ((isplayer(hit) || isagent(hit)) && hit function_87072b42853a9c58("specialty_blindeye")) {
                continue;
            }
            if (isdefined(hit.team) && hit.team != self.team) {
                /#
                    function_47bd4689d0d9b39e(hit.origin);
                #/
                if (isplayer(hit) || isagent(hit)) {
                    validtargets[index] = hit;
                    index++;
                } else if (isdefined(hit.owner) && isdefined(hit.ownerteam) && hit.ownerteam != self.team) {
                    validtargets[index] = hit;
                    index++;
                } else if (isdefined(hit.vehicletype) && hit.team != "neutral") {
                    validtargets[index] = hit;
                    index++;
                }
            }
            /#
                if (istrue(var_7d5a24fd00c5eed)) {
                    if ((isplayer(hit) || isagent(hit)) && isdefined(hit.team) && hit.team == self.team) {
                        function_47bd4689d0d9b39e(hit.origin);
                        validtargets[index] = hit;
                        index++;
                        continue;
                    }
                    if (isdefined(hit.owner) && isdefined(hit.ownerteam) && hit.ownerteam == self.team) {
                        function_47bd4689d0d9b39e(hit.origin);
                        validtargets[index] = hit;
                        index++;
                    }
                }
            #/
        }
        if (validtargets.size > 0) {
            function_a831421d6d91a68(validtargets);
        }
        wait bundle.var_2855f87b9236ea60;
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26f6
// Size: 0x198
function function_a831421d6d91a68(validtargets) {
    validtargets = sortbydistance(validtargets, self.origin);
    var_68e6f05a4ee24dee = physics_createcontents(["physicscontents_vehicleclip", "physicscontents_item", "physicscontents_ainoshoot"]);
    var_2fd6147a345c3d71 = physics_createcontents(["physicscontents_item", "physicscontents_ainoshoot"]);
    foreach (target in validtargets) {
        /#
            debugactive = getdvarint(@"hash_211a27e9e936be16");
            if (debugactive > 0) {
                var_603716bcd61d52f9 = getdvarint(@"hash_f956bbb2c255914f");
                line(self.origin, target.origin, (0, 0, 100), 1, 0, var_603716bcd61d52f9);
            }
        #/
        var_97db5d48f2509e02 = undefined;
        if (isplayer(target) || isagent(target)) {
            var_97db5d48f2509e02 = physics_raycast(self.origin, target.origin, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_closest");
        } else {
            var_97db5d48f2509e02 = physics_raycast(self.origin, target.origin, var_2fd6147a345c3d71, undefined, 0, "physicsquery_closest");
        }
        if (var_97db5d48f2509e02.size == 0) {
            self notify("foundBestTarget");
            function_1c87d0008280beb0(target);
            break;
        }
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2896
// Size: 0xd1
function function_e99de59922a658c2(besttarget) {
    var_68e6f05a4ee24dee = physics_createcontents(["physicscontents_vehicleclip", "physicscontents_item", "physicscontents_ainoshoot"]);
    var_2fd6147a345c3d71 = physics_createcontents(["physicscontents_item", "physicscontents_ainoshoot"]);
    var_97db5d48f2509e02 = undefined;
    if (isplayer(besttarget) || isagent(besttarget)) {
        var_97db5d48f2509e02 = physics_raycast(self.origin, besttarget.origin, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_closest", 1);
    } else {
        var_97db5d48f2509e02 = physics_raycast(self.origin, besttarget.origin, var_2fd6147a345c3d71, undefined, 0, "physicsquery_closest", 1);
    }
    if (var_97db5d48f2509e02.size == 0) {
        return true;
    }
    return false;
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2970
// Size: 0x230
function function_1c87d0008280beb0(besttarget, targetloc) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_end");
    self.var_c69028d21747744b = 1;
    starttime = gettime();
    timepassed = 0;
    var_90f8682d56eb4664 = getdvarint(@"hash_836eeca87d3a3d6f");
    var_a4e60d1f42b38d56 = getdvarint(@"hash_fc2d155242a3fc25");
    assert(var_90f8682d56eb4664 > 0);
    assert(var_a4e60d1f42b38d56 > 0);
    var_433184866bfb7ebc = getdvarint(@"hash_3bc605f5a6462807");
    self setscriptablepartstate("lockedOn", "preparing", 1);
    startpos = self.origin;
    lowertargetpos = startpos - anglestoup(self.angles) * var_433184866bfb7ebc;
    var_e054a30a6db5956c = getdvarint(@"hash_9bb73c3ac9654260");
    var_211bf2b19120d8ab = getdvarint(@"hash_d40e17bd9fa003a1");
    preparecenter = self.origin + vectornormalize(self.centerpos - self.origin) * var_211bf2b19120d8ab;
    thread function_5c89eb12f323ab1e(preparecenter, self.origin, var_e054a30a6db5956c);
    while (timepassed < var_90f8682d56eb4664) {
        timepassed = gettime() - starttime;
        if (isent(besttarget)) {
            isinlos = function_e99de59922a658c2(besttarget);
        }
        if (isdefined(isinlos) && !istrue(isinlos)) {
            self setscriptablepartstate("lockedOn", "idle", 1);
            thread function_5c89eb12f323ab1e(self.centerpos, self.origin, var_e054a30a6db5956c);
            self.var_c69028d21747744b = 0;
            return;
        }
        wait 0.1;
    }
    while (timepassed < var_a4e60d1f42b38d56) {
        timepassed = gettime() - starttime;
        if (function_b6d0baeed8dac51(besttarget, targetloc)) {
            function_3c15b092a77b0142(besttarget, targetloc);
            return;
        }
        wait 0.1;
    }
    function_3c15b092a77b0142(besttarget, targetloc);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba8
// Size: 0xd6
function function_b6d0baeed8dac51(target, targetloc) {
    assert(isdefined(target) || isdefined(targetloc));
    targetorigin = undefined;
    if (isdefined(target)) {
        targetorigin = target.origin;
    } else if (isdefined(targetloc)) {
        targetorigin = targetloc;
    }
    var_6d2275b0b1b6da95 = (targetorigin[0], targetorigin[1], targetorigin[2]);
    fromtarget = vectornormalize(var_6d2275b0b1b6da95 - self.origin);
    var_1ebe75779c2d5f96 = vectornormalize(anglestoforward(self.angles));
    dot = vectordot(fromtarget, var_1ebe75779c2d5f96);
    if (dot <= 0) {
        return false;
    }
    dotthreshold = 0.7;
    if (dot > dotthreshold) {
        return true;
    }
    return false;
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c87
// Size: 0x315
function function_3c15b092a77b0142(target, targetloc) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_end");
    self notify("diveBombing");
    assert(isdefined(target) || isdefined(targetloc));
    targetpos = undefined;
    if (isdefined(target)) {
        targetpos = target.origin;
    } else if (isdefined(targetloc)) {
        targetpos = targetloc;
    }
    starttime = gettime();
    startpos = self.origin;
    totaldistance = distance(self.origin, targetpos);
    self setscriptablepartstate("lockedOn", "moving", 1);
    var_3174aa0f12ab01af = getdvarint(@"hash_22f1ccc4024de95e");
    var_134d0390a5b98256 = getdvarint(@"hash_1da226fe14849c74");
    var_39a9b19eabdfe7d = getdvarint(@"hash_b9597bb5bad14e63");
    totaltime = float(totaldistance / var_134d0390a5b98256 * 1000);
    assert(totaltime > 0);
    collisioncontents = undefined;
    if (isplayer(target) || isagent(target)) {
        collisioncontents = physics_createcontents(["physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot"]);
    } else {
        collisioncontents = physics_createcontents(["physicscontents_missileclip", "physicscontents_clipshot"]);
    }
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](self.streakinfo);
    }
    while (distance(self.origin, targetpos) > var_39a9b19eabdfe7d) {
        timepassed = gettime() - starttime;
        fraction = float(min(timepassed / totaltime, 1));
        var_24c703f3c8ab20f8 = (startpos[0], startpos[1], 0);
        var_31924601a0fd6ef2 = startpos[2];
        targetposhorizontal = (targetpos[0], targetpos[1], 0);
        targetposvertical = targetpos[2];
        var_cdd4af79a13df11d = vectorlerp(var_24c703f3c8ab20f8, targetposhorizontal, fraction);
        var_913e217a8e75ee8b = math::lerp(var_31924601a0fd6ef2, targetposvertical, easesine(fraction, 1, 1));
        targetlocation = math::lerp(startpos, targetpos, easepower(fraction, 2, 1, 1));
        tracehit = physics_raycast(self.origin, targetlocation, collisioncontents, self, 0, "physicsquery_any");
        if (istrue(tracehit)) {
            function_344501824416bd86(1);
            return;
        }
        self.origin = targetlocation;
        waitframe();
    }
    self.var_c69028d21747744b = 0;
    function_344501824416bd86(1);
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](self.streakinfo);
    }
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa4
// Size: 0x29
function function_ea343190a5d1301e(data) {
    attacker = data.attacker;
    function_344501824416bd86(0);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fd5
// Size: 0x29
function function_3a93e509a610b4bd(data) {
    attacker = data.attacker;
    function_344501824416bd86(0);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3006
// Size: 0x3c
function function_344501824416bd86(fromtrigger) {
    params = spawnstruct();
    params.fromtrigger = fromtrigger;
    function_60f31efcd5e96e72(params);
    callback::callback("on_functional_death");
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x304a
// Size: 0x27
function function_ba6789000bf88889(params) {
    params = spawnstruct();
    params.fromtrigger = 0;
    function_60f31efcd5e96e72(params);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3079
// Size: 0x2d
function function_4706f9311a69b5bc(params) {
    self.owner function_8959c1606f65e65("switchblade_drone", "switchblade_drone_teamleader_timeout");
    function_60f31efcd5e96e72(params);
}

// Namespace switchblade_drone / namespace_e5c25349d02a540b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30ae
// Size: 0x102
function function_60f31efcd5e96e72(params) {
    if (isdefined(level.var_ca1a76fbc0ba0bef)) {
        thread [[ level.var_ca1a76fbc0ba0bef ]](self.streakinfo, self.origin, 0);
    }
    level.var_cde4ae1afb90a57a = array_remove(level.var_cde4ae1afb90a57a, self);
    fromtrigger = params.fromtrigger;
    forward = anglestoup(self.angles);
    right = -1 * anglestoright(self.angles);
    up = anglestoforward(self.angles);
    var_f451f1efd8b651c8 = self getscriptablepartstate("explode");
    if (var_f451f1efd8b651c8 == "fromtrigger") {
        return;
    }
    if (istrue(fromtrigger)) {
        self setscriptablepartstate("explode", "fromtrigger", 0);
        return;
    }
    self setscriptablepartstate("explode", "fromdamage", 0);
}

/#

    // Namespace switchblade_drone / namespace_e5c25349d02a540b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x31b8
    // Size: 0x3f
    function function_47bd4689d0d9b39e(center) {
        var_603716bcd61d52f9 = getdvarint(@"hash_f956bbb2c255914f");
        sphere(center, 15, (0, 0, 255), 0, var_603716bcd61d52f9);
    }

#/
