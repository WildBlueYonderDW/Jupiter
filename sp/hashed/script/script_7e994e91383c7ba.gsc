#using script_5323b44ee395058;
#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\cp_mp\calloutmarkerping;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\killstreaks\airdrop;
#using scripts\cp_mp\killstreaks\chopper_gunner;
#using scripts\cp_mp\killstreaks\chopper_support;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\cp_mp\utility\dialog_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\sentientpoolmanager;

#namespace airdrop_escort;

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bf
// Size: 0x58
function function_f383491974a17b9a() {
    assertex(isdefined(level.cratedropdata), "airdrop_escort_init() called before scriptscp_mpkillstreaksairdrop::initCrateDropData().");
    if (issharedfuncdefined("airdrop_escort", "init")) {
        [[ getsharedfunc("airdrop_escort", "init") ]]();
    }
    level function_e407a860bff9c632();
    level function_a852f44527c9d61f();
    level function_9302fd2bfe5c663c();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81f
// Size: 0xbe
function function_e407a860bff9c632() {
    level.var_346499147c1f5c1f = 0;
    foreach (teamname in level.teamnamelist) {
        level.var_54eafc62b6ad04c8[teamname] = 0;
    }
    level.cratedropdata.escortchoppers = [];
    /#
        setdevdvarifuninitialized(@"hash_f8c88d9bcfa63da3", 0);
        setdevdvarifuninitialized(@"hash_e9159b47fbb642af", 0);
        setdevdvarifuninitialized(@"hash_94edbe8b5c5b8dd0", 0);
        setdevdvarifuninitialized(@"hash_4f4829715aa2fd22", "<dev string:x1c>");
    #/
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e5
// Size: 0x10
function function_a852f44527c9d61f() {
    function_1f93185f55e71c3();
    function_29c55da256bfa6ba();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8fd
// Size: 0x52
function function_1f93185f55e71c3() {
    level.scr_animtree["ks_airdrop_escort_crate"] = %script_model;
    level.scr_anim["ks_airdrop_escort_crate"]["crate_push_out_left"] = script_model%iw9_mp_esc_airdrop_pack_l;
    level.scr_anim["ks_airdrop_escort_crate"]["crate_push_out_right"] = script_model%iw9_mp_esc_airdrop_pack_r;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x957
// Size: 0x33
function function_29c55da256bfa6ba() {
    level.scr_animtree["ks_airdrop_escort_heli"] = %mp_vehicles_always_loaded;
    level.scr_anim["ks_airdrop_escort_heli"]["vehicle_doors_open"] = mp_vehicles_always_loaded%iw9_mp_esc_airdrop_helidoors;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x992
// Size: 0x7e
function function_9302fd2bfe5c663c() {
    game["dialog"]["airdrop_escort" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["airdrop_escort" + "_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["airdrop_escort" + "_destroyed"] = "killstreak_team_leader" + "_crash";
    game["dialog"]["airdrop_escort" + "_spotted_target"] = "killstreak_remote_operator" + "_target_spotted_single";
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa18
// Size: 0x20
function function_e24bffeb9974833e() {
    streakinfo = createstreakinfo("airdrop_escort", self);
    return function_45378f51950e7d1f(streakinfo);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa41
// Size: 0x342
function function_45378f51950e7d1f(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (!scripts\cp_mp\vehicles\vehicle_tracking::reservevehicle()) {
        return 0;
    }
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_phone_mp"));
    if (!istrue(deployresult)) {
        scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
            return 0;
        }
    }
    level.var_346499147c1f5c1f++;
    var_25f93ff4ca83eba9 = 1;
    if (islargemap()) {
        var_25f93ff4ca83eba9 = 2;
    }
    if (level.cratedropdata.escortchoppers.size >= var_25f93ff4ca83eba9 || level.cratedropdata.escortchoppers.size + level.incomingallchoppersupports > var_25f93ff4ca83eba9) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        level.var_346499147c1f5c1f--;
        scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        return 0;
    }
    if (islargemap() && level.teambased) {
        var_abdb6af6e3ca3893 = 1;
        level.var_54eafc62b6ad04c8[self.team]++;
        if (getnumactivekillstreakperteam(self.team, level.cratedropdata.escortchoppers) + level.var_54eafc62b6ad04c8[self.team] > var_25f93ff4ca83eba9) {
            level.var_346499147c1f5c1f--;
            level.var_54eafc62b6ad04c8[self.team]--;
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_SUPPORT_HELO");
            }
            scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
            return 0;
        }
    }
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]]();
    }
    useresult = function_5867a72a727ced43(self, self.origin, "overwatch", streakinfo);
    level.var_346499147c1f5c1f--;
    if (islargemap() && level.teambased) {
        level.var_54eafc62b6ad04c8[self.team]--;
    }
    if (!istrue(useresult)) {
        return 0;
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]]("airdrop_escort", self.origin);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "airdrop_escort", self);
    }
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 2;
    }
    thread playkillstreakoperatordialog("airdrop_escort", "airdrop_escort" + "_use", 1, var_52a5be2e2f91d710);
    return useresult;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd8c
