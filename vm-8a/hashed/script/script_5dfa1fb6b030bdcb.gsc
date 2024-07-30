#using scripts\engine\utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_cf4ab64c2f83d096;

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109
// Size: 0x2c
function function_8d0bcd24e525ca55() {
    level.var_4b646b4bf1c0cd01 = spawnstruct();
    level.var_4b646b4bf1c0cd01.waypoints = [];
    function_bceadb844cbe69ca();
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13d
// Size: 0x13
function private function_bceadb844cbe69ca() {
    add_fx("ftue_objectives_waypoint_fx", "vfx/misc/vfx_ftue_ring_01");
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158
// Size: 0xa3
function function_e5524fb8509827bf(objectiveposition, labeltext, icon, zoffset, owner, showwaypoint) {
    if (!isdefined(objectiveposition)) {
        objectiveposition = (0, 0, 0);
    }
    waypointdata = spawnstruct();
    waypointdata.showwaypoint = istrue(showwaypoint);
    waypointdata.position = objectiveposition;
    waypointdata.owner = owner;
    objectiveid = function_15379e7d5a0b111a(labeltext, icon, zoffset, undefined, owner, waypointdata);
    objective_position(objectiveid, objectiveposition);
    return objectiveid;
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204
// Size: 0xc8
function function_70e0de6281199e7(objectivetarget, labeltext, icon, zoffset, owner, showwaypoint) {
    waypointdata = spawnstruct();
    waypointdata.showwaypoint = istrue(showwaypoint);
    waypointdata.position = objectivetarget.origin;
    waypointdata.owner = owner;
    team = undefined;
    if (isplayer(objectivetarget)) {
        team = objectivetarget.team;
    }
    objectiveid = function_15379e7d5a0b111a(labeltext, icon, zoffset, team, owner, waypointdata);
    objective_onentity(objectiveid, objectivetarget);
    objectivetarget.objectiveid = objectiveid;
    return objectiveid;
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d5
// Size: 0xed
function private function_15379e7d5a0b111a(labeltext, icon, zoffset, team, owner, waypointdata) {
    objectiveid = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    objective_state(objectiveid, "current");
    objective_icon(objectiveid, icon);
    objective_setminimapiconsize(objectiveid, "icon_regular");
    objective_setbackground(objectiveid, 1);
    objective_setshowdistance(objectiveid, !isdefined(team));
    objective_setfadedisabled(objectiveid, 1);
    if (isdefined(labeltext)) {
        objective_setlabel(objectiveid, labeltext);
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
    if (istrue(waypointdata.showwaypoint)) {
        function_f36e91aa37d197c3(objectiveid, waypointdata);
    }
    return objectiveid;
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cb
// Size: 0x7c
function private function_f36e91aa37d197c3(objectiveid, waypointdata) {
    assertex(isdefined(waypointdata.owner), "To use floor waypoints an owner must be specified");
    waypoint = spawnfxforclient(getfx("ftue_objectives_waypoint_fx"), waypointdata.position, waypointdata.owner);
    triggerfx(waypoint);
    level.var_4b646b4bf1c0cd01.waypoints[objectiveid] = waypoint;
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x1d
function function_b30874d13004d4c5(objectivetarget) {
    function_4d03b9ef456d0972(objectivetarget.objectiveid);
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x474
// Size: 0x1b
function function_4d03b9ef456d0972(objectiveid) {
    scripts\mp\objidpoolmanager::returnobjectiveid(objectiveid);
    function_b93e49439785c073(objectiveid);
}

// Namespace namespace_cf4ab64c2f83d096 / namespace_2e77b62bcb3c8d4b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x497
// Size: 0x40
function private function_b93e49439785c073(objectiveid) {
    if (!isdefined(level.var_4b646b4bf1c0cd01.waypoints[objectiveid])) {
        return;
    }
    level.var_4b646b4bf1c0cd01.waypoints[objectiveid] delete();
}

