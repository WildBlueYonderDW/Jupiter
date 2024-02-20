// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace obj_capture;

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa
// Size: 0xbd
function init() {
    settings = spawnstruct();
    settings.pickuptime = 0.5;
    settings.usetextfriendly = "MP/RETURNING_FLAG";
    settings.usetextenemy = "MP/GRABBING_FLAG";
    settings.onpickupfn = &onobjectpickup;
    settings.ondropfn = &onobjectdrop;
    settings.onresetfn = &onobjectreset;
    settings.ondelivered = &onobjectdelivered;
    settings.pickupicon = "waypoint_capture_take";
    settings.delivertime = 0.5;
    level.objectivesettings["ctf"] = settings;
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x26e
// Size: 0x7e
function createcaptureobjective(objectname, team, settings) {
    if (!isdefined(settings)) {
        settings = level.objectivesettings["ctf"];
    }
    var_61b9936bd67afc79 = createcarryobject(objectname, team, settings);
    goal = creategoal(var_61b9936bd67afc79.visuals[0].target, var_61b9936bd67afc79, team, settings);
    var_61b9936bd67afc79.goal = goal;
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f3
// Size: 0x1ed
function createcarryobject(objectname, team, settings) {
    var_5ff5210f68c5f433 = getent(objectname, "targetname");
    if (!isdefined(var_5ff5210f68c5f433)) {
        error("No model named " + objectname + " found!");
        return;
    }
    trigger = spawn("trigger_radius", var_5ff5210f68c5f433.origin, 0, 96, 120);
    object = namespace_19b4203b51d56488::createcarryobject(team, trigger, [0:var_5ff5210f68c5f433], (0, 0, 85));
    object namespace_19b4203b51d56488::setteamusetime("friendly", settings.pickuptime);
    object namespace_19b4203b51d56488::setteamusetime("enemy", settings.pickuptime);
    object namespace_19b4203b51d56488::setteamusetext("enemy", settings.usetextfriendly);
    object namespace_19b4203b51d56488::setteamusetext("friendly", settings.usetextenemy);
    object namespace_19b4203b51d56488::allowcarry("enemy");
    object namespace_19b4203b51d56488::setobjectivestatusicons(settings.pickupicon, settings.pickupicon);
    object namespace_19b4203b51d56488::setvisibleteam("enemy");
    object.objidpingfriendly = 1;
    object.allowweapons = 1;
    object.onpickup = settings.onpickupfn;
    object.onpickupfailed = settings.onpickupfailfn;
    object.ondrop = settings.ondropfn;
    object.onreset = settings.onresetfn;
    object.settings = settings;
    if (!isdefined(settings.carrymodel)) {
        settings.carrymodel = var_5ff5210f68c5f433.model;
    }
    object setnodeploy(1);
    object setnonstick(1);
    return object;
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4e8
// Size: 0xe2
function creategoal(var_4e0bfadc66e471d1, var_c07321ac837070b6, team, settings) {
    var_bd7f0d49276a106a = getent(var_4e0bfadc66e471d1, "targetname");
    if (!isdefined(var_bd7f0d49276a106a)) {
        error("No goal trigger named " + var_bd7f0d49276a106a + " found!");
        return;
    }
    goal = namespace_19b4203b51d56488::createuseobject(team, var_bd7f0d49276a106a, [], (0, 0, 85));
    goal namespace_19b4203b51d56488::allowuse("enemy");
    goal namespace_19b4203b51d56488::setvisibleteam("any");
    goal namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_blitz_defend", "waypoint_blitz_goal");
    goal namespace_19b4203b51d56488::setusetime(settings.delivertime);
    goal namespace_19b4203b51d56488::setkeyobject(var_c07321ac837070b6);
    goal.onuse = settings.ondelivered;
    goal.settings = settings;
    return goal;
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d2
// Size: 0x73
function onobjectpickup(player, var_5760e0f038d1baa3, defused) {
    if (player.team == namespace_19b4203b51d56488::getownerteam()) {
        namespace_19b4203b51d56488::returnhome();
    } else {
        player attachobjecttocarrier(self.settings.carrymodel);
        namespace_19b4203b51d56488::setvisibleteam("any");
        namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_capture_kill", "waypoint_escort");
    }
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64c
// Size: 0x35
function onobjectdrop(player) {
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("any");
    namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_capture_recover", "waypoint_capture_take");
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x688
// Size: 0x3d
function returnaftertime() {
    if (!isdefined(self.settings.returntime)) {
        return;
    }
    self endon("picked_up");
    wait(self.settings.returntime);
    namespace_19b4203b51d56488::returnhome();
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6cc
// Size: 0x3
function onobjectreset() {
    
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d6
// Size: 0x45
function onobjectdelivered(player) {
    self.keyobject namespace_19b4203b51d56488::allowcarry("none");
    self.keyobject namespace_19b4203b51d56488::setvisibleteam("none");
    player detachobjectifcarried();
    namespace_19b4203b51d56488::deleteuseobject();
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x722
// Size: 0x25
function attachobjecttocarrier(var_6c37c6a8bb079680) {
    self attach(var_6c37c6a8bb079680, "tag_stowed_back3", 1);
    self.carriedobject = var_6c37c6a8bb079680;
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74e
// Size: 0x2f
function detachobjectifcarried() {
    if (isdefined(self.carriedobject)) {
        self detach(self.carriedobject, "tag_stowed_back3");
        self.carriedobject = undefined;
    }
}

// Namespace obj_capture/namespace_11625d1b28bcd0be
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x784
// Size: 0x5b
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    detachobjectifcarried();
}