// Size: 0x56
function function_5867a72a727ced43(owner, position, escorttype, streakinfo) {
    escortheli = function_e384066b8cc15be4(owner, owner.team, position, escorttype, streakinfo);
    if (!isdefined(escortheli)) {
        return false;
    }
    escortheli thread function_429ba1c88d63319c(escorttype);
    return true;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xdeb
// Size: 0x864
function function_e384066b8cc15be4(owner, team, position, escorttype, streakinfo) {
    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
    }
    heightoffset = (0, 0, 1000);
    var_f3910d9d3efd6e9d = heightoffset + (0, 0, 1000);
    var_98309fe48684a69 = owner.angles + (0, 180, 0);
    pathgoal = position + var_f3910d9d3efd6e9d;
    pathstart = pathgoal - anglestoforward(var_98309fe48684a69) * 15000;
    if (!islargemap() && isdefined(level.heli_structs_entrances) && level.heli_structs_entrances.size > 0) {
        var_8013278937ff2600 = randomint(level.heli_structs_entrances.size);
        entrancestruct = level.heli_structs_entrances[var_8013278937ff2600];
        if (issharedfuncdefined("chopper_gunner", "findTargetStruct")) {
            goalstruct = [[ getsharedfunc("chopper_gunner", "findTargetStruct") ]](entrancestruct.script_linkto, level.heli_structs_goals);
            if (isdefined(goalstruct)) {
                var_f3910d9d3efd6e9d = (0, 0, goalstruct.origin[2] + 1000);
                var_a168db747b0d79ac = entrancestruct.origin * (1, 1, 0) + var_f3910d9d3efd6e9d;
                var_c32e33b4d51be12f = goalstruct.origin * (1, 1, 0) + var_f3910d9d3efd6e9d;
                entranceforward = vectornormalize(var_c32e33b4d51be12f - var_a168db747b0d79ac);
                pathstart = var_a168db747b0d79ac;
                pathgoal = var_c32e33b4d51be12f + entranceforward * 1000;
                var_98309fe48684a69 = vectortoangles(entranceforward);
            } else {
                /#
                    owner iprintlnbold("<dev string:x26>" + entrancestruct.script_linkto + "<dev string:x36>");
                #/
            }
        }
    }
    escortheli = scripts\cp_mp\vehicles\vehicle_tracking::_spawnhelicopter(undefined, pathstart, var_98309fe48684a69, "veh_airdrop_escort_mp_phys", "veh9_mil_air_heli_hind_mp");
    if (!isdefined(escortheli)) {
        return undefined;
    }
    if (!isdefined(team)) {
        team = "neutral";
    }
    if (team != "neutral") {
        escortheli setvehicleteam(team);
    }
    modifiedlifetime = 60;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            modifiedlifetime = 9999;
        }
    #/
    escortheli.speed = 100;
    escortheli.accel = 50;
    escortheli.lifetime = modifiedlifetime;
    escortheli.health = 2000;
    escortheli.maxhealth = 2000;
    escortheli.currenthealth = 2000;
    escortheli.team = team;
    escortheli.owner = owner;
    escortheli.streakinfo = streakinfo;
    escortheli.streakname = streakinfo.streakname;
    escortheli.flaresreservecount = 1;
    escortheli.pathstart = pathstart;
    escortheli.pathgoal = pathgoal;
    escortheli.currentaction = undefined;
    escortheli.patrolradius = 1000;
    escortheli.heightoffset = heightoffset;
    escortheli.entranceheightoffset = var_f3910d9d3efd6e9d;
    escortheli.droplocation = position;
    escortheli.escorttype = escorttype;
    escortheli.animname = "ks_airdrop_escort_heli";
    escortheli function_923b24178e709fbb(streakinfo.streakname);
    escortheli setmaxpitchroll(15, 15);
    escortheli vehicle_setspeed(escortheli.speed, escortheli.accel);
    escortheli sethoverparams(50, 5, 2.5);
    escortheli setturningability(1);
    escortheli setyawspeed(50, 25, 25, 0.5);
    escortheli setotherent(owner);
    escortheli setcandamage(1);
    escortheli setneargoalnotifydist(1000);
    escortheli function_247ad6a91f6a4ffe(1);
    level thread function_ee93617532d8a679(escortheli, owner, &function_c91a4a524a2d461d);
    if (issharedfuncdefined("airdrop_escort", "attachXRays")) {
        escortheli = [[ getsharedfunc("airdrop_escort", "attachXRays") ]](escortheli);
    }
    escortheli scripts\cp_mp\emp_debuff::set_start_emp_callback(&function_5555ccc5b8ca52d3);
    escortheli scripts\cp_mp\emp_debuff::set_clear_emp_callback(&function_8fc896d80a52b782);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        escortheli [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_3439dfab92e219d1);
    }
    escortheli setscriptablepartstate("blinking_lights", "on", 0);
    escortheli setscriptablepartstate("engine", "on", 0);
    /#
        escortheli thread scripts\cp_mp\killstreaks\chopper_gunner::function_dc4cb73de48ec3d6();
    #/
    escortheli.turret = spawnturret("misc_turret", escortheli gettagorigin("tag_turret"), "airdrop_escort_turret_ballistics_mp");
    escortheli.turret setmodel("veh9_mil_air_heli_hind_turret_mp");
    escortheli.turret.owner = escortheli.owner;
    escortheli.turret.team = escortheli.team;
    escortheli.turret.angles = escortheli.angles;
    escortheli.turret.streakinfo = escortheli.streakinfo;
    escortheli.turret.disabled = 0;
    escortheli.turret.targetstate = undefined;
    escortheli.turret linkto(escortheli, "tag_turret");
    escortheli.turret setturretteam(escortheli.team);
    escortheli.turret setturretmodechangewait(0);
    escortheli.turret setmode("manual");
    escortheli.turret setotherent(escortheli.owner);
    escortheli.turret setdefaultdroppitch(45);
    groundtargetorigin = escortheli.origin - (0, 0, 100) + anglestoforward(escortheli.angles) * 500;
    escortheli.turret.groundtargetent = spawn("script_model", groundtargetorigin);
    escortheli.turret.groundtargetent setmodel("tag_origin");
    escortheli.turret.groundtargetent linkto(escortheli.turret);
    escortheli.turret.groundtargetent dontinterpolate();
    escortheli.turret settargetentity(escortheli.turret.groundtargetent);
    escortheli.killcament = spawn("script_model", escortheli.turret gettagorigin("bi_center"));
    escortheli.killcament linkto(escortheli, "tag_origin", (-500, 0, 500), (0, 0, 0));
    escortheli.turret.killcament = escortheli.killcament;
    if (isdefined(owner)) {
        if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
            escortheli [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](escortheli.streakname, "Killstreak_Air", owner, 0, 1, 100);
        }
        if (team != "neutral") {
            escortheli scripts\mp\sentientpoolmanager::registersentient("Killstreak_Air", owner);
        }
    }
    level.cratedropdata.escortchoppers[level.cratedropdata.escortchoppers.size] = escortheli;
    return escortheli;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1658
