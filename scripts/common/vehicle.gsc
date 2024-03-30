// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_lights.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\vehicle_aianim.gsc;

#namespace vehicle;

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b
// Size: 0x54
function init_vehicles() {
    if (getdvarint(@"hash_742caa13b3c2e685", 0)) {
        return;
    }
    if (isdefined(level.disablevehiclescripts) && level.disablevehiclescripts) {
        return;
    }
    if (!add_init_script("vehicles", &init_vehicles)) {
        return;
    }
    thread init_vehicles_thread();
    cleanup_vt();
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6
// Size: 0x21
function cleanup_vt() {
    level.vtclassname = undefined;
    level.vtmodel = undefined;
    level.vttype = undefined;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de
// Size: 0xf6
function init_vehicles_thread() {
    create_lock("aircraft_wash_math");
    vehicle_setuplevelvariables();
    level.vehicle.helicopter_crash_locations = array_combine(level.vehicle.helicopter_crash_locations, getstructarray_delete("helicopter_crash_location", "targetname"));
    vehicle_setupspawners();
    allvehiclesprespawn = vehicle_precachescripts();
    setup_vehicles(allvehiclesprespawn);
    level.vehicle.has_vehicles = getentarray("script_vehicle", "code_classname").size > 0;
    script_func("add_hint_string", "invulerable_frags", "SCRIPT/INVULERABLE_FRAGS");
    script_func("add_hint_string", "invulerable_bullets", "SCRIPT/INVULERABLE_BULLETS");
    script_func("add_hint_string", "enter_vehicle", "SCRIPT/ENTER_VEHICLE");
    script_func("add_hint_string", "exit_vehicle", "SCRIPT/EXIT_VEHICLE", &function_3e3d0013d3b2b92a);
}

// Namespace vehicle / scripts/common/vehicle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db
// Size: 0x25
function vehicle_paths(node, var_269fb0ec10b51524, var_cfa3aafb71b08d36) {
    return _vehicle_paths(node, var_269fb0ec10b51524, var_cfa3aafb71b08d36);
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508
// Size: 0x13
function vehicle_spawn(vspawner) {
    return vehicle_spawn_internal(vspawner);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x523
// Size: 0xe
function godon() {
    self.godmode = 1;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538
// Size: 0xd
function godoff() {
    self.godmode = 0;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x54c
// Size: 0x27
function function_7461e330c56d791e(parts) {
    if (!isarray(parts)) {
        parts = [parts];
    }
    self.var_9868a2f0e52a82bd = parts;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0x44
function function_20fc7af6688ea282(parts) {
    if (!isdefined(self.var_845b5beb82aa6bda)) {
        return;
    }
    if (!isarray(parts)) {
        parts = [parts];
    }
    self.var_9868a2f0e52a82bd = array_remove(parts, self.var_845b5beb82aa6bda);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c5
// Size: 0xe
function function_9ce59aa48970a667() {
    self.demigodmode = 1;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5da
// Size: 0xd
function function_7d7628da4296efab() {
    self.demigodmode = 0;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ee
// Size: 0x9
function mainturretoff() {
    return _mainturretoff();
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ff
// Size: 0x9
function mainturreton() {
    return _mainturreton();
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x610
// Size: 0x9
function mgoff() {
    return _mgoff();
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x621
// Size: 0x9
function mgon() {
    return _mgon();
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632
// Size: 0xd
function isvehicle() {
    return isdefined(self.vehicletype);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x647
// Size: 0x9
function vehicle_is_crashing() {
    return vehicle_iscrashing();
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x658
// Size: 0xb
function vehicle_kill_rumble_forever() {
    self notify("kill_rumble_forever");
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a
// Size: 0xed
function spawn_vehicles_from_targetname(targetname, var_a7333fc35fb3cc3a) {
    vehicles = [];
    spawners = getentarray(targetname, "targetname");
    foreach (spawner in spawners) {
        if (!isdefined(spawner.code_classname) || spawner.code_classname != "script_vehicle") {
            continue;
        }
        if (isspawner(spawner)) {
            vehicle = vehicle_spawn_internal(spawner, var_a7333fc35fb3cc3a);
            if (istrue(var_a7333fc35fb3cc3a)) {
                vehicle waittill("vehicle_init_complete");
            }
            vehicles = array_add(vehicles, vehicle);
        }
    }
    /#
        assertex(vehicles.size, "No vehicle spawners had targetname " + targetname);
    #/
    return vehicles;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x75f
// Size: 0x45
function spawn_vehicle_from_targetname(name) {
    vehiclearray = spawn_vehicles_from_targetname(name);
    /#
        assertex(vehiclearray.size == 1, "Tried to spawn a vehicle from targetname " + name + " but it returned " + vehiclearray.size + " vehicles, instead of 1");
    #/
    return vehiclearray[0];
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7ac
// Size: 0x59
function spawn_vehicle_from_targetname_and_drive(name, var_a7333fc35fb3cc3a) {
    vehiclearray = spawn_vehicles_from_targetname(name, var_a7333fc35fb3cc3a);
    /#
        assertex(vehiclearray.size == 1, "Tried to spawn a vehicle from targetname " + name + " but it returned " + vehiclearray.size + " vehicles, instead of 1");
    #/
    thread gopath(vehiclearray[0]);
    return vehiclearray[0];
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80d
// Size: 0x6d
function spawn_vehicles_from_targetname_and_drive(name) {
    vehiclearray = spawn_vehicles_from_targetname(name);
    foreach (vehicle in vehiclearray) {
        thread gopath(vehicle);
    }
    return vehiclearray;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x882
// Size: 0x15
function aircraft_wash(model) {
    thread aircraft_wash_thread(model);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89e
// Size: 0xc
function vehicle_wheels_forward() {
    vehicle_setwheeldirection(1);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b1
// Size: 0xb
function vehicle_wheels_backward() {
    vehicle_setwheeldirection(0);
}

// Namespace vehicle / scripts/common/vehicle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c3
// Size: 0x175
function vehicle_load_ai(ai, goddriver, group) {
    if (!isarray(ai)) {
        ai = [ai];
    }
    scripts/common/vehicle_aianim::load_ai(ai, goddriver, group);
    if (getdvarint(@"hash_9403d7d31fc1d981")) {
        if (!self.usedpositions[0] && !istrue(self.player_drivable)) {
            /#
                assert(self.riders.size);
            #/
            riders = self.riders;
            vehicle_unload();
            scripts/engine/utility::ent_flag_wait("unloaded");
            riders = array_removedead(riders);
            riders = array_remove_array(riders, self.riders);
            if (riders.size > 0) {
                vehicle_load_ai(riders);
            }
            return;
        }
        vehicleanim = level.vehicle.templates.aianims[get_vehicle_classname()];
        if (isdefined(vehicleanim[0].death)) {
            foreach (rider in self.riders) {
                if (istrue(rider.drivingvehicle)) {
                    thread scripts/common/vehicle_aianim::driverdead(rider);
                }
            }
        }
    }
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3f
// Size: 0x44
function spawn_vehicle_and_gopath() {
    vehicle = utility::spawn_vehicle();
    if (isdefined(self.script_speed)) {
        if (!ishelicopter()) {
            vehicle vehicle_setspeed(self.script_speed);
        }
    }
    thread gopath(vehicle);
    return vehicle;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8b
// Size: 0x46
function attach_vehicle(node) {
    self vehicle_teleport(node.origin, node.angles);
    if (!ishelicopter()) {
        waitframe();
        self attachpath(node);
    }
    thread vehicle_paths(node, 1);
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad8
// Size: 0x4c
function attach_vehicle_and_gopath(node) {
    self vehicle_teleport(node.origin, node.angles);
    waitframe();
    if (!ishelicopter()) {
        self attachpath(node);
    }
    thread vehicle_paths(node);
    gopath(self);
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb2b
// Size: 0x15a
function vehicle_get_riders_by_group(groupname) {
    group = [];
    /#
        assert(isdefined(self.vehicletype));
    #/
    classname = get_vehicle_classname();
    if (!isdefined(level.vehicle.templates.unloadgroups[classname])) {
        return group;
    }
    vehicles_groups = level.vehicle.templates.unloadgroups[classname];
    if (!isdefined(groupname)) {
        return group;
    }
    foreach (guy in self.riders) {
        /#
            assert(isdefined(guy.vehicle_position));
        #/
        foreach (groupid in vehicles_groups[groupname]) {
            if (guy.vehicle_position == groupid) {
                group[group.size] = guy;
            }
        }
    }
    return group;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8d
// Size: 0x13
function vehicle_unload(who) {
    return _vehicle_unload(who);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca8
// Size: 0xb
function vehicle_turret_scan_off() {
    self notify("stop_scanning_turret");
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcba
// Size: 0xe4
function vehicle_get_path_array() {
    self endon("death");
    apathnodes = [];
    estartnode = self.attachedpath;
    if (!isdefined(self.attachedpath)) {
        return apathnodes;
    }
    nextnode = estartnode;
    nextnode.counted = 0;
    while (isdefined(nextnode)) {
        if (isdefined(nextnode.counted) && nextnode.counted == 1) {
            break;
        }
        apathnodes = array_add(apathnodes, nextnode);
        nextnode.counted = 1;
        if (!isdefined(nextnode.target)) {
            break;
        }
        if (!ishelicopter()) {
            nextnode = getvehiclenode(nextnode.target, "targetname");
            continue;
        }
        nextnode = getent_or_struct(nextnode.target, "targetname");
    }
    return apathnodes;
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda6
// Size: 0x29
function vehicle_lights_on(group, classname) {
    if (!isdefined(group)) {
        group = "all";
    }
    lights_on(group, classname);
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdd6
// Size: 0x29
function vehicle_lights_off(group, classname) {
    if (!isdefined(group)) {
        group = "all";
    }
    lights_off(group, classname);
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe06
// Size: 0x2f
function vehicle_switch_paths(next_node, target_node) {
    self setswitchnode(next_node, target_node);
    self.attachedpath = target_node;
    thread vehicle_paths();
}

// Namespace vehicle / scripts/common/vehicle
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe3c
// Size: 0x25
function vehicle_stop_named(stop_name, acceleration, deceleration) {
    return _vehicle_stop_named(stop_name, acceleration, deceleration);
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe69
// Size: 0x13
function vehicle_resume_named(stop_name) {
    return _vehicle_resume_named(stop_name);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe84
// Size: 0x4f
function ishelicopter() {
    if (isdefined(self.isheli)) {
        return 1;
    }
    if (!isdefined(self.vehicletype)) {
        return 0;
    }
    return isdefined(level.vehicle.templates.helicopter_list[function_40fd49171fad19d3(self.vehicletype)]);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedb
// Size: 0x3f
function isboat() {
    if (!isdefined(self.vehicletype)) {
        return 0;
    }
    return isdefined(level.vehicle.templates.boat_list[function_40fd49171fad19d3(self.vehicletype)]);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf22
// Size: 0x30
function isairplane() {
    return isdefined(level.vehicle.templates.airplane_list[function_40fd49171fad19d3(self.vehicletype)]);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5a
// Size: 0x3f
function istank() {
    if (!isdefined(self.vehicletype)) {
        return 0;
    }
    return isdefined(level.vehicle.templates.tank_list[function_40fd49171fad19d3(self.vehicletype)]);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa1
// Size: 0x20
function enable_global_vehicle_spawn_functions() {
    vehicle_setuplevelvariables();
    level.vehicle.spawn_functions_enable = 1;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc8
// Size: 0x5a
function isplayerinvehicle(veh) {
    if (isdefined(veh) && isdefined(veh.driver) && isplayer(veh.driver)) {
        return true;
    }
    if (!isdefined(veh) && isdefined(level.player.veh)) {
        return true;
    }
    return false;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102a
// Size: 0x14
function function_3e3d0013d3b2b92a(veh) {
    return !isplayerinvehicle(veh);
}

// Namespace vehicle / scripts/common/vehicle
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1046
// Size: 0x1ca
function function_4f182ad6b6d594db(dist, entercallback, exitcallback, interact_delay) {
    self endon("death");
    self endon("stop_driveable");
    level.player endon("death");
    self.player_drivable = 1;
    while (true) {
        waitframe();
        if (self.code_classname == "script_vehicle") {
            if (!isdefined(level.player.veh)) {
                if (distance2dsquared(level.player.origin, self.origin) < squared(dist)) {
                    script_func("display_hint", "enter_vehicle", 0.05);
                    if (level.player usebuttonpressed()) {
                        level.player notify("drive_vehicle");
                        self vehicle_turnengineon();
                        level.player [[ entercallback ]](self);
                        self.driver = level.player;
                        level.player.veh = self;
                        function_89cec1224ae724d5();
                        while (level.player usebuttonpressed()) {
                            waitframe();
                        }
                        if (isdefined(interact_delay)) {
                            wait(interact_delay);
                        }
                    }
                }
                continue;
            }
            if (isdefined(level.player.veh) && level.player.veh == self) {
                if (level.player usebuttonpressed()) {
                    level.player [[ exitcallback ]](self);
                    self.driver = undefined;
                    level.player.veh = undefined;
                    while (level.player usebuttonpressed()) {
                        waitframe();
                    }
                    if (isdefined(interact_delay)) {
                        wait(interact_delay);
                    }
                }
            }
        }
    }
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1217
// Size: 0x1b
function function_32f7de64be76262() {
    if (isdefined(self.damagestate)) {
        return self.damagestate;
    }
    return undefined;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x123a
// Size: 0x27
function function_a59f81db0ddb38c2() {
    if (isdefined(self.damagestate) && self.damagestate == "damageHeavy") {
        return true;
    }
    return false;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1269
// Size: 0xa1
function vehicle_kill(inflictor) {
    if (istrue(self.godmode) || istrue(self.demigodmode)) {
        /#
            print("drive_vehicle");
        #/
        return;
    }
    damage = self.healthstarting * 2;
    self dodamage(damage, self.origin, inflictor, undefined, "MOD_EXECUTION");
    if (isdefined(level.player.veh) && self == level.player.veh) {
        setomnvar("ui_veh_health_percent", 0);
    }
}

// Namespace vehicle / scripts/common/vehicle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1311
// Size: 0x6b
function vehicle_damage(amount, inflictor, mod) {
    if (istrue(self.godmode) || istrue(self.demigodmode)) {
        /#
            print("<unknown string>");
        #/
        return;
    }
    mod = default_to(mod, undefined);
    self dodamage(amount, self.origin, inflictor, undefined, mod);
    function_89cec1224ae724d5();
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1383
// Size: 0x92
function function_af11cc0c8dc23332(inflictor) {
    if (istrue(self.godmode) || istrue(self.demigodmode)) {
        /#
            print("<unknown string>");
        #/
        return;
    }
    var_4c78918e17e67a6 = self.healthstarting * 0.3 - 1 + self.healthbuffer;
    var_a1649adebbb57951 = self.health - var_4c78918e17e67a6;
    if (var_a1649adebbb57951 > 1) {
        self dodamage(var_a1649adebbb57951, self.origin, inflictor, undefined, "MOD_EXECUTION");
    }
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141c
// Size: 0xd
function isvehiclehusk() {
    return istrue(self.isvehiclehusk);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1431
// Size: 0x31
function function_9308a42c596b3bf4() {
    if (isvehicle() || isdefined(self.code_classname) && self.code_classname == "script_vehicle") {
        return true;
    }
    return false;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x146a
// Size: 0x26
function function_f6f26f5b1c244d5(scale) {
    /#
        assertex(isdefined(scale), "Need to define a scale!");
    #/
    self.var_1de5acbb26e97918 = scale;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1497
// Size: 0x26
function function_2c8c048d81431d8b(scale) {
    /#
        assertex(isdefined(scale), "Need to define a scale!");
    #/
    self.var_bd79128b30a2dfb2 = scale;
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c4
// Size: 0x6a
function vehicle_sethealth(amount, resetstarting) {
    if (!isdefined(self.healthbuffer)) {
        self.healthbuffer = 0;
    }
    amount = int(amount + self.healthbuffer);
    self.health = amount;
    self.var_80d0f593608378c1 = amount;
    if (istrue(resetstarting)) {
        self.healthstarting = amount - self.healthbuffer;
    }
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1535
// Size: 0x7a
function function_cacd62db1bbe8cb9(amount, resetstarting) {
    amount = int(amount);
    if (!isdefined(self.healthbuffer)) {
        self.healthbuffer = 0;
    }
    self.health = self.health + amount;
    self.var_80d0f593608378c1 = self.health;
    if (istrue(resetstarting)) {
        self.healthstarting = self.health - self.healthbuffer;
    }
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b6
// Size: 0x91
function function_c8a94acef0beb362(amount, resetstarting) {
    amount = int(amount);
    if (!isdefined(self.healthbuffer)) {
        self.healthbuffer = 0;
    }
    if (amount >= self.health) {
        vehicle_kill(level);
        return;
    }
    self.health = self.health - amount;
    self.var_80d0f593608378c1 = self.health;
    if (istrue(resetstarting)) {
        self.healthstarting = self.health - self.healthbuffer;
    }
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164e
// Size: 0x16
function function_79a6e6e740893346() {
    return self.var_80d0f593608378c1 - self.healthbuffer;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166c
// Size: 0x20
function function_6cbb869150e32086() {
    return (self.var_80d0f593608378c1 - self.healthbuffer) / self.healthstarting;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1694
// Size: 0xd
function function_9e9dfc6f77569f4d() {
    return istrue(self.demigodmode);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a9
// Size: 0xd
function function_d7fe44ffb08b499a() {
    return istrue(self.godmode);
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16be
// Size: 0x16
function function_7b7412ddbeed1f41(bool) {
    self.var_653c58271b7da4c9 = bool;
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16db
// Size: 0xd
function function_34a2eb36fbca6e89() {
    return istrue(self.var_653c58271b7da4c9);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f0
// Size: 0x33
function function_27f6984d596866bf() {
    classname = get_vehicle_classname();
    return level.vehicle.templates.hudindex[classname];
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x172b
// Size: 0x2e
function function_65976a53a9cbd110() {
    if (isdefined(function_27f6984d596866bf())) {
        setomnvar("ui_veh_vehicle", function_27f6984d596866bf());
        return;
    }
    setomnvar("ui_veh_vehicle", 2);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1760
// Size: 0x19
function function_37f33bfe6b63cb0a() {
    level.player setclientomnvar("ui_veh_vehicle", -1);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1780
// Size: 0x13e
function function_89cec1224ae724d5() {
    if (!isdefined(level.player)) {
        return;
    }
    if (!isdefined(level.player.veh)) {
        return;
    }
    if (self != level.player.veh) {
        if (!isdefined(level.player.leanout_vehicle)) {
            return;
        }
        if (!is_equal(self, level.player.leanout_vehicle)) {
            return;
        }
    }
    healthpercentage = function_6cbb869150e32086();
    if (healthpercentage < 0) {
        setomnvar("ui_veh_health_percent", int(0));
    } else {
        setomnvar("ui_veh_health_percent", int(healthpercentage * 100));
    }
    if (isdefined(self.var_488f0fc49178c96)) {
        level.player setclientomnvar("ui_veh_flat_tire_mask", self.var_488f0fc49178c96);
    } else {
        level.player setclientomnvar("ui_veh_flat_tire_mask", 0);
    }
    if (isdefined(self.ui_warning)) {
        level.player setclientomnvarbit("ui_veh_warning", 1, self.ui_warning);
        return;
    }
    level.player setclientomnvarbit("ui_veh_warning", 1, 0);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c5
// Size: 0x1b
function function_2f026409116444() {
    level.player setclientomnvarbit("ui_veh_warning", 1, 1);
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e7
// Size: 0x1f
function function_9fb6b2244163f2a1() {
    if (!isdefined(self.var_c3db265fefdb8d4)) {
        return [];
    }
    return self.var_c3db265fefdb8d4;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190d
// Size: 0x3e
function function_9b915d163f6d1d5a(part) {
    if (isdefined(self.damageableparts) && isdefined(self.damageableparts[part]) && self.damageableparts[part] > 0) {
        return true;
    }
    return false;
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1953
// Size: 0x10f
function function_97cbee6be1660a84(animation, husk) {
    vehicle = self;
    self.skiplaunch = 1;
    if (!isdefined(husk)) {
        husk = 1;
    }
    if (istrue(husk) && !ismp() && !iscp()) {
        vehicle = scripts/common/vehicle_code::function_18657584b6bd786a(0);
        vehicle useanimtree(%vehicles);
    }
    if (!vehicle hascomponent("animator")) {
        vehicle addcomponent("animator");
        vehicle function_77320e794d35465a("animator", "keyframed", 0);
    }
    vehicle animscripted("crash_anim_finished", vehicle.origin, vehicle.angles, animation, undefined, undefined, 0.2, 1);
    vehicle vehphys_crash();
    if (vehicle hascomponent("p2p")) {
        vehicle function_77320e794d35465a("p2p", "pause", 1);
    }
    if (vehicle hascomponent("path")) {
        vehicle function_77320e794d35465a("path", "pause", 1);
    }
    vehicle waittillmatch("crash_anim_finished", "end");
}

// Namespace vehicle / scripts/common/vehicle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a69
// Size: 0xab
function function_a0f7306fc3c08ecf(vehicle, var_d5a3f788ef786063) {
    var_5134a5777f340d56 = 0;
    if (isdefined(vehicle.oob)) {
        var_5134a5777f340d56 = 1;
    }
    if (!istrue(var_5134a5777f340d56) && istrue(var_d5a3f788ef786063)) {
        oobtriggers = level.outofboundstriggers;
        foreach (trigger in oobtriggers) {
            if (vehicle istouching(trigger)) {
                var_5134a5777f340d56 = 1;
                break;
            }
        }
    }
    return var_5134a5777f340d56;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1c
// Size: 0x6d
function function_9039b650ffb212c8(str) {
    if (!isdefined(str)) {
        return;
    }
    if (!isdefined(level.var_d43e78e513933216)) {
        level.var_d43e78e513933216 = [];
    }
    if (!isdefined(level.var_d43e78e513933216[function_3db00f01cdba4538("tag_origin")])) {
        level.var_d43e78e513933216[function_3db00f01cdba4538("tag_origin")] = "tag_origin";
    }
    level.var_d43e78e513933216[function_3db00f01cdba4538(str)] = str;
}

// Namespace vehicle / scripts/common/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b90
// Size: 0x35
function function_8ed0ffa3f8be7c75(xhash) {
    if (!isdefined(level.var_d43e78e513933216)) {
        return "";
    }
    return default_to(level.var_d43e78e513933216[xhash], "");
}

// Namespace vehicle / scripts/common/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcd
// Size: 0x3f
function codecallback_vehiclespawned() {
    if (isdefined(level.vehicle) && isdefined(level.vehicle.onVehicleSpawned)) {
        self [[ level.vehicle.onVehicleSpawned ]]();
    }
}

