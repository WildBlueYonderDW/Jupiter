#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\sp\utility.gsc;

#namespace objectives;

// Namespace objectives / scripts\engine\sp\objectives
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9
// Size: 0x13e
function objective_add(objectivename, objstate, var_1cc0d51c86bc4411, var_2215eeb563f7a3b8, var_f34635b53accbcac, var_c6caf52c65d084b8, var_14847a630d9835af, var_780b9710a4c60f44, var_d54b9310847f6bf4, var_2f87f92eb31189cc, var_2431ebabbcc67a2c, var_c13020776c269a42, var_d85ab98698be6559) {
    _objective_validatename(objectivename);
    _objective_initindexforname(objectivename);
    objective_update(objectivename, objstate, var_1cc0d51c86bc4411, var_2215eeb563f7a3b8, var_f34635b53accbcac, var_c6caf52c65d084b8, var_14847a630d9835af, var_780b9710a4c60f44, var_d54b9310847f6bf4, var_2431ebabbcc67a2c);
    var_2f87f92eb31189cc = default_to(var_2f87f92eb31189cc, 1);
    if (istrue(var_2f87f92eb31189cc) && isdefined(var_2215eeb563f7a3b8) && isdefined(level.var_b9eee5bad6ec9bcd) && isdefined(level.var_b9eee5bad6ec9bcd.callback)) {
        var_ccdb2090b09c435d = 0;
        var_71bb4595bfba1caf = 0;
        level.player [[ level.var_b9eee5bad6ec9bcd.callback ]](objectivename, var_2215eeb563f7a3b8, var_ccdb2090b09c435d, var_71bb4595bfba1caf, var_d85ab98698be6559);
    }
    var_c13020776c269a42 = default_to(var_c13020776c269a42, 0);
    if (istrue(var_c13020776c269a42)) {
        objectiveindex = _objective_getindexforname(objectivename);
        function_5fd2627c5ce186db(objectiveindex, var_c13020776c269a42);
    }
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62f
// Size: 0x33
function function_1a7f32a7c56ad4e0(var_6a210f4755586405) {
    assert(isdefined(level.var_b9eee5bad6ec9bcd));
    level.var_b9eee5bad6ec9bcd.callback = var_6a210f4755586405;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x66a
// Size: 0x143
function objective_update(objectivename, objstate, var_1cc0d51c86bc4411, var_2215eeb563f7a3b8, var_f34635b53accbcac, var_c6caf52c65d084b8, var_14847a630d9835af, var_780b9710a4c60f44, var_d54b9310847f6bf4, var_2431ebabbcc67a2c, var_4a6df3c7ff3ea1e6) {
    _objective_validatename(objectivename);
    assertex(objective_exists(objectivename), "Objective with name " + objectivename + " doesn't exist!");
    if (isdefined(objstate)) {
        objective_set_state(objectivename, objstate);
    }
    if (isdefined(var_1cc0d51c86bc4411)) {
        if (isent(var_1cc0d51c86bc4411)) {
            objective_set_on_entity(objectivename, objectivename, var_1cc0d51c86bc4411);
            if (isdefined(var_4a6df3c7ff3ea1e6)) {
                function_5e1102ec9d97ed2c(objectivename, var_4a6df3c7ff3ea1e6);
            }
        } else {
            objective_set_position(objectivename, var_1cc0d51c86bc4411);
        }
    }
    if (isdefined(var_2215eeb563f7a3b8)) {
        objective_set_description(objectivename, var_2215eeb563f7a3b8);
    }
    if (isdefined(var_f34635b53accbcac)) {
        objective_set_label(objectivename, var_f34635b53accbcac);
    }
    if (isdefined(var_c6caf52c65d084b8)) {
        objective_set_icon(objectivename, var_c6caf52c65d084b8);
    }
    if (isdefined(var_14847a630d9835af)) {
        objective_set_z_offset(objectivename, var_14847a630d9835af);
    }
    if (isdefined(var_780b9710a4c60f44)) {
        objective_set_show_distance(objectivename, var_780b9710a4c60f44);
    }
    if (isdefined(var_d54b9310847f6bf4)) {
        objective_set_show_progress(objectivename, var_d54b9310847f6bf4);
    }
    if (isdefined(var_2431ebabbcc67a2c)) {
        function_ff959ec1bd44c166(objectivename, var_2431ebabbcc67a2c);
    }
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b5
// Size: 0x47
function objective_remove(objectivename) {
    assert(objective_exists(objectivename));
    objectiveindex = _objective_getindexforname(objectivename);
    level.objective_array[objectiveindex] = undefined;
    objective_delete(objectiveindex);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x804
// Size: 0x8d
function objective_exists(objectivename) {
    _objective_validatename(objectivename);
    if (isdefined(level.objective_array)) {
        foreach (objective in level.objective_array) {
            if (isdefined(objective.objectivename) && objective.objectivename == objectivename) {
                return true;
            }
        }
    }
    return false;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x89a
// Size: 0xc8
function objective_complete(objectivename, var_2f87f92eb31189cc, var_2215eeb563f7a3b8) {
    assertex(objective_exists(objectivename), "Objective with name " + objectivename + " doesn't exist!");
    objective_set_state(objectivename, "done");
    var_2f87f92eb31189cc = default_to(var_2f87f92eb31189cc, 0);
    if (istrue(var_2f87f92eb31189cc) && isdefined(level.var_b9eee5bad6ec9bcd) && isdefined(level.var_b9eee5bad6ec9bcd.callback)) {
        var_ccdb2090b09c435d = 1;
        var_71bb4595bfba1caf = 0;
        level.player [[ level.var_b9eee5bad6ec9bcd.callback ]](objectivename, var_2215eeb563f7a3b8, var_ccdb2090b09c435d, var_71bb4595bfba1caf);
    }
    objectiveindex = _objective_getindexforname(objectivename);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x96a
// Size: 0xa7
function objective_show_progress(objectivename, var_2215eeb563f7a3b8, var_71bb4595bfba1caf, var_d85ab98698be6559) {
    assertex(objective_exists(objectivename), "Objective with name " + objectivename + " doesn't exist!");
    if (isdefined(level.var_b9eee5bad6ec9bcd) && isdefined(level.var_b9eee5bad6ec9bcd.callback)) {
        var_ccdb2090b09c435d = 0;
        level.player [[ level.var_b9eee5bad6ec9bcd.callback ]](objectivename, var_2215eeb563f7a3b8, var_ccdb2090b09c435d, var_71bb4595bfba1caf, var_d85ab98698be6559);
    }
    objectiveindex = _objective_getindexforname(objectivename);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa19
// Size: 0xa9
function objective_set_state(objectivename, objstate) {
    _objective_validatename(objectivename);
    assert(isstring(objstate));
    assertex(objstate == "empty" || objstate == "active" || objstate == "invisible" || objstate == "done" || objstate == "current" || objstate == "failed", "Invalid state: " + objstate + ". Valid states are 'empty', 'active', 'invisible', 'done', 'current' and 'failed'");
    objectiveindex = _objective_getindexforname(objectivename);
    objective_state(objectiveindex, objstate);
    level notify("objectives_updated");
    level notify("objectives_updated_state", objstate);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaca
// Size: 0x4c
function objective_set_position(objectivename, var_1cc0d51c86bc4411) {
    _objective_validatename(objectivename);
    assert(isvector(var_1cc0d51c86bc4411));
    objectiveindex = _objective_getindexforname(objectivename);
    objective_position(objectiveindex, var_1cc0d51c86bc4411);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb1e
// Size: 0x56
function objective_set_description(objectivename, var_2215eeb563f7a3b8) {
    _objective_validatename(objectivename);
    assert(isstring(var_2215eeb563f7a3b8) || isistring(var_2215eeb563f7a3b8));
    objectiveindex = _objective_getindexforname(objectivename);
    objective_setdescription(objectiveindex, var_2215eeb563f7a3b8);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb7c
// Size: 0x56
function objective_set_label(objectivename, var_f34635b53accbcac) {
    _objective_validatename(objectivename);
    assert(isstring(var_f34635b53accbcac) || isistring(var_f34635b53accbcac));
    objectiveindex = _objective_getindexforname(objectivename);
    objective_setlabel(objectiveindex, var_f34635b53accbcac);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbda
// Size: 0x4c
function objective_set_icon(objectivename, var_c6caf52c65d084b8) {
    _objective_validatename(objectivename);
    assert(isstring(var_c6caf52c65d084b8));
    objectiveindex = _objective_getindexforname(objectivename);
    objective_icon(objectiveindex, var_c6caf52c65d084b8);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc2e
// Size: 0x56
function objective_set_z_offset(objectivename, var_14847a630d9835af) {
    _objective_validatename(objectivename);
    assert(isint(var_14847a630d9835af) || isfloat(var_14847a630d9835af));
    objectiveindex = _objective_getindexforname(objectivename);
    objective_setzoffset(objectiveindex, var_14847a630d9835af);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc8c
// Size: 0x56
function function_ff959ec1bd44c166(objectivename, var_2431ebabbcc67a2c) {
    _objective_validatename(objectivename);
    assert(isint(var_2431ebabbcc67a2c) || isfloat(var_2431ebabbcc67a2c));
    objectiveindex = _objective_getindexforname(objectivename);
    function_7d22acc637a98c43(objectiveindex, var_2431ebabbcc67a2c);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcea
// Size: 0x1d
function function_3234e40df03b0a40(objectivename) {
    _objective_validatename(objectivename);
    function_ff959ec1bd44c166(objectivename, -55);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0f
// Size: 0x2a
function function_54586a40e8a00778(objectivename) {
    _objective_validatename(objectivename);
    function_5e1102ec9d97ed2c(objectivename, "j_head");
    objective_set_z_offset(objectivename, 25);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd41
// Size: 0x4c
function objective_set_show_distance(objectivename, var_780b9710a4c60f44) {
    _objective_validatename(objectivename);
    assert(isint(var_780b9710a4c60f44));
    objectiveindex = _objective_getindexforname(objectivename);
    objective_setshowdistance(objectiveindex, var_780b9710a4c60f44);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd95
// Size: 0x4c
function objective_set_show_progress(objectivename, var_d54b9310847f6bf4) {
    _objective_validatename(objectivename);
    assert(isint(var_d54b9310847f6bf4));
    objectiveindex = _objective_getindexforname(objectivename);
    objective_setshowprogress(objectiveindex, var_d54b9310847f6bf4);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xde9
// Size: 0x44
function function_cd6027322dca40(objectivename, var_92f6b973fd20d716) {
    _objective_validatename(objectivename);
    assert(isint(var_92f6b973fd20d716));
    objectiveindex = _objective_getindexforname(objectivename);
    function_b071825cc2499f43(objectiveindex, var_92f6b973fd20d716);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe35
// Size: 0x9c
function objective_set_on_entity(objectivename, locationname, var_766dff81c68b20f9) {
    _objective_validatename(objectivename);
    assert(isent(var_766dff81c68b20f9));
    objectiveindex = _objective_getindexforname(objectivename);
    if (level.objective_array[objectiveindex].locations.size > 0) {
        error("Calling this function while having locations set is scary. OnEntity always takes the first index.");
        objective_remove_all_locations(objectivename);
    }
    level.objective_array[objectiveindex].locations[0] = locationname;
    objective_onentity(objectiveindex, var_766dff81c68b20f9);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed9
// Size: 0x56
function function_5e1102ec9d97ed2c(objectivename, var_4a6df3c7ff3ea1e6) {
    _objective_validatename(objectivename);
    assert(isstring(var_4a6df3c7ff3ea1e6) || isistring(var_4a6df3c7ff3ea1e6));
    objectiveindex = _objective_getindexforname(objectivename);
    function_fd97acb2885e7860(objectiveindex, var_4a6df3c7ff3ea1e6);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf37
// Size: 0x34
function objective_add_location_entity(objectivename, locationname, var_766dff81c68b20f9) {
    assert(isent(var_766dff81c68b20f9));
    _objective_addlocation(objectivename, locationname, var_766dff81c68b20f9);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf73
// Size: 0x34
function objective_add_location_position(objectivename, locationname, var_93862e78a31a715) {
    assert(isvector(var_93862e78a31a715));
    _objective_addlocation(objectivename, locationname, var_93862e78a31a715);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfaf
// Size: 0x111
function objective_remove_location(objectivename, locationname) {
    assert(objective_exists(objectivename));
    assert(isstring(locationname));
    var_9be69c18c91160a9 = -1;
    objectiveindex = _objective_getindexforname(objectivename);
    objectivelocations = level.objective_array[objectiveindex].locations;
    foreach (location in objectivelocations) {
        if (isdefined(location) && location == locationname) {
            var_9be69c18c91160a9 = locationindex;
            break;
        }
    }
    assertex(var_9be69c18c91160a9 >= 0, "The location - " + locationname + " - was not defined for objective: " + objectivename);
    level.objective_array[objectiveindex].locations[var_9be69c18c91160a9] = undefined;
    objective_unsetlocation(objectiveindex, var_9be69c18c91160a9);
    level notify("objectives_updated", "location");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10c8
// Size: 0xcb
function function_9ecf0d4a951abebf(objectivename, locationname) {
    assert(objective_exists(objectivename));
    assert(isstring(locationname));
    var_9be69c18c91160a9 = -1;
    objectiveindex = _objective_getindexforname(objectivename);
    objectivelocations = level.objective_array[objectiveindex].locations;
    foreach (location in objectivelocations) {
        if (isdefined(location) && location == locationname) {
            var_9be69c18c91160a9 = locationindex;
            break;
        }
    }
    return var_9be69c18c91160a9 >= 0;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119c
// Size: 0x6d
function objective_remove_all_locations(objectivename) {
    assert(objective_exists(objectivename));
    objectiveindex = _objective_getindexforname(objectivename);
    for (locationindex = 0; locationindex < 8; locationindex++) {
        objective_unsetlocation(objectiveindex, locationindex);
    }
    level.objective_array[objectiveindex].locations = [];
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1211
// Size: 0x21
function function_ab69b0fe7021a308(var_9235d6ccd79a3362) {
    if (!isdefined(var_9235d6ccd79a3362)) {
        var_9235d6ccd79a3362 = 1000;
    }
    setomnvar("ui_objective_scale_distance", var_9235d6ccd79a3362);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x123a
// Size: 0x34
function function_cd037dbe1fe3943(index) {
    if (level.objective_array != undefined && level.objective_array.size) {
        return level.objective_array[index];
    }
    return undefined;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1277
// Size: 0xcf
function _objective_addlocation(objectivename, locationname, var_8c7c19c9172500f) {
    assert(objective_exists(objectivename));
    assert(isstring(locationname));
    objectiveindex = _objective_getindexforname(objectivename);
    assertex(!array_contains(level.objective_array[objectiveindex].locations, locationname), "The location - " + locationname + " - is already defined for objective: " + objectivename);
    var_9be69c18c91160a9 = _objective_getnextfreelocationindex(objectiveindex);
    assertex(var_9be69c18c91160a9 < 8, "This objective can only have a limited number of max locations. Can't add more!");
    level.objective_array[objectiveindex].locations[var_9be69c18c91160a9] = locationname;
    objective_setlocation(objectiveindex, var_9be69c18c91160a9, var_8c7c19c9172500f);
    level notify("objectives_updated");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x134e
// Size: 0x34
function _objective_validatename(objectivename) {
    assertex(!isint(objectivename), "objectiveName needs to be a string - not an integer index. Accessing the script-side index system shouldn't be done explicitly!");
    assertex(isstring(objectivename), "objectiveName needs to be a string!");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x138a
// Size: 0x15
function _objective_initindexforname(objectivename) {
    _objective_getindexforname(objectivename, 1);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13a7
// Size: 0x208
function _objective_getindexforname(objectivename, var_2e5a6b3339d8d1e0) {
    assert(isstring(objectivename));
    if (!isdefined(level.objective_array)) {
        level.objective_array = [];
    }
    objectiveindex = -1;
    if (istrue(var_2e5a6b3339d8d1e0)) {
        assertex(!objective_exists(objectivename), "An objective with this name was already added: " + objectivename);
        objectiveindex = _objective_getnextfreeobjectiveindex();
        level.objective_array[objectiveindex] = spawnstruct();
        level.objective_array[objectiveindex].objectivename = objectivename;
        level.objective_array[objectiveindex].locations = [];
        level.objective_array[objectiveindex].objid = objectiveindex;
        if (!function_7f15ad998050dd8c()) {
            objective_delete(objectiveindex);
        }
    } else if (function_7f15ad998050dd8c()) {
        foreach (obj in level.objective_array) {
            if (isdefined(obj) && isdefined(obj.objectivename) && obj.objectivename == objectivename) {
                objectiveindex = obj.objid;
                break;
            }
        }
    } else {
        assert(level.objective_array.size <= 32);
        for (i = 0; i < 32; i++) {
            if (isdefined(level.objective_array[i]) && isdefined(level.objective_array[i].objectivename) && level.objective_array[i].objectivename == objectivename) {
                objectiveindex = i;
                break;
            }
        }
    }
    assertex(objectiveindex >= 0, "The objective - " + objectivename + " - could not be found!");
    assert(objective_exists(objectivename));
    return objectiveindex;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b8
// Size: 0x82
function _objective_getnextfreelocationindex(objectiveindex) {
    assert(isdefined(level.objective_array));
    objectivelocations = level.objective_array[objectiveindex].locations;
    for (i = 0; i < 8; i++) {
        if (!isdefined(objectivelocations[i])) {
            return i;
        }
        if (objectivelocations[i] == "") {
            return i;
        }
    }
    assertmsg("Can't add another location, we are already at capacity: " + 8);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1642
// Size: 0x5e
function _objective_getnextfreeobjectiveindex() {
    if (function_7f15ad998050dd8c()) {
        return objective_create();
    }
    assert(isdefined(level.objective_array));
    for (i = 0; i < 32; i++) {
        if (!isdefined(level.objective_array[i])) {
            return i;
        }
    }
    assertmsg("Can't add another objective, we are already at capacity: " + 32);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a8
// Size: 0x3e
function function_bb9ff75fdab01612(boolean) {
    level.var_58d876adc5a3a383.enabled = boolean;
    if (istrue(level.var_58d876adc5a3a383.enabled)) {
        function_51fa6750df4678ca();
    }
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ee
// Size: 0x90
function function_51fa6750df4678ca(delay_time) {
    if (!isdefined(level.var_58d876adc5a3a383.delay_time) || !isdefined(delay_time)) {
        level.var_58d876adc5a3a383.delay_time = 180000;
    }
    if (isdefined(delay_time) && delay_time > 0) {
        level.var_58d876adc5a3a383.delay_time = delay_time;
    }
    level.var_58d876adc5a3a383.var_8bfc0c10bb289d10 = gettime() + level.var_58d876adc5a3a383.delay_time;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1786
// Size: 0x46
function function_198bcf281b9c6e01(duration) {
    if (!isdefined(duration) || duration == 0) {
        duration = 180000;
    } else {
        duration *= 1000;
    }
    level.var_58d876adc5a3a383.delay_time = duration;
    function_51fa6750df4678ca(duration);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d4
// Size: 0x42
function function_6294c59db36291e6(var_9f34c2c1d6c74955) {
    if (isdefined(var_9f34c2c1d6c74955)) {
        if (var_9f34c2c1d6c74955 == 0) {
            thread function_78a5f36ae600540();
            function_51fa6750df4678ca();
            return;
        }
        var_9f34c2c1d6c74955 = int(var_9f34c2c1d6c74955 * 1000);
        function_51fa6750df4678ca(var_9f34c2c1d6c74955);
    }
    function_51fa6750df4678ca(var_9f34c2c1d6c74955);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181e
// Size: 0xc8
function function_f420c7fbd15a416b() {
    level endon("game_ended");
    println("<dev string:x1c>");
    level.var_58d876adc5a3a383 = spawnstruct();
    function_bb9ff75fdab01612(0);
    function_51fa6750df4678ca();
    childthread function_17b90f3fe7fbd28f();
    while (true) {
        cur_time = gettime();
        if (function_d0acca3f41921ad2()) {
            function_51fa6750df4678ca();
        } else if (level.var_58d876adc5a3a383.var_8bfc0c10bb289d10 <= cur_time || istrue(level.var_58d876adc5a3a383.forced)) {
            if (istrue(level.var_58d876adc5a3a383.enabled)) {
                thread function_78a5f36ae600540();
                self waittill("objective_reminder_end");
                function_51fa6750df4678ca();
            }
        }
        wait 5;
    }
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ee
// Size: 0x88
function function_78a5f36ae600540() {
    focus_display_hint(undefined, undefined, level.player, "objective_reminder_end");
    /#
        if (getdvarint(@"hash_cbacc26f16af0e07", 0) > 0) {
            iprintlnbold("<dev string:x37>");
        }
    #/
    end_time = gettime() + 10000;
    while (gettime() < end_time || istrue(level.var_58d876adc5a3a383.forced)) {
        if (function_d0acca3f41921ad2()) {
            break;
        }
        waitframe();
    }
    function_3895aa5d9337bee1();
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x197e
// Size: 0x34
function function_3895aa5d9337bee1() {
    level.player notify("objective_reminder_end");
    /#
        if (getdvarint(@"hash_cbacc26f16af0e07", 0) > 0) {
            iprintlnbold("<dev string:x50>");
        }
    #/
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ba
// Size: 0x67
function function_17b90f3fe7fbd28f() {
    level endon("game_ended");
    while (true) {
        result = waittill_any_ents_return(level.player, "focus_pressed", level, "objectives_updated", level, "player_linked_to_rig");
        /#
            if (getdvarint(@"hash_cbacc26f16af0e07", 0) > 0) {
                iprintlnbold("<dev string:x72>" + result);
            }
        #/
        function_51fa6750df4678ca();
    }
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a29
// Size: 0x2d
function function_d0acca3f41921ad2() {
    return flag("objectives_displayed") || function_d501bbf61ed965b7() == 0 || function_2d6537807828303e() || function_1e4aaaddfd5236ca();
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5f
// Size: 0x33
function focus_display_hint(timeout, delay, var_e9260eabeca89658, var_7a410e817719294e) {
    display_hint("focus_hint", timeout, delay, var_e9260eabeca89658, var_7a410e817719294e);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9a
// Size: 0x24
function function_d501bbf61ed965b7(objectivename) {
    if (!isdefined(level.objective_array)) {
        return 0;
    }
    return level.objective_array.size;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac7
// Size: 0xc
function function_2d6537807828303e() {
    return getomnvar("ui_cutscene_active");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1adc
// Size: 0xac
function function_1e4aaaddfd5236ca() {
    enemies = getaiarrayinradius(level.player.origin, 500, get_enemy_team(level.player.team));
    foreach (var_c103511638513254 in enemies) {
        if (isalive(var_c103511638513254) && gettime() - var_c103511638513254 lastknowntime(level.player) < 10000) {
            return true;
        }
    }
    return false;
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b91
// Size: 0x20
function function_e18920c0717c1b4e(boolean) {
    level.player setclientomnvar("ui_objective_reveal_fanfare_enabled", boolean);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb9
// Size: 0x20
function function_84126bde5bb3888b(boolean) {
    level.player setclientomnvar("ui_objective_dismiss_fanfare_enabled", boolean);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1be1
// Size: 0x15
function function_4e1c4a6c6eec1568() {
    return level.player getclientomnvar("ui_objective_reveal_fanfare_enabled");
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bff
// Size: 0x30
function function_b338aa1e9ec37fbd() {
    level.player setclientomnvar("ui_show_objectives", 1);
    wait 3;
    level.player setclientomnvar("ui_show_objectives", 0);
}

// Namespace objectives / scripts\engine\sp\objectives
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c37
// Size: 0xb5
function function_b26ad6615e6cf8ce(start_flag, var_9f0d03d1b41551c5) {
    level endon("game_ended");
    if (isdefined(start_flag)) {
        flag_wait(start_flag);
    }
    level.player setclientomnvar("ui_show_objectives", 1);
    if (isdefined(var_9f0d03d1b41551c5)) {
        flag_wait(var_9f0d03d1b41551c5);
    } else {
        while (true) {
            result = level function_28551e899093b138("objectives_updated_state", "objectives_updated");
            if (result["message"] == "objectives_updated") {
                break;
            }
            if (result[0] != "current" && result[0] != "invisible") {
                break;
            }
        }
    }
    level.player setclientomnvar("ui_show_objectives", 0);
}

