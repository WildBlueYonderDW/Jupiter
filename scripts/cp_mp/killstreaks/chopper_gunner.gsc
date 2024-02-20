// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\engine\trace.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;

#namespace chopper_gunner;

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1143
// Size: 0xbe
function init() {
    if (issharedfuncdefined("chopper_gunner", "init")) {
        [[ getsharedfunc("chopper_gunner", "init") ]]();
    }
    /#
        setdevdvarifuninitialized(@"hash_5053673c4770b74", 0);
        setdevdvarifuninitialized(@"hash_f3fcf3899fa2e1b0", 0);
        setdevdvarifuninitialized(@"hash_a34a2f5a7d33e3bb", 0);
        setdevdvarifuninitialized(@"hash_804b68f93e7911ba", 1);
        setdevdvarifuninitialized(@"hash_6dcbef72bd1fd758", 0);
        setdevdvarifuninitialized(@"hash_c1fa04efebbe3e6b", -1);
    #/
    level function_b380d510fa08cdec();
    level function_402d391c1c0e8ca();
    level function_e4d2385d5eee2c51();
    level function_5d9a912bab9622da();
    level function_5de17c2babe4b71b();
    level function_76bacdfa4c4a7bdc();
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1208
// Size: 0xee
function function_b380d510fa08cdec() {
    level.choppergunners = [];
    level.heli_pilot_mesh = namespace_36f464722d326bbe::getlocaleent("heli_pilot_mesh");
    if (isdefined(level.heli_pilot_mesh)) {
        level.heli_pilot_mesh hide();
    }
    if (isdefined(level.mapname) && level.mapname == "mp_embassy") {
        level.heli_structs_entrances = array_remove_index(level.heli_structs_entrances, 2);
    }
    level.incomingallchoppergunners = 0;
    foreach (teamname in level.teamnamelist) {
        level.incomingchoppergunners[teamname] = 0;
    }
    registervisibilityomnvarforkillstreak("chopper_gunner", "on", 6);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fd
// Size: 0x61
function function_402d391c1c0e8ca() {
    val::function_2d6e7e0b80767910("chopperGunnerUse", [0:"killstreaks", 1:"allow_movement", 2:"fire", 3:"weapon_switch", 4:"melee", 5:"usability", 6:"shellshock", 7:"allow_jump", 8:"offhand_weapons"]);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1365
// Size: 0x13
function function_e4d2385d5eee2c51() {
    level choppergunner_pilotanims();
    level choppergunner_vehicleanims();
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137f
// Size: 0x1f3
function function_5d9a912bab9622da() {
    game["dialog"]["chopper_gunner" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["chopper_gunner" + "_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["chopper_gunner" + "_engage"] = "killstreak_remote_operator" + "_engage";
    game["dialog"]["chopper_gunner" + "_random_radio"] = "killstreak_remote_operator" + "_radio_chatter";
    game["dialog"]["chopper_gunner" + "_attack_single"] = "killstreak_remote_operator" + "_target_attack_single";
    game["dialog"]["chopper_gunner" + "_attack_multi"] = "killstreak_remote_operator" + "_target_attack_multi";
    game["dialog"]["chopper_gunner" + "_flares"] = "killstreak_remote_operator" + "_flare_release";
    game["dialog"]["chopper_gunner" + "_light_damage"] = "killstreak_remote_operator" + "_light_damage";
    game["dialog"]["chopper_gunner" + "_med_damage"] = "killstreak_remote_operator" + "_med_damage";
    game["dialog"]["chopper_gunner" + "_heavy_damage"] = "killstreak_remote_operator" + "_heavy_damage";
    game["dialog"]["chopper_gunner" + "_killconf_single"] = "killstreak_remote_operator" + "_confirm_kill_single";
    game["dialog"]["chopper_gunner" + "_killconf_multi"] = "killstreak_remote_operator" + "_confirm_kill_multi";
    game["dialog"]["chopper_gunner" + "_killconf_missile"] = "killstreak_remote_operator" + "_confirm_kill_missile";
    game["dialog"]["chopper_gunner" + "_lockedon"] = "killstreak_remote_operator" + "_missile_lock_warning";
    game["dialog"]["chopper_gunner" + "_reattack"] = "killstreak_remote_operator" + "_reattack";
    game["dialog"]["chopper_gunner" + "_crash"] = "killstreak_remote_operator" + "_crash";
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1579
// Size: 0x1d
function function_5de17c2babe4b71b() {
    level._effect["chopper_gunner_friendly_strobe"] = loadfx("vfx/iw8_mp/killstreak/vfx_apache_friendly_strobe.vfx");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159d
// Size: 0x48
function function_76bacdfa4c4a7bdc() {
    if (isdefined(level.var_84719b7574e06844)) {
        function_c0b0a582ff9e4d57(level.var_84719b7574e06844);
    }
    var_f55722829763abff = "chopper_color_mp";
    if (utility::iscp()) {
        var_f55722829763abff = "chopper_color_cp";
    }
    function_c0b0a582ff9e4d57(var_f55722829763abff);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ec
// Size: 0x72
function choppergunner_pilotanims() {
    level.scr_animtree["ks_chopper_gunner_pilot"] = %script_model;
    level.scr_anim["ks_chopper_gunner_pilot"]["pilot_intro"] = script_model%iw9_mp_ks_ahotel64_intro_player;
    level.scr_anim["ks_chopper_gunner_pilot"]["pilot_missile_crash"] = script_model%iw9_mp_ks_ahotel64_crash_player;
    level.scr_anim["ks_chopper_gunner_pilot"]["pilot_shot_crash"] = script_model%iw9_mp_ks_ahotel64_shot_player;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1665
// Size: 0x34
function choppergunner_vehicleanims() {
    level.scr_animtree["ks_chopper_gunner_vehicle_camera"] = %script_model;
    level.scr_anim["ks_chopper_gunner_vehicle_camera"]["vehicle_intro"] = mp_vehicles_always_loaded%iw9_mp_ks_ahotel64_intro_heli;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a0
// Size: 0xe
function weapongivenchoppergunner(streakinfo) {
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b6
// Size: 0x21
function tryusechoppergunner() {
    streakinfo = createstreakinfo("chopper_gunner", self);
    return tryusechoppergunnerfromstruct(streakinfo);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16df
// Size: 0x28c
function tryusechoppergunnerfromstruct(streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    var_75d0da8e536bc6e1 = function_b96cc2f80fa02ac2(streakinfo);
    if (!istrue(var_75d0da8e536bc6e1)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return 0;
    }
    if (istrue(streakinfo.var_1c24ab6a14a60f16)) {
        val::set("chopperGunner", "ads", 0);
    }
    var_f79327d5641a9504 = function_e708b248bc646ecb(streakinfo);
    level.incomingallchoppergunners--;
    if (islargemap() && level.teambased) {
        level.incomingchoppergunners[self.team]--;
    }
    if (!istrue(var_f79327d5641a9504)) {
        val::function_c9d0b43701bdba00("chopperGunner");
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    if (issharedfuncdefined("game", "disable_backpack_inventory")) {
        self [[ getsharedfunc("game", "disable_backpack_inventory") ]](1);
    }
    thirdperson = 0;
    /#
        thirdperson = getdvarint(@"hash_5053673c4770b74", 0);
        if (istrue(thirdperson)) {
            streakinfo notify("_attack_multi");
        }
    #/
    choppergunner = startchoppergunnerintro(self, streakinfo, thirdperson);
    choppergunner function_af96f7c8819ae854(self, 1000);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        choppergunner [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_20b002475b7af53b);
    }
    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    if (!isdefined(choppergunner)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]]("chopper_gunner", self.origin);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_chopper_gunner", self);
    }
    choppergunner thread function_fc02c5717861131a(self, thirdperson);
    if (issharedfuncdefined("killstreak", "makeChopperGunnerTargetableByAI")) {
        choppergunner [[ getsharedfunc("killstreak", "makeChopperGunnerTargetableByAI") ]]();
    }
    choppergunner thread function_98c857a1612a19d();
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1973
// Size: 0x83
function function_98c857a1612a19d() {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    while (1) {
        if (self.origin[2] < self.heightoffset[2] - 20) {
            self.origin = (self.origin[0], self.origin[1], self.heightoffset[2] + 100);
        }
        wait(0.1);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19fd
// Size: 0x25a
function function_b96cc2f80fa02ac2(streakinfo) {
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]]();
    }
    if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
        }
        return 0;
    }
    var_4440147083abaf0a = 1;
    if (issharedfuncdefined("killstreak", "currentActiveVehicleCount") && issharedfuncdefined("killstreak", "maxVehiclesAllowed")) {
        if ([[ getsharedfunc("killstreak", "currentActiveVehicleCount") ]]() >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]() || level.fauxvehiclecount + var_4440147083abaf0a >= [[ getsharedfunc("killstreak", "maxVehiclesAllowed") ]]()) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_VEHICLES");
            }
            return 0;
        }
    }
    level.incomingallchoppergunners++;
    var_9c8d568f8760e50 = 1;
    if (islargemap()) {
        var_9c8d568f8760e50 = 2;
    }
    if (level.choppergunners.size >= var_9c8d568f8760e50 || level.choppergunners.size + level.incomingallchoppergunners > var_9c8d568f8760e50) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        level.incomingallchoppergunners--;
        return 0;
    }
    if (islargemap() && level.teambased) {
        var_abdb6af6e3ca3893 = 1;
        level.incomingchoppergunners[self.team]++;
        if (getnumactivekillstreakperteam(self.team, level.choppergunners) + level.incomingchoppergunners[self.team] > var_abdb6af6e3ca3893) {
            level.incomingallchoppergunners--;
            level.incomingchoppergunners[self.team]--;
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/MAX_FRIENDLY_CHOPPER_GUNNER");
            }
            return 0;
        }
    }
    if (level.gameended) {
        return 0;
    }
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5f
// Size: 0x8e
function function_e708b248bc646ecb(streakinfo) {
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (!istrue(streakinfo.var_1c24ab6a14a60f16)) {
        deployweaponobj = makeweapon("ks_remote_device_mp");
        var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo, &weapongivenchoppergunner);
        if (!istrue(var_9b1deb5e9d32bbe3)) {
            return 0;
        }
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf5
// Size: 0xe59
function startchoppergunnerintro(owner, streakinfo, thirdperson) {
    owner disablephysicaldepthoffieldscripting();
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    heightoffset = (0, 0, 0);
    if (isdefined(var_5fa1e1697a302583) && !islargemap()) {
        heightoffset = (0, 0, var_5fa1e1697a302583.origin[2] - 1000);
        if (heightoffset[2] > 4000) {
            setglobalsoundcontext("airstrikeheight", "high");
        } else if (heightoffset[2] > 3000) {
            setglobalsoundcontext("airstrikeheight", "medium");
        }
    } else {
        heightoffset = (0, 0, 2000);
    }
    /#
        var_ae257a52192fe977 = getdvarint(@"hash_f3fcf3899fa2e1b0", 0);
        heightoffset = heightoffset + (0, 0, var_ae257a52192fe977);
    #/
    pathgoal = (owner.origin + anglestoforward(owner.angles) * 2000) * (1, 1, 0);
    pathgoal = pathgoal + heightoffset;
    angles = owner.angles;
    if (isdefined(level.heli_structs_entrances) && level.heli_structs_entrances.size > 0) {
        var_8013278937ff2600 = randomint(level.heli_structs_entrances.size);
        /#
            var_2613246720524878 = getdvarint(@"hash_c1fa04efebbe3e6b", -1);
            if (var_2613246720524878 != -1) {
                var_8013278937ff2600 = var_2613246720524878;
            }
        #/
        var_b2f2cbeb5539efa6 = level.heli_structs_entrances[var_8013278937ff2600];
        if (issharedfuncdefined("chopper_gunner", "findTargetStruct")) {
            goalstruct = [[ getsharedfunc("chopper_gunner", "findTargetStruct") ]](var_b2f2cbeb5539efa6.script_linkto, level.heli_structs_goals);
            if (isdefined(goalstruct)) {
                heightoffset = function_2b1f56257b43a133((0, 0, goalstruct.origin[2] + 200));
                /#
                    var_ae257a52192fe977 = getdvarint(@"hash_f3fcf3899fa2e1b0", 0);
                    heightoffset = heightoffset + (0, 0, var_ae257a52192fe977);
                #/
                var_a168db747b0d79ac = var_b2f2cbeb5539efa6.origin * (1, 1, 0) + heightoffset;
                var_c32e33b4d51be12f = goalstruct.origin * (1, 1, 0) + heightoffset;
                var_8577d255d1a9bd14 = vectornormalize(var_c32e33b4d51be12f - var_a168db747b0d79ac);
                pathgoal = var_c32e33b4d51be12f + var_8577d255d1a9bd14 * 500;
                angles = vectortoangles(var_8577d255d1a9bd14);
                /#
                    level thread namespace_f2ffc0540883e1ad::drawsphere(var_a168db747b0d79ac, 20, 60, (1, 0, 0));
                    level thread namespace_f2ffc0540883e1ad::drawline(var_a168db747b0d79ac, var_c32e33b4d51be12f, 60, (1, 1, 1));
                    level thread namespace_f2ffc0540883e1ad::drawsphere(var_c32e33b4d51be12f, 20, 60, (0, 1, 0));
                #/
            } else {
                /#
                    owner iprintlnbold("teamPlayerCardSplash" + var_b2f2cbeb5539efa6.script_linkto + "high");
                #/
            }
        }
    } else if (istrue(owner.infinite_chopper) && level.script == "cp_so_aniyah") {
        if (level.players.size > 1) {
            var_a5b3c87a0495acaf = array_remove(level.players, owner);
        } else {
            var_a5b3c87a0495acaf = level.players;
        }
        var_bde2c8dcaaf3e1e8 = random(var_a5b3c87a0495acaf);
        var_cc75f1c67d8631d9 = (var_bde2c8dcaaf3e1e8.origin[0], var_bde2c8dcaaf3e1e8.origin[1], 1750);
        while (level.objective_locations.size == 0) {
            waitframe();
        }
        var_6bc9557c53b7e270 = getclosest(var_cc75f1c67d8631d9, level.objective_locations);
        var_bf56b72e9a5b0cc1 = (var_6bc9557c53b7e270.origin[0], var_6bc9557c53b7e270.origin[1], 1750);
        var_bc721267bcee957a = vectornormalize(var_cc75f1c67d8631d9 - var_bf56b72e9a5b0cc1);
        pathgoal = var_bf56b72e9a5b0cc1 - var_bc721267bcee957a * 1000;
        angles = vectortoangles(var_bc721267bcee957a);
    } else if (isdefined(streakinfo.var_6411fbc3afb86bc0)) {
        var_c2f78f301f8104e3 = [[ streakinfo.var_6411fbc3afb86bc0 ]](owner);
        pathgoal = var_c2f78f301f8104e3.pathgoal;
        angles = var_c2f78f301f8104e3.angles;
    } else {
        owner iprintlnbold("Level is missing heli structs, please set them up!");
        heightoffset = function_2b1f56257b43a133(heightoffset);
        pathgoal = pathgoal * (1, 1, 0) + heightoffset;
    }
    var_d166c9b268e88725 = "veh_apache_mp_phys";
    var_1f17b37a437d607c = "veh9_mil_air_heli_ahotel64_mp";
    if (getdvarint(@"hash_f9d055c32419e2f2", 0) > 0 || istrue(owner.infinite_chopper) && level.script == "cp_so_aniyah") {
        var_d166c9b268e88725 = "veh_apache_cp_so_aniyah";
    }
    choppergunner = undefined;
    if (istrue(thirdperson)) {
        choppergunner = namespace_f64231d5b7a2c3c4::_spawnhelicopter(undefined, pathgoal, angles, var_d166c9b268e88725, var_1f17b37a437d607c);
    } else {
        choppergunner = namespace_f64231d5b7a2c3c4::_spawnhelicopter(owner, pathgoal, angles, var_d166c9b268e88725, var_1f17b37a437d607c);
    }
    if (!isdefined(choppergunner)) {
        return;
    }
    choppergunner vehphys_forcekeyframedmotion();
    choppergunner function_247ad6a91f6a4ffe(1);
    level thread function_ee93617532d8a679(choppergunner, owner, &choppergunner_explode);
    var_ebbe5c4d79905b3d = 45;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            var_ebbe5c4d79905b3d = 9999;
        }
    #/
    choppergunner.speed = 100;
    choppergunner.accel = 50;
    choppergunner.lifetime = var_ebbe5c4d79905b3d;
    choppergunner.team = owner.team;
    choppergunner.owner = owner;
    choppergunner.angles = angles;
    choppergunner.streakinfo = streakinfo;
    choppergunner.streakname = streakinfo.streakname;
    choppergunner.flaresreservecount = 1;
    choppergunner.pathgoal = pathgoal;
    choppergunner.missilesleft = getdvarint(@"hash_52bf6045193decbf", 8);
    choppergunner.animname = "ks_chopper_gunner_vehicle_camera";
    choppergunner.infinite_chopper = istrue(owner.infinite_chopper);
    choppergunner.var_2b4bbc4c0ae46fd5 = owner function_c77d8b1c3a992f19("chopper_interior_probe");
    choppergunner.ispiloted = 1;
    choppergunner.heightoffset = heightoffset;
    choppergunner setvehicleteam(choppergunner.team);
    if (issharedfuncdefined("chopper_gunner", "attachXRays")) {
        choppergunner = [[ getsharedfunc("chopper_gunner", "attachXRays") ]](choppergunner);
    }
    choppergunner thread choppergunner_watchintrodisown("disconnect", streakinfo);
    choppergunner thread choppergunner_watchintrodisown("joined_team", streakinfo);
    choppergunner thread choppergunner_watchintrodisown("joined_spectator", streakinfo);
    choppergunner thread choppergunner_watchintrodisown("player_fatal_death", streakinfo);
    maxhealth = 2000;
    if (istrue(level.istacops)) {
        maxhealth = 1000;
    }
    choppergunner.health = maxhealth;
    choppergunner.maxhealth = maxhealth;
    choppergunner.currenthealth = maxhealth;
    choppergunner namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Air", owner);
    choppergunner function_8de91f51bc626d93(streakinfo.streakname);
    level.choppergunners[level.choppergunners.size] = choppergunner;
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        choppergunner [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", owner, 0, 1, 100);
    }
    choppergunner setmaxpitchroll(15, 15);
    choppergunner vehicle_setspeed(choppergunner.speed, choppergunner.accel);
    choppergunner sethoverparams(50, 5, 2.5);
    choppergunner setturningability(1);
    choppergunner setyawspeed(500, 100, 25, 0.5);
    choppergunner setotherent(owner);
    choppergunner setcandamage(1);
    choppergunner setneargoalnotifydist(5000);
    choppergunner setscriptablepartstate("blinking_lights", "on", 0);
    choppergunner setscriptablepartstate("interior_light", "off", 0);
    choppergunner setscriptablepartstate("engine", "on", 0);
    /#
        choppergunner thread function_dc4cb73de48ec3d6();
    #/
    turretmodel = "veh9_mil_air_heli_ahotel64_turret";
    var_d5d9f2143828e449 = function_2926a76719559d56();
    choppergunner.turret = spawnturret("misc_turret", choppergunner gettagorigin("tag_turret"), var_d5d9f2143828e449);
    choppergunner.turret setmodel(turretmodel);
    choppergunner.turret.owner = owner;
    choppergunner.turret.team = owner.team;
    choppergunner.turret.angles = choppergunner.angles;
    choppergunner.turret.streakinfo = streakinfo;
    choppergunner.turret linkto(choppergunner, "tag_turret");
    choppergunner.turret setturretteam(owner.team);
    choppergunner.turret setturretmodechangewait(0);
    choppergunner.turret setmode("manual");
    choppergunner.turret setotherent(owner);
    choppergunner.turret setdefaultdroppitch(45);
    choppergunner.mpod1 = spawn("script_model", choppergunner gettagorigin("tag_gun_l"));
    choppergunner.mpod1 setmodel("ks_chopper_gunner_turret_mp");
    choppergunner.mpod1.angles = choppergunner.angles;
    choppergunner.mpod1.owner = choppergunner.owner;
    choppergunner.mpod1.team = choppergunner.team;
    choppergunner.mpod1 linkto(choppergunner, "tag_gun_l");
    choppergunner.mpod1 setentityowner(owner);
    choppergunner.mpod1 setotherent(owner);
    choppergunner.mpod2 = spawn("script_model", choppergunner gettagorigin("tag_gun_r"));
    choppergunner.mpod2 setmodel("ks_chopper_gunner_turret_mp");
    choppergunner.mpod2.angles = choppergunner.angles;
    choppergunner.mpod2.owner = choppergunner.owner;
    choppergunner.mpod2.team = choppergunner.team;
    choppergunner.mpod2 linkto(choppergunner, "tag_gun_r");
    choppergunner.mpod2 setentityowner(owner);
    choppergunner.mpod2 setotherent(owner);
    var_daa0b77b12720c18 = "fullbody_sp_ally_pilot_western_vm";
    if (getplayersuperfaction(owner) == 1) {
        var_daa0b77b12720c18 = "fullbody_sp_ally_pilot_eastern_vm";
    }
    choppergunner.pilot = spawn("script_model", choppergunner gettagorigin("tag_origin"));
    choppergunner.pilot setmodel(var_daa0b77b12720c18);
    choppergunner.pilot.angles = choppergunner.angles;
    choppergunner.pilot linkto(choppergunner, "tag_origin");
    choppergunner.pilot.animname = "ks_chopper_gunner_pilot";
    choppergunner.pilot namespace_bc4a4b9456315863::setanimtree();
    level notify("matchrecording_chopper", choppergunner);
    self notify("chopper_gunner_used");
    if (!istrue(thirdperson)) {
        _stopshellshock();
        self.restoreangles = self getplayerangles();
        val::function_3633b947164be4f3("chopperGunnerUse", 0);
        /#
        #/
        self setcinematicmotionoverride("player_chopper_gunner_ride_mp");
        thread function_d13d2a81214fbfb8("80_instant_noscale", 1);
        self setclientomnvar("ui_apache_screens_state", 1);
        self cameralinkto(choppergunner.pilot, "tag_camera", 1, 1);
        self painvisionoff();
        killstreak_savenvgstate();
        choppergunner playsoundtoplayer("mp_killstreak_apache_transition_lr", self);
        goto LOC_00000d42;
    }
LOC_00000d42:
    playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_use", 1, undefined, "pilot");
    var_75ff6c760340b2dc = get_notetrack_time(level.scr_anim["ks_chopper_gunner_pilot"]["pilot_intro"], "camera_zoom");
    var_60c29673cce4f3f4 = getanimlength(level.scr_anim["ks_chopper_gunner_pilot"]["pilot_intro"]);
    var_9fcab10c7e98e5d0 = getanimlength(level.scr_anim["ks_chopper_gunner_vehicle_camera"]["vehicle_intro"]);
    choppergunner.var_8921ca6bcbebd389 = var_9fcab10c7e98e5d0 - var_75ff6c760340b2dc;
    choppergunner thread namespace_bc4a4b9456315863::anim_single_solo(choppergunner, "vehicle_intro");
    choppergunner thread namespace_bc4a4b9456315863::anim_single_solo(choppergunner.pilot, "pilot_intro", "body_animate_jnt");
    choppergunner function_546c923a292bab24(choppergunner.var_2b4bbc4c0ae46fd5);
    choppergunner choppergunner_startfadetransition(var_75ff6c760340b2dc, thirdperson, 0.1);
    choppergunner function_38101db6ed950f17(choppergunner.var_2b4bbc4c0ae46fd5);
    if (!isdefined(choppergunner) || istrue(choppergunner.var_3621873dccbde4b5)) {
        return undefined;
    }
    choppergunner notify("start_chopper_use");
    return choppergunner;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b56
// Size: 0x106
function function_8de91f51bc626d93(streakname) {
    var_e25f9b0de2cc7b81 = self;
    scorepopup = "destroyed_" + streakname;
    vodestroyed = undefined;
    destroyedsplash = "callout_destroyed_" + streakname;
    var_8dfc256103cce53e = &function_c668cff4b2ddaed0;
    var_191284e2e2837328 = &function_42807e45e47344c;
    var_bacc6dd14316758c = &function_623713927a33cb76;
    var_7da88d9c69433487 = &function_ade353d9afc0d191;
    deathcallback = &choppergunner_handledeathdamage;
    killstreak_setupVehicleDamageFunctionality(streakname, var_e25f9b0de2cc7b81, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(self, self.owner, self.owner.team);
    function_cfc5e3633ef950fd(1, 1500, &function_30e33dc1b5a3d096);
    function_cfc5e3633ef950fd(2, 1000, &function_9a86620d2c95b213);
    function_cfc5e3633ef950fd(3, 500, &function_5df4204110a49163);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c63
// Size: 0x35
function function_c668cff4b2ddaed0(streakname) {
    if (issharedfuncdefined("vehicle_damage", "setVehicleHitDamageData")) {
        [[ getsharedfunc("vehicle_damage", "setVehicleHitDamageData") ]](streakname, 12);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9f
// Size: 0x10b
function function_42807e45e47344c(streakname) {
    weaponname = "thermite_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 30;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "thermite_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 80;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 11;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 18;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2db1
// Size: 0x117
function choppergunner_watchintrodisown(var_304d14a0f176d5c3, streakinfo) {
    chopperowner = self.owner;
    self endon("death");
    self endon("exit_chopper_intro");
    self endon("start_chopper_use");
    level endon("game_ended");
    chopperowner waittill(var_304d14a0f176d5c3);
    if (var_304d14a0f176d5c3 == "disconnect") {
        level.incomingallchoppergunners--;
        if (islargemap() && level.teambased) {
            level.incomingchoppergunners[self.team]--;
        }
    }
    if (isdefined(chopperowner)) {
        chopperowner cameraunlink();
        chopperowner disablephysicaldepthoffieldscripting();
        chopperowner val::function_588f2307a3040610("chopperGunnerUse");
        chopperowner val::function_c9d0b43701bdba00("chopperGunner");
        chopperowner _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
        chopperowner setclientomnvar("ui_apache_screens_state", 0);
        chopperowner painvisionon();
        chopperowner killstreak_restorenvgstate();
        chopperowner killstreak_setMainVision("");
        chopperowner function_8b676f496920e2ab();
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(chopperowner, 0);
    }
    thread choppergunner_explode();
    self notify("exit_chopper_intro");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ecf
// Size: 0x2b
function choppergunner_waitintroanimtime(time) {
    self endon("death");
    self endon("exit_chopper_intro");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(time);
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f02
// Size: 0x7e
function choppergunner_playdofintroeffects() {
    self endon("death");
    self endon("exit_chopper_intro");
    self.owner endon("disconnect");
    self.owner enablephysicaldepthoffieldscripting();
    self.owner setphysicaldepthoffield(4, 5000, 10, 10);
    wait(2);
    self.owner setphysicaldepthoffield(4, 20, 5, 10);
    wait(1.5);
    self.owner setphysicaldepthoffield(4, 1, 3, 10);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f87
// Size: 0x6f
function choppergunner_camerashake(choppergunner) {
    choppergunner endon("death");
    choppergunner endon("explode");
    choppergunner endon("leaving");
    choppergunner endon("crashing");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        self earthquakeforplayer(0.01, 0.1, choppergunner gettagorigin("tag_origin"), 1000);
        self playrumbleonentity("damage_light");
        wait(0.1);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ffd
// Size: 0x492
function function_fc02c5717861131a(gunner, thirdperson) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](self.streakinfo);
    }
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
    }
    gunner = self.owner;
    gunner disablephysicaldepthoffieldscripting();
    if (!istrue(thirdperson)) {
        gunner.usingchoppergunner = 1;
        gunner val::set("chopperGunner", "allow_movement", 1);
        gunner val::set("chopperGunner", "fire", 1);
        gunner val::set("chopperGunner", "ads", 1);
        gunner cameraunlink();
        gunner thread function_d13d2a81214fbfb8("default");
        gunner remotecontrolturret(self.turret);
        gunner _shellshock("killstreak_veh_camera_mp", "top", self.lifetime, 0);
        choppergunner_updatetargetmarkergroups(1);
    }
    if (isdefined(level.var_84719b7574e06844)) {
        self.currentvisionset = level.var_84719b7574e06844;
    }
    if (!isdefined(self.playersfx)) {
        self.playersfx = spawn("script_origin", self.origin);
        self.playersfx linkto(self);
    }
    setlockedoncallback(self, &choppergunner_lockedoncallback);
    setlockedonremovedcallback(self, &choppergunner_lockedonremovedcallback);
    self setcandamage(1);
    thread choppergunner_handledangerzone(thirdperson);
    thread choppergunner_handlethermalswitch(thirdperson);
    thread choppergunner_handlemissilefire(thirdperson);
    thread choppergunner_watchturretfire(thirdperson);
    thread choppergunner_watchgameendleave(thirdperson);
    thread function_c7c48aed42b53d29(thirdperson);
    thread choppergunner_watchownerexitaction("disconnect");
    thread choppergunner_watchownerexitaction("joined_team");
    thread choppergunner_watchownerexitaction("joined_spectator");
    thread choppergunner_watchownerexitaction("team_kill_punish");
    thread choppergunner_watchownerexitaction("player_fatal_death");
    thread function_f6a755e207671291();
    if (!istrue(self.infinite_chopper)) {
        thread choppergunner_watchlifetime(thirdperson);
        self.owner setclientomnvar("ui_killstreak_countdown", gettime() + int(self.lifetime * 1000));
    }
    /#
        if (istrue(thirdperson)) {
            thread function_f67cf34c214a0189();
            thread function_38b07fa35df09c85();
            thread function_fe8987efca006a06();
        }
    #/
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        self thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&choppergunner_handlemissiledetection);
    }
    if (!istrue(thirdperson)) {
        if (isdefined(level.var_84719b7574e06844)) {
            self.currentvisionset = level.var_84719b7574e06844;
        }
        gunner killstreak_setMainVision(self.currentvisionset);
        gunner _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "on");
        gunner setclientomnvar("ui_apache_screens_state", 0);
        gunner setclientomnvar("ui_apache_controls", 1);
        gunner setclientomnvar("ui_killstreak_weapon_1_ammo", self.missilesleft);
        gunner setclientomnvar("ui_killstreak_health", self.health / self.maxhealth);
        gunner setclientomnvar("ui_killstreak_flares", self.flaresreservecount);
        gunner setclientomnvar("ui_killstreak_damage_state", 0);
        self.playersfx playloopsound("veh_apache_killstreak_amb_lr");
        gunner setclienttriggeraudiozonepartialwithfade("apache_killstreak", 1.5, "mix", "filter");
    }
    delaytime = self.var_8921ca6bcbebd389;
    if (istrue(gunner.var_65219c911f198c95)) {
        choppergunner_handledeathdamage(gunner.var_5c079aa1be2b9bb);
    }
    wait(delaytime);
    if (!istrue(thirdperson)) {
        gunner remotecontrolvehicle(self);
    } else {
        self setvehgoalpos(self.origin, 1);
    }
    if (self vehicle_isphysveh()) {
        self vehphys_setdefaultmotion();
    }
    thread choppergunner_watchearlyexit(thirdperson);
    var_7aed0f2a57765c9d = function_dfc7af47240a8c18();
    self vehicle_setspeed(var_7aed0f2a57765c9d.speed, var_7aed0f2a57765c9d.accel);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3);
    if (isdefined(level.heli_pilot_mesh)) {
        /#
            var_ae257a52192fe977 = getdvarint(@"hash_f3fcf3899fa2e1b0", 0);
            if (var_ae257a52192fe977 != 0) {
                return;
            }
        #/
        level.heli_pilot_mesh show();
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3496
// Size: 0xdf
function function_dfc7af47240a8c18() {
    var_2771a96b4c9afd11 = spawnstruct();
    var_2771a96b4c9afd11.speed = 40;
    var_2771a96b4c9afd11.accel = 20;
    switch (level.mapname) {
    case #"hash_1373c0a36e3cab54":
    case #"hash_81b84d832a53ee33":
    case #"hash_afcbd31dbcac0848":
    case #"hash_c23b803a5c7be5f3":
    case #"hash_dfa04d97b4cc9b44":
        var_2771a96b4c9afd11.speed = 25;
        var_2771a96b4c9afd11.accel = 15;
        break;
    case #"hash_150cb4659bbe6335":
    case #"hash_52f1fb3b7304621d":
    case #"hash_ae56d5b65ad78351":
        var_2771a96b4c9afd11.speed = 30;
        var_2771a96b4c9afd11.accel = 20;
        break;
    }
    return var_2771a96b4c9afd11;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357d
// Size: 0x82
function function_2b1f56257b43a133(var_bad97bf0dd8846f4) {
    var_7972751497d6d77d = var_bad97bf0dd8846f4;
    switch (level.mapname) {
    case #"hash_52f1fb3b7304621d":
    case #"hash_81b84d832a53ee33":
    case #"hash_c23b803a5c7be5f3":
        var_7972751497d6d77d = var_7972751497d6d77d + (0, 0, 300);
        break;
    case #"hash_4c82fa7758456cd5":
        var_7972751497d6d77d = var_7972751497d6d77d + (0, 0, 3000);
        break;
    }
    return var_7972751497d6d77d;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3607
// Size: 0x3b
function choppergunner_lockedoncallback() {
    playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_lockedon", undefined, undefined, "pilot");
    namespace_84cff6185e39aa66::vehomn_showwarning("missileLocking", self.owner, "killstreak");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3649
// Size: 0x1d
function choppergunner_lockedonremovedcallback() {
    namespace_84cff6185e39aa66::vehomn_hidewarning("missileLocking", self.owner, "killstreak");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x366d
// Size: 0x97
function choppergunner_updatetargetmarkergroups(var_d1d3327f51ed4342) {
    if (istrue(var_d1d3327f51ed4342)) {
        if (istrue(self.infinite_chopper)) {
            return;
        }
        if (issharedfuncdefined("chopper_gunner", "assignTargetMarkers")) {
            self [[ getsharedfunc("chopper_gunner", "assignTargetMarkers") ]]();
        }
    } else {
        if (isdefined(self.enemytargetmarkergroup)) {
            namespace_f48c22429667eba9::targetmarkergroup_off(self.enemytargetmarkergroup);
            self.enemytargetmarkergroup = undefined;
        }
        if (isdefined(self.friendlytargetmarkergroup)) {
            namespace_f48c22429667eba9::targetmarkergroup_off(self.friendlytargetmarkergroup);
            self.friendlytargetmarkergroup = undefined;
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x370b
// Size: 0x33
function choppergunner_watchendstrobefx(choppergunner) {
    self endon("death");
    level endon("game_ended");
    choppergunner waittill_any_2("death", "leaving");
    self delete();
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3745
// Size: 0x6d
function choppergunner_startfadetransition(timedelay, thirdperson, var_1e1134ff29f6168c) {
    self endon("death");
    self endon("exit_chopper_intro");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(timedelay);
    if (!istrue(thirdperson)) {
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self.owner, 1, var_1e1134ff29f6168c);
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_1e1134ff29f6168c);
    if (!istrue(thirdperson)) {
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self.owner, 0, var_1e1134ff29f6168c);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37b9
// Size: 0xc0
function function_f67cf34c214a0189() {
    /#
        self endon("addToActiveKillstreakList");
        self endon("tag_turret");
        var_d5d9f2143828e449 = function_2926a76719559d56();
        self.currentdebugweapon = var_d5d9f2143828e449;
        var_a95a67a21665324a = self.owner;
        var_a95a67a21665324a notifyonplayercommand("fullbody_sp_ally_pilot_eastern_vm", "script_origin");
        var_ab7356fd109d3e8d = ter_op(utility::iscp(), "veh_apache_killstreak_amb_lr", "chopper_gunner_proj_mp");
        while (1) {
            var_a95a67a21665324a waittill("fullbody_sp_ally_pilot_eastern_vm");
            if (self.currentdebugweapon == var_d5d9f2143828e449) {
                self.currentdebugweapon = var_ab7356fd109d3e8d;
            } else {
                self.currentdebugweapon = var_d5d9f2143828e449;
            }
            var_a95a67a21665324a iprintlnbold("body_damage_light" + self.currentdebugweapon);
        }
    #/
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3880
// Size: 0xce
function function_38b07fa35df09c85() {
    /#
        self endon("addToActiveKillstreakList");
        self endon("tag_turret");
        var_a95a67a21665324a = self.owner;
        var_a95a67a21665324a notifyonplayercommand("script_noteworthy", "<unknown string>");
        var_a95a67a21665324a notifyonplayercommand("script_noteworthy", "<unknown string>");
        self.var_36d522b9b4678ef1 = spawn("<unknown string>", self.origin);
        self.var_36d522b9b4678ef1 setmodel("<unknown string>");
        self.var_36d522b9b4678ef1 dontinterpolate();
        while (1) {
            var_a95a67a21665324a waittill("script_noteworthy");
            if (isdefined(self.var_65af4c0a1e8737e1)) {
                self clearlookatent();
                self.var_65af4c0a1e8737e1 delete();
            }
            thread function_c31fd561d72092a5(var_a95a67a21665324a, self.currentdebugweapon);
        }
    #/
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3955
// Size: 0x197
function function_c31fd561d72092a5(var_a95a67a21665324a, weaponname) {
    /#
        self endon("addToActiveKillstreakList");
        self endon("tag_turret");
        var_a95a67a21665324a endon("<unknown string>");
        var_a95a67a21665324a endon("script_noteworthy");
        var_a95a67a21665324a endon("fullbody_sp_ally_pilot_eastern_vm");
        var_5f8d47facd99fabf = weaponfiretime(weaponname);
        var_53650d2083b7668f = var_a95a67a21665324a getvieworigin();
        var_d449deb5b0fb63ba = var_53650d2083b7668f + anglestoforward(var_a95a67a21665324a getplayerangles()) * 50000;
        var_369dc9ed4c0ec3f5 = namespace_2a184fc4902783dc::ray_trace(var_53650d2083b7668f, var_d449deb5b0fb63ba, self, namespace_2a184fc4902783dc::create_contents(1, 1, 0, 1, 0, 1, 0, 1, 1));
        var_ef24300e6dde92ba = undefined;
        if (var_369dc9ed4c0ec3f5["<unknown string>"] != "<unknown string>") {
            var_ef24300e6dde92ba = var_369dc9ed4c0ec3f5["<unknown string>"];
        }
        if (!isdefined(var_ef24300e6dde92ba)) {
            return;
        }
        self.var_36d522b9b4678ef1.origin = var_ef24300e6dde92ba;
        var_d5d9f2143828e449 = function_2926a76719559d56();
        if (weaponname == var_d5d9f2143828e449) {
            self.turret snaptotargetentity(self.var_36d522b9b4678ef1);
        }
        self.var_65af4c0a1e8737e1 = spawn("<unknown string>", var_ef24300e6dde92ba);
        self setlookatent(self.var_65af4c0a1e8737e1);
        while (1) {
            if (weaponname == var_d5d9f2143828e449) {
                self.turret shootturret();
            } else {
                var_a95a67a21665324a notify("<unknown string>", var_ef24300e6dde92ba);
            }
            sphere(self.var_36d522b9b4678ef1.origin, 50, (1, 1, 0), 0, int(var_5f8d47facd99fabf));
            wait(var_5f8d47facd99fabf);
        }
    #/
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3af3
// Size: 0xd2
function function_fe8987efca006a06() {
    /#
        self endon("addToActiveKillstreakList");
        self endon("tag_turret");
        var_a95a67a21665324a = self.owner;
        var_a95a67a21665324a notifyonplayercommand("<unknown string>", "<unknown string>");
        var_a95a67a21665324a notifyonplayercommand("<unknown string>", "<unknown string>");
        self vehicle_setspeed(40, 45);
        self.var_a88ee0e5466e893d = 0;
        while (1) {
            var_a95a67a21665324a waittill("<unknown string>");
            if (!istrue(self.var_a88ee0e5466e893d)) {
                self.var_a88ee0e5466e893d = 1;
                var_a95a67a21665324a iprintlnbold("<unknown string>");
            } else {
                self.var_a88ee0e5466e893d = 0;
                var_a95a67a21665324a iprintlnbold("<unknown string>");
                var_a95a67a21665324a notify("<unknown string>");
                self setvehgoalpos(self.pathgoal, 1);
                continue;
            }
            thread function_19ead4526ebc7004(var_a95a67a21665324a);
        }
    #/
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bcc
// Size: 0x9a
function function_19ead4526ebc7004(var_a95a67a21665324a) {
    /#
        self endon("addToActiveKillstreakList");
        self endon("tag_turret");
        self endon("<unknown string>");
        var_a95a67a21665324a endon("<unknown string>");
        var_b9a46106a6a99ee8 = 0;
        while (1) {
            var_6e281dbd69fc980e = self.origin + anglestoforward((0, var_b9a46106a6a99ee8, 0)) * 2000;
            sphere(var_6e281dbd69fc980e, 50, (1, 1, 1), 0, 40);
            var_b9a46106a6a99ee8 = var_b9a46106a6a99ee8 + 20;
            self setvehgoalpos(var_6e281dbd69fc980e, 0);
            if (var_b9a46106a6a99ee8 >= 360) {
                var_b9a46106a6a99ee8 = 0;
            }
            wait(0.5);
        }
    #/
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6d
// Size: 0x198
function choppergunner_handledangerzone(thirdperson) {
    self endon("leaving");
    self endon("crashing");
    self endon("death");
    level endon("game_ended");
    zone = undefined;
    var_a34242959ea0e02b = self.origin;
    var_4a6abc8d46fb3619 = 750;
    var_20e0e132629f3354 = 2000;
    var_16a1ab6dfeb8d692 = self.team;
    zoneLifetime = self.lifetime;
    var_4cddbf0b2285c1be = self.owner;
    var_ddf8049486533578 = 1;
    var_cdc10243b9998950 = self;
    var_d3279a50b0437e88 = 1;
    if (issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        zone = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](var_a34242959ea0e02b, var_4a6abc8d46fb3619, var_20e0e132629f3354, var_16a1ab6dfeb8d692, zoneLifetime, var_4cddbf0b2285c1be, var_ddf8049486533578, var_cdc10243b9998950, var_d3279a50b0437e88);
    }
    if (isdefined(zone) && issharedfuncdefined("spawn", "getCodeHandleFromScriptHandle")) {
        var_4344aeb5e045ac5 = [[ getsharedfunc("spawn", "getCodeHandleFromScriptHandle") ]](zone);
        while (1) {
            var_cefd3f9499be0121 = ray_trace(self.origin, self.origin - (0, 0, 20000), self);
            if (var_cefd3f9499be0121["hittype"] != "hittype_none") {
                spawninfluencepointsetposition(var_4344aeb5e045ac5, var_cefd3f9499be0121["position"]);
            }
            namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.25);
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e0c
// Size: 0x42
function choppergunner_handlethermalswitch(thirdperson) {
    if (!istrue(thirdperson)) {
        var_a95a67a21665324a = self.owner;
        var_a95a67a21665324a thread watchthermalinputchange();
        choppergunner_handlethermalswitchinternal();
        if (isdefined(var_a95a67a21665324a)) {
            var_a95a67a21665324a stopwatchingthermalinputchange();
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e55
// Size: 0x1b3
function choppergunner_handlethermalswitchinternal() {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    var_a95a67a21665324a = self.owner;
    var_aa58b09fc1b68120 = 0;
    var_9b984d47de04e649 = 0;
    var_93b54405fda960c = function_44e0bd95b98288ab();
    var_776eb21ee7baab30 = "chopper_color_mp";
    if (utility::iscp()) {
        var_776eb21ee7baab30 = "chopper_color_cp";
    }
    self.currentvisionset = var_776eb21ee7baab30;
    if (isnightmap()) {
        var_a95a67a21665324a setthermalvision(1, 12, 1000);
        self.currentvisionset = var_93b54405fda960c;
        var_a95a67a21665324a _shellshock("killstreak_veh_camera_flir_mp", "top", self.lifetime, 0);
        var_aa58b09fc1b68120 = 1;
        var_9b984d47de04e649 = 1;
    }
    while (1) {
        var_a95a67a21665324a setclientomnvar("ui_killstreak_thermal_mode", var_9b984d47de04e649);
        var_a95a67a21665324a killstreak_setMainVision(self.currentvisionset);
        var_a95a67a21665324a waittill("switch_thermal_mode");
        var_a95a67a21665324a notify("chopper_gunner_toggled_flir", !var_aa58b09fc1b68120);
        if (!istrue(var_aa58b09fc1b68120)) {
            var_a95a67a21665324a setthermalvision(1, 12, 1000);
            self.currentvisionset = var_93b54405fda960c;
            var_a95a67a21665324a _shellshock("killstreak_veh_camera_flir_mp", "top", self.lifetime, 0);
            var_aa58b09fc1b68120 = 1;
            var_9b984d47de04e649 = 1;
        } else {
            if (isdefined(level.var_84719b7574e06844)) {
                var_a95a67a21665324a killstreak_setMainVision(level.var_84719b7574e06844);
                self.currentvisionset = level.var_84719b7574e06844;
            } else {
                var_a95a67a21665324a killstreak_setMainVision(var_776eb21ee7baab30);
                self.currentvisionset = var_776eb21ee7baab30;
            }
            var_a95a67a21665324a setthermalvision(0);
            var_a95a67a21665324a _shellshock("killstreak_veh_camera_mp", "top", self.lifetime, 0);
            var_aa58b09fc1b68120 = 0;
            var_9b984d47de04e649 = 0;
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400f
// Size: 0x4f7
function choppergunner_handlemissilefire(thirdperson) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    var_a95a67a21665324a = self.owner;
    var_a95a67a21665324a notifyonplayercommand("shoot_missile", "+frag");
    self.missilefireside = undefined;
    var_fa1b66c7e6853ee1 = 0;
    var_43cb1141ecbed065 = 4;
    var_fa3d844d56938a31 = getdvarint(@"hash_52bf6045193decbf", 8);
    while (1) {
        var_2511abb80c1de0c9 = var_a95a67a21665324a waittill("shoot_missile");
        if (istrue(self.infinite_chopper)) {
            if (utility::iscp() && self.missilesleft <= 1) {
                childthread choppergunner_refillmissiles();
            } else if (!iscp() && self.missilesleft == var_fa3d844d56938a31) {
                childthread choppergunner_refillmissiles();
            }
        }
        var_fa1b66c7e6853ee1++;
        self.streakinfo.shots_fired++;
        if (var_fa1b66c7e6853ee1 > var_43cb1141ecbed065) {
            var_fa1b66c7e6853ee1 = 1;
        }
        var_9798c7aa7c0a8a06 = ter_op(isdefined(self.turret), self.turret.origin, self.origin);
        self.owner earthquakeforplayer(0.25, 0.4, var_9798c7aa7c0a8a06, 150);
        self.owner playrumbleonentity("damage_heavy");
        var_b8ee7ddd93755f86 = self.mpod1;
        if (!isdefined(self.missilefireside) || self.missilefireside == "right") {
            self.missilefireside = "left";
            self.mpod1 thread choppergunner_firemissilefx(var_fa1b66c7e6853ee1);
            var_b8ee7ddd93755f86 = self.mpod1;
        } else {
            self.missilefireside = "right";
            self.mpod2 thread choppergunner_firemissilefx(var_fa1b66c7e6853ee1);
            var_b8ee7ddd93755f86 = self.mpod2;
        }
        var_48c7944ad56a77ec = self.turret gettagorigin("tag_pivot");
        var_a437f2b6d33146eb = anglestoforward(self.turret gettagangles("tag_player"));
        var_b979f793dccb4061 = var_b8ee7ddd93755f86.origin * (1, 1, 0) + (0, 0, var_48c7944ad56a77ec[2]);
        var_429aae2e6e20f85 = var_b979f793dccb4061 + var_a437f2b6d33146eb * 100;
        var_85fa3cdcb19d2a9c = var_b979f793dccb4061 + var_a437f2b6d33146eb * 1000;
        var_53650d2083b7668f = self.owner getvieworigin();
        var_b2ad24aedfc0eb0a = anglestoforward(self.owner getplayerangles());
        var_d449deb5b0fb63ba = var_53650d2083b7668f + var_b2ad24aedfc0eb0a * 50000;
        ignorelist = [0:self, 1:self.turret, 2:var_b8ee7ddd93755f86];
        var_369dc9ed4c0ec3f5 = namespace_2a184fc4902783dc::ray_trace(var_53650d2083b7668f, var_d449deb5b0fb63ba, ignorelist, namespace_2a184fc4902783dc::create_contents(1, 1, 0, 1, 0, 1, 0, 1, 1));
        var_ef24300e6dde92ba = var_369dc9ed4c0ec3f5["position"];
        if (isdefined(var_2511abb80c1de0c9)) {
            var_ef24300e6dde92ba = var_2511abb80c1de0c9;
        }
        /#
            var_4fff82339553a2c4 = getdvarint(@"hash_a34a2f5a7d33e3bb", 0);
            if (var_4fff82339553a2c4) {
                level thread namespace_f2ffc0540883e1ad::drawline(var_429aae2e6e20f85, var_85fa3cdcb19d2a9c, 10, (1, 1, 1));
                level thread namespace_f2ffc0540883e1ad::drawsphere(var_429aae2e6e20f85, 20, 10, (0, 1, 0));
                level thread namespace_f2ffc0540883e1ad::drawsphere(var_85fa3cdcb19d2a9c, 20, 10, (1, 1, 0));
                level thread namespace_f2ffc0540883e1ad::drawsphere(var_ef24300e6dde92ba, 20, 10, (1, 0, 0));
            }
        #/
        var_ab7356fd109d3e8d = ter_op(utility::iscp(), "chopper_gunner_proj_cp", "chopper_gunner_proj_mp");
        missile = _magicbullet(makeweapon(var_ab7356fd109d3e8d), var_429aae2e6e20f85, var_85fa3cdcb19d2a9c, var_a95a67a21665324a);
        missile thread choppergunner_watchmissilestate(var_ef24300e6dde92ba);
        missile thread choppergunner_watchexplosioninfluencepoint(self.owner, 2, 300, 300);
        self notify("fired_missile", missile);
        missile.streakinfo = self.streakinfo;
        self.missilesleft--;
        var_a95a67a21665324a setclientomnvar("ui_killstreak_weapon_1_ammo", self.missilesleft);
        if (self.missilesleft == 0) {
            /#
                if (istrue(thirdperson)) {
                    var_fa1b66c7e6853ee1 = 0;
                    self.missilesleft = getdvarint(@"hash_52bf6045193decbf", 8);
                    var_a95a67a21665324a setclientomnvar("<unknown string>", self.missilesleft);
                    continue;
                }
            #/
            if (istrue(self.infinite_chopper)) {
                self waittill("missiles_refilled");
            } else {
                break;
            }
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x450d
// Size: 0x6e
function choppergunner_refillmissiles() {
    self endon("missiles_refilled");
    var_5bd47981b826a0ad = getdvarfloat(@"hash_2f91da9928400cbd", 8);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_5bd47981b826a0ad);
    self.missilesleft = getdvarint(@"hash_52bf6045193decbf", 8);
    self.owner setclientomnvar("ui_killstreak_weapon_1_ammo", self.missilesleft);
    self notify("missiles_refilled");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4582
// Size: 0x16c
function choppergunner_watchturretfire(thirdperson) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    var_d8c1a9b6f71f67d1 = 500;
    if (utility::iscp()) {
        var_d8c1a9b6f71f67d1 = 100;
        self.owner.var_606e132ddfe3ccf9 = var_d8c1a9b6f71f67d1;
        self.owner setclientomnvar("ui_killstreak_weapon_2_ammo", var_d8c1a9b6f71f67d1);
    }
    while (1) {
        missile = self.turret waittill("missile_fire");
        self.owner earthquakeforplayer(0.15, 0.1, self.turret.origin, 150);
        missile.streakinfo = self.streakinfo;
        self.streakinfo.shots_fired++;
        missile thread choppergunner_watchexplosioninfluencepoint(self.owner, 0.5, 256, 200);
        if (utility::iscp()) {
            var_d8c1a9b6f71f67d1--;
            self.owner.var_606e132ddfe3ccf9 = var_d8c1a9b6f71f67d1;
            if (var_d8c1a9b6f71f67d1 < 0) {
                self.turret turretfiredisable();
                wait(3);
                var_d8c1a9b6f71f67d1 = 100;
                self notify("turret_reloaded");
                self.turret turretfireenable();
            }
            self.owner setclientomnvar("ui_killstreak_weapon_2_ammo", var_d8c1a9b6f71f67d1);
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46f5
// Size: 0x45
function choppergunner_firemissilefx(var_1600845f933938d5) {
    self endon("death");
    level endon("game_ended");
    self setscriptablepartstate("fire_missile_" + var_1600845f933938d5, "on", 0);
    wait(1);
    self setscriptablepartstate("fire_missile_" + var_1600845f933938d5, "off", 0);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4741
// Size: 0x2c
function choppergunner_watchmissilestate(var_a0d0da7c35d995c8) {
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.05);
    if (isdefined(self)) {
        self missile_settargetpos(var_a0d0da7c35d995c8);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4774
// Size: 0x73
function choppergunner_watchlifetime(thirdperson) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    lifetime = self.lifetime;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(lifetime);
    playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_leave", 1, undefined, "pilot");
    thread choppergunner_leave(thirdperson);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ee
// Size: 0x76
function choppergunner_watchgameendleave(thirdperson) {
    self.owner endon("disconnect");
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("crashing");
    level waittill_any_2("start_game_ended", "game_ended");
    self.recordedgameendstats = 1;
    self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    thread choppergunner_leave(thirdperson);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486b
// Size: 0x153
function function_c7c48aed42b53d29(thirdperson) {
    self endon("death");
    self endon("crashing");
    self endon("leaving");
    self.owner endon("disconnect");
    level endon("game_ended");
    if (istrue(thirdperson)) {
        return;
    }
    var_6bae51de5d6b7b00 = 65;
    lerptime = 0.25;
    currentfov = var_6bae51de5d6b7b00;
    var_d54d564805c29b7b = 30;
    var_91c95e88f4de9ed7 = 0;
    var_7b2d7a7927e3e11e = 0;
    self.owner setclientomnvar("ui_killstreak_zoom_fov", currentfov);
    while (1) {
        if (self.owner adsbuttonpressed()) {
            var_91c95e88f4de9ed7 = var_91c95e88f4de9ed7 + 0.05;
            if (var_91c95e88f4de9ed7 >= lerptime) {
                var_91c95e88f4de9ed7 = lerptime;
            }
            if (!istrue(var_7b2d7a7927e3e11e)) {
                self.owner function_58707ddfdd9744fa("killstreak_ads_shutter");
                var_7b2d7a7927e3e11e = 1;
            }
        } else if (var_91c95e88f4de9ed7 > 0) {
            var_91c95e88f4de9ed7 = var_91c95e88f4de9ed7 - 0.05;
            if (var_91c95e88f4de9ed7 <= 0) {
                var_91c95e88f4de9ed7 = 0;
            }
            if (istrue(var_7b2d7a7927e3e11e)) {
                var_7b2d7a7927e3e11e = 0;
            }
        }
        if (var_91c95e88f4de9ed7 >= 0) {
            var_f29615bfb202e7d4 = var_91c95e88f4de9ed7 / lerptime * 100;
            currentfov = int(var_f29615bfb202e7d4 * (var_d54d564805c29b7b - var_6bae51de5d6b7b00) / 100 + var_6bae51de5d6b7b00);
        }
        self.owner setclientomnvar("ui_killstreak_zoom_fov", currentfov);
        wait(0.05);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c5
// Size: 0x62
function choppergunner_watchownerexitaction(var_304d14a0f176d5c3) {
    self endon("death");
    self endon("explode");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    self.owner waittill(var_304d14a0f176d5c3);
    if (var_304d14a0f176d5c3 == "player_fatal_death") {
        thread choppergunner_leave();
    } else {
        thread choppergunner_returnplayer(0, 0);
        thread choppergunner_explode();
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a2e
// Size: 0x1e6
function choppergunner_watchtargets() {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_engage", undefined, undefined, "pilot");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    while (1) {
        var_c26b9f481753e189 = [];
        foreach (player in level.players) {
            if (self.owner worldpointinreticle_circle(player.origin, 80, 100)) {
                if (level.teambased && player.team == self.team) {
                    continue;
                }
                if (player == self.owner) {
                    continue;
                }
                ignorelist = [0:self, 1:self.turret];
                if (!streakcanseetarget(self.turret gettagorigin("tag_flash"), player gettagorigin("j_head"), ignorelist)) {
                    continue;
                }
                if (issharedfuncdefined("perk", "hasPerk")) {
                    if (player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
                        continue;
                    }
                }
                var_c26b9f481753e189 = choppergunner_getnearbytargets(player);
                break;
            }
            wait(0.05);
        }
        if (var_c26b9f481753e189.size > 0 && var_c26b9f481753e189.size < 2) {
            playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_attack_single", undefined, undefined, "pilot");
        } else if (var_c26b9f481753e189.size >= 2) {
            playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_attack_multi", undefined, undefined, "pilot");
        }
        wait(randomintrange(5, 15));
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c1b
// Size: 0xcc
function choppergunner_getnearbytargets(var_50ed806f04c63d) {
    var_ef269077a28646eb = utility::playersincylinder(var_50ed806f04c63d.origin, 300);
    var_bc19a29ed084d79c = [];
    foreach (player in var_ef269077a28646eb) {
        if (level.teambased && player.team != var_50ed806f04c63d.team) {
            continue;
        }
        if (!level.teambased && player == self.owner) {
            continue;
        }
        var_bc19a29ed084d79c[var_bc19a29ed084d79c.size] = player;
    }
    return var_bc19a29ed084d79c;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cef
// Size: 0x140
function function_f6a755e207671291() {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    level endon("game_ended");
    self.owner endon("disconnect");
    self.var_d743ac65ecce766 = 0;
    self.var_5fb9ddd4aec3a659 = undefined;
    childthread choppergunner_watchkills();
    childthread function_708f19cf8e854691();
    var_ab7356fd109d3e8d = ter_op(utility::iscp(), "chopper_gunner_proj_cp", "chopper_gunner_proj_mp");
    while (1) {
        if (self.var_d743ac65ecce766 != 0) {
            wait(2);
            if (self.var_d743ac65ecce766 >= 1 && self.var_5fb9ddd4aec3a659 == var_ab7356fd109d3e8d) {
                playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_killconf_missile", undefined, undefined, "pilot");
            } else if (self.var_d743ac65ecce766 == 1) {
                playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_killconf_single", undefined, undefined, "pilot");
            } else if (self.var_d743ac65ecce766 >= 2) {
                playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_killconf_multi", undefined, undefined, "pilot");
            }
            self.var_d743ac65ecce766 = 0;
            self.var_5fb9ddd4aec3a659 = undefined;
            wait(1);
        }
        waitframe();
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e36
// Size: 0x4a
function choppergunner_watchkills() {
    while (1) {
        weaponname = var_e4c6376813e5a077 = self.owner waittill("update_rapid_kill_buffered");
        if (isdefined(var_e4c6376813e5a077)) {
            self.var_d743ac65ecce766++;
            self.var_5fb9ddd4aec3a659 = weaponname;
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e87
// Size: 0x4a
function function_708f19cf8e854691() {
    while (1) {
        weaponname = var_e4c6376813e5a077 = self.owner waittill("update_rapid_agent_kill_buffered");
        if (isdefined(var_e4c6376813e5a077)) {
            self.var_d743ac65ecce766++;
            self.var_5fb9ddd4aec3a659 = weaponname;
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed8
// Size: 0x24a
function choppergunner_leave(thirdperson) {
    self endon("death");
    self endon("crashing");
    thread choppergunner_returnplayer(0, thirdperson);
    self clearlookatent();
    self setmaxpitchroll(0, 0);
    self notify("leaving");
    self.isleaving = 1;
    var_df6c75d1a1e4ff18 = 3;
    var_e757789796c82383 = (0, 0, 1000);
    var_bb0e78a73b33d580 = self.origin + var_e757789796c82383;
    var_bc09a6e223b96348 = undefined;
    var_690e4620fe5fa98f = undefined;
    var_ec0c66c48e6f8304 = undefined;
    while (var_df6c75d1a1e4ff18 > 0) {
        flightpath = function_999fe3838d6b6f8c(var_bb0e78a73b33d580, self.angles, 400, 15000);
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
        thread choppergunner_explode();
    } else {
        var_1602fab5eab68601 = 100;
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
        self notify("gone");
        thread choppergunner_delete(0);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5129
// Size: 0x62
function choppergunner_getpathend() {
    pathrandomness = 150;
    halfdistance = 15000;
    yaw = self.angles[1];
    direction = (0, yaw, 0);
    endpoint = self.origin + anglestoforward(direction) * halfdistance;
    return endpoint;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5193
// Size: 0x3a
function function_623713927a33cb76(data) {
    damage = data.damage;
    attacker = data.attacker;
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d5
// Size: 0x19a
function function_ade353d9afc0d191(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    if (isdefined(self.owner) && self.owner isusingchoppergunner()) {
        var_bb22d61320ffe92d = "light";
        if (isexplosivedamagemod(type)) {
            if (ceil(damage / self.maxhealth) >= 0.33) {
                self.owner earthquakeforplayer(0.25, 0.2, self.turret.origin, 150);
                self.owner playrumbleonentity("damage_heavy");
                var_bb22d61320ffe92d = "heavy";
            } else {
                self.owner earthquakeforplayer(0.15, 0.15, self.turret.origin, 150);
                self.owner playrumbleonentity("damage_light");
            }
        }
        self.owner function_c144de677d9b9175(self.currentvisionset, var_bb22d61320ffe92d);
    }
    self.currenthealth = self.currenthealth - damage;
    killstreak_updateDamageState(self.currenthealth);
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5377
// Size: 0x3b
function function_30e33dc1b5a3d096() {
    self setscriptablepartstate("body_damage_light", "on");
    self.owner playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_light_damage", undefined, undefined, "pilot");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53b9
// Size: 0x3b
function function_9a86620d2c95b213() {
    self setscriptablepartstate("body_damage_medium", "on");
    self.owner playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_med_damage", undefined, undefined, "pilot");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53fb
// Size: 0x3b
function function_5df4204110a49163() {
    self setscriptablepartstate("body_damage_heavy", "on");
    self.owner playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_heavy_damage", undefined, undefined, "pilot");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543d
// Size: 0x40
function choppergunner_handledeathdamage(data) {
    self.killedbyweapon = data.objweapon;
    thread function_2b17aa319c193951(data.attacker, data.objweapon);
    return 1;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5485
// Size: 0xd0
function function_2b17aa319c193951(attacker, killedbyweapon) {
    self endon("explode");
    thirdperson = 0;
    /#
        thirdperson = getdvarint(@"hash_5053673c4770b74", 0);
    #/
    var_1d4408c68f2118a = isdefined(attacker) && isplayer(attacker) && istrue(attacker.isjuggernaut);
    var_31777acbf2b0901 = 1;
    if (isdefined(self.owner) && self.owner isusingchoppergunner()) {
        thread choppergunner_returnplayer(var_31777acbf2b0901, thirdperson);
    }
    if (istrue(var_31777acbf2b0901)) {
        function_546c923a292bab24(self.var_2b4bbc4c0ae46fd5);
        choppergunner_crash(150, killedbyweapon);
        function_38101db6ed950f17(self.var_2b4bbc4c0ae46fd5);
    }
    thread choppergunner_explode();
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x555c
// Size: 0x186
function choppergunner_crash(speed, var_11b83e21f9c87ff5, var_c5adb13be635c61a) {
    self endon("explode");
    self.iscrashing = 1;
    self clearlookatent();
    self notify("crashing");
    self setscriptablepartstate("engine_explosion", "on", 0);
    self setmaxpitchroll(10, 50);
    self vehicle_setspeed(speed, 20, 20);
    self setneargoalnotifydist(100);
    var_d3197eae18c8cc43 = "missile_damage";
    if (isbulletweapon(var_11b83e21f9c87ff5)) {
        var_d3197eae18c8cc43 = "bullet_damage";
    }
    self setscriptablepartstate("glass", var_d3197eae18c8cc43, 0);
    var_6847739e80fb4e81 = choppergunner_findcrashposition(1250);
    if (!isdefined(var_6847739e80fb4e81)) {
        return;
    }
    /#
        if (istrue(var_c5adb13be635c61a)) {
            sphere(var_6847739e80fb4e81, 100, (0, 1, 0), 0, 500);
            line(self.origin, var_6847739e80fb4e81, (0, 1, 0), 1, 0, 500);
        }
    #/
    playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_crash", 1, undefined, "pilot");
    self setvehgoalpos(var_6847739e80fb4e81, 0);
    thread choppergunner_spinout(speed);
    var_ad75966be1548661 = "pilot_missile_crash";
    if (isbulletweapon(var_11b83e21f9c87ff5)) {
        var_ad75966be1548661 = "pilot_shot_crash";
    }
    thread namespace_bc4a4b9456315863::anim_single_solo(self.pilot, var_ad75966be1548661, "body_animate_jnt");
    waittill_any_timeout_2(5, "collision", var_ad75966be1548661);
    function_5a9772411551e56e("chopper_gunner", "pilot");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56e9
// Size: 0x4d
function choppergunner_spinout(speed) {
    self endon("death");
    self setyawspeed(speed, 50, 50, 0.5);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.6);
        wait(0.5);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573d
// Size: 0x1ae
function choppergunner_findcrashposition(var_6f8d59f68bd2b46c) {
    var_b2b5f5510c5d94e0 = self.origin;
    crashoffset = 1000;
    var_543f2191dde2b7f6 = undefined;
    var_6c5ceed9b00eb7d5 = anglestoforward(self.angles);
    var_5cc1d6dd55c49e3a = anglestoright(self.angles);
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 + var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_5cc1d6dd55c49e3a - var_6c5ceed9b00eb7d5) - (0, 0, crashoffset);
    var_4720f54e3eff6e8d = ray_trace(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (-1 * var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    return var_543f2191dde2b7f6;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58f3
// Size: 0x8f
function choppergunner_explode() {
    if (istrue(self.var_3621873dccbde4b5)) {
        return;
    }
    self notify("explode");
    self.var_3621873dccbde4b5 = 1;
    if (isdefined(self.owner)) {
        self radiusdamage(self.origin, 1000, 200, 200, self.owner, "MOD_EXPLOSIVE", "chopper_gunner_turret_ballistics_mp");
    }
    self setscriptablepartstate("explode", "on", 0);
    self setscriptablepartstate("explode_smoke", "on", 0);
    wait(0.35);
    thread choppergunner_delete(1);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5989
// Size: 0x181
function choppergunner_delete(var_4fac8b8ce36e09f1) {
    if (istrue(self.var_bf178f6894d17b96)) {
        return;
    }
    self.var_bf178f6894d17b96 = 1;
    if (issharedfuncdefined("player", "printGameAction")) {
        [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - chopperGunner", self.owner);
    }
    self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
    if (!istrue(self.recordedgameendstats)) {
        self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    }
    self stoploopsound();
    if (isdefined(self.pilot)) {
        self.pilot delete();
    }
    if (isdefined(self.firetarget)) {
        self.firetarget delete();
    }
    if (isdefined(self.turret)) {
        self.turret setentityowner(undefined);
        self.turret delete();
    }
    if (isdefined(self.mpod1)) {
        self.mpod1 setentityowner(undefined);
        self.mpod1 delete();
    }
    if (isdefined(self.mpod2)) {
        self.mpod2 setentityowner(undefined);
        self.mpod2 delete();
    }
    level.choppergunners = array_remove(level.choppergunners, self);
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b11
// Size: 0x287
function choppergunner_returnplayer(crashing, thirdperson) {
    choppergunner_updatetargetmarkergroups(0);
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](self.streakinfo);
    }
    var_a95a67a21665324a = self.owner;
    if (!isdefined(var_a95a67a21665324a)) {
        return;
    }
    streakinfo = self.streakinfo;
    thread function_70ff764379be5089(var_a95a67a21665324a, crashing, thirdperson, streakinfo);
    var_a95a67a21665324a notify("chopperGunner_returning_player");
    var_a95a67a21665324a endon("disconnect");
    if (issharedfuncdefined("game", "disable_backpack_inventory")) {
        var_a95a67a21665324a [[ getsharedfunc("game", "disable_backpack_inventory") ]](0);
    }
    if (isdefined(level.heli_pilot_mesh)) {
        level.heli_pilot_mesh hide();
    }
    if (isdefined(self.playersfx)) {
        self.playersfx stoploopsound();
        self.playersfx delete();
    }
    choppergunner_lockedonremovedcallback();
    var_a95a67a21665324a clearclienttriggeraudiozone(0.5);
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    if (isdefined(var_a95a67a21665324a)) {
        if (!istrue(thirdperson)) {
            var_a95a67a21665324a val::set("chopperGunner", "allow_movement", 0);
            var_a95a67a21665324a clearcinematicmotionoverride();
            var_a95a67a21665324a setthermalvision(0);
            var_a95a67a21665324a _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
            var_a95a67a21665324a setclientomnvar("ui_apache_controls", 0);
            var_a95a67a21665324a remotecontrolvehicleoff();
            var_a95a67a21665324a remotecontrolturretoff(self.turret);
            var_a95a67a21665324a killstreak_setMainVision("");
            var_a95a67a21665324a _stopshellshock();
            if (istrue(crashing)) {
                wait(0.05);
                var_a95a67a21665324a setclientomnvar("ui_apache_screens_state", 2);
                var_a95a67a21665324a thread function_d13d2a81214fbfb8("80_instant_noscale");
                var_a95a67a21665324a cameralinkto(self.pilot, "tag_camera", 1, 1);
                var_a95a67a21665324a playlocalsound("mp_killstreak_apache_death_plr");
                if (!self.var_3621873dccbde4b5) {
                    self waittill("explode");
                }
                var_a95a67a21665324a killstreak_setMainVision("killstreak_static");
                var_a95a67a21665324a cameraunlink();
                wait(1);
                var_a95a67a21665324a killstreak_setMainVision("");
            }
            var_a95a67a21665324a val::function_588f2307a3040610("chopperGunnerUse");
            var_a95a67a21665324a val::function_c9d0b43701bdba00("chopperGunner");
            level thread restorekillstreakplayerangles(var_a95a67a21665324a);
            var_a95a67a21665324a function_8b676f496920e2ab();
            var_a95a67a21665324a setclientomnvar("ui_apache_screens_state", 0);
            var_a95a67a21665324a painvisionon();
            var_a95a67a21665324a killstreak_restorenvgstate();
            var_a95a67a21665324a.usingchoppergunner = undefined;
        }
    }
    var_a95a67a21665324a notify("chopperGunner_finished_crash_anim");
    streakinfo notify("killstreak_finished_with_deploy_weapon");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d9f
// Size: 0xc3
function function_70ff764379be5089(owner, crashing, thirdperson, streakinfo) {
    if (!istrue(crashing)) {
        return;
    }
    self endon("explode");
    owner endon("disconnect");
    streakinfo endon("killstreak_finished_with_deploy_weapon");
    level endon("game_ended");
    self waittill("death");
    /#
        iprintln("<unknown string>");
    #/
    if (!istrue(thirdperson)) {
        owner killstreak_setMainVision("killstreak_static");
        owner cameraunlink();
        owner killstreak_setMainVision("");
        level thread restorekillstreakplayerangles(owner);
        owner function_8b676f496920e2ab();
        owner setclientomnvar("ui_apache_screens_state", 0);
        owner painvisionon();
        owner killstreak_restorenvgstate();
        owner.usingchoppergunner = undefined;
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e69
// Size: 0x5f
function choppergunner_watchearlyexit(thirdperson) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    if (issharedfuncdefined("killstreak", "allowRideKillstreakPlayerExit")) {
        self thread [[ getsharedfunc("killstreak", "allowRideKillstreakPlayerExit") ]]("leaving");
    }
    self waittill("killstreakExit");
    thread choppergunner_leave(thirdperson);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ecf
// Size: 0x161
function choppergunner_handlemissiledetection(player, var_82fd3ee8fbace30e, missiletarget, var_5991f0e5da9f9bd5) {
    self endon("death");
    while (1) {
        if (!isdefined(missiletarget)) {
            break;
        }
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (curdist < 4000 && missiletarget.flaresreservecount > 0) {
            if (issharedfuncdefined("flares", "reduceReserves")) {
                [[ getsharedfunc("flares", "reduceReserves") ]](missiletarget);
            }
            if (issharedfuncdefined("flares", "playFx")) {
                missiletarget thread [[ getsharedfunc("flares", "playFx") ]](undefined, var_5991f0e5da9f9bd5);
            }
            missiletarget playkillstreakoperatordialog("chopper_gunner", "chopper_gunner" + "_flares", undefined, undefined, "pilot");
            newtarget = undefined;
            if (issharedfuncdefined("flares", "deploy")) {
                newtarget = missiletarget [[ getsharedfunc("flares", "deploy") ]]();
            }
            if (issharedfuncdefined("killstreak", "updateScrapAssistDataForceCredit")) {
                missiletarget [[ getsharedfunc("killstreak", "updateScrapAssistDataForceCredit") ]](player);
            }
            self missile_settargetent(newtarget);
            self notify("missile_pairedWithFlare");
            return;
        }
        waitframe();
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6037
// Size: 0xd
function isusingchoppergunner() {
    return isdefined(self.usingchoppergunner);
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x604c
// Size: 0x86
function choppergunner_watchexplosioninfluencepoint(owner, lifetime, radius, height) {
    owner endon("disconnect");
    level endon("game_ended");
    position = self waittill("explode");
    owner notify("gunner_turret_impact", position);
    if (issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](position, radius, height, owner.team, lifetime, owner, 1);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d9
// Size: 0x19
function function_20b002475b7af53b(data) {
    if (isdefined(self)) {
        choppergunner_handledeathdamage(data);
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f9
// Size: 0xa7
function function_c77d8b1c3a992f19(var_5e0676140eecdf2d) {
    var_cf01d7be22198c56 = spawnstruct();
    if (isdefined(var_5e0676140eecdf2d) && isent(var_5e0676140eecdf2d)) {
        probe = getent(var_5e0676140eecdf2d, "script_noteworthy");
    } else {
        probe = spawnstruct();
        /#
            self iprintln("<unknown string>");
        #/
    }
    var_cf01d7be22198c56.probe = probe;
    var_ad02eaa051593bff = [];
    var_ad02eaa051593bff["pos"] = probe.origin;
    var_ad02eaa051593bff["rot"] = probe.angles;
    var_cf01d7be22198c56.var_af2c99167339224 = var_ad02eaa051593bff;
    return var_cf01d7be22198c56;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61a8
// Size: 0x65
function function_546c923a292bab24(var_cf01d7be22198c56) {
    if (!isdefined(var_cf01d7be22198c56) || !isent(var_cf01d7be22198c56)) {
        return;
    }
    /#
        self.owner iprintln("<unknown string>");
    #/
    var_cf01d7be22198c56.probe linkto(self, "tag_origin", (109, 0, -62), (0, 0, 0));
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6214
// Size: 0x93
function function_38101db6ed950f17(var_cf01d7be22198c56) {
    if (!isdefined(var_cf01d7be22198c56) || !isent(var_cf01d7be22198c56)) {
        return;
    }
    /#
        self.owner iprintln("<unknown string>");
    #/
    var_cf01d7be22198c56.probe unlink();
    var_cf01d7be22198c56.probe.origin = var_cf01d7be22198c56.var_af2c99167339224["pos"];
    var_cf01d7be22198c56.probe.angles = var_cf01d7be22198c56.var_af2c99167339224["rot"];
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62ae
// Size: 0x24
function function_2926a76719559d56() {
    turretweapon = "chopper_gunner_turret_ballistics_mp";
    if (utility::iscp()) {
        turretweapon = "chopper_gunner_turret_cp";
    }
    return turretweapon;
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62da
// Size: 0x2cd
function function_d33b650337c6008b(data) {
    self endon("death");
    self notify("chopperGunner_mini_emp_hit");
    self endon("chopperGunner_mini_emp_hit");
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "off");
    wait(0.1);
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "on");
    wait(0.05);
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "off");
    wait(0.25);
    self.owner _setvisibiilityomnvarforkillstreak(self.streakname, "on");
    if (!isdefined(self.var_e8d88b601e41fba5) && self.flaresreservecount > 0) {
        self.var_e8d88b601e41fba5 = gettime();
        if (issharedfuncdefined("flares", "reduceReserves")) {
            [[ getsharedfunc("flares", "reduceReserves") ]](self);
        }
        if (issharedfuncdefined("flares", "playFx")) {
            self thread [[ getsharedfunc("flares", "playFx") ]](undefined);
        }
        if (issharedfuncdefined("flares", "deploy")) {
            self [[ getsharedfunc("flares", "deploy") ]]();
        }
        if (issharedfuncdefined("killstreak", "updateScrapAssistDataForceCredit")) {
            self [[ getsharedfunc("killstreak", "updateScrapAssistDataForceCredit") ]](data.attacker);
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
    } else if (self.flaresreservecount > 0 && self.var_e8d88b601e41fba5 <= gettime() - 10000) {
        self.var_e8d88b601e41fba5 = gettime();
        if (issharedfuncdefined("flares", "reduceReserves")) {
            [[ getsharedfunc("flares", "reduceReserves") ]](self);
        }
        if (issharedfuncdefined("flares", "playFx")) {
            self thread [[ getsharedfunc("flares", "playFx") ]](undefined);
        }
        if (issharedfuncdefined("flares", "deploy")) {
            self [[ getsharedfunc("flares", "deploy") ]]();
        }
        if (issharedfuncdefined("killstreak", "updateScrapAssistDataForceCredit")) {
            self [[ getsharedfunc("killstreak", "updateScrapAssistDataForceCredit") ]](data.attacker);
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("emped_killstreak");
        }
    }
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65ae
// Size: 0x4a
function function_750ac5d7f30cbbf8(choppergunner) {
    /#
        choppergunner endon("addToActiveKillstreakList");
        choppergunner endon("<unknown string>");
        while (1) {
            vehiclespeed = choppergunner vehicle_getspeed();
            self iprintln("<unknown string>" + vehiclespeed);
            wait(0.5);
        }
    #/
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65ff
// Size: 0xa9
function function_dc4cb73de48ec3d6() {
    /#
        self endon("addToActiveKillstreakList");
        self.owner endon("<unknown string>");
        self.owner notifyonplayercommand("<unknown string>", "<unknown string>");
        state = "<unknown string>";
        while (1) {
            var_ae20b84817daf1 = getdvarint(@"hash_6dcbef72bd1fd758", 0);
            if (!istrue(var_ae20b84817daf1)) {
                waitframe();
                continue;
            }
            self.owner waittill("<unknown string>");
            if (state == "<unknown string>") {
                state = "<unknown string>";
            } else {
                state = "<unknown string>";
            }
            self setscriptablepartstate("<unknown string>", state, 0);
        }
    #/
}

// Namespace chopper_gunner/namespace_b1378d83bac67c85
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66af
// Size: 0x55
function function_8ad708731e47d367() {
    /#
        self endon("addToActiveKillstreakList");
        wait(10);
        data = namespace_169cd7a8fbc76ee5::packdamagedata(self.owner, self, 1, self.currentprimaryweapon, "<unknown string>", self);
        function_d33b650337c6008b(data);
        wait(10);
        function_d33b650337c6008b(data);
    #/
}

