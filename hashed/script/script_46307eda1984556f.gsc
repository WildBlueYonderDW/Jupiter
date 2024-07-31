#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_dlog.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_721ee99d7a8f9168;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\entityheadicons.gsc;

#namespace namespace_e1628666367511e6;

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ba
// Size: 0x13
function main() {
    function_c0b3ddc9a6bdcc46("veh9_cougar", &function_7290f6d8c7a2a47b);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d5
// Size: 0x2c2
function function_7290f6d8c7a2a47b(var_39a0d8ee3716ac3a) {
    if (!isdefined(var_39a0d8ee3716ac3a)) {
        var_39a0d8ee3716ac3a = 0;
    }
    vehicleref = ter_op(var_39a0d8ee3716ac3a, "veh_jup_cougar_mg", "veh9_cougar");
    if (!function_9697379150687859(vehicleref)) {
        return;
    }
    assertex(isdefined(level.vehicle), "<dev string:x1c>");
    callbacks = [];
    callbacks["spawn"] = ter_op(var_39a0d8ee3716ac3a, &function_7e1167f6d8e6ae1, &function_64c7dc3d3b1947ec);
    callbacks["update"] = &function_56130f17fe28820c;
    callbacks["explode"] = &function_46b7e9d64ad215de;
    callbacks["delete"] = &function_dee32ff329398652;
    callbacks["initSpawnData"] = &function_b430ab7b23d5e0b6;
    callbacks["tankSpawn"] = ter_op(var_39a0d8ee3716ac3a, &function_6101be70180e72dd, &function_35cc6fe841001ef0);
    callbacks["capture"] = &function_99525ee4d0ba15c9;
    callbacks["copySpawnData"] = &function_91bce5758740be7b;
    callbacks["tankActivate"] = &function_b1487f821290fcf8;
    callbacks["autoDestruct"] = &function_4ee463ada98bdc74;
    callbacks["updateTeam"] = &function_f83b26fe3db71b9d;
    callbacks["updateOwner"] = &function_623c9e05c6d3cd5b;
    callbacks["enterEnd"] = &function_2b551bb5fd2a71ea;
    callbacks["exitEnd"] = &function_e4f419f5eb18e42;
    callbacks["reenter"] = &function_cf6f72b7ff33fe2e;
    callbacks["spawnPostAirdrop"] = ter_op(var_39a0d8ee3716ac3a, &function_1627e7e63ae2ff3a, &function_708960ea0d6b71b5);
    callbacks["updateHeadIconForPlayerOnJoinTeam"] = ter_op(var_39a0d8ee3716ac3a, &function_22d90229e648b13e, &function_91259bab198736f7);
    function_8497e7e46b5e397(vehicleref, callbacks);
    if (!isdefined(level.vehicle.var_8baea35b5dca79b0)) {
        level.vehicle.var_8baea35b5dca79b0 = spawnstruct();
        level.vehicle.var_8baea35b5dca79b0.canautodestruct = 1;
        level.vehicle.var_8baea35b5dca79b0.autodestructdamagepercent = 11;
        level.vehicle.var_8baea35b5dca79b0.cantimeout = 1;
        level.vehicle.var_8baea35b5dca79b0.timeoutduration = 165;
        level.vehicle.var_8baea35b5dca79b0.cantakedamageduringcapture = 1;
        level.vehicle.var_8baea35b5dca79b0.showheadicon = 1;
        level.vehicle.var_8baea35b5dca79b0.showheadicontoenemy = 0;
    }
    var_e2818ad39a3341b4 = scripts\cp_mp\vehicles\vehicle::vehicle_getleveldataforvehicle(vehicleref);
    function_dd7bb3875a51fb8d(vehicleref, var_39a0d8ee3716ac3a);
    function_39c281b1c7c9c09a(vehicleref);
    function_c0cb64247eb0750d();
    /#
        issharedfuncdefined("<dev string:x4b>", "<dev string:x53>", 1);
    #/
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xb9f
// Size: 0x113
function private function_dd7bb3875a51fb8d(vehicleref, var_39a0d8ee3716ac3a) {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle(vehicleref, 1);
    var_e2818ad39a3341b4.ammoids["turret"] = 0;
    var_e2818ad39a3341b4.ammoids["missile"] = 1;
    var_e2818ad39a3341b4.ammoids["smoke"] = 2;
    var_e2818ad39a3341b4.rotationids[0] = 0;
    var_e2818ad39a3341b4.rotationids[1] = 1;
    var_ca4bf75726229283 = ter_op(var_39a0d8ee3716ac3a, "cougar_mg_mp", "cougar_mp");
    var_e8f1f02984c5c31c = ter_op(var_39a0d8ee3716ac3a, "jup_cougar_mg_gunner_turret_mp", "iw9_mg_cougar_mp");
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["driver"][var_ca4bf75726229283] = 0;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["driver"][var_e8f1f02984c5c31c] = 1;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["gunner"]["iw9_tur_cougar_mp"] = 0;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["gunner"][var_e8f1f02984c5c31c] = 1;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcba
// Size: 0x46
function private function_39c281b1c7c9c09a(vehicleref) {
    var_e2818ad39a3341b4 = vehicle_damage_getleveldataforvehicle(vehicleref);
    vehicle_damage_setpremoddamagecallback(vehicleref, &function_bcb6803eb16b9a68);
    vehicle_damage_setpostmoddamagecallback(vehicleref, &function_3bd38a556fc817b3);
    vehicle_damage_setweaponhitdamagedata("iw9_tur_cougar_mp", 5);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd08
// Size: 0x1c
function private function_c0cb64247eb0750d() {
    level._effect["cougar_cannon_dust"] = loadfx("vfx/iw8_mp/weap_kickup/vfx_wk_tank_cannon_dust_w.vfx");
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xd2c
// Size: 0x6e
function private function_64c7dc3d3b1947ec(spawndata, faildata, var_28dfc78d55358a94) {
    vehicleref = ter_op(isdefined(var_28dfc78d55358a94), var_28dfc78d55358a94, "veh9_cougar");
    function_b430ab7b23d5e0b6(spawndata);
    if (!isdefined(spawndata.showheadicon)) {
        spawndata.showheadicon = 0;
    }
    vehicle = function_35cc6fe841001ef0(spawndata, faildata, undefined, vehicleref);
    return vehicle;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xda3
// Size: 0x20
function private function_7e1167f6d8e6ae1(spawndata, faildata) {
    return function_64c7dc3d3b1947ec(spawndata, faildata, "veh_jup_cougar_mg");
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xdcc
// Size: 0x194
function private function_708960ea0d6b71b5(spawndata, faildata, var_28dfc78d55358a94) {
    vehicleref = ter_op(isdefined(var_28dfc78d55358a94), var_28dfc78d55358a94, "veh9_cougar");
    spawndata = function_37480e9c9c701cf2(vehicleref, spawndata);
    spawndata.cannotbesuspended = 1;
    spawndata.startsuspended = 0;
    /#
        function_31ee9844edbb6426(spawndata);
    #/
    vehicle = _spawnvehicle(spawndata, faildata);
    if (!isdefined(vehicle)) {
        return undefined;
    }
    vehicle.vehicleref = vehicleref;
    vehicle.var_39a0d8ee3716ac3a = vehicleref == "veh_jup_cougar_mg";
    gunnerweapon = vehicle function_268d9321d5ac7af8();
    turret = function_b13ac97633c63624(vehicle, spawndata, gunnerweapon);
    vehicle_registerturret(vehicle, turret, makeweapon(gunnerweapon));
    vehicle_create(vehicle, vehicleref, spawndata);
    var_ca4bf75726229283 = ter_op(vehicle.var_39a0d8ee3716ac3a, "cougar_mg_mp", "cougar_mp");
    vehicle.objweapon = makeweapon(var_ca4bf75726229283);
    vehicle function_3a9262c4901ea98b();
    var_b101137988b007d7 = vehicle_damage_getinstancedataforvehicle(vehicle, 1);
    var_b101137988b007d7.destroyscoreevent = "none";
    vehicle_createlate(vehicle, spawndata);
    vehicle thread vehicle_watchflipped();
    vehicle thread function_1b69321ff9937fc5();
    vehicle thread function_278b0ab7db34d0d1();
    vehicle thread function_2a5239b33efabfb6();
    if (issharedfuncdefined(vehicleref, "create")) {
        [[ getsharedfunc(vehicleref, "create") ]](vehicle);
    }
    return vehicle;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf69
// Size: 0x20
function private function_1627e7e63ae2ff3a(spawndata, faildata) {
    return function_708960ea0d6b71b5(spawndata, faildata, "veh_jup_cougar_mg");
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xf92
// Size: 0x124
function private function_b13ac97633c63624(vehicle, spawndata, weaponname) {
    var_a3f821b135a9eb0d = ter_op(vehicle.var_39a0d8ee3716ac3a, "turret_gun_animate_jnt", "turret_gun_animate_jnt");
    turret = spawnturret("misc_turret", vehicle gettagorigin(var_a3f821b135a9eb0d), weaponname, 0);
    turret linkto(vehicle, var_a3f821b135a9eb0d, (0, 0, 0), (0, 0, 0));
    model = ter_op(vehicle.var_39a0d8ee3716ac3a, "veh9_mil_lnd_tank_turret_gun", "veh9_mil_lnd_tank_cougar_turret_gun");
    if (isdefined(spawndata.var_14cde247ac3313a4)) {
        model = spawndata.var_14cde247ac3313a4 + "::" + model;
    }
    turret setmodel(model);
    turret setmode("sentry_offline");
    turret setsentryowner(undefined);
    turret makeunusable();
    turret setdefaultdroppitch(0);
    turret setturretmodechangewait(1);
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    return turret;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10bf
// Size: 0xc4
function private function_b1487f821290fcf8() {
    if (istrue(self.isactivated)) {
        return;
    }
    self.isactivated = 1;
    leveldata = function_8ae7c9135db427e7();
    showheadicon = undefined;
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        showheadicon = 0;
    } else if (isdefined(self.spawndata.showheadicon)) {
        showheadicon = self.spawndata.showheadicon;
    } else {
        showheadicon = leveldata.showheadicon;
    }
    if (showheadicon) {
        function_65a5074409e37dd2();
        function_3a9262c4901ea98b();
    }
    if (issharedfuncdefined(self.vehicleref, "activate")) {
        [[ getsharedfunc(self.vehicleref, "activate") ]](self);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x118b
// Size: 0x193
function private function_46b7e9d64ad215de(data, immediate, autoDestruct) {
    if (isdefined(data)) {
        inflictor = data.inflictor;
        meansofdeath = data.meansofdeath;
        streakname = "bradley";
        attacker = data.attacker;
        objweapon = data.objweapon;
        damagetype = undefined;
        damage = data.damage;
        scorepopupname = "destroyed_" + streakname;
        leaderdialog = streakname + "_destroyed";
        cardsplash = "callout_destroyed_" + streakname;
        skipdeathnotify = 1;
    } else {
        var_14feee091d491ffe = ter_op(isvehiclehusk(), self.pristineref, self.vehicleref);
        var_39a0d8ee3716ac3a = var_14feee091d491ffe == "veh_jup_cougar_mg";
        var_ca4bf75726229283 = ter_op(var_39a0d8ee3716ac3a, "cougar_mg_mp", "cougar_mp");
        data = spawnstruct();
        data.inflictor = self;
        data.objweapon = var_ca4bf75726229283;
        data.meansofdeath = "MOD_EXPLOSIVE";
    }
    if (isvehiclehusk()) {
        function_e3ff0a92ad2bf58d(data, immediate);
        return;
    }
    function_9672da471530b44a(data, immediate);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1326
// Size: 0x42
function private function_dee32ff329398652(vehicle) {
    thread function_681e3ebeca216d70(self);
    function_28c9234e277f3dca();
    if (isdefined(self.objent)) {
        function_aef8f5562150e840(self.objent);
        self.objent = undefined;
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1370
// Size: 0xa9
function private function_b430ab7b23d5e0b6(spawndata) {
    if (!isdefined(spawndata)) {
        spawndata = spawnstruct();
    }
    if (!isdefined(spawndata.spawnmethod)) {
        spawndata.spawnmethod = "airdrop_at_position_unsafe";
    }
    if (!isdefined(spawndata.cancapture)) {
        spawndata.cancapture = 0;
    }
    if (!isdefined(spawndata.cancaptureimmediately)) {
        spawndata.cancaptureimmediately = 0;
    }
    if (!isdefined(spawndata.activateimmediately)) {
        spawndata.activateimmediately = 1;
    }
    if (!isdefined(spawndata.faceawayfromowner)) {
        spawndata.faceawayfromowner = 0;
    }
    return spawndata;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1422
// Size: 0xb4
function private function_91bce5758740be7b(from, to) {
    to.spawnmethod = from.spawnmethod;
    to.cancapture = from.cancapture;
    to.cancaptureimmediately = from.cancaptureimmediately;
    to.activateimmediately = from.activateimmediately;
    to.faceawayfromowner = from.faceawayfromowner;
    to.cantimeout = from.cantimeout;
    to.showheadicon = from.showheadicon;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x14de
// Size: 0x1e5
function private function_35cc6fe841001ef0(spawndata, faildata, streakinfo, var_28dfc78d55358a94) {
    vehicleref = ter_op(isdefined(var_28dfc78d55358a94), var_28dfc78d55358a94, "veh9_cougar");
    spawnposition = undefined;
    spawnangles = undefined;
    var_a50521aed4831f1c = undefined;
    var_3ee18b54b626dba8 = undefined;
    spawndata = function_b430ab7b23d5e0b6(spawndata);
    assertex(isdefined(spawndata) && (isdefined(spawndata.origin) || spawndata.spawnmethod == "<dev string:x62>"), "<dev string:x79>");
    isairdrop = issubstr(spawndata.spawnmethod, "airdrop_");
    spawnposition = spawndata.origin;
    spawnangles = spawndata.angles;
    if (isdefined(spawndata.owner) && istrue(spawndata.faceawayfromowner)) {
        between = spawnposition - spawndata.owner.origin;
        if (length2dsquared(between) > 0) {
            spawnangles = vectortoangles(spawnposition - spawndata.owner.origin);
        } else {
            spawnangles = spawndata.owner getplayerangles(1);
        }
    }
    if (!isdefined(spawnangles)) {
        spawnangles = (0, randomint(360), 0);
    } else {
        spawnangles *= (0, 1, 0);
    }
    vehicle = undefined;
    if (isairdrop) {
        vehicle = function_a03f22774b3a88d6(spawnposition, spawnangles, var_a50521aed4831f1c, var_3ee18b54b626dba8, spawndata, faildata, vehicleref);
    } else {
        vehicle = function_4e3f410fca5e2494(spawnposition, spawnangles, spawndata, faildata, vehicleref);
    }
    vehicle.vehicleref = vehicleref;
    vehicle.var_39a0d8ee3716ac3a = vehicleref == "veh_jup_cougar_mg";
    return vehicle;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x16cc
// Size: 0x29
function private function_6101be70180e72dd(spawndata, faildata, streakinfo) {
    return function_35cc6fe841001ef0(spawndata, faildata, streakinfo, "veh_jup_cougar_mg");
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x16fe
// Size: 0xfd
function private function_4e3f410fca5e2494(spawnposition, spawnangles, spawndata, faildata, vehicleref) {
    oldorigin = spawndata.origin;
    oldangles = spawndata.angles;
    spawndata.origin = spawnposition;
    spawndata.angles = spawnangles;
    vehicle = function_708960ea0d6b71b5(spawndata, faildata, vehicleref);
    spawndata.origin = oldorigin;
    spawndata.angles = oldangles;
    if (!isdefined(vehicle)) {
        return undefined;
    }
    if (spawndata.cancapture) {
        if (spawndata.cancaptureimmediately) {
            thread function_9b5f4b582f7b7eaf(vehicle, spawndata.owner, spawndata.team);
        }
    } else if (spawndata.activateimmediately) {
        vehicle thread function_b1487f821290fcf8();
    }
    return vehicle;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x1804
// Size: 0xa9
function private function_a03f22774b3a88d6(position, angles, groundposition, groundnormal, spawndata, faildata, vehicleref) {
    spawndata.origin = position;
    spawndata.angles = angles;
    objent = undefined;
    if (isdefined(groundposition)) {
        if (!scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
            objent = function_ccd0f0f299cf09a8(groundposition, groundnormal, spawndata);
        }
    }
    vehicle = namespace_801fa17f47560d76::function_66c684fea143fbfd(vehicleref, spawndata, faildata);
    vehicle.objent = objent;
    vehicle thread function_9e0c2cd85fa8c581();
    return vehicle;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x18b6
// Size: 0x8c
function private function_9e0c2cd85fa8c581(objent) {
    self waittill("landed");
    while (lengthsquared(self vehicle_getvelocity()) > 400) {
        waitframe();
    }
    spawndata = scripts\cp_mp\vehicles\vehicle_tracking::getvehiclespawndata(self);
    if (spawndata.cancapture) {
        if (spawndata.cancaptureimmediately) {
            thread function_9b5f4b582f7b7eaf(self, self.owner, self.team);
        }
        return;
    }
    if (spawndata.activateimmediately) {
        thread function_b1487f821290fcf8();
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x194a
// Size: 0x22c
function private function_ccd0f0f299cf09a8(groundposition, groundnormal, spawndata) {
    objid = [[ getsharedfunc("game", "requestObjectiveID") ]](99);
    objent = spawn("script_model", groundposition);
    objent setmodel("ks_airstrike_marker_mp");
    forward = (1, 0, 0);
    right = vectorcross(forward, groundnormal);
    forward = vectorcross(groundnormal, right);
    angles = axistoangles(forward, right, groundnormal);
    objent.angles = angles;
    if (objid != -1) {
        objent.objid = objid;
        objective_onentity(objid, objent);
        objective_icon(objid, "icon_waypoint_tank");
        objective_setzoffset(objid, 55);
        objective_setplayintro(objid, 0);
        objective_setplayoutro(objid, 0);
        objective_setbackground(objid, 1);
        objective_showtoplayersinmask(objid);
        objective_state(objid, "current");
        if (level.teambased) {
            var_9a6fccc729b4650a = spawndata.team;
            if (!isdefined(var_9a6fccc729b4650a) || var_9a6fccc729b4650a == "neutral") {
                if (isdefined(spawndata.owner)) {
                    var_9a6fccc729b4650a = spawndata.owner.team;
                }
            }
            if (!isdefined(var_9a6fccc729b4650a) || var_9a6fccc729b4650a == "neutral") {
                objective_addalltomask(objid);
                objent setscriptablepartstate("marker_placed", "onEveryone", 0);
            } else {
                objective_addteamtomask(objid, var_9a6fccc729b4650a);
                cougar_setTeamOtherEnt(objent, var_9a6fccc729b4650a);
                objent setscriptablepartstate("marker_placed", "onTeam", 0);
            }
        } else if (!isdefined(spawndata.owner)) {
            objective_addalltomask(objid);
            objent setscriptablepartstate("marker_placed", "onEveryone", 0);
        } else {
            objective_setownerclient(objid, spawndata.owner);
            objective_addclienttomask(objid, spawndata.owner);
            objent setotherent(spawndata.owner);
            objent setscriptablepartstate("marker_placed", "on", 0);
        }
    }
    return objent;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b7f
// Size: 0x3f
function private function_aef8f5562150e840(objent) {
    if (isdefined(objent.objid)) {
        [[ getsharedfunc("game", "returnObjectiveID") ]](objent.objid);
    }
    objent delete();
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1bc6
// Size: 0xb0
function private cougar_setTeamOtherEnt(objent, team) {
    objent notify("cougar_setTeamOtherEnt");
    objent endon("cougar_setTeamOtherEnt");
    otherent = undefined;
    foreach (player in level.players) {
        if (player.team == team) {
            otherent = player;
            break;
        }
    }
    if (isdefined(otherent)) {
        objent setotherent(otherent);
        childthread function_b2cd90d16b47a903(objent, otherent);
        childthread function_6abab9583049ffe8(objent, otherent);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1c7e
// Size: 0x4d
function private function_b2cd90d16b47a903(objent, otherent) {
    objent endon("death");
    oldteam = otherent.team;
    otherent waittill_any_2("joined_team", "joined_spectators");
    thread cougar_setTeamOtherEnt(objent, oldteam);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1cd3
// Size: 0x3c
function private function_6abab9583049ffe8(objent, otherent) {
    oldteam = otherent.team;
    otherent waittill("disconnect");
    thread cougar_setTeamOtherEnt(objent, oldteam);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1d17
// Size: 0xd4
function private function_9b5f4b582f7b7eaf(vehicle, owner, team) {
    leveldata = function_8ae7c9135db427e7();
    showheadicon = undefined;
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        showheadicon = 0;
    } else if (isdefined(vehicle.spawndata.showheadicon)) {
        showheadicon = vehicle.spawndata.showheadicon;
    } else {
        showheadicon = leveldata.showheadicon;
    }
    if (showheadicon) {
        vehicle function_65a5074409e37dd2(1);
        vehicle function_3a9262c4901ea98b(owner, team);
    }
    if (issharedfuncdefined(vehicle.vehicleref, "startCapture")) {
        [[ getsharedfunc(vehicle.vehicleref, "startCapture") ]](vehicle, owner, team);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1df3
// Size: 0x59
function private function_681e3ebeca216d70(vehicle) {
    vehicleref = ter_op(vehicle isvehiclehusk(), vehicle.pristineref, vehicle.vehicleref);
    if (issharedfuncdefined(vehicleref, "endCapture")) {
        [[ getsharedfunc(vehicleref, "endCapture") ]](vehicle);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1e54
// Size: 0x84
function private function_99525ee4d0ba15c9(vehicle, player) {
    thread function_681e3ebeca216d70(vehicle);
    vehicle_occupancy_setteam(vehicle, player.team);
    vehicle_occupancy_setowner(vehicle, player);
    thread vehicle_occupancy_enter(vehicle, "driver", player);
    vehicle thread function_b1487f821290fcf8();
    if (issharedfuncdefined(vehicle.vehicleref, "capture")) {
        [[ getsharedfunc(vehicle.vehicleref, "capture") ]](player, vehicle);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ee0
// Size: 0x21
function private function_56130f17fe28820c(data) {
    if (isvehicledestroyed()) {
        return;
    }
    vehicle_occupancy_updatemovefeedback("driver");
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f09
// Size: 0x4c
function private function_278b0ab7db34d0d1() {
    self endon("death");
    function_326a22d7feae6244();
    while (true) {
        message = waittill_any_return_2("vehicle_turret_fire", "vehicle_turret_reload_end");
        if (message == "vehicle_turret_fire") {
            function_714c103c008d6efc();
        }
        function_326a22d7feae6244();
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f5d
// Size: 0x59
function private function_2a5239b33efabfb6() {
    self endon("death");
    while (true) {
        param1, param2, projectile = self waittill("vehicle_turret_fire");
        driver = vehicle_occupancy_getseatoccupant(self, "driver");
        projectile thread function_bf495cc5499542be(driver);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1fbe
// Size: 0x67
function private function_bf495cc5499542be(driver) {
    level endon("game_ended");
    position = self waittill("explode");
    if (!isdefined(driver)) {
        return;
    }
    if (issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](position, 175, 175, driver.team, 1, driver, 1);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x202d
// Size: 0x16e
function private function_e0c40131c7b05ab4(driver) {
    self endon("death");
    if (isdefined(driver)) {
        driver endon("vehicle_change_seat");
        driver endon("vehicle_seat_exit");
        driver endon("death_or_disconnect");
        while (driver reloadbuttonpressed()) {
            waitframe();
        }
        var_33193f537b85b6d4 = getdvarint(@"hash_9402582f8123db99", 250) / 1000;
        while (true) {
            holdtime = 0;
            var_930201649eaf32af = driver getcurrentusereloadconfig();
            var_72e25a59fcef57b5 = 0;
            while (driver reloadbuttonpressed()) {
                if (!driver usinggamepad() && self function_ab2bddb6cd03a29d() < weaponclipsize("iw9_tur_cougar_mp")) {
                    self function_4012509dbd1cee6f();
                    var_72e25a59fcef57b5 = 1;
                    function_326a22d7feae6244();
                    break;
                }
                if (self function_ab2bddb6cd03a29d() < weaponclipsize("iw9_tur_cougar_mp") && var_930201649eaf32af > 0 && holdtime >= var_33193f537b85b6d4) {
                    self function_4012509dbd1cee6f();
                    var_72e25a59fcef57b5 = 1;
                    function_326a22d7feae6244();
                }
                holdtime += level.framedurationseconds;
                waitframe();
            }
            if (!var_72e25a59fcef57b5 && driver usinggamepad() && self function_ab2bddb6cd03a29d() < weaponclipsize("iw9_tur_cougar_mp") && (var_930201649eaf32af == 0 && holdtime > 0 && holdtime < 0.2 || var_930201649eaf32af > 0 && holdtime >= var_33193f537b85b6d4)) {
                self function_4012509dbd1cee6f();
                function_326a22d7feae6244();
            }
            waitframe();
        }
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x21a3
// Size: 0x3b
function private function_326a22d7feae6244() {
    driver = vehicle_occupancy_getseatoccupant(self, "driver");
    if (isdefined(driver)) {
        vehomn_setammo(self.vehicleref, "turret", self function_ab2bddb6cd03a29d(), driver);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x21e6
// Size: 0x80
function private function_9af3933c15dee53f(player) {
    leveldata = function_8ae7c9135db427e7();
    if (leveldata.canautodestruct) {
        if (istrue(self.autodestructactivated)) {
            vehomn_showwarning("burningDown", player, self.vehicleref);
        } else {
            vehomn_hidewarning("burningDown", player, self.vehicleref);
        }
        return;
    }
    vehomn_hidewarning("burningDown", player, self.vehicleref);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x226e
// Size: 0x47
function private function_2b551bb5fd2a71ea(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        thread function_96c9a47c791faad7(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x22bd
// Size: 0x105
function private function_96c9a47c791faad7(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (seatid == "driver") {
        thread vehicle_occupancy_disablefirefortime(player, 250);
        player killstreak_savenvgstate();
        thread function_64261a02a23bc333(player);
    } else if (seatid == "gunner") {
        level thread vehicle_occupancy_disablefirefortime(player, 100);
        turretweapon = vehicle function_268d9321d5ac7af8();
        player thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_giveturret(player, vehicle, turretweapon, istrue(vehicle.var_39a0d8ee3716ac3a));
        function_23c5b222ed1973f2(player);
        if (!vehicle.var_39a0d8ee3716ac3a) {
            player playerlinkto(vehicle);
            player visionsetkillstreakforplayer("aviCougarGunner", 0);
        }
        thread function_9d6846994acaa116(player);
    }
    if (!isdefined(var_fc7c7a874b43a31a)) {
        vehicle function_b1240a7393ce6237(player);
    }
    vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
    function_f0a2ee74a6062970(vehicle, var_fc7c7a874b43a31a, seatid, player);
    if (seatid == "driver") {
        vehicle thread function_e0c40131c7b05ab4(player);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x23ca
// Size: 0x47
function private function_e4f419f5eb18e42(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        thread function_dd16ede536092cf(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2419
// Size: 0x195
function private function_dd16ede536092cf(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (seatid == "driver") {
        vehicle notify("cougar_driver_exit");
        if (!istrue(data.playerdisconnect)) {
            player killstreak_restorenvgstate();
        }
    } else if (seatid == "gunner") {
        turretweapon = vehicle function_268d9321d5ac7af8();
        turret = vehicle_getturretbyweapon(vehicle, turretweapon);
        if (!istrue(data.playerdisconnect)) {
            thread function_64261a02a23bc333(player);
            player controlturretoff(turret);
            thread vehicle_occupancy_taketurret(player, vehicle, turretweapon, spawnstruct());
            player enableturretdismount();
            if (player islinked()) {
                player unlink();
            }
            player visionsetkillstreakforplayer("");
            thread vehicle_occupancy_cleardisablefirefortime(player, data.playerdeath);
        }
        turret.owner = undefined;
        turret setotherent(undefined);
        turret setentityowner(undefined);
        turret setsentryowner(undefined);
        function_7284fa444e21f375(player);
    }
    if (!istrue(data.playerdisconnect)) {
        if (!isdefined(var_7558f98f3236963d)) {
            vehicle function_b1240a7393ce6237(player);
        }
        success = vehicle_occupancy_moveplayertoexit(vehicle, seatid, var_7558f98f3236963d, player, data);
        if (!success) {
            if (issharedfuncdefined("vehicle_occupancy", "handleSuicideFromVehicles")) {
                [[ getsharedfunc("vehicle_occupancy", "handleSuicideFromVehicles") ]](player);
            } else {
                player suicide();
            }
        }
    }
    scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_updateomnvarsonseatexit(vehicle, seatid, var_7558f98f3236963d, player);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x25b6
// Size: 0x1c
function private function_9d6846994acaa116(player) {
    player setclienttriggeraudiozone("veh_tank_cougar_turret", 0.2);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x25da
// Size: 0x17
function private function_64261a02a23bc333(player) {
    player clearclienttriggeraudiozone(0.2);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x25f9
// Size: 0x5c
function private function_cf6f72b7ff33fe2e(vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data) {
    if (isdefined(var_3f68c37bafd38606) && var_3f68c37bafd38606 == "gunner") {
        turretweapon = vehicle function_268d9321d5ac7af8();
        thread vehicle_occupancy_taketurret(player, vehicle, turretweapon, data, 1);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x265d
// Size: 0x33
function private function_23c5b222ed1973f2(player) {
    if (isdefined(player.gunnerdamagemodifier)) {
        return;
    }
    player scripts\cp_mp\utility\damage_utility::adddamagemodifier("ltGunnerMissileRedux", 0.4, 0, &function_b3a628c74b243041);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2698
// Size: 0x34
function private function_7284fa444e21f375(player) {
    if (!isdefined(player.gunnerdamagemodifier)) {
        return;
    }
    player.gunnerdamagemodifier = undefined;
    player scripts\cp_mp\utility\damage_utility::removedamagemodifier("ltGunnerMissileRedux", 0);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x26d4
// Size: 0xf7
function private function_b3a628c74b243041(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    if (meansofdeath != "MOD_PROJECTILE_SPLASH" && meansofdeath != "MOD_GRENADE_SPLASH") {
        return 1;
    }
    if (!isdefined(objweapon)) {
        return 1;
    }
    switch (objweapon.basename) {
    case #"hash_3e782fd775b72022":
    case #"hash_5c272c0617caebf0":
    case #"hash_5cbb3a1a84d47f1d":
    case #"hash_6b9700922cc910a9":
    case #"hash_708fb6e22f87a3a4":
    case #"hash_a9e31b8ffd42a67b":
    case #"hash_b5e9f2d6fac1a505":
    case #"hash_e704ecf8710c6f57":
    case #"hash_f55c20924061bd15":
    case #"hash_fd9c279f85990dad": 
        return 0;
    default: 
        return 1;
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x27d3
// Size: 0xed
function private function_bcb6803eb16b9a68(data) {
    if (vehicle_damage_isselfdamage(self, data)) {
        return false;
    }
    var_6b11d3047f506fb6 = self.origin - data.point;
    normal = anglestoup(self.angles);
    dist = vectordot(var_6b11d3047f506fb6, normal);
    var_d74074ad5396e58a = data.point + normal * dist;
    var_c47f1816352556dd = vectornormalize(var_d74074ad5396e58a - self.origin);
    forward = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    if (vectordot(var_c47f1816352556dd, forward) < -0.83) {
        data.isrearcriticaldamage = function_1989bd346c21b68a(data);
    }
    return true;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x28c9
// Size: 0x3e
function private function_3bd38a556fc817b3(data) {
    if (istrue(data.isrearcriticaldamage)) {
        data.damage = int(data.damage * 1.25);
    }
    return true;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2910
// Size: 0xea
function private function_4ee463ada98bdc74(attacker) {
    self endon("death");
    self notify("flipped_end");
    if (!istrue(self.autodestructactivated)) {
        self.autodestructactivated = 1;
        if (!utility::iscp()) {
            maxhealth = vehicle_damage_getheavystatemaxhealth(self);
            self.health = int(min(self.health, maxhealth));
            scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_updateomnvarsondamage(self);
            vehicle_damage_updatestate();
            return;
        }
        occupants = vehicle_occupancy_getalloccupants(self);
        foreach (occupant in occupants) {
            function_9af3933c15dee53f(occupant);
        }
        wait 5.5;
        thread function_46b7e9d64ad215de(undefined, undefined, 1);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2a02
// Size: 0x145
function private function_714c103c008d6efc() {
    contents = physics_createcontents(["physicscontents_itemclip", "physicscontents_water", "physicscontents_glass", "physicscontents_item"]);
    ignorelist = self getlinkedchildren();
    if (!isdefined(ignorelist)) {
        ignorelist = [];
    }
    ignorelist[ignorelist.size] = self;
    caststart = self gettagorigin("tag_flash");
    castend = caststart + (0, 0, 1) * -1 * 200;
    castresults = physics_raycast(caststart, castend, contents, ignorelist, 0, "physicsquery_closest", 1);
    if (!isdefined(castresults) || !castresults.size) {
        return;
    }
    forward = anglestoforward(self gettagangles("tag_flash") * (0, 1, 0));
    up = castresults[0]["normal"];
    right = vectorcross(forward, up);
    up = vectorcross(right, forward);
    angles = axistoangles(forward, right, up);
    playfx(getfx("cougar_cannon_dust"), castresults[0]["position"], anglestoforward(angles), anglestoup(angles));
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2b4f
// Size: 0xeb
function private function_65a5074409e37dd2(var_45c9b66826527876) {
    icon = self.headicon;
    if (!isdefined(icon)) {
        icon = scripts\cp_mp\entityheadicons::setheadicon_createnewicon();
        if (!isdefined(icon)) {
            return 0;
        }
        self.headicon = icon;
        setheadiconzoffset(icon, 110);
    }
    self.headiconforcapture = istrue(var_45c9b66826527876);
    naturaldist = ter_op(istrue(var_45c9b66826527876), 0, 0);
    maxdist = ter_op(istrue(var_45c9b66826527876), 2250, 2250);
    var_94dc5deab609fdc9 = ter_op(istrue(var_45c9b66826527876), 1, 0);
    var_c18f8868bd35fee2 = ter_op(istrue(var_45c9b66826527876), 1, 0);
    setheadiconnaturaldistance(icon, naturaldist);
    setheadiconmaxdistance(icon, maxdist);
    setheadicondrawthroughgeo(icon, var_94dc5deab609fdc9);
    setheadiconsnaptoedges(icon, var_c18f8868bd35fee2);
    if (istrue(level.var_32fe21b3c5052471) && level.teambased) {
        function_ce9d0299637c2c24(icon, 1);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2c42
// Size: 0x30
function private function_28c9234e277f3dca() {
    scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.headicon);
    self.headicon = undefined;
    self.headiconowneroverride = undefined;
    self.headiconteamoverride = undefined;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2c7a
// Size: 0xe0
function private function_3a9262c4901ea98b(owneroverride, teamoverride) {
    if (!isdefined(self.headicon)) {
        return;
    }
    if (isdefined(owneroverride)) {
        if (isstring(owneroverride) && owneroverride == "none") {
            self.headiconowneroverride = undefined;
        } else {
            self.headiconowneroverride = owneroverride;
        }
    }
    if (isdefined(teamoverride)) {
        if (teamoverride == "none") {
            self.headiconteamoverride = undefined;
        } else {
            self.headiconteamoverride = teamoverride;
        }
    }
    function_6e196df1b93bb28e();
    function_ee13a7408e86ede2();
    function_4ff4b1b1672c82f0();
    foreach (player in level.players) {
        function_b1240a7393ce6237(player);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2d62
// Size: 0x1ee
function private function_b1240a7393ce6237(player) {
    if (!isdefined(self.headicon)) {
        return;
    }
    vehicle = player scripts\cp_mp\utility\player_utility::getvehicle();
    if (isdefined(vehicle) && vehicle == self) {
        scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask(self.headicon, player);
        return;
    }
    owner = undefined;
    if (isdefined(self.headiconowneroverride)) {
        owner = self.headiconowneroverride;
    } else {
        owner = self.owner;
    }
    team = undefined;
    if (isdefined(self.headiconteamoverride)) {
        team = self.headiconteamoverride;
    } else {
        team = self.team;
    }
    leveldata = function_8ae7c9135db427e7();
    if (level.teambased) {
        if (team == "neutral") {
            if (!isdefined(owner)) {
                if (true) {
                    scripts\cp_mp\entityheadicons::setheadicon_addclienttomask(self.headicon, player);
                    return;
                }
                scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask(self.headicon, player);
                return;
            } else {
                team = owner.team;
            }
        }
        if (isenemyteam(team, player.team)) {
            if (istrue(leveldata.showheadicontoenemy)) {
                scripts\cp_mp\entityheadicons::setheadicon_addclienttomask(self.headicon, player);
            } else {
                scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask(self.headicon, player);
            }
        } else {
            scripts\cp_mp\entityheadicons::setheadicon_addclienttomask(self.headicon, player);
        }
        return;
    }
    if (!isdefined(owner)) {
        if (true) {
            scripts\cp_mp\entityheadicons::setheadicon_addclienttomask(self.headicon, player);
            return;
        }
        scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask(self.headicon, player);
        return;
    }
    if (player != owner) {
        if (leveldata.showheadicontoenemy) {
            scripts\cp_mp\entityheadicons::setheadicon_addclienttomask(self.headicon, player);
        } else {
            scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask(self.headicon, player);
        }
        return;
    }
    scripts\cp_mp\entityheadicons::setheadicon_addclienttomask(self.headicon, player);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2f58
// Size: 0x8a
function private function_91259bab198736f7(player, var_28dfc78d55358a94) {
    vehicleref = ter_op(isdefined(var_28dfc78d55358a94), var_28dfc78d55358a94, "veh9_cougar");
    lighttanks = vehicle_tracking_getgameinstances(vehicleref);
    foreach (lighttank in lighttanks) {
        lighttank function_b1240a7393ce6237(player);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2fea
// Size: 0x18
function private function_22d90229e648b13e(player) {
    function_91259bab198736f7(player, "veh_jup_cougar_mg");
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x300a
// Size: 0x6d
function private function_6e196df1b93bb28e() {
    if (level.teambased) {
        return false;
    }
    owner = undefined;
    if (isdefined(self.headiconowneroverride)) {
        owner = self.headiconowneroverride;
    } else {
        owner = self.owner;
    }
    if (isdefined(owner)) {
        setheadiconowner(self.headicon, owner);
    } else {
        setheadiconowner(self.headicon, undefined);
    }
    return true;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3080
// Size: 0x54
function private function_ee13a7408e86ede2() {
    if (!level.teambased) {
        return;
    }
    team = function_36da96b7c7cc22c9();
    if (isdefined(team) && team != "neutral") {
        setheadiconteam(self.headicon, team);
        return;
    }
    setheadiconteam(self.headicon, undefined);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x30dc
// Size: 0x17c
function private function_4ff4b1b1672c82f0() {
    leveldata = function_8ae7c9135db427e7();
    var_9318d957cb71a518 = ter_op(istrue(self.headiconforcapture), 1, 1);
    if (var_9318d957cb71a518) {
        setheadiconfriendlyimage(self.headicon, level.factionfriendlyheadicon);
        if (true) {
            setheadiconneutralimage(self.headicon, level.factionenemyheadicon);
        }
        if (leveldata.showheadicontoenemy) {
            setheadiconenemyimage(self.headicon, level.factionenemyheadicon);
        }
        return;
    }
    var_c3e202acf77e4dd4 = ter_op(istrue(self.headiconforcapture), 1, 1);
    var_f1a0dcc04676e92f = ter_op(istrue(self.headiconforcapture), 0, leveldata.showheadicontoenemy);
    friendlyimage = ter_op(istrue(self.headiconforcapture), "hud_icon_killstreak_bradley_friendly", "hud_icon_killstreak_bradley_friendly");
    neutralimage = ter_op(istrue(self.headiconforcapture), "hud_icon_killstreak_bradley", "hud_icon_killstreak_bradley");
    enemyimage = ter_op(istrue(self.headiconforcapture), "hud_icon_killstreak_bradley_enemy", "hud_icon_killstreak_bradley_enemy");
    setheadiconfriendlyimage(self.headicon, friendlyimage);
    if (var_c3e202acf77e4dd4) {
        setheadiconneutralimage(self.headicon, neutralimage);
    }
    if (var_f1a0dcc04676e92f) {
        setheadiconenemyimage(self.headicon, enemyimage);
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3260
// Size: 0x95
function private function_36da96b7c7cc22c9() {
    owner = undefined;
    if (isdefined(self.headiconowneroverride)) {
        owner = self.headiconowneroverride;
    } else {
        owner = self.owner;
    }
    team = undefined;
    if (isdefined(self.headiconteamoverride)) {
        team = self.headiconteamoverride;
    } else {
        team = self.team;
    }
    var_9a6fccc729b4650a = team;
    if (!isdefined(var_9a6fccc729b4650a) || team == "neutral") {
        if (isdefined(owner)) {
            var_9a6fccc729b4650a = owner.team;
        }
    }
    return var_9a6fccc729b4650a;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x32fe
// Size: 0x4f
function private function_8ae7c9135db427e7() {
    assertex(isdefined(level.vehicle), "<dev string:x1c>");
    assertex(isdefined(level.vehicle.var_8baea35b5dca79b0), "<dev string:x9e>");
    return level.vehicle.var_8baea35b5dca79b0;
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x3356
// Size: 0xfa
function private function_f83b26fe3db71b9d(vehicle, team, teamchanged) {
    turrets = vehicle_getturrets(vehicle);
    foreach (turret in turrets) {
        turret.team = team;
    }
    if (isdefined(vehicle.headicon)) {
        if (teamchanged) {
            vehicle function_ee13a7408e86ede2();
            vehicle function_4ff4b1b1672c82f0();
            foreach (player in level.players) {
                vehicle function_b1240a7393ce6237(player);
            }
        }
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3458
// Size: 0xb4
function private function_623c9e05c6d3cd5b(vehicle, owner, ownerchanged, ownerteamchanged) {
    if (isdefined(vehicle.headicon)) {
        if (ownerchanged) {
            vehicle function_6e196df1b93bb28e();
        }
        if (ownerteamchanged) {
            vehicle function_ee13a7408e86ede2();
            vehicle function_4ff4b1b1672c82f0();
        }
        if (ownerchanged || ownerteamchanged) {
            foreach (player in level.players) {
                vehicle function_b1240a7393ce6237(player);
            }
        }
    }
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x3514
// Size: 0x3e
function private function_f0a2ee74a6062970(vehicle, var_fc7c7a874b43a31a, var_7558f98f3236963d, player) {
    if (var_7558f98f3236963d == "driver") {
        vehicle function_326a22d7feae6244();
    }
    vehicle function_9af3933c15dee53f(player);
}

// Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x355a
// Size: 0x1b
function private function_268d9321d5ac7af8() {
    return ter_op(self.var_39a0d8ee3716ac3a, "jup_cougar_mg_gunner_turret_mp", "iw9_mg_cougar_mp");
}

/#

    // Namespace namespace_e1628666367511e6 / namespace_1a5e9e1bbf009981
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x357e
    // Size: 0x1ab
    function private function_31ee9844edbb6426(spawndata) {
        if (!function_3a040ff591c32b5c(spawndata)) {
            return 0;
        }
        if (!isdefined(spawndata.spawnmethod)) {
            spawndata.spawnmethod = "<dev string:xcc>";
            return 1;
        }
        if (spawndata.spawnmethod != "<dev string:x62>" && spawndata.spawnmethod != "<dev string:xe1>" && spawndata.spawnmethod != "<dev string:xf8>" && spawndata.spawnmethod != "<dev string:xcc>" && spawndata.spawnmethod != "<dev string:x116>") {
            thread error("<dev string:x132>");
            return 0;
        }
        if (spawndata.spawnmethod == "<dev string:x62>") {
            if (!isdefined(spawndata.owner)) {
                thread error("<dev string:x1dc>");
                return 0;
            }
        } else if (spawndata.spawnmethod == "<dev string:xe1>") {
            if (!isdefined(spawndata.origin) || !isdefined(spawndata.angles)) {
                thread error("<dev string:x231>");
                return 0;
            }
        } else if (spawndata.spawnmethod == "<dev string:xcc>") {
            if (!isdefined(spawndata.origin)) {
                thread error("<dev string:x29c>");
                return 0;
            }
        }
        if (issubstr(spawndata.spawnmethod, "<dev string:x2f0>")) {
            if (!isdefined(spawndata.origin) || !isdefined(spawndata.angles)) {
                thread error("<dev string:x2fb>");
                return 0;
            }
        }
    }

#/
