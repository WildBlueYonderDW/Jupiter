// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_77c18cdedec620b3;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_38eb8f4be20d54f4;

#namespace bunker_buster;

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x500
// Size: 0x19
function autoexec main() {
    namespace_71a41ba7aee93481::function_df7ab5b0f898e8bc(function_1823ff50bb28148d("bunker_buster"), &init);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x520
// Size: 0x71
function private init() {
    /#
        utility::function_2bf8ec790b5a10f8(@"hash_fa92580eadd91682", &debug_init);
    #/
    if (utility::issharedfuncdefined("bunker_buster", "init")) {
        [[ utility::getsharedfunc("bunker_buster", "init") ]]();
    }
    namespace_2b1145f62aa835b8::function_62de81d97c7d9e49("bunker_buster", &function_4927316e0d7c0fde, undefined, undefined);
    utility::registersharedfunc("bunker_buster", "tryUseKillstreak", &function_4927316e0d7c0fde);
    function_99d863f35da14696();
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x598
// Size: 0x183
function private function_99d863f35da14696() {
    level.bunker_buster = {count:0, active:[], var_3d028e278e3c71d8:2};
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["bunker_buster"];
    /#
        /#
            assertex(isdefined(bundle), "explode_water" + "classname" + "<unknown string>" + "<unknown string>");
        #/
    #/
    level.bunker_buster.var_3dcc8e3bfb7a7d98 = getdvarint(@"hash_13661b583bd4e977", bundle.var_af691ff0e5ce5649);
    level.bunker_buster.var_89eb3c46042f1a1 = getdvarint(@"hash_84afb79d4b21c60a", bundle.var_9f87e4c344f40cb8);
    level.bunker_buster.var_e6aea9d1b86c57a5 = getdvarint(@"hash_45fce07839c26931", bundle.var_3232856ac106d7ea);
    level.bunker_buster.explosion_radius = getdvarint(@"hash_e9222aff0b6e25e4", bundle.var_f2c3bbfb75adbeee);
    level.bunker_buster.var_fc268ff83cc63313 = getdvarint(@"hash_c84afea8311a2900", bundle.var_1029beb459a7eeb3);
    level.bunker_buster.var_daf4bed8de8f6195 = getdvarint(@"hash_99d9088bfc5cb982", bundle.var_f650a0ecedab0825);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x722
// Size: 0x10a
function private function_4927316e0d7c0fde(streakinfo) {
    if (!isdefined(streakinfo)) {
        streakinfo = namespace_8319cdbe938cd234::createstreakinfo("bunker_buster", self);
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["bunker_buster"];
    var_9b1deb5e9d32bbe3 = namespace_2b1145f62aa835b8::function_de31b76c1bf488e8(streakinfo, namespace_45ecbe78f599af72::function_eeaa22f0cd1ff845(bundle.deployweaponname), "weapon_fired", &function_bc826a7fccd0726, &airstrike::weaponswitchendedairstrike, &function_ae65fc01c45c017);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        self setclientomnvar("ui_using_bunkerbuster", 0);
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    if (utility::issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ utility::getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "bunker_buster", self);
    }
    function_35c0ac0a980462f8(streakinfo);
    return 1;
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x834
// Size: 0x61
function private function_bc826a7fccd0726(streakinfo) {
    if (level.bunker_buster.active.size >= level.bunker_buster.var_3d028e278e3c71d8) {
        [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        return 0;
    }
    self setclientomnvar("ui_using_bunkerbuster", 1);
    return 1;
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x89d
// Size: 0xcb
function private function_ae65fc01c45c017(streakinfo, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780) {
    if (!isdefined(streakinfo.targetoverride)) {
        var_b21e2e887c161b9 = airstrike::airstrike_getownerlookatpos(self, 1);
        if (!isdefined(var_b21e2e887c161b9)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/INVALID_POINT");
            }
            return "continue";
        }
    }
    if (namespace_2b1145f62aa835b8::function_f3890748bda5f813()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_USED");
        }
        return "continue";
    }
    if (namespace_2b1145f62aa835b8::function_b1412f0ab907bab7()) {
        self setclientomnvar("ui_using_bunkerbuster", 0);
    }
    return "success";
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x7f
function private function_35c0ac0a980462f8(streakinfo) {
    streakinfo.uid = function_a9a0e979105b948d();
    thread function_310cef1f62dd5600(streakinfo);
    level.bunker_buster.active = utility::array_add(level.bunker_buster.active, streakinfo.uid);
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f6
// Size: 0x162
function function_310cef1f62dd5600(streakinfo) {
    streakinfo.shots_fired++;
    var_1876c713657db5ce = isdefined(streakinfo.targetoverride) ? toma_strike::tomastrike_getownerlookat(self) : streakinfo.targetoverride;
    marker = utility::spawn_model("ks_toma_strike_marker_mp", var_1876c713657db5ce);
    marker.objidnum = 0;
    marker.icon = "icon_waypoint_bunker_buster";
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
        marker.objidnum = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID") ]](99);
    }
    marker setotherent(self);
    marker toma_strike::toma_strike_setmarkerobjective(marker.objidnum, marker.icon, self, 50);
    marker thread function_aad1a178bf665f2a();
    utility::function_f3bb4f4911a1beb2("bunker_buster", "dialog_deploy", self);
    namespace_2b1145f62aa835b8::function_940b2080e171a9d3(self, self.team, 1024, "bunker_buster", var_1876c713657db5ce);
    var_a871248d832185e9 = function_153d5add7253b500(self, self.team, 1024, var_1876c713657db5ce);
    utility::function_f3bb4f4911a1beb2("bunker_buster", "dialog_warning", var_a871248d832185e9[0], var_a871248d832185e9[1]);
    namespace_2b1145f62aa835b8::function_2284137aa92dbd16(4);
    function_6c6eefbd85f74bf2(var_1876c713657db5ce, streakinfo);
    thread function_a965b9673ccbe621(streakinfo);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5f
// Size: 0x85
function function_a965b9673ccbe621(streakinfo) {
    if (utility::array_contains(level.bunker_buster.active, streakinfo.uid)) {
        level.bunker_buster.active = utility::array_remove(level.bunker_buster.active, streakinfo.uid);
    }
    level notify("bunker_buster" + "_finished_" + streakinfo.uid);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbeb
// Size: 0xcd
function private function_153d5add7253b500(owner, team, range, location) {
    players = getplayersinradius(location, range, 1000);
    friendlies = [];
    enemies = [];
    foreach (player in players) {
        if (player == owner) {
            continue;
        }
        if (player.team == team) {
            friendlies[friendlies.size] = player;
        } else {
            enemies[enemies.size] = player;
        }
    }
    return [0:friendlies, 1:enemies];
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc0
// Size: 0x37
function function_a9a0e979105b948d() {
    level.bunker_buster.count++;
    return self getxuid() + "_" + level.bunker_buster.count;
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcff
// Size: 0x2fd
function function_6c6eefbd85f74bf2(position, streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("bunker_buster" + "_finished_" + streakinfo.uid);
    missile = function_33fc4f4b21e3411f(position, 5000, (0, 0, -1000));
    missile.streakinfo = streakinfo;
    missile.streakname = streakinfo.streakname;
    results = missile function_f4b21fbcf97269e8(self);
    var_6a6e12362fcab6e9 = results[0];
    missile = results[1];
    hit = results[2];
    if (!isdefined(missile)) {
        return;
    }
    streakinfo.var_31b3f90c52110c13 = missile.origin;
    streakinfo.var_3c76575cf3375e9b = missile.var_3c76575cf3375e9b;
    streakinfo.impact_time = namespace_36f464722d326bbe::gettimepassed();
    missile function_9d0257c1da72ca5d();
    missile.angles = (0, 0, 0);
    if (missile islinked()) {
        missile unlink();
    }
    missile setscriptablepartstate("visibility", "hide");
    missile.exploded = 1;
    waitframe();
    if (istrue(streakinfo.var_3c76575cf3375e9b)) {
        goto LOC_00000169;
    }
    missile setscriptablepartstate("explode", "explode", "explode_water");
    missile function_451201427aca809();
    streakinfo.explosion_victims = function_5ddd621f797a85b5(streakinfo.var_31b3f90c52110c13, self.team);
    streakinfo.gas_victims = [];
    if (istrue(hit)) {
        streakinfo.explosion_victims["exception_credit"] = 1;
    }
    wait(1);
    missile delete();
    utility::function_f3bb4f4911a1beb2("bunker_buster", "missile_gas_volume", streakinfo.var_31b3f90c52110c13 + (0, 0, 128), streakinfo.var_31b3f90c52110c13 - (0, 0, level.bunker_buster.var_e6aea9d1b86c57a5), level.bunker_buster.var_89eb3c46042f1a1, streakinfo);
    thread function_61ac63303c87acda(3, streakinfo);
    level thread function_4c86258acf5f82bf(streakinfo.var_31b3f90c52110c13, streakinfo.var_3c76575cf3375e9b);
    streakinfo.mapcircle = function_dc11c1caffe56e16("NovaGas_Br", streakinfo.var_31b3f90c52110c13[0], streakinfo.var_31b3f90c52110c13[1], level.bunker_buster.var_89eb3c46042f1a1, self);
    streakinfo.mapcircle show();
    streakinfo.mapcircle thread utility::function_b4b04de87729a6f3(level.bunker_buster.var_3dcc8e3bfb7a7d98);
    level thread function_d86280932be7b254(level.bunker_buster.var_3dcc8e3bfb7a7d98, streakinfo);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1003
// Size: 0x25
function function_d86280932be7b254(delay, var_70437d3c1365ec0c) {
    level endon("game_ended");
    wait(delay);
    function_184a66360bf3e401(var_70437d3c1365ec0c);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x102f
// Size: 0xa9
function private function_5ddd621f797a85b5(location, owner_team) {
    var_fbc7414effb8535c = getplayersinradius(location, level.bunker_buster.explosion_radius);
    victims = [];
    foreach (player in var_fbc7414effb8535c) {
        if (player.team == owner_team) {
            continue;
        }
        victims[player getentitynumber()] = 1;
    }
    return victims;
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10e0
// Size: 0x37
function private function_61ac63303c87acda(delay, var_70437d3c1365ec0c) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    wait(delay);
    utility::function_f3bb4f4911a1beb2("bunker_buster", "dialog_hits", self, var_70437d3c1365ec0c);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111e
// Size: 0x221
function function_33fc4f4b21e3411f(origin, offset, velocity, var_f5a020edf8574208, var_8eb5937f6c4488e7) {
    if (!isdefined(offset)) {
        offset = 4096;
    }
    if (!isdefined(velocity)) {
        velocity = (0, 0, 0);
    }
    if (!isdefined(var_f5a020edf8574208)) {
        var_f5a020edf8574208 = 6;
    }
    var_206dbd116490dd48 = {initvelocity:velocity, sourcepos:origin + (0, 0, offset), goalpos:origin};
    missile = magicgrenademanual("bunker_buster_proj_jup_mp", var_206dbd116490dd48.sourcepos, var_206dbd116490dd48.initvelocity, var_f5a020edf8574208, self);
    if (!isdefined(var_8eb5937f6c4488e7)) {
        missile setscriptablepartstate("trail", "active", 0);
    } else {
        missile setscriptablepartstate("trail", "continue", 0);
    }
    if (!isdefined(var_8eb5937f6c4488e7)) {
        missile setscriptablepartstate("launch", "active", 0);
    }
    if (isdefined(var_8eb5937f6c4488e7)) {
        minimapid = var_8eb5937f6c4488e7.minimapid;
        streakinfo = var_8eb5937f6c4488e7.streakinfo;
        var_8eb5937f6c4488e7 delete();
    } else {
        minimapid = undefined;
        if (utility::issharedfuncdefined("game", "createObjective")) {
            minimapid = missile [[ utility::getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_bunker_buster", self.team, undefined, 1, 1);
        }
    }
    missile.minimapid = minimapid;
    missile.owner = self;
    if (isdefined(streakinfo)) {
        missile.streakinfo = streakinfo;
        missile.streakname = streakinfo.streakname;
    }
    missile setentityowner(self);
    missile setotherent(self);
    missile forcenetfieldhighlod(1);
    missile thread function_fd8677bd03da3d3b();
    missile thread function_93c5e685b2a30986();
    missile.empapplycallback = &function_240e63c6a103482b;
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        missile [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_240e63c6a103482b);
    }
    return missile;
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1347
// Size: 0x98
function function_451201427aca809() {
    radiusdamage(self.origin, level.bunker_buster.explosion_radius, level.bunker_buster.var_fc268ff83cc63313, level.bunker_buster.var_daf4bed8de8f6195, self.owner, "MOD_EXPLOSIVE", undefined, 0, 0);
    function_e45e5fd94ec4af36(0.5, 0.3, 0.2, 1.5, self.origin, level.bunker_buster.explosion_radius, 1000, 5000);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e6
// Size: 0x66
function function_93c5e685b2a30986() {
    self endon("stuck");
    level endon("game_ended");
    self waittill("emp_debuff");
    self setscriptablepartstate("explode", "explode_air");
    self setscriptablepartstate("visibility", "hide");
    waitframe();
    function_451201427aca809();
    function_9d0257c1da72ca5d();
    function_a965b9673ccbe621(self.streakinfo);
    self delete();
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1453
// Size: 0x3f
function function_fd8677bd03da3d3b() {
    self endon("death");
    level endon("game_ended");
    self.owner waittill("disconnect");
    function_9d0257c1da72ca5d();
    function_a965b9673ccbe621(self.streakinfo);
    self delete();
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1499
// Size: 0x60
function function_aad1a178bf665f2a() {
    self endon("death");
    self setscriptablepartstate("target", "on", 0);
    namespace_2b1145f62aa835b8::function_2284137aa92dbd16(6);
    if (isdefined(self)) {
        if (utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ utility::getsharedfunc("game", "returnObjectiveID") ]](self.objidnum);
        }
        self delete();
    }
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1500
// Size: 0x51
function function_9d0257c1da72ca5d() {
    namespace_2b1145f62aa835b8::function_6262c3a1ef0924d(0);
    if (isdefined(self.minimapid)) {
        if (utility::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ utility::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1558
// Size: 0x267
function function_f4b21fbcf97269e8(player) {
    missile = self;
    hit = 0;
    while (1) {
        var_7d1c75f6e04015b8 = missile namespace_71a41ba7aee93481::function_51afe751c1e36723("missile_stuck", "missile_water_impact");
        var_6a6e12362fcab6e9 = undefined;
        if (isdefined(var_7d1c75f6e04015b8)) {
            if (var_7d1c75f6e04015b8.msg == "missile_stuck") {
                var_6a6e12362fcab6e9 = var_7d1c75f6e04015b8.param1;
            } else if (var_7d1c75f6e04015b8.msg == "missile_water_impact") {
                missile.var_3c76575cf3375e9b = 1;
            }
        }
        if (!isdefined(var_6a6e12362fcab6e9) && isdefined(var_7d1c75f6e04015b8.param5)) {
            var_c8004735a05ab3f7 = sortbydistance(getentitylessscriptablearray("scriptable_scriptable_redeploy_drone", "classname"), var_7d1c75f6e04015b8.param5)[0];
            if (isdefined(var_c8004735a05ab3f7) && istrue(var_c8004735a05ab3f7.b_occupied) && distancesquared(var_7d1c75f6e04015b8.param5, var_c8004735a05ab3f7.origin) < squared(100)) {
                if (!istrue(var_c8004735a05ab3f7.var_3d94e3b5be6fd3d1)) {
                    if (namespace_3c37cb17ade254d::issharedfuncdefined("redeploy_drone", "redeploy_drone_repopulation_watcher")) {
                        level thread [[ namespace_3c37cb17ade254d::getsharedfunc("redeploy_drone", "redeploy_drone_repopulation_watcher") ]](var_c8004735a05ab3f7);
                    }
                }
                if (namespace_3c37cb17ade254d::issharedfuncdefined("redeploy_drone", "redeploy_drone_destroyed")) {
                    var_c8004735a05ab3f7 [[ namespace_3c37cb17ade254d::getsharedfunc("redeploy_drone", "redeploy_drone_destroyed") ]](player, undefined, 1);
                }
                hit = 1;
                missile = player function_33fc4f4b21e3411f(missile.origin, 0, (0, 0, -3000), undefined, missile);
                continue;
            }
        }
        if (isdefined(var_6a6e12362fcab6e9) && isdefined(var_6a6e12362fcab6e9.classname) && var_6a6e12362fcab6e9.classname == "script_vehicle") {
            data = spawnstruct();
            data.inflictor = self;
            data.objweapon = undefined;
            data.meansofdeath = "MOD_CRUSH";
            data.attacker = player;
            var_6a6e12362fcab6e9 thread namespace_1f188a13f7e79610::vehicle_explode(data, 1);
            hit = 1;
            missile = player function_33fc4f4b21e3411f(missile.origin, 0, (0, 0, -3000), undefined, missile);
            continue;
        }
        return [0:var_6a6e12362fcab6e9, 1:missile, 2:hit];
    }
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c6
// Size: 0x155
function function_4c86258acf5f82bf(var_f9e9f4dbc1ef91d7, var_3c76575cf3375e9b) {
    level endon("game_ended");
    scriptables = [];
    if (!istrue(var_3c76575cf3375e9b)) {
        dir = (0, 0, -1);
        var_3f922f82c0a748e6 = level.bunker_buster.var_e6aea9d1b86c57a5 / 2 * dir;
        height_offset = var_3f922f82c0a748e6 * 0.5;
        for (i = 0; i < 2; i++) {
            s = spawnscriptable("ks_bunker_buster_gas_sfx", var_f9e9f4dbc1ef91d7 + var_3f922f82c0a748e6 * i + height_offset);
            s setscriptablepartstate("ks_bunker_buster_gas_sfx", "on");
            scriptables[scriptables.size] = s;
        }
    } else {
        s = spawnscriptable("ks_bunker_buster_gas_sfx", var_f9e9f4dbc1ef91d7);
        s setscriptablepartstate("ks_bunker_buster_gas_sfx", "on");
        scriptables[scriptables.size] = s;
    }
    wait(level.bunker_buster.var_3dcc8e3bfb7a7d98);
    foreach (scriptable in scriptables) {
        scriptable freescriptable();
    }
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1922
// Size: 0x35
function function_240e63c6a103482b(data) {
    if (isdefined(self) && isdefined(self.owner) && !istrue(self.exploded)) {
        self notify("emp_debuff");
    }
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195e
// Size: 0xbe
function function_184a66360bf3e401(var_70437d3c1365ec0c) {
    eventparams = [0:"pos_x", 1:var_70437d3c1365ec0c.var_31b3f90c52110c13[0], 2:"pos_y", 3:var_70437d3c1365ec0c.var_31b3f90c52110c13[1], 4:"pos_z", 5:var_70437d3c1365ec0c.var_31b3f90c52110c13[2], 6:"impact_time", 7:var_70437d3c1365ec0c.impact_time, 8:"explosion_victims", 9:var_70437d3c1365ec0c.explosion_victims.size, 10:"gas_victims", 11:var_70437d3c1365ec0c.gas_victims.size];
    dlog_recordevent("dlog_event_br_bunker_buster_complete", eventparams);
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a23
// Size: 0x6
function function_b1eab7c7fda1fb57() {
    /#
    #/
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a30
// Size: 0xf
function debug_init() {
    /#
        level thread function_db5c75f2a84ff03d();
    #/
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a46
// Size: 0x2f
function function_db5c75f2a84ff03d() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_defff2269ca98e79);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace bunker_buster/namespace_a86704cc4785573f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7c
// Size: 0xaa
function function_defff2269ca98e79() {
    /#
        v_pos = (3673, 7719, 5000);
        heli = sortbydistance(level.vehicle.instances["<unknown string>"], v_pos)[0];
        if (heli == level.var_f8884cc3ba34c12b.heli) {
            heli = sortbydistance(level.vehicle.instances["<unknown string>"], v_pos)[1];
        }
        while (isalive(heli)) {
            heli vehicle_teleport(v_pos, (0, 0, 0), 1);
            waitframe();
        }
    #/
}

