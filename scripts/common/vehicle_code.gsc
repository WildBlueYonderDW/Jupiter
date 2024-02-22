// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\anim.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\vehicle_lights.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_bf4f6ba196da1351;

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1364
// Size: 0xbfb
function vehicle_initlevelvariables() {
    setdvarifuninitialized(@"hash_9403d7d31fc1d981", 1);
    setdvarifuninitialized(@"hash_fb816855f6554343", 0);
    setdvarifuninitialized(@"hash_80e8717f617516cf", 0);
    setdvarifuninitialized(@"hash_9cdcaf7a53494c37", 0);
    setdvarifuninitialized(@"hash_cfd8073837710cef", 0);
    setdvarifuninitialized(@"hash_a56728daa842e5e", 0);
    setdvarifuninitialized(@"hash_f0f3e5a83f3f2843", 1);
    setdvarifuninitialized(@"hash_7598045ee90e851d", 1);
    setdvarifuninitialized(@"hash_4bd69b09131419ca", 1);
    setdvarifuninitialized(@"hash_3a76c9f686d280fc", 0);
    if (utility::issp()) {
        setsaveddvar(@"hash_a9386838a077a91e", 1);
        setsaveddvar(@"hash_b2b4f1e1cf04437f", 1);
    }
    if (!isdefined(level.vehicle)) {
        level.vehicle = spawnstruct();
    }
    level.vehicle.templates = spawnstruct();
    level.vehicle.helicopter_crash_locations = getentarray("helicopter_crash_location", "targetname");
    level.vehicle.helicopter_crash_locations = array_combine(level.vehicle.helicopter_crash_locations, getstructarray_delete("helicopter_crash_location", "targetname"));
    level.vehicle.templates.team = [];
    level.vehicle.templates.deathmodel = [];
    level.vehicle.templates.death_thread = [];
    level.vehicle.templates.driveidle = [];
    level.vehicle.templates.driveidle_r = [];
    level.vehicle.templates.rumble = [];
    level.vehicle.templates.mainturret = [];
    level.vehicle.templates.mgturret = [];
    level.vehicle.templates.death_earthquake = [];
    level.vehicle.templates.surface_effects = [];
    level.vehicle.templates.unloadgroups = [];
    level.vehicle.templates.aianims = [];
    level.vehicle.templates.landanims = [];
    level.vehicle.templates.exhaust_fx = [];
    level.vehicle.templates.engine_fx = [];
    level.vehicle.templates.shoot_shock = [];
    level.vehicle.templates.hide_part_list = [];
    level.vehicle.templates.destructible_model = [];
    level.vehicle.templates.grenade_shield = [];
    level.vehicle.templates.var_7412ca7553957e74 = [];
    level.vehicle.templates.bullet_shield = [];
    level.vehicle.templates.var_4356b75e0eddf77d = [];
    level.vehicle.templates.death_jolt = [];
    level.vehicle.templates.death_badplace = [];
    level.vehicle.templates.idle_anim = [];
    level.vehicle.templates.helicopter_list = [];
    level.vehicle.templates.var_91f3271e71001190 = [];
    level.vehicle.templates.airplane_list = [];
    level.vehicle.templates.var_27719d9c0bc9708a = [];
    level.vehicle.templates.single_tread_list = [];
    level.vehicle.templates.deathanimations = [];
    level.vehicle.templates.vehicle_death_fx = [];
    level.vehicle.templates.vehicle_rocket_death_fx = [];
    level.vehicle.templates.death_radiusdamage = [];
    level.vehicle.templates.model = [];
    level.vehicle.templates.var_fb41d1ca75009bf0 = [];
    level.vehicle.templates.var_893da51cf12b2c8b = [];
    level.vehicle.templates.var_95742f5c97192175 = [];
    level.vehicle.templates.hudindex = [];
    level.vehicle.templates.var_a72227c6bfa8a146 = [];
    level.vehicle.var_aab9695c92b0ed96 = [];
    if (utility::issp()) {
        level.vehicle.var_aab9695c92b0ed96["tag_mirror_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_mirror_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_front_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_front_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_front_left_2"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_front_right_2"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_back_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_back_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_back_left_2"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_back_right_2"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_top_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_top_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_front_middle"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_front_top"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_light_back_top"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_antenna"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_hubcap_front_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_hubcap_front_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_hubcap_back_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_hubcap_back_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_windshield_front"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_windshield_front_pristine"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_windshield_front_web"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_windshield_back"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_window_front_left"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_window_front_right"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_window_back_left"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_window_back_right"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_window_back_left_corner"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_window_back_right_corner"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_window_sunroof"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_door_front_left"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_door_front_right"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_door_back_left"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_door_back_right"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_hood"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_trunk"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_bumper_front"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_bumper_back"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_bumper_front_damaged"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_bumper_back_damaged"] = 5;
        level.vehicle.var_aab9695c92b0ed96["tag_wheel_center_front_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_wheel_center_front_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_wheel_center_middle_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_wheel_center_middle_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_wheel_center_back_left"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_wheel_center_back_right"] = 3;
        level.vehicle.var_aab9695c92b0ed96["tag_wheel_spare"] = 3;
        foreach (name, _ in level.vehicle.var_aab9695c92b0ed96) {
            namespace_dbbb37eb352edf96::function_9039b650ffb212c8(name);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f66
// Size: 0x3c
function private function_957ae339752b129e(amount) {
    if (amount < 0) {
        /#
            print("tag_window_front_right" + amount);
        #/
        return;
    }
    self.health = self.health + int(amount);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fa9
// Size: 0xc3
function private isexplosivedamage(mod, objweapon) {
    if (isdefined(objweapon) && isdefined(objweapon.basename)) {
        switch (objweapon.basename) {
        case #"hash_734c65fd451709ec":
        case #"hash_b347bbcd9d4a348d":
            if (getdvarint(@"hash_cfd8073837710cef")) {
                iprintln("skipping explosive damage for weapon: " + objweapon.basename);
            }
            return 0;
            break;
        }
    }
    if (mod == "MOD_GRENADE_SPLASH" || mod == "MOD_EXPLOSIVE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_GRENADE" || mod == "MOD_PROJECTILE" || mod == "MOD_EXPLOSIVE") {
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2074
// Size: 0x32
function private function_2cffaf4e15c4ab48(weaponname) {
    if (!isdefined(self.var_11bd2d454480b300)) {
        return 0;
    }
    if (array_contains(self.var_11bd2d454480b300, weaponname)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ae
// Size: 0xfe
function _getvehiclespawnerarray(value, key) {
    /#
        if (isdefined(value) || isdefined(key)) {
            /#
                assertex(isdefined(value) && isdefined(key), "newanim");
            #/
        }
    #/
    newarray = [];
    if (isdefined(value) && isdefined(key)) {
        var_28af6061170e7cc7 = 1;
        vehicles = getentarray(value, key);
    } else {
        var_28af6061170e7cc7 = 0;
        vehicles = getentarray("script_vehicle", "code_classname");
    }
    foreach (vehicle in vehicles) {
        if (var_28af6061170e7cc7 && vehicle.code_classname != "script_vehicle") {
            continue;
        }
        if (isspawner(vehicle)) {
            newarray[newarray.size] = vehicle;
        }
    }
    return newarray;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b4
// Size: 0x5a
function _kill_fx_play_direction(var_2b784f12869da5f8, lerp) {
    if (isdefined(var_2b784f12869da5f8) && isdefined(lerp)) {
        velocity = self getentityvelocity();
        velocity = vectornormalize(velocity);
        var_2b784f12869da5f8 = vectornormalize(var_2b784f12869da5f8);
        dir = vectorlerp(velocity, var_2b784f12869da5f8, lerp);
        return dir;
    } else {
        return undefined;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2215
// Size: 0x2b
function _mainturretoff() {
    self.script_turretmain = 0;
    if (!isdefined(self.mainturret)) {
        return;
    }
    _turretoffshared(self.mainturret);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2247
// Size: 0x2c
function _mainturreton() {
    self.script_turretmain = 1;
    if (!isdefined(self.mainturret)) {
        return;
    }
    _turretonshared(self.mainturret);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227a
// Size: 0xb7
function _mgoff() {
    self.script_turretmg = 0;
    if (ishelicopter() && hashelicopterturret()) {
        if (isdefined(level.chopperturretfunc)) {
            /#
                assertex(isdefined(level.chopperturretofffunc), "hasHelicopterTurret with no level.ChopperTurretOnFunc, need scriptssphelicopter_globals::init_helicopters();");
            #/
            self thread [[ level.chopperturretofffunc ]]();
            return;
        }
    }
    if (!isdefined(self.mgturret)) {
        return;
    }
    foreach (turret in self.mgturret) {
        _turretoffshared(turret);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2338
// Size: 0xb2
function _mgon() {
    self.script_turretmg = 1;
    if (ishelicopter() && hashelicopterturret()) {
        /#
            assertex(isdefined(level.chopperturretonfunc), "hasHelicopterTurret with no level.ChopperTurretOnFunc, need scriptssphelicopter_globals::init_helicopters();");
        #/
        self thread [[ level.chopperturretonfunc ]]();
        return;
    }
    if (!isdefined(self.mgturret)) {
        return;
    }
    foreach (turret in self.mgturret) {
        turret show();
        _turretonshared(turret);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f1
// Size: 0x34
function _turretoffshared(turret) {
    if (isdefined(turret.script_fireondrones)) {
        turret.script_fireondrones = 0;
    }
    turret setmode("manual");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242c
// Size: 0x75
function _turretonshared(turret) {
    if (isdefined(turret.script_fireondrones)) {
        turret.script_fireondrones = 1;
    }
    if (isdefined(turret.defaultonmode)) {
        if (turret.defaultonmode != "sentry") {
            turret setmode(turret.defaultonmode);
        }
    } else {
        turret setmode("auto_nonai");
    }
    set_turret_team(turret);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a8
// Size: 0x49
function _setvehgoalpos_wrap(origin, bstop) {
    if (self.health <= 0) {
        return;
    }
    if (isdefined(self.originheightoffset)) {
        origin = origin + (0, 0, self.originheightoffset);
    }
    self setvehgoalpos(origin, bstop);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f8
// Size: 0xb3
function _vehicle_landvehicle(var_44760e645d6be134, node) {
    self endon("death");
    self notify("newpath");
    if (!isdefined(var_44760e645d6be134)) {
        var_44760e645d6be134 = 2;
    }
    self setneargoalnotifydist(var_44760e645d6be134);
    self sethoverparams(0, 0, 0);
    self cleargoalyaw();
    self settargetyaw(flat_angle(self.angles)[1]);
    if (isdefined(self.unload_land_offset)) {
        _setvehgoalpos_wrap(utility::groundpos(self.origin) + (0, 0, self.unload_land_offset), 1);
    } else {
        _setvehgoalpos_wrap(utility::groundpos(self.origin), 1);
    }
    self waittill("goal");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b2
// Size: 0x4d0
function _vehicle_unload(who) {
    self endon("death");
    if (isdefined(who)) {
        self.unload_group = who;
    }
    if (isdefined(self.var_e477b04ae71253d8)) {
        result = self [[ self.var_e477b04ae71253d8 ]]();
        if (isdefined(result)) {
            return result;
        }
    }
    if (isdefined(level.func["vehicle_unload"])) {
        result = self [[ level.func["vehicle_unload"] ]]();
        if (isdefined(result)) {
            return result;
        }
    }
    if (ent_flag_exist("no_riders_until_unload")) {
        ent_flag_set("no_riders_until_unload");
        ai = spawn_unload_group(self.unload_group);
        foreach (a in ai) {
            spawn_failed(a);
        }
        waittillframeend();
    }
    self notify("unloading");
    ai = [];
    unloadgroups = level.vehicle.templates.unloadgroups[get_vehicle_classname()];
    if (isdefined(unloadgroups)) {
        var_ce621a37edde9cb9 = get_unload_group();
        if (istrue(self.vehiclesetuprope)) {
            for (i = 0; i < level.vehicle.templates.aianims[get_vehicle_classname()].size; i++) {
                var_c458edac96d58b16 = level.vehicle.templates.aianims[get_vehicle_classname()][i];
                if (istrue(var_c458edac96d58b16.setuprope)) {
                    var_43b3ef9d0a31ebab = 0;
                    foreach (rider in self.riders) {
                        if (isdefined(rider.vehicle_position) && isdefined(var_ce621a37edde9cb9[rider.vehicle_position]) && rider.vehicle_position != i) {
                            var_7f54a8f82a6ee298 = anim_pos(self, rider.vehicle_position);
                            if (var_7f54a8f82a6ee298.fastroperig == var_c458edac96d58b16.fastroperig) {
                                var_43b3ef9d0a31ebab = 1;
                                break;
                            }
                        }
                    }
                    if (var_43b3ef9d0a31ebab) {
                        foreach (rider in self.riders) {
                            if (isalive(rider) && isdefined(rider.vehicle_position) && rider.vehicle_position == i) {
                                namespace_4ff41449ab14a3a0::guy_setup_rope(rider, var_c458edac96d58b16);
                                break;
                            }
                        }
                    }
                }
            }
        }
        var_3f5e5ee34d09efdd = 0;
        foreach (rider in self.riders) {
            if (isalive(rider) && isdefined(rider.vehicle_position) && isdefined(var_ce621a37edde9cb9[rider.vehicle_position])) {
                if (isdefined(level.vehicle.aianimcheck["unload"]) && ![[ level.vehicle.aianimcheck["unload"] ]](rider, rider.vehicle_position)) {
                    continue;
                }
                var_c458edac96d58b16 = anim_pos(self, rider.vehicle_position);
                if (isdefined(var_c458edac96d58b16) && istrue(var_c458edac96d58b16.do_not_unload)) {
                    continue;
                }
                if (isdefined(level.vehicle.aianimthread["unload"])) {
                    if (!istrue(var_c458edac96d58b16.setuprope)) {
                        rider notify("newanim");
                        thread [[ level.vehicle.aianimthread["unload"] ]](rider, rider.vehicle_position);
                        var_3f5e5ee34d09efdd = 1;
                        rider notify("unload");
                        rider.vehicle = undefined;
                        if (isdefined(var_c458edac96d58b16.mgturret)) {
                            rider namespace_6205bc7c5e394598::stop_use_turret();
                        }
                        ai = array_add(ai, rider);
                    }
                }
            }
        }
        if (!var_3f5e5ee34d09efdd) {
            namespace_3c37cb17ade254d::ent_flag_set("unloaded");
        }
    }
    return ai;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8a
// Size: 0x4e5
function vehicle_spawn_internal(vspawner, var_a7333fc35fb3cc3a) {
    if (isdefined(vspawner.script_delay_spawn)) {
        vspawner endon("death");
        wait(vspawner.script_delay_spawn);
    }
    /#
        assertex(!isdefined(vspawner.vehicle_spawned_thisframe), "spawning two vehicles on one spawner on the same frame is not allowed");
    #/
    var_108ba48017b681f7 = 0;
    if (!issp()) {
        vehicle = vehicle_spawn_mp_internal(vspawner);
    } else {
        targetname = function_53c4c53197386572(vspawner.targetname, "");
        model = vspawner function_d0e99a4f0c29166e();
        if (isdefined(vspawner.var_ae43938336bbd264)) {
            array = strtok(vspawner.var_ae43938336bbd264, ",");
            color = array[randomintrange(0, array.size)];
            if (color != "base") {
                model = color + "::" + model;
            }
        }
        vehicletype = vspawner.vehicletype;
        if (getdvarint(@"hash_a56728daa842e5e") && isdefined(level.vehicle.templates.var_95742f5c97192175[vspawner.classname])) {
            vehicletype = level.vehicle.templates.var_95742f5c97192175[vspawner.classname];
        }
        vehicle = spawnvehicle(model, targetname, vehicletype, vspawner.origin, vspawner.angles);
        /#
            assert(isdefined(vehicle));
        #/
        vehicle.classname_mp = vspawner.classname;
        if (isdefined(vspawner.spawnflags) && vspawner.spawnflags & 16) {
            vehicle.var_a784428198c5658b = 1;
        }
        if (isdefined(vspawner.spawnflags) && vspawner.spawnflags & 4) {
            var_fb41d1ca75009bf0 = vehicle function_18657584b6bd786a(1);
            return var_fb41d1ca75009bf0;
        }
        if (isdefined(vspawner.spawnflags)) {
            if (vspawner.spawnflags & 1) {
                vehicle thread script_func("vehicle_usable");
            }
            if (vspawner.spawnflags & 8 || istrue(vehicle.var_a784428198c5658b)) {
                vehicle function_65aa053c077c003a(1);
            }
        }
        if (isdefined(vspawner.target)) {
            vehicle.target = vspawner.target;
        }
        if (isdefined(vspawner.script_noteworthy)) {
            vehicle.script_noteworthy = vspawner.script_noteworthy;
        }
        if (isdefined(vspawner.script_parameters)) {
            vehicle.script_parameters = vspawner.script_parameters;
        }
        if (isdefined(vspawner.script_linkto)) {
            vehicle.script_linkto = vspawner.script_linkto;
        }
        if (isdefined(vspawner.script_godmode)) {
            vehicle.script_godmode = vspawner.script_godmode;
        }
        if (isdefined(vspawner.script_index)) {
            vehicle.script_index = vspawner.script_index;
        }
        if (isdefined(vspawner.script_friendname)) {
            vehicle.script_friendname = vspawner.script_friendname;
        }
        if (isdefined(vspawner.script_dontunloadonend)) {
            vehicle.script_dontunloadonend = vspawner.script_dontunloadonend;
        }
        if (isdefined(vspawner.script_deathflag)) {
            vehicle.script_deathflag = vspawner.script_deathflag;
        }
        if (isdefined(vspawner.script_team)) {
            vehicle.script_team = vspawner.script_team;
        }
        if (isdefined(vspawner.script_delete)) {
            vehicle.script_delete = vspawner.script_delete;
        }
        if (isdefined(vspawner.script_vehicle_selfremove)) {
            vehicle.script_vehicle_selfremove = vspawner.script_vehicle_selfremove;
        }
        if (isdefined(vspawner.script_vehicle_lights_on)) {
            vehicle.script_vehicle_lights_on = vspawner.script_vehicle_lights_on;
        }
    }
    /#
        assert(isdefined(vehicle));
    #/
    if (!isdefined(vspawner.spawned_count)) {
        vspawner.spawned_count = 0;
    }
    vspawner.spawned_count++;
    vspawner.last_spawned_vehicle = vehicle;
    vehicle.vehicle_spawner = vspawner;
    thread vehicle_init(vehicle, var_a7333fc35fb3cc3a);
    vspawner notify("spawned", vehicle);
    return vehicle;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f77
// Size: 0xf2
function vehicle_spawn_mp_internal(vspawner) {
    targetname = "temp_vehicle_targetname";
    if (isdefined(vspawner.targetname)) {
        targetname = vspawner.targetname;
    }
    if (!isdefined(vspawner.classname_mp)) {
        classname_mp = vspawner.classname;
    } else {
        classname_mp = vspawner.classname_mp;
    }
    vehicle = spawnvehicle(level.vehicle.templates.model[classname_mp], targetname, vspawner.vehicletype, vspawner.origin, vspawner.angles);
    vehicle.classname_mp = classname_mp;
    if (isdefined(vspawner.target)) {
        vehicle.target = vspawner.target;
    }
    return vehicle;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3071
// Size: 0x36
function vehicle_setuplevelvariables() {
    if (!add_init_script("vehicle_vars", &vehicle_setuplevelvariables)) {
        return;
    }
    init_struct_class();
    vehicle_initlevelvariables();
    /#
        function_83007a20bd9161ba();
    #/
    namespace_4ff41449ab14a3a0::setup_aianimthreads();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ae
// Size: 0x24a
function vehicle_precachescripts() {
    var_69c1e608887ef109 = [];
    level.needsprecaching = [];
    if (!isdefined(level.vehicleinitthread)) {
        level.vehicleinitthread = [];
    }
    vehicles = getentarray("script_vehicle", "code_classname");
    foreach (vehicle in vehicles) {
        if (vehicle.vehicletype == "empty" || vehicle.vehicletype == "empty_heli") {
            continue;
        }
        var_69c1e608887ef109[var_69c1e608887ef109.size] = vehicle;
        vehicle_precachesetup(vehicle.classname, vehicle);
    }
    if (level.needsprecaching.size > 0) {
        /#
            println("default");
            println("damageHeavy");
            println("default");
            tab = "<unknown string>";
            foreach (index, reasons in level.needsprecaching) {
                println(index);
                foreach (reason in reasons) {
                    println(tab + reason.pos);
                    foreach (r in reason.reasons) {
                        println(tab + tab + r);
                    }
                }
            }
            println("default");
        #/
        /#
            assertex(0, "missing vehicle scripts, see above console prints");
        #/
        level waittill("never");
    }
    return var_69c1e608887ef109;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3300
// Size: 0x16c
function vehicle_precachesetup(classname, vehicle) {
    vehicletype = function_40fd49171fad19d3(vehicle.vehicletype);
    if (isdefined(level.vehicleinitthread[vehicletype]) && isdefined(level.vehicleinitthread[vehicletype][vehicle.classname])) {
        return;
    }
    if (vehicle.classname == "script_vehicle") {
        return;
    }
    reasons = [];
    if (isdefined(level.needsprecaching[classname])) {
        reasons = level.needsprecaching[classname];
    }
    struct = spawnstruct();
    struct.pos = vehicle.origin;
    struct.reasons = [];
    if (!isdefined(level.vehicleinitthread[vehicletype])) {
        struct.reasons[struct.reasons.size] = "vehicletype "" + vehicle.vehicletype + "" is not setup properly. Maybe you just need to re-package? Or you have a Radiant copy/paste issue where you have the wrong vehicletype set?";
    } else if (!isdefined(level.vehicleinitthread[vehicletype][vehicle.classname])) {
        struct.reasons[struct.reasons.size] = "classname "" + vehicle.classname + ""  is not setup properly. Maybe you just need to re-package? Or the vehicle's Quaked is not setup properly";
    }
    reasons[reasons.size] = struct;
    level.needsprecaching[classname] = reasons;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3473
// Size: 0x2bd
function vehicle_setupspawners() {
    spawners = _getvehiclespawnerarray();
    foreach (spawner in spawners) {
        spawner thread vehicle_spawnerlogic();
        model = spawner function_d0e99a4f0c29166e();
        if (isdefined(spawner.var_ae43938336bbd264) && isdefined(model)) {
            array = strtok(spawner.var_ae43938336bbd264, ",");
            for (i = 0; i < array.size; i++) {
                if (array[i] == "base") {
                    precachemodel(model);
                } else {
                    precachemodel(array[i] + "::" + model);
                }
            }
            if (isdefined(level.vehicle.templates.var_fb41d1ca75009bf0[model])) {
                for (i = 0; i < array.size; i++) {
                    if (array[i] == "base") {
                        precachemodel(level.vehicle.templates.var_fb41d1ca75009bf0[model]);
                    } else if (istrue(level.vehicle.templates.var_893da51cf12b2c8b[model])) {
                        precachemodel(array[i] + "::" + level.vehicle.templates.var_fb41d1ca75009bf0[model]);
                    }
                }
            }
            if (isdefined(level.vehicle.templates.mgturret[spawner.classname])) {
                for (i = 0; i < array.size; i++) {
                    if (array[i] != "base") {
                        precachemodel(array[i] + "::" + level.vehicle.templates.mgturret[spawner.classname][0].model);
                    }
                }
            }
            if (isdefined(level.vehicle.templates.mainturret[spawner.classname])) {
                for (i = 0; i < array.size; i++) {
                    if (array[i] != "base") {
                        precachemodel(array[i] + "::" + level.vehicle.templates.mainturret[spawner.classname].model);
                    }
                }
            }
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3737
// Size: 0xb4
function vehicle_spawnerlogic() {
    self endon("entitydeleted");
    if (isdefined(self.script_deathflag)) {
        thread script_func("vehicle_spawner_deathflag");
    }
    self.count = 1;
    self.spawn_functions = [];
    while (1) {
        vehicle = self waittill("spawned");
        self.count--;
        if (!isdefined(vehicle)) {
            /#
                println("<unknown string>" + self.origin + "<unknown string>");
            #/
            continue;
        }
        vehicle.spawn_funcs = self.spawn_functions;
        vehicle.spawner = self;
        vehicle thread script_func("run_spawn_functions");
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37f2
// Size: 0x83
function vehicle_triggerkillspawner(trigger) {
    trigger waittill("trigger");
    foreach (vehiclespawner in vehicle_getspawnerarray()) {
        if (is_equal(vehiclespawner.script_kill_vehicle_spawner, trigger.script_kill_vehicle_spawner)) {
            vehiclespawner delete();
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x387c
// Size: 0x168
function vehicle_spawnaiarray(spawners, var_a7333fc35fb3cc3a) {
    var_d69b722478f810b7 = [];
    forcespawn = ent_flag_exist("no_riders_until_unload") && ent_flag("no_riders_until_unload");
    foreach (spawner in spawners) {
        spawner.count = 1;
        dronespawn = 0;
        if (isdefined(spawner.script_drone)) {
            dronespawn = 1;
            spawned = script_func("dronespawn_bodyonly", spawner);
            spawned script_func("drone_give_soul");
        } else if (isdefined(spawner.script_fakeactor) || isdefined(spawner.script_bodyonly)) {
            dronespawn = 1;
            spawned = script_func("bodyonlyspawn", spawner);
            spawned script_func("fakeactor_give_soul");
        } else {
            spawned = spawner script_func("spawn_ai", forcespawn);
        }
        if (!dronespawn && !isalive(spawned)) {
            continue;
        }
        var_d69b722478f810b7 = array_add(var_d69b722478f810b7, spawned);
        if (istrue(var_a7333fc35fb3cc3a)) {
            waitframe();
        }
    }
    riders = vehicle_removenonridersfromaiarray(var_d69b722478f810b7);
    return riders;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ec
// Size: 0x71
function vehicle_removenonridersfromaiarray(aiarray) {
    living_ai = [];
    foreach (ai in aiarray) {
        if (!ai_should_be_added(ai)) {
            continue;
        }
        living_ai[living_ai.size] = ai;
    }
    return living_ai;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a65
// Size: 0x41
function ai_should_be_added(ai) {
    if (isalive(ai)) {
        return 1;
    }
    if (!isdefined(ai)) {
        return 0;
    }
    if (!isdefined(ai.classname)) {
        return 0;
    }
    return ai.classname == "script_model";
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aae
// Size: 0x70
function spawn_riders(var_a7333fc35fb3cc3a) {
    if (ent_flag_exist("no_riders_until_unload") && !ent_flag("no_riders_until_unload")) {
        self notify("spawnedRiders");
        return [];
    }
    spawners = get_vehicle_riders_spawners();
    if (!spawners.size) {
        self notify("spawnedRiders");
        return [];
    }
    riders = spawn_group(spawners, var_a7333fc35fb3cc3a);
    self notify("spawnedRiders", riders);
    return riders;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b26
// Size: 0x88
function spawn_group(spawners, var_a7333fc35fb3cc3a) {
    ai = vehicle_spawnaiarray(spawners, var_a7333fc35fb3cc3a);
    ai = sort_by_startingpos(ai);
    foreach (guy in ai) {
        thread namespace_4ff41449ab14a3a0::guy_enter(guy);
    }
    thread set_loaded_when_full(ai);
    return ai;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb6
// Size: 0x23
function set_loaded_when_full(ai) {
    array_wait(ai, "loaded", 1);
    namespace_4ff41449ab14a3a0::vehicle_loaded_if_full(self);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be0
// Size: 0x24c
function spawn_unload_group(who) {
    if (!isdefined(who)) {
        return spawn_riders();
    }
    /#
        assertex(ent_flag_exist("no_riders_until_unload") && ent_flag("no_riders_until_unload"), "spawn_unload_group only used when no_riders_until_unload specified");
    #/
    spawners = get_vehicle_riders_spawners();
    if (!spawners.size) {
        return [];
    }
    var_731d2e30e2526fa4 = [];
    classname = get_vehicle_classname();
    if (isdefined(level.vehicle.templates.unloadgroups[classname]) && isdefined(level.vehicle.templates.unloadgroups[classname][who])) {
        group = level.vehicle.templates.unloadgroups[classname][who];
        for (i = 0; i < group.size; i++) {
            if (isdefined(spawners[i])) {
                spawners[i].script_startingposition = group[i];
            }
        }
        spawners = sort_by_startingpos(spawners);
        foreach (var_d13149368c074d36 in group) {
            foreach (spawner in spawners) {
                if (spawner.script_startingposition == var_d13149368c074d36) {
                    var_731d2e30e2526fa4[var_731d2e30e2526fa4.size] = spawner;
                }
            }
        }
        ai = vehicle_spawnaiarray(var_731d2e30e2526fa4);
        foreach (guy in ai) {
            thread namespace_4ff41449ab14a3a0::guy_enter(guy);
        }
        self notify("spawnedRiders", ai);
        return ai;
    } else {
        return spawn_riders();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e33
// Size: 0x8f
function sort_by_startingpos(guysarray) {
    firstarray = [];
    secondarray = [];
    foreach (guy in guysarray) {
        if (isdefined(guy.script_startingposition)) {
            firstarray[firstarray.size] = guy;
        } else {
            secondarray[secondarray.size] = guy;
        }
    }
    return array_combine(firstarray, secondarray);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eca
// Size: 0x5bb
function vehicle_init(vehicle, var_a7333fc35fb3cc3a) {
    if (getdvar(@"hash_742caa13b3c2e685") == "1") {
        return;
    }
    /#
        assert(vehicle.classname != "script_model");
    #/
    classname = vehicle get_vehicle_classname();
    if (isdefined(level.vehicle.templates.hide_part_list[classname])) {
        foreach (part in level.vehicle.templates.hide_part_list[classname]) {
            vehicle hidepart(part);
        }
    }
    vehicletype = function_40fd49171fad19d3(vehicle.vehicletype);
    if (vehicletype == "empty" || vehicletype == "empty_heli") {
        vehicle thread getonpath();
        return;
    }
    vehicle set_ai_number();
    vehicle vehicle_setstartinghealth();
    /#
        vehicle thread function_835a3820d2ab0b74();
    #/
    /#
        vehicle thread function_a1df9e8f97742aaf("<unknown string>" + vehicle.var_fa70e73bae432d6f, 0, (0, 1, 0));
    #/
    vehicle vehicle_setteam();
    if (!isdefined(level.vehicleinitthread[vehicletype][classname])) {
        /#
            println("<unknown string>" + classname);
        #/
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(vehicletype));
        #/
        /#
            println("<unknown string>" + vehicle.model);
        #/
    }
    vehicle thread [[ level.vehicleinitthread[vehicletype][classname] ]]();
    vehicle thread vehicle_playexhausteffect();
    vehicle thread vehicle_playengineeffect();
    if (!isdefined(vehicle.script_avoidplayer)) {
        vehicle.script_avoidplayer = 0;
    }
    if (isdefined(level.vehicle.draw_thermal)) {
        if (level.vehicle.draw_thermal) {
            vehicle thermaldrawenable();
        }
    }
    vehicle ent_flag_init("unloaded");
    vehicle ent_flag_init("loaded");
    vehicle ent_flag_init("landed");
    vehicle.riders = [];
    vehicle.unloadque = [];
    vehicle.unload_group = "default";
    vehicle.fastroperig = [];
    if (isdefined(level.vehicle.templates.attachedmodels) && isdefined(level.vehicle.templates.attachedmodels[classname])) {
        rigs = level.vehicle.templates.attachedmodels[classname];
        strings = getarraykeys(rigs);
        foreach (string in strings) {
            vehicle.fastroperig[string] = undefined;
            vehicle.fastroperiganimating[string] = 0;
        }
    }
    if (isdefined(vehicle.script_vehicle_lights_on)) {
        vehicle thread lights_on(vehicle.script_vehicle_lights_on);
    }
    if (isdefined(vehicle.script_godmode)) {
        vehicle.godmode = 1;
    }
    vehicle thread vehicle_damagelogic();
    vehicle thread namespace_4ff41449ab14a3a0::handle_attached_guys();
    if (isdefined(vehicle.script_friendname)) {
        vehicle setvehiclelookattext(vehicle.script_friendname, "");
    }
    vehicle thread vehicle_handleunloadevent();
    if (isdefined(vehicle.script_dontunloadonend)) {
        vehicle.dontunloadonend = 1;
    }
    vehicle thread vehicle_rumble();
    vehicle thread script_func("vehicle_treads");
    vehicle thread idle_animations();
    vehicle thread animate_drive_idle();
    if (isdefined(vehicle.script_deathflag)) {
        vehicle thread script_func("vehicle_deathflag");
    }
    vehicle thread mainturretinit();
    vehicle thread mginit();
    if (isdefined(level.vehicle.spawn_callback_thread)) {
        level thread [[ level.vehicle.spawn_callback_thread ]](vehicle);
    }
    if (isdefined(vehicle.script_team)) {
        vehicle setvehicleteam(vehicle.script_team);
    }
    vehicle function_8e397e15e0fbd01a();
    vehicle thread getonpath();
    if (isdefined(level.ignorewash)) {
        var_bb7075a368a061cf = level.ignorewash;
    } else {
        var_bb7075a368a061cf = 0;
    }
    if (utility::issp() && vehicle vehicle_hasdustkickup() && !var_bb7075a368a061cf) {
        vehicle thread aircraft_wash_thread();
    }
    if (vehicle vehicle_isphysveh()) {
        vehicle.veh_pathtype = "constrained";
        if (isdefined(vehicle.script_pathtype)) {
            vehicle.veh_pathtype = vehicle.script_pathtype;
        }
    }
    vehicle thread function_fd3542824f9c1bd2();
    vehicle thread function_c2b5282b537a56bc();
    vehicle spawn_riders(var_a7333fc35fb3cc3a);
    vehicle thread vehicle_deathlogic();
    if (istrue(var_a7333fc35fb3cc3a)) {
        vehicle notify("vehicle_init_complete");
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x448c
// Size: 0x36d
function function_9fccc375476161d6(vehicle) {
    /#
        assert(vehicle.classname != "script_model");
    #/
    classname = vehicle get_vehicle_classname();
    if (vehicle.spawndata.vehicletype == "empty" || vehicle.spawndata.vehicletype == "empty_heli") {
        vehicle thread getonpath();
        return;
    }
    vehicle set_ai_number();
    type = vehicle.spawndata.vehicletype;
    if (!isdefined(vehicle.script_avoidplayer)) {
        vehicle.script_avoidplayer = 0;
    }
    if (isdefined(level.vehicle.draw_thermal)) {
        if (level.vehicle.draw_thermal) {
            vehicle thermaldrawenable();
        }
    }
    vehicle ent_flag_init("unloaded");
    vehicle ent_flag_init("loaded");
    vehicle ent_flag_init("landed");
    vehicle.riders = [];
    vehicle.unloadque = [];
    vehicle.unload_group = "default";
    vehicle.fastroperig = [];
    if (isdefined(vehicle.attachedmodels) && isdefined(vehicle.attachedmodels[classname])) {
        rigs = vehicle.attachedmodels[classname];
        strings = getarraykeys(rigs);
        foreach (string in strings) {
            vehicle.fastroperig[string] = undefined;
            vehicle.fastroperiganimating[string] = 0;
        }
    }
    if (isdefined(vehicle.script_godmode)) {
        vehicle.godmode = 1;
    }
    vehicle thread namespace_4ff41449ab14a3a0::handle_attached_guys();
    if (isdefined(vehicle.script_friendname)) {
        vehicle setvehiclelookattext(vehicle.script_friendname, "");
    }
    vehicle thread vehicle_handleunloadevent();
    if (isdefined(vehicle.script_dontunloadonend)) {
        vehicle.dontunloadonend = 1;
    }
    vehicle thread script_func("vehicle_treads");
    if (isdefined(vehicle.script_deathflag)) {
        vehicle thread script_func("vehicle_deathflag");
    }
    if (isdefined(vehicle.script_team)) {
        vehicle setvehicleteam(vehicle.script_team);
    }
    vehicle function_8e397e15e0fbd01a();
    vehicle thread getonpath();
    if (isdefined(level.ignorewash)) {
        var_bb7075a368a061cf = level.ignorewash;
    } else {
        var_bb7075a368a061cf = 0;
    }
    if (utility::issp() && vehicle vehicle_hasdustkickup() && !var_bb7075a368a061cf) {
        vehicle thread aircraft_wash_thread();
    }
    if (vehicle vehicle_isphysveh()) {
        vehicle.veh_pathtype = "constrained";
        if (isdefined(vehicle.script_pathtype)) {
            vehicle.veh_pathtype = vehicle.script_pathtype;
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4800
// Size: 0x3a
function function_8e397e15e0fbd01a() {
    if (isdefined(level.var_620e3a366fb95fcf) && level.var_620e3a366fb95fcf) {
        return;
    }
    if (ishelicopter()) {
        thread vehicle_ai_avoidance_heli();
    } else {
        thread vehicle_ai_avoidance_logic();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4841
// Size: 0x86
function get_vehicle_classname() {
    vehiclebundle = self.var_ca4a4dd2f8495667;
    if (isdefined(vehiclebundle) && isdefined(vehiclebundle.ref) && isdefined(level.vehicle.templates.model[vehiclebundle.ref])) {
        return vehiclebundle.ref;
    }
    if (isdefined(self.classname_mp)) {
        return self.classname_mp;
    }
    return self.classname;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48cf
// Size: 0x44
function function_d0e99a4f0c29166e() {
    if (isdefined(self.var_5e6db70c016d2947)) {
        return self.var_5e6db70c016d2947;
    }
    model = self.var_b8957cd52d1efa30;
    if (model == "") {
        model = self.model;
    }
    return model;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x491b
// Size: 0x1f3
function vehicle_deathcleanup() {
    self notify("stop_looping_death_fx");
    self notify("death_finished");
    if (isdefined(self.navobstacleid)) {
        destroynavobstacle(self.navobstacleid);
    }
    destroynavrepulsor("veh_" + self getentitynumber());
    if (isdefined(self.rumbletrigger)) {
        self.rumbletrigger delete();
    }
    if (isdefined(self.mgturret)) {
        array_delete(self.mgturret);
    }
    if (isdefined(self.mainturret)) {
        self.mainturret delete();
    }
    if (istrue(level.vehicle.templates.has_main_turret[self.model])) {
        self clearturrettarget();
    }
    classname = get_vehicle_classname();
    if (isdefined(level.vehicle.templates.rumble[classname])) {
        self stoprumble(level.vehicle.templates.rumble[classname].rumble);
    }
    if (!issp()) {
        return;
    }
    self useanimtree(%vehicles);
    if (isdefined(level.vehicle.templates.driveidle[self.model])) {
        self clearanim(level.vehicle.templates.driveidle[self.model], 0);
    }
    if (isdefined(level.vehicle.templates.driveidle_r[self.model])) {
        self clearanim(level.vehicle.templates.driveidle_r[self.model], 0);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b15
// Size: 0x28a
function vehicle_deathlogic() {
    self endon("entitydeleted");
    self endon("nodeath_thread");
    thread helicopter_unloading_watcher();
    damagelocation = weaponobject = meansofdeath = attacker = self waittill("death");
    if (isdefined(self.var_a9f96e33f612c828)) {
        [[ self.var_a9f96e33f612c828 ]]();
    }
    var_35ab2dabe0210d0f = vehicle_deathcustomlogic(attacker, meansofdeath, weaponobject);
    if (isdefined(var_35ab2dabe0210d0f) && !var_35ab2dabe0210d0f) {
        return;
    }
    vehicle_playdeatheffects(attacker, meansofdeath, damagelocation);
    if (isdefined(self.riders)) {
        foreach (rider in self.riders) {
            if (!isdefined(rider)) {
                continue;
            }
            rider notify("EndVehicleMotionWarp");
            rider motionwarpcancel();
        }
    }
    if (isdefined(self.runningtovehicle)) {
        foreach (guy in self.runningtovehicle) {
            if (!isdefined(guy)) {
                continue;
            }
            guy notify("EndVehicleMotionWarp");
            guy motionwarpcancel();
        }
    }
    thread vehicle_killriders();
    if (function_b795d4c865a7bc7e()) {
        function_5d04267dd0768069();
    } else {
        vehicle_setdeathmodel();
        if (ishelicopter()) {
            vehicle_docrash(attacker, meansofdeath);
        }
    }
    if (vehicle_iscorpse()) {
        self notify("vehicle_deathComplete", self.origin);
        return;
    }
    vehicle_deathcleanup();
    function_37f33bfe6b63cb0a();
    self notify("vehicle_deathComplete", self.origin);
    if (isdefined(self.driver) && isplayer(self.driver)) {
        self.driver function_f3bb4f4911a1beb2("vehicle", "vehicle_driverShowViewModel");
    }
    if (function_b795d4c865a7bc7e() || self isscriptable()) {
        if (isdefined(self.var_48fb8bde665d628d)) {
            array_delete(self.var_48fb8bde665d628d);
        }
    } else if (istrue(self.vehicle_skipdeathmodel)) {
        if (utility::iscp()) {
            wait(0.1);
        }
    }
    self delete();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da6
// Size: 0xf6
function vehicle_deathcustomlogic(attacker, meansofdeath, weaponobject) {
    result = undefined;
    if (isdefined(self.custom_death_script)) {
        self thread [[ self.custom_death_script ]]();
    }
    if (isdefined(self.deathfunction)) {
        result = self [[ self.deathfunction ]](attacker, meansofdeath, weaponobject);
    }
    if (isdefined(level.vehicle.templates.death_thread[self.vehicletype])) {
        thread [[ level.vehicle.templates.death_thread[self.vehicletype] ]]();
    }
    registerkill = isdefined(attacker) && isdefined(meansofdeath) && isdefined(weaponobject);
    if (registerkill) {
        weaponname = getcompleteweaponname(weaponobject);
        attacker script_func("register_kill", self, meansofdeath, weaponname);
    }
    return result;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea4
// Size: 0xd
function vehicle_iscrashing() {
    return istrue(self.vehiclecrashing);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb9
// Size: 0x229
function vehicle_killriders() {
    if (istrue(self.pilot_killed) && !istrue(self.unloading)) {
        self waittill("flavor_done");
    }
    foreach (rider in self.riders) {
        if (!isalive(rider)) {
            continue;
        }
        if (!isdefined(rider.ridingvehicle)) {
            continue;
        }
        if (isdefined(rider.magic_bullet_shield)) {
            rider stop_magic_bullet_shield();
        }
        if (isdefined(rider._blackboard) && isdefined(rider._blackboard.chosenvehicleanimpos) && istrue(rider._blackboard.var_41c9f8c7891f19da)) {
            var_adf3664b12362142 = 100;
            velocity = self vehicle_getvelocity();
            rider.do_immediate_ragdoll = 1;
            rider.ragdollhitloc = "torso_lower";
            rider.ragdollimpactvector = (rider.origin - self.origin) * var_adf3664b12362142 + velocity;
        }
        if (utility::iscp() && isdefined(self.damage_data)) {
            if (isdefined(self.damage_data.attacker) && isplayer(self.damage_data.attacker)) {
                rider dodamage(rider.maxhealth, self.damage_data.attacker.origin, self.damage_data.attacker, self.damage_data.attacker, self.damage_data.meansofdeath, self.damage_data.objweapon);
            } else {
                rider kill();
            }
        } else {
            rider kill();
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50e9
// Size: 0x61
function vehicle_rider_death_detection(vehicle) {
    if (isdefined(self.vehicle_position) && self.vehicle_position != 0) {
        return;
    }
    self.health = 1;
    vehicle endon("death");
    self.baseaccuracy = 0.15;
    self waittill("death");
    vehicle notify("driver_died");
    vehicle vehicle_killriders();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5151
// Size: 0x7a
function vehicle_becomes_crashable() {
    self endon("death");
    self endon("enable_spline_path");
    waittillframeend();
    self.riders = array_removedead(self.riders);
    if (self.riders.size) {
        array_thread(self.riders, &vehicle_rider_death_detection, self);
        waittill_either("veh_collision", "driver_died");
        vehicle_killriders();
        wait(0.25);
    }
    self notify("script_crash_vehicle");
    self vehphys_crash();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d2
// Size: 0x165
function vehicle_landanims(var_1221d5694cf7822, var_1cfcc2359e6aaf52) {
    self endon("death");
    classname = get_vehicle_classname();
    if (!isdefined(level.vehicle.templates.landanims[classname])) {
        return;
    }
    landanims = level.vehicle.templates.landanims[classname];
    foreach (var_60eabcf32af43dfe in landanims) {
        self setanim(var_60eabcf32af43dfe.land, 1, 0.2, 1);
    }
    if (!var_1cfcc2359e6aaf52) {
        return;
    }
    if (isdefined(var_1221d5694cf7822)) {
        self waittill("unloaded");
    } else {
        self waittill("continuepath");
    }
    foreach (var_60eabcf32af43dfe in landanims) {
        self clearanim(var_60eabcf32af43dfe.land, 0);
        self setanim(var_60eabcf32af43dfe.takeoff, 1, 0.2, 1);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x533e
// Size: 0x1c
function vehicle_landvehicle(var_44760e645d6be134, node) {
    return _vehicle_landvehicle(var_44760e645d6be134, node);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5362
// Size: 0x59
function spawn_vehicle_and_attach_to_spline_path(var_776be63dcbc6b552) {
    vehicle = utility::spawn_vehicle();
    if (isdefined(var_776be63dcbc6b552)) {
        vehicle vehicle_setspeed(var_776be63dcbc6b552);
    }
    vehicle thread vehicle_becomes_crashable();
    vehicle endon("death");
    vehicle.dontunloadonend = 1;
    vehicle gopath(vehicle);
    vehicle leave_path_for_spline_path();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53c2
// Size: 0x51
function leave_path_for_spline_path() {
    self endon("script_crash_vehicle");
    waittill_either("enable_spline_path", "reached_end_node");
    node = get_my_spline_node(self.origin);
    if (isdefined(level.drive_spline_path_fun)) {
        node thread [[ level.drive_spline_path_fun ]](self);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x541a
// Size: 0x10c
function get_my_spline_node(org) {
    org = (org[0], org[1], 0);
    var_c6736586ae30f7ea = get_array_of_closest(org, level.snowmobile_path);
    var_1a99fe3a1869724d = [];
    for (i = 0; i < 3; i++) {
        var_1a99fe3a1869724d[i] = var_c6736586ae30f7ea[i];
    }
    foreach (path in level.snowmobile_path) {
        foreach (node in var_1a99fe3a1869724d) {
            if (node == path) {
                return node;
            }
        }
    }
    /#
        assertex(0, "Found no node to be on!");
    #/
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x552d
// Size: 0xd2
function waittill_stable(node) {
    offset = 12;
    var_35b0aecc155b4dbb = 400;
    timer = gettime() + var_35b0aecc155b4dbb;
    prevangles = self.angles;
    while (isdefined(self)) {
        if (abs(angleclamp180(self.angles[0])) > offset || abs(angleclamp180(self.angles[2])) > offset || abs(self.angles[1] - prevangles[1]) > 0.5) {
            timer = gettime() + var_35b0aecc155b4dbb;
        }
        if (gettime() > timer) {
            break;
        }
        prevangles = self.angles;
        wait(0.05);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5606
// Size: 0xb
function vehicle_kill_badplace_forever() {
    self notify("kill_badplace_forever");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5618
// Size: 0xd
function vehicle_isdestructible() {
    return isdefined(self.destructible_type);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x562d
// Size: 0xa0
function vehicle_playdeatheffects(attacker, meansofdeath, damagelocation) {
    if (vehicle_isdestructible()) {
        return;
    }
    level notify("vehicle_explosion", self.origin);
    self notify("explode", self.origin);
    thread vehicle_deathearthquake();
    thread vehicle_deathradiusdamage();
    if (self isscriptable() && !ishelicopter()) {
        utility::function_3677f2be30fdd581("visibility", "hide");
        delaycall(0.05, &delete);
    } else {
        thread vehicle_deathkilllights();
        thread vehicle_deathvfx(attacker, meansofdeath);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56d4
// Size: 0x144
function vehicle_deathvfx(attacker, meansofdeath) {
    var_9ef41e2c046ad906 = get_vehicle_classname();
    if (vehicle_shoulddorocketdeath(attacker, meansofdeath, var_9ef41e2c046ad906)) {
        self.vehicle_skipdeathmodel = 1;
        self.preferred_crash_style = 3;
        var_21cb1c59019b56f7 = level.vehicle.templates.vehicle_rocket_death_fx[var_9ef41e2c046ad906];
    } else if (istrue(self.pilot_killed)) {
        self.vehicle_skipdeathmodel = 1;
        self.preferred_crash_style = 4;
        var_21cb1c59019b56f7 = level.vehicle.templates.vehicle_rocket_death_fx[var_9ef41e2c046ad906];
    } else {
        var_21cb1c59019b56f7 = level.vehicle.templates.vehicle_death_fx[var_9ef41e2c046ad906];
    }
    if (isdefined(var_21cb1c59019b56f7)) {
        foreach (fxstruct in var_21cb1c59019b56f7) {
            thread kill_fx_thread(self.model, fxstruct, self.vehicletype, attacker);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x581f
// Size: 0x67
function vehicle_deathearthquake() {
    var_44ad722912e72154 = level.vehicle.templates.death_earthquake[get_vehicle_classname()];
    if (isdefined(var_44ad722912e72154)) {
        earthquake(var_44ad722912e72154.scale, var_44ad722912e72154.duration, self.origin, var_44ad722912e72154.radius);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x588d
// Size: 0x132
function vehicle_deathradiusdamage() {
    if (ishelicopter()) {
        return;
    }
    classname = get_vehicle_classname();
    if (!isdefined(level.vehicle.templates.death_radiusdamage) || !isdefined(level.vehicle.templates.death_radiusdamage[classname])) {
        return;
    }
    maxdamage = level.vehicle.templates.death_radiusdamage[classname].maxdamage;
    mindamage = level.vehicle.templates.death_radiusdamage[classname].mindamage;
    self radiusdamage(self.origin + level.vehicle.templates.death_radiusdamage[classname].offset, level.vehicle.templates.death_radiusdamage[classname].range, maxdamage, mindamage);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c6
// Size: 0x1e
function vehicle_deathkilllights() {
    lights_off_internal("all", self.model, get_vehicle_classname());
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59eb
// Size: 0x6f
function vehicle_shoulddorocketdeath(attacker, meansofdeath, var_9ef41e2c046ad906) {
    if (!vehicle_hasrocketdeath(var_9ef41e2c046ad906)) {
        return 0;
    }
    if (istrue(self.vehicle_forcerocketdeath)) {
        return 1;
    }
    if (is_equal(meansofdeath, "MOD_PROJECTILE")) {
        return 1;
    }
    if (is_equal(meansofdeath, "MOD_PROJECTILE_SPLASH")) {
        return 1;
    }
    if (is_equal(meansofdeath, "MOD_GRENADE")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a62
// Size: 0x2c
function vehicle_hasrocketdeath(classname) {
    return isdefined(level.vehicle.templates.vehicle_rocket_death_fx[classname]);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a96
// Size: 0x398
function kill_fx_thread(model, struct, type, attacker) {
    if (isdefined(self.pilot_killed)) {
        self waittill("flavor_done");
    }
    if (isdefined(self.nodeath)) {
        return;
    }
    if (!isdefined(attacker)) {
        return;
    }
    /#
        assert(isdefined(struct));
    #/
    if (isdefined(struct.waitdelay)) {
        if (struct.waitdelay >= 0) {
            wait(struct.waitdelay);
        } else {
            self waittill("death_finished");
        }
    }
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(struct.notifystring)) {
        self notify(struct.notifystring);
    }
    attackerdirection = vectornormalize(self.origin - attacker.origin);
    if (isdefined(struct.selfdeletedelay)) {
        delaycall(struct.selfdeletedelay, &delete);
    }
    if (isdefined(struct.effect)) {
        if (struct.beffectlooping) {
            if (isdefined(struct.tag)) {
                if (isdefined(struct.stayontag) && struct.stayontag == 1) {
                    thread loop_fx_on_vehicle_tag(struct.effect, struct.delay, struct.tag);
                } else {
                    thread playloopedfxontag(struct.effect, struct.delay, struct.tag);
                }
            } else {
                forward = self.origin + (0, 0, 100) - self.origin;
                playfx(struct.effect, self.origin, forward);
            }
        } else if (isdefined(struct.tag)) {
            forward = _kill_fx_play_direction(attackerdirection, struct.attacker_velocity_lerp);
            if (isdefined(forward)) {
                var_f0e63dfcba14733e = deathfx_ent();
                playfx(struct.effect, var_f0e63dfcba14733e gettagorigin(struct.tag), forward);
                if (isdefined(struct.remove_deathfx_entity_delay)) {
                    var_f0e63dfcba14733e delaycall(struct.remove_deathfx_entity_delay, &delete);
                }
            } else {
                var_f0e63dfcba14733e = deathfx_ent();
                playfxontag(struct.effect, var_f0e63dfcba14733e, struct.tag);
                thread stop_fx_on_vehicle_watcher(struct.effect, var_f0e63dfcba14733e, struct.tag);
                if (isdefined(struct.remove_deathfx_entity_delay)) {
                    deathfx_ent() delaycall(struct.remove_deathfx_entity_delay, &delete);
                }
            }
        } else {
            forward = _kill_fx_play_direction(attackerdirection, struct.attacker_velocity_lerp);
            if (isdefined(forward)) {
                playfx(struct.effect, self.origin, forward);
            } else {
                forward = self.origin + (0, 0, 100) - self.origin;
                playfx(struct.effect, self.origin, forward);
            }
        }
    }
    if (isdefined(struct.sound)) {
        if (struct.bsoundlooping) {
            thread death_firesound(struct.sound);
        } else {
            play_sound_in_space(struct.sound);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e35
// Size: 0x2d
function stop_fx_on_vehicle_watcher(effect_id, var_f0e63dfcba14733e, effect_tag) {
    var_f0e63dfcba14733e waittill("stop_all_death_fx");
    stopfxontag(effect_id, var_f0e63dfcba14733e, effect_tag);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e69
// Size: 0x5c
function loop_fx_on_vehicle_tag(effect, looptime, tag) {
    /#
        assert(isdefined(effect));
    #/
    /#
        assert(isdefined(tag));
    #/
    /#
        assert(isdefined(looptime));
    #/
    self endon("stop_looping_death_fx");
    while (isdefined(self)) {
        playfxontag(effect, deathfx_ent(), tag);
        wait(looptime);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ecc
// Size: 0x4d
function death_firesound(sound) {
    thread script_func("playloopsound_on_tag", sound, undefined, 0, 1);
    waittill_any_2("fire_extinguish", "stop_crash_loop_sound");
    if (!isdefined(self)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    self notify("stop sound" + sound);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f20
// Size: 0xda
function deathfx_ent() {
    if (isdefined(self.death_fx_on_self) && self.death_fx_on_self) {
        return self;
    }
    if (!isdefined(self.deathfx_ent)) {
        ent = spawn("script_model", (0, 0, 0));
        ent setmodel(self.model);
        ent.origin = self.origin;
        ent.angles = self.angles;
        ent notsolid();
        ent hide();
        ent linkto(self);
        ent.death_fx = 1;
        self.deathfx_ent = ent;
    } else {
        self.deathfx_ent setmodel(self.model);
    }
    return self.deathfx_ent;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6002
// Size: 0x72
function playloopedfxontag(effect, durration, tag) {
    effectorigin = spawn("script_origin", self.origin);
    self endon("fire_extinguish");
    thread playloopedfxontag_originupdate(tag, effectorigin);
    while (1) {
        playfx(effect, effectorigin.origin, effectorigin.upvec);
        wait(durration);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x607b
// Size: 0xfd
function playloopedfxontag_originupdate(tag, effectorigin) {
    effectorigin.angles = self gettagangles(tag);
    effectorigin.origin = self gettagorigin(tag);
    effectorigin.forwardvec = anglestoforward(effectorigin.angles);
    effectorigin.upvec = anglestoup(effectorigin.angles);
    while (isdefined(self) && self.code_classname == "script_vehicle" && self vehicle_getspeed() > 0) {
        effectorigin.angles = self gettagangles(tag);
        effectorigin.origin = self gettagorigin(tag);
        effectorigin.forwardvec = anglestoforward(effectorigin.angles);
        effectorigin.upvec = anglestoup(effectorigin.angles);
        wait(0.05);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x617f
// Size: 0x170
function update_steering(vehicle) {
    if (vehicle.update_time == gettime()) {
        return vehicle.steering;
    }
    vehicle.update_time = gettime();
    if (vehicle.steering_enable) {
        var_8b4eef7ef67c5fbc = clamp(0 - vehicle.angles[2], 0 - vehicle.steering_maxroll, vehicle.steering_maxroll) / vehicle.steering_maxroll;
        if (isdefined(vehicle.leanasitturns) && vehicle.leanasitturns) {
            var_fbc088bdc2e9138b = vehicle vehicle_getsteering();
            var_fbc088bdc2e9138b = var_fbc088bdc2e9138b * -1;
            var_8b4eef7ef67c5fbc = var_8b4eef7ef67c5fbc + var_fbc088bdc2e9138b;
            if (var_8b4eef7ef67c5fbc != 0) {
                var_5a867f30c70ad20 = 1 / abs(var_8b4eef7ef67c5fbc);
                if (var_5a867f30c70ad20 < 1) {
                    var_8b4eef7ef67c5fbc = var_8b4eef7ef67c5fbc * var_5a867f30c70ad20;
                }
            }
        }
        delta = var_8b4eef7ef67c5fbc - vehicle.steering;
        if (delta != 0) {
            var_ccbba16287668f0a = vehicle.steering_maxdelta / abs(delta);
            if (var_ccbba16287668f0a < 1) {
                delta = delta * var_ccbba16287668f0a;
            }
            vehicle.steering = vehicle.steering + delta;
        }
    } else {
        vehicle.steering = 0;
    }
    return vehicle.steering;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f7
// Size: 0xd
function function_98c0327a3d5ce1c(target) {
    return target;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x630c
// Size: 0xb3
function get_from_spawnstruct(target) {
    array = getstructarray(target, "targetname");
    if (array.size == 1) {
        return array[0];
    } else {
        foreach (element in array) {
            if (isdefined(element.poi) && isdefined(self.poi) && element.poi == self.poi) {
                return element;
            }
        }
        return array[0];
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63c6
// Size: 0x3a
function get_from_entity(target) {
    ent = getentarray(target, "targetname");
    if (isdefined(ent) && ent.size > 0) {
        return ent[randomint(ent.size)];
    }
    return undefined;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6408
// Size: 0x17
function get_from_vehicle_node(target) {
    return getvehiclenode(target, "targetname");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6427
// Size: 0x45
function set_lookat_from_dest(dest) {
    var_9ae5b7230af98af5 = getent(dest.script_linkto, "script_linkname");
    if (!isdefined(var_9ae5b7230af98af5)) {
        return;
    }
    self setlookatent(var_9ae5b7230af98af5);
    self.set_lookat_point = 1;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6473
// Size: 0x129
function damage_hint_bullet_only() {
    level.armordamagehints = 0;
    self.displayingdamagehints = 0;
    thread damage_hints_cleanup();
    while (isdefined(self)) {
        type = point = direction_vec = attacker = amount = self waittill("damage");
        if (!isplayer(attacker)) {
            continue;
        }
        if (isdefined(self.has_semtex_on_it)) {
            continue;
        }
        type = tolower(type);
        switch (type) {
        case #"hash_85662cca994b567":
        case #"hash_cafa41dcb907577c":
        case #"hash_f43c177a8f2e82d9":
            if (!level.armordamagehints) {
                if (isdefined(level.thrown_semtex_grenades) && level.thrown_semtex_grenades > 0) {
                    break;
                }
                level.armordamagehints = 1;
                self.displayingdamagehints = 1;
                attacker script_func("display_hint", "invulerable_bullets");
                wait(4);
                level.armordamagehints = 0;
                if (isdefined(self)) {
                    self.displayingdamagehints = 0;
                }
                break;
            }
            break;
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65a3
// Size: 0x16f
function damage_hints() {
    level.armordamagehints = 0;
    self.displayingdamagehints = 0;
    thread damage_hints_cleanup();
    while (isdefined(self)) {
        type = point = direction_vec = attacker = amount = self waittill("damage");
        if (!isplayer(attacker)) {
            continue;
        }
        if (isdefined(self.has_semtex_on_it)) {
            continue;
        }
        type = tolower(type);
        switch (type) {
        case #"hash_85662cca994b567":
        case #"hash_1991ba0f6a8cd0a2":
        case #"hash_3734ba2dac7b82b0":
        case #"hash_cafa41dcb907577c":
        case #"hash_f43c177a8f2e82d9":
            if (!level.armordamagehints) {
                if (isdefined(level.thrown_semtex_grenades) && level.thrown_semtex_grenades > 0) {
                    break;
                }
                level.armordamagehints = 1;
                self.displayingdamagehints = 1;
                if (type == "mod_grenade" || type == "mod_grenade_splash") {
                    attacker script_func("display_hint", "invulerable_frags", 5);
                } else {
                    attacker script_func("display_hint", "invulerable_bullets", 5);
                }
                wait(4);
                level.armordamagehints = 0;
                if (isdefined(self)) {
                    self.displayingdamagehints = 0;
                }
                break;
            }
            break;
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6719
// Size: 0x21
function damage_hints_cleanup() {
    self waittill("death");
    if (self.displayingdamagehints) {
        level.armordamagehints = 0;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6741
// Size: 0x2cf
function aircraft_wash_thread(model) {
    self endon("death");
    self endon("death_finished");
    self notify("stop_kicking_up_dust");
    self endon("stop_kicking_up_dust");
    max_height = 2000;
    if (isdefined(level.treadfx_maxheight)) {
        max_height = level.treadfx_maxheight;
    }
    var_b012b58235910016 = 80 / max_height;
    rate = 0.5;
    if (isairplane()) {
        rate = 0.15;
    }
    trace_ent = self;
    if (isdefined(model)) {
        trace_ent = model;
    }
    var_a1b6e266bcad49fe = 3;
    var_b5973f58036e29a5 = namespace_2a184fc4902783dc::create_default_contents(1);
    for (;;) {
        wait(rate);
        if (1) {
            if (isdefined(self.disable_wash) && self.disable_wash) {
                continue;
            }
            if (isdefined(self.treadfx_maxheight)) {
                max_height = self.treadfx_maxheight;
            }
            var_59c63d210e5007b1 = anglestoup(trace_ent.angles) * -1;
            trace = undefined;
            var_a1b6e266bcad49fe++;
            if (var_a1b6e266bcad49fe > 3) {
                var_a1b6e266bcad49fe = 3;
                trace = namespace_2a184fc4902783dc::ray_trace(trace_ent.origin, trace_ent.origin + var_59c63d210e5007b1 * max_height, trace_ent, var_b5973f58036e29a5, 1);
            }
            if (trace["fraction"] == 1 || trace["fraction"] < var_b012b58235910016) {
                continue;
            }
            dist = distance(trace_ent.origin, trace["position"]);
            var_4643b33060d67da5 = get_wash_fx(self, trace, var_59c63d210e5007b1, dist);
            if (!isdefined(var_4643b33060d67da5)) {
                continue;
            }
            rate = (dist - 350) / (max_height - 350) * 0.1 + 0.05;
            rate = max(rate, 0.05);
            if (!isdefined(trace)) {
                continue;
            }
            if (!isdefined(trace["position"])) {
                continue;
            }
            fx_origin = trace["position"];
            var_7f8ae928d63be1bb = trace["normal"];
            dist = vectordot(fx_origin - trace_ent.origin, var_7f8ae928d63be1bb);
            pos = trace_ent.origin + (0, 0, dist);
            forward = fx_origin - pos;
            if (isdefined(self.treadfx_orient_to_player)) {
                forward = fx_origin - level.player.origin;
            }
            if (vectordot(trace["normal"], (0, 0, 1)) == -1) {
                continue;
            }
            if (length(forward) < 1) {
                forward = trace_ent.angles + (0, 180, 0);
            }
            playfx(var_4643b33060d67da5, fx_origin, var_7f8ae928d63be1bb, forward);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a17
// Size: 0x9b
function get_wash_fx(vehicle, trace, var_59c63d210e5007b1, dist) {
    surface = trace["surfacetype"];
    bank = undefined;
    dot = vectordot((0, 0, -1), var_59c63d210e5007b1);
    if (dot >= 0.97) {
        bank = undefined;
    } else if (dot >= 0.92) {
        bank = "_bank";
    } else {
        bank = "_bank_lg";
    }
    return get_wash_effect(vehicle get_vehicle_classname(), surface, bank);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6aba
// Size: 0x9b
function get_wash_effect(classname, surface, bank) {
    if (isdefined(bank)) {
        var_d3f1e21839909c67 = surface + bank;
        if (!isdefined(level.vehicle.templates.surface_effects[classname][var_d3f1e21839909c67]) && surface != "default") {
            return get_wash_effect(classname, "default", bank);
        } else {
            return level.vehicle.templates.surface_effects[classname][var_d3f1e21839909c67];
        }
    }
    return get_vehicle_effect(classname, surface);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b5d
// Size: 0x78
function get_vehicle_effect(classname, surface) {
    if (!isdefined(level.vehicle.templates.surface_effects[classname][surface]) && surface != "default") {
        return get_vehicle_effect(classname, "default");
    } else {
        return level.vehicle.templates.surface_effects[classname][surface];
    }
    return undefined;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bdd
// Size: 0x13
function no_treads() {
    return ishelicopter() || isairplane();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bf8
// Size: 0x1b
function vehicle_hasdustkickup() {
    if (!ishelicopter() && !isairplane()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c1b
// Size: 0x52
function hashelicopterturret() {
    if (!isdefined(self.vehicletype)) {
        return 0;
    }
    if (self.vehicletype == "cobra") {
        return 1;
    }
    if (self.vehicletype == "cobra_player") {
        return 1;
    }
    if (self.vehicletype == "viper") {
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c75
// Size: 0x19
function vehicle_ai_avoidance_cleanup() {
    self waittill("death");
    vehicle_remove_navobstacle();
    vehicle_remove_navrepulsor();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c95
// Size: 0xdd
function vehicle_ai_avoidance_logic() {
    self endon("death");
    thread vehicle_ai_avoidance_cleanup();
    isphysicsvehicle = self vehicle_isphysveh();
    var_f9728679c5e60af8 = 56.25;
    while (1) {
        vehicle_navobstacle();
        currentorigin = self.origin;
        while (vehicle_is_stopped() && (!isphysicsvehicle || self vehicle_isonground())) {
            wait(0.5);
            if (lengthsquared(self.origin - currentorigin) > var_f9728679c5e60af8) {
                vehicle_remove_navobstacle();
                vehicle_navobstacle();
                currentorigin = self.origin;
            }
        }
        vehicle_remove_navobstacle();
        vehicle_navrepulsor();
        while (!vehicle_is_stopped() || isphysicsvehicle && !self vehicle_isonground()) {
            wait(0.1);
        }
        vehicle_remove_navrepulsor();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d79
// Size: 0x7a
function vehicle_is_stopped() {
    if (!issp() && self issuspendedvehicle()) {
        return 1;
    }
    if (self vehicle_isphysveh()) {
        if (isdefined(self.var_fa004eae3663dc6c)) {
            return (length(self vehicle_getvelocity()) / 17.6 < self.var_fa004eae3663dc6c);
        } else {
            return (length(self vehicle_getvelocity()) / 17.6 < 0.25);
        }
    }
    return length(self vehicle_getvelocity()) / 17.6 == 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dfb
// Size: 0x81
function vehicle_ai_avoidance_heli() {
    self endon("death");
    while (1) {
        vehicle_navobstacle();
        while (self vehicle_getspeed() == 0 && (!isdefined(self.script_disconnectpaths) || istrue(self.script_disconnectpaths))) {
            wait(0.1);
        }
        vehicle_remove_navobstacle();
        while (self vehicle_getspeed() != 0 || isdefined(self.script_disconnectpaths) && !istrue(self.script_disconnectpaths)) {
            wait(0.1);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e83
// Size: 0x41
function vehicle_navrepulsor() {
    if (isdefined(self.script_badplace) && !istrue(self.script_badplace)) {
        return;
    }
    createnavrepulsor(self.unique_id + "vehicle_badplace", -1, self, "allies", "axis");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ecb
// Size: 0x18
function vehicle_remove_navrepulsor() {
    destroynavrepulsor(self.unique_id + "vehicle_badplace");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eea
// Size: 0x2e
function vehicle_navobstacle() {
    if (isdefined(self.script_disconnectpaths) && !istrue(self.script_disconnectpaths)) {
        return;
    }
    self.navobstacleid = createnavbadplacebyent(self);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f1f
// Size: 0x29
function vehicle_remove_navobstacle() {
    if (isdefined(self.navobstacleid)) {
        destroynavobstacle(self.navobstacleid);
        self.navobstacleid = undefined;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f4f
// Size: 0x14
function vehicle_disable_navrepulsors() {
    self.script_badplace = 0;
    vehicle_remove_navrepulsor();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f6a
// Size: 0x1d
function vehicle_enable_navrepulsors() {
    self.script_badplace = undefined;
    if (!vehicle_is_stopped()) {
        vehicle_navrepulsor();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8e
// Size: 0x14
function vehicle_disable_navobstacles() {
    self.script_disconnectpaths = 0;
    vehicle_remove_navobstacle();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fa9
// Size: 0x1d
function vehicle_enable_navobstacles() {
    self.script_disconnectpaths = undefined;
    if (vehicle_is_stopped()) {
        vehicle_navobstacle();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fcd
// Size: 0xa
function vehicle_badplace() {
    vehicle_navrepulsor();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fde
// Size: 0xa
function vehicle_remove_badplace() {
    vehicle_remove_navrepulsor();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fef
// Size: 0xf4
function disconnect_paths_whenstopped() {
    self endon("death");
    self.pathsdisconnected = 0;
    var_d92d81d0d2fdf1c2 = 0;
    if (isdefined(self.script_disconnectpaths) && !self.script_disconnectpaths) {
        var_d92d81d0d2fdf1c2 = 1;
    }
    if (var_d92d81d0d2fdf1c2) {
        self.dontdisconnectpaths = 1;
        return;
    }
    wait(randomfloat(1));
    while (isdefined(self)) {
        if (self vehicle_getspeed() < 1) {
            if (!isdefined(self.dontdisconnectpaths)) {
                self disconnectpaths();
                self.pathsdisconnected = 1;
            } else {
                /#
                    assertex(self.dontdisconnectpaths == 1, ".dontDisconnectPaths should either be 1 or undefined.");
                #/
            }
            self notify("speed_zero_path_disconnect");
            while (self vehicle_getspeed() < 1) {
                if (isdefined(self.dontdisconnectpaths) && self.dontdisconnectpaths) {
                    break;
                }
                wait(0.05);
            }
        }
        self connectpaths();
        self.pathsdisconnected = 0;
        wait(1);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70ea
// Size: 0xe4
function mainturretinit() {
    classname = get_vehicle_classname();
    if (!isdefined(level.vehicle.templates.mainturret[classname])) {
        return;
    }
    var_f15dc6dd1ec8f7de = level.vehicle.templates.mainturret[classname];
    if (!isdefined(var_f15dc6dd1ec8f7de)) {
        return;
    }
    var_2c65be20eafc23f3 = "";
    if (isdefined(self.script_turrets)) {
        var_2c65be20eafc23f3 = self.script_turrets;
    }
    self.mainturret = turretinitshared(var_f15dc6dd1ec8f7de);
    if (!isdefined(self.script_turretmain)) {
        self.script_turretmain = 1;
    }
    if (self.script_turretmain == 0) {
        thread _mainturretoff();
    } else {
        self.script_turretmain = 1;
        thread _mainturreton();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71d5
// Size: 0x170
function mginit() {
    classname = get_vehicle_classname();
    if (isdefined(self.script_nomg) && self.script_nomg > 0) {
        return;
    }
    if (!isdefined(level.vehicle.templates.mgturret[classname])) {
        return;
    }
    var_9a34054ab3f8b177 = level.vehicle.templates.mgturret[classname];
    if (!isdefined(var_9a34054ab3f8b177)) {
        return;
    }
    var_2c65be20eafc23f3 = "";
    if (isdefined(self.script_turrets)) {
        var_2c65be20eafc23f3 = self.script_turrets;
    }
    foreach (index, var_f15dc6dd1ec8f7de in var_9a34054ab3f8b177) {
        if (isdefined(var_f15dc6dd1ec8f7de.referencename) && !issubstr(var_2c65be20eafc23f3, var_f15dc6dd1ec8f7de.referencename)) {
            continue;
        }
        self.mgturret[index] = turretinitshared(var_f15dc6dd1ec8f7de);
    }
    if (!isdefined(self.script_turretmg)) {
        self.script_turretmg = 1;
    }
    if (self.script_turretmg == 0) {
        thread _mgoff();
    } else {
        self.script_turretmg = 1;
        thread _mgon();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x734c
// Size: 0x29d
function turretinitshared(var_f15dc6dd1ec8f7de) {
    var_a53c4231f99c0bc4 = 0;
    if (isdefined(self.script_mg_angle)) {
        var_a53c4231f99c0bc4 = self.script_mg_angle;
    }
    turret = spawnturret("misc_turret", (0, 0, 0), var_f15dc6dd1ec8f7de.info);
    linkoffset = ter_op(isdefined(var_f15dc6dd1ec8f7de.offset_tag), var_f15dc6dd1ec8f7de.offset_tag, (0, 0, 0));
    parent = self;
    if (isdefined(var_f15dc6dd1ec8f7de.mainturretchild)) {
        if (!isdefined(self.mainturret)) {
            /#
                assertmsg("mg turret for veh <" + get_vehicle_classname() + "> is set to be child of mainturret, but no mainturret exists.  Use build_mainturret");
            #/
        }
        parent = self.mainturret;
    }
    turret linkto(parent, var_f15dc6dd1ec8f7de.tag, linkoffset, (0, -1 * var_a53c4231f99c0bc4, 0));
    bodymodel = function_d0e99a4f0c29166e();
    array = strtok(bodymodel, "::");
    if (array.size > 1) {
        color = array[0] + "::";
    } else {
        color = "";
    }
    turret setmodel(color + var_f15dc6dd1ec8f7de.model);
    turret.angles = self.angles;
    turret.isvehicleattached = 1;
    turret.ownervehicle = self;
    turret.weaponinfo = var_f15dc6dd1ec8f7de.info;
    /#
        assert(isdefined(self.script_team));
    #/
    turret.script_team = self.script_team;
    turret makeusable();
    set_turret_team(turret);
    level thread vehicle_turret_difficulty(turret, utility::getdifficulty());
    if (isdefined(self.script_fireondrones)) {
        turret.script_fireondrones = self.script_fireondrones;
    }
    if (isdefined(var_f15dc6dd1ec8f7de.deletedelay)) {
        turret.deletedelay = var_f15dc6dd1ec8f7de.deletedelay;
    }
    if (isdefined(var_f15dc6dd1ec8f7de.defaultdroppitch)) {
        turret setdefaultdroppitch(var_f15dc6dd1ec8f7de.defaultdroppitch);
    }
    if (isdefined(var_f15dc6dd1ec8f7de.referencename)) {
        turret.referencename = var_f15dc6dd1ec8f7de.referencename;
    }
    if (isdefined(var_f15dc6dd1ec8f7de.defaultonmode)) {
        turret turret_set_default_on_mode(var_f15dc6dd1ec8f7de.defaultonmode);
    }
    return turret;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f1
// Size: 0xa5
function vehicle_turret_difficulty(turret, difficulty) {
    turret.convergencetime = level.mgturretsettings[difficulty]["convergenceTime"];
    turret.suppressiontime = level.mgturretsettings[difficulty]["suppressionTime"];
    turret.accuracy = level.mgturretsettings[difficulty]["accuracy"];
    turret.aispread = level.mgturretsettings[difficulty]["aiSpread"];
    turret.playerspread = level.mgturretsettings[difficulty]["playerSpread"];
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x769d
// Size: 0x16
function turret_set_default_on_mode(defaultonmode) {
    self.defaultonmode = defaultonmode;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76ba
// Size: 0xc8
function set_turret_team(turret) {
    switch (self.script_team) {
    case #"hash_5f54b9bf7583687f":
    case #"hash_ecada18a31eceade":
        turret setturretteam("allies");
        break;
    case #"hash_3e323a3a6f36e18b":
    case #"hash_7c2d091e6337bf54":
        turret setturretteam("axis");
        break;
    case #"hash_24b14065e10b1f8d":
        turret setturretteam("team3");
        break;
    case #"hash_a571cacc018623b8":
        turret setturretteam("neutral");
        break;
    default:
        /#
            assertmsg("Unknown script_team: " + self.script_team);
        #/
        break;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7789
// Size: 0x3b4
function animate_drive_idle() {
    if (!issp()) {
        return;
    }
    self endon("suspend_drive_anims");
    if (!isdefined(self.vehiclewheeldirection)) {
        self.vehiclewheeldirection = 1;
    }
    model = function_d0e99a4f0c29166e();
    var_38df3cdc3cea641e = -1;
    var_f12aa8ad25f80351 = undefined;
    if (!isdefined(level.vehicle.templates.driveidle[model])) {
        return;
    }
    self useanimtree(%vehicles);
    if (!isdefined(level.vehicle.templates.driveidle_r[model])) {
        level.vehicle.templates.driveidle_r[model] = level.vehicle.templates.driveidle[model];
    }
    self endon("death");
    normalspeed = level.vehicle.templates.driveidle_normal_speed[model];
    animrate = 1;
    if (isdefined(level.vehicle.templates.driveidle_animrate) && isdefined(level.vehicle.templates.driveidle_animrate[model])) {
        animrate = level.vehicle.templates.driveidle_animrate[model];
    }
    var_1ef3be8b073c4d4 = self.vehiclewheeldirection;
    animation = level.vehicle.templates.driveidle[model];
    while (1) {
        if (!normalspeed) {
            if (isdefined(self.suspend_driveanims)) {
                wait(0.05);
                continue;
            }
            self setanim(level.vehicle.templates.driveidle[model], 1, 0.2, animrate);
            return;
        }
        speed = self vehicle_getspeed();
        if (var_1ef3be8b073c4d4 != self.vehiclewheeldirection) {
            dif = 0;
            if (self.vehiclewheeldirection) {
                animation = level.vehicle.templates.driveidle[model];
                dif = 1 - get_normal_anim_time(level.vehicle.templates.driveidle_r[model]);
                self clearanim(level.vehicle.templates.driveidle_r[model], 0);
            } else {
                animation = level.vehicle.templates.driveidle_r[model];
                dif = 1 - get_normal_anim_time(level.vehicle.templates.driveidle[model]);
                self clearanim(level.vehicle.templates.driveidle[model], 0);
            }
            var_f12aa8ad25f80351 = 0.01;
            if (var_f12aa8ad25f80351 >= 1 || var_f12aa8ad25f80351 == 0) {
                var_f12aa8ad25f80351 = 0.01;
            }
            var_1ef3be8b073c4d4 = self.vehiclewheeldirection;
        }
        var_6442d47e06f360fa = speed / normalspeed;
        if (var_6442d47e06f360fa != var_38df3cdc3cea641e) {
            self setanim(animation, 1, 0.05, var_6442d47e06f360fa);
            var_38df3cdc3cea641e = var_6442d47e06f360fa;
        }
        if (isdefined(var_f12aa8ad25f80351)) {
            self setanimtime(animation, var_f12aa8ad25f80351);
            var_f12aa8ad25f80351 = undefined;
        }
        wait(0.05);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b44
// Size: 0x2f7
function setup_vehicles(vehicles) {
    var_ba9f1614841f98e6 = [];
    foreach (vehicle in vehicles) {
        if (isspawner(vehicle)) {
            continue;
        } else {
            var_ba9f1614841f98e6[var_ba9f1614841f98e6.size] = vehicle;
        }
    }
    foreach (var_447c2355b0db50fc in var_ba9f1614841f98e6) {
        model = var_447c2355b0db50fc function_d0e99a4f0c29166e();
        if (isdefined(var_447c2355b0db50fc.var_ae43938336bbd264) && isdefined(model)) {
            array = strtok(var_447c2355b0db50fc.var_ae43938336bbd264, ",");
            color = array[randomintrange(0, array.size)];
            if (color == "base") {
                precachemodel(model);
            } else {
                precachemodel(color + "::" + model);
            }
            if (isdefined(level.vehicle.templates.var_fb41d1ca75009bf0[model])) {
                if (color == "base") {
                    precachemodel(level.vehicle.templates.var_fb41d1ca75009bf0[model]);
                } else if (istrue(level.vehicle.templates.var_893da51cf12b2c8b[model])) {
                    precachemodel(color + "::" + level.vehicle.templates.var_fb41d1ca75009bf0[model]);
                }
            }
            if (color == "base") {
                var_447c2355b0db50fc setmodel(model);
            } else {
                var_447c2355b0db50fc setmodel(color + "::" + model);
            }
        }
        if (isdefined(var_447c2355b0db50fc.spawnflags) && var_447c2355b0db50fc.spawnflags & 16) {
            var_447c2355b0db50fc.var_a784428198c5658b = 1;
        }
        if (isdefined(var_447c2355b0db50fc.spawnflags) && var_447c2355b0db50fc.spawnflags & 4) {
            var_fb41d1ca75009bf0 = var_447c2355b0db50fc thread function_18657584b6bd786a(1);
        } else {
            if (isdefined(var_447c2355b0db50fc.spawnflags)) {
                if (var_447c2355b0db50fc.spawnflags & 1) {
                    var_447c2355b0db50fc thread script_func("vehicle_usable");
                } else {
                    var_447c2355b0db50fc vehicle_turnengineoff();
                }
                if (var_447c2355b0db50fc vehicle_isphysveh() && !var_447c2355b0db50fc ishelicopter() && (var_447c2355b0db50fc.spawnflags & 8 || istrue(var_447c2355b0db50fc.var_a784428198c5658b))) {
                    var_447c2355b0db50fc function_65aa053c077c003a(1);
                }
            }
            thread vehicle_init(var_447c2355b0db50fc);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e42
// Size: 0x218
function vehicle_setstartinghealth() {
    classname = get_vehicle_classname();
    /#
        assertex(isdefined(level.vehicle.templates.life[classname]), "need to specify vehicle_setStartingHealth() in vehicle script for vehicletype: " + classname);
    #/
    if (isdefined(self.script_startinghealth)) {
        self.health = self.script_startinghealth;
    } else {
        if (level.vehicle.templates.life[classname] == -1) {
            return;
        }
        if (isdefined(level.vehicle.templates.life_range_low[classname]) && isdefined(level.vehicle.templates.life_range_high[classname]) && level.vehicle.templates.life_range_high[classname] > level.vehicle.templates.life_range_low[classname]) {
            self.health = randomint(level.vehicle.templates.life_range_high[classname] - level.vehicle.templates.life_range_low[classname]) + level.vehicle.templates.life_range_low[classname];
        } else {
            self.health = level.vehicle.templates.life[classname];
        }
    }
    self.var_ebd1d83c2799ef12 = 0;
    self.maxhealth = self.health;
    self.var_80d0f593608378c1 = self.health;
    self.var_fa70e73bae432d6f = self.health;
    self.damagestate = "damagePristine";
    self.var_653c58271b7da4c9 = 1;
    self.var_fb29967bdc4900ec = 0;
    function_98c558b067cdd616();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8061
// Size: 0x45
function get_normal_anim_time(animation) {
    animtime = self getanimtime(animation);
    animlength = getanimlength(animation);
    if (animtime == 0) {
        return 0;
    }
    return self getanimtime(animation) / getanimlength(animation);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80ae
// Size: 0x69
function suspend_drive_anims() {
    self notify("suspend_drive_anims");
    self clearanim(level.vehicle.templates.driveidle[self.model], 0);
    self clearanim(level.vehicle.templates.driveidle_r[self.model], 0);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x811e
// Size: 0xab
function idle_animations() {
    if (!isdefined(level.vehicle.templates.idle_anim[self.model])) {
        return;
    }
    self useanimtree(%vehicles);
    foreach (animation in level.vehicle.templates.idle_anim[self.model]) {
        self setanim(animation);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81d0
// Size: 0x315
function vehicle_rumble() {
    self endon("kill_rumble_forever");
    classname = get_vehicle_classname();
    rumblestruct = level.vehicle.templates.rumble[classname];
    if (!isdefined(rumblestruct)) {
        return;
    }
    height = rumblestruct.radius * 2;
    zoffset = -1 * rumblestruct.radius;
    var_c1e5e178d5d956e4 = spawn("trigger_radius", self.origin + (0, 0, zoffset), 0, rumblestruct.radius, height);
    var_c1e5e178d5d956e4 enablelinkto();
    var_c1e5e178d5d956e4 linkto(self);
    self.rumbletrigger = var_c1e5e178d5d956e4;
    self endon("death");
    if (!isdefined(self.rumbleon)) {
        self.rumbleon = 1;
    }
    if (isdefined(rumblestruct.scale)) {
        self.rumble_scale = rumblestruct.scale;
    } else {
        self.rumble_scale = 0.15;
    }
    if (isdefined(rumblestruct.duration)) {
        self.rumble_duration = rumblestruct.duration;
    } else {
        self.rumble_duration = 4.5;
    }
    if (isdefined(rumblestruct.radius)) {
        self.rumble_radius = rumblestruct.radius;
    } else {
        self.rumble_radius = 600;
    }
    if (isdefined(rumblestruct.basetime)) {
        self.rumble_basetime = rumblestruct.basetime;
    } else {
        self.rumble_basetime = 1;
    }
    if (isdefined(rumblestruct.randomaditionaltime)) {
        self.rumble_randomaditionaltime = rumblestruct.randomaditionaltime;
    } else {
        self.rumble_randomaditionaltime = 1;
    }
    var_c1e5e178d5d956e4.radius = self.rumble_radius;
    while (1) {
        var_c1e5e178d5d956e4 waittill("trigger");
        if (vehicle_is_stopped() && !isdefined(self.forcerumble) || !self.rumbleon) {
            wait(0.1);
            continue;
        }
        self playrumblelooponentity(rumblestruct.rumble);
        if (isdefined(self.vehicletype)) {
            var_cb3339ece72dbdeb = self.vehicletype + "_rumble_sfx";
            if (soundexists(var_cb3339ece72dbdeb)) {
                level.player playsound(var_cb3339ece72dbdeb);
            }
        }
        while (level.player istouching(var_c1e5e178d5d956e4) && self.rumbleon && (!vehicle_is_stopped() || isdefined(self.forcerumble))) {
            earthquake(self.rumble_scale, self.rumble_duration, self.origin, self.rumble_radius);
            wait(self.rumble_basetime + randomfloat(self.rumble_randomaditionaltime));
        }
        self stoprumble(rumblestruct.rumble);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84ec
// Size: 0x6e
function vehicle_setteam() {
    classname = get_vehicle_classname();
    if (!isdefined(self.script_team) && isdefined(level.vehicle.templates.team[classname])) {
        self.script_team = level.vehicle.templates.team[classname];
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8561
// Size: 0x38
function vehicle_handleunloadevent() {
    self endon("death");
    type = self.vehicletype;
    if (!ent_flag_exist("unloaded")) {
        ent_flag_init("unloaded");
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85a0
// Size: 0x91
function get_vehiclenode_any_dynamic(target) {
    path_start = getvehiclenode(target, "targetname");
    if (!isdefined(path_start)) {
        path_start = getent(target, "targetname");
    } else if (ishelicopter()) {
        /#
            println("<unknown string>" + path_start.targetname);
            println("<unknown string>" + self.vehicletype);
        #/
        /#
            assertmsg("helicopter on vehicle path( see console for info )");
        #/
    }
    if (!isdefined(path_start)) {
        path_start = getstruct(target, "targetname");
    }
    return path_start;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8639
// Size: 0x9bd
function vehicle_damagelogic() {
    self endon("death");
    self.damage_functions = [];
    classname = get_vehicle_classname();
    if (isdefined(level.vehicle.templates.bullet_shield[classname]) && !isdefined(self.script_bulletshield)) {
        self.script_bulletshield = level.vehicle.templates.bullet_shield[classname];
    }
    if (isdefined(level.vehicle.templates.grenade_shield[classname]) && !isdefined(self.script_grenadeshield)) {
        self.script_grenadeshield = level.vehicle.templates.grenade_shield[classname];
    }
    if (isdefined(level.vehicle.templates.var_4356b75e0eddf77d[classname]) && !isdefined(self.var_721298f6d1910c00)) {
        self.var_721298f6d1910c00 = level.vehicle.templates.var_4356b75e0eddf77d[classname];
    }
    self.healthbuffer = 100000;
    self.health = self.health + self.healthbuffer;
    self.var_80d0f593608378c1 = self.health;
    while (self.health > 0) {
        self.damageinfo = undefined;
        time = inflictor = normal = angles = origin = objweapon = dflags = partname = var_799f234362adb813 = modelname = meansofdeath = damagelocation = direction_vec = attacker = amount = self waittill("damage");
        partname = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(partname);
        var_799f234362adb813 = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(var_799f234362adb813);
        if (!flag("scriptables_ready")) {
            flag_wait("scriptables_ready");
        }
        flag_wait("scriptables_ready");
        var_4d52d3b077c86dfe = ter_op(var_799f234362adb813 != "", var_799f234362adb813, partname);
        amount = function_8f700dc8e0d2fa89(amount, meansofdeath, time);
        if (!isdefined(meansofdeath) || !isexplosivedamage(meansofdeath, objweapon)) {
            amount = function_8dfb977adeef3436(amount);
        }
        self.damageinfo["amount"] = amount;
        self.damageinfo["attacker"] = attacker;
        self.damageinfo["direction_vec"] = direction_vec;
        self.damageinfo["damageLocation"] = damagelocation;
        self.damageinfo["MOD"] = meansofdeath;
        self.damageinfo["weapon"] = objweapon;
        if (istrue(self.custom_damage_handler)) {
            return;
        }
        foreach (func in self.damage_functions) {
            thread [[ func ]](amount, attacker, direction_vec, damagelocation, meansofdeath, modelname, var_799f234362adb813, partname, dflags, objweapon);
        }
        if (isdefined(attacker)) {
            attacker script_func("register_shot_hit");
            if (func_ref_exist("vehicle_damage_modifier")) {
                data = undefined;
                if (isdefined(level.fn_damage_pack)) {
                    data = [[ level.fn_damage_pack ]](attacker, self, amount, objweapon, meansofdeath, undefined, damagelocation, direction_vec, modelname, partname, var_799f234362adb813, dflags);
                }
                if (isdefined(data)) {
                    self.damage_data = data;
                } else {
                    self.damage_data = undefined;
                }
                var_98afd1ce36f4905a = script_func("vehicle_damage_modifier", data);
                if (isdefined(var_98afd1ce36f4905a)) {
                    amount = var_98afd1ce36f4905a;
                }
            }
        }
        if (function_d7fe44ffb08b499a()) {
            /#
                thread function_a1df9e8f97742aaf("<unknown string>", 1, (0, 1, 0));
            #/
            self.health = self.var_80d0f593608378c1;
        } else if (function_e9ed4f44f9d1d682(attacker)) {
            /#
                thread function_a1df9e8f97742aaf("<unknown string>" + self.script_team + "<unknown string>" + time, 1, (0, 1, 0));
            #/
            self.health = self.var_80d0f593608378c1;
        } else if (function_c948f3a1e60efd61(attacker, meansofdeath, objweapon)) {
            /#
                thread function_a1df9e8f97742aaf("<unknown string>" + "<unknown string>" + time, 1, (0, 1, 0));
            #/
            self.health = self.var_80d0f593608378c1;
        } else if (function_ba6c52398d8ba7fb(meansofdeath, objweapon)) {
            /#
                thread function_a1df9e8f97742aaf("<unknown string>" + "<unknown string>" + time, 1, (0, 1, 0));
            #/
            self.health = self.var_80d0f593608378c1;
        } else {
            if (function_f237c27c3ba6b34d(meansofdeath)) {
                /#
                    thread function_a1df9e8f97742aaf("<unknown string>" + "<unknown string>" + time, 1, (0, 1, 0));
                #/
                self.health = self.var_80d0f593608378c1;
            }
            if (isdefined(self.var_c543f8e941150b0b)) {
                var_81a21b295824983a = self [[ self.var_c543f8e941150b0b ]](var_4d52d3b077c86dfe, meansofdeath, damagelocation);
                if (isdefined(var_81a21b295824983a)) {
                    if (isdefined(self.var_2352359ef3eefcd3)) {
                        self thread [[ self.var_2352359ef3eefcd3 ]](attacker, amount, var_81a21b295824983a, direction_vec, damagelocation);
                    }
                    if (isstartstr(var_81a21b295824983a, "tag_armor")) {
                        amount = 0;
                        self.health = self.var_80d0f593608378c1;
                    }
                }
            }
            if (utility::issp() && isdefined(meansofdeath)) {
                if (isdefined(objweapon) && function_2cffaf4e15c4ab48(getcompleteweaponname(objweapon)) || !function_b9ea9d0702abf6fd(self.health, amount, direction_vec, damagelocation, meansofdeath, objweapon, attacker, inflictor)) {
                    if (meansofdeath == "MOD_MELEE") {
                        function_a1ed6ce90e57bd32(amount, damagelocation, meansofdeath, objweapon, attacker);
                    } else {
                        thread function_b958f96bb17ec92d(var_4d52d3b077c86dfe, amount, meansofdeath, objweapon, attacker);
                    }
                }
            }
            if (function_9e9dfc6f77569f4d()) {
                /#
                    thread function_a1df9e8f97742aaf("<unknown string>", 1, (0, 1, 0));
                #/
                self.health = self.var_80d0f593608378c1;
            } else {
                self.var_80d0f593608378c1 = self.health;
                function_89cec1224ae724d5();
            }
            /#
                thread function_a1df9e8f97742aaf("<unknown string>" + self.damagestate + "<unknown string>" + self.var_80d0f593608378c1, 1, (1, 0, 0));
            #/
            /#
                thread function_a1df9e8f97742aaf(meansofdeath + "<unknown string>" + amount + "<unknown string>" + self.var_ebd1d83c2799ef12 + "<unknown string>" + var_4d52d3b077c86dfe + "<unknown string>" + self.var_80d0f593608378c1 + "<unknown string>" + time);
            #/
        }
        if (function_d7fe44ffb08b499a() || function_9e9dfc6f77569f4d()) {
            continue;
        }
        if (amount >= self.var_fa70e73bae432d6f * 2) {
            self notify("death", attacker);
        }
        if (self.damagestate == "damageHeavy") {
            if (self.health <= self.healthbuffer || function_4d5539ed20893df1()) {
                self notify("death", attacker);
            }
        } else {
            if (isdefined(level.vehicle.templates.var_ebd1d83c2799ef12[classname]) && function_4d5539ed20893df1()) {
                self notify("death", attacker);
            }
            if (ishelicopter() && function_4d5539ed20893df1()) {
                self notify("death", attacker);
            }
            var_47d36f3cb2120a2b = (self.health - self.healthbuffer) / self.var_fa70e73bae432d6f;
            if (function_4d5539ed20893df1()) {
                self.damagestate = "damageHeavy";
            } else if (var_47d36f3cb2120a2b <= 0.3) {
                self.damagestate = "damageHeavy";
            } else if (var_47d36f3cb2120a2b <= 0.65) {
                self.damagestate = "damageMedium";
            } else if (var_47d36f3cb2120a2b <= 0.9) {
                self.damagestate = "damageLight";
            } else {
                self.damagestate = "damagePristine";
            }
            /#
                thread function_a1df9e8f97742aaf("<unknown string>" + self.damagestate + "<unknown string>" + self.var_80d0f593608378c1, 1, (1, 0, 0));
            #/
            if (self isscriptable() && self getscriptablehaspart(self.damagestate) && self getscriptablepartstate(self.damagestate, 1) != self.damagestate) {
                utility::function_3677f2be30fdd581(self.damagestate, "highSpeed");
            }
            if (self.damagestate == "damageHeavy") {
                function_2d15999dc8bb344a(self.var_fa70e73bae432d6f * 0.3);
                function_89cec1224ae724d5();
                self.var_1d8c9c9044eafcbc = gettime();
                self notify("vehicle_inBurndown");
                childthread function_a286aecf91c78efa();
            }
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ffd
// Size: 0x14e
function private function_8f700dc8e0d2fa89(amount, meansofdeath, time) {
    /#
        thread function_a1df9e8f97742aaf("<unknown string>" + time + "<unknown string>" + self.var_fa70e73bae432d6f + "<unknown string>", 0, (1, 0, 0.5));
    #/
    isbullet = undefined;
    if (isdefined(meansofdeath) && isendstr(meansofdeath, "_BULLET")) {
        isbullet = 1;
    } else {
        return amount;
    }
    var_2b1b3f1a13c63097 = undefined;
    if (istrue(level.var_1de5acbb26e97918)) {
        var_2b1b3f1a13c63097 = amount * level.var_1de5acbb26e97918;
        /#
            thread function_a1df9e8f97742aaf("<unknown string>" + time + "<unknown string>" + self.var_fa70e73bae432d6f + "<unknown string>" + level.var_1de5acbb26e97918, 0, (1, 0, 0.5));
        #/
    }
    if (istrue(self.var_1de5acbb26e97918)) {
        var_2b1b3f1a13c63097 = amount * self.var_1de5acbb26e97918;
        /#
            thread function_a1df9e8f97742aaf("<unknown string>" + time + "<unknown string>" + self.var_fa70e73bae432d6f + "<unknown string>" + self.var_1de5acbb26e97918, 0, (1, 0, 0.5));
        #/
    }
    if (isdefined(var_2b1b3f1a13c63097)) {
        function_957ae339752b129e(amount - var_2b1b3f1a13c63097);
        amount = var_2b1b3f1a13c63097;
    }
    return amount;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9153
// Size: 0x35
function private function_8dfb977adeef3436(amount) {
    if (self.damagestate == "damageHeavy") {
        function_957ae339752b129e(amount * 0.75);
        return (amount * 0.25);
    }
    return amount;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9190
// Size: 0x4d
function private function_a183f52b983f5769(amount) {
    var_2b1b3f1a13c63097 = amount;
    if (istrue(level.var_bd79128b30a2dfb2)) {
        var_2b1b3f1a13c63097 = amount * level.var_bd79128b30a2dfb2;
    }
    if (istrue(self.var_bd79128b30a2dfb2)) {
        var_2b1b3f1a13c63097 = amount * self.var_bd79128b30a2dfb2;
    }
    return var_2b1b3f1a13c63097;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x91e5
// Size: 0xfe
function private function_4a5955251a67bfda(objweapon) {
    if (!isdefined(objweapon)) {
        return 1;
    }
    var_9dc5f2253f8cbf5a = getweaponbasename(objweapon);
    var_2b1b3f1a13c63097 = 1;
    if (isdefined(level.var_b8e957f2bf26c5e5)) {
        foreach (entry in level.var_b8e957f2bf26c5e5) {
            if (entry[0] == var_9dc5f2253f8cbf5a) {
                var_2b1b3f1a13c63097 = entry[1];
            }
        }
    }
    if (isdefined(self.var_b8e957f2bf26c5e5)) {
        foreach (entry in self.var_b8e957f2bf26c5e5) {
            if (entry[0] == var_9dc5f2253f8cbf5a) {
                var_2b1b3f1a13c63097 = entry[1];
            }
        }
    }
    return var_2b1b3f1a13c63097;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92eb
// Size: 0xb0
function function_a286aecf91c78efa() {
    self.var_fb29967bdc4900ec = 1;
    function_89cec1224ae724d5();
    var_f0784055cabe89a9 = int((self.health - self.healthbuffer) / 30 / 0.25) + 1;
    while (gettime() - self.var_1d8c9c9044eafcbc < 30000) {
        countdown = 30000 - gettime() - self.var_1d8c9c9044eafcbc;
        /#
            thread function_a1df9e8f97742aaf("<unknown string>" + countdown, 2, (1, 0, 1));
        #/
        vehicle_damage(var_f0784055cabe89a9, undefined, "MOD_EXECUTION");
        wait(1);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93a2
// Size: 0x64
function function_37a7cbb36025d760() {
    while (gettime() - self.var_1d8c9c9044eafcbc < 30000) {
        countdown = 30000 - gettime() - self.var_1d8c9c9044eafcbc;
        /#
            thread function_a1df9e8f97742aaf("<unknown string>" + countdown, 2, (1, 0, 1));
        #/
        waitframe();
    }
    self notify("death");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x940d
// Size: 0x10f
function function_a1ed6ce90e57bd32(amount, damagelocation, meansofdeath, objweapon, attacker) {
    var_6071f029b63b07f6 = function_7bba68b7e28ec873(64, damagelocation, 1);
    foreach (part in var_6071f029b63b07f6) {
        switch (level.vehicle.var_aab9695c92b0ed96[part]) {
        case 5:
            break;
        default:
            var_6071f029b63b07f6 = array_remove(var_6071f029b63b07f6, part);
            break;
        }
    }
    var_6d8c939979ade635 = function_350e192b13bea45c(var_6071f029b63b07f6);
    if (isdefined(var_6d8c939979ade635) && distancesquared(damagelocation, self gettagorigin(var_6d8c939979ade635)) <= squared(64)) {
        thread function_b958f96bb17ec92d(var_6d8c939979ade635, amount, meansofdeath, objweapon, undefined, 1, damagelocation);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9523
// Size: 0x1df
function function_f8f1d017591e2c60(health, amount, meansofdeath, objweapon) {
    classname = get_vehicle_classname();
    /#
        assertex(isdefined(level.vehicle.templates.var_ebd1d83c2799ef12[classname]), "Something fishy with classname: " + classname);
    #/
    if (amount >= 110 && (meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_PROJECTILE_SPLASH")) {
        var_bcd0223ee21642ef = function_4a5955251a67bfda(objweapon);
        if (level.vehicle.templates.var_ebd1d83c2799ef12[classname] > 0) {
            var_c2dde83463340b3c = self.var_fa70e73bae432d6f / level.vehicle.templates.var_ebd1d83c2799ef12[classname] / 0.5 * var_bcd0223ee21642ef;
            function_cacd62db1bbe8cb9(amount);
            function_c8a94acef0beb362(var_c2dde83463340b3c);
        }
        self.var_ebd1d83c2799ef12 = self.var_ebd1d83c2799ef12 + 0.5 * var_bcd0223ee21642ef;
        return 1;
    } else if (amount >= 190 && (meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_EXECUTION")) {
        var_bcd0223ee21642ef = function_4a5955251a67bfda(objweapon);
        if (level.vehicle.templates.var_ebd1d83c2799ef12[classname] > 0) {
            var_c2dde83463340b3c = self.var_fa70e73bae432d6f / level.vehicle.templates.var_ebd1d83c2799ef12[classname] / 1 * var_bcd0223ee21642ef;
            function_cacd62db1bbe8cb9(amount);
            function_c8a94acef0beb362(var_c2dde83463340b3c);
        }
        self.var_ebd1d83c2799ef12 = self.var_ebd1d83c2799ef12 + 1 * var_bcd0223ee21642ef;
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970a
// Size: 0xec
function function_4d5539ed20893df1() {
    classname = get_vehicle_classname();
    /#
        assertex(isdefined(level.vehicle.templates.var_ebd1d83c2799ef12[classname]), "Something fishy with classname: " + classname);
    #/
    if (level.vehicle.templates.var_ebd1d83c2799ef12[classname] == 0) {
        if (self.var_ebd1d83c2799ef12 > level.vehicle.templates.var_ebd1d83c2799ef12[classname]) {
            return 1;
        }
    }
    if (level.vehicle.templates.var_ebd1d83c2799ef12[classname] > 0 && self.var_ebd1d83c2799ef12 >= level.vehicle.templates.var_ebd1d83c2799ef12[classname]) {
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97fe
// Size: 0x104
function function_b9ea9d0702abf6fd(health, amount, direction_vec, damagelocation, meansofdeath, objweapon, attacker, inflictor) {
    if (function_f8f1d017591e2c60(health, amount, meansofdeath, objweapon)) {
        thread function_97de184a1b867545();
        var_10d73932d2ecd911 = function_7bba68b7e28ec873(undefined, damagelocation, 1);
        for (i = 0; i < var_10d73932d2ecd911.size; i++) {
            if (i == 4) {
                break;
            }
            if (isdefined(inflictor)) {
                thread function_b958f96bb17ec92d(var_10d73932d2ecd911[i], amount * 2, meansofdeath, objweapon, attacker, 1, inflictor.origin);
            } else {
                thread function_b958f96bb17ec92d(var_10d73932d2ecd911[i], amount * 2, meansofdeath, objweapon, attacker, 1);
            }
        }
        if (!istrue(self.var_3dadd352fe1d0b39) && isdefined(meansofdeath) && isexplosivedamage(meansofdeath, objweapon)) {
            thread function_80b9a13a5f971524(amount, direction_vec, damagelocation, meansofdeath);
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x990a
// Size: 0xa1
function function_98c558b067cdd616() {
    if (isdefined(self.var_aab9695c92b0ed96)) {
        return;
    }
    self.var_aab9695c92b0ed96 = [];
    for (i = 0; i < getnumparts(self.model); i++) {
        partname = getpartname(self.model, i);
        partname = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(partname);
        if (array_contains_key(level.vehicle.var_aab9695c92b0ed96, partname)) {
            self.var_aab9695c92b0ed96[partname] = level.vehicle.var_aab9695c92b0ed96[partname];
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99b2
// Size: 0x9a
function function_97de184a1b867545() {
    if (!self isscriptable()) {
        return;
    }
    function_98c558b067cdd616();
    keys = getarraykeys(self.var_aab9695c92b0ed96);
    foreach (key in keys) {
        if (isstartstr(key, "tag_wind")) {
            self.var_aab9695c92b0ed96[key] = 0;
            utility::function_3677f2be30fdd581(key, "death");
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a53
// Size: 0x519
function function_b958f96bb17ec92d(var_4d52d3b077c86dfe, amount, meansofdeath, objweapon, attacker, var_3605f9462e97466f, origin, var_42fc86b39f173720) {
    if (!isdefined(var_3605f9462e97466f)) {
        var_3605f9462e97466f = 0;
    }
    if (!isdefined(var_42fc86b39f173720)) {
        var_42fc86b39f173720 = 0;
    }
    if (!isdefined(var_4d52d3b077c86dfe) || !array_contains_key(level.vehicle.var_aab9695c92b0ed96, var_4d52d3b077c86dfe)) {
        return;
    }
    if (isdefined(var_4d52d3b077c86dfe) && isdefined(self.var_9868a2f0e52a82bd) && array_contains(self.var_9868a2f0e52a82bd, var_4d52d3b077c86dfe)) {
        if (getdvarint(@"hash_cfd8073837710cef")) {
            /#
                print3d(self.origin, "<unknown string>" + var_4d52d3b077c86dfe, (1, 1, 1), 1, 0.2, 1000, 1);
            #/
        }
        return;
    }
    function_98c558b067cdd616();
    if (!var_3605f9462e97466f) {
        function_957ae339752b129e(amount * 0.5);
    }
    hits = 0;
    if (isdefined(objweapon) && isdefined(objweapon.classname)) {
        if (!isdefined(meansofdeath) || meansofdeath != "MOD_IMPACT") {
            switch (objweapon.classname) {
            case #"hash_719417cb1de832b6":
                hits = 0.5;
                break;
            case #"hash_8cdaf2e4ecfe5b51":
                hits = 1;
                break;
            case #"hash_6191aaef9f922f96":
                hits = 4;
                break;
            case #"hash_61e969dacaaf9881":
            case #"hash_e224d0b635d0dadd":
                hits = 8;
                break;
            }
        }
    } else if (isdefined(meansofdeath)) {
        switch (meansofdeath) {
        case #"hash_b1078ff213fddba6":
            hits = 1;
            break;
        case #"hash_a5123f4d02745600":
            hits = 3;
            break;
        case #"hash_61e42661ac27b9f2":
            hits = self.var_aab9695c92b0ed96[var_4d52d3b077c86dfe];
            break;
        }
    }
    if (function_d44d56adf507094e(var_4d52d3b077c86dfe) && !isplayer(attacker) || function_d44d56adf507094e(var_4d52d3b077c86dfe) && isai(attacker)) {
        hits = hits * 0.5;
    }
    if (issubstr(var_4d52d3b077c86dfe, "tag_wind") && isdefined(meansofdeath) && meansofdeath == "MOD_IMPACT" && isdefined(objweapon) && is_equal(objweapon.classname, "grenade")) {
        hits = 2;
    }
    if (function_d44d56adf507094e(var_4d52d3b077c86dfe) && var_42fc86b39f173720) {
        hits = 0;
    }
    self.var_aab9695c92b0ed96[var_4d52d3b077c86dfe] = self.var_aab9695c92b0ed96[var_4d52d3b077c86dfe] - hits;
    /#
        thread function_fe805ffb3ad24253(var_4d52d3b077c86dfe, hits, origin);
    #/
    if (self.var_aab9695c92b0ed96[var_4d52d3b077c86dfe] <= 0) {
        if (function_d44d56adf507094e(var_4d52d3b077c86dfe) && !var_42fc86b39f173720) {
            if (function_b7148a3bfc4defb2() || getdvarint(@"hash_f0f3e5a83f3f2843") && function_34a2eb36fbca6e89()) {
                var_2c0cbb2e9b2cd03f = function_f18b042694d92f4();
                switch (var_4d52d3b077c86dfe) {
                case #"hash_176975cfc4da6ccf":
                    function_b1aab60676c543fe(0, "fl");
                    break;
                case #"hash_7882ec199836b440":
                    function_b1aab60676c543fe(1, "fr");
                    break;
                case #"hash_8990a9b7b683c2bd":
                    function_b1aab60676c543fe(2, "ml");
                    break;
                case #"hash_a4c07c681d7d1836":
                    function_b1aab60676c543fe(3, "mr");
                    break;
                case #"hash_e88679f8ff04aa03":
                    if (var_2c0cbb2e9b2cd03f > 4) {
                        function_b1aab60676c543fe(4, "bl");
                    } else {
                        function_b1aab60676c543fe(2, "bl");
                    }
                    break;
                case #"hash_95f9a89e42cf970c":
                    if (var_2c0cbb2e9b2cd03f > 4) {
                        function_b1aab60676c543fe(5, "br");
                    } else {
                        function_b1aab60676c543fe(3, "br");
                    }
                    break;
                }
            }
        }
        utility::function_3677f2be30fdd581(var_4d52d3b077c86dfe, "death");
        classname = get_vehicle_classname();
        if (isdefined(level.vehicle.templates.var_a72227c6bfa8a146[classname]) && isdefined(level.vehicle.templates.var_a72227c6bfa8a146[classname][var_4d52d3b077c86dfe])) {
            foreach (part in level.vehicle.templates.var_a72227c6bfa8a146[classname][var_4d52d3b077c86dfe]) {
                if (self.var_aab9695c92b0ed96[part] > 0) {
                    utility::function_3677f2be30fdd581(part, "death");
                }
            }
        }
    } else if (issubstr(var_4d52d3b077c86dfe, "tag_wind") && self.var_aab9695c92b0ed96[var_4d52d3b077c86dfe] <= 3) {
        utility::function_3677f2be30fdd581(var_4d52d3b077c86dfe, "webbed");
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f73
// Size: 0x6e
function function_d44d56adf507094e(var_4d52d3b077c86dfe) {
    switch (var_4d52d3b077c86dfe) {
    case #"hash_176975cfc4da6ccf":
    case #"hash_7882ec199836b440":
    case #"hash_8990a9b7b683c2bd":
    case #"hash_95f9a89e42cf970c":
    case #"hash_a4c07c681d7d1836":
    case #"hash_e88679f8ff04aa03":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fe8
// Size: 0x53
function vehicle_isalive(vehicle) {
    if (!isdefined(vehicle)) {
        return 0;
    }
    if (isdefined(vehicle.healthbuffer) && vehicle.health < vehicle.healthbuffer) {
        return 0;
    }
    if (vehicle.health <= 0) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa043
// Size: 0xb3
function grenadeshielded(type, objweapon) {
    if (!isdefined(self.script_grenadeshield)) {
        return 0;
    }
    type = tolower(type);
    if (!isdefined(type) || !issubstr(type, "grenade")) {
        return 0;
    }
    if (isdefined(level.vehicle.templates.var_7412ca7553957e74[get_vehicle_classname()])) {
        if (array_contains(level.vehicle.templates.var_7412ca7553957e74[get_vehicle_classname()], getweaponbasename(objweapon))) {
            return 0;
        }
    }
    if (self.script_grenadeshield) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0fd
// Size: 0x5d
function bulletshielded(type) {
    if (!isdefined(self.script_bulletshield)) {
        return 0;
    }
    type = tolower(type);
    if (!isdefined(type) || !issubstr(type, "bullet") || issubstr(type, "explosive")) {
        return 0;
    }
    if (self.script_bulletshield) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa161
// Size: 0x4e
function explosive_bulletshielded(type) {
    if (!isdefined(self.script_explosive_bullet_shield)) {
        return 0;
    }
    type = tolower(type);
    if (!isdefined(type) || !issubstr(type, "explosive")) {
        return 0;
    }
    if (self.script_explosive_bullet_shield) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa1b6
// Size: 0x46
function vehicle_should_regenerate(attacker, type, objweapon) {
    return function_f237c27c3ba6b34d(type) || function_e9ed4f44f9d1d682(attacker) || function_c948f3a1e60efd61(attacker, type, objweapon) || function_ba6c52398d8ba7fb(type);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa204
// Size: 0x13
function function_f237c27c3ba6b34d(type) {
    return type == "MOD_MELEE";
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21f
// Size: 0x43
function function_e9ed4f44f9d1d682(attacker) {
    return !isdefined(attacker) && self.script_team != "neutral" || attacker_isonmyteam(attacker) || attacker_troop_isonmyteam(attacker) || is_invulnerable_from_ai(attacker);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa26a
// Size: 0x38
function function_c948f3a1e60efd61(attacker, type, objweapon) {
    return isdefined(level.var_d1d6757f3c58e700) && [[ level.var_d1d6757f3c58e700 ]](attacker, type, objweapon);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2aa
// Size: 0x32
function function_ba6c52398d8ba7fb(type, objweapon) {
    return bulletshielded(type) || explosive_bulletshielded(type) || grenadeshielded(type, objweapon);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2e4
// Size: 0x42
function is_invulnerable_from_ai(attacker) {
    if (!isdefined(self.script_ai_invulnerable)) {
        return 0;
    }
    if (isdefined(attacker) && isai(attacker) && self.script_ai_invulnerable == 1) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa32d
// Size: 0x84
function attacker_troop_isonmyteam(attacker) {
    if (getdvarint(@"hash_fb816855f6554343")) {
        return 0;
    }
    if (isdefined(self.script_team) && self.script_team == "allies" && isdefined(attacker) && isplayer(attacker)) {
        return 1;
    } else if (isai(attacker) && is_equal(attacker.team, self.script_team)) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3b8
// Size: 0x5f
function attacker_isonmyteam(attacker) {
    if (getdvarint(@"hash_fb816855f6554343")) {
        return 0;
    }
    if (isdefined(attacker) && isdefined(attacker.script_team) && isdefined(self.script_team) && attacker.script_team == self.script_team) {
        return 1;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa41f
// Size: 0x21
function vehicle_setwheeldirection(direction) {
    self.vehiclewheeldirection = ter_op(direction <= 0, 0, 1);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa447
// Size: 0x79
function vehicle_playexhausteffect() {
    self endon("entitydeleted");
    self endon("death");
    if (!isdefined(level.vehicle.templates.exhaust_fx[self.model])) {
        return;
    }
    while (1) {
        playfxontag(level.vehicle.templates.exhaust_fx[self.model], self, "tag_engine_exhaust");
        waitframe();
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4c7
// Size: 0x18a
function vehicle_playengineeffect() {
    var_b86b9b1031e6dba9 = level.vehicle.templates.engine_fx[get_vehicle_classname()];
    if (!isdefined(var_b86b9b1031e6dba9)) {
        return;
    }
    var_9e6a1fe8ae2e1ca7 = 0.25;
    var_5aff5311307e6110 = undefined;
    var_35c675f4f473ab8c = undefined;
    while (1) {
        if (!vehicle_isalive(self)) {
            return;
        }
        var_d1d99b2513672267 = var_b86b9b1031e6dba9.effect;
        var_35c675f4f473ab8c = var_b86b9b1031e6dba9.effect_tag;
        var_425ffe7428f07ff = self vehicle_getspeed() / self vehicle_gettopspeedforward();
        if (isdefined(self.enginefx_effort_scale)) {
            var_425ffe7428f07ff = var_425ffe7428f07ff * self.enginefx_effort_scale;
        }
        if (isdefined(var_b86b9b1031e6dba9.max_effort_effect) && var_425ffe7428f07ff >= var_b86b9b1031e6dba9.max_effort_ratio) {
            var_d1d99b2513672267 = var_b86b9b1031e6dba9.max_effort_effect;
        } else if (isdefined(var_b86b9b1031e6dba9.med_effort_effect) && var_425ffe7428f07ff >= var_b86b9b1031e6dba9.med_effort_ratio) {
            var_d1d99b2513672267 = var_b86b9b1031e6dba9.med_effort_effect;
        } else if (isdefined(var_b86b9b1031e6dba9.min_effort_effect) && var_425ffe7428f07ff >= var_b86b9b1031e6dba9.min_effort_ratio) {
            var_d1d99b2513672267 = var_b86b9b1031e6dba9.min_effort_effect;
        }
        if (!isdefined(var_5aff5311307e6110) || var_5aff5311307e6110 != var_d1d99b2513672267) {
            if (isdefined(var_5aff5311307e6110)) {
                stopfxontag(var_5aff5311307e6110, self, var_35c675f4f473ab8c);
                waitframe();
                if (!vehicle_isalive(self)) {
                    return;
                }
            }
            playfxontag(var_d1d99b2513672267, self, var_35c675f4f473ab8c);
            var_5aff5311307e6110 = var_d1d99b2513672267;
        }
        wait(var_9e6a1fe8ae2e1ca7);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa658
// Size: 0x57
function vehicle_pathdetach() {
    self.attachedpath = undefined;
    self notify("newpath");
    if (ishelicopter()) {
        self setgoalyaw(flat_angle(self.angles)[1]);
        self setvehgoalpos(self.origin + (0, 0, 4), 1);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6b6
// Size: 0x1c
function deathrollon() {
    if (self.health > 0) {
        self.rollingdeath = 1;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6d9
// Size: 0x15
function deathrolloff() {
    self.rollingdeath = undefined;
    self notify("deathrolloff");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f5
// Size: 0x162
function get_vehicle_riders_spawners() {
    spawners = [];
    if (isdefined(self.target)) {
        targets = noself_func_return("getspawnerarray", self.target);
        if (!isdefined(targets)) {
            targets = getstructarray(self.target, "targetname");
        }
        if (!isdefined(targets)) {
            targets = [];
        }
        foreach (target in targets) {
            if (isstruct(target)) {
                if (!isdefined(target.script_demeanor)) {
                    continue;
                }
            } else {
                if (!issubstr(target.code_classname, "actor") && !issubstr(target.code_classname, "vehicle")) {
                    continue;
                }
                if (issubstr(target.code_classname, "actor")) {
                    if (!isspawner(target)) {
                        continue;
                    } else if (issubstr(target.code_classname, "vehicle")) {
                        if (!(target.spawnflags & 2)) {
                            continue;
                        }
                    }
                }
            }
            if (isdefined(target.dont_auto_ride)) {
                continue;
            }
            spawners[spawners.size] = target;
        }
    }
    return spawners;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa85f
// Size: 0x1c
function setvehgoalpos_wrap(origin, bstop) {
    return _setvehgoalpos_wrap(origin, bstop);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa883
// Size: 0x4a
function vehicle_liftoffvehicle(height) {
    if (!isdefined(height)) {
        height = 512;
    }
    destination = self.origin + (0, 0, height);
    self setneargoalnotifydist(10);
    setvehgoalpos_wrap(destination, 1);
    self waittill("goal");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8d4
// Size: 0x29
function vehicle_shouldplaydeathanimation(vehicle) {
    if (!vehicle_hasdeathanimations(vehicle)) {
        return 0;
    }
    if (istrue(self.vehicle_skipdeathanimation)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa905
// Size: 0x32
function vehicle_hasdeathanimations(vehicle) {
    return isdefined(level.vehicle.templates.deathanimations[vehicle get_vehicle_classname()]);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa93f
// Size: 0x1b5
function vehicle_getdeathanimation(vehicle, damagelocation) {
    deathanimations = level.vehicle.templates.deathanimations[vehicle get_vehicle_classname()];
    if (isdefined(damagelocation)) {
        centerofmass = vehicle getpointinbounds(0.5, 0.5, 0.5);
        var_4f61353d9ff59711 = damagelocation - centerofmass;
        directions = [];
        directions["forward"] = anglestoforward(vehicle.angles);
        directions["right"] = anglestoright(vehicle.angles);
        directions["backward"] = directions["forward"] * -1;
        directions["left"] = directions["right"] * -1;
        var_d65dafae56aa5229 = undefined;
        var_68579a660d72ac02 = -999999;
        var_3e8e874097f3600a = [0:"forward", 1:"right", 2:"backward", 3:"left"];
        foreach (var_9996e4dcd9ef33f5 in var_3e8e874097f3600a) {
            direction = directions[var_9996e4dcd9ef33f5];
            var_de514d79c19a246b = math::scalar_projection(direction, var_4f61353d9ff59711);
            if (!isdefined(var_d65dafae56aa5229) || var_de514d79c19a246b > var_68579a660d72ac02) {
                var_d65dafae56aa5229 = var_9996e4dcd9ef33f5;
                var_68579a660d72ac02 = var_de514d79c19a246b;
            }
        }
        return deathanimations[var_d65dafae56aa5229];
    } else {
        return random(deathanimations);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaafb
// Size: 0x92
function vehicle_playdeathanimation(var_b4455c2804d48521) {
    self vehicle_turnengineoff();
    self_func("vehicle_orientto", self.origin, self.angles, 0, 0);
    self useanimtree(%vehicles);
    self animscripted("vehicle_playDeathAnimation", self.origin, self.angles, var_b4455c2804d48521);
    self setneargoalnotifydist(30);
    if (ishelicopter()) {
        self setvehgoalpos(self.origin, 1);
        self setgoalyaw(self.angles[1]);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab94
// Size: 0x16
function vehicle_setcrashing(boolean) {
    self.vehiclecrashing = boolean;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb1
// Size: 0xc7
function vehicle_docrash(attacker, cause) {
    if (istrue(self.vehicle_skipdeathcrash)) {
        return;
    }
    vehicle_setcrashing(1);
    var_b990362c13178e7d = getdvarint(@"hash_31333fbc83a5058f") != 0 && ishelicopter() && self vehicle_isphysveh();
    if (self vehicle_isphysveh() && !var_b990362c13178e7d) {
        self vehphys_crash();
        if (!istrue(self.dontdisconnectpaths)) {
            self disconnectpaths();
        }
        while (!vehicle_iscorpse() && isdefined(self) && !vehicle_is_stopped()) {
            waitframe();
        }
    } else if (ishelicopter()) {
        thread vehicle_helicoptercrash(attacker, cause);
        self waittill("vehicle_crashDone");
    }
    vehicle_setcrashing(0);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac7f
// Size: 0x44
function vehicle_helicoptercrash(attacker, cause) {
    if (isdefined(attacker) && isplayer(attacker)) {
        self.original_attacker = attacker;
    }
    if (!isdefined(self)) {
        return;
    }
    detach_getoutrigs();
    thread helicopter_crash_move(attacker, cause);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacca
// Size: 0x329
function helicopter_crash_move(attacker, cause) {
    self endon("in_air_explosion");
    if (isdefined(self.perferred_crash_location)) {
        var_be1ccd90b435b15a = self.perferred_crash_location;
    } else if (isdefined(level.vehicle.var_4bd4e750e5a8e895)) {
        var_be1ccd90b435b15a = [[ level.vehicle.var_4bd4e750e5a8e895 ]](self);
    } else {
        /#
            assertex(level.vehicle.helicopter_crash_locations.size > 0, "A helicopter tried to crash but you didn't have any script_origins with targetname helicopter_crash_location in the level");
        #/
        var_5de6274da9793141 = get_unused_crash_locations();
        /#
            assertex(var_5de6274da9793141.size > 0, "You dont have enough script_origins with targetname helicopter_crash_location in the level");
        #/
        var_be1ccd90b435b15a = getclosest(self.origin, var_5de6274da9793141);
    }
    /#
        assert(isdefined(var_be1ccd90b435b15a));
    #/
    var_be1ccd90b435b15a.claimed = 1;
    self notify("newpath");
    self notify("deathspin");
    var_2d8b0eb3f94eacb7 = 0;
    direct = 0;
    if (isdefined(var_be1ccd90b435b15a.script_parameters) && var_be1ccd90b435b15a.script_parameters == "direct") {
        direct = 1;
    }
    if (isdefined(self.heli_crash_indirect_zoff)) {
        direct = 0;
        var_2d8b0eb3f94eacb7 = self.heli_crash_indirect_zoff;
    }
    if (direct) {
        /#
            assert(isdefined(var_be1ccd90b435b15a.radius));
        #/
        crash_speed = 40;
        self vehicle_setspeed(crash_speed, 15, 10);
        self setneargoalnotifydist(var_be1ccd90b435b15a.radius);
        self setvehgoalpos(var_be1ccd90b435b15a.origin, 0);
        thread helicopter_crash_flavor(var_be1ccd90b435b15a.origin, crash_speed);
        waittill_any_2("goal", "near_goal");
        helicopter_crash_path(var_be1ccd90b435b15a);
    } else {
        var_a6f9945af3300f2d = (var_be1ccd90b435b15a.origin[0], var_be1ccd90b435b15a.origin[1], self.origin[2] + var_2d8b0eb3f94eacb7);
        if (isdefined(self.heli_crash_lead)) {
            var_a6f9945af3300f2d = self.origin + self.heli_crash_lead * self vehicle_getvelocity();
            var_a6f9945af3300f2d = (var_a6f9945af3300f2d[0], var_a6f9945af3300f2d[1], var_a6f9945af3300f2d[2] + var_2d8b0eb3f94eacb7);
        }
        crash_speed = 20;
        if (isdefined(self.crash_speed)) {
            crash_speed = self.crash_speed;
        }
        self vehicle_setspeed(crash_speed, 10, 10);
        self setneargoalnotifydist(350);
        self setvehgoalpos(var_a6f9945af3300f2d, 1);
        thread helicopter_crash_flavor(var_a6f9945af3300f2d, 40);
        msg = "blank";
        while (msg != "death") {
            msg = waittill_any_3("goal", "near_goal", "death");
            if (!isdefined(msg) && !isdefined(self)) {
                var_be1ccd90b435b15a.claimed = undefined;
                self notify("vehicle_crashDone");
                return;
            } else {
                msg = "death";
            }
        }
        self setvehgoalpos(var_be1ccd90b435b15a.origin, 0);
        self waittill("goal");
        helicopter_crash_path(var_be1ccd90b435b15a);
    }
    var_be1ccd90b435b15a.claimed = undefined;
    self notify("stop_crash_loop_sound");
    self notify("vehicle_crashDone");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaffa
// Size: 0xa4
function helicopter_crash_path(var_be1ccd90b435b15a) {
    self endon("death");
    self endon("entitydeleted");
    while (isdefined(var_be1ccd90b435b15a.target)) {
        var_be1ccd90b435b15a = getstruct(var_be1ccd90b435b15a.target, "targetname");
        /#
            assert(isdefined(var_be1ccd90b435b15a));
        #/
        radius = 56;
        if (isdefined(var_be1ccd90b435b15a.radius)) {
            radius = var_be1ccd90b435b15a.radius;
        }
        self setneargoalnotifydist(radius);
        self setvehgoalpos(var_be1ccd90b435b15a.origin, 0);
        waittill_any_2("goal", "near_goal");
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a5
// Size: 0x199
function helicopter_crash_flavor(target_origin, crash_speed) {
    self endon("vehicle_crashDone");
    self clearlookatent();
    if (soundexists("hind_helicopter_dying_loop")) {
        self playloopsound("hind_helicopter_dying_loop");
    }
    style = 0;
    if (isdefined(self.preferred_crash_style)) {
        style = self.preferred_crash_style;
        if (self.preferred_crash_style < 0) {
            var_21bc11aa48abf8e7 = [0:1, 1:2, 2:2];
            total = 5;
            var_cb8e2003144ac503 = randomint(total);
            chance = 0;
            foreach (i, val in var_21bc11aa48abf8e7) {
                chance = chance + val;
                if (var_cb8e2003144ac503 < chance) {
                    style = i;
                    break;
                }
            }
        }
    }
    switch (style) {
    case 1:
        thread helicopter_crash_zigzag();
        break;
    case 2:
        thread helicopter_crash_directed(target_origin, crash_speed);
        break;
    case 3:
        thread helicopter_in_air_explosion();
        break;
    case 4:
        thread helicopter_pilot_death_explosion();
        break;
    case 0:
    default:
        thread helicopter_crash_rotate();
        break;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb245
// Size: 0xa2
function helicopter_in_air_explosion() {
    var_9ef41e2c046ad906 = get_vehicle_classname();
    if (isdefined(level.vehicle.templates.vehicle_rocket_death_fx[var_9ef41e2c046ad906])) {
        var_21cb1c59019b56f7 = level.vehicle.templates.vehicle_rocket_death_fx[var_9ef41e2c046ad906];
        struct = var_21cb1c59019b56f7[2];
        if (isdefined(struct) && isdefined(struct.waitdelay)) {
            wait(struct.waitdelay);
        }
        waitframe();
    }
    self notify("vehicle_crashDone");
    self notify("in_air_explosion");
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2ee
// Size: 0x29
function helicopter_pilot_death_explosion() {
    thread helicopter_crash_rotate();
    waittill_notify_or_timeout("goal", 5);
    self notify("flavor_done");
    thread helicopter_in_air_explosion();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb31e
// Size: 0x39
function helicopter_unloading_watcher() {
    if (!ishelicopter()) {
        return;
    }
    self endon("vehicle_crashDone");
    self waittill("unloading");
    self.unloading = 1;
    self waittill("unloaded");
    self.unloading = 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb35e
// Size: 0x9d
function helicopter_crash_directed(target_origin, crash_speed) {
    self endon("vehicle_crashDone");
    self clearlookatent();
    self setmaxpitchroll(randomintrange(20, 90), randomintrange(5, 90));
    self setyawspeed(400, 100, 100);
    var_fc583fe931147501 = 90 * randomintrange(-2, 3);
    for (;;) {
        totarget = target_origin - self.origin;
        yaw = vectortoyaw(totarget);
        yaw = yaw + var_fc583fe931147501;
        self settargetyaw(yaw);
        wait(0.1);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb402
// Size: 0xa1
function helicopter_crash_zigzag() {
    self endon("vehicle_crashDone");
    self clearlookatent();
    self setyawspeed(400, 100, 100);
    dir = randomint(2);
    for (;;) {
        for (;;) {
            if (!isdefined(self)) {
                return;
            }
            var_3f403475c9bca3f7 = randomintrange(20, 120);
            if (dir) {
                self settargetyaw(self.angles[1] + var_3f403475c9bca3f7);
            } else {
                self settargetyaw(self.angles[1] - var_3f403475c9bca3f7);
            }
            dir = 1 - dir;
            var_f0eaefb65f1333f0 = randomfloatrange(0.5, 1);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4aa
// Size: 0x62
function helicopter_crash_rotate() {
    self endon("vehicle_crashDone");
    self clearlookatent();
    self setmaxpitchroll(60, 90);
    self setyawspeed(700, 200, 200);
    for (;;) {
        for (;;) {
            if (!isdefined(self)) {
                return;
            }
            var_3f403475c9bca3f7 = randomintrange(140, 170);
            self settargetyaw(self.angles[1] + var_3f403475c9bca3f7);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb513
// Size: 0xac
function get_unused_crash_locations() {
    var_5de6274da9793141 = [];
    level.vehicle.helicopter_crash_locations = array_removeundefined(level.vehicle.helicopter_crash_locations);
    foreach (location in level.vehicle.helicopter_crash_locations) {
        if (isdefined(location.claimed)) {
            continue;
        }
        var_5de6274da9793141[var_5de6274da9793141.size] = location;
    }
    return var_5de6274da9793141;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5c7
// Size: 0x15
function vehicle_iscorpse() {
    return isdefined(self) && get_vehicle_classname() == "script_vehicle_corpse";
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5e4
// Size: 0x75
function detach_getoutrigs() {
    if (!isdefined(self.fastroperig)) {
        return;
    }
    if (!self.fastroperig.size) {
        return;
    }
    keys = getarraykeys(self.fastroperig);
    for (i = 0; i < keys.size; i++) {
        if (isdefined(self.fastroperig[keys[i]])) {
            self.fastroperig[keys[i]] unlink();
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb660
// Size: 0xe2
function vehicle_setdeathmodel() {
    if (!isdefined(level.vehicle.templates.deathmodel[self.model])) {
        return;
    }
    if (istrue(self.vehicle_skipdeathmodel)) {
        return;
    }
    if (self isscriptable()) {
        if (ishelicopter()) {
            return;
        }
        deathmodel = spawn("script_model", self.origin);
        deathmodel.angles = self.angles;
        deathmodel setmodel(level.vehicle.templates.deathmodel[self.model]);
    } else {
        self setmodel(level.vehicle.templates.deathmodel[self.model]);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb749
// Size: 0x129
function function_1e9728e5e662aca3(var_fb41d1ca75009bf0) {
    if (isdefined(self.riders)) {
        foreach (rider in self.riders) {
            if (!isdefined(rider)) {
                continue;
            }
            if (!isalive(rider)) {
                continue;
            }
            if (isdefined(rider._blackboard)) {
                vehicle = rider._blackboard.currentvehicle;
                position = rider._blackboard.var_9176cae5619d7fba;
            } else {
                vehicle = rider.ridingvehicle;
                position = rider.vehicle_position;
            }
            aianims = anim_pos(vehicle, position);
            if (isdefined(aianims) && isdefined(aianims.sittag)) {
                rider unlink();
            }
            rider linkto(var_fb41d1ca75009bf0, aianims.sittag);
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb879
// Size: 0x4b0
function function_5d04267dd0768069(quiet) {
    if (!isdefined(level.vehicle.var_925be33f50560119)) {
        level.vehicle.var_925be33f50560119 = [];
    } else {
        level.vehicle.var_925be33f50560119 = array_removeundefined(level.vehicle.var_925be33f50560119);
    }
    velocity = self vehicle_getvelocity();
    if (istrue(self.var_83b8f4f5a22568)) {
        velocity = self vehicle_getvelocity();
        velocity = velocity * 5;
    }
    model = function_d0e99a4f0c29166e();
    var_8413cc84eca03d21 = "";
    if (issubstr(model, "::")) {
        var_8413cc84eca03d21 = strtok(model, "::")[0] + "::";
        model = strtok(model, "::")[1];
        if (!istrue(level.vehicle.templates.var_893da51cf12b2c8b[model])) {
            var_8413cc84eca03d21 = "";
        }
    }
    self notsolid();
    classname = get_vehicle_classname();
    var_fb41d1ca75009bf0 = spawnvehicle(var_8413cc84eca03d21 + level.vehicle.templates.var_fb41d1ca75009bf0[model], "vehicle_husk", level.vehicle.templates.var_cfb2ce4545421678[model], self.origin, self.angles, undefined, velocity);
    var_fb41d1ca75009bf0.var_b7148a3bfc4defb2 = 1;
    var_fb41d1ca75009bf0.classname_mp = classname;
    var_fb41d1ca75009bf0 function_2d15999dc8bb344a(level.vehicle.templates.life[classname] + 100000);
    var_fb41d1ca75009bf0.var_fa70e73bae432d6f = level.vehicle.templates.life[classname];
    var_fb41d1ca75009bf0.parentmodel = model;
    var_fb41d1ca75009bf0.var_ebd1d83c2799ef12 = 0;
    var_fb41d1ca75009bf0.var_a784428198c5658b = self.var_a784428198c5658b;
    var_fb41d1ca75009bf0.var_d9ecf3d795727bb = self.var_84bca5671c65c2aa;
    var_fb41d1ca75009bf0.var_1b84f0b023dd1ca7 = self.var_1b84f0b023dd1ca7;
    if (!var_fb41d1ca75009bf0 function_1e8542a707a8002("animator")) {
        var_fb41d1ca75009bf0 function_d2e41c7603ba7697("animator");
    }
    self notify("vehicle_huskCreation", var_fb41d1ca75009bf0);
    if (isdefined(self.var_27c9e774969793bc)) {
        var_fb41d1ca75009bf0 thread [[ self.var_27c9e774969793bc ]]();
    }
    level.vehicle.var_925be33f50560119 = array_add(level.vehicle.var_925be33f50560119, var_fb41d1ca75009bf0);
    if (isdefined(self.spawnflags) && (self.spawnflags & 8 || istrue(var_fb41d1ca75009bf0.var_a784428198c5658b))) {
        var_fb41d1ca75009bf0 function_65aa053c077c003a(1);
    }
    var_fb41d1ca75009bf0 function_9ce59aa48970a667();
    var_fb41d1ca75009bf0 vehicle_turnengineoff();
    var_fb41d1ca75009bf0 delaycall(0.05, &vehphys_crash);
    var_fb41d1ca75009bf0 function_98c558b067cdd616();
    if (getdvarint(@"hash_cfd8073837710cef")) {
        /#
            print3d(var_fb41d1ca75009bf0.origin + (0, 0, 3), "<unknown string>" + velocity, (0, 1, 1), 1, 0.2, 1000, 1);
        #/
        draw_arrow_time(var_fb41d1ca75009bf0.origin, var_fb41d1ca75009bf0.origin + velocity, (0, 1, 1), 1000);
    }
    if (istrue(self.var_1de5acbb26e97918)) {
        var_fb41d1ca75009bf0.var_1de5acbb26e97918 = self.var_1de5acbb26e97918;
    }
    if (!istrue(quiet)) {
        var_fb41d1ca75009bf0 thread function_b43ab7b2056ecb9a();
    }
    if (!istrue(quiet) && !istrue(self.var_3dadd352fe1d0b39)) {
        var_fb41d1ca75009bf0 thread vehicle_husklaunch(self, undefined, undefined);
    }
    /#
        var_fb41d1ca75009bf0 thread function_835a3820d2ab0b74();
    #/
    var_fb41d1ca75009bf0 thread disconnect_paths_whenstopped();
    var_fb41d1ca75009bf0 thread function_fd3542824f9c1bd2();
    var_fb41d1ca75009bf0 thread function_2d9c04d7fe4e6719(self);
    var_fb41d1ca75009bf0 thread function_4286de11e406088f();
    if (isdefined(self.var_aab9695c92b0ed96)) {
        foreach (i, health in self.var_aab9695c92b0ed96) {
            if (health <= 0) {
                var_fb41d1ca75009bf0.var_aab9695c92b0ed96[i] = 0;
            }
        }
    }
    function_1e9728e5e662aca3(var_fb41d1ca75009bf0);
    return var_fb41d1ca75009bf0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd31
// Size: 0x32
function function_18657584b6bd786a(quiet) {
    flag_wait("scriptables_ready");
    var_fb41d1ca75009bf0 = function_5d04267dd0768069(quiet);
    self delete();
    return var_fb41d1ca75009bf0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd6b
// Size: 0x56
function function_b43ab7b2056ecb9a(state) {
    if (!self isscriptable()) {
        return;
    }
    if (!isdefined(state)) {
        state = "on";
    }
    utility::function_3677f2be30fdd581("damage_transition", state);
    utility::function_3677f2be30fdd581("floor_fire", state);
    if (!istrue(self.var_1b84f0b023dd1ca7)) {
        utility::function_3677f2be30fdd581("smoke_heavy", state);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc8
// Size: 0x3c5
function vehicle_husklaunch(parent, vehicleref, spawndata, var_9f889d0177ed067) {
    if (!self vehicle_isphysveh()) {
        return;
    }
    if (istrue(self.var_a784428198c5658b)) {
        if (getdvarint(@"hash_cfd8073837710cef")) {
            /#
                print3d(self.origin, "<unknown string>", (1, 1, 1), 1, 0.2, 1000, 1);
            #/
        }
        return;
    }
    if (isdefined(parent) && istrue(parent.var_880b13dde87ce358)) {
        return;
    }
    if (isdefined(parent) && istrue(parent.var_83b8f4f5a22568)) {
        return;
    }
    if (isdefined(parent) && isdefined(parent.damageinfo)) {
        var_18c97a374d7ec7a5 = parent.damageinfo["amount"];
        damagedir = parent.damageinfo["direction_vec"];
        damagelocation = parent.damageinfo["damageLocation"];
        damagemod = parent.damageinfo["MOD"];
    } else {
        var_18c97a374d7ec7a5 = 600;
        damagedir = undefined;
        damagelocation = self.origin;
        damagemod = "";
    }
    if (isdefined(parent) && isdefined(parent.var_84bca5671c65c2aa) && gettime() - parent.var_84bca5671c65c2aa < 1000) {
        if (getdvarint(@"hash_cfd8073837710cef")) {
            /#
                print3d(damagelocation + (0, 0, -3), "<unknown string>", (1, 1, 1), 1, 0.2, 1000, 1);
            #/
        }
        var_18c97a374d7ec7a5 = var_18c97a374d7ec7a5 * 0.1;
    }
    if (isdefined(damagedir)) {
        damagedir = (damagedir[0], damagedir[1], 0.25);
    } else {
        damagedir = (randomfloatrange(-0.25, 0.25), randomfloatrange(-0.25, 0.25), 0.25);
    }
    var_55befc5188ea09b = function_90f94b8850010576(var_18c97a374d7ec7a5, damagemod, damagelocation, 0.3);
    if (isdefined(var_9f889d0177ed067)) {
        var_55befc5188ea09b = var_55befc5188ea09b * var_9f889d0177ed067;
    }
    if (isdefined(vehicleref) && isdefined(level.sharedfuncs) && isdefined(level.sharedfuncs[vehicleref])) {
        var_fd0de3143acb9a42 = level.sharedfuncs[vehicleref]["vehicle_huskLaunch"];
        if (isdefined(var_fd0de3143acb9a42)) {
            self [[ var_fd0de3143acb9a42 ]](spawndata.initialvelocity);
            if (isdefined(self.damagedir)) {
                damagedir = self.damagedir;
            }
            if (isdefined(self.var_55befc5188ea09b)) {
                var_55befc5188ea09b = self.var_55befc5188ea09b;
            }
        }
    }
    self function_e0201404a8b6f664(damagedir, var_55befc5188ea09b, 1);
    if (getdvarint(@"hash_cfd8073837710cef")) {
        /#
            print3d(damagelocation + (0, 0, 6), "<unknown string>" + gettime(), (1, 0, 1), 1, 0.2, 1000, 1);
        #/
        /#
            print3d(damagelocation + (0, 0, 3), "<unknown string>" + var_55befc5188ea09b, (1, 0, 1), 1, 0.2, 1000, 1);
        #/
        /#
            print3d(damagelocation + (0, 0, 0), "<unknown string>" + self function_3dda404001a83ee("<unknown string>") + "<unknown string>" + var_18c97a374d7ec7a5, (1, 0, 1), 1, 0.2, 1000, 1);
        #/
        draw_arrow_time(damagelocation, damagelocation + anglestoforward(vectortoangles(damagedir)) * var_55befc5188ea09b, (1, 0, 1), 1000);
    }
    self.var_84bca5671c65c2aa = gettime();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc194
// Size: 0x31e
function function_80b9a13a5f971524(amount, damagedir, damagelocation, meansofdeath) {
    if (!self vehicle_isphysveh()) {
        return;
    }
    if (istrue(self.var_a784428198c5658b)) {
        if (getdvarint(@"hash_cfd8073837710cef")) {
            /#
                print3d(damagelocation + (0, 0, -3), "<unknown string>", (1, 1, 1), 1, 0.2, 1000, 1);
            #/
        }
        return;
    }
    if (self.var_80d0f593608378c1 <= self.healthbuffer + 1) {
        if (getdvarint(@"hash_cfd8073837710cef")) {
            /#
                print3d(damagelocation + (0, 0, -3), "<unknown string>", (1, 1, 1), 1, 0.2, 1000, 1);
            #/
        }
        return;
    }
    if (isdefined(self.var_d9ecf3d795727bb) && gettime() - self.var_d9ecf3d795727bb < 1000) {
        if (getdvarint(@"hash_cfd8073837710cef")) {
            /#
                print3d(damagelocation + (0, 0, -3), "<unknown string>", (1, 1, 1), 1, 0.2, 1000, 1);
            #/
        }
        amount = amount * 0.1;
    }
    if (!isdefined(self.var_84bca5671c65c2aa)) {
        self.var_84bca5671c65c2aa = gettime();
    } else if (gettime() - self.var_84bca5671c65c2aa < 1000) {
        if (getdvarint(@"hash_cfd8073837710cef")) {
            /#
                print3d(damagelocation + (0, 0, -3), "<unknown string>", (1, 1, 1), 1, 0.2, 1000, 1);
            #/
        }
        amount = amount * 0.1;
    }
    var_55befc5188ea09b = function_90f94b8850010576(amount, meansofdeath, damagelocation);
    damagedir = (damagedir[0], damagedir[1], 0.25);
    self function_e0201404a8b6f664(damagedir, var_55befc5188ea09b, 1);
    if (getdvarint(@"hash_cfd8073837710cef")) {
        /#
            print3d(damagelocation + (0, 0, 6), "<unknown string>" + gettime() + "<unknown string>" + self.var_84bca5671c65c2aa, (1, 0, 1), 1, 0.2, 1000, 1);
        #/
        /#
            print3d(damagelocation + (0, 0, 3), "<unknown string>" + var_55befc5188ea09b, (1, 0, 1), 1, 0.2, 1000, 1);
        #/
        /#
            print3d(damagelocation + (0, 0, 0), "<unknown string>" + self function_3dda404001a83ee("<unknown string>") + "<unknown string>" + amount, (1, 0, 1), 1, 0.2, 1000, 1);
        #/
        draw_arrow_time(damagelocation, damagelocation + anglestoforward(vectortoangles(damagedir)) * var_55befc5188ea09b, (1, 0, 1), 1000);
    }
    self.var_84bca5671c65c2aa = gettime();
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4b9
// Size: 0x130
function function_90f94b8850010576(amount, meansofdeath, damagelocation, var_5b76eef9fab1deca) {
    if (!isdefined(var_5b76eef9fab1deca)) {
        var_5b76eef9fab1deca = 1;
    }
    amount = ter_op(amount > 600, 600, amount);
    if (isdefined(meansofdeath)) {
        meansofdeath = tolower(meansofdeath);
        if (meansofdeath == "mod_projectile_splash") {
            amount = amount * 0.75;
        }
    }
    if (self function_1e8542a707a8002("p2p")) {
        amount = amount * 0.1;
    }
    mass = self function_3dda404001a83ee("mass");
    var_7002c1806613b11f = mass * 0.1 * var_5b76eef9fab1deca;
    var_42e6394b5597d748 = math::normalize_value(600, 0, amount);
    var_55befc5188ea09b = var_7002c1806613b11f * var_42e6394b5597d748;
    if (istank()) {
        var_55befc5188ea09b = var_55befc5188ea09b * 0.25;
    }
    if (getdvarint(@"hash_cfd8073837710cef")) {
        /#
            print3d(damagelocation + (0, 0, 9), "<unknown string>" + amount + "<unknown string>" + var_42e6394b5597d748, (0, 1, 0), 1, 0.2, 1000, 1);
        #/
    }
    return var_55befc5188ea09b;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5f1
// Size: 0x426
function function_2d9c04d7fe4e6719(parent) {
    if (self isscriptable()) {
        var_e72978aa7c06ee3c = [0:"tag_hood", 1:"tag_antenna", 2:"tag_mirror_left", 3:"tag_mirror_right", 4:"tag_bumper_front", 5:"tag_bumper_back", 6:"tag_windshield_front", 7:"tag_windshield_front_pristine", 8:"tag_windshield_front_web", 9:"tag_windshield_back", 10:"tag_window_front_left", 11:"tag_window_front_right", 12:"tag_window_back_left", 13:"tag_window_back_right", 14:"tag_window_back_left_corner", 15:"tag_window_back_right_corner", 16:"tag_window_sunroof", 17:"tag_hubcap_front_left", 18:"tag_hubcap_front_right", 19:"tag_hubcap_back_left", 20:"tag_hubcap_back_right", 21:"tag_wheel_spare"];
        foreach (part in var_e72978aa7c06ee3c) {
            if (isdefined(parent.var_aab9695c92b0ed96) && isdefined(parent.var_aab9695c92b0ed96[part])) {
                if (parent.var_aab9695c92b0ed96[part] <= 0) {
                    state = "hide";
                } else {
                    self.var_aab9695c92b0ed96[part] = 0;
                    state = "death";
                }
                utility::function_3677f2be30fdd581(part, state);
            }
        }
        var_de1af8851d79e89 = [0:"tag_door_front_left", 1:"tag_door_front_right", 2:"tag_door_back_left", 3:"tag_door_back_right", 4:"tag_bumper_front_damaged", 5:"tag_bumper_back_damaged", 6:"tag_light_front_left", 7:"tag_light_front_right", 8:"tag_light_front_left_2", 9:"tag_light_front_right_2", 10:"tag_light_back_left", 11:"tag_light_back_right", 12:"tag_light_back_left_2", 13:"tag_light_back_right_2", 14:"tag_light_top_left", 15:"tag_light_top_right", 16:"tag_light_front_middle", 17:"tag_light_front_top", 18:"tag_light_back_top", 19:"tag_wheel_center_front_left", 20:"tag_wheel_center_front_right", 21:"tag_wheel_center_middle_left", 22:"tag_wheel_center_middle_right", 23:"tag_wheel_center_back_left", 24:"tag_wheel_center_back_right"];
        foreach (part in var_de1af8851d79e89) {
            state = undefined;
            if (isdefined(parent.var_aab9695c92b0ed96) && isdefined(parent.var_aab9695c92b0ed96[part]) && parent.var_aab9695c92b0ed96[part] <= 0) {
                classname = get_vehicle_classname();
                if (function_d44d56adf507094e(part) && getdvarint(@"hash_4bd69b09131419ca") == 1) {
                    function_b958f96bb17ec92d(part, 0, "MOD_EXECUTION", undefined, level.player, 1, self gettagorigin(part), 0);
                } else {
                    self.var_aab9695c92b0ed96[part] = 0;
                    state = "hide";
                }
            } else if (isdefined(self.var_aab9695c92b0ed96) && isdefined(self.var_aab9695c92b0ed96[part]) && randomint(2) == 0) {
                classname = get_vehicle_classname();
                if (function_d44d56adf507094e(part) && getdvarint(@"hash_4bd69b09131419ca") == 1) {
                    function_b958f96bb17ec92d(part, 0, "MOD_EXECUTION", undefined, level.player, 1, self gettagorigin(part), 0);
                } else {
                    self.var_aab9695c92b0ed96[part] = 0;
                    state = "death";
                }
            }
            if (isdefined(state)) {
                utility::function_3677f2be30fdd581(part, state);
            }
        }
    } else {
        /#
            thread function_a1df9e8f97742aaf("<unknown string>", 1, (1, 0, 0));
        #/
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca1e
// Size: 0x1a
function function_f18b042694d92f4() {
    if (self tagexists("tag_wheel_center_middle_left")) {
        return 6;
    } else {
        return 4;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca3f
// Size: 0xe3
function function_b1aab60676c543fe(var_12e26f9f13300310, position) {
    if (!isdefined(self.var_488f0fc49178c96)) {
        self.var_488f0fc49178c96 = 0;
    }
    self.var_488f0fc49178c96 = self.var_488f0fc49178c96 | 1 << var_12e26f9f13300310;
    if (isdefined(self.driver) && isplayer(self.driver)) {
        level.player setclientomnvar("ui_veh_flat_tire_mask", self.var_488f0fc49178c96);
    }
    classname = get_vehicle_classname();
    if (!isdefined(self.var_c3db265fefdb8d4)) {
        self.var_c3db265fefdb8d4 = [];
    }
    if (!array_contains(self.var_c3db265fefdb8d4, position)) {
        self function_792b01bd9710f266(var_12e26f9f13300310);
        self.var_c3db265fefdb8d4 = array_add(self.var_c3db265fefdb8d4, position);
        self notify("vehicle_tire_blown", position);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb29
// Size: 0x53c
function function_fd3542824f9c1bd2() {
    self endon("death");
    self endon("stop collision watcher");
    self vehphys_enablecollisioncallback(1);
    while (1) {
        self.var_bdb822d4c42d7bf = undefined;
        classname = get_vehicle_classname();
        var_9ffa610f23463c71 = ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        if (istrue(self.var_721298f6d1910c00)) {
            return;
        }
        self.var_bdb822d4c42d7bf["impulse"] = impulse;
        /#
            if (getdvarint(@"hash_cfd8073837710cef")) {
                draw_angles(vectortoangles(normal), position, (0, 1, 0), 1000, 10);
                line(position, position + anglestoforward(vectortoangles(normal)) * -32, (1, 0, 0), 1, 0, 1000);
                line(position, self.origin, (0, 1, 1), 1, 0, 1000);
                print3d(self.origin + (0, 0, 3), classname, (0, 1, 1), 1, 0.2, 1000, 1);
                print3d(self.origin, "<unknown string>" + impulse, (0, 1, 1), 1, 0.2, 1000, 0);
                print3d(self.origin + (0, 0, -3), "<unknown string>" + var_9ffa610f23463c71, (0, 1, 1), 1, 0.2, 1000, 0);
                if (isdefined(ent)) {
                    print3d(self.origin + (0, 0, -6), "<unknown string>" + vectordot(anglestoforward(self.angles), anglestoforward(ent.angles)), (0, 1, 1), 1, 0.2, 1000, 0);
                }
            }
        #/
        if (isdefined(ent) && ent.code_classname == "script_vehicle" && isdefined(ent.var_bdb822d4c42d7bf) && isdefined(ent.var_bdb822d4c42d7bf["impulse"]) && ent.var_bdb822d4c42d7bf["impulse"] > impulse) {
            impulse = ent.var_bdb822d4c42d7bf["impulse"];
            self.var_bdb822d4c42d7bf["impulse"] = ent.var_bdb822d4c42d7bf["impulse"];
        }
        if (!function_d7fe44ffb08b499a() && impulse >= 0.15) {
            damage = impulse * 400;
            var_94a9fd97af4a0676 = function_a183f52b983f5769(damage);
            var_6d8c939979ade635 = function_7bba68b7e28ec873(64, position, 0, 1);
            if (isdefined(var_6d8c939979ade635)) {
                if (getdvarint(@"hash_cfd8073837710cef")) {
                    classname = get_vehicle_classname();
                    classname = getsubstr(classname, 19, classname.size);
                    /#
                        print3d(self gettagorigin(var_6d8c939979ade635), classname + "<unknown string>" + var_6d8c939979ade635 + "<unknown string>" + var_94a9fd97af4a0676, (1, 0, 0), 1, 0.2, 1000, 0);
                    #/
                    /#
                        line(position, self gettagorigin(var_6d8c939979ade635), (1, 0, 0), 1, 0, 1000);
                    #/
                }
                if (impulse > 0.8) {
                    function_97de184a1b867545();
                    var_10d73932d2ecd911 = function_7bba68b7e28ec873(1000, position, 1, 1);
                    for (i = 0; i < var_10d73932d2ecd911.size; i++) {
                        if (i == 5) {
                            break;
                        }
                        thread function_b958f96bb17ec92d(var_10d73932d2ecd911[i], 0, "MOD_EXECUTION", undefined, level.player, 1, position, 1);
                    }
                } else {
                    thread function_b958f96bb17ec92d(var_6d8c939979ade635, 0, "MOD_IMPACT", undefined, level.player, 1, position, 1);
                }
            }
            if (!function_9e9dfc6f77569f4d() && !function_b7148a3bfc4defb2() && !ent function_b7148a3bfc4defb2()) {
                var_aa8369f87b6b7363 = function_ab048fa9b5ad972(ent, position, impulse, var_9ffa610f23463c71);
                if (var_aa8369f87b6b7363 == 1) {
                    vehicle_headondeath(ent);
                } else if (var_aa8369f87b6b7363 != 2) {
                    vehicle_damage(var_94a9fd97af4a0676, undefined, "MOD_IMPACT");
                }
            }
        }
        if (function_b7148a3bfc4defb2() && isdefined(ent)) {
            if (!isdefined(self.var_6268d543216a4f2)) {
                self.var_6268d543216a4f2 = 0;
            }
            if (ent.code_classname == "script_vehicle") {
                self.var_6268d543216a4f2 = self.var_6268d543216a4f2 + 1;
            }
            if (self.var_6268d543216a4f2 >= 5) {
                ents = self getlinkedchildren();
                ents = array_add(ents, self);
                array_delete(ents);
            }
        }
        wait(1);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd06c
// Size: 0x25a
function function_ab048fa9b5ad972(ent, position, impulse, var_9ffa610f23463c71) {
    if (ishelicopter() || ent ishelicopter()) {
        return 0;
    }
    if (function_941d95491d4d4817() || ent function_941d95491d4d4817()) {
        return 0;
    }
    if (getdvarint(@"hash_7598045ee90e851d") == 1 && impulse > 0.4 && isdefined(ent.classname_mp) && isdefined(self.classname_mp) && isdefined(ent) && ent.code_classname == "script_vehicle" && ent function_5ae2b449b60714ca(position) && function_5ae2b449b60714ca(position) && vectordot(anglestoforward(self.angles), anglestoforward(ent.angles)) < -0.9 && var_9ffa610f23463c71 == 0) {
        if (!isdefined(level.vehicle.templates.var_ebd1d83c2799ef12[self.classname_mp]) || !isdefined(level.vehicle.templates.var_ebd1d83c2799ef12[ent.classname_mp])) {
            return 1;
        }
        if (level.vehicle.templates.var_ebd1d83c2799ef12[self.classname_mp] < level.vehicle.templates.var_ebd1d83c2799ef12[ent.classname_mp]) {
            return 1;
        }
        if (level.vehicle.templates.var_ebd1d83c2799ef12[self.classname_mp] == level.vehicle.templates.var_ebd1d83c2799ef12[ent.classname_mp]) {
            if (!isdefined(self.driver) || !isplayer(self.driver)) {
                return 1;
            }
        }
        if (function_79a6e6e740893346() < self.var_fa70e73bae432d6f * 0.5) {
            return 1;
        }
        vehicle_damage(self.var_fa70e73bae432d6f * 0.5, undefined, "MOD_IMPACT");
        return 2;
    }
    return 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2ce
// Size: 0x84
function function_5ae2b449b60714ca(point) {
    dot = 0;
    tag = "tag_wheel_center_front_left";
    if (!self tagexists("tag_wheel_center_front_left")) {
        /#
            print("<unknown string>");
        #/
        tag = "tag_origin";
    }
    var_485b74cb677a51a9 = point - self gettagorigin(tag);
    forward = anglestoforward(self.angles);
    dot = vectordot(var_485b74cb677a51a9, forward);
    return dot > 0;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd35a
// Size: 0x86
function vehicle_headondeath(ent) {
    if (getdvarint(@"hash_cfd8073837710cef")) {
        classname = get_vehicle_classname();
        /#
            print3d(self.origin + (0, 0, 60), classname + "<unknown string>", (1, 0, 0), 1, 1, 1000, 1);
        #/
    }
    self.var_83b8f4f5a22568 = 1;
    self notify("vehicle_headOnDeath");
    vehicle_kill(ent);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3e7
// Size: 0x168
function function_7bba68b7e28ec873(var_8887ef07110532e7, damagelocation, returnarray, var_bf877db179e9611) {
    function_98c558b067cdd616();
    if (self.var_aab9695c92b0ed96.size == 0) {
        if (istrue(returnarray)) {
            return [];
        } else {
            return;
        }
    }
    parts = function_c7dde17f06deb794(self.var_aab9695c92b0ed96, damagelocation);
    foreach (i, part in parts) {
        if (self.var_aab9695c92b0ed96[part] <= 0) {
            parts = array_remove_index(parts, i, 1);
        }
    }
    if (istrue(var_bf877db179e9611)) {
        foreach (i, part in parts) {
            if (function_d44d56adf507094e(part)) {
                parts = array_remove_index(parts, i, 1);
            }
        }
    }
    var_45fc229cd6c306b4 = function_350e192b13bea45c(parts);
    var_45fc229cd6c306b4 = function_5aaaaa0dc9a36d29(var_45fc229cd6c306b4);
    if (istrue(returnarray)) {
        return parts;
    } else if (isdefined(var_45fc229cd6c306b4) && distancesquared(damagelocation, self gettagorigin(var_45fc229cd6c306b4)) <= squared(var_8887ef07110532e7)) {
        return var_45fc229cd6c306b4;
    } else if (istrue(returnarray)) {
        return [];
    } else {
        return;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd556
// Size: 0x52
function function_5aaaaa0dc9a36d29(part) {
    if (!isdefined(part)) {
        return undefined;
    }
    if (part == "tag_bumper_front_damaged" || part == "tag_bumper_back_damaged") {
        var_ffc85e3083340fe6 = getsubstr(part, 0, part.size - 8);
        if (utility::function_35c178c80fa19cbd(var_ffc85e3083340fe6, "death")) {
            return part;
        }
        return var_ffc85e3083340fe6;
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5af
// Size: 0x4e
function function_c7dde17f06deb794(array, damagelocation) {
    /#
        assertex(isdefined(array), "Array not defined.");
    #/
    self.var_3ca4b6a49a825232 = damagelocation;
    keys = getarraykeys(array);
    keys = array_sort_with_func(keys, &function_f2e5602b6379a312);
    return keys;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd605
// Size: 0x3f
function function_f2e5602b6379a312(var_77ee125b8ad0984b, var_77ee135b8ad09a7e) {
    return distancesquared(self gettagorigin(var_77ee125b8ad0984b), self.var_3ca4b6a49a825232) < distancesquared(self gettagorigin(var_77ee135b8ad09a7e), self.var_3ca4b6a49a825232);
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd64c
// Size: 0x2bb
function function_4286de11e406088f() {
    self notify("stop_damageLogic");
    self endon("death");
    self endon("stop_damageLogic");
    /#
        thread function_a1df9e8f97742aaf("<unknown string>", 2, (0, 1, 1));
    #/
    while (self.health > 0) {
        self.damageinfo = undefined;
        time = inflictor = normal = angles = origin = objweapon = dflags = partname = var_799f234362adb813 = modelname = meansofdeath = damagelocation = direction_vec = attacker = amount = self waittill("damage");
        partname = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(partname);
        var_799f234362adb813 = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(var_799f234362adb813);
        var_4d52d3b077c86dfe = ter_op(var_799f234362adb813 != "", var_799f234362adb813, partname);
        amount = function_8f700dc8e0d2fa89(amount, meansofdeath, time);
        self.damageinfo["amount"] = amount;
        self.damageinfo["attacker"] = attacker;
        self.damageinfo["direction_vec"] = direction_vec;
        self.damageinfo["damageLocation"] = damagelocation;
        self.damageinfo["MOD"] = meansofdeath;
        self.damageinfo["weapon"] = objweapon;
        if (function_d7fe44ffb08b499a()) {
            /#
                thread function_a1df9e8f97742aaf("<unknown string>", 1, (0, 1, 0));
            #/
            self.health = self.var_80d0f593608378c1;
        } else {
            if (!function_b9ea9d0702abf6fd(self.health, amount, direction_vec, damagelocation, meansofdeath, objweapon, attacker, inflictor)) {
                /#
                    thread function_a1df9e8f97742aaf(meansofdeath + "<unknown string>" + amount + "<unknown string>" + var_4d52d3b077c86dfe + "<unknown string>" + self.health + "<unknown string>" + time);
                #/
                if (meansofdeath == "MOD_MELEE") {
                    function_a1ed6ce90e57bd32(amount, damagelocation, meansofdeath, objweapon, attacker);
                } else {
                    thread function_b958f96bb17ec92d(var_4d52d3b077c86dfe, amount, meansofdeath, objweapon, attacker);
                }
            }
            if (function_9e9dfc6f77569f4d()) {
                /#
                    thread function_a1df9e8f97742aaf("<unknown string>", 1, (0, 1, 0));
                #/
                self.health = self.var_80d0f593608378c1;
            } else {
                self.var_80d0f593608378c1 = self.health;
            }
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd90e
// Size: 0x19e
function function_835a3820d2ab0b74() {
    self endon("death");
    if (!isdefined(self.var_f62942f38b243e4f)) {
        self.var_f62942f38b243e4f = spawnstruct();
        self.var_f62942f38b243e4f.text[0] = "";
        self.var_f62942f38b243e4f.color[0] = (1, 1, 1);
        self.var_f62942f38b243e4f.text[1] = "";
        self.var_f62942f38b243e4f.color[1] = (1, 1, 1);
        self.var_f62942f38b243e4f.text[2] = "";
        self.var_f62942f38b243e4f.color[2] = (1, 1, 1);
    }
    for (;;) {
        for (;;) {
            if (!getdvarint(@"hash_cfd8073837710cef")) {
                goto LOC_00000198;
            }
            zoffset = 70;
            for (i = 0; i < self.var_f62942f38b243e4f.text.size; i++) {
                if (isdefined(self.var_f62942f38b243e4f.text[i])) {
                    zoffset = zoffset - 3;
                    /#
                        print3d(self.origin + (0, 0, zoffset), self.var_f62942f38b243e4f.text[i], self.var_f62942f38b243e4f.color[i], 1, 0.2, 1, 1);
                    #/
                }
            }
        LOC_00000198:
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xdab3
// Size: 0x145
function function_a1df9e8f97742aaf(text, linenum, color, bone) {
    if (!isdefined(self.var_f62942f38b243e4f)) {
        self.var_f62942f38b243e4f = spawnstruct();
    }
    if (!isdefined(self.var_4eb5f18e4aff3101)) {
        self.var_4eb5f18e4aff3101 = 0;
    }
    if (!isdefined(color)) {
        color = (1, 1, 1);
    }
    var_2df2ed9765358b55 = 12;
    if (!isdefined(linenum)) {
        linenum = 3;
        if (self.var_4eb5f18e4aff3101 < var_2df2ed9765358b55) {
            self.var_4eb5f18e4aff3101 = self.var_4eb5f18e4aff3101 + 1;
        }
        for (i = var_2df2ed9765358b55; i > linenum; i--) {
            self.var_f62942f38b243e4f.text[i] = self.var_f62942f38b243e4f.text[i - 1];
            self.var_f62942f38b243e4f.color[i] = self.var_f62942f38b243e4f.color[i - 1];
        }
    }
    self.var_f62942f38b243e4f.text[linenum] = text;
    self.var_f62942f38b243e4f.color[linenum] = color;
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdbff
// Size: 0x10b
function function_fe805ffb3ad24253(var_4d52d3b077c86dfe, amount, origin) {
    /#
        self notify("<unknown string>" + var_4d52d3b077c86dfe);
        self endon("<unknown string>");
        self endon("<unknown string>" + var_4d52d3b077c86dfe);
        originoffset = undefined;
        if (isdefined(origin)) {
            originoffset = origin - self.origin;
        }
        time = gettime();
        for (;;) {
            for (;;) {
                if (!getdvarint(@"hash_cfd8073837710cef")) {
                    goto LOC_00000105;
                }
                if (gettime() - time > 10000) {
                    break;
                }
                if (isdefined(originoffset)) {
                    line(self.origin + originoffset, self gettagorigin(var_4d52d3b077c86dfe, 1), (1, 1, 1), 1, 0, 1);
                }
                print3d(self gettagorigin(var_4d52d3b077c86dfe, 1), var_4d52d3b077c86dfe + "<unknown string>" + amount + "<unknown string>" + self.var_aab9695c92b0ed96[var_4d52d3b077c86dfe] + "<unknown string>" + time, (1, 1, 1), 1, 0.2, 1, 1);
            LOC_00000105:
            }
        }
    #/
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd11
// Size: 0x99
function function_ceca0fbe6b37349a() {
    self endon("death");
    flag_wait("scriptables_ready");
    while (1) {
        level.player waittill("ads_pressed");
        if (isdefined(self.driver) && isplayer(self.driver)) {
            var_9d6cb79f4e312ddd = gettime();
            vehicle_lights_on("brakelights");
            level.player waittill("ads_released");
            if (gettime() - var_9d6cb79f4e312ddd < 300) {
                wait(0.3);
            }
            vehicle_lights_on("daylights");
        }
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddb1
// Size: 0xbb
function function_c2b5282b537a56bc() {
    if (!self isscriptable()) {
        return;
    }
    self endon("death");
    flag_wait("scriptables_ready");
    if (!self getscriptablehaspart("flag")) {
        return;
    }
    while (1) {
        var_ad34a12845171639 = length(self vehicle_getvelocity()) / 17.6;
        if (var_ad34a12845171639 > 35) {
            utility::function_3677f2be30fdd581("flag", "fast");
        } else if (var_ad34a12845171639 > 7) {
            utility::function_3677f2be30fdd581("flag", "medium");
        } else if (var_ad34a12845171639 > 2) {
            utility::function_3677f2be30fdd581("flag", "slow");
        } else {
            utility::function_3677f2be30fdd581("flag", "stopped");
        }
        wait(0.1);
    }
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde73
// Size: 0x21d
function function_83007a20bd9161ba() {
    /#
        setdvarifuninitialized(@"hash_e73c951b937ce2c2", "<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_48d05ac8c8af934f, 0, 2);
        var_11f099113be884b5 = function_e3b6f7bd4cb6ce92();
        var_6481a4470646aa3a = [];
        var_d22b0e3360f2e38 = [];
        var_fe458ead5ad42935 = [];
        if (isdefined(var_11f099113be884b5)) {
            foreach (var_31e4e9a915c4851 in var_11f099113be884b5) {
                if (isdefined(var_31e4e9a915c4851.type) && isdefined(var_31e4e9a915c4851.model)) {
                    if (var_31e4e9a915c4851.type == "<unknown string>") {
                        var_6481a4470646aa3a[var_6481a4470646aa3a.size] = var_31e4e9a915c4851;
                    } else if (var_31e4e9a915c4851.type == "<unknown string>") {
                        var_d22b0e3360f2e38[var_d22b0e3360f2e38.size] = var_31e4e9a915c4851;
                    } else if (var_31e4e9a915c4851.type == "<unknown string>") {
                        var_fe458ead5ad42935[var_fe458ead5ad42935.size] = var_31e4e9a915c4851;
                    }
                }
            }
        }
        function_6e7290c8ee4f558b("<unknown string>");
        for (index = 0; index < var_6481a4470646aa3a.size; index++) {
            vehicletype = function_3c8848a3a11b2553(var_6481a4470646aa3a[index].vehicletype);
            function_b23a59dfb4ca49a1(vehicletype, "<unknown string>" + vehicletype, &function_24af60cc7030872d);
        }
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>");
        for (index = 0; index < var_d22b0e3360f2e38.size; index++) {
            vehicletype = function_3c8848a3a11b2553(var_d22b0e3360f2e38[index].vehicletype);
            function_b23a59dfb4ca49a1(vehicletype, "<unknown string>" + vehicletype, &function_24af60cc7030872d);
        }
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<unknown string>");
        for (index = 0; index < var_fe458ead5ad42935.size; index++) {
            vehicletype = function_3c8848a3a11b2553(var_fe458ead5ad42935[index].vehicletype);
            function_b23a59dfb4ca49a1(vehicletype, "<unknown string>" + vehicletype, &function_24af60cc7030872d);
        }
        function_fe953f000498048f();
    #/
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe097
// Size: 0xe2
function function_48d05ac8c8af934f() {
    /#
        vehicletype = getdvar(@"hash_e73c951b937ce2c2", "<unknown string>");
        if (vehicletype != "<unknown string>") {
            player = level.players[0];
            if (!isdefined(player)) {
                return;
            }
            forward = anglestoforward(player.angles);
            spawnposition = player.origin + (0, 0, 100) + forward * 300;
            spawnangles = player.angles * (0, 1, 0);
            vehicle = spawnvehicle(undefined, "<unknown string>", vehicletype, spawnposition, spawnangles);
            if (!isdefined(vehicle.interactdata)) {
                vehicle makeusable();
            }
        }
    #/
}

// Namespace namespace_bf4f6ba196da1351/namespace_b479ac682b93cd92
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe180
// Size: 0x3a
function function_24af60cc7030872d(param) {
    /#
        vehicletype = param[0];
        setdvar(@"hash_e73c951b937ce2c2", vehicletype);
        iprintln("<unknown string>" + vehicletype);
    #/
}

