// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using script_5323b44ee395058;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;

#namespace airdrop_escort;

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bf
// Size: 0x59
function function_f383491974a17b9a() {
    /#
        assertex(isdefined(level.cratedropdata), "airdrop_escort_init() called before scriptscp_mpkillstreaksairdrop::initCrateDropData().");
    #/
    if (issharedfuncdefined("airdrop_escort", "init")) {
        [[ getsharedfunc("airdrop_escort", "init") ]]();
    }
    level function_e407a860bff9c632();
    level function_a852f44527c9d61f();
    level function_9302fd2bfe5c663c();
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f
// Size: 0xc3
function function_e407a860bff9c632() {
    level.var_346499147c1f5c1f = 0;
    foreach (teamname in level.teamnamelist) {
        level.var_54eafc62b6ad04c8[teamname] = 0;
    }
    level.cratedropdata.var_4950bb412d4e1d5 = [];
    /#
        setdevdvarifuninitialized(@"hash_f8c88d9bcfa63da3", 0);
        setdevdvarifuninitialized(@"hash_e9159b47fbb642af", 0);
        setdevdvarifuninitialized(@"hash_94edbe8b5c5b8dd0", 0);
        setdevdvarifuninitialized(@"hash_4f4829715aa2fd22", "vehicle");
    #/
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e9
// Size: 0x11
function function_a852f44527c9d61f() {
    function_1f93185f55e71c3();
    function_29c55da256bfa6ba();
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x901
// Size: 0x53
function function_1f93185f55e71c3() {
    level.scr_animtree["ks_airdrop_escort_crate"] = %script_model;
    level.scr_anim["ks_airdrop_escort_crate"]["crate_push_out_left"] = script_model%iw9_mp_esc_airdrop_pack_l;
    level.scr_anim["ks_airdrop_escort_crate"]["crate_push_out_right"] = script_model%iw9_mp_esc_airdrop_pack_r;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x34
function function_29c55da256bfa6ba() {
    level.scr_animtree["ks_airdrop_escort_heli"] = %script_model;
    level.scr_anim["ks_airdrop_escort_heli"]["vehicle_doors_open"] = mp_vehicles_always_loaded%iw9_mp_esc_airdrop_helidoors;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x996
// Size: 0x7f
function function_9302fd2bfe5c663c() {
    game["dialog"]["airdrop_escort" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["airdrop_escort" + "_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["airdrop_escort" + "_destroyed"] = "killstreak_team_leader" + "_crash";
    game["dialog"]["airdrop_escort" + "_spotted_target"] = "killstreak_remote_operator" + "_target_spotted_single";
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1c
// Size: 0x21
function function_e24bffeb9974833e() {
    streakinfo = createstreakinfo("airdrop_escort", self);
    return function_45378f51950e7d1f(streakinfo);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa45
// Size: 0x343
function function_45378f51950e7d1f(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
        return 0;
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_phone_mp"));
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
    level.var_346499147c1f5c1f++;
    var_25f93ff4ca83eba9 = 1;
    if (islargemap()) {
        var_25f93ff4ca83eba9 = 2;
    }
    if (level.cratedropdata.var_4950bb412d4e1d5.size >= var_25f93ff4ca83eba9 || level.cratedropdata.var_4950bb412d4e1d5.size + level.incomingallchoppersupports > var_25f93ff4ca83eba9) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        level.var_346499147c1f5c1f--;
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return 0;
    }
    if (islargemap() && level.teambased) {
        var_abdb6af6e3ca3893 = 1;
        level.var_54eafc62b6ad04c8[self.team]++;
        if (getnumactivekillstreakperteam(self.team, level.cratedropdata.var_4950bb412d4e1d5) + level.var_54eafc62b6ad04c8[self.team] > var_25f93ff4ca83eba9) {
            level.var_346499147c1f5c1f--;
            level.var_54eafc62b6ad04c8[self.team]--;
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_SUPPORT_HELO");
            }
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            return 0;
        }
    }
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]]();
    }
    var_79710492b71b9e81 = function_5867a72a727ced43(self, self.origin, "overwatch", streakinfo);
    level.var_346499147c1f5c1f--;
    if (islargemap() && level.teambased) {
        level.var_54eafc62b6ad04c8[self.team]--;
    }
    if (!istrue(var_79710492b71b9e81)) {
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
    return var_79710492b71b9e81;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd90
// Size: 0x57
function function_5867a72a727ced43(owner, position, var_4361065c62f16c21, streakinfo) {
    escortheli = function_e384066b8cc15be4(owner, owner.team, position, var_4361065c62f16c21, streakinfo);
    if (!isdefined(escortheli)) {
        return 0;
    }
    escortheli thread function_429ba1c88d63319c(var_4361065c62f16c21);
    return 1;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdef
// Size: 0x865
function function_e384066b8cc15be4(owner, team, position, var_4361065c62f16c21, streakinfo) {
    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
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
        var_b2f2cbeb5539efa6 = level.heli_structs_entrances[var_8013278937ff2600];
        if (issharedfuncdefined("chopper_gunner", "findTargetStruct")) {
            goalstruct = [[ getsharedfunc("chopper_gunner", "findTargetStruct") ]](var_b2f2cbeb5539efa6.script_linkto, level.heli_structs_goals);
            if (isdefined(goalstruct)) {
                var_f3910d9d3efd6e9d = (0, 0, goalstruct.origin[2] + 1000);
                var_a168db747b0d79ac = var_b2f2cbeb5539efa6.origin * (1, 1, 0) + var_f3910d9d3efd6e9d;
                var_c32e33b4d51be12f = goalstruct.origin * (1, 1, 0) + var_f3910d9d3efd6e9d;
                var_8577d255d1a9bd14 = vectornormalize(var_c32e33b4d51be12f - var_a168db747b0d79ac);
                pathstart = var_a168db747b0d79ac;
                pathgoal = var_c32e33b4d51be12f + var_8577d255d1a9bd14 * 1000;
                var_98309fe48684a69 = vectortoangles(var_8577d255d1a9bd14);
            } else {
                /#
                    owner iprintlnbold("chopper_gunner" + var_b2f2cbeb5539efa6.script_linkto + "tag_origin");
                #/
            }
        }
    }
    escortheli = namespace_f64231d5b7a2c3c4::_spawnhelicopter(undefined, pathstart, var_98309fe48684a69, "veh_airdrop_escort_mp_phys", "veh9_mil_air_heli_hind_mp");
    if (!isdefined(escortheli)) {
        return undefined;
    }
    if (!isdefined(team)) {
        team = "neutral";
    }
    if (team != "neutral") {
        escortheli setvehicleteam(team);
    }
    var_ebbe5c4d79905b3d = 60;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            var_ebbe5c4d79905b3d = 9999;
        }
    #/
    escortheli.speed = 100;
    escortheli.accel = 50;
    escortheli.lifetime = var_ebbe5c4d79905b3d;
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
    escortheli.var_c91d73a79ba4a8ab = var_f3910d9d3efd6e9d;
    escortheli.droplocation = position;
    escortheli.var_4361065c62f16c21 = var_4361065c62f16c21;
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
    escortheli namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_5555ccc5b8ca52d3);
    escortheli namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_8fc896d80a52b782);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        escortheli [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_3439dfab92e219d1);
    }
    escortheli setscriptablepartstate("blinking_lights", "on", 0);
    escortheli setscriptablepartstate("engine", "on", 0);
    /#
        escortheli thread namespace_b1378d83bac67c85::function_dc4cb73de48ec3d6();
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
    var_71e1e35ac8a4138d = escortheli.origin - (0, 0, 100) + anglestoforward(escortheli.angles) * 500;
    escortheli.turret.groundtargetent = spawn("script_model", var_71e1e35ac8a4138d);
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
            escortheli namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Air", owner);
        }
    }
    level.cratedropdata.var_4950bb412d4e1d5[level.cratedropdata.var_4950bb412d4e1d5.size] = escortheli;
    return escortheli;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165c
// Size: 0x110
function function_923b24178e709fbb(streakname) {
    var_e25f9b0de2cc7b81 = self;
    scorepopup = "destroyed_" + streakname;
    vodestroyed = "airdrop_escort" + "_destroyed";
    destroyedsplash = "callout_destroyed_" + streakname;
    var_8dfc256103cce53e = &function_a4b7038df66c4b58;
    var_191284e2e2837328 = &function_350eb9923f9e2a74;
    var_bacc6dd14316758c = &function_3e6225ef4efc799e;
    var_7da88d9c69433487 = &function_e687e809e9570d59;
    deathcallback = &function_1fe4e6fd1f673f2d;
    killstreak_setupvehicledamagefunctionality(streakname, var_e25f9b0de2cc7b81, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(self, self.owner, self.owner.team);
    function_cfc5e3633ef950fd(1, 1500, &function_6e785f240ca1205e);
    function_cfc5e3633ef950fd(2, 1000, &function_71b13dc22e6c70cb);
    function_cfc5e3633ef950fd(3, 500, &function_a58186566a85e2db);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1773
// Size: 0x35
function function_a4b7038df66c4b58(streakname) {
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](streakname, 12);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17af
// Size: 0xc
function function_350eb9923f9e2a74(streakname) {
    
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c2
// Size: 0x3a
function function_3e6225ef4efc799e(data) {
    damage = data.damage;
    attacker = data.attacker;
    return 1;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1804
// Size: 0xa0
function function_e687e809e9570d59(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    self.currenthealth = self.currenthealth - damage;
    killstreak_updatedamagestate(self.currenthealth);
    return 1;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ac
// Size: 0x14
function function_6e785f240ca1205e() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c7
// Size: 0x14
function function_71b13dc22e6c70cb() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e2
// Size: 0x14
function function_a58186566a85e2db() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fd
// Size: 0x33
function function_1fe4e6fd1f673f2d(data) {
    self.killedbyweapon = data.objweapon;
    thread function_46088aa13d962f89(self.killedbyweapon);
    return 1;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1938
// Size: 0x4e
function function_46088aa13d962f89(var_11b83e21f9c87ff5) {
    self endon("explode");
    if (issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
        if (![[ getsharedfunc("killstreak", "isKillstreakWeapon") ]](var_11b83e21f9c87ff5)) {
            function_51beb9374f4650ab(150, var_11b83e21f9c87ff5);
        }
    }
    thread function_c91a4a524a2d461d();
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198d
// Size: 0xe3
function function_51beb9374f4650ab(speed, var_11b83e21f9c87ff5, var_c5adb13be635c61a) {
    self endon("explode");
    self clearlookatent();
    self notify("crashing");
    playsoundatpos(self.origin, "exp_escort_helo");
    self setmaxpitchroll(10, 50);
    self vehicle_setspeed(speed, 20, 20);
    self setneargoalnotifydist(100);
    var_6847739e80fb4e81 = namespace_b1378d83bac67c85::choppergunner_findcrashposition(2500);
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
    thread namespace_b1378d83bac67c85::choppergunner_spinout(speed);
    function_5a9772411551e56e("airdrop_escort");
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a77
// Size: 0xd
function function_962725f71407f96f(position) {
    return position;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8c
// Size: 0x11d
function function_429ba1c88d63319c(var_4361065c62f16c21) {
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
    var_8a8e6270e7e92c6 = undefined;
    if (var_4361065c62f16c21 == "crate") {
        self.defaultaction = "heli_patrol";
        self.var_8a8e6270e7e92c6 = &function_6af592b35966f02a;
        thread function_ba7e24ee1aaf05e3();
        wait(1);
    } else {
        self.defaultaction = "heli_overwatch";
        self.var_8a8e6270e7e92c6 = &function_365529b3985c87d4;
        thread function_365529b3985c87d4();
    }
    thread function_e46fb5b1144140e(self.turret);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb0
// Size: 0x22
function function_5555ccc5b8ca52d3(data) {
    self.turret.disabled = 1;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd9
// Size: 0x21
function function_8fc896d80a52b782(var_fcef8d217a441961) {
    self.turret.disabled = 0;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c01
// Size: 0x19
function function_3439dfab92e219d1(data) {
    if (isdefined(self)) {
        function_1fe4e6fd1f673f2d(data);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c21
// Size: 0x74
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
    wait(time);
    self.var_69894ea4b6754d6f = undefined;
    function_8fc896d80a52b782();
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9c
// Size: 0x31
function function_acdc6c19714b6bb8() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    wait(self.lifetime);
    thread function_94ca0444f2efd147();
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd4
// Size: 0x79
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

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d54
// Size: 0x60
function function_7fc680f960d38005() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    level waittill("game_ended");
    if (isdefined(self.owner)) {
        self.recordedgameendstats = 1;
        self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    }
    thread function_94ca0444f2efd147();
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dbb
// Size: 0x249
function function_ba7e24ee1aaf05e3() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    self.owner endon("disconnect");
    var_7f980e69def745b8 = level.scr_anim["ks_airdrop_escort_heli"]["vehicle_doors_open"];
    var_6a5dc0fc2710ad84 = getanimlength(var_7f980e69def745b8);
    thread namespace_bc4a4b9456315863::anim_single_solo(self, "vehicle_doors_open");
    wait(var_6a5dc0fc2710ad84);
    var_4a2aa8b66ac796d = [];
    numcrates = 2;
    var_c192239c59747190 = 0;
    var_5d11a6a17e49fdb3 = self.owner;
    var_8df771dfd9cc0975 = self.team;
    cratetype = ter_op(isdefined(self.owner), "killstreak", "killstreak_no_owner");
    var_8c4038f0270de13e = self gettagorigin("body_animate_jnt");
    var_90d4fe050e6864d4 = self.angles;
    var_ddb9d36f435ad444 = self.droplocation;
    hasnophysics = 0;
    var_6244a1d5b282bb6c = 0;
    skipminimapicon = 0;
    scenenode = self;
    var_7a950615615223f2 = "ks_airdrop_escort_crate";
    animname = "crate_push_out_left";
    for (i = 0; i < numcrates; i++) {
        streakname = undefined;
        if (var_4a2aa8b66ac796d.size > 0) {
            streakname = getrandomkillstreak(var_4a2aa8b66ac796d);
        } else {
            streakname = getrandomkillstreak();
        }
        cratedropdata = getkillstreakcratedatabystreakname(streakname, 0);
        if (var_c192239c59747190 >= 1) {
            animname = "crate_push_out_right";
            var_c192239c59747190 = 0;
        }
        crate = createcrate(var_5d11a6a17e49fdb3, var_8df771dfd9cc0975, cratetype, var_8c4038f0270de13e, var_90d4fe050e6864d4, var_ddb9d36f435ad444, hasnophysics, var_6244a1d5b282bb6c, cratedropdata, skipminimapicon);
        crate.streakinfo = self.streakinfo;
        crate.animname = "ks_airdrop_escort_crate";
        crate namespace_bc4a4b9456315863::setanimtree();
        thread function_96e5dfe9c1aa7de0(crate, animname, "body_animate_jnt");
        var_4a2aa8b66ac796d[var_4a2aa8b66ac796d.size] = streakname;
        var_c192239c59747190++;
        wait(0.5);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200b
// Size: 0x58
function function_96e5dfe9c1aa7de0(crate, animname, animtag) {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self endon("leaving");
    level endon("game_ended");
    namespace_bc4a4b9456315863::anim_single_solo(crate, animname, animtag);
    crate stopanimscripted();
    crate cratephysicson();
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206a
// Size: 0x2b
function function_e44ce535d38f95a(var_cdbb4a9588abef59, currenttarget) {
    return distance2dsquared(var_cdbb4a9588abef59, currenttarget.origin) <= 25000000;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x209d
// Size: 0x2b
function function_ff7aba975a027d9b(var_cdbb4a9588abef59, currenttarget) {
    return distance2dsquared(var_cdbb4a9588abef59, currenttarget.origin) <= 16000000;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d0
// Size: 0xfb
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
    while (1) {
        if (self.currentaction == "heli_attack") {
            waitframe();
            continue;
        }
        var_6e281dbd69fc980e = self.pathgoal + anglestoforward((0, var_b9a46106a6a99ee8, 0)) * int(self.patrolradius / 1.2);
        /#
            level thread drawsphere(var_6e281dbd69fc980e, 100, 5, (1, 1, 1));
        #/
        var_b9a46106a6a99ee8 = var_b9a46106a6a99ee8 + 90;
        function_112064acba6603c3(var_6e281dbd69fc980e, 0);
        if (var_b9a46106a6a99ee8 >= 360) {
            var_b9a46106a6a99ee8 = 0;
        }
        wait(0.5);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d2
// Size: 0x75
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
    while (1) {
        function_112064acba6603c3(self.owner, 1);
        waitframe();
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224e
// Size: 0x198
function function_112064acba6603c3(target, var_6c814cee8d2bd65e) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self notify("escort_moving");
    self endon("escort_moving");
    newpos = undefined;
    var_4e6df96d95bf50bc = target;
    if (!isvector(target)) {
        var_4e6df96d95bf50bc = target.origin;
    }
    ignorelist = [0:self, 1:self.turret];
    while (1) {
        currentpos = self.origin;
        var_2eca7b12d2ee27ba = var_4e6df96d95bf50bc * (1, 1, 0) + (0, 0, self.origin[2]);
        var_691aa1d5da533612 = sphere_trace(currentpos, var_2eca7b12d2ee27ba, 350, ignorelist);
        var_158f8e4d0e511638 = 0;
        xpos = var_4e6df96d95bf50bc[0];
        ypos = var_4e6df96d95bf50bc[1];
        if (isdefined(var_691aa1d5da533612)) {
            if (var_691aa1d5da533612["hittype"] != "hittype_none") {
                xpos = var_691aa1d5da533612["position"][0];
                ypos = var_691aa1d5da533612["position"][1];
                var_158f8e4d0e511638 = 1;
            }
        }
        var_7504c8791e34dc73 = namespace_343543689c1d8859::getcorrectheight(xpos, ypos, 20, 512);
        newpos = (xpos, ypos, var_7504c8791e34dc73);
        stopatgoal = 0;
        if (istrue(var_6c814cee8d2bd65e) && !istrue(var_158f8e4d0e511638)) {
            stopatgoal = var_6c814cee8d2bd65e;
        }
        self setvehgoalpos(newpos, stopatgoal);
        waittill_any_2("near_goal");
        if (!istrue(var_158f8e4d0e511638)) {
            break;
        }
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ed
// Size: 0x243
function function_94ca0444f2efd147() {
    self endon("death");
    self endon("explode");
    self endon("crashing");
    self clearlookatent();
    self setmaxpitchroll(0, 0);
    self notify("leaving");
    playkillstreakoperatordialog("airdrop_escort", "airdrop_escort" + "_leave", 1);
    var_df6c75d1a1e4ff18 = 3;
    var_e757789796c82383 = (0, 0, 1000);
    var_bb0e78a73b33d580 = self.origin + var_e757789796c82383;
    var_bc09a6e223b96348 = undefined;
    var_690e4620fe5fa98f = undefined;
    var_ec0c66c48e6f8304 = undefined;
    while (var_df6c75d1a1e4ff18 > 0) {
        flightpath = function_999fe3838d6b6f8c(var_bb0e78a73b33d580, self.angles, 350, 25000);
        if (isdefined(flightpath.end)) {
            var_bc09a6e223b96348 = flightpath.start;
            var_690e4620fe5fa98f = flightpath.end;
            var_ec0c66c48e6f8304 = flightpath.angles;
            break;
        }
        var_bb0e78a73b33d580 = var_bb0e78a73b33d580 + (0, 0, 1000);
        var_df6c75d1a1e4ff18--;
        wait(0.05);
    }
    if (!isdefined(var_690e4620fe5fa98f)) {
        thread function_c91a4a524a2d461d();
    } else {
        var_1602fab5eab68601 = 150;
        var_2451a07aca478bf6 = 50;
        self setyawspeed(var_1602fab5eab68601, 50, 25, 0);
        self settargetyaw(var_ec0c66c48e6f8304[1]);
        self vehicle_setspeed(var_2451a07aca478bf6, 25);
        pathgoal = var_bc09a6e223b96348;
        self setvehgoalpos(pathgoal, 1);
        waittill_any_timeout_1(3, "goal");
        var_f457885f9e89c75d = 0;
        while (var_f457885f9e89c75d < 2) {
            currentyaw = (0, self.angles[1], 0);
            yawdiff = var_ec0c66c48e6f8304 - currentyaw;
            if (abs(yawdiff[1]) < 5) {
                break;
            }
            var_f457885f9e89c75d = var_f457885f9e89c75d + level.framedurationseconds;
            waitframe();
        }
        self setmaxpitchroll(15, 15);
        self vehicle_setspeed(150, self.accel);
        self setvehgoalpos(var_690e4620fe5fa98f, 1);
        self setneargoalnotifydist(1000);
        waittill_any_timeout_1(10, "near_goal");
        thread function_334e82bd0e14dcf4(0);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2637
// Size: 0x45
function function_c91a4a524a2d461d() {
    if (istrue(self.var_3621873dccbde4b5)) {
        return;
    }
    self notify("explode");
    self.var_3621873dccbde4b5 = 1;
    self setscriptablepartstate("explode", "on", 0);
    wait(0.35);
    function_334e82bd0e14dcf4(1);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2683
// Size: 0x16e
function function_334e82bd0e14dcf4(var_4fac8b8ce36e09f1) {
    if (istrue(self.var_bf178f6894d17b96)) {
        return;
    }
    self.var_bf178f6894d17b96 = 1;
    if (issharedfuncdefined("player", "printGameAction")) {
        [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - airdrop_escort", self.owner);
    }
    self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
    if (!istrue(self.recordedgameendstats)) {
        self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    }
    self stoploopsound();
    if (isdefined(self.turret)) {
        if (isdefined(self.turret.groundtargetent)) {
            self.turret.groundtargetent delete();
        }
        self.turret setentityowner(undefined);
        self.turret delete();
    }
    if (isdefined(self.var_4e6df96d95bf50bc)) {
        self.var_4e6df96d95bf50bc delete();
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    level.cratedropdata.var_4950bb412d4e1d5 = array_remove(level.cratedropdata.var_4950bb412d4e1d5, self);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f8
// Size: 0x10d
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
    while (1) {
        var_868c91589c5db1ab = getdvarint(@"hash_94edbe8b5c5b8dd0", 0);
        if (istrue(turret.disabled)) {
            waitframe();
            continue;
        }
        if (self.currentaction == "heli_overwatch") {
            self waittill("near_goal");
        }
        if (!var_868c91589c5db1ab) {
            var_97e45ab250562d16 = function_770a14e56b03b067(turret, 4000, 1, 0, 0, "lost_target", @"hash_f8c88d9bcfa63da3");
            if (isdefined(var_97e45ab250562d16)) {
                function_cade8c61df282de5(var_97e45ab250562d16);
            }
            if (!isdefined(self.currentaction) || self.currentaction != self.defaultaction) {
                self thread [[ self.var_8a8e6270e7e92c6 ]]();
                wait(2);
            }
        }
        wait(0.05);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290c
// Size: 0x5e
function function_5a040540bee50d81() {
    self endon("death");
    level endon("game_ended");
    while (1) {
        projectile = self.turret waittill("missile_fire");
        projectile.streakinfo = self.streakinfo;
        projectile.killcament = self.killcament;
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2971
// Size: 0x1fd
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
    if (!isdefined(self.var_2bad310fe00f31e3) || isdefined(self.var_2bad310fe00f31e3) && self.var_2bad310fe00f31e3 != var_35d198c823443318 && !isdefined(self.var_69894ea4b6754d6f)) {
        var_e207676f4fa3c931 = var_35d198c823443318;
        var_d0ae85b60ec1f5f7 = self.owner namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(6, var_e207676f4fa3c931.origin + (0, 0, 50), var_e207676f4fa3c931 getentitynumber());
        self.owner thread namespace_ede58c1e66c2c280::_calloutmarkerping_predicted_timeout(var_d0ae85b60ec1f5f7);
        thread function_7fa1ed261ae2f5e3(var_35d198c823443318);
    }
    function_2e5b122bd53f3e85(targetdata);
    function_aa86f3f7fe0f419b(targetdata);
    while (function_b42ad7e3bd84c2a7() && function_bc2021c62b0d43cc(turret, var_35d198c823443318)) {
        wait(1);
        function_8e4e16bbbfa26efc(targetdata);
    }
    return "stopped_firing";
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b76
// Size: 0x4e
function function_7fa1ed261ae2f5e3(var_35d198c823443318) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    level endon("game_ended");
    self notify("new_prev_target");
    self endon("new_prev_target");
    self.var_2bad310fe00f31e3 = var_35d198c823443318;
    wait(5);
    self.var_2bad310fe00f31e3 = undefined;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bcb
// Size: 0xe4
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

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb6
// Size: 0x171
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
    var_c09eefd28ded683e = weaponfiretime("airdrop_escort_turret_ballistics_mp");
    var_b0b68854ae03b4d7 = 80;
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
        function_36694823ba9ec40a(var_de95d26a97999b92, var_b0b68854ae03b4d7);
        if (var_dbc5aeb90480b355 == var_546d410fced2a7dc) {
            var_b0b68854ae03b4d7 = int(40);
        } else if (var_dbc5aeb90480b355 >= var_b7f1b7d94522544f) {
            var_b0b68854ae03b4d7 = undefined;
        }
        turret shootturret();
        var_dbc5aeb90480b355++;
        if (isdefined(turret.streakinfo)) {
            turret.streakinfo.shots_fired++;
        }
        wait(var_c09eefd28ded683e);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2e
// Size: 0x9c
function function_2e5b122bd53f3e85(targetdata) {
    turret = self.turret;
    var_39c7490877e6efe5 = function_70b8756e9fc03c44(targetdata);
    thread function_a4da6e59481303f(var_39c7490877e6efe5, "death_or_disconnect");
    thread function_a4da6e59481303f(turret, "target_broke_los");
    thread function_a4da6e59481303f(turret, "target_outside_valid_range");
    thread function_a4da6e59481303f(turret, "target_timeout");
    thread function_a4da6e59481303f(turret, "target_last_stand");
    thread function_d8910badec564fa0(targetdata);
    thread function_3e4e3769f386a9a3(targetdata);
    thread function_a39bc57828127be1(targetdata);
    thread function_cc44cc73f134622e(targetdata);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed1
// Size: 0x5e
function function_a4da6e59481303f(ent, var_bf4a0adf8e2321fe) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    self endon("crashing");
    turret = self.turret;
    turret endon("lost_target");
    ent waittill(var_bf4a0adf8e2321fe);
    function_7303808c08dbaae1();
    turret notify("lost_target");
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f36
// Size: 0x55
function function_b42ad7e3bd84c2a7() {
    turret = self.turret;
    var_55d7603c1d7c24ca = function_20e6f4d27c8040bd(turret);
    var_56e17efa53b640d9 = !isdefined(self.iscrashing) && !isdefined(self.isleaving);
    return istrue(var_55d7603c1d7c24ca) && istrue(var_56e17efa53b640d9);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f93
// Size: 0x137
function function_36694823ba9ec40a(var_225d5be1546186a5, var_b0b68854ae03b4d7) {
    point = var_225d5be1546186a5;
    turret = self.turret;
    ignorelist = [0:self, 1:self.turret];
    var_fc034515f9e66143 = turret.groundtargetent;
    if (isdefined(var_b0b68854ae03b4d7)) {
        if (var_fc034515f9e66143 islinked()) {
            var_fc034515f9e66143 unlink();
        }
        var_a0a41ba05e16ffe6 = randomint(var_b0b68854ae03b4d7);
        randangle = randomint(360);
        x = var_225d5be1546186a5[0] + var_a0a41ba05e16ffe6 * cos(randangle);
        y = var_225d5be1546186a5[1] + var_a0a41ba05e16ffe6 * sin(randangle);
        z = var_225d5be1546186a5[2];
        point = (x, y, z);
        var_fc034515f9e66143.origin = point;
    } else {
        if (var_fc034515f9e66143 islinked()) {
            var_fc034515f9e66143 unlink();
        }
        var_fc034515f9e66143 linkto(function_2adff40b591b5758(turret), "tag_origin", (0, 0, 30), (0, 0, 0));
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d1
// Size: 0x71
function function_46ba72dfa1f04939(targetorigin) {
    turret = self.turret;
    var_929ad65d451ffc68 = anglestoforward(turret gettagangles("tag_flash"));
    var_efa57adc48838f9b = targetorigin - turret.origin;
    anglediff = math::anglebetweenvectors(var_929ad65d451ffc68, var_efa57adc48838f9b);
    if (anglediff <= 10) {
        return 1;
    }
    return 0;
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314a
// Size: 0xcf
function function_d8910badec564fa0(targetdata) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    turret = self.turret;
    turret endon("lost_target");
    var_fa2a5bdd4208df6e = undefined;
    tolerance = 500;
    targetplayer = function_70b8756e9fc03c44(targetdata);
    var_9e6b52e2227b1d6b = function_f6926785e402b9fe(targetdata);
    while (1) {
        canseetarget = function_f6f04fc4e42cf2c4(turret, targetplayer);
        if (!istrue(canseetarget)) {
            if (!isdefined(var_fa2a5bdd4208df6e)) {
                var_fa2a5bdd4208df6e = gettime();
            }
            if (gettime() - var_fa2a5bdd4208df6e > tolerance) {
                function_82d3da0197ef0362("target_broke_los");
                break;
            }
        } else {
            var_fa2a5bdd4208df6e = undefined;
        }
        wait(0.05);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3220
// Size: 0xcc
function function_3e4e3769f386a9a3(targetdata) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    turret = self.turret;
    turret endon("lost_target");
    targetplayer = function_70b8756e9fc03c44(targetdata);
    while (1) {
        var_cdbb4a9588abef59 = self.owner.origin;
        if (self.var_4361065c62f16c21 == "crate") {
            var_cdbb4a9588abef59 = self.pathgoal;
        }
        if (function_e44ce535d38f95a(var_cdbb4a9588abef59, targetplayer)) {
            if (!function_ff7aba975a027d9b(var_cdbb4a9588abef59, targetplayer)) {
                function_112064acba6603c3(targetplayer, 1);
                wait(1);
            }
        } else {
            function_82d3da0197ef0362("target_outside_valid_range");
            break;
        }
        wait(0.05);
    }
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f3
// Size: 0x4b
function function_a39bc57828127be1(targetdata) {
    self endon("leaving");
    self endon("explode");
    self endon("death");
    turret = self.turret;
    turret endon("lost_target");
    wait(5);
    function_82d3da0197ef0362("target_timeout");
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3345
// Size: 0x7a
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

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c6
// Size: 0x2d
function function_82d3da0197ef0362(targetstate) {
    turret = self.turret;
    function_46c1ea4a69ad33d6(turret, targetstate);
    turret notify(targetstate);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33fa
// Size: 0x99
function function_7303808c08dbaae1() {
    turret = self.turret;
    if (turret.groundtargetent islinked()) {
        turret.groundtargetent unlink();
    }
    var_71e1e35ac8a4138d = self.origin - (0, 0, 100) + anglestoforward(self.angles) * 500;
    turret.groundtargetent.origin = var_71e1e35ac8a4138d;
    turret.groundtargetent linkto(self);
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x349a
// Size: 0x98
function function_12e7f2f1edff81ed() {
    /#
        level endon("death");
        self endon("body_animate_jnt");
        self endon("printGameAction");
        self endon("death_or_disconnect");
        turret = self.turret;
        while (1) {
            var_86fca66109bd99a5 = getdvarint(@"hash_e9159b47fbb642af", 0);
            if (!var_86fca66109bd99a5) {
                waitframe();
                continue;
            }
            level thread drawsphere(turret.groundtargetent.origin, 25, 0.05, (1, 0, 0));
            wait(0.05);
        }
    #/
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3539
// Size: 0xa3
function function_8e6abc3776d35863(var_3609de6106cc37a6) {
    /#
        level endon("death");
        self endon("body_animate_jnt");
        self endon("printGameAction");
        self endon("death_or_disconnect");
        self.owner endon("iw9_mp_esc_airdrop_pack_l");
        turret = self.turret;
        turret endon("<unknown string>");
        while (1) {
            var_86fca66109bd99a5 = getdvarint(@"hash_e9159b47fbb642af", 0);
            if (!var_86fca66109bd99a5) {
                waitframe();
                continue;
            }
            level thread drawsphere(var_3609de6106cc37a6, 50, 0.05, (1, 1, 0));
            wait(0.05);
        }
    #/
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35e3
// Size: 0xee
function function_1a2daa72951eb0a4() {
    /#
        level endon("death");
        self endon("body_animate_jnt");
        self endon("printGameAction");
        self endon("death_or_disconnect");
        turret = self.turret;
        var_9b1b9683e2725860 = self.owner;
        var_9b1b9683e2725860 notifyonplayercommand("iw9_mp_esc_airdrop_pack_l", "<unknown string>");
        var_9b1b9683e2725860 notifyonplayercommand("iw9_mp_esc_airdrop_pack_l", "<unknown string>");
        while (1) {
            var_86fca66109bd99a5 = getdvarint(@"hash_94edbe8b5c5b8dd0", 0);
            if (!var_86fca66109bd99a5) {
                waitframe();
                continue;
            }
            var_9b1b9683e2725860 waittill("iw9_mp_esc_airdrop_pack_l");
            if (!function_20e6f4d27c8040bd(turret)) {
                childthread function_190c881f4cd38bf2();
            } else {
                function_7303808c08dbaae1();
                self.owner iprintlnbold("<unknown string>" + self.defaultaction);
                function_dfae8a6885a8537c(turret);
                self thread [[ self.var_8a8e6270e7e92c6 ]]();
            }
        }
    #/
}

// Namespace airdrop_escort/namespace_33ee5ceeb5f1d380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36d8
// Size: 0x24e
function function_190c881f4cd38bf2() {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self notify("<unknown string>");
        self.currentaction = "<unknown string>";
        var_c09eefd28ded683e = weaponfiretime("<unknown string>");
        var_de95d26a97999b92 = undefined;
        var_b0b68854ae03b4d7 = 80;
        var_53650d2083b7668f = self.owner getvieworigin();
        var_d449deb5b0fb63ba = var_53650d2083b7668f + anglestoforward(self.owner getplayerangles()) * 50000;
        var_369dc9ed4c0ec3f5 = namespace_2a184fc4902783dc::ray_trace(var_53650d2083b7668f, var_d449deb5b0fb63ba, self, namespace_2a184fc4902783dc::create_contents(1, 1, 0, 1, 0, 1, 0, 1, 1));
        if (var_369dc9ed4c0ec3f5["<unknown string>"] != "<unknown string>") {
            var_de95d26a97999b92 = var_369dc9ed4c0ec3f5["<unknown string>"];
        } else {
            return;
        }
        var_4e6df96d95bf50bc = undefined;
        if (!isdefined(self.var_4e6df96d95bf50bc)) {
            var_4e6df96d95bf50bc = spawn("<unknown string>", var_de95d26a97999b92);
            var_4e6df96d95bf50bc setmodel("<unknown string>");
            var_4e6df96d95bf50bc dontinterpolate();
            var_4e6df96d95bf50bc.angles = self.owner.angles;
            self.var_4e6df96d95bf50bc = var_4e6df96d95bf50bc;
        } else {
            var_4e6df96d95bf50bc = self.var_4e6df96d95bf50bc;
            var_4e6df96d95bf50bc.origin = var_de95d26a97999b92;
        }
        targetdata = spawnstruct();
        targetdata.targetplayer = var_4e6df96d95bf50bc;
        targetdata.targetvehicle = undefined;
        targetdata.var_9e6b52e2227b1d6b = 0;
        targetdata.var_ef401b2016b3518b = 0;
        targetdata.var_ebd7809caf7cf3b0 = 0;
        turret = self.turret;
        var_35d198c823443318 = function_70b8756e9fc03c44(targetdata);
        self.owner iprintlnbold("<unknown string>");
        function_e59541944f1a4fe5(turret, targetdata);
        self setlookatent(var_4e6df96d95bf50bc);
        self setvehgoalpos(self.origin + anglestoforward(self.angles) * 500, 1);
        function_aa86f3f7fe0f419b(targetdata);
        while (function_b42ad7e3bd84c2a7() && function_bc2021c62b0d43cc(turret, var_35d198c823443318)) {
            wait(1);
            function_8e4e16bbbfa26efc(targetdata);
        }
    #/
}

