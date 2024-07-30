#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\hostmigration.gsc;

#namespace mapselect;

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x372
// Size: 0x9
function init() {
    function_8bb8ac075d5a87dc();
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383
// Size: 0x69
function function_8bb8ac075d5a87dc() {
    val::group_register("map_select", ["usability", "killstreaks", "supers", "gesture", "fire", "weapon_switch", "allow_movement", "offhand_weapons", "allow_jump", "mantle"]);
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f4
// Size: 0x7
function function_5d9830f341fbd83a() {
    return "ks_remote_map_mp";
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0x179
function function_a5839924b6723eac(info, selectnum, directionalselection) {
    if (!isdefined(info)) {
        assertmsg("No Streak / Super info defined when using map select");
        return;
    }
    issuper = isdefined(self.super) && self.super == info;
    val::group_set("map_select", 0);
    self setsoundsubmix("mp_killstreak_overlay");
    navmesh = 0;
    if (isdefined(info.streakname)) {
        if (isnavmeshkillstreak(info.streakname)) {
            navmesh = 1;
        }
    }
    if (!isdefined(selectnum)) {
        selectnum = 1;
    }
    if (!isdefined(directionalselection)) {
        directionalselection = 0;
    }
    thread function_b34ec2892ae5b88d(info, issuper);
    thread function_f2e8c1603fc727ea();
    thread function_69db129634b2bcb();
    mappointinfo = undefined;
    streakref = info.streakname;
    if (istrue(issuper)) {
        streakref = info.staticdata.ref;
    }
    scripts\cp_mp\utility\killstreak_utility::starttabletscreen(streakref, 0.05);
    mappointinfo = function_7023c245afe8cd79(selectnum, directionalselection);
    if (isdefined(self)) {
        time = 0.75;
        if (istrue(self.var_4a2f2f50a9020e2e)) {
            time = 0;
        }
        scripts\cp_mp\utility\killstreak_utility::stoptabletscreen(streakref, time);
        if (isreallyalive(self)) {
            val::group_reset("map_select");
        }
        self clearsoundsubmix("mp_killstreak_overlay");
    }
    return mappointinfo;
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x586
// Size: 0x264
function function_7023c245afe8cd79(selectnum, directionalselection) {
    self endon("disconnect");
    usehints = 1;
    if (selectnum <= 1) {
        self setclientomnvar("ui_map_select_uses", -1);
        usehints = 0;
    }
    self.mapselectpickcounter = 0;
    self.previousmapselectioninfo = undefined;
    locationinfo = [];
    thread function_12a0597458af2369();
    if (istrue(usehints)) {
        self setclientomnvar("ui_map_select_uses", selectnum);
        self setclientomnvar("ui_map_select_count", selectnum);
    }
    returninfo = undefined;
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", ["file_line_info", "Before ui_map_select_uses"]);
    while (self.mapselectpickcounter < selectnum) {
        returninfo = waittill_confirm_or_cancel("confirm_location", "cancel_location", "death");
        if (!isdefined(returninfo) || returninfo.string == "death") {
            self.var_4a2f2f50a9020e2e = 1;
            locationinfo = undefined;
            break;
        } else if (returninfo.string == "cancel_location") {
            locationinfo = undefined;
            self playlocalsound("iw9_ks_tablet_ui_select_final_plr");
            break;
        }
        var_4d08a3ddec28e17b = returninfo.location + (0, 0, 10000);
        var_3cb14aea5687b8f6 = returninfo.location - (0, 0, 10000);
        drivablevehicles = scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_getgameinstancesforall();
        killstreakmodels = level.activekillstreaks;
        var_b9d5783a4f34efbc = array_combine(drivablevehicles, killstreakmodels);
        contentoverride = scripts\engine\trace::create_contents(0, 1, 0, 1, 1, 0, 0, 0, 0);
        locationtrace = scripts\engine\trace::ray_trace(var_4d08a3ddec28e17b, var_3cb14aea5687b8f6, var_b9d5783a4f34efbc, contentoverride, 0, 1);
        returninfo.location = locationtrace["position"];
        locationinfo[locationinfo.size] = returninfo;
        self.mapselectpickcounter++;
        self playlocalsound("iw9_ks_tablet_ui_select_plr");
        if (istrue(usehints)) {
            self setclientomnvar("ui_map_select_uses", selectnum - self.mapselectpickcounter);
        }
    }
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", ["file_line_info", "After ui_map_select_uses"]);
    self notify("map_select_exit", returninfo);
    return locationinfo;
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3
// Size: 0x42
function function_12a0597458af2369() {
    self endon("map_select_exit");
    while (true) {
        currentweapon = self getcurrentweapon();
        if (currentweapon.basename != "ks_remote_map_mp") {
            self notify("cancel_location");
            break;
        }
        waitframe();
    }
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83d
// Size: 0x3e
function function_b34ec2892ae5b88d(info, issuper) {
    self endon("disconnect");
    level endon("game_ended");
    exitinfo = self waittill("map_select_exit");
    function_4f783849d35ee7(info, issuper, exitinfo);
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x883
// Size: 0x34
function function_f2e8c1603fc727ea() {
    self endon("disconnect");
    self endon("map_select_exit");
    level endon("game_ended");
    while (true) {
        if (scripts\cp_mp\emp_debuff::is_empd()) {
            self notify("cancel_location");
            break;
        }
        waitframe();
    }
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bf
// Size: 0x42
function function_69db129634b2bcb() {
    self endon("disconnect");
    self endon("map_select_exit");
    level endon("game_ended");
    self setclientomnvar("ui_location_selection_countdown", gettime() + 30000);
    waittill_any_timeout_1(30, "death");
    self notify("cancel_location");
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x167
function function_90f093ca8576232f(navmesh, directionalselection, directionaltype, selectortype, info, selectorradius) {
    if (!isdefined(self.pers["startedMapSelect"])) {
        self.pers["startedMapSelect"] = [];
        thread function_b5fc9b44b6730955();
    }
    if (isdefined(info)) {
        if (function_5834a9b56f5426c(info)) {
            if (isdefined(info.streakname)) {
                streakbundle = level.streakglobals.streakbundles[info.streakname];
                if (!isdefined(streakbundle) || !istrue(streakbundle.var_78ca6251f086bb17)) {
                    triggeroneoffradarsweep(self);
                }
            }
            var_d8a763b4fba17240 = function_13b26fcc6dde1c17(info);
            self.pers["startedMapSelect"][var_d8a763b4fba17240] = info;
        }
    }
    if (!isdefined(navmesh)) {
        navmesh = 0;
    }
    if (!isdefined(directionalselection)) {
        directionalselection = 0;
    }
    if (!isdefined(directionaltype)) {
        directionaltype = "circle_marker";
    }
    if (!isdefined(selectortype)) {
        selectortype = 0;
    }
    if (!isdefined(selectorradius)) {
        selectorradius = 1000;
    }
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", ["file_line_info", "Before BeginLocationSelection"]);
    self beginlocationselection(navmesh, directionalselection, directionaltype, 1, selectortype, selectorradius);
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", ["file_line_info", "After BeginLocationSelection"]);
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa78
// Size: 0xe4
function function_4f783849d35ee7(info, issuper, exitinfo) {
    self.mapselectpickcounter = undefined;
    self.mapselectdircounter = undefined;
    self.previousmapselectioninfo = undefined;
    if (isreallyalive(self)) {
        if (istrue(issuper)) {
            self notify("super_finished_with_deploy_weapon");
        } else {
            info notify("killstreak_finished_with_deploy_weapon");
        }
    }
    if (exitinfo.string == "confirm_location" || exitinfo.string == "death") {
        var_d8a763b4fba17240 = function_13b26fcc6dde1c17(info);
        self.pers["startedMapSelect"] = array_remove_index(self.pers["startedMapSelect"], var_d8a763b4fba17240, 1);
    }
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.25);
    if (isdefined(self)) {
        self endlocationselection();
        self setclientomnvar("ui_map_select_count", -1);
    }
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb64
// Size: 0x8e
function private function_5834a9b56f5426c(info) {
    var_e4a2bc835644693 = self.pers["startedMapSelect"];
    if (isdefined(var_e4a2bc835644693)) {
        foreach (instance in var_e4a2bc835644693) {
            if (!function_a8d72277fd0a66cc(instance, info)) {
                return false;
            }
            if (!function_e687e3855c8f00ff(instance, info)) {
                return false;
            }
        }
    }
    return true;
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbfb
// Size: 0x7f
function private function_a8d72277fd0a66cc(var_755a09c275461972, newinfo) {
    if (isdefined(var_755a09c275461972.staticdata) && isdefined(newinfo.staticdata)) {
        if (var_755a09c275461972.staticdata.ref == newinfo.staticdata.ref && var_755a09c275461972.lifeid == newinfo.lifeid) {
            return false;
        }
    }
    return true;
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc83
// Size: 0x6b
function private function_e687e3855c8f00ff(var_755a09c275461972, newinfo) {
    if (isdefined(var_755a09c275461972.streakname) && isdefined(newinfo.streakname)) {
        if (var_755a09c275461972.streakname == newinfo.streakname && var_755a09c275461972.lifeid == newinfo.lifeid) {
            return false;
        }
    }
    return true;
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcf7
// Size: 0x31
function private function_b5fc9b44b6730955() {
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        self waittill("death");
        self.pers["startedMapSelect"] = [];
    }
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd30
// Size: 0x70
function private function_13b26fcc6dde1c17(info) {
    var_d8a763b4fba17240 = undefined;
    if (isdefined(info.staticdata)) {
        var_d8a763b4fba17240 = info.staticdata.ref;
    } else if (isdefined(info.streakname)) {
        var_d8a763b4fba17240 = info.streakname;
    }
    if (!isdefined(var_d8a763b4fba17240)) {
        /#
            iprintln("<dev string:x1c>");
        #/
    }
    return var_d8a763b4fba17240;
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda9
// Size: 0x105
function waittill_confirm_or_cancel(confirmstring, cancelstring, endstring) {
    if ((!isdefined(confirmstring) || confirmstring != "death") && (!isdefined(cancelstring) || cancelstring != "death") && (!isdefined(endstring) || endstring != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(confirmstring)) {
        childthread waittill_return(confirmstring, ent);
    }
    if (isdefined(cancelstring)) {
        childthread waittill_return(cancelstring, ent);
    }
    if (isdefined(endstring)) {
        childthread waittill_return(endstring, ent);
    }
    location, angle, string = ent waittill("returned");
    ent notify("die");
    returninfo = spawnstruct();
    returninfo.location = location;
    returninfo.angles = angle;
    returninfo.string = string;
    return returninfo;
}

// Namespace mapselect / scripts\mp\killstreaks\mapselect
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0x50
function private waittill_return(confirmstring, ent) {
    if (confirmstring != "death") {
        self endon("death");
    }
    ent endon("die");
    location, angle = self waittill(confirmstring);
    ent notify("returned", location, angle, confirmstring);
}