// Size: 0x10f
function function_923b24178e709fbb(streakname) {
    killstreakvehicle = self;
    scorepopup = "destroyed_" + streakname;
    vodestroyed = "airdrop_escort" + "_destroyed";
    destroyedsplash = "callout_destroyed_" + streakname;
    var_8dfc256103cce53e = &function_a4b7038df66c4b58;
    var_191284e2e2837328 = &function_350eb9923f9e2a74;
    var_bacc6dd14316758c = &function_3e6225ef4efc799e;
    var_7da88d9c69433487 = &function_e687e809e9570d59;
    deathcallback = &function_1fe4e6fd1f673f2d;
    killstreak_setupVehicleDamageFunctionality(streakname, killstreakvehicle, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
    scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_registerinstance(self, self.owner, self.owner.team);
    function_cfc5e3633ef950fd(1, 1500, &function_6e785f240ca1205e);
    function_cfc5e3633ef950fd(2, 1000, &function_71b13dc22e6c70cb);
    function_cfc5e3633ef950fd(3, 500, &function_a58186566a85e2db);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x176f
// Size: 0x34
function function_a4b7038df66c4b58(streakname) {
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](streakname, 12);
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17ab
// Size: 0xb
function function_350eb9923f9e2a74(streakname) {
    
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17be
// Size: 0x39
function function_3e6225ef4efc799e(data) {
    damage = data.damage;
    attacker = data.attacker;
    return true;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1800
// Size: 0x9f
function function_e687e809e9570d59(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    self.currenthealth -= damage;
    killstreak_updateDamageState(self.currenthealth);
    return true;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18a8
// Size: 0x13
function function_6e785f240ca1205e() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c3
// Size: 0x13
function function_71b13dc22e6c70cb() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18de
// Size: 0x13
function function_a58186566a85e2db() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f9
// Size: 0x32
function function_1fe4e6fd1f673f2d(data) {
    self.killedbyweapon = data.objweapon;
    thread function_46088aa13d962f89(self.killedbyweapon);
    return true;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1934
// Size: 0x4d
function function_46088aa13d962f89(weaponkilledby) {
    self endon("explode");
    if (issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
        if (![[ getsharedfunc("killstreak", "isKillstreakWeapon") ]](weaponkilledby)) {
            function_51beb9374f4650ab(150, weaponkilledby);
        }
    }
    thread function_c91a4a524a2d461d();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1989
// Size: 0xe2
function function_51beb9374f4650ab(speed, weaponkilledby, var_c5adb13be635c61a) {
    self endon("explode");
    self clearlookatent();
    self notify("crashing");
    playsoundatpos(self.origin, "exp_escort_helo");
    self setmaxpitchroll(10, 50);
    self vehicle_setspeed(speed, 20, 20);
    self setneargoalnotifydist(100);
    var_6847739e80fb4e81 = scripts\cp_mp\killstreaks\chopper_gunner::choppergunner_findcrashposition(2500);
    if (!isdefined(var_6847739e80fb4e81)) {
        return;
    }
    /#
        if (istrue(var_c5adb13be635c61a)) {
            sphere(var_6847739e80fb4e81, 100, (0, 1, 0), 0, 500);
            line(self.origin, var_6847739e80fb4e81, (0, 1, 0), 1, 0, 500);
        }
    #/
    self setvehgoalpos(var_6847739e80fb4e81, 0);
    thread scripts\cp_mp\killstreaks\chopper_gunner::choppergunner_spinout(speed);
    function_5a9772411551e56e("airdrop_escort");
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a73
// Size: 0xc
function function_962725f71407f96f(position) {
    return position;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a88
// Size: 0x11c
function function_429ba1c88d63319c(escorttype) {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    thread function_35c660a3f2bc49e();
    thread function_7fc680f960d38005();
    self setvehgoalpos(self.pathgoal, 1);
    self waittill("near_goal");
    self vehicle_setspeed(int(self.speed / 4), int(self.accel / 4));
    self setneargoalnotifydist(300);
    thread function_acdc6c19714b6bb8();
    self waittill("goal");
    defaultaction = undefined;
    defaultactionfunc = undefined;
    if (escorttype == "crate") {
        self.defaultaction = "heli_patrol";
        self.defaultactionfunc = &function_6af592b35966f02a;
        thread function_ba7e24ee1aaf05e3();
        wait 1;
    } else {
        self.defaultaction = "heli_overwatch";
        self.defaultactionfunc = &function_365529b3985c87d4;
        thread function_365529b3985c87d4();
    }
    thread function_e46fb5b1144140e(self.turret);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bac
// Size: 0x18
function function_5555ccc5b8ca52d3() {
    self.turret.disabled = 1;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bcc
// Size: 0x17
function function_8fc896d80a52b782() {
    self.turret.disabled = 0;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1beb
// Size: 0x18
function function_3439dfab92e219d1(data) {
    if (isdefined(self)) {
        function_1fe4e6fd1f673f2d(data);
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0b
// Size: 0x73
function function_dbfa95f808879295(data, time) {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    self notify("airdrop_escort_droneGunHit");
    self endon("airdrop_escort_droneGunHit");
    self.turret notify("lost_target");
    function_5555ccc5b8ca52d3();
    self.var_69894ea4b6754d6f = 1;
    wait time;
    self.var_69894ea4b6754d6f = undefined;
    function_8fc896d80a52b782();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c86
// Size: 0x30
function function_acdc6c19714b6bb8() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    wait self.lifetime;
    thread function_94ca0444f2efd147();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cbe
// Size: 0x78
function function_35c660a3f2bc49e() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    if (!isdefined(self.owner) || self.owner.team != self.team) {
        thread function_94ca0444f2efd147();
        return;
    }
    self.owner waittill_any_2("joined_team", "disconnect");
    thread function_94ca0444f2efd147();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3e
// Size: 0x5f
function function_7fc680f960d38005() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    level waittill("game_ended");
    if (isdefined(self.owner)) {
        self.recordedgameendstats = 1;
        self.owner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(self.streakinfo);
    }
    thread function_94ca0444f2efd147();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da5
// Size: 0x248
function function_ba7e24ee1aaf05e3() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    self.owner endon("disconnect");
    dooranim = level.scr_anim["ks_airdrop_escort_heli"]["vehicle_doors_open"];
    var_6a5dc0fc2710ad84 = getanimlength(dooranim);
    thread scripts\common\anim::anim_single_solo(self, "vehicle_doors_open");
    wait var_6a5dc0fc2710ad84;
    streaknames = [];
    numcrates = 2;
    crateindex = 0;
    crateowner = self.owner;
    crateteam = self.team;
    cratetype = ter_op(isdefined(self.owner), "killstreak", "killstreak_no_owner");
    crateorigin = self gettagorigin("body_animate_jnt");
    var_90d4fe050e6864d4 = self.angles;
    cratedestination = self.droplocation;
    hasnophysics = 0;
    var_6244a1d5b282bb6c = 0;
    skipminimapicon = 0;
    scenenode = self;
    animbasename = "ks_airdrop_escort_crate";
    animname = "crate_push_out_left";
    for (i = 0; i < numcrates; i++) {
        streakname = undefined;
        if (streaknames.size > 0) {
            streakname = getrandomkillstreak(streaknames);
        } else {
            streakname = getrandomkillstreak();
        }
        cratedropdata = getkillstreakcratedatabystreakname(streakname, 0);
        if (crateindex >= 1) {
            animname = "crate_push_out_right";
            crateindex = 0;
        }
        crate = createcrate(crateowner, crateteam, cratetype, crateorigin, var_90d4fe050e6864d4, cratedestination, hasnophysics, var_6244a1d5b282bb6c, cratedropdata, skipminimapicon);
        crate.streakinfo = self.streakinfo;
        crate.animname = "ks_airdrop_escort_crate";
        crate scripts\common\anim::setanimtree();
        thread function_96e5dfe9c1aa7de0(crate, animname, "body_animate_jnt");
        streaknames[streaknames.size] = streakname;
        crateindex++;
        wait 0.5;
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff5
// Size: 0x57
function function_96e5dfe9c1aa7de0(crate, animname, animtag) {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    scripts\common\anim::anim_single_solo(crate, animname, animtag);
    crate stopanimscripted();
    crate cratephysicson();
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2054
// Size: 0x2a
function function_e44ce535d38f95a(startingpos, currenttarget) {
    return distance2dsquared(startingpos, currenttarget.origin) <= 25000000;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2087
// Size: 0x2a
function function_ff7aba975a027d9b(startingpos, currenttarget) {
    return distance2dsquared(startingpos, currenttarget.origin) <= 16000000;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20ba
// Size: 0xfa
function function_6af592b35966f02a() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    self endon("heli_attack");
    level endon("game_ended");
    self notify("heli_patrol");
    self.currentaction = "heli_patrol";
    self clearlookatent();
    self setneargoalnotifydist(300);
    var_65af68838583c396 = 0;
    var_b9a46106a6a99ee8 = 0;
    while (true) {
        if (self.currentaction == "heli_attack") {
            waitframe();
            continue;
        }
        newgoal = self.pathgoal + anglestoforward((0, var_b9a46106a6a99ee8, 0)) * int(self.patrolradius / 1.2);
        /#
            level thread drawsphere(newgoal, 100, 5, (1, 1, 1));
        #/
        var_b9a46106a6a99ee8 += 90;
        function_112064acba6603c3(newgoal, 0);
        if (var_b9a46106a6a99ee8 >= 360) {
            var_b9a46106a6a99ee8 = 0;
        }
        wait 0.5;
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21bc
// Size: 0x74
function function_365529b3985c87d4() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    self endon("heli_attack");
    level endon("game_ended");
    self notify("heli_overwatch");
    self.currentaction = "heli_overwatch";
    self clearlookatent();
    self setlookatent(self.owner);
    while (true) {
        function_112064acba6603c3(self.owner, 1);
        waitframe();
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2238
// Size: 0x197
function function_112064acba6603c3(target, forcestopatgoal) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self notify("escort_moving");
    self endon("escort_moving");
    newpos = undefined;
    testtarget = target;
    if (!isvector(target)) {
        testtarget = target.origin;
    }
    ignorelist = [self, self.turret];
    while (true) {
        currentpos = self.origin;
        initialgoalpos = testtarget * (1, 1, 0) + (0, 0, self.origin[2]);
        obstructiontrace = sphere_trace(currentpos, initialgoalpos, 350, ignorelist);
        obstructed = 0;
        xpos = testtarget[0];
        ypos = testtarget[1];
        if (isdefined(obstructiontrace)) {
            if (obstructiontrace["hittype"] != "hittype_none") {
                xpos = obstructiontrace["position"][0];
                ypos = obstructiontrace["position"][1];
                obstructed = 1;
            }
        }
        properz = scripts\cp_mp\killstreaks\chopper_support::getcorrectheight(xpos, ypos, 20, 512);
        newpos = (xpos, ypos, properz);
        stopatgoal = 0;
        if (istrue(forcestopatgoal) && !istrue(obstructed)) {
            stopatgoal = forcestopatgoal;
        }
        self setvehgoalpos(newpos, stopatgoal);
        waittill_any_2("near_goal");
        if (!istrue(obstructed)) {
            break;
        }
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23d7
// Size: 0x242
function function_94ca0444f2efd147() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self clearlookatent();
    self setmaxpitchroll(0, 0);
    self notify("leaving");
    playkillstreakoperatordialog("airdrop_escort", "airdrop_escort" + "_leave", 1);
    var_df6c75d1a1e4ff18 = 3;
    flightheightoffset = (0, 0, 1000);
    var_bb0e78a73b33d580 = self.origin + flightheightoffset;
    leavestart = undefined;
    leavegoal = undefined;
    var_ec0c66c48e6f8304 = undefined;
    while (var_df6c75d1a1e4ff18 > 0) {
        flightpath = function_999fe3838d6b6f8c(var_bb0e78a73b33d580, self.angles, 350, 25000);
        if (isdefined(flightpath.end)) {
            leavestart = flightpath.start;
            leavegoal = flightpath.end;
            var_ec0c66c48e6f8304 = flightpath.angles;
            break;
        }
        var_bb0e78a73b33d580 += (0, 0, 1000);
        var_df6c75d1a1e4ff18--;
        wait 0.05;
    }
    if (!isdefined(leavegoal)) {
        thread function_c91a4a524a2d461d();
        return;
    }
    turnspeed = 150;
    ascendspeed = 50;
    self setyawspeed(turnspeed, 50, 25, 0);
    self settargetyaw(var_ec0c66c48e6f8304[1]);
    self vehicle_setspeed(ascendspeed, 25);
    pathgoal = leavestart;
    self setvehgoalpos(pathgoal, 1);
    waittill_any_timeout_1(3, "goal");
    failsafetime = 0;
    while (failsafetime < 2) {
        currentyaw = (0, self.angles[1], 0);
        yawdiff = var_ec0c66c48e6f8304 - currentyaw;
        if (abs(yawdiff[1]) < 5) {
            break;
        }
        failsafetime += level.framedurationseconds;
        waitframe();
    }
    self setmaxpitchroll(15, 15);
    self vehicle_setspeed(150, self.accel);
    self setvehgoalpos(leavegoal, 1);
    self setneargoalnotifydist(1000);
    waittill_any_timeout_1(10, "near_goal");
    thread function_334e82bd0e14dcf4(0);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2621
// Size: 0x44
function function_c91a4a524a2d461d() {
    if (istrue(self.isexploding)) {
        return;
    }
    self notify("explode");
    self.isexploding = 1;
    self setscriptablepartstate("explode", "on", 0);
    wait 0.35;
    function_334e82bd0e14dcf4(1);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x266d
// Size: 0x16d
function function_334e82bd0e14dcf4(wasdestroyed) {
    if (istrue(self.var_bf178f6894d17b96)) {
        return;
    }
    self.var_bf178f6894d17b96 = 1;
    if (issharedfuncdefined("player", "printGameAction")) {
        [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - airdrop_escort", self.owner);
    }
    self.streakinfo.expiredbydeath = istrue(wasdestroyed);
    if (!istrue(self.recordedgameendstats)) {
        self.owner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(self.streakinfo);
    }
    self stoploopsound();
    if (isdefined(self.turret)) {
        if (isdefined(self.turret.groundtargetent)) {
            self.turret.groundtargetent delete();
        }
        self.turret setentityowner(undefined);
        self.turret delete();
    }
    if (isdefined(self.testtarget)) {
        self.testtarget delete();
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    level.cratedropdata.escortchoppers = array_remove(level.cratedropdata.escortchoppers, self);
    scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_deregisterinstance(self);
    scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(self);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27e2
// Size: 0x10c
function function_e46fb5b1144140e(turret) {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    /#
        thread function_12e7f2f1edff81ed();
        thread function_1a2daa72951eb0a4();
    #/
    childthread function_5a040540bee50d81();
    while (true) {
        var_868c91589c5db1ab = getdvarint(@"hash_94edbe8b5c5b8dd0", 0);
        if (istrue(turret.disabled)) {
            waitframe();
            continue;
        }
        if (self.currentaction == "heli_overwatch") {
            self waittill("near_goal");
        }
        if (!var_868c91589c5db1ab) {
            besttargetdata = function_770a14e56b03b067(turret, 4000, 1, 0, 0, "lost_target", @"hash_f8c88d9bcfa63da3");
            if (isdefined(besttargetdata)) {
                function_cade8c61df282de5(besttargetdata);
            }
            if (!isdefined(self.currentaction) || self.currentaction != self.defaultaction) {
                self thread [[ self.defaultactionfunc ]]();
                wait 2;
            }
        }
        wait 0.05;
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f6
// Size: 0x5d
function function_5a040540bee50d81() {
    self endon("death");
    level endon("game_ended");
    while (true) {
        self.turret waittill("missile_fire", projectile);
        projectile.streakinfo = self.streakinfo;
        projectile.killcament = self.killcament;
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x295b
// Size: 0x1fc
function function_cade8c61df282de5(targetdata) {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("heli_patrol");
    self endon("heli_overwatch");
    if (isdefined(self.owner) && self.owner _isalive() && (!isdefined(self.lastfiretime) || self.lastfiretime + 15000 <= gettime())) {
        playkillstreakoperatordialog("airdrop_escort", "airdrop_escort" + "_spotted_target", 1);
        self.lastfiretime = gettime();
    }
    self notify("heli_attack");
    self.currentaction = "heli_attack";
    turret = self.turret;
    var_35d198c823443318 = function_70b8756e9fc03c44(targetdata);
    var_f14a9b1e9835aeaf = function_effebb9076efbdb(targetdata);
    function_82d3da0197ef0362("target_normal");
    self setlookatent(var_35d198c823443318);
    self setvehgoalpos(self.origin + anglestoforward(self.angles) * 500, 1);
    if (!isdefined(self.previousbesttarget) || isdefined(self.previousbesttarget) && self.previousbesttarget != var_35d198c823443318 && !isdefined(self.var_69894ea4b6754d6f)) {
        var_e207676f4fa3c931 = var_35d198c823443318;
        newpingindex = self.owner scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(6, var_e207676f4fa3c931.origin + (0, 0, 50), var_e207676f4fa3c931 getentitynumber());
        self.owner thread scripts\cp_mp\calloutmarkerping::_calloutmarkerping_predicted_timeout(newpingindex);
        thread function_7fa1ed261ae2f5e3(var_35d198c823443318);
    }
    function_2e5b122bd53f3e85(targetdata);
    function_aa86f3f7fe0f419b(targetdata);
    while (function_b42ad7e3bd84c2a7() && function_bc2021c62b0d43cc(turret, var_35d198c823443318)) {
        wait 1;
        function_8e4e16bbbfa26efc(targetdata);
    }
    return "stopped_firing";
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b60
// Size: 0x4d
function function_7fa1ed261ae2f5e3(var_35d198c823443318) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    level endon("game_ended");
    self notify("new_prev_target");
    self endon("new_prev_target");
    self.previousbesttarget = var_35d198c823443318;
    wait 5;
    self.previousbesttarget = undefined;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb5
// Size: 0xe3
function function_aa86f3f7fe0f419b(targetdata) {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("heli_patrol");
    turret = self.turret;
    var_de95d26a97999b92 = undefined;
    var_f14a9b1e9835aeaf = function_effebb9076efbdb(targetdata);
    var_35d198c823443318 = function_70b8756e9fc03c44(targetdata);
    if (isdefined(var_f14a9b1e9835aeaf)) {
        var_de95d26a97999b92 = var_f14a9b1e9835aeaf.origin;
    } else if (isplayer(var_35d198c823443318)) {
        var_de95d26a97999b92 = var_35d198c823443318 gettagorigin("j_mainroot");
    } else {
        var_de95d26a97999b92 = var_35d198c823443318.origin;
    }
    /#
        thread function_8e6abc3776d35863(var_de95d26a97999b92);
    #/
    function_36694823ba9ec40a(var_de95d26a97999b92);
    while (!function_46ba72dfa1f04939(turret.groundtargetent.origin)) {
        waitframe();
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca0
// Size: 0x170
function function_8e4e16bbbfa26efc(targetdata) {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("heli_patrol");
    turret = self.turret;
    turret endon("lost_target");
    var_de95d26a97999b92 = undefined;
    var_f14a9b1e9835aeaf = function_effebb9076efbdb(targetdata);
    var_35d198c823443318 = function_70b8756e9fc03c44(targetdata);
    var_dbc5aeb90480b355 = 0;
    turretfiretime = weaponfiretime("airdrop_escort_turret_ballistics_mp");
    attackradius = 80;
    var_546d410fced2a7dc = 5;
    var_b7f1b7d94522544f = 12;
    while (function_20e6f4d27c8040bd(turret) && var_dbc5aeb90480b355 < 15) {
        if (isdefined(var_f14a9b1e9835aeaf)) {
            var_de95d26a97999b92 = var_f14a9b1e9835aeaf.origin;
        } else if (isplayer(var_35d198c823443318)) {
            var_de95d26a97999b92 = var_35d198c823443318 gettagorigin("j_mainroot");
        } else {
            var_de95d26a97999b92 = var_35d198c823443318.origin;
        }
        function_36694823ba9ec40a(var_de95d26a97999b92, attackradius);
        if (var_dbc5aeb90480b355 == var_546d410fced2a7dc) {
            attackradius = int(40);
        } else if (var_dbc5aeb90480b355 >= var_b7f1b7d94522544f) {
            attackradius = undefined;
        }
        turret shootturret();
        var_dbc5aeb90480b355++;
        if (isdefined(turret.streakinfo)) {
            turret.streakinfo.shots_fired++;
        }
        wait turretfiretime;
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e18
// Size: 0x9b
function function_2e5b122bd53f3e85(targetdata) {
    turret = self.turret;
    playertarget = function_70b8756e9fc03c44(targetdata);
    thread function_a4da6e59481303f(playertarget, "death_or_disconnect");
    thread function_a4da6e59481303f(turret, "target_broke_los");
    thread function_a4da6e59481303f(turret, "target_outside_valid_range");
    thread function_a4da6e59481303f(turret, "target_timeout");
    thread function_a4da6e59481303f(turret, "target_last_stand");
    thread function_d8910badec564fa0(targetdata);
    thread function_3e4e3769f386a9a3(targetdata);
    thread function_a39bc57828127be1(targetdata);
    thread function_cc44cc73f134622e(targetdata);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ebb
// Size: 0x5d
function function_a4da6e59481303f(ent, actionnotify) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    self endon("crashing");
    turret = self.turret;
    turret endon("lost_target");
    ent waittill(actionnotify);
    function_7303808c08dbaae1();
    turret notify("lost_target");
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f20
// Size: 0x54
function function_b42ad7e3bd84c2a7() {
    turret = self.turret;
    hastarget = function_20e6f4d27c8040bd(turret);
    canattack = !isdefined(self.iscrashing) && !isdefined(self.isleaving);
    return istrue(hastarget) && istrue(canattack);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7d
// Size: 0x136
function function_36694823ba9ec40a(attackpoint, attackradius) {
    point = attackpoint;
    turret = self.turret;
    ignorelist = [self, self.turret];
    groundtarget = turret.groundtargetent;
    if (isdefined(attackradius)) {
        if (groundtarget islinked()) {
            groundtarget unlink();
        }
        randdist = randomint(attackradius);
        randangle = randomint(360);
        x = attackpoint[0] + randdist * cos(randangle);
        y = attackpoint[1] + randdist * sin(randangle);
        z = attackpoint[2];
        point = (x, y, z);
        groundtarget.origin = point;
        return;
    }
    if (groundtarget islinked()) {
        groundtarget unlink();
    }
    groundtarget linkto(function_2adff40b591b5758(turret), "tag_origin", (0, 0, 30), (0, 0, 0));
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30bb
// Size: 0x70
function function_46ba72dfa1f04939(targetorigin) {
    turret = self.turret;
    turretforward = anglestoforward(turret gettagangles("tag_flash"));
    targetdisplace = targetorigin - turret.origin;
    anglediff = math::anglebetweenvectors(turretforward, targetdisplace);
    if (anglediff <= 10) {
        return true;
    }
    return false;
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3134
// Size: 0xce
function function_d8910badec564fa0(targetdata) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    turret = self.turret;
    turret endon("lost_target");
    losttime = undefined;
    tolerance = 500;
    targetplayer = function_70b8756e9fc03c44(targetdata);
    attackvehicle = function_f6926785e402b9fe(targetdata);
    while (true) {
        canseetarget = turret_canseetarget(turret, targetplayer);
        if (!istrue(canseetarget)) {
            if (!isdefined(losttime)) {
                losttime = gettime();
            }
            if (gettime() - losttime > tolerance) {
                function_82d3da0197ef0362("target_broke_los");
                break;
            }
        } else {
            losttime = undefined;
        }
        wait 0.05;
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x320a
// Size: 0xcb
function function_3e4e3769f386a9a3(targetdata) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    turret = self.turret;
    turret endon("lost_target");
    targetplayer = function_70b8756e9fc03c44(targetdata);
    while (true) {
        startingpos = self.owner.origin;
        if (self.escorttype == "crate") {
            startingpos = self.pathgoal;
        }
        if (function_e44ce535d38f95a(startingpos, targetplayer)) {
            if (!function_ff7aba975a027d9b(startingpos, targetplayer)) {
                function_112064acba6603c3(targetplayer, 1);
                wait 1;
            }
        } else {
            function_82d3da0197ef0362("target_outside_valid_range");
            break;
        }
        wait 0.05;
    }
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32dd
// Size: 0x4a
function function_a39bc57828127be1(targetdata) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    turret = self.turret;
    turret endon("lost_target");
    wait 5;
    function_82d3da0197ef0362("target_timeout");
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x332f
// Size: 0x79
function function_cc44cc73f134622e(targetdata) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    turret = self.turret;
    turret endon("lost_target");
    targetplayer = function_70b8756e9fc03c44(targetdata);
    var_24e9cece4bc538db = function_d463678ccf4beeda(targetdata);
    if (istrue(var_24e9cece4bc538db)) {
        return;
    }
    targetplayer waittill("last_stand_start");
    function_82d3da0197ef0362("target_last_stand");
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33b0
// Size: 0x2c
function function_82d3da0197ef0362(targetstate) {
    turret = self.turret;
    function_46c1ea4a69ad33d6(turret, targetstate);
    turret notify(targetstate);
}

// Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33e4
// Size: 0x98
function function_7303808c08dbaae1() {
    turret = self.turret;
    if (turret.groundtargetent islinked()) {
        turret.groundtargetent unlink();
    }
    groundtargetorigin = self.origin - (0, 0, 100) + anglestoforward(self.angles) * 500;
    turret.groundtargetent.origin = groundtargetorigin;
    turret.groundtargetent linkto(self);
}

/#

    // Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3484
    // Size: 0x97
    function function_12e7f2f1edff81ed() {
        level endon("<dev string:x45>");
        self endon("<dev string:x50>");
        self endon("<dev string:x56>");
        self endon("<dev string:x5e>");
        turret = self.turret;
        while (true) {
            debugtarget = getdvarint(@"hash_e9159b47fbb642af", 0);
            if (!debugtarget) {
                waitframe();
                continue;
            }
            level thread drawsphere(turret.groundtargetent.origin, 25, 0.05, (1, 0, 0));
            wait 0.05;
        }
    }

    // Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3523
    // Size: 0xa2
    function function_8e6abc3776d35863(var_3609de6106cc37a6) {
        level endon("<dev string:x45>");
        self endon("<dev string:x50>");
        self endon("<dev string:x56>");
        self endon("<dev string:x5e>");
        self.owner endon("<dev string:x66>");
        turret = self.turret;
        turret endon("<dev string:x7b>");
        while (true) {
            debugtarget = getdvarint(@"hash_e9159b47fbb642af", 0);
            if (!debugtarget) {
                waitframe();
                continue;
            }
            level thread drawsphere(var_3609de6106cc37a6, 50, 0.05, (1, 1, 0));
            wait 0.05;
        }
    }

    // Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x35cd
    // Size: 0xed
    function function_1a2daa72951eb0a4() {
        level endon("<dev string:x45>");
        self endon("<dev string:x50>");
        self endon("<dev string:x56>");
        self endon("<dev string:x5e>");
        turret = self.turret;
        escortowner = self.owner;
        escortowner notifyonplayercommand("<dev string:x66>", "<dev string:x87>");
        escortowner notifyonplayercommand("<dev string:x66>", "<dev string:x91>");
        while (true) {
            debugtarget = getdvarint(@"hash_94edbe8b5c5b8dd0", 0);
            if (!debugtarget) {
                waitframe();
                continue;
            }
            escortowner waittill("<dev string:x66>");
            if (!function_20e6f4d27c8040bd(turret)) {
                childthread function_190c881f4cd38bf2();
                continue;
            }
            function_7303808c08dbaae1();
            self.owner iprintlnbold("<dev string:x9c>" + self.defaultaction);
            turret_cleartarget(turret);
            self thread [[ self.defaultactionfunc ]]();
        }
    }

    // Namespace airdrop_escort / namespace_33ee5ceeb5f1d380
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x36c2
    // Size: 0x24d
    function function_190c881f4cd38bf2() {
        self notify("<dev string:xae>");
        self endon("<dev string:xae>");
        self endon("<dev string:xc4>");
        self notify("<dev string:xd0>");
        self.currentaction = "<dev string:xd0>";
        turretfiretime = weaponfiretime("<dev string:xdc>");
        var_de95d26a97999b92 = undefined;
        attackradius = 80;
        targettracestart = self.owner getvieworigin();
        targettraceend = targettracestart + anglestoforward(self.owner getplayerangles()) * 50000;
        targettrace = scripts\engine\trace::ray_trace(targettracestart, targettraceend, self, scripts\engine\trace::create_contents(1, 1, 0, 1, 0, 1, 0, 1, 1));
        if (targettrace["<dev string:x100>"] != "<dev string:x108>") {
            var_de95d26a97999b92 = targettrace["<dev string:x115>"];
        } else {
            return;
        }
        testtarget = undefined;
        if (!isdefined(self.testtarget)) {
            testtarget = spawn("<dev string:x11e>", var_de95d26a97999b92);
            testtarget setmodel("<dev string:x12b>");
            testtarget dontinterpolate();
            testtarget.angles = self.owner.angles;
            self.testtarget = testtarget;
        } else {
            testtarget = self.testtarget;
            testtarget.origin = var_de95d26a97999b92;
        }
        targetdata = spawnstruct();
        targetdata.targetplayer = testtarget;
        targetdata.targetvehicle = undefined;
        targetdata.attackvehicle = 0;
        targetdata.attacklaststand = 0;
        targetdata.attackparachute = 0;
        turret = self.turret;
        var_35d198c823443318 = function_70b8756e9fc03c44(targetdata);
        self.owner iprintlnbold("<dev string:x136>");
        turret_settarget(turret, targetdata);
        self setlookatent(testtarget);
        self setvehgoalpos(self.origin + anglestoforward(self.angles) * 500, 1);
        function_aa86f3f7fe0f419b(targetdata);
        while (function_b42ad7e3bd84c2a7() && function_bc2021c62b0d43cc(turret, var_35d198c823443318)) {
            wait 1;
            function_8e4e16bbbfa26efc(targetdata);
        }
    }

#/
