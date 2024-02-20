// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;

#namespace namespace_a570a67947f18a4d;

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58f
// Size: 0x999
function function_d8de1e0bc05f3b3a(var_1b64869207d9f98f) {
    level.elevators = [];
    level.var_fdd3dff47723be1f = [];
    level.var_40e610580f1cbaf8 = [];
    level.var_52b8e16bc0cd79d6 = 0;
    function_38338a9a033e68a3();
    var_40e610580f1cbaf8 = getentitylessscriptablearray("elevator_stop", "script_noteworthy");
    var_ab337e7f8a1fa44a = [];
    foreach (stop in var_40e610580f1cbaf8) {
        var_68333dfc5840cbd8 = stop.origin[0] + "," + stop.origin[1];
        if (!isdefined(var_ab337e7f8a1fa44a[var_68333dfc5840cbd8])) {
            var_ab337e7f8a1fa44a[var_68333dfc5840cbd8] = [];
        }
        var_ab337e7f8a1fa44a[var_68333dfc5840cbd8][var_ab337e7f8a1fa44a[var_68333dfc5840cbd8].size] = stop;
        stop.open = 0;
        var_a4de0bb1cfaf96e8 = getentitylessscriptablearray(stop.target, "targetname");
        stop.indicator = var_a4de0bb1cfaf96e8[0];
        var_bd440a13487263ef = getstruct(stop.indicator.target, "targetname");
        stop.var_bd440a13487263ef = var_bd440a13487263ef.origin;
        stop.doors = getentitylessscriptablearray(stop.indicator.target, "targetname");
        stop.var_90dabe3606074803 = getent(stop.target, "targetname");
        if (level.mapname == "mp_biobunker" && isdefined(stop.script_linkname) && isendstr(stop.script_linkname, "elevator_50")) {
            stop.var_bd440a13487263ef = (-15049, 7096, 1660);
        }
        var_6073fe6ff110d6a8 = getentarray(stop.indicator.target, "targetname");
        foreach (targetent in var_6073fe6ff110d6a8) {
            if (targetent.classname == "script_brushmodel") {
                stop.aiclip = targetent;
            } else if (targetent.classname == "info_volume") {
                stop.var_907e66d3bf42c5a = targetent;
            }
        }
        foreach (door in stop.doors) {
            door.open = 0;
            door.clip = getent(door.target, "targetname");
            door.clip.var_f16d407674809f11 = door.clip.origin;
            var_e84c9e6b1231bf18 = getstruct(door.clip.target, "targetname");
            door.clip.var_c2fac7a209524732 = var_e84c9e6b1231bf18.origin;
            if (isdefined(var_e84c9e6b1231bf18.target) && var_e84c9e6b1231bf18.target != "") {
                bulletclip = getent(var_e84c9e6b1231bf18.target, "targetname");
                door.bulletclip = bulletclip;
            }
        }
        stop.var_ce7f7e62df1e0b51 = getstruct(stop.target, "targetname");
    }
    var_9c512bd31f6b92d0 = getstructarray("elevator_car", "script_noteworthy");
    foreach (var_ddf67f48730c77b1 in var_ab337e7f8a1fa44a) {
        elevator = spawnstruct();
        elevator.parts = [];
        elevator.floors = [];
        group = "elevator_group_free";
        elevator.group = group;
        var_d8acb6785f746668 = 0;
        foreach (stop in var_ddf67f48730c77b1) {
            stop.elevator = elevator;
        }
        var_8518fdd0909b90fd = var_ddf67f48730c77b1[var_d8acb6785f746668].origin;
        mindist = undefined;
        var_21efbd9501c439ba = undefined;
        foreach (car in var_9c512bd31f6b92d0) {
            dist = distancesquared(car.origin, var_8518fdd0909b90fd);
            if (!isdefined(mindist) || mindist > dist) {
                mindist = dist;
                var_21efbd9501c439ba = car;
            }
        }
        car = spawn("script_model", var_21efbd9501c439ba.origin);
        car.angles = var_21efbd9501c439ba.angles;
        switch (level.mapname) {
        case #"hash_721bd15904e6ff51":
            car setmodel("building_biolabs_elevator_set_int");
            break;
        case #"hash_5d52d1f62d321d14":
            car setmodel("building_biobunker_elevator_car_frame_one_way");
            break;
        default:
            car setmodel("building_biolabs_elevator_set_int");
            break;
        }
        car.animname = "elevator";
        car setanimtree();
        car.elevator = elevator;
        car.moverdoesnotkill = 1;
        elevator.car = car;
        var_3b8c6779206fb1de = array_sort_with_func(var_ddf67f48730c77b1, &function_90e407ac8f409ccd);
        for (i = 0; i < var_3b8c6779206fb1de.size; i++) {
            elevator.floors[i] = var_3b8c6779206fb1de[i];
            elevator.floors[i].var_5dcb93db1678cdaf = i;
            if (i > 0) {
                elevator.floors[i].targetheight = elevator.floors[i].origin[2] - elevator.floors[i - 1].origin[2] + elevator.floors[i - 1].targetheight;
            } else {
                elevator.floors[i].targetheight = elevator.car.origin[2];
            }
            elevator.floors[i].elevator = elevator;
            elevator.floors[i].floor = i;
            var_95459826ae7a2253 = (elevator.car.origin[0], elevator.car.origin[1], elevator.floors[i].targetheight);
            var_6485cb51eb50dc9b = function_135de56d99fc05b8(var_95459826ae7a2253);
            elevator.floors[i].var_6485cb51eb50dc9b = ter_op(isdefined(var_6485cb51eb50dc9b), var_6485cb51eb50dc9b, i);
            var_32e27ad06c3e7804 = function_c10ff09314e3f687(var_ddf67f48730c77b1[i]);
            if (!isdefined(var_32e27ad06c3e7804)) {
                level.var_52b8e16bc0cd79d6++;
                var_32e27ad06c3e7804 = "unAuthorized_stop_" + level.var_52b8e16bc0cd79d6;
            }
            elevator.floors[i].var_32e27ad06c3e7804 = var_32e27ad06c3e7804;
            level.var_40e610580f1cbaf8[var_32e27ad06c3e7804] = elevator.floors[i];
        }
        elevator.id = elevator.floors[0].var_32e27ad06c3e7804;
        elevator.var_33de00df8a9fbbe0 = 0;
        elevator.var_3ead649fc902fec2 = 0;
        if (!isdefined(level.elevators[group])) {
            level.elevators[group] = [];
        }
        level.elevators[group][level.elevators[group].size] = elevator;
    }
    level.var_dd26b041c74afbd0 = [];
    level.var_a6c231ab0b186cd7 = [];
    level.var_d4f835afc5b8309b = [];
    level thread function_963fc4c3b794e7f0();
    level thread function_9003bd09b085a887();
    level.var_b212a36bec6cf8da = 1;
    if (isdefined(var_1b64869207d9f98f)) {
        function_67e7f45e112e77f2(var_1b64869207d9f98f);
    }
    /#
        level thread function_cb2806ac4b115c70();
    #/
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2f
// Size: 0x31
function function_90e407ac8f409ccd(target1, target2) {
    return target1.origin[2] < target2.origin[2];
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x47
function function_298651e30e37ad6a(node1, node2) {
    return distancesquared(node1.origin, self.origin) < distancesquared(node2.origin, self.origin);
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb7
// Size: 0x47
function function_ba13d98dab57ca7e(group, state, func) {
    if (!isdefined(level.var_fdd3dff47723be1f[group])) {
        level.var_fdd3dff47723be1f[group] = [];
    }
    level.var_fdd3dff47723be1f[group][state] = func;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1005
// Size: 0xd5
function function_8435b8855414bb47(owner, group, state, var_9b553bb5e16ef3ff, var_476fdbc4f0d1ef0a, floors, var_6e7276b7516d41da, var_fd5c5e2ffb3b1d08) {
    var_4087e8c204288c38 = spawnstruct();
    var_4087e8c204288c38.owner = owner;
    var_4087e8c204288c38.group = group;
    var_4087e8c204288c38.state = state;
    var_4087e8c204288c38.var_9b553bb5e16ef3ff = var_9b553bb5e16ef3ff;
    var_4087e8c204288c38.var_476fdbc4f0d1ef0a = var_476fdbc4f0d1ef0a;
    var_4087e8c204288c38.var_6b8d91134acb6b09 = floors;
    var_4087e8c204288c38.var_6e7276b7516d41da = var_6e7276b7516d41da;
    var_4087e8c204288c38.var_fd5c5e2ffb3b1d08 = var_fd5c5e2ffb3b1d08;
    level.var_a6c231ab0b186cd7[level.var_a6c231ab0b186cd7.size] = var_4087e8c204288c38;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10e1
// Size: 0xba
function function_20e0f2f56a5ba71f(owner, group, state, id, var_6e7276b7516d41da, var_fd5c5e2ffb3b1d08) {
    var_4087e8c204288c38 = spawnstruct();
    var_4087e8c204288c38.owner = owner;
    var_4087e8c204288c38.group = group;
    var_4087e8c204288c38.state = state;
    var_4087e8c204288c38.var_476fdbc4f0d1ef0a = "elevator_pick_rule_id";
    var_4087e8c204288c38.id = id;
    var_4087e8c204288c38.var_6e7276b7516d41da = var_6e7276b7516d41da;
    var_4087e8c204288c38.var_fd5c5e2ffb3b1d08 = var_fd5c5e2ffb3b1d08;
    level.var_a6c231ab0b186cd7[level.var_a6c231ab0b186cd7.size] = var_4087e8c204288c38;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a2
// Size: 0x69
function function_92beb6591366ab26(owner, group, state, var_9b553bb5e16ef3ff, var_476fdbc4f0d1ef0a) {
    elevator = undefined;
    switch (var_476fdbc4f0d1ef0a) {
    case #"hash_a30cdbeb79218fc6":
        elevator = function_7bee30545564f6d2(var_9b553bb5e16ef3ff);
        break;
    }
    if (isdefined(elevator)) {
        elevator function_8051ba8f94fdcb81(group, state);
    }
    return elevator;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1213
// Size: 0x35
function function_fa81150e9ada1f6a(var_5dcb93db1678cdaf) {
    if (!array_contains(level.var_d4f835afc5b8309b, var_5dcb93db1678cdaf)) {
        level.var_d4f835afc5b8309b[level.var_d4f835afc5b8309b.size] = var_5dcb93db1678cdaf;
    }
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124f
// Size: 0x23
function function_e81853b8e49151ba(var_5dcb93db1678cdaf) {
    if (!isdefined(var_5dcb93db1678cdaf)) {
        return 0;
    }
    return array_contains(level.var_d4f835afc5b8309b, var_5dcb93db1678cdaf);
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127a
// Size: 0x26
function function_135de56d99fc05b8(origin) {
    if (isdefined(level.var_172e4b629498723c)) {
        return [[ level.var_172e4b629498723c ]](origin);
    }
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a7
// Size: 0x81
function function_c10ff09314e3f687(var_d54026d89e48a921) {
    if (isdefined(var_d54026d89e48a921.script_linkname)) {
        var_4025b91fa50c1ea7 = strtok(var_d54026d89e48a921.script_linkname, "_");
        if (isdefined(var_4025b91fa50c1ea7) && var_4025b91fa50c1ea7.size > 0) {
            var_32e27ad06c3e7804 = var_4025b91fa50c1ea7[1];
            for (i = 2; i < var_4025b91fa50c1ea7.size; i++) {
                var_32e27ad06c3e7804 = var_32e27ad06c3e7804 + "_" + var_4025b91fa50c1ea7[i];
            }
            return var_32e27ad06c3e7804;
        }
    }
    return undefined;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1330
// Size: 0x98
function function_9003bd09b085a887() {
    level endon("game_ended");
    level waittill("matchStartTimer_done");
    foreach (elevator in level.elevators["elevator_group_free"]) {
        var_db76c4bb596d090e = elevator.floors[elevator.var_33de00df8a9fbbe0];
        var_db76c4bb596d090e.aiclip disconnectpaths();
    }
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13cf
// Size: 0x245
function function_963fc4c3b794e7f0() {
    level endon("game_ended");
    var_34901859711436c9 = 0;
    while (1) {
        for (i = 0; i < level.var_a6c231ab0b186cd7.size; i++) {
            if (level.elevators["elevator_group_free"].size > 0) {
                elevator = undefined;
                request = level.var_a6c231ab0b186cd7[i];
                switch (request.var_476fdbc4f0d1ef0a) {
                case #"hash_fba835080c4a6b66":
                    elevator = function_7ea9434601358283();
                    break;
                case #"hash_597ee058566f8b00":
                    /#
                        assert(isdefined(request.owner), "elevator_pick_rule_random_exclude_picked" + " need a owner to record picked info");
                    #/
                    elevator = function_2ddb2d81ee6055ce(request.owner);
                    break;
                case #"hash_a510ae28921a5f2":
                    /#
                        assert(isdefined(request.owner) && isarray(request.var_6b8d91134acb6b09), "elevator_pick_rule_random_exclude_picked_on_specify_floors" + " need a owner and idealFloors to record picked info");
                    #/
                    elevator = function_2ddb2d81ee6055ce(request.owner, request.var_6b8d91134acb6b09);
                    break;
                case #"hash_a30cdbeb79218fc6":
                    /#
                        assert(isdefined(request.var_9b553bb5e16ef3ff), "elevator_pick_rule_ideal" + " need a callOrigin to pick a elevator");
                    #/
                    elevator = function_7bee30545564f6d2(request.var_9b553bb5e16ef3ff);
                    break;
                case #"hash_db4c90c3bb8c6cbc":
                    /#
                        assert(isdefined(request.id), "elevator_pick_rule_id" + " need a id to pick a elevator");
                    #/
                    elevator = function_ac05b2a25b870e68(request.id);
                    break;
                }
                if (isdefined(elevator)) {
                    if (isdefined(request.var_6e7276b7516d41da)) {
                        level thread [[ request.var_6e7276b7516d41da ]](elevator, request.var_fd5c5e2ffb3b1d08);
                    }
                    elevator function_8051ba8f94fdcb81(request.group, request.state);
                    level.var_a6c231ab0b186cd7[i] = undefined;
                    var_34901859711436c9 = 1;
                }
            }
        }
        if (istrue(var_34901859711436c9)) {
            level.var_a6c231ab0b186cd7 = array_removeundefined(level.var_a6c231ab0b186cd7);
            var_34901859711436c9 = 0;
        }
        waitframe();
    }
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161b
// Size: 0x141
function function_67e7f45e112e77f2(table) {
    var_8f117d9581995c82 = 0;
    var_bbe34f2ccae3241c = 1;
    numrows = 0;
    if (tableexists(table)) {
        numrows = tablelookupgetnumrows(table);
    } else {
        /#
            assertmsg(table + " doesn't exist");
        #/
        return;
    }
    level.var_6fdfdc44a9268868 = [];
    for (i = 0; i < numrows; i++) {
        var_60e5f351e61fadfd = spawnstruct();
        var_22bcd0fb063692b5 = tablelookupbyrow(table, i, var_8f117d9581995c82);
        var_7c4e2c6a50914434 = strtok(var_22bcd0fb063692b5, ", ");
        var_8518fdd0909b90fd = (float(var_7c4e2c6a50914434[0]), float(var_7c4e2c6a50914434[1]), float(var_7c4e2c6a50914434[2]));
        var_60e5f351e61fadfd.origin = var_8518fdd0909b90fd;
        var_60e5f351e61fadfd.enable = 1;
        var_474cb0ec00d51c72 = tablelookupbyrow(table, i, var_bbe34f2ccae3241c);
        var_975cc022038f8367 = strtok(var_474cb0ec00d51c72, ", ");
        var_60e5f351e61fadfd.var_5a5caa498b10d837 = var_975cc022038f8367;
        level.var_6fdfdc44a9268868[i] = var_60e5f351e61fadfd;
    }
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1763
// Size: 0x5a
function function_7ea9434601358283() {
    elevator = function_7a2aaa4a09a4d250(level.elevators["elevator_group_free"]);
    if (isdefined(elevator)) {
        if (elevator.floors.size > 1) {
            elevator.var_3ead649fc902fec2 = function_7a2aaa4a09a4d250(elevator.floors);
        }
        return elevator;
    }
    return undefined;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c5
// Size: 0x18e
function function_7bee30545564f6d2(var_9b553bb5e16ef3ff) {
    if (!isdefined(level.var_6fdfdc44a9268868) || level.var_6fdfdc44a9268868.size == 0) {
        /#
            assertmsg(" Elevator priority lists don't exist, this might be caused by parsing priority table failed");
        #/
        return undefined;
    }
    var_b7c2ead7f1429b4a = spawnstruct();
    var_b7c2ead7f1429b4a.origin = var_9b553bb5e16ef3ff;
    var_2621d6d616a10f79 = var_b7c2ead7f1429b4a array_sort_with_func(level.var_6fdfdc44a9268868, &function_298651e30e37ad6a);
    var_57cda711a1d5019b = [];
    foreach (node in var_2621d6d616a10f79) {
        if (istrue(node.enable)) {
            var_57cda711a1d5019b = node.var_5a5caa498b10d837;
            break;
        }
    }
    foreach (var_32e27ad06c3e7804 in var_57cda711a1d5019b) {
        stop = level.var_40e610580f1cbaf8[var_32e27ad06c3e7804];
        elevator = function_ac05b2a25b870e68(var_32e27ad06c3e7804);
        if (isdefined(elevator)) {
            reachable = 1;
            if (isdefined(level.var_6d879681512cd627)) {
                reachable = [[ level.var_6d879681512cd627 ]](stop, var_9b553bb5e16ef3ff);
            }
            if (reachable) {
                return elevator;
            }
        }
    }
    return undefined;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195b
// Size: 0x6e
function function_ac05b2a25b870e68(var_32e27ad06c3e7804) {
    stop = level.var_40e610580f1cbaf8[var_32e27ad06c3e7804];
    if (stop.elevator.group == "elevator_group_free") {
        stop.elevator.var_3ead649fc902fec2 = stop.floor;
        return stop.elevator;
    }
    return undefined;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d1
// Size: 0x21
function function_b7ee067fa2ed527d(var_32e27ad06c3e7804) {
    return level.var_40e610580f1cbaf8[var_32e27ad06c3e7804].elevator;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19fa
// Size: 0x17
function function_ea03313f519b9e06(group) {
    return level.elevators[group];
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a19
// Size: 0x17
function function_e8f746dfa279cefd(var_32e27ad06c3e7804) {
    return level.var_40e610580f1cbaf8[var_32e27ad06c3e7804];
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a38
// Size: 0x11b
function function_e273ac02f95d54e5(owner, var_631b0d2882d5d238) {
    foreach (var_6485cb51eb50dc9b in var_631b0d2882d5d238) {
        foreach (stop in level.var_40e610580f1cbaf8) {
            if (var_6485cb51eb50dc9b == stop.var_6485cb51eb50dc9b) {
                var_e3baffc8f1c9431b = stop.elevator;
                var_552b12dd61440b65 = level.var_dd26b041c74afbd0[owner][var_e3baffc8f1c9431b.id];
                if (!isdefined(var_552b12dd61440b65) || array_contains(var_552b12dd61440b65.var_9de3aec35059fb4b, stop.floor)) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5b
// Size: 0x3b0
function function_2ddb2d81ee6055ce(owner, var_631b0d2882d5d238) {
    /#
        assertex(isdefined(owner), "Must have an owner to store picked information");
    #/
    if (!isdefined(level.var_dd26b041c74afbd0[owner])) {
        level.var_dd26b041c74afbd0[owner] = [];
    }
    var_133738871e398cf3 = [];
    if (!isdefined(var_631b0d2882d5d238)) {
        var_133738871e398cf3 = level.var_d4f835afc5b8309b;
    } else if (isarray(var_631b0d2882d5d238)) {
        foreach (var_6485cb51eb50dc9b in var_631b0d2882d5d238) {
            if (function_e81853b8e49151ba(var_6485cb51eb50dc9b)) {
                var_133738871e398cf3[var_133738871e398cf3.size] = var_6485cb51eb50dc9b;
            }
        }
    } else {
        /#
            assert(" floors should be an array");
        #/
        return undefined;
    }
    if (var_133738871e398cf3.size == 0) {
        return undefined;
    }
    var_95cf8c20b345e817 = [];
    foreach (elevator in level.elevators["elevator_group_free"]) {
        var_e36e2b32136a86fe = undefined;
        var_552b12dd61440b65 = level.var_dd26b041c74afbd0[owner][elevator.id];
        if (!isdefined(var_552b12dd61440b65)) {
            for (i = 0; i < elevator.floors.size; i++) {
                var_6485cb51eb50dc9b = elevator.floors[i].var_6485cb51eb50dc9b;
                if (array_contains(var_133738871e398cf3, var_6485cb51eb50dc9b)) {
                    if (!isdefined(var_e36e2b32136a86fe)) {
                        var_e36e2b32136a86fe = spawnstruct();
                        var_e36e2b32136a86fe.var_96d5ebb0b818388c = [];
                        var_e36e2b32136a86fe.elevator = elevator;
                        var_95cf8c20b345e817[var_95cf8c20b345e817.size] = var_e36e2b32136a86fe;
                    }
                    var_e36e2b32136a86fe.var_96d5ebb0b818388c[var_e36e2b32136a86fe.var_96d5ebb0b818388c.size] = i;
                }
            }
        } else if (var_552b12dd61440b65.var_9de3aec35059fb4b.size > 0) {
            for (i = 0; i < var_552b12dd61440b65.var_9de3aec35059fb4b.size; i++) {
                var_6485cb51eb50dc9b = elevator.floors[var_552b12dd61440b65.var_9de3aec35059fb4b[i]].var_6485cb51eb50dc9b;
                if (array_contains(var_133738871e398cf3, var_6485cb51eb50dc9b)) {
                    if (!isdefined(var_e36e2b32136a86fe)) {
                        var_e36e2b32136a86fe = spawnstruct();
                        var_e36e2b32136a86fe.var_96d5ebb0b818388c = [];
                        var_e36e2b32136a86fe.elevator = elevator;
                        var_95cf8c20b345e817[var_95cf8c20b345e817.size] = var_e36e2b32136a86fe;
                    }
                    var_e36e2b32136a86fe.var_96d5ebb0b818388c[var_e36e2b32136a86fe.var_96d5ebb0b818388c.size] = var_552b12dd61440b65.var_9de3aec35059fb4b[i];
                }
            }
        }
    }
    if (var_95cf8c20b345e817.size == 0) {
        return undefined;
    }
    var_c814db13c0abc6ab = var_95cf8c20b345e817[randomint(var_95cf8c20b345e817.size)];
    elevator = var_c814db13c0abc6ab.elevator;
    var_96d5ebb0b818388c = var_c814db13c0abc6ab.var_96d5ebb0b818388c;
    var_552b12dd61440b65 = level.var_dd26b041c74afbd0[owner][elevator.id];
    if (!isdefined(var_552b12dd61440b65)) {
        var_552b12dd61440b65 = spawnstruct();
        var_552b12dd61440b65.var_9de3aec35059fb4b = [];
        for (i = 0; i < elevator.floors.size; i++) {
            var_552b12dd61440b65.var_9de3aec35059fb4b[i] = i;
        }
    }
    elevator.var_3ead649fc902fec2 = function_7a2aaa4a09a4d250(var_96d5ebb0b818388c);
    var_552b12dd61440b65.var_9de3aec35059fb4b = array_remove(var_552b12dd61440b65.var_9de3aec35059fb4b, elevator.var_3ead649fc902fec2);
    level.var_dd26b041c74afbd0[owner][elevator.id] = var_552b12dd61440b65;
    return elevator;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f13
// Size: 0xb9
function function_8051ba8f94fdcb81(group, state) {
    /#
        assert(group != "elevator_group_free" && group != self.group, "Invalid group for this elevator");
    #/
    level.elevators[self.group] = array_remove(level.elevators[self.group], self);
    self.group = group;
    self.state = state;
    if (!isdefined(level.elevators[group])) {
        level.elevators[group] = [];
    }
    level.elevators[group][level.elevators[group].size] = self;
    waitframe();
    thread function_580e82173ae3940c();
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd3
// Size: 0x77
function function_1526944ef1762358() {
    level.elevators[self.group] = array_remove(level.elevators[self.group], self);
    self.group = "elevator_group_free";
    self.state = "";
    level.elevators["elevator_group_free"][level.elevators["elevator_group_free"].size] = self;
    self notify("elevator_release");
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2051
// Size: 0x195
function function_580e82173ae3940c() {
    level endon("game_ended");
    self endon("elevator_release");
    while (1) {
        var_d1da69720dec3c33 = 1;
        if (!isdefined(self.group)) {
            var_d1da69720dec3c33 = 0;
            logstring(self.id + " Group is undefined for this elevator");
        }
        if (var_d1da69720dec3c33 && !isdefined(level.var_fdd3dff47723be1f[self.group])) {
            var_d1da69720dec3c33 = 0;
            logstring(self.id + " Group " + self.group + " has not registered FSM yet");
        }
        if (var_d1da69720dec3c33 && !isdefined(self.state)) {
            var_d1da69720dec3c33 = 0;
            logstring(self.id + " State is undefined for this elevator in Group: " + self.group);
        }
        if (var_d1da69720dec3c33 && !isdefined(level.var_fdd3dff47723be1f[self.group][self.state])) {
            var_d1da69720dec3c33 = 0;
            logstring(self.id + " State " + self.state + " has not been registered FSM to Group: " + self.group);
        }
        if (var_d1da69720dec3c33) {
            logstring("===============  Elevator FSM Log  ===============");
            logstring("Elevator Id: " + self.id);
            logstring("Group: " + self.group);
            logstring("State: " + self.state);
            logstring("===============  Elevator FSM Log End  ===============");
        }
        self [[ level.var_fdd3dff47723be1f[self.group][self.state] ]]();
    }
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21ed
// Size: 0xc0
function function_ab1c91150c30299a() {
    duration = self.var_3ead649fc902fec2 - self.var_33de00df8a9fbbe0;
    duration = ter_op(duration >= 0, duration, self.var_33de00df8a9fbbe0 - self.var_3ead649fc902fec2);
    if (duration != 0) {
        function_26adb9abdd954d53("reinforcement_closed");
        self.car moveto((self.car.origin[0], self.car.origin[1], self.floors[self.var_3ead649fc902fec2].targetheight), duration);
        wait(duration);
        waitframe();
    }
    self.var_33de00df8a9fbbe0 = self.var_3ead649fc902fec2;
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22b4
// Size: 0x14f
function function_fea8a1d17e4d669f() {
    foreach (door in self.doors) {
        door setscriptablepartstate("door", "open", 0);
    }
    wait(2);
    foreach (door in self.doors) {
        door.state = door getscriptablepartstate("door");
    }
    /#
        println(" doesn't exist" + self.elevator.id + "script_model" + self.elevator.var_33de00df8a9fbbe0 + "<unknown string>" + self.elevator.var_3ead649fc902fec2 + "<unknown string>" + self.doors[0].state + "<unknown string>" + self.doors[1].state);
    #/
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240a
// Size: 0x14f
function function_7c2abb1b0d147a89() {
    foreach (door in self.doors) {
        door setscriptablepartstate("door", "closed", 0);
    }
    wait(2);
    foreach (door in self.doors) {
        door.state = door getscriptablepartstate("door");
    }
    /#
        println("<unknown string>" + self.elevator.id + "script_model" + self.elevator.var_33de00df8a9fbbe0 + "<unknown string>" + self.elevator.var_3ead649fc902fec2 + "<unknown string>" + self.doors[0].state + "<unknown string>" + self.doors[1].state);
    #/
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2560
// Size: 0x14f
function function_88c392696fd02dc4() {
    foreach (door in self.doors) {
        door setscriptablepartstate("door", "reinforcement_open", 0);
    }
    wait(2);
    foreach (door in self.doors) {
        door.state = door getscriptablepartstate("door");
    }
    /#
        println("<unknown string>" + self.elevator.id + "script_model" + self.elevator.var_33de00df8a9fbbe0 + "<unknown string>" + self.elevator.var_3ead649fc902fec2 + "<unknown string>" + self.doors[0].state + "<unknown string>" + self.doors[1].state);
    #/
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b6
// Size: 0x14f
function function_d32c693d3a04f8f8() {
    foreach (door in self.doors) {
        door setscriptablepartstate("door", "reinforcement_closed", 0);
    }
    wait(2);
    foreach (door in self.doors) {
        door.state = door getscriptablepartstate("door");
    }
    /#
        println("<unknown string>" + self.elevator.id + "script_model" + self.elevator.var_33de00df8a9fbbe0 + "<unknown string>" + self.elevator.var_3ead649fc902fec2 + "<unknown string>" + self.doors[0].state + "<unknown string>" + self.doors[1].state);
    #/
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280c
// Size: 0xb7
function function_26adb9abdd954d53(var_d2023e6f2e483030) {
    foreach (floor in self.floors) {
        foreach (door in floor.doors) {
            door setscriptablepartstate("door", var_d2023e6f2e483030, 0);
        }
    }
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ca
// Size: 0xa3
function function_38338a9a033e68a3() {
    level.scr_animtree["elevator"] = %script_model;
    level.scr_anim["elevator"]["close"] = script_model%iw9_elevator_int_door_close;
    level.scr_eventanim["elevator"]["close"] = %"iw9_elevator_int_door_close";
    level.scr_animtree["elevator"] = %script_model;
    level.scr_anim["elevator"]["open"] = script_model%iw9_elevator_int_door_open;
    level.scr_eventanim["elevator"]["open"] = %"iw9_elevator_int_door_open";
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2974
// Size: 0x32
function function_cb2806ac4b115c70() {
    /#
        level waittill("<unknown string>");
        level thread function_af5ba99924c0d3d6(@"hash_b4957f27fef0ad51");
        level thread function_84d0ae2111fcc4be(@"hash_7f3c55bc1b0ba1dd");
    #/
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29ad
// Size: 0x24f
function function_af5ba99924c0d3d6(dvarname) {
    /#
        level endon("<unknown string>");
        setdevdvarifuninitialized(dvarname, 0);
        var_2193ee1cb4487092 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"];
        var_26af4f7e687bacaf = [];
        var_26af4f7e687bacaf["<unknown string>"] = (0, 1, 0);
        var_26af4f7e687bacaf["<unknown string>"] = (1, 0, 0);
        var_26af4f7e687bacaf["<unknown string>"] = (1, 1, 0);
        var_26af4f7e687bacaf["<unknown string>"] = (0, 0, 1);
        var_58e7b7390381f53b = 64;
        while (1) {
            shoulddraw = getdvarint(dvarname);
            if (shoulddraw == 1) {
                foreach (group in var_2193ee1cb4487092) {
                    if (isdefined(level.elevators[group])) {
                        foreach (elevator in level.elevators[group]) {
                            foreach (floor in elevator.floors) {
                                sphere(floor.origin, var_58e7b7390381f53b, var_26af4f7e687bacaf[group]);
                            }
                            sphere(elevator.car.origin, 16, (1, 0, 1));
                            debugstar(elevator.car.origin, (1, 0, 1), 1, elevator.id, 0.8);
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_a570a67947f18a4d/namespace_2067e9d40332bfec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c03
// Size: 0xc6
function function_84d0ae2111fcc4be(dvarname) {
    /#
        level endon("<unknown string>");
        setdevdvarifuninitialized(dvarname, 0);
        var_58e7b7390381f53b = 32;
        var_a573ceab7ce7a507 = (1, 1, 1);
        while (1) {
            shoulddraw = getdvarint(dvarname);
            if (shoulddraw == 1) {
                foreach (list in level.var_6fdfdc44a9268868) {
                    sphere(list.origin, var_58e7b7390381f53b, var_a573ceab7ce7a507);
                }
            }
            waitframe();
        }
    #/
}

