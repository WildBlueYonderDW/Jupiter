// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\engine\scriptable.gsc;
#using script_5f903436642211af;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace elevators;

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x740
// Size: 0x1ef
function function_d8de1e0bc05f3b3a() {
    if (isdefined(level.var_b3c54f58528f476)) {
        return;
    }
    level.var_b3c54f58528f476 = 1;
    level waittill("prematch_done");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("button", &function_3f9f543d197015b3);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("elevator_ext_button", &function_52b0636366efd3e4);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("elevator_int_button", &function_d99e32e6787622fe);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("elevator_int_button_double", &function_d99e32e6787622fe);
    level.var_fdd3dff47723be1f = [];
    level.var_fdd3dff47723be1f["waiting"] = &function_4497ec9c55f12123;
    level.var_fdd3dff47723be1f["doors_open"] = &function_ec009a967d1d5eb9;
    level.var_fdd3dff47723be1f["doors_closing"] = &function_8b680b3ef155fc34;
    level.var_fdd3dff47723be1f["moving"] = &function_82893c609a46609;
    level.elevators = [];
    level.var_40e610580f1cbaf8 = [];
    level.var_adb18014bbfc01a8 = &function_adb18014bbfc01a8;
    script_model_anims("default");
    var_9c512bd31f6b92d0 = namespace_3c37cb17ade254d::getstructarray("elevator_car", "script_noteworthy");
    var_40e610580f1cbaf8 = getentitylessscriptablearray("elevator_stop", "script_noteworthy");
    waitframe();
    foreach (stop in var_40e610580f1cbaf8) {
        function_b0811deba3748e9d(stop);
        waitframe();
    }
    foreach (var_ddf67f48730c77b1 in level.var_40e610580f1cbaf8) {
        if (var_ddf67f48730c77b1.size != 2) {
            continue;
        }
        elevator = function_c0032a2e585d337b(var_ddf67f48730c77b1, var_9c512bd31f6b92d0);
        elevator thread function_12e75ac514f84d03();
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x936
// Size: 0x303
function function_b0811deba3748e9d(stop) {
    stop.open = 0;
    var_a4de0bb1cfaf96e8 = getentitylessscriptablearray(stop.target, "targetname");
    stop.indicator = var_a4de0bb1cfaf96e8[0];
    stop.doors = getentitylessscriptablearray(stop.indicator.target, "targetname");
    stop.var_f6104aeade1a9e68 = [];
    s_anchor = undefined;
    if (isdefined(stop.doors[0].target)) {
        s_anchor = getstruct(stop.doors[0].target, "targetname");
    }
    /#
        assertex(stop.doors.size != 0 && stop.doors.size <= 2, "Elevator has more than 2 doors per floor");
    #/
    foreach (door in stop.doors) {
        door.open = 0;
    }
    if (stop.doors.size == 1) {
        stop.var_646b88b6b0468f9 = stop.doors[0].origin;
    } else {
        stop.var_646b88b6b0468f9 = averagepoint([0:stop.doors[0].origin, 1:stop.doors[1].origin]);
    }
    if (isdefined(s_anchor)) {
        var_68333dfc5840cbd8 = s_anchor.origin[0] + "," + s_anchor.origin[1];
    } else {
        var_68333dfc5840cbd8 = stop.var_646b88b6b0468f9[0] + "," + stop.var_646b88b6b0468f9[1];
    }
    if (!isdefined(level.var_40e610580f1cbaf8[var_68333dfc5840cbd8])) {
        level.var_40e610580f1cbaf8[var_68333dfc5840cbd8] = [];
    }
    level.var_40e610580f1cbaf8[var_68333dfc5840cbd8][level.var_40e610580f1cbaf8[var_68333dfc5840cbd8].size] = stop;
    stop.var_e7e26d136416c9bc = 0;
    if (isdefined(stop.doors[0].target)) {
        if (isdefined(s_anchor)) {
            var_348e7e549beb7e1d = function_f159c10d5cf8f0b4(s_anchor.target, "targetname");
        } else {
            var_348e7e549beb7e1d = function_f159c10d5cf8f0b4(stop.doors[0].target, "targetname");
        }
        stop.trigger = var_348e7e549beb7e1d[0];
        if (isdefined(stop.trigger)) {
            stop thread function_e7dd97852a7b0baf();
        }
    }
    return var_68333dfc5840cbd8;
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc41
// Size: 0x9cc
function function_c0032a2e585d337b(var_ddf67f48730c77b1, var_9c512bd31f6b92d0, var_cecd1599dbcc976) {
    elevator = spawnstruct();
    elevator.parts = [];
    elevator.floors = [];
    elevator.state = "doors_open";
    if (var_ddf67f48730c77b1.size > 1) {
        var_d8acb6785f746668 = ter_op(var_ddf67f48730c77b1[0].origin[2] < var_ddf67f48730c77b1[1].origin[2], 0, 1);
    } else {
        var_d8acb6785f746668 = 0;
    }
    foreach (stop in var_ddf67f48730c77b1) {
        stop.elevator = elevator;
    }
    var_8518fdd0909b90fd = var_ddf67f48730c77b1[var_d8acb6785f746668].origin;
    mindist = undefined;
    var_21efbd9501c439ba = undefined;
    var_d4a1fd41d06b194 = undefined;
    foreach (car in var_9c512bd31f6b92d0) {
        if (!isdefined(mindist)) {
            mindist = distancesquared(car.origin, var_8518fdd0909b90fd);
            var_21efbd9501c439ba = car;
            var_d4a1fd41d06b194 = car.targetname;
        } else {
            dist = distancesquared(car.origin, var_8518fdd0909b90fd);
            if (dist < mindist) {
                mindist = dist;
                var_21efbd9501c439ba = car;
                var_d4a1fd41d06b194 = car.targetname;
            }
        }
    }
    car = spawn("script_model", var_21efbd9501c439ba.origin);
    car.angles = var_21efbd9501c439ba.angles;
    car setmodel(function_53c4c53197386572(var_cecd1599dbcc976, "building_saba_elevator_set_int"));
    car.animname = "elevator";
    car setanimtree();
    car setscriptablepartstate("lights", "on");
    car.elevator = elevator;
    car.occupants = [];
    car.var_27abfc12040d5908 = 0;
    createnavobstaclebybounds(car.origin, (90, 90, 90), car.angles);
    if (isdefined(var_21efbd9501c439ba.script_parameters)) {
        var_6b72ca36ef52aa27 = strtok(var_21efbd9501c439ba.script_parameters, ",");
        car.n_travel_time = float(var_6b72ca36ef52aa27[0]);
        if (var_6b72ca36ef52aa27.size >= 3) {
            car.var_acb6874b16adac5e = float(var_6b72ca36ef52aa27[1]);
            car.var_23e93511918b6091 = float(var_6b72ca36ef52aa27[2]);
        } else if (var_6b72ca36ef52aa27.size == 2) {
            car.var_acb6874b16adac5e = float(var_6b72ca36ef52aa27[1]);
            car.var_23e93511918b6091 = car.var_acb6874b16adac5e;
        } else if (car.n_travel_time >= 4) {
            car.var_acb6874b16adac5e = 2;
            car.var_23e93511918b6091 = 2;
        } else {
            car.var_acb6874b16adac5e = 0;
            car.var_23e93511918b6091 = 0;
        }
    } else {
        car.var_acb6874b16adac5e = 2;
        car.var_23e93511918b6091 = 2;
    }
    if (!isdefined(car.var_d4a1fd41d06b194)) {
        car.var_d4a1fd41d06b194 = "default";
    }
    switch (car.var_d4a1fd41d06b194) {
    case #"hash_dfb267e42bb20045":
        var_e13e96bcd56df32 = "t10_ava_building_elevator_double_set_int";
        car.animname = "elevator_double";
        car.var_ef04438af292c145 = 1;
        break;
    case #"hash_5971965ed985a26c":
        var_e13e96bcd56df32 = "t10_ava_machinery_elevator_sm_01_int_set";
        car.animname = "elevator_small";
        car.var_ef04438af292c145 = 0;
        break;
    case #"hash_6bf513acc2adb471":
        var_e13e96bcd56df32 = "t10_ava_machinery_elevator_dbl_01_int_set";
        car.animname = "elevator_small_double";
        car.var_ef04438af292c145 = 1;
        break;
    default:
        var_e13e96bcd56df32 = "building_saba_elevator_set_int";
        car.animname = "elevator";
        car.var_ef04438af292c145 = 0;
        break;
    }
    if (!isdefined(car.str_model_name)) {
        car.str_model_name = var_e13e96bcd56df32;
    }
    car setmodel(car.str_model_name);
    car setanimtree();
    /#
        assertex(car isscriptable(), "Elevator car scriptable(s) not loaded. May need to be precached.");
    #/
    if (!car isscriptable()) {
        return;
    }
    if (isdefined(var_21efbd9501c439ba.target)) {
        var_3978e8604d576990 = namespace_3c37cb17ade254d::getstruct(var_21efbd9501c439ba.target, "targetname");
        if (isdefined(var_3978e8604d576990)) {
            var_3978eb604d577029 = namespace_3c37cb17ade254d::getstruct(var_3978e8604d576990.target, "targetname");
            if (isdefined(var_3978eb604d577029)) {
                var_3978ea604d576df6 = namespace_3c37cb17ade254d::getstruct(var_3978eb604d577029.target, "targetname");
                if (isdefined(var_3978ea604d576df6)) {
                    var_3978ed604d57748f = namespace_3c37cb17ade254d::getstruct(var_3978ea604d576df6.target, "targetname");
                    if (isdefined(var_3978ed604d57748f)) {
                        car.var_98700da2e6c8d502 = 144;
                        car.var_3978e8604d576990 = var_3978e8604d576990.origin;
                        car.var_3978eb604d577029 = var_3978eb604d577029.origin;
                        car.var_3978ea604d576df6 = var_3978ea604d576df6.origin;
                        car.var_3978ed604d57748f = var_3978ed604d57748f.origin;
                        car.var_27abfc12040d5908 = 1;
                    }
                }
            }
        }
    }
    if (!car.var_27abfc12040d5908 && car.model == "building_saba_elevator_set_int") {
        var_258cd90357571677 = -84;
        var_258cda03575718aa = 76;
        var_1465200349cb879c = -88;
        var_1465230349cb8e35 = 88;
        car.var_98700da2e6c8d502 = 144;
        car.var_3978e8604d576990 = car.origin + rotatepointaroundvector((0, 0, 1), (var_258cd90357571677, var_1465200349cb879c, 0), car.angles[1]);
        car.var_3978eb604d577029 = car.origin + rotatepointaroundvector((0, 0, 1), (var_258cd90357571677, var_1465230349cb8e35, 0), car.angles[1]);
        car.var_3978ea604d576df6 = car.origin + rotatepointaroundvector((0, 0, 1), (var_258cda03575718aa, var_1465230349cb8e35, 0), car.angles[1]);
        car.var_3978ed604d57748f = car.origin + rotatepointaroundvector((0, 0, 1), (var_258cda03575718aa, var_1465200349cb879c, 0), car.angles[1]);
        car.var_27abfc12040d5908 = 1;
    }
    var_61f15908243423cc = function_f159c10d5cf8f0b4("elevator_occupancy_trig", "targetname");
    if (isdefined(var_61f15908243423cc) && var_61f15908243423cc.size > 0) {
        var_bf33d00c58d36fb9 = sortbydistance(var_61f15908243423cc, car.origin);
        var_45d0836f831471cf = 0;
        tolerance = 48;
        car.var_7486049051c97774 = undefined;
        while (var_45d0836f831471cf < var_bf33d00c58d36fb9.size) {
            if (distance_2d_squared(car.origin, var_bf33d00c58d36fb9[var_45d0836f831471cf].origin) < tolerance * tolerance) {
                car.var_7486049051c97774 = var_bf33d00c58d36fb9[var_45d0836f831471cf];
                break;
            }
            var_45d0836f831471cf++;
        }
        car.var_27abfc12040d5908 = 1;
    }
    car forcenetfieldhighlod(1);
    car setmoveroptimized(1);
    car setmoverantilagged(1);
    car markkeyframedmover();
    elevator.car = car;
    elevator.floors[0] = var_ddf67f48730c77b1[var_d8acb6785f746668];
    elevator.floors[0].var_5dcb93db1678cdaf = 0;
    elevator.floors[0].targetheight = elevator.car.origin[2];
    if (var_ddf67f48730c77b1.size > 1) {
        elevator.floors[1] = var_ddf67f48730c77b1[ter_op(var_d8acb6785f746668 == 0, 1, 0)];
        elevator.floors[1].var_5dcb93db1678cdaf = 1;
        elevator.floors[1].targetheight = elevator.car.origin[2] + elevator.floors[1].var_646b88b6b0468f9[2] - elevator.floors[0].var_646b88b6b0468f9[2];
    }
    elevator.var_33de00df8a9fbbe0 = 0;
    elevator.var_3ead649fc902fec2 = 0;
    level.elevators[level.elevators.size] = elevator;
    return elevator;
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1615
// Size: 0xb
function function_adb18014bbfc01a8() {
    thread onspawnfinished();
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1627
// Size: 0x25
function onspawnfinished() {
    self endon("death_or_disconnect");
    self waittill("giveLoadout");
    if (self.ti_spawn) {
        namespace_272931699e2fe8e9::function_8e2d666b5b0f2bd3();
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1653
// Size: 0x156
function function_5c07037726ae5001(ent) {
    if (!isent(ent)) {
        return;
    }
    if (isarray(self)) {
        foreach (elevator in self) {
            elevator thread function_5c07037726ae5001(ent);
        }
        return;
    }
    level endon("game_ended");
    ent endon("death");
    while (1) {
        if (isdefined(ent)) {
            if (isdefined(self.floors[self.var_33de00df8a9fbbe0].trigger)) {
                self waittill("elevator_doors_unblocking");
                if (!isdefined(ent)) {
                    return;
                }
                if (self.state == "moving") {
                    if (ispointinvolume(ent.origin, self.floors[self.var_3ead649fc902fec2].trigger)) {
                        ent thread [[ ent.var_d1659ed0a33bf98f ]]();
                    }
                }
                if (ispointinvolume(ent.origin, self.floors[self.var_33de00df8a9fbbe0].trigger)) {
                    ent thread [[ ent.var_d1659ed0a33bf98f ]]();
                }
            } else {
                return;
            }
        } else {
            return;
        }
        wait(1);
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b0
// Size: 0x20e
function function_29de8f099a0a63df(ent) {
    if (!isent(ent)) {
        return;
    }
    if (isarray(self)) {
        foreach (elevator in self) {
            elevator thread function_29de8f099a0a63df(ent);
        }
        return;
    }
    level endon("game_ended");
    self endon("disconnect");
    ent endon("death");
    while (1) {
        if (isdefined(ent)) {
            if (isdefined(self.floors[self.var_33de00df8a9fbbe0].trigger)) {
                self waittill("elevator_doors_closing");
                if (!isdefined(ent)) {
                    return;
                }
                if (ispointinvolume(ent.origin, self.floors[self.var_33de00df8a9fbbe0].trigger)) {
                    self.floors[self.var_33de00df8a9fbbe0].var_e7e26d136416c9bc = 1;
                    self.floors[self.var_33de00df8a9fbbe0] notify("player_blocked");
                    self.floors[self.var_33de00df8a9fbbe0] thread function_bd1cd7b7c484f126();
                    wait(0.5);
                    while (self.floors[self.var_33de00df8a9fbbe0].var_e7e26d136416c9bc == 1) {
                        if (!isdefined(ent)) {
                            return;
                        }
                        if (ispointinvolume(ent.origin, self.floors[self.var_33de00df8a9fbbe0].trigger)) {
                            self.floors[self.var_33de00df8a9fbbe0].var_e7e26d136416c9bc = 1;
                            self.floors[self.var_33de00df8a9fbbe0] notify("player_blocked");
                            self.floors[self.var_33de00df8a9fbbe0] thread function_bd1cd7b7c484f126();
                        }
                        wait(0.5);
                    }
                }
            } else {
                break;
            }
        } else {
            break;
        }
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c5
// Size: 0x156
function function_a465aa01fa0187d8(ent) {
    if (!isent(ent)) {
        return;
    }
    if (isarray(self)) {
        foreach (elevator in self) {
            elevator thread function_a465aa01fa0187d8(ent);
        }
        return;
    }
    level endon("game_ended");
    ent endon("death");
    while (1) {
        if (isdefined(ent)) {
            if (isdefined(self.floors[self.var_33de00df8a9fbbe0].trigger)) {
                self waittill("elevator_doors_unblocking");
                if (!isdefined(ent)) {
                    return;
                }
                if (self.state == "moving") {
                    if (ent.collision istouching(self.floors[self.var_3ead649fc902fec2].trigger)) {
                        ent thread [[ ent.var_d1659ed0a33bf98f ]]();
                    }
                }
                if (ent.collision istouching(self.floors[self.var_33de00df8a9fbbe0].trigger)) {
                    ent thread [[ ent.var_d1659ed0a33bf98f ]]();
                }
            } else {
                return;
            }
        } else {
            return;
        }
        wait(1);
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b22
// Size: 0xb1
function function_e7dd97852a7b0baf() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        var_505c75dd826b0f6f = self.trigger waittill("trigger");
        if (istrue(self.elevator.car.var_27abfc12040d5908)) {
            childthread function_e735bb7c91f218c5(var_505c75dd826b0f6f, self.elevator.car);
        }
        if (isplayer(var_505c75dd826b0f6f) || isdefined(var_505c75dd826b0f6f.helperdronetype) || var_505c75dd826b0f6f namespace_1f188a13f7e79610::isvehicle()) {
            self.var_e7e26d136416c9bc = 1;
            self notify("player_blocked");
            thread function_bd1cd7b7c484f126();
        }
        waitframe();
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bda
// Size: 0x27
function function_bd1cd7b7c484f126() {
    self endon("player_blocked");
    wait(0.7);
    if (isdefined(self)) {
        self.var_e7e26d136416c9bc = 0;
        self notify("player_unblocked");
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c08
// Size: 0xe
function function_12e75ac514f84d03() {
    wait(1);
    thread function_580e82173ae3940c();
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1d
// Size: 0x19a
function function_52b0636366efd3e4(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(instance.var_5dcb93db1678cdaf)) {
        if (instance.elevator.var_33de00df8a9fbbe0 == instance.var_5dcb93db1678cdaf) {
            instance.elevator.state = "doors_open";
        } else {
            instance.elevator.var_3ead649fc902fec2 = instance.var_5dcb93db1678cdaf;
        }
        instance.elevator notify("stop_waiting");
        instance.elevator.floors[instance.elevator.var_3ead649fc902fec2] setscriptablepartstate("elevator_ext_button", "disabled");
        if (instance.elevator.var_33de00df8a9fbbe0 > instance.elevator.var_3ead649fc902fec2) {
            instance.elevator.floors[instance.elevator.var_3ead649fc902fec2] setscriptablepartstate("elevator_button_lights", "up");
        } else {
            instance.elevator.floors[instance.elevator.var_3ead649fc902fec2] setscriptablepartstate("elevator_button_lights", "down");
        }
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dbe
// Size: 0xab
function function_d99e32e6787622fe(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(player)) {
        player playsound("mp_elevator_button_press");
    }
    instance.entity.elevator.var_3ead649fc902fec2 = ter_op(instance.entity.elevator.var_33de00df8a9fbbe0 == 0, 1, 0);
    instance.entity.elevator notify("stop_waiting");
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e70
// Size: 0x83
function function_c327c9e30f9df682() {
    foreach (part in self.parts) {
        if (isdefined(part.info)) {
            part.owner = self;
            self.floors[part.var_5dcb93db1678cdaf] = part;
        }
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1efa
// Size: 0x103
function function_3f9f543d197015b3(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(instance.var_5dcb93db1678cdaf)) {
        if (instance.var_5dcb93db1678cdaf == 0) {
            instance.owner.var_3ead649fc902fec2 = ter_op(instance.owner.var_33de00df8a9fbbe0 == 1, 2, 1);
        } else if (instance.owner.var_33de00df8a9fbbe0 == instance.var_5dcb93db1678cdaf) {
            instance.owner.state = "doors_open";
        } else {
            instance.owner.var_3ead649fc902fec2 = instance.var_5dcb93db1678cdaf;
        }
        instance.owner notify("stop_waiting");
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2004
// Size: 0xa1
function function_fea8a1d17e4d669f() {
    foreach (door in self.doors) {
        self.open = 1;
        door.open = 1;
        door setscriptablepartstate("door", "open", 0);
    }
    if (isdefined(self.indicator)) {
        self.indicator setscriptablepartstate("model", "arrived");
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ac
// Size: 0x88
function function_7c2abb1b0d147a89() {
    self.elevator endon("emergency_block");
    foreach (door in self.doors) {
        self.open = 0;
        door.open = 0;
        door setscriptablepartstate("door", "closed", 0);
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213b
// Size: 0x22
function function_580e82173ae3940c() {
    while (1) {
        self [[ level.var_fdd3dff47723be1f[self.state] ]]();
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2164
// Size: 0x63
function function_4497ec9c55f12123() {
    if (self.var_3ead649fc902fec2 != self.var_33de00df8a9fbbe0) {
        if (self.floors[self.var_33de00df8a9fbbe0].open) {
            self.state = "doors_closing";
        } else {
            self.state = "moving";
        }
    } else {
        self waittill("stop_waiting");
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ce
// Size: 0xfc
function function_ec009a967d1d5eb9() {
    self.floors[self.var_33de00df8a9fbbe0] setscriptablepartstate("elevator_ext_button", "disabled");
    self.floors[self.var_33de00df8a9fbbe0] setscriptablepartstate("elevator_button_lights", "off");
    self notify("elevator_doors_unblocking");
    self.floors[self.var_33de00df8a9fbbe0] thread function_fea8a1d17e4d669f();
    self.car setscriptablepartstate("door_sounds", "open");
    if (self.car.var_ef04438af292c145 && self.var_33de00df8a9fbbe0 != 0) {
        self.car thread anim_single_solo(self.car, "open_back");
    } else {
        self.car thread anim_single_solo(self.car, "open");
    }
    wait(5);
    self.state = "waiting";
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d1
// Size: 0x186
function function_8b680b3ef155fc34() {
    self endon("emergency_block");
    self notify("elevator_doors_closing");
    wait(0.01);
    if (self.floors[self.var_33de00df8a9fbbe0].var_e7e26d136416c9bc == 1) {
        thread function_5bfc9aae53c14056();
        self.floors[self.var_33de00df8a9fbbe0] waittill("player_unblocked");
    }
    self notify("elevator_doors_unblocking");
    thread function_f99e0077b2350e7();
    wait(0.01);
    self.car setscriptablepartstate("door_sounds", "close");
    self.floors[self.var_33de00df8a9fbbe0] thread function_7c2abb1b0d147a89();
    if (self.car.var_ef04438af292c145 && self.var_33de00df8a9fbbe0 != 0) {
        str_anim = "close_back";
    } else {
        str_anim = "close";
    }
    self.car thread anim_single_solo(self.car, str_anim);
    var_eca01e2e30413714 = getanimlength(level.scr_anim[self.car.animname][str_anim]);
    self.car waittill_notify_or_timeout(str_anim, var_eca01e2e30413714);
    waitframe();
    waitframe();
    waitframe();
    self notify("elevator_stop_block");
    self notify("elevator_closed");
    self.state = "waiting";
    self.floors[self.var_33de00df8a9fbbe0] setscriptablepartstate("elevator_ext_button", "usable");
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245e
// Size: 0x45b
function function_82893c609a46609() {
    for (i = 0; i < self.floors.size; i++) {
        if (isdefined(self.floors[i].indicator)) {
            if (self.floors[i].var_5dcb93db1678cdaf == self.var_3ead649fc902fec2) {
                if (self.var_33de00df8a9fbbe0 > self.var_3ead649fc902fec2) {
                    self.floors[i].indicator setscriptablepartstate("model", "down");
                } else {
                    self.floors[i].indicator setscriptablepartstate("model", "up");
                }
            } else if (self.floors[i].var_5dcb93db1678cdaf > self.var_3ead649fc902fec2) {
                self.floors[i].indicator setscriptablepartstate("model", "down");
            } else {
                self.floors[i].indicator setscriptablepartstate("model", "up");
            }
        }
    }
    var_811dc7cfcfd29886 = abs(self.floors[self.var_3ead649fc902fec2].targetheight - self.floors[self.var_33de00df8a9fbbe0].targetheight);
    if (isdefined(self.car.n_travel_time)) {
        /#
            assertex(self.car.n_travel_time >= self.car.var_acb6874b16adac5e + self.car.var_23e93511918b6091, "Elevator travel time must be at least " + self.car.var_acb6874b16adac5e + self.car.var_acb6874b16adac5e + ".
");
        #/
        if (self.car.n_travel_time >= self.car.var_acb6874b16adac5e + self.car.var_23e93511918b6091) {
            duration = self.car.n_travel_time;
        }
    }
    if (!isdefined(duration)) {
        duration = max(var_811dc7cfcfd29886 / 150, 4.25);
    }
    foreach (ent in self.car.occupants) {
        if (isplayer(ent) && isalive(ent)) {
            ent thread function_7995b0b9c011087(duration);
        }
    }
    targetpos = (self.car.origin[0], self.car.origin[1], self.floors[self.var_3ead649fc902fec2].targetheight);
    self.car moveto(targetpos, duration, self.car.var_acb6874b16adac5e, self.car.var_23e93511918b6091);
    self.car setscriptablepartstate("elevator_sounds", "on");
    wait(duration);
    self.car setscriptablepartstate("elevator_sounds", "off");
    wait(0.5);
    self.var_33de00df8a9fbbe0 = self.var_3ead649fc902fec2;
    self.state = "doors_open";
    for (i = 0; i < self.floors.size; i++) {
        if (isdefined(self.floors[i].indicator)) {
            if (self.floors[i].var_5dcb93db1678cdaf != self.var_33de00df8a9fbbe0) {
                self.floors[i].indicator setscriptablepartstate("model", "off");
            }
        }
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c0
// Size: 0x2c
function function_7995b0b9c011087(duration) {
    self endon("death_or_disconnect");
    self allowprone(0);
    wait(duration + 0.5);
    self allowprone(1);
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28f3
// Size: 0x6f
function function_f99e0077b2350e7() {
    self endon("elevator_closed");
    self endon("elevator_doors_closing");
    self endon("elevator_stop_block");
    while (1) {
        if (self.floors[self.var_33de00df8a9fbbe0].var_e7e26d136416c9bc == 1) {
            self notify("emergency_block");
            self.state = "doors_open";
            wait(0.025);
            self.state = "doors_closing";
            return;
        }
        waitframe();
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2969
// Size: 0x3f
function function_ef19d9446fc2352(num) {
    return self.floors[num].child.child.child.origin;
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b0
// Size: 0x27
function function_c78df968f4751498() {
    function_bc48943904164e29("elevator_button_floor_01");
    function_bc48943904164e29("elevator_button_floor_02");
    function_bc48943904164e29("elevator_button_00_inside");
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29de
// Size: 0x114
function function_bc48943904164e29(str) {
    var_651616b5a0834bf3 = self.parts[str];
    var_ecfdf8ab3e8be509 = var_651616b5a0834bf3.origin;
    var_f0ad0c6afe8ad911 = var_651616b5a0834bf3.angles + (90, 0, 0);
    button = spawnscriptable("scriptable_test_button", var_ecfdf8ab3e8be509, var_f0ad0c6afe8ad911);
    button.parent = var_651616b5a0834bf3.parent;
    button.child = var_651616b5a0834bf3.child;
    button.originalpos = var_651616b5a0834bf3.originalpos;
    button.info = str;
    button.var_5dcb93db1678cdaf = int(var_651616b5a0834bf3.script_label);
    if (isdefined(var_651616b5a0834bf3.children)) {
        button.children = var_651616b5a0834bf3.children;
    }
    self.parts[str] = button;
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af9
// Size: 0x3cc
function script_model_anims(subtype) {
    level.scr_animtree["elevator"] = %script_model;
    level.scr_anim["elevator"]["close"] = script_model%iw9_elevator_int_door_close;
    level.scr_eventanim["elevator"]["close"] = %"iw9_elevator_int_door_close";
    level.scr_animtree["elevator"] = %script_model;
    level.scr_anim["elevator"]["open"] = script_model%iw9_elevator_int_door_open;
    level.scr_eventanim["elevator"]["open"] = %"iw9_elevator_int_door_open";
    level.scr_animtree["elevator_double"] = %script_model;
    level.scr_anim["elevator_double"]["close"] = script_model%t10_ava_building_elevator_double_int_door_close;
    level.scr_eventanim["elevator_double"]["close"] = %"t10_ava_building_elevator_double_int_door_close";
    level.scr_animtree["elevator_double"] = %script_model;
    level.scr_anim["elevator_double"]["open"] = script_model%t10_ava_building_elevator_double_int_door_open;
    level.scr_eventanim["elevator_double"]["open"] = %"t10_ava_building_elevator_double_int_door_open";
    level.scr_animtree["elevator_double"] = %script_model;
    level.scr_anim["elevator_double"]["close_back"] = script_model%t10_ava_building_elevator_double_int_back_door_close;
    level.scr_eventanim["elevator_double"]["close_back"] = %"t10_ava_building_elevator_double_int_back_door_close";
    level.scr_animtree["elevator_double"] = %script_model;
    level.scr_anim["elevator_double"]["open_back"] = script_model%t10_ava_building_elevator_double_int_back_door_open;
    level.scr_eventanim["elevator_double"]["open_back"] = %"t10_ava_building_elevator_double_int_back_door_open";
    level.scr_animtree["elevator_small"] = %script_model;
    level.scr_anim["elevator_small"]["close"] = script_model%t10_ava_machinery_elevator_sm_01_close;
    level.scr_eventanim["elevator_small"]["close"] = %"t10_ava_machinery_elevator_sm_01_close";
    level.scr_animtree["elevator_small"] = %script_model;
    level.scr_anim["elevator_small"]["open"] = script_model%t10_ava_machinery_elevator_sm_01_open;
    level.scr_eventanim["elevator_small"]["open"] = %"t10_ava_machinery_elevator_sm_01_open";
    level.scr_animtree["elevator_small_double"] = %script_model;
    level.scr_anim["elevator_small_double"]["close"] = script_model%t10_ava_machinery_elevator_dbl_01_front_close;
    level.scr_eventanim["elevator_small_double"]["close"] = %"t10_ava_machinery_elevator_dbl_01_front_close";
    level.scr_animtree["elevator_small_double"] = %script_model;
    level.scr_anim["elevator_small_double"]["open"] = script_model%t10_ava_machinery_elevator_dbl_01_front_open;
    level.scr_eventanim["elevator_small_double"]["open"] = %"t10_ava_machinery_elevator_dbl_01_front_open";
    level.scr_animtree["elevator_small_double"] = %script_model;
    level.scr_anim["elevator_small_double"]["close_back"] = script_model%t10_ava_machinery_elevator_dbl_01_rear_close;
    level.scr_eventanim["elevator_small_double"]["close_back"] = %"t10_ava_machinery_elevator_dbl_01_rear_close";
    level.scr_animtree["elevator_small_double"] = %script_model;
    level.scr_anim["elevator_small_double"]["open_back"] = script_model%t10_ava_machinery_elevator_dbl_01_rear_open;
    level.scr_eventanim["elevator_small_double"]["open_back"] = %"t10_ava_machinery_elevator_dbl_01_rear_open";
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ecc
// Size: 0xd8
function function_e735bb7c91f218c5(var_505c75dd826b0f6f, car) {
    var_505c75dd826b0f6f notify("elevator_occupancy_tracking");
    var_505c75dd826b0f6f endon("elevator_occupancy_tracking");
    var_505c75dd826b0f6f endon("death");
    var_505c75dd826b0f6f endon("disconnect");
    var_8a35f106d988f4d7 = 0.1;
    var_2ed821a1af2d6d99 = 1.5;
    var_91ccf825cd08c4fa = var_2ed821a1af2d6d99;
    var_1da4fdb9cce88177 = 140;
    while (isdefined(var_505c75dd826b0f6f)) {
        car function_e7de8f7b4f13cd26(var_505c75dd826b0f6f, 1);
        while (!var_505c75dd826b0f6f function_8e2d666b5b0f2bd3(car)) {
            wait(var_8a35f106d988f4d7);
            var_91ccf825cd08c4fa = var_91ccf825cd08c4fa - var_8a35f106d988f4d7;
            if (var_91ccf825cd08c4fa < 0) {
                var_91ccf825cd08c4fa = var_2ed821a1af2d6d99;
                if (distance_2d_squared(var_505c75dd826b0f6f.origin, car.origin) > var_1da4fdb9cce88177 * var_1da4fdb9cce88177) {
                    return;
                }
            }
        }
        car function_e7de8f7b4f13cd26(var_505c75dd826b0f6f);
        while (var_505c75dd826b0f6f function_8e2d666b5b0f2bd3(car)) {
            wait(var_8a35f106d988f4d7);
        }
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fab
// Size: 0x5b5
function function_8e2d666b5b0f2bd3(car) {
    if (!isdefined(self) || !isalive(self)) {
        return 0;
    }
    if (!isdefined(level.elevators)) {
        return 0;
    }
    if (!isdefined(car)) {
        var_9c512bd31f6b92d0 = [];
        foreach (elevator in level.elevators) {
            var_9c512bd31f6b92d0[var_9c512bd31f6b92d0.size] = elevator.car;
        }
        car = getclosest(self.origin, var_9c512bd31f6b92d0);
        if (!isdefined(car)) {
            return 0;
        }
    }
    if (!istrue(car.var_27abfc12040d5908)) {
        return 0;
    }
    if (getdvarint(@"hash_24b1d20863cdd66a", 0) == 1) {
        if (isdefined(car.var_7486049051c97774) && ispointinvolume(self.origin, car.var_7486049051c97774)) {
            if (!istrue(self.var_8e2d666b5b0f2bd3)) {
                car function_e7de8f7b4f13cd26(self);
            }
            return 1;
        }
        if (isdefined(car.var_3978e8604d576990)) {
            var_a1582b9803fb64b3 = 16;
            if (self.origin[2] < car.origin[2] - var_a1582b9803fb64b3 && self.origin[2] > car.origin[2] + car.var_98700da2e6c8d502 + var_a1582b9803fb64b3) {
                return 0;
            }
            if (function_cba565314ac6a79e(self.origin, car.var_3978e8604d576990, car.var_3978eb604d577029, car.var_3978ea604d576df6, car.var_3978ed604d57748f)) {
                if (!istrue(self.var_8e2d666b5b0f2bd3)) {
                    car function_e7de8f7b4f13cd26(self);
                }
                return 1;
            }
        }
        return 0;
    } else {
        if (isdefined(car.var_7486049051c97774) && !ispointinvolume(self.origin, car.var_7486049051c97774)) {
            return 0;
        }
        if (isdefined(car.var_3978e8604d576990) && !function_cba565314ac6a79e(self.origin, car.var_3978e8604d576990, car.var_3978eb604d577029, car.var_3978ea604d576df6, car.var_3978ed604d57748f)) {
            return 0;
        }
        var_8e2633c8a746ba9a = 16;
        var_fcf847baec7225bb = car.elevator.floors[0].targetheight - var_8e2633c8a746ba9a;
        var_700c97bb40709445 = car.elevator.floors[1].targetheight + car.var_98700da2e6c8d502 + 5;
        if (self.origin[2] <= car.origin[2] - var_8e2633c8a746ba9a || self.origin[2] >= car.origin[2] + car.var_98700da2e6c8d502) {
            if (self.origin[2] >= var_fcf847baec7225bb && self.origin[2] <= var_700c97bb40709445) {
                var_9d2ccfd4406c98b7 = self.origin;
                var_65a66f89bc16ea1 = (self.origin[0], self.origin[1], car.origin[2]);
                var_65a66f89bc16ea1 = vectorlerp(car.origin, var_65a66f89bc16ea1, 0.85) + (0, 0, var_8e2633c8a746ba9a);
                if (isdefined(car.var_7486049051c97774) && !ispointinvolume(self.origin, car.var_7486049051c97774) || isdefined(car.var_3978e8604d576990) && !function_cba565314ac6a79e(self.origin, car.var_3978e8604d576990, car.var_3978eb604d577029, car.var_3978ea604d576df6, car.var_3978ed604d57748f)) {
                    var_65a66f89bc16ea1 = car.origin + (randomintrange(-48, 48), randomintrange(-48, 48), var_8e2633c8a746ba9a);
                }
                /#
                    print3d(var_9d2ccfd4406c98b7, "Elevator car scriptable(s) not loaded. May need to be precached.", (1, 0.25, 0), 1, 0.25, 1000);
                    line(var_9d2ccfd4406c98b7 + (-4, -4, 0), var_9d2ccfd4406c98b7 + (4, 4, 0), (1, 0.25, 0), 1, 0, 1000);
                    line(var_9d2ccfd4406c98b7 + (-4, 4, 0), var_9d2ccfd4406c98b7 + (4, -4, 0), (1, 0.25, 0), 1, 0, 1000);
                    line(var_65a66f89bc16ea1, var_9d2ccfd4406c98b7, (1, 1, 0), 1, 0, 1000);
                    line(var_65a66f89bc16ea1 + (-4, -4, 0), var_65a66f89bc16ea1 + (4, 4, 0), (0, 1, 1), 1, 0, 1000);
                    line(var_65a66f89bc16ea1 + (-4, 4, 0), var_65a66f89bc16ea1 + (4, -4, 0), (0, 1, 1), 1, 0, 1000);
                    print3d(var_65a66f89bc16ea1, "player_blocked", (0, 1, 1), 1, 0.25, 1000);
                #/
                self setorigin(var_65a66f89bc16ea1);
                return 1;
            }
            return 0;
        }
        if (!istrue(self.var_8e2d666b5b0f2bd3)) {
            car function_e7de8f7b4f13cd26(self);
        }
        return 1;
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3567
// Size: 0xb8
function function_e7de8f7b4f13cd26(occupant, var_65bc331f880e4c49) {
    self.occupants = function_fdc9d5557c53078e(self.occupants);
    if (!isdefined(occupant)) {
        return;
    }
    if (istrue(var_65bc331f880e4c49)) {
        occupant.var_8e2d666b5b0f2bd3 = 0;
        occupant.var_a9f709a20b6aa136 = undefined;
        self.occupants = array_remove(self.occupants, occupant);
    } else {
        thread removeoccupantondeath(occupant);
        occupant.var_8e2d666b5b0f2bd3 = 1;
        occupant.var_a9f709a20b6aa136 = self;
        if (!array_contains(self.occupants, occupant)) {
            self.occupants[self.occupants.size] = occupant;
        }
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3626
// Size: 0x74
function removeoccupantondeath(occupant) {
    occupant notify("removeOccupantOnDeath");
    occupant endon("removeOccupantOnDeath");
    occupant waittill("death_or_disconnect");
    if (isdefined(occupant)) {
        occupant.var_8e2d666b5b0f2bd3 = 0;
        occupant.var_a9f709a20b6aa136 = undefined;
        self.occupants = array_remove(self.occupants, occupant);
    } else {
        self.occupants = array_removeundefined(self.occupants);
    }
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a1
// Size: 0xd3
function function_cba565314ac6a79e(point, var_3978e8604d576990, var_3978eb604d577029, var_3978ea604d576df6, var_3978ed604d57748f) {
    var_3978e8604d576990 = (var_3978e8604d576990[0], var_3978e8604d576990[1], 0);
    var_3978eb604d577029 = (var_3978eb604d577029[0], var_3978eb604d577029[1], 0);
    var_3978ea604d576df6 = (var_3978ea604d576df6[0], var_3978ea604d576df6[1], 0);
    var_3978ed604d57748f = (var_3978ed604d57748f[0], var_3978ed604d57748f[1], 0);
    point = (point[0], point[1], 0);
    center = vectorlerp(var_3978e8604d576990, var_3978ea604d576df6, 0.5);
    var_8999387886088d53 = pointonsegmentnearesttopoint(var_3978e8604d576990, var_3978eb604d577029, point);
    var_899d5f78860cd8ef = pointonsegmentnearesttopoint(var_3978eb604d577029, var_3978ea604d576df6, point);
    if (distance_2d_squared(center, point) <= distance_2d_squared(center, var_8999387886088d53) && distance_2d_squared(center, point) <= distance_2d_squared(center, var_899d5f78860cd8ef)) {
        return 1;
    }
    return 0;
}

// Namespace elevators/namespace_272931699e2fe8e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377c
// Size: 0x7a
function function_5bfc9aae53c14056() {
    level endon("game_ended");
    self endon("elevator_doors_closing");
    self endon("disconnect");
    while (self.floors[self.var_33de00df8a9fbbe0].var_e7e26d136416c9bc == 1) {
        self.car playsound("mp_elevator_open");
        if (self.floors[self.var_33de00df8a9fbbe0].var_e7e26d136416c9bc == 0) {
            break;
        }
        wait(3);
    }
}

