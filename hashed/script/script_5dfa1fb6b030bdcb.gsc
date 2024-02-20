// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_cf4ab64c2f83d096;

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109
// Size: 0x2d
function function_8d0bcd24e525ca55() {
    level.var_4b646b4bf1c0cd01 = spawnstruct();
    level.var_4b646b4bf1c0cd01.waypoints = [];
    function_bceadb844cbe69ca();
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13d
// Size: 0x14
function private function_bceadb844cbe69ca() {
    add_fx("ftue_objectives_waypoint_fx", "vfx/misc/vfx_ftue_ring_01");
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158
// Size: 0xa4
function function_e5524fb8509827bf(var_49ece3d0608350f7, var_6810723ee9dfe43a, icon, zoffset, owner, var_96acb993aefd266f) {
    if (!isdefined(var_49ece3d0608350f7)) {
        var_49ece3d0608350f7 = (0, 0, 0);
    }
    var_8d126083c75adbe6 = spawnstruct();
    var_8d126083c75adbe6.var_96acb993aefd266f = istrue(var_96acb993aefd266f);
    var_8d126083c75adbe6.position = var_49ece3d0608350f7;
    var_8d126083c75adbe6.owner = owner;
    objectiveid = function_15379e7d5a0b111a(var_6810723ee9dfe43a, icon, zoffset, undefined, owner, var_8d126083c75adbe6);
    objective_position(objectiveid, var_49ece3d0608350f7);
    return objectiveid;
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204
// Size: 0xc9
function function_70e0de6281199e7(var_4a7a3357a053496d, var_6810723ee9dfe43a, icon, zoffset, owner, var_96acb993aefd266f) {
    var_8d126083c75adbe6 = spawnstruct();
    var_8d126083c75adbe6.var_96acb993aefd266f = istrue(var_96acb993aefd266f);
    var_8d126083c75adbe6.position = var_4a7a3357a053496d.origin;
    var_8d126083c75adbe6.owner = owner;
    team = undefined;
    if (isplayer(var_4a7a3357a053496d)) {
        team = var_4a7a3357a053496d.team;
    }
    objectiveid = function_15379e7d5a0b111a(var_6810723ee9dfe43a, icon, zoffset, team, owner, var_8d126083c75adbe6);
    objective_onentity(objectiveid, var_4a7a3357a053496d);
    var_4a7a3357a053496d.objectiveid = objectiveid;
    return objectiveid;
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d5
// Size: 0xee
function private function_15379e7d5a0b111a(var_6810723ee9dfe43a, icon, zoffset, team, owner, var_8d126083c75adbe6) {
    objectiveid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    objective_state(objectiveid, "current");
    objective_icon(objectiveid, icon);
    objective_setminimapiconsize(objectiveid, "icon_regular");
    objective_setbackground(objectiveid, 1);
    objective_setshowdistance(objectiveid, !isdefined(team));
    objective_setfadedisabled(objectiveid, 1);
    if (isdefined(var_6810723ee9dfe43a)) {
        objective_setlabel(objectiveid, var_6810723ee9dfe43a);
    }
    objective_setzoffset(objectiveid, zoffset);
    function_dcfeea6332bca22f(objectiveid, "mobileftueobjective");
    if (isdefined(team)) {
        objective_setownerteam(objectiveid, team);
        objective_addalltomask(objectiveid);
    }
    if (isdefined(owner)) {
        objective_removeallfrommask(objectiveid);
        objective_addclienttomask(objectiveid, owner);
        objective_showtoplayersinmask(objectiveid);
    }
    if (istrue(var_8d126083c75adbe6.var_96acb993aefd266f)) {
        function_f36e91aa37d197c3(objectiveid, var_8d126083c75adbe6);
    }
    return objectiveid;
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cb
// Size: 0x7d
function private function_f36e91aa37d197c3(objectiveid, var_8d126083c75adbe6) {
    /#
        assertex(isdefined(var_8d126083c75adbe6.owner), "To use floor waypoints an owner must be specified");
    #/
    waypoint = spawnfxforclient(getfx("ftue_objectives_waypoint_fx"), var_8d126083c75adbe6.position, var_8d126083c75adbe6.owner);
    triggerfx(waypoint);
    level.var_4b646b4bf1c0cd01.waypoints[objectiveid] = waypoint;
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x1e
function function_b30874d13004d4c5(var_4a7a3357a053496d) {
    function_4d03b9ef456d0972(var_4a7a3357a053496d.objectiveid);
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x474
// Size: 0x1c
function function_4d03b9ef456d0972(objectiveid) {
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(objectiveid);
    function_b93e49439785c073(objectiveid);
}

// Namespace namespace_cf4ab64c2f83d096/namespace_2e77b62bcb3c8d4b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x497
// Size: 0x41
function private function_b93e49439785c073(objectiveid) {
    if (!isdefined(level.var_4b646b4bf1c0cd01.waypoints[objectiveid])) {
        return;
    }
    level.var_4b646b4bf1c0cd01.waypoints[objectiveid] delete();
}

