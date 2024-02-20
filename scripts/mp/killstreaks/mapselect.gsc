// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\hostmigration.gsc;

#namespace namespace_93a0b165a72baca5;

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x372
// Size: 0xa
function init() {
    function_8bb8ac075d5a87dc();
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383
// Size: 0x6a
function function_8bb8ac075d5a87dc() {
    val::function_2d6e7e0b80767910("map_select", [0:"usability", 1:"killstreaks", 2:"supers", 3:"gesture", 4:"fire", 5:"weapon_switch", 6:"allow_movement", 7:"offhand_weapons", 8:"allow_jump", 9:"mantle"]);
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f4
// Size: 0x8
function function_5d9830f341fbd83a() {
    return "ks_remote_map_mp";
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0x17a
function function_a5839924b6723eac(info, var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff) {
    if (!isdefined(info)) {
        /#
            assertmsg("No Streak / Super info defined when using map select");
        #/
        return;
    }
    issuper = isdefined(self.super) && self.super == info;
    val::function_3633b947164be4f3("map_select", 0);
    self setsoundsubmix("mp_killstreak_overlay");
    navmesh = 0;
    if (isdefined(info.streakname)) {
        if (isnavmeshkillstreak(info.streakname)) {
            navmesh = 1;
        }
    }
    if (!isdefined(var_cdce0f8be900c487)) {
        var_cdce0f8be900c487 = 1;
    }
    if (!isdefined(var_edc5bb5a4b3dd2ff)) {
        var_edc5bb5a4b3dd2ff = 0;
    }
    thread function_b34ec2892ae5b88d(info, issuper);
    thread function_f2e8c1603fc727ea();
    thread function_69db129634b2bcb();
    mappointinfo = undefined;
    var_2b7cf61af0cb9960 = info.streakname;
    if (istrue(issuper)) {
        var_2b7cf61af0cb9960 = info.staticdata.ref;
    }
    namespace_9abe40d2af041eb2::starttabletscreen(var_2b7cf61af0cb9960, 0.05);
    mappointinfo = function_7023c245afe8cd79(var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff);
    if (isdefined(self)) {
        time = 0.75;
        if (istrue(self.var_4a2f2f50a9020e2e)) {
            time = 0;
        }
        namespace_9abe40d2af041eb2::stoptabletscreen(var_2b7cf61af0cb9960, time);
        if (isreallyalive(self)) {
            val::function_588f2307a3040610("map_select");
        }
        self clearsoundsubmix("mp_killstreak_overlay");
    }
    return mappointinfo;
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x586
// Size: 0x265
function function_7023c245afe8cd79(var_cdce0f8be900c487, var_edc5bb5a4b3dd2ff) {
    self endon("disconnect");
    var_5f98d5a0f5a0c736 = 1;
    if (var_cdce0f8be900c487 <= 1) {
        self setclientomnvar("ui_map_select_uses", -1);
        var_5f98d5a0f5a0c736 = 0;
    }
    self.mapselectpickcounter = 0;
    self.previousmapselectioninfo = undefined;
    locationinfo = [];
    thread function_12a0597458af2369();
    if (istrue(var_5f98d5a0f5a0c736)) {
        self setclientomnvar("ui_map_select_uses", var_cdce0f8be900c487);
        self setclientomnvar("ui_map_select_count", var_cdce0f8be900c487);
    }
    var_6e586a99fa56a20f = undefined;
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", [0:"file_line_info", 1:"Before ui_map_select_uses"]);
    while (self.mapselectpickcounter < var_cdce0f8be900c487) {
        var_6e586a99fa56a20f = waittill_confirm_or_cancel("confirm_location", "cancel_location", "death");
        if (!isdefined(var_6e586a99fa56a20f) || var_6e586a99fa56a20f.string == "death") {
            self.var_4a2f2f50a9020e2e = 1;
            locationinfo = undefined;
            break;
        } else if (var_6e586a99fa56a20f.string == "cancel_location") {
            locationinfo = undefined;
            self playlocalsound("iw9_ks_tablet_ui_select_final_plr");
            break;
        }
        var_4d08a3ddec28e17b = var_6e586a99fa56a20f.location + (0, 0, 10000);
        var_3cb14aea5687b8f6 = var_6e586a99fa56a20f.location - (0, 0, 10000);
        var_f590bcbaffb210c5 = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstancesforall();
        var_d4c559b594ad3df9 = level.activekillstreaks;
        var_b9d5783a4f34efbc = array_combine(var_f590bcbaffb210c5, var_d4c559b594ad3df9);
        contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 0, 0, 0, 0);
        var_9083ea775f3b0cd7 = namespace_2a184fc4902783dc::ray_trace(var_4d08a3ddec28e17b, var_3cb14aea5687b8f6, var_b9d5783a4f34efbc, contentoverride, 0, 1);
        var_6e586a99fa56a20f.location = var_9083ea775f3b0cd7["position"];
        locationinfo[locationinfo.size] = var_6e586a99fa56a20f;
        self.mapselectpickcounter++;
        self playlocalsound("iw9_ks_tablet_ui_select_plr");
        if (istrue(var_5f98d5a0f5a0c736)) {
            self setclientomnvar("ui_map_select_uses", var_cdce0f8be900c487 - self.mapselectpickcounter);
        }
    }
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", [0:"file_line_info", 1:"After ui_map_select_uses"]);
    self notify("map_select_exit", var_6e586a99fa56a20f);
    return locationinfo;
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3
// Size: 0x43
function function_12a0597458af2369() {
    self endon("map_select_exit");
    while (1) {
        currentweapon = self getcurrentweapon();
        if (currentweapon.basename != "ks_remote_map_mp") {
            self notify("cancel_location");
            break;
        }
        waitframe();
    }
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83d
// Size: 0x3f
function function_b34ec2892ae5b88d(info, issuper) {
    self endon("disconnect");
    level endon("game_ended");
    var_1d7a120a5df60069 = self waittill("map_select_exit");
    function_4f783849d35ee7(info, issuper, var_1d7a120a5df60069);
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x883
// Size: 0x35
function function_f2e8c1603fc727ea() {
    self endon("disconnect");
    self endon("map_select_exit");
    level endon("game_ended");
    while (1) {
        if (namespace_5a51aa78ea0b1b9f::is_empd()) {
            self notify("cancel_location");
            break;
        }
        waitframe();
    }
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bf
// Size: 0x43
function function_69db129634b2bcb() {
    self endon("disconnect");
    self endon("map_select_exit");
    level endon("game_ended");
    self setclientomnvar("ui_location_selection_countdown", gettime() + 30000);
    waittill_any_timeout_1(30, "death");
    self notify("cancel_location");
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909
// Size: 0x168
function function_90f093ca8576232f(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3, var_3922786267ccc2a8, info, var_21c5bcd110cb0cc6) {
    if (!isdefined(self.pers["startedMapSelect"])) {
        self.pers["startedMapSelect"] = [];
        thread function_b5fc9b44b6730955();
    }
    if (isdefined(info)) {
        if (function_5834a9b56f5426c(info)) {
            if (isdefined(info.streakname)) {
                var_cbab602e6919aad7 = level.var_b23156d776b1d85.var_38f2a11237246ac[info.streakname];
                if (!isdefined(var_cbab602e6919aad7) || !istrue(var_cbab602e6919aad7.var_78ca6251f086bb17)) {
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
    if (!isdefined(var_edc5bb5a4b3dd2ff)) {
        var_edc5bb5a4b3dd2ff = 0;
    }
    if (!isdefined(var_7426e996c9eb34d3)) {
        var_7426e996c9eb34d3 = "circle_marker";
    }
    if (!isdefined(var_3922786267ccc2a8)) {
        var_3922786267ccc2a8 = 0;
    }
    if (!isdefined(var_21c5bcd110cb0cc6)) {
        var_21c5bcd110cb0cc6 = 1000;
    }
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", [0:"file_line_info", 1:"Before BeginLocationSelection"]);
    self beginlocationselection(navmesh, var_edc5bb5a4b3dd2ff, var_7426e996c9eb34d3, 1, var_3922786267ccc2a8, var_21c5bcd110cb0cc6);
    self dlog_recordplayerevent("dlog_event_killstreak_tablet", [0:"file_line_info", 1:"After BeginLocationSelection"]);
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa78
// Size: 0xe5
function function_4f783849d35ee7(info, issuper, var_1d7a120a5df60069) {
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
    if (var_1d7a120a5df60069.string == "confirm_location" || var_1d7a120a5df60069.string == "death") {
        var_d8a763b4fba17240 = function_13b26fcc6dde1c17(info);
        self.pers["startedMapSelect"] = array_remove_index(self.pers["startedMapSelect"], var_d8a763b4fba17240, 1);
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.25);
    if (isdefined(self)) {
        self endlocationselection();
        self setclientomnvar("ui_map_select_count", -1);
    }
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb64
// Size: 0x8f
function private function_5834a9b56f5426c(info) {
    var_e4a2bc835644693 = self.pers["startedMapSelect"];
    if (isdefined(var_e4a2bc835644693)) {
        foreach (instance in var_e4a2bc835644693) {
            if (!function_a8d72277fd0a66cc(instance, info)) {
                return 0;
            } else if (!function_e687e3855c8f00ff(instance, info)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbfb
// Size: 0x80
function private function_a8d72277fd0a66cc(var_755a09c275461972, var_921a13367f73ab4d) {
    if (isdefined(var_755a09c275461972.staticdata) && isdefined(var_921a13367f73ab4d.staticdata)) {
        if (var_755a09c275461972.staticdata.ref == var_921a13367f73ab4d.staticdata.ref && var_755a09c275461972.lifeid == var_921a13367f73ab4d.lifeid) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc83
// Size: 0x6c
function private function_e687e3855c8f00ff(var_755a09c275461972, var_921a13367f73ab4d) {
    if (isdefined(var_755a09c275461972.streakname) && isdefined(var_921a13367f73ab4d.streakname)) {
        if (var_755a09c275461972.streakname == var_921a13367f73ab4d.streakname && var_755a09c275461972.lifeid == var_921a13367f73ab4d.lifeid) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcf7
// Size: 0x32
function private function_b5fc9b44b6730955() {
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        self waittill("death");
        self.pers["startedMapSelect"] = [];
    }
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd30
// Size: 0x71
function private function_13b26fcc6dde1c17(info) {
    var_d8a763b4fba17240 = undefined;
    if (isdefined(info.staticdata)) {
        var_d8a763b4fba17240 = info.staticdata.ref;
    } else if (isdefined(info.streakname)) {
        var_d8a763b4fba17240 = info.streakname;
    }
    if (!isdefined(var_d8a763b4fba17240)) {
        /#
            iprintln("game_ended");
        #/
    }
    return var_d8a763b4fba17240;
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda9
// Size: 0x106
function waittill_confirm_or_cancel(var_12e3586b64301806, var_9ba4fcfeb48763ba, endstring) {
    if ((!isdefined(var_12e3586b64301806) || var_12e3586b64301806 != "death") && (!isdefined(var_9ba4fcfeb48763ba) || var_9ba4fcfeb48763ba != "death") && (!isdefined(endstring) || endstring != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(var_12e3586b64301806)) {
        childthread waittill_return(var_12e3586b64301806, ent);
    }
    if (isdefined(var_9ba4fcfeb48763ba)) {
        childthread waittill_return(var_9ba4fcfeb48763ba, ent);
    }
    if (isdefined(endstring)) {
        childthread waittill_return(endstring, ent);
    }
    string = angle = location = ent waittill("returned");
    ent notify("die");
    var_6e586a99fa56a20f = spawnstruct();
    var_6e586a99fa56a20f.location = location;
    var_6e586a99fa56a20f.angles = angle;
    var_6e586a99fa56a20f.string = string;
    return var_6e586a99fa56a20f;
}

// Namespace namespace_93a0b165a72baca5/namespace_bc3bdbac7cebdc14
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0x51
function private waittill_return(var_12e3586b64301806, ent) {
    if (var_12e3586b64301806 != "death") {
        self endon("death");
    }
    ent endon("die");
    angle = location = self waittill(var_12e3586b64301806);
    ent notify("returned", location);
}

