// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_608c50392df8c7d1;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using script_439fa02b5251fa5b;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;

#namespace lrad;

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x873
// Size: 0x19
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("lrad"), &init);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x893
// Size: 0xff
function private init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("lrad", &function_5dae574697e78d96);
    }
    namespace_3c37cb17ade254d::registersharedfunc("lrad", "tryUseKillstreak", &function_5dae574697e78d96);
    namespace_3c37cb17ade254d::registersharedfunc("lrad", "LRAD_Hack", &LRAD_Hack);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["lrad"];
    function_a41e3a211a9e37a4("lrad", bundle.var_8881166e57766e3a, #"hash_b76b2215370d2700");
    function_1212a209876bcd8d();
    function_795e8013831a046a();
    level.var_2d9a7cb2b0831e1e = 0;
    level.var_23bb4defc5121d06 = [];
    level.var_f22117519609ef3b = [];
    /#
        if (game_utility::isBRStyleGameType()) {
            devgui::function_6e7290c8ee4f558b("setEMP_Applied_Callback");
            devgui::function_a2fe753948998c89("idle", "createObjective");
            devgui::function_fe953f000498048f();
        }
    #/
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x173
function function_1212a209876bcd8d() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["lrad"];
    /#
        setdvarifuninitialized(@"hash_80d0084f17797030", 0);
        setdvarifuninitialized(@"hash_5f9bf6b2e15e5727", 0);
        setdvarifuninitialized(@"hash_356ad37ca5f6f115", 1000);
    #/
    setdvarifuninitialized(@"hash_98efcf229168a436", bundle.var_3eda8aab19e89979);
    setdvarifuninitialized(@"hash_1df62822bd2adee0", bundle.maxhealth);
    setdvarifuninitialized(@"hash_d7fd0b0d5f62285c", 0.85);
    setdvarifuninitialized(@"hash_6aa2e155bf9747", 16);
    setdvarifuninitialized(@"hash_b4d9a80ce75c617", bundle.var_92418e7f80b9d06e);
    setdvarifuninitialized(@"hash_b27192e0593d2245", bundle.var_904281521b1e0ac8);
    setdvarifuninitialized(@"hash_791416d97b1899ba", 35);
    setdvarifuninitialized(@"hash_1676fc44b285c55a", bundle.var_aab9b4935e5811e);
    setdvarifuninitialized(@"hash_2ef1444b14cdcc27", bundle.var_8432cf9eeaab54a3);
    setdvarifuninitialized(@"hash_4469252783a3ea7d", bundle.var_8bb5c785be632a16);
    setdvarifuninitialized(@"hash_dd550cefcbd1712", bundle.maxhealth);
    setdvarifuninitialized(@"hash_abec145fdf5e6352", 1);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb13
// Size: 0x88
function function_795e8013831a046a() {
    game["dialog"]["lrad_ause"] = "ause";
    game["dialog"]["lrad_euse"] = "euse";
    game["dialog"]["lrad_lcra"] = "lcra";
    game["dialog"]["lrad_ltim"] = "ltim";
    game["dialog"]["lrad_earn"] = "earn";
    game["dialog"]["lrad_friendly_online"] = "grdn_grav_kllc";
    game["dialog"]["lrad_friendly_timeout"] = "grdn_grav_ktlt";
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba2
// Size: 0x2bb
function function_5dae574697e78d96(streakinfo) {
    if (!isdefined(streakinfo)) {
        streakinfo = createstreakinfo("lrad", self);
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    streakinfo.bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["lrad"];
    if (!function_f3cfedd6f1bbfd6f()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/LRAD_COUNT_OVER_LIMIT");
        }
        return 0;
    }
    thread function_f2b4b6d178b092d9();
    var_6bec98cb2dcc2450 = function_52132724b2c18dc4(streakinfo);
    if (!isdefined(var_6bec98cb2dcc2450)) {
        return 0;
    }
    var_6bec98cb2dcc2450.streakinfo = streakinfo;
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    maxhealth = getdvarfloat(@"hash_1df62822bd2adee0");
    function_9469d528dd1ee44d("lrad", "destroyed_lrad", "destroyed_lrad", "callout_destroyed_lrad");
    if (issharedfuncdefined("damage", "monitorDamage")) {
        var_6bec98cb2dcc2450 thread [[ getsharedfunc("damage", "monitorDamage") ]](maxhealth, "hitequip", &function_66a7440055d386c3, &function_5733afc81f25372c, 0);
    }
    var_6bec98cb2dcc2450 function_e12969da21420075();
    var_6bec98cb2dcc2450 function_18633ad410bdfdfa();
    var_6bec98cb2dcc2450 namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_67a2561dc56ecc0b);
    var_6bec98cb2dcc2450 namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_a054c2c62f34ac14);
    var_6bec98cb2dcc2450 namespace_b6b4a3ac458ab6e2::function_aa823a31304ed981(&function_5e06c811fe28148a);
    var_6bec98cb2dcc2450 namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_43197d230c4d9635);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        var_6bec98cb2dcc2450 [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_a054c2c62f34ac14);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        var_6bec98cb2dcc2450 [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_43197d230c4d9635);
    }
    thread function_5189f677d1332852(var_6bec98cb2dcc2450, streakinfo);
    thread function_9235bfde9b04fc60(var_6bec98cb2dcc2450, var_6bec98cb2dcc2450.useownerobj);
    var_a6cdc017c04a56de = getdvarfloat(@"hash_98efcf229168a436");
    var_6bec98cb2dcc2450 thread function_47b5394a301d8c5(var_a6cdc017c04a56de, @"hash_80d0084f17797030", &function_792dfdb8f059fd22);
    var_6bec98cb2dcc2450 thread function_e27f64a56913c64b();
    /#
        var_6bec98cb2dcc2450 thread function_1defeaf387d6e2a9(@"hash_80d0084f17797030");
    #/
    var_6bec98cb2dcc2450 function_63d1a11f8b22244(streakinfo, &function_136ba4565fe17b8, &function_530a5ad4acb5d47f);
    self notify("munitions_used", "lrad");
    self notify("lrad_placed");
    level.var_f22117519609ef3b = array_add(level.var_f22117519609ef3b, var_6bec98cb2dcc2450);
    if (isdefined(level.var_648cfe8e093ab1e)) {
        level thread [[ level.var_648cfe8e093ab1e ]](self);
    }
    return 1;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe65
