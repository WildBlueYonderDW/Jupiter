// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\damage.gsc;

#namespace remoteuav;

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa66
// Size: 0x2c0
function init() {
    level.remoteuav_fx["explode"] = loadfx("vfx/core/expl/bouncing_betty_explosion");
    level.remoteuav_fx["missile_explode"] = loadfx("vfx/iw8_mp/killstreak/vfx_apache_explosion");
    level.remoteuav_dialog["launch"][0] = "ac130_plt_yeahcleared";
    level.remoteuav_dialog["launch"][1] = "ac130_plt_rollinin";
    level.remoteuav_dialog["launch"][2] = "ac130_plt_scanrange";
    level.remoteuav_dialog["out_of_range"][0] = "ac130_plt_cleanup";
    level.remoteuav_dialog["out_of_range"][1] = "ac130_plt_targetreset";
    level.remoteuav_dialog["track"][0] = "ac130_fco_moreenemy";
    level.remoteuav_dialog["track"][1] = "ac130_fco_getthatguy";
    level.remoteuav_dialog["track"][2] = "ac130_fco_guymovin";
    level.remoteuav_dialog["track"][3] = "ac130_fco_getperson";
    level.remoteuav_dialog["track"][4] = "ac130_fco_guyrunnin";
    level.remoteuav_dialog["track"][5] = "ac130_fco_gotarunner";
    level.remoteuav_dialog["track"][6] = "ac130_fco_backonthose";
    level.remoteuav_dialog["track"][7] = "ac130_fco_gonnagethim";
    level.remoteuav_dialog["track"][8] = "ac130_fco_personnelthere";
    level.remoteuav_dialog["track"][9] = "ac130_fco_rightthere";
    level.remoteuav_dialog["track"][10] = "ac130_fco_tracking";
    level.remoteuav_dialog["tag"][0] = "ac130_fco_nice";
    level.remoteuav_dialog["tag"][1] = "ac130_fco_yougothim";
    level.remoteuav_dialog["tag"][2] = "ac130_fco_yougothim2";
    level.remoteuav_dialog["tag"][3] = "ac130_fco_okyougothim";
    level.remoteuav_dialog["assist"][0] = "ac130_fco_goodkill";
    level.remoteuav_dialog["assist"][1] = "ac130_fco_thatsahit";
    level.remoteuav_dialog["assist"][2] = "ac130_fco_directhit";
    level.remoteuav_dialog["assist"][3] = "ac130_fco_rightontarget";
    level.remoteuav_lastdialogtime = 0;
    level.remoteuav_nodeployzones = getentarray("no_vehicles", "targetname");
    /#
        assertmsg("If this killstreak is used in the future, it needs to be updated to do it's own deployment.");
    #/
    level.remote_uav = [];
    /#
        setdevdvarifuninitialized(@"hash_da7c6c2551fb9f41", 60);
    #/
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd2d
// Size: 0x20
function useremoteuav(lifeid, streakname) {
    return tryuseremoteuav(lifeid, "remote_uav");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd55
// Size: 0x64
function exceededmaxremoteuavs(team) {
    if (getgametype() == "dm") {
        if (isdefined(level.remote_uav[team]) || isdefined(level.remote_uav[getotherteam(team)[0]])) {
            return 1;
        } else {
            return 0;
        }
    } else if (isdefined(level.remote_uav[team])) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc0
// Size: 0x16b
function tryuseremoteuav(lifeid, streakname) {
    val::set("remote_uav", "usability", 0);
    if (isusingremote() || self isusingturret() || isdefined(level.nukeinfo.var_9dccaba98b643cad)) {
        val::function_c9d0b43701bdba00("remote_uav");
        return 0;
    }
    var_4440147083abaf0a = 1;
    if (exceededmaxremoteuavs(self.team) || level.littlebirds.size >= 4) {
        self iprintlnbold("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        val::function_c9d0b43701bdba00("remote_uav");
        return 0;
    } else if (currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount + var_4440147083abaf0a >= maxvehiclesallowed()) {
        self iprintlnbold("KILLSTREAKS/TOO_MANY_VEHICLES");
        val::function_c9d0b43701bdba00("remote_uav");
        return 0;
    }
    self setplayerdata("reconDroneState", "staticAlpha", 0);
    self setplayerdata("reconDroneState", "incomingMissile", 0);
    incrementfauxvehiclecount();
    result = givecarryremoteuav(lifeid, streakname);
    if (result) {
        utility::trycall(level.matchdata_logkillstreakevent, streakname, self.origin);
        thread teamplayercardsplash("used_remote_uav", self);
    } else {
        decrementfauxvehiclecount();
    }
    self.iscarrying = 0;
    return result;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf33
// Size: 0xe1
function givecarryremoteuav(lifeid, streakname) {
    var_1ccd129c7750015e = createcarryremoteuav(streakname, self);
    _takeweapon("killstreak_uav_mp");
    _giveweapon("killstreak_remote_uav_mp");
    _switchtoweaponimmediate("killstreak_remote_uav_mp");
    setcarryingremoteuav(var_1ccd129c7750015e);
    if (isalive(self) && isdefined(var_1ccd129c7750015e)) {
        origin = var_1ccd129c7750015e.origin;
        angles = self.angles;
        var_1ccd129c7750015e.soundent delete();
        var_1ccd129c7750015e delete();
        result = startremoteuav(lifeid, streakname, origin, angles);
    } else {
        result = 0;
        if (isalive(self)) {
            _takeweapon("killstreak_remote_uav_mp");
            _giveweapon("killstreak_uav_mp");
        }
    }
    return result;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101c
// Size: 0x206
function createcarryremoteuav(streakname, owner) {
    pos = owner.origin + anglestoforward(owner.angles) * 4 + anglestoup(owner.angles) * 50;
    var_1ccd129c7750015e = spawnturret("misc_turret", pos, "sentry_minigun_mp");
    var_1ccd129c7750015e.origin = pos;
    var_1ccd129c7750015e.angles = owner.angles;
    var_1ccd129c7750015e.sentrytype = "sentry_minigun";
    var_1ccd129c7750015e.canbeplaced = 1;
    var_1ccd129c7750015e setturretmodechangewait(1);
    var_1ccd129c7750015e setmode("sentry_offline");
    var_1ccd129c7750015e makeunusable();
    var_1ccd129c7750015e maketurretinoperable();
    var_1ccd129c7750015e.owner = owner;
    var_1ccd129c7750015e setsentryowner(var_1ccd129c7750015e.owner);
    var_1ccd129c7750015e.scale = 3;
    var_1ccd129c7750015e.inheliproximity = 0;
    var_1ccd129c7750015e thread carryremoteuav_handleexistence();
    var_1ccd129c7750015e.rangetrigger = getent("remote_uav_range", "targetname");
    if (!isdefined(var_1ccd129c7750015e.rangetrigger)) {
        var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
        var_1ccd129c7750015e.maxheight = var_5fa1e1697a302583.origin[2];
        var_1ccd129c7750015e.maxdistance = 3600;
    }
    var_1ccd129c7750015e.soundent = spawn("script_origin", var_1ccd129c7750015e.origin);
    var_1ccd129c7750015e.soundent.angles = var_1ccd129c7750015e.angles;
    var_1ccd129c7750015e.soundent.origin = var_1ccd129c7750015e.origin;
    var_1ccd129c7750015e.soundent linkto(var_1ccd129c7750015e);
    var_1ccd129c7750015e.soundent playloopsound("recondrone_idle_high");
    return var_1ccd129c7750015e;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122a
// Size: 0x177
function setcarryingremoteuav(var_1ccd129c7750015e) {
    var_1ccd129c7750015e thread carryremoteuav_setcarried(self);
    self notifyonplayercommand("place_carryRemoteUAV", "+attack");
    self notifyonplayercommand("place_carryRemoteUAV", "+attack_akimbo_accessible");
    self notifyonplayercommand("cancel_carryRemoteUAV", "+actionslot 4");
    if (!self isconsoleplayer()) {
        self notifyonplayercommand("cancel_carryRemoteUAV", "+actionslot 5");
        self notifyonplayercommand("cancel_carryRemoteUAV", "+actionslot 6");
        self notifyonplayercommand("cancel_carryRemoteUAV", "+actionslot 7");
    }
    for (;;) {
        result = local_waittill_any_return_6("place_carryRemoteUAV", "cancel_carryRemoteUAV", "weapon_switch_started", "force_cancel_placement", "death_or_disconnect");
        self forceusehintoff();
        if (result != "place_carryRemoteUAV") {
            carryremoteuav_delete(var_1ccd129c7750015e);
            break;
        }
        if (!var_1ccd129c7750015e.canbeplaced) {
            if (self.team != "spectator") {
                self forceusehinton("KILLSTREAKS_REMOTE_UAV_CANNOT_PLACE");
            }
        } else {
            if (exceededmaxremoteuavs(self.team) || currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount >= maxvehiclesallowed()) {
                self iprintlnbold("KILLSTREAKS/TOO_MANY_VEHICLES");
                carryremoteuav_delete(var_1ccd129c7750015e);
                break;
            }
            self.iscarrying = 0;
            var_1ccd129c7750015e.carriedby = undefined;
            var_1ccd129c7750015e playsound("sentry_gun_plant");
            var_1ccd129c7750015e notify("placed");
            break;
        }
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a8
// Size: 0x122
function local_waittill_any_return_6(string1, string2, string3, string4, string5, string6) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        thread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        thread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        thread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        thread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        thread waittill_string(string5, ent);
    }
    if (isdefined(string6)) {
        thread waittill_string(string6, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d2
// Size: 0x4d
function carryremoteuav_setcarried(carrier) {
    self setcandamage(0);
    self setsentrycarrier(carrier);
    self notsolid();
    self.carriedby = carrier;
    carrier.iscarrying = 1;
    carrier thread updatecarryremoteuavplacement(self);
    self notify("carried");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1526
// Size: 0x42
function carryremoteuav_delete(var_1ccd129c7750015e) {
    self.iscarrying = 0;
    if (isdefined(var_1ccd129c7750015e)) {
        if (isdefined(var_1ccd129c7750015e.soundent)) {
            var_1ccd129c7750015e.soundent delete();
        }
        var_1ccd129c7750015e delete();
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156f
// Size: 0x79
function isinremotenodeploy() {
    if (isdefined(level.remoteuav_nodeployzones) && level.remoteuav_nodeployzones.size) {
        foreach (zone in level.remoteuav_nodeployzones) {
            if (self istouching(zone)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f0
// Size: 0x1aa
function updatecarryremoteuavplacement(var_1ccd129c7750015e) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_1ccd129c7750015e endon("placed");
    var_1ccd129c7750015e endon("death");
    var_1ccd129c7750015e.canbeplaced = 1;
    var_b89a549815ee28d3 = -1;
    val::function_c9d0b43701bdba00("remote_uav");
    for (;;) {
        heightoffset = 18;
        switch (self getstance()) {
        case #"hash_c6775c88e38f7803":
            heightoffset = 40;
            break;
        case #"hash_3fed0cbd303639eb":
            heightoffset = 25;
            break;
        case #"hash_d91940431ed7c605":
            heightoffset = 10;
            break;
        }
        placement = self canplayerplacetank(22, 22, 50, heightoffset, 0, 0);
        var_1ccd129c7750015e.origin = placement["origin"] + anglestoup(self.angles) * (18 - -9);
        var_1ccd129c7750015e.angles = placement["angles"];
        var_1ccd129c7750015e.canbeplaced = self isonground() && placement["result"] && var_1ccd129c7750015e remoteuav_in_range() && !var_1ccd129c7750015e isinremotenodeploy();
        if (var_1ccd129c7750015e.canbeplaced != var_b89a549815ee28d3) {
            if (var_1ccd129c7750015e.canbeplaced) {
                if (self.team != "spectator") {
                    self forceusehinton("KILLSTREAKS_REMOTE_UAV_PLACE");
                }
                if (self attackbuttonpressed()) {
                    self notify("place_carryRemoteUAV");
                }
            } else if (self.team != "spectator") {
                self forceusehinton("KILLSTREAKS_REMOTE_UAV_CANNOT_PLACE");
            }
        }
        var_b89a549815ee28d3 = var_1ccd129c7750015e.canbeplaced;
        waitframe();
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a1
// Size: 0x6f
function carryremoteuav_handleexistence() {
    level endon("game_ended");
    self.owner endon("place_carryRemoteUAV");
    self.owner endon("cancel_carryRemoteUAV");
    self.owner waittill_any_3("death_or_disconnect", "joined_team", "joined_spectators");
    if (isdefined(self)) {
        if (isdefined(self.soundent)) {
            self.soundent delete();
        }
        self delete();
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1817
// Size: 0x17
function removeremoteweapon() {
    level endon("game_ended");
    self endon("disconnect");
    wait(0.7);
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1835
// Size: 0x164
function startremoteuav(lifeid, streakname, origin, angles) {
    lockplayerforremoteuavlaunch();
    setusingremote(streakname);
    _giveweapon("uav_remote_mp");
    _switchtoweaponimmediate("uav_remote_mp");
    self visionsetnakedforplayer("black_bw", 0);
    result = namespace_58a74e7d54b56e8d::initridekillstreak("remote_uav");
    if (result != "success") {
        if (result != "disconnect") {
            self notify("remoteuav_unlock");
            _takeweapon("uav_remote_mp");
            clearusingremote();
        }
        val::function_c9d0b43701bdba00("ride_killstreak");
        return 0;
    }
    if (exceededmaxremoteuavs(self.team) || currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount >= maxvehiclesallowed()) {
        self iprintlnbold("KILLSTREAKS/TOO_MANY_VEHICLES");
        self notify("remoteuav_unlock");
        _takeweapon("uav_remote_mp");
        clearusingremote();
        return 0;
    }
    self notify("remoteuav_unlock");
    remoteuav = createremoteuav(lifeid, self, streakname, origin, angles);
    if (isdefined(remoteuav)) {
        thread remoteuav_ride(lifeid, remoteuav, streakname);
        return 1;
    } else {
        self iprintlnbold("KILLSTREAKS/TOO_MANY_VEHICLES");
        _takeweapon("uav_remote_mp");
        clearusingremote();
        return 0;
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a0
// Size: 0x39
function lockplayerforremoteuavlaunch() {
    lockspot = spawn("script_origin", self.origin);
    lockspot hide();
    self playerlinkto(lockspot);
    thread clearplayerlockfromremoteuavlaunch(lockspot);
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e0
// Size: 0x46
function clearplayerlockfromremoteuavlaunch(lockspot) {
    level endon("game_ended");
    msg = waittill_any_return_2("death_or_disconnect", "remoteuav_unlock");
    if (msg != "disconnect") {
        self unlink();
    }
    lockspot delete();
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2d
// Size: 0x23b
function createremoteuav(lifeid, owner, streakname, origin, angles) {
    if (owner isconsoleplayer()) {
        remoteuav = spawnhelicopter(owner, origin, angles, "remote_uav_mp", "vehicle_remote_uav");
    } else {
        remoteuav = spawnhelicopter(owner, origin, angles, "remote_uav_mp_pc", "vehicle_remote_uav");
    }
    if (!isdefined(remoteuav)) {
        return undefined;
    }
    /#
        assertmsg("This needs to be fixed if remote UAV. Don't try to add to little bird list....");
    #/
    remoteuav makevehiclesolidcapsule(18, -9, 18);
    remoteuav.lifeid = lifeid;
    remoteuav.team = owner.team;
    remoteuav.pers["team"] = owner.team;
    remoteuav.owner = owner;
    remoteuav setotherent(owner);
    remoteuav namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Air", owner);
    remoteuav.maxhealth = 250;
    remoteuav.scrambler = spawn("script_model", origin);
    remoteuav.scrambler linkto(remoteuav, "tag_origin", (0, 0, -160), (0, 0, 0));
    remoteuav.scrambler makescrambler(owner);
    remoteuav.smoking = 0;
    remoteuav.inheliproximity = 0;
    remoteuav.helitype = "remote_uav";
    remoteuav.markedplayers = [];
    remoteuav thread remoteuav_light_fx();
    remoteuav thread remoteuav_explode_on_disconnect();
    remoteuav thread remoteuav_explode_on_changeteams();
    remoteuav thread remoteuav_explode_on_death();
    remoteuav thread remoteuav_clear_marked_on_gameended();
    remoteuav thread remoteuav_leave_on_timeout();
    remoteuav thread remoteuav_watch_distance();
    remoteuav thread remoteuav_watchheliproximity();
    remoteuav thread remoteuav_handledamage();
    remoteuav.numflares = 2;
    remoteuav.hasincoming = 0;
    remoteuav.incomingmissiles = [];
    remoteuav thread remoteuav_clearincomingwarning();
    remoteuav thread remoteuav_handleincomingstinger();
    remoteuav thread remoteuav_handleincomingsam();
    level.remote_uav[remoteuav.team] = remoteuav;
    return remoteuav;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c70
// Size: 0xbc
function remoteuav_ride(lifeid, remoteuav, streakname) {
    remoteuav.playerlinked = 1;
    self.restoreangles = self.angles;
    if (getdvarint(@"hash_c00e244ea59d530e")) {
        setthirdpersondof(0);
    }
    self cameralinkto(remoteuav, "tag_origin");
    self remotecontrolvehicle(remoteuav);
    thread remoteuav_playerexit(remoteuav);
    thread remoteuav_track(remoteuav);
    thread remoteuav_fire(remoteuav);
    self.remote_uav_ridelifeid = lifeid;
    self.remoteuav = remoteuav;
    thread remoteuav_delaylaunchdialog(remoteuav);
    self visionsetnakedforplayer("black_bw", 0);
    restorebasevisionset(1);
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d33
// Size: 0x3e
function remoteuav_delaylaunchdialog(remoteuav) {
    level endon("game_ended");
    self endon("disconnect");
    remoteuav endon("death");
    remoteuav endon("end_remote");
    remoteuav endon("end_launch_dialog");
    wait(3);
    remoteuav_dialog("launch");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d78
// Size: 0xb7
function remoteuav_endride(remoteuav) {
    if (isdefined(remoteuav)) {
        remoteuav.playerlinked = 0;
        remoteuav notify("end_remote");
        clearusingremote();
        if (getdvarint(@"hash_c00e244ea59d530e")) {
            setthirdpersondof(1);
        }
        self cameraunlink(remoteuav);
        self remotecontrolvehicleoff(remoteuav);
        self thermalvisionoff();
        self setplayerangles(self.restoreangles);
        var_5b919f578aece4ea = getlastweapon();
        if (!self hasweapon(var_5b919f578aece4ea)) {
            var_5b919f578aece4ea = getfirstprimaryweapon();
        }
        _switchtoweapon(var_5b919f578aece4ea);
        _takeweapon("uav_remote_mp");
        thread remoteuav_freezebuffer();
    }
    self.remoteuav = undefined;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e36
// Size: 0x34
function remoteuav_freezebuffer() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    _freezecontrols(1, undefined, "remoteuav");
    wait(0.5);
    _freezecontrols(0, undefined, "remoteuav");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e71
// Size: 0x7b
function remoteuav_playerexit(remoteuav) {
    level endon("game_ended");
    self endon("disconnect");
    remoteuav endon("death");
    remoteuav endon("end_remote");
    wait(2);
    updaterate = level.framedurationseconds;
    while (1) {
        timeused = 0;
        while (self usebuttonpressed()) {
            timeused = timeused + updaterate;
            if (timeused > 0.75) {
                remoteuav thread remoteuav_leave();
                return;
            }
            wait(updaterate);
        }
        waitframe();
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef3
// Size: 0x2d4
function remoteuav_track(remoteuav) {
    level endon("game_ended");
    self endon("disconnect");
    remoteuav endon("death");
    remoteuav endon("end_remote");
    remoteuav.lasttrackingdialogtime = 0;
    self.lockedtarget = undefined;
    self weaponlockfree();
    wait(1);
    while (1) {
        pos = remoteuav gettagorigin("tag_turret");
        forward = anglestoforward(self getplayerangles());
        endpos = pos + forward * 1024;
        trace = namespace_2a184fc4902783dc::_bullet_trace(pos, endpos, 1, remoteuav);
        if (isdefined(trace["position"])) {
            targetpos = trace["position"];
        } else {
            targetpos = endpos;
            trace["endpos"] = endpos;
        }
        remoteuav.trace = trace;
        var_17b181cf69c8aa3e = remoteuav_trackentities(remoteuav, level.players, targetpos);
        var_eff2c9504a645dc9 = remoteuav_trackentities(remoteuav, level.turrets, targetpos);
        var_8d22872e304ee881 = undefined;
        if (level.teambased) {
            entitylist = [];
            var_b0c33d224b825287 = getenemyteams(self.team);
            foreach (entry in level.teamnamelist) {
                foreach (model in level.uavmodels[entry]) {
                    entitylist[entitylist.size] = model;
                }
            }
            var_8d22872e304ee881 = remoteuav_trackentities(remoteuav, entitylist, targetpos);
        } else {
            var_8d22872e304ee881 = remoteuav_trackentities(remoteuav, level.uavmodels, targetpos);
        }
        lockedtarget = undefined;
        if (isdefined(var_17b181cf69c8aa3e)) {
            lockedtarget = var_17b181cf69c8aa3e;
        } else if (isdefined(var_eff2c9504a645dc9)) {
            lockedtarget = var_eff2c9504a645dc9;
        } else if (isdefined(var_8d22872e304ee881)) {
            lockedtarget = var_8d22872e304ee881;
        }
        if (isdefined(lockedtarget)) {
            if (!isdefined(self.lockedtarget) || isdefined(self.lockedtarget) && self.lockedtarget != lockedtarget) {
                self weaponlockfinalize(lockedtarget);
                self.lockedtarget = lockedtarget;
                if (isdefined(var_17b181cf69c8aa3e)) {
                    remoteuav notify("end_launch_dialog");
                    remoteuav_dialog("track");
                }
            }
        } else {
            self weaponlockfree();
            self.lockedtarget = undefined;
        }
        wait(0.05);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ce
// Size: 0x583
function remoteuav_trackentities(remoteuav, entities, targetpos) {
    level endon("game_ended");
    lockedtarget = undefined;
    foreach (entity in entities) {
        if (level.teambased && (!isdefined(entity.team) || entity.team == self.team)) {
            continue;
        }
        if (isplayer(entity)) {
            if (!isreallyalive(entity)) {
                continue;
            }
            if (entity == self) {
                continue;
            }
            id = entity.guid;
        } else {
            id = entity.birthtime;
        }
        if (isdefined(entity.sentrytype) || isdefined(entity.turrettype)) {
            offset = 32;
            var_ee22627fdcfe58bf = "hud_fofbox_hostile_vehicle";
        } else if (isdefined(entity.uavtype)) {
            offset = -52;
            var_ee22627fdcfe58bf = "hud_fofbox_hostile_vehicle";
        } else {
            offset = 26;
            var_ee22627fdcfe58bf = "veh_hud_target_unmarked";
        }
        if (isdefined(entity.uavremotemarkedby)) {
            if (!isdefined(remoteuav.markedplayers[id])) {
                remoteuav.markedplayers[id] = [];
                remoteuav.markedplayers[id]["player"] = entity;
                remoteuav.markedplayers[id]["icon"] = entity thread namespace_7bdde15c3500a23f::setheadicon_singleimage(self, "veh_hud_target_marked", offset);
                remoteuav.markedplayers[id]["icon"].shader = "veh_hud_target_marked";
                if (!isdefined(entity.sentrytype) || !isdefined(entity.turrettype)) {
                    remoteuav.markedplayers[id]["icon"] settargetent(entity);
                }
            } else if (isdefined(remoteuav.markedplayers[id]) && isdefined(remoteuav.markedplayers[id]["icon"]) && isdefined(remoteuav.markedplayers[id]["icon"].shader) && remoteuav.markedplayers[id]["icon"].shader != "veh_hud_target_marked") {
                remoteuav.markedplayers[id]["icon"].shader = "veh_hud_target_marked";
                remoteuav.markedplayers[id]["icon"] setshader("veh_hud_target_marked", 10, 10);
                remoteuav.markedplayers[id]["icon"] setwaypoint(0, 0, 0, 0);
            }
        } else {
            if (isplayer(entity)) {
                var_1f6fa3102bc4a682 = isdefined(entity.spawntime) && (gettime() - entity.spawntime) / 1000 <= 5;
                var_63c3dab9425623f3 = entity _hasperk("specialty_blindeye");
                carried = 0;
                leaving = 0;
            } else {
                var_1f6fa3102bc4a682 = 0;
                var_63c3dab9425623f3 = 0;
                carried = isdefined(entity.carriedby);
                leaving = isdefined(entity.isleaving) && entity.isleaving == 1;
            }
            if (!isdefined(remoteuav.markedplayers[id]) && !var_1f6fa3102bc4a682 && !var_63c3dab9425623f3 && !carried && !leaving) {
                remoteuav.markedplayers[id] = [];
                remoteuav.markedplayers[id]["player"] = entity;
                remoteuav.markedplayers[id]["icon"] = entity namespace_7bdde15c3500a23f::setheadicon_singleimage(self, var_ee22627fdcfe58bf, offset);
                remoteuav.markedplayers[id]["icon"].shader = var_ee22627fdcfe58bf;
                if (!isdefined(entity.sentrytype) || !isdefined(entity.turrettype)) {
                    remoteuav.markedplayers[id]["icon"] settargetent(entity);
                }
            }
            if ((!isdefined(lockedtarget) || lockedtarget != entity) && isdefined(remoteuav.trace["entity"]) && remoteuav.trace["entity"] == entity && !carried && !leaving || distance(entity.origin, targetpos) < 200 * remoteuav.trace["fraction"] && !var_1f6fa3102bc4a682 && !carried && !leaving || !leaving && remoteuav_cantargetuav(remoteuav, entity)) {
                trace = namespace_2a184fc4902783dc::_bullet_trace(remoteuav.origin, entity.origin + (0, 0, 32), 1, remoteuav);
                if (isdefined(trace["entity"]) && trace["entity"] == entity || trace["fraction"] == 1) {
                    self playlocalsound("recondrone_lockon");
                    lockedtarget = entity;
                }
            }
        }
    }
    return lockedtarget;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2759
// Size: 0x80
function remoteuav_cantargetuav(remoteuav, uav) {
    if (isdefined(uav.uavtype)) {
        forward = anglestoforward(self getplayerangles());
        var_a9da5f2c559f3484 = vectornormalize(uav.origin - remoteuav gettagorigin("tag_turret"));
        dot = vectordot(forward, var_a9da5f2c559f3484);
        if (dot > 0.985) {
            return 1;
        }
    }
    return 0;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e1
// Size: 0xa8
function remoteuav_fire(remoteuav) {
    self endon("disconnect");
    remoteuav endon("death");
    level endon("game_ended");
    remoteuav endon("end_remote");
    wait(1);
    self notifyonplayercommand("remoteUAV_tag", "+attack");
    self notifyonplayercommand("remoteUAV_tag", "+attack_akimbo_accessible");
    while (1) {
        self waittill("remoteUAV_tag");
        if (isdefined(self.lockedtarget)) {
            self playlocalsound("recondrone_tag");
            updatedamagefeedback("");
            thread remoteuav_markplayer(self.lockedtarget);
            thread remoteuav_rumble(remoteuav, 3);
            wait(0.25);
        } else {
            waitframe();
        }
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2890
// Size: 0x69
function remoteuav_rumble(remoteuav, amount) {
    self endon("disconnect");
    remoteuav endon("death");
    level endon("game_ended");
    remoteuav endon("end_remote");
    remoteuav notify("end_rumble");
    remoteuav endon("end_rumble");
    for (i = 0; i < amount; i++) {
        self playrumbleonentity("damage_heavy");
        wait(0.05);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2900
// Size: 0x29f
function remoteuav_markplayer(targetplayer) {
    level endon("game_ended");
    targetplayer.uavremotemarkedby = self;
    if (isplayer(targetplayer) && !targetplayer isusingremote()) {
        goto LOC_000000af;
    }
    if (isdefined(targetplayer.uavtype)) {
        targetplayer.birth_time = targetplayer.birthtime;
    } else if (isdefined(targetplayer.owner) && isalive(targetplayer.owner)) {
        targetplayer.owner thread namespace_62c556437da28f50::scoreeventpopup(#"hash_508e80998122a1a4");
    LOC_000000af:
    }
LOC_000000af:
    remoteuav_dialog("tag");
    if (getgametype() != "dm") {
        if (isplayer(targetplayer)) {
            thread doScoreEvent(#"kill");
        }
    }
    if (isplayer(targetplayer)) {
        targetplayer setperk("specialty_radarblip", 1);
    } else {
        if (isdefined(targetplayer.uavtype)) {
            shadername = "compassping_enemy_uav";
        } else {
            shadername = "compassping_sentry_enemy";
        }
        if (level.teambased) {
            curobjid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
            if (curobjid != -1) {
                namespace_5a22b6f3a56f7e9b::objective_add_objective(curobjid, "invisible", (0, 0, 0));
                namespace_5a22b6f3a56f7e9b::update_objective_onentity(curobjid, targetplayer);
                namespace_5a22b6f3a56f7e9b::update_objective_state(curobjid, "active");
                namespace_5a22b6f3a56f7e9b::objective_teammask_single(curobjid, self.team);
                namespace_5a22b6f3a56f7e9b::update_objective_icon(curobjid, shadername);
                namespace_5a22b6f3a56f7e9b::update_objective_setbackground(curobjid, 1);
            }
            targetplayer.remoteuavmarkedobjid01 = curobjid;
        } else {
            curobjid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
            if (curobjid != -1) {
                namespace_5a22b6f3a56f7e9b::objective_add_objective(curobjid, "invisible", (0, 0, 0));
                namespace_5a22b6f3a56f7e9b::update_objective_onentity(curobjid, targetplayer);
                namespace_5a22b6f3a56f7e9b::update_objective_state(curobjid, "active");
                namespace_5a22b6f3a56f7e9b::objective_teammask_single(curobjid, getotherteam(self.team)[0]);
                namespace_5a22b6f3a56f7e9b::update_objective_icon(curobjid, shadername);
                namespace_5a22b6f3a56f7e9b::update_objective_setbackground(curobjid, 1);
            }
            targetplayer.remoteuavmarkedobjid02 = curobjid;
            curobjid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
            if (curobjid != -1) {
                namespace_5a22b6f3a56f7e9b::objective_add_objective(curobjid, "invisible", (0, 0, 0));
                namespace_5a22b6f3a56f7e9b::update_objective_onentity(curobjid, targetplayer);
                namespace_5a22b6f3a56f7e9b::update_objective_state(curobjid, "active");
                namespace_5a22b6f3a56f7e9b::objective_teammask_single(curobjid, self.team);
                namespace_5a22b6f3a56f7e9b::update_objective_icon(curobjid, shadername);
                namespace_5a22b6f3a56f7e9b::update_objective_setbackground(curobjid, 1);
            }
            targetplayer.remoteuavmarkedobjid03 = curobjid;
        }
    }
    targetplayer thread remoteuav_unmarkremovedplayer(self.remoteuav);
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba6
// Size: 0x54
function remoteuav_processtaggedassist(victim) {
    remoteuav_dialog("assist");
    if (getgametype() != "dm") {
        self.taggedassist = 1;
        if (isdefined(victim)) {
            thread namespace_e8a49b70d0769b66::processassist(victim);
        } else {
            thread doScoreEvent(#"assist");
        }
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c01
// Size: 0x1aa
function remoteuav_unmarkremovedplayer(remoteuav) {
    level endon("game_ended");
    msg = waittill_any_return_3("death_or_disconnect", "carried", "leaving");
    if (msg == "leaving" || !isdefined(self.uavtype)) {
        self.uavremotemarkedby = undefined;
    }
    if (isdefined(remoteuav)) {
        if (isplayer(self)) {
            id = self.guid;
        } else if (isdefined(self.birthtime)) {
            id = self.birthtime;
        } else {
            id = self.birth_time;
        }
        if (msg == "carried" || msg == "leaving") {
            if (isdefined(remoteuav.markedplayers[id]["icon"])) {
                remoteuav.markedplayers[id]["icon"] destroy();
                remoteuav.markedplayers[id]["icon"] = undefined;
            }
        }
        if (isdefined(id) && isdefined(remoteuav.markedplayers[id])) {
            remoteuav.markedplayers[id] = undefined;
            remoteuav.markedplayers = array_removeundefined(remoteuav.markedplayers);
        }
    }
    if (isplayer(self)) {
        self unsetperk("specialty_radarblip", 1);
    } else {
        if (isdefined(self.remoteuavmarkedobjid01)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.remoteuavmarkedobjid01);
        }
        if (isdefined(self.remoteuavmarkedobjid02)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.remoteuavmarkedobjid02);
        }
        if (isdefined(self.remoteuavmarkedobjid03)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.remoteuavmarkedobjid03);
        }
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2db2
// Size: 0x7a
function remoteuav_clearmarkedforowner() {
    foreach (var_82dc593ef677c4f0 in self.markedplayers) {
        if (isdefined(var_82dc593ef677c4f0["icon"])) {
            var_82dc593ef677c4f0["icon"] destroy();
            var_82dc593ef677c4f0["icon"] = undefined;
        }
    }
    self.markedplayers = undefined;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e33
// Size: 0x42
function remoteuav_operationrumble(remoteuav) {
    self endon("disconnect");
    remoteuav endon("death");
    level endon("game_ended");
    remoteuav endon("end_remote");
    while (1) {
        self playrumbleonentity("damage_light");
        wait(0.5);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e7c
// Size: 0x1a7
function remoteuav_watch_distance() {
    self endon("death");
    self.rangetrigger = getent("remote_uav_range", "targetname");
    if (!isdefined(self.rangetrigger)) {
        var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
        self.maxheight = var_5fa1e1697a302583.origin[2];
        self.maxdistance = 12800;
    }
    self.centerref = spawn("script_model", level.mapcenter);
    inrangepos = self.origin;
    self.rangecountdownactive = 0;
    while (1) {
        if (!remoteuav_in_range()) {
            staticalpha = 0;
            while (!remoteuav_in_range()) {
                self.owner remoteuav_dialog("out_of_range");
                if (!self.rangecountdownactive) {
                    self.rangecountdownactive = 1;
                    thread remoteuav_rangecountdown();
                }
                if (isdefined(self.heliinproximity)) {
                    dist = distance(self.origin, self.heliinproximity.origin);
                    staticalpha = 1 - (dist - 150) / 150;
                } else {
                    dist = distance(self.origin, inrangepos);
                    staticalpha = min(1, dist / 200);
                }
                self.owner setplayerdata("reconDroneState", "staticAlpha", staticalpha);
                wait(0.05);
            }
            self notify("in_range");
            self.rangecountdownactive = 0;
            thread remoteuav_staticfade(staticalpha);
        }
        inrangepos = self.origin;
        waitframe();
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302a
// Size: 0x85
function remoteuav_in_range() {
    if (isdefined(self.rangetrigger)) {
        if (!self istouching(self.rangetrigger) && !self.inheliproximity) {
            return 1;
        }
    } else if (distance2d(self.origin, level.mapcenter) < self.maxdistance && self.origin[2] < self.maxheight && !self.inheliproximity) {
        return 1;
    }
    return 0;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b7
// Size: 0x6b
function remoteuav_staticfade(staticalpha) {
    self endon("death");
    while (remoteuav_in_range()) {
        staticalpha = staticalpha - 0.05;
        if (staticalpha < 0) {
            self.owner setplayerdata("reconDroneState", "staticAlpha", 0);
            break;
        }
        self.owner setplayerdata("reconDroneState", "staticAlpha", staticalpha);
        wait(0.05);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3129
// Size: 0x42
function remoteuav_rangecountdown() {
    self endon("death");
    self endon("in_range");
    if (isdefined(self.heliinproximity)) {
        countdown = 3;
    } else {
        countdown = 6;
    }
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(countdown);
    self notify("death");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3172
// Size: 0x22
function remoteuav_explode_on_disconnect() {
    self endon("death");
    self.owner waittill("disconnect");
    self notify("death");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x319b
// Size: 0x2c
function remoteuav_explode_on_changeteams() {
    self endon("death");
    self.owner waittill_any_2("joined_team", "joined_spectators");
    self notify("death");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ce
// Size: 0x19
function remoteuav_clear_marked_on_gameended() {
    self endon("death");
    level waittill("game_ended");
    remoteuav_clearmarkedforowner();
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ee
// Size: 0x3e
function remoteuav_leave_on_timeout() {
    self endon("death");
    flytime = 60;
    /#
        flytime = getdvarint(@"hash_da7c6c2551fb9f41", flytime);
    #/
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(flytime);
    thread remoteuav_leave();
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3233
// Size: 0x32
function remoteuav_leave() {
    level endon("game_ended");
    self endon("death");
    self notify("leaving");
    self.owner remoteuav_endride(self);
    self notify("death");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326c
// Size: 0x43
function remoteuav_explode_on_death() {
    level endon("game_ended");
    self waittill("death");
    self playsound("recondrone_destroyed");
    playfx(level.remoteuav_fx["explode"], self.origin);
    remoteuav_cleanup();
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b6
// Size: 0xac
function remoteuav_cleanup() {
    if (self.playerlinked == 1 && isdefined(self.owner)) {
        self.owner remoteuav_endride(self);
    }
    if (isdefined(self.scrambler)) {
        self.scrambler delete();
    }
    if (isdefined(self.centerref)) {
        self.centerref delete();
    }
    remoteuav_clearmarkedforowner();
    stopfxontag(level.remoteuav_fx["smoke"], self, "tag_origin");
    level.remote_uav[self.team] = undefined;
    decrementfauxvehiclecount();
    self delete();
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3369
// Size: 0x4b
function remoteuav_light_fx() {
    playfxontag(level.chopper_fx["light"]["belly"], self, "tag_light_nose");
    wait(0.05);
    playfxontag(level.chopper_fx["light"]["tail"], self, "tag_light_tail1");
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33bb
// Size: 0xad
function remoteuav_dialog(dialoggroup) {
    if (dialoggroup == "tag") {
        waittime = 1000;
    } else {
        waittime = 5000;
    }
    if (gettime() - level.remoteuav_lastdialogtime < waittime) {
        return;
    }
    level.remoteuav_lastdialogtime = gettime();
    randomindex = randomint(level.remoteuav_dialog[dialoggroup].size);
    soundalias = level.remoteuav_dialog[dialoggroup][randomindex];
    var_aeeca9f734ea50c1 = getteamvoiceinfix(self.team) + "tl" + soundalias;
    self playlocalsound(var_aeeca9f734ea50c1);
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346f
// Size: 0xc6
function remoteuav_handleincomingstinger() {
    level endon("game_ended");
    self endon("death");
    self endon("end_remote");
    while (1) {
        var_d1636a91c31cf68f = missile = player = level waittill("stinger_fired");
        if (!isdefined(missile) || !isdefined(var_d1636a91c31cf68f) || var_d1636a91c31cf68f != self) {
            continue;
        }
        self.owner playlocalsound("javelin_clu_lock");
        self.owner setplayerdata("reconDroneState", "incomingMissile", 1);
        self.hasincoming = 1;
        self.incomingmissiles[self.incomingmissiles.size] = missile;
        missile.owner = player;
        missile thread watchstingerproximity(var_d1636a91c31cf68f);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x353c
// Size: 0x11f
function remoteuav_handleincomingsam() {
    level endon("game_ended");
    self endon("death");
    self endon("end_remote");
    while (1) {
        var_d1636a91c31cf68f = var_a512aa80ea6bf396 = player = level waittill("sam_fired");
        if (!isdefined(var_d1636a91c31cf68f) || var_d1636a91c31cf68f != self) {
            continue;
        }
        var_5106e97c176bc70c = 0;
        foreach (missile in var_a512aa80ea6bf396) {
            if (isdefined(missile)) {
                self.incomingmissiles[self.incomingmissiles.size] = missile;
                missile.owner = player;
                var_5106e97c176bc70c++;
            }
        }
        if (var_5106e97c176bc70c) {
            self.owner playlocalsound("javelin_clu_lock");
            self.owner setplayerdata("reconDroneState", "incomingMissile", 1);
            self.hasincoming = 1;
            level thread watchsamproximity(var_d1636a91c31cf68f, var_a512aa80ea6bf396);
        }
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3662
// Size: 0x18d
function watchstingerproximity(missiletarget) {
    level endon("game_ended");
    self endon("death");
    self missile_settargetent(missiletarget);
    lastvectotarget = vectornormalize(missiletarget.origin - self.origin);
    while (isdefined(missiletarget)) {
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (missiletarget.numflares > 0 && curdist < 4000) {
            newtarget = missiletarget deployflares();
            self missile_settargetent(newtarget);
            return;
        } else {
            var_e778a95bd6b64fb1 = vectornormalize(missiletarget.origin - self.origin);
            if (vectordot(var_e778a95bd6b64fb1, lastvectotarget) < 0) {
                self playsound("exp_stinger_armor_destroy");
                playfx(level.remoteuav_fx["missile_explode"], self.origin);
                if (isdefined(self.owner)) {
                    radiusdamage(self.origin, 400, 1000, 1000, self.owner, "MOD_EXPLOSIVE", "stinger_mp");
                } else {
                    radiusdamage(self.origin, 400, 1000, 1000, undefined, "MOD_EXPLOSIVE", "stinger_mp");
                }
                self hide();
                wait(0.05);
                self delete();
            } else {
                lastvectotarget = var_e778a95bd6b64fb1;
            }
        }
        wait(0.05);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37f6
// Size: 0x2c5
function watchsamproximity(missiletarget, var_a512aa80ea6bf396) {
    level endon("game_ended");
    missiletarget endon("death");
    foreach (missile in var_a512aa80ea6bf396) {
        if (isdefined(missile)) {
            missile missile_settargetent(missiletarget);
            missile.lastvectotarget = vectornormalize(missiletarget.origin - missile.origin);
        }
    }
    while (var_a512aa80ea6bf396.size && isdefined(missiletarget)) {
        center = missiletarget getpointinbounds(0, 0, 0);
        foreach (missile in var_a512aa80ea6bf396) {
            if (isdefined(missile)) {
                if (isdefined(self.markfordetete)) {
                    self delete();
                } else if (missiletarget.numflares > 0) {
                    disttotarget = distance(missile.origin, center);
                    if (disttotarget < 4000) {
                        newtarget = missiletarget deployflares();
                        foreach (var_7ea79feb6d88b3e in var_a512aa80ea6bf396) {
                            if (isdefined(var_7ea79feb6d88b3e)) {
                                var_7ea79feb6d88b3e missile_settargetent(newtarget);
                            }
                        }
                        return;
                    }
                } else {
                    var_e778a95bd6b64fb1 = vectornormalize(missiletarget.origin - missile.origin);
                    if (vectordot(var_e778a95bd6b64fb1, missile.lastvectotarget) < 0) {
                        missile playsound("exp_stinger_armor_destroy");
                        playfx(level.remoteuav_fx["missile_explode"], missile.origin);
                        if (isdefined(missile.owner)) {
                            radiusdamage(missile.origin, 400, 1000, 1000, missile.owner, "MOD_EXPLOSIVE", "stinger_mp");
                        } else {
                            radiusdamage(missile.origin, 400, 1000, 1000, undefined, "MOD_EXPLOSIVE", "stinger_mp");
                        }
                        missile hide();
                        missile.markfordetete = 1;
                    } else {
                        missile.lastvectotarget = var_e778a95bd6b64fb1;
                    }
                }
            }
        }
        var_a512aa80ea6bf396 = array_removeundefined(var_a512aa80ea6bf396);
        wait(0.05);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac2
// Size: 0xaa
function deployflares() {
    self.numflares--;
    self.owner thread remoteuav_rumble(self, 6);
    self playsound("WEAP_SHOTGUNATTACH_FIRE_NPC");
    thread playflarefx();
    spawnpos = self.origin + (0, 0, -100);
    flareobject = spawn("script_origin", spawnpos);
    flareobject.angles = self.angles;
    flareobject movegravity((0, 0, -1), 5);
    flareobject thread deleteaftertime(5);
    return flareobject;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b74
// Size: 0x43
function playflarefx() {
    for (i = 0; i < 5; i++) {
        if (!isdefined(self)) {
            return;
        }
        playfxontag(level._effect["vehicle_flares"], self, "TAG_FLARE");
        wait(0.15);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bbe
// Size: 0x15
function deleteaftertime(delay) {
    wait(delay);
    self delete();
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bda
// Size: 0xc8
function remoteuav_clearincomingwarning() {
    level endon("game_ended");
    self endon("death");
    self endon("end_remote");
    while (1) {
        var_edbf8ae8db33ad77 = 0;
        for (i = 0; i < self.incomingmissiles.size; i++) {
            if (isdefined(self.incomingmissiles[i]) && missile_isincoming(self.incomingmissiles[i], self)) {
                var_edbf8ae8db33ad77++;
            }
        }
        if (self.hasincoming && !var_edbf8ae8db33ad77) {
            self.hasincoming = 0;
            self.owner setplayerdata("reconDroneState", "incomingMissile", 0);
        }
        self.incomingmissiles = array_removeundefined(self.incomingmissiles);
        wait(0.05);
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca9
// Size: 0x5f
function missile_isincoming(missile, remoteuav) {
    var_e28bc57d4b27e3fe = vectornormalize(remoteuav.origin - missile.origin);
    var_d2fad66c97b5f8ba = anglestoforward(missile.angles);
    return vectordot(var_e28bc57d4b27e3fe, var_d2fad66c97b5f8ba) > 0;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d10
// Size: 0x197
function remoteuav_watchheliproximity() {
    level endon("game_ended");
    self endon("death");
    self endon("end_remote");
    while (1) {
        inheliproximity = 0;
        foreach (heli in level.helis) {
            if (distance(heli.origin, self.origin) < 300) {
                inheliproximity = 1;
                self.heliinproximity = heli;
            }
        }
        foreach (littlebird in level.littlebirds) {
            if (littlebird != self && (!isdefined(littlebird.helitype) || littlebird.helitype != "remote_uav") && distance(littlebird.origin, self.origin) < 300) {
                inheliproximity = 1;
                self.heliinproximity = littlebird;
            }
        }
        if (!self.inheliproximity && inheliproximity) {
            self.inheliproximity = 1;
        } else if (self.inheliproximity && !inheliproximity) {
            self.inheliproximity = 0;
            self.heliinproximity = undefined;
        }
        waitframe();
    }
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eae
// Size: 0x2b
function remoteuav_handledamage() {
    self endon("end_remote");
    namespace_3e725f3cc58bddd3::monitordamage(self.maxhealth, "remote_uav", &handledeathdamage, &modifydamage, 1);
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee0
// Size: 0x127
function modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    modifieddamage = namespace_3e725f3cc58bddd3::handleempdamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handlemissiledamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, type, modifieddamage, attacker);
    playfxontagforclients(level.remoteuav_fx["hit"], self, "tag_origin", self.owner);
    self playsound("recondrone_damaged");
    if (self.smoking == 0 && self.damagetaken >= self.maxhealth / 2) {
        self.smoking = 1;
        playfxontag(level.remoteuav_fx["smoke"], self, "tag_origin");
    }
    return modifieddamage;
}

// Namespace remoteuav/namespace_6a0a424c378cb31c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400f
// Size: 0x7f
function handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    namespace_3e725f3cc58bddd3::onkillstreakkilled("remote_uav", attacker, objweapon, type, damage, "destroyed_remote_uav", undefined, "callout_destroyed_remote_uav");
}

