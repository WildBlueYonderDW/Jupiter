// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_6c8a837ec98fe0b8;

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176
// Size: 0x6c
function init() {
    objectiveidpool = spawnstruct();
    objectiveidpool.active = [];
    objectiveidpool.reclaimed = [];
    objectiveidpool.reserved = [];
    objectiveidpool.index = 0;
    objectiveidpool.limit = getmaxobjectivecount();
    level.objectiveidpool = objectiveidpool;
    level.var_9977f6e10514d7ce = [];
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9
// Size: 0xed
function requestreservedid(objid) {
    if (function_7f15ad998050dd8c()) {
        if (!isdefined(objid) || objid == -1) {
            objid = level.var_9977f6e10514d7ce.size;
        }
        return function_be6060bf8a6e12c2(objid);
    }
    if (!isdefined(objid) || objid == -1) {
        objid = getnextobjectiveid(100);
        if (objid == -1) {
            return -1;
        }
    } else {
        level.objectiveidpool.index++;
    }
    entry = spawnstruct();
    entry.priority = 100;
    entry.requesttime = gettime();
    entry.objid = objid;
    level.objectiveidpool.active[objid] = entry;
    level.objectiveidpool.reserved[level.objectiveidpool.reserved.size] = objid;
    return objid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de
// Size: 0x82
function requestobjectiveid(priority) {
    objid = getnextobjectiveid(priority);
    if (!isdefined(objid) || objid == -1) {
        return -1;
    }
    entry = spawnstruct();
    entry.priority = priority;
    entry.requesttime = gettime();
    entry.objid = objid;
    level.objectiveidpool.active[objid] = entry;
    return objid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368
// Size: 0x40
function function_92a696fa5918eca5(objid) {
    if (!function_7f15ad998050dd8c()) {
        return objid;
    }
    /#
        assert(isdefined(level.var_9977f6e10514d7ce[objid]));
    #/
    return level.var_9977f6e10514d7ce[objid].objid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b0
// Size: 0x56
function function_b29f91f1fb14e113(var_5c3b190b45db5f37) {
    if (function_7f15ad998050dd8c()) {
        for (i = level.var_9977f6e10514d7ce.size; i < var_5c3b190b45db5f37 + 1; i++) {
            entry = function_7e41a40db70e23b9();
            level.var_9977f6e10514d7ce[i] = entry;
        }
    }
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40d
// Size: 0xc5
function removebestobjectiveid(prioritymax) {
    query = [];
    foreach (objid in level.objectiveidpool.active) {
        if (array_contains(level.objectiveidpool.reserved, objid)) {
            continue;
        }
        if (objid.priority <= prioritymax) {
            query[query.size] = objid;
        }
    }
    array_sort_with_func(query, &comparepriorityandtime);
    return returnobjectiveid(query[0].objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da
// Size: 0x61
function comparepriorityandtime(a, b) {
    if (a.priority == b.priority) {
        return (a.requesttime < b.requesttime);
    } else {
        return (a.priority < b.priority);
    }
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x542
// Size: 0x16c
function getnextobjectiveid(priority) {
    if (function_7f15ad998050dd8c()) {
        return function_618c44b4ba0bfe51();
    }
    if (level.objectiveidpool.reclaimed.size == 0) {
        if (level.objectiveidpool.index >= level.objectiveidpool.limit) {
            /#
                assertmsg("No objective IDs available!");
            #/
            return -1;
        } else {
            nextid = level.objectiveidpool.index;
            level.objectiveidpool.index++;
            if (level.objectiveidpool.index >= level.objectiveidpool.limit) {
                level.objectiveidpool.index = level.objectiveidpool.limit - 1;
            }
        }
    } else {
        nextid = level.objectiveidpool.reclaimed[level.objectiveidpool.reclaimed.size - 1];
        level.objectiveidpool.reclaimed = array_remove_index(level.objectiveidpool.reclaimed, level.objectiveidpool.reclaimed.size - 1);
    }
    return nextid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6
// Size: 0xdb
function returnobjectiveid(objid) {
    if (!isdefined(objid) || objid == -1) {
        return 0;
    }
    for (i = 0; i < level.objectiveidpool.reclaimed.size; i++) {
        if (objid == level.objectiveidpool.reclaimed[i]) {
            /#
                assertmsg("ObjID has already been returned!");
            #/
            return 0;
        }
    }
    level.objectiveidpool.active = array_remove_key(level.objectiveidpool.active, objid);
    level notify("Objective_Delete", objid);
    objective_delete(objid);
    level.objectiveidpool.reclaimed[level.objectiveidpool.reclaimed.size] = objid;
    return 1;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x799
// Size: 0x8f
function returnreservedobjectiveid(objid, var_301ec764dd09b364) {
    if (!isdefined(objid) || objid == -1) {
        return 0;
    }
    if (istrue(var_301ec764dd09b364)) {
        level.objectiveidpool.active[objid] = undefined;
    }
    level notify("Objective_Delete", objid);
    if (function_7f15ad998050dd8c()) {
        if (isdefined(level.var_9977f6e10514d7ce[objid])) {
            function_617ae8637cd8092c(level.var_9977f6e10514d7ce[objid].objid);
        } else {
            function_617ae8637cd8092c(objid);
        }
    } else {
        objective_delete(objid);
    }
    return 1;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x830
// Size: 0x4c
function private function_7e41a40db70e23b9() {
    var_11e4597ee4d18d17 = function_618c44b4ba0bfe51();
    entry = spawnstruct();
    entry.priority = 100;
    entry.requesttime = 0;
    entry.objid = var_11e4597ee4d18d17;
    return entry;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x884
// Size: 0x9c
function private function_be6060bf8a6e12c2(objid) {
    function_b29f91f1fb14e113(objid);
    /#
        assert(isdefined(level.var_9977f6e10514d7ce[objid]));
    #/
    entry = level.var_9977f6e10514d7ce[objid];
    entry.requesttime = gettime();
    level.objectiveidpool.active[objid] = entry;
    level.objectiveidpool.reserved[level.objectiveidpool.reserved.size] = objid;
    return entry.objid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x928
// Size: 0x78
function objective_add(var_780627589b4bb0b5, state, position, iconname, iconsize) {
    if (!function_7f15ad998050dd8c()) {
        level notify("Objective_Delete", var_780627589b4bb0b5);
        objective_delete(var_780627589b4bb0b5);
    }
    if (isdefined(state)) {
        objective_state(var_780627589b4bb0b5, state);
    }
    if (isdefined(position)) {
        objective_position(var_780627589b4bb0b5, position);
    }
    if (isdefined(iconname)) {
        objective_icon(var_780627589b4bb0b5, iconname);
    }
    if (isdefined(iconsize)) {
        objective_setminimapiconsize(var_780627589b4bb0b5, iconsize);
    }
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a7
// Size: 0x40
function objective_add_objective(objid, state, position, var_2eaf3f31852684fd, iconsize) {
    if (objid == -1) {
        return;
    }
    objective_add(objid, state, position, var_2eaf3f31852684fd, iconsize);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ee
// Size: 0x24
function update_objective_ownerteam(objid, ownerteam) {
    if (objid == -1) {
        return;
    }
    objective_setownerteam(objid, ownerteam);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa19
// Size: 0x24
function update_objective_ownerclient(objid, owner) {
    if (objid == -1) {
        return;
    }
    objective_setownerclient(objid, owner);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa44
// Size: 0x24
function update_objective_sethot(objid, ownerteam) {
    if (objid == -1) {
        return;
    }
    objective_sethot(objid, ownerteam);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0x24
function update_objective_setfriendlylabel(objid, stringref) {
    if (objid == -1) {
        return;
    }
    objective_setfriendlylabel(objid, stringref);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9a
// Size: 0x24
function update_objective_setenemylabel(objid, stringref) {
    if (objid == -1) {
        return;
    }
    objective_setenemylabel(objid, stringref);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac5
// Size: 0x24
function update_objective_setneutrallabel(objid, stringref) {
    if (objid == -1) {
        return;
    }
    objective_setneutrallabel(objid, stringref);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf0
// Size: 0x24
function update_objective_state(objid, state) {
    if (objid == -1) {
        return;
    }
    objective_state(objid, state);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1b
// Size: 0x24
function update_objective_position(objid, position) {
    if (objid == -1) {
        return;
    }
    objective_position(objid, position);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb46
// Size: 0x24
function update_objective_icon(objid, var_2eaf3f31852684fd) {
    if (objid == -1) {
        return;
    }
    objective_icon(objid, var_2eaf3f31852684fd);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb71
// Size: 0x24
function function_2946e9eb07acb3f1(objid, description) {
    if (objid == -1) {
        return;
    }
    objective_setdescription(objid, description);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9c
// Size: 0x29
function function_c3c6bff089dfdd34(objid, iconsize) {
    if (objid == -1) {
        return;
    }
    if (isdefined(iconsize)) {
        objective_setminimapiconsize(objid, iconsize);
    }
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcc
// Size: 0x24
function function_79a1a16de6b22b2d(objid, var_2eaf3f31852684fd) {
    if (objid == -1) {
        return;
    }
    function_18b16cd8def5e879(objid, var_2eaf3f31852684fd);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf7
// Size: 0x1b
function function_56fc9b5845892619(objid) {
    if (objid == -1) {
        return;
    }
    function_cdab88ba2ce79251(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc19
// Size: 0x24
function update_objective_setbackground(objid, type) {
    if (objid == -1) {
        return;
    }
    objective_setbackground(objid, type);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc44
// Size: 0x24
function update_objective_onentity(objid, ent) {
    if (objid == -1) {
        return;
    }
    objective_onentity(objid, ent);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6f
// Size: 0x2d
function update_objective_onentitywithrotation(objid, ent) {
    if (objid == -1) {
        return;
    }
    objective_onentity(objid, ent);
    objective_setrotateonminimap(objid, 1);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca3
// Size: 0x24
function function_fa3c420e27b5d08b(objid, var_cff8e6dc09cfee61) {
    if (objid == -1) {
        return;
    }
    function_f32fc70fb7087551(objid, var_cff8e6dc09cfee61);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcce
// Size: 0x24
function update_objective_setzoffset(objid, offset) {
    if (objid == -1) {
        return;
    }
    objective_setzoffset(objid, offset);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf9
// Size: 0x1b
function function_9cad42ac02eff950(objid) {
    if (objid == -1) {
        return;
    }
    objective_removeallfrommask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1b
// Size: 0x1b
function function_a28e8535e00d34f3(objid) {
    if (objid == -1) {
        return;
    }
    objective_addalltomask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3d
// Size: 0x1b
function function_6ae37618bb04ea60(objid) {
    if (objid == -1) {
        return;
    }
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5f
// Size: 0x1b
function function_17db39bd195cc5b1(objid) {
    if (objid == -1) {
        return;
    }
    objective_hidefromplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd81
// Size: 0x32
function objective_playermask_single(objid, ent) {
    if (objid == -1) {
        return;
    }
    objective_removeallfrommask(objid);
    objective_addclienttomask(objid, ent);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdba
// Size: 0x32
function objective_teammask_single(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_removeallfrommask(objid);
    objective_addteamtomask(objid, team);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf3
// Size: 0x22
function function_f5862ad1ad967602(objid) {
    if (objid == -1) {
        return;
    }
    function_6d82c157ec9637b4(objid);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1c
// Size: 0x22
function objective_playermask_hidefromall(objid) {
    if (objid == -1) {
        return;
    }
    objective_addalltomask(objid);
    objective_hidefromplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe45
// Size: 0x2b
function objective_playermask_hidefrom(objid, ent) {
    if (objid == -1) {
        return;
    }
    objective_removeclientfrommask(objid, ent);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe77
// Size: 0x2b
function objective_playermask_addshowplayer(objid, ent) {
    if (objid == -1) {
        return;
    }
    objective_addclienttomask(objid, ent);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea9
// Size: 0x22
function function_df6a3e032fa07d22(objid) {
    if (objid == -1) {
        return;
    }
    function_ce9f9b0fac60739c(objid);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed2
// Size: 0x22
function objective_playermask_showtoall(objid) {
    if (objid == -1) {
        return;
    }
    objective_addalltomask(objid);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefb
// Size: 0x3c
function objective_mask_showtoplayerteam(objid, ent) {
    if (objid == -1) {
        return;
    }
    objective_removeallfrommask(objid);
    objective_addteamtomask(objid, ent.team);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3e
// Size: 0x4c
function function_39f2dc4e92db5fb9(objid, ent) {
    if (objid == -1) {
        return;
    }
    if (!isdefined(ent.owner)) {
        return;
    }
    objective_removeallfrommask(objid);
    objective_addclienttomask(objid, ent.owner);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf91
// Size: 0x53
function objective_mask_showtoenemyteam(objid, ent) {
    if (objid == -1) {
        return;
    }
    objective_removeallfrommask(objid);
    if (level.teambased) {
        objective_addteamtomask(objid, ent.team);
    } else {
        objective_addclienttomask(objid, ent);
    }
    objective_hidefromplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfeb
// Size: 0x2b
function objective_teammask_addtomask(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_addteamtomask(objid, team);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101d
// Size: 0x2b
function objective_teammask_removefrommask(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_removeteamfrommask(objid, team);
    objective_showtoplayersinmask(objid);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104f
// Size: 0x24
function objective_pin_global(objid, pin) {
    if (objid == -1) {
        return;
    }
    objective_setpinned(objid, pin);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x107a
// Size: 0x24
function objective_pin_team(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_pinforteam(objid, team);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10a5
// Size: 0x24
function objective_unpin_team(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_unpinforteam(objid, team);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d0
// Size: 0x28
function private function_781844c0c05b5ac7() {
    if (issharedfuncdefined("super_capture_bot", "captureBot_isGrenadeEntity")) {
        return function_f3bb4f4911a1beb2("super_capture_bot", "captureBot_isGrenadeEntity");
    }
    return 0;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1100
// Size: 0x2f
function objective_pin_player(objid, player) {
    if (objid == -1 || player function_781844c0c05b5ac7()) {
        return;
    }
    objective_pinforclient(objid, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1136
// Size: 0x37
function objective_unpin_player(objid, player, showoncompass) {
    if (objid == -1 || player function_781844c0c05b5ac7()) {
        return;
    }
    objective_unpinforclient(objid, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1174
// Size: 0x3f
function objective_show_progress(objid, show, var_800ee8521aa9cf8b) {
    if (objid == -1) {
        return;
    }
    if (show && !istrue(var_800ee8521aa9cf8b)) {
        level notify("Objective_SetShowProgress", objid);
    }
    objective_setshowprogress(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ba
// Size: 0x27
function function_7299a742781a5030(state, player) {
    if (player function_781844c0c05b5ac7()) {
        return;
    }
    function_d1b64c3d055ceeb0(state, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e8
// Size: 0x27
function function_8f7a55bda12ebb21(text, player) {
    if (player function_781844c0c05b5ac7()) {
        return;
    }
    function_8b71eb96e1636edc(text, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1216
// Size: 0x24
function objective_show_team_progress(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_showprogressforteam(objid, team);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1241
// Size: 0x24
function objective_hide_team_progress(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_hideprogressforteam(objid, team);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126c
// Size: 0x2f
function objective_show_player_progress(objid, player) {
    if (objid == -1 || player function_781844c0c05b5ac7()) {
        return;
    }
    objective_showprogressforclient(objid, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a2
// Size: 0x2f
function objective_hide_player_progress(objid, player) {
    if (objid == -1 || player function_781844c0c05b5ac7()) {
        return;
    }
    objective_hideprogressforclient(objid, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d8
// Size: 0x2b
function objective_set_show_progress(objid, var_5f0af647d1f3ba6b) {
    if (!isdefined(objid) || objid == -1) {
        return;
    }
    objective_setshowprogress(objid, var_5f0af647d1f3ba6b);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130a
// Size: 0x24
function objective_set_progress(objid, progress) {
    if (objid == -1) {
        return;
    }
    objective_setprogress(objid, progress);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1335
// Size: 0x24
function objective_set_progress_team(objid, team) {
    if (objid == -1) {
        return;
    }
    objective_setprogressteam(objid, team);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1360
// Size: 0x24
function function_9b1a086f348520b0(objid, team) {
    if (objid == -1) {
        return;
    }
    function_97b31127037043b6(objid, team);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138b
// Size: 0x2f
function objective_set_progress_client(objid, player) {
    if (objid == -1 || player function_781844c0c05b5ac7()) {
        return;
    }
    objective_setprogressclient(objid, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c1
// Size: 0x24
function objective_set_play_intro(objid, show) {
    if (objid == -1) {
        return;
    }
    objective_setplayintro(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ec
// Size: 0x24
function objective_set_play_outro(objid, show) {
    if (objid == -1) {
        return;
    }
    objective_setplayoutro(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1417
// Size: 0x24
function objective_set_pulsate(objid, pulse) {
    if (objid == -1) {
        return;
    }
    objective_setpulsate(objid, pulse);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1442
// Size: 0x24
function objective_hide_for_mlg_spectator(objid, show) {
    if (objid == -1) {
        return;
    }
    objective_sethideformlgspectator(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146d
// Size: 0x24
function objective_show_for_mlg_spectator(objid, show) {
    if (objid == -1) {
        return;
    }
    objective_setshowformlgspectator(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1498
// Size: 0x24
function function_d7e3c4a08682c1b9(objid, show) {
    if (objid == -1) {
        return;
    }
    function_865f9c5d005f9a08(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14c3
// Size: 0x24
function function_ee37484ca9bdc744(objid, show) {
    if (objid == -1) {
        return;
    }
    function_9427cb5974c925d9(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14ee
// Size: 0x24
function function_994c8917a78b024(objid, show) {
    if (objid == -1) {
        return;
    }
    function_2b46ef80dca002f9(objid, show);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1519
// Size: 0x24
function function_1513b8ac9570e6c7(objid, var_99d6809da5559c23) {
    if (objid == -1) {
        return;
    }
    function_9929f54e3253dbb4(objid, var_99d6809da5559c23);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1544
// Size: 0x24
function function_559a49e0dab1f8fc(objid, var_99d6809da5559c23) {
    if (objid == -1) {
        return;
    }
    function_6468f83ab1b52315(objid, var_99d6809da5559c23);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156f
// Size: 0x24
function function_bf66c6833e867284(objid, type) {
    if (objid == -1) {
        return;
    }
    function_a13e72e0427ecad2(objid, type);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x159a
// Size: 0x24
function function_a73941bc42a6e8d3(objid, var_40c8c22e3af690c1) {
    if (objid == -1) {
        return;
    }
    function_8ff22d292de16d27(objid, var_40c8c22e3af690c1);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15c5
// Size: 0x44
function function_e6b9c68b99e455ba(objid, var_d3810e59fa78746e, var_a4ce6d25578e2f1f, var_9184ccd844da4630) {
    if (objid == -1) {
        return;
    }
    function_34da8a6f11186850(objid, var_d3810e59fa78746e);
    function_dca08025695eac8d(objid, var_a4ce6d25578e2f1f);
    function_4b1c68b732904e7a(objid, var_9184ccd844da4630);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1610
// Size: 0xcc
function createobjective(shadername, team, var_7a8af4bfba6333a4, var_2231e5a0f940caae, var_dbe22cd5d2a797af, iconsize) {
    curobjid = function_c1a18d4076f420a5(shadername, var_2231e5a0f940caae, var_dbe22cd5d2a797af, iconsize);
    if (level.teambased) {
        if (isdefined(team)) {
            update_objective_ownerteam(curobjid, team);
        }
    } else if (isdefined(self.owner)) {
        update_objective_ownerclient(curobjid, self.owner);
    }
    if (istrue(var_7a8af4bfba6333a4)) {
        if (level.teambased) {
            objective_mask_showtoplayerteam(curobjid, self);
        } else {
            function_39f2dc4e92db5fb9(curobjid, self);
        }
    } else {
        objective_playermask_showtoall(curobjid);
    }
    if (istrue(level.objvisall)) {
        objective_playermask_showtoall(curobjid);
    }
    return curobjid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e4
// Size: 0x42
function function_c1a18d4076f420a5(shadername, var_2231e5a0f940caae, var_dbe22cd5d2a797af, iconsize) {
    curobjid = function_4625d98c8f5bdc94(shadername, var_2231e5a0f940caae, var_dbe22cd5d2a797af, iconsize);
    objective_playermask_hidefromall(curobjid);
    return curobjid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172e
// Size: 0xa1
function createobjective_engineer(shadername, var_2231e5a0f940caae, var_dbe22cd5d2a797af, iconsize) {
    curobjid = undefined;
    createfunc = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjectiveHidden")) {
        createfunc = namespace_3c37cb17ade254d::getsharedfunc("game", "createObjectiveHidden");
    }
    if (isdefined(createfunc) && isdefined(level.var_5b12006b920a1b6c)) {
        curobjid = [[ createfunc ]](level.var_5b12006b920a1b6c, 1, 1, "icon_regular");
        update_objective_ownerteam(curobjid, self.team);
    } else {
        return curobjid;
    }
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d6
// Size: 0xd4
function function_4625d98c8f5bdc94(shadername, var_2231e5a0f940caae, var_dbe22cd5d2a797af, iconsize) {
    curobjid = requestobjectiveid(10);
    if (curobjid == -1) {
        return -1;
    }
    objective_add_objective(curobjid, "invisible", (0, 0, 0));
    if ((!isent(self) || !isdefined(self getlinkedparent())) && !istrue(var_2231e5a0f940caae)) {
        update_objective_position(curobjid, self.origin);
    } else if (istrue(var_2231e5a0f940caae) && istrue(var_dbe22cd5d2a797af)) {
        update_objective_onentitywithrotation(curobjid, self);
    } else {
        update_objective_onentity(curobjid, self);
    }
    update_objective_state(curobjid, "active");
    update_objective_icon(curobjid, shadername);
    update_objective_setbackground(curobjid, 1);
    function_c3c6bff089dfdd34(curobjid, iconsize);
    return curobjid;
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b2
// Size: 0x78
function function_160f522b63c32d76(var_9341b600731439c, text, var_5c9ddcf56d36f133) {
    if (function_781844c0c05b5ac7()) {
        return;
    }
    if (getdvarint(@"hash_141de4492226006e", 1) == 1) {
        if (isdefined(var_5c9ddcf56d36f133)) {
        }
        function_7299a742781a5030(var_9341b600731439c, self);
        if (isdefined(text)) {
            function_8f7a55bda12ebb21(text, self);
        } else {
            function_8f7a55bda12ebb21("", self);
        }
    } else {
        self setclientomnvar("ui_objective_pinned_text_param", var_5c9ddcf56d36f133);
    }
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1931
// Size: 0x9b
function function_ce702e5925e31fc9(objid, player, priority, state, text) {
    if (objid == -1 || player function_781844c0c05b5ac7()) {
        return;
    }
    if (!isdefined(player.var_9d9b6c132375d54c)) {
        player.var_9d9b6c132375d54c = 0;
    }
    if (player.var_9d9b6c132375d54c < priority) {
        player.var_9d9b6c132375d54c = priority;
        namespace_5a22b6f3a56f7e9b::objective_show_player_progress(objid, player);
        namespace_5a22b6f3a56f7e9b::function_8f7a55bda12ebb21(text, player);
        namespace_5a22b6f3a56f7e9b::function_7299a742781a5030(state, player);
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d3
// Size: 0x4c
function function_26259bd38697b5ad(objid, player) {
    if (objid == -1 || !isdefined(player) || player function_781844c0c05b5ac7()) {
        return;
    }
    player.var_9d9b6c132375d54c = 0;
    namespace_5a22b6f3a56f7e9b::objective_hide_player_progress(objid, player);
    namespace_5a22b6f3a56f7e9b::function_7299a742781a5030(0, player);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a26
// Size: 0x24
function function_98ba077848896a3(objid, shouldshow) {
    if (objid == -1) {
        return;
    }
    objective_setshowdistance(objid, shouldshow);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a51
// Size: 0x2d
function function_f21e9b2e78de984b(objid, var_a7c6c5d6c3d369aa, var_467f4d9b8d9063b) {
    if (objid == -1) {
        return;
    }
    function_c047d7ffe7a83501(objid, var_a7c6c5d6c3d369aa, var_467f4d9b8d9063b);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a85
// Size: 0x24
function function_41f90376ab869b9f(objid, shouldhide) {
    if (objid == -1) {
        return;
    }
    objective_sethideelevation(objid, shouldhide);
}

// Namespace namespace_6c8a837ec98fe0b8/namespace_5a22b6f3a56f7e9b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab0
// Size: 0x3f
function function_846c2acd91309cd8(objid, r, g, b, active) {
    if (objid == -1) {
        return;
    }
    function_11cbcb8303075da(objid, r, g, b, active);
}