// Size: 0x43
function function_e27f64a56913c64b() {
    level endon("game_ended");
    self endon("death");
    self.owner endon("disconnected");
    self endon("isCarried");
    self.owner waittill("joined_team");
    callback::callback("on_functional_death");
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeaf
// Size: 0x5b
function function_f2b4b6d178b092d9(var_6bec98cb2dcc2450) {
    self endon("lrad_placed");
    self endon("lrad_put_away");
    while (1) {
        if (!isreallyalive(self)) {
            level.var_2d9a7cb2b0831e1e--;
            level.var_23bb4defc5121d06[self.team]--;
            if (isdefined(var_6bec98cb2dcc2450)) {
                var_6bec98cb2dcc2450 function_530a5ad4acb5d47f();
            }
            break;
        }
        waitframe();
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf11
// Size: 0x1ad
function function_f3cfedd6f1bbfd6f() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["lrad"];
    if (level.var_f22117519609ef3b.size >= bundle.var_c98e519f70bf4a5f || level.var_f22117519609ef3b.size + level.var_2d9a7cb2b0831e1e > bundle.var_c98e519f70bf4a5f) {
        return 0;
    }
    var_25e613b55682a30c = 0;
    var_175fecc960f5f281 = 0;
    var_b3daaaea66bc9eee = 0;
    foreach (lrad in level.var_f22117519609ef3b) {
        if (distance2d(lrad.origin, self.origin) <= bundle.var_4c564e3e500a1723) {
            var_b3daaaea66bc9eee++;
        }
        if (lrad.owner == self) {
            var_175fecc960f5f281++;
            var_25e613b55682a30c++;
            continue;
        } else if (lrad.team == self.team) {
            var_25e613b55682a30c++;
        }
    }
    if (var_b3daaaea66bc9eee >= bundle.var_6ec1ad14e28e99a1) {
        return 0;
    }
    if (isdefined(level.var_23bb4defc5121d06[self.team])) {
        if (var_25e613b55682a30c >= bundle.var_17b7b6fe6675fb64 || var_25e613b55682a30c + level.var_23bb4defc5121d06[self.team] > bundle.var_17b7b6fe6675fb64) {
            return 0;
        }
    }
    if (var_175fecc960f5f281 >= bundle.var_479d98641f857668) {
        return 0;
    }
    return 1;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0x113
function function_52132724b2c18dc4(streakinfo) {
    self endon("death");
    self endon("disconnect");
    endonnotify = "sentry_placement_failed";
    weaponobj = makeweapon(streakinfo.bundle.var_8881166e57766e3a);
    if (issharedfuncdefined("weapons", "watchForPlacementFireState")) {
        self thread [[ getsharedfunc("weapons", "watchForPlacementFireState") ]](streakinfo, endonnotify, weaponobj);
    }
    var_9b1deb5e9d32bbe3 = streakdeploy_doweaponswitchdeploy(streakinfo, weaponobj, 1, undefined, undefined, &function_5a68b8ee35170bf9);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        self notify(endonnotify);
        return undefined;
    }
    function_8703bc55951530be(1);
    level.var_2d9a7cb2b0831e1e++;
    if (!isdefined(level.var_23bb4defc5121d06[self.team])) {
        level.var_23bb4defc5121d06[self.team] = 1;
    } else {
        level.var_23bb4defc5121d06[self.team]++;
    }
    var_6bec98cb2dcc2450 = function_ba1ca808d7bb053e(streakinfo);
    function_8703bc55951530be(0);
    return var_6bec98cb2dcc2450;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x268
function function_ba1ca808d7bb053e(streakinfo) {
    marker = function_3c44a60f10088e51(streakinfo, 0, 0.25);
    var_6bec98cb2dcc2450 = undefined;
    if (isdefined(marker)) {
        var_6bec98cb2dcc2450 = function_cce8da1f44d40890(marker);
        if (isdefined(marker.moving_platform)) {
            var_6bec98cb2dcc2450.moving_platform = marker.moving_platform;
            var_6bec98cb2dcc2450.moving_platform_offset = marker.moving_platform_offset;
            var_6bec98cb2dcc2450.moving_platform_angles_offset = marker.moving_platform_angles_offset;
            var_6bec98cb2dcc2450 linkto(marker.moving_platform, "", marker.moving_platform_offset, marker.moving_platform_angles_offset);
        }
        var_6bec98cb2dcc2450.colmodel show();
        var_6bec98cb2dcc2450.colmodel.angles = var_6bec98cb2dcc2450.angles;
        var_6bec98cb2dcc2450.colmodel.origin = var_6bec98cb2dcc2450.origin;
        var_6bec98cb2dcc2450.colmodel linkto(var_6bec98cb2dcc2450);
        var_6bec98cb2dcc2450 setscriptablepartstate("beam", "active", 0);
        var_6bec98cb2dcc2450 thread function_481e1d72fdaac162();
        var_6bec98cb2dcc2450.vodestroyed = "lrad_teamleader_destroyed";
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            if (issharedfuncdefined("audio", "brLeaderDialogTeam")) {
                level thread [[ getsharedfunc("audio", "brLeaderDialogTeam") ]]("lrad_friendly_online", var_6bec98cb2dcc2450.owner.team, 1, undefined, undefined, "dx_br_jpbm_");
            }
        } else if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](var_6bec98cb2dcc2450.owner, "lrad");
        }
        if (issharedfuncdefined("game", "handlemovingplatforms")) {
            data = spawnstruct();
            data.deathoverridecallback = &function_405ae182beea4b1c;
            if (isdefined(level.wztrain_info) && isdefined(var_6bec98cb2dcc2450.moving_platform) && namespace_9db09f982acd35b4::is_train_ent(var_6bec98cb2dcc2450.moving_platform)) {
                data.var_49cb2c45d3230ed8 = 1;
            }
            var_6bec98cb2dcc2450 thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
        }
    }
    return var_6bec98cb2dcc2450;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1451
// Size: 0x2d
function function_18633ad410bdfdfa() {
    self setscriptablepartstate("beam", "active", 0);
    thread function_481e1d72fdaac162();
    thread function_d2368d84391b6a68();
    thread function_9c3226ae596454e6();
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1485
// Size: 0x29
function function_6402ac006cab5c40() {
    self setscriptablepartstate("beam", "idle", 0);
    self stoploopsound("jup_kls_lrad_beam_outside");
    self notify("beamStop");
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b5
// Size: 0x49
function function_481e1d72fdaac162() {
    level endon("game_ended");
    self endon("death");
    self.owner endon("disconnected");
    self endon("isCarried");
    if (!isdefined(self.var_12bfb031c0a0efd8) || !istrue(self.var_12bfb031c0a0efd8)) {
        wait(0.6);
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1505
// Size: 0x282
function function_cce8da1f44d40890(marker, var_6bec98cb2dcc2450) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["lrad"];
    var_dcefc2613a6e9a35 = getdvarint(@"hash_6aa2e155bf9747");
    if (!isdefined(var_6bec98cb2dcc2450)) {
        var_6bec98cb2dcc2450 = self launchgrenade(bundle.spawnweapon, marker.location + (0, 0, var_dcefc2613a6e9a35), (0, 0, 0));
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "lrad", self);
        }
    } else {
        var_6bec98cb2dcc2450.origin = marker.location + (0, 0, var_dcefc2613a6e9a35);
    }
    var_6bec98cb2dcc2450.angles = self.angles;
    var_6bec98cb2dcc2450.team = self.team;
    var_6bec98cb2dcc2450.owner = self;
    var_6bec98cb2dcc2450 function_5226227bce83ebe9(3, var_6bec98cb2dcc2450.team);
    var_6bec98cb2dcc2450 show();
    var_6bec98cb2dcc2450.colmodel = spawn("script_model", var_6bec98cb2dcc2450.origin);
    var_6bec98cb2dcc2450.colmodel.team = var_6bec98cb2dcc2450.team;
    var_6bec98cb2dcc2450.colmodel.owner = var_6bec98cb2dcc2450.owner;
    var_6bec98cb2dcc2450.colmodel setmodel("vm_jup_2h_lrad_00_invis_base");
    var_6bec98cb2dcc2450.colmodel dontinterpolate();
    var_6bec98cb2dcc2450.colmodel hide();
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        var_6bec98cb2dcc2450 [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]]("lrad", "Killstreak_Ground", self, 0, 1, 55, "isCarried");
    }
    function_f74b0080a679742b(var_6bec98cb2dcc2450);
    if (issharedfuncdefined("game", "createObjective")) {
        var_6bec98cb2dcc2450.minimapid = var_6bec98cb2dcc2450 [[ getsharedfunc("game", "createObjective") ]](bundle.minimapicon, var_6bec98cb2dcc2450.team, 1, 1, 1);
        namespace_5a22b6f3a56f7e9b::function_2946e9eb07acb3f1(var_6bec98cb2dcc2450.minimapid, "KILLSTREAKS/LRAD");
    }
    var_6bec98cb2dcc2450 setscriptablepartstate("spawned", "deploy", 0);
    return var_6bec98cb2dcc2450;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178f
// Size: 0x155
function function_f74b0080a679742b(var_6bec98cb2dcc2450) {
    var_5e8eb3c31f9c265c = "j_mount";
    var_963953c3478bf4fe = var_6bec98cb2dcc2450 gettagorigin(var_5e8eb3c31f9c265c);
    if (!isdefined(var_6bec98cb2dcc2450.useownerobj)) {
        if (issharedfuncdefined("game", "createHintObject")) {
            var_6bec98cb2dcc2450.useownerobj = [[ getsharedfunc("game", "createHintObject") ]](var_963953c3478bf4fe, "HINT_BUTTON", undefined, "KILLSTREAKS_HINTS/LRAD_USE", undefined, undefined, "show");
        }
    } else {
        var_963953c3478bf4fe = var_6bec98cb2dcc2450 gettagorigin(var_5e8eb3c31f9c265c);
        var_6bec98cb2dcc2450.useownerobj function_dfb78b3e724ad620(1);
        var_6bec98cb2dcc2450.useownerobj dontinterpolate();
        var_6bec98cb2dcc2450.useownerobj.origin = var_963953c3478bf4fe;
    }
    foreach (player in level.players) {
        if (player != self) {
            var_6bec98cb2dcc2450.useownerobj disableplayeruse(player);
        } else {
            var_6bec98cb2dcc2450.useownerobj enableplayeruse(player);
        }
    }
    var_6bec98cb2dcc2450.useownerobj linkto(var_6bec98cb2dcc2450, var_5e8eb3c31f9c265c);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18eb
// Size: 0x11b
function function_3c44a60f10088e51(streakinfo, var_6152d24062d26039, delaytime) {
    thread function_73b3147446ea5f18(delaytime);
    marker = undefined;
    if (issharedfuncdefined("killstreak", "getTargetMarker")) {
        marker = [[ getsharedfunc("killstreak", "getTargetMarker") ]](streakinfo, var_6152d24062d26039);
    }
    if (!isdefined(marker) || !isdefined(marker.location)) {
        if (_isalive()) {
            function_9f6045ef775e961c(streakinfo.bundle.var_8881166e57766e3a, undefined, undefined, 1);
        }
        return undefined;
    }
    if (isdefined(self) && _isalive()) {
        self freezecontrols(1);
    } else {
        return undefined;
    }
    if (self hasweapon(streakinfo.bundle.var_8881166e57766e3a)) {
        thread function_9f6045ef775e961c(streakinfo.bundle.var_8881166e57766e3a, 1, 1);
    }
    var_85cda42514dc11d2 = getdvarfloat(@"hash_d7fd0b0d5f62285c");
    wait(var_85cda42514dc11d2);
    self freezecontrols(0);
    return marker;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0e
// Size: 0x65
function function_73b3147446ea5f18(delaytime) {
    self endon("death_or_disconnect");
    self endon("lrad_placed");
    self endon("lrad_put_away");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    self setclientomnvar("ui_turret_placement", 1);
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("death");
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("lrad_placed");
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("lrad_put_away");
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7a
// Size: 0xd0
function function_136ba4565fe17b8(var_ba669c07247b5ab0) {
    meansofdeath = var_ba669c07247b5ab0.meansofdeath;
    if (isdefined(self.useownerobj)) {
        self.useownerobj function_dfb78b3e724ad620(0);
    }
    if (isdefined(meansofdeath) && (meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_GRENADE_SPLASH")) {
        self setscriptablepartstate("explode", "violent");
    } else {
        self playsound("sentry_explode_smoke");
        self setscriptablepartstate("explode", "regular");
    }
    wait(0.2);
    self setscriptablepartstate("visibility", "hide");
    self setscriptablepartstate("beam", "idle");
    self hide();
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b51
// Size: 0x116
function function_530a5ad4acb5d47f(delaytime) {
    if (isdefined(delaytime)) {
        wait(delaytime);
    }
    if (isdefined(self.useownerobj)) {
        self.useownerobj delete();
    }
    if (isdefined(self.colmodel)) {
        self.colmodel delete();
    }
    if (isdefined(self.var_94c7ee7868955653)) {
        foreach (player in self.var_94c7ee7868955653.playersintrigger) {
            if (!isdefined(player)) {
                continue;
            }
            self.var_94c7ee7868955653.playersintrigger[player getentitynumber()] = undefined;
            if (isalive(player)) {
                player function_56da58bd9ea3d08d();
            }
        }
        self.var_94c7ee7868955653 delete();
    }
    level.var_f22117519609ef3b = array_remove(level.var_f22117519609ef3b, self);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c6e
// Size: 0x33
function function_405ae182beea4b1c(data) {
    data.meansofdeath = "MOD_CRUSH";
    function_136ba4565fe17b8(data);
    function_530a5ad4acb5d47f();
    namespace_37987c2865e1a627::function_2eff4cd94c3243e8();
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca8
// Size: 0x7b
function function_792dfdb8f059fd22(params) {
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (issharedfuncdefined("audio", "brLeaderDialogTeam")) {
            level thread [[ getsharedfunc("audio", "brLeaderDialogTeam") ]]("lrad_friendly_timeout", self.owner.team, 1, undefined, undefined, "dx_br_jpbm_");
        }
    } else {
        self.owner function_8959c1606f65e65("lrad", "lrad_teamleader_timeout");
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2a
// Size: 0xa5
function function_9f6045ef775e961c(var_8881166e57766e3a, var_eaf9953fb1b05ac6, var_829a6cb8a7de0cab, var_f1f211606ccd1b6e) {
    if (isdefined(var_829a6cb8a7de0cab) && var_829a6cb8a7de0cab > 0) {
        self endon("death_or_disconnect");
        level endon("game_ended");
        wait(var_829a6cb8a7de0cab);
    }
    lastweaponobj = restoreweaponstates(self.lastdroppableweaponobj);
    level.var_2d9a7cb2b0831e1e--;
    level.var_23bb4defc5121d06[self.team]--;
    if (istrue(var_eaf9953fb1b05ac6)) {
        _switchtoweaponimmediate(lastweaponobj);
    } else {
        _switchtoweapon(lastweaponobj);
    }
    _takeweapon(var_8881166e57766e3a);
    if (istrue(var_f1f211606ccd1b6e)) {
        self notify("lrad_put_away");
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd6
// Size: 0x29
function function_5a68b8ee35170bf9(streakinfo, var_41bf9bf4918115ac, weaponobj) {
    if (!istrue(var_41bf9bf4918115ac)) {
        getridofkillstreakdeployweapon(weaponobj);
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e06
// Size: 0xa6
function function_8703bc55951530be(var_5c911c4e7ce59792) {
    if (_isalive()) {
        if (var_5c911c4e7ce59792) {
            val::set("lrad_placement", "sprint", 0);
            val::set("lrad_placement", "weapon_switch", 0);
            val::set("lrad_placement", "offhand_weapons", 0);
            val::set("lrad_placement", "melee", 0);
            val::set("lrad_placement", "execution_attack", 0);
            val::set("lrad_placement", "ladder_placement", 0);
            val::set("lrad_placement", "armor", 0);
        } else {
            val::function_c9d0b43701bdba00("lrad_placement");
        }
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb3
// Size: 0x5f
function function_9235bfde9b04fc60(var_6bec98cb2dcc2450, useobj) {
    if (isdefined(var_6bec98cb2dcc2450)) {
        var_6bec98cb2dcc2450 endon("death");
        var_6bec98cb2dcc2450 endon("lrad_dying");
    }
    self endon("disconnect");
    level endon("game_ended");
    self endon("lrad_hacked");
    while (1) {
        player = level waittill("connected");
        useobj disableplayeruse(player);
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f19
// Size: 0xaa
function function_5189f677d1332852(var_6bec98cb2dcc2450, streakinfo) {
    self endon("disconnect");
    self endon("lrad_hacked");
    var_6bec98cb2dcc2450 endon("lrad_dying");
    level endon("game_ended");
    while (1) {
        player = var_6bec98cb2dcc2450.useownerobj waittill("trigger");
        if (isdefined(player) && !function_21550b5260803f0b(player)) {
            continue;
        }
        var_6bec98cb2dcc2450.useownerobj function_dfb78b3e724ad620(0);
        level.var_2d9a7cb2b0831e1e++;
        level.var_23bb4defc5121d06[self.team]++;
        thread function_43adb6908f665a51(var_6bec98cb2dcc2450, streakinfo);
        thread function_883487704e982cda();
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fca
// Size: 0x7a
function function_883487704e982cda() {
    var_5fec53c49890f027 = self.var_9717afbc6163113;
    if (!isdefined(var_5fec53c49890f027)) {
        return;
    }
    foreach (ent in var_5fec53c49890f027) {
        if (isdefined(ent) && isalive(ent)) {
            ent thread function_56da58bd9ea3d08d();
        }
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204b
// Size: 0x64
function function_21550b5260803f0b(player) {
    if (player != self) {
        return 0;
    }
    if (istrue(player.insertingarmorplate)) {
        return 0;
    }
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
        }
        return 0;
    }
    return 1;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b7
// Size: 0x14b
function function_43adb6908f665a51(var_6bec98cb2dcc2450, streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    function_c87fe068955bfe05(var_6bec98cb2dcc2450);
    function_484aa2a4c15a015c(var_6bec98cb2dcc2450);
    var_6bec98cb2dcc2450 function_2eff4cd94c3243e8();
    function_fa22ff0405c3d06e(var_6bec98cb2dcc2450);
    self playsound("jup_kls_lrad_pickup");
    saveweaponstates();
    endonnotify = "sentry_placement_failed";
    if (issharedfuncdefined("weapons", "watchForPlacementFireState")) {
        self thread [[ getsharedfunc("weapons", "watchForPlacementFireState") ]](streakinfo, endonnotify);
    }
    _giveweapon(streakinfo.bundle.var_8881166e57766e3a);
    _switchtoweapon(streakinfo.bundle.var_8881166e57766e3a);
    function_8703bc55951530be(1);
    thread function_f2b4b6d178b092d9(var_6bec98cb2dcc2450);
    marker = function_3c44a60f10088e51(streakinfo, 1, 0.25);
    function_8703bc55951530be(0);
    if (!isdefined(marker)) {
        return 0;
    }
    function_75ba96a892796b34(marker, var_6bec98cb2dcc2450);
    var_a6cdc017c04a56de = getdvarfloat(@"hash_98efcf229168a436");
    var_6bec98cb2dcc2450 thread function_47b5394a301d8c5(var_a6cdc017c04a56de, @"hash_80d0084f17797030");
    /#
        var_6bec98cb2dcc2450 thread function_1defeaf387d6e2a9(@"hash_80d0084f17797030");
    #/
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2209
// Size: 0x7f
function function_484aa2a4c15a015c(var_6bec98cb2dcc2450) {
    var_e478ac91af0e92cb = var_6bec98cb2dcc2450 getlinkedchildren();
    foreach (child in var_e478ac91af0e92cb) {
        if (isdefined(child) && child != var_6bec98cb2dcc2450.var_94c7ee7868955653) {
            child unlink();
        }
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228f
// Size: 0x65
function function_fa22ff0405c3d06e(var_6bec98cb2dcc2450) {
    var_6bec98cb2dcc2450 hide();
    var_6bec98cb2dcc2450.colmodel unlink();
    var_6bec98cb2dcc2450.colmodel hide();
    var_6bec98cb2dcc2450.var_94c7ee7868955653 hide();
    var_6bec98cb2dcc2450.iscarried = 1;
    var_6bec98cb2dcc2450 notify("isCarried");
    var_6bec98cb2dcc2450 allow_emp(0);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22fb
// Size: 0xb2
function function_75ba96a892796b34(marker, var_6bec98cb2dcc2450) {
    function_cce8da1f44d40890(marker, var_6bec98cb2dcc2450);
    var_6bec98cb2dcc2450.colmodel show();
    var_6bec98cb2dcc2450.colmodel.angles = var_6bec98cb2dcc2450.angles;
    var_6bec98cb2dcc2450.colmodel.origin = var_6bec98cb2dcc2450.origin;
    var_6bec98cb2dcc2450.colmodel linkto(var_6bec98cb2dcc2450);
    var_6bec98cb2dcc2450.var_94c7ee7868955653 show();
    var_6bec98cb2dcc2450.iscarried = 0;
    var_6bec98cb2dcc2450 allow_emp(1);
    self notify("lrad_placed");
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b4
// Size: 0x48
function function_c87fe068955bfe05(var_6bec98cb2dcc2450) {
    if (isdefined(var_6bec98cb2dcc2450)) {
        if (isdefined(var_6bec98cb2dcc2450.moving_platform)) {
            var_6bec98cb2dcc2450.moving_platform = undefined;
            var_6bec98cb2dcc2450.moving_platform_offset = undefined;
            var_6bec98cb2dcc2450.moving_platform_angles_offset = undefined;
        }
        var_6bec98cb2dcc2450 unlink();
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2403
// Size: 0x4e
function function_4444ec0cb29ca814(weaponref) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["lrad"];
    return weaponref == bundle.spawnweapon || weaponref == bundle.var_8881166e57766e3a;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2459
// Size: 0x77
function function_67a2561dc56ecc0b(data) {
    attacker = data.attacker;
    if (!isdefined(self.var_12bfb031c0a0efd8) || !istrue(self.var_12bfb031c0a0efd8)) {
        if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
            self.var_12bfb031c0a0efd8 = 1;
            thread function_355f8536758cc7c7();
        }
    }
    self setscriptablepartstate("haywire", "active", 0);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d7
// Size: 0x76
function function_a054c2c62f34ac14(data) {
    attacker = data.attacker;
    if (!isdefined(self.var_12bfb031c0a0efd8) || !istrue(self.var_12bfb031c0a0efd8)) {
        if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
            self.var_12bfb031c0a0efd8 = 1;
            function_6402ac006cab5c40();
        }
    }
    self setscriptablepartstate("haywire", "active", 0);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2554
// Size: 0x28
function function_5e06c811fe28148a(data) {
    self.var_12bfb031c0a0efd8 = 0;
    self setscriptablepartstate("haywire", "neutral", 0);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2583
// Size: 0x2f
function function_43197d230c4d9635(data) {
    self.var_12bfb031c0a0efd8 = 0;
    function_18633ad410bdfdfa();
    self setscriptablepartstate("haywire", "neutral", 0);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b9
// Size: 0x9b
function function_355f8536758cc7c7() {
    self endon("death");
    self.var_bd3a6d82c1789913 = 1;
    while (self.var_12bfb031c0a0efd8) {
        if (istrue(self.var_bd3a6d82c1789913)) {
            self.var_bd3a6d82c1789913 = 0;
            function_6402ac006cab5c40();
            waittime = randomfloatrange(0.75, 1.75);
            wait(waittime);
        } else {
            self.var_bd3a6d82c1789913 = 1;
            function_18633ad410bdfdfa();
            waittime = randomfloatrange(0.15, 0.35);
            wait(waittime);
        }
        waitframe();
    }
    if (!istrue(self.var_bd3a6d82c1789913)) {
        function_18633ad410bdfdfa();
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265b
// Size: 0x212
function function_e12969da21420075() {
    var_b32c95cef7f0e824 = getdvarint(@"hash_b4d9a80ce75c617");
    trigger_radius = getdvarint(@"hash_b27192e0593d2245");
    height_offset = getdvarint(@"hash_791416d97b1899ba");
    self.var_94c7ee7868955653 = spawn("trigger_rotatable_radius", self.origin, 0, trigger_radius, var_b32c95cef7f0e824);
    if (issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        forward = anglestoforward(self.angles);
        lifetime = getdvarfloat(@"hash_98efcf229168a436");
        self.dangerzones = [];
        self.dangerzones[0] = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](self.origin, trigger_radius, 50, self.team, lifetime, self.owner, 1, self, 1);
        self.dangerzones[1] = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](self.origin + forward * 50, trigger_radius, 50, self.team, lifetime, self.owner, 1, self, 1);
        self.dangerzones[2] = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](self.origin + forward * 50 * 2, trigger_radius, 50, self.team, lifetime, self.owner, 1, self, 1);
    }
    self.var_94c7ee7868955653.angles = self.angles + (90, 0, 0);
    self.var_94c7ee7868955653.origin = self.origin + (0, 0, height_offset);
    self.var_94c7ee7868955653.playersintrigger = [];
    self.var_94c7ee7868955653 enablelinkto();
    self.var_94c7ee7868955653 linkto(self);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2874
// Size: 0x1ff
function function_d2368d84391b6a68() {
    self endon("death");
    self endon("disconnected");
    self endon("beamStop");
    while (1) {
        self.var_94c7ee7868955653 waittill("trigger");
        var_b5dad70fe57dbaa3 = level.players;
        var_eb4d537c12ccad6d = getaiarray();
        allentities = array_combine_unique(var_b5dad70fe57dbaa3, var_eb4d537c12ccad6d);
        var_f4fc390187305987 = self.var_94c7ee7868955653 getistouchingentities(allentities);
        self.owner.var_9717afbc6163113 = var_f4fc390187305987;
        foreach (ent in var_f4fc390187305987) {
            var_18d1eaac8a573748 = 0;
            /#
                var_34ce60611499d50e = getdvarint(@"hash_80d0084f17797030");
                if (var_34ce60611499d50e > 0) {
                    iprintlnbold(ent.name + "stun");
                    var_18d1eaac8a573748 = getdvarint(@"hash_5f9bf6b2e15e5727");
                }
            #/
            if (function_f636f503f2312823(ent, var_18d1eaac8a573748)) {
                var_97db5d48f2509e02 = function_5dcb36314d1abe55(ent);
                if (var_97db5d48f2509e02.size == 0) {
                    stuntime = getdvarfloat(@"hash_2ef1444b14cdcc27");
                    ent function_bb2a979de475a65(stuntime, self);
                    self.var_94c7ee7868955653.playersintrigger[ent getentitynumber()] = ent;
                } else if (function_7fbe85f0fd784b4c(var_97db5d48f2509e02)) {
                    stuntime = getdvarfloat(@"hash_4469252783a3ea7d");
                    ent function_bb2a979de475a65(stuntime, self);
                    self.var_94c7ee7868955653.playersintrigger[ent getentitynumber()] = ent;
                }
            }
            waitframe();
        }
        var_d72b86407ed6514b = getdvarfloat(@"hash_1676fc44b285c55a");
        wait(var_d72b86407ed6514b);
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7a
// Size: 0xe7
function function_9c3226ae596454e6() {
    self endon("death");
    self endon("beamStop");
    while (1) {
        foreach (id, player in self.var_94c7ee7868955653.playersintrigger) {
            if (!isdefined(player)) {
                self.var_94c7ee7868955653.playersintrigger[id] = undefined;
            } else if (!player namespace_f8065cafc523dba5::_isalive()) {
                self.var_94c7ee7868955653.playersintrigger[id] = undefined;
            } else {
                if (player istouching(self.var_94c7ee7868955653)) {
                    continue;
                }
                self.var_94c7ee7868955653.playersintrigger[player getentitynumber()] = undefined;
                player function_56da58bd9ea3d08d();
            }
        }
        waitframe();
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b68
// Size: 0x86
function function_f636f503f2312823(ent, var_18d1eaac8a573748) {
    var_70ed7160af4b8ef4 = 0;
    if (isplayer(ent) || isai(ent)) {
        var_70ed7160af4b8ef4 = 1;
    }
    return var_70ed7160af4b8ef4 && isalive(ent) && (var_18d1eaac8a573748 || ent.team != self.owner.team) && !istrue(self.iscarried) && !istrue(self.var_e5ae774e2e4dacc5);
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf6
// Size: 0x15a
function function_5dcb36314d1abe55(target) {
    var_68e6f05a4ee24dee = physics_createcontents([0:"physicscontents_ainoshoot", 1:"physicscontents_ainosight", 2:"physicscontents_explosionclip", 3:"physicscontents_vehicle"]);
    var_7c89350c1bcac4f0 = self.origin + (0, 0, 50);
    var_66d7b2c988606651 = target geteye();
    var_97db5d48f2509e02 = physics_raycast(var_7c89350c1bcac4f0, var_66d7b2c988606651, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_all");
    /#
        var_34ce60611499d50e = getdvarint(@"hash_80d0084f17797030");
        if (var_34ce60611499d50e > 0) {
            duration = getdvarint(@"hash_356ad37ca5f6f115");
            line(var_7c89350c1bcac4f0, var_66d7b2c988606651, (0, 0, 100), 1, 0, duration);
            drawcolor = (0, 255, 0);
            foreach (result in var_97db5d48f2509e02) {
                sphere(result["<unknown string>"], 5, drawcolor, 0, duration);
            }
        }
    #/
    return var_97db5d48f2509e02;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d58
// Size: 0x87
function function_7fbe85f0fd784b4c(var_97db5d48f2509e02) {
    var_c8af87991ff22645 = 1;
    foreach (result in var_97db5d48f2509e02) {
        if (!isdefined(result["entity"]) || !isdefined(result["entity"].var_b8957cd52d1efa30)) {
            var_c8af87991ff22645 = 0;
            break;
        }
    }
    return var_c8af87991ff22645;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de7
// Size: 0x2f2
function function_bb2a979de475a65(stuntime, var_ef9733a4a88c2f67) {
    if (!function_eba2f2e094684b8f("specialty_stun_resistance")) {
        self.var_c4c1555acea960b5 = 1;
        if (isai(self)) {
            if (!isdefined(self.subclass)) {
                utility::setplayerstunned();
            } else if (self.subclass == "zombie_base") {
                if (issharedfuncdefined("zombie", "stunZombie")) {
                    self [[ getsharedfunc("zombie", "stunZombie") ]](10000);
                }
            } else {
                self notify("flashbang", self.origin);
            }
        } else {
            utility::setplayerstunned();
        }
        if (issharedfuncdefined("damage", "fx_stun_damage")) {
            self thread [[ getsharedfunc("damage", "fx_stun_damage") ]](self, var_ef9733a4a88c2f67.owner);
        }
        _shellshock("lrad_mp", "gas", stuntime, 1);
        if (issharedfuncdefined("sound", "CodcasterSetPlayerStatusEffect")) {
            self [[ getsharedfunc("sound", "CodcasterSetPlayerStatusEffect") ]]("stun", stuntime);
        }
        if (issharedfuncdefined("damage", "updateDamageFeedback")) {
            var_ef9733a4a88c2f67.owner [[ getsharedfunc("damage", "updateDamageFeedback") ]]("hitsoundveil");
        }
        if (getdvarint(@"hash_abec145fdf5e6352") == 1) {
            if (!isai(self)) {
                if (isplayer(self)) {
                    utility::hidehudenable();
                }
            }
        }
    } else if (perk::_hasperk("specialty_stun_resistance")) {
        var_c52ffaed35e604dd = utility::ter_op(isdefined(var_ef9733a4a88c2f67.owner), var_ef9733a4a88c2f67.owner, var_ef9733a4a88c2f67);
        var_f2ae11d4d6442540 = utility::ter_op(isdefined(self.owner), self.owner, self);
        currenttime = gettime();
        if (!isdefined(var_ef9733a4a88c2f67.var_8ca2aec32c2b0356) || currenttime > var_ef9733a4a88c2f67.var_8ca2aec32c2b0356 + 2000) {
            if (isplayer(var_c52ffaed35e604dd) && var_c52ffaed35e604dd != self) {
                var_c52ffaed35e604dd damagefeedback::updatedamagefeedback("hittacresist", undefined, undefined, undefined, 1);
            }
            var_ef9733a4a88c2f67.var_8ca2aec32c2b0356 = currenttime;
        }
        if (istrue(namespace_e47104b48662385b::playersareenemies(var_c52ffaed35e604dd, var_f2ae11d4d6442540))) {
            perks::activatePerk("specialty_tac_resist");
        }
    }
    /#
        var_34ce60611499d50e = getdvarint(@"hash_80d0084f17797030");
        if (var_34ce60611499d50e > 0) {
            var_7b46d7ade104bc09 = getdvarfloat(@"hash_2ef1444b14cdcc27");
            if (stuntime == var_7b46d7ade104bc09) {
                iprintlnbold(self.name + "<unknown string>");
            } else {
                iprintlnbold(self.name + "<unknown string>");
            }
        }
    #/
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e0
// Size: 0xc6
function function_56da58bd9ea3d08d() {
    if (istrue(self.var_c4c1555acea960b5)) {
        self.var_c4c1555acea960b5 = undefined;
        if (getdvarint(@"hash_abec145fdf5e6352") == 1) {
            if (!isai(self)) {
                if (isplayer(self)) {
                    if (isdefined(self.hidehudenabled) && self.hidehudenabled > 0) {
                        utility::hidehuddisable();
                    }
                }
            }
        }
        if (isai(self)) {
            if (!isdefined(self.subclass)) {
                utility::setplayerstunned();
            } else if (self.subclass == "zombie_base") {
                if (issharedfuncdefined("zombie", "clearStunZombie")) {
                    self [[ getsharedfunc("zombie", "clearStunZombie") ]]();
                }
            }
        } else {
            utility::setplayerstunned();
        }
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ad
// Size: 0x12f
function LRAD_Hack(newowner) {
    self notify("lrad_hacked");
    self.owner = newowner;
    self.team = newowner.team;
    self.ownerid = newowner getxuid();
    self setentityowner(newowner);
    self setotherent(newowner);
    if (level.teambased) {
        self filteroutplayermarks(newowner.team);
    } else {
        self filteroutplayermarks(newowner);
    }
    if (issharedfuncdefined("killstreak", "giveScoreForHack")) {
        newowner [[ getsharedfunc("killstreak", "giveScoreForHack") ]]();
    }
    self.owner function_f74b0080a679742b(self);
    self.owner thread function_5189f677d1332852(self, self.streakinfo);
    function_2eff4cd94c3243e8();
    if (issharedfuncdefined("game", "createObjective")) {
        self.minimapid = self [[ getsharedfunc("game", "createObjective") ]](self.streakinfo.bundle.minimapicon, self.team, 1, 1, 1);
    }
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e3
// Size: 0x18d
function function_5733afc81f25372c(data) {
    if (!isdefined(self.totaldamagetaken)) {
        self.totaldamagetaken = 0;
    }
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    if (istrue(level.var_be6a42242be00b66)) {
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["lrad"];
        modifieddamage = getModifiedDamageUsingDamageTuning(attacker, objweapon, type, modifieddamage, self.maxhealth, bundle.var_e913079a5ffda56d);
    } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
        modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, type, modifieddamage, self.maxhealth, 2, 3, 3, 4, 400);
    }
    self.totaldamagetaken = self.totaldamagetaken + modifieddamage;
    if (self.totaldamagetaken >= self.maxhealth * 0.5) {
        self setscriptablepartstate("damage", "on");
        self notify("lrad_dying");
        self.useownerobj function_dfb78b3e724ad620(0);
    }
    return modifieddamage;
}

// Namespace lrad/namespace_876fdba3df4aad3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3478
// Size: 0x175
function function_1defeaf387d6e2a9(var_bb3f35f040f4f38b) {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        self.owner endon("<unknown string>");
        self endon("<unknown string>");
        var_34ce60611499d50e = getdvarint(var_bb3f35f040f4f38b);
        while (1) {
            if (var_34ce60611499d50e > 0) {
                var_aff22094a167cabd = self.maxhealth - self.damagetaken;
                print3d(self.origin + (0, 0, 20), "<unknown string>" + var_aff22094a167cabd, (0, 1, 0), 1, 0.5, 1);
                var_b32c95cef7f0e824 = getdvarint(@"hash_b4d9a80ce75c617");
                trigger_radius = getdvarint(@"hash_b27192e0593d2245");
                lifetime = getdvarint(@"hash_98efcf229168a436");
                duration = 100;
                startpoint = self.var_94c7ee7868955653.origin;
                endpoint = self.var_94c7ee7868955653.origin + anglestoup(self.var_94c7ee7868955653.angles) * var_b32c95cef7f0e824;
                cylinder(startpoint, endpoint, trigger_radius, (0, 1, 0), 0, duration);
            }
            waitframe();
        }
    #/
}

